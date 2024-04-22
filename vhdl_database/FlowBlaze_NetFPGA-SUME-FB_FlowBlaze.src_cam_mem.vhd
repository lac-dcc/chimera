--  Module      : cam_mem.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : Top-level memory block of the CAM that instantiates either 
--                the SRL block or the BlockRAM block.
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
-- Structure:
--
--   << cam_mem >>
--              |
--              +- cam_mem_srl16    //SRL implementation
--              |
--              +- cam_mem_blk      //Block RAM implementation
--
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY std; 
USE std.textio.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL ;

ENTITY cam_mem IS
  GENERIC (
    C_DEPTH                          : INTEGER := 16;
    C_HAS_EN                         : INTEGER := 0;
    C_FAMILY                         : STRING  := "virtex5";
    C_INIT_WIDTH                     : INTEGER := 8;
    C_MATCHES_WIDTH                  : INTEGER := 8;
    C_MEM_INIT                       : INTEGER := 0;
    C_ELABORATION_DIR                : STRING  := "./";
    C_MEM_INIT_FILE                  : STRING  := "null.mif";
    C_MEM_TYPE                       : INTEGER := 0;
    C_RD_DATA_WIDTH                  : INTEGER := 8;
    C_SRL16_SRLS_PER_WORD            : INTEGER := 2;
    C_SRL16_WORDS_PER_BLOCK          : INTEGER := 256;
    C_SRL16_BLOCKS_PER_CAM           : INTEGER := 1;
    C_SRL16_WORDS_IN_LAST_BLOCK      : INTEGER := 16;
    C_SRL16_BLOCK_WR_ADDR_WIDTH      : INTEGER := 4;
    C_SRL16_BLOCK_SEL_WIDTH          : INTEGER := 0;
    C_SRL16_LAST_BLOCK_WR_ADDR_WIDTH : INTEGER := 4;
    C_TERNARY_MODE                   : INTEGER := 0;
    C_WIDTH                          : INTEGER := 8;
    C_HAS_WR_ADDR                    : INTEGER := 1;
    C_WR_ADDR_WIDTH                  : INTEGER := 4;
    C_WR_COUNT_WIDTH                 : INTEGER := 4;
    C_WR_DATA_BITS_WIDTH             : INTEGER := 4;
    C_WR_DATA_WIDTH                  : INTEGER := 8
    );

  PORT (
    --Inputs
    BUSY     : IN  STD_LOGIC := '0';
    CLK      : IN  STD_LOGIC := '0';
    EN       : IN  STD_LOGIC := '0';
    RD_DATA  : IN  STD_LOGIC_VECTOR(C_RD_DATA_WIDTH-1 DOWNTO 0)
                   := (OTHERS => '0');
    WE       : IN  STD_LOGIC := '0';
    WR_ADDR  : IN  STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0)
                   := (OTHERS => '0');
    WR_DATA  : IN  STD_LOGIC_VECTOR(C_WR_DATA_WIDTH-1 DOWNTO 0)
                   := (OTHERS => '0');
    WR_COUNT : IN  STD_LOGIC_VECTOR(C_WR_COUNT_WIDTH-1 DOWNTO 0)
                   := (OTHERS => '0');
    --Outputs
    MATCHES  : OUT STD_LOGIC_VECTOR(C_MATCHES_WIDTH-1 DOWNTO 0)
                   := (OTHERS => '0')
    );
    
 attribute max_fanout : integer;
 attribute max_fanout of all: entity is 10;

END cam_mem;

