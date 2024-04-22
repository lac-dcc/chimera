-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Fri Jan 31 21:09:13 2020
-- Design      : TDC_clk_wiz_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TDC_clk_wiz_1_0_TDC_clk_wiz_1_0_clk_wiz is
  port (
    clk_600MHz_CalibrationShift : out STD_LOGIC;
    daddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dclk : in STD_LOGIC;
    den : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drdy : out STD_LOGIC;
    dwe : in STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of TDC_clk_wiz_1_0_TDC_clk_wiz_1_0_clk_wiz : entity is "TDC_clk_wiz_1_0_clk_wiz";
end TDC_clk_wiz_1_0_TDC_clk_wiz_1_0_clk_wiz;

architecture STRUCTURE of TDC_clk_wiz_1_0_TDC_clk_wiz_1_0_clk_wiz is
  signal clk_600MHz_CalibrationShift_TDC_clk_wiz_1_0 : STD_LOGIC;
  signal clk_in1_TDC_clk_wiz_1_0 : STD_LOGIC;
  signal NLW_mmcme4_adv_inst_CDDCDONE_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CDDCDONE_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKFBIN_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKFBIN_UNCONNECTED is never written"
  signal NLW_mmcme4_adv_inst_CLKFBOUT_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKFBOUT_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKFBOUTB_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKFBSTOPPED_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKINSTOPPED_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKOUT0B_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKOUT1_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKOUT1_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKOUT1B_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKOUT2_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKOUT2B_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKOUT3_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKOUT3B_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKOUT4_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKOUT5_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_CLKOUT6_UNCONNECTED is never read"
  signal NLW_mmcme4_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC; -- @suppress "signal NLW_mmcme4_adv_inst_PSDONE_UNCONNECTED is never read"
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkin1_ibuf : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibuf : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibuf : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibuf : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of clkout1_buf : label is "BUFG";
  attribute BOX_TYPE of mmcme4_adv_inst : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of mmcme4_adv_inst : label is "MLO";
begin
clkin1_ibuf: unisim.vcomponents.IBUF
    generic map(
      CAPACITANCE => "DONT_CARE",
      IBUF_DELAY_VALUE => "0",
      IBUF_LOW_PWR => true,
      IFD_DELAY_VALUE => "AUTO",
      IOSTANDARD => "DEFAULT"
    )
        port map (
      O => clk_in1_TDC_clk_wiz_1_0,
      I => clk_in1
    );
clkout1_buf: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "ASYNC",
      IS_CE_INVERTED => '0',
      IS_I_INVERTED => '0',
      SIM_DEVICE => "ULTRASCALE_PLUS",
      STARTUP_SYNC => "FALSE"
    )
        port map (
      O => clk_600MHz_CalibrationShift,
      CE => '1',
      I => clk_600MHz_CalibrationShift_TDC_clk_wiz_1_0
    );
mmcme4_adv_inst: unisim.vcomponents.MMCME4_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 4.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => "FALSE",
      CLKIN1_PERIOD => 1.667000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 2.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => "FALSE",
      CLKOUT1_DIVIDE => 1,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => "FALSE",
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => "FALSE",
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => "FALSE",
      CLKOUT4_CASCADE => "FALSE",
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => "FALSE",
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => "FALSE",
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => "FALSE",
      COMPENSATION => "INTERNAL",
      DIVCLK_DIVIDE => 2,
      IS_CLKFBIN_INVERTED => '0',
      IS_CLKIN1_INVERTED => '0',
      IS_CLKIN2_INVERTED => '0',
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => "FALSE"
    )
        port map (
      CDDCDONE => NLW_mmcme4_adv_inst_CDDCDONE_UNCONNECTED,
      CDDCREQ => '0',
      CLKFBIN => NLW_mmcme4_adv_inst_CLKFBIN_UNCONNECTED,
      CLKFBOUT => NLW_mmcme4_adv_inst_CLKFBOUT_UNCONNECTED,
      CLKFBOUTB => NLW_mmcme4_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcme4_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_in1_TDC_clk_wiz_1_0,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcme4_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk_600MHz_CalibrationShift_TDC_clk_wiz_1_0,
      CLKOUT0B => NLW_mmcme4_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => NLW_mmcme4_adv_inst_CLKOUT1_UNCONNECTED,
      CLKOUT1B => NLW_mmcme4_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => NLW_mmcme4_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT2B => NLW_mmcme4_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => NLW_mmcme4_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT3B => NLW_mmcme4_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_mmcme4_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_mmcme4_adv_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_mmcme4_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => daddr(6 downto 0),
      DCLK => dclk,
      DEN => den,
      DI(15 downto 0) => din(15 downto 0),
      DO(15 downto 0) => dout(15 downto 0),
      DRDY => drdy,
      DWE => dwe,
      LOCKED => locked,
      PSCLK => '0',
      PSDONE => NLW_mmcme4_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TDC_clk_wiz_1_0 is
  port (
    clk_600MHz_CalibrationShift : out STD_LOGIC;
    daddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dclk : in STD_LOGIC;
    den : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drdy : out STD_LOGIC;
    dwe : in STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of TDC_clk_wiz_1_0 : entity is true;
end TDC_clk_wiz_1_0;

architecture STRUCTURE of TDC_clk_wiz_1_0 is
begin
inst: entity work.TDC_clk_wiz_1_0_TDC_clk_wiz_1_0_clk_wiz
     port map (
      clk_600MHz_CalibrationShift => clk_600MHz_CalibrationShift,
      clk_in1 => clk_in1,
      daddr(6 downto 0) => daddr(6 downto 0),
      dclk => dclk,
      den => den,
      din(15 downto 0) => din(15 downto 0),
      dout(15 downto 0) => dout(15 downto 0),
      drdy => drdy,
      dwe => dwe,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
