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
library utillib;
use utillib.all;
--------------------------------------------------------------------------------

entity AXI_Quad_Trigger_v1_0 is
generic (
	-- Users to add parameters here
	C_CHANNELS			: INTEGER	:= 4;
	C_DATA_WIDTH		: INTEGER	:= 16;
	C_MAX_DELAY			: INTEGER 	:= 64;
	C_COREID			: BIT_VECTOR :=  X"0000_0000";
	--C_USE_TRIGGER_FLAGS	: integer range 0 to 1 := 0;
	C_USE_EXT_TRIGGER	: integer range 0 to 1 := 0;
	C_EXT_TRIGGER_WIDTH : integer := 1;
	C_TRIGGER_OUT_LENGTH	: integer := 100;
	--C_FLAGS_WIDTH		: integer range 0 to 15 := 15;
	-- User parameters ends
	-- Do not modify the parameters beyond this line
	-- Parameters of Axi Slave Bus Interface S_AXI
	C_S_AXI_DATA_WIDTH	: INTEGER	:= 32;
	C_S_AXI_ADDR_WIDTH	: INTEGER	:= 7
);
port (
	-- Users to add ports here
	s_axis_aclk			: in  STD_LOGIC;
	s_axis_aresetn		: in  STD_LOGIC;
	s_axis_tvalid		: in  STD_LOGIC;
	s_axis_tready		: out STD_LOGIC;
	s_axis_tdata		: in  STD_LOGIC_VECTOR(C_CHANNELS*C_DATA_WIDTH-1 downto 0);
	
	trig_req			: out STD_LOGIC;
	trig_ack			: in  STD_LOGIC;
	trigger_flags		: out STD_LOGIC_VECTOR(C_CHANNELS*4+(C_EXT_TRIGGER_WIDTH*C_USE_EXT_TRIGGER)-1 downto 0);
	ext_trigger			: in  STD_LOGIC_VECTOR(C_EXT_TRIGGER_WIDTH-1 downto 0);
	trigger_out			: out STD_LOGIC;
	-- User ports ends
	-- Ports of Axi Slave Bus Interface S_AXI
	s_axi_aclk			: in  STD_LOGIC;
	s_axi_aresetn		: in  STD_LOGIC;
	s_axi_awaddr		: in  STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
	s_axi_awprot		: in  STD_LOGIC_VECTOR(2 downto 0);
	s_axi_awvalid		: in  STD_LOGIC;
	s_axi_awready		: out STD_LOGIC;
	s_axi_wdata			: in  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
	s_axi_wstrb			: in  STD_LOGIC_VECTOR((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
	s_axi_wvalid		: in  STD_LOGIC;
	s_axi_wready		: out STD_LOGIC;
	s_axi_bresp			: out STD_LOGIC_VECTOR(1 downto 0);
	s_axi_bvalid		: out STD_LOGIC;
	s_axi_bready		: in  STD_LOGIC;
	s_axi_araddr		: in  STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
	s_axi_arprot		: in  STD_LOGIC_VECTOR(2 downto 0);
	s_axi_arvalid		: in  STD_LOGIC;
	s_axi_arready		: out STD_LOGIC;
	s_axi_rdata			: out STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
	s_axi_rresp			: out STD_LOGIC_VECTOR(1 downto 0);
	s_axi_rvalid		: out STD_LOGIC;
	s_axi_rready		: in  STD_LOGIC
);
end AXI_Quad_Trigger_v1_0;

architecture arch_imp of AXI_Quad_Trigger_v1_0 is
--------------------------------------------------------------------------------
constant C_REGS_NUM			: INTEGER := 32;
constant zero_vec			: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0) := (others => '0');
constant zero_ext			: STD_LOGIC_VECTOR(C_EXT_TRIGGER_WIDTH-1 downto 0) := (others => '0');
signal control_reg			: STD_LOGIC_VECTOR(31 downto 0);
signal trig_ch				: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal regs_wr				: STD_LOGIC_VECTOR(C_REGS_NUM-1 downto 0);
signal regs_out				: STD_LOGIC_VECTOR(C_REGS_NUM*32-1 downto 0);
signal regs_in				: STD_LOGIC_VECTOR(C_REGS_NUM*32-1 downto 0);
type regs_type is array (0 to C_REGS_NUM-1) of STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
signal slv_reg_rd			: regs_type;
signal slv_reg_wr			: regs_type;

type ch_data_type is array(C_CHANNELS-1 downto 0) of STD_LOGIC_VECTOR(C_DATA_WIDTH-1 downto 0);
signal trig_rising_level	: ch_data_type;
signal trig_falling_level	: ch_data_type;
signal trig_rising_slew		: ch_data_type;
signal trig_fallig_slew		: ch_data_type;
signal rising_level_trig_in			: ch_data_type;
signal falling_level_trig_in		: ch_data_type;
signal srl_in						: ch_data_type;
signal rising_slew_trig_in			: ch_data_type;
signal falling_slew_trig_in			: ch_data_type;
signal dly_data						: ch_data_type;
signal level_hysteresis				: ch_data_type;

signal rising_level_trig_valid		: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal falling_level_trig_valid		: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal srl_valid					: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal rising_slew_trig_valid		: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal falling_slew_trig_valid		: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);

