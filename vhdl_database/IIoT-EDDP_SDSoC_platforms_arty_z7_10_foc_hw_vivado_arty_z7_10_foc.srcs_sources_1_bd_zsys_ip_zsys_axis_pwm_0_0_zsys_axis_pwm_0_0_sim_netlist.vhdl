-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
-- Date        : Thu Oct  5 15:58:08 2017
-- Host        : free-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               B:/cores/2017.1/design/TEC0053/platforms/arty_z7_10_foc/hw/vivado/arty_z7_10_foc.srcs/sources_1/bd/zsys/ip/zsys_axis_pwm_0_0/zsys_axis_pwm_0_0_sim_netlist.vhdl
-- Design      : zsys_axis_pwm_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_pwm_0_0_unimacro_MULT_MACRO is
  port (
    P : out STD_LOGIC_VECTOR ( 16 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    \bipolar_gen.h_end_reg[0][12]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[0][12]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[0][4]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[0][4]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[0][8]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[0][12]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[0][16]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[0][17]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \bipolar_gen.h_end_reg[0][12]_1\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \bipolar_gen.h_end_reg[0][12]_2\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[0][8]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[0][17]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \bipolar_gen.h_end_reg[0][16]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[0][12]_3\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 16 downto 0 );
    s_axis_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zsys_axis_pwm_0_0_unimacro_MULT_MACRO : entity is "unimacro_MULT_MACRO";
end zsys_axis_pwm_0_0_unimacro_MULT_MACRO;

architecture STRUCTURE of zsys_axis_pwm_0_0_unimacro_MULT_MACRO is
  signal \^p\ : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal RESULT_OUT : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \mult_p[0]_0\ : STD_LOGIC_VECTOR ( 33 to 33 );
  signal \v5.v5_2.DSP48E_1_n_60\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_61\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_80\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_81\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_82\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_83\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_84\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_85\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_86\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_87\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_88\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_89\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_90\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_91\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_92\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_93\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_94\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_95\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_v5.v5_2.DSP48E_1_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_v5.v5_2.DSP48E_1_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_v5.v5_2.DSP48E_1_P_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 43 );
  signal \NLW_v5.v5_2.DSP48E_1_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \v5.v5_2.DSP48E_1\ : label is "DSP48E";
  attribute box_type : string;
  attribute box_type of \v5.v5_2.DSP48E_1\ : label is "PRIMITIVE";
begin
  P(16 downto 0) <= \^p\(16 downto 0);
\bipolar_gen.h_end[0][0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(0),
      O => D(0)
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(14),
      I1 => \^p\(15),
      O => \bipolar_gen.h_end_reg[0][12]_2\(3)
    );
\i__carry__0_i_1__10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(8),
      O => \bipolar_gen.h_end_reg[0][8]\(3)
    );
\i__carry__0_i_1__12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(8),
      O => \bipolar_gen.l_start_reg[0][8]\(3)
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(12),
      I1 => \^p\(13),
      O => \bipolar_gen.h_end_reg[0][12]_2\(2)
    );
\i__carry__0_i_2__11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(7),
      O => \bipolar_gen.h_end_reg[0][8]\(2)
    );
\i__carry__0_i_2__12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(7),
      O => \bipolar_gen.l_start_reg[0][8]\(2)
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(10),
      I1 => \^p\(11),
      O => \bipolar_gen.h_end_reg[0][12]_2\(1)
    );
\i__carry__0_i_3__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(6),
      O => \bipolar_gen.h_end_reg[0][8]\(1)
    );
\i__carry__0_i_3__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(6),
      O => \bipolar_gen.l_start_reg[0][8]\(1)
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(8),
      I1 => \^p\(9),
      O => \bipolar_gen.h_end_reg[0][12]_2\(0)
    );
\i__carry__0_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(5),
      O => \bipolar_gen.h_end_reg[0][8]\(0)
    );
\i__carry__0_i_4__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(5),
      O => \bipolar_gen.l_start_reg[0][8]\(0)
    );
\i__carry__0_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(14),
      I1 => \^p\(15),
      O => \bipolar_gen.h_end_reg[0][12]\(3)
    );
\i__carry__0_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(12),
      I1 => \^p\(13),
      O => \bipolar_gen.h_end_reg[0][12]\(2)
    );
\i__carry__0_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(10),
      I1 => \^p\(11),
      O => \bipolar_gen.h_end_reg[0][12]\(1)
    );
\i__carry__0_i_8__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(8),
      I1 => \^p\(9),
      O => \bipolar_gen.h_end_reg[0][12]\(0)
    );
\i__carry__1_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(12),
      O => \bipolar_gen.h_end_reg[0][12]_3\(3)
    );
\i__carry__1_i_1__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(16),
      I1 => \mult_p[0]_0\(33),
      O => DI(0)
    );
\i__carry__1_i_1__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(12),
      O => \bipolar_gen.l_start_reg[0][12]\(3)
    );
\i__carry__1_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(11),
      O => \bipolar_gen.h_end_reg[0][12]_3\(2)
    );
\i__carry__1_i_2__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(16),
      I1 => \mult_p[0]_0\(33),
      O => S(0)
    );
\i__carry__1_i_2__5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(11),
      O => \bipolar_gen.l_start_reg[0][12]\(2)
    );
\i__carry__1_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(10),
      O => \bipolar_gen.h_end_reg[0][12]_3\(1)
    );
\i__carry__1_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(10),
      O => \bipolar_gen.l_start_reg[0][12]\(1)
    );
\i__carry__1_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(9),
      O => \bipolar_gen.h_end_reg[0][12]_3\(0)
    );
\i__carry__1_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(9),
      O => \bipolar_gen.l_start_reg[0][12]\(0)
    );
\i__carry__2_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(16),
      O => \bipolar_gen.h_end_reg[0][16]\(3)
    );
\i__carry__2_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(16),
      O => \bipolar_gen.l_start_reg[0][16]\(3)
    );
\i__carry__2_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(15),
      O => \bipolar_gen.h_end_reg[0][16]\(2)
    );
\i__carry__2_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(15),
      O => \bipolar_gen.l_start_reg[0][16]\(2)
    );
\i__carry__2_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(14),
      O => \bipolar_gen.h_end_reg[0][16]\(1)
    );
\i__carry__2_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(14),
      O => \bipolar_gen.l_start_reg[0][16]\(1)
    );
\i__carry__2_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(13),
      O => \bipolar_gen.h_end_reg[0][16]\(0)
    );
\i__carry__2_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(13),
      O => \bipolar_gen.l_start_reg[0][16]\(0)
    );
\i__carry__3_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \mult_p[0]_0\(33),
      O => \bipolar_gen.h_end_reg[0][17]\(0)
    );
\i__carry__3_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \mult_p[0]_0\(33),
      O => \bipolar_gen.l_start_reg[0][17]\(0)
    );
\i__carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(6),
      I1 => \^p\(7),
      O => \bipolar_gen.h_end_reg[0][12]_1\(2)
    );
\i__carry_i_1__12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(4),
      O => \bipolar_gen.h_end_reg[0][4]\(3)
    );
\i__carry_i_1__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(4),
      O => \bipolar_gen.l_start_reg[0][4]\(3)
    );
\i__carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(2),
      I1 => \^p\(3),
      O => \bipolar_gen.h_end_reg[0][12]_1\(1)
    );
\i__carry_i_2__10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(3),
      O => \bipolar_gen.l_start_reg[0][4]\(2)
    );
\i__carry_i_2__12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(3),
      O => \bipolar_gen.h_end_reg[0][4]\(2)
    );
\i__carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^p\(0),
      I1 => \^p\(1),
      O => \bipolar_gen.h_end_reg[0][12]_1\(0)
    );
\i__carry_i_3__11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(2),
      O => \bipolar_gen.h_end_reg[0][4]\(1)
    );
\i__carry_i_3__12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(2),
      O => \bipolar_gen.l_start_reg[0][4]\(1)
    );
\i__carry_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(1),
      O => \bipolar_gen.h_end_reg[0][4]\(0)
    );
\i__carry_i_4__11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(6),
      I1 => \^p\(7),
      O => \bipolar_gen.h_end_reg[0][12]_0\(3)
    );
\i__carry_i_4__12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(1),
      O => \bipolar_gen.l_start_reg[0][4]\(0)
    );
\i__carry_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^p\(4),
      I1 => \^p\(5),
      O => \bipolar_gen.h_end_reg[0][12]_0\(2)
    );
\i__carry_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(2),
      I1 => \^p\(3),
      O => \bipolar_gen.h_end_reg[0][12]_0\(1)
    );
\i__carry_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(1),
      I1 => \^p\(0),
      O => \bipolar_gen.h_end_reg[0][12]_0\(0)
    );
\v5.v5_2.DSP48E_1\: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 0,
      ALUMODEREG => 1,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BREG => 1,
      B_INPUT => "DIRECT",
      CARRYINREG => 1,
      CARRYINSELREG => 1,
      CREG => 1,
      DREG => 0,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 1,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 25) => B"00000",
      A(24) => Q(16),
      A(23 downto 7) => Q(16 downto 0),
      A(6 downto 0) => B"0000000",
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_v5.v5_2.DSP48E_1_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000001001110001000",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_v5.v5_2.DSP48E_1_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_v5.v5_2.DSP48E_1_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_v5.v5_2.DSP48E_1_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '1',
      CEAD => '1',
      CEALUMODE => '1',
      CEB1 => '0',
      CEB2 => '1',
      CEC => '1',
      CECARRYIN => '1',
      CECTRL => '1',
      CED => '1',
      CEINMODE => '1',
      CEM => '1',
      CEP => '1',
      CLK => s_axis_aclk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_v5.v5_2.DSP48E_1_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => \NLW_v5.v5_2.DSP48E_1_OVERFLOW_UNCONNECTED\,
      P(47 downto 43) => \NLW_v5.v5_2.DSP48E_1_P_UNCONNECTED\(47 downto 43),
      P(42) => \v5.v5_2.DSP48E_1_n_60\,
      P(41) => \v5.v5_2.DSP48E_1_n_61\,
      P(40) => \mult_p[0]_0\(33),
      P(39 downto 23) => \^p\(16 downto 0),
      P(22) => \v5.v5_2.DSP48E_1_n_80\,
      P(21) => \v5.v5_2.DSP48E_1_n_81\,
      P(20) => \v5.v5_2.DSP48E_1_n_82\,
      P(19) => \v5.v5_2.DSP48E_1_n_83\,
      P(18) => \v5.v5_2.DSP48E_1_n_84\,
      P(17) => \v5.v5_2.DSP48E_1_n_85\,
      P(16) => \v5.v5_2.DSP48E_1_n_86\,
      P(15) => \v5.v5_2.DSP48E_1_n_87\,
      P(14) => \v5.v5_2.DSP48E_1_n_88\,
      P(13) => \v5.v5_2.DSP48E_1_n_89\,
      P(12) => \v5.v5_2.DSP48E_1_n_90\,
      P(11) => \v5.v5_2.DSP48E_1_n_91\,
      P(10) => \v5.v5_2.DSP48E_1_n_92\,
      P(9) => \v5.v5_2.DSP48E_1_n_93\,
      P(8) => \v5.v5_2.DSP48E_1_n_94\,
      P(7) => \v5.v5_2.DSP48E_1_n_95\,
      P(6 downto 0) => RESULT_OUT(6 downto 0),
      PATTERNBDETECT => \NLW_v5.v5_2.DSP48E_1_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_v5.v5_2.DSP48E_1_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => \NLW_v5.v5_2.DSP48E_1_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => \NLW_v5.v5_2.DSP48E_1_UNDERFLOW_UNCONNECTED\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_pwm_0_0_unimacro_MULT_MACRO_0 is
  port (
    P : out STD_LOGIC_VECTOR ( 16 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    \bipolar_gen.h_end_reg[1][12]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[1][12]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[1][4]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[1][4]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[1][8]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[1][12]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[1][16]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[1][17]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \bipolar_gen.h_end_reg[1][12]_1\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \bipolar_gen.h_end_reg[1][12]_2\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[1][8]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[1][17]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \bipolar_gen.h_end_reg[1][16]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[1][12]_3\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 16 downto 0 );
    s_axis_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zsys_axis_pwm_0_0_unimacro_MULT_MACRO_0 : entity is "unimacro_MULT_MACRO";
end zsys_axis_pwm_0_0_unimacro_MULT_MACRO_0;

architecture STRUCTURE of zsys_axis_pwm_0_0_unimacro_MULT_MACRO_0 is
  signal \^p\ : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal RESULT_OUT : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \mult_p[1]_1\ : STD_LOGIC_VECTOR ( 33 to 33 );
  signal \v5.v5_2.DSP48E_1_n_60\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_61\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_80\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_81\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_82\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_83\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_84\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_85\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_86\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_87\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_88\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_89\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_90\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_91\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_92\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_93\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_94\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_95\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_v5.v5_2.DSP48E_1_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_v5.v5_2.DSP48E_1_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_v5.v5_2.DSP48E_1_P_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 43 );
  signal \NLW_v5.v5_2.DSP48E_1_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \v5.v5_2.DSP48E_1\ : label is "DSP48E";
  attribute box_type : string;
  attribute box_type of \v5.v5_2.DSP48E_1\ : label is "PRIMITIVE";
begin
  P(16 downto 0) <= \^p\(16 downto 0);
\bipolar_gen.h_end[1][0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(0),
      O => D(0)
    );
\i__carry__0_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(14),
      I1 => \^p\(15),
      O => \bipolar_gen.h_end_reg[1][12]_2\(3)
    );
\i__carry__0_i_1__13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(8),
      O => \bipolar_gen.l_start_reg[1][8]\(3)
    );
\i__carry__0_i_1__9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(8),
      O => \bipolar_gen.h_end_reg[1][8]\(3)
    );
\i__carry__0_i_2__10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(7),
      O => \bipolar_gen.h_end_reg[1][8]\(2)
    );
\i__carry__0_i_2__13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(7),
      O => \bipolar_gen.l_start_reg[1][8]\(2)
    );
\i__carry__0_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(12),
      I1 => \^p\(13),
      O => \bipolar_gen.h_end_reg[1][12]_2\(2)
    );
\i__carry__0_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(10),
      I1 => \^p\(11),
      O => \bipolar_gen.h_end_reg[1][12]_2\(1)
    );
\i__carry__0_i_3__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(6),
      O => \bipolar_gen.h_end_reg[1][8]\(1)
    );
\i__carry__0_i_3__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(6),
      O => \bipolar_gen.l_start_reg[1][8]\(1)
    );
\i__carry__0_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(8),
      I1 => \^p\(9),
      O => \bipolar_gen.h_end_reg[1][12]_2\(0)
    );
\i__carry__0_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(5),
      O => \bipolar_gen.h_end_reg[1][8]\(0)
    );
\i__carry__0_i_4__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(5),
      O => \bipolar_gen.l_start_reg[1][8]\(0)
    );
\i__carry__0_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(14),
      I1 => \^p\(15),
      O => \bipolar_gen.h_end_reg[1][12]\(3)
    );
\i__carry__0_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(12),
      I1 => \^p\(13),
      O => \bipolar_gen.h_end_reg[1][12]\(2)
    );
\i__carry__0_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(10),
      I1 => \^p\(11),
      O => \bipolar_gen.h_end_reg[1][12]\(1)
    );
\i__carry__0_i_8__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(8),
      I1 => \^p\(9),
      O => \bipolar_gen.h_end_reg[1][12]\(0)
    );
\i__carry__1_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(12),
      O => \bipolar_gen.h_end_reg[1][12]_3\(3)
    );
\i__carry__1_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(16),
      I1 => \mult_p[1]_1\(33),
      O => DI(0)
    );
\i__carry__1_i_1__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(12),
      O => \bipolar_gen.l_start_reg[1][12]\(3)
    );
\i__carry__1_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(11),
      O => \bipolar_gen.h_end_reg[1][12]_3\(2)
    );
\i__carry__1_i_2__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(16),
      I1 => \mult_p[1]_1\(33),
      O => S(0)
    );
\i__carry__1_i_2__6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(11),
      O => \bipolar_gen.l_start_reg[1][12]\(2)
    );
\i__carry__1_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(10),
      O => \bipolar_gen.h_end_reg[1][12]_3\(1)
    );
\i__carry__1_i_3__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(10),
      O => \bipolar_gen.l_start_reg[1][12]\(1)
    );
\i__carry__1_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(9),
      O => \bipolar_gen.h_end_reg[1][12]_3\(0)
    );
\i__carry__1_i_4__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(9),
      O => \bipolar_gen.l_start_reg[1][12]\(0)
    );
\i__carry__2_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(16),
      O => \bipolar_gen.h_end_reg[1][16]\(3)
    );
\i__carry__2_i_1__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(16),
      O => \bipolar_gen.l_start_reg[1][16]\(3)
    );
\i__carry__2_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(15),
      O => \bipolar_gen.h_end_reg[1][16]\(2)
    );
\i__carry__2_i_2__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(15),
      O => \bipolar_gen.l_start_reg[1][16]\(2)
    );
\i__carry__2_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(14),
      O => \bipolar_gen.h_end_reg[1][16]\(1)
    );
\i__carry__2_i_3__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(14),
      O => \bipolar_gen.l_start_reg[1][16]\(1)
    );
\i__carry__2_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(13),
      O => \bipolar_gen.h_end_reg[1][16]\(0)
    );
\i__carry__2_i_4__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(13),
      O => \bipolar_gen.l_start_reg[1][16]\(0)
    );
\i__carry__3_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \mult_p[1]_1\(33),
      O => \bipolar_gen.h_end_reg[1][17]\(0)
    );
\i__carry__3_i_1__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \mult_p[1]_1\(33),
      O => \bipolar_gen.l_start_reg[1][17]\(0)
    );
\i__carry_i_1__13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(4),
      O => \bipolar_gen.h_end_reg[1][4]\(3)
    );
\i__carry_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(6),
      I1 => \^p\(7),
      O => \bipolar_gen.h_end_reg[1][12]_1\(2)
    );
\i__carry_i_1__8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(4),
      O => \bipolar_gen.l_start_reg[1][4]\(3)
    );
\i__carry_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(2),
      I1 => \^p\(3),
      O => \bipolar_gen.h_end_reg[1][12]_1\(1)
    );
\i__carry_i_2__13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(3),
      O => \bipolar_gen.h_end_reg[1][4]\(2)
    );
\i__carry_i_2__9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(3),
      O => \bipolar_gen.l_start_reg[1][4]\(2)
    );
\i__carry_i_3__10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(2),
      O => \bipolar_gen.h_end_reg[1][4]\(1)
    );
\i__carry_i_3__13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(2),
      O => \bipolar_gen.l_start_reg[1][4]\(1)
    );
\i__carry_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^p\(0),
      I1 => \^p\(1),
      O => \bipolar_gen.h_end_reg[1][12]_1\(0)
    );
\i__carry_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(1),
      O => \bipolar_gen.h_end_reg[1][4]\(0)
    );
\i__carry_i_4__10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(6),
      I1 => \^p\(7),
      O => \bipolar_gen.h_end_reg[1][12]_0\(3)
    );
\i__carry_i_4__13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(1),
      O => \bipolar_gen.l_start_reg[1][4]\(0)
    );
\i__carry_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^p\(4),
      I1 => \^p\(5),
      O => \bipolar_gen.h_end_reg[1][12]_0\(2)
    );
\i__carry_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(2),
      I1 => \^p\(3),
      O => \bipolar_gen.h_end_reg[1][12]_0\(1)
    );
\i__carry_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(1),
      I1 => \^p\(0),
      O => \bipolar_gen.h_end_reg[1][12]_0\(0)
    );
\v5.v5_2.DSP48E_1\: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 0,
      ALUMODEREG => 1,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BREG => 1,
      B_INPUT => "DIRECT",
      CARRYINREG => 1,
      CARRYINSELREG => 1,
      CREG => 1,
      DREG => 0,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 1,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 25) => B"00000",
      A(24) => Q(16),
      A(23 downto 7) => Q(16 downto 0),
      A(6 downto 0) => B"0000000",
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_v5.v5_2.DSP48E_1_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000001001110001000",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_v5.v5_2.DSP48E_1_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_v5.v5_2.DSP48E_1_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_v5.v5_2.DSP48E_1_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '1',
      CEAD => '1',
      CEALUMODE => '1',
      CEB1 => '0',
      CEB2 => '1',
      CEC => '1',
      CECARRYIN => '1',
      CECTRL => '1',
      CED => '1',
      CEINMODE => '1',
      CEM => '1',
      CEP => '1',
      CLK => s_axis_aclk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_v5.v5_2.DSP48E_1_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => \NLW_v5.v5_2.DSP48E_1_OVERFLOW_UNCONNECTED\,
      P(47 downto 43) => \NLW_v5.v5_2.DSP48E_1_P_UNCONNECTED\(47 downto 43),
      P(42) => \v5.v5_2.DSP48E_1_n_60\,
      P(41) => \v5.v5_2.DSP48E_1_n_61\,
      P(40) => \mult_p[1]_1\(33),
      P(39 downto 23) => \^p\(16 downto 0),
      P(22) => \v5.v5_2.DSP48E_1_n_80\,
      P(21) => \v5.v5_2.DSP48E_1_n_81\,
      P(20) => \v5.v5_2.DSP48E_1_n_82\,
      P(19) => \v5.v5_2.DSP48E_1_n_83\,
      P(18) => \v5.v5_2.DSP48E_1_n_84\,
      P(17) => \v5.v5_2.DSP48E_1_n_85\,
      P(16) => \v5.v5_2.DSP48E_1_n_86\,
      P(15) => \v5.v5_2.DSP48E_1_n_87\,
      P(14) => \v5.v5_2.DSP48E_1_n_88\,
      P(13) => \v5.v5_2.DSP48E_1_n_89\,
      P(12) => \v5.v5_2.DSP48E_1_n_90\,
      P(11) => \v5.v5_2.DSP48E_1_n_91\,
      P(10) => \v5.v5_2.DSP48E_1_n_92\,
      P(9) => \v5.v5_2.DSP48E_1_n_93\,
      P(8) => \v5.v5_2.DSP48E_1_n_94\,
      P(7) => \v5.v5_2.DSP48E_1_n_95\,
      P(6 downto 0) => RESULT_OUT(6 downto 0),
      PATTERNBDETECT => \NLW_v5.v5_2.DSP48E_1_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_v5.v5_2.DSP48E_1_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => \NLW_v5.v5_2.DSP48E_1_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => \NLW_v5.v5_2.DSP48E_1_UNDERFLOW_UNCONNECTED\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_pwm_0_0_unimacro_MULT_MACRO_1 is
  port (
    P : out STD_LOGIC_VECTOR ( 16 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    \bipolar_gen.h_end_reg[2][12]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[2][12]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[2][4]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[2][4]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[2][8]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[2][12]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[2][16]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.l_start_reg[2][17]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \bipolar_gen.h_end_reg[2][12]_1\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \bipolar_gen.h_end_reg[2][12]_2\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[2][8]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[2][17]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \bipolar_gen.h_end_reg[2][16]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \bipolar_gen.h_end_reg[2][12]_3\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 16 downto 0 );
    s_axis_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zsys_axis_pwm_0_0_unimacro_MULT_MACRO_1 : entity is "unimacro_MULT_MACRO";
end zsys_axis_pwm_0_0_unimacro_MULT_MACRO_1;

architecture STRUCTURE of zsys_axis_pwm_0_0_unimacro_MULT_MACRO_1 is
  signal \^p\ : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal RESULT_OUT : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \mult_p[2]_2\ : STD_LOGIC_VECTOR ( 33 to 33 );
  signal \v5.v5_2.DSP48E_1_n_60\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_61\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_80\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_81\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_82\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_83\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_84\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_85\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_86\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_87\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_88\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_89\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_90\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_91\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_92\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_93\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_94\ : STD_LOGIC;
  signal \v5.v5_2.DSP48E_1_n_95\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v5.v5_2.DSP48E_1_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_v5.v5_2.DSP48E_1_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_v5.v5_2.DSP48E_1_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_v5.v5_2.DSP48E_1_P_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 43 );
  signal \NLW_v5.v5_2.DSP48E_1_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \v5.v5_2.DSP48E_1\ : label is "DSP48E";
  attribute box_type : string;
  attribute box_type of \v5.v5_2.DSP48E_1\ : label is "PRIMITIVE";
begin
  P(16 downto 0) <= \^p\(16 downto 0);
\bipolar_gen.h_end[2][0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(0),
      O => D(0)
    );
\i__carry__0_i_1__14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(8),
      O => \bipolar_gen.l_start_reg[2][8]\(3)
    );
\i__carry__0_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(14),
      I1 => \^p\(15),
      O => \bipolar_gen.h_end_reg[2][12]_2\(3)
    );
\i__carry__0_i_1__8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(8),
      O => \bipolar_gen.h_end_reg[2][8]\(3)
    );
\i__carry__0_i_2__14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(7),
      O => \bipolar_gen.l_start_reg[2][8]\(2)
    );
\i__carry__0_i_2__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(12),
      I1 => \^p\(13),
      O => \bipolar_gen.h_end_reg[2][12]_2\(2)
    );
\i__carry__0_i_2__9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(7),
      O => \bipolar_gen.h_end_reg[2][8]\(2)
    );
\i__carry__0_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(10),
      I1 => \^p\(11),
      O => \bipolar_gen.h_end_reg[2][12]_2\(1)
    );
\i__carry__0_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(6),
      O => \bipolar_gen.h_end_reg[2][8]\(1)
    );
\i__carry__0_i_3__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(6),
      O => \bipolar_gen.l_start_reg[2][8]\(1)
    );
\i__carry__0_i_4__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(8),
      I1 => \^p\(9),
      O => \bipolar_gen.h_end_reg[2][12]_2\(0)
    );
