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


//***************************** Entity Declaration ****************************

module ten_gig_eth_pcs_pma_ip_shared_logic_in_core_gtwizard_gth_10gbaser_GT #
(
    // Simulation attributes
    parameter   GT_SIM_GTRESET_SPEEDUP   =   "FALSE",      // Set to "TRUE" to speed up sim reset
    parameter   EXAMPLE_SIMULATION       =   0,            // Set to 1 for Simulation
    parameter   TXSYNC_OVRD_IN           =   1'b0,
    parameter   TXSYNC_MULTILANE_IN      =   1'b0 
)
(
    //-------------------------- Channel - DRP Ports  --------------------------
    input   [8:0]   drpaddr_in,
    input           drpclk_in,
    input   [15:0]  drpdi_in,
    output  [15:0]  drpdo_out,
    input           drpen_in,
    output          drprdy_out,
    input           drpwe_in,
    //----------------------------- Clocking Ports -----------------------------
    input           qpllclk_in,
    input           qpllrefclk_in,
    //----------------------------- Loopback Ports -----------------------------
    input   [2:0]   loopback_in,
    //--------------------------- PCI Express Ports ----------------------------
    input   [2:0]   rxrate_in,
    //------------------- RX Initialization and Reset Ports --------------------
    input           eyescanreset_in,
    input           rxuserrdy_in,
    output          rxpmaresetdone_out,
    //------------------------ RX Margin Analysis Ports ------------------------
    output          eyescandataerror_out,
    input           eyescantrigger_in,
    //----------------------- Receive Ports - CDR Ports ------------------------
    input           rxcdrhold_in,
    //----------------- Receive Ports - Digital Monitor Ports ------------------
    output  [14:0]  dmonitorout_out,
    //---------------- Receive Ports - FPGA RX Interface Ports -----------------
    input           rxusrclk_in,
    input           rxusrclk2_in,
    //---------------- Receive Ports - FPGA RX interface Ports -----------------
    output  [31:0]  rxdata_out,
    //----------------- Receive Ports - Pattern Checker Ports ------------------
    output          rxprbserr_out,
    input   [2:0]   rxprbssel_in,
    //----------------- Receive Ports - Pattern Checker ports ------------------
    input           rxprbscntreset_in,
    //---------------------- Receive Ports - RX AFE Ports ----------------------
    input           gthrxn_in,
    //----------------- Receive Ports - RX Buffer Bypass Ports -----------------
    input           rxbufreset_in,
    output  [2:0]   rxbufstatus_out,
    //------------------- Receive Ports - RX Equalizer Ports -------------------
    input           rxdfeagchold_in,
    input           rxdfelpmreset_in,
    //------------- Receive Ports - RX Fabric Output Control Ports -------------
    output          rxoutclk_out,
    //-------------------- Receive Ports - RX Gearbox Ports --------------------
    output          rxdatavalid_out,
    output  [1:0]   rxheader_out,
    output          rxheadervalid_out,
    //------------------- Receive Ports - RX Gearbox Ports  --------------------
    input           rxgearboxslip_in,
    //----------- Receive Ports - RX Initialization and Reset Ports ------------
    input           gtrxreset_in,
    input           rxpcsreset_in,
    input           rxpmareset_in,
    //---------------- Receive Ports - RX Margin Analysis ports ----------------
    input           rxlpmen_in,
    //--------------- Receive Ports - RX Polarity Control Ports ----------------
    input           rxpolarity_in,
    //---------------------- Receive Ports -RX AFE Ports -----------------------
    input           gthrxp_in,
    //------------ Receive Ports -RX Initialization and Reset Ports ------------
    output          rxresetdone_out,
    //---------------------- TX Configurable Driver Ports ----------------------
    input   [4:0]   txpostcursor_in,
    input   [4:0]   txprecursor_in,
    //------------------- TX Initialization and Reset Ports --------------------
    input           gttxreset_in,
    input           txuserrdy_in,
    //------------ Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
    input   [1:0]   txheader_in,
    //---------------- Transmit Ports - FPGA TX Interface Ports ----------------
    input           txusrclk_in,
    input           txusrclk2_in,
    //---------------- Transmit Ports - Pattern Generator Ports ----------------
    input           txprbsforceerr_in,
    //-------------------- Transmit Ports - TX Buffer Ports --------------------
    output  [1:0]   txbufstatus_out,
    //------------- Transmit Ports - TX Configurable Driver Ports --------------
    input   [3:0]   txdiffctrl_in,
    input           txinhibit_in,
    input   [6:0]   txmaincursor_in,
    //---------------- Transmit Ports - TX Data Path interface -----------------
    input   [31:0]  txdata_in,
    //-------------- Transmit Ports - TX Driver and OOB signaling --------------
    output          gthtxn_out,
    output          gthtxp_out,
    //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
    output          txoutclk_out,
    output          txoutclkfabric_out,
    output          txoutclkpcs_out,
    //------------------- Transmit Ports - TX Gearbox Ports --------------------
    input   [6:0]   txsequence_in,
    //----------- Transmit Ports - TX Initialization and Reset Ports -----------
    input           txpcsreset_in,
    input           txpmareset_in,
    output          txresetdone_out,
    //--------------- Transmit Ports - TX Polarity Control Ports ---------------
    input           txpolarity_in,
    //---------------- Transmit Ports - pattern Generator Ports ----------------
    input   [2:0]   txprbssel_in


);


//***************************** Wire Declarations *****************************

    // ground and vcc signals
wire            tied_to_ground_i;
wire    [63:0]  tied_to_ground_vec_i;
wire            tied_to_vcc_i;
wire    [63:0]  tied_to_vcc_vec_i;


    //RX Datapath signals
wire    [63:0]  rxdata_i;
wire    [5:0]   rxchariscomma_float_i;
wire    [5:0]   rxcharisk_float_i;
wire    [5:0]   rxdisperr_float_i;
wire    [5:0]   rxnotintable_float_i;
wire    [5:0]   rxrundisp_float_i;


    //TX Datapath signals
