--  Module      : cam_decoder.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : Binary Decoder for the CAM
--
--  Company     : Xilinx, Inc.
--
--  DISCLAIMER OF LIABILITY
--
--  (c) Copyright 2001-2011 Xilinx, Inc. All rights reserved.
--
--  This file contains confidential and proprietary information
--  of Xilinx, Inc. and is protected under U.S. and
--  international copyright and other intellectual property
--  laws.
--
--  DISCLAIMER
--  This disclaimer is not a license and does not grant any
--  rights to the materials distributed herewith. Except as
--  otherwise provided in a valid license issued to you by
--  Xilinx, and to the maximum extent permitted by applicable
--  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
--  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
--  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
--  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
--  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
--  (2) Xilinx shall not be liable (whether in contract or tort,
--  including negligence, or under any other theory of
--  liability) for any loss or damage of any kind or nature
--  related to, arising under or in connection with these
--  materials, including for any direct, or any indirect,
--  special, incidental, or consequential loss or damage
--  (including loss of data, profits, goodwill, or any type of
--  loss or damage suffered as a result of any action brought
--  by a third party) even if such damage or loss was
--  reasonably foreseeable or Xilinx had been advised of the
--  possibility of the same.
--
--  CRITICAL APPLICATIONS
--  Xilinx products are not designed or intended to be fail-
--  safe, or for use in any application requiring fail-safe
--  performance, such as life-support or safety devices or
--  systems, Class III medical devices, nuclear facilities,
--  applications related to the deployment of airbags, or any
--  other applications that could lead to death, personal
--  injury, or severe property or environmental damage
--  (individually and collectively, "Critical
--  Applications"). Customer assumes the sole risk and
--  liability of any use of Xilinx products in Critical
--  Applications, subject only to applicable laws and
--  regulations governing limitations on product liability.
--
--  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
--  PART OF THIS FILE AT ALL TIMES.
-- 
-----------------------------------------------------------------------------
-- Structure
--      +- << cam_decoder >>
--
-----------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_misc.ALL;
USE IEEE.STD_LOGIC_unsigned.ALL;

ENTITY cam_decoder IS

  GENERIC (
    C_DEC_SEL_WIDTH   : INTEGER := 1;
    C_DEC_OUT_WIDTH   : INTEGER := 2);

  PORT (
    --Inputs
    EN      : IN  STD_LOGIC := '0';
    SEL     : IN  STD_LOGIC_VECTOR(C_DEC_SEL_WIDTH-1 DOWNTO 0) 
                  := (OTHERS => '0');
    --Outputs
    DEC     : OUT STD_LOGIC_VECTOR(C_DEC_OUT_WIDTH-1 DOWNTO 0)
                  := (OTHERS => '0'));

  attribute max_fanout : integer;
  attribute max_fanout of all: entity is 10;
  
END cam_decoder;

ARCHITECTURE xilinx OF cam_decoder IS
BEGIN  
  pdec : PROCESS (EN, SEL) BEGIN
    IF (EN = '1') THEN
      DEC                    <= (OTHERS => '0');
      DEC(conv_integer(SEL)) <= '1';
    ELSE
      DEC                    <= (OTHERS => '0');
    END IF;
  END PROCESS pdec;

END xilinx;
