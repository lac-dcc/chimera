-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Fri Feb 19 15:26:54 2021
-- Host        : yzou-PC running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /hdd/directnvm/rtl_proj/bd/design_1/ip/design_1_CompletionQueueManag_2_0/design_1_CompletionQueueManag_2_0_sim_netlist.vhdl
-- Design      : design_1_CompletionQueueManag_2_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE is
  port (
    num_cmds_to_wait : in STD_LOGIC_VECTOR ( 31 downto 0 );
    go : in STD_LOGIC;
    async_clear : in STD_LOGIC;
    done : out STD_LOGIC;
    cpl_addr : out STD_LOGIC_VECTOR ( 4 downto 0 );
    cpl_rd_en : out STD_LOGIC;
    cpl_data : in STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXI_ACLK : in STD_LOGIC;
    M_AXI_ARESETN : in STD_LOGIC;
    M_AXI_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_AWVALID : out STD_LOGIC;
    M_AXI_AWREADY : in STD_LOGIC;
    M_AXI_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_WVALID : out STD_LOGIC;
    M_AXI_WREADY : in STD_LOGIC;
    M_AXI_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_BVALID : in STD_LOGIC;
    M_AXI_BREADY : out STD_LOGIC;
    M_AXI_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_ARVALID : out STD_LOGIC;
    M_AXI_ARREADY : in STD_LOGIC;
    M_AXI_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_RVALID : in STD_LOGIC;
    M_AXI_RREADY : out STD_LOGIC
  );
  attribute CPL_ENTRY_ADDR_WIDTH : integer;
  attribute CPL_ENTRY_ADDR_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE : entity is 5;
  attribute CPL_ENTRY_DATA_WIDTH : integer;
  attribute CPL_ENTRY_DATA_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE : entity is 128;
  attribute C_M_AXI_ADDR_WIDTH : integer;
  attribute C_M_AXI_ADDR_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE : entity is 64;
  attribute C_M_AXI_DATA_WIDTH : integer;
  attribute C_M_AXI_DATA_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE : entity is 32;
  attribute C_M_TARGET_SLAVE_BASE_ADDR : string;
  attribute C_M_TARGET_SLAVE_BASE_ADDR of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE : entity is "64'b0000000000000000000000000000000010100000000000000001000000011100";
  attribute IDLE : integer;
  attribute IDLE of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE : entity is "CompletionQueueManagement_v2_0_M00_AXI_LITE";
  attribute READ : integer;
  attribute READ of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE : entity is 1;
  attribute RING_DOORBELL_0 : integer;
  attribute RING_DOORBELL_0 of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE : entity is 2;
  attribute RING_DOORBELL_1 : integer;
  attribute RING_DOORBELL_1 of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE : entity is 3;
end design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE;

architecture STRUCTURE of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE is
  signal \<const0>\ : STD_LOGIC;
  signal \FSM_sequential_current_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_current_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_current_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_current_state[1]_i_4_n_0\ : STD_LOGIC;
  signal \^m_axi_awaddr\ : STD_LOGIC_VECTOR ( 31 to 31 );
  signal \^m_axi_wdata\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^m_axi_wstrb\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal acq_head : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute MARK_DEBUG : boolean;
  attribute MARK_DEBUG of acq_head : signal is std.standard.true;
  signal acq_head_inferred_i_10_n_0 : STD_LOGIC;
  signal acq_head_inferred_i_6_n_0 : STD_LOGIC;
  signal acq_head_inferred_i_7_n_0 : STD_LOGIC;
  signal acq_head_inferred_i_8_n_0 : STD_LOGIC;
  signal acq_head_inferred_i_9_n_0 : STD_LOGIC;
  signal acq_tail : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute MARK_DEBUG of acq_tail : signal is std.standard.true;
  signal acq_tail_inferred_i_10_n_0 : STD_LOGIC;
  signal acq_tail_inferred_i_11_n_0 : STD_LOGIC;
  signal acq_tail_inferred_i_12_n_0 : STD_LOGIC;
  signal acq_tail_inferred_i_13_n_0 : STD_LOGIC;
  signal acq_tail_inferred_i_14_n_0 : STD_LOGIC;
  signal acq_tail_inferred_i_6_n_0 : STD_LOGIC;
  signal acq_tail_inferred_i_7_n_0 : STD_LOGIC;
  signal acq_tail_inferred_i_8_n_0 : STD_LOGIC;
  signal acq_tail_inferred_i_9_n_0 : STD_LOGIC;
  signal counter : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute MARK_DEBUG of counter : signal is std.standard.true;
  signal \counter__0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal counter_inferred_i_33_n_1 : STD_LOGIC;
  signal counter_inferred_i_33_n_2 : STD_LOGIC;
  signal counter_inferred_i_33_n_3 : STD_LOGIC;
  signal counter_inferred_i_33_n_4 : STD_LOGIC;
  signal counter_inferred_i_33_n_5 : STD_LOGIC;
  signal counter_inferred_i_33_n_6 : STD_LOGIC;
  signal counter_inferred_i_33_n_7 : STD_LOGIC;
  signal counter_inferred_i_34_n_0 : STD_LOGIC;
  signal counter_inferred_i_35_n_0 : STD_LOGIC;
  signal counter_inferred_i_36_n_0 : STD_LOGIC;
  signal counter_inferred_i_36_n_1 : STD_LOGIC;
  signal counter_inferred_i_36_n_2 : STD_LOGIC;
  signal counter_inferred_i_36_n_3 : STD_LOGIC;
  signal counter_inferred_i_36_n_4 : STD_LOGIC;
  signal counter_inferred_i_36_n_5 : STD_LOGIC;
  signal counter_inferred_i_36_n_6 : STD_LOGIC;
  signal counter_inferred_i_36_n_7 : STD_LOGIC;
  signal counter_inferred_i_37_n_0 : STD_LOGIC;
  signal counter_inferred_i_37_n_1 : STD_LOGIC;
  signal counter_inferred_i_37_n_2 : STD_LOGIC;
  signal counter_inferred_i_37_n_3 : STD_LOGIC;
  signal counter_inferred_i_37_n_4 : STD_LOGIC;
  signal counter_inferred_i_37_n_5 : STD_LOGIC;
  signal counter_inferred_i_37_n_6 : STD_LOGIC;
  signal counter_inferred_i_37_n_7 : STD_LOGIC;
  signal counter_inferred_i_38_n_0 : STD_LOGIC;
  signal counter_inferred_i_38_n_1 : STD_LOGIC;
  signal counter_inferred_i_38_n_2 : STD_LOGIC;
  signal counter_inferred_i_38_n_3 : STD_LOGIC;
  signal counter_inferred_i_38_n_4 : STD_LOGIC;
  signal counter_inferred_i_38_n_5 : STD_LOGIC;
  signal counter_inferred_i_38_n_6 : STD_LOGIC;
  signal counter_inferred_i_38_n_7 : STD_LOGIC;
  signal counter_inferred_i_39_n_0 : STD_LOGIC;
  signal current_state : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute MARK_DEBUG of current_state : signal is std.standard.true;
  signal \^done\ : STD_LOGIC;
  signal done_INST_0_i_10_n_0 : STD_LOGIC;
  signal done_INST_0_i_11_n_0 : STD_LOGIC;
  signal done_INST_0_i_12_n_0 : STD_LOGIC;
  signal done_INST_0_i_12_n_1 : STD_LOGIC;
  signal done_INST_0_i_12_n_2 : STD_LOGIC;
  signal done_INST_0_i_12_n_3 : STD_LOGIC;
  signal done_INST_0_i_12_n_4 : STD_LOGIC;
  signal done_INST_0_i_12_n_5 : STD_LOGIC;
  signal done_INST_0_i_12_n_6 : STD_LOGIC;
  signal done_INST_0_i_12_n_7 : STD_LOGIC;
  signal done_INST_0_i_13_n_0 : STD_LOGIC;
  signal done_INST_0_i_14_n_0 : STD_LOGIC;
  signal done_INST_0_i_15_n_0 : STD_LOGIC;
  signal done_INST_0_i_16_n_0 : STD_LOGIC;
  signal done_INST_0_i_17_n_0 : STD_LOGIC;
  signal done_INST_0_i_18_n_0 : STD_LOGIC;
  signal done_INST_0_i_19_n_0 : STD_LOGIC;
  signal done_INST_0_i_1_n_0 : STD_LOGIC;
  signal done_INST_0_i_20_n_0 : STD_LOGIC;
  signal done_INST_0_i_21_n_0 : STD_LOGIC;
  signal done_INST_0_i_22_n_0 : STD_LOGIC;
  signal done_INST_0_i_23_n_0 : STD_LOGIC;
  signal done_INST_0_i_24_n_0 : STD_LOGIC;
  signal done_INST_0_i_25_n_0 : STD_LOGIC;
  signal done_INST_0_i_26_n_0 : STD_LOGIC;
  signal done_INST_0_i_27_n_0 : STD_LOGIC;
  signal done_INST_0_i_28_n_0 : STD_LOGIC;
  signal done_INST_0_i_29_n_0 : STD_LOGIC;
  signal done_INST_0_i_2_n_0 : STD_LOGIC;
  signal done_INST_0_i_30_n_0 : STD_LOGIC;
  signal done_INST_0_i_31_n_0 : STD_LOGIC;
  signal done_INST_0_i_32_n_0 : STD_LOGIC;
  signal done_INST_0_i_33_n_0 : STD_LOGIC;
  signal done_INST_0_i_34_n_0 : STD_LOGIC;
  signal done_INST_0_i_35_n_0 : STD_LOGIC;
  signal done_INST_0_i_36_n_0 : STD_LOGIC;
  signal done_INST_0_i_37_n_0 : STD_LOGIC;
  signal done_INST_0_i_38_n_0 : STD_LOGIC;
  signal done_INST_0_i_39_n_0 : STD_LOGIC;
  signal done_INST_0_i_3_n_0 : STD_LOGIC;
  signal done_INST_0_i_40_n_0 : STD_LOGIC;
  signal done_INST_0_i_41_n_0 : STD_LOGIC;
  signal done_INST_0_i_42_n_0 : STD_LOGIC;
  signal done_INST_0_i_43_n_0 : STD_LOGIC;
  signal done_INST_0_i_44_n_0 : STD_LOGIC;
  signal done_INST_0_i_4_n_0 : STD_LOGIC;
  signal done_INST_0_i_5_n_0 : STD_LOGIC;
  signal done_INST_0_i_6_n_0 : STD_LOGIC;
  signal done_INST_0_i_7_n_0 : STD_LOGIC;
  signal done_INST_0_i_8_n_0 : STD_LOGIC;
  signal done_INST_0_i_8_n_1 : STD_LOGIC;
  signal done_INST_0_i_8_n_2 : STD_LOGIC;
  signal done_INST_0_i_8_n_3 : STD_LOGIC;
  signal done_INST_0_i_8_n_4 : STD_LOGIC;
  signal done_INST_0_i_8_n_5 : STD_LOGIC;
  signal done_INST_0_i_8_n_6 : STD_LOGIC;
  signal done_INST_0_i_8_n_7 : STD_LOGIC;
  signal done_INST_0_i_9_n_0 : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute MARK_DEBUG of next_state : signal is std.standard.true;
  signal \next_state__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_state_inferred_i_33_n_0 : STD_LOGIC;
  signal next_state_inferred_i_34_n_0 : STD_LOGIC;
  signal next_state_inferred_i_35_n_0 : STD_LOGIC;
  signal next_state_inferred_i_36_n_0 : STD_LOGIC;
  signal next_state_inferred_i_37_n_0 : STD_LOGIC;
  signal next_state_inferred_i_38_n_0 : STD_LOGIC;
  signal next_state_inferred_i_39_n_0 : STD_LOGIC;
  signal phase_tag_threshold : STD_LOGIC;
  attribute MARK_DEBUG of phase_tag_threshold : signal is std.standard.true;
  signal phase_tag_threshold_inferred_i_2_n_0 : STD_LOGIC;
  signal phase_tag_threshold_inferred_i_3_n_0 : STD_LOGIC;
  signal r_acq_head : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute MARK_DEBUG of r_acq_head : signal is std.standard.true;
  signal r_acq_tail : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute MARK_DEBUG of r_acq_tail : signal is std.standard.true;
  signal r_counter : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute MARK_DEBUG of r_counter : signal is std.standard.true;
  signal r_done : STD_LOGIC;
  signal r_num_cmds_to_wait : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute MARK_DEBUG of r_num_cmds_to_wait : signal is std.standard.true;
  signal r_phase_tag_threshold : STD_LOGIC;
  attribute MARK_DEBUG of r_phase_tag_threshold : signal is std.standard.true;
  signal rr_num_cmds_to_wait : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute MARK_DEBUG of rr_num_cmds_to_wait : signal is std.standard.true;
  signal tmp : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute MARK_DEBUG of tmp : signal is std.standard.true;
  signal NLW_counter_inferred_i_33_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_done_INST_0_i_12_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_done_INST_0_i_8_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[0]\ : label is "RING_DOORBELL_0:10,RING_DOORBELL_1:11,IDLE:00,READ:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[1]\ : label is "RING_DOORBELL_0:10,RING_DOORBELL_1:11,IDLE:00,READ:01";
  attribute KEEP : string;
  attribute KEEP of \r_acq_head_reg[0]\ : label is "yes";
  attribute KEEP of \r_acq_head_reg[1]\ : label is "yes";
  attribute KEEP of \r_acq_head_reg[2]\ : label is "yes";
  attribute KEEP of \r_acq_head_reg[3]\ : label is "yes";
  attribute KEEP of \r_acq_head_reg[4]\ : label is "yes";
  attribute KEEP of \r_acq_tail_reg[0]\ : label is "yes";
  attribute KEEP of \r_acq_tail_reg[1]\ : label is "yes";
  attribute KEEP of \r_acq_tail_reg[2]\ : label is "yes";
  attribute KEEP of \r_acq_tail_reg[3]\ : label is "yes";
  attribute KEEP of \r_acq_tail_reg[4]\ : label is "yes";
  attribute KEEP of \r_counter_reg[0]\ : label is "yes";
  attribute KEEP of \r_counter_reg[10]\ : label is "yes";
  attribute KEEP of \r_counter_reg[11]\ : label is "yes";
  attribute KEEP of \r_counter_reg[12]\ : label is "yes";
  attribute KEEP of \r_counter_reg[13]\ : label is "yes";
  attribute KEEP of \r_counter_reg[14]\ : label is "yes";
  attribute KEEP of \r_counter_reg[15]\ : label is "yes";
  attribute KEEP of \r_counter_reg[16]\ : label is "yes";
  attribute KEEP of \r_counter_reg[17]\ : label is "yes";
  attribute KEEP of \r_counter_reg[18]\ : label is "yes";
  attribute KEEP of \r_counter_reg[19]\ : label is "yes";
  attribute KEEP of \r_counter_reg[1]\ : label is "yes";
  attribute KEEP of \r_counter_reg[20]\ : label is "yes";
  attribute KEEP of \r_counter_reg[21]\ : label is "yes";
  attribute KEEP of \r_counter_reg[22]\ : label is "yes";
  attribute KEEP of \r_counter_reg[23]\ : label is "yes";
  attribute KEEP of \r_counter_reg[24]\ : label is "yes";
  attribute KEEP of \r_counter_reg[25]\ : label is "yes";
  attribute KEEP of \r_counter_reg[26]\ : label is "yes";
  attribute KEEP of \r_counter_reg[27]\ : label is "yes";
  attribute KEEP of \r_counter_reg[28]\ : label is "yes";
  attribute KEEP of \r_counter_reg[29]\ : label is "yes";
  attribute KEEP of \r_counter_reg[2]\ : label is "yes";
  attribute KEEP of \r_counter_reg[30]\ : label is "yes";
  attribute KEEP of \r_counter_reg[31]\ : label is "yes";
  attribute KEEP of \r_counter_reg[3]\ : label is "yes";
  attribute KEEP of \r_counter_reg[4]\ : label is "yes";
  attribute KEEP of \r_counter_reg[5]\ : label is "yes";
  attribute KEEP of \r_counter_reg[6]\ : label is "yes";
  attribute KEEP of \r_counter_reg[7]\ : label is "yes";
  attribute KEEP of \r_counter_reg[8]\ : label is "yes";
  attribute KEEP of \r_counter_reg[9]\ : label is "yes";
  attribute KEEP of r_phase_tag_threshold_reg : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[0]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[10]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[11]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[12]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[13]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[14]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[15]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[16]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[17]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[18]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[19]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[1]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[20]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[21]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[22]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[23]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[24]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[25]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[26]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[27]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[28]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[29]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[2]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[30]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[31]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[3]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[4]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[5]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[6]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[7]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[8]\ : label is "yes";
  attribute KEEP of \rr_num_cmds_to_wait_reg[9]\ : label is "yes";
begin
  M_AXI_ARADDR(63) <= \<const0>\;
  M_AXI_ARADDR(62) <= \<const0>\;
  M_AXI_ARADDR(61) <= \<const0>\;
  M_AXI_ARADDR(60) <= \<const0>\;
  M_AXI_ARADDR(59) <= \<const0>\;
  M_AXI_ARADDR(58) <= \<const0>\;
  M_AXI_ARADDR(57) <= \<const0>\;
  M_AXI_ARADDR(56) <= \<const0>\;
  M_AXI_ARADDR(55) <= \<const0>\;
  M_AXI_ARADDR(54) <= \<const0>\;
  M_AXI_ARADDR(53) <= \<const0>\;
  M_AXI_ARADDR(52) <= \<const0>\;
  M_AXI_ARADDR(51) <= \<const0>\;
  M_AXI_ARADDR(50) <= \<const0>\;
  M_AXI_ARADDR(49) <= \<const0>\;
  M_AXI_ARADDR(48) <= \<const0>\;
  M_AXI_ARADDR(47) <= \<const0>\;
  M_AXI_ARADDR(46) <= \<const0>\;
  M_AXI_ARADDR(45) <= \<const0>\;
  M_AXI_ARADDR(44) <= \<const0>\;
  M_AXI_ARADDR(43) <= \<const0>\;
  M_AXI_ARADDR(42) <= \<const0>\;
  M_AXI_ARADDR(41) <= \<const0>\;
  M_AXI_ARADDR(40) <= \<const0>\;
  M_AXI_ARADDR(39) <= \<const0>\;
  M_AXI_ARADDR(38) <= \<const0>\;
  M_AXI_ARADDR(37) <= \<const0>\;
  M_AXI_ARADDR(36) <= \<const0>\;
  M_AXI_ARADDR(35) <= \<const0>\;
  M_AXI_ARADDR(34) <= \<const0>\;
  M_AXI_ARADDR(33) <= \<const0>\;
  M_AXI_ARADDR(32) <= \<const0>\;
  M_AXI_ARADDR(31) <= \<const0>\;
  M_AXI_ARADDR(30) <= \<const0>\;
  M_AXI_ARADDR(29) <= \<const0>\;
  M_AXI_ARADDR(28) <= \<const0>\;
  M_AXI_ARADDR(27) <= \<const0>\;
  M_AXI_ARADDR(26) <= \<const0>\;
  M_AXI_ARADDR(25) <= \<const0>\;
  M_AXI_ARADDR(24) <= \<const0>\;
  M_AXI_ARADDR(23) <= \<const0>\;
  M_AXI_ARADDR(22) <= \<const0>\;
  M_AXI_ARADDR(21) <= \<const0>\;
  M_AXI_ARADDR(20) <= \<const0>\;
  M_AXI_ARADDR(19) <= \<const0>\;
  M_AXI_ARADDR(18) <= \<const0>\;
  M_AXI_ARADDR(17) <= \<const0>\;
  M_AXI_ARADDR(16) <= \<const0>\;
  M_AXI_ARADDR(15) <= \<const0>\;
  M_AXI_ARADDR(14) <= \<const0>\;
  M_AXI_ARADDR(13) <= \<const0>\;
  M_AXI_ARADDR(12) <= \<const0>\;
  M_AXI_ARADDR(11) <= \<const0>\;
  M_AXI_ARADDR(10) <= \<const0>\;
  M_AXI_ARADDR(9) <= \<const0>\;
  M_AXI_ARADDR(8) <= \<const0>\;
  M_AXI_ARADDR(7) <= \<const0>\;
  M_AXI_ARADDR(6) <= \<const0>\;
  M_AXI_ARADDR(5) <= \<const0>\;
  M_AXI_ARADDR(4) <= \<const0>\;
  M_AXI_ARADDR(3) <= \<const0>\;
  M_AXI_ARADDR(2) <= \<const0>\;
  M_AXI_ARADDR(1) <= \<const0>\;
  M_AXI_ARADDR(0) <= \<const0>\;
  M_AXI_ARPROT(2) <= \<const0>\;
  M_AXI_ARPROT(1) <= \<const0>\;
  M_AXI_ARPROT(0) <= \<const0>\;
  M_AXI_ARVALID <= \<const0>\;
  M_AXI_AWADDR(63) <= \<const0>\;
  M_AXI_AWADDR(62) <= \<const0>\;
  M_AXI_AWADDR(61) <= \<const0>\;
  M_AXI_AWADDR(60) <= \<const0>\;
  M_AXI_AWADDR(59) <= \<const0>\;
  M_AXI_AWADDR(58) <= \<const0>\;
  M_AXI_AWADDR(57) <= \<const0>\;
  M_AXI_AWADDR(56) <= \<const0>\;
  M_AXI_AWADDR(55) <= \<const0>\;
  M_AXI_AWADDR(54) <= \<const0>\;
  M_AXI_AWADDR(53) <= \<const0>\;
  M_AXI_AWADDR(52) <= \<const0>\;
  M_AXI_AWADDR(51) <= \<const0>\;
  M_AXI_AWADDR(50) <= \<const0>\;
  M_AXI_AWADDR(49) <= \<const0>\;
  M_AXI_AWADDR(48) <= \<const0>\;
  M_AXI_AWADDR(47) <= \<const0>\;
  M_AXI_AWADDR(46) <= \<const0>\;
  M_AXI_AWADDR(45) <= \<const0>\;
  M_AXI_AWADDR(44) <= \<const0>\;
  M_AXI_AWADDR(43) <= \<const0>\;
  M_AXI_AWADDR(42) <= \<const0>\;
  M_AXI_AWADDR(41) <= \<const0>\;
  M_AXI_AWADDR(40) <= \<const0>\;
  M_AXI_AWADDR(39) <= \<const0>\;
  M_AXI_AWADDR(38) <= \<const0>\;
  M_AXI_AWADDR(37) <= \<const0>\;
  M_AXI_AWADDR(36) <= \<const0>\;
  M_AXI_AWADDR(35) <= \<const0>\;
  M_AXI_AWADDR(34) <= \<const0>\;
  M_AXI_AWADDR(33) <= \<const0>\;
  M_AXI_AWADDR(32) <= \<const0>\;
  M_AXI_AWADDR(31) <= \^m_axi_awaddr\(31);
  M_AXI_AWADDR(30) <= \<const0>\;
  M_AXI_AWADDR(29) <= \<const0>\;
  M_AXI_AWADDR(28) <= \<const0>\;
  M_AXI_AWADDR(27) <= \<const0>\;
  M_AXI_AWADDR(26) <= \<const0>\;
  M_AXI_AWADDR(25) <= \<const0>\;
  M_AXI_AWADDR(24) <= \<const0>\;
  M_AXI_AWADDR(23) <= \<const0>\;
  M_AXI_AWADDR(22) <= \<const0>\;
  M_AXI_AWADDR(21) <= \<const0>\;
  M_AXI_AWADDR(20) <= \<const0>\;
  M_AXI_AWADDR(19) <= \<const0>\;
  M_AXI_AWADDR(18) <= \<const0>\;
  M_AXI_AWADDR(17) <= \<const0>\;
  M_AXI_AWADDR(16) <= \<const0>\;
  M_AXI_AWADDR(15) <= \<const0>\;
  M_AXI_AWADDR(14) <= \<const0>\;
  M_AXI_AWADDR(13) <= \<const0>\;
  M_AXI_AWADDR(12) <= \<const0>\;
  M_AXI_AWADDR(11) <= \<const0>\;
  M_AXI_AWADDR(10) <= \<const0>\;
  M_AXI_AWADDR(9) <= \<const0>\;
  M_AXI_AWADDR(8) <= \<const0>\;
  M_AXI_AWADDR(7) <= \<const0>\;
  M_AXI_AWADDR(6) <= \<const0>\;
  M_AXI_AWADDR(5) <= \<const0>\;
  M_AXI_AWADDR(4) <= \<const0>\;
  M_AXI_AWADDR(3) <= \<const0>\;
  M_AXI_AWADDR(2) <= \<const0>\;
  M_AXI_AWADDR(1) <= \<const0>\;
  M_AXI_AWADDR(0) <= \<const0>\;
  M_AXI_AWPROT(2) <= \<const0>\;
  M_AXI_AWPROT(1) <= \<const0>\;
  M_AXI_AWPROT(0) <= \<const0>\;
  M_AXI_BREADY <= \<const0>\;
  M_AXI_RREADY <= \<const0>\;
  M_AXI_WDATA(31) <= \<const0>\;
  M_AXI_WDATA(30) <= \<const0>\;
  M_AXI_WDATA(29) <= \<const0>\;
  M_AXI_WDATA(28) <= \<const0>\;
  M_AXI_WDATA(27) <= \<const0>\;
  M_AXI_WDATA(26) <= \<const0>\;
  M_AXI_WDATA(25) <= \<const0>\;
  M_AXI_WDATA(24) <= \<const0>\;
  M_AXI_WDATA(23) <= \<const0>\;
  M_AXI_WDATA(22) <= \<const0>\;
  M_AXI_WDATA(21) <= \<const0>\;
  M_AXI_WDATA(20) <= \<const0>\;
  M_AXI_WDATA(19) <= \<const0>\;
  M_AXI_WDATA(18) <= \<const0>\;
  M_AXI_WDATA(17) <= \<const0>\;
  M_AXI_WDATA(16) <= \<const0>\;
  M_AXI_WDATA(15) <= \<const0>\;
  M_AXI_WDATA(14) <= \<const0>\;
  M_AXI_WDATA(13) <= \<const0>\;
  M_AXI_WDATA(12) <= \<const0>\;
  M_AXI_WDATA(11) <= \<const0>\;
  M_AXI_WDATA(10) <= \<const0>\;
  M_AXI_WDATA(9) <= \<const0>\;
  M_AXI_WDATA(8) <= \<const0>\;
  M_AXI_WDATA(7) <= \<const0>\;
  M_AXI_WDATA(6) <= \<const0>\;
  M_AXI_WDATA(5) <= \<const0>\;
  M_AXI_WDATA(4 downto 0) <= \^m_axi_wdata\(4 downto 0);
  M_AXI_WSTRB(3) <= \^m_axi_wstrb\(3);
  M_AXI_WSTRB(2) <= \<const0>\;
  M_AXI_WSTRB(1) <= \<const0>\;
  M_AXI_WSTRB(0) <= \<const0>\;
  M_AXI_WVALID <= \<const0>\;
  cpl_addr(4 downto 0) <= acq_tail(4 downto 0);
  cpl_rd_en <= \<const0>\;
  done <= \^done\;
