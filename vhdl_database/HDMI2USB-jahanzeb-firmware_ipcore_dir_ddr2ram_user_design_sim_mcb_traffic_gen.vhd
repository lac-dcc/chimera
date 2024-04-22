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
--  /   /         Filename: mcb_traffic_gen.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/05/27 15:50:28 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR
-- Purpose: This is top level module of memory traffic generator which can
--         generate different CMD_PATTERN and DATA_PATTERN to Spartan 6
--         hard memory controller core.
-- Reference:
-- Revision History:      2009      Brought out internal signals cmp_data and cmp_error as outputs.
--                        2010/01/09  Removed the rd_mdata_afull_set term in signal rdpath_data_valid_i .
--                        2010/05/03  Removed local generated version of  mcb_rd_empty and mcb_wr_full in TG.
--                        2010/05/20  If MEM_BURST_LEN value is passed with value of zero, it is treated as
--                                    "OTF" Burst Mode and TG will only generate BL 8 traffic.

--*****************************************************************************


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

ENTITY mcb_traffic_gen IS
   GENERIC (
      TCQ                   : TIME := 100 ps;
      FAMILY                : STRING := "SPARTAN6";
      SIMULATION            : STRING := "FALSE";
      MEM_BURST_LEN         : INTEGER := 8;
      PORT_MODE             : STRING := "BI_MODE";
      DATA_PATTERN          : STRING := "DGEN_ADDR";
      CMD_PATTERN           : STRING := "CGEN_ALL";

      ADDR_WIDTH            : INTEGER := 30;

      CMP_DATA_PIPE_STAGES  : INTEGER := 0;

      MEM_COL_WIDTH         : INTEGER := 10;
      NUM_DQ_PINS           : INTEGER := 16;
      DQ_ERROR_WIDTH        : integer := 1;

      SEL_VICTIM_LINE       : INTEGER := 3;
      DWIDTH                : INTEGER := 32;

      EYE_TEST              : STRING  := "FALSE";


      PRBS_EADDR_MASK_POS  : std_logic_vector(31 downto 0)  := X"FFFFD000";
      PRBS_SADDR_MASK_POS  : std_logic_vector(31 downto 0)  := X"00002000";
      PRBS_EADDR           : std_logic_vector(31 downto 0)  := X"00002000";
      PRBS_SADDR           : std_logic_vector(31 downto 0)  := X"00005000"
   );
   PORT (

      clk_i                 : IN STD_LOGIC;
      rst_i                 : IN STD_LOGIC;
      run_traffic_i         : IN STD_LOGIC;
      manual_clear_error    : IN STD_LOGIC;
      start_addr_i          : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      end_addr_i            : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      cmd_seed_i            : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      data_seed_i           : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      load_seed_i           : IN STD_LOGIC;

      addr_mode_i           : IN STD_LOGIC_VECTOR(2 DOWNTO 0);

      instr_mode_i          : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

      bl_mode_i             : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

      data_mode_i           : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

      mode_load_i           : IN STD_LOGIC;

      fixed_bl_i            : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      fixed_instr_i         : IN STD_LOGIC_VECTOR(2 DOWNTO 0);

      fixed_addr_i          : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      fixed_data_i          : IN STD_LOGIC_VECTOR(DWIDTH-1 DOWNTO 0) := (others => '0');
      bram_cmd_i            : IN STD_LOGIC_VECTOR(38 DOWNTO 0);
      bram_valid_i          : IN STD_LOGIC;
      bram_rdy_o            : OUT STD_LOGIC;

      mcb_cmd_en_o          : OUT STD_LOGIC;
      mcb_cmd_instr_o       : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      mcb_cmd_addr_o        : OUT STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
      mcb_cmd_bl_o          : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);

      mcb_cmd_full_i        : IN STD_LOGIC;

      mcb_wr_en_o           : OUT STD_LOGIC;
      mcb_wr_data_o         : OUT STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
      mcb_wr_data_end_o     : OUT STD_LOGIC;
      mcb_wr_mask_o         : OUT STD_LOGIC_VECTOR((DWIDTH / 8) - 1 DOWNTO 0);

      mcb_wr_full_i         : IN STD_LOGIC;
      mcb_wr_fifo_counts    : IN STD_LOGIC_VECTOR(6 DOWNTO 0);

      mcb_rd_en_o           : OUT STD_LOGIC;
      mcb_rd_data_i         : IN STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
      mcb_rd_empty_i        : IN STD_LOGIC;
      mcb_rd_fifo_counts    : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      counts_rst            : IN STD_LOGIC;
      wr_data_counts        : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
      rd_data_counts        : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);

      error                 : OUT STD_LOGIC;
      cmp_data_valid        : OUT STD_LOGIC;

      error_status          : OUT STD_LOGIC_VECTOR(64 + (2 * DWIDTH - 1) DOWNTO 0);
      cmp_error             : out std_logic;
      cmp_data              : OUT STD_LOGIC_VECTOR( DWIDTH - 1 DOWNTO 0);
      mem_rd_data           : OUT STD_LOGIC_VECTOR( DWIDTH - 1 DOWNTO 0);
      dq_error_bytelane_cmp :OUT STD_LOGIC_VECTOR(DQ_ERROR_WIDTH - 1 DOWNTO 0);
      cumlative_dq_lane_error  :OUT STD_LOGIC_VECTOR(DQ_ERROR_WIDTH - 1 DOWNTO 0)


   );
