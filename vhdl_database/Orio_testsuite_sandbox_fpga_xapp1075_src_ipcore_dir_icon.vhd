--------------------------------------------------------------------------------
-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: M.53d
--  \   \         Application: netgen
--  /   /         Filename: icon.vhd
-- /___/   /\     Timestamp: Wed Aug 28 15:45:46 2013
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -w -sim -ofmt vhdl /home/cchoudary/SDI_DEMO2/ipcore_dir/tmp/_cg/icon.ngc /home/cchoudary/SDI_DEMO2/ipcore_dir/tmp/_cg/icon.vhd 
-- Device	: xc6vlx240t-ff1156-1
-- Input file	: /home/cchoudary/SDI_DEMO2/ipcore_dir/tmp/_cg/icon.ngc
-- Output file	: /home/cchoudary/SDI_DEMO2/ipcore_dir/tmp/_cg/icon.vhd
-- # of Entities	: 1
-- Design Name	: icon
-- Xilinx	: /share/apps/Xilinx/12.1/ISE_DS/ISE
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------


-- synthesis translate_off
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity icon is
  port (
    CONTROL0 : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    CONTROL1 : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    CONTROL2 : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    CONTROL3 : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    CONTROL4 : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    CONTROL5 : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    CONTROL6 : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    CONTROL7 : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    CONTROL8 : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    CONTROL9 : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    CONTROL10 : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    CONTROL11 : inout STD_LOGIC_VECTOR ( 35 downto 0 ) 
  );
end icon;

architecture STRUCTURE of icon is
  component icon_bscan_bufg
    port (
      DRCK_LOCAL_I : in STD_LOGIC := 'X'; 
      DRCK_LOCAL_O : out STD_LOGIC 
    );
  end component;
  signal N0 : STD_LOGIC; 
  signal U0_iUPDATE_OUT : STD_LOGIC; 
  signal U0_iSHIFT_OUT : STD_LOGIC; 
  signal U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_6_399 : STD_LOGIC; 
  signal U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_7_400 : STD_LOGIC; 
  signal U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_71_401 : STD_LOGIC; 
  signal U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_8_402 : STD_LOGIC; 
  signal U0_U_ICON_I_YES_BSCAN_U_BS_iDRCK_LOCAL : STD_LOGIC; 
  signal U0_U_ICON_iDATA_CMD_n : STD_LOGIC; 
  signal U0_U_ICON_iSEL_n : STD_LOGIC; 
  signal U0_U_ICON_iSYNC : STD_LOGIC; 
  signal U0_U_ICON_iTDO : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_0_Q : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_1_Q : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_2_Q : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_3_Q : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_4_Q : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_5_Q : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_6_Q : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_7_Q : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_8_Q : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_9_Q : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_10_Q : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_11_Q : STD_LOGIC; 
  signal U0_U_ICON_iCORE_ID_SEL_15_Q : STD_LOGIC; 
  signal U0_U_ICON_iDATA_CMD : STD_LOGIC; 
  signal U0_U_ICON_iTDO_next : STD_LOGIC; 
  signal U0_U_ICON_iSEL : STD_LOGIC; 
  signal U0_U_ICON_iTDI : STD_LOGIC; 
  signal U0_U_ICON_U_CMD_iSEL_n : STD_LOGIC; 
  signal U0_U_ICON_U_CMD_iTARGET_CE : STD_LOGIC; 
  signal U0_U_ICON_U_CTRL_OUT_iDATA_VALID : STD_LOGIC; 
  signal U0_U_ICON_U_STAT_iTDO_next : STD_LOGIC; 
  signal U0_U_ICON_U_STAT_iSTAT_LOW : STD_LOGIC; 
  signal U0_U_ICON_U_STAT_iSTAT_HIGH : STD_LOGIC; 
  signal U0_U_ICON_U_STAT_iSTATCMD_CE_n : STD_LOGIC; 
  signal U0_U_ICON_U_STAT_iCMD_GRP0_SEL : STD_LOGIC; 
  signal U0_U_ICON_U_STAT_iSTATCMD_CE : STD_LOGIC; 
  signal U0_U_ICON_U_STAT_iDATA_VALID : STD_LOGIC; 
  signal U0_U_ICON_U_SYNC_iGOT_SYNC_LOW : STD_LOGIC; 
  signal U0_U_ICON_U_SYNC_iGOT_SYNC : STD_LOGIC; 
  signal U0_U_ICON_U_SYNC_iDATA_CMD_n : STD_LOGIC; 
  signal U0_U_ICON_U_SYNC_iGOT_SYNC_HIGH : STD_LOGIC; 
  signal N478 : STD_LOGIC; 
  signal N479 : STD_LOGIC; 
  signal N480 : STD_LOGIC; 
  signal N513 : STD_LOGIC; 
  signal N514 : STD_LOGIC; 
  signal N515 : STD_LOGIC; 
  signal N548 : STD_LOGIC; 
  signal N549 : STD_LOGIC; 
  signal N550 : STD_LOGIC; 
  signal N583 : STD_LOGIC; 
  signal N584 : STD_LOGIC; 
  signal N585 : STD_LOGIC; 
  signal N618 : STD_LOGIC; 
  signal N619 : STD_LOGIC; 
  signal N620 : STD_LOGIC; 
  signal N653 : STD_LOGIC; 
  signal N654 : STD_LOGIC; 
  signal N655 : STD_LOGIC; 
  signal N688 : STD_LOGIC; 
  signal N689 : STD_LOGIC; 
  signal N690 : STD_LOGIC; 
  signal N723 : STD_LOGIC; 
  signal N724 : STD_LOGIC; 
  signal N725 : STD_LOGIC; 
  signal N758 : STD_LOGIC; 
  signal N759 : STD_LOGIC; 
  signal N760 : STD_LOGIC; 
  signal N793 : STD_LOGIC; 
  signal N794 : STD_LOGIC; 
  signal N795 : STD_LOGIC; 
  signal N828 : STD_LOGIC; 
  signal N829 : STD_LOGIC; 
  signal N830 : STD_LOGIC; 
  signal NLW_U0_U_ICON_I_YES_BSCAN_U_BS_I_V6_ISYN_I_USE_SOFTBSCAN_EQ0_U_BS_TCK_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_U_ICON_I_YES_BSCAN_U_BS_I_V6_ISYN_I_USE_SOFTBSCAN_EQ0_U_BS_RUNTEST_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_U_ICON_I_YES_BSCAN_U_BS_I_V6_ISYN_I_USE_SOFTBSCAN_EQ0_U_BS_RESET_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_U_ICON_I_YES_BSCAN_U_BS_I_V6_ISYN_I_USE_SOFTBSCAN_EQ0_U_BS_CAPTURE_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_U_ICON_I_YES_BSCAN_U_BS_I_V6_ISYN_I_USE_SOFTBSCAN_EQ0_U_BS_TMS_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_14_U_LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_13_U_LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_12_U_LUT_O_UNCONNECTED : STD_LOGIC; 
  signal U0_U_ICON_iTDO_VEC : STD_LOGIC_VECTOR ( 15 downto 15 ); 
  signal U0_U_ICON_iCOMMAND_SEL : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal U0_U_ICON_iCORE_ID : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal U0_U_ICON_iCOMMAND_GRP : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_U_ICON_U_CMD_iTARGET : STD_LOGIC_VECTOR ( 11 downto 8 ); 
  signal U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_U_ICON_U_STAT_iSTAT : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal U0_U_ICON_U_STAT_iSTAT_CNT : STD_LOGIC_VECTOR ( 5 downto 0 ); 
  signal U0_U_ICON_U_STAT_U_STAT_CNT_D : STD_LOGIC_VECTOR ( 5 downto 0 ); 
  signal U0_U_ICON_U_STAT_U_STAT_CNT_CI : STD_LOGIC_VECTOR ( 5 downto 1 ); 
  signal U0_U_ICON_U_STAT_U_STAT_CNT_S : STD_LOGIC_VECTOR ( 5 downto 0 ); 
  signal U0_U_ICON_U_SYNC_iSYNC_WORD : STD_LOGIC_VECTOR ( 6 downto 0 ); 
