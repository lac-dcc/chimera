--  Module      : cam_mem_blk_extdepth.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : Block Memory - Creates columns of RAMB primitives based on 
--                CAM depth
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
--  >> cam_mem_blk_extdepth <<
--      |
--      +- cam_mem_blk_extdepth_prim  //Create columns of 
--      |                             //cam_mem_blk_extdepth_prim - one row of 
--      |                             //RAMB primitives based on CAM depth
--      +                             //(The last primitive is used completely  
--                                    //in depth)  
--      |
--      +- cam_mem_blk_extdepth_prim  //Create columns of  
--                                    //cam_mem_blk_extdepth_prim - one row of 
--                                    //RAMB primitives based on CAM depth
--                                    //(The last primitive is used partially  
--                                    //in depth)  
--
--
-------------------------------------------------------------------------------



-------------------------------------------------------------------------------
-- Library Declarations
-------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL ;

-------------------------------------------------------------------------------
-- Entity Declaration
-------------------------------------------------------------------------------
ENTITY cam_mem_blk_extdepth IS

  -----------------------------------------------------------------------------
  -- Generic Declarations (alphabetical)
  -----------------------------------------------------------------------------
  GENERIC (
    C_DEPTH              : INTEGER := 16;
    C_DEPTH_REM          : INTEGER := 0;      
    C_FAMILY             : STRING  := "virtex5";
    C_INIT_VECTOR        : STD_LOGIC_VECTOR;
    C_MEM_INIT           : INTEGER := 0;
    C_PRIMS_DEEP         : INTEGER := 1;
    C_PRIM_ADDRA_WIDTH   : INTEGER := 15;
    C_PRIM_ADDRB_WIDTH   : INTEGER := 10;
    C_PRIM_DOUTB_WIDTH   : INTEGER := 32;
    C_REMADDR_WIDTH      : INTEGER := 5;
    C_WIDTH              : INTEGER := 8;
    C_WIDTH_BLOCK        : INTEGER := 0;
    C_WR_ADDR_WIDTH      : INTEGER := 4;
    C_WR_COUNT_WIDTH     : INTEGER := 1      
    );

  -----------------------------------------------------------------------------
  -- Input and Output Declarations
  -----------------------------------------------------------------------------
  PORT (
    BUSY      : IN  STD_LOGIC := '0';
    CLK       : IN  STD_LOGIC := '0';
    EN        : IN  STD_LOGIC := '0';
    RD_DATA   : IN  STD_LOGIC_VECTOR(C_PRIM_ADDRB_WIDTH-1 DOWNTO 0)
                    := (OTHERS => '0');
    WE_VECTOR : IN  STD_LOGIC_VECTOR(C_PRIMS_DEEP-1 DOWNTO 0)
                    := (OTHERS => '0');
    WR_ADDR   : IN  STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0)
                    := (OTHERS => '0');
    WR_DATA   : IN  STD_LOGIC_VECTOR(C_PRIM_ADDRB_WIDTH-1 DOWNTO 0)
                    := (OTHERS => '0');
    WR_COUNT  : IN  STD_LOGIC_VECTOR(C_WR_COUNT_WIDTH-1 DOWNTO 0)
                    := (OTHERS => '0');
    MATCHES   : OUT STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0)
                    := (OTHERS => '0')
    );
    
    attribute max_fanout : integer;
    attribute max_fanout of all: entity is 10;

END cam_mem_blk_extdepth;

