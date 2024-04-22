-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Wed Jun  6 11:50:21 2018
-- Host        : hp-laptop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_LoadingBarController_0_0_sim_netlist.vhdl
-- Design      : design_1_LoadingBarController_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_LoadingBarController_v1_0_S00_AXI is
  port (
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \led[15]\ : out STD_LOGIC_VECTOR ( 13 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_LoadingBarController_v1_0_S00_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_LoadingBarController_v1_0_S00_AXI is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_araddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_araddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready_i_1_n_0 : STD_LOGIC;
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready_i_1_n_0 : STD_LOGIC;
  signal axi_awready_i_2_n_0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[31]_i_1_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 7 );
  signal p_1_in_0 : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal reg_data_out : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal s_counter : STD_LOGIC;
  signal \s_counter[3]_i_2_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__0_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__0_n_1\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__0_n_2\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__0_n_3\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__1_i_5_n_3\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__1_n_0\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__1_n_1\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__1_n_2\ : STD_LOGIC;
  signal \s_counter_pulse1_carry__1_n_3\ : STD_LOGIC;
  signal s_counter_pulse1_carry_i_1_n_0 : STD_LOGIC;
  signal s_counter_pulse1_carry_i_2_n_0 : STD_LOGIC;
  signal s_counter_pulse1_carry_i_3_n_0 : STD_LOGIC;
  signal s_counter_pulse1_carry_i_4_n_0 : STD_LOGIC;
  signal s_counter_pulse1_carry_i_5_n_0 : STD_LOGIC;
  signal s_counter_pulse1_carry_i_6_n_0 : STD_LOGIC;
  signal s_counter_pulse1_carry_i_7_n_0 : STD_LOGIC;
  signal s_counter_pulse1_carry_i_8_n_0 : STD_LOGIC;
  signal s_counter_pulse1_carry_n_0 : STD_LOGIC;
  signal s_counter_pulse1_carry_n_1 : STD_LOGIC;
  signal s_counter_pulse1_carry_n_2 : STD_LOGIC;
  signal s_counter_pulse1_carry_n_3 : STD_LOGIC;
  signal s_counter_pulse2 : STD_LOGIC_VECTOR ( 22 downto 1 );
  signal \s_counter_pulse2_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__0_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__0_n_1\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__0_n_2\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__0_n_3\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__1_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__1_n_1\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__1_n_2\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__1_n_3\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__2_i_5_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__2_i_6_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__2_i_7_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__2_i_8_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__2_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__2_n_1\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__2_n_2\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__2_n_3\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__3_i_1_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__3_i_2_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__3_i_3_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__3_i_4_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__3_i_5_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__3_i_6_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__3_i_7_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__3_i_8_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__3_n_0\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__3_n_1\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__3_n_2\ : STD_LOGIC;
  signal \s_counter_pulse2_carry__3_n_3\ : STD_LOGIC;
  signal s_counter_pulse2_carry_i_1_n_0 : STD_LOGIC;
  signal s_counter_pulse2_carry_i_2_n_0 : STD_LOGIC;
  signal s_counter_pulse2_carry_i_3_n_0 : STD_LOGIC;
  signal s_counter_pulse2_carry_i_4_n_0 : STD_LOGIC;
  signal s_counter_pulse2_carry_i_5_n_0 : STD_LOGIC;
  signal s_counter_pulse2_carry_i_6_n_0 : STD_LOGIC;
  signal s_counter_pulse2_carry_i_7_n_0 : STD_LOGIC;
  signal s_counter_pulse2_carry_i_8_n_0 : STD_LOGIC;
  signal s_counter_pulse2_carry_i_9_n_0 : STD_LOGIC;
  signal s_counter_pulse2_carry_n_0 : STD_LOGIC;
  signal s_counter_pulse2_carry_n_1 : STD_LOGIC;
  signal s_counter_pulse2_carry_n_2 : STD_LOGIC;
  signal s_counter_pulse2_carry_n_3 : STD_LOGIC;
  signal \s_counter_pulse[0]_i_1_n_0\ : STD_LOGIC;
  signal \s_counter_pulse[0]_i_3_n_0\ : STD_LOGIC;
  signal s_counter_pulse_reg : STD_LOGIC_VECTOR ( 20 downto 0 );
  signal \s_counter_pulse_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \s_counter_pulse_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \s_counter_pulse_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \s_counter_pulse_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \s_counter_pulse_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \s_counter_pulse_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \s_counter_pulse_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \s_counter_pulse_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \s_counter_pulse_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \s_counter_pulse_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \s_counter_pulse_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \s_counter_pulse_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \s_counter_pulse_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \s_counter_pulse_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \s_counter_pulse_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \s_counter_pulse_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \s_counter_pulse_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \s_counter_pulse_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \s_counter_pulse_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \s_counter_pulse_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \s_counter_pulse_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \s_counter_pulse_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \s_counter_pulse_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \s_counter_pulse_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \s_counter_pulse_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \s_counter_pulse_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \s_counter_pulse_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \s_counter_pulse_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \s_counter_pulse_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \s_counter_pulse_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \s_counter_pulse_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \s_counter_pulse_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \s_counter_pulse_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \s_counter_pulse_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \s_counter_pulse_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \s_counter_pulse_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \s_counter_pulse_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \s_counter_pulse_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \s_counter_pulse_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \s_counter_pulse_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \s_counter_pulse_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \s_counter_reg__0\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal s_pulse : STD_LOGIC;
  signal s_pulse_out : STD_LOGIC;
  signal s_pulse_out_i_2_n_0 : STD_LOGIC;
  signal s_pulse_out_i_3_n_0 : STD_LOGIC;
  signal s_pulse_out_i_4_n_0 : STD_LOGIC;
  signal slv_reg0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg1[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[0]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[10]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[11]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[12]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[13]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[14]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[15]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[16]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[17]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[18]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[19]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[1]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[20]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[21]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[22]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[23]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[24]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[25]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[26]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[27]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[28]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[29]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[2]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[30]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[31]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[3]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[4]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[5]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[6]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[8]\ : STD_LOGIC;
  signal \slv_reg1_reg_n_0_[9]\ : STD_LOGIC;
  signal \slv_reg2[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[10]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[11]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[12]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[13]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[14]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[15]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[16]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[17]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[18]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[19]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[1]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[20]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[21]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[22]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[23]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[24]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[25]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[26]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[27]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[28]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[29]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[2]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[30]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[31]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[3]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[4]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[5]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[6]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[7]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[8]\ : STD_LOGIC;
  signal \slv_reg2_reg_n_0_[9]\ : STD_LOGIC;
  signal slv_reg3 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg3[15]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[23]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[31]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg3[7]_i_1_n_0\ : STD_LOGIC;
  signal \slv_reg_wren__2\ : STD_LOGIC;
  signal NLW_s_counter_pulse1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_s_counter_pulse1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_s_counter_pulse1_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_s_counter_pulse1_carry__1_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_s_counter_pulse1_carry__1_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_s_counter_pulse_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_s_counter_pulse_reg[20]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \axi_awaddr[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_awready_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_rvalid_i_1 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \led[10]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \led[11]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \led[12]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \led[13]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \led[14]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \led[15]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \led[1]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \led[2]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \led[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \led[4]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \led[5]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \led[6]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \led[7]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \led[9]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \s_counter[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \s_counter[3]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \slv_reg0[31]_i_2\ : label is "soft_lutpair6";
begin
  Q(0) <= \^q\(0);
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_WREADY <= \^s_axi_wready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
\axi_araddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(0),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => axi_araddr(2),
      O => \axi_araddr[2]_i_1_n_0\
    );
\axi_araddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s00_axi_araddr(1),
      I1 => s00_axi_arvalid,
      I2 => \^s_axi_arready\,
      I3 => axi_araddr(3),
      O => \axi_araddr[3]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[2]_i_1_n_0\,
      Q => axi_araddr(2),
      S => axi_awready_i_1_n_0
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_araddr[3]_i_1_n_0\,
      Q => axi_araddr(3),
      S => axi_awready_i_1_n_0
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s_axi_arready\,
      O => axi_arready_i_1_n_0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready_i_1_n_0,
      Q => \^s_axi_arready\,
      R => axi_awready_i_1_n_0
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0080"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_wvalid,
      I2 => s00_axi_awvalid,
      I3 => \^s_axi_awready\,
      I4 => p_0_in(0),
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0080"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_wvalid,
      I2 => s00_axi_awvalid,
      I3 => \^s_axi_awready\,
      I4 => p_0_in(1),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => p_0_in(0),
      R => axi_awready_i_1_n_0
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => p_0_in(1),
      R => axi_awready_i_1_n_0
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => axi_awready_i_1_n_0
    );
axi_awready_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_awvalid,
      I2 => \^s_axi_awready\,
      O => axi_awready_i_2_n_0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready_i_2_n_0,
      Q => \^s_axi_awready\,
      R => axi_awready_i_1_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => \^s_axi_wready\,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => s00_axi_awvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => axi_awready_i_1_n_0
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(0),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(0),
      I4 => p_1_in_0,
      I5 => \slv_reg1_reg_n_0_[0]\,
      O => reg_data_out(0)
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(10),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(10),
      I4 => \slv_reg2_reg_n_0_[10]\,
      I5 => \slv_reg1_reg_n_0_[10]\,
      O => reg_data_out(10)
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(11),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(11),
      I4 => \slv_reg2_reg_n_0_[11]\,
      I5 => \slv_reg1_reg_n_0_[11]\,
      O => reg_data_out(11)
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(12),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(12),
      I4 => \slv_reg2_reg_n_0_[12]\,
      I5 => \slv_reg1_reg_n_0_[12]\,
      O => reg_data_out(12)
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(13),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(13),
      I4 => \slv_reg2_reg_n_0_[13]\,
      I5 => \slv_reg1_reg_n_0_[13]\,
      O => reg_data_out(13)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(14),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(14),
      I4 => \slv_reg2_reg_n_0_[14]\,
      I5 => \slv_reg1_reg_n_0_[14]\,
      O => reg_data_out(14)
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(15),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(15),
      I4 => \slv_reg2_reg_n_0_[15]\,
      I5 => \slv_reg1_reg_n_0_[15]\,
      O => reg_data_out(15)
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(16),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(16),
      I4 => \slv_reg2_reg_n_0_[16]\,
      I5 => \slv_reg1_reg_n_0_[16]\,
      O => reg_data_out(16)
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(17),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(17),
      I4 => \slv_reg2_reg_n_0_[17]\,
      I5 => \slv_reg1_reg_n_0_[17]\,
      O => reg_data_out(17)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(18),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(18),
      I4 => \slv_reg2_reg_n_0_[18]\,
      I5 => \slv_reg1_reg_n_0_[18]\,
      O => reg_data_out(18)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(19),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(19),
      I4 => \slv_reg2_reg_n_0_[19]\,
      I5 => \slv_reg1_reg_n_0_[19]\,
      O => reg_data_out(19)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(1),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(1),
      I4 => \slv_reg2_reg_n_0_[1]\,
      I5 => \slv_reg1_reg_n_0_[1]\,
      O => reg_data_out(1)
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(20),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(20),
      I4 => \slv_reg2_reg_n_0_[20]\,
      I5 => \slv_reg1_reg_n_0_[20]\,
      O => reg_data_out(20)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(21),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(21),
      I4 => \slv_reg2_reg_n_0_[21]\,
      I5 => \slv_reg1_reg_n_0_[21]\,
      O => reg_data_out(21)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(22),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(22),
      I4 => \slv_reg2_reg_n_0_[22]\,
      I5 => \slv_reg1_reg_n_0_[22]\,
      O => reg_data_out(22)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(23),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(23),
      I4 => \slv_reg2_reg_n_0_[23]\,
      I5 => \slv_reg1_reg_n_0_[23]\,
      O => reg_data_out(23)
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(24),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(24),
      I4 => \slv_reg2_reg_n_0_[24]\,
      I5 => \slv_reg1_reg_n_0_[24]\,
      O => reg_data_out(24)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(25),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(25),
      I4 => \slv_reg2_reg_n_0_[25]\,
      I5 => \slv_reg1_reg_n_0_[25]\,
      O => reg_data_out(25)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(26),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(26),
      I4 => \slv_reg2_reg_n_0_[26]\,
      I5 => \slv_reg1_reg_n_0_[26]\,
      O => reg_data_out(26)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(27),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(27),
      I4 => \slv_reg2_reg_n_0_[27]\,
      I5 => \slv_reg1_reg_n_0_[27]\,
      O => reg_data_out(27)
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(28),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(28),
      I4 => \slv_reg2_reg_n_0_[28]\,
      I5 => \slv_reg1_reg_n_0_[28]\,
      O => reg_data_out(28)
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(29),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(29),
      I4 => \slv_reg2_reg_n_0_[29]\,
      I5 => \slv_reg1_reg_n_0_[29]\,
      O => reg_data_out(29)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(2),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(2),
      I4 => \slv_reg2_reg_n_0_[2]\,
      I5 => \slv_reg1_reg_n_0_[2]\,
      O => reg_data_out(2)
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(30),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(30),
      I4 => \slv_reg2_reg_n_0_[30]\,
      I5 => \slv_reg1_reg_n_0_[30]\,
      O => reg_data_out(30)
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      O => \axi_rdata[31]_i_1_n_0\
    );
\axi_rdata[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(31),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(31),
      I4 => \slv_reg2_reg_n_0_[31]\,
      I5 => \slv_reg1_reg_n_0_[31]\,
      O => reg_data_out(31)
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(3),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(3),
      I4 => \slv_reg2_reg_n_0_[3]\,
      I5 => \slv_reg1_reg_n_0_[3]\,
      O => reg_data_out(3)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(4),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(4),
      I4 => \slv_reg2_reg_n_0_[4]\,
      I5 => \slv_reg1_reg_n_0_[4]\,
      O => reg_data_out(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(5),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(5),
      I4 => \slv_reg2_reg_n_0_[5]\,
      I5 => \slv_reg1_reg_n_0_[5]\,
      O => reg_data_out(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(6),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(6),
      I4 => \slv_reg2_reg_n_0_[6]\,
      I5 => \slv_reg1_reg_n_0_[6]\,
      O => reg_data_out(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(7),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(7),
      I4 => \slv_reg2_reg_n_0_[7]\,
      I5 => \slv_reg1_reg_n_0_[7]\,
      O => reg_data_out(7)
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(8),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(8),
      I4 => \slv_reg2_reg_n_0_[8]\,
      I5 => \slv_reg1_reg_n_0_[8]\,
      O => reg_data_out(8)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBCB3B08F8C8380"
    )
        port map (
      I0 => slv_reg3(9),
      I1 => axi_araddr(3),
      I2 => axi_araddr(2),
      I3 => slv_reg0(9),
      I4 => \slv_reg2_reg_n_0_[9]\,
      I5 => \slv_reg1_reg_n_0_[9]\,
      O => reg_data_out(9)
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(0),
      Q => s00_axi_rdata(0),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(10),
      Q => s00_axi_rdata(10),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(11),
      Q => s00_axi_rdata(11),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(12),
      Q => s00_axi_rdata(12),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(13),
      Q => s00_axi_rdata(13),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(14),
      Q => s00_axi_rdata(14),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(15),
      Q => s00_axi_rdata(15),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(16),
      Q => s00_axi_rdata(16),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(17),
      Q => s00_axi_rdata(17),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(18),
      Q => s00_axi_rdata(18),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(19),
      Q => s00_axi_rdata(19),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(1),
      Q => s00_axi_rdata(1),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(20),
      Q => s00_axi_rdata(20),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(21),
      Q => s00_axi_rdata(21),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(22),
      Q => s00_axi_rdata(22),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(23),
      Q => s00_axi_rdata(23),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(24),
      Q => s00_axi_rdata(24),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(25),
      Q => s00_axi_rdata(25),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(26),
      Q => s00_axi_rdata(26),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(27),
      Q => s00_axi_rdata(27),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(28),
      Q => s00_axi_rdata(28),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(29),
      Q => s00_axi_rdata(29),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(2),
      Q => s00_axi_rdata(2),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(30),
      Q => s00_axi_rdata(30),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(31),
      Q => s00_axi_rdata(31),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(3),
      Q => s00_axi_rdata(3),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(4),
      Q => s00_axi_rdata(4),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(5),
      Q => s00_axi_rdata(5),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(6),
      Q => s00_axi_rdata(6),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(7),
      Q => s00_axi_rdata(7),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(8),
      Q => s00_axi_rdata(8),
      R => axi_awready_i_1_n_0
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \axi_rdata[31]_i_1_n_0\,
      D => reg_data_out(9),
      Q => s00_axi_rdata(9),
      R => axi_awready_i_1_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s_axi_arready\,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => axi_awready_i_1_n_0
    );
axi_wready_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_awvalid,
      I2 => \^s_axi_wready\,
      O => axi_wready_i_1_n_0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready_i_1_n_0,
      Q => \^s_axi_wready\,
      R => axi_awready_i_1_n_0
    );
\led[10]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C8"
    )
        port map (
      I0 => \s_counter_reg__0\(1),
      I1 => \^q\(0),
      I2 => \s_counter_reg__0\(2),
      O => \led[15]\(8)
    );
\led[11]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => \s_counter_reg__0\(0),
      I1 => \s_counter_reg__0\(1),
      I2 => \^q\(0),
      I3 => \s_counter_reg__0\(2),
      O => \led[15]\(9)
    );
\led[12]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \s_counter_reg__0\(2),
      I1 => \^q\(0),
      O => \led[15]\(10)
    );
\led[13]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8880"
    )
        port map (
      I0 => \^q\(0),
      I1 => \s_counter_reg__0\(2),
      I2 => \s_counter_reg__0\(1),
      I3 => \s_counter_reg__0\(0),
      O => \led[15]\(11)
    );
\led[14]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^q\(0),
      I1 => \s_counter_reg__0\(2),
      I2 => \s_counter_reg__0\(1),
      O => \led[15]\(12)
    );
