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
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;
library UNIMACRO;
use UNIMACRO.vcomponents.all;
--------------------------------------------------------------------------------
entity axis_encoder_v1_0 is
generic (
	C_CPR					: integer	:= 5000;
	C_CLK_FREQ				: integer	:= 100000000;
	C_OUT_PERIOD			: integer	:= 64;
	C_FILTER_WIDTH			: integer	:= 32;
	C_M_AXIS_TDATA_WIDTH	: integer	:= 16;
	C_ANGLE_AXIS			: boolean	:= FALSE;
	C_PERIOD_AXIS			: boolean	:= FALSE;
	C_RPM_AXIS				: boolean	:= FALSE;
	C_INVERS_DIR            : boolean	:= FALSE;
	C_USE_SHIFT				: boolean	:= FALSE
);
port (
	angle_shift				: in  STD_LOGIC_VECTOR(15 downto 0);
	-- Encoder signals
	A						: in  STD_LOGIC;
	B						: in  STD_LOGIC;
	I						: in  STD_LOGIC;
	-- Raw output
	angle_data				: out STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	period_data				: out STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	rpm_data				: out STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	-- AXIS
	axis_aclk				: in  STD_LOGIC;
	axis_aresetn			: in  STD_LOGIC;

	m_period_tvalid			: out STD_LOGIC;
	m_period_tdata			: out STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	m_period_tready			: in  STD_LOGIC;
	
	m_angle_tvalid			: out STD_LOGIC;
	m_angle_tdata			: out STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	m_angle_tready			: in  STD_LOGIC;
	
	m_rpm_tvalid			: out STD_LOGIC;
	m_rpm_tdata				: out STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	m_rpm_tready			: in  STD_LOGIC
);
end axis_encoder_v1_0;
--------------------------------------------------------------------------------
architecture arch_imp of axis_encoder_v1_0 is
--------------------------------------------------------------------------------
signal a_i				: STD_LOGIC;
signal b_i				: STD_LOGIC;
signal i_i				: STD_LOGIC;
signal a_f				: STD_LOGIC;
signal b_f				: STD_LOGIC;
signal i_f				: STD_LOGIC;
signal filter_a_cnt		: integer range 0 to C_FILTER_WIDTH-1 := 0;
signal filter_b_cnt		: integer range 0 to C_FILTER_WIDTH-1 := 0;
signal filter_i_cnt		: integer range 0 to C_FILTER_WIDTH-1 := 0;
signal a_sr				: STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
signal cnt				: SIGNED(C_M_AXIS_TDATA_WIDTH-1 downto 0) := (others => '0');	-- 13 bit is enough for max 5000 CPR
signal update			: STD_LOGIC;
--signal update_p			: STD_LOGIC;

constant C_MULT_WIDTH		: INTEGER range 1 to 18	:= 16;
constant C_MULT_LATENCY		: INTEGER range 2 to 4	:= 3;
constant C_SYS_LATENCY		: INTEGER := 5;
constant C_MAX_PERIOD		: UNSIGNED(31 downto 0) := TO_UNSIGNED(((2**(32-1))-1),32);
-- constant C_MULT_I			: INTEGER := INTEGER(REAL(2**C_DATA_BITS)/sqrt(3.0));

signal mult_res				: SIGNED(C_MULT_WIDTH-1 downto 0);
signal mult_p				: STD_LOGIC_VECTOR(C_MULT_WIDTH*2-1 downto 0);
signal mult_a				: STD_LOGIC_VECTOR(C_MULT_WIDTH-1 downto 0);
signal mult_b				: STD_LOGIC_VECTOR(C_MULT_WIDTH-1 downto 0);
signal reset				: STD_LOGIC;
signal period_cnt			: UNSIGNED(31 downto 0);
signal period_value			: UNSIGNED(31 downto 0);
signal period_prev			: UNSIGNED(31 downto 0);
--signal period_sr			: STD_LOGIC_VECTOR(C_SYS_LATENCY-1 downto 0);

signal sim_cnt				: UNSIGNED(15 downto 0);
signal cpr_cnt				: UNSIGNED(15 downto 0);

