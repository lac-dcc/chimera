--  Module      : cam_input_ternary_ternenc.vhd
-- 
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : This is the actual ternary encoder which encodes the DIN and
--                DATA_MASK input buses into ternary encoded outputs ( A= 00,
--                B = 01, C = 10, and D = 11).
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
--    +- << cam_input_ternary_ternenc >> 
--
-------------------------------------------------------------------------------
-- Ternary Encoding Scheme:
--   Each two bits of DIN and DATA_MASK are encoded as follows:
--   A LUT/SRL16 has 4 inputs: I3,I2,I1,I0. In the ternary encoding, each of
--   these values are given a meaning as follows:
--      I3: DIN & DATA_MASK 2-bit slice matches 11 (ex: 11, 1X, X1, XX)
--      I2: DIN & DATA_MASK 2-bit slice matches 10 (ex: 10, 1X, X0, XX)
--      I1: DIN & DATA_MASK 2-bit slice matches 01 (ex: 01, 0X, X1, XX)
--      I0: DIN & DATA_MASK 2-bit slice matches 00 (ex: 00, 0X, X0, XX)
--   
-------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL ;

ENTITY cam_input_ternary_ternenc IS

  GENERIC (
    C_TERNARY_MODE : INTEGER := C_TERNARY_MODE_STD);
  PORT (
    --Input Signals
    DIN          : IN  STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
    DATA_MASK    : IN  STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
    TERNARY_DATA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0')
    );

    attribute max_fanout : integer;
    attribute max_fanout of all: entity is 10;

END cam_input_ternary_ternenc;

-------------------------------------------------------------------------------
-- Architecture Declaration
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF cam_input_ternary_ternenc IS

  CONSTANT ZERO  : STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
  CONSTANT ONE   : STD_LOGIC_VECTOR (1 DOWNTO 0) := "01";
  CONSTANT TWO   : STD_LOGIC_VECTOR (1 DOWNTO 0) := "10";
  CONSTANT THREE : STD_LOGIC_VECTOR (1 DOWNTO 0) := "11";

-------------------------------------------------------------------------------
-- Architecture Begin 
-------------------------------------------------------------------------------
BEGIN

gter1: IF C_TERNARY_MODE = C_TERNARY_MODE_STD GENERATE

  ter1 : PROCESS (DATA_MASK, DIN)
  BEGIN
      --Does the ternary value expressed by DIN & DATA_MASK match 00?
      -- This is SRL address "A", implements equation:
      -- A = /d1*/d0 + m1*m0 + /d1*m0 + /d0*m1
      IF synth_ternary_compare(DATA_MASK, DIN, ZERO, zero) THEN
        TERNARY_DATA(3) <= '1';
      ELSE
        TERNARY_DATA(3) <= '0';
      END IF;

      --Does the ternary value expressed by DIN & DATA_MASK match 01?
      -- This is SRL address "B", implements equation:
      -- B = /d1*d0 + m1*m0 + /d1*m0 + d0*m1      
      IF synth_ternary_compare(DATA_MASK, DIN, ZERO, ONE) THEN
        TERNARY_DATA(2) <= '1';
      ELSE
        TERNARY_DATA(2) <= '0';
      END IF;

      --Does the ternary value expressed by DIN & DATA_MASK match 10?
      -- This is SRL address "C", implements equation:
      -- C = d1*/d0 + m1*m0 + d1*m0 + /d0*m1
      IF synth_ternary_compare(DATA_MASK, DIN, ZERO, TWO) THEN
        TERNARY_DATA(1) <= '1';
      ELSE
        TERNARY_DATA(1) <= '0';
      END IF;

      --Does the ternary value expressed by DIN & DATA_MASK match 11?
      -- This is SRL address "D", implements equation:
      -- D = d1*d0 + m1*m0 + d1*m0 + d0*m1
      IF synth_ternary_compare(DATA_MASK, DIN, ZERO, THREE) THEN
        TERNARY_DATA(0) <= '1';
      ELSE
        TERNARY_DATA(0) <= '0';
      END IF;
  END PROCESS ter1 ;

END GENERATE gter1;

gter2: IF C_TERNARY_MODE = C_TERNARY_MODE_ENH GENERATE

  ter2 : PROCESS (DATA_MASK, DIN)
  BEGIN
      --Does the ternary value expressed by DIN & DATA_MASK match 00?
      -- This is SRL address "A", implements equation:
      -- A = /d1*/d0
    IF synth_ternary_compare_xy(DATA_MASK, DIN, THREE, ZERO) THEN
        TERNARY_DATA(3) <= '1';
      ELSE
        TERNARY_DATA(3) <= '0';
      END IF;

      --Does the ternary value expressed by DIN & DATA_MASK match 01?
      -- This is SRL address "B", implements equation:
      -- B = /d1*/m0
        IF synth_ternary_compare_xy(DATA_MASK, DIN, TWO, ONE) THEN
        TERNARY_DATA(2) <= '1';
      ELSE
        TERNARY_DATA(2) <= '0';
      END IF;

      --Does the ternary value expressed by DIN & DATA_MASK match 10?
      -- This is SRL address "C", implements equation:
      -- C = /d0*/m1
        IF synth_ternary_compare_xy(DATA_MASK, DIN, ONE, TWO) THEN
        TERNARY_DATA(1) <= '1';
      ELSE
        TERNARY_DATA(1) <= '0';
      END IF;

      --Does the ternary value expressed by DIN & DATA_MASK match 11?
      -- This is SRL address "D", implements equation:
      -- D = /m1*/m0
        IF synth_ternary_compare_xy(DATA_MASK, DIN, ZERO, THREE) THEN
        TERNARY_DATA(0) <= '1';
      ELSE
        TERNARY_DATA(0) <= '0';
      END IF;      
  END PROCESS ter2;

END GENERATE gter2;
  
END xilinx;
