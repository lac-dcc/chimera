// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sata_phy_dev
 * @file sata_phy_dev.v
 * @date  2015-07-11  
 * @author Alexey     
 *
 * @brief phy-level, including oob, clock generation and GTXE2 
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * sata_phy_dev.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * sata_phy_dev.v file is distributed in the hope that it will be useful,
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
//`include "oob_dev.v"
module sata_phy_dev #(
    parameter DATA_BYTE_WIDTH = 4
)
(
    // initial reset, resets PLL. After pll is locked, an internal sata reset is generated.
    input   wire        extrst,
    // sata clk, generated in pll as usrclk2
    output  wire        clk,
    output  wire        rst,

    // state
    output  wire        phy_ready,

    // top-level ifaces
    // ref clk from an external source, shall be connected to pads
    input   wire        extclk_p, 
    input   wire        extclk_n,
    // sata link data pins
    output  wire        txp_out,
    output  wire        txn_out,
    input   wire        rxp_in,
    input   wire        rxn_in,

    // to link layer
    output  wire    [31:0]  ll_data_out,
    output  wire    [3:0]   ll_charisk_out,
    output  wire    [3:0]   ll_err_out, // TODO!!!

    // from link layer
    input   wire    [31:0]  ll_data_in,
    input   wire    [3:0]   ll_charisk_in,
    
    input           [4:0]  serial_delay // delay output to check host alignment

);

wire    [31:0]  txdata;
wire    [31:0]  txdata_oob;
wire    [3:0]   txcharisk;
wire    [3:0]   txcharisk_oob;
wire    [63:0]  rxdata;
wire    [63:0]  rxdata_gtx;
wire    [7:0]   rxcharisk;
wire    [7:0]   rxcharisk_gtx;
wire    [7:0]   rxchariscomma;
wire    [7:0]   rxchariscomma_gtx;
wire    [7:0]   rxdisperr;
wire    [7:0]   rxdisperr_gtx;
wire    [7:0]   rxnotintable;
wire    [7:0]   rxnotintable_gtx;
//wire    [31:0]  rxdata_out;
//wire    [31:0]  txdata_in;
//wire    [3:0]   txcharisk_in;
//wire    [3:0]   rxcharisk_out;
               
wire            rxcomwakedet;
wire            rxcominitdet;
wire            cplllock;
wire            txcominit;
wire            txcomwake;
wire            rxreset;
wire            rxelecidle;
wire            txelecidle;
wire            rxbyteisaligned;
wire            txpcsreset_req;
wire            recal_tx_done;

wire            gtx_ready;

assign  txdata          = phy_ready ? ll_data_in : txdata_oob;
assign  txcharisk       = phy_ready ? ll_charisk_in : txcharisk_oob;
assign  ll_err_out      = 4'h0;
assign  ll_charisk_out  = rxcharisk[3:0];
assign  ll_data_out     = rxdata[31:0];


oob_dev oob_dev(
    // sata clk = usrclk2
    .clk                (clk),
    // reset oob
    .rst                (rst),
    // gtx is ready = all resets are done
    .gtx_ready          (gtx_ready),
    // oob responses
    .rxcominitdet_in    (rxcominitdet),
    .rxcomwakedet_in    (rxcomwakedet),
    .rxelecidle_in      (rxelecidle),
    // oob issues
    .txcominit          (txcominit),
    .txcomwake          (txcomwake),
    .txelecidle         (txelecidle),

    .txpcsreset_req     (txpcsreset_req),
    .recal_tx_done      (recal_tx_done),

    // output data stream to gtx
    .txdata_out         (txdata_oob),
    .txcharisk_out      (txcharisk_oob),
    // input data from gtx
    .rxdata_in          (rxdata[31:0]),
    .rxcharisk_in       (rxcharisk[3:0]),

    // shows if channel is ready
    .link_up            (phy_ready)
);

wire    cplllockdetclk; // TODO
wire    drpclk; // TODO
wire    cpllreset;
wire    gtrefclk;
wire    rxresetdone;
wire    txresetdone;
wire    txpcsreset;
wire    txreset;
wire    txuserrdy;
wire    rxuserrdy;
wire    txusrclk;
wire    txusrclk2;
wire    rxusrclk;
wire    rxusrclk2;
wire    txp;
wire    txn;
wire    rxp;
wire    rxn;
wire    txoutclk;
wire    txpmareset_done;
wire    rxeyereset_done;

