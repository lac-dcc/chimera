--------------------------------------------------------------------------------
-- File       : gmii_to_sgmii_support.vhd
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
-- Description: This module holds the support level for the pcs/pma core
--              This can be used as-is in a single core design, or adapted
--              for use with multi-core implementations
--
--
--
library unisim;
use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


--------------------------------------------------------------------------------
-- The Entity declaration for the Core Block wrapper.
--------------------------------------------------------------------------------

entity gmii_to_sgmii_support is
  generic ( EXAMPLE_SIMULATION                      : integer   := 0 );
   port (

      gtrefclk_p               : in  std_logic;                         
      gtrefclk_n               : in  std_logic;                         

      gtrefclk_out             : out std_logic;                         
      gtrefclk_bufg_out        : out std_logic; 
      txp                      : out std_logic;                    -- Differential +ve of serial transmission from PMA to PMD.
      txn                      : out std_logic;                    -- Differential -ve of serial transmission from PMA to PMD.
      rxp                      : in std_logic;                     -- Differential +ve for serial reception from PMD to PMA.
      rxn                      : in std_logic;                     -- Differential -ve for serial reception from PMD to PMA.
      userclk_out              : out std_logic;                        
      userclk2_out             : out std_logic;                        
      rxuserclk_out            : out std_logic;                        
      rxuserclk2_out           : out std_logic;                        
      pma_reset_out            : out std_logic;                           -- transceiver PMA reset signal
      mmcm_locked_out          : out std_logic;                           -- MMCM Locked
      
      resetdone                : out std_logic;

      independent_clock_bufg   : in std_logic;                 
      -- GMII Interface
      -----------------
      sgmii_clk_r              : out std_logic;                 
      sgmii_clk_f              : out std_logic;                 
      sgmii_clk_en             : out std_logic;                    -- Clock enable for client MAC
      gmii_txd                 : in std_logic_vector(7 downto 0);  -- Transmit data from client MAC.
      gmii_tx_en               : in std_logic;                     -- Transmit control signal from client MAC.
      gmii_tx_er               : in std_logic;                     -- Transmit control signal from client MAC.
      gmii_rxd                 : out std_logic_vector(7 downto 0); -- Received Data to client MAC.
      gmii_rx_dv               : out std_logic;                    -- Received control signal to client MAC.
      gmii_rx_er               : out std_logic;                    -- Received control signal to client MAC.
      gmii_isolate             : out std_logic;                    -- Tristate control to electrically isolate GMII.

      -- Management: Alternative to MDIO Interface
      --------------------------------------------

      configuration_vector     : in std_logic_vector(4 downto 0);  -- Alternative to MDIO interface.

      an_interrupt             : out std_logic;                    -- Interrupt to processor to signal that Auto-Negotiation has completed
      an_adv_config_vector     : in std_logic_vector(15 downto 0); -- Alternate interface to program REG4 (AN ADV)
      an_restart_config        : in std_logic;                     -- Alternate signal to modify AN restart bit in REG0

      -- Speed Control
      ----------------
      speed_is_10_100          : in std_logic;                     -- Core should operate at either 10Mbps or 100Mbps speeds
      speed_is_100             : in std_logic;                      -- Core should operate at 100Mbps speed

      -- General IO's
      ---------------
      status_vector            : out std_logic_vector(15 downto 0); -- Core status.
      reset                    : in std_logic;                     -- Asynchronous reset for entire core.

      
      signal_detect            : in std_logic;                      -- Input from PMD to indicate presence of optical input.
      gt0_qplloutclk_out       : out std_logic;
      gt0_qplloutrefclk_out    : out std_logic

   );
end gmii_to_sgmii_support;