\i__carry__0_i_4__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(5),
      O => \bipolar_gen.h_end_reg[2][8]\(0)
    );
\i__carry__0_i_4__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(5),
      O => \bipolar_gen.l_start_reg[2][8]\(0)
    );
\i__carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(14),
      I1 => \^p\(15),
      O => \bipolar_gen.h_end_reg[2][12]\(3)
    );
\i__carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(12),
      I1 => \^p\(13),
      O => \bipolar_gen.h_end_reg[2][12]\(2)
    );
\i__carry__0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(10),
      I1 => \^p\(11),
      O => \bipolar_gen.h_end_reg[2][12]\(1)
    );
\i__carry__0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(8),
      I1 => \^p\(9),
      O => \bipolar_gen.h_end_reg[2][12]\(0)
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(12),
      O => \bipolar_gen.h_end_reg[2][12]_3\(3)
    );
\i__carry__1_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(16),
      I1 => \mult_p[2]_2\(33),
      O => DI(0)
    );
\i__carry__1_i_1__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(12),
      O => \bipolar_gen.l_start_reg[2][12]\(3)
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(11),
      O => \bipolar_gen.h_end_reg[2][12]_3\(2)
    );
\i__carry__1_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(16),
      I1 => \mult_p[2]_2\(33),
      O => S(0)
    );
\i__carry__1_i_2__7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(11),
      O => \bipolar_gen.l_start_reg[2][12]\(2)
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(10),
      O => \bipolar_gen.h_end_reg[2][12]_3\(1)
    );
\i__carry__1_i_3__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(10),
      O => \bipolar_gen.l_start_reg[2][12]\(1)
    );
\i__carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(9),
      O => \bipolar_gen.h_end_reg[2][12]_3\(0)
    );
\i__carry__1_i_4__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(9),
      O => \bipolar_gen.l_start_reg[2][12]\(0)
    );
\i__carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(16),
      O => \bipolar_gen.h_end_reg[2][16]\(3)
    );
\i__carry__2_i_1__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(16),
      O => \bipolar_gen.l_start_reg[2][16]\(3)
    );
\i__carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(15),
      O => \bipolar_gen.h_end_reg[2][16]\(2)
    );
\i__carry__2_i_2__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(15),
      O => \bipolar_gen.l_start_reg[2][16]\(2)
    );
\i__carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(14),
      O => \bipolar_gen.h_end_reg[2][16]\(1)
    );
\i__carry__2_i_3__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(14),
      O => \bipolar_gen.l_start_reg[2][16]\(1)
    );
\i__carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(13),
      O => \bipolar_gen.h_end_reg[2][16]\(0)
    );
\i__carry__2_i_4__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(13),
      O => \bipolar_gen.l_start_reg[2][16]\(0)
    );
\i__carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \mult_p[2]_2\(33),
      O => \bipolar_gen.h_end_reg[2][17]\(0)
    );
\i__carry__3_i_1__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \mult_p[2]_2\(33),
      O => \bipolar_gen.l_start_reg[2][17]\(0)
    );
\i__carry_i_1__10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(4),
      O => \bipolar_gen.l_start_reg[2][4]\(3)
    );
\i__carry_i_1__14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(4),
      O => \bipolar_gen.h_end_reg[2][4]\(3)
    );
\i__carry_i_1__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(6),
      I1 => \^p\(7),
      O => \bipolar_gen.h_end_reg[2][12]_1\(2)
    );
\i__carry_i_2__14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(3),
      O => \bipolar_gen.h_end_reg[2][4]\(2)
    );
\i__carry_i_2__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^p\(2),
      I1 => \^p\(3),
      O => \bipolar_gen.h_end_reg[2][12]_1\(1)
    );
\i__carry_i_2__8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(3),
      O => \bipolar_gen.l_start_reg[2][4]\(2)
    );
\i__carry_i_3__14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(2),
      O => \bipolar_gen.l_start_reg[2][4]\(1)
    );
\i__carry_i_3__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^p\(0),
      I1 => \^p\(1),
      O => \bipolar_gen.h_end_reg[2][12]_1\(0)
    );
\i__carry_i_3__9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(2),
      O => \bipolar_gen.h_end_reg[2][4]\(1)
    );
\i__carry_i_4__14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(1),
      O => \bipolar_gen.l_start_reg[2][4]\(0)
    );
\i__carry_i_4__3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(1),
      O => \bipolar_gen.h_end_reg[2][4]\(0)
    );
\i__carry_i_4__9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(6),
      I1 => \^p\(7),
      O => \bipolar_gen.h_end_reg[2][12]_0\(3)
    );
\i__carry_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^p\(4),
      I1 => \^p\(5),
      O => \bipolar_gen.h_end_reg[2][12]_0\(2)
    );
\i__carry_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^p\(2),
      I1 => \^p\(3),
      O => \bipolar_gen.h_end_reg[2][12]_0\(1)
    );
\i__carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^p\(1),
      I1 => \^p\(0),
      O => \bipolar_gen.h_end_reg[2][12]_0\(0)
    );
\v5.v5_2.DSP48E_1\: unisim.vcomponents.DSP48E1
    generic map(
      ACASCREG => 1,
      ADREG => 0,
      ALUMODEREG => 1,
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BREG => 1,
      B_INPUT => "DIRECT",
      CARRYINREG => 1,
      CARRYINSELREG => 1,
      CREG => 1,
      DREG => 0,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 1,
      OPMODEREG => 1,
      PATTERN => X"000000000000",
      PREG => 1,
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_DPORT => false,
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48"
    )
        port map (
      A(29 downto 25) => B"00000",
      A(24) => Q(16),
      A(23 downto 7) => Q(16 downto 0),
      A(6 downto 0) => B"0000000",
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_v5.v5_2.DSP48E_1_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 0) => B"000001001110001000",
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_v5.v5_2.DSP48E_1_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_v5.v5_2.DSP48E_1_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_v5.v5_2.DSP48E_1_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => '1',
      CEAD => '1',
      CEALUMODE => '1',
      CEB1 => '0',
      CEB2 => '1',
      CEC => '1',
      CECARRYIN => '1',
      CECTRL => '1',
      CED => '1',
      CEINMODE => '1',
      CEM => '1',
      CEP => '1',
      CLK => s_axis_aclk,
      D(24 downto 0) => B"0000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_v5.v5_2.DSP48E_1_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(6 downto 0) => B"0000101",
      OVERFLOW => \NLW_v5.v5_2.DSP48E_1_OVERFLOW_UNCONNECTED\,
      P(47 downto 43) => \NLW_v5.v5_2.DSP48E_1_P_UNCONNECTED\(47 downto 43),
      P(42) => \v5.v5_2.DSP48E_1_n_60\,
      P(41) => \v5.v5_2.DSP48E_1_n_61\,
      P(40) => \mult_p[2]_2\(33),
      P(39 downto 23) => \^p\(16 downto 0),
      P(22) => \v5.v5_2.DSP48E_1_n_80\,
      P(21) => \v5.v5_2.DSP48E_1_n_81\,
      P(20) => \v5.v5_2.DSP48E_1_n_82\,
      P(19) => \v5.v5_2.DSP48E_1_n_83\,
      P(18) => \v5.v5_2.DSP48E_1_n_84\,
      P(17) => \v5.v5_2.DSP48E_1_n_85\,
      P(16) => \v5.v5_2.DSP48E_1_n_86\,
      P(15) => \v5.v5_2.DSP48E_1_n_87\,
      P(14) => \v5.v5_2.DSP48E_1_n_88\,
      P(13) => \v5.v5_2.DSP48E_1_n_89\,
      P(12) => \v5.v5_2.DSP48E_1_n_90\,
      P(11) => \v5.v5_2.DSP48E_1_n_91\,
      P(10) => \v5.v5_2.DSP48E_1_n_92\,
      P(9) => \v5.v5_2.DSP48E_1_n_93\,
      P(8) => \v5.v5_2.DSP48E_1_n_94\,
      P(7) => \v5.v5_2.DSP48E_1_n_95\,
      P(6 downto 0) => RESULT_OUT(6 downto 0),
      PATTERNBDETECT => \NLW_v5.v5_2.DSP48E_1_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_v5.v5_2.DSP48E_1_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => \NLW_v5.v5_2.DSP48E_1_PCOUT_UNCONNECTED\(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => \NLW_v5.v5_2.DSP48E_1_UNDERFLOW_UNCONNECTED\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_pwm_0_0_axis_pwm_v1_0 is
  port (
    pwm_l : out STD_LOGIC_VECTOR ( 2 downto 0 );
    pwm_h : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 47 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zsys_axis_pwm_0_0_axis_pwm_v1_0 : entity is "axis_pwm_v1_0";
end zsys_axis_pwm_0_0_axis_pwm_v1_0;

architecture STRUCTURE of zsys_axis_pwm_0_0_axis_pwm_v1_0 is
  signal \_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \_carry__0_n_2\ : STD_LOGIC;
  signal \_carry__0_n_3\ : STD_LOGIC;
  signal \_carry_i_1_n_0\ : STD_LOGIC;
  signal \_carry_i_2_n_0\ : STD_LOGIC;
  signal \_carry_i_3_n_0\ : STD_LOGIC;
  signal \_carry_i_4_n_0\ : STD_LOGIC;
  signal \_carry_n_0\ : STD_LOGIC;
  signal \_carry_n_1\ : STD_LOGIC;
  signal \_carry_n_2\ : STD_LOGIC;
  signal \_carry_n_3\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__1/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__1/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__1/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__1/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__1/i__carry__1_n_0\ : STD_LOGIC;
  signal \_inferred__1/i__carry__1_n_1\ : STD_LOGIC;
  signal \_inferred__1/i__carry__1_n_2\ : STD_LOGIC;
  signal \_inferred__1/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__1/i__carry__2_n_0\ : STD_LOGIC;
  signal \_inferred__1/i__carry__2_n_1\ : STD_LOGIC;
  signal \_inferred__1/i__carry__2_n_2\ : STD_LOGIC;
  signal \_inferred__1/i__carry__2_n_3\ : STD_LOGIC;
  signal \_inferred__1/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__1/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__1/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__1/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__10/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__10/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__10/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__10/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__10/i__carry__0_n_4\ : STD_LOGIC;
  signal \_inferred__10/i__carry__0_n_5\ : STD_LOGIC;
  signal \_inferred__10/i__carry__0_n_6\ : STD_LOGIC;
  signal \_inferred__10/i__carry__0_n_7\ : STD_LOGIC;
  signal \_inferred__10/i__carry__1_n_0\ : STD_LOGIC;
  signal \_inferred__10/i__carry__1_n_1\ : STD_LOGIC;
  signal \_inferred__10/i__carry__1_n_2\ : STD_LOGIC;
  signal \_inferred__10/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__10/i__carry__1_n_4\ : STD_LOGIC;
  signal \_inferred__10/i__carry__1_n_5\ : STD_LOGIC;
  signal \_inferred__10/i__carry__1_n_6\ : STD_LOGIC;
  signal \_inferred__10/i__carry__1_n_7\ : STD_LOGIC;
  signal \_inferred__10/i__carry__2_n_0\ : STD_LOGIC;
  signal \_inferred__10/i__carry__2_n_1\ : STD_LOGIC;
  signal \_inferred__10/i__carry__2_n_2\ : STD_LOGIC;
  signal \_inferred__10/i__carry__2_n_3\ : STD_LOGIC;
  signal \_inferred__10/i__carry__2_n_4\ : STD_LOGIC;
  signal \_inferred__10/i__carry__2_n_5\ : STD_LOGIC;
  signal \_inferred__10/i__carry__2_n_6\ : STD_LOGIC;
  signal \_inferred__10/i__carry__2_n_7\ : STD_LOGIC;
  signal \_inferred__10/i__carry__3_n_7\ : STD_LOGIC;
  signal \_inferred__10/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__10/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__10/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__10/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__10/i__carry_n_4\ : STD_LOGIC;
  signal \_inferred__10/i__carry_n_5\ : STD_LOGIC;
  signal \_inferred__10/i__carry_n_6\ : STD_LOGIC;
  signal \_inferred__10/i__carry_n_7\ : STD_LOGIC;
  signal \_inferred__11/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__11/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__11/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__11/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__11/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__12/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__12/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__12/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__12/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__12/i__carry__0_n_4\ : STD_LOGIC;
  signal \_inferred__12/i__carry__0_n_5\ : STD_LOGIC;
  signal \_inferred__12/i__carry__0_n_6\ : STD_LOGIC;
  signal \_inferred__12/i__carry__0_n_7\ : STD_LOGIC;
  signal \_inferred__12/i__carry__1_n_0\ : STD_LOGIC;
  signal \_inferred__12/i__carry__1_n_1\ : STD_LOGIC;
  signal \_inferred__12/i__carry__1_n_2\ : STD_LOGIC;
  signal \_inferred__12/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__12/i__carry__1_n_4\ : STD_LOGIC;
  signal \_inferred__12/i__carry__1_n_5\ : STD_LOGIC;
  signal \_inferred__12/i__carry__1_n_6\ : STD_LOGIC;
  signal \_inferred__12/i__carry__1_n_7\ : STD_LOGIC;
  signal \_inferred__12/i__carry__2_n_0\ : STD_LOGIC;
  signal \_inferred__12/i__carry__2_n_1\ : STD_LOGIC;
  signal \_inferred__12/i__carry__2_n_2\ : STD_LOGIC;
  signal \_inferred__12/i__carry__2_n_3\ : STD_LOGIC;
  signal \_inferred__12/i__carry__2_n_4\ : STD_LOGIC;
  signal \_inferred__12/i__carry__2_n_5\ : STD_LOGIC;
  signal \_inferred__12/i__carry__2_n_6\ : STD_LOGIC;
  signal \_inferred__12/i__carry__2_n_7\ : STD_LOGIC;
  signal \_inferred__12/i__carry__3_n_7\ : STD_LOGIC;
  signal \_inferred__12/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__12/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__12/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__12/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__12/i__carry_n_4\ : STD_LOGIC;
  signal \_inferred__12/i__carry_n_5\ : STD_LOGIC;
  signal \_inferred__12/i__carry_n_6\ : STD_LOGIC;
  signal \_inferred__12/i__carry_n_7\ : STD_LOGIC;
  signal \_inferred__13/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__13/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__13/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__13/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__13/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__14/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__14/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__14/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__14/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__14/i__carry__0_n_4\ : STD_LOGIC;
  signal \_inferred__14/i__carry__0_n_5\ : STD_LOGIC;
  signal \_inferred__14/i__carry__0_n_6\ : STD_LOGIC;
  signal \_inferred__14/i__carry__0_n_7\ : STD_LOGIC;
  signal \_inferred__14/i__carry__1_n_0\ : STD_LOGIC;
  signal \_inferred__14/i__carry__1_n_1\ : STD_LOGIC;
  signal \_inferred__14/i__carry__1_n_2\ : STD_LOGIC;
  signal \_inferred__14/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__14/i__carry__1_n_4\ : STD_LOGIC;
  signal \_inferred__14/i__carry__1_n_5\ : STD_LOGIC;
  signal \_inferred__14/i__carry__1_n_6\ : STD_LOGIC;
  signal \_inferred__14/i__carry__1_n_7\ : STD_LOGIC;
  signal \_inferred__14/i__carry__2_n_0\ : STD_LOGIC;
  signal \_inferred__14/i__carry__2_n_1\ : STD_LOGIC;
  signal \_inferred__14/i__carry__2_n_2\ : STD_LOGIC;
  signal \_inferred__14/i__carry__2_n_3\ : STD_LOGIC;
  signal \_inferred__14/i__carry__2_n_4\ : STD_LOGIC;
  signal \_inferred__14/i__carry__2_n_5\ : STD_LOGIC;
  signal \_inferred__14/i__carry__2_n_6\ : STD_LOGIC;
  signal \_inferred__14/i__carry__2_n_7\ : STD_LOGIC;
  signal \_inferred__14/i__carry__3_n_7\ : STD_LOGIC;
  signal \_inferred__14/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__14/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__14/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__14/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__14/i__carry_n_4\ : STD_LOGIC;
  signal \_inferred__14/i__carry_n_5\ : STD_LOGIC;
  signal \_inferred__14/i__carry_n_6\ : STD_LOGIC;
  signal \_inferred__14/i__carry_n_7\ : STD_LOGIC;
  signal \_inferred__15/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__15/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__15/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__15/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__15/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__2/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__3/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__3/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__3/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__3/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__3/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__3/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__4/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__4/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__4/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__4/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__4/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__4/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__4/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__4/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__4/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__5/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__5/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__5/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__5/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__5/i__carry__0_n_4\ : STD_LOGIC;
  signal \_inferred__5/i__carry__0_n_5\ : STD_LOGIC;
  signal \_inferred__5/i__carry__0_n_6\ : STD_LOGIC;
  signal \_inferred__5/i__carry__0_n_7\ : STD_LOGIC;
  signal \_inferred__5/i__carry__1_n_0\ : STD_LOGIC;
  signal \_inferred__5/i__carry__1_n_1\ : STD_LOGIC;
  signal \_inferred__5/i__carry__1_n_2\ : STD_LOGIC;
  signal \_inferred__5/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__5/i__carry__1_n_4\ : STD_LOGIC;
  signal \_inferred__5/i__carry__1_n_5\ : STD_LOGIC;
  signal \_inferred__5/i__carry__1_n_6\ : STD_LOGIC;
  signal \_inferred__5/i__carry__1_n_7\ : STD_LOGIC;
  signal \_inferred__5/i__carry__2_n_0\ : STD_LOGIC;
  signal \_inferred__5/i__carry__2_n_1\ : STD_LOGIC;
  signal \_inferred__5/i__carry__2_n_2\ : STD_LOGIC;
  signal \_inferred__5/i__carry__2_n_3\ : STD_LOGIC;
  signal \_inferred__5/i__carry__2_n_4\ : STD_LOGIC;
  signal \_inferred__5/i__carry__2_n_5\ : STD_LOGIC;
  signal \_inferred__5/i__carry__2_n_6\ : STD_LOGIC;
  signal \_inferred__5/i__carry__2_n_7\ : STD_LOGIC;
  signal \_inferred__5/i__carry__3_n_7\ : STD_LOGIC;
  signal \_inferred__5/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__5/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__5/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__5/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__5/i__carry_n_4\ : STD_LOGIC;
  signal \_inferred__5/i__carry_n_5\ : STD_LOGIC;
  signal \_inferred__5/i__carry_n_6\ : STD_LOGIC;
  signal \_inferred__5/i__carry_n_7\ : STD_LOGIC;
  signal \_inferred__6/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__6/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__6/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__6/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__6/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__6/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__7/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__7/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__7/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__7/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__7/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__7/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__7/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__7/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__7/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__8/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__8/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__8/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__8/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__8/i__carry__0_n_4\ : STD_LOGIC;
  signal \_inferred__8/i__carry__0_n_5\ : STD_LOGIC;
  signal \_inferred__8/i__carry__0_n_6\ : STD_LOGIC;
  signal \_inferred__8/i__carry__0_n_7\ : STD_LOGIC;
  signal \_inferred__8/i__carry__1_n_0\ : STD_LOGIC;
  signal \_inferred__8/i__carry__1_n_1\ : STD_LOGIC;
  signal \_inferred__8/i__carry__1_n_2\ : STD_LOGIC;
  signal \_inferred__8/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__8/i__carry__1_n_4\ : STD_LOGIC;
  signal \_inferred__8/i__carry__1_n_5\ : STD_LOGIC;
  signal \_inferred__8/i__carry__1_n_6\ : STD_LOGIC;
  signal \_inferred__8/i__carry__1_n_7\ : STD_LOGIC;
  signal \_inferred__8/i__carry__2_n_0\ : STD_LOGIC;
  signal \_inferred__8/i__carry__2_n_1\ : STD_LOGIC;
  signal \_inferred__8/i__carry__2_n_2\ : STD_LOGIC;
  signal \_inferred__8/i__carry__2_n_3\ : STD_LOGIC;
  signal \_inferred__8/i__carry__2_n_4\ : STD_LOGIC;
  signal \_inferred__8/i__carry__2_n_5\ : STD_LOGIC;
  signal \_inferred__8/i__carry__2_n_6\ : STD_LOGIC;
  signal \_inferred__8/i__carry__2_n_7\ : STD_LOGIC;
  signal \_inferred__8/i__carry__3_n_7\ : STD_LOGIC;
  signal \_inferred__8/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__8/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__8/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__8/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__8/i__carry_n_4\ : STD_LOGIC;
  signal \_inferred__8/i__carry_n_5\ : STD_LOGIC;
  signal \_inferred__8/i__carry_n_6\ : STD_LOGIC;
  signal \_inferred__8/i__carry_n_7\ : STD_LOGIC;
  signal \_inferred__9/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__9/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__9/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__9/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__9/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__9/i__carry_n_3\ : STD_LOGIC;
  signal \bipolar_gen.h_end[0][17]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.h_end[1][17]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.h_end[2][17]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.h_end_reg[0]\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \bipolar_gen.h_end_reg[1]\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \bipolar_gen.h_end_reg[2]\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \bipolar_gen.h_start[0][12]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.h_start[0][4]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.h_start[1][12]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.h_start[1][4]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.h_start[2][12]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.h_start[2][3]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.h_start[2][4]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.h_start_reg[0]\ : STD_LOGIC_VECTOR ( 12 downto 4 );
  signal \bipolar_gen.h_start_reg[1]\ : STD_LOGIC_VECTOR ( 12 downto 4 );
  signal \bipolar_gen.h_start_reg[2]\ : STD_LOGIC_VECTOR ( 12 downto 3 );
  signal \bipolar_gen.l_end_reg[2]\ : STD_LOGIC_VECTOR ( 12 to 12 );
  signal \bipolar_gen.l_start_reg[0]\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \bipolar_gen.l_start_reg[1]\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \bipolar_gen.l_start_reg[2]\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \bipolar_gen.pwm_h_drv[0]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.pwm_h_drv[1]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.pwm_h_drv[2]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.pwm_l_drv[0]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.pwm_l_drv[1]_i_1_n_0\ : STD_LOGIC;
  signal \bipolar_gen.pwm_l_drv[2]_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1__11_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1__2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1__4_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1__5_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1__6_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1__7_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2__1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2__3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2__5_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2__6_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2__7_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2__8_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__11_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__1_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__3_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__5_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__7_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__9_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__11_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__2_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__4_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__5_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__6_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__7_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__1_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__3_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__5_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__6_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__7_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__8_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__2_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__4_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__5_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__6_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__7_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__8_n_0\ : STD_LOGIC;
  signal \mult_a[0][12]_i_2_n_0\ : STD_LOGIC;
  signal \mult_a[0][12]_i_3_n_0\ : STD_LOGIC;
  signal \mult_a[0][12]_i_4_n_0\ : STD_LOGIC;
  signal \mult_a[0][12]_i_5_n_0\ : STD_LOGIC;
  signal \mult_a[0][17]_i_2_n_0\ : STD_LOGIC;
  signal \mult_a[0][17]_i_3_n_0\ : STD_LOGIC;
  signal \mult_a[0][17]_i_4_n_0\ : STD_LOGIC;
  signal \mult_a[0][4]_i_2_n_0\ : STD_LOGIC;
  signal \mult_a[0][4]_i_3_n_0\ : STD_LOGIC;
  signal \mult_a[0][4]_i_4_n_0\ : STD_LOGIC;
  signal \mult_a[0][4]_i_5_n_0\ : STD_LOGIC;
  signal \mult_a[0][8]_i_2_n_0\ : STD_LOGIC;
  signal \mult_a[0][8]_i_3_n_0\ : STD_LOGIC;
  signal \mult_a[0][8]_i_4_n_0\ : STD_LOGIC;
  signal \mult_a[0][8]_i_5_n_0\ : STD_LOGIC;
  signal \mult_a[1][0]_i_1_n_0\ : STD_LOGIC;
  signal \mult_a[1][12]_i_2_n_0\ : STD_LOGIC;
  signal \mult_a[1][12]_i_3_n_0\ : STD_LOGIC;
  signal \mult_a[1][12]_i_4_n_0\ : STD_LOGIC;
  signal \mult_a[1][12]_i_5_n_0\ : STD_LOGIC;
  signal \mult_a[1][17]_i_2_n_0\ : STD_LOGIC;
  signal \mult_a[1][17]_i_3_n_0\ : STD_LOGIC;
  signal \mult_a[1][17]_i_4_n_0\ : STD_LOGIC;
  signal \mult_a[1][4]_i_2_n_0\ : STD_LOGIC;
  signal \mult_a[1][4]_i_3_n_0\ : STD_LOGIC;
  signal \mult_a[1][4]_i_4_n_0\ : STD_LOGIC;
  signal \mult_a[1][4]_i_5_n_0\ : STD_LOGIC;
  signal \mult_a[1][8]_i_2_n_0\ : STD_LOGIC;
  signal \mult_a[1][8]_i_3_n_0\ : STD_LOGIC;
  signal \mult_a[1][8]_i_4_n_0\ : STD_LOGIC;
  signal \mult_a[1][8]_i_5_n_0\ : STD_LOGIC;
  signal \mult_a[2][0]_i_1_n_0\ : STD_LOGIC;
  signal \mult_a[2][12]_i_2_n_0\ : STD_LOGIC;
  signal \mult_a[2][12]_i_3_n_0\ : STD_LOGIC;
  signal \mult_a[2][12]_i_4_n_0\ : STD_LOGIC;
  signal \mult_a[2][12]_i_5_n_0\ : STD_LOGIC;
  signal \mult_a[2][17]_i_2_n_0\ : STD_LOGIC;
  signal \mult_a[2][17]_i_3_n_0\ : STD_LOGIC;
  signal \mult_a[2][17]_i_4_n_0\ : STD_LOGIC;
  signal \mult_a[2][4]_i_2_n_0\ : STD_LOGIC;
  signal \mult_a[2][4]_i_3_n_0\ : STD_LOGIC;
  signal \mult_a[2][4]_i_4_n_0\ : STD_LOGIC;
  signal \mult_a[2][4]_i_5_n_0\ : STD_LOGIC;
  signal \mult_a[2][8]_i_2_n_0\ : STD_LOGIC;
  signal \mult_a[2][8]_i_3_n_0\ : STD_LOGIC;
  signal \mult_a[2][8]_i_4_n_0\ : STD_LOGIC;
  signal \mult_a[2][8]_i_5_n_0\ : STD_LOGIC;
  signal \mult_a_reg[0][12]_i_1_n_0\ : STD_LOGIC;
  signal \mult_a_reg[0][12]_i_1_n_1\ : STD_LOGIC;
  signal \mult_a_reg[0][12]_i_1_n_2\ : STD_LOGIC;
  signal \mult_a_reg[0][12]_i_1_n_3\ : STD_LOGIC;
  signal \mult_a_reg[0][17]_i_1_n_1\ : STD_LOGIC;
  signal \mult_a_reg[0][17]_i_1_n_2\ : STD_LOGIC;
  signal \mult_a_reg[0][17]_i_1_n_3\ : STD_LOGIC;
  signal \mult_a_reg[0][4]_i_1_n_0\ : STD_LOGIC;
  signal \mult_a_reg[0][4]_i_1_n_1\ : STD_LOGIC;
  signal \mult_a_reg[0][4]_i_1_n_2\ : STD_LOGIC;
  signal \mult_a_reg[0][4]_i_1_n_3\ : STD_LOGIC;
  signal \mult_a_reg[0][8]_i_1_n_0\ : STD_LOGIC;
  signal \mult_a_reg[0][8]_i_1_n_1\ : STD_LOGIC;
  signal \mult_a_reg[0][8]_i_1_n_2\ : STD_LOGIC;
  signal \mult_a_reg[0][8]_i_1_n_3\ : STD_LOGIC;
  signal \mult_a_reg[1][12]_i_1_n_0\ : STD_LOGIC;
  signal \mult_a_reg[1][12]_i_1_n_1\ : STD_LOGIC;
  signal \mult_a_reg[1][12]_i_1_n_2\ : STD_LOGIC;
  signal \mult_a_reg[1][12]_i_1_n_3\ : STD_LOGIC;
  signal \mult_a_reg[1][12]_i_1_n_4\ : STD_LOGIC;
  signal \mult_a_reg[1][12]_i_1_n_5\ : STD_LOGIC;
  signal \mult_a_reg[1][12]_i_1_n_6\ : STD_LOGIC;
  signal \mult_a_reg[1][12]_i_1_n_7\ : STD_LOGIC;
  signal \mult_a_reg[1][17]_i_1_n_1\ : STD_LOGIC;
  signal \mult_a_reg[1][17]_i_1_n_2\ : STD_LOGIC;
  signal \mult_a_reg[1][17]_i_1_n_3\ : STD_LOGIC;
  signal \mult_a_reg[1][17]_i_1_n_4\ : STD_LOGIC;
  signal \mult_a_reg[1][17]_i_1_n_5\ : STD_LOGIC;
  signal \mult_a_reg[1][17]_i_1_n_6\ : STD_LOGIC;
  signal \mult_a_reg[1][17]_i_1_n_7\ : STD_LOGIC;
  signal \mult_a_reg[1][4]_i_1_n_0\ : STD_LOGIC;
  signal \mult_a_reg[1][4]_i_1_n_1\ : STD_LOGIC;
  signal \mult_a_reg[1][4]_i_1_n_2\ : STD_LOGIC;
  signal \mult_a_reg[1][4]_i_1_n_3\ : STD_LOGIC;
  signal \mult_a_reg[1][4]_i_1_n_4\ : STD_LOGIC;
  signal \mult_a_reg[1][4]_i_1_n_5\ : STD_LOGIC;
  signal \mult_a_reg[1][4]_i_1_n_6\ : STD_LOGIC;
  signal \mult_a_reg[1][4]_i_1_n_7\ : STD_LOGIC;
  signal \mult_a_reg[1][8]_i_1_n_0\ : STD_LOGIC;
  signal \mult_a_reg[1][8]_i_1_n_1\ : STD_LOGIC;
  signal \mult_a_reg[1][8]_i_1_n_2\ : STD_LOGIC;
  signal \mult_a_reg[1][8]_i_1_n_3\ : STD_LOGIC;
  signal \mult_a_reg[1][8]_i_1_n_4\ : STD_LOGIC;
  signal \mult_a_reg[1][8]_i_1_n_5\ : STD_LOGIC;
  signal \mult_a_reg[1][8]_i_1_n_6\ : STD_LOGIC;
  signal \mult_a_reg[1][8]_i_1_n_7\ : STD_LOGIC;
  signal \mult_a_reg[2][12]_i_1_n_0\ : STD_LOGIC;
  signal \mult_a_reg[2][12]_i_1_n_1\ : STD_LOGIC;
  signal \mult_a_reg[2][12]_i_1_n_2\ : STD_LOGIC;
  signal \mult_a_reg[2][12]_i_1_n_3\ : STD_LOGIC;
  signal \mult_a_reg[2][12]_i_1_n_4\ : STD_LOGIC;
  signal \mult_a_reg[2][12]_i_1_n_5\ : STD_LOGIC;
  signal \mult_a_reg[2][12]_i_1_n_6\ : STD_LOGIC;
  signal \mult_a_reg[2][12]_i_1_n_7\ : STD_LOGIC;
  signal \mult_a_reg[2][17]_i_1_n_1\ : STD_LOGIC;
  signal \mult_a_reg[2][17]_i_1_n_2\ : STD_LOGIC;
  signal \mult_a_reg[2][17]_i_1_n_3\ : STD_LOGIC;
  signal \mult_a_reg[2][17]_i_1_n_4\ : STD_LOGIC;
  signal \mult_a_reg[2][17]_i_1_n_5\ : STD_LOGIC;
  signal \mult_a_reg[2][17]_i_1_n_6\ : STD_LOGIC;
  signal \mult_a_reg[2][17]_i_1_n_7\ : STD_LOGIC;
  signal \mult_a_reg[2][4]_i_1_n_0\ : STD_LOGIC;
  signal \mult_a_reg[2][4]_i_1_n_1\ : STD_LOGIC;
  signal \mult_a_reg[2][4]_i_1_n_2\ : STD_LOGIC;
  signal \mult_a_reg[2][4]_i_1_n_3\ : STD_LOGIC;
  signal \mult_a_reg[2][4]_i_1_n_4\ : STD_LOGIC;
  signal \mult_a_reg[2][4]_i_1_n_5\ : STD_LOGIC;
  signal \mult_a_reg[2][4]_i_1_n_6\ : STD_LOGIC;
  signal \mult_a_reg[2][4]_i_1_n_7\ : STD_LOGIC;
  signal \mult_a_reg[2][8]_i_1_n_0\ : STD_LOGIC;
  signal \mult_a_reg[2][8]_i_1_n_1\ : STD_LOGIC;
  signal \mult_a_reg[2][8]_i_1_n_2\ : STD_LOGIC;
  signal \mult_a_reg[2][8]_i_1_n_3\ : STD_LOGIC;
  signal \mult_a_reg[2][8]_i_1_n_4\ : STD_LOGIC;
  signal \mult_a_reg[2][8]_i_1_n_5\ : STD_LOGIC;
  signal \mult_a_reg[2][8]_i_1_n_6\ : STD_LOGIC;
  signal \mult_a_reg[2][8]_i_1_n_7\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][10]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][11]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][12]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][13]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][14]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][15]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][17]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][2]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][3]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][4]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][5]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][6]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][7]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][8]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[0][9]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][0]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][10]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][11]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][12]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][13]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][14]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][15]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][17]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][1]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][2]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][3]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][4]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][5]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][6]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][7]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][8]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[1][9]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][0]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][10]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][11]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][12]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][13]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][14]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][15]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][17]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][1]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][2]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][3]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][4]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][5]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][6]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][7]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][8]\ : STD_LOGIC;
  signal \mult_a_reg_n_0_[2][9]\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_17\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_18\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_19\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_20\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_21\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_22\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_23\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_24\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_25\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_26\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_27\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_28\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_29\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_30\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_31\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_32\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_33\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_34\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_35\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_36\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_37\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_38\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_39\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_40\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_41\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_42\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_43\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_44\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_45\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_46\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_47\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_48\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_49\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_50\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_51\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_52\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_53\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_54\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_55\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_56\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_57\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_58\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_59\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_60\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_61\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_62\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_63\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_64\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_65\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_66\ : STD_LOGIC;
  signal \mult_gen[0].MULT_MACRO_inst_n_67\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_17\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_18\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_19\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_20\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_21\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_22\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_23\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_24\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_25\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_26\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_27\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_28\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_29\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_30\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_31\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_32\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_33\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_34\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_35\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_36\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_37\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_38\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_39\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_40\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_41\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_42\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_43\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_44\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_45\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_46\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_47\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_48\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_49\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_50\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_51\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_52\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_53\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_54\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_55\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_56\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_57\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_58\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_59\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_60\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_61\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_62\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_63\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_64\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_65\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_66\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_67\ : STD_LOGIC;
  signal \mult_gen[1].MULT_MACRO_inst_n_68\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_17\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_18\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_19\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_20\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_21\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_22\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_23\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_24\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_25\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_26\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_27\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_28\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_29\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_30\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_31\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_32\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_33\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_34\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_35\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_36\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_37\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_38\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_39\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_40\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_41\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_42\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_43\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_44\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_45\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_46\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_47\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_48\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_49\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_50\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_51\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_52\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_53\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_54\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_55\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_56\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_57\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_58\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_59\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_60\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_61\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_62\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_63\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_64\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_65\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_66\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_67\ : STD_LOGIC;
  signal \mult_gen[2].MULT_MACRO_inst_n_68\ : STD_LOGIC;
  signal \mult_p[0]_0\ : STD_LOGIC_VECTOR ( 32 downto 16 );
  signal \mult_p[1]_1\ : STD_LOGIC_VECTOR ( 32 downto 16 );
  signal \mult_p[2]_2\ : STD_LOGIC_VECTOR ( 32 downto 16 );
  signal p_0_in : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal p_0_in_3 : STD_LOGIC;
  signal \p_0_in_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \p_0_in_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \p_0_in_carry__0_n_3\ : STD_LOGIC;
  signal p_0_in_carry_i_1_n_0 : STD_LOGIC;
  signal p_0_in_carry_i_2_n_0 : STD_LOGIC;
  signal p_0_in_carry_i_3_n_0 : STD_LOGIC;
  signal p_0_in_carry_i_4_n_0 : STD_LOGIC;
  signal p_0_in_carry_n_0 : STD_LOGIC;
  signal p_0_in_carry_n_1 : STD_LOGIC;
  signal p_0_in_carry_n_2 : STD_LOGIC;
  signal p_0_in_carry_n_3 : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal p_2_in : STD_LOGIC;
  signal \p_2_in_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \p_2_in_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \p_2_in_carry__0_n_3\ : STD_LOGIC;
  signal p_2_in_carry_i_1_n_0 : STD_LOGIC;
  signal p_2_in_carry_i_2_n_0 : STD_LOGIC;
  signal p_2_in_carry_i_3_n_0 : STD_LOGIC;
  signal p_2_in_carry_i_4_n_0 : STD_LOGIC;
  signal p_2_in_carry_n_0 : STD_LOGIC;
  signal p_2_in_carry_n_1 : STD_LOGIC;
  signal p_2_in_carry_n_2 : STD_LOGIC;
  signal p_2_in_carry_n_3 : STD_LOGIC;
  signal \parallel_in_gen.in_data_s_reg[0]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \parallel_in_gen.in_data_s_reg[1]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \parallel_in_gen.in_data_s_reg[2]\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \pwm_cnt0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \pwm_cnt0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \pwm_cnt0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \pwm_cnt0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \pwm_cnt0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \pwm_cnt0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \pwm_cnt0_carry__0_n_0\ : STD_LOGIC;
  signal \pwm_cnt0_carry__0_n_1\ : STD_LOGIC;
  signal \pwm_cnt0_carry__0_n_2\ : STD_LOGIC;
  signal \pwm_cnt0_carry__0_n_3\ : STD_LOGIC;
  signal \pwm_cnt0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \pwm_cnt0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \pwm_cnt0_carry__1_n_3\ : STD_LOGIC;
  signal pwm_cnt0_carry_i_1_n_0 : STD_LOGIC;
  signal pwm_cnt0_carry_i_2_n_0 : STD_LOGIC;
  signal pwm_cnt0_carry_i_3_n_0 : STD_LOGIC;
  signal pwm_cnt0_carry_i_4_n_0 : STD_LOGIC;
  signal pwm_cnt0_carry_i_5_n_0 : STD_LOGIC;
  signal pwm_cnt0_carry_i_6_n_0 : STD_LOGIC;
  signal pwm_cnt0_carry_i_7_n_0 : STD_LOGIC;
  signal pwm_cnt0_carry_i_8_n_0 : STD_LOGIC;
  signal pwm_cnt0_carry_n_0 : STD_LOGIC;
  signal pwm_cnt0_carry_n_1 : STD_LOGIC;
  signal pwm_cnt0_carry_n_2 : STD_LOGIC;
  signal pwm_cnt0_carry_n_3 : STD_LOGIC;
  signal \pwm_cnt[0]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \pwm_cnt[12]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_cnt[12]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_cnt[12]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_cnt[12]_i_5_n_0\ : STD_LOGIC;
  signal \pwm_cnt[16]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_cnt[16]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_cnt[4]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_cnt[4]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_cnt[4]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_cnt[4]_i_5_n_0\ : STD_LOGIC;
  signal \pwm_cnt[8]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_cnt[8]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_cnt[8]_i_4_n_0\ : STD_LOGIC;
  signal \pwm_cnt[8]_i_5_n_0\ : STD_LOGIC;
  signal pwm_cnt_reg : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \pwm_cnt_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_cnt_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_cnt_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_cnt_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_cnt_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_cnt_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_cnt_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_cnt_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_cnt_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \^pwm_h\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^pwm_l\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__0/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__0/i__carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW__inferred__0/i__carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__1/i__carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__1/i__carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW__inferred__10/i__carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__10/i__carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW__inferred__11/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__11/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW__inferred__11/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__12/i__carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__12/i__carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW__inferred__13/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__13/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW__inferred__13/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__14/i__carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__14/i__carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW__inferred__15/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__15/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW__inferred__15/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__2/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__2/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW__inferred__2/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__3/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__3/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW__inferred__3/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__4/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__4/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__4/i__carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW__inferred__4/i__carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__5/i__carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__5/i__carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW__inferred__6/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__6/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW__inferred__6/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__7/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__7/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__7/i__carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW__inferred__7/i__carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__8/i__carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__8/i__carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW__inferred__9/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW__inferred__9/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW__inferred__9/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_mult_a_reg[0][17]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_mult_a_reg[1][17]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_mult_a_reg[2][17]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_p_0_in_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_p_0_in_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_p_0_in_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_p_2_in_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_p_2_in_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_p_2_in_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_pwm_cnt0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_pwm_cnt0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_pwm_cnt0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_pwm_cnt0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_pwm_cnt_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_pwm_cnt_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bipolar_gen.h_start[0][12]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \bipolar_gen.h_start[0][4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \bipolar_gen.h_start[1][12]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \bipolar_gen.h_start[1][4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \bipolar_gen.h_start[2][12]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \bipolar_gen.h_start[2][4]_i_1\ : label is "soft_lutpair0";
begin
  pwm_h(2 downto 0) <= \^pwm_h\(2 downto 0);
  pwm_l(2 downto 0) <= \^pwm_l\(2 downto 0);
\_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_carry_n_0\,
      CO(2) => \_carry_n_1\,
      CO(1) => \_carry_n_2\,
      CO(0) => \_carry_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \_carry_i_1_n_0\,
      S(2) => \_carry_i_2_n_0\,
      S(1) => \_carry_i_3_n_0\,
      S(0) => \_carry_i_4_n_0\
    );
\_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_carry_n_0\,
      CO(3 downto 2) => \NLW__carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \_carry__0_n_2\,
      CO(0) => \_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \_carry__0_i_1_n_0\,
      S(0) => \_carry__0_i_2_n_0\
    );
