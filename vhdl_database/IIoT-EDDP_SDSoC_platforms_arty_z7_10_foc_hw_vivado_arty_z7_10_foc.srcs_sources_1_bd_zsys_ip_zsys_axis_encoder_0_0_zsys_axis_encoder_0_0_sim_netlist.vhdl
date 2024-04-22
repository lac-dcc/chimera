-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
-- Date        : Thu Oct  5 15:58:21 2017
-- Host        : free-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               B:/cores/2017.1/design/TEC0053/platforms/arty_z7_10_foc/hw/vivado/arty_z7_10_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_encoder_0_0/zsys_axis_encoder_0_0_sim_netlist.vhdl
-- Design      : zsys_axis_encoder_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_encoder_0_0_axis_encoder_v1_0 is
  port (
    m_angle_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    period_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rpm_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_angle_tvalid : out STD_LOGIC;
    m_rpm_tvalid : out STD_LOGIC;
    m_rpm_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    axis_aclk : in STD_LOGIC;
    A : in STD_LOGIC;
    I : in STD_LOGIC;
    B : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zsys_axis_encoder_0_0_axis_encoder_v1_0 : entity is "axis_encoder_v1_0";
end zsys_axis_encoder_0_0_axis_encoder_v1_0;

architecture STRUCTURE of zsys_axis_encoder_0_0_axis_encoder_v1_0 is
  signal a_f : STD_LOGIC;
  signal a_i : STD_LOGIC;
  signal a_sr : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal b_f : STD_LOGIC;
  signal b_i : STD_LOGIC;
  signal clip_down_angle : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal clip_down_angle0 : STD_LOGIC_VECTOR ( 15 downto 2 );
  signal \clip_down_angle0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \clip_down_angle0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \clip_down_angle0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \clip_down_angle0_carry__0_n_0\ : STD_LOGIC;
  signal \clip_down_angle0_carry__0_n_1\ : STD_LOGIC;
  signal \clip_down_angle0_carry__0_n_2\ : STD_LOGIC;
  signal \clip_down_angle0_carry__0_n_3\ : STD_LOGIC;
  signal \clip_down_angle0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \clip_down_angle0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \clip_down_angle0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \clip_down_angle0_carry__1_n_0\ : STD_LOGIC;
  signal \clip_down_angle0_carry__1_n_1\ : STD_LOGIC;
  signal \clip_down_angle0_carry__1_n_2\ : STD_LOGIC;
  signal \clip_down_angle0_carry__1_n_3\ : STD_LOGIC;
  signal \clip_down_angle0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \clip_down_angle0_carry__2_n_3\ : STD_LOGIC;
  signal clip_down_angle0_carry_i_1_n_0 : STD_LOGIC;
  signal clip_down_angle0_carry_i_2_n_0 : STD_LOGIC;
  signal clip_down_angle0_carry_i_3_n_0 : STD_LOGIC;
  signal clip_down_angle0_carry_i_4_n_0 : STD_LOGIC;
  signal clip_down_angle0_carry_n_0 : STD_LOGIC;
  signal clip_down_angle0_carry_n_1 : STD_LOGIC;
  signal clip_down_angle0_carry_n_2 : STD_LOGIC;
  signal clip_down_angle0_carry_n_3 : STD_LOGIC;
  signal \clip_down_angle[10]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[11]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[12]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[13]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[14]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[15]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[2]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[3]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[4]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[5]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[6]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[7]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[8]_i_1_n_0\ : STD_LOGIC;
  signal \clip_down_angle[9]_i_1_n_0\ : STD_LOGIC;
  signal clip_up_angle : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal clip_up_angle0 : STD_LOGIC_VECTOR ( 15 downto 2 );
  signal \clip_up_angle0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \clip_up_angle0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \clip_up_angle0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \clip_up_angle0_carry__0_n_0\ : STD_LOGIC;
  signal \clip_up_angle0_carry__0_n_1\ : STD_LOGIC;
  signal \clip_up_angle0_carry__0_n_2\ : STD_LOGIC;
  signal \clip_up_angle0_carry__0_n_3\ : STD_LOGIC;
  signal \clip_up_angle0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \clip_up_angle0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \clip_up_angle0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \clip_up_angle0_carry__1_n_0\ : STD_LOGIC;
  signal \clip_up_angle0_carry__1_n_1\ : STD_LOGIC;
  signal \clip_up_angle0_carry__1_n_2\ : STD_LOGIC;
  signal \clip_up_angle0_carry__1_n_3\ : STD_LOGIC;
  signal \clip_up_angle0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \clip_up_angle0_carry__2_n_3\ : STD_LOGIC;
  signal clip_up_angle0_carry_i_1_n_0 : STD_LOGIC;
  signal clip_up_angle0_carry_i_2_n_0 : STD_LOGIC;
  signal clip_up_angle0_carry_i_3_n_0 : STD_LOGIC;
  signal clip_up_angle0_carry_i_4_n_0 : STD_LOGIC;
  signal clip_up_angle0_carry_n_0 : STD_LOGIC;
  signal clip_up_angle0_carry_n_1 : STD_LOGIC;
  signal clip_up_angle0_carry_n_2 : STD_LOGIC;
  signal clip_up_angle0_carry_n_3 : STD_LOGIC;
  signal clip_up_angle1 : STD_LOGIC;
  signal \clip_up_angle1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \clip_up_angle1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \clip_up_angle1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \clip_up_angle1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \clip_up_angle1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \clip_up_angle1_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \clip_up_angle1_carry__0_n_1\ : STD_LOGIC;
  signal \clip_up_angle1_carry__0_n_2\ : STD_LOGIC;
  signal \clip_up_angle1_carry__0_n_3\ : STD_LOGIC;
  signal clip_up_angle1_carry_i_1_n_0 : STD_LOGIC;
  signal clip_up_angle1_carry_i_2_n_0 : STD_LOGIC;
  signal clip_up_angle1_carry_i_3_n_0 : STD_LOGIC;
  signal clip_up_angle1_carry_i_4_n_0 : STD_LOGIC;
  signal clip_up_angle1_carry_i_5_n_0 : STD_LOGIC;
  signal clip_up_angle1_carry_i_6_n_0 : STD_LOGIC;
  signal clip_up_angle1_carry_i_7_n_0 : STD_LOGIC;
  signal clip_up_angle1_carry_n_0 : STD_LOGIC;
  signal clip_up_angle1_carry_n_1 : STD_LOGIC;
  signal clip_up_angle1_carry_n_2 : STD_LOGIC;
  signal clip_up_angle1_carry_n_3 : STD_LOGIC;
  signal \clip_up_angle[10]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[11]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[12]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[13]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[14]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[15]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[2]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[3]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[4]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[5]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[6]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[7]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[8]_i_1_n_0\ : STD_LOGIC;
  signal \clip_up_angle[9]_i_1_n_0\ : STD_LOGIC;
  signal cnt : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \cnt[12]_i_10_n_0\ : STD_LOGIC;
  signal \cnt[12]_i_11_n_0\ : STD_LOGIC;
  signal \cnt[12]_i_4_n_0\ : STD_LOGIC;
  signal \cnt[12]_i_5_n_0\ : STD_LOGIC;
  signal \cnt[12]_i_6_n_0\ : STD_LOGIC;
  signal \cnt[12]_i_7_n_0\ : STD_LOGIC;
  signal \cnt[12]_i_8_n_0\ : STD_LOGIC;
  signal \cnt[12]_i_9_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_10_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_11_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_12_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_13_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_14_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_15_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_16_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_17_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_18_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_19_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_20_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_21_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_2_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_5_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_7_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_8_n_0\ : STD_LOGIC;
  signal \cnt[15]_i_9_n_0\ : STD_LOGIC;
  signal \cnt[4]_i_10_n_0\ : STD_LOGIC;
  signal \cnt[4]_i_11_n_0\ : STD_LOGIC;
  signal \cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \cnt[4]_i_6_n_0\ : STD_LOGIC;
  signal \cnt[4]_i_7_n_0\ : STD_LOGIC;
  signal \cnt[4]_i_8_n_0\ : STD_LOGIC;
  signal \cnt[4]_i_9_n_0\ : STD_LOGIC;
  signal \cnt[8]_i_10_n_0\ : STD_LOGIC;
  signal \cnt[8]_i_11_n_0\ : STD_LOGIC;
  signal \cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal \cnt[8]_i_6_n_0\ : STD_LOGIC;
  signal \cnt[8]_i_7_n_0\ : STD_LOGIC;
  signal \cnt[8]_i_8_n_0\ : STD_LOGIC;
  signal \cnt[8]_i_9_n_0\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_reg[12]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_reg[12]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_reg[12]_i_3_n_1\ : STD_LOGIC;
  signal \cnt_reg[12]_i_3_n_2\ : STD_LOGIC;
  signal \cnt_reg[12]_i_3_n_3\ : STD_LOGIC;
  signal \cnt_reg[12]_i_3_n_4\ : STD_LOGIC;
  signal \cnt_reg[12]_i_3_n_5\ : STD_LOGIC;
  signal \cnt_reg[12]_i_3_n_6\ : STD_LOGIC;
  signal \cnt_reg[12]_i_3_n_7\ : STD_LOGIC;
  signal \cnt_reg[15]_i_4_n_2\ : STD_LOGIC;
  signal \cnt_reg[15]_i_4_n_3\ : STD_LOGIC;
  signal \cnt_reg[15]_i_6_n_2\ : STD_LOGIC;
  signal \cnt_reg[15]_i_6_n_3\ : STD_LOGIC;
  signal \cnt_reg[15]_i_6_n_5\ : STD_LOGIC;
  signal \cnt_reg[15]_i_6_n_6\ : STD_LOGIC;
  signal \cnt_reg[15]_i_6_n_7\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_reg[4]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_reg[4]_i_3_n_1\ : STD_LOGIC;
  signal \cnt_reg[4]_i_3_n_2\ : STD_LOGIC;
  signal \cnt_reg[4]_i_3_n_3\ : STD_LOGIC;
  signal \cnt_reg[4]_i_3_n_4\ : STD_LOGIC;
  signal \cnt_reg[4]_i_3_n_5\ : STD_LOGIC;
  signal \cnt_reg[4]_i_3_n_6\ : STD_LOGIC;
  signal \cnt_reg[4]_i_3_n_7\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \cnt_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \cnt_reg[8]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_reg[8]_i_3_n_1\ : STD_LOGIC;
  signal \cnt_reg[8]_i_3_n_2\ : STD_LOGIC;
  signal \cnt_reg[8]_i_3_n_3\ : STD_LOGIC;
  signal \cnt_reg[8]_i_3_n_4\ : STD_LOGIC;
  signal \cnt_reg[8]_i_3_n_5\ : STD_LOGIC;
  signal \cnt_reg[8]_i_3_n_6\ : STD_LOGIC;
  signal \cnt_reg[8]_i_3_n_7\ : STD_LOGIC;
  signal corr_angle : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal corr_angle0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \corr_angle[11]_i_2_n_0\ : STD_LOGIC;
  signal \corr_angle[11]_i_3_n_0\ : STD_LOGIC;
  signal \corr_angle[11]_i_4_n_0\ : STD_LOGIC;
  signal \corr_angle[11]_i_5_n_0\ : STD_LOGIC;
  signal \corr_angle[15]_i_2_n_0\ : STD_LOGIC;
  signal \corr_angle[15]_i_3_n_0\ : STD_LOGIC;
  signal \corr_angle[15]_i_4_n_0\ : STD_LOGIC;
  signal \corr_angle[15]_i_5_n_0\ : STD_LOGIC;
  signal \corr_angle[3]_i_2_n_0\ : STD_LOGIC;
  signal \corr_angle[3]_i_3_n_0\ : STD_LOGIC;
  signal \corr_angle[3]_i_4_n_0\ : STD_LOGIC;
  signal \corr_angle[3]_i_5_n_0\ : STD_LOGIC;
  signal \corr_angle[7]_i_2_n_0\ : STD_LOGIC;
  signal \corr_angle[7]_i_3_n_0\ : STD_LOGIC;
  signal \corr_angle[7]_i_4_n_0\ : STD_LOGIC;
  signal \corr_angle[7]_i_5_n_0\ : STD_LOGIC;
  signal \corr_angle_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \corr_angle_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \corr_angle_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \corr_angle_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \corr_angle_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \corr_angle_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \corr_angle_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \corr_angle_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \corr_angle_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \corr_angle_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \corr_angle_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \corr_angle_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \corr_angle_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \corr_angle_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \corr_angle_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 15 downto 1 );
  signal \div_cnt[0]_i_2_n_0\ : STD_LOGIC;
  signal \div_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \div_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \div_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \div_cnt[12]_i_2_n_0\ : STD_LOGIC;
  signal \div_cnt[12]_i_3_n_0\ : STD_LOGIC;
  signal \div_cnt[12]_i_4_n_0\ : STD_LOGIC;
  signal \div_cnt[12]_i_5_n_0\ : STD_LOGIC;
  signal \div_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \div_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \div_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \div_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \div_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \div_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \div_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \div_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal div_cnt_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \div_cnt_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \div_cnt_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \div_cnt_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \div_cnt_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \div_cnt_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \div_cnt_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \div_cnt_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \div_cnt_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \div_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \div_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \div_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \div_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \div_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \div_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \div_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \div_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \div_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \div_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \div_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \div_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \div_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \div_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \div_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \div_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \div_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \div_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \div_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \div_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \div_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \div_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \div_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal div_value : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal div_value0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \div_value0_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__2_n_0\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__2_n_1\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__2_n_2\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__2_n_3\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__3_n_0\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__3_n_1\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__3_n_2\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__3_n_3\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__4_n_0\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__4_n_1\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__4_n_2\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__4_n_3\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__5_n_0\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__5_n_1\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__5_n_2\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__5_n_3\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__6_n_1\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__6_n_2\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry__6_n_3\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \div_value0_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \div_value1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \div_value1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \div_value1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \div_value1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \div_value1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \div_value1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \div_value1_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \div_value1_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \div_value1_carry__0_n_0\ : STD_LOGIC;
  signal \div_value1_carry__0_n_1\ : STD_LOGIC;
  signal \div_value1_carry__0_n_2\ : STD_LOGIC;
  signal \div_value1_carry__0_n_3\ : STD_LOGIC;
  signal \div_value1_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \div_value1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \div_value1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \div_value1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \div_value1_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \div_value1_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \div_value1_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \div_value1_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \div_value1_carry__1_n_0\ : STD_LOGIC;
  signal \div_value1_carry__1_n_1\ : STD_LOGIC;
  signal \div_value1_carry__1_n_2\ : STD_LOGIC;
  signal \div_value1_carry__1_n_3\ : STD_LOGIC;
  signal \div_value1_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \div_value1_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \div_value1_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \div_value1_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \div_value1_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \div_value1_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \div_value1_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \div_value1_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \div_value1_carry__2_n_0\ : STD_LOGIC;
  signal \div_value1_carry__2_n_1\ : STD_LOGIC;
  signal \div_value1_carry__2_n_2\ : STD_LOGIC;
  signal \div_value1_carry__2_n_3\ : STD_LOGIC;
  signal div_value1_carry_i_1_n_0 : STD_LOGIC;
  signal div_value1_carry_i_2_n_0 : STD_LOGIC;
  signal div_value1_carry_i_3_n_0 : STD_LOGIC;
  signal div_value1_carry_i_4_n_0 : STD_LOGIC;
  signal div_value1_carry_i_5_n_0 : STD_LOGIC;
  signal div_value1_carry_i_6_n_0 : STD_LOGIC;
  signal div_value1_carry_i_7_n_0 : STD_LOGIC;
  signal div_value1_carry_i_8_n_0 : STD_LOGIC;
  signal div_value1_carry_n_0 : STD_LOGIC;
  signal div_value1_carry_n_1 : STD_LOGIC;
  signal div_value1_carry_n_2 : STD_LOGIC;
  signal div_value1_carry_n_3 : STD_LOGIC;
  signal \div_value[31]_i_1_n_0\ : STD_LOGIC;
  signal divider : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \divider[31]_i_1_n_0\ : STD_LOGIC;
  signal \dp_valid_reg[2]_srl3_n_0\ : STD_LOGIC;
  signal \filter_a_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \filter_a_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \filter_a_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \filter_a_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \filter_a_cnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \filter_a_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \filter_a_cnt_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \filter_b_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \filter_b_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \filter_b_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \filter_b_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \filter_b_cnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \filter_b_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \filter_b_cnt_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \filter_i_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \filter_i_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \filter_i_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \filter_i_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \filter_i_cnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \filter_i_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \filter_i_cnt_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__3_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__4_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__5_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__6_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__6_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__6_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__6_i_4_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal i_f : STD_LOGIC;
  signal i_i : STD_LOGIC;
  signal \m_period_tvalid0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__0_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__0_n_1\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__0_n_2\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__0_n_3\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__1_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__1_n_1\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__1_n_2\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__1_n_3\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__2_n_0\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__2_n_1\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__2_n_2\ : STD_LOGIC;
  signal \m_period_tvalid0_carry__2_n_3\ : STD_LOGIC;
  signal m_period_tvalid0_carry_i_1_n_0 : STD_LOGIC;
  signal m_period_tvalid0_carry_i_2_n_0 : STD_LOGIC;
  signal m_period_tvalid0_carry_i_3_n_0 : STD_LOGIC;
  signal m_period_tvalid0_carry_i_4_n_0 : STD_LOGIC;
  signal m_period_tvalid0_carry_i_5_n_0 : STD_LOGIC;
  signal m_period_tvalid0_carry_i_6_n_0 : STD_LOGIC;
  signal m_period_tvalid0_carry_i_7_n_0 : STD_LOGIC;
  signal m_period_tvalid0_carry_i_8_n_0 : STD_LOGIC;
  signal m_period_tvalid0_carry_n_0 : STD_LOGIC;
  signal m_period_tvalid0_carry_n_1 : STD_LOGIC;
  signal m_period_tvalid0_carry_n_2 : STD_LOGIC;
  signal m_period_tvalid0_carry_n_3 : STD_LOGIC;
  signal m_rpm_tvalid_i_1_n_0 : STD_LOGIC;
  signal \out_period_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \out_period_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \out_period_cnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \out_period_cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \out_period_cnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \out_period_cnt[5]_i_1_n_0\ : STD_LOGIC;
  signal \out_period_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \out_period_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \out_period_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \out_period_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \out_period_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \out_period_cnt_reg_n_0_[5]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \period_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \period_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \period_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \period_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \period_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal \period_cnt[12]_i_2_n_0\ : STD_LOGIC;
  signal \period_cnt[12]_i_3_n_0\ : STD_LOGIC;
  signal \period_cnt[12]_i_4_n_0\ : STD_LOGIC;
  signal \period_cnt[12]_i_5_n_0\ : STD_LOGIC;
  signal \period_cnt[16]_i_2_n_0\ : STD_LOGIC;
  signal \period_cnt[16]_i_3_n_0\ : STD_LOGIC;
  signal \period_cnt[16]_i_4_n_0\ : STD_LOGIC;
  signal \period_cnt[16]_i_5_n_0\ : STD_LOGIC;
  signal \period_cnt[20]_i_2_n_0\ : STD_LOGIC;
  signal \period_cnt[20]_i_3_n_0\ : STD_LOGIC;
  signal \period_cnt[20]_i_4_n_0\ : STD_LOGIC;
  signal \period_cnt[20]_i_5_n_0\ : STD_LOGIC;
  signal \period_cnt[24]_i_2_n_0\ : STD_LOGIC;
  signal \period_cnt[24]_i_3_n_0\ : STD_LOGIC;
  signal \period_cnt[24]_i_4_n_0\ : STD_LOGIC;
  signal \period_cnt[24]_i_5_n_0\ : STD_LOGIC;
  signal \period_cnt[28]_i_2_n_0\ : STD_LOGIC;
  signal \period_cnt[28]_i_3_n_0\ : STD_LOGIC;
  signal \period_cnt[28]_i_4_n_0\ : STD_LOGIC;
  signal \period_cnt[28]_i_5_n_0\ : STD_LOGIC;
  signal \period_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \period_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \period_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \period_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \period_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \period_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \period_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \period_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal period_cnt_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \period_cnt_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \period_cnt_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \period_cnt_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \period_cnt_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \period_cnt_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \period_cnt_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \period_cnt_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \period_cnt_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \period_cnt_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \period_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \period_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \period_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \period_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \period_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \period_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \period_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \period_cnt_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \period_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \period_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \period_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \period_cnt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \period_cnt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \period_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \period_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \period_cnt_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \period_cnt_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \period_cnt_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \period_cnt_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \period_cnt_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \period_cnt_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \period_cnt_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \period_cnt_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \period_cnt_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \period_cnt_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \period_cnt_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \period_cnt_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \period_cnt_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \period_cnt_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \period_cnt_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \period_cnt_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \period_cnt_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \period_cnt_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \period_cnt_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \period_cnt_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \period_cnt_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \period_cnt_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \period_cnt_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \period_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \period_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \period_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \period_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \period_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \period_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \period_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \period_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \period_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \period_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \period_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \period_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \period_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \period_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \period_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \period_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \^period_data\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal period_dir : STD_LOGIC;
  signal period_dir_i_1_n_0 : STD_LOGIC;
  signal period_prev : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal period_value : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \period_value[15]_i_1_n_0\ : STD_LOGIC;
  signal \period_value[15]_i_2_n_0\ : STD_LOGIC;
  signal \period_value[15]_i_3_n_0\ : STD_LOGIC;
  signal \period_value[15]_i_4_n_0\ : STD_LOGIC;
  signal \period_value[15]_i_5_n_0\ : STD_LOGIC;
  signal \period_value[15]_i_6_n_0\ : STD_LOGIC;
  signal \period_value[15]_i_7_n_0\ : STD_LOGIC;
  signal \period_value[15]_i_8_n_0\ : STD_LOGIC;
  signal \period_value[15]_i_9_n_0\ : STD_LOGIC;
  signal \^rpm_data\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \rpm_data_i[15]_i_10_n_0\ : STD_LOGIC;
  signal \rpm_data_i[15]_i_1_n_0\ : STD_LOGIC;
  signal \rpm_data_i[15]_i_2_n_0\ : STD_LOGIC;
  signal \rpm_data_i[15]_i_3_n_0\ : STD_LOGIC;
  signal \rpm_data_i[15]_i_4_n_0\ : STD_LOGIC;
  signal \rpm_data_i[15]_i_5_n_0\ : STD_LOGIC;
  signal \rpm_data_i[15]_i_6_n_0\ : STD_LOGIC;
  signal \rpm_data_i[15]_i_7_n_0\ : STD_LOGIC;
  signal \rpm_data_i[15]_i_8_n_0\ : STD_LOGIC;
  signal \rpm_data_i[15]_i_9_n_0\ : STD_LOGIC;
  signal sm_state : STD_LOGIC;
  signal sm_state_i_1_n_0 : STD_LOGIC;
  signal update : STD_LOGIC;
  signal \NLW_clip_down_angle0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_clip_down_angle0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_clip_up_angle0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_clip_up_angle0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_clip_up_angle1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_clip_up_angle1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_cnt_reg[15]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_cnt_reg[15]_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_cnt_reg[15]_i_6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_cnt_reg[15]_i_6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_corr_angle_reg[15]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_div_cnt_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_div_value0_inferred__0/i__carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_div_value1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_div_value1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_div_value1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_div_value1_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_m_period_tvalid0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_m_period_tvalid0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_m_period_tvalid0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_m_period_tvalid0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_period_cnt_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \clip_down_angle[10]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \clip_down_angle[11]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \clip_down_angle[12]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \clip_down_angle[13]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \clip_down_angle[14]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \clip_down_angle[15]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \clip_down_angle[2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \clip_down_angle[3]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \clip_down_angle[4]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \clip_down_angle[5]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \clip_down_angle[6]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \clip_down_angle[7]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \clip_down_angle[8]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \clip_down_angle[9]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \clip_up_angle[10]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \clip_up_angle[11]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \clip_up_angle[12]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \clip_up_angle[13]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \clip_up_angle[14]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \clip_up_angle[15]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \clip_up_angle[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \clip_up_angle[3]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \clip_up_angle[4]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \clip_up_angle[5]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \clip_up_angle[6]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \clip_up_angle[7]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \clip_up_angle[8]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \clip_up_angle[9]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \cnt[15]_i_12\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \cnt[15]_i_13\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cnt[15]_i_19\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cnt[15]_i_20\ : label is "soft_lutpair4";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \dp_valid_reg[2]_srl3\ : label is "\U0/dp_valid_reg ";
  attribute srl_name : string;
  attribute srl_name of \dp_valid_reg[2]_srl3\ : label is "\U0/dp_valid_reg[2]_srl3 ";
  attribute SOFT_HLUTNM of \filter_a_cnt[0]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \filter_a_cnt[1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \filter_a_cnt[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \filter_a_cnt[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \filter_b_cnt[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \filter_b_cnt[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \filter_b_cnt[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \filter_b_cnt[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \filter_i_cnt[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \filter_i_cnt[1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \filter_i_cnt[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \filter_i_cnt[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \out_period_cnt[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \out_period_cnt[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \out_period_cnt[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \out_period_cnt[4]_i_1\ : label is "soft_lutpair0";
begin
  period_data(15 downto 0) <= \^period_data\(15 downto 0);
  rpm_data(15 downto 0) <= \^rpm_data\(15 downto 0);
a_f_reg: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \filter_a_cnt_reg__0\(4),
      Q => a_f,
      R => '0'
    );
a_i_reg: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => A,
      Q => a_i,
      R => '0'
    );
\a_sr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => '1',
      D => a_f,
      Q => a_sr(0),
      R => '0'
    );
\a_sr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => '1',
      D => a_sr(0),
      Q => a_sr(1),
      R => '0'
    );
b_f_reg: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \filter_b_cnt_reg__0\(4),
      Q => b_f,
      R => '0'
    );
b_i_reg: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => B,
      Q => b_i,
      R => '0'
    );
clip_down_angle0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => clip_down_angle0_carry_n_0,
      CO(2) => clip_down_angle0_carry_n_1,
      CO(1) => clip_down_angle0_carry_n_2,
      CO(0) => clip_down_angle0_carry_n_3,
      CYINIT => '0',
      DI(3) => clip_up_angle(5),
      DI(2) => '0',
      DI(1) => clip_up_angle(3),
      DI(0) => '0',
      O(3 downto 0) => clip_down_angle0(5 downto 2),
      S(3) => clip_down_angle0_carry_i_1_n_0,
      S(2) => clip_down_angle0_carry_i_2_n_0,
      S(1) => clip_down_angle0_carry_i_3_n_0,
      S(0) => clip_down_angle0_carry_i_4_n_0
    );
\clip_down_angle0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => clip_down_angle0_carry_n_0,
      CO(3) => \clip_down_angle0_carry__0_n_0\,
      CO(2) => \clip_down_angle0_carry__0_n_1\,
      CO(1) => \clip_down_angle0_carry__0_n_2\,
      CO(0) => \clip_down_angle0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => clip_up_angle(9 downto 6),
      O(3 downto 0) => clip_down_angle0(9 downto 6),
      S(3) => \clip_down_angle0_carry__0_i_1_n_0\,
      S(2) => \clip_down_angle0_carry__0_i_2_n_0\,
      S(1) => \clip_down_angle0_carry__0_i_3_n_0\,
      S(0) => \clip_down_angle0_carry__0_i_4_n_0\
    );
\clip_down_angle0_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clip_up_angle(9),
      O => \clip_down_angle0_carry__0_i_1_n_0\
    );
\clip_down_angle0_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clip_up_angle(8),
      O => \clip_down_angle0_carry__0_i_2_n_0\
    );
\clip_down_angle0_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clip_up_angle(7),
      O => \clip_down_angle0_carry__0_i_3_n_0\
    );
\clip_down_angle0_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clip_up_angle(6),
      O => \clip_down_angle0_carry__0_i_4_n_0\
    );
\clip_down_angle0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clip_down_angle0_carry__0_n_0\,
      CO(3) => \clip_down_angle0_carry__1_n_0\,
      CO(2) => \clip_down_angle0_carry__1_n_1\,
      CO(1) => \clip_down_angle0_carry__1_n_2\,
      CO(0) => \clip_down_angle0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => clip_down_angle0(13 downto 10),
      S(3) => \clip_down_angle0_carry__1_i_1_n_0\,
      S(2) => \clip_down_angle0_carry__1_i_2_n_0\,
      S(1) => \clip_down_angle0_carry__1_i_3_n_0\,
      S(0) => \clip_down_angle0_carry__1_i_4_n_0\
    );
\clip_down_angle0_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clip_up_angle(13),
      O => \clip_down_angle0_carry__1_i_1_n_0\
    );
\clip_down_angle0_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clip_up_angle(12),
      O => \clip_down_angle0_carry__1_i_2_n_0\
    );
\clip_down_angle0_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clip_up_angle(11),
      O => \clip_down_angle0_carry__1_i_3_n_0\
    );
