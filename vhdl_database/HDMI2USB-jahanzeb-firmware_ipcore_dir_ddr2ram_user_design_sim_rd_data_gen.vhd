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
--  /   /         Filename: rd_data_gen.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/05/27 15:50:28 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR 
-- Purpose: This module has all the timing control for generating "compare data" 
--         to compare the read data from memory.
-- Reference:
-- Revision History: 2010/01/09  parameter MEM_BURST_LEN is missing in v6_data_gen instance module.

--*****************************************************************************

LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;

entity rd_data_gen is
   generic (
      
      FAMILY                         : string := "SPARTAN6";            -- "SPARTAN6", "VIRTEX6"
      MEM_BURST_LEN                  : integer := 8;
      ADDR_WIDTH                     : integer := 32;
      BL_WIDTH                       : integer := 6;
      DWIDTH                         : integer := 32;
      DATA_PATTERN                   : string := "DGEN_PRBS";           --"DGEN__HAMMER", "DGEN_WALING1","DGEN_WALING0","DGEN_ADDR","DGEN_NEIGHBOR","DGEN_PRBS","DGEN_ALL"  
      NUM_DQ_PINS                    : integer := 8;
      SEL_VICTIM_LINE                : integer := 3;            -- VICTIM LINE is one of the DQ pins is selected to be different than hammer pattern
      
      COLUMN_WIDTH                   : integer := 10
   );
   port (
      
      clk_i                          : in std_logic;            --
      rst_i                          : in std_logic_vector(4 downto 0);
      prbs_fseed_i                   : in std_logic_vector(31 downto 0);
      data_mode_i                    : in std_logic_vector(3 downto 0);         -- "00" = bram; 
      rd_mdata_en                    :  in std_logic;
      
      cmd_rdy_o                      : out std_logic;           -- ready to receive command. It should assert when data_port is ready at the                                        // beginning and will be deasserted once see the cmd_valid_i is asserted. 
      -- And then it should reasserted when 
      -- it is generating the last_word.
      cmd_valid_i                    : in std_logic;            -- when both cmd_valid_i and cmd_rdy_o is high, the command  is valid.
      last_word_o                    : out std_logic;
      
--      m_addr_i                       : in std_logic_vector(ADDR_WIDTH - 1 downto 0);            -- generated address used to determine data pattern.
      fixed_data_i                   : in std_logic_vector(DWIDTH - 1 downto 0);
      
      addr_i                         : in std_logic_vector(ADDR_WIDTH - 1 downto 0);            -- generated address used to determine data pattern.
      bl_i                           : in std_logic_vector(BL_WIDTH - 1 downto 0);              -- generated burst length for control the burst data
      user_bl_cnt_is_1_o             : out std_logic;
      data_rdy_i                     : in std_logic;            -- connect from mcb_wr_full when used as wr_data_gen in sp6
      -- connect from mcb_rd_empty when used as rd_data_gen in sp6
      -- connect from rd_data_valid in v6
      -- When both data_rdy and data_valid is asserted, the ouput data is valid.
      data_valid_o                   : out std_logic;           -- connect to wr_en or rd_en and is asserted whenever the 
      -- pattern is available.
      data_o                         : out std_logic_vector(DWIDTH - 1 downto 0)                -- generated data pattern   
   );
end entity rd_data_gen;

ARCHITECTURE trans OF rd_data_gen IS

COMPONENT sp6_data_gen IS
   GENERIC (
      
      ADDR_WIDTH      : INTEGER := 32;
      BL_WIDTH        : INTEGER := 6;
      DWIDTH          : INTEGER := 32;
      DATA_PATTERN    : STRING := "DGEN_PRBS";
      NUM_DQ_PINS     : INTEGER := 8;
      COLUMN_WIDTH    : INTEGER := 10
   );
   PORT (
      
      clk_i           : IN STD_LOGIC;
      rst_i           : IN STD_LOGIC;
      prbs_fseed_i    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      
      data_mode_i     : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      data_rdy_i      : IN STD_LOGIC;
      cmd_startA      : IN STD_LOGIC;
      cmd_startB      : IN STD_LOGIC;
      cmd_startC      : IN STD_LOGIC;
      cmd_startD      : IN STD_LOGIC;
      cmd_startE      : IN STD_LOGIC;
      fixed_data_i    : in std_logic_vector(DWIDTH - 1 downto 0);  
      addr_i          : IN STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
      user_burst_cnt  : IN STD_LOGIC_VECTOR(BL_WIDTH DOWNTO 0);
      
      fifo_rdy_i      : IN STD_LOGIC;
      data_o          : OUT STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0)
   );
END COMPONENT;      

