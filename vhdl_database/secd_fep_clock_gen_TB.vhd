-------------------------------------------------------------------------------
--
-- Title       : Test Bench for clock_gen
-- Design      : secd
-- Author      : Hans Hübner
-- Company     : .
--
-------------------------------------------------------------------------------
--
-- File        : H:\fpga\secd\fep\clock_gen_TB.vhd
-- Generated   : 05.07.2006, 13:58
-- From        : h:\fpga\secd\vhdl\clock_gen.vhd
-- By          : Active-HDL Built-in Test Bench Generator ver. 1.2s
--
-------------------------------------------------------------------------------
--
-- Description : Automatically generated Test Bench for clock_gen_tb
--
-------------------------------------------------------------------------------

library ieee;
use work.secd_defs.all;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity clock_gen_tb is
end clock_gen_tb;

architecture TB_ARCHITECTURE of clock_gen_tb is
	-- Component declaration of the tested unit
	component clock_gen
	port(
		reset : in std_logic;
		clk : in std_logic;
		alu_ins : in std_logic;
		ram_busy : in std_logic;
		phi_read : out std_logic;
		phi_alu : out std_logic;
		phi_write : out std_logic;
		phi_next : out std_logic;
		stop : in std_logic;
		stopped : out std_logic );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal reset : std_logic;
	signal clk : std_logic;
	signal alu_ins : std_logic;
	signal ram_busy : std_logic;
	signal stop : std_logic;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal phi_read : std_logic;
	signal phi_alu : std_logic;
	signal phi_write : std_logic;
	signal phi_next : std_logic;
	signal stopped : std_logic;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : clock_gen
		port map (
			reset => reset,
			clk => clk,
			alu_ins => alu_ins,
			ram_busy => ram_busy,
			phi_read => phi_read,
			phi_alu => phi_alu,
			phi_write => phi_write,
			phi_next => phi_next,
			stop => stop,
			stopped => stopped
		);

	-- Add your stimulus here ...

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_clock_gen of clock_gen_tb is
	for TB_ARCHITECTURE
		for UUT : clock_gen
			use entity work.clock_gen(my_clock_gen);
		end for;
	end for;
end TESTBENCH_FOR_clock_gen;

