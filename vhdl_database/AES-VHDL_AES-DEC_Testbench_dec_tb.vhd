-- VHDL implementation of AES
-- Copyright (C) 2019  Hosein Hadipour

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

library ieee;
use ieee.std_logic_1164.all;

entity test_dec is 
end test_dec;

architecture behavior of test_dec is
	component aes_dec
		port(
			clk        : in  std_logic;
			rst        : in  std_logic;
			dec_key    : in  std_logic_vector(127 downto 0);
			ciphertext : in  std_logic_vector(127 downto 0);
			plaintext  : out std_logic_vector(127 downto 0);
			done       : out std_logic
		);	
	end component aes_dec;
	
	
	-- Input signals
	signal clk : std_logic := '0';
	signal rst : std_logic := '0';
	signal ciphertext : std_logic_vector(127 downto 0);
	signal dec_key : std_logic_vector(127 downto 0);
	
	-- Output signals
	signal done : std_logic;
	signal plaintext : std_logic_vector(127 downto 0);	
	
	-- Clock period definition
	constant clk_period : time := 10 ns;
	
begin
	dec_inst : component aes_dec
		port map(
			clk        => clk,
			rst        => rst,
			dec_key    => dec_key,
			ciphertext => ciphertext,
			plaintext  => plaintext,
			done       => done
		);
			
	-- clock process definitions
	clk_process : process is
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process clk_process;
	
	-- Simulation process
	sim_proc : process is
	begin
		-- Some test vectors taken from pages 215, and 216 of the main AES specification		
		--p = 3243f6a8885a308d313198a2e0370734
		--k = 2b7e151628aed2a6abf7158809cf4f3c		
		--c = 3925841d02dc09fbdc118597196a0b32
		-- Initialize Inputs
		ciphertext <= x"320b6a19978511dcfb09dc021d842539";
		dec_key <= x"a60c63b6c80c3fe18925eec9a8f914d0";
		rst <= '0';
		-- Hold reset state for one cycle		
		wait for clk_period * 1;
		rst <= '1';
		wait until done = '1';
		wait for clk_period/2;			
		if (plaintext = x"340737e0a29831318d305a88a8f64332") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;
		report "---------- Output must be: -------";
		report "340737e0a29831318d305a88a8f64332";		
		-------------------------------------------- 
		-- Initialize Inputs
		--p = 00000000000000000000000000000000
		--k = 00000000000000000000000000000000
		--c = 66E94BD4EF8A2C3B884CFA59CA342B2E		
		ciphertext <= x"2e2b34ca59fa4c883b2c8aefd44be966";
		dec_key <= x"8e188f6fcf51e92311e2923ecb5befb4";
		rst <= '0';
		-- Hold reset state for one cycle		
		wait for clk_period * 1;
		rst <= '1';
		wait until done = '1';
		wait for clk_period/2;			
		if (plaintext = x"00000000000000000000000000000000") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;
		report "---------- Output must be: -------";
		report "00000000000000000000000000000000";
		wait;
	end process sim_proc;
	
end architecture behavior;