\led[15]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^q\(0),
      I1 => \s_counter_reg__0\(2),
      I2 => \s_counter_reg__0\(1),
      I3 => \s_counter_reg__0\(0),
      O => \led[15]\(13)
    );
\led[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^q\(0),
      I1 => \s_counter_reg__0\(2),
      I2 => \s_counter_reg__0\(1),
      I3 => \s_counter_reg__0\(0),
      O => \led[15]\(0)
    );
\led[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^q\(0),
      I1 => \s_counter_reg__0\(2),
      I2 => \s_counter_reg__0\(1),
      O => \led[15]\(1)
    );
\led[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEE"
    )
        port map (
      I0 => \^q\(0),
      I1 => \s_counter_reg__0\(2),
      I2 => \s_counter_reg__0\(1),
      I3 => \s_counter_reg__0\(0),
      O => \led[15]\(2)
    );
\led[4]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \s_counter_reg__0\(2),
      I1 => \^q\(0),
      O => \led[15]\(3)
    );
\led[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFA8"
    )
        port map (
      I0 => \s_counter_reg__0\(2),
      I1 => \s_counter_reg__0\(0),
      I2 => \s_counter_reg__0\(1),
      I3 => \^q\(0),
      O => \led[15]\(4)
    );
\led[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \s_counter_reg__0\(2),
      I1 => \s_counter_reg__0\(1),
      I2 => \^q\(0),
      O => \led[15]\(5)
    );
