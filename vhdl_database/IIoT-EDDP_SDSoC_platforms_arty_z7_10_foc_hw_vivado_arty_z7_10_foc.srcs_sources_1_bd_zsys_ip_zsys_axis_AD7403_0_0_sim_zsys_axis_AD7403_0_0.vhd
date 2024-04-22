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

-- IP VLNV: trenz.biz:user:axis_AD7403:1.0
-- IP Revision: 26

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY zsys_axis_AD7403_0_0 IS
  PORT (
    din : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    clkout : OUT STD_LOGIC;
    update : OUT STD_LOGIC;
    m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axis_tready : IN STD_LOGIC;
    m_axis_tvalid : OUT STD_LOGIC;
    m_axis_aclk : IN STD_LOGIC;
    m_axis_aresetn : IN STD_LOGIC
  );
END zsys_axis_AD7403_0_0;

ARCHITECTURE zsys_axis_AD7403_0_0_arch OF zsys_axis_AD7403_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF zsys_axis_AD7403_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT axis_AD7403_v1_0 IS
    GENERIC (
      C_DECIMATION : INTEGER;
      C_IMPLEMENTATION : INTEGER;
      C_CLOCK_RATIO : INTEGER;
      C_CHANNELS : INTEGER;
      C_M_AXIS_TDEST_WIDTH : INTEGER;
      C_M_AXIS_TDATA_WIDTH : INTEGER;
      C_OUT_TYPE : INTEGER;
      C_DATA_BITS : INTEGER;
      C_SIGNED : BOOLEAN
    );
    PORT (
      din : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      dec_ratio : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      clkout : OUT STD_LOGIC;
      update : OUT STD_LOGIC;
      m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axis_tdest : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axis_tready : IN STD_LOGIC;
      m_axis_tvalid : OUT STD_LOGIC;
      m_axis_aclk : IN STD_LOGIC;
      m_axis_aresetn : IN STD_LOGIC
    );
  END COMPONENT axis_AD7403_v1_0;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 m_axis_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 m_axis_aresetn RST";
BEGIN
  U0 : axis_AD7403_v1_0
    GENERIC MAP (
      C_DECIMATION => 128,
      C_IMPLEMENTATION => 0,
      C_CLOCK_RATIO => 1,
      C_CHANNELS => 4,
      C_M_AXIS_TDEST_WIDTH => 2,
      C_M_AXIS_TDATA_WIDTH => 64,
      C_OUT_TYPE => 1,
      C_DATA_BITS => 16,
      C_SIGNED => true
    )
    PORT MAP (
      din => din,
      dec_ratio => STD_LOGIC_VECTOR(TO_UNSIGNED(32, 16)),
      clkout => clkout,
      update => update,
      m_axis_tdata => m_axis_tdata,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      m_axis_aclk => m_axis_aclk,
      m_axis_aresetn => m_axis_aresetn
    );
END zsys_axis_AD7403_0_0_arch;
