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
-------------------------------------------------------------------------------
entity level_trig is
generic(
	C_WIDTH				: integer	:= 16
);
port (
	s_axis_aclk			: in  STD_LOGIC;
	s_axis_aresetn		: in  STD_LOGIC;
	s_axis_tvalid		: in  STD_LOGIC;
	s_axis_tready		: out STD_LOGIC;
	s_axis_tdata		: in  STD_LOGIC_VECTOR(C_WIDTH-1 downto 0);
	hysteresis			: in  STD_LOGIC_VECTOR(C_WIDTH-1 downto 0);
	level				: in  STD_LOGIC_VECTOR(C_WIDTH-1 downto 0);
	trig_out			: out STD_LOGIC;
	flag_out			: out STD_LOGIC
);
end level_trig;
-------------------------------------------------------------------------------
architecture Behavioral of level_trig is
-------------------------------------------------------------------------------
signal data_i	: SIGNED(C_WIDTH-1 downto 0);
signal edge_sr	: STD_LOGIC_VECTOR(1 downto 0);
signal lock		: STD_LOGIC := '0';
-------------------------------------------------------------------------------
begin
-------------------------------------------------------------------------------
process(s_axis_aclk)
begin
	if(s_axis_aclk = '1' and s_axis_aclk'event)then
		data_i	<= SIGNED(s_axis_tdata);
		if((data_i > SIGNED(level)) and (lock = '0'))then
			edge_sr		<= edge_sr(0) & '1';
			lock		<= '1';
			--flag_out	<= '1';
		else
			edge_sr		<= edge_sr(0) & '0';
			--flag_out	<= '0';
			if(data_i < (SIGNED(level) - SIGNED(hysteresis)))then
				lock		<= '0';
				--flag_out	<= '0';
			end if;
		end if;
		
		if(data_i > SIGNED(level))then
			flag_out	<= '1';
		else
			flag_out	<= '0';
		end if;

		if(edge_sr = "01")then
			trig_out	<= '1';
		else
			trig_out	<= '0';
		end if;
	end if;
end process;

end Behavioral;
