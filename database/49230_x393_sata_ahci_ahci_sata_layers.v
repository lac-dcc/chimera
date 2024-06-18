// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>ahci_sata_layers
 * @file ahci_sata_layers.v
 * @date 2016-01-19  
 * @author Andrey Filippov     
 *
 * @brief Link and PHY SATA layers
 *
 * @copyright Copyright (c) 2016 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * ahci_sata_layers.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  ahci_sata_layers.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 */
`timescale 1ns/1ps
//`define CHECK_LOW_H2D_FIFO // reduce actual h2d fifo size during simulation, to test h2d_ready
/** TODO:
 1. Check nothing is left in H2D FIFO after data is sent  - it will happen after DPATp received.
 2. Make DPATp an error? It is not easy to insert 0x00000046" data FIS header before remaining data (already in FIS)
  - it may also hold fis_transmit, as maximal data fis is 4x of the FIFO size. 
*/
module  ahci_sata_layers #(
`ifdef USE_DATASCOPE
    parameter ADDRESS_BITS =         10, //for datascope
    parameter DATASCOPE_START_BIT =  14, // bit of DRP "other_control" to start recording after 0->1 (needs DRP)
    parameter DATASCOPE_POST_MEAS =  16, // number of measurements to perform after event
`endif        
    parameter BITS_TO_START_XMIT =    6,   // wait H2D FIFO to have 1 << BITS_TO_START_XMIT to start FIS transmission (or all FIS fits)
    parameter DATA_BYTE_WIDTH =       4,
    parameter ELASTIC_DEPTH =         4, //5, With 4/7 got infrequent overflows!
    parameter ELASTIC_OFFSET =        7, //  5 //10
    parameter FREQ_METER_WIDTH =     12
    
)(
    input              exrst,   // master reset that resets PLL and GTX
    input              reliable_clk, // use aclk that runs independently of the GTX
    output             rst,     // PHY-generated reset after PLL lock
    output             clk,     // PHY-generated clock, 75MHz for SATA2
// Data/type FIFO, host -> device   
    // Data System memory or FIS -> device
    input       [31:0] h2d_data,     // 32-bit data from the system memory to HBA (dma data)
    input       [ 1:0] h2d_mask,     // set to 2'b11
    input       [ 1:0] h2d_type,     // 0 - data, 1 - FIS head, 2 - FIS LAST
    input              h2d_valid,    // output  register full
    output             h2d_ready,    // h2d FIFO has room for data (>= 8? dwords)
 
// Data/type FIFO, device -> host
    output      [31:0] d2h_data,         // FIFO input  data
    output      [ 1:0] d2h_mask,     // set to 2'b11
    output      [ 1:0] d2h_type,    // 0 - data, 1 - FIS head, 2 - R_OK, 3 - R_ERR (last two - after data, so ignore data with R_OK/R_ERR)
    output             d2h_valid,  // Data available from the transport layer in FIFO                
    output             d2h_many,    // Multiple DWORDs available from the transport layer in FIFO           
    input              d2h_ready,   // This module or DMA consumes DWORD
    
   // communication with link/phys layers
    output      [ 1:0] phy_speed,       // 0 - not ready, 1..3 - negotiated speed (Now 0/2)
    output             gtx_ready,       // How to use it?
    output             xmit_ok,         // received R_OK after transmission
    output             xmit_err,        // Error during/after sending of a FIS (got R_ERR)
    output             x_rdy_collision, // X_RDY/X_RDY collision on interface 
    output             syncesc_recv,    // Where to get it?

    input              pcmd_st_cleared,      // PxCMD.ST 1->0 transition by software
    input              syncesc_send,      // Send sync escape
    output             syncesc_send_done, // "SYNC escape until the interface is quiescent..."
    input              comreset_send,     // Not possible yet?
    output             cominit_got,
    input              set_offline, // electrically idle
    
    input              send_R_OK,    // Should it be originated in this layer SM?
    input              send_R_ERR,
    
    // additional errors from SATA layers (single-clock pulses):
    
    output             serr_DT,   // RWC: Transport state transition error
    output             serr_DS,   // RWC: Link sequence error
    output             serr_DH,   // RWC: Handshake Error (i.e. Device got CRC error)
    output             serr_DC,   // RWC: CRC error in Link layer
    output             serr_DB,   // RWC: 10B to 8B decode error
    output             serr_DW,   // RWC: COMMWAKE signal was detected
    output             serr_DI,   // RWC: PHY Internal Error
                                  // sirq_PRC,
    output             serr_EE,   // RWC: Internal error (such as elastic buffer overflow or primitive mis-alignment)
    output             serr_EP,   // RWC: Protocol Error - a violation of SATA protocol detected
    output             serr_EC,   // RWC: Persistent Communication or Data Integrity Error
    output             serr_ET,   // RWC: Transient Data Integrity Error (error not recovered by the interface)
    output             serr_EM,   // RWC: Communication between the device and host was lost but re-established
    output             serr_EI,   // RWC: Recovered Data integrity Error
    // additional control signals for SATA layers
    input        [3:0] sctl_ipm,  // Interface power management transitions allowed // @SuppressThisWarning Veditor Unused (yet)
    input        [3:0] sctl_spd,  // Interface maximal speed                        // @SuppressThisWarning Veditor Unused (yet)

    // Device high speed pads and clock inputs    
    // ref clk from an external source, shall be connected to pads
    input   wire        extclk_p, 
    input   wire        extclk_n,
    // sata link data pins
    output  wire        txp_out,
    output  wire        txn_out,
    input   wire        rxp_in,
    input   wire        rxn_in,
    output              debug_is_data, // @clk (sata clk) - last symbol was data output
    output              debug_dmatp,  // @clk (sata clk) - received CODE_DMATP
    
`ifdef USE_DATASCOPE
// Datascope interface (write to memory that can be software-read)
    output                    datascope_clk,
    output [ADDRESS_BITS-1:0] datascope_waddr,
    output                    datascope_we,
    output             [31:0] datascope_di,
`endif    
    
`ifdef USE_DRP
    input               drp_rst,
    input               drp_clk,
    input               drp_en, // @aclk strobes drp_ad
    input               drp_we,
    input        [14:0] drp_addr,       
    input        [15:0] drp_di,
    output              drp_rdy,
    output       [15:0] drp_do ,
`endif    
    output  [FREQ_METER_WIDTH - 1:0] xclk_period,      // relative (to 2*clk) xclk period
    output       [31:0] debug_phy,
    output       [31:0] debug_link,
    input               hclk // just for testing
    
    
);
    localparam PHY_SPEED = 2; // SATA2
    localparam FIFO_ADDR_WIDTH = 9;
    
    localparam D2H_TYPE_DMA =      0;
    localparam D2H_TYPE_FIS_HEAD = 1;
    localparam D2H_TYPE_OK =       2;
    localparam D2H_TYPE_ERR =      3;

    localparam H2D_TYPE_FIS_DATA = 0; // @SuppressThisWarning VEditor unused
    localparam H2D_TYPE_FIS_HEAD = 1;
    localparam H2D_TYPE_FIS_LAST = 2;
    
