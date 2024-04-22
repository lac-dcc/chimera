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
--  /   /         Filename: read_posted_fifo.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/06/02 07:16:40 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR 
-- Purpose: This module instantiated by read_data_path module and sits between 
--         mcb_flow_control module and read_data_gen module to buffer up the 
--         commands that has sent to memory controller.
-- Reference:
-- Revision History:

--*****************************************************************************

LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;

entity read_posted_fifo is
   generic (
      TCQ                            : time := 100 ps;
      MEM_BURST_LEN                  : integer := 4;
      FAMILY                         : string := "SPARTAN6";
      ADDR_WIDTH                     : integer := 32;
      BL_WIDTH                       : integer := 6
   );
   port (
      clk_i                          : in std_logic;
      rst_i                          : in std_logic;
      cmd_rdy_o                      : out std_logic;
      cmd_valid_i                    : in std_logic;
      data_valid_i                   : in std_logic;
      addr_i                         : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
      bl_i                           : in std_logic_vector(BL_WIDTH - 1 downto 0);
      user_bl_cnt_is_1               : in std_logic;
      cmd_sent                       : in std_logic_vector(2 downto 0);
      bl_sent                        : in std_logic_vector(5 downto 0);
      cmd_en_i                       : in std_logic;
      
      gen_rdy_i                      : in std_logic;
      gen_valid_o                    : out std_logic;
      gen_addr_o                     : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
      gen_bl_o                       : out std_logic_vector(BL_WIDTH - 1 downto 0);
      
      rd_buff_avail_o                : out std_logic_vector(6 downto 0);
      rd_mdata_fifo_empty            : in  std_logic;
      rd_mdata_en                    : out std_logic
   );
end entity read_posted_fifo;

architecture trans of read_posted_fifo is
   component afifo is
      generic (
         DSIZE                          : integer := 32;
         FIFO_DEPTH                     : integer := 16;
         ASIZE                          : integer := 4;
         SYNC                           : integer := 1
      );
      port (
         wr_clk                         : in std_logic;
         rst                            : in std_logic;
         wr_en                          : in std_logic;
         wr_data                        : in std_logic_vector(DSIZE - 1 downto 0);
         rd_en                          : in std_logic;
         rd_clk                         : in std_logic;
         rd_data                        : out std_logic_vector(DSIZE - 1 downto 0);
         full                           : out std_logic;
         empty                          : out std_logic;
         almost_full                    : out std_logic
      );
   end component;
   
   
   signal full                          : std_logic;
   signal empty                         : std_logic;
   signal wr_en                         : std_logic;
   signal rd_en                         : std_logic;
   signal data_valid_r                  : std_logic;
   signal user_bl_cnt_not_1             : std_logic;
   signal buf_avail_r                   : std_logic_vector(6 downto 0);
   signal rd_data_received_counts       : std_logic_vector(6 downto 0);
   signal rd_data_counts_asked          : std_logic_vector(6 downto 0);
   
   signal dfifo_has_enough_room         : std_logic;
   signal wait_cnt                      : std_logic_vector(1 downto 0);
   signal wait_done                     : std_logic;
   
   signal dfifo_has_enough_room_d1      : std_logic;
   signal empty_r                       : std_logic;
   signal rd_first_data                 : std_logic;
   -- current count is 1 and data_is_valie, then next cycle is not 1
   
   -- calculate how many buf still available
   -- assign buf_avail = 64 - (rd_data_counts_asked - rd_data_received_counts);
   
--   signal tmp_buf_avil                  : std_logic_vector(5 downto 0);
   -- X-HDL generated signals

   signal xhdl3 : std_logic;
   signal xhdl4 : std_logic;
   signal xhdl5 : std_logic_vector(37 downto 0);
   signal xhdl6 : std_logic_vector(37 downto 0);
   
   -- Declare intermediate signals for referenced outputs
   signal cmd_rdy_o_xhdl0               : std_logic;
   signal gen_addr_o_xhdl1              : std_logic_vector(ADDR_WIDTH - 1 downto 0);
   signal gen_bl_o_xhdl2                : std_logic_vector(BL_WIDTH - 1 downto 0);
begin
   -- Drive referenced outputs
   cmd_rdy_o <= cmd_rdy_o_xhdl0;
