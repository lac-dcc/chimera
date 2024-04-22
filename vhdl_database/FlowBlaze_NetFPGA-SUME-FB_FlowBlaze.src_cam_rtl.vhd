--  Module      : cam_rtl.vhd
--  Version     : 1.1
--  Last Update : 01 March 2011
--  Project     : CAM

--  Description : Top-level synthesizable core file
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
--                      
-- Structure:
-- 
--        <<< cam_rtl.vhd >>>
--             |
--             |
--             +- cam_input         
--             |     |
--             |     +- cam_input_ternary                  
--             |          |
--             |          +- cam_input_ternary_ternenc  *Ternary Encoder*
--             |
--             +- cam_mem
--             |     |
--             |     +- cam_mem_srl16   //SRL based CAM
--             |     |      |
--             |     |      +- cam_mem_srl16_wrcomp    *Non-ternary Comparator*   
--             |     |      |
--             |     |      +- cam_mem_srl16_ternwrcomp *Ternary Comparator* 
--             |     |      |
--             |     |      +- cam_decoder              *Block Decoder*
--             |     |      |
--             |     |      +- cam_mem_srl16_block      *SRL16 blocks* 
--             |     |            |
--             |     |            +- cam_mem_srl16_block_word   
--             |     |                  |
--             |     |                  +- srl16e primitives              
--             |     |     
--             |     |
--             |     +- cam_mem_blk     //Block RAM based CAM
--             |            |
--             |            +- dmem   *Erase mem (Inferred Dist RAM)* 
--             |            |
--             |            |
--             |            +- cam_mem_blk_extdepth  *BRAM blocks*
--             |                  |
--             |                  +- cam_mem_blk_extdepth_prim
--             |                        |
--             |                        +- RAMB primitives   
--             |
--             |
--             +- cam_control           //Control logic
--             |
--             |
--             +- cam_match_enc         //Match logic
--             |
--             |
--             +- cam_regouts           //Register CAM outputs
--
--
-------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL;

ENTITY cam_rtl IS
  GENERIC (
    C_ADDR_TYPE             :     INTEGER := 0;
    C_CMP_DATA_MASK_WIDTH   :     INTEGER := 8; 
    C_CMP_DIN_WIDTH         :     INTEGER := 8;
    C_DATA_MASK_WIDTH       :     INTEGER := 8; 
    C_DEPTH                 :     INTEGER := 16;
    C_DIN_WIDTH             :     INTEGER := 8;
    C_FAMILY                :     STRING  := "virtex6";
    C_HAS_CMP_DATA_MASK     :     INTEGER := 1; 
    C_HAS_CMP_DIN           :     INTEGER := 1;
    C_HAS_DATA_MASK         :     INTEGER := 1;
    C_HAS_EN                :     INTEGER := 1;
    C_HAS_MULTIPLE_MATCH    :     INTEGER := 1;
    C_HAS_READ_WARNING      :     INTEGER := 1;
    C_HAS_SINGLE_MATCH      :     INTEGER := 1;
    C_HAS_WE                :     INTEGER := 1;
    C_HAS_WR_ADDR           :     INTEGER := 1;
    C_MATCH_ADDR_WIDTH      :     INTEGER := 4;
    C_MATCH_RESOLUTION_TYPE :     INTEGER := 0;
    C_MEM_INIT              :     INTEGER := 1;
    C_MEM_INIT_FILE         :     STRING  :=  "init.mif";
    C_ELABORATION_DIR       :     STRING  := "./";
    C_MEM_TYPE              :     INTEGER :=  0;
    C_READ_CYCLES           :     INTEGER :=  1;
    C_REG_OUTPUTS           :     INTEGER :=  0;
    C_TERNARY_MODE          :     INTEGER :=  1;
    C_WIDTH                 :     INTEGER :=  8;
    C_WR_ADDR_WIDTH         :     INTEGER :=  4
    );
  PORT (
    CLK                : IN  STD_LOGIC := '0';
    CMP_DATA_MASK      : IN  STD_LOGIC_VECTOR(C_CMP_DATA_MASK_WIDTH-1 DOWNTO 0)
                             := (OTHERS => '0');
    CMP_DIN            : IN  STD_LOGIC_VECTOR(C_CMP_DIN_WIDTH-1 DOWNTO 0)
                             := (OTHERS => '0');
    DATA_MASK          : IN  STD_LOGIC_VECTOR(C_DATA_MASK_WIDTH-1 DOWNTO 0)
                             := (OTHERS => '0');
    DIN                : IN  STD_LOGIC_VECTOR(C_DIN_WIDTH-1 DOWNTO 0)
                             := (OTHERS => '0');
    EN                 : IN  STD_LOGIC := '0';
    WE                 : IN  STD_LOGIC := '0';
    WR_ADDR            : IN  STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0)
                             := (OTHERS => '0');
    BUSY               : OUT STD_LOGIC := '0';
    MATCH              : OUT STD_LOGIC := '0';
    MATCH_ADDR         : OUT STD_LOGIC_VECTOR(C_MATCH_ADDR_WIDTH-1 DOWNTO 0)
                             := (OTHERS => '0');
    MULTIPLE_MATCH     : OUT STD_LOGIC := '0';
    READ_WARNING       : OUT STD_LOGIC := '0';
    SINGLE_MATCH       : OUT STD_LOGIC := '0'
    );
    
attribute max_fanout : integer;
attribute max_fanout of all: entity is 10;

END cam_rtl;

