--  Module      : cam_regouts.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : Registers the outputs of the CAM 
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
--              << cam_regouts >>
--
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL ;

ENTITY cam_regouts IS
  GENERIC (
    C_HAS_MULTIPLE_MATCH : INTEGER := 0;
    C_HAS_READ_WARNING   : INTEGER := 0;
    C_HAS_SINGLE_MATCH   : INTEGER := 0;
    C_MATCH_ADDR_WIDTH   : INTEGER := 4);
  PORT (
    --Inputs
    CLK              : IN STD_LOGIC := '0';
    EN               : IN STD_LOGIC := '0';
    MATCH_D          : IN STD_LOGIC := '0';
    MATCH_ADDR_D     : IN STD_LOGIC_VECTOR(C_MATCH_ADDR_WIDTH-1 DOWNTO 0) 
                          := (OTHERS=>'0');
    MULTIPLE_MATCH_D : IN STD_LOGIC := '0';
    RD_ERR_D         : IN STD_LOGIC := '0';
    SINGLE_MATCH_D   : IN STD_LOGIC := '0';
    --Outputs
    MATCH_Q          : OUT STD_LOGIC := '0';
    MATCH_ADDR_Q     : OUT STD_LOGIC_VECTOR(C_MATCH_ADDR_WIDTH-1 DOWNTO 0) 
                           := (OTHERS=>'0');
    MULTIPLE_MATCH_Q : OUT STD_LOGIC := '0';
    RD_ERR_Q         : OUT STD_LOGIC := '0';
    SINGLE_MATCH_Q   : OUT STD_LOGIC := '0');

    attribute max_fanout : integer;
    attribute max_fanout of all: entity is 10;

END cam_regouts;

-------------------------------------------------------------------------------
-- Architecture Declaration
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF cam_regouts IS

  SIGNAL match_d_int          : STD_LOGIC := '0';
  SIGNAL multiple_match_d_int : STD_LOGIC := '0';
  SIGNAL rd_err_d_int         : STD_LOGIC := '0';
  SIGNAL single_match_d_int   : STD_LOGIC := '0';

  SIGNAL match_q_int          : STD_LOGIC := '0';
  SIGNAL multiple_match_q_int : STD_LOGIC := '0';
  SIGNAL rd_err_q_int         : STD_LOGIC := '0';
  SIGNAL single_match_q_int   : STD_LOGIC := '0';

BEGIN  

  -----------------------------------------------------------------------------
  -- Assign to Inputs to internal signals
  -----------------------------------------------------------------------------
  match_d_int          <= MATCH_D;
  multiple_match_d_int <= MULTIPLE_MATCH_D;
  rd_err_d_int         <= RD_ERR_D;
  single_match_d_int   <= SINGLE_MATCH_D;

    
  -----------------------------------------------------------------------------
  -- MATCH
  -----------------------------------------------------------------------------
  pqm: PROCESS (CLK)
  BEGIN
    IF (CLK'EVENT AND CLK = '1') THEN
      IF (EN = '1') THEN
        match_q_int <= match_d_int AFTER TFF;
      END IF;
    END IF;
  END PROCESS pqm;

  
  -----------------------------------------------------------------------------
  -- MATCH_ADDR
  -----------------------------------------------------------------------------
  pqma : PROCESS (CLK)
  BEGIN   
    IF (CLK'EVENT AND CLK = '1') THEN
      IF (EN = '1') THEN
        MATCH_ADDR_Q <= MATCH_ADDR_D AFTER TFF;
      END IF;
    END IF;
  END PROCESS pqma;

  -----------------------------------------------------------------------------
  -- MULTIPLE_MATCH
  -----------------------------------------------------------------------------
  gmm: IF C_HAS_MULTIPLE_MATCH = 1 GENERATE
  --Only register multiple_match if the multiple_match flag is ON
    pqmm : PROCESS (CLK) 
    BEGIN    
      if (CLK'EVENT AND CLK = '1') THEN 
        if (EN = '1') THEN
          multiple_match_q_int <= multiple_match_d_int AFTER TFF; 
        END IF; 
      END IF; 
    END PROCESS pqmm;
  END GENERATE gmm;
 
  ngmm: IF C_HAS_MULTIPLE_MATCH = 0 GENERATE
    multiple_match_q_int <= '0';
  END GENERATE ngmm;
 
  -----------------------------------------------------------------------------
  -- READ_WARNING
  -----------------------------------------------------------------------------
  grw: IF C_HAS_READ_WARNING = 1 GENERATE
  --Only register read_warning if the read_warning flag is ON
    pqrw : PROCESS (CLK)  
    BEGIN     
      if (CLK'EVENT AND CLK = '1') THEN  
        if (EN = '1') THEN 
          rd_err_q_int <= rd_err_d_int AFTER TFF;  
        END IF;  
      END IF;  
    END PROCESS pqrw ;
  END GENERATE grw;

  ngrw: IF C_HAS_READ_WARNING = 0 GENERATE
    rd_err_q_int <= '0';  
  END GENERATE ngrw;
  
  -----------------------------------------------------------------------------
  -- SINGLE_MATCH
  -----------------------------------------------------------------------------
  gsm: IF C_HAS_SINGLE_MATCH = 1 GENERATE
  --Only register single_match if the single_match flag is ON
    pqsm : PROCESS (CLK)   
    BEGIN      
      if (CLK'EVENT AND CLK = '1') THEN   
        if (EN = '1') THEN  
          single_match_q_int <= single_match_d_int AFTER TFF;   
        END IF;    
      END IF;   
    END PROCESS pqsm ;
  END GENERATE gsm;
 
  ngsm: IF C_HAS_SINGLE_MATCH = 0 GENERATE
    single_match_q_int <= '0';   
  END GENERATE ngsm;

  -----------------------------------------------------------------------------
  -- Assign to Outputs
  -----------------------------------------------------------------------------
  MATCH_Q                 <= match_q_int;
  MULTIPLE_MATCH_Q        <= multiple_match_q_int;
  RD_ERR_Q                <= rd_err_q_int;
  SINGLE_MATCH_Q          <= single_match_q_int;

END xilinx;


