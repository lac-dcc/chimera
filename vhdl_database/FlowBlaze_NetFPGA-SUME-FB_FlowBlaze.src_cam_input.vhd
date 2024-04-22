--  Module      : cam_input.vhd
--
--  Last Update : 01 March 2011
--  Project     : CAM

--  Description : This module generates internal signals from user inputs. 
--                Also, it processes and stores the correct input values for 
--                the CAM (so that the user doesn't have to hold correct values
--                on the inputs at all times)
--
--  Company     : Xilinx, Inc.
--
-- (c) Copyright 2001-2011 Xilinx, Inc. All rights reserved.
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
--      << cam_input >>
--             |
--             +- cam_input_ternary //Read Logic for ternary mode
--             |     |
--             |     +- cam_input_ternary_ternenc //Ternary Encoder
--             |
--             +- cam_input_ternary //Write Logic for ternary mode
--                   |
--                   +- cam_input_ternary_ternenc //Ternary Encoder
--
-------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL;

ENTITY cam_input IS

  GENERIC (
    --Input widths
    C_DIN_WIDTH             : INTEGER := 8;
    C_DATA_MASK_WIDTH       : INTEGER := 8;
    C_CMP_DIN_WIDTH         : INTEGER := 8;
    C_CMP_DATA_MASK_WIDTH   : INTEGER := 8;
    C_WR_ADDR_WIDTH         : INTEGER := 4;

    --Configuration parameters    
    C_HAS_CMP_DIN           : INTEGER := 0;
    C_HAS_WR_ADDR           : INTEGER := 1;
    C_TERNARY_MODE          : INTEGER := 0;

    --Internal read signal widths
    C_RD_DIN_WIDTH          : INTEGER := 8;
    C_RD_DATA_MASK_WIDTH    : INTEGER := 8;
    C_RD_DATA_TERNARY_WIDTH : INTEGER := 8;
    C_RD_DATA_TMP_WIDTH     : INTEGER := 8;

    --Internal write signal widths
    C_WR_DIN_WIDTH          : INTEGER := 8;
    C_WR_DATA_MASK_WIDTH    : INTEGER := 8;
    C_WR_DATA_TERNARY_WIDTH : INTEGER := 8;
    C_WR_DATA_TMP_WIDTH     : INTEGER := 8;

    --Output widths
    C_RD_DATA_WIDTH         : INTEGER := 8;
    C_WR_DATA_WIDTH         : INTEGER := 8;
    C_WR_ADDR_INT_WIDTH     : INTEGER := 4
    );

  PORT (
    --Input Signals
    CLK           : IN STD_LOGIC := '0';
    EN            : IN STD_LOGIC := '0';
    REG_EN        : IN STD_LOGIC := '0';
    DIN           : IN STD_LOGIC_VECTOR(C_DIN_WIDTH-1 DOWNTO 0) 
                       := (OTHERS => '0');
    DATA_MASK     : IN STD_LOGIC_VECTOR(C_DATA_MASK_WIDTH-1 DOWNTO 0)
                       := (OTHERS => '0');
    CMP_DIN       : IN STD_LOGIC_VECTOR(C_CMP_DIN_WIDTH-1 DOWNTO 0)
                       := (OTHERS => '0');
    CMP_DATA_MASK : IN STD_LOGIC_VECTOR(C_CMP_DATA_MASK_WIDTH-1 DOWNTO 0)
                       := (OTHERS => '0');
    WR_ADDR       : IN STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0)
                       := (OTHERS => '0');
    
    --Outputs for downstream logic
    RD_DATA       : OUT STD_LOGIC_VECTOR(C_RD_DATA_WIDTH-1 DOWNTO 0)
                        := (OTHERS => '0');
    WR_DATA       : OUT STD_LOGIC_VECTOR(C_WR_DATA_WIDTH-1 DOWNTO 0)
                        := (OTHERS => '0');
    WR_ADDR_INT   : OUT STD_LOGIC_VECTOR(C_WR_ADDR_INT_WIDTH-1 DOWNTO 0)
                        := (OTHERS => '0');

    --Outputs for control logic
    RD_DATA_MASK  : OUT STD_LOGIC_VECTOR(C_RD_DATA_MASK_WIDTH-1 DOWNTO 0)
                        := (OTHERS => '0');
    RD_DIN        : OUT STD_LOGIC_VECTOR(C_RD_DIN_WIDTH-1 DOWNTO 0)
                        := (OTHERS => '0');
    WR_DATA_MASK  : OUT STD_LOGIC_VECTOR(C_WR_DATA_MASK_WIDTH-1 DOWNTO 0)
                        := (OTHERS => '0');
    WR_DIN        : OUT STD_LOGIC_VECTOR(C_WR_DIN_WIDTH-1 DOWNTO 0)
                        := (OTHERS => '0')
    );

