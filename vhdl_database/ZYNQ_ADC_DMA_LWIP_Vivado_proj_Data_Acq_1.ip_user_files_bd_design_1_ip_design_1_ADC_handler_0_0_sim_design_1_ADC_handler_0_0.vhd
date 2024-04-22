-- (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: xilinx.com:module_ref:ADC_handler:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_ADC_handler_0_0 IS
  PORT (
    clk_80M : IN STD_LOGIC;
    clk_10M : IN STD_LOGIC;
    clk_160M : IN STD_LOGIC;
    ADC_in_A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    ADC_in_B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    LED_tog : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DDS_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    DDS_valid : IN STD_LOGIC;
    Fir_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    Fir_valid : OUT STD_LOGIC
  );
END design_1_ADC_handler_0_0;

ARCHITECTURE design_1_ADC_handler_0_0_arch OF design_1_ADC_handler_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_ADC_handler_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT ADC_handler IS
    PORT (
      clk_80M : IN STD_LOGIC;
      clk_10M : IN STD_LOGIC;
      clk_160M : IN STD_LOGIC;
      ADC_in_A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      ADC_in_B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      LED_tog : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      DDS_data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      DDS_valid : IN STD_LOGIC;
      Fir_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      Fir_valid : OUT STD_LOGIC
    );
  END COMPONENT ADC_handler;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_1_ADC_handler_0_0_arch: ARCHITECTURE IS "module_ref";
BEGIN
  U0 : ADC_handler
    PORT MAP (
      clk_80M => clk_80M,
      clk_10M => clk_10M,
      clk_160M => clk_160M,
      ADC_in_A => ADC_in_A,
      ADC_in_B => ADC_in_B,
      LED_tog => LED_tog,
      DDS_data => DDS_data,
      DDS_valid => DDS_valid,
      Fir_data => Fir_data,
      Fir_valid => Fir_valid
    );
END design_1_ADC_handler_0_0_arch;
