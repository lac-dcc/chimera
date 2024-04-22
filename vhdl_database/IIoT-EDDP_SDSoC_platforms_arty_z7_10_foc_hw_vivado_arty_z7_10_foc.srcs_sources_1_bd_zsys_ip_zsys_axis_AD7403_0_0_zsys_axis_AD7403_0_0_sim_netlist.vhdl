-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
-- Date        : Thu Oct  5 15:59:55 2017
-- Host        : free-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               B:/cores/2017.1/design/TEC0053/platforms/arty_z7_10_foc/hw/vivado/arty_z7_10_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_AD7403_0_0/zsys_axis_AD7403_0_0_sim_netlist.vhdl
-- Design      : zsys_axis_AD7403_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_AD7403_0_0_sinc3 is
  port (
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    update : out STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zsys_axis_AD7403_0_0_sinc3 : entity is "sinc3";
end zsys_axis_AD7403_0_0_sinc3;

architecture STRUCTURE of zsys_axis_AD7403_0_0_sinc3 is
  signal \acc1[0]_i_2_n_0\ : STD_LOGIC;
  signal \acc1[0]_i_3_n_0\ : STD_LOGIC;
  signal \acc1[0]_i_4_n_0\ : STD_LOGIC;
  signal \acc1[0]_i_5_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_2_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_3_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_4_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_5_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_2_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_3_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_4_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_5_n_0\ : STD_LOGIC;
  signal \acc1[20]_i_2_n_0\ : STD_LOGIC;
  signal \acc1[20]_i_3_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_2_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_3_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_4_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_5_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_2_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_3_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_4_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_5_n_0\ : STD_LOGIC;
  signal acc1_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \acc1_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \acc1_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \acc1_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \acc1_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \acc2[0]_i_2_n_0\ : STD_LOGIC;
  signal \acc2[0]_i_3_n_0\ : STD_LOGIC;
  signal \acc2[0]_i_4_n_0\ : STD_LOGIC;
  signal \acc2[0]_i_5_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_2_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_3_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_4_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_5_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_2_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_3_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_4_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_5_n_0\ : STD_LOGIC;
  signal \acc2[20]_i_2_n_0\ : STD_LOGIC;
  signal \acc2[20]_i_3_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_2_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_3_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_4_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_5_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_2_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_3_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_4_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_5_n_0\ : STD_LOGIC;
  signal acc2_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \acc2_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \acc2_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \acc2_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \acc2_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \acc3[0]_i_2_n_0\ : STD_LOGIC;
  signal \acc3[0]_i_3_n_0\ : STD_LOGIC;
  signal \acc3[0]_i_4_n_0\ : STD_LOGIC;
  signal \acc3[0]_i_5_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_2_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_3_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_4_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_5_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_2_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_3_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_4_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_5_n_0\ : STD_LOGIC;
  signal \acc3[20]_i_2_n_0\ : STD_LOGIC;
  signal \acc3[20]_i_3_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_2_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_3_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_4_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_5_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_2_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_3_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_4_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_5_n_0\ : STD_LOGIC;
  signal acc3_d2 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal acc3_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \acc3_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \acc3_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \acc3_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \acc3_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \ch_data[0]_0\ : STD_LOGIC_VECTOR ( 15 to 15 );
  signal data0 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal diff1 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal diff102_out : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff1[11]_i_2_n_0\ : STD_LOGIC;
  signal \diff1[11]_i_3_n_0\ : STD_LOGIC;
  signal \diff1[11]_i_4_n_0\ : STD_LOGIC;
  signal \diff1[11]_i_5_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_2_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_3_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_4_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_5_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_2_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_3_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_4_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_5_n_0\ : STD_LOGIC;
  signal \diff1[21]_i_2_n_0\ : STD_LOGIC;
  signal \diff1[21]_i_3_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_2_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_3_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_4_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_5_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_2_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_3_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_4_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_5_n_0\ : STD_LOGIC;
  signal diff1_d : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff1_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \diff1_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \diff1_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \diff1_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \diff1_reg[21]_i_1_n_3\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal diff2 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal diff201_out : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff2[11]_i_2_n_0\ : STD_LOGIC;
  signal \diff2[11]_i_3_n_0\ : STD_LOGIC;
  signal \diff2[11]_i_4_n_0\ : STD_LOGIC;
  signal \diff2[11]_i_5_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_2_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_3_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_4_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_5_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_2_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_3_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_4_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_5_n_0\ : STD_LOGIC;
  signal \diff2[21]_i_2_n_0\ : STD_LOGIC;
  signal \diff2[21]_i_3_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_2_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_3_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_4_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_5_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_2_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_3_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_4_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_5_n_0\ : STD_LOGIC;
  signal diff2_d : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff2_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \diff2_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \diff2_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \diff2_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \diff2_reg[21]_i_1_n_3\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal diff300_out : STD_LOGIC_VECTOR ( 21 downto 5 );
  signal \diff3[11]_i_2_n_0\ : STD_LOGIC;
  signal \diff3[11]_i_3_n_0\ : STD_LOGIC;
  signal \diff3[11]_i_4_n_0\ : STD_LOGIC;
  signal \diff3[11]_i_5_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_2_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_3_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_4_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_5_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_2_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_3_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_4_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_5_n_0\ : STD_LOGIC;
  signal \diff3[21]_i_2_n_0\ : STD_LOGIC;
  signal \diff3[21]_i_3_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_10_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_3_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_4_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_5_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_6_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_7_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_8_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_9_n_0\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \diff3_reg[21]_i_1_n_3\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2_n_1\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2_n_2\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2_n_3\ : STD_LOGIC;
  signal \diff3_reg_n_0_[5]\ : STD_LOGIC;
  signal \diff3_reg_n_0_[6]\ : STD_LOGIC;
  signal \diff3_reg_n_0_[7]\ : STD_LOGIC;
  signal mdat_i : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \tdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \tdata[0]_i_3_n_0\ : STD_LOGIC;
  signal \tdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \tdata[0]_i_5_n_0\ : STD_LOGIC;
  signal \tdata[15]_i_1_n_0\ : STD_LOGIC;
  signal word_clk : STD_LOGIC;
  signal word_clk0 : STD_LOGIC;
  signal word_clk_i_3_n_0 : STD_LOGIC;
  signal word_clk_i_4_n_0 : STD_LOGIC;
  signal word_clk_i_5_n_0 : STD_LOGIC;
  signal word_clk_i_6_n_0 : STD_LOGIC;
  signal word_clk_i_7_n_0 : STD_LOGIC;
  signal word_clk_i_8_n_0 : STD_LOGIC;
  signal word_clk_reg_i_1_n_3 : STD_LOGIC;
  signal word_clk_reg_i_2_n_0 : STD_LOGIC;
  signal word_clk_reg_i_2_n_1 : STD_LOGIC;
  signal word_clk_reg_i_2_n_2 : STD_LOGIC;
  signal word_clk_reg_i_2_n_3 : STD_LOGIC;
  signal word_count0 : STD_LOGIC;
  signal \word_count[0]_i_10_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_11_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_12_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_13_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_4_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_6_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_7_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_8_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_9_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_2_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_3_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_4_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_5_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_2_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_3_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_4_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_5_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_2_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_3_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_4_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_5_n_0\ : STD_LOGIC;
  signal word_count_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \word_count_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_acc1_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_acc1_reg[20]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_acc2_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_acc2_reg[20]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_acc3_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_acc3_reg[20]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff1_reg[21]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_diff1_reg[21]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff2_reg[21]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_diff2_reg[21]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff3_reg[21]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_diff3_reg[21]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff3_reg[7]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_diff3_reg[7]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_word_clk_reg_i_1_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_word_clk_reg_i_1_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_word_clk_reg_i_2_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_count_reg[0]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_word_count_reg[0]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_count_reg[0]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_count_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
\acc1[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(3),
      O => \acc1[0]_i_2_n_0\
    );
\acc1[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(2),
      O => \acc1[0]_i_3_n_0\
    );
\acc1[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(1),
      O => \acc1[0]_i_4_n_0\
    );
\acc1[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => acc1_reg(0),
      O => \acc1[0]_i_5_n_0\
    );
\acc1[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(15),
      O => \acc1[12]_i_2_n_0\
    );
\acc1[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(14),
      O => \acc1[12]_i_3_n_0\
    );
\acc1[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(13),
      O => \acc1[12]_i_4_n_0\
    );
\acc1[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(12),
      O => \acc1[12]_i_5_n_0\
    );
\acc1[16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(19),
      O => \acc1[16]_i_2_n_0\
    );
\acc1[16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(18),
      O => \acc1[16]_i_3_n_0\
    );
\acc1[16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(17),
      O => \acc1[16]_i_4_n_0\
    );
\acc1[16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(16),
      O => \acc1[16]_i_5_n_0\
    );
\acc1[20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(21),
      O => \acc1[20]_i_2_n_0\
    );
\acc1[20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(20),
      O => \acc1[20]_i_3_n_0\
    );
\acc1[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(7),
      O => \acc1[4]_i_2_n_0\
    );
\acc1[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(6),
      O => \acc1[4]_i_3_n_0\
    );
\acc1[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(5),
      O => \acc1[4]_i_4_n_0\
    );
\acc1[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(4),
      O => \acc1[4]_i_5_n_0\
    );
\acc1[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(11),
      O => \acc1[8]_i_2_n_0\
    );
\acc1[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(10),
      O => \acc1[8]_i_3_n_0\
    );
\acc1[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(9),
      O => \acc1[8]_i_4_n_0\
    );
\acc1[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(8),
      O => \acc1[8]_i_5_n_0\
    );
\acc1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1_n_7\,
      Q => acc1_reg(0),
      R => '0'
    );
\acc1_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc1_reg[0]_i_1_n_0\,
      CO(2) => \acc1_reg[0]_i_1_n_1\,
      CO(1) => \acc1_reg[0]_i_1_n_2\,
      CO(0) => \acc1_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \acc1_reg[0]_i_1_n_4\,
      O(2) => \acc1_reg[0]_i_1_n_5\,
      O(1) => \acc1_reg[0]_i_1_n_6\,
      O(0) => \acc1_reg[0]_i_1_n_7\,
      S(3) => \acc1[0]_i_2_n_0\,
      S(2) => \acc1[0]_i_3_n_0\,
      S(1) => \acc1[0]_i_4_n_0\,
      S(0) => \acc1[0]_i_5_n_0\
    );
\acc1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1_n_5\,
      Q => acc1_reg(10),
      R => '0'
    );
\acc1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1_n_4\,
      Q => acc1_reg(11),
      R => '0'
    );
\acc1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1_n_7\,
      Q => acc1_reg(12),
      R => '0'
    );
\acc1_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[8]_i_1_n_0\,
      CO(3) => \acc1_reg[12]_i_1_n_0\,
      CO(2) => \acc1_reg[12]_i_1_n_1\,
      CO(1) => \acc1_reg[12]_i_1_n_2\,
      CO(0) => \acc1_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[12]_i_1_n_4\,
      O(2) => \acc1_reg[12]_i_1_n_5\,
      O(1) => \acc1_reg[12]_i_1_n_6\,
      O(0) => \acc1_reg[12]_i_1_n_7\,
      S(3) => \acc1[12]_i_2_n_0\,
      S(2) => \acc1[12]_i_3_n_0\,
      S(1) => \acc1[12]_i_4_n_0\,
      S(0) => \acc1[12]_i_5_n_0\
    );
\acc1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1_n_6\,
      Q => acc1_reg(13),
      R => '0'
    );
\acc1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1_n_5\,
      Q => acc1_reg(14),
      R => '0'
    );
\acc1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1_n_4\,
      Q => acc1_reg(15),
      R => '0'
    );
\acc1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1_n_7\,
      Q => acc1_reg(16),
      R => '0'
    );
\acc1_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[12]_i_1_n_0\,
      CO(3) => \acc1_reg[16]_i_1_n_0\,
      CO(2) => \acc1_reg[16]_i_1_n_1\,
      CO(1) => \acc1_reg[16]_i_1_n_2\,
      CO(0) => \acc1_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[16]_i_1_n_4\,
      O(2) => \acc1_reg[16]_i_1_n_5\,
      O(1) => \acc1_reg[16]_i_1_n_6\,
      O(0) => \acc1_reg[16]_i_1_n_7\,
      S(3) => \acc1[16]_i_2_n_0\,
      S(2) => \acc1[16]_i_3_n_0\,
      S(1) => \acc1[16]_i_4_n_0\,
      S(0) => \acc1[16]_i_5_n_0\
    );
\acc1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1_n_6\,
      Q => acc1_reg(17),
      R => '0'
    );
\acc1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1_n_5\,
      Q => acc1_reg(18),
      R => '0'
    );
\acc1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1_n_4\,
      Q => acc1_reg(19),
      R => '0'
    );
\acc1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1_n_6\,
      Q => acc1_reg(1),
      R => '0'
    );
\acc1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[20]_i_1_n_7\,
      Q => acc1_reg(20),
      R => '0'
    );
\acc1_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[16]_i_1_n_0\,
      CO(3 downto 1) => \NLW_acc1_reg[20]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \acc1_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_acc1_reg[20]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \acc1_reg[20]_i_1_n_6\,
      O(0) => \acc1_reg[20]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \acc1[20]_i_2_n_0\,
      S(0) => \acc1[20]_i_3_n_0\
    );
\acc1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[20]_i_1_n_6\,
      Q => acc1_reg(21),
      R => '0'
    );
\acc1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1_n_5\,
      Q => acc1_reg(2),
      R => '0'
    );
\acc1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1_n_4\,
      Q => acc1_reg(3),
      R => '0'
    );
\acc1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1_n_7\,
      Q => acc1_reg(4),
      R => '0'
    );
\acc1_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[0]_i_1_n_0\,
      CO(3) => \acc1_reg[4]_i_1_n_0\,
      CO(2) => \acc1_reg[4]_i_1_n_1\,
      CO(1) => \acc1_reg[4]_i_1_n_2\,
      CO(0) => \acc1_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[4]_i_1_n_4\,
      O(2) => \acc1_reg[4]_i_1_n_5\,
      O(1) => \acc1_reg[4]_i_1_n_6\,
      O(0) => \acc1_reg[4]_i_1_n_7\,
      S(3) => \acc1[4]_i_2_n_0\,
      S(2) => \acc1[4]_i_3_n_0\,
      S(1) => \acc1[4]_i_4_n_0\,
      S(0) => \acc1[4]_i_5_n_0\
    );
\acc1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1_n_6\,
      Q => acc1_reg(5),
      R => '0'
    );
\acc1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1_n_5\,
      Q => acc1_reg(6),
      R => '0'
    );
\acc1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1_n_4\,
      Q => acc1_reg(7),
      R => '0'
    );
\acc1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1_n_7\,
      Q => acc1_reg(8),
      R => '0'
    );
\acc1_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[4]_i_1_n_0\,
      CO(3) => \acc1_reg[8]_i_1_n_0\,
      CO(2) => \acc1_reg[8]_i_1_n_1\,
      CO(1) => \acc1_reg[8]_i_1_n_2\,
      CO(0) => \acc1_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[8]_i_1_n_4\,
      O(2) => \acc1_reg[8]_i_1_n_5\,
      O(1) => \acc1_reg[8]_i_1_n_6\,
      O(0) => \acc1_reg[8]_i_1_n_7\,
      S(3) => \acc1[8]_i_2_n_0\,
      S(2) => \acc1[8]_i_3_n_0\,
      S(1) => \acc1[8]_i_4_n_0\,
      S(0) => \acc1[8]_i_5_n_0\
    );
\acc1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1_n_6\,
      Q => acc1_reg(9),
      R => '0'
    );
\acc2[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(3),
      I1 => acc2_reg(3),
      O => \acc2[0]_i_2_n_0\
    );
\acc2[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(2),
      I1 => acc2_reg(2),
      O => \acc2[0]_i_3_n_0\
    );
\acc2[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(1),
      I1 => acc2_reg(1),
      O => \acc2[0]_i_4_n_0\
    );
\acc2[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(0),
      I1 => acc2_reg(0),
      O => \acc2[0]_i_5_n_0\
    );
\acc2[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(15),
      I1 => acc2_reg(15),
      O => \acc2[12]_i_2_n_0\
    );
\acc2[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(14),
      I1 => acc2_reg(14),
      O => \acc2[12]_i_3_n_0\
    );
\acc2[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(13),
      I1 => acc2_reg(13),
      O => \acc2[12]_i_4_n_0\
    );
\acc2[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(12),
      I1 => acc2_reg(12),
      O => \acc2[12]_i_5_n_0\
    );
\acc2[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(19),
      I1 => acc2_reg(19),
      O => \acc2[16]_i_2_n_0\
    );
\acc2[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(18),
      I1 => acc2_reg(18),
      O => \acc2[16]_i_3_n_0\
    );
\acc2[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(17),
      I1 => acc2_reg(17),
      O => \acc2[16]_i_4_n_0\
    );
\acc2[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(16),
      I1 => acc2_reg(16),
      O => \acc2[16]_i_5_n_0\
    );
\acc2[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(21),
      I1 => acc1_reg(21),
      O => \acc2[20]_i_2_n_0\
    );
\acc2[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(20),
      I1 => acc2_reg(20),
      O => \acc2[20]_i_3_n_0\
    );
\acc2[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(7),
      I1 => acc2_reg(7),
      O => \acc2[4]_i_2_n_0\
    );
\acc2[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(6),
      I1 => acc2_reg(6),
      O => \acc2[4]_i_3_n_0\
    );
\acc2[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(5),
      I1 => acc2_reg(5),
      O => \acc2[4]_i_4_n_0\
    );
\acc2[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(4),
      I1 => acc2_reg(4),
      O => \acc2[4]_i_5_n_0\
    );
\acc2[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(11),
      I1 => acc2_reg(11),
      O => \acc2[8]_i_2_n_0\
    );
\acc2[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(10),
      I1 => acc2_reg(10),
      O => \acc2[8]_i_3_n_0\
    );
\acc2[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(9),
      I1 => acc2_reg(9),
      O => \acc2[8]_i_4_n_0\
    );
\acc2[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(8),
      I1 => acc2_reg(8),
      O => \acc2[8]_i_5_n_0\
    );
\acc2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1_n_7\,
      Q => acc2_reg(0),
      R => '0'
    );
\acc2_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc2_reg[0]_i_1_n_0\,
      CO(2) => \acc2_reg[0]_i_1_n_1\,
      CO(1) => \acc2_reg[0]_i_1_n_2\,
      CO(0) => \acc2_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(3 downto 0),
      O(3) => \acc2_reg[0]_i_1_n_4\,
      O(2) => \acc2_reg[0]_i_1_n_5\,
      O(1) => \acc2_reg[0]_i_1_n_6\,
      O(0) => \acc2_reg[0]_i_1_n_7\,
      S(3) => \acc2[0]_i_2_n_0\,
      S(2) => \acc2[0]_i_3_n_0\,
      S(1) => \acc2[0]_i_4_n_0\,
      S(0) => \acc2[0]_i_5_n_0\
    );
\acc2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1_n_5\,
      Q => acc2_reg(10),
      R => '0'
    );
\acc2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1_n_4\,
      Q => acc2_reg(11),
      R => '0'
    );
\acc2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1_n_7\,
      Q => acc2_reg(12),
      R => '0'
    );
\acc2_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[8]_i_1_n_0\,
      CO(3) => \acc2_reg[12]_i_1_n_0\,
      CO(2) => \acc2_reg[12]_i_1_n_1\,
      CO(1) => \acc2_reg[12]_i_1_n_2\,
      CO(0) => \acc2_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(15 downto 12),
      O(3) => \acc2_reg[12]_i_1_n_4\,
      O(2) => \acc2_reg[12]_i_1_n_5\,
      O(1) => \acc2_reg[12]_i_1_n_6\,
      O(0) => \acc2_reg[12]_i_1_n_7\,
      S(3) => \acc2[12]_i_2_n_0\,
      S(2) => \acc2[12]_i_3_n_0\,
      S(1) => \acc2[12]_i_4_n_0\,
      S(0) => \acc2[12]_i_5_n_0\
    );
\acc2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1_n_6\,
      Q => acc2_reg(13),
      R => '0'
    );
\acc2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1_n_5\,
      Q => acc2_reg(14),
      R => '0'
    );
\acc2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1_n_4\,
      Q => acc2_reg(15),
      R => '0'
    );
\acc2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1_n_7\,
      Q => acc2_reg(16),
      R => '0'
    );
\acc2_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[12]_i_1_n_0\,
      CO(3) => \acc2_reg[16]_i_1_n_0\,
      CO(2) => \acc2_reg[16]_i_1_n_1\,
      CO(1) => \acc2_reg[16]_i_1_n_2\,
      CO(0) => \acc2_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(19 downto 16),
      O(3) => \acc2_reg[16]_i_1_n_4\,
      O(2) => \acc2_reg[16]_i_1_n_5\,
      O(1) => \acc2_reg[16]_i_1_n_6\,
      O(0) => \acc2_reg[16]_i_1_n_7\,
      S(3) => \acc2[16]_i_2_n_0\,
      S(2) => \acc2[16]_i_3_n_0\,
      S(1) => \acc2[16]_i_4_n_0\,
      S(0) => \acc2[16]_i_5_n_0\
    );
\acc2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1_n_6\,
      Q => acc2_reg(17),
      R => '0'
    );
\acc2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1_n_5\,
      Q => acc2_reg(18),
      R => '0'
    );
\acc2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1_n_4\,
      Q => acc2_reg(19),
      R => '0'
    );
\acc2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1_n_6\,
      Q => acc2_reg(1),
      R => '0'
    );
\acc2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[20]_i_1_n_7\,
      Q => acc2_reg(20),
      R => '0'
    );
\acc2_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[16]_i_1_n_0\,
      CO(3 downto 1) => \NLW_acc2_reg[20]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \acc2_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => acc1_reg(20),
      O(3 downto 2) => \NLW_acc2_reg[20]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \acc2_reg[20]_i_1_n_6\,
      O(0) => \acc2_reg[20]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \acc2[20]_i_2_n_0\,
      S(0) => \acc2[20]_i_3_n_0\
    );
\acc2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[20]_i_1_n_6\,
      Q => acc2_reg(21),
      R => '0'
    );
\acc2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1_n_5\,
      Q => acc2_reg(2),
      R => '0'
    );
\acc2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1_n_4\,
      Q => acc2_reg(3),
      R => '0'
    );
\acc2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1_n_7\,
      Q => acc2_reg(4),
      R => '0'
    );
\acc2_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[0]_i_1_n_0\,
      CO(3) => \acc2_reg[4]_i_1_n_0\,
      CO(2) => \acc2_reg[4]_i_1_n_1\,
      CO(1) => \acc2_reg[4]_i_1_n_2\,
      CO(0) => \acc2_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(7 downto 4),
      O(3) => \acc2_reg[4]_i_1_n_4\,
      O(2) => \acc2_reg[4]_i_1_n_5\,
      O(1) => \acc2_reg[4]_i_1_n_6\,
      O(0) => \acc2_reg[4]_i_1_n_7\,
      S(3) => \acc2[4]_i_2_n_0\,
      S(2) => \acc2[4]_i_3_n_0\,
      S(1) => \acc2[4]_i_4_n_0\,
      S(0) => \acc2[4]_i_5_n_0\
    );
\acc2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1_n_6\,
      Q => acc2_reg(5),
      R => '0'
    );
\acc2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1_n_5\,
      Q => acc2_reg(6),
      R => '0'
    );
\acc2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1_n_4\,
      Q => acc2_reg(7),
      R => '0'
    );
\acc2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1_n_7\,
      Q => acc2_reg(8),
      R => '0'
    );
\acc2_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[4]_i_1_n_0\,
      CO(3) => \acc2_reg[8]_i_1_n_0\,
      CO(2) => \acc2_reg[8]_i_1_n_1\,
      CO(1) => \acc2_reg[8]_i_1_n_2\,
      CO(0) => \acc2_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(11 downto 8),
      O(3) => \acc2_reg[8]_i_1_n_4\,
      O(2) => \acc2_reg[8]_i_1_n_5\,
      O(1) => \acc2_reg[8]_i_1_n_6\,
      O(0) => \acc2_reg[8]_i_1_n_7\,
      S(3) => \acc2[8]_i_2_n_0\,
      S(2) => \acc2[8]_i_3_n_0\,
      S(1) => \acc2[8]_i_4_n_0\,
      S(0) => \acc2[8]_i_5_n_0\
    );
\acc2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1_n_6\,
      Q => acc2_reg(9),
      R => '0'
    );
\acc3[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(3),
      I1 => acc3_reg(3),
      O => \acc3[0]_i_2_n_0\
    );
\acc3[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(2),
      I1 => acc3_reg(2),
      O => \acc3[0]_i_3_n_0\
    );
\acc3[0]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(1),
      I1 => acc3_reg(1),
      O => \acc3[0]_i_4_n_0\
    );
\acc3[0]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(0),
      I1 => acc3_reg(0),
      O => \acc3[0]_i_5_n_0\
    );
\acc3[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(15),
      I1 => acc3_reg(15),
      O => \acc3[12]_i_2_n_0\
    );
\acc3[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(14),
      I1 => acc3_reg(14),
      O => \acc3[12]_i_3_n_0\
    );
\acc3[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(13),
      I1 => acc3_reg(13),
      O => \acc3[12]_i_4_n_0\
    );
\acc3[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(12),
      I1 => acc3_reg(12),
      O => \acc3[12]_i_5_n_0\
    );
\acc3[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(19),
      I1 => acc3_reg(19),
      O => \acc3[16]_i_2_n_0\
    );
\acc3[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(18),
      I1 => acc3_reg(18),
      O => \acc3[16]_i_3_n_0\
    );
\acc3[16]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(17),
      I1 => acc3_reg(17),
      O => \acc3[16]_i_4_n_0\
    );
\acc3[16]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(16),
      I1 => acc3_reg(16),
      O => \acc3[16]_i_5_n_0\
    );
\acc3[20]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(21),
      I1 => acc3_reg(21),
      O => \acc3[20]_i_2_n_0\
    );
\acc3[20]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(20),
      I1 => acc3_reg(20),
      O => \acc3[20]_i_3_n_0\
    );
\acc3[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(7),
      I1 => acc3_reg(7),
      O => \acc3[4]_i_2_n_0\
    );
\acc3[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(6),
      I1 => acc3_reg(6),
      O => \acc3[4]_i_3_n_0\
    );
\acc3[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(5),
      I1 => acc3_reg(5),
      O => \acc3[4]_i_4_n_0\
    );
\acc3[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(4),
      I1 => acc3_reg(4),
      O => \acc3[4]_i_5_n_0\
    );
\acc3[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(11),
      I1 => acc3_reg(11),
      O => \acc3[8]_i_2_n_0\
    );
\acc3[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(10),
      I1 => acc3_reg(10),
      O => \acc3[8]_i_3_n_0\
    );
\acc3[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(9),
      I1 => acc3_reg(9),
      O => \acc3[8]_i_4_n_0\
    );
\acc3[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(8),
      I1 => acc3_reg(8),
      O => \acc3[8]_i_5_n_0\
    );
\acc3_d2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(0),
      Q => acc3_d2(0),
      R => '0'
    );
\acc3_d2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(10),
      Q => acc3_d2(10),
      R => '0'
    );
\acc3_d2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(11),
      Q => acc3_d2(11),
      R => '0'
    );
\acc3_d2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(12),
      Q => acc3_d2(12),
      R => '0'
    );
\acc3_d2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(13),
      Q => acc3_d2(13),
      R => '0'
    );
\acc3_d2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(14),
      Q => acc3_d2(14),
      R => '0'
    );
\acc3_d2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(15),
      Q => acc3_d2(15),
      R => '0'
    );
\acc3_d2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(16),
      Q => acc3_d2(16),
      R => '0'
    );
\acc3_d2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(17),
      Q => acc3_d2(17),
      R => '0'
    );
\acc3_d2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(18),
      Q => acc3_d2(18),
      R => '0'
    );
\acc3_d2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(19),
      Q => acc3_d2(19),
      R => '0'
    );
\acc3_d2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(1),
      Q => acc3_d2(1),
      R => '0'
    );
\acc3_d2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(20),
      Q => acc3_d2(20),
      R => '0'
    );
\acc3_d2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(21),
      Q => acc3_d2(21),
      R => '0'
    );
\acc3_d2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(2),
      Q => acc3_d2(2),
      R => '0'
    );
\acc3_d2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(3),
      Q => acc3_d2(3),
      R => '0'
    );
\acc3_d2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(4),
      Q => acc3_d2(4),
      R => '0'
    );
\acc3_d2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(5),
      Q => acc3_d2(5),
      R => '0'
    );
\acc3_d2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(6),
      Q => acc3_d2(6),
      R => '0'
    );
\acc3_d2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(7),
      Q => acc3_d2(7),
      R => '0'
    );
\acc3_d2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(8),
      Q => acc3_d2(8),
      R => '0'
    );
\acc3_d2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(9),
      Q => acc3_d2(9),
      R => '0'
    );
\acc3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1_n_7\,
      Q => acc3_reg(0),
      R => '0'
    );
\acc3_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc3_reg[0]_i_1_n_0\,
      CO(2) => \acc3_reg[0]_i_1_n_1\,
      CO(1) => \acc3_reg[0]_i_1_n_2\,
      CO(0) => \acc3_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(3 downto 0),
      O(3) => \acc3_reg[0]_i_1_n_4\,
      O(2) => \acc3_reg[0]_i_1_n_5\,
      O(1) => \acc3_reg[0]_i_1_n_6\,
      O(0) => \acc3_reg[0]_i_1_n_7\,
      S(3) => \acc3[0]_i_2_n_0\,
      S(2) => \acc3[0]_i_3_n_0\,
      S(1) => \acc3[0]_i_4_n_0\,
      S(0) => \acc3[0]_i_5_n_0\
    );
\acc3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1_n_5\,
      Q => acc3_reg(10),
      R => '0'
    );
\acc3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1_n_4\,
      Q => acc3_reg(11),
      R => '0'
    );
\acc3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1_n_7\,
      Q => acc3_reg(12),
      R => '0'
    );
\acc3_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[8]_i_1_n_0\,
      CO(3) => \acc3_reg[12]_i_1_n_0\,
      CO(2) => \acc3_reg[12]_i_1_n_1\,
      CO(1) => \acc3_reg[12]_i_1_n_2\,
      CO(0) => \acc3_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(15 downto 12),
      O(3) => \acc3_reg[12]_i_1_n_4\,
      O(2) => \acc3_reg[12]_i_1_n_5\,
      O(1) => \acc3_reg[12]_i_1_n_6\,
      O(0) => \acc3_reg[12]_i_1_n_7\,
      S(3) => \acc3[12]_i_2_n_0\,
      S(2) => \acc3[12]_i_3_n_0\,
      S(1) => \acc3[12]_i_4_n_0\,
      S(0) => \acc3[12]_i_5_n_0\
    );
\acc3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1_n_6\,
      Q => acc3_reg(13),
      R => '0'
    );
\acc3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1_n_5\,
      Q => acc3_reg(14),
      R => '0'
    );
\acc3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1_n_4\,
      Q => acc3_reg(15),
      R => '0'
    );
\acc3_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1_n_7\,
      Q => acc3_reg(16),
      R => '0'
    );
\acc3_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[12]_i_1_n_0\,
      CO(3) => \acc3_reg[16]_i_1_n_0\,
      CO(2) => \acc3_reg[16]_i_1_n_1\,
      CO(1) => \acc3_reg[16]_i_1_n_2\,
      CO(0) => \acc3_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(19 downto 16),
      O(3) => \acc3_reg[16]_i_1_n_4\,
      O(2) => \acc3_reg[16]_i_1_n_5\,
      O(1) => \acc3_reg[16]_i_1_n_6\,
      O(0) => \acc3_reg[16]_i_1_n_7\,
      S(3) => \acc3[16]_i_2_n_0\,
      S(2) => \acc3[16]_i_3_n_0\,
      S(1) => \acc3[16]_i_4_n_0\,
      S(0) => \acc3[16]_i_5_n_0\
    );
\acc3_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1_n_6\,
      Q => acc3_reg(17),
      R => '0'
    );
\acc3_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1_n_5\,
      Q => acc3_reg(18),
      R => '0'
    );
\acc3_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1_n_4\,
      Q => acc3_reg(19),
      R => '0'
    );
\acc3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1_n_6\,
      Q => acc3_reg(1),
      R => '0'
    );
\acc3_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[20]_i_1_n_7\,
      Q => acc3_reg(20),
      R => '0'
    );
\acc3_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[16]_i_1_n_0\,
      CO(3 downto 1) => \NLW_acc3_reg[20]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \acc3_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => acc2_reg(20),
      O(3 downto 2) => \NLW_acc3_reg[20]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \acc3_reg[20]_i_1_n_6\,
      O(0) => \acc3_reg[20]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \acc3[20]_i_2_n_0\,
      S(0) => \acc3[20]_i_3_n_0\
    );
\acc3_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[20]_i_1_n_6\,
      Q => acc3_reg(21),
      R => '0'
    );
\acc3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1_n_5\,
      Q => acc3_reg(2),
      R => '0'
    );
\acc3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1_n_4\,
      Q => acc3_reg(3),
      R => '0'
    );
\acc3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1_n_7\,
      Q => acc3_reg(4),
      R => '0'
    );
\acc3_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[0]_i_1_n_0\,
      CO(3) => \acc3_reg[4]_i_1_n_0\,
      CO(2) => \acc3_reg[4]_i_1_n_1\,
      CO(1) => \acc3_reg[4]_i_1_n_2\,
      CO(0) => \acc3_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(7 downto 4),
      O(3) => \acc3_reg[4]_i_1_n_4\,
      O(2) => \acc3_reg[4]_i_1_n_5\,
      O(1) => \acc3_reg[4]_i_1_n_6\,
      O(0) => \acc3_reg[4]_i_1_n_7\,
      S(3) => \acc3[4]_i_2_n_0\,
      S(2) => \acc3[4]_i_3_n_0\,
      S(1) => \acc3[4]_i_4_n_0\,
      S(0) => \acc3[4]_i_5_n_0\
    );
\acc3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1_n_6\,
      Q => acc3_reg(5),
      R => '0'
    );
\acc3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1_n_5\,
      Q => acc3_reg(6),
      R => '0'
    );
\acc3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1_n_4\,
      Q => acc3_reg(7),
      R => '0'
    );
\acc3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1_n_7\,
      Q => acc3_reg(8),
      R => '0'
    );
\acc3_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[4]_i_1_n_0\,
      CO(3) => \acc3_reg[8]_i_1_n_0\,
      CO(2) => \acc3_reg[8]_i_1_n_1\,
      CO(1) => \acc3_reg[8]_i_1_n_2\,
      CO(0) => \acc3_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(11 downto 8),
      O(3) => \acc3_reg[8]_i_1_n_4\,
      O(2) => \acc3_reg[8]_i_1_n_5\,
      O(1) => \acc3_reg[8]_i_1_n_6\,
      O(0) => \acc3_reg[8]_i_1_n_7\,
      S(3) => \acc3[8]_i_2_n_0\,
      S(2) => \acc3[8]_i_3_n_0\,
      S(1) => \acc3[8]_i_4_n_0\,
      S(0) => \acc3[8]_i_5_n_0\
    );
\acc3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1_n_6\,
      Q => acc3_reg(9),
      R => '0'
    );
\diff1[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(11),
      I1 => acc3_d2(11),
      O => \diff1[11]_i_2_n_0\
    );
\diff1[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(10),
      I1 => acc3_d2(10),
      O => \diff1[11]_i_3_n_0\
    );
\diff1[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(9),
      I1 => acc3_d2(9),
      O => \diff1[11]_i_4_n_0\
    );
\diff1[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(8),
      I1 => acc3_d2(8),
      O => \diff1[11]_i_5_n_0\
    );
\diff1[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(15),
      I1 => acc3_d2(15),
      O => \diff1[15]_i_2_n_0\
    );
\diff1[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(14),
      I1 => acc3_d2(14),
      O => \diff1[15]_i_3_n_0\
    );
\diff1[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(13),
      I1 => acc3_d2(13),
      O => \diff1[15]_i_4_n_0\
    );
\diff1[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(12),
      I1 => acc3_d2(12),
      O => \diff1[15]_i_5_n_0\
    );
\diff1[19]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(19),
      I1 => acc3_d2(19),
      O => \diff1[19]_i_2_n_0\
    );
\diff1[19]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(18),
      I1 => acc3_d2(18),
      O => \diff1[19]_i_3_n_0\
    );
\diff1[19]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(17),
      I1 => acc3_d2(17),
      O => \diff1[19]_i_4_n_0\
    );
\diff1[19]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(16),
      I1 => acc3_d2(16),
      O => \diff1[19]_i_5_n_0\
    );
\diff1[21]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(21),
      I1 => acc3_d2(21),
      O => \diff1[21]_i_2_n_0\
    );
\diff1[21]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(20),
      I1 => acc3_d2(20),
      O => \diff1[21]_i_3_n_0\
    );
\diff1[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(3),
      I1 => acc3_d2(3),
      O => \diff1[3]_i_2_n_0\
    );
\diff1[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(2),
      I1 => acc3_d2(2),
      O => \diff1[3]_i_3_n_0\
    );
\diff1[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(1),
      I1 => acc3_d2(1),
      O => \diff1[3]_i_4_n_0\
    );
\diff1[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(0),
      I1 => acc3_d2(0),
      O => \diff1[3]_i_5_n_0\
    );
\diff1[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(7),
      I1 => acc3_d2(7),
      O => \diff1[7]_i_2_n_0\
    );
\diff1[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(6),
      I1 => acc3_d2(6),
      O => \diff1[7]_i_3_n_0\
    );
\diff1[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(5),
      I1 => acc3_d2(5),
      O => \diff1[7]_i_4_n_0\
    );
\diff1[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(4),
      I1 => acc3_d2(4),
      O => \diff1[7]_i_5_n_0\
    );
\diff1_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(0),
      Q => diff1_d(0),
      R => '0'
    );
\diff1_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(10),
      Q => diff1_d(10),
      R => '0'
    );
\diff1_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(11),
      Q => diff1_d(11),
      R => '0'
    );
\diff1_d_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(12),
      Q => diff1_d(12),
      R => '0'
    );
\diff1_d_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(13),
      Q => diff1_d(13),
      R => '0'
    );
\diff1_d_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(14),
      Q => diff1_d(14),
      R => '0'
    );
\diff1_d_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(15),
      Q => diff1_d(15),
      R => '0'
    );
\diff1_d_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(16),
      Q => diff1_d(16),
      R => '0'
    );
\diff1_d_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(17),
      Q => diff1_d(17),
      R => '0'
    );
\diff1_d_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(18),
      Q => diff1_d(18),
      R => '0'
    );
\diff1_d_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(19),
      Q => diff1_d(19),
      R => '0'
    );
\diff1_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(1),
      Q => diff1_d(1),
      R => '0'
    );
\diff1_d_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(20),
      Q => diff1_d(20),
      R => '0'
    );
\diff1_d_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(21),
      Q => diff1_d(21),
      R => '0'
    );
\diff1_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(2),
      Q => diff1_d(2),
      R => '0'
    );
\diff1_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(3),
      Q => diff1_d(3),
      R => '0'
    );
\diff1_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(4),
      Q => diff1_d(4),
      R => '0'
    );
\diff1_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(5),
      Q => diff1_d(5),
      R => '0'
    );
\diff1_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(6),
      Q => diff1_d(6),
      R => '0'
    );
\diff1_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(7),
      Q => diff1_d(7),
      R => '0'
    );
