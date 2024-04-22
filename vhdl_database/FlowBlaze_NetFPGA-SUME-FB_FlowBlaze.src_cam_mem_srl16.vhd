--  Module      : cam_mem_srl16.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : Top-level SRl16 implementation of the CAM
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
-- >> cam_mem_srl16 <<
--     |
--     +- cam_mem_srl16_wrcomp // write comparator
--     |                       // Accepts 2 4-bit inputs WR_COUNT and WR_DATA
--     |                       // Asserts an active high output whenever the 
--     |                       // 2 inputs are equal                 
--     |
--     +- cam_mem_srl16_ternwrcomp  // Compare 2 4-bit inputs WR_COUNT and
--                                  // WR_DATA taking ternary conditions 
--                                  // into considerations
--     |
--     +- cam_decoder  // one-hot decoder  
--     |                            
--     |
--     +- cam_mem_srl16_block // block of single_word srl16 memory up to 256
--                            // in depth   
------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL ;

ENTITY cam_mem_srl16 IS

  GENERIC (
    C_DEPTH                          : INTEGER          := 4;
    C_MEM_INIT                       : INTEGER          := 0;
    C_HAS_EN                         : INTEGER          := 0;
    C_INIT_CONTENT                   : STD_LOGIC_VECTOR ;
    C_INIT_WIDTH                     : INTEGER          := 4;
    C_MATCHES_WIDTH                  : INTEGER          := 4;
    C_RD_DATA_WIDTH                  : INTEGER          := 4;
    C_SRL16_BLOCK_SEL_WIDTH          : INTEGER          := 1;
    C_SRL16_BLOCK_WR_ADDR_WIDTH      : INTEGER          := 2;
    C_SRL16_BLOCKS_PER_CAM           : INTEGER          := 1;
    C_SRL16_LAST_BLOCK_WR_ADDR_WIDTH : INTEGER          := 2;
    C_SRL16_SRLS_PER_WORD            : INTEGER          := 1;
    C_SRL16_WORDS_IN_LAST_BLOCK      : INTEGER          := 4;
    C_SRL16_WORDS_PER_BLOCK          : INTEGER          := 0;
    C_TERNARY_MODE                   : INTEGER          := 0;
    C_WR_ADDR_WIDTH                  : INTEGER          := 2;
    C_WR_COUNT_WIDTH                 : INTEGER          := 4;
    C_WR_DATA_BITS_WIDTH             : INTEGER          := 4;
    C_WR_DATA_WIDTH                  : INTEGER          := 4

    );

  PORT (
    --Inputs
    BUSY     : IN  STD_LOGIC;
    CLK      : IN  STD_LOGIC;
    EN       : IN  STD_LOGIC;
    RD_DATA  : IN  STD_LOGIC_VECTOR(C_RD_DATA_WIDTH-1 DOWNTO 0);
    WE       : IN  STD_LOGIC;
    WR_ADDR  : IN  STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0);
    WR_DATA  : IN  STD_LOGIC_VECTOR(C_WR_DATA_WIDTH-1 DOWNTO 0);
    WR_COUNT : IN  STD_LOGIC_VECTOR(C_WR_COUNT_WIDTH-1 DOWNTO 0);
    --Outputs
    MATCHES  : OUT STD_LOGIC_VECTOR(C_MATCHES_WIDTH-1 DOWNTO 0));

  attribute max_fanout : integer;
  attribute max_fanout of all: entity is 10;
END cam_mem_srl16;

ARCHITECTURE xilinx OF cam_mem_srl16 IS

  ------ Bits to write into the SRL16s
  SIGNAL wr_data_bits : STD_LOGIC_VECTOR(C_WR_DATA_BITS_WIDTH-1 DOWNTO 0);  

  --The write enables for each 256-word block
  SIGNAL block_wes : STD_LOGIC_VECTOR(C_SRL16_BLOCKS_PER_CAM-1 DOWNTO 0);  

  --The MSBs of wr_addr which are used to select the 256-word block to write to
  SIGNAL block_sel : STD_LOGIC_VECTOR(C_SRL16_BLOCK_SEL_WIDTH-1 DOWNTO 0);  

  --The resulting matches from the SRL16 lookup
  SIGNAL matches_i : STD_LOGIC_VECTOR(C_MATCHES_WIDTH-1 DOWNTO 0); 

  --Reorder bits 
  CONSTANT C_INIT_CONTENT_INDEX : STD_LOGIC_VECTOR((C_INIT_WIDTH*C_DEPTH)-1 DOWNTO 0)
                                  := C_INIT_CONTENT;


  --Temporary signals for connection to cam_mem_srl16_block module
  SIGNAL wr_addr_block_256 : STD_LOGIC_VECTOR(C_SRL16_BLOCK_WR_ADDR_WIDTH DOWNTO 0);
  SIGNAL wr_addr_last_block : STD_LOGIC_VECTOR(C_SRL16_LAST_BLOCK_WR_ADDR_WIDTH DOWNTO 0);



