--*****************************************************************************
-- (c) Copyright 2009 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
--*****************************************************************************
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: %version
--  \   \         Application: MIG
--  /   /         Filename: cmd_gen.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/05/27 15:50:27 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR
-- Purpose:  This module genreates different type of commands, address,
--          burst_length to mcb_flow_control module.
-- Reference:
-- Revision History:

--*****************************************************************************

LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;


ENTITY cmd_gen IS
   GENERIC (
      FAMILY               : STRING := "SPARTAN6";
      MEM_BURST_LEN        : INTEGER := 8;
      TCQ                  : TIME := 100 ps;
      PORT_MODE            : STRING  := "BI_MODE";
      NUM_DQ_PINS          : INTEGER := 8;
      DATA_PATTERN         : STRING := "DGEN_ALL";
      CMD_PATTERN          : STRING := "CGEN_ALL";
      ADDR_WIDTH           : INTEGER := 30;
      DWIDTH               : INTEGER := 32;
      PIPE_STAGES          : INTEGER := 0;
      MEM_COL_WIDTH        : INTEGER := 10;
      PRBS_EADDR_MASK_POS  : std_logic_vector(31 downto 0)  := X"FFFFD000";
      PRBS_SADDR_MASK_POS  : std_logic_vector(31 downto 0)  := X"00002000";
      PRBS_EADDR           : std_logic_vector(31 downto 0)  := X"00002000";
      PRBS_SADDR           : std_logic_vector(31 downto 0)  := X"00002000"
   );
   PORT (
      clk_i                : IN STD_LOGIC;
      rst_i                : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      run_traffic_i        : IN STD_LOGIC;
      rd_buff_avail_i      : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      force_wrcmd_gen_i    : IN STD_LOGIC;
      start_addr_i         : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      end_addr_i           : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      cmd_seed_i           : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      data_seed_i          : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      load_seed_i          : IN STD_LOGIC;
      addr_mode_i          : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      data_mode_i          : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      instr_mode_i         : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      bl_mode_i            : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      mode_load_i          : IN STD_LOGIC;
      fixed_bl_i           : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      fixed_instr_i        : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      fixed_addr_i         : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      bram_addr_i          : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      bram_instr_i         : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      bram_bl_i            : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      bram_valid_i         : IN STD_LOGIC;
      bram_rdy_o           : OUT STD_LOGIC;
      reading_rd_data_i    : IN STD_LOGIC;
      rdy_i                : IN STD_LOGIC;
      addr_o               : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      instr_o              : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      bl_o                 : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
--      m_addr_o             : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      cmd_o_vld            : OUT STD_LOGIC
   );
END cmd_gen;

ARCHITECTURE trans OF cmd_gen IS
    constant  PRBS_ADDR_WIDTH      : INTEGER := 32;
    constant  INSTR_PRBS_WIDTH     : INTEGER := 16;
    constant  BL_PRBS_WIDTH        : INTEGER := 16;

    constant  BRAM_DATAL_MODE      : std_logic_vector(3 downto 0)  := "0000";
    constant  FIXED_DATA_MODE      : std_logic_vector(3 downto 0)  := "0001";
    constant  ADDR_DATA_MODE       : std_logic_vector(3 downto 0)  := "0010";
    constant  HAMMER_DATA_MODE     : std_logic_vector(3 downto 0)  := "0011";
    constant  NEIGHBOR_DATA_MODE   : std_logic_vector(3 downto 0)  := "0100";
    constant  WALKING1_DATA_MODE   : std_logic_vector(3 downto 0)  := "0101";
    constant  WALKING0_DATA_MODE   : std_logic_vector(3 downto 0)  := "0110";
    constant  PRBS_DATA_MODE       : std_logic_vector(3 downto 0)  := "0111";
COMPONENT pipeline_inserter IS
   GENERIC (
      DATA_WIDTH            : INTEGER := 32;
      PIPE_STAGES           : INTEGER := 1
   );
   PORT (
      data_i                : IN STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
      clk_i                 : IN STD_LOGIC;
      en_i                  : IN STD_LOGIC;

      data_o                : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0)
   );
END COMPONENT;

COMPONENT cmd_prbs_gen IS
   GENERIC (
      TCQ                  : time := 100 ps;
      FAMILY               : STRING := "SPARTAN6";
      ADDR_WIDTH           : INTEGER := 29;
      DWIDTH               : INTEGER := 32;
      PRBS_CMD             : STRING := "ADDRESS";
      PRBS_WIDTH           : INTEGER := 64;
      SEED_WIDTH           : INTEGER := 32;
      PRBS_EADDR_MASK_POS  : std_logic_vector(31 downto 0)  := X"FFFFD000";
      PRBS_SADDR_MASK_POS  : std_logic_vector(31 downto 0)  := X"00002000";
      PRBS_EADDR           : std_logic_vector(31 downto 0)  := X"00002000";
      PRBS_SADDR           : std_logic_vector(31 downto 0)  := X"00002000"
   );
   PORT (

      clk_i                : IN STD_LOGIC;
      prbs_seed_init       : IN STD_LOGIC;
      clk_en               : IN STD_LOGIC;
      prbs_seed_i          : IN STD_LOGIC_VECTOR(SEED_WIDTH - 1 DOWNTO 0);

      prbs_o               : OUT STD_LOGIC_VECTOR(SEED_WIDTH - 1 DOWNTO 0)
   );
