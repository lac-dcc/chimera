--*********************************************
-- Listing A.2
--*********************************************
library ieee;
use ieee.std_logic_1164.all;
entity counter_inst is
   port(
      clk, reset: in  std_logic;
      load16, en16, syn_clr16: in std_logic;
      d: in std_logic_vector(15 downto 0);
      max_tick8, max_tick16: out std_logic;
      q: out std_logic_vector(15 downto 0)
   );
end counter_inst;

architecture structure_arch of counter_inst is
begin
   -- instantiation of 16-bit counter, all ports used
   counter_16_unit: entity work.bin_counter(demo_arch)
      generic map(N=>16)
      port map(clk=>clk, reset=>reset,
               load=>load16, en=>en16, syn_clr=>syn_clr16,
               d=>d, max_tick=>max_tick16, q=>q);
   -- instantiation of free-running 8-bit counter
   -- with only the max_tick signal
   counter_8_unit: entity work.bin_counter
      port map(clk=>clk, reset=>reset,
               load=>'0', en=>'1', syn_clr=>'0',
               d=>"00000000", max_tick=>max_tick8, q=>open);
end structure_arch;
