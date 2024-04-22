-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed May 22 14:40:46 2019
-- Host        : ENGR-RCL11G running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/rubenpurdy/Developer/RANC/Emulation/Projects/RANCStreaming/src/blockdesign/streaming/ip/streaming_AXIStreamPacketBuffer_0_1/streaming_AXIStreamPacketBuffer_0_1_sim_netlist.vhdl
-- Design      : streaming_AXIStreamPacketBuffer_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu9eg-ffvb1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer_M00_AXIS is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tlast : out STD_LOGIC;
    CO : out STD_LOGIC_VECTOR ( 0 to 0 );
    buffer_to_stream_error : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ADDRG : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ADDRB : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \read_pointer_reg[5]_rep_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \read_pointer_reg[5]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    tx_done_reg_0 : out STD_LOGIC;
    axis_tlast_delay_reg_0 : out STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_aclk : in STD_LOGIC;
    \num_packets_reg[6]\ : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \num_packets_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \num_packets_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axis_aresetn : in STD_LOGIC;
    \tx_done0__14\ : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axis_tready : in STD_LOGIC;
    \num_packets_reg[7]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    read_en : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer_M00_AXIS : entity is "AXIStreamPacketBuffer_M00_AXIS";
end streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer_M00_AXIS;

architecture STRUCTURE of streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer_M00_AXIS is
  signal \^addrb\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^addrg\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^co\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \FSM_onehot_mst_exec_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_mst_exec_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_mst_exec_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_mst_exec_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_mst_exec_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_tvalid : STD_LOGIC;
  signal axis_tvalid0_carry_n_5 : STD_LOGIC;
  signal axis_tvalid0_carry_n_6 : STD_LOGIC;
  signal axis_tvalid0_carry_n_7 : STD_LOGIC;
  signal \^buffer_to_stream_error\ : STD_LOGIC;
  signal buffer_to_stream_error_i_1_n_0 : STD_LOGIC;
  signal buffer_to_stream_error_i_2_n_0 : STD_LOGIC;
  signal count : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of count : signal is "yes";
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \count[3]_i_1_n_0\ : STD_LOGIC;
  signal \count[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_reg_n_0_[4]\ : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute RTL_KEEP of \^out\ : signal is "yes";
  signal p_0_in : STD_LOGIC_VECTOR ( 1 to 1 );
  signal read_pointer : STD_LOGIC;
  attribute RTL_KEEP of read_pointer : signal is "yes";
  signal read_pointer1 : STD_LOGIC;
  signal read_pointer1_carry_i_10_n_0 : STD_LOGIC;
  signal read_pointer1_carry_i_1_n_0 : STD_LOGIC;
  signal read_pointer1_carry_i_2_n_0 : STD_LOGIC;
  signal read_pointer1_carry_i_3_n_0 : STD_LOGIC;
  signal read_pointer1_carry_i_5_n_0 : STD_LOGIC;
  signal read_pointer1_carry_i_6_n_0 : STD_LOGIC;
  signal read_pointer1_carry_i_7_n_0 : STD_LOGIC;
  signal read_pointer1_carry_i_8_n_0 : STD_LOGIC;
  signal read_pointer1_carry_n_5 : STD_LOGIC;
  signal read_pointer1_carry_n_6 : STD_LOGIC;
  signal read_pointer1_carry_n_7 : STD_LOGIC;
  signal read_pointer2 : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \read_pointer[0]_i_1_n_0\ : STD_LOGIC;
  signal \read_pointer[0]_rep_i_1__0_n_0\ : STD_LOGIC;
  signal \read_pointer[0]_rep_i_1_n_0\ : STD_LOGIC;
  signal \read_pointer[1]_rep_i_1__0_n_0\ : STD_LOGIC;
  signal \read_pointer[1]_rep_i_1__1_n_0\ : STD_LOGIC;
  signal \read_pointer[1]_rep_i_1_n_0\ : STD_LOGIC;
  signal \read_pointer[2]_rep_i_1__0_n_0\ : STD_LOGIC;
  signal \read_pointer[2]_rep_i_1__1_n_0\ : STD_LOGIC;
  signal \read_pointer[2]_rep_i_1_n_0\ : STD_LOGIC;
  signal \read_pointer[3]_rep_i_1__0_n_0\ : STD_LOGIC;
  signal \read_pointer[3]_rep_i_1_n_0\ : STD_LOGIC;
  signal \read_pointer[4]_rep_i_1_n_0\ : STD_LOGIC;
  signal \read_pointer[5]_rep_i_1_n_0\ : STD_LOGIC;
  signal \read_pointer[7]_i_1_n_0\ : STD_LOGIC;
  signal \read_pointer[7]_i_2_n_0\ : STD_LOGIC;
  signal \read_pointer[7]_i_4_n_0\ : STD_LOGIC;
  signal \^read_pointer_reg[5]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^read_pointer_reg[5]_rep_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal tx_done_i_1_n_0 : STD_LOGIC;
  signal tx_done_reg_n_0 : STD_LOGIC;
  signal NLW_axis_tvalid0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal NLW_axis_tvalid0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_read_pointer1_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal NLW_read_pointer1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_mst_exec_state[2]_i_3\ : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_mst_exec_state_reg[0]\ : label is "INIT_COUNTER:010,SEND_STREAM:100,IDLE:001";
  attribute KEEP : string;
  attribute KEEP of \FSM_onehot_mst_exec_state_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_mst_exec_state_reg[1]\ : label is "INIT_COUNTER:010,SEND_STREAM:100,IDLE:001";
  attribute KEEP of \FSM_onehot_mst_exec_state_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_mst_exec_state_reg[2]\ : label is "INIT_COUNTER:010,SEND_STREAM:100,IDLE:001";
  attribute KEEP of \FSM_onehot_mst_exec_state_reg[2]\ : label is "yes";
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \read_pointer[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \read_pointer[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \read_pointer[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \read_pointer[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \read_pointer[6]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \read_pointer[7]_i_3\ : label is "soft_lutpair4";
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of \read_pointer_reg[0]\ : label is "read_pointer_reg[0]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[0]_rep\ : label is "read_pointer_reg[0]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[0]_rep__0\ : label is "read_pointer_reg[0]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[1]\ : label is "read_pointer_reg[1]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[1]_rep\ : label is "read_pointer_reg[1]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[1]_rep__0\ : label is "read_pointer_reg[1]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[1]_rep__1\ : label is "read_pointer_reg[1]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[2]\ : label is "read_pointer_reg[2]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[2]_rep\ : label is "read_pointer_reg[2]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[2]_rep__0\ : label is "read_pointer_reg[2]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[2]_rep__1\ : label is "read_pointer_reg[2]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[3]\ : label is "read_pointer_reg[3]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[3]_rep\ : label is "read_pointer_reg[3]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[3]_rep__0\ : label is "read_pointer_reg[3]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[4]\ : label is "read_pointer_reg[4]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[4]_rep\ : label is "read_pointer_reg[4]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[5]\ : label is "read_pointer_reg[5]";
  attribute ORIG_CELL_NAME of \read_pointer_reg[5]_rep\ : label is "read_pointer_reg[5]";
begin
  ADDRB(4 downto 0) <= \^addrb\(4 downto 0);
  ADDRG(3 downto 0) <= \^addrg\(3 downto 0);
  CO(0) <= \^co\(0);
  Q(7 downto 0) <= \^q\(7 downto 0);
  buffer_to_stream_error <= \^buffer_to_stream_error\;
  \out\(0) <= \^out\(0);
  \read_pointer_reg[5]_0\(1 downto 0) <= \^read_pointer_reg[5]_0\(1 downto 0);
  \read_pointer_reg[5]_rep_0\(0) <= \^read_pointer_reg[5]_rep_0\(0);
\FSM_onehot_mst_exec_state[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^out\(0),
      I1 => tx_done_reg_n_0,
      O => \FSM_onehot_mst_exec_state[0]_i_1_n_0\
    );
\FSM_onehot_mst_exec_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => read_pointer,
      I1 => \FSM_onehot_mst_exec_state[2]_i_3_n_0\,
      I2 => count,
      O => \FSM_onehot_mst_exec_state[1]_i_1_n_0\
    );
\FSM_onehot_mst_exec_state[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEA"
    )
        port map (
      I0 => \^out\(0),
      I1 => read_pointer,
      I2 => read_en,
      I3 => count,
      O => \FSM_onehot_mst_exec_state[2]_i_1_n_0\
    );
\FSM_onehot_mst_exec_state[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \FSM_onehot_mst_exec_state[2]_i_3_n_0\,
      I1 => count,
      I2 => tx_done_reg_n_0,
      I3 => \^out\(0),
      O => \FSM_onehot_mst_exec_state[2]_i_2_n_0\
    );
\FSM_onehot_mst_exec_state[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \count_reg_n_0_[3]\,
      I1 => \count_reg_n_0_[1]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => \count_reg_n_0_[4]\,
      I4 => \count_reg_n_0_[2]\,
      O => \FSM_onehot_mst_exec_state[2]_i_3_n_0\
    );
\FSM_onehot_mst_exec_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => m00_axis_aclk,
      CE => \FSM_onehot_mst_exec_state[2]_i_1_n_0\,
      D => \FSM_onehot_mst_exec_state[0]_i_1_n_0\,
      Q => read_pointer,
      S => buffer_to_stream_error_i_1_n_0
    );
\FSM_onehot_mst_exec_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => \FSM_onehot_mst_exec_state[2]_i_1_n_0\,
      D => \FSM_onehot_mst_exec_state[1]_i_1_n_0\,
      Q => count,
      R => buffer_to_stream_error_i_1_n_0
    );
\FSM_onehot_mst_exec_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => \FSM_onehot_mst_exec_state[2]_i_1_n_0\,
      D => \FSM_onehot_mst_exec_state[2]_i_2_n_0\,
      Q => \^out\(0),
      R => buffer_to_stream_error_i_1_n_0
    );
axis_tlast_delay_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4002100808400210"
    )
        port map (
      I0 => \^q\(0),
      I1 => \num_packets_reg[7]\(2),
      I2 => \num_packets_reg[7]\(0),
      I3 => \num_packets_reg[7]\(1),
      I4 => \^q\(2),
      I5 => \^read_pointer_reg[5]_0\(0),
      O => axis_tlast_delay_reg_0
    );
axis_tlast_delay_reg: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \num_packets_reg[6]\,
      Q => m00_axis_tlast,
      R => buffer_to_stream_error_i_1_n_0
    );
axis_tvalid0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7 downto 4) => NLW_axis_tvalid0_carry_CO_UNCONNECTED(7 downto 4),
      CO(3) => \^co\(0),
      CO(2) => axis_tvalid0_carry_n_5,
      CO(1) => axis_tvalid0_carry_n_6,
      CO(0) => axis_tvalid0_carry_n_7,
      DI(7 downto 4) => B"0000",
      DI(3 downto 0) => DI(3 downto 0),
      O(7 downto 0) => NLW_axis_tvalid0_carry_O_UNCONNECTED(7 downto 0),
      S(7 downto 4) => B"0000",
      S(3 downto 0) => S(3 downto 0)
    );
axis_tvalid_delay_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^out\(0),
      I1 => \^co\(0),
      O => axis_tvalid
    );
axis_tvalid_delay_reg: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => '1',
      D => axis_tvalid,
      Q => m00_axis_tvalid,
      R => buffer_to_stream_error_i_1_n_0
    );
buffer_to_stream_error_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => m00_axis_aresetn,
      O => buffer_to_stream_error_i_1_n_0
    );
buffer_to_stream_error_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFA8"
    )
        port map (
      I0 => read_en,
      I1 => \^out\(0),
      I2 => count,
      I3 => \^buffer_to_stream_error\,
      O => buffer_to_stream_error_i_2_n_0
    );
buffer_to_stream_error_reg: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => '1',
      D => buffer_to_stream_error_i_2_n_0,
      Q => \^buffer_to_stream_error\,
      R => buffer_to_stream_error_i_1_n_0
    );
\count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      I1 => \count_reg_n_0_[1]\,
      O => \count[1]_i_1_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[1]\,
      O => \count[2]_i_1_n_0\
    );
\count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[0]\,
      I2 => \count_reg_n_0_[1]\,
      I3 => \count_reg_n_0_[3]\,
      O => \count[3]_i_1_n_0\
    );
\count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
        port map (
      I0 => \count_reg_n_0_[2]\,
      I1 => \count_reg_n_0_[4]\,
      I2 => \count_reg_n_0_[0]\,
      I3 => \count_reg_n_0_[1]\,
      I4 => \count_reg_n_0_[3]\,
      O => \count[4]_i_1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => count,
      D => \count[0]_i_1_n_0\,
      Q => \count_reg_n_0_[0]\,
      R => buffer_to_stream_error_i_1_n_0
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => count,
      D => \count[1]_i_1_n_0\,
      Q => \count_reg_n_0_[1]\,
      R => buffer_to_stream_error_i_1_n_0
    );
\count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => count,
      D => \count[2]_i_1_n_0\,
      Q => \count_reg_n_0_[2]\,
      R => buffer_to_stream_error_i_1_n_0
    );
\count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => count,
      D => \count[3]_i_1_n_0\,
      Q => \count_reg_n_0_[3]\,
      R => buffer_to_stream_error_i_1_n_0
    );
\count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => count,
      D => \count[4]_i_1_n_0\,
      Q => \count_reg_n_0_[4]\,
      R => buffer_to_stream_error_i_1_n_0
    );
read_pointer1_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7 downto 5) => NLW_read_pointer1_carry_CO_UNCONNECTED(7 downto 5),
      CO(4) => read_pointer1,
      CO(3) => NLW_read_pointer1_carry_CO_UNCONNECTED(3),
      CO(2) => read_pointer1_carry_n_5,
      CO(1) => read_pointer1_carry_n_6,
      CO(0) => read_pointer1_carry_n_7,
      DI(7 downto 4) => B"0000",
      DI(3) => read_pointer1_carry_i_1_n_0,
      DI(2) => read_pointer1_carry_i_2_n_0,
      DI(1) => read_pointer1_carry_i_3_n_0,
      DI(0) => \num_packets_reg[0]\(0),
      O(7 downto 0) => NLW_read_pointer1_carry_O_UNCONNECTED(7 downto 0),
      S(7 downto 5) => B"000",
      S(4) => read_pointer1_carry_i_5_n_0,
      S(3) => read_pointer1_carry_i_6_n_0,
      S(2) => read_pointer1_carry_i_7_n_0,
      S(1) => read_pointer1_carry_i_8_n_0,
      S(0) => \num_packets_reg[0]_0\(0)
    );
read_pointer1_carry_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C2BF8002"
    )
        port map (
      I0 => \num_packets_reg[7]\(6),
      I1 => \read_pointer[7]_i_4_n_0\,
      I2 => \^q\(6),
      I3 => \^q\(7),
      I4 => \num_packets_reg[7]\(7),
      O => read_pointer1_carry_i_1_n_0
    );
read_pointer1_carry_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^addrb\(3),
      I1 => \^addrb\(1),
      I2 => \^addrb\(0),
      I3 => \^read_pointer_reg[5]_rep_0\(0),
      O => read_pointer1_carry_i_10_n_0
    );
read_pointer1_carry_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C2BF8002"
    )
        port map (
      I0 => \num_packets_reg[7]\(4),
      I1 => read_pointer1_carry_i_10_n_0,
      I2 => \^addrg\(3),
      I3 => \^q\(5),
      I4 => \num_packets_reg[7]\(5),
      O => read_pointer1_carry_i_2_n_0
    );
read_pointer1_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C02ABFFF8000002A"
    )
        port map (
      I0 => \num_packets_reg[7]\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(3),
      I5 => \num_packets_reg[7]\(3),
      O => read_pointer1_carry_i_3_n_0
    );
read_pointer1_carry_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \^q\(7),
      I1 => \read_pointer[7]_i_4_n_0\,
      I2 => \^q\(6),
      O => read_pointer1_carry_i_5_n_0
    );
read_pointer1_carry_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"18844221"
    )
        port map (
      I0 => \num_packets_reg[7]\(6),
      I1 => \num_packets_reg[7]\(7),
      I2 => \read_pointer[7]_i_4_n_0\,
      I3 => \^q\(6),
      I4 => \^q\(7),
      O => read_pointer1_carry_i_6_n_0
    );
read_pointer1_carry_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"18844221"
    )
        port map (
      I0 => \num_packets_reg[7]\(4),
      I1 => \num_packets_reg[7]\(5),
      I2 => read_pointer1_carry_i_10_n_0,
      I3 => \^addrg\(3),
      I4 => \^q\(5),
      O => read_pointer1_carry_i_7_n_0
    );
read_pointer1_carry_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1888844442222111"
    )
        port map (
      I0 => \num_packets_reg[7]\(2),
      I1 => \num_packets_reg[7]\(3),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(2),
      I5 => \^q\(3),
      O => read_pointer1_carry_i_8_n_0
    );
\read_pointer[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \read_pointer[0]_i_1_n_0\
    );
\read_pointer[0]_rep_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \read_pointer[0]_rep_i_1_n_0\
    );
\read_pointer[0]_rep_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \read_pointer[0]_rep_i_1__0_n_0\
    );
\read_pointer[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => p_0_in(1)
    );
\read_pointer[1]_rep_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \read_pointer[1]_rep_i_1_n_0\
    );
\read_pointer[1]_rep_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \read_pointer[1]_rep_i_1__0_n_0\
    );
\read_pointer[1]_rep_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \read_pointer[1]_rep_i_1__1_n_0\
    );
\read_pointer[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => read_pointer2(2)
    );
\read_pointer[2]_rep_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \read_pointer[2]_rep_i_1_n_0\
    );
\read_pointer[2]_rep_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^addrg\(1),
      I2 => \^q\(2),
      O => \read_pointer[2]_rep_i_1__0_n_0\
    );
\read_pointer[2]_rep_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^addrg\(1),
      I2 => \^q\(2),
      O => \read_pointer[2]_rep_i_1__1_n_0\
    );
\read_pointer[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^addrg\(1),
      I1 => \^addrg\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => read_pointer2(3)
    );
\read_pointer[3]_rep_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^addrg\(1),
      I1 => \^addrg\(0),
      I2 => \^addrg\(2),
      I3 => \^q\(3),
      O => \read_pointer[3]_rep_i_1_n_0\
    );
