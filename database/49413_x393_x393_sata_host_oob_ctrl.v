// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>oob_ctrl
 * @file oob_ctrl.v
 * @date  2015-07-11  
 * @author Alexey     
 *
 * @brief module to start oob sequences and to handle errors
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * oob_ctrl.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * oob_ctrl.v file is distributed in the hope that it will be useful,
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
//`include "oob.v"
module oob_ctrl #(
    parameter DATA_BYTE_WIDTH = 4,
    parameter CLK_SPEED_GRADE = 1 // 1 - 75 Mhz, 2 - 150Mhz, 4 - 300Mhz
)
(
    input  wire                           clk,            // input wire        // sata clk = usrclk2
    input  wire                           rst,            // input wire        // reset oob
    input  wire                           gtx_ready,      // input wire        // gtx is ready = all resets are done 
    output wire                    [11:0] debug,          // output[11:0] wire 
    input  wire                           rxcominitdet_in,// input wire        // oob responses
    input  wire                           rxcomwakedet_in,// input wire        // oob responses
    input  wire                           rxelecidle_in,  // input wire        // oob responses
    output wire                           txcominit,      // output wire       // oob issues
    output wire                           txcomwake,      // output wire       // oob issues
    output wire                           txelecidle,     // output wire       // oob issues
    output wire                           txpcsreset_req, // output wire       // partial tx reset
    input  wire                           recal_tx_done,  // input wire 
    output wire                           rxreset_req,    // output wire       // rx reset (after rxelecidle -> 0)
    input  wire                           rxreset_ack,    // input wire 
    // Andrey: adding new signal and state - after RX is operational try re-align clock
    output  wire                          clk_phase_align_req,                 // Request GTX to align SIPO parallel clock and user- provided RXUSRCLK
    input   wire                          clk_phase_align_ack,                 // GTX aligned clock phase (DEBUG - not always clear when it works or not)   
    
    input  wire [DATA_BYTE_WIDTH*8 - 1:0] txdata_in,      // output[31:0] wire // input data stream (if any data during OOB setting => ignored)
    input  wire   [DATA_BYTE_WIDTH - 1:0] txcharisk_in,   // output[3:0] wire  // input data stream (if any data during OOB setting => ignored)
    output wire [DATA_BYTE_WIDTH*8 - 1:0] txdata_out,     // output[31:0] wire // output data stream to gtx
    output wire   [DATA_BYTE_WIDTH - 1:0] txcharisk_out,  // output[3:0] wire  // output data stream to gtx
    input  wire [DATA_BYTE_WIDTH*8 - 1:0] rxdata_in,      // input[31:0] wire  // input data from gtx
    input  wire   [DATA_BYTE_WIDTH - 1:0] rxcharisk_in,   // input[3:0] wire   // input data from gtx
    output wire [DATA_BYTE_WIDTH*8 - 1:0] rxdata_out,     // output[31:0] wire // bypassed data from gtx
    output wire   [DATA_BYTE_WIDTH - 1:0] rxcharisk_out,  // output[3:0] wire  // bypassed data from gtx
    input  wire                           rxbyteisaligned,// input wire        // obvious
    output wire                           phy_ready,      // output wire       // shows if channel is ready
    input                                 set_offline,    // input wire        // electrically idle // From
    input                                 comreset_send,  // input wire        // Not possible yet? // From
    output reg                            re_aligned      // re-aligned after alignment loss
    ,output debug_detected_alignp
);

// oob sequence needs to be issued
wire    oob_start;
// connection established, all further data is valid
wire    oob_done;

// doc p265, link is established after 3back-to-back non-ALIGNp
wire    link_up;
wire    link_down;

// the device itself sends cominit
wire    cominit_req;
// allow to respond to cominit
wire    cominit_allow;

// status information to handle by a control block if any exists
// incompatible host-device speed grades (host cannot lock to alignp)
wire    oob_incompatible; // TODO
// timeout in an unexpected place
wire    oob_error;
// noone responds to our cominits
wire    oob_silence;
// obvious
wire    oob_busy;

// 1 - link is up and running, 0 - probably not
reg     link_state;
// 1 - connection is being established OR already established, 0 - is not
reg     oob_state;

// Andrey: Force offline from AHCI
reg             force_offline_r; // AHCI conrol need setting offline/sending comreset
always @ (posedge clk) begin
    if (rst || comreset_send) force_offline_r <= 0;
    else if (set_offline)     force_offline_r <= 1;
end