architecture wrapper of gmii_to_sgmii_support is

   attribute DowngradeIPIdentifiedWarnings: string;
   attribute DowngradeIPIdentifiedWarnings of wrapper : architecture is "yes";

   component gmii_to_sgmii_block
   generic
   (
      EXAMPLE_SIMULATION                      : integer   := 0
   );   
 
   port (
      -- Transceiver Interface
      ---------------------
      gtrefclk             : in std_logic;                    
      gtrefclk_bufg        : in std_logic; 
      txp                  : out std_logic;                    -- Differential +ve of serial transmission from PMA to PMD.
      txn                  : out std_logic;                    -- Differential -ve of serial transmission from PMA to PMD.
      rxp                  : in std_logic;                     -- Differential +ve for serial reception from PMD to PMA.
      rxn                  : in std_logic;                     -- Differential -ve for serial reception from PMD to PMA.

      txoutclk             : out std_logic;                   
      rxoutclk             : out std_logic;                   
      resetdone            : out std_logic;                    -- The GT transceiver has completed its reset cycle
      cplllock             : out std_logic;                    
      mmcm_reset           : out std_logic;                    
      mmcm_locked          : in std_logic;                     -- Locked indication from MMCM
      userclk              : in std_logic;                    
      userclk2             : in std_logic;                    
      rxuserclk              : in std_logic;                  
      rxuserclk2             : in std_logic;                  
      independent_clock_bufg : in std_logic;                  
      pma_reset            : in std_logic;                     -- transceiver PMA reset signal
      -- GMII Interface
      -----------------
      sgmii_clk_r            : out std_logic;                    -- Clock for client MAC 
      sgmii_clk_f            : out std_logic;                    -- Clock for client MAC 
      sgmii_clk_en           : out std_logic;                    -- Clock enable for client MAC
      gmii_txd             : in std_logic_vector(7 downto 0);  -- Transmit data from client MAC.
      gmii_tx_en           : in std_logic;                     -- Transmit control signal from client MAC.
      gmii_tx_er           : in std_logic;                     -- Transmit control signal from client MAC.
      gmii_rxd             : out std_logic_vector(7 downto 0); -- Received Data to client MAC.
      gmii_rx_dv           : out std_logic;                    -- Received control signal to client MAC.
      gmii_rx_er           : out std_logic;                    -- Received control signal to client MAC.
      gmii_isolate         : out std_logic;                    -- Tristate control to electrically isolate GMII.

      -- Management: Alternative to MDIO Interface
      --------------------------------------------

      configuration_vector : in std_logic_vector(4 downto 0);  -- Alternative to MDIO interface.


      an_interrupt         : out std_logic;                    -- Interrupt to processor to signal that Auto-Negotiation has completed
      an_adv_config_vector : in std_logic_vector(15 downto 0); -- Alternate interface to program REG4 (AN ADV)
      an_restart_config    : in std_logic;                     -- Alternate signal to modify AN restart bit in REG0

      -- Speed Control
      ----------------
      speed_is_10_100      : in std_logic;                     -- Core should operate at either 10Mbps or 100Mbps speeds
      speed_is_100         : in std_logic;                      -- Core should operate at 100Mbps speed


      -- General IO's
      ---------------
      status_vector        : out std_logic_vector(15 downto 0); -- Core status.
      reset                : in std_logic;                     -- Asynchronous reset for entire core.
      
      signal_detect             : in std_logic;                      -- Input from PMD to indicate presence of optical input.

    gt0_qplloutclk_in                          : in   std_logic;
    gt0_qplloutrefclk_in                       : in   std_logic
   );
end component;


component gmii_to_sgmii_clocking
   port (
      gtrefclk_p              : in  std_logic;                -- Differential +ve of reference clock for MGT
      gtrefclk_n              : in  std_logic;                -- Differential -ve of reference clock for MGT
      txoutclk                : in  std_logic;                -- txoutclk from GT transceiver.
      rxoutclk                : in  std_logic;                -- txoutclk from GT transceiver.
      mmcm_reset              : in  std_logic;                -- MMCM Reset
      gtrefclk                : out std_logic;                -- gtrefclk routed through an IBUFDS.
      gtrefclk_bufg           : out std_logic;
      mmcm_locked             : out std_logic;                -- MMCM locked
      userclk                 : out std_logic;                -- for GT PMA reference clock
      userclk2                : out std_logic;                 
      rxuserclk               : out std_logic;                -- for GT PMA reference clock
      rxuserclk2              : out std_logic                 
   );
end component;

component gmii_to_sgmii_resets
   port (
    reset                    : in  std_logic;                -- Asynchronous reset for entire core.
    independent_clock_bufg   : in  std_logic;                -- System clock 
    pma_reset                : out std_logic                 -- Synchronous transcevier PMA reset
   );
end component;

component gmii_to_sgmii_gt_common
  port(
    GTREFCLK0_IN         : in std_logic;
    QPLLLOCK_OUT         : out std_logic;
    QPLLLOCKDETCLK_IN    : in std_logic;
    QPLLOUTCLK_OUT       : out std_logic;
    QPLLOUTREFCLK_OUT    : out std_logic;
    QPLLREFCLKLOST_OUT   : out std_logic;    
    QPLLRESET_IN         : in std_logic
  );
end component;


   -- GT Interface
   ----------------
   SIGNAL gt0_qplloutclk     : std_logic;
   SIGNAL gt0_qplloutrefclk  : std_logic;
   SIGNAL cplllock              : std_logic;
   SIGNAL mmcm_reset            : std_logic;
   SIGNAL txoutclk              : std_logic;
   SIGNAL rxoutclk              : std_logic;
   SIGNAL gtrefclk              : std_logic;
   SIGNAL gtrefclk_bufg         : std_logic;
   SIGNAL mmcm_locked           : std_logic;
   SIGNAL userclk               : std_logic;
   SIGNAL userclk2              : std_logic;
   SIGNAL rxuserclk             : std_logic;
   SIGNAL rxuserclk2            : std_logic;
   SIGNAL pma_reset             : std_logic;