END COMPONENT;

function BOOLEAN_TO_STD_LOGIC(A : in BOOLEAN) return std_logic is
begin
   if A = true then
       return '1';
   else
       return '0';
   end if;
end function BOOLEAN_TO_STD_LOGIC;

   SIGNAL INC_COUNTS                    : STD_LOGIC_VECTOR(10 DOWNTO 0);
   SIGNAL addr_mode_reg                 : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL bl_mode_reg                   : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL addr_counts                   : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL prbs_bl                       : STD_LOGIC_VECTOR(14 DOWNTO 0);
   SIGNAL instr_out                     : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL prbs_instr_a                  : STD_LOGIC_VECTOR(14 DOWNTO 0);
   SIGNAL prbs_instr_b                  : STD_LOGIC_VECTOR(14 DOWNTO 0);
   SIGNAL prbs_brlen                    : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL prbs_addr                     : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL seq_addr                      : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL fixed_addr                    : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL addr_out                      : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL bl_out                        : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL bl_out_reg                    : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL mode_load_d1                  : STD_LOGIC;
   SIGNAL mode_load_d2                  : STD_LOGIC;
   SIGNAL mode_load_pulse               : STD_LOGIC;
   SIGNAL pipe_data_o                   : STD_LOGIC_VECTOR(41 DOWNTO 0);
   SIGNAL cmd_clk_en                    : STD_LOGIC;
   SIGNAL pipe_out_vld                  : STD_LOGIC;
   SIGNAL end_addr_range                : STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL force_bl1                     : STD_LOGIC;
   SIGNAL A0_G_E0                       : STD_LOGIC;
   SIGNAL A1_G_E1                       : STD_LOGIC;
   SIGNAL A2_G_E2                       : STD_LOGIC;
   SIGNAL A3_G_E3                       : STD_LOGIC;
   SIGNAL AC3_G_E3                      : STD_LOGIC;
   SIGNAL AC2_G_E2                      : STD_LOGIC;
   SIGNAL AC1_G_E1                      : STD_LOGIC;
   SIGNAL bl_out_clk_en                 : STD_LOGIC;
   SIGNAL pipe_data_in                  : STD_LOGIC_VECTOR(41 DOWNTO 0);
   SIGNAL instr_vld                     : STD_LOGIC;
   SIGNAL bl_out_vld                    : STD_LOGIC;
   SIGNAL cmd_vld                       : STD_LOGIC;
   SIGNAL run_traffic_r                 : STD_LOGIC;
   SIGNAL run_traffic_pulse             : STD_LOGIC;

   SIGNAL pipe_data_in_vld              : STD_LOGIC;
   SIGNAL gen_addr_larger               : STD_LOGIC;
   SIGNAL buf_avail_r                   : STD_LOGIC_VECTOR(6 DOWNTO 0);
   SIGNAL rd_data_received_counts       : STD_LOGIC_VECTOR(6 DOWNTO 0);
   SIGNAL rd_data_counts_asked          : STD_LOGIC_VECTOR(6 DOWNTO 0);
   SIGNAL rd_data_received_counts_total : STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL instr_vld_dly1                : STD_LOGIC;
   SIGNAL first_load_pulse              : STD_LOGIC;
   SIGNAL mem_init_done                 : STD_LOGIC;
   SIGNAL i                             : INTEGER;
   SIGNAL force_wrcmd_gen               : STD_LOGIC;
   SIGNAL force_smallvalue              : STD_LOGIC;

   SIGNAL end_addr_r                    : STD_LOGIC_VECTOR(31 DOWNTO 0);

   SIGNAL force_rd_counts               : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL force_rd                      : STD_LOGIC;
   SIGNAL addr_counts_next_r            : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL refresh_cmd_en                : STD_LOGIC;
   SIGNAL refresh_timer                 : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL refresh_prbs                  : STD_LOGIC;
   SIGNAL cmd_clk_en_r                  : STD_LOGIC;

   signal instr_mode_reg                : std_logic_vector(3 downto 0);


   -- X-HDL generated signals

   SIGNAL xhdl4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL xhdl12 : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL xhdl14 : STD_LOGIC_VECTOR(5 DOWNTO 0);

   -- Declare intermediate signals for referenced outputs
   SIGNAL bl_o_xhdl0                    : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL mode_load_pulse_r1            : STD_LOGIC;

