--  Module      : cam_mem_srl16_wrcomp.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM

--  Description : Write Comparator.
--                Accepts 2 4-bit inputs WR_COUNT and WR_DATA
--                Asserts an active high output whenever the 2 inputs are equal
--
--  Company     : Xilinx, Inc.
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
-------------------------------------------------------------------------------
--  Structure:
--
--      << cam_mem_srl16_wrcomp >>
--
-------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY cam;

ENTITY cam_mem_srl16_wrcomp IS
  PORT (
    --Input
    WR_COUNT       : IN  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    WR_DATA        : IN  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    --Output
    WR_DATA_BIT    : OUT STD_LOGIC := '0'
    );

    attribute max_fanout : integer;
    attribute max_fanout of all: entity is 10;

END cam_mem_srl16_wrcomp;



ARCHITECTURE xilinx OF cam_mem_srl16_wrcomp IS



-------------------------------------------------------------------------------
-- Architecture Begin
-------------------------------------------------------------------------------
BEGIN  -- xilinx

--------------------------------------------------------------------------------
-- compare inputs WR_COUNT and WR_DATA. If they are equal , assert WR_DATA_BIT
-- high.
--------------------------------------------------------------------------------

comp: PROCESS (WR_COUNT, WR_DATA)
BEGIN
       IF (WR_COUNT=WR_DATA) THEN
         WR_DATA_BIT <= '1';
       ELSE
         WR_DATA_BIT <= '0';                                                                                     
       END IF;
END PROCESS comp ; 

END xilinx;
