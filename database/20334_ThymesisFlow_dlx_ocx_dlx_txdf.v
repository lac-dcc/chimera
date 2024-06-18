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
//-- TITLE:    ocx_dlx_txdf.v
//-- FUNCTION: TX side of OpenCAPI DLx
//--           
//------------------------------------------------------------------------
//-- (* PIN_DEFAULT_POWER_DOMAIN="VDN", PIN_DEFAULT_GROUND_DOMAIN="GND" *)
module ocx_dlx_txdf (

 dlx_tlx_init_flit_depth        // --  > output [2:0]
,dlx_tlx_flit_credit            // --  > output
,tlx_dlx_flit_valid             // --  < input
,tlx_dlx_flit                   // --  < input  [511:0]
,ro_dlx_version                 // --  > output [31:0]
//,tlx_dlx_flit_ecc               // --  < input  [63:0]


,dlx_l0_tx_data                // --  > output [63:0]
,dlx_l1_tx_data                // --  > output [63:0]
,dlx_l2_tx_data                // --  > output [63:0]
,dlx_l3_tx_data                // --  > output [63:0]
,dlx_l4_tx_data                // --  > output [63:0]
,dlx_l5_tx_data                // --  > output [63:0]
,dlx_l6_tx_data                // --  > output [63:0]
,dlx_l7_tx_data                // --  > output [63:0]
,dlx_l0_tx_header              // --  > output [1:0]
,dlx_l1_tx_header              // --  > output [1:0]
,dlx_l2_tx_header              // --  > output [1:0]
,dlx_l3_tx_header              // --  > output [1:0]
,dlx_l4_tx_header              // --  > output [1:0]
,dlx_l5_tx_header              // --  > output [1:0]
,dlx_l6_tx_header              // --  > output [1:0]
,dlx_l7_tx_header              // --  > output [1:0]
,dlx_l0_tx_seq                 // --  > output [5:0]
,dlx_l1_tx_seq                 // --  > output [5:0]
,dlx_l2_tx_seq                 // --  > output [5:0]
,dlx_l3_tx_seq                 // --  > output [5:0]
,dlx_l4_tx_seq                 // --  > output [5:0]
,dlx_l5_tx_seq                 // --  > output [5:0]
,dlx_l6_tx_seq                 // --  > output [5:0]
,dlx_l7_tx_seq                 // --  > output [5:0]

,pb_io_o0_rx_run_lane          // --  > output [7:0]
,io_pb_o0_rx_init_done         // --  < input  [7:0]

// -- ,tlx_dlx_stop_link             // -- < input

,tlx_dlx_debug_encode          // -- < input [3:0]
,tlx_dlx_debug_info            // -- < input [31:0]

//,rx_tx_train_failed            // --  < input  [7:0]
,rx_tx_tx_lane_swap            // --  < input
,rx_tx_crc_error               // --  < input
,rx_tx_retrain                 // --  < input
,rx_tx_nack                    // --  < input
,rx_tx_tx_ack_rtn              // --  < input  [4:0]
,rx_tx_rx_ack_inc              // --  < input  [3:0]
,rx_tx_tx_ack_ptr_vld          // --  < input
,rx_tx_tx_ack_ptr              // --  < input  [6:0]
,tx_rx_reset                   // --  > output
,train_ts2                     // --  > output
,train_ts67                    // --  > output
//,tx_rx_pattern_b_timer         // --  > output
,tx_rx_phy_training            // --  > output
,rx_tx_pattern_a               // --  < input  [7:0]
,rx_tx_pattern_b               // --  < input  [7:0]
,rx_tx_sync                    // --  < input  [7:0]
,rx_tx_TS1                     // --  < input  [7:0]
,rx_tx_TS2                     // --  < input  [7:0]
,rx_tx_TS3                     // --  < input  [7:0]
,rx_tx_block_lock              // --  < input  [7:0]
,rx_tx_lane_inverted           // --  < input  [7:0]

,cfg_transmit_order            // --  < input
,rx_tx_deskew_done             // --  < input
,rx_tx_linkup                  // --  < input
,ln0_rx_tx_last_byte_ts3       // --  < input  [7:0]
,ln1_rx_tx_last_byte_ts3       // --  < input  [7:0]
,ln2_rx_tx_last_byte_ts3       // --  < input  [7:0]
,ln3_rx_tx_last_byte_ts3       // --  < input  [7:0]
//,tx_rx_disabled_rx_lanes       // --  > output [7:0]

,dlx_reset                     // --  < input
,tx_rx_training                // --  > output
,tx_rx_disabled_rx_lanes       // --  > output [7:0]
,dlx_clk                       // --  < input             
                            
//-- ,gnd                           // -- <> inout             
//-- ,vdn                           // -- <> inout        
);

//!! Bugspray Include : ocx_dlx_txdf ;

// -- tlx interface
output [2:0]      dlx_tlx_init_flit_depth;
output            dlx_tlx_flit_credit;
input             tlx_dlx_flit_valid;
input  [511:0]    tlx_dlx_flit;
output [31:0]     ro_dlx_version;
//input  [63:0]     tlx_dlx_flit_ecc;


