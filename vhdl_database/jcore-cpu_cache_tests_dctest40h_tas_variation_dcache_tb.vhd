library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;

use work.cache_pack.all;
use work.cpu2j0_pack.all;
use work.data_bus_pack.all;
use work.dma_pack.all;

entity dcache_tb is
end dcache_tb;

-- dhrystone special tb
--   acc_vect 72 bits (normal vector 68 bits) entexsion is en bit
--   acc_vect includes cpu en=0 cycle
--   dhrystone loop control in vector

architecture tb of dcache_tb is

type acc_vect_t is array (0 to 2047)  of std_logic_vector( 71 downto 0);
type ddr_ram_t  is array (0 to 2**14-1)  of std_logic_vector( 31 downto 0);

   signal rst   : std_logic;
   signal rst_46nsdel   : std_logic;
   signal clk125   : std_logic;
   signal clk200   : std_logic;

   signal a0     : cpu_data_o_t;
   signal y0     : cpu_data_i_t;
   signal lock0  : std_logic;
   signal sa0    : dcache_snoop_io_t;
   signal sy0    : dcache_snoop_io_t;
   signal ra0    : dcache_ram_o_t;
   signal ry0    : dcache_ram_i_t;
   signal ma0    : mem_i_t;
   signal my0    : mem_o_t;

   signal a1     : cpu_data_o_t;
   signal y1     : cpu_data_i_t;
   signal lock1  : std_logic;
   signal ra1    : dcache_ram_o_t;
   signal ry1    : dcache_ram_i_t;
   signal ma1    : mem_i_t;
   signal my1    : mem_o_t;

   signal ma    : mem_i_t;
   signal my    : mem_o_t;

   signal  m1_o   : cpu_data_i_t;
   signal  m1_i   : cpu_data_o_t;
   signal  m2_o   : bus_ddr_i_t;
   signal  m2_i   : bus_ddr_o_t;
   signal  mem_o : cpu_data_o_t;
   signal  mem_i : cpu_data_i_t;

   signal ctrl  : cache_ctrl_t;
   signal my_1delay : mem_o_t;
   signal ma_rdy_1wait_sig : std_logic;

   signal cavec  : std_logic_vector( 67 downto 0 );

   signal acc_vect : acc_vect_t;
   signal ddr_ram  : ddr_ram_t := ( others => x"A5A5A5A5" );
   signal acksp_pointer_thisc : std_logic_vector(10 downto 0);
   signal acksp_pointer_thisr : std_logic_vector(10 downto 0);
   signal acc_vect_pt : integer range 0 to 2047;
   signal cpu0en : std_logic;
   signal cpu1en : std_logic;
   signal mis_counter_thisc : std_logic_vector(10 downto 0);
   signal mis_counter_thisr : std_logic_vector(10 downto 0);
   signal y_ack_1del_thisc : std_logic;
   signal y_ack_1del_thisr : std_logic;
   signal observe_dcache_waitsig  : std_logic;

begin

  --
  rst <= '1', '0' after 15 ns;
  rst_46nsdel <= rst after 46 ns;
  clk125 <= '0' after 4   ns when clk125 = '1' else '1' after 4   ns;
  clk200 <= '0' after 2.5 ns when clk200 = '1' else '1' after 2.5 ns;