attribute max_fanout : integer;
attribute max_fanout of all: entity is 10;

END cam_input;

-------------------------------------------------------------------------------
-- Generic Definitions:
-------------------------------------------------------------------------------
  -- C_RD_DIN_WIDTH          : Width of RD_DIN port. Set to C_WIDTH in 
  --                           cam_rtl.vhd 
  -- C_RD_DATA_MASK_WIDTH    : Width of RD_DATA_MASK port. Set to C_WIDTH in 
  --                           cam_rtl.vhd 
  -- C_WR_DIN_WIDTH          : Width of WR_DIN port. Set to C_WIDTH in 
  --                           cam_rtl.vhd 
  -- C_WR_DATA_MASK_WIDTH    : Width of WR_DATA_MASK port. Set to C_WIDTH in 
  --                           cam_rtl.vhd 
  -- C_RD_DATA_TERNARY_WIDTH : Width of data bus necessary to ternary-encode
  --                           the data. 
  --                           Set to roundup_to_multiple(C_RD_DIN_WIDTH*2, 4)
  --                           in cam_rtl.vhd
  -- C_WR_DATA_TERNARY_WIDTH : Width of data bus necessary to ternary-encode
  --                           the data. 
  --                           Set to roundup_to_multiple(C_WR_DIN_WIDTH*2, 4)
  --                           in cam_rtl.vhd
  -- C_RD_DATA_TMP_WIDTH     : Width of rd_data_tmp signal. Set to 
  --                           if_then_else(C_TERNARY_MODE, 
  --                                        C_RD_DATA_TERNARY_WIDTH, 
  --                                        C_RD_DIN_WIDTH) in cam_rtl.vhd
  -- C_WR_DATA_TMP_WIDTH     : Width of wr_data_tmp signal. Set to 
  --                           if_then_else(C_TERNARY_MODE, 
  --                                        C_WR_DATA_TERNARY_WIDTH, 
  --                                        C_WR_DIN_WIDTH) in cam_rtl.vhd
  -- C_RD_DATA_WIDTH,        : Internal data bus widths. Set to a multiple of 4
  -- C_WR_DATA_WIDTH           so they can map to SRL16s), large enough for 
  --                           binary data normally, and large enough for
  --                           ternary data in the ternary mode case. Set in
  --                           cam_rtl.vhd                                  
