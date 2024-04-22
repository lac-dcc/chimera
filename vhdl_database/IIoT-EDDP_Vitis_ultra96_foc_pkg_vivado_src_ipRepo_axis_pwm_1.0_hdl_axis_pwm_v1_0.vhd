-- The 3-Clause BSD License
-- 
-- SPDX short identifier: BSD-3-Clause
-- 
-- Copyright 2016-2017 Trenz Electronic GmbH
-- 
-- Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
-- 
-- 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
-- 
-- 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
-- 
-- 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.MATH_REAL.ALL;
library UNIMACRO;
use UNIMACRO.vcomponents.all;
--------------------------------------------------------------------------------
entity axis_pwm_v1_0 is
generic (
	C_IN_TYPE				: integer range 0 to 1	:= 0;	-- 0 - Serial, 1 - Parallel
	C_DATA_BITS				: integer	:= 16;
	C_TYPE					: integer range 0 to 1	:= 1;	-- 0 - Unipolar, 1 - Bipolar
	C_DEADTIME_SYCLES		: integer	:= 0;
	C_CHANNELS				: integer	:= 1;
	C_CLK_FREQ				: integer	:= 100000000;
	C_PWM_FREQ				: integer	:= 20000;
	C_S_AXIS_TDEST_WIDTH	: integer	:= 2;
	C_S_AXIS_TDATA_WIDTH	: integer	:= 32
);
port (
	-- Output
	pwm					: out STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
	pwm_l				: out STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
	pwm_h				: out STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
	-- AXIS
	s_axis_aclk			: in  STD_LOGIC;
	s_axis_aresetn		: in  STD_LOGIC;
	s_axis_tready		: out STD_LOGIC;
	s_axis_tdata		: in  STD_LOGIC_VECTOR(C_S_AXIS_TDATA_WIDTH-1 downto 0);
	s_axis_tdest		: in  STD_LOGIC_VECTOR(C_S_AXIS_TDEST_WIDTH-1 downto 0);
	s_axis_tvalid		: in  STD_LOGIC
);
end axis_pwm_v1_0;
--------------------------------------------------------------------------------
architecture arch_imp of axis_pwm_v1_0 is
--------------------------------------------------------------------------------
constant C_MULT_WIDTH		: INTEGER range 1 to 18	:= C_DATA_BITS + 2;
constant C_MULT_LATENCY		: INTEGER range 2 to 4	:= 3;
constant C_MULT_I			: INTEGER := INTEGER(REAL(C_CLK_FREQ)/REAL(C_PWM_FREQ));
signal scale_coeff			: STD_LOGIC_VECTOR(C_MULT_WIDTH-1 downto 0) := STD_LOGIC_VECTOR(TO_SIGNED(C_MULT_I,C_MULT_WIDTH));

type data_type is array (C_CHANNELS-1 downto 0) of SIGNED(C_DATA_BITS-1 downto 0);
signal in_data_s			: data_type := (others => (others => '0'));
type mult_data_type is array (C_CHANNELS-1 downto 0) of STD_LOGIC_VECTOR(C_MULT_WIDTH-1 downto 0);
signal mult_a		 		: mult_data_type;
type mult_res_type is array (C_CHANNELS-1 downto 0) of STD_LOGIC_VECTOR(C_MULT_WIDTH*2-1 downto 0);
signal mult_p				: mult_res_type;
type ext_data_type is array (C_CHANNELS-1 downto 0) of SIGNED(C_MULT_WIDTH-1 downto 0);
signal mult_res				: ext_data_type;
signal h_start, h_end, l_end, l_start	: ext_data_type := (others => (others => '0'));

signal pwm_cnt				: SIGNED(C_MULT_WIDTH-1 downto 0) := (others => '0');
signal pwm_l_drv			: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0) := (others => '0');
signal pwm_h_drv			: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0) := (others => '0');
signal low_cycle			: STD_LOGIC := '0';
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
s_axis_tready	<= '1';

