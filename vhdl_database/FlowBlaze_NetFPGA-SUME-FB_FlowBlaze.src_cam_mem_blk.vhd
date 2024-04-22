--  Module      : cam_mem_blk.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM

--  Description : Top-level Block Memory implementation of the CAM
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
--  >> cam_mem_blk <<
--      |
--      +- dmem                  //Inferred Dist RAM for Erase memory
--      |
--      +- cam_mem_blk_extdepth  //Create rows of cam_mem_blk_extdepth - one 
--      |                        //column of RAMB primitives based on CAM width
--      +                        //(The last primitive is used completely in 
--                               //width)  
--      |
--      +- cam_mem_blk_extdepth  //Create rows of cam_mem_blk_extdepth-one 
--                               //column of RAMB primitives based on CAM width
--                               //(The last primitive is used partially in  
--                               //width)  
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Library Declarations
-------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_misc.ALL;

LIBRARY std; 
USE std.textio.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL ;

-------------------------------------------------------------------------------
-- Entity Declaration
-------------------------------------------------------------------------------
ENTITY cam_mem_blk IS
  -----------------------------------------------------------------------------
  -- Generic Declarations (alphabetical)
  -----------------------------------------------------------------------------
  GENERIC (
    C_DEPTH              : INTEGER := 16;
    C_ELABORATION_DIR    : STRING  := "./";
    C_FAMILY             : STRING  := "virtex5";
    C_HAS_WR_ADDR        : INTEGER := 1;
    C_INIT_VECTOR        : STD_LOGIC_VECTOR;
    C_MEM_INIT           : INTEGER := 0;
    C_MEM_INIT_FILE      : STRING  := "null.mif";
    C_WIDTH              : INTEGER := 8;
    C_WR_ADDR_WIDTH      : INTEGER := 4;
    C_WR_COUNT_WIDTH     : INTEGER := 1
    );
  -----------------------------------------------------------------------------
  -- Input and Output Declarations
  -----------------------------------------------------------------------------
  PORT (
    BUSY     : IN  STD_LOGIC := '0';
    CLK      : IN  STD_LOGIC := '0';
    EN       : IN  STD_LOGIC := '0';
    RD_DATA  : IN  STD_LOGIC_VECTOR(C_WIDTH-1 DOWNTO 0)
                   := (OTHERS => '0');
    WE       : IN  STD_LOGIC := '0';
    WR_ADDR  : IN  STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0)
                   := (OTHERS => '0');
    WR_DATA  : IN  STD_LOGIC_VECTOR(C_WIDTH-1 DOWNTO 0)
                   := (OTHERS => '0');
    WR_COUNT : IN  STD_LOGIC_VECTOR(C_WR_COUNT_WIDTH-1 DOWNTO 0)
                   := (OTHERS => '0');
    MATCHES  : OUT STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0) 
                   := (OTHERS => '0')
    );
    
    
    attribute max_fanout : integer;
    attribute max_fanout of all: entity is 10;

END cam_mem_blk;

-------------------------------------------------------------------------------
-- Generic Definitions:
-------------------------------------------------------------------------------
  -- C_INIT_VECTOR  : A long 1D array of type STD_LOGIC_VECTOR and of size 
  --                  C_DEPTH*C_WIDTH-1 DOWNTO 0. It has all the contents
  --                  of the mif file concatenated to each other to form this 
  --                  one long vector. 
  --                  This constant generic was created in cam_mem.vhd.
-------------------------------------------------------------------------------
-- Port Definitions:
-------------------------------------------------------------------------------
  -- MATCHES       :  A 1D array of size C_DEPTH indicating the MATCH condition
  --                  for each CAM address
  
-------------------------------------------------------------------------------
-- Architecture Declaration 
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF cam_mem_blk IS

