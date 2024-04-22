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
--  /   /         Filename: sp6_data_gen.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/06/02 07:16:40 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR 
-- Purpose: This module generates different data pattern as described in 
--         parameter DATA_PATTERN and is set up for Spartan 6 family.
-- Reference:
-- Revision History:

--*****************************************************************************

LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

entity sp6_data_gen is
   generic (
      
      ADDR_WIDTH                     : integer := 32;
      BL_WIDTH                       : integer := 6;
      DWIDTH                         : integer := 32;
      DATA_PATTERN                   : string := "DGEN_ALL";           --"DGEN__HAMMER", "DGEN_WALING1","DGEN_WALING0","DGEN_ADDR","DGEN_NEIGHBOR","DGEN_PRBS","DGEN_ALL"  
      NUM_DQ_PINS                    : integer := 8;
      COLUMN_WIDTH                   : integer := 10
   );
   port (
      
      clk_i                          : in std_logic;            --
      rst_i                          : in std_logic;
      prbs_fseed_i                   : in std_logic_vector(31 downto 0);
      
      data_mode_i                    : in std_logic_vector(3 downto 0);         -- "00" = bram; 
      data_rdy_i                     : in std_logic;
      cmd_startA                     : in std_logic;
      cmd_startB                     : in std_logic;
      cmd_startC                     : in std_logic;
      cmd_startD                     : in std_logic;
      cmd_startE                     : in std_logic;
      fixed_data_i                   : in std_logic_vector(DWIDTH - 1 downto 0);
      addr_i                         : in std_logic_vector(ADDR_WIDTH - 1 downto 0);            -- generated address used to determine data pattern.
      user_burst_cnt                 : in std_logic_vector(6 downto 0);         -- generated burst length for control the burst data
      
      fifo_rdy_i                     : in std_logic;            -- connect from mcb_wr_full when used as wr_data_gen
      -- connect from mcb_rd_empty when used as rd_data_gen
      -- When both data_rdy and data_valid is asserted, the ouput data is valid.
      data_o                         : out std_logic_vector(DWIDTH - 1 downto 0)                -- generated data pattern   
   );
end entity sp6_data_gen;

architecture trans of sp6_data_gen is

COMPONENT data_prbs_gen IS
   GENERIC (
      EYE_TEST        : STRING := "FALSE";
      PRBS_WIDTH      : INTEGER := 32;
      SEED_WIDTH      : INTEGER := 32
   );
   PORT (
      
      clk_i           : IN STD_LOGIC;
      clk_en          : IN STD_LOGIC;
      rst_i           : IN STD_LOGIC;
      prbs_fseed_i    : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      prbs_seed_init  : IN STD_LOGIC;
      prbs_seed_i     : IN STD_LOGIC_VECTOR(PRBS_WIDTH - 1 DOWNTO 0);
      
      prbs_o          : OUT STD_LOGIC_VECTOR(PRBS_WIDTH - 1 DOWNTO 0)
   );
