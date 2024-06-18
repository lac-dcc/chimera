// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>gtx_wrap
 * @file gtx_wrap.v
 * @date  2015-08-24
 * @author Alexey     
 *
 * @brief shall replace gtx's PCS part functions, bypassing PCS itself in gtx
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * gtx_wrap.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * gtx_wrap.v file is distributed in the hope that it will be useful,
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
//`include "gtx_8x10enc.v"
//`include "gtx_10x8dec.v"
//`include "gtx_comma_align.v"
//`include "gtx_elastic.v"
// All computations have been done in assumption of GTX interface being 20 bits wide!
//`include "system_defines.v"
//`define DEBUG_ELASTIC
module gtx_wrap #(
`ifdef USE_DATASCOPE
    parameter ADDRESS_BITS =         10, // for datascope
    parameter DATASCOPE_START_BIT =  14, // bit of DRP "other_control" to start recording after 0->1 (needs DRP)
    parameter DATASCOPE_POST_MEAS =  16, // number of measurements to perform after event
`endif
    parameter DATA_BYTE_WIDTH     = 4,
    parameter TXPMARESET_TIME     = 5'h1,
    parameter RXPMARESET_TIME     = 5'h11,
    parameter RXCDRPHRESET_TIME   = 5'h1,
    parameter RXCDRFREQRESET_TIME = 5'h1,
    parameter RXDFELPMRESET_TIME  = 7'hf,
    parameter RXISCANRESET_TIME   = 5'h1,
    
    parameter ELASTIC_DEPTH =       4, //5, With 4/7 got infrequent overflows!
    parameter ELASTIC_OFFSET =      7 //  5 //10
)
(
    output  reg     debug = 0,
    output  wire    cplllock,
    input   wire    cplllockdetclk,
    input   wire    cpllreset,
    input   wire    gtrefclk,
    input   wire    rxuserrdy,
    input   wire    txuserrdy,
//    input   wire    rxusrclk,
    input   wire    rxusrclk2,
    input   wire    rxp,
    input   wire    rxn,
    output  wire    rxbyteisaligned,
    input   wire    rxreset,
    output  wire    rxcomwakedet,
    output  wire    rxcominitdet,
    output  wire    rxelecidle,
    output  wire    rxresetdone,
    
    input   wire    clk_phase_align_req, 
    output  wire    clk_phase_align_ack, 
    
    input   wire    txreset,
    input   wire    txusrclk,
    input   wire    txusrclk2,
    input   wire    txelecidle,
    output  wire    txp,
    output  wire    txn,
    output  wire    txoutclk,       // global clock
    input   wire    txpcsreset,
    output  wire    txresetdone,
    input   wire    txcominit,
    input   wire    txcomwake,
    output  wire    txcomfinish, // @txusrclk2
    // elastic buffer status
    output  wire    rxelsfull,
    output  wire    rxelsempty,

    input   wire    [DATA_BYTE_WIDTH * 8 - 1:0] txdata,
    input   wire    [DATA_BYTE_WIDTH - 1:0]     txcharisk,
    output  wire    [DATA_BYTE_WIDTH * 8 - 1:0] rxdata,
    output  wire    [DATA_BYTE_WIDTH - 1:0]     rxcharisk,
    output  wire    [DATA_BYTE_WIDTH - 1:0]     rxnotintable,
    output  wire    [DATA_BYTE_WIDTH - 1:0]     rxdisperr,
    
    output  wire    dbg_rxphaligndone,
    output  wire    dbg_rx_clocks_aligned,
    output  wire    dbg_rxcdrlock,
    output  wire    dbg_rxdlysresetdone,
    
    output wire [1:0] txbufstatus,
    
    output          xclk   //  just to measure frequency to set the local clock (global clock)
    
`ifdef USE_DATASCOPE
// Datascope interface (write to memory that can be software-read)
   ,output                    datascope_clk,
    output [ADDRESS_BITS-1:0] datascope_waddr,
    output                    datascope_we,
//    output reg         [31:0] datascope_di,
    output             [31:0] datascope_di,
    input                     datascope_trig // external trigger event for the datascope     
`endif    
    
`ifdef USE_DRP
   ,input             drp_rst, 
    input             drp_clk,
    input             drp_en, // @aclk strobes drp_ad
    input             drp_we,
    input      [14:0] drp_addr,       
    input      [15:0] drp_di,
    output            drp_rdy,
    output     [15:0] drp_do
`endif
`ifdef DEBUG_ELASTIC
   ,output reg [15:0] dbg_data_cntr // 4 MSB - got other primitives during data receive

`endif


    
);


wire    rxresetdone_gtx; 
wire    txresetdone_gtx;
reg     wrap_rxreset_;
reg     wrap_txreset_;
// resets while PCS resets, active low
always @ (posedge rxusrclk2) wrap_rxreset_ <= rxuserrdy & rxresetdone_gtx;
always @ (posedge txusrclk2) wrap_txreset_ <= txuserrdy & txresetdone_gtx;
wire    [63:0]  rxdata_gtx;
wire    [7:0]   rxcharisk_gtx;
wire    [7:0]   rxdisperr_gtx;
wire    [63:0]  txdata_gtx;
wire    [7:0]   txcharisk_gtx;
wire    [7:0]   txchardispval_gtx;
wire    [7:0]   txchardispmode_gtx;
// 8/10 encoder ifaces
wire    [19:0]  txdata_enc_out;
wire    [15:0]  txdata_enc_in;
wire    [1:0]   txcharisk_enc_in;

/*
 * TX PCS, minor changes: 8/10 encoder + user interface resync
 */
