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
use IEEE.NUMERIC_STD.all;
library UNISIM;
use UNISIM.VComponents.all;
-------------------------------------------------------------------------------
entity srl_delay is
generic(
	C_WIDTH				: integer := 12;
	C_D_WIDTH			: integer := 8;
	C_MAX_DELAY			: integer := 32
);
port (
	clk 				: in  STD_LOGIC;
	ce 					: in  STD_LOGIC;
	delay				: in  STD_LOGIC_VECTOR(C_D_WIDTH - 1 downto 0);
	data_in				: in  STD_LOGIC_VECTOR(C_WIDTH - 1 downto 0);
	data_out			: out STD_LOGIC_VECTOR(C_WIDTH - 1 downto 0)
);
end srl_delay;
-------------------------------------------------------------------------------
architecture Behavioral of srl_delay is
-------------------------------------------------------------------------------
type arr_type is array(C_MAX_DELAY/32 downto 0) of STD_LOGIC_VECTOR(C_WIDTH - 1 downto 0);
signal ddata		: arr_type;
type arrp_type is array(C_MAX_DELAY/32+1 downto 0) of STD_LOGIC_VECTOR(C_WIDTH - 1 downto 0);
signal cdata		: arrp_type;
signal delay_i		: UNSIGNED(C_D_WIDTH - 1 downto 0);
signal delay_c		: STD_LOGIC_VECTOR(C_D_WIDTH - 1 downto 0);
signal data_reg		: STD_LOGIC_VECTOR(C_WIDTH - 1 downto 0);
signal data_srl		: STD_LOGIC_VECTOR(C_WIDTH - 1 downto 0);
-------------------------------------------------------------------------------
begin
-------------------------------------------------------------------------------
cdata(0)	<= data_in;
width_gen: for i in C_WIDTH - 1 downto 0 generate
begin
	depth_gen: for j in C_MAX_DELAY/32 downto 0 generate
	begin
		SRLC32E_1 : SRLC32E
		port map (
			D   => cdata(j)(i),
			Q   => ddata(j)(i),
			Q31 => cdata(j+1)(i),
			A   => delay(4 downto 0),
			CE  => ce,
			CLK => clk
		);
	end generate;
end generate;

process(clk)
begin
	if(clk = '1' and clk'event)then
		delay_i		<= UNSIGNED(delay);
		delay_c		<= STD_LOGIC_VECTOR(delay_i - 2);	-- Correction
		if(ce = '1')then
			data_reg	<= data_in;
			data_srl	<= ddata(TO_INTEGER(UNSIGNED(delay(C_D_WIDTH - 1 downto 5))));
		end if;
	end if;
end process;

process(delay_i, data_in, data_reg, data_srl)
begin
	if(delay_i = TO_UNSIGNED(0,C_D_WIDTH))then
		data_out	<= data_in;		-- No delay
	elsif(delay_i = TO_UNSIGNED(1,C_D_WIDTH))then
		data_out	<= data_reg;		-- Register implementation
	else
		data_out	<= data_srl;	-- SRL Implemantation
	end if;
end process;
-------------------------------------------------------------------------------
end Behavioral;
