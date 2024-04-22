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
entity AXI_StreamCapture_v1_0 is
generic (
	C_BLOCK_SIZE			: integer 	:= 8192;
	C_S_AXI_DATA_WIDTH		: integer	:= 32;
	C_S_AXIS_DATA_WIDTH		: integer	:= 64;
	C_USE_TRIG				: boolean	:= FALSE;
	C_DATA_SYNC_TRIG		: boolean	:= FALSE;
	C_PRETRIG				: boolean	:= FALSE;
	C_S_AXI_ADDR_WIDTH		: integer	:= 5
);
port (
	-- Global clock and reset
	axi_aclk				: in  STD_LOGIC;
	axi_aresetn				: in  STD_LOGIC;
	
	rd_data_count			: in  STD_LOGIC_VECTOR(31 downto 0);
	
	-- S_AXI:m_axis_s2mm:m_axis_s2mm_cmd:s_axis:s_axis_s2mm_sts
	
	-- Trig OUT
	m_trig					: out STD_LOGIC;
	m_ack					: in  STD_LOGIC;
	
	-- Trig IN
	s_trig					: in  STD_LOGIC;
	s_ack					: out STD_LOGIC;
	
	-- Input Data stream
	s_axis_tvalid			: in  STD_LOGIC;
	s_axis_tready			: out STD_LOGIC;
	s_axis_tdata			: in  STD_LOGIC_VECTOR(C_S_AXIS_DATA_WIDTH-1 downto 0);
	
	-- Data interface to Datamover
	m_axis_s2mm_tvalid		: out STD_LOGIC;
	m_axis_s2mm_tdata		: out STD_LOGIC_VECTOR(63 downto 0);
	m_axis_s2mm_tkeep		: out STD_LOGIC_VECTOR( 7 downto 0);
	m_axis_s2mm_tlast		: out STD_LOGIC;
	m_axis_s2mm_tready		: in  STD_LOGIC;
	
	-- Command interface to Datamover
	m_axis_s2mm_cmd_tvalid	: out STD_LOGIC;
	m_axis_s2mm_cmd_tdata	: out STD_LOGIC_VECTOR(71 downto 0);
	m_axis_s2mm_cmd_tready	: in  STD_LOGIC;
	
	-- Status interface from Datamover
	s_axis_s2mm_sts_tready	: out STD_LOGIC;
	s_axis_s2mm_sts_tdata	: in  STD_LOGIC_VECTOR(31 downto 0);
	s_axis_s2mm_sts_tkeep	: in  STD_LOGIC_VECTOR( 3 downto 0);
	s_axis_s2mm_sts_tlast	: in  STD_LOGIC;
	s_axis_s2mm_sts_tvalid	: in  STD_LOGIC;
	
	-- Ports of Axi Slave Bus Interface S_AXI
	s_axi_awaddr			: in  STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
	s_axi_awprot			: in  STD_LOGIC_VECTOR( 2 downto 0);
	s_axi_awvalid			: in  STD_LOGIC;
	s_axi_awready			: out STD_LOGIC;
	s_axi_wdata				: in  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
	s_axi_wstrb				: in  STD_LOGIC_VECTOR((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
	s_axi_wvalid			: in  STD_LOGIC;
	s_axi_wready			: out STD_LOGIC;
	s_axi_bresp				: out STD_LOGIC_VECTOR( 1 downto 0);
	s_axi_bvalid			: out STD_LOGIC;
	s_axi_bready			: in  STD_LOGIC;
	s_axi_araddr			: in  STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
	s_axi_arprot			: in  STD_LOGIC_VECTOR( 2 downto 0);
	s_axi_arvalid			: in  STD_LOGIC;
	s_axi_arready			: out STD_LOGIC;
	s_axi_rdata				: out STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
	s_axi_rresp				: out STD_LOGIC_VECTOR( 1 downto 0);
	s_axi_rvalid			: out STD_LOGIC;
	s_axi_rready			: in  STD_LOGIC
);
end AXI_StreamCapture_v1_0;
--------------------------------------------------------------------------------
architecture arch_imp of AXI_StreamCapture_v1_0 is
--------------------------------------------------------------------------------
-- component declaration
component AXI_StreamCapture_v1_0_S_AXI is
generic (
	C_S_AXI_DATA_WIDTH		: integer	:= 32;
	C_S_AXI_ADDR_WIDTH		: integer	:= 5
);
port (
	-- Registers
	control_reg				: out STD_LOGIC_VECTOR(31 downto 0);
	transfers_reg			: in  STD_LOGIC_VECTOR(31 downto 0);
	size_reg				: out STD_LOGIC_VECTOR(31 downto 0);
	addr_reg				: out STD_LOGIC_VECTOR(31 downto 0);
	last_addr_reg			: in  STD_LOGIC_VECTOR(31 downto 0);
	pretrigger_reg			: out STD_LOGIC_VECTOR(31 downto 0);
	dm_status_reg			: in  STD_LOGIC_VECTOR(31 downto 0);

	S_AXI_ACLK				: in  STD_LOGIC;
	S_AXI_ARESETN			: in  STD_LOGIC;
	S_AXI_AWADDR			: in  STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
	S_AXI_AWPROT			: in  STD_LOGIC_VECTOR( 2 downto 0);
	S_AXI_AWVALID			: in  STD_LOGIC;
	S_AXI_AWREADY			: out STD_LOGIC;
	S_AXI_WDATA				: in  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
	S_AXI_WSTRB				: in  STD_LOGIC_VECTOR((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
	S_AXI_WVALID			: in  STD_LOGIC;
	S_AXI_WREADY			: out STD_LOGIC;
	S_AXI_BRESP				: out STD_LOGIC_VECTOR( 1 downto 0);
	S_AXI_BVALID			: out STD_LOGIC;
	S_AXI_BREADY			: in  STD_LOGIC;
	S_AXI_ARADDR			: in  STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
	S_AXI_ARPROT			: in  STD_LOGIC_VECTOR( 2 downto 0);
	S_AXI_ARVALID			: in  STD_LOGIC;
	S_AXI_ARREADY			: out STD_LOGIC;
	S_AXI_RDATA				: out STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
	S_AXI_RRESP				: out STD_LOGIC_VECTOR( 1 downto 0);
	S_AXI_RVALID			: out STD_LOGIC;
	S_AXI_RREADY			: in  STD_LOGIC
);
end component AXI_StreamCapture_v1_0_S_AXI;
--------------------------------------------------------------------------------
constant TYPE_field			: STD_LOGIC := '1'; -- INCREMENTAL
constant DRR_field			: STD_LOGIC := '0';
signal EOF_field			: STD_LOGIC := '0';
constant DSA_field			: STD_LOGIC_VECTOR( 5 downto 0) := "000000";
constant RSV_field			: STD_LOGIC_VECTOR( 3 downto 0) := "0000";
signal TAG_field			: STD_LOGIC_VECTOR( 3 downto 0);
signal SADDR_field			: STD_LOGIC_VECTOR(31 downto 0);
signal BTT_field			: STD_LOGIC_VECTOR(22 downto 0);
type sm_state_type is (ST_IDLE, ST_SYNC, ST_CMD, ST_SEND, ST_PEND);
signal sm_state				: sm_state_type := ST_IDLE;
signal bytes_to_send		: UNSIGNED(22 downto 0);
signal bytes_total			: UNSIGNED(31 downto 0);
signal ram_addr				: UNSIGNED(31 downto 0);
signal transfers_cnt		: UNSIGNED(31 downto 0);
signal TAG_cnt				: UNSIGNED( 3 downto 0);
signal pretrigger_count		: UNSIGNED(15 downto 0);
--------------------------------------------------------------------------------
signal start_sr				: STD_LOGIC_VECTOR( 1 downto 0);
signal control_reg			: STD_LOGIC_VECTOR(31 downto 0);
signal transfers_reg		: STD_LOGIC_VECTOR(31 downto 0);
signal last_addr_reg		: STD_LOGIC_VECTOR(31 downto 0);
signal size_reg				: STD_LOGIC_VECTOR(31 downto 0);
signal addr_reg				: STD_LOGIC_VECTOR(31 downto 0);
signal pretrigger_reg		: STD_LOGIC_VECTOR(31 downto 0);
signal dm_status_reg		: STD_LOGIC_VECTOR(31 downto 0);
signal start_event			: STD_LOGIC;
signal data_hold			: STD_LOGIC;
signal idle_tready			: STD_LOGIC;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
-- Instantiation of Axi Bus Interface S_AXI
AXI_StreamCapture_v1_0_S_AXI_inst : AXI_StreamCapture_v1_0_S_AXI
generic map (
	C_S_AXI_DATA_WIDTH	=> C_S_AXI_DATA_WIDTH,
	C_S_AXI_ADDR_WIDTH	=> C_S_AXI_ADDR_WIDTH
)
port map (
	control_reg			=> control_reg,
	transfers_reg		=> transfers_reg,
	size_reg			=> size_reg,
	addr_reg			=> addr_reg,
	last_addr_reg		=> last_addr_reg,
	pretrigger_reg		=> pretrigger_reg,
	dm_status_reg		=> dm_status_reg,

	S_AXI_ACLK			=> axi_aclk,
	S_AXI_ARESETN		=> axi_aresetn,
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

process (axi_aclk)
begin
	if(axi_aclk'event and axi_aclk='1')then
		start_sr			<= start_sr(0) & control_reg(0);
		start_event			<= (not start_sr(1)) and start_sr(0);
		transfers_reg		<= STD_LOGIC_VECTOR(transfers_cnt);
		data_hold			<= not control_reg(1);
		last_addr_reg		<= STD_LOGIC_VECTOR(ram_addr);
		pretrigger_count	<= UNSIGNED(pretrigger_reg(15 downto 0));
		if(s_axis_s2mm_sts_tvalid = '1')then
			dm_status_reg	<= s_axis_s2mm_sts_tdata;
		end if;
	end if;
end process;
--------------------------------------------------------------------------------
EOF_field					<= '0';
SADDR_field					<= STD_LOGIC_VECTOR(ram_addr);
BTT_field					<= STD_LOGIC_VECTOR(bytes_to_send);
TAG_field					<= STD_LOGIC_VECTOR(TAG_cnt);
m_axis_s2mm_cmd_tdata		<= 
	RSV_field & TAG_field & SADDR_field & DRR_field & 
	EOF_field & DSA_field & TYPE_field & BTT_field;
--------------------------------------------------------------------------------
m_axis_s2mm_tdata		<= s_axis_tdata;
m_axis_s2mm_tkeep		<= x"FF";
m_axis_s2mm_tlast		<= '1' when (bytes_to_send <= TO_UNSIGNED((C_S_AXIS_DATA_WIDTH/8),23)) else '0';
m_axis_s2mm_tvalid		<= s_axis_tvalid when (sm_state = ST_SEND) else '0';
--------------------------------------------------------------------------------
s_axis_s2mm_sts_tready	<= '1';
--------------------------------------------------------------------------------
async_gen: if C_DATA_SYNC_TRIG = FALSE generate
	m_trig				<= start_event;
end generate;
sync_gen: if C_DATA_SYNC_TRIG = TRUE generate
	m_trig				<= s_axis_tvalid when sm_state = ST_SYNC else '0';
end generate;
s_ack					<= '1';
--------------------------------------------------------------------------------
no_pretrig_gen: if C_PRETRIG = FALSE generate
	idle_tready			<= data_hold;
end generate;

pretrig_gen: if C_PRETRIG = TRUE generate
	idle_tready			<= data_hold when UNSIGNED(rd_data_count(15 downto 0)) >= pretrigger_count else '0';
end generate;

process(sm_state, m_axis_s2mm_tready, idle_tready)
begin
	case sm_state is
		when ST_IDLE	=> s_axis_tready	<= idle_tready;	-- Wait mode
		when ST_SYNC	=> s_axis_tready	<= '0';
		when ST_SEND	=> s_axis_tready	<= m_axis_s2mm_tready;
		when others		=> s_axis_tready	<= '0';
	end case;
end process;

process(axi_aclk)
begin
	if(axi_aclk = '1' and axi_aclk'event)then
		case sm_state is
			when ST_IDLE =>
				bytes_total					<= UNSIGNED(size_reg);
				ram_addr					<= UNSIGNED(addr_reg);
				if(UNSIGNED(size_reg) < TO_UNSIGNED(C_BLOCK_SIZE,32))then
					bytes_to_send			<= UNSIGNED(size_reg(22 downto 0));
				else
					bytes_to_send			<= TO_UNSIGNED(C_BLOCK_SIZE,23);
				end if;
				if((start_event = '1') or (s_trig = '1'))then
					if(C_DATA_SYNC_TRIG = FALSE)then
						sm_state				<= ST_CMD;
						m_axis_s2mm_cmd_tvalid	<= '1';
					else
						sm_state				<= ST_SYNC;
						m_axis_s2mm_cmd_tvalid	<= '0';
					end if;
				else
					m_axis_s2mm_cmd_tvalid	<= '0';
				end if;
				
			when ST_SYNC =>
				if(s_axis_tvalid = '1')then
					sm_state				<= ST_CMD;
					m_axis_s2mm_cmd_tvalid	<= '1';
				end if;

			when ST_CMD =>
				if(m_axis_s2mm_cmd_tready = '1')then
					m_axis_s2mm_cmd_tvalid	<= '0';
					TAG_cnt					<= TAG_cnt + 1;
					sm_state				<= ST_SEND;
				end if;
				
			when ST_SEND =>
				if((s_axis_tvalid = '1') and (m_axis_s2mm_tready = '1'))then
					if(bytes_to_send < TO_UNSIGNED((C_S_AXIS_DATA_WIDTH/8),23))then
						bytes_to_send		<= (others => '0');
					else
						bytes_to_send		<= bytes_to_send - (C_S_AXIS_DATA_WIDTH/8);
					end if;
					if(bytes_total < TO_UNSIGNED((C_S_AXIS_DATA_WIDTH/8),32))then
						bytes_total			<= (others => '0');
					else
						bytes_total			<= bytes_total - (C_S_AXIS_DATA_WIDTH/8);
					end if;
					ram_addr				<= ram_addr + (C_S_AXIS_DATA_WIDTH/8);
					if(bytes_to_send <= TO_UNSIGNED((C_S_AXIS_DATA_WIDTH/8),23))then
						sm_state			<= ST_PEND;
					end if;
				end if;
				
			when ST_PEND =>
				if(bytes_total = TO_UNSIGNED(0,32))then
					sm_state				<= ST_IDLE;
					transfers_cnt			<= transfers_cnt + 1;
				else
					if(bytes_total < TO_UNSIGNED(C_BLOCK_SIZE,32))then
						bytes_to_send		<= bytes_total(22 downto 0);
					else
						bytes_to_send		<= TO_UNSIGNED(C_BLOCK_SIZE,23);
					end if;
					sm_state				<= ST_CMD;
					m_axis_s2mm_cmd_tvalid	<= '1';
				end if;
		end case;
	end if;
end process;
--------------------------------------------------------------------------------
end arch_imp;