signal enable_rising_level	: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal enable_falling_level	: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal enable_rising_slew	: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal enable_falling_slew	: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);

signal fire_rising_level	: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal fire_falling_level	: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal fire_rising_slew		: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal fire_falling_slew	: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal rising_level_flag	: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);
signal falling_level_flag	: STD_LOGIC_VECTOR(C_CHANNELS-1 downto 0);

signal fire_external_level		: STD_LOGIC_VECTOR(C_EXT_TRIGGER_WIDTH-1 downto 0);
signal enable_external_level	: STD_LOGIC_VECTOR(C_EXT_TRIGGER_WIDTH-1 downto 0);

signal time_hysteresis_lock		: STD_LOGIC;
signal time_hysteresis_cnt		: UNSIGNED(31 downto 0);
--signal level_hysteresis			: STD_LOGIC_VECTOR(31 downto 0);
--signal dly_data					: STD_LOGIC_VECTOR(C_CHANNELS*C_DATA_WIDTH-1 downto 0);
type vec_Cx8_type is array (C_CHANNELS-1 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
signal delay					: vec_Cx8_type;
--signal trigger_out_cnt			: integer range 0 to C_TRIGGER_OUT_LENGTH-1 := 0;
signal trigger_out_cnt			: UNSIGNED(31 downto 0);

signal rising_level_trigger		: STD_LOGIC;
signal falling_level_trigger	: STD_LOGIC;
signal rising_slew_trigger		: STD_LOGIC;
signal falling_slew_trigger		: STD_LOGIC;
signal external_trigger			: STD_LOGIC;
signal ext_trigger_i			: STD_LOGIC_VECTOR(C_EXT_TRIGGER_WIDTH-1 downto 0);
signal time_hysteresis_reg		: UNSIGNED(31 downto 0);
signal trigger_out_reg			: UNSIGNED(31 downto 0);
--------------------------------------------------------------------------------
attribute ASYNC_REG							: string;
attribute ASYNC_REG of enable_rising_level	: signal is "true";
attribute ASYNC_REG of enable_falling_level	: signal is "true";
attribute ASYNC_REG of enable_rising_slew	: signal is "true";
attribute ASYNC_REG of enable_falling_slew	: signal is "true";
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
s_axis_tready		<= '1';
-- Instantiation of Axi Bus Interface S_AXI
AXI_Quad_Trigger_v1_0_S_AXI_inst : entity utillib.AXI_Quad_Trigger_v1_0_S_AXI
generic map (
	-- Users to add parameters here
	OPT_MEM_ADDR_BITS 	=> 4,
	C_REGS_NUM			=> C_REGS_NUM,
	C_S_AXI_DATA_WIDTH	=> C_S_AXI_DATA_WIDTH,
	C_S_AXI_ADDR_WIDTH	=> C_S_AXI_ADDR_WIDTH
)
port map (
	--
	regs_wr			=> regs_wr,
	regs_out		=> regs_out,
	regs_in			=> regs_in,
	--
	S_AXI_ACLK		=> s_axi_aclk,
	S_AXI_ARESETN	=> s_axi_aresetn,
	S_AXI_AWADDR	=> s_axi_awaddr,
	S_AXI_AWPROT	=> s_axi_awprot,
	S_AXI_AWVALID	=> s_axi_awvalid,
	S_AXI_AWREADY	=> s_axi_awready,
	S_AXI_WDATA		=> s_axi_wdata,
	S_AXI_WSTRB		=> s_axi_wstrb,
	S_AXI_WVALID	=> s_axi_wvalid,
	S_AXI_WREADY	=> s_axi_wready,
	S_AXI_BRESP		=> s_axi_bresp,
	S_AXI_BVALID	=> s_axi_bvalid,
	S_AXI_BREADY	=> s_axi_bready,
	S_AXI_ARADDR	=> s_axi_araddr,
	S_AXI_ARPROT	=> s_axi_arprot,
	S_AXI_ARVALID	=> s_axi_arvalid,
	S_AXI_ARREADY	=> s_axi_arready,
	S_AXI_RDATA		=> s_axi_rdata,
	S_AXI_RRESP		=> s_axi_rresp,
	S_AXI_RVALID	=> s_axi_rvalid,
	S_AXI_RREADY	=> s_axi_rready
);
regs_gen: for i in 0 to C_REGS_NUM-1 generate
begin
	slv_reg_wr(i)					<= regs_out(i*32+31 downto i*32);
	regs_in(i*32+31 downto i*32)	<= slv_reg_rd(i);
end generate;
--------------------------------------------------------------------------------
process(s_axis_aclk)
begin
	if(s_axis_aclk = '1' and s_axis_aclk'event)then
		for i in 0 to C_CHANNELS-1 loop
			rising_level_trig_in(i)		<= s_axis_tdata(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i);
			falling_level_trig_in(i)	<= s_axis_tdata(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i);
			srl_in(i)					<= s_axis_tdata(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i);
			rising_slew_trig_in(i)		<= s_axis_tdata(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i);
			falling_slew_trig_in(i)		<= s_axis_tdata(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i);
		end loop;
		rising_level_trig_valid		<= (others => s_axis_tvalid);
		falling_level_trig_valid	<= (others => s_axis_tvalid);
		srl_valid					<= (others => s_axis_tvalid);
		rising_slew_trig_valid		<= (others => s_axis_tvalid);
		falling_slew_trig_valid		<= (others => s_axis_tvalid);
	end if;
end process;

trig_det_gen: for i in 0 to C_CHANNELS-1 generate
begin
	rl_trig_inst: entity utillib.level_trig
	generic map(
		C_WIDTH				=> C_DATA_WIDTH
	)
	port map(
		s_axis_aclk			=> s_axis_aclk,
		s_axis_aresetn		=> s_axis_aresetn,
		--s_axis_tvalid		=> s_axis_tvalid,
		s_axis_tready		=> open,
		--s_axis_tdata		=> s_axis_tdata(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i),
		s_axis_tvalid		=> rising_level_trig_valid(i),
		s_axis_tdata		=> rising_level_trig_in(i),
		level				=> trig_rising_level(i),
		--hysteresis			=> level_hysteresis(C_DATA_WIDTH-1 downto 0),
		hysteresis			=> level_hysteresis(i),
		trig_out			=> fire_rising_level(i),
		flag_out			=> rising_level_flag(i)
	);

	fl_trig_inst: entity utillib.level_trig
	generic map(
		C_WIDTH				=> C_DATA_WIDTH
	)
	port map(
		s_axis_aclk			=> s_axis_aclk,
		s_axis_aresetn		=> s_axis_aresetn,
		--s_axis_tvalid		=> s_axis_tvalid,
		s_axis_tready		=> open,
		s_axis_tdata		=> trig_falling_level(i),
		--level				=> s_axis_tdata(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i),
		s_axis_tvalid		=> falling_level_trig_valid(i),
		level				=> falling_level_trig_in(i),
		--hysteresis			=> level_hysteresis(C_DATA_WIDTH-1 downto 0),
		hysteresis			=> level_hysteresis(i),
		trig_out			=> fire_falling_level(i),
		flag_out			=> falling_level_flag(i)
	);

	delay_inst: entity utillib.srl_delay
	generic map(
		C_WIDTH				=> C_DATA_WIDTH,
		C_MAX_DELAY			=> C_MAX_DELAY
	)
	port map(
		clk 				=> s_axis_aclk,
		--ce 					=> s_axis_tvalid,
		delay				=> delay(i),
		--data_in				=> s_axis_tdata(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i),
		ce 					=> srl_valid(i),
		data_in				=> srl_in(i),
		--data_out			=> dly_data(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i)
		data_out			=> dly_data(i)
	);

	rs_trig_inst: entity utillib.slew_trig
	generic map(
		C_WIDTH				=> C_DATA_WIDTH
	)
	port map(
		s_axis_aclk			=> s_axis_aclk,
		s_axis_aresetn		=> s_axis_aresetn,
		--s_axis_tvalid		=> s_axis_tvalid,
		s_axis_tready		=> open,
		--s_axis_tdata		=> s_axis_tdata(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i),
		s_axis_tvalid		=> rising_slew_trig_valid(i),
		s_axis_tdata		=> rising_slew_trig_in(i),
		--dly_data			=> dly_data(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i),
		dly_data			=> dly_data(i),
		level				=> trig_rising_slew(i),
		trig_out			=> fire_rising_slew(i)
	);
	
	fs_trig_inst: entity utillib.slew_trig
	generic map(
		C_WIDTH				=> C_DATA_WIDTH
	)
	port map(
		s_axis_aclk			=> s_axis_aclk,
		s_axis_aresetn		=> s_axis_aresetn,
		--s_axis_tvalid		=> s_axis_tvalid,
		s_axis_tready		=> open,
		--s_axis_tdata		=> dly_data(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i),
		s_axis_tdata		=> dly_data(i),
		--dly_data			=> s_axis_tdata(C_DATA_WIDTH*i+C_DATA_WIDTH-1 downto C_DATA_WIDTH*i),
		s_axis_tvalid		=> falling_slew_trig_valid(i),
		dly_data			=> falling_slew_trig_in(i),
		level				=> trig_fallig_slew(i),
		trig_out			=> fire_falling_slew(i)
	);
end generate;
--------------------------------------------------------------------------------
ext_trig_gen: if C_USE_EXT_TRIGGER = 1 generate
begin
	process(s_axis_aclk)
	begin
		if(s_axis_aclk = '1' and s_axis_aclk'event)then
			ext_trigger_i				<= ext_trigger;
			enable_external_level		<= slv_reg_wr(22)(C_EXT_TRIGGER_WIDTH-1 downto 0);
			slv_reg_rd(23)				<= STD_LOGIC_VECTOR(resize(UNSIGNED(ext_trigger_i),32));
			for i in 0 to C_EXT_TRIGGER_WIDTH-1 loop
				if(trig_ack = '1')then
					trigger_flags(C_CHANNELS*4+i)		<= '0';
				else
					if((fire_external_level(i) and enable_external_level(i)) /= '0')then
						trigger_flags(C_CHANNELS*4+i)	<= '1';
					end if;
				end if;
				-- if((fire_external_level(i) and enable_external_level(i)) /= '0')then
					-- trigger_flags(C_CHANNELS*4+i)	<= '1';
				-- else
					-- trigger_flags(C_CHANNELS*4+i)	<= '0';
				-- end if;
			end loop;
		end if;
	end process;
	
	ext_chan_gen: for i in 0 to C_EXT_TRIGGER_WIDTH-1 generate
	begin
		ext_trig_det_inst: entity utillib.ext_trig
		port map(
			clk			=> s_axis_aclk,
			trig_in		=> ext_trigger_i(i),
			trig_out	=> fire_external_level(i)
		);
	end generate;
end generate;

process(s_axis_aclk)
begin
	if(s_axis_aclk = '1' and s_axis_aclk'event)then
		enable_rising_level			<= slv_reg_wr(3)(C_CHANNELS-1 downto 0);
		enable_falling_level		<= slv_reg_wr(3)(C_CHANNELS+8-1 downto 8);
		enable_rising_slew			<= slv_reg_wr(3)(C_CHANNELS+16-1 downto 16);
		enable_falling_slew			<= slv_reg_wr(3)(C_CHANNELS+24-1 downto 24);
		
		for i in 0 to C_CHANNELS-1 loop
			trig_rising_level(i)	<= slv_reg_wr(4+i)(C_DATA_WIDTH-1 downto 0);
			trig_falling_level(i)	<= slv_reg_wr(8+i)(C_DATA_WIDTH-1 downto 0);
			trig_rising_slew(i)		<= slv_reg_wr(12+i)(C_DATA_WIDTH-1 downto 0);
			trig_fallig_slew(i)		<= slv_reg_wr(16+i)(C_DATA_WIDTH-1 downto 0);
			delay(i)				<= slv_reg_wr(20)(i*8+7 downto i*8);
			level_hysteresis(i)		<= slv_reg_wr(21);
		end loop;
		--level_hysteresis			<= slv_reg_wr(21);
		
		for i in 0 to C_CHANNELS-1 loop
			trigger_flags(i*4+0)			<= rising_level_flag(i) and enable_rising_level(i);
			trigger_flags(i*4+1)			<= falling_level_flag(i) and enable_falling_level(i);
			if(trig_ack = '1')then
				trigger_flags(i*4+2)		<= '0';
				trigger_flags(i*4+3)		<= '0';
			else
				if((fire_rising_slew(i) and enable_rising_slew(i)) /= '0')then
					trigger_flags(i*4+2)	<= '1';
				end if;
				if((fire_falling_slew(i) and enable_falling_slew(i)) /= '0')then
					trigger_flags(i*4+3)	<= '1';
				end if;
			end if;
		end loop;
		
		
		if((fire_rising_level and enable_rising_level) /= zero_vec)then
			rising_level_trigger	<= '1';
		else
			rising_level_trigger	<= '0';
		end if;
		if((fire_falling_level and enable_falling_level) /= zero_vec)then
			falling_level_trigger	<= '1';
		else
			falling_level_trigger	<= '0';
		end if;
		if((fire_rising_slew and enable_rising_slew) /= zero_vec)then
			rising_slew_trigger		<= '1';
		else
			rising_slew_trigger		<= '0';
		end if;
		if((fire_falling_slew and enable_falling_slew) /= zero_vec)then
			falling_slew_trigger	<= '1';
		else
			falling_slew_trigger	<= '0';
		end if;
		if((fire_external_level and enable_external_level) /= zero_ext)then
			external_trigger	<= '1';
		else
			external_trigger	<= '0';
		end if;
		
		time_hysteresis_reg		<= UNSIGNED(slv_reg_wr(2));
		trigger_out_reg			<= UNSIGNED(slv_reg_wr(24));--C_TRIGGER_OUT_LENGTH - 1;
		
		if(trig_ack = '1')then
			trig_req	<= '0';
		else
			if(
				-- (((fire_rising_level and enable_rising_level) /= zero_vec) or
				-- ((fire_falling_level and enable_falling_level) /= zero_vec) or
				-- ((fire_rising_slew and enable_rising_slew) /= zero_vec) or 
				-- ((fire_falling_slew and enable_falling_slew) /= zero_vec) or
				-- ((fire_external_level and enable_external_level) /= zero_ext)
				((rising_level_trigger = '1') or 
				(falling_level_trigger = '1') or 
				(rising_slew_trigger = '1') or 
				(falling_slew_trigger = '1') or 
				(external_trigger = '1')
				) and (time_hysteresis_lock = '0')
				)then
					--time_hysteresis_cnt		<= UNSIGNED(slv_reg_wr(2));
					time_hysteresis_cnt		<= time_hysteresis_reg;
					time_hysteresis_lock	<= '1';
					trig_req				<= '1';
					--trigger_out_cnt 		<= UNSIGNED(slv_reg_wr(24));--C_TRIGGER_OUT_LENGTH - 1;
					trigger_out_cnt 		<= trigger_out_reg;
					trigger_out				<= '1';
			else
				if(trigger_out_cnt = TO_UNSIGNED(0,32))then
					trigger_out			<= '0';
				else
					trigger_out_cnt		<= trigger_out_cnt - 1;
				end if;
				if(time_hysteresis_cnt /= TO_UNSIGNED(0,32))then
					time_hysteresis_cnt	<= time_hysteresis_cnt - 1;
				else
					time_hysteresis_lock	<= '0';
				end if;
			end if;
		end if;
	end if;
end process;
--------------------------------------------------------------------------------
end arch_imp;