\led[7]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EAAA"
    )
        port map (
      I0 => \^q\(0),
      I1 => \s_counter_reg__0\(2),
      I2 => \s_counter_reg__0\(0),
      I3 => \s_counter_reg__0\(1),
      O => \led[15]\(6)
    );
\led[9]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F0E0"
    )
        port map (
      I0 => \s_counter_reg__0\(0),
      I1 => \s_counter_reg__0\(1),
      I2 => \^q\(0),
      I3 => \s_counter_reg__0\(2),
      O => \led[15]\(7)
    );
\s_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \s_counter_reg__0\(0),
      O => plusOp(0)
    );
\s_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \s_counter_reg__0\(0),
      I1 => \s_counter_reg__0\(1),
      O => plusOp(1)
    );
\s_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \s_counter_reg__0\(1),
      I1 => \s_counter_reg__0\(0),
      I2 => \s_counter_reg__0\(2),
      O => plusOp(2)
    );
\s_counter[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => s_pulse_out,
      I1 => \slv_reg1_reg_n_0_[0]\,
      I2 => p_1_in_0,
      O => s_counter
    );
\s_counter[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \slv_reg1_reg_n_0_[0]\,
      I1 => s_pulse_out,
      O => \s_counter[3]_i_2_n_0\
    );
\s_counter[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \s_counter_reg__0\(2),
      I1 => \s_counter_reg__0\(0),
      I2 => \s_counter_reg__0\(1),
      I3 => \^q\(0),
      O => plusOp(3)
    );
s_counter_pulse1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => s_counter_pulse1_carry_n_0,
      CO(2) => s_counter_pulse1_carry_n_1,
      CO(1) => s_counter_pulse1_carry_n_2,
      CO(0) => s_counter_pulse1_carry_n_3,
      CYINIT => '1',
      DI(3) => s_counter_pulse1_carry_i_1_n_0,
      DI(2) => s_counter_pulse1_carry_i_2_n_0,
      DI(1) => s_counter_pulse1_carry_i_3_n_0,
      DI(0) => s_counter_pulse1_carry_i_4_n_0,
      O(3 downto 0) => NLW_s_counter_pulse1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => s_counter_pulse1_carry_i_5_n_0,
      S(2) => s_counter_pulse1_carry_i_6_n_0,
      S(1) => s_counter_pulse1_carry_i_7_n_0,
      S(0) => s_counter_pulse1_carry_i_8_n_0
    );
\s_counter_pulse1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => s_counter_pulse1_carry_n_0,
      CO(3) => \s_counter_pulse1_carry__0_n_0\,
      CO(2) => \s_counter_pulse1_carry__0_n_1\,
      CO(1) => \s_counter_pulse1_carry__0_n_2\,
      CO(0) => \s_counter_pulse1_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \s_counter_pulse1_carry__0_i_1_n_0\,
      DI(2) => \s_counter_pulse1_carry__0_i_2_n_0\,
      DI(1) => \s_counter_pulse1_carry__0_i_3_n_0\,
      DI(0) => \s_counter_pulse1_carry__0_i_4_n_0\,
      O(3 downto 0) => \NLW_s_counter_pulse1_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \s_counter_pulse1_carry__0_i_5_n_0\,
      S(2) => \s_counter_pulse1_carry__0_i_6_n_0\,
      S(1) => \s_counter_pulse1_carry__0_i_7_n_0\,
      S(0) => \s_counter_pulse1_carry__0_i_8_n_0\
    );
\s_counter_pulse1_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => s_counter_pulse_reg(15),
      I1 => s_counter_pulse2(15),
      I2 => s_counter_pulse_reg(14),
      I3 => s_counter_pulse2(14),
      O => \s_counter_pulse1_carry__0_i_1_n_0\
    );