\clip_down_angle0_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clip_up_angle(10),
      O => \clip_down_angle0_carry__1_i_4_n_0\
    );
\clip_down_angle0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \clip_down_angle0_carry__1_n_0\,
      CO(3 downto 1) => \NLW_clip_down_angle0_carry__2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \clip_down_angle0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_clip_down_angle0_carry__2_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => clip_down_angle0(15 downto 14),
      S(3 downto 2) => B"00",
      S(1) => \clip_down_angle0_carry__2_i_1_n_0\,
      S(0) => \clip_down_angle0_carry__2_i_2_n_0\
    );
\clip_down_angle0_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clip_up_angle(15),
      O => \clip_down_angle0_carry__2_i_1_n_0\
    );
\clip_down_angle0_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clip_up_angle(14),
      O => \clip_down_angle0_carry__2_i_2_n_0\
    );
clip_down_angle0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clip_up_angle(5),
      O => clip_down_angle0_carry_i_1_n_0
    );
clip_down_angle0_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clip_up_angle(4),
      O => clip_down_angle0_carry_i_2_n_0
    );
clip_down_angle0_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clip_up_angle(3),
      O => clip_down_angle0_carry_i_3_n_0
    );
clip_down_angle0_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => clip_up_angle(2),
      O => clip_down_angle0_carry_i_4_n_0
    );
\clip_down_angle[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(10),
      I1 => clip_up_angle(10),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[10]_i_1_n_0\
    );
\clip_down_angle[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(11),
      I1 => clip_up_angle(11),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[11]_i_1_n_0\
    );
\clip_down_angle[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(12),
      I1 => clip_up_angle(12),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[12]_i_1_n_0\
    );
\clip_down_angle[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(13),
      I1 => clip_up_angle(13),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[13]_i_1_n_0\
    );
\clip_down_angle[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(14),
      I1 => clip_up_angle(14),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[14]_i_1_n_0\
    );
\clip_down_angle[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => clip_down_angle0(15),
      I1 => clip_up_angle(15),
      O => \clip_down_angle[15]_i_1_n_0\
    );
\clip_down_angle[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(2),
      I1 => clip_up_angle(2),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[2]_i_1_n_0\
    );
\clip_down_angle[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(3),
      I1 => clip_up_angle(3),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[3]_i_1_n_0\
    );
\clip_down_angle[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(4),
      I1 => clip_up_angle(4),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[4]_i_1_n_0\
    );
\clip_down_angle[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(5),
      I1 => clip_up_angle(5),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[5]_i_1_n_0\
    );
\clip_down_angle[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(6),
      I1 => clip_up_angle(6),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[6]_i_1_n_0\
    );
\clip_down_angle[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(7),
      I1 => clip_up_angle(7),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[7]_i_1_n_0\
    );
\clip_down_angle[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(8),
      I1 => clip_up_angle(8),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[8]_i_1_n_0\
    );
\clip_down_angle[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_down_angle0(9),
      I1 => clip_up_angle(9),
      I2 => clip_up_angle(15),
      O => \clip_down_angle[9]_i_1_n_0\
    );
\clip_down_angle_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => clip_up_angle(0),
      Q => clip_down_angle(0),
      R => '0'
    );
\clip_down_angle_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[10]_i_1_n_0\,
      Q => clip_down_angle(10),
      R => '0'
    );
\clip_down_angle_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[11]_i_1_n_0\,
      Q => clip_down_angle(11),
      R => '0'
    );
\clip_down_angle_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[12]_i_1_n_0\,
      Q => clip_down_angle(12),
      R => '0'
    );
\clip_down_angle_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[13]_i_1_n_0\,
      Q => clip_down_angle(13),
      R => '0'
    );
\clip_down_angle_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[14]_i_1_n_0\,
      Q => clip_down_angle(14),
      R => '0'
    );
\clip_down_angle_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[15]_i_1_n_0\,
      Q => clip_down_angle(15),
      R => '0'
    );
\clip_down_angle_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => clip_up_angle(1),
      Q => clip_down_angle(1),
      R => '0'
    );
\clip_down_angle_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[2]_i_1_n_0\,
      Q => clip_down_angle(2),
      R => '0'
    );
\clip_down_angle_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[3]_i_1_n_0\,
      Q => clip_down_angle(3),
      R => '0'
    );
\clip_down_angle_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[4]_i_1_n_0\,
      Q => clip_down_angle(4),
      R => '0'
    );
\clip_down_angle_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[5]_i_1_n_0\,
      Q => clip_down_angle(5),
      R => '0'
    );
\clip_down_angle_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[6]_i_1_n_0\,
      Q => clip_down_angle(6),
      R => '0'
    );
\clip_down_angle_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[7]_i_1_n_0\,
      Q => clip_down_angle(7),
      R => '0'
    );
\clip_down_angle_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[8]_i_1_n_0\,
      Q => clip_down_angle(8),
      R => '0'
    );
\clip_down_angle_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_down_angle[9]_i_1_n_0\,
      Q => clip_down_angle(9),
      R => '0'
    );
clip_up_angle0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => clip_up_angle0_carry_n_0,
      CO(2) => clip_up_angle0_carry_n_1,
      CO(1) => clip_up_angle0_carry_n_2,
      CO(0) => clip_up_angle0_carry_n_3,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 1) => corr_angle(4 downto 3),
      DI(0) => '0',
      O(3 downto 0) => clip_up_angle0(5 downto 2),
      S(3) => clip_up_angle0_carry_i_1_n_0,
      S(2) => clip_up_angle0_carry_i_2_n_0,
      S(1) => clip_up_angle0_carry_i_3_n_0,
      S(0) => clip_up_angle0_carry_i_4_n_0
    );
\clip_up_angle0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => clip_up_angle0_carry_n_0,
      CO(3) => \clip_up_angle0_carry__0_n_0\,
      CO(2) => \clip_up_angle0_carry__0_n_1\,
      CO(1) => \clip_up_angle0_carry__0_n_2\,
      CO(0) => \clip_up_angle0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => clip_up_angle0(9 downto 6),
      S(3) => \clip_up_angle0_carry__0_i_1_n_0\,
      S(2) => \clip_up_angle0_carry__0_i_2_n_0\,
      S(1) => \clip_up_angle0_carry__0_i_3_n_0\,
      S(0) => \clip_up_angle0_carry__0_i_4_n_0\
    );
\clip_up_angle0_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => corr_angle(9),
      O => \clip_up_angle0_carry__0_i_1_n_0\
    );
\clip_up_angle0_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => corr_angle(8),
      O => \clip_up_angle0_carry__0_i_2_n_0\
    );
\clip_up_angle0_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => corr_angle(7),
      O => \clip_up_angle0_carry__0_i_3_n_0\
    );
\clip_up_angle0_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => corr_angle(6),
      O => \clip_up_angle0_carry__0_i_4_n_0\
    );
\clip_up_angle0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \clip_up_angle0_carry__0_n_0\,
      CO(3) => \clip_up_angle0_carry__1_n_0\,
      CO(2) => \clip_up_angle0_carry__1_n_1\,
      CO(1) => \clip_up_angle0_carry__1_n_2\,
      CO(0) => \clip_up_angle0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => corr_angle(13 downto 10),
      O(3 downto 0) => clip_up_angle0(13 downto 10),
      S(3) => \clip_up_angle0_carry__1_i_1_n_0\,
      S(2) => \clip_up_angle0_carry__1_i_2_n_0\,
      S(1) => \clip_up_angle0_carry__1_i_3_n_0\,
      S(0) => \clip_up_angle0_carry__1_i_4_n_0\
    );
\clip_up_angle0_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => corr_angle(13),
      O => \clip_up_angle0_carry__1_i_1_n_0\
    );
\clip_up_angle0_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => corr_angle(12),
      O => \clip_up_angle0_carry__1_i_2_n_0\
    );
\clip_up_angle0_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => corr_angle(11),
      O => \clip_up_angle0_carry__1_i_3_n_0\
    );
\clip_up_angle0_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => corr_angle(10),
      O => \clip_up_angle0_carry__1_i_4_n_0\
    );