END mcb_traffic_gen;

ARCHITECTURE trans OF mcb_traffic_gen IS
   COMPONENT mcb_flow_control IS
     GENERIC (
         TCQ             : TIME   := 100 ps;
         FAMILY                         : string := "SPARTAN6"
      );
      PORT (
         clk_i                 : IN STD_LOGIC;
         rst_i                 : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
         cmd_rdy_o             : OUT STD_LOGIC;
         cmd_valid_i           : IN STD_LOGIC;
         cmd_i                 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         addr_i                : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         bl_i                  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
         mcb_cmd_full          : IN STD_LOGIC;
         cmd_o                 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         addr_o                : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         bl_o                  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
         cmd_en_o              : OUT STD_LOGIC;
         last_word_wr_i        : IN STD_LOGIC;
         wdp_rdy_i             : IN STD_LOGIC;
         wdp_valid_o           : OUT STD_LOGIC;
         wdp_validB_o          : OUT STD_LOGIC;
         wdp_validC_o          : OUT STD_LOGIC;
         wr_addr_o             : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         wr_bl_o               : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
         last_word_rd_i        : IN STD_LOGIC;
         rdp_rdy_i             : IN STD_LOGIC;
         rdp_valid_o           : OUT STD_LOGIC;
         rd_addr_o             : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         rd_bl_o               : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
      );
   END COMPONENT;

   COMPONENT cmd_gen IS
      GENERIC (
         TCQ             : TIME   := 100 ps;
         PORT_MODE            : STRING  := "BI_MODE";
         FAMILY                : STRING := "SPARTAN6";
         MEM_BURST_LEN         : INTEGER := 8;
         NUM_DQ_PINS           : INTEGER := 8;
         DATA_PATTERN          : STRING := "DGEN_PRBS";
         CMD_PATTERN           : STRING := "CGEN_ALL";
         ADDR_WIDTH            : INTEGER := 30;
         DWIDTH                : INTEGER := 32;
         PIPE_STAGES           : INTEGER := 0;
         MEM_COL_WIDTH         : INTEGER := 10;
         PRBS_EADDR_MASK_POS  : std_logic_vector(31 downto 0)  := X"FFFFD000";
         PRBS_SADDR_MASK_POS  : std_logic_vector(31 downto 0)  := X"00002000";
         PRBS_EADDR           : std_logic_vector(31 downto 0)  := X"00002000";
         PRBS_SADDR           : std_logic_vector(31 downto 0)  := X"00005000"
      );
      PORT (
         clk_i                 : IN STD_LOGIC;
         rst_i                 : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
         run_traffic_i         : IN STD_LOGIC;
         rd_buff_avail_i       : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
         force_wrcmd_gen_i     : IN STD_LOGIC;
         start_addr_i          : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         end_addr_i            : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         cmd_seed_i            : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         data_seed_i           : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         load_seed_i           : IN STD_LOGIC;
         addr_mode_i           : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         data_mode_i           : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         instr_mode_i          : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         bl_mode_i             : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         mode_load_i           : IN STD_LOGIC;
         fixed_bl_i            : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
         fixed_instr_i         : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         fixed_addr_i          : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         bram_addr_i           : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         bram_instr_i          : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         bram_bl_i             : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
         bram_valid_i          : IN STD_LOGIC;
         bram_rdy_o            : OUT STD_LOGIC;
         reading_rd_data_i     : IN STD_LOGIC;
         rdy_i                 : IN STD_LOGIC;
         addr_o                : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         instr_o               : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
         bl_o                  : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
--         m_addr_o              : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         cmd_o_vld             : OUT STD_LOGIC
      );
   END COMPONENT;


   component afifo IS
   GENERIC (
      TCQ             : TIME   := 100 ps;
      DSIZE       : INTEGER := 32;
      FIFO_DEPTH  : INTEGER := 16;
      ASIZE       : INTEGER := 4;
      SYNC        : INTEGER := 1
   );
   PORT (
      wr_clk      : IN STD_LOGIC;
      rst         : IN STD_LOGIC;
      wr_en       : IN STD_LOGIC;
      wr_data     : IN STD_LOGIC_VECTOR(DSIZE - 1 DOWNTO 0);
      rd_en       : IN STD_LOGIC;
      rd_clk      : IN STD_LOGIC;
      rd_data     : OUT STD_LOGIC_VECTOR(DSIZE - 1 DOWNTO 0);
      full        : OUT STD_LOGIC;
      almost_full : OUT STD_LOGIC;
      empty       : OUT STD_LOGIC
   );
