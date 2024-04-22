-------------------------------------------------------------------------------
--
-- Title       : Test Bench for secd_system
-- Design      : secd
-- Author      : Hans Hübner
-- Company     : .
--
-------------------------------------------------------------------------------
--
-- File        : $DSN\src\TestBench\secd_system_TB.vhd
-- Generated   : 03.06.2006, 18:21
-- From        : h:\fpga\secd\vhdl\toplevel.vhd
-- By          : Active-HDL Built-in Test Bench Generator ver. 1.2s
--
-------------------------------------------------------------------------------
--
-- Description : Automatically generated Test Bench for secd_system_tb
--
-------------------------------------------------------------------------------

library ieee;
use work.secd_defs.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity secd_system_tb is
end secd_system_tb;

architecture TB_ARCHITECTURE of secd_system_tb is
  -- Component declaration of the tested unit
  component secd_system
    port(
      utmi_clkout : in std_logic;
      utmi_databus16_8 : out std_logic;
      reset_sw : in std_logic;
      button_sw : in std_logic;
      ram_oen : out std_logic;
      ram_cen : out std_logic;
      ram_wen : out std_logic;
      ram_io : inout std_logic_vector(15 downto 0);
      ram_a : out std_logic_vector(20 downto 0);
      ram_bhen : out std_logic;
      ram_blen : out std_logic );
  end component;

  -- Stimulus signals - signals mapped to the input and inout ports of tested entity
  signal utmi_clkout : std_logic;
  signal reset_sw : std_logic;
  signal button_sw : std_logic;
  signal ram_io : std_logic_vector(15 downto 0);
  -- Observed signals - signals mapped to the output ports of tested entity
  signal utmi_databus16_8 : std_logic;
  signal ram_oen : std_logic;
  signal ram_cen : std_logic;
  signal ram_wen : std_logic;
  signal ram_a : std_logic_vector(20 downto 0);
  signal ram_bhen : std_logic;
  signal ram_blen : std_logic;

  -- Add your code here ...

begin

  -- Unit Under Test port map
  UUT : secd_system
    port map (
      utmi_clkout => utmi_clkout,
      utmi_databus16_8 => utmi_databus16_8,
      reset_sw => reset_sw,
      button_sw => button_sw,
      ram_oen => ram_oen,
      ram_cen => ram_cen,
      ram_wen => ram_wen,
      ram_io => ram_io,
      ram_a => ram_a,
      ram_bhen => ram_bhen,
      ram_blen => ram_blen
      );

  -- Add your stimulus here ...

  start_stimulus : process
  begin
    reset_sw <= '1';
    button_sw <= '1';
    wait for 500 ns;
    reset_sw <= '0';
    wait for 500 ns;
    reset_sw <= '1';
    wait for 1000 ns;
    button_sw <= '0';
    wait for 1000 ns;
    button_sw <= '1';
    wait;
  end process;

  clock_stimulus : process
  begin
    utmi_clkout <= '1';
    wait for 100 ns;
    utmi_clkout <= '0';
    wait for 100 ns;
  end process;

end TB_ARCHITECTURE;

configuration testbench_for_secd_system of secd_system_tb is
  for TB_ARCHITECTURE
    for UUT : secd_system
      use entity work.secd_system(my_secd_system);
    end for;
  end for;
end TESTBENCH_FOR_secd_system;

