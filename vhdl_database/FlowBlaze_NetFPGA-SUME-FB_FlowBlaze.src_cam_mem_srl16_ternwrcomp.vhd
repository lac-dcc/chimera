--  Module      : cam_mem_srl16_ternwrcomp.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : Ternary write comparator : compares WR_COUNT and WR_DATA 
--                taking ternary conditions into consideration. Asserts '1' to 
--                be written when appropriate state is reached
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
--      << cam_mem_srl16_ternwrcomp >>
--
-------------------------------------------------------------------------------
-- Details of the comparator:
--
--   Each bit of WR_COUNT and WR_DATA indicate possible 2 bit states 
--   bit positions : "1234"
--       position 1 => represents data "00"
--       position 2 => represents data "01"
--       position 3 => represents data "10"
--       position 4 => represents data "11"      
--
--   WR_COUNT value of "0101" indicates data values of "01" and "11"
--   which means that the first bit of the data is a don't care bit "X1"
--
--   WR_COUNT value of "1001", "0110" or other values that have '1's in 
--   these position will always force the output to be '1'.  Since those 
--   cases will translate into the data of "XX" which will match any data.
--
--   In WR_COUNT values where above is not true, output of 1 will be asserted
--   if there is at least one bit match between WR_COUNT and WR_DATA.
--
-------------------------------------------------------------------------------
--  Basic ternary comparator:
--    matches <= (WR_COUNT(3) AND WR_DATA(3))
--                OR
--               (WR_COUNT(2) AND WR_DATA(2))
--                OR
--               (WR_COUNT(1) AND WR_DATA(1))
--                OR
--               (WR_COUNT(0) AND WR_DATA(0))
--                
--  Exceptions:
--    The ternary encoder (used to generate WR_DATA from the 2-bit mask/data
--     input value) will NEVER generate the following values:
--      0110
--      0111
--      1110
--      1001
--      1011
--      1101
--    The reason is that all of these values equate to 2-bit "XX", which is
--     always encoded as "1111".
--
--  These values, CAN appear in the WR_COUNT value. However, those locations can
--   NEVER be read, since the ternary encoder can never generate those values,
--   so the value written to these locations is irrelevant.
------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY cam_mem_srl16_ternwrcomp IS
  PORT (
    --Input
    WR_COUNT       : IN  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    WR_DATA        : IN  STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    --Output
    WR_DATA_BIT    : OUT STD_LOGIC := '0'
    );

    attribute max_fanout : integer;
    attribute max_fanout of all: entity is 10;

END cam_mem_srl16_ternwrcomp;



ARCHITECTURE xilinx OF cam_mem_srl16_ternwrcomp IS

  SIGNAL comp_out      : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');



-------------------------------------------------------------------------------
-- Architecture Begin
-------------------------------------------------------------------------------


  
BEGIN  -- xilinx

  -----------------------------------------------------------------------------
  -- comp_out <= WR_COUNT AND WR_DATA
  --
  --   The 4-bit vector created will have a 1 in a particular bit
  --   if both the WR_COUNT and WR_DATA has a 1 in that same bit.
  --   This indicates whether the two vectors match the same value.
  --
  --   Ex: If WR_COUNT=1000, then it matches 11, 1X, X1, and XX
  --       If WR_DATA =1010, then it matches 11,1X,X1,01,0X,X1, and XX
  --       Therefore, WR_COUNT AND WR_DATA=1000, which shows that the two have
  --        the matching of 11,1X,X1, and XX in common
  -----------------------------------------------------------------------------

    comp_out(3) <= (WR_COUNT(3) AND WR_DATA(3)) ;
    comp_out(2) <= (WR_COUNT(2) AND WR_DATA(2)) ;
    comp_out(1) <= (WR_COUNT(1) AND WR_DATA(1)) ;
    comp_out(0) <= (WR_COUNT(0) AND WR_DATA(0)) ;


  -----------------------------------------------------------------------------
  --
  --   This value indicates whether WR_COUNT matches WR_DATA because it has
  --    matches in common.
  -----------------------------------------------------------------------------

   WR_DATA_BIT <= comp_out(3) OR comp_out(2) OR comp_out(1) OR comp_out(0) ;



END xilinx;
