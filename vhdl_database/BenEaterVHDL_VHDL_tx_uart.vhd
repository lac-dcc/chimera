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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tx_uart is
	generic (
		C_SYSTEM_HZ: integer := 12_000_000;		-- FPGA clock in Hz
		C_BPS:	integer := 9600;					-- UART transmition rate in bits per second (aka baud)
		C_AUTOBAUD:  boolean := false
	);
	port (
		rst_i:	IN	STD_LOGIC;						-- reset
		clk_i:	IN	STD_LOGIC;						-- FPGA clock

		we_i:	IN	STD_LOGIC;						-- pulse high to send byte (when busy_o is low)
		data_i:	IN	STD_LOGIC_VECTOR(7 downto 0);	-- data to send
		
		busy_o: OUT STD_LOGIC;						-- high when UART busy transmitting
		tx_o:	OUT STD_LOGIC;						-- TX pin output
		rx_i:	IN STD_LOGIC						-- TX pin output
	);
end tx_uart;

architecture RTL of tx_uart is
	CONSTANT bits_for_clock: INTEGER := 16;
	CONSTANT clocks_per_bit: UNSIGNED(bits_for_clock-1 downto 0) := to_unsigned((C_SYSTEM_HZ / C_BPS) - 1, bits_for_clock);	-- determine number of FPGA clocks that will be one bit for UART bits per second
	SIGNAL	bps_count:		UNSIGNED(bits_for_clock-1 downto 0) := clocks_per_bit;
	SIGNAL	bps_counter:	UNSIGNED(bits_for_clock-1 downto 0) := (others => '0');
	SIGNAL	shift_out:		STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
	SIGNAL	busy_r:			STD_LOGIC := '0';

	SIGNAL	bit_ff:			STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	SIGNAL	bit_time:		UNSIGNED(bits_for_clock-1 downto 0) := (others => '0');
	SIGNAL	bit_time_count:	UNSIGNED(bits_for_clock-1 downto 0) := (others => '0');


BEGIN

PROCESS(clk_i, rst_i)
BEGIN
	if rst_i='1' then
		bps_counter <= (others => '0');
		shift_out	<= "00000000001";
	elsif rising_edge(clk_i) then
			if (busy_r = '0') then
				if (we_i = '1') then
					shift_out <= "11" & data_i & "0";	-- stop bit & data & start bit
					bps_counter <= bps_count;
				end if;
			else
				if (bps_counter = 0) then
					bps_counter <= bps_count;
					shift_out <= "0" & shift_out(10 downto 1);
				else
					bps_counter <= bps_counter - 1;
				end if;
			end if;
		end if;
END PROCESS;

busy_r	<= '1' when (shift_out /= "00000000001") else '0';
busy_o	<= busy_r OR we_i;
tx_o	<= shift_out(0);

autobaud: IF C_AUTOBAUD GENERATE
	PROCESS(clk_i, rst_i)
	BEGIN
		if rst_i='1' then
			bit_ff			<= "1111";
			bit_time		<= (others => '1');
			bit_time_count	<= (others => '0');
			bps_count		<= clocks_per_bit;
		else
			if rising_edge(clk_i) then
				bit_ff	<= bit_ff(2 downto 0) & rx_i;
				if (bit_ff(3 downto 0) = "1100") then
					bit_time_count	<= (others => '0');
				elsif (bit_ff(3 downto 0) = "0011") then
					if (bit_time_count < bit_time) then
						bit_time <= bit_time_count;
						bps_count <= bit_time_count;
					end if;
				else
					bit_time_count <= bit_time_count + 1;
				end if;
			end if;
		end if;
	END PROCESS;
END GENERATE;

END architecture RTL;
