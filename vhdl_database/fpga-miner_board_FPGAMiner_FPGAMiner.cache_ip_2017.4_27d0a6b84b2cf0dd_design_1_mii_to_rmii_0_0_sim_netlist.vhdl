-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Mon Jun  4 22:19:35 2018
-- Host        : hp-laptop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_mii_to_rmii_0_0_sim_netlist.vhdl
-- Design      : design_1_mii_to_rmii_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SRL_FIFO is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    \Addr_Counters[3].FDRE_I_0\ : out STD_LOGIC;
    \RX_100_MBPS.fifo_ldr_cs_reg[0]\ : out STD_LOGIC;
    \RX_100_MBPS.Rmii2Mac_rxd_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ref_clk : in STD_LOGIC;
    Data_In : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    rx_end_packet : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \RX_100_MBPS.fifo_flshr_cs_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \rst_n_d_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SRL_FIFO;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SRL_FIFO is
  signal \Addr_Counters[0].FDRE_I_n_0\ : STD_LOGIC;
  signal \Addr_Counters[1].FDRE_I_n_0\ : STD_LOGIC;
  signal \Addr_Counters[2].FDRE_I_n_0\ : STD_LOGIC;
  signal \^addr_counters[3].fdre_i_0\ : STD_LOGIC;
  signal \Addr_Counters[3].FDRE_I_n_0\ : STD_LOGIC;
  signal \Addr_Counters[3].XORCY_I_i_1_n_0\ : STD_LOGIC;
  signal CI : STD_LOGIC;
  signal \^d\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal D_0 : STD_LOGIC;
  signal Data_Out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal FIFO_Read : STD_LOGIC;
  signal \^rx_100_mbps.fifo_ldr_cs_reg[0]\ : STD_LOGIC;
  signal S : STD_LOGIC;
  signal S0_out : STD_LOGIC;
  signal S1_out : STD_LOGIC;
  signal addr_cy_1 : STD_LOGIC;
  signal addr_cy_2 : STD_LOGIC;
  signal addr_cy_3 : STD_LOGIC;
  signal \buffer_Empty__2\ : STD_LOGIC;
  signal sum_A_0 : STD_LOGIC;
  signal sum_A_1 : STD_LOGIC;
  signal sum_A_2 : STD_LOGIC;
  signal sum_A_3 : STD_LOGIC;
  signal \NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \Addr_Counters[0].FDRE_I\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \Addr_Counters[0].MUXCY_L_I_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \Addr_Counters[0].MUXCY_L_I_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \Addr_Counters[0].MUXCY_L_I_CARRY4\ : label is "LO:O";
  attribute BOX_TYPE of \Addr_Counters[1].FDRE_I\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \Addr_Counters[2].FDRE_I\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \Addr_Counters[3].FDRE_I\ : label is "PRIMITIVE";
  attribute BOX_TYPE of Data_Exists_DFF : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of Data_Exists_DFF : label is "FDR";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of Data_Exists_DFF_i_3 : label is "soft_lutpair0";
  attribute BOX_TYPE of \FIFO_RAM[1].SRL16E_I\ : label is "PRIMITIVE";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \FIFO_RAM[1].SRL16E_I\ : label is "U0/\RMII_FIXED.I_RX/RX_100_MBPS.I_SRL_FIFO/FIFO_RAM ";
  attribute srl_name : string;
  attribute srl_name of \FIFO_RAM[1].SRL16E_I\ : label is "U0/\RMII_FIXED.I_RX/RX_100_MBPS.I_SRL_FIFO/FIFO_RAM[1].SRL16E_I ";
  attribute BOX_TYPE of \FIFO_RAM[2].SRL16E_I\ : label is "PRIMITIVE";
  attribute srl_bus_name of \FIFO_RAM[2].SRL16E_I\ : label is "U0/\RMII_FIXED.I_RX/RX_100_MBPS.I_SRL_FIFO/FIFO_RAM ";
  attribute srl_name of \FIFO_RAM[2].SRL16E_I\ : label is "U0/\RMII_FIXED.I_RX/RX_100_MBPS.I_SRL_FIFO/FIFO_RAM[2].SRL16E_I ";
  attribute BOX_TYPE of \FIFO_RAM[3].SRL16E_I\ : label is "PRIMITIVE";
  attribute srl_bus_name of \FIFO_RAM[3].SRL16E_I\ : label is "U0/\RMII_FIXED.I_RX/RX_100_MBPS.I_SRL_FIFO/FIFO_RAM ";
  attribute srl_name of \FIFO_RAM[3].SRL16E_I\ : label is "U0/\RMII_FIXED.I_RX/RX_100_MBPS.I_SRL_FIFO/FIFO_RAM[3].SRL16E_I ";
  attribute BOX_TYPE of \FIFO_RAM[4].SRL16E_I\ : label is "PRIMITIVE";
  attribute srl_bus_name of \FIFO_RAM[4].SRL16E_I\ : label is "U0/\RMII_FIXED.I_RX/RX_100_MBPS.I_SRL_FIFO/FIFO_RAM ";
  attribute srl_name of \FIFO_RAM[4].SRL16E_I\ : label is "U0/\RMII_FIXED.I_RX/RX_100_MBPS.I_SRL_FIFO/FIFO_RAM[4].SRL16E_I ";
  attribute SOFT_HLUTNM of \RX_100_MBPS.Rmii2Mac_rxd[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \RX_100_MBPS.Rmii2Mac_rxd[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \RX_100_MBPS.Rmii2Mac_rxd[2]_i_1\ : label is "soft_lutpair1";
begin
  \Addr_Counters[3].FDRE_I_0\ <= \^addr_counters[3].fdre_i_0\;
  D(0) <= \^d\(0);
  \RX_100_MBPS.fifo_ldr_cs_reg[0]\ <= \^rx_100_mbps.fifo_ldr_cs_reg[0]\;
\Addr_Counters[0].FDRE_I\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => ref_clk,
      CE => \^d\(0),
      D => sum_A_3,
      Q => \Addr_Counters[0].FDRE_I_n_0\,
      R => \^addr_counters[3].fdre_i_0\
    );
\Addr_Counters[0].MUXCY_L_I_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_CO_UNCONNECTED\(3),
      CO(2) => addr_cy_1,
      CO(1) => addr_cy_2,
      CO(0) => addr_cy_3,
      CYINIT => CI,
      DI(3) => \NLW_Addr_Counters[0].MUXCY_L_I_CARRY4_DI_UNCONNECTED\(3),
      DI(2) => \Addr_Counters[2].FDRE_I_n_0\,
      DI(1) => \Addr_Counters[1].FDRE_I_n_0\,
      DI(0) => \Addr_Counters[0].FDRE_I_n_0\,
      O(3) => sum_A_0,
      O(2) => sum_A_1,
      O(1) => sum_A_2,
      O(0) => sum_A_3,
      S(3) => \Addr_Counters[3].XORCY_I_i_1_n_0\,
      S(2) => S0_out,
      S(1) => S1_out,
      S(0) => S
    );
\Addr_Counters[0].MUXCY_L_I_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFEFFFF0000"
    )
        port map (
      I0 => \Addr_Counters[1].FDRE_I_n_0\,
      I1 => \Addr_Counters[3].FDRE_I_n_0\,
      I2 => \Addr_Counters[2].FDRE_I_n_0\,
      I3 => \^rx_100_mbps.fifo_ldr_cs_reg[0]\,
      I4 => \Addr_Counters[0].FDRE_I_n_0\,
      I5 => FIFO_Read,
      O => S
    );