BEGIN
   -- Drive referenced outputs
   bl_o       <= bl_o_xhdl0;
   addr_o     <= pipe_data_o(31 DOWNTO 0);
   instr_o    <= pipe_data_o(34 DOWNTO 32);
   bl_o_xhdl0 <= pipe_data_o(40 DOWNTO 35);
   cmd_o_vld  <= pipe_data_o(41) AND run_traffic_r;
   pipe_out_vld <= pipe_data_o(41) AND run_traffic_r;
   pipe_data_o <= pipe_data_in;


   cv1 : IF (CMD_PATTERN = "CGEN_BRAM") GENERATE
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
           cmd_vld <= cmd_clk_en;
      END IF;
   END PROCESS;
   END GENERATE;

   cv3 : IF (CMD_PATTERN = "CGEN_PRBS"  OR CMD_PATTERN = "CGEN_ALL" OR CMD_PATTERN = "CGEN_SEQUENTIAL" OR CMD_PATTERN = "CGEN_FIXED") GENERATE
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
           cmd_vld <= cmd_clk_en OR (mode_load_pulse AND first_load_pulse);
      END IF;
   END PROCESS;
   END GENERATE;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
            run_traffic_r <=  run_traffic_i ;
          IF (  run_traffic_i= '1' AND   run_traffic_r = '0' ) THEN
               run_traffic_pulse <= '1'  ;
          ELSE
               run_traffic_pulse <= '0' ;
          END IF;
      END IF;
   END PROCESS;


   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         instr_vld <= cmd_clk_en OR (mode_load_pulse AND first_load_pulse) ;
         bl_out_clk_en <= cmd_clk_en OR (mode_load_pulse AND first_load_pulse) ;
         bl_out_vld <= bl_out_clk_en ;
         pipe_data_in_vld <= instr_vld ;
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_i(0) = '1') THEN
            first_load_pulse <= '1' ;
         ELSIF (mode_load_pulse = '1') THEN
            first_load_pulse <= '0' ;
         ELSE
            first_load_pulse <= first_load_pulse ;
         END IF;
      END IF;
   END PROCESS;
   

   cmd_clk_en <= (rdy_i AND pipe_out_vld AND run_traffic_i)  OR (mode_load_pulse AND BOOLEAN_TO_STD_LOGIC(CMD_PATTERN = "CGEN_BRAM"));

   pipe_in_s6 : IF (FAMILY = "SPARTAN6") GENERATE
      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            IF ((rst_i(0)) = '1') THEN
               pipe_data_in(31 DOWNTO 0) <= start_addr_i ;
            ELSIF (instr_vld = '1') THEN
               IF (gen_addr_larger = '1' AND (addr_mode_reg = "100" OR addr_mode_reg = "010")) THEN

                 IF (DWIDTH = 32) THEN
                   pipe_data_in(31 DOWNTO 0) <= (end_addr_i(31 DOWNTO 8) & "00000000") ;
                 ELSIF (DWIDTH = 64) THEN
                   pipe_data_in(31 DOWNTO 0) <= (end_addr_i(31 DOWNTO 9) & "000000000") ;
                 ELSE
                   pipe_data_in(31 DOWNTO 0) <= (end_addr_i(31 DOWNTO 10) & "0000000000") ;
                 END IF;

               ELSE
                  IF (DWIDTH = 32) THEN
                     pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 2) & "00") ;
                  ELSIF (DWIDTH = 64) THEN
                     pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 3) & "000") ;
                  ELSIF (DWIDTH = 128) THEN
                     pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 4) & "0000") ;
                  END IF;
               END IF;
            END IF;
         END IF;
      END PROCESS;

   END GENERATE;
   pipe_in_v6 : IF (FAMILY = "VIRTEX6") GENERATE
      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            IF ((rst_i(1)) = '1') THEN
               pipe_data_in(31 DOWNTO 0) <= start_addr_i ;
            ELSIF (instr_vld = '1') THEN
               IF (gen_addr_larger = '1' AND (addr_mode_reg = "100" OR addr_mode_reg = "010")) THEN
                  pipe_data_in(31 DOWNTO 0) <= (end_addr_i(31 DOWNTO 8) & "00000000") ;

               ELSIF ((NUM_DQ_PINS >= 128) AND (NUM_DQ_PINS <= 144)) THEN
                  IF (MEM_BURST_LEN = 8) THEN
                       pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 7) & "0000000") ;
                  ELSE
                       pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 6) & "000000") ;
                  END IF;

               ELSIF ((NUM_DQ_PINS >= 64) AND (NUM_DQ_PINS < 128)) THEN

                  IF (MEM_BURST_LEN = 8) THEN
                       pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 6) & "000000") ;
                  ELSE
                       pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 5) & "00000") ;
                  END IF;

               ELSIF ((NUM_DQ_PINS = 32) OR (NUM_DQ_PINS = 40) OR (NUM_DQ_PINS = 48) OR (NUM_DQ_PINS = 56)) THEN
                  IF (MEM_BURST_LEN = 8) THEN
                       pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 5) & "00000") ;
                  ELSE
                       pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 4) & "0000") ;
                  END IF;

               ELSIF ((NUM_DQ_PINS = 16) OR (NUM_DQ_PINS = 24)) THEN
                  pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 3) & "000");
                  IF (MEM_BURST_LEN = 8) THEN
                       pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 4) & "0000") ;
                  ELSE
                       pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 3) & "000") ;
                  END IF;
               ELSIF (NUM_DQ_PINS = 8)  THEN
                  IF (MEM_BURST_LEN = 8) THEN
                       pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 3) & "000") ;
                  ELSE
                       pipe_data_in(31 DOWNTO 0) <= (addr_out(31 DOWNTO 2) & "00") ;
                  END IF;


               END IF;
            END IF;
         END IF;
      END PROCESS;

   END GENERATE;
