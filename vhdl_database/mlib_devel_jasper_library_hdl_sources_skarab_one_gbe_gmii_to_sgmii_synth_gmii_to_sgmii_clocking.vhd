--------------------------------------------------------------------------------
-- File       : gmii_to_sgmii_clocking.vhd
-- Author     : Xilinx Inc.
--------------------------------------------------------------------------------
-- (c) Copyright 2011 Xilinx, Inc. All rights reserved.
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
-- 
--------------------------------------------------------------------------------
-- Description: This module holds the Clocking logic for pcs/pma core. 


library unisim;
use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;


--------------------------------------------------------------------------------
-- The entity declaration for the example design
--------------------------------------------------------------------------------

entity gmii_to_sgmii_clocking is
   port (
      gtrefclk_p              : in  std_logic;                -- Differential +ve of reference clock for MGT: 125MHz, very high quality.
      gtrefclk_n              : in  std_logic;                -- Differential -ve of reference clock for MGT: 125MHz, very high quality.
      txoutclk                : in  std_logic;                -- txoutclk from GT transceiver.
      rxoutclk                : in  std_logic;                -- rxoutclk from GT transceiver.
      mmcm_reset              : in  std_logic;                -- MMCM Reset
      
      gtrefclk                : out std_logic;                -- gtrefclk routed through an IBUFG.
      gtrefclk_bufg           : out std_logic;                -- gtrefclk routed through a BUFG for driving logic.     
      mmcm_locked             : out std_logic;                -- MMCM locked
      userclk                 : out std_logic;                -- for GT PMA reference clock
      userclk2                : out std_logic;                 -- 125MHz clock for core reference clock.
      rxuserclk               : out std_logic;                -- for GT PMA reference clock
      rxuserclk2              : out std_logic                 -- 125MHz clock for core reference clock.
   );
end gmii_to_sgmii_clocking;

architecture top_level of gmii_to_sgmii_clocking is

  ------------------------------------------------------------------------------
  -- internal signals used in this entity.
  ------------------------------------------------------------------------------

   -- clock generation signals for tranceiver
   signal  clkout0                : std_logic;   -- MMCM output clock
   signal  clkout1                : std_logic;   -- MMCM output clock
   signal  clkfbout               : std_logic;   -- MMCM Feeback clock
  signal txoutclk_bufg         : std_logic;      -- txoutclk from GT transceiver routed onto global routing.

  signal userclk_i : std_logic;

   signal rxoutclk_buf   : std_logic;

   signal gtrefclk_i     : std_logic;

begin


   -----------------------------------------------------------------------------
   -- Transceiver Clock Management
   -----------------------------------------------------------------------------

   -- Clock circuitry for the Transceiver uses a differential input clock.
   -- gtrefclk is routed to the tranceiver.
   ibufds_gtrefclk : IBUFDS_GTE2
   port map (
      I     => gtrefclk_p,
      IB    => gtrefclk_n,
      CEB   => '0',
      O     => gtrefclk_i,
      ODIV2 => open
   );
   
   gtrefclk <= gtrefclk_i;

   -- Route gtrefclk through a BUFG
   bufg_gtrefclk : BUFG
   port map (
      I         => gtrefclk_i,
      O         => gtrefclk_bufg
   );
   -- Route txoutclk input through a BUFG
   bufg_txoutclk : BUFG
   port map (
      I         => txoutclk,
      O         => txoutclk_bufg
   );


  -- The GT transceiver provides a 62.5MHz clock to the FPGA fabrix.  This is 
  -- routed to an MMCM module where it is used to create phase and frequency
  -- related 62.5MHz and 125MHz clock sources
  mmcm_adv_inst : MMCME2_ADV
  generic map
   (BANDWIDTH            => "OPTIMIZED",
    CLKOUT4_CASCADE      => FALSE,
    COMPENSATION         => "ZHOLD",
    STARTUP_WAIT         => FALSE,
    DIVCLK_DIVIDE        => 1,
    CLKFBOUT_PHASE       => 0.000,
    CLKFBOUT_USE_FINE_PS => FALSE,
    CLKOUT0_PHASE        => 0.000,
    CLKOUT0_DUTY_CYCLE   => 0.5,
    CLKOUT0_USE_FINE_PS  => FALSE,
    CLKOUT1_PHASE        => 0.000,
    CLKOUT1_DUTY_CYCLE   => 0.5,
    CLKOUT1_USE_FINE_PS  => FALSE,
    CLKIN1_PERIOD        => 16.0,
    CLKFBOUT_MULT_F      => 16.000,
    CLKOUT0_DIVIDE_F     => 8.000,
    CLKOUT1_DIVIDE       => 16,
            
    REF_JITTER1          => 0.010)
  port map
    -- Output clocks
   (CLKFBOUT             => clkfbout,
    CLKFBOUTB            => open,
    CLKOUT0              => clkout0,
    CLKOUT0B             => open,
    CLKOUT1              => clkout1,
    CLKOUT1B             => open,
    CLKOUT2              => open,
    CLKOUT2B             => open,
    CLKOUT3              => open,
    CLKOUT3B             => open,
    CLKOUT4              => open,
    CLKOUT5              => open,
    CLKOUT6              => open,
    -- Input clock control
    CLKFBIN              => clkfbout,
    CLKIN1               => txoutclk_bufg,
    CLKIN2               => '0',
    -- Tied to always select the primary input clock
    CLKINSEL             => '1',
    -- Ports for dynamic reconfiguration
    DADDR                => (others => '0'),
    DCLK                 => '0',
    DEN                  => '0',
    DI                   => (others => '0'),
    DO                   => open,
    DRDY                 => open,
    DWE                  => '0',
    -- Ports for dynamic phase shift
    PSCLK                => '0',
    PSEN                 => '0',
    PSINCDEC             => '0',
    PSDONE               => open,
    -- Other control and status signals
    LOCKED               => mmcm_locked,
    CLKINSTOPPED         => open,
    CLKFBSTOPPED         => open,
    PWRDWN               => '0',
    RST                  => mmcm_reset);

   -- This 62.5MHz clock is placed onto global clock routing and is then used
   -- for tranceiver TXUSRCLK/RXUSRCLK.
   bufg_userclk: BUFG
   port map (
      I     => clkout1,
      O     => userclk_i
   );    


   -- This 125MHz clock is placed onto global clock routing and is then used
   -- to clock all Ethernet core logic.
   bufg_userclk2: BUFG
   port map (
      I     => clkout0,
      O     => userclk2
   );    




userclk <= userclk_i;


   -- Place the Rx recovered clock on a Global Clock Buffer (it may be possible
   -- to switch this for a BUFHCE/BUR and BUFMR combination)
   rxrecclkbufg : BUFG port map (
     I   => rxoutclk,
     O   => rxoutclk_buf
   );     

     rxuserclk2 <= rxoutclk_buf;
     rxuserclk  <= rxoutclk_buf;



   
end top_level;
