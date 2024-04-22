--  Module      : cam_match_enc.vhd
-- 
--  Last Update : 01 March 2011
--  Project     : CAM

--  Description : Match logic for the CAM.
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
------------------------------------------------------------------------------
--  Structure:
--
--      + >> cam_match_enc <<
--
-------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_misc.ALL;
USE IEEE.STD_LOGIC_unsigned.ALL;

LIBRARY cam;
USE cam.cam_pkg.ALL ;

ENTITY cam_match_enc IS

  GENERIC (
    C_ADDR_TYPE             : INTEGER := 0;
    C_DEPTH                 : INTEGER := 18;
    C_HAS_MULTIPLE_MATCH    : INTEGER := 1;
    C_HAS_SINGLE_MATCH      : INTEGER := 1;
    C_MATCH_RESOLUTION_TYPE : INTEGER := 1;
    C_MEM_TYPE              : INTEGER := 0;
    C_REGISTER_OUTPUTS      : INTEGER := 0;
    C_WIDTH                 : INTEGER := 4;
    C_WR_ADDR_WIDTH         : INTEGER := 5);

  PORT (
    --Inputs
    CLK            : IN  STD_LOGIC := '0';
    EN             : IN  STD_LOGIC := '0';
    RW_DEC_CLR     : IN  STD_LOGIC := '0';
    MATCHES        : IN  STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0) := (OTHERS=>'0');
    WR_ADDR        : IN  STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0) 
                         := (OTHERS=>'0');
    --Outputs
    MATCH          : OUT STD_LOGIC := '0';
    MATCH_ADDR_1H  : OUT STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0) := (OTHERS=>'0');
    MATCH_ADDR_MM  : OUT STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0) := (OTHERS=>'0');
    MATCH_ADDR_BIN : OUT STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0)
                         := (OTHERS=>'0');
    MULTIPLE_MATCH : OUT STD_LOGIC := '0';
    SINGLE_MATCH   : OUT STD_LOGIC := '0');

    attribute max_fanout : integer;
    attribute max_fanout of all: entity is 10;

END cam_match_enc;

-------------------------------------------------------------------------------
-- Architecture declaration 
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF cam_match_enc IS

  -- Bus with disable flags for conflicting addresses (will override X's with
  -- O's on input to match logic)
  SIGNAL blkmem_match_disable  : STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0)  
                                 := (OTHERS => '0');

  -- Output signals before being registered
  SIGNAL match_bf_reg          : STD_LOGIC := '0';  
  SIGNAL multiple_match_bf_reg : STD_LOGIC := '0';  
  SIGNAL multiple_match_spec   : STD_LOGIC := '0';  
  SIGNAL single_match_bf_reg   : STD_LOGIC := '0';  
  SIGNAL match_addr_mm_bf_reg  : STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0)  
                                 := (OTHERS => '0');
  SIGNAL match_addr_1h_bf_reg  : STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0)
                                 := (OTHERS => '0');
  SIGNAL match_addr_bin_bf_reg : STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0)
                                 := (OTHERS => '0');  

  -- Signals that will drive the outputs
  SIGNAL match_int             : STD_LOGIC := '0';  
  SIGNAL multiple_match_int    : STD_LOGIC := '0';  
  SIGNAL single_match_int      : STD_LOGIC := '0';  
  SIGNAL match_addr_mm_int     : STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0) 
                                 := (OTHERS => '0'); 
  SIGNAL match_addr_1h_int     : STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0) 
                                 := (OTHERS => '0'); 
  SIGNAL match_addr_bin_int    : STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0) 
                                 := (OTHERS => '0'); 

  -- Copy of MATCHES input, with bits optionally re-ordered depending on match
  -- resolution type
  SIGNAL matches_i             : STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0)  
                                 := (OTHERS => '0'); 
  SIGNAL matches_1h            : STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0)
                                 := (OTHERS => '0'); 
  SIGNAL matches_bin           : STD_LOGIC_VECTOR(C_WR_ADDR_WIDTH-1 DOWNTO 0)
                                 := (OTHERS => '0'); 

  CONSTANT C_NEEDS_MULT        : INTEGER := C_HAS_SINGLE_MATCH + C_HAS_MULTIPLE_MATCH;
  CONSTANT C_EVEN_DEPTH        : INTEGER := (C_DEPTH + 1) MOD 2;
  CONSTANT C_PWR2_DEPTH        : INTEGER := 2**C_WR_ADDR_WIDTH;
  
  -- Needed for the collapse of bus by tree structure 
  -- num possible busses * eventual width
  TYPE addr_arr_type IS ARRAY (C_PWR2_DEPTH/2 - 1 DOWNTO 0) OF
    STD_LOGIC_VECTOR (C_WR_ADDR_WIDTH-1 DOWNTO 0); 
  