-------------------------------------------------------------------------------
-- Port Definitions:
-------------------------------------------------------------------------------
  -- Input Pin
  -- ---------
  -- REG_EN       : Internal Register Enable generated by cam_control.vhd
  --                REG_EN='1' => A write is not in progress (default)
  --                REG_EN='0' => A write is in progress (goes from '1' to '0' 
  --                              one clock cycle after user WE is asserted.
  -- Output Pins
  -- -----------
  -- RD_DIN       : Either user DIN or CMP_DIN based on configuration
  -- WR_DIN       : User DIN when write is not in progress or registered DIN 
  --                when write is in progress.
  -- RD_DATA_MASK : Either user DATA_MASK or CMP_DATA_MASK based on 
  --                configuration
  -- WR_DATA_MASK : User DATA_MASK when write is not in progress or registered 
  --                DATA_MASK when write is in progress.
  -- RD_DATA      : The final encoded read data input for the CAM. 
  --                RD_DATA = rd_data_ternary for ternary mode
  --                RD_DATA = RD_DIN for non-ternary mode (see above 
  --                          description for WR_DIN).
  -- WR_DATA      : The final encoded write data input for the CAM. 
  --                WR_DATA = wr_data_ternary for ternary mode
  --                WR_DATA = WR_DIN for non-ternary mode (see above 
  --                          description for WR_DIN).
  -- WR_ADDR_INT  : Internal WR_ADDR for the CAM core.
  --                WR_ADDR_INT = User WR_ADDR when write is not in progress
  --                WR_ADDR_INT = Registered WR_ADDR when write is in progress
 
-------------------------------------------------------------------------------
-- Architecture Declaration
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF cam_input IS

  --Internal Read signals
  SIGNAL rd_din_i        : STD_LOGIC_VECTOR(C_RD_DIN_WIDTH-1 DOWNTO 0) 
                           := (OTHERS => '0');
  SIGNAL rd_data_mask_i  : STD_LOGIC_VECTOR(C_RD_DATA_MASK_WIDTH-1 DOWNTO 0)
                           := (OTHERS => '0');
  SIGNAL rd_data_ternary : STD_LOGIC_VECTOR(C_RD_DATA_TERNARY_WIDTH-1 DOWNTO 0)
                           := (OTHERS => '0');
  SIGNAL rd_data_tmp     : STD_LOGIC_VECTOR(C_RD_DATA_TMP_WIDTH-1 DOWNTO 0)
                           := (OTHERS => '0');

  --Internal Write signals
  SIGNAL wr_din_i        : STD_LOGIC_VECTOR(C_WR_DIN_WIDTH-1 DOWNTO 0)
                           := (OTHERS => '0');
  SIGNAL wr_data_mask_i  : STD_LOGIC_VECTOR(C_WR_DATA_MASK_WIDTH-1 DOWNTO 0)
                           := (OTHERS => '0');
  
  SIGNAL wr_data_tmp     : STD_LOGIC_VECTOR(C_WR_DATA_TMP_WIDTH-1 DOWNTO 0)
                           := (OTHERS => '0');

  attribute max_fanout of all: signal is 10;

-------------------------------------------------------------------------------
-- Architecture Begin 
-------------------------------------------------------------------------------
BEGIN  

  -----------------------------------------------------------------------------
  -- Read Logic
  -----------------------------------------------------------------------------
  --Generate the internal rd_din (Read Data) signal. If the core has a
  -- CMP_DIN pin, then that is used for reading, otherwise, use DIN. 
  gcd   : IF C_HAS_CMP_DIN /= 0 GENERATE
    rd_din_i <= CMP_DIN;
  END GENERATE gcd;
  ngcd : IF C_HAS_CMP_DIN = 0 GENERATE
    rd_din_i <= DIN;
  END GENERATE ngcd;

  --Generate the internal rd_data_mask signal (for Read Data). If the
  -- core has a CMP_DIN pin, then the CMP_DATA_MASK is used for
  -- reading, otherwise, use DATA_MASK.
  gcdm   : IF C_HAS_CMP_DIN /= 0 GENERATE
    rd_data_mask_i <= CMP_DATA_MASK;
  END GENERATE gcdm;
  ngcdm : IF C_HAS_CMP_DIN = 0 GENERATE
    rd_data_mask_i <= DATA_MASK;
  END GENERATE ngcdm;

  --Generate Ternary read Logic (if ternary mode)
  grt : IF C_TERNARY_MODE /= c_ternary_mode_off GENERATE

    rddatatern : ENTITY cam.cam_input_ternary
      GENERIC MAP (
        C_DIN_WIDTH          => C_RD_DIN_WIDTH,
        C_DATA_MASK_WIDTH    => C_RD_DATA_MASK_WIDTH,
        c_ternary_data_width => C_RD_DATA_TERNARY_WIDTH,
        C_TERNARY_MODE       => C_TERNARY_MODE
        )
      PORT MAP (
        DIN                  => rd_din_i,
        DATA_MASK            => rd_data_mask_i,
        TERNARY_DATA         => rd_data_ternary
        );

    rd_data_tmp <= rd_data_ternary;
  END GENERATE grt;

  --Generate non-ternary read logic (if NOT ternary mode)
  grnt : IF C_TERNARY_MODE = c_ternary_mode_off GENERATE
    rd_data_tmp <= rd_din_i;
  END GENERATE grnt;

  -----------------------------------------------------------------------------
  -- Write Logic
  -----------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  -- Non-Read-Only CAMs
  -----------------------------------------------------------------------------
  --Generate all the write logic only for non-read-only CAMs
  gwl: IF (C_HAS_WR_ADDR /= 0) GENERATE
    
    SIGNAL din_q     : STD_LOGIC_VECTOR(C_DIN_WIDTH-1 DOWNTO 0) 
                       := (OTHERS => '0'); 
    SIGNAL wr_addr_q : STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0) 
                       := (OTHERS => '0');

    BEGIN
    ---------------------------------------------------------------------------
    -- Generate Ternary write Logic for ternary mode
    ---------------------------------------------------------------------------
    gwdt : IF C_TERNARY_MODE /= c_ternary_mode_off GENERATE
      SIGNAL wr_data_ternary : STD_LOGIC_VECTOR(C_WR_DATA_TERNARY_WIDTH-1 
                                                DOWNTO 0) 
                               := (OTHERS => '0');
      SIGNAL data_mask_q     : STD_LOGIC_VECTOR(C_DATA_MASK_WIDTH-1 DOWNTO 0) 
                               := (OTHERS => '0');
    BEGIN
      ---------------------------
      -- Data Mask
      ---------------------------
      -- Generate the register for holding write data mask only if
      -- we have ternary mode
      pdmq : PROCESS (CLK)
      BEGIN  -- PROCESS input_proc
        IF (CLK'event AND CLK = '1') THEN
          IF (EN = '1' AND REG_EN = '1') THEN
            data_mask_q <= DATA_MASK AFTER TFF;
          END IF;
        END IF;
      END PROCESS pdmq;

      -- If a write is in progress (REG_EN='0'), use the registered input. 
      -- If a write is not in progress (REG_EN='1'), use the user input. 
      -- REG_EN is generated by cam_control.vhd
      wr_data_mask_i <= DATA_MASK WHEN REG_EN = '1' ELSE data_mask_q;

      ----------------------------
      -- Wr Data Ternary
      ----------------------------
      wdter : ENTITY cam.cam_input_ternary
        GENERIC MAP (
          C_DIN_WIDTH          => C_WR_DIN_WIDTH,
          C_DATA_MASK_WIDTH    => C_WR_DATA_MASK_WIDTH,
          C_TERNARY_DATA_WIDTH => C_WR_DATA_TERNARY_WIDTH,
          C_TERNARY_MODE       => C_TERNARY_MODE
          )
        PORT MAP (
          DIN                  => wr_din_i,
          DATA_MASK            => wr_data_mask_i,
          TERNARY_DATA         => wr_data_ternary
          );

      wr_data_tmp <= wr_data_ternary;
    END GENERATE gwdt;
  
    ---------------------------------------------------------------------------
    -- Wr Data and Wr Data mask for Non-Ternary mode
    ---------------------------------------------------------------------------
    gwdnt : IF C_TERNARY_MODE = c_ternary_mode_off GENERATE
      wr_data_tmp    <= wr_din_i;
      wr_data_mask_i <= (OTHERS => '0');
    END GENERATE gwdnt;

    ---------------------------------------------------------------------------
    -- Register DIN and WR_ADDR for all non-read-only CAMs 
    ---------------------------------------------------------------------------
    -- Register din and wr_addr values to hold during a write operation
    -- When a write is not in progress (REG_EN='1') => Inputs are registered. 
    -- When a write is in progress (REG_EN='0')     => Previous values are held.
    preg1 : PROCESS (CLK)
    BEGIN  -- PROCESS input_proc
      IF CLK'event AND CLK = '1' THEN
        IF (EN = '1' AND REG_EN = '1') THEN
          din_q     <= DIN AFTER TFF;
          wr_addr_q <= WR_ADDR AFTER TFF;
        END IF;
      END IF;
    END PROCESS preg1;
 
    -- If a write is in progress (REG_EN='0'), use the registered inputs. 
    -- If a write is not in progress (REG_EN='1'), use the user inputs. 
    -- REG_EN is generated by cam_control.vhd
    wr_din_i    <= DIN     WHEN REG_EN = '1' ELSE din_q;
    WR_ADDR_INT <= WR_ADDR WHEN REG_EN = '1' ELSE wr_addr_q;
  
  END GENERATE gwl; --Non-Read-Only CAMs

  -----------------------------------------------------------------------------
  -- Read-only CAMs
  -----------------------------------------------------------------------------
  -- Tie-off write logic signals for Read-Only CAMs
  ngwl: IF (C_HAS_WR_ADDR = 0) GENERATE
    wr_din_i       <= (OTHERS => '0');
    WR_ADDR_INT    <= (OTHERS => '0');
    wr_data_tmp    <= (OTHERS => '0');
    wr_data_mask_i <= (OTHERS => '0');
  END GENERATE ngwl; --Read Only CAMs
  
  -----------------------------------------------------------------------------
  --Zero-extend outputs to specified size
  -----------------------------------------------------------------------------
  -- RD_DATA
  -- Equivalent to: rd_data(C_RD_DATA_TMP_WIDTH-1 DOWNTO 0) <= rd_data_tmp;
  gzxrd: FOR i IN 0 TO C_RD_DATA_WIDTH-1 GENERATE
    gzero: IF (i > C_RD_DATA_TMP_WIDTH-1) GENERATE
      rd_data(i) <= '0';
    END GENERATE gzero;

    gtmp: IF (i <= C_RD_DATA_TMP_WIDTH-1) GENERATE
      rd_data(i) <= rd_data_tmp(i);
    END GENERATE gtmp;
  END GENERATE gzxrd;
  
  -- WR_DATA
  -- Equivalent to: wr_data(C_WR_DATA_TMP_WIDTH-1 DOWNTO 0) <= wr_data_tmp;
  gzxwr: FOR i IN 0 TO C_WR_DATA_WIDTH-1 GENERATE
    gzero: IF (i > C_WR_DATA_TMP_WIDTH-1) GENERATE
      wr_data(i) <= '0';
    END GENERATE gzero;

    gtmp: IF (i <= C_WR_DATA_TMP_WIDTH-1) GENERATE
      wr_data(i) <= wr_data_tmp(i);
    END GENERATE gtmp;
  END GENERATE gzxwr;

  -----------------------------------------------------------------------------
  -- Connect the output signals for control logic
  -----------------------------------------------------------------------------
  RD_DATA_MASK <= rd_data_mask_i;
  RD_DIN       <= rd_din_i;
  WR_DATA_MASK <= wr_data_mask_i;
  WR_DIN       <= wr_din_i;

END xilinx;
