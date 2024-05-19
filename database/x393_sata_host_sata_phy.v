// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sata_phy
 * @file sata_phy.v
 * @date  2015-07-11  
 * @author Alexey     
 *
 * @brief phy-level, including oob, clock generation and GTXE2 
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * sata_phy.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * sata_phy.v file is distributed in the hope that it will be useful,
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
//`include "oob_ctrl.v"
//`include "gtx_wrap.v"
module sata_phy #(
`ifdef USE_DATASCOPE
    parameter ADDRESS_BITS =         10, //for datascope
    parameter DATASCOPE_START_BIT =  14, // bit of DRP "other_control" to start recording after 0->1 (needs DRP)
    parameter DATASCOPE_POST_MEAS =  16, // number of measurements to perform after event
`endif        
    parameter   DATA_BYTE_WIDTH =     4,
    parameter ELASTIC_DEPTH =         4, //5, With 4/7 got infrequent overflows!
    parameter ELASTIC_OFFSET =        7 //  5 //10
)
(
    // initial reset, resets PLL. After pll is locked, an internal sata reset is generated.
    input   wire        extrst,
    // sata clk, generated in pll as usrclk2
    output  wire        clk, // 75MHz, bufg
    output  wire        rst,

    // reliable clock to source drp and cpll lock det circuits
    input   wire        reliable_clk,

    // state
    output  wire        phy_ready,
    // tmp output TODO
    output  wire        gtx_ready,
    output  wire  [11:0] debug_cnt,

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
    output  wire    [DATA_BYTE_WIDTH * 8 - 1:0] ll_data_out,
    output  wire    [DATA_BYTE_WIDTH - 1:0]     ll_charisk_out,
    output  wire    [DATA_BYTE_WIDTH - 1:0]     ll_err_out, // TODO!!!

    // from link layer
    input   wire    [DATA_BYTE_WIDTH * 8 - 1:0] ll_data_in,
    input   wire    [DATA_BYTE_WIDTH - 1:0]     ll_charisk_in,
    
    input                                       set_offline,     // electrically idle
    input                                       comreset_send,   // Not possible yet?
    output  wire                                cominit_got,
    output  wire                                comwake_got,
    
    // elastic buffer status
    output  wire                                rxelsfull,
    output  wire                                rxelsempty,

    output                                      cplllock_debug,
    output                                      usrpll_locked_debug,
    output                                      re_aligned,      // re-aligned after alignment loss
    output                                      xclk,            //  just to measure frequency to set the local clock
    
`ifdef USE_DATASCOPE
// Datascope interface (write to memory that can be software-read)
    output                                      datascope_clk,
    output                   [ADDRESS_BITS-1:0] datascope_waddr,
    output                                      datascope_we,
    output                               [31:0] datascope_di,
    input                                       datascope_trig, // external trigger event for the datascope     
    
`endif    
    
`ifdef USE_DRP
    input                                       drp_rst,
    input                                       drp_clk,
    input                                       drp_en, // @aclk strobes drp_ad
    input                                       drp_we,
    input                                [14:0] drp_addr,       
    input                                [15:0] drp_di,
    output                                      drp_rdy,
    output                               [15:0] drp_do,
`endif    
    output                               [31:0] debug_sata
    ,output debug_detected_alignp
    
);

wire    [DATA_BYTE_WIDTH * 8 - 1:0] txdata;
wire    [DATA_BYTE_WIDTH * 8 - 1:0] rxdata;
wire    [DATA_BYTE_WIDTH * 8 - 1:0] rxdata_out;
wire    [DATA_BYTE_WIDTH * 8 - 1:0] txdata_in;
wire    [DATA_BYTE_WIDTH - 1:0]     txcharisk;
wire    [DATA_BYTE_WIDTH - 1:0]     rxcharisk;
wire    [DATA_BYTE_WIDTH - 1:0]     txcharisk_in;
wire    [DATA_BYTE_WIDTH - 1:0]     rxcharisk_out;
wire    [DATA_BYTE_WIDTH - 1:0]     rxdisperr;
wire    [DATA_BYTE_WIDTH - 1:0]     rxnotintable;
wire                          [1:0] txbufstatus;                       
`ifdef DEBUG_ELASTIC
    wire [15:0]                     dbg_data_cntr; // output[11:0] reg 4 MSBs - got primitives during data receive
`endif
assign  ll_err_out = rxdisperr | rxnotintable;