--   pipe_m_addr_o : IF (FAMILY = "VIRTEX6") GENERATE
--      PROCESS (clk_i)
--      BEGIN
--         IF (clk_i'EVENT AND clk_i = '1') THEN
--            IF ((rst_i(1)) = '1') THEN
--               m_addr_o(31 DOWNTO 0) <= start_addr_i ;
--            ELSIF (instr_vld = '1') THEN
--               IF (gen_addr_larger = '1' AND (addr_mode_reg = "100" OR addr_mode_reg = "010")) THEN
--                  m_addr_o(31 DOWNTO 0) <= (end_addr_i(31 DOWNTO 8) & "00000000") ;
--
--               ELSIF ((NUM_DQ_PINS >= 128) AND (NUM_DQ_PINS < 256)) THEN
--                  m_addr_o <= (addr_out(31 DOWNTO 6) & "000000") ;
--
--               ELSIF ((NUM_DQ_PINS >= 64) AND (NUM_DQ_PINS < 128)) THEN
--                  m_addr_o <= (addr_out(31 DOWNTO 5) & "00000") ;
--               ELSIF ((NUM_DQ_PINS = 32) OR (NUM_DQ_PINS = 40) OR (NUM_DQ_PINS = 48) OR (NUM_DQ_PINS = 56)) THEN
--                  m_addr_o(31 DOWNTO 0) <= (addr_out(31 DOWNTO 4) & "0000") ;
--               ELSIF ((NUM_DQ_PINS = 16) OR (NUM_DQ_PINS = 17)) THEN
--                  m_addr_o(31 DOWNTO 0) <= (addr_out(31 DOWNTO 3) & "000") ;
--               ELSIF ((NUM_DQ_PINS = 8) OR (NUM_DQ_PINS = 9)) THEN
--                  m_addr_o(31 DOWNTO 0) <= (addr_out(31 DOWNTO 2) & "00") ;
--               END IF;
--            END IF;
--         END IF;
--      END PROCESS;
--
--   END GENERATE;
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_i(0) = '1') THEN
            force_wrcmd_gen <= '0' ;
         ELSIF (buf_avail_r = "0111111") THEN
            force_wrcmd_gen <= '0' ;
         ELSIF (instr_vld_dly1 = '1' AND pipe_data_in(32) = '1' AND pipe_data_in(41 DOWNTO 35) > "0010000") THEN
            force_wrcmd_gen <= '1' ;
         END IF;
      END IF;
   END PROCESS;


   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         instr_mode_reg <= instr_mode_i ;

      END IF;
   END PROCESS;
            -- **********************************************

   PROCESS (clk_i) BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(2)) = '1') THEN
            pipe_data_in(40 DOWNTO 32) <= "000000000";
            force_smallvalue <= '0';
         ELSIF (instr_vld = '1') THEN

            IF (instr_mode_reg = 0) THEN
               pipe_data_in(34 DOWNTO 32) <= instr_out ;

            ELSIF (instr_out(2) = '1') THEN

               pipe_data_in(34 DOWNTO 32) <= "100" ;


            ELSIF (FAMILY = "SPARTAN6" AND PORT_MODE = "RD_MODE") THEN

               pipe_data_in(34 DOWNTO 32) <= instr_out(2 downto 1) & '1' ;

            ELSIF ((force_wrcmd_gen = '1' OR buf_avail_r <= "0001111") AND FAMILY = "SPARTAN6" AND PORT_MODE /= "RD_MODE") THEN
                  pipe_data_in(34 DOWNTO 32) <= instr_out(2) & "00";
            ELSE
                  pipe_data_in(34 DOWNTO 32) <= instr_out;

            END IF;
   ----********* condition the generated bl value except if TG is programmed for BRAM interface'
   ---- if the generated address is close to end address range, the bl_out will be altered to 1.
     --
           IF (bl_mode_i = 0) THEN
               pipe_data_in(40 DOWNTO 35) <= bl_out ;
         ELSIF ( FAMILY = "VIRTEX6") THEN
             pipe_data_in(40 DOWNTO 35)  <=  bl_out ;
         ELSIF (force_bl1 = '1' AND (bl_mode_reg = "10") AND FAMILY = "SPARTAN6") THEN

            pipe_data_in(40 DOWNTO 35) <= "000001"  ;


         -- **********************************************

      ELSIF (buf_avail_r(5 DOWNTO 0) >= "111100" AND buf_avail_r(6) = '0' AND pipe_data_in(32) = '1' AND FAMILY = "SPARTAN6") THEN
         IF (bl_mode_reg = "10") THEN
             force_smallvalue <= NOT(force_smallvalue) ;
          END IF;
          IF (buf_avail_r(6) = '1' AND bl_mode_reg = "10") THEN
             pipe_data_in(40 DOWNTO 35) <= ("00" & bl_out(3 DOWNTO 1) & '1') ;
          ELSE
             pipe_data_in(40 DOWNTO 35) <= bl_out ;
          END IF;
      ELSIF (buf_avail_r < "1000000" AND rd_buff_avail_i >= "0000000" AND instr_out(0) = '1' AND (bl_mode_reg = "10")) THEN
         IF (FAMILY = "SPARTAN6") THEN
           pipe_data_in(40 DOWNTO 35) <= ("00" & bl_out(3 DOWNTO 0)) + '1' ;
        ELSE
           pipe_data_in(40 DOWNTO 35) <= bl_out ;
         END IF;
         END IF; --IF (bl_mode_i = 0) THEN
       END IF;  --IF ((rst_i(2)) = '1') THEN
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(2)) = '1') THEN
            pipe_data_in(41) <= '0' ;
         ELSIF (cmd_vld = '1') THEN
            pipe_data_in(41) <= instr_vld ;
         ELSIF ((rdy_i AND pipe_out_vld) = '1') THEN
            pipe_data_in(41) <= '0' ;
         END IF;
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         instr_vld_dly1 <= instr_vld;
      END IF;
   END PROCESS;



 PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_i(0) = '1') THEN
            rd_data_counts_asked <= (others => '0') ;
         ELSIF (instr_vld_dly1 = '1' AND pipe_data_in(32) = '1') THEN
            IF (pipe_data_in(40 DOWNTO 35) = "000000") THEN
               rd_data_counts_asked <= rd_data_counts_asked + 64 ;

            ELSE
               rd_data_counts_asked <= rd_data_counts_asked + ('0' & (pipe_data_in(40 DOWNTO 35)));

            END IF;
         END IF;
      END IF;
   END PROCESS;


   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF  (rst_i(0) = '1') THEN
            rd_data_received_counts <= (others => '0');
            rd_data_received_counts_total <= (others => '0');
         ELSIF (reading_rd_data_i = '1') THEN
            rd_data_received_counts <= rd_data_received_counts + '1';
            rd_data_received_counts_total <= rd_data_received_counts_total + "0000000000000001";
         END IF;
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         buf_avail_r <= (rd_data_received_counts + 64) - rd_data_counts_asked;
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(3)) = '1') THEN
           IF (CMD_PATTERN = "CGEN_BRAM") THEN
             addr_mode_reg <= "000";
           ELSE
             addr_mode_reg <= "011";
           END IF;
         ELSIF (mode_load_pulse = '1') THEN
            addr_mode_reg <= addr_mode_i;
         END IF;
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (mode_load_pulse = '1') THEN
            bl_mode_reg <= bl_mode_i;
         END IF;
         mode_load_d1 <= mode_load_i;
         mode_load_d2 <= mode_load_d1;
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         mode_load_pulse <= mode_load_d1 AND NOT(mode_load_d2);
      END IF;
   END PROCESS;

   xhdl4 <= addr_mode_reg;
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(3)) = '1') THEN
            addr_out <= start_addr_i;
         ELSE
            CASE xhdl4 IS
               WHEN "000" =>
                  addr_out <= bram_addr_i;
               WHEN "001" =>
                  addr_out <= fixed_addr;
               WHEN "010" =>
                  addr_out <= prbs_addr;
               WHEN "011" =>
                  addr_out <= ("00" & seq_addr(29 DOWNTO 0));
               WHEN "100" =>