\_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => pwm_cnt_reg(17),
      I1 => pwm_cnt_reg(16),
      I2 => pwm_cnt_reg(15),
      O => \_carry__0_i_1_n_0\
    );
\_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => pwm_cnt_reg(12),
      I1 => \bipolar_gen.l_end_reg[2]\(12),
      I2 => pwm_cnt_reg(14),
      I3 => pwm_cnt_reg(13),
      O => \_carry__0_i_2_n_0\
    );
\_carry_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => pwm_cnt_reg(9),
      I1 => \bipolar_gen.l_end_reg[2]\(12),
      I2 => pwm_cnt_reg(11),
      I3 => pwm_cnt_reg(10),
      O => \_carry_i_1_n_0\
    );
\_carry_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2001"
    )
        port map (
      I0 => pwm_cnt_reg(6),
      I1 => pwm_cnt_reg(7),
      I2 => \bipolar_gen.l_end_reg[2]\(12),
      I3 => pwm_cnt_reg(8),
      O => \_carry_i_2_n_0\
    );
\_carry_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2001"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      I1 => pwm_cnt_reg(4),
      I2 => \bipolar_gen.l_end_reg[2]\(12),
      I3 => pwm_cnt_reg(5),
      O => \_carry_i_3_n_0\
    );
\_carry_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8001"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => \bipolar_gen.l_end_reg[2]\(12),
      I2 => pwm_cnt_reg(2),
      I3 => pwm_cnt_reg(1),
      O => \_carry_i_4_n_0\
    );
\_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__0/i__carry_n_0\,
      CO(2) => \_inferred__0/i__carry_n_1\,
      CO(1) => \_inferred__0/i__carry_n_2\,
      CO(0) => \_inferred__0/i__carry_n_3\,
      CYINIT => '0',
      DI(3) => \mult_gen[0].MULT_MACRO_inst_n_48\,
      DI(2) => '0',
      DI(1) => \mult_gen[0].MULT_MACRO_inst_n_49\,
      DI(0) => \mult_gen[0].MULT_MACRO_inst_n_50\,
      O(3 downto 0) => \NLW__inferred__0/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \mult_gen[0].MULT_MACRO_inst_n_23\,
      S(2) => \mult_gen[0].MULT_MACRO_inst_n_24\,
      S(1) => \mult_gen[0].MULT_MACRO_inst_n_25\,
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_26\
    );
\_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__0/i__carry_n_0\,
      CO(3) => \_inferred__0/i__carry__0_n_0\,
      CO(2) => \_inferred__0/i__carry__0_n_1\,
      CO(1) => \_inferred__0/i__carry__0_n_2\,
      CO(0) => \_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \mult_gen[0].MULT_MACRO_inst_n_51\,
      DI(2) => \mult_gen[0].MULT_MACRO_inst_n_52\,
      DI(1) => \mult_gen[0].MULT_MACRO_inst_n_53\,
      DI(0) => \mult_gen[0].MULT_MACRO_inst_n_54\,
      O(3 downto 0) => \NLW__inferred__0/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \mult_gen[0].MULT_MACRO_inst_n_19\,
      S(2) => \mult_gen[0].MULT_MACRO_inst_n_20\,
      S(1) => \mult_gen[0].MULT_MACRO_inst_n_21\,
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_22\
    );
\_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__0/i__carry__0_n_0\,
      CO(3 downto 1) => \NLW__inferred__0/i__carry__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \mult_gen[0].MULT_MACRO_inst_n_17\,
      O(3 downto 0) => \NLW__inferred__0/i__carry__1_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => B"000",
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_18\
    );
\_inferred__1/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__1/i__carry_n_0\,
      CO(2) => \_inferred__1/i__carry_n_1\,
      CO(1) => \_inferred__1/i__carry_n_2\,
      CO(0) => \_inferred__1/i__carry_n_3\,
      CYINIT => \mult_p[0]_0\(16),
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => \mult_p[0]_0\(18 downto 17),
      O(3 downto 0) => p_1_in(4 downto 1),
      S(3) => \mult_gen[0].MULT_MACRO_inst_n_27\,
      S(2) => \mult_gen[0].MULT_MACRO_inst_n_28\,
      S(1) => \mult_gen[0].MULT_MACRO_inst_n_29\,
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_30\
    );
\_inferred__1/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__1/i__carry_n_0\,
      CO(3) => \_inferred__1/i__carry__0_n_0\,
      CO(2) => \_inferred__1/i__carry__0_n_1\,
      CO(1) => \_inferred__1/i__carry__0_n_2\,
      CO(0) => \_inferred__1/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \mult_p[0]_0\(24 downto 21),
      O(3 downto 0) => p_1_in(8 downto 5),
      S(3) => \mult_gen[0].MULT_MACRO_inst_n_55\,
      S(2) => \mult_gen[0].MULT_MACRO_inst_n_56\,
      S(1) => \mult_gen[0].MULT_MACRO_inst_n_57\,
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_58\
    );
\_inferred__1/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__1/i__carry__0_n_0\,
      CO(3) => \_inferred__1/i__carry__1_n_0\,
      CO(2) => \_inferred__1/i__carry__1_n_1\,
      CO(1) => \_inferred__1/i__carry__1_n_2\,
      CO(0) => \_inferred__1/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \mult_p[0]_0\(28 downto 25),
      O(3 downto 0) => p_1_in(12 downto 9),
      S(3) => \mult_gen[0].MULT_MACRO_inst_n_64\,
      S(2) => \mult_gen[0].MULT_MACRO_inst_n_65\,
      S(1) => \mult_gen[0].MULT_MACRO_inst_n_66\,
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_67\
    );
\_inferred__1/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__1/i__carry__1_n_0\,
      CO(3) => \_inferred__1/i__carry__2_n_0\,
      CO(2) => \_inferred__1/i__carry__2_n_1\,
      CO(1) => \_inferred__1/i__carry__2_n_2\,
      CO(0) => \_inferred__1/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \mult_p[0]_0\(32 downto 29),
      O(3 downto 0) => p_1_in(16 downto 13),
      S(3) => \mult_gen[0].MULT_MACRO_inst_n_60\,
      S(2) => \mult_gen[0].MULT_MACRO_inst_n_61\,
      S(1) => \mult_gen[0].MULT_MACRO_inst_n_62\,
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_63\
    );
\_inferred__1/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__1/i__carry__2_n_0\,
      CO(3 downto 0) => \NLW__inferred__1/i__carry__3_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW__inferred__1/i__carry__3_O_UNCONNECTED\(3 downto 1),
      O(0) => p_1_in(17),
      S(3 downto 1) => B"000",
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_59\
    );
\_inferred__10/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__10/i__carry_n_0\,
      CO(2) => \_inferred__10/i__carry_n_1\,
      CO(1) => \_inferred__10/i__carry_n_2\,
      CO(0) => \_inferred__10/i__carry_n_3\,
      CYINIT => \mult_p[0]_0\(16),
      DI(3 downto 2) => \mult_p[0]_0\(20 downto 19),
      DI(1 downto 0) => B"00",
      O(3) => \_inferred__10/i__carry_n_4\,
      O(2) => \_inferred__10/i__carry_n_5\,
      O(1) => \_inferred__10/i__carry_n_6\,
      O(0) => \_inferred__10/i__carry_n_7\,
      S(3) => \mult_gen[0].MULT_MACRO_inst_n_31\,
      S(2) => \mult_gen[0].MULT_MACRO_inst_n_32\,
      S(1) => \mult_gen[0].MULT_MACRO_inst_n_33\,
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_34\
    );
\_inferred__10/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__10/i__carry_n_0\,
      CO(3) => \_inferred__10/i__carry__0_n_0\,
      CO(2) => \_inferred__10/i__carry__0_n_1\,
      CO(1) => \_inferred__10/i__carry__0_n_2\,
      CO(0) => \_inferred__10/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \_inferred__10/i__carry__0_n_4\,
      O(2) => \_inferred__10/i__carry__0_n_5\,
      O(1) => \_inferred__10/i__carry__0_n_6\,
      O(0) => \_inferred__10/i__carry__0_n_7\,
      S(3) => \mult_gen[0].MULT_MACRO_inst_n_35\,
      S(2) => \mult_gen[0].MULT_MACRO_inst_n_36\,
      S(1) => \mult_gen[0].MULT_MACRO_inst_n_37\,
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_38\
    );
\_inferred__10/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__10/i__carry__0_n_0\,
      CO(3) => \_inferred__10/i__carry__1_n_0\,
      CO(2) => \_inferred__10/i__carry__1_n_1\,
      CO(1) => \_inferred__10/i__carry__1_n_2\,
      CO(0) => \_inferred__10/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \_inferred__10/i__carry__1_n_4\,
      O(2) => \_inferred__10/i__carry__1_n_5\,
      O(1) => \_inferred__10/i__carry__1_n_6\,
      O(0) => \_inferred__10/i__carry__1_n_7\,
      S(3) => \mult_gen[0].MULT_MACRO_inst_n_39\,
      S(2) => \mult_gen[0].MULT_MACRO_inst_n_40\,
      S(1) => \mult_gen[0].MULT_MACRO_inst_n_41\,
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_42\
    );
\_inferred__10/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__10/i__carry__1_n_0\,
      CO(3) => \_inferred__10/i__carry__2_n_0\,
      CO(2) => \_inferred__10/i__carry__2_n_1\,
      CO(1) => \_inferred__10/i__carry__2_n_2\,
      CO(0) => \_inferred__10/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \_inferred__10/i__carry__2_n_4\,
      O(2) => \_inferred__10/i__carry__2_n_5\,
      O(1) => \_inferred__10/i__carry__2_n_6\,
      O(0) => \_inferred__10/i__carry__2_n_7\,
      S(3) => \mult_gen[0].MULT_MACRO_inst_n_43\,
      S(2) => \mult_gen[0].MULT_MACRO_inst_n_44\,
      S(1) => \mult_gen[0].MULT_MACRO_inst_n_45\,
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_46\
    );