// tx reset sequence; waves @ ug476 p67
localparam  TXPMARESET_TIME = 5'h1;
reg     [2:0]   txpmareset_cnt;
assign  txpmareset_done = txpmareset_cnt == TXPMARESET_TIME;
always @ (posedge gtrefclk)
    txpmareset_cnt  <= txreset ? 3'h0 : txpmareset_done ? txpmareset_cnt : txpmareset_cnt + 1'b1;

// rx reset sequence; waves @ ug476 p77
localparam  RXPMARESET_TIME     = 5'h11;
localparam  RXCDRPHRESET_TIME   = 5'h1;
localparam  RXCDRFREQRESET_TIME = 5'h1;
localparam  RXDFELPMRESET_TIME  = 7'hf;
localparam  RXISCANRESET_TIME   = 5'h1;
localparam  RXEYERESET_TIME     = 7'h0 + RXPMARESET_TIME + RXCDRPHRESET_TIME + RXCDRFREQRESET_TIME + RXDFELPMRESET_TIME + RXISCANRESET_TIME;
reg     [6:0]   rxeyereset_cnt;
assign  rxeyereset_done = rxeyereset_cnt == RXEYERESET_TIME;
always @ (posedge gtrefclk)
    rxeyereset_cnt  <= rxreset ? 7'h0 : rxeyereset_done ? rxeyereset_cnt : rxeyereset_cnt + 1'b1;

/*
 * Resets
 */
wire    usrpll_locked;

assign  cpllreset = extrst;
assign  rxreset = ~cplllock | cpllreset;
assign  txreset = ~cplllock | cpllreset;
assign  rxuserrdy = usrpll_locked & cplllock & ~cpllreset & ~rxreset & rxeyereset_done;
assign  txuserrdy = usrpll_locked & cplllock & ~cpllreset & ~txreset & txpmareset_done;

assign  gtx_ready = rxuserrdy & txuserrdy & rxresetdone & txresetdone;

// issue partial tx reset to restore functionality after oob sequence. Let it lasts 8 clock lycles
reg [3:0]   txpcsreset_cnt;
wire        txpcsreset_stop;

assign  txpcsreset_stop = txpcsreset_cnt[3];
assign  txpcsreset = txpcsreset_req & ~txpcsreset_stop;
assign  recal_tx_done = txpcsreset_stop & gtx_ready;

always @ (posedge clk or posedge extrst)
    txpcsreset_cnt <= extrst | rst | ~txpcsreset_req ? 4'h0 : txpcsreset_stop ? txpcsreset_cnt : txpcsreset_cnt + 1'b1;

// generate internal reset after a clock is established
// !!!ATTENTION!!!
// async rst block
reg [7:0]   rst_timer;
reg         rst_r;
localparam [7:0] RST_TIMER_LIMIT = 8'b1000;
always @ (posedge clk or posedge extrst)
    rst_timer <= extrst | ~cplllock | ~usrpll_locked ? 8'h0 : rst_timer == RST_TIMER_LIMIT ? rst_timer : rst_timer + 1'b1;

assign  rst = rst_r;
always @ (posedge clk or posedge extrst)
    rst_r <= extrst | ~|rst_timer ? 1'b0 : rst_timer[3] ? 1'b0 : 1'b1;



/*
 * USRCLKs generation. USRCLK @ 150MHz, same as TXOUTCLK; USRCLK2 @ 75Mhz -> sata_clk === sclk
 * It's recommended to use MMCM instead of PLL, whatever
 */
wire    usrpll_fb_clk;
wire    usrclk;
wire    usrclk2;

assign  txusrclk  = usrclk;
assign  txusrclk2 = usrclk2;
assign  rxusrclk  = usrclk;
assign  rxusrclk2 = usrclk2;

PLLE2_ADV #(
    .BANDWIDTH              ("OPTIMIZED"),
    .CLKFBOUT_MULT          (8),
    .CLKFBOUT_PHASE         (0.000),
    .CLKIN1_PERIOD          (6.666),
    .CLKIN2_PERIOD          (0.000),
    .CLKOUT0_DIVIDE         (8),
    .CLKOUT0_DUTY_CYCLE     (0.500),
    .CLKOUT0_PHASE          (0.000),
    .CLKOUT1_DIVIDE         (16),
    .CLKOUT1_DUTY_CYCLE     (0.500),
    .CLKOUT1_PHASE          (0.000),
