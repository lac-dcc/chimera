-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1_sdx (win64) Build 1881615 Tue May 16 18:39:18 MDT 2017
-- Date        : Fri Oct  6 12:15:16 2017
-- Host        : W7-64-12 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               B:/SVN/cores/2017.1/design/TEC0053/platforms/arty_z7_20_foc/hw/vivado/arty_z7_20_foc.srcs/sources_1/bd/zsys/ip/zsys_clk_mux_0_0/zsys_clk_mux_0_0_sim_netlist.vhdl
-- Design      : zsys_clk_mux_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_clk_mux_0_0_clk_mux is
  port (
    clkout : out STD_LOGIC;
    clk0 : in STD_LOGIC;
    clk1 : in STD_LOGIC;
    sel : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of zsys_clk_mux_0_0_clk_mux : entity is "clk_mux";
end zsys_clk_mux_0_0_clk_mux;

architecture STRUCTURE of zsys_clk_mux_0_0_clk_mux is
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of BUFGMUX_inst : label is "BUFGMUX";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of BUFGMUX_inst : label is "S:CE1,CE0";
  attribute box_type : string;
  attribute box_type of BUFGMUX_inst : label is "PRIMITIVE";
begin
BUFGMUX_inst: unisim.vcomponents.BUFGCTRL
    generic map(
      INIT_OUT => 0,
      IS_CE0_INVERTED => '1',
      PRESELECT_I0 => true,
      PRESELECT_I1 => false
    )
        port map (
      CE0 => sel,
      CE1 => sel,
      I0 => clk0,
      I1 => clk1,
      IGNORE0 => '0',
      IGNORE1 => '0',
      O => clkout,
      S0 => '1',
      S1 => '1'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zsys_clk_mux_0_0 is
  port (
    clk0 : in STD_LOGIC;
    clk1 : in STD_LOGIC;
    sel : in STD_LOGIC;
    clkout : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of zsys_clk_mux_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of zsys_clk_mux_0_0 : entity is "zsys_clk_mux_0_0,clk_mux,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of zsys_clk_mux_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of zsys_clk_mux_0_0 : entity is "clk_mux,Vivado 2017.1_sdx";
end zsys_clk_mux_0_0;

architecture STRUCTURE of zsys_clk_mux_0_0 is
begin
U0: entity work.zsys_clk_mux_0_0_clk_mux
     port map (
      clk0 => clk0,
      clk1 => clk1,
      clkout => clkout,
      sel => sel
    );
end STRUCTURE;
