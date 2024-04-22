-------------------------------------------------------------------------------
-- Title      : 10/100/1G Ethernet FIFO for 8-bit Client Interface
-- Project    : Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper
-- File       : eth_fifo_8.vhd
-- Version    : 1.6
-------------------------------------------------------------------------------
--
-- (c) Copyright 2009-2012 Xilinx, Inc. All rights reserved.
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
--------------------------------------------------------------------------
-- Description: This is the top-level wrapper for the 10/100/1G Ethernet
--              FIFO. The top level wrapper consists of individual FIFOs
--              on the transmitter path and on the receiver path.
--
--              Each path consists of an 8-bit LocalLink-to-8-bit
--              client-interface FIFO.
--------------------------------------------------------------------------


library unisim;
use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity eth_fifo_8 is
   generic (
      FULL_DUPLEX_ONLY : boolean := false); -- If fifo is to be used only in full
                                            -- duplex set to true for optimised implementation
   port (
      -- Transmit FIFO MAC TX Interface
      tx_clk              : in  std_logic;  -- MAC transmit clock
      tx_reset            : in  std_logic;  -- Synchronous reset (tx_clk)
      tx_enable           : in  std_logic;  -- Clock enable for tx_clk
      tx_data             : out std_logic_vector(7 downto 0);  -- Data to MAC transmitter
      tx_data_valid       : out std_logic;  -- Valid signal to MAC transmitter
      tx_ack              : in  std_logic;  -- Ack signal from MAC transmitter
      tx_underrun         : out std_logic;  -- Underrun signal to MAC transmitter
      tx_collision        : in  std_logic;  -- Collsion signal from MAC transmitter
      tx_retransmit       : in  std_logic;  -- Retransmit signal from MAC transmitter

      -- Transmit FIFO LocalLink Interface
      tx_ll_clock         : in  std_logic;  -- Local link write clock
      tx_ll_reset         : in  std_logic;  -- synchronous reset (tx_ll_clock)
      tx_ll_data_in       : in  std_logic_vector(7 downto 0);  -- Data to Tx FIFO
      tx_ll_sof_in_n      : in  std_logic;  -- sof indicator to FIFO
      tx_ll_eof_in_n      : in  std_logic;  -- eof indicator to FIFO
      tx_ll_src_rdy_in_n  : in  std_logic;  -- src ready indicator to FIFO
      tx_ll_dst_rdy_out_n : out std_logic;  -- dst ready indicator from FIFO
      tx_fifo_status      : out std_logic_vector(3 downto 0);  -- FIFO memory status
      tx_overflow         : out std_logic;  -- FIFO overflow indicator from FIFO

      -- Receive FIFO MAC RX Interface
      rx_clk              : in  std_logic;  -- MAC receive clock
      rx_reset            : in  std_logic;  -- Synchronous reset (rx_clk)
      rx_enable           : in  std_logic;  -- Clock enable for rx_clk
      rx_data             : in  std_logic_vector(7 downto 0);  -- Data from MAC receiver
      rx_data_valid       : in  std_logic;  -- Valid signal from MAC receiver
      rx_good_frame       : in  std_logic;  -- Good frame indicator from MAC receiver
      rx_bad_frame        : in  std_logic;  -- Bad frame indicator from MAC receiver
      rx_overflow         : out std_logic;  -- FIFO overflow indicator from FIFO

      -- Receive FIFO LocalLink Interface
      rx_ll_clock         : in  std_logic;  -- Local link read clock
      rx_ll_reset         : in  std_logic;  -- synchronous reset (rx_ll_clock)
      rx_ll_data_out      : out std_logic_vector(7 downto 0);  -- Data from Rx FIFO
      rx_ll_sof_out_n     : out std_logic;  -- sof indicator from FIFO
      rx_ll_eof_out_n     : out std_logic;  -- eof indicator from FIFO
      rx_ll_src_rdy_out_n : out std_logic;  -- src ready indicator from FIFO
      rx_ll_dst_rdy_in_n  : in  std_logic;  -- dst ready indicator to FIFO
      rx_fifo_status      : out std_logic_vector(3 downto 0)  -- FIFO memory status
   );

