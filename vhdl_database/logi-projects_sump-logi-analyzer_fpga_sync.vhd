----------------------------------------------------------------------------------
-- sync.vhd
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
-- Details: http://www.sump.org/projects/analyzer/
--
-- Synchronizes input with clock on rising or falling edge and does some
-- optional preprocessing. (Noise filter and demux.)
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sync is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           clock : in  STD_LOGIC;
           enableFilter : in  STD_LOGIC;
           enableDemux : in  STD_LOGIC;
           falling : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end sync;

architecture Behavioral of sync is

	COMPONENT demux
	PORT(
		input : IN std_logic_vector(15 downto 0);
		input180 : IN std_logic_vector(15 downto 0);
		clock : IN std_logic;
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT filter
	PORT(
		input : IN std_logic_vector(31 downto 0);
		input180 : IN std_logic_vector(31 downto 0);
		clock : IN std_logic;
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal filteredInput, demuxedInput, synchronizedInput, synchronizedInput180: std_logic_vector (31 downto 0);

begin
	Inst_demux: demux PORT MAP(
		input => synchronizedInput(15 downto 0),
		input180 => synchronizedInput180(15 downto 0),
		clock => clock,
		output => demuxedInput
	);

	Inst_filter: filter PORT MAP(
		input => synchronizedInput,
		input180 => synchronizedInput180,
		clock => clock,
		output => filteredInput
	);

	-- synch input guarantees use of iob ff on spartan 3 (as filter and demux do)
	process (clock)
	begin
		if rising_edge(clock) then
			synchronizedInput <= input;
		end if;
		if falling_edge(clock) then
			synchronizedInput180 <= input;
		end if;
	end process;

	-- add another pipeline step for input selector to not decrease maximum clock rate
	process (clock) 
	begin
		if rising_edge(clock) then
			if enableDemux = '1' then
				output <= demuxedInput;
			else
				if enableFilter = '1' then
					output <= filteredInput;
				else
					if falling = '1' then
						output <= synchronizedInput180;
					else
						output <= synchronizedInput;
					end if;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

