--*****************************************************************************
-- (c) Copyright 2009 Xilinx, Inc. All rights reserved.
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
--*****************************************************************************
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: %version
--  \   \         Application: MIG
--  /   /         Filename: data_prbs_gen.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/06/02 07:16:39 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR 
-- Purpose:  This module is used LFSR to generate random data for memory 
--          data write or memory data read comparison.The first data is 
--          seeded by the input prbs_seed_i which is connected to memory address.
-- Reference:
-- Revision History:

--*****************************************************************************


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;


ENTITY data_prbs_gen IS
   GENERIC (
      EYE_TEST        : STRING := "FALSE";
      PRBS_WIDTH      : INTEGER := 32;
      SEED_WIDTH      : INTEGER := 32
--      TAPS            : STD_LOGIC_VECTOR(PRBS_WIDTH - 1 DOWNTO 0) := "10000000001000000000000001100010"
   );
   PORT (
      
      clk_i           : IN STD_LOGIC;
      clk_en          : IN STD_LOGIC;
      rst_i           : IN STD_LOGIC;
      prbs_fseed_i    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      prbs_seed_init  : IN STD_LOGIC;
      prbs_seed_i     : IN STD_LOGIC_VECTOR(PRBS_WIDTH - 1 DOWNTO 0);
      
      prbs_o          : OUT STD_LOGIC_VECTOR(PRBS_WIDTH - 1 DOWNTO 0)
   );
END data_prbs_gen;

ARCHITECTURE trans OF data_prbs_gen IS
   
   SIGNAL prbs   : STD_LOGIC_VECTOR(PRBS_WIDTH - 1 DOWNTO 0);
   SIGNAL lfsr_q : STD_LOGIC_VECTOR(PRBS_WIDTH DOWNTO 1);
   SIGNAL i      : INTEGER;
BEGIN
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (((prbs_seed_init = '1') AND (EYE_TEST = "FALSE")) OR (rst_i = '1')) THEN
            
            
            lfsr_q <= prbs_seed_i + prbs_fseed_i(31 DOWNTO 0) + "01010101010101010101010101010101";
         ELSIF (clk_en = '1') THEN
            
            lfsr_q(32 DOWNTO 9) <= lfsr_q(31 DOWNTO 8);
            lfsr_q(8) <= lfsr_q(32) XOR lfsr_q(7);
            lfsr_q(7) <= lfsr_q(32) XOR lfsr_q(6);
            
            lfsr_q(6 DOWNTO 4) <= lfsr_q(5 DOWNTO 3);
            lfsr_q(3) <= lfsr_q(32) XOR lfsr_q(2);
            lfsr_q(2) <= lfsr_q(1);
            
            lfsr_q(1) <= lfsr_q(32);
         END IF;
      END IF;
   END PROCESS;
   
   
   PROCESS (lfsr_q(PRBS_WIDTH DOWNTO 1))
   BEGIN
      prbs <= lfsr_q(PRBS_WIDTH DOWNTO 1);
   END PROCESS;
   
   
   prbs_o <= prbs;
   
END trans;