--signal period_update		: STD_LOGIC;
signal divider				: UNSIGNED(31 downto 0);
signal div_value			: UNSIGNED(31 downto 0);
signal div_cnt				: SIGNED(15 downto 0);
signal angle_correction		: SIGNED(15 downto 0);
signal corr_angle			: SIGNED(15 downto 0);
signal clip_up_angle		: SIGNED(15 downto 0);
signal clip_down_angle		: SIGNED(15 downto 0);
signal dp_valid				: STD_LOGIC_VECTOR(3 downto 0);
--signal div_end_sr			: STD_LOGIC_VECTOR(1 downto 0);
signal rpm_data_i			: SIGNED(15 downto 0);
signal out_period_cnt		: integer range 0 to C_OUT_PERIOD-1;
signal C_DIR                : STD_LOGIC;
signal period_dir			: STD_LOGIC;

type sm_state_type is (ST_START, ST_DIVISION);
signal sm_state				: sm_state_type := ST_START;
---------------------------------------------------------------------------------
attribute mark_debug	: string;
attribute keep 			: string;
---------------------------------------------------------------------------------
-- attribute keep of divider				: signal is "true";
-- attribute mark_debug of divider			: signal is "true";
-- attribute keep of div_value				: signal is "true";
-- attribute mark_debug of div_value		: signal is "true";
-- attribute keep of div_cnt				: signal is "true";
-- attribute mark_debug of div_cnt			: signal is "true";
-- attribute keep of period_value			: signal is "true";
-- attribute mark_debug of period_value	: signal is "true";

---------------------------------------------------------------------------------

--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
C_DIR   <= '0' when C_INVERS_DIR = FALSE else '1';