\read_pointer[3]_rep_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^addrg\(1),
      I1 => \^addrg\(0),
      I2 => \^addrg\(2),
      I3 => \^q\(3),
      O => \read_pointer[3]_rep_i_1__0_n_0\
    );
\read_pointer[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^addrg\(2),
      I1 => \^q\(0),
      I2 => \^read_pointer_reg[5]_0\(0),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => read_pointer2(4)
    );
\read_pointer[4]_rep_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^addrg\(2),
      I1 => \^addrg\(0),
      I2 => \^addrg\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \read_pointer[4]_rep_i_1_n_0\
    );
\read_pointer[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^read_pointer_reg[5]_0\(1),
      I1 => \^addrg\(1),
      I2 => \^addrg\(0),
      I3 => \^addrg\(2),
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => read_pointer2(5)
    );
\read_pointer[5]_rep_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^addrb\(3),
      I1 => \^addrb\(1),
      I2 => \^addrb\(0),
      I3 => \^read_pointer_reg[5]_rep_0\(0),
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => \read_pointer[5]_rep_i_1_n_0\
    );
\read_pointer[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \read_pointer[7]_i_4_n_0\,
      I1 => \^q\(6),
      O => read_pointer2(6)
    );
\read_pointer[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => read_pointer,
      I1 => m00_axis_aresetn,
      O => \read_pointer[7]_i_1_n_0\
    );
\read_pointer[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => read_pointer1,
      I1 => \^out\(0),
      I2 => \^co\(0),
      I3 => m00_axis_tready,
      O => \read_pointer[7]_i_2_n_0\
    );
\read_pointer[7]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \read_pointer[7]_i_4_n_0\,
      I1 => \^q\(6),
      I2 => \^q\(7),
      O => read_pointer2(7)
    );
\read_pointer[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^addrb\(3),
      I2 => \^addrb\(1),
      I3 => \^addrb\(0),
      I4 => \^read_pointer_reg[5]_rep_0\(0),
      I5 => \^addrg\(3),
      O => \read_pointer[7]_i_4_n_0\
    );
\read_pointer_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[0]_i_1_n_0\,
      Q => \^q\(0),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[0]_rep\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[0]_rep_i_1_n_0\,
      Q => \^addrb\(0),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[0]_rep__0\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[0]_rep_i_1__0_n_0\,
      Q => \^addrg\(0),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => p_0_in(1),
      Q => \^q\(1),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[1]_rep\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[1]_rep_i_1_n_0\,
      Q => \^addrg\(1),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[1]_rep__0\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[1]_rep_i_1__0_n_0\,
      Q => \^addrb\(1),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[1]_rep__1\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[1]_rep_i_1__1_n_0\,
      Q => \^read_pointer_reg[5]_0\(0),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => read_pointer2(2),
      Q => \^q\(2),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[2]_rep\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[2]_rep_i_1_n_0\,
      Q => \^addrg\(2),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[2]_rep__0\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[2]_rep_i_1__0_n_0\,
      Q => \^addrb\(2),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[2]_rep__1\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[2]_rep_i_1__1_n_0\,
      Q => \^read_pointer_reg[5]_rep_0\(0),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => read_pointer2(3),
      Q => \^q\(3),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[3]_rep\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[3]_rep_i_1_n_0\,
      Q => \^addrb\(3),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[3]_rep__0\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[3]_rep_i_1__0_n_0\,
      Q => \^read_pointer_reg[5]_0\(1),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => read_pointer2(4),
      Q => \^q\(4),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[4]_rep\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[4]_rep_i_1_n_0\,
      Q => \^addrg\(3),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => read_pointer2(5),
      Q => \^q\(5),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[5]_rep\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => \read_pointer[5]_rep_i_1_n_0\,
      Q => \^addrb\(4),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => read_pointer2(6),
      Q => \^q\(6),
      R => \read_pointer[7]_i_1_n_0\
    );
\read_pointer_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \read_pointer[7]_i_2_n_0\,
      D => read_pointer2(7),
      Q => \^q\(7),
      R => \read_pointer[7]_i_1_n_0\
    );
\stream_data_out_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(0),
      Q => m00_axis_tdata(0),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(10),
      Q => m00_axis_tdata(10),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(11),
      Q => m00_axis_tdata(11),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(12),
      Q => m00_axis_tdata(12),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(13),
      Q => m00_axis_tdata(13),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(14),
      Q => m00_axis_tdata(14),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(15),
      Q => m00_axis_tdata(15),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(16),
      Q => m00_axis_tdata(16),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(17),
      Q => m00_axis_tdata(17),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(18),
      Q => m00_axis_tdata(18),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(19),
      Q => m00_axis_tdata(19),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(1),
      Q => m00_axis_tdata(1),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(20),
      Q => m00_axis_tdata(20),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(21),
      Q => m00_axis_tdata(21),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(22),
      Q => m00_axis_tdata(22),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(23),
      Q => m00_axis_tdata(23),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(24),
      Q => m00_axis_tdata(24),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(25),
      Q => m00_axis_tdata(25),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(26),
      Q => m00_axis_tdata(26),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(27),
      Q => m00_axis_tdata(27),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(28),
      Q => m00_axis_tdata(28),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(29),
      Q => m00_axis_tdata(29),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(2),
      Q => m00_axis_tdata(2),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(30),
      Q => m00_axis_tdata(30),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(31),
      Q => m00_axis_tdata(31),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(3),
      Q => m00_axis_tdata(3),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(4),
      Q => m00_axis_tdata(4),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(5),
      Q => m00_axis_tdata(5),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(6),
      Q => m00_axis_tdata(6),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(7),
      Q => m00_axis_tdata(7),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(8),
      Q => m00_axis_tdata(8),
      R => buffer_to_stream_error_i_1_n_0
    );
\stream_data_out_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => E(0),
      D => D(9),
      Q => m00_axis_tdata(9),
      R => buffer_to_stream_error_i_1_n_0
    );
tx_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000A000E000E0"
    )
        port map (
      I0 => tx_done_reg_n_0,
      I1 => \tx_done0__14\,
      I2 => m00_axis_aresetn,
      I3 => read_pointer,
      I4 => E(0),
      I5 => read_pointer1,
      O => tx_done_i_1_n_0
    );
tx_done_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^addrb\(3),
      I1 => \num_packets_reg[7]\(3),
      I2 => \num_packets_reg[7]\(5),
      I3 => \^q\(5),
      I4 => \num_packets_reg[7]\(4),
      I5 => \^addrg\(3),
      O => tx_done_reg_0
    );