-------------------------------------------------------------------------------
-- Generic Definitions:
-------------------------------------------------------------------------------
  -- C_ADDR_TYPE             : Determines if the MATCH_ADDR port is encoded 
  --                           or decoded. 
  --                           0 = Binary Encoded
  --                           1 = Single Match Unencoded (one-hot)
  --                           2 = Multi-match Unencoded (shows all matches)
  -- C_CMP_DATA_MASK_WIDTH   : Width of the CMP_DATA_MASK port
  --                           (same as C_WIDTH)
  -- C_CMP_DIN_WIDTH         : Width of the CMP_DIN port
  --                           (same as C_WIDTH)
  -- C_DATA_MASK_WIDTH       : Width of the DATA_MASK port
  --                           (same as C_WIDTH)
  -- C_DEPTH                 : Depth of the CAM (Must be > 2)
  -- C_DIN_WIDTH             : Width of the DIN port
  --                           (same as C_WIDTH)
  -- C_FAMILY                : Architecture
  -- C_HAS_CMP_DATA_MASK     : 1 if CMP_DATA_MASK input port present
  -- C_HAS_CMP_DIN           : 1 if CMP_DIN input port present
  --                           (for simultaneous read/write in 1 clk cycle)
  -- C_HAS_DATA_MASK         : 1 if DATA_MASK input port present 
  --                           (for ternary mode)
  -- C_HAS_EN                : 1 if EN input port present
  -- C_HAS_MULTIPLE_MATCH    : 1 if MULTIPLE_MATCH output port present
  -- C_HAS_READ_WARNING      : 1 if READ_WARNING output port present
  -- C_HAS_SINGLE_MATCH      : 1 if SINGLE_MATCH output port present
  -- C_HAS_WE                : 1 if WE input port present
  -- C_HAS_WR_ADDR           : 1 if WR_ADDR input port present
  -- C_MATCH_ADDR_WIDTH      : Determines the width of the MATCH_ADDR port
  --                           log2roundup(C_DEPTH) if C_ADDR_TYPE = 0
  --                           C_DEPTH              if C_ADDR_TYPE = 1 or 2
  -- C_MATCH_RESOLUTION_TYPE : When C_ADDR_TYPE = 0 or 1, only one match can
  --                           be output.
  --                           0 = Output lowest matching address
  --                           1 = Output highest matching address
  -- C_MEM_INIT              : Determines if the CAM needs to be initialized 
  --                           from a file
  --                           0 = Do not initialize CAM
  --                           1 = Initialize CAM
  -- C_MEM_INIT_FILE         : Filename of the .mif file for initializing CAM
  -- C_ELABORATION_DIR       : Directory location of the mif file  
  -- C_MEM_TYPE              : Determines the type of memory that the CAM is 
  --                           built using
  --                           0 = SRL16E implementation
  --                           1 = Block Memory implementation
  -- C_READ_CYCLES           : Read Latency of the CAM (always fixed as 1)
  -- C_REG_OUTPUTS           : For use with Block Memory ONLY.
  --                           0 = Do not add extra output registers.
  --                           1 = Add output registers
  -- C_TERNARY_MODE          : Determines whether the CAM is in ternary mode.
  --                           0 = Non-ternary (Binary) CAM
  --                           1 = Ternary CAM (can store X's)
  --                           2 = Enhanced Ternary CAM (can store X's and U's)
  -- C_WIDTH                 : Determines the width of the CAM.
  -- C_WR_ADDR_WIDTH         : Width of WR_ADDR port = log2roundup(C_DEPTH)
    
-------------------------------------------------------------------------------
-- Port Definitions:
-------------------------------------------------------------------------------
  -- Mandatory Input Pins
  -- --------------------
  -- CLK       : Clock
  -- DIN [n:0] : Data to be written to CAM during write operation. Also, the  
  --             data to look-up from the CAM during read operation when 
  --             simultaneous read/write feature is not selected.
  --
  -- Optional Input Pins
  -- --------------------
  -- EN                  : Control signal to enable write and read operations
  -- WE                  : Control signal to enable transfer of data from DIN
  --                       bus to the CAM 
  -- WR_ADDR [a:0]       : Write Address of the CAM
  -- CMP_DIN [n:0]       : Data to look up from the CAM when simultaneous 
  --                       read/write feature is selected.
  -- DATA_MASK [n:0]     : Interacts with DIN bus to create new bit values 
  --                       in ternary mode
  -- CMP_DATA_MASK [n:0] : Interacts with CMP_DIN bus to create new bit values 
  --                       in ternary mode if simultaneous read/write feature
  --                       is selected
  -----------------------------------------------------------------------------
  -- Mandatory Output Pins
  -- ---------------------
  -- BUSY             : Busy pin-indicates that write operation is currently 
  --                    executed
  -- MATCH            : Match pin-indicates at least one location in the CAM 
  --                    contains the same data as DIN (or CMP_DIN if 
  --                    simultaneous read/write feature is selected)
  -- MATCH_ADDR [m:0] : CAM address where matching data resides
  --
  -- Optional Output Pins
  -- --------------------
  -- SINGLE_MATCH        : Indicates the existence of matching data in only one
  --                       location of the CAM
  -- MULTIPLE_MATCH      : Indicates the existence of matching data in more 
  --                       than one location of the CAM
  -- READ_WARNING        : Warning flag that indicates that the data applied to
  --                       the CAM for a read operation is same as the data 
  --                       currently being written to the CAM during an 
  --                       unfinished write operation
-------------------------------------------------------------------------------

ARCHITECTURE xilinx OF cam_rtl IS

-------------------------------------------------------------------------------
-- Constants and Signals declaration 
-------------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- Read and Write Clock Cycles Counters
  -----------------------------------------------------------------------------
  -- Set the number of read/write clock cycles, and the width of the counter
  -- necessary for counting that many cycles
  -- C_RD_CLOCK_CYCLES could be a possible user parameter in future when 
  -- multi-cycle read feature is supported.
  CONSTANT C_RD_CLOCK_CYCLES : INTEGER := 1;  
  -- if C_MEM_TYPE=block,  then C_WR_CLOCK_CYCLES=2,
  -- if C_MEM_TYPE=srl16e, then C_WR_CLOCK_CYCLES=16 
  CONSTANT C_WR_CLOCK_CYCLES : INTEGER := if_then_else(C_MEM_TYPE, 2, 16);  
  
  -- Widths of the read and write cycle counters
  -- Currently, RD_CLOCK_CYCLES is fixed as 1 and so C_RD_COUNT_WIDTH=0
  CONSTANT C_RD_COUNT_WIDTH  : INTEGER 
    := binary_width_of_integer(C_RD_CLOCK_CYCLES-1);
  -- For Block Mem, C_WR_COUNT_WIDTH=1. For SRL16, C_WR_DOUNT_WIDTH=4
  CONSTANT C_WR_COUNT_WIDTH  : INTEGER 
    := binary_width_of_integer(C_WR_CLOCK_CYCLES-1);

  -- Output of counters for counting clock cycles
  SIGNAL rd_count : STD_LOGIC_VECTOR(C_RD_COUNT_WIDTH DOWNTO 0)
                    := (OTHERS => '0');
  SIGNAL wr_count : STD_LOGIC_VECTOR(C_WR_COUNT_WIDTH-1 DOWNTO 0)
                    := (OTHERS => '0');

  -----------------------------------------------------------------------------
  -- Internal din and data_mask inputs to the core  
  -----------------------------------------------------------------------------
  -- These signals are generated by cam_input depending on C_HAS_CMP_DIN
  -- and C_HAS_CMP_DATA_MASK generics. 
  -- For example, if C_HAS_CMP_DIN=1, rd_din=CMP_DIN
  --              if C_HAS_CMP_DIN=0, rd_din=DIN 
  -- The behavior of DIN,DATA_MASK,CMP_DIN,and CMP_DATA_MASK varies depending
  -- on core configuration, but these signals always represent the data 
  -- actually being read from or written to the core.
  -- The constants are the widths of each signal, respectively.
  -- Currently, all four of these constants are the same as C_WIDTH. These
  -- constants may be useful in the future if width of DATA_MASK will be 
  -- different from the width of DIN.
  CONSTANT C_RD_DATA_MASK_WIDTH : INTEGER := C_WIDTH;
  CONSTANT C_RD_DIN_WIDTH       : INTEGER := C_WIDTH;
  CONSTANT C_WR_DATA_MASK_WIDTH : INTEGER := C_WIDTH;
  CONSTANT C_WR_DIN_WIDTH       : INTEGER := C_WIDTH;
  
  SIGNAL   rd_data_mask   : STD_LOGIC_VECTOR(C_RD_DATA_MASK_WIDTH-1 DOWNTO 0)
                            := (OTHERS => '0');
  SIGNAL   rd_din         : STD_LOGIC_VECTOR(C_RD_DIN_WIDTH-1 DOWNTO 0)
                            := (OTHERS => '0');
  SIGNAL   wr_data_mask   : STD_LOGIC_VECTOR(C_WR_DATA_MASK_WIDTH-1 DOWNTO 0)
                            := (OTHERS => '0');
  SIGNAL   wr_din         : STD_LOGIC_VECTOR(C_WR_DIN_WIDTH-1 DOWNTO 0)
                            := (OTHERS => '0');

  -----------------------------------------------------------------------------
  -- Final encoded Write and Read Data Inputs to the core  
  -----------------------------------------------------------------------------
  -- Calculate the width of the data bus necessary to ternary encode the data
  CONSTANT C_RD_DATA_TERNARY_WIDTH : INTEGER 
    := roundup_to_multiple(C_RD_DIN_WIDTH*2, 4);
  CONSTANT C_WR_DATA_TERNARY_WIDTH : INTEGER 
    := roundup_to_multiple(C_WR_DIN_WIDTH*2, 4);

  -- Set the internal data bus widths to a multiple of 4 (so they can map to
  -- SRL16s), large enough for binary data normally, and large enough for
  -- ternary data in the ternary mode case 
  CONSTANT C_RD_DATA_WIDTH : INTEGER := roundup_to_multiple(
                                        if_then_else(C_TERNARY_MODE, 
                                                     C_RD_DATA_TERNARY_WIDTH, 
                                                     C_RD_DIN_WIDTH), 4);
  CONSTANT C_WR_DATA_WIDTH : INTEGER := roundup_to_multiple(
                                        if_then_else(C_TERNARY_MODE, 
                                                     C_WR_DATA_TERNARY_WIDTH, 
                                                     C_WR_DIN_WIDTH), 4);

  
  --The final, encoded read data input for the CAM 
  --(from rd_din_ternary if C_TERNARY_MODE=ternary, rd_din_binary otherwise)
  SIGNAL rd_data : STD_LOGIC_VECTOR(C_RD_DATA_WIDTH-1 DOWNTO 0) 
                   := (OTHERS => '0');
  --The final, encoded write data input for the CAM 
  --(from wr_din_ternary if C_TERNARY_MODE=ternary, wr_din_binary otherwise)
  SIGNAL wr_data : STD_LOGIC_VECTOR(C_WR_DATA_WIDTH-1 DOWNTO 0) 
                   := (OTHERS => '0');

  --Calculated values needed for the SRL16 CAM.
  -- Calculate number of srl16s per data width 
  CONSTANT C_SRL16_SRLS_PER_WORD            : INTEGER := C_RD_DATA_WIDTH/4;

  -- Number of srl16 words per block = 256, except for last block
  CONSTANT C_SRL16_WORDS_PER_BLOCK          : INTEGER := 256;

  -- Number of blocks in the cam, for example if depth <= 256 then this value is 1,
  -- if depth = 261 then this value is 2
  CONSTANT C_SRL16_BLOCKS_PER_CAM           : INTEGER 
    := divroundup(C_DEPTH, C_SRL16_WORDS_PER_BLOCK);

  -- Number of words in the last block, for example if depth = 261, then this value 
  -- equal to 261 - 256 = 5. If depth = 520, the this value = 520 - 2(256) = 8 
  CONSTANT C_SRL16_WORDS_IN_LAST_BLOCK      : INTEGER 
    := C_DEPTH - ((C_SRL16_BLOCKS_PER_CAM-1) * C_SRL16_WORDS_PER_BLOCK);

  -- write address width for each block = 8 except last block 
  CONSTANT C_SRL16_BLOCK_WR_ADDR_WIDTH      : INTEGER 
    := get_min(C_WR_ADDR_WIDTH, 8);

  -- number of block with 256 words, for example if depth = 520 then 
  -- this value is 2 
  CONSTANT C_SRL16_BLOCK_SEL_WIDTH          : INTEGER 
    := C_WR_ADDR_WIDTH - C_SRL16_BLOCK_WR_ADDR_WIDTH;

  -- write address  width for last block, for example if depth = 520, then
  -- number of words in last block is 520 - 2(256) = 8. And the write address
  -- width  for the last block is 3 
  CONSTANT C_SRL16_LAST_BLOCK_WR_ADDR_WIDTH : INTEGER 
    := addr_width_for_depth(C_SRL16_WORDS_IN_LAST_BLOCK);

  CONSTANT C_RD_DATA_TMP_WIDTH  : INTEGER 
    := if_then_else(C_TERNARY_MODE, C_RD_DATA_TERNARY_WIDTH, C_RD_DIN_WIDTH);
  CONSTANT C_WR_DATA_TMP_WIDTH  : INTEGER 
    := if_then_else(C_TERNARY_MODE, C_WR_DATA_TERNARY_WIDTH, C_WR_DIN_WIDTH);

  -- Widths of internal signals which are used between various blocks
  CONSTANT C_WR_ADDR_INT_WIDTH  : INTEGER := C_WR_ADDR_WIDTH;

  CONSTANT C_WR_DATA_BITS_WIDTH : INTEGER := C_WR_DATA_WIDTH / 4;
  CONSTANT C_MATCHES_WIDTH      : INTEGER := C_DEPTH;

  -- Set C_REG_MATCH_LOGIC to 0 for Block Memory, 1 for SRL16
  CONSTANT C_REG_MATCH_LOGIC    : INTEGER := if_then_else(C_MEM_TYPE, 0, 1);

  -- Calculate word width of CAM for initialization purpose
  -- SRL16 uses this constant. BRAM does not
  CONSTANT C_INIT_WIDTH         : INTEGER := C_WIDTH;

  ------internal signals for each port  ---------------------------------------
  --Inputs
  SIGNAL clk_i            : STD_LOGIC := '0';
  SIGNAL en_i             : STD_LOGIC := '0';
  SIGNAL we_i             : STD_LOGIC := '0';
  SIGNAL wr_addr_i        : STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0) 
                            := (OTHERS => '0');
  -- These signals are the internal copies of DATA_MASK, DIN, CMP_DATA_MASK,
  -- and CMP_DIN ports.
  -- In this module, they are either connected to the external ports or 
  -- tied-off, depending on the C_HAS_CMP_DIN and C_HAS_DATA_MASK generics.
  SIGNAL data_mask_i      : STD_LOGIC_VECTOR(C_DATA_MASK_WIDTH-1 DOWNTO 0) 
                            := (OTHERS => '0');
  SIGNAL din_i            : STD_LOGIC_VECTOR(C_DIN_WIDTH-1 DOWNTO 0) 
                            := (OTHERS => '0');
  SIGNAL cmp_data_mask_i  : STD_LOGIC_VECTOR(C_CMP_DATA_MASK_WIDTH-1 DOWNTO 0) 
                            := (OTHERS => '0');
  SIGNAL cmp_din_i        : STD_LOGIC_VECTOR(C_CMP_DIN_WIDTH-1 DOWNTO 0) 
                            := (OTHERS => '0');
  --Outputs
  SIGNAL busy_i           : STD_LOGIC := '0';
  SIGNAL match_i          : STD_LOGIC := '0';
  SIGNAL match_addr_i     : STD_LOGIC_VECTOR(C_MATCH_ADDR_WIDTH-1 DOWNTO 0) 
                            := (OTHERS => '0');
  SIGNAL multiple_match_i : STD_LOGIC := '0';
  SIGNAL read_warning_i   : STD_LOGIC := '0';
  SIGNAL single_match_i   : STD_LOGIC := '0';

  -------registered versions of output ports for block memory  ----------------
  SIGNAL match_q          : STD_LOGIC := '0';
  SIGNAL match_addr_q     : STD_LOGIC_VECTOR(C_MATCH_ADDR_WIDTH-1 DOWNTO 0)
                            := (OTHERS => '0');
  SIGNAL multiple_match_q : STD_LOGIC := '0';
  SIGNAL read_warning_q   : STD_LOGIC := '0';
  SIGNAL single_match_q   : STD_LOGIC := '0';

  --signals output from the match logic
  SIGNAL a_match          : STD_LOGIC := '0';
  SIGNAL a_match_addr_1h  : STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0) 
                            := (OTHERS => '0');
  SIGNAL a_match_addr_mm  : STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0) 
                            := (OTHERS => '0');
  SIGNAL a_match_addr_bin : STD_LOGIC_VECTOR(C_WR_ADDR_INT_WIDTH-1 DOWNTO 0)
                            := (OTHERS => '0');
  SIGNAL a_multiple_match : STD_LOGIC := '0';
  SIGNAL a_single_match   : STD_LOGIC := '0';

  -------internal signals, not connected to ports  ----------------------------
  SIGNAL wr_addr_ilog     : STD_LOGIC_VECTOR(C_WR_ADDR_INT_WIDTH-1 DOWNTO 0)
                            := (OTHERS => '0');

  -- Enable for input registers
  SIGNAL reg_en           : STD_LOGIC := '1';

  -- Match vector from the memory blocks
  SIGNAL matches          : STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0) 
                            := (OTHERS => '0');

  
  --Internal write_enable signal
  SIGNAL wren             : STD_LOGIC := '0';

  -- Signal for clearing the read_warning decoder
  SIGNAL rw_dec_clr_i     : STD_LOGIC := '0';

  attribute max_fanout of all: signal is 10;

