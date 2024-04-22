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
use ieee.STD_LOGIC_arith.all;
use ieee.STD_LOGIC_unsigned.all;
library AXI_lib;
use AXI_lib.all;
--library te_common_v1_0;
--use te_common_v1_0.all;
--------------------------------------------------------------------------------
entity AXI_OldData_Capture_v1_0 is
generic (
	-- Users to add parameters here
	C_CHANNELS	 					: integer	:= 9;
	C_CDATA_WIDTH 					: integer	:= 16;
	C_M_AXIS_CMD_TDATA_WIDTH		: integer range 8 to 32 := 32;
	C_COREID						: BIT_VECTOR := x"00000000";
	C_CAPTURE_CHANNELS				: INTEGER 	:= 9;
	C_CMD_AXIS						: integer range 0 to 1 := 0;
	C_USE_TRIGGER					: integer range 0 to 1 := 1;
	C_USE_TIMESTAMP					: BOOLEAN := FALSE;
	C_USE_ADC_CLK					: BOOLEAN := FALSE;
	-- User parameters ends
	-- Do not modify the parameters beyond this line

	-- Parameters of Axi Slave Bus Interface S_AXI
	C_S_AXI_DATA_WIDTH				: integer range 32 to 32 := 32;
	C_S_AXI_ADDR_WIDTH				: integer range 6 to 6 := 6;
	-- Parameters of Axi Slave Bus Interface S_AXIS_S2MM
	-- Parameters of Axi Master Bus Interface M_AXIS_S2MM
	C_M_AXIS_S2MM_TDATA_WIDTH		: integer	:= 64;
	-- Parameters of Axi Slave Bus Interface S_AXIS_S2MM_STS
	C_S_AXIS_S2MM_STS_TDATA_WIDTH	: integer range 8 to 32 := 8;
	-- Parameters of Axi Master Bus Interface M_AXIS_S2MM_CMD
	C_M_AXIS_S2MM_CMD_TDATA_WIDTH	: integer range 72 to 72 := 72
);
port (
	-- Users to add ports here
	axis_fifo_data_count			: in  STD_LOGIC_VECTOR(31 downto 0);
	trigger 						: in  STD_LOGIC;
	trigger_ack 					: out STD_LOGIC;
	interrupt 						: out STD_LOGIC;
	timestamp						: in  STD_LOGIC_VECTOR(63 downto 0);
	adc_clk							: in  STD_LOGIC;
	-- Data mover S2MM control
	-- s2mm_err 						: in  STD_LOGIC;
	-- s2mm_halt 						: out STD_LOGIC;
	-- s2mm_halt_cmplt					: in  STD_LOGIC;

	-- User ports ends
	-- Do not modify the ports beyond this line
	-- Ports of Axi Slave Bus Interface S_AXI
	s_axi_aclk						: in  STD_LOGIC;
	s_axi_aresetn					: in  STD_LOGIC;
	s_axi_awaddr					: in  STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
	s_axi_awprot					: in  STD_LOGIC_VECTOR(2 downto 0);
	s_axi_awvalid					: in  STD_LOGIC;
	s_axi_awready					: out STD_LOGIC;
	s_axi_wdata						: in  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
	s_axi_wstrb						: in  STD_LOGIC_VECTOR((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
	s_axi_wvalid					: in  STD_LOGIC;
	s_axi_wready					: out STD_LOGIC;
	s_axi_bresp						: out STD_LOGIC_VECTOR(1 downto 0);
	s_axi_bvalid					: out STD_LOGIC;
	s_axi_bready					: in  STD_LOGIC;
	s_axi_araddr					: in  STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
	s_axi_arprot					: in  STD_LOGIC_VECTOR(2 downto 0);
	s_axi_arvalid					: in  STD_LOGIC;
	s_axi_arready					: out STD_LOGIC;
	s_axi_rdata						: out STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
	s_axi_rresp						: out STD_LOGIC_VECTOR(1 downto 0);
	s_axi_rvalid					: out STD_LOGIC;
	s_axi_rready					: in  STD_LOGIC;

	-- Ports of Axi Slave Bus Interface S_AXIS_S2MM
	s_axis_s2mm_aclk				: in  STD_LOGIC;
	s_axis_s2mm_aresetn				: in  STD_LOGIC;
	s_axis_s2mm_tready				: out STD_LOGIC;
	s_axis_s2mm_tdata				: in  STD_LOGIC_VECTOR((C_CHANNELS*C_CDATA_WIDTH)-1 downto 0);
	-- s_axis_s2mm_tlast				: in  STD_LOGIC;
	s_axis_s2mm_tvalid				: in  STD_LOGIC;
			
	m_axis_cmd_aclk					: in  STD_LOGIC;
	m_axis_cmd_aresetn				: in  STD_LOGIC;
	m_axis_cmd_tvalid				: out STD_LOGIC;
	m_axis_cmd_tdata				: out STD_LOGIC_VECTOR(C_M_AXIS_CMD_TDATA_WIDTH-1 downto 0);
	m_axis_cmd_tready				: in  STD_LOGIC;

	-- Ports of Axi Master Bus Interface M_AXIS_S2MM
	m_axis_s2mm_aclk				: in  STD_LOGIC;
	m_axis_s2mm_aresetn				: in  STD_LOGIC;
	m_axis_s2mm_tvalid				: out STD_LOGIC;
	m_axis_s2mm_tdata				: out STD_LOGIC_VECTOR(C_M_AXIS_S2MM_TDATA_WIDTH-1 downto 0);
	m_axis_s2mm_tkeep				: out STD_LOGIC_VECTOR((C_M_AXIS_S2MM_TDATA_WIDTH/8)-1 downto 0);
	m_axis_s2mm_tlast				: out STD_LOGIC;
	m_axis_s2mm_tready				: in  STD_LOGIC;
	--m_fifo_aresetn					: out STD_LOGIC;

	-- Ports of Axi Slave Bus Interface S_AXIS_S2MM_STS
	s_axis_s2mm_sts_aclk			: in  STD_LOGIC;
	s_axis_s2mm_sts_aresetn			: in  STD_LOGIC;
	s_axis_s2mm_sts_tready			: out STD_LOGIC;
	s_axis_s2mm_sts_tdata			: in  STD_LOGIC_VECTOR(C_S_AXIS_S2MM_STS_TDATA_WIDTH-1 downto 0);
	s_axis_s2mm_sts_tkeep			: in  STD_LOGIC_VECTOR((C_S_AXIS_S2MM_STS_TDATA_WIDTH/8)-1 downto 0);
	s_axis_s2mm_sts_tlast			: in  STD_LOGIC;
	s_axis_s2mm_sts_tvalid			: in  STD_LOGIC;
		
	-- Ports of Axi Master Bus Interface M_AXIS_S2MM_CMD
	m_axis_s2mm_cmd_aclk			: in  STD_LOGIC;
	m_axis_s2mm_cmd_aresetn			: in  STD_LOGIC;
	m_axis_s2mm_cmd_tvalid			: out STD_LOGIC;
	m_axis_s2mm_cmd_tdata			: out STD_LOGIC_VECTOR(C_M_AXIS_S2MM_CMD_TDATA_WIDTH-1 downto 0);
	m_axis_s2mm_cmd_tready			: in  STD_LOGIC
);
end AXI_OldData_Capture_v1_0;
--------------------------------------------------------------------------------
architecture arch_imp of AXI_OldData_Capture_v1_0 is
--------------------------------------------------------------------------------
-- Constants
constant Low  			: STD_LOGIC	:= '0';
constant High 			: STD_LOGIC	:= '1';

signal base_address 	: STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0); 
signal transfer_size	: STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);