\s_counter_pulse1_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => s_counter_pulse_reg(13),
      I1 => s_counter_pulse2(13),
      I2 => s_counter_pulse_reg(12),
      I3 => s_counter_pulse2(12),
      O => \s_counter_pulse1_carry__0_i_2_n_0\
    );
\s_counter_pulse1_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => s_counter_pulse_reg(11),
      I1 => s_counter_pulse2(11),
      I2 => s_counter_pulse_reg(10),
      I3 => s_counter_pulse2(10),
      O => \s_counter_pulse1_carry__0_i_3_n_0\
    );
\s_counter_pulse1_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => s_counter_pulse_reg(9),
      I1 => s_counter_pulse2(9),
      I2 => s_counter_pulse_reg(8),
      I3 => s_counter_pulse2(8),
      O => \s_counter_pulse1_carry__0_i_4_n_0\
    );
\s_counter_pulse1_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => s_counter_pulse2(15),
      I1 => s_counter_pulse_reg(15),
      I2 => s_counter_pulse2(14),
      I3 => s_counter_pulse_reg(14),
      O => \s_counter_pulse1_carry__0_i_5_n_0\
    );
\s_counter_pulse1_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => s_counter_pulse2(13),
      I1 => s_counter_pulse_reg(13),
      I2 => s_counter_pulse2(12),
      I3 => s_counter_pulse_reg(12),
      O => \s_counter_pulse1_carry__0_i_6_n_0\
    );
\s_counter_pulse1_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => s_counter_pulse2(11),
      I1 => s_counter_pulse_reg(11),
      I2 => s_counter_pulse2(10),
      I3 => s_counter_pulse_reg(10),
      O => \s_counter_pulse1_carry__0_i_7_n_0\
    );
\s_counter_pulse1_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => s_counter_pulse2(9),
      I1 => s_counter_pulse_reg(9),
      I2 => s_counter_pulse2(8),
      I3 => s_counter_pulse_reg(8),
      O => \s_counter_pulse1_carry__0_i_8_n_0\
    );
\s_counter_pulse1_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_counter_pulse1_carry__0_n_0\,
      CO(3) => \s_counter_pulse1_carry__1_n_0\,
      CO(2) => \s_counter_pulse1_carry__1_n_1\,
      CO(1) => \s_counter_pulse1_carry__1_n_2\,
      CO(0) => \s_counter_pulse1_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => s_counter_pulse2(22),
      DI(2) => \s_counter_pulse1_carry__1_i_2_n_0\,
      DI(1) => \s_counter_pulse1_carry__1_i_3_n_0\,
      DI(0) => \s_counter_pulse1_carry__1_i_4_n_0\,
      O(3 downto 0) => \NLW_s_counter_pulse1_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \s_counter_pulse1_carry__1_i_5_n_3\,
      S(2) => \s_counter_pulse1_carry__1_i_6_n_0\,
      S(1) => \s_counter_pulse1_carry__1_i_7_n_0\,
      S(0) => \s_counter_pulse1_carry__1_i_8_n_0\
    );
\s_counter_pulse1_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \s_counter_pulse1_carry__1_i_5_n_3\,
      O => s_counter_pulse2(22)
    );
\s_counter_pulse1_carry__1_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \s_counter_pulse1_carry__1_i_5_n_3\,
      I1 => s_counter_pulse_reg(20),
      I2 => s_counter_pulse2(20),
      O => \s_counter_pulse1_carry__1_i_2_n_0\
    );
\s_counter_pulse1_carry__1_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => s_counter_pulse_reg(19),
      I1 => s_counter_pulse2(19),
      I2 => s_counter_pulse_reg(18),
      I3 => s_counter_pulse2(18),
      O => \s_counter_pulse1_carry__1_i_3_n_0\
    );
\s_counter_pulse1_carry__1_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => s_counter_pulse_reg(17),
      I1 => s_counter_pulse2(17),
      I2 => s_counter_pulse_reg(16),
      I3 => s_counter_pulse2(16),
      O => \s_counter_pulse1_carry__1_i_4_n_0\
    );
\s_counter_pulse1_carry__1_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_counter_pulse2_carry__3_n_0\,
      CO(3 downto 1) => \NLW_s_counter_pulse1_carry__1_i_5_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \s_counter_pulse1_carry__1_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_s_counter_pulse1_carry__1_i_5_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => B"0001"
    );
\s_counter_pulse1_carry__1_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"84"
    )
        port map (
      I0 => s_counter_pulse2(20),
      I1 => \s_counter_pulse1_carry__1_i_5_n_3\,
      I2 => s_counter_pulse_reg(20),
      O => \s_counter_pulse1_carry__1_i_6_n_0\
    );
\s_counter_pulse1_carry__1_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => s_counter_pulse2(19),
      I1 => s_counter_pulse_reg(19),
      I2 => s_counter_pulse2(18),
      I3 => s_counter_pulse_reg(18),
      O => \s_counter_pulse1_carry__1_i_7_n_0\
    );
\s_counter_pulse1_carry__1_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => s_counter_pulse2(17),
      I1 => s_counter_pulse_reg(17),
      I2 => s_counter_pulse2(16),
      I3 => s_counter_pulse_reg(16),
      O => \s_counter_pulse1_carry__1_i_8_n_0\
    );
s_counter_pulse1_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => s_counter_pulse_reg(7),
      I1 => s_counter_pulse2(7),
      I2 => s_counter_pulse_reg(6),
      I3 => s_counter_pulse2(6),
      O => s_counter_pulse1_carry_i_1_n_0
    );
s_counter_pulse1_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => s_counter_pulse_reg(5),
      I1 => s_counter_pulse2(5),
      I2 => s_counter_pulse_reg(4),
      I3 => s_counter_pulse2(4),
      O => s_counter_pulse1_carry_i_2_n_0
    );
s_counter_pulse1_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => s_counter_pulse_reg(3),
      I1 => s_counter_pulse2(3),
      I2 => s_counter_pulse_reg(2),
      I3 => s_counter_pulse2(2),
      O => s_counter_pulse1_carry_i_3_n_0
    );
s_counter_pulse1_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000FFFF00008000"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg0(1),
      I2 => slv_reg0(0),
      I3 => s_counter_pulse_reg(0),
      I4 => s_counter_pulse2(1),
      I5 => s_counter_pulse_reg(1),
      O => s_counter_pulse1_carry_i_4_n_0
    );
s_counter_pulse1_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => s_counter_pulse2(7),
      I1 => s_counter_pulse_reg(7),
      I2 => s_counter_pulse2(6),
      I3 => s_counter_pulse_reg(6),
      O => s_counter_pulse1_carry_i_5_n_0
    );
s_counter_pulse1_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => s_counter_pulse2(5),
      I1 => s_counter_pulse_reg(5),
      I2 => s_counter_pulse2(4),
      I3 => s_counter_pulse_reg(4),
      O => s_counter_pulse1_carry_i_6_n_0
    );
s_counter_pulse1_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => s_counter_pulse2(3),
      I1 => s_counter_pulse_reg(3),
      I2 => s_counter_pulse2(2),
      I3 => s_counter_pulse_reg(2),
      O => s_counter_pulse1_carry_i_7_n_0
    );
s_counter_pulse1_carry_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F00007F80000080"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg0(1),
      I2 => slv_reg0(0),
      I3 => s_counter_pulse_reg(1),
      I4 => s_counter_pulse2(1),
      I5 => s_counter_pulse_reg(0),
      O => s_counter_pulse1_carry_i_8_n_0
    );