-------------------------------------------------------------------------------
-- Begin the architecture
-------------------------------------------------------------------------------
BEGIN

  -----------------------------------------------------------------------------
  -- Mandatory Pins
  -----------------------------------------------------------------------------
  --Clock
  clk_i <= CLK;

  --Data input bus
  din_i <= DIN;

  --Busy Flag
  BUSY <= busy_i;

  --Match flag
  grm : IF C_REG_OUTPUTS = 1 GENERATE
    MATCH <= match_q;
  END GENERATE grm;
  ngrm : IF C_REG_OUTPUTS = 0 GENERATE
    MATCH <= match_i;
  END GENERATE ngrm;

  --Address of match
  gmad    : IF C_REG_OUTPUTS = 1 GENERATE
    MATCH_ADDR <= match_addr_q;
  END GENERATE gmad;
  ngmad : IF C_REG_OUTPUTS = 0 GENERATE
    MATCH_ADDR <= match_addr_i;
  END GENERATE ngmad;

  -----------------------------------------------------------------------------
  -- Optional Pins
  -----------------------------------------------------------------------------
  --Write Enable
  gwe   : IF C_HAS_WE = 1 GENERATE
    we_i <= WE;
  END GENERATE gwe;
  ngwe : IF C_HAS_WE = 0 GENERATE
    we_i <= '0';
  END GENERATE ngwe;

  --Write Address
  gwad   : IF C_HAS_WR_ADDR = 1 GENERATE
    wr_addr_i <= WR_ADDR;
  END GENERATE gwad;
  ngwad : IF C_HAS_WR_ADDR = 0 GENERATE
    wr_addr_i <= (OTHERS => '0');
  END GENERATE ngwad;

  -- Data Mask
  gdm   : IF C_HAS_DATA_MASK = 1 GENERATE
    data_mask_i <= DATA_MASK;
  END GENERATE gdm;
  ngdm : IF C_HAS_DATA_MASK = 0 GENERATE
    data_mask_i <= (OTHERS => '0');
  END GENERATE ngdm;

  -- Data Mask (compare port)
  gcdm   : IF C_HAS_DATA_MASK = 1 GENERATE
    cmp_data_mask_i <= CMP_DATA_MASK;
  END GENERATE gcdm;
  ngcdm : IF C_HAS_DATA_MASK = 0 GENERATE
    cmp_data_mask_i <= (OTHERS => '0');
  END GENERATE ngcdm;

  -- Compare port
  gcd   : IF C_HAS_CMP_DIN = 1 GENERATE
    cmp_din_i <= CMP_DIN;
  END GENERATE gcd;
  ngcd : IF C_HAS_CMP_DIN = 0 GENERATE
    cmp_din_i <= (OTHERS => '0');
  END GENERATE ngcd;

  -- Core Enable
  gen   : IF C_HAS_EN = 1 GENERATE
    en_i <= EN;
  END GENERATE gen;
  ngen : IF C_HAS_EN = 0 GENERATE
    en_i <= '1';
  END GENERATE ngen;

  -- Multiple Match Flag
  gmm : IF C_HAS_MULTIPLE_MATCH = 1 GENERATE
    greg : IF C_REG_OUTPUTS = 1 GENERATE
      MULTIPLE_MATCH <= multiple_match_q;
    END GENERATE greg;
    ngreg : IF C_REG_OUTPUTS = 0 GENERATE
      MULTIPLE_MATCH <= multiple_match_i;
    END GENERATE ngreg;
  END GENERATE gmm;
  -- No Multiple Match Flag
  ngmm : IF C_HAS_MULTIPLE_MATCH = 0 GENERATE
    MULTIPLE_MATCH <= '0';
  END GENERATE ngmm;

  -- Read Warning Flag
  grw : IF C_HAS_READ_WARNING = 1 GENERATE
    greg : IF C_REG_OUTPUTS = 1 GENERATE
      READ_WARNING <= read_warning_q;
    END GENERATE greg;
    ngreg : IF C_REG_OUTPUTS = 0 GENERATE
      READ_WARNING <= read_warning_i;
    END GENERATE ngreg;
  END GENERATE grw;
  -- No Read Warning Flag
  ngrw : IF C_HAS_READ_WARNING = 0 GENERATE
    READ_WARNING <= '0';
  END GENERATE ngrw;

  -- Single Match Flag
  gsm : IF C_HAS_SINGLE_MATCH = 1 GENERATE
    greg : IF C_REG_OUTPUTS = 1 GENERATE
      single_match <= single_match_q;
    END GENERATE greg;
    ngreg : IF C_REG_OUTPUTS = 0 GENERATE
      single_match <= single_match_i;
    END GENERATE ngreg;
  END GENERATE gsm;
  -- No Single Match Flag
  ngsm : IF C_HAS_SINGLE_MATCH = 0 GENERATE
    SINGLE_MATCH <= '0';
  END GENERATE ngsm;


  -- Assertions
  
  ASSERT ( (C_FAMILY = virtex4) OR (C_FAMILY = virtex5) OR (C_FAMILY = virtex6) 
  OR (C_FAMILY = virtex6l) OR (C_FAMILY = spartan3) OR (C_FAMILY = spartan3e) 
  OR (C_FAMILY = spartan3a) OR (C_FAMILY = spartan3adsp) OR (C_FAMILY = aspartan3)
  OR (C_FAMILY = aspartan3e) OR (C_FAMILY = spartan6)  )
    REPORT "Invalid configuration: C_FAMILY must be virtex4, virtex5, virtex6, virtex6l, spartan3, spartan3e, spartan3a, spartan3adsp, aspartan3, aspartan3e, or spartan6 "
    SEVERITY FAILURE;

  --ASSERT ( (C_DEPTH > 15) AND (C_DEPTH < 4097) )
    --REPORT "Invalid configuration: C_DEPTH must be between 16 and 4096, inclusive"
    --SEVERITY FAILURE;

  ASSERT ( (C_WIDTH > 0) AND (C_WIDTH < 513) )
    REPORT "Invalid configuration: C_WIDTH must be between 1 and 512, inclusive"
    SEVERITY FAILURE;

  ASSERT ( (C_ADDR_TYPE = 0) OR (C_ADDR_TYPE = 1) OR (C_ADDR_TYPE = 2) )
    REPORT "Invalid configuration: C_ADDR_TYPE must be 0, 1, or 2"
    SEVERITY FAILURE;

  ASSERT (C_CMP_DATA_MASK_WIDTH = C_WIDTH)
    REPORT "Invalid configuration: C_CMP_DATA_MASK_WIDTH must equal C_WIDTH"
    SEVERITY FAILURE;

  ASSERT (C_CMP_DIN_WIDTH = C_WIDTH)
    REPORT "Invalid configuration: C_CMP_DIN_WIDTH must equal C_WIDTH"
    SEVERITY FAILURE;

  ASSERT (C_DATA_MASK_WIDTH = C_WIDTH)
    REPORT "Invalid configuration: C_DATA_MASK_WIDTH must equal C_WIDTH"
    SEVERITY FAILURE;
  
  ASSERT (C_DIN_WIDTH = C_WIDTH)
    REPORT "Invalid configuration: C_DIN_WIDTH must equal C_WIDTH"
    SEVERITY FAILURE;
    