signal DM_last_status 	: STD_LOGIC_VECTOR(C_S_AXIS_S2MM_STS_TDATA_WIDTH-1 downto 0);

signal do_read			: STD_LOGIC;
signal coreid_data		: STD_LOGIC;
signal coreid_sync		: STD_LOGIC;
signal interrupt_i		: STD_LOGIC;
signal Core_Status_0	: STD_LOGIC_VECTOR(31 downto 0);
signal Core_Control_1	: STD_LOGIC_VECTOR(31 downto 0);
signal Common_Status	: STD_LOGIC_VECTOR(31 downto 0);
signal Common_Control	: STD_LOGIC_VECTOR(31 downto 0);

signal input_mux_cnt	: INTEGER range 0 to (C_CHANNELS*C_CDATA_WIDTH)/64 := 0;
signal data_buf			: STD_LOGIC_VECTOR(((C_CHANNELS*C_CDATA_WIDTH)/64)*64+63 downto 0);
signal tlast_save		: STD_LOGIC;

signal soft_trigger			: STD_LOGIC;
signal soft_i				: STD_LOGIC;
signal transfer_enable		: STD_LOGIC;
signal transfer_enable_i	: STD_LOGIC;
signal transfer_active		: STD_LOGIC;
signal transfer_count		: STD_LOGIC_VECTOR(31 downto 0);

