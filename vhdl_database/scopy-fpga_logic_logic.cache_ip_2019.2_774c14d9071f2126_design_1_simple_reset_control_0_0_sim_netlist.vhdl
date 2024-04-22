-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Thu Mar 26 17:37:46 2020
-- Host        : TomsDesktop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_simple_reset_control_0_0_sim_netlist.vhdl
-- Design      : design_1_simple_reset_control_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z014sclg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_simple_reset_controller_v1_0 is
  port (
    g_rst_gen : out STD_LOGIC;
    clk_master : in STD_LOGIC;
    g_rst_trig_ps : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_simple_reset_controller_v1_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_simple_reset_controller_v1_0 is
  signal g_rst_counter : STD_LOGIC;
  signal \g_rst_counter[7]_i_4_n_0\ : STD_LOGIC;
  signal g_rst_counter_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^g_rst_gen\ : STD_LOGIC;
  signal g_rst_gen_reg_i_1_n_0 : STD_LOGIC;
  signal g_rst_gen_reg_i_2_n_0 : STD_LOGIC;
  signal g_rst_state_i_1_n_0 : STD_LOGIC;
  signal g_rst_state_reg_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \g_rst_counter[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \g_rst_counter[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \g_rst_counter[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \g_rst_counter[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \g_rst_counter[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \g_rst_counter[7]_i_4\ : label is "soft_lutpair1";
begin
  g_rst_gen <= \^g_rst_gen\;
\g_rst_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => g_rst_counter_reg(0),
      O => p_0_in(0)
    );
\g_rst_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => g_rst_counter_reg(0),
      I1 => g_rst_counter_reg(1),
      O => p_0_in(1)
    );
\g_rst_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => g_rst_counter_reg(0),
      I1 => g_rst_counter_reg(1),
      I2 => g_rst_counter_reg(2),
      O => p_0_in(2)
    );
\g_rst_counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => g_rst_counter_reg(3),
      I1 => g_rst_counter_reg(0),
      I2 => g_rst_counter_reg(1),
      I3 => g_rst_counter_reg(2),
      O => p_0_in(3)
    );
\g_rst_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => g_rst_counter_reg(4),
      I1 => g_rst_counter_reg(2),
      I2 => g_rst_counter_reg(1),
      I3 => g_rst_counter_reg(0),
      I4 => g_rst_counter_reg(3),
      O => p_0_in(4)
    );
\g_rst_counter[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => g_rst_counter_reg(5),
      I1 => g_rst_counter_reg(3),
      I2 => g_rst_counter_reg(0),
      I3 => g_rst_counter_reg(1),
      I4 => g_rst_counter_reg(2),
      I5 => g_rst_counter_reg(4),
      O => p_0_in(5)
    );
\g_rst_counter[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => g_rst_counter_reg(6),
      I1 => g_rst_counter_reg(4),
      I2 => \g_rst_counter[7]_i_4_n_0\,
      I3 => g_rst_counter_reg(3),
      I4 => g_rst_counter_reg(5),
      O => p_0_in(6)
    );
\g_rst_counter[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => g_rst_state_reg_n_0,
      I1 => g_rst_trig_ps,
      O => g_rst_counter
    );
\g_rst_counter[7]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => g_rst_state_reg_n_0,
      O => p_0_in_0
    );
\g_rst_counter[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => g_rst_counter_reg(7),
      I1 => g_rst_counter_reg(5),
      I2 => g_rst_counter_reg(3),
      I3 => \g_rst_counter[7]_i_4_n_0\,
      I4 => g_rst_counter_reg(4),
      I5 => g_rst_counter_reg(6),
      O => p_0_in(7)
    );
\g_rst_counter[7]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => g_rst_counter_reg(2),
      I1 => g_rst_counter_reg(1),
      I2 => g_rst_counter_reg(0),
      O => \g_rst_counter[7]_i_4_n_0\
    );
\g_rst_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_master,
      CE => p_0_in_0,
      D => p_0_in(0),
      Q => g_rst_counter_reg(0),
      R => g_rst_counter
    );
\g_rst_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_master,
      CE => p_0_in_0,
      D => p_0_in(1),
      Q => g_rst_counter_reg(1),
      R => g_rst_counter
    );
\g_rst_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_master,
      CE => p_0_in_0,
      D => p_0_in(2),
      Q => g_rst_counter_reg(2),
      R => g_rst_counter
    );
\g_rst_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_master,
      CE => p_0_in_0,
      D => p_0_in(3),
      Q => g_rst_counter_reg(3),
      R => g_rst_counter
    );
\g_rst_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_master,
      CE => p_0_in_0,
      D => p_0_in(4),
      Q => g_rst_counter_reg(4),
      R => g_rst_counter
    );
\g_rst_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_master,
      CE => p_0_in_0,
      D => p_0_in(5),
      Q => g_rst_counter_reg(5),
      R => g_rst_counter
    );
\g_rst_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_master,
      CE => p_0_in_0,
      D => p_0_in(6),
      Q => g_rst_counter_reg(6),
      R => g_rst_counter
    );
\g_rst_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_master,
      CE => p_0_in_0,
      D => p_0_in(7),
      Q => g_rst_counter_reg(7),
      R => g_rst_counter
    );
g_rst_gen_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA8EAAAA"
    )
        port map (
      I0 => \^g_rst_gen\,
      I1 => g_rst_counter_reg(2),
      I2 => g_rst_counter_reg(7),
      I3 => g_rst_counter_reg(0),
      I4 => g_rst_gen_reg_i_2_n_0,
      O => g_rst_gen_reg_i_1_n_0
    );
g_rst_gen_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => g_rst_counter_reg(6),
      I1 => g_rst_counter_reg(4),
      I2 => g_rst_state_reg_n_0,
      I3 => g_rst_counter_reg(3),
      I4 => g_rst_counter_reg(1),
      I5 => g_rst_counter_reg(5),
      O => g_rst_gen_reg_i_2_n_0
    );
g_rst_gen_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_master,
      CE => '1',
      D => g_rst_gen_reg_i_1_n_0,
      Q => \^g_rst_gen\,
      R => '0'
    );
g_rst_state_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5575555500300000"
    )
        port map (
      I0 => g_rst_trig_ps,
      I1 => g_rst_counter_reg(2),
      I2 => g_rst_counter_reg(7),
      I3 => g_rst_counter_reg(0),
      I4 => g_rst_gen_reg_i_2_n_0,
      I5 => g_rst_state_reg_n_0,
      O => g_rst_state_i_1_n_0
    );
g_rst_state_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_master,
      CE => '1',
      D => g_rst_state_i_1_n_0,
      Q => g_rst_state_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk_master : in STD_LOGIC;
    g_rst_trig_ps : in STD_LOGIC;
    g_rst_gen : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_simple_reset_control_0_0,simple_reset_controller_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "simple_reset_controller_v1_0,Vivado 2019.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_simple_reset_controller_v1_0
     port map (
      clk_master => clk_master,
      g_rst_gen => g_rst_gen,
      g_rst_trig_ps => g_rst_trig_ps
    );
end STRUCTURE;
