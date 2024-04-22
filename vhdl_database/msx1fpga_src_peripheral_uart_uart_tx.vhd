-------------------------------------------------------------------------------
--
-- Copyright (c) 2019, Fabio Belavenuto (belavenuto@gmail.com)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity uart_tx is
	port (
		clock_i		: in  std_logic;
		reset_i		: in  std_logic;
		baud_i		: in  std_logic_vector(15 downto 0);
		char_len_i	: in  std_logic_vector( 1 downto 0);
		stop_bits_i	: in  std_logic;
		parity_i		: in  std_logic_vector( 1 downto 0);
		hwflux_i		: in  std_logic;
		break_i		: in  std_logic;
		data_i		: in  std_logic_vector( 7 downto 0);
		tx_empty_i	: in  std_logic;
		fifo_rd_o	: out std_logic;
		cts_n_i		: in  std_logic;
		txd_o			: out std_logic
	);
end entity;

architecture xmit of uart_tx is

	type state_t is (stIdle, stLoad, stLoad2, stStart, stData, stParity, stStop2, stStop1);
	signal state_s			: state_t;
	signal parity_cfg_s	: std_logic_vector(1 downto 0)	:= (others => '0');
	signal stop_bits_s	: std_logic								:= '0';
	signal baudr_cnt_q	: integer range 0 to 65536			:= 0;
	signal max_cnt_s		: integer range 0 to 65536			:= 0;
	signal bit_cnt_q		: integer range 0 to 9				:= 0;
	signal bitmax_s		: unsigned(3 downto 0)				:= (others => '0');
	signal bitmask_s		: std_logic_vector(2 downto 0);
	signal shift_q			: std_logic_vector(7 downto 0);
	signal tx_s				: std_logic								:= '1';
	signal datapar_s		: std_logic_vector(7 downto 0);
	signal parity_s		: std_logic;

begin

	bitmask_s	<= "000"		when char_len_i = "00"	else		-- 5 bits
						"001"		when char_len_i = "01"	else		-- 6 bits
						"011"		when char_len_i = "10"	else		-- 7 bits
						"111";												-- 8 bits

	parity_s		<= parity_cfg_s(1) xor datapar_s(7) xor datapar_s(6) xor
						datapar_s(5) xor datapar_s(4) xor datapar_s(3) xor
						datapar_s(2) xor datapar_s(1) xor datapar_s(0);

	-- Main process
	process(clock_i)
	begin
		if rising_edge(clock_i) then

			if reset_i = '1' then
				baudr_cnt_q <= 0;
				shift_q		<= (others => '1');
				tx_s			<= '1';
				bit_cnt_q	<= 0;
				state_s		<= stIdle;
			else

				fifo_rd_o	<= '0';

				case state_s is

					when stIdle =>
						if tx_empty_i = '0' then
							if hwflux_i = '0' or cts_n_i = '0' then
								fifo_rd_o	<= '1';
								state_s		<= stLoad;
							end if;
						end if;

					when stLoad =>
						baudr_cnt_q		<= 0;
						bit_cnt_q		<= 0;
						bitmax_s			<= to_unsigned(4, 4) + unsigned(char_len_i);
						max_cnt_s		<= to_integer(unsigned(baud_i));
						parity_cfg_s	<= parity_i;
						stop_bits_s		<= stop_bits_i;
						state_s			<= stLoad2;

					when stLoad2 =>
						tx_s			<= '0';								-- Start bit
						shift_q 		<= data_i;
						datapar_s(7 downto 5)	<= data_i(7 downto 5) and bitmask_s;
						datapar_s(4 downto 0)	<= data_i(4 downto 0);
						state_s		<= stStart;

					when stStart =>
						if baudr_cnt_q >= max_cnt_s then
							baudr_cnt_q <= 0;
							tx_s			<= shift_q(0);
							shift_q		<= '1' & shift_q(7 downto 1);
							state_s		<= stData;
						else
							baudr_cnt_q <= baudr_cnt_q + 1;
						end if;

					when stData =>
						if baudr_cnt_q >= max_cnt_s then
							baudr_cnt_q <= 0;
							tx_s			<= shift_q(0);
							shift_q		<= '1' & shift_q(7 downto 1);
							if bit_cnt_q >= bitmax_s then
								if parity_cfg_s /= "00" then
									tx_s			<= parity_s;
									state_s		<= stParity;
								else
									tx_s			<= '1';
									if stop_bits_s = '0' then
										state_s		<= stStop1;
									else
										state_s		<= stStop2;
									end if;
								end if;
							else
								bit_cnt_q <= bit_cnt_q + 1;
							end if;
						else
							baudr_cnt_q <= baudr_cnt_q + 1;
						end if;

					when stParity =>
						if baudr_cnt_q >= max_cnt_s then
							baudr_cnt_q <= 0;
							tx_s			<= '1';
							if stop_bits_s = '0' then
								state_s		<= stStop1;
							else
								state_s		<= stStop2;
							end if;
						else
							baudr_cnt_q <= baudr_cnt_q + 1;
						end if;

					when stStop2 =>
						if baudr_cnt_q >= max_cnt_s then
							baudr_cnt_q <= 0;
							state_s	<= stStop1;
						else
							baudr_cnt_q <= baudr_cnt_q + 1;
						end if;

					when stStop1 =>
						if baudr_cnt_q >= max_cnt_s - 3 then
							baudr_cnt_q <= 0;
							state_s	<= stIdle;
						else
							baudr_cnt_q <= baudr_cnt_q + 1;
						end if;

				end case;
			end if;
		end if;
	end process;

	txd_o 		<= tx_s and not break_i;

end architecture;