\clip_up_angle0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \clip_up_angle0_carry__1_n_0\,
      CO(3 downto 1) => \NLW_clip_up_angle0_carry__2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \clip_up_angle0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => corr_angle(14),
      O(3 downto 2) => \NLW_clip_up_angle0_carry__2_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => clip_up_angle0(15 downto 14),
      S(3 downto 2) => B"00",
      S(1) => \clip_up_angle0_carry__2_i_1_n_0\,
      S(0) => \clip_up_angle0_carry__2_i_2_n_0\
    );
\clip_up_angle0_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => corr_angle(15),
      O => \clip_up_angle0_carry__2_i_1_n_0\
    );
\clip_up_angle0_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => corr_angle(14),
      O => \clip_up_angle0_carry__2_i_2_n_0\
    );
clip_up_angle0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => corr_angle(5),
      O => clip_up_angle0_carry_i_1_n_0
    );
clip_up_angle0_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => corr_angle(4),
      O => clip_up_angle0_carry_i_2_n_0
    );
clip_up_angle0_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => corr_angle(3),
      O => clip_up_angle0_carry_i_3_n_0
    );
clip_up_angle0_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => corr_angle(2),
      O => clip_up_angle0_carry_i_4_n_0
    );
clip_up_angle1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => clip_up_angle1_carry_n_0,
      CO(2) => clip_up_angle1_carry_n_1,
      CO(1) => clip_up_angle1_carry_n_2,
      CO(0) => clip_up_angle1_carry_n_3,
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => clip_up_angle1_carry_i_1_n_0,
      DI(1) => clip_up_angle1_carry_i_2_n_0,
      DI(0) => clip_up_angle1_carry_i_3_n_0,
      O(3 downto 0) => NLW_clip_up_angle1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => clip_up_angle1_carry_i_4_n_0,
      S(2) => clip_up_angle1_carry_i_5_n_0,
      S(1) => clip_up_angle1_carry_i_6_n_0,
      S(0) => clip_up_angle1_carry_i_7_n_0
    );
\clip_up_angle1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => clip_up_angle1_carry_n_0,
      CO(3) => clip_up_angle1,
      CO(2) => \clip_up_angle1_carry__0_n_1\,
      CO(1) => \clip_up_angle1_carry__0_n_2\,
      CO(0) => \clip_up_angle1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \clip_up_angle1_carry__0_i_1_n_0\,
      DI(2) => \clip_up_angle1_carry__0_i_2_n_0\,
      DI(1) => \clip_up_angle1_carry__0_i_3_n_0\,
      DI(0) => '0',
      O(3 downto 0) => \NLW_clip_up_angle1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \clip_up_angle1_carry__0_i_4_n_0\,
      S(2) => \clip_up_angle1_carry__0_i_5_n_0\,
      S(1) => \clip_up_angle1_carry__0_i_6_n_0\,
      S(0) => \clip_up_angle1_carry__0_i_7_n_0\
    );
\clip_up_angle1_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => corr_angle(14),
      I1 => corr_angle(15),
      O => \clip_up_angle1_carry__0_i_1_n_0\
    );
\clip_up_angle1_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => corr_angle(12),
      I1 => corr_angle(13),
      O => \clip_up_angle1_carry__0_i_2_n_0\
    );
\clip_up_angle1_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => corr_angle(10),
      I1 => corr_angle(11),
      O => \clip_up_angle1_carry__0_i_3_n_0\
    );
\clip_up_angle1_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => corr_angle(14),
      I1 => corr_angle(15),
      O => \clip_up_angle1_carry__0_i_4_n_0\
    );
\clip_up_angle1_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => corr_angle(12),
      I1 => corr_angle(13),
      O => \clip_up_angle1_carry__0_i_5_n_0\
    );
\clip_up_angle1_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => corr_angle(10),
      I1 => corr_angle(11),
      O => \clip_up_angle1_carry__0_i_6_n_0\
    );
\clip_up_angle1_carry__0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => corr_angle(8),
      I1 => corr_angle(9),
      O => \clip_up_angle1_carry__0_i_7_n_0\
    );
clip_up_angle1_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => corr_angle(4),
      I1 => corr_angle(5),
      O => clip_up_angle1_carry_i_1_n_0
    );
clip_up_angle1_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => corr_angle(2),
      I1 => corr_angle(3),
      O => clip_up_angle1_carry_i_2_n_0
    );
clip_up_angle1_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => corr_angle(0),
      I1 => corr_angle(1),
      O => clip_up_angle1_carry_i_3_n_0
    );
clip_up_angle1_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => corr_angle(6),
      I1 => corr_angle(7),
      O => clip_up_angle1_carry_i_4_n_0
    );
clip_up_angle1_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => corr_angle(5),
      I1 => corr_angle(4),
      O => clip_up_angle1_carry_i_5_n_0
    );
clip_up_angle1_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => corr_angle(3),
      I1 => corr_angle(2),
      O => clip_up_angle1_carry_i_6_n_0
    );
clip_up_angle1_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => corr_angle(0),
      I1 => corr_angle(1),
      O => clip_up_angle1_carry_i_7_n_0
    );
\clip_up_angle[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(10),
      I1 => corr_angle(10),
      I2 => clip_up_angle1,
      O => \clip_up_angle[10]_i_1_n_0\
    );
\clip_up_angle[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(11),
      I1 => corr_angle(11),
      I2 => clip_up_angle1,
      O => \clip_up_angle[11]_i_1_n_0\
    );
\clip_up_angle[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(12),
      I1 => corr_angle(12),
      I2 => clip_up_angle1,
      O => \clip_up_angle[12]_i_1_n_0\
    );
\clip_up_angle[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(13),
      I1 => corr_angle(13),
      I2 => clip_up_angle1,
      O => \clip_up_angle[13]_i_1_n_0\
    );
\clip_up_angle[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(14),
      I1 => corr_angle(14),
      I2 => clip_up_angle1,
      O => \clip_up_angle[14]_i_1_n_0\
    );
\clip_up_angle[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(15),
      I1 => corr_angle(15),
      I2 => clip_up_angle1,
      O => \clip_up_angle[15]_i_1_n_0\
    );
\clip_up_angle[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(2),
      I1 => corr_angle(2),
      I2 => clip_up_angle1,
      O => \clip_up_angle[2]_i_1_n_0\
    );
\clip_up_angle[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(3),
      I1 => corr_angle(3),
      I2 => clip_up_angle1,
      O => \clip_up_angle[3]_i_1_n_0\
    );
\clip_up_angle[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(4),
      I1 => corr_angle(4),
      I2 => clip_up_angle1,
      O => \clip_up_angle[4]_i_1_n_0\
    );
\clip_up_angle[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(5),
      I1 => corr_angle(5),
      I2 => clip_up_angle1,
      O => \clip_up_angle[5]_i_1_n_0\
    );
\clip_up_angle[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(6),
      I1 => corr_angle(6),
      I2 => clip_up_angle1,
      O => \clip_up_angle[6]_i_1_n_0\
    );
\clip_up_angle[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(7),
      I1 => corr_angle(7),
      I2 => clip_up_angle1,
      O => \clip_up_angle[7]_i_1_n_0\
    );
\clip_up_angle[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(8),
      I1 => corr_angle(8),
      I2 => clip_up_angle1,
      O => \clip_up_angle[8]_i_1_n_0\
    );
\clip_up_angle[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => clip_up_angle0(9),
      I1 => corr_angle(9),
      I2 => clip_up_angle1,
      O => \clip_up_angle[9]_i_1_n_0\
    );
\clip_up_angle_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => corr_angle(0),
      Q => clip_up_angle(0),
      R => '0'
    );
\clip_up_angle_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[10]_i_1_n_0\,
      Q => clip_up_angle(10),
      R => '0'
    );
\clip_up_angle_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[11]_i_1_n_0\,
      Q => clip_up_angle(11),
      R => '0'
    );
\clip_up_angle_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[12]_i_1_n_0\,
      Q => clip_up_angle(12),
      R => '0'
    );
\clip_up_angle_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[13]_i_1_n_0\,
      Q => clip_up_angle(13),
      R => '0'
    );
\clip_up_angle_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[14]_i_1_n_0\,
      Q => clip_up_angle(14),
      R => '0'
    );
\clip_up_angle_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[15]_i_1_n_0\,
      Q => clip_up_angle(15),
      R => '0'
    );
\clip_up_angle_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => corr_angle(1),
      Q => clip_up_angle(1),
      R => '0'
    );
\clip_up_angle_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[2]_i_1_n_0\,
      Q => clip_up_angle(2),
      R => '0'
    );
\clip_up_angle_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[3]_i_1_n_0\,
      Q => clip_up_angle(3),
      R => '0'
    );
\clip_up_angle_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[4]_i_1_n_0\,
      Q => clip_up_angle(4),
      R => '0'
    );
\clip_up_angle_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[5]_i_1_n_0\,
      Q => clip_up_angle(5),
      R => '0'
    );
\clip_up_angle_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[6]_i_1_n_0\,
      Q => clip_up_angle(6),
      R => '0'
    );
\clip_up_angle_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[7]_i_1_n_0\,
      Q => clip_up_angle(7),
      R => '0'
    );
\clip_up_angle_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[8]_i_1_n_0\,
      Q => clip_up_angle(8),
      R => '0'
    );
\clip_up_angle_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \clip_up_angle[9]_i_1_n_0\,
      Q => clip_up_angle(9),
      R => '0'
    );
\cnt[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3F22"
    )
        port map (
      I0 => \cnt[15]_i_5_n_0\,
      I1 => cnt(0),
      I2 => \cnt[15]_i_7_n_0\,
      I3 => b_f,
      O => p_1_in(0)
    );
\cnt[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0008888"
    )
        port map (
      I0 => data0(10),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[12]_i_3_n_6\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(10)
    );
\cnt[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0008888"
    )
        port map (
      I0 => data0(11),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[12]_i_3_n_5\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(11)
    );
\cnt[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0008888"
    )
        port map (
      I0 => data0(12),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[12]_i_3_n_4\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(12)
    );
\cnt[12]_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(10),
      O => \cnt[12]_i_10_n_0\
    );
\cnt[12]_i_11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(9),
      O => \cnt[12]_i_11_n_0\
    );
\cnt[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(12),
      O => \cnt[12]_i_4_n_0\
    );
\cnt[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(11),
      O => \cnt[12]_i_5_n_0\
    );
\cnt[12]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(10),
      O => \cnt[12]_i_6_n_0\
    );
\cnt[12]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(9),
      O => \cnt[12]_i_7_n_0\
    );
\cnt[12]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(12),
      O => \cnt[12]_i_8_n_0\
    );
\cnt[12]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(11),
      O => \cnt[12]_i_9_n_0\
    );
\cnt[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0008888"
    )
        port map (
      I0 => data0(13),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[15]_i_6_n_7\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(13)
    );
\cnt[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0008888"
    )
        port map (
      I0 => data0(14),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[15]_i_6_n_6\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(14)
    );
\cnt[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => a_sr(1),
      I1 => a_sr(0),
      I2 => i_f,
      O => \cnt[15]_i_1_n_0\
    );
\cnt[15]_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(13),
      O => \cnt[15]_i_10_n_0\
    );
\cnt[15]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => cnt(6),
      I1 => cnt(5),
      I2 => cnt(8),
      I3 => cnt(9),
      O => \cnt[15]_i_11_n_0\
    );
\cnt[15]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => cnt(0),
      I1 => cnt(7),
      I2 => cnt(2),
      I3 => cnt(1),
      O => \cnt[15]_i_12_n_0\
    );
\cnt[15]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt(12),
      I1 => cnt(3),
      I2 => cnt(15),
      I3 => cnt(13),
      O => \cnt[15]_i_13_n_0\
    );
\cnt[15]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt(10),
      I1 => cnt(14),
      I2 => cnt(4),
      I3 => cnt(11),
      O => \cnt[15]_i_14_n_0\
    );
\cnt[15]_i_15\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(15),
      O => \cnt[15]_i_15_n_0\
    );
\cnt[15]_i_16\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(14),
      O => \cnt[15]_i_16_n_0\
    );
\cnt[15]_i_17\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(13),
      O => \cnt[15]_i_17_n_0\
    );
\cnt[15]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt(10),
      I1 => cnt(11),
      I2 => cnt(8),
      I3 => cnt(9),
      O => \cnt[15]_i_18_n_0\
    );
\cnt[15]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt(15),
      I1 => cnt(14),
      I2 => cnt(12),
      I3 => cnt(13),
      O => \cnt[15]_i_19_n_0\
    );
\cnt[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => a_sr(0),
      I1 => a_sr(1),
      O => \cnt[15]_i_2_n_0\
    );
\cnt[15]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt(2),
      I1 => cnt(3),
      I2 => cnt(0),
      I3 => cnt(1),
      O => \cnt[15]_i_20_n_0\
    );
\cnt[15]_i_21\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt(6),
      I1 => cnt(7),
      I2 => cnt(4),
      I3 => cnt(5),
      O => \cnt[15]_i_21_n_0\
    );
\cnt[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0008888"
    )
        port map (
      I0 => data0(15),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[15]_i_6_n_5\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(15)
    );
\cnt[15]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \cnt[15]_i_11_n_0\,
      I1 => \cnt[15]_i_12_n_0\,
      I2 => \cnt[15]_i_13_n_0\,
      I3 => \cnt[15]_i_14_n_0\,
      O => \cnt[15]_i_5_n_0\
    );
\cnt[15]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \cnt[15]_i_18_n_0\,
      I1 => \cnt[15]_i_19_n_0\,
      I2 => \cnt[15]_i_20_n_0\,
      I3 => \cnt[15]_i_21_n_0\,
      O => \cnt[15]_i_7_n_0\
    );
\cnt[15]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(15),
      O => \cnt[15]_i_8_n_0\
    );
\cnt[15]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(14),
      O => \cnt[15]_i_9_n_0\
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0FF8888"
    )
        port map (
      I0 => data0(1),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[4]_i_3_n_7\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(1)
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0FF8888"
    )
        port map (
      I0 => data0(2),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[4]_i_3_n_6\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(2)
    );
\cnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0008888"
    )
        port map (
      I0 => data0(3),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[4]_i_3_n_5\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(3)
    );
\cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0008888"
    )
        port map (
      I0 => data0(4),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[4]_i_3_n_4\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(4)
    );
\cnt[4]_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(2),
      O => \cnt[4]_i_10_n_0\
    );
\cnt[4]_i_11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(1),
      O => \cnt[4]_i_11_n_0\
    );
\cnt[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(4),
      O => \cnt[4]_i_4_n_0\
    );
\cnt[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(3),
      O => \cnt[4]_i_5_n_0\
    );
\cnt[4]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(2),
      O => \cnt[4]_i_6_n_0\
    );
\cnt[4]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(1),
      O => \cnt[4]_i_7_n_0\
    );
\cnt[4]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(4),
      O => \cnt[4]_i_8_n_0\
    );
\cnt[4]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(3),
      O => \cnt[4]_i_9_n_0\
    );
\cnt[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0FF8888"
    )
        port map (
      I0 => data0(5),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[8]_i_3_n_7\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(5)
    );
\cnt[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0FF8888"
    )
        port map (
      I0 => data0(6),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[8]_i_3_n_6\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(6)
    );
\cnt[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0FF8888"
    )
        port map (
      I0 => data0(7),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[8]_i_3_n_5\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(7)
    );
\cnt[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0FF8888"
    )
        port map (
      I0 => data0(8),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[8]_i_3_n_4\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(8)
    );
\cnt[8]_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(6),
      O => \cnt[8]_i_10_n_0\
    );
\cnt[8]_i_11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(5),
      O => \cnt[8]_i_11_n_0\
    );
\cnt[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(8),
      O => \cnt[8]_i_4_n_0\
    );
\cnt[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(7),
      O => \cnt[8]_i_5_n_0\
    );
\cnt[8]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(6),
      O => \cnt[8]_i_6_n_0\
    );
\cnt[8]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt(5),
      O => \cnt[8]_i_7_n_0\
    );
\cnt[8]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(8),
      O => \cnt[8]_i_8_n_0\
    );
\cnt[8]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(7),
      O => \cnt[8]_i_9_n_0\
    );
\cnt[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0FF8888"
    )
        port map (
      I0 => data0(9),
      I1 => \cnt[15]_i_5_n_0\,
      I2 => \cnt_reg[12]_i_3_n_7\,
      I3 => \cnt[15]_i_7_n_0\,
      I4 => b_f,
      O => p_1_in(9)
    );
\cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(0),
      Q => cnt(0),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(10),
      Q => cnt(10),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(11),
      Q => cnt(11),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(12),
      Q => cnt(12),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[12]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[8]_i_2_n_0\,
      CO(3) => \cnt_reg[12]_i_2_n_0\,
      CO(2) => \cnt_reg[12]_i_2_n_1\,
      CO(1) => \cnt_reg[12]_i_2_n_2\,
      CO(0) => \cnt_reg[12]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3) => \cnt[12]_i_4_n_0\,
      S(2) => \cnt[12]_i_5_n_0\,
      S(1) => \cnt[12]_i_6_n_0\,
      S(0) => \cnt[12]_i_7_n_0\
    );
\cnt_reg[12]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[8]_i_3_n_0\,
      CO(3) => \cnt_reg[12]_i_3_n_0\,
      CO(2) => \cnt_reg[12]_i_3_n_1\,
      CO(1) => \cnt_reg[12]_i_3_n_2\,
      CO(0) => \cnt_reg[12]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => cnt(12 downto 9),
      O(3) => \cnt_reg[12]_i_3_n_4\,
      O(2) => \cnt_reg[12]_i_3_n_5\,
      O(1) => \cnt_reg[12]_i_3_n_6\,
      O(0) => \cnt_reg[12]_i_3_n_7\,
      S(3) => \cnt[12]_i_8_n_0\,
      S(2) => \cnt[12]_i_9_n_0\,
      S(1) => \cnt[12]_i_10_n_0\,
      S(0) => \cnt[12]_i_11_n_0\
    );
\cnt_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(13),
      Q => cnt(13),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(14),
      Q => cnt(14),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(15),
      Q => cnt(15),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[15]_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[12]_i_2_n_0\,
      CO(3 downto 2) => \NLW_cnt_reg[15]_i_4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \cnt_reg[15]_i_4_n_2\,
      CO(0) => \cnt_reg[15]_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_cnt_reg[15]_i_4_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(15 downto 13),
      S(3) => '0',
      S(2) => \cnt[15]_i_8_n_0\,
      S(1) => \cnt[15]_i_9_n_0\,
      S(0) => \cnt[15]_i_10_n_0\
    );