\FSM_sequential_current_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EBEAEBEAABAAEBEA"
    )
        port map (
      I0 => \FSM_sequential_current_state[0]_i_2_n_0\,
      I1 => current_state(1),
      I2 => current_state(0),
      I3 => go,
      I4 => M_AXI_WREADY,
      I5 => done_INST_0_i_8_n_0,
      O => \next_state__0\(0)
    );
\FSM_sequential_current_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C040C04F0000000"
    )
        port map (
      I0 => M_AXI_WREADY,
      I1 => M_AXI_AWREADY,
      I2 => current_state(0),
      I3 => done_INST_0_i_8_n_0,
      I4 => \FSM_sequential_current_state[1]_i_3_n_0\,
      I5 => current_state(1),
      O => \FSM_sequential_current_state[0]_i_2_n_0\
    );
\FSM_sequential_current_state[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => M_AXI_ARESETN,
      O => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\FSM_sequential_current_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F7700FFFF7700"
    )
        port map (
      I0 => \FSM_sequential_current_state[1]_i_3_n_0\,
      I1 => done_INST_0_i_8_n_0,
      I2 => M_AXI_AWREADY,
      I3 => current_state(0),
      I4 => current_state(1),
      I5 => M_AXI_WREADY,
      O => \next_state__0\(1)
    );
\FSM_sequential_current_state[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BEFFFFBEFFFFFFFF"
    )
        port map (
      I0 => acq_tail_inferred_i_14_n_0,
      I1 => r_acq_head(0),
      I2 => tmp(0),
      I3 => r_acq_head(1),
      I4 => tmp(1),
      I5 => \FSM_sequential_current_state[1]_i_4_n_0\,
      O => \FSM_sequential_current_state[1]_i_3_n_0\
    );
\FSM_sequential_current_state[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => tmp(4),
      I1 => r_acq_head(4),
      I2 => tmp(3),
      I3 => r_acq_head(3),
      I4 => r_acq_head(2),
      I5 => tmp(2),
      O => \FSM_sequential_current_state[1]_i_4_n_0\
    );
\FSM_sequential_current_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => \next_state__0\(0),
      Q => current_state(0),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\FSM_sequential_current_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => \next_state__0\(1),
      Q => current_state(1),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\M_AXI_AWADDR[31]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => current_state(1),
      I2 => current_state(0),
      O => \^m_axi_awaddr\(31)
    );
M_AXI_AWVALID_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(1),
      I2 => done_INST_0_i_1_n_0,
      O => M_AXI_AWVALID
    );
\M_AXI_WDATA[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => current_state(1),
      I2 => r_acq_head(0),
      O => \^m_axi_wdata\(0)
    );
\M_AXI_WDATA[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => current_state(1),
      I2 => r_acq_head(1),
      O => \^m_axi_wdata\(1)
    );
\M_AXI_WDATA[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => current_state(1),
      I2 => r_acq_head(2),
      O => \^m_axi_wdata\(2)
    );
\M_AXI_WDATA[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => current_state(1),
      I2 => r_acq_head(3),
      O => \^m_axi_wdata\(3)
    );
\M_AXI_WDATA[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => current_state(1),
      I2 => r_acq_head(4),
      O => \^m_axi_wdata\(4)
    );
\M_AXI_WSTRB[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => current_state(1),
      I1 => done_INST_0_i_1_n_0,
      O => \^m_axi_wstrb\(3)
    );
acq_head_inferred_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => r_acq_head(4),
      I1 => done_INST_0_i_1_n_0,
      I2 => acq_head_inferred_i_6_n_0,
      O => acq_head(4)
    );
acq_head_inferred_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAB8AAAAAAF0AAAA"
    )
        port map (
      I0 => r_acq_head(0),
      I1 => \FSM_sequential_current_state[1]_i_3_n_0\,
      I2 => r_acq_tail(0),
      I3 => current_state(1),
      I4 => current_state(0),
      I5 => done_INST_0_i_8_n_0,
      O => acq_head_inferred_i_10_n_0
    );
acq_head_inferred_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => r_acq_head(3),
      I1 => done_INST_0_i_1_n_0,
      I2 => acq_head_inferred_i_7_n_0,
      O => acq_head(3)
    );
acq_head_inferred_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => r_acq_head(2),
      I1 => done_INST_0_i_1_n_0,
      I2 => acq_head_inferred_i_8_n_0,
      O => acq_head(2)
    );
acq_head_inferred_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => r_acq_head(1),
      I1 => done_INST_0_i_1_n_0,
      I2 => acq_head_inferred_i_9_n_0,
      O => acq_head(1)
    );
acq_head_inferred_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => r_acq_head(0),
      I1 => done_INST_0_i_1_n_0,
      I2 => acq_head_inferred_i_10_n_0,
      O => acq_head(0)
    );
acq_head_inferred_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAB8AAAAAAF0AAAA"
    )
        port map (
      I0 => r_acq_head(4),
      I1 => \FSM_sequential_current_state[1]_i_3_n_0\,
      I2 => r_acq_tail(4),
      I3 => current_state(1),
      I4 => current_state(0),
      I5 => done_INST_0_i_8_n_0,
      O => acq_head_inferred_i_6_n_0
    );
acq_head_inferred_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAB8AAAAAAF0AAAA"
    )
        port map (
      I0 => r_acq_head(3),
      I1 => \FSM_sequential_current_state[1]_i_3_n_0\,
      I2 => r_acq_tail(3),
      I3 => current_state(1),
      I4 => current_state(0),
      I5 => done_INST_0_i_8_n_0,
      O => acq_head_inferred_i_7_n_0
    );
acq_head_inferred_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAB8AAAAAAF0AAAA"
    )
        port map (
      I0 => r_acq_head(2),
      I1 => \FSM_sequential_current_state[1]_i_3_n_0\,
      I2 => r_acq_tail(2),
      I3 => current_state(1),
      I4 => current_state(0),
      I5 => done_INST_0_i_8_n_0,
      O => acq_head_inferred_i_8_n_0
    );
acq_head_inferred_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAB8AAAAAAF0AAAA"
    )
        port map (
      I0 => r_acq_head(1),
      I1 => \FSM_sequential_current_state[1]_i_3_n_0\,
      I2 => r_acq_tail(1),
      I3 => current_state(1),
      I4 => current_state(0),
      I5 => done_INST_0_i_8_n_0,
      O => acq_head_inferred_i_9_n_0
    );
acq_tail_inferred_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF55FE44FE44FE44"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => acq_tail_inferred_i_6_n_0,
      I2 => acq_tail_inferred_i_7_n_0,
      I3 => r_acq_tail(4),
      I4 => r_acq_head(4),
      I5 => acq_tail_inferred_i_8_n_0,
      O => acq_tail(4)
    );
acq_tail_inferred_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAA00000000"
    )
        port map (
      I0 => r_acq_tail(2),
      I1 => r_acq_tail(1),
      I2 => r_acq_tail(0),
      I3 => done_INST_0_i_8_n_0,
      I4 => acq_tail_inferred_i_14_n_0,
      I5 => acq_tail_inferred_i_13_n_0,
      O => acq_tail_inferred_i_10_n_0
    );
acq_tail_inferred_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6A6AAA00000000"
    )
        port map (
      I0 => r_acq_tail(1),
      I1 => r_acq_tail(0),
      I2 => done_INST_0_i_8_n_0,
      I3 => cpl_data(112),
      I4 => r_phase_tag_threshold,
      I5 => acq_tail_inferred_i_13_n_0,
      O => acq_tail_inferred_i_11_n_0
    );
acq_tail_inferred_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000096AA00000000"
    )
        port map (
      I0 => r_acq_tail(0),
      I1 => r_phase_tag_threshold,
      I2 => cpl_data(112),
      I3 => done_INST_0_i_8_n_0,
      I4 => current_state(1),
      I5 => current_state(0),
      O => acq_tail_inferred_i_12_n_0
    );
acq_tail_inferred_i_13: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(1),
      O => acq_tail_inferred_i_13_n_0
    );
acq_tail_inferred_i_14: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cpl_data(112),
      I1 => r_phase_tag_threshold,
      O => acq_tail_inferred_i_14_n_0
    );
acq_tail_inferred_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF55FE44FE44FE44"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => acq_tail_inferred_i_9_n_0,
      I2 => acq_tail_inferred_i_7_n_0,
      I3 => r_acq_tail(3),
      I4 => r_acq_head(3),
      I5 => acq_tail_inferred_i_8_n_0,
      O => acq_tail(3)
    );
acq_tail_inferred_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF55FE44FE44FE44"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => acq_tail_inferred_i_10_n_0,
      I2 => acq_tail_inferred_i_7_n_0,
      I3 => r_acq_tail(2),
      I4 => r_acq_head(2),
      I5 => acq_tail_inferred_i_8_n_0,
      O => acq_tail(2)
    );
acq_tail_inferred_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF55FE44FE44FE44"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => acq_tail_inferred_i_11_n_0,
      I2 => acq_tail_inferred_i_7_n_0,
      I3 => r_acq_tail(1),
      I4 => r_acq_head(1),
      I5 => acq_tail_inferred_i_8_n_0,
      O => acq_tail(1)
    );
acq_tail_inferred_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF55FE44FE44FE44"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => acq_tail_inferred_i_12_n_0,
      I2 => acq_tail_inferred_i_7_n_0,
      I3 => r_acq_tail(0),
      I4 => r_acq_head(0),
      I5 => acq_tail_inferred_i_8_n_0,
      O => acq_tail(0)
    );
acq_tail_inferred_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBBF088000000000"
    )
        port map (
      I0 => tmp(4),
      I1 => done_INST_0_i_8_n_0,
      I2 => cpl_data(112),
      I3 => r_phase_tag_threshold,
      I4 => r_acq_tail(4),
      I5 => acq_tail_inferred_i_13_n_0,
      O => acq_tail_inferred_i_6_n_0
    );
acq_tail_inferred_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CD"
    )
        port map (
      I0 => go,
      I1 => current_state(1),
      I2 => current_state(0),
      O => acq_tail_inferred_i_7_n_0
    );
acq_tail_inferred_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(0),
      I2 => go,
      O => acq_tail_inferred_i_8_n_0
    );
acq_tail_inferred_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBBF088000000000"
    )
        port map (
      I0 => tmp(3),
      I1 => done_INST_0_i_8_n_0,
      I2 => cpl_data(112),
      I3 => r_phase_tag_threshold,
      I4 => r_acq_tail(3),
      I5 => acq_tail_inferred_i_13_n_0,
      O => acq_tail_inferred_i_9_n_0
    );
counter_inferred_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(31),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(31),
      I4 => counter_inferred_i_35_n_0,
      O => counter(31)
    );
counter_inferred_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(22),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(22),
      I4 => counter_inferred_i_35_n_0,
      O => counter(22)
    );
counter_inferred_i_11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(21),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(21),
      I4 => counter_inferred_i_35_n_0,
      O => counter(21)
    );
counter_inferred_i_12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(20),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(20),
      I4 => counter_inferred_i_35_n_0,
      O => counter(20)
    );
counter_inferred_i_13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(19),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(19),
      I4 => counter_inferred_i_35_n_0,
      O => counter(19)
    );
counter_inferred_i_14: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(18),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(18),
      I4 => counter_inferred_i_35_n_0,
      O => counter(18)
    );
counter_inferred_i_15: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(17),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(17),
      I4 => counter_inferred_i_35_n_0,
      O => counter(17)
    );
counter_inferred_i_16: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(16),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(16),
      I4 => counter_inferred_i_35_n_0,
      O => counter(16)
    );
counter_inferred_i_17: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(15),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(15),
      I4 => counter_inferred_i_35_n_0,
      O => counter(15)
    );
counter_inferred_i_18: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(14),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(14),
      I4 => counter_inferred_i_35_n_0,
      O => counter(14)
    );
counter_inferred_i_19: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(13),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(13),
      I4 => counter_inferred_i_35_n_0,
      O => counter(13)
    );
counter_inferred_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(30),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(30),
      I4 => counter_inferred_i_35_n_0,
      O => counter(30)
    );
counter_inferred_i_20: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(12),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(12),
      I4 => counter_inferred_i_35_n_0,
      O => counter(12)
    );
counter_inferred_i_21: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(11),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(11),
      I4 => counter_inferred_i_35_n_0,
      O => counter(11)
    );
counter_inferred_i_22: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(10),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(10),
      I4 => counter_inferred_i_35_n_0,
      O => counter(10)
    );
counter_inferred_i_23: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(9),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(9),
      I4 => counter_inferred_i_35_n_0,
      O => counter(9)
    );
counter_inferred_i_24: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(8),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(8),
      I4 => counter_inferred_i_35_n_0,
      O => counter(8)
    );
counter_inferred_i_25: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(7),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(7),
      I4 => counter_inferred_i_35_n_0,
      O => counter(7)
    );
counter_inferred_i_26: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(6),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(6),
      I4 => counter_inferred_i_35_n_0,
      O => counter(6)
    );
counter_inferred_i_27: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(5),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(5),
      I4 => counter_inferred_i_35_n_0,
      O => counter(5)
    );
counter_inferred_i_28: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(4),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(4),
      I4 => counter_inferred_i_35_n_0,
      O => counter(4)
    );
counter_inferred_i_29: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(3),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(3),
      I4 => counter_inferred_i_35_n_0,
      O => counter(3)
    );
counter_inferred_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(29),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(29),
      I4 => counter_inferred_i_35_n_0,
      O => counter(29)
    );
counter_inferred_i_30: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(2),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(2),
      I4 => counter_inferred_i_35_n_0,
      O => counter(2)
    );
counter_inferred_i_31: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(1),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(1),
      I4 => counter_inferred_i_35_n_0,
      O => counter(1)
    );
counter_inferred_i_32: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(0),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(0),
      I4 => counter_inferred_i_35_n_0,
      O => counter(0)
    );
counter_inferred_i_33: unisim.vcomponents.CARRY8
     port map (
      CI => counter_inferred_i_36_n_0,
      CI_TOP => '0',
      CO(7) => NLW_counter_inferred_i_33_CO_UNCONNECTED(7),
      CO(6) => counter_inferred_i_33_n_1,
      CO(5) => counter_inferred_i_33_n_2,
      CO(4) => counter_inferred_i_33_n_3,
      CO(3) => counter_inferred_i_33_n_4,
      CO(2) => counter_inferred_i_33_n_5,
      CO(1) => counter_inferred_i_33_n_6,
      CO(0) => counter_inferred_i_33_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \counter__0\(31 downto 24),
      S(7 downto 0) => r_counter(31 downto 24)
    );
counter_inferred_i_34: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(0),
      I2 => done_INST_0_i_8_n_0,
      O => counter_inferred_i_34_n_0
    );
counter_inferred_i_35: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F4F7"
    )
        port map (
      I0 => done_INST_0_i_8_n_0,
      I1 => current_state(0),
      I2 => current_state(1),
      I3 => go,
      O => counter_inferred_i_35_n_0
    );
counter_inferred_i_36: unisim.vcomponents.CARRY8
     port map (
      CI => counter_inferred_i_37_n_0,
      CI_TOP => '0',
      CO(7) => counter_inferred_i_36_n_0,
      CO(6) => counter_inferred_i_36_n_1,
      CO(5) => counter_inferred_i_36_n_2,
      CO(4) => counter_inferred_i_36_n_3,
      CO(3) => counter_inferred_i_36_n_4,
      CO(2) => counter_inferred_i_36_n_5,
      CO(1) => counter_inferred_i_36_n_6,
      CO(0) => counter_inferred_i_36_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \counter__0\(23 downto 16),
      S(7 downto 0) => r_counter(23 downto 16)
    );
counter_inferred_i_37: unisim.vcomponents.CARRY8
     port map (
      CI => counter_inferred_i_38_n_0,
      CI_TOP => '0',
      CO(7) => counter_inferred_i_37_n_0,
      CO(6) => counter_inferred_i_37_n_1,
      CO(5) => counter_inferred_i_37_n_2,
      CO(4) => counter_inferred_i_37_n_3,
      CO(3) => counter_inferred_i_37_n_4,
      CO(2) => counter_inferred_i_37_n_5,
      CO(1) => counter_inferred_i_37_n_6,
      CO(0) => counter_inferred_i_37_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \counter__0\(15 downto 8),
      S(7 downto 0) => r_counter(15 downto 8)
    );
counter_inferred_i_38: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => counter_inferred_i_38_n_0,
      CO(6) => counter_inferred_i_38_n_1,
      CO(5) => counter_inferred_i_38_n_2,
      CO(4) => counter_inferred_i_38_n_3,
      CO(3) => counter_inferred_i_38_n_4,
      CO(2) => counter_inferred_i_38_n_5,
      CO(1) => counter_inferred_i_38_n_6,
      CO(0) => counter_inferred_i_38_n_7,
      DI(7 downto 1) => B"0000000",
      DI(0) => r_counter(0),
      O(7 downto 0) => \counter__0\(7 downto 0),
      S(7 downto 1) => r_counter(7 downto 1),
      S(0) => counter_inferred_i_39_n_0
    );
counter_inferred_i_39: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => r_counter(0),
      I1 => r_phase_tag_threshold,
      I2 => cpl_data(112),
      O => counter_inferred_i_39_n_0
    );
counter_inferred_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(28),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(28),
      I4 => counter_inferred_i_35_n_0,
      O => counter(28)
    );
counter_inferred_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(27),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(27),
      I4 => counter_inferred_i_35_n_0,
      O => counter(27)
    );
counter_inferred_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(26),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(26),
      I4 => counter_inferred_i_35_n_0,
      O => counter(26)
    );
counter_inferred_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(25),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(25),
      I4 => counter_inferred_i_35_n_0,
      O => counter(25)
    );
counter_inferred_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(24),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(24),
      I4 => counter_inferred_i_35_n_0,
      O => counter(24)
    );
counter_inferred_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF40EA40"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => \counter__0\(23),
      I2 => counter_inferred_i_34_n_0,
      I3 => r_counter(23),
      I4 => counter_inferred_i_35_n_0,
      O => counter(23)
    );
done_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBBBBB8"
    )
        port map (
      I0 => r_done,
      I1 => done_INST_0_i_1_n_0,
      I2 => done_INST_0_i_2_n_0,
      I3 => done_INST_0_i_3_n_0,
      I4 => done_INST_0_i_4_n_0,
      O => \^done\
    );
done_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => done_INST_0_i_5_n_0,
      I1 => current_state(16),
      I2 => current_state(17),
      I3 => done_INST_0_i_6_n_0,
      I4 => done_INST_0_i_7_n_0,
      O => done_INST_0_i_1_n_0
    );
done_INST_0_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => current_state(24),
      I1 => current_state(25),
      I2 => current_state(26),
      I3 => current_state(27),
      O => done_INST_0_i_10_n_0
    );
done_INST_0_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => current_state(31),
      I1 => current_state(30),
      I2 => current_state(29),
      I3 => current_state(28),
      I4 => current_state(18),
      I5 => current_state(19),
      O => done_INST_0_i_11_n_0
    );