END COMPONENT;

   -- 
   signal prbs_data                : std_logic_vector(31 downto 0);
   
   signal adata                    : std_logic_vector(31 downto 0);
   signal hdata                    : std_logic_vector(DWIDTH - 1 downto 0);
   signal ndata                    : std_logic_vector(DWIDTH - 1 downto 0);
   signal w1data                   : std_logic_vector(DWIDTH - 1 downto 0);
   signal data                     : std_logic_vector(DWIDTH - 1 downto 0);
   signal burst_count_reached2     : std_logic;
   
   signal data_valid               : std_logic;
   signal walk_cnt                 : std_logic_vector(2 downto 0);
   signal user_address             : std_logic_vector(ADDR_WIDTH - 1 downto 0);
   
   signal i                        : integer;
   signal j                        : integer;
   signal user_bl                  : std_logic_vector(BL_WIDTH - 1 downto 0);
   signal BLANK                    : std_logic_vector(7 downto 0);
   
   signal SHIFT_0                  : std_logic_vector(7 downto 0);
   signal SHIFT_1                  : std_logic_vector(7 downto 0);
   signal SHIFT_2                  : std_logic_vector(7 downto 0);
   signal SHIFT_3                  : std_logic_vector(7 downto 0);
   signal SHIFT_4                  : std_logic_vector(7 downto 0);
   signal SHIFT_5                  : std_logic_vector(7 downto 0);
   signal SHIFT_6                  : std_logic_vector(7 downto 0);
   signal SHIFT_7                  : std_logic_vector(7 downto 0);
   signal SHIFTB_0                 : std_logic_vector(31 downto 0);
   signal SHIFTB_1                 : std_logic_vector(31 downto 0);
   signal SHIFTB_2                 : std_logic_vector(31 downto 0);
   signal SHIFTB_3                 : std_logic_vector(31 downto 0);
   signal SHIFTB_4                 : std_logic_vector(31 downto 0);
   signal SHIFTB_5                 : std_logic_vector(31 downto 0);
   signal SHIFTB_6                 : std_logic_vector(31 downto 0);
   signal SHIFTB_7                 : std_logic_vector(31 downto 0);
   signal TSTB                     : std_logic_vector(3 downto 0);
   --*********************************************************************************************
   
   --  4'b0000: data = 32'b0;       //bram
   --   4'b0001: data = 32'b0;       // fixed
   -- address as data
   -- DGEN_HAMMER
   -- DGEN_NEIGHBOUR
   -- DGEN_WALKING1
   -- DGEN_WALKING0
   
   --bram
   -- fixed
   -- address as data
   -- DGEN_HAMMER
   -- DGEN_NEIGHBOUR
   -- DGEN_WALKING1
   -- DGEN_WALKING0
   
   --bram
   -- fixed
   -- address as data
   -- DGEN_HAMMER
   -- DGEN_NEIGHBOUR
   -- DGEN_WALKING1
   -- DGEN_WALKING0
   
   -- WALKING ONES:
   
   -- WALKING ONE
   
   -- NEIGHBOR ONE
   
   -- WALKING ZERO
   
   -- WALKING ONE
   
   -- NEIGHBOR ONE
   
   -- WALKING ZERO
   
   signal tmpdata                  : std_logic_vector(DWIDTH - 1 downto 0);
   signal ndata_rising             : std_logic;
   signal shift_en                 : std_logic;
   signal data_clk_en              : std_logic;
   SIGNAL ZEROS  : STD_LOGIC_VECTOR(DWIDTH - 1 DOWNTO 0) ;--:= (others => '0');
   
begin
   ZEROS <= (others => '0');
   data_o <= data;
   xhdl0 : if (DWIDTH = 32) generate
      process (adata, hdata, ndata, w1data, prbs_data, data_mode_i,fixed_data_i)
      begin
         case data_mode_i is
            when "0001" =>
               data <= fixed_data_i;
            when "0010" =>
               data <= adata;
            when "0011" =>
               data <= hdata;
            when "0100" =>
               data <= ndata;
            when "0101" =>
               data <= w1data;
            when "0110" =>
               data <= w1data;
            when "0111" =>
               data <= prbs_data;
            WHEN OTHERS =>
               data <= (others => '0');
         END CASE;
      END PROCESS;
      
   end generate;
   xhdl1 : if (DWIDTH = 64) generate
      process (adata, hdata, ndata, w1data, prbs_data, data_mode_i,fixed_data_i)
      begin
         case data_mode_i is
            when "0000" =>
               data <= (others => '0');
            when "0001" =>
               data <= fixed_data_i;
            when "0010" =>
--               data <= (adata & adata)(31 downto 0);
               data <= (adata & adata);
            when "0011" =>
               data <= hdata;
            when "0100" =>
               data <= ndata;
            when "0101" =>
               data <= w1data;
            when "0110" =>
               data <= w1data;
            when "0111" =>
--               data <= (prbs_data & prbs_data)(31 downto 0);
               data <= (prbs_data & prbs_data);
            when others =>
               data <= (others => '0');
         end case;
      end process;
      
   end generate;
   xhdl2 : if (DWIDTH = 128) generate
      process (adata, hdata, ndata, w1data, prbs_data, data_mode_i,fixed_data_i)
      begin
         case data_mode_i is
            when "0000" =>
               data <= (others => '0');
            when "0001" =>
               data <= fixed_data_i;
            when "0010" =>
--               data <= (adata & adata & adata & adata)(31 downto 0);
               data <= (adata & adata & adata & adata);
            when "0011" =>
               data <= hdata;
            when "0100" =>
               data <= ndata;
            when "0101" =>
               data <= w1data;
            when "0110" =>
               data <= w1data;
            when "0111" =>