\_inferred__10/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__10/i__carry__2_n_0\,
      CO(3 downto 0) => \NLW__inferred__10/i__carry__3_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW__inferred__10/i__carry__3_O_UNCONNECTED\(3 downto 1),
      O(0) => \_inferred__10/i__carry__3_n_7\,
      S(3 downto 1) => B"000",
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_47\
    );
\_inferred__11/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__11/i__carry_n_0\,
      CO(2) => \_inferred__11/i__carry_n_1\,
      CO(1) => \_inferred__11/i__carry_n_2\,
      CO(0) => \_inferred__11/i__carry_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__11/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_1__7_n_0\,
      S(2) => \i__carry_i_2__5_n_0\,
      S(1) => \i__carry_i_3__6_n_0\,
      S(0) => \i__carry_i_4__5_n_0\
    );
\_inferred__11/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__11/i__carry_n_0\,
      CO(3 downto 2) => \NLW__inferred__11/i__carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => p_0_out(0),
      CO(0) => \_inferred__11/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__11/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \i__carry__0_i_1__5_n_0\,
      S(0) => \i__carry__0_i_2__6_n_0\
    );
\_inferred__12/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__12/i__carry_n_0\,
      CO(2) => \_inferred__12/i__carry_n_1\,
      CO(1) => \_inferred__12/i__carry_n_2\,
      CO(0) => \_inferred__12/i__carry_n_3\,
      CYINIT => \mult_p[1]_1\(16),
      DI(3 downto 2) => \mult_p[1]_1\(20 downto 19),
      DI(1 downto 0) => B"00",
      O(3) => \_inferred__12/i__carry_n_4\,
      O(2) => \_inferred__12/i__carry_n_5\,
      O(1) => \_inferred__12/i__carry_n_6\,
      O(0) => \_inferred__12/i__carry_n_7\,
      S(3) => \mult_gen[1].MULT_MACRO_inst_n_31\,
      S(2) => \mult_gen[1].MULT_MACRO_inst_n_32\,
      S(1) => \mult_gen[1].MULT_MACRO_inst_n_33\,
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_34\
    );
\_inferred__12/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__12/i__carry_n_0\,
      CO(3) => \_inferred__12/i__carry__0_n_0\,
      CO(2) => \_inferred__12/i__carry__0_n_1\,
      CO(1) => \_inferred__12/i__carry__0_n_2\,
      CO(0) => \_inferred__12/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \_inferred__12/i__carry__0_n_4\,
      O(2) => \_inferred__12/i__carry__0_n_5\,
      O(1) => \_inferred__12/i__carry__0_n_6\,
      O(0) => \_inferred__12/i__carry__0_n_7\,
      S(3) => \mult_gen[1].MULT_MACRO_inst_n_35\,
      S(2) => \mult_gen[1].MULT_MACRO_inst_n_36\,
      S(1) => \mult_gen[1].MULT_MACRO_inst_n_37\,
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_38\
    );
\_inferred__12/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__12/i__carry__0_n_0\,
      CO(3) => \_inferred__12/i__carry__1_n_0\,
      CO(2) => \_inferred__12/i__carry__1_n_1\,
      CO(1) => \_inferred__12/i__carry__1_n_2\,
      CO(0) => \_inferred__12/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \_inferred__12/i__carry__1_n_4\,
      O(2) => \_inferred__12/i__carry__1_n_5\,
      O(1) => \_inferred__12/i__carry__1_n_6\,
      O(0) => \_inferred__12/i__carry__1_n_7\,
      S(3) => \mult_gen[1].MULT_MACRO_inst_n_39\,
      S(2) => \mult_gen[1].MULT_MACRO_inst_n_40\,
      S(1) => \mult_gen[1].MULT_MACRO_inst_n_41\,
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_42\
    );
\_inferred__12/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__12/i__carry__1_n_0\,
      CO(3) => \_inferred__12/i__carry__2_n_0\,
      CO(2) => \_inferred__12/i__carry__2_n_1\,
      CO(1) => \_inferred__12/i__carry__2_n_2\,
      CO(0) => \_inferred__12/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \_inferred__12/i__carry__2_n_4\,
      O(2) => \_inferred__12/i__carry__2_n_5\,
      O(1) => \_inferred__12/i__carry__2_n_6\,
      O(0) => \_inferred__12/i__carry__2_n_7\,
      S(3) => \mult_gen[1].MULT_MACRO_inst_n_43\,
      S(2) => \mult_gen[1].MULT_MACRO_inst_n_44\,
      S(1) => \mult_gen[1].MULT_MACRO_inst_n_45\,
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_46\
    );
\_inferred__12/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__12/i__carry__2_n_0\,
      CO(3 downto 0) => \NLW__inferred__12/i__carry__3_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW__inferred__12/i__carry__3_O_UNCONNECTED\(3 downto 1),
      O(0) => \_inferred__12/i__carry__3_n_7\,
      S(3 downto 1) => B"000",
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_47\
    );
\_inferred__13/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__13/i__carry_n_0\,
      CO(2) => \_inferred__13/i__carry_n_1\,
      CO(1) => \_inferred__13/i__carry_n_2\,
      CO(0) => \_inferred__13/i__carry_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__13/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_1__9_n_0\,
      S(2) => \i__carry_i_2__6_n_0\,
      S(1) => \i__carry_i_3__7_n_0\,
      S(0) => \i__carry_i_4__6_n_0\
    );
\_inferred__13/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__13/i__carry_n_0\,
      CO(3 downto 2) => \NLW__inferred__13/i__carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => p_0_out(1),
      CO(0) => \_inferred__13/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__13/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \i__carry__0_i_1__6_n_0\,
      S(0) => \i__carry__0_i_2__7_n_0\
    );
\_inferred__14/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__14/i__carry_n_0\,
      CO(2) => \_inferred__14/i__carry_n_1\,
      CO(1) => \_inferred__14/i__carry_n_2\,
      CO(0) => \_inferred__14/i__carry_n_3\,
      CYINIT => \mult_p[2]_2\(16),
      DI(3 downto 2) => \mult_p[2]_2\(20 downto 19),
      DI(1 downto 0) => B"00",
      O(3) => \_inferred__14/i__carry_n_4\,
      O(2) => \_inferred__14/i__carry_n_5\,
      O(1) => \_inferred__14/i__carry_n_6\,
      O(0) => \_inferred__14/i__carry_n_7\,
      S(3) => \mult_gen[2].MULT_MACRO_inst_n_31\,
      S(2) => \mult_gen[2].MULT_MACRO_inst_n_32\,
      S(1) => \mult_gen[2].MULT_MACRO_inst_n_33\,
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_34\
    );
\_inferred__14/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__14/i__carry_n_0\,
      CO(3) => \_inferred__14/i__carry__0_n_0\,
      CO(2) => \_inferred__14/i__carry__0_n_1\,
      CO(1) => \_inferred__14/i__carry__0_n_2\,
      CO(0) => \_inferred__14/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \_inferred__14/i__carry__0_n_4\,
      O(2) => \_inferred__14/i__carry__0_n_5\,
      O(1) => \_inferred__14/i__carry__0_n_6\,
      O(0) => \_inferred__14/i__carry__0_n_7\,
      S(3) => \mult_gen[2].MULT_MACRO_inst_n_35\,
      S(2) => \mult_gen[2].MULT_MACRO_inst_n_36\,
      S(1) => \mult_gen[2].MULT_MACRO_inst_n_37\,
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_38\
    );
\_inferred__14/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__14/i__carry__0_n_0\,
      CO(3) => \_inferred__14/i__carry__1_n_0\,
      CO(2) => \_inferred__14/i__carry__1_n_1\,
      CO(1) => \_inferred__14/i__carry__1_n_2\,
      CO(0) => \_inferred__14/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \_inferred__14/i__carry__1_n_4\,
      O(2) => \_inferred__14/i__carry__1_n_5\,
      O(1) => \_inferred__14/i__carry__1_n_6\,
      O(0) => \_inferred__14/i__carry__1_n_7\,
      S(3) => \mult_gen[2].MULT_MACRO_inst_n_39\,
      S(2) => \mult_gen[2].MULT_MACRO_inst_n_40\,
      S(1) => \mult_gen[2].MULT_MACRO_inst_n_41\,
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_42\
    );
\_inferred__14/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__14/i__carry__1_n_0\,
      CO(3) => \_inferred__14/i__carry__2_n_0\,
      CO(2) => \_inferred__14/i__carry__2_n_1\,
      CO(1) => \_inferred__14/i__carry__2_n_2\,
      CO(0) => \_inferred__14/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \_inferred__14/i__carry__2_n_4\,
      O(2) => \_inferred__14/i__carry__2_n_5\,
      O(1) => \_inferred__14/i__carry__2_n_6\,
      O(0) => \_inferred__14/i__carry__2_n_7\,
      S(3) => \mult_gen[2].MULT_MACRO_inst_n_43\,
      S(2) => \mult_gen[2].MULT_MACRO_inst_n_44\,
      S(1) => \mult_gen[2].MULT_MACRO_inst_n_45\,
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_46\
    );
\_inferred__14/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__14/i__carry__2_n_0\,
      CO(3 downto 0) => \NLW__inferred__14/i__carry__3_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW__inferred__14/i__carry__3_O_UNCONNECTED\(3 downto 1),
      O(0) => \_inferred__14/i__carry__3_n_7\,
      S(3 downto 1) => B"000",
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_47\
    );
\_inferred__15/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__15/i__carry_n_0\,
      CO(2) => \_inferred__15/i__carry_n_1\,
      CO(1) => \_inferred__15/i__carry_n_2\,
      CO(0) => \_inferred__15/i__carry_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__15/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_1__11_n_0\,
      S(2) => \i__carry_i_2__7_n_0\,
      S(1) => \i__carry_i_3__8_n_0\,
      S(0) => \i__carry_i_4__7_n_0\
    );
\_inferred__15/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__15/i__carry_n_0\,
      CO(3 downto 2) => \NLW__inferred__15/i__carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => p_0_out(2),
      CO(0) => \_inferred__15/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__15/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \i__carry__0_i_1__7_n_0\,
      S(0) => \i__carry__0_i_2__8_n_0\
    );
\_inferred__2/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__2/i__carry_n_0\,
      CO(2) => \_inferred__2/i__carry_n_1\,
      CO(1) => \_inferred__2/i__carry_n_2\,
      CO(0) => \_inferred__2/i__carry_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__2/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_1__0_n_0\,
      S(2) => \i__carry_i_2__0_n_0\,
      S(1) => \i__carry_i_3__0_n_0\,
      S(0) => \i__carry_i_4__0_n_0\
    );
\_inferred__2/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__2/i__carry_n_0\,
      CO(3 downto 2) => \NLW__inferred__2/i__carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \_inferred__2/i__carry__0_n_2\,
      CO(0) => \_inferred__2/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__2/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \i__carry__0_i_1__0_n_0\,
      S(0) => \i__carry__0_i_2__0_n_0\
    );
\_inferred__3/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__3/i__carry_n_0\,
      CO(2) => \_inferred__3/i__carry_n_1\,
      CO(1) => \_inferred__3/i__carry_n_2\,
      CO(0) => \_inferred__3/i__carry_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__3/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_1__1_n_0\,
      S(2) => \i__carry_i_2__11_n_0\,
      S(1) => \i__carry_i_3__1_n_0\,
      S(0) => \i__carry_i_4__8_n_0\
    );
\_inferred__3/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__3/i__carry_n_0\,
      CO(3 downto 2) => \NLW__inferred__3/i__carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \_inferred__3/i__carry__0_n_2\,
      CO(0) => \_inferred__3/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__3/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \i__carry__0_i_1__11_n_0\,
      S(0) => \i__carry__0_i_2__1_n_0\
    );
\_inferred__4/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__4/i__carry_n_0\,
      CO(2) => \_inferred__4/i__carry_n_1\,
      CO(1) => \_inferred__4/i__carry_n_2\,
      CO(0) => \_inferred__4/i__carry_n_3\,
      CYINIT => '0',
      DI(3) => \mult_gen[1].MULT_MACRO_inst_n_48\,
      DI(2) => '0',
      DI(1) => \mult_gen[1].MULT_MACRO_inst_n_49\,
      DI(0) => \mult_gen[1].MULT_MACRO_inst_n_50\,
      O(3 downto 0) => \NLW__inferred__4/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \mult_gen[1].MULT_MACRO_inst_n_23\,
      S(2) => \mult_gen[1].MULT_MACRO_inst_n_24\,
      S(1) => \mult_gen[1].MULT_MACRO_inst_n_25\,
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_26\
    );
\_inferred__4/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__4/i__carry_n_0\,
      CO(3) => \_inferred__4/i__carry__0_n_0\,
      CO(2) => \_inferred__4/i__carry__0_n_1\,
      CO(1) => \_inferred__4/i__carry__0_n_2\,
      CO(0) => \_inferred__4/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \mult_gen[1].MULT_MACRO_inst_n_51\,
      DI(2) => \mult_gen[1].MULT_MACRO_inst_n_52\,
      DI(1) => \mult_gen[1].MULT_MACRO_inst_n_53\,
      DI(0) => \mult_gen[1].MULT_MACRO_inst_n_54\,
      O(3 downto 0) => \NLW__inferred__4/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \mult_gen[1].MULT_MACRO_inst_n_19\,
      S(2) => \mult_gen[1].MULT_MACRO_inst_n_20\,
      S(1) => \mult_gen[1].MULT_MACRO_inst_n_21\,
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_22\
    );
\_inferred__4/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__4/i__carry__0_n_0\,
      CO(3 downto 1) => \NLW__inferred__4/i__carry__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \_inferred__4/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \mult_gen[1].MULT_MACRO_inst_n_17\,
      O(3 downto 0) => \NLW__inferred__4/i__carry__1_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => B"000",
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_18\
    );
\_inferred__5/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__5/i__carry_n_0\,
      CO(2) => \_inferred__5/i__carry_n_1\,
      CO(1) => \_inferred__5/i__carry_n_2\,
      CO(0) => \_inferred__5/i__carry_n_3\,
      CYINIT => \mult_p[1]_1\(16),
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => \mult_p[1]_1\(18 downto 17),
      O(3) => \_inferred__5/i__carry_n_4\,
      O(2) => \_inferred__5/i__carry_n_5\,
      O(1) => \_inferred__5/i__carry_n_6\,
      O(0) => \_inferred__5/i__carry_n_7\,
      S(3) => \mult_gen[1].MULT_MACRO_inst_n_27\,
      S(2) => \mult_gen[1].MULT_MACRO_inst_n_28\,
      S(1) => \mult_gen[1].MULT_MACRO_inst_n_29\,
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_30\
    );
\_inferred__5/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__5/i__carry_n_0\,
      CO(3) => \_inferred__5/i__carry__0_n_0\,
      CO(2) => \_inferred__5/i__carry__0_n_1\,
      CO(1) => \_inferred__5/i__carry__0_n_2\,
      CO(0) => \_inferred__5/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \mult_p[1]_1\(24 downto 21),
      O(3) => \_inferred__5/i__carry__0_n_4\,
      O(2) => \_inferred__5/i__carry__0_n_5\,
      O(1) => \_inferred__5/i__carry__0_n_6\,
      O(0) => \_inferred__5/i__carry__0_n_7\,
      S(3) => \mult_gen[1].MULT_MACRO_inst_n_55\,
      S(2) => \mult_gen[1].MULT_MACRO_inst_n_56\,
      S(1) => \mult_gen[1].MULT_MACRO_inst_n_57\,
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_58\
    );
\_inferred__5/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__5/i__carry__0_n_0\,
      CO(3) => \_inferred__5/i__carry__1_n_0\,
      CO(2) => \_inferred__5/i__carry__1_n_1\,
      CO(1) => \_inferred__5/i__carry__1_n_2\,
      CO(0) => \_inferred__5/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \mult_p[1]_1\(28 downto 25),
      O(3) => \_inferred__5/i__carry__1_n_4\,
      O(2) => \_inferred__5/i__carry__1_n_5\,
      O(1) => \_inferred__5/i__carry__1_n_6\,
      O(0) => \_inferred__5/i__carry__1_n_7\,
      S(3) => \mult_gen[1].MULT_MACRO_inst_n_64\,
      S(2) => \mult_gen[1].MULT_MACRO_inst_n_65\,
      S(1) => \mult_gen[1].MULT_MACRO_inst_n_66\,
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_67\
    );
\_inferred__5/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__5/i__carry__1_n_0\,
      CO(3) => \_inferred__5/i__carry__2_n_0\,
      CO(2) => \_inferred__5/i__carry__2_n_1\,
      CO(1) => \_inferred__5/i__carry__2_n_2\,
      CO(0) => \_inferred__5/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \mult_p[1]_1\(32 downto 29),
      O(3) => \_inferred__5/i__carry__2_n_4\,
      O(2) => \_inferred__5/i__carry__2_n_5\,
      O(1) => \_inferred__5/i__carry__2_n_6\,
      O(0) => \_inferred__5/i__carry__2_n_7\,
      S(3) => \mult_gen[1].MULT_MACRO_inst_n_60\,
      S(2) => \mult_gen[1].MULT_MACRO_inst_n_61\,
      S(1) => \mult_gen[1].MULT_MACRO_inst_n_62\,
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_63\
    );
\_inferred__5/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__5/i__carry__2_n_0\,
      CO(3 downto 0) => \NLW__inferred__5/i__carry__3_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW__inferred__5/i__carry__3_O_UNCONNECTED\(3 downto 1),
      O(0) => \_inferred__5/i__carry__3_n_7\,
      S(3 downto 1) => B"000",
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_59\
    );
\_inferred__6/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__6/i__carry_n_0\,
      CO(2) => \_inferred__6/i__carry_n_1\,
      CO(1) => \_inferred__6/i__carry_n_2\,
      CO(0) => \_inferred__6/i__carry_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__6/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_1__3_n_0\,
      S(2) => \i__carry_i_2__2_n_0\,
      S(1) => \i__carry_i_3__3_n_0\,
      S(0) => \i__carry_i_4__2_n_0\
    );
\_inferred__6/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__6/i__carry_n_0\,
      CO(3 downto 2) => \NLW__inferred__6/i__carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \_inferred__6/i__carry__0_n_2\,
      CO(0) => \_inferred__6/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__6/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \i__carry__0_i_1__2_n_0\,
      S(0) => \i__carry__0_i_2__3_n_0\
    );
\_inferred__7/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__7/i__carry_n_0\,
      CO(2) => \_inferred__7/i__carry_n_1\,
      CO(1) => \_inferred__7/i__carry_n_2\,
      CO(0) => \_inferred__7/i__carry_n_3\,
      CYINIT => '0',
      DI(3) => \mult_gen[2].MULT_MACRO_inst_n_48\,
      DI(2) => '0',
      DI(1) => \mult_gen[2].MULT_MACRO_inst_n_49\,
      DI(0) => \mult_gen[2].MULT_MACRO_inst_n_50\,
      O(3 downto 0) => \NLW__inferred__7/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \mult_gen[2].MULT_MACRO_inst_n_23\,
      S(2) => \mult_gen[2].MULT_MACRO_inst_n_24\,
      S(1) => \mult_gen[2].MULT_MACRO_inst_n_25\,
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_26\
    );
\_inferred__7/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__7/i__carry_n_0\,
      CO(3) => \_inferred__7/i__carry__0_n_0\,
      CO(2) => \_inferred__7/i__carry__0_n_1\,
      CO(1) => \_inferred__7/i__carry__0_n_2\,
      CO(0) => \_inferred__7/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \mult_gen[2].MULT_MACRO_inst_n_51\,
      DI(2) => \mult_gen[2].MULT_MACRO_inst_n_52\,
      DI(1) => \mult_gen[2].MULT_MACRO_inst_n_53\,
      DI(0) => \mult_gen[2].MULT_MACRO_inst_n_54\,
      O(3 downto 0) => \NLW__inferred__7/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \mult_gen[2].MULT_MACRO_inst_n_19\,
      S(2) => \mult_gen[2].MULT_MACRO_inst_n_20\,
      S(1) => \mult_gen[2].MULT_MACRO_inst_n_21\,
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_22\
    );
\_inferred__7/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__7/i__carry__0_n_0\,
      CO(3 downto 1) => \NLW__inferred__7/i__carry__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \_inferred__7/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \mult_gen[2].MULT_MACRO_inst_n_17\,
      O(3 downto 0) => \NLW__inferred__7/i__carry__1_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => B"000",
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_18\
    );
\_inferred__8/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__8/i__carry_n_0\,
      CO(2) => \_inferred__8/i__carry_n_1\,
      CO(1) => \_inferred__8/i__carry_n_2\,
      CO(0) => \_inferred__8/i__carry_n_3\,
      CYINIT => \mult_p[2]_2\(16),
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => \mult_p[2]_2\(18 downto 17),
      O(3) => \_inferred__8/i__carry_n_4\,
      O(2) => \_inferred__8/i__carry_n_5\,
      O(1) => \_inferred__8/i__carry_n_6\,
      O(0) => \_inferred__8/i__carry_n_7\,
      S(3) => \mult_gen[2].MULT_MACRO_inst_n_27\,
      S(2) => \mult_gen[2].MULT_MACRO_inst_n_28\,
      S(1) => \mult_gen[2].MULT_MACRO_inst_n_29\,
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_30\
    );
\_inferred__8/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__8/i__carry_n_0\,
      CO(3) => \_inferred__8/i__carry__0_n_0\,
      CO(2) => \_inferred__8/i__carry__0_n_1\,
      CO(1) => \_inferred__8/i__carry__0_n_2\,
      CO(0) => \_inferred__8/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \mult_p[2]_2\(24 downto 21),
      O(3) => \_inferred__8/i__carry__0_n_4\,
      O(2) => \_inferred__8/i__carry__0_n_5\,
      O(1) => \_inferred__8/i__carry__0_n_6\,
      O(0) => \_inferred__8/i__carry__0_n_7\,
      S(3) => \mult_gen[2].MULT_MACRO_inst_n_55\,
      S(2) => \mult_gen[2].MULT_MACRO_inst_n_56\,
      S(1) => \mult_gen[2].MULT_MACRO_inst_n_57\,
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_58\
    );
\_inferred__8/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__8/i__carry__0_n_0\,
      CO(3) => \_inferred__8/i__carry__1_n_0\,
      CO(2) => \_inferred__8/i__carry__1_n_1\,
      CO(1) => \_inferred__8/i__carry__1_n_2\,
      CO(0) => \_inferred__8/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \mult_p[2]_2\(28 downto 25),
      O(3) => \_inferred__8/i__carry__1_n_4\,
      O(2) => \_inferred__8/i__carry__1_n_5\,
      O(1) => \_inferred__8/i__carry__1_n_6\,
      O(0) => \_inferred__8/i__carry__1_n_7\,
      S(3) => \mult_gen[2].MULT_MACRO_inst_n_64\,
      S(2) => \mult_gen[2].MULT_MACRO_inst_n_65\,
      S(1) => \mult_gen[2].MULT_MACRO_inst_n_66\,
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_67\
    );
\_inferred__8/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__8/i__carry__1_n_0\,
      CO(3) => \_inferred__8/i__carry__2_n_0\,
      CO(2) => \_inferred__8/i__carry__2_n_1\,
      CO(1) => \_inferred__8/i__carry__2_n_2\,
      CO(0) => \_inferred__8/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \mult_p[2]_2\(32 downto 29),
      O(3) => \_inferred__8/i__carry__2_n_4\,
      O(2) => \_inferred__8/i__carry__2_n_5\,
      O(1) => \_inferred__8/i__carry__2_n_6\,
      O(0) => \_inferred__8/i__carry__2_n_7\,
      S(3) => \mult_gen[2].MULT_MACRO_inst_n_60\,
      S(2) => \mult_gen[2].MULT_MACRO_inst_n_61\,
      S(1) => \mult_gen[2].MULT_MACRO_inst_n_62\,
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_63\
    );
\_inferred__8/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__8/i__carry__2_n_0\,
      CO(3 downto 0) => \NLW__inferred__8/i__carry__3_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW__inferred__8/i__carry__3_O_UNCONNECTED\(3 downto 1),
      O(0) => \_inferred__8/i__carry__3_n_7\,
      S(3 downto 1) => B"000",
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_59\
    );
\_inferred__9/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__9/i__carry_n_0\,
      CO(2) => \_inferred__9/i__carry_n_1\,
      CO(1) => \_inferred__9/i__carry_n_2\,
      CO(0) => \_inferred__9/i__carry_n_3\,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__9/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_1__5_n_0\,
      S(2) => \i__carry_i_2__4_n_0\,
      S(1) => \i__carry_i_3__5_n_0\,
      S(0) => \i__carry_i_4__4_n_0\
    );
\_inferred__9/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__9/i__carry_n_0\,
      CO(3 downto 2) => \NLW__inferred__9/i__carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \_inferred__9/i__carry__0_n_2\,
      CO(0) => \_inferred__9/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW__inferred__9/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \i__carry__0_i_1__4_n_0\,
      S(0) => \i__carry__0_i_2__5_n_0\
    );