begin

   -----------------------------------------------------------------------------
   -- Component Instantiation for the SGMII adaptation module
   -----------------------------------------------------------------------------


   pcs_pma_block_i : gmii_to_sgmii_block generic map ( EXAMPLE_SIMULATION            => EXAMPLE_SIMULATION)
      port map(
      -- Transceiver Interface
      ---------------------

 
      gtrefclk        => gtrefclk,
      gtrefclk_bufg   => gtrefclk_bufg,
      txp             => txp  ,           
      txn             => txn  ,           
      rxp             => rxp  ,           
      rxn             => rxn  ,           

      txoutclk            =>  txoutclk    ,        
      rxoutclk            =>  rxoutclk    ,        
      resetdone           =>  resetdone   ,        
      cplllock            =>  cplllock   ,        
      mmcm_reset          =>  mmcm_reset ,        
      mmcm_locked         =>  mmcm_locked ,        
      userclk             =>  userclk     ,        
      userclk2            =>  userclk2    ,        
      rxuserclk             =>  rxuserclk     ,        
      rxuserclk2            =>  rxuserclk2    ,        
      independent_clock_bufg => independent_clock_bufg,
      pma_reset           =>    pma_reset,
      -- GMII Interface
      -----------------
      sgmii_clk_r          => sgmii_clk_r,          
      sgmii_clk_f          => sgmii_clk_f,          
      sgmii_clk_en         => sgmii_clk_en,
      gmii_txd           =>  gmii_txd    ,       
      gmii_tx_en         =>  gmii_tx_en  ,       
      gmii_tx_er         =>  gmii_tx_er  ,       
      gmii_rxd           =>  gmii_rxd    ,       
      gmii_rx_dv         =>  gmii_rx_dv  ,       
      gmii_rx_er         =>  gmii_rx_er  ,       
      gmii_isolate       =>  gmii_isolate,       

      -- Management: Alternative to MDIO Interface
      --------------------------------------------

      configuration_vector => configuration_vector,


      an_interrupt        =>  an_interrupt        ,
      an_adv_config_vector => an_adv_config_vector,
      an_restart_config    => an_restart_config,

      -- Speed Control
      ----------------
      speed_is_10_100    =>speed_is_10_100   , 
      speed_is_100       =>speed_is_100      , 

      -- General IO's
      ---------------
      status_vector          =>  status_vector   ,  
      reset                  =>  pma_reset           , 
      
      signal_detect       =>  signal_detect   , 

    gt0_qplloutclk_in     => gt0_qplloutclk,
    gt0_qplloutrefclk_in  => gt0_qplloutrefclk

   );


   core_clocking_i : gmii_to_sgmii_clocking
   port map(
      gtrefclk_p                => gtrefclk_p,
      gtrefclk_n                => gtrefclk_n,
      txoutclk                  => txoutclk,
      rxoutclk                  => rxoutclk,
      mmcm_reset                => mmcm_reset,
      gtrefclk                   =>  gtrefclk,
      gtrefclk_bufg              =>  gtrefclk_bufg,
      mmcm_locked                =>  mmcm_locked,
      userclk                    =>  userclk,
      userclk2                   =>  userclk2,
      rxuserclk                  =>  rxuserclk,
      rxuserclk2                 =>  rxuserclk2
   );

   gtrefclk_out        <= gtrefclk;
   gtrefclk_bufg_out   <= gtrefclk_bufg;
   userclk_out         <= userclk;
   userclk2_out        <= userclk2;

   rxuserclk_out       <= rxuserclk;
   rxuserclk2_out      <= rxuserclk2;
   pma_reset_out       <= pma_reset;
   
   core_resets_i : gmii_to_sgmii_resets
   port map (
      reset                     => reset, 
      independent_clock_bufg    => independent_clock_bufg,
      pma_reset                 => pma_reset
   );


  core_gt_common_i : gmii_to_sgmii_gt_common
  port map(
    GTREFCLK0_IN                => gtrefclk ,
    QPLLLOCK_OUT                => open,
    QPLLLOCKDETCLK_IN           => independent_clock_bufg,
    QPLLOUTCLK_OUT              => gt0_qplloutclk,
    QPLLOUTREFCLK_OUT           => gt0_qplloutrefclk,
    QPLLREFCLKLOST_OUT          => open,    
    QPLLRESET_IN                => pma_reset 
  );

   gt0_qplloutclk_out        <=  gt0_qplloutclk;
   gt0_qplloutrefclk_out     <=  gt0_qplloutrefclk;
   mmcm_locked_out           <= mmcm_locked;
end wrapper;