tx_done_reg: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => '1',
      D => tx_done_i_1_n_0,
      Q => tx_done_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity streaming_AXIStreamPacketBuffer_0_1_DoubleBuffer is
  port (
    read_en : out STD_LOGIC;
    buffer_overflow_error : out STD_LOGIC;
    axis_tlast_delay_reg : out STD_LOGIC;
    axis_tlast_delay_reg_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    D : out STD_LOGIC_VECTOR ( 31 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    DI : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \read_pointer_reg[0]_rep__0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \read_pointer_reg[0]_rep__0_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \tx_done0__14\ : out STD_LOGIC;
    clk : in STD_LOGIC;
    packet : in STD_LOGIC_VECTOR ( 29 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ADDRG : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ADDRB : in STD_LOGIC_VECTOR ( 4 downto 0 );
    \read_pointer_reg[2]_rep__1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \read_pointer_reg[3]_rep__0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rst : in STD_LOGIC;
    tick : in STD_LOGIC;
    packet_valid : in STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \read_pointer_reg[3]_rep\ : in STD_LOGIC;
    \read_pointer_reg[0]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of streaming_AXIStreamPacketBuffer_0_1_DoubleBuffer : entity is "DoubleBuffer";
end streaming_AXIStreamPacketBuffer_0_1_DoubleBuffer;

architecture STRUCTURE of streaming_AXIStreamPacketBuffer_0_1_DoubleBuffer is
  signal axis_tlast_delay_i_2_n_0 : STD_LOGIC;
  signal axis_tlast_delay_i_3_n_0 : STD_LOGIC;
  signal axis_tlast_delay_i_5_n_0 : STD_LOGIC;
  signal axis_tlast_delay_i_6_n_0 : STD_LOGIC;
  signal axis_tlast_delay_i_7_n_0 : STD_LOGIC;
  signal \^axis_tlast_delay_reg_0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal buffer_0_reg_0_63_0_6_i_1_n_0 : STD_LOGIC;
  signal buffer_0_reg_0_63_0_6_n_0 : STD_LOGIC;
  signal buffer_0_reg_0_63_0_6_n_1 : STD_LOGIC;
  signal buffer_0_reg_0_63_0_6_n_2 : STD_LOGIC;
  signal buffer_0_reg_0_63_0_6_n_3 : STD_LOGIC;
  signal buffer_0_reg_0_63_0_6_n_4 : STD_LOGIC;
  signal buffer_0_reg_0_63_0_6_n_5 : STD_LOGIC;
  signal buffer_0_reg_0_63_0_6_n_6 : STD_LOGIC;
  signal buffer_0_reg_0_63_14_20_n_0 : STD_LOGIC;
  signal buffer_0_reg_0_63_14_20_n_1 : STD_LOGIC;
  signal buffer_0_reg_0_63_14_20_n_2 : STD_LOGIC;
  signal buffer_0_reg_0_63_14_20_n_3 : STD_LOGIC;
  signal buffer_0_reg_0_63_14_20_n_4 : STD_LOGIC;
  signal buffer_0_reg_0_63_14_20_n_5 : STD_LOGIC;
  signal buffer_0_reg_0_63_14_20_n_6 : STD_LOGIC;
  signal buffer_0_reg_0_63_21_27_n_0 : STD_LOGIC;
  signal buffer_0_reg_0_63_21_27_n_1 : STD_LOGIC;
  signal buffer_0_reg_0_63_21_27_n_2 : STD_LOGIC;
  signal buffer_0_reg_0_63_21_27_n_3 : STD_LOGIC;
  signal buffer_0_reg_0_63_21_27_n_4 : STD_LOGIC;
  signal buffer_0_reg_0_63_21_27_n_5 : STD_LOGIC;
  signal buffer_0_reg_0_63_21_27_n_6 : STD_LOGIC;
  signal buffer_0_reg_0_63_28_31_n_0 : STD_LOGIC;
  signal buffer_0_reg_0_63_28_31_n_1 : STD_LOGIC;
  signal buffer_0_reg_0_63_28_31_n_2 : STD_LOGIC;
  signal buffer_0_reg_0_63_28_31_n_3 : STD_LOGIC;
  signal buffer_0_reg_0_63_7_13_n_0 : STD_LOGIC;
  signal buffer_0_reg_0_63_7_13_n_1 : STD_LOGIC;
  signal buffer_0_reg_0_63_7_13_n_2 : STD_LOGIC;
  signal buffer_0_reg_0_63_7_13_n_3 : STD_LOGIC;
  signal buffer_0_reg_0_63_7_13_n_4 : STD_LOGIC;
  signal buffer_0_reg_0_63_7_13_n_5 : STD_LOGIC;
  signal buffer_0_reg_0_63_7_13_n_6 : STD_LOGIC;
  signal buffer_0_reg_128_191_0_6_i_1_n_0 : STD_LOGIC;
  signal buffer_0_reg_128_191_0_6_n_0 : STD_LOGIC;
  signal buffer_0_reg_128_191_0_6_n_1 : STD_LOGIC;
  signal buffer_0_reg_128_191_0_6_n_2 : STD_LOGIC;
  signal buffer_0_reg_128_191_0_6_n_3 : STD_LOGIC;
  signal buffer_0_reg_128_191_0_6_n_4 : STD_LOGIC;
  signal buffer_0_reg_128_191_0_6_n_5 : STD_LOGIC;
  signal buffer_0_reg_128_191_0_6_n_6 : STD_LOGIC;
  signal buffer_0_reg_128_191_14_20_n_0 : STD_LOGIC;
  signal buffer_0_reg_128_191_14_20_n_1 : STD_LOGIC;
  signal buffer_0_reg_128_191_14_20_n_2 : STD_LOGIC;
  signal buffer_0_reg_128_191_14_20_n_3 : STD_LOGIC;
  signal buffer_0_reg_128_191_14_20_n_4 : STD_LOGIC;
  signal buffer_0_reg_128_191_14_20_n_5 : STD_LOGIC;
  signal buffer_0_reg_128_191_14_20_n_6 : STD_LOGIC;
  signal buffer_0_reg_128_191_21_27_n_0 : STD_LOGIC;
  signal buffer_0_reg_128_191_21_27_n_1 : STD_LOGIC;
  signal buffer_0_reg_128_191_21_27_n_2 : STD_LOGIC;
  signal buffer_0_reg_128_191_21_27_n_3 : STD_LOGIC;
  signal buffer_0_reg_128_191_21_27_n_4 : STD_LOGIC;
  signal buffer_0_reg_128_191_21_27_n_5 : STD_LOGIC;
  signal buffer_0_reg_128_191_21_27_n_6 : STD_LOGIC;
  signal buffer_0_reg_128_191_28_31_n_0 : STD_LOGIC;
  signal buffer_0_reg_128_191_28_31_n_1 : STD_LOGIC;
  signal buffer_0_reg_128_191_28_31_n_2 : STD_LOGIC;
  signal buffer_0_reg_128_191_28_31_n_3 : STD_LOGIC;
  signal buffer_0_reg_128_191_7_13_n_0 : STD_LOGIC;
  signal buffer_0_reg_128_191_7_13_n_1 : STD_LOGIC;
  signal buffer_0_reg_128_191_7_13_n_2 : STD_LOGIC;
  signal buffer_0_reg_128_191_7_13_n_3 : STD_LOGIC;
  signal buffer_0_reg_128_191_7_13_n_4 : STD_LOGIC;
  signal buffer_0_reg_128_191_7_13_n_5 : STD_LOGIC;
  signal buffer_0_reg_128_191_7_13_n_6 : STD_LOGIC;
  signal buffer_0_reg_192_255_0_6_i_1_n_0 : STD_LOGIC;
  signal buffer_0_reg_192_255_0_6_n_0 : STD_LOGIC;
  signal buffer_0_reg_192_255_0_6_n_1 : STD_LOGIC;
  signal buffer_0_reg_192_255_0_6_n_2 : STD_LOGIC;
  signal buffer_0_reg_192_255_0_6_n_3 : STD_LOGIC;
  signal buffer_0_reg_192_255_0_6_n_4 : STD_LOGIC;
  signal buffer_0_reg_192_255_0_6_n_5 : STD_LOGIC;
  signal buffer_0_reg_192_255_0_6_n_6 : STD_LOGIC;
  signal buffer_0_reg_192_255_14_20_n_0 : STD_LOGIC;
  signal buffer_0_reg_192_255_14_20_n_1 : STD_LOGIC;
  signal buffer_0_reg_192_255_14_20_n_2 : STD_LOGIC;
  signal buffer_0_reg_192_255_14_20_n_3 : STD_LOGIC;
  signal buffer_0_reg_192_255_14_20_n_4 : STD_LOGIC;
  signal buffer_0_reg_192_255_14_20_n_5 : STD_LOGIC;
  signal buffer_0_reg_192_255_14_20_n_6 : STD_LOGIC;
  signal buffer_0_reg_192_255_21_27_n_0 : STD_LOGIC;
  signal buffer_0_reg_192_255_21_27_n_1 : STD_LOGIC;
  signal buffer_0_reg_192_255_21_27_n_2 : STD_LOGIC;
  signal buffer_0_reg_192_255_21_27_n_3 : STD_LOGIC;
  signal buffer_0_reg_192_255_21_27_n_4 : STD_LOGIC;
  signal buffer_0_reg_192_255_21_27_n_5 : STD_LOGIC;
  signal buffer_0_reg_192_255_21_27_n_6 : STD_LOGIC;
  signal buffer_0_reg_192_255_28_31_n_0 : STD_LOGIC;
  signal buffer_0_reg_192_255_28_31_n_1 : STD_LOGIC;
  signal buffer_0_reg_192_255_28_31_n_2 : STD_LOGIC;
  signal buffer_0_reg_192_255_28_31_n_3 : STD_LOGIC;
  signal buffer_0_reg_192_255_7_13_n_0 : STD_LOGIC;
  signal buffer_0_reg_192_255_7_13_n_1 : STD_LOGIC;
  signal buffer_0_reg_192_255_7_13_n_2 : STD_LOGIC;
  signal buffer_0_reg_192_255_7_13_n_3 : STD_LOGIC;
  signal buffer_0_reg_192_255_7_13_n_4 : STD_LOGIC;
  signal buffer_0_reg_192_255_7_13_n_5 : STD_LOGIC;
  signal buffer_0_reg_192_255_7_13_n_6 : STD_LOGIC;
  signal buffer_0_reg_64_127_0_6_i_1_n_0 : STD_LOGIC;
  signal buffer_0_reg_64_127_0_6_n_0 : STD_LOGIC;
  signal buffer_0_reg_64_127_0_6_n_1 : STD_LOGIC;
  signal buffer_0_reg_64_127_0_6_n_2 : STD_LOGIC;
  signal buffer_0_reg_64_127_0_6_n_3 : STD_LOGIC;
  signal buffer_0_reg_64_127_0_6_n_4 : STD_LOGIC;
  signal buffer_0_reg_64_127_0_6_n_5 : STD_LOGIC;
  signal buffer_0_reg_64_127_0_6_n_6 : STD_LOGIC;
  signal buffer_0_reg_64_127_14_20_n_0 : STD_LOGIC;
  signal buffer_0_reg_64_127_14_20_n_1 : STD_LOGIC;
  signal buffer_0_reg_64_127_14_20_n_2 : STD_LOGIC;
  signal buffer_0_reg_64_127_14_20_n_3 : STD_LOGIC;
  signal buffer_0_reg_64_127_14_20_n_4 : STD_LOGIC;
  signal buffer_0_reg_64_127_14_20_n_5 : STD_LOGIC;
  signal buffer_0_reg_64_127_14_20_n_6 : STD_LOGIC;
  signal buffer_0_reg_64_127_21_27_n_0 : STD_LOGIC;
  signal buffer_0_reg_64_127_21_27_n_1 : STD_LOGIC;
  signal buffer_0_reg_64_127_21_27_n_2 : STD_LOGIC;
  signal buffer_0_reg_64_127_21_27_n_3 : STD_LOGIC;
  signal buffer_0_reg_64_127_21_27_n_4 : STD_LOGIC;
  signal buffer_0_reg_64_127_21_27_n_5 : STD_LOGIC;
  signal buffer_0_reg_64_127_21_27_n_6 : STD_LOGIC;
  signal buffer_0_reg_64_127_28_31_n_0 : STD_LOGIC;
  signal buffer_0_reg_64_127_28_31_n_1 : STD_LOGIC;
  signal buffer_0_reg_64_127_28_31_n_2 : STD_LOGIC;
  signal buffer_0_reg_64_127_28_31_n_3 : STD_LOGIC;
  signal buffer_0_reg_64_127_7_13_n_0 : STD_LOGIC;
  signal buffer_0_reg_64_127_7_13_n_1 : STD_LOGIC;
  signal buffer_0_reg_64_127_7_13_n_2 : STD_LOGIC;
  signal buffer_0_reg_64_127_7_13_n_3 : STD_LOGIC;
  signal buffer_0_reg_64_127_7_13_n_4 : STD_LOGIC;
  signal buffer_0_reg_64_127_7_13_n_5 : STD_LOGIC;
  signal buffer_0_reg_64_127_7_13_n_6 : STD_LOGIC;
  signal buffer_1_reg_0_63_0_6_i_1_n_0 : STD_LOGIC;
  signal buffer_1_reg_0_63_0_6_n_0 : STD_LOGIC;
  signal buffer_1_reg_0_63_0_6_n_1 : STD_LOGIC;
  signal buffer_1_reg_0_63_0_6_n_2 : STD_LOGIC;
  signal buffer_1_reg_0_63_0_6_n_3 : STD_LOGIC;
  signal buffer_1_reg_0_63_0_6_n_4 : STD_LOGIC;
  signal buffer_1_reg_0_63_0_6_n_5 : STD_LOGIC;
  signal buffer_1_reg_0_63_0_6_n_6 : STD_LOGIC;
  signal buffer_1_reg_0_63_14_20_n_0 : STD_LOGIC;
  signal buffer_1_reg_0_63_14_20_n_1 : STD_LOGIC;
  signal buffer_1_reg_0_63_14_20_n_2 : STD_LOGIC;
  signal buffer_1_reg_0_63_14_20_n_3 : STD_LOGIC;
  signal buffer_1_reg_0_63_14_20_n_4 : STD_LOGIC;
  signal buffer_1_reg_0_63_14_20_n_5 : STD_LOGIC;
  signal buffer_1_reg_0_63_14_20_n_6 : STD_LOGIC;
  signal buffer_1_reg_0_63_21_27_n_0 : STD_LOGIC;
  signal buffer_1_reg_0_63_21_27_n_1 : STD_LOGIC;
  signal buffer_1_reg_0_63_21_27_n_2 : STD_LOGIC;
  signal buffer_1_reg_0_63_21_27_n_3 : STD_LOGIC;
  signal buffer_1_reg_0_63_21_27_n_4 : STD_LOGIC;
  signal buffer_1_reg_0_63_21_27_n_5 : STD_LOGIC;
  signal buffer_1_reg_0_63_21_27_n_6 : STD_LOGIC;
  signal buffer_1_reg_0_63_28_31_n_0 : STD_LOGIC;
  signal buffer_1_reg_0_63_28_31_n_1 : STD_LOGIC;
  signal buffer_1_reg_0_63_28_31_n_2 : STD_LOGIC;
  signal buffer_1_reg_0_63_28_31_n_3 : STD_LOGIC;
  signal buffer_1_reg_0_63_7_13_n_0 : STD_LOGIC;
  signal buffer_1_reg_0_63_7_13_n_1 : STD_LOGIC;
  signal buffer_1_reg_0_63_7_13_n_2 : STD_LOGIC;
  signal buffer_1_reg_0_63_7_13_n_3 : STD_LOGIC;
  signal buffer_1_reg_0_63_7_13_n_4 : STD_LOGIC;
  signal buffer_1_reg_0_63_7_13_n_5 : STD_LOGIC;
  signal buffer_1_reg_0_63_7_13_n_6 : STD_LOGIC;
  signal buffer_1_reg_128_191_0_6_i_1_n_0 : STD_LOGIC;
  signal buffer_1_reg_128_191_0_6_n_0 : STD_LOGIC;
  signal buffer_1_reg_128_191_0_6_n_1 : STD_LOGIC;
  signal buffer_1_reg_128_191_0_6_n_2 : STD_LOGIC;
  signal buffer_1_reg_128_191_0_6_n_3 : STD_LOGIC;
  signal buffer_1_reg_128_191_0_6_n_4 : STD_LOGIC;
  signal buffer_1_reg_128_191_0_6_n_5 : STD_LOGIC;
  signal buffer_1_reg_128_191_0_6_n_6 : STD_LOGIC;
  signal buffer_1_reg_128_191_14_20_n_0 : STD_LOGIC;
  signal buffer_1_reg_128_191_14_20_n_1 : STD_LOGIC;
  signal buffer_1_reg_128_191_14_20_n_2 : STD_LOGIC;
  signal buffer_1_reg_128_191_14_20_n_3 : STD_LOGIC;
  signal buffer_1_reg_128_191_14_20_n_4 : STD_LOGIC;
  signal buffer_1_reg_128_191_14_20_n_5 : STD_LOGIC;
  signal buffer_1_reg_128_191_14_20_n_6 : STD_LOGIC;
  signal buffer_1_reg_128_191_21_27_n_0 : STD_LOGIC;
  signal buffer_1_reg_128_191_21_27_n_1 : STD_LOGIC;
  signal buffer_1_reg_128_191_21_27_n_2 : STD_LOGIC;
  signal buffer_1_reg_128_191_21_27_n_3 : STD_LOGIC;
  signal buffer_1_reg_128_191_21_27_n_4 : STD_LOGIC;
  signal buffer_1_reg_128_191_21_27_n_5 : STD_LOGIC;
  signal buffer_1_reg_128_191_21_27_n_6 : STD_LOGIC;
  signal buffer_1_reg_128_191_28_31_n_0 : STD_LOGIC;
  signal buffer_1_reg_128_191_28_31_n_1 : STD_LOGIC;
  signal buffer_1_reg_128_191_28_31_n_2 : STD_LOGIC;
  signal buffer_1_reg_128_191_28_31_n_3 : STD_LOGIC;
  signal buffer_1_reg_128_191_7_13_n_0 : STD_LOGIC;
  signal buffer_1_reg_128_191_7_13_n_1 : STD_LOGIC;
  signal buffer_1_reg_128_191_7_13_n_2 : STD_LOGIC;
  signal buffer_1_reg_128_191_7_13_n_3 : STD_LOGIC;
  signal buffer_1_reg_128_191_7_13_n_4 : STD_LOGIC;
  signal buffer_1_reg_128_191_7_13_n_5 : STD_LOGIC;
  signal buffer_1_reg_128_191_7_13_n_6 : STD_LOGIC;
  signal buffer_1_reg_192_255_0_6_i_1_n_0 : STD_LOGIC;
  signal buffer_1_reg_192_255_0_6_n_0 : STD_LOGIC;
  signal buffer_1_reg_192_255_0_6_n_1 : STD_LOGIC;
  signal buffer_1_reg_192_255_0_6_n_2 : STD_LOGIC;
  signal buffer_1_reg_192_255_0_6_n_3 : STD_LOGIC;
  signal buffer_1_reg_192_255_0_6_n_4 : STD_LOGIC;
  signal buffer_1_reg_192_255_0_6_n_5 : STD_LOGIC;
  signal buffer_1_reg_192_255_0_6_n_6 : STD_LOGIC;
  signal buffer_1_reg_192_255_14_20_n_0 : STD_LOGIC;
  signal buffer_1_reg_192_255_14_20_n_1 : STD_LOGIC;
  signal buffer_1_reg_192_255_14_20_n_2 : STD_LOGIC;
  signal buffer_1_reg_192_255_14_20_n_3 : STD_LOGIC;
  signal buffer_1_reg_192_255_14_20_n_4 : STD_LOGIC;
  signal buffer_1_reg_192_255_14_20_n_5 : STD_LOGIC;
  signal buffer_1_reg_192_255_14_20_n_6 : STD_LOGIC;
  signal buffer_1_reg_192_255_21_27_n_0 : STD_LOGIC;
  signal buffer_1_reg_192_255_21_27_n_1 : STD_LOGIC;
  signal buffer_1_reg_192_255_21_27_n_2 : STD_LOGIC;
  signal buffer_1_reg_192_255_21_27_n_3 : STD_LOGIC;
  signal buffer_1_reg_192_255_21_27_n_4 : STD_LOGIC;
  signal buffer_1_reg_192_255_21_27_n_5 : STD_LOGIC;
  signal buffer_1_reg_192_255_21_27_n_6 : STD_LOGIC;
  signal buffer_1_reg_192_255_28_31_n_0 : STD_LOGIC;
  signal buffer_1_reg_192_255_28_31_n_1 : STD_LOGIC;
  signal buffer_1_reg_192_255_28_31_n_2 : STD_LOGIC;
  signal buffer_1_reg_192_255_28_31_n_3 : STD_LOGIC;
  signal buffer_1_reg_192_255_7_13_n_0 : STD_LOGIC;
  signal buffer_1_reg_192_255_7_13_n_1 : STD_LOGIC;
  signal buffer_1_reg_192_255_7_13_n_2 : STD_LOGIC;
  signal buffer_1_reg_192_255_7_13_n_3 : STD_LOGIC;
  signal buffer_1_reg_192_255_7_13_n_4 : STD_LOGIC;
  signal buffer_1_reg_192_255_7_13_n_5 : STD_LOGIC;
  signal buffer_1_reg_192_255_7_13_n_6 : STD_LOGIC;
  signal buffer_1_reg_64_127_0_6_i_1_n_0 : STD_LOGIC;
  signal buffer_1_reg_64_127_0_6_n_0 : STD_LOGIC;
  signal buffer_1_reg_64_127_0_6_n_1 : STD_LOGIC;
  signal buffer_1_reg_64_127_0_6_n_2 : STD_LOGIC;
  signal buffer_1_reg_64_127_0_6_n_3 : STD_LOGIC;
  signal buffer_1_reg_64_127_0_6_n_4 : STD_LOGIC;
  signal buffer_1_reg_64_127_0_6_n_5 : STD_LOGIC;
  signal buffer_1_reg_64_127_0_6_n_6 : STD_LOGIC;
  signal buffer_1_reg_64_127_14_20_n_0 : STD_LOGIC;
  signal buffer_1_reg_64_127_14_20_n_1 : STD_LOGIC;
  signal buffer_1_reg_64_127_14_20_n_2 : STD_LOGIC;
  signal buffer_1_reg_64_127_14_20_n_3 : STD_LOGIC;
  signal buffer_1_reg_64_127_14_20_n_4 : STD_LOGIC;
  signal buffer_1_reg_64_127_14_20_n_5 : STD_LOGIC;
  signal buffer_1_reg_64_127_14_20_n_6 : STD_LOGIC;
  signal buffer_1_reg_64_127_21_27_n_0 : STD_LOGIC;
  signal buffer_1_reg_64_127_21_27_n_1 : STD_LOGIC;
  signal buffer_1_reg_64_127_21_27_n_2 : STD_LOGIC;
  signal buffer_1_reg_64_127_21_27_n_3 : STD_LOGIC;
  signal buffer_1_reg_64_127_21_27_n_4 : STD_LOGIC;
  signal buffer_1_reg_64_127_21_27_n_5 : STD_LOGIC;
  signal buffer_1_reg_64_127_21_27_n_6 : STD_LOGIC;
  signal buffer_1_reg_64_127_28_31_n_0 : STD_LOGIC;
  signal buffer_1_reg_64_127_28_31_n_1 : STD_LOGIC;
  signal buffer_1_reg_64_127_28_31_n_2 : STD_LOGIC;
  signal buffer_1_reg_64_127_28_31_n_3 : STD_LOGIC;
  signal buffer_1_reg_64_127_7_13_n_0 : STD_LOGIC;
  signal buffer_1_reg_64_127_7_13_n_1 : STD_LOGIC;
  signal buffer_1_reg_64_127_7_13_n_2 : STD_LOGIC;
  signal buffer_1_reg_64_127_7_13_n_3 : STD_LOGIC;
  signal buffer_1_reg_64_127_7_13_n_4 : STD_LOGIC;
  signal buffer_1_reg_64_127_7_13_n_5 : STD_LOGIC;
  signal buffer_1_reg_64_127_7_13_n_6 : STD_LOGIC;
  signal \^buffer_overflow_error\ : STD_LOGIC;
  signal buffer_overflow_error_i_1_n_0 : STD_LOGIC;
  signal buffer_overflow_error_i_2_n_0 : STD_LOGIC;
  signal curr_buffer : STD_LOGIC;
  signal curr_buffer_i_1_n_0 : STD_LOGIC;
  signal dout0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal dout00_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal tx_done_i_4_n_0 : STD_LOGIC;
  signal \write_addr[0]_i_1_n_0\ : STD_LOGIC;
  signal \write_addr[1]_i_1_n_0\ : STD_LOGIC;
  signal \write_addr[2]_i_1_n_0\ : STD_LOGIC;
  signal \write_addr[3]_i_1_n_0\ : STD_LOGIC;
  signal \write_addr[4]_i_1_n_0\ : STD_LOGIC;
  signal \write_addr[5]_i_1_n_0\ : STD_LOGIC;
  signal \write_addr[6]_i_1_n_0\ : STD_LOGIC;
  signal \write_addr[7]_i_1_n_0\ : STD_LOGIC;
  signal \write_addr[8]_i_1_n_0\ : STD_LOGIC;
  signal \write_addr[8]_i_2_n_0\ : STD_LOGIC;
  signal \write_addr[8]_i_3_n_0\ : STD_LOGIC;
  signal \write_addr_reg_n_0_[0]\ : STD_LOGIC;
  signal \write_addr_reg_n_0_[1]\ : STD_LOGIC;
  signal \write_addr_reg_n_0_[2]\ : STD_LOGIC;
  signal \write_addr_reg_n_0_[3]\ : STD_LOGIC;
  signal \write_addr_reg_n_0_[4]\ : STD_LOGIC;
  signal \write_addr_reg_n_0_[5]\ : STD_LOGIC;
  signal \write_addr_reg_n_0_[6]\ : STD_LOGIC;
  signal \write_addr_reg_n_0_[7]\ : STD_LOGIC;
  signal \write_addr_reg_n_0_[8]\ : STD_LOGIC;
  signal NLW_buffer_0_reg_0_63_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_0_63_14_20_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_0_63_21_27_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_0_63_28_31_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_0_63_28_31_DOF_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_0_63_28_31_DOG_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_0_63_28_31_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_0_63_7_13_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_128_191_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_128_191_14_20_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_128_191_21_27_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_128_191_28_31_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_128_191_28_31_DOF_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_128_191_28_31_DOG_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_128_191_28_31_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_128_191_7_13_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_192_255_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_192_255_14_20_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_192_255_21_27_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_192_255_28_31_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_192_255_28_31_DOF_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_192_255_28_31_DOG_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_192_255_28_31_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_192_255_7_13_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_64_127_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_64_127_14_20_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_64_127_21_27_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_64_127_28_31_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_64_127_28_31_DOF_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_64_127_28_31_DOG_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_64_127_28_31_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_0_reg_64_127_7_13_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_0_63_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_0_63_14_20_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_0_63_21_27_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_0_63_28_31_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_0_63_28_31_DOF_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_0_63_28_31_DOG_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_0_63_28_31_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_0_63_7_13_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_128_191_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_128_191_14_20_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_128_191_21_27_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_128_191_28_31_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_128_191_28_31_DOF_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_128_191_28_31_DOG_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_128_191_28_31_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_128_191_7_13_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_192_255_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_192_255_14_20_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_192_255_21_27_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_192_255_28_31_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_192_255_28_31_DOF_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_192_255_28_31_DOG_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_192_255_28_31_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_192_255_7_13_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_64_127_0_6_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_64_127_14_20_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_64_127_21_27_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_64_127_28_31_DOE_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_64_127_28_31_DOF_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_64_127_28_31_DOG_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_64_127_28_31_DOH_UNCONNECTED : STD_LOGIC;
  signal NLW_buffer_1_reg_64_127_7_13_DOH_UNCONNECTED : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of axis_tlast_delay_i_6 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of axis_tlast_delay_i_7 : label is "soft_lutpair7";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_0_63_0_6 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_0_63_14_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_0_63_21_27 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_0_63_28_31 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_0_63_7_13 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_128_191_0_6 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_128_191_14_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_128_191_21_27 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_128_191_28_31 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_128_191_7_13 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_192_255_0_6 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_192_255_14_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_192_255_21_27 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_192_255_28_31 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_192_255_7_13 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_64_127_0_6 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_64_127_14_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_64_127_21_27 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_64_127_28_31 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_0_reg_64_127_7_13 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_0_63_0_6 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_0_63_14_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_0_63_21_27 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_0_63_28_31 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_0_63_7_13 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_128_191_0_6 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_128_191_14_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_128_191_21_27 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_128_191_28_31 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_128_191_7_13 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_192_255_0_6 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_192_255_14_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_192_255_21_27 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_192_255_28_31 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_192_255_7_13 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_64_127_0_6 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_64_127_14_20 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_64_127_21_27 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_64_127_28_31 : label is "";
  attribute METHODOLOGY_DRC_VIOS of buffer_1_reg_64_127_7_13 : label is "";
  attribute SOFT_HLUTNM of buffer_overflow_error_i_2 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \write_addr[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \write_addr[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \write_addr[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \write_addr[4]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \write_addr[6]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \write_addr[7]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \write_addr[8]_i_2\ : label is "soft_lutpair8";
begin
  axis_tlast_delay_reg_0(7 downto 0) <= \^axis_tlast_delay_reg_0\(7 downto 0);
  buffer_overflow_error <= \^buffer_overflow_error\;
axis_tlast_delay_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080601806"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(6),
      I1 => axis_tlast_delay_i_2_n_0,
      I2 => \^axis_tlast_delay_reg_0\(7),
      I3 => Q(6),
      I4 => Q(7),
      I5 => axis_tlast_delay_i_3_n_0,
      O => axis_tlast_delay_reg
    );
axis_tlast_delay_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(4),
      I1 => \^axis_tlast_delay_reg_0\(2),
      I2 => \^axis_tlast_delay_reg_0\(0),
      I3 => \^axis_tlast_delay_reg_0\(1),
      I4 => \^axis_tlast_delay_reg_0\(3),
      I5 => \^axis_tlast_delay_reg_0\(5),
      O => axis_tlast_delay_i_2_n_0
    );
axis_tlast_delay_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FF7F77F"
    )
        port map (
      I0 => \read_pointer_reg[0]\,
      I1 => axis_tlast_delay_i_5_n_0,
      I2 => \^axis_tlast_delay_reg_0\(3),
      I3 => axis_tlast_delay_i_6_n_0,
      I4 => Q(3),
      O => axis_tlast_delay_i_3_n_0
    );
axis_tlast_delay_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"84422118"
    )
        port map (
      I0 => Q(4),
      I1 => Q(5),
      I2 => \^axis_tlast_delay_reg_0\(4),
      I3 => axis_tlast_delay_i_7_n_0,
      I4 => \^axis_tlast_delay_reg_0\(5),
      O => axis_tlast_delay_i_5_n_0
    );
axis_tlast_delay_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(1),
      I1 => \^axis_tlast_delay_reg_0\(0),
      I2 => \^axis_tlast_delay_reg_0\(2),
      O => axis_tlast_delay_i_6_n_0
    );
axis_tlast_delay_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(2),
      I1 => \^axis_tlast_delay_reg_0\(0),
      I2 => \^axis_tlast_delay_reg_0\(1),
      I3 => \^axis_tlast_delay_reg_0\(3),
      O => axis_tlast_delay_i_7_n_0
    );
