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
--  /   /         Filename: init_mem_pattern_ctr.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/06/02 07:16:39 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR 
-- Purpose: This moduel has a small FSM to control the operation of 
--         mcb_traffic_gen module.It first fill up the memory with a selected 
--         DATA pattern and then starts the memory testing state.
-- Reference:
-- Revision History:  1.1 Modify to allow data_mode_o to be controlled by parameter DATA_MODE
--                      and the fixed_bl_o is fixed at 64 if data_mode_o == PRBS and FAMILY == "SPARTAN6"
--                      The fixed_bl_o in Virtex6 is determined by the MEM_BURST_LENGTH.
--                    1.2  05/19/2010 If MEM_BURST_LEN value is passed with value of zero, it is treated as
--                                    "OTF" Burst Mode and TG will only generate BL 8 traffic.

--*****************************************************************************

LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;


ENTITY init_mem_pattern_ctr IS
   GENERIC (
      FAMILY                         : STRING := "SPARTAN6";
      TST_MEM_INSTR_MODE             : STRING := "R_W_INSTR_MODE";
      MEM_BURST_LEN                  : INTEGER := 8;
      CMD_PATTERN                    : STRING := "CGEN_ALL";
      BEGIN_ADDRESS                  : std_logic_vector(31 downto 0) := X"00000000";
      END_ADDRESS                    : std_logic_vector(31 downto 0) := X"00000fff";
      ADDR_WIDTH                     : INTEGER := 30;
      DWIDTH                         : INTEGER := 32;
      CMD_SEED_VALUE                 : std_logic_vector(31 downto 0) := X"12345678";
      DATA_SEED_VALUE                : std_logic_vector(31 downto 0) := X"ca345675";
      DATA_MODE                      : std_logic_vector(3 downto 0) := "0010";
      PORT_MODE                      : STRING := "BI_MODE";
      EYE_TEST                       : STRING := "FALSE"
      
   );
   PORT (
      clk_i                          : IN STD_LOGIC;
      rst_i                          : IN STD_LOGIC;
      mcb_cmd_bl_i                   : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      mcb_cmd_en_i                   : IN STD_LOGIC;
      mcb_cmd_instr_i                : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      mcb_wr_en_i                    : IN STD_LOGIC;
      vio_modify_enable              : IN STD_LOGIC;
      vio_data_mode_value            : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      vio_addr_mode_value            : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      vio_bl_mode_value              : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      vio_fixed_bl_value             : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      mcb_init_done_i                : IN STD_LOGIC;
      cmp_error                      : IN STD_LOGIC;
      run_traffic_o                  : OUT STD_LOGIC;
      start_addr_o                   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      end_addr_o                     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      cmd_seed_o                     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      data_seed_o                    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      load_seed_o                    : OUT STD_LOGIC;
      addr_mode_o                    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      instr_mode_o                   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      bl_mode_o                      : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      data_mode_o                    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      mode_load_o                    : OUT STD_LOGIC;
      fixed_bl_o                     : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      fixed_instr_o                  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      fixed_addr_o                   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
   );
END init_mem_pattern_ctr;