type sm_state_type	is (
	ST_IDLE, ST_CMD, ST_DATA, ST_SEND,
	ST_CHUNK_END, ST_PACKET_END, ST_WAIT,
	ST_INT, ST_END, ST_FETCH);
signal sm_state	: sm_state_type := ST_IDLE;
signal out_word_tvalid	: STD_LOGIC;

signal transfer_start	: STD_LOGIC;	-- Send command sequence to datamover
signal transfer_start_i	: STD_LOGIC;	-- Send command sequence to datamover
-- signal start_sr			: STD_LOGIC_VECTOR(3 downto 0);
signal out_fifo_reset	: STD_LOGIC;	-- Reset signal for output FIFO
signal out_fifo_tvalid	: STD_LOGIC;	-- Force tvalid to send tlast
signal interrupt_enable	: STD_LOGIC;
signal transfer_i		: STD_LOGIC;
-- signal transfer_end_sr	: STD_LOGIC_VECTOR(7 downto 0);
signal transfer_end		: STD_LOGIC;
signal transfer_end_i	: STD_LOGIC;
-- signal trigger_sr		: STD_LOGIC_VECTOR(1 downto 0);
-- signal status_read		: STD_LOGIC;

type sm_mux_state_type	is (
	ST_MUX_IDLE, ST_MUX_TRANSFER);
signal sm_mux_state		: sm_mux_state_type := ST_MUX_IDLE;
signal axis_fifo_data_count_i	: STD_LOGIC_VECTOR(31 downto 0);
signal pretrigger_length		: STD_LOGIC_VECTOR(31 downto 0);
signal pretrigger_length_i		: STD_LOGIC_VECTOR(31 downto 0);
signal command_tvalid			: STD_LOGIC;
signal command_tdata			: STD_LOGIC_VECTOR(31 downto 0);
signal user_trigger				: STD_LOGIC;
--signal m_fifo_aresetn_i			: STD_LOGIC;
-- signal soft_sr			: STD_LOGIC_VECTOR( 1 downto 0);

constant TYPE_field				: STD_LOGIC := '1'; -- INCREMENTAL
constant DSA_field				: STD_LOGIC_VECTOR(5 downto 0) := "000000";
constant DRR_field				: STD_LOGIC := '0';
constant RSV_field				: STD_LOGIC_VECTOR(3 downto 0) := "0000";