// Andrey: Make phy ready not go inactive during re-aligning
///assign  phy_ready = link_state & gtx_ready & rxbyteisaligned;
reg phy_ready_r;
reg was_aligned_r;
always @ (posedge clk) begin
    if (!(link_state & gtx_ready)) phy_ready_r <= 0;
    else if (rxbyteisaligned)     phy_ready_r <= 1;
    
    was_aligned_r <= rxbyteisaligned;
    
    re_aligned <= phy_ready_r && rxbyteisaligned && !was_aligned_r;
end
assign  phy_ready = phy_ready_r;

always @ (posedge clk)
    link_state  <= (link_state | link_up) & ~link_down & ~rst & ~force_offline_r; 

always @ (posedge clk)
    oob_state   <= (oob_state | oob_start | cominit_req & cominit_allow) & ~oob_error & ~oob_silence & ~(link_down & ~oob_busy & ~oob_start) & ~rst;

// decide when to issue oob: always when gtx is ready
//assign  oob_start = gtx_ready & ~oob_state & ~oob_busy;
assign  oob_start = gtx_ready & ~oob_state & ~oob_busy & ~force_offline_r;

// set line to idle state before if we're waiting for a device to answer AND while oob sequence
wire    txelecidle_inner;
//assign  txelecidle = /*~oob_state |*/ txelecidle_inner ;
assign  txelecidle = /*~oob_state |*/ txelecidle_inner || force_offline_r;

// let devices always begin oob sequence, if only it's not a glitch
assign  cominit_allow = cominit_req & link_state;

oob #(
    .DATA_BYTE_WIDTH    (DATA_BYTE_WIDTH),
    .CLK_SPEED_GRADE    (CLK_SPEED_GRADE)
)
oob
(
    .debug                (debug),           // output [11:0] reg
    .clk                  (clk),             // input wire  // sata clk = usrclk2
    .rst                  (rst),             // input wire  // reset oob
    .rxcominitdet_in      (rxcominitdet_in), // input wire  // oob responses
    .rxcomwakedet_in      (rxcomwakedet_in), // input wire  // oob responses
    .rxelecidle_in        (rxelecidle_in),   // input wire  // oob responses
    .txcominit            (txcominit),       // output wire // oob issues
    .txcomwake            (txcomwake),       // output wire // oob issues
    .txelecidle           (txelecidle_inner),// output wire // oob issues
    .txpcsreset_req       (txpcsreset_req),  // output wire
    .recal_tx_done        (recal_tx_done),   // input wire 
    .rxreset_req          (rxreset_req),     // output wire
    .rxreset_ack          (rxreset_ack),     // input wire 
    .clk_phase_align_req  (clk_phase_align_req), // output wire 
    .clk_phase_align_ack  (clk_phase_align_ack), // input wire 
    .txdata_in            (txdata_in),       // input [31:0] wire // input data stream (if any data during OOB setting => ignored)
    .txcharisk_in         (txcharisk_in),    // input [3:0] wire // input data stream (if any data during OOB setting => ignored)
    .txdata_out           (txdata_out),      // output [31:0] wire // output data stream to gtx
    .txcharisk_out        (txcharisk_out),   // output [3:0] wire// output data stream to gtx
    .rxdata_in            (rxdata_in),       // input [31:0] wire // input data from gtx
    .rxcharisk_in         (rxcharisk_in),    // input [3:0] wire // input data from gtx
    .rxdata_out           (rxdata_out),      // output [31:0] wire  // bypassed data from gtx
    .rxcharisk_out        (rxcharisk_out),   // output [3:0] wire // bypassed data from gtx
    .oob_start            (oob_start),       // input wire // oob sequence needs to be issued
    .oob_done             (oob_done),        // output wire // connection established, all further data is valid
    .oob_busy             (oob_busy),        // output wire // oob can't handle new start request
    .link_up              (link_up),         // output wire // doc p265, link is established after 3back-to-back non-ALIGNp
    .link_down            (link_down),       // output wire
    .cominit_req          (cominit_req),     // output wire // the device itself sends cominit
    .cominit_allow        (cominit_allow),   // input wire // allow to respond to cominit
                                             // status information to handle by a control block if any exists
    .oob_incompatible     (oob_incompatible),// output wire // incompatible host-device speed grades (host cannot lock to alignp)
    .oob_error            (oob_error),       // output wire // timeout in an unexpected place 
    .oob_silence          (oob_silence)      // output wire // noone responds to our cominits
    ,.debug_detected_alignp(debug_detected_alignp)
);


endmodule
