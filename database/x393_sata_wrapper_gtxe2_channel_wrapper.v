// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>gtxe2_channel_wrapper
 * @file gtxe2_channel_wrapper.v
 * @date  2015-09-07
 * @author Alexey     
 *
 * @brief wrapper to switch between closed unisims primitive and open-source one
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * GTXE2_GPL.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * GTXE2_GPL.v file is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`include "system_defines.vh" 
module gtxe2_channel_wrapper(
// clocking ports, UG476 p.37
    input   [2:0]       CPLLREFCLKSEL,
    input               GTGREFCLK,
    input               GTNORTHREFCLK0,
    input               GTNORTHREFCLK1,
    input               GTREFCLK0,
    input               GTREFCLK1,
    input               GTSOUTHREFCLK0,
    input               GTSOUTHREFCLK1,
    input   [1:0]       RXSYSCLKSEL,
    input   [1:0]       TXSYSCLKSEL,
    output              GTREFCLKMONITOR,
// CPLL Ports, UG476 p.48
    input               CPLLLOCKDETCLK,
    input               CPLLLOCKEN,
    input               CPLLPD,
    input               CPLLRESET,
    output              CPLLFBCLKLOST,
    output              CPLLLOCK,
    output              CPLLREFCLKLOST,
    output  [9:0]       TSTOUT,
    input   [15:0]      GTRSVD,
    input   [15:0]      PCSRSVDIN,
    input   [4:0]       PCSRSVDIN2,
    input   [4:0]       PMARSVDIN,
    input   [4:0]       PMARSVDIN2,
    input   [19:0]      TSTIN,
// Reset Mode ports, ug476 p.62
    input               GTRESETSEL,
    input               RESETOVRD,
// TX Reset ports, ug476 p.65
    input               CFGRESET,
    input               GTTXRESET,
    input               TXPCSRESET,
    input               TXPMARESET,
    output              TXRESETDONE,
    input               TXUSERRDY,
    output     [15:0]   PCSRSVDOUT,
// RX Reset ports, UG476 p.73
    input               GTRXRESET,
    input               RXPMARESET,
    input               RXCDRRESET,
    input               RXCDRFREQRESET,
    input               RXDFELPMRESET,
    input               EYESCANRESET,
    input               RXPCSRESET,
    input               RXBUFRESET,
    input               RXUSERRDY,
    output              RXRESETDONE,
    input               RXOOBRESET,
// Power Down ports, ug476 p.88
    input   [1:0]       RXPD,
    input   [1:0]       TXPD,
    input               TXPDELECIDLEMODE,
    input               TXPHDLYPD,
    input               RXPHDLYPD,
// Loopback ports, ug476 p.91
    input   [2:0]       LOOPBACK,
// Dynamic Reconfiguration Port, ug476 p.92
    input   [8:0]       DRPADDR,
    input               DRPCLK,
    input   [15:0]      DRPDI,
    output  [15:0]      DRPDO,
    input               DRPEN,
    output              DRPRDY,
    input               DRPWE,
// Digital Monitor Ports, ug476 p.95
    input   [3:0]       CLKRSVD,
    output  [7:0]       DMONITOROUT,
// TX Interface Ports, ug476 p.110
    input   [7:0]       TXCHARDISPMODE,
    input   [7:0]       TXCHARDISPVAL,
    input   [63:0]      TXDATA,
    input               TXUSRCLK,
    input               TXUSRCLK2,
// TX 8B/10B encoder ports, ug476 p.118
    input   [7:0]       TX8B10BBYPASS,
    input               TX8B10BEN,
    input   [7:0]       TXCHARISK,
// TX Gearbox ports, ug476 p.122
    output              TXGEARBOXREADY,
    input   [2:0]       TXHEADER,
    input   [6:0]       TXSEQUENCE,
    input               TXSTARTSEQ,
// TX BUffer Ports, ug476 p.134
    output  [1:0]       TXBUFSTATUS,
// TX Buffer Bypass Ports, ug476 p.136
    input               TXDLYSRESET,
    input               TXPHALIGN,
    input               TXPHALIGNEN,
    input               TXPHINIT,
    input               TXPHOVRDEN,
    input               TXPHDLYRESET,
    input               TXDLYBYPASS,
    input               TXDLYEN,
    input               TXDLYOVRDEN,
    input               TXPHDLYTSTCLK,
    input               TXDLYHOLD,
    input               TXDLYUPDOWN,
    output              TXPHALIGNDONE,
    output              TXPHINITDONE,
    output              TXDLYSRESETDONE,
/*    input               TXSYNCMODE,
    input               TXSYNCALLIN,
    input               TXSYNCIN,
    output              TXSYNCOUT,
    output              TXSYNCDONE,*/
// TX Pattern Generator, ug476 p.147
    input   [2:0]       TXPRBSSEL,
    input               TXPRBSFORCEERR,
// TX Polarity Control Ports, ug476 p.149
    input               TXPOLARITY,
// TX Fabric Clock Output Control Ports, ug476 p.152
    input   [2:0]       TXOUTCLKSEL,
    input   [2:0]       TXRATE,
    output              TXOUTCLKFABRIC,
    output              TXOUTCLK,
    output              TXOUTCLKPCS,
    output              TXRATEDONE,
// TX Phase Interpolator PPM Controller Ports, ug476 p.154
// GTH only
/*    input               TXPIPPMEN,
    input               TXPIPPMOVRDEN,
    input               TXPIPPMSEL,
    input               TXPIPPMPD,
    input   [4:0]       TXPIPPMSTEPSIZE,*/
// TX Configurable Driver Ports, ug476 p.156
    input   [2:0]       TXBUFDIFFCTRL,
    input               TXDEEMPH,
    input   [3:0]       TXDIFFCTRL,
    input               TXELECIDLE,
    input               TXINHIBIT,
    input   [6:0]       TXMAINCURSOR,
    input   [2:0]       TXMARGIN,
    input               TXQPIBIASEN,
    output              TXQPISENN,
    output              TXQPISENP,
    input               TXQPISTRONGPDOWN,
    input               TXQPIWEAKPUP,
    input   [4:0]       TXPOSTCURSOR,
    input               TXPOSTCURSORINV,
    input   [4:0]       TXPRECURSOR,
    input               TXPRECURSORINV,
    input               TXSWING,
    input               TXDIFFPD,
    input               TXPISOPD,
// TX Receiver Detection Ports, ug476 p.165
    input               TXDETECTRX,
    output              PHYSTATUS,
    output  [2:0]       RXSTATUS,
// TX OOB Signaling Ports, ug476 p.166
    output              TXCOMFINISH,
    input               TXCOMINIT,
    input               TXCOMSAS,
    input               TXCOMWAKE,
// RX AFE Ports, ug476 p.171
    output              RXQPISENN,
    output              RXQPISENP,
    input               RXQPIEN,
// RX OOB Signaling Ports, ug476 p.178
    input   [1:0]       RXELECIDLEMODE,
    output              RXELECIDLE,
    output              RXCOMINITDET,
    output              RXCOMSASDET,
    output              RXCOMWAKEDET,
// RX Equalizer Ports, ug476 p.189
    input               RXLPMEN,
    input               RXOSHOLD,
    input               RXOSOVRDEN,
    input               RXLPMLFHOLD,
    input               RXLPMLFKLOVRDEN,
    input               RXLPMHFHOLD,
    input               RXLPMHFOVRDEN,
    input               RXDFEAGCHOLD,
    input               RXDFEAGCOVRDEN,
    input               RXDFELFHOLD,
    input               RXDFELFOVRDEN,
    input               RXDFEUTHOLD,
    input               RXDFEUTOVRDEN,
    input               RXDFEVPHOLD,
    input               RXDFEVPOVRDEN,
    input               RXDFETAP2HOLD,
    input               RXDFETAP2OVRDEN,
    input               RXDFETAP3HOLD,
    input               RXDFETAP3OVRDEN,
    input               RXDFETAP4HOLD,
    input               RXDFETAP4OVRDEN,
    input               RXDFETAP5HOLD,
    input               RXDFETAP5OVRDEN,
    input               RXDFECM1EN,
    input               RXDFEXYDHOLD,
    input               RXDFEXYDOVRDEN,
    input               RXDFEXYDEN,
    input   [1:0]       RXMONITORSEL,
    output  [6:0]       RXMONITOROUT,
// CDR Ports, ug476 p.202
    input               RXCDRHOLD,
    input               RXCDROVRDEN,
    input               RXCDRRESETRSV,
    input   [2:0]       RXRATE,
    output              RXCDRLOCK,
// RX Fabric Clock Output Control Ports, ug476 p.213
    input   [2:0]       RXOUTCLKSEL,
    output              RXOUTCLKFABRIC,
    output              RXOUTCLK,
    output              RXOUTCLKPCS,
    output              RXRATEDONE,
    input               RXDLYBYPASS,
// RX Margin Analysis Ports, ug476 p.220
    output              EYESCANDATAERROR,
    input               EYESCANTRIGGER,
    input               EYESCANMODE,
// RX Polarity Control Ports, ug476 p.224
    input               RXPOLARITY,
// Pattern Checker Ports, ug476 p.225
    input               RXPRBSCNTRESET,
    input   [2:0]       RXPRBSSEL,
    output              RXPRBSERR,
// RX Byte and Word Alignment Ports, ug476 p.233
    output              RXBYTEISALIGNED,
    output              RXBYTEREALIGN,
    output              RXCOMMADET,
    input               RXCOMMADETEN,
    input               RXPCOMMAALIGNEN,
    input               RXMCOMMAALIGNEN,
    input               RXSLIDE,
// RX 8B/10B Decoder Ports, ug476 p.241
    input               RX8B10BEN,
    output  [7:0]       RXCHARISCOMMA,
    output  [7:0]       RXCHARISK,
    output  [7:0]       RXDISPERR,
    output  [7:0]       RXNOTINTABLE,
    input               SETERRSTATUS,
// RX Buffer Bypass Ports, ug476 p.244
    input               RXPHDLYRESET,
    input               RXPHALIGN,
    input               RXPHALIGNEN,
    input               RXPHOVRDEN,
    input               RXDLYSRESET,
    input               RXDLYEN,
    input               RXDLYOVRDEN,
    input               RXDDIEN,
    output              RXPHALIGNDONE,
    output  [4:0]       RXPHMONITOR,
    output  [4:0]       RXPHSLIPMONITOR,
    output              RXDLYSRESETDONE,
// RX Buffer Ports, ug476 p.259
    output  [2:0]       RXBUFSTATUS,
// RX Clock Correction Ports, ug476 p.263
    output  [1:0]       RXCLKCORCNT,
// RX Channel Bonding Ports, ug476 p.274
    output              RXCHANBONDSEQ,
    output              RXCHANISALIGNED,
    output              RXCHANREALIGN,
    input   [4:0]       RXCHBONDI,
    output  [4:0]       RXCHBONDO,
    input   [2:0]       RXCHBONDLEVEL,
    input               RXCHBONDMASTER,
    input               RXCHBONDSLAVE,
    input               RXCHBONDEN,
// RX Gearbox Ports, ug476 p.285
    output              RXDATAVALID,
    input               RXGEARBOXSLIP,
    output  [2:0]       RXHEADER,
    output              RXHEADERVALID,
    output              RXSTARTOFSEQ,
// FPGA RX Interface Ports, ug476 p.299
    output  [63:0]      RXDATA,
    input               RXUSRCLK,
    input               RXUSRCLK2,

// ug476, p.323
    output              RXVALID,
// for correct clocking scheme in case of multilane structure
    input               QPLLCLK,
    input               QPLLREFCLK,

// Diffpairs
    input               GTXRXP,
    input               GTXRXN,
    output              GTXTXN,
    output              GTXTXP
);
// simulation common attributes, UG476 p.28
parameter   SIM_RESET_SPEEDUP            = "TRUE";
parameter   SIM_CPLLREFCLK_SEL           = 3'b001;
parameter   SIM_RECEIVER_DETECT_PASS     = "TRUE"; 
parameter   SIM_TX_EIDLE_DRIVE_LEVEL     = "X";
parameter   SIM_VERSION                  = "1.0";
// Clocking Atributes, UG476 p.38
parameter   OUTREFCLK_SEL_INV            = 1'b0;
// CPLL Attributes, UG476 p.49
parameter   CPLL_CFG                     = 24'h0;
parameter   CPLL_FBDIV                   = 4;
parameter   CPLL_FBDIV_45                = 5;
parameter   CPLL_INIT_CFG                = 24'h0;
parameter   CPLL_LOCK_CFG                = 16'h0;
parameter   CPLL_REFCLK_DIV              = 1;
parameter   RXOUT_DIV                    = 2;
parameter   TXOUT_DIV                    = 2;
parameter   SATA_CPLL_CFG                = "VCO_3000MHZ";
parameter   PMA_RSV3                     = 2'b00;
// TX Initialization and Reset Attributes, ug476 p.66
parameter   TXPCSRESET_TIME              = 5'b00001;
parameter   TXPMARESET_TIME              = 5'b00001;
// RX Initialization and Reset Attributes, UG476 p.75
parameter   RXPMARESET_TIME              = 5'h0;
parameter   RXCDRPHRESET_TIME            = 5'h0;
parameter   RXCDRFREQRESET_TIME          = 5'h0;
parameter   RXDFELPMRESET_TIME           = 7'h0;
parameter   RXISCANRESET_TIME            = 7'h0;
parameter   RXPCSRESET_TIME              = 5'h0;
parameter   RXBUFRESET_TIME              = 5'h0;
// Power Down attributes, ug476 p.88
parameter   PD_TRANS_TIME_FROM_P2        = 12'h0;
parameter   PD_TRANS_TIME_NONE_P2        = 8'h0;
parameter   PD_TRANS_TIME_TO_P2          = 8'h0;
parameter   TRANS_TIME_RATE              = 8'h0;
parameter   RX_CLKMUX_PD                 = 1'b0;
parameter   TX_CLKMUX_PD                 = 1'b0;
// GTX Digital Monitor Attributes, ug476 p.96
parameter   DMONITOR_CFG                 = 24'h008101;
// TX Interface attributes, ug476 p.111
parameter   TX_DATA_WIDTH                = 20;
parameter   TX_INT_DATAWIDTH             = 0;
// TX Gearbox Attributes, ug476 p.121
parameter   GEARBOX_MODE                 = 3'h0;
parameter   TXGEARBOX_EN                 = "FALSE";
// TX BUffer Attributes, ug476 p.134
parameter   TXBUF_EN                     = "TRUE";
// TX Bypass buffer, ug476 p.138
parameter   TX_XCLK_SEL                  = "TXOUT";
parameter   TXPH_CFG                     = 16'h0;
parameter   TXPH_MONITOR_SEL             = 5'h0;
parameter   TXPHDLY_CFG                  = 24'h0;
parameter   TXDLY_CFG                    = 16'h0;
parameter   TXDLY_LCFG                   = 9'h0;
parameter   TXDLY_TAP_CFG                = 16'h0;
//parameter   TXSYNC_MULTILANE             = 1'b0;
//parameter   TXSYNC_SKIP_DA               = 1'b0;
//parameter   TXSYNC_OVRD                  = 1'b1;
//parameter   LOOPBACK_CFG                 = 1'b0;
// TX Pattern Generator, ug476 p.147
parameter   RXPRBS_ERR_LOOPBACK          = 1'b0;
// TX Fabric Clock Output Control Attributes, ug476 p. 153
parameter   TXBUF_RESET_ON_RATE_CHANGE   = "TRUE";
// TX Phase Interpolator PPM Controller Attributes, ug476 p.155
// GTH only
/*parameter   TXPI_SYNCFREQ_PPM            = 3'b001;
parameter   TXPI_PPM_CFG                 = 8'd0;
parameter   TXPI_INVSTROBE_SEL           = 1'b0;
parameter   TXPI_GREY_SEL                = 1'b0;
parameter   TXPI_PPMCLK_SEL              = "12345";*/
// TX Configurable Driver Attributes, ug476 p.162
parameter   TX_DEEMPH0                   = 5'b10100;
parameter   TX_DEEMPH1                   = 5'b01101;
parameter   TX_DRIVE_MODE                = "DIRECT";
parameter   TX_MAINCURSOR_SEL            = 1'b0;
parameter   TX_MARGIN_FULL_0             = 7'b0;
parameter   TX_MARGIN_FULL_1             = 7'b0;
parameter   TX_MARGIN_FULL_2             = 7'b0;
parameter   TX_MARGIN_FULL_3             = 7'b0;
parameter   TX_MARGIN_FULL_4             = 7'b0;
parameter   TX_MARGIN_LOW_0              = 7'b0;
parameter   TX_MARGIN_LOW_1              = 7'b0;
parameter   TX_MARGIN_LOW_2              = 7'b0;
parameter   TX_MARGIN_LOW_3              = 7'b0;
parameter   TX_MARGIN_LOW_4              = 7'b0;
parameter   TX_PREDRIVER_MODE            = 1'b0;
parameter   TX_QPI_STATUS_EN             = 1'b0;
parameter   TX_EIDLE_ASSERT_DELAY        = 3'b110;
parameter   TX_EIDLE_DEASSERT_DELAY      = 3'b100;
parameter   TX_LOOPBACK_DRIVE_HIZ        = "FALSE";
// TX Receiver Detection Attributes, ug476 p.165
parameter   TX_RXDETECT_CFG              = 14'h0;
parameter   TX_RXDETECT_REF              = 3'h0;
// TX OOB Signaling Attributes
parameter   SATA_BURST_SEQ_LEN           = 4'b0101;
// RX AFE Attributes, ug476 p.171
parameter   RX_CM_SEL                    = 2'b11;
parameter   TERM_RCAL_CFG                = 5'b0;
parameter   TERM_RCAL_OVRD               = 1'b0;
parameter   RX_CM_TRIM                   = 3'b010;
// RX OOB Signaling Attributes, ug476 p.179
parameter   PCS_RSVD_ATTR                = 48'h0100; // oob is up
parameter   RXOOB_CFG                    = 7'b0000110;
parameter   SATA_BURST_VAL               = 3'b110;
parameter   SATA_EIDLE_VAL               = 3'b110;
parameter   SAS_MIN_COM                  = 36;
parameter   SATA_MIN_INIT                = 12;
parameter   SATA_MIN_WAKE                = 4;
parameter   SATA_MAX_BURST               = 8;
parameter   SATA_MIN_BURST               = 4;
parameter   SAS_MAX_COM                  = 64;
parameter   SATA_MAX_INIT                = 21;
parameter   SATA_MAX_WAKE                = 7;
// RX Equalizer Attributes, ug476 p.193
parameter   RX_OS_CFG                    = 13'h0080;
parameter   RXLPM_LF_CFG                 = 14'h00f0;
parameter   RXLPM_HF_CFG                 = 14'h00f0;
parameter   RX_DFE_LPM_CFG               = 16'h0;
parameter   RX_DFE_GAIN_CFG              = 23'h020FEA;
parameter   RX_DFE_H2_CFG                = 12'h0;
parameter   RX_DFE_H3_CFG                = 12'h040;
parameter   RX_DFE_H4_CFG                = 11'h0e0;
parameter   RX_DFE_H5_CFG                = 11'h0e0;
parameter   PMA_RSV                      = 32'h00018480;
parameter   RX_DFE_LPM_HOLD_DURING_EIDLE = 1'b0;
parameter   RX_DFE_XYD_CFG               = 13'h0;
parameter   PMA_RSV4                     = 32'h0;
parameter   PMA_RSV2                     = 16'h0;
parameter   RX_BIAS_CFG                  = 12'h040;
parameter   RX_DEBUG_CFG                 = 12'h0;
parameter   RX_DFE_KL_CFG                = 13'h0;
parameter   RX_DFE_KL_CFG2               = 32'h0;
parameter   RX_DFE_UT_CFG                = 17'h11e00;
parameter   RX_DFE_VP_CFG                = 17'h03f03;
// CDR Attributes, ug476 p.203
parameter   RXCDR_CFG                    = 72'h0;
parameter   RXCDR_LOCK_CFG               = 6'h0;
parameter   RXCDR_HOLD_DURING_EIDLE      = 1'b0;
parameter   RXCDR_FR_RESET_ON_EIDLE      = 1'b0;
parameter   RXCDR_PH_RESET_ON_EIDLE      = 1'b0;
// RX Fabric Clock Output Control Attributes
parameter   RXBUF_RESET_ON_RATE_CHANGE   = "TRUE";
// RX Margin Analysis Attributes
parameter   ES_VERT_OFFSET               = 9'h0;
parameter   ES_HORZ_OFFSET               = 12'h0;
parameter   ES_PRESCALE                  = 5'h0;
parameter   ES_SDATA_MASK                = 80'h0;
parameter   ES_QUALIFIER                 = 80'h0;
parameter   ES_QUAL_MASK                 = 80'h0;
parameter   ES_EYE_SCAN_EN               = 1'b1;
parameter   ES_ERRDET_EN                 = 1'b0;
parameter   ES_CONTROL                   = 6'h0;
parameter   RX_DATA_WIDTH                = 20;
parameter   RX_INT_DATAWIDTH             = 0;
parameter   ES_PMA_CFG                   = 10'h0;
// Pattern Checker Attributes, ug476 p.226
//parameter   RX_PRBS_ERR_CNT              = 16'h15c;
// RX Byte and Word Alignment Attributes, ug476 p.235
parameter   ALIGN_COMMA_WORD             = 1;
parameter   ALIGN_COMMA_ENABLE           = 10'b1111111111;
parameter   ALIGN_COMMA_DOUBLE           = "FALSE";
parameter   ALIGN_MCOMMA_DET             = "TRUE";
parameter   ALIGN_MCOMMA_VALUE           = 10'b1010000011;
parameter   ALIGN_PCOMMA_DET             = "TRUE";
parameter   ALIGN_PCOMMA_VALUE           = 10'b0101111100;
parameter   SHOW_REALIGN_COMMA           = "TRUE";
parameter   RXSLIDE_MODE                 = "OFF";
parameter   RXSLIDE_AUTO_WAIT            = 7;
parameter   RX_SIG_VALID_DLY             = 10;
//parameter   COMMA_ALIGN_LATENCY          = 9'h14e;
// RX 8B/10B Decoder Attributes, ug476 p.242
parameter   RX_DISPERR_SEQ_MATCH         = "TRUE";
parameter   DEC_MCOMMA_DETECT            = "TRUE";
parameter   DEC_PCOMMA_DETECT            = "TRUE";
parameter   DEC_VALID_COMMA_ONLY         = "FALSE";
parameter   UCODEER_CLR                  = 1'b0;
// RX Buffer Bypass Attributes, ug476 p.247
parameter   RXBUF_EN                     = "TRUE";
parameter   RX_XCLK_SEL                  = "RXREC";
parameter   RXPH_CFG                     = 24'h0;
parameter   RXPH_MONITOR_SEL             = 5'h0;
parameter   RXPHDLY_CFG                  = 24'h0;
parameter   RXDLY_CFG                    = 16'h0;
parameter   RXDLY_LCFG                   = 9'h0;
parameter   RXDLY_TAP_CFG                = 16'h0;
parameter   RX_DDI_SEL                   = 6'h0;
parameter   TST_RSV                      = 32'h0;
// RX Buffer Attributes, ug476 p.259
parameter   RX_BUFFER_CFG                = 6'b0;
parameter   RX_DEFER_RESET_BUF_EN        = "TRUE";
parameter   RXBUF_ADDR_MODE              = "FAST";
parameter   RXBUF_EIDLE_HI_CNT           = 4'b0;
parameter   RXBUF_EIDLE_LO_CNT           = 4'b0;
parameter   RXBUF_RESET_ON_CB_CHANGE     = "TRUE";
parameter   RXBUF_RESET_ON_COMMAALIGN    = "FALSE";
parameter   RXBUF_RESET_ON_EIDLE         = "FALSE";
parameter   RXBUF_THRESH_OVFLW           = 0;
parameter   RXBUF_THRESH_OVRD            = "FALSE";
parameter   RXBUF_THRESH_UNDFLW          = 0;
// RX Clock Correction Attributes, ug476 p.265
parameter   CBCC_DATA_SOURCE_SEL         = "DECODED";
parameter   CLK_CORRECT_USE              = "FALSE";
parameter   CLK_COR_SEQ_2_USE            = "FALSE";
parameter   CLK_COR_KEEP_IDLE            = "FALSE";
parameter   CLK_COR_MAX_LAT              = 9;
parameter   CLK_COR_MIN_LAT              = 7;
parameter   CLK_COR_PRECEDENCE           = "TRUE";
parameter   CLK_COR_REPEAT_WAIT          = 0;
parameter   CLK_COR_SEQ_LEN              = 1;
parameter   CLK_COR_SEQ_1_ENABLE         = 4'b1111;
parameter   CLK_COR_SEQ_1_1              = 10'b0;
parameter   CLK_COR_SEQ_1_2              = 10'b0;
parameter   CLK_COR_SEQ_1_3              = 10'b0;
parameter   CLK_COR_SEQ_1_4              = 10'b0;
parameter   CLK_COR_SEQ_2_ENABLE         = 4'b1111;
parameter   CLK_COR_SEQ_2_1              = 10'b0;
parameter   CLK_COR_SEQ_2_2              = 10'b0;
parameter   CLK_COR_SEQ_2_3              = 10'b0;
parameter   CLK_COR_SEQ_2_4              = 10'b0;
// RX Channel Bonding Attributes, ug476 p.276
parameter   CHAN_BOND_MAX_SKEW           = 1;
parameter   CHAN_BOND_KEEP_ALIGN         = "FALSE";
parameter   CHAN_BOND_SEQ_LEN            = 1;
parameter   CHAN_BOND_SEQ_1_1            = 10'b0;
parameter   CHAN_BOND_SEQ_1_2            = 10'b0;
parameter   CHAN_BOND_SEQ_1_3            = 10'b0;
parameter   CHAN_BOND_SEQ_1_4            = 10'b0;
parameter   CHAN_BOND_SEQ_1_ENABLE       = 4'b1111;
parameter   CHAN_BOND_SEQ_2_1            = 10'b0;
parameter   CHAN_BOND_SEQ_2_2            = 10'b0;
parameter   CHAN_BOND_SEQ_2_3            = 10'b0;
parameter   CHAN_BOND_SEQ_2_4            = 10'b0;
parameter   CHAN_BOND_SEQ_2_ENABLE       = 4'b1111;
parameter   CHAN_BOND_SEQ_2_USE          = "FALSE";
parameter   FTS_DESKEW_SEQ_ENABLE        = 4'b1111;
parameter   FTS_LANE_DESKEW_CFG          = 4'b1111;
parameter   FTS_LANE_DESKEW_EN           = "FALSE";
parameter   PCS_PCIE_EN                  = "FALSE";
// RX Gearbox Attributes, ug476 p.287
parameter   RXGEARBOX_EN                 = "FALSE";

// ug476 table p.326 - undocumented parameters
parameter   RX_CLK25_DIV                 = 6;
parameter   TX_CLK25_DIV                 = 6;

`ifdef OPEN_SOURCE_ONLY
GTXE2_GPL #(
`else // OPEN_SOURCE_ONLY
GTXE2_CHANNEL #(
`endif // OPEN_SOURCE_ONLY
// simulation common attributes, UG476 p.28
    .SIM_RESET_SPEEDUP                                          (SIM_RESET_SPEEDUP),
    .SIM_CPLLREFCLK_SEL                                         (SIM_CPLLREFCLK_SEL),
    .SIM_RECEIVER_DETECT_PASS                                   (SIM_RECEIVER_DETECT_PASS),
    .SIM_TX_EIDLE_DRIVE_LEVEL                                   (SIM_TX_EIDLE_DRIVE_LEVEL),
    .SIM_VERSION                                                (SIM_VERSION),