done_INST_0_i_12: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => done_INST_0_i_12_n_0,
      CO(6) => done_INST_0_i_12_n_1,
      CO(5) => done_INST_0_i_12_n_2,
      CO(4) => done_INST_0_i_12_n_3,
      CO(3) => done_INST_0_i_12_n_4,
      CO(2) => done_INST_0_i_12_n_5,
      CO(1) => done_INST_0_i_12_n_6,
      CO(0) => done_INST_0_i_12_n_7,
      DI(7) => done_INST_0_i_29_n_0,
      DI(6) => done_INST_0_i_30_n_0,
      DI(5) => done_INST_0_i_31_n_0,
      DI(4) => done_INST_0_i_32_n_0,
      DI(3) => done_INST_0_i_33_n_0,
      DI(2) => done_INST_0_i_34_n_0,
      DI(1) => done_INST_0_i_35_n_0,
      DI(0) => done_INST_0_i_36_n_0,
      O(7 downto 0) => NLW_done_INST_0_i_12_O_UNCONNECTED(7 downto 0),
      S(7) => done_INST_0_i_37_n_0,
      S(6) => done_INST_0_i_38_n_0,
      S(5) => done_INST_0_i_39_n_0,
      S(4) => done_INST_0_i_40_n_0,
      S(3) => done_INST_0_i_41_n_0,
      S(2) => done_INST_0_i_42_n_0,
      S(1) => done_INST_0_i_43_n_0,
      S(0) => done_INST_0_i_44_n_0
    );
done_INST_0_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(30),
      I1 => r_counter(30),
      I2 => r_counter(31),
      I3 => rr_num_cmds_to_wait(31),
      O => done_INST_0_i_13_n_0
    );
done_INST_0_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(28),
      I1 => r_counter(28),
      I2 => r_counter(29),
      I3 => rr_num_cmds_to_wait(29),
      O => done_INST_0_i_14_n_0
    );
done_INST_0_i_15: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(26),
      I1 => r_counter(26),
      I2 => r_counter(27),
      I3 => rr_num_cmds_to_wait(27),
      O => done_INST_0_i_15_n_0
    );
done_INST_0_i_16: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(24),
      I1 => r_counter(24),
      I2 => r_counter(25),
      I3 => rr_num_cmds_to_wait(25),
      O => done_INST_0_i_16_n_0
    );
done_INST_0_i_17: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(22),
      I1 => r_counter(22),
      I2 => r_counter(23),
      I3 => rr_num_cmds_to_wait(23),
      O => done_INST_0_i_17_n_0
    );
done_INST_0_i_18: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(20),
      I1 => r_counter(20),
      I2 => r_counter(21),
      I3 => rr_num_cmds_to_wait(21),
      O => done_INST_0_i_18_n_0
    );
done_INST_0_i_19: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(18),
      I1 => r_counter(18),
      I2 => r_counter(19),
      I3 => rr_num_cmds_to_wait(19),
      O => done_INST_0_i_19_n_0
    );
done_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080008000000080"
    )
        port map (
      I0 => M_AXI_AWREADY,
      I1 => M_AXI_WREADY,
      I2 => current_state(1),
      I3 => current_state(0),
      I4 => done_INST_0_i_8_n_0,
      I5 => r_done,
      O => done_INST_0_i_2_n_0
    );
done_INST_0_i_20: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(16),
      I1 => r_counter(16),
      I2 => r_counter(17),
      I3 => rr_num_cmds_to_wait(17),
      O => done_INST_0_i_20_n_0
    );
done_INST_0_i_21: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(31),
      I1 => rr_num_cmds_to_wait(31),
      I2 => r_counter(30),
      I3 => rr_num_cmds_to_wait(30),
      O => done_INST_0_i_21_n_0
    );
done_INST_0_i_22: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(29),
      I1 => rr_num_cmds_to_wait(29),
      I2 => r_counter(28),
      I3 => rr_num_cmds_to_wait(28),
      O => done_INST_0_i_22_n_0
    );
done_INST_0_i_23: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(27),
      I1 => rr_num_cmds_to_wait(27),
      I2 => r_counter(26),
      I3 => rr_num_cmds_to_wait(26),
      O => done_INST_0_i_23_n_0
    );
done_INST_0_i_24: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(25),
      I1 => rr_num_cmds_to_wait(25),
      I2 => r_counter(24),
      I3 => rr_num_cmds_to_wait(24),
      O => done_INST_0_i_24_n_0
    );
done_INST_0_i_25: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(23),
      I1 => rr_num_cmds_to_wait(23),
      I2 => r_counter(22),
      I3 => rr_num_cmds_to_wait(22),
      O => done_INST_0_i_25_n_0
    );
done_INST_0_i_26: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(21),
      I1 => rr_num_cmds_to_wait(21),
      I2 => r_counter(20),
      I3 => rr_num_cmds_to_wait(20),
      O => done_INST_0_i_26_n_0
    );
done_INST_0_i_27: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(19),
      I1 => rr_num_cmds_to_wait(19),
      I2 => r_counter(18),
      I3 => rr_num_cmds_to_wait(18),
      O => done_INST_0_i_27_n_0
    );
done_INST_0_i_28: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(17),
      I1 => rr_num_cmds_to_wait(17),
      I2 => r_counter(16),
      I3 => rr_num_cmds_to_wait(16),
      O => done_INST_0_i_28_n_0
    );
done_INST_0_i_29: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(14),
      I1 => r_counter(14),
      I2 => r_counter(15),
      I3 => rr_num_cmds_to_wait(15),
      O => done_INST_0_i_29_n_0
    );
done_INST_0_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F010"
    )
        port map (
      I0 => go,
      I1 => async_clear,
      I2 => r_done,
      I3 => current_state(0),
      I4 => current_state(1),
      O => done_INST_0_i_3_n_0
    );
done_INST_0_i_30: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(12),
      I1 => r_counter(12),
      I2 => r_counter(13),
      I3 => rr_num_cmds_to_wait(13),
      O => done_INST_0_i_30_n_0
    );
done_INST_0_i_31: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(10),
      I1 => r_counter(10),
      I2 => r_counter(11),
      I3 => rr_num_cmds_to_wait(11),
      O => done_INST_0_i_31_n_0
    );
done_INST_0_i_32: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(8),
      I1 => r_counter(8),
      I2 => r_counter(9),
      I3 => rr_num_cmds_to_wait(9),
      O => done_INST_0_i_32_n_0
    );
done_INST_0_i_33: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(6),
      I1 => r_counter(6),
      I2 => r_counter(7),
      I3 => rr_num_cmds_to_wait(7),
      O => done_INST_0_i_33_n_0
    );
done_INST_0_i_34: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(4),
      I1 => r_counter(4),
      I2 => r_counter(5),
      I3 => rr_num_cmds_to_wait(5),
      O => done_INST_0_i_34_n_0
    );
done_INST_0_i_35: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(2),
      I1 => r_counter(2),
      I2 => r_counter(3),
      I3 => rr_num_cmds_to_wait(3),
      O => done_INST_0_i_35_n_0
    );
done_INST_0_i_36: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => rr_num_cmds_to_wait(0),
      I1 => r_counter(0),
      I2 => r_counter(1),
      I3 => rr_num_cmds_to_wait(1),
      O => done_INST_0_i_36_n_0
    );
done_INST_0_i_37: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(15),
      I1 => rr_num_cmds_to_wait(15),
      I2 => r_counter(14),
      I3 => rr_num_cmds_to_wait(14),
      O => done_INST_0_i_37_n_0
    );
done_INST_0_i_38: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(13),
      I1 => rr_num_cmds_to_wait(13),
      I2 => r_counter(12),
      I3 => rr_num_cmds_to_wait(12),
      O => done_INST_0_i_38_n_0
    );
done_INST_0_i_39: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(11),
      I1 => rr_num_cmds_to_wait(11),
      I2 => r_counter(10),
      I3 => rr_num_cmds_to_wait(10),
      O => done_INST_0_i_39_n_0
    );
done_INST_0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDCC0CCC00000000"
    )
        port map (
      I0 => done_INST_0_i_8_n_0,
      I1 => r_done,
      I2 => M_AXI_AWREADY,
      I3 => M_AXI_WREADY,
      I4 => current_state(0),
      I5 => current_state(1),
      O => done_INST_0_i_4_n_0
    );
done_INST_0_i_40: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(9),
      I1 => rr_num_cmds_to_wait(9),
      I2 => r_counter(8),
      I3 => rr_num_cmds_to_wait(8),
      O => done_INST_0_i_40_n_0
    );
done_INST_0_i_41: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(7),
      I1 => rr_num_cmds_to_wait(7),
      I2 => r_counter(6),
      I3 => rr_num_cmds_to_wait(6),
      O => done_INST_0_i_41_n_0
    );
done_INST_0_i_42: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(5),
      I1 => rr_num_cmds_to_wait(5),
      I2 => r_counter(4),
      I3 => rr_num_cmds_to_wait(4),
      O => done_INST_0_i_42_n_0
    );
done_INST_0_i_43: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(3),
      I1 => rr_num_cmds_to_wait(3),
      I2 => r_counter(2),
      I3 => rr_num_cmds_to_wait(2),
      O => done_INST_0_i_43_n_0
    );
done_INST_0_i_44: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(1),
      I1 => rr_num_cmds_to_wait(1),
      I2 => r_counter(0),
      I3 => rr_num_cmds_to_wait(0),
      O => done_INST_0_i_44_n_0
    );
done_INST_0_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => done_INST_0_i_9_n_0,
      I1 => current_state(7),
      I2 => current_state(6),
      I3 => current_state(5),
      I4 => current_state(4),
      O => done_INST_0_i_5_n_0
    );
done_INST_0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => done_INST_0_i_10_n_0,
      I1 => current_state(20),
      I2 => current_state(21),
      I3 => current_state(22),
      I4 => current_state(23),
      I5 => done_INST_0_i_11_n_0,
      O => done_INST_0_i_6_n_0
    );
done_INST_0_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => current_state(8),
      I1 => current_state(9),
      I2 => current_state(10),
      I3 => current_state(11),
      O => done_INST_0_i_7_n_0
    );
done_INST_0_i_8: unisim.vcomponents.CARRY8
     port map (
      CI => done_INST_0_i_12_n_0,
      CI_TOP => '0',
      CO(7) => done_INST_0_i_8_n_0,
      CO(6) => done_INST_0_i_8_n_1,
      CO(5) => done_INST_0_i_8_n_2,
      CO(4) => done_INST_0_i_8_n_3,
      CO(3) => done_INST_0_i_8_n_4,
      CO(2) => done_INST_0_i_8_n_5,
      CO(1) => done_INST_0_i_8_n_6,
      CO(0) => done_INST_0_i_8_n_7,
      DI(7) => done_INST_0_i_13_n_0,
      DI(6) => done_INST_0_i_14_n_0,
      DI(5) => done_INST_0_i_15_n_0,
      DI(4) => done_INST_0_i_16_n_0,
      DI(3) => done_INST_0_i_17_n_0,
      DI(2) => done_INST_0_i_18_n_0,
      DI(1) => done_INST_0_i_19_n_0,
      DI(0) => done_INST_0_i_20_n_0,
      O(7 downto 0) => NLW_done_INST_0_i_8_O_UNCONNECTED(7 downto 0),
      S(7) => done_INST_0_i_21_n_0,
      S(6) => done_INST_0_i_22_n_0,
      S(5) => done_INST_0_i_23_n_0,
      S(4) => done_INST_0_i_24_n_0,
      S(3) => done_INST_0_i_25_n_0,
      S(2) => done_INST_0_i_26_n_0,
      S(1) => done_INST_0_i_27_n_0,
      S(0) => done_INST_0_i_28_n_0
    );
done_INST_0_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => current_state(15),
      I1 => current_state(14),
      I2 => current_state(13),
      I3 => current_state(12),
      I4 => current_state(2),
      I5 => current_state(3),
      O => done_INST_0_i_9_n_0
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(31)
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(30)
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(21)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(20)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(19)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(18)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(17)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(16)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(15)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(14)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(13)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(12)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(29)
    );
i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(11)
    );
i_21: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(10)
    );
i_22: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(9)
    );
i_23: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(8)
    );
i_24: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(7)
    );
i_25: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(6)
    );
i_26: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(5)
    );
i_27: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(4)
    );
i_28: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(3)
    );
i_29: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(2)
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(28)
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(27)
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(26)
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(25)
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(24)
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(23)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => current_state(22)
    );
next_state_inferred_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(31),
      O => next_state(31)
    );
next_state_inferred_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(22),
      O => next_state(22)
    );
next_state_inferred_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(21),
      O => next_state(21)
    );
next_state_inferred_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(20),
      O => next_state(20)
    );
next_state_inferred_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(19),
      O => next_state(19)
    );
next_state_inferred_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(18),
      O => next_state(18)
    );
next_state_inferred_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(17),
      O => next_state(17)
    );
next_state_inferred_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(16),
      O => next_state(16)
    );
next_state_inferred_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(15),
      O => next_state(15)
    );
next_state_inferred_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(14),
      O => next_state(14)
    );
next_state_inferred_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(13),
      O => next_state(13)
    );
next_state_inferred_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(30),
      O => next_state(30)
    );
next_state_inferred_i_20: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(12),
      O => next_state(12)
    );
next_state_inferred_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(11),
      O => next_state(11)
    );
next_state_inferred_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(10),
      O => next_state(10)
    );
next_state_inferred_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(9),
      O => next_state(9)
    );
next_state_inferred_i_24: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(8),
      O => next_state(8)
    );
next_state_inferred_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(7),
      O => next_state(7)
    );
next_state_inferred_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(6),
      O => next_state(6)
    );
next_state_inferred_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(5),
      O => next_state(5)
    );
next_state_inferred_i_28: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(4),
      O => next_state(4)
    );
next_state_inferred_i_29: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(3),
      O => next_state(3)
    );
next_state_inferred_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(29),
      O => next_state(29)
    );
next_state_inferred_i_30: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(2),
      O => next_state(2)
    );
next_state_inferred_i_31: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF5555AFBF0000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => current_state(0),
      I2 => M_AXI_WREADY,
      I3 => M_AXI_AWREADY,
      I4 => current_state(1),
      I5 => next_state_inferred_i_36_n_0,
      O => next_state(1)
    );
next_state_inferred_i_32: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F5F5F5F5F5F5A0A4"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => go,
      I2 => current_state(0),
      I3 => current_state(1),
      I4 => next_state_inferred_i_37_n_0,
      I5 => next_state_inferred_i_38_n_0,
      O => next_state(0)
    );
next_state_inferred_i_33: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F004400"
    )
        port map (
      I0 => next_state_inferred_i_39_n_0,
      I1 => done_INST_0_i_8_n_0,
      I2 => M_AXI_WREADY,
      I3 => current_state(0),
      I4 => current_state(1),
      O => next_state_inferred_i_33_n_0
    );
next_state_inferred_i_34: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(1),
      O => next_state_inferred_i_34_n_0
    );
next_state_inferred_i_35: unisim.vcomponents.LUT5
    generic map(
      INIT => X"080008F0"
    )
        port map (
      I0 => acq_tail_inferred_i_14_n_0,
      I1 => done_INST_0_i_8_n_0,
      I2 => current_state(1),
      I3 => current_state(0),
      I4 => M_AXI_AWREADY,
      O => next_state_inferred_i_35_n_0
    );
next_state_inferred_i_36: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0222"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(1),
      I2 => done_INST_0_i_8_n_0,
      I3 => \FSM_sequential_current_state[1]_i_3_n_0\,
      O => next_state_inferred_i_36_n_0
    );
next_state_inferred_i_37: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2C2C2020000C0000"
    )
        port map (
      I0 => acq_tail_inferred_i_14_n_0,
      I1 => current_state(1),
      I2 => current_state(0),
      I3 => M_AXI_WREADY,
      I4 => M_AXI_AWREADY,
      I5 => done_INST_0_i_8_n_0,
      O => next_state_inferred_i_37_n_0
    );
next_state_inferred_i_38: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A0AA2020"
    )
        port map (
      I0 => current_state(0),
      I1 => next_state_inferred_i_39_n_0,
      I2 => done_INST_0_i_8_n_0,
      I3 => M_AXI_WREADY,
      I4 => current_state(1),
      O => next_state_inferred_i_38_n_0
    );
next_state_inferred_i_39: unisim.vcomponents.LUT5
    generic map(
      INIT => X"82000082"
    )
        port map (
      I0 => \FSM_sequential_current_state[1]_i_4_n_0\,
      I1 => tmp(1),
      I2 => r_acq_head(1),
      I3 => tmp(0),
      I4 => r_acq_head(0),
      O => next_state_inferred_i_39_n_0
    );
next_state_inferred_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(28),
      O => next_state(28)
    );
next_state_inferred_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(27),
      O => next_state(27)
    );
next_state_inferred_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(26),
      O => next_state(26)
    );
next_state_inferred_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(25),
      O => next_state(25)
    );
next_state_inferred_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(24),
      O => next_state(24)
    );
next_state_inferred_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFEE00000000"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => next_state_inferred_i_33_n_0,
      I2 => go,
      I3 => next_state_inferred_i_34_n_0,
      I4 => next_state_inferred_i_35_n_0,
      I5 => current_state(23),
      O => next_state(23)
    );
phase_tag_threshold_inferred_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF04FF00FB00"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => current_state(0),
      I2 => current_state(1),
      I3 => r_phase_tag_threshold,
      I4 => phase_tag_threshold_inferred_i_2_n_0,
      I5 => phase_tag_threshold_inferred_i_3_n_0,
      O => phase_tag_threshold
    );
phase_tag_threshold_inferred_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9F"
    )
        port map (
      I0 => r_phase_tag_threshold,
      I1 => cpl_data(112),
      I2 => done_INST_0_i_8_n_0,
      O => phase_tag_threshold_inferred_i_2_n_0
    );
phase_tag_threshold_inferred_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => r_acq_tail(4),
      I1 => r_acq_tail(3),
      I2 => r_acq_tail(0),
      I3 => r_acq_tail(1),
      I4 => r_acq_tail(2),
      I5 => r_phase_tag_threshold,
      O => phase_tag_threshold_inferred_i_3_n_0
    );
\r_acq_head_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => acq_head(0),
      Q => r_acq_head(0),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_acq_head_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => acq_head(1),
      Q => r_acq_head(1),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_acq_head_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => acq_head(2),
      Q => r_acq_head(2),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_acq_head_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => acq_head(3),
      Q => r_acq_head(3),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_acq_head_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => acq_head(4),
      Q => r_acq_head(4),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_acq_tail_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => acq_tail(0),
      Q => r_acq_tail(0),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_acq_tail_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => acq_tail(1),
      Q => r_acq_tail(1),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_acq_tail_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => acq_tail(2),
      Q => r_acq_tail(2),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_acq_tail_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => acq_tail(3),
      Q => r_acq_tail(3),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_acq_tail_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => acq_tail(4),
      Q => r_acq_tail(4),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(0),
      Q => r_counter(0),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(10),
      Q => r_counter(10),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(11),
      Q => r_counter(11),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(12),
      Q => r_counter(12),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(13),
      Q => r_counter(13),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(14),
      Q => r_counter(14),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(15),
      Q => r_counter(15),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(16),
      Q => r_counter(16),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(17),
      Q => r_counter(17),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(18),
      Q => r_counter(18),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(19),
      Q => r_counter(19),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(1),
      Q => r_counter(1),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(20),
      Q => r_counter(20),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(21),
      Q => r_counter(21),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(22),
      Q => r_counter(22),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(23),
      Q => r_counter(23),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(24),
      Q => r_counter(24),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(25),
      Q => r_counter(25),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(26),
      Q => r_counter(26),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(27),
      Q => r_counter(27),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(28),
      Q => r_counter(28),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(29),
      Q => r_counter(29),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(2),
      Q => r_counter(2),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(30),
      Q => r_counter(30),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(31),
      Q => r_counter(31),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(3),
      Q => r_counter(3),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(4),
      Q => r_counter(4),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(5),
      Q => r_counter(5),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(6),
      Q => r_counter(6),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(7),
      Q => r_counter(7),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(8),
      Q => r_counter(8),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\r_counter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => counter(9),
      Q => r_counter(9),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
r_done_reg: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => \^done\,
      Q => r_done,
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
r_num_cmds_to_wait_inferred_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(31),
      I2 => rr_num_cmds_to_wait(31),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(31)
    );
r_num_cmds_to_wait_inferred_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(22),
      I2 => rr_num_cmds_to_wait(22),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(22)
    );
r_num_cmds_to_wait_inferred_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(21),
      I2 => rr_num_cmds_to_wait(21),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(21)
    );
r_num_cmds_to_wait_inferred_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(20),
      I2 => rr_num_cmds_to_wait(20),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(20)
    );
r_num_cmds_to_wait_inferred_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(19),
      I2 => rr_num_cmds_to_wait(19),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(19)
    );
r_num_cmds_to_wait_inferred_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(18),
      I2 => rr_num_cmds_to_wait(18),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(18)
    );
r_num_cmds_to_wait_inferred_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(17),
      I2 => rr_num_cmds_to_wait(17),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(17)
    );
r_num_cmds_to_wait_inferred_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(16),
      I2 => rr_num_cmds_to_wait(16),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(16)
    );
r_num_cmds_to_wait_inferred_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(15),
      I2 => rr_num_cmds_to_wait(15),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(15)
    );
r_num_cmds_to_wait_inferred_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(14),
      I2 => rr_num_cmds_to_wait(14),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(14)
    );
r_num_cmds_to_wait_inferred_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(13),
      I2 => rr_num_cmds_to_wait(13),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(13)
    );
r_num_cmds_to_wait_inferred_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(30),
      I2 => rr_num_cmds_to_wait(30),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(30)
    );
r_num_cmds_to_wait_inferred_i_20: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(12),
      I2 => rr_num_cmds_to_wait(12),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(12)
    );
r_num_cmds_to_wait_inferred_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(11),
      I2 => rr_num_cmds_to_wait(11),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(11)
    );
r_num_cmds_to_wait_inferred_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(10),
      I2 => rr_num_cmds_to_wait(10),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(10)
    );
r_num_cmds_to_wait_inferred_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(9),
      I2 => rr_num_cmds_to_wait(9),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(9)
    );
r_num_cmds_to_wait_inferred_i_24: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(8),
      I2 => rr_num_cmds_to_wait(8),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(8)
    );
r_num_cmds_to_wait_inferred_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(7),
      I2 => rr_num_cmds_to_wait(7),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(7)
    );
r_num_cmds_to_wait_inferred_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(6),
      I2 => rr_num_cmds_to_wait(6),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(6)
    );
r_num_cmds_to_wait_inferred_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(5),
      I2 => rr_num_cmds_to_wait(5),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(5)
    );
r_num_cmds_to_wait_inferred_i_28: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(4),
      I2 => rr_num_cmds_to_wait(4),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(4)
    );
r_num_cmds_to_wait_inferred_i_29: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(3),
      I2 => rr_num_cmds_to_wait(3),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(3)
    );
r_num_cmds_to_wait_inferred_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(29),
      I2 => rr_num_cmds_to_wait(29),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(29)
    );
r_num_cmds_to_wait_inferred_i_30: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(2),
      I2 => rr_num_cmds_to_wait(2),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(2)
    );
r_num_cmds_to_wait_inferred_i_31: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(1),
      I2 => rr_num_cmds_to_wait(1),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(1)
    );
r_num_cmds_to_wait_inferred_i_32: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(0),
      I2 => rr_num_cmds_to_wait(0),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(0)
    );
r_num_cmds_to_wait_inferred_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(28),
      I2 => rr_num_cmds_to_wait(28),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(28)
    );
r_num_cmds_to_wait_inferred_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(27),
      I2 => rr_num_cmds_to_wait(27),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(27)
    );
r_num_cmds_to_wait_inferred_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(26),
      I2 => rr_num_cmds_to_wait(26),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(26)
    );
r_num_cmds_to_wait_inferred_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(25),
      I2 => rr_num_cmds_to_wait(25),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(25)
    );