--               data <= (prbs_data & prbs_data & prbs_data & prbs_data)(31 downto 0);
               data <= (prbs_data & prbs_data & prbs_data & prbs_data);
            when others =>
               data <= (others => '0');--"00000000000000000000000000000000";
         end case;
      end process;
      
   end generate;
   xhdl3 : if ((DWIDTH = 64) or (DWIDTH = 128)) generate
      process (data_mode_i)
      begin
         if (data_mode_i = "0101" or data_mode_i = "0100") then
            BLANK <= "00000000";
            SHIFT_0 <= "00000001";
            SHIFT_1 <= "00000010";
            SHIFT_2 <= "00000100";
            SHIFT_3 <= "00001000";
            SHIFT_4 <= "00010000";
            SHIFT_5 <= "00100000";
            SHIFT_6 <= "01000000";
            SHIFT_7 <= "10000000";
         elsif (data_mode_i = "0100") then
            BLANK <= "00000000";
            SHIFT_0 <= "00000001";
            SHIFT_1 <= "00000010";
            SHIFT_2 <= "00000100";
            SHIFT_3 <= "00001000";
            SHIFT_4 <= "00010000";
            SHIFT_5 <= "00100000";
            SHIFT_6 <= "01000000";
            SHIFT_7 <= "10000000";
         elsif (data_mode_i = "0110") then
            BLANK <= "11111111";
            SHIFT_0 <= "11111110";
            SHIFT_1 <= "11111101";
            SHIFT_2 <= "11111011";
            SHIFT_3 <= "11110111";
            SHIFT_4 <= "11101111";
            SHIFT_5 <= "11011111";
            SHIFT_6 <= "10111111";
            SHIFT_7 <= "01111111";
         else
            BLANK <= "11111111";
            SHIFT_0 <= "11111110";
            SHIFT_1 <= "11111101";
            SHIFT_2 <= "11111011";
            SHIFT_3 <= "11110111";
            SHIFT_4 <= "11101111";
            SHIFT_5 <= "11011111";
            SHIFT_6 <= "10111111";
            SHIFT_7 <= "01111111";
         end if;
      end process;
      
   end generate;
   process (data_mode_i)
   begin
      if (data_mode_i = "0101") then
         SHIFTB_0 <= "00000000000000100000000000000001";
         SHIFTB_1 <= "00000000000010000000000000000100";
         SHIFTB_2 <= "00000000001000000000000000010000";
         SHIFTB_3 <= "00000000100000000000000001000000";
         SHIFTB_4 <= "00000010000000000000000100000000";
         SHIFTB_5 <= "00001000000000000000010000000000";
         SHIFTB_6 <= "00100000000000000001000000000000";
         SHIFTB_7 <= "10000000000000000100000000000000";
      elsif (data_mode_i = "0100") then
         SHIFTB_0 <= "00000000000000000000000000000001";
         SHIFTB_1 <= "00000000000000000000000000000010";
         SHIFTB_2 <= "00000000000000000000000000000100";
         SHIFTB_3 <= "00000000000000000000000000001000";
         SHIFTB_4 <= "00000000000000000000000000010000";
         SHIFTB_5 <= "00000000000000000000000000100000";
         SHIFTB_6 <= "00000000000000000000000001000000";
         SHIFTB_7 <= "00000000000000000000000010000000";
      else
         SHIFTB_0 <= "11111111111111011111111111111110";
         SHIFTB_1 <= "11111111111101111111111111111011";
         SHIFTB_2 <= "11111111110111111111111111101111";
         SHIFTB_3 <= "11111111011111111111111110111111";
         SHIFTB_4 <= "11111101111111111111111011111111";
         SHIFTB_5 <= "11110111111111111111101111111111";
         SHIFTB_6 <= "11011111111111111110111111111111";
         SHIFTB_7 <= "01111111111111111011111111111111";
      end if;
   end process;
   
   xhdl4 : if (DWIDTH = 32 and (DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_ALL")) generate
      
      process (clk_i)
      begin
         if (clk_i'event and clk_i = '1') then
            if (rst_i = '1') then
               w1data <= (others => '0');
               ndata_rising <= '1';
               shift_en <= '0';
            elsif ((fifo_rdy_i = '1' and user_burst_cnt /= "0000000") or cmd_startC = '1') then
               if (NUM_DQ_PINS = 16) then
                  if (cmd_startC = '1') then
                     case addr_i(4 downto 2) is
                        when "000" =>
                           w1data <= SHIFTB_0;
                        when "001" =>
                           w1data <= SHIFTB_1;
                        when "010" =>
                           w1data <= SHIFTB_2;
                        when "011" =>
                           w1data <= SHIFTB_3;
                        when "100" =>
                           w1data <= SHIFTB_4;
                        when "101" =>
                           w1data <= SHIFTB_5;
                        when "110" =>
                           w1data <= SHIFTB_6;
                        
                        when "111" =>
                           w1data <= SHIFTB_7;
                        when others =>
                           w1data <= SHIFTB_0;
                     end case;
                     
                     ndata_rising <= '0';               --(NUM_DQ_PINS == 16) (cmd_startC)  
                  --shifting
                  elsif (data_mode_i = "0100") then
                     w1data <= ("0000000000000000" & w1data(14 downto 0) & w1data(15));
                  else
                     
                     w1data <= (w1data(29 downto 16) & w1data(31 downto 30) & w1data(13 downto 0) & w1data(15 downto 14));              --(DQ_PINS == 16 
                  end if;
               elsif (NUM_DQ_PINS = 8) then
                  if (cmd_startC = '1') then            -- loading data pattern according the incoming address
                     case addr_i(2) is
                        when '0' =>
                           w1data <= SHIFTB_0;
                        when '1' =>
                           w1data <= SHIFTB_1;
                        when others =>
                           w1data <= SHIFTB_0;
                     end case;
                  else
                     -- (cmd_startC)   
                     -- Shifting
                     -- need neigbour pattern ********************
                     
                     w1data <= (w1data(27 downto 24) & w1data(31 downto 28) & w1data(19 downto 16) & w1data(23 downto 20) & w1data(11 downto 8) & w1data(15 downto 12) & w1data(3 downto 0) & w1data(7 downto 4));              --(NUM_DQ_PINS == 8)
                  end if;
               elsif (NUM_DQ_PINS = 4) then             -- NUM_DQ_PINS == 4   
                  -- need neigbour pattern ********************      
                  if (data_mode_i = "0100") then
                     w1data <= "00001000000001000000001000000001";
                  else
                     w1data <= "10000100001000011000010000100001";              -- (NUM_DQ_PINS_4    
                  end if;
               end if;
            end if;
         end if;
      end process;
      
      
--      <outdent>               -- DWIDTH == 32
      end generate;
      
      xhdl5 : if (DWIDTH = 64 and (DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_ALL")) generate
         
         process (clk_i)
         begin
            if (clk_i'event and clk_i = '1') then
               if (rst_i = '1') then
                  
               w1data <= (others => '0');
               elsif ((fifo_rdy_i = '1' and user_burst_cnt /= "0000000") or cmd_startC = '1') then
                  
                  if (NUM_DQ_PINS = 16) then
                     if (cmd_startC = '1') then
                        
                        
                        case addr_i(4 downto 3) is
                           --  7:0
                           
                           when "00" =>
                              w1data(2 * DWIDTH / 4 - 1 downto 0 * DWIDTH / 4) <= SHIFTB_0(31 downto 0);
                              w1data(4 * DWIDTH / 4 - 1 downto 2 * DWIDTH / 4) <= SHIFTB_1(31 downto 0);
                           
                           when "01" =>
                              w1data(2 * DWIDTH / 4 - 1 downto 0 * DWIDTH / 4) <= SHIFTB_2(31 downto 0);
                              w1data(4 * DWIDTH / 4 - 1 downto 2 * DWIDTH / 4) <= SHIFTB_3(31 downto 0);
                           when "10" =>
                              w1data(2 * DWIDTH / 4 - 1 downto 0 * DWIDTH / 4) <= SHIFTB_4(31 downto 0);
                              w1data(4 * DWIDTH / 4 - 1 downto 2 * DWIDTH / 4) <= SHIFTB_5(31 downto 0);
                           
                           when "11" =>
                              w1data(2 * DWIDTH / 4 - 1 downto 0 * DWIDTH / 4) <= SHIFTB_6(31 downto 0);
                              w1data(4 * DWIDTH / 4 - 1 downto 2 * DWIDTH / 4) <= SHIFTB_7(31 downto 0);
                           --15:8 
                           
                           when others =>
                              w1data <= (ZEROS(DWIDTH-1 downto 8) & BLANK);
                        end case;
                     else
                        
                        --(NUM_DQ_PINS == 16) (cmd_startC)      
                        --shifting
                        if (data_mode_i = "0100") then
                           w1data(63 downto 48) <= "0000000000000000";
                           w1data(47 downto 32) <= (w1data(45 downto 32) & w1data(47 downto 46));
                           w1data(31 downto 16) <= "0000000000000000";
                           
                           w1data(15 downto 0) <= (w1data(13 downto 0) & w1data(15 downto 14));
                        else
                           
--                           w1data(DWIDTH - 1 downto 0) <= (w1data(4 * DWIDTH / 4 - 5 downto 4 * DWIDTH / 4 - 16) & w1data(4 * DWIDTH / 4 - 1 downto 4 * DWIDTH / 4 - 4) & w1data(3 * DWIDTH / 4 - 5 downto 3 * DWIDTH / 4 - 16) & w1data(3 * DWIDTH / 4 - 1 downto 3 * DWIDTH / 4 - 4) & w1data(2 * DWIDTH / 4 - 5 downto 2 * DWIDTH / 4 - 16) & w1data(2 * DWIDTH / 4 - 1 downto 2 * DWIDTH / 4 - 4) & w1data(1 * DWIDTH / 4 - 5 to 1 * DWIDTH / 4 - 16) & w1data(1 * DWIDTH / 4 - 1 downto 1 * DWIDTH / 4 - 4))(31 downto 0);
                           w1data(DWIDTH - 1 downto 0) <= (w1data(4 * DWIDTH / 4 - 5 downto 4 * DWIDTH / 4 - 16) &
                                                            w1data(4 * DWIDTH / 4 - 1 downto 4 * DWIDTH / 4 - 4) &
                                                           w1data(3 * DWIDTH / 4 - 5 downto 3 * DWIDTH / 4 - 16) &
                                                            w1data(3 * DWIDTH / 4 - 1 downto 3 * DWIDTH / 4 - 4) &
                                                           w1data(2 * DWIDTH / 4 - 5 downto 2 * DWIDTH / 4 - 16) &
                                                            w1data(2 * DWIDTH / 4 - 1 downto 2 * DWIDTH / 4 - 4) &
                                                           w1data(1 * DWIDTH / 4 - 5 downto 1 * DWIDTH / 4 - 16) &
                                                            w1data(1 * DWIDTH / 4 - 1 downto 1 * DWIDTH / 4 - 4));
                        end if;
                     end if;
                  
                  --(DQ_PINS == 16 
                  elsif (NUM_DQ_PINS = 8) then
                     if (cmd_startC = '1') then         -- loading data pattern according the incoming address
                        
                        if (data_mode_i = "0100") then
                           
                           case addr_i(3) is
                              
                              when '0' =>
                                 w1data <= (BLANK & SHIFT_3 & BLANK & SHIFT_2 & BLANK & SHIFT_1 & BLANK & SHIFT_0);
                              
                              when '1' =>
                                 w1data <= (BLANK & SHIFT_7 & BLANK & SHIFT_6 & BLANK & SHIFT_5 & BLANK & SHIFT_4);
                              --15:8 
                              
                              when others =>
                                 w1data <= (others => '0');--"00000000000000000000000000000000";
                           end case;
                        else
                           
                           w1data <= ("10000000010000000010000000010000" & "00001000000001000000001000000001");         --**** checked
                           w1data <= ("10000000010000000010000000010000" & "00001000000001000000001000000001");         --**** checked
                           w1data <= ("10000000010000000010000000010000" & "00001000000001000000001000000001");         --**** checked
                        end if;
                     -- Shifting
                     elsif (data_mode_i = "0100") then
                        
                        w1data(63 downto 56) <= "00000000";
                        
                        w1data(55 downto 48) <= (w1data(51 downto 48) & w1data(55 downto 52));
                        w1data(47 downto 40) <= "00000000";
                        
                        w1data(39 downto 32) <= (w1data(35 downto 32) & w1data(39 downto 36));
                        w1data(31 downto 24) <= "00000000";
                        
                        w1data(23 downto 16) <= (w1data(19 downto 16) & w1data(23 downto 20));
                        w1data(15 downto 8) <= "00000000";
                        
                        w1data(7 downto 0) <= (w1data(3 downto 0) & w1data(7 downto 4));
                     else
                        w1data <= w1data;               --(NUM_DQ_PINS == 8)
                     end if;
                  elsif (NUM_DQ_PINS = 4) then          -- NUM_DQ_PINS == 4   
                     if (data_mode_i = "0100") then
                        w1data <=  "0000100000000100000000100000000100001000000001000000001000000001";
                     else
                        
                        w1data <= "1000010000100001100001000010000110000100001000011000010000100001";
                     end if;
                  end if;
               end if;
            end if;
         end process;
         
      end generate;
      
      
      xhdl6 : if (DWIDTH = 128 and (DATA_PATTERN = "DGEN_WALKING0" or DATA_PATTERN = "DGEN_WALKING1" or DATA_PATTERN = "DGEN_ALL")) generate
         
         process (clk_i)
         begin
            if (clk_i'event and clk_i = '1') then
               if (rst_i = '1') then
                  
               w1data <= (others => '0');
               elsif ((fifo_rdy_i = '1' and user_burst_cnt /= "0000000") or cmd_startC = '1') then
                  
                  if (NUM_DQ_PINS = 16) then
                     if (cmd_startC = '1') then
                        
                        case addr_i(4) is
                           
                           --  32                                       
                           
                           when '0' =>
                              w1data(1 * DWIDTH / 4 - 1 downto 0 * DWIDTH / 4) <= SHIFTB_0(31 downto 0);
                              w1data(2 * DWIDTH / 4 - 1 downto 1 * DWIDTH / 4) <= SHIFTB_1(31 downto 0);
                              w1data(3 * DWIDTH / 4 - 1 downto 2 * DWIDTH / 4) <= SHIFTB_2(31 downto 0);
                              w1data(4 * DWIDTH / 4 - 1 downto 3 * DWIDTH / 4) <= SHIFTB_3(31 downto 0);
                           
                           --  32                                       
                           
                           when '1' =>
                              w1data(1 * DWIDTH / 4 - 1 downto 0 * DWIDTH / 4) <= SHIFTB_4(31 downto 0);
                              w1data(2 * DWIDTH / 4 - 1 downto 1 * DWIDTH / 4) <= SHIFTB_5(31 downto 0);
                              w1data(3 * DWIDTH / 4 - 1 downto 2 * DWIDTH / 4) <= SHIFTB_6(31 downto 0);
                              w1data(4 * DWIDTH / 4 - 1 downto 3 * DWIDTH / 4) <= SHIFTB_7(31 downto 0);
                           --15:8 
                           
                           when others =>
                              w1data <= ZEROS(DWIDTH-1 downto 8) & BLANK;
                        end case;
                     else
                        
                        --(NUM_DQ_PINS == 16) (cmd_startC)      
                        --shifting
                        if (data_mode_i = "0100") then
                           w1data(127 downto 112) <= "0000000000000000";
                           w1data(111 downto 96) <= (w1data(107 downto 96) & w1data(111 downto 108));
                           w1data(95 downto 80) <= "0000000000000000";
                           
                           w1data(79 downto 64) <= (w1data(75 downto 64) & w1data(79 downto 76));
                           w1data(63 downto 48) <= "0000000000000000";
                           w1data(47 downto 32) <= (w1data(43 downto 32) & w1data(47 downto 44));
                           w1data(31 downto 16) <= "0000000000000000";
                           
                           w1data(15 downto 0) <= (w1data(11 downto 0) & w1data(15 downto 12));
                        else
                           
                           w1data(DWIDTH - 1 downto 0) <= (w1data(4 * DWIDTH / 4 - 9 downto 4 * DWIDTH / 4 - 16) & w1data(4 * DWIDTH / 4 - 1 downto 4 * DWIDTH / 4 - 8) & w1data(4 * DWIDTH / 4 - 25 downto 4 * DWIDTH / 4 - 32) & w1data(4 * DWIDTH / 4 - 17 downto 4 * DWIDTH / 4 - 24) & w1data(3 * DWIDTH / 4 - 9 downto 3 * DWIDTH / 4 - 16) & w1data(3 * DWIDTH / 4 - 1 downto 3 * DWIDTH / 4 - 8) & w1data(3 * DWIDTH / 4 - 25 downto 3 * DWIDTH / 4 - 32) & w1data(3 * DWIDTH / 4 - 17 downto 3 * DWIDTH / 4 - 24) & w1data(2 * DWIDTH / 4 - 9 downto 2 * DWIDTH / 4 - 16) & w1data(2 * DWIDTH / 4 - 1 downto 2 * DWIDTH / 4 - 8) & w1data(2 * DWIDTH / 4 - 25 downto 2 * DWIDTH / 4 - 32) & w1data(2 * DWIDTH / 4 - 17 downto 2 * DWIDTH / 4 - 24) & w1data(1 * DWIDTH / 4 - 9 downto 1 * DWIDTH / 4 - 16) & w1data(1 * DWIDTH / 4 - 1 downto 1 * DWIDTH / 4 - 8) & w1data(1 * DWIDTH / 4 - 25 downto 1 * DWIDTH / 4 - 32) & w1data(1 * DWIDTH / 4 - 17 downto 1 * DWIDTH / 4 - 24));
                        end if;
                     end if;
                  
                  --(DQ_PINS == 16 
                  elsif (NUM_DQ_PINS = 8) then
                     if (cmd_startC = '1') then         -- loading data pattern according the incoming address
                        if (data_mode_i = "0100") then
                           w1data <= (BLANK & SHIFT_7 & BLANK & SHIFT_6 & BLANK & SHIFT_5 & BLANK & SHIFT_4 & BLANK & SHIFT_3 & BLANK & SHIFT_2 & BLANK & SHIFT_1 & BLANK & SHIFT_0);
                        else
                           
                           w1data <= (SHIFT_7 & SHIFT_6 & SHIFT_5 & SHIFT_4 & SHIFT_3 & SHIFT_2 & SHIFT_1 & SHIFT_0 & SHIFT_7 & SHIFT_6 & SHIFT_5 & SHIFT_4 & SHIFT_3 & SHIFT_2 & SHIFT_1 & SHIFT_0);           -- (cmd_startC) 
                        end if;
                     else
                        -- Shifting
                        
                        --{w1data[96:64], w1data[127:97],w1data[31:0], w1data[63:32]}; 
                        w1data <= w1data;               -- else
                     end if;
                  --(NUM_DQ_PINS == 8)
                  elsif (data_mode_i = "0100") then
                     w1data <= "00001000000001000000001000000001000010000000010000000010000000010000100000000100000000100000000100001000000001000000001000000001";
                  else
                     
                     w1data <= "10000100001000011000010000100001100001000010000110000100001000011000010000100001100001000010000110000100001000011000010000100001";
                  end if;
               end if;
            end if;
         end process;
         
      end generate;
      
      -- HAMMER_PATTERN: Alternating 1s and 0s on DQ pins 
      --                 => the rsing data pattern will be    32'b11111111_11111111_11111111_11111111
      --                 => the falling data pattern will be  32'b00000000_00000000_00000000_00000000
      xhdl7 : if (DWIDTH = 32 and (DATA_PATTERN = "DGEN_HAMMER" or DATA_PATTERN = "DGEN_ALL")) generate
         process (clk_i)
         begin
            if (clk_i'event and clk_i = '1') then
               if (rst_i = '1') then
                  hdata <= (others => '0');
--               elsif ((fifo_rdy_i = '1' and user_burst_cnt(5 downto 0) /= "000000") or cmd_startC = '1') then
               elsif ((fifo_rdy_i = '1' and user_burst_cnt /= 0) or cmd_startC = '1') then

                  if (NUM_DQ_PINS = 16) then
                     hdata <= "00000000000000001111111111111111";
                  elsif (NUM_DQ_PINS = 8) then
                     hdata <= "00000000111111110000000011111111";               -- NUM_DQ_PINS == 4    
                  elsif (NUM_DQ_PINS = 4) then
                     hdata <= "00001111000011110000111100001111";
                  end if;
               end if;
            end if;
         end process;
         
      end generate;
      
      xhdl8 : if (DWIDTH = 64 and (DATA_PATTERN = "DGEN_HAMMER" or DATA_PATTERN = "DGEN_ALL")) generate
         process (clk_i)
         begin
            if (clk_i'event and clk_i = '1') then
               if (rst_i = '1') then
               hdata <= (others => '0');
               elsif ((fifo_rdy_i = '1' and user_burst_cnt /= 0) or cmd_startC = '1') then
                  if (NUM_DQ_PINS = 16) then
                  hdata <= "0000000000000000111111111111111100000000000000001111111111111111";
                  elsif (NUM_DQ_PINS = 8) then
                  hdata <= "0000000011111111000000001111111100000000111111110000000011111111";
                  elsif (NUM_DQ_PINS = 4) then
                     
                  hdata <= "0000111100001111000011110000111100001111000011110000111100001111";
                  end if;
               end if;
            end if;
         end process;
         
      end generate;
      
      xhdl9 : if (DWIDTH = 128 and (DATA_PATTERN = "DGEN_HAMMER" or DATA_PATTERN = "DGEN_ALL")) generate
         process (clk_i)
         begin
            if (clk_i'event and clk_i = '1') then
               if (rst_i = '1') then
               hdata <= (others => '0');
               elsif ((fifo_rdy_i = '1' and user_burst_cnt /= 0) or cmd_startC = '1') then
                  if (NUM_DQ_PINS = 16) then
                  hdata <= "00000000000000001111111111111111000000000000000011111111111111110000000000000000111111111111111100000000000000001111111111111111";
                  elsif (NUM_DQ_PINS = 8) then
                  hdata <= "00000000111111110000000011111111000000001111111100000000111111110000000011111111000000001111111100000000111111110000000011111111";
                  elsif (NUM_DQ_PINS = 4) then
                     
                  hdata <= "00001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111";
                  end if;
               end if;
            end if;
         end process;
         
      end generate;
      
      process (w1data, hdata)
      begin
         for i in 0 to  DWIDTH - 1 loop
            
            ndata(i) <= hdata(i) xor w1data(i);
         end loop;
      end process;
      
      
      -- HAMMER_PATTERN_MINUS: generate walking HAMMER  data pattern except 1 bit for the whole burst. The incoming addr_i[5:2] determine 
      -- the position of the pin driving oppsite polarity
      --  addr_i[6:2] = 5'h0f ; 32 bit data port
      --                 => the rsing data pattern will be    32'b11111111_11111111_01111111_11111111
      --                 => the falling data pattern will be  32'b00000000_00000000_00000000_00000000
      
      -- ADDRESS_PATTERN: use the address as the 1st data pattern for the whole burst. For example
      -- Dataport 32 bit width with starting addr_i  = 30'h12345678, user burst length 4
      --                 => the 1st data pattern :     32'h12345678
      --                 => the 2nd data pattern :     32'h12345679
      --                 => the 3rd data pattern :     32'h1234567a
      --                 => the 4th data pattern :     32'h1234567b
      
      --data_rdy_i
      
      xhdl10 : if (DATA_PATTERN = "DGEN_ADDR" or DATA_PATTERN = "DGEN_ALL") generate
         --data_o logic
         process (clk_i)
         begin
            if (clk_i'event and clk_i = '1') then
               if (cmd_startD = '1') then
                  adata <= addr_i;
               elsif ((fifo_rdy_i and data_rdy_i) = '1' and user_burst_cnt > "0000001") then
                 if (DWIDTH = 128) then
                    adata <= adata + "00000000000000000000000000010000";
                 elsif (DWIDTH = 64) then
                    adata <= adata + "00000000000000000000000000001000";               -- DWIDTH == 32   
                 else
                  adata <= adata + "00000000000000000000000000000100";
                 end if;
               end if;
            end if;
         end process;
         
      end generate;
      
      -- PRBS_PATTERN: use the address as the PRBS seed data pattern for the whole burst. For example
      -- Dataport 32 bit width with starting addr_i = 30'h12345678, user burst length 4
      --                
      
      xhdl11 : if (DATA_PATTERN = "DGEN_PRBS" or DATA_PATTERN = "DGEN_ALL") generate
         
         --   PRBS DATA GENERATION
         -- xor all the tap positions before feedback to 1st stage.
         
--         data_clk_en <= fifo_rdy_i and data_rdy_i and to_stdlogicvector(user_burst_cnt > "0000001", 7)(0);
           data_clk_en <= (fifo_rdy_i AND data_rdy_i) when (user_burst_cnt > "0000001") ELSE '0';         
         
         
         data_prbs_gen_inst : data_prbs_gen
            generic map (
               prbs_width  => 32,
               seed_width  => 32
            )
            port map (
               clk_i           => clk_i,
               clk_en          => data_clk_en,
               rst_i           => rst_i,
               prbs_fseed_i    => prbs_fseed_i,
               prbs_seed_init  => cmd_startE,
               prbs_seed_i     => addr_i(31 downto 0),
               prbs_o          => prbs_data
            );
         
      end generate;
      
      
end architecture trans;