ARCHITECTURE trans OF init_mem_pattern_ctr IS

      constant IDLE                           : std_logic_vector(4 downto 0)  := "00001";
      constant INIT_MEM_WRITE                 : std_logic_vector(4 downto 0)  := "00010";
      constant INIT_MEM_READ                  : std_logic_vector(4 downto 0)  := "00100";
      constant TEST_MEM                       : std_logic_vector(4 downto 0)  := "01000";
      constant CMP_ERROR1                     : std_logic_vector(4 downto 0)  := "10000";

      constant BRAM_ADDR                      : std_logic_vector(1 downto 0)  := "00";
      constant FIXED_ADDR                     : std_logic_vector(2 downto 0)  := "001";
      constant PRBS_ADDR                      : std_logic_vector(2 downto 0)  := "010";
      constant SEQUENTIAL_ADDR                : std_logic_vector(2 downto 0)  := "011";

      constant BRAM_INSTR_MODE                : std_logic_vector(3 downto 0)  := "0000";
      constant FIXED_INSTR_MODE               : std_logic_vector(3 downto 0)  := "0001";
      constant FIXED_INSTR_MODE_WITH_REFRESH  : std_logic_vector(3 downto 0)  := "0110";

      constant R_W_INSTR_MODE                 : std_logic_vector(3 downto 0)  := "0010";
      constant RP_WP_INSTR_MODE               : std_logic_vector(3 downto 0)  := "0011";
      constant R_RP_W_WP_INSTR_MODE           : std_logic_vector(3 downto 0)  := "0100";
      constant R_RP_W_WP_REF_INSTR_MODE       : std_logic_vector(3 downto 0)  := "0101";

      constant BRAM_BL_MODE                   : std_logic_vector(1 downto 0)  := "00";
      constant FIXED_BL_MODE                  : std_logic_vector(1 downto 0)  := "01";
      constant PRBS_BL_MODE                   : std_logic_vector(1 downto 0)  := "10";
          
      constant BRAM_DATAL_MODE                : std_logic_vector(3 downto 0)  := "0000";
      constant FIXED_DATA_MODE                : std_logic_vector(3 downto 0)  := "0001";
      constant ADDR_DATA_MODE                 : std_logic_vector(3 downto 0)  := "0010";
      constant HAMMER_DATA_MODE               : std_logic_vector(3 downto 0)  := "0011";
      constant NEIGHBOR_DATA_MODE             : std_logic_vector(3 downto 0)  := "0100";
      constant WALKING1_DATA_MODE             : std_logic_vector(3 downto 0)  := "0101";
      constant WALKING0_DATA_MODE             : std_logic_vector(3 downto 0)  := "0110";
      constant PRBS_DATA_MODE                 : std_logic_vector(3 downto 0)  := "0111";

      constant RD_INSTR                       : std_logic_vector(2 downto 0)  := "001";
      constant RDP_INSTR                      : std_logic_vector(2 downto 0)  := "011";
      constant WR_INSTR                       : std_logic_vector(2 downto 0)  := "000";
      
      constant WRP_INSTR                      : std_logic_vector(2 downto 0)  := "010";
      constant REFRESH_INSTR                  : std_logic_vector(2 downto 0)  := "100";
      constant NOP_WR_INSTR                   : std_logic_vector(2 downto 0)  := "101";
   
   SIGNAL current_state            : STD_LOGIC_VECTOR(4 DOWNTO 0);
   SIGNAL next_state               : STD_LOGIC_VECTOR(4 DOWNTO 0);
   SIGNAL mcb_init_done_reg        : STD_LOGIC;
   SIGNAL mcb_init_done_reg1        : STD_LOGIC;
   SIGNAL AC2_G_E2                 : STD_LOGIC;
   SIGNAL AC1_G_E1                 : STD_LOGIC;
   SIGNAL AC3_G_E3                 : STD_LOGIC;
   SIGNAL upper_end_matched        : STD_LOGIC;
   SIGNAL end_boundary_addr        : STD_LOGIC_VECTOR(31 DOWNTO 0);
   
   SIGNAL mcb_cmd_en_r             : STD_LOGIC;
   SIGNAL mcb_cmd_bl_r             : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL lower_end_matched        : STD_LOGIC;
   SIGNAL end_addr_reached         : STD_LOGIC;
   SIGNAL run_traffic              : STD_LOGIC;
   SIGNAL current_address          : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL fix_bl_value             : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL data_mode_sel            : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL addr_mode_sel            : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL bl_mode_sel              : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL addr_mode                : STD_LOGIC_VECTOR(2 DOWNTO 0);