\Addr_Counters[0].MUXCY_L_I_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA2AAAAAAA"
    )
        port map (
      I0 => \^rx_100_mbps.fifo_ldr_cs_reg[0]\,
      I1 => \Addr_Counters[0].FDRE_I_n_0\,
      I2 => \Addr_Counters[1].FDRE_I_n_0\,
      I3 => \Addr_Counters[3].FDRE_I_n_0\,
      I4 => \Addr_Counters[2].FDRE_I_n_0\,
      I5 => FIFO_Read,
      O => CI
    );
\Addr_Counters[1].FDRE_I\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => ref_clk,
      CE => \^d\(0),
      D => sum_A_2,
      Q => \Addr_Counters[1].FDRE_I_n_0\,
      R => \^addr_counters[3].fdre_i_0\
    );
\Addr_Counters[1].MUXCY_L_I_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFEFFFF0000"
    )
        port map (
      I0 => \Addr_Counters[0].FDRE_I_n_0\,
      I1 => \Addr_Counters[3].FDRE_I_n_0\,
      I2 => \Addr_Counters[2].FDRE_I_n_0\,
      I3 => \^rx_100_mbps.fifo_ldr_cs_reg[0]\,
      I4 => \Addr_Counters[1].FDRE_I_n_0\,
      I5 => FIFO_Read,
      O => S1_out
    );
\Addr_Counters[2].FDRE_I\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => ref_clk,
      CE => \^d\(0),
      D => sum_A_1,
      Q => \Addr_Counters[2].FDRE_I_n_0\,
      R => \^addr_counters[3].fdre_i_0\
    );
\Addr_Counters[2].MUXCY_L_I_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFEFFFF0000"
    )
        port map (
      I0 => \Addr_Counters[0].FDRE_I_n_0\,
      I1 => \Addr_Counters[1].FDRE_I_n_0\,
      I2 => \Addr_Counters[3].FDRE_I_n_0\,
      I3 => \^rx_100_mbps.fifo_ldr_cs_reg[0]\,
      I4 => \Addr_Counters[2].FDRE_I_n_0\,
      I5 => FIFO_Read,
      O => S0_out
    );
\Addr_Counters[3].FDRE_I\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => ref_clk,
      CE => \^d\(0),
      D => sum_A_0,
      Q => \Addr_Counters[3].FDRE_I_n_0\,
      R => \^addr_counters[3].fdre_i_0\
    );
\Addr_Counters[3].XORCY_I_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFEFFFF0000"
    )
        port map (
      I0 => \Addr_Counters[0].FDRE_I_n_0\,
      I1 => \Addr_Counters[1].FDRE_I_n_0\,
      I2 => \Addr_Counters[2].FDRE_I_n_0\,
      I3 => \^rx_100_mbps.fifo_ldr_cs_reg[0]\,
      I4 => \Addr_Counters[3].FDRE_I_n_0\,
      I5 => FIFO_Read,
      O => \Addr_Counters[3].XORCY_I_i_1_n_0\
    );
Data_Exists_DFF: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ref_clk,
      CE => '1',
      D => D_0,
      Q => \^d\(0),
      R => \^addr_counters[3].fdre_i_0\
    );
Data_Exists_DFF_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8AFFFFFF8A008A00"
    )
        port map (
      I0 => Q(0),
      I1 => rx_end_packet(1),
      I2 => rx_end_packet(0),
      I3 => \buffer_Empty__2\,
      I4 => FIFO_Read,
      I5 => \^d\(0),
      O => D_0
    );
Data_Exists_DFF_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \Addr_Counters[0].FDRE_I_n_0\,
      I1 => \Addr_Counters[1].FDRE_I_n_0\,
      I2 => \Addr_Counters[3].FDRE_I_n_0\,
      I3 => \Addr_Counters[2].FDRE_I_n_0\,
      O => \buffer_Empty__2\
    );
Data_Exists_DFF_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \RX_100_MBPS.fifo_flshr_cs_reg[1]\(0),
      I1 => \RX_100_MBPS.fifo_flshr_cs_reg[1]\(1),
      O => FIFO_Read
    );
\FIFO_RAM[1].SRL16E_I\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000",
      IS_CLK_INVERTED => '0'
    )
        port map (
      A0 => \Addr_Counters[0].FDRE_I_n_0\,
      A1 => \Addr_Counters[1].FDRE_I_n_0\,
      A2 => \Addr_Counters[2].FDRE_I_n_0\,
      A3 => \Addr_Counters[3].FDRE_I_n_0\,
      CE => CI,
      CLK => ref_clk,
      D => Data_In(3),
      Q => Data_Out(3)
    );
\FIFO_RAM[2].SRL16E_I\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000",
      IS_CLK_INVERTED => '0'
    )
        port map (
      A0 => \Addr_Counters[0].FDRE_I_n_0\,
      A1 => \Addr_Counters[1].FDRE_I_n_0\,
      A2 => \Addr_Counters[2].FDRE_I_n_0\,
      A3 => \Addr_Counters[3].FDRE_I_n_0\,
      CE => CI,
      CLK => ref_clk,
      D => Data_In(2),
      Q => Data_Out(2)
    );
\FIFO_RAM[3].SRL16E_I\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000",
      IS_CLK_INVERTED => '0'
    )
        port map (
      A0 => \Addr_Counters[0].FDRE_I_n_0\,
      A1 => \Addr_Counters[1].FDRE_I_n_0\,
      A2 => \Addr_Counters[2].FDRE_I_n_0\,
      A3 => \Addr_Counters[3].FDRE_I_n_0\,
      CE => CI,
      CLK => ref_clk,
      D => Data_In(1),
      Q => Data_Out(1)
    );
\FIFO_RAM[4].SRL16E_I\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000",
      IS_CLK_INVERTED => '0'
    )
        port map (
      A0 => \Addr_Counters[0].FDRE_I_n_0\,
      A1 => \Addr_Counters[1].FDRE_I_n_0\,
      A2 => \Addr_Counters[2].FDRE_I_n_0\,
      A3 => \Addr_Counters[3].FDRE_I_n_0\,
      CE => CI,
      CLK => ref_clk,
      D => Data_In(0),
      Q => Data_Out(0)
    );
\RX_100_MBPS.Rmii2Mac_rxd[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \RX_100_MBPS.fifo_flshr_cs_reg[1]\(1),
      I1 => Data_Out(0),
      O => \RX_100_MBPS.Rmii2Mac_rxd_reg[3]\(0)
    );
\RX_100_MBPS.Rmii2Mac_rxd[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \RX_100_MBPS.fifo_flshr_cs_reg[1]\(1),
      I1 => Data_Out(1),
      O => \RX_100_MBPS.Rmii2Mac_rxd_reg[3]\(1)
    );
\RX_100_MBPS.Rmii2Mac_rxd[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \RX_100_MBPS.fifo_flshr_cs_reg[1]\(1),
      I1 => Data_Out(2),
      O => \RX_100_MBPS.Rmii2Mac_rxd_reg[3]\(2)
    );
\RX_100_MBPS.Rmii2Mac_rxd[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \RX_100_MBPS.fifo_flshr_cs_reg[1]\(1),
      I1 => Data_Out(3),
      O => \RX_100_MBPS.Rmii2Mac_rxd_reg[3]\(3)
    );
\RX_100_MBPS.fifo_ldr_cs[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => Q(0),
      I1 => rx_end_packet(1),
      I2 => rx_end_packet(0),
      O => \^rx_100_mbps.fifo_ldr_cs_reg[0]\
    );
