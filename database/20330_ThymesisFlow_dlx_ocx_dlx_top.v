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
//-- TITLE:    ocx_dlx_top.v
//-- FUNCTION: One x8 OpenCAPI link divided into one transmit and 
//--           one receive section
//--
//------------------------------------------------------------------------

//-- (* PIN_DEFAULT_POWER_DOMAIN="VDN", PIN_DEFAULT_GROUND_DOMAIN="GND" *)
module ocx_dlx_top (

// ----------------------
// -- RX interface
// ----------------------
// -- interface to TLx
 dlx_tlx_flit_valid            // --  > output            
,dlx_tlx_flit                  // --  > output [511:0]    
,dlx_tlx_flit_crc_err          // --  > output                                         
,dlx_tlx_link_up               // --  > output            
,dlx_config_info               // --  > output [31:0]                              
,ro_dlx_version                // --  > output [31:0]
,ln0_rx_valid                  // --  < input 
,ln0_rx_header                 // --  < input  [1:0]                               
,ln0_rx_data                   // --  < input  [63:0]                               
,ln0_rx_slip                   // --  < output                               
,ln1_rx_valid                  // --  < input 
,ln1_rx_header                 // --  < input  [1:0]                               
,ln1_rx_data                   // --  < input  [63:0]                               
,ln1_rx_slip                   // --  < output                               
,ln2_rx_valid                  // --  < input 
,ln2_rx_header                 // --  < input  [1:0]                               
,ln2_rx_data                   // --  < input  [63:0]                               
,ln2_rx_slip                   // --  < output                               
,ln3_rx_valid                  // --  < input 
,ln3_rx_header                 // --  < input  [1:0]                               
,ln3_rx_data                   // --  < input  [63:0]                               
,ln3_rx_slip                   // --  < output                               
,ln4_rx_valid                  // --  < input 
,ln4_rx_header                 // --  < input  [1:0]                               
,ln4_rx_data                   // --  < input  [63:0]                               
,ln4_rx_slip                   // --  < output                               
,ln5_rx_valid                  // --  < input 
,ln5_rx_header                 // --  < input  [1:0]                               
,ln5_rx_data                   // --  < input  [63:0]                               
,ln5_rx_slip                   // --  < output                               
,ln6_rx_valid                  // --  < input 
,ln6_rx_header                 // --  < input  [1:0]                               
,ln6_rx_data                   // --  < input  [63:0]                               
,ln6_rx_slip                   // --  < output                               
,ln7_rx_valid                  // --  < input 
,ln7_rx_header                 // --  < input  [1:0]                               
,ln7_rx_data                   // --  < input  [63:0]                               
,ln7_rx_slip                   // --  < output                               
// ----------------------                          
// -- TX interface
// ----------------------                          
// -- tlx interface
,dlx_tlx_init_flit_depth       // --  > output [2:0]            
,dlx_tlx_flit_credit           // --  > output             
,tlx_dlx_flit_valid            // --  < input             
,tlx_dlx_flit                  // --  < input  [511:0]    
   
// -- Phy interface
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

,tlx_dlx_debug_encode          // -- < input [3:0]
,tlx_dlx_debug_info            // -- < input [31:0]
 
,opt_gckn                      //--   < input 
,ocde                                                                 
//-- ,gnd                           // -- <> inout             
//-- ,vdn                           // -- <> inout        


//-- Xilinx PHY interface with DLx
,clk_156_25MHz                 // --  < input
,gtwiz_reset_all_out           // --  > output
,hb_gtwiz_reset_all_in         // --  < input
,gtwiz_reset_tx_done_in        // --  < input
,gtwiz_reset_rx_done_in        // --  < input
,gtwiz_buffbypass_tx_done_in   // --  < input
,gtwiz_buffbypass_rx_done_in   // --  < input
,gtwiz_userclk_tx_active_in    // --  < input
,gtwiz_userclk_rx_active_in    // --  < input
,send_first                    // --  < input
,gtwiz_reset_rx_datapath_out   // --  > output
);
// ----------------------
// -- RX interface
// ----------------------
// -- interface to TLx
output            dlx_tlx_flit_valid;
output [511:0]    dlx_tlx_flit;
output            dlx_tlx_flit_crc_err;

