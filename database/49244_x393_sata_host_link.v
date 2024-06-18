// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>link
 * @file link.v
 * @date  2015-07-11  
 * @author Alexey     
 *
 * @brief sata link layer implementation
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * link.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * link.v file is distributed in the hope that it will be useful,
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
//`include "scrambler.v"
//`include "crc.v"
module link #(
    // 4 = dword. 4-bytes aligned data transfers TODO 2 = word - easy, 8 = qword - difficult
    parameter DATA_BYTE_WIDTH = 4,
`ifdef SIMULATION
//    parameter ALIGNES_PERIOD =  10 // period of sending ALIGNp pairs
    parameter ALIGNES_PERIOD =  100 // period of sending ALIGNp pairs
`else
    parameter ALIGNES_PERIOD =  252 // period of sending ALIGNp pairs
`endif    
)
(
    // TODO insert watchdogs
    input   wire    rst,
    input   wire    clk,

    // data inputs from transport layer
    // input data stream (if any data during OOB setting => ignored)
    input   wire    [DATA_BYTE_WIDTH*8 - 1:0] data_in,
    // in case of strange data aligments and size (1st mentioned @ doc, p.310, odd number of words case)
    // Actually, only last data bundle shall be masked, others are always valid.
    // Mask could be encoded into 3 bits instead of 4 for qword, but encoding+decoding aren't worth the bit
    
    input   wire    [DATA_BYTE_WIDTH/2 - 1:0] data_mask_in,  // TODO, for now not supported, all mask bits are assumed to be set
    output  wire    data_strobe_out,                         // buffer read strobe
    input   wire    data_last_in,                            // transaction's last data budle pulse
    input   wire    data_val_in,                             // read data is valid (if 0 while last pulse wasn't received => need to hold the line)
    // data outputs to transport layer
    output  wire    [DATA_BYTE_WIDTH*8 - 1:0] data_out,      // read data, same as related inputs
    output  wire    [DATA_BYTE_WIDTH/2 - 1:0] data_mask_out, // same thing - all 1s for now. TODO
    output  wire    data_val_out,                            // count every data bundle read by transport layer, even if busy flag is set
                                                             // let the transport layer handle oveflows by itself
    input   wire    data_busy_in,                            // transport layer tells if its inner buffer is almost full
    output  wire    data_last_out,
    input   wire    frame_req,                               // request for a new frame transition
// a little bit of overkill with the cound of response signals, think of throwing out 1 of them    
    output  wire    frame_busy,                              // LL tells back if it cant handle the request for now
    output  wire    frame_ack,                               // LL tells if the request is transmitting
    output  wire    frame_rej,                               // or if it was cancelled because of simultanious incoming transmission
    output  wire    frame_done_good,                         // Tell TL if the outcoming transaction is done and how it was done
    output  wire    frame_done_bad,
    output  wire    incom_start,                             // if started an incoming transaction
    output  wire    incom_done,                              // if incoming transition was completed
    output  wire    incom_invalidate,                        // if incoming transition had errors
    output  wire    incom_sync_escape,                       // particular type - got sync escape
    input   wire    incom_ack_good,                          // transport layer responds on a completion of a FIS
    input   wire    incom_ack_bad,                           // Reject frame even if it had good CRC (Bad will be responded automatically)
                                                             // It is OK to send extra incom_ack_bad from transport - it will be discarded
    input   wire    link_reset,                              // oob sequence is reinitiated and link now is not established or rxelecidle
    input   wire    sync_escape_req,                         // TL demands to brutally cancel current transaction
    output  wire    sync_escape_ack,                         // acknowlegement of a successful reception
    input   wire    incom_stop_req,                          // TL demands to stop current recieving session
    output          link_established,                        // received 3 back-to-back non-align primitives.
    output  reg     link_bad_crc,                            // got bad crc at EOF
    // inputs from phy
    input   wire    phy_ready,                               // phy is ready - link is established
    input   wire    [DATA_BYTE_WIDTH*8 - 1:0] phy_data_in,   // data-primitives stream from phy
    input   wire    [DATA_BYTE_WIDTH   - 1:0] phy_isk_in,    // charisk
    input   wire    [DATA_BYTE_WIDTH   - 1:0] phy_err_in,    // disperr | notintable
    // to phy
    output  wire    [DATA_BYTE_WIDTH*8 - 1:0] phy_data_out,
    output  wire    [DATA_BYTE_WIDTH   - 1:0] phy_isk_out,   // charisk
    output reg                                debug_is_data, // @clk (sata clk) - last symbol was data output
    output reg                                debug_dmatp,  // @clk (sata clk) - received CODE_DMATP
    // debug
    output                             [31:0] debug_out      //
);
`ifdef SIMULATION
    reg [639:0] HOST_LINK_TITLE; // to show human-readable state in the GTKWave
    reg  [31:0] HOST_LINK_DATA;
