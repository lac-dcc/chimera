--
-- Based on Ben Eater's build of the SAP breadboard computer and his excellent videos.
-- https://eater.net/
--
-- Copyright (c) 2017 Ken Jordan
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY system_tb IS
END system_tb;

ARCHITECTURE Behavioural OF system_tb IS

--	constant C_SYSTEM_HZ:	integer := 307_200; -- master clock (in Hz)
--	constant C_TARGET_HZ:	integer := 100;
	constant C_SYSTEM_HZ:	integer := 1_000_000; -- master clock (in Hz)
	constant C_TARGET_HZ:	integer := 1_000_000;

	SIGNAL	rst		: STD_LOGIC := '0';							-- asynchronous reset
	SIGNAL	clk		: STD_LOGIC := '0';							-- CPU clock
	SIGNAL	clk_en	: STD_LOGIC := '0';							-- CPU clock enable (clock ignored if 0)

BEGIN

	-- simulation signals
	clk <= NOT clk after 5 ns;

	PROCESS
	BEGIN
		rst <= '0';
		wait for 1 ns;
		rst <= '1';
		wait for 12 ns;
		rst <= '0';
		wait;
	END PROCESS;

-- when debugging cpu (vs trace etc), then you may just want to "let it rip"
-- and then comment out process below
--	clk_en <= '1';

	PROCESS(clk, rst)
		VARIABLE count :	INTEGER RANGE 0 TO ((C_SYSTEM_HZ/C_TARGET_HZ)/2);
	BEGIN
		IF(rst = '1') THEN
			count := 0;
			clk_en <= '0';
		ELSE
			IF(rising_edge(clk)) THEN
				clk_en <= '0';
				IF(count < ((C_SYSTEM_HZ/C_TARGET_HZ)/2)) THEN
					count := count + 1;
				ELSE
					count := 0;
					clk_en <= '1';
				END IF;
			END IF;
		END IF;
	END PROCESS;

	sys: entity work.system
	generic map(
		C_SYSTEM_HZ =>	C_SYSTEM_HZ,
		C_TRACE		=>	false
	)
	port map(
		clk_i		=> clk,
		clk_en_i	=> clk_en,
		rst_i		=> rst,
		out_o		=> open,
		tx_o		=> open,
		rx_i		=> '0'
	);

END ARCHITECTURE Behavioural;