-------------------------------------------------------------------------------
-- Generic Definitions:
-------------------------------------------------------------------------------
  -- The following generics are set in cam_rtl.vhd
  -- C_INIT_WIDTH                     : Set to C_WIDTH.
  --                                    This generic is used only by 
  --                                    cam_mem_srl16.cam_mem_blk uses C_WIDTH 
  --                                    directly to generate the init vector.
  -- C_MATCHES_WIDTH                  : Set to C_DEPTH.
  -- C_RD_DATA_WIDTH,                 : Internal data bus widths. Set to a 
  --                                    multiple of 4 C_WR_DATA_WIDTH so they 
  --                                    can map to SRL16s), large enough for 
  --                                    binary data normally, and large enough 
  --                                    for ternary data in the ternary mode 
  --                                    case.  
  -- C_SRL16_SRLS_PER_WORD            : Number of srl16s per data width 
  --                                    = C_RD_DATA_WIDTH/4
  -- C_SRL16_WORDS_PER_BLOCK          : Number of srl16 words per block=256, 
  --                                    except for last block
  -- C_SRL16_BLOCKS_PER_CAM           : Number of blocks in the CAM =
  --                                    divroundup(C_DEPTH, 256)
  -- C_SRL16_WORDS_IN_LAST_BLOCK      : Number of words in the last block.
  --                                    For example if depth = 261, then 
  --                                      this value = 261 - 256 = 5. 
  --                                    If depth = 520, then 
  --                                      this value = 520 - 2(256) = 8
  -- C_SRL16_BLOCK_WR_ADDR_WIDTH      : Write addr width for each block=8 
  --                                    except last block.
  --                                    = get_min(C_WR_ADDR_WIDTH, 8)
  -- C_SRL16_BLOCK_SEL_WIDTH          : Number of block with 256 words, 
  --                                    For example if depth = 520 then 
  --                                    this value is 2
  -- C_SRL16_LAST_BLOCK_WR_ADDR_WIDTH : Write addr width for last block.
  --                                    For example if depth = 520, then
  --                                    #of words in last block=520-2(256)=8. 
  --                                    And the write addr width for the last 
  --                                    block is 3.
  -- C_WR_COUNT_WIDTH                 : 1 for Block Mem and 4 for SRL16. 
  --                                    Set in cam_rtl.vhd
  -- C_WR_DATA_BITS_WIDTH             : Set to C_WR_DATA_WIDTH / 4 in 
  --                                    cam_rtl.vhd
-------------------------------------------------------------------------------
-- Port Definitions:
-------------------------------------------------------------------------------
  -- Input Pins
  -- ---------- 
  -- BUSY     : BUSY output to the user. Generated by cam_control.vhd.
  -- RD_DATA  : The final encoded read data input for the CAM. Generated in 
  --            cam_input.vhd
  -- WE       : Internal Write Enable to the SRl16s and BRAMs generated by
  --            cam_control.vhd
  --            WE=(User WE) OR BUSY.The user only needs to pulse WE to trigger
  --            a write, the internal WE signal will go high with the user's 
  --            pulse of WE, and be locked high by the BUSY signal until the 
  --            write completes.

  -- WR_ADDR  : Internal write address generated by cam_input.vhd. 
  --            WR_ADDR = User WR_ADDR when write is not in progress
  --            WR_ADDR = Registered WR_ADDR when write is in progress
  -- WR_DATA  : The final encoded write data input for the CAM. Generated by 
  --            cam_input.vhd
  -- WR_COUNT : Internal Write Count(count to track write cycles) generated by
  --            cam_control.vhd
  -- Output Pins
  -- ------------ 
  -- MATCHES  : A 1D array of size C_DEPTH indicating the MATCH condition for 
  --            each address

-------------------------------------------------------------------------------
-- Architecture Delcaration
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF cam_mem IS

  -----------------------------------------------------------------------------
  -- rd_data and wr_data for block memory case (this is the appropriately-
  -- sized chunk of RD_DATA and WR_DATA, respectively)
  -----------------------------------------------------------------------------
  SIGNAL rd_data_bmem : STD_LOGIC_VECTOR(C_WIDTH-1 DOWNTO 0);
  SIGNAL wr_data_bmem : STD_LOGIC_VECTOR(C_WIDTH-1 DOWNTO 0);

  -----------------------------------------------------------------------------
  -- Initialization Data
  -----------------------------------------------------------------------------
  -- Full path of the init file
  CONSTANT q_mem_init_file  : STRING := C_ELABORATION_DIR & C_MEM_INIT_FILE;  
  
  -- Read .mif file and assign the contents to a single STD_LOGIC_VECTOR
  -- constant.
  CONSTANT init_file_content: STD_LOGIC_VECTOR(C_DEPTH*C_INIT_WIDTH-1 DOWNTO 0) 
    := read_init_file(q_mem_init_file, C_MEM_INIT, C_DEPTH, C_INIT_WIDTH);

  -----------------------------------------------------------------------------
  --Turn ON/OFF debug code. 
  --DEBUG=0 => Debug code turned off. Debug should be turned off for synthesis.
  --DEBUG=1 => Debug code tuned on.
  -----------------------------------------------------------------------------
  CONSTANT DEBUG : INTEGER := 0;

