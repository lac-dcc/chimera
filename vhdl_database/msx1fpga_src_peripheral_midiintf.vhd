-------------------------------------------------------------------------------
--
-- MSX1 FPGA project
--
-- Copyright (c) 2016, Fabio Belavenuto (belavenuto@gmail.com)
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
-- MIDI UART TX interface
-- Custom by FBLabs
-- Ports:
-- 0 = Control (W) / Status (R)
--     b7 = Int flag(R)
--     b1 = Busy flag
--     b0 = Int enable(R/W)
--     
-- 1 = Data (W)
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity midiIntf is
	port (
		clock_i			: in    std_logic;
		reset_i			: in    std_logic;
		addr_i			: in    std_logic;
		cs_n_i			: in    std_logic;
		wr_n_i			: in    std_logic;
		rd_n_i			: in    std_logic;
		data_i			: in    std_logic_vector(7 downto 0);
		data_o			: out   std_logic_vector(7 downto 0);
		has_data_o		: out   std_logic;
		-- Outs
		int_n_o			: out   std_logic;
		wait_n_o			: out   std_logic;
		tx_o				: out   std_logic
	);
end entity;

architecture rtl of midiIntf is

	type states is (stIdle, stClear, stStart, stData, stStop);
	signal enable_s		: std_logic;
	signal port0_r_s		: std_logic;
	signal port1_w_s		: std_logic;
	signal ff_q				: std_logic;
	signal ff_clr_s		: std_logic;
	signal start_s			: std_logic;
	signal status_s		: std_logic_vector( 7 downto 0);
	signal databuf_q		: std_logic_vector( 7 downto 0);
	signal busy_s			: std_logic;
	signal int_en_q		: std_logic;
	signal int_n_s			: std_logic;
	signal wait_n_s		: std_logic;
	signal baudr_cnt_q	: integer range 0 to 256;
	signal bit_cnt_q		: integer range 0 to 8;
	signal intcnt_q		: unsigned(15 downto 0);
	signal state_s			: states;
	signal shift_q			: std_logic_vector( 7 downto 0);
	signal tx_s				: std_logic;

begin

	enable_s		<= '1' when cs_n_i = '0' and (wr_n_i = '0' or rd_n_i = '0')	else '0';

	port0_r_s	<= '1' when enable_s = '1' and addr_i = '0' and rd_n_i = '0'	else '0';
	port1_w_s	<= '1' when enable_s = '1' and addr_i = '1' and wr_n_i = '0'	else '0';

	-- Port reading
	has_data_o	<= port0_r_s;

	data_o <=	status_s	when port0_r_s = '1'								else
					(others => '1');

	busy_s	<= '1' when state_s /= stIdle	else '0';
	status_s <= not int_n_s & "00000" & busy_s & int_en_q;

	-- Control port, interrupt count and int flag clear
	process (reset_i, clock_i)
	begin
		if reset_i = '1' then
			int_en_q <= '0';
			intcnt_q	<= (others => '0');
			int_n_s	<= '1';
		elsif rising_edge(clock_i) then
			if int_en_q = '0' then
				intcnt_q <= (others => '0');
				int_n_s <= '1';
			elsif intcnt_q = 40000 then			-- 200 Hz, 5ms
				intcnt_q <= (others => '0');
				int_n_s <= '0';
			else
				intcnt_q <= intcnt_q + 1;
			end if;

			if enable_s = '1' and addr_i = '0' and wr_n_i = '0'  then
				int_en_q	<= data_i(0);
				int_n_s	<= '1';
			end if;
		end if;
	end process;

	-- Acess TX detection
	-- flip-flop
	process(ff_clr_s, clock_i)
	begin
		if reset_i = '1' or ff_clr_s = '1' then
			ff_q	<= '0';
		elsif rising_edge(clock_i) then
			ff_q	<= start_s;
		end if;
	end process;

	-- Write port 1
	process (reset_i, ff_clr_s, port1_w_s)
	begin
		if reset_i = '1' or ff_clr_s = '1' then
			databuf_q	<= (others => '0');
			start_s		<= '0';
		elsif rising_edge(port1_w_s) then
			if wr_n_i = '0' then
				databuf_q	<= data_i;
				start_s		<= '1';
			end if;
		end if;
	end process;

	-- Serial TX
	process(reset_i, clock_i)
		variable edge_v	: std_logic_vector(1 downto 0);
	begin		
		if reset_i = '1' then
			baudr_cnt_q <= 0;
			shift_q		<= (others => '1');
			bit_cnt_q	<= 0;
			tx_s			<= '1';
			wait_n_s		<= '1';
			state_s		<= stIdle;
		elsif rising_edge(clock_i) then

			if start_s = '1' and state_s /= stIdle then
				wait_n_s	<= '0';
			end if;

			case state_s is
				when stIdle =>
					if ff_q = '1' then
						shift_q		<= databuf_q;
						bit_cnt_q	<= 0;
						baudr_cnt_q	<= 0;
						state_s		<= stClear;
						ff_clr_s		<= '1';
						wait_n_s		<= '1';
					end if;

				when stClear =>
					ff_clr_s		<= '0';
					state_s		<= stStart;

				when stStart =>
					tx_s		<= '0';						-- Start bit
					if baudr_cnt_q = 255 then
						baudr_cnt_q <= 0;
						state_s		<= stData;
					else
						baudr_cnt_q <= baudr_cnt_q + 1;
					end if;

				when stData =>
					tx_s	<= shift_q(0);
					if baudr_cnt_q = 255 then
						baudr_cnt_q <= 0;
						shift_q	<= '1' & shift_q(7 downto 1);
						if bit_cnt_q = 7 then
							state_s		<= stStop;
						else
							bit_cnt_q <= bit_cnt_q + 1;
						end if;
					else
						baudr_cnt_q <= baudr_cnt_q + 1;
					end if;

				when stStop =>
					tx_s		<= '1';							-- Stop bit
					if baudr_cnt_q = 255 then
						baudr_cnt_q <= 0;
						state_s		<= stIdle;
					else
						baudr_cnt_q <= baudr_cnt_q + 1;
					end if;

			end case;

		end if;
	end process;

	int_n_o	<= int_n_s;
	wait_n_o	<= wait_n_s;
	tx_o		<= not tx_s;

end architecture;
