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
library UNISIM;
use UNISIM.VComponents.all;
--------------------------------------------------------------------------------
entity axis_AD7403_v1_0 is
generic (
	C_IMPLEMENTATION 		: integer range 0 to 1	:= 0; -- 0 - Logic only, 1 - DSP48, 2 - DSP48 optimized = not currently supported
	C_OUT_TYPE				: integer range 0 to 1	:= 1;	-- 1 - Parallel, 0 - Serial
	C_DATA_BITS				: integer				:= 16;
	C_CHANNELS				: integer				:= 4;
	C_DECIMATION			: integer				:= 32;
	C_M_AXIS_TDEST_WIDTH	: integer				:= 2;
	C_M_AXIS_TDATA_WIDTH	: integer				:= 64;
	C_SIGNED				: boolean				:= FALSE;
	C_CLOCK_RATIO			: integer range 1 to 5	:= 1
);
port (
	din					: in STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);   
	dec_ratio			: in  STD_LOGIC_VECTOR(15 downto 0);
	clkout				: out STD_LOGIC;
	update				: out STD_LOGIC;
	-- AXIS
	m_axis_aclk			: in  STD_LOGIC;
	m_axis_aresetn		: in  STD_LOGIC;
	m_axis_tvalid		: out STD_LOGIC;
	m_axis_tdata		: out STD_LOGIC_VECTOR(C_M_AXIS_TDATA_WIDTH-1 downto 0);
	m_axis_tdest		: out STD_LOGIC_VECTOR(C_M_AXIS_TDEST_WIDTH-1 downto 0);
	m_axis_tready		: in  STD_LOGIC
	);
end axis_AD7403_v1_0;
--------------------------------------------------------------------------------
architecture arch_imp of axis_AD7403_v1_0 is
--------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------
-- function sinc3_bus_width(decimation_ratio : integer) return integer is
-- begin
	-- case decimation_ratio is
		-- when 4		=> return 7;
		-- when 8		=> return 10;
		-- when 16		=> return 13;
		-- when 32		=> return 16;
		-- when 64		=> return 19;
		-- when 128	=> return 22;
		-- when 256	=> return 25;
		-- when others	=> return 25;
	-- end case;