-------------------------------------------------------------------------------
-- Architecture Begin 
-------------------------------------------------------------------------------
BEGIN  -- xilinx

-------------------------------------------------------------------------------
-- Block Memory Match Disable (Read Warning decoder and register in Blockmem 
-- case)
--
-- It is believed that, for a given block memory, if reading and writing to
-- the same location in the memory, the read will return an 'X'.
--
-- This situation is detected by the read_warning logic in cam_control and
-- passed into this module as RW_DEC_CLR.
--
-- When RW_DEC_CLR=1, the output of the Decoder is 0, and nothing is effected.
-- When RW_DEC_CLR=0. the output of the Decoder is the one-hot equivalent of
-- the WR_ADDR (called blkmem_match_disable. This one-hot value is used to
-- mask out/disable the X in the effected location of the match_addr result.
-------------------------------------------------------------------------------
gblkd : IF C_MEM_TYPE = C_BLOCK_MEM GENERATE
  prdec: PROCESS (CLK) BEGIN
    IF (CLK'event AND CLK = '1') THEN 
      IF (EN = '1') THEN
        IF (RW_DEC_CLR = '1') THEN
          blkmem_match_disable <= (OTHERS => '0') AFTER TFF;
        ELSE
          blkmem_match_disable <= (OTHERS => '0') AFTER TFF;
          blkmem_match_disable(conv_INTEGER(WR_ADDR)) <= '1' AFTER TFF;
        END IF;       
      END IF;
    END IF;
  END PROCESS prdec;
END generate gblkd;
  
-------------------------------------------------------------------------------
-- End of Block Memory Match Disable Logic
-------------------------------------------------------------------------------

  -- Pass on Matches to the output match address 
  gmsrl : IF C_ADDR_TYPE = C_MULT_UNENCODED_ADDR AND C_MEM_TYPE = C_SRL_MEM 
  GENERATE
    match_addr_mm_bf_reg <= MATCHES;
    matches_i <= MATCHES;
  END GENERATE gmsrl;

  -- Pass on Matches to the output match address for BLKMEM Implementation
  gmblk : IF C_ADDR_TYPE = C_MULT_UNENCODED_ADDR AND C_MEM_TYPE /= C_SRL_MEM 
  GENERATE
    match_addr_mm_bf_reg <= MATCHES AND NOT blkmem_match_disable;
    matches_i <= MATCHES AND NOT blkmem_match_disable;
  END GENERATE gmblk;

  -- Pass "MATCHES" to match logic 
  rslvh : IF C_ADDR_TYPE /= C_MULT_UNENCODED_ADDR
                 AND C_MATCH_RESOLUTION_TYPE = C_HIGHEST_MATCH
                 AND C_MEM_TYPE = C_SRL_MEM GENERATE
    matches_i <= MATCHES;
  END GENERATE rslvh;

 -- Pass on Matches to match logic for BLKMEM Implementation
  blkin : IF C_ADDR_TYPE /= C_MULT_UNENCODED_ADDR
             AND C_MATCH_RESOLUTION_TYPE = C_HIGHEST_MATCH
             AND C_MEM_TYPE /= C_SRL_MEM GENERATE
    matches_i <= MATCHES AND NOT blkmem_match_disable;
  END GENERATE blkin;

  -- Pass "MATCHES" to match logic in reverse order.
  grslv : IF (C_MATCH_RESOLUTION_TYPE=C_LOWEST_MATCH) AND
                  (C_ADDR_TYPE=C_ENCODED_ADDR OR C_ADDR_TYPE=C_UNENCODED_ADDR) 
            GENERATE
              reorder : FOR i IN 0 TO C_DEPTH - 1 GENERATE
                reorder_srl: IF C_MEM_TYPE = C_SRL_MEM GENERATE
                  matches_i(i) <= MATCHES(C_DEPTH-1-i);
                END GENERATE reorder_srl;
                reorder_blk: IF C_MEM_TYPE /= C_SRL_MEM GENERATE
                  matches_i(i) <= MATCHES(C_DEPTH-1-i) AND 
                                  NOT blkmem_match_disable(C_DEPTH-1-i);
                END generate reorder_blk; 
              END GENERATE reorder;
  END GENERATE grslv;

  -- The first three are when multiple match is needed
  -- Resolve multiple match address to one-hot 
  ohmm: IF (C_ADDR_TYPE = C_UNENCODED_ADDR) AND NOT (C_NEEDS_MULT = 0) 
             GENERATE
    oh_procmm: PROCESS(matches_i)
    VARIABLE matches_red     : STD_LOGIC_VECTOR(C_DEPTH/2 DOWNTO 0);
    VARIABLE mmatches_red    : STD_LOGIC_VECTOR(C_DEPTH/2 DOWNTO 0);
    VARIABLE matches_1h_tmp  : STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0);
    VARIABLE step            : INTEGER RANGE 65536 DOWNTO 0;
    VARIABLE is_full_depth   : INTEGER RANGE 1 DOWNTO 0;
    -- Reduction operator for match to tree the value into the LSB of match.
    -- One-hot address takes the match 'OR' result to zero out lower bits
    -- when higher priority address causes match to be found in that OR.
    -- Essentially, huge OR tree reduction, using the outputs of those ORs,
    --   and if any are true, turning off this one hot address- i.e. a large
    --   one-hot priority encoder, with reuse of partial sums
    BEGIN
      matches_1h_tmp := matches_i;
      in_pr_oh_loopmm: FOR j IN 0 TO C_DEPTH/2-1 LOOP
        matches_1h_tmp(j*2) := matches_i(j*2) AND NOT matches_i(j*2+1);
        matches_red(j) := matches_i(j*2) OR matches_i(j*2+1);
        mmatches_red(j) := matches_i(j*2) AND matches_i(j*2+1);
      END LOOP in_pr_oh_loopmm;     
      IF C_EVEN_DEPTH /= 1 THEN
        mmatches_red(C_DEPTH/2)       := '0';
        matches_red(C_DEPTH/2)        := matches_i(C_DEPTH-1);
      ELSE
        mmatches_red(C_DEPTH/2)       := '0';
        matches_red(C_DEPTH/2)        := '0';
      END IF;
      out_oh_loopmm: FOR i IN 1 TO C_WR_ADDR_WIDTH-1 LOOP
        step := 2**i;
        -- power of two and stray single bits need to keep inside range
        IF (C_DEPTH MOD (2*step)) < step THEN
          is_full_depth := 1;
        ELSE
          is_full_depth := 0;
        END IF;
        mid_oh_loopmm: FOR j IN 0 TO C_DEPTH/(2*step) - is_full_depth LOOP
          in_oh_loopmm: FOR k IN 0 TO step -1 LOOP
            matches_1h_tmp(j*2*step+k) := matches_1h_tmp(j*2*step+k) AND NOT
                                   matches_red(j*step + step/2);
          END LOOP in_oh_loopmm;
          mmatches_red(step*j) := (matches_red(step*j) AND 
                                   matches_red(step*j+step/2))
                                  OR mmatches_red(step*j) 
                                  OR mmatches_red(step*j+step/2);
          matches_red(step*j) := matches_red(step*j) OR 
                                 matches_red(step*j+step/2);
        END LOOP mid_oh_loopmm;
      END LOOP out_oh_loopmm;
      match_bf_reg <= matches_red(0);
      multiple_match_spec <= mmatches_red(0);
      matches_1h <= matches_1h_tmp;
    END PROCESS oh_procmm;
  END GENERATE ohmm;

         

  -- Resolve multiple match address to encoded
  binmm: IF (C_ADDR_TYPE = C_ENCODED_ADDR) AND NOT (C_NEEDS_MULT = 0) 
              GENERATE
    bin_procmm: PROCESS(matches_i)
    VARIABLE matches_s       : STD_LOGIC_VECTOR(C_PWR2_DEPTH - 1 DOWNTO 0);
    VARIABLE matches_red     : STD_LOGIC_VECTOR(C_PWR2_DEPTH/2 - 1 DOWNTO 0);
    VARIABLE mmatches_red    : STD_LOGIC_VECTOR(C_PWR2_DEPTH/2 - 1 DOWNTO 0);
    VARIABLE bin_matches_tmp : addr_arr_type;  -- addr width x depth/2
    VARIABLE step            : INTEGER RANGE 65536 DOWNTO 0;
    VARIABLE is_full_depth   : INTEGER RANGE 1 DOWNTO 0;
    -- Reduction operator for match to tree the value into the LSB of match.
    -- Encoded address takes the higher of the two match bits to select
    --   which of the lsbs to mux in.
    -- This process occurs up the entire tree, essentially a priority encoder
    BEGIN
      matches_s := (OTHERS => '0');
      IF C_MATCH_RESOLUTION_TYPE = C_HIGHEST_MATCH THEN
        matches_s(C_DEPTH-1 DOWNTO 0) := matches_i;
      ELSE
        matches_s(C_PWR2_DEPTH-1 DOWNTO C_PWR2_DEPTH-C_DEPTH) := matches_i;
      END IF;
      
      in_pr_bin_loopmm: FOR j IN 0 TO C_PWR2_DEPTH/2 - 1 LOOP
        bin_matches_tmp(j)(0) := matches_s(j*2+1);
        matches_red(j)        := matches_s(j*2) OR matches_s(j*2+1);
        mmatches_red(j)       := matches_s(j*2) AND matches_s(j*2+1);
      END LOOP in_pr_bin_loopmm;
      out_bin_loopmm: FOR i IN 1 TO C_WR_ADDR_WIDTH - 1 LOOP
        step := 2**i;
        in_bin_loopmm: FOR j IN 0 TO C_PWR2_DEPTH/(2*step) -1 LOOP    
          -- high bit _is_ value, if true take high
          -- sides lsb adds, if not low sides
          bin_matches_tmp(j*step)(i) := matches_red(step*j +step/2);
          IF (matches_red(step*j+step/2) = '1') THEN 
              bin_matches_tmp(j*step)(i-1 DOWNTO 0) :=   
                bin_matches_tmp(j*step + step/2)(i-1 DOWNTO 0);
          ELSE
            bin_matches_tmp(j*step)(i-1 DOWNTO 0) :=
                bin_matches_tmp(j*step)(i-1 DOWNTO 0);
          END IF;
          mmatches_red(step*j) := (matches_red(step*j) AND 
                                   matches_red(step*j+step/2))
                                  OR mmatches_red(step*j) 
                                  OR mmatches_red(step*j+step/2);
          matches_red(step*j) := matches_red(step*j) OR 
                                 matches_red(step*j+step/2);
        END LOOP in_bin_loopmm;
      END LOOP out_bin_loopmm;
      match_bf_reg <= matches_red(0);
      multiple_match_spec <= mmatches_red(0);
      matches_bin <= bin_matches_tmp(0)(C_WR_ADDR_WIDTH-1 DOWNTO 0);
    END PROCESS bin_procmm;
  END GENERATE binmm;
    
  -- generate "MATCH" and "MULTIPLE MATCH" when we don't need to resolve 
  --address
  nomm: IF (C_ADDR_TYPE=C_MULT_UNENCODED_ADDR) AND NOT(C_NEEDS_MULT=0) 
                GENERATE
    none_procmm: PROCESS(matches_i)
    VARIABLE matches_red     : STD_LOGIC_VECTOR(C_DEPTH/2 DOWNTO 0);
    VARIABLE mmatches_red    : STD_LOGIC_VECTOR(C_DEPTH/2 DOWNTO 0);
    VARIABLE step            : INTEGER RANGE 65536 DOWNTO 0;
    VARIABLE is_full_depth   : INTEGER RANGE 1 DOWNTO 0;
    BEGIN
      in_pr_none_loopmm: FOR j IN 0 TO C_DEPTH/2-1 LOOP
        matches_red(j) := matches_i(j*2) OR matches_i(j*2+1);
        mmatches_red(j) := matches_i(j*2) AND matches_i(j*2+1);
      END LOOP in_pr_none_loopmm;
      IF C_EVEN_DEPTH /= 1 THEN
        matches_red(C_DEPTH/2)        := matches_i(C_DEPTH-1);
        mmatches_red(C_DEPTH/2)       := '0';
      ELSE
        matches_red(C_DEPTH/2)        := '0';
        mmatches_red(C_DEPTH/2)       := '0';
      END IF;
      out_none_loopmm: FOR i IN 1 TO C_WR_ADDR_WIDTH - 1 LOOP
        step := 2**i;
        -- power of two and stray single bits need to keep inside range
        IF (C_DEPTH MOD (2*step)) < step THEN
          is_full_depth := 1;
        ELSE
          is_full_depth := 0;
        END IF;
        in_none_loopmm: FOR j IN 0 TO C_DEPTH/(2*step) - is_full_depth LOOP   
          mmatches_red(step*j) := (matches_red(step*j) AND 
                                   matches_red(step*j+step/2))
                                  OR mmatches_red(step*j) 
                                  OR mmatches_red(step*j+step/2);
          matches_red(step*j) := matches_red(step*j) OR 
                                 matches_red(step*j+step/2);
        END LOOP in_none_loopmm;
      END LOOP out_none_loopmm;
      match_bf_reg <= matches_red(0);
      multiple_match_spec <= mmatches_red(0);
    END PROCESS none_procmm;
  END GENERATE nomm;

  -- The last three are when multiple match is NOT needed
  -- Resolve multiple match address to one-hot 
  ohadd : IF (C_ADDR_TYPE = C_UNENCODED_ADDR) AND (C_NEEDS_MULT = 0) GENERATE
    oh_proc: PROCESS(matches_i)
    VARIABLE matches_red     : STD_LOGIC_VECTOR(C_DEPTH/2 DOWNTO 0);
    VARIABLE matches_1h_tmp  : STD_LOGIC_VECTOR(C_DEPTH-1 DOWNTO 0);
    VARIABLE step            : INTEGER RANGE 65536 DOWNTO 0;
    VARIABLE is_full_depth   : INTEGER RANGE 1 DOWNTO 0;
    -- Reduction operator for match to tree the value into the LSB of match.
    -- One-hot address takes the match 'OR' result to zero out lower bits
    -- when higher priority address causes match to be found in that OR.
    -- Essentially, huge OR tree reduction, using the outputs of those ORs,
    --   and if any are true, turning off this one hot address- i.e. a large
    --   one-hot priority encoder, with reuse of partial sums
    BEGIN
      matches_1h_tmp := matches_i;
      in_pr_oh_loop: FOR j IN 0 TO C_DEPTH/2-1 LOOP
        matches_1h_tmp(j*2) := matches_i(j*2) AND NOT matches_i(j*2+1);
        matches_red(j) := matches_i(j*2) OR matches_i(j*2+1);
      END LOOP in_pr_oh_loop;     
      IF C_EVEN_DEPTH /= 1 THEN
        matches_red(C_DEPTH/2)        := matches_i(C_DEPTH-1);
      ELSE
        matches_red(C_DEPTH/2)        := '0';
      END IF;
      out_oh_loop: FOR i IN 1 TO C_WR_ADDR_WIDTH-1 LOOP
        step := 2**i;
        -- power of two and stray single bits need to keep inside range
        IF (C_DEPTH MOD (2*step)) < step THEN
          is_full_depth := 1;
        ELSE
          is_full_depth := 0;
        END IF;
        mid_oh_loop: FOR j IN 0 TO C_DEPTH/(2*step) - is_full_depth LOOP
          in_oh_loop: FOR k IN 0 TO step -1 LOOP
            matches_1h_tmp(j*2*step+k) := matches_1h_tmp(j*2*step+k) AND NOT
                                   matches_red(j*step + step/2);
          END LOOP in_oh_loop;
          matches_red(step*j) := matches_red(step*j) OR 
                                 matches_red(step*j+step/2);
        END LOOP mid_oh_loop;
      END LOOP out_oh_loop;
      match_bf_reg <= matches_red(0);
      matches_1h <= matches_1h_tmp;
    END PROCESS oh_proc;
  END GENERATE ohadd;

  -- Resolve multiple match address to encoded
  binad: IF (C_ADDR_TYPE = C_ENCODED_ADDR) AND (C_NEEDS_MULT = 0) GENERATE
    bin_proc: PROCESS(matches_i)
    VARIABLE matches_s       : STD_LOGIC_VECTOR(C_PWR2_DEPTH - 1 DOWNTO 0);
    VARIABLE matches_red     : STD_LOGIC_VECTOR(C_PWR2_DEPTH/2 - 1 DOWNTO 0);
    VARIABLE bin_matches_tmp : addr_arr_type;  -- addr width x depth/2
    VARIABLE step            : INTEGER RANGE 65536 DOWNTO 0;
    VARIABLE is_full_depth   : INTEGER RANGE 1 DOWNTO 0;
    -- Reduction operator for match to tree the value into the LSB of match.
    -- Encoded address takes the higher of the two match bits to select
    --   which of the lsbs to mux in.
    -- This process occurs up the entire tree, essentially a priority encoder
    BEGIN
      matches_s := (OTHERS => '0');
      IF C_MATCH_RESOLUTION_TYPE = C_HIGHEST_MATCH THEN
        matches_s(C_DEPTH-1 DOWNTO 0) := matches_i;
      ELSE
        matches_s(C_PWR2_DEPTH-1 DOWNTO C_PWR2_DEPTH-C_DEPTH) := matches_i;
      END IF;
      
      in_pr_bin_loop: FOR j IN 0 TO C_PWR2_DEPTH/2-1 LOOP
        bin_matches_tmp(j)(0) := matches_s(j*2+1);
        matches_red(j)        := matches_s(j*2) OR matches_s(j*2+1);
      END LOOP in_pr_bin_loop;
      out_bin_loop: FOR i IN 1 TO C_WR_ADDR_WIDTH - 1 LOOP
        step := 2**i;
        in_bin_loop: FOR j IN 0 TO (C_PWR2_DEPTH/(2*step)) -1 LOOP    
          -- high bit _is_ value, if true take high
          -- sides lsb adds, if not low sides
          bin_matches_tmp(j*step)(i) := matches_red(step*j +step/2);
          IF (matches_red(step*j+step/2) = '1') THEN 
              bin_matches_tmp(j*step)(i-1 DOWNTO 0) :=   
                bin_matches_tmp(j*step + step/2)(i-1 DOWNTO 0);
          ELSE
            bin_matches_tmp(j*step)(i-1 DOWNTO 0) :=
                bin_matches_tmp(j*step)(i-1 DOWNTO 0);
          END IF;
          matches_red(step*j) := matches_red(step*j) OR 
                                 matches_red(step*j+step/2);
        END LOOP in_bin_loop;
      END LOOP out_bin_loop;
      match_bf_reg <= matches_red(0);
      matches_bin <= bin_matches_tmp(0)(C_WR_ADDR_WIDTH-1 DOWNTO 0);
    END PROCESS bin_proc;
  END GENERATE binad;
    
    -- generate "MATCH" when we don't need to resolve address
  nmat: IF (C_ADDR_TYPE = C_MULT_UNENCODED_ADDR) AND (C_NEEDS_MULT = 0) 
              GENERATE
    none_proc: PROCESS(matches_i)
    VARIABLE matches_red     : STD_LOGIC_VECTOR(C_DEPTH/2 DOWNTO 0);
    VARIABLE step            : INTEGER RANGE 65536 DOWNTO 0;
    VARIABLE is_full_depth   : INTEGER RANGE 1 DOWNTO 0;
    BEGIN
      in_pr_none_loop: FOR j IN 0 TO C_DEPTH/2-1 LOOP
        matches_red(j) := matches_i(j*2) OR matches_i(j*2+1);

      END LOOP in_pr_none_loop;
      IF C_EVEN_DEPTH /= 1 THEN
        matches_red(C_DEPTH/2)        := matches_i(C_DEPTH-1);
      ELSE
        matches_red(C_DEPTH/2)        := '0';
      END IF;
      out_none_loop: FOR i IN 1 TO C_WR_ADDR_WIDTH - 1 LOOP
        step := 2**i;
        -- power of two and stray single bits need to keep inside range
        IF (C_DEPTH MOD (2*step)) < step THEN
          is_full_depth := 1;
        ELSE
          is_full_depth := 0;
        END IF;
        in_none_loop: FOR j IN 0 TO C_DEPTH/(2*step) - is_full_depth LOOP   
          matches_red(step*j) := matches_red(step*j) OR 
                                 matches_red(step*j+step/2);
        END LOOP in_none_loop;
      END LOOP out_none_loop;
      match_bf_reg <= matches_red(0);
    END PROCESS none_proc;
  END GENERATE nmat;

  -- Output "SINGLE MATCH" signal
  smat : IF C_HAS_SINGLE_MATCH = 1 GENERATE
    single_match_bf_reg <= match_bf_reg AND NOT multiple_match_spec;
  END GENERATE smat;

  -- Output "MULTIPLE MATCH" signal
  mmat : IF C_HAS_MULTIPLE_MATCH = 1 GENERATE
    multiple_match_bf_reg <= multiple_match_spec;
  END GENERATE mmat;

  
  -----------------------------------------------------------------------------
  -- Invert or twiddle output address if we did bit-twiddling
  -----------------------------------------------------------------------------
  rslh : IF C_MATCH_RESOLUTION_TYPE = C_HIGHEST_MATCH GENERATE
    rslv_hi_out_bin: IF C_ADDR_TYPE = C_ENCODED_ADDR GENERATE
      match_addr_bin_bf_reg <= matches_bin;
    END GENERATE rslv_hi_out_bin;
    rslv_hi_out_1h: IF C_ADDR_TYPE = C_UNENCODED_ADDR GENERATE
      match_addr_1h_bf_reg <= matches_1h;
    END GENERATE rslv_hi_out_1h;  
  END GENERATE rslh;

  rsll : IF C_MATCH_RESOLUTION_TYPE = C_LOWEST_MATCH GENERATE
    rslv_lo_out_bin: IF C_ADDR_TYPE = C_ENCODED_ADDR GENERATE
      match_addr_bin_bf_reg <= NOT matches_bin;
    END GENERATE rslv_lo_out_bin;
    rslv_lo_out_1h: IF C_ADDR_TYPE = C_UNENCODED_ADDR GENERATE
      reorder_out : FOR i IN 0 TO C_DEPTH - 1 GENERATE
        match_addr_1h_bf_reg(i) <= matches_1h(C_DEPTH-1-i);
      END GENERATE reorder_out;
    END GENERATE rslv_lo_out_1h;  
  END GENERATE rsll;

  --------------------------------------------------------------------
  -- Register Outputs
  --------------------------------------------------------------------
  reg : IF C_REGISTER_OUTPUTS = 1 GENERATE

    -- Register "MATCH" signal  
    regm: PROCESS (CLK) BEGIN
     IF (CLK'event AND CLK='1') THEN
       IF (EN = '1') THEN
         match_int <= match_bf_reg AFTER TFF;
       END IF;
     END IF;
    END PROCESS regm;

    -- register "SINGLE_MATCH" signal  
    gregs: IF C_HAS_SINGLE_MATCH = 1 GENERATE
      regsm: PROCESS (CLK) BEGIN
        IF (CLK'event AND CLK='1') THEN
          IF (EN = '1') THEN
            single_match_int <= single_match_bf_reg AFTER TFF;
          END IF;
        END IF;
      END PROCESS regsm;
    END GENERATE gregs;

    --register "MULTIPLE_MATCH" signal
    gregm : IF C_HAS_MULTIPLE_MATCH = 1 GENERATE
      regmm: PROCESS (CLK) BEGIN
        IF (CLK'event AND CLK='1') THEN
          IF (EN = '1') THEN
            multiple_match_int <= multiple_match_bf_reg AFTER TFF;
          END IF;
        END IF;
      END PROCESS regmm;
    END GENERATE gregm;

    --register "MATCH_ADDRESS" signal
    reg1h: IF C_ADDR_TYPE = C_UNENCODED_ADDR GENERATE 
      regma_1h_proc: PROCESS (CLK) BEGIN
        IF (CLK'event AND CLK='1') THEN
          IF (EN = '1') THEN
            match_addr_1h_int <= match_addr_1h_bf_reg AFTER TFF;
          END IF;
        END IF;
       END PROCESS regma_1h_proc;
     END GENERATE reg1h;

    regbi: IF C_ADDR_TYPE = C_ENCODED_ADDR GENERATE 
      regma_bin_proc: PROCESS (CLK) BEGIN
        IF (CLK'event AND CLK='1') THEN
          IF (EN = '1') THEN
            match_addr_bin_int <= match_addr_bin_bf_reg AFTER TFF;
          END IF;
        END IF;
      END PROCESS regma_bin_proc;
    END GENERATE regbi;

    regma: IF C_ADDR_TYPE = C_MULT_UNENCODED_ADDR GENERATE 
      regma_mm_proc: PROCESS (CLK) BEGIN
        IF (CLK'event AND CLK='1') THEN
          IF (EN = '1') THEN
            match_addr_mm_int <= match_addr_mm_bf_reg AFTER TFF;
          END IF;
        END IF;
      END PROCESS regma_mm_proc;
    END GENERATE regma;

  END GENERATE reg;

  ------------------------------------------------------------
  -- Don't register outputs
  ------------------------------------------------------------
  noreg : IF C_REGISTER_OUTPUTS /= 1 GENERATE
    
    match_int          <= match_bf_reg;
    single_match_int   <= single_match_bf_reg;
    multiple_match_int <= multiple_match_bf_reg;
    match_addr_1h_int  <= match_addr_1h_bf_reg;
    match_addr_bin_int <= match_addr_bin_bf_reg;
    match_addr_mm_int  <= match_addr_mm_bf_reg;

  END GENERATE noreg;
  
  ---------------------------------------------------------------
  -- Drive outputs
  ---------------------------------------------------------------
  MATCH          <= match_int;
  SINGLE_MATCH   <= single_match_int;
  MULTIPLE_MATCH <= multiple_match_int;
  MATCH_ADDR_1H  <= match_addr_1h_int;
  MATCH_ADDR_BIN <= match_addr_bin_int;
  MATCH_ADDR_MM  <= match_addr_mm_int;
          
END xilinx;