/*    .CLKOUT2_DIVIDE = 1,
    .CLKOUT2_DUTY_CYCLE = 0.500,
    .CLKOUT2_PHASE = 0.000,
    .CLKOUT3_DIVIDE = 1,
    .CLKOUT3_DUTY_CYCLE = 0.500,
    .CLKOUT3_PHASE = 0.000,
    .CLKOUT4_DIVIDE = 1,
    .CLKOUT4_DUTY_CYCLE = 0.500,
    .CLKOUT4_PHASE = 0.000,
    .CLKOUT5_DIVIDE = 1,
    .CLKOUT5_DUTY_CYCLE = 0.500,
    .CLKOUT5_PHASE = 0.000,*/
    .COMPENSATION           ("ZHOLD"),
    .DIVCLK_DIVIDE          (1),
    .IS_CLKINSEL_INVERTED   (1'b0),
    .IS_PWRDWN_INVERTED     (1'b0),
    .IS_RST_INVERTED        (1'b0),
    .REF_JITTER1            (0.010),
    .REF_JITTER2            (0.010),
    .STARTUP_WAIT           ("FALSE")
)
usrclk_pll(
  .CLKFBOUT (usrpll_fb_clk),
  .CLKOUT0  (usrclk),
  .CLKOUT1  (usrclk2),
  .CLKOUT2  (),
  .CLKOUT3  (),
  .CLKOUT4  (),
  .CLKOUT5  (),
  .DO       (),
  .DRDY     (),
  .LOCKED   (usrpll_locked),

  .CLKFBIN  (usrpll_fb_clk),
  .CLKIN1   (txoutclk),
  .CLKIN2   (1'b0),
  .CLKINSEL (1'b1),
  .DADDR    (7'h0),
  .DCLK     (drpclk),
  .DEN      (1'b0),
  .DI       (16'h0),
  .DWE      (1'b0),
  .PWRDWN   (1'b0),
  .RST      (~cplllock)
);

/*
 * Padding for an external input clock @ 150 MHz
 */
localparam [1:0] CLKSWING_CFG = 2'b11;
IBUFDS_GTE2 #(
    .CLKRCV_TRST   ("TRUE"),
    .CLKCM_CFG      ("TRUE"),
    .CLKSWING_CFG   (CLKSWING_CFG)
)
ext_clock_buf(
    .I      (extclk_p),
    .IB     (extclk_n),
    .CEB    (1'b0),
    .O      (gtrefclk),
    .ODIV2  ()
);

gtxe2_channel_wrapper #(
    .SIM_RECEIVER_DETECT_PASS               ("TRUE"),
    .SIM_TX_EIDLE_DRIVE_LEVEL               ("X"),
    .SIM_RESET_SPEEDUP                      ("FALSE"),
    .SIM_CPLLREFCLK_SEL                     (3'b001),
    .SIM_VERSION                            ("4.0"),
    .ALIGN_COMMA_DOUBLE                     ("FALSE"),
    .ALIGN_COMMA_ENABLE                     (10'b1111111111),
    .ALIGN_COMMA_WORD                       (1),
    .ALIGN_MCOMMA_DET                       ("TRUE"),
    .ALIGN_MCOMMA_VALUE                     (10'b1010000011),
    .ALIGN_PCOMMA_DET                       ("TRUE"),
    .ALIGN_PCOMMA_VALUE                     (10'b0101111100),
    .SHOW_REALIGN_COMMA                     ("TRUE"),
    .RXSLIDE_AUTO_WAIT                      (7),
    .RXSLIDE_MODE                           ("OFF"),
    .RX_SIG_VALID_DLY                       (10),
    .RX_DISPERR_SEQ_MATCH                   ("TRUE"),
    .DEC_MCOMMA_DETECT                      ("TRUE"),
    .DEC_PCOMMA_DETECT                      ("TRUE"),
    .DEC_VALID_COMMA_ONLY                   ("FALSE"),
    .CBCC_DATA_SOURCE_SEL                   ("DECODED"),
    .CLK_COR_SEQ_2_USE                      ("FALSE"),
    .CLK_COR_KEEP_IDLE                      ("FALSE"),
    .CLK_COR_MAX_LAT                        (9),
    .CLK_COR_MIN_LAT                        (7),
    .CLK_COR_PRECEDENCE                     ("TRUE"),
    .CLK_COR_REPEAT_WAIT                    (0),
    .CLK_COR_SEQ_LEN                        (1),
    .CLK_COR_SEQ_1_ENABLE                   (4'b1111),
    .CLK_COR_SEQ_1_1                        (10'b0100000000),
    .CLK_COR_SEQ_1_2                        (10'b0000000000),
    .CLK_COR_SEQ_1_3                        (10'b0000000000),
    .CLK_COR_SEQ_1_4                        (10'b0000000000),
    .CLK_CORRECT_USE                        ("FALSE"),
    .CLK_COR_SEQ_2_ENABLE                   (4'b1111),
    .CLK_COR_SEQ_2_1                        (10'b0100000000),
    .CLK_COR_SEQ_2_2                        (10'b0000000000),
    .CLK_COR_SEQ_2_3                        (10'b0000000000),
    .CLK_COR_SEQ_2_4                        (10'b0000000000),
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
    .RX_DATA_WIDTH                          (40),
    .OUTREFCLK_SEL_INV                      (2'b11),
    .PMA_RSV                                (32'h00018480),
    .PMA_RSV2                               (16'h2050),
    .PMA_RSV3                               (2'b00),
    .PMA_RSV4                               (32'h00000000),
    .RX_BIAS_CFG                            (12'b000000000100),
    .DMONITOR_CFG                           (24'h000A00),
    .RX_CM_SEL                              (2'b11),
    .RX_CM_TRIM                             (3'b010),
    .RX_DEBUG_CFG                           (12'b000000000000),
    .RX_OS_CFG                              (13'b0000010000000),
    .TERM_RCAL_CFG                          (5'b10000),
    .TERM_RCAL_OVRD                         (1'b0),
    .TST_RSV                                (32'h00000000),
    .RX_CLK25_DIV                           (6),
    .TX_CLK25_DIV                           (6),
    .UCODEER_CLR                            (1'b0),
    .PCS_PCIE_EN                            ("FALSE"),
    .PCS_RSVD_ATTR                          (48'h0100),
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
    .RXPH_CFG                               (24'h000000),
    .RXPHDLY_CFG                            (24'h084020),
    .RXPH_MONITOR_SEL                       (5'b00000),
    .RX_XCLK_SEL                            ("RXREC"),
    .RX_DDI_SEL                             (6'b000000),
    .RX_DEFER_RESET_BUF_EN                  ("TRUE"),
    .RXCDR_CFG                              (72'h03000023ff10200020),
    .RXCDR_FR_RESET_ON_EIDLE                (1'b0),
    .RXCDR_HOLD_DURING_EIDLE                (1'b0),
    .RXCDR_PH_RESET_ON_EIDLE                (1'b0),
    .RXCDR_LOCK_CFG                         (6'b010101),
    .RXCDRFREQRESET_TIME                    (RXCDRFREQRESET_TIME),
    .RXCDRPHRESET_TIME                      (RXCDRPHRESET_TIME),
    .RXISCANRESET_TIME                      (RXISCANRESET_TIME),
    .RXPCSRESET_TIME                        (5'b00001),
    .RXPMARESET_TIME                        (RXPMARESET_TIME),
    .RXOOB_CFG                              (7'b0000110),
    .RXGEARBOX_EN                           ("FALSE"),
    .GEARBOX_MODE                           (3'b000),
    .RXPRBS_ERR_LOOPBACK                    (1'b0),
    .PD_TRANS_TIME_FROM_P2                  (12'h03c),
    .PD_TRANS_TIME_NONE_P2                  (8'h3c),
    .PD_TRANS_TIME_TO_P2                    (8'h64),
    .SAS_MAX_COM                            (64),
    .SAS_MIN_COM                            (36),
    .SATA_BURST_SEQ_LEN                     (4'b0111),
    .SATA_BURST_VAL                         (3'b110),
    .SATA_EIDLE_VAL                         (3'b110),
    .SATA_MAX_BURST                         (8),
    .SATA_MAX_INIT                          (21),
    .SATA_MAX_WAKE                          (7),
    .SATA_MIN_BURST                         (4),
    .SATA_MIN_INIT                          (12),
    .SATA_MIN_WAKE                          (4),
    .TRANS_TIME_RATE                        (8'h0E),
    .TXBUF_EN                               ("TRUE"),
    .TXBUF_RESET_ON_RATE_CHANGE             ("TRUE"),
    .TXDLY_CFG                              (16'h001F),
    .TXDLY_LCFG                             (9'h030),
    .TXDLY_TAP_CFG                          (16'h0000),
    .TXPH_CFG                               (16'h0780),
    .TXPHDLY_CFG                            (24'h084020),
    .TXPH_MONITOR_SEL                       (5'b00000),
    .TX_XCLK_SEL                            ("TXOUT"),
    .TX_DATA_WIDTH                          (40),
    .TX_DEEMPH0                             (5'b00000),
    .TX_DEEMPH1                             (5'b00000),
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
    .TXGEARBOX_EN                           ("FALSE"),
    .TXPCSRESET_TIME                        (5'b00001),
    .TXPMARESET_TIME                        (TXPMARESET_TIME),
    .TX_RXDETECT_CFG                        (14'h1832),
    .TX_RXDETECT_REF                        (3'b100),
    .CPLL_CFG                               (24'hBC07DC),
    .CPLL_FBDIV                             (4),
    .CPLL_FBDIV_45                          (5),
    .CPLL_INIT_CFG                          (24'h00001E),
    .CPLL_LOCK_CFG                          (16'h01E8),
    .CPLL_REFCLK_DIV                        (1),
    .RXOUT_DIV                              (2),
    .TXOUT_DIV                              (2),
    .SATA_CPLL_CFG                          ("VCO_3000MHZ"),
    .RXDFELPMRESET_TIME                     (RXDFELPMRESET_TIME),
    .RXLPM_HF_CFG                           (14'b00000011110000),
    .RXLPM_LF_CFG                           (14'b00000011110000),
    .RX_DFE_GAIN_CFG                        (23'h020FEA),
    .RX_DFE_H2_CFG                          (12'b000000000000),
    .RX_DFE_H3_CFG                          (12'b000001000000),
    .RX_DFE_H4_CFG                          (11'b00011110000),
    .RX_DFE_H5_CFG                          (11'b00011100000),
    .RX_DFE_KL_CFG                          (13'b0000011111110),
    .RX_DFE_LPM_CFG                         (16'h0954),
    .RX_DFE_LPM_HOLD_DURING_EIDLE           (1'b0),
    .RX_DFE_UT_CFG                          (17'b10001111000000000),
    .RX_DFE_VP_CFG                          (17'b00011111100000011),
    .RX_CLKMUX_PD                           (1'b1),
    .TX_CLKMUX_PD                           (1'b1),
    .RX_INT_DATAWIDTH                       (0),
    .TX_INT_DATAWIDTH                       (0),
    .TX_QPI_STATUS_EN                       (1'b0),
    .RX_DFE_KL_CFG2                         (32'h301148AC),
    .RX_DFE_XYD_CFG                         (13'b0000000000000),
    .TX_PREDRIVER_MODE                      (1'b0)
) 
gtx_wrapper(
    .CPLLFBCLKLOST                  (),
    .CPLLLOCK                       (cplllock),
    .CPLLLOCKDETCLK                 (cplllockdetclk),
    .CPLLLOCKEN                     (1'b1),
    .CPLLPD                         (1'b0),
    .CPLLREFCLKLOST                 (),
    .CPLLREFCLKSEL                  (3'b001),
    .CPLLRESET                      (cpllreset),
    .GTRSVD                         (16'b0),
    .PCSRSVDIN                      (16'b0),
    .PCSRSVDIN2                     (5'b0),
    .PMARSVDIN                      (5'b0),
    .PMARSVDIN2                     (5'b0),
    .TSTIN                          (20'b1),
    .TSTOUT                         (),
    .CLKRSVD                        (4'b0000),
    .GTGREFCLK                      (1'b0),
    .GTNORTHREFCLK0                 (1'b0),
    .GTNORTHREFCLK1                 (1'b0),
    .GTREFCLK0                      (gtrefclk),
    .GTREFCLK1                      (1'b0),
    .GTSOUTHREFCLK0                 (1'b0),
    .GTSOUTHREFCLK1                 (1'b0),
    .DRPADDR                        (9'b0),
    .DRPCLK                         (drpclk),
    .DRPDI                          (16'b0),
    .DRPDO                          (),
    .DRPEN                          (1'b0),
    .DRPRDY                         (),
    .DRPWE                          (1'b0),
    .GTREFCLKMONITOR                (),
    .QPLLCLK                        (gtrefclk),
    .QPLLREFCLK                     (gtrefclk),
    .RXSYSCLKSEL                    (2'b00),
    .TXSYSCLKSEL                    (2'b00),
    .DMONITOROUT                    (),
    .TX8B10BEN                      (1'b1),
    .LOOPBACK                       (3'd0),
    .PHYSTATUS                      (),
    .RXRATE                         (3'd0),
    .RXVALID                        (),
    .RXPD                           (2'b00),
    .TXPD                           (2'b00),
    .SETERRSTATUS                   (1'b0),
    .EYESCANRESET                   (1'b0),//rxreset), // p78
    .RXUSERRDY                      (rxuserrdy),
    .EYESCANDATAERROR               (),
    .EYESCANMODE                    (1'b0),
    .EYESCANTRIGGER                 (1'b0),
    .RXCDRFREQRESET                 (1'b0),
    .RXCDRHOLD                      (1'b0),
    .RXCDRLOCK                      (),
    .RXCDROVRDEN                    (1'b0),
    .RXCDRRESET                     (1'b0),
    .RXCDRRESETRSV                  (1'b0),
    .RXCLKCORCNT                    (),
    .RX8B10BEN                      (1'b1),
    .RXUSRCLK                       (rxusrclk),
    .RXUSRCLK2                      (rxusrclk2),
    .RXDATA                         (rxdata_gtx),
    .RXPRBSERR                      (),
    .RXPRBSSEL                      (3'd0),
    .RXPRBSCNTRESET                 (1'b0),
    .RXDFEXYDEN                     (1'b1),
    .RXDFEXYDHOLD                   (1'b0),
    .RXDFEXYDOVRDEN                 (1'b0),
    .RXDISPERR                      (rxdisperr_gtx),
    .RXNOTINTABLE                   (rxnotintable_gtx),
    .GTXRXP                         (rxp),
    .GTXRXN                         (rxn),
    .RXBUFRESET                     (1'b0),
    .RXBUFSTATUS                    (),
    .RXDDIEN                        (1'b0),
    .RXDLYBYPASS                    (1'b1),
    .RXDLYEN                        (1'b0),
    .RXDLYOVRDEN                    (1'b0),
    .RXDLYSRESET                    (1'b0),
    .RXDLYSRESETDONE                (),
    .RXPHALIGN                      (1'b0),
    .RXPHALIGNDONE                  (),
    .RXPHALIGNEN                    (1'b0),
    .RXPHDLYPD                      (1'b0),
    .RXPHDLYRESET                   (1'b0),
    .RXPHMONITOR                    (),
    .RXPHOVRDEN                     (1'b0),
    .RXPHSLIPMONITOR                (),
    .RXSTATUS                       (),
    .RXBYTEISALIGNED                (rxbyteisaligned),
    .RXBYTEREALIGN                  (),
    .RXCOMMADET                     (),
    .RXCOMMADETEN                   (1'b1),
    .RXMCOMMAALIGNEN                (1'b1),
    .RXPCOMMAALIGNEN                (1'b1),
    .RXCHANBONDSEQ                  (),
    .RXCHBONDEN                     (1'b0),
    .RXCHBONDLEVEL                  (3'd0),
    .RXCHBONDMASTER                 (1'b0),
    .RXCHBONDO                      (),
    .RXCHBONDSLAVE                  (1'b0),
    .RXCHANISALIGNED                (),
    .RXCHANREALIGN                  (),
    .RXLPMHFHOLD                    (1'b0),
    .RXLPMHFOVRDEN                  (1'b0),
    .RXLPMLFHOLD                    (1'b0),
    .RXDFEAGCHOLD                   (1'b0),
    .RXDFEAGCOVRDEN                 (1'b0),
    .RXDFECM1EN                     (1'b0),
    .RXDFELFHOLD                    (1'b0),
    .RXDFELFOVRDEN                  (1'b1),
    .RXDFELPMRESET                  (rxreset),
    .RXDFETAP2HOLD                  (1'b0),
    .RXDFETAP2OVRDEN                (1'b0),
    .RXDFETAP3HOLD                  (1'b0),
    .RXDFETAP3OVRDEN                (1'b0),
    .RXDFETAP4HOLD                  (1'b0),
    .RXDFETAP4OVRDEN                (1'b0),
    .RXDFETAP5HOLD                  (1'b0),
    .RXDFETAP5OVRDEN                (1'b0),
    .RXDFEUTHOLD                    (1'b0),
    .RXDFEUTOVRDEN                  (1'b0),
    .RXDFEVPHOLD                    (1'b0),
    .RXDFEVPOVRDEN                  (1'b0),
//    .RXDFEVSEN                      (1'b0),
    .RXLPMLFKLOVRDEN                (1'b0),
    .RXMONITOROUT                   (),
    .RXMONITORSEL                   (2'b01),
    .RXOSHOLD                       (1'b0),
    .RXOSOVRDEN                     (1'b0),
    .RXRATEDONE                     (),
    .RXOUTCLK                       (),
    .RXOUTCLKFABRIC                 (),
    .RXOUTCLKPCS                    (),
    .RXOUTCLKSEL                    (3'b010),
    .RXDATAVALID                    (),
    .RXHEADER                       (),
    .RXHEADERVALID                  (),
    .RXSTARTOFSEQ                   (),
    .RXGEARBOXSLIP                  (1'b0),
    .GTRXRESET                      (rxreset),
    .RXOOBRESET                     (1'b0),
    .RXPCSRESET                     (1'b0),
    .RXPMARESET                     (1'b0),//rxreset), // p78
    .RXLPMEN                        (1'b0),
    .RXCOMSASDET                    (),
    .RXCOMWAKEDET                   (rxcomwakedet),
    .RXCOMINITDET                   (rxcominitdet),
    .RXELECIDLE                     (rxelecidle),
    .RXELECIDLEMODE                 (2'b00),
    .RXPOLARITY                     (1'b0),
    .RXSLIDE                        (1'b0),
    .RXCHARISCOMMA                  (rxchariscomma_gtx),
    .RXCHARISK                      (rxcharisk_gtx),
    .RXCHBONDI                      (5'b00000),
    .RXRESETDONE                    (rxresetdone),
    .RXQPIEN                        (1'b0),
    .RXQPISENN                      (),
    .RXQPISENP                      (),
    .TXPHDLYTSTCLK                  (1'b0),
    .TXPOSTCURSOR                   (5'b00000),
    .TXPOSTCURSORINV                (1'b0),
    .TXPRECURSOR                    (5'd0),
    .TXPRECURSORINV                 (1'b0),
    .TXQPIBIASEN                    (1'b0),
    .TXQPISTRONGPDOWN               (1'b0),
    .TXQPIWEAKPUP                   (1'b0),
    .CFGRESET                       (1'b0),
    .GTTXRESET                      (txreset),
    .PCSRSVDOUT                     (),
    .TXUSERRDY                      (txuserrdy),
    .GTRESETSEL                     (1'b0),
    .RESETOVRD                      (1'b0),
    .TXCHARDISPMODE                 (8'd0),
    .TXCHARDISPVAL                  (8'd0),
    .TXUSRCLK                       (txusrclk),
    .TXUSRCLK2                      (txusrclk2),
    .TXELECIDLE                     (txelecidle),
    .TXMARGIN                       (3'd0),
    .TXRATE                         (3'd0),
    .TXSWING                        (1'b0),
    .TXPRBSFORCEERR                 (1'b0),
    .TXDLYBYPASS                    (1'b1),
    .TXDLYEN                        (1'b0),
    .TXDLYHOLD                      (1'b0),
    .TXDLYOVRDEN                    (1'b0),
    .TXDLYSRESET                    (1'b0),
    .TXDLYSRESETDONE                (),
    .TXDLYUPDOWN                    (1'b0),
    .TXPHALIGN                      (1'b0),
    .TXPHALIGNDONE                  (),
    .TXPHALIGNEN                    (1'b0),
    .TXPHDLYPD                      (1'b0),
    .TXPHDLYRESET                   (1'b0),
    .TXPHINIT                       (1'b0),
    .TXPHINITDONE                   (),
    .TXPHOVRDEN                     (1'b0),
    .TXBUFSTATUS                    (),
    .TXBUFDIFFCTRL                  (3'b100),
    .TXDEEMPH                       (1'b0),
    .TXDIFFCTRL                     (4'b1000),
    .TXDIFFPD                       (1'b0),
    .TXINHIBIT                      (1'b0),
    .TXMAINCURSOR                   (7'b0000000),
    .TXPISOPD                       (1'b0),
    .TXDATA                         ({32'h0, txdata}),
    .GTXTXN                         (txn),
    .GTXTXP                         (txp),
    .TXOUTCLK                       (txoutclk),
    .TXOUTCLKFABRIC                 (),
    .TXOUTCLKPCS                    (),
    .TXOUTCLKSEL                    (3'b010),
    .TXRATEDONE                     (),
    .TXCHARISK                      ({4'b0, txcharisk}),
    .TXGEARBOXREADY                 (),
    .TXHEADER                       (3'd0),
    .TXSEQUENCE                     (7'd0),
    .TXSTARTSEQ                     (1'b0),
    .TXPCSRESET                     (txpcsreset),
    .TXPMARESET                     (1'b0),
    .TXRESETDONE                    (txresetdone),
    .TXCOMFINISH                    (),
    .TXCOMINIT                      (txcominit),
    .TXCOMSAS                       (1'b0),
    .TXCOMWAKE                      (txcomwake),
    .TXPDELECIDLEMODE               (1'b0),
    .TXPOLARITY                     (1'b0),
    .TXDETECTRX                     (1'b0),
    .TX8B10BBYPASS                  (8'd0),
    .TXPRBSSEL                      (3'd0),
    .TXQPISENN                      (),
    .TXQPISENP                      ()/*,
    .TXSYNCMODE                     (1'b0),
    .TXSYNCALLIN                    (1'b0),
    .TXSYNCIN                       (1'b0)*/
);
// Serial data bit shift to check host alignment
wire tx_serial_clk=gtx_wrapper.gtx_gpl.channel.tx_serial_clk;
//reg  [4:0] serial_delay = 0;
reg [31:0] txp_r;
reg [31:0] txn_r;
always @(posedge tx_serial_clk) begin
    txp_r = {txp_r[30:0],txp};
    txn_r = {txn_r[30:0],txn};
end

// align to 4-byte boundary
reg twobytes_shift;
always @ (posedge clk)
    twobytes_shift <= rst ? 1'b0 : rxchariscomma_gtx[0] === 1'bx ? 1'b0 : rxchariscomma_gtx[2] === 1'bx ? 1'b0 : rxchariscomma_gtx[2] ? 1'b1 : rxchariscomma_gtx[0] ? 1'b0 : twobytes_shift;
assign  rxdata          = twobytes_shift ? {rxdata_gtx[63:32]     , rxdata_gtx[15:0]      , rxdata_gtx[31:16]     } : rxdata_gtx;
assign  rxcharisk       = twobytes_shift ? {rxcharisk_gtx[7:4]    , rxcharisk_gtx[1:0]    , rxcharisk_gtx[3:2]    } : rxcharisk_gtx;
assign  rxchariscomma   = twobytes_shift ? {rxchariscomma_gtx[7:4], rxchariscomma_gtx[1:0], rxchariscomma_gtx[3:2]} : rxchariscomma_gtx;
assign  rxdisperr       = twobytes_shift ? {rxdisperr_gtx[7:4]    , rxdisperr_gtx[1:0]    , rxdisperr_gtx[3:2]    } : rxdisperr_gtx;
assign  rxnotintable    = twobytes_shift ? {rxnotintable_gtx[7:4] , rxnotintable_gtx[1:0] , rxnotintable_gtx[3:2] } : rxnotintable_gtx;

assign  ll_err_out      = rxdisperr[3:0] | rxnotintable[3:0];

/*
 * Interfaces
 */
assign  cplllockdetclk  = gtrefclk; //TODO
assign  drpclk          = gtrefclk;

assign  clk             = usrclk2;
assign  rxn             = rxn_in;
assign  rxp             = rxp_in;

///assign  txn_out         = txn;
///assign  txp_out         = txp;
assign  txn_out         = txn_r[serial_delay];
assign  txp_out         = txp_r[serial_delay];

//assign  ll_data_out     = rxdata_out;
//assign  ll_charisk_out  = rxcharisk_out;
//assign  txdata_in       = ll_data_in;
//assign  txcharisk_in    = ll_charisk_in;

endmodule