--   gen_addr_o <= gen_addr_o_xhdl1;
--   gen_bl_o <= gen_bl_o_xhdl2;

   gen_bl_o <= xhdl6(BL_WIDTH+ADDR_WIDTH-1 downto ADDR_WIDTH);
   gen_addr_o <= xhdl6(ADDR_WIDTH-1 downto 0);
   
   rd_mdata_en <= rd_en;
   rd_buff_avail_o <= buf_avail_r;
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         cmd_rdy_o_xhdl0 <= not(full) and dfifo_has_enough_room and wait_done;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if (rst_i = '1') then
            wait_cnt <= "00";
         elsif ((cmd_rdy_o_xhdl0 and cmd_valid_i) = '1') then
            wait_cnt <= "10";
         elsif (wait_cnt > "00") then
            wait_cnt <= wait_cnt - "01";
         end if;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if (rst_i = '1') then
            wait_done <= '1';
         elsif ((cmd_rdy_o_xhdl0 and cmd_valid_i) = '1') then
            wait_done <= '0';
         elsif (wait_cnt = "00") then
            wait_done <= '1';
         else
            wait_done <= '0';
         end if;
      end if;
   end process;
   
   xhdl3 <= '1' when (buf_avail_r >= "0111110") else
            '0';
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         dfifo_has_enough_room <= xhdl3;
         dfifo_has_enough_room_d1 <= dfifo_has_enough_room;
      end if;
   end process;
   
   wr_en <= cmd_valid_i and not(full) and dfifo_has_enough_room_d1 and wait_done;
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         data_valid_r <= data_valid_i;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if ((data_valid_i and user_bl_cnt_is_1) = '1') then
            user_bl_cnt_not_1 <= '1';
         else
            user_bl_cnt_not_1 <= '0';
         end if;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if (rst_i = '1') then
            rd_data_counts_asked <= (others => '0');
         elsif (cmd_en_i = '1' and cmd_sent(0) = '1') then
           rd_data_counts_asked <= rd_data_counts_asked +  (bl_sent + "0000001" );

         end if;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if (rst_i = '1') then
            rd_data_received_counts <= "0000000";
         elsif (data_valid_i = '1') then
            rd_data_received_counts <= rd_data_received_counts + "0000001";
         end if;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         buf_avail_r <= "1000000" - (rd_data_counts_asked - rd_data_received_counts);
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         empty_r <= empty;
      end if;
   end process;
   
  process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
   
         if (rst_i = '1') then
            rd_first_data <= '0';
         elsif ( empty = '0' AND empty_r = '1') then
            rd_first_data <= '1';
         end if;
      end if;
   end process;   
   
   process (gen_rdy_i, empty,empty_r, data_valid_i, data_valid_r, user_bl_cnt_not_1,rd_mdata_fifo_empty,rd_first_data)
   begin
      if (FAMILY = "SPARTAN6") then
         rd_en <= gen_rdy_i and not(empty);
      else
         IF (MEM_BURST_LEN = 4) then
             rd_en <= (not(empty) and empty_r and not(rd_first_data)) or (not(rd_mdata_fifo_empty) and not(empty)) or
                     (user_bl_cnt_not_1 and data_valid_i);
         ELSE
             rd_en <= (data_valid_i and not(data_valid_r)) or (user_bl_cnt_not_1 and data_valid_i);
         END IF;
      end if;
   end process;
   
   
   
   
   gen_valid_o <= not(empty);
   -- set the SYNC to 1 because rd_clk = wr_clk to reduce latency 
   
   
--   xhdl4 <= to_integer(to_stdlogic(BL_WIDTH) + to_stdlogic(ADDR_WIDTH));
   
   xhdl5 <= (bl_i & addr_i);
--   (gen_bl_o_xhdl2, gen_addr_o_xhdl1) <= xhdl6;

   rd_fifo : afifo
      GENERIC MAP (
         DSIZE       => (BL_WIDTH + ADDR_WIDTH),--xhdl4,
         FIFO_DEPTH  => 16,
         ASIZE       => 4,
         SYNC        => 1
      )
      port map (
         wr_clk   => clk_i,
         rst      => rst_i,
         wr_en    => wr_en,
         wr_data  => xhdl5,
         rd_en    => rd_en,
         rd_clk   => clk_i,
         rd_data  => xhdl6,
         full     => full,
         empty    => empty,
         almost_full => open
      );
   
end architecture trans;







