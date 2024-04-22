--  Module      : cam_mem_blk_extdepth_prim.vhd
--
--  Last Update : 01 March 2011
--  Project     : CAM

--  Description : Instantiates a single Block Memory Primitive for different 
--                families.
--                For Virtex-4, Spartan-3, Spartan-6 
--                  -> 1 Block Memory Primitive builds a 9x32 CAM
--                For Virtex-5, Virtex-6/6L
--                  -> 1 Block Memory Primitive builds a 10x32 CAM
--
--                **This file contains architecture-dependent constructs 
--                and must be updated for newer architectures.
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
--  Structure:
--
--  >> cam_mem_blk_extdepth_prim <<
--      |
--      |
--      +------- RAMB16_S1_S36  (Virtex-4 or Spartan-3 and derivatives)
--      |
--      |
--      +------- BRAM_TDP_MACRO (Virtex-5, Virtex-6, Spartan-6 -
--                               Uni Macro BRAM primitive)
--
-------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE STD.TEXTIO.ALL;

LIBRARY UNISIM;
USE UNISIM.VComponents.ALL;

LIBRARY UNIMACRO;
USE UNIMACRO.VComponents.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL ;

-------------------------------------------------------------------------------
-- Entity Declaration
-------------------------------------------------------------------------------
ENTITY cam_mem_blk_extdepth_prim IS
  GENERIC(
    C_DEPTH              : INTEGER          := 16;
    C_DEPTH_BLOCK        : INTEGER          := 0;
    C_DEPTH_REM          : INTEGER          := 0;
    C_FAMILY             : STRING           := "virtex5";
    C_INIT_VECTOR        : STD_LOGIC_VECTOR; 
    C_MEM_INIT           : INTEGER          := 0;
    C_PRIMS_DEEP         : INTEGER          := 1;
    C_PRIM_ADDRB_WIDTH   : INTEGER          := 10;
    C_PRIM_ADDRA_WIDTH   : INTEGER          := 15;
    C_PRIM_DOUTB_WIDTH   : INTEGER          := 32;
    C_WIDTH              : INTEGER          := 8;
    C_WIDTH_BLOCK        : INTEGER          := 0);

  -----------------------------------------------------------------------------
  -- Input and Output Declarations
  -----------------------------------------------------------------------------
  PORT (
    CLK    : IN  STD_LOGIC := '0';
    EN     : IN  STD_LOGIC := '0';
    ADDR_B : IN  STD_LOGIC_VECTOR(C_PRIM_ADDRB_WIDTH-1 DOWNTO 0) 
                 := (OTHERS => '0');
    WE     : IN  STD_LOGIC := '0';
    DIN_A  : IN  STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
    ADDR_A : IN  STD_LOGIC_VECTOR(C_PRIM_ADDRA_WIDTH-1 DOWNTO 0);
    DOUT_B : OUT STD_LOGIC_VECTOR(C_PRIM_DOUTB_WIDTH-1 DOWNTO 0) 
                 := (OTHERS =>'0'));
                 
                 
                 attribute max_fanout : integer;
                 attribute max_fanout of all: entity is 10;

END cam_mem_blk_extdepth_prim;

-------------------------------------------------------------------------------
-- Port Definitions:
-------------------------------------------------------------------------------
-- DOUT_B : 32-bit data out from Port B of BRAM primitive. DOUT_B represents
--          the match condition of a CAM data in these 32 locations.

-------------------------------------------------------------------------------
-- Architecture Heading
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF cam_mem_blk_extdepth_prim IS

-------------------------------------------------------------------------------
-- Constant Declarations
-------------------------------------------------------------------------------
 --Init array size of the primitives: 
 -- V5/V6/V6L RAMB36 => 128(depth) x 256(width)
 -- V4/S6/S3  RAMB16 =>  64(depth) x 256(width)
 CONSTANT INIT_ARRAY_WIDTH : INTEGER := 256;
 CONSTANT INIT_ARRAY_DEPTH : INTEGER 
   := if_then_else(  ( (derived(C_FAMILY,"virtex5")) or (derived(C_FAMILY, "virtex6")) or (derived(C_FAMILY, "virtex6l"))  ),128,64);
 
 --Port B dimension of the RAMB primitive
 -- V5/V6/V6L RAMB36 => 1024x32
 -- V4/S6/S3  RAMB16 =>  512x32
 CONSTANT PRIM_DEPTH_B : INTEGER 
   := if_then_else(  ( (derived(C_FAMILY,"virtex5")) or (derived(C_FAMILY, "virtex6")) or (derived(C_FAMILY, "virtex6l"))  ),1024,512);

-------------------------------------------------------------------------------
-- Type Declarations
-------------------------------------------------------------------------------
  -- Used to initialize the memory primitive.  Has the dimensions of the
  -- initialization parameters of the primitive
  TYPE INIT_ARRAY_TYPE IS ARRAY (INIT_ARRAY_DEPTH-1 DOWNTO 0) OF 
                                BIT_VECTOR(INIT_ARRAY_WIDTH-1 DOWNTO 0);

  -- A 2 dimensional array that maps out the CAM memory as it is written into
  -- the CAM Primitives(Block Memory Primitives).  Used to map to the
  -- INIT_ARRAY_TYPE type
  TYPE MEM_ARRAY_TYPE IS ARRAY (PRIM_DEPTH_B-1 DOWNTO 0) OF
                                        BIT_VECTOR(C_DEPTH-1 DOWNTO 0);

  
