--  Module      : cam_control.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : Control Logic for the CAM.
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
--      +--  << cam_control >>
--
-------------------------------------------------------------------------------
-- This module generates the following signals/user outputs:
--   * BUSY       - BUSY output to the user
--   * INT_REG_EN - Internal register enable signal to cam_input
--   * RD_ERR     - READ_WARNING user output when C_REG_OUTPUTS=0
--   * RD_DEC_CLR - Internal enable signal for the READ_WARNING 
--                  decoder in cam_match_enc.vhd
--   * WR_COUNT   - Internal Write Count (count to track write 
--                  cycles) for cam_mem.vhd
--   * WREN       - Internal Write Enable for cam_mem.vhd
-------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL;

ENTITY cam_control IS
  GENERIC (
    C_FAMILY             : STRING  := "virtex5";
    C_MEM_TYPE           : INTEGER := 0;
    C_RD_DATA_MASK_WIDTH : INTEGER := 1;
    C_RD_DIN_WIDTH       : INTEGER := 1;
    C_TERNARY_MODE       : INTEGER := 0;
    C_WIDTH              : INTEGER := 1;
    C_HAS_WR_ADDR        : INTEGER := 1;
    C_WR_ADDR_WIDTH      : INTEGER := 1;
    C_WR_COUNT_WIDTH     : INTEGER := 1;
    C_WR_DATA_MASK_WIDTH : INTEGER := 1;
    C_WR_DIN_WIDTH       : INTEGER := 1
    );
  PORT (
    --Inputs
    CLK               : IN  STD_LOGIC := '0';
    EN                : IN  STD_LOGIC := '0';
    RD_DATA_MASK      : IN  STD_LOGIC_VECTOR(C_RD_DATA_MASK_WIDTH-1 DOWNTO 0)
                            := (OTHERS => '0');
    RD_DIN            : IN  STD_LOGIC_VECTOR(C_RD_DIN_WIDTH-1 DOWNTO 0)
                            := (OTHERS => '0');
    WE                : IN  STD_LOGIC := '0';
    WR_DATA_MASK      : IN  STD_LOGIC_VECTOR(C_WR_DATA_MASK_WIDTH-1 DOWNTO 0)
                            := (OTHERS => '0');
    WR_DIN            : IN  STD_LOGIC_VECTOR(C_WR_DIN_WIDTH-1 DOWNTO 0)
                            := (OTHERS => '0');
    --Outputs
    BUSY              : OUT STD_LOGIC := '0';
    INT_REG_EN        : OUT STD_LOGIC := '0';
    RD_ERR            : OUT STD_LOGIC := '0';
    RW_DEC_CLR        : OUT STD_LOGIC := '0';
    WR_COUNT          : OUT STD_LOGIC_VECTOR(C_WR_COUNT_WIDTH-1 DOWNTO 0)
                            := (OTHERS => '0');
    WREN              : OUT STD_LOGIC := '0'
    );
    
    
    attribute max_fanout : integer;
    attribute max_fanout of all: entity is 10;

END cam_control;

