--  Module      : cam_mem_srl16_block_word.vhd
-- 
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : This entity constructs the SRL16's and the associated carry 
--                chain for implementing a CAM C_WIDTH data bits X 1-word.
--                On a read, the WORD_MATCH output will indicate whether a 
--                match was found at this address for the data on the RD_DATA 
--                bus.
--                On a write, the contents of these SRL16s take 16 clock cycles 
--                to write.
--                **This file contains architecture-dependent 
--                constructs and must be updated for newer 
--                architectures.
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
--  >> cam_mem_srl16_block_word <<
--      |
--      +-  SRL16E primitive  
--      |                        
--      |
--      +-  MUXCY primitive  
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


LIBRARY cam;
USE cam.cam_pkg.ALL ;


library UNISIM;
use UNISIM.VComponents.all;

ENTITY cam_mem_srl16_block_word IS

------------------------------------------------------------------------------
-- Generics
-- C_SRL16_SRLS_PER_WORD = The number of SRL16s to connect. Each SRL16 is responsible
-- for determining a match for 4 binary data bits, or 2 encoded ternary bits
-- on one particular address.
-- C_RD_DATA_WIDTH = The width of the RD_DATA port.
------------------------------------------------------------------------------
  GENERIC (
    C_MEM_INIT            : INTEGER          := 0;
    C_INIT_WIDTH          : INTEGER          := 0;  
    C_INIT_WORD           : STD_LOGIC_VECTOR ;  
    C_RD_DATA_WIDTH       : INTEGER          := 4;  
    C_SRL16_SRLS_PER_WORD : INTEGER          := 1;  
    C_TERNARY_MODE        : INTEGER          := 0;
    C_WR_DATA_BITS_WIDTH  : INTEGER          := 1
    );

  PORT (
    --Inputs
    CLK          : IN STD_LOGIC := '0';
    RD_DATA      : IN STD_LOGIC_VECTOR(C_RD_DATA_WIDTH-1 DOWNTO 0)
                      := (OTHERS => '0');
    --The write enable for each SRL16.
    WE           : IN STD_LOGIC := '0';
    --The bits to write to each SRL16 (if enabled).
    WR_DATA_BITS : IN STD_LOGIC_VECTOR(C_WR_DATA_BITS_WIDTH-1 DOWNTO 0)
                      := (OTHERS => '0');

    --Outputs
    WORD_MATCH : OUT STD_LOGIC := '0'
    );
  attribute max_fanout : integer;
    attribute max_fanout of all: entity is 10;

END cam_mem_srl16_block_word;



ARCHITECTURE xilinx OF cam_mem_srl16_block_word IS

  SIGNAL srl16_match : STD_LOGIC_VECTOR(C_SRL16_SRLS_PER_WORD-1 DOWNTO 0);  

  SIGNAL carry : STD_LOGIC_VECTOR(C_SRL16_SRLS_PER_WORD-1 DOWNTO 0);  

  SIGNAL we_inverted : STD_LOGIC;
       
  CONSTANT ZERO       : STD_LOGIC := '0';

  CONSTANT C_INIT_WORD_INDEX : STD_LOGIC_VECTOR(C_SRL16_SRLS_PER_WORD*4-1 DOWNTO 0) := C_INIT_WORD;


BEGIN  -- xilinx


  --The last bit of the carry chain indicates whether or not there was a match
  --on this word
  WORD_MATCH <= carry(C_SRL16_SRLS_PER_WORD-1);


  -- Invert WE signal for input to the carry chain
  -- (we=1 causes a 0 to be inserted into the carry chain, forcing a "nomatch" result)
   
  we_inverted <= not WE ;

  -- Generate SRL16s and CY muxes
  gsrl : FOR t IN 0 TO C_SRL16_SRLS_PER_WORD-1 GENERATE

    --Generate an SRL16 for a 4-bit chunk of RD_DATA

   gini0 : IF (C_MEM_INIT = 0) GENERATE

    psrl : srl16e
      GENERIC MAP (INIT => X"0000") 
      PORT MAP (
        D               => WR_DATA_BITS(t),
        Q               => srl16_match(t),
        A0              => RD_DATA(t*4),
        A1              => RD_DATA((t*4)+1),
        A2              => RD_DATA((t*4)+2),
        A3              => RD_DATA((t*4)+3),
        CE              => WE,
        CLK             => CLK
        );
    end generate  gini0 ;

   gini1 : IF (C_MEM_INIT = 1) GENERATE
 
    psrl : srl16e
       GENERIC MAP (INIT => INIT_DECODE(C_INIT_WORD_INDEX(((t+1)*4-1) DOWNTO (t*4)), C_TERNARY_MODE))
      PORT MAP ( 
        D               => WR_DATA_BITS(t),
        Q               => srl16_match(t),
        A0              => RD_DATA(t*4),
        A1              => RD_DATA((t*4)+1),
        A2              => RD_DATA((t*4)+2),
        A3              => RD_DATA((t*4)+3),
        CE              => WE,    
        CLK             => CLK
        );
    end generate  gini1 ; 

    -- Generate least significant CY mux : one of the mux input tied to inverted WE
    lsmux   : IF (t = 0) GENERATE
      gmux1 : muxcy
        PORT MAP (
          O  => carry(0),
          DI => ZERO,
          CI => we_inverted,
          S  => srl16_match(0)
          );
    END GENERATE lsmux;

    -- Generate CY muxes : inputs to mux = '0' and output of previous mux, selected by SRL16 ouput
    msmux   : IF (t > 0) GENERATE
      gmuxn : muxcy
        PORT MAP (
          O  => carry(t),
          DI => ZERO,
          CI => carry(t-1),
          S  => srl16_match(t)
          );
    END GENERATE msmux;

  END GENERATE gsrl;

END xilinx;
