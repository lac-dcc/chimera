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
entity sinc3_filt is
generic (
	C_BUS_WIDTH				: integer	:= 16;
	C_IMPLEMENTATION 		: integer range 0 to 1	:= 0;
	C_DECIMATION			: integer	:= 32
);
port (
	-- Modulator signals
	clk						: in  STD_LOGIC;
	clk_en					: in  STD_LOGIC	:= '1';
	MDAT					: in  STD_LOGIC;
	-- Result
	tdata					: out STD_LOGIC_VECTOR(15 downto 0);
	tvalid					: out STD_LOGIC;
	-- Debug/Simulation
	K						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	Delta1					: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	CN1						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	CN2						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	CNR						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	DN0						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	DN1						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	CN3						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	DN3						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	CN4						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	DN5						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	CN5						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0)
);
end sinc3_filt;
--------------------------------------------------------------------------------
architecture RTL of sinc3_filt is
--------------------------------------------------------------------------------
signal dec_cnt				: integer range 0 to (C_DECIMATION - 1) := 0;
signal lf_en				: STD_LOGIC := '0';
signal data_in				: STD_LOGIC := '0';
signal IA, IB, IC, PA, NA	: UNSIGNED(C_BUS_WIDTH-1 downto 0) := (others => '0');
signal PB, NB, PC, NC, PD	: UNSIGNED(C_BUS_WIDTH-1 downto 0) := (others => '0');
signal flt_valid			: STD_LOGIC	:= '0';
signal ext_data				: STD_LOGIC_VECTOR(C_BUS_WIDTH downto 0) := (others => '0');
signal ext_valid			: STD_LOGIC	:= '0';
signal conv_data			: SIGNED(C_BUS_WIDTH downto 0) := (others => '0');
signal conv_valid			: STD_LOGIC	:= '0';
-- Debug/Simulation
signal K_cnt				: UNSIGNED(C_BUS_WIDTH-1 downto 0) := (others => '0');
signal CNR_cnt				: UNSIGNED(C_BUS_WIDTH-1 downto 0) := (others => '1');
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
fab_imp_gen: if C_IMPLEMENTATION = 0 generate
	process(clk)
	begin
		if(clk = '1' and clk'event)then
			if(clk_en = '1')then
				K_cnt			<= K_cnt + 1;
				if(dec_cnt = C_DECIMATION-1)then
					dec_cnt		<= 0;
					lf_en		<= '1';
				else
					lf_en		<= '0';
					dec_cnt		<= dec_cnt + 1;
				end if;
			
				if(dec_cnt = 0)then
					CNR_cnt		<= CNR_cnt + 1;
				end if;
			end if;
		end if;
	end process;
	
	integrators: process(clk)
	begin
		if(clk = '1' and clk'event)then
			if(clk_en = '1')then
				data_in			<= MDAT;	-- Input trigger
				if(data_in = '1')then
					IA			<= IA + 1;
				end if;
				IB				<= IB + IA;
				IC				<= IC + IB;
			end if;
		end if;
	end process;
	
	differentiators: process(clk)
	begin
		if(clk = '1' and clk'event)then
			if((clk_en = '1') and (lf_en = '1'))then
				PA			<= IC;	-- Decimation
				NA			<= PA;
				NB			<= PB;
				NC			<= PC;
				flt_valid	<= '1';
			else
				flt_valid	<= '0';
			end if;
		end if;
	end process;

	result: process(clk)
	begin
		if(clk = '1' and clk'event)then
			if(flt_valid = '1')then
				ext_data	<= STD_LOGIC_VECTOR("0" & PD);
				ext_valid	<= '1';
			else
				ext_valid	<= '0';
			end if;
			if(ext_valid = '1')then
				conv_data		<= SIGNED(ext_data) - TO_SIGNED((2**(C_BUS_WIDTH-2)+1),(C_BUS_WIDTH+1));
				conv_valid		<= '1';
			else
				conv_valid		<= '0';
			end if;
			if(conv_valid = '1')then
				if(C_DECIMATION = 4)then	-- 7
					tdata		<= STD_LOGIC_VECTOR(conv_data(5 downto 0)) & "0000000000";
				end if;
				if(C_DECIMATION = 8)then	-- 10
					tdata		<= STD_LOGIC_VECTOR(conv_data(8 downto 0)) & "0000000";
				end if;
				if(C_DECIMATION = 16)then	-- 13
					tdata		<= STD_LOGIC_VECTOR(conv_data(11 downto 0)) & "0000";
				end if;
				if(C_DECIMATION = 32)then	-- 16
					tdata		<= STD_LOGIC_VECTOR(conv_data(14 downto 0)) & "0";
				end if;
				if(C_DECIMATION = 64)then	-- 19
					tdata		<= STD_LOGIC_VECTOR(conv_data(17 downto 2));
				end if;
				if(C_DECIMATION = 128)then	-- 22
					tdata		<= STD_LOGIC_VECTOR(conv_data(20 downto 5));
				end if;
				if(C_DECIMATION = 256)then	-- 25
					tdata		<= STD_LOGIC_VECTOR(conv_data(23 downto 8));
				end if;
				tvalid			<= '1';
			else
				tvalid			<= '0';
			end if;
		end if;
	end process;
	
	PB		<= PA - NA;
	PC		<= PB - NB;
	PD		<= PC - NC;
	
end generate;
-- Debug
K		<= STD_LOGIC_VECTOR(K_cnt);
Delta1	<= STD_LOGIC_VECTOR(IA);
CN1		<= STD_LOGIC_VECTOR(IB);
CN2		<= STD_LOGIC_VECTOR(IC);
CNR		<= STD_LOGIC_VECTOR(CNR_cnt);
DN0		<= STD_LOGIC_VECTOR(PA);
DN1		<= STD_LOGIC_VECTOR(NA);
CN3		<= STD_LOGIC_VECTOR(PB);
DN3		<= STD_LOGIC_VECTOR(NB);
CN4		<= STD_LOGIC_VECTOR(PC);
DN5		<= STD_LOGIC_VECTOR(NC);
CN5		<= STD_LOGIC_VECTOR(PD);
--------------------------------------------------------------------------------
end RTL;
