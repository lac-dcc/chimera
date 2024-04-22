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
--  /   /         Filename: wr_data_gen.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/05/27 15:50:28 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR 
-- Purpose:
-- Reference:
-- Revision History:

--*****************************************************************************

library ieee;
   use ieee.std_logic_1164.all;
   use ieee.std_logic_unsigned.all;
   use ieee.numeric_std.all;

entity wr_data_gen is
   generic (
      
      TCQ                            : TIME   := 100 ps;
      FAMILY                         : string := "SPARTAN6";            -- "SPARTAN6", "VIRTEX6"
      MEM_BURST_LEN                  : integer := 8;
      
      MODE                           : string := "WR";          --"WR", "RD"
      ADDR_WIDTH                     : integer := 32;
      BL_WIDTH                       : integer := 6;
      DWIDTH                         : integer := 32;
      DATA_PATTERN                   : string := "DGEN_PRBS";           --"DGEN__HAMMER", "DGEN_WALING1","DGEN_WALING0","DGEN_ADDR","DGEN_NEIGHBOR","DGEN_PRBS","DGEN_ALL"  
      NUM_DQ_PINS                    : integer := 8;
      SEL_VICTIM_LINE                : integer := 3;            -- VICTIM LINE is one of the DQ pins is selected to be different than hammer pattern
      
      COLUMN_WIDTH                   : integer := 10;
      EYE_TEST                       : string := "FALSE"
   );
   port (
      
      clk_i                          : in std_logic;            --
      rst_i                          : in std_logic_vector(4 downto 0);
      prbs_fseed_i                   : in std_logic_vector(31 downto 0);
      
      data_mode_i                    : in std_logic_vector(3 downto 0);         -- "00" = bram; 
      
      cmd_rdy_o                      : out std_logic;           -- ready to receive command. It should assert when data_port is ready at the                                        // beginning and will be deasserted once see the cmd_valid_i is asserted. 
      -- And then it should reasserted when 
      -- it is generating the last_word.
      cmd_valid_i                    : in std_logic;            -- when both cmd_valid_i and cmd_rdy_o is high, the command  is valid.
      cmd_validB_i                   : in std_logic;
      cmd_validC_i                   : in std_logic;
      
      last_word_o                    : out std_logic;
      
      --  input [5:0] port_data_counts_i,// connect to data port fifo counts
--      m_addr_i                       : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
      fixed_data_i                   : in std_logic_vector(DWIDTH - 1 downto 0);  
      addr_i                         : in std_logic_vector(ADDR_WIDTH - 1 downto 0);            -- generated address used to determine data pattern.
      bl_i                           : in std_logic_vector(BL_WIDTH - 1 downto 0);              -- generated burst length for control the burst data
      
      data_rdy_i                     : in std_logic;            -- connect from mcb_wr_full when used as wr_data_gen
      -- connect from mcb_rd_empty when used as rd_data_gen
      -- When both data_rdy and data_valid is asserted, the ouput data is valid.
      data_valid_o                   : out std_logic;           -- connect to wr_en or rd_en and is asserted whenever the 
      -- pattern is available.
      data_o                         : out std_logic_vector(DWIDTH - 1 downto 0);               -- generated data pattern   
      data_wr_end_o                  : out std_logic
   );
end entity wr_data_gen;

architecture trans of wr_data_gen is

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
      fixed_data_i    : IN std_logic_vector(DWIDTH - 1 downto 0);  
      
      addr_i          : IN STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
      user_burst_cnt  : IN STD_LOGIC_VECTOR(BL_WIDTH DOWNTO 0);
      
      fifo_rdy_i      : IN STD_LOGIC;
      data_o          : OUT STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0)
   );
END COMPONENT;   

COMPONENT v6_data_gen IS
   GENERIC (
      
      ADDR_WIDTH      : INTEGER := 32;
      BL_WIDTH        : INTEGER := 6;
      MEM_BURST_LEN                  : integer := 8;

      DWIDTH          : INTEGER := 32;
      DATA_PATTERN    : STRING := "DGEN_PRBS";
      NUM_DQ_PINS     : INTEGER := 8;
      SEL_VICTIM_LINE : INTEGER := 3;
      COLUMN_WIDTH    : INTEGER := 10;
      EYE_TEST        : STRING  := "FALSE"
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
      fixed_data_i    : IN std_logic_vector(DWIDTH - 1 downto 0);  
      cmd_startE      : IN STD_LOGIC;
      m_addr_i          : IN STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
      addr_i          : IN STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
      user_burst_cnt  : IN STD_LOGIC_VECTOR(BL_WIDTH DOWNTO 0);
      
      fifo_rdy_i      : IN STD_LOGIC;
      data_o          : OUT STD_LOGIC_VECTOR(NUM_DQ_PINS*4 - 1 DOWNTO 0)
   );