`ifdef SIMULATION
    `ifdef CHECK_LOW_H2D_FIFO
        localparam H2D_FIFO_THRESHOLD = 4; // to test h2d_ready - will turn off frequently, much earlier than fifo almost full
    `endif
`endif
    
    
    wire               phy_ready;        // active when GTX gets aligned output
    wire               link_established; // Received 3 back-to-back non-ALIGNp 
    wire        [31:0] ll_h2d_data_in;
    wire         [1:0] ll_h2d_mask_in;
    wire               ll_strobe_out;
    wire               ll_h2d_last;
    wire         [1:0] h2d_type_out;
    
    wire        [31:0] ll_d2h_data_out;
    wire        [ 1:0] ll_d2h_mask_out;
    wire               ll_d2h_valid;
    wire               ll_d2h_almost_full;
    reg          [1:0] d2h_type_in;
    reg                fis_over_r;  // push 1 more DWORD (ignore) + type (ERR/OK) when received FIS is done/error         
    
    reg  ll_frame_req;         // -> link // request for a new frame transition
    wire ll_frame_ackn;        // acknowledge for ll_frame_req
     
    wire ll_incom_start;       // link -> // if started an incoming transaction    assuming this and next 2 are single-cycle
    wire ll_incom_done;        // link -> // if incoming transition was completed
    wire ll_incom_invalidate;  // link -> // if incoming transition had errors
    reg ll_incom_invalidate_r; // error delayed by 1 clock - if eof was incorrect (because of earlier data error)
                               // let last data dword to pass through
    
    wire ll_link_reset = ~phy_ready;        // -> link  // oob sequence is reinitiated and link now is not established or rxelecidle //TODO Alexey:mb it shall be independent
    
    wire [DATA_BYTE_WIDTH*8 - 1:0] ph2ll_data_out;
    wire [DATA_BYTE_WIDTH   - 1:0] ph2ll_charisk_out; // charisk
    wire [DATA_BYTE_WIDTH   - 1:0] ph2ll_err_out;     // disperr | notintable
    wire [DATA_BYTE_WIDTH*8 - 1:0] ll2ph_data_in;
    wire [DATA_BYTE_WIDTH   - 1:0] ll2ph_charisk_in;  // charisk

    wire     [FIFO_ADDR_WIDTH-1:0] h2d_raddr;
    wire                     [1:0] h2d_fifo_re_regen;    
    wire     [FIFO_ADDR_WIDTH-1:0] h2d_waddr;
    wire       [FIFO_ADDR_WIDTH:0] h2d_fill;
    wire                           h2d_nempty;
    
    wire     [FIFO_ADDR_WIDTH-1:0] d2h_raddr;
    wire                     [1:0] d2h_fifo_re_regen;    
    wire     [FIFO_ADDR_WIDTH-1:0] d2h_waddr;
    wire       [FIFO_ADDR_WIDTH:0] d2h_fill;
    wire                           d2h_nempty;
    wire                           h2d_fifo_rd = h2d_nempty && ll_strobe_out; // TODO: check latency in link.v