END component;

component read_data_path IS
   GENERIC (
      TCQ             : TIME   := 100 ps;

      FAMILY                : STRING := "SPARTAN6";
      MEM_BURST_LEN         : INTEGER := 8;
      ADDR_WIDTH            : INTEGER := 32;
      CMP_DATA_PIPE_STAGES  : INTEGER := 3;
      DWIDTH                : INTEGER := 32;
      DATA_PATTERN          : STRING := "DGEN_PRBS"; --"DGEN__HAMMER", "DGEN_WALING1","DGEN_WALING0","DGEN_ADDR","DGEN_NEIGHBOR","DGEN_PRBS","DGEN_ALL"
      NUM_DQ_PINS           : INTEGER := 8;
      DQ_ERROR_WIDTH        : INTEGER := 1;
      SEL_VICTIM_LINE       : integer := 3;
      MEM_COL_WIDTH         : INTEGER := 10
   );
   PORT (

      clk_i                 : IN STD_LOGIC;
      rst_i                 : in std_logic_vector(9 downto 0);
      manual_clear_error    : IN STD_LOGIC;
      cmd_rdy_o             : OUT STD_LOGIC;
      cmd_valid_i           : IN STD_LOGIC;
      prbs_fseed_i          : IN STD_LOGIC_VECTOR(31 DOWNTO 0);

      data_mode_i           : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cmd_sent              : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      bl_sent               : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      cmd_en_i              : IN STD_LOGIC;
--      m_addr_i              : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      fixed_data_i          : IN STD_LOGIC_VECTOR(DWIDTH-1 DOWNTO 0);

      addr_i                : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      bl_i                  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);

      data_rdy_o            : OUT STD_LOGIC;
      data_valid_i          : IN STD_LOGIC;
      data_i                : IN STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
      last_word_rd_o        : OUT STD_LOGIC;
      data_error_o          : OUT STD_LOGIC;
      cmp_data_o            : OUT STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
      rd_mdata_o            : OUT STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
      cmp_data_valid        : OUT STD_LOGIC;
      cmp_addr_o            : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);

      cmp_bl_o              : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      force_wrcmd_gen_o              : out std_logic;
      rd_buff_avail_o                : out std_logic_vector(6 downto 0);
      dq_error_bytelane_cmp :OUT STD_LOGIC_VECTOR(DQ_ERROR_WIDTH - 1 DOWNTO 0);
      cumlative_dq_lane_error_r  :OUT STD_LOGIC_VECTOR(DQ_ERROR_WIDTH - 1 DOWNTO 0)


   );
END component;

component write_data_path IS
   GENERIC (
      TCQ             : TIME   := 100 ps;
      FAMILY          : STRING := "SPARTAN6";
      MEM_BURST_LEN   : INTEGER := 8;
      ADDR_WIDTH      : INTEGER := 32;
      DWIDTH          : INTEGER := 32;
      DATA_PATTERN    : STRING := "DGEN_ALL";
      NUM_DQ_PINS     : INTEGER := 8;
      SEL_VICTIM_LINE : INTEGER := 3;
      MEM_COL_WIDTH   : INTEGER := 10;
      EYE_TEST        : string := "FALSE"
   );
   PORT (

      clk_i           : IN STD_LOGIC;
      rst_i           : in std_logic_vector(9 downto 0);
      cmd_rdy_o       : OUT STD_LOGIC;
      cmd_valid_i     : IN STD_LOGIC;
      cmd_validB_i    : IN STD_LOGIC;
      cmd_validC_i    : IN STD_LOGIC;
      prbs_fseed_i    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      data_mode_i     : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--      m_addr_i        : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      fixed_data_i          : IN STD_LOGIC_VECTOR(DWIDTH-1 DOWNTO 0);

      addr_i          : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      bl_i            : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      data_rdy_i      : IN STD_LOGIC;
      data_valid_o    : OUT STD_LOGIC;
      last_word_wr_o  : OUT STD_LOGIC;
      data_o          : OUT STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
      data_mask_o     : OUT STD_LOGIC_VECTOR((DWIDTH / 8) - 1 DOWNTO 0);
      data_wr_end_o   : out std_logic
   );
END component;

component tg_status IS
   GENERIC (
      TCQ             : TIME   := 100 ps;
      DWIDTH          : INTEGER := 32
   );
   PORT (

      clk_i           : IN STD_LOGIC;
      rst_i           : IN STD_LOGIC;
      manual_clear_error : IN STD_LOGIC;
      data_error_i    : IN STD_LOGIC;
      cmp_data_i      : IN STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
      rd_data_i       : IN STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
      cmp_addr_i      : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      cmp_bl_i        : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      mcb_cmd_full_i  : IN STD_LOGIC;
      mcb_wr_full_i   : IN STD_LOGIC;
      mcb_rd_empty_i  : IN STD_LOGIC;
      error_status    : OUT STD_LOGIC_VECTOR(64 + (2 * DWIDTH - 1) DOWNTO 0);
      error           : OUT STD_LOGIC
   );


