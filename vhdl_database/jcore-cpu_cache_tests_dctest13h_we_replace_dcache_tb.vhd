library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;

use work.cache_pack.all;
use work.cpu2j0_pack.all;
use work.data_bus_pack.all;

entity dcache_tb is
end dcache_tb;

architecture tb of dcache_tb is

type acc_vect_t is array (0 to 2047)  of std_logic_vector( 67 downto 0);
type ddr_ram_t  is array (0 to 2**14-1)  of std_logic_vector( 31 downto 0);

   signal rst   : std_logic;
   signal rst_46nsdel   : std_logic;
   signal clk125   : std_logic;
   signal clk200   : std_logic;

   signal a     : cpu_data_o_t;
   signal y     : cpu_data_i_t;
   signal ra    : dcache_ram_o_t;
   signal ry    : dcache_ram_i_t;
   signal ma    : mem_i_t;
   signal my    : mem_o_t;
   signal ctrl :  cache_ctrl_t;
   signal my_1delay : mem_o_t;
   signal ma_rdy_1wait_sig : std_logic;

   signal cavec  : std_logic_vector( 67 downto 0 );

   signal acc_vect : acc_vect_t;
   signal ddr_ram  : ddr_ram_t := ( others => x"A5A5A5A5" );
   signal ack_pointer_thisc : std_logic_vector(10 downto 0);
   signal ack_pointer_thisr : std_logic_vector(10 downto 0);
   signal mis_counter_thisc : std_logic_vector(10 downto 0);
   signal mis_counter_thisr : std_logic_vector(10 downto 0);
   signal y_ack_1del_thisc : std_logic;
   signal y_ack_1del_thisr : std_logic;
begin

  --
  rst <= '1', '0' after 15 ns;
  rst_46nsdel <= rst after 46 ns;
  clk125 <= '0' after 4   ns when clk125 = '1' else '1' after 4   ns;
  clk200 <= '0' after 2.5 ns when clk200 = '1' else '1' after 2.5 ns;

-- .+....1....+....1....+....1....+....1....+....1....+....1....+....1....+....1
  dut : dcache     port map ( rst => rst,
    clk125 => clk125, clk200 => clk200, a => a,
    y => y,           ra => ra,         ry => ry,
    ma => ma,         my => my ,        ctrl => ctrl,
    lock => '0',      sa => NULL_SNOOP_IO );
  mem : dcache_ram port map ( rst => rst, clk125 => clk125, 
    clk200 => clk200, ra => ry, ry => ra );

-- .+....1....+....1....+....1....+....1....+....1....+....1....+....1....+....1
  -- cache on/off selection
  -- --------------------------------------------------------------------------
  ctrl.en <= '1'; -- cache on
