---------------------------------------------------------------------------------
-- Games consoles with Signetics 2650 CPU and 2637 VIDEO

-- Emerson Arcadia 2001 & clones

---------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

USE std.textio.ALL;

LIBRARY work;
USE work.base_pack.ALL;

ENTITY arcadia_core IS
  PORT (
    -- Master input clock
    clk              : IN    std_logic;
    
    -- Async reset from top-level module. Can be used as initial reset.
    reset            : IN    std_logic;

    -- Must be passed to hps_io module
    ntsc_pal         : IN    std_logic;
    swap             : IN    std_logic;
    swapxy           : IN    std_logic;
    
    -- Base video clock. Usually equals to CLK_SYS.
    clk_video        : OUT   std_logic;

    -- Multiple resolutions are supported using different CE_PIXEL rates.
    -- Must be based on CLK_VIDEO
    ce_pixel         : OUT   std_logic;

    -- VGA
    vga_r            : OUT   std_logic_vector(7 DOWNTO 0);
    vga_g            : OUT   std_logic_vector(7 DOWNTO 0);
    vga_b            : OUT   std_logic_vector(7 DOWNTO 0);
    vga_hs           : OUT   std_logic; -- positive pulse!
    vga_vs           : OUT   std_logic; -- positive pulse!
    vga_de           : OUT   std_logic; -- = not (VBlank or HBlank)

    -- AUDIO
    sound            : OUT   std_logic_vector(7 DOWNTO 0);
    
    ps2_key           : IN  std_logic_vector(10 DOWNTO 0);    
    joystick_0        : IN  std_logic_vector(31 DOWNTO 0);
    joystick_1        : IN  std_logic_vector(31 DOWNTO 0);
    joystick_analog_0 : IN  std_logic_vector(15 DOWNTO 0);
    joystick_analog_1 : IN  std_logic_vector(15 DOWNTO 0);
    
    ioctl_download    : IN  std_logic;
    ioctl_index       : IN  std_logic_vector(7 DOWNTO 0);
    ioctl_wr          : IN  std_logic;
    ioctl_addr        : IN  std_logic_vector(24 DOWNTO 0);
    ioctl_dout        : IN  std_logic_vector(7 DOWNTO 0);
    ioctl_wait        : OUT std_logic
    );
END arcadia_core;

