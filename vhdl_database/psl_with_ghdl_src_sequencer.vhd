-- Simple sequencer to generate waveforms for 1 bit std_logic signals
-- Inspired by SymbioticEDA's sva-demos seq module
-- https://github.com/SymbioticEDA/sva-demos/blob/master/seq.sv

library ieee;
  use ieee.std_logic_1164.all;

use work.pkg.all;


entity sequencer is
  generic (
    seq : string
  );
  port (
    clk  : in  std_logic;
    data : out std_logic
  );
end entity sequencer;


architecture rtl of sequencer is

  signal index : natural := seq'low;

begin


  process (clk) is
  begin
    if rising_edge(clk) then
      if (index < seq'high) then
        index <= index + 1;
      end if;
    end if;
  end process;

  data <= to_bit(seq(index));


end architecture rtl;