axis_tvalid0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(6),
      I1 => Q(6),
      I2 => Q(7),
      I3 => \^axis_tlast_delay_reg_0\(7),
      O => DI(3)
    );
axis_tvalid0_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(4),
      I1 => ADDRG(3),
      I2 => Q(5),
      I3 => \^axis_tlast_delay_reg_0\(5),
      O => DI(2)
    );
axis_tvalid0_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(2),
      I1 => Q(2),
      I2 => Q(3),
      I3 => \^axis_tlast_delay_reg_0\(3),
      O => DI(1)
    );
axis_tvalid0_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(0),
      I1 => Q(0),
      I2 => Q(1),
      I3 => \^axis_tlast_delay_reg_0\(1),
      O => DI(0)
    );
axis_tvalid0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(6),
      I1 => Q(6),
      I2 => \^axis_tlast_delay_reg_0\(7),
      I3 => Q(7),
      O => S(3)
    );
axis_tvalid0_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(4),
      I1 => ADDRG(3),
      I2 => \^axis_tlast_delay_reg_0\(5),
      I3 => Q(5),
      O => S(2)
    );
axis_tvalid0_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(2),
      I1 => Q(2),
      I2 => \^axis_tlast_delay_reg_0\(3),
      I3 => Q(3),
      O => S(1)
    );
axis_tvalid0_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(0),
      I1 => Q(0),
      I2 => \^axis_tlast_delay_reg_0\(1),
      I3 => Q(1),
      O => S(0)
    );
buffer_0_reg_0_63_0_6: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => ADDRB(3),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1 downto 0) => ADDRB(1 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => ADDRB(3),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1 downto 0) => ADDRB(1 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => ADDRB(3),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1 downto 0) => ADDRB(1 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => ADDRB(3),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1 downto 0) => ADDRB(1 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => ADDRB(3),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1 downto 0) => ADDRB(1 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => ADDRB(3),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1 downto 0) => ADDRB(1 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => ADDRB(3),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1 downto 0) => ADDRB(1 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(0),
      DIB => packet(1),
      DIC => packet(2),
      DID => packet(3),
      DIE => packet(4),
      DIF => packet(5),
      DIG => packet(6),
      DIH => '0',
      DOA => buffer_0_reg_0_63_0_6_n_0,
      DOB => buffer_0_reg_0_63_0_6_n_1,
      DOC => buffer_0_reg_0_63_0_6_n_2,
      DOD => buffer_0_reg_0_63_0_6_n_3,
      DOE => buffer_0_reg_0_63_0_6_n_4,
      DOF => buffer_0_reg_0_63_0_6_n_5,
      DOG => buffer_0_reg_0_63_0_6_n_6,
      DOH => NLW_buffer_0_reg_0_63_0_6_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_0_63_0_6_i_1_n_0
    );
buffer_0_reg_0_63_0_6_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => rst,
      I1 => tick,
      I2 => packet_valid,
      I3 => curr_buffer,
      I4 => \write_addr_reg_n_0_[6]\,
      I5 => \write_addr_reg_n_0_[7]\,
      O => buffer_0_reg_0_63_0_6_i_1_n_0
    );
buffer_0_reg_0_63_14_20: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2 downto 0) => ADDRG(2 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2 downto 0) => ADDRG(2 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2 downto 0) => ADDRG(2 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2 downto 0) => ADDRG(2 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2 downto 0) => ADDRG(2 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2 downto 0) => ADDRG(2 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2 downto 0) => ADDRG(2 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(14),
      DIB => packet(15),
      DIC => packet(16),
      DID => packet(17),
      DIE => packet(18),
      DIF => packet(19),
      DIG => packet(20),
      DIH => '0',
      DOA => buffer_0_reg_0_63_14_20_n_0,
      DOB => buffer_0_reg_0_63_14_20_n_1,
      DOC => buffer_0_reg_0_63_14_20_n_2,
      DOD => buffer_0_reg_0_63_14_20_n_3,
      DOE => buffer_0_reg_0_63_14_20_n_4,
      DOF => buffer_0_reg_0_63_14_20_n_5,
      DOG => buffer_0_reg_0_63_14_20_n_6,
      DOH => NLW_buffer_0_reg_0_63_14_20_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_0_63_0_6_i_1_n_0
    );