// Clocking Atributes, UG476 p.38
    .OUTREFCLK_SEL_INV                                          (OUTREFCLK_SEL_INV),
// CPLL Attributes, UG476 p.49
    .CPLL_CFG                                                                   (CPLL_CFG),
    .CPLL_FBDIV                                                 (CPLL_FBDIV),
    .CPLL_FBDIV_45                                              (CPLL_FBDIV_45),
    .CPLL_INIT_CFG                                              (CPLL_INIT_CFG),
    .CPLL_LOCK_CFG                                              (CPLL_LOCK_CFG),
    .CPLL_REFCLK_DIV                                            (CPLL_REFCLK_DIV),
    .RXOUT_DIV                                                  (RXOUT_DIV),
    .TXOUT_DIV                                                  (TXOUT_DIV),
    .SATA_CPLL_CFG                                              (SATA_CPLL_CFG),
    .PMA_RSV3                                                   (PMA_RSV3),
// TX Initialization and Reset Attributes, ug476 p.66
    .TXPCSRESET_TIME                                            (TXPCSRESET_TIME),
    .TXPMARESET_TIME                                            (TXPMARESET_TIME),
// RX Initialization and Reset Attributes, UG476 p.75
    .RXPMARESET_TIME                                            (RXPMARESET_TIME),
    .RXCDRPHRESET_TIME                                          (RXCDRPHRESET_TIME),
    .RXCDRFREQRESET_TIME                                        (RXCDRFREQRESET_TIME),
    .RXDFELPMRESET_TIME                                         (RXDFELPMRESET_TIME),
    .RXISCANRESET_TIME                                          (RXISCANRESET_TIME),
    .RXPCSRESET_TIME                                            (RXPCSRESET_TIME),
    .RXBUFRESET_TIME                                            (RXBUFRESET_TIME),