s_counter_pulse2_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => s_counter_pulse2_carry_n_0,
      CO(2) => s_counter_pulse2_carry_n_1,
      CO(1) => s_counter_pulse2_carry_n_2,
      CO(0) => s_counter_pulse2_carry_n_3,
      CYINIT => s_counter_pulse2_carry_i_1_n_0,
      DI(3) => s_counter_pulse2_carry_i_2_n_0,
      DI(2) => s_counter_pulse2_carry_i_3_n_0,
      DI(1) => s_counter_pulse2_carry_i_4_n_0,
      DI(0) => s_counter_pulse2_carry_i_5_n_0,
      O(3 downto 0) => s_counter_pulse2(4 downto 1),
      S(3) => s_counter_pulse2_carry_i_6_n_0,
      S(2) => s_counter_pulse2_carry_i_7_n_0,
      S(1) => s_counter_pulse2_carry_i_8_n_0,
      S(0) => s_counter_pulse2_carry_i_9_n_0
    );
\s_counter_pulse2_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => s_counter_pulse2_carry_n_0,
      CO(3) => \s_counter_pulse2_carry__0_n_0\,
      CO(2) => \s_counter_pulse2_carry__0_n_1\,
      CO(1) => \s_counter_pulse2_carry__0_n_2\,
      CO(0) => \s_counter_pulse2_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \s_counter_pulse2_carry__0_i_1_n_0\,
      DI(2) => \s_counter_pulse2_carry__0_i_2_n_0\,
      DI(1) => \s_counter_pulse2_carry__0_i_3_n_0\,
      DI(0) => \s_counter_pulse2_carry__0_i_4_n_0\,
      O(3 downto 0) => s_counter_pulse2(8 downto 5),
      S(3) => \s_counter_pulse2_carry__0_i_5_n_0\,
      S(2) => \s_counter_pulse2_carry__0_i_6_n_0\,
      S(1) => \s_counter_pulse2_carry__0_i_7_n_0\,
      S(0) => \s_counter_pulse2_carry__0_i_8_n_0\
    );
\s_counter_pulse2_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"84"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(1),
      I2 => slv_reg0(2),
      O => \s_counter_pulse2_carry__0_i_1_n_0\
    );
\s_counter_pulse2_carry__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(1),
      I2 => slv_reg0(2),
      O => \s_counter_pulse2_carry__0_i_2_n_0\
    );
\s_counter_pulse2_carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"14"
    )
        port map (
      I0 => slv_reg0(1),
      I1 => slv_reg0(2),
      I2 => slv_reg0(0),
      O => \s_counter_pulse2_carry__0_i_3_n_0\
    );
\s_counter_pulse2_carry__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"18"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg0(0),
      I2 => slv_reg0(1),
      O => \s_counter_pulse2_carry__0_i_4_n_0\
    );
\s_counter_pulse2_carry__0_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6F"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg0(0),
      I2 => slv_reg0(1),
      O => \s_counter_pulse2_carry__0_i_5_n_0\
    );
\s_counter_pulse2_carry__0_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BE"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg0(1),
      I2 => slv_reg0(0),
      O => \s_counter_pulse2_carry__0_i_6_n_0\
    );
\s_counter_pulse2_carry__0_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EB"
    )
        port map (
      I0 => slv_reg0(1),
      I1 => slv_reg0(2),
      I2 => slv_reg0(0),
      O => \s_counter_pulse2_carry__0_i_7_n_0\
    );
\s_counter_pulse2_carry__0_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E7"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(2),
      I2 => slv_reg0(1),
      O => \s_counter_pulse2_carry__0_i_8_n_0\
    );
\s_counter_pulse2_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_counter_pulse2_carry__0_n_0\,
      CO(3) => \s_counter_pulse2_carry__1_n_0\,
      CO(2) => \s_counter_pulse2_carry__1_n_1\,
      CO(1) => \s_counter_pulse2_carry__1_n_2\,
      CO(0) => \s_counter_pulse2_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \s_counter_pulse2_carry__1_i_1_n_0\,
      DI(2) => \s_counter_pulse2_carry__1_i_2_n_0\,
      DI(1) => \s_counter_pulse2_carry__1_i_3_n_0\,
      DI(0) => \s_counter_pulse2_carry__1_i_4_n_0\,
      O(3 downto 0) => s_counter_pulse2(12 downto 9),
      S(3) => \s_counter_pulse2_carry__1_i_5_n_0\,
      S(2) => \s_counter_pulse2_carry__1_i_6_n_0\,
      S(1) => \s_counter_pulse2_carry__1_i_7_n_0\,
      S(0) => \s_counter_pulse2_carry__1_i_8_n_0\
    );
\s_counter_pulse2_carry__1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(2),
      I2 => slv_reg0(1),
      O => \s_counter_pulse2_carry__1_i_1_n_0\
    );
\s_counter_pulse2_carry__1_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C4"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(2),
      I2 => slv_reg0(1),
      O => \s_counter_pulse2_carry__1_i_2_n_0\
    );
\s_counter_pulse2_carry__1_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A1"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(1),
      I2 => slv_reg0(2),
      O => \s_counter_pulse2_carry__1_i_3_n_0\
    );
\s_counter_pulse2_carry__1_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"42"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(1),
      I2 => slv_reg0(2),
      O => \s_counter_pulse2_carry__1_i_4_n_0\
    );
\s_counter_pulse2_carry__1_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"17"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(2),
      I2 => slv_reg0(1),
      O => \s_counter_pulse2_carry__1_i_5_n_0\
    );
\s_counter_pulse2_carry__1_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2F"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(1),
      I2 => slv_reg0(2),
      O => \s_counter_pulse2_carry__1_i_6_n_0\
    );
\s_counter_pulse2_carry__1_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"3E"
    )
        port map (
      I0 => slv_reg0(1),
      I1 => slv_reg0(2),
      I2 => slv_reg0(0),
      O => \s_counter_pulse2_carry__1_i_7_n_0\
    );
\s_counter_pulse2_carry__1_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DB"
    )
        port map (
      I0 => slv_reg0(1),
      I1 => slv_reg0(0),
      I2 => slv_reg0(2),
      O => \s_counter_pulse2_carry__1_i_8_n_0\
    );
\s_counter_pulse2_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_counter_pulse2_carry__1_n_0\,
      CO(3) => \s_counter_pulse2_carry__2_n_0\,
      CO(2) => \s_counter_pulse2_carry__2_n_1\,
      CO(1) => \s_counter_pulse2_carry__2_n_2\,
      CO(0) => \s_counter_pulse2_carry__2_n_3\,
      CYINIT => '0',
      DI(3) => \s_counter_pulse2_carry__2_i_1_n_0\,
      DI(2) => \s_counter_pulse2_carry__2_i_2_n_0\,
      DI(1) => \s_counter_pulse2_carry__2_i_3_n_0\,
      DI(0) => \s_counter_pulse2_carry__2_i_4_n_0\,
      O(3 downto 0) => s_counter_pulse2(16 downto 13),
      S(3) => \s_counter_pulse2_carry__2_i_5_n_0\,
      S(2) => \s_counter_pulse2_carry__2_i_6_n_0\,
      S(1) => \s_counter_pulse2_carry__2_i_7_n_0\,
      S(0) => \s_counter_pulse2_carry__2_i_8_n_0\
    );
\s_counter_pulse2_carry__2_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => slv_reg0(1),
      I1 => slv_reg0(0),
      I2 => slv_reg0(2),
      O => \s_counter_pulse2_carry__2_i_1_n_0\
    );
\s_counter_pulse2_carry__2_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"5B"
    )
        port map (
      I0 => slv_reg0(1),
      I1 => slv_reg0(0),
      I2 => slv_reg0(2),
      O => \s_counter_pulse2_carry__2_i_2_n_0\
    );
\s_counter_pulse2_carry__2_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7C"
    )
        port map (
      I0 => slv_reg0(1),
      I1 => slv_reg0(2),
      I2 => slv_reg0(0),
      O => \s_counter_pulse2_carry__2_i_3_n_0\
    );
\s_counter_pulse2_carry__2_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg0(1),
      I2 => slv_reg0(0),
      O => \s_counter_pulse2_carry__2_i_4_n_0\
    );
