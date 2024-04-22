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
--  /   /         Filename: write_data_path.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/05/27 15:50:28 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR 
-- Purpose: This is top level of write path.
-- Reference:
-- Revision History:

--*****************************************************************************

LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;

entity write_data_path is
   generic (
      TCQ                            : TIME   := 100 ps;
      MEM_BURST_LEN                  : integer := 8;
      FAMILY                         : string := "SPARTAN6";
      ADDR_WIDTH                     : integer := 32;
      DWIDTH                         : integer := 32;
      DATA_PATTERN                   : string := "DGEN_ALL";            --"DGEN__HAMMER", "DGEN_WALING1","DGEN_WALING0","DGEN_ADDR","DGEN_NEIGHBOR","DGEN_PRBS","DGEN_ALL"  
      NUM_DQ_PINS                    : integer := 8;
      SEL_VICTIM_LINE                : integer := 3;            -- VICTIM LINE is one of the DQ pins is selected to be different than hammer pattern
      
      MEM_COL_WIDTH                  : integer := 10;
      EYE_TEST                       : string := "FALSE"
   );
   port (
      
      clk_i                          : in std_logic;
      rst_i                          : in std_logic_vector(9 downto 0);
      cmd_rdy_o                      : out std_logic;
      cmd_valid_i                    : in std_logic;
      cmd_validB_i                   : in std_logic;
      cmd_validC_i                   : in std_logic;
      prbs_fseed_i                   : in std_logic_vector(31 downto 0);
      data_mode_i                    : in std_logic_vector(3 downto 0);
--      m_addr_i                       : in std_logic_vector(31 downto 0);
      fixed_data_i                   : in std_logic_vector(DWIDTH-1 downto 0);
      addr_i                         : in std_logic_vector(31 downto 0);
      
      bl_i                           : in std_logic_vector(5 downto 0);
      
      --   input [5:0]            port_data_counts_i,// connect to data port fifo counts
      
      data_rdy_i                     : in std_logic;
      data_valid_o                   : out std_logic;
      last_word_wr_o                 : out std_logic;
      data_o                         : out std_logic_vector(DWIDTH - 1 downto 0);
      data_mask_o                    : out std_logic_vector((DWIDTH / 8) - 1 downto 0);
      data_wr_end_o                  : out std_logic   );
end entity write_data_path;

architecture trans of write_data_path is

   COMPONENT wr_data_gen IS
      GENERIC (
      TCQ                            : TIME   := 100 ps;
      FAMILY                         : STRING  := "SPARTAN6";           -- "SPARTAN6", "VIRTEX6"      
      MODE                           : STRING  := "WR";         --"WR", "RD"
      MEM_BURST_LEN                  : integer := 8;      
      ADDR_WIDTH                     : INTEGER := 32;
      BL_WIDTH                       : INTEGER := 6;
      DWIDTH                         : INTEGER := 32;
      DATA_PATTERN                   : STRING  := "DGEN_PRBS";          --"DGEN__HAMMER", "DGEN_WALING1","DGEN_WALING0","DGEN_ADDR","DGEN_NEIGHBOR","DGEN_PRBS","DGEN_ALL"  
      NUM_DQ_PINS                    : INTEGER := 8;
      SEL_VICTIM_LINE                : INTEGER := 3;            -- VICTIM LINE is one of the DQ pins is selected to be different than hammer pattern      
      COLUMN_WIDTH                   : INTEGER := 10;
      EYE_TEST                       : STRING  := "FALSE"
      );
      PORT (
         clk_i           : IN STD_LOGIC;
         rst_i           : in STD_LOGIC_VECTOR(4 downto 0);
         prbs_fseed_i    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         data_mode_i     : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         cmd_rdy_o       : OUT STD_LOGIC;
         cmd_valid_i     : IN STD_LOGIC;
         cmd_validB_i    : IN STD_LOGIC;
         cmd_validC_i    : IN STD_LOGIC;
         last_word_o     : OUT STD_LOGIC;
         fixed_data_i    : IN std_logic_vector(DWIDTH-1 downto 0);
         
--         m_addr_i        : IN STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
         addr_i          : IN STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
         bl_i            : IN STD_LOGIC_VECTOR(BL_WIDTH - 1 DOWNTO 0);
         data_rdy_i      : IN STD_LOGIC;
         data_valid_o    : OUT STD_LOGIC;
         data_o          : OUT STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0);
         data_wr_end_o   : OUT STD_LOGIC
      );
   END COMPONENT;

   signal data_valid                    : std_logic;
   signal cmd_rdy                       : std_logic;
   
   -- Declare intermediate signals for referenced outputs
   signal cmd_rdy_o_xhdl0               : std_logic;
   signal last_word_wr_o_xhdl3          : std_logic;
   signal data_o_xhdl1                  : std_logic_vector(DWIDTH - 1 downto 0);
   signal data_wr_end_o_xhdl2           : std_logic;
begin
   -- Drive referenced outputs
   cmd_rdy_o <= cmd_rdy_o_xhdl0;
   last_word_wr_o <= last_word_wr_o_xhdl3;
   data_o <= data_o_xhdl1;
   data_wr_end_o <= data_wr_end_o_xhdl2;
   
   data_valid_o <= data_valid and data_rdy_i;
--   data_mask_o <= "0000";             -- for now 
   data_mask_o <= (others => '0');   
   
   
   wr_data_gen_inst : wr_data_gen
      generic map (
         TCQ              => TCQ,
         family           => FAMILY,
         num_dq_pins      => NUM_DQ_PINS,
         sel_victim_line  => SEL_VICTIM_LINE,
         MEM_BURST_LEN    => MEM_BURST_LEN,
         
         data_pattern     => DATA_PATTERN,
         dwidth           => DWIDTH,
         column_width     => MEM_COL_WIDTH,
         eye_test         => EYE_TEST
      )
      port map (
         clk_i          => clk_i,
         rst_i          => rst_i(9 downto 5),
         prbs_fseed_i   => prbs_fseed_i,
         
         data_mode_i    => data_mode_i,
         cmd_rdy_o      => cmd_rdy_o_xhdl0,
         cmd_valid_i    => cmd_valid_i,
         cmd_validb_i   => cmd_validB_i,
         cmd_validc_i   => cmd_validC_i,
         
         last_word_o    => last_word_wr_o_xhdl3,
         --     .port_data_counts_i (port_data_counts_i),
--         m_addr_i       => m_addr_i,
         fixed_data_i   => fixed_data_i,
         addr_i         => addr_i,
         bl_i           => bl_i,
         data_rdy_i     => data_rdy_i,
         data_valid_o   => data_valid,
         data_o         => data_o_xhdl1,
         data_wr_end_o  => data_wr_end_o_xhdl2
      );
   
end architecture trans;