rmii2mac_tx_clk_bi_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \rst_n_d_reg[1]\(0),
      O => \^addr_counters[3].fdre_i_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rmii_tx_fixed is
  port (
    Rmii2Phy_tx_en : out STD_LOGIC;
    \rmii2phy_txd_reg[1]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rmii2Mac_tx_clk_i : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    mac2Rmii_tx_er_d2 : in STD_LOGIC;
    ref_clk : in STD_LOGIC;
    mac2Rmii_tx_en_d2 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rmii_tx_fixed;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rmii_tx_fixed is
  signal \/FSM_sequential_present_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \/FSM_sequential_present_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \/FSM_sequential_present_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_present_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_present_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \Rmii2Phy_txd[0]_i_1_n_0\ : STD_LOGIC;
  signal \Rmii2Phy_txd[1]_i_1_n_0\ : STD_LOGIC;
  signal mac2Rmii_tx_en_d : STD_LOGIC;
  signal mac2Rmii_tx_er_d : STD_LOGIC;
  signal \mac2Rmii_txd_d_reg_n_0_[0]\ : STD_LOGIC;
  signal \mac2Rmii_txd_d_reg_n_0_[1]\ : STD_LOGIC;
  signal \mac2Rmii_txd_d_reg_n_0_[3]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal present_state : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of present_state : signal is "yes";
  signal tx_in_reg_en : STD_LOGIC;
  signal txd_dibit : STD_LOGIC;
  signal txd_error : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_present_state_reg[0]\ : label is "idle_clk_l:00000,idle_clk_h:00001,tx100_dibit_0_clk_l:00010,tx100_dibit_1_clk_h:00011,tx10_dibit_0_clk_l0:00100,tx10_dibit_0_clk_l1:00101,tx10_dibit_0_clk_l2:00110,tx10_dibit_0_clk_l3:00111,tx10_dibit_0_clk_l4:01000,tx10_dibit_0_clk_l5:01001,tx10_dibit_0_clk_l6:01010,tx10_dibit_0_clk_l7:01011,tx10_dibit_0_clk_l8:01100,tx10_dibit_0_clk_l9:01101,tx10_dibit_1_clk_h0:01110,tx10_dibit_1_clk_h1:01111,tx10_dibit_1_clk_h2:10000,tx10_dibit_1_clk_h3:10001,tx10_dibit_1_clk_h4:10010,tx10_dibit_1_clk_h5:10011,tx10_dibit_1_clk_h6:10100,tx10_dibit_1_clk_h7:10101,tx10_dibit_1_clk_h8:10110,tx10_dibit_1_clk_h9:10111";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_present_state_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_present_state_reg[1]\ : label is "idle_clk_l:00000,idle_clk_h:00001,tx100_dibit_0_clk_l:00010,tx100_dibit_1_clk_h:00011,tx10_dibit_0_clk_l0:00100,tx10_dibit_0_clk_l1:00101,tx10_dibit_0_clk_l2:00110,tx10_dibit_0_clk_l3:00111,tx10_dibit_0_clk_l4:01000,tx10_dibit_0_clk_l5:01001,tx10_dibit_0_clk_l6:01010,tx10_dibit_0_clk_l7:01011,tx10_dibit_0_clk_l8:01100,tx10_dibit_0_clk_l9:01101,tx10_dibit_1_clk_h0:01110,tx10_dibit_1_clk_h1:01111,tx10_dibit_1_clk_h2:10000,tx10_dibit_1_clk_h3:10001,tx10_dibit_1_clk_h4:10010,tx10_dibit_1_clk_h5:10011,tx10_dibit_1_clk_h6:10100,tx10_dibit_1_clk_h7:10101,tx10_dibit_1_clk_h8:10110,tx10_dibit_1_clk_h9:10111";
  attribute KEEP of \FSM_sequential_present_state_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_present_state_reg[2]\ : label is "idle_clk_l:00000,idle_clk_h:00001,tx100_dibit_0_clk_l:00010,tx100_dibit_1_clk_h:00011,tx10_dibit_0_clk_l0:00100,tx10_dibit_0_clk_l1:00101,tx10_dibit_0_clk_l2:00110,tx10_dibit_0_clk_l3:00111,tx10_dibit_0_clk_l4:01000,tx10_dibit_0_clk_l5:01001,tx10_dibit_0_clk_l6:01010,tx10_dibit_0_clk_l7:01011,tx10_dibit_0_clk_l8:01100,tx10_dibit_0_clk_l9:01101,tx10_dibit_1_clk_h0:01110,tx10_dibit_1_clk_h1:01111,tx10_dibit_1_clk_h2:10000,tx10_dibit_1_clk_h3:10001,tx10_dibit_1_clk_h4:10010,tx10_dibit_1_clk_h5:10011,tx10_dibit_1_clk_h6:10100,tx10_dibit_1_clk_h7:10101,tx10_dibit_1_clk_h8:10110,tx10_dibit_1_clk_h9:10111";
  attribute KEEP of \FSM_sequential_present_state_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_present_state_reg[3]\ : label is "idle_clk_l:00000,idle_clk_h:00001,tx100_dibit_0_clk_l:00010,tx100_dibit_1_clk_h:00011,tx10_dibit_0_clk_l0:00100,tx10_dibit_0_clk_l1:00101,tx10_dibit_0_clk_l2:00110,tx10_dibit_0_clk_l3:00111,tx10_dibit_0_clk_l4:01000,tx10_dibit_0_clk_l5:01001,tx10_dibit_0_clk_l6:01010,tx10_dibit_0_clk_l7:01011,tx10_dibit_0_clk_l8:01100,tx10_dibit_0_clk_l9:01101,tx10_dibit_1_clk_h0:01110,tx10_dibit_1_clk_h1:01111,tx10_dibit_1_clk_h2:10000,tx10_dibit_1_clk_h3:10001,tx10_dibit_1_clk_h4:10010,tx10_dibit_1_clk_h5:10011,tx10_dibit_1_clk_h6:10100,tx10_dibit_1_clk_h7:10101,tx10_dibit_1_clk_h8:10110,tx10_dibit_1_clk_h9:10111";
  attribute KEEP of \FSM_sequential_present_state_reg[3]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_present_state_reg[4]\ : label is "idle_clk_l:00000,idle_clk_h:00001,tx100_dibit_0_clk_l:00010,tx100_dibit_1_clk_h:00011,tx10_dibit_0_clk_l0:00100,tx10_dibit_0_clk_l1:00101,tx10_dibit_0_clk_l2:00110,tx10_dibit_0_clk_l3:00111,tx10_dibit_0_clk_l4:01000,tx10_dibit_0_clk_l5:01001,tx10_dibit_0_clk_l6:01010,tx10_dibit_0_clk_l7:01011,tx10_dibit_0_clk_l8:01100,tx10_dibit_0_clk_l9:01101,tx10_dibit_1_clk_h0:01110,tx10_dibit_1_clk_h1:01111,tx10_dibit_1_clk_h2:10000,tx10_dibit_1_clk_h3:10001,tx10_dibit_1_clk_h4:10010,tx10_dibit_1_clk_h5:10011,tx10_dibit_1_clk_h6:10100,tx10_dibit_1_clk_h7:10101,tx10_dibit_1_clk_h8:10110,tx10_dibit_1_clk_h9:10111";
  attribute KEEP of \FSM_sequential_present_state_reg[4]\ : label is "yes";
begin
\/FSM_sequential_present_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"115722AA"
    )
        port map (
      I0 => present_state(1),
      I1 => present_state(4),
      I2 => present_state(2),
      I3 => present_state(3),
      I4 => present_state(0),
      O => \/FSM_sequential_present_state[1]_i_1_n_0\
    );
\/FSM_sequential_present_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"543850F0"
    )
        port map (
      I0 => present_state(3),
      I1 => present_state(0),
      I2 => present_state(2),
      I3 => present_state(4),
      I4 => present_state(1),
      O => \/FSM_sequential_present_state[2]_i_1_n_0\
    );
