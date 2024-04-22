----------------------------------------------------------------------------------
-- sram.vhd
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
-- Simple SRAM interface.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sram is
    Port (
		clock : in  STD_LOGIC;
		output : out std_logic_vector(31 downto 0);          
		input : in std_logic_vector(31 downto 0);          
		read : in std_logic; 
		write : in std_logic; 
		ramIO1 : INOUT std_logic_vector(15 downto 0);
		ramIO2 : INOUT std_logic_vector(15 downto 0);      
		ramA : OUT std_logic_vector(17 downto 0);
		ramWE : OUT std_logic;
		ramOE : OUT std_logic;
		ramCE1 : OUT std_logic;
		ramUB1 : OUT std_logic;
		ramLB1 : OUT std_logic;
		ramCE2 : OUT std_logic;
		ramUB2 : OUT std_logic;
		ramLB2 : OUT std_logic
	);
end sram;

architecture Behavioral of sram is

signal address : std_logic_vector (17 downto 0);

begin
	-- static memory configuration 
	ramCE1 <= not '1';
	ramUB1 <= not '1';
	ramLB1 <= not '1';
	ramCE2 <= not '1';
	ramUB2 <= not '1';
	ramLB2 <= not '1';

	-- assign signals
	ramA <= address;
	ramWE <= not write;
	ramOE <= not (not write);
   output <= ramIO2 & ramIO1;
	
	-- memory io interface state controller
	process(write, input)
	begin
		if write = '1' then
			ramIO1 <= input(15 downto 0);
			ramIO2 <= input(31 downto 16);
		else
			ramIO1 <= (others => 'Z');
			ramIO2 <= (others => 'Z');
		end if;
	end process;
	
	-- memory address controller
	process(clock)
	begin
		if rising_edge(clock) then
			if write = '1' then
				address <= address + 1;
			elsif read = '1' then
				address <= address - 1;
			end if;
		end if;
	end process;


end Behavioral;

