-- (c) Copyright 2009 - 2012 Xilinx, Inc. All rights reserved.
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

--***********************************Entity Declaration*******************************
entity ten_gig_eth_pcs_pma_v2_5_GT_USRCLK_SOURCE is
port
(
    --Q1_CLK0_GTREFCLK_PAD_N_IN               : in   std_logic;
    --Q1_CLK0_GTREFCLK_PAD_P_IN               : in   std_logic;
    --Q1_CLK0_GTREFCLK_OUT                    : out  std_logic;
 
    GT0_TXUSRCLK_OUT             : out std_logic;
    GT0_TXUSRCLK2_OUT            : out std_logic;
    GT0_TXOUTCLK_IN              : in  std_logic;
    GT0_RXUSRCLK_OUT             : out std_logic;
    GT0_RXUSRCLK2_OUT            : out std_logic;
    GT0_RXOUTCLK_IN              : in  std_logic;
    DRPCLK_IN                          : in  std_logic;
    DRPCLK_OUT                         : out std_logic
);


end ten_gig_eth_pcs_pma_v2_5_GT_USRCLK_SOURCE;

architecture RTL of ten_gig_eth_pcs_pma_v2_5_GT_USRCLK_SOURCE is


--*********************************Wire Declarations**********************************

    signal   tied_to_ground_i     :   std_logic;
    signal   tied_to_vcc_i        :   std_logic;
 
    signal   gt0_txoutclk_i :   std_logic;
    signal   gt0_rxoutclk_i :   std_logic;

    
    -- signal   q1_clk0_gtrefclk :   std_logic;

    signal  gt0_txusrclk_i                  : std_logic;
    signal  gt0_rxusrclk_i                  : std_logic;

begin

--*********************************** Beginning of Code *******************************

    --  Static signal Assigments    
    tied_to_ground_i         <= '0';
    tied_to_vcc_i            <= '1';
    gt0_txoutclk_i                               <= GT0_TXOUTCLK_IN;
    gt0_rxoutclk_i                               <= GT0_RXOUTCLK_IN;

    
    -- Q1_CLK0_GTREFCLK_OUT                         <= q1_clk0_gtrefclk;

    -- --IBUFDS_GTE2
    -- ibufds_instq1_clk0 : IBUFDS_GTE2  
    -- generic map(CLKSWING_CFG => "11")
    -- port map
    -- (
    --     O               => 	q1_clk0_gtrefclk,
    --     ODIV2           => 	open,
    --     CEB             => 	tied_to_ground_i,
    --     I               => 	Q1_CLK0_GTREFCLK_PAD_P_IN,
    --     IB              => 	Q1_CLK0_GTREFCLK_PAD_N_IN
    -- );

    
    txoutclk_bufg0_i : BUFG
    port map
    (
        I                               =>      gt0_txoutclk_i,
        O                               =>      gt0_txusrclk_i
    );


    rxoutclk_bufg1_i : BUFG
    port map
    (
        I                               =>      gt0_rxoutclk_i,
        O                               =>      gt0_rxusrclk_i
    );

 
    GT0_TXUSRCLK_OUT                             <= gt0_txusrclk_i;
    GT0_TXUSRCLK2_OUT                            <= gt0_txusrclk_i;
    GT0_RXUSRCLK_OUT                             <= gt0_rxusrclk_i;
    GT0_RXUSRCLK2_OUT                            <= gt0_rxusrclk_i;
    
end RTL;
 