-------------------------------------------------------------------------------
-- Function Declarations
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- FUNCTION : create_mem
-- 
-- This function takes as an input one row of the output of the parse_init
-- function in the cam_mem_blk.vhd.  The parse_init function in cam_mem_blk
-- generates a 2-D array for one column of BRAM primitives and each row of the
-- 2D array represented the multi-hot value that will be directly written to 
-- each BRAM primitive. This create_mem function takes this vector (one row of 
-- the 2D array at a time) and creates a 2D array.  There is no change to the 
-- data, it is just written into a 2D format that is easier to parse.
-- 
-- This function is sort of an intermediate function that creates a 2D array
-- that will be easy for the below create_init function to convert to the 
-- INIT vectors of the primitives.

-- Example input STRING (from parse_init function in cam_mem_blk.vhd):
-- (508 instances of 0000)  0001 0010  0100 1000
--
-- Resulting Output:
-- 1000
-- 0100
-- 0010
-- 0001
-- 0000
-- 0000
-- .
-- .
-- .
-- 
-------------------------------------------------------------------------------
  FUNCTION create_mem(
    rd_data_width : INTEGER;
    matches_width : INTEGER;
    init_vector   : STD_LOGIC_VECTOR(PRIM_DEPTH_B*C_DEPTH-1 DOWNTO 0);
    mem_init_f    : INTEGER)
    RETURN MEM_ARRAY_TYPE IS
    VARIABLE init : MEM_ARRAY_TYPE;
  BEGIN
    IF mem_init_f = 1 THEN
      FOR i IN 0 TO PRIM_DEPTH_B-1 LOOP
        FOR j IN 0 TO C_DEPTH-1 LOOP
          IF init_vector(i*C_DEPTH+j) = '1' THEN
            init(i)(j) := '1';
          ELSE
            init(i)(j) := '0';
          END IF;
        END LOOP;  -- j
      END LOOP;  -- i     
    END IF;
    
    RETURN init;
  END create_mem;

-------------------------------------------------------------------------------
-- FUNCTION : create_init
-- This function creates the initialization array for the current CAM
-- primitive. It takes the MEM_ARRAY created by the above create_mem function 
-- and maps it into a 64 deep by 256 wide array that is used to initialize the
-- V4/S6/S3 RAMB16_S1_S36 or RAMB18 primitive or a 128 deep by 256 wide array
-- to initialize the V5/V6/V6L RAMB36 primitive.
--
-- Input:
-- 1000
-- 0100
-- 0010
-- 0001
-- 0000
-- 0000
-- .
-- .
-- .
--
-- Output: 64 rows by 256 bits
-- Column
--    0          (30 instances of 0000) 0001 0010 0100 1000 
--    1          (all ZEROS)
--    2          (all ZEROS)
--    .          (all ZEROS)
--    .          (all ZEROS)
--    .          (all ZEROS)
--
-------------------------------------------------------------------------------
FUNCTION create_init(
  init_vector   : MEM_ARRAY_TYPE;
  rd_data_width : INTEGER;
  depth_block   : INTEGER;
  width_block   : INTEGER;
  mem_init_f    : INTEGER)
  RETURN INIT_ARRAY_TYPE IS

  VARIABLE init : INIT_ARRAY_TYPE;
  VARIABLE pad  : bit_vector(31-C_DEPTH_REM DOWNTO 0) := (OTHERS => '0');
  VARIABLE data : bit_vector(C_DEPTH_REM-1 DOWNTO 0);
BEGIN
  IF mem_init_f = 1 THEN
    FOR i IN 0 TO INIT_ARRAY_DEPTH-1 LOOP
      FOR j IN 0 TO 7 LOOP
        IF (C_DEPTH_REM = 0 OR C_PRIMS_DEEP > C_DEPTH_BLOCK+1) THEN
          init(i)(j*32+31 DOWNTO j*32) :=
            init_vector(i*8+j)(width_block*32+31 DOWNTO width_block*32);
        ELSE
          data := 
            init_vector(i*8+j)(width_block*32+C_DEPTH_REM-1 DOWNTO 
                               width_block*32);
          init(i)(j*32+31 DOWNTO j*32) := pad & data;
        END IF;
      END LOOP;  -- j
    END LOOP;  -- i   
  END IF;
  RETURN init;
END create_init;

-------------------------------------------------------------------------------
-- Constant Declarations
-------------------------------------------------------------------------------
  -- A 2D representation of the contents of the primitive
  CONSTANT MEM : MEM_ARRAY_TYPE  := create_mem(C_WIDTH,
                                               C_DEPTH,
                                               C_INIT_VECTOR,
                                               C_MEM_INIT);


  -- mem converted to the dimensions of the primitive initialization array
  CONSTANT INIT_MEM : INIT_ARRAY_TYPE := create_init(mem,
                                                     C_WIDTH,
                                                     C_WIDTH_BLOCK,
                                                     C_DEPTH_BLOCK,
                                                     C_MEM_INIT);

 --Turn ON/OFF debug code. 
  --DEBUG=0 => Debug code turned off. Debug should be turned off for synthesis.
  --DEBUG=1 => Debug code tuned on.
  CONSTANT DEBUG : INTEGER := 0;

