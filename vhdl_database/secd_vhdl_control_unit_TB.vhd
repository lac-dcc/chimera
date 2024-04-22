-------------------------------------------------------------------------------
--
-- Title       : Test Bench for control_unit
-- Design      : secd
-- Author      : Hans Hübner
-- Company     : .
--
-------------------------------------------------------------------------------
--
-- File        : H:\fpga\secd\vhdl\control_unit_TB.vhd
-- Generated   : 02.07.2006, 16:06
-- From        : h:\fpga\secd\vhdl\control_unit.vhd
-- By          : Active-HDL Built-in Test Bench Generator ver. 1.2s
--
-------------------------------------------------------------------------------
--
-- Description : Automatically generated Test Bench for control_unit_tb
--
-------------------------------------------------------------------------------

library ieee;
use work.secd_defs.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

-- Add your library and packages declaration here ...

entity control_unit_tb is
end control_unit_tb;

architecture TB_ARCHITECTURE of control_unit_tb is
  -- Component declaration of the tested unit
  component control_unit
    port(
      clk : in std_logic;
      reset : in std_logic;
      phi_next : in std_logic;
      button : in std_logic;
      opcode : in std_logic_vector(8 downto 0);
      flags : in flagsunit;
      read_sel : out std_logic_vector(4 downto 0);
      write_sel : out std_logic_vector(4 downto 0);
      alu_sel : out std_logic_vector(4 downto 0);
      alu_ins : out std_logic;
      stop_instruction : out std_logic );
  end component;

  -- Stimulus signals - signals mapped to the input and inout ports of tested entity
  signal clk : std_logic;
  signal reset : std_logic;
  signal phi_next : std_logic;
  signal button : std_logic;
  signal opcode : std_logic_vector(8 downto 0);
  signal flags : flagsunit;
  -- Observed signals - signals mapped to the output ports of tested entity
  signal read_sel : std_logic_vector(4 downto 0);
  signal write_sel : std_logic_vector(4 downto 0);
  signal alu_sel : std_logic_vector(4 downto 0);
  signal alu_ins : std_logic;
  signal stop_instruction : std_logic;

  -- Add your code here ...

begin

  -- Unit Under Test port map
  UUT : control_unit
    port map (
      clk => clk,
      reset => reset,
      phi_next => phi_next,
      button => button,
      opcode => opcode,
      flags => flags,
      read_sel => read_sel,
      write_sel => write_sel,
      alu_sel => alu_sel,
      alu_ins => alu_ins,
      stop_instruction => stop_instruction
      );

  -- Add your stimulus here ...

  clock_stimulator : process
  begin
    clk <= '0';
    wait for 40 ns;
    clk <= '1';
    wait for 40 ns;
  end process;

  phi_next_stimulator : process
  begin
    wait for 500 ns;
    loop
      phi_next <= '1';
      wait for 100 ns;
      phi_next <= '0';
      wait for 300 ns;
    end loop;
  end process;

  stimulus: process
  begin
    button <= '1';
    reset <= '1';
    wait for 200 ns;
    reset <= '0';
    wait for 200 ns;
    opcode <= "000001101";
    flags <= (others => '0');
    wait;
  end process;
    
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_control_unit of control_unit_tb is
  for TB_ARCHITECTURE
    for UUT : control_unit
      use entity work.control_unit(my_control_unit);
    end for;
  end for;
end TESTBENCH_FOR_control_unit;

