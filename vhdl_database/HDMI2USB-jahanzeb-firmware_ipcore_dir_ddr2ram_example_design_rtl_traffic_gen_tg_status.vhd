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
--  /   /         Filename: tg_status.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/06/02 07:16:42 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR 
-- Purpose:  This module compare the memory read data agaisnt compare data that generated from data_gen module.
--          Error signal will be asserted if the comparsion is not equal.
-- Reference:
-- Revision History:

--*****************************************************************************

LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;

entity tg_status is
   generic (
      TCQ             : TIME   := 100 ps;
      DWIDTH                         : integer := 32
   );
   port (
      
      clk_i                          : in std_logic;
      rst_i                          : in std_logic;
      manual_clear_error             : in std_logic;
      data_error_i                   : in std_logic;
      cmp_data_i                     : in std_logic_vector(DWIDTH - 1 downto 0);
      rd_data_i                      : in std_logic_vector(DWIDTH - 1 downto 0);
      cmp_addr_i                     : in std_logic_vector(31 downto 0);
      cmp_bl_i                       : in std_logic_vector(5 downto 0);
      mcb_cmd_full_i                 : in std_logic;
      mcb_wr_full_i                  : in std_logic;
      mcb_rd_empty_i                 : in std_logic;
      error_status                   : out std_logic_vector(64 + (2 * DWIDTH - 1) downto 0);
      error                          : out std_logic
   );
end entity tg_status;

architecture trans of tg_status is
   
   signal data_error_r             : std_logic;
   signal error_set                : std_logic;
begin
   error <= error_set;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         
         data_error_r <= data_error_i;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         
         if ((rst_i or manual_clear_error) = '1') then
--            error_status <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
              error_status <= (others => '0');
            error_set <= '0';
         else
            -- latch the first error only
            if ((data_error_i and not(data_error_r) and not(error_set)) = '1') then
               error_status(31 downto 0) <= cmp_addr_i;
               error_status(37 downto 32) <= cmp_bl_i;
               error_status(40) <= mcb_cmd_full_i;
               error_status(41) <= mcb_wr_full_i;
               error_status(42) <= mcb_rd_empty_i;
               error_set <= '1';
               error_status(64 + (DWIDTH - 1) downto 64) <= cmp_data_i;
               
               error_status(64 + (2 * DWIDTH - 1) downto 64 + DWIDTH) <= rd_data_i;
            end if;
            
            error_status(39 downto 38) <= "00";		-- reserved
            
            error_status(63 downto 43) <= "000000000000000000000";		-- reserved
         end if;
      end if;
   end process;
   
   
end architecture trans;