\bipolar_gen.h_end[0][17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \pwm_cnt0_carry__1_n_3\,
      I1 => \_inferred__0/i__carry__1_n_3\,
      O => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end[1][17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \pwm_cnt0_carry__1_n_3\,
      I1 => \_inferred__4/i__carry__1_n_3\,
      O => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end[2][17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \pwm_cnt0_carry__1_n_3\,
      I1 => \_inferred__7/i__carry__1_n_3\,
      O => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(0),
      Q => \bipolar_gen.h_end_reg[0]\(0),
      S => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(10),
      Q => \bipolar_gen.h_end_reg[0]\(10),
      R => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(11),
      Q => \bipolar_gen.h_end_reg[0]\(11),
      R => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][12]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(12),
      Q => \bipolar_gen.h_end_reg[0]\(12),
      S => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(13),
      Q => \bipolar_gen.h_end_reg[0]\(13),
      R => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(14),
      Q => \bipolar_gen.h_end_reg[0]\(14),
      R => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(15),
      Q => \bipolar_gen.h_end_reg[0]\(15),
      R => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(16),
      Q => \bipolar_gen.h_end_reg[0]\(16),
      R => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(17),
      Q => \bipolar_gen.h_end_reg[0]\(17),
      R => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(1),
      Q => \bipolar_gen.h_end_reg[0]\(1),
      R => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(2),
      Q => \bipolar_gen.h_end_reg[0]\(2),
      R => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(3),
      Q => \bipolar_gen.h_end_reg[0]\(3),
      S => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(4),
      Q => \bipolar_gen.h_end_reg[0]\(4),
      R => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(5),
      Q => \bipolar_gen.h_end_reg[0]\(5),
      R => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(6),
      Q => \bipolar_gen.h_end_reg[0]\(6),
      R => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(7),
      Q => \bipolar_gen.h_end_reg[0]\(7),
      S => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(8),
      Q => \bipolar_gen.h_end_reg[0]\(8),
      S => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[0][9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(9),
      Q => \bipolar_gen.h_end_reg[0]\(9),
      S => \bipolar_gen.h_end[0][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \mult_gen[1].MULT_MACRO_inst_n_68\,
      Q => \bipolar_gen.h_end_reg[1]\(0),
      S => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__1_n_6\,
      Q => \bipolar_gen.h_end_reg[1]\(10),
      R => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__1_n_5\,
      Q => \bipolar_gen.h_end_reg[1]\(11),
      R => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][12]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__1_n_4\,
      Q => \bipolar_gen.h_end_reg[1]\(12),
      S => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__2_n_7\,
      Q => \bipolar_gen.h_end_reg[1]\(13),
      R => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__2_n_6\,
      Q => \bipolar_gen.h_end_reg[1]\(14),
      R => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__2_n_5\,
      Q => \bipolar_gen.h_end_reg[1]\(15),
      R => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__2_n_4\,
      Q => \bipolar_gen.h_end_reg[1]\(16),
      R => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__3_n_7\,
      Q => \bipolar_gen.h_end_reg[1]\(17),
      R => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry_n_7\,
      Q => \bipolar_gen.h_end_reg[1]\(1),
      R => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry_n_6\,
      Q => \bipolar_gen.h_end_reg[1]\(2),
      R => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry_n_5\,
      Q => \bipolar_gen.h_end_reg[1]\(3),
      S => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry_n_4\,
      Q => \bipolar_gen.h_end_reg[1]\(4),
      R => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__0_n_7\,
      Q => \bipolar_gen.h_end_reg[1]\(5),
      R => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__0_n_6\,
      Q => \bipolar_gen.h_end_reg[1]\(6),
      R => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__0_n_5\,
      Q => \bipolar_gen.h_end_reg[1]\(7),
      S => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__0_n_4\,
      Q => \bipolar_gen.h_end_reg[1]\(8),
      S => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[1][9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__5/i__carry__1_n_7\,
      Q => \bipolar_gen.h_end_reg[1]\(9),
      S => \bipolar_gen.h_end[1][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \mult_gen[2].MULT_MACRO_inst_n_68\,
      Q => \bipolar_gen.h_end_reg[2]\(0),
      S => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__1_n_6\,
      Q => \bipolar_gen.h_end_reg[2]\(10),
      R => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__1_n_5\,
      Q => \bipolar_gen.h_end_reg[2]\(11),
      R => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][12]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__1_n_4\,
      Q => \bipolar_gen.h_end_reg[2]\(12),
      S => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__2_n_7\,
      Q => \bipolar_gen.h_end_reg[2]\(13),
      R => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__2_n_6\,
      Q => \bipolar_gen.h_end_reg[2]\(14),
      R => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__2_n_5\,
      Q => \bipolar_gen.h_end_reg[2]\(15),
      R => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__2_n_4\,
      Q => \bipolar_gen.h_end_reg[2]\(16),
      R => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__3_n_7\,
      Q => \bipolar_gen.h_end_reg[2]\(17),
      R => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry_n_7\,
      Q => \bipolar_gen.h_end_reg[2]\(1),
      R => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry_n_6\,
      Q => \bipolar_gen.h_end_reg[2]\(2),
      R => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry_n_5\,
      Q => \bipolar_gen.h_end_reg[2]\(3),
      S => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry_n_4\,
      Q => \bipolar_gen.h_end_reg[2]\(4),
      R => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__0_n_7\,
      Q => \bipolar_gen.h_end_reg[2]\(5),
      R => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__0_n_6\,
      Q => \bipolar_gen.h_end_reg[2]\(6),
      R => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__0_n_5\,
      Q => \bipolar_gen.h_end_reg[2]\(7),
      S => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__0_n_4\,
      Q => \bipolar_gen.h_end_reg[2]\(8),
      S => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_end_reg[2][9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__8/i__carry__1_n_7\,
      Q => \bipolar_gen.h_end_reg[2]\(9),
      S => \bipolar_gen.h_end[2][17]_i_1_n_0\
    );
\bipolar_gen.h_start[0][12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"3A"
    )
        port map (
      I0 => \bipolar_gen.h_start_reg[0]\(12),
      I1 => \_inferred__0/i__carry__1_n_3\,
      I2 => \pwm_cnt0_carry__1_n_3\,
      O => \bipolar_gen.h_start[0][12]_i_1_n_0\
    );
\bipolar_gen.h_start[0][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \bipolar_gen.h_start_reg[0]\(4),
      I1 => \_inferred__0/i__carry__1_n_3\,
      I2 => \pwm_cnt0_carry__1_n_3\,
      O => \bipolar_gen.h_start[0][4]_i_1_n_0\
    );
\bipolar_gen.h_start[1][12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"3A"
    )
        port map (
      I0 => \bipolar_gen.h_start_reg[1]\(12),
      I1 => \_inferred__4/i__carry__1_n_3\,
      I2 => \pwm_cnt0_carry__1_n_3\,
      O => \bipolar_gen.h_start[1][12]_i_1_n_0\
    );
\bipolar_gen.h_start[1][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \bipolar_gen.h_start_reg[1]\(4),
      I1 => \_inferred__4/i__carry__1_n_3\,
      I2 => \pwm_cnt0_carry__1_n_3\,
      O => \bipolar_gen.h_start[1][4]_i_1_n_0\
    );
\bipolar_gen.h_start[2][12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"3A"
    )
        port map (
      I0 => \bipolar_gen.h_start_reg[2]\(12),
      I1 => \_inferred__7/i__carry__1_n_3\,
      I2 => \pwm_cnt0_carry__1_n_3\,
      O => \bipolar_gen.h_start[2][12]_i_1_n_0\
    );
\bipolar_gen.h_start[2][3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => \pwm_cnt0_carry__1_n_3\,
      I1 => \bipolar_gen.h_start_reg[2]\(3),
      O => \bipolar_gen.h_start[2][3]_i_1_n_0\
    );
\bipolar_gen.h_start[2][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \bipolar_gen.h_start_reg[2]\(4),
      I1 => \_inferred__7/i__carry__1_n_3\,
      I2 => \pwm_cnt0_carry__1_n_3\,
      O => \bipolar_gen.h_start[2][4]_i_1_n_0\
    );
\bipolar_gen.h_start_reg[0][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.h_start[0][12]_i_1_n_0\,
      Q => \bipolar_gen.h_start_reg[0]\(12),
      R => '0'
    );
\bipolar_gen.h_start_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.h_start[0][4]_i_1_n_0\,
      Q => \bipolar_gen.h_start_reg[0]\(4),
      R => '0'
    );
\bipolar_gen.h_start_reg[1][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.h_start[1][12]_i_1_n_0\,
      Q => \bipolar_gen.h_start_reg[1]\(12),
      R => '0'
    );
\bipolar_gen.h_start_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.h_start[1][4]_i_1_n_0\,
      Q => \bipolar_gen.h_start_reg[1]\(4),
      R => '0'
    );
\bipolar_gen.h_start_reg[2][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.h_start[2][12]_i_1_n_0\,
      Q => \bipolar_gen.h_start_reg[2]\(12),
      R => '0'
    );
\bipolar_gen.h_start_reg[2][3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.h_start[2][3]_i_1_n_0\,
      Q => \bipolar_gen.h_start_reg[2]\(3),
      S => \pwm_cnt0_carry__1_n_3\
    );
\bipolar_gen.h_start_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.h_start[2][4]_i_1_n_0\,
      Q => \bipolar_gen.h_start_reg[2]\(4),
      R => '0'
    );
\bipolar_gen.l_end_reg[2][12]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.l_end_reg[2]\(12),
      Q => \bipolar_gen.l_end_reg[2]\(12),
      S => \pwm_cnt0_carry__1_n_3\
    );
\bipolar_gen.l_start_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => p_1_in(0),
      Q => \bipolar_gen.l_start_reg[0]\(0),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__1_n_6\,
      Q => \bipolar_gen.l_start_reg[0]\(10),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__1_n_5\,
      Q => \bipolar_gen.l_start_reg[0]\(11),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__1_n_4\,
      Q => \bipolar_gen.l_start_reg[0]\(12),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__2_n_7\,
      Q => \bipolar_gen.l_start_reg[0]\(13),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__2_n_6\,
      Q => \bipolar_gen.l_start_reg[0]\(14),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__2_n_5\,
      Q => \bipolar_gen.l_start_reg[0]\(15),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__2_n_4\,
      Q => \bipolar_gen.l_start_reg[0]\(16),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__3_n_7\,
      Q => \bipolar_gen.l_start_reg[0]\(17),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry_n_7\,
      Q => \bipolar_gen.l_start_reg[0]\(1),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry_n_6\,
      Q => \bipolar_gen.l_start_reg[0]\(2),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry_n_5\,
      Q => \bipolar_gen.l_start_reg[0]\(3),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry_n_4\,
      Q => \bipolar_gen.l_start_reg[0]\(4),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__0_n_7\,
      Q => \bipolar_gen.l_start_reg[0]\(5),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__0_n_6\,
      Q => \bipolar_gen.l_start_reg[0]\(6),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__0_n_5\,
      Q => \bipolar_gen.l_start_reg[0]\(7),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__0_n_4\,
      Q => \bipolar_gen.l_start_reg[0]\(8),
      R => '0'
    );
\bipolar_gen.l_start_reg[0][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__10/i__carry__1_n_7\,
      Q => \bipolar_gen.l_start_reg[0]\(9),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \mult_gen[1].MULT_MACRO_inst_n_68\,
      Q => \bipolar_gen.l_start_reg[1]\(0),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__1_n_6\,
      Q => \bipolar_gen.l_start_reg[1]\(10),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__1_n_5\,
      Q => \bipolar_gen.l_start_reg[1]\(11),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__1_n_4\,
      Q => \bipolar_gen.l_start_reg[1]\(12),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__2_n_7\,
      Q => \bipolar_gen.l_start_reg[1]\(13),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__2_n_6\,
      Q => \bipolar_gen.l_start_reg[1]\(14),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__2_n_5\,
      Q => \bipolar_gen.l_start_reg[1]\(15),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__2_n_4\,
      Q => \bipolar_gen.l_start_reg[1]\(16),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__3_n_7\,
      Q => \bipolar_gen.l_start_reg[1]\(17),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry_n_7\,
      Q => \bipolar_gen.l_start_reg[1]\(1),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry_n_6\,
      Q => \bipolar_gen.l_start_reg[1]\(2),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry_n_5\,
      Q => \bipolar_gen.l_start_reg[1]\(3),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry_n_4\,
      Q => \bipolar_gen.l_start_reg[1]\(4),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__0_n_7\,
      Q => \bipolar_gen.l_start_reg[1]\(5),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__0_n_6\,
      Q => \bipolar_gen.l_start_reg[1]\(6),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__0_n_5\,
      Q => \bipolar_gen.l_start_reg[1]\(7),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__0_n_4\,
      Q => \bipolar_gen.l_start_reg[1]\(8),
      R => '0'
    );
\bipolar_gen.l_start_reg[1][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__12/i__carry__1_n_7\,
      Q => \bipolar_gen.l_start_reg[1]\(9),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \mult_gen[2].MULT_MACRO_inst_n_68\,
      Q => \bipolar_gen.l_start_reg[2]\(0),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__1_n_6\,
      Q => \bipolar_gen.l_start_reg[2]\(10),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__1_n_5\,
      Q => \bipolar_gen.l_start_reg[2]\(11),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__1_n_4\,
      Q => \bipolar_gen.l_start_reg[2]\(12),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__2_n_7\,
      Q => \bipolar_gen.l_start_reg[2]\(13),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__2_n_6\,
      Q => \bipolar_gen.l_start_reg[2]\(14),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__2_n_5\,
      Q => \bipolar_gen.l_start_reg[2]\(15),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__2_n_4\,
      Q => \bipolar_gen.l_start_reg[2]\(16),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__3_n_7\,
      Q => \bipolar_gen.l_start_reg[2]\(17),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry_n_7\,
      Q => \bipolar_gen.l_start_reg[2]\(1),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry_n_6\,
      Q => \bipolar_gen.l_start_reg[2]\(2),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry_n_5\,
      Q => \bipolar_gen.l_start_reg[2]\(3),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry_n_4\,
      Q => \bipolar_gen.l_start_reg[2]\(4),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__0_n_7\,
      Q => \bipolar_gen.l_start_reg[2]\(5),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__0_n_6\,
      Q => \bipolar_gen.l_start_reg[2]\(6),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__0_n_5\,
      Q => \bipolar_gen.l_start_reg[2]\(7),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__0_n_4\,
      Q => \bipolar_gen.l_start_reg[2]\(8),
      R => '0'
    );
\bipolar_gen.l_start_reg[2][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => \pwm_cnt0_carry__1_n_3\,
      D => \_inferred__14/i__carry__1_n_7\,
      Q => \bipolar_gen.l_start_reg[2]\(9),
      R => '0'
    );
\bipolar_gen.pwm_h_drv[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000000E"
    )
        port map (
      I0 => \^pwm_h\(0),
      I1 => \_inferred__3/i__carry__0_n_2\,
      I2 => p_0_out(0),
      I3 => \_inferred__2/i__carry__0_n_2\,
      I4 => \_carry__0_n_2\,
      O => \bipolar_gen.pwm_h_drv[0]_i_1_n_0\
    );
\bipolar_gen.pwm_h_drv[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000000E"
    )
        port map (
      I0 => \^pwm_h\(1),
      I1 => p_2_in,
      I2 => p_0_out(1),
      I3 => \_inferred__6/i__carry__0_n_2\,
      I4 => \_carry__0_n_2\,
      O => \bipolar_gen.pwm_h_drv[1]_i_1_n_0\
    );
\bipolar_gen.pwm_h_drv[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000000E"
    )
        port map (
      I0 => \^pwm_h\(2),
      I1 => p_0_in_3,
      I2 => p_0_out(2),
      I3 => \_inferred__9/i__carry__0_n_2\,
      I4 => \_carry__0_n_2\,
      O => \bipolar_gen.pwm_h_drv[2]_i_1_n_0\
    );
\bipolar_gen.pwm_h_drv_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.pwm_h_drv[0]_i_1_n_0\,
      Q => \^pwm_h\(0),
      R => '0'
    );
\bipolar_gen.pwm_h_drv_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.pwm_h_drv[1]_i_1_n_0\,
      Q => \^pwm_h\(1),
      R => '0'
    );
\bipolar_gen.pwm_h_drv_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.pwm_h_drv[2]_i_1_n_0\,
      Q => \^pwm_h\(2),
      R => '0'
    );
\bipolar_gen.pwm_l_drv[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF02"
    )
        port map (
      I0 => \^pwm_l\(0),
      I1 => \_inferred__2/i__carry__0_n_2\,
      I2 => \_inferred__3/i__carry__0_n_2\,
      I3 => p_0_out(0),
      I4 => \_carry__0_n_2\,
      O => \bipolar_gen.pwm_l_drv[0]_i_1_n_0\
    );
\bipolar_gen.pwm_l_drv[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF02"
    )
        port map (
      I0 => \^pwm_l\(1),
      I1 => \_inferred__6/i__carry__0_n_2\,
      I2 => p_2_in,
      I3 => p_0_out(1),
      I4 => \_carry__0_n_2\,
      O => \bipolar_gen.pwm_l_drv[1]_i_1_n_0\
    );
\bipolar_gen.pwm_l_drv[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF02"
    )
        port map (
      I0 => \^pwm_l\(2),
      I1 => \_inferred__9/i__carry__0_n_2\,
      I2 => p_0_in_3,
      I3 => p_0_out(2),
      I4 => \_carry__0_n_2\,
      O => \bipolar_gen.pwm_l_drv[2]_i_1_n_0\
    );
\bipolar_gen.pwm_l_drv_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.pwm_l_drv[0]_i_1_n_0\,
      Q => \^pwm_l\(0),
      R => '0'
    );
\bipolar_gen.pwm_l_drv_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.pwm_l_drv[1]_i_1_n_0\,
      Q => \^pwm_l\(1),
      R => '0'
    );
\bipolar_gen.pwm_l_drv_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \bipolar_gen.pwm_l_drv[2]_i_1_n_0\,
      Q => \^pwm_l\(2),
      R => '0'
    );
\i__carry__0_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(15),
      I1 => \bipolar_gen.h_end_reg[0]\(15),
      I2 => \bipolar_gen.h_end_reg[0]\(17),
      I3 => pwm_cnt_reg(17),
      I4 => \bipolar_gen.h_end_reg[0]\(16),
      I5 => pwm_cnt_reg(16),
      O => \i__carry__0_i_1__0_n_0\
    );
\i__carry__0_i_1__11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => pwm_cnt_reg(17),
      I1 => pwm_cnt_reg(16),
      I2 => pwm_cnt_reg(15),
      O => \i__carry__0_i_1__11_n_0\
    );
\i__carry__0_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(15),
      I1 => \bipolar_gen.h_end_reg[1]\(15),
      I2 => \bipolar_gen.h_end_reg[1]\(17),
      I3 => pwm_cnt_reg(17),
      I4 => \bipolar_gen.h_end_reg[1]\(16),
      I5 => pwm_cnt_reg(16),
      O => \i__carry__0_i_1__2_n_0\
    );
\i__carry__0_i_1__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(15),
      I1 => \bipolar_gen.h_end_reg[2]\(15),
      I2 => \bipolar_gen.h_end_reg[2]\(17),
      I3 => pwm_cnt_reg(17),
      I4 => \bipolar_gen.h_end_reg[2]\(16),
      I5 => pwm_cnt_reg(16),
      O => \i__carry__0_i_1__4_n_0\
    );
\i__carry__0_i_1__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(15),
      I1 => \bipolar_gen.l_start_reg[0]\(15),
      I2 => \bipolar_gen.l_start_reg[0]\(17),
      I3 => pwm_cnt_reg(17),
      I4 => \bipolar_gen.l_start_reg[0]\(16),
      I5 => pwm_cnt_reg(16),
      O => \i__carry__0_i_1__5_n_0\
    );
\i__carry__0_i_1__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(15),
      I1 => \bipolar_gen.l_start_reg[1]\(15),
      I2 => \bipolar_gen.l_start_reg[1]\(17),
      I3 => pwm_cnt_reg(17),
      I4 => \bipolar_gen.l_start_reg[1]\(16),
      I5 => pwm_cnt_reg(16),
      O => \i__carry__0_i_1__6_n_0\
    );
\i__carry__0_i_1__7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(15),
      I1 => \bipolar_gen.l_start_reg[2]\(15),
      I2 => \bipolar_gen.l_start_reg[2]\(17),
      I3 => pwm_cnt_reg(17),
      I4 => \bipolar_gen.l_start_reg[2]\(16),
      I5 => pwm_cnt_reg(16),
      O => \i__carry__0_i_1__7_n_0\
    );
\i__carry__0_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(12),
      I1 => \bipolar_gen.h_end_reg[0]\(12),
      I2 => \bipolar_gen.h_end_reg[0]\(14),
      I3 => pwm_cnt_reg(14),
      I4 => \bipolar_gen.h_end_reg[0]\(13),
      I5 => pwm_cnt_reg(13),
      O => \i__carry__0_i_2__0_n_0\
    );
\i__carry__0_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => pwm_cnt_reg(12),
      I1 => \bipolar_gen.h_start_reg[0]\(12),
      I2 => pwm_cnt_reg(14),
      I3 => pwm_cnt_reg(13),
      O => \i__carry__0_i_2__1_n_0\
    );
\i__carry__0_i_2__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(12),
      I1 => \bipolar_gen.h_end_reg[1]\(12),
      I2 => \bipolar_gen.h_end_reg[1]\(14),
      I3 => pwm_cnt_reg(14),
      I4 => \bipolar_gen.h_end_reg[1]\(13),
      I5 => pwm_cnt_reg(13),
      O => \i__carry__0_i_2__3_n_0\
    );
\i__carry__0_i_2__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(12),
      I1 => \bipolar_gen.h_end_reg[2]\(12),
      I2 => \bipolar_gen.h_end_reg[2]\(14),
      I3 => pwm_cnt_reg(14),
      I4 => \bipolar_gen.h_end_reg[2]\(13),
      I5 => pwm_cnt_reg(13),
      O => \i__carry__0_i_2__5_n_0\
    );
\i__carry__0_i_2__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(12),
      I1 => \bipolar_gen.l_start_reg[0]\(12),
      I2 => \bipolar_gen.l_start_reg[0]\(14),
      I3 => pwm_cnt_reg(14),
      I4 => \bipolar_gen.l_start_reg[0]\(13),
      I5 => pwm_cnt_reg(13),
      O => \i__carry__0_i_2__6_n_0\
    );
\i__carry__0_i_2__7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(12),
      I1 => \bipolar_gen.l_start_reg[1]\(12),
      I2 => \bipolar_gen.l_start_reg[1]\(14),
      I3 => pwm_cnt_reg(14),
      I4 => \bipolar_gen.l_start_reg[1]\(13),
      I5 => pwm_cnt_reg(13),
      O => \i__carry__0_i_2__7_n_0\
    );
\i__carry__0_i_2__8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(12),
      I1 => \bipolar_gen.l_start_reg[2]\(12),
      I2 => \bipolar_gen.l_start_reg[2]\(14),
      I3 => pwm_cnt_reg(14),
      I4 => \bipolar_gen.l_start_reg[2]\(13),
      I5 => pwm_cnt_reg(13),
      O => \i__carry__0_i_2__8_n_0\
    );
\i__carry_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(9),
      I1 => \bipolar_gen.h_end_reg[0]\(9),
      I2 => \bipolar_gen.h_end_reg[0]\(11),
      I3 => pwm_cnt_reg(11),
      I4 => \bipolar_gen.h_end_reg[0]\(10),
      I5 => pwm_cnt_reg(10),
      O => \i__carry_i_1__0_n_0\
    );
\i__carry_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => pwm_cnt_reg(9),
      I1 => \bipolar_gen.h_start_reg[0]\(12),
      I2 => pwm_cnt_reg(11),
      I3 => pwm_cnt_reg(10),
      O => \i__carry_i_1__1_n_0\
    );
\i__carry_i_1__11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(9),
      I1 => \bipolar_gen.l_start_reg[2]\(9),
      I2 => \bipolar_gen.l_start_reg[2]\(11),
      I3 => pwm_cnt_reg(11),
      I4 => \bipolar_gen.l_start_reg[2]\(10),
      I5 => pwm_cnt_reg(10),
      O => \i__carry_i_1__11_n_0\
    );
\i__carry_i_1__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(9),
      I1 => \bipolar_gen.h_end_reg[1]\(9),
      I2 => \bipolar_gen.h_end_reg[1]\(11),
      I3 => pwm_cnt_reg(11),
      I4 => \bipolar_gen.h_end_reg[1]\(10),
      I5 => pwm_cnt_reg(10),
      O => \i__carry_i_1__3_n_0\
    );
\i__carry_i_1__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(9),
      I1 => \bipolar_gen.h_end_reg[2]\(9),
      I2 => \bipolar_gen.h_end_reg[2]\(11),
      I3 => pwm_cnt_reg(11),
      I4 => \bipolar_gen.h_end_reg[2]\(10),
      I5 => pwm_cnt_reg(10),
      O => \i__carry_i_1__5_n_0\
    );
\i__carry_i_1__7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(9),
      I1 => \bipolar_gen.l_start_reg[0]\(9),
      I2 => \bipolar_gen.l_start_reg[0]\(11),
      I3 => pwm_cnt_reg(11),
      I4 => \bipolar_gen.l_start_reg[0]\(10),
      I5 => pwm_cnt_reg(10),
      O => \i__carry_i_1__7_n_0\
    );
\i__carry_i_1__9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(9),
      I1 => \bipolar_gen.l_start_reg[1]\(9),
      I2 => \bipolar_gen.l_start_reg[1]\(11),
      I3 => pwm_cnt_reg(11),
      I4 => \bipolar_gen.l_start_reg[1]\(10),
      I5 => pwm_cnt_reg(10),
      O => \i__carry_i_1__9_n_0\
    );