// assuming GTX interface width = 20 bits
assign  txdata_gtx          = {48'h0, txdata_enc_out[17:10], txdata_enc_out[7:0]};
assign  txcharisk_gtx       = 8'h0; // 8/10 encoder is bypassed in gtx
assign  txchardispmode_gtx  = {6'h0, txdata_enc_out[19], txdata_enc_out[9]};
assign  txchardispval_gtx   = {6'h0, txdata_enc_out[18], txdata_enc_out[8]};

// Interface part
// @ gtx iface clk
wire    txcominit_gtx; 
wire    txcomwake_gtx;
wire    txelecidle_gtx;

`ifdef USE_DRP
    wire  [1:0] drp_en_w; // [0] - select GTX, [1] - select drp_other_registers 
    wire  [1:0] drp_we_w; // [0] - select GTX, [1] - select drp_other_registers 
    reg   [1:0] drp_sel; // [0] - select GTX, [1] - select drp_other_registers
    wire [15:0] drp_do_gtx;
    wire [15:0] drp_do_meas;
    wire        drp_rdy_gtx;
    wire        drp_rdy_meas;
    wire [15:0] other_control; // control bits programmed over DRP interface
    
    assign drp_rdy =  (drp_sel[0] & drp_rdy_gtx) | (drp_sel[1] & drp_rdy_meas);
    assign drp_do =   ({16{drp_sel[0]}} & drp_do_gtx) | ({16{drp_sel[1]}} & drp_do_meas);
    assign drp_en_w = {2{drp_en & ~(|drp_addr[14:10])}} & {drp_addr[9],~drp_addr[9]};
    assign drp_we_w = {2{drp_we & ~(|drp_addr[14:10])}} & {drp_addr[9],~drp_addr[9]};
    
    always @ (posedge drp_clk) drp_sel <= {2{~(|drp_addr[14:10])}} & {drp_addr[9],~drp_addr[9]};
    
`endif



// insert resync if it's necessary
generate 
if (DATA_BYTE_WIDTH == 4) begin
    // resync to txusrclk
    // 2*Fin = Fout => WIDTHin = 2*WIDTHout
    // Andrey:
    reg            txdata_resync_strobe;
    reg     [15:0] txdata_enc_in_r;     // TODO: remove async reset
    reg     [ 1:0] txcharisk_enc_in_r;  // TODO: remove async reset
    wire    [38:0] txdata_resync_out;
    wire           txdata_resync_valid;
    reg      [1:0] txcomwake_gtx_f; // 2 registers just to match latency (data to the 3 next) in Alexey's code, probably not needed
    reg      [1:0] txcominit_gtx_f;
    reg      [1:0] txelecidle_gtx_f;
    
    resync_data #( // TODO: update output register..  OK as it is
        .DATA_WIDTH(39),
        .DATA_DEPTH(3),
        .INITIAL_VALUE(39'h4000000000) // All 0 but txelecidle_gtx
    ) txdata_resynchro (
        .arst     (txreset),                                               // input
        .srst     (~wrap_txreset_),                                        // input
        .wclk     (txusrclk2),                                             // input
        .rclk     (txusrclk),                                              // input
        .we       (1'b1),                                                  // input
        .re       (txdata_resync_strobe),                                  // input
        .data_in  ({txelecidle, txcominit, txcomwake, txcharisk, txdata}), // input[15:0] 
        .data_out (txdata_resync_out),                                     // output[15:0] reg 
        .valid    (txdata_resync_valid)                                    // output reg 
    );
    always @ (posedge txreset or posedge txusrclk) begin
        if      (txreset)             txdata_resync_strobe <= 0;
        else if (txdata_resync_valid) txdata_resync_strobe <= ~txdata_resync_strobe;

        if (txreset) begin
            txcomwake_gtx_f  <= 0;
            txcominit_gtx_f  <= 0;
            txelecidle_gtx_f <= ~0;
        end else begin
            txcomwake_gtx_f  <= {txdata_resync_out[36],txcomwake_gtx_f[1]};
            txcominit_gtx_f  <= {txdata_resync_out[37],txcominit_gtx_f[1]};
            txelecidle_gtx_f <= {txdata_resync_out[38],txelecidle_gtx_f[1]};
        end
    end
// Changing to sync reset (otherwise WARNING: [DRC 23-20] Rule violation (REQP-1839) RAMB36 async control check ...)
    always @ (posedge txusrclk) begin
        if (txreset) begin
            txdata_enc_in_r <=    0;
            txcharisk_enc_in_r <= 0;
        end else if (txdata_resync_valid) begin
            txdata_enc_in_r <=    txdata_resync_strobe? txdata_resync_out[31:16]: txdata_resync_out[15:0];
            txcharisk_enc_in_r <= txdata_resync_strobe? txdata_resync_out[35:34]: txdata_resync_out[33:32];
        end
    
    end


    assign  txdata_enc_in       = txdata_enc_in_r;
    assign  txcharisk_enc_in    = txcharisk_enc_in_r;
    assign  txcominit_gtx       = txcominit_gtx_f[0];
    assign  txcomwake_gtx       = txcomwake_gtx_f[0];
    assign  txelecidle_gtx      = txelecidle_gtx_f[0];
    
 end

else
if (DATA_BYTE_WIDTH == 2) begin
    // no resync is needed => straightforward assignments
    assign  txdata_enc_in       = txdata[15:0];
    assign  txcharisk_enc_in    = txcharisk[1:0];
    assign  txcominit_gtx       = txcominit;
    assign  txcomwake_gtx       = txcomwake;
    assign  txelecidle_gtx      = txelecidle;
end
else begin
    // unconsidered case
    always @ (posedge txusrclk)
    begin
        $display("Wrong width set in %m, value is %d", DATA_BYTE_WIDTH);
    end
end
endgenerate

// 8/10 encoder @ txusrclk, 16 + 1 bits -> 20
gtx_8x10enc gtx_8x10enc(
    .rst        (~wrap_txreset_),
    .clk        (txusrclk),
    .indata     (txdata_enc_in),
    .inisk      (txcharisk_enc_in),
    .outdata    (txdata_enc_out)
);

// Adjust RXOUTCLK so RXUSRCLK (==xclk) matches SIPO output data
`ifdef CLK_ADJUST_VARIANT_1
    wire rxcdrlock; // Marked as "reserved" - maybe not use it, only rxelecidle?
    reg rxdlysreset = 0;
    wire rxphaligndone;
    wire rxdlysresetdone;    // gtx output
    reg rx_clocks_aligned = 0;
    reg [2:0] rxdlysreset_cntr = 7;
    reg  rxdlysresetdone_r;
    
    assign dbg_rxphaligndone =     rxphaligndone;     // never gets up?
    assign dbg_rx_clocks_aligned = rx_clocks_aligned;
    assign dbg_rxcdrlock =         rxcdrlock;         //goes in/out (because of the SS ?
    assign dbg_rxdlysresetdone =   rxdlysresetdone_r;
    always @ (posedge xclk) begin
    //    if (rxelecidle || !rxcdrlock) rxdlysreset_cntr <= 5;
        if (rxelecidle)               rxdlysreset_cntr <= 5;
        else if (|rxdlysreset_cntr)   rxdlysreset_cntr <=  rxdlysreset_cntr - 1;
        
    //    if (rxelecidle || !rxcdrlock) rxdlysreset <= 0;
        if (rxelecidle)               rxdlysreset <= 0;
        else                          rxdlysreset <= |rxdlysreset_cntr;
        
    //    if (rxelecidle || !rxcdrlock || rxdlysreset || |rxdlysreset_cntr) rx_clocks_aligned <= 0;
    //    if (rxelecidle || rxdlysreset || |rxdlysreset_cntr) rx_clocks_aligned <= 0;
        if (rxelecidle)                  rx_clocks_aligned <= 0;
    //    else if (rxphaligndone)                             rx_clocks_aligned <= 1;
        else if (rxphaligndone)          rx_clocks_aligned <= 1;
    
        if (rxelecidle || rxdlysreset || |rxdlysreset_cntr) rxdlysresetdone_r <= 0;
        else if (rxdlysresetdone)                           rxdlysresetdone_r <= 1;
    end
`else
    // time to first rxphaligndone ~450ns, time to second (that should stay - 4.9 usec, still much less than allowed ALIGNp response time)

    wire   rxdlysreset = clk_phase_align_req;
    reg    rxphaligndone1_r = 0;  // first time rxphaligndone gets active
    reg    rxphaligndone2_r = 0;  // rxphaligndone deasserted
    reg    rx_clocks_aligned = 0; // second time rxphaligndone gets active (and is supposed to stay)
    reg    rxdlysresetdone_r;     // debug only
    wire   rxphaligndone;
    wire   rxdlysresetdone; 
    wire   rxcdrlock; // Marked as "reserved" - maybe not use it, only rxelecidle? (seems alternating 0/1 forever- SS?)
    assign clk_phase_align_ack = rx_clocks_aligned;

    assign dbg_rxphaligndone =     rxphaligndone;     // never gets up?
    assign dbg_rx_clocks_aligned = rx_clocks_aligned;
    assign dbg_rxcdrlock =         rxcdrlock;         //goes in/out (because of the SS ?
    assign dbg_rxdlysresetdone =   rxdlysresetdone_r;
    wire bypass_aligned;
    `ifdef USE_DRP    
        assign bypass_aligned = other_control[0];
    `else
        assign bypass_aligned = 0;
    `endif
`ifdef ALIGN_CLOCKS
    wire first_confirm = rxphaligndone || (bypass_aligned && clk_phase_align_req);
    always @ (posedge xclk) begin
        if (rxelecidle)                                                 rxphaligndone1_r <= 0;
        else if (first_confirm)                                         rxphaligndone1_r <= 1;

        if (rxelecidle)                                                 rxphaligndone2_r <= 0;
        else if (rxphaligndone1_r && !first_confirm)                    rxphaligndone2_r <= 1;

        if (rxelecidle)                                                 rx_clocks_aligned <= 0;
        else if (rxphaligndone2_r && (rxphaligndone || bypass_aligned)) rx_clocks_aligned <= 1;

        if (rxelecidle || rxdlysreset)                                  rxdlysresetdone_r <= 0; // debug only
        else if (rxdlysresetdone)                                       rxdlysresetdone_r <= 1;
    end
`else  // ALIGN_CLOCKS - just bypassing  
    always @ (posedge xclk) begin
        if (rxelecidle)                              rxphaligndone1_r <= 0;
        else if (clk_phase_align_req)                rxphaligndone1_r <= 1;

        if (rxelecidle)                                    rxphaligndone2_r <= 0;
        else if (rxphaligndone1_r && !clk_phase_align_req) rxphaligndone2_r <= 1;

        if (rxelecidle)                              rx_clocks_aligned <= 0;
        else if (rxphaligndone2_r)                   rx_clocks_aligned <= 1;

        if (rxelecidle || rxdlysreset)               rxdlysresetdone_r <= 0;
        else if (rxphaligndone2_r)                   rxdlysresetdone_r <= 1;
    end
`endif    
    
`endif









/*
 * RX PCS part: comma detect + align module, 10/8 decoder, elastic buffer, interface resynchronisation
 * all modules before elastic buffer shall work on a restored clock - xclk
 */
// wire    xclk; make it output to measure frequency
// assuming GTX interface width = 20 bits
// comma aligner
wire    [19:0]  rxdata_comma_out;
wire    [19:0]  gtx_rx_data20 = {rxdisperr_gtx[1], rxcharisk_gtx[1], rxdata_gtx[15:8], rxdisperr_gtx[0], rxcharisk_gtx[0], rxdata_gtx[7:0]};
wire    [19:0]  rxdata_comma_in;
// TODO: Add timing constraints on gtx_rx_data20 to reduce spread between bits?
//`ifndef USE_DRP
//    `define USE_DRP
//`endif

    // asynchronous signals to be controlled by external programmable bits
wire             RXPHDLYRESET; //  1 (1'b0), 
wire             RXPHALIGN;    //  2 (1'b0),
wire             RXPHALIGNEN;  //  3 (1'b0),
wire             RXPHDLYPD;    //  4 (1'b0),
wire             RXPHOVRDEN;   //  5 (1'b0),
wire             RXDLYSRESET;  //  6 (rxdlysreset),
wire             RXDLYBYPASS;  //  7 (1'b0), // Andrey: p.243: "0: Uses the RX delay alignment circuit."
wire             RXDLYEN;      //  8 (1'b0),
wire             RXDLYOVRDEN;  //  9 (1'b0),
wire             RXDDIEN;      // 10 (1'b1), // Andrey: p.243: "Set high in RX buffer bypass mode"
wire             RXLPMEN;      // 11 (1'b0) 1 - enable LP, 0 - DXE 

reg     [19:0]  rxdata_comma_in_r;
assign rxdata_comma_in = rxdata_comma_in_r;
always @ (posedge xclk) 
    rxdata_comma_in_r <= gtx_rx_data20;

`ifdef USE_DRP
    drp_other_registers #(
        .DRP_ABITS(8),
        .DRP_REG0(8),
        .DRP_REG1(9),
        .DRP_REG2(10),
        .DRP_REG3(11)
    ) drp_other_registers_i (
        .drp_rst       (drp_rst), // input
        .drp_clk       (drp_clk),         // input
        .drp_en        (drp_en_w[1]),     // input
        .drp_we        (drp_we_w[1]),     // input
        .drp_addr      (drp_addr[7:0]),   // input[7:0] 
        .drp_di        (drp_di),          // input[15:0] 
        .drp_rdy       (drp_rdy_meas),    // output reg 
        .drp_do        (drp_do_meas),     // output[15:0] reg 
        .drp_register0 (),                // output[15:0] // reserved for future use 
        .drp_register1 (),                // output[15:0] // reserved for future use 
        .drp_register2 (),                // output[15:0] // reserved for future use
        .drp_register3 (other_control)    // output[15:0] // reserved for future use 
    );
    
    assign RXPHDLYRESET = other_control[ 1]; //  1 (1'b0), 
    assign RXPHALIGN =    other_control[ 2]; //  2 (1'b0),
    assign RXPHALIGNEN =  other_control[ 3]; //  3 (1'b0),
    assign RXPHDLYPD =    other_control[ 4]; //  4 (1'b0),
    assign RXPHOVRDEN =   other_control[ 5]; //  5 (1'b0),
    assign RXDLYSRESET =  other_control[ 6]; //  6 (rxdlysreset),
    assign RXDLYBYPASS =  other_control[ 7]; //  7 (1'b0), // Andrey: p.243: "0: Uses the RX delay alignment circuit."
    assign RXDLYEN =      other_control[ 8]; //  8 (1'b0),
    assign RXDLYOVRDEN =  other_control[ 9]; //  9 (1'b0),
    assign RXDDIEN =      other_control[10]; // 10 (1'b1), // Andrey: p.243: "Set high in RX buffer bypass mode"
    assign RXLPMEN =      other_control[11]; // 11 (1'b0) 1 - enable LP, 0 - DXE
`else
    // VDT bug - considered USE_DRP undefined during closure, temporary including unconnected module     
    drp_other_registers #(
        .DRP_ABITS     (8),
        .DRP_REG0      (8),
        .DRP_REG1      (9),
        .DRP_REG2      (10),
        .DRP_REG3      (11)
    ) drp_other_registers_i (
        .drp_rst       (1'b0), // input
        .drp_clk       (1'b0), // input
        .drp_en        (1'b0), // input
        .drp_we        (1'b0), // input
        .drp_addr      (8'b0), // input[7:0] 
        .drp_di        (16'b0),// input[15:0] 
        .drp_rdy       (),     // output reg 
        .drp_do        (),     // output[15:0] reg 
        .drp_register0 (),     // output[15:0] // reserved for future use 
        .drp_register1 (),     // output[15:0] // reserved for future use 
        .drp_register2 (),     // output[15:0] // reserved for future use
        .drp_register3 ()      // output[15:0] // reserved for future use 
    );
    assign RXPHDLYRESET =     1'b0;; //  1 (1'b0), 
    assign RXPHALIGN =        1'b0;; //  2 (1'b0),
    assign RXPHALIGNEN =      1'b0;; //  3 (1'b0),
    assign RXPHDLYPD =        1'b0;; //  4 (1'b0),
    assign RXPHOVRDEN =       1'b0;; //  5 (1'b0),
    assign RXDLYSRESET =      1'b0;; //  6 (rxdlysreset),
    `ifdef ALIGN_CLOCKS    
        assign RXDLYBYPASS =  1'b0; //  7 (1'b0), // Andrey: p.243: "0: Uses the RX delay alignment circuit."
    `else    
        assign RXDLYBYPASS =  1'b1; //  7 (1'b0), // Andrey: p.243: "0: Uses the RX delay alignment circuit."
    `endif        
    assign RXDLYEN =          1'b0; //  8 (1'b0),
    assign RXDLYOVRDEN =      1'b0; //  9 (1'b0),
    `ifdef ALIGN_CLOCKS    
        assign RXDDIEN =      1'b1; // Andrey: p.243: "Set high in RX buffer bypass mode"
    `else    
        assign RXDDIEN =      1'b0; // 10 (1'b1), // Andrey: p.243: "Set high in RX buffer bypass mode"
    `endif        
    assign RXLPMEN =          1'b0; // 11 (1'b0) 1 - enable LP, 0 - DXE 
`endif
// aligner status generation
// if we detected comma & there was 1st realign after non-aligned state -> triggered, we wait until the next comma
// if no realign would be issued, assumes, that we've aligned to the stream otherwise go back to non-aligned state
wire    comma;
wire    realign;
wire    state_nonaligned;
reg     state_aligned;
reg     state_triggered;
wire    set_aligned;
wire    set_triggered;
wire    clr_aligned;
wire    clr_triggered;

assign  state_nonaligned = ~state_aligned & ~state_triggered;
assign  set_aligned     = state_triggered & comma & ~realign;
assign  set_triggered   = state_nonaligned & comma;
assign  clr_aligned     = realign;
assign  clr_triggered   = realign;

always @ (posedge xclk)
begin
    state_aligned   <= (set_aligned   | state_aligned  ) & wrap_rxreset_ & ~clr_aligned; 
    state_triggered <= (set_triggered | state_triggered) & wrap_rxreset_ & ~clr_triggered; 
end

gtx_comma_align gtx_comma_align(
//    .rst        (~rx_clocks_aligned), // ~wrap_rxreset_),
    .rst        (~wrap_rxreset_),
    
    .clk        (xclk),
    .indata     (rxdata_comma_in),
    .outdata    (rxdata_comma_out),
    .comma      (comma),
    .realign    (realign)
);

//

// 10x8 decoder
wire    [15:0]  rxdata_dec_out;
wire    [1:0]   rxcharisk_dec_out;
wire    [1:0]   rxnotintable_dec_out;
wire    [1:0]   rxdisperr_dec_out;

gtx_10x8dec gtx_10x8dec(
//    .rst        (~rx_clocks_aligned), // ~wrap_rxreset_),
    .rst        (~wrap_rxreset_),
    .clk        (xclk),
    .indata     (rxdata_comma_out),
    .outdata    (rxdata_dec_out),
    .outisk     (rxcharisk_dec_out),
    .notintable (rxnotintable_dec_out),
    .disperror  (rxdisperr_dec_out)
);
// iface resync
wire    rxcomwakedet_gtx;
wire    rxcominitdet_gtx;

    
elastic1632 #(
    .DEPTH_LOG2 (ELASTIC_DEPTH),  // 16 //4),
    .OFFSET     (ELASTIC_OFFSET)  // 10 //5)
) elastic1632_i (
    .wclk           (xclk),                               // input 150MHz, recovered
    .rclk           (rxusrclk2),                          // input 75 MHz, system
    .isaligned_in   (state_aligned),                      // input Moved clock phase reset/align to OOB module to handle
    .charisk_in     (rxcharisk_dec_out),                  // input[1:0] 
    .notintable_in  (rxnotintable_dec_out),               // input[1:0] 
    .disperror_in   (rxdisperr_dec_out),                  // input[1:0] 
    .data_in        (rxdata_dec_out),                     // input[15:0] 
    .isaligned_out  (rxbyteisaligned),                    // output
    .charisk_out    (rxcharisk),                          // output[3:0] reg 
    .notintable_out (rxnotintable),                       // output[3:0] reg 
    .disperror_out  (rxdisperr),                          // output[3:0] reg 
    .data_out       (rxdata),                             // output[31:0] reg 
    .full           (rxelsfull),                          // output
    .empty          (rxelsempty)                          // output
);

`ifdef DEBUG_ELASTIC
    localparam ALIGN_PRIM = 32'h7B4A4ABC;
    localparam SOF_PRIM =   32'h3737b57c;
    localparam EOF_PRIM =   32'hd5d5b57c;
    localparam CONT_PRIM =  32'h9999aa7c;
    localparam HOLD_PRIM =  32'hd5d5aa7c;
    localparam HOLDA_PRIM = 32'h9595aa7c;
    localparam WTRM_PRIM =  32'h5858b57c;
    

    reg            [15:0] dbg_data_in_r;
    reg             [1:0] dbg_charisk_in_r;
    reg                   dbg_aligned32_in_r;  // input data is word-aligned and got ALIGNp
    reg                   dbg_msb_in_r;      // input contains MSB
    reg            [11:0] dbg_data_cntr_r;
    reg             [3:0] got_prims_r;
    reg                   dbg_frun;
    reg dbg_is_sof_r;
    reg dbg_is_eof_r;
    reg dbg_is_data_r;
    
    wire dbg_is_alignp_w = ({rxdata_dec_out,       dbg_data_in_r} ==       ALIGN_PRIM) && ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);

    wire dbg_is_sof_w =    ({rxdata_dec_out,       dbg_data_in_r} ==       SOF_PRIM)   && ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    wire dbg_is_eof_w =    ({rxdata_dec_out,       dbg_data_in_r} ==       EOF_PRIM) &&   ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    
    wire dbg_is_cont_w =   ({rxdata_dec_out,       dbg_data_in_r} ==       CONT_PRIM) &&  ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    wire dbg_is_hold_w =   ({rxdata_dec_out,       dbg_data_in_r} ==       HOLD_PRIM) &&  ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    wire dbg_is_holda_w =  ({rxdata_dec_out,       dbg_data_in_r} ==       HOLDA_PRIM) && ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    wire dbg_is_wrtm_w =   ({rxdata_dec_out,       dbg_data_in_r} ==       WTRM_PRIM) &&  ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h1);
    
    
    wire dbg_is_data_w =   ({rxcharisk_dec_out,    dbg_charisk_in_r} ==    4'h0);
    
    always @ (posedge xclk) begin
        dbg_data_in_r <= rxdata_dec_out;
        dbg_charisk_in_r <= rxcharisk_dec_out;

            dbg_is_sof_r <= dbg_is_sof_w;
            dbg_is_eof_r <= dbg_is_eof_w;
            dbg_is_data_r <=dbg_is_data_w && dbg_msb_in_r;

            if (!dbg_aligned32_in_r && !dbg_is_alignp_w) dbg_msb_in_r <= 1;
            else                                         dbg_msb_in_r <= !dbg_msb_in_r;
            
            if    (!state_aligned)                       dbg_aligned32_in_r <= 0;
            else if (dbg_is_alignp_w)                    dbg_aligned32_in_r <= 1;
            
            if (!dbg_aligned32_in_r || dbg_is_sof_r)     got_prims_r <= 0;
            else if (dbg_frun)                           got_prims_r <= got_prims_r | {dbg_is_cont_w, dbg_is_hold_w, dbg_is_holda_w, dbg_is_wrtm_w};
            

        if (!dbg_aligned32_in_r || dbg_is_eof_r) dbg_frun <= 0;
        else if (dbg_is_sof_r)                   dbg_frun <= 1; 
        
        if (!dbg_aligned32_in_r || dbg_is_sof_r)           dbg_data_cntr_r <= 0;
        else if (dbg_frun && dbg_is_data_r)                dbg_data_cntr_r <=  dbg_data_cntr_r + 1;
        
        if (!dbg_aligned32_in_r || dbg_is_sof_r)           dbg_data_cntr <= {got_prims_r, dbg_data_cntr_r}; // copy previous value
    
    end

`endif // DEBUG_ELASATIC


reg rxresetdone_r;
reg txresetdone_r;
always @ (posedge rxusrclk2) rxresetdone_r <= rxresetdone_gtx;
always @ (posedge txusrclk2) txresetdone_r <= txresetdone_gtx;
assign  rxresetdone     = rxresetdone_r;
assign  txresetdone     = txresetdone_r;

pulse_cross_clock #(
    .EXTRA_DLY(0)
) pulse_cross_clock_rxcominitdet_i (
    .rst       (~wrap_rxreset_),   // input
    .src_clk   (xclk),             // input
    .dst_clk   (rxusrclk2),        // input
    .in_pulse  (rxcominitdet_gtx), // input
    .out_pulse (rxcominitdet),     // output
    .busy      ()                  // output
);

pulse_cross_clock #(
    .EXTRA_DLY(0)
) pulse_cross_clock_rxcomwakedet_i (
    .rst       (~wrap_rxreset_),   // input
    .src_clk   (xclk),             // input
    .dst_clk   (rxusrclk2),        // input
    .in_pulse  (rxcomwakedet_gtx), // input
    .out_pulse (rxcomwakedet),     // output
    .busy      ()                  // output
);
wire    txoutclk_gtx; 
wire    xclk_gtx;

select_clk_buf #(
    .BUFFER_TYPE("BUFG")
) bufg_txoutclk (
    .o          (txoutclk),      // output
    .i          (txoutclk_gtx),  // input
    .clr        (1'b0)           // input
);
select_clk_buf #(
    .BUFFER_TYPE("BUFG")
) bug_xclk (
    .o          (xclk),      // output
    .i          (xclk_gtx),  // input
    .clr        (1'b0)       // input
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
    .RX_DATA_WIDTH                          (20),
    .OUTREFCLK_SEL_INV                      (2'b11),
    .PMA_RSV                                (32'h00018480),
    .PMA_RSV2                               (16'h2050),
    .PMA_RSV3                               (2'b00),
    .PMA_RSV4                               (32'h00000000),
    .RX_BIAS_CFG                            (12'b000000000100),
    .DMONITOR_CFG                           (24'h000A00),
//    .RX_CM_SEL                              (2'b11),
    .RX_CM_SEL                              (2'b00), // Andrey
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
    .RXBUF_EN                               ("FALSE"),
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
`ifdef ALIGN_CLOCKS    
//    .RX_XCLK_SEL                            ("RXUSR"), // ("RXREC"), // Andrey: Now they are the same, just using p.247 "Using RX Buffer Bypass..."
    .RX_XCLK_SEL                            ("RXREC"),    // Andrey: Does not align clocks if in this mode
`else    
    .RX_XCLK_SEL                            ("RXREC"),    // Andrey: Does not align clocks if in this mode
`endif    
    .RX_DDI_SEL                             (6'b000000),
    .RX_DEFER_RESET_BUF_EN                  ("TRUE"),
/// .RXCDR_CFG                              (72'h03_0000_23ff_1020_0020),// 1.6G - 6.25G, No SS, RXOUT_DIV=2
    .RXCDR_CFG                              (72'h03_8800_8BFF_4020_0008),// http://www.xilinx.com/support/answers/53364.html - SATA-2, div=2
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
    .SATA_BURST_SEQ_LEN                     (4'b0101),
    .SATA_BURST_VAL                         (3'b100),
    .SATA_EIDLE_VAL                         (3'b100),
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
    .TX_DATA_WIDTH                          (20),
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
///    .RX_DFE_LPM_CFG                         (16'h0954),
    .RX_DFE_LPM_CFG                         (16'h0904),
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
gtxe2_channel_wrapper(
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
    .TSTIN                          (20'h1),
    .TSTOUT                         (),
    .CLKRSVD                        (4'b0000),
    .GTGREFCLK                      (1'b0),
    .GTNORTHREFCLK0                 (1'b0),
    .GTNORTHREFCLK1                 (1'b0),
    .GTREFCLK0                      (gtrefclk),
    .GTREFCLK1                      (1'b0),
    .GTSOUTHREFCLK0                 (1'b0),
    .GTSOUTHREFCLK1                 (1'b0),
`ifdef USE_DRP    
        .DRPADDR                    (drp_addr[8:0]),
        .DRPCLK                     (drp_clk),
        .DRPDI                      (drp_di),
        .DRPDO                      (drp_do_gtx),
        .DRPEN                      (drp_en_w[0]),
        .DRPRDY                     (drp_rdy_gtx),
        .DRPWE                      (drp_we_w[0]),
`else
        .DRPADDR                        (9'b0),
        .DRPCLK                         (1'b0),
        .DRPDI                          (16'b0),
        .DRPDO                          (),
        .DRPEN                          (1'b0),
        .DRPRDY                         (),
        .DRPWE                          (1'b0),
`endif    
    .GTREFCLKMONITOR                (),
    .QPLLCLK                        (1'b0/*gtrefclk*/),
    .QPLLREFCLK                     (1'b0/*gtrefclk*/),
    .RXSYSCLKSEL                    (2'b00),
    .TXSYSCLKSEL                    (2'b00),
    .DMONITOROUT                    (),
    .TX8B10BEN                      (1'b0),
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
    .RXCDRLOCK                      (rxcdrlock),
    .RXCDROVRDEN                    (1'b0),
    .RXCDRRESET                     (1'b0),
    .RXCDRRESETRSV                  (1'b0),
    .RXCLKCORCNT                    (),
    .RX8B10BEN                      (1'b0),
    
///    .RXUSRCLK                       (rxusrclk),
///    .RXUSRCLK2                      (rxusrclk),
/// When internal elastic buffer is bypassed, these clocks should be restored clock synchronous
    .RXUSRCLK                       (xclk),
    .RXUSRCLK2                      (xclk),
    
    .RXDATA                         (rxdata_gtx),
    .RXPRBSERR                      (),
    .RXPRBSSEL                      (3'd0),
    .RXPRBSCNTRESET                 (1'b0),
    .RXDFEXYDEN                     (1'b1),
    .RXDFEXYDHOLD                   (1'b0),
    .RXDFEXYDOVRDEN                 (1'b0),
    .RXDISPERR                      (rxdisperr_gtx),
    .RXNOTINTABLE                   (),
    .GTXRXP                         (rxp),
    .GTXRXN                         (rxn),
    .RXBUFRESET                     (1'b0),
    .RXBUFSTATUS                    (),
`ifdef ALIGN_CLOCKS    
    .RXDDIEN                   (RXDDIEN),             //      (1'b1), // Andrey: p.243: "Set high in RX buffer bypass mode"
    .RXDLYBYPASS               (RXDLYBYPASS),         //      (1'b0), // Andrey: p.243: "0: Uses the RX delay alignment circuit."
`else
    .RXDDIEN                   (RXDDIEN),             //      (1'b0),
    .RXDLYBYPASS               (RXDLYBYPASS),         //      (1'b1),
`endif
    .RXDLYEN                   (RXDLYEN),             //      (1'b0),
    .RXDLYOVRDEN               (RXDLYOVRDEN),         //      (1'b0),
    .RXDLYSRESET               (RXDLYSRESET || rxdlysreset),
    .RXDLYSRESETDONE                (rxdlysresetdone),
    .RXPHALIGN                 (RXPHALIGN),           //      (1'b0),
    .RXPHALIGNDONE                  (rxphaligndone),
    .RXPHALIGNEN               (RXPHALIGNEN),         //      (1'b0),
    .RXPHDLYPD                 (RXPHDLYPD),           //      (1'b0),
    .RXPHDLYRESET              (RXPHDLYRESET),        //      (1'b0),
    .RXPHMONITOR                    (),
    .RXPHOVRDEN                (RXPHOVRDEN),          //      (1'b0),
    .RXPHSLIPMONITOR                (),
    .RXSTATUS                       (),
    .RXBYTEISALIGNED                (),
    .RXBYTEREALIGN                  (),
    .RXCOMMADET                     (),
    .RXCOMMADETEN                   (1'b0),
    .RXMCOMMAALIGNEN                (1'b0),
    .RXPCOMMAALIGNEN                (1'b0),
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
    .RXOUTCLK                       (xclk_gtx),
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
    .RXLPMEN                        (RXLPMEN), // 1'b0),
    .RXCOMSASDET                    (),
    .RXCOMWAKEDET                   (rxcomwakedet_gtx),
    .RXCOMINITDET                   (rxcominitdet_gtx),
    .RXELECIDLE                     (rxelecidle),
    .RXELECIDLEMODE                 (2'b00),
    .RXPOLARITY                     (1'b0),
    .RXSLIDE                        (1'b0),
    .RXCHARISCOMMA                  (),
    .RXCHARISK                      (rxcharisk_gtx),
    .RXCHBONDI                      (5'b00000),
    .RXRESETDONE                    (rxresetdone_gtx),
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
    .TXCHARDISPMODE                 (txchardispmode_gtx),
    .TXCHARDISPVAL                  (txchardispval_gtx),
    .TXUSRCLK                       (txusrclk),
    .TXUSRCLK2                      (txusrclk),
    .TXELECIDLE                     (txelecidle_gtx),
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
    .TXBUFSTATUS                    (txbufstatus[1:0]), // Andrey
    .TXBUFDIFFCTRL                  (3'b100),
    .TXDEEMPH                       (1'b0),
    .TXDIFFCTRL                     (4'b1000),
    .TXDIFFPD                       (1'b0),
    .TXINHIBIT                      (1'b0),
    .TXMAINCURSOR                   (7'b0000000),
    .TXPISOPD                       (1'b0),
    .TXDATA                         (txdata_gtx),
    .GTXTXN                         (txn),
    .GTXTXP                         (txp),
    .TXOUTCLK                       (txoutclk_gtx),
    .TXOUTCLKFABRIC                 (),
    .TXOUTCLKPCS                    (),
    .TXOUTCLKSEL                    (3'b010),
    .TXRATEDONE                     (),
    .TXCHARISK                      (txcharisk_gtx),
    .TXGEARBOXREADY                 (),
    .TXHEADER                       (3'd0),
    .TXSEQUENCE                     (7'd0),
    .TXSTARTSEQ                     (1'b0),
    .TXPCSRESET                     (txpcsreset),
    .TXPMARESET                     (1'b0),
    .TXRESETDONE                    (txresetdone_gtx),
    .TXCOMFINISH                    (txcomfinish),
    .TXCOMINIT                      (txcominit_gtx),
    .TXCOMSAS                       (1'b0),
    .TXCOMWAKE                      (txcomwake_gtx),
    .TXPDELECIDLEMODE               (1'b0),
    .TXPOLARITY                     (1'b0),
    .TXDETECTRX                     (1'b0),
    .TX8B10BBYPASS                  (8'd0),
    .TXPRBSSEL                      (3'd0),
    .TXQPISENN                      (),
    .TXQPISENP                      ()
);


`ifdef USE_DATASCOPE
    `ifdef DATASCOPE_INCOMING_RAW
        datascope_incoming_raw #(
            .ADDRESS_BITS        (ADDRESS_BITS),
            .DATASCOPE_POST_MEAS (DATASCOPE_POST_MEAS)
        ) datascope_incoming_i (
            .clk              (xclk), // input
            .charisk          (rxcharisk_dec_out[1:0]), // input[1:0] 
            .rxdata           (rxdata_dec_out[15:0]), // input[15:0] 
            .realign          (realign), // input
            .comma            (comma), // input
            .aligned          (state_aligned), // input
            .not_in_table     (rxnotintable_dec_out[1:0]), // input[1:0] 
            .disp_err         (rxdisperr_dec_out[1:0]), // input[1:0] 
            .datascope_arm    (other_control[DATASCOPE_START_BIT]), // input
            .datascope_clk    (datascope_clk), // output
            .datascope_waddr  (datascope_waddr), // output[9:0] 
            .datascope_we     (datascope_we), // output
            .datascope_di     (datascope_di), // output[31:0] reg 
            .datascope_trig   (datascope_trig) // input
        );
    `else //  DATASCOPE_INCOMING_RAW
        datascope_incoming #(
            .ADDRESS_BITS        (ADDRESS_BITS),
            .DATASCOPE_POST_MEAS (DATASCOPE_POST_MEAS)
        ) datascope_incoming_i (
            .clk              (xclk), // input
            .charisk          (rxcharisk_dec_out[1:0]), // input[1:0] 
            .rxdata           (rxdata_dec_out[15:0]), // input[15:0] 
            .aligned          (state_aligned), // input
            .not_in_table     (rxnotintable_dec_out[1:0]), // input[1:0] 
            .disp_err         (rxdisperr_dec_out[1:0]), // input[1:0] 
            .datascope_arm    (other_control[DATASCOPE_START_BIT]), // input
            .datascope_clk    (datascope_clk), // output
            .datascope_waddr  (datascope_waddr), // output[9:0] 
            .datascope_we     (datascope_we), // output
            .datascope_di     (datascope_di), // output[31:0] reg 
            .datascope_trig   (datascope_trig) // input
        );
    
    `endif //  not DATASCOPE_INCOMING_RAW
`endif

    always @ (posedge gtrefclk)
        debug <= ~rxelecidle | debug;

endmodule



module  datascope_incoming_raw#(
    parameter ADDRESS_BITS =         10, // for datascope
    parameter DATASCOPE_POST_MEAS =  16  // number of measurements to perform after event
)(
    input                     clk, // source-synchronous clock (150MHz)
    input               [1:0] charisk,
    input              [15:0] rxdata,
    input                     realign,
    input                     comma,
    input                     aligned,
    input               [1:0] not_in_table,
    input               [1:0] disp_err,
    input                     datascope_arm,
    output                    datascope_clk,
    output [ADDRESS_BITS-1:0] datascope_waddr,
    output                    datascope_we,
    output reg         [31:0] datascope_di,
    input                     datascope_trig // external trigger event for the datascope
);

    reg [ADDRESS_BITS - 1:0 ] datascope_post_cntr;
    reg [ADDRESS_BITS - 1:0 ] datascope_waddr_r;
    reg                 [2:0] datascope_start_r;
    wire                      datascope_event;
    reg                       datascope_event_r;
    reg                       datascope_run;
    reg                       datascope_post_run;
//    wire                      datascope_start_w = other_control[DATASCOPE_START_BIT]; // datascope requires USE_DRP to be defined
    wire                      datascope_stop =  (DATASCOPE_POST_MEAS == 0) ? datascope_event: (datascope_post_cntr == 0);
    reg                 [2:0] datascope_trig_r;      
    assign datascope_waddr =  datascope_waddr_r;
    assign datascope_we =     datascope_run;
    assign datascope_clk =    clk;
    assign datascope_event = (not_in_table) || (disp_err) || realign || (datascope_trig_r[1] && !datascope_trig_r[2]) ;
    
    
    always @ (posedge clk) begin
        datascope_trig_r <= {datascope_trig_r[1:0], datascope_trig};
    
        datascope_start_r <= {datascope_start_r[1:0],datascope_arm};
        
        datascope_event_r <=datascope_event;
        
        if      (!datascope_start_r[1]) datascope_run <= 0;
        else if (!datascope_start_r[2]) datascope_run <= 1;
        else if (datascope_stop)        datascope_run <= 0; 

        if      (!datascope_run)        datascope_post_run <= 0;
        else if (datascope_event_r)     datascope_post_run <= 1;
        
        if (!datascope_post_run) datascope_post_cntr <= DATASCOPE_POST_MEAS;
        else                     datascope_post_cntr <= datascope_post_cntr  - 1;  
        
        if (!datascope_start_r[1] && datascope_start_r[0]) datascope_waddr_r <= 0; // for simulator
        else if (datascope_run)                            datascope_waddr_r <=  datascope_waddr_r + 1;
        
        if (datascope_start_r[1]) datascope_di <= {
                                   6'b0,
                                   realign,           // 25  
                                   comma,             // 24
                                   1'b0,              // 23 
                                   aligned,           // 22   
                                   not_in_table[1:0], // 21:20
                                   disp_err[1:0],     // 19:18
                                   charisk[1:0],      // 17:16
                                   rxdata[15:0]};     // 15: 0
    end

endmodule

module  datascope_incoming#( 
    parameter ADDRESS_BITS =         10, // for datascope
    parameter DATASCOPE_POST_MEAS =  16  // number of measurements to perform after event
)(
    input                     clk, // source-synchronous clock (150MHz)
    input               [1:0] charisk,
    input              [15:0] rxdata,
    input                     aligned,
    input               [1:0] not_in_table,
    input               [1:0] disp_err,
    input                     datascope_arm,
    output                    datascope_clk,
    output [ADDRESS_BITS-1:0] datascope_waddr,
    output                    datascope_we,
    output             [31:0] datascope_di,
    input                     datascope_trig // external trigger event for the datascope
    
);
    localparam ALIGN_PRIM =   32'h7b4a4abc;
    localparam CONT_PRIM =    32'h9999aa7c;
    localparam DMAT_PRIM =    32'h3636b57c;
    localparam EOF_PRIM =     32'hd5d5b57c;
    localparam HOLD_PRIM =    32'hd5d5aa7c;
    localparam HOLDA_PRIM =   32'h9595aa7c;
    localparam PMACK_PRIM =   32'h9595957c;
    localparam PMNAK_PRIM =   32'hf5f5957c;
    localparam PMREQ_P_PRIM = 32'h1717b57c;
    localparam PMREQ_S_PRIM = 32'h7575957c;
    localparam R_ERR_PRIM =   32'h5656b57c;
    localparam R_IP_PRIM =    32'h5555b57c;
    localparam R_OK_PRIM =    32'h3535b57c;
    localparam R_RDY_PRIM =   32'h4a4a957c;
    localparam SOF_PRIM =     32'h3737b57c;
    localparam SYNC_PRIM =    32'hb5b5957c;
    localparam WTRM_PRIM =    32'h5858b57c;
    localparam X_RDY_PRIM =   32'h5757b57c;
    
    localparam NUM_NIBBLES = 6;
    reg                [15:0] rxdata_r;
    reg                [ 1:0] charisk_r;
    
    wire is_alignp =  ({rxdata, rxdata_r} == ALIGN_PRIM)   && ({charisk, charisk_r} ==    4'h1);
    wire is_cont =    ({rxdata, rxdata_r} == CONT_PRIM)    && ({charisk, charisk_r} ==    4'h1);
    wire is_dmat =    ({rxdata, rxdata_r} == DMAT_PRIM)    && ({charisk, charisk_r} ==    4'h1);
    wire is_eof =     ({rxdata, rxdata_r} == EOF_PRIM)     && ({charisk, charisk_r} ==    4'h1);
    wire is_hold =    ({rxdata, rxdata_r} == HOLD_PRIM)    && ({charisk, charisk_r} ==    4'h1);
    wire is_holda =   ({rxdata, rxdata_r} == HOLDA_PRIM)   && ({charisk, charisk_r} ==    4'h1);
    wire is_pmack =   ({rxdata, rxdata_r} == PMACK_PRIM)   && ({charisk, charisk_r} ==    4'h1);
    wire is_pmnak =   ({rxdata, rxdata_r} == PMNAK_PRIM)   && ({charisk, charisk_r} ==    4'h1);
    wire is_pmreq_p = ({rxdata, rxdata_r} == PMREQ_P_PRIM) && ({charisk, charisk_r} ==    4'h1);
    wire is_pmreq_s = ({rxdata, rxdata_r} == PMREQ_S_PRIM) && ({charisk, charisk_r} ==    4'h1);
    wire is_r_err =   ({rxdata, rxdata_r} == R_ERR_PRIM)   && ({charisk, charisk_r} ==    4'h1);
    wire is_r_ip =    ({rxdata, rxdata_r} == R_IP_PRIM)    && ({charisk, charisk_r} ==    4'h1);
    wire is_r_ok =    ({rxdata, rxdata_r} == R_OK_PRIM)    && ({charisk, charisk_r} ==    4'h1);
    wire is_r_rdy =   ({rxdata, rxdata_r} == R_RDY_PRIM)   && ({charisk, charisk_r} ==    4'h1);
    wire is_sof =     ({rxdata, rxdata_r} == SOF_PRIM)     && ({charisk, charisk_r} ==    4'h1);
    wire is_sync =    ({rxdata, rxdata_r} == SYNC_PRIM)    && ({charisk, charisk_r} ==    4'h1);
    wire is_wrtm =    ({rxdata, rxdata_r} == WTRM_PRIM)    && ({charisk, charisk_r} ==    4'h1);
    wire is_xrdy =    ({rxdata, rxdata_r} == X_RDY_PRIM)   && ({charisk, charisk_r} ==    4'h1);

    wire        is_data_w =      {charisk, charisk_r} ==    4'h0;
    
    wire [17:0] is_prim_w = {is_alignp,
                           is_cont,
                           is_dmat,
                           is_eof,
                           is_hold,
                           is_holda,
                           is_pmack,
                           is_pmnak,
                           is_pmreq_p,
                           is_pmreq_s,
                           is_r_err,
                           is_r_ip,
                           is_r_ok,
                           is_r_rdy,
                           is_sof,
                           is_sync,
                           is_wrtm,
                           is_xrdy};
    wire [ 2:0] is_err_w = {~aligned, |not_in_table, |disp_err};

    reg  [17:0] is_prim_r;
    reg         is_data_r;
    reg  [ 2:0] is_err_r;

    reg  [17:0] is_prim_r2;
    reg         is_data_r2;
    reg  [ 3:0] is_err_r2;
    wire [31:0] states = {9'b0, is_err_r2[3:0], is_prim_r2[17:0], is_data_r2}; // to add more states ?
    wire [ 4:0] encoded_states_w ={(|states[31:16]),
                                   (|states[31:24]) | (|states[15:8]),
                                   (|states[31:28]) | (|states[23:20]) | (|states[15:12]) | (|states[7:4]),
                                   (|states[31:30]) | (|states[27:26]) | (|states[23:22]) | (|states[19:18]) | (|states[15:14]) | (|states[11:10]) | (|states[7:6]) | (|states[3:2]), 
                                    states[31] | states[29] | states[27] | states[25] | states[23] | states[21] | states[19] | states[17] |
                                    states[15] | states[13] | states[11] | states[9] | states[7] | states[5] | states[3] | states[1]};
//    wire        stop =  (DATASCOPE_POST_MEAS == 0) ? datascope_trig: (post_cntr == 0);
                                    
    reg   [5*NUM_NIBBLES-1:0] encoded_states_r3;
    reg [ADDRESS_BITS - 1:0 ] post_cntr;
    reg                       post_run;
    reg [ADDRESS_BITS - 1:0 ] waddr_r;
    
    reg                 [2:0] arm_r;
    reg                 [2:0] trig_r;
    reg     [NUM_NIBBLES-1:0] wen;
    reg                       run_r = 0;
    wire                      event_w = trig_r[1] && !trig_r[2]; // re-clocked single-cycle external trigger
    reg                       event_r;
    wire                      stop =  (DATASCOPE_POST_MEAS == 0) ? event_w: (post_cntr == 0);
    reg                 [1:0] we_r=0;
    reg                       msb_in_r;
    
    reg                       is_aligned_r; // input aligned and got ALIGNp

    assign datascope_clk  =  clk;
    assign datascope_waddr = waddr_r;
    assign datascope_we =    we_r[1];
    assign datascope_di = {1'b0, post_run, encoded_states_r3};
    
    always @ (posedge clk) begin
        if    (!aligned)    is_aligned_r <= 0;
        else if (is_alignp) is_aligned_r <= 1;

        if (!is_aligned_r && !is_alignp) msb_in_r <= 1;
        else                             msb_in_r <= !msb_in_r;


        rxdata_r <=  rxdata;
        charisk_r <= charisk;
        
        
        arm_r <=  {arm_r[1:0], datascope_arm};
        trig_r <= {trig_r[1:0],datascope_trig};
        
        if      (!arm_r[1])     run_r <= 0;
        else if (!arm_r[2])     run_r <= 1;
        else if (stop)          run_r <= 0;
        
        event_r <= event_w;
        
        if      (!run_r)        post_run <= 0;
        else if (event_r)       post_run <= 1;

        if (msb_in_r) begin
            is_prim_r <= is_prim_w;
            is_err_r <=  is_err_w;
            is_data_r <= is_data_w;

            is_prim_r2 <= {18{~(|is_err_r)}} & is_prim_r;
            is_err_r2 <=  {is_err_r[2],is_err_r[1] & ~is_err_r[2],is_err_r[0] & ~(|is_err_r[2:1]), ~(|is_prim_r) & ~is_data_r & ~(|is_err_r)}; // make errors 1-hot by priority
            is_data_r2 <= is_data_r & ~(|is_err_r);

            encoded_states_r3 <= {encoded_states_w, encoded_states_r3[5*NUM_NIBBLES-1:5]};

            if (!run_r) wen <= 0;
            else        wen <= {wen[NUM_NIBBLES-2:0],~(|wen[NUM_NIBBLES-2:0])};


            we_r[0] <= run_r && wen[NUM_NIBBLES-1];
        end
        
        we_r[1] <=we_r[0] && !msb_in_r;

        if (!arm_r[1] && arm_r[0])   waddr_r <= 0; // for simulator
        else if (we_r[1])            waddr_r <= waddr_r + 1;
        
        if (!post_run)               post_cntr <= DATASCOPE_POST_MEAS;
        else if (we_r[1])            post_cntr <= post_cntr  - 1;

    end
endmodule

