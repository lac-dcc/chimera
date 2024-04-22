----------------------------------------------------------------------------------
-- test_core_simple.vhd
--
-- Copyright (C) 2006 Michael Poppitz
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
--
----------------------------------------------------------------------------------
--
-- Details: http://sump.org/projects/analyzer/
--
-- Test bench for core.
-- Checks sampling with simple trigger.
--
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY test_core_simple_vhd IS
END test_core_simple_vhd;

ARCHITECTURE behavior OF test_core_simple_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT core
	PORT(
		clock : IN std_logic;
		extReset : IN std_logic;
		cmd : IN std_logic_vector(39 downto 0);
		execute : IN std_logic;
		input : IN std_logic_vector(31 downto 0);
		inputClock : IN std_logic;
		outputBusy : IN std_logic;
		memoryIn : IN std_logic_vector(31 downto 0);          
		sampleReady50 : OUT std_logic;
		output : OUT std_logic_vector(31 downto 0);
		outputSend : OUT std_logic;
		memoryOut : OUT std_logic_vector(31 downto 0);
		memoryRead : OUT std_logic;
		memoryWrite : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL clock :  std_logic := '0';
	SIGNAL extReset :  std_logic := '0';
	SIGNAL execute :  std_logic := '0';
	SIGNAL inputClock :  std_logic := '0';
	SIGNAL outputBusy :  std_logic := '0';
	SIGNAL cmd :  std_logic_vector(39 downto 0) := (others=>'0');
	SIGNAL input :  std_logic_vector(31 downto 0) := (others=>'0');
	SIGNAL memoryIn :  std_logic_vector(31 downto 0) := (others=>'0');

	--Outputs
	SIGNAL sampleReady50 :  std_logic;
	SIGNAL output :  std_logic_vector(31 downto 0);
	SIGNAL outputSend :  std_logic;
	SIGNAL memoryOut :  std_logic_vector(31 downto 0);
	SIGNAL memoryRead :  std_logic;
	SIGNAL memoryWrite :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: core PORT MAP(
		clock => clock,
		extReset => extReset,
		cmd => cmd,
		execute => execute,
		input => input,
		inputClock => inputClock,
		sampleReady50 => sampleReady50,
		output => output,
		outputSend => outputSend,
		outputBusy => outputBusy,
		memoryIn => memoryIn,
		memoryOut => memoryOut,
		memoryRead => memoryRead,
		memoryWrite => memoryWrite
	);

	-- generate 100MHz clock
	process
	begin
		clock <= not clock;
		wait for 5 ns;
	end process;
	
	-- generate test pattern (counter) on input
	process(clock)
	begin
		if rising_edge(clock) then
			input <= input + 1;
		end if;
	end process;
	
	-- simulate read out (one cycle busy after send)
	process(clock)
	begin
		if rising_edge(clock) then
			outputBusy <= outputSend;
		end if;
	end process;
	
	-- perform test
	process(clock)
		variable state : integer := 0;
	begin
		if rising_edge(clock) then
			execute <= '0';
			state := state + 1;
			case state is
				when  4 => cmd <= x"0000000000"; execute <= '1'; -- reset
				
				when  8 => cmd <= x"000000FFC0"; execute <= '1'; -- set trigger mask FF
				when 12 => cmd <= x"00000052C1"; execute <= '1'; -- set trigger value 42
				when 14 => cmd <= x"00000000C2"; execute <= '1'; -- set trigger config (par, 0 delay)

				when 18 => cmd <= x"000000FFC4"; execute <= '1'; -- set trigger mask FF
				when 22 => cmd <= x"00000058C5"; execute <= '1'; -- set trigger value 48
				when 26 => cmd <= x"00010000C6"; execute <= '1'; -- set trigger config (par, 0 delay)

				when 30 => cmd <= x"000000FFC8"; execute <= '1'; -- set trigger mask FF
				when 34 => cmd <= x"0000005EC9"; execute <= '1'; -- set trigger value 54
				when 38 => cmd <= x"00020000CA"; execute <= '1'; -- set trigger config (par, 0 delay)

				when 42 => cmd <= x"0000FFFFCC"; execute <= '1'; -- set trigger mask FF
				when 46 => cmd <= x"00000FF0CD"; execute <= '1'; -- set trigger value 60
				when 50 => cmd <= x"0C330000CE"; execute <= '1'; -- set trigger config (ser, 0 delay)

				when 54 => cmd <= x"0000000080"; execute <= '1'; -- set divider 0
				when 58 => cmd <= x"0000000181"; execute <= '1'; -- issue set read & delay 2*4 & 1*4
				when 62 => cmd <= x"0000000082"; execute <= '1'; -- set flags (default mode)

				when 66 => cmd <= x"0000000001"; execute <= '1'; -- run
				when others =>
			end case;
		end if;
	end process;

END;