buffer_0_reg_0_63_21_27: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => ADDRB(2),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => ADDRB(2),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => ADDRB(2),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => ADDRB(2),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => Q(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRB(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => Q(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => ADDRB(2),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => Q(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => ADDRB(2),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => Q(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(21),
      DIB => packet(22),
      DIC => packet(23),
      DID => packet(24),
      DIE => packet(25),
      DIF => packet(26),
      DIG => packet(27),
      DIH => '0',
      DOA => buffer_0_reg_0_63_21_27_n_0,
      DOB => buffer_0_reg_0_63_21_27_n_1,
      DOC => buffer_0_reg_0_63_21_27_n_2,
      DOD => buffer_0_reg_0_63_21_27_n_3,
      DOE => buffer_0_reg_0_63_21_27_n_4,
      DOF => buffer_0_reg_0_63_21_27_n_5,
      DOG => buffer_0_reg_0_63_21_27_n_6,
      DOH => NLW_buffer_0_reg_0_63_21_27_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_0_63_0_6_i_1_n_0
    );
buffer_0_reg_0_63_28_31: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => ADDRB(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => ADDRB(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => ADDRB(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => ADDRB(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => ADDRB(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => ADDRB(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => ADDRB(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(28),
      DIB => packet(29),
      DIC => '0',
      DID => '0',
      DIE => '0',
      DIF => '0',
      DIG => '0',
      DIH => '0',
      DOA => buffer_0_reg_0_63_28_31_n_0,
      DOB => buffer_0_reg_0_63_28_31_n_1,
      DOC => buffer_0_reg_0_63_28_31_n_2,
      DOD => buffer_0_reg_0_63_28_31_n_3,
      DOE => NLW_buffer_0_reg_0_63_28_31_DOE_UNCONNECTED,
      DOF => NLW_buffer_0_reg_0_63_28_31_DOF_UNCONNECTED,
      DOG => NLW_buffer_0_reg_0_63_28_31_DOG_UNCONNECTED,
      DOH => NLW_buffer_0_reg_0_63_28_31_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_0_63_0_6_i_1_n_0
    );
buffer_0_reg_0_63_7_13: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2 downto 0) => ADDRG(2 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2 downto 0) => ADDRG(2 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2 downto 0) => ADDRG(2 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2 downto 0) => ADDRG(2 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2 downto 0) => ADDRG(2 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2 downto 0) => ADDRG(2 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2 downto 0) => ADDRG(2 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(7),
      DIB => packet(8),
      DIC => packet(9),
      DID => packet(10),
      DIE => packet(11),
      DIF => packet(12),
      DIG => packet(13),
      DIH => '0',
      DOA => buffer_0_reg_0_63_7_13_n_0,
      DOB => buffer_0_reg_0_63_7_13_n_1,
      DOC => buffer_0_reg_0_63_7_13_n_2,
      DOD => buffer_0_reg_0_63_7_13_n_3,
      DOE => buffer_0_reg_0_63_7_13_n_4,
      DOF => buffer_0_reg_0_63_7_13_n_5,
      DOG => buffer_0_reg_0_63_7_13_n_6,
      DOH => NLW_buffer_0_reg_0_63_7_13_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_0_63_0_6_i_1_n_0
    );
buffer_0_reg_128_191_0_6: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => ADDRB(3),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1 downto 0) => ADDRB(1 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => ADDRB(3),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1 downto 0) => ADDRB(1 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => ADDRB(3),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1 downto 0) => ADDRB(1 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => ADDRB(3),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1 downto 0) => ADDRB(1 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => ADDRB(3),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1 downto 0) => ADDRB(1 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => ADDRB(3),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1 downto 0) => ADDRB(1 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => ADDRB(3),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1 downto 0) => ADDRB(1 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(0),
      DIB => packet(1),
      DIC => packet(2),
      DID => packet(3),
      DIE => packet(4),
      DIF => packet(5),
      DIG => packet(6),
      DIH => '0',
      DOA => buffer_0_reg_128_191_0_6_n_0,
      DOB => buffer_0_reg_128_191_0_6_n_1,
      DOC => buffer_0_reg_128_191_0_6_n_2,
      DOD => buffer_0_reg_128_191_0_6_n_3,
      DOE => buffer_0_reg_128_191_0_6_n_4,
      DOF => buffer_0_reg_128_191_0_6_n_5,
      DOG => buffer_0_reg_128_191_0_6_n_6,
      DOH => NLW_buffer_0_reg_128_191_0_6_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_128_191_0_6_i_1_n_0
    );
buffer_0_reg_128_191_0_6_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
        port map (
      I0 => \write_addr_reg_n_0_[6]\,
      I1 => \write_addr_reg_n_0_[7]\,
      I2 => curr_buffer,
      I3 => packet_valid,
      I4 => tick,
      I5 => rst,
      O => buffer_0_reg_128_191_0_6_i_1_n_0
    );
buffer_0_reg_128_191_14_20: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2 downto 0) => ADDRG(2 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2 downto 0) => ADDRG(2 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2 downto 0) => ADDRG(2 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2 downto 0) => ADDRG(2 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2 downto 0) => ADDRG(2 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2 downto 0) => ADDRG(2 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2 downto 0) => ADDRG(2 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(14),
      DIB => packet(15),
      DIC => packet(16),
      DID => packet(17),
      DIE => packet(18),
      DIF => packet(19),
      DIG => packet(20),
      DIH => '0',
      DOA => buffer_0_reg_128_191_14_20_n_0,
      DOB => buffer_0_reg_128_191_14_20_n_1,
      DOC => buffer_0_reg_128_191_14_20_n_2,
      DOD => buffer_0_reg_128_191_14_20_n_3,
      DOE => buffer_0_reg_128_191_14_20_n_4,
      DOF => buffer_0_reg_128_191_14_20_n_5,
      DOG => buffer_0_reg_128_191_14_20_n_6,
      DOH => NLW_buffer_0_reg_128_191_14_20_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_128_191_0_6_i_1_n_0
    );
buffer_0_reg_128_191_21_27: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => ADDRB(2),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => ADDRB(2),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => ADDRB(2),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => ADDRB(2),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => Q(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRB(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => Q(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => ADDRB(2),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => Q(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => ADDRB(2),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => Q(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(21),
      DIB => packet(22),
      DIC => packet(23),
      DID => packet(24),
      DIE => packet(25),
      DIF => packet(26),
      DIG => packet(27),
      DIH => '0',
      DOA => buffer_0_reg_128_191_21_27_n_0,
      DOB => buffer_0_reg_128_191_21_27_n_1,
      DOC => buffer_0_reg_128_191_21_27_n_2,
      DOD => buffer_0_reg_128_191_21_27_n_3,
      DOE => buffer_0_reg_128_191_21_27_n_4,
      DOF => buffer_0_reg_128_191_21_27_n_5,
      DOG => buffer_0_reg_128_191_21_27_n_6,
      DOH => NLW_buffer_0_reg_128_191_21_27_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_128_191_0_6_i_1_n_0
    );
buffer_0_reg_128_191_28_31: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3 downto 0) => ADDRB(3 downto 0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3 downto 0) => ADDRB(3 downto 0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3 downto 0) => ADDRB(3 downto 0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3 downto 0) => ADDRB(3 downto 0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3 downto 0) => ADDRB(3 downto 0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3 downto 0) => ADDRB(3 downto 0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3 downto 0) => ADDRB(3 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(28),
      DIB => packet(29),
      DIC => '0',
      DID => '0',
      DIE => '0',
      DIF => '0',
      DIG => '0',
      DIH => '0',
      DOA => buffer_0_reg_128_191_28_31_n_0,
      DOB => buffer_0_reg_128_191_28_31_n_1,
      DOC => buffer_0_reg_128_191_28_31_n_2,
      DOD => buffer_0_reg_128_191_28_31_n_3,
      DOE => NLW_buffer_0_reg_128_191_28_31_DOE_UNCONNECTED,
      DOF => NLW_buffer_0_reg_128_191_28_31_DOF_UNCONNECTED,
      DOG => NLW_buffer_0_reg_128_191_28_31_DOG_UNCONNECTED,
      DOH => NLW_buffer_0_reg_128_191_28_31_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_128_191_0_6_i_1_n_0
    );
buffer_0_reg_128_191_7_13: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2 downto 0) => ADDRG(2 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2 downto 0) => ADDRG(2 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2 downto 0) => ADDRG(2 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2 downto 0) => ADDRG(2 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2 downto 0) => ADDRG(2 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2 downto 0) => ADDRG(2 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2 downto 0) => ADDRG(2 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(7),
      DIB => packet(8),
      DIC => packet(9),
      DID => packet(10),
      DIE => packet(11),
      DIF => packet(12),
      DIG => packet(13),
      DIH => '0',
      DOA => buffer_0_reg_128_191_7_13_n_0,
      DOB => buffer_0_reg_128_191_7_13_n_1,
      DOC => buffer_0_reg_128_191_7_13_n_2,
      DOD => buffer_0_reg_128_191_7_13_n_3,
      DOE => buffer_0_reg_128_191_7_13_n_4,
      DOF => buffer_0_reg_128_191_7_13_n_5,
      DOG => buffer_0_reg_128_191_7_13_n_6,
      DOH => NLW_buffer_0_reg_128_191_7_13_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_128_191_0_6_i_1_n_0
    );
buffer_0_reg_192_255_0_6: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => ADDRB(3),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1 downto 0) => ADDRB(1 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => ADDRB(3),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1 downto 0) => ADDRB(1 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => ADDRB(3),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1 downto 0) => ADDRB(1 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => ADDRB(3),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1 downto 0) => ADDRB(1 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => ADDRB(3),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1 downto 0) => ADDRB(1 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => ADDRB(3),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1 downto 0) => ADDRB(1 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => ADDRB(3),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1 downto 0) => ADDRB(1 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(0),
      DIB => packet(1),
      DIC => packet(2),
      DID => packet(3),
      DIE => packet(4),
      DIF => packet(5),
      DIG => packet(6),
      DIH => '0',
      DOA => buffer_0_reg_192_255_0_6_n_0,
      DOB => buffer_0_reg_192_255_0_6_n_1,
      DOC => buffer_0_reg_192_255_0_6_n_2,
      DOD => buffer_0_reg_192_255_0_6_n_3,
      DOE => buffer_0_reg_192_255_0_6_n_4,
      DOF => buffer_0_reg_192_255_0_6_n_5,
      DOG => buffer_0_reg_192_255_0_6_n_6,
      DOH => NLW_buffer_0_reg_192_255_0_6_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_192_255_0_6_i_1_n_0
    );
buffer_0_reg_192_255_0_6_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
        port map (
      I0 => rst,
      I1 => tick,
      I2 => packet_valid,
      I3 => curr_buffer,
      I4 => \write_addr_reg_n_0_[6]\,
      I5 => \write_addr_reg_n_0_[7]\,
      O => buffer_0_reg_192_255_0_6_i_1_n_0
    );
buffer_0_reg_192_255_14_20: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2 downto 0) => ADDRG(2 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2 downto 0) => ADDRG(2 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2 downto 0) => ADDRG(2 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2 downto 0) => ADDRG(2 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2 downto 0) => ADDRG(2 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2 downto 0) => ADDRG(2 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2 downto 0) => ADDRG(2 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(14),
      DIB => packet(15),
      DIC => packet(16),
      DID => packet(17),
      DIE => packet(18),
      DIF => packet(19),
      DIG => packet(20),
      DIH => '0',
      DOA => buffer_0_reg_192_255_14_20_n_0,
      DOB => buffer_0_reg_192_255_14_20_n_1,
      DOC => buffer_0_reg_192_255_14_20_n_2,
      DOD => buffer_0_reg_192_255_14_20_n_3,
      DOE => buffer_0_reg_192_255_14_20_n_4,
      DOF => buffer_0_reg_192_255_14_20_n_5,
      DOG => buffer_0_reg_192_255_14_20_n_6,
      DOH => NLW_buffer_0_reg_192_255_14_20_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_192_255_0_6_i_1_n_0
    );
buffer_0_reg_192_255_21_27: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => ADDRB(2),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => ADDRB(2),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => ADDRB(2),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => ADDRB(2),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => Q(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRB(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => Q(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => ADDRB(2),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => Q(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => ADDRB(2),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => Q(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(21),
      DIB => packet(22),
      DIC => packet(23),
      DID => packet(24),
      DIE => packet(25),
      DIF => packet(26),
      DIG => packet(27),
      DIH => '0',
      DOA => buffer_0_reg_192_255_21_27_n_0,
      DOB => buffer_0_reg_192_255_21_27_n_1,
      DOC => buffer_0_reg_192_255_21_27_n_2,
      DOD => buffer_0_reg_192_255_21_27_n_3,
      DOE => buffer_0_reg_192_255_21_27_n_4,
      DOF => buffer_0_reg_192_255_21_27_n_5,
      DOG => buffer_0_reg_192_255_21_27_n_6,
      DOH => NLW_buffer_0_reg_192_255_21_27_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_192_255_0_6_i_1_n_0
    );
buffer_0_reg_192_255_28_31: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3 downto 1) => ADDRB(3 downto 1),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3 downto 1) => ADDRB(3 downto 1),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3 downto 1) => ADDRB(3 downto 1),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3 downto 0) => ADDRB(3 downto 0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3 downto 0) => ADDRB(3 downto 0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3 downto 0) => ADDRB(3 downto 0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3 downto 0) => ADDRB(3 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(28),
      DIB => packet(29),
      DIC => '0',
      DID => '0',
      DIE => '0',
      DIF => '0',
      DIG => '0',
      DIH => '0',
      DOA => buffer_0_reg_192_255_28_31_n_0,
      DOB => buffer_0_reg_192_255_28_31_n_1,
      DOC => buffer_0_reg_192_255_28_31_n_2,
      DOD => buffer_0_reg_192_255_28_31_n_3,
      DOE => NLW_buffer_0_reg_192_255_28_31_DOE_UNCONNECTED,
      DOF => NLW_buffer_0_reg_192_255_28_31_DOF_UNCONNECTED,
      DOG => NLW_buffer_0_reg_192_255_28_31_DOG_UNCONNECTED,
      DOH => NLW_buffer_0_reg_192_255_28_31_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_192_255_0_6_i_1_n_0
    );
buffer_0_reg_192_255_7_13: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2 downto 0) => ADDRG(2 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2 downto 0) => ADDRG(2 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2 downto 0) => ADDRG(2 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2 downto 0) => ADDRG(2 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2 downto 0) => ADDRG(2 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2 downto 0) => ADDRG(2 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2 downto 0) => ADDRG(2 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(7),
      DIB => packet(8),
      DIC => packet(9),
      DID => packet(10),
      DIE => packet(11),
      DIF => packet(12),
      DIG => packet(13),
      DIH => '0',
      DOA => buffer_0_reg_192_255_7_13_n_0,
      DOB => buffer_0_reg_192_255_7_13_n_1,
      DOC => buffer_0_reg_192_255_7_13_n_2,
      DOD => buffer_0_reg_192_255_7_13_n_3,
      DOE => buffer_0_reg_192_255_7_13_n_4,
      DOF => buffer_0_reg_192_255_7_13_n_5,
      DOG => buffer_0_reg_192_255_7_13_n_6,
      DOH => NLW_buffer_0_reg_192_255_7_13_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_192_255_0_6_i_1_n_0
    );
buffer_0_reg_64_127_0_6: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => ADDRB(3),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1 downto 0) => ADDRB(1 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => ADDRB(3),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1 downto 0) => ADDRB(1 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => ADDRB(3),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1 downto 0) => ADDRB(1 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => ADDRB(3),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1 downto 0) => ADDRB(1 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => ADDRB(3),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1 downto 0) => ADDRB(1 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => ADDRB(3),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1 downto 0) => ADDRB(1 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => ADDRB(3),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1 downto 0) => ADDRB(1 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(0),
      DIB => packet(1),
      DIC => packet(2),
      DID => packet(3),
      DIE => packet(4),
      DIF => packet(5),
      DIG => packet(6),
      DIH => '0',
      DOA => buffer_0_reg_64_127_0_6_n_0,
      DOB => buffer_0_reg_64_127_0_6_n_1,
      DOC => buffer_0_reg_64_127_0_6_n_2,
      DOD => buffer_0_reg_64_127_0_6_n_3,
      DOE => buffer_0_reg_64_127_0_6_n_4,
      DOF => buffer_0_reg_64_127_0_6_n_5,
      DOG => buffer_0_reg_64_127_0_6_n_6,
      DOH => NLW_buffer_0_reg_64_127_0_6_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_64_127_0_6_i_1_n_0
    );
buffer_0_reg_64_127_0_6_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
        port map (
      I0 => \write_addr_reg_n_0_[7]\,
      I1 => \write_addr_reg_n_0_[6]\,
      I2 => curr_buffer,
      I3 => packet_valid,
      I4 => tick,
      I5 => rst,
      O => buffer_0_reg_64_127_0_6_i_1_n_0
    );
buffer_0_reg_64_127_14_20: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2 downto 0) => ADDRG(2 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2 downto 0) => ADDRG(2 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2 downto 0) => ADDRG(2 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2 downto 0) => ADDRG(2 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2 downto 0) => ADDRG(2 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2 downto 0) => ADDRG(2 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2 downto 0) => ADDRG(2 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(14),
      DIB => packet(15),
      DIC => packet(16),
      DID => packet(17),
      DIE => packet(18),
      DIF => packet(19),
      DIG => packet(20),
      DIH => '0',
      DOA => buffer_0_reg_64_127_14_20_n_0,
      DOB => buffer_0_reg_64_127_14_20_n_1,
      DOC => buffer_0_reg_64_127_14_20_n_2,
      DOD => buffer_0_reg_64_127_14_20_n_3,
      DOE => buffer_0_reg_64_127_14_20_n_4,
      DOF => buffer_0_reg_64_127_14_20_n_5,
      DOG => buffer_0_reg_64_127_14_20_n_6,
      DOH => NLW_buffer_0_reg_64_127_14_20_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_64_127_0_6_i_1_n_0
    );
buffer_0_reg_64_127_21_27: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => ADDRB(2),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => ADDRB(2),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => ADDRB(2),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => ADDRB(2),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => Q(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRB(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => Q(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => ADDRB(2),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => Q(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => ADDRB(2),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => Q(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(21),
      DIB => packet(22),
      DIC => packet(23),
      DID => packet(24),
      DIE => packet(25),
      DIF => packet(26),
      DIG => packet(27),
      DIH => '0',
      DOA => buffer_0_reg_64_127_21_27_n_0,
      DOB => buffer_0_reg_64_127_21_27_n_1,
      DOC => buffer_0_reg_64_127_21_27_n_2,
      DOD => buffer_0_reg_64_127_21_27_n_3,
      DOE => buffer_0_reg_64_127_21_27_n_4,
      DOF => buffer_0_reg_64_127_21_27_n_5,
      DOG => buffer_0_reg_64_127_21_27_n_6,
      DOH => NLW_buffer_0_reg_64_127_21_27_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_64_127_0_6_i_1_n_0
    );
buffer_0_reg_64_127_28_31: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3 downto 0) => ADDRB(3 downto 0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3 downto 0) => ADDRB(3 downto 0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2 downto 0) => ADDRB(2 downto 0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2 downto 0) => ADDRB(2 downto 0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRB(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => ADDRB(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => ADDRB(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => ADDRB(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(28),
      DIB => packet(29),
      DIC => '0',
      DID => '0',
      DIE => '0',
      DIF => '0',
      DIG => '0',
      DIH => '0',
      DOA => buffer_0_reg_64_127_28_31_n_0,
      DOB => buffer_0_reg_64_127_28_31_n_1,
      DOC => buffer_0_reg_64_127_28_31_n_2,
      DOD => buffer_0_reg_64_127_28_31_n_3,
      DOE => NLW_buffer_0_reg_64_127_28_31_DOE_UNCONNECTED,
      DOF => NLW_buffer_0_reg_64_127_28_31_DOF_UNCONNECTED,
      DOG => NLW_buffer_0_reg_64_127_28_31_DOG_UNCONNECTED,
      DOH => NLW_buffer_0_reg_64_127_28_31_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_64_127_0_6_i_1_n_0
    );
buffer_0_reg_64_127_7_13: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2 downto 0) => ADDRG(2 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2 downto 0) => ADDRG(2 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2 downto 0) => ADDRG(2 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2 downto 0) => ADDRG(2 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2 downto 0) => ADDRG(2 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2 downto 0) => ADDRG(2 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2 downto 0) => ADDRG(2 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(7),
      DIB => packet(8),
      DIC => packet(9),
      DID => packet(10),
      DIE => packet(11),
      DIF => packet(12),
      DIG => packet(13),
      DIH => '0',
      DOA => buffer_0_reg_64_127_7_13_n_0,
      DOB => buffer_0_reg_64_127_7_13_n_1,
      DOC => buffer_0_reg_64_127_7_13_n_2,
      DOD => buffer_0_reg_64_127_7_13_n_3,
      DOE => buffer_0_reg_64_127_7_13_n_4,
      DOF => buffer_0_reg_64_127_7_13_n_5,
      DOG => buffer_0_reg_64_127_7_13_n_6,
      DOH => NLW_buffer_0_reg_64_127_7_13_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_0_reg_64_127_0_6_i_1_n_0
    );
buffer_1_reg_0_63_0_6: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => ADDRB(3),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1 downto 0) => ADDRB(1 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => ADDRB(3),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1 downto 0) => ADDRB(1 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => ADDRB(3),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1 downto 0) => ADDRB(1 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => ADDRB(3),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1 downto 0) => ADDRB(1 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => ADDRB(3),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1 downto 0) => ADDRB(1 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => ADDRB(3),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1 downto 0) => ADDRB(1 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => ADDRB(3),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1 downto 0) => ADDRB(1 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(0),
      DIB => packet(1),
      DIC => packet(2),
      DID => packet(3),
      DIE => packet(4),
      DIF => packet(5),
      DIG => packet(6),
      DIH => '0',
      DOA => buffer_1_reg_0_63_0_6_n_0,
      DOB => buffer_1_reg_0_63_0_6_n_1,
      DOC => buffer_1_reg_0_63_0_6_n_2,
      DOD => buffer_1_reg_0_63_0_6_n_3,
      DOE => buffer_1_reg_0_63_0_6_n_4,
      DOF => buffer_1_reg_0_63_0_6_n_5,
      DOG => buffer_1_reg_0_63_0_6_n_6,
      DOH => NLW_buffer_1_reg_0_63_0_6_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_0_63_0_6_i_1_n_0
    );
buffer_1_reg_0_63_0_6_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000001000"
    )
        port map (
      I0 => rst,
      I1 => tick,
      I2 => packet_valid,
      I3 => curr_buffer,
      I4 => \write_addr_reg_n_0_[6]\,
      I5 => \write_addr_reg_n_0_[7]\,
      O => buffer_1_reg_0_63_0_6_i_1_n_0
    );
buffer_1_reg_0_63_14_20: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2 downto 0) => ADDRG(2 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2 downto 0) => ADDRG(2 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2 downto 0) => ADDRG(2 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2 downto 0) => ADDRG(2 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2 downto 0) => ADDRG(2 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2 downto 0) => ADDRG(2 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2 downto 0) => ADDRG(2 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(14),
      DIB => packet(15),
      DIC => packet(16),
      DID => packet(17),
      DIE => packet(18),
      DIF => packet(19),
      DIG => packet(20),
      DIH => '0',
      DOA => buffer_1_reg_0_63_14_20_n_0,
      DOB => buffer_1_reg_0_63_14_20_n_1,
      DOC => buffer_1_reg_0_63_14_20_n_2,
      DOD => buffer_1_reg_0_63_14_20_n_3,
      DOE => buffer_1_reg_0_63_14_20_n_4,
      DOF => buffer_1_reg_0_63_14_20_n_5,
      DOG => buffer_1_reg_0_63_14_20_n_6,
      DOH => NLW_buffer_1_reg_0_63_14_20_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_0_63_0_6_i_1_n_0
    );
buffer_1_reg_0_63_21_27: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => ADDRB(2),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => ADDRB(2),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => ADDRB(2),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => ADDRB(2),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => Q(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRB(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => Q(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => ADDRB(2),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => Q(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => ADDRB(2),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => Q(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(21),
      DIB => packet(22),
      DIC => packet(23),
      DID => packet(24),
      DIE => packet(25),
      DIF => packet(26),
      DIG => packet(27),
      DIH => '0',
      DOA => buffer_1_reg_0_63_21_27_n_0,
      DOB => buffer_1_reg_0_63_21_27_n_1,
      DOC => buffer_1_reg_0_63_21_27_n_2,
      DOD => buffer_1_reg_0_63_21_27_n_3,
      DOE => buffer_1_reg_0_63_21_27_n_4,
      DOF => buffer_1_reg_0_63_21_27_n_5,
      DOG => buffer_1_reg_0_63_21_27_n_6,
      DOH => NLW_buffer_1_reg_0_63_21_27_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_0_63_0_6_i_1_n_0
    );
buffer_1_reg_0_63_28_31: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => ADDRB(2),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => ADDRB(2),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => ADDRB(2),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => ADDRB(2),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => Q(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRB(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => Q(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => ADDRB(2),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => Q(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => ADDRB(2),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => Q(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(28),
      DIB => packet(29),
      DIC => '0',
      DID => '0',
      DIE => '0',
      DIF => '0',
      DIG => '0',
      DIH => '0',
      DOA => buffer_1_reg_0_63_28_31_n_0,
      DOB => buffer_1_reg_0_63_28_31_n_1,
      DOC => buffer_1_reg_0_63_28_31_n_2,
      DOD => buffer_1_reg_0_63_28_31_n_3,
      DOE => NLW_buffer_1_reg_0_63_28_31_DOE_UNCONNECTED,
      DOF => NLW_buffer_1_reg_0_63_28_31_DOF_UNCONNECTED,
      DOG => NLW_buffer_1_reg_0_63_28_31_DOG_UNCONNECTED,
      DOH => NLW_buffer_1_reg_0_63_28_31_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_0_63_0_6_i_1_n_0
    );
buffer_1_reg_0_63_7_13: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => ADDRB(3),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1) => ADDRB(1),
      ADDRA(0) => ADDRG(0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => ADDRB(3),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1) => ADDRB(1),
      ADDRB(0) => ADDRG(0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => ADDRB(3),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1) => ADDRB(1),
      ADDRC(0) => ADDRG(0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => ADDRB(3),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1) => ADDRB(1),
      ADDRD(0) => ADDRG(0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => ADDRB(3),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1) => ADDRB(1),
      ADDRE(0) => ADDRG(0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => ADDRB(3),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1) => ADDRB(1),
      ADDRF(0) => ADDRG(0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => ADDRB(3),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1) => ADDRB(1),
      ADDRG(0) => ADDRG(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(7),
      DIB => packet(8),
      DIC => packet(9),
      DID => packet(10),
      DIE => packet(11),
      DIF => packet(12),
      DIG => packet(13),
      DIH => '0',
      DOA => buffer_1_reg_0_63_7_13_n_0,
      DOB => buffer_1_reg_0_63_7_13_n_1,
      DOC => buffer_1_reg_0_63_7_13_n_2,
      DOD => buffer_1_reg_0_63_7_13_n_3,
      DOE => buffer_1_reg_0_63_7_13_n_4,
      DOF => buffer_1_reg_0_63_7_13_n_5,
      DOG => buffer_1_reg_0_63_7_13_n_6,
      DOH => NLW_buffer_1_reg_0_63_7_13_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_0_63_0_6_i_1_n_0
    );
buffer_1_reg_128_191_0_6: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => ADDRB(3),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1 downto 0) => ADDRB(1 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => ADDRB(3),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1 downto 0) => ADDRB(1 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => ADDRB(3),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1 downto 0) => ADDRB(1 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => ADDRB(3),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1 downto 0) => ADDRB(1 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => ADDRB(3),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1 downto 0) => ADDRB(1 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => ADDRB(3),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1 downto 0) => ADDRB(1 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => ADDRB(3),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1 downto 0) => ADDRB(1 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(0),
      DIB => packet(1),
      DIC => packet(2),
      DID => packet(3),
      DIE => packet(4),
      DIF => packet(5),
      DIG => packet(6),
      DIH => '0',
      DOA => buffer_1_reg_128_191_0_6_n_0,
      DOB => buffer_1_reg_128_191_0_6_n_1,
      DOC => buffer_1_reg_128_191_0_6_n_2,
      DOD => buffer_1_reg_128_191_0_6_n_3,
      DOE => buffer_1_reg_128_191_0_6_n_4,
      DOF => buffer_1_reg_128_191_0_6_n_5,
      DOG => buffer_1_reg_128_191_0_6_n_6,
      DOH => NLW_buffer_1_reg_128_191_0_6_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_128_191_0_6_i_1_n_0
    );
buffer_1_reg_128_191_0_6_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000004000"
    )
        port map (
      I0 => \write_addr_reg_n_0_[6]\,
      I1 => \write_addr_reg_n_0_[7]\,
      I2 => curr_buffer,
      I3 => packet_valid,
      I4 => tick,
      I5 => rst,
      O => buffer_1_reg_128_191_0_6_i_1_n_0
    );
buffer_1_reg_128_191_14_20: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2 downto 0) => ADDRG(2 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2 downto 0) => ADDRG(2 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2 downto 0) => ADDRG(2 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2 downto 0) => ADDRG(2 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2 downto 0) => ADDRG(2 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2 downto 0) => ADDRG(2 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2 downto 0) => ADDRG(2 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(14),
      DIB => packet(15),
      DIC => packet(16),
      DID => packet(17),
      DIE => packet(18),
      DIF => packet(19),
      DIG => packet(20),
      DIH => '0',
      DOA => buffer_1_reg_128_191_14_20_n_0,
      DOB => buffer_1_reg_128_191_14_20_n_1,
      DOC => buffer_1_reg_128_191_14_20_n_2,
      DOD => buffer_1_reg_128_191_14_20_n_3,
      DOE => buffer_1_reg_128_191_14_20_n_4,
      DOF => buffer_1_reg_128_191_14_20_n_5,
      DOG => buffer_1_reg_128_191_14_20_n_6,
      DOH => NLW_buffer_1_reg_128_191_14_20_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_128_191_0_6_i_1_n_0
    );
buffer_1_reg_128_191_21_27: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => ADDRB(2),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => ADDRB(2),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => ADDRB(2),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => ADDRB(2),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => Q(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRB(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => Q(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => ADDRB(2),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => Q(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => ADDRB(2),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => Q(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(21),
      DIB => packet(22),
      DIC => packet(23),
      DID => packet(24),
      DIE => packet(25),
      DIF => packet(26),
      DIG => packet(27),
      DIH => '0',
      DOA => buffer_1_reg_128_191_21_27_n_0,
      DOB => buffer_1_reg_128_191_21_27_n_1,
      DOC => buffer_1_reg_128_191_21_27_n_2,
      DOD => buffer_1_reg_128_191_21_27_n_3,
      DOE => buffer_1_reg_128_191_21_27_n_4,
      DOF => buffer_1_reg_128_191_21_27_n_5,
      DOG => buffer_1_reg_128_191_21_27_n_6,
      DOH => NLW_buffer_1_reg_128_191_21_27_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_128_191_0_6_i_1_n_0
    );
buffer_1_reg_128_191_28_31: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => ADDRB(2),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => ADDRB(2),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => ADDRB(2),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => ADDRB(2),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => Q(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRB(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => Q(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => ADDRB(2),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => Q(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => ADDRB(2),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => Q(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(28),
      DIB => packet(29),
      DIC => '0',
      DID => '0',
      DIE => '0',
      DIF => '0',
      DIG => '0',
      DIH => '0',
      DOA => buffer_1_reg_128_191_28_31_n_0,
      DOB => buffer_1_reg_128_191_28_31_n_1,
      DOC => buffer_1_reg_128_191_28_31_n_2,
      DOD => buffer_1_reg_128_191_28_31_n_3,
      DOE => NLW_buffer_1_reg_128_191_28_31_DOE_UNCONNECTED,
      DOF => NLW_buffer_1_reg_128_191_28_31_DOF_UNCONNECTED,
      DOG => NLW_buffer_1_reg_128_191_28_31_DOG_UNCONNECTED,
      DOH => NLW_buffer_1_reg_128_191_28_31_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_128_191_0_6_i_1_n_0
    );
buffer_1_reg_128_191_7_13: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => ADDRB(3),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1 downto 0) => ADDRB(1 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => ADDRB(3),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1 downto 0) => ADDRB(1 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => ADDRB(3),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1 downto 0) => ADDRB(1 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => ADDRB(3),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1 downto 0) => ADDRB(1 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => ADDRB(3),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1 downto 0) => ADDRB(1 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => ADDRB(3),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1 downto 0) => ADDRB(1 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => ADDRB(3),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1 downto 0) => ADDRB(1 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(7),
      DIB => packet(8),
      DIC => packet(9),
      DID => packet(10),
      DIE => packet(11),
      DIF => packet(12),
      DIG => packet(13),
      DIH => '0',
      DOA => buffer_1_reg_128_191_7_13_n_0,
      DOB => buffer_1_reg_128_191_7_13_n_1,
      DOC => buffer_1_reg_128_191_7_13_n_2,
      DOD => buffer_1_reg_128_191_7_13_n_3,
      DOE => buffer_1_reg_128_191_7_13_n_4,
      DOF => buffer_1_reg_128_191_7_13_n_5,
      DOG => buffer_1_reg_128_191_7_13_n_6,
      DOH => NLW_buffer_1_reg_128_191_7_13_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_128_191_0_6_i_1_n_0
    );
buffer_1_reg_192_255_0_6: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => ADDRB(3),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1 downto 0) => ADDRB(1 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => ADDRB(3),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1 downto 0) => ADDRB(1 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => ADDRB(3),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1 downto 0) => ADDRB(1 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => ADDRB(3),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1 downto 0) => ADDRB(1 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => ADDRB(3),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1 downto 0) => ADDRB(1 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => ADDRB(3),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1 downto 0) => ADDRB(1 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => ADDRB(3),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1 downto 0) => ADDRB(1 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(0),
      DIB => packet(1),
      DIC => packet(2),
      DID => packet(3),
      DIE => packet(4),
      DIF => packet(5),
      DIG => packet(6),
      DIH => '0',
      DOA => buffer_1_reg_192_255_0_6_n_0,
      DOB => buffer_1_reg_192_255_0_6_n_1,
      DOC => buffer_1_reg_192_255_0_6_n_2,
      DOD => buffer_1_reg_192_255_0_6_n_3,
      DOE => buffer_1_reg_192_255_0_6_n_4,
      DOF => buffer_1_reg_192_255_0_6_n_5,
      DOG => buffer_1_reg_192_255_0_6_n_6,
      DOH => NLW_buffer_1_reg_192_255_0_6_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_192_255_0_6_i_1_n_0
    );
buffer_1_reg_192_255_0_6_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000000000000000"
    )
        port map (
      I0 => rst,
      I1 => tick,
      I2 => packet_valid,
      I3 => curr_buffer,
      I4 => \write_addr_reg_n_0_[6]\,
      I5 => \write_addr_reg_n_0_[7]\,
      O => buffer_1_reg_192_255_0_6_i_1_n_0
    );
buffer_1_reg_192_255_14_20: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2 downto 0) => ADDRG(2 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2 downto 0) => ADDRG(2 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2 downto 0) => ADDRG(2 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2 downto 0) => ADDRG(2 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2 downto 0) => ADDRG(2 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2 downto 0) => ADDRG(2 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2 downto 0) => ADDRG(2 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(14),
      DIB => packet(15),
      DIC => packet(16),
      DID => packet(17),
      DIE => packet(18),
      DIF => packet(19),
      DIG => packet(20),
      DIH => '0',
      DOA => buffer_1_reg_192_255_14_20_n_0,
      DOB => buffer_1_reg_192_255_14_20_n_1,
      DOC => buffer_1_reg_192_255_14_20_n_2,
      DOD => buffer_1_reg_192_255_14_20_n_3,
      DOE => buffer_1_reg_192_255_14_20_n_4,
      DOF => buffer_1_reg_192_255_14_20_n_5,
      DOG => buffer_1_reg_192_255_14_20_n_6,
      DOH => NLW_buffer_1_reg_192_255_14_20_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_192_255_0_6_i_1_n_0
    );
buffer_1_reg_192_255_21_27: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => ADDRG(2),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => ADDRG(2),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => ADDRG(2),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => ADDRG(2),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => Q(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRG(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => Q(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => ADDRG(2),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => Q(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => ADDRG(2),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => Q(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(21),
      DIB => packet(22),
      DIC => packet(23),
      DID => packet(24),
      DIE => packet(25),
      DIF => packet(26),
      DIG => packet(27),
      DIH => '0',
      DOA => buffer_1_reg_192_255_21_27_n_0,
      DOB => buffer_1_reg_192_255_21_27_n_1,
      DOC => buffer_1_reg_192_255_21_27_n_2,
      DOD => buffer_1_reg_192_255_21_27_n_3,
      DOE => buffer_1_reg_192_255_21_27_n_4,
      DOF => buffer_1_reg_192_255_21_27_n_5,
      DOG => buffer_1_reg_192_255_21_27_n_6,
      DOH => NLW_buffer_1_reg_192_255_21_27_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_192_255_0_6_i_1_n_0
    );
buffer_1_reg_192_255_28_31: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => ADDRB(2),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => ADDRB(2),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => ADDRB(2),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => ADDRB(2),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => Q(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRB(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => Q(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => ADDRB(2),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => Q(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => ADDRB(2),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => Q(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(28),
      DIB => packet(29),
      DIC => '0',
      DID => '0',
      DIE => '0',
      DIF => '0',
      DIG => '0',
      DIH => '0',
      DOA => buffer_1_reg_192_255_28_31_n_0,
      DOB => buffer_1_reg_192_255_28_31_n_1,
      DOC => buffer_1_reg_192_255_28_31_n_2,
      DOD => buffer_1_reg_192_255_28_31_n_3,
      DOE => NLW_buffer_1_reg_192_255_28_31_DOE_UNCONNECTED,
      DOF => NLW_buffer_1_reg_192_255_28_31_DOF_UNCONNECTED,
      DOG => NLW_buffer_1_reg_192_255_28_31_DOG_UNCONNECTED,
      DOH => NLW_buffer_1_reg_192_255_28_31_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_192_255_0_6_i_1_n_0
    );
buffer_1_reg_192_255_7_13: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1) => ADDRG(1),
      ADDRA(0) => ADDRB(0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1) => ADDRG(1),
      ADDRB(0) => ADDRB(0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1) => ADDRG(1),
      ADDRC(0) => ADDRB(0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1) => ADDRG(1),
      ADDRD(0) => ADDRB(0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1) => ADDRG(1),
      ADDRE(0) => ADDRB(0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1) => ADDRG(1),
      ADDRF(0) => ADDRB(0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1) => ADDRG(1),
      ADDRG(0) => ADDRB(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(7),
      DIB => packet(8),
      DIC => packet(9),
      DID => packet(10),
      DIE => packet(11),
      DIF => packet(12),
      DIG => packet(13),
      DIH => '0',
      DOA => buffer_1_reg_192_255_7_13_n_0,
      DOB => buffer_1_reg_192_255_7_13_n_1,
      DOC => buffer_1_reg_192_255_7_13_n_2,
      DOD => buffer_1_reg_192_255_7_13_n_3,
      DOE => buffer_1_reg_192_255_7_13_n_4,
      DOF => buffer_1_reg_192_255_7_13_n_5,
      DOG => buffer_1_reg_192_255_7_13_n_6,
      DOH => NLW_buffer_1_reg_192_255_7_13_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_192_255_0_6_i_1_n_0
    );
buffer_1_reg_64_127_0_6: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => ADDRB(3),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1 downto 0) => ADDRB(1 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => ADDRB(3),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1 downto 0) => ADDRB(1 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => ADDRB(3),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1 downto 0) => ADDRB(1 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => ADDRB(3),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1 downto 0) => ADDRB(1 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => ADDRB(3),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1 downto 0) => ADDRB(1 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => ADDRB(3),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1 downto 0) => ADDRB(1 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => ADDRB(3),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1 downto 0) => ADDRB(1 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(0),
      DIB => packet(1),
      DIC => packet(2),
      DID => packet(3),
      DIE => packet(4),
      DIF => packet(5),
      DIG => packet(6),
      DIH => '0',
      DOA => buffer_1_reg_64_127_0_6_n_0,
      DOB => buffer_1_reg_64_127_0_6_n_1,
      DOC => buffer_1_reg_64_127_0_6_n_2,
      DOD => buffer_1_reg_64_127_0_6_n_3,
      DOE => buffer_1_reg_64_127_0_6_n_4,
      DOF => buffer_1_reg_64_127_0_6_n_5,
      DOG => buffer_1_reg_64_127_0_6_n_6,
      DOH => NLW_buffer_1_reg_64_127_0_6_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_64_127_0_6_i_1_n_0
    );
buffer_1_reg_64_127_0_6_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000004000"
    )
        port map (
      I0 => \write_addr_reg_n_0_[7]\,
      I1 => \write_addr_reg_n_0_[6]\,
      I2 => curr_buffer,
      I3 => packet_valid,
      I4 => tick,
      I5 => rst,
      O => buffer_1_reg_64_127_0_6_i_1_n_0
    );
buffer_1_reg_64_127_14_20: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => Q(3),
      ADDRA(2 downto 0) => ADDRG(2 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => Q(3),
      ADDRB(2 downto 0) => ADDRG(2 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => Q(3),
      ADDRC(2 downto 0) => ADDRG(2 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => Q(3),
      ADDRD(2 downto 0) => ADDRG(2 downto 0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => Q(3),
      ADDRE(2 downto 0) => ADDRG(2 downto 0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => Q(3),
      ADDRF(2 downto 0) => ADDRG(2 downto 0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => Q(3),
      ADDRG(2 downto 0) => ADDRG(2 downto 0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(14),
      DIB => packet(15),
      DIC => packet(16),
      DID => packet(17),
      DIE => packet(18),
      DIF => packet(19),
      DIG => packet(20),
      DIH => '0',
      DOA => buffer_1_reg_64_127_14_20_n_0,
      DOB => buffer_1_reg_64_127_14_20_n_1,
      DOC => buffer_1_reg_64_127_14_20_n_2,
      DOD => buffer_1_reg_64_127_14_20_n_3,
      DOE => buffer_1_reg_64_127_14_20_n_4,
      DOF => buffer_1_reg_64_127_14_20_n_5,
      DOG => buffer_1_reg_64_127_14_20_n_6,
      DOH => NLW_buffer_1_reg_64_127_14_20_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_64_127_0_6_i_1_n_0
    );
buffer_1_reg_64_127_21_27: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => ADDRB(2),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => ADDRB(2),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => ADDRB(2),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => ADDRB(2),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => Q(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRB(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => Q(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => ADDRB(2),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => Q(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => ADDRB(2),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => Q(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(21),
      DIB => packet(22),
      DIC => packet(23),
      DID => packet(24),
      DIE => packet(25),
      DIF => packet(26),
      DIG => packet(27),
      DIH => '0',
      DOA => buffer_1_reg_64_127_21_27_n_0,
      DOB => buffer_1_reg_64_127_21_27_n_1,
      DOC => buffer_1_reg_64_127_21_27_n_2,
      DOD => buffer_1_reg_64_127_21_27_n_3,
      DOE => buffer_1_reg_64_127_21_27_n_4,
      DOF => buffer_1_reg_64_127_21_27_n_5,
      DOG => buffer_1_reg_64_127_21_27_n_6,
      DOH => NLW_buffer_1_reg_64_127_21_27_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_64_127_0_6_i_1_n_0
    );
buffer_1_reg_64_127_28_31: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => ADDRB(4),
      ADDRA(4) => Q(4),
      ADDRA(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRA(2) => ADDRB(2),
      ADDRA(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRA(0) => Q(0),
      ADDRB(5) => ADDRB(4),
      ADDRB(4) => Q(4),
      ADDRB(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRB(2) => ADDRB(2),
      ADDRB(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRB(0) => Q(0),
      ADDRC(5) => ADDRB(4),
      ADDRC(4) => Q(4),
      ADDRC(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRC(2) => ADDRB(2),
      ADDRC(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRC(0) => Q(0),
      ADDRD(5) => ADDRB(4),
      ADDRD(4) => Q(4),
      ADDRD(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRD(2) => ADDRB(2),
      ADDRD(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRD(0) => Q(0),
      ADDRE(5) => ADDRB(4),
      ADDRE(4) => Q(4),
      ADDRE(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRE(2) => ADDRB(2),
      ADDRE(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRE(0) => Q(0),
      ADDRF(5) => ADDRB(4),
      ADDRF(4) => Q(4),
      ADDRF(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRF(2) => ADDRB(2),
      ADDRF(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRF(0) => Q(0),
      ADDRG(5) => ADDRB(4),
      ADDRG(4) => Q(4),
      ADDRG(3) => \read_pointer_reg[3]_rep__0\(1),
      ADDRG(2) => ADDRB(2),
      ADDRG(1) => \read_pointer_reg[3]_rep__0\(0),
      ADDRG(0) => Q(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(28),
      DIB => packet(29),
      DIC => '0',
      DID => '0',
      DIE => '0',
      DIF => '0',
      DIG => '0',
      DIH => '0',
      DOA => buffer_1_reg_64_127_28_31_n_0,
      DOB => buffer_1_reg_64_127_28_31_n_1,
      DOC => buffer_1_reg_64_127_28_31_n_2,
      DOD => buffer_1_reg_64_127_28_31_n_3,
      DOE => NLW_buffer_1_reg_64_127_28_31_DOE_UNCONNECTED,
      DOF => NLW_buffer_1_reg_64_127_28_31_DOF_UNCONNECTED,
      DOG => NLW_buffer_1_reg_64_127_28_31_DOG_UNCONNECTED,
      DOH => NLW_buffer_1_reg_64_127_28_31_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_64_127_0_6_i_1_n_0
    );
buffer_1_reg_64_127_7_13: unisim.vcomponents.RAM64M8
     port map (
      ADDRA(5) => Q(5),
      ADDRA(4) => ADDRG(3),
      ADDRA(3) => ADDRB(3),
      ADDRA(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRA(1 downto 0) => ADDRB(1 downto 0),
      ADDRB(5) => Q(5),
      ADDRB(4) => ADDRG(3),
      ADDRB(3) => ADDRB(3),
      ADDRB(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRB(1 downto 0) => ADDRB(1 downto 0),
      ADDRC(5) => Q(5),
      ADDRC(4) => ADDRG(3),
      ADDRC(3) => ADDRB(3),
      ADDRC(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRC(1 downto 0) => ADDRB(1 downto 0),
      ADDRD(5) => Q(5),
      ADDRD(4) => ADDRG(3),
      ADDRD(3) => ADDRB(3),
      ADDRD(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRD(1) => ADDRB(1),
      ADDRD(0) => ADDRG(0),
      ADDRE(5) => Q(5),
      ADDRE(4) => ADDRG(3),
      ADDRE(3) => ADDRB(3),
      ADDRE(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRE(1) => ADDRB(1),
      ADDRE(0) => ADDRG(0),
      ADDRF(5) => Q(5),
      ADDRF(4) => ADDRG(3),
      ADDRF(3) => ADDRB(3),
      ADDRF(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRF(1) => ADDRB(1),
      ADDRF(0) => ADDRG(0),
      ADDRG(5) => Q(5),
      ADDRG(4) => ADDRG(3),
      ADDRG(3) => ADDRB(3),
      ADDRG(2) => \read_pointer_reg[2]_rep__1\(0),
      ADDRG(1) => ADDRB(1),
      ADDRG(0) => ADDRG(0),
      ADDRH(5) => \write_addr_reg_n_0_[5]\,
      ADDRH(4) => \write_addr_reg_n_0_[4]\,
      ADDRH(3) => \write_addr_reg_n_0_[3]\,
      ADDRH(2) => \write_addr_reg_n_0_[2]\,
      ADDRH(1) => \write_addr_reg_n_0_[1]\,
      ADDRH(0) => \write_addr_reg_n_0_[0]\,
      DIA => packet(7),
      DIB => packet(8),
      DIC => packet(9),
      DID => packet(10),
      DIE => packet(11),
      DIF => packet(12),
      DIG => packet(13),
      DIH => '0',
      DOA => buffer_1_reg_64_127_7_13_n_0,
      DOB => buffer_1_reg_64_127_7_13_n_1,
      DOC => buffer_1_reg_64_127_7_13_n_2,
      DOD => buffer_1_reg_64_127_7_13_n_3,
      DOE => buffer_1_reg_64_127_7_13_n_4,
      DOF => buffer_1_reg_64_127_7_13_n_5,
      DOG => buffer_1_reg_64_127_7_13_n_6,
      DOH => NLW_buffer_1_reg_64_127_7_13_DOH_UNCONNECTED,
      WCLK => clk,
      WE => buffer_1_reg_64_127_0_6_i_1_n_0
    );
buffer_overflow_error_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0040"
    )
        port map (
      I0 => buffer_overflow_error_i_2_n_0,
      I1 => packet_valid,
      I2 => \write_addr_reg_n_0_[8]\,
      I3 => tick,
      I4 => \^buffer_overflow_error\,
      O => buffer_overflow_error_i_1_n_0
    );
buffer_overflow_error_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => \write_addr_reg_n_0_[6]\,
      I1 => \write_addr[8]_i_3_n_0\,
      I2 => \write_addr_reg_n_0_[7]\,
      O => buffer_overflow_error_i_2_n_0
    );
buffer_overflow_error_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => buffer_overflow_error_i_1_n_0,
      Q => \^buffer_overflow_error\,
      R => rst
    );
curr_buffer_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tick,
      I1 => curr_buffer,
      O => curr_buffer_i_1_n_0
    );
curr_buffer_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => curr_buffer_i_1_n_0,
      Q => curr_buffer,
      R => rst
    );
\num_packets_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => tick,
      D => \write_addr_reg_n_0_[0]\,
      Q => \^axis_tlast_delay_reg_0\(0),
      R => rst
    );
\num_packets_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => tick,
      D => \write_addr_reg_n_0_[1]\,
      Q => \^axis_tlast_delay_reg_0\(1),
      R => rst
    );
\num_packets_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => tick,
      D => \write_addr_reg_n_0_[2]\,
      Q => \^axis_tlast_delay_reg_0\(2),
      R => rst
    );
\num_packets_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => tick,
      D => \write_addr_reg_n_0_[3]\,
      Q => \^axis_tlast_delay_reg_0\(3),
      R => rst
    );
\num_packets_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => tick,
      D => \write_addr_reg_n_0_[4]\,
      Q => \^axis_tlast_delay_reg_0\(4),
      R => rst
    );
\num_packets_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => tick,
      D => \write_addr_reg_n_0_[5]\,
      Q => \^axis_tlast_delay_reg_0\(5),
      R => rst
    );
\num_packets_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => tick,
      D => \write_addr_reg_n_0_[6]\,
      Q => \^axis_tlast_delay_reg_0\(6),
      R => rst
    );
\num_packets_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => tick,
      D => \write_addr_reg_n_0_[7]\,
      Q => \^axis_tlast_delay_reg_0\(7),
      R => rst
    );
read_en_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => tick,
      Q => read_en,
      R => rst
    );
read_pointer1_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CB80"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(0),
      I1 => Q(0),
      I2 => \read_pointer_reg[3]_rep__0\(0),
      I3 => \^axis_tlast_delay_reg_0\(1),
      O => \read_pointer_reg[0]_rep__0\(0)
    );
read_pointer1_carry_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1842"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(0),
      I1 => \^axis_tlast_delay_reg_0\(1),
      I2 => Q(0),
      I3 => \read_pointer_reg[3]_rep__0\(0),
      O => \read_pointer_reg[0]_rep__0_0\(0)
    );
\stream_data_out[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_0_6_n_0,
      I1 => buffer_1_reg_128_191_0_6_n_0,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_0_6_n_0,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_0_6_n_0,
      O => dout0(0)
    );
\stream_data_out[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_0_6_n_0,
      I1 => buffer_0_reg_128_191_0_6_n_0,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_0_6_n_0,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_0_6_n_0,
      O => dout00_in(0)
    );
\stream_data_out[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_7_13_n_3,
      I1 => buffer_1_reg_128_191_7_13_n_3,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_7_13_n_3,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_7_13_n_3,
      O => dout0(10)
    );
\stream_data_out[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_7_13_n_3,
      I1 => buffer_0_reg_128_191_7_13_n_3,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_7_13_n_3,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_7_13_n_3,
      O => dout00_in(10)
    );
\stream_data_out[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_7_13_n_4,
      I1 => buffer_1_reg_128_191_7_13_n_4,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_7_13_n_4,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_7_13_n_4,
      O => dout0(11)
    );
\stream_data_out[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_7_13_n_4,
      I1 => buffer_0_reg_128_191_7_13_n_4,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_7_13_n_4,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_7_13_n_4,
      O => dout00_in(11)
    );
\stream_data_out[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_7_13_n_5,
      I1 => buffer_1_reg_128_191_7_13_n_5,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_7_13_n_5,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_7_13_n_5,
      O => dout0(12)
    );
\stream_data_out[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_7_13_n_5,
      I1 => buffer_0_reg_128_191_7_13_n_5,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_7_13_n_5,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_7_13_n_5,
      O => dout00_in(12)
    );
\stream_data_out[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_7_13_n_6,
      I1 => buffer_1_reg_128_191_7_13_n_6,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_7_13_n_6,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_7_13_n_6,
      O => dout0(13)
    );
\stream_data_out[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_7_13_n_6,
      I1 => buffer_0_reg_128_191_7_13_n_6,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_7_13_n_6,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_7_13_n_6,
      O => dout00_in(13)
    );
\stream_data_out[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_14_20_n_0,
      I1 => buffer_1_reg_128_191_14_20_n_0,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_14_20_n_0,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_14_20_n_0,
      O => dout0(14)
    );
\stream_data_out[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_14_20_n_0,
      I1 => buffer_0_reg_128_191_14_20_n_0,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_14_20_n_0,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_14_20_n_0,
      O => dout00_in(14)
    );
\stream_data_out[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_14_20_n_1,
      I1 => buffer_1_reg_128_191_14_20_n_1,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_14_20_n_1,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_14_20_n_1,
      O => dout0(15)
    );
\stream_data_out[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_14_20_n_1,
      I1 => buffer_0_reg_128_191_14_20_n_1,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_14_20_n_1,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_14_20_n_1,
      O => dout00_in(15)
    );
\stream_data_out[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_14_20_n_2,
      I1 => buffer_1_reg_128_191_14_20_n_2,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_14_20_n_2,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_14_20_n_2,
      O => dout0(16)
    );
\stream_data_out[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_14_20_n_2,
      I1 => buffer_0_reg_128_191_14_20_n_2,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_14_20_n_2,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_14_20_n_2,
      O => dout00_in(16)
    );
\stream_data_out[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_14_20_n_3,
      I1 => buffer_1_reg_128_191_14_20_n_3,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_14_20_n_3,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_14_20_n_3,
      O => dout0(17)
    );
\stream_data_out[17]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_14_20_n_3,
      I1 => buffer_0_reg_128_191_14_20_n_3,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_14_20_n_3,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_14_20_n_3,
      O => dout00_in(17)
    );
\stream_data_out[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_14_20_n_4,
      I1 => buffer_1_reg_128_191_14_20_n_4,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_14_20_n_4,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_14_20_n_4,
      O => dout0(18)
    );
\stream_data_out[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_14_20_n_4,
      I1 => buffer_0_reg_128_191_14_20_n_4,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_14_20_n_4,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_14_20_n_4,
      O => dout00_in(18)
    );
\stream_data_out[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_14_20_n_5,
      I1 => buffer_1_reg_128_191_14_20_n_5,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_14_20_n_5,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_14_20_n_5,
      O => dout0(19)
    );
\stream_data_out[19]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_14_20_n_5,
      I1 => buffer_0_reg_128_191_14_20_n_5,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_14_20_n_5,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_14_20_n_5,
      O => dout00_in(19)
    );
\stream_data_out[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_0_6_n_1,
      I1 => buffer_1_reg_128_191_0_6_n_1,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_0_6_n_1,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_0_6_n_1,
      O => dout0(1)
    );
\stream_data_out[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_0_6_n_1,
      I1 => buffer_0_reg_128_191_0_6_n_1,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_0_6_n_1,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_0_6_n_1,
      O => dout00_in(1)
    );
\stream_data_out[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_14_20_n_6,
      I1 => buffer_1_reg_128_191_14_20_n_6,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_14_20_n_6,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_14_20_n_6,
      O => dout0(20)
    );
\stream_data_out[20]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_14_20_n_6,
      I1 => buffer_0_reg_128_191_14_20_n_6,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_14_20_n_6,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_14_20_n_6,
      O => dout00_in(20)
    );
\stream_data_out[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_21_27_n_0,
      I1 => buffer_1_reg_128_191_21_27_n_0,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_21_27_n_0,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_21_27_n_0,
      O => dout0(21)
    );
\stream_data_out[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_21_27_n_0,
      I1 => buffer_0_reg_128_191_21_27_n_0,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_21_27_n_0,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_21_27_n_0,
      O => dout00_in(21)
    );
\stream_data_out[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_21_27_n_1,
      I1 => buffer_1_reg_128_191_21_27_n_1,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_21_27_n_1,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_21_27_n_1,
      O => dout0(22)
    );
\stream_data_out[22]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_21_27_n_1,
      I1 => buffer_0_reg_128_191_21_27_n_1,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_21_27_n_1,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_21_27_n_1,
      O => dout00_in(22)
    );
\stream_data_out[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_21_27_n_2,
      I1 => buffer_1_reg_128_191_21_27_n_2,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_21_27_n_2,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_21_27_n_2,
      O => dout0(23)
    );
\stream_data_out[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_21_27_n_2,
      I1 => buffer_0_reg_128_191_21_27_n_2,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_21_27_n_2,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_21_27_n_2,
      O => dout00_in(23)
    );
\stream_data_out[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_21_27_n_3,
      I1 => buffer_1_reg_128_191_21_27_n_3,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_21_27_n_3,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_21_27_n_3,
      O => dout0(24)
    );
\stream_data_out[24]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_21_27_n_3,
      I1 => buffer_0_reg_128_191_21_27_n_3,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_21_27_n_3,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_21_27_n_3,
      O => dout00_in(24)
    );
\stream_data_out[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_21_27_n_4,
      I1 => buffer_1_reg_128_191_21_27_n_4,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_21_27_n_4,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_21_27_n_4,
      O => dout0(25)
    );
\stream_data_out[25]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_21_27_n_4,
      I1 => buffer_0_reg_128_191_21_27_n_4,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_21_27_n_4,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_21_27_n_4,
      O => dout00_in(25)
    );
\stream_data_out[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_21_27_n_5,
      I1 => buffer_1_reg_128_191_21_27_n_5,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_21_27_n_5,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_21_27_n_5,
      O => dout0(26)
    );
\stream_data_out[26]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_21_27_n_5,
      I1 => buffer_0_reg_128_191_21_27_n_5,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_21_27_n_5,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_21_27_n_5,
      O => dout00_in(26)
    );
\stream_data_out[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_21_27_n_6,
      I1 => buffer_1_reg_128_191_21_27_n_6,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_21_27_n_6,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_21_27_n_6,
      O => dout0(27)
    );
\stream_data_out[27]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_21_27_n_6,
      I1 => buffer_0_reg_128_191_21_27_n_6,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_21_27_n_6,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_21_27_n_6,
      O => dout00_in(27)
    );
\stream_data_out[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_28_31_n_0,
      I1 => buffer_1_reg_128_191_28_31_n_0,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_28_31_n_0,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_28_31_n_0,
      O => dout0(28)
    );
\stream_data_out[28]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_28_31_n_0,
      I1 => buffer_0_reg_128_191_28_31_n_0,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_28_31_n_0,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_28_31_n_0,
      O => dout00_in(28)
    );
\stream_data_out[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_28_31_n_1,
      I1 => buffer_1_reg_128_191_28_31_n_1,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_28_31_n_1,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_28_31_n_1,
      O => dout0(29)
    );
\stream_data_out[29]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_28_31_n_1,
      I1 => buffer_0_reg_128_191_28_31_n_1,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_28_31_n_1,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_28_31_n_1,
      O => dout00_in(29)
    );
\stream_data_out[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_0_6_n_2,
      I1 => buffer_1_reg_128_191_0_6_n_2,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_0_6_n_2,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_0_6_n_2,
      O => dout0(2)
    );
\stream_data_out[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_0_6_n_2,
      I1 => buffer_0_reg_128_191_0_6_n_2,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_0_6_n_2,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_0_6_n_2,
      O => dout00_in(2)
    );
\stream_data_out[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_28_31_n_2,
      I1 => buffer_1_reg_128_191_28_31_n_2,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_28_31_n_2,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_28_31_n_2,
      O => dout0(30)
    );
\stream_data_out[30]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_28_31_n_2,
      I1 => buffer_0_reg_128_191_28_31_n_2,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_28_31_n_2,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_28_31_n_2,
      O => dout00_in(30)
    );
\stream_data_out[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => m00_axis_tready,
      I1 => CO(0),
      I2 => \out\(0),
      O => E(0)
    );
\stream_data_out[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_28_31_n_3,
      I1 => buffer_1_reg_128_191_28_31_n_3,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_28_31_n_3,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_28_31_n_3,
      O => dout0(31)
    );
\stream_data_out[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_28_31_n_3,
      I1 => buffer_0_reg_128_191_28_31_n_3,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_28_31_n_3,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_28_31_n_3,
      O => dout00_in(31)
    );
\stream_data_out[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_0_6_n_3,
      I1 => buffer_1_reg_128_191_0_6_n_3,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_0_6_n_3,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_0_6_n_3,
      O => dout0(3)
    );
\stream_data_out[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_0_6_n_3,
      I1 => buffer_0_reg_128_191_0_6_n_3,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_0_6_n_3,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_0_6_n_3,
      O => dout00_in(3)
    );
\stream_data_out[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_0_6_n_4,
      I1 => buffer_1_reg_128_191_0_6_n_4,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_0_6_n_4,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_0_6_n_4,
      O => dout0(4)
    );
\stream_data_out[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_0_6_n_4,
      I1 => buffer_0_reg_128_191_0_6_n_4,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_0_6_n_4,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_0_6_n_4,
      O => dout00_in(4)
    );
\stream_data_out[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_0_6_n_5,
      I1 => buffer_1_reg_128_191_0_6_n_5,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_0_6_n_5,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_0_6_n_5,
      O => dout0(5)
    );
\stream_data_out[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_0_6_n_5,
      I1 => buffer_0_reg_128_191_0_6_n_5,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_0_6_n_5,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_0_6_n_5,
      O => dout00_in(5)
    );
\stream_data_out[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_0_6_n_6,
      I1 => buffer_1_reg_128_191_0_6_n_6,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_0_6_n_6,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_0_6_n_6,
      O => dout0(6)
    );
\stream_data_out[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_0_6_n_6,
      I1 => buffer_0_reg_128_191_0_6_n_6,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_0_6_n_6,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_0_6_n_6,
      O => dout00_in(6)
    );
\stream_data_out[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_7_13_n_0,
      I1 => buffer_1_reg_128_191_7_13_n_0,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_7_13_n_0,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_7_13_n_0,
      O => dout0(7)
    );
\stream_data_out[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_7_13_n_0,
      I1 => buffer_0_reg_128_191_7_13_n_0,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_7_13_n_0,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_7_13_n_0,
      O => dout00_in(7)
    );
\stream_data_out[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_7_13_n_1,
      I1 => buffer_1_reg_128_191_7_13_n_1,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_7_13_n_1,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_7_13_n_1,
      O => dout0(8)
    );
\stream_data_out[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_7_13_n_1,
      I1 => buffer_0_reg_128_191_7_13_n_1,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_7_13_n_1,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_7_13_n_1,
      O => dout00_in(8)
    );
\stream_data_out[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_1_reg_192_255_7_13_n_2,
      I1 => buffer_1_reg_128_191_7_13_n_2,
      I2 => Q(7),
      I3 => buffer_1_reg_64_127_7_13_n_2,
      I4 => Q(6),
      I5 => buffer_1_reg_0_63_7_13_n_2,
      O => dout0(9)
    );
\stream_data_out[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => buffer_0_reg_192_255_7_13_n_2,
      I1 => buffer_0_reg_128_191_7_13_n_2,
      I2 => Q(7),
      I3 => buffer_0_reg_64_127_7_13_n_2,
      I4 => Q(6),
      I5 => buffer_0_reg_0_63_7_13_n_2,
      O => dout00_in(9)
    );
\stream_data_out_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(0),
      I1 => dout00_in(0),
      O => D(0),
      S => curr_buffer
    );
\stream_data_out_reg[10]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(10),
      I1 => dout00_in(10),
      O => D(10),
      S => curr_buffer
    );
\stream_data_out_reg[11]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(11),
      I1 => dout00_in(11),
      O => D(11),
      S => curr_buffer
    );
\stream_data_out_reg[12]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(12),
      I1 => dout00_in(12),
      O => D(12),
      S => curr_buffer
    );
\stream_data_out_reg[13]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(13),
      I1 => dout00_in(13),
      O => D(13),
      S => curr_buffer
    );
\stream_data_out_reg[14]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(14),
      I1 => dout00_in(14),
      O => D(14),
      S => curr_buffer
    );
\stream_data_out_reg[15]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(15),
      I1 => dout00_in(15),
      O => D(15),
      S => curr_buffer
    );
\stream_data_out_reg[16]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(16),
      I1 => dout00_in(16),
      O => D(16),
      S => curr_buffer
    );
\stream_data_out_reg[17]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(17),
      I1 => dout00_in(17),
      O => D(17),
      S => curr_buffer
    );
\stream_data_out_reg[18]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(18),
      I1 => dout00_in(18),
      O => D(18),
      S => curr_buffer
    );
\stream_data_out_reg[19]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(19),
      I1 => dout00_in(19),
      O => D(19),
      S => curr_buffer
    );
\stream_data_out_reg[1]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(1),
      I1 => dout00_in(1),
      O => D(1),
      S => curr_buffer
    );
\stream_data_out_reg[20]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(20),
      I1 => dout00_in(20),
      O => D(20),
      S => curr_buffer
    );
\stream_data_out_reg[21]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(21),
      I1 => dout00_in(21),
      O => D(21),
      S => curr_buffer
    );
\stream_data_out_reg[22]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(22),
      I1 => dout00_in(22),
      O => D(22),
      S => curr_buffer
    );
\stream_data_out_reg[23]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(23),
      I1 => dout00_in(23),
      O => D(23),
      S => curr_buffer
    );
\stream_data_out_reg[24]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(24),
      I1 => dout00_in(24),
      O => D(24),
      S => curr_buffer
    );
\stream_data_out_reg[25]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(25),
      I1 => dout00_in(25),
      O => D(25),
      S => curr_buffer
    );
\stream_data_out_reg[26]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(26),
      I1 => dout00_in(26),
      O => D(26),
      S => curr_buffer
    );
\stream_data_out_reg[27]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(27),
      I1 => dout00_in(27),
      O => D(27),
      S => curr_buffer
    );
\stream_data_out_reg[28]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(28),
      I1 => dout00_in(28),
      O => D(28),
      S => curr_buffer
    );