check: IF (C_HAS_CMP_DATA_MASK = 0) GENERATE   
  ASSERT  (NOT ( (C_TERNARY_MODE > 0) AND (C_HAS_CMP_DIN = 1) ))
    REPORT "Invalid configuration: C_HAS_CMP_DIN = 1 and C_TERNARY_MODE = 1 or 2 requires C_HAS_CMP_DATA_MASK = 1"
    SEVERITY FAILURE;
END GENERATE check;

check2: IF (C_HAS_CMP_DATA_MASK = 1) GENERATE
  ASSERT  ( (C_TERNARY_MODE > 0) AND (C_HAS_CMP_DIN = 1) )
    REPORT "Invalid configuration: C_HAS_CMP_DATA_MASK = 1 requires C_TERNARY_MODE = 1 or 2 and C_HAS_CMP_DIN = 1"
    SEVERITY FAILURE;
END GENERATE check2;
  
  ASSERT (C_HAS_DATA_MASK = 1 XNOR C_TERNARY_MODE > 0)
    REPORT "Invalid configuration: DATA_MASK requires C_TERNARY_MODE = 1 or 2"
    SEVERITY FAILURE;

  ASSERT (NOT(C_HAS_WE = 0 AND C_MEM_INIT = 0))
    REPORT "Invalid configuration: No write enable(C_HAS_WE=0) requires C_MEM_INIT = 1"
    SEVERITY FAILURE;
  
  ASSERT (C_HAS_WR_ADDR  =  C_HAS_WE)
    REPORT "Invalid configuration: WR_ADDR requires C_HAS_WE = 1"
    SEVERITY FAILURE;

  ASSERT ( (C_MATCH_ADDR_WIDTH = addr_width_for_depth(C_DEPTH) AND (C_ADDR_TYPE = 0)) OR (C_MATCH_ADDR_WIDTH = C_DEPTH AND C_ADDR_TYPE > 0)) 
    REPORT "Invalid configuration: MATCH_ADDR width must be log2roundup(C_DEPTH) for Binary encoded output, or equal to C_DEPTH for unencoded output"
    SEVERITY FAILURE;
  
  ASSERT (NOT(C_REG_OUTPUTS = 1 AND C_MEM_TYPE = 0))
    REPORT "Invalid configuration: Registered outputs are only available for BRAM (C_MEM_TYPE=1)"
    SEVERITY FAILURE;

  ASSERT (NOT(C_TERNARY_MODE > 0 AND C_MEM_TYPE = 1))
    REPORT "Invalid configuration: Ternary Modes require SRL16 (C_MEM_TYPE=0)"
    SEVERITY FAILURE;

  ASSERT (NOT(C_TERNARY_MODE = 2 AND C_MEM_INIT = 1))
    REPORT "Invalid configuration: Enhanced Ternary mode cannot be initialized with a MIF file"
    SEVERITY FAILURE;

