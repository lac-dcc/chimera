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
use ieee.numeric_std.all;
--use IEEE.ELECTRICAL_SYSTEMS.all;
--------------------------------------------------------------------------------
entity sim_sinc3_filt is
--  Port ( );
end sim_sinc3_filt;
--------------------------------------------------------------------------------
architecture Behavioral of sim_sinc3_filt is
--------------------------------------------------------------------------------
function sinc3_bus_width(decimation_ratio : integer) return integer is
begin
	case decimation_ratio is
		when 4		=> return 7;
		when 8		=> return 10;
		when 16		=> return 13;
		when 32		=> return 16;
		when 64		=> return 19;
		when 128	=> return 22;
		when 256	=> return 25;
		when others	=> return 25;
	end case;
end function;
--------------------------------------------------------------------------------
constant mclk_period			: time := 50 ns;	-- 20 MHz
constant clk_period				: time := 10 ns;	-- 100 MHz

constant C_IMPLEMENTATION 		: integer range 0 to 1	:= 0; -- 0 - Logic only, 1 - DSP48, 2 - DSP48 optimized = not currently supported
constant C_CHANNELS				: integer	:= 1;
constant C_DECIMATION			: integer	:= 256;
constant C_BUS_WIDTH			: integer	:= sinc3_bus_width(C_DECIMATION);
constant C_M_AXIS_TDEST_WIDTH	: integer	:= 2;
constant C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
--------------------------------------------------------------------------------

component sinc3_filt is
generic (
	C_BUS_WIDTH				: integer	:= 16;
	C_IMPLEMENTATION 		: integer range 0 to 1	:= 0;
	C_DECIMATION			: integer	:= 32
);
port (
	-- Modulator signals
	clk						: in  STD_LOGIC;
	clk_en					: in  STD_LOGIC;
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
end component;

component dec256sinc24b is
port ( 
	mclk1		: in  STD_LOGIC;
	reset		: in  STD_LOGIC;
	mdata1		: in  STD_LOGIC;
	DATA		: out STD_LOGIC_VECTOR(15 downto 0);
	data_en		: out STD_LOGIC;
	dec_rate   	: in  STD_LOGIC_VECTOR(15 downto 0)
); 
end component;

component sinc3 is
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
end component;


signal MCLK				: STD_LOGIC;
signal MDAT				: STD_LOGIC;
signal tdata			: STD_LOGIC_VECTOR(15 downto 0);
signal tvalid			: STD_LOGIC;

signal tdata_t			: STD_LOGIC_VECTOR(15 downto 0);
signal tvalid_t			: STD_LOGIC;

-- Debug
signal K    			: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal Delta1			: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal CN1				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal CN2				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal CNR				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal DN0				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal DN1				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal CN3				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal DN3				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal CN4				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal DN5				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal CN5				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);

signal reset		: STD_LOGIC;
signal DATA			: STD_LOGIC_VECTOR(15 downto 0);
signal data_en		: STD_LOGIC;
signal dec_rate   	: STD_LOGIC_VECTOR(15 downto 0);

signal clk			: STD_LOGIC;
signal clk_en		: STD_LOGIC;
signal clk_cnt		: integer range 0 to 4 := 0;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
MCLKIN_generation: process 
begin  
	MCLK		<= '0';
	wait for mclk_period/2;
	MCLK		<= '1';
	wait for mclk_period/2;
end process;

clk_generation: process 
begin  
	clk		<= '0';
	wait for clk_period/2;
	clk		<= '1';
	wait for clk_period/2;
end process;

process(clk)
begin
	if(clk='1' and clk'event)then
		if(clk_cnt = 4)then
			clk_cnt		<= 0;
		else
			clk_cnt		<= clk_cnt + 1;
		end if;
		if(clk_cnt = 2)then
			clk_en		<= '1';
		else
			clk_en		<= '0';
		end if;
	end if;
end process;

UUT: sinc3_filt
generic map(
	C_BUS_WIDTH				=> C_BUS_WIDTH,
	C_IMPLEMENTATION 		=> C_IMPLEMENTATION,
	C_DECIMATION			=> C_DECIMATION
)
port map(
	-- Modulator signals
	clk						=> MCLK,
	clk_en					=> '1',
	MDAT					=> MDAT,
	-- Result
	tdata					=> tdata,
	tvalid					=> tvalid,
	-- Debug
	K                       => K,
	Delta1					=> Delta1,
	CN1						=> CN1, 
	CN2						=> CN2,
	CNR						=> CNR,
	DN0						=> DN0,
	DN1						=> DN1,
	CN3						=> CN3,
	DN3						=> DN3,
	CN4						=> CN4,
	DN5						=> DN5,
	CN5						=> CN5
);

UUT2_inst: dec256sinc24b
port map( 
	mclk1		=> MCLK,
	reset		=> reset,
	mdata1		=> MDAT,
	DATA		=> DATA,
	data_en		=> data_en,
	dec_rate   	=> dec_rate
); 

UUT3_inst: sinc3
generic map(
	C_IMPLEMENTATION 		=> C_IMPLEMENTATION
)
port map(
	clk						=> clk,
	clk_en					=> clk_en,
	
	-- clk						=> mclk,
	-- clk_en					=> '1',
	mdat					=> MDAT,
	dec_rate				=> dec_rate,
	-- Result
	tdata					=> tdata_t,
	tvalid					=> tvalid_t
);


dec_rate	<= STD_LOGIC_VECTOR(TO_UNSIGNED(C_DECIMATION,16));

testbench_clrl: process is
begin	
	MDAT					<= '0';
	reset					<= '1';
	wait for mclk_period;
	reset					<= '0';
	wait for mclk_period*2;
	MDAT					<= '1';
	wait for mclk_period*2000;
	MDAT					<= '0';
	wait;
end process  testbench_clrl;

report_clrl: process is
begin	
	wait for mclk_period;
	report "K    MOUT    Delta1    CN1    CN2    CNR    DN0    DN1    CN3    DN3    CN4    DN5    CN5" severity note;
	for i in 0 to 40 loop
		report 
			integer'image(TO_INTEGER(UNSIGNED(K))) & "    " &
			STD_LOGIC'image(MDAT) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(Delta1))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(CN1))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(CN2))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(CNR))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(DN0))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(DN1))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(CN3))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(DN3))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(CN4))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(DN5))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(CN5)))
			severity note;
		wait for mclk_period;
	end loop;
	wait;
end process  report_clrl;

--------------------------------------------------------------------------------
end Behavioral;