r_num_cmds_to_wait_inferred_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(24),
      I2 => rr_num_cmds_to_wait(24),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(24)
    );
r_num_cmds_to_wait_inferred_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0E4F0"
    )
        port map (
      I0 => done_INST_0_i_1_n_0,
      I1 => num_cmds_to_wait(23),
      I2 => rr_num_cmds_to_wait(23),
      I3 => go,
      I4 => current_state(1),
      I5 => current_state(0),
      O => r_num_cmds_to_wait(23)
    );
r_phase_tag_threshold_reg: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => phase_tag_threshold,
      Q => r_phase_tag_threshold,
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(0),
      Q => rr_num_cmds_to_wait(0),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(10),
      Q => rr_num_cmds_to_wait(10),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(11),
      Q => rr_num_cmds_to_wait(11),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(12),
      Q => rr_num_cmds_to_wait(12),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(13),
      Q => rr_num_cmds_to_wait(13),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(14),
      Q => rr_num_cmds_to_wait(14),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(15),
      Q => rr_num_cmds_to_wait(15),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(16),
      Q => rr_num_cmds_to_wait(16),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(17),
      Q => rr_num_cmds_to_wait(17),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(18),
      Q => rr_num_cmds_to_wait(18),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(19),
      Q => rr_num_cmds_to_wait(19),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(1),
      Q => rr_num_cmds_to_wait(1),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(20),
      Q => rr_num_cmds_to_wait(20),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(21),
      Q => rr_num_cmds_to_wait(21),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(22),
      Q => rr_num_cmds_to_wait(22),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(23),
      Q => rr_num_cmds_to_wait(23),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(24),
      Q => rr_num_cmds_to_wait(24),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(25),
      Q => rr_num_cmds_to_wait(25),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(26),
      Q => rr_num_cmds_to_wait(26),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(27),
      Q => rr_num_cmds_to_wait(27),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(28),
      Q => rr_num_cmds_to_wait(28),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(29),
      Q => rr_num_cmds_to_wait(29),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(2),
      Q => rr_num_cmds_to_wait(2),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(30),
      Q => rr_num_cmds_to_wait(30),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(31),
      Q => rr_num_cmds_to_wait(31),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(3),
      Q => rr_num_cmds_to_wait(3),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(4),
      Q => rr_num_cmds_to_wait(4),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(5),
      Q => rr_num_cmds_to_wait(5),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(6),
      Q => rr_num_cmds_to_wait(6),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(7),
      Q => rr_num_cmds_to_wait(7),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(8),
      Q => rr_num_cmds_to_wait(8),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
\rr_num_cmds_to_wait_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => M_AXI_ACLK,
      CE => '1',
      D => r_num_cmds_to_wait(9),
      Q => rr_num_cmds_to_wait(9),
      R => \FSM_sequential_current_state[1]_i_1_n_0\
    );
tmp_inferred_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => r_acq_tail(2),
      I1 => r_acq_tail(0),
      I2 => r_acq_tail(1),
      I3 => r_acq_tail(3),
      I4 => r_acq_tail(4),
      O => tmp(4)
    );
tmp_inferred_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => r_acq_tail(1),
      I1 => r_acq_tail(0),
      I2 => r_acq_tail(2),
      I3 => r_acq_tail(3),
      O => tmp(3)
    );
tmp_inferred_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => r_acq_tail(0),
      I1 => r_acq_tail(1),
      I2 => r_acq_tail(2),
      O => tmp(2)
    );
tmp_inferred_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => r_acq_tail(0),
      I1 => r_acq_tail(1),
      O => tmp(1)
    );
tmp_inferred_i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => r_acq_tail(0),
      O => tmp(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL is
  port (
    queue_data : out STD_LOGIC_VECTOR ( 127 downto 0 );
    queue_wr_en : out STD_LOGIC;
    queue_addr : out STD_LOGIC_VECTOR ( 4 downto 0 );
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 1 );
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_AWLOCK : in STD_LOGIC;
    S_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWREGION : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWUSER : in STD_LOGIC_VECTOR ( 0 to 1 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_WLAST : in STD_LOGIC;
    S_AXI_WUSER : in STD_LOGIC_VECTOR ( 0 to 1 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 1 );
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BUSER : out STD_LOGIC_VECTOR ( 0 to 1 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 1 );
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_ARLOCK : in STD_LOGIC;
    S_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ARREGION : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ARUSER : in STD_LOGIC_VECTOR ( 0 to 1 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 1 );
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RLAST : out STD_LOGIC;
    S_AXI_RUSER : out STD_LOGIC_VECTOR ( 0 to 1 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC
  );
  attribute CPL_ENTRY_ADDR_WIDTH : integer;
  attribute CPL_ENTRY_ADDR_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is 5;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is 32;
  attribute C_S_AXI_ARUSER_WIDTH : integer;
  attribute C_S_AXI_ARUSER_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is 0;
  attribute C_S_AXI_AWUSER_WIDTH : integer;
  attribute C_S_AXI_AWUSER_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is 0;
  attribute C_S_AXI_BUSER_WIDTH : integer;
  attribute C_S_AXI_BUSER_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is 0;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is 128;
  attribute C_S_AXI_ID_WIDTH : integer;
  attribute C_S_AXI_ID_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is 0;
  attribute C_S_AXI_RUSER_WIDTH : integer;
  attribute C_S_AXI_RUSER_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is 0;
  attribute C_S_AXI_WUSER_WIDTH : integer;
  attribute C_S_AXI_WUSER_WIDTH of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is 0;
  attribute IDLE : integer;
  attribute IDLE of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is "CompletionQueueManagement_v2_0_S00_AXI_FULL";
  attribute RESP : integer;
  attribute RESP of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is 2;
  attribute WRITE : integer;
  attribute WRITE of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL : entity is 1;
end design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL;

architecture STRUCTURE of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL is
  signal \<const0>\ : STD_LOGIC;
  signal \FSM_onehot_current_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal axi_awlen : STD_LOGIC;
  signal current_state : STD_LOGIC_VECTOR ( 1 to 1 );
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \queue_addr[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \queue_addr[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \^queue_wr_en\ : STD_LOGIC;
  signal queue_wr_en_INST_0_i_1_n_4 : STD_LOGIC;
  signal queue_wr_en_INST_0_i_1_n_5 : STD_LOGIC;
  signal queue_wr_en_INST_0_i_1_n_6 : STD_LOGIC;
  signal queue_wr_en_INST_0_i_1_n_7 : STD_LOGIC;
  signal queue_wr_en_INST_0_i_2_n_0 : STD_LOGIC;
  signal queue_wr_en_INST_0_i_3_n_0 : STD_LOGIC;
  signal queue_wr_en_INST_0_i_4_n_0 : STD_LOGIC;
  signal queue_wr_en_INST_0_i_5_n_0 : STD_LOGIC;
  signal queue_wr_en_INST_0_i_6_n_0 : STD_LOGIC;
  signal queue_wr_en_INST_0_i_7_n_0 : STD_LOGIC;
  signal queue_wr_en_INST_0_i_8_n_0 : STD_LOGIC;
  signal queue_wr_en_INST_0_i_9_n_0 : STD_LOGIC;
  signal r_axi_awlen : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_axi_awlen[7]_i_3_n_0\ : STD_LOGIC;
  signal r_counter : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \r_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \r_counter[1]_i_1_n_0\ : STD_LOGIC;
  signal \r_counter[2]_i_1_n_0\ : STD_LOGIC;
  signal \r_counter[3]_i_1_n_0\ : STD_LOGIC;
  signal \r_counter[4]_i_1_n_0\ : STD_LOGIC;
  signal \r_counter[5]_i_1_n_0\ : STD_LOGIC;
  signal \r_counter[5]_i_2_n_0\ : STD_LOGIC;
  signal \r_counter[6]_i_1_n_0\ : STD_LOGIC;
  signal \r_counter[7]_i_1_n_0\ : STD_LOGIC;
  signal \r_counter[7]_i_2_n_0\ : STD_LOGIC;
  signal \r_counter[7]_i_3_n_0\ : STD_LOGIC;
  signal NLW_queue_wr_en_INST_0_i_1_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal NLW_queue_wr_en_INST_0_i_1_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[0]\ : label is "IDLE:001,WRITE:010,RESP:100,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[1]\ : label is "IDLE:001,WRITE:010,RESP:100,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[2]\ : label is "IDLE:001,WRITE:010,RESP:100,";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \queue_addr[0]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \queue_addr[1]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \queue_addr[2]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \queue_addr[2]_INST_0_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \queue_addr[3]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \queue_data[100]_INST_0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \queue_data[101]_INST_0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \queue_data[102]_INST_0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \queue_data[103]_INST_0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \queue_data[104]_INST_0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \queue_data[105]_INST_0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \queue_data[106]_INST_0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \queue_data[107]_INST_0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \queue_data[108]_INST_0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \queue_data[109]_INST_0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \queue_data[10]_INST_0\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \queue_data[110]_INST_0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \queue_data[111]_INST_0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \queue_data[112]_INST_0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \queue_data[113]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \queue_data[114]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \queue_data[115]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \queue_data[116]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \queue_data[117]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \queue_data[118]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \queue_data[119]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \queue_data[11]_INST_0\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \queue_data[120]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \queue_data[121]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \queue_data[122]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \queue_data[123]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \queue_data[124]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \queue_data[125]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \queue_data[126]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \queue_data[127]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \queue_data[12]_INST_0\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \queue_data[13]_INST_0\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \queue_data[14]_INST_0\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \queue_data[15]_INST_0\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \queue_data[16]_INST_0\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \queue_data[17]_INST_0\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \queue_data[18]_INST_0\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \queue_data[19]_INST_0\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \queue_data[1]_INST_0\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \queue_data[20]_INST_0\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \queue_data[21]_INST_0\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \queue_data[22]_INST_0\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \queue_data[23]_INST_0\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \queue_data[24]_INST_0\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \queue_data[25]_INST_0\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \queue_data[26]_INST_0\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \queue_data[27]_INST_0\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \queue_data[28]_INST_0\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \queue_data[29]_INST_0\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \queue_data[2]_INST_0\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \queue_data[30]_INST_0\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \queue_data[31]_INST_0\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \queue_data[32]_INST_0\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \queue_data[33]_INST_0\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \queue_data[34]_INST_0\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \queue_data[35]_INST_0\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \queue_data[36]_INST_0\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \queue_data[37]_INST_0\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \queue_data[38]_INST_0\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \queue_data[39]_INST_0\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \queue_data[3]_INST_0\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \queue_data[40]_INST_0\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \queue_data[41]_INST_0\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \queue_data[42]_INST_0\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \queue_data[43]_INST_0\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \queue_data[44]_INST_0\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \queue_data[45]_INST_0\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \queue_data[46]_INST_0\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \queue_data[47]_INST_0\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \queue_data[48]_INST_0\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \queue_data[49]_INST_0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \queue_data[4]_INST_0\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \queue_data[50]_INST_0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \queue_data[51]_INST_0\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \queue_data[52]_INST_0\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \queue_data[53]_INST_0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \queue_data[54]_INST_0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \queue_data[55]_INST_0\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \queue_data[56]_INST_0\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \queue_data[57]_INST_0\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \queue_data[58]_INST_0\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \queue_data[59]_INST_0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \queue_data[5]_INST_0\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \queue_data[60]_INST_0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \queue_data[61]_INST_0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \queue_data[62]_INST_0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \queue_data[63]_INST_0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \queue_data[64]_INST_0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \queue_data[65]_INST_0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \queue_data[66]_INST_0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \queue_data[67]_INST_0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \queue_data[68]_INST_0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \queue_data[69]_INST_0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \queue_data[6]_INST_0\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \queue_data[70]_INST_0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \queue_data[71]_INST_0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \queue_data[72]_INST_0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \queue_data[73]_INST_0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \queue_data[74]_INST_0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \queue_data[75]_INST_0\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \queue_data[76]_INST_0\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \queue_data[77]_INST_0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \queue_data[78]_INST_0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \queue_data[79]_INST_0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \queue_data[7]_INST_0\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \queue_data[80]_INST_0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \queue_data[81]_INST_0\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \queue_data[82]_INST_0\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \queue_data[83]_INST_0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \queue_data[84]_INST_0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \queue_data[85]_INST_0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \queue_data[86]_INST_0\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \queue_data[87]_INST_0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \queue_data[88]_INST_0\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \queue_data[89]_INST_0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \queue_data[8]_INST_0\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \queue_data[90]_INST_0\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \queue_data[91]_INST_0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \queue_data[92]_INST_0\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \queue_data[93]_INST_0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \queue_data[94]_INST_0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \queue_data[95]_INST_0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \queue_data[96]_INST_0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \queue_data[97]_INST_0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \queue_data[98]_INST_0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \queue_data[99]_INST_0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \queue_data[9]_INST_0\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \r_axi_awlen[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \r_axi_awlen[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \r_axi_awlen[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \r_axi_awlen[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \r_axi_awlen[6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \r_axi_awlen[7]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \r_counter[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \r_counter[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \r_counter[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \r_counter[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \r_counter[6]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \r_counter[7]_i_2\ : label is "soft_lutpair3";
begin
  S_AXI_ARREADY <= \<const0>\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_BID(0) <= \<const0>\;
  S_AXI_BID(1) <= \<const0>\;
  S_AXI_BRESP(1) <= \<const0>\;
  S_AXI_BRESP(0) <= \<const0>\;
  S_AXI_BUSER(0) <= \<const0>\;
  S_AXI_BUSER(1) <= \<const0>\;
  S_AXI_BVALID <= \^s_axi_bvalid\;
  S_AXI_RDATA(127) <= \<const0>\;
  S_AXI_RDATA(126) <= \<const0>\;
  S_AXI_RDATA(125) <= \<const0>\;
  S_AXI_RDATA(124) <= \<const0>\;
  S_AXI_RDATA(123) <= \<const0>\;
  S_AXI_RDATA(122) <= \<const0>\;
  S_AXI_RDATA(121) <= \<const0>\;
  S_AXI_RDATA(120) <= \<const0>\;
  S_AXI_RDATA(119) <= \<const0>\;
  S_AXI_RDATA(118) <= \<const0>\;
  S_AXI_RDATA(117) <= \<const0>\;
  S_AXI_RDATA(116) <= \<const0>\;
  S_AXI_RDATA(115) <= \<const0>\;
  S_AXI_RDATA(114) <= \<const0>\;
  S_AXI_RDATA(113) <= \<const0>\;
  S_AXI_RDATA(112) <= \<const0>\;
  S_AXI_RDATA(111) <= \<const0>\;
  S_AXI_RDATA(110) <= \<const0>\;
  S_AXI_RDATA(109) <= \<const0>\;
  S_AXI_RDATA(108) <= \<const0>\;
  S_AXI_RDATA(107) <= \<const0>\;
  S_AXI_RDATA(106) <= \<const0>\;
  S_AXI_RDATA(105) <= \<const0>\;
  S_AXI_RDATA(104) <= \<const0>\;
  S_AXI_RDATA(103) <= \<const0>\;
  S_AXI_RDATA(102) <= \<const0>\;
  S_AXI_RDATA(101) <= \<const0>\;
  S_AXI_RDATA(100) <= \<const0>\;
  S_AXI_RDATA(99) <= \<const0>\;
  S_AXI_RDATA(98) <= \<const0>\;
  S_AXI_RDATA(97) <= \<const0>\;
  S_AXI_RDATA(96) <= \<const0>\;
  S_AXI_RDATA(95) <= \<const0>\;
  S_AXI_RDATA(94) <= \<const0>\;
  S_AXI_RDATA(93) <= \<const0>\;
  S_AXI_RDATA(92) <= \<const0>\;
  S_AXI_RDATA(91) <= \<const0>\;
  S_AXI_RDATA(90) <= \<const0>\;
  S_AXI_RDATA(89) <= \<const0>\;
  S_AXI_RDATA(88) <= \<const0>\;
  S_AXI_RDATA(87) <= \<const0>\;
  S_AXI_RDATA(86) <= \<const0>\;
  S_AXI_RDATA(85) <= \<const0>\;
  S_AXI_RDATA(84) <= \<const0>\;
  S_AXI_RDATA(83) <= \<const0>\;
  S_AXI_RDATA(82) <= \<const0>\;
  S_AXI_RDATA(81) <= \<const0>\;
  S_AXI_RDATA(80) <= \<const0>\;
  S_AXI_RDATA(79) <= \<const0>\;
  S_AXI_RDATA(78) <= \<const0>\;
  S_AXI_RDATA(77) <= \<const0>\;
  S_AXI_RDATA(76) <= \<const0>\;
  S_AXI_RDATA(75) <= \<const0>\;
  S_AXI_RDATA(74) <= \<const0>\;
  S_AXI_RDATA(73) <= \<const0>\;
  S_AXI_RDATA(72) <= \<const0>\;
  S_AXI_RDATA(71) <= \<const0>\;
  S_AXI_RDATA(70) <= \<const0>\;
  S_AXI_RDATA(69) <= \<const0>\;
  S_AXI_RDATA(68) <= \<const0>\;
  S_AXI_RDATA(67) <= \<const0>\;
  S_AXI_RDATA(66) <= \<const0>\;
  S_AXI_RDATA(65) <= \<const0>\;
  S_AXI_RDATA(64) <= \<const0>\;
  S_AXI_RDATA(63) <= \<const0>\;
  S_AXI_RDATA(62) <= \<const0>\;
  S_AXI_RDATA(61) <= \<const0>\;
  S_AXI_RDATA(60) <= \<const0>\;
  S_AXI_RDATA(59) <= \<const0>\;
  S_AXI_RDATA(58) <= \<const0>\;
  S_AXI_RDATA(57) <= \<const0>\;
  S_AXI_RDATA(56) <= \<const0>\;
  S_AXI_RDATA(55) <= \<const0>\;
  S_AXI_RDATA(54) <= \<const0>\;
  S_AXI_RDATA(53) <= \<const0>\;
  S_AXI_RDATA(52) <= \<const0>\;
  S_AXI_RDATA(51) <= \<const0>\;
  S_AXI_RDATA(50) <= \<const0>\;
  S_AXI_RDATA(49) <= \<const0>\;
  S_AXI_RDATA(48) <= \<const0>\;
  S_AXI_RDATA(47) <= \<const0>\;
  S_AXI_RDATA(46) <= \<const0>\;
  S_AXI_RDATA(45) <= \<const0>\;
  S_AXI_RDATA(44) <= \<const0>\;
  S_AXI_RDATA(43) <= \<const0>\;
  S_AXI_RDATA(42) <= \<const0>\;
  S_AXI_RDATA(41) <= \<const0>\;
  S_AXI_RDATA(40) <= \<const0>\;
  S_AXI_RDATA(39) <= \<const0>\;
  S_AXI_RDATA(38) <= \<const0>\;
  S_AXI_RDATA(37) <= \<const0>\;
  S_AXI_RDATA(36) <= \<const0>\;
  S_AXI_RDATA(35) <= \<const0>\;
  S_AXI_RDATA(34) <= \<const0>\;
  S_AXI_RDATA(33) <= \<const0>\;
  S_AXI_RDATA(32) <= \<const0>\;
  S_AXI_RDATA(31) <= \<const0>\;
  S_AXI_RDATA(30) <= \<const0>\;
  S_AXI_RDATA(29) <= \<const0>\;
  S_AXI_RDATA(28) <= \<const0>\;
  S_AXI_RDATA(27) <= \<const0>\;
  S_AXI_RDATA(26) <= \<const0>\;
  S_AXI_RDATA(25) <= \<const0>\;
  S_AXI_RDATA(24) <= \<const0>\;
  S_AXI_RDATA(23) <= \<const0>\;
  S_AXI_RDATA(22) <= \<const0>\;
  S_AXI_RDATA(21) <= \<const0>\;
  S_AXI_RDATA(20) <= \<const0>\;
  S_AXI_RDATA(19) <= \<const0>\;
  S_AXI_RDATA(18) <= \<const0>\;
  S_AXI_RDATA(17) <= \<const0>\;
  S_AXI_RDATA(16) <= \<const0>\;
  S_AXI_RDATA(15) <= \<const0>\;
  S_AXI_RDATA(14) <= \<const0>\;
  S_AXI_RDATA(13) <= \<const0>\;
  S_AXI_RDATA(12) <= \<const0>\;
  S_AXI_RDATA(11) <= \<const0>\;
  S_AXI_RDATA(10) <= \<const0>\;
  S_AXI_RDATA(9) <= \<const0>\;
  S_AXI_RDATA(8) <= \<const0>\;
  S_AXI_RDATA(7) <= \<const0>\;
  S_AXI_RDATA(6) <= \<const0>\;
  S_AXI_RDATA(5) <= \<const0>\;
  S_AXI_RDATA(4) <= \<const0>\;
  S_AXI_RDATA(3) <= \<const0>\;
  S_AXI_RDATA(2) <= \<const0>\;
  S_AXI_RDATA(1) <= \<const0>\;
  S_AXI_RDATA(0) <= \<const0>\;
  S_AXI_RID(0) <= \<const0>\;
  S_AXI_RID(1) <= \<const0>\;
  S_AXI_RLAST <= \<const0>\;
  S_AXI_RRESP(1) <= \<const0>\;
  S_AXI_RRESP(0) <= \<const0>\;
  S_AXI_RUSER(0) <= \<const0>\;
  S_AXI_RUSER(1) <= \<const0>\;
  S_AXI_RVALID <= \<const0>\;
  queue_wr_en <= \^queue_wr_en\;
\FSM_onehot_current_state[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXI_ARESETN,
      O => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\FSM_onehot_current_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF88F888F888F8"
    )
        port map (
      I0 => S_AXI_AWVALID,
      I1 => \^s_axi_awready\,
      I2 => current_state(1),
      I3 => queue_wr_en_INST_0_i_1_n_4,
      I4 => \^s_axi_bvalid\,
      I5 => S_AXI_BREADY,
      O => \FSM_onehot_current_state[0]_i_2_n_0\
    );
\FSM_onehot_current_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => S_AXI_ACLK,
      CE => \FSM_onehot_current_state[0]_i_2_n_0\,
      D => \^s_axi_bvalid\,
      Q => \^s_axi_awready\,
      S => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\FSM_onehot_current_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_AXI_ACLK,
      CE => \FSM_onehot_current_state[0]_i_2_n_0\,
      D => \^s_axi_awready\,
      Q => current_state(1),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\FSM_onehot_current_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_AXI_ACLK,
      CE => \FSM_onehot_current_state[0]_i_2_n_0\,
      D => current_state(1),
      Q => \^s_axi_bvalid\,
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
S_AXI_WREADY_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => current_state(1),
      I1 => queue_wr_en_INST_0_i_1_n_4,
      O => S_AXI_WREADY
    );
\queue_addr[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => p_0_in(0),
      I2 => r_counter(0),
      O => queue_addr(0)
    );
\queue_addr[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"82282828"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => r_counter(1),
      I2 => p_0_in(1),
      I3 => r_counter(0),
      I4 => p_0_in(0),
      O => queue_addr(1)
    );
\queue_addr[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8448"
    )
        port map (
      I0 => \queue_addr[2]_INST_0_i_1_n_0\,
      I1 => \^queue_wr_en\,
      I2 => r_counter(2),
      I3 => p_0_in(2),
      O => queue_addr(2)
    );
\queue_addr[2]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA80"
    )
        port map (
      I0 => r_counter(1),
      I1 => p_0_in(0),
      I2 => r_counter(0),
      I3 => p_0_in(1),
      O => \queue_addr[2]_INST_0_i_1_n_0\
    );
\queue_addr[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8448"
    )
        port map (
      I0 => \queue_addr[4]_INST_0_i_1_n_0\,
      I1 => \^queue_wr_en\,
      I2 => r_counter(3),
      I3 => p_0_in(3),
      O => queue_addr(3)
    );
\queue_addr[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E80017001700E800"
    )
        port map (
      I0 => \queue_addr[4]_INST_0_i_1_n_0\,
      I1 => r_counter(3),
      I2 => p_0_in(3),
      I3 => \^queue_wr_en\,
      I4 => r_counter(4),
      I5 => p_0_in(4),
      O => queue_addr(4)
    );
\queue_addr[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEA80EA800000"
    )
        port map (
      I0 => p_0_in(1),
      I1 => r_counter(0),
      I2 => p_0_in(0),
      I3 => r_counter(1),
      I4 => r_counter(2),
      I5 => p_0_in(2),
      O => \queue_addr[4]_INST_0_i_1_n_0\
    );
\queue_data[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(0),
      O => queue_data(0)
    );
\queue_data[100]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(100),
      O => queue_data(100)
    );
\queue_data[101]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(101),
      O => queue_data(101)
    );
\queue_data[102]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(102),
      O => queue_data(102)
    );
\queue_data[103]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(103),
      O => queue_data(103)
    );
\queue_data[104]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(104),
      O => queue_data(104)
    );
\queue_data[105]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(105),
      O => queue_data(105)
    );
\queue_data[106]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(106),
      O => queue_data(106)
    );
\queue_data[107]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(107),
      O => queue_data(107)
    );
\queue_data[108]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(108),
      O => queue_data(108)
    );
\queue_data[109]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(109),
      O => queue_data(109)
    );
\queue_data[10]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(10),
      O => queue_data(10)
    );
