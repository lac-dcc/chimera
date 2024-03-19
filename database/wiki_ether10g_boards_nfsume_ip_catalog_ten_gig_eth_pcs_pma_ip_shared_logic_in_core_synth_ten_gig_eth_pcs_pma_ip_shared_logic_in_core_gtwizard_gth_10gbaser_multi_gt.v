// (c) Copyright 2009 - 2014 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and 
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
`default_nettype wire

`timescale 1ns / 1ps
`define DLY #1

//***************************** Entity Declaration ****************************
(* DowngradeIPIdentifiedWarnings="yes" *)
module ten_gig_eth_pcs_pma_ip_shared_logic_in_core_gtwizard_gth_10gbaser_multi_GT #
(
    // Simulation attributes
    parameter   EXAMPLE_SIMULATION       =   0,             // Set to 1 for Simulation
    parameter   WRAPPER_SIM_GTRESET_SPEEDUP    = "FALSE"    // Set to "TRUE" to speed up sim reset

)
(
    //_________________________________________________________________________
    //_________________________________________________________________________
    //GT0  (X0Y0)
    //____________________________CHANNEL PORTS________________________________
    //-------------------------- Channel - DRP Ports  --------------------------
    input   [8:0]   gt0_drpaddr_in,
    input           gt0_drpclk_in,
    input   [15:0]  gt0_drpdi_in,
    output  [15:0]  gt0_drpdo_out,
    input           gt0_drpen_in,
    output          gt0_drprdy_out,
    input           gt0_drpwe_in,
    //----------------------------- Loopback Ports -----------------------------
    input   [2:0]   gt0_loopback_in,
    //--------------------------- PCI Express Ports ----------------------------
    input   [2:0]   gt0_rxrate_in,
    //------------------- RX Initialization and Reset Ports --------------------
    input           gt0_eyescanreset_in,
    input           gt0_rxuserrdy_in,
    //------------------------ RX Margin Analysis Ports ------------------------
    output          gt0_eyescandataerror_out,
    input           gt0_eyescantrigger_in,
    //----------------------- Receive Ports - CDR Ports ------------------------
    input           gt0_rxcdrhold_in,
    //----------------- Receive Ports - Digital Monitor Ports ------------------
    output  [14:0]  gt0_dmonitorout_out,
    //---------------- Receive Ports - FPGA RX Interface Ports -----------------
    input           gt0_rxusrclk_in,
    input           gt0_rxusrclk2_in,
    //---------------- Receive Ports - FPGA RX interface Ports -----------------
    output  [31:0]  gt0_rxdata_out,
    //----------------- Receive Ports - Pattern Checker Ports ------------------
    output          gt0_rxprbserr_out,
    input   [2:0]   gt0_rxprbssel_in,
    //----------------- Receive Ports - Pattern Checker ports ------------------
    input           gt0_rxprbscntreset_in,
    //---------------------- Receive Ports - RX AFE Ports ----------------------
    input           gt0_gthrxn_in,
    //----------------- Receive Ports - RX Buffer Bypass Ports -----------------
    input           gt0_rxbufreset_in,
    output  [2:0]   gt0_rxbufstatus_out,
    //------------------- Receive Ports - RX Equalizer Ports -------------------
    input           gt0_rxdfeagchold_in,
    input           gt0_rxdfelpmreset_in,
    //------------- Receive Ports - RX Fabric Output Control Ports -------------
    output          gt0_rxoutclk_out,
    //-------------------- Receive Ports - RX Gearbox Ports --------------------
    output          gt0_rxdatavalid_out,
    output  [1:0]   gt0_rxheader_out,
    output          gt0_rxheadervalid_out,
    //------------------- Receive Ports - RX Gearbox Ports  --------------------
    input           gt0_rxgearboxslip_in,
    //----------- Receive Ports - RX Initialization and Reset Ports ------------
    input           gt0_gtrxreset_in,
    input           gt0_rxpcsreset_in,
    input           gt0_rxpmareset_in,
    //---------------- Receive Ports - RX Margin Analysis ports ----------------
    input           gt0_rxlpmen_in,
    //--------------- Receive Ports - RX Polarity Control Ports ----------------
    input           gt0_rxpolarity_in,
    //------------------------- Receive Ports -RX AFE Ports --------------------
    input           gt0_gthrxp_in,
    //------------ Receive Ports -RX Initialization and Reset Ports ------------
    output          gt0_rxresetdone_out,
    output          gt0_rxpmaresetdone_out,
    //---------------------- TX Configurable Driver Ports ----------------------
    input   [4:0]   gt0_txpostcursor_in,
    input   [4:0]   gt0_txprecursor_in,
    //------------------- TX Initialization and Reset Ports --------------------
    input           gt0_gttxreset_in,
    input           gt0_txuserrdy_in,
    //------------ Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
    input   [1:0]   gt0_txheader_in,
    //---------------- Transmit Ports - FPGA TX Interface Ports ----------------
    input           gt0_txusrclk_in,
    input           gt0_txusrclk2_in,
    //---------------- Transmit Ports - Pattern Generator Ports ----------------
    input           gt0_txprbsforceerr_in,
    //-------------------- Transmit Ports - TX Buffer Ports --------------------
    output  [1:0]   gt0_txbufstatus_out,
    //------------- Transmit Ports - TX Configurable Driver Ports --------------
    input   [3:0]   gt0_txdiffctrl_in,
    input           gt0_txinhibit_in,
    input   [6:0]   gt0_txmaincursor_in,
    //---------------- Transmit Ports - TX Data Path interface -----------------
    input   [31:0]  gt0_txdata_in,
    //-------------- Transmit Ports - TX Driver and OOB signaling --------------
    output          gt0_gthtxn_out,
    output          gt0_gthtxp_out,
    //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
    output          gt0_txoutclk_out,
    output          gt0_txoutclkfabric_out,
    output          gt0_txoutclkpcs_out,
    //------------------- Transmit Ports - TX Gearbox Ports --------------------
    input   [6:0]   gt0_txsequence_in,
    //----------- Transmit Ports - TX Initialization and Reset Ports -----------
    input           gt0_txpcsreset_in,
    input           gt0_txpmareset_in,
    output          gt0_txresetdone_out,
    //--------------- Transmit Ports - TX Polarity Control Ports ---------------
    input           gt0_txpolarity_in,
    //---------------- Transmit Ports - pattern Generator Ports ----------------
    input   [2:0]   gt0_txprbssel_in,


    //____________________________COMMON PORTS________________________________
     input           gt0_qplloutclk_in,
     input           gt0_qplloutrefclk_in

);

//***************************** Wire Declarations *****************************

    // ground and vcc signals
wire            tied_to_ground_i;
wire    [63:0]  tied_to_ground_vec_i;
wire            tied_to_vcc_i;
wire    [63:0]  tied_to_vcc_vec_i;
wire            gt0_qpllclk_i;
wire            gt0_qpllrefclk_i;
         
//********************************* Main Body of Code**************************

    assign tied_to_ground_i             = 1'b0;
    assign tied_to_ground_vec_i         = 64'h0000000000000000;
    assign tied_to_vcc_i                = 1'b1;
    assign tied_to_vcc_vec_i            = 64'hffffffffffffffff;


    assign  gt0_qpllclk_i    = gt0_qplloutclk_in;  
    assign  gt0_qpllrefclk_i = gt0_qplloutrefclk_in; 
 
//------------------------- GT Instances  -------------------------------
    //_________________________________________________________________________
    //_________________________________________________________________________
    //GT0  (X0Y0)
    //_________________________________________________________________________

    ten_gig_eth_pcs_pma_ip_shared_logic_in_core_gtwizard_gth_10gbaser_GT #
    (
        // Simulation attributes
        .GT_SIM_GTRESET_SPEEDUP   (WRAPPER_SIM_GTRESET_SPEEDUP),
        .EXAMPLE_SIMULATION       (EXAMPLE_SIMULATION),
        .TXSYNC_OVRD_IN           (1'b0),
        .TXSYNC_MULTILANE_IN      (1'b0) 
    )
gt0_gtwizard_gth_10gbaser_i
    (
        //-------------------------- Channel - DRP Ports  --------------------------
        .drpaddr_in                     (gt0_drpaddr_in),
        .drpclk_in                      (gt0_drpclk_in),
        .drpdi_in                       (gt0_drpdi_in),
        .drpdo_out                      (gt0_drpdo_out),
        .drpen_in                       (gt0_drpen_in),
        .drprdy_out                     (gt0_drprdy_out),
        .drpwe_in                       (gt0_drpwe_in),
        //----------------------------- Clocking Ports -----------------------------
        .qpllclk_in                     (gt0_qpllclk_i),
        .qpllrefclk_in                  (gt0_qpllrefclk_i),
        //----------------------------- Loopback Ports -----------------------------
        .loopback_in                    (gt0_loopback_in),
        //--------------------------- PCI Express Ports ----------------------------
        .rxrate_in                      (gt0_rxrate_in),
        //------------------- RX Initialization and Reset Ports --------------------
        .eyescanreset_in                (gt0_eyescanreset_in),
        .rxuserrdy_in                   (gt0_rxuserrdy_in),
        //------------------------ RX Margin Analysis Ports ------------------------
        .eyescandataerror_out           (gt0_eyescandataerror_out),
        .eyescantrigger_in              (gt0_eyescantrigger_in),
        //----------------------- Receive Ports - CDR Ports ------------------------
        .rxcdrhold_in                   (gt0_rxcdrhold_in),
        //----------------- Receive Ports - Digital Monitor Ports ------------------
        .dmonitorout_out                (gt0_dmonitorout_out),
        //---------------- Receive Ports - FPGA RX Interface Ports -----------------
        .rxusrclk_in                    (gt0_rxusrclk_in),
        .rxusrclk2_in                   (gt0_rxusrclk2_in),
        //---------------- Receive Ports - FPGA RX interface Ports -----------------
        .rxdata_out                     (gt0_rxdata_out),
        //----------------- Receive Ports - Pattern Checker Ports ------------------
        .rxprbserr_out                  (gt0_rxprbserr_out),
        .rxprbssel_in                   (gt0_rxprbssel_in),
        //----------------- Receive Ports - Pattern Checker ports ------------------
        .rxprbscntreset_in              (gt0_rxprbscntreset_in),
        //---------------------- Receive Ports - RX AFE Ports ----------------------
        .gthrxn_in                      (gt0_gthrxn_in),
        //----------------- Receive Ports - RX Buffer Bypass Ports -----------------
        .rxbufreset_in                  (gt0_rxbufreset_in),
        .rxbufstatus_out                (gt0_rxbufstatus_out),
        //------------------- Receive Ports - RX Equalizer Ports -------------------
        .rxdfeagchold_in                (gt0_rxdfeagchold_in),
        .rxdfelpmreset_in               (gt0_rxdfelpmreset_in),
        //------------- Receive Ports - RX Fabric Output Control Ports -------------
        .rxoutclk_out                   (gt0_rxoutclk_out),
        //-------------------- Receive Ports - RX Gearbox Ports --------------------
        .rxdatavalid_out                (gt0_rxdatavalid_out),
        .rxheader_out                   (gt0_rxheader_out),
        .rxheadervalid_out              (gt0_rxheadervalid_out),
        //------------------- Receive Ports - RX Gearbox Ports  --------------------
        .rxgearboxslip_in               (gt0_rxgearboxslip_in),
        //----------- Receive Ports - RX Initialization and Reset Ports ------------
        .gtrxreset_in                   (gt0_gtrxreset_in),
        .rxpcsreset_in                  (gt0_rxpcsreset_in),
        .rxpmareset_in                  (gt0_rxpmareset_in),
        //---------------- Receive Ports - RX Margin Analysis ports ----------------
        .rxlpmen_in                     (gt0_rxlpmen_in),
        //--------------- Receive Ports - RX Polarity Control Ports ----------------
        .rxpolarity_in                  (gt0_rxpolarity_in),
        //------------------------- Receive Ports -RX AFE Ports --------------------
        .gthrxp_in                      (gt0_gthrxp_in),
        //------------ Receive Ports -RX Initialization and Reset Ports ------------
        .rxresetdone_out                (gt0_rxresetdone_out),
        .rxpmaresetdone_out             (gt0_rxpmaresetdone_out),
        //---------------------- TX Configurable Driver Ports ----------------------
        .txpostcursor_in                (gt0_txpostcursor_in),
        .txprecursor_in                 (gt0_txprecursor_in),
        //------------------- TX Initialization and Reset Ports --------------------
        .gttxreset_in                   (gt0_gttxreset_in),
        .txuserrdy_in                   (gt0_txuserrdy_in),
        //------------ Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
        .txheader_in                    (gt0_txheader_in),
        //---------------- Transmit Ports - FPGA TX Interface Ports ----------------
        .txusrclk_in                    (gt0_txusrclk_in),
        .txusrclk2_in                   (gt0_txusrclk2_in),
        //---------------- Transmit Ports - Pattern Generator Ports ----------------
        .txprbsforceerr_in              (gt0_txprbsforceerr_in),
        //-------------------- Transmit Ports - TX Buffer Ports --------------------
        .txbufstatus_out                (gt0_txbufstatus_out),
        //------------- Transmit Ports - TX Configurable Driver Ports --------------
        .txdiffctrl_in                  (gt0_txdiffctrl_in),
        .txinhibit_in                   (gt0_txinhibit_in),
        .txmaincursor_in                (gt0_txmaincursor_in),
        //---------------- Transmit Ports - TX Data Path interface -----------------
        .txdata_in                      (gt0_txdata_in),
        //-------------- Transmit Ports - TX Driver and OOB signaling --------------
        .gthtxn_out                     (gt0_gthtxn_out),
        .gthtxp_out                     (gt0_gthtxp_out),
        //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
        .txoutclk_out                   (gt0_txoutclk_out),
        .txoutclkfabric_out             (gt0_txoutclkfabric_out),
        .txoutclkpcs_out                (gt0_txoutclkpcs_out),
        //------------------- Transmit Ports - TX Gearbox Ports --------------------
        .txsequence_in                  (gt0_txsequence_in),
        //----------- Transmit Ports - TX Initialization and Reset Ports -----------
        .txpcsreset_in                  (gt0_txpcsreset_in),
        .txpmareset_in                  (gt0_txpmareset_in),
        .txresetdone_out                (gt0_txresetdone_out),
        //--------------- Transmit Ports - TX Polarity Control Ports ---------------
        .txpolarity_in                  (gt0_txpolarity_in),
        //---------------- Transmit Ports - pattern Generator Ports ----------------
        .txprbssel_in                   (gt0_txprbssel_in)

    );


endmodule

