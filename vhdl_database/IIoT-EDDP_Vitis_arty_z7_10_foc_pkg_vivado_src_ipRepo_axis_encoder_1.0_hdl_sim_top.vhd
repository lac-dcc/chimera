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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.MATH_REAL.ALL;
--------------------------------------------------------------------------------
entity sim_top is
--  Port ( );
end sim_top;
--------------------------------------------------------------------------------
architecture Behavioral of sim_top is
--------------------------------------------------------------------------------
component axis_encoder_v1_0 is
generic (
	-- C_CPR					: integer	:= 5000;
	-- C_CLK_FREQ				: integer	:= 100000000;
	C_FILTER_WIDTH			: integer	:= 32;
	C_M_AXIS_TDATA_WIDTH	: integer	:= 16
);
port (
	-- Encoder signals
	A						: in  STD_LOGIC;
	B						: in  STD_LOGIC;
	I						: in  STD_LOGIC;
	-- Raw output
	angle_data				: out STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	period_data				: out STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	-- AXIS
	axis_aclk				: in  STD_LOGIC;
	axis_aresetn			: in  STD_LOGIC;

	-- m_speed_tvalid			: out STD_LOGIC;
	-- m_speed_tdata			: out STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	-- m_speed_tready			: in  STD_LOGIC;
	
	m0_angle_tvalid			: out STD_LOGIC;
	m0_angle_tdata			: out STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	m0_angle_tready			: in  STD_LOGIC;
	
	m1_angle_tvalid			: out STD_LOGIC;
	m1_angle_tdata			: out STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	m1_angle_tready			: in  STD_LOGIC
);
end component;


constant clk_period				: time := 10 ns;	-- 100 MHz

constant C_CPR					: integer	:= 5000;
constant C_IN_DATA_PERIOD		: integer	:= 16;
constant C_CLK_FREQ				: integer	:= 100000000;
constant C_FILTER_WIDTH			: integer	:= 32;
constant C_M_AXIS_TDATA_WIDTH	: integer	:= 16;

constant C_RPS					: integer	:= 50;
constant enc_period				: time 		:= ((1000 ms) / C_RPS)/C_CPR;


signal A						: STD_LOGIC;
signal B						: STD_LOGIC;
signal I						: STD_LOGIC;
	-- Raw output
signal angle_data				: STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
signal period_data				: STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	-- AXIS
signal axis_aclk				: STD_LOGIC;
signal axis_aresetn				: STD_LOGIC;

signal m_speed_tvalid			: STD_LOGIC;
signal m_speed_tdata			: STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
signal m_speed_tready			: STD_LOGIC;
	
signal m0_angle_tvalid			: STD_LOGIC;
signal m0_angle_tdata			: STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
signal m0_angle_tready			: STD_LOGIC;
	
signal m1_angle_tvalid			: STD_LOGIC;
signal m1_angle_tdata			: STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
signal m1_angle_tready			: STD_LOGIC;

--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
clk_generation: process 
begin  
	axis_aclk		<= '0';
	wait for clk_period/2;
	axis_aclk		<= '1';
	wait for clk_period/2;
end process;

axis_aresetn		<= '1';

enc_generation: process 
begin  
	A		<= '0';
	wait for enc_period/2;
	A		<= '1';
	wait for enc_period/2;
end process;

B			<= A after 40 ns;
I 			<= '0';

UUT: axis_encoder_v1_0
generic map(
	-- C_CPR					: integer	:= 5000;
	-- C_CLK_FREQ				: integer	:= 100000000;
	C_FILTER_WIDTH			=> C_FILTER_WIDTH,
	C_M_AXIS_TDATA_WIDTH	=> C_M_AXIS_TDATA_WIDTH
)
port map(
	-- Encoder signals
	A						=> A,
	B						=> B,
	I						=> I,
	-- Raw output
	angle_data				=> angle_data,
	period_data				=> period_data,
	-- AXIS
	axis_aclk				=> axis_aclk,
	axis_aresetn			=> axis_aresetn,

	-- m_speed_tvalid			=> m_speed_tvalid,
	-- m_speed_tdata			=> m_speed_tdata,
	-- m_speed_tready			=> m_speed_tready,
	
	m0_angle_tvalid			=> m0_angle_tvalid,
	m0_angle_tdata			=> m0_angle_tdata,
	m0_angle_tready			=> m0_angle_tready,
	
	m1_angle_tvalid			=> m1_angle_tvalid,
	m1_angle_tdata			=> m1_angle_tdata,
	m1_angle_tready			=> m1_angle_tready
);

m0_angle_tready		<= '1';
m1_angle_tready		<= '1';

data_clrl: process is
begin	
	--s_axis_tvalid		<= '0';
	--s_axis_tdata		<= (others => '0');
	wait for clk_period*10;
	--s_axis_tdata		<= STD_LOGIC_VECTOR(TO_SIGNED(1000,C_DATA_BITS));
	--s_axis_tvalid		<= '1';
	wait for clk_period;
	--s_axis_tdata		<= (others => '0');
	--s_axis_tvalid		<= '0';
	wait for 10 us;

	wait;
end process  data_clrl;

--------------------------------------------------------------------------------
end Behavioral;