\cnt_reg[15]_i_6\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[12]_i_3_n_0\,
      CO(3 downto 2) => \NLW_cnt_reg[15]_i_6_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \cnt_reg[15]_i_6_n_2\,
      CO(0) => \cnt_reg[15]_i_6_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => cnt(14 downto 13),
      O(3) => \NLW_cnt_reg[15]_i_6_O_UNCONNECTED\(3),
      O(2) => \cnt_reg[15]_i_6_n_5\,
      O(1) => \cnt_reg[15]_i_6_n_6\,
      O(0) => \cnt_reg[15]_i_6_n_7\,
      S(3) => '0',
      S(2) => \cnt[15]_i_15_n_0\,
      S(1) => \cnt[15]_i_16_n_0\,
      S(0) => \cnt[15]_i_17_n_0\
    );
\cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(1),
      Q => cnt(1),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(2),
      Q => cnt(2),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(3),
      Q => cnt(3),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(4),
      Q => cnt(4),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[4]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \cnt_reg[4]_i_2_n_0\,
      CO(2) => \cnt_reg[4]_i_2_n_1\,
      CO(1) => \cnt_reg[4]_i_2_n_2\,
      CO(0) => \cnt_reg[4]_i_2_n_3\,
      CYINIT => cnt(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3) => \cnt[4]_i_4_n_0\,
      S(2) => \cnt[4]_i_5_n_0\,
      S(1) => \cnt[4]_i_6_n_0\,
      S(0) => \cnt[4]_i_7_n_0\
    );
\cnt_reg[4]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \cnt_reg[4]_i_3_n_0\,
      CO(2) => \cnt_reg[4]_i_3_n_1\,
      CO(1) => \cnt_reg[4]_i_3_n_2\,
      CO(0) => \cnt_reg[4]_i_3_n_3\,
      CYINIT => cnt(0),
      DI(3 downto 0) => cnt(4 downto 1),
      O(3) => \cnt_reg[4]_i_3_n_4\,
      O(2) => \cnt_reg[4]_i_3_n_5\,
      O(1) => \cnt_reg[4]_i_3_n_6\,
      O(0) => \cnt_reg[4]_i_3_n_7\,
      S(3) => \cnt[4]_i_8_n_0\,
      S(2) => \cnt[4]_i_9_n_0\,
      S(1) => \cnt[4]_i_10_n_0\,
      S(0) => \cnt[4]_i_11_n_0\
    );
\cnt_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(5),
      Q => cnt(5),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(6),
      Q => cnt(6),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(7),
      Q => cnt(7),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(8),
      Q => cnt(8),
      R => \cnt[15]_i_1_n_0\
    );
\cnt_reg[8]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[4]_i_2_n_0\,
      CO(3) => \cnt_reg[8]_i_2_n_0\,
      CO(2) => \cnt_reg[8]_i_2_n_1\,
      CO(1) => \cnt_reg[8]_i_2_n_2\,
      CO(0) => \cnt_reg[8]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3) => \cnt[8]_i_4_n_0\,
      S(2) => \cnt[8]_i_5_n_0\,
      S(1) => \cnt[8]_i_6_n_0\,
      S(0) => \cnt[8]_i_7_n_0\
    );
\cnt_reg[8]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt_reg[4]_i_3_n_0\,
      CO(3) => \cnt_reg[8]_i_3_n_0\,
      CO(2) => \cnt_reg[8]_i_3_n_1\,
      CO(1) => \cnt_reg[8]_i_3_n_2\,
      CO(0) => \cnt_reg[8]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => cnt(8 downto 5),
      O(3) => \cnt_reg[8]_i_3_n_4\,
      O(2) => \cnt_reg[8]_i_3_n_5\,
      O(1) => \cnt_reg[8]_i_3_n_6\,
      O(0) => \cnt_reg[8]_i_3_n_7\,
      S(3) => \cnt[8]_i_8_n_0\,
      S(2) => \cnt[8]_i_9_n_0\,
      S(1) => \cnt[8]_i_10_n_0\,
      S(0) => \cnt[8]_i_11_n_0\
    );
\cnt_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => p_1_in(9),
      Q => cnt(9),
      R => \cnt[15]_i_1_n_0\
    );
\corr_angle[11]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(11),
      O => \corr_angle[11]_i_2_n_0\
    );
\corr_angle[11]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(10),
      O => \corr_angle[11]_i_3_n_0\
    );
\corr_angle[11]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(9),
      O => \corr_angle[11]_i_4_n_0\
    );
\corr_angle[11]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(8),
      O => \corr_angle[11]_i_5_n_0\
    );
\corr_angle[15]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(15),
      O => \corr_angle[15]_i_2_n_0\
    );
\corr_angle[15]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(14),
      O => \corr_angle[15]_i_3_n_0\
    );
\corr_angle[15]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(13),
      O => \corr_angle[15]_i_4_n_0\
    );
\corr_angle[15]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(12),
      O => \corr_angle[15]_i_5_n_0\
    );
\corr_angle[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(3),
      O => \corr_angle[3]_i_2_n_0\
    );
\corr_angle[3]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(2),
      O => \corr_angle[3]_i_3_n_0\
    );
\corr_angle[3]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(1),
      O => \corr_angle[3]_i_4_n_0\
    );
\corr_angle[3]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(0),
      O => \corr_angle[3]_i_5_n_0\
    );
\corr_angle[7]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(7),
      O => \corr_angle[7]_i_2_n_0\
    );
\corr_angle[7]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(6),
      O => \corr_angle[7]_i_3_n_0\
    );
\corr_angle[7]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(5),
      O => \corr_angle[7]_i_4_n_0\
    );
\corr_angle[7]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(4),
      O => \corr_angle[7]_i_5_n_0\
    );
\corr_angle_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(0),
      Q => corr_angle(0),
      R => '0'
    );
\corr_angle_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(10),
      Q => corr_angle(10),
      R => '0'
    );
\corr_angle_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(11),
      Q => corr_angle(11),
      R => '0'
    );
\corr_angle_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \corr_angle_reg[7]_i_1_n_0\,
      CO(3) => \corr_angle_reg[11]_i_1_n_0\,
      CO(2) => \corr_angle_reg[11]_i_1_n_1\,
      CO(1) => \corr_angle_reg[11]_i_1_n_2\,
      CO(0) => \corr_angle_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => cnt(11 downto 8),
      O(3 downto 0) => corr_angle0(11 downto 8),
      S(3) => \corr_angle[11]_i_2_n_0\,
      S(2) => \corr_angle[11]_i_3_n_0\,
      S(1) => \corr_angle[11]_i_4_n_0\,
      S(0) => \corr_angle[11]_i_5_n_0\
    );
\corr_angle_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(12),
      Q => corr_angle(12),
      R => '0'
    );
\corr_angle_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(13),
      Q => corr_angle(13),
      R => '0'
    );
\corr_angle_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(14),
      Q => corr_angle(14),
      R => '0'
    );
\corr_angle_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(15),
      Q => corr_angle(15),
      R => '0'
    );
\corr_angle_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \corr_angle_reg[11]_i_1_n_0\,
      CO(3) => \NLW_corr_angle_reg[15]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \corr_angle_reg[15]_i_1_n_1\,
      CO(1) => \corr_angle_reg[15]_i_1_n_2\,
      CO(0) => \corr_angle_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => cnt(14 downto 12),
      O(3 downto 0) => corr_angle0(15 downto 12),
      S(3) => \corr_angle[15]_i_2_n_0\,
      S(2) => \corr_angle[15]_i_3_n_0\,
      S(1) => \corr_angle[15]_i_4_n_0\,
      S(0) => \corr_angle[15]_i_5_n_0\
    );
\corr_angle_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(1),
      Q => corr_angle(1),
      R => '0'
    );
\corr_angle_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(2),
      Q => corr_angle(2),
      R => '0'
    );
\corr_angle_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(3),
      Q => corr_angle(3),
      R => '0'
    );
\corr_angle_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \corr_angle_reg[3]_i_1_n_0\,
      CO(2) => \corr_angle_reg[3]_i_1_n_1\,
      CO(1) => \corr_angle_reg[3]_i_1_n_2\,
      CO(0) => \corr_angle_reg[3]_i_1_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => cnt(3 downto 0),
      O(3 downto 0) => corr_angle0(3 downto 0),
      S(3) => \corr_angle[3]_i_2_n_0\,
      S(2) => \corr_angle[3]_i_3_n_0\,
      S(1) => \corr_angle[3]_i_4_n_0\,
      S(0) => \corr_angle[3]_i_5_n_0\
    );
\corr_angle_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(4),
      Q => corr_angle(4),
      R => '0'
    );
\corr_angle_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(5),
      Q => corr_angle(5),
      R => '0'
    );
\corr_angle_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(6),
      Q => corr_angle(6),
      R => '0'
    );
\corr_angle_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(7),
      Q => corr_angle(7),
      R => '0'
    );
\corr_angle_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \corr_angle_reg[3]_i_1_n_0\,
      CO(3) => \corr_angle_reg[7]_i_1_n_0\,
      CO(2) => \corr_angle_reg[7]_i_1_n_1\,
      CO(1) => \corr_angle_reg[7]_i_1_n_2\,
      CO(0) => \corr_angle_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => cnt(7 downto 4),
      O(3 downto 0) => corr_angle0(7 downto 4),
      S(3) => \corr_angle[7]_i_2_n_0\,
      S(2) => \corr_angle[7]_i_3_n_0\,
      S(1) => \corr_angle[7]_i_4_n_0\,
      S(0) => \corr_angle[7]_i_5_n_0\
    );
\corr_angle_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(8),
      Q => corr_angle(8),
      R => '0'
    );
\corr_angle_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => update,
      D => corr_angle0(9),
      Q => corr_angle(9),
      R => '0'
    );
\div_cnt[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(3),
      O => \div_cnt[0]_i_2_n_0\
    );
\div_cnt[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(2),
      O => \div_cnt[0]_i_3_n_0\
    );
\div_cnt[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(1),
      O => \div_cnt[0]_i_4_n_0\
    );
\div_cnt[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => div_cnt_reg(0),
      O => \div_cnt[0]_i_5_n_0\
    );
\div_cnt[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(15),
      O => \div_cnt[12]_i_2_n_0\
    );
\div_cnt[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(14),
      O => \div_cnt[12]_i_3_n_0\
    );
\div_cnt[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(13),
      O => \div_cnt[12]_i_4_n_0\
    );
\div_cnt[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(12),
      O => \div_cnt[12]_i_5_n_0\
    );
\div_cnt[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(7),
      O => \div_cnt[4]_i_2_n_0\
    );
\div_cnt[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(6),
      O => \div_cnt[4]_i_3_n_0\
    );
\div_cnt[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(5),
      O => \div_cnt[4]_i_4_n_0\
    );
\div_cnt[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(4),
      O => \div_cnt[4]_i_5_n_0\
    );
\div_cnt[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(11),
      O => \div_cnt[8]_i_2_n_0\
    );
\div_cnt[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(10),
      O => \div_cnt[8]_i_3_n_0\
    );
\div_cnt[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(9),
      O => \div_cnt[8]_i_4_n_0\
    );
\div_cnt[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => period_dir,
      I1 => div_cnt_reg(8),
      O => \div_cnt[8]_i_5_n_0\
    );
\div_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[0]_i_1_n_7\,
      Q => div_cnt_reg(0),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \div_cnt_reg[0]_i_1_n_0\,
      CO(2) => \div_cnt_reg[0]_i_1_n_1\,
      CO(1) => \div_cnt_reg[0]_i_1_n_2\,
      CO(0) => \div_cnt_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => div_cnt_reg(3 downto 1),
      DI(0) => '1',
      O(3) => \div_cnt_reg[0]_i_1_n_4\,
      O(2) => \div_cnt_reg[0]_i_1_n_5\,
      O(1) => \div_cnt_reg[0]_i_1_n_6\,
      O(0) => \div_cnt_reg[0]_i_1_n_7\,
      S(3) => \div_cnt[0]_i_2_n_0\,
      S(2) => \div_cnt[0]_i_3_n_0\,
      S(1) => \div_cnt[0]_i_4_n_0\,
      S(0) => \div_cnt[0]_i_5_n_0\
    );
\div_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[8]_i_1_n_5\,
      Q => div_cnt_reg(10),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[8]_i_1_n_4\,
      Q => div_cnt_reg(11),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[12]_i_1_n_7\,
      Q => div_cnt_reg(12),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \div_cnt_reg[8]_i_1_n_0\,
      CO(3) => \NLW_div_cnt_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \div_cnt_reg[12]_i_1_n_1\,
      CO(1) => \div_cnt_reg[12]_i_1_n_2\,
      CO(0) => \div_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => div_cnt_reg(14 downto 12),
      O(3) => \div_cnt_reg[12]_i_1_n_4\,
      O(2) => \div_cnt_reg[12]_i_1_n_5\,
      O(1) => \div_cnt_reg[12]_i_1_n_6\,
      O(0) => \div_cnt_reg[12]_i_1_n_7\,
      S(3) => \div_cnt[12]_i_2_n_0\,
      S(2) => \div_cnt[12]_i_3_n_0\,
      S(1) => \div_cnt[12]_i_4_n_0\,
      S(0) => \div_cnt[12]_i_5_n_0\
    );
\div_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[12]_i_1_n_6\,
      Q => div_cnt_reg(13),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[12]_i_1_n_5\,
      Q => div_cnt_reg(14),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[12]_i_1_n_4\,
      Q => div_cnt_reg(15),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[0]_i_1_n_6\,
      Q => div_cnt_reg(1),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[0]_i_1_n_5\,
      Q => div_cnt_reg(2),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[0]_i_1_n_4\,
      Q => div_cnt_reg(3),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[4]_i_1_n_7\,
      Q => div_cnt_reg(4),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \div_cnt_reg[0]_i_1_n_0\,
      CO(3) => \div_cnt_reg[4]_i_1_n_0\,
      CO(2) => \div_cnt_reg[4]_i_1_n_1\,
      CO(1) => \div_cnt_reg[4]_i_1_n_2\,
      CO(0) => \div_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => div_cnt_reg(7 downto 4),
      O(3) => \div_cnt_reg[4]_i_1_n_4\,
      O(2) => \div_cnt_reg[4]_i_1_n_5\,
      O(1) => \div_cnt_reg[4]_i_1_n_6\,
      O(0) => \div_cnt_reg[4]_i_1_n_7\,
      S(3) => \div_cnt[4]_i_2_n_0\,
      S(2) => \div_cnt[4]_i_3_n_0\,
      S(1) => \div_cnt[4]_i_4_n_0\,
      S(0) => \div_cnt[4]_i_5_n_0\
    );
\div_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[4]_i_1_n_6\,
      Q => div_cnt_reg(5),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[4]_i_1_n_5\,
      Q => div_cnt_reg(6),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[4]_i_1_n_4\,
      Q => div_cnt_reg(7),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[8]_i_1_n_7\,
      Q => div_cnt_reg(8),
      R => \divider[31]_i_1_n_0\
    );
\div_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \div_cnt_reg[4]_i_1_n_0\,
      CO(3) => \div_cnt_reg[8]_i_1_n_0\,
      CO(2) => \div_cnt_reg[8]_i_1_n_1\,
      CO(1) => \div_cnt_reg[8]_i_1_n_2\,
      CO(0) => \div_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => div_cnt_reg(11 downto 8),
      O(3) => \div_cnt_reg[8]_i_1_n_4\,
      O(2) => \div_cnt_reg[8]_i_1_n_5\,
      O(1) => \div_cnt_reg[8]_i_1_n_6\,
      O(0) => \div_cnt_reg[8]_i_1_n_7\,
      S(3) => \div_cnt[8]_i_2_n_0\,
      S(2) => \div_cnt[8]_i_3_n_0\,
      S(1) => \div_cnt[8]_i_4_n_0\,
      S(0) => \div_cnt[8]_i_5_n_0\
    );
\div_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => \div_cnt_reg[8]_i_1_n_6\,
      Q => div_cnt_reg(9),
      R => \divider[31]_i_1_n_0\
    );
\div_value0_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \div_value0_inferred__0/i__carry_n_0\,
      CO(2) => \div_value0_inferred__0/i__carry_n_1\,
      CO(1) => \div_value0_inferred__0/i__carry_n_2\,
      CO(0) => \div_value0_inferred__0/i__carry_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => div_value(3 downto 0),
      O(3 downto 0) => div_value0(3 downto 0),
      S(3) => \i__carry_i_1_n_0\,
      S(2) => \i__carry_i_2_n_0\,
      S(1) => \i__carry_i_3_n_0\,
      S(0) => \i__carry_i_4_n_0\
    );
\div_value0_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \div_value0_inferred__0/i__carry_n_0\,
      CO(3) => \div_value0_inferred__0/i__carry__0_n_0\,
      CO(2) => \div_value0_inferred__0/i__carry__0_n_1\,
      CO(1) => \div_value0_inferred__0/i__carry__0_n_2\,
      CO(0) => \div_value0_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => div_value(7 downto 4),
      O(3 downto 0) => div_value0(7 downto 4),
      S(3) => \i__carry__0_i_1_n_0\,
      S(2) => \i__carry__0_i_2_n_0\,
      S(1) => \i__carry__0_i_3_n_0\,
      S(0) => \i__carry__0_i_4_n_0\
    );
\div_value0_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \div_value0_inferred__0/i__carry__0_n_0\,
      CO(3) => \div_value0_inferred__0/i__carry__1_n_0\,
      CO(2) => \div_value0_inferred__0/i__carry__1_n_1\,
      CO(1) => \div_value0_inferred__0/i__carry__1_n_2\,
      CO(0) => \div_value0_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => div_value(11 downto 8),
      O(3 downto 0) => div_value0(11 downto 8),
      S(3) => \i__carry__1_i_1_n_0\,
      S(2) => \i__carry__1_i_2_n_0\,
      S(1) => \i__carry__1_i_3_n_0\,
      S(0) => \i__carry__1_i_4_n_0\
    );
\div_value0_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \div_value0_inferred__0/i__carry__1_n_0\,
      CO(3) => \div_value0_inferred__0/i__carry__2_n_0\,
      CO(2) => \div_value0_inferred__0/i__carry__2_n_1\,
      CO(1) => \div_value0_inferred__0/i__carry__2_n_2\,
      CO(0) => \div_value0_inferred__0/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => div_value(15 downto 12),
      O(3 downto 0) => div_value0(15 downto 12),
      S(3) => \i__carry__2_i_1_n_0\,
      S(2) => \i__carry__2_i_2_n_0\,
      S(1) => \i__carry__2_i_3_n_0\,
      S(0) => \i__carry__2_i_4_n_0\
    );
