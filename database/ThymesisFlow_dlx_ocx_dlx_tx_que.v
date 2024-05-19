// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
//------------------------------------------------------------------------
//--
//-- TITLE:    ocx_dlx_tx_que.v
//-- FUNCTION: Queues TS/Deskew data or flits to transmit on a per lane
//--           basis
//--
//------------------------------------------------------------------------

module ocx_dlx_tx_que (
    
     ctl_que_lane                         // -- <  input  [2:0]

    ,ctl_que_reset                        // -- <  input        // ---- run and valid need to be set to get clock gating to work when reset is active.
    ,ctl_que_stall                        // -- <  input        // ---- run and valid need to be set to get clock gating to work when reset is active.

    ,flt_que_data                        // -- <  input  [63:0]

    ,ctl_que_use_neighbor                 // -- <  input    
    ,neighbor_in_data                     // -- <  input  [63:0]
    ,neighbor_out_data                    // -- >  output [63:0]
 
    // ---- training signals
    ,ctl_que_tx_ts0                       // -- <  input     // ---- control header with all zero data.  
    ,ctl_que_tx_ts1                       // -- <  input    
    ,ctl_que_tx_ts2                       // -- <  input   
    ,ctl_que_tx_ts3                       // -- <  input   
    ,ctl_que_good_lanes                   // -- <  input  [15:0]
    ,ctl_que_deskew                       // -- <  input  [23:0]    
    ,ctl_que_lane_scrambler               // -- <  input  [63:0]

    ,que_gb_data                          // -- >  output [63:0]

  //--   ,gnd                                  // -- <> inout
  //--   ,vdn                                  // -- <> inout
    ,dlx_clk                             // -- <  input  
    );

    input  [2:0]  ctl_que_lane;

    input         ctl_que_reset;
    input         ctl_que_stall;

    input  [63:0] flt_que_data;

    output [63:0] que_gb_data;

    input         ctl_que_use_neighbor;
    input  [63:0] neighbor_in_data;
    output [63:0] neighbor_out_data;

    // ---- traing signals
    input         ctl_que_tx_ts0;
    input         ctl_que_tx_ts1;
    input         ctl_que_tx_ts2;
    input         ctl_que_tx_ts3;
    input [15:0]  ctl_que_good_lanes;   
    input [23:0]  ctl_que_deskew;
    input [63:0]  ctl_que_lane_scrambler;

    input dlx_clk;
//--     inout gnd;

//--     (* GROUND_PIN="1" *)
//--     wire gnd;

//--     inout vdn;
//--     (* POWER_PIN="1" *)
//--     wire vdn;

function [7:0] reverse8 (input [7:0] forward);
  integer i;
  for (i=0; i<=7; i=i+1)
    reverse8[7-i] = forward[i];
endfunction
// -- begin logic here
    wire [63:0]  dl_train_pattern;
    wire [63:0]  dl_train_pattern_rev;
    wire [63:0]  next_data;
    wire [4:0]   ts_count_din;
    reg  [4:0]   ts_count_q;
    wire         dl_training;
    wire         tp_deskew;  // -- training pattern of deskew

    assign ts_count_din[4:0]      = ctl_que_reset ? 5'b00000            :    //-- reset training count to zero when the link is reset
                                    ctl_que_stall ? ts_count_q[4:0]     :    //-- stall counter when gearbox needs to catch up
                                                    ts_count_q[4:0] + 5'b00001 ; 

    assign tp_deskew              = ts_count_q[4:0] == 5'b11111;   //-- send deskew pattern every 32 training set patterns

    assign dl_train_pattern[63:0] = tp_deskew        ? {40'h4B1E1E1E1E, ctl_que_deskew[23:5], 2'b00, ctl_que_lane[2:0]} :    // -- deskew pattern
                                    ctl_que_tx_ts1   ?  64'h4B4A4A4A4A4A4A4A                                           :    // -- TS1 pattern
                                    ctl_que_tx_ts2   ? {48'h4B4545454545, ctl_que_good_lanes[15:0]}                    :    // -- TS2 pattern
                                    ctl_que_tx_ts3   ? {48'h4B4141414141, ctl_que_good_lanes[15:0]}                    :    // -- TS3 pattern
                                                       64'h0000000000000000                                            ;

    assign dl_train_pattern_rev[63:0] = {dl_train_pattern[7:0]  ,dl_train_pattern[15:8] ,dl_train_pattern[23:16],dl_train_pattern[31:24],
                                         dl_train_pattern[39:32],dl_train_pattern[47:40],dl_train_pattern[55:48],dl_train_pattern[63:56]};

    assign next_data[63:0]        = dl_training            ?  dl_train_pattern_rev[63:0]   :      //-- training patterns
                                    ctl_que_use_neighbor   ?  neighbor_in_data[63:0]       :      //-- x4 degradation mode  -- steal from neighbors location
                                                              flt_que_data[63:0];

    assign dl_training            = ctl_que_tx_ts1 | ctl_que_tx_ts2 | ctl_que_tx_ts3 | ctl_que_tx_ts0;

    assign neighbor_out_data[63:0]  = flt_que_data[63:0];

    assign que_gb_data[63:0]      = {reverse8(next_data[ 7: 0]),
                                       reverse8(next_data[15: 8]),
                                       reverse8(next_data[23:16]),
                                       reverse8(next_data[31:24]),
                                       reverse8(next_data[39:32]),
                                       reverse8(next_data[47:40]),
                                       reverse8(next_data[55:48]),
                                       reverse8(next_data[63:56])} ^ ctl_que_lane_scrambler[63:0]; //-- reverse each byte and then scramble


always @(posedge (dlx_clk)) begin
   ts_count_q[4:0]    <= ts_count_din[4:0];
end

endmodule // -- ocx_dlx_tx_que