END component;

   attribute KEEP                 : STRING;
   attribute MAX_FANOUT           : STRING;


function MEM_BLENGTH return integer is
  begin
    if (MEM_BURST_LEN = 4) then
      return 4;
    elsif (MEM_BURST_LEN = 8) then
      return 8;
    else
      return 8;
    end if;
  end function MEM_BLENGTH;

   
   constant MEM_BLEN : INTEGER := MEM_BLENGTH;

   SIGNAL mcb_wr_en               : STD_LOGIC;
   SIGNAL cmd2flow_valid          : STD_LOGIC;
   SIGNAL cmd2flow_cmd            : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL cmd2flow_addr           : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL cmd2flow_bl             : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL last_word_rd            : STD_LOGIC;
   SIGNAL last_word_wr            : STD_LOGIC;
   SIGNAL flow2cmd_rdy            : STD_LOGIC;
   SIGNAL wr_addr                 : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL rd_addr                 : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL wr_bl                   : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL rd_bl                   : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL run_traffic_reg         : STD_LOGIC;
   SIGNAL wr_validB               : STD_LOGIC;
   SIGNAL wr_valid                : STD_LOGIC;
   SIGNAL wr_validC               : STD_LOGIC;
   SIGNAL bram_addr_i             : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL bram_instr_i            : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL bram_bl_i               : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL AC2_G_E2                : STD_LOGIC;
   SIGNAL AC1_G_E1                : STD_LOGIC;
   SIGNAL AC3_G_E3                : STD_LOGIC;
   SIGNAL upper_end_matched       : STD_LOGIC;
   SIGNAL end_boundary_addr       : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL lower_end_matched       : STD_LOGIC;
   SIGNAL addr_o                  : STD_LOGIC_VECTOR(31 DOWNTO 0);
--   SIGNAL m_addr                  : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL dcount_rst              : STD_LOGIC;
   SIGNAL rd_addr_error           : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL rd_rdy                  : STD_LOGIC;
   SIGNAL cmp_error_int               : STD_LOGIC;
   SIGNAL cmd_full                : STD_LOGIC;

   SIGNAL cmp_data_int                : STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
   SIGNAL mem_rd_data_i             : STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
   SIGNAL cmp_addr                : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL cmp_bl                  : STD_LOGIC_VECTOR(5 DOWNTO 0);

   SIGNAL rst_ra                  : STD_LOGIC_VECTOR(9 DOWNTO 0);
   SIGNAL rst_rb                  : STD_LOGIC_VECTOR(9 DOWNTO 0);

   SIGNAL mcb_wr_full_r1          : STD_LOGIC;
   SIGNAL mcb_wr_full_r2          : STD_LOGIC;
   SIGNAL mcb_rd_empty_r          : STD_LOGIC;
   SIGNAL force_wrcmd_gen         : STD_LOGIC;
   SIGNAL rd_buff_avail           : STD_LOGIC_VECTOR(6 DOWNTO 0);

   SIGNAL data_mode_r_a           : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL data_mode_r_b           : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL data_mode_r_c           : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL tmp_address             : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL error_access_range      : STD_LOGIC ;

   SIGNAL mcb_rd_empty            : STD_LOGIC;

   SIGNAL mcb_wr_full             : STD_LOGIC;

   SIGNAL end_addr_r              : STD_LOGIC_VECTOR(31 DOWNTO 0);

   SIGNAL wr_rdy                  : STD_LOGIC;

   SIGNAL rd_valid                : STD_LOGIC;

   SIGNAL cmd_rd_en               : STD_LOGIC;
   -- X-HDL generated signals

   SIGNAL xhdl14 : STD_LOGIC_VECTOR(37 DOWNTO 0);
   SIGNAL xhdl15 : STD_LOGIC_VECTOR(32 DOWNTO 0);
   SIGNAL xhdl17 : STD_LOGIC;
   SIGNAL xhdl19 : STD_LOGIC;
   SIGNAL ZEROS  : STD_LOGIC_VECTOR(31 DOWNTO 0);

   -- Declare intermediate signals for referenced outputs
   SIGNAL bram_rdy_o_xhdl0        : STD_LOGIC;
   SIGNAL mcb_cmd_en_o_xhdl5      : STD_LOGIC;
   SIGNAL mcb_cmd_instr_o_xhdl6   : STD_LOGIC_VECTOR(2 DOWNTO 0);
   SIGNAL mcb_cmd_addr_o_xhdl3    : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
   SIGNAL mcb_cmd_bl_o_xhdl4      : STD_LOGIC_VECTOR(5 DOWNTO 0);
   SIGNAL mcb_wr_data_o_xhdl9     : STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
   SIGNAL mcb_wr_data_end_o_xhdl8 : STD_LOGIC;
   SIGNAL mcb_wr_mask_o_xhdl10    : STD_LOGIC_VECTOR((DWIDTH / 8) - 1 DOWNTO 0);
   SIGNAL mcb_rd_en       : STD_LOGIC;
   SIGNAL wr_data_counts_xhdl12   : STD_LOGIC_VECTOR(47 DOWNTO 0);
   SIGNAL rd_data_counts_xhdl11   : STD_LOGIC_VECTOR(47 DOWNTO 0);
   SIGNAL error_xhdl1             : STD_LOGIC;
   SIGNAL error_status_xhdl2      : STD_LOGIC_VECTOR(64 + (2 * DWIDTH - 1) DOWNTO 0);

   SIGNAL cmd_fifo_wr             : STD_LOGIC;
   SIGNAL xfer_addr               : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL fifo_error              : STD_LOGIC;
   SIGNAL cmd_fifo_rd             : STD_LOGIC;
   SIGNAL cmd_fifo_empty          : STD_LOGIC;
   SIGNAL xfer_cmd_bl             : STD_LOGIC;
   SIGNAL cmd_fifo_full           : STD_LOGIC;
   SIGNAL rd_mdata_afull_set      :  STD_LOGIC;
   SIGNAL rd_mdata_fifo_afull     :  STD_LOGIC;
   SIGNAL rdpath_data_valid_i : STD_LOGIC;
   SIGNAL rdpath_rd_data_i : STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
    SIGNAL rd_mdata_fifo_empty : STD_LOGIC;
   SIGNAL rd_v6_mdata             : STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
   SIGNAL mdata_wren              : STD_LOGIC;
   attribute KEEP            of rst_ra : signal is "TRUE";
   attribute KEEP            of rst_rb : signal is "TRUE";
   attribute KEEP            of mcb_wr_full_r1 : signal is "TRUE";
   attribute KEEP            of mcb_wr_full_r2 : signal is "TRUE";
   attribute MAX_FANOUT      of rst_ra : signal is "20";
   attribute MAX_FANOUT      of rst_rb : signal is "20";