signal EOF_field				: STD_LOGIC := '0';
signal TAG_field				: STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal SADDR_field				: STD_LOGIC_VECTOR(31 downto 0);
signal BTT_field				: STD_LOGIC_VECTOR(22 downto 0);
signal timeout_cnt				: integer range 0 to 256 := 0;
signal s_axis_s2mm_tready_i		: STD_LOGIC;
signal chunk_cnt				: integer range 0 to ((C_CHANNELS*C_CDATA_WIDTH)/64) := 0;
signal interrupt_en				: STD_LOGIC;
signal transfer_status			: STD_LOGIC_VECTOR(31 downto 0);
signal ext_trigger				: STD_LOGIC;
signal core_debug				: STD_LOGIC_VECTOR(31 downto 0);
signal trigger_delay			: STD_LOGIC_VECTOR(31 downto 0);
signal trigger_delay_cnt		: STD_LOGIC_VECTOR(31 downto 0);
signal delayed_ext_trigger		: STD_LOGIC;
signal delayed_int_trigger		: STD_LOGIC;
signal manual_fetch_mode		: STD_LOGIC;
signal manual_fetch				: STD_LOGIC;
signal fetch_data				: STD_LOGIC_VECTOR(63 downto 0);
signal timestamp_cap			: STD_LOGIC_VECTOR(63 downto 0);
signal decimation_cnt			: STD_LOGIC_VECTOR(31 downto 0);
signal decimation_en			: STD_LOGIC;
signal adc_clk_i				: STD_LOGIC;
signal soft_ext_trigger			: STD_LOGIC;
signal trigger_i				: STD_LOGIC;
--++--++--++--++--++--++--++--++--++--++--++--++--++--++--++--++--++--++--++--++
-- Debug
--++--++--++--++--++--++--++--++--++--++--++--++--++--++--++--++--++--++--++--++
-- attribute mark_debug					: string;
--attribute keep 								: string;
--attribute keep of m_fifo_aresetn_i			: signal is "true";
-- -------------------------------------------------------------------------------
-- attribute mark_debug of transfer_count		: signal is "true";
-- attribute mark_debug of sm_state	: signal is "true";
signal dbg_cnt			: STD_LOGIC_VECTOR(63 downto 0) := x"11223344_55667788";
--------------------------------------------------------------------------------
attribute ASYNC_REG							: string;

attribute ASYNC_REG of pretrigger_length_i	: signal is "true";
attribute ASYNC_REG of transfer_enable_i	: signal is "true";

attribute ASYNC_REG of m_axis_cmd_tdata		: signal is "true";
attribute ASYNC_REG of timestamp_cap		: signal is "true";
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
-- Instantiation of Axi Bus Interface S_AXI
AXI_OldData_Capture_v1_0_S_AXI_inst: entity AXI_lib.AXI_OldData_Capture_v1_0_S_AXI
generic map (
	C_S_AXI_DATA_WIDTH	=> C_S_AXI_DATA_WIDTH,
	C_S_AXI_ADDR_WIDTH	=> C_S_AXI_ADDR_WIDTH
)
port map (
	do_read				=> do_read,
	Core_Status_0		=> Core_Status_0,
	Core_Control_1		=> Core_Control_1,
	Common_Control		=> Common_Control,
	Common_Status 		=> Common_Status,
	base_address		=> base_address,
	transfer_size 		=> transfer_size,
	pretrigger_length	=> pretrigger_length,
	command_tvalid		=> command_tvalid,
	command_tdata		=> command_tdata,
	trigger_out			=> user_trigger,
	core_debug			=> core_debug,
	trigger_delay		=> trigger_delay,
	manual_fetch		=> manual_fetch,
	fetch_data			=> fetch_data,
	timestamp			=> timestamp_cap,
	
	S_AXI_ACLK			=> s_axi_aclk,
	S_AXI_ARESETN		=> s_axi_aresetn,
	S_AXI_AWADDR		=> s_axi_awaddr,
	S_AXI_AWPROT		=> s_axi_awprot,
	S_AXI_AWVALID		=> s_axi_awvalid,
	S_AXI_AWREADY		=> s_axi_awready,
	S_AXI_WDATA			=> s_axi_wdata,
	S_AXI_WSTRB			=> s_axi_wstrb,
	S_AXI_WVALID		=> s_axi_wvalid,
	S_AXI_WREADY		=> s_axi_wready,
	S_AXI_BRESP			=> s_axi_bresp,
	S_AXI_BVALID		=> s_axi_bvalid,
	S_AXI_BREADY		=> s_axi_bready,
	S_AXI_ARADDR		=> s_axi_araddr,
	S_AXI_ARPROT		=> s_axi_arprot,
	S_AXI_ARVALID		=> s_axi_arvalid,
	S_AXI_ARREADY		=> s_axi_arready,
	S_AXI_RDATA			=> s_axi_rdata,
	S_AXI_RRESP			=> s_axi_rresp,
	S_AXI_RVALID		=> s_axi_rvalid,
	S_AXI_RREADY		=> s_axi_rready
);
--------------------------------------------------------------------------------
SADDR_field				<= base_address;
BTT_field				<= transfer_size(22 downto 0);
m_axis_s2mm_cmd_tdata	<= RSV_field & TAG_field & SADDR_field & DRR_field & EOF_field & DSA_field & TYPE_field & BTT_field;
--------------------------------------------------------------------------------
m_axis_s2mm_tkeep		<= x"FF";	-- Always send full 64bit word
--------------------------------------------------------------------------------
process(sm_state, axis_fifo_data_count_i, s_axis_s2mm_tready_i, pretrigger_length_i, manual_fetch)
begin
	if((sm_state = ST_IDLE) or (sm_state = ST_END))then	-- Idle mode = collect data
		if(axis_fifo_data_count_i >= pretrigger_length_i)then
			s_axis_s2mm_tready	<= '1';	-- Fetch extra data
		else
			s_axis_s2mm_tready	<= '0';	-- Collect
		end if;
	elsif(sm_state = ST_FETCH)then
		s_axis_s2mm_tready	<= manual_fetch;
	else	-- Work mode
		s_axis_s2mm_tready	<= s_axis_s2mm_tready_i;
	end if;
