-- (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: xilinx.com:ip:c_shift_ram:12.0
-- IP Revision: 11

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY c_shift_ram_v12_0_11;
USE c_shift_ram_v12_0_11.c_shift_ram_v12_0_11;

ENTITY c_shift_ram_0 IS
  PORT (
    D : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    CLK : IN STD_LOGIC;
    CE : IN STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END c_shift_ram_0;

ARCHITECTURE c_shift_ram_0_arch OF c_shift_ram_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF c_shift_ram_0_arch: ARCHITECTURE IS "yes";
  COMPONENT c_shift_ram_v12_0_11 IS
    GENERIC (
      C_XDEVICEFAMILY : STRING;
      C_VERBOSITY : INTEGER;
      C_WIDTH : INTEGER;
      C_DEPTH : INTEGER;
      C_ADDR_WIDTH : INTEGER;
      C_SHIFT_TYPE : INTEGER;
      C_OPT_GOAL : INTEGER;
      C_AINIT_VAL : STRING;
      C_SINIT_VAL : STRING;
      C_DEFAULT_DATA : STRING;
      C_HAS_A : INTEGER;
      C_HAS_CE : INTEGER;
      C_REG_LAST_BIT : INTEGER;
      C_SYNC_PRIORITY : INTEGER;
      C_SYNC_ENABLE : INTEGER;
      C_HAS_SCLR : INTEGER;
      C_HAS_SSET : INTEGER;
      C_HAS_SINIT : INTEGER;
      C_MEM_INIT_FILE : STRING;
      C_ELABORATION_DIR : STRING;
      C_READ_MIF : INTEGER;
      C_PARSER_TYPE : INTEGER
    );
    PORT (
      A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      D : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      CLK : IN STD_LOGIC;
      CE : IN STD_LOGIC;
      SCLR : IN STD_LOGIC;
      SSET : IN STD_LOGIC;
      SINIT : IN STD_LOGIC;
      Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT c_shift_ram_v12_0_11;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF c_shift_ram_0_arch: ARCHITECTURE IS "c_shift_ram_v12_0_11,Vivado 2017.4";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF c_shift_ram_0_arch : ARCHITECTURE IS "c_shift_ram_0,c_shift_ram_v12_0_11,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF c_shift_ram_0_arch: ARCHITECTURE IS "c_shift_ram_0,c_shift_ram_v12_0_11,{x_ipProduct=Vivado 2017.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_shift_ram,x_ipVersion=12.0,x_ipCoreRevision=11,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_XDEVICEFAMILY=zynq,C_VERBOSITY=0,C_WIDTH=8,C_DEPTH=640,C_ADDR_WIDTH=4,C_SHIFT_TYPE=0,C_OPT_GOAL=0,C_AINIT_VAL=00000000,C_SINIT_VAL=00000000,C_DEFAULT_DATA=00000000,C_HAS_A=0,C_HAS_CE=1,C_REG_LAST_BIT=1,C_SYNC_PRIORITY=1,C_SYNC_ENABLE=0,C_HAS_SCLR=0,C_HAS_SSET=0,C_HAS_SINIT=0,C_MEM_INIT_FILE=no_coe" & 
"_file_loaded,C_ELABORATION_DIR=./,C_READ_MIF=0,C_PARSER_TYPE=0}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF Q: SIGNAL IS "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF Q: SIGNAL IS "xilinx.com:signal:data:1.0 q_intf DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF CE: SIGNAL IS "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW";
  ATTRIBUTE X_INTERFACE_INFO OF CE: SIGNAL IS "xilinx.com:signal:clockenable:1.0 ce_intf CE";
  ATTRIBUTE X_INTERFACE_PARAMETER OF CLK: SIGNAL IS "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000";
  ATTRIBUTE X_INTERFACE_INFO OF CLK: SIGNAL IS "xilinx.com:signal:clock:1.0 clk_intf CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF D: SIGNAL IS "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF D: SIGNAL IS "xilinx.com:signal:data:1.0 d_intf DATA";
BEGIN
  U0 : c_shift_ram_v12_0_11
    GENERIC MAP (
      C_XDEVICEFAMILY => "zynq",
      C_VERBOSITY => 0,
      C_WIDTH => 8,
      C_DEPTH => 640,
      C_ADDR_WIDTH => 4,
      C_SHIFT_TYPE => 0,
      C_OPT_GOAL => 0,
      C_AINIT_VAL => "00000000",
      C_SINIT_VAL => "00000000",
      C_DEFAULT_DATA => "00000000",
      C_HAS_A => 0,
      C_HAS_CE => 1,
      C_REG_LAST_BIT => 1,
      C_SYNC_PRIORITY => 1,
      C_SYNC_ENABLE => 0,
      C_HAS_SCLR => 0,
      C_HAS_SSET => 0,
      C_HAS_SINIT => 0,
      C_MEM_INIT_FILE => "no_coe_file_loaded",
      C_ELABORATION_DIR => "./",
      C_READ_MIF => 0,
      C_PARSER_TYPE => 0
    )
    PORT MAP (
      A => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      D => D,
      CLK => CLK,
      CE => CE,
      SCLR => '0',
      SSET => '0',
      SINIT => '0',
      Q => Q
    );
END c_shift_ram_0_arch;
