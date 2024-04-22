--  Module      : cam_input_ternary.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : This module converts the DIN and DATA_MASK input buses into a
--                special ternary-encoded value for use with the SRL16s.
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
--         +- << cam_input_ternary >>    
--                |
--                +- cam_input_ternary_ternenc //Ternary Encoder
--
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL;

ENTITY cam_input_ternary IS

  GENERIC (
    --Input widths
    C_DIN_WIDTH          : INTEGER := 4;
    C_DATA_MASK_WIDTH    : INTEGER := 4;
    C_TERNARY_DATA_WIDTH : INTEGER := 8;
    C_TERNARY_MODE       : INTEGER := C_TERNARY_MODE_STD
    );

  PORT (
    --Input Signals
    DIN          : IN  STD_LOGIC_VECTOR(C_DIN_WIDTH-1 DOWNTO 0)
                       := (OTHERS => '0');
    DATA_MASK    : IN  STD_LOGIC_VECTOR(C_DATA_MASK_WIDTH-1 DOWNTO 0)
                       := (OTHERS => '0');
    TERNARY_DATA : OUT STD_LOGIC_VECTOR(C_TERNARY_DATA_WIDTH-1 DOWNTO 0)
                       := (OTHERS => '0')
    );

    attribute max_fanout : integer;
    attribute max_fanout of all: entity is 10;

END cam_input_ternary;

-------------------------------------------------------------------------------
-- Architecture Declaration
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF cam_input_ternary IS
  
  CONSTANT C_DIN_INT_WIDTH       : INTEGER 
    := roundup_to_multiple(C_DIN_WIDTH, 2);
  CONSTANT C_DATA_MASK_INT_WIDTH : INTEGER 
    := roundup_to_multiple(C_DATA_MASK_WIDTH, 2);

  SIGNAL din_int       : STD_LOGIC_VECTOR(C_DIN_INT_WIDTH-1 DOWNTO 0) 
                         := (OTHERS => '0');
  SIGNAL data_mask_int : STD_LOGIC_VECTOR(C_DATA_MASK_INT_WIDTH-1 DOWNTO 0)
                         := (OTHERS => '0');

-------------------------------------------------------------------------------
-- Architecture Begin 
-------------------------------------------------------------------------------
BEGIN

  -----------------------------------------------------------------------------
  -- Zero-extend input bus (din)
  --   Functional equivalent:
  --      din_int(C_DIN_WIDTH-1 DOWNTO 0) <= DIN;
  -----------------------------------------------------------------------------
  gzxdi : FOR i IN 0 TO C_DIN_INT_WIDTH-1 GENERATE
    gzx     : IF i > C_DIN_WIDTH-1 GENERATE
      din_int(i)  <= '0';
    END GENERATE gzx;
    ngzx    : IF i <= C_DIN_WIDTH-1 GENERATE
      din_int(i)  <= DIN(i);
    END GENERATE ngzx;
  END GENERATE gzxdi;

  -----------------------------------------------------------------------------
  -- Zero-extend input bus (data_mask)
  --   Functional equivalent:
  --      data_mask_int(C_DATA_MASK_WIDTH-1 DOWNTO 0) <= DATA_MASK;
  -----------------------------------------------------------------------------
  gzxdm : FOR i IN 0 TO C_DATA_MASK_INT_WIDTH-1 GENERATE
    gzx  : IF i > C_DATA_MASK_WIDTH-1 GENERATE
      data_mask_int(i)  <= '0';
    END GENERATE gzx;
    ngzx : IF i <= C_DATA_MASK_WIDTH-1 GENERATE
      data_mask_int(i)  <= DATA_MASK(i);
    END GENERATE ngzx;
  END GENERATE gzxdm;

  -----------------------------------------------------------------------------
  -- Encode the DIN and DATA_MASK inputs into the special Ternary Encoding
  --  for use with the SRL16s
  -----------------------------------------------------------------------------
  gtern : FOR i IN 0 TO  divroundup(C_DIN_INT_WIDTH, 2)-1 GENERATE
    ternblk : ENTITY cam.cam_input_ternary_ternenc
      -- no generics
      GENERIC MAP (
        C_TERNARY_MODE => C_TERNARY_MODE)
      PORT MAP (
        --Inputs
        DIN          => din_int(i*2+1 DOWNTO i*2),
        DATA_MASK    => data_mask_int(i*2+1 DOWNTO i*2),
        --Outputs
        TERNARY_DATA => TERNARY_DATA(i*4+3 DOWNTO i*4)
        );
  END GENERATE gtern;

END xilinx;