// once gtx_ready -> 1, gtx_configured latches
// after this point it's possible to perform additional resets and reconfigurations by higher-level logic
reg             gtx_configured;
// after external rst -> 0, after sata logic resets -> 1
wire            sata_reset_done;

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
wire            rxreset_req;
wire            rxreset_ack;
wire            clk_phase_align_req; 
wire            clk_phase_align_ack; 


wire            rxreset_oob;
// elastic buffer status signals TODO
//wire            rxelsfull;
//wire            rxelsempty;

wire            dbg_rxphaligndone;
wire            dbg_rx_clocks_aligned;
wire            dbg_rxcdrlock;
wire            dbg_rxdlysresetdone;

//wire            gtx_ready;
assign cominit_got = rxcominitdet; // For AHCI
assign comwake_got = rxcomwakedet; // For AHCI
wire dummy;



oob_ctrl oob_ctrl(
    .clk                  (clk),                   // input wire         // sata clk = usrclk2
    .rst                  (rst),                   // input wire         // reset oob
    .gtx_ready            (gtx_ready),             // input wire         // gtx is ready = all resets are done
    .debug                ({dummy,debug_cnt[10:0]}),
    // oob responses
    .rxcominitdet_in      (rxcominitdet),          // input wire 
    .rxcomwakedet_in      (rxcomwakedet),          // input wire 
    .rxelecidle_in        (rxelecidle),            // input wire 
    // oob issues
    .txcominit            (txcominit),             // output wire 
    .txcomwake            (txcomwake),             // output wire 
    .txelecidle           (txelecidle),            // output wire 
    .txpcsreset_req       (txpcsreset_req),        // output wire 
    .recal_tx_done        (recal_tx_done),         // input wire 
    .rxreset_req          (rxreset_req),           // output wire 
    .rxreset_ack          (rxreset_ack),           // input wire 
    .clk_phase_align_req  (clk_phase_align_req),   // output wire 
    .clk_phase_align_ack  (clk_phase_align_ack),   // input wire 
    .txdata_in            (txdata_in),             // input[31:0] wire   // input data stream (if any data during OOB setting => ignored)
    .txcharisk_in         (txcharisk_in),          // input[3:0] wire    // same
    .txdata_out           (txdata),                // output[31:0] wire  // output data stream to gtx
    .txcharisk_out        (txcharisk),             // output[3:0] wire   // same
    .rxdata_in            (rxdata[31:0]),          // input[31:0] wire   // input data from gtx
    .rxcharisk_in         (rxcharisk[3:0]),        // input[3:0] wire    // same
    .rxdata_out           (rxdata_out),            // output[31:0] wire  // bypassed data from gtx
    .rxcharisk_out        (rxcharisk_out),         // output[3:0]wire    // same
    .rxbyteisaligned      (rxbyteisaligned),       // input wire         // receiving data is aligned
    .phy_ready            (phy_ready),             // output wire        // shows if channel is ready
    // To/from AHCI
    .set_offline          (set_offline),           // input
    .comreset_send        (comreset_send),         // input
    .re_aligned           (re_aligned)             // output reg 
    ,.debug_detected_alignp(debug_detected_alignp) // output 
);

wire    cplllockdetclk; // TODO
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
//wire    rxusrclk;
wire    rxusrclk2;
wire    txp;
wire    txn;
wire    rxp;
wire    rxn;
wire    txoutclk; // comes out global from gtx_wrap
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
always @ (posedge gtrefclk) begin 
    if      (rxreset)          rxeyereset_cnt  <= 0;
    else if (!rxeyereset_done) rxeyereset_cnt  <= rxeyereset_cnt + 1;
end
/*
 * Resets
 */
wire    usrpll_locked;

// make tx/rxreset synchronous to gtrefclk - gather singals from different domains: async, aclk, usrclk2, gtrefclk
localparam [7:0] RST_TIMER_LIMIT = 8'b1000;
reg rxreset_f;
reg txreset_f;
reg rxreset_f_r;
reg txreset_f_r;
reg rxreset_f_rr;
reg txreset_f_rr;
//reg pre_sata_reset_done;
reg sata_areset;
reg [2:0] sata_reset_done_r;
reg [7:0]   rst_timer;
//reg         rst_r = 1;
assign  rst = !sata_reset_done_r;

assign  sata_reset_done = sata_reset_done_r[1];