--                  addr_out <= (prbs_addr(31 DOWNTO 6) & "000000");
                  addr_out <= ("000" & seq_addr(6 DOWNTO 2) & seq_addr(23 DOWNTO 0));--(prbs_addr(31 DOWNTO 6) & "000000");
               WHEN "101" =>
                  addr_out <= (prbs_addr(31 DOWNTO 20) & seq_addr(19 DOWNTO 0));
  --                addr_out <= (prbs_addr(31 DOWNTO MEM_COL_WIDTH) & seq_addr(MEM_COL_WIDTH - 1 DOWNTO 0));
               WHEN OTHERS =>
                  addr_out <= (others => '0');--"00000000000000000000000000000000";
            END CASE;
         END IF;
      END IF;
   END PROCESS;

   xhdl5 : IF (CMD_PATTERN = "CGEN_PRBS" OR CMD_PATTERN = "CGEN_ALL") GENERATE


      addr_prbs_gen : cmd_prbs_gen
         GENERIC MAP (
            family               => FAMILY,
            addr_width           => 32,
            dwidth               => DWIDTH,
            prbs_width           => 32,
            seed_width           => 32,
            prbs_eaddr_mask_pos  => PRBS_EADDR_MASK_POS,
            prbs_saddr_mask_pos  => PRBS_SADDR_MASK_POS,
            prbs_eaddr           => PRBS_EADDR,
            prbs_saddr           => PRBS_SADDR
         )
         PORT MAP (
            clk_i           => clk_i,
            clk_en          => cmd_clk_en,
            prbs_seed_init  => mode_load_pulse,
            prbs_seed_i     => cmd_seed_i(31 DOWNTO 0),
            prbs_o          => prbs_addr
         );
   END GENERATE;
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (addr_out(31 DOWNTO 8) >= end_addr_i(31 DOWNTO 8)) THEN
            gen_addr_larger <= '1';
         ELSE
            gen_addr_larger <= '0';
         END IF;
      END IF;
   END PROCESS;

   xhdl6 : IF (FAMILY = "SPARTAN6") GENERATE
      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            IF (mem_init_done = '1') THEN
               INC_COUNTS <= std_logic_vector(to_unsigned((DWIDTH/8 * to_integer(unsigned(bl_out_reg))),11));
            ELSE
               IF (fixed_bl_i = "000000") THEN
                  INC_COUNTS <= std_logic_vector(to_unsigned((DWIDTH/8)*(64), 11));
               ELSE
                  INC_COUNTS <= std_logic_vector(to_unsigned((DWIDTH/8 * to_integer(unsigned(fixed_bl_i))),11));
               END IF;
            END IF;
         END IF;
      END PROCESS;

   END GENERATE;
   xhdl7 : IF (FAMILY = "VIRTEX6") GENERATE
      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            IF (NUM_DQ_PINS >= 128 AND NUM_DQ_PINS <= 144) THEN
                   INC_COUNTS <= std_logic_vector(to_unsigned(64 * (MEM_BURST_LEN/4), 11));
         
            ELSIF (NUM_DQ_PINS >= 64 AND NUM_DQ_PINS < 128) THEN
                   INC_COUNTS <= std_logic_vector(to_unsigned(32 * (MEM_BURST_LEN/4), 11));
            ELSIF (NUM_DQ_PINS >= 32 AND NUM_DQ_PINS < 64) THEN
                   INC_COUNTS <= std_logic_vector(to_unsigned(16 * (MEM_BURST_LEN/4), 11));
            ELSIF (NUM_DQ_PINS = 16 OR NUM_DQ_PINS = 24) THEN
                   INC_COUNTS <= std_logic_vector(to_unsigned(8 * (MEM_BURST_LEN/4), 11));
            ELSIF (NUM_DQ_PINS = 8 OR NUM_DQ_PINS = 9) THEN
                   INC_COUNTS <= std_logic_vector(to_unsigned(4 * (MEM_BURST_LEN/4), 11));
            END IF;
         END IF;
      END PROCESS;

   END GENERATE;
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
            end_addr_r <= end_addr_i - std_logic_vector(to_unsigned(DWIDTH/8*to_integer(unsigned(fixed_bl_i)),32)) + "00000000000000000000000000000001";
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (addr_out(31 DOWNTO 24) >= end_addr_r(31 DOWNTO 24)) THEN
            AC3_G_E3 <= '1';
         ELSE
            AC3_G_E3 <= '0';
         END IF;
         IF (addr_out(23 DOWNTO 16) >= end_addr_r(23 DOWNTO 16)) THEN
            AC2_G_E2 <= '1';
         ELSE
            AC2_G_E2 <= '0';
         END IF;
         IF (addr_out(15 DOWNTO 8) >= end_addr_r(15 DOWNTO 8)) THEN
            AC1_G_E1 <= '1';
         ELSE
            AC1_G_E1 <= '0';
         END IF;
      END IF;
   END PROCESS;