\/FSM_sequential_present_state[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00807F00"
    )
        port map (
      I0 => present_state(1),
      I1 => present_state(0),
      I2 => present_state(2),
      I3 => present_state(4),
      I4 => present_state(3),
      O => \/FSM_sequential_present_state[4]_i_1_n_0\
    );
\/i_\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => present_state(1),
      I1 => present_state(3),
      I2 => mac2Rmii_tx_er_d,
      I3 => present_state(4),
      I4 => present_state(2),
      O => txd_error
    );
\/i___0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11555504"
    )
        port map (
      I0 => present_state(4),
      I1 => present_state(1),
      I2 => present_state(0),
      I3 => present_state(3),
      I4 => present_state(2),
      O => txd_dibit
    );
\/i___1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00014001"
    )
        port map (
      I0 => present_state(4),
      I1 => present_state(3),
      I2 => present_state(2),
      I3 => present_state(0),
      I4 => present_state(1),
      O => tx_in_reg_en
    );
\/i___2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"38333830"
    )
        port map (
      I0 => present_state(1),
      I1 => present_state(3),
      I2 => present_state(4),
      I3 => present_state(2),
      I4 => present_state(0),
      O => rmii2Mac_tx_clk_i
    );
\FSM_sequential_present_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => present_state(4),
      I1 => present_state(3),
      I2 => present_state(0),
      O => \FSM_sequential_present_state[0]_i_1_n_0\
    );
\FSM_sequential_present_state[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00006AAA"
    )
        port map (
      I0 => present_state(3),
      I1 => present_state(0),
      I2 => present_state(1),
      I3 => present_state(2),
      I4 => present_state(4),
      O => \FSM_sequential_present_state[3]_i_1_n_0\
    );
\FSM_sequential_present_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \FSM_sequential_present_state[0]_i_1_n_0\,
      Q => present_state(0),
      R => SR(0)
    );
\FSM_sequential_present_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \/FSM_sequential_present_state[1]_i_1_n_0\,
      Q => present_state(1),
      R => SR(0)
    );
\FSM_sequential_present_state_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \/FSM_sequential_present_state[2]_i_1_n_0\,
      Q => present_state(2),
      R => SR(0)
    );
\FSM_sequential_present_state_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \FSM_sequential_present_state[3]_i_1_n_0\,
      Q => present_state(3),
      R => SR(0)
    );
\FSM_sequential_present_state_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \/FSM_sequential_present_state[4]_i_1_n_0\,
      Q => present_state(4),
      R => SR(0)
    );
Rmii2Phy_tx_en_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2Rmii_tx_en_d,
      Q => Rmii2Phy_tx_en,
      R => SR(0)
    );
\Rmii2Phy_txd[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"47B8"
    )
        port map (
      I0 => p_0_in,
      I1 => txd_dibit,
      I2 => \mac2Rmii_txd_d_reg_n_0_[0]\,
      I3 => txd_error,
      O => \Rmii2Phy_txd[0]_i_1_n_0\
    );
\Rmii2Phy_txd[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFB8"
    )
        port map (
      I0 => \mac2Rmii_txd_d_reg_n_0_[3]\,
      I1 => txd_dibit,
      I2 => \mac2Rmii_txd_d_reg_n_0_[1]\,
      I3 => txd_error,
      O => \Rmii2Phy_txd[1]_i_1_n_0\
    );
\Rmii2Phy_txd_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \Rmii2Phy_txd[0]_i_1_n_0\,
      Q => \rmii2phy_txd_reg[1]\(0),
      R => SR(0)
    );
\rmii2phy_txd_reg[1]_RnM\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \Rmii2Phy_txd[1]_i_1_n_0\,
      Q => \rmii2phy_txd_reg[1]\(1),
      R => SR(0)
    );
mac2Rmii_tx_en_d_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => tx_in_reg_en,
      D => mac2Rmii_tx_en_d2,
      Q => mac2Rmii_tx_en_d,
      R => SR(0)
    );
mac2Rmii_tx_er_d_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => tx_in_reg_en,
      D => mac2Rmii_tx_er_d2,
      Q => mac2Rmii_tx_er_d,
      R => SR(0)
    );
\mac2Rmii_txd_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => tx_in_reg_en,
      D => Q(0),
      Q => \mac2Rmii_txd_d_reg_n_0_[0]\,
      R => SR(0)
    );
\mac2Rmii_txd_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => tx_in_reg_en,
      D => Q(1),
      Q => \mac2Rmii_txd_d_reg_n_0_[1]\,
      R => SR(0)
    );
\mac2Rmii_txd_d_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => tx_in_reg_en,
      D => Q(2),
      Q => p_0_in,
      R => SR(0)
    );
