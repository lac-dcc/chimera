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

-- test name tests/dctest39h_writepath_accvari8
--   how to execute
--   run simulation
--   diff cpu01.acc tests/dctest39h_writepath_accvari8/cpu01.acc_ex
-- 
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
   signal cpuid_for_print : std_logic;

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

-- for mem0 : dcache_ram
--   use configuration work.dcache_ram_sim;
-- for mem1 : dcache_ram
--   use configuration work.dcache_ram_sim;

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
      lock0 <= acc_vect(acc_vect_pt)(65) and cpu0en;
      a0.en <= acc_vect(acc_vect_pt)(68) and cpu0en;
      a0.wr <= acc_vect(acc_vect_pt)(64) and cpu0en;
      a0.we <= acc_vect(acc_vect_pt)(63 downto 60);
      a0.d  <= acc_vect(acc_vect_pt)(31 downto  0);

      a1.a  <= x"0" &
               acc_vect(acc_vect_pt)(59 downto 32);
      lock1 <= acc_vect(acc_vect_pt)(65) and cpu1en;
      a1.en <= acc_vect(acc_vect_pt)(68) and cpu1en;
      a1.wr <= acc_vect(acc_vect_pt)(64) and cpu1en;
      a1.we <= acc_vect(acc_vect_pt)(63 downto 60);
      a1.d  <= acc_vect(acc_vect_pt)(31 downto  0);

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
     if (acksp_pointer_this = b"110" & x"67") then -- 0x667 (dec 1639)
       acksp_pointer_this :=  b"001" & x"c1";      -- 0x1c1 (dec  449)
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
    file f0 : text is out "cpu01.acc";
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
      write(     l, not(y0.ack));
      -- write line --------------
      writeline(f0, l);
      deallocate(l);
    elsif(y1.ack = '1') then
      hwrite(     l, a1.a );   write(l, string'(" "));
      if(a1.wr = '1') then
           hwrite(l, a1.d );   write(l, string'(" "));
      else hwrite(l, y1.d );   write(l, string'(" "));
      end if;
      write(     l, a1.wr );  write(l, string'(" "));
      write(     l, y1.ack);
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
    elsif(sa0.en = '1') then
      hwrite(l2, sa0.al & '0' );
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
  acc_vect(   0) <= x"000000000000000000";
  acc_vect(   1) <= x"000000000000000000";
-- cpu1 read data area 
-- CPU0 write hit -> CPU1 read potential hit
  acc_vect(   2) <= x"3000000100A5A5A5A5";
  acc_vect(   3) <= x"1000000100A5A5A5A5";
  acc_vect(   4) <= x"11F00001040104FFFF";
  acc_vect(   5) <= x"11F000010801081111";
  acc_vect(   6) <= x"11F000010C010C1111";
  acc_vect(   7) <= x"30000001040104FFFF";
  acc_vect(   8) <= x"000000000000000000";
  acc_vect(   9) <= x"000000000000000000";
  acc_vect(  10) <= x"000000000000000000";
  acc_vect(  11) <= x"000000000000000000";
  acc_vect(  12) <= x"000000000000000000";
-- CPU0 write miss -> CPU1 read potential hit
  acc_vect(  13) <= x"3000000120A5A5A5A5";
  acc_vect(  14) <= x"11F00001240124EEEE";
  acc_vect(  15) <= x"1000002100A5A5A5A5";
  acc_vect(  16) <= x"30000001240124EEEE";
  acc_vect(  17) <= x"000000000000000000";
  acc_vect(  18) <= x"000000000000000000";
  acc_vect(  19) <= x"000000000000000000";
  acc_vect(  20) <= x"000000000000000000";
  acc_vect(  21) <= x"000000000000000000";
  acc_vect(  22) <= x"000000000000000000";
-- CPU0 write hit -> CPU1 read miss
  acc_vect(  23) <= x"1000000140A5A5A5A5";
  acc_vect(  24) <= x"11F00001440144DDDD";
  acc_vect(  25) <= x"11F000014801481111";
  acc_vect(  26) <= x"11F000014C014C1111";
  acc_vect(  27) <= x"30000001440144DDDD";
  acc_vect(  28) <= x"000000000000000000";
  acc_vect(  29) <= x"000000000000000000";
  acc_vect(  30) <= x"000000000000000000";
-- CPU0 write miss -> CPU1 read miss
  acc_vect(  31) <= x"11F00001680168FFFF";
  acc_vect(  32) <= x"1000000100A5A5A5A5";
  acc_vect(  33) <= x"30000001680168FFFF";
  acc_vect(  34) <= x"000000000000000000";
  acc_vect(  35) <= x"000000000000000000";
  acc_vect(  36) <= x"000000000000000000";
-- CPU0 write hit -> CPU1 write potential hit
  acc_vect(  37) <= x"3000000180A5A5A5A5";
  acc_vect(  38) <= x"1000000180A5A5A5A5";
  acc_vect(  39) <= x"11F00001840184FFFF";
  acc_vect(  40) <= x"11F000018801881111";
  acc_vect(  41) <= x"11F000018C018C1111";
  acc_vect(  42) <= x"31F00001880E110123";
  acc_vect(  43) <= x"30000001840184FFFF";
  acc_vect(  44) <= x"30000001880E110123";
  acc_vect(  45) <= x"000000000000000000";
  acc_vect(  46) <= x"000000000000000000";
  acc_vect(  47) <= x"000000000000000000";
  acc_vect(  48) <= x"000000000000000000";
  acc_vect(  49) <= x"000000000000000000";
  acc_vect(  50) <= x"000000000000000000";
  acc_vect(  51) <= x"000000000000000000";
  acc_vect(  52) <= x"000000000000000000";
  acc_vect(  53) <= x"000000000000000000";
-- CPU0 write hit -> CPU1 write miss
  acc_vect(  54) <= x"10000001A0A5A5A5A5";
  acc_vect(  55) <= x"11F00001A401A4EEEE";
  acc_vect(  56) <= x"11F00001A801A81111";
  acc_vect(  57) <= x"11F00001AC01AC1111";
  acc_vect(  58) <= x"31F00001BC01BC2345";
  acc_vect(  59) <= x"30000001A401A4EEEE";
  acc_vect(  60) <= x"30000001BC01BC2345";
  acc_vect(  61) <= x"000000000000000000";
  acc_vect(  62) <= x"000000000000000000";
  acc_vect(  63) <= x"000000000000000000";
  acc_vect(  64) <= x"000000000000000000";
-- CPU0 write miss -> CPU1 write miss
  acc_vect(  65) <= x"11F00001C001C00123";
  acc_vect(  66) <= x"31F00001D001D04567";
  acc_vect(  67) <= x"30000001C001C00123";
  acc_vect(  68) <= x"30000001D001D04567";
  acc_vect(  69) <= x"000000000000000000";
  acc_vect(  70) <= x"000000000000000000";
  acc_vect(  71) <= x"000000000000000000";
  acc_vect(  72) <= x"000000000000000000";
-- ping-pong dummy pattern 
  acc_vect(  73) <= x"11F000100012345678";
  acc_vect(  74) <= x"11F000300000000000";
  acc_vect(  75) <= x"11F000100012345678";
  acc_vect(  76) <= x"11F000300000000000";
  acc_vect(  77) <= x"11F000100012345678";
  acc_vect(  78) <= x"11F000300000000000";
  acc_vect(  79) <= x"11F000100012345678";
--
  restgen : for i in 1 to 100 generate
    acc_vect(  78 + 2 * i) <= x"11F000300000000000";
    acc_vect(  79 + 2 * i) <= x"11F000100012345678";
  end generate;

end tb;