// Power Down attributes, ug476 p.88
    .PD_TRANS_TIME_FROM_P2                                      (PD_TRANS_TIME_FROM_P2),
    .PD_TRANS_TIME_NONE_P2                                      (PD_TRANS_TIME_NONE_P2),
    .PD_TRANS_TIME_TO_P2                                        (PD_TRANS_TIME_TO_P2),
    .TRANS_TIME_RATE                                            (TRANS_TIME_RATE),
    .RX_CLKMUX_PD                                               (RX_CLKMUX_PD),
    .TX_CLKMUX_PD                                               (TX_CLKMUX_PD),
// GTX Digital Monitor Attributes, ug476 p.96
    .DMONITOR_CFG                                               (DMONITOR_CFG),
// TX Interface attributes, ug476 p.111
    .TX_DATA_WIDTH                                              (TX_DATA_WIDTH),
    .TX_INT_DATAWIDTH                                           (TX_INT_DATAWIDTH),
// TX Gearbox Attributes, ug476 p.121
    .GEARBOX_MODE                                               (GEARBOX_MODE),
    .TXGEARBOX_EN                                               (TXGEARBOX_EN),
// TX BUffer Attributes, ug476 p.134
    .TXBUF_EN                                                   (TXBUF_EN),
// TX Bypass buffer, ug476 p.138
    .TX_XCLK_SEL                                                (TX_XCLK_SEL),
    .TXPH_CFG                                                   (TXPH_CFG),
    .TXPH_MONITOR_SEL                                           (TXPH_MONITOR_SEL),
    .TXPHDLY_CFG                                                (TXPHDLY_CFG),
    .TXDLY_CFG                                                  (TXDLY_CFG),
    .TXDLY_LCFG                                                 (TXDLY_LCFG),
    .TXDLY_TAP_CFG                                              (TXDLY_TAP_CFG),