\div_value0_inferred__0/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \div_value0_inferred__0/i__carry__2_n_0\,
      CO(3) => \div_value0_inferred__0/i__carry__3_n_0\,
      CO(2) => \div_value0_inferred__0/i__carry__3_n_1\,
      CO(1) => \div_value0_inferred__0/i__carry__3_n_2\,
      CO(0) => \div_value0_inferred__0/i__carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => div_value(19 downto 16),
      O(3 downto 0) => div_value0(19 downto 16),
      S(3) => \i__carry__3_i_1_n_0\,
      S(2) => \i__carry__3_i_2_n_0\,
      S(1) => \i__carry__3_i_3_n_0\,
      S(0) => \i__carry__3_i_4_n_0\
    );
\div_value0_inferred__0/i__carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \div_value0_inferred__0/i__carry__3_n_0\,
      CO(3) => \div_value0_inferred__0/i__carry__4_n_0\,
      CO(2) => \div_value0_inferred__0/i__carry__4_n_1\,
      CO(1) => \div_value0_inferred__0/i__carry__4_n_2\,
      CO(0) => \div_value0_inferred__0/i__carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => div_value(23 downto 20),
      O(3 downto 0) => div_value0(23 downto 20),
      S(3) => \i__carry__4_i_1_n_0\,
      S(2) => \i__carry__4_i_2_n_0\,
      S(1) => \i__carry__4_i_3_n_0\,
      S(0) => \i__carry__4_i_4_n_0\
    );
\div_value0_inferred__0/i__carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \div_value0_inferred__0/i__carry__4_n_0\,
      CO(3) => \div_value0_inferred__0/i__carry__5_n_0\,
      CO(2) => \div_value0_inferred__0/i__carry__5_n_1\,
      CO(1) => \div_value0_inferred__0/i__carry__5_n_2\,
      CO(0) => \div_value0_inferred__0/i__carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => div_value(27 downto 24),
      O(3 downto 0) => div_value0(27 downto 24),
      S(3) => \i__carry__5_i_1_n_0\,
      S(2) => \i__carry__5_i_2_n_0\,
      S(1) => \i__carry__5_i_3_n_0\,
      S(0) => \i__carry__5_i_4_n_0\
    );
\div_value0_inferred__0/i__carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \div_value0_inferred__0/i__carry__5_n_0\,
      CO(3) => \NLW_div_value0_inferred__0/i__carry__6_CO_UNCONNECTED\(3),
      CO(2) => \div_value0_inferred__0/i__carry__6_n_1\,
      CO(1) => \div_value0_inferred__0/i__carry__6_n_2\,
      CO(0) => \div_value0_inferred__0/i__carry__6_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 0) => div_value(30 downto 28),
      O(3 downto 0) => div_value0(31 downto 28),
      S(3) => \i__carry__6_i_1_n_0\,
      S(2) => \i__carry__6_i_2_n_0\,
      S(1) => \i__carry__6_i_3_n_0\,
      S(0) => \i__carry__6_i_4_n_0\
    );
div_value1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => div_value1_carry_n_0,
      CO(2) => div_value1_carry_n_1,
      CO(1) => div_value1_carry_n_2,
      CO(0) => div_value1_carry_n_3,
      CYINIT => '0',
      DI(3) => div_value1_carry_i_1_n_0,
      DI(2) => div_value1_carry_i_2_n_0,
      DI(1) => div_value1_carry_i_3_n_0,
      DI(0) => div_value1_carry_i_4_n_0,
      O(3 downto 0) => NLW_div_value1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => div_value1_carry_i_5_n_0,
      S(2) => div_value1_carry_i_6_n_0,
      S(1) => div_value1_carry_i_7_n_0,
      S(0) => div_value1_carry_i_8_n_0
    );
\div_value1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => div_value1_carry_n_0,
      CO(3) => \div_value1_carry__0_n_0\,
      CO(2) => \div_value1_carry__0_n_1\,
      CO(1) => \div_value1_carry__0_n_2\,
      CO(0) => \div_value1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \div_value1_carry__0_i_1_n_0\,
      DI(2) => \div_value1_carry__0_i_2_n_0\,
      DI(1) => \div_value1_carry__0_i_3_n_0\,
      DI(0) => \div_value1_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_div_value1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \div_value1_carry__0_i_5_n_0\,
      S(2) => \div_value1_carry__0_i_6_n_0\,
      S(1) => \div_value1_carry__0_i_7_n_0\,
      S(0) => \div_value1_carry__0_i_8_n_0\
    );
\div_value1_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(14),
      I1 => div_value(14),
      I2 => div_value(15),
      I3 => divider(15),
      O => \div_value1_carry__0_i_1_n_0\
    );
\div_value1_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(12),
      I1 => div_value(12),
      I2 => div_value(13),
      I3 => divider(13),
      O => \div_value1_carry__0_i_2_n_0\
    );
\div_value1_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(10),
      I1 => div_value(10),
      I2 => div_value(11),
      I3 => divider(11),
      O => \div_value1_carry__0_i_3_n_0\
    );
\div_value1_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(8),
      I1 => div_value(8),
      I2 => div_value(9),
      I3 => divider(9),
      O => \div_value1_carry__0_i_4_n_0\
    );
\div_value1_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(14),
      I1 => div_value(14),
      I2 => divider(15),
      I3 => div_value(15),
      O => \div_value1_carry__0_i_5_n_0\
    );
\div_value1_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(12),
      I1 => div_value(12),
      I2 => divider(13),
      I3 => div_value(13),
      O => \div_value1_carry__0_i_6_n_0\
    );
\div_value1_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(10),
      I1 => div_value(10),
      I2 => divider(11),
      I3 => div_value(11),
      O => \div_value1_carry__0_i_7_n_0\
    );
\div_value1_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(8),
      I1 => div_value(8),
      I2 => divider(9),
      I3 => div_value(9),
      O => \div_value1_carry__0_i_8_n_0\
    );
\div_value1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \div_value1_carry__0_n_0\,
      CO(3) => \div_value1_carry__1_n_0\,
      CO(2) => \div_value1_carry__1_n_1\,
      CO(1) => \div_value1_carry__1_n_2\,
      CO(0) => \div_value1_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \div_value1_carry__1_i_1_n_0\,
      DI(2) => \div_value1_carry__1_i_2_n_0\,
      DI(1) => \div_value1_carry__1_i_3_n_0\,
      DI(0) => \div_value1_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_div_value1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \div_value1_carry__1_i_5_n_0\,
      S(2) => \div_value1_carry__1_i_6_n_0\,
      S(1) => \div_value1_carry__1_i_7_n_0\,
      S(0) => \div_value1_carry__1_i_8_n_0\
    );
\div_value1_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(22),
      I1 => div_value(22),
      I2 => div_value(23),
      I3 => divider(23),
      O => \div_value1_carry__1_i_1_n_0\
    );
\div_value1_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(20),
      I1 => div_value(20),
      I2 => div_value(21),
      I3 => divider(21),
      O => \div_value1_carry__1_i_2_n_0\
    );
\div_value1_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(18),
      I1 => div_value(18),
      I2 => div_value(19),
      I3 => divider(19),
      O => \div_value1_carry__1_i_3_n_0\
    );
\div_value1_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(16),
      I1 => div_value(16),
      I2 => div_value(17),
      I3 => divider(17),
      O => \div_value1_carry__1_i_4_n_0\
    );
\div_value1_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(22),
      I1 => div_value(22),
      I2 => divider(23),
      I3 => div_value(23),
      O => \div_value1_carry__1_i_5_n_0\
    );
\div_value1_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(20),
      I1 => div_value(20),
      I2 => divider(21),
      I3 => div_value(21),
      O => \div_value1_carry__1_i_6_n_0\
    );
\div_value1_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(18),
      I1 => div_value(18),
      I2 => divider(19),
      I3 => div_value(19),
      O => \div_value1_carry__1_i_7_n_0\
    );
\div_value1_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(16),
      I1 => div_value(16),
      I2 => divider(17),
      I3 => div_value(17),
      O => \div_value1_carry__1_i_8_n_0\
    );
\div_value1_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \div_value1_carry__1_n_0\,
      CO(3) => \div_value1_carry__2_n_0\,
      CO(2) => \div_value1_carry__2_n_1\,
      CO(1) => \div_value1_carry__2_n_2\,
      CO(0) => \div_value1_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \div_value1_carry__2_i_1_n_0\,
      DI(2) => \div_value1_carry__2_i_2_n_0\,
      DI(1) => \div_value1_carry__2_i_3_n_0\,
      DI(0) => \div_value1_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_div_value1_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \div_value1_carry__2_i_5_n_0\,
      S(2) => \div_value1_carry__2_i_6_n_0\,
      S(1) => \div_value1_carry__2_i_7_n_0\,
      S(0) => \div_value1_carry__2_i_8_n_0\
    );
\div_value1_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(30),
      I1 => div_value(30),
      I2 => div_value(31),
      I3 => divider(31),
      O => \div_value1_carry__2_i_1_n_0\
    );
\div_value1_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(28),
      I1 => div_value(28),
      I2 => div_value(29),
      I3 => divider(29),
      O => \div_value1_carry__2_i_2_n_0\
    );
\div_value1_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(26),
      I1 => div_value(26),
      I2 => div_value(27),
      I3 => divider(27),
      O => \div_value1_carry__2_i_3_n_0\
    );
\div_value1_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(24),
      I1 => div_value(24),
      I2 => div_value(25),
      I3 => divider(25),
      O => \div_value1_carry__2_i_4_n_0\
    );
\div_value1_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(30),
      I1 => div_value(30),
      I2 => divider(31),
      I3 => div_value(31),
      O => \div_value1_carry__2_i_5_n_0\
    );
\div_value1_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(28),
      I1 => div_value(28),
      I2 => divider(29),
      I3 => div_value(29),
      O => \div_value1_carry__2_i_6_n_0\
    );
\div_value1_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(26),
      I1 => div_value(26),
      I2 => divider(27),
      I3 => div_value(27),
      O => \div_value1_carry__2_i_7_n_0\
    );
\div_value1_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(24),
      I1 => div_value(24),
      I2 => divider(25),
      I3 => div_value(25),
      O => \div_value1_carry__2_i_8_n_0\
    );
div_value1_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(6),
      I1 => div_value(6),
      I2 => div_value(7),
      I3 => divider(7),
      O => div_value1_carry_i_1_n_0
    );
div_value1_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(4),
      I1 => div_value(4),
      I2 => div_value(5),
      I3 => divider(5),
      O => div_value1_carry_i_2_n_0
    );
div_value1_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(2),
      I1 => div_value(2),
      I2 => div_value(3),
      I3 => divider(3),
      O => div_value1_carry_i_3_n_0
    );
div_value1_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => divider(0),
      I1 => div_value(0),
      I2 => div_value(1),
      I3 => divider(1),
      O => div_value1_carry_i_4_n_0
    );
div_value1_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(6),
      I1 => div_value(6),
      I2 => divider(7),
      I3 => div_value(7),
      O => div_value1_carry_i_5_n_0
    );
div_value1_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(4),
      I1 => div_value(4),
      I2 => divider(5),
      I3 => div_value(5),
      O => div_value1_carry_i_6_n_0
    );
div_value1_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(2),
      I1 => div_value(2),
      I2 => divider(3),
      I3 => div_value(3),
      O => div_value1_carry_i_7_n_0
    );
div_value1_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => divider(0),
      I1 => div_value(0),
      I2 => divider(1),
      I3 => div_value(1),
      O => div_value1_carry_i_8_n_0
    );
\div_value[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sm_state,
      I1 => \div_value1_carry__2_n_0\,
      O => \div_value[31]_i_1_n_0\
    );
\div_value_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(0),
      Q => div_value(0),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(10),
      Q => div_value(10),
      S => \divider[31]_i_1_n_0\
    );
\div_value_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(11),
      Q => div_value(11),
      S => \divider[31]_i_1_n_0\
    );
\div_value_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(12),
      Q => div_value(12),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(13),
      Q => div_value(13),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(14),
      Q => div_value(14),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[15]\: unisim.vcomponents.FDSE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(15),
      Q => div_value(15),
      S => \divider[31]_i_1_n_0\
    );
\div_value_reg[16]\: unisim.vcomponents.FDSE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(16),
      Q => div_value(16),
      S => \divider[31]_i_1_n_0\
    );
\div_value_reg[17]\: unisim.vcomponents.FDSE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(17),
      Q => div_value(17),
      S => \divider[31]_i_1_n_0\
    );
\div_value_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(18),
      Q => div_value(18),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[19]\: unisim.vcomponents.FDSE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(19),
      Q => div_value(19),
      S => \divider[31]_i_1_n_0\
    );
\div_value_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(1),
      Q => div_value(1),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[20]\: unisim.vcomponents.FDSE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(20),
      Q => div_value(20),
      S => \divider[31]_i_1_n_0\
    );
\div_value_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(21),
      Q => div_value(21),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[22]\: unisim.vcomponents.FDSE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(22),
      Q => div_value(22),
      S => \divider[31]_i_1_n_0\
    );
\div_value_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(23),
      Q => div_value(23),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(24),
      Q => div_value(24),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(25),
      Q => div_value(25),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(26),
      Q => div_value(26),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(27),
      Q => div_value(27),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(28),
      Q => div_value(28),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(29),
      Q => div_value(29),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(2),
      Q => div_value(2),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(30),
      Q => div_value(30),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(31),
      Q => div_value(31),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(3),
      Q => div_value(3),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(4),
      Q => div_value(4),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(5),
      Q => div_value(5),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(6),
      Q => div_value(6),
      R => \divider[31]_i_1_n_0\
    );
\div_value_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(7),
      Q => div_value(7),
      S => \divider[31]_i_1_n_0\
    );
\div_value_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(8),
      Q => div_value(8),
      S => \divider[31]_i_1_n_0\
    );
\div_value_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \div_value[31]_i_1_n_0\,
      D => div_value0(9),
      Q => div_value(9),
      R => \divider[31]_i_1_n_0\
    );
\divider[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFDF"
    )
        port map (
      I0 => \rpm_data_i[15]_i_3_n_0\,
      I1 => \rpm_data_i[15]_i_4_n_0\,
      I2 => \rpm_data_i[15]_i_5_n_0\,
      I3 => \rpm_data_i[15]_i_6_n_0\,
      I4 => sm_state,
      O => \divider[31]_i_1_n_0\
    );
\divider_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(0),
      Q => divider(0),
      R => '0'
    );
\divider_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(10),
      Q => divider(10),
      R => '0'
    );
\divider_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(11),
      Q => divider(11),
      R => '0'
    );
\divider_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(12),
      Q => divider(12),
      R => '0'
    );
\divider_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(13),
      Q => divider(13),
      R => '0'
    );
\divider_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(14),
      Q => divider(14),
      R => '0'
    );
\divider_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(15),
      Q => divider(15),
      R => '0'
    );
\divider_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(16),
      Q => divider(16),
      R => '0'
    );
\divider_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(17),
      Q => divider(17),
      R => '0'
    );
\divider_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(18),
      Q => divider(18),
      R => '0'
    );
\divider_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(19),
      Q => divider(19),
      R => '0'
    );
\divider_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(1),
      Q => divider(1),
      R => '0'
    );
\divider_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(20),
      Q => divider(20),
      R => '0'
    );
\divider_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(21),
      Q => divider(21),
      R => '0'
    );
\divider_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(22),
      Q => divider(22),
      R => '0'
    );
\divider_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(23),
      Q => divider(23),
      R => '0'
    );
\divider_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(24),
      Q => divider(24),
      R => '0'
    );
\divider_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(25),
      Q => divider(25),
      R => '0'
    );
\divider_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(26),
      Q => divider(26),
      R => '0'
    );
\divider_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(27),
      Q => divider(27),
      R => '0'
    );
\divider_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(28),
      Q => divider(28),
      R => '0'
    );
\divider_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(29),
      Q => divider(29),
      R => '0'
    );
\divider_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(2),
      Q => divider(2),
      R => '0'
    );
\divider_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(30),
      Q => divider(30),
      R => '0'
    );
\divider_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => period_value(31),
      Q => divider(31),
      R => '0'
    );
\divider_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(3),
      Q => divider(3),
      R => '0'
    );
\divider_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(4),
      Q => divider(4),
      R => '0'
    );
\divider_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(5),
      Q => divider(5),
      R => '0'
    );
\divider_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(6),
      Q => divider(6),
      R => '0'
    );
\divider_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(7),
      Q => divider(7),
      R => '0'
    );
\divider_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(8),
      Q => divider(8),
      R => '0'
    );
\divider_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \divider[31]_i_1_n_0\,
      D => \^period_data\(9),
      Q => divider(9),
      R => '0'
    );
\dp_valid_reg[2]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => axis_aclk,
      D => update,
      Q => \dp_valid_reg[2]_srl3_n_0\
    );
\dp_valid_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \dp_valid_reg[2]_srl3_n_0\,
      Q => p_0_in,
      R => '0'
    );
\filter_a_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \filter_a_cnt_reg__0\(0),
      O => \filter_a_cnt[0]_i_1_n_0\
    );
\filter_a_cnt[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \filter_a_cnt_reg__0\(0),
      I1 => a_i,
      I2 => \filter_a_cnt_reg__0\(1),
      O => \filter_a_cnt[1]_i_1_n_0\
    );
\filter_a_cnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"78E1"
    )
        port map (
      I0 => \filter_a_cnt_reg__0\(0),
      I1 => a_i,
      I2 => \filter_a_cnt_reg__0\(2),
      I3 => \filter_a_cnt_reg__0\(1),
      O => \filter_a_cnt[2]_i_1_n_0\
    );
\filter_a_cnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F80FE01"
    )
        port map (
      I0 => a_i,
      I1 => \filter_a_cnt_reg__0\(0),
      I2 => \filter_a_cnt_reg__0\(1),
      I3 => \filter_a_cnt_reg__0\(3),
      I4 => \filter_a_cnt_reg__0\(2),
      O => \filter_a_cnt[3]_i_1_n_0\
    );