-------------------------------------------------------------------------------
-- Constant Declarations (Part 1)
-------------------------------------------------------------------------------
  --Calculate the widths and depths of block memory primitives, depending
  -- on the family type
  --V4/S6/S3  : PortA => 16kx1, Port B => 512x32
  --V5/V6/V6L : PortA => 32kx1, Port B => 1kx32 (RAMB36)
  CONSTANT PRIM_ADDRB_WIDTH : INTEGER 
    := if_then_else(  ( (derived(C_FAMILY,"virtex5")) or (derived(C_FAMILY, "virtex6")) or (derived(C_FAMILY, "virtex6l"))  ), 10, 9);
  CONSTANT PRIM_ADDRA_WIDTH : INTEGER 
    := if_then_else(  ( (derived(C_FAMILY,"virtex5")) or (derived(C_FAMILY, "virtex6")) or (derived(C_FAMILY, "virtex6l"))  ), 15, 14);
  CONSTANT PRIM_DOUTB_WIDTH : INTEGER := 32;
  CONSTANT PRIM_WORD_DEPTH  : INTEGER 
    := if_then_else(  ( (derived(C_FAMILY,"virtex5")) or (derived(C_FAMILY, "virtex6")) or (derived(C_FAMILY, "virtex6l"))  ), 1024, 512);

  --The most significant bits of the CAM write address are decoded to select 
  --the block, leaving REMADDR_WIDTH (remaining address width) bits as the 
  --address within each block.
  --Example:
  --If CAM depth=128, # BRAM blocks used to cover this depth=128/32=4
  --CAM WR_ADDR = 7 bits => 
  --  WR_ADDR[6:5] will select one of the 4 primitives
  --  WR_ADDR[4:0] will select a location within that primitive 
  CONSTANT REMADDR_WIDTH : INTEGER := 5;

  --Calculate the depth of the last primitive (0 if fully used)
  CONSTANT DEPTH_REM : INTEGER := C_DEPTH MOD PRIM_DOUTB_WIDTH;

  --Calculate the width of the last primitive (0 if fully used)
  CONSTANT WIDTH_REM : INTEGER := C_WIDTH MOD PRIM_ADDRB_WIDTH;

  --Calculate number of primitives deep the CAM will be
  CONSTANT PRIMS_DEEP : INTEGER := if_then_else(C_DEPTH MOD PRIM_DOUTB_WIDTH,
                                                C_DEPTH / PRIM_DOUTB_WIDTH + 1,
                                                C_DEPTH / PRIM_DOUTB_WIDTH
                                                );

  --Calculate number of primitives wide the CAM will be
  CONSTANT PRIMS_WIDE : INTEGER := if_then_else(C_WIDTH MOD PRIM_ADDRB_WIDTH,
                                                C_WIDTH / PRIM_ADDRB_WIDTH + 1,
                                                C_WIDTH / PRIM_ADDRB_WIDTH
                                                );
  
-------------------------------------------------------------------------------
-- Type Declarations (Part 1)
-------------------------------------------------------------------------------
-- Array type used in Initialization Vector Manipulation : used to separate the
-- initialization vector into individual vectors for each of the columns of CAM
-- primitives.
  TYPE INIT_VECTOR_TYPE IS ARRAY (PRIMS_WIDE-1 DOWNTO 0) OF
    STD_LOGIC_VECTOR(PRIM_ADDRB_WIDTH*C_DEPTH-1 DOWNTO 0);

-- Array type used in Initialization Vector Manipulation : used to translate
-- the individual vectors for each BRAM column into the form that will be 
-- written directly into the BRAM primitives
  TYPE COLUMN_INIT_TYPE IS ARRAY (PRIMS_WIDE-1 DOWNTO 0) OF
    STD_LOGIC_VECTOR(PRIM_WORD_DEPTH*C_DEPTH-1 DOWNTO 0);

-------------------------------------------------------------------------------
-- Function Declarations
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- FUNCTION : make_column_init
-- This function parses C_INIT_VECTOR and writes it into an array that holds
-- the initialization vector for each of the columns of CAM primitives.
-- Converts C_INIT_VECTOR (1D array of size C_DEPTH*C_WIDTH) into a 2D array
-- with each row representing each BRAM in one column.
-- Note that each BRAM column represents the width of the CAM.
--
-- For example, V4 CAM width=18, CAM depth=4 => There will be one column of 2 
--                                              BRAMs
-- Therefore, number of rows of the resulting 2D array = 2