\s_counter_pulse2_carry__2_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C9"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(2),
      I2 => slv_reg0(1),
      O => \s_counter_pulse2_carry__2_i_5_n_0\
    );
\s_counter_pulse2_carry__2_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C2"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(2),
      I2 => slv_reg0(1),
      O => \s_counter_pulse2_carry__2_i_6_n_0\
    );
\s_counter_pulse2_carry__2_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"85"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(1),
      I2 => slv_reg0(2),
      O => \s_counter_pulse2_carry__2_i_7_n_0\
    );
\s_counter_pulse2_carry__2_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"23"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(2),
      I2 => slv_reg0(1),
      O => \s_counter_pulse2_carry__2_i_8_n_0\
    );
\s_counter_pulse2_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_counter_pulse2_carry__2_n_0\,
      CO(3) => \s_counter_pulse2_carry__3_n_0\,
      CO(2) => \s_counter_pulse2_carry__3_n_1\,
      CO(1) => \s_counter_pulse2_carry__3_n_2\,
      CO(0) => \s_counter_pulse2_carry__3_n_3\,
      CYINIT => '0',
      DI(3) => \s_counter_pulse2_carry__3_i_1_n_0\,
      DI(2) => \s_counter_pulse2_carry__3_i_2_n_0\,
      DI(1) => \s_counter_pulse2_carry__3_i_3_n_0\,
      DI(0) => \s_counter_pulse2_carry__3_i_4_n_0\,
      O(3 downto 0) => s_counter_pulse2(20 downto 17),
      S(3) => \s_counter_pulse2_carry__3_i_5_n_0\,
      S(2) => \s_counter_pulse2_carry__3_i_6_n_0\,
      S(1) => \s_counter_pulse2_carry__3_i_7_n_0\,
      S(0) => \s_counter_pulse2_carry__3_i_8_n_0\
    );
\s_counter_pulse2_carry__3_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(1),
      I2 => slv_reg0(2),
      O => \s_counter_pulse2_carry__3_i_1_n_0\
    );
\s_counter_pulse2_carry__3_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg0(1),
      O => \s_counter_pulse2_carry__3_i_2_n_0\
    );
\s_counter_pulse2_carry__3_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"13"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(2),
      I2 => slv_reg0(1),
      O => \s_counter_pulse2_carry__3_i_3_n_0\
    );
\s_counter_pulse2_carry__3_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => slv_reg0(2),
      O => \s_counter_pulse2_carry__3_i_4_n_0\
    );
\s_counter_pulse2_carry__3_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg0(1),
      I2 => slv_reg0(0),
      O => \s_counter_pulse2_carry__3_i_5_n_0\
    );
\s_counter_pulse2_carry__3_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => slv_reg0(1),
      I1 => slv_reg0(2),
      O => \s_counter_pulse2_carry__3_i_6_n_0\
    );
\s_counter_pulse2_carry__3_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => slv_reg0(1),
      I1 => slv_reg0(0),
      I2 => slv_reg0(2),
      O => \s_counter_pulse2_carry__3_i_7_n_0\
    );
\s_counter_pulse2_carry__3_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => slv_reg0(2),
      O => \s_counter_pulse2_carry__3_i_8_n_0\
    );
s_counter_pulse2_carry_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(1),
      I2 => slv_reg0(2),
      O => s_counter_pulse2_carry_i_1_n_0
    );
s_counter_pulse2_carry_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(1),
      I2 => slv_reg0(2),
      O => s_counter_pulse2_carry_i_2_n_0
    );
s_counter_pulse2_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"90"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(1),
      I2 => slv_reg0(2),
      O => s_counter_pulse2_carry_i_3_n_0
    );
s_counter_pulse2_carry_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg0(0),
      I2 => slv_reg0(1),
      O => s_counter_pulse2_carry_i_4_n_0
    );
s_counter_pulse2_carry_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => slv_reg0(0),
      I1 => slv_reg0(1),
      I2 => slv_reg0(2),
      O => s_counter_pulse2_carry_i_5_n_0
    );
s_counter_pulse2_carry_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9F"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg0(0),
      I2 => slv_reg0(1),
      O => s_counter_pulse2_carry_i_6_n_0
    );
s_counter_pulse2_carry_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7D"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg0(1),
      I2 => slv_reg0(0),
      O => s_counter_pulse2_carry_i_7_n_0
    );
s_counter_pulse2_carry_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => slv_reg0(1),
      I1 => slv_reg0(0),
      I2 => slv_reg0(2),
      O => s_counter_pulse2_carry_i_8_n_0
    );
s_counter_pulse2_carry_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => slv_reg0(2),
      I1 => slv_reg0(1),
      I2 => slv_reg0(0),
      O => s_counter_pulse2_carry_i_9_n_0
    );
\s_counter_pulse[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \s_counter_pulse1_carry__1_n_0\,
      I1 => s00_axi_aresetn,
      O => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_counter_pulse_reg(0),
      O => \s_counter_pulse[0]_i_3_n_0\
    );
\s_counter_pulse_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[0]_i_2_n_7\,
      Q => s_counter_pulse_reg(0),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \s_counter_pulse_reg[0]_i_2_n_0\,
      CO(2) => \s_counter_pulse_reg[0]_i_2_n_1\,
      CO(1) => \s_counter_pulse_reg[0]_i_2_n_2\,
      CO(0) => \s_counter_pulse_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \s_counter_pulse_reg[0]_i_2_n_4\,
      O(2) => \s_counter_pulse_reg[0]_i_2_n_5\,
      O(1) => \s_counter_pulse_reg[0]_i_2_n_6\,
      O(0) => \s_counter_pulse_reg[0]_i_2_n_7\,
      S(3 downto 1) => s_counter_pulse_reg(3 downto 1),
      S(0) => \s_counter_pulse[0]_i_3_n_0\
    );
\s_counter_pulse_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[8]_i_1_n_5\,
      Q => s_counter_pulse_reg(10),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[8]_i_1_n_4\,
      Q => s_counter_pulse_reg(11),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[12]_i_1_n_7\,
      Q => s_counter_pulse_reg(12),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_counter_pulse_reg[8]_i_1_n_0\,
      CO(3) => \s_counter_pulse_reg[12]_i_1_n_0\,
      CO(2) => \s_counter_pulse_reg[12]_i_1_n_1\,
      CO(1) => \s_counter_pulse_reg[12]_i_1_n_2\,
      CO(0) => \s_counter_pulse_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \s_counter_pulse_reg[12]_i_1_n_4\,
      O(2) => \s_counter_pulse_reg[12]_i_1_n_5\,
      O(1) => \s_counter_pulse_reg[12]_i_1_n_6\,
      O(0) => \s_counter_pulse_reg[12]_i_1_n_7\,
      S(3 downto 0) => s_counter_pulse_reg(15 downto 12)
    );
\s_counter_pulse_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[12]_i_1_n_6\,
      Q => s_counter_pulse_reg(13),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[12]_i_1_n_5\,
      Q => s_counter_pulse_reg(14),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[12]_i_1_n_4\,
      Q => s_counter_pulse_reg(15),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[16]_i_1_n_7\,
      Q => s_counter_pulse_reg(16),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_counter_pulse_reg[12]_i_1_n_0\,
      CO(3) => \s_counter_pulse_reg[16]_i_1_n_0\,
      CO(2) => \s_counter_pulse_reg[16]_i_1_n_1\,
      CO(1) => \s_counter_pulse_reg[16]_i_1_n_2\,
      CO(0) => \s_counter_pulse_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \s_counter_pulse_reg[16]_i_1_n_4\,
      O(2) => \s_counter_pulse_reg[16]_i_1_n_5\,
      O(1) => \s_counter_pulse_reg[16]_i_1_n_6\,
      O(0) => \s_counter_pulse_reg[16]_i_1_n_7\,
      S(3 downto 0) => s_counter_pulse_reg(19 downto 16)
    );
