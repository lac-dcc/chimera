--
--  Module      : cam_mem_srl16_block.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : This block arranges single_word SRL16 memory blocks into a 
--                structure that can contain all of the CAM data.
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
--  >> cam_mem_srl16_block <<
--      |
--      +- cam_mem_srl16_block_word // implementing CAM c_width data bits
--      |                           // and 1 word deep 
--      |
--      |
--      +- cam_decoder // one-hot decoder
------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL ;



ENTITY cam_mem_srl16_block IS

  GENERIC (
    C_DEPTH                 : INTEGER          := 4;
    C_MEM_INIT              : INTEGER          := 0;
    C_HAS_EN                : INTEGER          := 0;
    C_INIT_BLOCK            : STD_LOGIC_VECTOR ;
    C_INIT_WIDTH            : INTEGER          := 4;
    C_RD_DATA_WIDTH         : INTEGER          := 4;
    C_SRL16_SRLS_PER_WORD   : INTEGER          := 1;
    C_SRL16_WORDS_PER_BLOCK : INTEGER          := 4;  
    C_TERNARY_MODE          : INTEGER          := 0;
    C_WR_ADDR_WIDTH         : INTEGER          := 2;
    C_WR_DATA_BITS_WIDTH    : INTEGER          := 4
    );

  PORT (
    --Inputs
    CLK           : IN  STD_LOGIC := '0';
    EN            : IN  STD_LOGIC := '0';
    RD_DATA       : IN  STD_LOGIC_VECTOR(C_RD_DATA_WIDTH-1 DOWNTO 0)
                        := (OTHERS => '0');
    WE            : IN  STD_LOGIC := '0';
    WR_ADDR       : IN  STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH DOWNTO 0)
                        := (OTHERS => '0');
    WR_DATA_BITS  : IN  STD_LOGIC_VECTOR(C_WR_DATA_BITS_WIDTH-1 DOWNTO 0)
                        := (OTHERS => '0');
    --Outputs
    BLOCK_MATCHES : OUT STD_LOGIC_VECTOR(C_SRL16_WORDS_PER_BLOCK-1 DOWNTO 0)
    );


attribute max_fanout : integer;
attribute max_fanout of all: entity is 10;


END cam_mem_srl16_block;

ARCHITECTURE xilinx OF cam_mem_srl16_block IS

  --Temporary signal used to combine other signals for input to an AND gate.

  --The enable for the binary decoder
  SIGNAL binary_decoder_en : STD_LOGIC;  

  --This is an array of write enable signals, one for each word in this block
  -- (up to 256 in total)
  SIGNAL wes : STD_LOGIC_VECTOR(C_SRL16_WORDS_PER_BLOCK-1 DOWNTO 0);  
  SIGNAL wr_addr_sel : STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0);


  CONSTANT C_INIT_BLOCK_INDEX : STD_LOGIC_VECTOR(C_SRL16_WORDS_PER_BLOCK*C_INIT_WIDTH-1 DOWNTO 0) := C_INIT_BLOCK;


BEGIN  -- xilinx



-------------------------------------------------------------------------------
-- The total number of words must be broken up into 256-word chunks, each with
-- its own binary decoder for the address
-------------------------------------------------------------------------------



-------------------------------------------------------------------------------
-- Binary Decoder
-- Takes up to 8 bits of binary input wr_addr and converts them to a 1-hot, active
-- high signal which is used as the clock enables for each SRL16.
-------------------------------------------------------------------------------

------Establish Binary Decoder Enable Signal  -----------------------------------
  genen : IF C_HAS_EN/=0 GENERATE
    --Make an AND gate

    binary_decoder_en <= EN AND WE;

  END GENERATE genen;
  noen : IF C_HAS_EN = 0 GENERATE
    binary_decoder_en <= WE;
  END GENERATE noen;

------Build the Decoder  --------------------------------------------------------
  nodec : IF C_WR_ADDR_WIDTH = 0 GENERATE
    --If the address width is zero, the write_enable of each word is simply the
    --enable for the encoder
    wes(0) <= binary_decoder_en;
  END GENERATE nodec;

  gedec  : IF C_WR_ADDR_WIDTH/=0 GENERATE
    --If the address width is anything other than zero, generate the decoder to
    --determine which words should or should not be enabled
    wr_addr_sel <= WR_ADDR(C_WR_ADDR_WIDTH-1 DOWNTO 0);
    gdecm :ENTITY cam.cam_decoder
      GENERIC MAP (
        C_DEC_SEL_WIDTH => C_WR_ADDR_WIDTH,
        C_DEC_OUT_WIDTH => C_SRL16_WORDS_PER_BLOCK)
      PORT MAP (
        EN   => binary_decoder_en,
        SEL  => wr_addr_sel,
        DEC  => wes);
  END GENERATE gedec;





-------------------------------------------------------------------------------
-- Build the SRL block for each word
-------------------------------------------------------------------------------
  loopw : FOR i IN 0 TO C_SRL16_WORDS_PER_BLOCK-1 GENERATE
    sword  : ENTITY cam.cam_mem_srl16_block_word
      GENERIC MAP (
        C_MEM_INIT            => C_MEM_INIT ,
        C_INIT_WIDTH          => C_INIT_WIDTH,
        C_INIT_WORD           => word_config(C_INIT_BLOCK_INDEX((i+1)*C_INIT_WIDTH-1 DOWNTO (i*C_INIT_WIDTH)),
                                 C_TERNARY_MODE, C_INIT_WIDTH, C_SRL16_SRLS_PER_WORD*4),
        C_RD_DATA_WIDTH       => C_RD_DATA_WIDTH,
        C_SRL16_SRLS_PER_WORD => C_SRL16_SRLS_PER_WORD,
        C_TERNARY_MODE        => C_TERNARY_MODE,
        C_WR_DATA_BITS_WIDTH  => C_WR_DATA_BITS_WIDTH

        )
      PORT MAP (
        --Inputs
        CLK          => CLK,
        RD_DATA      => RD_DATA,
        WE           => wes(i),
        WR_DATA_BITS => WR_DATA_BITS,
        --Outputs
        WORD_MATCH   => BLOCK_MATCHES(i)
        );
  END GENERATE loopw;


END xilinx;