-- Mif Format:
-- Address Data
-- 0       100000000000000011
-- 1       100000000000000010
-- 2       100000000000000001
-- 3       100000000000000000
--
-- C_INIT_VECTOR:
-- 100000000000000000 100000000000000001 1000000000000010 100000000000000011
--
-- Output Vector:
-- Column
-- BRAM0: 000000000 000000001 000000010 000000011 (Lower 9 bits of each word)
-- BRAM1: 100000000 100000000 100000000 100000000 (Upper 9 bits of each word)
-------------------------------------------------------------------------------
  FUNCTION make_column_init(
    PRIMS_WIDE_f    : INTEGER;
    rd_data_width_f : INTEGER;
    depth_f         : INTEGER;
    init_vector_f   : STD_LOGIC_VECTOR(C_WIDTH*C_DEPTH-1 DOWNTO 0);
    WIDTH_REM_f     : INTEGER;
    mem_init_f      : INTEGER
    )
    RETURN INIT_VECTOR_TYPE IS
    VARIABLE init   : INIT_VECTOR_TYPE;  
  BEGIN
    IF mem_init_f = 1 THEN
      FOR i IN 0 TO PRIMS_WIDE_f-1 LOOP
        FOR j IN 0 TO depth_f-1 LOOP
          IF (WIDTH_REM_f = 0 OR PRIMS_WIDE_f > i+1) THEN
            init(i)(j*PRIM_ADDRB_WIDTH+PRIM_ADDRB_WIDTH-1 DOWNTO
                    j*PRIM_ADDRB_WIDTH) 
              := init_vector_f(
                 (rd_data_width_f*j)+(i*PRIM_ADDRB_WIDTH)+PRIM_ADDRB_WIDTH-1 
                 DOWNTO 
                 (rd_data_width_f*j)+(i*PRIM_ADDRB_WIDTH));
          ELSE
            init(i)(j*PRIM_ADDRB_WIDTH+WIDTH_REM_f-1 DOWNTO 
                    j*PRIM_ADDRB_WIDTH) 
              := init_vector_f(
                 (rd_data_width_f*j)+(i*PRIM_ADDRB_WIDTH)+WIDTH_REM_f-1 
                 DOWNTO (rd_data_width_f*j)+(i*PRIM_ADDRB_WIDTH));
          END IF;
        END LOOP;  -- j
      END LOOP;  -- i
    END IF;
    RETURN init;
  END make_column_init;

-------------------------------------------------------------------------------
-- FUNCTION : parse_init
-- This function takes the output of make_column_init and converts each row of
-- the vector from a memory format to a format that matches what will be
-- written into the CAM.
-- Essentially, it converts the 2D array with user data for each BRAM column
-- into a 2D array of one/multi-hot values that will be directly written to the
-- BRAM primitive.
 
-- For example, CAM depth=4 and CAM width=18:
--
-- Input Vector (2D array for each BRAM column)
-- BRAM0: 000000000 000000001 000000010 000000011 (Lower 9 bits of each word)
-- BRAM1: 100000000 100000000 100000000 100000000 (Upper 9 bits of each word)
--
-- Example of output vector:
--
-- data 0 matches address 3           -> 1000
-- data 1 matches address 2           -> 0100
-- data 2 matches address 1           -> 0010
-- data 3 matches address 0           -> 0001
-- data 4 - 255 matches no address    -> 0000
-- data 256 matches addresses 0,1,2,3 -> 1111
-- data 257 - 511 matches no address  -> 0000
--
-- Output Vector (for each column):
--   Note that each BRAM is configured as 512(9-bit CAM width) x 32(CAM depth)
-- BRAM0: (508 instances of 0000) 0001 0010 0100 1000
-- BRAm1: (255 instances of 0000) 1111 (256 instances of 0000)
-------------------------------------------------------------------------------
  FUNCTION parse_init(
    PRIMS_WIDE_f   : INTEGER;
    init_vector_f  : INIT_VECTOR_TYPE;
    depth_f        : INTEGER;
    WIDTH_REM_f    : INTEGER;
    mem_init_f     : INTEGER
    )
    RETURN COLUMN_INIT_TYPE IS
    VARIABLE init  : COLUMN_INIT_TYPE := (OTHERS => (OTHERS => '0'));  
    VARIABLE data  : STD_LOGIC_VECTOR(PRIM_ADDRB_WIDTH-1 DOWNTO 0)
                     := (OTHERS => '0');
    VARIABLE data2 : STD_LOGIC_VECTOR(WIDTH_REM_f-1 DOWNTO 0)
                     := (OTHERS => '0');
    VARIABLE pad   : STD_LOGIC_VECTOR(PRIM_ADDRB_WIDTH-1-WIDTH_REM_f DOWNTO 0) 
                     := (OTHERS => '0');
    VARIABLE tmp   : STD_LOGIC_VECTOR(PRIM_ADDRB_WIDTH-1 DOWNTO 0) 
                     := (OTHERS => '0');
  BEGIN
    IF mem_init_f = 1 THEN
      FOR j IN 0 TO PRIMS_WIDE_f-1 LOOP
        FOR i IN 0 TO depth_f-1 LOOP
          IF (WIDTH_REM_f = 0 OR PRIMS_WIDE_f > j+1) THEN
            data := init_vector_f(j)(PRIM_ADDRB_WIDTH*i+PRIM_ADDRB_WIDTH-1 
                                     DOWNTO PRIM_ADDRB_WIDTH*i);
            init(j)(STD_LOGIC_VECTOR_2_posint(data)*depth_f+i) := '1';


          ELSE
            data2 := init_vector_f(j)(PRIM_ADDRB_WIDTH*i+WIDTH_REM_f-1 
                                      DOWNTO PRIM_ADDRB_WIDTH*i);
            --Passing pad & data2 directly to the STD_LOGIC_VECTOR_2_posint fn 
            --gives unexpected result in RTL simulation. Passing tmp works
            --fine in both simulation and synthesis
            tmp := pad & data2;
            init(j)(STD_LOGIC_VECTOR_2_posint(tmp)*depth_f+i) := '1';
            
          END IF;
        END LOOP;
      END LOOP;  -- j
    END IF;
    RETURN init;
  END parse_init;