/*    .TXSYNC_MULTILANE                                           (TXSYNC_MULTILANE),
    .TXSYNC_SKIP_DA                                             (TXSYNC_SKIP_DA),
    .TXSYNC_OVRD                                                (TXSYNC_OVRD),
    .LOOPBACK_CFG                                               (LOOPBACK_CFG),*/
// TX Pattern Generator, ug476 p.147
    .RXPRBS_ERR_LOOPBACK                                        (RXPRBS_ERR_LOOPBACK),
// TX Fabric Clock Output Control Attributes, ug476 p. 153
    .TXBUF_RESET_ON_RATE_CHANGE                                 (TXBUF_RESET_ON_RATE_CHANGE),
// TX Phase Interpolator PPM Controller Attributes, ug476 p.155
// GTH only
/*  .TXPI_SYNCFREQ_PPM                                                              (TXPI_SYNCFREQ_PPM),
    .TXPI_PPM_CFG                                                                   (TXPI_PPM_CFG),
    .TXPI_INVSTROBE_SEL                                                                 (TXPI_INVSTROBE_SEL),
    .TXPI_GREY_SEL                                                                  (TXPI_GREY_SEL),
    .TXPI_PPMCLK_SEL                                                                    (TXPI_PPMCLK_SEL),*/
// TX Configurable Driver Attributes, ug476 p.162
    .TX_DEEMPH0                                                 (TX_DEEMPH0),
    .TX_DEEMPH1                                                 (TX_DEEMPH1),
    .TX_DRIVE_MODE                                              (TX_DRIVE_MODE),
    .TX_MAINCURSOR_SEL                                          (TX_MAINCURSOR_SEL),
    .TX_MARGIN_FULL_0                                           (TX_MARGIN_FULL_0),
    .TX_MARGIN_FULL_1                                           (TX_MARGIN_FULL_1),
    .TX_MARGIN_FULL_2                                           (TX_MARGIN_FULL_2),
    .TX_MARGIN_FULL_3                                           (TX_MARGIN_FULL_3),
    .TX_MARGIN_FULL_4                                           (TX_MARGIN_FULL_4),
    .TX_MARGIN_LOW_0                                            (TX_MARGIN_LOW_0),
    .TX_MARGIN_LOW_1                                            (TX_MARGIN_LOW_1),
    .TX_MARGIN_LOW_2                                            (TX_MARGIN_LOW_2),
    .TX_MARGIN_LOW_3                                            (TX_MARGIN_LOW_3),
    .TX_MARGIN_LOW_4                                            (TX_MARGIN_LOW_4),
    .TX_PREDRIVER_MODE                                          (TX_PREDRIVER_MODE),
    .TX_QPI_STATUS_EN                                           (TX_QPI_STATUS_EN),
    .TX_EIDLE_ASSERT_DELAY                                      (TX_EIDLE_ASSERT_DELAY),
    .TX_EIDLE_DEASSERT_DELAY                                    (TX_EIDLE_DEASSERT_DELAY),
    .TX_LOOPBACK_DRIVE_HIZ                                      (TX_LOOPBACK_DRIVE_HIZ),
