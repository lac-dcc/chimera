--  Module      : cam_top.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : Top-level CAM core file
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
--  >> cam_top.vhd <<
--      |
--      +- cam_rtl.vhd //Top-level synthesizable core file
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Library Declarations
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;


LIBRARY cam;
USE cam.cam_pkg.ALL;

ENTITY cam_top IS
  GENERIC (
    
    C_ADDR_TYPE                :  INTEGER        := 0; --Binary encoded
    C_DEPTH                    :  INTEGER        := 32; --Depth 
    C_FAMILY                   :  STRING         := "virtex6";
    C_HAS_CMP_DIN              :  INTEGER        := 1;
    C_HAS_EN                   :  INTEGER        := 1;
    C_HAS_MULTIPLE_MATCH       :  INTEGER        := 0; --port MULTIPLE_MATCH not present
    C_HAS_READ_WARNING         :  INTEGER        := 0; --port READ_WARNING not present
    C_HAS_SINGLE_MATCH         :  INTEGER        := 0; --port SINGLE_MATCH not present
    C_HAS_WE                   :  INTEGER        := 1; --is RD/WR
    C_MATCH_RESOLUTION_TYPE    :  INTEGER        := 0; --lowest match
    C_MEM_INIT                 :  INTEGER        := 1; --use a mif file
    C_MEM_INIT_FILE            :  STRING         :="";
    C_MEM_TYPE                 :  INTEGER        := 0; --use SRL16
    C_REG_OUTPUTS              :  INTEGER        := 0; --use registered output (for BRAM)
    C_TERNARY_MODE             :  INTEGER        := 1;
    C_WIDTH                    :  INTEGER        := 160

 
    );
  
  PORT (
    CLK             : IN  STD_LOGIC := '0';
    CMP_DATA_MASK   : IN  STD_LOGIC_VECTOR(C_WIDTH-1 DOWNTO 0)
                          := (OTHERS => '0');
    CMP_DIN         : IN  STD_LOGIC_VECTOR(C_WIDTH-1 DOWNTO 0)
                          := (OTHERS => '0');
    DATA_MASK       : IN  STD_LOGIC_VECTOR(C_WIDTH-1 DOWNTO 0)
                          := (OTHERS => '0');
    DIN             : IN  STD_LOGIC_VECTOR(C_WIDTH-1 DOWNTO 0)
                          := (OTHERS => '0');
    EN              : IN  STD_LOGIC := '0';
    WE              : IN  STD_LOGIC := '0';
    WR_ADDR         : IN  STD_LOGIC_VECTOR( addr_width_for_depth(C_DEPTH)-1 DOWNTO 0)
                          := (OTHERS => '0');
    BUSY            : OUT STD_LOGIC := '0';
    MATCH           : OUT STD_LOGIC := '0';
    MATCH_ADDR      : OUT STD_LOGIC_VECTOR( calc_match_addr_width_rev(C_DEPTH,C_ADDR_TYPE)-1 DOWNTO 0)
                          := (OTHERS => '0');
    MULTIPLE_MATCH  : OUT STD_LOGIC := '0';
    READ_WARNING    : OUT STD_LOGIC := '0';
    SINGLE_MATCH    : OUT STD_LOGIC := '0'
    );

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

  attribute max_fanout : integer;
  attribute max_fanout of all: entity is 10;
END cam_top;
    

-------------------------------------------------------------------------------
-- Architecture Heading
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF cam_top IS 
  
CONSTANT S_HAS_CMP_DATA_MASK    : INTEGER   := calc_cmp_data_mask_rev(C_HAS_CMP_DIN, C_TERNARY_MODE);
CONSTANT S_HAS_DATA_MASK        : INTEGER   := calc_data_mask(C_TERNARY_MODE);

BEGIN

 rtl_cam : ENTITY cam.cam_rtl
  GENERIC MAP (
    C_ADDR_TYPE             => C_ADDR_TYPE,
    C_CMP_DATA_MASK_WIDTH   => C_WIDTH,
    C_CMP_DIN_WIDTH         => C_WIDTH,
    C_DATA_MASK_WIDTH       => C_WIDTH,
    C_DEPTH                 => C_DEPTH,
    C_DIN_WIDTH             => C_WIDTH,
    C_FAMILY                => C_FAMILY,
    C_HAS_CMP_DATA_MASK     => S_HAS_CMP_DATA_MASK,
    C_HAS_CMP_DIN           => C_HAS_CMP_DIN,
    C_HAS_DATA_MASK         => S_HAS_DATA_MASK,
    C_HAS_EN                => C_HAS_EN,
    C_HAS_MULTIPLE_MATCH    => C_HAS_MULTIPLE_MATCH, 
    C_HAS_READ_WARNING      => C_HAS_READ_WARNING,
    C_HAS_SINGLE_MATCH      => C_HAS_SINGLE_MATCH,
    C_HAS_WE                => C_HAS_WE,
    C_HAS_WR_ADDR           => C_HAS_WE,
    C_MATCH_ADDR_WIDTH      => calc_match_addr_width_rev(C_DEPTH,C_ADDR_TYPE),
    C_MATCH_RESOLUTION_TYPE => C_MATCH_RESOLUTION_TYPE,
    C_MEM_INIT              => C_MEM_INIT,
    C_MEM_INIT_FILE         => C_MEM_INIT_FILE,
    C_MEM_TYPE              => C_MEM_TYPE,
    C_ELABORATION_DIR       => "",
    C_READ_CYCLES           => 1,
    C_REG_OUTPUTS           => C_REG_OUTPUTS,
    C_TERNARY_MODE          => C_TERNARY_MODE,
    C_WIDTH                 => C_WIDTH,
    C_WR_ADDR_WIDTH         => addr_width_for_depth(C_DEPTH)
    )

-------------------------------------------------------------------------------
-- Generic Definitions:
-------------------------------------------------------------------------------
  -- C_FAMILY                : Architecture
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
  -- C_HAS_WR_ADDR           : 1 if wr_addr input port present
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
  --                           2 = Enhanced Ternary (can store X's and U's)
  -- C_WIDTH                 : Determines the width of the CAM.
  -- C_WR_ADDR_WIDTH         : Width of WR_ADDR port = log2roundup(C_DEPTH)
-------------------------------------------------------------------------------
   
  PORT MAP (
    CLK                     => CLK,
    CMP_DATA_MASK           => CMP_DATA_MASK,
    CMP_DIN                 => CMP_DIN,
    DATA_MASK               => DATA_MASK,
    DIN                     => DIN,
    EN                      => EN,
    WE                      => WE,
    WR_ADDR                 => WR_ADDR,
    BUSY                    => BUSY,
    MATCH                   => MATCH,
    MATCH_ADDR              => MATCH_ADDR,
    MULTIPLE_MATCH          => MULTIPLE_MATCH,
    READ_WARNING            => READ_WARNING,
    SINGLE_MATCH            => SINGLE_MATCH
    );


END xilinx;