-------------------------------------------------------------------------------
-- Generic Definitions:
-------------------------------------------------------------------------------
  -- The following generics are calculated as constants in cam_mem_blk.vhd
  -- C_DEPTH_REM        : Depth of the last BRAM primitive (0 if fully used)
  --                      = C_DEPTH mod 32
  -- C_INIT_VECTOR      : A 2D array of with multi-hot values that will be 
  --                      directly written into the BRAM primitives for each 
  --                      column.Each row of the 2D array represent a BRAM in 
  --                      that column.This constant generic was created in 
  --                      cam_mem_blk.vhd
  -- C_PRIMS_DEEP       : Number of BRAM primitives deep the CAM will be.
  --                      = C_DEPTH/32(complete) or (C_DEPTH/32)+1(one partial)
  -- C_PRIM_ADDRA_WIDTH : Width of PortA address of BRAM primitive.
  --                      V4/S3/S6  : Port A = 16kx1 => 14-bit address
  --                      V5/V6/V6L : Port A = 32kx1 => 15-bit address
  -- C_PRIM_ADDRB_WIDTH : Width of PortB address of BRAM primitive. 
  --                      V4/S3/S6  : Port B = 512x32  => 9-bit address
  --                      V5/V6/V6L : Port B = 1024x32 => 10-bit address
  -- C_PRIM_DOUTB_WIDTH : Width of DOUTB of BRAM primitive = 32.
  -- C_REMADDR_WIDTH    : Remaining address width is the width of the address 
  --                      within each BRAM primitive. The most significant bits 
  --                      of the CAM write address are decoded to select the 
  --                      block, leaving C_REMADDR_WIDTH bits as the address 
  --                      within each block. C_REMADDR_WIDTH=5 for all families
  --                      because the BRAMs are configured as x32 in width => 
  --                      5-bits of address within each BRAM primitive.
  -- C_WIDTH_BLOCK      : Index of the FOR loop in cam_mem_blk which goes from
  --                      0 to (Number of RAM primitives in width-1)
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Architecture Heading
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF cam_mem_blk_extdepth IS

-------------------------------------------------------------------------------
-- Signal Declarations
-------------------------------------------------------------------------------
  SIGNAL padded_matches : STD_LOGIC_VECTOR(C_PRIM_DOUTB_WIDTH-1 DOWNTO 0)
                          := (OTHERS => '0');
  
  SIGNAL write_addr     : STD_LOGIC_VECTOR(C_PRIM_ADDRA_WIDTH-1 DOWNTO 0)
                          := (OTHERS => '0');

  SIGNAL zero           : STD_LOGIC := '0';
  SIGNAL one            : STD_LOGIC_VECTOR(0 DOWNTO 0) := "1";

  SIGNAL pad_addr       : STD_LOGIC_VECTOR(C_REMADDR_WIDTH-1-C_WR_ADDR_WIDTH 
                                           DOWNTO 0) := (OTHERS => '0');

  SIGNAL lsbits         : STD_LOGIC_VECTOR(C_REMADDR_WIDTH-1 DOWNTO 0)
                          := (OTHERS => '0');
  SIGNAL msbits         : STD_LOGIC_VECTOR(C_PRIM_ADDRB_WIDTH-1 DOWNTO 0)
                          := (OTHERS => '0');