\s_counter_pulse_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[16]_i_1_n_6\,
      Q => s_counter_pulse_reg(17),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[16]_i_1_n_5\,
      Q => s_counter_pulse_reg(18),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[16]_i_1_n_4\,
      Q => s_counter_pulse_reg(19),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[0]_i_2_n_6\,
      Q => s_counter_pulse_reg(1),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[20]_i_1_n_7\,
      Q => s_counter_pulse_reg(20),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_counter_pulse_reg[16]_i_1_n_0\,
      CO(3 downto 0) => \NLW_s_counter_pulse_reg[20]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_s_counter_pulse_reg[20]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \s_counter_pulse_reg[20]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => s_counter_pulse_reg(20)
    );
\s_counter_pulse_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[0]_i_2_n_5\,
      Q => s_counter_pulse_reg(2),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[0]_i_2_n_4\,
      Q => s_counter_pulse_reg(3),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[4]_i_1_n_7\,
      Q => s_counter_pulse_reg(4),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_counter_pulse_reg[0]_i_2_n_0\,
      CO(3) => \s_counter_pulse_reg[4]_i_1_n_0\,
      CO(2) => \s_counter_pulse_reg[4]_i_1_n_1\,
      CO(1) => \s_counter_pulse_reg[4]_i_1_n_2\,
      CO(0) => \s_counter_pulse_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \s_counter_pulse_reg[4]_i_1_n_4\,
      O(2) => \s_counter_pulse_reg[4]_i_1_n_5\,
      O(1) => \s_counter_pulse_reg[4]_i_1_n_6\,
      O(0) => \s_counter_pulse_reg[4]_i_1_n_7\,
      S(3 downto 0) => s_counter_pulse_reg(7 downto 4)
    );
\s_counter_pulse_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[4]_i_1_n_6\,
      Q => s_counter_pulse_reg(5),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[4]_i_1_n_5\,
      Q => s_counter_pulse_reg(6),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[4]_i_1_n_4\,
      Q => s_counter_pulse_reg(7),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[8]_i_1_n_7\,
      Q => s_counter_pulse_reg(8),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_pulse_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \s_counter_pulse_reg[4]_i_1_n_0\,
      CO(3) => \s_counter_pulse_reg[8]_i_1_n_0\,
      CO(2) => \s_counter_pulse_reg[8]_i_1_n_1\,
      CO(1) => \s_counter_pulse_reg[8]_i_1_n_2\,
      CO(0) => \s_counter_pulse_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \s_counter_pulse_reg[8]_i_1_n_4\,
      O(2) => \s_counter_pulse_reg[8]_i_1_n_5\,
      O(1) => \s_counter_pulse_reg[8]_i_1_n_6\,
      O(0) => \s_counter_pulse_reg[8]_i_1_n_7\,
      S(3 downto 0) => s_counter_pulse_reg(11 downto 8)
    );
\s_counter_pulse_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \s_counter_pulse_reg[8]_i_1_n_6\,
      Q => s_counter_pulse_reg(9),
      R => \s_counter_pulse[0]_i_1_n_0\
    );
\s_counter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \s_counter[3]_i_2_n_0\,
      D => plusOp(0),
      Q => \s_counter_reg__0\(0),
      R => s_counter
    );
\s_counter_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => \s_counter[3]_i_2_n_0\,
      D => plusOp(1),
      Q => \s_counter_reg__0\(1),
      S => s_counter
    );
\s_counter_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => \s_counter[3]_i_2_n_0\,
      D => plusOp(2),
      Q => \s_counter_reg__0\(2),
      S => s_counter
    );
\s_counter_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => \s_counter[3]_i_2_n_0\,
      D => plusOp(3),
      Q => \^q\(0),
      S => s_counter
    );
s_pulse_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => s_pulse_out_i_2_n_0,
      I1 => s_pulse_out_i_3_n_0,
      I2 => s_pulse_out_i_4_n_0,
      I3 => s_counter_pulse_reg(2),
      I4 => s_counter_pulse_reg(1),
      I5 => s_counter_pulse_reg(0),
      O => s_pulse
    );
s_pulse_out_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_counter_pulse_reg(11),
      I1 => s_counter_pulse_reg(12),
      I2 => s_counter_pulse_reg(9),
      I3 => s_counter_pulse_reg(10),
      I4 => s_counter_pulse_reg(14),
      I5 => s_counter_pulse_reg(13),
      O => s_pulse_out_i_2_n_0
    );
s_pulse_out_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_counter_pulse_reg(5),
      I1 => s_counter_pulse_reg(6),
      I2 => s_counter_pulse_reg(3),
      I3 => s_counter_pulse_reg(4),
      I4 => s_counter_pulse_reg(8),
      I5 => s_counter_pulse_reg(7),
      O => s_pulse_out_i_3_n_0
    );
s_pulse_out_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => s_counter_pulse_reg(17),
      I1 => s_counter_pulse_reg(18),
      I2 => s_counter_pulse_reg(15),
      I3 => s_counter_pulse_reg(16),
      I4 => s_counter_pulse_reg(20),
      I5 => s_counter_pulse_reg(19),
      O => s_pulse_out_i_4_n_0
    );
s_pulse_out_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => s_pulse,
      Q => s_pulse_out,
      R => axi_awready_i_1_n_0
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(1),
      O => p_1_in(15)
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(2),
      O => p_1_in(23)
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(3),
      O => p_1_in(31)
    );
\slv_reg0[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^s_axi_wready\,
      I1 => s00_axi_wvalid,
      I2 => \^s_axi_awready\,
      I3 => s00_axi_awvalid,
      O => \slv_reg_wren__2\
    );