\mac2Rmii_txd_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => tx_in_reg_en,
      D => Q(3),
      Q => \mac2Rmii_txd_d_reg_n_0_[3]\,
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rmii_rx_fixed is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    rmii2Mac_crs_i : out STD_LOGIC;
    Rmii2Mac_rx_dv : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    Rmii2Mac_rx_er : out STD_LOGIC;
    \rmii2mac_rxd_reg[3]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rmii2mac_col_reg : out STD_LOGIC;
    ref_clk : in STD_LOGIC;
    phy2Rmii_crs_dv_d2 : in STD_LOGIC;
    phy2Rmii_rx_er_d2 : in STD_LOGIC;
    \rst_n_d_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \phy2Rmii_rxd_d2_reg[1]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    mac2Rmii_tx_en_d2 : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rmii_rx_fixed;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rmii_rx_fixed is
  signal Data_In : STD_LOGIC_VECTOR ( 1 to 4 );
  signal L : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \RX_100_MBPS.I_SRL_FIFO_n_2\ : STD_LOGIC;
  signal \RX_100_MBPS.I_SRL_FIFO_n_3\ : STD_LOGIC;
  signal \RX_100_MBPS.I_SRL_FIFO_n_4\ : STD_LOGIC;
  signal \RX_100_MBPS.I_SRL_FIFO_n_5\ : STD_LOGIC;
  signal \RX_100_MBPS.I_SRL_FIFO_n_6\ : STD_LOGIC;
  signal \RX_100_MBPS.Rmii2Mac_rx_er_i_1_n_0\ : STD_LOGIC;
  signal \RX_100_MBPS.fifo_flshr_cs[0]_i_1_n_0\ : STD_LOGIC;
  signal \RX_100_MBPS.fifo_ldr_cs[1]_i_1_n_0\ : STD_LOGIC;
  signal \RX_100_MBPS.rx_begin_packet[0]_i_1_n_0\ : STD_LOGIC;
  signal \RX_100_MBPS.rx_begin_packet[0]_i_2_n_0\ : STD_LOGIC;
  signal \RX_100_MBPS.rx_begin_packet[1]_i_1_n_0\ : STD_LOGIC;
  signal \RX_100_MBPS.rx_end_packet[0]_i_1_n_0\ : STD_LOGIC;
  signal \RX_100_MBPS.rx_end_packet[1]_i_1_n_0\ : STD_LOGIC;
  signal \^rmii2mac_rx_er\ : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal fIFO_Data_Exists : STD_LOGIC;
  signal fifo_flshr_cs : STD_LOGIC_VECTOR ( 1 to 1 );
  signal fifo_ldr_cs : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_5_out : STD_LOGIC;
  signal phy2Rmii_crs_dv_d1 : STD_LOGIC;
  signal phy2Rmii_crs_dv_d2_0 : STD_LOGIC;
  signal phy2Rmii_crs_dv_d3 : STD_LOGIC;
  signal phy2Rmii_crs_dv_d4 : STD_LOGIC;
  signal phy2Rmii_rxd_d1 : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \^rmii2mac_crs_i\ : STD_LOGIC;
  signal rmii2Mac_rx_er_d1 : STD_LOGIC;
  signal rmii2Mac_rx_er_d2 : STD_LOGIC;
  signal rmii2Mac_rx_er_d3 : STD_LOGIC;
  signal rx_begin_packet : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rx_end_packet : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of \RX_100_MBPS.phy2Rmii_crs_dv_d1_reg\ : label is "no";
  attribute SHREG_EXTRACT of \RX_100_MBPS.phy2Rmii_rxd_d1_reg[2]\ : label is "no";
  attribute SHREG_EXTRACT of \RX_100_MBPS.phy2Rmii_rxd_d1_reg[3]\ : label is "no";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \RX_100_MBPS.rmii2Mac_crs_i_i_1\ : label is "soft_lutpair3";
  attribute SHREG_EXTRACT of \RX_100_MBPS.rmii2Mac_rx_er_d1_reg\ : label is "no";
  attribute SOFT_HLUTNM of \RX_100_MBPS.rx_begin_packet[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \RX_100_MBPS.rx_end_packet[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of rmii2mac_col_i_1 : label is "soft_lutpair3";
begin
  Q(0) <= \^q\(0);
  Rmii2Mac_rx_er <= \^rmii2mac_rx_er\;
  SR(0) <= \^sr\(0);
  rmii2Mac_crs_i <= \^rmii2mac_crs_i\;
\RX_100_MBPS.I_SRL_FIFO\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SRL_FIFO
     port map (
      \Addr_Counters[3].FDRE_I_0\ => \^sr\(0),
      D(0) => fIFO_Data_Exists,
      Data_In(3) => Data_In(1),
      Data_In(2) => Data_In(2),
      Data_In(1) => Data_In(3),
      Data_In(0) => Data_In(4),
      Q(0) => fifo_ldr_cs(1),
      \RX_100_MBPS.Rmii2Mac_rxd_reg[3]\(3) => \RX_100_MBPS.I_SRL_FIFO_n_3\,
      \RX_100_MBPS.Rmii2Mac_rxd_reg[3]\(2) => \RX_100_MBPS.I_SRL_FIFO_n_4\,
      \RX_100_MBPS.Rmii2Mac_rxd_reg[3]\(1) => \RX_100_MBPS.I_SRL_FIFO_n_5\,
      \RX_100_MBPS.Rmii2Mac_rxd_reg[3]\(0) => \RX_100_MBPS.I_SRL_FIFO_n_6\,
      \RX_100_MBPS.fifo_flshr_cs_reg[1]\(1) => fifo_flshr_cs(1),
      \RX_100_MBPS.fifo_flshr_cs_reg[1]\(0) => \^q\(0),
      \RX_100_MBPS.fifo_ldr_cs_reg[0]\ => \RX_100_MBPS.I_SRL_FIFO_n_2\,
      ref_clk => ref_clk,
      \rst_n_d_reg[1]\(0) => \rst_n_d_reg[1]\(0),
      rx_end_packet(1 downto 0) => rx_end_packet(1 downto 0)
    );
\RX_100_MBPS.Rmii2Mac_rx_dv_reg\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => \^q\(0),
      D => fifo_flshr_cs(1),
      Q => Rmii2Mac_rx_dv,
      R => \^sr\(0)
    );
\RX_100_MBPS.Rmii2Mac_rx_er_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0A000A0"
    )
        port map (
      I0 => \^rmii2mac_rx_er\,
      I1 => rmii2Mac_rx_er_d3,
      I2 => \rst_n_d_reg[1]\(0),
      I3 => \^q\(0),
      I4 => fifo_flshr_cs(1),
      O => \RX_100_MBPS.Rmii2Mac_rx_er_i_1_n_0\
    );
\RX_100_MBPS.Rmii2Mac_rx_er_reg\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RX_100_MBPS.Rmii2Mac_rx_er_i_1_n_0\,
      Q => \^rmii2mac_rx_er\,
      R => '0'
    );
\RX_100_MBPS.Rmii2Mac_rxd_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => \^q\(0),
      D => \RX_100_MBPS.I_SRL_FIFO_n_6\,
      Q => \rmii2mac_rxd_reg[3]\(0),
      R => \^sr\(0)
    );
\RX_100_MBPS.Rmii2Mac_rxd_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => \^q\(0),
      D => \RX_100_MBPS.I_SRL_FIFO_n_5\,
      Q => \rmii2mac_rxd_reg[3]\(1),
      R => \^sr\(0)
    );
\RX_100_MBPS.Rmii2Mac_rxd_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => \^q\(0),
      D => \RX_100_MBPS.I_SRL_FIFO_n_4\,
      Q => \rmii2mac_rxd_reg[3]\(2),
      R => \^sr\(0)
    );
\RX_100_MBPS.Rmii2Mac_rxd_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => \^q\(0),
      D => \RX_100_MBPS.I_SRL_FIFO_n_3\,
      Q => \rmii2mac_rxd_reg[3]\(3),
      R => \^sr\(0)
    );
\RX_100_MBPS.fifo_flshr_cs[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \RX_100_MBPS.fifo_flshr_cs[0]_i_1_n_0\
    );
\RX_100_MBPS.fifo_flshr_cs_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RX_100_MBPS.fifo_flshr_cs[0]_i_1_n_0\,
      Q => \^q\(0),
      R => \^sr\(0)
    );
\RX_100_MBPS.fifo_flshr_cs_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => fIFO_Data_Exists,
      Q => fifo_flshr_cs(1),
      R => \^sr\(0)
    );
\RX_100_MBPS.fifo_ldr_cs[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5504000455045504"
    )
        port map (
      I0 => fifo_ldr_cs(1),
      I1 => rx_begin_packet(0),
      I2 => rx_begin_packet(1),
      I3 => fifo_ldr_cs(0),
      I4 => rx_end_packet(1),
      I5 => rx_end_packet(0),
      O => \RX_100_MBPS.fifo_ldr_cs[1]_i_1_n_0\
    );
\RX_100_MBPS.fifo_ldr_cs_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RX_100_MBPS.I_SRL_FIFO_n_2\,
      Q => fifo_ldr_cs(0),
      R => \^sr\(0)
    );
\RX_100_MBPS.fifo_ldr_cs_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RX_100_MBPS.fifo_ldr_cs[1]_i_1_n_0\,
      Q => fifo_ldr_cs(1),
      R => \^sr\(0)
    );
\RX_100_MBPS.phy2Rmii_crs_dv_d1_reg\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2Rmii_crs_dv_d2,
      Q => phy2Rmii_crs_dv_d1,
      R => \^sr\(0)
    );
\RX_100_MBPS.phy2Rmii_crs_dv_d2_reg\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2Rmii_crs_dv_d1,
      Q => phy2Rmii_crs_dv_d2_0,
      R => \^sr\(0)
    );
\RX_100_MBPS.phy2Rmii_crs_dv_d3_reg\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2Rmii_crs_dv_d2_0,
      Q => phy2Rmii_crs_dv_d3,
      R => \^sr\(0)
    );
\RX_100_MBPS.phy2Rmii_crs_dv_d4_reg\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2Rmii_crs_dv_d3,
      Q => phy2Rmii_crs_dv_d4,
      R => \^sr\(0)
    );
\RX_100_MBPS.phy2Rmii_rxd_d1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \phy2Rmii_rxd_d2_reg[1]\(0),
      Q => phy2Rmii_rxd_d1(2),
      R => \^sr\(0)
    );