//    wire                           h2d_fifo_wr = h2d_valid;
//2016.12.10
    wire                           h2d_fifo_wr = h2d_valid && h2d_ready; // or should valid depend on ready in the fis_transmit?
    
    wire                           d2h_fifo_rd = d2h_valid && d2h_ready;
    wire                           d2h_fifo_wr = ll_d2h_valid || fis_over_r; // fis_over_r will push FIS end to FIFO
    reg                            h2d_pending;    // HBA started sending FIS to fifo
    
    wire                           rxelsfull; 
    wire                           rxelsempty; 
    wire                           xclk;             // output receive clock, just to measure frequency
    
    wire debug_detected_alignp; // oob detects ALIGNp, but not the link layer
    wire                    [31:0] debug_phy0;
`ifdef USE_DATASCOPE
    wire [31:0]                    datascope0_di;
`endif    
assign ll_h2d_last =  (h2d_type_out == H2D_TYPE_FIS_LAST); 
assign d2h_valid = d2h_nempty;
assign d2h_many =  |d2h_fill[FIFO_ADDR_WIDTH:3]; // 

// assign h2d_ready = !h2d_fill[FIFO_ADDR_WIDTH] && !(&h2d_fill[FIFO_ADDR_WIDTH:3]);
// 2016:12:10 sometimes overflow happened because of a BUG 
`ifdef SIMULATION
    `ifdef CHECK_LOW_H2D_FIFO
        assign h2d_ready = !h2d_fill[FIFO_ADDR_WIDTH] && (h2d_fill < ((1 << BITS_TO_START_XMIT) + H2D_FIFO_THRESHOLD ));
    `else
        assign h2d_ready = !h2d_fill[FIFO_ADDR_WIDTH] && !(&h2d_fill[FIFO_ADDR_WIDTH-1:3]); // same as with synthesis
    `endif
`else
        assign h2d_ready = !h2d_fill[FIFO_ADDR_WIDTH] && !(&h2d_fill[FIFO_ADDR_WIDTH-1:3]);
`endif

assign ll_d2h_almost_full   = d2h_fill[FIFO_ADDR_WIDTH] || &d2h_fill[FIFO_ADDR_WIDTH-1:6]; // 63 dwords (maybe use :5?) - time to tell device to stop 