BEGIN
  -----------------------------------------------------------------------------
  --DEBUG code to print constants 
  -------------------------------------------------------------------------
  gdbg: IF (DEBUG=1) GENERATE
    PROCESS
      VARIABLE d_l : LINE;
    BEGIN
      write(d_l, STRING'("******** cam_mem - BEGIN ********"));
      writeline(output, d_l);

      write(d_l, STRING'("init_file_content:"));
      write(d_l, std_logic_vector_2_string(init_file_content));
      write(d_l, LF);
      write(d_l, STRING'("******** cam_mem- END ********"));
      writeline(output, d_l);
      WAIT;
    END PROCESS;
  END GENERATE gdbg;

  -----------------------------------------------------------------------------
  -- SRL16 implementation
  -----------------------------------------------------------------------------
  gsrl : IF (C_MEM_TYPE = C_SRL_MEM) GENERATE

    srlmem : ENTITY cam.cam_mem_srl16
      GENERIC MAP (
        C_DEPTH                          => C_DEPTH,
        C_HAS_EN                         => C_HAS_EN,
        C_MEM_INIT                       => C_MEM_INIT ,
        C_INIT_CONTENT                   => init_file_content,
        C_INIT_WIDTH                     => C_INIT_WIDTH,
        C_MATCHES_WIDTH                  => C_MATCHES_WIDTH,
        C_RD_DATA_WIDTH                  => C_RD_DATA_WIDTH,
        C_SRL16_BLOCK_SEL_WIDTH          => C_SRL16_BLOCK_SEL_WIDTH,
        C_SRL16_BLOCK_WR_ADDR_WIDTH      => C_SRL16_BLOCK_WR_ADDR_WIDTH,
        C_SRL16_BLOCKS_PER_CAM           => C_SRL16_BLOCKS_PER_CAM,
        C_SRL16_LAST_BLOCK_WR_ADDR_WIDTH => C_SRL16_LAST_BLOCK_WR_ADDR_WIDTH,
        C_SRL16_SRLS_PER_WORD            => C_SRL16_SRLS_PER_WORD,
        C_SRL16_WORDS_IN_LAST_BLOCK      => C_SRL16_WORDS_IN_LAST_BLOCK,
        C_SRL16_WORDS_PER_BLOCK          => C_SRL16_WORDS_PER_BLOCK,
        C_TERNARY_MODE                   => C_TERNARY_MODE,
        C_WR_ADDR_WIDTH                  => C_WR_ADDR_WIDTH,
        C_WR_COUNT_WIDTH                 => C_WR_COUNT_WIDTH,
        C_WR_DATA_BITS_WIDTH             => C_WR_DATA_BITS_WIDTH,
        C_WR_DATA_WIDTH                  => C_WR_DATA_WIDTH
        )
      PORT MAP (
        --Inputs
        BUSY     => BUSY,
        CLK      => CLK,
        EN       => EN,
        RD_DATA  => RD_DATA,
        WE       => WE,
        WR_ADDR  => WR_ADDR,
        WR_DATA  => WR_DATA,
        WR_COUNT => WR_COUNT,
        --Outputs
        MATCHES  => MATCHES
        );
  END GENERATE gsrl;

  -----------------------------------------------------------------------------
  -- Block Memory Implementation
  -----------------------------------------------------------------------------
   gblk : IF (C_MEM_TYPE = C_BLOCK_MEM) GENERATE

    --Assign rd_data_bmem and wr_data_bmem to a chunk of RD_DATA and WR_DATA.
    --This assignment has no effect for non-ternary mode because the width of 
    --RD_DATA and WR_DATA is C_WIDTH anyways. This is left for future support 
    --of ternary modes in the Block RAM implementation.
    rd_data_bmem <= RD_DATA(C_WIDTH-1 DOWNTO 0);
    wr_data_bmem <= WR_DATA(C_WIDTH-1 DOWNTO 0);
    
    blkmem : ENTITY cam.cam_mem_blk
      GENERIC MAP (
        C_MEM_INIT_FILE      => q_mem_init_file, --mif file needed for dmem.vhd
        C_MEM_INIT           => C_MEM_INIT,
        C_INIT_VECTOR        => init_file_content,
        C_HAS_WR_ADDR        => C_HAS_WR_ADDR,
        C_WR_ADDR_WIDTH      => C_WR_ADDR_WIDTH,
        C_WR_COUNT_WIDTH     => C_WR_COUNT_WIDTH,
        C_DEPTH              => C_DEPTH,
        C_FAMILY             => C_FAMILY,
        C_WIDTH              => C_WIDTH
        )
      PORT MAP (
        BUSY     => BUSY,
        CLK      => CLK,
        EN       => EN,
        RD_DATA  => rd_data_bmem,
        WE       => WE,
        WR_ADDR  => WR_ADDR,
        WR_DATA  => wr_data_bmem,
        WR_COUNT => WR_COUNT,
        MATCHES  => MATCHES
        );
   END GENERATE gblk;

END xilinx;
