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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clocks is
	port (
		clock_master_i	: in  std_logic;				-- 21 MHz
		por_i			: in  std_logic;
		clock_3m_en_o	: out std_logic;
		clock_5m_en_o	: out std_logic;
		clock_7m_en_o	: out std_logic;
		clock_10m_en_o	: out std_logic
	);
end entity;

architecture rtl of clocks is

	-- Clocks
	signal clk1_cnt_q			: unsigned(2 downto 0)				:= (others => '0');
	signal clk2_cnt_q			: unsigned(1 downto 0)				:= (others => '0');
	signal clk3_cnt_q			: unsigned(1 downto 0)				:= (others => '0');

	signal clock_3m_en_s		: std_logic								:= '0';
	signal clock_5m_en_s		: std_logic								:= '0';
	signal clock_7m_en_s		: std_logic								:= '0';
	signal clock_10m_en_s		: std_logic								:= '0';

begin

	-- Clocks generation
	-- 3m and 10m
	process (por_i, clock_master_i)
	begin
		if por_i = '1' then
			clk1_cnt_q		<= (others => '0');
			clock_10m_en_s	<= '0';
			clock_3m_en_s	<= '0';
		elsif rising_edge(clock_master_i) then
			clock_3m_en_s	<= '0';
			if clk1_cnt_q = 0 then
				clk1_cnt_q 		<= "101";
				clock_3m_en_s	<= '1';
			else
				clk1_cnt_q <= clk1_cnt_q - 1;
			end if;
			clock_10m_en_s	<= not clock_10m_en_s;			-- VDP: 10.7 MHz
		end if;
	end process;

	-- 5m
	process (por_i, clock_master_i)
	begin
		if por_i = '1' then
			clk2_cnt_q	<= (others => '0');
			clock_5m_en_s	<= '0';
		elsif rising_edge(clock_master_i) then
			clock_5m_en_s	<= '0';
			if clk2_cnt_q = 0 then
				clock_5m_en_s <= '1';
				clk2_cnt_q <= "11";
			else
				clk2_cnt_q <= clk2_cnt_q - 1;
			end if;
		end if;
	end process;

	-- 7m
	process (por_i, clock_master_i)
	begin
		if por_i = '1' then
			clk3_cnt_q	<= (others => '0');
			clock_7m_en_s	<= '0';
		elsif rising_edge(clock_master_i) then
			clock_7m_en_s	<= '0';
			if clk3_cnt_q = 0 then
				clock_7m_en_s <= '1';
				clk3_cnt_q <= "10";
			else
				clk3_cnt_q <= clk3_cnt_q - 1;
			end if;
		end if;
	end process;

	-- Out
	clock_3m_en_o	<= clock_3m_en_s;
	clock_5m_en_o	<= clock_5m_en_s;
	clock_7m_en_o	<= clock_7m_en_s;
	clock_10m_en_o	<= clock_10m_en_s;

end architecture;