library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpuino_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

library unisim;
use unisim.vcomponents.all;

entity wbpll2 is
  generic (
    CLKIN_PERIOD: real := 0.001;
    CLKFB_MULT: integer := 10;
    CLK0_DIV: integer := 10;
    CLK1_DIV: integer := 10;
    CLK2_DIV: integer := 10;
    CLK1_ENABLE: boolean := false;
    CLK2_ENABLE: boolean := false;
    BUFFER0:  boolean := true;
    BUFFER1:  boolean := true;
    BUFFER2:  boolean := true;
    COMPENSATION: string := "INTERNAL"
  );
  port(
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;

    clkin:    in std_logic;
    clk0:     out std_logic;
    clk1:     out std_logic;
    clk2:     out std_logic;
    rst:      out std_logic;
    locked:   out std_logic;
    lock_in:  in  std_logic
  );
end entity wbpll2;

architecture behave of wbpll2 is


  --
  -- Memory map
  --
  --   98765432
  --   --------
  --   000-NNNN Configuration register N (total 16 registers)
  --   010NNNNN PLL Register number for index N (total 32 max registers)
  --   011NNNNN PLL Data for index N (total 32 max registers)
  --   1--NNNNN Direct PLL register access


  signal pll_daddr: std_logic_vector(4 downto 0);
  signal pll_di, pll_do, pll_do_q: std_logic_vector(15 downto 0);
  signal pll_den, pll_dwe, pll_drdy, pll_dclk: std_ulogic;
  signal pll_locked: std_logic;
  signal clk_to_fb, clk_from_fb: std_ulogic;
  signal c0,c1,c2: std_ulogic;

  signal pll_data_out:  std_logic_vector(31 downto 0);
  signal pll_reg_out:   std_logic_vector(7 downto 0);
  signal pll_index:     unsigned(4 downto 0);

  type state_type is (
    IDLE,
    ACK,
    PLLACCESS
  );

  type regs_type is record
    state:        state_type;
    CLKFBOUT:     std_logic_vector(13 downto 0);
    DIGITAL_FILT: std_logic_vector(9 downto 0);
    LOCKH:        std_logic_vector(19 downto 0);
    CLKOUT0:      std_logic_vector(13 downto 0);
    CLKOUT1:      std_logic_vector(13 downto 0);
    CLKOUT2:      std_logic_vector(13 downto 0);
    we:           std_logic;
    ack:          std_logic;
    dat:          std_logic_vector(31 downto 0);
    den:          std_logic;
    pll_reset:    std_ulogic;
  end record;

  signal r: regs_type;
  signal LOCK:         std_logic_vector(39 downto 0);

  function genmask(str: in string) return std_logic_vector is
    variable output: std_logic_vector(15 downto 0);
    variable b: std_logic;
  begin
    for i in 1 to 16 loop
      case str(i) is
        when 'X' =>   b:='1';
        when '0' | 'F' =>   b:='0';
        when '1' =>   if CLK1_ENABLE then b:='0'; else b:='1'; end if;
        when '2' =>   if CLK2_ENABLE then b:='0'; else b:='1'; end if;
        when others => report "Invalid" severity failure;
      end case;
      output(16 - i):=b;
    end loop;
    return output;
  end function;

