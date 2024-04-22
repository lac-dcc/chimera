-------------------------------------------------------------------------------
-- Title      :Block level wrapper
-- Project    : 10GBASE-R
-------------------------------------------------------------------------------
-- File       : ten_gig_eth_pcs_pma_v2_5_block.vhd
-------------------------------------------------------------------------------
-- Description: This file is a wrapper for the 10GBASE-R core. It contains the 
-- 10GBASE-R core, the transceivers and some transceiver logic.
-------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_unsigned.all;
--use ieee.numeric_std.all;

entity ten_gig_eth_pcs_pma_v2_5_block is
    generic (
      EXAMPLE_SIM_GTRESET_SPEEDUP : string    := "FALSE"
      );
    port (
      -- refclk_n         : in  std_logic;
      -- refclk_p         : in  std_logic;
      REF_CLK_IN       : in  std_logic;  -- 156.25 MHz MGT_REF_CLK in (after LVDS Buffer)
      clk156           : out std_logic;
      txclk322         : out std_logic;
      rxclk322         : out std_logic;
      dclk             : out std_logic;
      areset           : in  std_logic;
      reset            : in  std_logic;
      txreset322       : in  std_logic;
      rxreset322       : in  std_logic;
      dclk_reset       : in  std_logic;
      txp              : out std_logic;
      txn              : out std_logic;
      rxp              : in  std_logic;
      rxn              : in  std_logic;
      xgmii_txd        : in  std_logic_vector(63 downto 0);
      xgmii_txc        : in  std_logic_vector(7 downto 0);
      xgmii_rxd        : out std_logic_vector(63 downto 0);
      xgmii_rxc        : out std_logic_vector(7 downto 0);
      mdc              : in  std_logic;
      mdio_in          : in  std_logic;
      mdio_out         : out std_logic;
      mdio_tri         : out std_logic;
      prtad            : in  std_logic_vector(4 downto 0);
      core_status      : out std_logic_vector(7 downto 0);    
      tx_resetdone     : out std_logic;
      rx_resetdone     : out std_logic;
      signal_detect    : in  std_logic;
      tx_fault         : in  std_logic;
      tx_disable       : out std_logic
      );
end ten_gig_eth_pcs_pma_v2_5_block;

-- library ieee;
-- use ieee.numeric_std.all;
-- use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

architecture wrapper of ten_gig_eth_pcs_pma_v2_5_block is