\slv_reg0[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => p_0_in(1),
      I2 => p_0_in(0),
      I3 => s00_axi_wstrb(0),
      O => p_1_in(7)
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(0),
      Q => slv_reg0(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(10),
      Q => slv_reg0(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(11),
      Q => slv_reg0(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(12),
      Q => slv_reg0(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(13),
      Q => slv_reg0(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(14),
      Q => slv_reg0(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(15),
      Q => slv_reg0(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(16),
      Q => slv_reg0(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(17),
      Q => slv_reg0(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(18),
      Q => slv_reg0(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(19),
      Q => slv_reg0(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(1),
      Q => slv_reg0(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(20),
      Q => slv_reg0(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(21),
      Q => slv_reg0(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(22),
      Q => slv_reg0(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(23),
      D => s00_axi_wdata(23),
      Q => slv_reg0(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(24),
      Q => slv_reg0(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(25),
      Q => slv_reg0(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(26),
      Q => slv_reg0(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(27),
      Q => slv_reg0(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(28),
      Q => slv_reg0(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(29),
      Q => slv_reg0(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(2),
      Q => slv_reg0(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(30),
      Q => slv_reg0(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(31),
      D => s00_axi_wdata(31),
      Q => slv_reg0(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(3),
      Q => slv_reg0(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(4),
      Q => slv_reg0(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(5),
      Q => slv_reg0(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(6),
      Q => slv_reg0(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(7),
      D => s00_axi_wdata(7),
      Q => slv_reg0(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(8),
      Q => slv_reg0(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(15),
      D => s00_axi_wdata(9),
      Q => slv_reg0(9),
      R => axi_awready_i_1_n_0
    );
\slv_reg1[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(1),
      I3 => p_0_in(0),
      O => \slv_reg1[15]_i_1_n_0\
    );
\slv_reg1[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(2),
      I3 => p_0_in(0),
      O => \slv_reg1[23]_i_1_n_0\
    );
\slv_reg1[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(3),
      I3 => p_0_in(0),
      O => \slv_reg1[31]_i_1_n_0\
    );
\slv_reg1[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => s00_axi_wstrb(0),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg1[7]_i_1_n_0\
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => \slv_reg1_reg_n_0_[0]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg1_reg_n_0_[10]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg1_reg_n_0_[11]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg1_reg_n_0_[12]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg1_reg_n_0_[13]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg1_reg_n_0_[14]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg1_reg_n_0_[15]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg1_reg_n_0_[16]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg1_reg_n_0_[17]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg1_reg_n_0_[18]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg1_reg_n_0_[19]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg1_reg_n_0_[1]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg1_reg_n_0_[20]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg1_reg_n_0_[21]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg1_reg_n_0_[22]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg1_reg_n_0_[23]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg1_reg_n_0_[24]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg1_reg_n_0_[25]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg1_reg_n_0_[26]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg1_reg_n_0_[27]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg1_reg_n_0_[28]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg1_reg_n_0_[29]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg1_reg_n_0_[2]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg1_reg_n_0_[30]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg1_reg_n_0_[31]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg1_reg_n_0_[3]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg1_reg_n_0_[4]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg1_reg_n_0_[5]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg1_reg_n_0_[6]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg1_reg_n_0_[7]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg1_reg_n_0_[8]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg1[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg1_reg_n_0_[9]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(1),
      I3 => p_0_in(0),
      O => \slv_reg2[15]_i_1_n_0\
    );
\slv_reg2[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(2),
      I3 => p_0_in(0),
      O => \slv_reg2[23]_i_1_n_0\
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(3),
      I3 => p_0_in(0),
      O => \slv_reg2[31]_i_1_n_0\
    );
\slv_reg2[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => p_0_in(1),
      I2 => s00_axi_wstrb(0),
      I3 => p_0_in(0),
      O => \slv_reg2[7]_i_1_n_0\
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => p_1_in_0,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => \slv_reg2_reg_n_0_[10]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => \slv_reg2_reg_n_0_[11]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => \slv_reg2_reg_n_0_[12]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => \slv_reg2_reg_n_0_[13]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => \slv_reg2_reg_n_0_[14]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => \slv_reg2_reg_n_0_[15]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => \slv_reg2_reg_n_0_[16]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => \slv_reg2_reg_n_0_[17]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => \slv_reg2_reg_n_0_[18]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => \slv_reg2_reg_n_0_[19]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => \slv_reg2_reg_n_0_[1]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => \slv_reg2_reg_n_0_[20]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => \slv_reg2_reg_n_0_[21]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => \slv_reg2_reg_n_0_[22]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => \slv_reg2_reg_n_0_[23]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => \slv_reg2_reg_n_0_[24]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => \slv_reg2_reg_n_0_[25]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => \slv_reg2_reg_n_0_[26]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => \slv_reg2_reg_n_0_[27]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => \slv_reg2_reg_n_0_[28]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => \slv_reg2_reg_n_0_[29]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => \slv_reg2_reg_n_0_[2]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => \slv_reg2_reg_n_0_[30]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => \slv_reg2_reg_n_0_[31]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => \slv_reg2_reg_n_0_[3]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => \slv_reg2_reg_n_0_[4]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => \slv_reg2_reg_n_0_[5]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => \slv_reg2_reg_n_0_[6]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => \slv_reg2_reg_n_0_[7]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => \slv_reg2_reg_n_0_[8]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg2[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => \slv_reg2_reg_n_0_[9]\,
      R => axi_awready_i_1_n_0
    );
\slv_reg3[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => s00_axi_wstrb(1),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg3[15]_i_1_n_0\
    );
\slv_reg3[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => s00_axi_wstrb(2),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg3[23]_i_1_n_0\
    );
\slv_reg3[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => s00_axi_wstrb(3),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg3[31]_i_1_n_0\
    );
\slv_reg3[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \slv_reg_wren__2\,
      I1 => s00_axi_wstrb(0),
      I2 => p_0_in(0),
      I3 => p_0_in(1),
      O => \slv_reg3[7]_i_1_n_0\
    );
\slv_reg3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(0),
      Q => slv_reg3(0),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(10),
      Q => slv_reg3(10),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(11),
      Q => slv_reg3(11),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(12),
      Q => slv_reg3(12),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(13),
      Q => slv_reg3(13),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(14),
      Q => slv_reg3(14),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(15),
      Q => slv_reg3(15),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(16),
      Q => slv_reg3(16),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(17),
      Q => slv_reg3(17),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(18),
      Q => slv_reg3(18),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(19),
      Q => slv_reg3(19),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(1),
      Q => slv_reg3(1),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(20),
      Q => slv_reg3(20),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(21),
      Q => slv_reg3(21),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(22),
      Q => slv_reg3(22),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[23]_i_1_n_0\,
      D => s00_axi_wdata(23),
      Q => slv_reg3(23),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(24),
      Q => slv_reg3(24),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(25),
      Q => slv_reg3(25),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(26),
      Q => slv_reg3(26),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(27),
      Q => slv_reg3(27),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(28),
      Q => slv_reg3(28),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(29),
      Q => slv_reg3(29),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(2),
      Q => slv_reg3(2),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(30),
      Q => slv_reg3(30),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[31]_i_1_n_0\,
      D => s00_axi_wdata(31),
      Q => slv_reg3(31),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(3),
      Q => slv_reg3(3),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(4),
      Q => slv_reg3(4),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(5),
      Q => slv_reg3(5),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(6),
      Q => slv_reg3(6),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[7]_i_1_n_0\,
      D => s00_axi_wdata(7),
      Q => slv_reg3(7),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(8),
      Q => slv_reg3(8),
      R => axi_awready_i_1_n_0
    );
\slv_reg3_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg3[15]_i_1_n_0\,
      D => s00_axi_wdata(9),
      Q => slv_reg3(9),
      R => axi_awready_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_LoadingBarController_v1_0 is
  port (
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    led : out STD_LOGIC_VECTOR ( 0 to 0 );
    \led[15]\ : out STD_LOGIC_VECTOR ( 13 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_LoadingBarController_v1_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_LoadingBarController_v1_0 is
begin
LoadingBarController_v1_0_S00_AXI_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_LoadingBarController_v1_0_S00_AXI
     port map (
      Q(0) => led(0),
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_WREADY => S_AXI_WREADY,
      \led[15]\(13 downto 0) => \led[15]\(13 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(1 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(1 downto 0),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    led : out STD_LOGIC_VECTOR ( 15 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_LoadingBarController_0_0,LoadingBarController_v1_0,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "LoadingBarController_v1_0,Vivado 2017.4";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^led\ : STD_LOGIC_VECTOR ( 15 downto 1 );
  attribute x_interface_info : string;
  attribute x_interface_info of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1";
  attribute x_interface_info of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute x_interface_parameter of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW";
  attribute x_interface_info of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute x_interface_info of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute x_interface_info of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute x_interface_info of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute x_interface_info of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute x_interface_info of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute x_interface_info of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute x_interface_info of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute x_interface_info of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute x_interface_info of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute x_interface_info of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute x_interface_info of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute x_interface_info of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute x_interface_parameter of s00_axi_awaddr : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  attribute x_interface_info of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute x_interface_info of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute x_interface_info of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute x_interface_info of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute x_interface_info of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute x_interface_info of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
begin
  led(15 downto 1) <= \^led\(15 downto 1);
  led(0) <= \<const1>\;
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_LoadingBarController_v1_0
     port map (
      S_AXI_ARREADY => s00_axi_arready,
      S_AXI_AWREADY => s00_axi_awready,
      S_AXI_WREADY => s00_axi_wready,
      led(0) => \^led\(8),
      \led[15]\(13 downto 7) => \^led\(15 downto 9),
      \led[15]\(6 downto 0) => \^led\(7 downto 1),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(1 downto 0) => s00_axi_araddr(3 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(3 downto 2),
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