//    assign ll_frame_req_w = !ll_frame_busy && h2d_pending && (((h2d_type == H2D_TYPE_FIS_LAST) && h2d_fifo_wr ) || (|h2d_fill[FIFO_ADDR_WIDTH : BITS_TO_START_XMIT]));
// Separating different types of errors, sync_escape from other problems. TODO: route individual errors to set SERR bits
//assign  incom_invalidate = state_rcvr_eof & crc_bad & ~alignes_pair | state_rcvr_data   & dword_val &  rcvd_dword[CODE_WTRMP];
//    assign phy_speed = phy_ready ? PHY_SPEED:0;
//    assign serr_DB = phy_ready && (|ph2ll_err_out);
//    assign serr_DH = phy_ready && (xmit_err);
assign phy_speed = link_established ? PHY_SPEED:0;
assign serr_DB =   link_established && (|ph2ll_err_out);
assign serr_DH =   link_established && (xmit_err);
//

// not yet assigned errors
///    assign serr_DT = phy_ready && (comreset_send); // RWC: Transport state transition error
///    assign serr_DS = phy_ready && (cominit_got);   // RWC: Link sequence error
///    assign serr_DC = phy_ready && (serr_DW);       // RWC: CRC error in Link layer
assign serr_DT = phy_ready && (0); // RWC: Transport state transition error
//    assign serr_DS = phy_ready && (0);   // RWC: Link sequence error
//    assign serr_DC = phy_ready && (0);       // RWC: CRC error in Link layer
//    assign serr_DB = phy_ready && (0);   // RWC: 10B to 8B decode error
assign serr_EE = phy_ready && (rxelsfull || rxelsempty);
assign serr_DI = phy_ready && (0);   // rxelsfull);   // RWC: PHY Internal Error // just debugging
assign serr_EP = phy_ready && (0);   // rxelsempty);   // RWC: Protocol Error - a violation of SATA protocol detected // just debugging
assign serr_EC = phy_ready && (0);   // RWC: Persistent Communication or Data Integrity Error
assign serr_ET = phy_ready && (0);   // RWC: Transient Data Integrity Error (error not recovered by the interface)
assign serr_EM = phy_ready && (0);   // RWC: Communication between the device and host was lost but re-established
assign serr_EI = phy_ready && (0);   // RWC: Recovered Data integrity Error

reg [1:0] debug_last_d2h_type_in;
reg [1:0] debug_last_d2h_type;

always @ (posedge clk) begin
    if (d2h_fifo_wr) debug_last_d2h_type_in<= d2h_type_in;
    if (d2h_fifo_rd) debug_last_d2h_type<=    d2h_type;
end
assign debug_phy = debug_phy0; 
    
