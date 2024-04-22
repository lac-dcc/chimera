--
-- MSX1 FPGA project
--
-- Copyright (c) 2016 - Fabio Belavenuto
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
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
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
-- You are responsible for any legal issues arising from your use of this code.
--
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- CTRL_CNT  0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36

-- ADC_CS_n -------------|_________________________________________________|-----------------------------------------------
--                              1     2     3     4     5     6     7     8    ... 17uS pause for sampling
-- ADC_CLK  ___________________|-|___|-|___|-|___|-|___|-|___|-|___|-|___|-|_______________________________________________

-- ADC_DATA                 D7    D6    D5    D4    D3    D2    D1    D0  
--                          5     7     9     11    13    15    17    19
-- DATA_OUT  z  z  z  z  z  z  z  z  z  z  z  z  z  z  z  z  z  z  z  OUT z  z  z  z  z  z  z  z  z  z  z  z  z  z  z  z  z

entity tlc549 is 
	generic (
		frequency_g			: integer := 24;			-- input freq (in MHz)
		sample_cycles_g	: integer := 28			-- total count of 1mhz cycles to sample data
	);
	port (
		clock_i	 		: in  std_logic;
		reset_i	 		: in  std_logic;
		clock_o			: out std_logic;
		data_o		 	: out std_logic_vector(7 downto 0)	:= "00000000";
		adc_data_i		: in  std_logic;
		adc_cs_n_o	 	: out std_logic							:= '1';
		adc_clk_o	  	: out std_logic							:= '0'
	);
end entity;

architecture rtl of tlc549 is 

	signal clk_1m_s			: std_logic								:= '0';
	signal ad_data_shift_s	: std_logic_vector(7 downto 0)	:= "00000000"; 
	signal adc_clk_out_s		: std_logic								:= '0';
	signal adc_cs_n_out_s	: std_logic								:= '1';

begin 

	-- 2 mhz clock from input clock (default to 24 mhz)
	process (clock_i, reset_i)
		variable cnt_v		: integer range 0 to frequency_g := 0;
		constant half_c	: integer := frequency_g / 2;
		constant full_c	: integer := frequency_g;
	begin
		if reset_i = '1' then 
			clk_1m_s <= '0';
			cnt_v    := 0;
		elsif rising_edge(clock_i) then 
			cnt_v := cnt_v + 1;
			if (cnt_v <= half_c) then
				clk_1m_s <= '1';
			else 
				clk_1m_s <= '0';
			end if;

			-- reset counter on frequency cycles
			if (cnt_v = full_c) then
				cnt_v := 0;
			end if;
		end if;
	end process;

	clock_o    <= clk_1m_s;
	adc_clk_o  <= adc_clk_out_s;
	adc_cs_n_o <= adc_cs_n_out_s;

	-- AD signal generation for sampling / reading
	process (clk_1m_s, reset_i)
		variable cnt_v : integer range 0 to sample_cycles_g := 0;
	begin
		if reset_i = '1' then			
			cnt_v          := 0;
			adc_clk_out_s  <= '0';
			adc_cs_n_out_s <= '1';
		elsif rising_edge(clk_1m_s) then
			cnt_v          := cnt_v + 1;
			adc_cs_n_out_s <= '1';
			adc_clk_out_s  <= '0';
			-- ad cs_n
			if (cnt_v >= 4 and cnt_v <= 20) then 
				adc_cs_n_out_s <= '0';
			end if;

			-- ad clk
			if (cnt_v = 6 or cnt_v = 8 or cnt_v = 10 or cnt_v = 12 or cnt_v = 14 or cnt_v = 16 or cnt_v = 18 or cnt_v = 20) then 
				adc_clk_out_s <= '1';
			end if;

			-- reset counter 
			if (cnt_v = sample_cycles_g) then
				cnt_v := 0;
			end if;
		end if;
	end process;

	-- sampling data from adc
	process (adc_clk_out_s, reset_i)
	begin
		if reset_i = '1' then
			ad_data_shift_s <= "00000000";
		elsif rising_edge(adc_clk_out_s) then
			ad_data_shift_s <= ad_data_shift_s(6 downto 0) & adc_data_i;
		end if;
	end process;

	-- reading data from adc
	process (adc_cs_n_out_s)
	begin
		if rising_edge(adc_cs_n_out_s) then
			data_o <= ad_data_shift_s;
		end if;	
	end process;

end architecture;