-------------------------------------------------------------------------------
-- Architecture Begin
-------------------------------------------------------------------------------
BEGIN

  -- Create the Port A address for the Block Memory Primitives.
  -- This is a combination of the WR_DATA and the 5 lowest bits of the WR_ADDR
  -- bus.
  --
  -- write_addr(13 DOWNTO 5) selects to which data word the '1' is written
  --
  -- write_addr(4 DOWNTO 0) selects to which address the '1' is written
  --
  -- For more information on how this bus is used, see the comments in the
  -- cam_mem_blk_extdepth_prim.vhd file

  -- Assign lower 5-bits or C_WR_ADDR_WIDTH bits (whichever is smaller) of 
  -- WR_ADDR to lower 5-bits or C_WR_ADDR_WIDTH bits of lsbits.
  bigaddr : IF C_WR_ADDR_WIDTH>=C_REMADDR_WIDTH GENERATE
    lsbits(C_REMADDR_WIDTH-1 DOWNTO 0) <= WR_ADDR(C_REMADDR_WIDTH-1 DOWNTO 0);
  END GENERATE bigaddr;
  
  liladdr : IF C_WR_ADDR_WIDTH<C_REMADDR_WIDTH GENERATE
    gpad0: FOR j IN C_WR_ADDR_WIDTH TO C_REMADDR_WIDTH-1 GENERATE
      lsbits(j) <= '0';
    END GENERATE gpad0;

    lsbits(C_WR_ADDR_WIDTH-1 DOWNTO 0) <= WR_ADDR(C_WR_ADDR_WIDTH-1 DOWNTO 0);    
  END GENERATE liladdr;
  

  --msbits is always 9(Non-V5/V6)/10(V5/V6) bits wide, initialized to WR_DATA
  msbits(C_PRIM_ADDRB_WIDTH-1 DOWNTO 0) <=  WR_DATA(C_PRIM_ADDRB_WIDTH-1 
                                                    DOWNTO 0);

  --Build the write_addr
  gwaddr  : FOR i IN 0 TO C_PRIM_ADDRA_WIDTH-1 GENERATE
    glsb  : IF i < C_REMADDR_WIDTH GENERATE
      write_addr(i) <= lsbits(i);
    END GENERATE glsb;
    gmsb : IF i >= C_REMADDR_WIDTH GENERATE
      write_addr(i) <= msbits(i-C_REMADDR_WIDTH);
    END GENERATE gmsb;
  END GENERATE gwaddr;

  -----------------------------------------------------------------------------
  -- Create columns of primitives
  -- For the structure of how RAMBs are concatenated, see comments in 
  -- cam_mem_blk.vhd 
  -----------------------------------------------------------------------------
  gextd: FOR i IN 0 TO C_PRIMS_DEEP-1 GENERATE

    ---------------------------------------------------------------------------
    -- Instantiate a CAM Primitive which uses the complete depth
    ---------------------------------------------------------------------------
    gcp: IF C_DEPTH_rem = 0 OR i < C_PRIMS_DEEP-1 GENERATE

      extdp : ENTITY cam.cam_mem_blk_extdepth_prim
        generic map (
          C_MEM_INIT           => C_MEM_INIT,
          C_DEPTH              => C_DEPTH,
          C_DEPTH_REM          => C_DEPTH_REM,
          C_DEPTH_BLOCK        => i,
          C_FAMILY             => C_FAMILY,
          C_INIT_VECTOR        => C_INIT_VECTOR,
          C_PRIMS_DEEP         => C_PRIMS_DEEP,
          C_PRIM_ADDRB_WIDTH   => C_PRIM_ADDRB_WIDTH,
          C_PRIM_ADDRA_WIDTH   => C_PRIM_ADDRA_WIDTH,
          C_PRIM_DOUTB_WIDTH   => C_PRIM_DOUTB_WIDTH,
          C_WIDTH              => C_WIDTH,
          C_WIDTH_BLOCK        => C_WIDTH_BLOCK
          )
        port map (
          CLK    => CLK,
          EN     => EN,
          ADDR_B => RD_DATA,
          WE     => WE_VECTOR(i),
          DIN_A  => WR_COUNT,
          ADDR_A => write_addr,
          DOUT_B => MATCHES(C_PRIM_DOUTB_WIDTH*i+C_PRIM_DOUTB_WIDTH-1 
                            DOWNTO C_PRIM_DOUTB_WIDTH*i)
          );
    END GENERATE gcp;

  -----------------------------------------------------------------------------
  -- Instantiate a CAM Primitive which does not use the complete depth
  -----------------------------------------------------------------------------
    gincp: IF C_DEPTH_rem > 0 AND i = C_PRIMS_DEEP-1 GENERATE
      extdp : ENTITY cam.cam_mem_blk_extdepth_prim
       GENERIC MAP (
          C_MEM_INIT           => C_MEM_INIT,
          C_DEPTH              => C_DEPTH,
          C_INIT_VECTOR        => C_INIT_VECTOR,
          C_PRIMS_DEEP         => C_PRIMS_DEEP,
          C_DEPTH_REM          => C_DEPTH_REM,
          C_DEPTH_BLOCK        => i,
          C_WIDTH_BLOCK        => C_WIDTH_BLOCK,
          C_FAMILY             => C_FAMILY,
          C_PRIM_ADDRB_WIDTH   => C_PRIM_ADDRB_WIDTH,
          C_PRIM_ADDRA_WIDTH   => C_PRIM_ADDRA_WIDTH,
          C_PRIM_DOUTB_WIDTH   => C_PRIM_DOUTB_WIDTH,
          C_WIDTH              => C_WIDTH
          )
        PORT MAP (
          CLK    => CLK,
          EN     => EN,
          ADDR_B => RD_DATA,
          WE     => WE_VECTOR(i),
          DIN_A  => WR_COUNT,
          ADDR_A => write_addr,
          DOUT_B => padded_matches
          );

      -- padded_matches is a padded 32 bit match output bus.  When the entire
      -- depth is not used, extract only the valid data from the padded_matches
      -- bus.
      MATCHES(C_DEPTH-1 DOWNTO C_PRIM_DOUTB_WIDTH*i) 
        <= padded_matches(C_DEPTH_REM-1 DOWNTO 0);

    END GENERATE gincp;    

  END GENERATE gextd;
  
END xilinx;