\filter_a_cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFE"
    )
        port map (
      I0 => a_i,
      I1 => \filter_a_cnt_reg__0\(3),
      I2 => \filter_a_cnt_reg__0\(1),
      I3 => \filter_a_cnt_reg__0\(0),
      I4 => \filter_a_cnt_reg__0\(4),
      I5 => \filter_a_cnt_reg__0\(2),
      O => \filter_a_cnt[4]_i_1_n_0\
    );
\filter_a_cnt[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF8000FFFE0001"
    )
        port map (
      I0 => \filter_a_cnt_reg__0\(1),
      I1 => \filter_a_cnt_reg__0\(0),
      I2 => a_i,
      I3 => \filter_a_cnt_reg__0\(2),
      I4 => \filter_a_cnt_reg__0\(4),
      I5 => \filter_a_cnt_reg__0\(3),
      O => \filter_a_cnt[4]_i_2_n_0\
    );
\filter_a_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_a_cnt[4]_i_1_n_0\,
      D => \filter_a_cnt[0]_i_1_n_0\,
      Q => \filter_a_cnt_reg__0\(0),
      R => '0'
    );
\filter_a_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_a_cnt[4]_i_1_n_0\,
      D => \filter_a_cnt[1]_i_1_n_0\,
      Q => \filter_a_cnt_reg__0\(1),
      R => '0'
    );
\filter_a_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_a_cnt[4]_i_1_n_0\,
      D => \filter_a_cnt[2]_i_1_n_0\,
      Q => \filter_a_cnt_reg__0\(2),
      R => '0'
    );
\filter_a_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_a_cnt[4]_i_1_n_0\,
      D => \filter_a_cnt[3]_i_1_n_0\,
      Q => \filter_a_cnt_reg__0\(3),
      R => '0'
    );
\filter_a_cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_a_cnt[4]_i_1_n_0\,
      D => \filter_a_cnt[4]_i_2_n_0\,
      Q => \filter_a_cnt_reg__0\(4),
      R => '0'
    );
\filter_b_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \filter_b_cnt_reg__0\(0),
      O => \filter_b_cnt[0]_i_1_n_0\
    );
\filter_b_cnt[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \filter_b_cnt_reg__0\(0),
      I1 => b_i,
      I2 => \filter_b_cnt_reg__0\(1),
      O => \filter_b_cnt[1]_i_1_n_0\
    );
\filter_b_cnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"78E1"
    )
        port map (
      I0 => \filter_b_cnt_reg__0\(0),
      I1 => b_i,
      I2 => \filter_b_cnt_reg__0\(2),
      I3 => \filter_b_cnt_reg__0\(1),
      O => \filter_b_cnt[2]_i_1_n_0\
    );
\filter_b_cnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F80FE01"
    )
        port map (
      I0 => b_i,
      I1 => \filter_b_cnt_reg__0\(0),
      I2 => \filter_b_cnt_reg__0\(1),
      I3 => \filter_b_cnt_reg__0\(3),
      I4 => \filter_b_cnt_reg__0\(2),
      O => \filter_b_cnt[3]_i_1_n_0\
    );
\filter_b_cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFE"
    )
        port map (
      I0 => b_i,
      I1 => \filter_b_cnt_reg__0\(3),
      I2 => \filter_b_cnt_reg__0\(1),
      I3 => \filter_b_cnt_reg__0\(0),
      I4 => \filter_b_cnt_reg__0\(4),
      I5 => \filter_b_cnt_reg__0\(2),
      O => \filter_b_cnt[4]_i_1_n_0\
    );
\filter_b_cnt[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF8000FFFE0001"
    )
        port map (
      I0 => \filter_b_cnt_reg__0\(1),
      I1 => \filter_b_cnt_reg__0\(0),
      I2 => b_i,
      I3 => \filter_b_cnt_reg__0\(2),
      I4 => \filter_b_cnt_reg__0\(4),
      I5 => \filter_b_cnt_reg__0\(3),
      O => \filter_b_cnt[4]_i_2_n_0\
    );
\filter_b_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_b_cnt[4]_i_1_n_0\,
      D => \filter_b_cnt[0]_i_1_n_0\,
      Q => \filter_b_cnt_reg__0\(0),
      R => '0'
    );
\filter_b_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_b_cnt[4]_i_1_n_0\,
      D => \filter_b_cnt[1]_i_1_n_0\,
      Q => \filter_b_cnt_reg__0\(1),
      R => '0'
    );
\filter_b_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_b_cnt[4]_i_1_n_0\,
      D => \filter_b_cnt[2]_i_1_n_0\,
      Q => \filter_b_cnt_reg__0\(2),
      R => '0'
    );
\filter_b_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_b_cnt[4]_i_1_n_0\,
      D => \filter_b_cnt[3]_i_1_n_0\,
      Q => \filter_b_cnt_reg__0\(3),
      R => '0'
    );
\filter_b_cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_b_cnt[4]_i_1_n_0\,
      D => \filter_b_cnt[4]_i_2_n_0\,
      Q => \filter_b_cnt_reg__0\(4),
      R => '0'
    );
\filter_i_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \filter_i_cnt_reg__0\(0),
      O => \filter_i_cnt[0]_i_1_n_0\
    );
\filter_i_cnt[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \filter_i_cnt_reg__0\(0),
      I1 => i_i,
      I2 => \filter_i_cnt_reg__0\(1),
      O => \filter_i_cnt[1]_i_1_n_0\
    );
\filter_i_cnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"78E1"
    )
        port map (
      I0 => \filter_i_cnt_reg__0\(0),
      I1 => i_i,
      I2 => \filter_i_cnt_reg__0\(2),
      I3 => \filter_i_cnt_reg__0\(1),
      O => \filter_i_cnt[2]_i_1_n_0\
    );
\filter_i_cnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F80FE01"
    )
        port map (
      I0 => i_i,
      I1 => \filter_i_cnt_reg__0\(0),
      I2 => \filter_i_cnt_reg__0\(1),
      I3 => \filter_i_cnt_reg__0\(3),
      I4 => \filter_i_cnt_reg__0\(2),
      O => \filter_i_cnt[3]_i_1_n_0\
    );
\filter_i_cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFE"
    )
        port map (
      I0 => i_i,
      I1 => \filter_i_cnt_reg__0\(3),
      I2 => \filter_i_cnt_reg__0\(1),
      I3 => \filter_i_cnt_reg__0\(0),
      I4 => \filter_i_cnt_reg__0\(4),
      I5 => \filter_i_cnt_reg__0\(2),
      O => \filter_i_cnt[4]_i_1_n_0\
    );
\filter_i_cnt[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF8000FFFE0001"
    )
        port map (
      I0 => \filter_i_cnt_reg__0\(1),
      I1 => \filter_i_cnt_reg__0\(0),
      I2 => i_i,
      I3 => \filter_i_cnt_reg__0\(2),
      I4 => \filter_i_cnt_reg__0\(4),
      I5 => \filter_i_cnt_reg__0\(3),
      O => \filter_i_cnt[4]_i_2_n_0\
    );
\filter_i_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_i_cnt[4]_i_1_n_0\,
      D => \filter_i_cnt[0]_i_1_n_0\,
      Q => \filter_i_cnt_reg__0\(0),
      R => '0'
    );
\filter_i_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_i_cnt[4]_i_1_n_0\,
      D => \filter_i_cnt[1]_i_1_n_0\,
      Q => \filter_i_cnt_reg__0\(1),
      R => '0'
    );
\filter_i_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_i_cnt[4]_i_1_n_0\,
      D => \filter_i_cnt[2]_i_1_n_0\,
      Q => \filter_i_cnt_reg__0\(2),
      R => '0'
    );
\filter_i_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_i_cnt[4]_i_1_n_0\,
      D => \filter_i_cnt[3]_i_1_n_0\,
      Q => \filter_i_cnt_reg__0\(3),
      R => '0'
    );
\filter_i_cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => \filter_i_cnt[4]_i_1_n_0\,
      D => \filter_i_cnt[4]_i_2_n_0\,
      Q => \filter_i_cnt_reg__0\(4),
      R => '0'
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(7),
      I1 => divider(7),
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(6),
      I1 => divider(6),
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(5),
      I1 => divider(5),
      O => \i__carry__0_i_3_n_0\
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(4),
      I1 => divider(4),
      O => \i__carry__0_i_4_n_0\
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(11),
      I1 => divider(11),
      O => \i__carry__1_i_1_n_0\
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(10),
      I1 => divider(10),
      O => \i__carry__1_i_2_n_0\
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(9),
      I1 => divider(9),
      O => \i__carry__1_i_3_n_0\
    );
\i__carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(8),
      I1 => divider(8),
      O => \i__carry__1_i_4_n_0\
    );
\i__carry__2_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(15),
      I1 => divider(15),
      O => \i__carry__2_i_1_n_0\
    );
\i__carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(14),
      I1 => divider(14),
      O => \i__carry__2_i_2_n_0\
    );
\i__carry__2_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(13),
      I1 => divider(13),
      O => \i__carry__2_i_3_n_0\
    );
\i__carry__2_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(12),
      I1 => divider(12),
      O => \i__carry__2_i_4_n_0\
    );
\i__carry__3_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(19),
      I1 => divider(19),
      O => \i__carry__3_i_1_n_0\
    );
\i__carry__3_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(18),
      I1 => divider(18),
      O => \i__carry__3_i_2_n_0\
    );
\i__carry__3_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(17),
      I1 => divider(17),
      O => \i__carry__3_i_3_n_0\
    );
\i__carry__3_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(16),
      I1 => divider(16),
      O => \i__carry__3_i_4_n_0\
    );
\i__carry__4_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(23),
      I1 => divider(23),
      O => \i__carry__4_i_1_n_0\
    );
\i__carry__4_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(22),
      I1 => divider(22),
      O => \i__carry__4_i_2_n_0\
    );
\i__carry__4_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(21),
      I1 => divider(21),
      O => \i__carry__4_i_3_n_0\
    );
\i__carry__4_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(20),
      I1 => divider(20),
      O => \i__carry__4_i_4_n_0\
    );
\i__carry__5_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(27),
      I1 => divider(27),
      O => \i__carry__5_i_1_n_0\
    );
\i__carry__5_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(26),
      I1 => divider(26),
      O => \i__carry__5_i_2_n_0\
    );
\i__carry__5_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(25),
      I1 => divider(25),
      O => \i__carry__5_i_3_n_0\
    );
\i__carry__5_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(24),
      I1 => divider(24),
      O => \i__carry__5_i_4_n_0\
    );
\i__carry__6_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(31),
      I1 => divider(31),
      O => \i__carry__6_i_1_n_0\
    );
\i__carry__6_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(30),
      I1 => divider(30),
      O => \i__carry__6_i_2_n_0\
    );
\i__carry__6_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(29),
      I1 => divider(29),
      O => \i__carry__6_i_3_n_0\
    );
\i__carry__6_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(28),
      I1 => divider(28),
      O => \i__carry__6_i_4_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(3),
      I1 => divider(3),
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(2),
      I1 => divider(2),
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(1),
      I1 => divider(1),
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => div_value(0),
      I1 => divider(0),
      O => \i__carry_i_4_n_0\
    );
i_f_reg: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \filter_i_cnt_reg__0\(4),
      Q => i_f,
      R => '0'
    );
i_i_reg: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => I,
      Q => i_i,
      R => '0'
    );
\m_angle_tdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(0),
      Q => m_angle_tdata(0),
      R => '0'
    );
\m_angle_tdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(10),
      Q => m_angle_tdata(10),
      R => '0'
    );
\m_angle_tdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(11),
      Q => m_angle_tdata(11),
      R => '0'
    );
\m_angle_tdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(12),
      Q => m_angle_tdata(12),
      R => '0'
    );
\m_angle_tdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(13),
      Q => m_angle_tdata(13),
      R => '0'
    );
\m_angle_tdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(14),
      Q => m_angle_tdata(14),
      R => '0'
    );
\m_angle_tdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(15),
      Q => m_angle_tdata(15),
      R => '0'
    );
\m_angle_tdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(1),
      Q => m_angle_tdata(1),
      R => '0'
    );
\m_angle_tdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(2),
      Q => m_angle_tdata(2),
      R => '0'
    );
\m_angle_tdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(3),
      Q => m_angle_tdata(3),
      R => '0'
    );
\m_angle_tdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(4),
      Q => m_angle_tdata(4),
      R => '0'
    );
\m_angle_tdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(5),
      Q => m_angle_tdata(5),
      R => '0'
    );
\m_angle_tdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(6),
      Q => m_angle_tdata(6),
      R => '0'
    );
\m_angle_tdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(7),
      Q => m_angle_tdata(7),
      R => '0'
    );
\m_angle_tdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(8),
      Q => m_angle_tdata(8),
      R => '0'
    );
\m_angle_tdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => p_0_in,
      D => clip_down_angle(9),
      Q => m_angle_tdata(9),
      R => '0'
    );
m_angle_tvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => p_0_in,
      Q => m_angle_tvalid,
      R => '0'
    );
m_period_tvalid0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => m_period_tvalid0_carry_n_0,
      CO(2) => m_period_tvalid0_carry_n_1,
      CO(1) => m_period_tvalid0_carry_n_2,
      CO(0) => m_period_tvalid0_carry_n_3,
      CYINIT => '0',
      DI(3) => m_period_tvalid0_carry_i_1_n_0,
      DI(2) => m_period_tvalid0_carry_i_2_n_0,
      DI(1) => m_period_tvalid0_carry_i_3_n_0,
      DI(0) => m_period_tvalid0_carry_i_4_n_0,
      O(3 downto 0) => NLW_m_period_tvalid0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => m_period_tvalid0_carry_i_5_n_0,
      S(2) => m_period_tvalid0_carry_i_6_n_0,
      S(1) => m_period_tvalid0_carry_i_7_n_0,
      S(0) => m_period_tvalid0_carry_i_8_n_0
    );
\m_period_tvalid0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => m_period_tvalid0_carry_n_0,
      CO(3) => \m_period_tvalid0_carry__0_n_0\,
      CO(2) => \m_period_tvalid0_carry__0_n_1\,
      CO(1) => \m_period_tvalid0_carry__0_n_2\,
      CO(0) => \m_period_tvalid0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \m_period_tvalid0_carry__0_i_1_n_0\,
      DI(2) => \m_period_tvalid0_carry__0_i_2_n_0\,
      DI(1) => \m_period_tvalid0_carry__0_i_3_n_0\,
      DI(0) => \m_period_tvalid0_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_m_period_tvalid0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \m_period_tvalid0_carry__0_i_5_n_0\,
      S(2) => \m_period_tvalid0_carry__0_i_6_n_0\,
      S(1) => \m_period_tvalid0_carry__0_i_7_n_0\,
      S(0) => \m_period_tvalid0_carry__0_i_8_n_0\
    );
\m_period_tvalid0_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(14),
      I1 => period_prev(14),
      I2 => period_prev(15),
      I3 => period_cnt_reg(15),
      O => \m_period_tvalid0_carry__0_i_1_n_0\
    );
\m_period_tvalid0_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(12),
      I1 => period_prev(12),
      I2 => period_prev(13),
      I3 => period_cnt_reg(13),
      O => \m_period_tvalid0_carry__0_i_2_n_0\
    );
\m_period_tvalid0_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(10),
      I1 => period_prev(10),
      I2 => period_prev(11),
      I3 => period_cnt_reg(11),
      O => \m_period_tvalid0_carry__0_i_3_n_0\
    );
\m_period_tvalid0_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(8),
      I1 => period_prev(8),
      I2 => period_prev(9),
      I3 => period_cnt_reg(9),
      O => \m_period_tvalid0_carry__0_i_4_n_0\
    );
\m_period_tvalid0_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(14),
      I1 => period_prev(14),
      I2 => period_cnt_reg(15),
      I3 => period_prev(15),
      O => \m_period_tvalid0_carry__0_i_5_n_0\
    );
\m_period_tvalid0_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(12),
      I1 => period_prev(12),
      I2 => period_cnt_reg(13),
      I3 => period_prev(13),
      O => \m_period_tvalid0_carry__0_i_6_n_0\
    );
\m_period_tvalid0_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(10),
      I1 => period_prev(10),
      I2 => period_cnt_reg(11),
      I3 => period_prev(11),
      O => \m_period_tvalid0_carry__0_i_7_n_0\
    );
\m_period_tvalid0_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(8),
      I1 => period_prev(8),
      I2 => period_cnt_reg(9),
      I3 => period_prev(9),
      O => \m_period_tvalid0_carry__0_i_8_n_0\
    );
\m_period_tvalid0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \m_period_tvalid0_carry__0_n_0\,
      CO(3) => \m_period_tvalid0_carry__1_n_0\,
      CO(2) => \m_period_tvalid0_carry__1_n_1\,
      CO(1) => \m_period_tvalid0_carry__1_n_2\,
      CO(0) => \m_period_tvalid0_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \m_period_tvalid0_carry__1_i_1_n_0\,
      DI(2) => \m_period_tvalid0_carry__1_i_2_n_0\,
      DI(1) => \m_period_tvalid0_carry__1_i_3_n_0\,
      DI(0) => \m_period_tvalid0_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_m_period_tvalid0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \m_period_tvalid0_carry__1_i_5_n_0\,
      S(2) => \m_period_tvalid0_carry__1_i_6_n_0\,
      S(1) => \m_period_tvalid0_carry__1_i_7_n_0\,
      S(0) => \m_period_tvalid0_carry__1_i_8_n_0\
    );
\m_period_tvalid0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(22),
      I1 => period_prev(22),
      I2 => period_prev(23),
      I3 => period_cnt_reg(23),
      O => \m_period_tvalid0_carry__1_i_1_n_0\
    );
\m_period_tvalid0_carry__1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(20),
      I1 => period_prev(20),
      I2 => period_prev(21),
      I3 => period_cnt_reg(21),
      O => \m_period_tvalid0_carry__1_i_2_n_0\
    );
\m_period_tvalid0_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(18),
      I1 => period_prev(18),
      I2 => period_prev(19),
      I3 => period_cnt_reg(19),
      O => \m_period_tvalid0_carry__1_i_3_n_0\
    );
\m_period_tvalid0_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(16),
      I1 => period_prev(16),
      I2 => period_prev(17),
      I3 => period_cnt_reg(17),
      O => \m_period_tvalid0_carry__1_i_4_n_0\
    );
\m_period_tvalid0_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(22),
      I1 => period_prev(22),
      I2 => period_cnt_reg(23),
      I3 => period_prev(23),
      O => \m_period_tvalid0_carry__1_i_5_n_0\
    );
\m_period_tvalid0_carry__1_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(20),
      I1 => period_prev(20),
      I2 => period_cnt_reg(21),
      I3 => period_prev(21),
      O => \m_period_tvalid0_carry__1_i_6_n_0\
    );
