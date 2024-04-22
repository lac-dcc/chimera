-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed May 22 14:40:42 2019
-- Host        : ENGR-RCL11G running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top streaming_TickGenerator_0_0 -prefix
--               streaming_TickGenerator_0_0_ streaming_TickGenerator_0_1_sim_netlist.vhdl
-- Design      : streaming_TickGenerator_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu9eg-ffvb1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity streaming_TickGenerator_0_0_TickGenerator is
  port (
    intr : out STD_LOGIC;
    tick : out STD_LOGIC;
    en : in STD_LOGIC;
    clk : in STD_LOGIC
  );
end streaming_TickGenerator_0_0_TickGenerator;

architecture STRUCTURE of streaming_TickGenerator_0_0_TickGenerator is
  signal counter : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal counter_0 : STD_LOGIC_VECTOR ( 21 downto 0 );
  signal \counter_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \counter_reg[16]_i_2_n_1\ : STD_LOGIC;
  signal \counter_reg[16]_i_2_n_2\ : STD_LOGIC;
  signal \counter_reg[16]_i_2_n_3\ : STD_LOGIC;
  signal \counter_reg[16]_i_2_n_5\ : STD_LOGIC;
  signal \counter_reg[16]_i_2_n_6\ : STD_LOGIC;
  signal \counter_reg[16]_i_2_n_7\ : STD_LOGIC;
  signal \counter_reg[21]_i_3_n_5\ : STD_LOGIC;
  signal \counter_reg[21]_i_3_n_6\ : STD_LOGIC;
  signal \counter_reg[21]_i_3_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_2_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_2_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_2_n_7\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 21 downto 1 );
  signal \^intr\ : STD_LOGIC;
  signal intr_i_1_n_0 : STD_LOGIC;
  signal intr_i_2_n_0 : STD_LOGIC;
  signal intr_i_3_n_0 : STD_LOGIC;
  signal intr_i_4_n_0 : STD_LOGIC;
  signal intr_i_5_n_0 : STD_LOGIC;
  signal intr_i_6_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal tick_i_1_n_0 : STD_LOGIC;
  signal tick_i_2_n_0 : STD_LOGIC;
  signal tick_i_3_n_0 : STD_LOGIC;
  signal tick_i_4_n_0 : STD_LOGIC;
  signal tick_i_5_n_0 : STD_LOGIC;
  signal tick_i_6_n_0 : STD_LOGIC;
  signal \NLW_counter_reg[16]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_counter_reg[21]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_counter_reg[21]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \NLW_counter_reg[8]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of intr_i_4 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of tick_i_6 : label is "soft_lutpair0";
begin
  intr <= \^intr\;
\counter[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFFFFD"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => counter(0),
      O => counter_0(0)
    );
\counter[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(10),
      O => counter_0(10)
    );
\counter[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(11),
      O => counter_0(11)
    );
\counter[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(12),
      O => counter_0(12)
    );
\counter[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(13),
      O => counter_0(13)
    );
\counter[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(14),
      O => counter_0(14)
    );
\counter[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(15),
      O => counter_0(15)
    );
\counter[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(16),
      O => counter_0(16)
    );
\counter[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(17),
      O => counter_0(17)
    );
\counter[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(18),
      O => counter_0(18)
    );
\counter[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(19),
      O => counter_0(19)
    );
\counter[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(1),
      O => counter_0(1)
    );
\counter[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(20),
      O => counter_0(20)
    );
\counter[21]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => en,
      O => p_0_in
    );
\counter[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(21),
      O => counter_0(21)
    );
\counter[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(2),
      O => counter_0(2)
    );
\counter[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(3),
      O => counter_0(3)
    );
\counter[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(4),
      O => counter_0(4)
    );
\counter[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(5),
      O => counter_0(5)
    );
\counter[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(6),
      O => counter_0(6)
    );
\counter[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(7),
      O => counter_0(7)
    );
\counter[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(8),
      O => counter_0(8)
    );
\counter[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => data0(9),
      O => counter_0(9)
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(0),
      Q => counter(0),
      R => p_0_in
    );
\counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(10),
      Q => counter(10),
      R => p_0_in
    );
\counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(11),
      Q => counter(11),
      R => p_0_in
    );
\counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(12),
      Q => counter(12),
      R => p_0_in
    );
\counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(13),
      Q => counter(13),
      R => p_0_in
    );
\counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(14),
      Q => counter(14),
      R => p_0_in
    );
\counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(15),
      Q => counter(15),
      R => p_0_in
    );
\counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(16),
      Q => counter(16),
      R => p_0_in
    );
\counter_reg[16]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => \counter_reg[8]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \counter_reg[16]_i_2_n_0\,
      CO(6) => \counter_reg[16]_i_2_n_1\,
      CO(5) => \counter_reg[16]_i_2_n_2\,
      CO(4) => \counter_reg[16]_i_2_n_3\,
      CO(3) => \NLW_counter_reg[16]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \counter_reg[16]_i_2_n_5\,
      CO(1) => \counter_reg[16]_i_2_n_6\,
      CO(0) => \counter_reg[16]_i_2_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => data0(16 downto 9),
      S(7 downto 0) => counter(16 downto 9)
    );
\counter_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(17),
      Q => counter(17),
      R => p_0_in
    );
\counter_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(18),
      Q => counter(18),
      R => p_0_in
    );
\counter_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(19),
      Q => counter(19),
      R => p_0_in
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(1),
      Q => counter(1),
      R => p_0_in
    );
\counter_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(20),
      Q => counter(20),
      R => p_0_in
    );
\counter_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(21),
      Q => counter(21),
      R => p_0_in
    );