ARCHITECTURE struct OF arcadia_core IS

  CONSTANT CDIV : natural := 4 * 8;
  
  --------------------------------------
  SIGNAL keypad1_1, keypad1_2, keypad1_3 : unsigned(7 DOWNTO 0);
  SIGNAL keypad2_1, keypad2_2, keypad2_3 : unsigned(7 DOWNTO 0);
  SIGNAL keypanel,  volnoise : unsigned(7 DOWNTO 0);
  
  --------------------------------------
  SIGNAL vol : unsigned(1 DOWNTO 0);
  SIGNAL icol,explo,explo2,noise,snd : std_logic;
  SIGNAL sound1 : unsigned(7 DOWNTO 0);
  SIGNAL lfsr : uv15;
  SIGNAL nexplo : natural RANGE 0 TO 1000000;
  SIGNAL divlfsr : uint8;
  
  SIGNAL pot1,pot2 : unsigned(7 DOWNTO 0);
  SIGNAL potl_a,potl_b,potr_a,potr_b : unsigned(7 DOWNTO 0);
  SIGNAL potl_v,potl_h,potr_v,potr_h : unsigned(7 DOWNTO 0);
  SIGNAL pot0_a,pot0_b,pot1_a,pot1_b : unsigned(7 DOWNTO 0);
  SIGNAL dpad0,dpad1 : std_logic;
  SIGNAL tick_cpu_cpt : natural RANGE 0 TO CDIV-1;
  SIGNAL tick_cpu : std_logic;
  
  SIGNAL ad,ad_delay,ad_rom : unsigned(14 DOWNTO 0);
  SIGNAL dr,dw,dr_uvi,dr_rom,dr_key : unsigned(7 DOWNTO 0);
  SIGNAL req,req_uvi,req_mem : std_logic;
  SIGNAL ack,ackp,ack_uvi,ack_mem : std_logic;
  SIGNAL sel_uvi,sel_mem : std_logic;
  SIGNAL ack_mem_p,ack_mem_p2 : std_logic :='0';
  SIGNAL int,intack,creset : std_logic;
  SIGNAL sense,flag : std_logic;
  SIGNAL mio,ene,dc,wr : std_logic;
  SIGNAL ph : unsigned(1 DOWNTO 0);
  SIGNAL ivec : unsigned(7 DOWNTO 0);
  
  SIGNAL reset_na : std_logic;
  SIGNAL w_d : unsigned(7 DOWNTO 0);
  SIGNAL w_a : unsigned(12 DOWNTO 0);
  SIGNAL w_wr : std_logic;
  TYPE arr_cart IS ARRAY(natural RANGE <>) OF unsigned(7 DOWNTO 0);
  --SIGNAL cart : arr_cart(0 TO 4095);
  --ATTRIBUTE ramstyle : string;
  --ATTRIBUTE ramstyle OF cart : SIGNAL IS "no_rw_check";
  
  SHARED VARIABLE cart : arr_cart(0 TO 16383) :=(OTHERS =>x"00");
  ATTRIBUTE ramstyle : string;
  ATTRIBUTE ramstyle OF cart : VARIABLE IS "no_rw_check";
  
  SIGNAL wcart : std_logic;
  
  SIGNAL vga_argb : unsigned(3 DOWNTO 0);
  SIGNAL vga_dei  : std_logic;
  SIGNAL vga_hsyn : std_logic;
  SIGNAL vga_vsyn : std_logic;
  SIGNAL vga_ce   : std_logic;
  
  SIGNAL vrst : std_logic;
  
  SIGNAL vga_r_i,vga_g_i,vga_b_i : uv8;
  
  FILE fil : text OPEN write_mode IS "trace_mem.log";
  