\i__carry_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(6),
      I1 => \bipolar_gen.h_end_reg[0]\(6),
      I2 => \bipolar_gen.h_end_reg[0]\(8),
      I3 => pwm_cnt_reg(8),
      I4 => \bipolar_gen.h_end_reg[0]\(7),
      I5 => pwm_cnt_reg(7),
      O => \i__carry_i_2__0_n_0\
    );
\i__carry_i_2__11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0081"
    )
        port map (
      I0 => \bipolar_gen.h_start_reg[0]\(12),
      I1 => pwm_cnt_reg(8),
      I2 => pwm_cnt_reg(7),
      I3 => pwm_cnt_reg(6),
      O => \i__carry_i_2__11_n_0\
    );
\i__carry_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(6),
      I1 => \bipolar_gen.h_end_reg[1]\(6),
      I2 => \bipolar_gen.h_end_reg[1]\(8),
      I3 => pwm_cnt_reg(8),
      I4 => \bipolar_gen.h_end_reg[1]\(7),
      I5 => pwm_cnt_reg(7),
      O => \i__carry_i_2__2_n_0\
    );
\i__carry_i_2__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(6),
      I1 => \bipolar_gen.h_end_reg[2]\(6),
      I2 => \bipolar_gen.h_end_reg[2]\(8),
      I3 => pwm_cnt_reg(8),
      I4 => \bipolar_gen.h_end_reg[2]\(7),
      I5 => pwm_cnt_reg(7),
      O => \i__carry_i_2__4_n_0\
    );
\i__carry_i_2__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(6),
      I1 => \bipolar_gen.l_start_reg[0]\(6),
      I2 => \bipolar_gen.l_start_reg[0]\(8),
      I3 => pwm_cnt_reg(8),
      I4 => \bipolar_gen.l_start_reg[0]\(7),
      I5 => pwm_cnt_reg(7),
      O => \i__carry_i_2__5_n_0\
    );
\i__carry_i_2__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(6),
      I1 => \bipolar_gen.l_start_reg[1]\(6),
      I2 => \bipolar_gen.l_start_reg[1]\(8),
      I3 => pwm_cnt_reg(8),
      I4 => \bipolar_gen.l_start_reg[1]\(7),
      I5 => pwm_cnt_reg(7),
      O => \i__carry_i_2__6_n_0\
    );
\i__carry_i_2__7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(6),
      I1 => \bipolar_gen.l_start_reg[2]\(6),
      I2 => \bipolar_gen.l_start_reg[2]\(8),
      I3 => pwm_cnt_reg(8),
      I4 => \bipolar_gen.l_start_reg[2]\(7),
      I5 => pwm_cnt_reg(7),
      O => \i__carry_i_2__7_n_0\
    );
\i__carry_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      I1 => \bipolar_gen.h_end_reg[0]\(3),
      I2 => \bipolar_gen.h_end_reg[0]\(5),
      I3 => pwm_cnt_reg(5),
      I4 => \bipolar_gen.h_end_reg[0]\(4),
      I5 => pwm_cnt_reg(4),
      O => \i__carry_i_3__0_n_0\
    );
\i__carry_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000009"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      I1 => \bipolar_gen.h_start_reg[2]\(3),
      I2 => pwm_cnt_reg(5),
      I3 => \bipolar_gen.h_start_reg[0]\(4),
      I4 => pwm_cnt_reg(4),
      O => \i__carry_i_3__1_n_0\
    );
\i__carry_i_3__3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      I1 => \bipolar_gen.h_end_reg[1]\(3),
      I2 => \bipolar_gen.h_end_reg[1]\(5),
      I3 => pwm_cnt_reg(5),
      I4 => \bipolar_gen.h_end_reg[1]\(4),
      I5 => pwm_cnt_reg(4),
      O => \i__carry_i_3__3_n_0\
    );
\i__carry_i_3__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      I1 => \bipolar_gen.h_end_reg[2]\(3),
      I2 => \bipolar_gen.h_end_reg[2]\(5),
      I3 => pwm_cnt_reg(5),
      I4 => \bipolar_gen.h_end_reg[2]\(4),
      I5 => pwm_cnt_reg(4),
      O => \i__carry_i_3__5_n_0\
    );
\i__carry_i_3__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      I1 => \bipolar_gen.l_start_reg[0]\(3),
      I2 => \bipolar_gen.l_start_reg[0]\(5),
      I3 => pwm_cnt_reg(5),
      I4 => \bipolar_gen.l_start_reg[0]\(4),
      I5 => pwm_cnt_reg(4),
      O => \i__carry_i_3__6_n_0\
    );
\i__carry_i_3__7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      I1 => \bipolar_gen.l_start_reg[1]\(3),
      I2 => \bipolar_gen.l_start_reg[1]\(5),
      I3 => pwm_cnt_reg(5),
      I4 => \bipolar_gen.l_start_reg[1]\(4),
      I5 => pwm_cnt_reg(4),
      O => \i__carry_i_3__7_n_0\
    );
\i__carry_i_3__8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      I1 => \bipolar_gen.l_start_reg[2]\(3),
      I2 => \bipolar_gen.l_start_reg[2]\(5),
      I3 => pwm_cnt_reg(5),
      I4 => \bipolar_gen.l_start_reg[2]\(4),
      I5 => pwm_cnt_reg(4),
      O => \i__carry_i_3__8_n_0\
    );
\i__carry_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => \bipolar_gen.h_end_reg[0]\(0),
      I2 => \bipolar_gen.h_end_reg[0]\(2),
      I3 => pwm_cnt_reg(2),
      I4 => \bipolar_gen.h_end_reg[0]\(1),
      I5 => pwm_cnt_reg(1),
      O => \i__carry_i_4__0_n_0\
    );
\i__carry_i_4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => \bipolar_gen.h_end_reg[1]\(0),
      I2 => \bipolar_gen.h_end_reg[1]\(2),
      I3 => pwm_cnt_reg(2),
      I4 => \bipolar_gen.h_end_reg[1]\(1),
      I5 => pwm_cnt_reg(1),
      O => \i__carry_i_4__2_n_0\
    );
\i__carry_i_4__4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => \bipolar_gen.h_end_reg[2]\(0),
      I2 => \bipolar_gen.h_end_reg[2]\(2),
      I3 => pwm_cnt_reg(2),
      I4 => \bipolar_gen.h_end_reg[2]\(1),
      I5 => pwm_cnt_reg(1),
      O => \i__carry_i_4__4_n_0\
    );
\i__carry_i_4__5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => \bipolar_gen.l_start_reg[0]\(0),
      I2 => \bipolar_gen.l_start_reg[0]\(2),
      I3 => pwm_cnt_reg(2),
      I4 => \bipolar_gen.l_start_reg[0]\(1),
      I5 => pwm_cnt_reg(1),
      O => \i__carry_i_4__5_n_0\
    );
\i__carry_i_4__6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => \bipolar_gen.l_start_reg[1]\(0),
      I2 => \bipolar_gen.l_start_reg[1]\(2),
      I3 => pwm_cnt_reg(2),
      I4 => \bipolar_gen.l_start_reg[1]\(1),
      I5 => pwm_cnt_reg(1),
      O => \i__carry_i_4__6_n_0\
    );
\i__carry_i_4__7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => \bipolar_gen.l_start_reg[2]\(0),
      I2 => \bipolar_gen.l_start_reg[2]\(2),
      I3 => pwm_cnt_reg(2),
      I4 => \bipolar_gen.l_start_reg[2]\(1),
      I5 => pwm_cnt_reg(1),
      O => \i__carry_i_4__7_n_0\
    );
\i__carry_i_4__8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => \bipolar_gen.h_start_reg[2]\(3),
      I2 => pwm_cnt_reg(2),
      I3 => pwm_cnt_reg(1),
      O => \i__carry_i_4__8_n_0\
    );
\mult_a[0][0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(0),
      O => p_0_in(0)
    );
\mult_a[0][12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(12),
      O => \mult_a[0][12]_i_2_n_0\
    );
\mult_a[0][12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(11),
      O => \mult_a[0][12]_i_3_n_0\
    );
\mult_a[0][12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(10),
      O => \mult_a[0][12]_i_4_n_0\
    );
\mult_a[0][12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(9),
      O => \mult_a[0][12]_i_5_n_0\
    );
\mult_a[0][17]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(15),
      O => \mult_a[0][17]_i_2_n_0\
    );
\mult_a[0][17]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(14),
      O => \mult_a[0][17]_i_3_n_0\
    );
\mult_a[0][17]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(13),
      O => \mult_a[0][17]_i_4_n_0\
    );
\mult_a[0][4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(4),
      O => \mult_a[0][4]_i_2_n_0\
    );
\mult_a[0][4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(3),
      O => \mult_a[0][4]_i_3_n_0\
    );
\mult_a[0][4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(2),
      O => \mult_a[0][4]_i_4_n_0\
    );
\mult_a[0][4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(1),
      O => \mult_a[0][4]_i_5_n_0\
    );
\mult_a[0][8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(8),
      O => \mult_a[0][8]_i_2_n_0\
    );
\mult_a[0][8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(7),
      O => \mult_a[0][8]_i_3_n_0\
    );
\mult_a[0][8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(6),
      O => \mult_a[0][8]_i_4_n_0\
    );
\mult_a[0][8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[0]\(5),
      O => \mult_a[0][8]_i_5_n_0\
    );
\mult_a[1][0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(0),
      O => \mult_a[1][0]_i_1_n_0\
    );
\mult_a[1][12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(12),
      O => \mult_a[1][12]_i_2_n_0\
    );
\mult_a[1][12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(11),
      O => \mult_a[1][12]_i_3_n_0\
    );
\mult_a[1][12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(10),
      O => \mult_a[1][12]_i_4_n_0\
    );
\mult_a[1][12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(9),
      O => \mult_a[1][12]_i_5_n_0\
    );
\mult_a[1][17]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(15),
      O => \mult_a[1][17]_i_2_n_0\
    );
\mult_a[1][17]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(14),
      O => \mult_a[1][17]_i_3_n_0\
    );
\mult_a[1][17]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(13),
      O => \mult_a[1][17]_i_4_n_0\
    );
\mult_a[1][4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(4),
      O => \mult_a[1][4]_i_2_n_0\
    );
\mult_a[1][4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(3),
      O => \mult_a[1][4]_i_3_n_0\
    );
\mult_a[1][4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(2),
      O => \mult_a[1][4]_i_4_n_0\
    );
\mult_a[1][4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(1),
      O => \mult_a[1][4]_i_5_n_0\
    );
\mult_a[1][8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(8),
      O => \mult_a[1][8]_i_2_n_0\
    );
\mult_a[1][8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(7),
      O => \mult_a[1][8]_i_3_n_0\
    );
\mult_a[1][8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(6),
      O => \mult_a[1][8]_i_4_n_0\
    );
\mult_a[1][8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[1]\(5),
      O => \mult_a[1][8]_i_5_n_0\
    );
\mult_a[2][0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(0),
      O => \mult_a[2][0]_i_1_n_0\
    );
\mult_a[2][12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(12),
      O => \mult_a[2][12]_i_2_n_0\
    );
\mult_a[2][12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(11),
      O => \mult_a[2][12]_i_3_n_0\
    );
\mult_a[2][12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(10),
      O => \mult_a[2][12]_i_4_n_0\
    );
\mult_a[2][12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(9),
      O => \mult_a[2][12]_i_5_n_0\
    );
\mult_a[2][17]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(15),
      O => \mult_a[2][17]_i_2_n_0\
    );
\mult_a[2][17]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(14),
      O => \mult_a[2][17]_i_3_n_0\
    );
\mult_a[2][17]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(13),
      O => \mult_a[2][17]_i_4_n_0\
    );
\mult_a[2][4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(4),
      O => \mult_a[2][4]_i_2_n_0\
    );
\mult_a[2][4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(3),
      O => \mult_a[2][4]_i_3_n_0\
    );
\mult_a[2][4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(2),
      O => \mult_a[2][4]_i_4_n_0\
    );
\mult_a[2][4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(1),
      O => \mult_a[2][4]_i_5_n_0\
    );
\mult_a[2][8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(8),
      O => \mult_a[2][8]_i_2_n_0\
    );
\mult_a[2][8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(7),
      O => \mult_a[2][8]_i_3_n_0\
    );
\mult_a[2][8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(6),
      O => \mult_a[2][8]_i_4_n_0\
    );
\mult_a[2][8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \parallel_in_gen.in_data_s_reg[2]\(5),
      O => \mult_a[2][8]_i_5_n_0\
    );
\mult_a_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(0),
      Q => \mult_a_reg_n_0_[0][0]\,
      R => '0'
    );
\mult_a_reg[0][10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(10),
      Q => \mult_a_reg_n_0_[0][10]\,
      R => '0'
    );
\mult_a_reg[0][11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(11),
      Q => \mult_a_reg_n_0_[0][11]\,
      R => '0'
    );
\mult_a_reg[0][12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(12),
      Q => \mult_a_reg_n_0_[0][12]\,
      R => '0'
    );
\mult_a_reg[0][12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mult_a_reg[0][8]_i_1_n_0\,
      CO(3) => \mult_a_reg[0][12]_i_1_n_0\,
      CO(2) => \mult_a_reg[0][12]_i_1_n_1\,
      CO(1) => \mult_a_reg[0][12]_i_1_n_2\,
      CO(0) => \mult_a_reg[0][12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \parallel_in_gen.in_data_s_reg[0]\(12 downto 9),
      O(3 downto 0) => p_0_in(12 downto 9),
      S(3) => \mult_a[0][12]_i_2_n_0\,
      S(2) => \mult_a[0][12]_i_3_n_0\,
      S(1) => \mult_a[0][12]_i_4_n_0\,
      S(0) => \mult_a[0][12]_i_5_n_0\
    );
\mult_a_reg[0][13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(13),
      Q => \mult_a_reg_n_0_[0][13]\,
      R => '0'
    );
\mult_a_reg[0][14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(14),
      Q => \mult_a_reg_n_0_[0][14]\,
      R => '0'
    );
\mult_a_reg[0][15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(15),
      Q => \mult_a_reg_n_0_[0][15]\,
      R => '0'
    );
\mult_a_reg[0][17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(17),
      Q => \mult_a_reg_n_0_[0][17]\,
      R => '0'
    );
\mult_a_reg[0][17]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mult_a_reg[0][12]_i_1_n_0\,
      CO(3) => \NLW_mult_a_reg[0][17]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \mult_a_reg[0][17]_i_1_n_1\,
      CO(1) => \mult_a_reg[0][17]_i_1_n_2\,
      CO(0) => \mult_a_reg[0][17]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"01",
      DI(1 downto 0) => \parallel_in_gen.in_data_s_reg[0]\(14 downto 13),
      O(3) => p_0_in(17),
      O(2 downto 0) => p_0_in(15 downto 13),
      S(3) => '1',
      S(2) => \mult_a[0][17]_i_2_n_0\,
      S(1) => \mult_a[0][17]_i_3_n_0\,
      S(0) => \mult_a[0][17]_i_4_n_0\
    );
\mult_a_reg[0][1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(1),
      Q => \mult_a_reg_n_0_[0][1]\,
      R => '0'
    );
\mult_a_reg[0][2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(2),
      Q => \mult_a_reg_n_0_[0][2]\,
      R => '0'
    );
\mult_a_reg[0][3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(3),
      Q => \mult_a_reg_n_0_[0][3]\,
      R => '0'
    );
\mult_a_reg[0][4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(4),
      Q => \mult_a_reg_n_0_[0][4]\,
      R => '0'
    );
\mult_a_reg[0][4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \mult_a_reg[0][4]_i_1_n_0\,
      CO(2) => \mult_a_reg[0][4]_i_1_n_1\,
      CO(1) => \mult_a_reg[0][4]_i_1_n_2\,
      CO(0) => \mult_a_reg[0][4]_i_1_n_3\,
      CYINIT => \parallel_in_gen.in_data_s_reg[0]\(0),
      DI(3 downto 0) => \parallel_in_gen.in_data_s_reg[0]\(4 downto 1),
      O(3 downto 0) => p_0_in(4 downto 1),
      S(3) => \mult_a[0][4]_i_2_n_0\,
      S(2) => \mult_a[0][4]_i_3_n_0\,
      S(1) => \mult_a[0][4]_i_4_n_0\,
      S(0) => \mult_a[0][4]_i_5_n_0\
    );
\mult_a_reg[0][5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(5),
      Q => \mult_a_reg_n_0_[0][5]\,
      R => '0'
    );
\mult_a_reg[0][6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(6),
      Q => \mult_a_reg_n_0_[0][6]\,
      R => '0'
    );
\mult_a_reg[0][7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(7),
      Q => \mult_a_reg_n_0_[0][7]\,
      R => '0'
    );
\mult_a_reg[0][8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(8),
      Q => \mult_a_reg_n_0_[0][8]\,
      R => '0'
    );
\mult_a_reg[0][8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mult_a_reg[0][4]_i_1_n_0\,
      CO(3) => \mult_a_reg[0][8]_i_1_n_0\,
      CO(2) => \mult_a_reg[0][8]_i_1_n_1\,
      CO(1) => \mult_a_reg[0][8]_i_1_n_2\,
      CO(0) => \mult_a_reg[0][8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \parallel_in_gen.in_data_s_reg[0]\(8 downto 5),
      O(3 downto 0) => p_0_in(8 downto 5),
      S(3) => \mult_a[0][8]_i_2_n_0\,
      S(2) => \mult_a[0][8]_i_3_n_0\,
      S(1) => \mult_a[0][8]_i_4_n_0\,
      S(0) => \mult_a[0][8]_i_5_n_0\
    );
\mult_a_reg[0][9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => p_0_in(9),
      Q => \mult_a_reg_n_0_[0][9]\,
      R => '0'
    );
\mult_a_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a[1][0]_i_1_n_0\,
      Q => \mult_a_reg_n_0_[1][0]\,
      R => '0'
    );
\mult_a_reg[1][10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][12]_i_1_n_6\,
      Q => \mult_a_reg_n_0_[1][10]\,
      R => '0'
    );
\mult_a_reg[1][11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][12]_i_1_n_5\,
      Q => \mult_a_reg_n_0_[1][11]\,
      R => '0'
    );
\mult_a_reg[1][12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][12]_i_1_n_4\,
      Q => \mult_a_reg_n_0_[1][12]\,
      R => '0'
    );
\mult_a_reg[1][12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mult_a_reg[1][8]_i_1_n_0\,
      CO(3) => \mult_a_reg[1][12]_i_1_n_0\,
      CO(2) => \mult_a_reg[1][12]_i_1_n_1\,
      CO(1) => \mult_a_reg[1][12]_i_1_n_2\,
      CO(0) => \mult_a_reg[1][12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \parallel_in_gen.in_data_s_reg[1]\(12 downto 9),
      O(3) => \mult_a_reg[1][12]_i_1_n_4\,
      O(2) => \mult_a_reg[1][12]_i_1_n_5\,
      O(1) => \mult_a_reg[1][12]_i_1_n_6\,
      O(0) => \mult_a_reg[1][12]_i_1_n_7\,
      S(3) => \mult_a[1][12]_i_2_n_0\,
      S(2) => \mult_a[1][12]_i_3_n_0\,
      S(1) => \mult_a[1][12]_i_4_n_0\,
      S(0) => \mult_a[1][12]_i_5_n_0\
    );
\mult_a_reg[1][13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][17]_i_1_n_7\,
      Q => \mult_a_reg_n_0_[1][13]\,
      R => '0'
    );
\mult_a_reg[1][14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][17]_i_1_n_6\,
      Q => \mult_a_reg_n_0_[1][14]\,
      R => '0'
    );
\mult_a_reg[1][15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][17]_i_1_n_5\,
      Q => \mult_a_reg_n_0_[1][15]\,
      R => '0'
    );
\mult_a_reg[1][17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][17]_i_1_n_4\,
      Q => \mult_a_reg_n_0_[1][17]\,
      R => '0'
    );
\mult_a_reg[1][17]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mult_a_reg[1][12]_i_1_n_0\,
      CO(3) => \NLW_mult_a_reg[1][17]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \mult_a_reg[1][17]_i_1_n_1\,
      CO(1) => \mult_a_reg[1][17]_i_1_n_2\,
      CO(0) => \mult_a_reg[1][17]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"01",
      DI(1 downto 0) => \parallel_in_gen.in_data_s_reg[1]\(14 downto 13),
      O(3) => \mult_a_reg[1][17]_i_1_n_4\,
      O(2) => \mult_a_reg[1][17]_i_1_n_5\,
      O(1) => \mult_a_reg[1][17]_i_1_n_6\,
      O(0) => \mult_a_reg[1][17]_i_1_n_7\,
      S(3) => '1',
      S(2) => \mult_a[1][17]_i_2_n_0\,
      S(1) => \mult_a[1][17]_i_3_n_0\,
      S(0) => \mult_a[1][17]_i_4_n_0\
    );
\mult_a_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][4]_i_1_n_7\,
      Q => \mult_a_reg_n_0_[1][1]\,
      R => '0'
    );
\mult_a_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][4]_i_1_n_6\,
      Q => \mult_a_reg_n_0_[1][2]\,
      R => '0'
    );
\mult_a_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][4]_i_1_n_5\,
      Q => \mult_a_reg_n_0_[1][3]\,
      R => '0'
    );
\mult_a_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][4]_i_1_n_4\,
      Q => \mult_a_reg_n_0_[1][4]\,
      R => '0'
    );
\mult_a_reg[1][4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \mult_a_reg[1][4]_i_1_n_0\,
      CO(2) => \mult_a_reg[1][4]_i_1_n_1\,
      CO(1) => \mult_a_reg[1][4]_i_1_n_2\,
      CO(0) => \mult_a_reg[1][4]_i_1_n_3\,
      CYINIT => \parallel_in_gen.in_data_s_reg[1]\(0),
      DI(3 downto 0) => \parallel_in_gen.in_data_s_reg[1]\(4 downto 1),
      O(3) => \mult_a_reg[1][4]_i_1_n_4\,
      O(2) => \mult_a_reg[1][4]_i_1_n_5\,
      O(1) => \mult_a_reg[1][4]_i_1_n_6\,
      O(0) => \mult_a_reg[1][4]_i_1_n_7\,
      S(3) => \mult_a[1][4]_i_2_n_0\,
      S(2) => \mult_a[1][4]_i_3_n_0\,
      S(1) => \mult_a[1][4]_i_4_n_0\,
      S(0) => \mult_a[1][4]_i_5_n_0\
    );
\mult_a_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][8]_i_1_n_7\,
      Q => \mult_a_reg_n_0_[1][5]\,
      R => '0'
    );
\mult_a_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][8]_i_1_n_6\,
      Q => \mult_a_reg_n_0_[1][6]\,
      R => '0'
    );
\mult_a_reg[1][7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][8]_i_1_n_5\,
      Q => \mult_a_reg_n_0_[1][7]\,
      R => '0'
    );
\mult_a_reg[1][8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][8]_i_1_n_4\,
      Q => \mult_a_reg_n_0_[1][8]\,
      R => '0'
    );
\mult_a_reg[1][8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mult_a_reg[1][4]_i_1_n_0\,
      CO(3) => \mult_a_reg[1][8]_i_1_n_0\,
      CO(2) => \mult_a_reg[1][8]_i_1_n_1\,
      CO(1) => \mult_a_reg[1][8]_i_1_n_2\,
      CO(0) => \mult_a_reg[1][8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \parallel_in_gen.in_data_s_reg[1]\(8 downto 5),
      O(3) => \mult_a_reg[1][8]_i_1_n_4\,
      O(2) => \mult_a_reg[1][8]_i_1_n_5\,
      O(1) => \mult_a_reg[1][8]_i_1_n_6\,
      O(0) => \mult_a_reg[1][8]_i_1_n_7\,
      S(3) => \mult_a[1][8]_i_2_n_0\,
      S(2) => \mult_a[1][8]_i_3_n_0\,
      S(1) => \mult_a[1][8]_i_4_n_0\,
      S(0) => \mult_a[1][8]_i_5_n_0\
    );
\mult_a_reg[1][9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[1][12]_i_1_n_7\,
      Q => \mult_a_reg_n_0_[1][9]\,
      R => '0'
    );
\mult_a_reg[2][0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a[2][0]_i_1_n_0\,
      Q => \mult_a_reg_n_0_[2][0]\,
      R => '0'
    );
\mult_a_reg[2][10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][12]_i_1_n_6\,
      Q => \mult_a_reg_n_0_[2][10]\,
      R => '0'
    );
\mult_a_reg[2][11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][12]_i_1_n_5\,
      Q => \mult_a_reg_n_0_[2][11]\,
      R => '0'
    );
\mult_a_reg[2][12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][12]_i_1_n_4\,
      Q => \mult_a_reg_n_0_[2][12]\,
      R => '0'
    );
\mult_a_reg[2][12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mult_a_reg[2][8]_i_1_n_0\,
      CO(3) => \mult_a_reg[2][12]_i_1_n_0\,
      CO(2) => \mult_a_reg[2][12]_i_1_n_1\,
      CO(1) => \mult_a_reg[2][12]_i_1_n_2\,
      CO(0) => \mult_a_reg[2][12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \parallel_in_gen.in_data_s_reg[2]\(12 downto 9),
      O(3) => \mult_a_reg[2][12]_i_1_n_4\,
      O(2) => \mult_a_reg[2][12]_i_1_n_5\,
      O(1) => \mult_a_reg[2][12]_i_1_n_6\,
      O(0) => \mult_a_reg[2][12]_i_1_n_7\,
      S(3) => \mult_a[2][12]_i_2_n_0\,
      S(2) => \mult_a[2][12]_i_3_n_0\,
      S(1) => \mult_a[2][12]_i_4_n_0\,
      S(0) => \mult_a[2][12]_i_5_n_0\
    );
\mult_a_reg[2][13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][17]_i_1_n_7\,
      Q => \mult_a_reg_n_0_[2][13]\,
      R => '0'
    );