--   xhdl8 : IF (CMD_PATTERN = "CGEN_SEQUENTIAL" OR CMD_PATTERN = "CGEN_ALL") GENERATE
      seq_addr <= addr_counts;
      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            mode_load_pulse_r1 <= mode_load_pulse;
         END IF;
      END PROCESS;

      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
               end_addr_range <= end_addr_i(15 DOWNTO 0) - std_logic_vector(to_unsigned((DWIDTH/8 * to_integer(unsigned(bl_out_reg))),16)) + "0000000000000001";
         END IF;
      END PROCESS;

      PROCESS (clk_i)
      BEGIN
        IF (clk_i'EVENT AND clk_i = '1') THEN
              addr_counts_next_r <=   addr_counts + (INC_COUNTS);

        END IF;
      END PROCESS;

      PROCESS (clk_i)
      BEGIN
        IF (clk_i'EVENT AND clk_i = '1') THEN
              cmd_clk_en_r <= cmd_clk_en;
        END IF;
      END PROCESS;


      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            IF ((rst_i(4)) = '1') THEN
               addr_counts <= start_addr_i;
               mem_init_done <= '0';
            ELSIF ((cmd_clk_en_r OR mode_load_pulse_r1) = '1') THEN
--               IF ((DWIDTH = 32 AND AC3_G_E3 = '1' AND AC2_G_E2 = '1' AND AC1_G_E1 = '1' AND (addr_counts(7 DOWNTO 0) >= end_addr_r(7 DOWNTO 0))) OR (DWIDTH = 64 AND AC3_G_E3 = '1' AND AC2_G_E2 = '1' AND AC1_G_E1 = '1' AND (addr_counts(7 DOWNTO 0) >= end_addr_r(7 DOWNTO 0))) OR ((DWIDTH = 128 AND AC3_G_E3 = '1' AND AC2_G_E2 = '1' AND AC1_G_E1 = '1' AND FAMILY = "SPARTAN6") OR (DWIDTH = 128 AND AC3_G_E3 = '1' AND AC2_G_E2 = '1' AND AC1_G_E1 = '1' AND (addr_counts(7 DOWNTO 0) >= end_addr_r(7 DOWNTO 0)) AND FAMILY = "VIRTEX6") OR (DWIDTH >= 256 AND AC3_G_E3 = '1' AND AC2_G_E2 = '1' AND AC1_G_E1 = '1' AND (addr_counts(7 DOWNTO 0) >= end_addr_r(7 DOWNTO 0)) AND FAMILY = "VIRTEX6"))) THEN
            IF (addr_counts_next_r >= end_addr_i) THEN
                  addr_counts <= start_addr_i;
                  mem_init_done <= '1';
               ELSIF (addr_counts < end_addr_r) THEN
                  addr_counts <= addr_counts + INC_COUNTS;
               END IF;
            END IF;
         END IF;
      END PROCESS;

   --END GENERATE;
   
   xhdl9 : IF (CMD_PATTERN = "CGEN_FIXED" OR CMD_PATTERN = "CGEN_ALL") GENERATE
      fixed_addr <= (fixed_addr_i(31 DOWNTO 2) & "00") WHEN (DWIDTH = 32) ELSE
                    (fixed_addr_i(31 DOWNTO 3) & "000") WHEN (DWIDTH = 64) ELSE
                    (fixed_addr_i(31 DOWNTO 4) & "0000") WHEN (DWIDTH = 128) ELSE
                    (fixed_addr_i(31 DOWNTO 5) & "00000") WHEN (DWIDTH = 256) ELSE
                    (fixed_addr_i(31 DOWNTO 6) & "000000");
   END GENERATE;
   xhdl10 : IF (CMD_PATTERN = "CGEN_BRAM" OR CMD_PATTERN = "CGEN_ALL") GENERATE
      bram_rdy_o <= (run_traffic_i AND cmd_clk_en AND bram_valid_i) OR (mode_load_pulse);
   END GENERATE;
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(4)) = '1') THEN
            force_rd_counts <= (others => '0');--"0000000000";
         ELSIF (instr_vld = '1') THEN
            force_rd_counts <= force_rd_counts + "0000000001";
         END IF;
      END IF;
   END PROCESS;


   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(4)) = '1') THEN
            force_rd <= '0';
         ELSIF ((force_rd_counts(3)) = '1') THEN
            force_rd <= '1';
         ELSE
            force_rd <= '0';
         END IF;
      END IF;
   END PROCESS;