\diff1_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(8),
      Q => diff1_d(8),
      R => '0'
    );
\diff1_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(9),
      Q => diff1_d(9),
      R => '0'
    );
\diff1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(0),
      Q => diff1(0),
      R => '0'
    );
\diff1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(10),
      Q => diff1(10),
      R => '0'
    );
\diff1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(11),
      Q => diff1(11),
      R => '0'
    );
\diff1_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[7]_i_1_n_0\,
      CO(3) => \diff1_reg[11]_i_1_n_0\,
      CO(2) => \diff1_reg[11]_i_1_n_1\,
      CO(1) => \diff1_reg[11]_i_1_n_2\,
      CO(0) => \diff1_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(11 downto 8),
      O(3 downto 0) => diff102_out(11 downto 8),
      S(3) => \diff1[11]_i_2_n_0\,
      S(2) => \diff1[11]_i_3_n_0\,
      S(1) => \diff1[11]_i_4_n_0\,
      S(0) => \diff1[11]_i_5_n_0\
    );
\diff1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(12),
      Q => diff1(12),
      R => '0'
    );
\diff1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(13),
      Q => diff1(13),
      R => '0'
    );
\diff1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(14),
      Q => diff1(14),
      R => '0'
    );
\diff1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(15),
      Q => diff1(15),
      R => '0'
    );
\diff1_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[11]_i_1_n_0\,
      CO(3) => \diff1_reg[15]_i_1_n_0\,
      CO(2) => \diff1_reg[15]_i_1_n_1\,
      CO(1) => \diff1_reg[15]_i_1_n_2\,
      CO(0) => \diff1_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(15 downto 12),
      O(3 downto 0) => diff102_out(15 downto 12),
      S(3) => \diff1[15]_i_2_n_0\,
      S(2) => \diff1[15]_i_3_n_0\,
      S(1) => \diff1[15]_i_4_n_0\,
      S(0) => \diff1[15]_i_5_n_0\
    );
\diff1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(16),
      Q => diff1(16),
      R => '0'
    );
\diff1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(17),
      Q => diff1(17),
      R => '0'
    );
\diff1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(18),
      Q => diff1(18),
      R => '0'
    );
\diff1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(19),
      Q => diff1(19),
      R => '0'
    );
\diff1_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[15]_i_1_n_0\,
      CO(3) => \diff1_reg[19]_i_1_n_0\,
      CO(2) => \diff1_reg[19]_i_1_n_1\,
      CO(1) => \diff1_reg[19]_i_1_n_2\,
      CO(0) => \diff1_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(19 downto 16),
      O(3 downto 0) => diff102_out(19 downto 16),
      S(3) => \diff1[19]_i_2_n_0\,
      S(2) => \diff1[19]_i_3_n_0\,
      S(1) => \diff1[19]_i_4_n_0\,
      S(0) => \diff1[19]_i_5_n_0\
    );
\diff1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(1),
      Q => diff1(1),
      R => '0'
    );
\diff1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(20),
      Q => diff1(20),
      R => '0'
    );
\diff1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(21),
      Q => diff1(21),
      R => '0'
    );
\diff1_reg[21]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[19]_i_1_n_0\,
      CO(3 downto 1) => \NLW_diff1_reg[21]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \diff1_reg[21]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => acc3_reg(20),
      O(3 downto 2) => \NLW_diff1_reg[21]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => diff102_out(21 downto 20),
      S(3 downto 2) => B"00",
      S(1) => \diff1[21]_i_2_n_0\,
      S(0) => \diff1[21]_i_3_n_0\
    );
\diff1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(2),
      Q => diff1(2),
      R => '0'
    );
\diff1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(3),
      Q => diff1(3),
      R => '0'
    );
\diff1_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \diff1_reg[3]_i_1_n_0\,
      CO(2) => \diff1_reg[3]_i_1_n_1\,
      CO(1) => \diff1_reg[3]_i_1_n_2\,
      CO(0) => \diff1_reg[3]_i_1_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => acc3_reg(3 downto 0),
      O(3 downto 0) => diff102_out(3 downto 0),
      S(3) => \diff1[3]_i_2_n_0\,
      S(2) => \diff1[3]_i_3_n_0\,
      S(1) => \diff1[3]_i_4_n_0\,
      S(0) => \diff1[3]_i_5_n_0\
    );
\diff1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(4),
      Q => diff1(4),
      R => '0'
    );
\diff1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(5),
      Q => diff1(5),
      R => '0'
    );
\diff1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(6),
      Q => diff1(6),
      R => '0'
    );
\diff1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(7),
      Q => diff1(7),
      R => '0'
    );
\diff1_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[3]_i_1_n_0\,
      CO(3) => \diff1_reg[7]_i_1_n_0\,
      CO(2) => \diff1_reg[7]_i_1_n_1\,
      CO(1) => \diff1_reg[7]_i_1_n_2\,
      CO(0) => \diff1_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(7 downto 4),
      O(3 downto 0) => diff102_out(7 downto 4),
      S(3) => \diff1[7]_i_2_n_0\,
      S(2) => \diff1[7]_i_3_n_0\,
      S(1) => \diff1[7]_i_4_n_0\,
      S(0) => \diff1[7]_i_5_n_0\
    );
\diff1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(8),
      Q => diff1(8),
      R => '0'
    );
\diff1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(9),
      Q => diff1(9),
      R => '0'
    );
\diff2[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(11),
      I1 => diff1_d(11),
      O => \diff2[11]_i_2_n_0\
    );
\diff2[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(10),
      I1 => diff1_d(10),
      O => \diff2[11]_i_3_n_0\
    );
\diff2[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(9),
      I1 => diff1_d(9),
      O => \diff2[11]_i_4_n_0\
    );
\diff2[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(8),
      I1 => diff1_d(8),
      O => \diff2[11]_i_5_n_0\
    );
\diff2[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(15),
      I1 => diff1_d(15),
      O => \diff2[15]_i_2_n_0\
    );
\diff2[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(14),
      I1 => diff1_d(14),
      O => \diff2[15]_i_3_n_0\
    );
\diff2[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(13),
      I1 => diff1_d(13),
      O => \diff2[15]_i_4_n_0\
    );
\diff2[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(12),
      I1 => diff1_d(12),
      O => \diff2[15]_i_5_n_0\
    );
\diff2[19]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(19),
      I1 => diff1_d(19),
      O => \diff2[19]_i_2_n_0\
    );
\diff2[19]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(18),
      I1 => diff1_d(18),
      O => \diff2[19]_i_3_n_0\
    );
\diff2[19]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(17),
      I1 => diff1_d(17),
      O => \diff2[19]_i_4_n_0\
    );
\diff2[19]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(16),
      I1 => diff1_d(16),
      O => \diff2[19]_i_5_n_0\
    );
\diff2[21]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(21),
      I1 => diff1_d(21),
      O => \diff2[21]_i_2_n_0\
    );
\diff2[21]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(20),
      I1 => diff1_d(20),
      O => \diff2[21]_i_3_n_0\
    );
\diff2[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(3),
      I1 => diff1_d(3),
      O => \diff2[3]_i_2_n_0\
    );
\diff2[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(2),
      I1 => diff1_d(2),
      O => \diff2[3]_i_3_n_0\
    );
\diff2[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(1),
      I1 => diff1_d(1),
      O => \diff2[3]_i_4_n_0\
    );
\diff2[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(0),
      I1 => diff1_d(0),
      O => \diff2[3]_i_5_n_0\
    );
\diff2[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(7),
      I1 => diff1_d(7),
      O => \diff2[7]_i_2_n_0\
    );
\diff2[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(6),
      I1 => diff1_d(6),
      O => \diff2[7]_i_3_n_0\
    );
\diff2[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(5),
      I1 => diff1_d(5),
      O => \diff2[7]_i_4_n_0\
    );
\diff2[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(4),
      I1 => diff1_d(4),
      O => \diff2[7]_i_5_n_0\
    );
\diff2_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(0),
      Q => diff2_d(0),
      R => '0'
    );
\diff2_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(10),
      Q => diff2_d(10),
      R => '0'
    );
\diff2_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(11),
      Q => diff2_d(11),
      R => '0'
    );
\diff2_d_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(12),
      Q => diff2_d(12),
      R => '0'
    );
\diff2_d_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(13),
      Q => diff2_d(13),
      R => '0'
    );
\diff2_d_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(14),
      Q => diff2_d(14),
      R => '0'
    );
\diff2_d_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(15),
      Q => diff2_d(15),
      R => '0'
    );
\diff2_d_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(16),
      Q => diff2_d(16),
      R => '0'
    );
\diff2_d_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(17),
      Q => diff2_d(17),
      R => '0'
    );
\diff2_d_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(18),
      Q => diff2_d(18),
      R => '0'
    );
\diff2_d_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(19),
      Q => diff2_d(19),
      R => '0'
    );
\diff2_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(1),
      Q => diff2_d(1),
      R => '0'
    );
\diff2_d_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(20),
      Q => diff2_d(20),
      R => '0'
    );
\diff2_d_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(21),
      Q => diff2_d(21),
      R => '0'
    );
\diff2_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(2),
      Q => diff2_d(2),
      R => '0'
    );
\diff2_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(3),
      Q => diff2_d(3),
      R => '0'
    );
\diff2_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(4),
      Q => diff2_d(4),
      R => '0'
    );
\diff2_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(5),
      Q => diff2_d(5),
      R => '0'
    );
\diff2_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(6),
      Q => diff2_d(6),
      R => '0'
    );
\diff2_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(7),
      Q => diff2_d(7),
      R => '0'
    );
\diff2_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(8),
      Q => diff2_d(8),
      R => '0'
    );
\diff2_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(9),
      Q => diff2_d(9),
      R => '0'
    );
\diff2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(0),
      Q => diff2(0),
      R => '0'
    );
\diff2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(10),
      Q => diff2(10),
      R => '0'
    );
\diff2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(11),
      Q => diff2(11),
      R => '0'
    );
\diff2_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[7]_i_1_n_0\,
      CO(3) => \diff2_reg[11]_i_1_n_0\,
      CO(2) => \diff2_reg[11]_i_1_n_1\,
      CO(1) => \diff2_reg[11]_i_1_n_2\,
      CO(0) => \diff2_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(11 downto 8),
      O(3 downto 0) => diff201_out(11 downto 8),
      S(3) => \diff2[11]_i_2_n_0\,
      S(2) => \diff2[11]_i_3_n_0\,
      S(1) => \diff2[11]_i_4_n_0\,
      S(0) => \diff2[11]_i_5_n_0\
    );
\diff2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(12),
      Q => diff2(12),
      R => '0'
    );
\diff2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(13),
      Q => diff2(13),
      R => '0'
    );
\diff2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(14),
      Q => diff2(14),
      R => '0'
    );
\diff2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(15),
      Q => diff2(15),
      R => '0'
    );
\diff2_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[11]_i_1_n_0\,
      CO(3) => \diff2_reg[15]_i_1_n_0\,
      CO(2) => \diff2_reg[15]_i_1_n_1\,
      CO(1) => \diff2_reg[15]_i_1_n_2\,
      CO(0) => \diff2_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(15 downto 12),
      O(3 downto 0) => diff201_out(15 downto 12),
      S(3) => \diff2[15]_i_2_n_0\,
      S(2) => \diff2[15]_i_3_n_0\,
      S(1) => \diff2[15]_i_4_n_0\,
      S(0) => \diff2[15]_i_5_n_0\
    );
\diff2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(16),
      Q => diff2(16),
      R => '0'
    );
\diff2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(17),
      Q => diff2(17),
      R => '0'
    );
\diff2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(18),
      Q => diff2(18),
      R => '0'
    );
\diff2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(19),
      Q => diff2(19),
      R => '0'
    );
\diff2_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[15]_i_1_n_0\,
      CO(3) => \diff2_reg[19]_i_1_n_0\,
      CO(2) => \diff2_reg[19]_i_1_n_1\,
      CO(1) => \diff2_reg[19]_i_1_n_2\,
      CO(0) => \diff2_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(19 downto 16),
      O(3 downto 0) => diff201_out(19 downto 16),
      S(3) => \diff2[19]_i_2_n_0\,
      S(2) => \diff2[19]_i_3_n_0\,
      S(1) => \diff2[19]_i_4_n_0\,
      S(0) => \diff2[19]_i_5_n_0\
    );
\diff2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(1),
      Q => diff2(1),
      R => '0'
    );
\diff2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(20),
      Q => diff2(20),
      R => '0'
    );
\diff2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(21),
      Q => diff2(21),
      R => '0'
    );
\diff2_reg[21]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[19]_i_1_n_0\,
      CO(3 downto 1) => \NLW_diff2_reg[21]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \diff2_reg[21]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => diff1(20),
      O(3 downto 2) => \NLW_diff2_reg[21]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => diff201_out(21 downto 20),
      S(3 downto 2) => B"00",
      S(1) => \diff2[21]_i_2_n_0\,
      S(0) => \diff2[21]_i_3_n_0\
    );
\diff2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(2),
      Q => diff2(2),
      R => '0'
    );
\diff2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(3),
      Q => diff2(3),
      R => '0'
    );
\diff2_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \diff2_reg[3]_i_1_n_0\,
      CO(2) => \diff2_reg[3]_i_1_n_1\,
      CO(1) => \diff2_reg[3]_i_1_n_2\,
      CO(0) => \diff2_reg[3]_i_1_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => diff1(3 downto 0),
      O(3 downto 0) => diff201_out(3 downto 0),
      S(3) => \diff2[3]_i_2_n_0\,
      S(2) => \diff2[3]_i_3_n_0\,
      S(1) => \diff2[3]_i_4_n_0\,
      S(0) => \diff2[3]_i_5_n_0\
    );
\diff2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(4),
      Q => diff2(4),
      R => '0'
    );
\diff2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(5),
      Q => diff2(5),
      R => '0'
    );
\diff2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(6),
      Q => diff2(6),
      R => '0'
    );
\diff2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(7),
      Q => diff2(7),
      R => '0'
    );
\diff2_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[3]_i_1_n_0\,
      CO(3) => \diff2_reg[7]_i_1_n_0\,
      CO(2) => \diff2_reg[7]_i_1_n_1\,
      CO(1) => \diff2_reg[7]_i_1_n_2\,
      CO(0) => \diff2_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(7 downto 4),
      O(3 downto 0) => diff201_out(7 downto 4),
      S(3) => \diff2[7]_i_2_n_0\,
      S(2) => \diff2[7]_i_3_n_0\,
      S(1) => \diff2[7]_i_4_n_0\,
      S(0) => \diff2[7]_i_5_n_0\
    );
\diff2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(8),
      Q => diff2(8),
      R => '0'
    );
\diff2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(9),
      Q => diff2(9),
      R => '0'
    );
\diff3[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(11),
      I1 => diff2_d(11),
      O => \diff3[11]_i_2_n_0\
    );
\diff3[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(10),
      I1 => diff2_d(10),
      O => \diff3[11]_i_3_n_0\
    );
\diff3[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(9),
      I1 => diff2_d(9),
      O => \diff3[11]_i_4_n_0\
    );
\diff3[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(8),
      I1 => diff2_d(8),
      O => \diff3[11]_i_5_n_0\
    );
\diff3[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(15),
      I1 => diff2_d(15),
      O => \diff3[15]_i_2_n_0\
    );
\diff3[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(14),
      I1 => diff2_d(14),
      O => \diff3[15]_i_3_n_0\
    );
\diff3[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(13),
      I1 => diff2_d(13),
      O => \diff3[15]_i_4_n_0\
    );
\diff3[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(12),
      I1 => diff2_d(12),
      O => \diff3[15]_i_5_n_0\
    );
\diff3[19]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(19),
      I1 => diff2_d(19),
      O => \diff3[19]_i_2_n_0\
    );
\diff3[19]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(18),
      I1 => diff2_d(18),
      O => \diff3[19]_i_3_n_0\
    );
\diff3[19]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(17),
      I1 => diff2_d(17),
      O => \diff3[19]_i_4_n_0\
    );
\diff3[19]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(16),
      I1 => diff2_d(16),
      O => \diff3[19]_i_5_n_0\
    );
\diff3[21]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(21),
      I1 => diff2_d(21),
      O => \diff3[21]_i_2_n_0\
    );
\diff3[21]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(20),
      I1 => diff2_d(20),
      O => \diff3[21]_i_3_n_0\
    );
\diff3[7]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(0),
      I1 => diff2_d(0),
      O => \diff3[7]_i_10_n_0\
    );
\diff3[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(7),
      I1 => diff2_d(7),
      O => \diff3[7]_i_3_n_0\
    );
\diff3[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(6),
      I1 => diff2_d(6),
      O => \diff3[7]_i_4_n_0\
    );
\diff3[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(5),
      I1 => diff2_d(5),
      O => \diff3[7]_i_5_n_0\
    );
\diff3[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(4),
      I1 => diff2_d(4),
      O => \diff3[7]_i_6_n_0\
    );
\diff3[7]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(3),
      I1 => diff2_d(3),
      O => \diff3[7]_i_7_n_0\
    );
\diff3[7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(2),
      I1 => diff2_d(2),
      O => \diff3[7]_i_8_n_0\
    );
\diff3[7]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(1),
      I1 => diff2_d(1),
      O => \diff3[7]_i_9_n_0\
    );
\diff3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(10),
      Q => data0(2),
      R => '0'
    );
\diff3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(11),
      Q => data0(3),
      R => '0'
    );
\diff3_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[7]_i_1_n_0\,
      CO(3) => \diff3_reg[11]_i_1_n_0\,
      CO(2) => \diff3_reg[11]_i_1_n_1\,
      CO(1) => \diff3_reg[11]_i_1_n_2\,
      CO(0) => \diff3_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(11 downto 8),
      O(3 downto 0) => diff300_out(11 downto 8),
      S(3) => \diff3[11]_i_2_n_0\,
      S(2) => \diff3[11]_i_3_n_0\,
      S(1) => \diff3[11]_i_4_n_0\,
      S(0) => \diff3[11]_i_5_n_0\
    );
\diff3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(12),
      Q => data0(4),
      R => '0'
    );
\diff3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(13),
      Q => data0(5),
      R => '0'
    );
\diff3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(14),
      Q => data0(6),
      R => '0'
    );
\diff3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(15),
      Q => data0(7),
      R => '0'
    );
\diff3_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[11]_i_1_n_0\,
      CO(3) => \diff3_reg[15]_i_1_n_0\,
      CO(2) => \diff3_reg[15]_i_1_n_1\,
      CO(1) => \diff3_reg[15]_i_1_n_2\,
      CO(0) => \diff3_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(15 downto 12),
      O(3 downto 0) => diff300_out(15 downto 12),
      S(3) => \diff3[15]_i_2_n_0\,
      S(2) => \diff3[15]_i_3_n_0\,
      S(1) => \diff3[15]_i_4_n_0\,
      S(0) => \diff3[15]_i_5_n_0\
    );
\diff3_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(16),
      Q => data0(8),
      R => '0'
    );
\diff3_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(17),
      Q => data0(9),
      R => '0'
    );
\diff3_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(18),
      Q => data0(10),
      R => '0'
    );
\diff3_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(19),
      Q => data0(11),
      R => '0'
    );
\diff3_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[15]_i_1_n_0\,
      CO(3) => \diff3_reg[19]_i_1_n_0\,
      CO(2) => \diff3_reg[19]_i_1_n_1\,
      CO(1) => \diff3_reg[19]_i_1_n_2\,
      CO(0) => \diff3_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(19 downto 16),
      O(3 downto 0) => diff300_out(19 downto 16),
      S(3) => \diff3[19]_i_2_n_0\,
      S(2) => \diff3[19]_i_3_n_0\,
      S(1) => \diff3[19]_i_4_n_0\,
      S(0) => \diff3[19]_i_5_n_0\
    );
\diff3_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(20),
      Q => data0(12),
      R => '0'
    );
\diff3_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(21),
      Q => data0(13),
      R => '0'
    );
\diff3_reg[21]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[19]_i_1_n_0\,
      CO(3 downto 1) => \NLW_diff3_reg[21]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \diff3_reg[21]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => diff2(20),
      O(3 downto 2) => \NLW_diff3_reg[21]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => diff300_out(21 downto 20),
      S(3 downto 2) => B"00",
      S(1) => \diff3[21]_i_2_n_0\,
      S(0) => \diff3[21]_i_3_n_0\
    );
\diff3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(5),
      Q => \diff3_reg_n_0_[5]\,
      R => '0'
    );
\diff3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(6),
      Q => \diff3_reg_n_0_[6]\,
      R => '0'
    );
\diff3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(7),
      Q => \diff3_reg_n_0_[7]\,
      R => '0'
    );
\diff3_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[7]_i_2_n_0\,
      CO(3) => \diff3_reg[7]_i_1_n_0\,
      CO(2) => \diff3_reg[7]_i_1_n_1\,
      CO(1) => \diff3_reg[7]_i_1_n_2\,
      CO(0) => \diff3_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(7 downto 4),
      O(3 downto 1) => diff300_out(7 downto 5),
      O(0) => \NLW_diff3_reg[7]_i_1_O_UNCONNECTED\(0),
      S(3) => \diff3[7]_i_3_n_0\,
      S(2) => \diff3[7]_i_4_n_0\,
      S(1) => \diff3[7]_i_5_n_0\,
      S(0) => \diff3[7]_i_6_n_0\
    );
\diff3_reg[7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \diff3_reg[7]_i_2_n_0\,
      CO(2) => \diff3_reg[7]_i_2_n_1\,
      CO(1) => \diff3_reg[7]_i_2_n_2\,
      CO(0) => \diff3_reg[7]_i_2_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => diff2(3 downto 0),
      O(3 downto 0) => \NLW_diff3_reg[7]_i_2_O_UNCONNECTED\(3 downto 0),
      S(3) => \diff3[7]_i_7_n_0\,
      S(2) => \diff3[7]_i_8_n_0\,
      S(1) => \diff3[7]_i_9_n_0\,
      S(0) => \diff3[7]_i_10_n_0\
    );
\diff3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(8),
      Q => data0(0),
      R => '0'
    );
\diff3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(9),
      Q => data0(1),
      R => '0'
    );
mdat_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => din(0),
      Q => mdat_i,
      R => '0'
    );
\signed_gen[0].ch_s_data[0][15]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ch_data[0]_0\(15),
      O => D(15)
    );
\tdata[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAABAA"
    )
        port map (
      I0 => \diff3_reg_n_0_[5]\,
      I1 => \tdata[0]_i_2_n_0\,
      I2 => \tdata[0]_i_3_n_0\,
      I3 => \tdata[0]_i_4_n_0\,
      I4 => \tdata[0]_i_5_n_0\,
      O => p_1_in(0)
    );
\tdata[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => data0(11),
      I1 => data0(10),
      I2 => data0(13),
      I3 => data0(12),
      O => \tdata[0]_i_2_n_0\
    );
\tdata[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => data0(1),
      I1 => \diff3_reg_n_0_[6]\,
      I2 => data0(3),
      I3 => data0(4),
      O => \tdata[0]_i_3_n_0\
    );
\tdata[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => data0(9),
      I1 => data0(6),
      I2 => data0(8),
      I3 => data0(7),
      O => \tdata[0]_i_4_n_0\
    );
\tdata[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => data0(0),
      I1 => \diff3_reg_n_0_[7]\,
      I2 => data0(2),
      I3 => data0(5),
      O => \tdata[0]_i_5_n_0\
    );
\tdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => \diff3_reg_n_0_[5]\,
      I1 => \tdata[0]_i_5_n_0\,
      I2 => \tdata[0]_i_4_n_0\,
      I3 => \tdata[0]_i_3_n_0\,
      I4 => \tdata[0]_i_2_n_0\,
      I5 => word_clk,
      O => \tdata[15]_i_1_n_0\
    );
\tdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => p_1_in(0),
      Q => D(0),
      R => '0'
    );
\tdata_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(7),
      Q => D(10),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(8),
      Q => D(11),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(9),
      Q => D(12),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(10),
      Q => D(13),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[14]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(11),
      Q => D(14),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[15]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(12),
      Q => \ch_data[0]_0\(15),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => \diff3_reg_n_0_[6]\,
      Q => D(1),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => \diff3_reg_n_0_[7]\,
      Q => D(2),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(0),
      Q => D(3),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(1),
      Q => D(4),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(2),
      Q => D(5),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(3),
      Q => D(6),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(4),
      Q => D(7),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(5),
      Q => D(8),
      S => \tdata[15]_i_1_n_0\
    );
\tdata_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(6),
      Q => D(9),
      S => \tdata[15]_i_1_n_0\
    );
tvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => word_clk,
      Q => update,
      R => '0'
    );
word_clk_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_count_reg(15),
      O => word_clk_i_3_n_0
    );
word_clk_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(13),
      I1 => word_count_reg(14),
      I2 => word_count_reg(12),
      O => word_clk_i_4_n_0
    );
word_clk_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(10),
      I1 => word_count_reg(11),
      I2 => word_count_reg(9),
      O => word_clk_i_5_n_0
    );
word_clk_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(6),
      I1 => word_count_reg(7),
      I2 => word_count_reg(8),
      O => word_clk_i_6_n_0
    );
word_clk_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(3),
      I1 => word_count_reg(4),
      I2 => word_count_reg(5),
      O => word_clk_i_7_n_0
    );
word_clk_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(1),
      I1 => word_count_reg(2),
      I2 => word_count_reg(0),
      O => word_clk_i_8_n_0
    );
word_clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => word_clk0,
      Q => word_clk,
      R => '0'
    );
word_clk_reg_i_1: unisim.vcomponents.CARRY4
     port map (
      CI => word_clk_reg_i_2_n_0,
      CO(3 downto 2) => NLW_word_clk_reg_i_1_CO_UNCONNECTED(3 downto 2),
      CO(1) => word_clk0,
      CO(0) => word_clk_reg_i_1_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_word_clk_reg_i_1_O_UNCONNECTED(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => word_clk_i_3_n_0,
      S(0) => word_clk_i_4_n_0
    );
word_clk_reg_i_2: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => word_clk_reg_i_2_n_0,
      CO(2) => word_clk_reg_i_2_n_1,
      CO(1) => word_clk_reg_i_2_n_2,
      CO(0) => word_clk_reg_i_2_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_word_clk_reg_i_2_O_UNCONNECTED(3 downto 0),
      S(3) => word_clk_i_5_n_0,
      S(2) => word_clk_i_6_n_0,
      S(1) => word_clk_i_7_n_0,
      S(0) => word_clk_i_8_n_0
    );
\word_count[0]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(10),
      I1 => word_count_reg(11),
      I2 => word_count_reg(9),
      O => \word_count[0]_i_10_n_0\
    );
\word_count[0]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => word_count_reg(6),
      I1 => word_count_reg(7),
      I2 => word_count_reg(8),
      O => \word_count[0]_i_11_n_0\
    );
\word_count[0]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(3),
      I1 => word_count_reg(4),
      I2 => word_count_reg(5),
      O => \word_count[0]_i_12_n_0\
    );
\word_count[0]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(1),
      I1 => word_count_reg(2),
      I2 => word_count_reg(0),
      O => \word_count[0]_i_13_n_0\
    );
\word_count[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_count_reg(15),
      O => \word_count[0]_i_4_n_0\
    );
\word_count[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(13),
      I1 => word_count_reg(14),
      I2 => word_count_reg(12),
      O => \word_count[0]_i_5_n_0\
    );
\word_count[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(3),
      O => \word_count[0]_i_6_n_0\
    );
\word_count[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(2),
      O => \word_count[0]_i_7_n_0\
    );
\word_count[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(1),
      O => \word_count[0]_i_8_n_0\
    );
\word_count[0]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_count_reg(0),
      O => \word_count[0]_i_9_n_0\
    );
\word_count[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(15),
      O => \word_count[12]_i_2_n_0\
    );
\word_count[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(14),
      O => \word_count[12]_i_3_n_0\
    );
\word_count[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(13),
      O => \word_count[12]_i_4_n_0\
    );
\word_count[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(12),
      O => \word_count[12]_i_5_n_0\
    );
\word_count[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(7),
      O => \word_count[4]_i_2_n_0\
    );
\word_count[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(6),
      O => \word_count[4]_i_3_n_0\
    );
\word_count[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(5),
      O => \word_count[4]_i_4_n_0\
    );
\word_count[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(4),
      O => \word_count[4]_i_5_n_0\
    );
\word_count[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(11),
      O => \word_count[8]_i_2_n_0\
    );
\word_count[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(10),
      O => \word_count[8]_i_3_n_0\
    );
\word_count[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(9),
      O => \word_count[8]_i_4_n_0\
    );
\word_count[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(8),
      O => \word_count[8]_i_5_n_0\
    );
\word_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2_n_7\,
      Q => word_count_reg(0),
      R => word_count0
    );
\word_count_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[0]_i_3_n_0\,
      CO(3 downto 2) => \NLW_word_count_reg[0]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => word_count0,
      CO(0) => \word_count_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_count_reg[0]_i_1_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \word_count[0]_i_4_n_0\,
      S(0) => \word_count[0]_i_5_n_0\
    );
\word_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \word_count_reg[0]_i_2_n_0\,
      CO(2) => \word_count_reg[0]_i_2_n_1\,
      CO(1) => \word_count_reg[0]_i_2_n_2\,
      CO(0) => \word_count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \word_count_reg[0]_i_2_n_4\,
      O(2) => \word_count_reg[0]_i_2_n_5\,
      O(1) => \word_count_reg[0]_i_2_n_6\,
      O(0) => \word_count_reg[0]_i_2_n_7\,
      S(3) => \word_count[0]_i_6_n_0\,
      S(2) => \word_count[0]_i_7_n_0\,
      S(1) => \word_count[0]_i_8_n_0\,
      S(0) => \word_count[0]_i_9_n_0\
    );
\word_count_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \word_count_reg[0]_i_3_n_0\,
      CO(2) => \word_count_reg[0]_i_3_n_1\,
      CO(1) => \word_count_reg[0]_i_3_n_2\,
      CO(0) => \word_count_reg[0]_i_3_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_count_reg[0]_i_3_O_UNCONNECTED\(3 downto 0),
      S(3) => \word_count[0]_i_10_n_0\,
      S(2) => \word_count[0]_i_11_n_0\,
      S(1) => \word_count[0]_i_12_n_0\,
      S(0) => \word_count[0]_i_13_n_0\
    );
\word_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1_n_5\,
      Q => word_count_reg(10),
      R => word_count0
    );
\word_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1_n_4\,
      Q => word_count_reg(11),
      R => word_count0
    );
\word_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1_n_7\,
      Q => word_count_reg(12),
      R => word_count0
    );
\word_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[8]_i_1_n_0\,
      CO(3) => \NLW_word_count_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \word_count_reg[12]_i_1_n_1\,
      CO(1) => \word_count_reg[12]_i_1_n_2\,
      CO(0) => \word_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_count_reg[12]_i_1_n_4\,
      O(2) => \word_count_reg[12]_i_1_n_5\,
      O(1) => \word_count_reg[12]_i_1_n_6\,
      O(0) => \word_count_reg[12]_i_1_n_7\,
      S(3) => \word_count[12]_i_2_n_0\,
      S(2) => \word_count[12]_i_3_n_0\,
      S(1) => \word_count[12]_i_4_n_0\,
      S(0) => \word_count[12]_i_5_n_0\
    );
\word_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1_n_6\,
      Q => word_count_reg(13),
      R => word_count0
    );
\word_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1_n_5\,
      Q => word_count_reg(14),
      R => word_count0
    );
\word_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1_n_4\,
      Q => word_count_reg(15),
      R => word_count0
    );
\word_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2_n_6\,
      Q => word_count_reg(1),
      R => word_count0
    );
\word_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2_n_5\,
      Q => word_count_reg(2),
      R => word_count0
    );
\word_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2_n_4\,
      Q => word_count_reg(3),
      R => word_count0
    );
\word_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1_n_7\,
      Q => word_count_reg(4),
      R => word_count0
    );
\word_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[0]_i_2_n_0\,
      CO(3) => \word_count_reg[4]_i_1_n_0\,
      CO(2) => \word_count_reg[4]_i_1_n_1\,
      CO(1) => \word_count_reg[4]_i_1_n_2\,
      CO(0) => \word_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_count_reg[4]_i_1_n_4\,
      O(2) => \word_count_reg[4]_i_1_n_5\,
      O(1) => \word_count_reg[4]_i_1_n_6\,
      O(0) => \word_count_reg[4]_i_1_n_7\,
      S(3) => \word_count[4]_i_2_n_0\,
      S(2) => \word_count[4]_i_3_n_0\,
      S(1) => \word_count[4]_i_4_n_0\,
      S(0) => \word_count[4]_i_5_n_0\
    );
\word_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1_n_6\,
      Q => word_count_reg(5),
      R => word_count0
    );
\word_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1_n_5\,
      Q => word_count_reg(6),
      R => word_count0
    );
\word_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1_n_4\,
      Q => word_count_reg(7),
      R => word_count0
    );
\word_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1_n_7\,
      Q => word_count_reg(8),
      R => word_count0
    );
\word_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[4]_i_1_n_0\,
      CO(3) => \word_count_reg[8]_i_1_n_0\,
      CO(2) => \word_count_reg[8]_i_1_n_1\,
      CO(1) => \word_count_reg[8]_i_1_n_2\,
      CO(0) => \word_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_count_reg[8]_i_1_n_4\,
      O(2) => \word_count_reg[8]_i_1_n_5\,
      O(1) => \word_count_reg[8]_i_1_n_6\,
      O(0) => \word_count_reg[8]_i_1_n_7\,
      S(3) => \word_count[8]_i_2_n_0\,
      S(2) => \word_count[8]_i_3_n_0\,
      S(1) => \word_count[8]_i_4_n_0\,
      S(0) => \word_count[8]_i_5_n_0\
    );
\word_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1_n_6\,
      Q => word_count_reg(9),
      R => word_count0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_AD7403_0_0_sinc3_0 is
  port (
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    din : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zsys_axis_AD7403_0_0_sinc3_0 : entity is "sinc3";
end zsys_axis_AD7403_0_0_sinc3_0;

architecture STRUCTURE of zsys_axis_AD7403_0_0_sinc3_0 is
  signal \acc1[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc1[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc1[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc1[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_5__0_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_5__0_n_0\ : STD_LOGIC;
  signal \acc1[20]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc1[20]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_5__0_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_5__0_n_0\ : STD_LOGIC;
  signal acc1_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \acc1_reg[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc1_reg[20]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc1_reg[20]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc1_reg[20]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc2[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc2[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc2[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc2[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_5__0_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_5__0_n_0\ : STD_LOGIC;
  signal \acc2[20]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc2[20]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_5__0_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_5__0_n_0\ : STD_LOGIC;
  signal acc2_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \acc2_reg[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc2_reg[20]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc2_reg[20]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc2_reg[20]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc3[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc3[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc3[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc3[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_5__0_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_5__0_n_0\ : STD_LOGIC;
  signal \acc3[20]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc3[20]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_5__0_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_2__0_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_3__0_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_4__0_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_5__0_n_0\ : STD_LOGIC;
  signal acc3_d2 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal acc3_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \acc3_reg[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc3_reg[20]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc3_reg[20]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc3_reg[20]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \ch_data[1]_1\ : STD_LOGIC_VECTOR ( 15 to 15 );
  signal data0 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal diff1 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal diff102_out : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff1[11]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff1[11]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff1[11]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff1[11]_i_5__0_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_5__0_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_5__0_n_0\ : STD_LOGIC;
  signal \diff1[21]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff1[21]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_5__0_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_5__0_n_0\ : STD_LOGIC;
  signal diff1_d : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff1_reg[11]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff1_reg[11]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff1_reg[11]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff1_reg[11]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff1_reg[21]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1__0_n_3\ : STD_LOGIC;
  signal diff2 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal diff201_out : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff2[11]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff2[11]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff2[11]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff2[11]_i_5__0_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_5__0_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_5__0_n_0\ : STD_LOGIC;
  signal \diff2[21]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff2[21]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_5__0_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_5__0_n_0\ : STD_LOGIC;
  signal diff2_d : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff2_reg[11]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff2_reg[11]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff2_reg[11]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff2_reg[11]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff2_reg[21]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1__0_n_3\ : STD_LOGIC;
  signal diff300_out : STD_LOGIC_VECTOR ( 21 downto 5 );
  signal \diff3[11]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff3[11]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff3[11]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff3[11]_i_5__0_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_5__0_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_5__0_n_0\ : STD_LOGIC;
  signal \diff3[21]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff3[21]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_10__0_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_3__0_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_4__0_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_5__0_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_6__0_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_7__0_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_8__0_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_9__0_n_0\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff3_reg[21]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1__0_n_1\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1__0_n_2\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1__0_n_3\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2__0_n_1\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2__0_n_2\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2__0_n_3\ : STD_LOGIC;
  signal \diff3_reg_n_0_[5]\ : STD_LOGIC;
  signal \diff3_reg_n_0_[6]\ : STD_LOGIC;
  signal \diff3_reg_n_0_[7]\ : STD_LOGIC;
  signal mdat_i : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \tdata[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \tdata[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \tdata[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \tdata[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \tdata[15]_i_1__0_n_0\ : STD_LOGIC;
  signal word_clk : STD_LOGIC;
  signal word_clk0 : STD_LOGIC;
  signal \word_clk_i_3__0_n_0\ : STD_LOGIC;
  signal \word_clk_i_4__0_n_0\ : STD_LOGIC;
  signal \word_clk_i_5__0_n_0\ : STD_LOGIC;
  signal \word_clk_i_6__0_n_0\ : STD_LOGIC;
  signal \word_clk_i_7__0_n_0\ : STD_LOGIC;
  signal \word_clk_i_8__0_n_0\ : STD_LOGIC;
  signal \word_clk_reg_i_1__0_n_3\ : STD_LOGIC;
  signal \word_clk_reg_i_2__0_n_0\ : STD_LOGIC;
  signal \word_clk_reg_i_2__0_n_1\ : STD_LOGIC;
  signal \word_clk_reg_i_2__0_n_2\ : STD_LOGIC;
  signal \word_clk_reg_i_2__0_n_3\ : STD_LOGIC;
  signal word_count0 : STD_LOGIC;
  signal \word_count[0]_i_10__0_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_11__0_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_12__0_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_13__0_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_4__0_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_5__0_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_6__0_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_7__0_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_8__0_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_9__0_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_2__0_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_3__0_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_4__0_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_5__0_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_4__0_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_5__0_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_2__0_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_3__0_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_4__0_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_5__0_n_0\ : STD_LOGIC;
  signal word_count_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \word_count_reg[0]_i_1__0_n_3\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__0_n_1\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__0_n_2\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__0_n_3\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__0_n_4\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__0_n_5\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__0_n_6\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__0_n_7\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3__0_n_0\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3__0_n_1\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3__0_n_2\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3__0_n_3\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__0_n_1\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__0_n_2\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__0_n_3\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__0_n_4\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__0_n_5\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__0_n_6\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__0_n_7\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__0_n_1\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__0_n_2\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__0_n_3\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__0_n_4\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__0_n_5\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__0_n_6\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__0_n_7\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__0_n_1\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__0_n_2\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__0_n_3\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__0_n_4\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__0_n_5\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__0_n_6\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__0_n_7\ : STD_LOGIC;
  signal \NLW_acc1_reg[20]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_acc1_reg[20]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_acc2_reg[20]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_acc2_reg[20]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_acc3_reg[20]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_acc3_reg[20]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff1_reg[21]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_diff1_reg[21]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff2_reg[21]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_diff2_reg[21]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff3_reg[21]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_diff3_reg[21]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff3_reg[7]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_diff3_reg[7]_i_2__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_clk_reg_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_word_clk_reg_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_clk_reg_i_2__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_count_reg[0]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_word_count_reg[0]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_count_reg[0]_i_3__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_count_reg[12]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
\acc1[0]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(3),
      O => \acc1[0]_i_2__0_n_0\
    );
\acc1[0]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(2),
      O => \acc1[0]_i_3__0_n_0\
    );
\acc1[0]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(1),
      O => \acc1[0]_i_4__0_n_0\
    );
\acc1[0]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => acc1_reg(0),
      O => \acc1[0]_i_5__0_n_0\
    );
\acc1[12]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(15),
      O => \acc1[12]_i_2__0_n_0\
    );
\acc1[12]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(14),
      O => \acc1[12]_i_3__0_n_0\
    );
\acc1[12]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(13),
      O => \acc1[12]_i_4__0_n_0\
    );
\acc1[12]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(12),
      O => \acc1[12]_i_5__0_n_0\
    );
\acc1[16]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(19),
      O => \acc1[16]_i_2__0_n_0\
    );
\acc1[16]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(18),
      O => \acc1[16]_i_3__0_n_0\
    );
\acc1[16]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(17),
      O => \acc1[16]_i_4__0_n_0\
    );
\acc1[16]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(16),
      O => \acc1[16]_i_5__0_n_0\
    );
\acc1[20]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(21),
      O => \acc1[20]_i_2__0_n_0\
    );
\acc1[20]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(20),
      O => \acc1[20]_i_3__0_n_0\
    );
\acc1[4]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(7),
      O => \acc1[4]_i_2__0_n_0\
    );
\acc1[4]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(6),
      O => \acc1[4]_i_3__0_n_0\
    );
\acc1[4]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(5),
      O => \acc1[4]_i_4__0_n_0\
    );
\acc1[4]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(4),
      O => \acc1[4]_i_5__0_n_0\
    );
\acc1[8]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(11),
      O => \acc1[8]_i_2__0_n_0\
    );
\acc1[8]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(10),
      O => \acc1[8]_i_3__0_n_0\
    );