serial_in_gen: if C_IN_TYPE = 0 generate
begin
	process(s_axis_aclk)
	begin
		if(s_axis_aclk = '1' and s_axis_aclk'event)then
			if(s_axis_tvalid = '1')then
				in_data_s(TO_INTEGER(SIGNED(s_axis_tdest)))	<= SIGNED(s_axis_tdata(C_DATA_BITS-1 downto 0));
			end if;
		end if;
	end process;
end generate;

parallel_in_gen: if C_IN_TYPE = 1 generate
begin
	process(s_axis_aclk)
	begin
		if(s_axis_aclk = '1' and s_axis_aclk'event)then
			if(s_axis_tvalid = '1')then
				for i in 0 to C_CHANNELS-1 loop
					in_data_s(i)	<= SIGNED(s_axis_tdata(i*C_DATA_BITS+C_DATA_BITS-1 downto i*C_DATA_BITS));
				end loop;
			end if;
		end if;
	end process;
end generate;
--------------------------------------------------------------------------------
process(s_axis_aclk)
begin
	if(s_axis_aclk = '1' and s_axis_aclk'event)then
		for i in 0 to C_CHANNELS-1 loop
			mult_a(i)	<= STD_LOGIC_VECTOR(resize(in_data_s(i),C_MULT_WIDTH) + TO_SIGNED(2**(C_DATA_BITS-1)-1,C_MULT_WIDTH));
		end loop;
	end if;
end process;

mult_gen: for i in 0 to C_CHANNELS-1 generate
begin
	MULT_MACRO_inst : MULT_MACRO
	generic map (
		LATENCY		=> C_MULT_LATENCY,
		WIDTH_A		=> C_MULT_WIDTH,
		WIDTH_B		=> C_MULT_WIDTH
	)          
	port map (
		P			=> mult_p(i),
		A 			=> mult_a(i),
		B 			=> scale_coeff,
		CE 			=> '1',
		CLK 		=> s_axis_aclk,
		RST 		=> '0'
	);
	
	mult_res(i)		<= SIGNED(mult_p(i)(C_MULT_WIDTH*2-3 downto C_MULT_WIDTH-2));

end generate;
--------------------------------------------------------------------------------
process(s_axis_aclk)
begin
	if(s_axis_aclk = '1' and s_axis_aclk'event)then
		if(pwm_cnt >= TO_SIGNED(C_CLK_FREQ/C_PWM_FREQ,C_MULT_WIDTH))then
			pwm_cnt		<= TO_SIGNED(1,C_MULT_WIDTH);
		else
			pwm_cnt		<= pwm_cnt + 1;
		end if;
	end if;
end process;

unipolar_gen: if C_TYPE = 0 generate
begin
	process(s_axis_aclk)
	begin
		if(s_axis_aclk = '1' and s_axis_aclk'event)then
			for i in 0 to C_CHANNELS-1 loop
				if(pwm_cnt >= mult_res(i))then
					pwm(i)	<= '0';
				else
					pwm(i)	<= '1';
				end if;
			end loop;
		end if;
	end process;
	pwm_l	<= (others => '0');
	pwm_h	<= (others => '0');
end generate;
--------------------------------------------------------------------------------
bipolar_gen: if C_TYPE = 1 generate
begin
	process(s_axis_aclk)
	begin
		if(s_axis_aclk = '1' and s_axis_aclk'event)then
			for i in 0 to C_CHANNELS-1 loop
				if(pwm_cnt >= TO_SIGNED((C_CLK_FREQ/C_PWM_FREQ),C_MULT_WIDTH))then	-- Last cycle
					-- Calculate settings for next PWM period
					if(mult_res(i) > TO_SIGNED(C_DEADTIME_SYCLES,C_MULT_WIDTH))then					-- We can make nowmal High pulse ?
						h_start(i)	<= TO_SIGNED((C_DEADTIME_SYCLES/2),C_MULT_WIDTH); 					-- Start of High Pulse
						h_end(i)	<= mult_res(i) - TO_SIGNED((C_DEADTIME_SYCLES/2),C_MULT_WIDTH);		-- End of Hihg pulse
					else
						h_start(i)	<= TO_SIGNED((C_CLK_FREQ/C_PWM_FREQ+1),C_MULT_WIDTH);			-- Out of range - newer happens
						h_end(i)	<= TO_SIGNED((C_CLK_FREQ/C_PWM_FREQ+1),C_MULT_WIDTH);			-- Out of range - newer happens
					end if;
					l_start(i)	<= mult_res(i) + TO_SIGNED((C_DEADTIME_SYCLES/2),C_MULT_WIDTH);		-- Start of Low pulse
					l_end(i)	<= TO_SIGNED(C_CLK_FREQ/C_PWM_FREQ,C_MULT_WIDTH) - TO_SIGNED((C_DEADTIME_SYCLES/2),C_MULT_WIDTH);	-- End of Low pulse
				end if;
				
				if(pwm_cnt = h_start(i))then				-- Start of High
					pwm_h_drv(i)		<= '1';
					pwm_l_drv(i)		<= '0';
				end if;

				if(pwm_cnt = h_end(i))then					-- End of High
					pwm_h_drv(i)		<= '0';
					pwm_l_drv(i)		<= '0';
				end if;
				
				if(pwm_cnt = l_start(i))then				-- Start of Low
					pwm_h_drv(i)		<= '0';
					pwm_l_drv(i)		<= '1';
				end if;
				
				if(pwm_cnt = l_end(i))then					-- Start of Low
					pwm_h_drv(i)		<= '0';
					pwm_l_drv(i)		<= '0';
				end if;
			
			end loop;
		end if;
	end process;
	
	pwm_h	<= pwm_h_drv;
	pwm_l	<= pwm_l_drv;
	pwm		<= (others => '0');
end generate;
--------------------------------------------------------------------------------
end arch_imp;