\counter_reg[21]_i_3\: unisim.vcomponents.CARRY8
     port map (
      CI => \counter_reg[16]_i_2_n_0\,
      CI_TOP => '0',
      CO(7 downto 3) => \NLW_counter_reg[21]_i_3_CO_UNCONNECTED\(7 downto 3),
      CO(2) => \counter_reg[21]_i_3_n_5\,
      CO(1) => \counter_reg[21]_i_3_n_6\,
      CO(0) => \counter_reg[21]_i_3_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 5) => \NLW_counter_reg[21]_i_3_O_UNCONNECTED\(7 downto 5),
      O(4 downto 0) => data0(21 downto 17),
      S(7 downto 5) => B"000",
      S(4 downto 0) => counter(21 downto 17)
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(2),
      Q => counter(2),
      R => p_0_in
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(3),
      Q => counter(3),
      R => p_0_in
    );
\counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(4),
      Q => counter(4),
      R => p_0_in
    );
\counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(5),
      Q => counter(5),
      R => p_0_in
    );
\counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(6),
      Q => counter(6),
      R => p_0_in
    );
\counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(7),
      Q => counter(7),
      R => p_0_in
    );
\counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(8),
      Q => counter(8),
      R => p_0_in
    );
\counter_reg[8]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => counter(0),
      CI_TOP => '0',
      CO(7) => \counter_reg[8]_i_2_n_0\,
      CO(6) => \counter_reg[8]_i_2_n_1\,
      CO(5) => \counter_reg[8]_i_2_n_2\,
      CO(4) => \counter_reg[8]_i_2_n_3\,
      CO(3) => \NLW_counter_reg[8]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \counter_reg[8]_i_2_n_5\,
      CO(1) => \counter_reg[8]_i_2_n_6\,
      CO(0) => \counter_reg[8]_i_2_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => data0(8 downto 1),
      S(7 downto 0) => counter(8 downto 1)
    );
\counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => counter_0(9),
      Q => counter(9),
      R => p_0_in
    );
intr_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA8"
    )
        port map (
      I0 => \^intr\,
      I1 => intr_i_2_n_0,
      I2 => intr_i_3_n_0,
      I3 => intr_i_4_n_0,
      I4 => counter(16),
      I5 => counter(11),
      O => intr_i_1_n_0
    );
intr_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFFFFFF"
    )
        port map (
      I0 => intr_i_5_n_0,
      I1 => intr_i_6_n_0,
      I2 => counter(20),
      I3 => counter(2),
      I4 => en,
      I5 => tick_i_3_n_0,
      O => intr_i_2_n_0
    );
intr_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => counter(5),
      I1 => counter(4),
      I2 => counter(14),
      I3 => counter(3),
      O => intr_i_3_n_0
    );
intr_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => counter(8),
      I1 => counter(9),
      O => intr_i_4_n_0
    );
intr_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => counter(10),
      I1 => counter(18),
      I2 => counter(7),
      I3 => counter(19),
      O => intr_i_5_n_0
    );
intr_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => counter(0),
      I1 => counter(15),
      I2 => counter(1),
      I3 => counter(17),
      O => intr_i_6_n_0
    );
intr_reg: unisim.vcomponents.FDSE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => intr_i_1_n_0,
      Q => \^intr\,
      S => tick_i_1_n_0
    );
tick_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => tick_i_2_n_0,
      I1 => tick_i_3_n_0,
      I2 => tick_i_4_n_0,
      I3 => tick_i_5_n_0,
      I4 => tick_i_6_n_0,
      I5 => en,
      O => tick_i_1_n_0
    );
tick_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => counter(11),
      I1 => counter(16),
      I2 => counter(3),
      I3 => counter(14),
      I4 => counter(4),
      I5 => counter(5),
      O => tick_i_2_n_0
    );
tick_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => counter(13),
      I1 => counter(12),
      I2 => counter(21),
      I3 => counter(6),
      O => tick_i_3_n_0
    );
tick_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => counter(20),
      I1 => counter(10),
      I2 => counter(7),
      I3 => counter(0),
      O => tick_i_4_n_0
    );
tick_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => counter(15),
      I1 => counter(1),
      I2 => counter(18),
      I3 => counter(19),
      O => tick_i_5_n_0
    );
tick_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => counter(9),
      I1 => counter(8),
      I2 => counter(17),
      I3 => counter(2),
      O => tick_i_6_n_0
    );
tick_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk,
      CE => '1',
      D => '0',
      Q => tick,
      S => tick_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity streaming_TickGenerator_0_0 is
  port (
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    tick : out STD_LOGIC;
    intr : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of streaming_TickGenerator_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of streaming_TickGenerator_0_0 : entity is "streaming_TickGenerator_0_1,TickGenerator,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of streaming_TickGenerator_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of streaming_TickGenerator_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of streaming_TickGenerator_0_0 : entity is "TickGenerator,Vivado 2018.2";
end streaming_TickGenerator_0_0;

architecture STRUCTURE of streaming_TickGenerator_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 99990000, PHASE 0.000, CLK_DOMAIN streaming_zynq_ultra_ps_e_0_0_pl_clk0";
  attribute X_INTERFACE_INFO of intr : signal is "xilinx.com:signal:interrupt:1.0 intr INTERRUPT";
  attribute X_INTERFACE_PARAMETER of intr : signal is "XIL_INTERFACENAME intr, SENSITIVITY LEVEL_HIGH, PortWidth 1";
begin
inst: entity work.streaming_TickGenerator_0_0_TickGenerator
     port map (
      clk => clk,
      en => en,
      intr => intr,
      tick => tick
    );
end STRUCTURE;