`endif

// latching data-primitives stream from phy
reg     [DATA_BYTE_WIDTH*8 - 1:0] phy_data_in_r;
reg     [DATA_BYTE_WIDTH   - 1:0] phy_isk_in_r; // charisk
reg     [DATA_BYTE_WIDTH   - 1:0] phy_err_in_r; // disperr | notintable
//one extra layer to process CONTp
reg     [DATA_BYTE_WIDTH*8 - 1:0] phy_data_in_r0;
reg     [DATA_BYTE_WIDTH   - 1:0] phy_isk_in_r0; // charisk
reg     [DATA_BYTE_WIDTH   - 1:0] phy_err_in_r0; // disperr | notintable

reg     [DATA_BYTE_WIDTH*8 - 1:0] last_not_cont_di; // last primitive dword, but not CONTp
reg                               rcv_junk;         // receiving CONTp junk data
wire                              is_non_cont_non_align_p_w;  // got primitive other than CONTp and ALIGNp (early by 1)
wire                              is_cont_p_w;                // got CONTp primitive  (early by 1)
wire                              is_align_p_w;               // got ALIGNp primitive  (early by 1)

//CONTp should pass ALIGNp

wire    frame_done;
// scrambled data
wire    [DATA_BYTE_WIDTH*8 - 1:0]   scrambler_out;
wire    dec_err; // doc, p.311 
// while receiving session shows crc check status
wire    crc_good;
wire    crc_bad;
// current crc
wire    [31:0] crc_dword;
// Removing - state_align is handled by OOB 
///reg                                link_established_r;                        // received 3 back-to-back non-align primitives.
///reg                          [1:0] non_align_cntr;                  
///assign link_established = link_established_r; 
assign link_established = phy_ready;
// send primitives variety count, including CRC and DATA as primitives
localparam  PRIM_NUM = 16; // 15;
wire    [PRIM_NUM - 1:0] rcvd_dword;    // shows current processing primitive (or just data dword)
wire                     dword_val;     // any valid primitive/data
wire                     dword_val_na;  // any valid primitive but ALIGNp
// list of bits of rcvd_dword
localparam  CODE_DATA   = 0;  // DATA
localparam  CODE_CRC    = 1;  // CRC
localparam  CODE_SYNCP  = 2;  // SYNCp
localparam  CODE_ALIGNP = 3;  // ALIGNp PHY layer control
localparam  CODE_XRDYP  = 4;  // X_RDYp Transmission data ready
localparam  CODE_SOFP   = 5;  // SOFp Start of Frame
localparam  CODE_HOLDAP = 6;  // HOLDAp HOLD acknowledge
localparam  CODE_HOLDP  = 7;  // HOLDp Hold data transmission
localparam  CODE_EOFP   = 8;  // EOFp End Of Frame
localparam  CODE_WTRMP  = 9;  // WTRMp Wait for frame termination
localparam  CODE_RRDYP  = 10; // R_RDYp Receiver ready
localparam  CODE_IPP    = 11; // R_IPp - Reception in progress
localparam  CODE_DMATP  = 12; // DMATp - DMA terminate
localparam  CODE_OKP    = 13; // R_OKp - Reception with no error
localparam  CODE_ERRP   = 14; // R_ERRp - Reception with Error
localparam  CODE_CONTP  = 15; // CONTp - Continue repeating

// processing CONTp/junk, delaying everything by 1 clock 
always @ (posedge clk) begin
    phy_data_in_r0   <= phy_data_in;
    phy_isk_in_r0    <= phy_isk_in;
    phy_err_in_r0    <= phy_err_in;
    
    if (is_non_cont_non_align_p_w) last_not_cont_di <= phy_data_in_r0; // last_not_cont_di - primitive to repeat instead of junk
    
    if (rst || is_non_cont_non_align_p_w) rcv_junk <= 0;
    else if (is_cont_p_w)                 rcv_junk <= 1;
    
    if (is_cont_p_w || (rcv_junk && !(is_non_cont_non_align_p_w || is_align_p_w))) begin
        phy_data_in_r   <= last_not_cont_di;  // last non-cont/non-align primitive will be sent instead of junk
        phy_isk_in_r    <= 1;                 // it was always primitive (4'b0001)
    end else begin
        phy_data_in_r   <= phy_data_in_r0;   // data and ALIGNp will go through
        phy_isk_in_r    <= phy_isk_in_r0;    // data and ALIGNp will go through
    end
    phy_err_in_r    <= phy_err_in_r0;
    
end
// When switching from state_rcvr_shold to state_rcvr_data we need to know that it will be data 1 cycle ahead
wire                     next_will_be_data = !(is_cont_p_w || (rcv_junk && !(is_non_cont_non_align_p_w || is_align_p_w))) && !(|phy_isk_in_r0);

reg                      data_txing_r; // if there are still some data to transmit and the transaction wasn't cancelled
wire                     data_txing = data_txing_r & ~state_send_crc;
// Make it safe
always @ (posedge clk) begin
    if (rst)                                    data_txing_r <= 0;
    else if (frame_req)                         data_txing_r <= 1;    
    else if (state_send_crc)                    data_txing_r <= 0;
end   


// states and transitions are taken from the doc, "Link Layer State Machine" chapter
// power mode states are not implemented. TODO insert them as an additional branch of fsm

// !!!IMPORTANT!!! If add/remove any states, dont forget to change this parameter value
localparam STATES_COUNT = 23;
// idle state
wire    state_idle;
reg     state_sync_esc;     // SyncEscape
reg     state_nocommerr;    // NoComErr
reg     state_nocomm;       // NoComm
reg     state_align;        // SendAlign - not used, handled by OOB
reg     state_reset;        // RESET
// tranmitter branch
reg     state_send_rdy;     // SendChkRdy
reg     state_send_sof;     // SendSOF
reg     state_send_data;    // SendData
reg     state_send_rhold;   // RcvrHold - hold initiated by current data reciever
reg     state_send_shold;   // SendHold - hold initiated by current data sender
reg     state_send_crc;     // SendCVC
reg     state_send_eof;     // SendEOF
reg     state_wait;         // Wait
// receiver branch
reg     state_rcvr_wait;    // RcvWaitFifo
reg     state_rcvr_rdy;     // RcvChkRdy
reg     state_rcvr_data;    // RcvData
reg     state_rcvr_rhold;   // Hold     - hold initiated by current data reciever
reg     state_rcvr_shold;   // RcvHold  - hold initiated by current data sender
reg     state_rcvr_eof;     // RcvEOF
reg     state_rcvr_goodcrc; // GoodCRC
reg     state_rcvr_goodend; // GoodEnd
reg     state_rcvr_badend;  // BadEnd

// handling single-cycle incom_ack_good/incom_ack_bad when they arrive at alignes_pair
reg     incom_ack_good_pend;
reg     incom_ack_bad_pend;
wire    incom_ack_good_or_pend = incom_ack_good || incom_ack_good_pend;
wire    incom_ack_bad_or_pend =  incom_ack_bad || incom_ack_bad_pend;


wire    set_sync_esc;
wire    set_nocommerr;
wire    set_nocomm;
wire    set_align;
wire    set_reset;
wire    set_send_rdy;
wire    set_send_sof;
wire    set_send_data;
wire    set_send_rhold;
wire    set_send_shold;
wire    set_send_crc;
wire    set_send_eof;
wire    set_wait;
wire    set_rcvr_wait;
wire    set_rcvr_rdy;
wire    set_rcvr_data;
wire    set_rcvr_rhold;
wire    set_rcvr_shold;
wire    set_rcvr_eof;
wire    set_rcvr_goodcrc;
wire    set_rcvr_goodend;
wire    set_rcvr_badend;
                            
wire    clr_sync_esc;
wire    clr_nocommerr;
wire    clr_nocomm;
wire    clr_align;
wire    clr_reset;
wire    clr_send_rdy;
wire    clr_send_sof;
wire    clr_send_data;
wire    clr_send_rhold;
wire    clr_send_shold;
wire    clr_send_crc;
wire    clr_send_eof;
wire    clr_wait;
wire    clr_rcvr_wait;
wire    clr_rcvr_rdy;
wire    clr_rcvr_data;
wire    clr_rcvr_rhold;
wire    clr_rcvr_shold;
wire    clr_rcvr_eof;
wire    clr_rcvr_goodcrc;
wire    clr_rcvr_goodend;
wire    clr_rcvr_badend;

assign state_idle = ~state_sync_esc
                  & ~state_nocommerr
                  & ~state_nocomm
                  & ~state_align
                  & ~state_reset
                  & ~state_send_rdy
                  & ~state_send_sof
                  & ~state_send_data
                  & ~state_send_rhold
                  & ~state_send_shold
                  & ~state_send_crc
                  & ~state_send_eof
                  & ~state_wait
                  & ~state_rcvr_wait
                  & ~state_rcvr_rdy
                  & ~state_rcvr_data
                  & ~state_rcvr_rhold
                  & ~state_rcvr_shold
                  & ~state_rcvr_eof
                  & ~state_rcvr_goodcrc
                  & ~state_rcvr_goodend
                  & ~state_rcvr_badend;

// got an escaping primitive = request to cancel the transmission
// may be 1 cycle, need to extend over alignes_pair
wire got_escape = dword_val & rcvd_dword[CODE_SYNCP]; // can wait over alignes pair
reg     sync_escape_req_r;  // ahci sends 1 single-clock pulse, it may hit alignes_pair
always @ (posedge clk) begin
    sync_escape_req_r <= alignes_pair && (sync_escape_req || sync_escape_req_r);
end

// escaping is done
assign  sync_escape_ack = state_sync_esc;


reg           alignes_pair;   // pauses every state go give a chance to insert 2 align primitives on a line at least every 256 dwords due to spec
reg     [8:0] alignes_timer;

reg    alignes_pair_0; // time for 1st align primitive

always @ (posedge clk) begin
    if (!phy_ready || select_prim[CODE_ALIGNP]) alignes_timer <= ALIGNES_PERIOD;
    else                                        alignes_timer <= alignes_timer -1;
    alignes_pair_0 <= alignes_timer == 0;
    alignes_pair <= phy_ready && ((alignes_timer == 0) || alignes_pair_0);
    
end

always @ (posedge clk) begin
    link_bad_crc <= state_rcvr_eof & crc_bad;
    
    if      (incom_ack_good)                             incom_ack_good_pend <= 1;
    else if (!state_rcvr_goodcrc)                        incom_ack_good_pend <= 0;
    
    if      (incom_ack_bad)                              incom_ack_bad_pend <= 1;
    else if (!state_rcvr_goodcrc)                        incom_ack_bad_pend <= 0; // didn't like it even with good crc
end

// Whole transitions table, literally from doc pages 311-328 (Andrey: now modified, may be not true)
assign  set_sync_esc        = sync_escape_req || sync_escape_req_r; // extended over alignes_pair
assign  set_nocommerr       = ~phy_ready & ~state_nocomm & ~state_reset;
assign  set_nocomm          = state_nocommerr;
assign  set_align  = 0;   // never, as this state is handled by OOB
assign  set_reset           = link_reset;

assign  set_send_rdy        = state_idle        & frame_req;

assign  set_send_sof        = state_send_rdy    & phy_ready  &                                dword_val      &  rcvd_dword[CODE_RRDYP];

assign  set_send_data       = state_send_sof    & phy_ready 
                            | state_send_rhold  & data_txing & ~dec_err &                     dword_val_na  & ~rcvd_dword[CODE_HOLDP] & ~rcvd_dword[CODE_SYNCP] & ~rcvd_dword[CODE_DMATP]
                            | state_send_shold  & data_txing &  data_val_in &                 dword_val_na  & ~rcvd_dword[CODE_HOLDP] & ~rcvd_dword[CODE_SYNCP];

assign  set_send_rhold      = state_send_data   & data_txing &  data_val_in & ~data_last_in & dword_val    &  rcvd_dword[CODE_HOLDP]
                            | state_send_shold  & data_txing &  data_val_in &                 dword_val    &  rcvd_dword[CODE_HOLDP];
                            
assign  set_send_shold      = state_send_data   & data_txing & ~data_val_in &                 dword_val    & ~rcvd_dword[CODE_SYNCP];

assign  set_send_crc        = state_send_data   & data_txing &  data_val_in &  data_last_in & dword_val    & ~rcvd_dword[CODE_SYNCP] 
                            | state_send_data   &                                             dword_val    &  rcvd_dword[CODE_DMATP];
                            
assign  set_send_eof        = state_send_crc    & phy_ready &                                 dword_val    & ~rcvd_dword[CODE_SYNCP];

assign  set_wait            = state_send_eof    & phy_ready &                                 dword_val    & ~rcvd_dword[CODE_SYNCP];

// receiver's branch
assign  set_rcvr_wait       = state_idle        & dword_val    &  rcvd_dword[CODE_XRDYP]
                            | state_send_rdy    & dword_val    &  rcvd_dword[CODE_XRDYP];
                            
assign  set_rcvr_rdy        = state_rcvr_wait   & dword_val    &  rcvd_dword[CODE_XRDYP]  & ~data_busy_in;

assign  set_rcvr_data       = state_rcvr_rdy    & dword_val    &  rcvd_dword[CODE_SOFP]
                            | state_rcvr_rhold  & next_will_be_data & ~data_busy_in
                            | state_rcvr_shold  & next_will_be_data  // So it will not be align
                            | state_rcvr_data   & next_will_be_data; // to skip over single-cycle CODE_HOLDP
//next_will_be_data                            
assign  set_rcvr_rhold      = state_rcvr_data   & dword_val    &  rcvd_dword[CODE_DATA]  &  data_busy_in;

assign  set_rcvr_shold      = state_rcvr_data   & dword_val    &  (rcvd_dword[CODE_HOLDP] & ~next_will_be_data)
                            | state_rcvr_rhold  & dword_val    &  (rcvd_dword[CODE_HOLDP] & ~next_will_be_data) & ~data_busy_in;
                            
assign  set_rcvr_eof        = state_rcvr_data   & dword_val    &  rcvd_dword[CODE_EOFP]
                            | state_rcvr_rhold  & dword_val    &  rcvd_dword[CODE_EOFP]
                            | state_rcvr_shold  & dword_val    &  rcvd_dword[CODE_EOFP];
                            
assign  set_rcvr_goodcrc    = state_rcvr_eof    & crc_good;

assign  set_rcvr_goodend    = state_rcvr_goodcrc& incom_ack_good_or_pend; // incom_ack_good; // may arrive at aligns_pair

assign  set_rcvr_badend     = state_rcvr_data   & dword_val    &  rcvd_dword[CODE_WTRMP]     // Missed EOF
                            | state_rcvr_eof    & crc_bad                                    // Got bad CRC
                            | state_rcvr_goodcrc& incom_ack_bad_or_pend; // incom_ack_bad;   // Transport didn't like it (may arrive at aligns_pair)

assign  clr_sync_esc        = set_nocommerr | set_reset                | dword_val & (rcvd_dword[CODE_RRDYP] | rcvd_dword[CODE_SYNCP]);
assign  clr_nocommerr       =                 set_reset                | set_nocomm;
assign  clr_nocomm          =                 set_reset                | set_align;
///assign  clr_align        = set_nocommerr | set_reset                | phy_ready;
///assign  clr_align           = set_nocommerr | set_reset                | link_established_r; // Not phy_ready !!!
assign  clr_align           = 0; // never - this state is handled in OOB
assign  clr_reset           =                                           ~link_reset;
///assign  clr_reset           =                                           set_align;
assign  clr_send_rdy        = set_nocommerr | set_reset | set_sync_esc | set_send_sof | set_rcvr_wait;
assign  clr_send_sof        = set_nocommerr | set_reset | set_sync_esc | set_send_data; // | got_escape;
assign  clr_send_data       = set_nocommerr | set_reset | set_sync_esc | set_send_rhold | set_send_shold | set_send_crc; // | got_escape;
assign  clr_send_rhold      = set_nocommerr | set_reset | set_sync_esc | set_send_data | set_send_crc; //  | got_escape;
assign  clr_send_shold      = set_nocommerr | set_reset | set_sync_esc | set_send_data | set_send_rhold | set_send_crc; //  | got_escape;
assign  clr_send_crc        = set_nocommerr | set_reset | set_sync_esc | set_send_eof; // | got_escape;
assign  clr_send_eof        = set_nocommerr | set_reset | set_sync_esc | set_wait; //  | got_escape;
assign  clr_wait            = set_nocommerr | set_reset | set_sync_esc | frame_done; // | got_escape;

assign  clr_rcvr_wait       = set_nocommerr | set_reset | set_sync_esc /*| set_rcvr_rdy */ | (dword_val_na & ~rcvd_dword[CODE_XRDYP]);
assign  clr_rcvr_rdy        = set_nocommerr | set_reset | set_sync_esc /*| set_rcvr_data */ | (dword_val_na & ~rcvd_dword[CODE_XRDYP] & ~rcvd_dword[CODE_SOFP]);
assign  clr_rcvr_data       = set_nocommerr | set_reset | set_sync_esc /*| set_rcvr_rhold | set_rcvr_shold | set_rcvr_eof */ | set_rcvr_badend; // | got_escape;
assign  clr_rcvr_rhold      = set_nocommerr | set_reset | set_sync_esc /*| set_rcvr_data | set_rcvr_eof | set_rcvr_shold */; //  | got_escape;
assign  clr_rcvr_shold      = set_nocommerr | set_reset | set_sync_esc /*| set_rcvr_data | set_rcvr_eof */; //  | got_escape;
assign  clr_rcvr_eof        = set_nocommerr | set_reset | set_sync_esc /*|set_rcvr_goodcrc | set_rcvr_badend*/;
assign  clr_rcvr_goodcrc    = set_nocommerr | set_reset | set_sync_esc /*set_rcvr_goodend | set_rcvr_badend |*/; // | got_escape;

assign  clr_rcvr_goodend    = set_nocommerr | set_reset | set_sync_esc; // | got_escape; // can be 1 cycle only
assign  clr_rcvr_badend     = set_nocommerr | set_reset | set_sync_esc; // | got_escape;

// the only truely asynchronous transaction between states is -> state_ reset. It shall not be delayed by sending alignes
// Luckily, while in that state, the line is off, so we dont need to care about merging alignes and state-bounded primitives
// Others transitions are straightforward
always @ (posedge clk)
begin
    state_sync_esc      <= (state_sync_esc     | set_sync_esc     & ~alignes_pair) & ~(clr_sync_esc & ~alignes_pair)                    & ~rst;
    state_nocommerr     <= (state_nocommerr    | set_nocommerr    & ~alignes_pair) & ~(clr_nocommerr & ~alignes_pair)                   & ~rst;
    state_nocomm        <= (state_nocomm       | set_nocomm       & ~alignes_pair) & ~(clr_nocomm & ~alignes_pair)                      & ~rst;
    // state_align is not used, it is handled by OOB
    state_align         <= (state_align        | set_align        & ~alignes_pair) & ~(clr_align & ~alignes_pair)                       & ~rst;
    state_reset         <= (state_reset        | set_reset                       ) & ~ clr_reset                                        & ~rst;
    state_send_rdy      <= (state_send_rdy     | set_send_rdy     & ~alignes_pair) & ~(clr_send_rdy & ~alignes_pair)                    & ~rst;
    state_send_sof      <= (state_send_sof     | set_send_sof     & ~alignes_pair) & ~(got_escape | (clr_send_sof & ~alignes_pair))     & ~rst;
    state_send_data     <= (state_send_data    | set_send_data    & ~alignes_pair) & ~(got_escape | (clr_send_data & ~alignes_pair))    & ~rst;
    state_send_rhold    <= (state_send_rhold   | set_send_rhold   & ~alignes_pair) & ~(got_escape | (clr_send_rhold & ~alignes_pair))   & ~rst;
    state_send_shold    <= (state_send_shold   | set_send_shold   & ~alignes_pair) & ~(got_escape | (clr_send_shold & ~alignes_pair))   & ~rst;
    state_send_crc      <= (state_send_crc     | set_send_crc     & ~alignes_pair) & ~(got_escape | (clr_send_crc & ~alignes_pair))     & ~rst;
    state_send_eof      <= (state_send_eof     | set_send_eof     & ~alignes_pair) & ~(got_escape | (clr_send_eof & ~alignes_pair))     & ~rst;
    state_wait          <= (state_wait         | set_wait         & ~alignes_pair) & ~(got_escape | (clr_wait & ~alignes_pair))         & ~rst;
    // Andrey: most receiver states can not wait for transmitting aligns_pair. What host sends in this states matters when confirmed by the device
    // So it seems OK if alignes_pair will just overwrite whatever host was going to send in these state.
    // Care should be taken only for transitions between these states and others (transmit) that need to wait for alignes_pair to finish
    // set_* are considered fast (no wait), clr_* - slow (to non-receive states), next opeartors use OR-ed "set_*" in immediate transitions
    // to other states, clr_* - to other states
    //    rdy->data, data->eof 
    state_rcvr_wait     <= (state_rcvr_wait    | (set_rcvr_wait    & ~alignes_pair)) & ~(set_rcvr_rdy |    (clr_rcvr_wait & ~alignes_pair))  & ~rst;

    state_rcvr_rdy      <= (state_rcvr_rdy     | set_rcvr_rdy                      ) & ~(set_rcvr_data |   (clr_rcvr_rdy  & ~alignes_pair))  & ~rst;
    
    state_rcvr_data     <= (state_rcvr_data    | set_rcvr_data                     ) & ~(set_rcvr_shold |
                                                                                         set_rcvr_shold |
                                                                                         set_rcvr_eof |
                                                                                         got_escape |      (clr_rcvr_data & ~alignes_pair))  & ~rst;
                                                                                         
    state_rcvr_rhold    <= (state_rcvr_rhold   | set_rcvr_rhold                   )  & ~(set_rcvr_data |
                                                                                         set_rcvr_shold |
                                                                                         set_rcvr_eof |
                                                                                         got_escape |      (clr_rcvr_rhold & ~alignes_pair)) & ~rst;
                                                                                         
    state_rcvr_shold    <= (state_rcvr_shold   | set_rcvr_shold                   )  & ~(set_rcvr_data |
                                                                                         set_rcvr_eof |
                                                                                         got_escape |      (clr_rcvr_shold & ~alignes_pair)) & ~rst;
                                                                                         
    state_rcvr_eof      <= (state_rcvr_eof     | set_rcvr_eof                     )  & ~(set_rcvr_goodcrc |
                                                                                         state_rcvr_badend |(clr_rcvr_eof & ~alignes_pair))  & ~rst;
    
    state_rcvr_goodcrc  <= (state_rcvr_goodcrc | set_rcvr_goodcrc                 )  & ~(set_rcvr_goodend |
                                                                                         set_rcvr_badend |
                                                                                         got_escape |      (clr_rcvr_goodcrc & ~alignes_pair)) & ~rst;
                                                                                         
    state_rcvr_goodend  <= (state_rcvr_goodend | set_rcvr_goodend                 ) & ~(got_escape |       (clr_rcvr_goodend & ~alignes_pair)) & ~rst;
    
    state_rcvr_badend   <= (state_rcvr_badend  | set_rcvr_badend                  ) & ~(got_escape |       (clr_rcvr_badend & ~alignes_pair))  & ~rst;

end

// flag if incoming request to terminate current transaction came from TL
reg     incom_stop_f;
always @ (posedge clk)
//    incom_stop_f <= rst | incom_done | ~frame_busy ? 1'b0 : incom_stop_req ? 1'b1 : incom_stop_f;
    if      (rst)                      incom_stop_f <= 0;
    else if (incom_stop_req)           incom_stop_f <= 1;
    else if (incom_done | ~frame_busy) incom_stop_f <= 0;
    

// form data to phy
reg     [DATA_BYTE_WIDTH*8 - 1:0] to_phy_data;
reg     [DATA_BYTE_WIDTH   - 1:0] to_phy_isk;
// TODO implement CONTP
localparam [15:0] PRIM_SYNCP_HI     = {3'd5, 5'd21, 3'd5, 5'd21};
localparam [15:0] PRIM_SYNCP_LO     = {3'd4, 5'd21, 3'd3, 5'd28};
localparam [15:0] PRIM_ALIGNP_HI	= {3'd3, 5'd27, 3'd2, 5'd10};
localparam [15:0] PRIM_ALIGNP_LO	= {3'd2, 5'd10, 3'd5, 5'd28};
localparam [15:0] PRIM_XRDYP_HI		= {3'd2, 5'd23, 3'd2, 5'd23};
localparam [15:0] PRIM_XRDYP_LO		= {3'd5, 5'd21, 3'd3, 5'd28};
localparam [15:0] PRIM_SOFP_HI		= {3'd1, 5'd23, 3'd1, 5'd23};
localparam [15:0] PRIM_SOFP_LO		= {3'd5, 5'd21, 3'd3, 5'd28};
localparam [15:0] PRIM_HOLDAP_HI	= {3'd4, 5'd21, 3'd4, 5'd21};
localparam [15:0] PRIM_HOLDAP_LO	= {3'd5, 5'd10, 3'd3, 5'd28};
localparam [15:0] PRIM_HOLDP_HI		= {3'd6, 5'd21, 3'd6, 5'd21};
localparam [15:0] PRIM_HOLDP_LO		= {3'd5, 5'd10, 3'd3, 5'd28};
localparam [15:0] PRIM_EOFP_HI		= {3'd6, 5'd21, 3'd6, 5'd21};
localparam [15:0] PRIM_EOFP_LO		= {3'd5, 5'd21, 3'd3, 5'd28};
localparam [15:0] PRIM_WTRMP_HI		= {3'd2, 5'd24, 3'd2, 5'd24};
localparam [15:0] PRIM_WTRMP_LO		= {3'd5, 5'd21, 3'd3, 5'd28};
localparam [15:0] PRIM_RRDYP_HI		= {3'd2, 5'd10, 3'd2, 5'd10};
localparam [15:0] PRIM_RRDYP_LO		= {3'd4, 5'd21, 3'd3, 5'd28};
localparam [15:0] PRIM_IPP_HI		= {3'd2, 5'd21, 3'd2, 5'd21};
localparam [15:0] PRIM_IPP_LO		= {3'd5, 5'd21, 3'd3, 5'd28};
localparam [15:0] PRIM_DMATP_HI		= {3'd1, 5'd22, 3'd1, 5'd22};
localparam [15:0] PRIM_DMATP_LO		= {3'd5, 5'd21, 3'd3, 5'd28};
localparam [15:0] PRIM_OKP_HI		= {3'd1, 5'd21, 3'd1, 5'd21};
localparam [15:0] PRIM_OKP_LO		= {3'd5, 5'd21, 3'd3, 5'd28};
localparam [15:0] PRIM_ERRP_HI		= {3'd2, 5'd22, 3'd2, 5'd22};
localparam [15:0] PRIM_ERRP_LO		= {3'd5, 5'd21, 3'd3, 5'd28};
//The transmission of CONTp is optional, but the ability to receive and properly process CONTp is required.
localparam [15:0] PRIM_CONTP_HI     = {3'd4, 5'd25, 3'd4, 5'd25};
localparam [15:0] PRIM_CONTP_LO     = {3'd5, 5'd10, 3'd3, 5'd28};


wire    [DATA_BYTE_WIDTH*8 - 1:0] prim_data [PRIM_NUM - 1:0];

// fill all possible output primitives to choose from them after
generate
if (DATA_BYTE_WIDTH == 2)
begin
    reg     prim_word; // word counter in a primitive TODO logic
    assign  prim_data[CODE_SYNCP] [15:0]    =  prim_word ? PRIM_SYNCP_HI    : PRIM_SYNCP_LO;
    assign  prim_data[CODE_ALIGNP][15:0]    =  prim_word ? PRIM_ALIGNP_HI   : PRIM_ALIGNP_LO;
    assign  prim_data[CODE_XRDYP] [15:0]    =  prim_word ? PRIM_XRDYP_HI    : PRIM_XRDYP_LO;
    assign  prim_data[CODE_SOFP]  [15:0]    =  prim_word ? PRIM_SOFP_HI     : PRIM_SOFP_LO;
    assign  prim_data[CODE_DATA]  [15:0]    =  scrambler_out[15:0];
    assign  prim_data[CODE_HOLDAP][15:0]    =  prim_word ? PRIM_HOLDAP_HI   : PRIM_HOLDAP_LO;
    assign  prim_data[CODE_HOLDP] [15:0]    =  prim_word ? PRIM_HOLDP_HI    : PRIM_HOLDP_LO;
    assign  prim_data[CODE_CRC]   [15:0]    =  scrambler_out[15:0];
    assign  prim_data[CODE_EOFP]  [15:0]    =  prim_word ? PRIM_EOFP_HI     : PRIM_EOFP_LO;
    assign  prim_data[CODE_WTRMP] [15:0]    =  prim_word ? PRIM_WTRMP_HI    : PRIM_WTRMP_LO;
    assign  prim_data[CODE_RRDYP] [15:0]    =  prim_word ? PRIM_RRDYP_HI    : PRIM_RRDYP_LO;
    assign  prim_data[CODE_IPP]   [15:0]    =  prim_word ? PRIM_IPP_HI      : PRIM_IPP_LO;
    assign  prim_data[CODE_DMATP] [15:0]    =  prim_word ? PRIM_DMATP_HI    : PRIM_DMATP_LO;
    assign  prim_data[CODE_OKP]   [15:0]    =  prim_word ? PRIM_OKP_HI      : PRIM_OKP_LO;
    assign  prim_data[CODE_ERRP]  [15:0]    =  prim_word ? PRIM_ERRP_HI     : PRIM_ERRP_LO;
    assign  prim_data[CODE_CONTP] [15:0]    =  prim_word ? PRIM_CONTP_HI    : PRIM_CONTP_LO;
    always @ (posedge clk)
    begin
        $display("%m: unsupported data width");
        $finish;
    end
end
else
if (DATA_BYTE_WIDTH == 4)
begin
    assign  prim_data[CODE_SYNCP]     = {PRIM_SYNCP_HI    , PRIM_SYNCP_LO};
    assign  prim_data[CODE_ALIGNP]    = {PRIM_ALIGNP_HI   , PRIM_ALIGNP_LO};
    assign  prim_data[CODE_XRDYP]     = {PRIM_XRDYP_HI    , PRIM_XRDYP_LO};
    assign  prim_data[CODE_SOFP]      = {PRIM_SOFP_HI     , PRIM_SOFP_LO};
    assign  prim_data[CODE_DATA]      = scrambler_out;
    assign  prim_data[CODE_HOLDAP]    = {PRIM_HOLDAP_HI   , PRIM_HOLDAP_LO};
    assign  prim_data[CODE_HOLDP]     = {PRIM_HOLDP_HI    , PRIM_HOLDP_LO};
    assign  prim_data[CODE_CRC]       = scrambler_out;
    assign  prim_data[CODE_EOFP]      = {PRIM_EOFP_HI     , PRIM_EOFP_LO};
    assign  prim_data[CODE_WTRMP]     = {PRIM_WTRMP_HI    , PRIM_WTRMP_LO};
    assign  prim_data[CODE_RRDYP]     = {PRIM_RRDYP_HI    , PRIM_RRDYP_LO};
    assign  prim_data[CODE_IPP]       = {PRIM_IPP_HI      , PRIM_IPP_LO};
    assign  prim_data[CODE_DMATP]     = {PRIM_DMATP_HI    , PRIM_DMATP_LO};
    assign  prim_data[CODE_OKP]       = {PRIM_OKP_HI      , PRIM_OKP_LO};
    assign  prim_data[CODE_ERRP]      = {PRIM_ERRP_HI     , PRIM_ERRP_LO};
    assign  prim_data[CODE_CONTP]     = {PRIM_CONTP_HI    , PRIM_CONTP_LO};
end
else
begin
    always @ (posedge clk)
    begin
        $display("%m: unsupported data width");
        $finish;
    end
end
endgenerate

always @ (posedge clk) begin
     debug_dmatp <= rcvd_dword[CODE_DMATP];
end

// select which primitive shall be sent 
wire    [PRIM_NUM - 1:0]    select_prim;
assign  select_prim[CODE_SYNCP]     = ~alignes_pair & (state_idle | state_sync_esc | state_rcvr_wait | state_reset);
assign  select_prim[CODE_ALIGNP]    =  alignes_pair | (state_nocomm | state_nocommerr | state_align);
assign  select_prim[CODE_XRDYP]     = ~alignes_pair & (state_send_rdy);
assign  select_prim[CODE_SOFP]      = ~alignes_pair & (state_send_sof);
assign  select_prim[CODE_DATA]      = ~alignes_pair & (state_send_data & ~set_send_shold); // if there's no data availible for a transmission, fsm still = state_send_data. Need to explicitly count this case.
assign  select_prim[CODE_HOLDAP]    = ~alignes_pair & (state_send_rhold | state_rcvr_shold & ~incom_stop_f);
assign  select_prim[CODE_HOLDP]     = ~alignes_pair & (state_send_shold | state_rcvr_rhold | state_send_data & set_send_shold); // the case mentioned 2 lines upper
assign  select_prim[CODE_CRC]       = ~alignes_pair & (state_send_crc);
assign  select_prim[CODE_EOFP]      = ~alignes_pair & (state_send_eof);
assign  select_prim[CODE_WTRMP]     = ~alignes_pair & (state_wait);
assign  select_prim[CODE_RRDYP]     = ~alignes_pair & (state_rcvr_rdy);
assign  select_prim[CODE_IPP]       = ~alignes_pair & (state_rcvr_data & ~incom_stop_f | state_rcvr_eof | state_rcvr_goodcrc);
assign  select_prim[CODE_DMATP]     = ~alignes_pair & (state_rcvr_data &  incom_stop_f | state_rcvr_shold & incom_stop_f);
assign  select_prim[CODE_OKP]       = ~alignes_pair & (state_rcvr_goodend);
assign  select_prim[CODE_ERRP]      = ~alignes_pair & (state_rcvr_badend);
// No sending of CONTp

// primitive selector MUX 
always @ (posedge clk)
    to_phy_data <=  rst ? {DATA_BYTE_WIDTH*8{1'b0}}: 
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_SYNCP]}}  & prim_data[CODE_SYNCP]  |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_ALIGNP]}} & prim_data[CODE_ALIGNP] |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_RRDYP]}}  & prim_data[CODE_RRDYP]  |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_SOFP]}}   & prim_data[CODE_SOFP]   |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_HOLDAP]}} & prim_data[CODE_HOLDAP] |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_HOLDP]}}  & prim_data[CODE_HOLDP]  |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_EOFP]}}   & prim_data[CODE_EOFP]   |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_WTRMP]}}  & prim_data[CODE_WTRMP]  |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_XRDYP]}}  & prim_data[CODE_XRDYP]  |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_IPP]}}    & prim_data[CODE_IPP]    |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_DMATP]}}  & prim_data[CODE_DMATP]  |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_OKP]}}    & prim_data[CODE_OKP]    |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_ERRP]}}   & prim_data[CODE_ERRP]   |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_CRC]}}    & prim_data[CODE_CRC]    |
                    {DATA_BYTE_WIDTH*8{select_prim[CODE_DATA]}}   & prim_data[CODE_DATA];

always @ (posedge clk)
    debug_is_data <=  select_prim[CODE_DATA];


always @ (posedge clk)
    to_phy_isk <= rst | ~select_prim[CODE_DATA] & ~select_prim[CODE_CRC] ? {{(DATA_BYTE_WIDTH - 1){1'b0}}, 1'b1} : {DATA_BYTE_WIDTH{1'b0}} ;

// incoming data is data
wire    inc_is_data;
assign  inc_is_data = dword_val & rcvd_dword[CODE_DATA] & (state_rcvr_data | state_rcvr_rhold);
//wire    inc_is_crc = dword_val_na & rcvd_dword[CODE_CRC] & (state_rcvr_data | state_rcvr_rhold);
/*
 * Scrambler can work both as a scrambler and a descramler, because data stream could be
 * one direction at a time
 */
scrambler scrambler(
    .rst        (select_prim[CODE_SOFP] | dword_val & rcvd_dword[CODE_SOFP]),
    .clk        (clk),
    .val_in     (select_prim[CODE_DATA] | inc_is_data | select_prim[CODE_CRC]),
    .data_in    (crc_dword & {DATA_BYTE_WIDTH*8{select_prim[CODE_CRC]}} | 
                 data_in & {DATA_BYTE_WIDTH*8{select_prim[CODE_DATA]}} | 
                 phy_data_in_r & {DATA_BYTE_WIDTH*8{inc_is_data}}),
    .data_out   (scrambler_out)
);

/*
 * Same as for scrambler, crc computation for both directions
 */
crc crc(
    .clk        (clk),
    .rst        (select_prim[CODE_SOFP] | dword_val & rcvd_dword[CODE_SOFP]),
    .val_in     (select_prim[CODE_DATA] | inc_is_data),
    .data_in    (data_in & {DATA_BYTE_WIDTH*8{select_prim[CODE_DATA]}} | scrambler_out & {DATA_BYTE_WIDTH*8{inc_is_data}}),
    .crc_out    (crc_dword)
);

// the output of crc module shall be 0 if 1 tick later reciever got a crc checksum and no errors occured
assign  crc_good = ~|crc_dword & state_rcvr_eof;
assign  crc_bad  =  |crc_dword & state_rcvr_eof;

// to TL data outputs assigment
// delay outputs so the last data would be marked
reg [31:0]  data_out_r;
reg         data_val_out_r;
reg [31:0]  data_out_rr;
reg         data_val_out_rr;
// if current == EOF => _r == CRC and _rr == last data piece
reg  data_held;   // some data is held in data_out_r over primitives - to be restored if not EOF
// no need to check for set_rcvr_eof - last dword will be always lost
always @ (posedge clk) begin
    if (dword_val & rcvd_dword[CODE_SOFP]) data_held <= 0;
    else if (inc_is_data)                  data_held <= 1;
    
    if (inc_is_data)                       data_out_r   <= scrambler_out;
    if (data_val_out_r)                    data_out_rr  <= data_out_r;
    
    data_val_out_r  <= inc_is_data;

    data_val_out_rr <= inc_is_data && data_held;
    
end


assign  data_out        = data_out_rr;
assign  data_mask_out   = 2'b11;//{DATA_BYTE_WIDTH/2{1'b1}};
assign  data_val_out    = data_val_out_rr;
assign  data_last_out   = set_rcvr_eof;

// from TL data
// gives a strobe everytime data is present and we're at a corresponding state.
assign  data_strobe_out = select_prim[CODE_DATA];

// Just to make output signals single-cycel regardless of alignes_pair and remove dependence on SM code
wire frame_rej_w;
wire incom_start_w;
wire incom_done_w;
wire incom_invalidate_w;

reg frame_rej_r;
reg incom_start_r;
reg incom_done_r;
reg incom_invalidate_r;

assign frame_rej =        frame_rej_w        && !frame_rej_r;
assign incom_start =      incom_start_w      && ! incom_start_r;
assign incom_done =       incom_done_w       && ! incom_done_r;
assign incom_invalidate = incom_invalidate_w && ! incom_invalidate_r;

always @ (posedge clk) begin
    frame_rej_r <=        frame_rej_w;
    incom_start_r <=      incom_start_w;
    incom_done_r <=       incom_done_w;
    incom_invalidate_r <= incom_invalidate_w;
end

// assign phy data outputs
assign  phy_data_out = to_phy_data;
assign  phy_isk_out  = to_phy_isk;

assign  frame_busy  = ~state_idle;
assign  frame_ack   = state_send_sof;
assign  frame_rej_w = set_rcvr_wait & state_send_rdy; //  & ~alignes_pair; // OK to mask with 

// incoming fises detected
assign  incom_start_w = set_rcvr_wait; //  & ~alignes_pair;
// ... and processed
assign  incom_done_w  = set_rcvr_goodcrc; // & ~alignes_pair;
// or the FIS had errors
// Separating different types of errors, sync_escape from other problems. TODO: route individual errors to set SERR bits
assign  incom_invalidate_w =  (state_rcvr_eof &  crc_bad) | // CRC mismatch
                              (state_rcvr_data & dword_val &  rcvd_dword[CODE_WTRMP]); // missed EOF?
assign  incom_sync_escape =   (state_rcvr_wait | state_rcvr_rdy | state_rcvr_data | state_rcvr_rhold |
                               state_rcvr_shold | state_rcvr_eof | state_rcvr_goodcrc) & got_escape;

// shows that incoming primitive or data is ready to be processed // TODO somehow move alignes_pair into dword_val_na

assign  dword_val =    |rcvd_dword & phy_ready;                            // any valid primitive/data
assign  dword_val_na = |rcvd_dword & phy_ready & ~rcvd_dword[CODE_ALIGNP]; // any valid primitive/data but ALIGNp
// determine imcoming primitive type
assign  rcvd_dword[CODE_DATA]	= ~|phy_isk_in_r;
assign  rcvd_dword[CODE_CRC]	= 1'b0;
assign  rcvd_dword[CODE_SYNCP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_SYNCP ] == phy_data_in_r);
assign  rcvd_dword[CODE_ALIGNP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_ALIGNP] == phy_data_in_r);
assign  rcvd_dword[CODE_XRDYP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_XRDYP ] == phy_data_in_r);
assign  rcvd_dword[CODE_SOFP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_SOFP  ] == phy_data_in_r);
assign  rcvd_dword[CODE_HOLDAP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_HOLDAP] == phy_data_in_r);
assign  rcvd_dword[CODE_HOLDP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_HOLDP ] == phy_data_in_r);
assign  rcvd_dword[CODE_EOFP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_EOFP  ] == phy_data_in_r);
assign  rcvd_dword[CODE_WTRMP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_WTRMP ] == phy_data_in_r);
assign  rcvd_dword[CODE_RRDYP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_RRDYP ] == phy_data_in_r);
assign  rcvd_dword[CODE_IPP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_IPP   ] == phy_data_in_r);
assign  rcvd_dword[CODE_DMATP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_DMATP ] == phy_data_in_r);
assign  rcvd_dword[CODE_OKP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_OKP   ] == phy_data_in_r);
assign  rcvd_dword[CODE_ERRP]	= phy_isk_in_r[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_ERRP  ] == phy_data_in_r);
// was missing
assign  rcvd_dword[CODE_CONTP]  = phy_isk_in_r[0] && ~(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_CONTP ] == phy_data_in_r);

// CONTp (*_r0 is one cycle ahead of *_r)
// Following is processed one cycle ahead of the others to replace CONTp junk with the replaced repeated primitives
assign is_cont_p_w =               phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_CONTP  ] == phy_data_in_r0);
assign is_align_p_w =              phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_ALIGNP ] == phy_data_in_r0);
assign is_non_cont_non_align_p_w = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_CONTP  ] != phy_data_in_r0)
                                                                                              && (prim_data[CODE_ALIGNP ] != phy_data_in_r0);


// phy level errors handling TODO
assign  dec_err = |phy_err_in_r;

// form a response to transport layer
assign  frame_done      = frame_done_good | frame_done_bad;
assign  frame_done_good = state_wait & dword_val & rcvd_dword[CODE_OKP];
assign  frame_done_bad  = state_wait & dword_val & rcvd_dword[CODE_ERRP];

// Handling 3 non-align primitives - removed, this is (should be) done by OOB

// =========== Debug code ===================
wire [PRIM_NUM - 1:0] rcvd_dword0; // at least oce received after reset

assign  rcvd_dword0[CODE_DATA]   = ~|phy_isk_in_r0;
assign  rcvd_dword0[CODE_CRC]    = 1'b0;
assign  rcvd_dword0[CODE_SYNCP]  = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_SYNCP ] == phy_data_in_r0);
assign  rcvd_dword0[CODE_ALIGNP] = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_ALIGNP] == phy_data_in_r0);
assign  rcvd_dword0[CODE_XRDYP]  = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_XRDYP ] == phy_data_in_r0);
assign  rcvd_dword0[CODE_SOFP]   = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_SOFP  ] == phy_data_in_r0);
assign  rcvd_dword0[CODE_HOLDAP] = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_HOLDAP] == phy_data_in_r0);
assign  rcvd_dword0[CODE_HOLDP]  = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_HOLDP ] == phy_data_in_r0);
assign  rcvd_dword0[CODE_EOFP]   = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_EOFP  ] == phy_data_in_r0);
assign  rcvd_dword0[CODE_WTRMP]  = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_WTRMP ] == phy_data_in_r0);
assign  rcvd_dword0[CODE_RRDYP]  = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_RRDYP ] == phy_data_in_r0);
assign  rcvd_dword0[CODE_IPP]    = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_IPP   ] == phy_data_in_r0);
assign  rcvd_dword0[CODE_DMATP]  = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_DMATP ] == phy_data_in_r0);
assign  rcvd_dword0[CODE_OKP]    = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_OKP   ] == phy_data_in_r0);
assign  rcvd_dword0[CODE_ERRP]   = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_ERRP  ] == phy_data_in_r0);
assign  rcvd_dword0[CODE_CONTP]  = phy_isk_in_r0[0] && !(|phy_isk_in_r0[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_CONTP ] == phy_data_in_r0);

reg [PRIM_NUM - 1:0] debug_rcvd_dword; // at least once received after reset
reg         debug_first_error;
reg         debug_first_alignp;
reg         debug_first_syncp;
reg         debug_first_nonsyncp;
reg         debug_first_unknown; 
reg  [19:0] debug_to_first_err;
reg  [15:0] debug_num_aligns;
reg  [15:0] debug_num_syncs;
reg  [15:0] debug_num_later_aligns;
reg         other_prim_r;
reg  [15:0] debug_num_other; // other primitives - not aligh, sync or cont
reg  [31:0] debug_unknown_dword; 
wire  debug_is_sync_p_w = phy_isk_in_r0[0] && !(|phy_isk_in_r[DATA_BYTE_WIDTH-1:1]) && (prim_data[CODE_SYNCP ] == phy_data_in_r0);

wire [STATES_COUNT - 1:0] debug_states_concat = {
                           state_idle
                         , state_sync_esc
                         , state_nocommerr
                         , state_nocomm
                         , state_align
                         , state_reset
                         , state_send_rdy
                         , state_send_sof
                         , state_send_data
                         , state_send_rhold
                         , state_send_shold
                         , state_send_crc
                         , state_send_eof
                         , state_wait
                         , state_rcvr_wait
                         , state_rcvr_rdy
                         , state_rcvr_data
                         , state_rcvr_rhold
                         , state_rcvr_shold
                         , state_rcvr_eof
                         , state_rcvr_goodcrc
                         , state_rcvr_goodend
                         , state_rcvr_badend
                         };
reg [4:0] debug_states_encoded;

reg [STATES_COUNT - 1:0] debug_states_visited;

always @ (posedge clk) begin
    other_prim_r <= is_non_cont_non_align_p_w && !debug_is_sync_p_w;

    if  (rst)                                              debug_first_alignp <= 0;
    else if (is_align_p_w)                                 debug_first_alignp <= 1;

    if  (rst)                                              debug_first_syncp <= 0;
    else if (debug_is_sync_p_w && debug_first_alignp)      debug_first_syncp <= 1;

    if  (rst)                                              debug_first_error <= 0;
    else if (dec_err && debug_first_syncp)                 debug_first_error <= 1;


    if  (rst)                                              debug_first_nonsyncp <= 0;
    else if (!debug_is_sync_p_w && debug_first_syncp)      debug_first_nonsyncp <= 1;
    
    if  (rst)                                              debug_first_unknown <= 0;
    else if ((rcvd_dword0 ==0) && debug_first_alignp)      debug_first_unknown <= 1;
    
    
    
    if  (rst)                                              debug_to_first_err <= 0;
    else if (debug_first_alignp && !debug_first_error)     debug_to_first_err <= debug_to_first_err + 1;
    
    if  (rst)                                              debug_num_aligns <= 0;
    else if (debug_first_alignp && !debug_first_syncp)     debug_num_aligns <= debug_num_aligns + 1;
    
    if  (rst)                                              debug_num_syncs <= 0;
    else if (debug_first_syncp && !debug_first_nonsyncp)   debug_num_syncs <= debug_num_syncs + 1;

    if  (rst)                                                              debug_num_later_aligns <= 0;
    else if (debug_first_nonsyncp && !debug_first_error && is_align_p_w)   debug_num_later_aligns <= debug_num_later_aligns + 1;

    if  (rst)                                                              debug_num_other <= 0;
    else if (debug_first_nonsyncp && !debug_first_error && other_prim_r)   debug_num_other <= debug_num_other + 1;
    
    if      (rst)                                                             debug_unknown_dword <= 0;
    else if ((rcvd_dword0 ==0) && debug_first_alignp && !debug_first_unknown) debug_unknown_dword <= phy_data_in_r0;
    
    if      (rst)                                                             debug_rcvd_dword <= 0;
    else if (debug_first_syncp                         && !debug_first_error) debug_rcvd_dword <= debug_rcvd_dword | rcvd_dword0;
    
    if (rst) debug_states_visited <= 0;
    else     debug_states_visited <= debug_states_visited | debug_states_concat;
    
    
    debug_states_encoded <= { |debug_states_concat[22:16],
                              |debug_states_concat[15: 8],
                             (|debug_states_concat[22:20]) | (|debug_states_concat[15:12]) | (|debug_states_concat[7:4]),
                             debug_states_concat[22] | (|debug_states_concat[19:18]) | (|debug_states_concat[15:14]) | 
                             (|debug_states_concat[11:10]) | (|debug_states_concat[7:6]) | (|debug_states_concat[3:2]),
                             debug_states_concat[21] |  debug_states_concat[19] | debug_states_concat[17] | debug_states_concat[15] |
                             debug_states_concat[13] |  debug_states_concat[11] | debug_states_concat[ 9] | debug_states_concat[7] |
                             debug_states_concat[ 5] |  debug_states_concat[ 3] | debug_states_concat[ 1]};
    
end


reg [1:0] debug_data_last_in_r;
reg [1:0] debug_alignes_pair_r;
reg [1:0] debug_state_send_data_r;
reg [1:0] debug_dword_val_na;
reg [1:0] debug_CODE_SYNCP;
reg [1:0] debug_set_send_crc;
reg [1:0] debug_data_val_in;
reg [1:0] debug_was_OK_ERR;
reg       debug_was_wait;
reg       debug_was_idle;
reg       debug_was_ok_err;
reg       debug_was_state_wait;
reg       debug_was_frame_done;
reg       debug_was_got_escape;
// frame_done | got_escape

always @(posedge clk) begin
    if (data_strobe_out) begin
        debug_data_last_in_r <= {debug_data_last_in_r[0],data_last_in};
        debug_alignes_pair_r <= {debug_alignes_pair_r[0],alignes_pair};
        debug_state_send_data_r <= {debug_state_send_data_r[0],state_send_data};
        debug_dword_val_na <= {debug_dword_val_na[0],dword_val_na};
        debug_CODE_SYNCP <= {debug_CODE_SYNCP[0],rcvd_dword[CODE_SYNCP]};
        debug_set_send_crc <= {debug_set_send_crc[0],set_send_crc};
        debug_data_val_in <= {debug_data_val_in[0],data_val_in};
    end
     
    debug_was_ok_err <= rcvd_dword[CODE_ERRP] | rcvd_dword[CODE_OKP];
    
    if (frame_req) debug_was_OK_ERR <= 0;
    else debug_was_OK_ERR <= debug_was_OK_ERR | {rcvd_dword[CODE_ERRP], rcvd_dword[CODE_OKP]};
    
    if (frame_req) debug_was_state_wait <= 0;
    else debug_was_state_wait <= debug_was_state_wait | state_wait;
    
    if (state_wait && clr_wait && !alignes_pair) debug_was_frame_done <= frame_done;

    if (state_wait && clr_wait && !alignes_pair) debug_was_got_escape <= got_escape;
    
    if ((rcvd_dword[CODE_ERRP] || rcvd_dword[CODE_OKP]) && !debug_was_ok_err) begin
        debug_was_wait <= state_wait;
        debug_was_idle <= state_idle;
    end
    
end

assign debug_out[ 4: 0]  =            debug_states_encoded;
assign debug_out[7: 5] =  {
                           rcvd_dword[CODE_SYNCP],
                           rcvd_dword[CODE_OKP],
                           alignes_pair};
assign debug_out[31]   =   rcvd_dword[CODE_ALIGNP];
assign debug_out[30]   =   set_send_sof;
assign debug_out[29]   =   clr_send_rdy;
assign debug_out[28]   =   state_send_rdy;
assign debug_out[27]   =   state_send_sof;
assign debug_out[26]   =   state_idle;
assign debug_out[25]   =   state_send_data;
assign debug_out[24]   =   (state_send_sof     | set_send_sof     & ~alignes_pair);
assign debug_out[23]   =   (clr_send_sof & ~alignes_pair);
assign debug_out[22]   =   set_rcvr_wait; // start logging input

//assign debug_out[15: 5] =            debug_to_first_err[14:4];
assign debug_out[21:16] =              debug_rcvd_dword[5:0];

assign debug_out[15: 8] = {
                           debug_was_wait,         // state was wait when last CODE_ERRP/CODE_OKP was received
                           debug_was_idle,         // state was idle when last CODE_ERRP/CODE_OKP was received
                           debug_was_OK_ERR[1:0],
                           debug_was_state_wait,
                           debug_was_frame_done,
                           debug_was_got_escape,
                           
/*                           debug_data_last_in_r[1],
                           debug_alignes_pair_r[1],
                           debug_state_send_data_r[1],
                           debug_state_send_data_r[0],
                           debug_data_val_in[1],
                           
                           debug_data_val_in[0],
                           debug_set_send_crc[1],
*/                           
//                           debug_dword_val_na[1],
                           ~debug_CODE_SYNCP[1]};

/*
    state_send_sof      <= (state_send_sof     | set_send_sof     & ~alignes_pair) & ~(clr_send_sof & ~alignes_pair)     & ~rst;



_send_crc        = state_send_data   & data_txing &  data_val_in &  data_last_in & dword_val_na & ~rcvd_dword[CODE_SYNCP]
                            | state_send_data   &                                             dword_val_na &  rcvd_dword[CODE_DMATP];

*/



//assign debug_out[STATES_COUNT - 1:0] = debug_states_visited;

/* 
//assign debug_out[PRIM_NUM - 1:0] = debug_rcvd_dword;
assign debug_out[ 7: 0] =          debug_rcvd_dword[7:0];
assign debug_out[15: 8] =          debug_alignes;
assign debug_out[23:16] =          debug_data_primitives;
assign debug_out[30:24] =          debug_notaligned_primitives[6:0]; // now count state_reset _/~
assign debug_out[31] =             debug_state_reset_r[0];
*/
`ifdef CHECKERS_ENABLED
// incoming primitives
always @ (posedge clk)
    if (~|rcvd_dword & phy_ready)
    begin
        $display("%m: invalid primitive received : %h, conrol : %h, err : %h", phy_data_in_r, phy_isk_in_r, phy_err_in_r);
        #500;
        $finish;
    end