-------------------------------------------------------------------------------
-- Constant Declarations (Part 2)
-------------------------------------------------------------------------------
  -- 2D array with individual vectors for each of the columns of BRAM 
  -- primitives (CAM width).
  CONSTANT INIT_2D   : INIT_VECTOR_TYPE := make_column_init(PRIMS_WIDE,
                                                            C_WIDTH,
                                                            C_DEPTH,
                                                            C_INIT_VECTOR,
                                                            WIDTH_REM,
                                                            C_MEM_INIT
                                                            );
  -- 2D array with multi-hot values that will be directly written into 
  -- the BRAM primitives for each column.
  CONSTANT INIT_MHOT : COLUMN_INIT_TYPE := parse_init(PRIMS_WIDE,
                                                      INIT_2D,
                                                      C_DEPTH,
                                                      WIDTH_REM,
                                                      C_MEM_INIT
                                                      );
  --Turn ON/OFF debug code. 
  --DEBUG=0 => Debug code turned off. Debug should be turned off for synthesis.
  --DEBUG=1 => Debug code tuned on.
  CONSTANT DEBUG : INTEGER := 0;

-------------------------------------------------------------------------------
-- Type Declarations (Part 2)
-------------------------------------------------------------------------------
  -- Used to collect the MATCHES output of every primitive
  TYPE MATCH_ARRAY_TYPE IS ARRAY (PRIMS_WIDE-1 DOWNTO 0) OF
    STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0);

  -- Used as the input to the AND gate that calculates the final MATCHES output
  TYPE AND_IN_ARRAY_TYPE IS ARRAY (C_DEPTH-1 DOWNTO 0) OF
    STD_LOGIC_VECTOR(PRIMS_WIDE-1 DOWNTO 0);

-------------------------------------------------------------------------------
-- Signal Declarations
-------------------------------------------------------------------------------
  SIGNAL pad_data : STD_LOGIC_VECTOR(PRIM_ADDRB_WIDTH-WIDTH_REM-1 DOWNTO 0)
                    := (OTHERS => '0');  
  SIGNAL padded_wr_data : STD_LOGIC_VECTOR(PRIM_ADDRB_WIDTH-1 DOWNTO 0)
                          := (OTHERS => '0');  
  SIGNAL padded_rd_data : STD_LOGIC_VECTOR(PRIM_ADDRB_WIDTH-1 DOWNTO 0)
                          := (OTHERS => '0');  
  SIGNAL matches_vector : MATCH_ARRAY_TYPE
                          := (OTHERS => (OTHERS => '0'));  
  SIGNAL memory_out     : STD_LOGIC_VECTOR(C_WIDTH-1 DOWNTO 0)
                          := (OTHERS => '0');  
  SIGNAL mux_out        : STD_LOGIC_VECTOR(C_WIDTH-1 DOWNTO 0)  
                          := (OTHERS => '0');  
  SIGNAL decode_out     : STD_LOGIC_VECTOR(PRIMS_DEEP-1 DOWNTO 0)
                          := (OTHERS => '0');  
  SIGNAL we_vector      : STD_LOGIC_VECTOR(PRIMS_DEEP-1 DOWNTO 0)
                          := (OTHERS => '0');  
  SIGNAL and_in         : AND_IN_ARRAY_TYPE
                          := (OTHERS => (OTHERS => '0'));  
  SIGNAL or_out         : STD_LOGIC_VECTOR(0 DOWNTO 0)
                           := "0";  
  SIGNAL wr_count_inv   : STD_LOGIC_VECTOR(0 DOWNTO 0)  
                          := "0";  