--   SIGNAL data_mode1                : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL INC_COUNTS               : STD_LOGIC_VECTOR(10 DOWNTO 0);
   SIGNAL FIXEDBL                  : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL  FIXED_BL_VALUE           : STD_LOGIC_VECTOR(6 DOWNTO 0);
   
   SIGNAL bram_mode_enable         : STD_LOGIC;
   SIGNAL syn1_vio_data_mode_value : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL syn1_vio_addr_mode_value : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL test_mem_instr_mode      : STD_LOGIC_VECTOR(3 DOWNTO 0);
   -- Declare intermediate signals for referenced outputs
   SIGNAL bl_mode_o_xhdl0          : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL data_mode_reg          : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN


test_mem_instr_mode <= "0000" when TST_MEM_INSTR_MODE = "BRAM_INSTR_MODE" else
                       "0001" when (TST_MEM_INSTR_MODE = "FIXED_INSTR_R_MODE") OR
                                   (TST_MEM_INSTR_MODE = "FIXED_INSTR_W_MODE") else
                       "0010" when TST_MEM_INSTR_MODE = "R_W_INSTR_MODE" else
                       "0011" when (TST_MEM_INSTR_MODE = "RP_WP_INSTR_MODE" AND
                                   FAMILY = "SPARTAN6") else
                       "0100" when (TST_MEM_INSTR_MODE = "R_RP_W_WP_INSTR_MODE" AND
                                   FAMILY = "SPARTAN6")else
                       "0101" when (TST_MEM_INSTR_MODE = "R_RP_W_WP_REF_INSTR_MODE"AND
                                   FAMILY = "SPARTAN6") else
                       "0010" ;
   -- Drive referenced outputs
   bl_mode_o <= bl_mode_o_xhdl0;
   FIXEDBL <= "000000";
   xhdl1 : IF (FAMILY = "SPARTAN6") GENERATE
      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            INC_COUNTS <= std_logic_vector(to_unsigned(DWIDTH/8,11));
         END IF;
      END PROCESS;
      
   END GENERATE;
   xhdl2 : IF (FAMILY = "VIRTEX6") GENERATE
      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            IF (DWIDTH >= 256 AND DWIDTH <= 576) THEN
               INC_COUNTS <= "00000100000";
            ELSIF ((DWIDTH >= 128) AND (DWIDTH <= 224)) THEN
               INC_COUNTS <= "00000010000";
            ELSIF ((DWIDTH = 64) OR (DWIDTH = 96)) THEN
               INC_COUNTS <= "00000001000";
            ELSIF (DWIDTH = 32) THEN
               INC_COUNTS <= "00000000100";
            END IF;
         END IF;
      END PROCESS;
      
   END GENERATE;
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_i = '1') THEN
            current_address <= BEGIN_ADDRESS;
         ELSIF (
--                ((mcb_wr_en_i = '1' AND (current_state = INIT_MEM_WRITE AND ((PORT_MODE = "WR_MODE") OR (PORT_MODE = "BI_MODE")))) OR
                 (mcb_wr_en_i = '1' AND (current_state = INIT_MEM_WRITE AND (PORT_MODE = "WR_MODE" OR PORT_MODE = "BI_MODE"))) OR

                 (mcb_wr_en_i = '1' AND (current_state = IDLE AND PORT_MODE = "RD_MODE" ))
               ) THEN
            current_address <= current_address + ("000000000000000000000" & INC_COUNTS);
         ELSE
            current_address <= current_address;
         END IF;
      END IF;
   END PROCESS;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (current_address(29 DOWNTO 24) >= end_boundary_addr(29 DOWNTO 24)) THEN
            AC3_G_E3 <= '1';
         ELSE
            AC3_G_E3 <= '0';
         END IF;
         IF (current_address(23 DOWNTO 16) >= end_boundary_addr(23 DOWNTO 16)) THEN
            AC2_G_E2 <= '1';
         ELSE
            AC2_G_E2 <= '0';
         END IF;
         IF (current_address(15 DOWNTO 8) >= end_boundary_addr(15 DOWNTO 8)) THEN
            AC1_G_E1 <= '1';
         ELSE
            AC1_G_E1 <= '0';
         END IF;
      END IF;
   END PROCESS;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_i = '1') THEN
            upper_end_matched <= '0'; 
         ELSIF (mcb_cmd_en_i = '1') THEN
            upper_end_matched <= AC3_G_E3 AND AC2_G_E2 AND AC1_G_E1;
         END IF;
      END IF;
   END PROCESS;
   
   FIXED_BL_VALUE <= "0000010" WHEN ((FAMILY = "VIRTEX6") AND ((MEM_BURST_LEN = 8) OR (MEM_BURST_LEN = 0))) ELSE 
                     "0000001" WHEN ((FAMILY = "VIRTEX6") AND (MEM_BURST_LEN = 4)) ELSE
                     ('0' & FIXEDBL);

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         end_boundary_addr <= std_logic_vector(to_unsigned((to_integer(unsigned(END_ADDRESS)) - (DWIDTH / 8) + 1),32));


      END IF;
   END PROCESS;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (current_address(7 DOWNTO 0) >= end_boundary_addr(7 DOWNTO 0)) THEN
            lower_end_matched <= '1';
         ELSE
            lower_end_matched <= '0';
         END IF;
      END IF;
   END PROCESS;
   
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (mcb_cmd_en_i = '1') THEN
            mcb_cmd_bl_r <= mcb_cmd_bl_i;
         END IF;
      END IF;
   END PROCESS;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (((upper_end_matched = '1' AND lower_end_matched = '1') AND FAMILY = "SPARTAN6" AND (DWIDTH = 32)) OR   
             ((upper_end_matched = '1' AND lower_end_matched = '1') AND FAMILY = "SPARTAN6" AND (DWIDTH = 64)) OR 
             (upper_end_matched = '1' AND DWIDTH = 128 AND FAMILY = "SPARTAN6") OR
             ((upper_end_matched = '1' AND lower_end_matched = '1') AND FAMILY = "VIRTEX6")) THEN
            end_addr_reached <= '1';
         ELSE
            end_addr_reached <= '0';
         END IF;
      END IF;
   END PROCESS;
   
   fixed_addr_o <= "00000000000000000001001000110100";
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         mcb_init_done_reg1 <= mcb_init_done_i;
         mcb_init_done_reg <= mcb_init_done_reg1;
      END IF;
   END PROCESS;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         run_traffic_o <= run_traffic;
      END IF;
   END PROCESS;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_i = '1') THEN
            current_state <= "00001";
         ELSE
            current_state <= next_state;
         END IF;
      END IF;
   END PROCESS;
   
   
   start_addr_o <= BEGIN_ADDRESS;
   end_addr_o <= END_ADDRESS;
   cmd_seed_o <= CMD_SEED_VALUE;
   data_seed_o <= DATA_SEED_VALUE;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_i = '1') THEN
            syn1_vio_data_mode_value <= "011";
            syn1_vio_addr_mode_value <= "011";
         ELSIF (vio_modify_enable = '1') THEN
            syn1_vio_data_mode_value <= vio_data_mode_value;
            syn1_vio_addr_mode_value <= vio_addr_mode_value;
         END IF;
      END IF;
   END PROCESS;
   
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_i = '1') THEN
            data_mode_sel <= DATA_MODE; --"0101" ADDR_DATA_MODE;
            addr_mode_sel <= "011";
         ELSIF (vio_modify_enable = '1') THEN
            data_mode_sel <= '0' & syn1_vio_data_mode_value(2 DOWNTO 0);
            addr_mode_sel <= vio_addr_mode_value;
         END IF;
      END IF;
   END PROCESS;
   
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_i = '1') OR (FAMILY = "VIRTEX6")) THEN
            fix_bl_value <= FIXED_BL_VALUE(5 DOWNTO 0);
         ELSIF (vio_modify_enable = '1') THEN
            fix_bl_value <= vio_fixed_bl_value;
         END IF;
      END IF;
   END PROCESS;
   
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF (rst_i = '1' OR (FAMILY = "VIRTEX6")) THEN
            IF (FAMILY = "VIRTEX6") THEN
               bl_mode_sel <= FIXED_BL_MODE;
            ELSE
               bl_mode_sel <= PRBS_BL_MODE;
            END IF;
         ELSIF (vio_modify_enable = '1') THEN
            bl_mode_sel <= vio_bl_mode_value;
         END IF;
      END IF;
   END PROCESS;
   
   data_mode_o <= data_mode_reg;
   
   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         data_mode_reg <=  data_mode_sel;
         addr_mode_o <= addr_mode;
         IF (syn1_vio_addr_mode_value = 0 AND vio_modify_enable = '1') THEN
             bram_mode_enable <=  '1';
         ELSE
             bram_mode_enable <=  '0';
         END IF;
        
         
      END IF;
   END PROCESS;
   
   
   PROCESS (FIXED_BL_VALUE,fix_bl_value,bram_mode_enable,test_mem_instr_mode, current_state, mcb_init_done_reg, end_addr_reached, cmp_error, bl_mode_sel, addr_mode_sel, data_mode_reg,bl_mode_o_xhdl0)
   BEGIN
      load_seed_o <= '0';
      IF (CMD_PATTERN = "CGEN_BRAM" or bram_mode_enable = '1') THEN
          addr_mode <= (others => '0');
      ELSE
          addr_mode <= SEQUENTIAL_ADDR;
      END IF;
      
      IF (CMD_PATTERN = "CGEN_BRAM" or bram_mode_enable = '1') THEN
          instr_mode_o <= (others => '0');
      ELSE
          instr_mode_o <= FIXED_INSTR_MODE;
      END IF;
      
      
      IF (CMD_PATTERN = "CGEN_BRAM" or bram_mode_enable = '1') THEN
          bl_mode_o_xhdl0 <= (others => '0');
      ELSE
          bl_mode_o_xhdl0 <= FIXED_BL_MODE;
      END IF;