\m_period_tvalid0_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(18),
      I1 => period_prev(18),
      I2 => period_cnt_reg(19),
      I3 => period_prev(19),
      O => \m_period_tvalid0_carry__1_i_7_n_0\
    );
\m_period_tvalid0_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(16),
      I1 => period_prev(16),
      I2 => period_cnt_reg(17),
      I3 => period_prev(17),
      O => \m_period_tvalid0_carry__1_i_8_n_0\
    );
\m_period_tvalid0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \m_period_tvalid0_carry__1_n_0\,
      CO(3) => \m_period_tvalid0_carry__2_n_0\,
      CO(2) => \m_period_tvalid0_carry__2_n_1\,
      CO(1) => \m_period_tvalid0_carry__2_n_2\,
      CO(0) => \m_period_tvalid0_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \m_period_tvalid0_carry__2_i_1_n_0\,
      DI(2) => \m_period_tvalid0_carry__2_i_2_n_0\,
      DI(1) => \m_period_tvalid0_carry__2_i_3_n_0\,
      DI(0) => \m_period_tvalid0_carry__2_i_4_n_0\,
      O(3 downto 0) => \NLW_m_period_tvalid0_carry__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \m_period_tvalid0_carry__2_i_5_n_0\,
      S(2) => \m_period_tvalid0_carry__2_i_6_n_0\,
      S(1) => \m_period_tvalid0_carry__2_i_7_n_0\,
      S(0) => \m_period_tvalid0_carry__2_i_8_n_0\
    );
\m_period_tvalid0_carry__2_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(30),
      I1 => period_prev(30),
      I2 => period_prev(31),
      I3 => period_cnt_reg(31),
      O => \m_period_tvalid0_carry__2_i_1_n_0\
    );
\m_period_tvalid0_carry__2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(28),
      I1 => period_prev(28),
      I2 => period_prev(29),
      I3 => period_cnt_reg(29),
      O => \m_period_tvalid0_carry__2_i_2_n_0\
    );
\m_period_tvalid0_carry__2_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(26),
      I1 => period_prev(26),
      I2 => period_prev(27),
      I3 => period_cnt_reg(27),
      O => \m_period_tvalid0_carry__2_i_3_n_0\
    );
\m_period_tvalid0_carry__2_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(24),
      I1 => period_prev(24),
      I2 => period_prev(25),
      I3 => period_cnt_reg(25),
      O => \m_period_tvalid0_carry__2_i_4_n_0\
    );
\m_period_tvalid0_carry__2_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(30),
      I1 => period_prev(30),
      I2 => period_cnt_reg(31),
      I3 => period_prev(31),
      O => \m_period_tvalid0_carry__2_i_5_n_0\
    );
\m_period_tvalid0_carry__2_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(28),
      I1 => period_prev(28),
      I2 => period_cnt_reg(29),
      I3 => period_prev(29),
      O => \m_period_tvalid0_carry__2_i_6_n_0\
    );
\m_period_tvalid0_carry__2_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(26),
      I1 => period_prev(26),
      I2 => period_cnt_reg(27),
      I3 => period_prev(27),
      O => \m_period_tvalid0_carry__2_i_7_n_0\
    );
\m_period_tvalid0_carry__2_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(24),
      I1 => period_prev(24),
      I2 => period_cnt_reg(25),
      I3 => period_prev(25),
      O => \m_period_tvalid0_carry__2_i_8_n_0\
    );
m_period_tvalid0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(6),
      I1 => period_prev(6),
      I2 => period_prev(7),
      I3 => period_cnt_reg(7),
      O => m_period_tvalid0_carry_i_1_n_0
    );
m_period_tvalid0_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(4),
      I1 => period_prev(4),
      I2 => period_prev(5),
      I3 => period_cnt_reg(5),
      O => m_period_tvalid0_carry_i_2_n_0
    );
m_period_tvalid0_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(2),
      I1 => period_prev(2),
      I2 => period_prev(3),
      I3 => period_cnt_reg(3),
      O => m_period_tvalid0_carry_i_3_n_0
    );
m_period_tvalid0_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => period_cnt_reg(0),
      I1 => period_prev(0),
      I2 => period_prev(1),
      I3 => period_cnt_reg(1),
      O => m_period_tvalid0_carry_i_4_n_0
    );
m_period_tvalid0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(6),
      I1 => period_prev(6),
      I2 => period_cnt_reg(7),
      I3 => period_prev(7),
      O => m_period_tvalid0_carry_i_5_n_0
    );
m_period_tvalid0_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(4),
      I1 => period_prev(4),
      I2 => period_cnt_reg(5),
      I3 => period_prev(5),
      O => m_period_tvalid0_carry_i_6_n_0
    );
m_period_tvalid0_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(2),
      I1 => period_prev(2),
      I2 => period_cnt_reg(3),
      I3 => period_prev(3),
      O => m_period_tvalid0_carry_i_7_n_0
    );
m_period_tvalid0_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => period_cnt_reg(0),
      I1 => period_prev(0),
      I2 => period_cnt_reg(1),
      I3 => period_prev(1),
      O => m_period_tvalid0_carry_i_8_n_0
    );
\m_rpm_tdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(0),
      Q => m_rpm_tdata(0),
      R => '0'
    );
\m_rpm_tdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(10),
      Q => m_rpm_tdata(10),
      R => '0'
    );
\m_rpm_tdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(11),
      Q => m_rpm_tdata(11),
      R => '0'
    );
\m_rpm_tdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(12),
      Q => m_rpm_tdata(12),
      R => '0'
    );
\m_rpm_tdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(13),
      Q => m_rpm_tdata(13),
      R => '0'
    );
\m_rpm_tdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(14),
      Q => m_rpm_tdata(14),
      R => '0'
    );
\m_rpm_tdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(15),
      Q => m_rpm_tdata(15),
      R => '0'
    );
\m_rpm_tdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(1),
      Q => m_rpm_tdata(1),
      R => '0'
    );
\m_rpm_tdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(2),
      Q => m_rpm_tdata(2),
      R => '0'
    );
\m_rpm_tdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(3),
      Q => m_rpm_tdata(3),
      R => '0'
    );
\m_rpm_tdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(4),
      Q => m_rpm_tdata(4),
      R => '0'
    );
\m_rpm_tdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(5),
      Q => m_rpm_tdata(5),
      R => '0'
    );
\m_rpm_tdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(6),
      Q => m_rpm_tdata(6),
      R => '0'
    );
\m_rpm_tdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(7),
      Q => m_rpm_tdata(7),
      R => '0'
    );
\m_rpm_tdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(8),
      Q => m_rpm_tdata(8),
      R => '0'
    );
\m_rpm_tdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => m_rpm_tvalid_i_1_n_0,
      D => \^rpm_data\(9),
      Q => m_rpm_tdata(9),
      R => '0'
    );
m_rpm_tvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \out_period_cnt_reg_n_0_[5]\,
      I1 => \out_period_cnt_reg_n_0_[4]\,
      I2 => \out_period_cnt_reg_n_0_[1]\,
      I3 => \out_period_cnt_reg_n_0_[0]\,
      I4 => \out_period_cnt_reg_n_0_[3]\,
      I5 => \out_period_cnt_reg_n_0_[2]\,
      O => m_rpm_tvalid_i_1_n_0
    );
m_rpm_tvalid_reg: unisim.vcomponents.FDSE
     port map (
      C => axis_aclk,
      CE => '1',
      D => '0',
      Q => m_rpm_tvalid,
      S => m_rpm_tvalid_i_1_n_0
    );
\out_period_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \out_period_cnt_reg_n_0_[0]\,
      O => \out_period_cnt[0]_i_1_n_0\
    );
\out_period_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \out_period_cnt_reg_n_0_[0]\,
      I1 => \out_period_cnt_reg_n_0_[1]\,
      O => \out_period_cnt[1]_i_1_n_0\
    );
\out_period_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \out_period_cnt_reg_n_0_[0]\,
      I1 => \out_period_cnt_reg_n_0_[1]\,
      I2 => \out_period_cnt_reg_n_0_[2]\,
      O => \out_period_cnt[2]_i_1_n_0\
    );
\out_period_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \out_period_cnt_reg_n_0_[1]\,
      I1 => \out_period_cnt_reg_n_0_[0]\,
      I2 => \out_period_cnt_reg_n_0_[2]\,
      I3 => \out_period_cnt_reg_n_0_[3]\,
      O => \out_period_cnt[3]_i_1_n_0\
    );
\out_period_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \out_period_cnt_reg_n_0_[2]\,
      I1 => \out_period_cnt_reg_n_0_[0]\,
      I2 => \out_period_cnt_reg_n_0_[1]\,
      I3 => \out_period_cnt_reg_n_0_[3]\,
      I4 => \out_period_cnt_reg_n_0_[4]\,
      O => \out_period_cnt[4]_i_1_n_0\
    );
\out_period_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \out_period_cnt_reg_n_0_[3]\,
      I1 => \out_period_cnt_reg_n_0_[1]\,
      I2 => \out_period_cnt_reg_n_0_[0]\,
      I3 => \out_period_cnt_reg_n_0_[2]\,
      I4 => \out_period_cnt_reg_n_0_[4]\,
      I5 => \out_period_cnt_reg_n_0_[5]\,
      O => \out_period_cnt[5]_i_1_n_0\
    );
\out_period_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \out_period_cnt[0]_i_1_n_0\,
      Q => \out_period_cnt_reg_n_0_[0]\,
      R => m_rpm_tvalid_i_1_n_0
    );
\out_period_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \out_period_cnt[1]_i_1_n_0\,
      Q => \out_period_cnt_reg_n_0_[1]\,
      R => m_rpm_tvalid_i_1_n_0
    );
\out_period_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \out_period_cnt[2]_i_1_n_0\,
      Q => \out_period_cnt_reg_n_0_[2]\,
      R => m_rpm_tvalid_i_1_n_0
    );
\out_period_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \out_period_cnt[3]_i_1_n_0\,
      Q => \out_period_cnt_reg_n_0_[3]\,
      R => m_rpm_tvalid_i_1_n_0
    );
\out_period_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \out_period_cnt[4]_i_1_n_0\,
      Q => \out_period_cnt_reg_n_0_[4]\,
      R => m_rpm_tvalid_i_1_n_0
    );
\out_period_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \out_period_cnt[5]_i_1_n_0\,
      Q => \out_period_cnt_reg_n_0_[5]\,
      R => m_rpm_tvalid_i_1_n_0
    );
\period_cnt[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00F7"
    )
        port map (
      I0 => \period_value[15]_i_2_n_0\,
      I1 => \period_value[15]_i_3_n_0\,
      I2 => \period_value[15]_i_4_n_0\,
      I3 => period_cnt_reg(31),
      O => \period_cnt[0]_i_1_n_0\
    );
\period_cnt[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(3),
      O => \period_cnt[0]_i_3_n_0\
    );
\period_cnt[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(2),
      O => \period_cnt[0]_i_4_n_0\
    );
\period_cnt[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(1),
      O => \period_cnt[0]_i_5_n_0\
    );
\period_cnt[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => period_cnt_reg(0),
      O => \period_cnt[0]_i_6_n_0\
    );
\period_cnt[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(15),
      O => \period_cnt[12]_i_2_n_0\
    );
\period_cnt[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(14),
      O => \period_cnt[12]_i_3_n_0\
    );
\period_cnt[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(13),
      O => \period_cnt[12]_i_4_n_0\
    );
\period_cnt[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(12),
      O => \period_cnt[12]_i_5_n_0\
    );
\period_cnt[16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(19),
      O => \period_cnt[16]_i_2_n_0\
    );
\period_cnt[16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(18),
      O => \period_cnt[16]_i_3_n_0\
    );
\period_cnt[16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(17),
      O => \period_cnt[16]_i_4_n_0\
    );
\period_cnt[16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(16),
      O => \period_cnt[16]_i_5_n_0\
    );
\period_cnt[20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(23),
      O => \period_cnt[20]_i_2_n_0\
    );
\period_cnt[20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(22),
      O => \period_cnt[20]_i_3_n_0\
    );
\period_cnt[20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(21),
      O => \period_cnt[20]_i_4_n_0\
    );
\period_cnt[20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(20),
      O => \period_cnt[20]_i_5_n_0\
    );
\period_cnt[24]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(27),
      O => \period_cnt[24]_i_2_n_0\
    );
\period_cnt[24]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(26),
      O => \period_cnt[24]_i_3_n_0\
    );
\period_cnt[24]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(25),
      O => \period_cnt[24]_i_4_n_0\
    );
\period_cnt[24]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(24),
      O => \period_cnt[24]_i_5_n_0\
    );
\period_cnt[28]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(31),
      O => \period_cnt[28]_i_2_n_0\
    );
\period_cnt[28]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(30),
      O => \period_cnt[28]_i_3_n_0\
    );
\period_cnt[28]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(29),
      O => \period_cnt[28]_i_4_n_0\
    );
\period_cnt[28]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(28),
      O => \period_cnt[28]_i_5_n_0\
    );
\period_cnt[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(7),
      O => \period_cnt[4]_i_2_n_0\
    );
\period_cnt[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(6),
      O => \period_cnt[4]_i_3_n_0\
    );
\period_cnt[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(5),
      O => \period_cnt[4]_i_4_n_0\
    );
\period_cnt[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(4),
      O => \period_cnt[4]_i_5_n_0\
    );
\period_cnt[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(11),
      O => \period_cnt[8]_i_2_n_0\
    );
\period_cnt[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(10),
      O => \period_cnt[8]_i_3_n_0\
    );
\period_cnt[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(9),
      O => \period_cnt[8]_i_4_n_0\
    );
\period_cnt[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => period_cnt_reg(8),
      O => \period_cnt[8]_i_5_n_0\
    );
\period_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[0]_i_2_n_7\,
      Q => period_cnt_reg(0),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \period_cnt_reg[0]_i_2_n_0\,
      CO(2) => \period_cnt_reg[0]_i_2_n_1\,
      CO(1) => \period_cnt_reg[0]_i_2_n_2\,
      CO(0) => \period_cnt_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \period_cnt_reg[0]_i_2_n_4\,
      O(2) => \period_cnt_reg[0]_i_2_n_5\,
      O(1) => \period_cnt_reg[0]_i_2_n_6\,
      O(0) => \period_cnt_reg[0]_i_2_n_7\,
      S(3) => \period_cnt[0]_i_3_n_0\,
      S(2) => \period_cnt[0]_i_4_n_0\,
      S(1) => \period_cnt[0]_i_5_n_0\,
      S(0) => \period_cnt[0]_i_6_n_0\
    );
\period_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[8]_i_1_n_5\,
      Q => period_cnt_reg(10),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[8]_i_1_n_4\,
      Q => period_cnt_reg(11),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[12]_i_1_n_7\,
      Q => period_cnt_reg(12),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \period_cnt_reg[8]_i_1_n_0\,
      CO(3) => \period_cnt_reg[12]_i_1_n_0\,
      CO(2) => \period_cnt_reg[12]_i_1_n_1\,
      CO(1) => \period_cnt_reg[12]_i_1_n_2\,
      CO(0) => \period_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \period_cnt_reg[12]_i_1_n_4\,
      O(2) => \period_cnt_reg[12]_i_1_n_5\,
      O(1) => \period_cnt_reg[12]_i_1_n_6\,
      O(0) => \period_cnt_reg[12]_i_1_n_7\,
      S(3) => \period_cnt[12]_i_2_n_0\,
      S(2) => \period_cnt[12]_i_3_n_0\,
      S(1) => \period_cnt[12]_i_4_n_0\,
      S(0) => \period_cnt[12]_i_5_n_0\
    );
\period_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[12]_i_1_n_6\,
      Q => period_cnt_reg(13),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[12]_i_1_n_5\,
      Q => period_cnt_reg(14),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[12]_i_1_n_4\,
      Q => period_cnt_reg(15),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[16]_i_1_n_7\,
      Q => period_cnt_reg(16),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \period_cnt_reg[12]_i_1_n_0\,
      CO(3) => \period_cnt_reg[16]_i_1_n_0\,
      CO(2) => \period_cnt_reg[16]_i_1_n_1\,
      CO(1) => \period_cnt_reg[16]_i_1_n_2\,
      CO(0) => \period_cnt_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \period_cnt_reg[16]_i_1_n_4\,
      O(2) => \period_cnt_reg[16]_i_1_n_5\,
      O(1) => \period_cnt_reg[16]_i_1_n_6\,
      O(0) => \period_cnt_reg[16]_i_1_n_7\,
      S(3) => \period_cnt[16]_i_2_n_0\,
      S(2) => \period_cnt[16]_i_3_n_0\,
      S(1) => \period_cnt[16]_i_4_n_0\,
      S(0) => \period_cnt[16]_i_5_n_0\
    );
\period_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[16]_i_1_n_6\,
      Q => period_cnt_reg(17),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[16]_i_1_n_5\,
      Q => period_cnt_reg(18),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[16]_i_1_n_4\,
      Q => period_cnt_reg(19),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[0]_i_2_n_6\,
      Q => period_cnt_reg(1),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[20]_i_1_n_7\,
      Q => period_cnt_reg(20),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \period_cnt_reg[16]_i_1_n_0\,
      CO(3) => \period_cnt_reg[20]_i_1_n_0\,
      CO(2) => \period_cnt_reg[20]_i_1_n_1\,
      CO(1) => \period_cnt_reg[20]_i_1_n_2\,
      CO(0) => \period_cnt_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \period_cnt_reg[20]_i_1_n_4\,
      O(2) => \period_cnt_reg[20]_i_1_n_5\,
      O(1) => \period_cnt_reg[20]_i_1_n_6\,
      O(0) => \period_cnt_reg[20]_i_1_n_7\,
      S(3) => \period_cnt[20]_i_2_n_0\,
      S(2) => \period_cnt[20]_i_3_n_0\,
      S(1) => \period_cnt[20]_i_4_n_0\,
      S(0) => \period_cnt[20]_i_5_n_0\
    );
\period_cnt_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[20]_i_1_n_6\,
      Q => period_cnt_reg(21),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[20]_i_1_n_5\,
      Q => period_cnt_reg(22),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[20]_i_1_n_4\,
      Q => period_cnt_reg(23),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[24]_i_1_n_7\,
      Q => period_cnt_reg(24),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \period_cnt_reg[20]_i_1_n_0\,
      CO(3) => \period_cnt_reg[24]_i_1_n_0\,
      CO(2) => \period_cnt_reg[24]_i_1_n_1\,
      CO(1) => \period_cnt_reg[24]_i_1_n_2\,
      CO(0) => \period_cnt_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \period_cnt_reg[24]_i_1_n_4\,
      O(2) => \period_cnt_reg[24]_i_1_n_5\,
      O(1) => \period_cnt_reg[24]_i_1_n_6\,
      O(0) => \period_cnt_reg[24]_i_1_n_7\,
      S(3) => \period_cnt[24]_i_2_n_0\,
      S(2) => \period_cnt[24]_i_3_n_0\,
      S(1) => \period_cnt[24]_i_4_n_0\,
      S(0) => \period_cnt[24]_i_5_n_0\
    );