\RX_100_MBPS.phy2Rmii_rxd_d1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \phy2Rmii_rxd_d2_reg[1]\(1),
      Q => phy2Rmii_rxd_d1(3),
      R => \^sr\(0)
    );
\RX_100_MBPS.phy2Rmii_rxd_d2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2Rmii_rxd_d1(2),
      Q => L(2),
      R => \^sr\(0)
    );
\RX_100_MBPS.phy2Rmii_rxd_d2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2Rmii_rxd_d1(3),
      Q => L(3),
      R => \^sr\(0)
    );
\RX_100_MBPS.phy2Rmii_rxd_d3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => Data_In(2),
      Q => Data_In(4),
      R => \^sr\(0)
    );
\RX_100_MBPS.phy2Rmii_rxd_d3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => Data_In(1),
      Q => Data_In(3),
      R => \^sr\(0)
    );
\RX_100_MBPS.phy2Rmii_rxd_d3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => L(2),
      Q => Data_In(2),
      R => \^sr\(0)
    );
\RX_100_MBPS.phy2Rmii_rxd_d3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => L(3),
      Q => Data_In(1),
      R => \^sr\(0)
    );
\RX_100_MBPS.rmii2Mac_crs_i_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
        port map (
      I0 => phy2Rmii_crs_dv_d2_0,
      I1 => phy2Rmii_crs_dv_d4,
      I2 => \^rmii2mac_crs_i\,
      O => p_5_out
    );
\RX_100_MBPS.rmii2Mac_crs_i_reg\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => p_5_out,
      Q => \^rmii2mac_crs_i\,
      R => \^sr\(0)
    );
\RX_100_MBPS.rmii2Mac_rx_er_d1_reg\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2Rmii_rx_er_d2,
      Q => rmii2Mac_rx_er_d1,
      R => \^sr\(0)
    );
\RX_100_MBPS.rmii2Mac_rx_er_d2_reg\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => rmii2Mac_rx_er_d1,
      Q => rmii2Mac_rx_er_d2,
      R => \^sr\(0)
    );
\RX_100_MBPS.rmii2Mac_rx_er_d3_reg\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => rmii2Mac_rx_er_d2,
      Q => rmii2Mac_rx_er_d3,
      R => \^sr\(0)
    );
\RX_100_MBPS.rx_begin_packet[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000BAAA"
    )
        port map (
      I0 => rx_begin_packet(0),
      I1 => L(3),
      I2 => phy2Rmii_crs_dv_d2_0,
      I3 => L(2),
      I4 => \RX_100_MBPS.rx_begin_packet[0]_i_2_n_0\,
      O => \RX_100_MBPS.rx_begin_packet[0]_i_1_n_0\
    );
\RX_100_MBPS.rx_begin_packet[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4F"
    )
        port map (
      I0 => rx_end_packet(1),
      I1 => rx_end_packet(0),
      I2 => \rst_n_d_reg[1]\(0),
      O => \RX_100_MBPS.rx_begin_packet[0]_i_2_n_0\
    );
\RX_100_MBPS.rx_begin_packet[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8808"
    )
        port map (
      I0 => rx_begin_packet(0),
      I1 => \rst_n_d_reg[1]\(0),
      I2 => rx_end_packet(0),
      I3 => rx_end_packet(1),
      O => \RX_100_MBPS.rx_begin_packet[1]_i_1_n_0\
    );
\RX_100_MBPS.rx_begin_packet_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RX_100_MBPS.rx_begin_packet[0]_i_1_n_0\,
      Q => rx_begin_packet(0),
      R => '0'
    );
\RX_100_MBPS.rx_begin_packet_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RX_100_MBPS.rx_begin_packet[1]_i_1_n_0\,
      Q => rx_begin_packet(1),
      R => '0'
    );
\RX_100_MBPS.rx_end_packet[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D0D0D0DD00000000"
    )
        port map (
      I0 => rx_begin_packet(0),
      I1 => rx_begin_packet(1),
      I2 => rx_end_packet(0),
      I3 => phy2Rmii_crs_dv_d3,
      I4 => phy2Rmii_crs_dv_d2_0,
      I5 => \rst_n_d_reg[1]\(0),
      O => \RX_100_MBPS.rx_end_packet[0]_i_1_n_0\
    );
\RX_100_MBPS.rx_end_packet[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8808"
    )
        port map (
      I0 => rx_end_packet(0),
      I1 => \rst_n_d_reg[1]\(0),
      I2 => rx_begin_packet(0),
      I3 => rx_begin_packet(1),
      O => \RX_100_MBPS.rx_end_packet[1]_i_1_n_0\
    );
\RX_100_MBPS.rx_end_packet_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RX_100_MBPS.rx_end_packet[0]_i_1_n_0\,
      Q => rx_end_packet(0),
      R => '0'
    );
\RX_100_MBPS.rx_end_packet_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RX_100_MBPS.rx_end_packet[1]_i_1_n_0\,
      Q => rx_end_packet(1),
      R => '0'
    );
rmii2mac_col_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^rmii2mac_crs_i\,
      I1 => mac2Rmii_tx_en_d2,
      O => rmii2mac_col_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii is
  port (
    rst_n : in STD_LOGIC;
    ref_clk : in STD_LOGIC;
    mac2rmii_tx_en : in STD_LOGIC;
    mac2rmii_txd : in STD_LOGIC_VECTOR ( 3 downto 0 );
    mac2rmii_tx_er : in STD_LOGIC;
    rmii2mac_tx_clk : out STD_LOGIC;
    rmii2mac_rx_clk : out STD_LOGIC;
    rmii2mac_col : out STD_LOGIC;
    rmii2mac_crs : out STD_LOGIC;
    rmii2mac_rx_dv : out STD_LOGIC;
    rmii2mac_rx_er : out STD_LOGIC;
    rmii2mac_rxd : out STD_LOGIC_VECTOR ( 3 downto 0 );
    phy2rmii_crs_dv : in STD_LOGIC;
    phy2rmii_rx_er : in STD_LOGIC;
    phy2rmii_rxd : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rmii2phy_txd : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rmii2phy_tx_en : out STD_LOGIC
  );
  attribute C_FAMILY : string;
  attribute C_FAMILY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii : entity is "artix7";
  attribute C_FIXED_SPEED : string;
  attribute C_FIXED_SPEED of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii : entity is "1'b1";
  attribute C_INCLUDE_BUF : integer;
  attribute C_INCLUDE_BUF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii : entity is 0;
  attribute C_INSTANCE : string;
  attribute C_INSTANCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii : entity is "design_1_mii_to_rmii_0_0";
  attribute C_SPEED_100 : string;
  attribute C_SPEED_100 of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii : entity is "1'b1";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii : entity is "yes";
  attribute hdl : string;
  attribute hdl of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii : entity is "VHDL";
  attribute imp_netlist : string;
  attribute imp_netlist of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii : entity is "TRUE";
  attribute ip_group : string;
  attribute ip_group of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii : entity is "LOGICORE";
  attribute iptype : string;
  attribute iptype of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii : entity is "IP";
  attribute style : string;
  attribute style of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii : entity is "HDL";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii is
  signal \RMII_FIXED.I_RX_n_5\ : STD_LOGIC;
  signal \RMII_FIXED.I_RX_n_6\ : STD_LOGIC;
  signal \RMII_FIXED.I_RX_n_7\ : STD_LOGIC;
  signal \RMII_FIXED.I_RX_n_8\ : STD_LOGIC;
  signal \RMII_FIXED.I_RX_n_9\ : STD_LOGIC;
  signal \RMII_FIXED.I_TX_n_1\ : STD_LOGIC;
  signal \RMII_FIXED.I_TX_n_2\ : STD_LOGIC;
  signal Reset : STD_LOGIC;
  signal \^rmii2mac_rx_dv\ : STD_LOGIC;
  signal \^rmii2mac_rx_er\ : STD_LOGIC;
  signal \^rmii2phy_tx_en\ : STD_LOGIC;
  signal mac2Rmii_tx_en_d1 : STD_LOGIC;
  signal mac2Rmii_tx_en_d2 : STD_LOGIC;
  signal mac2Rmii_tx_er_d1 : STD_LOGIC;
  signal mac2Rmii_tx_er_d2 : STD_LOGIC;
  signal mac2Rmii_txd_d1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal mac2Rmii_txd_d2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal phy2Rmii_crs_dv_d1_reg_n_0 : STD_LOGIC;
  signal phy2Rmii_crs_dv_d2 : STD_LOGIC;
  signal phy2Rmii_rx_er_d1 : STD_LOGIC;
  signal phy2Rmii_rx_er_d2 : STD_LOGIC;
  signal \phy2Rmii_rxd_d1_reg_n_0_[0]\ : STD_LOGIC;
  signal \phy2Rmii_rxd_d1_reg_n_0_[1]\ : STD_LOGIC;
  signal phy2Rmii_rxd_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal rmii2Mac_crs_i : STD_LOGIC;
  signal rmii2Mac_rx_clk_i : STD_LOGIC;
  signal rmii2Mac_tx_clk_i : STD_LOGIC;
  signal \rst_n_d_reg_n_0_[0]\ : STD_LOGIC;
  signal sync_rst_n : STD_LOGIC;
  attribute sigis : string;
  attribute sigis of ref_clk : signal is "CLK";
  attribute sigis of rst_n : signal is "RST";