-- adding refresh timer to limit the amount of issuing refresh command.
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(4)) = '1') THEN
            refresh_timer <= (others => '0');
         ELSE
            refresh_timer <= refresh_timer + 1;
         END IF;
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(4)) = '1') THEN
            refresh_cmd_en <= '0';
         ELSIF (refresh_timer = "1111111111") THEN
            refresh_cmd_en <= '1';
         ELSIF ((cmd_clk_en and refresh_cmd_en) = '1') THEN
            refresh_cmd_en <= '0';
         END IF;
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (FAMILY = "SPARTAN6") THEN
            refresh_prbs <= prbs_instr_b(3) and refresh_cmd_en;
         ELSE
            refresh_prbs <= '0';
         END IF;
      END IF;
   END PROCESS;

  --synthesis translate_off
   PROCESS (instr_mode_i)
   BEGIN
     IF ((instr_mode_i  > "0010") and (FAMILY = "VIRTEX6")) THEN
       report "Error ! Not valid instruction mode";
     END IF;
   END PROCESS;
  --synthesis translate_on

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         CASE instr_mode_i IS
            WHEN "0000" =>
               instr_out <= bram_instr_i;
            WHEN "0001" =>
               instr_out <= fixed_instr_i;
            WHEN "0010" =>
               instr_out <= ("00" & (prbs_instr_a(0) OR force_rd));
            WHEN "0011" =>
               instr_out <= ("00" & prbs_instr_a(0));
            WHEN "0100" =>
               instr_out <= ('0' & prbs_instr_b(0) & prbs_instr_a(0));

            WHEN "0101" =>
               instr_out <= (refresh_prbs & prbs_instr_b(0) & prbs_instr_a(0));
            WHEN OTHERS =>
               instr_out <= ("00" & prbs_instr_a(0));
         END CASE;
      END IF;
   END PROCESS;


   xhdl11 : IF (CMD_PATTERN = "CGEN_PRBS" OR CMD_PATTERN = "CGEN_ALL") GENERATE




      instr_prbs_gen_a : cmd_prbs_gen
         GENERIC MAP (
            prbs_cmd    => "INSTR",
            family      => FAMILY,
            addr_width  => 32,
            seed_width  => 15,
            prbs_width  => 20
         )
         PORT MAP (
            clk_i           => clk_i,
            clk_en          => cmd_clk_en,
            prbs_seed_init  => load_seed_i,
            prbs_seed_i     => cmd_seed_i(14 DOWNTO 0),
            prbs_o          => prbs_instr_a
         );



      instr_prbs_gen_b : cmd_prbs_gen
         GENERIC MAP (
            prbs_cmd    => "INSTR",
            family      => FAMILY,
            seed_width  => 15,
            prbs_width  => 20
         )
         PORT MAP (
            clk_i           => clk_i,
            clk_en          => cmd_clk_en,
            prbs_seed_init  => load_seed_i,
            prbs_seed_i     => cmd_seed_i(16 DOWNTO 2),
            prbs_o          => prbs_instr_b
         );

   END GENERATE;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (addr_out(31 DOWNTO 24) >= end_addr_i(31 DOWNTO 24)) THEN
            A3_G_E3 <= '1' ;
         ELSE

            A3_G_E3 <= '0' ;
         END IF;
         IF (addr_out(23 DOWNTO 16) >= end_addr_i(23 DOWNTO 16)) THEN
            A2_G_E2 <= '1' ;
         ELSE

            A2_G_E2 <= '0' ;
         END IF;
         IF (addr_out(15 DOWNTO 8) >= end_addr_i(15 DOWNTO 8)) THEN
            A1_G_E1 <= '1' ;
         ELSE

            A1_G_E1 <= '0' ;
                 END IF;
         IF (addr_out(7 DOWNTO 0) > (end_addr_i(7 DOWNTO 0) - std_logic_vector(to_unsigned((DWIDTH/8)*to_integer(unsigned(bl_out) ),32)) + '1')  ) THEN      -- OK





            A0_G_E0 <= '1' ;
         ELSE

            A0_G_E0 <= '0' ;
         END IF;
      END IF;
   END PROCESS;