-------------------------------------------------------------------------------
-- Architecture Declaration
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF cam_control IS

  -- Define the CAM width for a block-memory primitive
  -- V4/S3/S6    : PortA => 16kx1, Port B => 512x32
  -- V5/V6       : PortA => 32kx1, Port B => 1kx32 (RAMB36)
  CONSTANT PRIMITIVE_WIDTH : INTEGER 
    := if_then_else(  ( (derived(C_FAMILY,"virtex5")) or (derived(C_FAMILY, "virtex6")) or (derived(C_FAMILY, "virtex6l"))  ), 10, 9);

  -- For Block Memory only:
  -- determine the number of comparators needed
  CONSTANT NUMCOMPS : INTEGER := divroundup(C_WIDTH, PRIMITIVE_WIDTH);
 
  -- BUSY is a signal that indicates that a write operation is already
  -- in progress. It goes high AFTER the first rising edge of a write,
  -- and a user can start a new write operation on any rising clock edge where
  -- BUSY is low.
  -- BUSY should be initialized to 0 on startup
  SIGNAL busy_i               : STD_LOGIC := '0'; 
  
  -- Internal Register Enable for the Input Logic
  -- INT_REG_EN should be initialized to 1 on startup
  -- INT_REG_EN='1' => A write is not in progress (default)
  -- INT_REG_EN='0' => A write is in progress (goes from '1' to '0' one clock 
  --                  cycle after WE is asserted. 
  SIGNAL int_reg_en_i         : STD_LOGIC := '1'; 
  
  -- RD_ERR should be initialized to 0 on startup
  SIGNAL rd_err_i             : STD_LOGIC := '0';
  
  -- Clear signal for the Block Memory Match Disable logic (Read Warning 
  -- Decoder) in cam_match_enc module. 
  -- rw_dec_clr_i='1' => The read_warning decoder is disabled, and match_addr 
  --                     is unaffected.
  -- rw_dec_clr_i='0' => The read_warning decoder will be active and will cause
  --                     the bit of match_addr matching the wr_addr to be 
  --                     forced to 0.
  SIGNAL rw_dec_clr_i         : STD_LOGIC := '1';
  
  attribute max_fanout of all: signal is 10;

-------------------------------------------------------------------------------
-- BEGIN ARCHITECTURE
-------------------------------------------------------------------------------
BEGIN  -- xilinx

  -----------------------------------------------------------------------------
  -- Connect internal signals to their associated outputs
  -----------------------------------------------------------------------------
  -- Connect the internal busy_i signal to the BUSY output
  BUSY <= busy_i;

  -- Connect the internal register enable to the INT_REG_EN output
  INT_REG_EN <= int_reg_en_i;

  -- Set the internal write enable for the core.
  -- The user only needs to pulse WE to trigger a write, the internal WREN
  -- signal will go high with the user's pulse of WE, and be locked high by
  -- the busy_i internal signal until the write completes.
  -- NON-READ-ONLY CAMs
  gwe: IF (C_HAS_WR_ADDR /= 0) GENERATE
    WREN <= (WE or busy_i);
  END GENERATE gwe;
  -- READ-ONLY CAMs
  ngwe: IF (C_HAS_WR_ADDR = 0) GENERATE
    WREN <= '0';
  END GENERATE ngwe;
  
  -- Read Error (aka read_warning)
  RD_ERR <= rd_err_i;

  -- Read warning decoder clear signal
  RW_DEC_CLR <= rw_dec_clr_i;

-------------------------------------------------------------------------------
-- Non Read Only CAMs
-------------------------------------------------------------------------------
  gwsig: IF (C_HAS_WR_ADDR /= 0) GENERATE
    
    -- "Nearly Complete" signal, a delayed busy, goes high
    --  to indicate that this is the next-to-last clock cycle of a write.
    SIGNAL end_next_write : STD_LOGIC := '0';

  BEGIN 
   ----------------------------------------------------------------------------
   -- SRL based
   ---------------------------------------------------------------------------- 
    gsrl: IF (C_MEM_TYPE = C_SRL_MEM) GENERATE
      -- Signal for storing write counter value
      SIGNAL wr_count_integer_srl : INTEGER RANGE 15 DOWNTO 0 := 15; 

    BEGIN
      -------------------------------------------------------------------------
      --  Process to create the write counter.
      --
      --  For SRL16, the counter counts from 15 downto 0 during a write, then
      --  resets back to 15.
      --
      --  The counter also controls end_next_write - a signal that is usually 
      --  low, but goes high the next-to-last clock cycle of a write, to 
      --  indicate to other logic to end the write operation on the next 
      --  rising edge.
      --------------------------------------------------------------------------
      pcntr : PROCESS (CLK)
      BEGIN  
        IF (CLK'event AND CLK = '1') THEN
          IF (EN = '1') THEN
            IF (busy_i = '1') THEN
              --Core is already writing (busy)
              IF (wr_count_integer_srl = 0) THEN
                -- Write complete, reset counter
                wr_count_integer_srl <= 15 AFTER TFF;
              ELSE
                -- Count down during write
                wr_count_integer_srl <= wr_count_integer_srl - 1 AFTER TFF;
              END IF;
              IF (wr_count_integer_srl = 1) THEN
                -- Next to last clock cycle
                --  set "nearly complete" to 1 to
                --  prepare for end of write
                end_next_write <= '1' AFTER TFF;
              ELSE
                -- "nearly complete" is low otherwise
                end_next_write <= '0' AFTER TFF;
              END IF;
            ELSE
              --Core is NOT already writing
              IF (WE = '1') THEN
                -- On the first clock cycle of write, decrement the counter by 
                -- one
                wr_count_integer_srl <= 14 AFTER TFF;
              ELSE
                -- If no write has begun, leave counter alone
                wr_count_integer_srl <= 15 AFTER TFF;
              END IF;
              -- If core is not already writing, then the "nearly complete" 
              -- signal can not be TRUE.
              end_next_write <= '0' AFTER TFF;
            END IF;
          END IF;  --EN
        END IF;  --CLK
      END PROCESS pcntr;
  
      -------------------------------------------------------------------------
      -- Generate rd_err_i and rw_dec_clr 
      -------------------------------------------------------------------------
      --Set the actual output for WR_COUNT to the hardware (binary) equivalent
      -- of the INTEGER counter.
      WR_COUNT <= int_2_std_logic_vector(wr_count_integer_srl, 
                                         C_WR_COUNT_WIDTH);

      -------------------------------------------------------------------------
      -- perr
      --
      --  This is the process for calculating the rd_err (aka read_warning)
      --  signal.
      --
      --  Essentially, if reading and writing the same data(or matching ternary
      --   data if in ternary mode), then a read error will occur.
      --
      --  Note that this logic effectively takes the place of the BlockRAM
      --  models' collision warnings, so the collision warnings are turned off
      --  for the BlockRAMs (see SIM_COLLISION_CHECK paramter setting in
      --  cam_mem_blk_extdepth_prim.vhd)
      -------------------------------------------------------------------------
     gerr1: IF C_TERNARY_MODE = C_TERNARY_MODE_OFF GENERATE
      perr1 : PROCESS (CLK)
      BEGIN  
        IF (CLK'event AND CLK = '1') THEN
          IF (EN = '1') THEN
            IF (WE = '1' OR busy_i = '1') THEN
              --Only set read err if writing
                -- Binary comparison of read and write data
                IF rd_din = wr_din THEN
                  rd_err_i <= '1' AFTER TFF;
                ELSE
                  rd_err_i <= '0' AFTER TFF;
                END IF;
            ELSE
              -- Not writing - no possibility of read error
              rd_err_i <= '0' AFTER TFF;
            END IF;
          END IF;  --EN
        END IF;  --CLK
      END PROCESS perr1;
     END GENERATE gerr1;

     gerr2: IF C_TERNARY_MODE = C_TERNARY_MODE_STD GENERATE
      perr2 : PROCESS (CLK)
      BEGIN
        IF (CLK'event AND CLK = '1') THEN
          IF (EN = '1') THEN
            IF (WE = '1' OR busy_i = '1') THEN
              --Only set read err if writing
                -- Ternary comparison of read and write data
                  IF synth_ternary_compare(rd_data_mask, rd_din,
                                           wr_data_mask, wr_din) THEN
                    rd_err_i <= '1' AFTER TFF;
                  ELSE
                    rd_err_i <= '0' AFTER TFF;
                  END IF;
            ELSE
              -- Not writing - no possibility of read error
              rd_err_i <= '0' AFTER TFF;
            END IF;
          END IF;  --EN
        END IF;  --CLK
      END PROCESS perr2 ;
     END GENERATE gerr2;

     gerr3: IF C_TERNARY_MODE = C_TERNARY_MODE_ENH GENERATE
      perr3 : PROCESS (CLK) 
      BEGIN
        IF (CLK'event AND CLK = '1') THEN 
          IF (EN = '1') THEN 
            IF (WE = '1' OR busy_i = '1') THEN 
              --Only set read err if writing 
                -- Ternary comparison of read and write data 
                  IF synth_ternary_compare_xy(rd_data_mask, rd_din, 
                                              wr_data_mask, wr_din) THEN 
                    rd_err_i <= '1' AFTER TFF; 
                  ELSE 
                    rd_err_i <= '0' AFTER TFF; 
                  END IF; 
            ELSE 
              -- Not writing - no possibility of read error 
              rd_err_i <= '0' AFTER TFF; 
            END IF; 
          END IF;  --EN 
        END IF;  --CLK 
      END PROCESS perr3 ;
     END GENERATE gerr3;

      --Tie-off rw_dec_clr_i 
      rw_dec_clr_i <= '1';

    END GENERATE gsrl;

    ---------------------------------------------------------------------------
    -- Block RAM Based CAM
    ---------------------------------------------------------------------------
    gblk: IF (C_MEM_TYPE = C_BLOCK_MEM) GENERATE
      -- Signals for storing write counter value
      SIGNAL wr_count_integer_mem : INTEGER RANGE 1 DOWNTO 0 := 1; 
      --Temporary signal
      SIGNAL rd_err_tmp           : STD_LOGIC := '0';
      --create an output signal for each comparator
      SIGNAL rd_warn : STD_LOGIC_VECTOR(NUMCOMPS-1 DOWNTO 0):= (OTHERS => '0');

    BEGIN 
      -------------------------------------------------------------------------
      -- Process to create the write counter.
      --
      --  For block memory, counter counts from 1 downto 0 during a write, 
      --  then resets back to 1.
      --
      --  The counter also controls end_next_write - a signal that is usually 
      --  low, but goes high the next-to-last clock cycle of a write, to 
      --  indicate to other logic to end the write operation on the next rising
      --  edge.
      -------------------------------------------------------------------------
      pcntr : PROCESS (CLK)
      BEGIN  
        IF (CLK'event AND CLK = '1') THEN
          IF (EN = '1') THEN
             IF (WE = '1' AND busy_i = '0') THEN
                --Starting a write
                -- A two-cycle write is automatically "nearly complete"
                end_next_write       <= '1' AFTER TFF;
                wr_count_integer_mem <= 0 AFTER TFF;
              ELSE
                --Ending a write
                end_next_write       <= '0' AFTER TFF;
                wr_count_integer_mem <= 1 AFTER TFF;
              END IF;
          END IF;  --EN
        END IF;  --CLK
      END PROCESS pcntr;
    
      -------------------------------------------------------------------------
      -- Generate rd_err_i and rw_dec_clr 
      -------------------------------------------------------------------------
      --Set the actual output for WR_COUNT to the hardware (binary) equivalent
      -- of the INTEGER counter.
      WR_COUNT <= int_2_STD_LOGIC_VECTOR(wr_count_integer_mem, 
                                         C_WR_COUNT_WIDTH);
        
      -------------------------------------------------------------------------
      -- pcmps
      --
      -- Determine the read warning status for each of the block memory blocks.
      -- Each PRIMITIVE_WIDTH word of the input data (read & write) is compared
      -- to identify possible conflicts at the Block-memory primitive level.
      -------------------------------------------------------------------------
      pcmps: PROCESS (rd_data_mask, rd_din, wr_data_mask, wr_din)
        VARIABLE upbnd : INTEGER; --temporary holder for upper bound of range
        VARIABLE lwbnd : INTEGER; --temporary holder for lower bound of range
      BEGIN  -- PROCESS proc_comps
        --Loop through the number of comparators to build
        FOR chunk IN 0 TO NUMCOMPS-1 LOOP

          IF chunk = NUMCOMPS-1 THEN
            --If this is the last comparator, the upper bound is naturally the
            --  upper bound of the data buses
            upbnd := C_WIDTH-1;
          ELSE
            --Otherwise, use the upper bound for this chunk of the data buses
            upbnd := (chunk+1)*PRIMITIVE_WIDTH-1;          
          END IF;

          --Set the lower bound for this chunk
          lwbnd := chunk*PRIMITIVE_WIDTH;
         
          
            -- For ternary mode, do a binary comparison on the chunk
            IF rd_din(upbnd DOWNTO lwbnd) = wr_din(upbnd DOWNTO lwbnd) THEN
              rd_warn(chunk) <= '1';
            ELSE
              rd_warn(chunk) <= '0';
            END IF;

        END LOOP;  -- i
       END PROCESS pcmps;

       ------------------------------------------------------------------------
       -- Determine whether or not to activate read_warning decoder
       --  If rw_dec_clr is '0', then the read_warning decoder will be active &
       --  will cause the bit of match_addr matching the wr_addr to be forced 
       --  to 0.
       --  If rw_dec_clr is '1', then the read_warning decoder is disabled, and
       --   match_addr is unaffected.
       ------------------------------------------------------------------------
       por: PROCESS (rd_warn, WE, busy_i)
         VARIABLE ored : STD_LOGIC;      
       BEGIN  -- PROCESS orgate
         -- OR together the outputs from each comparator
         ored := '0';
         FOR chunk IN 0 TO NUMCOMPS-1 LOOP
           ored := ored OR rd_warn(chunk);
         END LOOP;  -- chunk

         -- By default, rw_dec_clr_i=1. Set to 0 if one of the 2 conditions
         -- is true:
         -- 1. A write is in progress and any of the comparators returned TRUE
         --    This means that at least one BRAM primitive has a collision
         -- 2. A write is just starting.
         
         rw_dec_clr_i <= NOT ( (ored AND busy_i) OR (WE AND (NOT busy_i)) );
       END PROCESS por;

       ------------------------------------------------------------------------
       -- AND all of the individual read_warning signals together to determine 
       -- the overall read_warning signal
       ------------------------------------------------------------------------
       pand: PROCESS (rd_warn, WE, busy_i)
         VARIABLE anded : STD_LOGIC;
       BEGIN  

         -- AND together the outputs from each comparator
         anded := '1';
         FOR chunk IN 0 TO NUMCOMPS-1 LOOP
           anded := anded AND rd_warn(chunk);
         END LOOP;  

         -- Flag a read error if ALL comparators returned TRUE, and writing
         rd_err_tmp <= anded AND (WE or busy_i);
       END PROCESS pand;

       ------------------------------------------------------------------------
       -- Register the rd_err output, so that it is synchronous and aligns with
       -- the synchronous output of the block memory.
       ------------------------------------------------------------------------
       prder : PROCESS (CLK)
       BEGIN  
         IF (CLK'event AND CLK = '1') THEN
           IF EN = '1' THEN
             rd_err_i <= rd_err_tmp AFTER TFF;
           END IF;
         END IF;
       END PROCESS prder;

    END GENERATE gblk; --Block RAM based CAM

    ---------------------------------------------------------------------------
    -- SRL and Block RAM based Non Read Only CAMs
    --
    --  busy_i :
    --  Goes high after first rising edge of a write operation.
    --  Goes low on the same rising clock edge on which the write operation
    --  is completed, to indicate that next rising clock edge can start a new 
    --  write.
    --
    --  int_reg_en_i :
    --  The input logic registers the inputs used for a write operation, so 
    --  that the user can not modify the write inputs during a write. This 
    --  signal controls the enable on those registers. The registers will only 
    --  be enabled (and therefore updated on the rising clock edge) when
    --  int_reg_en_i is set to 1. Essentially, the registers are disabled 
    --  while a write is in progress.
    ---------------------------------------------------------------------------
    pbre : PROCESS (CLK)
     BEGIN  -- PROCESS proc_busy
       IF (CLK'event AND CLK = '1') THEN
         IF (EN = '1') THEN
           IF (WE = '1' AND busy_i = '0') THEN
             busy_i       <= '1' AFTER TFF;   -- CAM is busy
             int_reg_en_i <= '0' AFTER TFF;   -- Stall input registers
           ELSIF (end_next_write = '1') THEN
             busy_i       <= '0' AFTER TFF;   -- CAM is done writing, not busy
             int_reg_en_i <= '1' AFTER TFF;   -- Re-enable input registers
           --ELSE
             --all other cases, busy holds previous value
           END IF;
         END IF;  --EN
       END IF;  --CLK
     END PROCESS pbre;

  END GENERATE gwsig; -- Non Read Only CAMs

-------------------------------------------------------------------------------
-- Read-Only CAMs
-------------------------------------------------------------------------------
  ngsig: IF (C_HAS_WR_ADDR = 0) GENERATE
    busy_i           <= '0';
    int_reg_en_i     <= '1';
    rd_err_i         <= '0';
    rw_dec_clr_i     <= '1';
 
    gwcsrl : IF C_MEM_TYPE = C_SRL_MEM GENERATE
      WR_COUNT <= int_2_std_logic_vector(15, C_WR_COUNT_WIDTH);
    END GENERATE gwcsrl;
 
    gwcblk : IF C_MEM_TYPE = C_BLOCK_MEM GENERATE
      WR_COUNT <= int_2_std_logic_vector(1, C_WR_COUNT_WIDTH);
    END GENERATE gwcblk;

   END GENERATE ngsig;

END xilinx;