begin
\RMII_FIXED.I_RX\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rmii_rx_fixed
     port map (
      Q(0) => rmii2Mac_rx_clk_i,
      Rmii2Mac_rx_dv => \^rmii2mac_rx_dv\,
      Rmii2Mac_rx_er => \^rmii2mac_rx_er\,
      SR(0) => Reset,
      mac2Rmii_tx_en_d2 => mac2Rmii_tx_en_d2,
      phy2Rmii_crs_dv_d2 => phy2Rmii_crs_dv_d2,
      phy2Rmii_rx_er_d2 => phy2Rmii_rx_er_d2,
      \phy2Rmii_rxd_d2_reg[1]\(1 downto 0) => phy2Rmii_rxd_d2(1 downto 0),
      ref_clk => ref_clk,
      rmii2Mac_crs_i => rmii2Mac_crs_i,
      rmii2mac_col_reg => \RMII_FIXED.I_RX_n_9\,
      \rmii2mac_rxd_reg[3]\(3) => \RMII_FIXED.I_RX_n_5\,
      \rmii2mac_rxd_reg[3]\(2) => \RMII_FIXED.I_RX_n_6\,
      \rmii2mac_rxd_reg[3]\(1) => \RMII_FIXED.I_RX_n_7\,
      \rmii2mac_rxd_reg[3]\(0) => \RMII_FIXED.I_RX_n_8\,
      \rst_n_d_reg[1]\(0) => sync_rst_n
    );
\RMII_FIXED.I_TX\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_rmii_tx_fixed
     port map (
      Q(3 downto 0) => mac2Rmii_txd_d2(3 downto 0),
      Rmii2Phy_tx_en => \^rmii2phy_tx_en\,
      SR(0) => Reset,
      mac2Rmii_tx_en_d2 => mac2Rmii_tx_en_d2,
      mac2Rmii_tx_er_d2 => mac2Rmii_tx_er_d2,
      ref_clk => ref_clk,
      rmii2Mac_tx_clk_i => rmii2Mac_tx_clk_i,
      \rmii2phy_txd_reg[1]\(1) => \RMII_FIXED.I_TX_n_1\,
      \rmii2phy_txd_reg[1]\(0) => \RMII_FIXED.I_TX_n_2\
    );
mac2Rmii_tx_en_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2rmii_tx_en,
      Q => mac2Rmii_tx_en_d1,
      R => Reset
    );
mac2Rmii_tx_en_d2_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2Rmii_tx_en_d1,
      Q => mac2Rmii_tx_en_d2,
      R => Reset
    );
mac2Rmii_tx_er_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2rmii_tx_er,
      Q => mac2Rmii_tx_er_d1,
      R => Reset
    );
mac2Rmii_tx_er_d2_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2Rmii_tx_er_d1,
      Q => mac2Rmii_tx_er_d2,
      R => Reset
    );
\mac2Rmii_txd_d1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2rmii_txd(0),
      Q => mac2Rmii_txd_d1(0),
      R => Reset
    );
\mac2Rmii_txd_d1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2rmii_txd(1),
      Q => mac2Rmii_txd_d1(1),
      R => Reset
    );
\mac2Rmii_txd_d1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2rmii_txd(2),
      Q => mac2Rmii_txd_d1(2),
      R => Reset
    );
\mac2Rmii_txd_d1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2rmii_txd(3),
      Q => mac2Rmii_txd_d1(3),
      R => Reset
    );
\mac2Rmii_txd_d2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2Rmii_txd_d1(0),
      Q => mac2Rmii_txd_d2(0),
      R => Reset
    );
\mac2Rmii_txd_d2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2Rmii_txd_d1(1),
      Q => mac2Rmii_txd_d2(1),
      R => Reset
    );
\mac2Rmii_txd_d2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2Rmii_txd_d1(2),
      Q => mac2Rmii_txd_d2(2),
      R => Reset
    );
\mac2Rmii_txd_d2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => mac2Rmii_txd_d1(3),
      Q => mac2Rmii_txd_d2(3),
      R => Reset
    );
phy2Rmii_crs_dv_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2rmii_crs_dv,
      Q => phy2Rmii_crs_dv_d1_reg_n_0,
      R => Reset
    );
phy2Rmii_crs_dv_d2_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2Rmii_crs_dv_d1_reg_n_0,
      Q => phy2Rmii_crs_dv_d2,
      R => Reset
    );
phy2Rmii_rx_er_d1_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2rmii_rx_er,
      Q => phy2Rmii_rx_er_d1,
      R => Reset
    );
phy2Rmii_rx_er_d2_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2Rmii_rx_er_d1,
      Q => phy2Rmii_rx_er_d2,
      R => Reset
    );
\phy2Rmii_rxd_d1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2rmii_rxd(0),
      Q => \phy2Rmii_rxd_d1_reg_n_0_[0]\,
      R => Reset
    );
\phy2Rmii_rxd_d1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => phy2rmii_rxd(1),
      Q => \phy2Rmii_rxd_d1_reg_n_0_[1]\,
      R => Reset
    );
\phy2Rmii_rxd_d2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \phy2Rmii_rxd_d1_reg_n_0_[0]\,
      Q => phy2Rmii_rxd_d2(0),
      R => Reset
    );
\phy2Rmii_rxd_d2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \phy2Rmii_rxd_d1_reg_n_0_[1]\,
      Q => phy2Rmii_rxd_d2(1),
      R => Reset
    );
rmii2mac_col_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RMII_FIXED.I_RX_n_9\,
      Q => rmii2mac_col,
      R => Reset
    );
rmii2mac_crs_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => rmii2Mac_crs_i,
      Q => rmii2mac_crs,
      R => Reset
    );
rmii2mac_rx_clk_bi_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => rmii2Mac_rx_clk_i,
      Q => rmii2mac_rx_clk,
      R => Reset
    );
rmii2mac_rx_dv_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \^rmii2mac_rx_dv\,
      Q => rmii2mac_rx_dv,
      R => Reset
    );