\queue_data[110]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(110),
      O => queue_data(110)
    );
\queue_data[111]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(111),
      O => queue_data(111)
    );
\queue_data[112]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(112),
      O => queue_data(112)
    );
\queue_data[113]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(113),
      O => queue_data(113)
    );
\queue_data[114]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(114),
      O => queue_data(114)
    );
\queue_data[115]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(115),
      O => queue_data(115)
    );
\queue_data[116]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(116),
      O => queue_data(116)
    );
\queue_data[117]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(117),
      O => queue_data(117)
    );
\queue_data[118]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(118),
      O => queue_data(118)
    );
\queue_data[119]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(119),
      O => queue_data(119)
    );
\queue_data[11]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(11),
      O => queue_data(11)
    );
\queue_data[120]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(120),
      O => queue_data(120)
    );
\queue_data[121]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(121),
      O => queue_data(121)
    );
\queue_data[122]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(122),
      O => queue_data(122)
    );
\queue_data[123]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(123),
      O => queue_data(123)
    );
\queue_data[124]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(124),
      O => queue_data(124)
    );
\queue_data[125]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(125),
      O => queue_data(125)
    );
\queue_data[126]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(126),
      O => queue_data(126)
    );
\queue_data[127]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(127),
      O => queue_data(127)
    );
\queue_data[12]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(12),
      O => queue_data(12)
    );
\queue_data[13]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(13),
      O => queue_data(13)
    );
\queue_data[14]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(14),
      O => queue_data(14)
    );
\queue_data[15]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(15),
      O => queue_data(15)
    );
\queue_data[16]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(16),
      O => queue_data(16)
    );
\queue_data[17]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(17),
      O => queue_data(17)
    );
\queue_data[18]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(18),
      O => queue_data(18)
    );
\queue_data[19]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(19),
      O => queue_data(19)
    );
\queue_data[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(1),
      O => queue_data(1)
    );
\queue_data[20]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(20),
      O => queue_data(20)
    );
\queue_data[21]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(21),
      O => queue_data(21)
    );
\queue_data[22]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(22),
      O => queue_data(22)
    );
\queue_data[23]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(23),
      O => queue_data(23)
    );
\queue_data[24]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(24),
      O => queue_data(24)
    );
\queue_data[25]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(25),
      O => queue_data(25)
    );
\queue_data[26]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(26),
      O => queue_data(26)
    );
\queue_data[27]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(27),
      O => queue_data(27)
    );
\queue_data[28]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(28),
      O => queue_data(28)
    );
\queue_data[29]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(29),
      O => queue_data(29)
    );
\queue_data[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(2),
      O => queue_data(2)
    );
\queue_data[30]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(30),
      O => queue_data(30)
    );
\queue_data[31]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(31),
      O => queue_data(31)
    );
\queue_data[32]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(32),
      O => queue_data(32)
    );
\queue_data[33]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(33),
      O => queue_data(33)
    );
\queue_data[34]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(34),
      O => queue_data(34)
    );
\queue_data[35]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(35),
      O => queue_data(35)
    );
\queue_data[36]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(36),
      O => queue_data(36)
    );
\queue_data[37]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(37),
      O => queue_data(37)
    );
\queue_data[38]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(38),
      O => queue_data(38)
    );
\queue_data[39]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(39),
      O => queue_data(39)
    );
\queue_data[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(3),
      O => queue_data(3)
    );
\queue_data[40]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(40),
      O => queue_data(40)
    );
\queue_data[41]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(41),
      O => queue_data(41)
    );
\queue_data[42]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(42),
      O => queue_data(42)
    );
\queue_data[43]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(43),
      O => queue_data(43)
    );
\queue_data[44]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(44),
      O => queue_data(44)
    );
\queue_data[45]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(45),
      O => queue_data(45)
    );
\queue_data[46]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(46),
      O => queue_data(46)
    );
\queue_data[47]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(47),
      O => queue_data(47)
    );
\queue_data[48]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(48),
      O => queue_data(48)
    );
\queue_data[49]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(49),
      O => queue_data(49)
    );
\queue_data[4]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(4),
      O => queue_data(4)
    );
\queue_data[50]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(50),
      O => queue_data(50)
    );
\queue_data[51]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(51),
      O => queue_data(51)
    );
\queue_data[52]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(52),
      O => queue_data(52)
    );
\queue_data[53]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(53),
      O => queue_data(53)
    );
\queue_data[54]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(54),
      O => queue_data(54)
    );
\queue_data[55]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(55),
      O => queue_data(55)
    );
\queue_data[56]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(56),
      O => queue_data(56)
    );
\queue_data[57]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(57),
      O => queue_data(57)
    );
\queue_data[58]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(58),
      O => queue_data(58)
    );
\queue_data[59]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(59),
      O => queue_data(59)
    );
\queue_data[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(5),
      O => queue_data(5)
    );
\queue_data[60]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(60),
      O => queue_data(60)
    );
\queue_data[61]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(61),
      O => queue_data(61)
    );
\queue_data[62]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(62),
      O => queue_data(62)
    );
\queue_data[63]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(63),
      O => queue_data(63)
    );
\queue_data[64]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(64),
      O => queue_data(64)
    );
\queue_data[65]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(65),
      O => queue_data(65)
    );
\queue_data[66]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(66),
      O => queue_data(66)
    );
\queue_data[67]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(67),
      O => queue_data(67)
    );
\queue_data[68]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(68),
      O => queue_data(68)
    );
\queue_data[69]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(69),
      O => queue_data(69)
    );
\queue_data[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(6),
      O => queue_data(6)
    );
\queue_data[70]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(70),
      O => queue_data(70)
    );
\queue_data[71]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(71),
      O => queue_data(71)
    );
\queue_data[72]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(72),
      O => queue_data(72)
    );
\queue_data[73]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(73),
      O => queue_data(73)
    );
\queue_data[74]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(74),
      O => queue_data(74)
    );
\queue_data[75]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(75),
      O => queue_data(75)
    );
\queue_data[76]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(76),
      O => queue_data(76)
    );
\queue_data[77]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(77),
      O => queue_data(77)
    );
\queue_data[78]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(78),
      O => queue_data(78)
    );
\queue_data[79]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(79),
      O => queue_data(79)
    );
\queue_data[7]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(7),
      O => queue_data(7)
    );
\queue_data[80]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(80),
      O => queue_data(80)
    );
\queue_data[81]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(81),
      O => queue_data(81)
    );
\queue_data[82]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(82),
      O => queue_data(82)
    );
\queue_data[83]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(83),
      O => queue_data(83)
    );
\queue_data[84]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(84),
      O => queue_data(84)
    );
\queue_data[85]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(85),
      O => queue_data(85)
    );
\queue_data[86]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(86),
      O => queue_data(86)
    );
\queue_data[87]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(87),
      O => queue_data(87)
    );
\queue_data[88]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(88),
      O => queue_data(88)
    );
\queue_data[89]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(89),
      O => queue_data(89)
    );
\queue_data[8]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(8),
      O => queue_data(8)
    );
\queue_data[90]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(90),
      O => queue_data(90)
    );
\queue_data[91]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(91),
      O => queue_data(91)
    );
\queue_data[92]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(92),
      O => queue_data(92)
    );
\queue_data[93]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(93),
      O => queue_data(93)
    );
\queue_data[94]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(94),
      O => queue_data(94)
    );
\queue_data[95]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(95),
      O => queue_data(95)
    );
\queue_data[96]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(96),
      O => queue_data(96)
    );
\queue_data[97]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(97),
      O => queue_data(97)
    );
\queue_data[98]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(98),
      O => queue_data(98)
    );
\queue_data[99]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(99),
      O => queue_data(99)
    );
\queue_data[9]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^queue_wr_en\,
      I1 => S_AXI_WDATA(9),
      O => queue_data(9)
    );
queue_wr_en_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => queue_wr_en_INST_0_i_1_n_4,
      I1 => current_state(1),
      I2 => S_AXI_WVALID,
      O => \^queue_wr_en\
    );
queue_wr_en_INST_0_i_1: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7 downto 4) => NLW_queue_wr_en_INST_0_i_1_CO_UNCONNECTED(7 downto 4),
      CO(3) => queue_wr_en_INST_0_i_1_n_4,
      CO(2) => queue_wr_en_INST_0_i_1_n_5,
      CO(1) => queue_wr_en_INST_0_i_1_n_6,
      CO(0) => queue_wr_en_INST_0_i_1_n_7,
      DI(7 downto 4) => B"0000",
      DI(3) => queue_wr_en_INST_0_i_2_n_0,
      DI(2) => queue_wr_en_INST_0_i_3_n_0,
      DI(1) => queue_wr_en_INST_0_i_4_n_0,
      DI(0) => queue_wr_en_INST_0_i_5_n_0,
      O(7 downto 0) => NLW_queue_wr_en_INST_0_i_1_O_UNCONNECTED(7 downto 0),
      S(7 downto 4) => B"0000",
      S(3) => queue_wr_en_INST_0_i_6_n_0,
      S(2) => queue_wr_en_INST_0_i_7_n_0,
      S(1) => queue_wr_en_INST_0_i_8_n_0,
      S(0) => queue_wr_en_INST_0_i_9_n_0
    );
queue_wr_en_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => r_axi_awlen(6),
      I1 => r_counter(6),
      I2 => r_counter(7),
      I3 => r_axi_awlen(7),
      O => queue_wr_en_INST_0_i_2_n_0
    );
queue_wr_en_INST_0_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => r_axi_awlen(4),
      I1 => r_counter(4),
      I2 => r_counter(5),
      I3 => r_axi_awlen(5),
      O => queue_wr_en_INST_0_i_3_n_0
    );
queue_wr_en_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => r_axi_awlen(2),
      I1 => r_counter(2),
      I2 => r_counter(3),
      I3 => r_axi_awlen(3),
      O => queue_wr_en_INST_0_i_4_n_0
    );
queue_wr_en_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => r_axi_awlen(0),
      I1 => r_counter(0),
      I2 => r_counter(1),
      I3 => r_axi_awlen(1),
      O => queue_wr_en_INST_0_i_5_n_0
    );
queue_wr_en_INST_0_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(7),
      I1 => r_axi_awlen(7),
      I2 => r_counter(6),
      I3 => r_axi_awlen(6),
      O => queue_wr_en_INST_0_i_6_n_0
    );
queue_wr_en_INST_0_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(5),
      I1 => r_axi_awlen(5),
      I2 => r_counter(4),
      I3 => r_axi_awlen(4),
      O => queue_wr_en_INST_0_i_7_n_0
    );
queue_wr_en_INST_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(3),
      I1 => r_axi_awlen(3),
      I2 => r_counter(2),
      I3 => r_axi_awlen(2),
      O => queue_wr_en_INST_0_i_8_n_0
    );
queue_wr_en_INST_0_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => r_counter(1),
      I1 => r_axi_awlen(1),
      I2 => r_counter(0),
      I3 => r_axi_awlen(0),
      O => queue_wr_en_INST_0_i_9_n_0
    );
\r_axi_awaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => S_AXI_AWADDR(4),
      Q => p_0_in(0),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_axi_awaddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => S_AXI_AWADDR(5),
      Q => p_0_in(1),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_axi_awaddr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => S_AXI_AWADDR(6),
      Q => p_0_in(2),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_axi_awaddr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => S_AXI_AWADDR(7),
      Q => p_0_in(3),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_axi_awaddr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => S_AXI_AWADDR(8),
      Q => p_0_in(4),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_axi_awlen[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXI_AWLEN(0),
      O => p_1_in(0)
    );
\r_axi_awlen[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => S_AXI_AWLEN(0),
      I1 => S_AXI_AWLEN(1),
      O => p_1_in(1)
    );
\r_axi_awlen[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => S_AXI_AWLEN(0),
      I1 => S_AXI_AWLEN(1),
      I2 => S_AXI_AWLEN(2),
      O => p_1_in(2)
    );
\r_axi_awlen[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => S_AXI_AWLEN(1),
      I1 => S_AXI_AWLEN(0),
      I2 => S_AXI_AWLEN(2),
      I3 => S_AXI_AWLEN(3),
      O => p_1_in(3)
    );
\r_axi_awlen[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => S_AXI_AWLEN(2),
      I1 => S_AXI_AWLEN(0),
      I2 => S_AXI_AWLEN(1),
      I3 => S_AXI_AWLEN(3),
      I4 => S_AXI_AWLEN(4),
      O => p_1_in(4)
    );
\r_axi_awlen[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => S_AXI_AWLEN(3),
      I1 => S_AXI_AWLEN(1),
      I2 => S_AXI_AWLEN(0),
      I3 => S_AXI_AWLEN(2),
      I4 => S_AXI_AWLEN(4),
      I5 => S_AXI_AWLEN(5),
      O => p_1_in(5)
    );
\r_axi_awlen[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \r_axi_awlen[7]_i_3_n_0\,
      I1 => S_AXI_AWLEN(6),
      O => p_1_in(6)
    );
\r_axi_awlen[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => S_AXI_AWVALID,
      O => axi_awlen
    );
\r_axi_awlen[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \r_axi_awlen[7]_i_3_n_0\,
      I1 => S_AXI_AWLEN(6),
      I2 => S_AXI_AWLEN(7),
      O => p_1_in(7)
    );
\r_axi_awlen[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => S_AXI_AWLEN(5),
      I1 => S_AXI_AWLEN(3),
      I2 => S_AXI_AWLEN(1),
      I3 => S_AXI_AWLEN(0),
      I4 => S_AXI_AWLEN(2),
      I5 => S_AXI_AWLEN(4),
      O => \r_axi_awlen[7]_i_3_n_0\
    );
\r_axi_awlen_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => p_1_in(0),
      Q => r_axi_awlen(0),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_axi_awlen_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => p_1_in(1),
      Q => r_axi_awlen(1),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_axi_awlen_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => p_1_in(2),
      Q => r_axi_awlen(2),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_axi_awlen_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => p_1_in(3),
      Q => r_axi_awlen(3),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_axi_awlen_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => p_1_in(4),
      Q => r_axi_awlen(4),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_axi_awlen_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => p_1_in(5),
      Q => r_axi_awlen(5),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_axi_awlen_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => p_1_in(6),
      Q => r_axi_awlen(6),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_axi_awlen_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awlen,
      D => p_1_in(7),
      Q => r_axi_awlen(7),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_counter[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => current_state(1),
      I1 => r_counter(0),
      O => \r_counter[0]_i_1_n_0\
    );
\r_counter[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => r_counter(0),
      I1 => current_state(1),
      I2 => r_counter(1),
      O => \r_counter[1]_i_1_n_0\
    );
\r_counter[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => r_counter(0),
      I1 => r_counter(1),
      I2 => current_state(1),
      I3 => r_counter(2),
      O => \r_counter[2]_i_1_n_0\
    );
\r_counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F008000"
    )
        port map (
      I0 => r_counter(2),
      I1 => r_counter(1),
      I2 => r_counter(0),
      I3 => current_state(1),
      I4 => r_counter(3),
      O => \r_counter[3]_i_1_n_0\
    );
\r_counter[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => r_counter(0),
      I1 => r_counter(1),
      I2 => r_counter(2),
      I3 => r_counter(3),
      I4 => current_state(1),
      I5 => r_counter(4),
      O => \r_counter[4]_i_1_n_0\
    );
\r_counter[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7F000000800000"
    )
        port map (
      I0 => r_counter(4),
      I1 => r_counter(3),
      I2 => r_counter(2),
      I3 => \r_counter[5]_i_2_n_0\,
      I4 => current_state(1),
      I5 => r_counter(5),
      O => \r_counter[5]_i_1_n_0\
    );
\r_counter[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => r_counter(0),
      I1 => r_counter(1),
      O => \r_counter[5]_i_2_n_0\
    );
\r_counter[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"84"
    )
        port map (
      I0 => \r_counter[7]_i_3_n_0\,
      I1 => current_state(1),
      I2 => r_counter(6),
      O => \r_counter[6]_i_1_n_0\
    );
\r_counter[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => S_AXI_AWVALID,
      I1 => \^s_axi_awready\,
      I2 => \^queue_wr_en\,
      O => \r_counter[7]_i_1_n_0\
    );
\r_counter[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B040"
    )
        port map (
      I0 => \r_counter[7]_i_3_n_0\,
      I1 => r_counter(6),
      I2 => current_state(1),
      I3 => r_counter(7),
      O => \r_counter[7]_i_2_n_0\
    );
\r_counter[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => r_counter(0),
      I1 => r_counter(1),
      I2 => r_counter(2),
      I3 => r_counter(3),
      I4 => r_counter(4),
      I5 => r_counter(5),
      O => \r_counter[7]_i_3_n_0\
    );
\r_counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \r_counter[7]_i_1_n_0\,
      D => \r_counter[0]_i_1_n_0\,
      Q => r_counter(0),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \r_counter[7]_i_1_n_0\,
      D => \r_counter[1]_i_1_n_0\,
      Q => r_counter(1),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \r_counter[7]_i_1_n_0\,
      D => \r_counter[2]_i_1_n_0\,
      Q => r_counter(2),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \r_counter[7]_i_1_n_0\,
      D => \r_counter[3]_i_1_n_0\,
      Q => r_counter(3),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \r_counter[7]_i_1_n_0\,
      D => \r_counter[4]_i_1_n_0\,
      Q => r_counter(4),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \r_counter[7]_i_1_n_0\,
      D => \r_counter[5]_i_1_n_0\,
      Q => r_counter(5),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \r_counter[7]_i_1_n_0\,
      D => \r_counter[6]_i_1_n_0\,
      Q => r_counter(6),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\r_counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \r_counter[7]_i_1_n_0\,
      D => \r_counter[7]_i_2_n_0\,
      Q => r_counter(7),
      R => \FSM_onehot_current_state[0]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_CompletionQueueManag_2_0_xpm_memory_base is
  port (
    sleep : in STD_LOGIC;
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 4 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 127 downto 0 );
    injectsbiterra : in STD_LOGIC;
    injectdbiterra : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 127 downto 0 );
    sbiterra : out STD_LOGIC;
    dbiterra : out STD_LOGIC;
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 4 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 127 downto 0 );
    injectsbiterrb : in STD_LOGIC;
    injectdbiterrb : in STD_LOGIC;
    doutb : out STD_LOGIC_VECTOR ( 127 downto 0 );
    sbiterrb : out STD_LOGIC;
    dbiterrb : out STD_LOGIC
  );
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 5;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 5;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute CLOCKING_MODE : integer;
  attribute CLOCKING_MODE of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 1;
  attribute ECC_MODE : integer;
  attribute ECC_MODE of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute MAX_NUM_CHAR : integer;
  attribute MAX_NUM_CHAR of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "true";
  attribute MEMORY_PRIMITIVE : integer;
  attribute MEMORY_PRIMITIVE of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 2;
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 4096;
  attribute MEMORY_TYPE : integer;
  attribute MEMORY_TYPE of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 1;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute NUM_CHAR_LOC : integer;
  attribute NUM_CHAR_LOC of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "xpm_memory_base";
  attribute P_ECC_MODE : string;
  attribute P_ECC_MODE of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "no_ecc";
  attribute P_ENABLE_BYTE_WRITE_A : integer;
  attribute P_ENABLE_BYTE_WRITE_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute P_ENABLE_BYTE_WRITE_B : integer;
  attribute P_ENABLE_BYTE_WRITE_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute P_MAX_DEPTH_DATA : integer;
  attribute P_MAX_DEPTH_DATA of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 32;
  attribute P_MEMORY_OPT : string;
  attribute P_MEMORY_OPT of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "yes";
  attribute P_MEMORY_PRIMITIVE : string;
  attribute P_MEMORY_PRIMITIVE of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "block";
  attribute P_MIN_WIDTH_DATA : integer;
  attribute P_MIN_WIDTH_DATA of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute P_MIN_WIDTH_DATA_A : integer;
  attribute P_MIN_WIDTH_DATA_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute P_MIN_WIDTH_DATA_B : integer;
  attribute P_MIN_WIDTH_DATA_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute P_MIN_WIDTH_DATA_ECC : integer;
  attribute P_MIN_WIDTH_DATA_ECC of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute P_MIN_WIDTH_DATA_LDW : integer;
  attribute P_MIN_WIDTH_DATA_LDW of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 4;
  attribute P_MIN_WIDTH_DATA_SHFT : integer;
  attribute P_MIN_WIDTH_DATA_SHFT of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute P_NUM_COLS_WRITE_A : integer;
  attribute P_NUM_COLS_WRITE_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 1;
  attribute P_NUM_COLS_WRITE_B : integer;
  attribute P_NUM_COLS_WRITE_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_READ_A : integer;
  attribute P_NUM_ROWS_READ_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_READ_B : integer;
  attribute P_NUM_ROWS_READ_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_WRITE_A : integer;
  attribute P_NUM_ROWS_WRITE_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_WRITE_B : integer;
  attribute P_NUM_ROWS_WRITE_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 1;
  attribute P_SDP_WRITE_MODE : string;
  attribute P_SDP_WRITE_MODE of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "no";
  attribute P_WIDTH_ADDR_LSB_READ_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_READ_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_READ_A : integer;
  attribute P_WIDTH_ADDR_READ_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 5;
  attribute P_WIDTH_ADDR_READ_B : integer;
  attribute P_WIDTH_ADDR_READ_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 5;
  attribute P_WIDTH_ADDR_WRITE_A : integer;
  attribute P_WIDTH_ADDR_WRITE_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 5;
  attribute P_WIDTH_ADDR_WRITE_B : integer;
  attribute P_WIDTH_ADDR_WRITE_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 5;
  attribute P_WIDTH_COL_WRITE_A : integer;
  attribute P_WIDTH_COL_WRITE_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute P_WIDTH_COL_WRITE_B : integer;
  attribute P_WIDTH_COL_WRITE_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 2;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 1;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "0";
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "0";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "SYNC";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 0;
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute WRITE_MODE_A : integer;
  attribute WRITE_MODE_A of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 2;
  attribute WRITE_MODE_B : integer;
  attribute WRITE_MODE_B of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 2;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is "TRUE";
  attribute rsta_loop_iter : integer;
  attribute rsta_loop_iter of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
  attribute rstb_loop_iter : integer;
  attribute rstb_loop_iter of design_1_CompletionQueueManag_2_0_xpm_memory_base : entity is 128;