\stream_data_out_reg[29]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(29),
      I1 => dout00_in(29),
      O => D(29),
      S => curr_buffer
    );
\stream_data_out_reg[2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(2),
      I1 => dout00_in(2),
      O => D(2),
      S => curr_buffer
    );
\stream_data_out_reg[30]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(30),
      I1 => dout00_in(30),
      O => D(30),
      S => curr_buffer
    );
\stream_data_out_reg[31]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(31),
      I1 => dout00_in(31),
      O => D(31),
      S => curr_buffer
    );
\stream_data_out_reg[3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(3),
      I1 => dout00_in(3),
      O => D(3),
      S => curr_buffer
    );
\stream_data_out_reg[4]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(4),
      I1 => dout00_in(4),
      O => D(4),
      S => curr_buffer
    );
\stream_data_out_reg[5]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(5),
      I1 => dout00_in(5),
      O => D(5),
      S => curr_buffer
    );
\stream_data_out_reg[6]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(6),
      I1 => dout00_in(6),
      O => D(6),
      S => curr_buffer
    );
\stream_data_out_reg[7]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(7),
      I1 => dout00_in(7),
      O => D(7),
      S => curr_buffer
    );
\stream_data_out_reg[8]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(8),
      I1 => dout00_in(8),
      O => D(8),
      S => curr_buffer
    );