\period_cnt_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[24]_i_1_n_6\,
      Q => period_cnt_reg(25),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[24]_i_1_n_5\,
      Q => period_cnt_reg(26),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[24]_i_1_n_4\,
      Q => period_cnt_reg(27),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[28]_i_1_n_7\,
      Q => period_cnt_reg(28),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \period_cnt_reg[24]_i_1_n_0\,
      CO(3) => \NLW_period_cnt_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \period_cnt_reg[28]_i_1_n_1\,
      CO(1) => \period_cnt_reg[28]_i_1_n_2\,
      CO(0) => \period_cnt_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \period_cnt_reg[28]_i_1_n_4\,
      O(2) => \period_cnt_reg[28]_i_1_n_5\,
      O(1) => \period_cnt_reg[28]_i_1_n_6\,
      O(0) => \period_cnt_reg[28]_i_1_n_7\,
      S(3) => \period_cnt[28]_i_2_n_0\,
      S(2) => \period_cnt[28]_i_3_n_0\,
      S(1) => \period_cnt[28]_i_4_n_0\,
      S(0) => \period_cnt[28]_i_5_n_0\
    );
\period_cnt_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[28]_i_1_n_6\,
      Q => period_cnt_reg(29),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[0]_i_2_n_5\,
      Q => period_cnt_reg(2),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[28]_i_1_n_5\,
      Q => period_cnt_reg(30),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[28]_i_1_n_4\,
      Q => period_cnt_reg(31),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[0]_i_2_n_4\,
      Q => period_cnt_reg(3),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[4]_i_1_n_7\,
      Q => period_cnt_reg(4),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \period_cnt_reg[0]_i_2_n_0\,
      CO(3) => \period_cnt_reg[4]_i_1_n_0\,
      CO(2) => \period_cnt_reg[4]_i_1_n_1\,
      CO(1) => \period_cnt_reg[4]_i_1_n_2\,
      CO(0) => \period_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \period_cnt_reg[4]_i_1_n_4\,
      O(2) => \period_cnt_reg[4]_i_1_n_5\,
      O(1) => \period_cnt_reg[4]_i_1_n_6\,
      O(0) => \period_cnt_reg[4]_i_1_n_7\,
      S(3) => \period_cnt[4]_i_2_n_0\,
      S(2) => \period_cnt[4]_i_3_n_0\,
      S(1) => \period_cnt[4]_i_4_n_0\,
      S(0) => \period_cnt[4]_i_5_n_0\
    );
\period_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[4]_i_1_n_6\,
      Q => period_cnt_reg(5),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[4]_i_1_n_5\,
      Q => period_cnt_reg(6),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[4]_i_1_n_4\,
      Q => period_cnt_reg(7),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[8]_i_1_n_7\,
      Q => period_cnt_reg(8),
      R => \cnt[15]_i_2_n_0\
    );
\period_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \period_cnt_reg[4]_i_1_n_0\,
      CO(3) => \period_cnt_reg[8]_i_1_n_0\,
      CO(2) => \period_cnt_reg[8]_i_1_n_1\,
      CO(1) => \period_cnt_reg[8]_i_1_n_2\,
      CO(0) => \period_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \period_cnt_reg[8]_i_1_n_4\,
      O(2) => \period_cnt_reg[8]_i_1_n_5\,
      O(1) => \period_cnt_reg[8]_i_1_n_6\,
      O(0) => \period_cnt_reg[8]_i_1_n_7\,
      S(3) => \period_cnt[8]_i_2_n_0\,
      S(2) => \period_cnt[8]_i_3_n_0\,
      S(1) => \period_cnt[8]_i_4_n_0\,
      S(0) => \period_cnt[8]_i_5_n_0\
    );
\period_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_cnt[0]_i_1_n_0\,
      D => \period_cnt_reg[8]_i_1_n_6\,
      Q => period_cnt_reg(9),
      R => \cnt[15]_i_2_n_0\
    );
period_dir_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AACA"
    )
        port map (
      I0 => period_dir,
      I1 => b_f,
      I2 => a_sr(0),
      I3 => a_sr(1),
      O => period_dir_i_1_n_0
    );
period_dir_reg: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => period_dir_i_1_n_0,
      Q => period_dir,
      R => '0'
    );
\period_prev_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(0),
      Q => period_prev(0),
      R => '0'
    );
\period_prev_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(10),
      Q => period_prev(10),
      R => '0'
    );
\period_prev_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(11),
      Q => period_prev(11),
      R => '0'
    );
\period_prev_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(12),
      Q => period_prev(12),
      R => '0'
    );
\period_prev_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(13),
      Q => period_prev(13),
      R => '0'
    );
\period_prev_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(14),
      Q => period_prev(14),
      R => '0'
    );
\period_prev_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(15),
      Q => period_prev(15),
      R => '0'
    );
\period_prev_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(16),
      Q => period_prev(16),
      R => '0'
    );
\period_prev_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(17),
      Q => period_prev(17),
      R => '0'
    );
\period_prev_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(18),
      Q => period_prev(18),
      R => '0'
    );
\period_prev_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(19),
      Q => period_prev(19),
      R => '0'
    );
\period_prev_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(1),
      Q => period_prev(1),
      R => '0'
    );
\period_prev_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(20),
      Q => period_prev(20),
      R => '0'
    );
\period_prev_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(21),
      Q => period_prev(21),
      R => '0'
    );
\period_prev_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(22),
      Q => period_prev(22),
      R => '0'
    );
\period_prev_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(23),
      Q => period_prev(23),
      R => '0'
    );
\period_prev_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(24),
      Q => period_prev(24),
      R => '0'
    );
\period_prev_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(25),
      Q => period_prev(25),
      R => '0'
    );
\period_prev_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(26),
      Q => period_prev(26),
      R => '0'
    );
\period_prev_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(27),
      Q => period_prev(27),
      R => '0'
    );
\period_prev_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(28),
      Q => period_prev(28),
      R => '0'
    );
\period_prev_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(29),
      Q => period_prev(29),
      R => '0'
    );
\period_prev_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(2),
      Q => period_prev(2),
      R => '0'
    );
\period_prev_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(30),
      Q => period_prev(30),
      R => '0'
    );
\period_prev_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => period_value(31),
      Q => period_prev(31),
      R => '0'
    );
\period_prev_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(3),
      Q => period_prev(3),
      R => '0'
    );
\period_prev_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(4),
      Q => period_prev(4),
      R => '0'
    );
\period_prev_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(5),
      Q => period_prev(5),
      R => '0'
    );
\period_prev_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(6),
      Q => period_prev(6),
      R => '0'
    );
\period_prev_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(7),
      Q => period_prev(7),
      R => '0'
    );
\period_prev_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(8),
      Q => period_prev(8),
      R => '0'
    );
\period_prev_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \cnt[15]_i_2_n_0\,
      D => \^period_data\(9),
      Q => period_prev(9),
      R => '0'
    );
\period_value[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000AA2A"
    )
        port map (
      I0 => \m_period_tvalid0_carry__2_n_0\,
      I1 => \period_value[15]_i_2_n_0\,
      I2 => \period_value[15]_i_3_n_0\,
      I3 => \period_value[15]_i_4_n_0\,
      I4 => period_cnt_reg(31),
      I5 => \cnt[15]_i_2_n_0\,
      O => \period_value[15]_i_1_n_0\
    );
\period_value[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => \period_value[15]_i_5_n_0\,
      I1 => period_cnt_reg(29),
      I2 => period_cnt_reg(30),
      I3 => period_cnt_reg(28),
      I4 => \period_value[15]_i_6_n_0\,
      I5 => \period_value[15]_i_7_n_0\,
      O => \period_value[15]_i_2_n_0\
    );
\period_value[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => period_cnt_reg(14),
      I1 => period_cnt_reg(15),
      I2 => period_cnt_reg(12),
      I3 => period_cnt_reg(13),
      I4 => \period_value[15]_i_8_n_0\,
      O => \period_value[15]_i_3_n_0\
    );
\period_value[15]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => period_cnt_reg(2),
      I1 => period_cnt_reg(3),
      I2 => period_cnt_reg(0),
      I3 => period_cnt_reg(1),
      I4 => \period_value[15]_i_9_n_0\,
      O => \period_value[15]_i_4_n_0\
    );
\period_value[15]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => period_cnt_reg(25),
      I1 => period_cnt_reg(24),
      I2 => period_cnt_reg(27),
      I3 => period_cnt_reg(26),
      O => \period_value[15]_i_5_n_0\
    );
\period_value[15]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => period_cnt_reg(21),
      I1 => period_cnt_reg(20),
      I2 => period_cnt_reg(23),
      I3 => period_cnt_reg(22),
      O => \period_value[15]_i_6_n_0\
    );
\period_value[15]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => period_cnt_reg(17),
      I1 => period_cnt_reg(16),
      I2 => period_cnt_reg(19),
      I3 => period_cnt_reg(18),
      O => \period_value[15]_i_7_n_0\
    );
\period_value[15]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => period_cnt_reg(9),
      I1 => period_cnt_reg(8),
      I2 => period_cnt_reg(11),
      I3 => period_cnt_reg(10),
      O => \period_value[15]_i_8_n_0\
    );
\period_value[15]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => period_cnt_reg(5),
      I1 => period_cnt_reg(4),
      I2 => period_cnt_reg(7),
      I3 => period_cnt_reg(6),
      O => \period_value[15]_i_9_n_0\
    );
\period_value_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(0),
      Q => \^period_data\(0),
      R => '0'
    );
\period_value_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(10),
      Q => \^period_data\(10),
      R => '0'
    );
\period_value_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(11),
      Q => \^period_data\(11),
      R => '0'
    );
\period_value_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(12),
      Q => \^period_data\(12),
      R => '0'
    );
\period_value_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(13),
      Q => \^period_data\(13),
      R => '0'
    );
\period_value_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(14),
      Q => \^period_data\(14),
      R => '0'
    );
\period_value_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(15),
      Q => \^period_data\(15),
      R => '0'
    );
\period_value_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(16),
      Q => period_value(16),
      R => '0'
    );
\period_value_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(17),
      Q => period_value(17),
      R => '0'
    );
\period_value_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(18),
      Q => period_value(18),
      R => '0'
    );
\period_value_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(19),
      Q => period_value(19),
      R => '0'
    );
\period_value_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(1),
      Q => \^period_data\(1),
      R => '0'
    );
\period_value_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(20),
      Q => period_value(20),
      R => '0'
    );
\period_value_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(21),
      Q => period_value(21),
      R => '0'
    );
\period_value_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(22),
      Q => period_value(22),
      R => '0'
    );
\period_value_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(23),
      Q => period_value(23),
      R => '0'
    );
\period_value_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(24),
      Q => period_value(24),
      R => '0'
    );
\period_value_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(25),
      Q => period_value(25),
      R => '0'
    );
\period_value_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(26),
      Q => period_value(26),
      R => '0'
    );
\period_value_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(27),
      Q => period_value(27),
      R => '0'
    );
\period_value_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(28),
      Q => period_value(28),
      R => '0'
    );
\period_value_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(29),
      Q => period_value(29),
      R => '0'
    );
\period_value_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(2),
      Q => \^period_data\(2),
      R => '0'
    );
\period_value_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(30),
      Q => period_value(30),
      R => '0'
    );
\period_value_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(31),
      Q => period_value(31),
      R => '0'
    );
\period_value_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(3),
      Q => \^period_data\(3),
      R => '0'
    );
\period_value_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(4),
      Q => \^period_data\(4),
      R => '0'
    );
\period_value_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(5),
      Q => \^period_data\(5),
      R => '0'
    );
\period_value_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(6),
      Q => \^period_data\(6),
      R => '0'
    );
\period_value_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(7),
      Q => \^period_data\(7),
      R => '0'
    );
\period_value_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(8),
      Q => \^period_data\(8),
      R => '0'
    );
\period_value_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \period_value[15]_i_1_n_0\,
      D => period_cnt_reg(9),
      Q => \^period_data\(9),
      R => '0'
    );
\rpm_data_i[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000400"
    )
        port map (
      I0 => sm_state,
      I1 => \rpm_data_i[15]_i_3_n_0\,
      I2 => \rpm_data_i[15]_i_4_n_0\,
      I3 => \rpm_data_i[15]_i_5_n_0\,
      I4 => \rpm_data_i[15]_i_6_n_0\,
      O => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i[15]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^period_data\(7),
      I1 => \^period_data\(6),
      I2 => \^period_data\(5),
      I3 => \^period_data\(4),
      O => \rpm_data_i[15]_i_10_n_0\
    );
\rpm_data_i[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => sm_state,
      I1 => \div_value1_carry__2_n_0\,
      O => \rpm_data_i[15]_i_2_n_0\
    );
\rpm_data_i[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => period_value(28),
      I1 => period_value(29),
      I2 => period_value(31),
      I3 => period_value(30),
      I4 => \rpm_data_i[15]_i_7_n_0\,
      O => \rpm_data_i[15]_i_3_n_0\
    );
\rpm_data_i[15]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => period_value(16),
      I1 => period_value(17),
      I2 => period_value(18),
      I3 => period_value(19),
      I4 => \rpm_data_i[15]_i_8_n_0\,
      O => \rpm_data_i[15]_i_4_n_0\
    );
\rpm_data_i[15]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \^period_data\(12),
      I1 => \^period_data\(13),
      I2 => \^period_data\(14),
      I3 => \^period_data\(15),
      I4 => \rpm_data_i[15]_i_9_n_0\,
      O => \rpm_data_i[15]_i_5_n_0\
    );
\rpm_data_i[15]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => \^period_data\(0),
      I1 => \^period_data\(1),
      I2 => \^period_data\(2),
      I3 => \^period_data\(3),
      I4 => \rpm_data_i[15]_i_10_n_0\,
      O => \rpm_data_i[15]_i_6_n_0\
    );
\rpm_data_i[15]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => period_value(25),
      I1 => period_value(24),
      I2 => period_value(27),
      I3 => period_value(26),
      O => \rpm_data_i[15]_i_7_n_0\
    );
\rpm_data_i[15]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => period_value(23),
      I1 => period_value(22),
      I2 => period_value(21),
      I3 => period_value(20),
      O => \rpm_data_i[15]_i_8_n_0\
    );
\rpm_data_i[15]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^period_data\(9),
      I1 => \^period_data\(8),
      I2 => \^period_data\(11),
      I3 => \^period_data\(10),
      O => \rpm_data_i[15]_i_9_n_0\
    );
\rpm_data_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(0),
      Q => \^rpm_data\(0),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(10),
      Q => \^rpm_data\(10),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(11),
      Q => \^rpm_data\(11),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(12),
      Q => \^rpm_data\(12),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(13),
      Q => \^rpm_data\(13),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(14),
      Q => \^rpm_data\(14),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(15),
      Q => \^rpm_data\(15),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(1),
      Q => \^rpm_data\(1),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(2),
      Q => \^rpm_data\(2),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(3),
      Q => \^rpm_data\(3),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(4),
      Q => \^rpm_data\(4),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(5),
      Q => \^rpm_data\(5),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(6),
      Q => \^rpm_data\(6),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(7),
      Q => \^rpm_data\(7),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(8),
      Q => \^rpm_data\(8),
      R => \rpm_data_i[15]_i_1_n_0\
    );
\rpm_data_i_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => \rpm_data_i[15]_i_2_n_0\,
      D => div_cnt_reg(9),
      Q => \^rpm_data\(9),
      R => \rpm_data_i[15]_i_1_n_0\
    );
sm_state_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7777747777777777"
    )
        port map (
      I0 => \div_value1_carry__2_n_0\,
      I1 => sm_state,
      I2 => \rpm_data_i[15]_i_6_n_0\,
      I3 => \rpm_data_i[15]_i_5_n_0\,
      I4 => \rpm_data_i[15]_i_4_n_0\,
      I5 => \rpm_data_i[15]_i_3_n_0\,
      O => sm_state_i_1_n_0
    );
sm_state_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axis_aclk,
      CE => '1',
      D => sm_state_i_1_n_0,
      Q => sm_state,
      R => '0'
    );
update_reg: unisim.vcomponents.FDRE
     port map (
      C => axis_aclk,
      CE => '1',
      D => \cnt[15]_i_2_n_0\,
      Q => update,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_encoder_0_0 is
  port (
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    I : in STD_LOGIC;
    angle_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    period_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rpm_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    axis_aclk : in STD_LOGIC;
    axis_aresetn : in STD_LOGIC;
    m_angle_tvalid : out STD_LOGIC;
    m_angle_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_angle_tready : in STD_LOGIC;
    m_rpm_tvalid : out STD_LOGIC;
    m_rpm_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_rpm_tready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of zsys_axis_encoder_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of zsys_axis_encoder_0_0 : entity is "zsys_axis_encoder_0_0,axis_encoder_v1_0,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of zsys_axis_encoder_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of zsys_axis_encoder_0_0 : entity is "axis_encoder_v1_0,Vivado 2017.1_sdx";
end zsys_axis_encoder_0_0;

architecture STRUCTURE of zsys_axis_encoder_0_0 is
  signal \^m_angle_tdata\ : STD_LOGIC_VECTOR ( 15 downto 0 );
begin
  angle_data(15 downto 0) <= \^m_angle_tdata\(15 downto 0);
  m_angle_tdata(15 downto 0) <= \^m_angle_tdata\(15 downto 0);
U0: entity work.zsys_axis_encoder_0_0_axis_encoder_v1_0
     port map (
      A => A,
      B => B,
      I => I,
      axis_aclk => axis_aclk,
      m_angle_tdata(15 downto 0) => \^m_angle_tdata\(15 downto 0),
      m_angle_tvalid => m_angle_tvalid,
      m_rpm_tdata(15 downto 0) => m_rpm_tdata(15 downto 0),
      m_rpm_tvalid => m_rpm_tvalid,
      period_data(15 downto 0) => period_data(15 downto 0),
      rpm_data(15 downto 0) => rpm_data(15 downto 0)
    );
end STRUCTURE;