// -- Phy interface
output [63:0]     dlx_l0_tx_data;
output [63:0]     dlx_l1_tx_data;
output [63:0]     dlx_l2_tx_data;
output [63:0]     dlx_l3_tx_data;
output [63:0]     dlx_l4_tx_data;
output [63:0]     dlx_l5_tx_data;
output [63:0]     dlx_l6_tx_data;
output [63:0]     dlx_l7_tx_data;
output [1:0]      dlx_l0_tx_header;
output [1:0]      dlx_l1_tx_header;
output [1:0]      dlx_l2_tx_header;
output [1:0]      dlx_l3_tx_header;
output [1:0]      dlx_l4_tx_header;
output [1:0]      dlx_l5_tx_header;
output [1:0]      dlx_l6_tx_header;
output [1:0]      dlx_l7_tx_header;
output [5:0]      dlx_l0_tx_seq;
output [5:0]      dlx_l1_tx_seq;
output [5:0]      dlx_l2_tx_seq;
output [5:0]      dlx_l3_tx_seq;
output [5:0]      dlx_l4_tx_seq;
output [5:0]      dlx_l5_tx_seq;
output [5:0]      dlx_l6_tx_seq;
output [5:0]      dlx_l7_tx_seq;

// -- PHY init interface
output [7:0]      pb_io_o0_rx_run_lane;
input  [7:0]      io_pb_o0_rx_init_done;

//  -- error and debug information
// -- input             tlx_dlx_stop_link;

input  [3:0]      tlx_dlx_debug_encode;
input  [31:0]     tlx_dlx_debug_info;

// -- rx to tx signals
//input  [7:0]      rx_tx_train_failed;
input             rx_tx_tx_lane_swap;
input             rx_tx_crc_error;
input             rx_tx_retrain;
input             rx_tx_nack;
input  [4:0]      rx_tx_tx_ack_rtn;
input  [3:0]      rx_tx_rx_ack_inc;
input             rx_tx_tx_ack_ptr_vld;
input  [6:0]      rx_tx_tx_ack_ptr;
output            tx_rx_reset;
output            train_ts2;
output            train_ts67;
input             cfg_transmit_order;
//output            tx_rx_pattern_b_timer;
//reg               tx_rx_pattern_b_timer;
output            tx_rx_phy_training;
input [7:0]            ln0_rx_tx_last_byte_ts3;  
input [7:0]            ln1_rx_tx_last_byte_ts3;     
input [7:0]            ln2_rx_tx_last_byte_ts3;  
input [7:0]            ln3_rx_tx_last_byte_ts3;     
output [7:0]           tx_rx_disabled_rx_lanes;   
// -- receiving one bit per lane
input  [7:0]      rx_tx_pattern_a;
input  [7:0]      rx_tx_pattern_b;
input  [7:0]      rx_tx_sync;
input  [7:0]      rx_tx_TS1;
input  [7:0]      rx_tx_TS2;
input  [7:0]      rx_tx_TS3;
input  [7:0]      rx_tx_block_lock;
input  [7:0]      rx_tx_lane_inverted;

input             rx_tx_deskew_done;
input             rx_tx_linkup;
input             dlx_reset;
output            tx_rx_training;
//output [7:0]      tx_rx_disabled_rx_lanes;
input             dlx_clk;

//-- inout gnd;
//-- (* GROUND_PIN="1" *)
//-- wire gnd;

//-- inout vdn;
//-- (* POWER_PIN="1" *)
//-- wire vdn;  

//wire [2:0]      ctl_que_lane;
wire            pulse_1us;
wire            error_no_fwd_progress;
wire            ctl_que_reset;
wire            ctl_que_stall;
wire            ctl_flt_train_done;        
wire            ctl_flt_stall;       
wire [511:0]    flt_que_data;
wire            ctl_que_use_nghbr_even;
wire            ctl_que_use_nghbr_odd;
wire [63:0]     q0_neighbor_data;
wire [63:0]     q1_neighbor_data;
wire [63:0]     q2_neighbor_data;
wire [63:0]     q3_neighbor_data;
wire [63:0]     q4_neighbor_data;
wire [63:0]     q5_neighbor_data;
wire [63:0]     q6_neighbor_data;
wire [63:0]     q7_neighbor_data;
wire            ctl_que_tx_ts0;
wire            ctl_que_tx_ts1;
wire            ctl_que_tx_ts2;
wire            ctl_que_tx_ts3;
wire [15:0]     ctl_que_good_lanes;
wire [23:0]     ctl_que_deskew;
wire [63:0]     ctl_q0_lane_scrambler;
wire [63:0]     ctl_q1_lane_scrambler;
wire [63:0]     ctl_q2_lane_scrambler;
wire [63:0]     ctl_q3_lane_scrambler;
wire [63:0]     ctl_q4_lane_scrambler;
wire [63:0]     ctl_q5_lane_scrambler;
wire [63:0]     ctl_q6_lane_scrambler;
wire [63:0]     ctl_q7_lane_scrambler;
wire [63:0]     q0_gb0_data;
wire [63:0]     q1_gb1_data;
wire [63:0]     q2_gb2_data;
wire [63:0]     q3_gb3_data;
wire [63:0]     q4_gb4_data;
wire [63:0]     q5_gb5_data;
wire [63:0]     q6_gb6_data;
wire [63:0]     q7_gb7_data;
wire            orx_otx_train_failed;
wire            ctl_gb_train;
wire            ctl_gb_reset;
wire [6:0]      ctl_gb_seq;
wire            ctl_gb_tx_a_pattern;
wire            ctl_gb_tx_b_pattern;
wire            ctl_gb_tx_sync_pattern;
wire [7:0]      ctl_gb_tx_zeros;
wire            ctl_x4_not_x8_tx_mode;