begin


 -- PLL access

  rst <= r.pll_reset;

  pll_dclk  <= wb_clk_i;
  pll_dwe   <= r.we;
  pll_den <= r.den;
  pll_daddr <= wb_adr_i(6 downto 2);
  pll_di    <= wb_dat_i(15 downto 0);
  locked   <= pll_locked;
  wb_ack_o <= r.ack;
  wb_dat_o <= r.dat;

  process(wb_adr_i,wb_dat_i,wb_stb_i,wb_cyc_i,wb_rst_i,wb_we_i,wb_clk_i,wb_rst_i,r,
    pll_locked,pll_reg_out,pll_data_out,pll_do,pll_drdy,lock_in)
    variable w: regs_type;
  begin
    w := r;


    case r.state is
      when IDLE =>
        if wb_cyc_i='1' and wb_stb_i='1' then
          w.we := wb_we_i;
          if wb_adr_i(9)='1' then
            -- Direct PLL access
            w.den := '1';
            w.state := PLLACCESS;
          else
            w.state := ACK;
            w.ack := '1';
          end if;

        w.dat := (others => '0');
        if wb_adr_i(9)='0' then
         if wb_adr_i(8)='0' then
          if wb_adr_i(7)='0' then
            -- Mux output for normal accesses.
            case wb_adr_i(5 downto 2) is
              when "0000" =>
                w.dat(0) := r.pll_reset;
                w.dat(1) := lock_in;
                w.dat(2) := '1';
                w.dat(3) := '1';
                if wb_we_i='1' then
                  w.pll_reset:=wb_dat_i(0);
                end if;
              when "0001" =>
                w.dat(r.CLKFBOUT'range) := r.CLKFBOUT;
                if wb_we_i='1' then
                  w.CLKFBOUT := wb_dat_i(w.CLKFBOUT'range);
                end if;
              when "0010" =>
                w.dat(r.DIGITAL_FILT'range) := r.DIGITAL_FILT;
                if wb_we_i='1' then
                  w.DIGITAL_FILT := wb_dat_i(w.DIGITAL_FILT'range);
                end if;
              when "0011" =>
                w.dat(19 downto 0) := r.LOCKH(19 downto 0);
                if wb_we_i='1' then
                  w.LOCKH(19 downto 0) := wb_dat_i(19 downto 0);
                end if;
              when "0100" =>
                w.dat(r.CLKOUT0'range) := r.CLKOUT0;
                if wb_we_i='1' then
                  w.CLKOUT0 := wb_dat_i(w.CLKOUT0'range);
                end if;
              when "0101" =>
                if CLK1_ENABLE then
                  w.dat(r.CLKOUT1'range) := r.CLKOUT1;
                  if wb_we_i='1' then
                    w.CLKOUT1 := wb_dat_i(w.CLKOUT1'range);
                  end if;
                else
                  w.dat := (others => 'X');
                end if;
              when "0110" =>
                if CLK2_ENABLE then
                  w.dat(r.CLKOUT2'range) := r.CLKOUT2;
                  if wb_we_i='1' then
                    w.CLKOUT2 := wb_dat_i(w.CLKOUT2'range);
                  end if;
                else
                  w.dat := (others => 'X');
                end if;
              when others =>
                w.dat := (others => 'X');
            end case;
          else
            w.dat := (others => 'X');
          end if;
         else
          if wb_adr_i(7)='0' then
            w.dat(7 downto 0):=pll_reg_out;
          else
            w.dat:=pll_data_out;
          end if;
         end if;
        end if;
      end if;
      when ACK =>
        w.ack := '0';
        w.state := IDLE;

      when PLLACCESS =>
        w.den := '0';
        w.dat := (others => '0');
        w.dat(15 downto 0) := pll_do;
        w.we := 'X';
        if pll_drdy='1' then
          w.ack := '1';
          w.state := ACK;
        end if;

      when others =>
    end case;

    if wb_rst_i='1' then
      w.ack := '0';
      w.dat := (others => 'X');
      w.state := IDLE;
      w.pll_reset := '0';
      w.den := '0';
      w.we := 'X';
    end if;

    if rising_edge(wb_clk_i) then
      r <= w;
    end if;

  end process;

  pll: PLL_ADV
  generic map
   (BANDWIDTH            => "OPTIMIZED",
    CLK_FEEDBACK         => "CLKFBOUT",
    COMPENSATION         => COMPENSATION,
    DIVCLK_DIVIDE        => 1,
    CLKFBOUT_MULT        => CLKFB_MULT,
    CLKFBOUT_PHASE       => 0.000,
    CLKOUT0_DIVIDE       => CLK0_DIV,
    CLKOUT0_PHASE        => 0.000,
    CLKOUT0_DUTY_CYCLE   => 0.500,
    CLKOUT1_DIVIDE       => CLK1_DIV,
    CLKOUT1_PHASE        => 0.000,
    CLKOUT1_DUTY_CYCLE   => 0.500,
    CLKOUT2_DIVIDE       => CLK2_DIV,
    CLKOUT2_PHASE        => 0.000,
    CLKOUT2_DUTY_CYCLE   => 0.500,
    CLKIN1_PERIOD        => CLKIN_PERIOD,
    REF_JITTER           => 0.010,
    SIM_DEVICE           => "SPARTAN6")
  port map
    -- Output clocks
   (CLKFBOUT            => clk_to_fb,
    CLKOUT0             => c0,
    CLKOUT1             => c1,
    CLKOUT2             => c2,
    LOCKED              => pll_locked,
    RST                 => r.pll_reset,
    -- Input clock control
    CLKFBIN             => clk_from_fb,
    CLKIN1              => clkin,
    CLKIN2              => '0',
    CLKINSEL            => '1',

    DADDR               => pll_daddr,
    DCLK                => pll_dclk,
    DEN                 => pll_den,
    DI                  => pll_di,
    DO                  => pll_do,
    DRDY                => pll_drdy,
    DWE                 => pll_dwe,
    REL                 => '0'
   );

   fbbuf: if COMPENSATION="INTERNAL" generate
    clk_from_fb<=clk_to_fb;
   end generate;

   fbbuf2: if COMPENSATION/="INTERNAL" generate
   clkfbinst: BUFG
    port map (
      I =>  clk_to_fb,
      O =>  clk_from_fb
    );
   end generate;

   b0: if BUFFER0 generate
    c0buf: BUFG port map (I => c0, O => clk0);
   end generate;

   b1: if BUFFER1 generate
   c1bufgen: if CLK1_ENABLE generate
    c1buf: BUFG port map (I => c1, O => clk1);
   end generate;
   end generate;

   b2: if BUFFER2 generate
   c2bufgen: if CLK2_ENABLE generate
    c2buf: BUFG port map (I => c2, O => clk2);
   end generate;
   end generate;

  bn0:  if not BUFFER0 generate clk0 <= c0; end generate;
  bn1:  if not BUFFER1 generate clk1 <= c1; end generate;
  bn2:  if not BUFFER2 generate clk2 <= c2; end generate;

  -- Hardcode LOCK lower bits - they are always same for spartan6.

  datamux: block

    signal CLKFBOUT:     std_logic_vector(13 downto 0);
    signal DIGITAL_FILT: std_logic_vector(9 downto 0);
    signal LOCK:         std_logic_vector(39 downto 0);
    signal CLKOUT0:      std_logic_vector(13 downto 0);
    signal CLKOUT1:      std_logic_vector(13 downto 0);
    signal CLKOUT2:      std_logic_vector(13 downto 0);

    alias C0LOW:        std_logic_vector(5 downto 0) is CLKOUT0(5 downto 0);
    alias C0HIGH:       std_logic_vector(5 downto 0) is CLKOUT0(11 downto 6);
    alias C0NOCOUNT:    std_logic is CLKOUT0(12);
    alias C0EDGE:       std_logic is CLKOUT0(13);

    alias C1LOW:        std_logic_vector(5 downto 0) is CLKOUT1(5 downto 0);
    alias C1HIGH:       std_logic_vector(5 downto 0) is CLKOUT1(11 downto 6);
    alias C1NOCOUNT:    std_logic is CLKOUT1(12);
    alias C1EDGE:       std_logic is CLKOUT1(13);

    alias C2LOW:        std_logic_vector(5 downto 0) is CLKOUT2(5 downto 0);
    alias C2HIGH:       std_logic_vector(5 downto 0) is CLKOUT2(11 downto 6);
    alias C2NOCOUNT:    std_logic is CLKOUT2(12);
    alias C2EDGE:       std_logic is CLKOUT2(13);

  begin
  
  LOCK <= r.LOCKH & x"FA401";
  CLKFBOUT <= r.CLKFBOUT;
  DIGITAL_FILT <= r.DIGITAL_FILT;

  CLKOUT0 <= r.CLKOUT0;
  CLKOUT1 <= r.CLKOUT1 when CLK1_ENABLE else (others => 'X');
  CLKOUT2 <= r.CLKOUT2 when CLK2_ENABLE else (others => 'X');

  pll_index <= unsigned(wb_adr_i(6 downto 2));

  process(pll_index,CLKOUT0,CLKOUT1,CLKOUT2,CLKFBOUT,LOCK,DIGITAL_FILT)
    variable mask,data: std_logic_vector(15 downto 0);
    variable maskstr: string(1 to 16);
  begin
      case pll_index is
        when "00000" => maskstr := "111111XXXXXXX0XX";
	      when "00001" => maskstr := "0XXXXX0XXXXXXXXX";
	      when "00010" => maskstr := "XXXXXXXXX000XXXX";
        when "00011" => maskstr := "FFFFFFFXXXXX00XX";
        when "00100" => maskstr := "X000FFFFFFFXXXXX";
        when "00101" => maskstr := "XXXXXXXX22X10X00";
        when "00110" => maskstr := "FFXFXXXXXXXXXXXX";
        when "00111" => maskstr := "XXXXXXXXXXXXFXFF";
        when "01000" => maskstr := "FFFFXFXXXXXXXXXX";
        when "01001" => maskstr := "XXXXXXXXXXFXFFFF";
        when "01010" => maskstr := "FFFXFFFFFFXXXFFX";
        when "01011" => maskstr := "FFFFFFFFFFFFFFFF";
        when "01100" => maskstr := "XXXXXXXXXXXXXXFF";
        when "01101" => maskstr := "FFXFXXXXXXXXXXXX";
        when "01110" => maskstr := "XXX111111XX1XXXX";
        when "01111" => maskstr := "XX2X22222XXXXXXX";
        when "10000" => maskstr := "XXXXXX2X22222XXX";
        when others => maskstr := "XXXXXXXXXXXXXXXX";
      end case;

      mask := genmask(maskstr);

      case pll_index is
        --when "0000" => pll_reg_out <= x"06"; data := "XXXXXXXXXXXXX" & CLKOUT0(13) & "XX";
        when "00000" => pll_reg_out <= x"06"; data := C1LOW(4) & C1LOW(5) & C1LOW(3) & C1NOCOUNT & C1LOW(1) & C1LOW(2) & "XXXXXXX" & C0EDGE & "XX";
        when "00001" => pll_reg_out <= x"0B"; data := C0LOW(5)& "XXXXX" & C0LOW(4) & "X" & "XXXXXXXX";
	      when "00010" => pll_reg_out <= x"0D"; data := "XXXXXXXX"& 'X' & C0LOW(3) & C0LOW(0) & C0LOW(2) & "XXXX";
        when "00011" => pll_reg_out <= x"0F"; data := CLKFBOUT(4)& CLKFBOUT(5)& CLKFBOUT(3)& CLKFBOUT(12)& CLKFBOUT(1)&
                                    CLKFBOUT(2)& CLKFBOUT(0)& "XXXXX" &  C0NOCOUNT & C0LOW(1)& "XX";
        when "00100" => pll_reg_out <= x"10"; data := 'X'& CLKOUT0(9)& CLKOUT0(11)& CLKOUT0(10)& CLKFBOUT(10)& CLKFBOUT(11)&
                      CLKFBOUT(9)& CLKFBOUT(8)& CLKFBOUT(7)& CLKFBOUT(6)& CLKFBOUT(13)& "XXXXX";

        --when "0101" => pll_reg_out <= x"11"; data := "XXXXXXXXXXXX" & CLKOUT0(6)& 'X'& CLKOUT0(8)& CLKOUT0(7);
        when "00101" => pll_reg_out <= x"11"; data := "XXXXXXXX" & C2HIGH(5) & C2LOW(1) & "X" & C1LOW(0) & C0HIGH(0) & "X" & C0HIGH(2)& C0HIGH(1);

        when "00110" => pll_reg_out <= x"14"; data := LOCK(1)& LOCK(2) & "X" & LOCK(0)& "XXXXXXXXXXXX";
        when "00111" => pll_reg_out <= x"15"; data := "XXXXXXXXXXXX" & LOCK(38) & "X" & LOCK(32) & LOCK(39);
        when "01000" => pll_reg_out <= x"16"; data := LOCK(15)& LOCK(13)& LOCK(27)& LOCK(16)& 'X' & LOCK(10)&"XXXXXXXXXX";
        when "01001" => pll_reg_out <= x"17"; data := "XXXXXXXXXX" & LOCK(17)& 'X'& LOCK(8)& LOCK(9)& LOCK(23)& LOCK(22);
        when "01010" => pll_reg_out <= x"18"; data := DIGITAL_FILT(6)& DIGITAL_FILT(7)& DIGITAL_FILT(0)& 'X'&
                      DIGITAL_FILT(2)& DIGITAL_FILT(1)& DIGITAL_FILT(3)& DIGITAL_FILT(9)&
                      DIGITAL_FILT(8)& LOCK(26)& "XXX" & LOCK(19)& LOCK(18) & 'X';
        when "01011" => pll_reg_out <= x"19"; data := LOCK(24)& LOCK(25)& LOCK(21)& LOCK(14)& LOCK(11)&
                      LOCK(12)& LOCK(20)& LOCK(6)& LOCK(35)& LOCK(36)& 
                      LOCK(37)& LOCK(3)& LOCK(33)& LOCK(31)& LOCK(34)& LOCK(30);
        when "01100" => pll_reg_out <= x"1A"; data := "XXXXXXXXXXXXXX" & LOCK(28)& LOCK(29);
        when "01101" => pll_reg_out <= x"1D"; data := LOCK(7)& LOCK(4)& 'X' & LOCK(5)& "XXXXXXXXXXXX";
        when "01110" => pll_reg_out <= x"07"; data := "XXX" & C1HIGH(5) & C1HIGH(3) & C1HIGH(4) & C1HIGH(2) & C1HIGH(1) & C1HIGH(0) & "XX" & C1EDGE & "XXXX";
        when "01111" => pll_reg_out <= x"08"; data := "XX" & C2LOW(5) & "X" & C2NOCOUNT & C2LOW(4) & C2LOW(3) & C2LOW(2) & C2LOW(0) & "XXXXXXX";
        when "10000" => pll_reg_out <= x"09"; data := "XXXXXX" & C2HIGH(4) & "X" & C2HIGH(3) & C2HIGH(2) & C2HIGH(0) & C2HIGH(1) & C2EDGE & "XXX";
        when others  => pll_reg_out <= x"00"; data := "XXXXXXXXXXXXXXXX";
      end case;

      pll_data_out <= mask & data;

  end process;

  end block;

end behave;
