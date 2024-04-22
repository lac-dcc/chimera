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
entity sinc3 is
generic (
	C_IMPLEMENTATION 		: integer range 0 to 1	:= 0
);
port (
	clk						: in  STD_LOGIC := '0';
	clk_en					: in  STD_LOGIC	:= '1';
	mdat					: in  STD_LOGIC := '0';
	dec_rate				: in  STD_LOGIC_VECTOR(15 downto 0) := x"0100";
	-- Result
	tdata					: out STD_LOGIC_VECTOR(15 downto 0);
	tvalid					: out STD_LOGIC
);
end sinc3;
--------------------------------------------------------------------------------
architecture RTL of sinc3 is
--------------------------------------------------------------------------------
signal acc1				: UNSIGNED(36 downto 0)	:= (others => '0'); 
signal acc2				: UNSIGNED(36 downto 0)	:= (others => '0'); 
signal acc3				: UNSIGNED(36 downto 0)	:= (others => '0'); 
signal acc3_d2			: UNSIGNED(36 downto 0)	:= (others => '0'); 
signal diff1			: UNSIGNED(36 downto 0)	:= (others => '0'); 
signal diff2			: UNSIGNED(36 downto 0)	:= (others => '0'); 
signal diff3			: UNSIGNED(36 downto 0)	:= (others => '0'); 
signal diff3a			: UNSIGNED(36 downto 0)	:= (others => '0'); 
signal diff1_d			: UNSIGNED(36 downto 0)	:= (others => '0'); 
signal diff2_d			: UNSIGNED(36 downto 0)	:= (others => '0'); 
signal word_count		: UNSIGNED(15 downto 0)	:= (others => '0'); 
signal word_clk			: STD_LOGIC := '0';
signal mdat_i			: STD_LOGIC := '0';
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
process(clk)
begin
	if(clk = '1' and clk'event)then
		mdat_i	<= mdat;
		if(clk_en = '1')then
			if(mdat_i = '1')then
				acc1 <= acc1 + 1;
			end if;
			acc2 <= acc2 + acc1;  
			acc3 <= acc3 + acc2;  
		end if;
	end if;
end process;

-- decimation stage (MCLKOUT/WORD_CLK)
process(clk)
begin
	if(clk = '1' and clk'event)then
		if(clk_en = '1')then
			if(word_count = (UNSIGNED(dec_rate)-1))then
				word_count	<= (others => '0');
			else
				word_count	<= word_count + 1;
			end if;
		end if;
	end if;
end process;

process(clk)
begin
	if(clk = '1' and clk'event)then
		if(clk_en = '1')then
			if(word_count = (resize(UNSIGNED(dec_rate(15 downto 1)),16)-1))then
				word_clk	<= '1';
			else
				word_clk	<= '0';
			end if;
		end if;
	end if;
end process;

-- Differentiator (including decimation stage) 
-- Perform the differentiation stage (FIR) at a lower speed. 
-- Z = one sample delay WORD_CLK = output word rate
--process(word_clk)
process(clk)
begin
	--if(word_clk = '1' and word_clk'event)then
	if(clk = '1' and clk'event)then
		if((clk_en = '1') and (word_clk = '1'))then
			diff1		<= acc3 - acc3_d2;  
			diff2		<= diff1 - diff1_d;  
			diff3		<= diff2 - diff2_d;  
			diff3a		<= diff2 - diff2_d;  
			acc3_d2 	<= acc3;  
			diff1_d 	<= diff1;  
			diff2_d 	<= diff2;   
		end if;
	end if;
end process;


-- Clock the Sinc output into an output register WORD_CLK = output word rate
--process(word_clk)
process(clk)
begin
	--if(word_clk = '1' and word_clk'event)then
	if(clk = '1' and clk'event)then
		if((clk_en = '1') and (word_clk = '1'))then
			tvalid		<= '1';
			case dec_rate is
				when x"0020" => 	-- 32
					if(diff3(15 downto 0) = TO_UNSIGNED(32768,16))then
						tdata <= STD_LOGIC_VECTOR(TO_UNSIGNED(65535,16));
					else
						tdata <= STD_LOGIC_VECTOR(diff3a(14 downto 0) & '0');
					end if;
				when x"0040" => 	-- 64
					if(diff3(18 downto 2) = TO_UNSIGNED(65536,17))then
						tdata <= STD_LOGIC_VECTOR(TO_UNSIGNED(65535,16));
					else
						tdata <= STD_LOGIC_VECTOR(diff3a(17 downto 2));
					end if;
				when x"0080" => 	-- 128
					if(diff3(21 downto 5) = TO_UNSIGNED(65536,17))then
						tdata <= STD_LOGIC_VECTOR(TO_UNSIGNED(65535,16));
					else
						tdata <= STD_LOGIC_VECTOR(diff3a(20 downto 5));
					end if;
				when x"0100" => 	-- 256
					if(diff3(24 downto 8) = TO_UNSIGNED(65536,17))then
						tdata <= STD_LOGIC_VECTOR(TO_UNSIGNED(65535,16));
					else
						tdata <= STD_LOGIC_VECTOR(diff3a(23 downto 8));
					end if;
				when x"0200" => 	-- 512
					if(diff3(27 downto 11) = TO_UNSIGNED(65536,17))then
						tdata <= STD_LOGIC_VECTOR(TO_UNSIGNED(65535,16));
					else
						tdata <= STD_LOGIC_VECTOR(diff3a(26 downto 11));
					end if;
				when x"0400" => 	-- 1024
					if(diff3(30 downto 14) = TO_UNSIGNED(65536,17))then
						tdata <= STD_LOGIC_VECTOR(TO_UNSIGNED(65535,16));
					else
						tdata <= STD_LOGIC_VECTOR(diff3a(29 downto 14));
					end if;
				when x"0800" => 	-- 2048
					if(diff3(33 downto 17) = TO_UNSIGNED(65536,17))then
						tdata <= STD_LOGIC_VECTOR(TO_UNSIGNED(65535,16));
					else
						tdata <= STD_LOGIC_VECTOR(diff3a(32 downto 17));
					end if;
				when x"1000" => 	-- 4096
					if(diff3(36 downto 20) = TO_UNSIGNED(65536,17))then
						tdata <= STD_LOGIC_VECTOR(TO_UNSIGNED(65535,16));
					else
						tdata <= STD_LOGIC_VECTOR(diff3a(35 downto 20));
					end if;
				when others => 
					if(diff3(24 downto 8) = TO_UNSIGNED(65536,17))then
						tdata <= STD_LOGIC_VECTOR(TO_UNSIGNED(65535,16));
					else	
						tdata <= STD_LOGIC_VECTOR(diff3a(23 downto 8));
					end if;
			end case;
		else
			tvalid		<= '0';
		end if;
	end if;
end process;
--------------------------------------------------------------------------------
end RTL;