`ifdef USE_DATASCOPE
    `ifdef DATASCOPE_INCOMING_RAW
        assign datascope_di   = {5'b0,debug_link[5],datascope0_di[25:0]};// aligns_pair tx
    `else
        // Mix transmitted alignes pair, but only to the closest group of 6 primitives
        reg dbg_was_link5; // alignes pair sent
        wire dbg_was_link5_xclk; // alignes pair sent

        always @ (posedge datascope_clk) begin
            if (dbg_was_link5_xclk) dbg_was_link5 <= 1;
            else if (datascope_we)  dbg_was_link5 <= 0; 
        end        

        pulse_cross_clock #(
            .EXTRA_DLY(0)
        ) dbg_was_link5_i (
            .rst       (rst),                // input
            .src_clk   (clk),                // input
            .dst_clk   (datascope_clk),      // input
            .in_pulse  (debug_link[5]),      // input// is actually a two-cycle
            .out_pulse (dbg_was_link5_xclk), // output
            .busy()                          // output
        );

        assign datascope_di   = {dbg_was_link5,datascope0_di[30:0]};// aligns_pair tx
    `endif
`endif    
    link #(
        .DATA_BYTE_WIDTH(4)
    ) link (
        .rst              (rst),                   // input wire 
        .clk              (clk),                   // input wire 
    // data inputs from transport layer
        .data_in          (ll_h2d_data_in),        // input[31:0] wire // input data stream (if any data during OOB setting => ignored)
    // TODO, for now not supported, all mask bits are assumed to be set
        .data_mask_in     (ll_h2d_mask_in),        // input[1:0] wire 
        .data_strobe_out  (ll_strobe_out),         // output wire  // buffer read strobe
        .data_last_in     (ll_h2d_last),           // input wire // transaction's last data budle pulse
        .data_val_in      (h2d_nempty),            // input wire // read data is valid (if 0 while last pulse wasn't received => need to hold the line)
        
        .data_out         (ll_d2h_data_out),       // output[31:0] wire  // read data, same as related inputs
        .data_mask_out    (ll_d2h_mask_out),       // output[1:0] wire // same thing - all 1s for now. TODO
        .data_val_out     (ll_d2h_valid),          // output wire // count every data bundle read by transport layer, even if busy flag is set // let the transport layer handle oveflows by himself
        .data_busy_in     (ll_d2h_almost_full),    // input wire  // transport layer tells if its inner buffer is almost full
        .data_last_out    (),                      // ll_d2h_last),        // output wire not used
        
        .frame_req        (ll_frame_req),          // input wire  // request for a new frame transmission
        .frame_busy       (), // ll_frame_busy),   // output wire // a little bit of overkill with the cound of response signals, think of throwing out 1 of them // LL tells back if it cant handle the request for now
        .frame_ack        (ll_frame_ackn),         // ll_frame_ack), // output wire // LL tells if the request is transmitting
        .frame_rej        (x_rdy_collision),       // output wire // or if it was cancelled because of simultanious incoming transmission
        .frame_done_good  (xmit_ok),               // output wire // TL tell if the outcoming transaction is done and how it was done
        .frame_done_bad   (xmit_err),              // output wire 
        
        .incom_start      (ll_incom_start),        // output wire // if started an incoming transaction
        .incom_done       (ll_incom_done),         // output wire // if incoming transition was completed
        .incom_invalidate (ll_incom_invalidate),   // output wire // if incoming transition had errors
        .incom_sync_escape(syncesc_recv),          // output wire  - received sync escape
        .incom_ack_good   (send_R_OK),             // input wire  // transport layer responds on a completion of a FIS
        .incom_ack_bad    (send_R_ERR),            // input wire  // oob sequence is reinitiated and link now is not established or rxelecidle
        .link_reset       (ll_link_reset),         // input wire  // oob sequence is reinitiated and link now is not established or rxelecidle
        .sync_escape_req  (syncesc_send),          // input wire  // TL demands to brutally cancel current transaction
        .sync_escape_ack  (syncesc_send_done),     // output wire // acknowlegement of a successful reception?
        .incom_stop_req   (pcmd_st_cleared),       // input wire  // TL demands to stop current receiving session
        .link_established (link_established),      // output wire
        .link_bad_crc     (serr_DC),               // output wire // Bad CRC at EOF
        // inputs from phy
        .phy_ready        (phy_ready),             // input wire        // phy is ready - link is established
        // data-primitives stream from phy
        .phy_data_in      (ph2ll_data_out),        // input[31:0] wire  // phy_data_in
        .phy_isk_in       (ph2ll_charisk_out),     // input[3:0] wire   // charisk
        .phy_err_in       (ph2ll_err_out),         // input[3:0] wire   // disperr | notintable
        // to phy
        .phy_data_out     (ll2ph_data_in),         // output[31:0] wire 
        .phy_isk_out      (ll2ph_charisk_in),      // output[3:0] wire   // charisk
        .debug_is_data    (debug_is_data),         // output reg @clk (sata clk) - last symbol was data output
        .debug_dmatp      (debug_dmatp),           // output reg @clk (sata clk) - received CODE_DMATP
        .debug_out        (debug_link)
    );
    
    always @ (posedge clk) begin
        ll_incom_invalidate_r <=                       ll_incom_invalidate;
        // FIS receive D2H
        // add head if ll_d2h_valid and  (d2h_type_in == D2H_TYPE_OK) || (d2h_type_in == D2H_TYPE_ERR)? Or signal some internal error 
        if (rst || ll_incom_start)                     d2h_type_in <= D2H_TYPE_FIS_HEAD; // FIS head
        else if (ll_d2h_valid)                         d2h_type_in <= D2H_TYPE_DMA;          // FIS BODY
        else if (ll_incom_done || ll_incom_invalidate_r) d2h_type_in <= ll_incom_invalidate_r ? D2H_TYPE_ERR: D2H_TYPE_OK;
        
        if (rst) fis_over_r <= 0;
        else fis_over_r <= (ll_incom_done || ll_incom_invalidate_r) && (d2h_type_in == D2H_TYPE_DMA); // make sure it is only once
        // Second - generate internal error?
        
        // FIS transmit H2D
        // Start if all FIS is in FIFO (last word received) or at least that many is in FIFO
        if      (rst || ll_frame_req)                            h2d_pending <= 0; // ?
        else if ((h2d_type == H2D_TYPE_FIS_HEAD) && h2d_fifo_wr) h2d_pending <= 1;
        
        if (rst)                                                        ll_frame_req <= 0;
//        else     ll_frame_req <= ll_frame_req_w;
        else if (h2d_pending &&
                  (((h2d_type == H2D_TYPE_FIS_LAST) && h2d_fifo_wr ) ||
                   (|h2d_fill[FIFO_ADDR_WIDTH : BITS_TO_START_XMIT])))  ll_frame_req <= 1;
        else if (ll_frame_ackn)                                         ll_frame_req <= 0;          
        
        
    end


    sata_phy #(
`ifdef USE_DATASCOPE
        .ADDRESS_BITS        (ADDRESS_BITS),  // for datascope
        .DATASCOPE_START_BIT (DATASCOPE_START_BIT),
        .DATASCOPE_POST_MEAS (DATASCOPE_POST_MEAS),
`endif    
        .DATA_BYTE_WIDTH     (DATA_BYTE_WIDTH),
        .ELASTIC_DEPTH       (ELASTIC_DEPTH),
        .ELASTIC_OFFSET      (ELASTIC_OFFSET)
    ) phy (
        .extrst              (exrst),             // input wire 
        .clk                 (clk),               // output wire 
        .rst                 (rst),               // output wire 
        .reliable_clk        (reliable_clk),      // input wire 
        .phy_ready           (phy_ready),         // output wire 
        .gtx_ready           (gtx_ready),         // output wire 
        .debug_cnt           (), // output[11:0] wire 
        .extclk_p            (extclk_p),          // input wire 
        .extclk_n            (extclk_n),          // input wire 
        .txp_out             (txp_out),           // output wire 
        .txn_out             (txn_out),           // output wire 
        .rxp_in              (rxp_in),            // input wire 
        .rxn_in              (rxn_in),            // input wire 
        .ll_data_out         (ph2ll_data_out),    // output[31:0] wire 
        .ll_charisk_out      (ph2ll_charisk_out), // output[3:0] wire 
        .ll_err_out          (ph2ll_err_out),     // output[3:0] wire 
        .ll_data_in          (ll2ph_data_in),     // input[31:0] wire 
        .ll_charisk_in       (ll2ph_charisk_in),  // input[3:0] wire
        .set_offline         (set_offline),       // input
        .comreset_send       (comreset_send),     // input
        .cominit_got         (cominit_got),       // output wire 
        .comwake_got         (serr_DW),           // output wire 
        .rxelsfull           (rxelsfull),         // output wire 
        .rxelsempty          (rxelsempty),        // output wire 

        .cplllock_debug      (),
        .usrpll_locked_debug (),
        .re_aligned          (serr_DS),           // output reg 
        .xclk                (xclk),             // output receive clock, just to measure frequency

`ifdef USE_DATASCOPE
        .datascope_clk     (datascope_clk),     // output
        .datascope_waddr   (datascope_waddr),   // output[9:0] 
        .datascope_we      (datascope_we),      // output
        .datascope_di      (datascope0_di),      // output[31:0] 
        .datascope_trig    (ll_incom_invalidate ), // ll_frame_ackn),     // input datascope external trigger
//        .datascope_trig    (debug_link[4:0] == 'h0a), // state_send_eof // input datascope external trigger
///        .datascope_trig    (debug_link[4:0] == 'h02), // state_rcvr_goodcrc // input datascope external trigger
        //debug_link
`endif        

`ifdef USE_DRP
        .drp_rst           (drp_rst),           // input
        .drp_clk           (drp_clk),           // input
        .drp_en            (drp_en),            // input
        .drp_we            (drp_we),            // input
        .drp_addr          (drp_addr),          // input[14:0] 
        .drp_di            (drp_di),            // input[15:0] 
        .drp_rdy           (drp_rdy),           // output
        .drp_do            (drp_do),            // output[15:0] 
`endif 
        .debug_sata      (debug_phy0)  
        ,.debug_detected_alignp(debug_detected_alignp)
    );

    fifo_sameclock_control #(
        .WIDTH(9)
    ) fifo_h2d_control_i (
        .clk      (clk),                    // input
        .rst      (rst || pcmd_st_cleared), // input
        .wr       (h2d_fifo_wr),            // input
        .rd       (h2d_fifo_rd),            // input
        .nempty   (h2d_nempty),             // output
        .fill_in  (h2d_fill),               // output[9:0] 
        .mem_wa   (h2d_waddr),              // output[8:0] reg 
        .mem_ra   (h2d_raddr),              // output[8:0] reg 
        .mem_re   (h2d_fifo_re_regen[0]),   // output
        .mem_regen(h2d_fifo_re_regen[1]),   // output
        .over     (),                       // output reg 
        .under    () //h2d_under)               // output reg 
    );
    
    ram18p_var_w_var_r #(
        .REGISTERS    (1),
        .LOG2WIDTH_WR (5),
        .LOG2WIDTH_RD (5)
    ) fifo_h2d_i (
        .rclk     (clk),                                            // input
        .raddr    (h2d_raddr),                                      // input[8:0] 
        .ren      (h2d_fifo_re_regen[0]),                           // input
        .regen    (h2d_fifo_re_regen[1]),                           // input
        .data_out ({h2d_type_out, ll_h2d_mask_in, ll_h2d_data_in}), // output[35:0] 
        .wclk     (clk),                                            // input
        .waddr    (h2d_waddr),                                      // input[8:0] 
        .we       (h2d_fifo_wr),                                    // input
        .web      (4'hf),                                           // input[3:0] 
        .data_in  ({h2d_type,h2d_mask,h2d_data})                    // input[35:0] 
    );

    fifo_sameclock_control #(
        .WIDTH(9)
    ) fifo_d2h_control_i (
        .clk      (clk),                    // input
        .rst      (rst || pcmd_st_cleared), // input
        .wr       (d2h_fifo_wr),            // input
        .rd       (d2h_fifo_rd),            // input
        .nempty   (d2h_nempty),             // output
        .fill_in  (d2h_fill),               // output[9:0] 
        .mem_wa   (d2h_waddr),              // output[8:0] reg 
        .mem_ra   (d2h_raddr),              // output[8:0] reg 
        .mem_re   (d2h_fifo_re_regen[0]),   // output
        .mem_regen(d2h_fifo_re_regen[1]),   // output
        .over     (), //d2h_over),               // output reg 
        .under    ()                        // output reg 
    );

    ram18p_var_w_var_r #(
        .REGISTERS    (1),
        .LOG2WIDTH_WR (5),
        .LOG2WIDTH_RD (5)
    ) fifo_d2h_i (
        .rclk     (clk),                                            // input
        .raddr    (d2h_raddr),                                      // input[8:0] 
        .ren      (d2h_fifo_re_regen[0]),                           // input
        .regen    (d2h_fifo_re_regen[1]),                           // input
        .data_out ({d2h_type, d2h_mask, d2h_data}),                 // output[35:0] 
        .wclk     (clk),                                            // input
        .waddr    (d2h_waddr),                                      // input[8:0] 
        .we       (d2h_fifo_wr),                                    // input
        .web      (4'hf),                                           // input[3:0] 
        .data_in  ({d2h_type_in, ll_d2h_mask_out, ll_d2h_data_out}) // input[35:0] 
    );

    freq_meter #(
        .WIDTH    (FREQ_METER_WIDTH),
        .PRESCALE (1)
    ) freq_meter_i (
        .rst   (rst),        // input
        .clk   (clk),        // input
        .xclk  (xclk), // hclk), //xclk),       // input
        .dout  (xclk_period) // output[11:0] reg 
    );

endmodule