BEGIN
  
  ----------------------------------------------------------
  -- Emerson Arcadia & clones
  --  x00 aaaa aaaa aaaa : Cardtrige 4kb
  --  x01 1000 aaaa aaaa : Video UVI RAM  : 1800
  --  x01 1001 0xxx aaaa : Key inputs     : 1900
  --  x01 1001 1xxx xxxx : Video UVI regs : 1980
  --  x01 1010 aaaa aaaa : Video UVI RAM  : 1A00
  --  x10 aaaa aaaa aaaa : Cardridge high : 2000
  
  i_sgs2637: ENTITY work.sgs2637
    PORT MAP (
      ad        => ad,
      dw        => dw,
      dr        => dr_uvi,
      req       => req_uvi,
      ack       => ack_uvi,
      wr        => wr,
      tick      => tick_cpu,
      vid_argb  => vga_argb,
      vid_de    => vga_de,
      vid_hsyn  => vga_hsyn,
      vid_vsyn  => vga_vsyn,
      vid_ce    => vga_ce,
      vrst      => vrst,
      sound     => sound1,
      pot1      => potr_v,
      pot2      => potl_v,
      pot3      => potr_h,
      pot4      => potl_h,
      np        => ntsc_pal,
      reset     => reset,
      clk       => clk,
      reset_na  => reset_na);
  
  --   1 2 3
  --   4 5 6
  --   7 8 9
  -- ENT 0 CLR
  -- start,a,b,enter,clr,0,1,2,3,4,5,6,7,8,9
    
  keypad1_1<="0000" & joystick_0(10) & joystick_0(13) & joystick_0(16) & joystick_0(8) ; -- 1900 : 1 4 7 CLEAR
  keypad1_2<="0000" & joystick_0(11) & joystick_0(14) & joystick_0(17) & joystick_0(9) ; -- 1901 : 2 5 8 0
  keypad1_3<="0000" & joystick_0(12) & joystick_0(15) & joystick_0(18) & joystick_0(7) ; -- 1902 : 3 6 9 ENTER
  
  keypad2_1<="0000" & joystick_1(10) & joystick_1(13) & joystick_1(16) & joystick_1(8) ; -- 1904 : 1 4 7 CLEAR
  keypad2_2<="0000" & joystick_1(11) & joystick_1(14) & joystick_1(17) & joystick_1(9) ; -- 1905 : 2 5 8 0
  keypad2_3<="0000" & joystick_1(12) & joystick_1(15) & joystick_1(18) & joystick_1(7) ; -- 1906 : 3 6 9 ENTER
  
  keypanel <="00000" & (joystick_0(6) & joystick_0(5) & joystick_0(4)) OR
                       (joystick_1(6) & joystick_1(5) & joystick_1(4)); -- 1908 : B A START
  
  dr_key<=keypad1_1 WHEN ad_delay(3 DOWNTO 0)=x"0" ELSE -- 1900
          keypad1_2 WHEN ad_delay(3 DOWNTO 0)=x"1" ELSE -- 1901
          keypad1_3 WHEN ad_delay(3 DOWNTO 0)=x"2" ELSE -- 1902
          keypad2_1 WHEN ad_delay(3 DOWNTO 0)=x"4" ELSE -- 1904
          keypad2_2 WHEN ad_delay(3 DOWNTO 0)=x"5" ELSE -- 1905
          keypad2_3 WHEN ad_delay(3 DOWNTO 0)=x"6" ELSE -- 1906
          keypanel  WHEN ad_delay(3 DOWNTO 0)=x"8" ELSE -- 1908
          x"00";
  
  
  -- flag : Joystick : 0=Horizontal 1=Vertical
  pot2<=potr_v WHEN flag='1' ELSE potr_h;
  pot1<=potl_v WHEN flag='1' ELSE potl_h;

  sound <= std_logic_vector(sound1);
  
  ----------------------------------------------------------
  sense <=vrst;
  
  Joysticks:PROCESS (clk) IS
  BEGIN
    IF rising_edge(clk) THEN
      -------------------------------------------------------------------------------
      IF dpad0='0' THEN
        pot0_a<=unsigned(joystick_analog_0(15 DOWNTO 8))+x"80";
        pot0_b<=unsigned(joystick_analog_0( 7 DOWNTO 0))+x"80";
      ELSE
        pot0_a<=x"80";
        pot0_b<=x"80";
        IF joystick_0(0)='1' THEN pot0_b<=x"FF"; END IF;
        IF joystick_0(1)='1' THEN pot0_b<=x"00"; END IF;
        IF joystick_0(2)='1' THEN pot0_a<=x"FF"; END IF;
        IF joystick_0(3)='1' THEN pot0_a<=x"00"; END IF;
      END IF;
      
      IF joystick_0(3 DOWNTO 0)/="0000" THEN
        dpad0<='1';
      END IF;
      IF joystick_analog_0(7 DOWNTO 5)="100" OR joystick_analog_0(7 DOWNTO 5)="011" OR
         joystick_analog_0(15 DOWNTO 13)="100" OR joystick_analog_0(15 DOWNTO 13)="011" THEN
        dpad0<='0';
      END IF;
      
      -------------------------------------------------------------------------------
      IF dpad1='0' THEN
        pot1_a<=unsigned(joystick_analog_1(15 DOWNTO 8))+x"80";
        pot1_b<=unsigned(joystick_analog_1( 7 DOWNTO 0))+x"80";
      ELSE
        pot1_a<=x"80";
        pot1_b<=x"80";
        IF joystick_1(0)='1' THEN pot1_b<=x"FF"; END IF;
        IF joystick_1(1)='1' THEN pot1_b<=x"00"; END IF;
        IF joystick_1(2)='1' THEN pot1_a<=x"FF"; END IF;
        IF joystick_1(3)='1' THEN pot1_a<=x"00"; END IF;
      END IF;
      
      IF joystick_1(3 DOWNTO 0)/="0000" THEN
        dpad1<='1';
      END IF;
      IF joystick_analog_1(7 DOWNTO 5)="100" OR joystick_analog_1(7 DOWNTO 5)="011" OR
         joystick_analog_1(15 DOWNTO 13)="100" OR joystick_analog_1(15 DOWNTO 13)="011" THEN
        dpad1<='0';
      END IF;

      -------------------------------------------------------------------------------
      potl_a<=mux(swap,pot1_a,pot0_a);
      potl_b<=mux(swap,pot1_b,pot0_b);
      potr_a<=mux(swap,pot0_a,pot1_a);
      potr_b<=mux(swap,pot0_b,pot1_b);
      
      -------------------------------------------------------------------------------
      IF reset_na='0' THEN
        dpad0<='0';
        dpad1<='0';
      END IF;
      
    END IF;
  END PROCESS Joysticks;
  
  potl_h<=mux(swapxy,potl_a,potl_b);
  potl_v<=mux(swapxy,potl_b,potl_a);
  potr_h<=mux(swapxy,potr_a,potr_b);
  potr_v<=mux(swapxy,potr_b,potr_a);
  
  ----------------------------------------------------------
  dr<=dr_uvi WHEN ad_delay(12)='1' AND ad_delay(11 DOWNTO 8)="1000"  ELSE -- UVI Arcadia
      dr_uvi WHEN ad_delay(12)='1' AND ad_delay(11 DOWNTO 7)="10011" ELSE -- UVI Arcadia
      dr_key WHEN ad_delay(12)='1' AND ad_delay(11 DOWNTO 7)="10010" ELSE -- Keyboard
      dr_uvi WHEN ad_delay(12)='1' AND ad_delay(11 DOWNTO 8)="1010"  ELSE -- UVI Arcadia
      dr_rom  -- Cardridge
      ;
  
  sel_uvi<=to_std_logic(
            (ad(12)='1' AND ad(11 DOWNTO 8)="1000") OR
            (ad(12)='1' AND ad(11 DOWNTO 8)="1010") OR
            (ad(12)='1' AND ad(11 DOWNTO 7)="10011"));
  
  sel_mem<=NOT sel_uvi;
  
  req_uvi<=sel_uvi AND req;
  req_mem<=sel_mem AND req;
  
  ackp<=tick_cpu AND ack_uvi WHEN sel_uvi='1' ELSE
        tick_cpu AND ack_mem;
  
  PROCESS (clk) IS
  BEGIN
    IF rising_edge(clk) THEN
      IF tick_cpu='1' THEN
        ack_mem_p<=req_mem AND NOT ack_mem;
        ack_mem_p2<=ack_mem_p AND req_mem;
      END IF;
    END IF;
  END PROCESS;
  ack_mem<=ack_mem_p2 AND ack_mem_p;
  
  --ack<='0';
  
  ack<=ackp WHEN rising_edge(clk);
  
  ad_rom <="000" & ad(11 DOWNTO 0) WHEN ad(14 DOWNTO 12)="000" ELSE
           "001" & ad(11 DOWNTO 0) WHEN ad(14 DOWNTO 12)="010" ELSE
            ad;
  
  -- CPU
  i_sgs2650: ENTITY work.sgs2650
    PORT MAP (
      req      => req,
      ack      => ack,
      ad       => ad,
      wr       => wr,
      dw       => dw,
      dr       => dr,
      mio      => mio,
      ene      => ene,
      dc       => dc,
      ph       => ph,
      int      => int,
      intack   => intack,
      ivec     => ivec,
      sense    => sense,
      flag     => flag,
      reset    => creset,
      clk      => clk,
      reset_na => reset_na);
  
  int<='0';
  ad_delay<=ad WHEN rising_edge(clk);
  
  ----------------------------------------------------------