-- .+....1....+....1....+....1....+....1....+....1....+....1....+....1....+....1
  dut0 : dcache     port map ( rst => rst,
    clk125 => clk125, clk200 => clk200, a => a0,
    lock => lock0,    y => y0,          sa => sa0,
    sy => sy0,        ra => ra0,        ry => ry0,
    ma => ma0,        my => my0 ,       ctrl   => ctrl );
  mem0 : configuration work.dcache_ram_infer port map ( rst => rst,
    clk125 => clk125,
    clk200 => clk200, ra => ry0, ry => ra0 );

  dut1 : dcache     port map ( rst => rst,
    clk125 => clk125, clk200 => clk200, a => a1,
    lock => lock1,    y => y1,          sa => sy0,
    sy => sa0,        ra => ra1,        ry => ry1,
    ma => ma1,        my => my1 ,       ctrl   => ctrl );
  mem1 : configuration work.dcache_ram_infer port map ( rst => rst,
    clk125 => clk125,
    clk200 => clk200, ra => ry1, ry => ra1 );

  dut2 : bus_mux_typeb port map (
    clk    => clk200, 
    rst    => rst, 
    m1_o   => m1_o,
    m1_i   => m1_i,
    m2_o   => m2_o,
    m2_i   => m2_i,
    mem_o  => mem_o,
    mem_i  => mem_i);

  -- connection around bus_mux_typeb
  m1_i.en <= my0.en;
  m1_i.a  <= x"0" & my0.a;
  m1_i.wr <= my0.wr;
  m1_i.we <= my0.we;
  m1_i.d  <= my0.d ;
  m1_i.rd <= my0.en and (not my0.wr);
  ma0.ack <= m1_o.ack;
  ma0.d   <= m1_o.d  ;

  m2_i.en <= my1.en;
  m2_i.a  <= x"0" & my1.a;
  m2_i.wr <= my1.wr;
  m2_i.we <= my1.we;
  m2_i.d  <= my1.d ;
  ma1.ack <= m2_o.ack;
  ma1.d   <= m2_o.d  ;

  my.en   <= mem_o.en;
  my.a    <= mem_o.a(27 downto 0);
  my.wr   <= mem_o.wr;
  my.we   <= mem_o.we;
  my.d    <= mem_o.d ;
  mem_i.ack <= ma.ack;
  mem_i.d   <= ma.d;
-- .+....1....+....1....+....1....+....1....+....1....+....1....+....1....+....1
--  sa.en <= '0';
--  sa.al <= (others => '0');
-- .+....1....+....1....+....1....+....1....+....1....+....1....+....1....+....1
  -- cache on/off selection
  -- --------------------------------------------------------------------------
    ctrl.en  <= '1' ; -- cache on
--  ctrl.en  <= '0' ; -- cache off
-- --------------------------------------------------------------------------
    ctrl.inv <= '0' ; -- no invalidate 
-- --------------------------------------------------------------------------

--  valid_rest : process( acksp_pointer_thisr, y_ack_1del_thisr, rst_46nsdel)
--  begin
--    if(y_ack_1del_thisr = '1') and
--      (acksp_pointer_thisr(2 downto 0) = b"111") then
--      a.a  <= x"0aaaaaa0";
--      a.en <= '0';
--      a.wr <= '0';
--      a.we <= x"0";
--      a.d  <= x"00000000";
--    else
      acc_vect_pt <= vtoi(acksp_pointer_thisr);
      cpu0en <= not acc_vect(acc_vect_pt)(69);
      cpu1en <=     acc_vect(acc_vect_pt)(69);

      a0.a  <= x"0" &
               acc_vect(acc_vect_pt)(59 downto 32);
      lock0 <= acc_vect(acc_vect_pt)(65) ;    -- no en cpu0en
      a0.en <= acc_vect(acc_vect_pt)(68) and cpu0en;
      a0.wr <= acc_vect(acc_vect_pt)(64) and cpu0en;
      a0.we <= acc_vect(acc_vect_pt)(63 downto 60);
      a0.d  <= acc_vect(acc_vect_pt)(31 downto  0);

      a1.a  <= x"0" &
               acc_vect(acc_vect_pt)(59 downto 32);
      lock1 <= acc_vect(acc_vect_pt)(66);
      a1.en <= acc_vect(acc_vect_pt)(68) and cpu1en;
      a1.wr <= acc_vect(acc_vect_pt)(64) and cpu1en;
      a1.we <= acc_vect(acc_vect_pt)(63 downto 60);

--    end if;
--  end process;

  ma.d <= (ddr_ram(vtoi(my.a(15 downto 2)))) and
   (
    ma.ack & ma.ack & ma.ack & ma.ack &
    ma.ack & ma.ack & ma.ack & ma.ack &
    ma.ack & ma.ack & ma.ack & ma.ack &
    ma.ack & ma.ack & ma.ack & ma.ack &
    ma.ack & ma.ack & ma.ack & ma.ack &
    ma.ack & ma.ack & ma.ack & ma.ack &
    ma.ack & ma.ack & ma.ack & ma.ack &
    ma.ack & ma.ack & ma.ack & ma.ack 
   ) ;

  my_1delay <= my after 5 ns;

  -- --------------------------------------------------------------------------
  gen_ready_1wait : process (my, my_1delay)
    variable mem_rdy_1wait : std_logic;
  begin
    if (my_1delay.en = '1') and
       (my.en        = '1') and
       (my_1delay.a = my.a) then mem_rdy_1wait := '1';
     else                        mem_rdy_1wait := '0';
     end if;
     ma_rdy_1wait_sig <=     mem_rdy_1wait;
  end process;
  -- --------------------------------------------------------------------------
  -- 1 wait
  ma.ack <= ma_rdy_1wait_sig;
  -- --------------------------------------------------------------------------
  -- 0 wait