end design_1_CompletionQueueManag_2_0_xpm_memory_base;

architecture STRUCTURE of design_1_CompletionQueueManag_2_0_xpm_memory_base is
  signal \<const0>\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_1_i_1_n_0\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASOUTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASOUTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASOUTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASOUTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 24 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute \MEM.PORTA.ADDRESS_BEGIN\ : integer;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ : integer;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 511;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is "p8_d64";
  attribute \MEM.PORTA.DATA_LSB\ : integer;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ : integer;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 71;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ : integer;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ : integer;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 511;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is "p8_d64";
  attribute \MEM.PORTB.DATA_LSB\ : integer;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ : integer;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 71;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 4096;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is "gen_wr_a.gen_word_narrow.mem";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 511;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 71;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 511;
  attribute ram_offset : integer;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_0\ : label is 71;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 511;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is "p0_d56";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 72;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 127;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 511;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is "p0_d56";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 72;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 127;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 4096;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is "gen_wr_a.gen_word_narrow.mem";
  attribute bram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 0;
  attribute bram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 511;
  attribute bram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 72;
  attribute bram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 127;
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 511;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 72;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_1\ : label is 127;
begin
  dbiterra <= \<const0>\;
  dbiterrb <= \<const0>\;
  douta(127) <= \<const0>\;
  douta(126) <= \<const0>\;
  douta(125) <= \<const0>\;
  douta(124) <= \<const0>\;
  douta(123) <= \<const0>\;
  douta(122) <= \<const0>\;
  douta(121) <= \<const0>\;
  douta(120) <= \<const0>\;
  douta(119) <= \<const0>\;
  douta(118) <= \<const0>\;
  douta(117) <= \<const0>\;
  douta(116) <= \<const0>\;
  douta(115) <= \<const0>\;
  douta(114) <= \<const0>\;
  douta(113) <= \<const0>\;
  douta(112) <= \<const0>\;
  douta(111) <= \<const0>\;
  douta(110) <= \<const0>\;
  douta(109) <= \<const0>\;
  douta(108) <= \<const0>\;
  douta(107) <= \<const0>\;
  douta(106) <= \<const0>\;
  douta(105) <= \<const0>\;
  douta(104) <= \<const0>\;
  douta(103) <= \<const0>\;
  douta(102) <= \<const0>\;
  douta(101) <= \<const0>\;
  douta(100) <= \<const0>\;
  douta(99) <= \<const0>\;
  douta(98) <= \<const0>\;
  douta(97) <= \<const0>\;
  douta(96) <= \<const0>\;
  douta(95) <= \<const0>\;
  douta(94) <= \<const0>\;
  douta(93) <= \<const0>\;
  douta(92) <= \<const0>\;
  douta(91) <= \<const0>\;
  douta(90) <= \<const0>\;
  douta(89) <= \<const0>\;
  douta(88) <= \<const0>\;
  douta(87) <= \<const0>\;
  douta(86) <= \<const0>\;
  douta(85) <= \<const0>\;
  douta(84) <= \<const0>\;
  douta(83) <= \<const0>\;
  douta(82) <= \<const0>\;
  douta(81) <= \<const0>\;
  douta(80) <= \<const0>\;
  douta(79) <= \<const0>\;
  douta(78) <= \<const0>\;
  douta(77) <= \<const0>\;
  douta(76) <= \<const0>\;
  douta(75) <= \<const0>\;
  douta(74) <= \<const0>\;
  douta(73) <= \<const0>\;
  douta(72) <= \<const0>\;
  douta(71) <= \<const0>\;
  douta(70) <= \<const0>\;
  douta(69) <= \<const0>\;
  douta(68) <= \<const0>\;
  douta(67) <= \<const0>\;
  douta(66) <= \<const0>\;
  douta(65) <= \<const0>\;
  douta(64) <= \<const0>\;
  douta(63) <= \<const0>\;
  douta(62) <= \<const0>\;
  douta(61) <= \<const0>\;
  douta(60) <= \<const0>\;
  douta(59) <= \<const0>\;
  douta(58) <= \<const0>\;
  douta(57) <= \<const0>\;
  douta(56) <= \<const0>\;
  douta(55) <= \<const0>\;
  douta(54) <= \<const0>\;
  douta(53) <= \<const0>\;
  douta(52) <= \<const0>\;
  douta(51) <= \<const0>\;
  douta(50) <= \<const0>\;
  douta(49) <= \<const0>\;
  douta(48) <= \<const0>\;
  douta(47) <= \<const0>\;
  douta(46) <= \<const0>\;
  douta(45) <= \<const0>\;
  douta(44) <= \<const0>\;
  douta(43) <= \<const0>\;
  douta(42) <= \<const0>\;
  douta(41) <= \<const0>\;
  douta(40) <= \<const0>\;
  douta(39) <= \<const0>\;
  douta(38) <= \<const0>\;
  douta(37) <= \<const0>\;
  douta(36) <= \<const0>\;
  douta(35) <= \<const0>\;
  douta(34) <= \<const0>\;
  douta(33) <= \<const0>\;
  douta(32) <= \<const0>\;
  douta(31) <= \<const0>\;
  douta(30) <= \<const0>\;
  douta(29) <= \<const0>\;
  douta(28) <= \<const0>\;
  douta(27) <= \<const0>\;
  douta(26) <= \<const0>\;
  douta(25) <= \<const0>\;
  douta(24) <= \<const0>\;
  douta(23) <= \<const0>\;
  douta(22) <= \<const0>\;
  douta(21) <= \<const0>\;
  douta(20) <= \<const0>\;
  douta(19) <= \<const0>\;
  douta(18) <= \<const0>\;
  douta(17) <= \<const0>\;
  douta(16) <= \<const0>\;
  douta(15) <= \<const0>\;
  douta(14) <= \<const0>\;
  douta(13) <= \<const0>\;
  douta(12) <= \<const0>\;
  douta(11) <= \<const0>\;
  douta(10) <= \<const0>\;
  douta(9) <= \<const0>\;
  douta(8) <= \<const0>\;
  douta(7) <= \<const0>\;
  douta(6) <= \<const0>\;
  douta(5) <= \<const0>\;
  douta(4) <= \<const0>\;
  douta(3) <= \<const0>\;
  douta(2) <= \<const0>\;
  douta(1) <= \<const0>\;
  douta(0) <= \<const0>\;
  sbiterra <= \<const0>\;
  sbiterrb <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gen_wr_a.gen_word_narrow.mem_reg_0\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 72,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "TRUE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "NO_CHANGE",
      WRITE_MODE_B => "NO_CHANGE",
      WRITE_WIDTH_A => 0,
      WRITE_WIDTH_B => 72
    )
        port map (
      ADDRARDADDR(14 downto 11) => B"0000",
      ADDRARDADDR(10 downto 6) => addrb(4 downto 0),
      ADDRARDADDR(5 downto 0) => B"111111",
      ADDRBWRADDR(14 downto 11) => B"0000",
      ADDRBWRADDR(10 downto 6) => addra(4 downto 0),
      ADDRBWRADDR(5 downto 0) => B"111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTB_UNCONNECTED\(31 downto 0),
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASDOUTPB_UNCONNECTED\(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASOUTDBITERR_UNCONNECTED\,
      CASOUTSBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_CASOUTSBITERR_UNCONNECTED\,
      CLKARDCLK => clkb,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => dina(63 downto 32),
      DINPADINP(3 downto 0) => dina(67 downto 64),
      DINPBDINP(3 downto 0) => dina(71 downto 68),
      DOUTADOUT(31 downto 0) => doutb(31 downto 0),
      DOUTBDOUT(31 downto 0) => doutb(63 downto 32),
      DOUTPADOUTP(3 downto 0) => doutb(67 downto 64),
      DOUTPBDOUTP(3 downto 0) => doutb(71 downto 68),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_1_i_1_n_0\,
      ENBWREN => '1',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => rstb,
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_0_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3 downto 0) => B"0000",
      WEBWE(7) => wea(0),
      WEBWE(6) => wea(0),
      WEBWE(5) => wea(0),
      WEBWE(4) => wea(0),
      WEBWE(3) => wea(0),
      WEBWE(2) => wea(0),
      WEBWE(1) => wea(0),
      WEBWE(0) => wea(0)
    );
\gen_wr_a.gen_word_narrow.mem_reg_1\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 72,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "TRUE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "NO_CHANGE",
      WRITE_MODE_B => "NO_CHANGE",
      WRITE_WIDTH_A => 0,
      WRITE_WIDTH_B => 72
    )
        port map (
      ADDRARDADDR(14 downto 11) => B"0000",
      ADDRARDADDR(10 downto 6) => addrb(4 downto 0),
      ADDRARDADDR(5 downto 0) => B"111111",
      ADDRBWRADDR(14 downto 11) => B"0000",
      ADDRBWRADDR(10 downto 6) => addra(4 downto 0),
      ADDRBWRADDR(5 downto 0) => B"111111",
      ADDRENA => '0',
      ADDRENB => '0',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTB_UNCONNECTED\(31 downto 0),
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASDOUTPB_UNCONNECTED\(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASOUTDBITERR_UNCONNECTED\,
      CASOUTSBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_CASOUTSBITERR_UNCONNECTED\,
      CLKARDCLK => clkb,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(103 downto 72),
      DINBDIN(31 downto 24) => B"11111111",
      DINBDIN(23 downto 0) => dina(127 downto 104),
      DINPADINP(3 downto 0) => B"1111",
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => doutb(103 downto 72),
      DOUTBDOUT(31 downto 24) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_DOUTBDOUT_UNCONNECTED\(31 downto 24),
      DOUTBDOUT(23 downto 0) => doutb(127 downto 104),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_1_i_1_n_0\,
      ENBWREN => '1',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => rstb,
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_1_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3 downto 0) => B"0000",
      WEBWE(7) => wea(0),
      WEBWE(6) => wea(0),
      WEBWE(5) => wea(0),
      WEBWE(4) => wea(0),
      WEBWE(3) => wea(0),
      WEBWE(2) => wea(0),
      WEBWE(1) => wea(0),
      WEBWE(0) => wea(0)
    );
\gen_wr_a.gen_word_narrow.mem_reg_1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rstb,
      I1 => enb,
      O => \gen_wr_a.gen_word_narrow.mem_reg_1_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_CompletionQueueManag_2_0_xpm_memory_sdpram is
  port (
    sleep : in STD_LOGIC;
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 4 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 127 downto 0 );
    injectsbiterra : in STD_LOGIC;
    injectdbiterra : in STD_LOGIC;
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 4 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 127 downto 0 );
    sbiterrb : out STD_LOGIC;
    dbiterrb : out STD_LOGIC
  );
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 5;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 5;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 128;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 0;
  attribute CLOCKING_MODE : string;
  attribute CLOCKING_MODE of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "independent_clock";
  attribute ECC_MODE : string;
  attribute ECC_MODE of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "no_ecc";
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "true";
  attribute MEMORY_PRIMITIVE : string;
  attribute MEMORY_PRIMITIVE of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "block";
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 4096;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "xpm_memory_sdpram";
  attribute P_CLOCKING_MODE : integer;
  attribute P_CLOCKING_MODE of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 1;
  attribute P_ECC_MODE : integer;
  attribute P_ECC_MODE of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 0;
  attribute P_MEMORY_OPTIMIZATION : integer;
  attribute P_MEMORY_OPTIMIZATION of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 1;
  attribute P_MEMORY_PRIMITIVE : integer;
  attribute P_MEMORY_PRIMITIVE of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 2;
  attribute P_WAKEUP_TIME : integer;
  attribute P_WAKEUP_TIME of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 0;
  attribute P_WRITE_MODE_B : integer;
  attribute P_WRITE_MODE_B of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 2;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 128;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 1;
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "0";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "SYNC";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 0;
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 0;
  attribute WAKEUP_TIME : string;
  attribute WAKEUP_TIME of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "disable_sleep";
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is 128;
  attribute WRITE_MODE_B : string;
  attribute WRITE_MODE_B of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "no_change";
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram : entity is "TRUE";
end design_1_CompletionQueueManag_2_0_xpm_memory_sdpram;

architecture STRUCTURE of design_1_CompletionQueueManag_2_0_xpm_memory_sdpram is
  signal \<const0>\ : STD_LOGIC;
  signal NLW_xpm_memory_base_inst_dbiterra_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_memory_base_inst_dbiterrb_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_memory_base_inst_sbiterra_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_memory_base_inst_sbiterrb_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_memory_base_inst_douta_UNCONNECTED : STD_LOGIC_VECTOR ( 127 downto 0 );
  attribute ADDR_WIDTH_A of xpm_memory_base_inst : label is 5;
  attribute ADDR_WIDTH_B of xpm_memory_base_inst : label is 5;
  attribute AUTO_SLEEP_TIME of xpm_memory_base_inst : label is 0;
  attribute BYTE_WRITE_WIDTH_A of xpm_memory_base_inst : label is 128;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of xpm_memory_base_inst : label is 128;
  attribute CASCADE_HEIGHT of xpm_memory_base_inst : label is 0;
  attribute CLOCKING_MODE_integer : integer;
  attribute CLOCKING_MODE_integer of xpm_memory_base_inst : label is 1;
  attribute ECC_MODE_integer : integer;
  attribute ECC_MODE_integer of xpm_memory_base_inst : label is 0;
  attribute MAX_NUM_CHAR : integer;
  attribute MAX_NUM_CHAR of xpm_memory_base_inst : label is 0;
  attribute \MEM.ADDRESS_SPACE\ : boolean;
  attribute \MEM.ADDRESS_SPACE\ of xpm_memory_base_inst : label is std.standard.true;
  attribute \MEM.ADDRESS_SPACE_BEGIN\ : integer;
  attribute \MEM.ADDRESS_SPACE_BEGIN\ of xpm_memory_base_inst : label is 0;
  attribute \MEM.ADDRESS_SPACE_DATA_LSB\ : integer;
  attribute \MEM.ADDRESS_SPACE_DATA_LSB\ of xpm_memory_base_inst : label is 0;
  attribute \MEM.ADDRESS_SPACE_DATA_MSB\ : integer;
  attribute \MEM.ADDRESS_SPACE_DATA_MSB\ of xpm_memory_base_inst : label is 127;
  attribute \MEM.ADDRESS_SPACE_END\ : integer;
  attribute \MEM.ADDRESS_SPACE_END\ of xpm_memory_base_inst : label is 511;
  attribute \MEM.CORE_MEMORY_WIDTH\ : integer;
  attribute \MEM.CORE_MEMORY_WIDTH\ of xpm_memory_base_inst : label is 128;
  attribute MEMORY_INIT_FILE of xpm_memory_base_inst : label is "none";
  attribute MEMORY_INIT_PARAM of xpm_memory_base_inst : label is "";
  attribute MEMORY_OPTIMIZATION of xpm_memory_base_inst : label is "true";
  attribute MEMORY_PRIMITIVE_integer : integer;
  attribute MEMORY_PRIMITIVE_integer of xpm_memory_base_inst : label is 2;
  attribute MEMORY_SIZE of xpm_memory_base_inst : label is 4096;
  attribute MEMORY_TYPE : integer;
  attribute MEMORY_TYPE of xpm_memory_base_inst : label is 1;
  attribute MESSAGE_CONTROL of xpm_memory_base_inst : label is 0;
  attribute NUM_CHAR_LOC : integer;
  attribute NUM_CHAR_LOC of xpm_memory_base_inst : label is 0;
  attribute P_ECC_MODE_string : string;
  attribute P_ECC_MODE_string of xpm_memory_base_inst : label is "no_ecc";
  attribute P_ENABLE_BYTE_WRITE_A : integer;
  attribute P_ENABLE_BYTE_WRITE_A of xpm_memory_base_inst : label is 0;
  attribute P_ENABLE_BYTE_WRITE_B : integer;
  attribute P_ENABLE_BYTE_WRITE_B of xpm_memory_base_inst : label is 0;
  attribute P_MAX_DEPTH_DATA : integer;
  attribute P_MAX_DEPTH_DATA of xpm_memory_base_inst : label is 32;
  attribute P_MEMORY_OPT : string;
  attribute P_MEMORY_OPT of xpm_memory_base_inst : label is "yes";
  attribute P_MEMORY_PRIMITIVE_string : string;
  attribute P_MEMORY_PRIMITIVE_string of xpm_memory_base_inst : label is "block";
  attribute P_MIN_WIDTH_DATA : integer;
  attribute P_MIN_WIDTH_DATA of xpm_memory_base_inst : label is 128;
  attribute P_MIN_WIDTH_DATA_A : integer;
  attribute P_MIN_WIDTH_DATA_A of xpm_memory_base_inst : label is 128;
  attribute P_MIN_WIDTH_DATA_B : integer;
  attribute P_MIN_WIDTH_DATA_B of xpm_memory_base_inst : label is 128;
  attribute P_MIN_WIDTH_DATA_ECC : integer;
  attribute P_MIN_WIDTH_DATA_ECC of xpm_memory_base_inst : label is 128;
  attribute P_MIN_WIDTH_DATA_LDW : integer;
  attribute P_MIN_WIDTH_DATA_LDW of xpm_memory_base_inst : label is 4;
  attribute P_MIN_WIDTH_DATA_SHFT : integer;
  attribute P_MIN_WIDTH_DATA_SHFT of xpm_memory_base_inst : label is 128;
  attribute P_NUM_COLS_WRITE_A : integer;
  attribute P_NUM_COLS_WRITE_A of xpm_memory_base_inst : label is 1;
  attribute P_NUM_COLS_WRITE_B : integer;
  attribute P_NUM_COLS_WRITE_B of xpm_memory_base_inst : label is 1;
  attribute P_NUM_ROWS_READ_A : integer;
  attribute P_NUM_ROWS_READ_A of xpm_memory_base_inst : label is 1;
  attribute P_NUM_ROWS_READ_B : integer;
  attribute P_NUM_ROWS_READ_B of xpm_memory_base_inst : label is 1;
  attribute P_NUM_ROWS_WRITE_A : integer;
  attribute P_NUM_ROWS_WRITE_A of xpm_memory_base_inst : label is 1;
  attribute P_NUM_ROWS_WRITE_B : integer;
  attribute P_NUM_ROWS_WRITE_B of xpm_memory_base_inst : label is 1;
  attribute P_SDP_WRITE_MODE : string;
  attribute P_SDP_WRITE_MODE of xpm_memory_base_inst : label is "no";
  attribute P_WIDTH_ADDR_LSB_READ_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_A of xpm_memory_base_inst : label is 0;
  attribute P_WIDTH_ADDR_LSB_READ_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_B of xpm_memory_base_inst : label is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_A of xpm_memory_base_inst : label is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_B of xpm_memory_base_inst : label is 0;
  attribute P_WIDTH_ADDR_READ_A : integer;
  attribute P_WIDTH_ADDR_READ_A of xpm_memory_base_inst : label is 5;
  attribute P_WIDTH_ADDR_READ_B : integer;
  attribute P_WIDTH_ADDR_READ_B of xpm_memory_base_inst : label is 5;
  attribute P_WIDTH_ADDR_WRITE_A : integer;
  attribute P_WIDTH_ADDR_WRITE_A of xpm_memory_base_inst : label is 5;
  attribute P_WIDTH_ADDR_WRITE_B : integer;
  attribute P_WIDTH_ADDR_WRITE_B of xpm_memory_base_inst : label is 5;
  attribute P_WIDTH_COL_WRITE_A : integer;
  attribute P_WIDTH_COL_WRITE_A of xpm_memory_base_inst : label is 128;
  attribute P_WIDTH_COL_WRITE_B : integer;
  attribute P_WIDTH_COL_WRITE_B of xpm_memory_base_inst : label is 128;
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of xpm_memory_base_inst : label is 128;
  attribute READ_DATA_WIDTH_B of xpm_memory_base_inst : label is 128;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of xpm_memory_base_inst : label is 2;
  attribute READ_LATENCY_B of xpm_memory_base_inst : label is 1;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of xpm_memory_base_inst : label is "0";
  attribute READ_RESET_VALUE_B of xpm_memory_base_inst : label is "0";
  attribute RST_MODE_A of xpm_memory_base_inst : label is "SYNC";
  attribute RST_MODE_B of xpm_memory_base_inst : label is "SYNC";
  attribute SIM_ASSERT_CHK of xpm_memory_base_inst : label is 0;
  attribute USE_EMBEDDED_CONSTRAINT of xpm_memory_base_inst : label is 0;
  attribute USE_MEM_INIT of xpm_memory_base_inst : label is 0;
  attribute VERSION : integer;
  attribute VERSION of xpm_memory_base_inst : label is 0;
  attribute WAKEUP_TIME_integer : integer;
  attribute WAKEUP_TIME_integer of xpm_memory_base_inst : label is 0;
  attribute WRITE_DATA_WIDTH_A of xpm_memory_base_inst : label is 128;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of xpm_memory_base_inst : label is 128;
  attribute WRITE_MODE_A : integer;
  attribute WRITE_MODE_A of xpm_memory_base_inst : label is 2;
  attribute WRITE_MODE_B_integer : integer;
  attribute WRITE_MODE_B_integer of xpm_memory_base_inst : label is 2;
  attribute XPM_MODULE of xpm_memory_base_inst : label is "TRUE";
  attribute rsta_loop_iter : integer;
  attribute rsta_loop_iter of xpm_memory_base_inst : label is 128;
  attribute rstb_loop_iter : integer;
  attribute rstb_loop_iter of xpm_memory_base_inst : label is 128;
begin
  dbiterrb <= \<const0>\;
  sbiterrb <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
