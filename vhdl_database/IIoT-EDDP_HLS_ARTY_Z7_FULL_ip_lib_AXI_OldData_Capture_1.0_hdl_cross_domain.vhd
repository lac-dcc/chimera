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
use IEEE.NUMERIC_STD.all;
-------------------------------------------------------------------------------
entity cross_domain is
generic(
	C_FREQ_RATE		: integer	:= 4
);
port ( 
	src_clk			: in  STD_LOGIC;
	dst_clk			: in  STD_LOGIC;
	src_d			: in  STD_LOGIC;
	dst_d			: out STD_LOGIC
);
end cross_domain;
-------------------------------------------------------------------------------
architecture Behavioral of cross_domain is
-------------------------------------------------------------------------------
signal src_sr					: STD_LOGIC_VECTOR(C_FREQ_RATE - 1 downto 0);
signal dst_sr					: STD_LOGIC_VECTOR(1 downto 0);
attribute ASYNC_REG				: string;
attribute ASYNC_REG of dst_sr	: signal is "true";
-------------------------------------------------------------------------------
begin
-------------------------------------------------------------------------------
process(src_clk)
begin
	if(src_clk = '1' and src_clk'event)then
		if(src_d = '1')then
			src_sr	<= (others => '1');
		else	
			src_sr(C_FREQ_RATE-1 downto 1) <= src_sr(C_FREQ_RATE-2 downto 0);
			src_sr(0)	<= '0';
		end if;
	end if;
end process;

process(dst_clk)
begin
	if(dst_clk = '1' and dst_clk'event)then
		dst_sr(0)	<= src_sr(C_FREQ_RATE - 1);
		dst_sr(1)	<= dst_sr(0);
		if(dst_sr = "01")then
			dst_d	<= '1';
		else
			dst_d	<= '0';
		end if;
	end if;
end process;
-------------------------------------------------------------------------------
end Behavioral;