COMPONENT v6_data_gen IS
   GENERIC (
      
      ADDR_WIDTH      : INTEGER := 32;
      MEM_BURST_LEN   : integer := 8;
      
      BL_WIDTH        : INTEGER := 6;
      DWIDTH          : INTEGER := 32;
      DATA_PATTERN    : STRING := "DGEN_ALL";
      NUM_DQ_PINS     : INTEGER := 8;
      SEL_VICTIM_LINE : INTEGER := 3;
      COLUMN_WIDTH    : INTEGER := 10
   );
   PORT (
      
      clk_i           : IN STD_LOGIC;
      rst_i           : IN STD_LOGIC;
      prbs_fseed_i    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      
      data_mode_i     : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      data_rdy_i      : IN STD_LOGIC;
      cmd_startA      : IN STD_LOGIC;
      cmd_startB      : IN STD_LOGIC;
      cmd_startC      : IN STD_LOGIC;
      cmd_startD      : IN STD_LOGIC;
      cmd_startE      : IN STD_LOGIC;
      fixed_data_i    : in std_logic_vector(DWIDTH - 1 downto 0);  
      
      m_addr_i          : IN STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
      addr_i          : IN STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
      user_burst_cnt  : IN STD_LOGIC_VECTOR(BL_WIDTH DOWNTO 0);
      
      fifo_rdy_i      : IN STD_LOGIC;
      data_o          : OUT STD_LOGIC_VECTOR(NUM_DQ_PINS*4 - 1 DOWNTO 0)
   );
END COMPONENT;      


   SIGNAL prbs_data          : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL cmd_start          : STD_LOGIC;
   SIGNAL adata              : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL hdata              : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL ndata              : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL w1data             : STD_LOGIC_VECTOR(31 DOWNTO 0);
   SIGNAL v6_w1data          : STD_LOGIC_VECTOR(NUM_DQ_PINS * 4 - 1 DOWNTO 0);
   
   signal w0data                        : std_logic_vector(31 downto 0);
   signal data                          : std_logic_vector(DWIDTH - 1 downto 0);
   signal cmd_rdy                       : std_logic;
   signal data_valid                    : std_logic;
   signal user_burst_cnt                : std_logic_vector(6 downto 0);
   signal data_rdy_r1                   : std_logic;
   signal data_rdy_r2                   : std_logic;
   signal next_count_is_one             : std_logic;
   signal cmd_valid_r1                  : std_logic;
   signal w3data                        : std_logic_vector(31 downto 0);
   
   signal data_port_fifo_rdy            : std_logic;
   
   --assign cmd_start = cmd_valid_i & cmd_rdy ;
   
   signal user_bl_cnt_is_1              : std_logic;
   
   signal cmd_start_b                   : std_logic;
   
   --  need to wait for extra cycle for data coming out from rd_post_fifo in V6 interface
   --  need to wait for extra cycle for data coming out from rd_post_fifo in V6 interface
   
   -- counter to count user burst length
   
   signal u_bcount_2                    : std_logic;
   
   -- Declare intermediate signals for referenced outputs
   signal last_word_o_xhdl1             : std_logic;
   signal data_o_xhdl0                  : std_logic_vector(DWIDTH - 1 downto 0);