-------------------------------------------------------------------------------
-- Architecture Begin
-------------------------------------------------------------------------------
BEGIN
  -----------------------------------------------------------------------------
  --DEBUG code to print constants 
  -----------------------------------------------------------------------------
  gdbg: if(DEBUG=1) GENERATE
    PROCESS 
      VARIABLE d_l : LINE;
    BEGIN
      write(d_l, STRING'("******** cam_mem_blk constants - BEGIN ********"));
      writeline(output, d_l);

      write(d_l, STRING'("PRIM_ADDRB_WIDTH:"));
      write(d_l, PRIM_ADDRB_WIDTH);
      write(d_l, LF);
      write(d_l, STRING'("PRIM_ADDRA_WIDTH:"));
      write(d_l, PRIM_ADDRA_WIDTH);
      write(d_l, LF);
      write(d_l, STRING'("PRIM_WORD_DEPTH:"));
      write(d_l, PRIM_WORD_DEPTH);
      write(d_l, LF);
      write(d_l, STRING'("DEPTH_REM:"));
      write(d_l, DEPTH_REM);
      write(d_l, LF);
      write(d_l, STRING'("WIDTH_REM:"));
      write(d_l, WIDTH_REM);
      write(d_l, LF);
      write(d_l, STRING'("PRIMS_DEEP:"));
      write(d_l, PRIMS_DEEP);
      write(d_l, LF);
      write(d_l, STRING'("PRIMS_WIDE:"));
      write(d_l, PRIMS_WIDE);
      write(d_l, LF);
      write(d_l, LF);
      write(d_l, STRING'("***** 2D array: init ******"));
      FOR i IN 0 TO PRIMS_WIDE-1 LOOP 
        write(d_l, STRING'("i:"));
        write(d_l, i);
        write(d_l, STRING'("init:"));
        write(d_l, STD_LOGIC_VECTOR_2_STRING(INIT_2D(i)));
        write(d_l, LF);
      END LOOP;
      write(d_l, STRING'("***** 2D array: init2 *****"));
      FOR i IN 0 TO PRIMS_WIDE-1 LOOP 
        write(d_l, STRING'("i:"));
        write(d_l, i);
        write(d_l, STRING'("init2:"));
        write(d_l, STD_LOGIC_VECTOR_2_STRING(INIT_MHOT(i)));
        write(d_l, LF);
      END LOOP;
      write(d_l, LF);
      write(d_l, STRING'("******** cam_mem_blk constants- END ********"));
      writeline(output, d_l);
      WAIT;
    END PROCESS;
  END GENERATE gdbg;

  -----------------------------------------------------------------------------
  -- The write counter is generated in cam_control.vhd and it tracks the write
  -- cycles. For the Block RAM implementation, write is a 2-cycle process and 
  -- so WR_COUNT counts from 1 to 0. The first cycle is the erase 
  -- (WR_COUNT='1') and the second cycle is the write (WR_COUNT='0'). 
  -- The erase RAM (dmem) should be written to during the write cycle  
  -- (WR_COUNT='0').  Therefore WR_COUNT needs to be inverted to be 
  -- connected to WE pin of of the Erase RAM and Block RAM. 
  -- Also, when the BRAM primitives are enabled for writing, the DINA input 
  -- that is written into the BRAM (indicating the MATCH condition) is 
  -- to this inverted WR_COUNT. 
  -----------------------------------------------------------------------------
  wr_count_inv(0) <= NOT WR_COUNT(0);

  -----------------------------------------------------------------------------
  -- Create Distributed Memory to record what data is at each address
  -----------------------------------------------------------------------------
  -- This is used during the erase cycle of a write.  The CAM does a lookup of
  -- the data stored on WR_ADDR and then writes a '0' to the CAM, effectively
  -- erasing the old match from the CAM.

  -- Instantiate dmem module that infers a distributed RAM - ONLY FOR 
  -- NON-READ-ONLY-CAMs
  gdmem: IF (C_HAS_WR_ADDR /= 0) GENERATE
    eram: ENTITY cam.dmem 
      GENERIC MAP (
        C_WIDTH            => C_WIDTH,
        C_DEPTH            => C_DEPTH,
        C_WR_ADDR_WIDTH    => C_WR_ADDR_WIDTH,
        C_MEM_INIT         => C_MEM_INIT,
        C_MEM_INIT_FILE    => C_MEM_INIT_FILE
        )  
      PORT MAP (
        CLK    => CLK,
        WE     => wr_count_inv(0),
        ADDR   => WR_ADDR,
        DI     => WR_DATA,
        DO     => memory_out
     );
  END GENERATE gdmem;

  --READ ONLY CAMs
  ngdmem: IF (C_HAS_WR_ADDR = 0) GENERATE
    memory_out <= (OTHERS => '0');
  END GENERATE ngdmem;

  -----------------------------------------------------------------------------
  -- Create a MUX to select between the input data and the output of the RAM
  -----------------------------------------------------------------------------
  -- For the first cycle of a write, the mux will select the output of the RAM
  -- so that the old CAM data can be erased.  For the second cycle of a write,
  -- the mux will select WR_DATA so that the new data can be written to the CAM

  -- NON-READ-ONLY CAMs
  gmux: IF (C_HAS_WR_ADDR /= 0) GENERATE
    pmux: PROCESS (memory_out, WR_DATA, wr_count_inv) 
    BEGIN
      CASE (wr_count_inv(0)) IS 
          WHEN '0'    => mux_out <= memory_out;
          WHEN '1'    => mux_out <= WR_DATA;
          WHEN OTHERS => mux_out <= (OTHERS => 'X');
      END CASE;
    END PROCESS pmux; 
  END GENERATE gmux;

  -- READ-ONLY CAMs
  ngmux: IF (C_HAS_WR_ADDR = 0) GENERATE
    mux_out <= (OTHERS => '0');
  END GENERATE ngmux;

  -----------------------------------------------------------------------------
  -- Create a Decoder to create a WE signal for each row of CAM primitives
  -----------------------------------------------------------------------------
  -- When a write is occurring, only the primitives that are being written to
  -- should have WE high. The decoder output is used to set WE high for the
  -- proper primitives. The output is created from the MSB's of the WR_ADDR.
  -- WR_ADDR(4 DOWNTO 0) are used in the CAM primitives and the remainder of
  -- WR_ADDR (bits 5 and above) are used as the input into the decoder.
 
  -- NON-READ-ONLY CAMs
  gdec: IF (C_HAS_WR_ADDR /= 0) GENERATE
    ---------------------------------------------------------------------------
    -- More than 1 BRAM in CAM depth 
    ---------------------------------------------------------------------------
    gmprim : IF C_WR_ADDR_WIDTH-REMADDR_WIDTH > 0 GENERATE
       -- One-hot decoder
       -- Example: Input = 0111 => Output = 0000 0000 1000 0000
       pdec : PROCESS (WR_ADDR)
       BEGIN
         FOR i IN 0 TO PRIMS_DEEP-1 LOOP
           IF (i = STD_LOGIC_VECTOR_2_posint(
                     WR_ADDR(C_WR_ADDR_WIDTH-1 DOWNTO REMADDR_WIDTH))) THEN
             decode_out(i) <= '1';
           ELSE
             decode_out(i) <= '0';
           END IF;
         END LOOP;  -- i
       END PROCESS pdec;

       -- Create the final WE array.  The CAM primitive will be enabled to 
       -- write when the corresponding decoder output is '1' AND either WE is 
       -- high or WR_COUNT is high (meaning that we are in the write cycle of 
       -- the write, not the erase cycle).
       gwe: FOR j IN 0 TO PRIMS_DEEP-1 GENERATE
         we_vector(j) <= WE AND decode_out(j);
       END GENERATE gwe;
    END GENERATE gmprim;
    ---------------------------------------------------------------------------
    -- Equal to 1 BRAM in CAM depth
    ---------------------------------------------------------------------------
    g1prim : IF C_WR_ADDR_WIDTH-REMADDR_WIDTH <= 0 GENERATE
      -- If the width of the write address is less than one primitive's worth,
      -- then there is no need for a decoder in order to select the block that 
      -- is being written to. So, the enable of that piece can just be 
      -- connected to write enable.
      we_vector(0) <= we;
    END GENERATE g1prim;
  END GENERATE gdec;

  -- READ-ONLY CAMs
  ngdec: IF (C_HAS_WR_ADDR = 0) GENERATE
   we_vector <= (OTHERS => '0');
  END GENERATE ngdec;

  -----------------------------------------------------------------------------
  -- Create rows of cam_mem_blk_extdepth modules (one column of CAM primitives)
  -----------------------------------------------------------------------------
  -- Example: V4 CAM width = 18 => PRIMS_WIDE = 18/9 = 2
  --             CAM depth = 96 => PRIMS_DEEP = 96/32 = 3
  --
  -- PRIMS_WIDE=2
  --    i=0  +--------------------------------------------------------+
  --         |     cam_mem_blk_extdepth                               |
  --         |                                                        |
  --         |PRIMS_DEEP=3                                            |
  --         |j=0 +----------+  j=1  +----------+ j=2  +----------+   |
  --         |    |_extdepth |       |_extdepth |      |_extdepth |   |
  --         |    |_prim     |       |_prim     |      |_prim     |   |
  --         |    |          |       |          |      |          |   |
  --         |    | +-----+  |       | +-----+  |      | +-----+  |   |
  --         |    | |RAMB |  |       | |RAMB |  |      | |RAMB |  |   |
  --         |    | |     |  |       | |     |  |      | |     |  |   |
  --         |    | |     |  |       | |     |  |      | |     |  |   |
  --         |    | +-----+  |       | +-----+  |      | +-----+  |   |
  --         |    |          |       |          |      |          |   |
  --         |    +----------+       +----------+      +----------+   |
  --         |                                                        |
  --         +--------------------------------------------------------+
  --
  --    i=1  +--------------------------------------------------------+
  --         |     cam_mem_blk_extdepth                               |
  --         |                                                        |
  --         |PRIMS_DEEP=3                                            |
  --         |j=0 +----------+  j=1  +----------+ j=2  +----------+   |
  --         |    |_extdepth |       |_extdepth |      |_extdepth |   |
  --         |    |_prim     |       |_prim     |      |_prim     |   |
  --         |    |          |       |          |      |          |   |
  --         |    | +-----+  |       | +-----+  |      | +-----+  |   |
  --         |    | |RAMB |  |       | |RAMB |  |      | |RAMB |  |   |
  --         |    | |     |  |       | |     |  |      | |     |  |   |
  --         |    | |     |  |       | |     |  |      | |     |  |   |
  --         |    | +-----+  |       | +-----+  |      | +-----+  |   |
  --         |    |          |       |          |      |          |   |
  --         |    +----------+       +----------+      +----------+   |
  --         |                                                        |
  --         +--------------------------------------------------------+
 
  -----------------------------------------------------------------------------
  gextw : FOR i IN 0 TO PRIMS_WIDE-1 GENERATE

    ---------------------------------------------------------------------------
    -- Instantiate a CAM row which uses the complete width
    ---------------------------------------------------------------------------
    gcp : IF WIDTH_REM = 0 OR i < PRIMS_WIDE-1 GENERATE
      extd : ENTITY cam.cam_mem_blk_extdepth
        GENERIC MAP(
          C_MEM_INIT           => C_MEM_INIT,
          C_DEPTH              => C_DEPTH,
          C_INIT_VECTOR        => INIT_MHOT(i),
          C_REMADDR_WIDTH      => REMADDR_WIDTH,
          C_WR_ADDR_WIDTH      => C_WR_ADDR_WIDTH,
          C_WR_COUNT_WIDTH     => C_WR_COUNT_WIDTH,
          C_PRIMS_DEEP         => PRIMS_DEEP,
          C_DEPTH_REM          => DEPTH_REM,
          C_WIDTH_BLOCK        => i,
          C_FAMILY             => C_FAMILY,
          C_PRIM_ADDRB_WIDTH   => PRIM_ADDRB_WIDTH,
          C_PRIM_ADDRA_WIDTH   => PRIM_ADDRA_WIDTH,
          C_PRIM_DOUTB_WIDTH   => PRIM_DOUTB_WIDTH,
          C_WIDTH              => C_WIDTH
          )
        PORT MAP(
          BUSY                 => BUSY,
          CLK                  => CLK,
          EN                   => EN,
          RD_DATA              => RD_DATA(i*PRIM_ADDRB_WIDTH+PRIM_ADDRB_WIDTH-1
                                          DOWNTO PRIM_ADDRB_WIDTH*i),
          WE_VECTOR            => we_vector,
          WR_ADDR              => WR_ADDR,
          WR_DATA              => mux_out(i*PRIM_ADDRB_WIDTH+PRIM_ADDRB_WIDTH-1 
                                          DOWNTO PRIM_ADDRB_WIDTH*i),
          WR_COUNT             => wr_count_inv,
          MATCHES              => matches_vector(i)
          );
    END GENERATE gcp;

    -----------------------------------------------------------------------------
    -- Instantiate a CAM row which does not use the complete width
    -----------------------------------------------------------------------------
    gincp : IF WIDTH_REM > 0 AND i = PRIMS_WIDE-1 GENERATE
      
      -- Pad the RD_DATA and WR_DATA with zeros to make them the correct width
      loop1 : FOR j IN WIDTH_REM TO PRIM_ADDRB_WIDTH-1 GENERATE
        padded_rd_data(j)                  <= '0';
        padded_wr_data(j)                  <= '0';
      END GENERATE loop1;
      
      --Fill in the remainder with the actual read/write data
      padded_wr_data(WIDTH_REM-1 DOWNTO 0) <= mux_out(C_WIDTH-1 DOWNTO 
                                                      PRIM_ADDRB_WIDTH*i);
      padded_rd_data(WIDTH_REM-1 DOWNTO 0) <= RD_DATA(C_WIDTH-1 DOWNTO 
                                                      PRIM_ADDRB_WIDTH*i);

      --Instantiate the row
      extd : ENTITY cam.cam_mem_blk_extdepth
        GENERIC MAP(
          C_MEM_INIT           => C_MEM_INIT,
          C_DEPTH              => C_DEPTH,
          C_INIT_VECTOR        => INIT_MHOT(i), 
          C_REMADDR_WIDTH      => REMADDR_WIDTH,
          C_WR_ADDR_WIDTH      => C_WR_ADDR_WIDTH,
          C_WR_COUNT_WIDTH     => C_WR_COUNT_WIDTH,
          C_PRIMS_DEEP         => PRIMS_DEEP,
          C_DEPTH_REM          => DEPTH_REM,
          C_WIDTH_BLOCK        => i,
          C_FAMILY             => C_FAMILY,
          C_PRIM_ADDRB_WIDTH   => PRIM_ADDRB_WIDTH,
          C_PRIM_ADDRA_WIDTH   => PRIM_ADDRA_WIDTH,
          C_PRIM_DOUTB_WIDTH   => PRIM_DOUTB_WIDTH,
          C_WIDTH              => C_WIDTH
          )
        PORT MAP(
          BUSY                 => BUSY,
          CLK                  => CLK,
          EN                   => EN,
          RD_DATA              => padded_rd_data,
          WE_VECTOR            => we_vector,
          WR_ADDR              => WR_ADDR,
          WR_DATA              => padded_wr_data,
          WR_COUNT             => wr_count_inv,
          MATCHES              => matches_vector(i)
          );
    END GENERATE gincp;
  END GENERATE gextw;

  -----------------------------------------------------------------------------
  -- Create the final MATCHES output
  -----------------------------------------------------------------------------
  -- When the CAM is more than 1 CAM primitive wide, the MATCHES outputs for
  -- each column need to be ANDed together to create the correct MATCHES output
  --
  -- Create an array that is as follows:
  --
  -- 1)The number of columns is equal to the number of CAM primitives wide
  -- 2)The number of rows is equal to the number of possible data values for
  --   the CAM
  -- 3)Each row contains the MATCHES signals for each of the columns for the
  --   particular word
  --
  -- Example:
  -- Row 0 : MATCHES signals for each column for data 0 
  -- Row 1 : MATCHES signals for each column for data 1

  -----------------------------------------------------------------------------
  -- CAM is more than one primitive wide
  -----------------------------------------------------------------------------
  gmp : IF PRIMS_WIDE > 1 GENERATE

    gaarr : FOR k IN 0 TO C_DEPTH-1 GENERATE

      gavec  : FOR l IN 0 TO PRIMS_WIDE-1 GENERATE
        and_in(k)(l) <= matches_vector(l)(k);
      END GENERATE gavec;

      -- The resulting rows that are created above are ANDed together using the
      -- following AND gate. The result of the AND operation becomes one of the
      -- bits of the final MATCHES signal.  The result of Row 0 becomes
      -- MATCHES(0) and so on. 
      MATCHES(k) <= AND_REDUCE (and_in(k));
      
    END GENERATE gaarr;
  END GENERATE gmp;
  
  -----------------------------------------------------------------------------
  -- CAM is only one primitive wide
  -----------------------------------------------------------------------------
  -- If the CAM is only one CAM primitive wide then the MATCHES output of that
  -- primitive is the MATCHES output of the CAM, no AND operation is needed.
  g1p: IF PRIMS_WIDE = 1 GENERATE
    MATCHES <=  matches_vector(0);
  END GENERATE g1p;
  
END xilinx;




















