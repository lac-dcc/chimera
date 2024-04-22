-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:compute_weight_2:1.0
-- IP Revision: 1904051711

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY compute_weight_compute_weight_2_0_0 IS
  PORT (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    input_r_TVALID : IN STD_LOGIC;
    input_r_TREADY : OUT STD_LOGIC;
    input_r_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    input_r_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    output_r_TVALID : OUT STD_LOGIC;
    output_r_TREADY : IN STD_LOGIC;
    output_r_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    output_r_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END compute_weight_compute_weight_2_0_0;

ARCHITECTURE compute_weight_compute_weight_2_0_0_arch OF compute_weight_compute_weight_2_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF compute_weight_compute_weight_2_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT compute_weight_2 IS
    PORT (
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      input_r_TVALID : IN STD_LOGIC;
      input_r_TREADY : OUT STD_LOGIC;
      input_r_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      input_r_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      output_r_TVALID : OUT STD_LOGIC;
      output_r_TREADY : IN STD_LOGIC;
      output_r_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      output_r_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
  END COMPONENT compute_weight_2;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF compute_weight_compute_weight_2_0_0_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF output_r_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 output_r TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF output_r_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 output_r TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF output_r_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 output_r TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF output_r_TVALID: SIGNAL IS "XIL_INTERFACENAME output_r, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {}" & 
" format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {float {sigwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 24}}}}} TDATA_WIDTH 32}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CL" & 
"K_DOMAIN compute_weight_processing_system7_0_0_FCLK_CLK0";
  ATTRIBUTE X_INTERFACE_INFO OF output_r_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 output_r TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF input_r_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 input_r TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF input_r_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 input_r TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF input_r_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 input_r TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF input_r_TVALID: SIGNAL IS "XIL_INTERFACENAME input_r, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, LAYERED_METADATA undef, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN compute_weight_processing_system7_0_0_FCLK_CLK0";
  ATTRIBUTE X_INTERFACE_INFO OF input_r_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 input_r TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF input_r:output_r, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMA" & 
"IN compute_weight_processing_system7_0_0_FCLK_CLK0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
BEGIN
  U0 : compute_weight_2
    PORT MAP (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      input_r_TVALID => input_r_TVALID,
      input_r_TREADY => input_r_TREADY,
      input_r_TDATA => input_r_TDATA,
      input_r_TLAST => input_r_TLAST,
      output_r_TVALID => output_r_TVALID,
      output_r_TREADY => output_r_TREADY,
      output_r_TDATA => output_r_TDATA,
      output_r_TLAST => output_r_TLAST
    );
END compute_weight_compute_weight_2_0_0_arch;