END COMPONENT;      

   signal data                          : std_logic_vector(DWIDTH - 1 downto 0);
   
   signal cmd_rdy                       : std_logic;
   signal cmd_rdyB                      : std_logic;
   signal cmd_rdyC                      : std_logic;
   signal cmd_rdyD                      : std_logic;
   signal cmd_rdyE                      : std_logic;
   signal cmd_rdyF                      : std_logic;
   signal cmd_start                     : std_logic;
   signal cmd_startB                    : std_logic;
   signal cmd_startC                    : std_logic;
   signal cmd_startD                    : std_logic;
   signal cmd_startE                    : std_logic;
   signal cmd_startF                    : std_logic;
   
   signal burst_count_reached2          : std_logic;
   
   signal data_valid                    : std_logic;
   signal user_burst_cnt                : std_logic_vector(6 downto 0);
   signal walk_cnt                      : std_logic_vector(2 downto 0);
   
   signal fifo_not_full                 : std_logic;
   signal i                             : integer;
   signal j                             : integer;
   signal w3data                        : std_logic_vector(31 downto 0);
   
   -- counter to count user burst length
   
   -- bl_i;
   
   signal u_bcount_2                    : std_logic;
   signal last_word_t                   : std_logic;
   
   -- Declare intermediate signals for referenced outputs
   signal last_word_o_xhdl1             : std_logic;
   signal data_o_xhdl0                  : std_logic_vector(DWIDTH - 1 downto 0);
   signal tpt_hdata_xhdl2               : std_logic_vector(NUM_DQ_PINS * 4 - 1 downto 0);