\acc1[8]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(9),
      O => \acc1[8]_i_4__0_n_0\
    );
\acc1[8]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(8),
      O => \acc1[8]_i_5__0_n_0\
    );
\acc1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1__0_n_7\,
      Q => acc1_reg(0),
      R => '0'
    );
\acc1_reg[0]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc1_reg[0]_i_1__0_n_0\,
      CO(2) => \acc1_reg[0]_i_1__0_n_1\,
      CO(1) => \acc1_reg[0]_i_1__0_n_2\,
      CO(0) => \acc1_reg[0]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \acc1_reg[0]_i_1__0_n_4\,
      O(2) => \acc1_reg[0]_i_1__0_n_5\,
      O(1) => \acc1_reg[0]_i_1__0_n_6\,
      O(0) => \acc1_reg[0]_i_1__0_n_7\,
      S(3) => \acc1[0]_i_2__0_n_0\,
      S(2) => \acc1[0]_i_3__0_n_0\,
      S(1) => \acc1[0]_i_4__0_n_0\,
      S(0) => \acc1[0]_i_5__0_n_0\
    );
\acc1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1__0_n_5\,
      Q => acc1_reg(10),
      R => '0'
    );
\acc1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1__0_n_4\,
      Q => acc1_reg(11),
      R => '0'
    );
\acc1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1__0_n_7\,
      Q => acc1_reg(12),
      R => '0'
    );
\acc1_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[8]_i_1__0_n_0\,
      CO(3) => \acc1_reg[12]_i_1__0_n_0\,
      CO(2) => \acc1_reg[12]_i_1__0_n_1\,
      CO(1) => \acc1_reg[12]_i_1__0_n_2\,
      CO(0) => \acc1_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[12]_i_1__0_n_4\,
      O(2) => \acc1_reg[12]_i_1__0_n_5\,
      O(1) => \acc1_reg[12]_i_1__0_n_6\,
      O(0) => \acc1_reg[12]_i_1__0_n_7\,
      S(3) => \acc1[12]_i_2__0_n_0\,
      S(2) => \acc1[12]_i_3__0_n_0\,
      S(1) => \acc1[12]_i_4__0_n_0\,
      S(0) => \acc1[12]_i_5__0_n_0\
    );
\acc1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1__0_n_6\,
      Q => acc1_reg(13),
      R => '0'
    );
\acc1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1__0_n_5\,
      Q => acc1_reg(14),
      R => '0'
    );
\acc1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1__0_n_4\,
      Q => acc1_reg(15),
      R => '0'
    );
\acc1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1__0_n_7\,
      Q => acc1_reg(16),
      R => '0'
    );
\acc1_reg[16]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[12]_i_1__0_n_0\,
      CO(3) => \acc1_reg[16]_i_1__0_n_0\,
      CO(2) => \acc1_reg[16]_i_1__0_n_1\,
      CO(1) => \acc1_reg[16]_i_1__0_n_2\,
      CO(0) => \acc1_reg[16]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[16]_i_1__0_n_4\,
      O(2) => \acc1_reg[16]_i_1__0_n_5\,
      O(1) => \acc1_reg[16]_i_1__0_n_6\,
      O(0) => \acc1_reg[16]_i_1__0_n_7\,
      S(3) => \acc1[16]_i_2__0_n_0\,
      S(2) => \acc1[16]_i_3__0_n_0\,
      S(1) => \acc1[16]_i_4__0_n_0\,
      S(0) => \acc1[16]_i_5__0_n_0\
    );
\acc1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1__0_n_6\,
      Q => acc1_reg(17),
      R => '0'
    );
\acc1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1__0_n_5\,
      Q => acc1_reg(18),
      R => '0'
    );
\acc1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1__0_n_4\,
      Q => acc1_reg(19),
      R => '0'
    );
\acc1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1__0_n_6\,
      Q => acc1_reg(1),
      R => '0'
    );
\acc1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[20]_i_1__0_n_7\,
      Q => acc1_reg(20),
      R => '0'
    );
\acc1_reg[20]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[16]_i_1__0_n_0\,
      CO(3 downto 1) => \NLW_acc1_reg[20]_i_1__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \acc1_reg[20]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_acc1_reg[20]_i_1__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \acc1_reg[20]_i_1__0_n_6\,
      O(0) => \acc1_reg[20]_i_1__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \acc1[20]_i_2__0_n_0\,
      S(0) => \acc1[20]_i_3__0_n_0\
    );
\acc1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[20]_i_1__0_n_6\,
      Q => acc1_reg(21),
      R => '0'
    );
\acc1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1__0_n_5\,
      Q => acc1_reg(2),
      R => '0'
    );
\acc1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1__0_n_4\,
      Q => acc1_reg(3),
      R => '0'
    );
\acc1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1__0_n_7\,
      Q => acc1_reg(4),
      R => '0'
    );
\acc1_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[0]_i_1__0_n_0\,
      CO(3) => \acc1_reg[4]_i_1__0_n_0\,
      CO(2) => \acc1_reg[4]_i_1__0_n_1\,
      CO(1) => \acc1_reg[4]_i_1__0_n_2\,
      CO(0) => \acc1_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[4]_i_1__0_n_4\,
      O(2) => \acc1_reg[4]_i_1__0_n_5\,
      O(1) => \acc1_reg[4]_i_1__0_n_6\,
      O(0) => \acc1_reg[4]_i_1__0_n_7\,
      S(3) => \acc1[4]_i_2__0_n_0\,
      S(2) => \acc1[4]_i_3__0_n_0\,
      S(1) => \acc1[4]_i_4__0_n_0\,
      S(0) => \acc1[4]_i_5__0_n_0\
    );
\acc1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1__0_n_6\,
      Q => acc1_reg(5),
      R => '0'
    );
\acc1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1__0_n_5\,
      Q => acc1_reg(6),
      R => '0'
    );
\acc1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1__0_n_4\,
      Q => acc1_reg(7),
      R => '0'
    );
\acc1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1__0_n_7\,
      Q => acc1_reg(8),
      R => '0'
    );
\acc1_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[4]_i_1__0_n_0\,
      CO(3) => \acc1_reg[8]_i_1__0_n_0\,
      CO(2) => \acc1_reg[8]_i_1__0_n_1\,
      CO(1) => \acc1_reg[8]_i_1__0_n_2\,
      CO(0) => \acc1_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[8]_i_1__0_n_4\,
      O(2) => \acc1_reg[8]_i_1__0_n_5\,
      O(1) => \acc1_reg[8]_i_1__0_n_6\,
      O(0) => \acc1_reg[8]_i_1__0_n_7\,
      S(3) => \acc1[8]_i_2__0_n_0\,
      S(2) => \acc1[8]_i_3__0_n_0\,
      S(1) => \acc1[8]_i_4__0_n_0\,
      S(0) => \acc1[8]_i_5__0_n_0\
    );
\acc1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1__0_n_6\,
      Q => acc1_reg(9),
      R => '0'
    );
\acc2[0]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(3),
      I1 => acc2_reg(3),
      O => \acc2[0]_i_2__0_n_0\
    );
\acc2[0]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(2),
      I1 => acc2_reg(2),
      O => \acc2[0]_i_3__0_n_0\
    );
\acc2[0]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(1),
      I1 => acc2_reg(1),
      O => \acc2[0]_i_4__0_n_0\
    );
\acc2[0]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(0),
      I1 => acc2_reg(0),
      O => \acc2[0]_i_5__0_n_0\
    );
\acc2[12]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(15),
      I1 => acc2_reg(15),
      O => \acc2[12]_i_2__0_n_0\
    );
\acc2[12]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(14),
      I1 => acc2_reg(14),
      O => \acc2[12]_i_3__0_n_0\
    );
\acc2[12]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(13),
      I1 => acc2_reg(13),
      O => \acc2[12]_i_4__0_n_0\
    );
\acc2[12]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(12),
      I1 => acc2_reg(12),
      O => \acc2[12]_i_5__0_n_0\
    );
\acc2[16]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(19),
      I1 => acc2_reg(19),
      O => \acc2[16]_i_2__0_n_0\
    );
\acc2[16]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(18),
      I1 => acc2_reg(18),
      O => \acc2[16]_i_3__0_n_0\
    );
\acc2[16]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(17),
      I1 => acc2_reg(17),
      O => \acc2[16]_i_4__0_n_0\
    );
\acc2[16]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(16),
      I1 => acc2_reg(16),
      O => \acc2[16]_i_5__0_n_0\
    );
\acc2[20]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(21),
      I1 => acc1_reg(21),
      O => \acc2[20]_i_2__0_n_0\
    );
\acc2[20]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(20),
      I1 => acc2_reg(20),
      O => \acc2[20]_i_3__0_n_0\
    );
\acc2[4]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(7),
      I1 => acc2_reg(7),
      O => \acc2[4]_i_2__0_n_0\
    );
\acc2[4]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(6),
      I1 => acc2_reg(6),
      O => \acc2[4]_i_3__0_n_0\
    );
\acc2[4]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(5),
      I1 => acc2_reg(5),
      O => \acc2[4]_i_4__0_n_0\
    );
\acc2[4]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(4),
      I1 => acc2_reg(4),
      O => \acc2[4]_i_5__0_n_0\
    );
\acc2[8]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(11),
      I1 => acc2_reg(11),
      O => \acc2[8]_i_2__0_n_0\
    );
\acc2[8]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(10),
      I1 => acc2_reg(10),
      O => \acc2[8]_i_3__0_n_0\
    );
\acc2[8]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(9),
      I1 => acc2_reg(9),
      O => \acc2[8]_i_4__0_n_0\
    );
\acc2[8]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(8),
      I1 => acc2_reg(8),
      O => \acc2[8]_i_5__0_n_0\
    );
\acc2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1__0_n_7\,
      Q => acc2_reg(0),
      R => '0'
    );
\acc2_reg[0]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc2_reg[0]_i_1__0_n_0\,
      CO(2) => \acc2_reg[0]_i_1__0_n_1\,
      CO(1) => \acc2_reg[0]_i_1__0_n_2\,
      CO(0) => \acc2_reg[0]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(3 downto 0),
      O(3) => \acc2_reg[0]_i_1__0_n_4\,
      O(2) => \acc2_reg[0]_i_1__0_n_5\,
      O(1) => \acc2_reg[0]_i_1__0_n_6\,
      O(0) => \acc2_reg[0]_i_1__0_n_7\,
      S(3) => \acc2[0]_i_2__0_n_0\,
      S(2) => \acc2[0]_i_3__0_n_0\,
      S(1) => \acc2[0]_i_4__0_n_0\,
      S(0) => \acc2[0]_i_5__0_n_0\
    );
\acc2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1__0_n_5\,
      Q => acc2_reg(10),
      R => '0'
    );
\acc2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1__0_n_4\,
      Q => acc2_reg(11),
      R => '0'
    );
\acc2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1__0_n_7\,
      Q => acc2_reg(12),
      R => '0'
    );
\acc2_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[8]_i_1__0_n_0\,
      CO(3) => \acc2_reg[12]_i_1__0_n_0\,
      CO(2) => \acc2_reg[12]_i_1__0_n_1\,
      CO(1) => \acc2_reg[12]_i_1__0_n_2\,
      CO(0) => \acc2_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(15 downto 12),
      O(3) => \acc2_reg[12]_i_1__0_n_4\,
      O(2) => \acc2_reg[12]_i_1__0_n_5\,
      O(1) => \acc2_reg[12]_i_1__0_n_6\,
      O(0) => \acc2_reg[12]_i_1__0_n_7\,
      S(3) => \acc2[12]_i_2__0_n_0\,
      S(2) => \acc2[12]_i_3__0_n_0\,
      S(1) => \acc2[12]_i_4__0_n_0\,
      S(0) => \acc2[12]_i_5__0_n_0\
    );
\acc2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1__0_n_6\,
      Q => acc2_reg(13),
      R => '0'
    );
\acc2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1__0_n_5\,
      Q => acc2_reg(14),
      R => '0'
    );
\acc2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1__0_n_4\,
      Q => acc2_reg(15),
      R => '0'
    );
\acc2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1__0_n_7\,
      Q => acc2_reg(16),
      R => '0'
    );
\acc2_reg[16]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[12]_i_1__0_n_0\,
      CO(3) => \acc2_reg[16]_i_1__0_n_0\,
      CO(2) => \acc2_reg[16]_i_1__0_n_1\,
      CO(1) => \acc2_reg[16]_i_1__0_n_2\,
      CO(0) => \acc2_reg[16]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(19 downto 16),
      O(3) => \acc2_reg[16]_i_1__0_n_4\,
      O(2) => \acc2_reg[16]_i_1__0_n_5\,
      O(1) => \acc2_reg[16]_i_1__0_n_6\,
      O(0) => \acc2_reg[16]_i_1__0_n_7\,
      S(3) => \acc2[16]_i_2__0_n_0\,
      S(2) => \acc2[16]_i_3__0_n_0\,
      S(1) => \acc2[16]_i_4__0_n_0\,
      S(0) => \acc2[16]_i_5__0_n_0\
    );
\acc2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1__0_n_6\,
      Q => acc2_reg(17),
      R => '0'
    );
\acc2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1__0_n_5\,
      Q => acc2_reg(18),
      R => '0'
    );
\acc2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1__0_n_4\,
      Q => acc2_reg(19),
      R => '0'
    );
\acc2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1__0_n_6\,
      Q => acc2_reg(1),
      R => '0'
    );
\acc2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[20]_i_1__0_n_7\,
      Q => acc2_reg(20),
      R => '0'
    );
\acc2_reg[20]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[16]_i_1__0_n_0\,
      CO(3 downto 1) => \NLW_acc2_reg[20]_i_1__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \acc2_reg[20]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => acc1_reg(20),
      O(3 downto 2) => \NLW_acc2_reg[20]_i_1__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \acc2_reg[20]_i_1__0_n_6\,
      O(0) => \acc2_reg[20]_i_1__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \acc2[20]_i_2__0_n_0\,
      S(0) => \acc2[20]_i_3__0_n_0\
    );
\acc2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[20]_i_1__0_n_6\,
      Q => acc2_reg(21),
      R => '0'
    );
\acc2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1__0_n_5\,
      Q => acc2_reg(2),
      R => '0'
    );
\acc2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1__0_n_4\,
      Q => acc2_reg(3),
      R => '0'
    );
\acc2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1__0_n_7\,
      Q => acc2_reg(4),
      R => '0'
    );
\acc2_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[0]_i_1__0_n_0\,
      CO(3) => \acc2_reg[4]_i_1__0_n_0\,
      CO(2) => \acc2_reg[4]_i_1__0_n_1\,
      CO(1) => \acc2_reg[4]_i_1__0_n_2\,
      CO(0) => \acc2_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(7 downto 4),
      O(3) => \acc2_reg[4]_i_1__0_n_4\,
      O(2) => \acc2_reg[4]_i_1__0_n_5\,
      O(1) => \acc2_reg[4]_i_1__0_n_6\,
      O(0) => \acc2_reg[4]_i_1__0_n_7\,
      S(3) => \acc2[4]_i_2__0_n_0\,
      S(2) => \acc2[4]_i_3__0_n_0\,
      S(1) => \acc2[4]_i_4__0_n_0\,
      S(0) => \acc2[4]_i_5__0_n_0\
    );
\acc2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1__0_n_6\,
      Q => acc2_reg(5),
      R => '0'
    );
\acc2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1__0_n_5\,
      Q => acc2_reg(6),
      R => '0'
    );
\acc2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1__0_n_4\,
      Q => acc2_reg(7),
      R => '0'
    );
\acc2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1__0_n_7\,
      Q => acc2_reg(8),
      R => '0'
    );
\acc2_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[4]_i_1__0_n_0\,
      CO(3) => \acc2_reg[8]_i_1__0_n_0\,
      CO(2) => \acc2_reg[8]_i_1__0_n_1\,
      CO(1) => \acc2_reg[8]_i_1__0_n_2\,
      CO(0) => \acc2_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(11 downto 8),
      O(3) => \acc2_reg[8]_i_1__0_n_4\,
      O(2) => \acc2_reg[8]_i_1__0_n_5\,
      O(1) => \acc2_reg[8]_i_1__0_n_6\,
      O(0) => \acc2_reg[8]_i_1__0_n_7\,
      S(3) => \acc2[8]_i_2__0_n_0\,
      S(2) => \acc2[8]_i_3__0_n_0\,
      S(1) => \acc2[8]_i_4__0_n_0\,
      S(0) => \acc2[8]_i_5__0_n_0\
    );
\acc2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1__0_n_6\,
      Q => acc2_reg(9),
      R => '0'
    );
\acc3[0]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(3),
      I1 => acc3_reg(3),
      O => \acc3[0]_i_2__0_n_0\
    );
\acc3[0]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(2),
      I1 => acc3_reg(2),
      O => \acc3[0]_i_3__0_n_0\
    );
\acc3[0]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(1),
      I1 => acc3_reg(1),
      O => \acc3[0]_i_4__0_n_0\
    );
\acc3[0]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(0),
      I1 => acc3_reg(0),
      O => \acc3[0]_i_5__0_n_0\
    );
\acc3[12]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(15),
      I1 => acc3_reg(15),
      O => \acc3[12]_i_2__0_n_0\
    );
\acc3[12]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(14),
      I1 => acc3_reg(14),
      O => \acc3[12]_i_3__0_n_0\
    );
\acc3[12]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(13),
      I1 => acc3_reg(13),
      O => \acc3[12]_i_4__0_n_0\
    );
\acc3[12]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(12),
      I1 => acc3_reg(12),
      O => \acc3[12]_i_5__0_n_0\
    );
\acc3[16]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(19),
      I1 => acc3_reg(19),
      O => \acc3[16]_i_2__0_n_0\
    );
\acc3[16]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(18),
      I1 => acc3_reg(18),
      O => \acc3[16]_i_3__0_n_0\
    );
\acc3[16]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(17),
      I1 => acc3_reg(17),
      O => \acc3[16]_i_4__0_n_0\
    );
\acc3[16]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(16),
      I1 => acc3_reg(16),
      O => \acc3[16]_i_5__0_n_0\
    );
\acc3[20]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(21),
      I1 => acc3_reg(21),
      O => \acc3[20]_i_2__0_n_0\
    );
\acc3[20]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(20),
      I1 => acc3_reg(20),
      O => \acc3[20]_i_3__0_n_0\
    );
\acc3[4]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(7),
      I1 => acc3_reg(7),
      O => \acc3[4]_i_2__0_n_0\
    );
\acc3[4]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(6),
      I1 => acc3_reg(6),
      O => \acc3[4]_i_3__0_n_0\
    );
\acc3[4]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(5),
      I1 => acc3_reg(5),
      O => \acc3[4]_i_4__0_n_0\
    );
\acc3[4]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(4),
      I1 => acc3_reg(4),
      O => \acc3[4]_i_5__0_n_0\
    );
\acc3[8]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(11),
      I1 => acc3_reg(11),
      O => \acc3[8]_i_2__0_n_0\
    );
\acc3[8]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(10),
      I1 => acc3_reg(10),
      O => \acc3[8]_i_3__0_n_0\
    );
\acc3[8]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(9),
      I1 => acc3_reg(9),
      O => \acc3[8]_i_4__0_n_0\
    );
\acc3[8]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(8),
      I1 => acc3_reg(8),
      O => \acc3[8]_i_5__0_n_0\
    );
\acc3_d2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(0),
      Q => acc3_d2(0),
      R => '0'
    );
\acc3_d2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(10),
      Q => acc3_d2(10),
      R => '0'
    );
\acc3_d2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(11),
      Q => acc3_d2(11),
      R => '0'
    );
\acc3_d2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(12),
      Q => acc3_d2(12),
      R => '0'
    );
\acc3_d2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(13),
      Q => acc3_d2(13),
      R => '0'
    );
\acc3_d2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(14),
      Q => acc3_d2(14),
      R => '0'
    );
\acc3_d2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(15),
      Q => acc3_d2(15),
      R => '0'
    );
\acc3_d2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(16),
      Q => acc3_d2(16),
      R => '0'
    );
\acc3_d2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(17),
      Q => acc3_d2(17),
      R => '0'
    );
\acc3_d2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(18),
      Q => acc3_d2(18),
      R => '0'
    );
\acc3_d2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(19),
      Q => acc3_d2(19),
      R => '0'
    );
\acc3_d2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(1),
      Q => acc3_d2(1),
      R => '0'
    );
\acc3_d2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(20),
      Q => acc3_d2(20),
      R => '0'
    );
\acc3_d2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(21),
      Q => acc3_d2(21),
      R => '0'
    );
\acc3_d2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(2),
      Q => acc3_d2(2),
      R => '0'
    );
\acc3_d2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(3),
      Q => acc3_d2(3),
      R => '0'
    );
\acc3_d2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(4),
      Q => acc3_d2(4),
      R => '0'
    );
\acc3_d2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(5),
      Q => acc3_d2(5),
      R => '0'
    );
\acc3_d2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(6),
      Q => acc3_d2(6),
      R => '0'
    );
\acc3_d2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(7),
      Q => acc3_d2(7),
      R => '0'
    );
\acc3_d2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(8),
      Q => acc3_d2(8),
      R => '0'
    );
\acc3_d2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(9),
      Q => acc3_d2(9),
      R => '0'
    );
\acc3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1__0_n_7\,
      Q => acc3_reg(0),
      R => '0'
    );
\acc3_reg[0]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc3_reg[0]_i_1__0_n_0\,
      CO(2) => \acc3_reg[0]_i_1__0_n_1\,
      CO(1) => \acc3_reg[0]_i_1__0_n_2\,
      CO(0) => \acc3_reg[0]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(3 downto 0),
      O(3) => \acc3_reg[0]_i_1__0_n_4\,
      O(2) => \acc3_reg[0]_i_1__0_n_5\,
      O(1) => \acc3_reg[0]_i_1__0_n_6\,
      O(0) => \acc3_reg[0]_i_1__0_n_7\,
      S(3) => \acc3[0]_i_2__0_n_0\,
      S(2) => \acc3[0]_i_3__0_n_0\,
      S(1) => \acc3[0]_i_4__0_n_0\,
      S(0) => \acc3[0]_i_5__0_n_0\
    );
\acc3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1__0_n_5\,
      Q => acc3_reg(10),
      R => '0'
    );
\acc3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1__0_n_4\,
      Q => acc3_reg(11),
      R => '0'
    );
\acc3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1__0_n_7\,
      Q => acc3_reg(12),
      R => '0'
    );
\acc3_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[8]_i_1__0_n_0\,
      CO(3) => \acc3_reg[12]_i_1__0_n_0\,
      CO(2) => \acc3_reg[12]_i_1__0_n_1\,
      CO(1) => \acc3_reg[12]_i_1__0_n_2\,
      CO(0) => \acc3_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(15 downto 12),
      O(3) => \acc3_reg[12]_i_1__0_n_4\,
      O(2) => \acc3_reg[12]_i_1__0_n_5\,
      O(1) => \acc3_reg[12]_i_1__0_n_6\,
      O(0) => \acc3_reg[12]_i_1__0_n_7\,
      S(3) => \acc3[12]_i_2__0_n_0\,
      S(2) => \acc3[12]_i_3__0_n_0\,
      S(1) => \acc3[12]_i_4__0_n_0\,
      S(0) => \acc3[12]_i_5__0_n_0\
    );
\acc3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1__0_n_6\,
      Q => acc3_reg(13),
      R => '0'
    );
\acc3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1__0_n_5\,
      Q => acc3_reg(14),
      R => '0'
    );
\acc3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1__0_n_4\,
      Q => acc3_reg(15),
      R => '0'
    );
\acc3_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1__0_n_7\,
      Q => acc3_reg(16),
      R => '0'
    );
\acc3_reg[16]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[12]_i_1__0_n_0\,
      CO(3) => \acc3_reg[16]_i_1__0_n_0\,
      CO(2) => \acc3_reg[16]_i_1__0_n_1\,
      CO(1) => \acc3_reg[16]_i_1__0_n_2\,
      CO(0) => \acc3_reg[16]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(19 downto 16),
      O(3) => \acc3_reg[16]_i_1__0_n_4\,
      O(2) => \acc3_reg[16]_i_1__0_n_5\,
      O(1) => \acc3_reg[16]_i_1__0_n_6\,
      O(0) => \acc3_reg[16]_i_1__0_n_7\,
      S(3) => \acc3[16]_i_2__0_n_0\,
      S(2) => \acc3[16]_i_3__0_n_0\,
      S(1) => \acc3[16]_i_4__0_n_0\,
      S(0) => \acc3[16]_i_5__0_n_0\
    );
\acc3_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1__0_n_6\,
      Q => acc3_reg(17),
      R => '0'
    );
\acc3_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1__0_n_5\,
      Q => acc3_reg(18),
      R => '0'
    );
\acc3_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1__0_n_4\,
      Q => acc3_reg(19),
      R => '0'
    );
\acc3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1__0_n_6\,
      Q => acc3_reg(1),
      R => '0'
    );
\acc3_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[20]_i_1__0_n_7\,
      Q => acc3_reg(20),
      R => '0'
    );
\acc3_reg[20]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[16]_i_1__0_n_0\,
      CO(3 downto 1) => \NLW_acc3_reg[20]_i_1__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \acc3_reg[20]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => acc2_reg(20),
      O(3 downto 2) => \NLW_acc3_reg[20]_i_1__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \acc3_reg[20]_i_1__0_n_6\,
      O(0) => \acc3_reg[20]_i_1__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \acc3[20]_i_2__0_n_0\,
      S(0) => \acc3[20]_i_3__0_n_0\
    );
\acc3_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[20]_i_1__0_n_6\,
      Q => acc3_reg(21),
      R => '0'
    );
\acc3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1__0_n_5\,
      Q => acc3_reg(2),
      R => '0'
    );
\acc3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1__0_n_4\,
      Q => acc3_reg(3),
      R => '0'
    );
\acc3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1__0_n_7\,
      Q => acc3_reg(4),
      R => '0'
    );
\acc3_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[0]_i_1__0_n_0\,
      CO(3) => \acc3_reg[4]_i_1__0_n_0\,
      CO(2) => \acc3_reg[4]_i_1__0_n_1\,
      CO(1) => \acc3_reg[4]_i_1__0_n_2\,
      CO(0) => \acc3_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(7 downto 4),
      O(3) => \acc3_reg[4]_i_1__0_n_4\,
      O(2) => \acc3_reg[4]_i_1__0_n_5\,
      O(1) => \acc3_reg[4]_i_1__0_n_6\,
      O(0) => \acc3_reg[4]_i_1__0_n_7\,
      S(3) => \acc3[4]_i_2__0_n_0\,
      S(2) => \acc3[4]_i_3__0_n_0\,
      S(1) => \acc3[4]_i_4__0_n_0\,
      S(0) => \acc3[4]_i_5__0_n_0\
    );
\acc3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1__0_n_6\,
      Q => acc3_reg(5),
      R => '0'
    );
\acc3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1__0_n_5\,
      Q => acc3_reg(6),
      R => '0'
    );
\acc3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1__0_n_4\,
      Q => acc3_reg(7),
      R => '0'
    );
\acc3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1__0_n_7\,
      Q => acc3_reg(8),
      R => '0'
    );
\acc3_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[4]_i_1__0_n_0\,
      CO(3) => \acc3_reg[8]_i_1__0_n_0\,
      CO(2) => \acc3_reg[8]_i_1__0_n_1\,
      CO(1) => \acc3_reg[8]_i_1__0_n_2\,
      CO(0) => \acc3_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(11 downto 8),
      O(3) => \acc3_reg[8]_i_1__0_n_4\,
      O(2) => \acc3_reg[8]_i_1__0_n_5\,
      O(1) => \acc3_reg[8]_i_1__0_n_6\,
      O(0) => \acc3_reg[8]_i_1__0_n_7\,
      S(3) => \acc3[8]_i_2__0_n_0\,
      S(2) => \acc3[8]_i_3__0_n_0\,
      S(1) => \acc3[8]_i_4__0_n_0\,
      S(0) => \acc3[8]_i_5__0_n_0\
    );
\acc3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1__0_n_6\,
      Q => acc3_reg(9),
      R => '0'
    );
\diff1[11]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(11),
      I1 => acc3_d2(11),
      O => \diff1[11]_i_2__0_n_0\
    );
\diff1[11]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(10),
      I1 => acc3_d2(10),
      O => \diff1[11]_i_3__0_n_0\
    );
\diff1[11]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(9),
      I1 => acc3_d2(9),
      O => \diff1[11]_i_4__0_n_0\
    );
\diff1[11]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(8),
      I1 => acc3_d2(8),
      O => \diff1[11]_i_5__0_n_0\
    );
\diff1[15]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(15),
      I1 => acc3_d2(15),
      O => \diff1[15]_i_2__0_n_0\
    );
\diff1[15]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(14),
      I1 => acc3_d2(14),
      O => \diff1[15]_i_3__0_n_0\
    );
\diff1[15]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(13),
      I1 => acc3_d2(13),
      O => \diff1[15]_i_4__0_n_0\
    );
\diff1[15]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(12),
      I1 => acc3_d2(12),
      O => \diff1[15]_i_5__0_n_0\
    );
\diff1[19]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(19),
      I1 => acc3_d2(19),
      O => \diff1[19]_i_2__0_n_0\
    );
\diff1[19]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(18),
      I1 => acc3_d2(18),
      O => \diff1[19]_i_3__0_n_0\
    );
\diff1[19]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(17),
      I1 => acc3_d2(17),
      O => \diff1[19]_i_4__0_n_0\
    );
\diff1[19]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(16),
      I1 => acc3_d2(16),
      O => \diff1[19]_i_5__0_n_0\
    );
\diff1[21]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(21),
      I1 => acc3_d2(21),
      O => \diff1[21]_i_2__0_n_0\
    );
\diff1[21]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(20),
      I1 => acc3_d2(20),
      O => \diff1[21]_i_3__0_n_0\
    );
\diff1[3]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(3),
      I1 => acc3_d2(3),
      O => \diff1[3]_i_2__0_n_0\
    );
\diff1[3]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(2),
      I1 => acc3_d2(2),
      O => \diff1[3]_i_3__0_n_0\
    );
\diff1[3]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(1),
      I1 => acc3_d2(1),
      O => \diff1[3]_i_4__0_n_0\
    );
\diff1[3]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(0),
      I1 => acc3_d2(0),
      O => \diff1[3]_i_5__0_n_0\
    );
\diff1[7]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(7),
      I1 => acc3_d2(7),
      O => \diff1[7]_i_2__0_n_0\
    );
\diff1[7]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(6),
      I1 => acc3_d2(6),
      O => \diff1[7]_i_3__0_n_0\
    );
\diff1[7]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(5),
      I1 => acc3_d2(5),
      O => \diff1[7]_i_4__0_n_0\
    );
\diff1[7]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(4),
      I1 => acc3_d2(4),
      O => \diff1[7]_i_5__0_n_0\
    );
\diff1_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(0),
      Q => diff1_d(0),
      R => '0'
    );
\diff1_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(10),
      Q => diff1_d(10),
      R => '0'
    );
\diff1_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(11),
      Q => diff1_d(11),
      R => '0'
    );
\diff1_d_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(12),
      Q => diff1_d(12),
      R => '0'
    );
\diff1_d_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(13),
      Q => diff1_d(13),
      R => '0'
    );
\diff1_d_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(14),
      Q => diff1_d(14),
      R => '0'
    );
\diff1_d_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(15),
      Q => diff1_d(15),
      R => '0'
    );
\diff1_d_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(16),
      Q => diff1_d(16),
      R => '0'
    );
\diff1_d_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(17),
      Q => diff1_d(17),
      R => '0'
    );
\diff1_d_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(18),
      Q => diff1_d(18),
      R => '0'
    );
\diff1_d_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(19),
      Q => diff1_d(19),
      R => '0'
    );
\diff1_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(1),
      Q => diff1_d(1),
      R => '0'
    );
\diff1_d_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(20),
      Q => diff1_d(20),
      R => '0'
    );
\diff1_d_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(21),
      Q => diff1_d(21),
      R => '0'
    );
\diff1_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(2),
      Q => diff1_d(2),
      R => '0'
    );
\diff1_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(3),
      Q => diff1_d(3),
      R => '0'
    );
\diff1_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(4),
      Q => diff1_d(4),
      R => '0'
    );
\diff1_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(5),
      Q => diff1_d(5),
      R => '0'
    );
\diff1_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(6),
      Q => diff1_d(6),
      R => '0'
    );
\diff1_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(7),
      Q => diff1_d(7),
      R => '0'
    );
\diff1_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(8),
      Q => diff1_d(8),
      R => '0'
    );
\diff1_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(9),
      Q => diff1_d(9),
      R => '0'
    );
\diff1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(0),
      Q => diff1(0),
      R => '0'
    );
\diff1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(10),
      Q => diff1(10),
      R => '0'
    );
\diff1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(11),
      Q => diff1(11),
      R => '0'
    );
\diff1_reg[11]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[7]_i_1__0_n_0\,
      CO(3) => \diff1_reg[11]_i_1__0_n_0\,
      CO(2) => \diff1_reg[11]_i_1__0_n_1\,
      CO(1) => \diff1_reg[11]_i_1__0_n_2\,
      CO(0) => \diff1_reg[11]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(11 downto 8),
      O(3 downto 0) => diff102_out(11 downto 8),
      S(3) => \diff1[11]_i_2__0_n_0\,
      S(2) => \diff1[11]_i_3__0_n_0\,
      S(1) => \diff1[11]_i_4__0_n_0\,
      S(0) => \diff1[11]_i_5__0_n_0\
    );
\diff1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(12),
      Q => diff1(12),
      R => '0'
    );
\diff1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(13),
      Q => diff1(13),
      R => '0'
    );
\diff1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(14),
      Q => diff1(14),
      R => '0'
    );
\diff1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(15),
      Q => diff1(15),
      R => '0'
    );
\diff1_reg[15]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[11]_i_1__0_n_0\,
      CO(3) => \diff1_reg[15]_i_1__0_n_0\,
      CO(2) => \diff1_reg[15]_i_1__0_n_1\,
      CO(1) => \diff1_reg[15]_i_1__0_n_2\,
      CO(0) => \diff1_reg[15]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(15 downto 12),
      O(3 downto 0) => diff102_out(15 downto 12),
      S(3) => \diff1[15]_i_2__0_n_0\,
      S(2) => \diff1[15]_i_3__0_n_0\,
      S(1) => \diff1[15]_i_4__0_n_0\,
      S(0) => \diff1[15]_i_5__0_n_0\
    );
\diff1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(16),
      Q => diff1(16),
      R => '0'
    );
\diff1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(17),
      Q => diff1(17),
      R => '0'
    );
\diff1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(18),
      Q => diff1(18),
      R => '0'
    );
\diff1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(19),
      Q => diff1(19),
      R => '0'
    );
\diff1_reg[19]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[15]_i_1__0_n_0\,
      CO(3) => \diff1_reg[19]_i_1__0_n_0\,
      CO(2) => \diff1_reg[19]_i_1__0_n_1\,
      CO(1) => \diff1_reg[19]_i_1__0_n_2\,
      CO(0) => \diff1_reg[19]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(19 downto 16),
      O(3 downto 0) => diff102_out(19 downto 16),
      S(3) => \diff1[19]_i_2__0_n_0\,
      S(2) => \diff1[19]_i_3__0_n_0\,
      S(1) => \diff1[19]_i_4__0_n_0\,
      S(0) => \diff1[19]_i_5__0_n_0\
    );
\diff1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(1),
      Q => diff1(1),
      R => '0'
    );
\diff1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(20),
      Q => diff1(20),
      R => '0'
    );
\diff1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(21),
      Q => diff1(21),
      R => '0'
    );
\diff1_reg[21]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[19]_i_1__0_n_0\,
      CO(3 downto 1) => \NLW_diff1_reg[21]_i_1__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \diff1_reg[21]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => acc3_reg(20),
      O(3 downto 2) => \NLW_diff1_reg[21]_i_1__0_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => diff102_out(21 downto 20),
      S(3 downto 2) => B"00",
      S(1) => \diff1[21]_i_2__0_n_0\,
      S(0) => \diff1[21]_i_3__0_n_0\
    );
\diff1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(2),
      Q => diff1(2),
      R => '0'
    );
\diff1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(3),
      Q => diff1(3),
      R => '0'
    );
\diff1_reg[3]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \diff1_reg[3]_i_1__0_n_0\,
      CO(2) => \diff1_reg[3]_i_1__0_n_1\,
      CO(1) => \diff1_reg[3]_i_1__0_n_2\,
      CO(0) => \diff1_reg[3]_i_1__0_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => acc3_reg(3 downto 0),
      O(3 downto 0) => diff102_out(3 downto 0),
      S(3) => \diff1[3]_i_2__0_n_0\,
      S(2) => \diff1[3]_i_3__0_n_0\,
      S(1) => \diff1[3]_i_4__0_n_0\,
      S(0) => \diff1[3]_i_5__0_n_0\
    );
\diff1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(4),
      Q => diff1(4),
      R => '0'
    );
\diff1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(5),
      Q => diff1(5),
      R => '0'
    );
\diff1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(6),
      Q => diff1(6),
      R => '0'
    );
\diff1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(7),
      Q => diff1(7),
      R => '0'
    );
