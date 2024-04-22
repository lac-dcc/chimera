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
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------------------------------
entity axis_foc_control is
port (
		axis_aclk			: in  STD_LOGIC;
		axis_aresetn		: in  STD_LOGIC;
		
		control_in			: in  STD_LOGIC_VECTOR(31 downto 0);
		vd_in				: in  STD_LOGIC_VECTOR(31 downto 0);
		vq_in				: in  STD_LOGIC_VECTOR(31 downto 0);
		torque_sp_in		: in  STD_LOGIC_VECTOR(15 downto 0);

		s_rpm_tready	  	: out STD_LOGIC;
		s_rpm_tvalid	  	: in  STD_LOGIC
		s_rpm_tdata	  		: in  STD_LOGIC_VECTOR(15 downto 0);
		
		s_flux_tready	  	: out STD_LOGIC;
		s_flux_tvalid	  	: in  STD_LOGIC
		s_flux_tdata	  	: in  STD_LOGIC_VECTOR(15 downto 0);
		
		s_torque_tready	  	: out STD_LOGIC;
		s_torque_tvalid	  	: in  STD_LOGIC
		s_torque_tdata	  	: in  STD_LOGIC_VECTOR(15 downto 0);
		
		s_angle_tready	  	: out STD_LOGIC;
		s_angle_tvalid	  	: in  STD_LOGIC
		s_angle_tdata		: in  STD_LOGIC_VECTOR(15 downto 0);
		
		m_axis_tready	  	: in  STD_LOGIC;
		m_axis_tvalid	  	: out STD_LOGIC
		m_axis_tdata		: out STD_LOGIC_VECTOR(63 downto 0)

);
end axis_foc_control;
--------------------------------------------------------------------------------
architecture arch_imp of axis_foc_control is
--------------------------------------------------------------------------------
constant C_GEN_DELAY	: integer	:= 10;
constant C_CPR			: integer	:= 1000;
signal control		: STD_LOGIC_VECTOR( 3 downto 0);
signal vd			: STD_LOGIC_VECTOR(15 downto 0);
signal vq			: STD_LOGIC_VECTOR(15 downto 0);
signal angle		: STD_LOGIC_VECTOR(15 downto 0);
signal theta		: STD_LOGIC_VECTOR(15 downto 0);

signal dly_cnt		: integer range 0 to C_GEN_DELAY-1	:= 0;
signal angle_cnt	: UNSIGNED(15 downto 0);
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
s00_axis_tready <= '1';

process(axis_aclk)
begin
    if(axis_aclk = '1' and axis_aclk'event)then
		if(s_rpm_tvalid = '1')then
			if(dly_cnt >= (C_GEN_DELAY-1))then
				dly_cnt		<= 0;
				if(angle_cnt >= TO_UNSIGNED(C_CPR-1))then
					angle_cnt	<= (others => '0');
				else
					angle_cnt	<= angle_cnt + 1;
				end if;
			else
				dly_cnt		<= dly_cnt + 1;
			end if;
		end if;
    end if;
end process;

process(axis_aclk)
begin
    if(axis_aclk = '1' and axis_aclk'event)then
		control				<= control_in(3 downto 0);
        if(s_angle_tvalid = '1')then
			angle			<= s_angle_tdata;
        end if;
		if(s_rpm_tvalid = '1')then
			m_axis_tvalid	<= '1';
			case control is
				when x"0"	=> 	-- Motor Stop
					vd			<= (others => '0');
					vq			<= (others => '0');
					theta		<= (others => '0');
					torque_sp	<= (others => '0');
				when x"1"	=>	-- Work mode speed loop
					vd			<= s_flux_tdata;
					vq			<= s_torque_tdata;
					theta		<= angle;
					torque_sp	<= s_rpm_tdata;
				when x"2"	=>	-- Manual Vd/Vq with real angle
					vd			<= vd_in(15 downto 0);
					vq			<= vq_in(15 downto 0);
					theta		<= angle;
				when x"3"	=>	-- Manual torque
					vd			<= s_flux_tdata;
					vq			<= vq_in(15 downto 0);
					theta		<= angle;
				when x"4"	=>	-- RPM loop (Torque PI bypass)
					vd			<= s_flux_tdata;
					vq			<= s_rpm_tdata;
					theta		<= angle;
				when x"5"	=>	-- Disable RPM PI
					vd			<= s_flux_tdata;
					vq			<= s_torque_tdata;
					theta		<= angle;
					torque_sp	<= torque_sp_in(15 downto 0);
				when x"6"	=>	-- Manual mode with angle generator
					vd			<= vd_in(15 downto 0);
					vq			<= vq_in(15 downto 0);
					theta		<= STD_LOGIC_VECTOR(angle_cnt);
				when others	=> 	-- Motor Stop
					vd			<= (others => '0');
					vq			<= (others => '0');
					theta		<= (others => '0');
					torque_sp	<= (others => '0');
			end case
		else
			m_axis_tvalid	<= '0';
		end if;
    end if;
end process;

m_axis_tdata	<= x"0000" & theta & vq & vd;
--------------------------------------------------------------------------------
end arch_imp;