wire    [63:0]  txdata_i;           
wire    [5:0]   txkerr_float_i;
wire    [5:0]   txrundisp_float_i;
wire    [3:0]   rxheader_float_i;
wire            rxheadervalid_float_i;
wire            rxdatavalid_float_i;
        
// 
//********************************* Main Body of Code**************************
                       
    //-------------------------  Static signal Assigments ---------------------   

    assign tied_to_ground_i             = 1'b0;
    assign tied_to_ground_vec_i         = 64'h0000000000000000;
    assign tied_to_vcc_i                = 1'b1;
    assign tied_to_vcc_vec_i            = 64'hffffffffffffffff;
    
    //-------------------  GT Datapath byte mapping  -----------------

    //The GT deserializes the rightmost parallel bit (LSb) first
    assign  rxdata_out    =   rxdata_i[31:0];

    //The GT serializes the rightmost parallel bit (LSb) first
        assign txdata_i =   {tied_to_ground_vec_i[31:0], txdata_in};




    //------------------------- GT Instantiations  --------------------------
        GTHE2_CHANNEL #
        (
            //_______________________ Simulation-Only Attributes __________________
    
            .SIM_RECEIVER_DETECT_PASS   ("TRUE"),
            .SIM_TX_EIDLE_DRIVE_LEVEL   ("X"),
            .SIM_RESET_SPEEDUP          (GT_SIM_GTRESET_SPEEDUP),
            .SIM_CPLLREFCLK_SEL         (3'b001),
            .SIM_VERSION                ("2.0"),
            

           //----------------RX Byte and Word Alignment Attributes---------------
            .ALIGN_COMMA_DOUBLE                     ("FALSE"),
            .ALIGN_COMMA_ENABLE                     (10'b0001111111),
            .ALIGN_COMMA_WORD                       (1),
            .ALIGN_MCOMMA_DET                       ("FALSE"),
            .ALIGN_MCOMMA_VALUE                     (10'b1010000011),
            .ALIGN_PCOMMA_DET                       ("FALSE"),
            .ALIGN_PCOMMA_VALUE                     (10'b0101111100),
            .SHOW_REALIGN_COMMA                     ("TRUE"),
            .RXSLIDE_AUTO_WAIT                      (7),
            .RXSLIDE_MODE                           ("OFF"),
            .RX_SIG_VALID_DLY                       (10),

           //----------------RX 8B/10B Decoder Attributes---------------
            .RX_DISPERR_SEQ_MATCH                   ("TRUE"),
            .DEC_MCOMMA_DETECT                      ("FALSE"),
            .DEC_PCOMMA_DETECT                      ("FALSE"),
            .DEC_VALID_COMMA_ONLY                   ("FALSE"),

           //----------------------RX Clock Correction Attributes----------------------
            .CBCC_DATA_SOURCE_SEL                   ("DECODED"),
            .CLK_COR_SEQ_2_USE                      ("FALSE"),
            .CLK_COR_KEEP_IDLE                      ("FALSE"),
            .CLK_COR_MAX_LAT                        (19),
            .CLK_COR_MIN_LAT                        (15),
            .CLK_COR_PRECEDENCE                     ("TRUE"),
            .CLK_COR_REPEAT_WAIT                    (0),
            .CLK_COR_SEQ_LEN                        (1),
            .CLK_COR_SEQ_1_ENABLE                   (4'b1111),
            .CLK_COR_SEQ_1_1                        (10'b0000000000),
            .CLK_COR_SEQ_1_2                        (10'b0000000000),
            .CLK_COR_SEQ_1_3                        (10'b0000000000),
            .CLK_COR_SEQ_1_4                        (10'b0000000000),
            .CLK_CORRECT_USE                        ("FALSE"),
            .CLK_COR_SEQ_2_ENABLE                   (4'b1111),
            .CLK_COR_SEQ_2_1                        (10'b0000000000),
            .CLK_COR_SEQ_2_2                        (10'b0000000000),
            .CLK_COR_SEQ_2_3                        (10'b0000000000),
            .CLK_COR_SEQ_2_4                        (10'b0000000000),

           //----------------------RX Channel Bonding Attributes----------------------
            .CHAN_BOND_KEEP_ALIGN                   ("FALSE"),
            .CHAN_BOND_MAX_SKEW                     (1),
            .CHAN_BOND_SEQ_LEN                      (1),
            .CHAN_BOND_SEQ_1_1                      (10'b0000000000),
            .CHAN_BOND_SEQ_1_2                      (10'b0000000000),
            .CHAN_BOND_SEQ_1_3                      (10'b0000000000),
            .CHAN_BOND_SEQ_1_4                      (10'b0000000000),
            .CHAN_BOND_SEQ_1_ENABLE                 (4'b1111),
            .CHAN_BOND_SEQ_2_1                      (10'b0000000000),
            .CHAN_BOND_SEQ_2_2                      (10'b0000000000),
            .CHAN_BOND_SEQ_2_3                      (10'b0000000000),
            .CHAN_BOND_SEQ_2_4                      (10'b0000000000),
            .CHAN_BOND_SEQ_2_ENABLE                 (4'b1111),
            .CHAN_BOND_SEQ_2_USE                    ("FALSE"),
            .FTS_DESKEW_SEQ_ENABLE                  (4'b1111),
            .FTS_LANE_DESKEW_CFG                    (4'b1111),
            .FTS_LANE_DESKEW_EN                     ("FALSE"),

           //-------------------------RX Margin Analysis Attributes----------------------------
            .ES_CONTROL                             (6'b000000),
            .ES_ERRDET_EN                           ("FALSE"),
            .ES_EYE_SCAN_EN                         ("TRUE"),
            .ES_HORZ_OFFSET                         (12'h000),
            .ES_PMA_CFG                             (10'b0000000000),
            .ES_PRESCALE                            (5'b00000),
            .ES_QUALIFIER                           (80'h00000000000000000000),
            .ES_QUAL_MASK                           (80'h00000000000000000000),
            .ES_SDATA_MASK                          (80'h00000000000000000000),
            .ES_VERT_OFFSET                         (9'b000000000),

           //-----------------------FPGA RX Interface Attributes-------------------------
            .RX_DATA_WIDTH                          (32),

           //-------------------------PMA Attributes----------------------------
            .OUTREFCLK_SEL_INV                      (2'b11),
            .PMA_RSV                                (32'h00000080),
            .PMA_RSV2                               (32'h1C00000A),
            .PMA_RSV3                               (2'b00),
            .PMA_RSV4                               (15'h0008),
            .RX_BIAS_CFG                            (24'b000011000000000000010000),
            .DMONITOR_CFG                           (24'h000A00),
            .RX_CM_SEL                              (2'b11),
            .RX_CM_TRIM                             (4'b1010),
            .RX_DEBUG_CFG                           (14'b00000000000000),
            .RX_OS_CFG                              (13'b0000010000000),
            .TERM_RCAL_CFG                          (15'b100001000010000),
            .TERM_RCAL_OVRD                         (3'b000),
            .TST_RSV                                (32'h00000000),
            .RX_CLK25_DIV                           (7),
            .TX_CLK25_DIV                           (7),
            .UCODEER_CLR                            (1'b0),

           //-------------------------PCI Express Attributes----------------------------
            .PCS_PCIE_EN                            ("FALSE"),

           //-------------------------PCS Attributes----------------------------
            .PCS_RSVD_ATTR                          (48'h000000000000),

           //-----------RX Buffer Attributes------------
            .RXBUF_ADDR_MODE                        ("FAST"),
            .RXBUF_EIDLE_HI_CNT                     (4'b1000),
            .RXBUF_EIDLE_LO_CNT                     (4'b0000),
            .RXBUF_EN                               ("TRUE"),
            .RX_BUFFER_CFG                          (6'b000000),
            .RXBUF_RESET_ON_CB_CHANGE               ("TRUE"),
            .RXBUF_RESET_ON_COMMAALIGN              ("FALSE"),
            .RXBUF_RESET_ON_EIDLE                   ("FALSE"),
            .RXBUF_RESET_ON_RATE_CHANGE             ("TRUE"),
            .RXBUFRESET_TIME                        (5'b00001),
            .RXBUF_THRESH_OVFLW                     (61),
            .RXBUF_THRESH_OVRD                      ("FALSE"),
            .RXBUF_THRESH_UNDFLW                    (4),
            .RXDLY_CFG                              (16'h001F),
            .RXDLY_LCFG                             (9'h030),
            .RXDLY_TAP_CFG                          (16'h0000),
            .RXPH_CFG                               (24'hC00002),
            .RXPHDLY_CFG                            (24'h084020),
            .RXPH_MONITOR_SEL                       (5'b00000),
            .RX_XCLK_SEL                            ("RXREC"),
            .RX_DDI_SEL                             (6'b000000),
            .RX_DEFER_RESET_BUF_EN                  ("TRUE"),

           //---------------------CDR Attributes-------------------------

            .RXCDR_CFG                              (83'h0002007FE2000C208001A),
            .RXCDR_FR_RESET_ON_EIDLE                (1'b0),
            .RXCDR_HOLD_DURING_EIDLE                (1'b0),
            .RXCDR_PH_RESET_ON_EIDLE                (1'b0),
            .RXCDR_LOCK_CFG                         (6'b010101),

           //-----------------RX Initialization and Reset Attributes-------------------
            .RXCDRFREQRESET_TIME                    (5'b00001),
            .RXCDRPHRESET_TIME                      (5'b00001),
            .RXISCANRESET_TIME                      (5'b00001),
            .RXPCSRESET_TIME                        (5'b00001),
            .RXPMARESET_TIME                        (5'b00011),

           //-----------------RX OOB Signaling Attributes-------------------
            .RXOOB_CFG                              (7'b0000110),

           //-----------------------RX Gearbox Attributes---------------------------
            .RXGEARBOX_EN                           ("TRUE"),
            .GEARBOX_MODE                           (3'b001),

           //-----------------------PRBS Detection Attribute-----------------------
            .RXPRBS_ERR_LOOPBACK                    (1'b0),

           //-----------Power-Down Attributes----------
            .PD_TRANS_TIME_FROM_P2                  (12'h03c),
            .PD_TRANS_TIME_NONE_P2                  (8'h19),
            .PD_TRANS_TIME_TO_P2                    (8'h64),

           //-----------RX OOB Signaling Attributes----------
            .SAS_MAX_COM                            (64),
            .SAS_MIN_COM                            (36),
            .SATA_BURST_SEQ_LEN                     (4'b1111),
            .SATA_BURST_VAL                         (3'b100),
            .SATA_EIDLE_VAL                         (3'b100),
            .SATA_MAX_BURST                         (8),
            .SATA_MAX_INIT                          (21),
            .SATA_MAX_WAKE                          (7),
            .SATA_MIN_BURST                         (4),
            .SATA_MIN_INIT                          (12),
            .SATA_MIN_WAKE                          (4),

           //-----------RX Fabric Clock Output Control Attributes----------
            .TRANS_TIME_RATE                        (8'h0E),

           //------------TX Buffer Attributes----------------
            .TXBUF_EN                               ("TRUE"),
            .TXBUF_RESET_ON_RATE_CHANGE             ("TRUE"),
            .TXDLY_CFG                              (16'h001F),
            .TXDLY_LCFG                             (9'h030),
            .TXDLY_TAP_CFG                          (16'h0000),
            .TXPH_CFG                               (16'h0780),
            .TXPHDLY_CFG                            (24'h084020),
            .TXPH_MONITOR_SEL                       (5'b00000),
            .TX_XCLK_SEL                            ("TXOUT"),

           //-----------------------FPGA TX Interface Attributes-------------------------
            .TX_DATA_WIDTH                          (32),

           //-----------------------TX Configurable Driver Attributes-------------------------
            .TX_DEEMPH0                             (6'b000000),
            .TX_DEEMPH1                             (6'b000000),
            .TX_EIDLE_ASSERT_DELAY                  (3'b110),
            .TX_EIDLE_DEASSERT_DELAY                (3'b100),
            .TX_LOOPBACK_DRIVE_HIZ                  ("FALSE"),
            .TX_MAINCURSOR_SEL                      (1'b0),
            .TX_DRIVE_MODE                          ("DIRECT"),
            .TX_MARGIN_FULL_0                       (7'b1001110),
            .TX_MARGIN_FULL_1                       (7'b1001001),
            .TX_MARGIN_FULL_2                       (7'b1000101),
            .TX_MARGIN_FULL_3                       (7'b1000010),
            .TX_MARGIN_FULL_4                       (7'b1000000),
            .TX_MARGIN_LOW_0                        (7'b1000110),
            .TX_MARGIN_LOW_1                        (7'b1000100),
            .TX_MARGIN_LOW_2                        (7'b1000010),
            .TX_MARGIN_LOW_3                        (7'b1000000),
            .TX_MARGIN_LOW_4                        (7'b1000000),

           //-----------------------TX Gearbox Attributes--------------------------
            .TXGEARBOX_EN                           ("TRUE"),

           //-----------------------TX Initialization and Reset Attributes--------------------------
            .TXPCSRESET_TIME                        (5'b00001),
            .TXPMARESET_TIME                        (5'b00001),

           //-----------------------TX Receiver Detection Attributes--------------------------
            .TX_RXDETECT_CFG                        (14'h1832),
            .TX_RXDETECT_REF                        (3'b100),

           //--------------------------CPLL Attributes----------------------------
            .CPLL_CFG                               (29'h00BC07DC),
            .CPLL_FBDIV                             (4),
            .CPLL_FBDIV_45                          (5),
            .CPLL_INIT_CFG                          (24'h00001E),
            .CPLL_LOCK_CFG                          (16'h01E8),
            .CPLL_REFCLK_DIV                        (1),
            .RXOUT_DIV                              (1),
            .TXOUT_DIV                              (1),
            .SATA_CPLL_CFG                          ("VCO_3000MHZ"),

           //------------RX Initialization and Reset Attributes-------------
            .RXDFELPMRESET_TIME                     (7'b0001111),

           //------------RX Equalizer Attributes-------------
            .RXLPM_HF_CFG                           (14'b00001000000000),
            .RXLPM_LF_CFG                           (18'b001001000000000000),
            .RX_DFE_GAIN_CFG                        (23'h0020C0),
            .RX_DFE_H2_CFG                          (12'b000000000000),
            .RX_DFE_H3_CFG                          (12'b000001000000),
            .RX_DFE_H4_CFG                          (11'b00011100000),
            .RX_DFE_H5_CFG                          (11'b00011100000),
            .RX_DFE_KL_CFG                          (33'b001000001000000000000001100010000),
            .RX_DFE_LPM_CFG                         (16'h0080),
            .RX_DFE_LPM_HOLD_DURING_EIDLE           (1'b0),
            .RX_DFE_UT_CFG                          (17'b00011100000000000),
            .RX_DFE_VP_CFG                          (17'b00011101010100011),

           //-----------------------Power-Down Attributes-------------------------
            .RX_CLKMUX_PD                           (1'b1),
            .TX_CLKMUX_PD                           (1'b1),

           //-----------------------FPGA RX Interface Attribute-------------------------
            .RX_INT_DATAWIDTH                       (1),

           //-----------------------FPGA TX Interface Attribute-------------------------
            .TX_INT_DATAWIDTH                       (1),

           //----------------TX Configurable Driver Attributes---------------
            .TX_QPI_STATUS_EN                       (1'b0),

           //---------------- JTAG Attributes ---------------
            .ACJTAG_DEBUG_MODE                      (1'b0),
            .ACJTAG_MODE                            (1'b0),
            .ACJTAG_RESET                           (1'b0),
            .ADAPT_CFG0                             (20'h00C10),
            .CFOK_CFG                               (42'h24800040E80),
            .CFOK_CFG2                              (6'h20),
            .CFOK_CFG3                              (6'h20),
            .ES_CLK_PHASE_SEL                       (1'b0),
            .PMA_RSV5                               (4'h0),
            .RESET_POWERSAVE_DISABLE                (1'b0),
            .USE_PCS_CLK_PHASE_SEL                  (1'b0),
            .A_RXOSCALRESET                         (1'b0),

           //---------------- RX Phase Interpolator Attributes---------------
            .RXPI_CFG0                              (2'b00),
            .RXPI_CFG1                              (2'b11),
            .RXPI_CFG2                              (2'b11),
            .RXPI_CFG3                              (2'b11),
            .RXPI_CFG4                              (1'b0),
            .RXPI_CFG5                              (1'b0),
            .RXPI_CFG6                              (3'b100),

           //------------RX Decision Feedback Equalizer(DFE)-------------
            .RX_DFELPM_CFG0                         (4'b0110),
            .RX_DFELPM_CFG1                         (1'b0),
            .RX_DFELPM_KLKH_AGC_STUP_EN             (1'b1),
            .RX_DFE_AGC_CFG0                        (2'b00),
            .RX_DFE_AGC_CFG1                        (3'b100),
            .RX_DFE_AGC_CFG2                        (4'b0000),
            .RX_DFE_AGC_OVRDEN                      (1'b1),
            .RX_DFE_H6_CFG                          (11'h020),
            .RX_DFE_H7_CFG                          (11'h020),
            .RX_DFE_KL_LPM_KH_CFG0                  (2'b01),
            .RX_DFE_KL_LPM_KH_CFG1                  (3'b010),
            .RX_DFE_KL_LPM_KH_CFG2                  (4'b0010),
            .RX_DFE_KL_LPM_KH_OVRDEN                (1'b1),
            .RX_DFE_KL_LPM_KL_CFG0                  (2'b10),
            .RX_DFE_KL_LPM_KL_CFG1                  (3'b010),
            .RX_DFE_KL_LPM_KL_CFG2                  (4'b0010),
            .RX_DFE_KL_LPM_KL_OVRDEN                (1'b1),
            .RX_DFE_ST_CFG                          (54'h00E100000C003F),

           //---------------- TX Phase Interpolator Attributes---------------
            .TXPI_CFG0                              (2'b00),
            .TXPI_CFG1                              (2'b00),
            .TXPI_CFG2                              (2'b00),
            .TXPI_CFG3                              (1'b0),
            .TXPI_CFG4                              (1'b0),
            .TXPI_CFG5                              (3'b100),
            .TXPI_GREY_SEL                          (1'b0),
            .TXPI_INVSTROBE_SEL                     (1'b0),
            .TXPI_PPMCLK_SEL                        ("TXUSRCLK2"),
            .TXPI_PPM_CFG                           (8'h00),
            .TXPI_SYNFREQ_PPM                       (3'b000),
            .TX_RXDETECT_PRECHARGE_TIME             (17'h155CC),

           //---------------- LOOPBACK Attributes---------------
            .LOOPBACK_CFG                           (1'b0),

           //----------------RX OOB Signalling Attributes---------------
            .RXOOB_CLK_CFG                          ("PMA"),

           //---------------- CDR Attributes ---------------
            .RXOSCALRESET_TIME                      (5'b00011),
            .RXOSCALRESET_TIMEOUT                   (5'b00000),

           //----------------TX OOB Signalling Attributes---------------
            .TXOOB_CFG                              (1'b0),

           //----------------RX Buffer Attributes---------------
            .RXSYNC_MULTILANE                       (1'b0),
            .RXSYNC_OVRD                            (1'b0),
            .RXSYNC_SKIP_DA                         (1'b0),

           //----------------TX Buffer Attributes---------------
            .TXSYNC_MULTILANE                       (TXSYNC_MULTILANE_IN),
            .TXSYNC_OVRD                            (TXSYNC_OVRD_IN),
            .TXSYNC_SKIP_DA                         (1'b0)

            
        ) 
        gthe2_i 
        (
        
        //------------------------------- CPLL Ports -------------------------------
        .CPLLFBCLKLOST                  (),
        .CPLLLOCK                       (),
        .CPLLLOCKDETCLK                 (tied_to_ground_i),
        .CPLLLOCKEN                     (tied_to_vcc_i),
        .CPLLPD                         (tied_to_vcc_i),
        .CPLLREFCLKLOST                 (),
        .CPLLREFCLKSEL                  (3'b001),
        .CPLLRESET                      (tied_to_ground_i),
        .GTRSVD                         (16'b0000000000000000),
        .PCSRSVDIN                      (16'b0000000000000000),
        .PCSRSVDIN2                     (5'b00000),
        .PMARSVDIN                      (5'b00000),
        .TSTIN                          (20'b11111111111111111111),
        //------------------------ Channel - Clocking Ports ------------------------
        .GTGREFCLK                      (tied_to_ground_i),
        .GTNORTHREFCLK0                 (tied_to_ground_i),
        .GTNORTHREFCLK1                 (tied_to_ground_i),
        .GTREFCLK0                      (tied_to_ground_i),
        .GTREFCLK1                      (tied_to_ground_i),
        .GTSOUTHREFCLK0                 (tied_to_ground_i),
        .GTSOUTHREFCLK1                 (tied_to_ground_i),
        //-------------------------- Channel - DRP Ports  --------------------------
        .DRPADDR                        (drpaddr_in),
        .DRPCLK                         (drpclk_in),
        .DRPDI                          (drpdi_in),
        .DRPDO                          (drpdo_out),
        .DRPEN                          (drpen_in),
        .DRPRDY                         (drprdy_out),
        .DRPWE                          (drpwe_in),
        //----------------------------- Clocking Ports -----------------------------
        .GTREFCLKMONITOR                (),
        .QPLLCLK                        (qpllclk_in),
        .QPLLREFCLK                     (qpllrefclk_in),
        .RXSYSCLKSEL                    (2'b11),
        .TXSYSCLKSEL                    (2'b11),
        //--------------- FPGA TX Interface Datapath Configuration  ----------------
        .TX8B10BEN                      (tied_to_ground_i),
        //----------------------------- Loopback Ports -----------------------------
        .LOOPBACK                       (loopback_in),
        //--------------------------- PCI Express Ports ----------------------------
        .PHYSTATUS                      (),
        .RXRATE                         (rxrate_in),
        .RXVALID                        (),
        //---------------------------- Power-Down Ports ----------------------------
        .RXPD                           (2'b00),
        .TXPD                           (2'b00),
        //------------------------ RX 8B/10B Decoder Ports -------------------------
        .SETERRSTATUS                   (tied_to_ground_i),
        //------------------- RX Initialization and Reset Ports --------------------
        .EYESCANRESET                   (eyescanreset_in),
        .RXUSERRDY                      (rxuserrdy_in),
        //------------------------ RX Margin Analysis Ports ------------------------
        .EYESCANDATAERROR               (eyescandataerror_out),
        .EYESCANMODE                    (tied_to_ground_i),
        .EYESCANTRIGGER                 (eyescantrigger_in),
        //----------------------------- Receive Ports ------------------------------
        .CLKRSVD0                       (tied_to_ground_i),
        .CLKRSVD1                       (tied_to_ground_i),
        .DMONFIFORESET                  (tied_to_ground_i),
        .DMONITORCLK                    (tied_to_ground_i),
        .RXPMARESETDONE                 (rxpmaresetdone_out),
        .RXRATEMODE                     (tied_to_ground_i),
        .SIGVALIDCLK                    (tied_to_ground_i),
        .TXPMARESETDONE                 (),
        //------------ Receive Ports - 64b66b and 64b67b Gearbox Ports -------------
        .RXSTARTOFSEQ                   (),
        //----------------------- Receive Ports - CDR Ports ------------------------
        .RXCDRFREQRESET                 (tied_to_ground_i),
        .RXCDRHOLD                      (rxcdrhold_in),
        .RXCDRLOCK                      (),
        .RXCDROVRDEN                    (tied_to_ground_i),
        .RXCDRRESET                     (tied_to_ground_i),
        .RXCDRRESETRSV                  (tied_to_ground_i),
        //----------------- Receive Ports - Clock Correction Ports -----------------
        .RXCLKCORCNT                    (),
        //------------- Receive Ports - Comma Detection and Alignment --------------
        .RXSLIDE                        (tied_to_ground_i),
        //----------------- Receive Ports - Digital Monitor Ports ------------------
        .DMONITOROUT                    (dmonitorout_out),
        //-------- Receive Ports - FPGA RX Interface Datapath Configuration --------
        .RX8B10BEN                      (tied_to_ground_i),
        //---------------- Receive Ports - FPGA RX Interface Ports -----------------
        .RXUSRCLK                       (rxusrclk_in),
        .RXUSRCLK2                      (rxusrclk2_in),
        //---------------- Receive Ports - FPGA RX interface Ports -----------------
        .RXDATA                         (rxdata_i),
        //----------------- Receive Ports - Pattern Checker Ports ------------------
        .RXPRBSERR                      (rxprbserr_out),
        .RXPRBSSEL                      (rxprbssel_in),
        //----------------- Receive Ports - Pattern Checker ports ------------------
        .RXPRBSCNTRESET                 (rxprbscntreset_in),
        //---------------- Receive Ports - RX 8B/10B Decoder Ports -----------------
        .RXDISPERR                      (),
        .RXNOTINTABLE                   (),
        //---------------------- Receive Ports - RX AFE Ports ----------------------
        .GTHRXN                         (gthrxn_in),
        //----------------- Receive Ports - RX Buffer Bypass Ports -----------------
        .RXBUFRESET                     (rxbufreset_in),
        .RXBUFSTATUS                    (rxbufstatus_out),
        .RXDDIEN                        (tied_to_ground_i),
        .RXDLYBYPASS                    (tied_to_vcc_i),
        .RXDLYEN                        (tied_to_ground_i),
        .RXDLYOVRDEN                    (tied_to_ground_i),
        .RXDLYSRESET                    (tied_to_ground_i),
        .RXDLYSRESETDONE                (),
        .RXPHALIGN                      (tied_to_ground_i),
        .RXPHALIGNDONE                  (),
        .RXPHALIGNEN                    (tied_to_ground_i),
        .RXPHDLYPD                      (tied_to_ground_i),
        .RXPHDLYRESET                   (tied_to_ground_i),
        .RXPHMONITOR                    (),
        .RXPHOVRDEN                     (tied_to_ground_i),
        .RXPHSLIPMONITOR                (),
        .RXSTATUS                       (),
        .RXSYNCALLIN                    (tied_to_ground_i),
        .RXSYNCDONE                     (),
        .RXSYNCIN                       (tied_to_ground_i),
        .RXSYNCMODE                     (tied_to_ground_i),
        .RXSYNCOUT                      (),
        //------------ Receive Ports - RX Byte and Word Alignment Ports ------------
        .RXBYTEISALIGNED                (),
        .RXBYTEREALIGN                  (),
        .RXCOMMADET                     (),
        .RXCOMMADETEN                   (tied_to_ground_i),
        .RXMCOMMAALIGNEN                (tied_to_ground_i),
        .RXPCOMMAALIGNEN                (tied_to_ground_i),
        //---------------- Receive Ports - RX Channel Bonding Ports ----------------
        .RXCHANBONDSEQ                  (),
        .RXCHBONDEN                     (tied_to_ground_i),
        .RXCHBONDLEVEL                  (tied_to_ground_vec_i[2:0]),
        .RXCHBONDMASTER                 (tied_to_ground_i),
        .RXCHBONDO                      (),
        .RXCHBONDSLAVE                  (tied_to_ground_i),
        //--------------- Receive Ports - RX Channel Bonding Ports  ----------------
        .RXCHANISALIGNED                (),
        .RXCHANREALIGN                  (),
        //---------- Receive Ports - RX Decision Feedback Equalizer(DFE) -----------
        .RSOSINTDONE                    (),
        .RXDFESLIDETAPOVRDEN            (tied_to_ground_i),
        .RXOSCALRESET                   (tied_to_ground_i),
        //------------------- Receive Ports - RX Equilizer Ports -------------------
        .RXLPMHFHOLD                    (tied_to_ground_i),
        .RXLPMHFOVRDEN                  (tied_to_ground_i),
        .RXLPMLFHOLD                    (tied_to_ground_i),
        //------------------- Receive Ports - RX Equalizar Ports -------------------
        .RXDFESLIDETAPSTARTED           (),
        .RXDFESLIDETAPSTROBEDONE        (),
        .RXDFESLIDETAPSTROBESTARTED     (),
        //------------------- Receive Ports - RX Equalizer Ports -------------------
        .RXADAPTSELTEST                 (tied_to_ground_vec_i[13:0]),
        .RXDFEAGCHOLD                   (rxdfeagchold_in),
        .RXDFEAGCOVRDEN                 (tied_to_ground_i),
        .RXDFEAGCTRL                    (5'b10000),
        .RXDFECM1EN                     (tied_to_ground_i),
        .RXDFELFHOLD                    (tied_to_ground_i),
        .RXDFELFOVRDEN                  (tied_to_ground_i),
        .RXDFELPMRESET                  (rxdfelpmreset_in),
        .RXDFESLIDETAP                  (tied_to_ground_vec_i[4:0]),
        .RXDFESLIDETAPADAPTEN           (tied_to_ground_i),
        .RXDFESLIDETAPHOLD              (tied_to_ground_i),
        .RXDFESLIDETAPID                (tied_to_ground_vec_i[5:0]),
        .RXDFESLIDETAPINITOVRDEN        (tied_to_ground_i),
        .RXDFESLIDETAPONLYADAPTEN       (tied_to_ground_i),
        .RXDFESLIDETAPSTROBE            (tied_to_ground_i),
        .RXDFESTADAPTDONE               (),
        .RXDFETAP2HOLD                  (tied_to_ground_i),
        .RXDFETAP2OVRDEN                (tied_to_ground_i),
        .RXDFETAP3HOLD                  (tied_to_ground_i),
        .RXDFETAP3OVRDEN                (tied_to_ground_i),
        .RXDFETAP4HOLD                  (tied_to_ground_i),
        .RXDFETAP4OVRDEN                (tied_to_ground_i),
        .RXDFETAP5HOLD                  (tied_to_ground_i),
        .RXDFETAP5OVRDEN                (tied_to_ground_i),
        .RXDFETAP6HOLD                  (tied_to_ground_i),
        .RXDFETAP6OVRDEN                (tied_to_ground_i),
        .RXDFETAP7HOLD                  (tied_to_ground_i),
        .RXDFETAP7OVRDEN                (tied_to_ground_i),
        .RXDFEUTHOLD                    (tied_to_ground_i),
        .RXDFEUTOVRDEN                  (tied_to_ground_i),
        .RXDFEVPHOLD                    (tied_to_ground_i),
        .RXDFEVPOVRDEN                  (tied_to_ground_i),
        .RXDFEVSEN                      (tied_to_ground_i),
        .RXDFEXYDEN                     (tied_to_vcc_i),
        .RXLPMLFKLOVRDEN                (tied_to_ground_i),
        .RXMONITOROUT                   (),
        .RXMONITORSEL                   (2'b00),
        .RXOSHOLD                       (tied_to_ground_i),
        .RXOSINTCFG                     (4'b0110),
        .RXOSINTEN                      (tied_to_vcc_i),
        .RXOSINTHOLD                    (tied_to_ground_i),
        .RXOSINTID0                     (tied_to_ground_vec_i[3:0]),
        .RXOSINTNTRLEN                  (tied_to_ground_i),
        .RXOSINTOVRDEN                  (tied_to_ground_i),
        .RXOSINTSTARTED                 (),
        .RXOSINTSTROBE                  (tied_to_ground_i),
        .RXOSINTSTROBEDONE              (),
        .RXOSINTSTROBESTARTED           (),
        .RXOSINTTESTOVRDEN              (tied_to_ground_i),
        .RXOSOVRDEN                     (tied_to_ground_i),
        //---------- Receive Ports - RX Fabric ClocK Output Control Ports ----------
        .RXRATEDONE                     (),
        //------------- Receive Ports - RX Fabric Output Control Ports -------------
        .RXOUTCLK                       (rxoutclk_out),
        .RXOUTCLKFABRIC                 (),
        .RXOUTCLKPCS                    (),
        .RXOUTCLKSEL                    (3'b010),
        //-------------------- Receive Ports - RX Gearbox Ports --------------------
        .RXDATAVALID                    ({rxdatavalid_float_i,rxdatavalid_out}),
        .RXHEADER                       ({rxheader_float_i,rxheader_out}),
        .RXHEADERVALID                  ({rxheadervalid_float_i,rxheadervalid_out}),
        //------------------- Receive Ports - RX Gearbox Ports  --------------------
        .RXGEARBOXSLIP                  (rxgearboxslip_in),
        //----------- Receive Ports - RX Initialization and Reset Ports ------------
        .GTRXRESET                      (gtrxreset_in),
        .RXOOBRESET                     (tied_to_ground_i),
        .RXPCSRESET                     (rxpcsreset_in),
        .RXPMARESET                     (rxpmareset_in),
        //---------------- Receive Ports - RX Margin Analysis ports ----------------
        .RXLPMEN                        (rxlpmen_in),
        //----------------- Receive Ports - RX OOB Signaling ports -----------------
        .RXCOMSASDET                    (),
        .RXCOMWAKEDET                   (),
        //---------------- Receive Ports - RX OOB Signaling ports  -----------------
        .RXCOMINITDET                   (),
        //---------------- Receive Ports - RX OOB signalling Ports -----------------
        .RXELECIDLE                     (),
        .RXELECIDLEMODE                 (2'b11),
        //--------------- Receive Ports - RX Polarity Control Ports ----------------
        .RXPOLARITY                     (rxpolarity_in),
        //----------------- Receive Ports - RX8B/10B Decoder Ports -----------------
        .RXCHARISCOMMA                  (),
        .RXCHARISK                      (),
        //---------------- Receive Ports - Rx Channel Bonding Ports ----------------
        .RXCHBONDI                      (5'b00000),
        //---------------------- Receive Ports -RX AFE Ports -----------------------
        .GTHRXP                         (gthrxp_in),
        //------------ Receive Ports -RX Initialization and Reset Ports ------------
        .RXRESETDONE                    (rxresetdone_out),
        //------------------------------ Rx AFE Ports ------------------------------
        .RXQPIEN                        (tied_to_ground_i),
        .RXQPISENN                      (),
        .RXQPISENP                      (),
        //------------------------- TX Buffer Bypass Ports -------------------------
        .TXPHDLYTSTCLK                  (tied_to_ground_i),
        //---------------------- TX Configurable Driver Ports ----------------------
        .TXPOSTCURSOR                   (txpostcursor_in),
        .TXPOSTCURSORINV                (tied_to_ground_i),
        .TXPRECURSOR                    (txprecursor_in),
        .TXPRECURSORINV                 (tied_to_ground_i),
        .TXQPIBIASEN                    (tied_to_ground_i),
        .TXQPISTRONGPDOWN               (tied_to_ground_i),
        .TXQPIWEAKPUP                   (tied_to_ground_i),
        //------------------- TX Initialization and Reset Ports --------------------
        .CFGRESET                       (tied_to_ground_i),
        .GTTXRESET                      (gttxreset_in),
        .PCSRSVDOUT                     (),
        .TXUSERRDY                      (txuserrdy_in),
        //--------------- TX Phase Interpolator PPM Controller Ports ---------------
        .TXPIPPMEN                      (tied_to_ground_i),
        .TXPIPPMOVRDEN                  (tied_to_ground_i),
        .TXPIPPMPD                      (tied_to_ground_i),
        .TXPIPPMSEL                     (tied_to_vcc_i),
        .TXPIPPMSTEPSIZE                (tied_to_ground_vec_i[4:0]),
        //-------------------- Transceiver Reset Mode Operation --------------------
        .GTRESETSEL                     (tied_to_ground_i),
        .RESETOVRD                      (tied_to_ground_i),
        //----------------------------- Transmit Ports -----------------------------
        .TXRATEMODE                     (tied_to_ground_i),
        //------------ Transmit Ports - 64b66b and 64b67b Gearbox Ports ------------
        .TXHEADER                       ({tied_to_ground_i,txheader_in}),
        //-------------- Transmit Ports - 8b10b Encoder Control Ports --------------
        .TXCHARDISPMODE                 (tied_to_ground_vec_i[7:0]),
        .TXCHARDISPVAL                  (tied_to_ground_vec_i[7:0]),
        //---------------- Transmit Ports - FPGA TX Interface Ports ----------------
        .TXUSRCLK                       (txusrclk_in),
        .TXUSRCLK2                      (txusrclk2_in),
        //------------------- Transmit Ports - PCI Express Ports -------------------
        .TXELECIDLE                     (tied_to_ground_i),
        .TXMARGIN                       (tied_to_ground_vec_i[2:0]),
        .TXRATE                         (tied_to_ground_vec_i[2:0]),
        .TXSWING                        (tied_to_ground_i),
        //---------------- Transmit Ports - Pattern Generator Ports ----------------
        .TXPRBSFORCEERR                 (txprbsforceerr_in),
        //---------------- Transmit Ports - TX Buffer Bypass Ports -----------------
        .TXDLYBYPASS                    (tied_to_vcc_i),
        .TXDLYEN                        (tied_to_ground_i),
        .TXDLYHOLD                      (tied_to_ground_i),
        .TXDLYOVRDEN                    (tied_to_ground_i),
        .TXDLYSRESET                    (tied_to_ground_i),
        .TXDLYSRESETDONE                (),
        .TXDLYUPDOWN                    (tied_to_ground_i),
        .TXPHALIGN                      (tied_to_ground_i),
        .TXPHALIGNDONE                  (),
        .TXPHALIGNEN                    (tied_to_ground_i),
        .TXPHDLYPD                      (tied_to_ground_i),
        .TXPHDLYRESET                   (tied_to_ground_i),
        .TXPHINIT                       (tied_to_ground_i),
        .TXPHINITDONE                   (),
        .TXPHOVRDEN                     (tied_to_ground_i),
        .TXSYNCALLIN                    (tied_to_ground_i),
        .TXSYNCDONE                     (),
        .TXSYNCIN                       (tied_to_ground_i),
        .TXSYNCMODE                     (tied_to_ground_i),
        .TXSYNCOUT                      (),
        //-------------------- Transmit Ports - TX Buffer Ports --------------------
        .TXBUFSTATUS                    (txbufstatus_out),
        //------------- Transmit Ports - TX Configurable Driver Ports --------------
        .TXBUFDIFFCTRL                  (3'b100),
        .TXDEEMPH                       (tied_to_ground_i),
        .TXDIFFCTRL                     (txdiffctrl_in),
        .TXDIFFPD                       (tied_to_ground_i),
        .TXINHIBIT                      (txinhibit_in),
        .TXMAINCURSOR                   (txmaincursor_in),
        .TXPISOPD                       (tied_to_ground_i),
        //---------------- Transmit Ports - TX Data Path interface -----------------
        .TXDATA                         (txdata_i),
        //-------------- Transmit Ports - TX Driver and OOB signaling --------------
        .GTHTXN                         (gthtxn_out),
        .GTHTXP                         (gthtxp_out),
        //--------- Transmit Ports - TX Fabric Clock Output Control Ports ----------
        .TXOUTCLK                       (txoutclk_out),
        .TXOUTCLKFABRIC                 (txoutclkfabric_out),
        .TXOUTCLKPCS                    (txoutclkpcs_out),
        .TXOUTCLKSEL                    (3'b010),
        .TXRATEDONE                     (),
        //------------------- Transmit Ports - TX Gearbox Ports --------------------
        .TXGEARBOXREADY                 (),
        .TXSEQUENCE                     (txsequence_in),
        .TXSTARTSEQ                     (tied_to_ground_i),
        //----------- Transmit Ports - TX Initialization and Reset Ports -----------
        .TXPCSRESET                     (txpcsreset_in),
        .TXPMARESET                     (txpmareset_in),
        .TXRESETDONE                    (txresetdone_out),
        //---------------- Transmit Ports - TX OOB signalling Ports ----------------
        .TXCOMFINISH                    (),
        .TXCOMINIT                      (tied_to_ground_i),
        .TXCOMSAS                       (tied_to_ground_i),
        .TXCOMWAKE                      (tied_to_ground_i),
        .TXPDELECIDLEMODE               (tied_to_ground_i),
        //--------------- Transmit Ports - TX Polarity Control Ports ---------------
        .TXPOLARITY                     (txpolarity_in),
        //------------- Transmit Ports - TX Receiver Detection Ports  --------------
        .TXDETECTRX                     (tied_to_ground_i),
        //---------------- Transmit Ports - TX8b/10b Encoder Ports -----------------
        .TX8B10BBYPASS                  (tied_to_ground_vec_i[7:0]),
        //---------------- Transmit Ports - pattern Generator Ports ----------------
        .TXPRBSSEL                      (txprbssel_in),
        //--------- Transmit Transmit Ports - 8b10b Encoder Control Ports ----------
        .TXCHARISK                      (tied_to_ground_vec_i[7:0]),
        //--------------------- Tx Configurable Driver  Ports ----------------------
        .TXQPISENN                      (),
        .TXQPISENP                      ()

     );

endmodule