\stream_data_out_reg[9]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => dout0(9),
      I1 => dout00_in(9),
      O => D(9),
      S => curr_buffer
    );
tx_done_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000000000"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(7),
      I1 => Q(7),
      I2 => \^axis_tlast_delay_reg_0\(6),
      I3 => Q(6),
      I4 => \read_pointer_reg[3]_rep\,
      I5 => tx_done_i_4_n_0,
      O => \tx_done0__14\
    );
tx_done_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^axis_tlast_delay_reg_0\(0),
      I1 => ADDRG(0),
      I2 => \^axis_tlast_delay_reg_0\(2),
      I3 => Q(2),
      I4 => \^axis_tlast_delay_reg_0\(1),
      I5 => Q(1),
      O => tx_done_i_4_n_0
    );
\write_addr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \write_addr_reg_n_0_[0]\,
      O => \write_addr[0]_i_1_n_0\
    );
\write_addr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \write_addr_reg_n_0_[0]\,
      I1 => \write_addr_reg_n_0_[1]\,
      O => \write_addr[1]_i_1_n_0\
    );
\write_addr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \write_addr_reg_n_0_[1]\,
      I1 => \write_addr_reg_n_0_[0]\,
      I2 => \write_addr_reg_n_0_[2]\,
      O => \write_addr[2]_i_1_n_0\
    );