rmii2mac_rx_er_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \^rmii2mac_rx_er\,
      Q => rmii2mac_rx_er,
      R => Reset
    );
\rmii2mac_rxd_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RMII_FIXED.I_RX_n_8\,
      Q => rmii2mac_rxd(0),
      R => Reset
    );
\rmii2mac_rxd_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RMII_FIXED.I_RX_n_7\,
      Q => rmii2mac_rxd(1),
      R => Reset
    );
\rmii2mac_rxd_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RMII_FIXED.I_RX_n_6\,
      Q => rmii2mac_rxd(2),
      R => Reset
    );
\rmii2mac_rxd_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RMII_FIXED.I_RX_n_5\,
      Q => rmii2mac_rxd(3),
      R => Reset
    );
rmii2mac_tx_clk_bi_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => rmii2Mac_tx_clk_i,
      Q => rmii2mac_tx_clk,
      R => Reset
    );
rmii2phy_tx_en_reg: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \^rmii2phy_tx_en\,
      Q => rmii2phy_tx_en,
      R => Reset
    );
\rmii2phy_txd_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RMII_FIXED.I_TX_n_2\,
      Q => rmii2phy_txd(0),
      R => Reset
    );
\rmii2phy_txd_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \RMII_FIXED.I_TX_n_1\,
      Q => rmii2phy_txd(1),
      R => Reset
    );
\rst_n_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => rst_n,
      Q => \rst_n_d_reg_n_0_[0]\,
      R => '0'
    );
\rst_n_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => ref_clk,
      CE => '1',
      D => \rst_n_d_reg_n_0_[0]\,
      Q => sync_rst_n,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    rst_n : in STD_LOGIC;
    ref_clk : in STD_LOGIC;
    mac2rmii_tx_en : in STD_LOGIC;
    mac2rmii_txd : in STD_LOGIC_VECTOR ( 3 downto 0 );
    mac2rmii_tx_er : in STD_LOGIC;
    rmii2mac_tx_clk : out STD_LOGIC;
    rmii2mac_rx_clk : out STD_LOGIC;
    rmii2mac_col : out STD_LOGIC;
    rmii2mac_crs : out STD_LOGIC;
    rmii2mac_rx_dv : out STD_LOGIC;
    rmii2mac_rx_er : out STD_LOGIC;
    rmii2mac_rxd : out STD_LOGIC_VECTOR ( 3 downto 0 );
    phy2rmii_crs_dv : in STD_LOGIC;
    phy2rmii_rx_er : in STD_LOGIC;
    phy2rmii_rxd : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rmii2phy_txd : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rmii2phy_tx_en : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_mii_to_rmii_0_0,mii_to_rmii,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "mii_to_rmii,Vivado 2017.4";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_FIXED_SPEED : string;
  attribute C_FIXED_SPEED of U0 : label is "1'b1";
  attribute C_INCLUDE_BUF : integer;
  attribute C_INCLUDE_BUF of U0 : label is 0;
  attribute C_INSTANCE : string;
  attribute C_INSTANCE of U0 : label is "design_1_mii_to_rmii_0_0";
  attribute C_SPEED_100 : string;
  attribute C_SPEED_100 of U0 : label is "1'b1";
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
  attribute hdl : string;
  attribute hdl of U0 : label is "VHDL";
  attribute imp_netlist : string;
  attribute imp_netlist of U0 : label is "TRUE";
  attribute ip_group : string;
  attribute ip_group of U0 : label is "LOGICORE";
  attribute iptype : string;
  attribute iptype of U0 : label is "IP";
  attribute style : string;
  attribute style of U0 : label is "HDL";
  attribute x_interface_info : string;
  attribute x_interface_info of mac2rmii_tx_en : signal is "xilinx.com:interface:mii:1.0 MII TX_EN";
  attribute x_interface_info of mac2rmii_tx_er : signal is "xilinx.com:interface:mii:1.0 MII TX_ER";
  attribute x_interface_info of phy2rmii_crs_dv : signal is "xilinx.com:interface:rmii:1.0 RMII_PHY_M CRS_DV";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of phy2rmii_crs_dv : signal is "XIL_INTERFACENAME RMII_PHY_M, BOARD.ASSOCIATED_PARAM RMII_BOARD_INTERFACE";
  attribute x_interface_info of phy2rmii_rx_er : signal is "xilinx.com:interface:rmii:1.0 RMII_PHY_M RX_ER";
  attribute x_interface_info of ref_clk : signal is "xilinx.com:signal:clock:1.0 clock CLK";
  attribute x_interface_parameter of ref_clk : signal is "XIL_INTERFACENAME clock, BOARD.ASSOCIATED_PARAM REF_CLK_BOARD_INTERFACE, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1";
  attribute x_interface_info of rmii2mac_col : signal is "xilinx.com:interface:mii:1.0 MII COL";
  attribute x_interface_info of rmii2mac_crs : signal is "xilinx.com:interface:mii:1.0 MII CRS";
  attribute x_interface_info of rmii2mac_rx_clk : signal is "xilinx.com:interface:mii:1.0 MII RX_CLK";
  attribute x_interface_info of rmii2mac_rx_dv : signal is "xilinx.com:interface:mii:1.0 MII RX_DV";
  attribute x_interface_info of rmii2mac_rx_er : signal is "xilinx.com:interface:mii:1.0 MII RX_ER";
  attribute x_interface_info of rmii2mac_tx_clk : signal is "xilinx.com:interface:mii:1.0 MII TX_CLK";
  attribute x_interface_info of rmii2phy_tx_en : signal is "xilinx.com:interface:rmii:1.0 RMII_PHY_M TX_EN";
  attribute x_interface_info of rst_n : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute x_interface_parameter of rst_n : signal is "XIL_INTERFACENAME rst, BOARD.ASSOCIATED_PARAM RESET_BOARD_INTERFACE, POLARITY ACTIVE_LOW";
  attribute x_interface_info of mac2rmii_txd : signal is "xilinx.com:interface:mii:1.0 MII TXD";
  attribute x_interface_info of phy2rmii_rxd : signal is "xilinx.com:interface:rmii:1.0 RMII_PHY_M RXD";
  attribute x_interface_info of rmii2mac_rxd : signal is "xilinx.com:interface:mii:1.0 MII RXD";
  attribute x_interface_info of rmii2phy_txd : signal is "xilinx.com:interface:rmii:1.0 RMII_PHY_M TXD";
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mii_to_rmii
     port map (
      mac2rmii_tx_en => mac2rmii_tx_en,
      mac2rmii_tx_er => mac2rmii_tx_er,
      mac2rmii_txd(3 downto 0) => mac2rmii_txd(3 downto 0),
      phy2rmii_crs_dv => phy2rmii_crs_dv,
      phy2rmii_rx_er => phy2rmii_rx_er,
      phy2rmii_rxd(1 downto 0) => phy2rmii_rxd(1 downto 0),
      ref_clk => ref_clk,
      rmii2mac_col => rmii2mac_col,
      rmii2mac_crs => rmii2mac_crs,
      rmii2mac_rx_clk => rmii2mac_rx_clk,
      rmii2mac_rx_dv => rmii2mac_rx_dv,
      rmii2mac_rx_er => rmii2mac_rx_er,
      rmii2mac_rxd(3 downto 0) => rmii2mac_rxd(3 downto 0),
      rmii2mac_tx_clk => rmii2mac_tx_clk,
      rmii2phy_tx_en => rmii2phy_tx_en,
      rmii2phy_txd(1 downto 0) => rmii2phy_txd(1 downto 0),
      rst_n => rst_n
    );
end STRUCTURE;