\mult_a_reg[2][14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][17]_i_1_n_6\,
      Q => \mult_a_reg_n_0_[2][14]\,
      R => '0'
    );
\mult_a_reg[2][15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][17]_i_1_n_5\,
      Q => \mult_a_reg_n_0_[2][15]\,
      R => '0'
    );
\mult_a_reg[2][17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][17]_i_1_n_4\,
      Q => \mult_a_reg_n_0_[2][17]\,
      R => '0'
    );
\mult_a_reg[2][17]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mult_a_reg[2][12]_i_1_n_0\,
      CO(3) => \NLW_mult_a_reg[2][17]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \mult_a_reg[2][17]_i_1_n_1\,
      CO(1) => \mult_a_reg[2][17]_i_1_n_2\,
      CO(0) => \mult_a_reg[2][17]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"01",
      DI(1 downto 0) => \parallel_in_gen.in_data_s_reg[2]\(14 downto 13),
      O(3) => \mult_a_reg[2][17]_i_1_n_4\,
      O(2) => \mult_a_reg[2][17]_i_1_n_5\,
      O(1) => \mult_a_reg[2][17]_i_1_n_6\,
      O(0) => \mult_a_reg[2][17]_i_1_n_7\,
      S(3) => '1',
      S(2) => \mult_a[2][17]_i_2_n_0\,
      S(1) => \mult_a[2][17]_i_3_n_0\,
      S(0) => \mult_a[2][17]_i_4_n_0\
    );
\mult_a_reg[2][1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][4]_i_1_n_7\,
      Q => \mult_a_reg_n_0_[2][1]\,
      R => '0'
    );
\mult_a_reg[2][2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][4]_i_1_n_6\,
      Q => \mult_a_reg_n_0_[2][2]\,
      R => '0'
    );
\mult_a_reg[2][3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][4]_i_1_n_5\,
      Q => \mult_a_reg_n_0_[2][3]\,
      R => '0'
    );
\mult_a_reg[2][4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][4]_i_1_n_4\,
      Q => \mult_a_reg_n_0_[2][4]\,
      R => '0'
    );
\mult_a_reg[2][4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \mult_a_reg[2][4]_i_1_n_0\,
      CO(2) => \mult_a_reg[2][4]_i_1_n_1\,
      CO(1) => \mult_a_reg[2][4]_i_1_n_2\,
      CO(0) => \mult_a_reg[2][4]_i_1_n_3\,
      CYINIT => \parallel_in_gen.in_data_s_reg[2]\(0),
      DI(3 downto 0) => \parallel_in_gen.in_data_s_reg[2]\(4 downto 1),
      O(3) => \mult_a_reg[2][4]_i_1_n_4\,
      O(2) => \mult_a_reg[2][4]_i_1_n_5\,
      O(1) => \mult_a_reg[2][4]_i_1_n_6\,
      O(0) => \mult_a_reg[2][4]_i_1_n_7\,
      S(3) => \mult_a[2][4]_i_2_n_0\,
      S(2) => \mult_a[2][4]_i_3_n_0\,
      S(1) => \mult_a[2][4]_i_4_n_0\,
      S(0) => \mult_a[2][4]_i_5_n_0\
    );
\mult_a_reg[2][5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][8]_i_1_n_7\,
      Q => \mult_a_reg_n_0_[2][5]\,
      R => '0'
    );
\mult_a_reg[2][6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][8]_i_1_n_6\,
      Q => \mult_a_reg_n_0_[2][6]\,
      R => '0'
    );
\mult_a_reg[2][7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][8]_i_1_n_5\,
      Q => \mult_a_reg_n_0_[2][7]\,
      R => '0'
    );
\mult_a_reg[2][8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][8]_i_1_n_4\,
      Q => \mult_a_reg_n_0_[2][8]\,
      R => '0'
    );
\mult_a_reg[2][8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \mult_a_reg[2][4]_i_1_n_0\,
      CO(3) => \mult_a_reg[2][8]_i_1_n_0\,
      CO(2) => \mult_a_reg[2][8]_i_1_n_1\,
      CO(1) => \mult_a_reg[2][8]_i_1_n_2\,
      CO(0) => \mult_a_reg[2][8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \parallel_in_gen.in_data_s_reg[2]\(8 downto 5),
      O(3) => \mult_a_reg[2][8]_i_1_n_4\,
      O(2) => \mult_a_reg[2][8]_i_1_n_5\,
      O(1) => \mult_a_reg[2][8]_i_1_n_6\,
      O(0) => \mult_a_reg[2][8]_i_1_n_7\,
      S(3) => \mult_a[2][8]_i_2_n_0\,
      S(2) => \mult_a[2][8]_i_3_n_0\,
      S(1) => \mult_a[2][8]_i_4_n_0\,
      S(0) => \mult_a[2][8]_i_5_n_0\
    );
\mult_a_reg[2][9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axis_aclk,
      CE => '1',
      D => \mult_a_reg[2][12]_i_1_n_7\,
      Q => \mult_a_reg_n_0_[2][9]\,
      R => '0'
    );
\mult_gen[0].MULT_MACRO_inst\: entity work.zsys_axis_pwm_0_0_unimacro_MULT_MACRO
     port map (
      D(0) => p_1_in(0),
      DI(0) => \mult_gen[0].MULT_MACRO_inst_n_17\,
      P(16 downto 0) => \mult_p[0]_0\(32 downto 16),
      Q(16) => \mult_a_reg_n_0_[0][17]\,
      Q(15) => \mult_a_reg_n_0_[0][15]\,
      Q(14) => \mult_a_reg_n_0_[0][14]\,
      Q(13) => \mult_a_reg_n_0_[0][13]\,
      Q(12) => \mult_a_reg_n_0_[0][12]\,
      Q(11) => \mult_a_reg_n_0_[0][11]\,
      Q(10) => \mult_a_reg_n_0_[0][10]\,
      Q(9) => \mult_a_reg_n_0_[0][9]\,
      Q(8) => \mult_a_reg_n_0_[0][8]\,
      Q(7) => \mult_a_reg_n_0_[0][7]\,
      Q(6) => \mult_a_reg_n_0_[0][6]\,
      Q(5) => \mult_a_reg_n_0_[0][5]\,
      Q(4) => \mult_a_reg_n_0_[0][4]\,
      Q(3) => \mult_a_reg_n_0_[0][3]\,
      Q(2) => \mult_a_reg_n_0_[0][2]\,
      Q(1) => \mult_a_reg_n_0_[0][1]\,
      Q(0) => \mult_a_reg_n_0_[0][0]\,
      S(0) => \mult_gen[0].MULT_MACRO_inst_n_18\,
      \bipolar_gen.h_end_reg[0][12]\(3) => \mult_gen[0].MULT_MACRO_inst_n_19\,
      \bipolar_gen.h_end_reg[0][12]\(2) => \mult_gen[0].MULT_MACRO_inst_n_20\,
      \bipolar_gen.h_end_reg[0][12]\(1) => \mult_gen[0].MULT_MACRO_inst_n_21\,
      \bipolar_gen.h_end_reg[0][12]\(0) => \mult_gen[0].MULT_MACRO_inst_n_22\,
      \bipolar_gen.h_end_reg[0][12]_0\(3) => \mult_gen[0].MULT_MACRO_inst_n_23\,
      \bipolar_gen.h_end_reg[0][12]_0\(2) => \mult_gen[0].MULT_MACRO_inst_n_24\,
      \bipolar_gen.h_end_reg[0][12]_0\(1) => \mult_gen[0].MULT_MACRO_inst_n_25\,
      \bipolar_gen.h_end_reg[0][12]_0\(0) => \mult_gen[0].MULT_MACRO_inst_n_26\,
      \bipolar_gen.h_end_reg[0][12]_1\(2) => \mult_gen[0].MULT_MACRO_inst_n_48\,
      \bipolar_gen.h_end_reg[0][12]_1\(1) => \mult_gen[0].MULT_MACRO_inst_n_49\,
      \bipolar_gen.h_end_reg[0][12]_1\(0) => \mult_gen[0].MULT_MACRO_inst_n_50\,
      \bipolar_gen.h_end_reg[0][12]_2\(3) => \mult_gen[0].MULT_MACRO_inst_n_51\,
      \bipolar_gen.h_end_reg[0][12]_2\(2) => \mult_gen[0].MULT_MACRO_inst_n_52\,
      \bipolar_gen.h_end_reg[0][12]_2\(1) => \mult_gen[0].MULT_MACRO_inst_n_53\,
      \bipolar_gen.h_end_reg[0][12]_2\(0) => \mult_gen[0].MULT_MACRO_inst_n_54\,
      \bipolar_gen.h_end_reg[0][12]_3\(3) => \mult_gen[0].MULT_MACRO_inst_n_64\,
      \bipolar_gen.h_end_reg[0][12]_3\(2) => \mult_gen[0].MULT_MACRO_inst_n_65\,
      \bipolar_gen.h_end_reg[0][12]_3\(1) => \mult_gen[0].MULT_MACRO_inst_n_66\,
      \bipolar_gen.h_end_reg[0][12]_3\(0) => \mult_gen[0].MULT_MACRO_inst_n_67\,
      \bipolar_gen.h_end_reg[0][16]\(3) => \mult_gen[0].MULT_MACRO_inst_n_60\,
      \bipolar_gen.h_end_reg[0][16]\(2) => \mult_gen[0].MULT_MACRO_inst_n_61\,
      \bipolar_gen.h_end_reg[0][16]\(1) => \mult_gen[0].MULT_MACRO_inst_n_62\,
      \bipolar_gen.h_end_reg[0][16]\(0) => \mult_gen[0].MULT_MACRO_inst_n_63\,
      \bipolar_gen.h_end_reg[0][17]\(0) => \mult_gen[0].MULT_MACRO_inst_n_59\,
      \bipolar_gen.h_end_reg[0][4]\(3) => \mult_gen[0].MULT_MACRO_inst_n_27\,
      \bipolar_gen.h_end_reg[0][4]\(2) => \mult_gen[0].MULT_MACRO_inst_n_28\,
      \bipolar_gen.h_end_reg[0][4]\(1) => \mult_gen[0].MULT_MACRO_inst_n_29\,
      \bipolar_gen.h_end_reg[0][4]\(0) => \mult_gen[0].MULT_MACRO_inst_n_30\,
      \bipolar_gen.h_end_reg[0][8]\(3) => \mult_gen[0].MULT_MACRO_inst_n_55\,
      \bipolar_gen.h_end_reg[0][8]\(2) => \mult_gen[0].MULT_MACRO_inst_n_56\,
      \bipolar_gen.h_end_reg[0][8]\(1) => \mult_gen[0].MULT_MACRO_inst_n_57\,
      \bipolar_gen.h_end_reg[0][8]\(0) => \mult_gen[0].MULT_MACRO_inst_n_58\,
      \bipolar_gen.l_start_reg[0][12]\(3) => \mult_gen[0].MULT_MACRO_inst_n_39\,
      \bipolar_gen.l_start_reg[0][12]\(2) => \mult_gen[0].MULT_MACRO_inst_n_40\,
      \bipolar_gen.l_start_reg[0][12]\(1) => \mult_gen[0].MULT_MACRO_inst_n_41\,
      \bipolar_gen.l_start_reg[0][12]\(0) => \mult_gen[0].MULT_MACRO_inst_n_42\,
      \bipolar_gen.l_start_reg[0][16]\(3) => \mult_gen[0].MULT_MACRO_inst_n_43\,
      \bipolar_gen.l_start_reg[0][16]\(2) => \mult_gen[0].MULT_MACRO_inst_n_44\,
      \bipolar_gen.l_start_reg[0][16]\(1) => \mult_gen[0].MULT_MACRO_inst_n_45\,
      \bipolar_gen.l_start_reg[0][16]\(0) => \mult_gen[0].MULT_MACRO_inst_n_46\,
      \bipolar_gen.l_start_reg[0][17]\(0) => \mult_gen[0].MULT_MACRO_inst_n_47\,
      \bipolar_gen.l_start_reg[0][4]\(3) => \mult_gen[0].MULT_MACRO_inst_n_31\,
      \bipolar_gen.l_start_reg[0][4]\(2) => \mult_gen[0].MULT_MACRO_inst_n_32\,
      \bipolar_gen.l_start_reg[0][4]\(1) => \mult_gen[0].MULT_MACRO_inst_n_33\,
      \bipolar_gen.l_start_reg[0][4]\(0) => \mult_gen[0].MULT_MACRO_inst_n_34\,
      \bipolar_gen.l_start_reg[0][8]\(3) => \mult_gen[0].MULT_MACRO_inst_n_35\,
      \bipolar_gen.l_start_reg[0][8]\(2) => \mult_gen[0].MULT_MACRO_inst_n_36\,
      \bipolar_gen.l_start_reg[0][8]\(1) => \mult_gen[0].MULT_MACRO_inst_n_37\,
      \bipolar_gen.l_start_reg[0][8]\(0) => \mult_gen[0].MULT_MACRO_inst_n_38\,
      s_axis_aclk => s_axis_aclk
    );
\mult_gen[1].MULT_MACRO_inst\: entity work.zsys_axis_pwm_0_0_unimacro_MULT_MACRO_0
     port map (
      D(0) => \mult_gen[1].MULT_MACRO_inst_n_68\,
      DI(0) => \mult_gen[1].MULT_MACRO_inst_n_17\,
      P(16 downto 0) => \mult_p[1]_1\(32 downto 16),
      Q(16) => \mult_a_reg_n_0_[1][17]\,
      Q(15) => \mult_a_reg_n_0_[1][15]\,
      Q(14) => \mult_a_reg_n_0_[1][14]\,
      Q(13) => \mult_a_reg_n_0_[1][13]\,
      Q(12) => \mult_a_reg_n_0_[1][12]\,
      Q(11) => \mult_a_reg_n_0_[1][11]\,
      Q(10) => \mult_a_reg_n_0_[1][10]\,
      Q(9) => \mult_a_reg_n_0_[1][9]\,
      Q(8) => \mult_a_reg_n_0_[1][8]\,
      Q(7) => \mult_a_reg_n_0_[1][7]\,
      Q(6) => \mult_a_reg_n_0_[1][6]\,
      Q(5) => \mult_a_reg_n_0_[1][5]\,
      Q(4) => \mult_a_reg_n_0_[1][4]\,
      Q(3) => \mult_a_reg_n_0_[1][3]\,
      Q(2) => \mult_a_reg_n_0_[1][2]\,
      Q(1) => \mult_a_reg_n_0_[1][1]\,
      Q(0) => \mult_a_reg_n_0_[1][0]\,
      S(0) => \mult_gen[1].MULT_MACRO_inst_n_18\,
      \bipolar_gen.h_end_reg[1][12]\(3) => \mult_gen[1].MULT_MACRO_inst_n_19\,
      \bipolar_gen.h_end_reg[1][12]\(2) => \mult_gen[1].MULT_MACRO_inst_n_20\,
      \bipolar_gen.h_end_reg[1][12]\(1) => \mult_gen[1].MULT_MACRO_inst_n_21\,
      \bipolar_gen.h_end_reg[1][12]\(0) => \mult_gen[1].MULT_MACRO_inst_n_22\,
      \bipolar_gen.h_end_reg[1][12]_0\(3) => \mult_gen[1].MULT_MACRO_inst_n_23\,
      \bipolar_gen.h_end_reg[1][12]_0\(2) => \mult_gen[1].MULT_MACRO_inst_n_24\,
      \bipolar_gen.h_end_reg[1][12]_0\(1) => \mult_gen[1].MULT_MACRO_inst_n_25\,
      \bipolar_gen.h_end_reg[1][12]_0\(0) => \mult_gen[1].MULT_MACRO_inst_n_26\,
      \bipolar_gen.h_end_reg[1][12]_1\(2) => \mult_gen[1].MULT_MACRO_inst_n_48\,
      \bipolar_gen.h_end_reg[1][12]_1\(1) => \mult_gen[1].MULT_MACRO_inst_n_49\,
      \bipolar_gen.h_end_reg[1][12]_1\(0) => \mult_gen[1].MULT_MACRO_inst_n_50\,
      \bipolar_gen.h_end_reg[1][12]_2\(3) => \mult_gen[1].MULT_MACRO_inst_n_51\,
      \bipolar_gen.h_end_reg[1][12]_2\(2) => \mult_gen[1].MULT_MACRO_inst_n_52\,
      \bipolar_gen.h_end_reg[1][12]_2\(1) => \mult_gen[1].MULT_MACRO_inst_n_53\,
      \bipolar_gen.h_end_reg[1][12]_2\(0) => \mult_gen[1].MULT_MACRO_inst_n_54\,
      \bipolar_gen.h_end_reg[1][12]_3\(3) => \mult_gen[1].MULT_MACRO_inst_n_64\,
      \bipolar_gen.h_end_reg[1][12]_3\(2) => \mult_gen[1].MULT_MACRO_inst_n_65\,
      \bipolar_gen.h_end_reg[1][12]_3\(1) => \mult_gen[1].MULT_MACRO_inst_n_66\,
      \bipolar_gen.h_end_reg[1][12]_3\(0) => \mult_gen[1].MULT_MACRO_inst_n_67\,
      \bipolar_gen.h_end_reg[1][16]\(3) => \mult_gen[1].MULT_MACRO_inst_n_60\,
      \bipolar_gen.h_end_reg[1][16]\(2) => \mult_gen[1].MULT_MACRO_inst_n_61\,
      \bipolar_gen.h_end_reg[1][16]\(1) => \mult_gen[1].MULT_MACRO_inst_n_62\,
      \bipolar_gen.h_end_reg[1][16]\(0) => \mult_gen[1].MULT_MACRO_inst_n_63\,
      \bipolar_gen.h_end_reg[1][17]\(0) => \mult_gen[1].MULT_MACRO_inst_n_59\,
      \bipolar_gen.h_end_reg[1][4]\(3) => \mult_gen[1].MULT_MACRO_inst_n_27\,
      \bipolar_gen.h_end_reg[1][4]\(2) => \mult_gen[1].MULT_MACRO_inst_n_28\,
      \bipolar_gen.h_end_reg[1][4]\(1) => \mult_gen[1].MULT_MACRO_inst_n_29\,
      \bipolar_gen.h_end_reg[1][4]\(0) => \mult_gen[1].MULT_MACRO_inst_n_30\,
      \bipolar_gen.h_end_reg[1][8]\(3) => \mult_gen[1].MULT_MACRO_inst_n_55\,
      \bipolar_gen.h_end_reg[1][8]\(2) => \mult_gen[1].MULT_MACRO_inst_n_56\,
      \bipolar_gen.h_end_reg[1][8]\(1) => \mult_gen[1].MULT_MACRO_inst_n_57\,
      \bipolar_gen.h_end_reg[1][8]\(0) => \mult_gen[1].MULT_MACRO_inst_n_58\,
      \bipolar_gen.l_start_reg[1][12]\(3) => \mult_gen[1].MULT_MACRO_inst_n_39\,
      \bipolar_gen.l_start_reg[1][12]\(2) => \mult_gen[1].MULT_MACRO_inst_n_40\,
      \bipolar_gen.l_start_reg[1][12]\(1) => \mult_gen[1].MULT_MACRO_inst_n_41\,
      \bipolar_gen.l_start_reg[1][12]\(0) => \mult_gen[1].MULT_MACRO_inst_n_42\,
      \bipolar_gen.l_start_reg[1][16]\(3) => \mult_gen[1].MULT_MACRO_inst_n_43\,
      \bipolar_gen.l_start_reg[1][16]\(2) => \mult_gen[1].MULT_MACRO_inst_n_44\,
      \bipolar_gen.l_start_reg[1][16]\(1) => \mult_gen[1].MULT_MACRO_inst_n_45\,
      \bipolar_gen.l_start_reg[1][16]\(0) => \mult_gen[1].MULT_MACRO_inst_n_46\,
      \bipolar_gen.l_start_reg[1][17]\(0) => \mult_gen[1].MULT_MACRO_inst_n_47\,
      \bipolar_gen.l_start_reg[1][4]\(3) => \mult_gen[1].MULT_MACRO_inst_n_31\,
      \bipolar_gen.l_start_reg[1][4]\(2) => \mult_gen[1].MULT_MACRO_inst_n_32\,
      \bipolar_gen.l_start_reg[1][4]\(1) => \mult_gen[1].MULT_MACRO_inst_n_33\,
      \bipolar_gen.l_start_reg[1][4]\(0) => \mult_gen[1].MULT_MACRO_inst_n_34\,
      \bipolar_gen.l_start_reg[1][8]\(3) => \mult_gen[1].MULT_MACRO_inst_n_35\,
      \bipolar_gen.l_start_reg[1][8]\(2) => \mult_gen[1].MULT_MACRO_inst_n_36\,
      \bipolar_gen.l_start_reg[1][8]\(1) => \mult_gen[1].MULT_MACRO_inst_n_37\,
      \bipolar_gen.l_start_reg[1][8]\(0) => \mult_gen[1].MULT_MACRO_inst_n_38\,
      s_axis_aclk => s_axis_aclk
    );
\mult_gen[2].MULT_MACRO_inst\: entity work.zsys_axis_pwm_0_0_unimacro_MULT_MACRO_1
     port map (
      D(0) => \mult_gen[2].MULT_MACRO_inst_n_68\,
      DI(0) => \mult_gen[2].MULT_MACRO_inst_n_17\,
      P(16 downto 0) => \mult_p[2]_2\(32 downto 16),
      Q(16) => \mult_a_reg_n_0_[2][17]\,
      Q(15) => \mult_a_reg_n_0_[2][15]\,
      Q(14) => \mult_a_reg_n_0_[2][14]\,
      Q(13) => \mult_a_reg_n_0_[2][13]\,
      Q(12) => \mult_a_reg_n_0_[2][12]\,
      Q(11) => \mult_a_reg_n_0_[2][11]\,
      Q(10) => \mult_a_reg_n_0_[2][10]\,
      Q(9) => \mult_a_reg_n_0_[2][9]\,
      Q(8) => \mult_a_reg_n_0_[2][8]\,
      Q(7) => \mult_a_reg_n_0_[2][7]\,
      Q(6) => \mult_a_reg_n_0_[2][6]\,
      Q(5) => \mult_a_reg_n_0_[2][5]\,
      Q(4) => \mult_a_reg_n_0_[2][4]\,
      Q(3) => \mult_a_reg_n_0_[2][3]\,
      Q(2) => \mult_a_reg_n_0_[2][2]\,
      Q(1) => \mult_a_reg_n_0_[2][1]\,
      Q(0) => \mult_a_reg_n_0_[2][0]\,
      S(0) => \mult_gen[2].MULT_MACRO_inst_n_18\,
      \bipolar_gen.h_end_reg[2][12]\(3) => \mult_gen[2].MULT_MACRO_inst_n_19\,
      \bipolar_gen.h_end_reg[2][12]\(2) => \mult_gen[2].MULT_MACRO_inst_n_20\,
      \bipolar_gen.h_end_reg[2][12]\(1) => \mult_gen[2].MULT_MACRO_inst_n_21\,
      \bipolar_gen.h_end_reg[2][12]\(0) => \mult_gen[2].MULT_MACRO_inst_n_22\,
      \bipolar_gen.h_end_reg[2][12]_0\(3) => \mult_gen[2].MULT_MACRO_inst_n_23\,
      \bipolar_gen.h_end_reg[2][12]_0\(2) => \mult_gen[2].MULT_MACRO_inst_n_24\,
      \bipolar_gen.h_end_reg[2][12]_0\(1) => \mult_gen[2].MULT_MACRO_inst_n_25\,
      \bipolar_gen.h_end_reg[2][12]_0\(0) => \mult_gen[2].MULT_MACRO_inst_n_26\,
      \bipolar_gen.h_end_reg[2][12]_1\(2) => \mult_gen[2].MULT_MACRO_inst_n_48\,
      \bipolar_gen.h_end_reg[2][12]_1\(1) => \mult_gen[2].MULT_MACRO_inst_n_49\,
      \bipolar_gen.h_end_reg[2][12]_1\(0) => \mult_gen[2].MULT_MACRO_inst_n_50\,
      \bipolar_gen.h_end_reg[2][12]_2\(3) => \mult_gen[2].MULT_MACRO_inst_n_51\,
      \bipolar_gen.h_end_reg[2][12]_2\(2) => \mult_gen[2].MULT_MACRO_inst_n_52\,
      \bipolar_gen.h_end_reg[2][12]_2\(1) => \mult_gen[2].MULT_MACRO_inst_n_53\,
      \bipolar_gen.h_end_reg[2][12]_2\(0) => \mult_gen[2].MULT_MACRO_inst_n_54\,
      \bipolar_gen.h_end_reg[2][12]_3\(3) => \mult_gen[2].MULT_MACRO_inst_n_64\,
      \bipolar_gen.h_end_reg[2][12]_3\(2) => \mult_gen[2].MULT_MACRO_inst_n_65\,
      \bipolar_gen.h_end_reg[2][12]_3\(1) => \mult_gen[2].MULT_MACRO_inst_n_66\,
      \bipolar_gen.h_end_reg[2][12]_3\(0) => \mult_gen[2].MULT_MACRO_inst_n_67\,
      \bipolar_gen.h_end_reg[2][16]\(3) => \mult_gen[2].MULT_MACRO_inst_n_60\,
      \bipolar_gen.h_end_reg[2][16]\(2) => \mult_gen[2].MULT_MACRO_inst_n_61\,
      \bipolar_gen.h_end_reg[2][16]\(1) => \mult_gen[2].MULT_MACRO_inst_n_62\,
      \bipolar_gen.h_end_reg[2][16]\(0) => \mult_gen[2].MULT_MACRO_inst_n_63\,
      \bipolar_gen.h_end_reg[2][17]\(0) => \mult_gen[2].MULT_MACRO_inst_n_59\,
      \bipolar_gen.h_end_reg[2][4]\(3) => \mult_gen[2].MULT_MACRO_inst_n_27\,
      \bipolar_gen.h_end_reg[2][4]\(2) => \mult_gen[2].MULT_MACRO_inst_n_28\,
      \bipolar_gen.h_end_reg[2][4]\(1) => \mult_gen[2].MULT_MACRO_inst_n_29\,
      \bipolar_gen.h_end_reg[2][4]\(0) => \mult_gen[2].MULT_MACRO_inst_n_30\,
      \bipolar_gen.h_end_reg[2][8]\(3) => \mult_gen[2].MULT_MACRO_inst_n_55\,
      \bipolar_gen.h_end_reg[2][8]\(2) => \mult_gen[2].MULT_MACRO_inst_n_56\,
      \bipolar_gen.h_end_reg[2][8]\(1) => \mult_gen[2].MULT_MACRO_inst_n_57\,
      \bipolar_gen.h_end_reg[2][8]\(0) => \mult_gen[2].MULT_MACRO_inst_n_58\,
      \bipolar_gen.l_start_reg[2][12]\(3) => \mult_gen[2].MULT_MACRO_inst_n_39\,
      \bipolar_gen.l_start_reg[2][12]\(2) => \mult_gen[2].MULT_MACRO_inst_n_40\,
      \bipolar_gen.l_start_reg[2][12]\(1) => \mult_gen[2].MULT_MACRO_inst_n_41\,
      \bipolar_gen.l_start_reg[2][12]\(0) => \mult_gen[2].MULT_MACRO_inst_n_42\,
      \bipolar_gen.l_start_reg[2][16]\(3) => \mult_gen[2].MULT_MACRO_inst_n_43\,
      \bipolar_gen.l_start_reg[2][16]\(2) => \mult_gen[2].MULT_MACRO_inst_n_44\,
      \bipolar_gen.l_start_reg[2][16]\(1) => \mult_gen[2].MULT_MACRO_inst_n_45\,
      \bipolar_gen.l_start_reg[2][16]\(0) => \mult_gen[2].MULT_MACRO_inst_n_46\,
      \bipolar_gen.l_start_reg[2][17]\(0) => \mult_gen[2].MULT_MACRO_inst_n_47\,
      \bipolar_gen.l_start_reg[2][4]\(3) => \mult_gen[2].MULT_MACRO_inst_n_31\,
      \bipolar_gen.l_start_reg[2][4]\(2) => \mult_gen[2].MULT_MACRO_inst_n_32\,
      \bipolar_gen.l_start_reg[2][4]\(1) => \mult_gen[2].MULT_MACRO_inst_n_33\,
      \bipolar_gen.l_start_reg[2][4]\(0) => \mult_gen[2].MULT_MACRO_inst_n_34\,
      \bipolar_gen.l_start_reg[2][8]\(3) => \mult_gen[2].MULT_MACRO_inst_n_35\,
      \bipolar_gen.l_start_reg[2][8]\(2) => \mult_gen[2].MULT_MACRO_inst_n_36\,
      \bipolar_gen.l_start_reg[2][8]\(1) => \mult_gen[2].MULT_MACRO_inst_n_37\,
      \bipolar_gen.l_start_reg[2][8]\(0) => \mult_gen[2].MULT_MACRO_inst_n_38\,
      s_axis_aclk => s_axis_aclk
    );
p_0_in_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_0_in_carry_n_0,
      CO(2) => p_0_in_carry_n_1,
      CO(1) => p_0_in_carry_n_2,
      CO(0) => p_0_in_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_p_0_in_carry_O_UNCONNECTED(3 downto 0),
      S(3) => p_0_in_carry_i_1_n_0,
      S(2) => p_0_in_carry_i_2_n_0,
      S(1) => p_0_in_carry_i_3_n_0,
      S(0) => p_0_in_carry_i_4_n_0
    );