begin
   -- Drive referenced outputs
   last_word_o <= last_word_o_xhdl1;
   data_port_fifo_rdy <= data_rdy_i;
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         data_rdy_r1 <= data_rdy_i;
         data_rdy_r2 <= data_rdy_r1;
         cmd_valid_r1 <= cmd_valid_i;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if (user_burst_cnt = "0000010" and data_rdy_i = '1') then
            next_count_is_one <= '1';
         else
            next_count_is_one <= '0';
         end if;
      end if;
   end process;
   
   user_bl_cnt_is_1_o <= user_bl_cnt_is_1;
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((user_burst_cnt = "0000010" and data_port_fifo_rdy = '1' and FAMILY = "SPARTAN6") or
         (user_burst_cnt = "0000010" and data_port_fifo_rdy = '1' and FAMILY = "VIRTEX6") ) then
            user_bl_cnt_is_1 <= '1';
         else
            user_bl_cnt_is_1 <= '0';
         end if;
      end if;
   end process;
   
   process (cmd_valid_i, cmd_valid_r1, cmd_rdy, user_bl_cnt_is_1, rd_mdata_en)
   begin
      if (FAMILY = "SPARTAN6") then
         cmd_start <= cmd_valid_i and cmd_rdy;
         cmd_start_b <= cmd_valid_i and cmd_rdy;
      else
        if (MEM_BURST_LEN = 4) then 
          cmd_start <= rd_mdata_en;
        else
          cmd_start <= (not(cmd_valid_r1) and cmd_valid_i) or user_bl_cnt_is_1;
          cmd_start_b <= (not(cmd_valid_r1) and cmd_valid_i) or user_bl_cnt_is_1;
        end if;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((rst_i(0)) = '1') then
            user_burst_cnt <= "0000000";
         elsif (cmd_start = '1') then
            if (bl_i = "000000") then
               user_burst_cnt <= "1000000" ;
            else
               user_burst_cnt <= ('0' & bl_i) ;
            end if;
         elsif (data_port_fifo_rdy = '1') then
            if (user_burst_cnt /= "0000000") then
               user_burst_cnt <= user_burst_cnt - "0000001";
            else
               user_burst_cnt <= "0000000";
            end if;
         end if;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((user_burst_cnt = "0000010" and data_rdy_i = '1') or (cmd_start = '1' and bl_i = "000001")) then
            u_bcount_2 <= '1';
         elsif (last_word_o_xhdl1 = '1') then
            u_bcount_2 <= '0';
         end if;
      end if;
   end process;
   
   
   last_word_o_xhdl1 <= u_bcount_2 and data_rdy_i;
   
   -- cmd_rdy_o assert when the dat fifo is not full and deassert once cmd_valid_i
   -- is assert and reassert during the last data
   
   --data_valid_o logic
   
   cmd_rdy_o <= cmd_rdy;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((rst_i(0)) = '1') then
            cmd_rdy <= '1';
         elsif (cmd_start = '1') then
            cmd_rdy <= '0';
         elsif (data_port_fifo_rdy = '1' and user_burst_cnt = "0000001") then
            
            cmd_rdy <= '1';
         end if;
      end if;
   end process;
   
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((rst_i(0)) = '1') then
            data_valid <= '0';
         elsif (user_burst_cnt = "0000001" and data_port_fifo_rdy = '1') then
            data_valid <= '0';
         elsif ((user_burst_cnt >= "0000001") or cmd_start = '1') then
            data_valid <= '1';
         end if;
      end if;
   end process;
   
   
   process (data_valid, data_port_fifo_rdy)
   begin
      if (FAMILY = "SPARTAN6") then
         data_valid_o <= data_valid;
      else
         
         data_valid_o <= data_port_fifo_rdy;
      end if;
   end process;
   
   xhdl2 : if (FAMILY = "SPARTAN6") generate
      
      
      
      sp6_data_gen_inst : sp6_data_gen
         generic map (
            ADDR_WIDTH    => 32,
            BL_WIDTH      => BL_WIDTH,
            DWIDTH        => DWIDTH,
            DATA_PATTERN  => DATA_PATTERN,
            NUM_DQ_PINS   => NUM_DQ_PINS,
            COLUMN_WIDTH  => COLUMN_WIDTH
         )
         port map (
            clk_i           => clk_i,
            rst_i           => rst_i(1),
            data_rdy_i      => data_rdy_i,
            prbs_fseed_i    => prbs_fseed_i,
            
            data_mode_i     => data_mode_i,
            cmd_startA      => cmd_start,
            cmd_startB      => cmd_start,
            cmd_startC      => cmd_start,
            cmd_startD      => cmd_start,
            cmd_startE      => cmd_start,
            fixed_data_i    => fixed_data_i,
            
            addr_i          => addr_i,
            user_burst_cnt  => user_burst_cnt,
            fifo_rdy_i      => data_port_fifo_rdy,
            data_o          => data_o
         );
      
   end generate;
   xhdl3 : if (FAMILY = "VIRTEX6") generate
      
      
      
      v6_data_gen_inst : v6_data_gen
         generic map (
            ADDR_WIDTH       => 32,
            BL_WIDTH         => BL_WIDTH,
            MEM_BURST_LEN    => MEM_BURST_LEN,
            
            DWIDTH           => DWIDTH,
            DATA_PATTERN     => DATA_PATTERN,
            NUM_DQ_PINS      => NUM_DQ_PINS,
            SEL_VICTIM_LINE  => SEL_VICTIM_LINE,
            COLUMN_WIDTH     => COLUMN_WIDTH
         )
         port map (
            clk_i           => clk_i,
            rst_i           => rst_i(1),
            data_rdy_i      => data_rdy_i,
            prbs_fseed_i    => prbs_fseed_i,
            
            data_mode_i     => data_mode_i,
            cmd_startA      => cmd_start,
            cmd_startB      => cmd_start,
            cmd_startC      => cmd_start,
            cmd_startD      => cmd_start,
            cmd_startE      => cmd_start,
            fixed_data_i    => fixed_data_i,
            
            m_addr_i        => addr_i,          --(m_addr_i        ),          
            addr_i          => addr_i,
            user_burst_cnt  => user_burst_cnt,
            fifo_rdy_i      => data_port_fifo_rdy,
            data_o          => data_o
         );
      
   end generate;
   
   
end architecture trans;