xpm_memory_base_inst: entity work.design_1_CompletionQueueManag_2_0_xpm_memory_base
     port map (
      addra(4 downto 0) => addra(4 downto 0),
      addrb(4 downto 0) => addrb(4 downto 0),
      clka => clka,
      clkb => clkb,
      dbiterra => NLW_xpm_memory_base_inst_dbiterra_UNCONNECTED,
      dbiterrb => NLW_xpm_memory_base_inst_dbiterrb_UNCONNECTED,
      dina(127 downto 0) => dina(127 downto 0),
      dinb(127 downto 0) => B"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      douta(127 downto 0) => NLW_xpm_memory_base_inst_douta_UNCONNECTED(127 downto 0),
      doutb(127 downto 0) => doutb(127 downto 0),
      ena => '0',
      enb => enb,
      injectdbiterra => '0',
      injectdbiterrb => '0',
      injectsbiterra => '0',
      injectsbiterrb => '0',
      regcea => '0',
      regceb => '0',
      rsta => '0',
      rstb => rstb,
      sbiterra => NLW_xpm_memory_base_inst_sbiterra_UNCONNECTED,
      sbiterrb => NLW_xpm_memory_base_inst_sbiterrb_UNCONNECTED,
      sleep => sleep,
      wea(0) => wea(0),
      web(0) => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0 is
  port (
    done : out STD_LOGIC;
    m00_axi_lite_awaddr : out STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axi_lite_awvalid : out STD_LOGIC;
    m00_axi_lite_wdata : out STD_LOGIC_VECTOR ( 4 downto 0 );
    m00_axi_lite_wvalid : out STD_LOGIC;
    s00_axi_full_awready : out STD_LOGIC;
    s00_axi_full_wready : out STD_LOGIC;
    s00_axi_full_bvalid : out STD_LOGIC;
    s00_axi_full_aclk : in STD_LOGIC;
    m00_axi_lite_aclk : in STD_LOGIC;
    num_cmds_to_wait : in STD_LOGIC_VECTOR ( 31 downto 0 );
    go : in STD_LOGIC;
    async_clear : in STD_LOGIC;
    m00_axi_lite_aresetn : in STD_LOGIC;
    m00_axi_lite_awready : in STD_LOGIC;
    m00_axi_lite_wready : in STD_LOGIC;
    s00_axi_full_aresetn : in STD_LOGIC;
    s00_axi_full_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s00_axi_full_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_full_awvalid : in STD_LOGIC;
    s00_axi_full_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s00_axi_full_wvalid : in STD_LOGIC;
    s00_axi_full_bready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0 : entity is "CompletionQueueManagement_v2_0";
end design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0;

architecture STRUCTURE of design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0 is
  signal cpl_addra : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute MARK_DEBUG : boolean;
  attribute MARK_DEBUG of cpl_addra : signal is std.standard.true;
  signal cpl_addrb : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute MARK_DEBUG of cpl_addrb : signal is std.standard.true;
  signal cpl_dataa : STD_LOGIC_VECTOR ( 127 downto 0 );
  attribute MARK_DEBUG of cpl_dataa : signal is std.standard.true;
  signal cpl_datab : STD_LOGIC_VECTOR ( 127 downto 0 );
  attribute MARK_DEBUG of cpl_datab : signal is std.standard.true;
  signal cpl_rd_enb : STD_LOGIC;
  attribute MARK_DEBUG of cpl_rd_enb : signal is std.standard.true;
  signal cpl_wr_ena : STD_LOGIC;
  attribute MARK_DEBUG of cpl_wr_ena : signal is std.standard.true;
  signal xpm_memory_sdpram_inst_i_1_n_0 : STD_LOGIC;
  signal NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_ARVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_BREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_RREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_WVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_cpl_rd_en_UNCONNECTED : STD_LOGIC;
  signal NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_ARADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_ARPROT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_AWADDR_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_AWPROT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_WDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 5 );
  signal NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_WSTRB_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_ARREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_RLAST_UNCONNECTED : STD_LOGIC;
  signal NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_RVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_BID_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 1 );
  signal NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_BRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_BUSER_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 1 );
  signal NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_RDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_RID_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 1 );
  signal NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_RRESP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_RUSER_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 1 );
  signal NLW_xpm_memory_sdpram_inst_dbiterrb_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_memory_sdpram_inst_sbiterrb_UNCONNECTED : STD_LOGIC;
  attribute CPL_ENTRY_ADDR_WIDTH : integer;
  attribute CPL_ENTRY_ADDR_WIDTH of CompletionQueueManagement_v2_0_M00_AXI_LITE_inst : label is 5;
  attribute CPL_ENTRY_DATA_WIDTH : integer;
  attribute CPL_ENTRY_DATA_WIDTH of CompletionQueueManagement_v2_0_M00_AXI_LITE_inst : label is 128;
  attribute C_M_AXI_ADDR_WIDTH : integer;
  attribute C_M_AXI_ADDR_WIDTH of CompletionQueueManagement_v2_0_M00_AXI_LITE_inst : label is 64;
  attribute C_M_AXI_DATA_WIDTH : integer;
  attribute C_M_AXI_DATA_WIDTH of CompletionQueueManagement_v2_0_M00_AXI_LITE_inst : label is 32;
  attribute C_M_TARGET_SLAVE_BASE_ADDR : string;
  attribute C_M_TARGET_SLAVE_BASE_ADDR of CompletionQueueManagement_v2_0_M00_AXI_LITE_inst : label is "64'b0000000000000000000000000000000010100000000000000001000000011100";
  attribute IDLE : integer;
  attribute IDLE of CompletionQueueManagement_v2_0_M00_AXI_LITE_inst : label is 0;
  attribute READ : integer;
  attribute READ of CompletionQueueManagement_v2_0_M00_AXI_LITE_inst : label is 1;
  attribute RING_DOORBELL_0 : integer;
  attribute RING_DOORBELL_0 of CompletionQueueManagement_v2_0_M00_AXI_LITE_inst : label is 2;
  attribute RING_DOORBELL_1 : integer;
  attribute RING_DOORBELL_1 of CompletionQueueManagement_v2_0_M00_AXI_LITE_inst : label is 3;
  attribute CPL_ENTRY_ADDR_WIDTH of CompletionQueueManagement_v2_0_S00_AXI_FULL_inst : label is 5;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of CompletionQueueManagement_v2_0_S00_AXI_FULL_inst : label is 32;
  attribute C_S_AXI_ARUSER_WIDTH : integer;
  attribute C_S_AXI_ARUSER_WIDTH of CompletionQueueManagement_v2_0_S00_AXI_FULL_inst : label is 0;
  attribute C_S_AXI_AWUSER_WIDTH : integer;
  attribute C_S_AXI_AWUSER_WIDTH of CompletionQueueManagement_v2_0_S00_AXI_FULL_inst : label is 0;
  attribute C_S_AXI_BUSER_WIDTH : integer;
  attribute C_S_AXI_BUSER_WIDTH of CompletionQueueManagement_v2_0_S00_AXI_FULL_inst : label is 0;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of CompletionQueueManagement_v2_0_S00_AXI_FULL_inst : label is 128;
  attribute C_S_AXI_ID_WIDTH : integer;
  attribute C_S_AXI_ID_WIDTH of CompletionQueueManagement_v2_0_S00_AXI_FULL_inst : label is 0;
  attribute C_S_AXI_RUSER_WIDTH : integer;
  attribute C_S_AXI_RUSER_WIDTH of CompletionQueueManagement_v2_0_S00_AXI_FULL_inst : label is 0;
  attribute C_S_AXI_WUSER_WIDTH : integer;
  attribute C_S_AXI_WUSER_WIDTH of CompletionQueueManagement_v2_0_S00_AXI_FULL_inst : label is 0;
  attribute IDLE of CompletionQueueManagement_v2_0_S00_AXI_FULL_inst : label is 0;
  attribute RESP : integer;
  attribute RESP of CompletionQueueManagement_v2_0_S00_AXI_FULL_inst : label is 2;
  attribute WRITE : integer;
  attribute WRITE of CompletionQueueManagement_v2_0_S00_AXI_FULL_inst : label is 1;
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of xpm_memory_sdpram_inst : label is 5;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of xpm_memory_sdpram_inst : label is 5;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of xpm_memory_sdpram_inst : label is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of xpm_memory_sdpram_inst : label is 128;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of xpm_memory_sdpram_inst : label is 0;
  attribute CLOCKING_MODE : string;
  attribute CLOCKING_MODE of xpm_memory_sdpram_inst : label is "independent_clock";
  attribute ECC_MODE : string;
  attribute ECC_MODE of xpm_memory_sdpram_inst : label is "no_ecc";
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of xpm_memory_sdpram_inst : label is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of xpm_memory_sdpram_inst : label is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of xpm_memory_sdpram_inst : label is "true";
  attribute MEMORY_PRIMITIVE : string;
  attribute MEMORY_PRIMITIVE of xpm_memory_sdpram_inst : label is "block";
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of xpm_memory_sdpram_inst : label is 4096;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of xpm_memory_sdpram_inst : label is 0;
  attribute P_CLOCKING_MODE : integer;
  attribute P_CLOCKING_MODE of xpm_memory_sdpram_inst : label is 1;
  attribute P_ECC_MODE : integer;
  attribute P_ECC_MODE of xpm_memory_sdpram_inst : label is 0;
  attribute P_MEMORY_OPTIMIZATION : integer;
  attribute P_MEMORY_OPTIMIZATION of xpm_memory_sdpram_inst : label is 1;
  attribute P_MEMORY_PRIMITIVE : integer;
  attribute P_MEMORY_PRIMITIVE of xpm_memory_sdpram_inst : label is 2;
  attribute P_WAKEUP_TIME : integer;
  attribute P_WAKEUP_TIME of xpm_memory_sdpram_inst : label is 0;
  attribute P_WRITE_MODE_B : integer;
  attribute P_WRITE_MODE_B of xpm_memory_sdpram_inst : label is 2;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of xpm_memory_sdpram_inst : label is 128;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of xpm_memory_sdpram_inst : label is 1;
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of xpm_memory_sdpram_inst : label is "0";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of xpm_memory_sdpram_inst : label is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of xpm_memory_sdpram_inst : label is "SYNC";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of xpm_memory_sdpram_inst : label is 0;
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of xpm_memory_sdpram_inst : label is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of xpm_memory_sdpram_inst : label is 0;
  attribute WAKEUP_TIME : string;
  attribute WAKEUP_TIME of xpm_memory_sdpram_inst : label is "disable_sleep";
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of xpm_memory_sdpram_inst : label is 128;
  attribute WRITE_MODE_B : string;
  attribute WRITE_MODE_B of xpm_memory_sdpram_inst : label is "no_change";
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of xpm_memory_sdpram_inst : label is "TRUE";
begin
CompletionQueueManagement_v2_0_M00_AXI_LITE_inst: entity work.design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_M00_AXI_LITE
     port map (
      M_AXI_ACLK => m00_axi_lite_aclk,
      M_AXI_ARADDR(63 downto 0) => NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_ARADDR_UNCONNECTED(63 downto 0),
      M_AXI_ARESETN => m00_axi_lite_aresetn,
      M_AXI_ARPROT(2 downto 0) => NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_ARPROT_UNCONNECTED(2 downto 0),
      M_AXI_ARREADY => '0',
      M_AXI_ARVALID => NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_ARVALID_UNCONNECTED,
      M_AXI_AWADDR(63 downto 32) => NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_AWADDR_UNCONNECTED(63 downto 32),
      M_AXI_AWADDR(31) => m00_axi_lite_awaddr(0),
      M_AXI_AWADDR(30 downto 0) => NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_AWADDR_UNCONNECTED(30 downto 0),
      M_AXI_AWPROT(2 downto 0) => NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_AWPROT_UNCONNECTED(2 downto 0),
      M_AXI_AWREADY => m00_axi_lite_awready,
      M_AXI_AWVALID => m00_axi_lite_awvalid,
      M_AXI_BREADY => NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_BREADY_UNCONNECTED,
      M_AXI_BRESP(1 downto 0) => B"00",
      M_AXI_BVALID => '0',
      M_AXI_RDATA(31 downto 0) => B"00000000000000000000000000000000",
      M_AXI_RREADY => NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_RREADY_UNCONNECTED,
      M_AXI_RRESP(1 downto 0) => B"00",
      M_AXI_RVALID => '0',
      M_AXI_WDATA(31 downto 5) => NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_WDATA_UNCONNECTED(31 downto 5),
      M_AXI_WDATA(4 downto 0) => m00_axi_lite_wdata(4 downto 0),
      M_AXI_WREADY => m00_axi_lite_wready,
      M_AXI_WSTRB(3) => m00_axi_lite_wvalid,
      M_AXI_WSTRB(2 downto 0) => NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_WSTRB_UNCONNECTED(2 downto 0),
      M_AXI_WVALID => NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_M_AXI_WVALID_UNCONNECTED,
      async_clear => async_clear,
      cpl_addr(4 downto 0) => cpl_addrb(4 downto 0),
      cpl_data(127 downto 113) => B"000000000000000",
      cpl_data(112) => cpl_datab(112),
      cpl_data(111 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      cpl_rd_en => NLW_CompletionQueueManagement_v2_0_M00_AXI_LITE_inst_cpl_rd_en_UNCONNECTED,
      done => done,
      go => go,
      num_cmds_to_wait(31 downto 0) => num_cmds_to_wait(31 downto 0)
    );
CompletionQueueManagement_v2_0_S00_AXI_FULL_inst: entity work.design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0_S00_AXI_FULL
     port map (
      S_AXI_ACLK => s00_axi_full_aclk,
      S_AXI_ARADDR(31 downto 0) => B"00000000000000000000000000000000",
      S_AXI_ARBURST(1 downto 0) => B"00",
      S_AXI_ARCACHE(3 downto 0) => B"0000",
      S_AXI_ARESETN => s00_axi_full_aresetn,
      S_AXI_ARID(0 to 1) => B"00",
      S_AXI_ARLEN(7 downto 0) => B"00000000",
      S_AXI_ARLOCK => '0',
      S_AXI_ARPROT(2 downto 0) => B"000",
      S_AXI_ARQOS(3 downto 0) => B"0000",
      S_AXI_ARREADY => NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_ARREADY_UNCONNECTED,
      S_AXI_ARREGION(3 downto 0) => B"0000",
      S_AXI_ARSIZE(2 downto 0) => B"000",
      S_AXI_ARUSER(0 to 1) => B"00",
      S_AXI_ARVALID => '0',
      S_AXI_AWADDR(31 downto 9) => B"00000000000000000000000",
      S_AXI_AWADDR(8 downto 4) => s00_axi_full_awaddr(4 downto 0),
      S_AXI_AWADDR(3 downto 0) => B"0000",
      S_AXI_AWBURST(1 downto 0) => B"00",
      S_AXI_AWCACHE(3 downto 0) => B"0000",
      S_AXI_AWID(0 to 1) => B"00",
      S_AXI_AWLEN(7 downto 0) => s00_axi_full_awlen(7 downto 0),
      S_AXI_AWLOCK => '0',
      S_AXI_AWPROT(2 downto 0) => B"000",
      S_AXI_AWQOS(3 downto 0) => B"0000",
      S_AXI_AWREADY => s00_axi_full_awready,
      S_AXI_AWREGION(3 downto 0) => B"0000",
      S_AXI_AWSIZE(2 downto 0) => B"000",
      S_AXI_AWUSER(0 to 1) => B"00",
      S_AXI_AWVALID => s00_axi_full_awvalid,
      S_AXI_BID(0 to 1) => NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_BID_UNCONNECTED(0 to 1),
      S_AXI_BREADY => s00_axi_full_bready,
      S_AXI_BRESP(1 downto 0) => NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_BRESP_UNCONNECTED(1 downto 0),
      S_AXI_BUSER(0 to 1) => NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_BUSER_UNCONNECTED(0 to 1),
      S_AXI_BVALID => s00_axi_full_bvalid,
      S_AXI_RDATA(127 downto 0) => NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_RDATA_UNCONNECTED(127 downto 0),
      S_AXI_RID(0 to 1) => NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_RID_UNCONNECTED(0 to 1),
      S_AXI_RLAST => NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_RLAST_UNCONNECTED,
      S_AXI_RREADY => '0',
      S_AXI_RRESP(1 downto 0) => NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_RRESP_UNCONNECTED(1 downto 0),
      S_AXI_RUSER(0 to 1) => NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_RUSER_UNCONNECTED(0 to 1),
      S_AXI_RVALID => NLW_CompletionQueueManagement_v2_0_S00_AXI_FULL_inst_S_AXI_RVALID_UNCONNECTED,
      S_AXI_WDATA(127 downto 0) => s00_axi_full_wdata(127 downto 0),
      S_AXI_WLAST => '0',
      S_AXI_WREADY => s00_axi_full_wready,
      S_AXI_WSTRB(15 downto 0) => B"0000000000000000",
      S_AXI_WUSER(0 to 1) => B"00",
      S_AXI_WVALID => s00_axi_full_wvalid,
      queue_addr(4 downto 0) => cpl_addra(4 downto 0),
      queue_data(127 downto 0) => cpl_dataa(127 downto 0),
      queue_wr_en => cpl_wr_ena
    );
insti_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => cpl_rd_enb
    );
xpm_memory_sdpram_inst: entity work.design_1_CompletionQueueManag_2_0_xpm_memory_sdpram
     port map (
      addra(4 downto 0) => cpl_addra(4 downto 0),
      addrb(4 downto 0) => cpl_addrb(4 downto 0),
      clka => s00_axi_full_aclk,
      clkb => m00_axi_lite_aclk,
      dbiterrb => NLW_xpm_memory_sdpram_inst_dbiterrb_UNCONNECTED,
      dina(127 downto 0) => cpl_dataa(127 downto 0),
      doutb(127 downto 0) => cpl_datab(127 downto 0),
      ena => '1',
      enb => cpl_rd_enb,
      injectdbiterra => '0',
      injectsbiterra => '0',
      regceb => '0',
      rstb => xpm_memory_sdpram_inst_i_1_n_0,
      sbiterrb => NLW_xpm_memory_sdpram_inst_sbiterrb_UNCONNECTED,
      sleep => '0',
      wea(0) => cpl_wr_ena
    );
