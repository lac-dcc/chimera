--  Module      : dmem.vhd
-- 
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : Inferred Distributed RAM module for the Erase RAM in the 
--                Block Memory implementation of the CAM 
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
--   cam_mem_blk 
--      |
--      +- << dmem >>            
--      |
--      +- cam_mem_blk_extdepth   
--   
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Library Declarations
-------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL;


ENTITY dmem IS
  -----------------------------------------------------------------------------
  -- Generic Declarations 
  -----------------------------------------------------------------------------
  GENERIC (
    C_WIDTH           : INTEGER := 4;
    C_DEPTH           : INTEGER := 16;
    C_WR_ADDR_WIDTH   : INTEGER := 4;
    C_MEM_INIT        : INTEGER := 1;
    C_MEM_INIT_FILE   : STRING  := "test.mif";
    C_ELABORATION_DIR : STRING  := "./"
    );  
  -----------------------------------------------------------------------------
  -- Input and Output Declarations
  -----------------------------------------------------------------------------
  PORT (
    CLK  : IN STD_LOGIC                                    := '0';
    WE   : IN STD_LOGIC                                    := '0';
    ADDR : IN STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    DI   : IN STD_LOGIC_VECTOR(C_WIDTH-1 DOWNTO 0)         := (OTHERS => '0');
    DO   : OUT STD_LOGIC_VECTOR(C_WIDTH-1 DOWNTO 0)        := (OTHERS => '0')
  );


attribute max_fanout : integer;
attribute max_fanout of all: entity is 10;

END dmem;

ARCHITECTURE xilinx OF dmem IS

  -----------------------------------------------------------------------------  
  -- Signals, functions, and attribute declaration
  -----------------------------------------------------------------------------
  --2D array  
  TYPE dmem_type IS ARRAY (0 TO C_DEPTH-1) OF STD_LOGIC_VECTOR (C_WIDTH-1 DOWNTO 0);
  

  -- Initialization function for the inferred Dist RAM 
  IMPURE FUNCTION InitDmemFromFile (C_MEM_INIT_FILE : IN STRING; 
                                    C_DEPTH         : IN INTEGER;
                                    C_WIDTH         : IN INTEGER)
  RETURN dmem_type IS
    -- Open the INIT file 
    FILE DmemFile         : TEXT; -- OPEN READ_MODE IS C_MEM_INIT_FILE;
    VARIABLE DmemFileLine : LINE;
    VARIABLE MEM          : dmem_type;
    VARIABLE i,j          : INTEGER := 0;
    VARIABLE lines        : INTEGER := 0;
    VARIABLE mif_status   : file_open_status;
    VARIABLE bitsgood     : BOOLEAN := TRUE;
    VARIABLE bitchar      : CHARACTER;

  BEGIN
    
    FILE_OPEN(mif_status, DmemFile, C_MEM_INIT_FILE, read_mode);
    IF (mif_status /= open_ok) THEN
      ASSERT FALSE REPORT "Error: dmem: could not open MIF file."
        SEVERITY FAILURE;
    END IF;
    
    lines := 0;
    
    FOR i IN 0 TO C_DEPTH-1 LOOP
      IF (NOT (ENDFILE(DmemFile)) AND i < C_DEPTH) THEN
        READLINE (DmemFile, DmemFileLine);
        --EXIT WHEN ENDFILE(DmemFile);
        MEM(i) := (OTHERS => '0');
        FOR j IN 0 TO C_WIDTH-1 LOOP
          READ (DmemFileLine, bitchar, bitsgood);
          IF ((bitsgood = FALSE) OR
              ((bitchar /= ' ') AND (bitchar /= cr) AND
              (bitchar /= ht) AND (bitchar /= lf) AND
              (bitchar /= '0') AND (bitchar /= '1') AND
              (bitchar /= 'x') AND (bitchar /= 'z'))) THEN
            ASSERT false REPORT "Warning: dmem: unknown or illegal " &
            "character encountered while reading mif - " &
            "finishing file read." & cr &
            "This could be due to an undersized mif file"
            SEVERITY WARNING;
            EXIT; -- abort the file read
          END IF;
          
          MEM(i)(C_WIDTH-1-j) := char_to_std_logic(bitchar);
        END LOOP; --j 
        
    ELSE --EOF
      EXIT;
    END IF;
      lines := i;
    END LOOP; --i
    
    FILE_CLOSE(DmemFile);

    RETURN MEM;

  END FUNCTION; 
 
  -- Wrapper function that calls the initialization fn depending on C_MEM_INIT 
  IMPURE FUNCTION fill_init (C_MEM_INIT      : IN INTEGER; 
                             C_MEM_INIT_FILE : IN STRING;
                             C_DEPTH         : IN INTEGER;
                             C_WIDTH         : IN INTEGER)
  RETURN dmem_type IS
    VARIABLE MEM : dmem_type;
  BEGIN
    IF (C_MEM_INIT = 1) THEN
      MEM := InitDmemFromFile (C_MEM_INIT_FILE, C_DEPTH, C_WIDTH);
    ELSE
      MEM := (OTHERS => (OTHERS => '0'));
    END IF;
    RETURN MEM;
  END FUNCTION; 

  --Declaration of the inferred Dist RAM. 
  --Initialize RAM 
  SIGNAL MEM : dmem_type := fill_init(C_MEM_INIT, C_MEM_INIT_FILE, 
                                      C_DEPTH, C_WIDTH); 
  
  --XST attribute declaration to infer distributed RAM or ROM
  ATTRIBUTE ram_extract        : STRING;
  ATTRIBUTE ram_extract OF MEM : SIGNAL IS "yes";
  ATTRIBUTE ram_style          : STRING;
  ATTRIBUTE ram_style   OF MEM : SIGNAL IS "distributed"; 

BEGIN
  -----------------------------------------------------------------------------
  -- Infer a Distributed RAM
  -----------------------------------------------------------------------------
    -----------
    -- Write
    -----------
    --Write is synchronous. On the CLK edge when data is written, RAM(ADDR) gives
    --the new value that was just written. In this way, RAM acts like 
    --WRITE_FIRST mode of the BRAM primitive. 
    pdmem: PROCESS (CLK)
    BEGIN
      IF CLK'EVENT AND CLK = '1' THEN
        IF WE = '1' THEN
          MEM(conv_INTEGER(ADDR)) <= DI; --to_bitvector(DI); 
        END IF;
      END IF;
    END PROCESS pdmem;
    
    ---------
    --Read 
    ---------
    --Read is asynchronous. 
    --Read "appears" to be synchronous during write. This is because RAM(ADDR)
    --updates to the new writen value (current value on the DI bus) on the 
    --CLK edge when write happens and thus acting like WRITE_FIRST.
    DO <= MEM(conv_integer(ADDR)); 

END xilinx;