// TX Receiver Detection Attributes, ug476 p.165
    .TX_RXDETECT_CFG                                            (TX_RXDETECT_CFG),
    .TX_RXDETECT_REF                                            (TX_RXDETECT_REF),
// TX OOB Signaling Attributes
    .SATA_BURST_SEQ_LEN                                         (SATA_BURST_SEQ_LEN),
// RX AFE Attributes, ug476 p.171
    .RX_CM_SEL                                                  (RX_CM_SEL),
    .TERM_RCAL_CFG                                              (TERM_RCAL_CFG),
    .TERM_RCAL_OVRD                                             (TERM_RCAL_OVRD),
    .RX_CM_TRIM                                                 (RX_CM_TRIM),
// RX OOB Signaling Attributes, ug476 p.179
    .PCS_RSVD_ATTR                                              (PCS_RSVD_ATTR),
    .RXOOB_CFG                                                  (RXOOB_CFG),
    .SATA_BURST_VAL                                             (SATA_BURST_VAL),
    .SATA_EIDLE_VAL                                             (SATA_EIDLE_VAL),
    .SAS_MIN_COM                                                (SAS_MIN_COM),
    .SATA_MIN_INIT                                              (SATA_MIN_INIT),
    .SATA_MIN_WAKE                                              (SATA_MIN_WAKE),
    .SATA_MAX_BURST                                             (SATA_MAX_BURST),
    .SATA_MIN_BURST                                             (SATA_MIN_BURST),
    .SAS_MAX_COM                                                (SAS_MAX_COM),
    .SATA_MAX_INIT                                              (SATA_MAX_INIT),
    .SATA_MAX_WAKE                                              (SATA_MAX_WAKE),
// RX Equalizer Attributes, ug476 p.193
    .RX_OS_CFG                                                  (RX_OS_CFG),
    .RXLPM_LF_CFG                                               (RXLPM_LF_CFG),
    .RXLPM_HF_CFG                                               (RXLPM_HF_CFG),
    .RX_DFE_LPM_CFG                                             (RX_DFE_LPM_CFG),
    .RX_DFE_GAIN_CFG                                            (RX_DFE_GAIN_CFG),
    .RX_DFE_H2_CFG                                              (RX_DFE_H2_CFG),
    .RX_DFE_H3_CFG                                              (RX_DFE_H3_CFG),
    .RX_DFE_H4_CFG                                              (RX_DFE_H4_CFG),
    .RX_DFE_H5_CFG                                              (RX_DFE_H5_CFG),
    .PMA_RSV                                                    (PMA_RSV),
    .RX_DFE_LPM_HOLD_DURING_EIDLE                               (RX_DFE_LPM_HOLD_DURING_EIDLE),
    .RX_DFE_XYD_CFG                                             (RX_DFE_XYD_CFG),
    .PMA_RSV4                                                   (PMA_RSV4),
    .PMA_RSV2                                                   (PMA_RSV2),
    .RX_BIAS_CFG                                                (RX_BIAS_CFG),
    .RX_DEBUG_CFG                                               (RX_DEBUG_CFG),
    .RX_DFE_KL_CFG                                              (RX_DFE_KL_CFG),
    .RX_DFE_KL_CFG2                                             (RX_DFE_KL_CFG2),
    .RX_DFE_UT_CFG                                              (RX_DFE_UT_CFG),
    .RX_DFE_VP_CFG                                              (RX_DFE_VP_CFG),
// CDR Attributes, ug476 p.203
    .RXCDR_CFG                                                  (RXCDR_CFG),
    .RXCDR_LOCK_CFG                                             (RXCDR_LOCK_CFG),
    .RXCDR_HOLD_DURING_EIDLE                                    (RXCDR_HOLD_DURING_EIDLE),
    .RXCDR_FR_RESET_ON_EIDLE                                    (RXCDR_FR_RESET_ON_EIDLE),
    .RXCDR_PH_RESET_ON_EIDLE                                    (RXCDR_PH_RESET_ON_EIDLE),
// RX Fabric Clock Output Control Attributes
    .RXBUF_RESET_ON_RATE_CHANGE                                 (RXBUF_RESET_ON_RATE_CHANGE),
// RX Margin Analysis Attributes
    .ES_VERT_OFFSET                                             (ES_VERT_OFFSET),
    .ES_HORZ_OFFSET                                             (ES_HORZ_OFFSET),
    .ES_PRESCALE                                                (ES_PRESCALE),
    .ES_SDATA_MASK                                              (ES_SDATA_MASK),
    .ES_QUALIFIER                                               (ES_QUALIFIER),
    .ES_QUAL_MASK                                               (ES_QUAL_MASK),
    .ES_EYE_SCAN_EN                                             (ES_EYE_SCAN_EN),
    .ES_ERRDET_EN                                               (ES_ERRDET_EN),
    .ES_CONTROL                                                 (ES_CONTROL),
/*  .es_control_status                                          (es_control_status),
    .es_rdata                                                   (es_rdata),
    .es_sdata                                                   (es_sdata),
    .es_error_count                                             (es_error_count),
    .es_sample_count                                            (es_sample_count),*/
    .RX_DATA_WIDTH                                              (RX_DATA_WIDTH),
    .RX_INT_DATAWIDTH                                           (RX_INT_DATAWIDTH),
    .ES_PMA_CFG                                                 (ES_PMA_CFG),
// Pattern Checker Attributes, ug476 p.226
    //.RX_PRBS_ERR_CNT                                            (RX_PRBS_ERR_CNT),
// RX Byte and Word Alignment Attributes, ug476 p.235
    .ALIGN_COMMA_WORD                                           (ALIGN_COMMA_WORD),
    .ALIGN_COMMA_ENABLE                                         (ALIGN_COMMA_ENABLE),
    .ALIGN_COMMA_DOUBLE                                         (ALIGN_COMMA_DOUBLE),
    .ALIGN_MCOMMA_DET                                           (ALIGN_MCOMMA_DET),
    .ALIGN_MCOMMA_VALUE                                         (ALIGN_MCOMMA_VALUE),
    .ALIGN_PCOMMA_DET                                           (ALIGN_PCOMMA_DET),
    .ALIGN_PCOMMA_VALUE                                         (ALIGN_PCOMMA_VALUE),
    .SHOW_REALIGN_COMMA                                         (SHOW_REALIGN_COMMA),
    .RXSLIDE_MODE                                               (RXSLIDE_MODE),
    .RXSLIDE_AUTO_WAIT                                          (RXSLIDE_AUTO_WAIT),
    .RX_SIG_VALID_DLY                                           (RX_SIG_VALID_DLY),
    //.COMMA_ALIGN_LATENCY                                        (COMMA_ALIGN_LATENCY),