\write_addr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \write_addr_reg_n_0_[2]\,
      I1 => \write_addr_reg_n_0_[0]\,
      I2 => \write_addr_reg_n_0_[1]\,
      I3 => \write_addr_reg_n_0_[3]\,
      O => \write_addr[3]_i_1_n_0\
    );
\write_addr[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \write_addr_reg_n_0_[3]\,
      I1 => \write_addr_reg_n_0_[1]\,
      I2 => \write_addr_reg_n_0_[0]\,
      I3 => \write_addr_reg_n_0_[2]\,
      I4 => \write_addr_reg_n_0_[4]\,
      O => \write_addr[4]_i_1_n_0\
    );
\write_addr[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \write_addr_reg_n_0_[4]\,
      I1 => \write_addr_reg_n_0_[2]\,
      I2 => \write_addr_reg_n_0_[0]\,
      I3 => \write_addr_reg_n_0_[1]\,
      I4 => \write_addr_reg_n_0_[3]\,
      I5 => \write_addr_reg_n_0_[5]\,
      O => \write_addr[5]_i_1_n_0\
    );
\write_addr[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \write_addr[8]_i_3_n_0\,
      I1 => \write_addr_reg_n_0_[6]\,
      O => \write_addr[6]_i_1_n_0\
    );
\write_addr[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => \write_addr_reg_n_0_[6]\,
      I1 => \write_addr[8]_i_3_n_0\,
      I2 => \write_addr_reg_n_0_[7]\,
      O => \write_addr[7]_i_1_n_0\
    );
\write_addr[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rst,
      I1 => tick,
      O => \write_addr[8]_i_1_n_0\
    );
\write_addr[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
        port map (
      I0 => \write_addr_reg_n_0_[7]\,
      I1 => \write_addr[8]_i_3_n_0\,
      I2 => \write_addr_reg_n_0_[6]\,
      I3 => \write_addr_reg_n_0_[8]\,
      O => \write_addr[8]_i_2_n_0\
    );
\write_addr[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \write_addr_reg_n_0_[4]\,
      I1 => \write_addr_reg_n_0_[2]\,
      I2 => \write_addr_reg_n_0_[0]\,
      I3 => \write_addr_reg_n_0_[1]\,
      I4 => \write_addr_reg_n_0_[3]\,
      I5 => \write_addr_reg_n_0_[5]\,
      O => \write_addr[8]_i_3_n_0\
    );
\write_addr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => packet_valid,
      D => \write_addr[0]_i_1_n_0\,
      Q => \write_addr_reg_n_0_[0]\,
      R => \write_addr[8]_i_1_n_0\
    );
\write_addr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => packet_valid,
      D => \write_addr[1]_i_1_n_0\,
      Q => \write_addr_reg_n_0_[1]\,
      R => \write_addr[8]_i_1_n_0\
    );
\write_addr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => packet_valid,
      D => \write_addr[2]_i_1_n_0\,
      Q => \write_addr_reg_n_0_[2]\,
      R => \write_addr[8]_i_1_n_0\
    );
\write_addr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => packet_valid,
      D => \write_addr[3]_i_1_n_0\,
      Q => \write_addr_reg_n_0_[3]\,
      R => \write_addr[8]_i_1_n_0\
    );
\write_addr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => packet_valid,
      D => \write_addr[4]_i_1_n_0\,
      Q => \write_addr_reg_n_0_[4]\,
      R => \write_addr[8]_i_1_n_0\
    );
\write_addr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => packet_valid,
      D => \write_addr[5]_i_1_n_0\,
      Q => \write_addr_reg_n_0_[5]\,
      R => \write_addr[8]_i_1_n_0\
    );
\write_addr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => packet_valid,
      D => \write_addr[6]_i_1_n_0\,
      Q => \write_addr_reg_n_0_[6]\,
      R => \write_addr[8]_i_1_n_0\
    );
\write_addr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => packet_valid,
      D => \write_addr[7]_i_1_n_0\,
      Q => \write_addr_reg_n_0_[7]\,
      R => \write_addr[8]_i_1_n_0\
    );
\write_addr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => packet_valid,
      D => \write_addr[8]_i_2_n_0\,
      Q => \write_addr_reg_n_0_[8]\,
      R => \write_addr[8]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer is
  port (
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    buffer_to_stream_error : out STD_LOGIC;
    buffer_overflow_error : out STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    rst : in STD_LOGIC;
    tick : in STD_LOGIC;
    clk : in STD_LOGIC;
    packet : in STD_LOGIC_VECTOR ( 29 downto 0 );
    packet_valid : in STD_LOGIC;
    m00_axis_tready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer : entity is "AXIStreamPacketBuffer";
end streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer;

architecture STRUCTURE of streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer is
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_0 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_13 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_14 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_15 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_16 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_17 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_18 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_19 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_20 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_21 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_22 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_23 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_24 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_25 : STD_LOGIC;
  signal AXIStreamPacketBuffer_M00_AXIS_inst_n_26 : STD_LOGIC;
  signal DoubleBuffer_inst_n_2 : STD_LOGIC;
  signal DoubleBuffer_inst_n_44 : STD_LOGIC;
  signal DoubleBuffer_inst_n_45 : STD_LOGIC;
  signal DoubleBuffer_inst_n_46 : STD_LOGIC;
  signal DoubleBuffer_inst_n_47 : STD_LOGIC;
  signal DoubleBuffer_inst_n_48 : STD_LOGIC;
  signal DoubleBuffer_inst_n_49 : STD_LOGIC;
  signal DoubleBuffer_inst_n_50 : STD_LOGIC;
  signal DoubleBuffer_inst_n_51 : STD_LOGIC;
  signal DoubleBuffer_inst_n_52 : STD_LOGIC;
  signal DoubleBuffer_inst_n_53 : STD_LOGIC;
  signal axis_tvalid0 : STD_LOGIC;
  signal data : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal num_packets : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal read_addr : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal read_en : STD_LOGIC;
  signal \tx_done0__14\ : STD_LOGIC;
  signal tx_en : STD_LOGIC;
begin
AXIStreamPacketBuffer_M00_AXIS_inst: entity work.streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer_M00_AXIS
     port map (
      ADDRB(4) => AXIStreamPacketBuffer_M00_AXIS_inst_n_17,
      ADDRB(3) => AXIStreamPacketBuffer_M00_AXIS_inst_n_18,
      ADDRB(2) => AXIStreamPacketBuffer_M00_AXIS_inst_n_19,
      ADDRB(1) => AXIStreamPacketBuffer_M00_AXIS_inst_n_20,
      ADDRB(0) => AXIStreamPacketBuffer_M00_AXIS_inst_n_21,
      ADDRG(3) => AXIStreamPacketBuffer_M00_AXIS_inst_n_13,
      ADDRG(2) => AXIStreamPacketBuffer_M00_AXIS_inst_n_14,
      ADDRG(1) => AXIStreamPacketBuffer_M00_AXIS_inst_n_15,
      ADDRG(0) => AXIStreamPacketBuffer_M00_AXIS_inst_n_16,
      CO(0) => axis_tvalid0,
      D(31 downto 0) => data(31 downto 0),
      DI(3) => DoubleBuffer_inst_n_44,
      DI(2) => DoubleBuffer_inst_n_45,
      DI(1) => DoubleBuffer_inst_n_46,
      DI(0) => DoubleBuffer_inst_n_47,
      E(0) => tx_en,
      Q(7 downto 0) => read_addr(7 downto 0),
      S(3) => DoubleBuffer_inst_n_48,
      S(2) => DoubleBuffer_inst_n_49,
      S(1) => DoubleBuffer_inst_n_50,
      S(0) => DoubleBuffer_inst_n_51,
      axis_tlast_delay_reg_0 => AXIStreamPacketBuffer_M00_AXIS_inst_n_26,
      buffer_to_stream_error => buffer_to_stream_error,
      m00_axis_aclk => m00_axis_aclk,
      m00_axis_aresetn => m00_axis_aresetn,
      m00_axis_tdata(31 downto 0) => m00_axis_tdata(31 downto 0),
      m00_axis_tlast => m00_axis_tlast,
      m00_axis_tready => m00_axis_tready,
      m00_axis_tvalid => m00_axis_tvalid,
      \num_packets_reg[0]\(0) => DoubleBuffer_inst_n_52,
      \num_packets_reg[0]_0\(0) => DoubleBuffer_inst_n_53,
      \num_packets_reg[6]\ => DoubleBuffer_inst_n_2,
      \num_packets_reg[7]\(7 downto 0) => num_packets(7 downto 0),
      \out\(0) => AXIStreamPacketBuffer_M00_AXIS_inst_n_0,
      read_en => read_en,
      \read_pointer_reg[5]_0\(1) => AXIStreamPacketBuffer_M00_AXIS_inst_n_23,
      \read_pointer_reg[5]_0\(0) => AXIStreamPacketBuffer_M00_AXIS_inst_n_24,
      \read_pointer_reg[5]_rep_0\(0) => AXIStreamPacketBuffer_M00_AXIS_inst_n_22,
      \tx_done0__14\ => \tx_done0__14\,
      tx_done_reg_0 => AXIStreamPacketBuffer_M00_AXIS_inst_n_25
    );
DoubleBuffer_inst: entity work.streaming_AXIStreamPacketBuffer_0_1_DoubleBuffer
     port map (
      ADDRB(4) => AXIStreamPacketBuffer_M00_AXIS_inst_n_17,
      ADDRB(3) => AXIStreamPacketBuffer_M00_AXIS_inst_n_18,
      ADDRB(2) => AXIStreamPacketBuffer_M00_AXIS_inst_n_19,
      ADDRB(1) => AXIStreamPacketBuffer_M00_AXIS_inst_n_20,
      ADDRB(0) => AXIStreamPacketBuffer_M00_AXIS_inst_n_21,
      ADDRG(3) => AXIStreamPacketBuffer_M00_AXIS_inst_n_13,
      ADDRG(2) => AXIStreamPacketBuffer_M00_AXIS_inst_n_14,
      ADDRG(1) => AXIStreamPacketBuffer_M00_AXIS_inst_n_15,
      ADDRG(0) => AXIStreamPacketBuffer_M00_AXIS_inst_n_16,
      CO(0) => axis_tvalid0,
      D(31 downto 0) => data(31 downto 0),
      DI(3) => DoubleBuffer_inst_n_44,
      DI(2) => DoubleBuffer_inst_n_45,
      DI(1) => DoubleBuffer_inst_n_46,
      DI(0) => DoubleBuffer_inst_n_47,
      E(0) => tx_en,
      Q(7 downto 0) => read_addr(7 downto 0),
      S(3) => DoubleBuffer_inst_n_48,
      S(2) => DoubleBuffer_inst_n_49,
      S(1) => DoubleBuffer_inst_n_50,
      S(0) => DoubleBuffer_inst_n_51,
      axis_tlast_delay_reg => DoubleBuffer_inst_n_2,
      axis_tlast_delay_reg_0(7 downto 0) => num_packets(7 downto 0),
      buffer_overflow_error => buffer_overflow_error,
      clk => clk,
      m00_axis_tready => m00_axis_tready,
      \out\(0) => AXIStreamPacketBuffer_M00_AXIS_inst_n_0,
      packet(29 downto 0) => packet(29 downto 0),
      packet_valid => packet_valid,
      read_en => read_en,
      \read_pointer_reg[0]\ => AXIStreamPacketBuffer_M00_AXIS_inst_n_26,
      \read_pointer_reg[0]_rep__0\(0) => DoubleBuffer_inst_n_52,
      \read_pointer_reg[0]_rep__0_0\(0) => DoubleBuffer_inst_n_53,
      \read_pointer_reg[2]_rep__1\(0) => AXIStreamPacketBuffer_M00_AXIS_inst_n_22,
      \read_pointer_reg[3]_rep\ => AXIStreamPacketBuffer_M00_AXIS_inst_n_25,
      \read_pointer_reg[3]_rep__0\(1) => AXIStreamPacketBuffer_M00_AXIS_inst_n_23,
      \read_pointer_reg[3]_rep__0\(0) => AXIStreamPacketBuffer_M00_AXIS_inst_n_24,
      rst => rst,
      tick => tick,
      \tx_done0__14\ => \tx_done0__14\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity streaming_AXIStreamPacketBuffer_0_1 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    tick : in STD_LOGIC;
    packet : in STD_LOGIC_VECTOR ( 29 downto 0 );
    packet_valid : in STD_LOGIC;
    buffer_overflow_error : out STD_LOGIC;
    buffer_to_stream_error : out STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of streaming_AXIStreamPacketBuffer_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of streaming_AXIStreamPacketBuffer_0_1 : entity is "streaming_AXIStreamPacketBuffer_0_1,AXIStreamPacketBuffer,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of streaming_AXIStreamPacketBuffer_0_1 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of streaming_AXIStreamPacketBuffer_0_1 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of streaming_AXIStreamPacketBuffer_0_1 : entity is "AXIStreamPacketBuffer,Vivado 2018.2";
end streaming_AXIStreamPacketBuffer_0_1;

architecture STRUCTURE of streaming_AXIStreamPacketBuffer_0_1 is
  signal \<const1>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF m00_axis, ASSOCIATED_RESET rst, FREQ_HZ 99990000, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0";
  attribute X_INTERFACE_INFO of m00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 m00_axis_aclk CLK";
  attribute X_INTERFACE_PARAMETER of m00_axis_aclk : signal is "XIL_INTERFACENAME m00_axis_aclk, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 99990000, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0";
  attribute X_INTERFACE_INFO of m00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 m00_axis_aresetn RST";
  attribute X_INTERFACE_PARAMETER of m00_axis_aresetn : signal is "XIL_INTERFACENAME m00_axis_aresetn, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of m00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 m00_axis TLAST";
  attribute X_INTERFACE_INFO of m00_axis_tready : signal is "xilinx.com:interface:axis:1.0 m00_axis TREADY";
  attribute X_INTERFACE_PARAMETER of m00_axis_tready : signal is "XIL_INTERFACENAME m00_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 99990000, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 m00_axis TVALID";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of m00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 m00_axis TDATA";
  attribute X_INTERFACE_INFO of m00_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 m00_axis TSTRB";
begin
  m00_axis_tstrb(3) <= \<const1>\;
  m00_axis_tstrb(2) <= \<const1>\;
  m00_axis_tstrb(1) <= \<const1>\;
  m00_axis_tstrb(0) <= \<const1>\;
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.streaming_AXIStreamPacketBuffer_0_1_AXIStreamPacketBuffer
     port map (
      buffer_overflow_error => buffer_overflow_error,
      buffer_to_stream_error => buffer_to_stream_error,
      clk => clk,
      m00_axis_aclk => m00_axis_aclk,
      m00_axis_aresetn => m00_axis_aresetn,
      m00_axis_tdata(31 downto 0) => m00_axis_tdata(31 downto 0),
      m00_axis_tlast => m00_axis_tlast,
      m00_axis_tready => m00_axis_tready,
      m00_axis_tvalid => m00_axis_tvalid,
      packet(29 downto 0) => packet(29 downto 0),
      packet_valid => packet_valid,
      rst => rst,
      tick => tick
    );
end STRUCTURE;