\p_0_in_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_0_in_carry_n_0,
      CO(3 downto 2) => \NLW_p_0_in_carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => p_0_in_3,
      CO(0) => \p_0_in_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_p_0_in_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \p_0_in_carry__0_i_1_n_0\,
      S(0) => \p_0_in_carry__0_i_2_n_0\
    );
\p_0_in_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => pwm_cnt_reg(17),
      I1 => pwm_cnt_reg(16),
      I2 => pwm_cnt_reg(15),
      O => \p_0_in_carry__0_i_1_n_0\
    );
\p_0_in_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => pwm_cnt_reg(12),
      I1 => \bipolar_gen.h_start_reg[2]\(12),
      I2 => pwm_cnt_reg(14),
      I3 => pwm_cnt_reg(13),
      O => \p_0_in_carry__0_i_2_n_0\
    );
p_0_in_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => pwm_cnt_reg(9),
      I1 => \bipolar_gen.h_start_reg[2]\(12),
      I2 => pwm_cnt_reg(11),
      I3 => pwm_cnt_reg(10),
      O => p_0_in_carry_i_1_n_0
    );
p_0_in_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0081"
    )
        port map (
      I0 => \bipolar_gen.h_start_reg[2]\(12),
      I1 => pwm_cnt_reg(8),
      I2 => pwm_cnt_reg(7),
      I3 => pwm_cnt_reg(6),
      O => p_0_in_carry_i_2_n_0
    );
p_0_in_carry_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000009"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      I1 => \bipolar_gen.h_start_reg[2]\(3),
      I2 => pwm_cnt_reg(5),
      I3 => \bipolar_gen.h_start_reg[2]\(4),
      I4 => pwm_cnt_reg(4),
      O => p_0_in_carry_i_3_n_0
    );
p_0_in_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => \bipolar_gen.h_start_reg[2]\(3),
      I2 => pwm_cnt_reg(2),
      I3 => pwm_cnt_reg(1),
      O => p_0_in_carry_i_4_n_0
    );
p_2_in_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => p_2_in_carry_n_0,
      CO(2) => p_2_in_carry_n_1,
      CO(1) => p_2_in_carry_n_2,
      CO(0) => p_2_in_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_p_2_in_carry_O_UNCONNECTED(3 downto 0),
      S(3) => p_2_in_carry_i_1_n_0,
      S(2) => p_2_in_carry_i_2_n_0,
      S(1) => p_2_in_carry_i_3_n_0,
      S(0) => p_2_in_carry_i_4_n_0
    );
\p_2_in_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => p_2_in_carry_n_0,
      CO(3 downto 2) => \NLW_p_2_in_carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => p_2_in,
      CO(0) => \p_2_in_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \NLW_p_2_in_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \p_2_in_carry__0_i_1_n_0\,
      S(0) => \p_2_in_carry__0_i_2_n_0\
    );
\p_2_in_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => pwm_cnt_reg(17),
      I1 => pwm_cnt_reg(16),
      I2 => pwm_cnt_reg(15),
      O => \p_2_in_carry__0_i_1_n_0\
    );
\p_2_in_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => pwm_cnt_reg(12),
      I1 => \bipolar_gen.h_start_reg[1]\(12),
      I2 => pwm_cnt_reg(14),
      I3 => pwm_cnt_reg(13),
      O => \p_2_in_carry__0_i_2_n_0\
    );
p_2_in_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => pwm_cnt_reg(9),
      I1 => \bipolar_gen.h_start_reg[1]\(12),
      I2 => pwm_cnt_reg(11),
      I3 => pwm_cnt_reg(10),
      O => p_2_in_carry_i_1_n_0
    );
p_2_in_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0081"
    )
        port map (
      I0 => \bipolar_gen.h_start_reg[1]\(12),
      I1 => pwm_cnt_reg(8),
      I2 => pwm_cnt_reg(7),
      I3 => pwm_cnt_reg(6),
      O => p_2_in_carry_i_2_n_0
    );
p_2_in_carry_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"09000009"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      I1 => \bipolar_gen.h_start_reg[2]\(3),
      I2 => pwm_cnt_reg(5),
      I3 => \bipolar_gen.h_start_reg[1]\(4),
      I4 => pwm_cnt_reg(4),
      O => p_2_in_carry_i_3_n_0
    );
p_2_in_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0009"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => \bipolar_gen.h_start_reg[2]\(3),
      I2 => pwm_cnt_reg(2),
      I3 => pwm_cnt_reg(1),
      O => p_2_in_carry_i_4_n_0
    );
\parallel_in_gen.in_data_s_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(0),
      Q => \parallel_in_gen.in_data_s_reg[0]\(0),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(10),
      Q => \parallel_in_gen.in_data_s_reg[0]\(10),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(11),
      Q => \parallel_in_gen.in_data_s_reg[0]\(11),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(12),
      Q => \parallel_in_gen.in_data_s_reg[0]\(12),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(13),
      Q => \parallel_in_gen.in_data_s_reg[0]\(13),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(14),
      Q => \parallel_in_gen.in_data_s_reg[0]\(14),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(15),
      Q => \parallel_in_gen.in_data_s_reg[0]\(15),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(1),
      Q => \parallel_in_gen.in_data_s_reg[0]\(1),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(2),
      Q => \parallel_in_gen.in_data_s_reg[0]\(2),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(3),
      Q => \parallel_in_gen.in_data_s_reg[0]\(3),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(4),
      Q => \parallel_in_gen.in_data_s_reg[0]\(4),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(5),
      Q => \parallel_in_gen.in_data_s_reg[0]\(5),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(6),
      Q => \parallel_in_gen.in_data_s_reg[0]\(6),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(7),
      Q => \parallel_in_gen.in_data_s_reg[0]\(7),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(8),
      Q => \parallel_in_gen.in_data_s_reg[0]\(8),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[0][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(9),
      Q => \parallel_in_gen.in_data_s_reg[0]\(9),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(16),
      Q => \parallel_in_gen.in_data_s_reg[1]\(0),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(26),
      Q => \parallel_in_gen.in_data_s_reg[1]\(10),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(27),
      Q => \parallel_in_gen.in_data_s_reg[1]\(11),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(28),
      Q => \parallel_in_gen.in_data_s_reg[1]\(12),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(29),
      Q => \parallel_in_gen.in_data_s_reg[1]\(13),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(30),
      Q => \parallel_in_gen.in_data_s_reg[1]\(14),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(31),
      Q => \parallel_in_gen.in_data_s_reg[1]\(15),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(17),
      Q => \parallel_in_gen.in_data_s_reg[1]\(1),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(18),
      Q => \parallel_in_gen.in_data_s_reg[1]\(2),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(19),
      Q => \parallel_in_gen.in_data_s_reg[1]\(3),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(20),
      Q => \parallel_in_gen.in_data_s_reg[1]\(4),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(21),
      Q => \parallel_in_gen.in_data_s_reg[1]\(5),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(22),
      Q => \parallel_in_gen.in_data_s_reg[1]\(6),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(23),
      Q => \parallel_in_gen.in_data_s_reg[1]\(7),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(24),
      Q => \parallel_in_gen.in_data_s_reg[1]\(8),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[1][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(25),
      Q => \parallel_in_gen.in_data_s_reg[1]\(9),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(32),
      Q => \parallel_in_gen.in_data_s_reg[2]\(0),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(42),
      Q => \parallel_in_gen.in_data_s_reg[2]\(10),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(43),
      Q => \parallel_in_gen.in_data_s_reg[2]\(11),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(44),
      Q => \parallel_in_gen.in_data_s_reg[2]\(12),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(45),
      Q => \parallel_in_gen.in_data_s_reg[2]\(13),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(46),
      Q => \parallel_in_gen.in_data_s_reg[2]\(14),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(47),
      Q => \parallel_in_gen.in_data_s_reg[2]\(15),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(33),
      Q => \parallel_in_gen.in_data_s_reg[2]\(1),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(34),
      Q => \parallel_in_gen.in_data_s_reg[2]\(2),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(35),
      Q => \parallel_in_gen.in_data_s_reg[2]\(3),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(36),
      Q => \parallel_in_gen.in_data_s_reg[2]\(4),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(37),
      Q => \parallel_in_gen.in_data_s_reg[2]\(5),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(38),
      Q => \parallel_in_gen.in_data_s_reg[2]\(6),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(39),
      Q => \parallel_in_gen.in_data_s_reg[2]\(7),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(40),
      Q => \parallel_in_gen.in_data_s_reg[2]\(8),
      R => '0'
    );
\parallel_in_gen.in_data_s_reg[2][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => s_axis_tvalid,
      D => s_axis_tdata(41),
      Q => \parallel_in_gen.in_data_s_reg[2]\(9),
      R => '0'
    );
pwm_cnt0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => pwm_cnt0_carry_n_0,
      CO(2) => pwm_cnt0_carry_n_1,
      CO(1) => pwm_cnt0_carry_n_2,
      CO(0) => pwm_cnt0_carry_n_3,
      CYINIT => '1',
      DI(3) => pwm_cnt0_carry_i_1_n_0,
      DI(2) => pwm_cnt0_carry_i_2_n_0,
      DI(1) => pwm_cnt0_carry_i_3_n_0,
      DI(0) => pwm_cnt0_carry_i_4_n_0,
      O(3 downto 0) => NLW_pwm_cnt0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => pwm_cnt0_carry_i_5_n_0,
      S(2) => pwm_cnt0_carry_i_6_n_0,
      S(1) => pwm_cnt0_carry_i_7_n_0,
      S(0) => pwm_cnt0_carry_i_8_n_0
    );
\pwm_cnt0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => pwm_cnt0_carry_n_0,
      CO(3) => \pwm_cnt0_carry__0_n_0\,
      CO(2) => \pwm_cnt0_carry__0_n_1\,
      CO(1) => \pwm_cnt0_carry__0_n_2\,
      CO(0) => \pwm_cnt0_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \pwm_cnt0_carry__0_i_1_n_0\,
      DI(2) => pwm_cnt_reg(13),
      DI(1) => \pwm_cnt0_carry__0_i_2_n_0\,
      DI(0) => '0',
      O(3 downto 0) => \NLW_pwm_cnt0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \pwm_cnt0_carry__0_i_3_n_0\,
      S(2) => \pwm_cnt0_carry__0_i_4_n_0\,
      S(1) => \pwm_cnt0_carry__0_i_5_n_0\,
      S(0) => \pwm_cnt0_carry__0_i_6_n_0\
    );
\pwm_cnt0_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => pwm_cnt_reg(14),
      I1 => pwm_cnt_reg(15),
      O => \pwm_cnt0_carry__0_i_1_n_0\
    );
\pwm_cnt0_carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => pwm_cnt_reg(10),
      I1 => pwm_cnt_reg(11),
      O => \pwm_cnt0_carry__0_i_2_n_0\
    );
\pwm_cnt0_carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pwm_cnt_reg(14),
      I1 => pwm_cnt_reg(15),
      O => \pwm_cnt0_carry__0_i_3_n_0\
    );
\pwm_cnt0_carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(12),
      I1 => pwm_cnt_reg(13),
      O => \pwm_cnt0_carry__0_i_4_n_0\
    );
\pwm_cnt0_carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pwm_cnt_reg(10),
      I1 => pwm_cnt_reg(11),
      O => \pwm_cnt0_carry__0_i_5_n_0\
    );
\pwm_cnt0_carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => pwm_cnt_reg(8),
      I1 => pwm_cnt_reg(9),
      O => \pwm_cnt0_carry__0_i_6_n_0\
    );
\pwm_cnt0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_cnt0_carry__0_n_0\,
      CO(3 downto 1) => \NLW_pwm_cnt0_carry__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \pwm_cnt0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \pwm_cnt0_carry__1_i_1_n_0\,
      O(3 downto 0) => \NLW_pwm_cnt0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3 downto 1) => B"000",
      S(0) => \pwm_cnt0_carry__1_i_2_n_0\
    );
\pwm_cnt0_carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(16),
      I1 => pwm_cnt_reg(17),
      O => \pwm_cnt0_carry__1_i_1_n_0\
    );
\pwm_cnt0_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pwm_cnt_reg(16),
      I1 => pwm_cnt_reg(17),
      O => \pwm_cnt0_carry__1_i_2_n_0\
    );
pwm_cnt0_carry_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => pwm_cnt_reg(6),
      I1 => pwm_cnt_reg(7),
      O => pwm_cnt0_carry_i_1_n_0
    );
pwm_cnt0_carry_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => pwm_cnt_reg(4),
      I1 => pwm_cnt_reg(5),
      O => pwm_cnt0_carry_i_2_n_0
    );
pwm_cnt0_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => pwm_cnt_reg(2),
      I1 => pwm_cnt_reg(3),
      O => pwm_cnt0_carry_i_3_n_0
    );
pwm_cnt0_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => pwm_cnt_reg(1),
      O => pwm_cnt0_carry_i_4_n_0
    );
pwm_cnt0_carry_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(7),
      I1 => pwm_cnt_reg(6),
      O => pwm_cnt0_carry_i_5_n_0
    );
pwm_cnt0_carry_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pwm_cnt_reg(4),
      I1 => pwm_cnt_reg(5),
      O => pwm_cnt0_carry_i_6_n_0
    );
pwm_cnt0_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      I1 => pwm_cnt_reg(2),
      O => pwm_cnt0_carry_i_7_n_0
    );
pwm_cnt0_carry_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      I1 => pwm_cnt_reg(1),
      O => pwm_cnt0_carry_i_8_n_0
    );
\pwm_cnt[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(3),
      O => \pwm_cnt[0]_i_2_n_0\
    );
\pwm_cnt[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(2),
      O => \pwm_cnt[0]_i_3_n_0\
    );
\pwm_cnt[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(1),
      O => \pwm_cnt[0]_i_4_n_0\
    );
\pwm_cnt[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pwm_cnt_reg(0),
      O => \pwm_cnt[0]_i_5_n_0\
    );
\pwm_cnt[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(15),
      O => \pwm_cnt[12]_i_2_n_0\
    );
\pwm_cnt[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(14),
      O => \pwm_cnt[12]_i_3_n_0\
    );
\pwm_cnt[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(13),
      O => \pwm_cnt[12]_i_4_n_0\
    );
\pwm_cnt[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(12),
      O => \pwm_cnt[12]_i_5_n_0\
    );
\pwm_cnt[16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(17),
      O => \pwm_cnt[16]_i_2_n_0\
    );
\pwm_cnt[16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(16),
      O => \pwm_cnt[16]_i_3_n_0\
    );
\pwm_cnt[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(7),
      O => \pwm_cnt[4]_i_2_n_0\
    );
\pwm_cnt[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(6),
      O => \pwm_cnt[4]_i_3_n_0\
    );
\pwm_cnt[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(5),
      O => \pwm_cnt[4]_i_4_n_0\
    );
\pwm_cnt[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(4),
      O => \pwm_cnt[4]_i_5_n_0\
    );
\pwm_cnt[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(11),
      O => \pwm_cnt[8]_i_2_n_0\
    );
\pwm_cnt[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(10),
      O => \pwm_cnt[8]_i_3_n_0\
    );
\pwm_cnt[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(9),
      O => \pwm_cnt[8]_i_4_n_0\
    );
\pwm_cnt[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pwm_cnt_reg(8),
      O => \pwm_cnt[8]_i_5_n_0\
    );
\pwm_cnt_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[0]_i_1_n_7\,
      Q => pwm_cnt_reg(0),
      S => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \pwm_cnt_reg[0]_i_1_n_0\,
      CO(2) => \pwm_cnt_reg[0]_i_1_n_1\,
      CO(1) => \pwm_cnt_reg[0]_i_1_n_2\,
      CO(0) => \pwm_cnt_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \pwm_cnt_reg[0]_i_1_n_4\,
      O(2) => \pwm_cnt_reg[0]_i_1_n_5\,
      O(1) => \pwm_cnt_reg[0]_i_1_n_6\,
      O(0) => \pwm_cnt_reg[0]_i_1_n_7\,
      S(3) => \pwm_cnt[0]_i_2_n_0\,
      S(2) => \pwm_cnt[0]_i_3_n_0\,
      S(1) => \pwm_cnt[0]_i_4_n_0\,
      S(0) => \pwm_cnt[0]_i_5_n_0\
    );
\pwm_cnt_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[8]_i_1_n_5\,
      Q => pwm_cnt_reg(10),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[8]_i_1_n_4\,
      Q => pwm_cnt_reg(11),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[12]_i_1_n_7\,
      Q => pwm_cnt_reg(12),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_cnt_reg[8]_i_1_n_0\,
      CO(3) => \pwm_cnt_reg[12]_i_1_n_0\,
      CO(2) => \pwm_cnt_reg[12]_i_1_n_1\,
      CO(1) => \pwm_cnt_reg[12]_i_1_n_2\,
      CO(0) => \pwm_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pwm_cnt_reg[12]_i_1_n_4\,
      O(2) => \pwm_cnt_reg[12]_i_1_n_5\,
      O(1) => \pwm_cnt_reg[12]_i_1_n_6\,
      O(0) => \pwm_cnt_reg[12]_i_1_n_7\,
      S(3) => \pwm_cnt[12]_i_2_n_0\,
      S(2) => \pwm_cnt[12]_i_3_n_0\,
      S(1) => \pwm_cnt[12]_i_4_n_0\,
      S(0) => \pwm_cnt[12]_i_5_n_0\
    );
\pwm_cnt_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[12]_i_1_n_6\,
      Q => pwm_cnt_reg(13),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[12]_i_1_n_5\,
      Q => pwm_cnt_reg(14),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[12]_i_1_n_4\,
      Q => pwm_cnt_reg(15),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[16]_i_1_n_7\,
      Q => pwm_cnt_reg(16),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_cnt_reg[12]_i_1_n_0\,
      CO(3 downto 1) => \NLW_pwm_cnt_reg[16]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \pwm_cnt_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_pwm_cnt_reg[16]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \pwm_cnt_reg[16]_i_1_n_6\,
      O(0) => \pwm_cnt_reg[16]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \pwm_cnt[16]_i_2_n_0\,
      S(0) => \pwm_cnt[16]_i_3_n_0\
    );
\pwm_cnt_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[16]_i_1_n_6\,
      Q => pwm_cnt_reg(17),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[0]_i_1_n_6\,
      Q => pwm_cnt_reg(1),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[0]_i_1_n_5\,
      Q => pwm_cnt_reg(2),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[0]_i_1_n_4\,
      Q => pwm_cnt_reg(3),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[4]_i_1_n_7\,
      Q => pwm_cnt_reg(4),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_cnt_reg[0]_i_1_n_0\,
      CO(3) => \pwm_cnt_reg[4]_i_1_n_0\,
      CO(2) => \pwm_cnt_reg[4]_i_1_n_1\,
      CO(1) => \pwm_cnt_reg[4]_i_1_n_2\,
      CO(0) => \pwm_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pwm_cnt_reg[4]_i_1_n_4\,
      O(2) => \pwm_cnt_reg[4]_i_1_n_5\,
      O(1) => \pwm_cnt_reg[4]_i_1_n_6\,
      O(0) => \pwm_cnt_reg[4]_i_1_n_7\,
      S(3) => \pwm_cnt[4]_i_2_n_0\,
      S(2) => \pwm_cnt[4]_i_3_n_0\,
      S(1) => \pwm_cnt[4]_i_4_n_0\,
      S(0) => \pwm_cnt[4]_i_5_n_0\
    );
\pwm_cnt_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[4]_i_1_n_6\,
      Q => pwm_cnt_reg(5),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[4]_i_1_n_5\,
      Q => pwm_cnt_reg(6),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[4]_i_1_n_4\,
      Q => pwm_cnt_reg(7),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[8]_i_1_n_7\,
      Q => pwm_cnt_reg(8),
      R => \pwm_cnt0_carry__1_n_3\
    );
\pwm_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_cnt_reg[4]_i_1_n_0\,
      CO(3) => \pwm_cnt_reg[8]_i_1_n_0\,
      CO(2) => \pwm_cnt_reg[8]_i_1_n_1\,
      CO(1) => \pwm_cnt_reg[8]_i_1_n_2\,
      CO(0) => \pwm_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pwm_cnt_reg[8]_i_1_n_4\,
      O(2) => \pwm_cnt_reg[8]_i_1_n_5\,
      O(1) => \pwm_cnt_reg[8]_i_1_n_6\,
      O(0) => \pwm_cnt_reg[8]_i_1_n_7\,
      S(3) => \pwm_cnt[8]_i_2_n_0\,
      S(2) => \pwm_cnt[8]_i_3_n_0\,
      S(1) => \pwm_cnt[8]_i_4_n_0\,
      S(0) => \pwm_cnt[8]_i_5_n_0\
    );
\pwm_cnt_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axis_aclk,
      CE => '1',
      D => \pwm_cnt_reg[8]_i_1_n_6\,
      Q => pwm_cnt_reg(9),
      R => \pwm_cnt0_carry__1_n_3\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_axis_pwm_0_0 is
  port (
    pwm_l : out STD_LOGIC_VECTOR ( 2 downto 0 );
    pwm_h : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of zsys_axis_pwm_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of zsys_axis_pwm_0_0 : entity is "zsys_axis_pwm_0_0,axis_pwm_v1_0,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of zsys_axis_pwm_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of zsys_axis_pwm_0_0 : entity is "axis_pwm_v1_0,Vivado 2017.1_sdx";
end zsys_axis_pwm_0_0;

architecture STRUCTURE of zsys_axis_pwm_0_0 is
  signal \<const1>\ : STD_LOGIC;
begin
  s_axis_tready <= \<const1>\;
U0: entity work.zsys_axis_pwm_0_0_axis_pwm_v1_0
     port map (
      pwm_h(2 downto 0) => pwm_h(2 downto 0),
      pwm_l(2 downto 0) => pwm_l(2 downto 0),
      s_axis_aclk => s_axis_aclk,
      s_axis_tdata(47 downto 0) => s_axis_tdata(47 downto 0),
      s_axis_tvalid => s_axis_tvalid
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