// RX 8B/10B Decoder Attributes, ug476 p.242
    .RX_DISPERR_SEQ_MATCH                                       (RX_DISPERR_SEQ_MATCH),
    .DEC_MCOMMA_DETECT                                          (DEC_MCOMMA_DETECT),
    .DEC_PCOMMA_DETECT                                          (DEC_PCOMMA_DETECT),
    .DEC_VALID_COMMA_ONLY                                       (DEC_VALID_COMMA_ONLY),
    .UCODEER_CLR                                                (UCODEER_CLR),
// RX Buffer Bypass Attributes, ug476 p.247
    .RXBUF_EN                                                   (RXBUF_EN),
    .RX_XCLK_SEL                                                (RX_XCLK_SEL),
    .RXPH_CFG                                                   (RXPH_CFG),
    .RXPH_MONITOR_SEL                                           (RXPH_MONITOR_SEL),
    .RXPHDLY_CFG                                                (RXPHDLY_CFG),
    .RXDLY_CFG                                                  (RXDLY_CFG),
    .RXDLY_LCFG                                                 (RXDLY_LCFG),
    .RXDLY_TAP_CFG                                              (RXDLY_TAP_CFG),
    .RX_DDI_SEL                                                 (RX_DDI_SEL),
    .TST_RSV                                                    (TST_RSV),
// RX Buffer Attributes, ug476 p.259
    .RX_BUFFER_CFG                                              (RX_BUFFER_CFG),
    .RX_DEFER_RESET_BUF_EN                                      (RX_DEFER_RESET_BUF_EN),
    .RXBUF_ADDR_MODE                                            (RXBUF_ADDR_MODE),
    .RXBUF_EIDLE_HI_CNT                                         (RXBUF_EIDLE_HI_CNT),
    .RXBUF_EIDLE_LO_CNT                                         (RXBUF_EIDLE_LO_CNT),
    .RXBUF_RESET_ON_CB_CHANGE                                   (RXBUF_RESET_ON_CB_CHANGE),
    .RXBUF_RESET_ON_COMMAALIGN                                  (RXBUF_RESET_ON_COMMAALIGN),
    .RXBUF_RESET_ON_EIDLE                                       (RXBUF_RESET_ON_EIDLE),
    .RXBUF_THRESH_OVFLW                                         (RXBUF_THRESH_OVFLW),
    .RXBUF_THRESH_OVRD                                          (RXBUF_THRESH_OVRD),
    .RXBUF_THRESH_UNDFLW                                        (RXBUF_THRESH_UNDFLW),
// RX Clock Correction Attributes, ug476 p.265
    .CBCC_DATA_SOURCE_SEL                                       (CBCC_DATA_SOURCE_SEL),
    .CLK_CORRECT_USE                                            (CLK_CORRECT_USE),
    .CLK_COR_SEQ_2_USE                                          (CLK_COR_SEQ_2_USE),
    .CLK_COR_KEEP_IDLE                                          (CLK_COR_KEEP_IDLE),
    .CLK_COR_MAX_LAT                                            (CLK_COR_MAX_LAT),
    .CLK_COR_MIN_LAT                                            (CLK_COR_MIN_LAT),
    .CLK_COR_PRECEDENCE                                         (CLK_COR_PRECEDENCE),
    .CLK_COR_REPEAT_WAIT                                        (CLK_COR_REPEAT_WAIT),
    .CLK_COR_SEQ_LEN                                            (CLK_COR_SEQ_LEN),
    .CLK_COR_SEQ_1_ENABLE                                       (CLK_COR_SEQ_1_ENABLE),
    .CLK_COR_SEQ_1_1                                            (CLK_COR_SEQ_1_1),
    .CLK_COR_SEQ_1_2                                            (CLK_COR_SEQ_1_2),
    .CLK_COR_SEQ_1_3                                            (CLK_COR_SEQ_1_3),
    .CLK_COR_SEQ_1_4                                            (CLK_COR_SEQ_1_4),
    .CLK_COR_SEQ_2_ENABLE                                       (CLK_COR_SEQ_2_ENABLE),
    .CLK_COR_SEQ_2_1                                            (CLK_COR_SEQ_2_1),
    .CLK_COR_SEQ_2_2                                            (CLK_COR_SEQ_2_2),
    .CLK_COR_SEQ_2_3                                            (CLK_COR_SEQ_2_3),
    .CLK_COR_SEQ_2_4                                            (CLK_COR_SEQ_2_4),
// RX Channel Bonding Attributes, ug476 p.276
    .CHAN_BOND_MAX_SKEW                                         (CHAN_BOND_MAX_SKEW),
    .CHAN_BOND_KEEP_ALIGN                                       (CHAN_BOND_KEEP_ALIGN),
    .CHAN_BOND_SEQ_LEN                                          (CHAN_BOND_SEQ_LEN),
    .CHAN_BOND_SEQ_1_1                                          (CHAN_BOND_SEQ_1_1),
    .CHAN_BOND_SEQ_1_2                                          (CHAN_BOND_SEQ_1_2),
    .CHAN_BOND_SEQ_1_3                                          (CHAN_BOND_SEQ_1_3),
    .CHAN_BOND_SEQ_1_4                                          (CHAN_BOND_SEQ_1_4),
    .CHAN_BOND_SEQ_1_ENABLE                                     (CHAN_BOND_SEQ_1_ENABLE),
    .CHAN_BOND_SEQ_2_1                                          (CHAN_BOND_SEQ_2_1),
    .CHAN_BOND_SEQ_2_2                                          (CHAN_BOND_SEQ_2_2),
    .CHAN_BOND_SEQ_2_3                                          (CHAN_BOND_SEQ_2_3),
    .CHAN_BOND_SEQ_2_4                                          (CHAN_BOND_SEQ_2_4),
    .CHAN_BOND_SEQ_2_ENABLE                                     (CHAN_BOND_SEQ_2_ENABLE),
    .CHAN_BOND_SEQ_2_USE                                        (CHAN_BOND_SEQ_2_USE),
    .FTS_DESKEW_SEQ_ENABLE                                      (FTS_DESKEW_SEQ_ENABLE),
    .FTS_LANE_DESKEW_CFG                                        (FTS_LANE_DESKEW_CFG),
    .FTS_LANE_DESKEW_EN                                         (FTS_LANE_DESKEW_EN),
    .PCS_PCIE_EN                                                (PCS_PCIE_EN),
// RX Gearbox Attributes, ug476 p.287
    .RXGEARBOX_EN                                               (RXGEARBOX_EN),