xpm_memory_sdpram_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => m00_axi_lite_aresetn,
      O => xpm_memory_sdpram_inst_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_CompletionQueueManag_2_0 is
  port (
    num_cmds_to_wait : in STD_LOGIC_VECTOR ( 31 downto 0 );
    go : in STD_LOGIC;
    async_clear : in STD_LOGIC;
    done : out STD_LOGIC;
    m00_axi_lite_aclk : in STD_LOGIC;
    m00_axi_lite_aresetn : in STD_LOGIC;
    m00_axi_lite_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m00_axi_lite_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m00_axi_lite_awvalid : out STD_LOGIC;
    m00_axi_lite_awready : in STD_LOGIC;
    m00_axi_lite_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axi_lite_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axi_lite_wvalid : out STD_LOGIC;
    m00_axi_lite_wready : in STD_LOGIC;
    m00_axi_lite_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m00_axi_lite_bvalid : in STD_LOGIC;
    m00_axi_lite_bready : out STD_LOGIC;
    m00_axi_lite_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m00_axi_lite_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m00_axi_lite_arvalid : out STD_LOGIC;
    m00_axi_lite_arready : in STD_LOGIC;
    m00_axi_lite_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axi_lite_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m00_axi_lite_rvalid : in STD_LOGIC;
    m00_axi_lite_rready : out STD_LOGIC;
    s00_axi_full_aclk : in STD_LOGIC;
    s00_axi_full_aresetn : in STD_LOGIC;
    s00_axi_full_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_full_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_full_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_full_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_full_awlock : in STD_LOGIC;
    s00_axi_full_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_full_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_full_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_full_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_full_awvalid : in STD_LOGIC;
    s00_axi_full_awready : out STD_LOGIC;
    s00_axi_full_wdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s00_axi_full_wstrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axi_full_wlast : in STD_LOGIC;
    s00_axi_full_wvalid : in STD_LOGIC;
    s00_axi_full_wready : out STD_LOGIC;
    s00_axi_full_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_full_bvalid : out STD_LOGIC;
    s00_axi_full_bready : in STD_LOGIC;
    s00_axi_full_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_full_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axi_full_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_full_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_full_arlock : in STD_LOGIC;
    s00_axi_full_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_full_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_full_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_full_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_full_arvalid : in STD_LOGIC;
    s00_axi_full_arready : out STD_LOGIC;
    s00_axi_full_rdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s00_axi_full_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_full_rlast : out STD_LOGIC;
    s00_axi_full_rvalid : out STD_LOGIC;
    s00_axi_full_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_CompletionQueueManag_2_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_CompletionQueueManag_2_0 : entity is "design_1_CompletionQueueManag_2_0,CompletionQueueManagement_v2_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_CompletionQueueManag_2_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_CompletionQueueManag_2_0 : entity is "CompletionQueueManagement_v2_0,Vivado 2019.2";
end design_1_CompletionQueueManag_2_0;

architecture STRUCTURE of design_1_CompletionQueueManag_2_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^m00_axi_lite_awaddr\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \^m00_axi_lite_wdata\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^m00_axi_lite_wvalid\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of m00_axi_lite_aclk : signal is "xilinx.com:signal:clock:1.0 M00_AXI_LITE_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of m00_axi_lite_aclk : signal is "XIL_INTERFACENAME M00_AXI_LITE_CLK, ASSOCIATED_BUSIF M00_AXI_LITE, ASSOCIATED_RESET m00_axi_lite_aresetn, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_xdma_0_0_axi_aclk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axi_lite_aresetn : signal is "xilinx.com:signal:reset:1.0 M00_AXI_LITE_RST RST";
  attribute X_INTERFACE_PARAMETER of m00_axi_lite_aresetn : signal is "XIL_INTERFACENAME M00_AXI_LITE_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axi_lite_arready : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE ARREADY";
  attribute X_INTERFACE_INFO of m00_axi_lite_arvalid : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE ARVALID";
  attribute X_INTERFACE_INFO of m00_axi_lite_awready : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE AWREADY";
  attribute X_INTERFACE_INFO of m00_axi_lite_awvalid : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE AWVALID";
  attribute X_INTERFACE_INFO of m00_axi_lite_bready : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE BREADY";
  attribute X_INTERFACE_INFO of m00_axi_lite_bvalid : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE BVALID";
  attribute X_INTERFACE_INFO of m00_axi_lite_rready : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE RREADY";
  attribute X_INTERFACE_PARAMETER of m00_axi_lite_rready : signal is "XIL_INTERFACENAME M00_AXI_LITE, WIZ_DATA_WIDTH 32, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 250000000, ID_WIDTH 0, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_xdma_0_0_axi_aclk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axi_lite_rvalid : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE RVALID";
  attribute X_INTERFACE_INFO of m00_axi_lite_wready : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE WREADY";
  attribute X_INTERFACE_INFO of m00_axi_lite_wvalid : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE WVALID";
  attribute X_INTERFACE_INFO of s00_axi_full_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_FULL_CLK CLK";
  attribute X_INTERFACE_PARAMETER of s00_axi_full_aclk : signal is "XIL_INTERFACENAME S00_AXI_FULL_CLK, ASSOCIATED_BUSIF S00_AXI_FULL, ASSOCIATED_RESET s00_axi_full_aresetn, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_xdma_0_0_axi_aclk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_full_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_FULL_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_full_aresetn : signal is "XIL_INTERFACENAME S00_AXI_FULL_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_full_arlock : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL ARLOCK";
  attribute X_INTERFACE_INFO of s00_axi_full_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_full_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_full_awlock : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL AWLOCK";
  attribute X_INTERFACE_INFO of s00_axi_full_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_full_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_full_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL BREADY";
  attribute X_INTERFACE_INFO of s00_axi_full_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL BVALID";
  attribute X_INTERFACE_INFO of s00_axi_full_rlast : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL RLAST";
  attribute X_INTERFACE_INFO of s00_axi_full_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_full_rready : signal is "XIL_INTERFACENAME S00_AXI_FULL, WIZ_DATA_WIDTH 32, WIZ_MEMORY_SIZE 64, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 250000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN design_1_xdma_0_0_axi_aclk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axi_full_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL RVALID";
  attribute X_INTERFACE_INFO of s00_axi_full_wlast : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL WLAST";
  attribute X_INTERFACE_INFO of s00_axi_full_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL WREADY";
  attribute X_INTERFACE_INFO of s00_axi_full_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL WVALID";
  attribute X_INTERFACE_INFO of m00_axi_lite_araddr : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE ARADDR";
  attribute X_INTERFACE_INFO of m00_axi_lite_arprot : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE ARPROT";
  attribute X_INTERFACE_INFO of m00_axi_lite_awaddr : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE AWADDR";
  attribute X_INTERFACE_INFO of m00_axi_lite_awprot : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE AWPROT";
  attribute X_INTERFACE_INFO of m00_axi_lite_bresp : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE BRESP";
  attribute X_INTERFACE_INFO of m00_axi_lite_rdata : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE RDATA";
  attribute X_INTERFACE_INFO of m00_axi_lite_rresp : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE RRESP";
  attribute X_INTERFACE_INFO of m00_axi_lite_wdata : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE WDATA";
  attribute X_INTERFACE_INFO of m00_axi_lite_wstrb : signal is "xilinx.com:interface:aximm:1.0 M00_AXI_LITE WSTRB";
  attribute X_INTERFACE_INFO of s00_axi_full_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_full_arburst : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL ARBURST";
  attribute X_INTERFACE_INFO of s00_axi_full_arcache : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL ARCACHE";
  attribute X_INTERFACE_INFO of s00_axi_full_arlen : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL ARLEN";
  attribute X_INTERFACE_INFO of s00_axi_full_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_full_arqos : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL ARQOS";
  attribute X_INTERFACE_INFO of s00_axi_full_arregion : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL ARREGION";
  attribute X_INTERFACE_INFO of s00_axi_full_arsize : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL ARSIZE";
  attribute X_INTERFACE_INFO of s00_axi_full_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_full_awburst : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL AWBURST";
  attribute X_INTERFACE_INFO of s00_axi_full_awcache : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL AWCACHE";
  attribute X_INTERFACE_INFO of s00_axi_full_awlen : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL AWLEN";
  attribute X_INTERFACE_INFO of s00_axi_full_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_full_awqos : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL AWQOS";
  attribute X_INTERFACE_INFO of s00_axi_full_awregion : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL AWREGION";
  attribute X_INTERFACE_INFO of s00_axi_full_awsize : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL AWSIZE";
  attribute X_INTERFACE_INFO of s00_axi_full_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL BRESP";
  attribute X_INTERFACE_INFO of s00_axi_full_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL RDATA";
  attribute X_INTERFACE_INFO of s00_axi_full_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL RRESP";
  attribute X_INTERFACE_INFO of s00_axi_full_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL WDATA";
  attribute X_INTERFACE_INFO of s00_axi_full_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI_FULL WSTRB";
begin
  m00_axi_lite_araddr(63) <= \<const0>\;
  m00_axi_lite_araddr(62) <= \<const0>\;
  m00_axi_lite_araddr(61) <= \<const0>\;
  m00_axi_lite_araddr(60) <= \<const0>\;
  m00_axi_lite_araddr(59) <= \<const0>\;
  m00_axi_lite_araddr(58) <= \<const0>\;
  m00_axi_lite_araddr(57) <= \<const0>\;
  m00_axi_lite_araddr(56) <= \<const0>\;
  m00_axi_lite_araddr(55) <= \<const0>\;
  m00_axi_lite_araddr(54) <= \<const0>\;
  m00_axi_lite_araddr(53) <= \<const0>\;
  m00_axi_lite_araddr(52) <= \<const0>\;
  m00_axi_lite_araddr(51) <= \<const0>\;
  m00_axi_lite_araddr(50) <= \<const0>\;
  m00_axi_lite_araddr(49) <= \<const0>\;
  m00_axi_lite_araddr(48) <= \<const0>\;
  m00_axi_lite_araddr(47) <= \<const0>\;
  m00_axi_lite_araddr(46) <= \<const0>\;
  m00_axi_lite_araddr(45) <= \<const0>\;
  m00_axi_lite_araddr(44) <= \<const0>\;
  m00_axi_lite_araddr(43) <= \<const0>\;
  m00_axi_lite_araddr(42) <= \<const0>\;
  m00_axi_lite_araddr(41) <= \<const0>\;
  m00_axi_lite_araddr(40) <= \<const0>\;
  m00_axi_lite_araddr(39) <= \<const0>\;
  m00_axi_lite_araddr(38) <= \<const0>\;
  m00_axi_lite_araddr(37) <= \<const0>\;
  m00_axi_lite_araddr(36) <= \<const0>\;
  m00_axi_lite_araddr(35) <= \<const0>\;
  m00_axi_lite_araddr(34) <= \<const0>\;
  m00_axi_lite_araddr(33) <= \<const0>\;
  m00_axi_lite_araddr(32) <= \<const0>\;
  m00_axi_lite_araddr(31) <= \<const0>\;
  m00_axi_lite_araddr(30) <= \<const0>\;
  m00_axi_lite_araddr(29) <= \<const0>\;
  m00_axi_lite_araddr(28) <= \<const0>\;
  m00_axi_lite_araddr(27) <= \<const0>\;
  m00_axi_lite_araddr(26) <= \<const0>\;
  m00_axi_lite_araddr(25) <= \<const0>\;
  m00_axi_lite_araddr(24) <= \<const0>\;
  m00_axi_lite_araddr(23) <= \<const0>\;
  m00_axi_lite_araddr(22) <= \<const0>\;
  m00_axi_lite_araddr(21) <= \<const0>\;
  m00_axi_lite_araddr(20) <= \<const0>\;
  m00_axi_lite_araddr(19) <= \<const0>\;
  m00_axi_lite_araddr(18) <= \<const0>\;
  m00_axi_lite_araddr(17) <= \<const0>\;
  m00_axi_lite_araddr(16) <= \<const0>\;
  m00_axi_lite_araddr(15) <= \<const0>\;
  m00_axi_lite_araddr(14) <= \<const0>\;
  m00_axi_lite_araddr(13) <= \<const0>\;
  m00_axi_lite_araddr(12) <= \<const0>\;
  m00_axi_lite_araddr(11) <= \<const0>\;
  m00_axi_lite_araddr(10) <= \<const0>\;
  m00_axi_lite_araddr(9) <= \<const0>\;
  m00_axi_lite_araddr(8) <= \<const0>\;
  m00_axi_lite_araddr(7) <= \<const0>\;
  m00_axi_lite_araddr(6) <= \<const0>\;
  m00_axi_lite_araddr(5) <= \<const0>\;
  m00_axi_lite_araddr(4) <= \<const0>\;
  m00_axi_lite_araddr(3) <= \<const0>\;
  m00_axi_lite_araddr(2) <= \<const0>\;
  m00_axi_lite_araddr(1) <= \<const0>\;
  m00_axi_lite_araddr(0) <= \<const0>\;
  m00_axi_lite_arprot(2) <= \<const0>\;
  m00_axi_lite_arprot(1) <= \<const0>\;
  m00_axi_lite_arprot(0) <= \<const0>\;
  m00_axi_lite_arvalid <= \<const0>\;
  m00_axi_lite_awaddr(63) <= \<const0>\;
  m00_axi_lite_awaddr(62) <= \<const0>\;
  m00_axi_lite_awaddr(61) <= \<const0>\;
  m00_axi_lite_awaddr(60) <= \<const0>\;
  m00_axi_lite_awaddr(59) <= \<const0>\;
  m00_axi_lite_awaddr(58) <= \<const0>\;
  m00_axi_lite_awaddr(57) <= \<const0>\;
  m00_axi_lite_awaddr(56) <= \<const0>\;
  m00_axi_lite_awaddr(55) <= \<const0>\;
  m00_axi_lite_awaddr(54) <= \<const0>\;
  m00_axi_lite_awaddr(53) <= \<const0>\;
  m00_axi_lite_awaddr(52) <= \<const0>\;
  m00_axi_lite_awaddr(51) <= \<const0>\;
  m00_axi_lite_awaddr(50) <= \<const0>\;
  m00_axi_lite_awaddr(49) <= \<const0>\;
  m00_axi_lite_awaddr(48) <= \<const0>\;
  m00_axi_lite_awaddr(47) <= \<const0>\;
  m00_axi_lite_awaddr(46) <= \<const0>\;
  m00_axi_lite_awaddr(45) <= \<const0>\;
  m00_axi_lite_awaddr(44) <= \<const0>\;
  m00_axi_lite_awaddr(43) <= \<const0>\;
  m00_axi_lite_awaddr(42) <= \<const0>\;
  m00_axi_lite_awaddr(41) <= \<const0>\;
  m00_axi_lite_awaddr(40) <= \<const0>\;
  m00_axi_lite_awaddr(39) <= \<const0>\;
  m00_axi_lite_awaddr(38) <= \<const0>\;
  m00_axi_lite_awaddr(37) <= \<const0>\;
  m00_axi_lite_awaddr(36) <= \<const0>\;
  m00_axi_lite_awaddr(35) <= \<const0>\;
  m00_axi_lite_awaddr(34) <= \<const0>\;
  m00_axi_lite_awaddr(33) <= \<const0>\;
  m00_axi_lite_awaddr(32) <= \<const0>\;
  m00_axi_lite_awaddr(31) <= \^m00_axi_lite_awaddr\(2);
  m00_axi_lite_awaddr(30) <= \<const0>\;
  m00_axi_lite_awaddr(29) <= \^m00_axi_lite_awaddr\(2);
  m00_axi_lite_awaddr(28) <= \<const0>\;
  m00_axi_lite_awaddr(27) <= \<const0>\;
  m00_axi_lite_awaddr(26) <= \<const0>\;
  m00_axi_lite_awaddr(25) <= \<const0>\;
  m00_axi_lite_awaddr(24) <= \<const0>\;
  m00_axi_lite_awaddr(23) <= \<const0>\;
  m00_axi_lite_awaddr(22) <= \<const0>\;
  m00_axi_lite_awaddr(21) <= \<const0>\;
  m00_axi_lite_awaddr(20) <= \<const0>\;
  m00_axi_lite_awaddr(19) <= \<const0>\;
  m00_axi_lite_awaddr(18) <= \<const0>\;
  m00_axi_lite_awaddr(17) <= \<const0>\;
  m00_axi_lite_awaddr(16) <= \<const0>\;
  m00_axi_lite_awaddr(15) <= \<const0>\;
  m00_axi_lite_awaddr(14) <= \<const0>\;
  m00_axi_lite_awaddr(13) <= \<const0>\;
  m00_axi_lite_awaddr(12) <= \^m00_axi_lite_awaddr\(2);
  m00_axi_lite_awaddr(11) <= \<const0>\;
  m00_axi_lite_awaddr(10) <= \<const0>\;
  m00_axi_lite_awaddr(9) <= \<const0>\;
  m00_axi_lite_awaddr(8) <= \<const0>\;
  m00_axi_lite_awaddr(7) <= \<const0>\;
  m00_axi_lite_awaddr(6) <= \<const0>\;
  m00_axi_lite_awaddr(5) <= \<const0>\;
  m00_axi_lite_awaddr(4) <= \^m00_axi_lite_awaddr\(2);
  m00_axi_lite_awaddr(3) <= \^m00_axi_lite_awaddr\(2);
  m00_axi_lite_awaddr(2) <= \^m00_axi_lite_awaddr\(2);
  m00_axi_lite_awaddr(1) <= \<const0>\;
  m00_axi_lite_awaddr(0) <= \<const0>\;
  m00_axi_lite_awprot(2) <= \<const0>\;
  m00_axi_lite_awprot(1) <= \<const0>\;
  m00_axi_lite_awprot(0) <= \<const0>\;
  m00_axi_lite_bready <= \<const1>\;
  m00_axi_lite_rready <= \<const0>\;
  m00_axi_lite_wdata(31) <= \<const0>\;
  m00_axi_lite_wdata(30) <= \<const0>\;
  m00_axi_lite_wdata(29) <= \<const0>\;
  m00_axi_lite_wdata(28) <= \<const0>\;
  m00_axi_lite_wdata(27) <= \<const0>\;
  m00_axi_lite_wdata(26) <= \<const0>\;
  m00_axi_lite_wdata(25) <= \<const0>\;
  m00_axi_lite_wdata(24) <= \<const0>\;
  m00_axi_lite_wdata(23) <= \<const0>\;
  m00_axi_lite_wdata(22) <= \<const0>\;
  m00_axi_lite_wdata(21) <= \<const0>\;
  m00_axi_lite_wdata(20) <= \<const0>\;
  m00_axi_lite_wdata(19) <= \<const0>\;
  m00_axi_lite_wdata(18) <= \<const0>\;
  m00_axi_lite_wdata(17) <= \<const0>\;
  m00_axi_lite_wdata(16) <= \<const0>\;
  m00_axi_lite_wdata(15) <= \<const0>\;
  m00_axi_lite_wdata(14) <= \<const0>\;
  m00_axi_lite_wdata(13) <= \<const0>\;
  m00_axi_lite_wdata(12) <= \<const0>\;
  m00_axi_lite_wdata(11) <= \<const0>\;
  m00_axi_lite_wdata(10) <= \<const0>\;
  m00_axi_lite_wdata(9) <= \<const0>\;
  m00_axi_lite_wdata(8) <= \<const0>\;
  m00_axi_lite_wdata(7) <= \<const0>\;
  m00_axi_lite_wdata(6) <= \<const0>\;
  m00_axi_lite_wdata(5) <= \<const0>\;
  m00_axi_lite_wdata(4 downto 0) <= \^m00_axi_lite_wdata\(4 downto 0);
  m00_axi_lite_wstrb(3) <= \^m00_axi_lite_wvalid\;
  m00_axi_lite_wstrb(2) <= \^m00_axi_lite_wvalid\;
  m00_axi_lite_wstrb(1) <= \^m00_axi_lite_wvalid\;
  m00_axi_lite_wstrb(0) <= \^m00_axi_lite_wvalid\;
  m00_axi_lite_wvalid <= \^m00_axi_lite_wvalid\;
  s00_axi_full_arready <= \<const0>\;
  s00_axi_full_bresp(1) <= \<const0>\;
  s00_axi_full_bresp(0) <= \<const0>\;
  s00_axi_full_rdata(127) <= \<const0>\;
  s00_axi_full_rdata(126) <= \<const0>\;
  s00_axi_full_rdata(125) <= \<const0>\;
  s00_axi_full_rdata(124) <= \<const0>\;
  s00_axi_full_rdata(123) <= \<const0>\;
  s00_axi_full_rdata(122) <= \<const0>\;
  s00_axi_full_rdata(121) <= \<const0>\;
  s00_axi_full_rdata(120) <= \<const0>\;
  s00_axi_full_rdata(119) <= \<const0>\;
  s00_axi_full_rdata(118) <= \<const0>\;
  s00_axi_full_rdata(117) <= \<const0>\;
  s00_axi_full_rdata(116) <= \<const0>\;
  s00_axi_full_rdata(115) <= \<const0>\;
  s00_axi_full_rdata(114) <= \<const0>\;
  s00_axi_full_rdata(113) <= \<const0>\;
  s00_axi_full_rdata(112) <= \<const0>\;
  s00_axi_full_rdata(111) <= \<const0>\;
  s00_axi_full_rdata(110) <= \<const0>\;
  s00_axi_full_rdata(109) <= \<const0>\;
  s00_axi_full_rdata(108) <= \<const0>\;
  s00_axi_full_rdata(107) <= \<const0>\;
  s00_axi_full_rdata(106) <= \<const0>\;
  s00_axi_full_rdata(105) <= \<const0>\;
  s00_axi_full_rdata(104) <= \<const0>\;
  s00_axi_full_rdata(103) <= \<const0>\;
  s00_axi_full_rdata(102) <= \<const0>\;
  s00_axi_full_rdata(101) <= \<const0>\;
  s00_axi_full_rdata(100) <= \<const0>\;
  s00_axi_full_rdata(99) <= \<const0>\;
  s00_axi_full_rdata(98) <= \<const0>\;
  s00_axi_full_rdata(97) <= \<const0>\;
  s00_axi_full_rdata(96) <= \<const0>\;
  s00_axi_full_rdata(95) <= \<const0>\;
  s00_axi_full_rdata(94) <= \<const0>\;
  s00_axi_full_rdata(93) <= \<const0>\;
  s00_axi_full_rdata(92) <= \<const0>\;
  s00_axi_full_rdata(91) <= \<const0>\;
  s00_axi_full_rdata(90) <= \<const0>\;
  s00_axi_full_rdata(89) <= \<const0>\;
  s00_axi_full_rdata(88) <= \<const0>\;
  s00_axi_full_rdata(87) <= \<const0>\;
  s00_axi_full_rdata(86) <= \<const0>\;
  s00_axi_full_rdata(85) <= \<const0>\;
  s00_axi_full_rdata(84) <= \<const0>\;
  s00_axi_full_rdata(83) <= \<const0>\;
  s00_axi_full_rdata(82) <= \<const0>\;
  s00_axi_full_rdata(81) <= \<const0>\;
  s00_axi_full_rdata(80) <= \<const0>\;
  s00_axi_full_rdata(79) <= \<const0>\;
  s00_axi_full_rdata(78) <= \<const0>\;
  s00_axi_full_rdata(77) <= \<const0>\;
  s00_axi_full_rdata(76) <= \<const0>\;
  s00_axi_full_rdata(75) <= \<const0>\;
  s00_axi_full_rdata(74) <= \<const0>\;
  s00_axi_full_rdata(73) <= \<const0>\;
  s00_axi_full_rdata(72) <= \<const0>\;
  s00_axi_full_rdata(71) <= \<const0>\;
  s00_axi_full_rdata(70) <= \<const0>\;
  s00_axi_full_rdata(69) <= \<const0>\;
  s00_axi_full_rdata(68) <= \<const0>\;
  s00_axi_full_rdata(67) <= \<const0>\;
  s00_axi_full_rdata(66) <= \<const0>\;
  s00_axi_full_rdata(65) <= \<const0>\;
  s00_axi_full_rdata(64) <= \<const0>\;
  s00_axi_full_rdata(63) <= \<const0>\;
  s00_axi_full_rdata(62) <= \<const0>\;
  s00_axi_full_rdata(61) <= \<const0>\;
  s00_axi_full_rdata(60) <= \<const0>\;
  s00_axi_full_rdata(59) <= \<const0>\;
  s00_axi_full_rdata(58) <= \<const0>\;
  s00_axi_full_rdata(57) <= \<const0>\;
  s00_axi_full_rdata(56) <= \<const0>\;
  s00_axi_full_rdata(55) <= \<const0>\;
  s00_axi_full_rdata(54) <= \<const0>\;
  s00_axi_full_rdata(53) <= \<const0>\;
  s00_axi_full_rdata(52) <= \<const0>\;
  s00_axi_full_rdata(51) <= \<const0>\;
  s00_axi_full_rdata(50) <= \<const0>\;
  s00_axi_full_rdata(49) <= \<const0>\;
  s00_axi_full_rdata(48) <= \<const0>\;
  s00_axi_full_rdata(47) <= \<const0>\;
  s00_axi_full_rdata(46) <= \<const0>\;
  s00_axi_full_rdata(45) <= \<const0>\;
  s00_axi_full_rdata(44) <= \<const0>\;
  s00_axi_full_rdata(43) <= \<const0>\;
  s00_axi_full_rdata(42) <= \<const0>\;
  s00_axi_full_rdata(41) <= \<const0>\;
  s00_axi_full_rdata(40) <= \<const0>\;
  s00_axi_full_rdata(39) <= \<const0>\;
  s00_axi_full_rdata(38) <= \<const0>\;
  s00_axi_full_rdata(37) <= \<const0>\;
  s00_axi_full_rdata(36) <= \<const0>\;
  s00_axi_full_rdata(35) <= \<const0>\;
  s00_axi_full_rdata(34) <= \<const0>\;
  s00_axi_full_rdata(33) <= \<const0>\;
  s00_axi_full_rdata(32) <= \<const0>\;
  s00_axi_full_rdata(31) <= \<const0>\;
  s00_axi_full_rdata(30) <= \<const0>\;
  s00_axi_full_rdata(29) <= \<const0>\;
  s00_axi_full_rdata(28) <= \<const0>\;
  s00_axi_full_rdata(27) <= \<const0>\;
  s00_axi_full_rdata(26) <= \<const0>\;
  s00_axi_full_rdata(25) <= \<const0>\;
  s00_axi_full_rdata(24) <= \<const0>\;
  s00_axi_full_rdata(23) <= \<const0>\;
  s00_axi_full_rdata(22) <= \<const0>\;
  s00_axi_full_rdata(21) <= \<const0>\;
  s00_axi_full_rdata(20) <= \<const0>\;
  s00_axi_full_rdata(19) <= \<const0>\;
  s00_axi_full_rdata(18) <= \<const0>\;
  s00_axi_full_rdata(17) <= \<const0>\;
  s00_axi_full_rdata(16) <= \<const0>\;
  s00_axi_full_rdata(15) <= \<const0>\;
  s00_axi_full_rdata(14) <= \<const0>\;
  s00_axi_full_rdata(13) <= \<const0>\;
  s00_axi_full_rdata(12) <= \<const0>\;
  s00_axi_full_rdata(11) <= \<const0>\;
  s00_axi_full_rdata(10) <= \<const0>\;
  s00_axi_full_rdata(9) <= \<const0>\;
  s00_axi_full_rdata(8) <= \<const0>\;
  s00_axi_full_rdata(7) <= \<const0>\;
  s00_axi_full_rdata(6) <= \<const0>\;
  s00_axi_full_rdata(5) <= \<const0>\;
  s00_axi_full_rdata(4) <= \<const0>\;
  s00_axi_full_rdata(3) <= \<const0>\;
  s00_axi_full_rdata(2) <= \<const0>\;
  s00_axi_full_rdata(1) <= \<const0>\;
  s00_axi_full_rdata(0) <= \<const0>\;
  s00_axi_full_rlast <= \<const0>\;
  s00_axi_full_rresp(1) <= \<const0>\;
  s00_axi_full_rresp(0) <= \<const0>\;
  s00_axi_full_rvalid <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.design_1_CompletionQueueManag_2_0_CompletionQueueManagement_v2_0
     port map (
      async_clear => async_clear,
      done => done,
      go => go,
      m00_axi_lite_aclk => m00_axi_lite_aclk,
      m00_axi_lite_aresetn => m00_axi_lite_aresetn,
      m00_axi_lite_awaddr(0) => \^m00_axi_lite_awaddr\(2),
      m00_axi_lite_awready => m00_axi_lite_awready,
      m00_axi_lite_awvalid => m00_axi_lite_awvalid,
      m00_axi_lite_wdata(4 downto 0) => \^m00_axi_lite_wdata\(4 downto 0),
      m00_axi_lite_wready => m00_axi_lite_wready,
      m00_axi_lite_wvalid => \^m00_axi_lite_wvalid\,
      num_cmds_to_wait(31 downto 0) => num_cmds_to_wait(31 downto 0),
      s00_axi_full_aclk => s00_axi_full_aclk,
      s00_axi_full_aresetn => s00_axi_full_aresetn,
      s00_axi_full_awaddr(4 downto 0) => s00_axi_full_awaddr(8 downto 4),
      s00_axi_full_awlen(7 downto 0) => s00_axi_full_awlen(7 downto 0),
      s00_axi_full_awready => s00_axi_full_awready,
      s00_axi_full_awvalid => s00_axi_full_awvalid,
      s00_axi_full_bready => s00_axi_full_bready,
      s00_axi_full_bvalid => s00_axi_full_bvalid,
      s00_axi_full_wdata(127 downto 0) => s00_axi_full_wdata(127 downto 0),
      s00_axi_full_wready => s00_axi_full_wready,
      s00_axi_full_wvalid => s00_axi_full_wvalid
    );
end STRUCTURE;