----------------------------------------------------------------------------
-- Component Declaration for the 10GBASE-R core.
----------------------------------------------------------------------------

  component ten_gig_eth_pcs_pma_v2_5 
    port(
      reset                : in  std_logic;
      txreset322           : in  std_logic;
      rxreset322           : in  std_logic;
      dclk_reset           : in  std_logic;
      pma_resetout         : out std_logic;
      pcs_resetout         : out std_logic;
      clk156               : in  std_logic;
      txusrclk2            : in  std_logic;
      rxusrclk2            : in  std_logic;
      dclk                 : in  std_logic;       
      xgmii_txd            : in  std_logic_vector(63 downto 0);
      xgmii_txc            : in  std_logic_vector(7 downto 0);
      xgmii_rxd            : out std_logic_vector(63 downto 0);
      xgmii_rxc            : out std_logic_vector(7 downto 0);
      mdc                  : in  std_logic;
      mdio_in              : in  std_logic;
      mdio_out             : out std_logic;
      mdio_tri             : out std_logic;
      prtad                : in  std_logic_vector(4 downto 0);
      core_status          : out std_logic_vector(7 downto 0);
      pma_pmd_type         : in std_logic_vector(2 downto 0);
      drp_req              : out std_logic;
      drp_gnt              : in  std_logic;                            
      drp_den              : out std_logic;                                   
      drp_dwe              : out std_logic;
      drp_daddr            : out std_logic_vector(15 downto 0);                   
      drp_di               : out std_logic_vector(15 downto 0); 
      drp_drdy             : in  std_logic;                
      drp_drpdo            : in  std_logic_vector(15 downto 0);
      gt_txd               : out std_logic_vector(31 downto 0);
      gt_txc               : out std_logic_vector(7 downto 0);
      gt_rxd               : in  std_logic_vector(31 downto 0);
      gt_rxc               : in  std_logic_vector(7 downto 0);
      gt_slip              : out std_logic;
      resetdone            : in  std_logic;
      signal_detect        : in  std_logic;
      tx_fault             : in  std_logic;
      tx_disable           : out std_logic;
      tx_prbs31_en         : out std_logic;
      rx_prbs31_en         : out std_logic;
      clear_rx_prbs_err_count        : out  std_logic;
      loopback_ctrl        : out std_logic_vector(2 downto 0));
  end component;

  component ten_gig_eth_pcs_pma_v2_5_GT_USRCLK_SOURCE 
  port
  (
      -- Q1_CLK0_GTREFCLK_PAD_N_IN               : in   std_logic;
      -- Q1_CLK0_GTREFCLK_PAD_P_IN               : in   std_logic;
      -- Q1_CLK0_GTREFCLK_OUT                    : out  std_logic;
   
      GT0_TXUSRCLK_OUT             : out std_logic;
      GT0_TXUSRCLK2_OUT            : out std_logic;
      GT0_TXOUTCLK_IN              : in  std_logic;
      GT0_RXUSRCLK_OUT             : out std_logic;
      GT0_RXUSRCLK2_OUT            : out std_logic;
      GT0_RXOUTCLK_IN              : in  std_logic;
  
      DRPCLK_IN                          : in  std_logic;
      DRPCLK_OUT                         : out std_logic
  );
  end component;

 --------------------------------------------------------------------------
 -- Component declaration for the GTX transceiver container
 --------------------------------------------------------------------------

  component ten_gig_eth_pcs_pma_v2_5_GTWIZARD_10GBASER 
  generic
  (
     -- Simulation attributes
     WRAPPER_SIM_GTRESET_SPEEDUP    : string    := "FALSE" -- Set to 1 to speed up sim reset
  );
  port
  (
    --_________________________________________________________________________
    --_________________________________________________________________________
    --GT0  (X0Y4)
    --____________________________CHANNEL PORTS________________________________
   
    ---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
    GT0_DRPADDR_IN                          : in   std_logic_vector(8 downto 0);
    GT0_DRPCLK_IN                           : in   std_logic;
    GT0_DRPDI_IN                            : in   std_logic_vector(15 downto 0);
    GT0_DRPDO_OUT                           : out  std_logic_vector(15 downto 0);
    GT0_DRPEN_IN                            : in   std_logic;
    GT0_DRPRDY_OUT                          : out  std_logic;
    GT0_DRPWE_IN                            : in   std_logic;
    ------------------------------- Eye Scan Ports -----------------------------
    GT0_EYESCANDATAERROR_OUT                : out  std_logic;
    ------------------------ Loopback and Powerdown Ports ----------------------
    GT0_LOOPBACK_IN                         : in   std_logic_vector(2 downto 0);
    ------------------------------- Receive Ports ------------------------------
    GT0_RXUSERRDY_IN                        : in   std_logic;
    -------------- Receive Ports - 64b66b and 64b67b Gearbox Ports -------------
    GT0_RXDATAVALID_OUT                     : out  std_logic;
    GT0_RXGEARBOXSLIP_IN                    : in   std_logic;
    GT0_RXHEADER_OUT                        : out  std_logic_vector(1 downto 0);
    GT0_RXHEADERVALID_OUT                   : out  std_logic;
    ----------------------- Receive Ports - PRBS Detection ---------------------
    GT0_RXPRBSCNTRESET_IN                   : in   std_logic;
    GT0_RXPRBSERR_OUT                       : out  std_logic;
    GT0_RXPRBSSEL_IN                        : in   std_logic_vector(2 downto 0);
    ------------------- Receive Ports - RX Data Path interface -----------------
    GT0_GTRXRESET_IN                        : in   std_logic;
    GT0_RXDATA_OUT                          : out  std_logic_vector(31 downto 0);
    GT0_RXOUTCLK_OUT                        : out  std_logic;
    GT0_RXPCSRESET_IN                       : in   std_logic;
    GT0_RXUSRCLK_IN                         : in   std_logic;
    GT0_RXUSRCLK2_IN                        : in   std_logic;
    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    GT0_GTXRXN_IN                           : in   std_logic;
    GT0_GTXRXP_IN                           : in   std_logic;
    GT0_RXCDRLOCK_OUT                       : out  std_logic;
    GT0_RXELECIDLE_OUT                      : out  std_logic;
    GT0_RXLPMEN_IN                          : in   std_logic;
    -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    GT0_RXBUFRESET_IN                       : in   std_logic;
    GT0_RXBUFSTATUS_OUT                     : out  std_logic_vector(2 downto 0);
    ------------------------ Receive Ports - RX PLL Ports ----------------------
    GT0_RXRESETDONE_OUT                     : out  std_logic;
    ------------------------------- Transmit Ports -----------------------------
    GT0_TXUSERRDY_IN                        : in   std_logic;
    -------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
    GT0_TXHEADER_IN                         : in   std_logic_vector(1 downto 0);
    GT0_TXSEQUENCE_IN                       : in   std_logic_vector(6 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    GT0_GTTXRESET_IN                        : in   std_logic;
    GT0_TXDATA_IN                           : in   std_logic_vector(31 downto 0);
    GT0_TXOUTCLK_OUT                        : out  std_logic;
    GT0_TXOUTCLKFABRIC_OUT                  : out  std_logic;
    GT0_TXOUTCLKPCS_OUT                     : out  std_logic;
    GT0_TXPCSRESET_IN                       : in   std_logic;
    GT0_TXUSRCLK_IN                         : in   std_logic;
    GT0_TXUSRCLK2_IN                        : in   std_logic;
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    GT0_GTXTXN_OUT                          : out  std_logic;
    GT0_GTXTXP_OUT                          : out  std_logic;
    GT0_TXINHIBIT_IN                        : in   std_logic;
    GT0_TXPRECURSOR_IN                      : in   std_logic_vector(4 downto 0);
    GT0_TXPOSTCURSOR_IN                     : in   std_logic_vector(4 downto 0);
    GT0_TXMAINCURSOR_IN                     : in   std_logic_vector(6 downto 0);
    ----------------------- Transmit Ports - TX PLL Ports ----------------------
    GT0_TXRESETDONE_OUT                     : out  std_logic;
    --------------------- Transmit Ports - TX PRBS Generator -------------------
    GT0_TXPRBSSEL_IN                        : in   std_logic_vector(2 downto 0);
    ---------------------- Common Block  - Ref Clock Ports ---------------------
    GT0_GTREFCLK0_COMMON_IN                 : in   std_logic;
    ------------------------- Common Block - QPLL Ports ------------------------
    GT0_QPLLLOCK_OUT                        : out  std_logic;
    GT0_QPLLLOCKDETCLK_IN                   : in   std_logic;
    GT0_QPLLREFCLKLOST_OUT                  : out  std_logic;
    GT0_QPLLRESET_IN                        : in   std_logic
  
  
  );
  end component;

----------------------------------------------------------------------------
-- Signal declarations.
---------------------------------------------------------------------------
  
  signal gt_txd : std_logic_vector(31 downto 0);
  signal gt_txc : std_logic_vector(7 downto 0);
  signal gt_rxd : std_logic_vector(31 downto 0);
  signal gt_rxc : std_logic_vector(7 downto 0);

  signal gt_rxd_d1 : std_logic_vector(31 downto 0);
  signal gt_rxc_d1 : std_logic_vector(7 downto 0);  

  signal tx_prbs31_en : std_logic;
  signal rx_prbs31_en : std_logic;
  
  signal pma_resetout : std_logic;
  signal pcs_resetout : std_logic;

  signal drp_req       : std_logic;
  signal drp_gnt       : std_logic;
  signal gt0_drpen_i   : std_logic;
  signal gt0_drpwe_i   : std_logic;
  signal gt0_drprdy_i  : std_logic;
  signal gt0_drpdi_i   : std_logic_vector(15 downto 0);
  signal gt0_drpaddr_i : std_logic_vector(15 downto 0);
  signal gt0_drpdo_i   : std_logic_vector(15 downto 0);
  
  signal gt0_clear_rx_prbs_err_count_i : std_logic;
  signal gt0_rxprbserr_i : std_logic;
  signal gt0_rxprbssel_i : std_logic_vector(2 downto 0);
  signal gt0_txprbssel_i : std_logic_vector(2 downto 0);
  signal gt0_rxgearboxslip_i : std_logic;
  signal gt0_loopback_i : std_logic_vector(2 downto 0);
  
  -- signal Q1_CLK0_GTREFCLK_PAD_N_IN : std_logic;
  -- signal Q1_CLK0_GTREFCLK_PAD_P_IN : std_logic;
  
  signal gt0_txusrclk_i : std_logic;
  signal gt0_rxusrclk_i : std_logic;
  
  signal gt0_txusrclk2_i : std_logic;
  signal gt0_rxusrclk2_i : std_logic;
  
  signal gt0_txoutclk_i : std_logic;
  signal gt0_rxoutclk_i : std_logic;
  
  signal TXN_OUT : std_logic;
  signal TXP_OUT : std_logic;
  
  signal RXN_IN : std_logic;
  signal RXP_IN : std_logic;
  
  signal gt0_txresetdone_i : std_logic;
  signal gt0_rxresetdone_i : std_logic;

  signal gt0_rxresetdone_i_regrx322 : std_logic := '0';

  signal gt0_txresetdone_i_rega : std_logic := '0';
  signal gt0_txresetdone_i_reg : std_logic := '0';
  signal gt0_rxresetdone_i_rega : std_logic := '0';
  signal gt0_rxresetdone_i_reg : std_logic := '0';
  
  attribute ASYNC_REG : string;
  attribute ASYNC_REG of gt0_txresetdone_i_rega : signal is "TRUE";
  attribute ASYNC_REG of gt0_rxresetdone_i_rega : signal is "TRUE";

  signal resetdone_int     : std_logic;
  
  signal gt0_txheader_i : std_logic_vector(1 downto 0);
  signal gt0_txsequence_i : std_logic_vector(6 downto 0);
  signal gt0_txdata_i : std_logic_vector(31 downto 0);
  
  signal gt0_rxdata_i : std_logic_vector(31 downto 0);
  signal gt0_rxheader_i : std_logic_vector(1 downto 0);
  signal gt0_rxheadervalid_i : std_logic;
  signal gt0_rxdatavalid_i : std_logic;
  
  signal gt0_eyescandataerror_i : std_logic;
  
  signal gt0_rxuserrdy_i : std_logic;
  signal gt0_txuserrdy_i : std_logic;
  signal gt0_rxuserrdy_r : std_logic := '0';
  signal gt0_txuserrdy_r : std_logic := '0';

  signal gt0_qplllock_i : std_logic; 
  
  signal gt0_gtrxreset_i : std_logic;
  signal gt0_gttxreset_i : std_logic;
  signal gt0_qpllreset_i : std_logic;
  signal pma_resetout_reg : std_logic;
  signal pma_resetout_rising : std_logic;
  signal pcs_resetout_reg : std_logic;
  signal pcs_resetout_rising : std_logic;

  signal gt0_rxpcsreset_i : std_logic;
  signal gt0_txpcsreset_i : std_logic;
  
  signal  gt0_drpaddr_common_i : std_logic_vector(7 downto 0);
  signal  gt0_drpclk_common_i  : std_logic;
  signal  gt0_drpdi_common_i   : std_logic_vector(15 downto 0);
  signal  gt0_drpdo_common_i   : std_logic_vector(15 downto 0);
  signal  gt0_drpen_common_i   : std_logic;
  signal  gt0_drprdy_common_i  : std_logic;
  signal  gt0_drpwe_common_i   : std_logic;

  signal gt0_drpclk_i     : std_logic;
  signal dclk_buf         : std_logic;
    
  signal reset_i          : std_logic;

  signal tx_disable_i     : std_logic;

  signal clk156_int       : std_logic;
  signal clk156_buf       : std_logic;
  signal clkfbout         : std_logic;
  signal REF_CLK_IN_bufh : std_logic;
    
  --  Static signal Assigments    
  signal tied_to_ground_i     : std_logic;
  signal tied_to_ground_vec_i : std_logic_vector(63 downto 0);
  signal tied_to_vcc_i        : std_logic;
  signal tied_to_vcc_vec_i    : std_logic_vector(7 downto 0);
  
  signal  gt0_txoutclkfabric_i            : std_logic;
  signal  gt0_txoutclkpcs_i               : std_logic;

  signal GTTXRESET_IN    : std_logic;
  signal GTRXRESET_IN    : std_logic;
  signal QPLLRESET_IN    : std_logic;
  signal reset_counter   : std_logic_vector(7 downto 0) := x"00";
  signal reset_pulse     : std_logic_vector(3 downto 0);
  signal mmcm_locked     : std_logic;
  
  signal  gt0_rxbufreset_i : std_logic;
  signal  gt0_rxbufstatus_i : std_logic_vector(2 downto 0);

  signal rxuserrdy_counter : std_logic_vector(19 downto 0) := x"00000";
  -- Nominal wait time of 50000 UI = 757 cyles of 156.25MHz clock
  signal RXRESETTIME_NOM : std_logic_vector(19 downto 0) := x"002F5"; 
  -- Maximum wait time of 37x10^6 UI = 560782 cycles of 156.25MHz clock
  signal RXRESETTIME_MAX : std_logic_vector(19 downto 0) := x"89000"; 
  
  -- Set this according to requirements
  signal RXRESETTIME : std_logic_vector(19 downto 0);

  signal GT_slipcount               : std_logic_vector(6 downto 0) := "0000000";
  signal GT_slipcount_reset         : std_logic := '0';
  signal GT_slipcount_reset_reg     : std_logic := '0';
  attribute ASYNC_REG of GT_slipcount_reset_reg : signal is "TRUE";
  signal GT_slipcount_reset_reg_reg : std_logic := '0';
  signal GT_slipcount_reset_rising  : std_logic;
  
  -- Aid detection of a cable being pulled
  signal rx_sample                 : std_logic_vector(3 downto 0) := "0000"; -- Used to monitor RX data for a cable pull 
  signal rx_sample_prev            : std_logic_vector(3 downto 0) := "0000"; -- Used to monitor RX data for a cable pull 
  signal cable_pull_watchdog       : std_logic_vector (19 downto 0) := x"20000"; -- 128K cycles 
  signal cable_pull_watchdog_event : std_logic_vector(1 downto 0) := "00"; -- Count events which suggest no cable pull
  signal cable_pull_reset          : std_logic := '0';  -- This is set when the watchdog above gets to 0.
  signal cable_pull_reset_reg      : std_logic := '0';  -- This is set when the watchdog above gets to 0.
  attribute ASYNC_REG of cable_pull_reset_reg : signal is "TRUE";
  signal cable_pull_reset_reg_reg  : std_logic := '0';  
  signal cable_pull_reset_rising   : std_logic;  

  -- Aid detection of a cable being plugged back in
  signal cable_unpull_enable         : std_logic := '0';  
  signal cable_unpull_watchdog       : std_logic_vector (19 downto 0) := x"20000";  
  signal cable_unpull_watchdog_event : std_logic_vector(10 downto 0) := "00000000000"; 
  signal cable_unpull_reset          : std_logic := '0';  
  signal cable_unpull_reset_reg      : std_logic := '0';  
  attribute ASYNC_REG of cable_unpull_reset_reg : signal is "TRUE";
  signal cable_unpull_reset_reg_reg  : std_logic := '0';  
  signal cable_unpull_reset_rising   : std_logic;  
  
  -- Aid detection of another bad state where datavalid is stuck high, but with valid-looking data
  signal dv_sample                 : std_logic := '0';
  signal dv_sample_prev            : std_logic := '0';
  signal dv_flat_watchdog          : std_logic_vector (27 downto 0) := x"F000000";
  signal dv_flat_watchdog_event    : std_logic_vector(1 downto 0) := "00";
  signal dv_flat_reset             : std_logic := '0';
  signal dv_flat_reset_reg         : std_logic := '0';
  attribute ASYNC_REG of dv_flat_reset_reg : signal is "TRUE";
  signal dv_flat_reset_reg_reg     : std_logic := '0';
  signal dv_flat_reset_rising      : std_logic := '0';
  
  -- Combination of the signal_detect input and cable_is_pulled
  signal signal_detect_comb          : std_logic;
  signal cable_is_pulled             : std_logic := '0';

begin

  tied_to_ground_i     <= '0';
  tied_to_ground_vec_i <= x"0000000000000000";
  tied_to_vcc_i        <= '1';
  tied_to_vcc_vec_i    <= x"FF";

  -- Set this according to requirements
  RXRESETTIME <= RXRESETTIME_NOM;

  -- If no arbitration is required on the GT DRP ports then connect REQ to GNT...
  drp_gnt <= drp_req;
  
  ten_gig_eth_pcs_pma_core : ten_gig_eth_pcs_pma_v2_5 
    port map (
      reset                => reset,
      txreset322           => txreset322,
      rxreset322           => rxreset322,
      dclk_reset           => dclk_reset,
      pma_resetout         => pma_resetout,
      pcs_resetout         => pcs_resetout,
      clk156               => clk156_int,
      txusrclk2            => gt0_txusrclk2_i,
      rxusrclk2            => gt0_rxusrclk2_i,
      dclk                 => gt0_drpclk_i,
      xgmii_txd            => xgmii_txd,
      xgmii_txc            => xgmii_txc,
      xgmii_rxd            => xgmii_rxd,
      xgmii_rxc            => xgmii_rxc,
      mdc                  => mdc,
      mdio_in              => mdio_in,
      mdio_out             => mdio_out,
      mdio_tri             => mdio_tri,
      prtad                => prtad,
      core_status          => core_status, 
      pma_pmd_type         => "101",
      drp_req              => drp_req,
      drp_gnt              => drp_gnt,                           
      drp_den              => gt0_drpen_i,                                  
      drp_dwe              => gt0_drpwe_i,
      drp_daddr            => gt0_drpaddr_i,                   
      drp_di               => gt0_drpdi_i,
      drp_drdy             => gt0_drprdy_i,
      drp_drpdo            => gt0_drpdo_i,
      gt_txd               => gt_txd,
      gt_txc               => gt_txc,
      gt_rxd               => gt_rxd_d1,
      gt_rxc               => gt_rxc_d1,
      gt_slip              => gt0_rxgearboxslip_i,
      resetdone            => resetdone_int,
      signal_detect        => signal_detect_comb,
      tx_fault             => tx_fault,
      tx_disable           => tx_disable_i,
      tx_prbs31_en         => tx_prbs31_en,
      rx_prbs31_en         => rx_prbs31_en,
      clear_rx_prbs_err_count        => gt0_clear_rx_prbs_err_count_i,
      loopback_ctrl        => gt0_loopback_i);

  -- Make the GT Wizard output connect to the core and top level i/f
  -- Q1_CLK0_GTREFCLK_PAD_N_IN <= refclk_n;
  -- Q1_CLK0_GTREFCLK_PAD_P_IN <= refclk_p;
  
  txclk322 <= gt0_txusrclk2_i;
  rxclk322 <= gt0_rxusrclk2_i;

  tx_disable <= tx_disable_i;

  dclk <= gt0_drpclk_i;
  clk156 <= clk156_int;
  RXN_IN <= rxn;
  RXP_IN <= rxp;
  
  txn <= TXN_OUT;
  txp <= TXP_OUT;
  
  resetsync_proc : process(clk156_int)
  begin
    if(clk156_int'event and clk156_int = '1') then
      gt0_txresetdone_i_rega <= gt0_txresetdone_i;
      gt0_txresetdone_i_reg <= gt0_txresetdone_i_rega;
      gt0_rxresetdone_i_rega <= gt0_rxresetdone_i;
      gt0_rxresetdone_i_reg <= gt0_rxresetdone_i_rega;
    end if;
  end process; 
  
  resetdone_int <= gt0_txresetdone_i_reg and gt0_rxresetdone_i_reg;
  tx_resetdone <= gt0_txresetdone_i_reg and mmcm_locked;
  rx_resetdone <= gt0_rxresetdone_i_reg and mmcm_locked;
  
  gt0_txdata_i(0 ) <= gt_txd(31);
  gt0_txdata_i(1 ) <= gt_txd(30);
  gt0_txdata_i(2 ) <= gt_txd(29);
  gt0_txdata_i(3 ) <= gt_txd(28);
  gt0_txdata_i(4 ) <= gt_txd(27);
  gt0_txdata_i(5 ) <= gt_txd(26);
  gt0_txdata_i(6 ) <= gt_txd(25);
  gt0_txdata_i(7 ) <= gt_txd(24);
  gt0_txdata_i(8 ) <= gt_txd(23);
  gt0_txdata_i(9 ) <= gt_txd(22);
  gt0_txdata_i(10) <= gt_txd(21);
  gt0_txdata_i(11) <= gt_txd(20);
  gt0_txdata_i(12) <= gt_txd(19);
  gt0_txdata_i(13) <= gt_txd(18);
  gt0_txdata_i(14) <= gt_txd(17);
  gt0_txdata_i(15) <= gt_txd(16);
  gt0_txdata_i(16) <= gt_txd(15);
  gt0_txdata_i(17) <= gt_txd(14);
  gt0_txdata_i(18) <= gt_txd(13);
  gt0_txdata_i(19) <= gt_txd(12);
  gt0_txdata_i(20) <= gt_txd(11);
  gt0_txdata_i(21) <= gt_txd(10);
  gt0_txdata_i(22) <= gt_txd(9 );
  gt0_txdata_i(23) <= gt_txd(8 );
  gt0_txdata_i(24) <= gt_txd(7 );
  gt0_txdata_i(25) <= gt_txd(6 );
  gt0_txdata_i(26) <= gt_txd(5 );
  gt0_txdata_i(27) <= gt_txd(4 );
  gt0_txdata_i(28) <= gt_txd(3 );
  gt0_txdata_i(29) <= gt_txd(2 );
  gt0_txdata_i(30) <= gt_txd(1 );
  gt0_txdata_i(31) <= gt_txd(0 );
  gt0_txheader_i(0) <= gt_txc(1);
  gt0_txheader_i(1) <= gt_txc(0);
  gt0_txsequence_i <= '0' & gt_txc(7 downto 2);
  
  gt_rxd(0 ) <= gt0_rxdata_i(31);
  gt_rxd(1 ) <= gt0_rxdata_i(30);
  gt_rxd(2 ) <= gt0_rxdata_i(29);
  gt_rxd(3 ) <= gt0_rxdata_i(28);
  gt_rxd(4 ) <= gt0_rxdata_i(27);
  gt_rxd(5 ) <= gt0_rxdata_i(26);
  gt_rxd(6 ) <= gt0_rxdata_i(25);
  gt_rxd(7 ) <= gt0_rxdata_i(24);
  gt_rxd(8 ) <= gt0_rxdata_i(23);
  gt_rxd(9 ) <= gt0_rxdata_i(22);
  gt_rxd(10) <= gt0_rxdata_i(21);
  gt_rxd(11) <= gt0_rxdata_i(20);
  gt_rxd(12) <= gt0_rxdata_i(19);
  gt_rxd(13) <= gt0_rxdata_i(18);
  gt_rxd(14) <= gt0_rxdata_i(17);
  gt_rxd(15) <= gt0_rxdata_i(16);
  gt_rxd(16) <= gt0_rxdata_i(15);
  gt_rxd(17) <= gt0_rxdata_i(14);
  gt_rxd(18) <= gt0_rxdata_i(13);
  gt_rxd(19) <= gt0_rxdata_i(12);
  gt_rxd(20) <= gt0_rxdata_i(11);
  gt_rxd(21) <= gt0_rxdata_i(10);
  gt_rxd(22) <= gt0_rxdata_i(9 );
  gt_rxd(23) <= gt0_rxdata_i(8 );
  gt_rxd(24) <= gt0_rxdata_i(7 );
  gt_rxd(25) <= gt0_rxdata_i(6 );
  gt_rxd(26) <= gt0_rxdata_i(5 );
  gt_rxd(27) <= gt0_rxdata_i(4 );
  gt_rxd(28) <= gt0_rxdata_i(3 );
  gt_rxd(29) <= gt0_rxdata_i(2 );
  gt_rxd(30) <= gt0_rxdata_i(1 );
  gt_rxd(31) <= gt0_rxdata_i(0 );
  gt_rxc <= "0000" & gt0_rxheadervalid_i & gt0_rxdatavalid_i & gt0_rxheader_i(0) & gt0_rxheader_i(1);
  
  gt_rx_reg : process(gt0_rxusrclk2_i)
  begin
    if(gt0_rxusrclk2_i'event and gt0_rxusrclk2_i = '1') then
      gt_rxc_d1 <= gt_rxc;
      gt_rxd_d1 <= gt_rxd;
      gt0_rxresetdone_i_regrx322 <= gt0_rxresetdone_i;
    end if;
  end process;

  -- Reset logic from the gtwizard top level output file....
  -- Adapt the reset_counter to count clk156 ticks.
  -- 128 ticks at 6.4ns period will be >> 500 ns.
  -- Removed all 'after DLY' text.
  
  reset_proc1: process (REF_CLK_IN_bufh, areset)
  begin
    if(areset = '1') then
      reset_counter <= x"00";
    elsif(REF_CLK_IN_bufh'event and REF_CLK_IN_bufh = '1') then
       if(reset_counter(7) = '0')  then
          reset_counter    <= reset_counter + 1;
       else
          reset_counter    <= reset_counter;
       end if;
    end if;
  end process;

  reset_proc2: process (REF_CLK_IN_bufh)
  begin
     if(REF_CLK_IN_bufh'event and REF_CLK_IN_bufh = '1') then
       if(reset_counter(7) = '0')  then
          reset_pulse      <=  "1110";
       else
          reset_pulse(3)            <=  '0';
          reset_pulse(2 downto 0)   <=  reset_pulse(3 downto 1);
       end if;
     end if;
  end process;

  -- Delay the assertion of RXUSERRDY by the given amount
  reset_proc3: process (gt0_rxusrclk2_i, gt0_gtrxreset_i, gt0_qplllock_i)
  begin
    if(gt0_qplllock_i = '0' or gt0_gtrxreset_i = '1') then
      rxuserrdy_counter <= x"00000";
    elsif(gt0_rxusrclk2_i'event and gt0_rxusrclk2_i = '1') then
       if(not(rxuserrdy_counter = RXRESETTIME)) then
          rxuserrdy_counter    <= rxuserrdy_counter + 1;
       else
          rxuserrdy_counter   <=  rxuserrdy_counter;
       end if;
    end if;
  end process;

  GTTXRESET_IN                                 <= reset_pulse(0);
  GTRXRESET_IN                                 <= reset_pulse(0);
  QPLLRESET_IN                                 <= reset_pulse(0);

  gt0_rxuserrdy_i <= gt0_rxuserrdy_r;
  gt0_txuserrdy_i <= gt0_txuserrdy_r;

  reset_proc4 : process (gt0_rxusrclk2_i, gt0_gtrxreset_i)
  begin
     if(gt0_gtrxreset_i = '1') then
          gt0_rxuserrdy_r     <= '0';
     elsif(gt0_rxusrclk2_i'event and gt0_rxusrclk2_i = '1') then
       if(rxuserrdy_counter = RXRESETTIME) then
         gt0_rxuserrdy_r     <=  '1';
       else
         gt0_rxuserrdy_r     <=  gt0_rxuserrdy_r;
       end if;  
     end if;
  end process;
  
  reset_proc5 : process (gt0_txusrclk2_i, gt0_gttxreset_i)
  begin
     if(gt0_gttxreset_i = '1') then
          gt0_txuserrdy_r     <= '0';
     elsif(gt0_txusrclk2_i'event and gt0_txusrclk2_i = '1') then
          gt0_txuserrdy_r     <=  gt0_qplllock_i;
     end if;
  end process;

  -- Create a counter of SLIPs and when this reaches 70, reset the entire RX 
  -- path of the GT. This catches a problem where the far end stops and 
  -- restarts transmission
  slipcount_proc : process(gt0_rxusrclk2_i, gt0_gtrxreset_i)
  begin
    if(gt0_gtrxreset_i = '1') then
      GT_slipcount <= "0000000";
      GT_slipcount_reset <= '0';
    elsif(gt0_rxusrclk2_i'event and gt0_rxusrclk2_i = '1') then
      if(GT_slipcount_reset = '0' and gt0_rxresetdone_i_regrx322 = '1') then
        if(GT_slipcount > "1000110") then
          GT_slipcount_reset <= '1';
        elsif(gt0_rxgearboxslip_i = '1') then 
          GT_slipcount <= GT_slipcount + 1;
          GT_slipcount_reset <= '0';
        else 
          GT_slipcount_reset <= '0';
        end if;
      end if;
    end if;
  end process slipcount_proc;   

  slipcount_proc2 : process(REF_CLK_IN_bufh)
  begin
     if(REF_CLK_IN_bufh'event and REF_CLK_IN_bufh = '1') then
       GT_slipcount_reset_reg <= GT_slipcount_reset;
       GT_slipcount_reset_reg_reg <= GT_slipcount_reset_reg;
       GT_slipcount_reset_rising <= GT_slipcount_reset_reg and not(GT_slipcount_reset_reg_reg);  
     end if;
  end process slipcount_proc2;
        
  -- Create a watchdog which samples the data valid bit (rxc[2]) and checks that it is varying
  -- If not then there may well have been a cable pull or we are stuck in the training protocol
  -- and the gt rx side needs to be reset.
  dv_flat_proc : process(gt0_rxusrclk2_i, gt0_gtrxreset_i)
  begin
    if(gt0_gtrxreset_i = '1') then
      dv_flat_watchdog <= x"F000000"; -- reset the watchdog
      dv_flat_reset <= '0'; 
    elsif(gt0_rxusrclk2_i'event and gt0_rxusrclk2_i = '1' and gt0_rxresetdone_i_regrx322 = '1') then
      -- Sample dv bit of the gt_rxc vector
      dv_sample <= gt_rxc(2);
      dv_sample_prev <= dv_sample;
      
      if(not(dv_flat_reset = '1') and not(cable_pull_reset = '1') and not(cable_is_pulled = '1')) then
        -- If the dv bit is not the same as last one, increment the event counter
        if(not(dv_sample = dv_sample_prev)) then  -- increment the event counter
          dv_flat_watchdog_event <= dv_flat_watchdog_event + 1;        
        end if;
        
        if(dv_flat_watchdog_event = "11") then -- Three events which look like all is ok
          dv_flat_watchdog <= x"F000000"; -- reset the watchdog
          dv_flat_watchdog_event <= "00";
        else
          dv_flat_watchdog <= dv_flat_watchdog - 1;
        end if;
                                
        if(dv_flat_watchdog = x"0000000") then 
          dv_flat_reset <= '1'; -- Hit GTRXRESET! 
        else
          dv_flat_reset <= '0';
        end if;
      end if;
    end if;
  end process dv_flat_proc;

  dv_flat_proc2 : process(REF_CLK_IN_bufh)
  begin
     if(REF_CLK_IN_bufh'event and REF_CLK_IN_bufh = '1') then
       dv_flat_reset_reg <= dv_flat_reset; 
       dv_flat_reset_reg_reg <= dv_flat_reset_reg;
       dv_flat_reset_rising <= dv_flat_reset_reg and not(dv_flat_reset_reg_reg);  
     end if;
  end process dv_flat_proc2;

  -- Create a watchdog which samples 4 bits from the gt_rxd vector and checks that it does
  -- vary from a 1010 or 0101 or 0000 pattern. If not then there may well have been a cable pull
  -- and the gt rx side needs to be reset.
  cable_pull_proc : process(gt0_rxusrclk2_i, gt0_gtrxreset_i)
  begin
    if(gt0_gtrxreset_i = '1') then
      cable_pull_watchdog <= x"20000"; -- reset the watchdog
      cable_pull_reset <= '0';    
    elsif(gt0_rxusrclk2_i'event and gt0_rxusrclk2_i = '1') then
      -- Sample 4 bits of the gt_rxd vector
      rx_sample <= gt_rxd(7 downto 4);
      rx_sample_prev <= rx_sample;
      if(cable_pull_reset = '0' and cable_is_pulled = '0' and gt0_rxresetdone_i_regrx322 = '1') then
        
        -- If those 4 bits do not look like the cable-pull behaviour, increment the event counter
        -- When NOT using RXLPM mode, the cable pull behaviour will have either 1010 or 0101 or 
        -- perhaps 0000 in the sample, and not changing twice in two consecutive clock ticks.
        if(not(rx_sample = "1010") and not(rx_sample = "0101") and not(rx_sample = "0000") and not(rx_sample = rx_sample_prev)) then -- increment the event counter
          cable_pull_watchdog_event <= cable_pull_watchdog_event + 1;
        else -- we are seeing what may be a cable pull
          cable_pull_watchdog_event <= "00";
        end if;
        
        if(cable_pull_watchdog_event = "10") then -- Two consecutive events which look like the cable is attached
          cable_pull_watchdog <= x"20000"; -- reset the watchdog
          cable_pull_watchdog_event <= "00";
        else
          cable_pull_watchdog <= cable_pull_watchdog - 1;
        end if;
                        
        if(cable_pull_watchdog = x"00000") then 
          cable_pull_reset <= '1'; -- Hit GTRXRESET! 
        else
          cable_pull_reset <= '0';
        end if;
      end if;
    end if;
  end process;

  cable_pull_proc2 : process(REF_CLK_IN_bufh)
  begin
     if(REF_CLK_IN_bufh'event and REF_CLK_IN_bufh = '1') then
       cable_pull_reset_reg <= cable_pull_reset; 
       cable_pull_reset_reg_reg <= cable_pull_reset_reg;
       cable_pull_reset_rising <= cable_pull_reset_reg and not(cable_pull_reset_reg_reg);  
     end if;
  end process cable_pull_proc2;

  cable_unpull_enable_proc : process(gt0_rxusrclk2_i)
  begin
    if(gt0_rxusrclk2_i'event and gt0_rxusrclk2_i = '1') then
      if(cable_pull_reset = '1') then -- Cable pull has been detected - enable cable unpull counter
        cable_unpull_enable <= '1';
      elsif(cable_unpull_reset = '1') then -- Cable has been detected as being plugged in again
        cable_unpull_enable <= '0';
      else
        cable_unpull_enable <= cable_unpull_enable;
      end if;
    end if;
  end process cable_unpull_enable_proc;
  
  -- Look for data on the line which does NOT look like the cable is still pulled
  -- a set of 1024 non-1010 or 0101 or 0000 samples within 128k samples suggests that the cable is in.
  cable_unpull_proc : process(gt0_rxusrclk2_i, gt0_gtrxreset_i)
  begin
    if(gt0_gtrxreset_i = '1') then
      cable_unpull_reset <= '0';     
      cable_unpull_watchdog_event <= "00000000000"; -- reset the event counter
    elsif(gt0_rxusrclk2_i'event and gt0_rxusrclk2_i = '1') then
      if(cable_unpull_reset = '0' and cable_is_pulled = '1' and gt0_rxresetdone_i_regrx322 = '1') then
        if(cable_unpull_enable = '1') then -- Cable pull has been detected - enable cable unpull counter
        -- If the 4 bits do not look like the cable-pull behaviour, increment the event counter
          if(not(rx_sample = "1010") and not(rx_sample = "0101") and not(rx_sample = "0000") and not(rx_sample = rx_sample_prev)) then  -- increment the event counter
            cable_unpull_watchdog_event <= cable_unpull_watchdog_event + 1;
          end if;
          if(cable_unpull_watchdog_event(10) = '1') then -- Detected 1k 'valid' rx data words within 128k words
            cable_unpull_reset <= '1'; -- Hit GTRXRESET again!
            cable_unpull_watchdog <= x"20000"; -- reset the watchdog window
          else
            cable_unpull_watchdog <= cable_unpull_watchdog - 1;    
          end if;
                            
          if(cable_unpull_watchdog = x"00000") then 
            cable_unpull_watchdog <= x"20000"; -- reset the watchdog window
            cable_unpull_watchdog_event <= "00000000000"; -- reset the event counter
          end if;
        end if;
      end if;
    end if;
  end process cable_unpull_proc;

  cable_unpull_proc2 : process(REF_CLK_IN_bufh)
  begin
     if(REF_CLK_IN_bufh'event and REF_CLK_IN_bufh = '1') then
       cable_unpull_reset_reg <= cable_unpull_reset; 
       cable_unpull_reset_reg_reg <= cable_unpull_reset_reg;
       cable_unpull_reset_rising <= cable_unpull_reset_reg and not(cable_unpull_reset_reg_reg);  
     end if;
  end process cable_unpull_proc2;
  
  -- Create the local cable_is_pulled signal
  cable_is_pulled_proc : process(REF_CLK_IN_bufh, areset)
  begin
    if(areset = '1') then
      cable_is_pulled <= '0';      
    elsif(REF_CLK_IN_bufh'event and REF_CLK_IN_bufh = '1') then
      if(cable_pull_reset_rising = '1') then
        cable_is_pulled <= '1';
      end if;
      if(cable_unpull_reset_rising = '1') then
        cable_is_pulled <= '0';
      end if;
    end if;
  end process cable_is_pulled_proc;

  -- Create the signal_detect signal as an AND of the external signal and (not) the local cable_is_pulled
  signal_detect_comb <= signal_detect and not(cable_is_pulled);

  pma_rst_proc : process(areset, clk156_int)
  begin
    if(areset = '1') then
      pma_resetout_reg <= '0';
    elsif(clk156_int'event and clk156_int = '1') then
      pma_resetout_reg <= pma_resetout;
    end if;
  end process;
  
  pma_resetout_rising <= pma_resetout and not(pma_resetout_reg);

  pcs_rst_proc : process(areset, clk156_int)
  begin
    if(areset = '1') then
      pcs_resetout_reg <= '0';
    elsif(clk156_int'event and clk156_int = '1') then
      pcs_resetout_reg <= pcs_resetout;
    end if;
  end process;
  
  pcs_resetout_rising <= pcs_resetout and not(pcs_resetout_reg);

  -- Incorporate the pma_resetout_rising and GT_slipcount_reset_rising and cable_pull/unpull_reset_rising bits generated in code below.
  gt0_gtrxreset_i <= (GTRXRESET_IN or not(gt0_qplllock_i) or pma_resetout_rising or dv_flat_reset_rising or
                      GT_slipcount_reset_rising or cable_pull_reset_rising or cable_unpull_reset_rising) and reset_counter(7);
  gt0_gttxreset_i <= (GTTXRESET_IN or not(gt0_qplllock_i) or pma_resetout_rising) and reset_counter(7);
  gt0_qpllreset_i <= QPLLRESET_IN;

  gt0_rxpcsreset_i <= pcs_resetout_rising;
  gt0_txpcsreset_i <= pcs_resetout_rising;

  gt0_rxprbssel_i      <= rx_prbs31_en & "00";
  gt0_txprbssel_i      <= tx_prbs31_en & "00";

  -- reset the GT RX Buffer when over/underflowing
  bufresetproc: process(gt0_rxusrclk2_i)
  begin
    if(gt0_rxusrclk2_i'event and gt0_rxusrclk2_i = '1') then
      if(gt0_rxbufstatus_i(2) = '1' and gt0_rxresetdone_i_regrx322 = '1') then
        gt0_rxbufreset_i <= '1';
      else
        gt0_rxbufreset_i <= '0';
      end if;
    end if;
  end process;   

  reset_i   <= not gt0_qplllock_i ;

  gt0_usrclk_source : ten_gig_eth_pcs_pma_v2_5_GT_USRCLK_SOURCE
  port map
  (
     --Q1_CLK0_GTREFCLK_PAD_N_IN       =>      Q1_CLK0_GTREFCLK_PAD_N_IN,
     --Q1_CLK0_GTREFCLK_PAD_P_IN       =>      Q1_CLK0_GTREFCLK_PAD_P_IN,
     --Q1_CLK0_GTREFCLK_OUT            =>      REF_CLK_IN,
 
     GT0_TXUSRCLK_OUT                =>      gt0_txusrclk_i,
     GT0_TXUSRCLK2_OUT               =>      gt0_txusrclk2_i,
     GT0_TXOUTCLK_IN                 =>      gt0_txoutclk_i,
     GT0_RXUSRCLK_OUT                =>      gt0_rxusrclk_i,
     GT0_RXUSRCLK2_OUT               =>      gt0_rxusrclk2_i,
     GT0_RXOUTCLK_IN                 =>      gt0_rxoutclk_i,
     DRPCLK_IN                       =>      tied_to_ground_i,
     DRPCLK_OUT                      =>      open 
  );
  
  -- MMCM to generate both clk156 and dclk
  clkgen_i : MMCME2_BASE 
  --clkgen_i : MMCM_BASE 
    generic map
    (
      BANDWIDTH          => "OPTIMIZED",
      STARTUP_WAIT       => FALSE,
      DIVCLK_DIVIDE      => 1,
      CLKFBOUT_MULT_F    => 4.0,
      CLKFBOUT_PHASE     => 0.000,
      CLKOUT0_DIVIDE_F   => 4.000,
      CLKOUT0_PHASE      => 0.000,
      CLKOUT0_DUTY_CYCLE => 0.500,
      CLKIN1_PERIOD      => 6.400,
      CLKOUT1_DIVIDE     => 8,
      CLKOUT1_PHASE      => 0.000,
      CLKOUT1_DUTY_CYCLE => 0.500,
      REF_JITTER1        => 0.010
    )
    port map
    (
      CLKFBIN  => clkfbout,
      CLKIN1   => REF_CLK_IN_bufh,
      PWRDWN   => tied_to_ground_i,
      RST      => reset_i,
      CLKFBOUT => clkfbout,
      CLKOUT0  => clk156_buf,
      CLKOUT1  => dclk_buf,
      LOCKED   => mmcm_locked
    );

  bufh_inst : BUFHCE 
    port map
    (
      CE  =>      tied_to_vcc_i,
      I   =>      REF_CLK_IN,
      O   =>      REF_CLK_IN_bufh 
    );

  clk156_bufg_i : BUFG
    port map
    (
      I  =>      clk156_buf,
      O  =>      clk156_int 
    );

  dclk_bufg_i : BUFG
    port map
    (
      I  =>      dclk_buf,
      O  =>      gt0_drpclk_i 
    );

  ----------------------------- The GT Wrapper -----------------------------
  
  -- Use the instantiation template in the example directory to add the GT wrapper to your design.
  -- In this example, the wrapper is wired up for basic operation with a frame generator and frame 
  -- checker. The GTs will reset, then attempt to align and transmit data. If channel bonding is 
  -- enabled, bonding should occur after alignment.


  gtwizard_10gbaser_i : ten_gig_eth_pcs_pma_v2_5_GTWIZARD_10GBASER
  generic map
  (
      WRAPPER_SIM_GTRESET_SPEEDUP     =>      EXAMPLE_SIM_GTRESET_SPEEDUP
  )
  port map
  (

     --_____________________________________________________________________
     --_____________________________________________________________________
     --GT0  (X0Y4)

     ---------------- Channel - Dynamic Reconfiguration Port (DRP) --------------
     GT0_DRPADDR_IN                  =>      gt0_drpaddr_i(8 downto 0),
     GT0_DRPCLK_IN                   =>      gt0_drpclk_i,
     GT0_DRPDI_IN                    =>      gt0_drpdi_i,
     GT0_DRPDO_OUT                   =>      gt0_drpdo_i,
     GT0_DRPEN_IN                    =>      gt0_drpen_i,
     GT0_DRPRDY_OUT                  =>      gt0_drprdy_i,
     GT0_DRPWE_IN                    =>      gt0_drpwe_i,
     ------------------------------- Eye Scan Ports -----------------------------
     GT0_EYESCANDATAERROR_OUT        =>      gt0_eyescandataerror_i,
     ------------------------ Loopback and Powerdown Ports ----------------------
     GT0_LOOPBACK_IN                 =>      gt0_loopback_i,
     ------------------------------- Receive Ports ------------------------------
     GT0_RXUSERRDY_IN                =>      gt0_rxuserrdy_i,
     -------------- Receive Ports - 64b66b and 64b67b Gearbox Ports -------------
     GT0_RXDATAVALID_OUT             =>      gt0_rxdatavalid_i,
     GT0_RXGEARBOXSLIP_IN            =>      gt0_rxgearboxslip_i,
     GT0_RXHEADER_OUT                =>      gt0_rxheader_i,
     GT0_RXHEADERVALID_OUT           =>      gt0_rxheadervalid_i,
     ----------------------- Receive Ports - PRBS Detection ---------------------
     GT0_RXPRBSCNTRESET_IN           =>      gt0_clear_rx_prbs_err_count_i,
     GT0_RXPRBSERR_OUT               =>      gt0_rxprbserr_i,
     GT0_RXPRBSSEL_IN                =>      gt0_rxprbssel_i,
     ------------------- Receive Ports - RX Data Path interface -----------------
     GT0_GTRXRESET_IN                =>      gt0_gtrxreset_i,
     GT0_RXDATA_OUT                  =>      gt0_rxdata_i,
     GT0_RXOUTCLK_OUT                =>      gt0_rxoutclk_i,
     GT0_RXPCSRESET_IN               =>      gt0_rxpcsreset_i,
     GT0_RXUSRCLK_IN                 =>      gt0_rxusrclk_i,
     GT0_RXUSRCLK2_IN                =>      gt0_rxusrclk2_i,
     ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
     GT0_GTXRXN_IN                   =>      RXN_IN,
     GT0_GTXRXP_IN                   =>      RXP_IN,
     GT0_RXCDRLOCK_OUT               =>      open,
     GT0_RXELECIDLE_OUT              =>      open,
     GT0_RXLPMEN_IN                  =>      '0',  
     -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
     GT0_RXBUFRESET_IN               =>      gt0_rxbufreset_i,
     GT0_RXBUFSTATUS_OUT             =>      gt0_rxbufstatus_i,
     ------------------------ Receive Ports - RX PLL Ports ----------------------
     GT0_RXRESETDONE_OUT             =>      gt0_rxresetdone_i,
     ------------------------------- Transmit Ports -----------------------------
     GT0_TXUSERRDY_IN                =>      gt0_txuserrdy_i,
     -------------- Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
     GT0_TXHEADER_IN                 =>      gt0_txheader_i,
     GT0_TXSEQUENCE_IN               =>      gt0_txsequence_i,
     ------------------ Transmit Ports - TX Data Path interface -----------------
     GT0_GTTXRESET_IN                =>      gt0_gttxreset_i,
     GT0_TXDATA_IN                   =>      gt0_txdata_i,
     GT0_TXOUTCLK_OUT                =>      gt0_txoutclk_i,
     GT0_TXOUTCLKFABRIC_OUT          =>      gt0_txoutclkfabric_i,
     GT0_TXOUTCLKPCS_OUT             =>      gt0_txoutclkpcs_i,
     GT0_TXPCSRESET_IN               =>      gt0_txpcsreset_i,
     GT0_TXUSRCLK_IN                 =>      gt0_txusrclk_i,
     GT0_TXUSRCLK2_IN                =>      gt0_txusrclk2_i,
     ---------------- Transmit Ports - TX Driver and OOB signaling --------------
     GT0_GTXTXN_OUT                  =>      TXN_OUT,
     GT0_GTXTXP_OUT                  =>      TXP_OUT,
     GT0_TXINHIBIT_IN                =>      tx_disable_i,
     GT0_TXPRECURSOR_IN              =>      "00000",
     GT0_TXPOSTCURSOR_IN             =>      "00000",
     GT0_TXMAINCURSOR_IN             =>      "0000000",
     ----------------------- Transmit Ports - TX PLL Ports ----------------------
     GT0_TXRESETDONE_OUT             =>      gt0_txresetdone_i,
     --------------------- Transmit Ports - TX PRBS Generator -------------------
     GT0_TXPRBSSEL_IN                =>      gt0_txprbssel_i,

     ---------------------- Common Block  - Ref Clock Ports ---------------------
     GT0_GTREFCLK0_COMMON_IN         =>      REF_CLK_IN,
     ------------------------- Common Block - QPLL Ports ------------------------
     GT0_QPLLLOCK_OUT                =>      gt0_qplllock_i,
     GT0_QPLLLOCKDETCLK_IN           =>      tied_to_ground_i,
     GT0_QPLLREFCLKLOST_OUT          =>      open,
     GT0_QPLLRESET_IN                =>      gt0_qpllreset_i

  );
  
        
end wrapper;