-------------------------------------------------------------------------------
-- Signal Declarations
-------------------------------------------------------------------------------
  --Dummy signal to connect the DOA of the V5 Unimacro. Leaving DOA "open"
  --throws an error in compilation
  SIGNAL dummy : STD_LOGIC_VECTOR (0 DOWNTO 0) := "0";
  --One-bit WE. Need to pass this as a STD_LOGIC_VECTOR to the BRAM UNIMACRO
  SIGNAL we_vector : STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";

-------------------------------------------------------------------------------
-- Architecture Begin
-------------------------------------------------------------------------------
BEGIN
  -----------------------------------------------------------------------------
  --DEBUG code to print constants 
  -----------------------------------------------------------------------------
  gdbg: IF (DEBUG=1) GENERATE
    PROCESS
      VARIABLE d_l : LINE;
    BEGIN
      write(d_l, STRING'("******* cam_mem_blk_extdepth_prim - BEGIN ********"));
      writeline(output, d_l);
      write(d_l, STRING'("***** 2D array: INIT_MEM ******"));
      FOR i IN 0 TO INIT_ARRAY_DEPTH-1 LOOP 
        write(d_l, STRING'("i:"));
        write(d_l, i);
        write(d_l, STRING'("INIT_MEM:"));
        write(d_l, INIT_MEM(i));
        write(d_l, LF);
      END LOOP;
      write(d_l, LF);

      write(d_l, STRING'("******** cam_mem_blk_extdepth_prim - END ********"));
      writeline(output, d_l);
      WAIT;
    END PROCESS;
  END GENERATE;

-------------------------------------------------------------------------------
  -- Description of the layout of the memory:
-------------------------------------------------------------------------------
  -- Picture the memory as a 32 bit wide word by 512 deep memory
  --
  -- Each address represents a possible data value
  -- Each bit of a word represents whether it matches at that address
  --
  -- For example, if word 100 has a value of 00000000000000000000000000000001
  -- then data 100 matches at address 0
  --
  -- When writing to the memory, ADDR_A (14 bits) is a concatenation of the
  -- data to be written (9 bits) and the 5 LSB's of the address.
  -- The upper 9 bits select which address of the memory to write to and the
  -- lower 5 bits determine which bit of the word to write the '1' to.
  --
  -- Note that the write operation takes 2 clock cycles, this is because each
  -- CAM address can only hold one value.  When writing to an address, the CAM
  -- must first erase the old '1' for the address (1 cycle) then it must write
  -- the new '1' into the CAM (1 cycle).


-------------------------------------------------------------------------------
-- Virtex 4
-- Rely on XST to retarget this V2 primitive to a V4 RAMB16 prim
-------------------------------------------------------------------------------
  v4prim : IF (derived(C_FAMILY,"virtex4") or derived(C_FAMILY,"spartan3") )  
           GENERATE

    by1_36 : RAMB16_S1_S36
      GENERIC MAP(
        INIT_00      => INIT_MEM(0),
        INIT_01      => INIT_MEM(1),
        INIT_02      => INIT_MEM(2),
        INIT_03      => INIT_MEM(3),
        INIT_04      => INIT_MEM(4),
        INIT_05      => INIT_MEM(5),
        INIT_06      => INIT_MEM(6),
        INIT_07      => INIT_MEM(7),
        INIT_08      => INIT_MEM(8),
        INIT_09      => INIT_MEM(9),
        INIT_0A      => INIT_MEM(10),
        INIT_0B      => INIT_MEM(11),
        INIT_0C      => INIT_MEM(12),
        INIT_0D      => INIT_MEM(13),
        INIT_0E      => INIT_MEM(14),
        INIT_0F      => INIT_MEM(15),
        INIT_10      => INIT_MEM(16),
        INIT_11      => INIT_MEM(17),
        INIT_12      => INIT_MEM(18),
        INIT_13      => INIT_MEM(19),
        INIT_14      => INIT_MEM(20),
        INIT_15      => INIT_MEM(21),
        INIT_16      => INIT_MEM(22),
        INIT_17      => INIT_MEM(23),
        INIT_18      => INIT_MEM(24),
        INIT_19      => INIT_MEM(25),
        INIT_1A      => INIT_MEM(26),
        INIT_1B      => INIT_MEM(27),
        INIT_1C      => INIT_MEM(28),
        INIT_1D      => INIT_MEM(29),
        INIT_1E      => INIT_MEM(30),
        INIT_1F      => INIT_MEM(31),
        INIT_20      => INIT_MEM(32),
        INIT_21      => INIT_MEM(33),
        INIT_22      => INIT_MEM(34),
        INIT_23      => INIT_MEM(35),
        INIT_24      => INIT_MEM(36),
        INIT_25      => INIT_MEM(37),
        INIT_26      => INIT_MEM(38),
        INIT_27      => INIT_MEM(39),
        INIT_28      => INIT_MEM(40),
        INIT_29      => INIT_MEM(41),
        INIT_2A      => INIT_MEM(42),
        INIT_2B      => INIT_MEM(43),
        INIT_2C      => INIT_MEM(44),
        INIT_2D      => INIT_MEM(45),
        INIT_2E      => INIT_MEM(46),
        INIT_2F      => INIT_MEM(47),
        INIT_30      => INIT_MEM(48),
        INIT_31      => INIT_MEM(49),
        INIT_32      => INIT_MEM(50),
        INIT_33      => INIT_MEM(51),
        INIT_34      => INIT_MEM(52),
        INIT_35      => INIT_MEM(53),
        INIT_36      => INIT_MEM(54),
        INIT_37      => INIT_MEM(55),
        INIT_38      => INIT_MEM(56),
        INIT_39      => INIT_MEM(57),
        INIT_3A      => INIT_MEM(58),
        INIT_3B      => INIT_MEM(59),
        INIT_3C      => INIT_MEM(60),
        INIT_3D      => INIT_MEM(61),
        INIT_3E      => INIT_MEM(62),
        INIT_3F      => INIT_MEM(63),
        write_mode_a => "WRITE_FIRST",
        write_mode_b => "WRITE_FIRST",
        --Set collision check to NONE since collisions are expected.  READ_
        --WARNING output substititutes for this functionality.
        SIM_COLLISION_CHECK => "NONE",
        INIT_B       => "000000000000000000000000000000000000",
        srval_b      => "000000000000000000000000000000000000"
        )
      PORT MAP (
        CLKA  => CLK,
        CLKB  => CLK,
        ENA   => EN,
        ENB   => EN,
        ADDRA => ADDR_A,
        ADDRB => ADDR_B,
        WEA   => WE,
        WEB   => zero,
        DIA   => DIN_A,
        DIB   => ZEROS32,
        DIPB  => ZEROS4, 
        DOA   => open,
        DOB   => DOUT_B,
        DOPB  => open,
        SSRA  => zero,
        SSRB  => zero 
        );

  END GENERATE v4prim;

-------------------------------------------------------------------------------
-- Virtex5 
-- Instantiate a V5 RAMB36 primitive that behaves as a 10x32 CAM
-- This UNI MACRO instantiation can be parameterized to all future 
-- architectures.
-------------------------------------------------------------------------------
  --Assign the one-bit WE to the WE vector to pass it to the UNIMACRO.
  we_vector (0) <= WE;

  v5prim : IF (derived(C_FAMILY,"virtex5")) GENERATE
  
  -- BRAM_SDP_MACRO: True Dual Port RAM
  -- Macro: Virtex-5
  -- Xilinx HDL Libraries Guide, version 10.1.1

  BRAM_TDP_MACRO_inst : BRAM_TDP_MACRO

    GENERIC MAP (
      BRAM_SIZE => "36Kb", -- Target BRAM, "18Kb" or "36Kb"
      DEVICE => "VIRTEX5", -- Target device: "VIRTEX5"
      WRITE_WIDTH_A => 1, -- Valid values are 1, 2, 4, 9, 18, 36 or 72 
      READ_WIDTH_A => 1, -- Valid values are 1, 2, 4, 9, 18, 36 or 72 
      WRITE_WIDTH_B => 32, -- Valid values are 1, 2, 4, 9, 18, 36 or 72 
      READ_WIDTH_B => 32, -- Valid values are 1, 2, 4, 9, 18, 36 or 72
      --Set collision check to NONE since collisions are expected.  READ_
      --WARNING output substititutes for this functionality
      SIM_COLLISION_CHECK => "NONE",       
      SRVAL_A    => X"000000000000000000", -- Set/Reset value for port A output
      SRVAL_B    => X"000000000000000000", -- Set/Reset value for port B output
      INIT_A     => X"000000000000000000", -- Initial values on output port A
      INIT_B     => X"000000000000000000", -- Initial values on output port B
      DOA_REG    => 0, -- Optional Port A output register (0 or 1)
      DOB_REG    => 0, -- Optional Port B output register (0 or 1)
      INIT_FILE    => "NONE",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      -- INIT_xx declarations specify the initial contents of the RAM
      INIT_00      => INIT_MEM(0),
      INIT_01      => INIT_MEM(1),
      INIT_02      => INIT_MEM(2),
      INIT_03      => INIT_MEM(3),
      INIT_04      => INIT_MEM(4),
      INIT_05      => INIT_MEM(5),
      INIT_06      => INIT_MEM(6),
      INIT_07      => INIT_MEM(7),
      INIT_08      => INIT_MEM(8),
      INIT_09      => INIT_MEM(9),
      INIT_0A      => INIT_MEM(10),
      INIT_0B      => INIT_MEM(11),
      INIT_0C      => INIT_MEM(12),
      INIT_0D      => INIT_MEM(13),
      INIT_0E      => INIT_MEM(14),
      INIT_0F      => INIT_MEM(15),
      INIT_10      => INIT_MEM(16),
      INIT_11      => INIT_MEM(17),
      INIT_12      => INIT_MEM(18),
      INIT_13      => INIT_MEM(19),
      INIT_14      => INIT_MEM(20),
      INIT_15      => INIT_MEM(21),
      INIT_16      => INIT_MEM(22),
      INIT_17      => INIT_MEM(23),
      INIT_18      => INIT_MEM(24),
      INIT_19      => INIT_MEM(25),
      INIT_1A      => INIT_MEM(26),
      INIT_1B      => INIT_MEM(27),
      INIT_1C      => INIT_MEM(28),
      INIT_1D      => INIT_MEM(29),
      INIT_1E      => INIT_MEM(30),
      INIT_1F      => INIT_MEM(31),
      INIT_20      => INIT_MEM(32),
      INIT_21      => INIT_MEM(33),
      INIT_22      => INIT_MEM(34),
      INIT_23      => INIT_MEM(35),
      INIT_24      => INIT_MEM(36),
      INIT_25      => INIT_MEM(37),
      INIT_26      => INIT_MEM(38),
      INIT_27      => INIT_MEM(39),
      INIT_28      => INIT_MEM(40),
      INIT_29      => INIT_MEM(41),
      INIT_2A      => INIT_MEM(42),
      INIT_2B      => INIT_MEM(43),
      INIT_2C      => INIT_MEM(44),
      INIT_2D      => INIT_MEM(45),
      INIT_2E      => INIT_MEM(46),
      INIT_2F      => INIT_MEM(47),
      INIT_30      => INIT_MEM(48),
      INIT_31      => INIT_MEM(49),
      INIT_32      => INIT_MEM(50),
      INIT_33      => INIT_MEM(51),
      INIT_34      => INIT_MEM(52),
      INIT_35      => INIT_MEM(53),
      INIT_36      => INIT_MEM(54),
      INIT_37      => INIT_MEM(55),
      INIT_38      => INIT_MEM(56),
      INIT_39      => INIT_MEM(57),
      INIT_3A      => INIT_MEM(58),
      INIT_3B      => INIT_MEM(59),
      INIT_3C      => INIT_MEM(60),
      INIT_3D      => INIT_MEM(61),
      INIT_3E      => INIT_MEM(62),
      INIT_3F      => INIT_MEM(63),
      -- The next set of INIT_xx are valid when configured as 36Kb
      INIT_40      => INIT_MEM(64),
      INIT_41      => INIT_MEM(65),
      INIT_42      => INIT_MEM(66),
      INIT_43      => INIT_MEM(67),
      INIT_44      => INIT_MEM(68),
      INIT_45      => INIT_MEM(69),
      INIT_46      => INIT_MEM(70),
      INIT_47      => INIT_MEM(71),
      INIT_48      => INIT_MEM(72),
      INIT_49      => INIT_MEM(73),
      INIT_4A      => INIT_MEM(74),
      INIT_4B      => INIT_MEM(75),
      INIT_4C      => INIT_MEM(76),
      INIT_4D      => INIT_MEM(77),
      INIT_4E      => INIT_MEM(78),
      INIT_4F      => INIT_MEM(79),
      INIT_50      => INIT_MEM(80),
      INIT_51      => INIT_MEM(81),
      INIT_52      => INIT_MEM(82),
      INIT_53      => INIT_MEM(83),
      INIT_54      => INIT_MEM(84),
      INIT_55      => INIT_MEM(85),
      INIT_56      => INIT_MEM(86),
      INIT_57      => INIT_MEM(87),
      INIT_58      => INIT_MEM(88),
      INIT_59      => INIT_MEM(89),
      INIT_5A      => INIT_MEM(90),
      INIT_5B      => INIT_MEM(91),
      INIT_5C      => INIT_MEM(92),
      INIT_5D      => INIT_MEM(93),
      INIT_5E      => INIT_MEM(94),
      INIT_5F      => INIT_MEM(95),
      INIT_60      => INIT_MEM(96),
      INIT_61      => INIT_MEM(97),
      INIT_62      => INIT_MEM(98),
      INIT_63      => INIT_MEM(99),
      INIT_64      => INIT_MEM(100),
      INIT_65      => INIT_MEM(101),
      INIT_66      => INIT_MEM(102),
      INIT_67      => INIT_MEM(103),
      INIT_68      => INIT_MEM(104),
      INIT_69      => INIT_MEM(105),
      INIT_6A      => INIT_MEM(106),
      INIT_6B      => INIT_MEM(107),
      INIT_6C      => INIT_MEM(108),
      INIT_6D      => INIT_MEM(109),
      INIT_6E      => INIT_MEM(110),
      INIT_6F      => INIT_MEM(111),
      INIT_70      => INIT_MEM(112),
      INIT_71      => INIT_MEM(113),
      INIT_72      => INIT_MEM(114),
      INIT_73      => INIT_MEM(115),
      INIT_74      => INIT_MEM(116),
      INIT_75      => INIT_MEM(117),
      INIT_76      => INIT_MEM(118),
      INIT_77      => INIT_MEM(119),
      INIT_78      => INIT_MEM(120),
      INIT_79      => INIT_MEM(121),
      INIT_7A      => INIT_MEM(122),
      INIT_7B      => INIT_MEM(123),
      INIT_7C      => INIT_MEM(124),
      INIT_7D      => INIT_MEM(125),
      INIT_7E      => INIT_MEM(126),
      INIT_7F      => INIT_MEM(127),
      -- The next set of INITP_xx are for the parity bits
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- The next set of INIT_xx are valid when configured as 36Kb
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000")

      PORT MAP (
        CLKA   => CLK,       -- Port A clock
        CLKB   => CLK,       -- Port B clock
        ENA    => EN,        -- Port A enable
        ENB    => EN,        -- Port B enable
        ADDRA  => ADDR_A,    -- Port A address
        ADDRB  => ADDR_B,    -- Port B address
        WEA    => we_vector, -- Port A write enable
        WEB    => ZEROS4,    -- Port B write enable
        DIA    => DIN_A,     -- Write data port A
        DIB    => ZEROS32,   -- Write data port B
        DOA    => dummy,     -- Output read data port A 
        DOB    => DOUT_B,    -- Output read data port B
        REGCEA => zero,      -- Port A output register enable
        REGCEB => zero,      -- Port B output register enable
        RSTA   => zero,      -- Port A reset 
        RSTB   => zero       -- Port B reset
      );
-- End of BRAM_TDP_MACRO_inst instantiation

 END GENERATE v5prim;

 v6prim : IF (derived(C_FAMILY,"virtex6")) GENERATE
  
  BRAM_TDP_MACRO_inst : BRAM_TDP_MACRO

    GENERIC MAP (
      BRAM_SIZE => "36Kb", -- Target BRAM, "18Kb" or "36Kb"
      DEVICE => "VIRTEX6", -- Target device: "VIRTEX6"
      WRITE_WIDTH_A => 1, -- Valid values are 1, 2, 4, 9, 18, 36 or 72 
      READ_WIDTH_A => 1, -- Valid values are 1, 2, 4, 9, 18, 36 or 72 
      WRITE_WIDTH_B => 32, -- Valid values are 1, 2, 4, 9, 18, 36 or 72 
      READ_WIDTH_B => 32, -- Valid values are 1, 2, 4, 9, 18, 36 or 72
      --Set collision check to NONE since collisions are expected.  READ_
      --WARNING output substititutes for this functionality
      SIM_COLLISION_CHECK => "NONE",       
      SRVAL_A    => X"000000000000000000", -- Set/Reset value for port A output
      SRVAL_B    => X"000000000000000000", -- Set/Reset value for port B output
      INIT_A     => X"000000000000000000", -- Initial values on output port A
      INIT_B     => X"000000000000000000", -- Initial values on output port B
      DOA_REG    => 0, -- Optional Port A output register (0 or 1)
      DOB_REG    => 0, -- Optional Port B output register (0 or 1)
      INIT_FILE    => "NONE",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      -- INIT_xx declarations specify the initial contents of the RAM
      INIT_00      => INIT_MEM(0),
      INIT_01      => INIT_MEM(1),
      INIT_02      => INIT_MEM(2),
      INIT_03      => INIT_MEM(3),
      INIT_04      => INIT_MEM(4),
      INIT_05      => INIT_MEM(5),
      INIT_06      => INIT_MEM(6),
      INIT_07      => INIT_MEM(7),
      INIT_08      => INIT_MEM(8),
      INIT_09      => INIT_MEM(9),
      INIT_0A      => INIT_MEM(10),
      INIT_0B      => INIT_MEM(11),
      INIT_0C      => INIT_MEM(12),
      INIT_0D      => INIT_MEM(13),
      INIT_0E      => INIT_MEM(14),
      INIT_0F      => INIT_MEM(15),
      INIT_10      => INIT_MEM(16),
      INIT_11      => INIT_MEM(17),
      INIT_12      => INIT_MEM(18),
      INIT_13      => INIT_MEM(19),
      INIT_14      => INIT_MEM(20),
      INIT_15      => INIT_MEM(21),
      INIT_16      => INIT_MEM(22),
      INIT_17      => INIT_MEM(23),
      INIT_18      => INIT_MEM(24),
      INIT_19      => INIT_MEM(25),
      INIT_1A      => INIT_MEM(26),
      INIT_1B      => INIT_MEM(27),
      INIT_1C      => INIT_MEM(28),
      INIT_1D      => INIT_MEM(29),
      INIT_1E      => INIT_MEM(30),
      INIT_1F      => INIT_MEM(31),
      INIT_20      => INIT_MEM(32),
      INIT_21      => INIT_MEM(33),
      INIT_22      => INIT_MEM(34),
      INIT_23      => INIT_MEM(35),
      INIT_24      => INIT_MEM(36),
      INIT_25      => INIT_MEM(37),
      INIT_26      => INIT_MEM(38),
      INIT_27      => INIT_MEM(39),
      INIT_28      => INIT_MEM(40),
      INIT_29      => INIT_MEM(41),
      INIT_2A      => INIT_MEM(42),
      INIT_2B      => INIT_MEM(43),
      INIT_2C      => INIT_MEM(44),
      INIT_2D      => INIT_MEM(45),
      INIT_2E      => INIT_MEM(46),
      INIT_2F      => INIT_MEM(47),
      INIT_30      => INIT_MEM(48),
      INIT_31      => INIT_MEM(49),
      INIT_32      => INIT_MEM(50),
      INIT_33      => INIT_MEM(51),
      INIT_34      => INIT_MEM(52),
      INIT_35      => INIT_MEM(53),
      INIT_36      => INIT_MEM(54),
      INIT_37      => INIT_MEM(55),
      INIT_38      => INIT_MEM(56),
      INIT_39      => INIT_MEM(57),
      INIT_3A      => INIT_MEM(58),
      INIT_3B      => INIT_MEM(59),
      INIT_3C      => INIT_MEM(60),
      INIT_3D      => INIT_MEM(61),
      INIT_3E      => INIT_MEM(62),
      INIT_3F      => INIT_MEM(63),
      -- The next set of INIT_xx are valid when configured as 36Kb
      INIT_40      => INIT_MEM(64),
      INIT_41      => INIT_MEM(65),
      INIT_42      => INIT_MEM(66),
      INIT_43      => INIT_MEM(67),
      INIT_44      => INIT_MEM(68),
      INIT_45      => INIT_MEM(69),
      INIT_46      => INIT_MEM(70),
      INIT_47      => INIT_MEM(71),
      INIT_48      => INIT_MEM(72),
      INIT_49      => INIT_MEM(73),
      INIT_4A      => INIT_MEM(74),
      INIT_4B      => INIT_MEM(75),
      INIT_4C      => INIT_MEM(76),
      INIT_4D      => INIT_MEM(77),
      INIT_4E      => INIT_MEM(78),
      INIT_4F      => INIT_MEM(79),
      INIT_50      => INIT_MEM(80),
      INIT_51      => INIT_MEM(81),
      INIT_52      => INIT_MEM(82),
      INIT_53      => INIT_MEM(83),
      INIT_54      => INIT_MEM(84),
      INIT_55      => INIT_MEM(85),
      INIT_56      => INIT_MEM(86),
      INIT_57      => INIT_MEM(87),
      INIT_58      => INIT_MEM(88),
      INIT_59      => INIT_MEM(89),
      INIT_5A      => INIT_MEM(90),
      INIT_5B      => INIT_MEM(91),
      INIT_5C      => INIT_MEM(92),
      INIT_5D      => INIT_MEM(93),
      INIT_5E      => INIT_MEM(94),
      INIT_5F      => INIT_MEM(95),
      INIT_60      => INIT_MEM(96),
      INIT_61      => INIT_MEM(97),
      INIT_62      => INIT_MEM(98),
      INIT_63      => INIT_MEM(99),
      INIT_64      => INIT_MEM(100),
      INIT_65      => INIT_MEM(101),
      INIT_66      => INIT_MEM(102),
      INIT_67      => INIT_MEM(103),
      INIT_68      => INIT_MEM(104),
      INIT_69      => INIT_MEM(105),
      INIT_6A      => INIT_MEM(106),
      INIT_6B      => INIT_MEM(107),
      INIT_6C      => INIT_MEM(108),
      INIT_6D      => INIT_MEM(109),
      INIT_6E      => INIT_MEM(110),
      INIT_6F      => INIT_MEM(111),
      INIT_70      => INIT_MEM(112),
      INIT_71      => INIT_MEM(113),
      INIT_72      => INIT_MEM(114),
      INIT_73      => INIT_MEM(115),
      INIT_74      => INIT_MEM(116),
      INIT_75      => INIT_MEM(117),
      INIT_76      => INIT_MEM(118),
      INIT_77      => INIT_MEM(119),
      INIT_78      => INIT_MEM(120),
      INIT_79      => INIT_MEM(121),
      INIT_7A      => INIT_MEM(122),
      INIT_7B      => INIT_MEM(123),
      INIT_7C      => INIT_MEM(124),
      INIT_7D      => INIT_MEM(125),
      INIT_7E      => INIT_MEM(126),
      INIT_7F      => INIT_MEM(127),
      -- The next set of INITP_xx are for the parity bits
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- The next set of INIT_xx are valid when configured as 36Kb
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000")

      PORT MAP (
        CLKA   => CLK,       -- Port A clock
        CLKB   => CLK,       -- Port B clock
        ENA    => EN,        -- Port A enable
        ENB    => EN,        -- Port B enable
        ADDRA  => ADDR_A,    -- Port A address
        ADDRB  => ADDR_B,    -- Port B address
        WEA    => we_vector, -- Port A write enable
        WEB    => ZEROS4,    -- Port B write enable
        DIA    => DIN_A,     -- Write data port A
        DIB    => ZEROS32,   -- Write data port B
        DOA    => dummy,     -- Output read data port A 
        DOB    => DOUT_B,    -- Output read data port B
        REGCEA => zero,      -- Port A output register enable
        REGCEB => zero,      -- Port B output register enable
        RSTA   => zero,      -- Port A reset 
        RSTB   => zero       -- Port B reset
      );
-- End of BRAM_TDP_MACRO_inst instantiation

 END GENERATE v6prim;


  s6prim : IF (derived(C_FAMILY,"spartan6")) GENERATE

  BRAM_TDP_MACRO_inst : BRAM_TDP_MACRO

    GENERIC MAP (
      BRAM_SIZE => "18Kb", -- Target BRAM, "18Kb" or "9Kb"
      DEVICE => "SPARTAN6", -- Target device: "SPARTAN6"
      WRITE_WIDTH_A => 1, -- Valid values are 1, 2, 4, 9, 18, 36 or 72 
      READ_WIDTH_A => 1, -- Valid values are 1, 2, 4, 9, 18, 36 or 72 
      WRITE_WIDTH_B => 32, -- Valid values are 1, 2, 4, 9, 18, 36 or 72 
      READ_WIDTH_B => 32, -- Valid values are 1, 2, 4, 9, 18, 36 or 72
      --Set collision check to NONE since collisions are expected.  READ_
      --WARNING output substititutes for this functionality
      SIM_COLLISION_CHECK => "NONE",       
      SRVAL_A    => X"000000000000000000", -- Set/Reset value for port A output
      SRVAL_B    => X"000000000000000000", -- Set/Reset value for port B output
      INIT_A     => X"000000000000000000", -- Initial values on output port A
      INIT_B     => X"000000000000000000", -- Initial values on output port B
      DOA_REG    => 0, -- Optional Port A output register (0 or 1)
      DOB_REG    => 0, -- Optional Port B output register (0 or 1)
      INIT_FILE    => "NONE",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      -- INIT_xx declarations specify the initial contents of the RAM
      INIT_00      => INIT_MEM(0),
      INIT_01      => INIT_MEM(1),
      INIT_02      => INIT_MEM(2),
      INIT_03      => INIT_MEM(3),
      INIT_04      => INIT_MEM(4),
      INIT_05      => INIT_MEM(5),
      INIT_06      => INIT_MEM(6),
      INIT_07      => INIT_MEM(7),
      INIT_08      => INIT_MEM(8),
      INIT_09      => INIT_MEM(9),
      INIT_0A      => INIT_MEM(10),
      INIT_0B      => INIT_MEM(11),
      INIT_0C      => INIT_MEM(12),
      INIT_0D      => INIT_MEM(13),
      INIT_0E      => INIT_MEM(14),
      INIT_0F      => INIT_MEM(15),
      INIT_10      => INIT_MEM(16),
      INIT_11      => INIT_MEM(17),
      INIT_12      => INIT_MEM(18),
      INIT_13      => INIT_MEM(19),
      INIT_14      => INIT_MEM(20),
      INIT_15      => INIT_MEM(21),
      INIT_16      => INIT_MEM(22),
      INIT_17      => INIT_MEM(23),
      INIT_18      => INIT_MEM(24),
      INIT_19      => INIT_MEM(25),
      INIT_1A      => INIT_MEM(26),
      INIT_1B      => INIT_MEM(27),
      INIT_1C      => INIT_MEM(28),
      INIT_1D      => INIT_MEM(29),
      INIT_1E      => INIT_MEM(30),
      INIT_1F      => INIT_MEM(31),
      INIT_20      => INIT_MEM(32),
      INIT_21      => INIT_MEM(33),
      INIT_22      => INIT_MEM(34),
      INIT_23      => INIT_MEM(35),
      INIT_24      => INIT_MEM(36),
      INIT_25      => INIT_MEM(37),
      INIT_26      => INIT_MEM(38),
      INIT_27      => INIT_MEM(39),
      INIT_28      => INIT_MEM(40),
      INIT_29      => INIT_MEM(41),
      INIT_2A      => INIT_MEM(42),
      INIT_2B      => INIT_MEM(43),
      INIT_2C      => INIT_MEM(44),
      INIT_2D      => INIT_MEM(45),
      INIT_2E      => INIT_MEM(46),
      INIT_2F      => INIT_MEM(47),
      INIT_30      => INIT_MEM(48),
      INIT_31      => INIT_MEM(49),
      INIT_32      => INIT_MEM(50),
      INIT_33      => INIT_MEM(51),
      INIT_34      => INIT_MEM(52),
      INIT_35      => INIT_MEM(53),
      INIT_36      => INIT_MEM(54),
      INIT_37      => INIT_MEM(55),
      INIT_38      => INIT_MEM(56),
      INIT_39      => INIT_MEM(57),
      INIT_3A      => INIT_MEM(58),
      INIT_3B      => INIT_MEM(59),
      INIT_3C      => INIT_MEM(60),
      INIT_3D      => INIT_MEM(61),
      INIT_3E      => INIT_MEM(62),
      INIT_3F      => INIT_MEM(63),
     
      -- The next set of INITP_xx are for the parity bits
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000")


      PORT MAP (
        CLKA   => CLK,       -- Port A clock
        CLKB   => CLK,       -- Port B clock
        ENA    => EN,        -- Port A enable
        ENB    => EN,        -- Port B enable
        ADDRA  => ADDR_A,    -- Port A address
        ADDRB  => ADDR_B,    -- Port B address
        WEA    => we_vector, -- Port A write enable
        WEB    => ZEROS4,    -- Port B write enable
        DIA    => DIN_A,     -- Write data port A
        DIB    => ZEROS32,   -- Write data port B
        DOA    => dummy,     -- Output read data port A 
        DOB    => DOUT_B,    -- Output read data port B
        REGCEA => zero,      -- Port A output register enable
        REGCEB => zero,      -- Port B output register enable
        RSTA   => zero,      -- Port A reset 
        RSTB   => zero       -- Port B reset
      );
-- End of BRAM_TDP_MACRO_inst instantiation

 END GENERATE s6prim;

  
END xilinx;