output            dlx_tlx_link_up;
output [31:0]     dlx_config_info;
output [31:0]     ro_dlx_version;

// -- interface to rx lanes
input             ln0_rx_valid;
input  [1:0]      ln0_rx_header;                              
input  [63:0]     ln0_rx_data;                               
output            ln0_rx_slip;                        
input             ln1_rx_valid;
input  [1:0]      ln1_rx_header;                              
input  [63:0]     ln1_rx_data;                               
output            ln1_rx_slip;                        
input             ln2_rx_valid;
input  [1:0]      ln2_rx_header;                              
input  [63:0]     ln2_rx_data;                               
output            ln2_rx_slip;                        
input             ln3_rx_valid;
input  [1:0]      ln3_rx_header;                              
input  [63:0]     ln3_rx_data;                               
output            ln3_rx_slip;                        
input             ln4_rx_valid;
input  [1:0]      ln4_rx_header;                              
input  [63:0]     ln4_rx_data;                               
output            ln4_rx_slip;                        
input             ln5_rx_valid;
input  [1:0]      ln5_rx_header;                              
input  [63:0]     ln5_rx_data;                               
output            ln5_rx_slip;                        
input             ln6_rx_valid;
input  [1:0]      ln6_rx_header;                              
input  [63:0]     ln6_rx_data;                               
output            ln6_rx_slip;                        
input             ln7_rx_valid;
input  [1:0]      ln7_rx_header;                              
input  [63:0]     ln7_rx_data;                               
output            ln7_rx_slip;                        


// ----------------------
// -- TX interface
// ----------------------
// -- tlx interface
output            dlx_tlx_flit_credit;
output [2:0]      dlx_tlx_init_flit_depth;
input             tlx_dlx_flit_valid;
input  [511:0]    tlx_dlx_flit;
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


input  [3:0]      tlx_dlx_debug_encode;
input  [31:0]     tlx_dlx_debug_info;

input             opt_gckn;
input             ocde;

//-- inout             gnd;
//-- (* GROUND_PIN="1" *)
//-- wire gnd;
//-- inout             vdn;
//-- (* POWER_PIN="1" *)
//-- wire vdn;

// -- Xilinx transceiver PHY interface
wire            dlx_reset; 
wire [7:0]      pb_io_o0_rx_run_lane;
wire [7:0]      io_pb_o0_rx_init_done;
input           clk_156_25MHz;               // --  < input
input           hb_gtwiz_reset_all_in;       // --  < input
output          gtwiz_reset_all_out;         // --  > output
output          gtwiz_reset_rx_datapath_out; // --  > output
input           gtwiz_reset_tx_done_in;      // --  < input
input           gtwiz_reset_rx_done_in;      // --  < input
input           gtwiz_buffbypass_tx_done_in; // --  < input
input           gtwiz_buffbypass_rx_done_in; // --  < input
input           gtwiz_userclk_tx_active_in;  // --  < input
input           gtwiz_userclk_rx_active_in;  // --  < input
input           send_first;

wire            tx_rx_reset;
wire            train_ts2;
wire            train_ts67;
wire            rx_tx_crc_error;
wire            rx_tx_retrain;
wire            rx_tx_nack;
wire [4:0]      rx_tx_tx_ack_rtn;
wire [3:0]      rx_tx_rx_ack_inc;
wire            rx_tx_tx_ack_ptr_vld;
wire [6:0]      rx_tx_tx_ack_ptr;
wire            rx_tx_tx_lane_swap;
wire            rx_tx_deskew_done;
wire            rx_tx_linkup;
wire [7:0]      ln0_rx_tx_last_byte_ts3;
wire [7:0]      ln1_rx_tx_last_byte_ts3;
wire [7:0]      ln2_rx_tx_last_byte_ts3;
wire [7:0]      ln3_rx_tx_last_byte_ts3;
wire            tx_rx_training;
wire [7:0]      tx_rx_disabled_rx_lanes;
wire            tx_rx_phy_training;
wire [7:0]      rx_tx_pattern_a;
wire [7:0]      rx_tx_pattern_b;
wire [7:0]      rx_tx_sync;
wire [7:0]      rx_tx_TS1;
wire [7:0]      rx_tx_TS2;
wire [7:0]      rx_tx_TS3;
wire [7:0]      rx_tx_block_lock;
wire [7:0]      rx_tx_lane_inverted;