begin
   -- Drive referenced outputs
   last_word_o <= last_word_o_xhdl1;
   data_o <= data_o_xhdl0;
   fifo_not_full <= data_rdy_i;
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if (((user_burst_cnt = "0000010") or (((cmd_start = '1') and (bl_i = "000001")) and FAMILY = "VIRTEX6")) and (fifo_not_full = '1')) then
            data_wr_end_o <= '1';
         else
            data_wr_end_o <= '0';
         end if;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         cmd_start <= cmd_validC_i and cmd_rdyC;
         cmd_startB <= cmd_valid_i and cmd_rdyB;
         cmd_startC <= cmd_validB_i and cmd_rdyC;
         cmd_startD <= cmd_validB_i and cmd_rdyD;
         cmd_startE <= cmd_validB_i and cmd_rdyE;
         cmd_startF <= cmd_validB_i and cmd_rdyF;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((rst_i(0)) = '1') then
            user_burst_cnt <= "0000000" ;
         elsif (cmd_start = '1') then
            if (FAMILY = "SPARTAN6") then
               if (bl_i = "000000") then
                  user_burst_cnt <= "1000000" ;
               else
                  user_burst_cnt <= ('0' & bl_i) ;
               end if;
            else
               user_burst_cnt <= ('0' & bl_i)  ;
            end if;
         elsif (fifo_not_full = '1') then
            if (user_burst_cnt /= "0000000") then
               user_burst_cnt <= user_burst_cnt - "0000001"  ;
            else
               user_burst_cnt <= "0000000"  ;
            end if;
         end if;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((user_burst_cnt = "0000010" and fifo_not_full = '1') or (cmd_startC = '1' and bl_i = "000001")) then
            u_bcount_2 <= '1' ;
         elsif (last_word_o_xhdl1 = '1') then
            u_bcount_2 <= '0' ;
         end if;
      end if;
   end process;
   
   
   last_word_o_xhdl1 <= u_bcount_2 and fifo_not_full;
   
   -- cmd_rdy_o assert when the dat fifo is not full and deassert once cmd_valid_i
   -- is assert and reassert during the last data
   
   cmd_rdy_o <= cmd_rdy and fifo_not_full;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((rst_i(0)) = '1') then
            cmd_rdy <= '1' ;
         elsif (cmd_start = '1') then
            if (bl_i = "000001") then
               cmd_rdy <= '1' ;
            else
               cmd_rdy <= '0' ;
            end if;
         elsif (user_burst_cnt = "0000010" and fifo_not_full = '1') then
            
            cmd_rdy <= '1' ;
         end if;
      end if;
   end process;
   
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((rst_i(0)) = '1') then
            cmd_rdyB <= '1' ;
         elsif (cmd_startB = '1') then
            if (bl_i = "000001") then
               cmd_rdyB <= '1' ;
            else
               cmd_rdyB <= '0' ;
            end if;
         elsif (user_burst_cnt = "0000010" and fifo_not_full = '1') then
            
            cmd_rdyB <= '1' ;
         end if;
      end if;
   end process;
   
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((rst_i(0)) = '1') then
            cmd_rdyC <= '1' ;
         elsif (cmd_startC = '1') then
            if (bl_i = "000001") then
               cmd_rdyC <= '1' ;
            else
               cmd_rdyC <= '0' ;
            end if;
         elsif (user_burst_cnt = "0000010" and fifo_not_full = '1') then
            
            cmd_rdyC <= '1' ;
         end if;
      end if;
   end process;
   
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((rst_i(0)) = '1') then
            cmd_rdyD <= '1' ;
         elsif (cmd_startD = '1') then
            if (bl_i = "000001") then
               cmd_rdyD <= '1' ;
            else
               cmd_rdyD <= '0' ;
            end if;
         elsif (user_burst_cnt = "0000010" and fifo_not_full = '1') then
            
            cmd_rdyD <= '1' ;
         end if;
      end if;
   end process;
   
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((rst_i(0)) = '1') then
            cmd_rdyE <= '1' ;
         elsif (cmd_startE = '1') then
            if (bl_i = "000001") then
               cmd_rdyE <= '1' ;
            else
               cmd_rdyE <= '0' ;
            end if;
         elsif (user_burst_cnt = "0000010" and fifo_not_full = '1') then
            
            cmd_rdyE <= '1' ;
         end if;
      end if;
   end process;
   
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((rst_i(0)) = '1') then
            cmd_rdyF <= '1' ;
         elsif (cmd_startF = '1') then
            if (bl_i = "000001") then
               cmd_rdyF <= '1' ;
            else
               cmd_rdyF <= '0' ;
            end if;
         elsif (user_burst_cnt = "0000010" and fifo_not_full = '1') then
            
            cmd_rdyF <= '1' ;
         end if;
      end if;
   end process;
   
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((rst_i(1)) = '1') then
            data_valid <= '0' ;
         elsif (cmd_start = '1') then
            data_valid <= '1' ;
         elsif (fifo_not_full = '1' and user_burst_cnt <= "0000001") then
            data_valid <= '0' ;
         end if;
      end if;
   end process;
   
   
   data_valid_o <= data_valid and fifo_not_full;
   
   s6_wdgen : if (FAMILY = "SPARTAN6") generate
      
      
      
      
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
            cmd_startB      => cmd_startB,
            cmd_startC      => cmd_startC,
            cmd_startD      => cmd_startD,
            cmd_startE      => cmd_startE,
            fixed_data_i    => fixed_data_i,
            addr_i          => addr_i,
            user_burst_cnt  => user_burst_cnt,
            fifo_rdy_i      => fifo_not_full,
            data_o          => data_o_xhdl0
         );
      
   end generate;                                    
                                                    
   v6_wdgen : if (FAMILY = "VIRTEX6") generate         
                                                    
                                                    
                                                    
                                                    
      v6_data_gen_inst : v6_data_gen                
         generic map (                              
            ADDR_WIDTH       => 32,
            BL_WIDTH         => BL_WIDTH,
            DWIDTH           => DWIDTH,
            MEM_BURST_LEN    => MEM_BURST_LEN,
            
            DATA_PATTERN     => DATA_PATTERN,
            NUM_DQ_PINS      => NUM_DQ_PINS,        
            SEL_VICTIM_LINE  => SEL_VICTIM_LINE,    
            COLUMN_WIDTH     => COLUMN_WIDTH,       
            EYE_TEST         => EYE_TEST
         )                                          
         port map (                                 
            clk_i           => clk_i,               
            rst_i           => rst_i(1),               
            data_rdy_i      => data_rdy_i,          
            prbs_fseed_i    => prbs_fseed_i,        
                                                    
            data_mode_i     => data_mode_i,         
            cmd_starta      => cmd_start,           
            cmd_startb      => cmd_startB,          
            cmd_startc      => cmd_startC,          
            cmd_startd      => cmd_startD,          
            cmd_starte      => cmd_startE,          
            fixed_data_i    => fixed_data_i,        
            m_addr_i        => addr_i,      --m_addr_i,            
            addr_i          => addr_i,              
            user_burst_cnt  => user_burst_cnt,      
            fifo_rdy_i      => fifo_not_full,       
            data_o          => data_o_xhdl0         
         );                                         
   end generate;
   
   
end architecture trans;