// States checker
reg  [STATES_COUNT - 1:0] sim_states_concat;
always @ (posedge clk)
    if (~rst)
    if (( 32'h0
       + state_idle
       + state_sync_esc
       + state_nocommerr
       + state_nocomm
       + state_align
       + state_reset
       + state_send_rdy
       + state_send_sof
       + state_send_data
       + state_send_rhold
       + state_send_shold
       + state_send_crc
       + state_send_eof
       + state_wait
       + state_rcvr_wait
       + state_rcvr_rdy
       + state_rcvr_data
       + state_rcvr_rhold
       + state_rcvr_shold
       + state_rcvr_eof
       + state_rcvr_goodcrc
       + state_rcvr_goodend
       + state_rcvr_badend
       ) != 1)
    begin
        sim_states_concat = {
                           state_idle
                         , state_sync_esc
                         , state_nocommerr
                         , state_nocomm
                         , state_align
                         , state_reset
                         , state_send_rdy
                         , state_send_sof
                         , state_send_data
                         , state_send_rhold
                         , state_send_shold
                         , state_send_crc
                         , state_send_eof
                         , state_wait
                         , state_rcvr_wait
                         , state_rcvr_rdy
                         , state_rcvr_data
                         , state_rcvr_rhold
                         , state_rcvr_shold
                         , state_rcvr_eof
                         , state_rcvr_goodcrc
                         , state_rcvr_goodend
                         , state_rcvr_badend
                         };
        $display("%m: invalid states: %b", sim_states_concat);