\diff1_reg[7]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[3]_i_1__0_n_0\,
      CO(3) => \diff1_reg[7]_i_1__0_n_0\,
      CO(2) => \diff1_reg[7]_i_1__0_n_1\,
      CO(1) => \diff1_reg[7]_i_1__0_n_2\,
      CO(0) => \diff1_reg[7]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(7 downto 4),
      O(3 downto 0) => diff102_out(7 downto 4),
      S(3) => \diff1[7]_i_2__0_n_0\,
      S(2) => \diff1[7]_i_3__0_n_0\,
      S(1) => \diff1[7]_i_4__0_n_0\,
      S(0) => \diff1[7]_i_5__0_n_0\
    );
\diff1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(8),
      Q => diff1(8),
      R => '0'
    );
\diff1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(9),
      Q => diff1(9),
      R => '0'
    );
\diff2[11]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(11),
      I1 => diff1_d(11),
      O => \diff2[11]_i_2__0_n_0\
    );
\diff2[11]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(10),
      I1 => diff1_d(10),
      O => \diff2[11]_i_3__0_n_0\
    );
\diff2[11]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(9),
      I1 => diff1_d(9),
      O => \diff2[11]_i_4__0_n_0\
    );
\diff2[11]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(8),
      I1 => diff1_d(8),
      O => \diff2[11]_i_5__0_n_0\
    );
\diff2[15]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(15),
      I1 => diff1_d(15),
      O => \diff2[15]_i_2__0_n_0\
    );
\diff2[15]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(14),
      I1 => diff1_d(14),
      O => \diff2[15]_i_3__0_n_0\
    );
\diff2[15]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(13),
      I1 => diff1_d(13),
      O => \diff2[15]_i_4__0_n_0\
    );
\diff2[15]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(12),
      I1 => diff1_d(12),
      O => \diff2[15]_i_5__0_n_0\
    );
\diff2[19]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(19),
      I1 => diff1_d(19),
      O => \diff2[19]_i_2__0_n_0\
    );
\diff2[19]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(18),
      I1 => diff1_d(18),
      O => \diff2[19]_i_3__0_n_0\
    );
\diff2[19]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(17),
      I1 => diff1_d(17),
      O => \diff2[19]_i_4__0_n_0\
    );
\diff2[19]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(16),
      I1 => diff1_d(16),
      O => \diff2[19]_i_5__0_n_0\
    );
\diff2[21]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(21),
      I1 => diff1_d(21),
      O => \diff2[21]_i_2__0_n_0\
    );
\diff2[21]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(20),
      I1 => diff1_d(20),
      O => \diff2[21]_i_3__0_n_0\
    );
\diff2[3]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(3),
      I1 => diff1_d(3),
      O => \diff2[3]_i_2__0_n_0\
    );
\diff2[3]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(2),
      I1 => diff1_d(2),
      O => \diff2[3]_i_3__0_n_0\
    );
\diff2[3]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(1),
      I1 => diff1_d(1),
      O => \diff2[3]_i_4__0_n_0\
    );
\diff2[3]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(0),
      I1 => diff1_d(0),
      O => \diff2[3]_i_5__0_n_0\
    );
\diff2[7]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(7),
      I1 => diff1_d(7),
      O => \diff2[7]_i_2__0_n_0\
    );
\diff2[7]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(6),
      I1 => diff1_d(6),
      O => \diff2[7]_i_3__0_n_0\
    );
\diff2[7]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(5),
      I1 => diff1_d(5),
      O => \diff2[7]_i_4__0_n_0\
    );
\diff2[7]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(4),
      I1 => diff1_d(4),
      O => \diff2[7]_i_5__0_n_0\
    );
\diff2_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(0),
      Q => diff2_d(0),
      R => '0'
    );
\diff2_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(10),
      Q => diff2_d(10),
      R => '0'
    );
\diff2_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(11),
      Q => diff2_d(11),
      R => '0'
    );
\diff2_d_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(12),
      Q => diff2_d(12),
      R => '0'
    );
\diff2_d_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(13),
      Q => diff2_d(13),
      R => '0'
    );
\diff2_d_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(14),
      Q => diff2_d(14),
      R => '0'
    );
\diff2_d_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(15),
      Q => diff2_d(15),
      R => '0'
    );
\diff2_d_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(16),
      Q => diff2_d(16),
      R => '0'
    );
\diff2_d_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(17),
      Q => diff2_d(17),
      R => '0'
    );
\diff2_d_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(18),
      Q => diff2_d(18),
      R => '0'
    );
\diff2_d_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(19),
      Q => diff2_d(19),
      R => '0'
    );
\diff2_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(1),
      Q => diff2_d(1),
      R => '0'
    );
\diff2_d_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(20),
      Q => diff2_d(20),
      R => '0'
    );
\diff2_d_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(21),
      Q => diff2_d(21),
      R => '0'
    );
\diff2_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(2),
      Q => diff2_d(2),
      R => '0'
    );
\diff2_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(3),
      Q => diff2_d(3),
      R => '0'
    );
\diff2_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(4),
      Q => diff2_d(4),
      R => '0'
    );
\diff2_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(5),
      Q => diff2_d(5),
      R => '0'
    );
\diff2_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(6),
      Q => diff2_d(6),
      R => '0'
    );
\diff2_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(7),
      Q => diff2_d(7),
      R => '0'
    );
\diff2_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(8),
      Q => diff2_d(8),
      R => '0'
    );
\diff2_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(9),
      Q => diff2_d(9),
      R => '0'
    );
\diff2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(0),
      Q => diff2(0),
      R => '0'
    );
\diff2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(10),
      Q => diff2(10),
      R => '0'
    );
\diff2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(11),
      Q => diff2(11),
      R => '0'
    );
\diff2_reg[11]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[7]_i_1__0_n_0\,
      CO(3) => \diff2_reg[11]_i_1__0_n_0\,
      CO(2) => \diff2_reg[11]_i_1__0_n_1\,
      CO(1) => \diff2_reg[11]_i_1__0_n_2\,
      CO(0) => \diff2_reg[11]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(11 downto 8),
      O(3 downto 0) => diff201_out(11 downto 8),
      S(3) => \diff2[11]_i_2__0_n_0\,
      S(2) => \diff2[11]_i_3__0_n_0\,
      S(1) => \diff2[11]_i_4__0_n_0\,
      S(0) => \diff2[11]_i_5__0_n_0\
    );
\diff2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(12),
      Q => diff2(12),
      R => '0'
    );
\diff2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(13),
      Q => diff2(13),
      R => '0'
    );
\diff2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(14),
      Q => diff2(14),
      R => '0'
    );
\diff2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(15),
      Q => diff2(15),
      R => '0'
    );
\diff2_reg[15]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[11]_i_1__0_n_0\,
      CO(3) => \diff2_reg[15]_i_1__0_n_0\,
      CO(2) => \diff2_reg[15]_i_1__0_n_1\,
      CO(1) => \diff2_reg[15]_i_1__0_n_2\,
      CO(0) => \diff2_reg[15]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(15 downto 12),
      O(3 downto 0) => diff201_out(15 downto 12),
      S(3) => \diff2[15]_i_2__0_n_0\,
      S(2) => \diff2[15]_i_3__0_n_0\,
      S(1) => \diff2[15]_i_4__0_n_0\,
      S(0) => \diff2[15]_i_5__0_n_0\
    );
\diff2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(16),
      Q => diff2(16),
      R => '0'
    );
\diff2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(17),
      Q => diff2(17),
      R => '0'
    );
\diff2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(18),
      Q => diff2(18),
      R => '0'
    );
\diff2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(19),
      Q => diff2(19),
      R => '0'
    );
\diff2_reg[19]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[15]_i_1__0_n_0\,
      CO(3) => \diff2_reg[19]_i_1__0_n_0\,
      CO(2) => \diff2_reg[19]_i_1__0_n_1\,
      CO(1) => \diff2_reg[19]_i_1__0_n_2\,
      CO(0) => \diff2_reg[19]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(19 downto 16),
      O(3 downto 0) => diff201_out(19 downto 16),
      S(3) => \diff2[19]_i_2__0_n_0\,
      S(2) => \diff2[19]_i_3__0_n_0\,
      S(1) => \diff2[19]_i_4__0_n_0\,
      S(0) => \diff2[19]_i_5__0_n_0\
    );
\diff2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(1),
      Q => diff2(1),
      R => '0'
    );
\diff2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(20),
      Q => diff2(20),
      R => '0'
    );
\diff2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(21),
      Q => diff2(21),
      R => '0'
    );
\diff2_reg[21]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[19]_i_1__0_n_0\,
      CO(3 downto 1) => \NLW_diff2_reg[21]_i_1__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \diff2_reg[21]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => diff1(20),
      O(3 downto 2) => \NLW_diff2_reg[21]_i_1__0_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => diff201_out(21 downto 20),
      S(3 downto 2) => B"00",
      S(1) => \diff2[21]_i_2__0_n_0\,
      S(0) => \diff2[21]_i_3__0_n_0\
    );
\diff2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(2),
      Q => diff2(2),
      R => '0'
    );
\diff2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(3),
      Q => diff2(3),
      R => '0'
    );
\diff2_reg[3]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \diff2_reg[3]_i_1__0_n_0\,
      CO(2) => \diff2_reg[3]_i_1__0_n_1\,
      CO(1) => \diff2_reg[3]_i_1__0_n_2\,
      CO(0) => \diff2_reg[3]_i_1__0_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => diff1(3 downto 0),
      O(3 downto 0) => diff201_out(3 downto 0),
      S(3) => \diff2[3]_i_2__0_n_0\,
      S(2) => \diff2[3]_i_3__0_n_0\,
      S(1) => \diff2[3]_i_4__0_n_0\,
      S(0) => \diff2[3]_i_5__0_n_0\
    );
\diff2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(4),
      Q => diff2(4),
      R => '0'
    );
\diff2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(5),
      Q => diff2(5),
      R => '0'
    );
\diff2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(6),
      Q => diff2(6),
      R => '0'
    );
\diff2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(7),
      Q => diff2(7),
      R => '0'
    );
\diff2_reg[7]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[3]_i_1__0_n_0\,
      CO(3) => \diff2_reg[7]_i_1__0_n_0\,
      CO(2) => \diff2_reg[7]_i_1__0_n_1\,
      CO(1) => \diff2_reg[7]_i_1__0_n_2\,
      CO(0) => \diff2_reg[7]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(7 downto 4),
      O(3 downto 0) => diff201_out(7 downto 4),
      S(3) => \diff2[7]_i_2__0_n_0\,
      S(2) => \diff2[7]_i_3__0_n_0\,
      S(1) => \diff2[7]_i_4__0_n_0\,
      S(0) => \diff2[7]_i_5__0_n_0\
    );
\diff2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(8),
      Q => diff2(8),
      R => '0'
    );
\diff2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(9),
      Q => diff2(9),
      R => '0'
    );
\diff3[11]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(11),
      I1 => diff2_d(11),
      O => \diff3[11]_i_2__0_n_0\
    );
\diff3[11]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(10),
      I1 => diff2_d(10),
      O => \diff3[11]_i_3__0_n_0\
    );
\diff3[11]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(9),
      I1 => diff2_d(9),
      O => \diff3[11]_i_4__0_n_0\
    );
\diff3[11]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(8),
      I1 => diff2_d(8),
      O => \diff3[11]_i_5__0_n_0\
    );
\diff3[15]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(15),
      I1 => diff2_d(15),
      O => \diff3[15]_i_2__0_n_0\
    );
\diff3[15]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(14),
      I1 => diff2_d(14),
      O => \diff3[15]_i_3__0_n_0\
    );
\diff3[15]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(13),
      I1 => diff2_d(13),
      O => \diff3[15]_i_4__0_n_0\
    );
\diff3[15]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(12),
      I1 => diff2_d(12),
      O => \diff3[15]_i_5__0_n_0\
    );
\diff3[19]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(19),
      I1 => diff2_d(19),
      O => \diff3[19]_i_2__0_n_0\
    );
\diff3[19]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(18),
      I1 => diff2_d(18),
      O => \diff3[19]_i_3__0_n_0\
    );
\diff3[19]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(17),
      I1 => diff2_d(17),
      O => \diff3[19]_i_4__0_n_0\
    );
\diff3[19]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(16),
      I1 => diff2_d(16),
      O => \diff3[19]_i_5__0_n_0\
    );
\diff3[21]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(21),
      I1 => diff2_d(21),
      O => \diff3[21]_i_2__0_n_0\
    );
\diff3[21]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(20),
      I1 => diff2_d(20),
      O => \diff3[21]_i_3__0_n_0\
    );
\diff3[7]_i_10__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(0),
      I1 => diff2_d(0),
      O => \diff3[7]_i_10__0_n_0\
    );
\diff3[7]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(7),
      I1 => diff2_d(7),
      O => \diff3[7]_i_3__0_n_0\
    );
\diff3[7]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(6),
      I1 => diff2_d(6),
      O => \diff3[7]_i_4__0_n_0\
    );
\diff3[7]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(5),
      I1 => diff2_d(5),
      O => \diff3[7]_i_5__0_n_0\
    );
\diff3[7]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(4),
      I1 => diff2_d(4),
      O => \diff3[7]_i_6__0_n_0\
    );
\diff3[7]_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(3),
      I1 => diff2_d(3),
      O => \diff3[7]_i_7__0_n_0\
    );
\diff3[7]_i_8__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(2),
      I1 => diff2_d(2),
      O => \diff3[7]_i_8__0_n_0\
    );
\diff3[7]_i_9__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(1),
      I1 => diff2_d(1),
      O => \diff3[7]_i_9__0_n_0\
    );
\diff3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(10),
      Q => data0(2),
      R => '0'
    );
\diff3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(11),
      Q => data0(3),
      R => '0'
    );
\diff3_reg[11]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[7]_i_1__0_n_0\,
      CO(3) => \diff3_reg[11]_i_1__0_n_0\,
      CO(2) => \diff3_reg[11]_i_1__0_n_1\,
      CO(1) => \diff3_reg[11]_i_1__0_n_2\,
      CO(0) => \diff3_reg[11]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(11 downto 8),
      O(3 downto 0) => diff300_out(11 downto 8),
      S(3) => \diff3[11]_i_2__0_n_0\,
      S(2) => \diff3[11]_i_3__0_n_0\,
      S(1) => \diff3[11]_i_4__0_n_0\,
      S(0) => \diff3[11]_i_5__0_n_0\
    );
\diff3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(12),
      Q => data0(4),
      R => '0'
    );
\diff3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(13),
      Q => data0(5),
      R => '0'
    );
\diff3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(14),
      Q => data0(6),
      R => '0'
    );
\diff3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(15),
      Q => data0(7),
      R => '0'
    );
\diff3_reg[15]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[11]_i_1__0_n_0\,
      CO(3) => \diff3_reg[15]_i_1__0_n_0\,
      CO(2) => \diff3_reg[15]_i_1__0_n_1\,
      CO(1) => \diff3_reg[15]_i_1__0_n_2\,
      CO(0) => \diff3_reg[15]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(15 downto 12),
      O(3 downto 0) => diff300_out(15 downto 12),
      S(3) => \diff3[15]_i_2__0_n_0\,
      S(2) => \diff3[15]_i_3__0_n_0\,
      S(1) => \diff3[15]_i_4__0_n_0\,
      S(0) => \diff3[15]_i_5__0_n_0\
    );
\diff3_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(16),
      Q => data0(8),
      R => '0'
    );
\diff3_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(17),
      Q => data0(9),
      R => '0'
    );
\diff3_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(18),
      Q => data0(10),
      R => '0'
    );
\diff3_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(19),
      Q => data0(11),
      R => '0'
    );
\diff3_reg[19]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[15]_i_1__0_n_0\,
      CO(3) => \diff3_reg[19]_i_1__0_n_0\,
      CO(2) => \diff3_reg[19]_i_1__0_n_1\,
      CO(1) => \diff3_reg[19]_i_1__0_n_2\,
      CO(0) => \diff3_reg[19]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(19 downto 16),
      O(3 downto 0) => diff300_out(19 downto 16),
      S(3) => \diff3[19]_i_2__0_n_0\,
      S(2) => \diff3[19]_i_3__0_n_0\,
      S(1) => \diff3[19]_i_4__0_n_0\,
      S(0) => \diff3[19]_i_5__0_n_0\
    );
\diff3_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(20),
      Q => data0(12),
      R => '0'
    );
\diff3_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(21),
      Q => data0(13),
      R => '0'
    );
\diff3_reg[21]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[19]_i_1__0_n_0\,
      CO(3 downto 1) => \NLW_diff3_reg[21]_i_1__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \diff3_reg[21]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => diff2(20),
      O(3 downto 2) => \NLW_diff3_reg[21]_i_1__0_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => diff300_out(21 downto 20),
      S(3 downto 2) => B"00",
      S(1) => \diff3[21]_i_2__0_n_0\,
      S(0) => \diff3[21]_i_3__0_n_0\
    );
\diff3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(5),
      Q => \diff3_reg_n_0_[5]\,
      R => '0'
    );
\diff3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(6),
      Q => \diff3_reg_n_0_[6]\,
      R => '0'
    );
\diff3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(7),
      Q => \diff3_reg_n_0_[7]\,
      R => '0'
    );
\diff3_reg[7]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[7]_i_2__0_n_0\,
      CO(3) => \diff3_reg[7]_i_1__0_n_0\,
      CO(2) => \diff3_reg[7]_i_1__0_n_1\,
      CO(1) => \diff3_reg[7]_i_1__0_n_2\,
      CO(0) => \diff3_reg[7]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(7 downto 4),
      O(3 downto 1) => diff300_out(7 downto 5),
      O(0) => \NLW_diff3_reg[7]_i_1__0_O_UNCONNECTED\(0),
      S(3) => \diff3[7]_i_3__0_n_0\,
      S(2) => \diff3[7]_i_4__0_n_0\,
      S(1) => \diff3[7]_i_5__0_n_0\,
      S(0) => \diff3[7]_i_6__0_n_0\
    );
\diff3_reg[7]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \diff3_reg[7]_i_2__0_n_0\,
      CO(2) => \diff3_reg[7]_i_2__0_n_1\,
      CO(1) => \diff3_reg[7]_i_2__0_n_2\,
      CO(0) => \diff3_reg[7]_i_2__0_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => diff2(3 downto 0),
      O(3 downto 0) => \NLW_diff3_reg[7]_i_2__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \diff3[7]_i_7__0_n_0\,
      S(2) => \diff3[7]_i_8__0_n_0\,
      S(1) => \diff3[7]_i_9__0_n_0\,
      S(0) => \diff3[7]_i_10__0_n_0\
    );
\diff3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(8),
      Q => data0(0),
      R => '0'
    );
\diff3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(9),
      Q => data0(1),
      R => '0'
    );
mdat_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => din(0),
      Q => mdat_i,
      R => '0'
    );
\signed_gen[1].ch_s_data[1][15]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ch_data[1]_1\(15),
      O => D(15)
    );
\tdata[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAABAA"
    )
        port map (
      I0 => \diff3_reg_n_0_[5]\,
      I1 => \tdata[0]_i_2__0_n_0\,
      I2 => \tdata[0]_i_3__0_n_0\,
      I3 => \tdata[0]_i_4__0_n_0\,
      I4 => \tdata[0]_i_5__0_n_0\,
      O => p_1_in(0)
    );
\tdata[0]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => data0(11),
      I1 => data0(10),
      I2 => data0(13),
      I3 => data0(12),
      O => \tdata[0]_i_2__0_n_0\
    );
\tdata[0]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => data0(1),
      I1 => \diff3_reg_n_0_[6]\,
      I2 => data0(3),
      I3 => data0(4),
      O => \tdata[0]_i_3__0_n_0\
    );
\tdata[0]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => data0(9),
      I1 => data0(6),
      I2 => data0(8),
      I3 => data0(7),
      O => \tdata[0]_i_4__0_n_0\
    );
\tdata[0]_i_5__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => data0(0),
      I1 => \diff3_reg_n_0_[7]\,
      I2 => data0(2),
      I3 => data0(5),
      O => \tdata[0]_i_5__0_n_0\
    );
\tdata[15]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => \diff3_reg_n_0_[5]\,
      I1 => \tdata[0]_i_5__0_n_0\,
      I2 => \tdata[0]_i_4__0_n_0\,
      I3 => \tdata[0]_i_3__0_n_0\,
      I4 => \tdata[0]_i_2__0_n_0\,
      I5 => word_clk,
      O => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => p_1_in(0),
      Q => D(0),
      R => '0'
    );
\tdata_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(7),
      Q => D(10),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(8),
      Q => D(11),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(9),
      Q => D(12),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(10),
      Q => D(13),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[14]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(11),
      Q => D(14),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[15]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(12),
      Q => \ch_data[1]_1\(15),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => \diff3_reg_n_0_[6]\,
      Q => D(1),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => \diff3_reg_n_0_[7]\,
      Q => D(2),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(0),
      Q => D(3),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(1),
      Q => D(4),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(2),
      Q => D(5),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(3),
      Q => D(6),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(4),
      Q => D(7),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(5),
      Q => D(8),
      S => \tdata[15]_i_1__0_n_0\
    );
\tdata_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(6),
      Q => D(9),
      S => \tdata[15]_i_1__0_n_0\
    );
\word_clk_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_count_reg(15),
      O => \word_clk_i_3__0_n_0\
    );
\word_clk_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(13),
      I1 => word_count_reg(14),
      I2 => word_count_reg(12),
      O => \word_clk_i_4__0_n_0\
    );
\word_clk_i_5__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(10),
      I1 => word_count_reg(11),
      I2 => word_count_reg(9),
      O => \word_clk_i_5__0_n_0\
    );
\word_clk_i_6__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(6),
      I1 => word_count_reg(7),
      I2 => word_count_reg(8),
      O => \word_clk_i_6__0_n_0\
    );
\word_clk_i_7__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(3),
      I1 => word_count_reg(4),
      I2 => word_count_reg(5),
      O => \word_clk_i_7__0_n_0\
    );
\word_clk_i_8__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(1),
      I1 => word_count_reg(2),
      I2 => word_count_reg(0),
      O => \word_clk_i_8__0_n_0\
    );
word_clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => word_clk0,
      Q => word_clk,
      R => '0'
    );
\word_clk_reg_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_clk_reg_i_2__0_n_0\,
      CO(3 downto 2) => \NLW_word_clk_reg_i_1__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => word_clk0,
      CO(0) => \word_clk_reg_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_clk_reg_i_1__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \word_clk_i_3__0_n_0\,
      S(0) => \word_clk_i_4__0_n_0\
    );
\word_clk_reg_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \word_clk_reg_i_2__0_n_0\,
      CO(2) => \word_clk_reg_i_2__0_n_1\,
      CO(1) => \word_clk_reg_i_2__0_n_2\,
      CO(0) => \word_clk_reg_i_2__0_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_clk_reg_i_2__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \word_clk_i_5__0_n_0\,
      S(2) => \word_clk_i_6__0_n_0\,
      S(1) => \word_clk_i_7__0_n_0\,
      S(0) => \word_clk_i_8__0_n_0\
    );
\word_count[0]_i_10__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(10),
      I1 => word_count_reg(11),
      I2 => word_count_reg(9),
      O => \word_count[0]_i_10__0_n_0\
    );
\word_count[0]_i_11__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => word_count_reg(6),
      I1 => word_count_reg(7),
      I2 => word_count_reg(8),
      O => \word_count[0]_i_11__0_n_0\
    );
\word_count[0]_i_12__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(3),
      I1 => word_count_reg(4),
      I2 => word_count_reg(5),
      O => \word_count[0]_i_12__0_n_0\
    );
\word_count[0]_i_13__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(1),
      I1 => word_count_reg(2),
      I2 => word_count_reg(0),
      O => \word_count[0]_i_13__0_n_0\
    );
\word_count[0]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_count_reg(15),
      O => \word_count[0]_i_4__0_n_0\
    );
\word_count[0]_i_5__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(13),
      I1 => word_count_reg(14),
      I2 => word_count_reg(12),
      O => \word_count[0]_i_5__0_n_0\
    );
\word_count[0]_i_6__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(3),
      O => \word_count[0]_i_6__0_n_0\
    );
\word_count[0]_i_7__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(2),
      O => \word_count[0]_i_7__0_n_0\
    );
\word_count[0]_i_8__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(1),
      O => \word_count[0]_i_8__0_n_0\
    );
\word_count[0]_i_9__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_count_reg(0),
      O => \word_count[0]_i_9__0_n_0\
    );
\word_count[12]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(15),
      O => \word_count[12]_i_2__0_n_0\
    );
\word_count[12]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(14),
      O => \word_count[12]_i_3__0_n_0\
    );
\word_count[12]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(13),
      O => \word_count[12]_i_4__0_n_0\
    );
\word_count[12]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(12),
      O => \word_count[12]_i_5__0_n_0\
    );
\word_count[4]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(7),
      O => \word_count[4]_i_2__0_n_0\
    );
\word_count[4]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(6),
      O => \word_count[4]_i_3__0_n_0\
    );
\word_count[4]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(5),
      O => \word_count[4]_i_4__0_n_0\
    );
\word_count[4]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(4),
      O => \word_count[4]_i_5__0_n_0\
    );
\word_count[8]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(11),
      O => \word_count[8]_i_2__0_n_0\
    );
\word_count[8]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(10),
      O => \word_count[8]_i_3__0_n_0\
    );
\word_count[8]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(9),
      O => \word_count[8]_i_4__0_n_0\
    );
\word_count[8]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(8),
      O => \word_count[8]_i_5__0_n_0\
    );
\word_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2__0_n_7\,
      Q => word_count_reg(0),
      R => word_count0
    );
\word_count_reg[0]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[0]_i_3__0_n_0\,
      CO(3 downto 2) => \NLW_word_count_reg[0]_i_1__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => word_count0,
      CO(0) => \word_count_reg[0]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_count_reg[0]_i_1__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \word_count[0]_i_4__0_n_0\,
      S(0) => \word_count[0]_i_5__0_n_0\
    );
\word_count_reg[0]_i_2__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \word_count_reg[0]_i_2__0_n_0\,
      CO(2) => \word_count_reg[0]_i_2__0_n_1\,
      CO(1) => \word_count_reg[0]_i_2__0_n_2\,
      CO(0) => \word_count_reg[0]_i_2__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \word_count_reg[0]_i_2__0_n_4\,
      O(2) => \word_count_reg[0]_i_2__0_n_5\,
      O(1) => \word_count_reg[0]_i_2__0_n_6\,
      O(0) => \word_count_reg[0]_i_2__0_n_7\,
      S(3) => \word_count[0]_i_6__0_n_0\,
      S(2) => \word_count[0]_i_7__0_n_0\,
      S(1) => \word_count[0]_i_8__0_n_0\,
      S(0) => \word_count[0]_i_9__0_n_0\
    );
\word_count_reg[0]_i_3__0\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \word_count_reg[0]_i_3__0_n_0\,
      CO(2) => \word_count_reg[0]_i_3__0_n_1\,
      CO(1) => \word_count_reg[0]_i_3__0_n_2\,
      CO(0) => \word_count_reg[0]_i_3__0_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_count_reg[0]_i_3__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \word_count[0]_i_10__0_n_0\,
      S(2) => \word_count[0]_i_11__0_n_0\,
      S(1) => \word_count[0]_i_12__0_n_0\,
      S(0) => \word_count[0]_i_13__0_n_0\
    );
\word_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1__0_n_5\,
      Q => word_count_reg(10),
      R => word_count0
    );
\word_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1__0_n_4\,
      Q => word_count_reg(11),
      R => word_count0
    );
\word_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1__0_n_7\,
      Q => word_count_reg(12),
      R => word_count0
    );
\word_count_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[8]_i_1__0_n_0\,
      CO(3) => \NLW_word_count_reg[12]_i_1__0_CO_UNCONNECTED\(3),
      CO(2) => \word_count_reg[12]_i_1__0_n_1\,
      CO(1) => \word_count_reg[12]_i_1__0_n_2\,
      CO(0) => \word_count_reg[12]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_count_reg[12]_i_1__0_n_4\,
      O(2) => \word_count_reg[12]_i_1__0_n_5\,
      O(1) => \word_count_reg[12]_i_1__0_n_6\,
      O(0) => \word_count_reg[12]_i_1__0_n_7\,
      S(3) => \word_count[12]_i_2__0_n_0\,
      S(2) => \word_count[12]_i_3__0_n_0\,
      S(1) => \word_count[12]_i_4__0_n_0\,
      S(0) => \word_count[12]_i_5__0_n_0\
    );
\word_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1__0_n_6\,
      Q => word_count_reg(13),
      R => word_count0
    );
\word_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1__0_n_5\,
      Q => word_count_reg(14),
      R => word_count0
    );
\word_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1__0_n_4\,
      Q => word_count_reg(15),
      R => word_count0
    );
\word_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2__0_n_6\,
      Q => word_count_reg(1),
      R => word_count0
    );
\word_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2__0_n_5\,
      Q => word_count_reg(2),
      R => word_count0
    );
\word_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2__0_n_4\,
      Q => word_count_reg(3),
      R => word_count0
    );
\word_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1__0_n_7\,
      Q => word_count_reg(4),
      R => word_count0
    );
\word_count_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[0]_i_2__0_n_0\,
      CO(3) => \word_count_reg[4]_i_1__0_n_0\,
      CO(2) => \word_count_reg[4]_i_1__0_n_1\,
      CO(1) => \word_count_reg[4]_i_1__0_n_2\,
      CO(0) => \word_count_reg[4]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_count_reg[4]_i_1__0_n_4\,
      O(2) => \word_count_reg[4]_i_1__0_n_5\,
      O(1) => \word_count_reg[4]_i_1__0_n_6\,
      O(0) => \word_count_reg[4]_i_1__0_n_7\,
      S(3) => \word_count[4]_i_2__0_n_0\,
      S(2) => \word_count[4]_i_3__0_n_0\,
      S(1) => \word_count[4]_i_4__0_n_0\,
      S(0) => \word_count[4]_i_5__0_n_0\
    );
\word_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1__0_n_6\,
      Q => word_count_reg(5),
      R => word_count0
    );
\word_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1__0_n_5\,
      Q => word_count_reg(6),
      R => word_count0
    );
\word_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1__0_n_4\,
      Q => word_count_reg(7),
      R => word_count0
    );
\word_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1__0_n_7\,
      Q => word_count_reg(8),
      R => word_count0
    );
\word_count_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[4]_i_1__0_n_0\,
      CO(3) => \word_count_reg[8]_i_1__0_n_0\,
      CO(2) => \word_count_reg[8]_i_1__0_n_1\,
      CO(1) => \word_count_reg[8]_i_1__0_n_2\,
      CO(0) => \word_count_reg[8]_i_1__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_count_reg[8]_i_1__0_n_4\,
      O(2) => \word_count_reg[8]_i_1__0_n_5\,
      O(1) => \word_count_reg[8]_i_1__0_n_6\,
      O(0) => \word_count_reg[8]_i_1__0_n_7\,
      S(3) => \word_count[8]_i_2__0_n_0\,
      S(2) => \word_count[8]_i_3__0_n_0\,
      S(1) => \word_count[8]_i_4__0_n_0\,
      S(0) => \word_count[8]_i_5__0_n_0\
    );
\word_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1__0_n_6\,
      Q => word_count_reg(9),
      R => word_count0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_AD7403_0_0_sinc3_1 is
  port (
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    din : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zsys_axis_AD7403_0_0_sinc3_1 : entity is "sinc3";
end zsys_axis_AD7403_0_0_sinc3_1;

architecture STRUCTURE of zsys_axis_AD7403_0_0_sinc3_1 is
  signal \acc1[0]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc1[0]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc1[0]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc1[0]_i_5__1_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_5__1_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_5__1_n_0\ : STD_LOGIC;
  signal \acc1[20]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc1[20]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_5__1_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_5__1_n_0\ : STD_LOGIC;
  signal acc1_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \acc1_reg[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc1_reg[20]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc1_reg[20]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc1_reg[20]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc2[0]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc2[0]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc2[0]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc2[0]_i_5__1_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_5__1_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_5__1_n_0\ : STD_LOGIC;
  signal \acc2[20]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc2[20]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_5__1_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_5__1_n_0\ : STD_LOGIC;
  signal acc2_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \acc2_reg[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc2_reg[20]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc2_reg[20]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc2_reg[20]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc3[0]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc3[0]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc3[0]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc3[0]_i_5__1_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_5__1_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_5__1_n_0\ : STD_LOGIC;
  signal \acc3[20]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc3[20]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_5__1_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_2__1_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_3__1_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_4__1_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_5__1_n_0\ : STD_LOGIC;
  signal acc3_d2 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal acc3_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \acc3_reg[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc3_reg[20]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc3_reg[20]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc3_reg[20]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__1_n_7\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__1_n_1\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__1_n_2\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__1_n_3\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__1_n_4\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__1_n_5\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__1_n_6\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__1_n_7\ : STD_LOGIC;
  signal \ch_data[2]_2\ : STD_LOGIC_VECTOR ( 15 to 15 );
  signal data0 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal diff1 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal diff102_out : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff1[11]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff1[11]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff1[11]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff1[11]_i_5__1_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_5__1_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_5__1_n_0\ : STD_LOGIC;
  signal \diff1[21]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff1[21]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_5__1_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_5__1_n_0\ : STD_LOGIC;
  signal diff1_d : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff1_reg[11]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff1_reg[11]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff1_reg[11]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff1_reg[11]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff1_reg[21]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1__1_n_3\ : STD_LOGIC;
  signal diff2 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal diff201_out : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff2[11]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff2[11]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff2[11]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff2[11]_i_5__1_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_5__1_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_5__1_n_0\ : STD_LOGIC;
  signal \diff2[21]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff2[21]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_5__1_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_5__1_n_0\ : STD_LOGIC;
  signal diff2_d : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff2_reg[11]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff2_reg[11]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff2_reg[11]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff2_reg[11]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff2_reg[21]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1__1_n_3\ : STD_LOGIC;
  signal diff300_out : STD_LOGIC_VECTOR ( 21 downto 5 );
  signal \diff3[11]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff3[11]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff3[11]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff3[11]_i_5__1_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_5__1_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_5__1_n_0\ : STD_LOGIC;
  signal \diff3[21]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff3[21]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_10__1_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_3__1_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_4__1_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_5__1_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_6__1_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_7__1_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_8__1_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_9__1_n_0\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff3_reg[21]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1__1_n_1\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1__1_n_2\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1__1_n_3\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2__1_n_0\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2__1_n_1\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2__1_n_2\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2__1_n_3\ : STD_LOGIC;
  signal \diff3_reg_n_0_[5]\ : STD_LOGIC;
  signal \diff3_reg_n_0_[6]\ : STD_LOGIC;
  signal \diff3_reg_n_0_[7]\ : STD_LOGIC;
  signal mdat_i : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \tdata[0]_i_2__1_n_0\ : STD_LOGIC;
  signal \tdata[0]_i_3__1_n_0\ : STD_LOGIC;
  signal \tdata[0]_i_4__1_n_0\ : STD_LOGIC;
  signal \tdata[0]_i_5__1_n_0\ : STD_LOGIC;
  signal \tdata[15]_i_1__1_n_0\ : STD_LOGIC;
  signal word_clk : STD_LOGIC;
  signal word_clk0 : STD_LOGIC;
  signal \word_clk_i_3__1_n_0\ : STD_LOGIC;
  signal \word_clk_i_4__1_n_0\ : STD_LOGIC;
  signal \word_clk_i_5__1_n_0\ : STD_LOGIC;
  signal \word_clk_i_6__1_n_0\ : STD_LOGIC;
  signal \word_clk_i_7__1_n_0\ : STD_LOGIC;
  signal \word_clk_i_8__1_n_0\ : STD_LOGIC;
  signal \word_clk_reg_i_1__1_n_3\ : STD_LOGIC;
  signal \word_clk_reg_i_2__1_n_0\ : STD_LOGIC;
  signal \word_clk_reg_i_2__1_n_1\ : STD_LOGIC;
  signal \word_clk_reg_i_2__1_n_2\ : STD_LOGIC;
  signal \word_clk_reg_i_2__1_n_3\ : STD_LOGIC;
  signal word_count0 : STD_LOGIC;
  signal \word_count[0]_i_10__1_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_11__1_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_12__1_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_13__1_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_4__1_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_5__1_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_6__1_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_7__1_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_8__1_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_9__1_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_2__1_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_3__1_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_4__1_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_5__1_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_2__1_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_3__1_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_4__1_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_5__1_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_2__1_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_3__1_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_4__1_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_5__1_n_0\ : STD_LOGIC;
  signal word_count_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \word_count_reg[0]_i_1__1_n_3\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__1_n_0\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__1_n_1\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__1_n_2\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__1_n_3\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__1_n_4\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__1_n_5\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__1_n_6\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__1_n_7\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3__1_n_0\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3__1_n_1\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3__1_n_2\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3__1_n_3\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__1_n_1\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__1_n_2\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__1_n_3\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__1_n_4\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__1_n_5\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__1_n_6\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__1_n_7\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__1_n_1\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__1_n_2\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__1_n_3\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__1_n_4\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__1_n_5\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__1_n_6\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__1_n_7\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__1_n_1\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__1_n_2\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__1_n_3\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__1_n_4\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__1_n_5\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__1_n_6\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__1_n_7\ : STD_LOGIC;
  signal \NLW_acc1_reg[20]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_acc1_reg[20]_i_1__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_acc2_reg[20]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_acc2_reg[20]_i_1__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_acc3_reg[20]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_acc3_reg[20]_i_1__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff1_reg[21]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_diff1_reg[21]_i_1__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff2_reg[21]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_diff2_reg[21]_i_1__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff3_reg[21]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_diff3_reg[21]_i_1__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff3_reg[7]_i_1__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_diff3_reg[7]_i_2__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_clk_reg_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_word_clk_reg_i_1__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_clk_reg_i_2__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_count_reg[0]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_word_count_reg[0]_i_1__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_count_reg[0]_i_3__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_count_reg[12]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
\acc1[0]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(3),
      O => \acc1[0]_i_2__1_n_0\
    );
\acc1[0]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(2),
      O => \acc1[0]_i_3__1_n_0\
    );
\acc1[0]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(1),
      O => \acc1[0]_i_4__1_n_0\
    );
\acc1[0]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => acc1_reg(0),
      O => \acc1[0]_i_5__1_n_0\
    );
\acc1[12]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(15),
      O => \acc1[12]_i_2__1_n_0\
    );
\acc1[12]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(14),
      O => \acc1[12]_i_3__1_n_0\
    );
\acc1[12]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(13),
      O => \acc1[12]_i_4__1_n_0\
    );
\acc1[12]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(12),
      O => \acc1[12]_i_5__1_n_0\
    );
\acc1[16]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(19),
      O => \acc1[16]_i_2__1_n_0\
    );
\acc1[16]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(18),
      O => \acc1[16]_i_3__1_n_0\
    );
\acc1[16]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(17),
      O => \acc1[16]_i_4__1_n_0\
    );
\acc1[16]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(16),
      O => \acc1[16]_i_5__1_n_0\
    );
\acc1[20]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(21),
      O => \acc1[20]_i_2__1_n_0\
    );
\acc1[20]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(20),
      O => \acc1[20]_i_3__1_n_0\
    );
\acc1[4]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(7),
      O => \acc1[4]_i_2__1_n_0\
    );
\acc1[4]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(6),
      O => \acc1[4]_i_3__1_n_0\
    );
\acc1[4]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(5),
      O => \acc1[4]_i_4__1_n_0\
    );