--      data_mode1 <= WALKING1_DATA_MODE;

      IF (FAMILY = "VIRTEX6") THEN
        fixed_bl_o <= FIXED_BL_VALUE(5 downto 0); --"000010"; --2
        -- PRBS mode
      else if (data_mode_reg(2 downto 0) = "111" and FAMILY = "SPARTAN6") then
             fixed_bl_o <= "000000";-- 64  Our current PRBS algorithm wants to maximize the range bl from 1 to 64.
           else
             fixed_bl_o <= fix_bl_value;
           end if;
      end if;

      mode_load_o <= '0';
      run_traffic <= '0';
      
      next_state <= IDLE;
      IF (PORT_MODE = "RD_MODE") THEN
         fixed_instr_o <= RD_INSTR;
      ELSIF (PORT_MODE = "WR_MODE" OR PORT_MODE = "BI_MODE") THEN
         fixed_instr_o <= WR_INSTR;
      END IF;
      
      CASE current_state IS
         
         WHEN IDLE =>
            IF (mcb_init_done_reg = '1') THEN
               IF (PORT_MODE = "WR_MODE" OR PORT_MODE = "BI_MODE") THEN
                  next_state <= INIT_MEM_WRITE;
                  mode_load_o <= '1';
                  run_traffic <= '0';
                  load_seed_o <= '1';
               ELSIF (PORT_MODE = "RD_MODE" AND end_addr_reached = '1') THEN
                  next_state <= TEST_MEM;
                  mode_load_o <= '1';
                  run_traffic <= '1';
                  load_seed_o <= '1';
               END IF;
            ELSE
               next_state <= IDLE;
               run_traffic <= '0';
               load_seed_o <= '0';
            END IF;
         
         WHEN INIT_MEM_WRITE =>
            IF (end_addr_reached = '1' AND EYE_TEST = "FALSE") THEN
               next_state <= TEST_MEM;
               mode_load_o <= '1';
               load_seed_o <= '1';
               run_traffic <= '1';
            ELSE
               next_state <= INIT_MEM_WRITE;
               run_traffic <= '1';
               mode_load_o <= '0';
               load_seed_o <= '0';
               IF (EYE_TEST = "TRUE") THEN
                  addr_mode <= FIXED_ADDR;
               ELSIF (CMD_PATTERN = "CGEN_BRAM" OR bram_mode_enable = '1') THEN
                  addr_mode <= "000";
               ELSE
                  addr_mode <= SEQUENTIAL_ADDR;
               END IF;
            END IF;
         
         WHEN INIT_MEM_READ =>
            IF (end_addr_reached = '1') THEN
               next_state <= TEST_MEM;
               mode_load_o <= '1';
               load_seed_o <= '1';
            ELSE
               next_state <= INIT_MEM_READ;
               run_traffic <= '0';
               mode_load_o <= '0';
               load_seed_o <= '0';
            END IF;
         
         WHEN TEST_MEM =>
            IF (cmp_error = '1') THEN
               next_state <= CMP_ERROR1;
            ELSE
               next_state <= TEST_MEM;
            END IF;

            run_traffic <= '1';


            IF (PORT_MODE = "BI_MODE" AND TST_MEM_INSTR_MODE = "FIXED_INSTR_W_MODE") THEN
               fixed_instr_o <= WR_INSTR;
            ELSIF (PORT_MODE = "BI_MODE" AND TST_MEM_INSTR_MODE = "FIXED_INSTR_R_MODE") THEN
               fixed_instr_o <= RD_INSTR;
               
            ELSIF (PORT_MODE = "RD_MODE") THEN
               fixed_instr_o <= RD_INSTR;
            ELSIF (PORT_MODE = "WR_MODE") THEN
               fixed_instr_o <= WR_INSTR;
            END IF;

            if (FAMILY = "VIRTEX6") then
              fixed_bl_o <= fix_bl_value; --"000010"; 2
            else if ((data_mode_reg = "0111") and (FAMILY = "SPARTAN6")) then
                   fixed_bl_o <= "000000";  -- 64  Our current PRBS algorithm wants to maximize the range bl from 1 to 64.
                 else
                   fixed_bl_o <= fix_bl_value;
                 end if; 
            end if;

            bl_mode_o_xhdl0 <= bl_mode_sel;
            IF (bl_mode_o_xhdl0 = PRBS_BL_MODE) THEN
               addr_mode <= PRBS_ADDR;
            ELSE
               addr_mode <= addr_mode_sel;
            END IF;

            IF (PORT_MODE = "BI_MODE") THEN
               IF (CMD_PATTERN = "CGEN_BRAM" OR bram_mode_enable = '1') THEN
                  instr_mode_o <= BRAM_INSTR_MODE;
               ELSE
                  instr_mode_o  <= test_mem_instr_mode;
                  --R_RP_W_WP_REF_INSTR_MODE;--FIXED_INSTR_MODE;--R_W_INSTR_MODE;--R_RP_W_WP_INSTR_MODE;--R_W_INSTR_MODE;
                  --R_W_INSTR_MODE; --FIXED_INSTR_MODE;--
               END IF;      
            ELSIF (PORT_MODE = "RD_MODE" OR PORT_MODE = "WR_MODE") THEN
               instr_mode_o <= FIXED_INSTR_MODE;
            END IF;
         
         WHEN CMP_ERROR1 =>
            next_state <= CMP_ERROR1;
            bl_mode_o_xhdl0 <= bl_mode_sel;
            fixed_instr_o <= RD_INSTR;
            addr_mode <= SEQUENTIAL_ADDR;
            IF (CMD_PATTERN = "CGEN_BRAM" OR bram_mode_enable = '1') THEN
                  instr_mode_o <= BRAM_INSTR_MODE;
            ELSE
                  instr_mode_o  <= test_mem_instr_mode;
               --R_W_INSTR_MODE;--R_W_INSTR_MODE; --FIXED_INSTR_MODE;--
            END IF;
            run_traffic <= '1';
         
         WHEN OTHERS =>
            next_state <= IDLE;
      END CASE;
   END PROCESS;
   
   
END trans;





