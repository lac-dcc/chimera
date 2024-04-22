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
entity axis_split_v1_0 is
generic (
    C_USE_TRIG              : boolean   := TRUE;
	C_S_AXIS_TDATA_WIDTH	: integer	:= 32;
	C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
	C_M01_AXIS_TDATA_WIDTH	: integer	:= 32
);
port (
	axis_aclk			: in  STD_LOGIC;
	axis_aresetn		: in  STD_LOGIC;
		
	s_axis_tready		: out STD_LOGIC;
	s_axis_tdata		: in  STD_LOGIC_VECTOR(C_S_AXIS_TDATA_WIDTH-1 downto 0);
	s_axis_tvalid		: in  STD_LOGIC;
	
	m00_axis_tready		: in  STD_LOGIC;
	m00_axis_tdata		: out STD_LOGIC_VECTOR(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
	m00_axis_tvalid		: out STD_LOGIC;
	
	m01_axis_tready		: in  STD_LOGIC;
	m01_axis_tdata		: out STD_LOGIC_VECTOR(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
	m01_axis_tvalid		: out STD_LOGIC
);
end axis_split_v1_0;
--------------------------------------------------------------------------------
architecture arch_imp of axis_split_v1_0 is
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
no_trig_gen: if C_USE_TRIG = FALSE generate
begin
    s_axis_tready		<= m00_axis_tready;
    m00_axis_tvalid		<= s_axis_tvalid;
    m01_axis_tvalid		<= s_axis_tvalid;
    m00_axis_tdata		<= s_axis_tdata(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
    m01_axis_tdata		<= s_axis_tdata(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
end generate;

trig_gen: if C_USE_TRIG = TRUE generate
begin
    s_axis_tready		<= m00_axis_tready;
    process(axis_aclk)
    begin
        if(axis_aclk = '1' and axis_aclk'event)then
            m00_axis_tvalid		<= s_axis_tvalid;
            m01_axis_tvalid		<= s_axis_tvalid;
            m00_axis_tdata		<= s_axis_tdata(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
            m01_axis_tdata		<= s_axis_tdata(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
        end if;
    end process;
end generate;
--------------------------------------------------------------------------------
end arch_imp;
