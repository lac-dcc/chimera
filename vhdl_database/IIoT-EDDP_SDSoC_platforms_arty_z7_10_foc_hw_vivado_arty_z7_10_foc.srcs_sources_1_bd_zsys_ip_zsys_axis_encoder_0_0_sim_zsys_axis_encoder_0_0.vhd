-- (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: trenz.biz:user:axis_encoder:1.0
-- IP Revision: 39

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY zsys_axis_encoder_0_0 IS
  PORT (
    A : IN STD_LOGIC;
    B : IN STD_LOGIC;
    I : IN STD_LOGIC;
    angle_data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    period_data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    rpm_data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    axis_aclk : IN STD_LOGIC;
    axis_aresetn : IN STD_LOGIC;
    m_angle_tvalid : OUT STD_LOGIC;
    m_angle_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_angle_tready : IN STD_LOGIC;
    m_rpm_tvalid : OUT STD_LOGIC;
    m_rpm_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_rpm_tready : IN STD_LOGIC
  );
END zsys_axis_encoder_0_0;

ARCHITECTURE zsys_axis_encoder_0_0_arch OF zsys_axis_encoder_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF zsys_axis_encoder_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT axis_encoder_v1_0 IS
    GENERIC (
      C_M_AXIS_TDATA_WIDTH : INTEGER; -- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
      C_FILTER_WIDTH : INTEGER;
      C_CPR : INTEGER;
      C_OUT_PERIOD : INTEGER;
      C_ANGLE_AXIS : BOOLEAN;
      C_PERIOD_AXIS : BOOLEAN;
      C_RPM_AXIS : BOOLEAN;
      C_USE_SHIFT : BOOLEAN;
      C_INVERS_DIR : BOOLEAN;
      C_CLK_FREQ : INTEGER
    );
    PORT (
      angle_shift : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      A : IN STD_LOGIC;
      B : IN STD_LOGIC;
      I : IN STD_LOGIC;
      angle_data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      period_data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      rpm_data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      axis_aclk : IN STD_LOGIC;
      axis_aresetn : IN STD_LOGIC;
      m_period_tvalid : OUT STD_LOGIC;
      m_period_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      m_period_tready : IN STD_LOGIC;
      m_angle_tvalid : OUT STD_LOGIC;
      m_angle_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      m_angle_tready : IN STD_LOGIC;
      m_rpm_tvalid : OUT STD_LOGIC;
      m_rpm_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      m_rpm_tready : IN STD_LOGIC
    );
  END COMPONENT axis_encoder_v1_0;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 axis_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 axis_aresetn RST";
  ATTRIBUTE X_INTERFACE_INFO OF m_angle_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 m_angle TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_angle_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 m_angle TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_angle_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 m_angle TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_rpm_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 m_rpm TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_rpm_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 m_rpm TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_rpm_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 m_rpm TREADY";
BEGIN
  U0 : axis_encoder_v1_0
    GENERIC MAP (
      C_M_AXIS_TDATA_WIDTH => 16,
      C_FILTER_WIDTH => 32,
      C_CPR => 1000,
      C_OUT_PERIOD => 64,
      C_ANGLE_AXIS => true,
      C_PERIOD_AXIS => false,
      C_RPM_AXIS => true,
      C_USE_SHIFT => false,
      C_INVERS_DIR => false,
      C_CLK_FREQ => 100000000
    )
    PORT MAP (
      angle_shift => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 16)),
      A => A,
      B => B,
      I => I,
      angle_data => angle_data,
      period_data => period_data,
      rpm_data => rpm_data,
      axis_aclk => axis_aclk,
      axis_aresetn => axis_aresetn,
      m_period_tready => '1',
      m_angle_tvalid => m_angle_tvalid,
      m_angle_tdata => m_angle_tdata,
      m_angle_tready => m_angle_tready,
      m_rpm_tvalid => m_rpm_tvalid,
      m_rpm_tdata => m_rpm_tdata,
      m_rpm_tready => m_rpm_tready
    );
END zsys_axis_encoder_0_0_arch;