begin
  CONTROL0(2) <= CONTROL11(2);
  CONTROL0(1) <= CONTROL11(1);
  CONTROL0(0) <= CONTROL11(0);
  CONTROL1(2) <= CONTROL11(2);
  CONTROL1(1) <= CONTROL11(1);
  CONTROL1(0) <= CONTROL11(0);
  CONTROL2(2) <= CONTROL11(2);
  CONTROL2(1) <= CONTROL11(1);
  CONTROL2(0) <= CONTROL11(0);
  CONTROL3(2) <= CONTROL11(2);
  CONTROL3(1) <= CONTROL11(1);
  CONTROL3(0) <= CONTROL11(0);
  CONTROL4(2) <= CONTROL11(2);
  CONTROL4(1) <= CONTROL11(1);
  CONTROL4(0) <= CONTROL11(0);
  CONTROL5(2) <= CONTROL11(2);
  CONTROL5(1) <= CONTROL11(1);
  CONTROL5(0) <= CONTROL11(0);
  CONTROL6(2) <= CONTROL11(2);
  CONTROL6(1) <= CONTROL11(1);
  CONTROL6(0) <= CONTROL11(0);
  CONTROL7(2) <= CONTROL11(2);
  CONTROL7(1) <= CONTROL11(1);
  CONTROL7(0) <= CONTROL11(0);
  CONTROL8(2) <= CONTROL11(2);
  CONTROL8(1) <= CONTROL11(1);
  CONTROL8(0) <= CONTROL11(0);
  CONTROL9(2) <= CONTROL11(2);
  CONTROL9(1) <= CONTROL11(1);
  CONTROL9(0) <= CONTROL11(0);
  CONTROL10(2) <= CONTROL11(2);
  CONTROL10(1) <= CONTROL11(1);
  CONTROL10(0) <= CONTROL11(0);
  XST_VCC : VCC
    port map (
      P => N0
    );
  XST_GND : GND
    port map (
      G => CONTROL11(2)
    );
  U0_U_ICON_I_YES_BSCAN_U_BS_I_V6_ISYN_I_USE_SOFTBSCAN_EQ0_U_BS : BSCAN_VIRTEX6
    generic map(
      JTAG_CHAIN => 1,
      DISABLE_JTAG => FALSE
    )
    port map (
      SHIFT => U0_iSHIFT_OUT,
      TDI => U0_U_ICON_iTDI,
      TCK => NLW_U0_U_ICON_I_YES_BSCAN_U_BS_I_V6_ISYN_I_USE_SOFTBSCAN_EQ0_U_BS_TCK_UNCONNECTED,
      RUNTEST => NLW_U0_U_ICON_I_YES_BSCAN_U_BS_I_V6_ISYN_I_USE_SOFTBSCAN_EQ0_U_BS_RUNTEST_UNCONNECTED,
      UPDATE => U0_iUPDATE_OUT,
      RESET => NLW_U0_U_ICON_I_YES_BSCAN_U_BS_I_V6_ISYN_I_USE_SOFTBSCAN_EQ0_U_BS_RESET_UNCONNECTED,
      SEL => U0_U_ICON_iSEL,
      TDO => U0_U_ICON_iTDO,
      CAPTURE => NLW_U0_U_ICON_I_YES_BSCAN_U_BS_I_V6_ISYN_I_USE_SOFTBSCAN_EQ0_U_BS_CAPTURE_UNCONNECTED,
      TMS => NLW_U0_U_ICON_I_YES_BSCAN_U_BS_I_V6_ISYN_I_USE_SOFTBSCAN_EQ0_U_BS_TMS_UNCONNECTED,
      DRCK => U0_U_ICON_I_YES_BSCAN_U_BS_iDRCK_LOCAL
    );
  U0_U_ICON_I_YES_BSCAN_U_BS_I_USE_SOFTBSCAN_EQ0_I_USE_XST_TCK_WORKAROUND_EQ1_U_ICON_BSCAN_BUFG : icon_bscan_bufg
    port map (
      DRCK_LOCAL_I => U0_U_ICON_I_YES_BSCAN_U_BS_iDRCK_LOCAL,
      DRCK_LOCAL_O => CONTROL11(0)
    );
  U0_U_ICON_U_iDATA_CMD_n : INV
    port map (
      I => U0_U_ICON_iDATA_CMD,
      O => U0_U_ICON_iDATA_CMD_n
    );
  U0_U_ICON_U_iSEL_n : INV
    port map (
      I => U0_U_ICON_iSEL,
      O => U0_U_ICON_iSEL_n
    );
  U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_6 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(1),
      I1 => U0_U_ICON_iCORE_ID(0),
      I2 => CONTROL2(3),
      I3 => CONTROL3(3),
      I4 => CONTROL1(3),
      I5 => CONTROL0(3),
      O => U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_6_399
    );
  U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_7 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(1),
      I1 => U0_U_ICON_iCORE_ID(0),
      I2 => CONTROL6(3),
      I3 => CONTROL7(3),
      I4 => CONTROL5(3),
      I5 => CONTROL4(3),
      O => U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_7_400
    );
  U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_71 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(1),
      I1 => U0_U_ICON_iCORE_ID(0),
      I2 => CONTROL10(3),
      I3 => CONTROL11(3),
      I4 => CONTROL9(3),
      I5 => CONTROL8(3),
      O => U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_71_401
    );
  U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_8 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => U0_U_ICON_iTDO_VEC(15),
      I1 => U0_U_ICON_iCORE_ID(0),
      I2 => U0_U_ICON_iCORE_ID(1),
      O => U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_8_402
    );
  U0_U_ICON_U_TDO_reg : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => N0,
      D => U0_U_ICON_iTDO_next,
      Q => U0_U_ICON_iTDO
    );
  U0_U_ICON_U_TDI_reg : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => N0,
      D => U0_U_ICON_iTDI,
      Q => CONTROL11(1)
    );
  U0_U_ICON_U_iDATA_CMD : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => U0_iUPDATE_OUT,
      CLR => U0_U_ICON_iSEL_n,
      D => U0_U_ICON_iDATA_CMD_n,
      Q => U0_U_ICON_iDATA_CMD
    );
  U0_U_ICON_U_CMD_U_SEL_n : INV
    port map (
      I => U0_U_ICON_iSEL,
      O => U0_U_ICON_U_CMD_iSEL_n
    );
  U0_U_ICON_U_CMD_U_TARGET_CE : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_U_ICON_iDATA_CMD,
      I1 => U0_iSHIFT_OUT,
      O => U0_U_ICON_U_CMD_iTARGET_CE
    );
  U0_U_ICON_U_CMD_G_TARGET_6_I_NE0_U_TARGET : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => U0_U_ICON_U_CMD_iTARGET_CE,
      CLR => U0_U_ICON_U_CMD_iSEL_n,
      D => U0_U_ICON_iCOMMAND_GRP(1),
      Q => U0_U_ICON_iCOMMAND_GRP(0)
    );
  U0_U_ICON_U_CMD_G_TARGET_7_I_NE0_U_TARGET : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => U0_U_ICON_U_CMD_iTARGET_CE,
      CLR => U0_U_ICON_U_CMD_iSEL_n,
      D => U0_U_ICON_U_CMD_iTARGET(8),
      Q => U0_U_ICON_iCOMMAND_GRP(1)
    );
  U0_U_ICON_U_CMD_G_TARGET_8_I_NE0_U_TARGET : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => U0_U_ICON_U_CMD_iTARGET_CE,
      CLR => U0_U_ICON_U_CMD_iSEL_n,
      D => U0_U_ICON_U_CMD_iTARGET(9),
      Q => U0_U_ICON_U_CMD_iTARGET(8)
    );
  U0_U_ICON_U_CMD_G_TARGET_9_I_NE0_U_TARGET : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => U0_U_ICON_U_CMD_iTARGET_CE,
      CLR => U0_U_ICON_U_CMD_iSEL_n,
      D => U0_U_ICON_U_CMD_iTARGET(10),
      Q => U0_U_ICON_U_CMD_iTARGET(9)
    );
  U0_U_ICON_U_CMD_G_TARGET_10_I_NE0_U_TARGET : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => U0_U_ICON_U_CMD_iTARGET_CE,
      CLR => U0_U_ICON_U_CMD_iSEL_n,
      D => U0_U_ICON_U_CMD_iTARGET(11),
      Q => U0_U_ICON_U_CMD_iTARGET(10)
    );
  U0_U_ICON_U_CMD_G_TARGET_11_I_NE0_U_TARGET : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => U0_U_ICON_U_CMD_iTARGET_CE,
      CLR => U0_U_ICON_U_CMD_iSEL_n,
      D => U0_U_ICON_iCORE_ID(0),
      Q => U0_U_ICON_U_CMD_iTARGET(11)
    );
  U0_U_ICON_U_CMD_G_TARGET_12_I_NE0_U_TARGET : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => U0_U_ICON_U_CMD_iTARGET_CE,
      CLR => U0_U_ICON_U_CMD_iSEL_n,
      D => U0_U_ICON_iCORE_ID(1),
      Q => U0_U_ICON_iCORE_ID(0)
    );
  U0_U_ICON_U_CMD_G_TARGET_13_I_NE0_U_TARGET : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => U0_U_ICON_U_CMD_iTARGET_CE,
      CLR => U0_U_ICON_U_CMD_iSEL_n,
      D => U0_U_ICON_iCORE_ID(2),
      Q => U0_U_ICON_iCORE_ID(1)
    );
  U0_U_ICON_U_CMD_G_TARGET_14_I_NE0_U_TARGET : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => U0_U_ICON_U_CMD_iTARGET_CE,
      CLR => U0_U_ICON_U_CMD_iSEL_n,
      D => U0_U_ICON_iCORE_ID(3),
      Q => U0_U_ICON_iCORE_ID(2)
    );
  U0_U_ICON_U_CMD_G_TARGET_15_I_EQ0_U_TARGET : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => U0_U_ICON_U_CMD_iTARGET_CE,
      CLR => U0_U_ICON_U_CMD_iSEL_n,
      D => CONTROL11(1),
      Q => U0_U_ICON_iCORE_ID(3)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_15_U_LUT : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(15)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_14_U_LUT : LUT4
    generic map(
      INIT => X"4000"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(14)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_13_U_LUT : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(13)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_12_U_LUT : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(12)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_11_U_LUT : LUT4
    generic map(
      INIT => X"0800"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(11)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_10_U_LUT : LUT4
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(10)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_9_U_LUT : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(9)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_8_U_LUT : LUT4
    generic map(
      INIT => X"0100"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(8)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_7_U_LUT : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(7)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_6_U_LUT : LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(6)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_5_U_LUT : LUT4
    generic map(
      INIT => X"0020"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(5)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_4_U_LUT : LUT4
    generic map(
      INIT => X"0010"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(4)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_3_U_LUT : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(3)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_2_U_LUT : LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(2)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_1_U_LUT : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(1)
    );
  U0_U_ICON_U_CMD_U_COMMAND_SEL_I4_FI_0_U_LUT : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => U0_U_ICON_U_CMD_iTARGET(8),
      I1 => U0_U_ICON_U_CMD_iTARGET(9),
      I2 => U0_U_ICON_U_CMD_iTARGET(10),
      I3 => U0_U_ICON_U_CMD_iTARGET(11),
      O => U0_U_ICON_iCOMMAND_SEL(0)
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_15_U_LUT : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_15_Q
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_14_U_LUT : LUT4
    generic map(
      INIT => X"4000"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => NLW_U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_14_U_LUT_O_UNCONNECTED
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_13_U_LUT : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => NLW_U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_13_U_LUT_O_UNCONNECTED
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_12_U_LUT : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => NLW_U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_12_U_LUT_O_UNCONNECTED
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_11_U_LUT : LUT4
    generic map(
      INIT => X"0800"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_11_Q
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_10_U_LUT : LUT4
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_10_Q
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_9_U_LUT : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_9_Q
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_8_U_LUT : LUT4
    generic map(
      INIT => X"0100"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_8_Q
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_7_U_LUT : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_7_Q
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_6_U_LUT : LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_6_Q
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_5_U_LUT : LUT4
    generic map(
      INIT => X"0020"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_5_Q
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_4_U_LUT : LUT4
    generic map(
      INIT => X"0010"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_4_Q
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_3_U_LUT : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_3_Q
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_2_U_LUT : LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_2_Q
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_1_U_LUT : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_1_Q
    );
  U0_U_ICON_U_CMD_U_CORE_ID_SEL_I4_FI_0_U_LUT : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(0),
      I1 => U0_U_ICON_iCORE_ID(1),
      I2 => U0_U_ICON_iCORE_ID(2),
      I3 => U0_U_ICON_iCORE_ID(3),
      O => U0_U_ICON_iCORE_ID_SEL_0_Q
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_0_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(20)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_0_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(4)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_1_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(21)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_1_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(5)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_2_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(22)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_2_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(6)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_3_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(23)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_3_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(7)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_4_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(24)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_4_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(8)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_5_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(25)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_5_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(9)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_6_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(26)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_6_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(10)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_7_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(27)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_7_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(11)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_8_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(28)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_8_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(12)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_9_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(29)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_9_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(13)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_10_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(30)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_10_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(14)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_11_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(31)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_11_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(15)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_12_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(32)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_12_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(16)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_13_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(33)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_13_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(17)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_14_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(34)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_14_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(18)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_15_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL0(35)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_0_F_CMD_15_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_0_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL0(19)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_0_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(20)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_0_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(4)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_1_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(21)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_1_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(5)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_2_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(22)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_2_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(6)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_3_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(23)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_3_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(7)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_4_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(24)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_4_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(8)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_5_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(25)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_5_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(9)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_6_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(26)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_6_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(10)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_7_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(27)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_7_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(11)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_8_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(28)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_8_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(12)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_9_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(29)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_9_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(13)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_10_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(30)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_10_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(14)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_11_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(31)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_11_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(15)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_12_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(32)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_12_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(16)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_13_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(33)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_13_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(17)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_14_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(34)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_14_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(18)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_15_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL1(35)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_1_F_CMD_15_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_1_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL1(19)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_0_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(20)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_0_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(4)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_1_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(21)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_1_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(5)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_2_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(22)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_2_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(6)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_3_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(23)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_3_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(7)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_4_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(24)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_4_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(8)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_5_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(25)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_5_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(9)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_6_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(26)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_6_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(10)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_7_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(27)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_7_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(11)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_8_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(28)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_8_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(12)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_9_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(29)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_9_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(13)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_10_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(30)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_10_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(14)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_11_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(31)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_11_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(15)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_12_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(32)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_12_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(16)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_13_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(33)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_13_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(17)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_14_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(34)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_14_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(18)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_15_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL2(35)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_2_F_CMD_15_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_2_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL2(19)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_0_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(20)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_0_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(4)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_1_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(21)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_1_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(5)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_2_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(22)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_2_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(6)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_3_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(23)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_3_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(7)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_4_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(24)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_4_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(8)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_5_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(25)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_5_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(9)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_6_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(26)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_6_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(10)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_7_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(27)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_7_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(11)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_8_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(28)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_8_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(12)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_9_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(29)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_9_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(13)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_10_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(30)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_10_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(14)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_11_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(31)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_11_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(15)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_12_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(32)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_12_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(16)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_13_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(33)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_13_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(17)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_14_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(34)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_14_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(18)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_15_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL3(35)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_3_F_CMD_15_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_3_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL3(19)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_0_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(20)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_0_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(4)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_1_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(21)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_1_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(5)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_2_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(22)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_2_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(6)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_3_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(23)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_3_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(7)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_4_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(24)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_4_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(8)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_5_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(25)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_5_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(9)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_6_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(26)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_6_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(10)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_7_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(27)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_7_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(11)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_8_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(28)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_8_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(12)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_9_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(29)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_9_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(13)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_10_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(30)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_10_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(14)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_11_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(31)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_11_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(15)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_12_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(32)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_12_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(16)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_13_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(33)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_13_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(17)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_14_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(34)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_14_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(18)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_15_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL4(35)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_4_F_CMD_15_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_4_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL4(19)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_0_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(20)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_0_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(4)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_1_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(21)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_1_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(5)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_2_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(22)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_2_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(6)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_3_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(23)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_3_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(7)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_4_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(24)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_4_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(8)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_5_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(25)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_5_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(9)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_6_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(26)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_6_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(10)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_7_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(27)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_7_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(11)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_8_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(28)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_8_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(12)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_9_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(29)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_9_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(13)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_10_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(30)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_10_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(14)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_11_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(31)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_11_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(15)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_12_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(32)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_12_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(16)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_13_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(33)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_13_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(17)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_14_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(34)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_14_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(18)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_15_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL5(35)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_5_F_CMD_15_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_5_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL5(19)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_0_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(20)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_0_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(4)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_1_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(21)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_1_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(5)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_2_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(22)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_2_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(6)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_3_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(23)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_3_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(7)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_4_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(24)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_4_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(8)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_5_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(25)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_5_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(9)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_6_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(26)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_6_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(10)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_7_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(27)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_7_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(11)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_8_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(28)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_8_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(12)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_9_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(29)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_9_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(13)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_10_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(30)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_10_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(14)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_11_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(31)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_11_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(15)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_12_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(32)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_12_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(16)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_13_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(33)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_13_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(17)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_14_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(34)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_14_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(18)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_15_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL6(35)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_6_F_CMD_15_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_6_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL6(19)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_0_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(20)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_0_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(4)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_1_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(21)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_1_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(5)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_2_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(22)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_2_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(6)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_3_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(23)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_3_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(7)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_4_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(24)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_4_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(8)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_5_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(25)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_5_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(9)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_6_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(26)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_6_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(10)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_7_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(27)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_7_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(11)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_8_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(28)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_8_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(12)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_9_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(29)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_9_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(13)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_10_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(30)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_10_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(14)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_11_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(31)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_11_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(15)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_12_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(32)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_12_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(16)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_13_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(33)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_13_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(17)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_14_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(34)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_14_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(18)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_15_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL7(35)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_7_F_CMD_15_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_7_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL7(19)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_0_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(20)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_0_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(4)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_1_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(21)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_1_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(5)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_2_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(22)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_2_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(6)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_3_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(23)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_3_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(7)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_4_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(24)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_4_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(8)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_5_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(25)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_5_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(9)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_6_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(26)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_6_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(10)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_7_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(27)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_7_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(11)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_8_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(28)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_8_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(12)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_9_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(29)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_9_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(13)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_10_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(30)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_10_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(14)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_11_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(31)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_11_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(15)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_12_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(32)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_12_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(16)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_13_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(33)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_13_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(17)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_14_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(34)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_14_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(18)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_15_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL8(35)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_8_F_CMD_15_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_8_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL8(19)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_0_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(20)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_0_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(4)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_1_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(21)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_1_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(5)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_2_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(22)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_2_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(6)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_3_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(23)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_3_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(7)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_4_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(24)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_4_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(8)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_5_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(25)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_5_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(9)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_6_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(26)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_6_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(10)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_7_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(27)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_7_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(11)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_8_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(28)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_8_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(12)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_9_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(29)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_9_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(13)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_10_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(30)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_10_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(14)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_11_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(31)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_11_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(15)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_12_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(32)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_12_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(16)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_13_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(33)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_13_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(17)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_14_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(34)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_14_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(18)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_15_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL9(35)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_9_F_CMD_15_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_9_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL9(19)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_0_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(20)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_0_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(4)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_1_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(21)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_1_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(5)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_2_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(22)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_2_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(6)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_3_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(23)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_3_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(7)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_4_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(24)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_4_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(8)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_5_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(25)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_5_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(9)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_6_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(26)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_6_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(10)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_7_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(27)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_7_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(11)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_8_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(28)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_8_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(12)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_9_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(29)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_9_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(13)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_10_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(30)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_10_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(14)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_11_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(31)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_11_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(15)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_12_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(32)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_12_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(16)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_13_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(33)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_13_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(17)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_14_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(34)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_14_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(18)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_15_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL10(35)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_10_F_CMD_15_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_10_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL10(19)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_0_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(20)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_0_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(4)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_1_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(21)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_1_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(1),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(5)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_2_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(22)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_2_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(2),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(6)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_3_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(23)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_3_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(3),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(7)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_4_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(24)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_4_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(4),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(8)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_5_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(25)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_5_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(5),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(9)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_6_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(26)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_6_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(6),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(10)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_7_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(27)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_7_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(7),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(11)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_8_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(28)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_8_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(8),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(12)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_9_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(29)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_9_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(9),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(13)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_10_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(30)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_10_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(10),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(14)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_11_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(31)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_11_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(11),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(15)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_12_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(32)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_12_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(12),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(16)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_13_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(33)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_13_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(13),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(17)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_14_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(34)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_14_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(14),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(18)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_15_U_HCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1),
      O => CONTROL11(35)
    );
  U0_U_ICON_U_CTRL_OUT_F_NCP_11_F_CMD_15_U_LCE : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_CTRL_OUT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(15),
      I2 => U0_U_ICON_iCORE_ID_SEL_11_Q,
      I3 => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0),
      O => CONTROL11(19)
    );
  U0_U_ICON_U_CTRL_OUT_U_CMDGRP1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_U_ICON_iCOMMAND_GRP(0),
      I1 => U0_U_ICON_iCOMMAND_GRP(1),
      O => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(1)
    );
  U0_U_ICON_U_CTRL_OUT_U_CMDGRP0 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_U_ICON_iCOMMAND_GRP(0),
      I1 => U0_U_ICON_iCOMMAND_GRP(1),
      O => U0_U_ICON_U_CTRL_OUT_iCOMMAND_GRP_SEL(0)
    );
  U0_U_ICON_U_CTRL_OUT_U_DATA_VALID : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_U_ICON_iSYNC,
      I1 => U0_iSHIFT_OUT,
      O => U0_U_ICON_U_CTRL_OUT_iDATA_VALID
    );
  U0_U_ICON_U_STAT_U_TDO_next : MUXF6
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT_LOW,
      I1 => U0_U_ICON_U_STAT_iSTAT_HIGH,
      S => U0_U_ICON_U_STAT_iSTAT_CNT(5),
      O => U0_U_ICON_U_STAT_iTDO_next
    );
  U0_U_ICON_U_STAT_U_STAT_LOW : MUXF5
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT(0),
      I1 => U0_U_ICON_U_STAT_iSTAT(1),
      S => U0_U_ICON_U_STAT_iSTAT_CNT(4),
      O => U0_U_ICON_U_STAT_iSTAT_LOW
    );
  U0_U_ICON_U_STAT_U_STAT_HIGH : MUXF5
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT(2),
      I1 => U0_U_ICON_U_STAT_iSTAT(3),
      S => U0_U_ICON_U_STAT_iSTAT_CNT(4),
      O => U0_U_ICON_U_STAT_iSTAT_HIGH
    );
  U0_U_ICON_U_STAT_F_STAT_0_U_STAT : LUT4
    generic map(
      INIT => X"0101"
    )
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT_CNT(0),
      I1 => U0_U_ICON_U_STAT_iSTAT_CNT(1),
      I2 => U0_U_ICON_U_STAT_iSTAT_CNT(2),
      I3 => U0_U_ICON_U_STAT_iSTAT_CNT(3),
      O => U0_U_ICON_U_STAT_iSTAT(0)
    );
  U0_U_ICON_U_STAT_F_STAT_1_U_STAT : LUT4
    generic map(
      INIT => X"C101"
    )
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT_CNT(0),
      I1 => U0_U_ICON_U_STAT_iSTAT_CNT(1),
      I2 => U0_U_ICON_U_STAT_iSTAT_CNT(2),
      I3 => U0_U_ICON_U_STAT_iSTAT_CNT(3),
      O => U0_U_ICON_U_STAT_iSTAT(1)
    );
  U0_U_ICON_U_STAT_F_STAT_2_U_STAT : LUT4
    generic map(
      INIT => X"2100"
    )
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT_CNT(0),
      I1 => U0_U_ICON_U_STAT_iSTAT_CNT(1),
      I2 => U0_U_ICON_U_STAT_iSTAT_CNT(2),
      I3 => U0_U_ICON_U_STAT_iSTAT_CNT(3),
      O => U0_U_ICON_U_STAT_iSTAT(2)
    );
  U0_U_ICON_U_STAT_F_STAT_3_U_STAT : LUT4
    generic map(
      INIT => X"C610"
    )
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT_CNT(0),
      I1 => U0_U_ICON_U_STAT_iSTAT_CNT(1),
      I2 => U0_U_ICON_U_STAT_iSTAT_CNT(2),
      I3 => U0_U_ICON_U_STAT_iSTAT_CNT(3),
      O => U0_U_ICON_U_STAT_iSTAT(3)
    );
  U0_U_ICON_U_STAT_U_STATCMD_n : INV
    port map (
      I => U0_U_ICON_U_STAT_iSTATCMD_CE,
      O => U0_U_ICON_U_STAT_iSTATCMD_CE_n
    );
  U0_U_ICON_U_STAT_U_CMDGRP0 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_U_ICON_iCOMMAND_GRP(0),
      I1 => U0_U_ICON_iCOMMAND_GRP(1),
      O => U0_U_ICON_U_STAT_iCMD_GRP0_SEL
    );
  U0_U_ICON_U_STAT_U_STATCMD : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_U_ICON_U_STAT_iDATA_VALID,
      I1 => U0_U_ICON_iCOMMAND_SEL(0),
      I2 => U0_U_ICON_iCORE_ID_SEL_15_Q,
      I3 => U0_U_ICON_U_STAT_iCMD_GRP0_SEL,
      O => U0_U_ICON_U_STAT_iSTATCMD_CE
    );
  U0_U_ICON_U_STAT_U_DATA_VALID : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_U_ICON_iSYNC,
      I1 => U0_iSHIFT_OUT,
      O => U0_U_ICON_U_STAT_iDATA_VALID
    );
  U0_U_ICON_U_STAT_U_TDO : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => N0,
      D => U0_U_ICON_U_STAT_iTDO_next,
      Q => U0_U_ICON_iTDO_VEC(15)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_0_U_XORCY : XORCY
    port map (
      CI => N0,
      LI => U0_U_ICON_U_STAT_U_STAT_CNT_S(0),
      O => U0_U_ICON_U_STAT_U_STAT_CNT_D(0)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_0_GnH_U_MUXCY : MUXCY_L
    port map (
      CI => N0,
      DI => CONTROL11(2),
      S => U0_U_ICON_U_STAT_U_STAT_CNT_S(0),
      LO => U0_U_ICON_U_STAT_U_STAT_CNT_CI(1)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_1_U_XORCY : XORCY
    port map (
      CI => U0_U_ICON_U_STAT_U_STAT_CNT_CI(1),
      LI => U0_U_ICON_U_STAT_U_STAT_CNT_S(1),
      O => U0_U_ICON_U_STAT_U_STAT_CNT_D(1)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_1_GnH_U_MUXCY : MUXCY_L
    port map (
      CI => U0_U_ICON_U_STAT_U_STAT_CNT_CI(1),
      DI => CONTROL11(2),
      S => U0_U_ICON_U_STAT_U_STAT_CNT_S(1),
      LO => U0_U_ICON_U_STAT_U_STAT_CNT_CI(2)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_2_U_XORCY : XORCY
    port map (
      CI => U0_U_ICON_U_STAT_U_STAT_CNT_CI(2),
      LI => U0_U_ICON_U_STAT_U_STAT_CNT_S(2),
      O => U0_U_ICON_U_STAT_U_STAT_CNT_D(2)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_2_GnH_U_MUXCY : MUXCY_L
    port map (
      CI => U0_U_ICON_U_STAT_U_STAT_CNT_CI(2),
      DI => CONTROL11(2),
      S => U0_U_ICON_U_STAT_U_STAT_CNT_S(2),
      LO => U0_U_ICON_U_STAT_U_STAT_CNT_CI(3)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_3_U_XORCY : XORCY
    port map (
      CI => U0_U_ICON_U_STAT_U_STAT_CNT_CI(3),
      LI => U0_U_ICON_U_STAT_U_STAT_CNT_S(3),
      O => U0_U_ICON_U_STAT_U_STAT_CNT_D(3)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_3_GnH_U_MUXCY : MUXCY_L
    port map (
      CI => U0_U_ICON_U_STAT_U_STAT_CNT_CI(3),
      DI => CONTROL11(2),
      S => U0_U_ICON_U_STAT_U_STAT_CNT_S(3),
      LO => U0_U_ICON_U_STAT_U_STAT_CNT_CI(4)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_4_U_XORCY : XORCY
    port map (
      CI => U0_U_ICON_U_STAT_U_STAT_CNT_CI(4),
      LI => U0_U_ICON_U_STAT_U_STAT_CNT_S(4),
      O => U0_U_ICON_U_STAT_U_STAT_CNT_D(4)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_4_GnH_U_MUXCY : MUXCY_L
    port map (
      CI => U0_U_ICON_U_STAT_U_STAT_CNT_CI(4),
      DI => CONTROL11(2),
      S => U0_U_ICON_U_STAT_U_STAT_CNT_S(4),
      LO => U0_U_ICON_U_STAT_U_STAT_CNT_CI(5)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_5_U_XORCY : XORCY
    port map (
      CI => U0_U_ICON_U_STAT_U_STAT_CNT_CI(5),
      LI => U0_U_ICON_U_STAT_U_STAT_CNT_S(5),
      O => U0_U_ICON_U_STAT_U_STAT_CNT_D(5)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_0_U_LUT : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT_CNT(0),
      O => U0_U_ICON_U_STAT_U_STAT_CNT_S(0)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_1_U_LUT : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT_CNT(1),
      O => U0_U_ICON_U_STAT_U_STAT_CNT_S(1)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_2_U_LUT : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT_CNT(2),
      O => U0_U_ICON_U_STAT_U_STAT_CNT_S(2)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_3_U_LUT : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT_CNT(3),
      O => U0_U_ICON_U_STAT_U_STAT_CNT_S(3)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_4_U_LUT : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT_CNT(4),
      O => U0_U_ICON_U_STAT_U_STAT_CNT_S(4)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_5_U_LUT : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_U_ICON_U_STAT_iSTAT_CNT(5),
      O => U0_U_ICON_U_STAT_U_STAT_CNT_S(5)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_0_U_FDRE : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => N0,
      D => U0_U_ICON_U_STAT_U_STAT_CNT_D(0),
      R => U0_U_ICON_U_STAT_iSTATCMD_CE_n,
      Q => U0_U_ICON_U_STAT_iSTAT_CNT(0)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_1_U_FDRE : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => N0,
      D => U0_U_ICON_U_STAT_U_STAT_CNT_D(1),
      R => U0_U_ICON_U_STAT_iSTATCMD_CE_n,
      Q => U0_U_ICON_U_STAT_iSTAT_CNT(1)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_2_U_FDRE : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => N0,
      D => U0_U_ICON_U_STAT_U_STAT_CNT_D(2),
      R => U0_U_ICON_U_STAT_iSTATCMD_CE_n,
      Q => U0_U_ICON_U_STAT_iSTAT_CNT(2)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_3_U_FDRE : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => N0,
      D => U0_U_ICON_U_STAT_U_STAT_CNT_D(3),
      R => U0_U_ICON_U_STAT_iSTATCMD_CE_n,
      Q => U0_U_ICON_U_STAT_iSTAT_CNT(3)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_4_U_FDRE : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => N0,
      D => U0_U_ICON_U_STAT_U_STAT_CNT_D(4),
      R => U0_U_ICON_U_STAT_iSTATCMD_CE_n,
      Q => U0_U_ICON_U_STAT_iSTAT_CNT(4)
    );
  U0_U_ICON_U_STAT_U_STAT_CNT_G_5_U_FDRE : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => N0,
      D => U0_U_ICON_U_STAT_U_STAT_CNT_D(5),
      R => U0_U_ICON_U_STAT_iSTATCMD_CE_n,
      Q => U0_U_ICON_U_STAT_iSTAT_CNT(5)
    );
  U0_U_ICON_U_SYNC_U_GOT_SYNC_L : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => U0_U_ICON_U_SYNC_iSYNC_WORD(0),
      I1 => U0_U_ICON_U_SYNC_iSYNC_WORD(1),
      I2 => U0_U_ICON_U_SYNC_iSYNC_WORD(2),
      I3 => U0_U_ICON_U_SYNC_iSYNC_WORD(3),
      O => U0_U_ICON_U_SYNC_iGOT_SYNC_LOW
    );
  U0_U_ICON_U_SYNC_U_GOT_SYNC : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_U_ICON_U_SYNC_iGOT_SYNC_LOW,
      I1 => U0_U_ICON_U_SYNC_iGOT_SYNC_HIGH,
      O => U0_U_ICON_U_SYNC_iGOT_SYNC
    );
  U0_U_ICON_U_SYNC_U_iDATA_CMD_n : INV
    port map (
      I => U0_U_ICON_iDATA_CMD,
      O => U0_U_ICON_U_SYNC_iDATA_CMD_n
    );
  U0_U_ICON_U_SYNC_U_GOT_SYNC_H : LUT4
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => U0_U_ICON_U_SYNC_iSYNC_WORD(4),
      I1 => U0_U_ICON_U_SYNC_iSYNC_WORD(5),
      I2 => U0_U_ICON_U_SYNC_iSYNC_WORD(6),
      I3 => CONTROL11(1),
      O => U0_U_ICON_U_SYNC_iGOT_SYNC_HIGH
    );
  U0_U_ICON_U_SYNC_U_SYNC : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      CE => U0_U_ICON_U_SYNC_iGOT_SYNC,
      D => N0,
      R => U0_U_ICON_U_SYNC_iDATA_CMD_n,
      Q => U0_U_ICON_iSYNC
    );
  U0_U_ICON_U_SYNC_G_SYNC_WORD_0_I_NE0_U_FDR : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      D => U0_U_ICON_U_SYNC_iSYNC_WORD(1),
      R => U0_U_ICON_U_SYNC_iDATA_CMD_n,
      Q => U0_U_ICON_U_SYNC_iSYNC_WORD(0)
    );
  U0_U_ICON_U_SYNC_G_SYNC_WORD_1_I_NE0_U_FDR : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      D => U0_U_ICON_U_SYNC_iSYNC_WORD(2),
      R => U0_U_ICON_U_SYNC_iDATA_CMD_n,
      Q => U0_U_ICON_U_SYNC_iSYNC_WORD(1)
    );
  U0_U_ICON_U_SYNC_G_SYNC_WORD_2_I_NE0_U_FDR : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      D => U0_U_ICON_U_SYNC_iSYNC_WORD(3),
      R => U0_U_ICON_U_SYNC_iDATA_CMD_n,
      Q => U0_U_ICON_U_SYNC_iSYNC_WORD(2)
    );
  U0_U_ICON_U_SYNC_G_SYNC_WORD_3_I_NE0_U_FDR : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      D => U0_U_ICON_U_SYNC_iSYNC_WORD(4),
      R => U0_U_ICON_U_SYNC_iDATA_CMD_n,
      Q => U0_U_ICON_U_SYNC_iSYNC_WORD(3)
    );
  U0_U_ICON_U_SYNC_G_SYNC_WORD_4_I_NE0_U_FDR : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      D => U0_U_ICON_U_SYNC_iSYNC_WORD(5),
      R => U0_U_ICON_U_SYNC_iDATA_CMD_n,
      Q => U0_U_ICON_U_SYNC_iSYNC_WORD(4)
    );
  U0_U_ICON_U_SYNC_G_SYNC_WORD_5_I_NE0_U_FDR : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      D => U0_U_ICON_U_SYNC_iSYNC_WORD(6),
      R => U0_U_ICON_U_SYNC_iDATA_CMD_n,
      Q => U0_U_ICON_U_SYNC_iSYNC_WORD(5)
    );
  U0_U_ICON_U_SYNC_G_SYNC_WORD_6_I_EQ0_U_FDR : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => CONTROL11(0),
      D => CONTROL11(1),
      R => U0_U_ICON_U_SYNC_iDATA_CMD_n,
      Q => U0_U_ICON_U_SYNC_iSYNC_WORD(6)
    );
  U0_U_ICON_iCORE_ID_3_1 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => U0_U_ICON_iCORE_ID(2),
      I1 => U0_U_ICON_iCORE_ID(3),
      I2 => U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_7_400,
      I3 => U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_8_402,
      I4 => U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_71_401,
      I5 => U0_U_ICON_U_TDO_MUX_U_CS_MUX_I4_U_MUX16_Mmux_O_6_399,
      O => U0_U_ICON_iTDO_next
    );

end STRUCTURE;

-- synthesis translate_on