-- end function;
--------------------------------------------------------------------------------
constant NET_GND			: STD_LOGIC	:= '0';
signal mclk_cnt				: integer range 0 to C_CLOCK_RATIO-1	:= 0;
signal clk_en				: STD_LOGIC;
--constant C_FILT_BUS_WIDTH	: integer		:= sinc3_bus_width(C_DECIMATION);
type ch_data_type is array (C_CHANNELS-1 downto 0) of STD_LOGIC_VECTOR(15 downto 0);
signal ch_data				: ch_data_type;
type ch_data_s_type is array (C_CHANNELS-1 downto 0) of SIGNED(16 downto 0);
signal ch_s_data			: ch_data_s_type;
type ch_data_u_type is array (C_CHANNELS-1 downto 0) of UNSIGNED(15 downto 0);
signal ch_u_data			: ch_data_u_type;
signal ch_valid				: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
type sm_state_type is (ST_IDLE, ST_SEND);
signal sm_state				: sm_state_type	:= ST_IDLE;
signal ch_cnt				: integer range 0 to C_CHANNELS-1;
signal mclk					: STD_LOGIC_VECTOR( 1 downto 0);
signal decimation			: STD_LOGIC_VECTOR(15 downto 0);
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
var_dec_gen: if C_DECIMATION = 0 generate
begin
	process(m_axis_aclk)
	begin
		if(m_axis_aclk = '1' and m_axis_aclk'event)then
			decimation		<= dec_ratio;
		end if;
	end process;
end generate;

fixed_dec_gen: if C_DECIMATION /= 0 generate
begin
	decimation	<= STD_LOGIC_VECTOR(TO_UNSIGNED(C_DECIMATION,16));
end generate;
--------------------------------------------------------------------------------
div_clk_gen: if C_CLOCK_RATIO > 1 generate
begin
	process(m_axis_aclk)
	begin
		if(m_axis_aclk = '1' and m_axis_aclk'event)then
			if(mclk_cnt = C_CLOCK_RATIO-1)then
				mclk_cnt	<= 0;
				clk_en		<= '1';
			else
				mclk_cnt	<= mclk_cnt + 1;
				clk_en		<= '0';
			end if;
		end if;
	end process;
end generate;

direct_clk_gen: if C_CLOCK_RATIO = 1 generate
begin
	mclk					<= "10";
	clk_en					<= '1';
end generate;

r2_clk_gen: if C_CLOCK_RATIO = 2 generate
begin
	process(mclk_cnt)
	begin
		case mclk_cnt is
			when 0	=> mclk	<= "00";
			when 1	=> mclk	<= "11";
		end case;
	end process;
end generate;

r3_clk_gen: if C_CLOCK_RATIO = 3 generate
begin
	process(mclk_cnt)
	begin
		case mclk_cnt is
			when 0	=> mclk	<= "00";
			when 1	=> mclk	<= "11";
			when 2	=> mclk	<= "01";
		end case;
	end process;
end generate;

r4_clk_gen: if C_CLOCK_RATIO = 4 generate
begin
	process(mclk_cnt)
	begin
		case mclk_cnt is
			when 0	=> mclk	<= "00";
			when 1	=> mclk	<= "11";
			when 2	=> mclk	<= "11";
			when 3	=> mclk	<= "00";
		end case;
	end process;
end generate;

r5_clk_gen: if C_CLOCK_RATIO = 5 generate
begin
	process(mclk_cnt)
	begin
		case mclk_cnt is
			when 0	=> mclk	<= "00";
			when 1	=> mclk	<= "11";
			when 2	=> mclk	<= "11";
			when 3	=> mclk	<= "01";
			when 4	=> mclk	<= "00";
		end case;
	end process;
end generate;

--mclk_ODDR_inst : ODDR
--generic map(
--	DDR_CLK_EDGE	=> "SAME_EDGE",
--	INIT 			=> '0',
--	SRTYPE			=> "SYNC"
--)
--port map (
--	Q				=> clkout,
--	C				=> m_axis_aclk,
--	CE				=> '1',
--	D1				=> mclk(0),
--	D2				=> mclk(1),
--	R				=> '0',
--	S				=> '0'
--);

mclk_ODDR_inst : ODDRE1
generic map(
	IS_C_INVERTED  => '0',
	IS_D1_INVERTED => '0',
	IS_D2_INVERTED => '0',
	SRVAL	=> '0'
)
port map (
	Q				=> clkout,
	C				=> m_axis_aclk,
	D1				=> mclk(0),
	D2				=> mclk(1),
	SR			=> '0'
);
--------------------------------------------------------------------------------
channels_gen: for i in 0 to C_CHANNELS-1 generate
begin
	ch_inst: sinc3
	generic map(
		C_IMPLEMENTATION 	=> C_IMPLEMENTATION
	)
	port map(
		clk					=> m_axis_aclk,
		clk_en				=> clk_en,
		mdat				=> din(i),
		dec_rate			=> decimation,
		tdata				=> ch_data(i),
		tvalid				=> ch_valid(i)
	);
end generate;
--------------------------------------------------------------------------------
signed_gen: for i in 0 to C_CHANNELS-1 generate
begin
	process(m_axis_aclk)
	begin
		if(m_axis_aclk = '1' and m_axis_aclk'event)then
			ch_u_data(i)		<= UNSIGNED(ch_data(i));
			ch_s_data(i)		<= SIGNED(NET_GND & ch_data(i)) - TO_SIGNED(2**15,17);
		end if;
	end process;
end generate;
--------------------------------------------------------------------------------
serial_out_gen: if C_OUT_TYPE = 0 generate
begin
	process(m_axis_aclk)
	begin
		if(m_axis_aclk = '1' and m_axis_aclk'event)then
			case sm_state is
				when ST_IDLE	=> 
					ch_cnt				<= 0;
					m_axis_tvalid		<= '0';
					update				<= '0';
					if(ch_valid(0) = '1')then	-- Wait for first channel
						sm_state		<= ST_SEND;
					end if;
				when ST_SEND	=> 		-- Loop for all channels regardless of m_axis_tready
					m_axis_tvalid		<= '1';
					update				<= '1';
					if(C_SIGNED = FALSE)then	
						m_axis_tdata		<= STD_LOGIC_VECTOR(resize(ch_u_data(ch_cnt),C_M_AXIS_TDATA_WIDTH));	-- Unsigned
					else																									-- Signed
						m_axis_tdata		<= STD_LOGIC_VECTOR(resize(ch_s_data(ch_cnt)(15 downto 0),C_M_AXIS_TDATA_WIDTH));
					end if;
					m_axis_tdest		<= STD_LOGIC_VECTOR(TO_UNSIGNED(ch_cnt,C_M_AXIS_TDEST_WIDTH));
					if(ch_cnt = C_CHANNELS-1)then
						sm_state		<= ST_IDLE;
					else
						ch_cnt			<= ch_cnt + 1;
					end if;
			end case;
		end if;
	end process;
end generate;
--------------------------------------------------------------------------------
parallel_out_gen: if C_OUT_TYPE = 1 generate
begin
	m_axis_tdest	<= (others => '0');	-- Not used
	m_axis_tvalid	<= ch_valid(0);
	update			<= ch_valid(0);
	ch_out_gen: for i in 0 to C_CHANNELS-1 generate
	begin
		uns_parralel_gen: if C_SIGNED = FALSE generate
			m_axis_tdata(C_DATA_BITS*i+C_DATA_BITS-1 downto C_DATA_BITS*i)	<= STD_LOGIC_VECTOR(resize(ch_u_data(i),C_DATA_BITS));
		end generate;
		sig_parralel_gen: if C_SIGNED = TRUE generate
			m_axis_tdata(C_DATA_BITS*i+C_DATA_BITS-1 downto C_DATA_BITS*i)	<= STD_LOGIC_VECTOR(resize(ch_s_data(i)(15 downto 0),C_DATA_BITS));
		end generate;
	end generate;
end generate;
--------------------------------------------------------------------------------
end arch_imp;
