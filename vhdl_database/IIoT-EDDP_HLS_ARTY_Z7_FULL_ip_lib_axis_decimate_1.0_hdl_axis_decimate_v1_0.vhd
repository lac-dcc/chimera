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
--------------------------------------------------------------------------------
entity axis_decimate_v1_0 is
generic (
	C_TDATA_WIDTH	: integer	:= 32;
	C_TUSER_WIDTH	: integer	:= 1;
	C_USE_FIXED		: boolean	:= FALSE;
	C_FIXED_VAL		: integer	:= 16;
	C_CHANNELS		: integer	:= 4;
	C_DEC_TYPE		: integer range 0 to 1	:= 0;
	C_DATA_TYPE		: integer range 0 to 1	:= 0;
	C_REG_WIDTH		: integer	:= 32
);
port (
	decimation		: in  STD_LOGIC_VECTOR(C_REG_WIDTH-1 downto 0);

	s_axis_aclk		: in  STD_LOGIC;
	s_axis_aresetn	: in  STD_LOGIC;
	s_axis_tready	: out STD_LOGIC;
	s_axis_tdata	: in  STD_LOGIC_VECTOR(C_TDATA_WIDTH-1 downto 0);
	s_axis_tuser	: in  STD_LOGIC_VECTOR(C_TUSER_WIDTH-1 downto 0);
	s_axis_tlast	: in  STD_LOGIC;
	s_axis_tvalid	: in  STD_LOGIC;

--	m_axis_aclk		: in  STD_LOGIC;
--	m_axis_aresetn	: in  STD_LOGIC;
	m_axis_tready	: in  STD_LOGIC;
	m_axis_tdata	: out STD_LOGIC_VECTOR(C_TDATA_WIDTH-1 downto 0);
	m_axis_tuser	: out STD_LOGIC_VECTOR(C_TUSER_WIDTH-1 downto 0);
	m_axis_tlast	: out STD_LOGIC;
	m_axis_tvalid	: out STD_LOGIC
);
end axis_decimate_v1_0;
--------------------------------------------------------------------------------
architecture arch_imp of axis_decimate_v1_0 is
--------------------------------------------------------------------------------
constant C_CDATA_WIDTH		: integer := C_TDATA_WIDTH/C_CHANNELS;
signal dec_val				: UNSIGNED(C_REG_WIDTH-1 downto 0);
signal dec_cnt				: UNSIGNED(C_REG_WIDTH-1 downto 0);
signal decimation_i			: UNSIGNED(C_REG_WIDTH-1 downto 0);
--------------------------------------------------------------------------------
type data_s_type is array (C_CHANNELS-1 downto 0) of SIGNED(C_CDATA_WIDTH-1 downto 0);
signal data_s				: data_s_type;
signal acc_s				: data_s_type;
signal max_s				: data_s_type;
type data_u_type is array (C_CHANNELS-1 downto 0) of UNSIGNED(C_CDATA_WIDTH-1 downto 0);
signal data_u				: data_u_type;
signal acc_u				: data_u_type;
signal max_u				: data_u_type;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
gen_fixed_val: if C_USE_FIXED = TRUE generate
decimation_i		<= TO_UNSIGNED(C_FIXED_VAL,C_REG_WIDTH);
end generate;

gen_variable_val: if C_USE_FIXED = FALSE generate
decimation_i		<= UNSIGNED(decimation);
end generate;
--------------------------------------------------------------------------------
simple_dec_gen: if C_DEC_TYPE = 0 generate	-- Simple Decimation
	process(s_axis_aclk)
	begin
		if(s_axis_aclk = '1' and s_axis_aclk'event)then
			dec_val		<= decimation_i;
			if((s_axis_tvalid = '1') and (m_axis_tready = '1'))then
				if(dec_cnt >= dec_val)then
					dec_cnt		<= (others => '0');
				else
					dec_cnt		<= dec_cnt + 1;
				end if;
			end if;
		end if;
	end process;

	s_axis_tready	<= m_axis_tready;
	m_axis_tvalid	<= s_axis_tvalid when (dec_cnt >= dec_val) else '0';
	m_axis_tuser	<= s_axis_tuser;
	m_axis_tdata	<= s_axis_tdata;
	m_axis_tlast	<= s_axis_tlast;
end generate;
--------------------------------------------------------------------------------
max_dec_gen: if C_DEC_TYPE = 1 generate	-- Maximal Decimation
	ch_in_gen: for i in 0 to C_CHANNELS-1 generate
		data_s(i)		<= SIGNED(s_axis_tdata(i*C_CDATA_WIDTH+C_CDATA_WIDTH-1 downto i*C_CDATA_WIDTH));
		data_u(i)		<= UNSIGNED(s_axis_tdata(i*C_CDATA_WIDTH+C_CDATA_WIDTH-1 downto i*C_CDATA_WIDTH));
	end generate;
	
	ch_out_s_gen: for i in 0 to C_CHANNELS-1 generate
		m_axis_tdata(i*C_CDATA_WIDTH+C_CDATA_WIDTH-1 downto i*C_CDATA_WIDTH)	<= STD_LOGIC_VECTOR(max_s(i));
	end generate;

	ch_out_u_gen: for i in 0 to C_CHANNELS-1 generate
		m_axis_tdata(i*C_CDATA_WIDTH+C_CDATA_WIDTH-1 downto i*C_CDATA_WIDTH)	<= STD_LOGIC_VECTOR(max_u(i));
	end generate;

	process(s_axis_aclk)
	begin
		if(s_axis_aclk = '1' and s_axis_aclk'event)then
			dec_val		<= decimation_i;
			if((s_axis_tvalid = '1') and (m_axis_tready = '1'))then
				for i in 0 to C_CHANNELS-1 loop
					if(dec_cnt >= dec_val)then
						acc_s(i)		<= data_s(i);
						acc_u(i)		<= data_u(i);
						if(data_s(i) >= acc_s(i))then
							max_s(i)	<= data_s(i);
						else
							max_s(i)	<= acc_s(i);
						end if;
						if(data_u(i) >= acc_u(i))then
							max_u(i)	<= data_u(i);
						else
							max_u(i)	<= acc_u(i);
						end if;
					else
						if(data_s(i) >= acc_s(i))then
							acc_s(i)	<= data_s(i);
						end if;
						if(data_u(i) >= acc_u(i))then
							acc_u(i)	<= data_u(i);
						end if;
					end if;
				end loop;
				if(dec_cnt >= dec_val)then
					dec_cnt		<= (others => '0');
				else
					dec_cnt		<= dec_cnt + 1;
				end if;
			end if;
		end if;
	end process;
	
	m_axis_tvalid	<= s_axis_tvalid when (dec_cnt >= dec_val) else '0';
	s_axis_tready	<= m_axis_tready;
	m_axis_tuser	<= s_axis_tuser;
	m_axis_tlast	<= s_axis_tlast;
end generate;
--------------------------------------------------------------------------------
end arch_imp;