\acc1[4]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(4),
      O => \acc1[4]_i_5__1_n_0\
    );
\acc1[8]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(11),
      O => \acc1[8]_i_2__1_n_0\
    );
\acc1[8]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(10),
      O => \acc1[8]_i_3__1_n_0\
    );
\acc1[8]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(9),
      O => \acc1[8]_i_4__1_n_0\
    );
\acc1[8]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(8),
      O => \acc1[8]_i_5__1_n_0\
    );
\acc1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1__1_n_7\,
      Q => acc1_reg(0),
      R => '0'
    );
\acc1_reg[0]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc1_reg[0]_i_1__1_n_0\,
      CO(2) => \acc1_reg[0]_i_1__1_n_1\,
      CO(1) => \acc1_reg[0]_i_1__1_n_2\,
      CO(0) => \acc1_reg[0]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \acc1_reg[0]_i_1__1_n_4\,
      O(2) => \acc1_reg[0]_i_1__1_n_5\,
      O(1) => \acc1_reg[0]_i_1__1_n_6\,
      O(0) => \acc1_reg[0]_i_1__1_n_7\,
      S(3) => \acc1[0]_i_2__1_n_0\,
      S(2) => \acc1[0]_i_3__1_n_0\,
      S(1) => \acc1[0]_i_4__1_n_0\,
      S(0) => \acc1[0]_i_5__1_n_0\
    );
\acc1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1__1_n_5\,
      Q => acc1_reg(10),
      R => '0'
    );
\acc1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1__1_n_4\,
      Q => acc1_reg(11),
      R => '0'
    );
\acc1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1__1_n_7\,
      Q => acc1_reg(12),
      R => '0'
    );
\acc1_reg[12]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[8]_i_1__1_n_0\,
      CO(3) => \acc1_reg[12]_i_1__1_n_0\,
      CO(2) => \acc1_reg[12]_i_1__1_n_1\,
      CO(1) => \acc1_reg[12]_i_1__1_n_2\,
      CO(0) => \acc1_reg[12]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[12]_i_1__1_n_4\,
      O(2) => \acc1_reg[12]_i_1__1_n_5\,
      O(1) => \acc1_reg[12]_i_1__1_n_6\,
      O(0) => \acc1_reg[12]_i_1__1_n_7\,
      S(3) => \acc1[12]_i_2__1_n_0\,
      S(2) => \acc1[12]_i_3__1_n_0\,
      S(1) => \acc1[12]_i_4__1_n_0\,
      S(0) => \acc1[12]_i_5__1_n_0\
    );
\acc1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1__1_n_6\,
      Q => acc1_reg(13),
      R => '0'
    );
\acc1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1__1_n_5\,
      Q => acc1_reg(14),
      R => '0'
    );
\acc1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1__1_n_4\,
      Q => acc1_reg(15),
      R => '0'
    );
\acc1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1__1_n_7\,
      Q => acc1_reg(16),
      R => '0'
    );
\acc1_reg[16]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[12]_i_1__1_n_0\,
      CO(3) => \acc1_reg[16]_i_1__1_n_0\,
      CO(2) => \acc1_reg[16]_i_1__1_n_1\,
      CO(1) => \acc1_reg[16]_i_1__1_n_2\,
      CO(0) => \acc1_reg[16]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[16]_i_1__1_n_4\,
      O(2) => \acc1_reg[16]_i_1__1_n_5\,
      O(1) => \acc1_reg[16]_i_1__1_n_6\,
      O(0) => \acc1_reg[16]_i_1__1_n_7\,
      S(3) => \acc1[16]_i_2__1_n_0\,
      S(2) => \acc1[16]_i_3__1_n_0\,
      S(1) => \acc1[16]_i_4__1_n_0\,
      S(0) => \acc1[16]_i_5__1_n_0\
    );
\acc1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1__1_n_6\,
      Q => acc1_reg(17),
      R => '0'
    );
\acc1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1__1_n_5\,
      Q => acc1_reg(18),
      R => '0'
    );
\acc1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1__1_n_4\,
      Q => acc1_reg(19),
      R => '0'
    );
\acc1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1__1_n_6\,
      Q => acc1_reg(1),
      R => '0'
    );
\acc1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[20]_i_1__1_n_7\,
      Q => acc1_reg(20),
      R => '0'
    );
\acc1_reg[20]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[16]_i_1__1_n_0\,
      CO(3 downto 1) => \NLW_acc1_reg[20]_i_1__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \acc1_reg[20]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_acc1_reg[20]_i_1__1_O_UNCONNECTED\(3 downto 2),
      O(1) => \acc1_reg[20]_i_1__1_n_6\,
      O(0) => \acc1_reg[20]_i_1__1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \acc1[20]_i_2__1_n_0\,
      S(0) => \acc1[20]_i_3__1_n_0\
    );
\acc1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[20]_i_1__1_n_6\,
      Q => acc1_reg(21),
      R => '0'
    );
\acc1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1__1_n_5\,
      Q => acc1_reg(2),
      R => '0'
    );
\acc1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1__1_n_4\,
      Q => acc1_reg(3),
      R => '0'
    );
\acc1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1__1_n_7\,
      Q => acc1_reg(4),
      R => '0'
    );
\acc1_reg[4]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[0]_i_1__1_n_0\,
      CO(3) => \acc1_reg[4]_i_1__1_n_0\,
      CO(2) => \acc1_reg[4]_i_1__1_n_1\,
      CO(1) => \acc1_reg[4]_i_1__1_n_2\,
      CO(0) => \acc1_reg[4]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[4]_i_1__1_n_4\,
      O(2) => \acc1_reg[4]_i_1__1_n_5\,
      O(1) => \acc1_reg[4]_i_1__1_n_6\,
      O(0) => \acc1_reg[4]_i_1__1_n_7\,
      S(3) => \acc1[4]_i_2__1_n_0\,
      S(2) => \acc1[4]_i_3__1_n_0\,
      S(1) => \acc1[4]_i_4__1_n_0\,
      S(0) => \acc1[4]_i_5__1_n_0\
    );
\acc1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1__1_n_6\,
      Q => acc1_reg(5),
      R => '0'
    );
\acc1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1__1_n_5\,
      Q => acc1_reg(6),
      R => '0'
    );
\acc1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1__1_n_4\,
      Q => acc1_reg(7),
      R => '0'
    );
\acc1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1__1_n_7\,
      Q => acc1_reg(8),
      R => '0'
    );
\acc1_reg[8]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[4]_i_1__1_n_0\,
      CO(3) => \acc1_reg[8]_i_1__1_n_0\,
      CO(2) => \acc1_reg[8]_i_1__1_n_1\,
      CO(1) => \acc1_reg[8]_i_1__1_n_2\,
      CO(0) => \acc1_reg[8]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[8]_i_1__1_n_4\,
      O(2) => \acc1_reg[8]_i_1__1_n_5\,
      O(1) => \acc1_reg[8]_i_1__1_n_6\,
      O(0) => \acc1_reg[8]_i_1__1_n_7\,
      S(3) => \acc1[8]_i_2__1_n_0\,
      S(2) => \acc1[8]_i_3__1_n_0\,
      S(1) => \acc1[8]_i_4__1_n_0\,
      S(0) => \acc1[8]_i_5__1_n_0\
    );
\acc1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1__1_n_6\,
      Q => acc1_reg(9),
      R => '0'
    );
\acc2[0]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(3),
      I1 => acc2_reg(3),
      O => \acc2[0]_i_2__1_n_0\
    );
\acc2[0]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(2),
      I1 => acc2_reg(2),
      O => \acc2[0]_i_3__1_n_0\
    );
\acc2[0]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(1),
      I1 => acc2_reg(1),
      O => \acc2[0]_i_4__1_n_0\
    );
\acc2[0]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(0),
      I1 => acc2_reg(0),
      O => \acc2[0]_i_5__1_n_0\
    );
\acc2[12]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(15),
      I1 => acc2_reg(15),
      O => \acc2[12]_i_2__1_n_0\
    );
\acc2[12]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(14),
      I1 => acc2_reg(14),
      O => \acc2[12]_i_3__1_n_0\
    );
\acc2[12]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(13),
      I1 => acc2_reg(13),
      O => \acc2[12]_i_4__1_n_0\
    );
\acc2[12]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(12),
      I1 => acc2_reg(12),
      O => \acc2[12]_i_5__1_n_0\
    );
\acc2[16]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(19),
      I1 => acc2_reg(19),
      O => \acc2[16]_i_2__1_n_0\
    );
\acc2[16]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(18),
      I1 => acc2_reg(18),
      O => \acc2[16]_i_3__1_n_0\
    );
\acc2[16]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(17),
      I1 => acc2_reg(17),
      O => \acc2[16]_i_4__1_n_0\
    );
\acc2[16]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(16),
      I1 => acc2_reg(16),
      O => \acc2[16]_i_5__1_n_0\
    );
\acc2[20]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(21),
      I1 => acc1_reg(21),
      O => \acc2[20]_i_2__1_n_0\
    );
\acc2[20]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(20),
      I1 => acc2_reg(20),
      O => \acc2[20]_i_3__1_n_0\
    );
\acc2[4]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(7),
      I1 => acc2_reg(7),
      O => \acc2[4]_i_2__1_n_0\
    );
\acc2[4]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(6),
      I1 => acc2_reg(6),
      O => \acc2[4]_i_3__1_n_0\
    );
\acc2[4]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(5),
      I1 => acc2_reg(5),
      O => \acc2[4]_i_4__1_n_0\
    );
\acc2[4]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(4),
      I1 => acc2_reg(4),
      O => \acc2[4]_i_5__1_n_0\
    );
\acc2[8]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(11),
      I1 => acc2_reg(11),
      O => \acc2[8]_i_2__1_n_0\
    );
\acc2[8]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(10),
      I1 => acc2_reg(10),
      O => \acc2[8]_i_3__1_n_0\
    );
\acc2[8]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(9),
      I1 => acc2_reg(9),
      O => \acc2[8]_i_4__1_n_0\
    );
\acc2[8]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(8),
      I1 => acc2_reg(8),
      O => \acc2[8]_i_5__1_n_0\
    );
\acc2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1__1_n_7\,
      Q => acc2_reg(0),
      R => '0'
    );
\acc2_reg[0]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc2_reg[0]_i_1__1_n_0\,
      CO(2) => \acc2_reg[0]_i_1__1_n_1\,
      CO(1) => \acc2_reg[0]_i_1__1_n_2\,
      CO(0) => \acc2_reg[0]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(3 downto 0),
      O(3) => \acc2_reg[0]_i_1__1_n_4\,
      O(2) => \acc2_reg[0]_i_1__1_n_5\,
      O(1) => \acc2_reg[0]_i_1__1_n_6\,
      O(0) => \acc2_reg[0]_i_1__1_n_7\,
      S(3) => \acc2[0]_i_2__1_n_0\,
      S(2) => \acc2[0]_i_3__1_n_0\,
      S(1) => \acc2[0]_i_4__1_n_0\,
      S(0) => \acc2[0]_i_5__1_n_0\
    );
\acc2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1__1_n_5\,
      Q => acc2_reg(10),
      R => '0'
    );
\acc2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1__1_n_4\,
      Q => acc2_reg(11),
      R => '0'
    );
\acc2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1__1_n_7\,
      Q => acc2_reg(12),
      R => '0'
    );
\acc2_reg[12]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[8]_i_1__1_n_0\,
      CO(3) => \acc2_reg[12]_i_1__1_n_0\,
      CO(2) => \acc2_reg[12]_i_1__1_n_1\,
      CO(1) => \acc2_reg[12]_i_1__1_n_2\,
      CO(0) => \acc2_reg[12]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(15 downto 12),
      O(3) => \acc2_reg[12]_i_1__1_n_4\,
      O(2) => \acc2_reg[12]_i_1__1_n_5\,
      O(1) => \acc2_reg[12]_i_1__1_n_6\,
      O(0) => \acc2_reg[12]_i_1__1_n_7\,
      S(3) => \acc2[12]_i_2__1_n_0\,
      S(2) => \acc2[12]_i_3__1_n_0\,
      S(1) => \acc2[12]_i_4__1_n_0\,
      S(0) => \acc2[12]_i_5__1_n_0\
    );
\acc2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1__1_n_6\,
      Q => acc2_reg(13),
      R => '0'
    );
\acc2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1__1_n_5\,
      Q => acc2_reg(14),
      R => '0'
    );
\acc2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1__1_n_4\,
      Q => acc2_reg(15),
      R => '0'
    );
\acc2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1__1_n_7\,
      Q => acc2_reg(16),
      R => '0'
    );
\acc2_reg[16]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[12]_i_1__1_n_0\,
      CO(3) => \acc2_reg[16]_i_1__1_n_0\,
      CO(2) => \acc2_reg[16]_i_1__1_n_1\,
      CO(1) => \acc2_reg[16]_i_1__1_n_2\,
      CO(0) => \acc2_reg[16]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(19 downto 16),
      O(3) => \acc2_reg[16]_i_1__1_n_4\,
      O(2) => \acc2_reg[16]_i_1__1_n_5\,
      O(1) => \acc2_reg[16]_i_1__1_n_6\,
      O(0) => \acc2_reg[16]_i_1__1_n_7\,
      S(3) => \acc2[16]_i_2__1_n_0\,
      S(2) => \acc2[16]_i_3__1_n_0\,
      S(1) => \acc2[16]_i_4__1_n_0\,
      S(0) => \acc2[16]_i_5__1_n_0\
    );
\acc2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1__1_n_6\,
      Q => acc2_reg(17),
      R => '0'
    );
\acc2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1__1_n_5\,
      Q => acc2_reg(18),
      R => '0'
    );
\acc2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1__1_n_4\,
      Q => acc2_reg(19),
      R => '0'
    );
\acc2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1__1_n_6\,
      Q => acc2_reg(1),
      R => '0'
    );
\acc2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[20]_i_1__1_n_7\,
      Q => acc2_reg(20),
      R => '0'
    );
\acc2_reg[20]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[16]_i_1__1_n_0\,
      CO(3 downto 1) => \NLW_acc2_reg[20]_i_1__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \acc2_reg[20]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => acc1_reg(20),
      O(3 downto 2) => \NLW_acc2_reg[20]_i_1__1_O_UNCONNECTED\(3 downto 2),
      O(1) => \acc2_reg[20]_i_1__1_n_6\,
      O(0) => \acc2_reg[20]_i_1__1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \acc2[20]_i_2__1_n_0\,
      S(0) => \acc2[20]_i_3__1_n_0\
    );
\acc2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[20]_i_1__1_n_6\,
      Q => acc2_reg(21),
      R => '0'
    );
\acc2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1__1_n_5\,
      Q => acc2_reg(2),
      R => '0'
    );
\acc2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1__1_n_4\,
      Q => acc2_reg(3),
      R => '0'
    );
\acc2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1__1_n_7\,
      Q => acc2_reg(4),
      R => '0'
    );
\acc2_reg[4]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[0]_i_1__1_n_0\,
      CO(3) => \acc2_reg[4]_i_1__1_n_0\,
      CO(2) => \acc2_reg[4]_i_1__1_n_1\,
      CO(1) => \acc2_reg[4]_i_1__1_n_2\,
      CO(0) => \acc2_reg[4]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(7 downto 4),
      O(3) => \acc2_reg[4]_i_1__1_n_4\,
      O(2) => \acc2_reg[4]_i_1__1_n_5\,
      O(1) => \acc2_reg[4]_i_1__1_n_6\,
      O(0) => \acc2_reg[4]_i_1__1_n_7\,
      S(3) => \acc2[4]_i_2__1_n_0\,
      S(2) => \acc2[4]_i_3__1_n_0\,
      S(1) => \acc2[4]_i_4__1_n_0\,
      S(0) => \acc2[4]_i_5__1_n_0\
    );
\acc2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1__1_n_6\,
      Q => acc2_reg(5),
      R => '0'
    );
\acc2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1__1_n_5\,
      Q => acc2_reg(6),
      R => '0'
    );
\acc2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1__1_n_4\,
      Q => acc2_reg(7),
      R => '0'
    );
\acc2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1__1_n_7\,
      Q => acc2_reg(8),
      R => '0'
    );
\acc2_reg[8]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[4]_i_1__1_n_0\,
      CO(3) => \acc2_reg[8]_i_1__1_n_0\,
      CO(2) => \acc2_reg[8]_i_1__1_n_1\,
      CO(1) => \acc2_reg[8]_i_1__1_n_2\,
      CO(0) => \acc2_reg[8]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(11 downto 8),
      O(3) => \acc2_reg[8]_i_1__1_n_4\,
      O(2) => \acc2_reg[8]_i_1__1_n_5\,
      O(1) => \acc2_reg[8]_i_1__1_n_6\,
      O(0) => \acc2_reg[8]_i_1__1_n_7\,
      S(3) => \acc2[8]_i_2__1_n_0\,
      S(2) => \acc2[8]_i_3__1_n_0\,
      S(1) => \acc2[8]_i_4__1_n_0\,
      S(0) => \acc2[8]_i_5__1_n_0\
    );
\acc2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1__1_n_6\,
      Q => acc2_reg(9),
      R => '0'
    );
\acc3[0]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(3),
      I1 => acc3_reg(3),
      O => \acc3[0]_i_2__1_n_0\
    );
\acc3[0]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(2),
      I1 => acc3_reg(2),
      O => \acc3[0]_i_3__1_n_0\
    );
\acc3[0]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(1),
      I1 => acc3_reg(1),
      O => \acc3[0]_i_4__1_n_0\
    );
\acc3[0]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(0),
      I1 => acc3_reg(0),
      O => \acc3[0]_i_5__1_n_0\
    );
\acc3[12]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(15),
      I1 => acc3_reg(15),
      O => \acc3[12]_i_2__1_n_0\
    );
\acc3[12]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(14),
      I1 => acc3_reg(14),
      O => \acc3[12]_i_3__1_n_0\
    );
\acc3[12]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(13),
      I1 => acc3_reg(13),
      O => \acc3[12]_i_4__1_n_0\
    );
\acc3[12]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(12),
      I1 => acc3_reg(12),
      O => \acc3[12]_i_5__1_n_0\
    );
\acc3[16]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(19),
      I1 => acc3_reg(19),
      O => \acc3[16]_i_2__1_n_0\
    );
\acc3[16]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(18),
      I1 => acc3_reg(18),
      O => \acc3[16]_i_3__1_n_0\
    );
\acc3[16]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(17),
      I1 => acc3_reg(17),
      O => \acc3[16]_i_4__1_n_0\
    );
\acc3[16]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(16),
      I1 => acc3_reg(16),
      O => \acc3[16]_i_5__1_n_0\
    );
\acc3[20]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(21),
      I1 => acc3_reg(21),
      O => \acc3[20]_i_2__1_n_0\
    );
\acc3[20]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(20),
      I1 => acc3_reg(20),
      O => \acc3[20]_i_3__1_n_0\
    );
\acc3[4]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(7),
      I1 => acc3_reg(7),
      O => \acc3[4]_i_2__1_n_0\
    );
\acc3[4]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(6),
      I1 => acc3_reg(6),
      O => \acc3[4]_i_3__1_n_0\
    );
\acc3[4]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(5),
      I1 => acc3_reg(5),
      O => \acc3[4]_i_4__1_n_0\
    );
\acc3[4]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(4),
      I1 => acc3_reg(4),
      O => \acc3[4]_i_5__1_n_0\
    );
\acc3[8]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(11),
      I1 => acc3_reg(11),
      O => \acc3[8]_i_2__1_n_0\
    );
\acc3[8]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(10),
      I1 => acc3_reg(10),
      O => \acc3[8]_i_3__1_n_0\
    );
\acc3[8]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(9),
      I1 => acc3_reg(9),
      O => \acc3[8]_i_4__1_n_0\
    );
\acc3[8]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(8),
      I1 => acc3_reg(8),
      O => \acc3[8]_i_5__1_n_0\
    );
\acc3_d2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(0),
      Q => acc3_d2(0),
      R => '0'
    );
\acc3_d2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(10),
      Q => acc3_d2(10),
      R => '0'
    );
\acc3_d2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(11),
      Q => acc3_d2(11),
      R => '0'
    );
\acc3_d2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(12),
      Q => acc3_d2(12),
      R => '0'
    );
\acc3_d2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(13),
      Q => acc3_d2(13),
      R => '0'
    );
\acc3_d2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(14),
      Q => acc3_d2(14),
      R => '0'
    );
\acc3_d2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(15),
      Q => acc3_d2(15),
      R => '0'
    );
\acc3_d2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(16),
      Q => acc3_d2(16),
      R => '0'
    );
\acc3_d2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(17),
      Q => acc3_d2(17),
      R => '0'
    );
\acc3_d2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(18),
      Q => acc3_d2(18),
      R => '0'
    );
\acc3_d2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(19),
      Q => acc3_d2(19),
      R => '0'
    );
\acc3_d2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(1),
      Q => acc3_d2(1),
      R => '0'
    );
\acc3_d2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(20),
      Q => acc3_d2(20),
      R => '0'
    );
\acc3_d2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(21),
      Q => acc3_d2(21),
      R => '0'
    );
\acc3_d2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(2),
      Q => acc3_d2(2),
      R => '0'
    );
\acc3_d2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(3),
      Q => acc3_d2(3),
      R => '0'
    );
\acc3_d2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(4),
      Q => acc3_d2(4),
      R => '0'
    );
\acc3_d2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(5),
      Q => acc3_d2(5),
      R => '0'
    );
\acc3_d2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(6),
      Q => acc3_d2(6),
      R => '0'
    );
\acc3_d2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(7),
      Q => acc3_d2(7),
      R => '0'
    );
\acc3_d2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(8),
      Q => acc3_d2(8),
      R => '0'
    );
\acc3_d2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(9),
      Q => acc3_d2(9),
      R => '0'
    );
\acc3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1__1_n_7\,
      Q => acc3_reg(0),
      R => '0'
    );
\acc3_reg[0]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc3_reg[0]_i_1__1_n_0\,
      CO(2) => \acc3_reg[0]_i_1__1_n_1\,
      CO(1) => \acc3_reg[0]_i_1__1_n_2\,
      CO(0) => \acc3_reg[0]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(3 downto 0),
      O(3) => \acc3_reg[0]_i_1__1_n_4\,
      O(2) => \acc3_reg[0]_i_1__1_n_5\,
      O(1) => \acc3_reg[0]_i_1__1_n_6\,
      O(0) => \acc3_reg[0]_i_1__1_n_7\,
      S(3) => \acc3[0]_i_2__1_n_0\,
      S(2) => \acc3[0]_i_3__1_n_0\,
      S(1) => \acc3[0]_i_4__1_n_0\,
      S(0) => \acc3[0]_i_5__1_n_0\
    );
\acc3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1__1_n_5\,
      Q => acc3_reg(10),
      R => '0'
    );
\acc3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1__1_n_4\,
      Q => acc3_reg(11),
      R => '0'
    );
\acc3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1__1_n_7\,
      Q => acc3_reg(12),
      R => '0'
    );
\acc3_reg[12]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[8]_i_1__1_n_0\,
      CO(3) => \acc3_reg[12]_i_1__1_n_0\,
      CO(2) => \acc3_reg[12]_i_1__1_n_1\,
      CO(1) => \acc3_reg[12]_i_1__1_n_2\,
      CO(0) => \acc3_reg[12]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(15 downto 12),
      O(3) => \acc3_reg[12]_i_1__1_n_4\,
      O(2) => \acc3_reg[12]_i_1__1_n_5\,
      O(1) => \acc3_reg[12]_i_1__1_n_6\,
      O(0) => \acc3_reg[12]_i_1__1_n_7\,
      S(3) => \acc3[12]_i_2__1_n_0\,
      S(2) => \acc3[12]_i_3__1_n_0\,
      S(1) => \acc3[12]_i_4__1_n_0\,
      S(0) => \acc3[12]_i_5__1_n_0\
    );
\acc3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1__1_n_6\,
      Q => acc3_reg(13),
      R => '0'
    );
\acc3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1__1_n_5\,
      Q => acc3_reg(14),
      R => '0'
    );
\acc3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1__1_n_4\,
      Q => acc3_reg(15),
      R => '0'
    );
\acc3_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1__1_n_7\,
      Q => acc3_reg(16),
      R => '0'
    );
\acc3_reg[16]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[12]_i_1__1_n_0\,
      CO(3) => \acc3_reg[16]_i_1__1_n_0\,
      CO(2) => \acc3_reg[16]_i_1__1_n_1\,
      CO(1) => \acc3_reg[16]_i_1__1_n_2\,
      CO(0) => \acc3_reg[16]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(19 downto 16),
      O(3) => \acc3_reg[16]_i_1__1_n_4\,
      O(2) => \acc3_reg[16]_i_1__1_n_5\,
      O(1) => \acc3_reg[16]_i_1__1_n_6\,
      O(0) => \acc3_reg[16]_i_1__1_n_7\,
      S(3) => \acc3[16]_i_2__1_n_0\,
      S(2) => \acc3[16]_i_3__1_n_0\,
      S(1) => \acc3[16]_i_4__1_n_0\,
      S(0) => \acc3[16]_i_5__1_n_0\
    );
\acc3_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1__1_n_6\,
      Q => acc3_reg(17),
      R => '0'
    );
\acc3_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1__1_n_5\,
      Q => acc3_reg(18),
      R => '0'
    );
\acc3_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1__1_n_4\,
      Q => acc3_reg(19),
      R => '0'
    );
\acc3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1__1_n_6\,
      Q => acc3_reg(1),
      R => '0'
    );
\acc3_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[20]_i_1__1_n_7\,
      Q => acc3_reg(20),
      R => '0'
    );
\acc3_reg[20]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[16]_i_1__1_n_0\,
      CO(3 downto 1) => \NLW_acc3_reg[20]_i_1__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \acc3_reg[20]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => acc2_reg(20),
      O(3 downto 2) => \NLW_acc3_reg[20]_i_1__1_O_UNCONNECTED\(3 downto 2),
      O(1) => \acc3_reg[20]_i_1__1_n_6\,
      O(0) => \acc3_reg[20]_i_1__1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \acc3[20]_i_2__1_n_0\,
      S(0) => \acc3[20]_i_3__1_n_0\
    );
\acc3_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[20]_i_1__1_n_6\,
      Q => acc3_reg(21),
      R => '0'
    );
\acc3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1__1_n_5\,
      Q => acc3_reg(2),
      R => '0'
    );
\acc3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1__1_n_4\,
      Q => acc3_reg(3),
      R => '0'
    );
\acc3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1__1_n_7\,
      Q => acc3_reg(4),
      R => '0'
    );
\acc3_reg[4]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[0]_i_1__1_n_0\,
      CO(3) => \acc3_reg[4]_i_1__1_n_0\,
      CO(2) => \acc3_reg[4]_i_1__1_n_1\,
      CO(1) => \acc3_reg[4]_i_1__1_n_2\,
      CO(0) => \acc3_reg[4]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(7 downto 4),
      O(3) => \acc3_reg[4]_i_1__1_n_4\,
      O(2) => \acc3_reg[4]_i_1__1_n_5\,
      O(1) => \acc3_reg[4]_i_1__1_n_6\,
      O(0) => \acc3_reg[4]_i_1__1_n_7\,
      S(3) => \acc3[4]_i_2__1_n_0\,
      S(2) => \acc3[4]_i_3__1_n_0\,
      S(1) => \acc3[4]_i_4__1_n_0\,
      S(0) => \acc3[4]_i_5__1_n_0\
    );
\acc3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1__1_n_6\,
      Q => acc3_reg(5),
      R => '0'
    );
\acc3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1__1_n_5\,
      Q => acc3_reg(6),
      R => '0'
    );
\acc3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1__1_n_4\,
      Q => acc3_reg(7),
      R => '0'
    );
\acc3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1__1_n_7\,
      Q => acc3_reg(8),
      R => '0'
    );
\acc3_reg[8]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[4]_i_1__1_n_0\,
      CO(3) => \acc3_reg[8]_i_1__1_n_0\,
      CO(2) => \acc3_reg[8]_i_1__1_n_1\,
      CO(1) => \acc3_reg[8]_i_1__1_n_2\,
      CO(0) => \acc3_reg[8]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(11 downto 8),
      O(3) => \acc3_reg[8]_i_1__1_n_4\,
      O(2) => \acc3_reg[8]_i_1__1_n_5\,
      O(1) => \acc3_reg[8]_i_1__1_n_6\,
      O(0) => \acc3_reg[8]_i_1__1_n_7\,
      S(3) => \acc3[8]_i_2__1_n_0\,
      S(2) => \acc3[8]_i_3__1_n_0\,
      S(1) => \acc3[8]_i_4__1_n_0\,
      S(0) => \acc3[8]_i_5__1_n_0\
    );
\acc3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1__1_n_6\,
      Q => acc3_reg(9),
      R => '0'
    );
\diff1[11]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(11),
      I1 => acc3_d2(11),
      O => \diff1[11]_i_2__1_n_0\
    );
\diff1[11]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(10),
      I1 => acc3_d2(10),
      O => \diff1[11]_i_3__1_n_0\
    );
\diff1[11]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(9),
      I1 => acc3_d2(9),
      O => \diff1[11]_i_4__1_n_0\
    );
\diff1[11]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(8),
      I1 => acc3_d2(8),
      O => \diff1[11]_i_5__1_n_0\
    );
\diff1[15]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(15),
      I1 => acc3_d2(15),
      O => \diff1[15]_i_2__1_n_0\
    );
\diff1[15]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(14),
      I1 => acc3_d2(14),
      O => \diff1[15]_i_3__1_n_0\
    );
\diff1[15]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(13),
      I1 => acc3_d2(13),
      O => \diff1[15]_i_4__1_n_0\
    );
\diff1[15]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(12),
      I1 => acc3_d2(12),
      O => \diff1[15]_i_5__1_n_0\
    );
\diff1[19]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(19),
      I1 => acc3_d2(19),
      O => \diff1[19]_i_2__1_n_0\
    );
\diff1[19]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(18),
      I1 => acc3_d2(18),
      O => \diff1[19]_i_3__1_n_0\
    );
\diff1[19]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(17),
      I1 => acc3_d2(17),
      O => \diff1[19]_i_4__1_n_0\
    );
\diff1[19]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(16),
      I1 => acc3_d2(16),
      O => \diff1[19]_i_5__1_n_0\
    );
\diff1[21]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(21),
      I1 => acc3_d2(21),
      O => \diff1[21]_i_2__1_n_0\
    );
\diff1[21]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(20),
      I1 => acc3_d2(20),
      O => \diff1[21]_i_3__1_n_0\
    );
\diff1[3]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(3),
      I1 => acc3_d2(3),
      O => \diff1[3]_i_2__1_n_0\
    );
\diff1[3]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(2),
      I1 => acc3_d2(2),
      O => \diff1[3]_i_3__1_n_0\
    );
\diff1[3]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(1),
      I1 => acc3_d2(1),
      O => \diff1[3]_i_4__1_n_0\
    );
\diff1[3]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(0),
      I1 => acc3_d2(0),
      O => \diff1[3]_i_5__1_n_0\
    );
\diff1[7]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(7),
      I1 => acc3_d2(7),
      O => \diff1[7]_i_2__1_n_0\
    );
\diff1[7]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(6),
      I1 => acc3_d2(6),
      O => \diff1[7]_i_3__1_n_0\
    );
\diff1[7]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(5),
      I1 => acc3_d2(5),
      O => \diff1[7]_i_4__1_n_0\
    );
\diff1[7]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(4),
      I1 => acc3_d2(4),
      O => \diff1[7]_i_5__1_n_0\
    );
\diff1_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(0),
      Q => diff1_d(0),
      R => '0'
    );
\diff1_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(10),
      Q => diff1_d(10),
      R => '0'
    );
\diff1_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(11),
      Q => diff1_d(11),
      R => '0'
    );
\diff1_d_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(12),
      Q => diff1_d(12),
      R => '0'
    );
\diff1_d_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(13),
      Q => diff1_d(13),
      R => '0'
    );
\diff1_d_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(14),
      Q => diff1_d(14),
      R => '0'
    );
\diff1_d_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(15),
      Q => diff1_d(15),
      R => '0'
    );
\diff1_d_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(16),
      Q => diff1_d(16),
      R => '0'
    );
\diff1_d_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(17),
      Q => diff1_d(17),
      R => '0'
    );
\diff1_d_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(18),
      Q => diff1_d(18),
      R => '0'
    );
\diff1_d_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(19),
      Q => diff1_d(19),
      R => '0'
    );
\diff1_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(1),
      Q => diff1_d(1),
      R => '0'
    );
\diff1_d_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(20),
      Q => diff1_d(20),
      R => '0'
    );
\diff1_d_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(21),
      Q => diff1_d(21),
      R => '0'
    );
\diff1_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(2),
      Q => diff1_d(2),
      R => '0'
    );
\diff1_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(3),
      Q => diff1_d(3),
      R => '0'
    );
\diff1_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(4),
      Q => diff1_d(4),
      R => '0'
    );
\diff1_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(5),
      Q => diff1_d(5),
      R => '0'
    );
\diff1_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(6),
      Q => diff1_d(6),
      R => '0'
    );
\diff1_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(7),
      Q => diff1_d(7),
      R => '0'
    );
\diff1_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(8),
      Q => diff1_d(8),
      R => '0'
    );
\diff1_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(9),
      Q => diff1_d(9),
      R => '0'
    );
\diff1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(0),
      Q => diff1(0),
      R => '0'
    );
\diff1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(10),
      Q => diff1(10),
      R => '0'
    );
\diff1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(11),
      Q => diff1(11),
      R => '0'
    );
\diff1_reg[11]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[7]_i_1__1_n_0\,
      CO(3) => \diff1_reg[11]_i_1__1_n_0\,
      CO(2) => \diff1_reg[11]_i_1__1_n_1\,
      CO(1) => \diff1_reg[11]_i_1__1_n_2\,
      CO(0) => \diff1_reg[11]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(11 downto 8),
      O(3 downto 0) => diff102_out(11 downto 8),
      S(3) => \diff1[11]_i_2__1_n_0\,
      S(2) => \diff1[11]_i_3__1_n_0\,
      S(1) => \diff1[11]_i_4__1_n_0\,
      S(0) => \diff1[11]_i_5__1_n_0\
    );
\diff1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(12),
      Q => diff1(12),
      R => '0'
    );
\diff1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(13),
      Q => diff1(13),
      R => '0'
    );
\diff1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(14),
      Q => diff1(14),
      R => '0'
    );
\diff1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(15),
      Q => diff1(15),
      R => '0'
    );
\diff1_reg[15]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[11]_i_1__1_n_0\,
      CO(3) => \diff1_reg[15]_i_1__1_n_0\,
      CO(2) => \diff1_reg[15]_i_1__1_n_1\,
      CO(1) => \diff1_reg[15]_i_1__1_n_2\,
      CO(0) => \diff1_reg[15]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(15 downto 12),
      O(3 downto 0) => diff102_out(15 downto 12),
      S(3) => \diff1[15]_i_2__1_n_0\,
      S(2) => \diff1[15]_i_3__1_n_0\,
      S(1) => \diff1[15]_i_4__1_n_0\,
      S(0) => \diff1[15]_i_5__1_n_0\
    );
\diff1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(16),
      Q => diff1(16),
      R => '0'
    );
\diff1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(17),
      Q => diff1(17),
      R => '0'
    );
\diff1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(18),
      Q => diff1(18),
      R => '0'
    );
\diff1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(19),
      Q => diff1(19),
      R => '0'
    );
\diff1_reg[19]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[15]_i_1__1_n_0\,
      CO(3) => \diff1_reg[19]_i_1__1_n_0\,
      CO(2) => \diff1_reg[19]_i_1__1_n_1\,
      CO(1) => \diff1_reg[19]_i_1__1_n_2\,
      CO(0) => \diff1_reg[19]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(19 downto 16),
      O(3 downto 0) => diff102_out(19 downto 16),
      S(3) => \diff1[19]_i_2__1_n_0\,
      S(2) => \diff1[19]_i_3__1_n_0\,
      S(1) => \diff1[19]_i_4__1_n_0\,
      S(0) => \diff1[19]_i_5__1_n_0\
    );
\diff1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(1),
      Q => diff1(1),
      R => '0'
    );
\diff1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(20),
      Q => diff1(20),
      R => '0'
    );
\diff1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(21),
      Q => diff1(21),
      R => '0'
    );
\diff1_reg[21]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[19]_i_1__1_n_0\,
      CO(3 downto 1) => \NLW_diff1_reg[21]_i_1__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \diff1_reg[21]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => acc3_reg(20),
      O(3 downto 2) => \NLW_diff1_reg[21]_i_1__1_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => diff102_out(21 downto 20),
      S(3 downto 2) => B"00",
      S(1) => \diff1[21]_i_2__1_n_0\,
      S(0) => \diff1[21]_i_3__1_n_0\
    );
\diff1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(2),
      Q => diff1(2),
      R => '0'
    );
\diff1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(3),
      Q => diff1(3),
      R => '0'
    );
\diff1_reg[3]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \diff1_reg[3]_i_1__1_n_0\,
      CO(2) => \diff1_reg[3]_i_1__1_n_1\,
      CO(1) => \diff1_reg[3]_i_1__1_n_2\,
      CO(0) => \diff1_reg[3]_i_1__1_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => acc3_reg(3 downto 0),
      O(3 downto 0) => diff102_out(3 downto 0),
      S(3) => \diff1[3]_i_2__1_n_0\,
      S(2) => \diff1[3]_i_3__1_n_0\,
      S(1) => \diff1[3]_i_4__1_n_0\,
      S(0) => \diff1[3]_i_5__1_n_0\
    );
\diff1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(4),
      Q => diff1(4),
      R => '0'
    );
\diff1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(5),
      Q => diff1(5),
      R => '0'
    );
\diff1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(6),
      Q => diff1(6),
      R => '0'
    );
\diff1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(7),
      Q => diff1(7),
      R => '0'
    );
\diff1_reg[7]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[3]_i_1__1_n_0\,
      CO(3) => \diff1_reg[7]_i_1__1_n_0\,
      CO(2) => \diff1_reg[7]_i_1__1_n_1\,
      CO(1) => \diff1_reg[7]_i_1__1_n_2\,
      CO(0) => \diff1_reg[7]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(7 downto 4),
      O(3 downto 0) => diff102_out(7 downto 4),
      S(3) => \diff1[7]_i_2__1_n_0\,
      S(2) => \diff1[7]_i_3__1_n_0\,
      S(1) => \diff1[7]_i_4__1_n_0\,
      S(0) => \diff1[7]_i_5__1_n_0\
    );
\diff1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(8),
      Q => diff1(8),
      R => '0'
    );
\diff1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(9),
      Q => diff1(9),
      R => '0'
    );
\diff2[11]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(11),
      I1 => diff1_d(11),
      O => \diff2[11]_i_2__1_n_0\
    );
\diff2[11]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(10),
      I1 => diff1_d(10),
      O => \diff2[11]_i_3__1_n_0\
    );
\diff2[11]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(9),
      I1 => diff1_d(9),
      O => \diff2[11]_i_4__1_n_0\
    );
\diff2[11]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(8),
      I1 => diff1_d(8),
      O => \diff2[11]_i_5__1_n_0\
    );
\diff2[15]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(15),
      I1 => diff1_d(15),
      O => \diff2[15]_i_2__1_n_0\
    );
\diff2[15]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(14),
      I1 => diff1_d(14),
      O => \diff2[15]_i_3__1_n_0\
    );
\diff2[15]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(13),
      I1 => diff1_d(13),
      O => \diff2[15]_i_4__1_n_0\
    );