// ************************************************************
// Interface Xilinx transceiver with DLx RX/TX
// ************************************************************
// -- Note: Some of the bits aren't used for this design so either
//          ignore the most significant bits for the receiver side 
//          or add 0's to the most significant bits for the 
//          transmitter side

wire      ln0_rx_valid_int;
wire      ln1_rx_valid_int;
wire      ln2_rx_valid_int;
wire      ln3_rx_valid_int;
wire      ln4_rx_valid_int;
wire      ln5_rx_valid_int;
wire      ln6_rx_valid_int;
wire      ln7_rx_valid_int;

wire            cfg_transmit_order;
assign          cfg_transmit_order = 1'b1;

    
// -- pull in the rxdf macro
ocx_dlx_rxdf rx (
 .ln0_rx_valid                  (ln0_rx_valid_int)              // --  < input
,.ln0_rx_data                   (ln0_rx_data)                   // --  < input  [63:0]
,.ln0_rx_header                 (ln0_rx_header)                 // --  < input  [1:0]
,.ln0_rx_slip                   (ln0_rx_slip)                   // --  < output
,.ln1_rx_valid                  (ln1_rx_valid_int)              // --  < input
,.ln1_rx_data                   (ln1_rx_data)                   // --  < input  [63:0]
,.ln1_rx_header                 (ln1_rx_header)                 // --  < input  [1:0]
,.ln1_rx_slip                   (ln1_rx_slip)                   // --  < output
,.ln2_rx_valid                  (ln2_rx_valid_int)              // --  < input
,.ln2_rx_data                   (ln2_rx_data)                   // --  < input  [63:0]
,.ln2_rx_header                 (ln2_rx_header)                 // --  < input  [1:0]
,.ln2_rx_slip                   (ln2_rx_slip)                   // --  < output
,.ln3_rx_valid                  (ln3_rx_valid_int)              // --  < input
,.ln3_rx_data                   (ln3_rx_data)                   // --  < input  [63:0]
,.ln3_rx_header                 (ln3_rx_header)                 // --  < input  [1:0]
,.ln3_rx_slip                   (ln3_rx_slip)                   // --  < output
,.ln4_rx_valid                  (ln4_rx_valid_int)              // --  < input
,.ln4_rx_data                   (ln4_rx_data)                   // --  < input  [63:0]
,.ln4_rx_header                 (ln4_rx_header)                 // --  < input  [1:0]
,.ln4_rx_slip                   (ln4_rx_slip)                   // --  < output
,.ln5_rx_valid                  (ln5_rx_valid_int)              // --  < input
,.ln5_rx_data                   (ln5_rx_data)                   // --  < input  [63:0]
,.ln5_rx_header                 (ln5_rx_header)                 // --  < input  [1:0]
,.ln5_rx_slip                   (ln5_rx_slip)                   // --  < output
,.ln6_rx_valid                  (ln6_rx_valid_int)              // --  < input
,.ln6_rx_data                   (ln6_rx_data)                   // --  < input  [63:0]
,.ln6_rx_slip                   (ln6_rx_slip)                   // --  < output
,.ln6_rx_header                 (ln6_rx_header)                 // --  < input  [1:0]
,.ln7_rx_valid                  (ln7_rx_valid_int)              // --  < input
,.ln7_rx_data                   (ln7_rx_data)                   // --  < input  [63:0]
,.ln7_rx_header                 (ln7_rx_header)                 // --  < input  [1:0]
,.ln7_rx_slip                   (ln7_rx_slip)                   // --  < output
,.dlx_tlx_flit_valid            (dlx_tlx_flit_valid)            // --  > output
,.dlx_tlx_flit                  (dlx_tlx_flit)                  // --  > output [511:0]
,.dlx_tlx_flit_crc_err          (dlx_tlx_flit_crc_err)          // --  > output
,.dlx_tlx_link_up               (dlx_tlx_link_up)               // --  > output
,.dlx_config_info               (dlx_config_info)               // --  > output
,.cfg_transmit_order            (cfg_transmit_order)            // --  < input
,.tx_rx_reset                   (tx_rx_reset)                   // --  < input
,.train_ts2                     (train_ts2)                     // --  < input
,.train_ts67                    (train_ts67)                    // --  < input     
,.rx_tx_retrain                 (rx_tx_retrain)                 // --  > output
,.rx_tx_crc_error               (rx_tx_crc_error)               // --  > output
,.rx_tx_nack                    (rx_tx_nack)                    // --  > output
,.rx_tx_tx_ack_rtn              (rx_tx_tx_ack_rtn)              // --  > output [4:0]
,.rx_tx_rx_ack_inc              (rx_tx_rx_ack_inc)              // --  > output [3:0]
,.rx_tx_tx_ack_ptr_vld          (rx_tx_tx_ack_ptr_vld)          // --  > output
,.rx_tx_tx_ack_ptr              (rx_tx_tx_ack_ptr)              // --  > output [6:0]
,.ln0_rx_tx_last_byte_ts3       (ln0_rx_tx_last_byte_ts3)       // --  > output [7:0]
,.ln1_rx_tx_last_byte_ts3       (ln1_rx_tx_last_byte_ts3)       // --  > output [7:0]
,.ln2_rx_tx_last_byte_ts3       (ln2_rx_tx_last_byte_ts3)       // --  > output [7:0]
,.ln3_rx_tx_last_byte_ts3       (ln3_rx_tx_last_byte_ts3)       // --  > output [7:0]
,.rx_tx_tx_lane_swap            (rx_tx_tx_lane_swap)            // --  > output
,.rx_tx_deskew_done             (rx_tx_deskew_done)             // --  > output
,.tx_rx_training                (tx_rx_training)                // --  < input
,.tx_rx_phy_training            (tx_rx_phy_training)            // --  < input
,.tx_rx_disabled_rx_lanes       (tx_rx_disabled_rx_lanes)       // --  < input  [7:0]
,.rx_tx_pattern_a               (rx_tx_pattern_a)               // --  > output [7:0]
,.rx_tx_pattern_b               (rx_tx_pattern_b)               // --  > output [7:0]
,.rx_tx_lane_inverted           (rx_tx_lane_inverted)           // --  > output [7:0]
,.rx_tx_sync                    (rx_tx_sync)                    // --  > output [7:0]
,.rx_tx_TS1                     (rx_tx_TS1)                     // --  > output [7:0]
,.rx_tx_TS2                     (rx_tx_TS2)                     // --  > output [7:0]
,.rx_tx_TS3                     (rx_tx_TS3)                     // --  > output [7:0]
,.rx_tx_block_lock              (rx_tx_block_lock)              // --  > output [7:0]
,.rx_tx_linkup                  (rx_tx_linkup)                  // --  > output
,.opt_gckn                      (opt_gckn)                      // --  < input
//-- ,.gnd                           (gnd)                           // -- <> inout
//-- ,.vdn                           (vdn)                           // -- <> inout
);