assign cplllock_debug = cplllock;
assign usrpll_locked_debug = usrpll_locked;

always @ (posedge clk or  posedge sata_areset) begin
    if      (sata_areset)  sata_reset_done_r <= 0;
    else                   sata_reset_done_r <= {sata_reset_done_r[1:0], 1'b1};
end

reg cplllock_r;

always @ (posedge gtrefclk) begin
    cplllock_r <= cplllock;
    rxreset_f <= ~cplllock_r | ~cplllock | cpllreset | rxreset_oob & gtx_configured;
    txreset_f <= ~cplllock_r | ~cplllock | cpllreset;

    txreset_f_r <= txreset_f;
    rxreset_f_r <= rxreset_f;
    txreset_f_rr <= txreset_f_r;
    rxreset_f_rr <= rxreset_f_r;
    
    if (!(cplllock  && usrpll_locked)) rst_timer <= RST_TIMER_LIMIT;
    else if (|rst_timer)               rst_timer <= rst_timer - 1;
    
    sata_areset <= !(cplllock  &&  usrpll_locked && !(|rst_timer));
    
end
assign  rxreset = rxreset_f_rr;
assign  txreset = txreset_f_rr;
assign  cpllreset = extrst;
assign  rxuserrdy = usrpll_locked & cplllock & ~cpllreset & ~rxreset & rxeyereset_done & sata_reset_done;
assign  txuserrdy = usrpll_locked & cplllock & ~cpllreset & ~txreset & txpmareset_done & sata_reset_done;

assign  gtx_ready = rxuserrdy & txuserrdy & rxresetdone & txresetdone;

// assert gtx_configured. Once gtx_ready -> 1, gtx_configured latches
always @ (posedge clk or posedge extrst)
    if (extrst) gtx_configured <= 0;
    else        gtx_configured <= gtx_ready | gtx_configured;






// issue partial tx reset to restore functionality after oob sequence. Let it lasts 8 clock cycles
// Not enough or too early (after txelctidle?) txbufstatus shows overflow
localparam TXPCSRESET_CYCLES = 100;
reg       txpcsreset_r;
reg [7:0] txpcsreset_cntr;
reg       recal_tx_done_r;
assign    recal_tx_done = recal_tx_done_r;
assign    txpcsreset = txpcsreset_r;     
always @ (posedge clk) begin
    if (rst || (txpcsreset_cntr == 0))     txpcsreset_r <= 0; 
    else if (txpcsreset_req)               txpcsreset_r <= 1;
    
    if      (rst)                          txpcsreset_cntr <= 0;
    else if (txpcsreset_req)               txpcsreset_cntr <= TXPCSRESET_CYCLES;
    else if (txpcsreset_cntr != 0)         txpcsreset_cntr <= txpcsreset_cntr - 1;
    
    if (rst || txelecidle || txpcsreset_r) recal_tx_done_r <= 0;
    else if (txresetdone)                  recal_tx_done_r <= 1;
end


// issue rx reset to restore functionality after oob sequence. Let it last 8 clock cycles
reg [3:0]   rxreset_oob_cnt;
wire        rxreset_oob_stop;

assign  rxreset_oob_stop = rxreset_oob_cnt[3];
assign  rxreset_oob      = rxreset_req & ~rxreset_oob_stop;
assign  rxreset_ack      = rxreset_oob_stop & gtx_ready;

always @ (posedge clk or posedge extrst)
    if (extrst) rxreset_oob_cnt <= 1; 
    else        rxreset_oob_cnt <= rst | ~rxreset_req ? 4'h0 : rxreset_oob_stop ? rxreset_oob_cnt : rxreset_oob_cnt + 1'b1;


/*
 * USRCLKs generation. USRCLK @ 150MHz, same as TXOUTCLK; USRCLK2 @ 75Mhz -> sata_clk === sclk
 * It's recommended to use MMCM instead of PLL, whatever
 */

wire usrclk_global;
wire    usrclk2;
// divide txoutclk (global) by 2, then make global. Does not need to be phase-aligned - will use FIFO
reg usrclk2_r;
always @ (posedge txoutclk) begin
    if (~cplllock) usrclk2_r <= 0;
    else           usrclk2_r <= ~usrclk2;
end
assign txusrclk  =     txoutclk; // 150MHz, was already global
assign usrclk_global = txoutclk; // 150MHz, was already global
assign usrclk2 =       usrclk2_r;
assign usrpll_locked = cplllock;

assign txusrclk  = usrclk_global; // 150MHz
assign txusrclk2 = clk;           // usrclk2;
//assign rxusrclk  = usrclk_global; // 150MHz
assign rxusrclk2 = clk;           // usrclk2;

select_clk_buf #(
    .BUFFER_TYPE("BUFG")
) bufg_sclk (
    .o          (clk),  // output
    .i          (usrclk2),         // input
    .clr        (1'b0)            // input
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

gtx_wrap #(
`ifdef USE_DATASCOPE
    .ADDRESS_BITS        (ADDRESS_BITS),  // for datascope
    .DATASCOPE_START_BIT (DATASCOPE_START_BIT),
    .DATASCOPE_POST_MEAS (DATASCOPE_POST_MEAS),
`endif
    .DATA_BYTE_WIDTH        (DATA_BYTE_WIDTH),
    .TXPMARESET_TIME        (TXPMARESET_TIME),
    .RXPMARESET_TIME        (RXPMARESET_TIME),
    .RXCDRPHRESET_TIME      (RXCDRPHRESET_TIME),
    .RXCDRFREQRESET_TIME    (RXCDRFREQRESET_TIME),
    .RXDFELPMRESET_TIME     (RXDFELPMRESET_TIME),
    .RXISCANRESET_TIME      (RXISCANRESET_TIME),
    .ELASTIC_DEPTH          (ELASTIC_DEPTH), // with 4/7 infrequent full !
    .ELASTIC_OFFSET         (ELASTIC_OFFSET)
    
)
gtx_wrap
(
    .debug              (debug_cnt[11]),   // output reg 
    .cplllock           (cplllock),        // output wire 
    .cplllockdetclk     (cplllockdetclk),  // input wire 
    .cpllreset          (cpllreset),       // input wire 
    .gtrefclk           (gtrefclk),        // input wire 
    .rxuserrdy          (rxuserrdy),       // input wire 
    .txuserrdy          (txuserrdy),       // input wire 
//    .rxusrclk           (rxusrclk),        // input wire 
    .rxusrclk2          (rxusrclk2),       // input wire 
    .rxp                (rxp),             // input wire 
    .rxn                (rxn),             // input wire 
    .rxbyteisaligned    (rxbyteisaligned), // output wire
    .rxreset            (rxreset),         // input wire 
    .rxcomwakedet       (rxcomwakedet),    // output wire
    .rxcominitdet       (rxcominitdet),    // output wire
    .rxelecidle         (rxelecidle),      // output wire
    .rxresetdone        (rxresetdone),     // output wire
    .txreset            (txreset),         // input wire

    .clk_phase_align_req(clk_phase_align_req), // output wire 
    .clk_phase_align_ack(clk_phase_align_ack), // input wire 
     
    .txusrclk           (txusrclk),        // input wire 
    .txusrclk2          (txusrclk2),       // input wire 
    .txelecidle         (txelecidle),      // input wire 
    .txp                (txp),             // output wire
    .txn                (txn),             // output wire
    .txoutclk           (txoutclk),        // output wire // made global inside
    .txpcsreset         (txpcsreset),      // input wire 
    .txresetdone        (txresetdone),     // output wire
    .txcominit          (txcominit),       // input wire 
    .txcomwake          (txcomwake),       // input wire 
    .txcomfinish        (),                // output wire
    .rxelsfull          (rxelsfull),       // output wire
    .rxelsempty         (rxelsempty),      // output wire
    .txdata             (txdata),          // input [31:0] wire 
    .txcharisk          (txcharisk),       // input [3:0] wire 
    .rxdata             (rxdata),          // output[31:0] wire 
    .rxcharisk          (rxcharisk),       // output[3:0] wire 
    .rxdisperr          (rxdisperr),       // output[3:0] wire 
    .rxnotintable       (rxnotintable),     // output[3:0] wire
    .dbg_rxphaligndone     (dbg_rxphaligndone),
    .dbg_rx_clocks_aligned (dbg_rx_clocks_aligned),
    .dbg_rxcdrlock         (dbg_rxcdrlock)    ,
    .dbg_rxdlysresetdone   (dbg_rxdlysresetdone),
    .txbufstatus           (txbufstatus[1:0]),
    .xclk                  (xclk)             // output receive clock, just to measure frequency // global
`ifdef USE_DATASCOPE
       ,.datascope_clk     (datascope_clk),     // output
        .datascope_waddr   (datascope_waddr),   // output[9:0] 
        .datascope_we      (datascope_we),      // output
        .datascope_di      (datascope_di),      // output[31:0] 
        .datascope_trig    (datascope_trig)     // input // external trigger event for the datascope     
`endif
    
`ifdef USE_DRP
       ,.drp_rst        (drp_rst),           // input
        .drp_clk        (drp_clk),           // input
        .drp_en         (drp_en),            // input
        .drp_we         (drp_we),            // input
        .drp_addr       (drp_addr),          // input[14:0] 
        .drp_di         (drp_di),            // input[15:0] 
        .drp_rdy        (drp_rdy),           // output
        .drp_do         (drp_do)             // output[15:0] 
`endif 
`ifdef DEBUG_ELASTIC
        ,.dbg_data_cntr (dbg_data_cntr) // output[11:0] reg 
`endif
    
);



/*
 * Interfaces
 */
assign  cplllockdetclk  = reliable_clk; //gtrefclk;

assign  rxn             = rxn_in;
assign  rxp             = rxp_in;
assign  txn_out         = txn;
assign  txp_out         = txp;
assign  ll_data_out     = rxdata_out;
assign  ll_charisk_out  = rxcharisk_out;
assign  txdata_in       = ll_data_in;
assign  txcharisk_in    = ll_charisk_in;

reg [3:0] debug_cntr1;
reg [3:0] debug_cntr2;
reg [3:0] debug_cntr3;
reg [3:0] debug_cntr4;
reg [15:0] debug_cntr5;
reg [15:0] debug_cntr6;
reg [1:0] debug_rxbyteisaligned_r;
reg       debug_error_r;
//txoutclk
always @ (posedge gtrefclk) begin
    if (extrst) debug_cntr1 <= 0;
    else        debug_cntr1 <= debug_cntr1 + 1;
end

always @ (posedge clk) begin
    if (rst) debug_cntr2 <= 0;
    else        debug_cntr2 <= debug_cntr2 + 1;
end

always @ (posedge reliable_clk) begin
    if (extrst) debug_cntr3 <= 0;
    else        debug_cntr3 <= debug_cntr3 + 1;
end

always @ (posedge txoutclk) begin
    if (extrst) debug_cntr4 <= 0;
    else        debug_cntr4 <= debug_cntr4 + 1;
end

always @ (posedge clk) begin
    debug_rxbyteisaligned_r <= {debug_rxbyteisaligned_r[0],rxbyteisaligned};
    debug_error_r <= |ll_err_out;
    if      (rst)                             debug_cntr5 <= 0;
    else if (debug_rxbyteisaligned_r==1)      debug_cntr5 <= debug_cntr5 + 1;

    if      (rst)                             debug_cntr6 <= 0;
    else if (debug_error_r)                   debug_cntr6 <= debug_cntr6 + 1;
end

reg [15:0] dbg_clk_align_cntr;
reg        dbg_clk_align_wait;

reg [11:0] error_count;
always @ (posedge clk) begin
    if      (rxelecidle)                 error_count <= 0;
    else if (phy_ready && (|ll_err_out)) error_count <= error_count + 1;
    

    if      (rxelecidle || clk_phase_align_ack) dbg_clk_align_wait <= 0;
    else if (clk_phase_align_req)                         dbg_clk_align_wait <= 1;

    if      (rxelecidle)                                  dbg_clk_align_cntr <= 0;
    else if (dbg_clk_align_wait)                          dbg_clk_align_cntr <= dbg_clk_align_cntr +1;

end


`ifdef USE_DATASCOPE
    `ifdef DEBUG_ELASTIC
        assign debug_sata = {dbg_data_cntr[15:0], // latched at error from previous FIS (@sof) (otherwise overwritten by h2d rfis)
                             error_count[3:0],
                             2'b0,
                             datascope_waddr[9:0]};
    `else //DEBUG_ELASTIC
        assign debug_sata = {8'b0,
                             error_count[11:0],
                             2'b0,
                             datascope_waddr[9:0]};
    `endif //`else DEBUG_ELASTIC
//dbg_data_cntr                         
                         
`else
    assign debug_sata = {8'b0, dbg_clk_align_cntr, txbufstatus[1:0], rxelecidle, dbg_rxcdrlock, rxelsfull, rxelsempty, dbg_rxphaligndone, dbg_rx_clocks_aligned};
`endif

 
endmodule