--testout <= std_logic_vector(to_unsigned((DWIDTH/8)*to_integer(unsigned(bl_out) ),testout'length)) + '1';

   PROCESS (addr_out,buf_avail_r, bl_out, end_addr_i, rst_i)
   BEGIN
      IF ((rst_i(5)) = '1') THEN
         force_bl1 <= '0';


      ELSIF (addr_out + std_logic_vector(to_unsigned((DWIDTH/8)*to_integer(unsigned(bl_out) ),32)) >= end_addr_i)  OR
            (buf_avail_r <= 50 and PORT_MODE = "RD_MODE") THEN
         force_bl1 <= '1' ;
      ELSE
         force_bl1 <= '0' ;
      END IF;
   END PROCESS;


   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i(6)) = '1') THEN
            bl_out_reg <= fixed_bl_i;
         ELSIF (bl_out_vld = '1') THEN

            bl_out_reg <= bl_out;
         END IF;
      END IF;
   END PROCESS;

   xhdl12 <= bl_mode_reg;
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (mode_load_pulse = '1') THEN
            bl_out <= fixed_bl_i;
         ELSIF (cmd_clk_en = '1') THEN
            CASE xhdl12 IS
               WHEN "00" =>
                  bl_out <= bram_bl_i;
               WHEN "01" =>
                  bl_out <= fixed_bl_i;
               WHEN "10" =>
                  bl_out <= prbs_brlen;
               WHEN OTHERS =>
                  bl_out <= "000001";
            END CASE;
         END IF;
      END IF;
   END PROCESS;

  --synthesis translate_off
   PROCESS (bl_out)
   BEGIN
      IF (bl_out > "000010" AND FAMILY = "VIRTEX6") THEN
         report "Error ! Not valid burst length"; --severity ERROR;
      END IF;
   END PROCESS;
  --synthesis translate_on

   xhdl13 : IF (CMD_PATTERN = "CGEN_PRBS" OR CMD_PATTERN = "CGEN_ALL") GENERATE




      bl_prbs_gen : cmd_prbs_gen
         GENERIC MAP (
            TCQ         => TCQ,
            family      => FAMILY,
            prbs_cmd    => "BLEN",
            addr_width  => 32,
            seed_width  => 15,
            prbs_width  => 20
         )
         PORT MAP (
            clk_i           => clk_i,
            clk_en          => cmd_clk_en,

            prbs_seed_init  => load_seed_i,
            prbs_seed_i     => cmd_seed_i(16 DOWNTO 2),
            prbs_o          => prbs_bl
         );

   END GENERATE;
--   xhdl14 <= "000001" WHEN (prbs_bl(5 DOWNTO 0) = "000000") ELSE prbs_bl(5 DOWNTO 0);
   PROCESS (prbs_bl) BEGIN
      IF (FAMILY = "SPARTAN6") THEN
         if (prbs_bl(5 DOWNTO 0) = "000000") then
--         prbs_brlen <= xhdl14;
           prbs_brlen <= "000001";
         else
           prbs_brlen <= prbs_bl(5 DOWNTO 0);
         end if;
      ELSE
         prbs_brlen <= "000010";
      END IF;
   END PROCESS;
   
   

END trans;