// -- pull in the txdf macro
ocx_dlx_txdf tx (
 .dlx_tlx_init_flit_depth       (dlx_tlx_init_flit_depth)       // --  > output [2:0]
,.dlx_tlx_flit_credit           (dlx_tlx_flit_credit)           // --  > output
,.tlx_dlx_flit_valid            (tlx_dlx_flit_valid)            // --  < input
,.tlx_dlx_flit                  (tlx_dlx_flit)                  // --  < input  [511:0]
,.ro_dlx_version                (ro_dlx_version)                // --  > output [31:0]
,.dlx_l0_tx_data                (dlx_l0_tx_data)                // --  > output [63:0]
,.dlx_l1_tx_data                (dlx_l1_tx_data)                // --  > output [63:0]
,.dlx_l2_tx_data                (dlx_l2_tx_data)                // --  > output [63:0]
,.dlx_l3_tx_data                (dlx_l3_tx_data)                // --  > output [63:0]
,.dlx_l4_tx_data                (dlx_l4_tx_data)                // --  > output [63:0]
,.dlx_l5_tx_data                (dlx_l5_tx_data)                // --  > output [63:0]
,.dlx_l6_tx_data                (dlx_l6_tx_data)                // --  > output [63:0]
,.dlx_l7_tx_data                (dlx_l7_tx_data)                // --  > output [63:0]
,.dlx_l0_tx_header              (dlx_l0_tx_header)              // --  > output [1:0]
,.dlx_l1_tx_header              (dlx_l1_tx_header)              // --  > output [1:0]
,.dlx_l2_tx_header              (dlx_l2_tx_header)              // --  > output [1:0]
,.dlx_l3_tx_header              (dlx_l3_tx_header)              // --  > output [1:0]
,.dlx_l4_tx_header              (dlx_l4_tx_header)              // --  > output [1:0]
,.dlx_l5_tx_header              (dlx_l5_tx_header)              // --  > output [1:0]
,.dlx_l6_tx_header              (dlx_l6_tx_header)              // --  > output [1:0]
,.dlx_l7_tx_header              (dlx_l7_tx_header)              // --  > output [1:0]
,.dlx_l0_tx_seq                 (dlx_l0_tx_seq)                 // --  > output [5:0]
,.dlx_l1_tx_seq                 (dlx_l1_tx_seq)                 // --  > output [5:0]
,.dlx_l2_tx_seq                 (dlx_l2_tx_seq)                 // --  > output [5:0]
,.dlx_l3_tx_seq                 (dlx_l3_tx_seq)                 // --  > output [5:0]
,.dlx_l4_tx_seq                 (dlx_l4_tx_seq)                 // --  > output [5:0]
,.dlx_l5_tx_seq                 (dlx_l5_tx_seq)                 // --  > output [5:0]
,.dlx_l6_tx_seq                 (dlx_l6_tx_seq)                 // --  > output [5:0]
,.dlx_l7_tx_seq                 (dlx_l7_tx_seq)                 // --  > output [5:0]
,.cfg_transmit_order            (cfg_transmit_order)            // --  < input
,.pb_io_o0_rx_run_lane          (pb_io_o0_rx_run_lane)          // --  > output [7:0]
,.io_pb_o0_rx_init_done         (io_pb_o0_rx_init_done)         // --  < input  [7:0]
,.tlx_dlx_debug_encode          (tlx_dlx_debug_encode)          // --  < input  [3:0]
,.tlx_dlx_debug_info            (tlx_dlx_debug_info)            // --  < input  [31:0]
,.rx_tx_tx_lane_swap            (rx_tx_tx_lane_swap)            // --  < input
,.rx_tx_crc_error               (rx_tx_crc_error)               // --  < input
,.rx_tx_retrain                 (rx_tx_retrain)                 // --  < input
,.rx_tx_nack                    (rx_tx_nack)                    // --  < input
,.rx_tx_tx_ack_rtn              (rx_tx_tx_ack_rtn)              // --  < input  [4:0]
,.rx_tx_rx_ack_inc              (rx_tx_rx_ack_inc)              // --  < input  [3:0]
,.rx_tx_tx_ack_ptr_vld          (rx_tx_tx_ack_ptr_vld)          // --  < input
,.rx_tx_tx_ack_ptr              (rx_tx_tx_ack_ptr)              // --  < input  [6:0]
,.tx_rx_reset                   (tx_rx_reset)                   // --  > output
,.train_ts2                     (train_ts2)                     // --  > output
,.train_ts67                    (train_ts67)                    // --  > output
,.tx_rx_phy_training            (tx_rx_phy_training)            // --  > output
,.rx_tx_pattern_a               (rx_tx_pattern_a)               // --  < input  [7:0]
,.rx_tx_pattern_b               (rx_tx_pattern_b)               // --  < input  [7:0]
,.rx_tx_lane_inverted           (rx_tx_lane_inverted)           // --  < input  [7:0]
,.rx_tx_sync                    (rx_tx_sync)                    // --  < input  [7:0]
,.rx_tx_TS1                     (rx_tx_TS1)                     // --  < input  [7:0]
,.rx_tx_TS2                     (rx_tx_TS2)                     // --  < input  [7:0]
,.rx_tx_TS3                     (rx_tx_TS3)                     // --  < input  [7:0]
,.rx_tx_block_lock              (rx_tx_block_lock)              // --  < input  [7:0]
,.rx_tx_deskew_done             (rx_tx_deskew_done)             // --  < input
,.rx_tx_linkup                  (rx_tx_linkup)                  // --  < input
,.ln0_rx_tx_last_byte_ts3       (ln0_rx_tx_last_byte_ts3)       // --  < input  [7:0]
,.ln1_rx_tx_last_byte_ts3       (ln1_rx_tx_last_byte_ts3)       // --  < input  [7:0]
,.ln2_rx_tx_last_byte_ts3       (ln2_rx_tx_last_byte_ts3)       // --  < input  [7:0]
,.ln3_rx_tx_last_byte_ts3       (ln3_rx_tx_last_byte_ts3)       // --  < input  [7:0]
,.dlx_reset                     (dlx_reset)                     // --  < input
,.tx_rx_training                (tx_rx_training)                // --  > output
,.tx_rx_disabled_rx_lanes       (tx_rx_disabled_rx_lanes)       // --  > output [7:0]
,.dlx_clk                       (opt_gckn)                      // --  < input                                      
//-- ,.gnd                           (gnd)                           // -- <> inout             
//-- ,.vdn                           (vdn)                           // -- <> inout        
);