process(axis_aclk)
begin
	if(axis_aclk = '1' and axis_aclk'event)then
		-- Input signals
		a_i		<= A;
		b_i		<= B;
		i_i		<= I;
	end if;
end process;

process(axis_aclk)
begin
	if(axis_aclk = '1' and axis_aclk'event)then
		-- Filters
		if(a_i = '1')then
			if(filter_a_cnt /= (C_FILTER_WIDTH-1))then
				filter_a_cnt	<= filter_a_cnt + 1;
			end if;
		else
			if(filter_a_cnt /= 0)then
				filter_a_cnt	<= filter_a_cnt - 1;
			end if;
		end if;

		if(b_i = '1')then
			if(filter_b_cnt /= (C_FILTER_WIDTH-1))then
				filter_b_cnt	<= filter_b_cnt + 1;
			end if;
		else
			if(filter_b_cnt /= 0)then
				filter_b_cnt	<= filter_b_cnt - 1;
			end if;
		end if;

		if(i_i = '1')then
			if(filter_i_cnt /= (C_FILTER_WIDTH-1))then
				filter_i_cnt	<= filter_i_cnt + 1;
			end if;
		else
			if(filter_i_cnt /= 0)then
				filter_i_cnt	<= filter_i_cnt - 1;
			end if;
		end if;
		-- Filter results
		if(filter_a_cnt < (C_FILTER_WIDTH/2))then
			a_f		<= '0';
		else
			a_f		<= '1';
		end if;
		
		if(filter_b_cnt < (C_FILTER_WIDTH/2))then
			b_f		<= '0';
		else
			b_f		<= '1';
		end if;
		
		if(filter_i_cnt < (C_FILTER_WIDTH/2))then
			i_f		<= '0';
		else
			i_f		<= '1';
		end if;
	end if;
end process;

process(axis_aclk)
begin
	if(axis_aclk = '1' and axis_aclk'event)then
		if(a_sr = "01")then				-- Rising edge of A
			if(b_f = C_DIR)then			-- A leads B = CW
				period_dir		<= '0';
			else						-- B leads A = CCW
				period_dir		<= '1';
			end if;
			--period_update		<= '1';
			m_period_tvalid		<= '1';
			period_prev			<= period_value;
			period_value		<= period_cnt;
			period_cnt			<= (others => '0');
		else
			if(period_cnt < C_MAX_PERIOD)then
				if(period_cnt > period_prev)then
					period_value	<= period_cnt;
					m_period_tvalid	<= '1';
				else
					m_period_tvalid	<= '0';
				end if;
				period_cnt		<= period_cnt + 1;
			else
				m_period_tvalid		<= '0';
			end if;
		end if;
	end if;
end process;

m_period_tdata	<= STD_LOGIC_VECTOR(period_value(15 downto 0));
period_data		<= STD_LOGIC_VECTOR(period_value(15 downto 0));

process(axis_aclk)
begin
	if(axis_aclk = '1' and axis_aclk'event)then
		case sm_state is
			when ST_START =>
				if(period_value /= TO_UNSIGNED(0,16))then
					div_value	<= x"005B_8D80";	-- CLK_FREQ * 60 / CPR
					div_cnt		<= (others => '0');
					divider		<= period_value;
					sm_state	<= ST_DIVISION;
				else	-- Error
					rpm_data_i	<= (others => '0');
				end if;
			when ST_DIVISION =>
				if(div_value < divider)then		-- End of division
					rpm_data_i		<= div_cnt;
					sm_state		<= ST_START;
				else
					div_value		<= div_value - divider;
					if(period_dir = '1')then
						div_cnt		<= div_cnt + 1;
					else
						div_cnt		<= div_cnt - 1;
					end if;
				end if;
		end case;
	end if;
end process;

rpm_data	<= STD_LOGIC_VECTOR(rpm_data_i);

process(axis_aclk)
begin
	if(axis_aclk = '1' and axis_aclk'event)then
		if(out_period_cnt = C_OUT_PERIOD-1)then
			out_period_cnt	<= 0;
			m_rpm_tvalid	<= '1';
			m_rpm_tdata		<= STD_LOGIC_VECTOR(rpm_data_i);
		else
			m_rpm_tvalid	<= '0';
			out_period_cnt	<= out_period_cnt + 1;
		end if;
	end if;
end process;

reset		<= not axis_aresetn;

process(axis_aclk)
begin
	if(axis_aclk = '1' and axis_aclk'event)then
		-- Shift register
		a_sr		<= a_sr(0) & a_f;
		-- Counter control
		if(a_sr = "01")then				-- Rising edge of A
			update		<= '1';
			if(i_f = '1')then					-- Index pulse
				cnt		<= (others => '0');		-- Reset counter
			else
				if(b_f = C_DIR)then				-- A leads B = CW
					if(cnt = TO_SIGNED((C_CPR-1),C_M_AXIS_TDATA_WIDTH))then
						cnt		<= (others => '0');
					else
						cnt		<= cnt + 1;
					end if;
				else							-- B leads A = CCW
					if(cnt = TO_SIGNED(0,C_M_AXIS_TDATA_WIDTH))then
						cnt		<= TO_SIGNED((C_CPR-1),C_M_AXIS_TDATA_WIDTH);
					else
						cnt		<= cnt - 1;
					end if;
				end if;
			end if;
		else								-- No edge
			update			<= '0';
		end if;
	end if;
end process;

process(axis_aclk)
begin
	if(axis_aclk = '1' and axis_aclk'event)then
		if(C_USE_SHIFT = TRUE)then
			angle_correction	<= SIGNED(angle_shift);
		else
			angle_correction	<= TO_SIGNED(0,16);
		end if;
		
		if(update = '1')then
			corr_angle		<= cnt - angle_correction;
			dp_valid		<= dp_valid(2 downto 0) & '1';
		else
			dp_valid		<= dp_valid(2 downto 0) & '0';
		end if;
		
		if(corr_angle >= TO_SIGNED(C_CPR,16))then
			clip_up_angle		<= corr_angle - TO_SIGNED(C_CPR,16);
		else
			clip_up_angle		<= corr_angle;
		end if;

		if(clip_up_angle < TO_SIGNED(0,16))then
			clip_down_angle		<= clip_up_angle + TO_SIGNED(C_CPR,16);
		else
			clip_down_angle		<= clip_up_angle;
		end if;
		
		-- Outputs
		if(dp_valid(3) = '1')then
			m_angle_tdata	<= STD_LOGIC_VECTOR(clip_down_angle);
			angle_data		<= STD_LOGIC_VECTOR(clip_down_angle);
			m_angle_tvalid	<= '1';
		else
			m_angle_tvalid	<= '0';
		end if;
	end if;
end process;
--------------------------------------------------------------------------------
end arch_imp;