BEGIN


   mem_rd_data <= mem_rd_data_i;
   ZEROS <= (others => '0');

   cmp_data <= cmp_data_int;
   cmp_error <= cmp_error_int;
   -- Drive referenced outputs
   bram_rdy_o <= bram_rdy_o_xhdl0;
   mcb_cmd_en_o <= mcb_cmd_en_o_xhdl5;
   mcb_cmd_instr_o <= mcb_cmd_instr_o_xhdl6;
   mcb_cmd_addr_o <= mcb_cmd_addr_o_xhdl3;
   mcb_cmd_bl_o <= mcb_cmd_bl_o_xhdl4;
   mcb_wr_data_o <= mcb_wr_data_o_xhdl9;
   mcb_wr_data_end_o <= mcb_wr_data_end_o_xhdl8;
   mcb_wr_mask_o <= mcb_wr_mask_o_xhdl10;
   mcb_rd_en_o <= mcb_rd_en;
   wr_data_counts <= wr_data_counts_xhdl12;
   rd_data_counts <= std_logic_vector(rd_data_counts_xhdl11);
   error <= error_xhdl1;
   error_status <= error_status_xhdl2;
   tmp_address <= std_logic_vector(to_unsigned((to_integer(unsigned(mcb_cmd_addr_o_xhdl3)) + to_integer(unsigned(mcb_cmd_bl_o_xhdl4)) * (DWIDTH / 8)),32));
--   tmp_address <= ("00" & mcb_cmd_addr_o_xhdl3 + ("000000000000000000000000" & mcb_cmd_bl_o_xhdl4 * to_stdlogicvector(DWIDTH, 6) / "001000"));

--synthesis translate_off
   PROCESS
   BEGIN
     IF ((MEM_BURST_LEN /= 4) AND (MEM_BURST_LEN /= 8)) THEN
       report "Current Traffic Generator logic does not support OTF (On The Fly) Burst Mode!";
       report "If memory is set to OTF (On The Fly) , Traffic Generator only generates BL8 traffic.";
       
     END IF;
     WAIT;
   END PROCESS;

   PROCESS (mcb_cmd_en_o_xhdl5, mcb_cmd_addr_o_xhdl3, mcb_cmd_bl_o_xhdl4, end_addr_i,tmp_address)
   BEGIN
      IF (mcb_cmd_en_o_xhdl5 = '1' AND (tmp_address > end_addr_i)) THEN
         report "Error ! Data access beyond address range"; -- severity ERROR;
         error_access_range <= '1';
         -- $stop();
      END IF;
   END PROCESS;