\diff2[15]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(12),
      I1 => diff1_d(12),
      O => \diff2[15]_i_5__1_n_0\
    );
\diff2[19]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(19),
      I1 => diff1_d(19),
      O => \diff2[19]_i_2__1_n_0\
    );
\diff2[19]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(18),
      I1 => diff1_d(18),
      O => \diff2[19]_i_3__1_n_0\
    );
\diff2[19]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(17),
      I1 => diff1_d(17),
      O => \diff2[19]_i_4__1_n_0\
    );
\diff2[19]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(16),
      I1 => diff1_d(16),
      O => \diff2[19]_i_5__1_n_0\
    );
\diff2[21]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(21),
      I1 => diff1_d(21),
      O => \diff2[21]_i_2__1_n_0\
    );
\diff2[21]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(20),
      I1 => diff1_d(20),
      O => \diff2[21]_i_3__1_n_0\
    );
\diff2[3]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(3),
      I1 => diff1_d(3),
      O => \diff2[3]_i_2__1_n_0\
    );
\diff2[3]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(2),
      I1 => diff1_d(2),
      O => \diff2[3]_i_3__1_n_0\
    );
\diff2[3]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(1),
      I1 => diff1_d(1),
      O => \diff2[3]_i_4__1_n_0\
    );
\diff2[3]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(0),
      I1 => diff1_d(0),
      O => \diff2[3]_i_5__1_n_0\
    );
\diff2[7]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(7),
      I1 => diff1_d(7),
      O => \diff2[7]_i_2__1_n_0\
    );
\diff2[7]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(6),
      I1 => diff1_d(6),
      O => \diff2[7]_i_3__1_n_0\
    );
\diff2[7]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(5),
      I1 => diff1_d(5),
      O => \diff2[7]_i_4__1_n_0\
    );
\diff2[7]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(4),
      I1 => diff1_d(4),
      O => \diff2[7]_i_5__1_n_0\
    );
\diff2_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(0),
      Q => diff2_d(0),
      R => '0'
    );
\diff2_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(10),
      Q => diff2_d(10),
      R => '0'
    );
\diff2_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(11),
      Q => diff2_d(11),
      R => '0'
    );
\diff2_d_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(12),
      Q => diff2_d(12),
      R => '0'
    );
\diff2_d_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(13),
      Q => diff2_d(13),
      R => '0'
    );
\diff2_d_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(14),
      Q => diff2_d(14),
      R => '0'
    );
\diff2_d_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(15),
      Q => diff2_d(15),
      R => '0'
    );
\diff2_d_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(16),
      Q => diff2_d(16),
      R => '0'
    );
\diff2_d_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(17),
      Q => diff2_d(17),
      R => '0'
    );
\diff2_d_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(18),
      Q => diff2_d(18),
      R => '0'
    );
\diff2_d_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(19),
      Q => diff2_d(19),
      R => '0'
    );
\diff2_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(1),
      Q => diff2_d(1),
      R => '0'
    );
\diff2_d_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(20),
      Q => diff2_d(20),
      R => '0'
    );
\diff2_d_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(21),
      Q => diff2_d(21),
      R => '0'
    );
\diff2_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(2),
      Q => diff2_d(2),
      R => '0'
    );
\diff2_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(3),
      Q => diff2_d(3),
      R => '0'
    );
\diff2_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(4),
      Q => diff2_d(4),
      R => '0'
    );
\diff2_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(5),
      Q => diff2_d(5),
      R => '0'
    );
\diff2_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(6),
      Q => diff2_d(6),
      R => '0'
    );
\diff2_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(7),
      Q => diff2_d(7),
      R => '0'
    );
\diff2_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(8),
      Q => diff2_d(8),
      R => '0'
    );
\diff2_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(9),
      Q => diff2_d(9),
      R => '0'
    );
\diff2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(0),
      Q => diff2(0),
      R => '0'
    );
\diff2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(10),
      Q => diff2(10),
      R => '0'
    );
\diff2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(11),
      Q => diff2(11),
      R => '0'
    );
\diff2_reg[11]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[7]_i_1__1_n_0\,
      CO(3) => \diff2_reg[11]_i_1__1_n_0\,
      CO(2) => \diff2_reg[11]_i_1__1_n_1\,
      CO(1) => \diff2_reg[11]_i_1__1_n_2\,
      CO(0) => \diff2_reg[11]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(11 downto 8),
      O(3 downto 0) => diff201_out(11 downto 8),
      S(3) => \diff2[11]_i_2__1_n_0\,
      S(2) => \diff2[11]_i_3__1_n_0\,
      S(1) => \diff2[11]_i_4__1_n_0\,
      S(0) => \diff2[11]_i_5__1_n_0\
    );
\diff2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(12),
      Q => diff2(12),
      R => '0'
    );
\diff2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(13),
      Q => diff2(13),
      R => '0'
    );
\diff2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(14),
      Q => diff2(14),
      R => '0'
    );
\diff2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(15),
      Q => diff2(15),
      R => '0'
    );
\diff2_reg[15]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[11]_i_1__1_n_0\,
      CO(3) => \diff2_reg[15]_i_1__1_n_0\,
      CO(2) => \diff2_reg[15]_i_1__1_n_1\,
      CO(1) => \diff2_reg[15]_i_1__1_n_2\,
      CO(0) => \diff2_reg[15]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(15 downto 12),
      O(3 downto 0) => diff201_out(15 downto 12),
      S(3) => \diff2[15]_i_2__1_n_0\,
      S(2) => \diff2[15]_i_3__1_n_0\,
      S(1) => \diff2[15]_i_4__1_n_0\,
      S(0) => \diff2[15]_i_5__1_n_0\
    );
\diff2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(16),
      Q => diff2(16),
      R => '0'
    );
\diff2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(17),
      Q => diff2(17),
      R => '0'
    );
\diff2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(18),
      Q => diff2(18),
      R => '0'
    );
\diff2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(19),
      Q => diff2(19),
      R => '0'
    );
\diff2_reg[19]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[15]_i_1__1_n_0\,
      CO(3) => \diff2_reg[19]_i_1__1_n_0\,
      CO(2) => \diff2_reg[19]_i_1__1_n_1\,
      CO(1) => \diff2_reg[19]_i_1__1_n_2\,
      CO(0) => \diff2_reg[19]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(19 downto 16),
      O(3 downto 0) => diff201_out(19 downto 16),
      S(3) => \diff2[19]_i_2__1_n_0\,
      S(2) => \diff2[19]_i_3__1_n_0\,
      S(1) => \diff2[19]_i_4__1_n_0\,
      S(0) => \diff2[19]_i_5__1_n_0\
    );
\diff2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(1),
      Q => diff2(1),
      R => '0'
    );
\diff2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(20),
      Q => diff2(20),
      R => '0'
    );
\diff2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(21),
      Q => diff2(21),
      R => '0'
    );
\diff2_reg[21]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[19]_i_1__1_n_0\,
      CO(3 downto 1) => \NLW_diff2_reg[21]_i_1__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \diff2_reg[21]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => diff1(20),
      O(3 downto 2) => \NLW_diff2_reg[21]_i_1__1_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => diff201_out(21 downto 20),
      S(3 downto 2) => B"00",
      S(1) => \diff2[21]_i_2__1_n_0\,
      S(0) => \diff2[21]_i_3__1_n_0\
    );
\diff2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(2),
      Q => diff2(2),
      R => '0'
    );
\diff2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(3),
      Q => diff2(3),
      R => '0'
    );
\diff2_reg[3]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \diff2_reg[3]_i_1__1_n_0\,
      CO(2) => \diff2_reg[3]_i_1__1_n_1\,
      CO(1) => \diff2_reg[3]_i_1__1_n_2\,
      CO(0) => \diff2_reg[3]_i_1__1_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => diff1(3 downto 0),
      O(3 downto 0) => diff201_out(3 downto 0),
      S(3) => \diff2[3]_i_2__1_n_0\,
      S(2) => \diff2[3]_i_3__1_n_0\,
      S(1) => \diff2[3]_i_4__1_n_0\,
      S(0) => \diff2[3]_i_5__1_n_0\
    );
\diff2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(4),
      Q => diff2(4),
      R => '0'
    );
\diff2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(5),
      Q => diff2(5),
      R => '0'
    );
\diff2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(6),
      Q => diff2(6),
      R => '0'
    );
\diff2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(7),
      Q => diff2(7),
      R => '0'
    );
\diff2_reg[7]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[3]_i_1__1_n_0\,
      CO(3) => \diff2_reg[7]_i_1__1_n_0\,
      CO(2) => \diff2_reg[7]_i_1__1_n_1\,
      CO(1) => \diff2_reg[7]_i_1__1_n_2\,
      CO(0) => \diff2_reg[7]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(7 downto 4),
      O(3 downto 0) => diff201_out(7 downto 4),
      S(3) => \diff2[7]_i_2__1_n_0\,
      S(2) => \diff2[7]_i_3__1_n_0\,
      S(1) => \diff2[7]_i_4__1_n_0\,
      S(0) => \diff2[7]_i_5__1_n_0\
    );
\diff2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(8),
      Q => diff2(8),
      R => '0'
    );
\diff2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(9),
      Q => diff2(9),
      R => '0'
    );
\diff3[11]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(11),
      I1 => diff2_d(11),
      O => \diff3[11]_i_2__1_n_0\
    );
\diff3[11]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(10),
      I1 => diff2_d(10),
      O => \diff3[11]_i_3__1_n_0\
    );
\diff3[11]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(9),
      I1 => diff2_d(9),
      O => \diff3[11]_i_4__1_n_0\
    );
\diff3[11]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(8),
      I1 => diff2_d(8),
      O => \diff3[11]_i_5__1_n_0\
    );
\diff3[15]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(15),
      I1 => diff2_d(15),
      O => \diff3[15]_i_2__1_n_0\
    );
\diff3[15]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(14),
      I1 => diff2_d(14),
      O => \diff3[15]_i_3__1_n_0\
    );
\diff3[15]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(13),
      I1 => diff2_d(13),
      O => \diff3[15]_i_4__1_n_0\
    );
\diff3[15]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(12),
      I1 => diff2_d(12),
      O => \diff3[15]_i_5__1_n_0\
    );
\diff3[19]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(19),
      I1 => diff2_d(19),
      O => \diff3[19]_i_2__1_n_0\
    );
\diff3[19]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(18),
      I1 => diff2_d(18),
      O => \diff3[19]_i_3__1_n_0\
    );
\diff3[19]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(17),
      I1 => diff2_d(17),
      O => \diff3[19]_i_4__1_n_0\
    );
\diff3[19]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(16),
      I1 => diff2_d(16),
      O => \diff3[19]_i_5__1_n_0\
    );
\diff3[21]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(21),
      I1 => diff2_d(21),
      O => \diff3[21]_i_2__1_n_0\
    );
\diff3[21]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(20),
      I1 => diff2_d(20),
      O => \diff3[21]_i_3__1_n_0\
    );
\diff3[7]_i_10__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(0),
      I1 => diff2_d(0),
      O => \diff3[7]_i_10__1_n_0\
    );
\diff3[7]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(7),
      I1 => diff2_d(7),
      O => \diff3[7]_i_3__1_n_0\
    );
\diff3[7]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(6),
      I1 => diff2_d(6),
      O => \diff3[7]_i_4__1_n_0\
    );
\diff3[7]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(5),
      I1 => diff2_d(5),
      O => \diff3[7]_i_5__1_n_0\
    );
\diff3[7]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(4),
      I1 => diff2_d(4),
      O => \diff3[7]_i_6__1_n_0\
    );
\diff3[7]_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(3),
      I1 => diff2_d(3),
      O => \diff3[7]_i_7__1_n_0\
    );
\diff3[7]_i_8__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(2),
      I1 => diff2_d(2),
      O => \diff3[7]_i_8__1_n_0\
    );
\diff3[7]_i_9__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(1),
      I1 => diff2_d(1),
      O => \diff3[7]_i_9__1_n_0\
    );
\diff3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(10),
      Q => data0(2),
      R => '0'
    );
\diff3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(11),
      Q => data0(3),
      R => '0'
    );
\diff3_reg[11]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[7]_i_1__1_n_0\,
      CO(3) => \diff3_reg[11]_i_1__1_n_0\,
      CO(2) => \diff3_reg[11]_i_1__1_n_1\,
      CO(1) => \diff3_reg[11]_i_1__1_n_2\,
      CO(0) => \diff3_reg[11]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(11 downto 8),
      O(3 downto 0) => diff300_out(11 downto 8),
      S(3) => \diff3[11]_i_2__1_n_0\,
      S(2) => \diff3[11]_i_3__1_n_0\,
      S(1) => \diff3[11]_i_4__1_n_0\,
      S(0) => \diff3[11]_i_5__1_n_0\
    );
\diff3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(12),
      Q => data0(4),
      R => '0'
    );
\diff3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(13),
      Q => data0(5),
      R => '0'
    );
\diff3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(14),
      Q => data0(6),
      R => '0'
    );
\diff3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(15),
      Q => data0(7),
      R => '0'
    );
\diff3_reg[15]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[11]_i_1__1_n_0\,
      CO(3) => \diff3_reg[15]_i_1__1_n_0\,
      CO(2) => \diff3_reg[15]_i_1__1_n_1\,
      CO(1) => \diff3_reg[15]_i_1__1_n_2\,
      CO(0) => \diff3_reg[15]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(15 downto 12),
      O(3 downto 0) => diff300_out(15 downto 12),
      S(3) => \diff3[15]_i_2__1_n_0\,
      S(2) => \diff3[15]_i_3__1_n_0\,
      S(1) => \diff3[15]_i_4__1_n_0\,
      S(0) => \diff3[15]_i_5__1_n_0\
    );
\diff3_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(16),
      Q => data0(8),
      R => '0'
    );
\diff3_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(17),
      Q => data0(9),
      R => '0'
    );
\diff3_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(18),
      Q => data0(10),
      R => '0'
    );
\diff3_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(19),
      Q => data0(11),
      R => '0'
    );
\diff3_reg[19]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[15]_i_1__1_n_0\,
      CO(3) => \diff3_reg[19]_i_1__1_n_0\,
      CO(2) => \diff3_reg[19]_i_1__1_n_1\,
      CO(1) => \diff3_reg[19]_i_1__1_n_2\,
      CO(0) => \diff3_reg[19]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(19 downto 16),
      O(3 downto 0) => diff300_out(19 downto 16),
      S(3) => \diff3[19]_i_2__1_n_0\,
      S(2) => \diff3[19]_i_3__1_n_0\,
      S(1) => \diff3[19]_i_4__1_n_0\,
      S(0) => \diff3[19]_i_5__1_n_0\
    );
\diff3_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(20),
      Q => data0(12),
      R => '0'
    );
\diff3_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(21),
      Q => data0(13),
      R => '0'
    );
\diff3_reg[21]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[19]_i_1__1_n_0\,
      CO(3 downto 1) => \NLW_diff3_reg[21]_i_1__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \diff3_reg[21]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => diff2(20),
      O(3 downto 2) => \NLW_diff3_reg[21]_i_1__1_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => diff300_out(21 downto 20),
      S(3 downto 2) => B"00",
      S(1) => \diff3[21]_i_2__1_n_0\,
      S(0) => \diff3[21]_i_3__1_n_0\
    );
\diff3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(5),
      Q => \diff3_reg_n_0_[5]\,
      R => '0'
    );
\diff3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(6),
      Q => \diff3_reg_n_0_[6]\,
      R => '0'
    );
\diff3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(7),
      Q => \diff3_reg_n_0_[7]\,
      R => '0'
    );
\diff3_reg[7]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[7]_i_2__1_n_0\,
      CO(3) => \diff3_reg[7]_i_1__1_n_0\,
      CO(2) => \diff3_reg[7]_i_1__1_n_1\,
      CO(1) => \diff3_reg[7]_i_1__1_n_2\,
      CO(0) => \diff3_reg[7]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(7 downto 4),
      O(3 downto 1) => diff300_out(7 downto 5),
      O(0) => \NLW_diff3_reg[7]_i_1__1_O_UNCONNECTED\(0),
      S(3) => \diff3[7]_i_3__1_n_0\,
      S(2) => \diff3[7]_i_4__1_n_0\,
      S(1) => \diff3[7]_i_5__1_n_0\,
      S(0) => \diff3[7]_i_6__1_n_0\
    );
\diff3_reg[7]_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \diff3_reg[7]_i_2__1_n_0\,
      CO(2) => \diff3_reg[7]_i_2__1_n_1\,
      CO(1) => \diff3_reg[7]_i_2__1_n_2\,
      CO(0) => \diff3_reg[7]_i_2__1_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => diff2(3 downto 0),
      O(3 downto 0) => \NLW_diff3_reg[7]_i_2__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \diff3[7]_i_7__1_n_0\,
      S(2) => \diff3[7]_i_8__1_n_0\,
      S(1) => \diff3[7]_i_9__1_n_0\,
      S(0) => \diff3[7]_i_10__1_n_0\
    );
\diff3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(8),
      Q => data0(0),
      R => '0'
    );
\diff3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(9),
      Q => data0(1),
      R => '0'
    );
mdat_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => din(0),
      Q => mdat_i,
      R => '0'
    );
\signed_gen[2].ch_s_data[2][15]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ch_data[2]_2\(15),
      O => D(15)
    );
\tdata[0]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAABAA"
    )
        port map (
      I0 => \diff3_reg_n_0_[5]\,
      I1 => \tdata[0]_i_2__1_n_0\,
      I2 => \tdata[0]_i_3__1_n_0\,
      I3 => \tdata[0]_i_4__1_n_0\,
      I4 => \tdata[0]_i_5__1_n_0\,
      O => p_1_in(0)
    );
\tdata[0]_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => data0(11),
      I1 => data0(10),
      I2 => data0(13),
      I3 => data0(12),
      O => \tdata[0]_i_2__1_n_0\
    );
\tdata[0]_i_3__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => data0(1),
      I1 => \diff3_reg_n_0_[6]\,
      I2 => data0(3),
      I3 => data0(4),
      O => \tdata[0]_i_3__1_n_0\
    );
\tdata[0]_i_4__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => data0(9),
      I1 => data0(6),
      I2 => data0(8),
      I3 => data0(7),
      O => \tdata[0]_i_4__1_n_0\
    );
\tdata[0]_i_5__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => data0(0),
      I1 => \diff3_reg_n_0_[7]\,
      I2 => data0(2),
      I3 => data0(5),
      O => \tdata[0]_i_5__1_n_0\
    );
\tdata[15]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => \diff3_reg_n_0_[5]\,
      I1 => \tdata[0]_i_5__1_n_0\,
      I2 => \tdata[0]_i_4__1_n_0\,
      I3 => \tdata[0]_i_3__1_n_0\,
      I4 => \tdata[0]_i_2__1_n_0\,
      I5 => word_clk,
      O => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => p_1_in(0),
      Q => D(0),
      R => '0'
    );
\tdata_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(7),
      Q => D(10),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(8),
      Q => D(11),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(9),
      Q => D(12),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(10),
      Q => D(13),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[14]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(11),
      Q => D(14),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[15]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(12),
      Q => \ch_data[2]_2\(15),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => \diff3_reg_n_0_[6]\,
      Q => D(1),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => \diff3_reg_n_0_[7]\,
      Q => D(2),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(0),
      Q => D(3),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(1),
      Q => D(4),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(2),
      Q => D(5),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(3),
      Q => D(6),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(4),
      Q => D(7),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(5),
      Q => D(8),
      S => \tdata[15]_i_1__1_n_0\
    );
\tdata_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(6),
      Q => D(9),
      S => \tdata[15]_i_1__1_n_0\
    );
\word_clk_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_count_reg(15),
      O => \word_clk_i_3__1_n_0\
    );
\word_clk_i_4__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(13),
      I1 => word_count_reg(14),
      I2 => word_count_reg(12),
      O => \word_clk_i_4__1_n_0\
    );
\word_clk_i_5__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(10),
      I1 => word_count_reg(11),
      I2 => word_count_reg(9),
      O => \word_clk_i_5__1_n_0\
    );
\word_clk_i_6__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(6),
      I1 => word_count_reg(7),
      I2 => word_count_reg(8),
      O => \word_clk_i_6__1_n_0\
    );
\word_clk_i_7__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(3),
      I1 => word_count_reg(4),
      I2 => word_count_reg(5),
      O => \word_clk_i_7__1_n_0\
    );
\word_clk_i_8__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(1),
      I1 => word_count_reg(2),
      I2 => word_count_reg(0),
      O => \word_clk_i_8__1_n_0\
    );
word_clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => word_clk0,
      Q => word_clk,
      R => '0'
    );
\word_clk_reg_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_clk_reg_i_2__1_n_0\,
      CO(3 downto 2) => \NLW_word_clk_reg_i_1__1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => word_clk0,
      CO(0) => \word_clk_reg_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_clk_reg_i_1__1_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \word_clk_i_3__1_n_0\,
      S(0) => \word_clk_i_4__1_n_0\
    );
\word_clk_reg_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \word_clk_reg_i_2__1_n_0\,
      CO(2) => \word_clk_reg_i_2__1_n_1\,
      CO(1) => \word_clk_reg_i_2__1_n_2\,
      CO(0) => \word_clk_reg_i_2__1_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_clk_reg_i_2__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \word_clk_i_5__1_n_0\,
      S(2) => \word_clk_i_6__1_n_0\,
      S(1) => \word_clk_i_7__1_n_0\,
      S(0) => \word_clk_i_8__1_n_0\
    );
\word_count[0]_i_10__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(10),
      I1 => word_count_reg(11),
      I2 => word_count_reg(9),
      O => \word_count[0]_i_10__1_n_0\
    );
\word_count[0]_i_11__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => word_count_reg(6),
      I1 => word_count_reg(7),
      I2 => word_count_reg(8),
      O => \word_count[0]_i_11__1_n_0\
    );
\word_count[0]_i_12__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(3),
      I1 => word_count_reg(4),
      I2 => word_count_reg(5),
      O => \word_count[0]_i_12__1_n_0\
    );
\word_count[0]_i_13__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(1),
      I1 => word_count_reg(2),
      I2 => word_count_reg(0),
      O => \word_count[0]_i_13__1_n_0\
    );
\word_count[0]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_count_reg(15),
      O => \word_count[0]_i_4__1_n_0\
    );
\word_count[0]_i_5__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(13),
      I1 => word_count_reg(14),
      I2 => word_count_reg(12),
      O => \word_count[0]_i_5__1_n_0\
    );
\word_count[0]_i_6__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(3),
      O => \word_count[0]_i_6__1_n_0\
    );
\word_count[0]_i_7__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(2),
      O => \word_count[0]_i_7__1_n_0\
    );
\word_count[0]_i_8__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(1),
      O => \word_count[0]_i_8__1_n_0\
    );
\word_count[0]_i_9__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_count_reg(0),
      O => \word_count[0]_i_9__1_n_0\
    );
\word_count[12]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(15),
      O => \word_count[12]_i_2__1_n_0\
    );
\word_count[12]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(14),
      O => \word_count[12]_i_3__1_n_0\
    );
\word_count[12]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(13),
      O => \word_count[12]_i_4__1_n_0\
    );
\word_count[12]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(12),
      O => \word_count[12]_i_5__1_n_0\
    );
\word_count[4]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(7),
      O => \word_count[4]_i_2__1_n_0\
    );
\word_count[4]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(6),
      O => \word_count[4]_i_3__1_n_0\
    );
\word_count[4]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(5),
      O => \word_count[4]_i_4__1_n_0\
    );
\word_count[4]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(4),
      O => \word_count[4]_i_5__1_n_0\
    );
\word_count[8]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(11),
      O => \word_count[8]_i_2__1_n_0\
    );
\word_count[8]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(10),
      O => \word_count[8]_i_3__1_n_0\
    );
\word_count[8]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(9),
      O => \word_count[8]_i_4__1_n_0\
    );
\word_count[8]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(8),
      O => \word_count[8]_i_5__1_n_0\
    );
\word_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2__1_n_7\,
      Q => word_count_reg(0),
      R => word_count0
    );
\word_count_reg[0]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[0]_i_3__1_n_0\,
      CO(3 downto 2) => \NLW_word_count_reg[0]_i_1__1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => word_count0,
      CO(0) => \word_count_reg[0]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_count_reg[0]_i_1__1_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \word_count[0]_i_4__1_n_0\,
      S(0) => \word_count[0]_i_5__1_n_0\
    );
\word_count_reg[0]_i_2__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \word_count_reg[0]_i_2__1_n_0\,
      CO(2) => \word_count_reg[0]_i_2__1_n_1\,
      CO(1) => \word_count_reg[0]_i_2__1_n_2\,
      CO(0) => \word_count_reg[0]_i_2__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \word_count_reg[0]_i_2__1_n_4\,
      O(2) => \word_count_reg[0]_i_2__1_n_5\,
      O(1) => \word_count_reg[0]_i_2__1_n_6\,
      O(0) => \word_count_reg[0]_i_2__1_n_7\,
      S(3) => \word_count[0]_i_6__1_n_0\,
      S(2) => \word_count[0]_i_7__1_n_0\,
      S(1) => \word_count[0]_i_8__1_n_0\,
      S(0) => \word_count[0]_i_9__1_n_0\
    );
\word_count_reg[0]_i_3__1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \word_count_reg[0]_i_3__1_n_0\,
      CO(2) => \word_count_reg[0]_i_3__1_n_1\,
      CO(1) => \word_count_reg[0]_i_3__1_n_2\,
      CO(0) => \word_count_reg[0]_i_3__1_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_count_reg[0]_i_3__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \word_count[0]_i_10__1_n_0\,
      S(2) => \word_count[0]_i_11__1_n_0\,
      S(1) => \word_count[0]_i_12__1_n_0\,
      S(0) => \word_count[0]_i_13__1_n_0\
    );
\word_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1__1_n_5\,
      Q => word_count_reg(10),
      R => word_count0
    );
\word_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1__1_n_4\,
      Q => word_count_reg(11),
      R => word_count0
    );
\word_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1__1_n_7\,
      Q => word_count_reg(12),
      R => word_count0
    );
\word_count_reg[12]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[8]_i_1__1_n_0\,
      CO(3) => \NLW_word_count_reg[12]_i_1__1_CO_UNCONNECTED\(3),
      CO(2) => \word_count_reg[12]_i_1__1_n_1\,
      CO(1) => \word_count_reg[12]_i_1__1_n_2\,
      CO(0) => \word_count_reg[12]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_count_reg[12]_i_1__1_n_4\,
      O(2) => \word_count_reg[12]_i_1__1_n_5\,
      O(1) => \word_count_reg[12]_i_1__1_n_6\,
      O(0) => \word_count_reg[12]_i_1__1_n_7\,
      S(3) => \word_count[12]_i_2__1_n_0\,
      S(2) => \word_count[12]_i_3__1_n_0\,
      S(1) => \word_count[12]_i_4__1_n_0\,
      S(0) => \word_count[12]_i_5__1_n_0\
    );
\word_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1__1_n_6\,
      Q => word_count_reg(13),
      R => word_count0
    );
\word_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1__1_n_5\,
      Q => word_count_reg(14),
      R => word_count0
    );
\word_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1__1_n_4\,
      Q => word_count_reg(15),
      R => word_count0
    );
\word_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2__1_n_6\,
      Q => word_count_reg(1),
      R => word_count0
    );
\word_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2__1_n_5\,
      Q => word_count_reg(2),
      R => word_count0
    );
\word_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2__1_n_4\,
      Q => word_count_reg(3),
      R => word_count0
    );
\word_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1__1_n_7\,
      Q => word_count_reg(4),
      R => word_count0
    );
\word_count_reg[4]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[0]_i_2__1_n_0\,
      CO(3) => \word_count_reg[4]_i_1__1_n_0\,
      CO(2) => \word_count_reg[4]_i_1__1_n_1\,
      CO(1) => \word_count_reg[4]_i_1__1_n_2\,
      CO(0) => \word_count_reg[4]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_count_reg[4]_i_1__1_n_4\,
      O(2) => \word_count_reg[4]_i_1__1_n_5\,
      O(1) => \word_count_reg[4]_i_1__1_n_6\,
      O(0) => \word_count_reg[4]_i_1__1_n_7\,
      S(3) => \word_count[4]_i_2__1_n_0\,
      S(2) => \word_count[4]_i_3__1_n_0\,
      S(1) => \word_count[4]_i_4__1_n_0\,
      S(0) => \word_count[4]_i_5__1_n_0\
    );
\word_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1__1_n_6\,
      Q => word_count_reg(5),
      R => word_count0
    );
\word_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1__1_n_5\,
      Q => word_count_reg(6),
      R => word_count0
    );
\word_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1__1_n_4\,
      Q => word_count_reg(7),
      R => word_count0
    );
\word_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1__1_n_7\,
      Q => word_count_reg(8),
      R => word_count0
    );
\word_count_reg[8]_i_1__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[4]_i_1__1_n_0\,
      CO(3) => \word_count_reg[8]_i_1__1_n_0\,
      CO(2) => \word_count_reg[8]_i_1__1_n_1\,
      CO(1) => \word_count_reg[8]_i_1__1_n_2\,
      CO(0) => \word_count_reg[8]_i_1__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_count_reg[8]_i_1__1_n_4\,
      O(2) => \word_count_reg[8]_i_1__1_n_5\,
      O(1) => \word_count_reg[8]_i_1__1_n_6\,
      O(0) => \word_count_reg[8]_i_1__1_n_7\,
      S(3) => \word_count[8]_i_2__1_n_0\,
      S(2) => \word_count[8]_i_3__1_n_0\,
      S(1) => \word_count[8]_i_4__1_n_0\,
      S(0) => \word_count[8]_i_5__1_n_0\
    );
\word_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1__1_n_6\,
      Q => word_count_reg(9),
      R => word_count0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_AD7403_0_0_sinc3_2 is
  port (
    D : out STD_LOGIC_VECTOR ( 15 downto 0 );
    din : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zsys_axis_AD7403_0_0_sinc3_2 : entity is "sinc3";
end zsys_axis_AD7403_0_0_sinc3_2;

architecture STRUCTURE of zsys_axis_AD7403_0_0_sinc3_2 is
  signal \acc1[0]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc1[0]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc1[0]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc1[0]_i_5__2_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc1[12]_i_5__2_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc1[16]_i_5__2_n_0\ : STD_LOGIC;
  signal \acc1[20]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc1[20]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc1[4]_i_5__2_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc1[8]_i_5__2_n_0\ : STD_LOGIC;
  signal acc1_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \acc1_reg[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc1_reg[0]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc1_reg[12]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc1_reg[16]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc1_reg[20]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc1_reg[20]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc1_reg[20]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc1_reg[4]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc1_reg[8]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc2[0]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc2[0]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc2[0]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc2[0]_i_5__2_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc2[12]_i_5__2_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc2[16]_i_5__2_n_0\ : STD_LOGIC;
  signal \acc2[20]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc2[20]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc2[4]_i_5__2_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc2[8]_i_5__2_n_0\ : STD_LOGIC;
  signal acc2_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \acc2_reg[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc2_reg[0]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc2_reg[12]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc2_reg[16]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc2_reg[20]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc2_reg[20]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc2_reg[20]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc2_reg[4]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc2_reg[8]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc3[0]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc3[0]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc3[0]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc3[0]_i_5__2_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc3[12]_i_5__2_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc3[16]_i_5__2_n_0\ : STD_LOGIC;
  signal \acc3[20]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc3[20]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc3[4]_i_5__2_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_2__2_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_3__2_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_4__2_n_0\ : STD_LOGIC;
  signal \acc3[8]_i_5__2_n_0\ : STD_LOGIC;
  signal acc3_d2 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal acc3_reg : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \acc3_reg[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc3_reg[0]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc3_reg[12]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc3_reg[16]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc3_reg[20]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc3_reg[20]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc3_reg[20]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc3_reg[4]_i_1__2_n_7\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__2_n_0\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__2_n_1\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__2_n_2\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__2_n_3\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__2_n_4\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__2_n_5\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__2_n_6\ : STD_LOGIC;
  signal \acc3_reg[8]_i_1__2_n_7\ : STD_LOGIC;
  signal \ch_data[3]_3\ : STD_LOGIC_VECTOR ( 15 to 15 );
  signal data0 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal diff1 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal diff102_out : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff1[11]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff1[11]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff1[11]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff1[11]_i_5__2_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff1[15]_i_5__2_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff1[19]_i_5__2_n_0\ : STD_LOGIC;
  signal \diff1[21]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff1[21]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff1[3]_i_5__2_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff1[7]_i_5__2_n_0\ : STD_LOGIC;
  signal diff1_d : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff1_reg[11]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff1_reg[11]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff1_reg[11]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff1_reg[11]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff1_reg[15]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff1_reg[19]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff1_reg[21]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff1_reg[3]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff1_reg[7]_i_1__2_n_3\ : STD_LOGIC;
  signal diff2 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal diff201_out : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff2[11]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff2[11]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff2[11]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff2[11]_i_5__2_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff2[15]_i_5__2_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff2[19]_i_5__2_n_0\ : STD_LOGIC;
  signal \diff2[21]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff2[21]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff2[3]_i_5__2_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff2[7]_i_5__2_n_0\ : STD_LOGIC;
  signal diff2_d : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \diff2_reg[11]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff2_reg[11]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff2_reg[11]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff2_reg[11]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff2_reg[15]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff2_reg[19]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff2_reg[21]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff2_reg[3]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff2_reg[7]_i_1__2_n_3\ : STD_LOGIC;
  signal diff300_out : STD_LOGIC_VECTOR ( 21 downto 5 );
  signal \diff3[11]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff3[11]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff3[11]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff3[11]_i_5__2_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff3[15]_i_5__2_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff3[19]_i_5__2_n_0\ : STD_LOGIC;
  signal \diff3[21]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff3[21]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_10__2_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_3__2_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_4__2_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_5__2_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_6__2_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_7__2_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_8__2_n_0\ : STD_LOGIC;
  signal \diff3[7]_i_9__2_n_0\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff3_reg[11]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff3_reg[15]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff3_reg[19]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff3_reg[21]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1__2_n_0\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1__2_n_1\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1__2_n_2\ : STD_LOGIC;
  signal \diff3_reg[7]_i_1__2_n_3\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2__2_n_0\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2__2_n_1\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2__2_n_2\ : STD_LOGIC;
  signal \diff3_reg[7]_i_2__2_n_3\ : STD_LOGIC;
  signal \diff3_reg_n_0_[5]\ : STD_LOGIC;
  signal \diff3_reg_n_0_[6]\ : STD_LOGIC;
  signal \diff3_reg_n_0_[7]\ : STD_LOGIC;
  signal mdat_i : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \tdata[0]_i_2__2_n_0\ : STD_LOGIC;
  signal \tdata[0]_i_3__2_n_0\ : STD_LOGIC;
  signal \tdata[0]_i_4__2_n_0\ : STD_LOGIC;
  signal \tdata[0]_i_5__2_n_0\ : STD_LOGIC;
  signal \tdata[15]_i_1__2_n_0\ : STD_LOGIC;
  signal word_clk : STD_LOGIC;
  signal word_clk0 : STD_LOGIC;
  signal \word_clk_i_3__2_n_0\ : STD_LOGIC;
  signal \word_clk_i_4__2_n_0\ : STD_LOGIC;
  signal \word_clk_i_5__2_n_0\ : STD_LOGIC;
  signal \word_clk_i_6__2_n_0\ : STD_LOGIC;
  signal \word_clk_i_7__2_n_0\ : STD_LOGIC;
  signal \word_clk_i_8__2_n_0\ : STD_LOGIC;
  signal \word_clk_reg_i_1__2_n_3\ : STD_LOGIC;
  signal \word_clk_reg_i_2__2_n_0\ : STD_LOGIC;
  signal \word_clk_reg_i_2__2_n_1\ : STD_LOGIC;
  signal \word_clk_reg_i_2__2_n_2\ : STD_LOGIC;
  signal \word_clk_reg_i_2__2_n_3\ : STD_LOGIC;
  signal word_count0 : STD_LOGIC;
  signal \word_count[0]_i_10__2_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_11__2_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_12__2_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_13__2_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_4__2_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_5__2_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_6__2_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_7__2_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_8__2_n_0\ : STD_LOGIC;
  signal \word_count[0]_i_9__2_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_2__2_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_3__2_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_4__2_n_0\ : STD_LOGIC;
  signal \word_count[12]_i_5__2_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_2__2_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_3__2_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_4__2_n_0\ : STD_LOGIC;
  signal \word_count[4]_i_5__2_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_2__2_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_3__2_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_4__2_n_0\ : STD_LOGIC;
  signal \word_count[8]_i_5__2_n_0\ : STD_LOGIC;
  signal word_count_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \word_count_reg[0]_i_1__2_n_3\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__2_n_0\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__2_n_1\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__2_n_2\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__2_n_3\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__2_n_4\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__2_n_5\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__2_n_6\ : STD_LOGIC;
  signal \word_count_reg[0]_i_2__2_n_7\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3__2_n_0\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3__2_n_1\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3__2_n_2\ : STD_LOGIC;
  signal \word_count_reg[0]_i_3__2_n_3\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__2_n_1\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__2_n_2\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__2_n_3\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__2_n_4\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__2_n_5\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__2_n_6\ : STD_LOGIC;
  signal \word_count_reg[12]_i_1__2_n_7\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__2_n_1\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__2_n_2\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__2_n_3\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__2_n_4\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__2_n_5\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__2_n_6\ : STD_LOGIC;
  signal \word_count_reg[4]_i_1__2_n_7\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__2_n_0\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__2_n_1\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__2_n_2\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__2_n_3\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__2_n_4\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__2_n_5\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__2_n_6\ : STD_LOGIC;
  signal \word_count_reg[8]_i_1__2_n_7\ : STD_LOGIC;
  signal \NLW_acc1_reg[20]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_acc1_reg[20]_i_1__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_acc2_reg[20]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_acc2_reg[20]_i_1__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_acc3_reg[20]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_acc3_reg[20]_i_1__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff1_reg[21]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_diff1_reg[21]_i_1__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff2_reg[21]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_diff2_reg[21]_i_1__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff3_reg[21]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_diff3_reg[21]_i_1__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_diff3_reg[7]_i_1__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_diff3_reg[7]_i_2__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_clk_reg_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_word_clk_reg_i_1__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_clk_reg_i_2__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_count_reg[0]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_word_count_reg[0]_i_1__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_count_reg[0]_i_3__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_word_count_reg[12]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
\acc1[0]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(3),
      O => \acc1[0]_i_2__2_n_0\
    );
\acc1[0]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(2),
      O => \acc1[0]_i_3__2_n_0\
    );
\acc1[0]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(1),
      O => \acc1[0]_i_4__2_n_0\
    );
\acc1[0]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => acc1_reg(0),
      O => \acc1[0]_i_5__2_n_0\
    );
\acc1[12]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(15),
      O => \acc1[12]_i_2__2_n_0\
    );
\acc1[12]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(14),
      O => \acc1[12]_i_3__2_n_0\
    );
\acc1[12]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(13),
      O => \acc1[12]_i_4__2_n_0\
    );
\acc1[12]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(12),
      O => \acc1[12]_i_5__2_n_0\
    );
\acc1[16]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(19),
      O => \acc1[16]_i_2__2_n_0\
    );
\acc1[16]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(18),
      O => \acc1[16]_i_3__2_n_0\
    );
