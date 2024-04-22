-------------------------------------------------------------------------------
--
-- Title       : Test Bench for clock_synthesis
-- Design      : secd
-- Author      : Hans Hübner
-- Company     : .
--
-------------------------------------------------------------------------------
--
-- File        : H:\fpga\secd\fep\clock_synthesis_TB.vhd
-- Generated   : 05.07.2006, 08:38
-- From        : h:\fpga\secd\fep\clock_synthesis.vhd
-- By          : Active-HDL Built-in Test Bench Generator ver. 1.2s
--
-------------------------------------------------------------------------------
--
-- Description : Automatically generated Test Bench for clock_synthesis_tb
--
-------------------------------------------------------------------------------

library ieee,unisim;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use unisim.vcomponents.all;

-- Add your library and packages declaration here ...

entity clock_synthesis_tb is
end clock_synthesis_tb;

architecture TB_ARCHITECTURE of clock_synthesis_tb is
  -- Component declaration of the tested unit
  component clock_synthesis
    port(
      clk_30mhz : in std_logic;
      vdu_clk : out std_logic;
      cpu_clk : out std_logic;
      locked : out std_logic );
  end component;

  -- Stimulus signals - signals mapped to the input and inout ports of tested entity
  signal clk_30mhz : std_logic;
  -- Observed signals - signals mapped to the output ports of tested entity
  signal vdu_clk : std_logic;
  signal cpu_clk : std_logic;
  signal locked : std_logic;

  -- Add your code here ...

begin

  -- Unit Under Test port map
  UUT : clock_synthesis
    port map (
      clk_30mhz => clk_30mhz,
      vdu_clk => vdu_clk,
      cpu_clk => cpu_clk,
      locked => locked
      );

  -- Add your stimulus here ...

  clock_stimulus : process
  begin
    clk_30mhz <= '1';
    wait for 16.65 ns;
    clk_30mhz <= '0';
    wait for 16.65 ns;
  end process;



end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_clock_synthesis of clock_synthesis_tb is
  for TB_ARCHITECTURE
    for UUT : clock_synthesis
      use entity work.clock_synthesis(behavioral);
    end for;
  end for;
end TESTBENCH_FOR_clock_synthesis;