end process;


narrow_data_gen: if C_CHANNELS*C_CDATA_WIDTH < 64 generate
begin
	process(s_axis_s2mm_aclk)
	begin
		if(s_axis_s2mm_aclk = '1' and s_axis_s2mm_aclk'event)then
			fetch_data	<= EXT(s_axis_s2mm_tdata, 64);
		end if;
	end process;
end generate;

wide_data_gen: if C_CHANNELS*C_CDATA_WIDTH >= 64 generate
begin
	process(s_axis_s2mm_aclk)
	begin
		if(s_axis_s2mm_aclk = '1' and s_axis_s2mm_aclk'event)then
			fetch_data	<= s_axis_s2mm_tdata(63 downto 0);
		end if;
	end process;
end generate;

m_axis_s2mm_tdata	<= data_buf(63 downto 0);	-- Low 64 bits of shifter
-- m_axis_s2mm_tvalid	<= (out_word_tvalid and transfer_active) or out_fifo_tvalid;

process(s_axis_s2mm_aclk)
begin
	if(s_axis_s2mm_aclk = '1' and s_axis_s2mm_aclk'event)then
		axis_fifo_data_count_i	<= axis_fifo_data_count;
		pretrigger_length_i		<= pretrigger_length;
	end if;
end process;


-- TODO Implement decimation depending from command_tdata
ext_adc_clk_gen: if C_USE_ADC_CLK = TRUE generate
begin
	adc_clk_i	<= adc_clk;
end generate;
int_adc_clk_gen: if C_USE_ADC_CLK = FALSE generate
begin
	adc_clk_i	<= s_axis_s2mm_aclk;
end generate;

-- ext_trigger_cd_inst: entity AXI_lib.cross_domain
-- generic map(
	-- C_FREQ_RATE		=> 4
-- )
-- port map( 
	-- src_clk			=> s_axis_s2mm_aclk,
	-- dst_clk			=> s_axi_aclk,
	-- src_d			=> trigger,
	-- dst_d			=> ext_trigger
-- );


process(adc_clk_i)
begin
	if(adc_clk_i = '1' and adc_clk_i'event)then
		trigger_ack 			<= trigger;
		trigger_i				<= trigger;
		if(decimation_cnt >= command_tdata)then
			decimation_cnt	<= (others => '0');
			decimation_en	<= '1';
		else
			decimation_cnt	<= decimation_cnt + 1;
			decimation_en	<= '0';
		end if;
		
		
		
		
		--if(ext_trigger = '1')then
		if((trigger_i = '1') and (trigger_delay_cnt = x"0000_0000"))then
			trigger_delay_cnt	<= trigger_delay + 1;
		else
			if((trigger_delay_cnt = x"0000_0001") and (decimation_en = '1'))then
				delayed_ext_trigger	<= '1';
			else
				delayed_ext_trigger	<= '0';
			end if;
			if((trigger_delay_cnt /= x"0000_0000") and (decimation_en = '1'))then
				if(trigger_delay_cnt > (trigger_delay + 1))then
					trigger_delay_cnt	<= trigger_delay + 1;
				else
					trigger_delay_cnt	<= trigger_delay_cnt - 1;
				end if;
			end if;
		end if;
	end if;
end process;

dly_trigger_cd_inst: entity AXI_lib.cross_domain
generic map(
	C_FREQ_RATE		=> 4
)
port map( 
	src_clk			=> adc_clk_i,
	dst_clk			=> s_axi_aclk,
	src_d			=> delayed_ext_trigger,
	dst_d			=> delayed_int_trigger
);

soft_trigger_cd_inst: entity AXI_lib.cross_domain
generic map(
	C_FREQ_RATE		=> 4
)
port map( 
	src_clk			=> s_axi_aclk,
	dst_clk			=> adc_clk_i,
	src_d			=> soft_trigger,
	dst_d			=> soft_ext_trigger
);

process(adc_clk_i)
begin
	if(adc_clk_i = '1' and adc_clk_i'event)then
		if(delayed_ext_trigger = '1' or soft_ext_trigger = '1')then
			timestamp_cap	<= timestamp;
		end if;
	end if;
end process;
--------------------------------------------------------------------------------
process(s_axis_s2mm_aclk)
begin
	if(s_axis_s2mm_aclk = '1' and s_axis_s2mm_aclk'event)then
		transfer_enable_i	<= transfer_enable;
		case sm_state is
			when ST_IDLE => 
				s_axis_s2mm_tready_i		<= '0';
				s_axis_s2mm_sts_tready		<= '0';
				if((transfer_enable_i = '1') and (delayed_int_trigger = '1' or soft_trigger = '1'))then
					m_axis_s2mm_cmd_tvalid	<= '1';
					EOF_field				<= '0';
					sm_state				<= ST_CMD;
					transfer_count			<= transfer_size - (C_M_AXIS_S2MM_TDATA_WIDTH/8);
				elsif(manual_fetch_mode = '1')then
					sm_state				<= ST_FETCH;
				else
					m_axis_s2mm_cmd_tvalid	<= '0';
				end if;
			when ST_CMD =>
				if(m_axis_s2mm_cmd_tready = '1')then
					m_axis_s2mm_cmd_tvalid	<= '0';
					TAG_field				<= TAG_field + 1;
					sm_state				<= ST_DATA;
					timeout_cnt				<= 0;
				end if;
			when ST_DATA =>
				if(s_axis_s2mm_tvalid = '1')then	
					data_buf				<= EXT(s_axis_s2mm_tdata, (((C_CAPTURE_CHANNELS*C_CDATA_WIDTH)/64)*64+64));
					s_axis_s2mm_tready_i	<= '1';
					m_axis_s2mm_tvalid		<= '1';
					chunk_cnt				<= 1;
					timeout_cnt				<= 0;
					sm_state				<= ST_SEND;
				end if;
			when ST_SEND =>
				s_axis_s2mm_tready_i		<= '0';
				if(m_axis_s2mm_tready = '1')then
					data_buf(data_buf'length-65  downto 0)	<= data_buf(data_buf'length-1 downto 64);
					timeout_cnt				<= 0;
					if(transfer_count <= (C_M_AXIS_S2MM_TDATA_WIDTH/8))then
						m_axis_s2mm_tlast	<= '1';
						sm_state			<= ST_PACKET_END;
					else
						transfer_count		<= transfer_count - (C_M_AXIS_S2MM_TDATA_WIDTH/8);
						if((C_CAPTURE_CHANNELS*C_CDATA_WIDTH) <= C_M_AXIS_S2MM_TDATA_WIDTH)then		-- If only one transfer per chunk
							m_axis_s2mm_tvalid		<= '0';
							sm_state				<= ST_DATA;
						elsif(chunk_cnt >= ((C_CAPTURE_CHANNELS*C_CDATA_WIDTH)/64))then
							sm_state		<= ST_CHUNK_END;
						else
							chunk_cnt		<= chunk_cnt + 1;
						end if;
					end if;
				else
					if(timeout_cnt >= 255)then
						EOF_field				<= '1';
						m_axis_s2mm_cmd_tvalid	<= '1';	-- Flush
						m_axis_s2mm_tvalid		<= '0';
						timeout_cnt				<= 0;
						sm_state				<= ST_END;
					else
						timeout_cnt				<= timeout_cnt + 1;
					end if;
				end if;
			when ST_CHUNK_END =>
				s_axis_s2mm_tready_i		<= '0';
				if(m_axis_s2mm_tready = '1')then
					if(s_axis_s2mm_tvalid = '1')then
						data_buf					<= EXT(s_axis_s2mm_tdata, (((C_CAPTURE_CHANNELS*C_CDATA_WIDTH)/64)*64+64));
						s_axis_s2mm_tready_i		<= '1';
						chunk_cnt					<= 1;
						timeout_cnt					<= 0;
						if(transfer_count <= (C_M_AXIS_S2MM_TDATA_WIDTH/8))then
							m_axis_s2mm_tlast		<= '1';
							sm_state				<= ST_PACKET_END;
						else
							transfer_count			<= transfer_count - (C_M_AXIS_S2MM_TDATA_WIDTH/8);
							sm_state				<= ST_SEND;
						end if;
					else	-- No data to transfer_active
						m_axis_s2mm_tvalid			<= '0';
						sm_state					<= ST_WAIT;
					end if;
				else
					if(timeout_cnt >= 255)then
						EOF_field				<= '1';
						m_axis_s2mm_cmd_tvalid	<= '1';	-- Flush
						m_axis_s2mm_tvalid		<= '0';
						timeout_cnt				<= 0;
						sm_state				<= ST_END;
					else
						timeout_cnt				<= timeout_cnt + 1;
					end if;
				end if;

			when ST_WAIT =>
				if(s_axis_s2mm_tvalid = '1')then
					data_buf					<= EXT(s_axis_s2mm_tdata, (((C_CAPTURE_CHANNELS*C_CDATA_WIDTH)/64)*64+64));
					m_axis_s2mm_tvalid			<= '1';
					s_axis_s2mm_tready_i		<= '1';
					chunk_cnt					<= 1;
					timeout_cnt					<= 0;
					if(transfer_count <= (C_M_AXIS_S2MM_TDATA_WIDTH/8))then
						m_axis_s2mm_tlast		<= '1';
						sm_state				<= ST_PACKET_END;
					else
						transfer_count			<= transfer_count - (C_M_AXIS_S2MM_TDATA_WIDTH/8);
						sm_state				<= ST_SEND;
					end if;
				end if;
				
			when ST_PACKET_END =>
				s_axis_s2mm_tready_i			<= '0';
				if(m_axis_s2mm_tready = '1')then
					m_axis_s2mm_tvalid			<= '0';
					m_axis_s2mm_tlast			<= '0';
					if(interrupt_en = '1')then
						interrupt_i					<= '1';
						sm_state					<= ST_INT;
					else
						interrupt_i					<= '0';
						timeout_cnt					<= 0;
						sm_state					<= ST_END;
					end if;
				else
					if(timeout_cnt >= 255)then
						EOF_field				<= '1';
						m_axis_s2mm_cmd_tvalid	<= '1';	-- Flush
						m_axis_s2mm_tvalid		<= '0';
						timeout_cnt				<= 0;
						sm_state				<= ST_END;
					else
						timeout_cnt				<= timeout_cnt + 1;
					end if;
				end if;
			when ST_INT =>
				if(do_read = '1')then
					interrupt_i					<= '0';
					timeout_cnt					<= 0;
					sm_state					<= ST_END;
				end if;
			when ST_END =>
				m_axis_s2mm_cmd_tvalid		<= '0';
				if(s_axis_s2mm_sts_tvalid = '1')then
					transfer_status(C_S_AXIS_S2MM_STS_TDATA_WIDTH-1 downto 0)		<= s_axis_s2mm_sts_tdata;
					s_axis_s2mm_sts_tready	<= '1';
					sm_state				<= ST_IDLE;
				-- else
					-- if(timeout_cnt >= 255)then
						-- sm_state				<= ST_IDLE;
						-- transfer_status			<= x"DEAD_DEAD";
					-- else
						-- timeout_cnt				<= timeout_cnt + 1;
					--end if;
				end if;
			when ST_FETCH =>
				if(manual_fetch_mode = '0')then
					sm_state				<= ST_IDLE;
				end if;
		end case;
	end if;
end process;

process(s_axi_aclk)
begin
	if(s_axi_aclk = '1' and s_axi_aclk'event)then
		case sm_state is
			when ST_IDLE 		=> core_debug <= x"0000_0001";
			when ST_CMD 		=> core_debug <= x"0000_0002";
			when ST_DATA 		=> core_debug <= x"0000_0003";
			when ST_SEND 		=> core_debug <= x"0000_0004";
			when ST_CHUNK_END 	=> core_debug <= x"0000_0005";
			when ST_PACKET_END 	=> core_debug <= x"0000_0006";
			when ST_INT 		=> core_debug <= x"0000_0007";
			when ST_END 		=> core_debug <= x"0000_0008";
			when ST_WAIT		=> core_debug <= x"0000_0009";
			when ST_FETCH		=> core_debug <= x"0000_000A";
		end case;
	end if;
end process;

--------------------------------------------------------------------------------
process(m_axis_cmd_aclk)
begin
	if(m_axis_cmd_aclk = '1' and m_axis_cmd_aclk'event)then
		m_axis_cmd_tdata(31 downto 0)	<= command_tdata; 
	end if;
end process;

cmd_cd_inst: entity AXI_lib.cross_domain
generic map(
	C_FREQ_RATE		=> 4
)
port map( 
	src_clk			=> s_axi_aclk,
	dst_clk			=> m_axis_cmd_aclk,
	src_d			=> command_tvalid,
	dst_d			=> m_axis_cmd_tvalid
);
--------------------------------------------------------------------------------
soft_trigger					<= Core_Control_1(0);
transfer_enable					<= Core_Control_1(1);
interrupt_en					<= Core_Control_1(5);
manual_fetch_mode				<= Core_Control_1(7);
Common_Status(C_S_AXIS_S2MM_STS_TDATA_WIDTH-1 downto  0) 	<= DM_last_status;


-- transfer_end	<= '1' when (sm_state = ST_END) else '0';
transfer_end	<= '1' when (sm_state = ST_CMD) else '0';

process(s_axi_aclk)
begin
	if(s_axi_aclk = '1' and s_axi_aclk'event)then
		if(transfer_end = '1')then
			transfer_i	<= '1';
		elsif(do_read = '1')then
			transfer_i	<= '0';
		end if;
	end if;
end process;
--------------------------------------------------------------------------------
interrupt			<= interrupt_i;
--------------------------------------------------------------------------------
-- Common CORE ID
Core_Status_0(1) 	<= High;		-- Core Ready
Core_Status_0(2) 	<= Low;			-- Core Error
Core_Status_0(3) 	<= Low;			-- Core HW Error
Core_Status_0(4) 	<= Low;			-- Core triggered/ready
Core_Status_0(5) 	<= interrupt_i;	-- Core Interrupt Pending
Core_Status_0(6) 	<= transfer_i;	-- Transfer
Core_Status_0(7) 	<= Low;

--COREID_Inst: entity te_common_v1_0.te_coreid
--generic map (
--	INIT00 			=> C_COREID
--)
--port map (
--	clk				=> S_AXI_ACLK,
--	en				=> do_read,
--	coreid			=> Core_Status_0(0)
--);
--------------------------------------------------------------------------------
end arch_imp;