// Initialization sequence for the Xilinx transceivers
ocx_dlx_xlx_if xlx_if (
 .clk_156_25MHz                 (clk_156_25MHz)                 // --  < input
,.opt_gckn                      (opt_gckn)                      // --  < input
,.ocde                          (ocde)                          // --  < input
,.hb_gtwiz_reset_all_in         (hb_gtwiz_reset_all_in)         // --  < input
,.gtwiz_reset_all_out           (gtwiz_reset_all_out)           // --  > output
,.gtwiz_reset_rx_datapath_out   (gtwiz_reset_rx_datapath_out)   // --  > output
,.gtwiz_reset_tx_done_in        (gtwiz_reset_tx_done_in)        // --  < input
,.gtwiz_reset_rx_done_in        (gtwiz_reset_rx_done_in)        // --  < input
,.gtwiz_buffbypass_tx_done_in   (gtwiz_buffbypass_tx_done_in)   // --  < input
,.gtwiz_buffbypass_rx_done_in   (gtwiz_buffbypass_rx_done_in)   // --  < input
,.gtwiz_userclk_tx_active_in    (gtwiz_userclk_tx_active_in)    // --  < input
,.gtwiz_userclk_rx_active_in    (gtwiz_userclk_rx_active_in)    // --  < input
,.dlx_reset                     (dlx_reset)                     // --  > output
,.pb_io_o0_rx_run_lane          (pb_io_o0_rx_run_lane)          // --  < input  [7:0]
,.io_pb_o0_rx_init_done         (io_pb_o0_rx_init_done)         // --  > output [7:0]
,.send_first                    (send_first)                    // --  < input
,.ln0_rx_valid_in               (ln0_rx_valid)                  // --  < input
,.ln1_rx_valid_in               (ln1_rx_valid)                  // --  < input
,.ln2_rx_valid_in               (ln2_rx_valid)                  // --  < input
,.ln3_rx_valid_in               (ln3_rx_valid)                  // --  < input
,.ln4_rx_valid_in               (ln4_rx_valid)                  // --  < input
,.ln5_rx_valid_in               (ln5_rx_valid)                  // --  < input
,.ln6_rx_valid_in               (ln6_rx_valid)                  // --  < input
,.ln7_rx_valid_in               (ln7_rx_valid)                  // --  < input
,.ln0_rx_valid_out              (ln0_rx_valid_int)              // --  > ouput
,.ln1_rx_valid_out              (ln1_rx_valid_int)              // --  > ouput
,.ln2_rx_valid_out              (ln2_rx_valid_int)              // --  > ouput
,.ln3_rx_valid_out              (ln3_rx_valid_int)              // --  > ouput
,.ln4_rx_valid_out              (ln4_rx_valid_int)              // --  > ouput
,.ln5_rx_valid_out              (ln5_rx_valid_int)              // --  > ouput
,.ln6_rx_valid_out              (ln6_rx_valid_int)              // --  > ouput
,.ln7_rx_valid_out              (ln7_rx_valid_int)              // --  > ouput
);

endmodule    //-- ocx_dlx_top