\acc1[16]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(17),
      O => \acc1[16]_i_4__2_n_0\
    );
\acc1[16]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(16),
      O => \acc1[16]_i_5__2_n_0\
    );
\acc1[20]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(21),
      O => \acc1[20]_i_2__2_n_0\
    );
\acc1[20]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(20),
      O => \acc1[20]_i_3__2_n_0\
    );
\acc1[4]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(7),
      O => \acc1[4]_i_2__2_n_0\
    );
\acc1[4]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(6),
      O => \acc1[4]_i_3__2_n_0\
    );
\acc1[4]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(5),
      O => \acc1[4]_i_4__2_n_0\
    );
\acc1[4]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(4),
      O => \acc1[4]_i_5__2_n_0\
    );
\acc1[8]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(11),
      O => \acc1[8]_i_2__2_n_0\
    );
\acc1[8]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(10),
      O => \acc1[8]_i_3__2_n_0\
    );
\acc1[8]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(9),
      O => \acc1[8]_i_4__2_n_0\
    );
\acc1[8]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => acc1_reg(8),
      O => \acc1[8]_i_5__2_n_0\
    );
\acc1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1__2_n_7\,
      Q => acc1_reg(0),
      R => '0'
    );
\acc1_reg[0]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc1_reg[0]_i_1__2_n_0\,
      CO(2) => \acc1_reg[0]_i_1__2_n_1\,
      CO(1) => \acc1_reg[0]_i_1__2_n_2\,
      CO(0) => \acc1_reg[0]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \acc1_reg[0]_i_1__2_n_4\,
      O(2) => \acc1_reg[0]_i_1__2_n_5\,
      O(1) => \acc1_reg[0]_i_1__2_n_6\,
      O(0) => \acc1_reg[0]_i_1__2_n_7\,
      S(3) => \acc1[0]_i_2__2_n_0\,
      S(2) => \acc1[0]_i_3__2_n_0\,
      S(1) => \acc1[0]_i_4__2_n_0\,
      S(0) => \acc1[0]_i_5__2_n_0\
    );
\acc1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1__2_n_5\,
      Q => acc1_reg(10),
      R => '0'
    );
\acc1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1__2_n_4\,
      Q => acc1_reg(11),
      R => '0'
    );
\acc1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1__2_n_7\,
      Q => acc1_reg(12),
      R => '0'
    );
\acc1_reg[12]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[8]_i_1__2_n_0\,
      CO(3) => \acc1_reg[12]_i_1__2_n_0\,
      CO(2) => \acc1_reg[12]_i_1__2_n_1\,
      CO(1) => \acc1_reg[12]_i_1__2_n_2\,
      CO(0) => \acc1_reg[12]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[12]_i_1__2_n_4\,
      O(2) => \acc1_reg[12]_i_1__2_n_5\,
      O(1) => \acc1_reg[12]_i_1__2_n_6\,
      O(0) => \acc1_reg[12]_i_1__2_n_7\,
      S(3) => \acc1[12]_i_2__2_n_0\,
      S(2) => \acc1[12]_i_3__2_n_0\,
      S(1) => \acc1[12]_i_4__2_n_0\,
      S(0) => \acc1[12]_i_5__2_n_0\
    );
\acc1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1__2_n_6\,
      Q => acc1_reg(13),
      R => '0'
    );
\acc1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1__2_n_5\,
      Q => acc1_reg(14),
      R => '0'
    );
\acc1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[12]_i_1__2_n_4\,
      Q => acc1_reg(15),
      R => '0'
    );
\acc1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1__2_n_7\,
      Q => acc1_reg(16),
      R => '0'
    );
\acc1_reg[16]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[12]_i_1__2_n_0\,
      CO(3) => \acc1_reg[16]_i_1__2_n_0\,
      CO(2) => \acc1_reg[16]_i_1__2_n_1\,
      CO(1) => \acc1_reg[16]_i_1__2_n_2\,
      CO(0) => \acc1_reg[16]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[16]_i_1__2_n_4\,
      O(2) => \acc1_reg[16]_i_1__2_n_5\,
      O(1) => \acc1_reg[16]_i_1__2_n_6\,
      O(0) => \acc1_reg[16]_i_1__2_n_7\,
      S(3) => \acc1[16]_i_2__2_n_0\,
      S(2) => \acc1[16]_i_3__2_n_0\,
      S(1) => \acc1[16]_i_4__2_n_0\,
      S(0) => \acc1[16]_i_5__2_n_0\
    );
\acc1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1__2_n_6\,
      Q => acc1_reg(17),
      R => '0'
    );
\acc1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1__2_n_5\,
      Q => acc1_reg(18),
      R => '0'
    );
\acc1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[16]_i_1__2_n_4\,
      Q => acc1_reg(19),
      R => '0'
    );
\acc1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1__2_n_6\,
      Q => acc1_reg(1),
      R => '0'
    );
\acc1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[20]_i_1__2_n_7\,
      Q => acc1_reg(20),
      R => '0'
    );
\acc1_reg[20]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[16]_i_1__2_n_0\,
      CO(3 downto 1) => \NLW_acc1_reg[20]_i_1__2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \acc1_reg[20]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_acc1_reg[20]_i_1__2_O_UNCONNECTED\(3 downto 2),
      O(1) => \acc1_reg[20]_i_1__2_n_6\,
      O(0) => \acc1_reg[20]_i_1__2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \acc1[20]_i_2__2_n_0\,
      S(0) => \acc1[20]_i_3__2_n_0\
    );
\acc1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[20]_i_1__2_n_6\,
      Q => acc1_reg(21),
      R => '0'
    );
\acc1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1__2_n_5\,
      Q => acc1_reg(2),
      R => '0'
    );
\acc1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[0]_i_1__2_n_4\,
      Q => acc1_reg(3),
      R => '0'
    );
\acc1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1__2_n_7\,
      Q => acc1_reg(4),
      R => '0'
    );
\acc1_reg[4]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[0]_i_1__2_n_0\,
      CO(3) => \acc1_reg[4]_i_1__2_n_0\,
      CO(2) => \acc1_reg[4]_i_1__2_n_1\,
      CO(1) => \acc1_reg[4]_i_1__2_n_2\,
      CO(0) => \acc1_reg[4]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[4]_i_1__2_n_4\,
      O(2) => \acc1_reg[4]_i_1__2_n_5\,
      O(1) => \acc1_reg[4]_i_1__2_n_6\,
      O(0) => \acc1_reg[4]_i_1__2_n_7\,
      S(3) => \acc1[4]_i_2__2_n_0\,
      S(2) => \acc1[4]_i_3__2_n_0\,
      S(1) => \acc1[4]_i_4__2_n_0\,
      S(0) => \acc1[4]_i_5__2_n_0\
    );
\acc1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1__2_n_6\,
      Q => acc1_reg(5),
      R => '0'
    );
\acc1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1__2_n_5\,
      Q => acc1_reg(6),
      R => '0'
    );
\acc1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[4]_i_1__2_n_4\,
      Q => acc1_reg(7),
      R => '0'
    );
\acc1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1__2_n_7\,
      Q => acc1_reg(8),
      R => '0'
    );
\acc1_reg[8]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc1_reg[4]_i_1__2_n_0\,
      CO(3) => \acc1_reg[8]_i_1__2_n_0\,
      CO(2) => \acc1_reg[8]_i_1__2_n_1\,
      CO(1) => \acc1_reg[8]_i_1__2_n_2\,
      CO(0) => \acc1_reg[8]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \acc1_reg[8]_i_1__2_n_4\,
      O(2) => \acc1_reg[8]_i_1__2_n_5\,
      O(1) => \acc1_reg[8]_i_1__2_n_6\,
      O(0) => \acc1_reg[8]_i_1__2_n_7\,
      S(3) => \acc1[8]_i_2__2_n_0\,
      S(2) => \acc1[8]_i_3__2_n_0\,
      S(1) => \acc1[8]_i_4__2_n_0\,
      S(0) => \acc1[8]_i_5__2_n_0\
    );
\acc1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => mdat_i,
      D => \acc1_reg[8]_i_1__2_n_6\,
      Q => acc1_reg(9),
      R => '0'
    );
\acc2[0]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(3),
      I1 => acc2_reg(3),
      O => \acc2[0]_i_2__2_n_0\
    );
\acc2[0]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(2),
      I1 => acc2_reg(2),
      O => \acc2[0]_i_3__2_n_0\
    );
\acc2[0]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(1),
      I1 => acc2_reg(1),
      O => \acc2[0]_i_4__2_n_0\
    );
\acc2[0]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(0),
      I1 => acc2_reg(0),
      O => \acc2[0]_i_5__2_n_0\
    );
\acc2[12]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(15),
      I1 => acc2_reg(15),
      O => \acc2[12]_i_2__2_n_0\
    );
\acc2[12]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(14),
      I1 => acc2_reg(14),
      O => \acc2[12]_i_3__2_n_0\
    );
\acc2[12]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(13),
      I1 => acc2_reg(13),
      O => \acc2[12]_i_4__2_n_0\
    );
\acc2[12]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(12),
      I1 => acc2_reg(12),
      O => \acc2[12]_i_5__2_n_0\
    );
\acc2[16]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(19),
      I1 => acc2_reg(19),
      O => \acc2[16]_i_2__2_n_0\
    );
\acc2[16]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(18),
      I1 => acc2_reg(18),
      O => \acc2[16]_i_3__2_n_0\
    );
\acc2[16]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(17),
      I1 => acc2_reg(17),
      O => \acc2[16]_i_4__2_n_0\
    );
\acc2[16]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(16),
      I1 => acc2_reg(16),
      O => \acc2[16]_i_5__2_n_0\
    );
\acc2[20]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(21),
      I1 => acc1_reg(21),
      O => \acc2[20]_i_2__2_n_0\
    );
\acc2[20]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(20),
      I1 => acc2_reg(20),
      O => \acc2[20]_i_3__2_n_0\
    );
\acc2[4]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(7),
      I1 => acc2_reg(7),
      O => \acc2[4]_i_2__2_n_0\
    );
\acc2[4]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(6),
      I1 => acc2_reg(6),
      O => \acc2[4]_i_3__2_n_0\
    );
\acc2[4]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(5),
      I1 => acc2_reg(5),
      O => \acc2[4]_i_4__2_n_0\
    );
\acc2[4]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(4),
      I1 => acc2_reg(4),
      O => \acc2[4]_i_5__2_n_0\
    );
\acc2[8]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(11),
      I1 => acc2_reg(11),
      O => \acc2[8]_i_2__2_n_0\
    );
\acc2[8]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(10),
      I1 => acc2_reg(10),
      O => \acc2[8]_i_3__2_n_0\
    );
\acc2[8]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(9),
      I1 => acc2_reg(9),
      O => \acc2[8]_i_4__2_n_0\
    );
\acc2[8]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc1_reg(8),
      I1 => acc2_reg(8),
      O => \acc2[8]_i_5__2_n_0\
    );
\acc2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1__2_n_7\,
      Q => acc2_reg(0),
      R => '0'
    );
\acc2_reg[0]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc2_reg[0]_i_1__2_n_0\,
      CO(2) => \acc2_reg[0]_i_1__2_n_1\,
      CO(1) => \acc2_reg[0]_i_1__2_n_2\,
      CO(0) => \acc2_reg[0]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(3 downto 0),
      O(3) => \acc2_reg[0]_i_1__2_n_4\,
      O(2) => \acc2_reg[0]_i_1__2_n_5\,
      O(1) => \acc2_reg[0]_i_1__2_n_6\,
      O(0) => \acc2_reg[0]_i_1__2_n_7\,
      S(3) => \acc2[0]_i_2__2_n_0\,
      S(2) => \acc2[0]_i_3__2_n_0\,
      S(1) => \acc2[0]_i_4__2_n_0\,
      S(0) => \acc2[0]_i_5__2_n_0\
    );
\acc2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1__2_n_5\,
      Q => acc2_reg(10),
      R => '0'
    );
\acc2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1__2_n_4\,
      Q => acc2_reg(11),
      R => '0'
    );
\acc2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1__2_n_7\,
      Q => acc2_reg(12),
      R => '0'
    );
\acc2_reg[12]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[8]_i_1__2_n_0\,
      CO(3) => \acc2_reg[12]_i_1__2_n_0\,
      CO(2) => \acc2_reg[12]_i_1__2_n_1\,
      CO(1) => \acc2_reg[12]_i_1__2_n_2\,
      CO(0) => \acc2_reg[12]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(15 downto 12),
      O(3) => \acc2_reg[12]_i_1__2_n_4\,
      O(2) => \acc2_reg[12]_i_1__2_n_5\,
      O(1) => \acc2_reg[12]_i_1__2_n_6\,
      O(0) => \acc2_reg[12]_i_1__2_n_7\,
      S(3) => \acc2[12]_i_2__2_n_0\,
      S(2) => \acc2[12]_i_3__2_n_0\,
      S(1) => \acc2[12]_i_4__2_n_0\,
      S(0) => \acc2[12]_i_5__2_n_0\
    );
\acc2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1__2_n_6\,
      Q => acc2_reg(13),
      R => '0'
    );
\acc2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1__2_n_5\,
      Q => acc2_reg(14),
      R => '0'
    );
\acc2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[12]_i_1__2_n_4\,
      Q => acc2_reg(15),
      R => '0'
    );
\acc2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1__2_n_7\,
      Q => acc2_reg(16),
      R => '0'
    );
\acc2_reg[16]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[12]_i_1__2_n_0\,
      CO(3) => \acc2_reg[16]_i_1__2_n_0\,
      CO(2) => \acc2_reg[16]_i_1__2_n_1\,
      CO(1) => \acc2_reg[16]_i_1__2_n_2\,
      CO(0) => \acc2_reg[16]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(19 downto 16),
      O(3) => \acc2_reg[16]_i_1__2_n_4\,
      O(2) => \acc2_reg[16]_i_1__2_n_5\,
      O(1) => \acc2_reg[16]_i_1__2_n_6\,
      O(0) => \acc2_reg[16]_i_1__2_n_7\,
      S(3) => \acc2[16]_i_2__2_n_0\,
      S(2) => \acc2[16]_i_3__2_n_0\,
      S(1) => \acc2[16]_i_4__2_n_0\,
      S(0) => \acc2[16]_i_5__2_n_0\
    );
\acc2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1__2_n_6\,
      Q => acc2_reg(17),
      R => '0'
    );
\acc2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1__2_n_5\,
      Q => acc2_reg(18),
      R => '0'
    );
\acc2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[16]_i_1__2_n_4\,
      Q => acc2_reg(19),
      R => '0'
    );
\acc2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1__2_n_6\,
      Q => acc2_reg(1),
      R => '0'
    );
\acc2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[20]_i_1__2_n_7\,
      Q => acc2_reg(20),
      R => '0'
    );
\acc2_reg[20]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[16]_i_1__2_n_0\,
      CO(3 downto 1) => \NLW_acc2_reg[20]_i_1__2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \acc2_reg[20]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => acc1_reg(20),
      O(3 downto 2) => \NLW_acc2_reg[20]_i_1__2_O_UNCONNECTED\(3 downto 2),
      O(1) => \acc2_reg[20]_i_1__2_n_6\,
      O(0) => \acc2_reg[20]_i_1__2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \acc2[20]_i_2__2_n_0\,
      S(0) => \acc2[20]_i_3__2_n_0\
    );
\acc2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[20]_i_1__2_n_6\,
      Q => acc2_reg(21),
      R => '0'
    );
\acc2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1__2_n_5\,
      Q => acc2_reg(2),
      R => '0'
    );
\acc2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[0]_i_1__2_n_4\,
      Q => acc2_reg(3),
      R => '0'
    );
\acc2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1__2_n_7\,
      Q => acc2_reg(4),
      R => '0'
    );
\acc2_reg[4]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[0]_i_1__2_n_0\,
      CO(3) => \acc2_reg[4]_i_1__2_n_0\,
      CO(2) => \acc2_reg[4]_i_1__2_n_1\,
      CO(1) => \acc2_reg[4]_i_1__2_n_2\,
      CO(0) => \acc2_reg[4]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(7 downto 4),
      O(3) => \acc2_reg[4]_i_1__2_n_4\,
      O(2) => \acc2_reg[4]_i_1__2_n_5\,
      O(1) => \acc2_reg[4]_i_1__2_n_6\,
      O(0) => \acc2_reg[4]_i_1__2_n_7\,
      S(3) => \acc2[4]_i_2__2_n_0\,
      S(2) => \acc2[4]_i_3__2_n_0\,
      S(1) => \acc2[4]_i_4__2_n_0\,
      S(0) => \acc2[4]_i_5__2_n_0\
    );
\acc2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1__2_n_6\,
      Q => acc2_reg(5),
      R => '0'
    );
\acc2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1__2_n_5\,
      Q => acc2_reg(6),
      R => '0'
    );
\acc2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[4]_i_1__2_n_4\,
      Q => acc2_reg(7),
      R => '0'
    );
\acc2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1__2_n_7\,
      Q => acc2_reg(8),
      R => '0'
    );
\acc2_reg[8]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc2_reg[4]_i_1__2_n_0\,
      CO(3) => \acc2_reg[8]_i_1__2_n_0\,
      CO(2) => \acc2_reg[8]_i_1__2_n_1\,
      CO(1) => \acc2_reg[8]_i_1__2_n_2\,
      CO(0) => \acc2_reg[8]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc1_reg(11 downto 8),
      O(3) => \acc2_reg[8]_i_1__2_n_4\,
      O(2) => \acc2_reg[8]_i_1__2_n_5\,
      O(1) => \acc2_reg[8]_i_1__2_n_6\,
      O(0) => \acc2_reg[8]_i_1__2_n_7\,
      S(3) => \acc2[8]_i_2__2_n_0\,
      S(2) => \acc2[8]_i_3__2_n_0\,
      S(1) => \acc2[8]_i_4__2_n_0\,
      S(0) => \acc2[8]_i_5__2_n_0\
    );
\acc2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc2_reg[8]_i_1__2_n_6\,
      Q => acc2_reg(9),
      R => '0'
    );
\acc3[0]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(3),
      I1 => acc3_reg(3),
      O => \acc3[0]_i_2__2_n_0\
    );
\acc3[0]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(2),
      I1 => acc3_reg(2),
      O => \acc3[0]_i_3__2_n_0\
    );
\acc3[0]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(1),
      I1 => acc3_reg(1),
      O => \acc3[0]_i_4__2_n_0\
    );
\acc3[0]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(0),
      I1 => acc3_reg(0),
      O => \acc3[0]_i_5__2_n_0\
    );
\acc3[12]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(15),
      I1 => acc3_reg(15),
      O => \acc3[12]_i_2__2_n_0\
    );
\acc3[12]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(14),
      I1 => acc3_reg(14),
      O => \acc3[12]_i_3__2_n_0\
    );
\acc3[12]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(13),
      I1 => acc3_reg(13),
      O => \acc3[12]_i_4__2_n_0\
    );
\acc3[12]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(12),
      I1 => acc3_reg(12),
      O => \acc3[12]_i_5__2_n_0\
    );
\acc3[16]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(19),
      I1 => acc3_reg(19),
      O => \acc3[16]_i_2__2_n_0\
    );
\acc3[16]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(18),
      I1 => acc3_reg(18),
      O => \acc3[16]_i_3__2_n_0\
    );
\acc3[16]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(17),
      I1 => acc3_reg(17),
      O => \acc3[16]_i_4__2_n_0\
    );
\acc3[16]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(16),
      I1 => acc3_reg(16),
      O => \acc3[16]_i_5__2_n_0\
    );
\acc3[20]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(21),
      I1 => acc3_reg(21),
      O => \acc3[20]_i_2__2_n_0\
    );
\acc3[20]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(20),
      I1 => acc3_reg(20),
      O => \acc3[20]_i_3__2_n_0\
    );
\acc3[4]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(7),
      I1 => acc3_reg(7),
      O => \acc3[4]_i_2__2_n_0\
    );
\acc3[4]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(6),
      I1 => acc3_reg(6),
      O => \acc3[4]_i_3__2_n_0\
    );
\acc3[4]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(5),
      I1 => acc3_reg(5),
      O => \acc3[4]_i_4__2_n_0\
    );
\acc3[4]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(4),
      I1 => acc3_reg(4),
      O => \acc3[4]_i_5__2_n_0\
    );
\acc3[8]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(11),
      I1 => acc3_reg(11),
      O => \acc3[8]_i_2__2_n_0\
    );
\acc3[8]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(10),
      I1 => acc3_reg(10),
      O => \acc3[8]_i_3__2_n_0\
    );
\acc3[8]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(9),
      I1 => acc3_reg(9),
      O => \acc3[8]_i_4__2_n_0\
    );
\acc3[8]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => acc2_reg(8),
      I1 => acc3_reg(8),
      O => \acc3[8]_i_5__2_n_0\
    );
\acc3_d2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(0),
      Q => acc3_d2(0),
      R => '0'
    );
\acc3_d2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(10),
      Q => acc3_d2(10),
      R => '0'
    );
\acc3_d2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(11),
      Q => acc3_d2(11),
      R => '0'
    );
\acc3_d2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(12),
      Q => acc3_d2(12),
      R => '0'
    );
\acc3_d2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(13),
      Q => acc3_d2(13),
      R => '0'
    );
\acc3_d2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(14),
      Q => acc3_d2(14),
      R => '0'
    );
\acc3_d2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(15),
      Q => acc3_d2(15),
      R => '0'
    );
\acc3_d2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(16),
      Q => acc3_d2(16),
      R => '0'
    );
\acc3_d2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(17),
      Q => acc3_d2(17),
      R => '0'
    );
\acc3_d2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(18),
      Q => acc3_d2(18),
      R => '0'
    );
\acc3_d2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(19),
      Q => acc3_d2(19),
      R => '0'
    );
\acc3_d2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(1),
      Q => acc3_d2(1),
      R => '0'
    );
\acc3_d2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(20),
      Q => acc3_d2(20),
      R => '0'
    );
\acc3_d2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(21),
      Q => acc3_d2(21),
      R => '0'
    );
\acc3_d2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(2),
      Q => acc3_d2(2),
      R => '0'
    );
\acc3_d2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(3),
      Q => acc3_d2(3),
      R => '0'
    );
\acc3_d2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(4),
      Q => acc3_d2(4),
      R => '0'
    );
\acc3_d2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(5),
      Q => acc3_d2(5),
      R => '0'
    );
\acc3_d2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(6),
      Q => acc3_d2(6),
      R => '0'
    );
\acc3_d2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(7),
      Q => acc3_d2(7),
      R => '0'
    );
\acc3_d2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(8),
      Q => acc3_d2(8),
      R => '0'
    );
\acc3_d2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => acc3_reg(9),
      Q => acc3_d2(9),
      R => '0'
    );
\acc3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1__2_n_7\,
      Q => acc3_reg(0),
      R => '0'
    );
\acc3_reg[0]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \acc3_reg[0]_i_1__2_n_0\,
      CO(2) => \acc3_reg[0]_i_1__2_n_1\,
      CO(1) => \acc3_reg[0]_i_1__2_n_2\,
      CO(0) => \acc3_reg[0]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(3 downto 0),
      O(3) => \acc3_reg[0]_i_1__2_n_4\,
      O(2) => \acc3_reg[0]_i_1__2_n_5\,
      O(1) => \acc3_reg[0]_i_1__2_n_6\,
      O(0) => \acc3_reg[0]_i_1__2_n_7\,
      S(3) => \acc3[0]_i_2__2_n_0\,
      S(2) => \acc3[0]_i_3__2_n_0\,
      S(1) => \acc3[0]_i_4__2_n_0\,
      S(0) => \acc3[0]_i_5__2_n_0\
    );
\acc3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1__2_n_5\,
      Q => acc3_reg(10),
      R => '0'
    );
\acc3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1__2_n_4\,
      Q => acc3_reg(11),
      R => '0'
    );
\acc3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1__2_n_7\,
      Q => acc3_reg(12),
      R => '0'
    );
\acc3_reg[12]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[8]_i_1__2_n_0\,
      CO(3) => \acc3_reg[12]_i_1__2_n_0\,
      CO(2) => \acc3_reg[12]_i_1__2_n_1\,
      CO(1) => \acc3_reg[12]_i_1__2_n_2\,
      CO(0) => \acc3_reg[12]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(15 downto 12),
      O(3) => \acc3_reg[12]_i_1__2_n_4\,
      O(2) => \acc3_reg[12]_i_1__2_n_5\,
      O(1) => \acc3_reg[12]_i_1__2_n_6\,
      O(0) => \acc3_reg[12]_i_1__2_n_7\,
      S(3) => \acc3[12]_i_2__2_n_0\,
      S(2) => \acc3[12]_i_3__2_n_0\,
      S(1) => \acc3[12]_i_4__2_n_0\,
      S(0) => \acc3[12]_i_5__2_n_0\
    );
\acc3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1__2_n_6\,
      Q => acc3_reg(13),
      R => '0'
    );
\acc3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1__2_n_5\,
      Q => acc3_reg(14),
      R => '0'
    );
\acc3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[12]_i_1__2_n_4\,
      Q => acc3_reg(15),
      R => '0'
    );
\acc3_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1__2_n_7\,
      Q => acc3_reg(16),
      R => '0'
    );
\acc3_reg[16]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[12]_i_1__2_n_0\,
      CO(3) => \acc3_reg[16]_i_1__2_n_0\,
      CO(2) => \acc3_reg[16]_i_1__2_n_1\,
      CO(1) => \acc3_reg[16]_i_1__2_n_2\,
      CO(0) => \acc3_reg[16]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(19 downto 16),
      O(3) => \acc3_reg[16]_i_1__2_n_4\,
      O(2) => \acc3_reg[16]_i_1__2_n_5\,
      O(1) => \acc3_reg[16]_i_1__2_n_6\,
      O(0) => \acc3_reg[16]_i_1__2_n_7\,
      S(3) => \acc3[16]_i_2__2_n_0\,
      S(2) => \acc3[16]_i_3__2_n_0\,
      S(1) => \acc3[16]_i_4__2_n_0\,
      S(0) => \acc3[16]_i_5__2_n_0\
    );
\acc3_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1__2_n_6\,
      Q => acc3_reg(17),
      R => '0'
    );
\acc3_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1__2_n_5\,
      Q => acc3_reg(18),
      R => '0'
    );
\acc3_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[16]_i_1__2_n_4\,
      Q => acc3_reg(19),
      R => '0'
    );
\acc3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1__2_n_6\,
      Q => acc3_reg(1),
      R => '0'
    );
\acc3_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[20]_i_1__2_n_7\,
      Q => acc3_reg(20),
      R => '0'
    );
\acc3_reg[20]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[16]_i_1__2_n_0\,
      CO(3 downto 1) => \NLW_acc3_reg[20]_i_1__2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \acc3_reg[20]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => acc2_reg(20),
      O(3 downto 2) => \NLW_acc3_reg[20]_i_1__2_O_UNCONNECTED\(3 downto 2),
      O(1) => \acc3_reg[20]_i_1__2_n_6\,
      O(0) => \acc3_reg[20]_i_1__2_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \acc3[20]_i_2__2_n_0\,
      S(0) => \acc3[20]_i_3__2_n_0\
    );
\acc3_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[20]_i_1__2_n_6\,
      Q => acc3_reg(21),
      R => '0'
    );
\acc3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1__2_n_5\,
      Q => acc3_reg(2),
      R => '0'
    );
\acc3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[0]_i_1__2_n_4\,
      Q => acc3_reg(3),
      R => '0'
    );
\acc3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1__2_n_7\,
      Q => acc3_reg(4),
      R => '0'
    );
\acc3_reg[4]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[0]_i_1__2_n_0\,
      CO(3) => \acc3_reg[4]_i_1__2_n_0\,
      CO(2) => \acc3_reg[4]_i_1__2_n_1\,
      CO(1) => \acc3_reg[4]_i_1__2_n_2\,
      CO(0) => \acc3_reg[4]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(7 downto 4),
      O(3) => \acc3_reg[4]_i_1__2_n_4\,
      O(2) => \acc3_reg[4]_i_1__2_n_5\,
      O(1) => \acc3_reg[4]_i_1__2_n_6\,
      O(0) => \acc3_reg[4]_i_1__2_n_7\,
      S(3) => \acc3[4]_i_2__2_n_0\,
      S(2) => \acc3[4]_i_3__2_n_0\,
      S(1) => \acc3[4]_i_4__2_n_0\,
      S(0) => \acc3[4]_i_5__2_n_0\
    );
\acc3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1__2_n_6\,
      Q => acc3_reg(5),
      R => '0'
    );
\acc3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1__2_n_5\,
      Q => acc3_reg(6),
      R => '0'
    );
\acc3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[4]_i_1__2_n_4\,
      Q => acc3_reg(7),
      R => '0'
    );
\acc3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1__2_n_7\,
      Q => acc3_reg(8),
      R => '0'
    );
\acc3_reg[8]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \acc3_reg[4]_i_1__2_n_0\,
      CO(3) => \acc3_reg[8]_i_1__2_n_0\,
      CO(2) => \acc3_reg[8]_i_1__2_n_1\,
      CO(1) => \acc3_reg[8]_i_1__2_n_2\,
      CO(0) => \acc3_reg[8]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc2_reg(11 downto 8),
      O(3) => \acc3_reg[8]_i_1__2_n_4\,
      O(2) => \acc3_reg[8]_i_1__2_n_5\,
      O(1) => \acc3_reg[8]_i_1__2_n_6\,
      O(0) => \acc3_reg[8]_i_1__2_n_7\,
      S(3) => \acc3[8]_i_2__2_n_0\,
      S(2) => \acc3[8]_i_3__2_n_0\,
      S(1) => \acc3[8]_i_4__2_n_0\,
      S(0) => \acc3[8]_i_5__2_n_0\
    );
\acc3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \acc3_reg[8]_i_1__2_n_6\,
      Q => acc3_reg(9),
      R => '0'
    );
\diff1[11]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(11),
      I1 => acc3_d2(11),
      O => \diff1[11]_i_2__2_n_0\
    );
\diff1[11]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(10),
      I1 => acc3_d2(10),
      O => \diff1[11]_i_3__2_n_0\
    );
\diff1[11]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(9),
      I1 => acc3_d2(9),
      O => \diff1[11]_i_4__2_n_0\
    );
\diff1[11]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(8),
      I1 => acc3_d2(8),
      O => \diff1[11]_i_5__2_n_0\
    );
\diff1[15]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(15),
      I1 => acc3_d2(15),
      O => \diff1[15]_i_2__2_n_0\
    );
\diff1[15]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(14),
      I1 => acc3_d2(14),
      O => \diff1[15]_i_3__2_n_0\
    );
\diff1[15]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(13),
      I1 => acc3_d2(13),
      O => \diff1[15]_i_4__2_n_0\
    );
\diff1[15]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(12),
      I1 => acc3_d2(12),
      O => \diff1[15]_i_5__2_n_0\
    );
\diff1[19]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(19),
      I1 => acc3_d2(19),
      O => \diff1[19]_i_2__2_n_0\
    );
\diff1[19]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(18),
      I1 => acc3_d2(18),
      O => \diff1[19]_i_3__2_n_0\
    );
\diff1[19]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(17),
      I1 => acc3_d2(17),
      O => \diff1[19]_i_4__2_n_0\
    );
\diff1[19]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(16),
      I1 => acc3_d2(16),
      O => \diff1[19]_i_5__2_n_0\
    );
\diff1[21]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(21),
      I1 => acc3_d2(21),
      O => \diff1[21]_i_2__2_n_0\
    );
\diff1[21]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(20),
      I1 => acc3_d2(20),
      O => \diff1[21]_i_3__2_n_0\
    );
\diff1[3]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(3),
      I1 => acc3_d2(3),
      O => \diff1[3]_i_2__2_n_0\
    );
\diff1[3]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(2),
      I1 => acc3_d2(2),
      O => \diff1[3]_i_3__2_n_0\
    );
\diff1[3]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(1),
      I1 => acc3_d2(1),
      O => \diff1[3]_i_4__2_n_0\
    );
\diff1[3]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(0),
      I1 => acc3_d2(0),
      O => \diff1[3]_i_5__2_n_0\
    );
\diff1[7]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(7),
      I1 => acc3_d2(7),
      O => \diff1[7]_i_2__2_n_0\
    );
\diff1[7]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(6),
      I1 => acc3_d2(6),
      O => \diff1[7]_i_3__2_n_0\
    );
\diff1[7]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(5),
      I1 => acc3_d2(5),
      O => \diff1[7]_i_4__2_n_0\
    );
\diff1[7]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => acc3_reg(4),
      I1 => acc3_d2(4),
      O => \diff1[7]_i_5__2_n_0\
    );
\diff1_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(0),
      Q => diff1_d(0),
      R => '0'
    );
\diff1_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(10),
      Q => diff1_d(10),
      R => '0'
    );
\diff1_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(11),
      Q => diff1_d(11),
      R => '0'
    );
\diff1_d_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(12),
      Q => diff1_d(12),
      R => '0'
    );
\diff1_d_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(13),
      Q => diff1_d(13),
      R => '0'
    );
\diff1_d_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(14),
      Q => diff1_d(14),
      R => '0'
    );
\diff1_d_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(15),
      Q => diff1_d(15),
      R => '0'
    );
\diff1_d_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(16),
      Q => diff1_d(16),
      R => '0'
    );
\diff1_d_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(17),
      Q => diff1_d(17),
      R => '0'
    );
\diff1_d_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(18),
      Q => diff1_d(18),
      R => '0'
    );
\diff1_d_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(19),
      Q => diff1_d(19),
      R => '0'
    );
\diff1_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(1),
      Q => diff1_d(1),
      R => '0'
    );
\diff1_d_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(20),
      Q => diff1_d(20),
      R => '0'
    );
\diff1_d_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(21),
      Q => diff1_d(21),
      R => '0'
    );
\diff1_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(2),
      Q => diff1_d(2),
      R => '0'
    );
\diff1_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(3),
      Q => diff1_d(3),
      R => '0'
    );
\diff1_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(4),
      Q => diff1_d(4),
      R => '0'
    );
\diff1_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(5),
      Q => diff1_d(5),
      R => '0'
    );
\diff1_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(6),
      Q => diff1_d(6),
      R => '0'
    );
\diff1_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(7),
      Q => diff1_d(7),
      R => '0'
    );
\diff1_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(8),
      Q => diff1_d(8),
      R => '0'
    );
\diff1_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff1(9),
      Q => diff1_d(9),
      R => '0'
    );
\diff1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(0),
      Q => diff1(0),
      R => '0'
    );
\diff1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(10),
      Q => diff1(10),
      R => '0'
    );
\diff1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(11),
      Q => diff1(11),
      R => '0'
    );
\diff1_reg[11]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[7]_i_1__2_n_0\,
      CO(3) => \diff1_reg[11]_i_1__2_n_0\,
      CO(2) => \diff1_reg[11]_i_1__2_n_1\,
      CO(1) => \diff1_reg[11]_i_1__2_n_2\,
      CO(0) => \diff1_reg[11]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(11 downto 8),
      O(3 downto 0) => diff102_out(11 downto 8),
      S(3) => \diff1[11]_i_2__2_n_0\,
      S(2) => \diff1[11]_i_3__2_n_0\,
      S(1) => \diff1[11]_i_4__2_n_0\,
      S(0) => \diff1[11]_i_5__2_n_0\
    );
\diff1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(12),
      Q => diff1(12),
      R => '0'
    );
\diff1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(13),
      Q => diff1(13),
      R => '0'
    );
\diff1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(14),
      Q => diff1(14),
      R => '0'
    );
\diff1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(15),
      Q => diff1(15),
      R => '0'
    );
\diff1_reg[15]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[11]_i_1__2_n_0\,
      CO(3) => \diff1_reg[15]_i_1__2_n_0\,
      CO(2) => \diff1_reg[15]_i_1__2_n_1\,
      CO(1) => \diff1_reg[15]_i_1__2_n_2\,
      CO(0) => \diff1_reg[15]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(15 downto 12),
      O(3 downto 0) => diff102_out(15 downto 12),
      S(3) => \diff1[15]_i_2__2_n_0\,
      S(2) => \diff1[15]_i_3__2_n_0\,
      S(1) => \diff1[15]_i_4__2_n_0\,
      S(0) => \diff1[15]_i_5__2_n_0\
    );
\diff1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(16),
      Q => diff1(16),
      R => '0'
    );
\diff1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(17),
      Q => diff1(17),
      R => '0'
    );
\diff1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(18),
      Q => diff1(18),
      R => '0'
    );
\diff1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(19),
      Q => diff1(19),
      R => '0'
    );
\diff1_reg[19]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[15]_i_1__2_n_0\,
      CO(3) => \diff1_reg[19]_i_1__2_n_0\,
      CO(2) => \diff1_reg[19]_i_1__2_n_1\,
      CO(1) => \diff1_reg[19]_i_1__2_n_2\,
      CO(0) => \diff1_reg[19]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(19 downto 16),
      O(3 downto 0) => diff102_out(19 downto 16),
      S(3) => \diff1[19]_i_2__2_n_0\,
      S(2) => \diff1[19]_i_3__2_n_0\,
      S(1) => \diff1[19]_i_4__2_n_0\,
      S(0) => \diff1[19]_i_5__2_n_0\
    );
\diff1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(1),
      Q => diff1(1),
      R => '0'
    );
\diff1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(20),
      Q => diff1(20),
      R => '0'
    );
\diff1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(21),
      Q => diff1(21),
      R => '0'
    );
\diff1_reg[21]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[19]_i_1__2_n_0\,
      CO(3 downto 1) => \NLW_diff1_reg[21]_i_1__2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \diff1_reg[21]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => acc3_reg(20),
      O(3 downto 2) => \NLW_diff1_reg[21]_i_1__2_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => diff102_out(21 downto 20),
      S(3 downto 2) => B"00",
      S(1) => \diff1[21]_i_2__2_n_0\,
      S(0) => \diff1[21]_i_3__2_n_0\
    );
\diff1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(2),
      Q => diff1(2),
      R => '0'
    );
\diff1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(3),
      Q => diff1(3),
      R => '0'
    );
\diff1_reg[3]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \diff1_reg[3]_i_1__2_n_0\,
      CO(2) => \diff1_reg[3]_i_1__2_n_1\,
      CO(1) => \diff1_reg[3]_i_1__2_n_2\,
      CO(0) => \diff1_reg[3]_i_1__2_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => acc3_reg(3 downto 0),
      O(3 downto 0) => diff102_out(3 downto 0),
      S(3) => \diff1[3]_i_2__2_n_0\,
      S(2) => \diff1[3]_i_3__2_n_0\,
      S(1) => \diff1[3]_i_4__2_n_0\,
      S(0) => \diff1[3]_i_5__2_n_0\
    );
\diff1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(4),
      Q => diff1(4),
      R => '0'
    );
\diff1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(5),
      Q => diff1(5),
      R => '0'
    );
\diff1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(6),
      Q => diff1(6),
      R => '0'
    );
\diff1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(7),
      Q => diff1(7),
      R => '0'
    );
\diff1_reg[7]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff1_reg[3]_i_1__2_n_0\,
      CO(3) => \diff1_reg[7]_i_1__2_n_0\,
      CO(2) => \diff1_reg[7]_i_1__2_n_1\,
      CO(1) => \diff1_reg[7]_i_1__2_n_2\,
      CO(0) => \diff1_reg[7]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => acc3_reg(7 downto 4),
      O(3 downto 0) => diff102_out(7 downto 4),
      S(3) => \diff1[7]_i_2__2_n_0\,
      S(2) => \diff1[7]_i_3__2_n_0\,
      S(1) => \diff1[7]_i_4__2_n_0\,
      S(0) => \diff1[7]_i_5__2_n_0\
    );