--  ma.ack <= my.en;
  -- --------------------------------------------------------------------------
  observe_dcache_waitsig <= a0.en and (not y0.ack);

  ackfsm : process(acksp_pointer_thisr, mis_counter_thisr, y_ack_1del_thisr,
     y0.ack, y1.ack, my.av, ma.ack , a0.en, a1.en, rst, rst_46nsdel )
   variable acksp_pointer_this : std_logic_vector(10 downto 0);
   variable mis_counter_this : std_logic_vector(10 downto 0);
   variable y_ack_1del_this  : std_logic;
  begin
   acksp_pointer_this := acksp_pointer_thisr;
   mis_counter_this := mis_counter_thisr;
   y_ack_1del_this  := y_ack_1del_thisr;

   if(rst = '1') or (rst_46nsdel /= '0') then
        -- acksp_pointer_this update disabled
   elsif(y0.ack = '1') or (y1.ack = '1') or
        ((a0.en = '0') and (a1.en = '0')) then
     acksp_pointer_this := std_logic_vector(unsigned(acksp_pointer_this) + 1);
     -- dhrystone loop control
     if (acksp_pointer_this = b"101" & x"5b") then -- 0x55b (dec 1371)
       acksp_pointer_this :=  b"001" & x"8a";      -- 0x18a (dec  394)
     end if;
   end if;
   if((my.av = '1') and (ma.ack = '1')) then
     mis_counter_this := std_logic_vector(unsigned(mis_counter_this) + 1);
   end if;
   y_ack_1del_this := (y0.ack or y1.ack);

   acksp_pointer_thisc <= acksp_pointer_this;
   mis_counter_thisc <= mis_counter_this;
   y_ack_1del_thisc  <= y_ack_1del_this ;
  end process;

  p0_r0_125fsm : process(clk125, rst)
  begin
     if rst = '1' then
        acksp_pointer_thisr <= b"000" & x"00";
        y_ack_1del_thisr  <= '0';
     elsif clk125 = '1' and clk125'event then
        acksp_pointer_thisr <= acksp_pointer_thisc;
        y_ack_1del_thisr  <= y_ack_1del_thisc ;
     end if;
  end process;

  p0_r0_200fsm : process(clk200, rst)
  begin
     if rst = '1' then
        mis_counter_thisr <= b"000" & x"00";
     elsif clk200 = '1' and clk200'event then
        mis_counter_thisr <= mis_counter_thisc;
     end if;
  end process;

  ddr_raminit : process(rst, my)
  begin
   if rst = '1' then

   ddr_ram(    0) <= x"000000cc";
   ddr_ram(    1) <= x"00000000";

   ddr_ram(   16) <= x"40414243";
   ddr_ram(   17) <= x"44454647";

   ddr_ram(   61) <= x"000097fc";
   ddr_ram(   62) <= x"00009ffc";
   ddr_ram(   63) <= x"00000288";
   ddr_ram(   76) <= x"0000c450";
   ddr_ram(   77) <= x"0000c44c";
   ddr_ram(   89) <= x"0000c454";
   ddr_ram(   90) <= x"0000c44c";
   ddr_ram(   91) <= x"00000894";
   ddr_ram(  139) <= x"0000c454";
   ddr_ram(  140) <= x"00000138";
   ddr_ram(  141) <= x"000009c0";
   ddr_ram(  142) <= x"00000894";
   ddr_ram(  151) <= x"0000c520";
   ddr_ram(  152) <= x"0000c450";
   ddr_ram(  153) <= x"0000c451";
   ddr_ram(  160) <= x"0000c450";
   ddr_ram(  161) <= x"0000c520";
   ddr_ram(  198) <= x"00000384";
   ddr_ram(  288) <= x"4e470009";
   ddr_ram(  289) <= x"000031e8";
   ddr_ram(  290) <= x"0000c448";
   ddr_ram(  291) <= x"0000c454";
   ddr_ram(  292) <= x"44485259";
   ddr_ram(  293) <= x"53544f4e";
   ddr_ram(  294) <= x"45205052";
   ddr_ram(  295) <= x"4f475241";
   ddr_ram(  296) <= x"4d2c2053";
   ddr_ram(  297) <= x"4f4d4520";
   ddr_ram(  298) <= x"53545249";
   ddr_ram(  299) <= x"4d2c2031";
   ddr_ram(  300) <= x"27535420";
   ddr_ram(  301) <= x"0000a370";
   ddr_ram(  316) <= x"00000268";
   ddr_ram(  317) <= x"0000023c";
   ddr_ram(  318) <= x"4d2c2032";
   ddr_ram(  319) <= x"274e4420";
   ddr_ram(  320) <= x"00000944";
   ddr_ram(  321) <= x"0000c520";
   ddr_ram(  322) <= x"00000894";
   ddr_ram(  323) <= x"0000c458";
   ddr_ram(  324) <= x"00009d34";
   ddr_ram(  325) <= x"000008a4";
   ddr_ram(  326) <= x"00000170";
   ddr_ram(  327) <= x"0000c451";
   ddr_ram(  328) <= x"4d2c2033";
   ddr_ram(  329) <= x"00000924";
   ddr_ram(  486) <= x"00001acc";
   ddr_ram(  487) <= x"00000110";
   ddr_ram(  583) <= x"00c80fa0";
   ddr_ram(  584) <= x"0000c44c";
   ddr_ram(  617) <= x"00000924";
   ddr_ram(  618) <= x"00002d14";
   ddr_ram(  636) <= x"000009b0";
   ddr_ram(  637) <= x"00002630";

   ddr_ram( 2048) <= x"00000000";

   ddr_ram( 3184) <= x"000035e4";
   ddr_ram( 3185) <= x"0000322c";
   ddr_ram( 3186) <= x"000035e4";
   ddr_ram( 3207) <= x"000030e4";
   ddr_ram( 3208) <= x"00007ae8";
   ddr_ram( 3209) <= x"00009cb8";
   ddr_ram( 7866) <= x"00007be8";
   ddr_ram( 7894) <= x"4e470000";
   ddr_ram( 7930) <= x"00000100";
   ddr_ram(10210) <= x"00000000";
   ddr_ram(10219) <= x"4e474e47";
   ddr_ram(10227) <= x"4e474e47";

   ddr_ram(10904) <= x"60616263";

   ddr_ram(12564) <= x"41420000";

   elsif (my.en = '1') and (my.wr = '1') then
     for i in 0 to 3 loop
       if(my.we(i) = '1') then
         ddr_ram(vtoi(my.a(15 downto 2)))(8 * i + 7 downto 8 * i)
         <= my.d                         (8 * i + 7 downto 8 * i);
       end if;
     end loop;
   end if;
   end process;