BEGIN  -- xilinx

  -------------------------------------------------------------------------------
  -- WRITE COMPARATORS
  --
  --   Every word in the CAM has a certain number of SRL16s to store that value
  --   (C_SRL16_SRLS_PER_WORD).  For each SRL16, there is a comparator, which
  --   compares a 4-bit chunk of the value being written to the CAM to the
  --   counter value (0 to 15).
  --   If they match, a '1' is placed in the corresponding location of
  --   wr_data_bits.
  --   If they don't match, a '0' is placed in the corresponding location of
  --   wr_data_bits.
  --   The wr_data_bits bus, on each clock cycle, will be the bits to be written
  --   to ALL SRL16s on the current clock cycle of the write.
  --   Only the SRL16s for the word being written to are enabled, so only that
  --   set of SRL16s will have the wr_data_bits values written to them.
  -------------------------------------------------------------------------------
  loopc : FOR i IN 0 TO C_SRL16_SRLS_PER_WORD-1 GENERATE

    -- generate non-ternary comparators when in non-ternary mode
    noter : IF C_TERNARY_MODE = 0 GENERATE
      wr_comp     : ENTITY cam.cam_mem_srl16_wrcomp
        PORT MAP (
          WR_COUNT       => WR_COUNT,
          WR_DATA        => WR_DATA(i*4+3 DOWNTO i*4),
          WR_DATA_BIT    => wr_data_bits(i)
          );
    END GENERATE noter;

    -- generate ternary comparator when in ternary mode
    tern : IF C_TERNARY_MODE /= 0 GENERATE
      wr_comp  : ENTITY cam.cam_mem_srl16_ternwrcomp
        PORT MAP (
          WR_COUNT       => WR_COUNT,
          WR_DATA        => WR_DATA(i*4+3 DOWNTO i*4),
          WR_DATA_BIT    => wr_data_bits(i)
          );
    END GENERATE tern;
  END GENERATE loopc;

  -------------------------------------------------------------------------------
  -- BLOCK DECODER
  --   Generate decoder for selecting which 256-word block to write to.
  --
  --  This decoder takes the most-significant bits of the write address, and
  --  determines the one-hot equivalent of that binary value.
  --  The one-hot value is then used as an enable signal for each 256-word
  --  block of SRL16 CAM. (256 makes each block a manageable chunk, and allows
  --  logic within each block to be done with baseblox, which are limited in
  --  many cases to 256-bits.)
  -------------------------------------------------------------------------------
  gdec : IF C_SRL16_BLOCKS_PER_CAM > 1 GENERATE
    --Select the 256-word block based on the MSBs of wr_addr.
    block_sel <= wr_addr(C_WR_ADDR_WIDTH-1 DOWNTO C_WR_ADDR_WIDTH-C_SRL16_BLOCK_SEL_WIDTH);
    bdec : ENTITY cam.cam_decoder
      GENERIC MAP (
        C_DEC_SEL_WIDTH  => C_SRL16_BLOCK_SEL_WIDTH,
        C_DEC_OUT_WIDTH  => C_SRL16_BLOCKS_PER_CAM)
      PORT MAP (
        EN   => we,
        SEL  => block_sel,
        DEC  => block_wes);
  END GENERATE gdec;
    
  ngdec : IF C_SRL16_BLOCKS_PER_CAM = 1 GENERATE

    --If there is only one block in the CAM (CAM depths <= 256),
    -- then just have its write enable controlled by WE.
    block_wes(0) <= we;
  END GENERATE ngdec;



  -------------------------------------------------------------------------------
  -- Instantiate srl16_mem blocks
  -------------------------------------------------------------------------------
  gblks : FOR i IN 0 TO C_SRL16_BLOCKS_PER_CAM-1 GENERATE

    --Generate 256-word deep CAM blocks
    g256 : IF i/=C_SRL16_BLOCKS_PER_CAM-1 GENERATE

      --Set the wr address with the write address of the right width
      wr_addr_block_256(C_SRL16_BLOCK_WR_ADDR_WIDTH-1 DOWNTO 0) <= WR_ADDR(C_SRL16_BLOCK_WR_ADDR_WIDTH-1
                                                                    DOWNTO 0);

      blka : ENTITY cam.cam_mem_srl16_block
        GENERIC MAP (
          C_DEPTH                 => C_DEPTH,
          C_MEM_INIT              => C_MEM_INIT ,
          C_HAS_EN                => C_HAS_EN,
          C_INIT_BLOCK            => normalize_slv(C_INIT_CONTENT_INDEX((i+1)*C_SRL16_WORDS_PER_BLOCK*C_INIT_WIDTH-1
                                     DOWNTO (i*C_SRL16_WORDS_PER_BLOCK*C_INIT_WIDTH))),
          C_INIT_WIDTH            => C_INIT_WIDTH,
          C_RD_DATA_WIDTH         => C_RD_DATA_WIDTH,
          C_SRL16_WORDS_PER_BLOCK => C_SRL16_WORDS_PER_BLOCK,
          C_SRL16_SRLS_PER_WORD   => C_SRL16_SRLS_PER_WORD,
          C_TERNARY_MODE          => C_TERNARY_MODE,
          C_WR_ADDR_WIDTH         => C_SRL16_BLOCK_WR_ADDR_WIDTH,
          C_WR_DATA_BITS_WIDTH    => C_WR_DATA_BITS_WIDTH
          )
        PORT MAP (
          CLK                     => CLK,
          RD_DATA                 => RD_DATA,
          WR_DATA_BITS            => WR_DATA_BITS,
          EN                      => EN,
          WE                      => block_wes(i),
          WR_ADDR                 => wr_addr_block_256,

          BLOCK_MATCHES => matches_i((i+1)*C_SRL16_WORDS_PER_BLOCK-1 DOWNTO i*C_SRL16_WORDS_PER_BLOCK)
          );
    END GENERATE g256;

    --Generate the last CAM block
    glast : IF i = C_SRL16_BLOCKS_PER_CAM-1 GENERATE

      --Set the wr address with the write address of the right width
      --  (Note: this wr_address is generally smaller for the last block, since
      --  the last block is smaller than all the other blocks)
      wr_addr_last_block(C_SRL16_LAST_BLOCK_WR_ADDR_WIDTH-1 DOWNTO 0) <= WR_ADDR(C_SRL16_LAST_BLOCK_WR_ADDR_WIDTH-1 DOWNTO 0);

      blkb : ENTITY cam.cam_mem_srl16_block
        GENERIC MAP (
          C_DEPTH                 => C_DEPTH,
          C_MEM_INIT              => C_MEM_INIT ,
          C_HAS_EN                => C_HAS_EN,
          C_INIT_BLOCK            => normalize_slv(C_INIT_CONTENT_INDEX(i*C_SRL16_WORDS_PER_BLOCK*C_INIT_WIDTH+C_SRL16_WORDS_IN_LAST_BLOCK*C_INIT_WIDTH-1 DOWNTO (i*C_SRL16_WORDS_PER_BLOCK*C_INIT_WIDTH))),
          C_INIT_WIDTH            => C_INIT_WIDTH,
          C_RD_DATA_WIDTH         => C_RD_DATA_WIDTH,
          C_SRL16_SRLS_PER_WORD   => C_SRL16_SRLS_PER_WORD,
          C_SRL16_WORDS_PER_BLOCK => C_SRL16_WORDS_IN_LAST_BLOCK,
          C_TERNARY_MODE          => C_TERNARY_MODE,
          C_WR_ADDR_WIDTH         => C_SRL16_LAST_BLOCK_WR_ADDR_WIDTH,
          C_WR_DATA_BITS_WIDTH    => C_WR_DATA_BITS_WIDTH
          )
        PORT MAP (
          --Inputs
          CLK                     => CLK,
          RD_DATA                 => RD_DATA,
          WR_DATA_BITS            => WR_DATA_BITS,
          EN                      => EN,
          WE                      => block_wes(i),
          WR_ADDR                 => wr_addr_last_block,

          --Output
          BLOCK_MATCHES => matches_i((i*C_SRL16_WORDS_PER_BLOCK)+C_SRL16_WORDS_IN_LAST_BLOCK-1 DOWNTO (i*C_SRL16_WORDS_PER_BLOCK))
          );
    END GENERATE glast;


  END GENERATE gblks;


  -- Tie the internal matches result signal to the output port
  MATCHES <= matches_i;





END xilinx;