check3: IF C_HAS_WE = 1 GENERATE
  ASSERT (C_WR_ADDR_WIDTH = addr_width_for_depth(C_DEPTH))
    REPORT "Invalid configuration: WR_ADDR width must be log2roundup(C_DEPTH)"
    SEVERITY FAILURE;
END GENERATE check3;
  
  -----------------------------------------------------------------------------
  -- INPUT LOGIC
  --   This module registers the inputs to the CAM so that the user can not
  --   change them while a write is in progress.
  -----------------------------------------------------------------------------
  ilog : ENTITY cam.cam_input
    GENERIC MAP (
      --Input widths
      C_DIN_WIDTH             => C_DIN_WIDTH,
      C_DATA_MASK_WIDTH       => C_DATA_MASK_WIDTH,
      C_CMP_DIN_WIDTH         => C_CMP_DIN_WIDTH,
      C_CMP_DATA_MASK_WIDTH   => C_CMP_DATA_MASK_WIDTH,
      C_WR_ADDR_WIDTH         => C_WR_ADDR_WIDTH,
      --Configuration parameters          
      C_HAS_CMP_DIN           => C_HAS_CMP_DIN,
      C_HAS_WR_ADDR           => C_HAS_WR_ADDR,
      C_TERNARY_MODE          => C_TERNARY_MODE,
      --Internal read signal widths
      C_RD_DIN_WIDTH          => C_RD_DIN_WIDTH,
      C_RD_DATA_MASK_WIDTH    => C_RD_DATA_MASK_WIDTH,
      C_RD_DATA_TERNARY_WIDTH => C_RD_DATA_TERNARY_WIDTH,
      C_RD_DATA_TMP_WIDTH     => C_RD_DATA_TMP_WIDTH,
      --Internal write signal widths
      C_WR_DIN_WIDTH          => C_WR_DIN_WIDTH,
      C_WR_DATA_MASK_WIDTH    => C_WR_DATA_MASK_WIDTH,
      C_WR_DATA_TERNARY_WIDTH => C_WR_DATA_TERNARY_WIDTH,
      C_WR_DATA_TMP_WIDTH     => C_WR_DATA_TMP_WIDTH,
      --Output widths
      C_RD_DATA_WIDTH         => C_RD_DATA_WIDTH,
      C_WR_DATA_WIDTH         => C_WR_DATA_WIDTH,
      C_WR_ADDR_INT_WIDTH     => C_WR_ADDR_INT_WIDTH)
    PORT MAP (
      --Input Signals
      DIN                     => din_i,
      DATA_MASK               => data_mask_i,
      CMP_DIN                 => cmp_din_i,
      CMP_DATA_MASK           => cmp_data_mask_i,
      WR_ADDR                 => wr_addr_i,
      --Other Inputs          
      CLK                     => clk_i,
      EN                      => en_i,
      REG_EN                  => reg_en,  
      --Outputs for downstream logic
      RD_DATA                 => rd_data,
      WR_DATA                 => wr_data,
      WR_ADDR_INT             => wr_addr_ilog,
      --Outputs for control logic
      RD_DATA_MASK            => rd_data_mask,
      RD_DIN                  => rd_din,
      WR_DATA_MASK            => wr_data_mask,
      WR_DIN                  => wr_din);

  -----------------------------------------------------------------------------
  -- BASIC CAMs
  --    This block is essentially SRL16 or Block Memory, configured as a CAM, 
  --    with whatever basic logic is necessary for using the memory as a CAM.
  --    It does not, however, contain any logic for cleaning up the inputs,
  --    for resolving matches, or dealing with read-write conflicts.
  -----------------------------------------------------------------------------
  mem : ENTITY cam.cam_mem
    GENERIC MAP (
      C_DEPTH                          => C_DEPTH,
      C_HAS_EN                         => C_HAS_EN,
      C_FAMILY                         => C_FAMILY,
      C_INIT_WIDTH                     => C_INIT_WIDTH, 
      C_MATCHES_WIDTH                  => C_MATCHES_WIDTH,
      C_MEM_INIT                       => C_MEM_INIT,
      C_MEM_INIT_FILE                  => C_MEM_INIT_FILE,
      C_ELABORATION_DIR                => C_ELABORATION_DIR,
      C_MEM_TYPE                       => C_MEM_TYPE,
      C_RD_DATA_WIDTH                  => C_RD_DATA_WIDTH,
      C_SRL16_BLOCK_SEL_WIDTH          => C_SRL16_BLOCK_SEL_WIDTH,
      C_SRL16_BLOCK_WR_ADDR_WIDTH      => C_SRL16_BLOCK_WR_ADDR_WIDTH,
      C_SRL16_BLOCKS_PER_CAM           => C_SRL16_BLOCKS_PER_CAM,
      C_SRL16_LAST_BLOCK_WR_ADDR_WIDTH => C_SRL16_LAST_BLOCK_WR_ADDR_WIDTH,
      C_SRL16_SRLS_PER_WORD            => C_SRL16_SRLS_PER_WORD,
      C_SRL16_WORDS_IN_LAST_BLOCK      => C_SRL16_WORDS_IN_LAST_BLOCK,
      C_SRL16_WORDS_PER_BLOCK          => C_SRL16_WORDS_PER_BLOCK,
      C_TERNARY_MODE                   => C_TERNARY_MODE,
      C_WIDTH                          => C_WIDTH,
      C_HAS_WR_ADDR                    => C_HAS_WR_ADDR,
      C_WR_ADDR_WIDTH                  => C_WR_ADDR_INT_WIDTH,
      C_WR_COUNT_WIDTH                 => C_WR_COUNT_WIDTH,
      C_WR_DATA_BITS_WIDTH             => C_WR_DATA_BITS_WIDTH,
      C_WR_DATA_WIDTH                  => C_WR_DATA_WIDTH)
    PORT MAP (
      --Inputs
      BUSY                             => busy_i,
      CLK                              => CLK,
      EN                               => en_i,
      RD_DATA                          => rd_data,
      WE                               => wren,
      WR_ADDR                          => wr_addr_ilog,
      WR_DATA                          => wr_data,
      WR_COUNT                         => wr_count,
      --Outputs                        
      MATCHES                          => matches);

  -----------------------------------------------------------------------------
  -- Match Logic
  --  This logic contains all of the necessary elements for interpreting
  --  the individual bits from the various address locations
  --  All logic is log2 based, and returns any variant of the match flags,
  --  as well as binary encode, one hot, or many hot addresses.
  -----------------------------------------------------------------------------
  mlog : ENTITY cam.cam_match_enc
    GENERIC MAP(
      C_ADDR_TYPE             => C_ADDR_TYPE,
      C_DEPTH                 => C_DEPTH,
      C_HAS_MULTIPLE_MATCH    => C_HAS_MULTIPLE_MATCH,
      C_HAS_SINGLE_MATCH      => C_HAS_SINGLE_MATCH,
      C_MATCH_RESOLUTION_TYPE => C_MATCH_RESOLUTION_TYPE,
      C_MEM_TYPE              => C_MEM_TYPE,
      C_REGISTER_OUTPUTS      => C_REG_MATCH_LOGIC,
      C_WIDTH                 => C_WIDTH,
      C_WR_ADDR_WIDTH         => C_WR_ADDR_INT_WIDTH)

    PORT MAP (
      --Inputs
      CLK                     => clk_i,
      EN                      => en_i,
      RW_DEC_CLR              => rw_dec_clr_i,
      MATCHES                 => matches,
      WR_ADDR                 => wr_addr_ilog,
      --Outputs               
      MATCH                   => a_match,
      MATCH_ADDR_1H           => a_match_addr_1h,
      MATCH_ADDR_MM           => a_match_addr_mm,
      MATCH_ADDR_BIN          => a_match_addr_bin,
      MULTIPLE_MATCH          => a_multiple_match,
      SINGLE_MATCH            => a_single_match);

  match_i          <= a_match;
  multiple_match_i <= a_multiple_match;
  single_match_i   <= a_single_match;

  gmab : IF (C_ADDR_TYPE = C_ENCODED_ADDR) GENERATE
    match_addr_i(C_WR_ADDR_INT_WIDTH-1 DOWNTO 0) <=
      a_match_addr_bin(C_WR_ADDR_INT_WIDTH-1 DOWNTO 0);
  END GENERATE gmab;

  gmamm : IF (C_ADDR_TYPE = C_MULT_UNENCODED_ADDR) GENERATE
    match_addr_i(C_DEPTH-1 DOWNTO 0) <= a_match_addr_mm(C_DEPTH-1 DOWNTO 0);
  END GENERATE gmamm;

  gma1h : IF (C_ADDR_TYPE = C_UNENCODED_ADDR) GENERATE
    match_addr_i(C_DEPTH-1 DOWNTO 0) <= a_match_addr_1h(C_DEPTH-1 DOWNTO 0);
  END GENERATE gma1h;

  -------------------------------------------------------------------------------
  -- Control Logic
  --   The control logic is responsible for establishing important control
  --   signals throughout the core. In particular, WREN (the internal write
  --   enable), reg_en (the enable for the input registers), busy_i (the busy
  --   signal which indicates that a write operation is in progress, and read_
  --   warning (output which flags a conflict between the data being written and
  --   the data being read.
  -------------------------------------------------------------------------------
  clog : ENTITY cam.cam_control
    GENERIC MAP (
      C_FAMILY             => C_FAMILY,
      C_MEM_TYPE           => C_MEM_TYPE,
      C_RD_DATA_MASK_WIDTH => C_RD_DATA_MASK_WIDTH,
      C_RD_DIN_WIDTH       => C_RD_DIN_WIDTH,
      C_TERNARY_MODE       => C_TERNARY_MODE,
      C_WIDTH              => C_WIDTH,
      C_HAS_WR_ADDR        => C_HAS_WR_ADDR,
      C_WR_ADDR_WIDTH      => C_WR_ADDR_WIDTH,
      C_WR_COUNT_WIDTH     => C_WR_COUNT_WIDTH,
      C_WR_DATA_MASK_WIDTH => C_WR_DATA_MASK_WIDTH,
      C_WR_DIN_WIDTH       => C_WR_DIN_WIDTH)
    PORT MAP (
      --Inputs
      CLK                  => clk_i,
      EN                   => en_i,
      RD_DATA_MASK         => rd_data_mask,
      RD_DIN               => rd_din,
      WE                   => we_i,
      WR_DATA_MASK         => wr_data_mask,
      WR_DIN               => wr_din,
      --Outputs
      BUSY                 => busy_i,   
      INT_REG_EN           => reg_en,   
      RD_ERR               => read_warning_i,  
      RW_DEC_CLR           => rw_dec_clr_i, 
      WR_COUNT             => wr_count, 
      WREN                 => wren);

  -------------------------------------------------------------------------------
  -- Registered Outputs (for block memory registered outputs OR binary encoded 
  -- output)
  --   For Block Memory, or when binary encoded address type is used with
  --   SRL16, this bank of registers is created to delay the output signals
  --   appropriately.
  -------------------------------------------------------------------------------
  greg : IF C_REG_OUTPUTS = 1 GENERATE
    rlog : ENTITY cam.cam_regouts
      GENERIC MAP (
        C_HAS_MULTIPLE_MATCH => C_HAS_MULTIPLE_MATCH,
        C_HAS_READ_WARNING   => C_HAS_READ_WARNING,
        C_HAS_SINGLE_MATCH   => C_HAS_SINGLE_MATCH,
        C_MATCH_ADDR_WIDTH   => C_MATCH_ADDR_WIDTH)
      PORT MAP (
        --Inputs
        CLK                  => clk_i,
        EN                   => en_i,
        MATCH_D              => match_i,
        MATCH_ADDR_D         => match_addr_i,
        MULTIPLE_MATCH_D     => multiple_match_i,
        RD_ERR_D             => read_warning_i,
        SINGLE_MATCH_D       => single_match_i,
        --Outputs
        MATCH_Q              => match_q,
        MATCH_ADDR_Q         => match_addr_q,
        MULTIPLE_MATCH_Q     => multiple_match_q,
        RD_ERR_Q             => read_warning_q,
        SINGLE_MATCH_Q       => single_match_q);
  END GENERATE greg;

END xilinx;