--pragma synthesis_off
  Dump:PROCESS IS
    VARIABLE lout : line;
    VARIABLE doread : boolean := false;
    VARIABLE adr : uv15;
  BEGIN
    wure(clk);
    IF doread THEN
      write(lout,"RD(" & to_hstring('0' & adr) & ")=" & to_hstring(dr));
      writeline(fil,lout);
      doread:=false;
    END IF;
    IF req='1' AND ack='1' AND reset='0' AND reset_na='1' THEN
      IF wr='1' THEN
        write(lout,"WR(" & to_hstring('0' & ad) & ")=" & to_hstring(dw));
        writeline(fil,lout);
      ELSE
        doread:=true;
        adr:=ad;
      END IF;
    END IF;
  END PROCESS Dump;

--pragma synthesis_on
  ----------------------------------------------------------
  -- MUX VIDEO
  clk_video<=clk;
  ce_pixel<=vga_ce WHEN rising_edge(clk);
  
  vga_de<=vga_dei  WHEN rising_edge(clk);
  vga_hs<=vga_hsyn WHEN rising_edge(clk);
  vga_vs<=vga_vsyn WHEN rising_edge(clk);
  
  vga_argb<=vga_argb  WHEN rising_edge(clk);
  vga_r_i<=(7=>vga_argb(2) AND vga_argb(3),OTHERS => vga_argb(2));
  vga_g_i<=(7=>vga_argb(1) AND vga_argb(3),OTHERS => vga_argb(1));
  vga_b_i<=(7=>vga_argb(0) AND vga_argb(3),OTHERS => vga_argb(0));
  vga_r<=std_logic_vector(vga_r_i);
  vga_g<=std_logic_vector(vga_g_i);
  vga_b<=std_logic_vector(vga_b_i);
  
  ----------------------------------------------------------
  -- ROM / RAM

  wcart<=wr AND req AND ack; -- WHEN ad(12)='0' ELSE '0';
  
  icart:PROCESS(clk) IS
  BEGIN
    IF rising_edge(clk) THEN
      dr_rom<=cart(to_integer(ad_rom(13 DOWNTO 0))); -- 8kB
      
      IF wcart='1' THEN
        -- RAM
        cart(to_integer(ad_rom(13 DOWNTO 0))):=dw;
      END IF;
    END IF;
  END PROCESS icart;

  icart2:PROCESS(clk) IS
  BEGIN
    IF rising_edge(clk) THEN
      -- Download
      IF w_wr='1' THEN
        cart(to_integer(w_a)):=w_d;
      END IF;
    END IF;
  END PROCESS icart2;
  
  PROCESS(clk) IS
  BEGIN
    IF rising_edge(clk) THEN
      w_wr<=ioctl_download AND ioctl_wr;
      w_d <=unsigned(ioctl_dout);
      w_a <=unsigned(ioctl_addr(12 DOWNTO 0));
    END IF;
  END PROCESS;
  
  ioctl_wait<='0';
  
  ----------------------------------------------------------
  -- CPU CLK
  DivCLK:PROCESS (clk,reset_na) IS
  BEGIN
    IF reset_na='0' THEN
      tick_cpu<='0';
    ELSIF rising_edge(clk) THEN
      IF tick_cpu_cpt=CDIV - 1 THEN
        tick_cpu_cpt<=0;
        tick_cpu<='1';
      ELSE
        tick_cpu_cpt<=tick_cpu_cpt+1;
        tick_cpu<='0';
      END IF;
    END IF;
  END PROCESS DivCLK;
  
  reset_na<=NOT reset OR NOT ioctl_download;
  creset<=ioctl_download;
  
END struct;