assign orx_otx_train_failed = 1'b0;
  
ocx_dlx_tx_ctl ctl (    
//     .rx_tx_train_failed                   (rx_tx_train_failed)         // --  < input  [7:0]
     .rx_tx_tx_lane_swap                   (rx_tx_tx_lane_swap)         // --  < input
    ,.rx_tx_retrain                        (rx_tx_retrain)              // --  < input
    ,.rx_tx_crc_error                      (rx_tx_crc_error)            // --  < input
    ,.rx_tx_nack                           (rx_tx_nack)                 // --  < input
    ,.rx_tx_pattern_a                      (rx_tx_pattern_a)            // --  < input  [7:0]
    ,.rx_tx_pattern_b                      (rx_tx_pattern_b)            // --  < input  [7:0]
    ,.rx_tx_sync                           (rx_tx_sync)                 // --  < input  [7:0]
    ,.rx_tx_TS1                            (rx_tx_TS1)                  // --  < input  [7:0]
    ,.rx_tx_TS2                            (rx_tx_TS2)                  // --  < input  [7:0]
    ,.rx_tx_TS3                            (rx_tx_TS3)                  // --  < input  [7:0]
    ,.rx_tx_block_lock                     (rx_tx_block_lock)           // --  < input  [7:0]
    ,.io_pb_o0_rx_init_done                (io_pb_o0_rx_init_done)      // --  < input  [7:0]
    ,.rx_tx_deskew_done                    (rx_tx_deskew_done)          // --  < input
    ,.rx_tx_linkup                         (rx_tx_linkup)               // --  < input
    ,.ln0_rx_tx_last_byte_ts3              (ln0_rx_tx_last_byte_ts3)    // --  < input  [7:0]
    ,.ln1_rx_tx_last_byte_ts3              (ln1_rx_tx_last_byte_ts3)    // --  < input  [7:0]
    ,.ln2_rx_tx_last_byte_ts3              (ln2_rx_tx_last_byte_ts3)    // --  < input  [7:0]
    ,.ln3_rx_tx_last_byte_ts3              (ln3_rx_tx_last_byte_ts3)    // --  < input  [7:0]
    ,.tx_rx_disabled_rx_lanes              (tx_rx_disabled_rx_lanes)    // --  > output [7:0]
    ,.ctl_x4_not_x8_tx_mode                (ctl_x4_not_x8_tx_mode)      // --  > output
    ,.dlx_reset                            (dlx_reset)                  // --  < input
    ,.ctl_que_reset                        (ctl_que_reset)              // -- >  output
    ,.train_ts2                            (train_ts2)                  // -- >  output
    ,.train_ts67                           (train_ts67)                 // -- >  output
    ,.pulse_1us                            (pulse_1us)                  // -- >  output
    ,.error_no_fwd_progress                (error_no_fwd_progress)      // -- <  input
    ,.tx_rx_phy_training                   (tx_rx_phy_training)         // -- >  output
    ,.tx_rx_training                       (tx_rx_training)             // -- >  output
    ,.ctl_flt_train_done                   (ctl_flt_train_done)         // -- >  output 
    ,.ctl_flt_stall                        (ctl_flt_stall)              // -- >  output 
    ,.ctl_que_stall                        (ctl_que_stall)              // -- >  output
    ,.ctl_que_use_nghbr_even               (ctl_que_use_nghbr_even)     // -- >  output
    ,.ctl_que_use_nghbr_odd                (ctl_que_use_nghbr_odd)      // -- >  output
    ,.ctl_gb_tx_a_pattern                  (ctl_gb_tx_a_pattern)        // -- >  output
    ,.ctl_gb_tx_b_pattern                  (ctl_gb_tx_b_pattern)        // -- >  output
    ,.ctl_gb_tx_sync_pattern               (ctl_gb_tx_sync_pattern)     // -- >  output
    ,.ctl_gb_tx_zeros                      (ctl_gb_tx_zeros)            // -- >  output  [7:0]
    ,.ctl_que_tx_ts0                       (ctl_que_tx_ts0)             // -- >  output
    ,.ctl_que_tx_ts1                       (ctl_que_tx_ts1)             // -- >  output
    ,.ctl_que_tx_ts2                       (ctl_que_tx_ts2)             // -- >  output
    ,.ctl_que_tx_ts3                       (ctl_que_tx_ts3)             // -- >  output
    ,.ctl_que_good_lanes                   (ctl_que_good_lanes)         // -- >  output [15:0]
    ,.ctl_que_deskew                       (ctl_que_deskew)             // -- >  output [23:0]
    ,.ctl_gb_train                         (ctl_gb_train)               // -- >  output
    ,.ctl_gb_reset                         (ctl_gb_reset)               // -- >  output
    ,.ctl_gb_seq                           (ctl_gb_seq)                 // -- >  output [6:0]
    ,.ctl_q0_lane_scrambler                (ctl_q0_lane_scrambler)      // -- >  output [63:0]
    ,.ctl_q1_lane_scrambler                (ctl_q1_lane_scrambler)      // -- >  output [63:0]
    ,.ctl_q2_lane_scrambler                (ctl_q2_lane_scrambler)      // -- >  output [63:0]
    ,.ctl_q3_lane_scrambler                (ctl_q3_lane_scrambler)      // -- >  output [63:0]
    ,.ctl_q4_lane_scrambler                (ctl_q4_lane_scrambler)      // -- >  output [63:0]
    ,.ctl_q5_lane_scrambler                (ctl_q5_lane_scrambler)      // -- >  output [63:0]
    ,.ctl_q6_lane_scrambler                (ctl_q6_lane_scrambler)      // -- >  output [63:0]
    ,.ctl_q7_lane_scrambler                (ctl_q7_lane_scrambler)      // -- >  output [63:0]
    ,.pb_io_o0_rx_run_lane                 (pb_io_o0_rx_run_lane)       // -- >  output  [7:0]
    ,.ro_dlx_version                       (ro_dlx_version)             // -- >  output [31:0]
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_flt flt (
     .tlx_dlx_debug_encode                 (tlx_dlx_debug_encode)       // -- < input [3:0]
    ,.tlx_dlx_debug_info                   (tlx_dlx_debug_info)         // -- < input [31:0]
    ,.dlx_reset                            (dlx_reset)                  // -- < input
    ,.rx_tx_sync                           (rx_tx_sync)                 // -- < input  [7:0]
    ,.rx_tx_lane_inverted                  (rx_tx_lane_inverted)        // -- < input  [7:0]
    ,.pulse_1us                            (pulse_1us)                  // -- < input
    ,.error_no_fwd_progress                (error_no_fwd_progress)      // -- > output
    ,.ctl_flt_train_done                   (ctl_flt_train_done)         // -- < input 
    ,.ctl_flt_stall                        (ctl_flt_stall)              // -- < input 
    ,.dlx_tlx_init_flit_depth              (dlx_tlx_init_flit_depth)    // --  > output [2:0]
    ,.dlx_tlx_flit_credit                  (dlx_tlx_flit_credit)        // --  > output
    ,.tlx_dlx_flit_valid                   (tlx_dlx_flit_valid)         // -- <  input
    ,.tlx_dlx_flit                         (tlx_dlx_flit)               // -- <  input  [511:0]
    ,.cfg_transmit_order                   (cfg_transmit_order)         // --  < input
    ,.rx_tx_crc_error                      (rx_tx_crc_error)            // -- <  input
    ,.rx_tx_nack                           (rx_tx_nack)                 // -- <  input
    ,.rx_tx_rx_ack_inc                     (rx_tx_rx_ack_inc)           // -- <  input  [3:0]
    ,.rx_tx_tx_ack_rtn                     (rx_tx_tx_ack_rtn)           // -- <  input  [4:0]
    ,.rx_tx_tx_ack_ptr_vld                 (rx_tx_tx_ack_ptr_vld)       // -- <  input
    ,.rx_tx_tx_ack_ptr                     (rx_tx_tx_ack_ptr)           // -- <  input  [6:0]
    ,.tx_rx_reset                          (tx_rx_reset)                // --  > output
    ,.flt_que_data                         (flt_que_data[511:0])        // --  > output [511:0] 
    ,.ctl_x4_not_x8_tx_mode                (ctl_x4_not_x8_tx_mode)      // -- <  input
    ,.ctl_que_tx_ts2                       (ctl_que_tx_ts2)             // -- <  input TSM=5
 //--    ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  std_ulogic
    );

ocx_dlx_tx_que q0 (    
     .ctl_que_lane                         (3'b000)                     // -- <  input  [2:0]
    ,.ctl_que_reset                        (ctl_que_reset)              // -- <  input
    ,.ctl_que_stall                        (ctl_que_stall)              // -- <  input
    ,.flt_que_data                         (flt_que_data[63:0])         // -- <  input  [63:0]
    ,.ctl_que_use_neighbor                 (ctl_que_use_nghbr_even)     // -- <  input    
    ,.neighbor_in_data                     (q1_neighbor_data)           // -- <  input  [63:0]
    ,.neighbor_out_data                    (q0_neighbor_data)           // -- >  output [63:0]
    ,.ctl_que_tx_ts0                       (ctl_que_tx_ts0)             // -- <  input
    ,.ctl_que_tx_ts1                       (ctl_que_tx_ts1)             // -- <  input    
    ,.ctl_que_tx_ts2                       (ctl_que_tx_ts2)             // -- <  input   
    ,.ctl_que_tx_ts3                       (ctl_que_tx_ts3)             // -- <  input   
    ,.ctl_que_good_lanes                   (ctl_que_good_lanes)         // -- <  input  [15:0]   
    ,.ctl_que_deskew                       (ctl_que_deskew)             // -- <  input  [23:0]   
    ,.ctl_que_lane_scrambler               (ctl_q0_lane_scrambler)      // -- <  input  [63:0]
    ,.que_gb_data                          (q0_gb0_data)                // -- >  output [63:0]
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_que q1 (    
     .ctl_que_lane                         (3'b001)                     // -- <  input  [2:0]
    ,.ctl_que_reset                        (ctl_que_reset)              // -- <  input
    ,.ctl_que_stall                        (ctl_que_stall)              // -- <  input
    ,.flt_que_data                         (flt_que_data[127:64])       // -- <  input  [63:0]
    ,.ctl_que_use_neighbor                 (ctl_que_use_nghbr_odd)      // -- <  input    
    ,.neighbor_in_data                     (q0_neighbor_data)           // -- <  input  [63:0]
    ,.neighbor_out_data                    (q1_neighbor_data)           // -- >  output [63:0]
    ,.ctl_que_tx_ts0                       (ctl_que_tx_ts0)             // -- <  input
    ,.ctl_que_tx_ts1                       (ctl_que_tx_ts1)             // -- <  input    
    ,.ctl_que_tx_ts2                       (ctl_que_tx_ts2)             // -- <  input   
    ,.ctl_que_tx_ts3                       (ctl_que_tx_ts3)             // -- <  input   
    ,.ctl_que_good_lanes                   (ctl_que_good_lanes)         // -- <  input  [15:0]   
    ,.ctl_que_deskew                       (ctl_que_deskew)             // -- <  input  [23:0]   
    ,.ctl_que_lane_scrambler               (ctl_q1_lane_scrambler)      // -- <  input  [63:0]
    ,.que_gb_data                          (q1_gb1_data)                // -- >  output [63:0]
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_que q2 (    
     .ctl_que_lane                         (3'b010)                     // -- <  input  [2:0]
    ,.ctl_que_reset                        (ctl_que_reset)              // -- <  input
    ,.ctl_que_stall                        (ctl_que_stall)              // -- <  input
    ,.flt_que_data                         (flt_que_data[191:128])      // -- <  input  [63:0]
    ,.ctl_que_use_neighbor                 (ctl_que_use_nghbr_even)     // -- <  input    
    ,.neighbor_in_data                     (q3_neighbor_data)           // -- <  input  [63:0]
    ,.neighbor_out_data                    (q2_neighbor_data)           // -- >  output [63:0]
    ,.ctl_que_tx_ts0                       (ctl_que_tx_ts0)             // -- <  input
    ,.ctl_que_tx_ts1                       (ctl_que_tx_ts1)             // -- <  input    
    ,.ctl_que_tx_ts2                       (ctl_que_tx_ts2)             // -- <  input   
    ,.ctl_que_tx_ts3                       (ctl_que_tx_ts3)             // -- <  input   
    ,.ctl_que_good_lanes                   (ctl_que_good_lanes)         // -- <  input  [15:0]   
    ,.ctl_que_deskew                       (ctl_que_deskew)             // -- <  input  [23:0]   
    ,.ctl_que_lane_scrambler               (ctl_q2_lane_scrambler)      // -- <  input  [63:0]
    ,.que_gb_data                          (q2_gb2_data)                // -- >  output [63:0]
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_que q3 (    
     .ctl_que_lane                         (3'b011)                     // -- <  input  [2:0]
    ,.ctl_que_reset                        (ctl_que_reset)              // -- <  input
    ,.ctl_que_stall                        (ctl_que_stall)              // -- <  input
    ,.flt_que_data                         (flt_que_data[255:192])      // -- <  input  [63:0]
    ,.ctl_que_use_neighbor                 (ctl_que_use_nghbr_odd)      // -- <  input    
    ,.neighbor_in_data                     (q2_neighbor_data)           // -- <  input  [63:0]
    ,.neighbor_out_data                    (q3_neighbor_data)           // -- >  output [63:0]
    ,.ctl_que_tx_ts0                       (ctl_que_tx_ts0)             // -- <  input
    ,.ctl_que_tx_ts1                       (ctl_que_tx_ts1)             // -- <  input    
    ,.ctl_que_tx_ts2                       (ctl_que_tx_ts2)             // -- <  input   
    ,.ctl_que_tx_ts3                       (ctl_que_tx_ts3)             // -- <  input   
    ,.ctl_que_good_lanes                   (ctl_que_good_lanes)         // -- <  input  [15:0]   
    ,.ctl_que_deskew                       (ctl_que_deskew)             // -- <  input  [23:0]   
    ,.ctl_que_lane_scrambler               (ctl_q3_lane_scrambler)      // -- <  input  [63:0]
    ,.que_gb_data                          (q3_gb3_data)                // -- >  output [63:0]
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_que q4 (    
     .ctl_que_lane                         (3'b100)                     // -- <  input  [2:0]
    ,.ctl_que_reset                        (ctl_que_reset)              // -- <  input
    ,.ctl_que_stall                        (ctl_que_stall)              // -- <  input
    ,.flt_que_data                         (flt_que_data[319:256])      // -- <  input  [63:0]
    ,.ctl_que_use_neighbor                 (ctl_que_use_nghbr_even)     // -- <  input    
    ,.neighbor_in_data                     (q5_neighbor_data)           // -- <  input  [63:0]
    ,.neighbor_out_data                    (q4_neighbor_data)           // -- >  output [63:0]
    ,.ctl_que_tx_ts0                       (ctl_que_tx_ts0)             // -- <  input
    ,.ctl_que_tx_ts1                       (ctl_que_tx_ts1)             // -- <  input    
    ,.ctl_que_tx_ts2                       (ctl_que_tx_ts2)             // -- <  input   
    ,.ctl_que_tx_ts3                       (ctl_que_tx_ts3)             // -- <  input   
    ,.ctl_que_good_lanes                   (ctl_que_good_lanes)         // -- <  input  [15:0]   
    ,.ctl_que_deskew                       (ctl_que_deskew)             // -- <  input  [23:0]   
    ,.ctl_que_lane_scrambler               (ctl_q4_lane_scrambler)      // -- <  input  [63:0]
    ,.que_gb_data                          (q4_gb4_data)                // -- >  output [63:0]
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_que q5 (    
     .ctl_que_lane                         (3'b101)                     // -- <  input  [2:0]
    ,.ctl_que_reset                        (ctl_que_reset)              // -- <  input
    ,.ctl_que_stall                        (ctl_que_stall)              // -- <  input
    ,.flt_que_data                         (flt_que_data[383:320])      // -- <  input  [63:0]
    ,.ctl_que_use_neighbor                 (ctl_que_use_nghbr_odd)      // -- <  input    
    ,.neighbor_in_data                     (q4_neighbor_data)           // -- <  input  [63:0]
    ,.neighbor_out_data                    (q5_neighbor_data)           // -- >  output [63:0]
    ,.ctl_que_tx_ts0                       (ctl_que_tx_ts0)             // -- <  input
    ,.ctl_que_tx_ts1                       (ctl_que_tx_ts1)             // -- <  input    
    ,.ctl_que_tx_ts2                       (ctl_que_tx_ts2)             // -- <  input   
    ,.ctl_que_tx_ts3                       (ctl_que_tx_ts3)             // -- <  input   
    ,.ctl_que_good_lanes                   (ctl_que_good_lanes)         // -- <  input  [15:0]   
    ,.ctl_que_deskew                       (ctl_que_deskew)             // -- <  input  [23:0]   
    ,.ctl_que_lane_scrambler               (ctl_q5_lane_scrambler)      // -- <  input  [63:0]
    ,.que_gb_data                          (q5_gb5_data)                // -- >  output [63:0]
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_que q6 (    
     .ctl_que_lane                         (3'b110)                     // -- <  input  [2:0]
    ,.ctl_que_reset                        (ctl_que_reset)              // -- <  input
    ,.ctl_que_stall                        (ctl_que_stall)              // -- <  input
    ,.flt_que_data                         (flt_que_data[447:384])      // -- <  input  [63:0]
    ,.ctl_que_use_neighbor                 (ctl_que_use_nghbr_even)     // -- <  input    
    ,.neighbor_in_data                     (q7_neighbor_data)           // -- <  input  [63:0]
    ,.neighbor_out_data                    (q6_neighbor_data)           // -- >  output [63:0]
    ,.ctl_que_tx_ts0                       (ctl_que_tx_ts0)             // -- <  input
    ,.ctl_que_tx_ts1                       (ctl_que_tx_ts1)             // -- <  input    
    ,.ctl_que_tx_ts2                       (ctl_que_tx_ts2)             // -- <  input   
    ,.ctl_que_tx_ts3                       (ctl_que_tx_ts3)             // -- <  input   
    ,.ctl_que_good_lanes                   (ctl_que_good_lanes)         // -- <  input  [15:0]   
    ,.ctl_que_deskew                       (ctl_que_deskew)             // -- <  input  [23:0]   
    ,.ctl_que_lane_scrambler               (ctl_q6_lane_scrambler)      // -- <  input  [63:0]
    ,.que_gb_data                          (q6_gb6_data)                // -- >  output [63:0]
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_que q7 (
     .ctl_que_lane                         (3'b111)                     // -- <  input  [2:0]
    ,.ctl_que_reset                        (ctl_que_reset)              // -- <  input
    ,.ctl_que_stall                        (ctl_que_stall)              // -- <  input
    ,.flt_que_data                         (flt_que_data[511:448])      // -- <  input  [63:0]
    ,.ctl_que_use_neighbor                 (ctl_que_use_nghbr_odd)      // -- <  input    
    ,.neighbor_in_data                     (q6_neighbor_data)           // -- <  input  [63:0]
    ,.neighbor_out_data                    (q7_neighbor_data)           // -- >  output [63:0]
    ,.ctl_que_tx_ts0                       (ctl_que_tx_ts0)             // -- <  input
    ,.ctl_que_tx_ts1                       (ctl_que_tx_ts1)             // -- <  input    
    ,.ctl_que_tx_ts2                       (ctl_que_tx_ts2)             // -- <  input   
    ,.ctl_que_tx_ts3                       (ctl_que_tx_ts3)             // -- <  input   
    ,.ctl_que_good_lanes                   (ctl_que_good_lanes)         // -- <  input  [15:0]   
    ,.ctl_que_deskew                       (ctl_que_deskew)             // -- <  input  [23:0]   
    ,.ctl_que_lane_scrambler               (ctl_q7_lane_scrambler)      // -- <  input  [63:0]
    ,.que_gb_data                          (q7_gb7_data)                // -- >  output [63:0]
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );


ocx_dlx_tx_gbx gbx0 ( 
     .orx_otx_train_failed                 (orx_otx_train_failed)       // -- <  input
    ,.ctl_gb_train                         (ctl_gb_train)               // -- <  input
    ,.ctl_gb_reset                         (ctl_gb_reset)               // -- <  input
    ,.ctl_gb_seq                           (ctl_gb_seq)                 // -- <  input  [6:0]
    ,.que_gb_data                          (q0_gb0_data)                // -- <  input  [63:0]
    ,.dlx_phy_tx_seq                       (dlx_l0_tx_seq)              // -- <  output [5:0]
    ,.dlx_phy_tx_header                    (dlx_l0_tx_header)           // -- <  output [1:0]
    ,.dlx_phy_tx_data                      (dlx_l0_tx_data)             // -- <  output [63:0]
    ,.ctl_gb_tx_a_pattern                  (ctl_gb_tx_a_pattern)        // -- <  input  
    ,.ctl_gb_tx_b_pattern                  (ctl_gb_tx_b_pattern)        // -- <  input
    ,.ctl_gb_tx_sync_pattern               (ctl_gb_tx_sync_pattern)     // -- <  input   
    ,.ctl_gb_tx_zeros                      (ctl_gb_tx_zeros[0])            // -- <  input    
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_gbx gbx1 (    
     .orx_otx_train_failed                 (orx_otx_train_failed)       // -- <  input
    ,.ctl_gb_train                         (ctl_gb_train)               // -- <  input
    ,.ctl_gb_reset                         (ctl_gb_reset)               // -- <  input
    ,.ctl_gb_seq                           (ctl_gb_seq)                 // -- <  input  [6:0]
    ,.que_gb_data                          (q1_gb1_data)                // -- <  input  [63:0]
    ,.dlx_phy_tx_seq                       (dlx_l1_tx_seq)              // -- <  output [5:0]
    ,.dlx_phy_tx_header                    (dlx_l1_tx_header)           // -- <  output [1:0]
    ,.dlx_phy_tx_data                      (dlx_l1_tx_data)             // -- <  output [63:0]
    ,.ctl_gb_tx_a_pattern                  (ctl_gb_tx_a_pattern)        // -- <  input  
    ,.ctl_gb_tx_b_pattern                  (ctl_gb_tx_b_pattern)        // -- <  input
    ,.ctl_gb_tx_sync_pattern               (ctl_gb_tx_sync_pattern)     // -- <  input   
    ,.ctl_gb_tx_zeros                      (ctl_gb_tx_zeros[1])            // -- <  input    
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_gbx gbx2 ( 
     .orx_otx_train_failed                 (orx_otx_train_failed)       // -- <  input
    ,.ctl_gb_train                         (ctl_gb_train)               // -- <  input
    ,.ctl_gb_reset                         (ctl_gb_reset)               // -- <  input
    ,.ctl_gb_seq                           (ctl_gb_seq)                 // -- <  input  [6:0]
    ,.que_gb_data                          (q2_gb2_data)                // -- <  input  [63:0]
    ,.dlx_phy_tx_seq                       (dlx_l2_tx_seq)              // -- <  output [5:0]
    ,.dlx_phy_tx_header                    (dlx_l2_tx_header)           // -- <  output [1:0]
    ,.dlx_phy_tx_data                      (dlx_l2_tx_data)             // -- <  output [63:0]
    ,.ctl_gb_tx_a_pattern                  (ctl_gb_tx_a_pattern)        // -- <  input  
    ,.ctl_gb_tx_b_pattern                  (ctl_gb_tx_b_pattern)        // -- <  input
    ,.ctl_gb_tx_sync_pattern               (ctl_gb_tx_sync_pattern)     // -- <  input   
    ,.ctl_gb_tx_zeros                      (ctl_gb_tx_zeros[2])            // -- <  input    
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_gbx gbx3 ( 
     .orx_otx_train_failed                 (orx_otx_train_failed)       // -- <  input
    ,.ctl_gb_train                         (ctl_gb_train)               // -- <  input
    ,.ctl_gb_reset                         (ctl_gb_reset)               // -- <  input
    ,.ctl_gb_seq                           (ctl_gb_seq)                 // -- <  input  [6:0]
    ,.que_gb_data                          (q3_gb3_data)                // -- <  input  [63:0]
    ,.dlx_phy_tx_seq                       (dlx_l3_tx_seq)              // -- <  output [5:0]
    ,.dlx_phy_tx_header                    (dlx_l3_tx_header)           // -- <  output [1:0]
    ,.dlx_phy_tx_data                      (dlx_l3_tx_data)             // -- <  output [63:0]
    ,.ctl_gb_tx_a_pattern                  (ctl_gb_tx_a_pattern)        // -- <  input  
    ,.ctl_gb_tx_b_pattern                  (ctl_gb_tx_b_pattern)        // -- <  input
    ,.ctl_gb_tx_sync_pattern               (ctl_gb_tx_sync_pattern)     // -- <  input   
    ,.ctl_gb_tx_zeros                      (ctl_gb_tx_zeros[3])            // -- <  input    
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_gbx gbx4 ( 
     .orx_otx_train_failed                 (orx_otx_train_failed)       // -- <  input
    ,.ctl_gb_train                         (ctl_gb_train)               // -- <  input
    ,.ctl_gb_reset                         (ctl_gb_reset)               // -- <  input
    ,.ctl_gb_seq                           (ctl_gb_seq)                 // -- <  input  [6:0]
    ,.que_gb_data                          (q4_gb4_data)                // -- <  input  [63:0]
    ,.dlx_phy_tx_seq                       (dlx_l4_tx_seq)              // -- <  output [5:0]
    ,.dlx_phy_tx_header                    (dlx_l4_tx_header)           // -- <  output [1:0]
    ,.dlx_phy_tx_data                      (dlx_l4_tx_data)             // -- <  output [63:0]
    ,.ctl_gb_tx_a_pattern                  (ctl_gb_tx_a_pattern)        // -- <  input  
    ,.ctl_gb_tx_b_pattern                  (ctl_gb_tx_b_pattern)        // -- <  input
    ,.ctl_gb_tx_sync_pattern               (ctl_gb_tx_sync_pattern)     // -- <  input   
    ,.ctl_gb_tx_zeros                      (ctl_gb_tx_zeros[4])            // -- <  input    
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_gbx gbx5 ( 
     .orx_otx_train_failed                 (orx_otx_train_failed)       // -- <  input
    ,.ctl_gb_train                         (ctl_gb_train)               // -- <  input
    ,.ctl_gb_reset                         (ctl_gb_reset)               // -- <  input
    ,.ctl_gb_seq                           (ctl_gb_seq)                 // -- <  input  [6:0]
    ,.que_gb_data                          (q5_gb5_data)                // -- <  input  [63:0]
    ,.dlx_phy_tx_seq                       (dlx_l5_tx_seq)              // -- <  output [5:0]
    ,.dlx_phy_tx_header                    (dlx_l5_tx_header)           // -- <  output [1:0]
    ,.dlx_phy_tx_data                      (dlx_l5_tx_data)             // -- <  output [63:0]
    ,.ctl_gb_tx_a_pattern                  (ctl_gb_tx_a_pattern)        // -- <  input  
    ,.ctl_gb_tx_b_pattern                  (ctl_gb_tx_b_pattern)        // -- <  input
    ,.ctl_gb_tx_sync_pattern               (ctl_gb_tx_sync_pattern)     // -- <  input   
    ,.ctl_gb_tx_zeros                      (ctl_gb_tx_zeros[5])            // -- <  input    
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_gbx gbx6 ( 
     .orx_otx_train_failed                 (orx_otx_train_failed)       // -- <  input
    ,.ctl_gb_train                         (ctl_gb_train)               // -- <  input
    ,.ctl_gb_reset                         (ctl_gb_reset)               // -- <  input
    ,.ctl_gb_seq                           (ctl_gb_seq)                 // -- <  input  [6:0]
    ,.que_gb_data                          (q6_gb6_data)                // -- <  input  [63:0]
    ,.dlx_phy_tx_seq                       (dlx_l6_tx_seq)              // -- <  output [5:0]
    ,.dlx_phy_tx_header                    (dlx_l6_tx_header)           // -- <  output [1:0]
    ,.dlx_phy_tx_data                      (dlx_l6_tx_data)             // -- <  output [63:0]
    ,.ctl_gb_tx_a_pattern                  (ctl_gb_tx_a_pattern)        // -- <  input  
    ,.ctl_gb_tx_b_pattern                  (ctl_gb_tx_b_pattern)        // -- <  input
    ,.ctl_gb_tx_sync_pattern               (ctl_gb_tx_sync_pattern)     // -- <  input   
    ,.ctl_gb_tx_zeros                      (ctl_gb_tx_zeros[6])            // -- <  input    
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );

ocx_dlx_tx_gbx gbx7 ( 
     .orx_otx_train_failed                 (orx_otx_train_failed)       // -- <  input
    ,.ctl_gb_train                         (ctl_gb_train)               // -- <  input
    ,.ctl_gb_reset                         (ctl_gb_reset)               // -- <  input
    ,.ctl_gb_seq                           (ctl_gb_seq)                 // -- <  input  [6:0]
    ,.que_gb_data                          (q7_gb7_data)                // -- <  input  [63:0]
    ,.dlx_phy_tx_seq                       (dlx_l7_tx_seq)              // -- <  output [5:0]
    ,.dlx_phy_tx_header                    (dlx_l7_tx_header)           // -- <  output [1:0]
    ,.dlx_phy_tx_data                      (dlx_l7_tx_data)             // -- <  output [63:0]
    ,.ctl_gb_tx_a_pattern                  (ctl_gb_tx_a_pattern)        // -- <  input  
    ,.ctl_gb_tx_b_pattern                  (ctl_gb_tx_b_pattern)        // -- <  input
    ,.ctl_gb_tx_sync_pattern               (ctl_gb_tx_sync_pattern)     // -- <  input   
    ,.ctl_gb_tx_zeros                      (ctl_gb_tx_zeros[7])            // -- <  input    
//--     ,.gnd                                  (gnd)                        // -- <> inout
//--     ,.vdn                                  (vdn)                        // -- <> inout
    ,.dlx_clk                              (dlx_clk)                    // -- <  input  
    );


endmodule //-- ocx_dlx_txdf