--  ctrl.en <= '0'; -- cache off
  -- --------------------------------------------------------------------------
  ctrl.inv <= '0';

  valid_rest : process( ack_pointer_thisr, y_ack_1del_thisr, rst_46nsdel)
  begin
    if(y_ack_1del_thisr = '1') and
      (ack_pointer_thisr(2 downto 0) = b"111") then
      a.a  <= x"0aaaaaa0";
      a.en <= '0';
      a.wr <= '0';
      a.we <= x"0";
      a.d  <= x"00000000";
    else
      a.a  <= x"0" &
              acc_vect(vtoi(ack_pointer_thisr))(59 downto 32);
      a.en <= not rst_46nsdel;
      a.wr <= acc_vect(vtoi(ack_pointer_thisr))(64);
      a.we <= acc_vect(vtoi(ack_pointer_thisr))(63 downto 60);
      a.d  <= acc_vect(vtoi(ack_pointer_thisr))(31 downto  0);
    end if;
  end process;

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

  ackfsm : process(ack_pointer_thisr, mis_counter_thisr, y_ack_1del_thisr, y.ack, my.av, ma.ack )
   variable ack_pointer_this : std_logic_vector(10 downto 0);
   variable mis_counter_this : std_logic_vector(10 downto 0);
   variable y_ack_1del_this  : std_logic;
  begin
   ack_pointer_this := ack_pointer_thisr;
   mis_counter_this := mis_counter_thisr;
   y_ack_1del_this  := y_ack_1del_thisr;

   if(y.ack = '1') then
     ack_pointer_this := std_logic_vector(unsigned(ack_pointer_this) + 1);
   end if;
   if((my.av = '1') and (ma.ack = '1')) then
     mis_counter_this := std_logic_vector(unsigned(mis_counter_this) + 1);
   end if;
   y_ack_1del_this := y.ack;

   ack_pointer_thisc <= ack_pointer_this;
   mis_counter_thisc <= mis_counter_this;
   y_ack_1del_thisc  <= y_ack_1del_this ;
  end process;

  p0_r0_125fsm : process(clk125, rst)
  begin
     if rst = '1' then
        ack_pointer_thisr <= b"000" & x"00";
        y_ack_1del_thisr  <= '0';
     elsif clk125 = '1' and clk125'event then
        ack_pointer_thisr <= ack_pointer_thisc;
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
   ddr_ram(   56) <= x"20212223";
   ddr_ram(   57) <= x"24252627";
   ddr_ram(   58) <= x"28292a2b";
   ddr_ram(   59) <= x"2c2d2e2f";
   ddr_ram(   60) <= x"30313233";
   ddr_ram(   61) <= x"34353637";
   ddr_ram(   62) <= x"38393a3b";
   ddr_ram(   63) <= x"3c3d3e3f";
   --
   ddr_ram(   64) <= x"20212223";
   ddr_ram(   65) <= x"24252627";
   ddr_ram(   66) <= x"28292a2b";
   ddr_ram(   67) <= x"2c2d2e2f";
   ddr_ram(   68) <= x"30313233";
   ddr_ram(   69) <= x"34353637";
   ddr_ram(   70) <= x"38393a3b";
   ddr_ram(   71) <= x"3c3d3e3f";
   --
   ddr_ram(   72) <= x"20212223";
   ddr_ram(   73) <= x"24252627";
   ddr_ram(   74) <= x"28292a2b";
   ddr_ram(   75) <= x"2c2d2e2f";
   ddr_ram(   76) <= x"30313233";
   ddr_ram(   77) <= x"34353637";
   ddr_ram(   78) <= x"38393a3b";
   ddr_ram(   79) <= x"3c3d3e3f";
   --
   ddr_ram( 2104) <= x"40414243";
   ddr_ram( 2105) <= x"44454647";
   ddr_ram( 2106) <= x"48494a4b";
   ddr_ram( 2107) <= x"4c4d4e4f";
   ddr_ram( 2108) <= x"50515253";
   ddr_ram( 2109) <= x"54555657";
   ddr_ram( 2110) <= x"58595a5b";
   ddr_ram( 2111) <= x"5c5d5e5f";
   --
   ddr_ram( 2112) <= x"40414243";
   ddr_ram( 2113) <= x"44454647";
   ddr_ram( 2114) <= x"48494a4b";
   ddr_ram( 2115) <= x"4c4d4e4f";
   ddr_ram( 2116) <= x"50515253";
   ddr_ram( 2117) <= x"54555657";
   ddr_ram( 2118) <= x"58595a5b";
   ddr_ram( 2119) <= x"5c5d5e5f";
   --
   ddr_ram( 2120) <= x"40414243";
   ddr_ram( 2121) <= x"44454647";
   ddr_ram( 2122) <= x"48494a4b";
   ddr_ram( 2123) <= x"4c4d4e4f";
   ddr_ram( 2124) <= x"50515253";
   ddr_ram( 2125) <= x"54555657";
   ddr_ram( 2126) <= x"58595a5b";
   ddr_ram( 2126) <= x"5c5d5e5f";
   --
   ddr_ram(  108) <= x"00000100";
   ddr_ram(  109) <= x"000012e0";
   ddr_ram(  110) <= x"000015a0";
   ddr_ram(  111) <= x"00001910";
   ddr_ram(  112) <= x"00001be0";
   ddr_ram(  113) <= x"00002090";
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
    file f0 : text is out "cpu.acc";
    variable l : line;
  begin

    wait for 1 ns;
    if(y.ack = '1') then
      hwrite(     l, a.a );   write(l, string'(" "));
      if(a.wr = '1') then
           hwrite(l, a.d );   write(l, string'(" "));
      else hwrite(l, y.d );   write(l, string'(" "));
      end if;
       write(     l, a.wr );  write(l, string'(" "));
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

  -- vector           ww
  --                  re  adr    data
  --                  |||_____||______|
  -- prepare hit entry
  --
-- cpu_sim load/store first 50 times
-- initialize finish
  --
  acc_vect( 000) <= x"1400000F1898A8B8C";
  acc_vect( 001) <= x"0000000FC3C3D3E3F"; -- read 32B, 1byte ref's store
  acc_vect( 002) <= x"0000000F838393A3B";
  acc_vect( 003) <= x"0000000F434353637";
  acc_vect( 004) <= x"0000000F0308A3233";
  acc_vect( 005) <= x"0000000EC2C2D2E2F";
  acc_vect( 006) <= x"0000000E828292A2B";
  acc_vect( 007) <= x"0000000E424252627";
  acc_vect( 008) <= x"0000000E020212223";
  acc_vect( 009) <= x"1300020FEAAAABBBB";
  --
  acc_vect( 010) <= x"0000020FC5C5DBBBB";
  acc_vect( 011) <= x"0000020F858595A5B";
  acc_vect( 012) <= x"0000020F454555657";
  acc_vect( 013) <= x"0000020F050515253";
  acc_vect( 014) <= x"0000020EC4C4D4E4F";
  acc_vect( 015) <= x"0000020E848494A4B";
  acc_vect( 016) <= x"0000020E444454647";
  acc_vect( 017) <= x"0000020E040414243";
  acc_vect( 018) <= x"1F00003E000000018";
  acc_vect( 019) <= x"1F00003E000000019";
  --
  acc_vect( 020) <= x"0000000FC3C3D3E3F"; --  cache miss, read from main memory
  acc_vect( 021) <= x"0000000F838393A3B";
  acc_vect( 022) <= x"0000000F434353637";
  acc_vect( 023) <= x"0000000F0308A3233";
  acc_vect( 024) <= x"0000000EC2C2D2E2F";
  acc_vect( 025) <= x"0000000E828292A2B";
  acc_vect( 026) <= x"0000000E424252627";
  acc_vect( 027) <= x"0000000E020212223";
  acc_vect( 028) <= x"1F00003E000000019";
  acc_vect( 029) <= x"1F00003E000000029";
  --
  acc_vect( 030) <= x"0000020FC5C5DBBBB"; --  cache miss, read from main memory
  acc_vect( 031) <= x"0000020F858595A5B";
  acc_vect( 032) <= x"0000020F454555657";
  acc_vect( 033) <= x"0000020F050515253";
  acc_vect( 034) <= x"0000020EC4C4D4E4F";
  acc_vect( 035) <= x"0000020E848494A4B";
  acc_vect( 036) <= x"0000020E444454647";
  acc_vect( 037) <= x"0000020E040414243";
  acc_vect( 038) <= x"1F00003E000000038";
  acc_vect( 039) <= x"1F00003E000000039";
  --
  acc_vect( 040) <= x"1F00000E011111111";
  acc_vect( 041) <= x"0000000FC3C3D3E3F"; -- read 32B, 1byte ref's store
  acc_vect( 042) <= x"0000000F838393A3B";
  acc_vect( 043) <= x"0000000F434353637";
  acc_vect( 044) <= x"0000000F0308A3233";
  acc_vect( 045) <= x"0000000EC2C2D2E2F";
  acc_vect( 046) <= x"0000000E828292A2B";
  acc_vect( 047) <= x"0000000E424252627";
  acc_vect( 048) <= x"0000000E011111111";
  acc_vect( 049) <= x"1F00020FC77777777";
  --
  acc_vect( 050) <= x"0000020FC77777777";
  acc_vect( 051) <= x"0000020F858595A5B";
  acc_vect( 052) <= x"0000020F454555657";
  acc_vect( 053) <= x"0000020F050515253";
  acc_vect( 054) <= x"0000020EC4C4D4E4F";
  acc_vect( 055) <= x"0000020E848494A4B";
  acc_vect( 056) <= x"0000020E444454647";
  acc_vect( 057) <= x"0000020E040414243";
  acc_vect( 058) <= x"1F00003E000000018";
  acc_vect( 059) <= x"1F00003E000000019";
  --
  -- vector           ww
  --                  re  adr    data
  --                  |||_____||______|
  acc_vect( 060) <= x"0000000FC3C3D3E3F"; --  cache miss, read from main memory
  acc_vect( 061) <= x"0000000F838393A3B";
  acc_vect( 062) <= x"0000000F434353637";
  acc_vect( 063) <= x"0000000F0308A3233";
  acc_vect( 064) <= x"0000000EC2C2D2E2F";
  acc_vect( 065) <= x"0000000E828292A2B";
  acc_vect( 066) <= x"0000000E424252627";
  acc_vect( 067) <= x"0000000E011111111";
  acc_vect( 068) <= x"1F00003E000000019";
  acc_vect( 069) <= x"1F00003E000000029";
  --
  acc_vect( 070) <= x"0000020FC77777777"; --  cache miss, read from main memory
  acc_vect( 071) <= x"0000020F858595A5B";
  acc_vect( 072) <= x"0000020F454555657";
  acc_vect( 073) <= x"0000020F050515253";
  acc_vect( 074) <= x"0000020EC4C4D4E4F";
  acc_vect( 075) <= x"0000020E848494A4B";
  acc_vect( 076) <= x"0000020E444454647";
  acc_vect( 077) <= x"0000020E040414243";
  acc_vect( 078) <= x"1F00003E000000038";
  acc_vect( 079) <= x"1F00003E000000039";
  --
  -- vector           ww
  --                  re  adr    data
  --                  |||_____||______|
  acc_vect( 080) <= x"1100020E300000000"; -- store hit
  acc_vect( 081) <= x"1300020E60000FFFF";
  acc_vect( 082) <= x"1F00020EC20150218";
  acc_vect( 083) <= x"1F00003E000000083";
  acc_vect( 084) <= x"0000020E040414200"; -- read hit
  acc_vect( 085) <= x"0000020E44445FFFF";
  acc_vect( 086) <= x"0000020EC20150218";
  acc_vect( 087) <= x"0000000E424252627"; -- read miss, 20E0 is replaced out
  acc_vect( 088) <= x"0000020E340414200"; -- read hit
  acc_vect( 089) <= x"0000020E64445FFFF";
  --
  acc_vect( 090) <= x"0000020EC20150218";
  acc_vect( 091) <= x"1F00003E000000091";
  acc_vect( 092) <= x"1F00003E000000092";
  acc_vect( 093) <= x"1F00003E000000093";
  acc_vect( 094) <= x"1F00003E000000094";
  acc_vect( 095) <= x"1F00003E000000095";
  acc_vect( 096) <= x"1F00003E000000096";
  acc_vect( 097) <= x"1F00003E000000097";
  acc_vect( 098) <= x"1F00003E000000098";
  acc_vect( 099) <= x"1F00003E000000099";
  --
  acc_vect( 100) <= x"1F00003E000000100";
  acc_vect( 101) <= x"1F00003E000000101";
  acc_vect( 102) <= x"1F00003E000000102";
  acc_vect( 103) <= x"1F00003E000000103";
  acc_vect( 104) <= x"1F00003E000000104";
  acc_vect( 105) <= x"1F00003E000000105";
  acc_vect( 106) <= x"1F00003E000000106";
  acc_vect( 107) <= x"1F00003E000000107";
  acc_vect( 108) <= x"1F00003E000000108";
  acc_vect( 109) <= x"1F00003E000000109";
  --
  acc_vect( 110) <= x"1F00003E000000110";
  acc_vect( 111) <= x"1F00003E000000111";
  acc_vect( 112) <= x"1F00003E000000112";
  acc_vect( 113) <= x"1F00003E000000113";
  acc_vect( 114) <= x"1F00003E000000114";
  acc_vect( 115) <= x"1F00003E000000115";
  acc_vect( 116) <= x"1F00003E000000116";
  acc_vect( 117) <= x"1F00003E000000117";
  acc_vect( 118) <= x"1F00003E000000118";
  acc_vect( 119) <= x"1F00003E000000119";
  --

end tb;
