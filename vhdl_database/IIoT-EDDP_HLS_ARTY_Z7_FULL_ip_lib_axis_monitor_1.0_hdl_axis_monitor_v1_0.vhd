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
entity axis_monitor_v1_0 is
generic (
	C_SLAVE_IF					: INTEGER range 1 to 10	:= 1;
	C_CONTROL_WIDTH				: integer	:= 4;
	C_AXIS_TDATA_WIDTH			: integer	:= 64
);
port (
	mux_in				: in  STD_LOGIC_VECTOR(C_CONTROL_WIDTH-1 downto 0);
	
	axis_aclk			: in  STD_LOGIC;
	axis_aresetn		: in  STD_LOGIC;
	
	m_axis_tready		: in  STD_LOGIC;
	m_axis_tdata		: out STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
	m_axis_tvalid		: out STD_LOGIC;
	
	s00_axis_tready		: in  STD_LOGIC;
	s00_axis_tdata		: in  STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
	s00_axis_tvalid		: in  STD_LOGIC;
	
	s01_axis_tready		: in  STD_LOGIC;
	s01_axis_tdata		: in  STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
	s01_axis_tvalid		: in  STD_LOGIC;
	
	s02_axis_tready		: in  STD_LOGIC;
	s02_axis_tdata		: in  STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
	s02_axis_tvalid		: in  STD_LOGIC;
	
	s03_axis_tready		: in  STD_LOGIC;
	s03_axis_tdata		: in  STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
	s03_axis_tvalid		: in  STD_LOGIC;
	
	s04_axis_tready		: in  STD_LOGIC;
	s04_axis_tdata		: in  STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
	s04_axis_tvalid		: in  STD_LOGIC;
	
	s05_axis_tready		: in  STD_LOGIC;
	s05_axis_tdata		: in  STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
	s05_axis_tvalid		: in  STD_LOGIC;
	
	s06_axis_tready		: in  STD_LOGIC;
	s06_axis_tdata		: in  STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
	s06_axis_tvalid		: in  STD_LOGIC;
	
	s07_axis_tready		: in  STD_LOGIC;
	s07_axis_tdata		: in  STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
	s07_axis_tvalid		: in  STD_LOGIC;
	
	s08_axis_tready		: in  STD_LOGIC;
	s08_axis_tdata		: in  STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
	s08_axis_tvalid		: in  STD_LOGIC;
	
	s09_axis_tready		: in  STD_LOGIC;
	s09_axis_tdata		: in  STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
	s09_axis_tvalid		: in  STD_LOGIC
);
end axis_monitor_v1_0;
--------------------------------------------------------------------------------
architecture arch_imp of axis_monitor_v1_0 is
--------------------------------------------------------------------------------
signal mux_u		: UNSIGNED(C_CONTROL_WIDTH-1 downto 0);
signal mux_i		: INTEGER range 0 to C_SLAVE_IF-1 := 0;
type data_arr_type is array (0 to C_SLAVE_IF-1) of STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
signal data_in		: data_arr_type;
signal valid_in		: STD_LOGIC_VECTOR(C_AXIS_TDATA_WIDTH-1 downto 0);
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
process(axis_aclk)
begin
	if(axis_aclk = '1' and axis_aclk'event)then
		mux_u	<= UNSIGNED(mux_in);
	end if;
end process;
mux_i		<= TO_INTEGER(mux_u);
--------------------------------------------------------------------------------
process(axis_aclk)
begin
	if(axis_aclk = '1' and axis_aclk'event)then
		data_in(0)	<= s00_axis_tdata;
		valid_in(0)	<= s00_axis_tvalid;
	end if;
end process;
--------------------------------------------------------------------------------
c2_gen: if C_SLAVE_IF > 1 generate
begin
	process(axis_aclk)
	begin
		if(axis_aclk = '1' and axis_aclk'event)then
			data_in(1)	<= s01_axis_tdata;
			valid_in(1)	<= s01_axis_tvalid;
		end if;
	end process;
end generate;
--------------------------------------------------------------------------------
c3_gen: if C_SLAVE_IF > 2 generate
begin
	process(axis_aclk)
	begin
		if(axis_aclk = '1' and axis_aclk'event)then
			data_in(2)	<= s02_axis_tdata;
			valid_in(2)	<= s02_axis_tvalid;
		end if;
	end process;
end generate;
--------------------------------------------------------------------------------
c4_gen: if C_SLAVE_IF > 3 generate
begin
	process(axis_aclk)
	begin
		if(axis_aclk = '1' and axis_aclk'event)then
			data_in(3)	<= s03_axis_tdata;
			valid_in(3)	<= s03_axis_tvalid;
		end if;
	end process;
end generate;
--------------------------------------------------------------------------------
c5_gen: if C_SLAVE_IF > 4 generate
begin
	process(axis_aclk)
	begin
		if(axis_aclk = '1' and axis_aclk'event)then
			data_in(4)	<= s04_axis_tdata;
			valid_in(4)	<= s04_axis_tvalid;
		end if;
	end process;
end generate;
--------------------------------------------------------------------------------
c6_gen: if C_SLAVE_IF > 5 generate
begin
	process(axis_aclk)
	begin
		if(axis_aclk = '1' and axis_aclk'event)then
			data_in(5)	<= s05_axis_tdata;
			valid_in(5)	<= s05_axis_tvalid;
		end if;
	end process;
end generate;
--------------------------------------------------------------------------------
c7_gen: if C_SLAVE_IF > 6 generate
begin
	process(axis_aclk)
	begin
		if(axis_aclk = '1' and axis_aclk'event)then
			data_in(6)	<= s06_axis_tdata;
			valid_in(6)	<= s06_axis_tvalid;
		end if;
	end process;
end generate;
--------------------------------------------------------------------------------
c8_gen: if C_SLAVE_IF > 7 generate
begin
	process(axis_aclk)
	begin
		if(axis_aclk = '1' and axis_aclk'event)then
			data_in(7)	<= s07_axis_tdata;
			valid_in(7)	<= s07_axis_tvalid;
		end if;
	end process;
end generate;
--------------------------------------------------------------------------------
c9_gen: if C_SLAVE_IF > 8 generate
begin
	process(axis_aclk)
	begin
		if(axis_aclk = '1' and axis_aclk'event)then
			data_in(8)	<= s08_axis_tdata;
			valid_in(8)	<= s08_axis_tvalid;
		end if;
	end process;
end generate;
--------------------------------------------------------------------------------
c10_gen: if C_SLAVE_IF > 9 generate
begin
	process(axis_aclk)
	begin
		if(axis_aclk = '1' and axis_aclk'event)then
			data_in(9)	<= s09_axis_tdata;
			valid_in(9)	<= s09_axis_tvalid;
		end if;
	end process;
end generate;
--------------------------------------------------------------------------------
process(axis_aclk)
begin
	if(axis_aclk = '1' and axis_aclk'event)then
		m_axis_tdata	<= data_in(mux_i);
		m_axis_tvalid	<= valid_in(mux_i);
	end if;
end process;
--------------------------------------------------------------------------------
end arch_imp;