//        $finish;
    end
`endif

`ifdef SIMULATION
integer sim_cnt;
always @ (posedge clk) begin
    if (incom_start) begin
        HOST_LINK_TITLE = "Incoming start";
        $display("[Host] LINK:        %s @%t", HOST_LINK_TITLE, $time);
        sim_cnt = 0;
    end
    if (data_val_out) begin
        HOST_LINK_TITLE = "From device - received data";
        HOST_LINK_DATA =  data_out;
        $display("[Host] LINK:        %s = %h (#%d)@%t", HOST_LINK_TITLE, HOST_LINK_DATA, sim_cnt, $time);
        sim_cnt = sim_cnt + 1;
    end
    if (incom_done) begin
        HOST_LINK_TITLE = "Incoming end";
        $display("[Host] LINK:        %s @%t", HOST_LINK_TITLE, $time);
        sim_cnt = 0;
    end
    if (incom_invalidate) begin
        HOST_LINK_TITLE = "Incoming invalidate";
        $display("[Host] LINK:        %s @%t", HOST_LINK_TITLE, $time);
        sim_cnt = 0;
    end
    if (incom_sync_escape) begin
        HOST_LINK_TITLE = "Incoming sync_escape";
        $display("[Host] LINK:        %s @%t", HOST_LINK_TITLE, $time);
        sim_cnt = 0;
    end
    if (incom_ack_good) begin
        HOST_LINK_TITLE = "Incoming ack_good";
        $display("[Host] LINK:        %s @%t", HOST_LINK_TITLE, $time);
        sim_cnt = 0;
    end
    if (incom_ack_bad) begin
        HOST_LINK_TITLE = "Incoming ack_bad";
        $display("[Host] LINK:        %s @%t", HOST_LINK_TITLE, $time);
        sim_cnt = 0;
    end
//    if (inc_is_data) begin
//        $display("[Host] LINK:        From device - received raw data = %h", phy_data_in);
//    end
end
    
`endif

endmodule