-- ---- cpu access dump ------
  process
    file f0 : text is out "cpu0.acc";
    variable l : line;
  begin

    wait for 1 ns;
    if(y0.ack = '1') then
      hwrite(     l, a0.a );   write(l, string'(" "));
      if(a0.wr = '1') then
           hwrite(l, a0.d );   write(l, string'(" "));
      else hwrite(l, y0.d );   write(l, string'(" "));
      end if;
       write(     l, a0.wr );  write(l, string'(" "));
      -- write line --------------
      writeline(f0, l);
      deallocate(l);
    end if;
    wait for 7 ns;
  end process;

-- ---- bus write dump ------
  process
    file f1 : text is out "bus.acc";
    variable l1 : line;
  begin

    wait for 1 ns;
    if(ma.ack = '1') and (my.wr = '1') then
      hwrite(l1, my.a );   write(l1, string'(" "));
      hwrite(l1, my.d );   write(l1, string'(" "));
      -- write line --------------
      writeline(f1, l1);
      deallocate(l1);
    end if;
    wait for 4 ns;
  end process;

-- ---- snoop write dump ------
  process
    file f2 : text is out "snoopo.acc";
    variable l2 : line;
  begin

    wait for 1 ns;
    if(sy0.en = '1') then
      hwrite(l2, sy0.al & '0' );
      -- write line --------------
      writeline(f2, l2);
      deallocate(l2);
    end if;
    wait for 7 ns;
  end process;

-- ---- snoop write dump ------
    



  -- vector           eww
  --                  nre  adr    data
  --                  ||||_____||______|
  -- prepare hit entry
  --
-- cpu_sim load/store vector
-- initialize finish
  -- test #1 read hit  -> TAS, TAS -> TAS
  acc_vect(   0) <= x"000000000000000000";
  acc_vect(   1) <= x"000000000000000000";
  acc_vect(   2) <= x"000000000000000000";
  acc_vect(   3) <= x"1000000000000000CC";
  acc_vect(   4) <= x"100000000400000000";
  acc_vect(   5) <= x"000000000000000000";
  acc_vect(   6) <= x"120000004240414243";
  acc_vect(   7) <= x"020000000000000000";
  acc_vect(   8) <= x"1340000042EEEEC2EE";
  acc_vect(   9) <= x"000000000000000000";
  acc_vect(  10) <= x"000000000000000000";
  acc_vect(  11) <= x"12000000404041C243";
  acc_vect(  12) <= x"020000000000000000";
  acc_vect(  13) <= x"1340000040C0DDDDDD";
  acc_vect(  14) <= x"000000000000000000";
  acc_vect(  15) <= x"000000000000000000";
  acc_vect(  16) <= x"1000000040C041C243";
  acc_vect(  17) <= x"000000000000000000";
  -- test #2 read miss -> TAS
  acc_vect(  18) <= x"000000000000000000";
  acc_vect(  19) <= x"100000200000000000";
  acc_vect(  20) <= x"000000000000000000";
  acc_vect(  21) <= x"12000AAA6360616263";
  acc_vect(  22) <= x"13100AAA63000000E3";
  acc_vect(  23) <= x"10000AAA60606162E3";
  acc_vect(  24) <= x"000000000000000000";
  acc_vect(  25) <= x"000000000000000000";
  acc_vect(  26) <= x"000000000000000000";
  -- test #3 write hit write hit -> TAS
  acc_vect(  27) <= x"000000000000000000";
  acc_vect(  28) <= x"11F000004040414243";
  acc_vect(  29) <= x"000000000000000000";
  acc_vect(  30) <= x"11F00020C012345678";
  acc_vect(  31) <= x"11F00020C412345678";
  acc_vect(  32) <= x"11F00020C856781234";
  acc_vect(  33) <= x"120000004040414243";
  acc_vect(  34) <= x"020000000000000000";
  acc_vect(  35) <= x"1380000040C0000000";
  acc_vect(  36) <= x"1000000040C0414243";
  acc_vect(  37) <= x"10000020C412345678";
  acc_vect(  38) <= x"10000020C856781234";
  acc_vect(  39) <= x"000000000000000000";
  acc_vect(  40) <= x"000000000000000000";
  acc_vect(  41) <= x"000000000000000000";
  -- test #4 write miss -> TAS
  acc_vect(  42) <= x"000000000000000000";
  acc_vect(  43) <= x"11F00AAA6410111213";
  acc_vect(  44) <= x"11F00A8A64FFFFFFFF";
  acc_vect(  45) <= x"000000000000000000";
  acc_vect(  46) <= x"11F00000C0A0A0A0A0";
  acc_vect(  47) <= x"12000AAA6610111213";
  acc_vect(  48) <= x"13200AAA6600009200";
  acc_vect(  49) <= x"000000000000000000";
  acc_vect(  50) <= x"10000A8A64FFFFFFFF";
  -- dummy pattern to fill time
  acc_vect(  51) <= x"10000AAA6410119213";
  acc_vect(  52) <= x"000000000000000000";
  acc_vect(  53) <= x"000000000000000000";
  acc_vect(  54) <= x"000000000000000000";
  acc_vect(  55) <= x"000000000000000000";
  acc_vect(  56) <= x"000000000000000000";
  acc_vect(  57) <= x"000000000000000000";
  acc_vect(  58) <= x"000000000000000000";
  acc_vect(  59) <= x"000000000000000000";
  acc_vect(  60) <= x"000000000000000000";
  -- dummy pattern to fill time
  acc_vect(  61) <= x"11F00000C498765432";
  acc_vect(  62) <= x"11F00020C401234567";
  acc_vect(  63) <= x"10000000C498765432";
  acc_vect(  64) <= x"10000020C401234567";
  acc_vect(  65) <= x"11F00000C498765432";
  acc_vect(  66) <= x"11F00020C401234567";
  acc_vect(  67) <= x"10000000C498765432";
  acc_vect(  68) <= x"10000020C401234567";
  acc_vect(  69) <= x"11F00000C498765432";
  acc_vect(  70) <= x"11F00020C401234567";
  -- dummy pattern to fill time
  acc_vect(  71) <= x"11F00000C498765432";
  acc_vect(  72) <= x"11F00020C401234567";
  acc_vect(  73) <= x"10000000C498765432";
  acc_vect(  74) <= x"10000020C401234567";
  acc_vect(  75) <= x"11F00000C498765432";
  acc_vect(  76) <= x"11F00020C401234567";
  acc_vect(  77) <= x"10000000C498765432";
  acc_vect(  78) <= x"10000020C401234567";
  acc_vect(  79) <= x"11F00000C498765432";
  acc_vect(  80) <= x"11F00020C401234567";
  -- dummy pattern to fill time
  acc_vect(  81) <= x"11F00000C498765432";
  acc_vect(  82) <= x"11F00020C401234567";
  acc_vect(  83) <= x"10000000C498765432";
  acc_vect(  84) <= x"10000020C401234567";
  acc_vect(  85) <= x"11F00000C498765432";
  acc_vect(  86) <= x"11F00020C401234567";
  acc_vect(  87) <= x"10000000C498765432";
  acc_vect(  88) <= x"10000020C401234567";
  acc_vect(  89) <= x"11F00000C498765432";
  acc_vect(  90) <= x"11F00020C401234567";
  -- dummy pattern to fill time
  acc_vect(  91) <= x"11F00000C498765432";
  acc_vect(  92) <= x"11F00020C401234567";
  acc_vect(  93) <= x"10000000C498765432";
  acc_vect(  94) <= x"10000020C401234567";
  acc_vect(  95) <= x"11F00000C498765432";
  acc_vect(  96) <= x"11F00020C401234567";
  acc_vect(  97) <= x"10000000C498765432";
  acc_vect(  98) <= x"10000020C401234567";
  acc_vect(  99) <= x"11F00000C498765432";
  acc_vect( 100) <= x"11F00020C401234567";
  -- dummy pattern to fill time
  acc_vect( 101) <= x"11F00000C498765432";
  acc_vect( 102) <= x"11F00020C401234567";
  acc_vect( 103) <= x"10000000C498765432";
  acc_vect( 104) <= x"10000020C401234567";
  acc_vect( 105) <= x"11F00000C498765432";
  acc_vect( 106) <= x"11F00020C401234567";
  acc_vect( 107) <= x"10000000C498765432";
  acc_vect( 108) <= x"10000020C401234567";
  acc_vect( 109) <= x"11F00000C498765432";
  acc_vect( 110) <= x"11F00020C401234567";
  -- end dummy pattern to fill time
  acc_vect( 111) <= x"000000000000000000";
  acc_vect( 112) <= x"000000000000000000";
  acc_vect( 113) <= x"000000000000000000";
  acc_vect( 114) <= x"000000000000000000";
  acc_vect( 115) <= x"000000000000000000";
  acc_vect( 116) <= x"000000000000000000";
  acc_vect( 117) <= x"000000000000000000";
  acc_vect( 118) <= x"000000000000000000";
  acc_vect( 119) <= x"11F0007BE8000000CC";
  acc_vect( 120) <= x"000000000000000000";
  acc_vect( 121) <= x"000000000000000000";
  acc_vect( 122) <= x"000000000000000000";
  acc_vect( 123) <= x"11F0009F5C00000034";
  acc_vect( 124) <= x"000000000000000000";
  acc_vect( 125) <= x"000000000000000000";
  acc_vect( 126) <= x"000000000000000000";
  acc_vect( 127) <= x"000000000000000000";
  acc_vect( 128) <= x"1000009F5800009F5C";
  acc_vect( 129) <= x"000000000000000000";
  acc_vect( 130) <= x"10000031C8000035E4";
  acc_vect( 131) <= x"000000000000000000";
  acc_vect( 132) <= x"000000000000000000";
  acc_vect( 133) <= x"000000000000000000";
  acc_vect( 134) <= x"000000000000000000";
  acc_vect( 135) <= x"11F0009F5800009F5C";
  acc_vect( 136) <= x"000000000000000000";
  acc_vect( 137) <= x"000000000000000000";
  acc_vect( 138) <= x"000000000000000000";
  acc_vect( 139) <= x"000000000000000000";
  acc_vect( 140) <= x"000000000000000000";
  acc_vect( 141) <= x"000000000000000000";
  acc_vect( 142) <= x"1000009F5800009F5C";
  acc_vect( 143) <= x"000000000000000000";
  acc_vect( 144) <= x"000000000000000000";
  acc_vect( 145) <= x"000000000000000000";
  acc_vect( 146) <= x"1000009F5C00000034";
  acc_vect( 147) <= x"000000000000000000";
  acc_vect( 148) <= x"000000000000000000";
  acc_vect( 149) <= x"000000000000000000";
  acc_vect( 150) <= x"000000000000000000";
  acc_vect( 151) <= x"11F0007AF400000034";
  acc_vect( 152) <= x"000000000000000000";
  acc_vect( 153) <= x"000000000000000000";
  acc_vect( 154) <= x"1000009F6000003202";
  acc_vect( 155) <= x"000000000000000000";
  acc_vect( 156) <= x"000000000000000000";
  acc_vect( 157) <= x"1000009F6400009F7C";
  acc_vect( 158) <= x"000000000000000000";
  acc_vect( 159) <= x"1000009F6800000000";
  acc_vect( 160) <= x"000000000000000000";
  acc_vect( 161) <= x"1000009F6C00000000";
  acc_vect( 162) <= x"000000000000000000";
  acc_vect( 163) <= x"1000009F7000000000";
  acc_vect( 164) <= x"000000000000000000";
  acc_vect( 165) <= x"1000009F74000031E8";
  acc_vect( 166) <= x"000000000000000000";
  acc_vect( 167) <= x"000000000000000000";
  acc_vect( 168) <= x"000000000000000000";
  acc_vect( 169) <= x"1000009F7800000000";
  acc_vect( 170) <= x"000000000000000000";
  acc_vect( 171) <= x"000000000000000000";
  acc_vect( 172) <= x"000000000000000000";
  acc_vect( 173) <= x"000000000000000000";
  acc_vect( 174) <= x"000000000000000000";
  acc_vect( 175) <= x"1000009F7C000002A2";
  acc_vect( 176) <= x"000000000000000000";
  acc_vect( 177) <= x"000000000000000000";
  acc_vect( 178) <= x"000000000000000000";
  acc_vect( 179) <= x"000000000000000000";
  acc_vect( 180) <= x"1000009F8000009F84";
  acc_vect( 181) <= x"10000004880000C448";
  acc_vect( 182) <= x"000000000000000000";
  acc_vect( 183) <= x"11F000C44800007AF8";
  acc_vect( 184) <= x"000000000000000000";
  acc_vect( 185) <= x"000000000000000000";
  acc_vect( 186) <= x"000000000000000000";
  acc_vect( 187) <= x"11F0009F8000009F84";
  acc_vect( 188) <= x"000000000000000000";
  acc_vect( 189) <= x"11F0009F7C000002AA";
  acc_vect( 190) <= x"000000000000000000";
  acc_vect( 191) <= x"000000000000000000";
  acc_vect( 192) <= x"000000000000000000";
  acc_vect( 193) <= x"000000000000000000";
  acc_vect( 194) <= x"000000000000000000";
  acc_vect( 195) <= x"100000321C000030E4";
  acc_vect( 196) <= x"100000322000007AE8";
  acc_vect( 197) <= x"100000322400009CB8";
  acc_vect( 198) <= x"000000000000000000";
  acc_vect( 199) <= x"000000000000000000";
  acc_vect( 200) <= x"000000000000000000";

end tb;