// ug476 table p.326 - undocumented parameters
    .RX_CLK25_DIV                                               (RX_CLK25_DIV),
    .TX_CLK25_DIV                                               (TX_CLK25_DIV)
)
`ifdef OPEN_SOURCE_ONLY
gtx_gpl(
`else // OPEN_SOURCE_ONLY
gtx_unisims(
`endif // OPEN_SOURCE_ONLY
// clocking ports, UG476 p.37
    .CPLLREFCLKSEL                                              (CPLLREFCLKSEL),
    .GTGREFCLK                                                  (GTGREFCLK),
    .GTNORTHREFCLK0                                             (GTNORTHREFCLK0),
    .GTNORTHREFCLK1                                             (GTNORTHREFCLK1),
    .GTREFCLK0                                                  (GTREFCLK0),
    .GTREFCLK1                                                  (GTREFCLK1),
    .GTSOUTHREFCLK0                                             (GTSOUTHREFCLK0),
    .GTSOUTHREFCLK1                                             (GTSOUTHREFCLK1),
    .RXSYSCLKSEL                                                (RXSYSCLKSEL),
    .TXSYSCLKSEL                                                (TXSYSCLKSEL),
    .GTREFCLKMONITOR                                            (GTREFCLKMONITOR),
// CPLL Ports, UG476 p.48
    .CPLLLOCKDETCLK                                             (CPLLLOCKDETCLK),
    .CPLLLOCKEN                                                 (CPLLLOCKEN),
    .CPLLPD                                                     (CPLLPD),
    .CPLLRESET                                                  (CPLLRESET),
    .CPLLFBCLKLOST                                              (CPLLFBCLKLOST),
    .CPLLLOCK                                                   (CPLLLOCK),
    .CPLLREFCLKLOST                                             (CPLLREFCLKLOST),
    .TSTOUT                                                     (TSTOUT),
    .GTRSVD                                                     (GTRSVD),
    .PCSRSVDIN                                                  (PCSRSVDIN),
    .PCSRSVDIN2                                                 (PCSRSVDIN2),
    .PMARSVDIN                                                  (PMARSVDIN),
    .PMARSVDIN2                                                 (PMARSVDIN2),
    .TSTIN                                                      (TSTIN),
// Reset Mode ports, ug476 p.62
    .GTRESETSEL                                                 (GTRESETSEL),
    .RESETOVRD                                                  (RESETOVRD),
// TX Reset ports, ug476 p.65
    .CFGRESET                                                   (CFGRESET),
    .GTTXRESET                                                  (GTTXRESET),
    .TXPCSRESET                                                 (TXPCSRESET),
    .TXPMARESET                                                 (TXPMARESET),
    .TXRESETDONE                                                (TXRESETDONE),
    .TXUSERRDY                                                  (TXUSERRDY),
    .PCSRSVDOUT                                                 (PCSRSVDOUT),
// RX Reset ports, UG476 p.73
    .GTRXRESET                                                  (GTRXRESET),
    .RXPMARESET                                                 (RXPMARESET),
    .RXCDRRESET                                                 (RXCDRRESET),
    .RXCDRFREQRESET                                             (RXCDRFREQRESET),
    .RXDFELPMRESET                                              (RXDFELPMRESET),
    .EYESCANRESET                                               (EYESCANRESET),
    .RXPCSRESET                                                 (RXPCSRESET),
    .RXBUFRESET                                                 (RXBUFRESET),
    .RXUSERRDY                                                  (RXUSERRDY),
    .RXRESETDONE                                                (RXRESETDONE),
    .RXOOBRESET                                                 (RXOOBRESET),
// Power Down ports, ug476 p.88
    .RXPD                                                       (RXPD),
    .TXPD                                                       (TXPD),
    .TXPDELECIDLEMODE                                           (TXPDELECIDLEMODE),
    .TXPHDLYPD                                                  (TXPHDLYPD),
    .RXPHDLYPD                                                  (RXPHDLYPD),
// Loopback ports, ug476 p.91
    .LOOPBACK                                                   (LOOPBACK),
// Dynamic Reconfiguration Port, ug476 p.92
    .DRPADDR                                                    (DRPADDR),
    .DRPCLK                                                     (DRPCLK),
    .DRPDI                                                      (DRPDI),
    .DRPDO                                                      (DRPDO),
    .DRPEN                                                      (DRPEN),
    .DRPRDY                                                     (DRPRDY),
    .DRPWE                                                      (DRPWE),
// Digital Monitor Ports, ug476 p.95
    .CLKRSVD                                                    (CLKRSVD),
    .DMONITOROUT                                                (DMONITOROUT),
// TX Interface Ports, ug476 p.110
    .TXCHARDISPMODE                                             (TXCHARDISPMODE),
    .TXCHARDISPVAL                                              (TXCHARDISPVAL),
    .TXDATA                                                     (TXDATA),
    .TXUSRCLK                                                   (TXUSRCLK),
    .TXUSRCLK2                                                  (TXUSRCLK2),
// TX 8B/10B encoder ports, ug476 p.118
    .TX8B10BBYPASS                                              (TX8B10BBYPASS),
    .TX8B10BEN                                                  (TX8B10BEN),
    .TXCHARISK                                                  (TXCHARISK),
// TX Gearbox ports, ug476 p.122
    .TXGEARBOXREADY                                             (TXGEARBOXREADY),
    .TXHEADER                                                   (TXHEADER),
    .TXSEQUENCE                                                 (TXSEQUENCE),
    .TXSTARTSEQ                                                 (TXSTARTSEQ),
// TX BUffer Ports, ug476 p.134
    .TXBUFSTATUS                                                (TXBUFSTATUS),
// TX Buffer Bypass Ports, ug476 p.136
    .TXDLYSRESET                                                (TXDLYSRESET),
    .TXPHALIGN                                                  (TXPHALIGN),
    .TXPHALIGNEN                                                (TXPHALIGNEN),
    .TXPHINIT                                                   (TXPHINIT),
    .TXPHOVRDEN                                                 (TXPHOVRDEN),
    .TXPHDLYRESET                                               (TXPHDLYRESET),
    .TXDLYBYPASS                                                (TXDLYBYPASS),
    .TXDLYEN                                                    (TXDLYEN),
    .TXDLYOVRDEN                                                (TXDLYOVRDEN),
    .TXPHDLYTSTCLK                                              (TXPHDLYTSTCLK),
    .TXDLYHOLD                                                  (TXDLYHOLD),
    .TXDLYUPDOWN                                                (TXDLYUPDOWN),
    .TXPHALIGNDONE                                              (TXPHALIGNDONE),
    .TXPHINITDONE                                               (TXPHINITDONE),
    .TXDLYSRESETDONE                                            (TXDLYSRESETDONE),
/*    .TXSYNCMODE                                                 (TXSYNCMODE),
    .TXSYNCALLIN                                                (TXSYNCALLIN),
    .TXSYNCIN                                                   (TXSYNCIN),
    .TXSYNCOUT                                                  (TXSYNCOUT),
    .TXSYNCDONE                                                 (TXSYNCDONE),*/
// TX Pattern Generator, ug476 p.147
    .TXPRBSSEL                                                  (TXPRBSSEL),
    .TXPRBSFORCEERR                                             (TXPRBSFORCEERR),
// TX Polarity Control Ports, ug476 p.149
    .TXPOLARITY                                                 (TXPOLARITY),
// TX Fabric Clock Output Control Ports, ug476 p.152
    .TXOUTCLKSEL                                                (TXOUTCLKSEL),
    .TXRATE                                                     (TXRATE),
    .TXOUTCLKFABRIC                                             (TXOUTCLKFABRIC),
    .TXOUTCLK                                                   (TXOUTCLK),
    .TXOUTCLKPCS                                                (TXOUTCLKPCS),
    .TXRATEDONE                                                 (TXRATEDONE),
// TX Phase Interpolator PPM Controller Ports, ug476 p.154
// GTH only
/*    input               TXPIPPMEN,
    .TXPIPPMOVRDEN                                              (TXPIPPMOVRDEN),
    .TXPIPPMSEL                                                 (TXPIPPMSEL),
    .TXPIPPMPD                                                  (TXPIPPMPD),
    .TXPIPPMSTEPSIZE                                            (TXPIPPMSTEPSIZE),*/
// TX Configurable Driver Ports, ug476 p.156
    .TXBUFDIFFCTRL                                              (TXBUFDIFFCTRL),
    .TXDEEMPH                                                   (TXDEEMPH),
    .TXDIFFCTRL                                                 (TXDIFFCTRL),
    .TXELECIDLE                                                 (TXELECIDLE),
    .TXINHIBIT                                                  (TXINHIBIT),
    .TXMAINCURSOR                                               (TXMAINCURSOR),
    .TXMARGIN                                                   (TXMARGIN),
    .TXQPIBIASEN                                                (TXQPIBIASEN),
    .TXQPISENN                                                  (TXQPISENN),
    .TXQPISENP                                                  (TXQPISENP),
    .TXQPISTRONGPDOWN                                           (TXQPISTRONGPDOWN),
    .TXQPIWEAKPUP                                               (TXQPIWEAKPUP),
    .TXPOSTCURSOR                                               (TXPOSTCURSOR),
    .TXPOSTCURSORINV                                            (TXPOSTCURSORINV),
    .TXPRECURSOR                                                (TXPRECURSOR),
    .TXPRECURSORINV                                             (TXPRECURSORINV),
    .TXSWING                                                    (TXSWING),
    .TXDIFFPD                                                   (TXDIFFPD),
    .TXPISOPD                                                   (TXPISOPD),
// TX Receiver Detection Ports, ug476 p.165
    .TXDETECTRX                                                 (TXDETECTRX),
    .PHYSTATUS                                                  (PHYSTATUS),
    .RXSTATUS                                                   (RXSTATUS),
// TX OOB Signaling Ports, ug476 p.166
    .TXCOMFINISH                                                (TXCOMFINISH),
    .TXCOMINIT                                                  (TXCOMINIT),
    .TXCOMSAS                                                   (TXCOMSAS),
    .TXCOMWAKE                                                  (TXCOMWAKE),
// RX AFE Ports, ug476 p.171
    .RXQPISENN                                                  (RXQPISENN),
    .RXQPISENP                                                  (RXQPISENP),
    .RXQPIEN                                                    (RXQPIEN),
// RX OOB Signaling Ports, ug476 p.178
    .RXELECIDLEMODE                                             (RXELECIDLEMODE),
    .RXELECIDLE                                                 (RXELECIDLE),
    .RXCOMINITDET                                               (RXCOMINITDET),
    .RXCOMSASDET                                                (RXCOMSASDET),
    .RXCOMWAKEDET                                               (RXCOMWAKEDET),
// RX Equalizer Ports, ug476 p.189
    .RXLPMEN                                                    (RXLPMEN),
    .RXOSHOLD                                                   (RXOSHOLD),
    .RXOSOVRDEN                                                 (RXOSOVRDEN),
    .RXLPMLFHOLD                                                (RXLPMLFHOLD),
    .RXLPMLFKLOVRDEN                                            (RXLPMLFKLOVRDEN),
    .RXLPMHFHOLD                                                (RXLPMHFHOLD),
    .RXLPMHFOVRDEN                                              (RXLPMHFOVRDEN),
    .RXDFEAGCHOLD                                               (RXDFEAGCHOLD),
    .RXDFEAGCOVRDEN                                             (RXDFEAGCOVRDEN),
    .RXDFELFHOLD                                                (RXDFELFHOLD),
    .RXDFELFOVRDEN                                              (RXDFELFOVRDEN),
    .RXDFEUTHOLD                                                (RXDFEUTHOLD),
    .RXDFEUTOVRDEN                                              (RXDFEUTOVRDEN),
    // this signal shall be present only in GTH, but for some reason it's included in unisims gtxe2 
    .RXDFEVSEN                                                  (1'b0),
    .RXDFEVPHOLD                                                (RXDFEVPHOLD),
    .RXDFEVPOVRDEN                                              (RXDFEVPOVRDEN),
    .RXDFETAP2HOLD                                              (RXDFETAP2HOLD),
    .RXDFETAP2OVRDEN                                            (RXDFETAP2OVRDEN),
    .RXDFETAP3HOLD                                              (RXDFETAP3HOLD),
    .RXDFETAP3OVRDEN                                            (RXDFETAP3OVRDEN),
    .RXDFETAP4HOLD                                              (RXDFETAP4HOLD),
    .RXDFETAP4OVRDEN                                            (RXDFETAP4OVRDEN),
    .RXDFETAP5HOLD                                              (RXDFETAP5HOLD),
    .RXDFETAP5OVRDEN                                            (RXDFETAP5OVRDEN),
    .RXDFECM1EN                                                 (RXDFECM1EN),
    .RXDFEXYDHOLD                                               (RXDFEXYDHOLD),
    .RXDFEXYDOVRDEN                                             (RXDFEXYDOVRDEN),
    .RXDFEXYDEN                                                 (RXDFEXYDEN),
    .RXMONITORSEL                                               (RXMONITORSEL),
    .RXMONITOROUT                                               (RXMONITOROUT),
// CDR Ports, ug476 p.202
    .RXCDRHOLD                                                  (RXCDRHOLD),
    .RXCDROVRDEN                                                (RXCDROVRDEN),
    .RXCDRRESETRSV                                              (RXCDRRESETRSV),
    .RXRATE                                                     (RXRATE),
    .RXCDRLOCK                                                  (RXCDRLOCK),
// RX Fabric Clock Output Control Ports, ug476 p.213
    .RXOUTCLKSEL                                                (RXOUTCLKSEL),
    .RXOUTCLKFABRIC                                             (RXOUTCLKFABRIC),
    .RXOUTCLK                                                   (RXOUTCLK),
    .RXOUTCLKPCS                                                (RXOUTCLKPCS),
    .RXRATEDONE                                                 (RXRATEDONE),
    .RXDLYBYPASS                                                (RXDLYBYPASS),
// RX Margin Analysis Ports, ug476 p.220
    .EYESCANDATAERROR                                           (EYESCANDATAERROR),
    .EYESCANTRIGGER                                             (EYESCANTRIGGER),
    .EYESCANMODE                                                (EYESCANMODE),
// RX Polarity Control Ports, ug476 p.224
    .RXPOLARITY                                                 (RXPOLARITY),
// Pattern Checker Ports, ug476 p.225
    .RXPRBSCNTRESET                                             (RXPRBSCNTRESET),
    .RXPRBSSEL                                                  (RXPRBSSEL),
    .RXPRBSERR                                                  (RXPRBSERR),
// RX Byte and Word Alignment Ports, ug476 p.233
    .RXBYTEISALIGNED                                            (RXBYTEISALIGNED),
    .RXBYTEREALIGN                                              (RXBYTEREALIGN),
    .RXCOMMADET                                                 (RXCOMMADET),
    .RXCOMMADETEN                                               (RXCOMMADETEN),
    .RXPCOMMAALIGNEN                                            (RXPCOMMAALIGNEN),
    .RXMCOMMAALIGNEN                                            (RXMCOMMAALIGNEN),
    .RXSLIDE                                                    (RXSLIDE),
// RX 8B/10B Decoder Ports, ug476 p.24
    .RX8B10BEN                                                  (RX8B10BEN),
    .RXCHARISCOMMA                                              (RXCHARISCOMMA),
    .RXCHARISK                                                  (RXCHARISK),
    .RXDISPERR                                                  (RXDISPERR),
    .RXNOTINTABLE                                               (RXNOTINTABLE),
    .SETERRSTATUS                                               (SETERRSTATUS),
// RX Buffer Bypass Ports, ug476 p.244
    .RXPHDLYRESET                                               (RXPHDLYRESET),
    .RXPHALIGN                                                  (RXPHALIGN),
    .RXPHALIGNEN                                                (RXPHALIGNEN),
    .RXPHOVRDEN                                                 (RXPHOVRDEN),
    .RXDLYSRESET                                                (RXDLYSRESET),
    .RXDLYEN                                                    (RXDLYEN),
    .RXDLYOVRDEN                                                (RXDLYOVRDEN),
    .RXDDIEN                                                    (RXDDIEN),
    .RXPHALIGNDONE                                              (RXPHALIGNDONE),
    .RXPHMONITOR                                                (RXPHMONITOR),
    .RXPHSLIPMONITOR                                            (RXPHSLIPMONITOR),
    .RXDLYSRESETDONE                                            (RXDLYSRESETDONE),
// RX Buffer Ports, ug476 p.259
    .RXBUFSTATUS                                                (RXBUFSTATUS),
// RX Clock Correction Ports, ug476 p.263
    .RXCLKCORCNT                                                (RXCLKCORCNT),
// RX Channel Bonding Ports, ug476 p.274
    .RXCHANBONDSEQ                                              (RXCHANBONDSEQ),
    .RXCHANISALIGNED                                            (RXCHANISALIGNED),
    .RXCHANREALIGN                                              (RXCHANREALIGN),
    .RXCHBONDI                                                  (RXCHBONDI),
    .RXCHBONDO                                                  (RXCHBONDO),
    .RXCHBONDLEVEL                                              (RXCHBONDLEVEL),
    .RXCHBONDMASTER                                             (RXCHBONDMASTER),
    .RXCHBONDSLAVE                                              (RXCHBONDSLAVE),
    .RXCHBONDEN                                                 (RXCHBONDEN),
// RX Gearbox Ports, ug476 p.285
    .RXDATAVALID                                                (RXDATAVALID),
    .RXGEARBOXSLIP                                              (RXGEARBOXSLIP),
    .RXHEADER                                                   (RXHEADER),
    .RXHEADERVALID                                              (RXHEADERVALID),
    .RXSTARTOFSEQ                                               (RXSTARTOFSEQ),
// FPGA RX Interface Ports, ug476 p.299
    .RXDATA                                                     (RXDATA),
    .RXUSRCLK                                                   (RXUSRCLK),
    .RXUSRCLK2                                                  (RXUSRCLK2),

// ug476, p.323
    .RXVALID                                                    (RXVALID),
// for correct clocking scheme in case of multilane structure
    .QPLLCLK                                                    (QPLLCLK),
    .QPLLREFCLK                                                 (QPLLREFCLK),

// Diffpairs
    .GTXRXP                                                     (GTXRXP),
    .GTXRXN                                                     (GTXRXN),
    .GTXTXN                                                     (GTXTXN),
    .GTXTXP                                                     (GTXTXP)
);

endmodule