--synthesis translate_on

    mcb_rd_empty <= mcb_rd_empty_i;

    mcb_wr_full <= mcb_wr_full_i;



   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         data_mode_r_a <= data_mode_i;
         data_mode_r_b <= data_mode_i;
         data_mode_r_c <= data_mode_i;
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_ra(0)) = '1') THEN
            mcb_wr_full_r1 <= '0';
         ELSIF (mcb_wr_fifo_counts >= "0111111") THEN
            mcb_wr_full_r1 <= '1';
            mcb_wr_full_r2 <= '1';
         ELSE
            mcb_wr_full_r1 <= '0';
            mcb_wr_full_r2 <= '0';
         END IF;
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         IF ((rst_ra(0)) = '1') THEN
            mcb_rd_empty_r <= '1';
         ELSIF (mcb_rd_fifo_counts <= "0000001") THEN
            mcb_rd_empty_r <= '1';
         ELSE
            mcb_rd_empty_r <= '0';
         END IF;
      END IF;
   END PROCESS;


   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         rst_ra <= (rst_i & rst_i & rst_i & rst_i & rst_i & rst_i & rst_i & rst_i & rst_i & rst_i);
         rst_rb <= (rst_i & rst_i & rst_i & rst_i & rst_i & rst_i & rst_i & rst_i & rst_i & rst_i);
      END IF;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') THEN
         run_traffic_reg <= run_traffic_i;
      END IF;
   END PROCESS;

   bram_addr_i <= (bram_cmd_i(29 DOWNTO 0) & "00");
   bram_instr_i <= bram_cmd_i(32 DOWNTO 30);
   bram_bl_i(5 DOWNTO 0) <= bram_cmd_i(38 DOWNTO 33);
   dcount_rst <= counts_rst OR rst_ra(0);




   PROCESS (clk_i)
   BEGIN
      IF (clk_i'EVENT AND clk_i = '1') then
      IF (dcount_rst = '1') THEN
         wr_data_counts_xhdl12 <= (OTHERS => '0');
      ELSIF (mcb_wr_en = '1') THEN
            wr_data_counts_xhdl12 <= wr_data_counts_xhdl12 + std_logic_vector(to_unsigned(DWIDTH/8,48));
      END IF;
      end if;
   END PROCESS;

   PROCESS (clk_i)
   BEGIN
     IF (clk_i'EVENT AND clk_i = '1') then
      IF (dcount_rst = '1') THEN
         rd_data_counts_xhdl11 <= (others => '0');
      ELSIF (mcb_rd_en = '1') THEN
            rd_data_counts_xhdl11 <= rd_data_counts_xhdl11 + std_logic_vector(to_unsigned(DWIDTH/8,48));
      END IF;
    end if;
   END PROCESS;

   xhdl13 : IF (SIMULATION = "TRUE") GENERATE
      cmd_fifo_wr <= flow2cmd_rdy AND cmd2flow_valid;
      PROCESS (clk_i)
      BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            IF (mcb_cmd_en_o_xhdl5 = '1') THEN
                       if (xfer_addr /= (ZEROS(31 downto ADDR_WIDTH) & mcb_cmd_addr_o_xhdl3)) then
                  fifo_error <= '1';
               ELSE
                  fifo_error <= '0';
               END IF;
            END IF;
         END IF;
      END PROCESS;

      cmd_fifo_rd <= mcb_cmd_en_o_xhdl5 AND NOT(mcb_cmd_full_i) AND NOT(cmd_fifo_empty);


      xhdl14 <= (cmd2flow_bl & cmd2flow_addr);
      xfer_cmd_bl <= xhdl15(32);
           xfer_addr  <= xhdl15(31 downto 0);
      cmd_fifo : afifo
         GENERIC MAP (
            TCQ                   => TCQ,
            DSIZE       => 38,
            FIFO_DEPTH  => 16,
            ASIZE       => 4,
            SYNC        => 1
         )
         PORT MAP (
            wr_clk   => clk_i,
            rst      => rst_ra(0),
            wr_en    => cmd_fifo_wr,
            wr_data  => xhdl14,
            rd_en    => cmd_fifo_rd,
            rd_clk   => clk_i,
            rd_data  => xhdl15,
            full     => cmd_fifo_full,
            almost_full => open,
            empty    => cmd_fifo_empty
         );
   END GENERATE;
   PROCESS (clk_i)
   BEGIN
         IF (clk_i'EVENT AND clk_i = '1') THEN
            end_addr_r <= end_addr_i;
         END IF;
   END PROCESS;



   u_c_gen : cmd_gen
      GENERIC MAP (
         TCQ                   => TCQ,
         FAMILY               => FAMILY,
         PORT_MODE            => PORT_MODE,
         MEM_BURST_LEN        => MEM_BLEN,
         NUM_DQ_PINS          => NUM_DQ_PINS,
         DATA_PATTERN         => DATA_PATTERN,
         CMD_PATTERN          => CMD_PATTERN,
         ADDR_WIDTH           => ADDR_WIDTH,
         DWIDTH               => DWIDTH,
         MEM_COL_WIDTH        => MEM_COL_WIDTH,
         PRBS_EADDR_MASK_POS  => PRBS_EADDR_MASK_POS,
         PRBS_SADDR_MASK_POS  => PRBS_SADDR_MASK_POS,
         PRBS_EADDR           => PRBS_EADDR,
         PRBS_SADDR           => PRBS_SADDR
      )
      PORT MAP (
         clk_i              => clk_i,
         rst_i              => rst_ra,
         rd_buff_avail_i    => rd_buff_avail,
         reading_rd_data_i  => mcb_rd_en,
         force_wrcmd_gen_i  => force_wrcmd_gen,
         run_traffic_i      => run_traffic_reg,
         start_addr_i       => start_addr_i,
         end_addr_i         => end_addr_r,
         cmd_seed_i         => cmd_seed_i,
         data_seed_i        => data_seed_i,
         load_seed_i        => load_seed_i,
         addr_mode_i        => addr_mode_i,
         data_mode_i        => data_mode_r_a,
         instr_mode_i       => instr_mode_i,
         bl_mode_i          => bl_mode_i,
         mode_load_i        => mode_load_i,
         fixed_bl_i         => fixed_bl_i,
         fixed_addr_i       => fixed_addr_i,
         fixed_instr_i      => fixed_instr_i,
         bram_addr_i        => bram_addr_i,
         bram_instr_i       => bram_instr_i,
         bram_bl_i          => bram_bl_i,
         bram_valid_i       => bram_valid_i,
         bram_rdy_o         => bram_rdy_o_xhdl0,
         rdy_i              => flow2cmd_rdy,
         instr_o            => cmd2flow_cmd,
         addr_o             => cmd2flow_addr,
         bl_o               => cmd2flow_bl,
--         m_addr_o           => m_addr,
         cmd_o_vld          => cmd2flow_valid
      );
   mcb_cmd_addr_o_xhdl3 <= addr_o(ADDR_WIDTH - 1 DOWNTO 0);
   cmd_full <= mcb_cmd_full_i;


   mcb_control : mcb_flow_control
      GENERIC MAP (
         TCQ                   => TCQ,
         FAMILY  => FAMILY
      )
      PORT MAP (
         clk_i           => clk_i,
         rst_i           => rst_ra,
         cmd_rdy_o       => flow2cmd_rdy,
         cmd_valid_i     => cmd2flow_valid,
         cmd_i           => cmd2flow_cmd,
         addr_i          => cmd2flow_addr,
         bl_i            => cmd2flow_bl,
         mcb_cmd_full    => cmd_full,
         cmd_o           => mcb_cmd_instr_o_xhdl6,
         addr_o          => addr_o,
         bl_o            => mcb_cmd_bl_o_xhdl4,
         cmd_en_o        => mcb_cmd_en_o_xhdl5,
         last_word_wr_i  => last_word_wr,
         wdp_rdy_i       => wr_rdy,
         wdp_valid_o     => wr_valid,
         wdp_validB_o    => wr_validB,
         wdp_validC_o    => wr_validC,
         wr_addr_o       => wr_addr,
         wr_bl_o         => wr_bl,
         last_word_rd_i  => last_word_rd,
         rdp_rdy_i       => rd_rdy,
         rdp_valid_o     => rd_valid,
         rd_addr_o       => rd_addr,
         rd_bl_o         => rd_bl
      );

     mdata_wren <= not mcb_rd_empty; 

      rd_mdata_fifo : afifo
         GENERIC MAP (
            TCQ                   => TCQ,
            DSIZE       => DWIDTH,
            FIFO_DEPTH  => 32,
            ASIZE       => 5,
            SYNC        => 1
         )
         PORT MAP (
            wr_clk   => clk_i,
            rst      => rst_rb(0),
            wr_en    => mdata_wren,
            wr_data  => mcb_rd_data_i,
            rd_en    => mcb_rd_en,
            rd_clk   => clk_i,
            rd_data  => rd_v6_mdata,
            full     => open,
            almost_full => open,
            empty    => rd_mdata_fifo_empty
         );



   cmd_rd_en <= NOT(mcb_cmd_full_i) AND mcb_cmd_en_o_xhdl5;

  PROCESS (clk_i)
  BEGIN
  IF (clk_i'EVENT AND clk_i = '1') THEN  
   IF (rst_rb(0) = '1') THEN
       rd_mdata_afull_set <= '0';
    ELSIF (rd_mdata_fifo_afull = '1') THEN
       rd_mdata_afull_set <= '1';
    END IF;
  END IF;
  END PROCESS;


  PROCESS(rd_mdata_fifo_empty,rd_mdata_afull_set,mcb_rd_empty)
  BEGIN
  
  IF (FAMILY = "VIRTEX6" AND MEM_BLEN = 4) THEN
       rdpath_data_valid_i <= not(rd_mdata_fifo_empty);
  ELSE
       rdpath_data_valid_i <= not(mcb_rd_empty);
  
  END IF;
  END PROCESS;
  
  PROCESS(rd_v6_mdata,mcb_rd_data_i)
  BEGIN
  
  IF (FAMILY = "VIRTEX6" AND MEM_BLEN = 4) THEN
       rdpath_rd_data_i <= rd_v6_mdata;
  ELSE
       rdpath_rd_data_i <= mcb_rd_data_i;
  
  END IF;
  END PROCESS;

   RD_PATH : IF (PORT_MODE = "RD_MODE" OR PORT_MODE = "BI_MODE") GENERATE

      xhdl17 <= NOT(mcb_rd_empty);
      read_data_path_inst : read_data_path
         GENERIC MAP (
            TCQ                   => TCQ,
            family                => FAMILY,
            MEM_BURST_LEN         => MEM_BLEN,
            cmp_data_pipe_stages  => CMP_DATA_PIPE_STAGES,
            addr_width            => ADDR_WIDTH,
            sel_victim_line       => SEL_VICTIM_LINE,
            data_pattern          => DATA_PATTERN,
            dwidth                => DWIDTH,
            num_dq_pins           => NUM_DQ_PINS,
            DQ_ERROR_WIDTH        => DQ_ERROR_WIDTH,
            mem_col_width         => MEM_COL_WIDTH
         )
         PORT MAP (
            clk_i              => clk_i,
            rst_i              => rst_rb,
            manual_clear_error => manual_clear_error,
            cmd_rdy_o          => rd_rdy,
            cmd_valid_i        => rd_valid,
            prbs_fseed_i       => data_seed_i,
            cmd_sent           => mcb_cmd_instr_o_xhdl6,
            bl_sent            => mcb_cmd_bl_o_xhdl4,
            cmd_en_i           => cmd_rd_en,
            data_mode_i        => data_mode_r_b,
            last_word_rd_o     => last_word_rd,
--            m_addr_i           => m_addr,
            fixed_data_i       => fixed_data_i,

            addr_i             => rd_addr,
            bl_i               => rd_bl,
            data_rdy_o         => mcb_rd_en,
            data_valid_i       => rdpath_data_valid_i,
            data_i             => rdpath_rd_data_i,
            data_error_o       => cmp_error_int,
            cmp_data_o         => cmp_data_int,
            rd_mdata_o         => mem_rd_data_i,
            cmp_data_valid     => cmp_data_valid,
            cmp_addr_o         => cmp_addr,
            cmp_bl_o           => cmp_bl,
            force_wrcmd_gen_o  => force_wrcmd_gen,
            rd_buff_avail_o    => rd_buff_avail,
            dq_error_bytelane_cmp      => dq_error_bytelane_cmp,
            cumlative_dq_lane_error_r  => cumlative_dq_lane_error
         );
   END GENERATE;
  
   write_only_path_inst: IF ( NOT(PORT_MODE = "RD_MODE" OR PORT_MODE = "BI_MODE")) GENERATE

      cmp_error_int <= '0';
   END GENERATE;

   xhdl18 : IF (PORT_MODE = "WR_MODE" OR PORT_MODE = "BI_MODE") GENERATE

      xhdl19        <= NOT(mcb_wr_full);
      write_data_path_inst : write_data_path
         GENERIC MAP (
            TCQ                   => TCQ,
            family           => FAMILY,
            MEM_BURST_LEN    => MEM_BLEN,
            
            addr_width       => ADDR_WIDTH,
            data_pattern     => DATA_PATTERN,
            dwidth           => DWIDTH,
            num_dq_pins      => NUM_DQ_PINS,
            sel_victim_line  => SEL_VICTIM_LINE,
            mem_col_width    => MEM_COL_WIDTH,
            eye_test         => EYE_TEST
         )
         PORT MAP (
            clk_i           => clk_i,
            rst_i           => rst_rb,
            cmd_rdy_o       => wr_rdy,
            cmd_valid_i     => wr_valid,
            cmd_validb_i    => wr_validB,
            cmd_validc_i    => wr_validC,
            prbs_fseed_i    => data_seed_i,
            data_mode_i     => data_mode_r_c,
            last_word_wr_o  => last_word_wr,
--            m_addr_i        => m_addr,
            fixed_data_i       => fixed_data_i,

            addr_i          => wr_addr,
            bl_i            => wr_bl,
            data_rdy_i      => xhdl19,
            data_valid_o    => mcb_wr_en,
            data_o          => mcb_wr_data_o_xhdl9,
            data_mask_o     => mcb_wr_mask_o_xhdl10,
            data_wr_end_o   => mcb_wr_data_end_o_xhdl8
--            tpt_hdata       =>
         );

   END GENERATE;

   mcb_wr_en_o <= mcb_wr_en;



   tg_status_inst : tg_status
      GENERIC MAP (
         dwidth  => DWIDTH
      )
      PORT MAP (
         clk_i               => clk_i,
         rst_i               => rst_ra(2),
         manual_clear_error  => manual_clear_error,
         data_error_i        => cmp_error_int,
         cmp_data_i          => cmp_data_int,
         rd_data_i           => mem_rd_data_i,
         cmp_addr_i          => cmp_addr,
         cmp_bl_i            => cmp_bl,
         mcb_cmd_full_i      => mcb_cmd_full_i,
         mcb_wr_full_i       => mcb_wr_full,
         mcb_rd_empty_i      => mcb_rd_empty,
         error_status        => error_status_xhdl2,
         error               => error_xhdl1
      );

END trans;




