end eth_fifo_8;


architecture RTL of eth_fifo_8 is

   component tx_client_fifo_8
     generic (
        FULL_DUPLEX_ONLY : boolean);
     port (
        -- MAC Interface
        rd_clk          : in  std_logic;
        rd_sreset       : in  std_logic;
        rd_enable       : in  std_logic;
        tx_data         : out std_logic_vector(7 downto 0);
        tx_data_valid   : out std_logic;
        tx_ack          : in  std_logic;
        tx_collision    : in  std_logic;
        tx_retransmit   : in  std_logic;
        overflow        : out std_logic;
        -- LocalLink Interface
        wr_clk          : in  std_logic;
        wr_sreset       : in  std_logic;  -- synchronous reset (write_clock)
        wr_data         : in  std_logic_vector(7 downto 0);
        wr_sof_n        : in  std_logic;
        wr_eof_n        : in  std_logic;
        wr_src_rdy_n    : in  std_logic;
        wr_dst_rdy_n    : out std_logic;
        wr_fifo_status  : out std_logic_vector(3 downto 0)
      );
   end component tx_client_fifo_8;

   component rx_client_fifo_8
     port (
        -- LocalLink Interface
        rd_clk          : in  std_logic;
        rd_sreset       : in  std_logic;
        rd_data_out     : out std_logic_vector(7 downto 0);
        rd_sof_n        : out std_logic;
        rd_eof_n        : out std_logic;
        rd_src_rdy_n    : out std_logic;
        rd_dst_rdy_n    : in  std_logic;
        rx_fifo_status  : out std_logic_vector(3 downto 0);
         -- Client Interface
        wr_sreset       : in  std_logic;
        wr_clk          : in  std_logic;
        wr_enable       : in  std_logic;
        rx_data         : in  std_logic_vector(7 downto 0);
        rx_data_valid   : in  std_logic;
        rx_good_frame   : in  std_logic;
        rx_bad_frame    : in  std_logic;
        overflow        : out std_logic
      );
   end component rx_client_fifo_8;


begin

   tx_underrun <= '0';

   -- Transmitter FIFO
   tx_fifo_i : tx_client_fifo_8
     generic map (
        FULL_DUPLEX_ONLY => FULL_DUPLEX_ONLY)
     port map (
        rd_clk           => tx_clk,
        rd_sreset        => tx_reset,
        rd_enable        => tx_enable,
        tx_data          => tx_data,
        tx_data_valid    => tx_data_valid,
        tx_ack           => tx_ack,
        tx_collision     => tx_collision,
        tx_retransmit    => tx_retransmit,
        overflow         => tx_overflow,
        wr_clk           => tx_ll_clock,
        wr_sreset        => tx_ll_reset,
        wr_data          => tx_ll_data_in,
        wr_sof_n         => tx_ll_sof_in_n,
        wr_eof_n         => tx_ll_eof_in_n,
        wr_src_rdy_n     => tx_ll_src_rdy_in_n,
        wr_dst_rdy_n     => tx_ll_dst_rdy_out_n,
        wr_fifo_status   => tx_fifo_status
   );

   -- Receiver FIFO
   rx_fifo_i : rx_client_fifo_8
     port map (
        wr_clk          => rx_clk,
        wr_enable       => rx_enable,
        wr_sreset       => rx_reset,
        rx_data         => rx_data,
        rx_data_valid   => rx_data_valid,
        rx_good_frame   => rx_good_frame,
        rx_bad_frame    => rx_bad_frame,
        overflow        => rx_overflow,
        rd_clk          => rx_ll_clock,
        rd_sreset       => rx_ll_reset,
        rd_data_out     => rx_ll_data_out,
        rd_sof_n        => rx_ll_sof_out_n,
        rd_eof_n        => rx_ll_eof_out_n,
        rd_src_rdy_n    => rx_ll_src_rdy_out_n,
        rd_dst_rdy_n    => rx_ll_dst_rdy_in_n,
        rx_fifo_status  => rx_fifo_status
   );

end RTL;