\diff1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(8),
      Q => diff1(8),
      R => '0'
    );
\diff1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff102_out(9),
      Q => diff1(9),
      R => '0'
    );
\diff2[11]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(11),
      I1 => diff1_d(11),
      O => \diff2[11]_i_2__2_n_0\
    );
\diff2[11]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(10),
      I1 => diff1_d(10),
      O => \diff2[11]_i_3__2_n_0\
    );
\diff2[11]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(9),
      I1 => diff1_d(9),
      O => \diff2[11]_i_4__2_n_0\
    );
\diff2[11]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(8),
      I1 => diff1_d(8),
      O => \diff2[11]_i_5__2_n_0\
    );
\diff2[15]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(15),
      I1 => diff1_d(15),
      O => \diff2[15]_i_2__2_n_0\
    );
\diff2[15]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(14),
      I1 => diff1_d(14),
      O => \diff2[15]_i_3__2_n_0\
    );
\diff2[15]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(13),
      I1 => diff1_d(13),
      O => \diff2[15]_i_4__2_n_0\
    );
\diff2[15]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(12),
      I1 => diff1_d(12),
      O => \diff2[15]_i_5__2_n_0\
    );
\diff2[19]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(19),
      I1 => diff1_d(19),
      O => \diff2[19]_i_2__2_n_0\
    );
\diff2[19]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(18),
      I1 => diff1_d(18),
      O => \diff2[19]_i_3__2_n_0\
    );
\diff2[19]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(17),
      I1 => diff1_d(17),
      O => \diff2[19]_i_4__2_n_0\
    );
\diff2[19]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(16),
      I1 => diff1_d(16),
      O => \diff2[19]_i_5__2_n_0\
    );
\diff2[21]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(21),
      I1 => diff1_d(21),
      O => \diff2[21]_i_2__2_n_0\
    );
\diff2[21]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(20),
      I1 => diff1_d(20),
      O => \diff2[21]_i_3__2_n_0\
    );
\diff2[3]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(3),
      I1 => diff1_d(3),
      O => \diff2[3]_i_2__2_n_0\
    );
\diff2[3]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(2),
      I1 => diff1_d(2),
      O => \diff2[3]_i_3__2_n_0\
    );
\diff2[3]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(1),
      I1 => diff1_d(1),
      O => \diff2[3]_i_4__2_n_0\
    );
\diff2[3]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(0),
      I1 => diff1_d(0),
      O => \diff2[3]_i_5__2_n_0\
    );
\diff2[7]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(7),
      I1 => diff1_d(7),
      O => \diff2[7]_i_2__2_n_0\
    );
\diff2[7]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(6),
      I1 => diff1_d(6),
      O => \diff2[7]_i_3__2_n_0\
    );
\diff2[7]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(5),
      I1 => diff1_d(5),
      O => \diff2[7]_i_4__2_n_0\
    );
\diff2[7]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff1(4),
      I1 => diff1_d(4),
      O => \diff2[7]_i_5__2_n_0\
    );
\diff2_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(0),
      Q => diff2_d(0),
      R => '0'
    );
\diff2_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(10),
      Q => diff2_d(10),
      R => '0'
    );
\diff2_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(11),
      Q => diff2_d(11),
      R => '0'
    );
\diff2_d_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(12),
      Q => diff2_d(12),
      R => '0'
    );
\diff2_d_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(13),
      Q => diff2_d(13),
      R => '0'
    );
\diff2_d_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(14),
      Q => diff2_d(14),
      R => '0'
    );
\diff2_d_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(15),
      Q => diff2_d(15),
      R => '0'
    );
\diff2_d_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(16),
      Q => diff2_d(16),
      R => '0'
    );
\diff2_d_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(17),
      Q => diff2_d(17),
      R => '0'
    );
\diff2_d_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(18),
      Q => diff2_d(18),
      R => '0'
    );
\diff2_d_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(19),
      Q => diff2_d(19),
      R => '0'
    );
\diff2_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(1),
      Q => diff2_d(1),
      R => '0'
    );
\diff2_d_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(20),
      Q => diff2_d(20),
      R => '0'
    );
\diff2_d_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(21),
      Q => diff2_d(21),
      R => '0'
    );
\diff2_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(2),
      Q => diff2_d(2),
      R => '0'
    );
\diff2_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(3),
      Q => diff2_d(3),
      R => '0'
    );
\diff2_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(4),
      Q => diff2_d(4),
      R => '0'
    );
\diff2_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(5),
      Q => diff2_d(5),
      R => '0'
    );
\diff2_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(6),
      Q => diff2_d(6),
      R => '0'
    );
\diff2_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(7),
      Q => diff2_d(7),
      R => '0'
    );
\diff2_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(8),
      Q => diff2_d(8),
      R => '0'
    );
\diff2_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff2(9),
      Q => diff2_d(9),
      R => '0'
    );
\diff2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(0),
      Q => diff2(0),
      R => '0'
    );
\diff2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(10),
      Q => diff2(10),
      R => '0'
    );
\diff2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(11),
      Q => diff2(11),
      R => '0'
    );
\diff2_reg[11]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[7]_i_1__2_n_0\,
      CO(3) => \diff2_reg[11]_i_1__2_n_0\,
      CO(2) => \diff2_reg[11]_i_1__2_n_1\,
      CO(1) => \diff2_reg[11]_i_1__2_n_2\,
      CO(0) => \diff2_reg[11]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(11 downto 8),
      O(3 downto 0) => diff201_out(11 downto 8),
      S(3) => \diff2[11]_i_2__2_n_0\,
      S(2) => \diff2[11]_i_3__2_n_0\,
      S(1) => \diff2[11]_i_4__2_n_0\,
      S(0) => \diff2[11]_i_5__2_n_0\
    );
\diff2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(12),
      Q => diff2(12),
      R => '0'
    );
\diff2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(13),
      Q => diff2(13),
      R => '0'
    );
\diff2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(14),
      Q => diff2(14),
      R => '0'
    );
\diff2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(15),
      Q => diff2(15),
      R => '0'
    );
\diff2_reg[15]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[11]_i_1__2_n_0\,
      CO(3) => \diff2_reg[15]_i_1__2_n_0\,
      CO(2) => \diff2_reg[15]_i_1__2_n_1\,
      CO(1) => \diff2_reg[15]_i_1__2_n_2\,
      CO(0) => \diff2_reg[15]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(15 downto 12),
      O(3 downto 0) => diff201_out(15 downto 12),
      S(3) => \diff2[15]_i_2__2_n_0\,
      S(2) => \diff2[15]_i_3__2_n_0\,
      S(1) => \diff2[15]_i_4__2_n_0\,
      S(0) => \diff2[15]_i_5__2_n_0\
    );
\diff2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(16),
      Q => diff2(16),
      R => '0'
    );
\diff2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(17),
      Q => diff2(17),
      R => '0'
    );
\diff2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(18),
      Q => diff2(18),
      R => '0'
    );
\diff2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(19),
      Q => diff2(19),
      R => '0'
    );
\diff2_reg[19]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[15]_i_1__2_n_0\,
      CO(3) => \diff2_reg[19]_i_1__2_n_0\,
      CO(2) => \diff2_reg[19]_i_1__2_n_1\,
      CO(1) => \diff2_reg[19]_i_1__2_n_2\,
      CO(0) => \diff2_reg[19]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(19 downto 16),
      O(3 downto 0) => diff201_out(19 downto 16),
      S(3) => \diff2[19]_i_2__2_n_0\,
      S(2) => \diff2[19]_i_3__2_n_0\,
      S(1) => \diff2[19]_i_4__2_n_0\,
      S(0) => \diff2[19]_i_5__2_n_0\
    );
\diff2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(1),
      Q => diff2(1),
      R => '0'
    );
\diff2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(20),
      Q => diff2(20),
      R => '0'
    );
\diff2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(21),
      Q => diff2(21),
      R => '0'
    );
\diff2_reg[21]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[19]_i_1__2_n_0\,
      CO(3 downto 1) => \NLW_diff2_reg[21]_i_1__2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \diff2_reg[21]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => diff1(20),
      O(3 downto 2) => \NLW_diff2_reg[21]_i_1__2_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => diff201_out(21 downto 20),
      S(3 downto 2) => B"00",
      S(1) => \diff2[21]_i_2__2_n_0\,
      S(0) => \diff2[21]_i_3__2_n_0\
    );
\diff2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(2),
      Q => diff2(2),
      R => '0'
    );
\diff2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(3),
      Q => diff2(3),
      R => '0'
    );
\diff2_reg[3]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \diff2_reg[3]_i_1__2_n_0\,
      CO(2) => \diff2_reg[3]_i_1__2_n_1\,
      CO(1) => \diff2_reg[3]_i_1__2_n_2\,
      CO(0) => \diff2_reg[3]_i_1__2_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => diff1(3 downto 0),
      O(3 downto 0) => diff201_out(3 downto 0),
      S(3) => \diff2[3]_i_2__2_n_0\,
      S(2) => \diff2[3]_i_3__2_n_0\,
      S(1) => \diff2[3]_i_4__2_n_0\,
      S(0) => \diff2[3]_i_5__2_n_0\
    );
\diff2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(4),
      Q => diff2(4),
      R => '0'
    );
\diff2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(5),
      Q => diff2(5),
      R => '0'
    );
\diff2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(6),
      Q => diff2(6),
      R => '0'
    );
\diff2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(7),
      Q => diff2(7),
      R => '0'
    );
\diff2_reg[7]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff2_reg[3]_i_1__2_n_0\,
      CO(3) => \diff2_reg[7]_i_1__2_n_0\,
      CO(2) => \diff2_reg[7]_i_1__2_n_1\,
      CO(1) => \diff2_reg[7]_i_1__2_n_2\,
      CO(0) => \diff2_reg[7]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff1(7 downto 4),
      O(3 downto 0) => diff201_out(7 downto 4),
      S(3) => \diff2[7]_i_2__2_n_0\,
      S(2) => \diff2[7]_i_3__2_n_0\,
      S(1) => \diff2[7]_i_4__2_n_0\,
      S(0) => \diff2[7]_i_5__2_n_0\
    );
\diff2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(8),
      Q => diff2(8),
      R => '0'
    );
\diff2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff201_out(9),
      Q => diff2(9),
      R => '0'
    );
\diff3[11]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(11),
      I1 => diff2_d(11),
      O => \diff3[11]_i_2__2_n_0\
    );
\diff3[11]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(10),
      I1 => diff2_d(10),
      O => \diff3[11]_i_3__2_n_0\
    );
\diff3[11]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(9),
      I1 => diff2_d(9),
      O => \diff3[11]_i_4__2_n_0\
    );
\diff3[11]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(8),
      I1 => diff2_d(8),
      O => \diff3[11]_i_5__2_n_0\
    );
\diff3[15]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(15),
      I1 => diff2_d(15),
      O => \diff3[15]_i_2__2_n_0\
    );
\diff3[15]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(14),
      I1 => diff2_d(14),
      O => \diff3[15]_i_3__2_n_0\
    );
\diff3[15]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(13),
      I1 => diff2_d(13),
      O => \diff3[15]_i_4__2_n_0\
    );
\diff3[15]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(12),
      I1 => diff2_d(12),
      O => \diff3[15]_i_5__2_n_0\
    );
\diff3[19]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(19),
      I1 => diff2_d(19),
      O => \diff3[19]_i_2__2_n_0\
    );
\diff3[19]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(18),
      I1 => diff2_d(18),
      O => \diff3[19]_i_3__2_n_0\
    );
\diff3[19]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(17),
      I1 => diff2_d(17),
      O => \diff3[19]_i_4__2_n_0\
    );
\diff3[19]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(16),
      I1 => diff2_d(16),
      O => \diff3[19]_i_5__2_n_0\
    );
\diff3[21]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(21),
      I1 => diff2_d(21),
      O => \diff3[21]_i_2__2_n_0\
    );
\diff3[21]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(20),
      I1 => diff2_d(20),
      O => \diff3[21]_i_3__2_n_0\
    );
\diff3[7]_i_10__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(0),
      I1 => diff2_d(0),
      O => \diff3[7]_i_10__2_n_0\
    );
\diff3[7]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(7),
      I1 => diff2_d(7),
      O => \diff3[7]_i_3__2_n_0\
    );
\diff3[7]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(6),
      I1 => diff2_d(6),
      O => \diff3[7]_i_4__2_n_0\
    );
\diff3[7]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(5),
      I1 => diff2_d(5),
      O => \diff3[7]_i_5__2_n_0\
    );
\diff3[7]_i_6__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(4),
      I1 => diff2_d(4),
      O => \diff3[7]_i_6__2_n_0\
    );
\diff3[7]_i_7__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(3),
      I1 => diff2_d(3),
      O => \diff3[7]_i_7__2_n_0\
    );
\diff3[7]_i_8__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(2),
      I1 => diff2_d(2),
      O => \diff3[7]_i_8__2_n_0\
    );
\diff3[7]_i_9__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => diff2(1),
      I1 => diff2_d(1),
      O => \diff3[7]_i_9__2_n_0\
    );
\diff3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(10),
      Q => data0(2),
      R => '0'
    );
\diff3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(11),
      Q => data0(3),
      R => '0'
    );
\diff3_reg[11]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[7]_i_1__2_n_0\,
      CO(3) => \diff3_reg[11]_i_1__2_n_0\,
      CO(2) => \diff3_reg[11]_i_1__2_n_1\,
      CO(1) => \diff3_reg[11]_i_1__2_n_2\,
      CO(0) => \diff3_reg[11]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(11 downto 8),
      O(3 downto 0) => diff300_out(11 downto 8),
      S(3) => \diff3[11]_i_2__2_n_0\,
      S(2) => \diff3[11]_i_3__2_n_0\,
      S(1) => \diff3[11]_i_4__2_n_0\,
      S(0) => \diff3[11]_i_5__2_n_0\
    );
\diff3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(12),
      Q => data0(4),
      R => '0'
    );
\diff3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(13),
      Q => data0(5),
      R => '0'
    );
\diff3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(14),
      Q => data0(6),
      R => '0'
    );
\diff3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(15),
      Q => data0(7),
      R => '0'
    );
\diff3_reg[15]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[11]_i_1__2_n_0\,
      CO(3) => \diff3_reg[15]_i_1__2_n_0\,
      CO(2) => \diff3_reg[15]_i_1__2_n_1\,
      CO(1) => \diff3_reg[15]_i_1__2_n_2\,
      CO(0) => \diff3_reg[15]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(15 downto 12),
      O(3 downto 0) => diff300_out(15 downto 12),
      S(3) => \diff3[15]_i_2__2_n_0\,
      S(2) => \diff3[15]_i_3__2_n_0\,
      S(1) => \diff3[15]_i_4__2_n_0\,
      S(0) => \diff3[15]_i_5__2_n_0\
    );
\diff3_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(16),
      Q => data0(8),
      R => '0'
    );
\diff3_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(17),
      Q => data0(9),
      R => '0'
    );
\diff3_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(18),
      Q => data0(10),
      R => '0'
    );
\diff3_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(19),
      Q => data0(11),
      R => '0'
    );
\diff3_reg[19]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[15]_i_1__2_n_0\,
      CO(3) => \diff3_reg[19]_i_1__2_n_0\,
      CO(2) => \diff3_reg[19]_i_1__2_n_1\,
      CO(1) => \diff3_reg[19]_i_1__2_n_2\,
      CO(0) => \diff3_reg[19]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(19 downto 16),
      O(3 downto 0) => diff300_out(19 downto 16),
      S(3) => \diff3[19]_i_2__2_n_0\,
      S(2) => \diff3[19]_i_3__2_n_0\,
      S(1) => \diff3[19]_i_4__2_n_0\,
      S(0) => \diff3[19]_i_5__2_n_0\
    );
\diff3_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(20),
      Q => data0(12),
      R => '0'
    );
\diff3_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(21),
      Q => data0(13),
      R => '0'
    );
\diff3_reg[21]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[19]_i_1__2_n_0\,
      CO(3 downto 1) => \NLW_diff3_reg[21]_i_1__2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \diff3_reg[21]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => diff2(20),
      O(3 downto 2) => \NLW_diff3_reg[21]_i_1__2_O_UNCONNECTED\(3 downto 2),
      O(1 downto 0) => diff300_out(21 downto 20),
      S(3 downto 2) => B"00",
      S(1) => \diff3[21]_i_2__2_n_0\,
      S(0) => \diff3[21]_i_3__2_n_0\
    );
\diff3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(5),
      Q => \diff3_reg_n_0_[5]\,
      R => '0'
    );
\diff3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(6),
      Q => \diff3_reg_n_0_[6]\,
      R => '0'
    );
\diff3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(7),
      Q => \diff3_reg_n_0_[7]\,
      R => '0'
    );
\diff3_reg[7]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \diff3_reg[7]_i_2__2_n_0\,
      CO(3) => \diff3_reg[7]_i_1__2_n_0\,
      CO(2) => \diff3_reg[7]_i_1__2_n_1\,
      CO(1) => \diff3_reg[7]_i_1__2_n_2\,
      CO(0) => \diff3_reg[7]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => diff2(7 downto 4),
      O(3 downto 1) => diff300_out(7 downto 5),
      O(0) => \NLW_diff3_reg[7]_i_1__2_O_UNCONNECTED\(0),
      S(3) => \diff3[7]_i_3__2_n_0\,
      S(2) => \diff3[7]_i_4__2_n_0\,
      S(1) => \diff3[7]_i_5__2_n_0\,
      S(0) => \diff3[7]_i_6__2_n_0\
    );
\diff3_reg[7]_i_2__2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \diff3_reg[7]_i_2__2_n_0\,
      CO(2) => \diff3_reg[7]_i_2__2_n_1\,
      CO(1) => \diff3_reg[7]_i_2__2_n_2\,
      CO(0) => \diff3_reg[7]_i_2__2_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => diff2(3 downto 0),
      O(3 downto 0) => \NLW_diff3_reg[7]_i_2__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \diff3[7]_i_7__2_n_0\,
      S(2) => \diff3[7]_i_8__2_n_0\,
      S(1) => \diff3[7]_i_9__2_n_0\,
      S(0) => \diff3[7]_i_10__2_n_0\
    );
\diff3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(8),
      Q => data0(0),
      R => '0'
    );
\diff3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => diff300_out(9),
      Q => data0(1),
      R => '0'
    );
mdat_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => din(0),
      Q => mdat_i,
      R => '0'
    );
\signed_gen[3].ch_s_data[3][15]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \ch_data[3]_3\(15),
      O => D(15)
    );
\tdata[0]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAABAA"
    )
        port map (
      I0 => \diff3_reg_n_0_[5]\,
      I1 => \tdata[0]_i_2__2_n_0\,
      I2 => \tdata[0]_i_3__2_n_0\,
      I3 => \tdata[0]_i_4__2_n_0\,
      I4 => \tdata[0]_i_5__2_n_0\,
      O => p_1_in(0)
    );
\tdata[0]_i_2__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => data0(11),
      I1 => data0(10),
      I2 => data0(13),
      I3 => data0(12),
      O => \tdata[0]_i_2__2_n_0\
    );
\tdata[0]_i_3__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => data0(1),
      I1 => \diff3_reg_n_0_[6]\,
      I2 => data0(3),
      I3 => data0(4),
      O => \tdata[0]_i_3__2_n_0\
    );
\tdata[0]_i_4__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => data0(9),
      I1 => data0(6),
      I2 => data0(8),
      I3 => data0(7),
      O => \tdata[0]_i_4__2_n_0\
    );
\tdata[0]_i_5__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => data0(0),
      I1 => \diff3_reg_n_0_[7]\,
      I2 => data0(2),
      I3 => data0(5),
      O => \tdata[0]_i_5__2_n_0\
    );
\tdata[15]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => \diff3_reg_n_0_[5]\,
      I1 => \tdata[0]_i_5__2_n_0\,
      I2 => \tdata[0]_i_4__2_n_0\,
      I3 => \tdata[0]_i_3__2_n_0\,
      I4 => \tdata[0]_i_2__2_n_0\,
      I5 => word_clk,
      O => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => p_1_in(0),
      Q => D(0),
      R => '0'
    );
\tdata_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(7),
      Q => D(10),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(8),
      Q => D(11),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(9),
      Q => D(12),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(10),
      Q => D(13),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[14]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(11),
      Q => D(14),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[15]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(12),
      Q => \ch_data[3]_3\(15),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => \diff3_reg_n_0_[6]\,
      Q => D(1),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => \diff3_reg_n_0_[7]\,
      Q => D(2),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(0),
      Q => D(3),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(1),
      Q => D(4),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(2),
      Q => D(5),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(3),
      Q => D(6),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(4),
      Q => D(7),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(5),
      Q => D(8),
      S => \tdata[15]_i_1__2_n_0\
    );
\tdata_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => m_axis_aclk,
      CE => word_clk,
      D => data0(6),
      Q => D(9),
      S => \tdata[15]_i_1__2_n_0\
    );
\word_clk_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_count_reg(15),
      O => \word_clk_i_3__2_n_0\
    );
\word_clk_i_4__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(13),
      I1 => word_count_reg(14),
      I2 => word_count_reg(12),
      O => \word_clk_i_4__2_n_0\
    );
\word_clk_i_5__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(10),
      I1 => word_count_reg(11),
      I2 => word_count_reg(9),
      O => \word_clk_i_5__2_n_0\
    );
\word_clk_i_6__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(6),
      I1 => word_count_reg(7),
      I2 => word_count_reg(8),
      O => \word_clk_i_6__2_n_0\
    );
\word_clk_i_7__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(3),
      I1 => word_count_reg(4),
      I2 => word_count_reg(5),
      O => \word_clk_i_7__2_n_0\
    );
\word_clk_i_8__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(1),
      I1 => word_count_reg(2),
      I2 => word_count_reg(0),
      O => \word_clk_i_8__2_n_0\
    );
word_clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => word_clk0,
      Q => word_clk,
      R => '0'
    );
\word_clk_reg_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_clk_reg_i_2__2_n_0\,
      CO(3 downto 2) => \NLW_word_clk_reg_i_1__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => word_clk0,
      CO(0) => \word_clk_reg_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_clk_reg_i_1__2_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \word_clk_i_3__2_n_0\,
      S(0) => \word_clk_i_4__2_n_0\
    );
\word_clk_reg_i_2__2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \word_clk_reg_i_2__2_n_0\,
      CO(2) => \word_clk_reg_i_2__2_n_1\,
      CO(1) => \word_clk_reg_i_2__2_n_2\,
      CO(0) => \word_clk_reg_i_2__2_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_clk_reg_i_2__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \word_clk_i_5__2_n_0\,
      S(2) => \word_clk_i_6__2_n_0\,
      S(1) => \word_clk_i_7__2_n_0\,
      S(0) => \word_clk_i_8__2_n_0\
    );
\word_count[0]_i_10__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(10),
      I1 => word_count_reg(11),
      I2 => word_count_reg(9),
      O => \word_count[0]_i_10__2_n_0\
    );
\word_count[0]_i_11__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => word_count_reg(6),
      I1 => word_count_reg(7),
      I2 => word_count_reg(8),
      O => \word_count[0]_i_11__2_n_0\
    );
\word_count[0]_i_12__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(3),
      I1 => word_count_reg(4),
      I2 => word_count_reg(5),
      O => \word_count[0]_i_12__2_n_0\
    );
\word_count[0]_i_13__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => word_count_reg(1),
      I1 => word_count_reg(2),
      I2 => word_count_reg(0),
      O => \word_count[0]_i_13__2_n_0\
    );
\word_count[0]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_count_reg(15),
      O => \word_count[0]_i_4__2_n_0\
    );
\word_count[0]_i_5__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => word_count_reg(13),
      I1 => word_count_reg(14),
      I2 => word_count_reg(12),
      O => \word_count[0]_i_5__2_n_0\
    );
\word_count[0]_i_6__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(3),
      O => \word_count[0]_i_6__2_n_0\
    );
\word_count[0]_i_7__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(2),
      O => \word_count[0]_i_7__2_n_0\
    );
\word_count[0]_i_8__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(1),
      O => \word_count[0]_i_8__2_n_0\
    );
\word_count[0]_i_9__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_count_reg(0),
      O => \word_count[0]_i_9__2_n_0\
    );
\word_count[12]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(15),
      O => \word_count[12]_i_2__2_n_0\
    );
\word_count[12]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(14),
      O => \word_count[12]_i_3__2_n_0\
    );
\word_count[12]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(13),
      O => \word_count[12]_i_4__2_n_0\
    );
\word_count[12]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(12),
      O => \word_count[12]_i_5__2_n_0\
    );
\word_count[4]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(7),
      O => \word_count[4]_i_2__2_n_0\
    );
\word_count[4]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(6),
      O => \word_count[4]_i_3__2_n_0\
    );
\word_count[4]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(5),
      O => \word_count[4]_i_4__2_n_0\
    );
\word_count[4]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(4),
      O => \word_count[4]_i_5__2_n_0\
    );
\word_count[8]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(11),
      O => \word_count[8]_i_2__2_n_0\
    );
\word_count[8]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(10),
      O => \word_count[8]_i_3__2_n_0\
    );
\word_count[8]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(9),
      O => \word_count[8]_i_4__2_n_0\
    );
\word_count[8]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => word_count_reg(8),
      O => \word_count[8]_i_5__2_n_0\
    );
\word_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2__2_n_7\,
      Q => word_count_reg(0),
      R => word_count0
    );
\word_count_reg[0]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[0]_i_3__2_n_0\,
      CO(3 downto 2) => \NLW_word_count_reg[0]_i_1__2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => word_count0,
      CO(0) => \word_count_reg[0]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_count_reg[0]_i_1__2_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \word_count[0]_i_4__2_n_0\,
      S(0) => \word_count[0]_i_5__2_n_0\
    );
\word_count_reg[0]_i_2__2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \word_count_reg[0]_i_2__2_n_0\,
      CO(2) => \word_count_reg[0]_i_2__2_n_1\,
      CO(1) => \word_count_reg[0]_i_2__2_n_2\,
      CO(0) => \word_count_reg[0]_i_2__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \word_count_reg[0]_i_2__2_n_4\,
      O(2) => \word_count_reg[0]_i_2__2_n_5\,
      O(1) => \word_count_reg[0]_i_2__2_n_6\,
      O(0) => \word_count_reg[0]_i_2__2_n_7\,
      S(3) => \word_count[0]_i_6__2_n_0\,
      S(2) => \word_count[0]_i_7__2_n_0\,
      S(1) => \word_count[0]_i_8__2_n_0\,
      S(0) => \word_count[0]_i_9__2_n_0\
    );
\word_count_reg[0]_i_3__2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \word_count_reg[0]_i_3__2_n_0\,
      CO(2) => \word_count_reg[0]_i_3__2_n_1\,
      CO(1) => \word_count_reg[0]_i_3__2_n_2\,
      CO(0) => \word_count_reg[0]_i_3__2_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_word_count_reg[0]_i_3__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \word_count[0]_i_10__2_n_0\,
      S(2) => \word_count[0]_i_11__2_n_0\,
      S(1) => \word_count[0]_i_12__2_n_0\,
      S(0) => \word_count[0]_i_13__2_n_0\
    );
\word_count_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1__2_n_5\,
      Q => word_count_reg(10),
      R => word_count0
    );
\word_count_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1__2_n_4\,
      Q => word_count_reg(11),
      R => word_count0
    );
\word_count_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1__2_n_7\,
      Q => word_count_reg(12),
      R => word_count0
    );
\word_count_reg[12]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[8]_i_1__2_n_0\,
      CO(3) => \NLW_word_count_reg[12]_i_1__2_CO_UNCONNECTED\(3),
      CO(2) => \word_count_reg[12]_i_1__2_n_1\,
      CO(1) => \word_count_reg[12]_i_1__2_n_2\,
      CO(0) => \word_count_reg[12]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_count_reg[12]_i_1__2_n_4\,
      O(2) => \word_count_reg[12]_i_1__2_n_5\,
      O(1) => \word_count_reg[12]_i_1__2_n_6\,
      O(0) => \word_count_reg[12]_i_1__2_n_7\,
      S(3) => \word_count[12]_i_2__2_n_0\,
      S(2) => \word_count[12]_i_3__2_n_0\,
      S(1) => \word_count[12]_i_4__2_n_0\,
      S(0) => \word_count[12]_i_5__2_n_0\
    );
\word_count_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1__2_n_6\,
      Q => word_count_reg(13),
      R => word_count0
    );
\word_count_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1__2_n_5\,
      Q => word_count_reg(14),
      R => word_count0
    );
\word_count_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[12]_i_1__2_n_4\,
      Q => word_count_reg(15),
      R => word_count0
    );
\word_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2__2_n_6\,
      Q => word_count_reg(1),
      R => word_count0
    );
\word_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2__2_n_5\,
      Q => word_count_reg(2),
      R => word_count0
    );
\word_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[0]_i_2__2_n_4\,
      Q => word_count_reg(3),
      R => word_count0
    );
\word_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1__2_n_7\,
      Q => word_count_reg(4),
      R => word_count0
    );
\word_count_reg[4]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[0]_i_2__2_n_0\,
      CO(3) => \word_count_reg[4]_i_1__2_n_0\,
      CO(2) => \word_count_reg[4]_i_1__2_n_1\,
      CO(1) => \word_count_reg[4]_i_1__2_n_2\,
      CO(0) => \word_count_reg[4]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_count_reg[4]_i_1__2_n_4\,
      O(2) => \word_count_reg[4]_i_1__2_n_5\,
      O(1) => \word_count_reg[4]_i_1__2_n_6\,
      O(0) => \word_count_reg[4]_i_1__2_n_7\,
      S(3) => \word_count[4]_i_2__2_n_0\,
      S(2) => \word_count[4]_i_3__2_n_0\,
      S(1) => \word_count[4]_i_4__2_n_0\,
      S(0) => \word_count[4]_i_5__2_n_0\
    );
\word_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1__2_n_6\,
      Q => word_count_reg(5),
      R => word_count0
    );
\word_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1__2_n_5\,
      Q => word_count_reg(6),
      R => word_count0
    );
\word_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[4]_i_1__2_n_4\,
      Q => word_count_reg(7),
      R => word_count0
    );
\word_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1__2_n_7\,
      Q => word_count_reg(8),
      R => word_count0
    );
\word_count_reg[8]_i_1__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_count_reg[4]_i_1__2_n_0\,
      CO(3) => \word_count_reg[8]_i_1__2_n_0\,
      CO(2) => \word_count_reg[8]_i_1__2_n_1\,
      CO(1) => \word_count_reg[8]_i_1__2_n_2\,
      CO(0) => \word_count_reg[8]_i_1__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_count_reg[8]_i_1__2_n_4\,
      O(2) => \word_count_reg[8]_i_1__2_n_5\,
      O(1) => \word_count_reg[8]_i_1__2_n_6\,
      O(0) => \word_count_reg[8]_i_1__2_n_7\,
      S(3) => \word_count[8]_i_2__2_n_0\,
      S(2) => \word_count[8]_i_3__2_n_0\,
      S(1) => \word_count[8]_i_4__2_n_0\,
      S(0) => \word_count[8]_i_5__2_n_0\
    );
\word_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D => \word_count_reg[8]_i_1__2_n_6\,
      Q => word_count_reg(9),
      R => word_count0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_AD7403_0_0_axis_AD7403_v1_0 is
  port (
    update : out STD_LOGIC;
    clkout : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zsys_axis_AD7403_0_0_axis_AD7403_v1_0 : entity is "axis_AD7403_v1_0";
end zsys_axis_AD7403_0_0_axis_AD7403_v1_0;

architecture STRUCTURE of zsys_axis_AD7403_0_0_axis_AD7403_v1_0 is
  signal \ch_data[0]_0\ : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \ch_data[1]_1\ : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \ch_data[2]_2\ : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \ch_data[3]_3\ : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \channels_gen[1].ch_inst_n_0\ : STD_LOGIC;
  signal \channels_gen[2].ch_inst_n_0\ : STD_LOGIC;
  signal \channels_gen[3].ch_inst_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 15 to 15 );
  signal NLW_mclk_ODDR_inst_R_UNCONNECTED : STD_LOGIC;
  signal NLW_mclk_ODDR_inst_S_UNCONNECTED : STD_LOGIC;
  attribute \__SRVAL\ : string;
  attribute \__SRVAL\ of mclk_ODDR_inst : label is "TRUE";
  attribute box_type : string;
  attribute box_type of mclk_ODDR_inst : label is "PRIMITIVE";
begin
\channels_gen[0].ch_inst\: entity work.zsys_axis_AD7403_0_0_sinc3
     port map (
      D(15) => p_0_in(15),
      D(14 downto 0) => \ch_data[0]_0\(14 downto 0),
      din(0) => din(0),
      m_axis_aclk => m_axis_aclk,
      update => update
    );
\channels_gen[1].ch_inst\: entity work.zsys_axis_AD7403_0_0_sinc3_0
     port map (
      D(15) => \channels_gen[1].ch_inst_n_0\,
      D(14 downto 0) => \ch_data[1]_1\(14 downto 0),
      din(0) => din(1),
      m_axis_aclk => m_axis_aclk
    );
\channels_gen[2].ch_inst\: entity work.zsys_axis_AD7403_0_0_sinc3_1
     port map (
      D(15) => \channels_gen[2].ch_inst_n_0\,
      D(14 downto 0) => \ch_data[2]_2\(14 downto 0),
      din(0) => din(2),
      m_axis_aclk => m_axis_aclk
    );
\channels_gen[3].ch_inst\: entity work.zsys_axis_AD7403_0_0_sinc3_2
     port map (
      D(15) => \channels_gen[3].ch_inst_n_0\,
      D(14 downto 0) => \ch_data[3]_3\(14 downto 0),
      din(0) => din(3),
      m_axis_aclk => m_axis_aclk
    );
mclk_ODDR_inst: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => m_axis_aclk,
      CE => '1',
      D1 => '0',
      D2 => '1',
      Q => clkout,
      R => NLW_mclk_ODDR_inst_R_UNCONNECTED,
      S => NLW_mclk_ODDR_inst_S_UNCONNECTED
    );
\signed_gen[0].ch_s_data_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(0),
      Q => m_axis_tdata(0),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][10]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(10),
      Q => m_axis_tdata(10),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][11]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(11),
      Q => m_axis_tdata(11),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][12]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(12),
      Q => m_axis_tdata(12),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][13]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(13),
      Q => m_axis_tdata(13),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][14]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(14),
      Q => m_axis_tdata(14),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][15]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => p_0_in(15),
      Q => m_axis_tdata(15),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][1]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(1),
      Q => m_axis_tdata(1),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][2]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(2),
      Q => m_axis_tdata(2),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][3]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(3),
      Q => m_axis_tdata(3),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][4]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(4),
      Q => m_axis_tdata(4),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][5]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(5),
      Q => m_axis_tdata(5),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][6]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(6),
      Q => m_axis_tdata(6),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][7]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(7),
      Q => m_axis_tdata(7),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][8]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(8),
      Q => m_axis_tdata(8),
      R => '0'
    );
\signed_gen[0].ch_s_data_reg[0][9]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[0]_0\(9),
      Q => m_axis_tdata(9),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(0),
      Q => m_axis_tdata(16),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][10]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(10),
      Q => m_axis_tdata(26),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][11]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(11),
      Q => m_axis_tdata(27),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][12]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(12),
      Q => m_axis_tdata(28),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][13]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(13),
      Q => m_axis_tdata(29),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][14]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(14),
      Q => m_axis_tdata(30),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][15]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \channels_gen[1].ch_inst_n_0\,
      Q => m_axis_tdata(31),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(1),
      Q => m_axis_tdata(17),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(2),
      Q => m_axis_tdata(18),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(3),
      Q => m_axis_tdata(19),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(4),
      Q => m_axis_tdata(20),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(5),
      Q => m_axis_tdata(21),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(6),
      Q => m_axis_tdata(22),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][7]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(7),
      Q => m_axis_tdata(23),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][8]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(8),
      Q => m_axis_tdata(24),
      R => '0'
    );
\signed_gen[1].ch_s_data_reg[1][9]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[1]_1\(9),
      Q => m_axis_tdata(25),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][0]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(0),
      Q => m_axis_tdata(32),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][10]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(10),
      Q => m_axis_tdata(42),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][11]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(11),
      Q => m_axis_tdata(43),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][12]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(12),
      Q => m_axis_tdata(44),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][13]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(13),
      Q => m_axis_tdata(45),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][14]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(14),
      Q => m_axis_tdata(46),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][15]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \channels_gen[2].ch_inst_n_0\,
      Q => m_axis_tdata(47),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][1]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(1),
      Q => m_axis_tdata(33),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][2]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(2),
      Q => m_axis_tdata(34),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][3]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(3),
      Q => m_axis_tdata(35),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][4]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(4),
      Q => m_axis_tdata(36),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][5]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(5),
      Q => m_axis_tdata(37),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][6]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(6),
      Q => m_axis_tdata(38),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][7]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(7),
      Q => m_axis_tdata(39),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][8]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(8),
      Q => m_axis_tdata(40),
      R => '0'
    );
\signed_gen[2].ch_s_data_reg[2][9]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[2]_2\(9),
      Q => m_axis_tdata(41),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][0]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(0),
      Q => m_axis_tdata(48),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][10]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(10),
      Q => m_axis_tdata(58),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][11]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(11),
      Q => m_axis_tdata(59),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][12]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(12),
      Q => m_axis_tdata(60),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][13]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(13),
      Q => m_axis_tdata(61),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][14]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(14),
      Q => m_axis_tdata(62),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][15]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \channels_gen[3].ch_inst_n_0\,
      Q => m_axis_tdata(63),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][1]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(1),
      Q => m_axis_tdata(49),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][2]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(2),
      Q => m_axis_tdata(50),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][3]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(3),
      Q => m_axis_tdata(51),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][4]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(4),
      Q => m_axis_tdata(52),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][5]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(5),
      Q => m_axis_tdata(53),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][6]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(6),
      Q => m_axis_tdata(54),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][7]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(7),
      Q => m_axis_tdata(55),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][8]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(8),
      Q => m_axis_tdata(56),
      R => '0'
    );
\signed_gen[3].ch_s_data_reg[3][9]\: unisim.vcomponents.FDRE
     port map (
      C => m_axis_aclk,
      CE => '1',
      D => \ch_data[3]_3\(9),
      Q => m_axis_tdata(57),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_AD7403_0_0 is
  port (
    din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clkout : out STD_LOGIC;
    update : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tready : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of zsys_axis_AD7403_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of zsys_axis_AD7403_0_0 : entity is "zsys_axis_AD7403_0_0,axis_AD7403_v1_0,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of zsys_axis_AD7403_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of zsys_axis_AD7403_0_0 : entity is "axis_AD7403_v1_0,Vivado 2017.1_sdx";
end zsys_axis_AD7403_0_0;

architecture STRUCTURE of zsys_axis_AD7403_0_0 is
  signal \^update\ : STD_LOGIC;
begin
  m_axis_tvalid <= \^update\;
  update <= \^update\;
U0: entity work.zsys_axis_AD7403_0_0_axis_AD7403_v1_0
     port map (
      clkout => clkout,
      din(3 downto 0) => din(3 downto 0),
      m_axis_aclk => m_axis_aclk,
      m_axis_tdata(63 downto 0) => m_axis_tdata(63 downto 0),
      update => \^update\
    );
end STRUCTURE;
