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
//-- TITLE:    ocx_dlx_rx_main.v
//-- FUNCTION: Manages flits received on the OpenCAPI link
//--           
//------------------------------------------------------------------------
 

//-- (* PIN_DEFAULT_POWER_DOMAIN="VDN", PIN_DEFAULT_GROUND_DOMAIN="GND" *)
module ocx_dlx_rx_main (

  reset                         // < input
 ,training_enable               // < input
 ,train_ts2                     // < input
 ,train_ts67                    // < input

 ,ln0_data                      // < input
 ,ln1_data                      // < input
 ,ln2_data                      // < input
 ,ln3_data                      // < input
 ,ln4_data                      // < input
 ,ln5_data                      // < input
 ,ln6_data                      // < input
 ,ln7_data                      // < input
 ,data_flit                     // < input
 ,disabled_lanes                // < input
 ,ctl_header                    // < input

 ,deskew_valid                  // < input
 ,deskew_overflow               // < input
 ,deskew_all_valid_l0           // > output
 ,deskew_all_valid_l1           // > output
 ,deskew_all_valid_l2           // > output
 ,deskew_all_valid_l3           // > output
 ,deskew_all_valid_l4           // > output
 ,deskew_all_valid_l5           // > output
 ,deskew_all_valid_l6           // > output
 ,deskew_all_valid_l7           // > output
 ,deskew_reset                  // > output

 ,flit_out                      // > output 
 ,valid_out                     // > output  
 ,tlx_crc_error                 // > output
 ,tx_crc_error                  // > output
 ,rx_TS1                        // < input
 ,rx_tx_retrain                 // > output
 ,x4_rx_good_evens              // > output 
 ,x4_rx_good_odds               // > output 

 ,nack_out                      // > output
 ,ack_ptr_vld_out               // > output
 ,ack_ptr_out                   // > output
 ,ack_rtn_out                   // > output
 ,ack_inc_out                   // > output

 ,deskew_done_out               // > output
 ,lane_swap_out                 // > output
 ,linkup_out                    // > output
 ,tl_linkup_out                 // > output
 ,dlx_config_info               // > output
 ,cfg_transmit_order            // --  < input

 ,rx_clk_in                     // < input  std_ulogic

//--  ,gnd                           // <> inout
//--  ,vdn                           // <> inout
);

//!! Bugspray Include : ocx_dlx_rx_main ;

input           reset;                  //-- reset from tx delayed one cycle
input           training_enable;        //-- training enable from tx delayed one cycle to line up with data passed to lanes
input           train_ts2;              //-- training is in ts2 -- needed for retraining of the link to look for new data flits coming in
input           train_ts67;             //-- training is in state 6 or 7

input [63:0]    ln0_data;               //-- data from phy, passed through the lane macro
input [63:0]    ln1_data;
input [63:0]    ln2_data;
input [63:0]    ln3_data;
input [63:0]    ln4_data;
input [63:0]    ln5_data;
input [63:0]    ln6_data;
input [63:0]    ln7_data;
input [7:0]     data_flit;              //-- data flit (header "01") seen on each lane
input [7:0]     disabled_lanes;         //-- if running in degraded mode (N/A for now)
input [7:0]     ctl_header;             //-- indicate that we received a control sync header

input [7:0]     deskew_valid;           //-- data in each lane's deskew buffer (deskew block received)
input [7:0]     deskew_overflow;        //-- lane's deskew buffer overflowed; tell all lanes to reset deskew buffer
output          deskew_all_valid_l0;       //-- all lanes have valid data/will return valid data this cycle
output          deskew_all_valid_l1;       //-- all lanes have valid data/will return valid data this cycle
output          deskew_all_valid_l2;       //-- all lanes have valid data/will return valid data this cycle
output          deskew_all_valid_l3;       //-- all lanes have valid data/will return valid data this cycle
output          deskew_all_valid_l4;       //-- all lanes have valid data/will return valid data this cycle
output          deskew_all_valid_l5;       //-- all lanes have valid data/will return valid data this cycle
output          deskew_all_valid_l6;       //-- all lanes have valid data/will return valid data this cycle
output          deskew_all_valid_l7;       //-- all lanes have valid data/will return valid data this cycle
output          deskew_reset;           //-- reset lanes' deskew buffers

output [511:0]  flit_out;               //-- give tl flit data
output          valid_out;              //-- tell tl flit is valid
output          tlx_crc_error;          //-- tell tl crc error (discard collected corrupted data flits)
output          tx_crc_error;           //-- tell tx crc error
input  [7:0]    rx_TS1;                 //-- see a TS1 packet
output          rx_tx_retrain;          //-- tell tx to retrain
output          x4_rx_good_evens;       //-- tell lane to hold data
output          x4_rx_good_odds;        //-- tell lane to hold data

output          nack_out;               //-- nack field from replay flit
output          ack_ptr_vld_out;        //-- ack pointer valid on replay flits
output [6:0]    ack_ptr_out;            //-- pass the acknowledge sequence number to the tx (where tx should start replaying from)
output [4:0]    ack_rtn_out;            //-- tell tx how many good flits we've received (acks to send to the other side)
output [3:0]    ack_inc_out;            //-- tell tx how many good flits we've received (acks to send to the other side)

output          deskew_done_out;        //-- 8 in a row aligned and matching deskew blocks detected across all lanes
output          lane_swap_out;          //-- lanes don't match their numbers
output          linkup_out;             //-- link is done training
output          tl_linkup_out;          //-- link is done training
output [31:0]   dlx_config_info;   
input           cfg_transmit_order;

input           rx_clk_in;              //-- clock

//-- inout gnd;
//-- (* GROUND_PIN="1" *)
//-- wire gnd;

//-- inout vdn;
//-- (* POWER_PIN="1" *)
//-- wire vdn;

//----------------------------------- declarations -------------------------------------------
reg  [511:0]    flit_q ;                 //-- concatenated full flit
reg  [35:0]     crc_bits0_q;            //-- crc bits to carry over
reg  [35:0]     crc_bits1_q;            //-- crc bits to carry over
reg             crc_init_q;             //-- clear crc carry over
reg  [3:0]      run_length_q;           //-- run length counter
reg             flit_vld_q;             //-- flit is valid, ready to output
reg             tlx_crc_error_q;        //-- tell tlx of crc error
reg             tx_crc_error_q;         //-- tell tx of crc error
reg             replay_pending_q;       //-- replay is pending
reg             replay_ip_q;            //-- replay in progress

reg  [6:0]      rx_ack_ptr_q;           //-- ack pointer from replay flit
reg  [6:0]      rx_curr_ptr_q;          //-- current receive pointer
reg             nack_q;                 //-- latch nack field to output
reg             tx_ack_ptr_vld_q;       //-- latch ack pointer valid to output
reg  [6:0]      tx_ack_ptr_q;           //-- latch ack pointer to output
reg  [4:0]      tx_ack_rtn_q;           //-- latch ack return field (acks sent by other side) to output
reg  [3:0]      ack_cnt_q;              //-- internal count of flits received, including data flits not yet crc checked
reg  [3:0]      tx_ack_inc_q;           //-- latch ack increase field (acks to send to other side) to output
reg             deskew_reset_q;         //-- tell lanes to reset their deskew buffers since one of them overflowed
reg  [63:0]     ln0_data_d1_q; 
reg  [63:0]     ln1_data_d1_q;
reg  [4:0]      ln2_data_d1_q;
reg  [4:0]      ln3_data_d1_q;
reg             deskew_all_valid_d1_q; 
reg             deskew_all_valid_q;     //-- tell lanes to return valid data since all have indicated they have valid data
reg             deskew_all_valid_l0_q;     //-- tell lanes to return valid data since all have indicated they have valid data
reg             deskew_all_valid_l1_q;     //-- tell lanes to return valid data since all have indicated they have valid data
reg             deskew_all_valid_l2_q;     //-- tell lanes to return valid data since all have indicated they have valid data
reg             deskew_all_valid_l3_q;     //-- tell lanes to return valid data since all have indicated they have valid data
reg             deskew_all_valid_l4_q;     //-- tell lanes to return valid data since all have indicated they have valid data
reg             deskew_all_valid_l5_q;     //-- tell lanes to return valid data since all have indicated they have valid data
reg             deskew_all_valid_l6_q;     //-- tell lanes to return valid data since all have indicated they have valid data
reg             deskew_all_valid_l7_q;     //-- tell lanes to return valid data since all have indicated they have valid data
reg  [7:0]      replay_deskew_cntr_q ;   //-- count 127 cycles between replay request (crc error) and replay starting before raising crc error again, or count 8 matching deskew blocks on all lanes during training
reg  [23:5]     prev_deskew_q;          //-- info from previous deskew block, for comparison
reg             deskew_done_q;          //-- have found 8 in a row matching deskew blocks, aligned on all lanes
reg             lane_swap_q;            //-- lanes are in reverse order
reg             linkup_q;               //-- link is done training and ready to go
reg             tl_linkup_q;               //-- link is done training and ready to go
reg             link_is_tl_q;               //-- link is done training and ready to go
reg             link_is_tl_d1_q;            //-- link is done training and ready to go
reg             link_is_tl_d2_q;            //-- link is done training and ready to go
reg             link_is_tl_d3_q;            //-- link is done training and ready to go
wire [511:0]    flit_din;
wire [511:0]    flit_to_tl_din;
reg  [511:0]    flit_to_tl_q;
wire [35:0]     crc_bits, crc_bits0_din, crc_bits1_din;
wire [35:0]     crc_bits0_out, crc_bits1_out;
wire            crc_init_din;
wire [3:0]      run_length_din;
wire            flit_vld_din;
wire            tlx_crc_error_din;
wire            tx_crc_error_din;
wire            replay_pending_din;
wire            replay_ip_din;
wire [31:0]     dlx_config_din;
reg  [31:0]     dlx_config_q;
wire [7:0]      dlx_link_error_din;
reg  [7:0]      dlx_link_error_q;
wire [7:0]      disabled_lanes_din;
reg  [7:0]      disabled_lanes_q;
wire            good_evens_only_din;
reg             good_evens_only_q;
wire            good_odds_only_din;
reg             good_odds_only_q;
wire            x4_not_x8_rx_mode_din;
reg             x4_not_x8_rx_mode_q;
wire            flit_cycle_odd_din;
reg             flit_cycle_odd_q;
wire            is_crc_data_flit_din;
reg             is_crc_data_flit_q;
wire [6:0]      rx_ack_ptr_din;
wire [6:0]      rx_curr_ptr_din;
wire            nack_din;
wire            tx_ack_ptr_vld_din;
wire [6:0]      tx_ack_ptr_din;
wire [4:0]      tx_ack_rtn_din;
wire [3:0]      ack_cnt_din;
wire [3:0]      tx_ack_inc_din;
wire            deskew_reset_din;
wire [63:0]     ln0_data_d1_din; 
wire [63:0]     ln1_data_d1_din;
wire [4:0]      ln2_data_d1_din;
wire [4:0]      ln3_data_d1_din;
wire            deskew_all_valid_d1_din; 
wire            deskew_all_valid_din;
wire            deskew_all_valid_l0_din;
wire            deskew_all_valid_l1_din;
wire            deskew_all_valid_l2_din;
wire            deskew_all_valid_l3_din;
wire            deskew_all_valid_l4_din;
wire            deskew_all_valid_l5_din;
wire            deskew_all_valid_l6_din;
wire            deskew_all_valid_l7_din;
wire [7:0]      replay_deskew_cntr_din;
wire [23:5]     prev_deskew_din;
wire            deskew_done_din;
wire            lane_swap_din;
wire            linkup_din;
wire            tl_linkup_din;
wire            link_is_tl_din;
wire            link_is_tl_d1_din;
wire            link_is_tl_d2_din;
wire            link_is_tl_d3_din;
wire            retrain_din;
reg             retrain_q;
wire            retrain_d1_din;
reg             retrain_d1_q;
wire            retrain_d2_din;
reg             retrain_d2_q;
wire            retrain_d3_din;
reg             retrain_d3_q;
wire [511:0]    flit;                   //-- concatenated full flit, before latching
wire            master_valid;           //-- flit is valid
wire            master_valid_din;
reg             master_valid_q;
wire            master_valid_dly_din;
reg             master_valid_dly_q;
wire [3:0]      num_good_flits_rcvd;    //-- internal count of good flits received (crc checked)
wire            replay_pending;         //-- replay requested
wire            replay_ip;              //-- replay in progress
wire            crc_nonzero;            //-- crc bits non-zero flag
// wire [3:0]      crc_nonzero_din;
// reg  [3:0]      crc_nonzero_q;
wire            nack_dly_din;
reg             nack_dly_q;
wire            crc_error;
wire            is_data_flit;           //-- data flit
wire            is_ctrl_flit;           //-- control flit w/ valid crc
wire            is_dl2dl_flit;          //-- dl2dl flit w/ valid crc
wire            is_replay_flit;         //-- replay flit w/ valid crc
wire            is_idle_flit;
wire            are_deskew;             //-- deskew blocks found on all lanes this cycle
wire            matching_deskew;        //-- matching deskew blocks found on all lanes this cycle
wire            good_odds;
wire            good_evens;
wire            valid_crc_din;
wire            is_crc_data_flit;
wire  [3:0]     sum_ctl_headers;
wire  [15:0]    crc_error_cntr_din;
wire            start_cycle;
reg [15:0] crc_error_cntr_q; 
//----------------------------------- end declarations -------------------------------------------
//-- Dataflow == ln?_data(input) -> flit -> flit_q -> flit_to_tl_q -> flit_out (output)

//--assign flit[511:0] =  cfg_transmit_order ? {ln7_data[63:0] , ln6_data[63:0] , ln5_data[63:0] , ln4_data[63:0] , ln3_data[63:0] , ln2_data[63:0] , ln1_data[63:0] , ln0_data[63:0] } :
//--                                           {ln7_data[63:48], ln6_data[63:48], ln5_data[63:48], ln4_data[63:48], ln3_data[63:48], ln2_data[63:48], ln1_data[63:48], ln0_data[63:48],
//--                                            ln7_data[47:32], ln6_data[47:32], ln5_data[47:32], ln4_data[47:32], ln3_data[47:32], ln2_data[47:32], ln1_data[47:32], ln0_data[47:32],
//--                                            ln7_data[31:16], ln6_data[31:16], ln5_data[31:16], ln4_data[31:16], ln3_data[31:16], ln2_data[31:16], ln1_data[31:16], ln0_data[31:16],
//--                                            ln7_data[15:00], ln6_data[15:00], ln5_data[15:00], ln4_data[15:00], ln3_data[15:00], ln2_data[15:00], ln1_data[15:00], ln0_data[15:00]};
assign flit[511:0] =  {ln7_data[63:0] , ln6_data[63:0] , ln5_data[63:0] , ln4_data[63:0] , ln3_data[63:0] , ln2_data[63:0] , ln1_data[63:0] , ln0_data[63:0] } ;

assign deskew_all_valid_d1_din = deskew_all_valid_q;
assign ln0_data_d1_din[63:0]   = ln0_data[63:0];
assign ln1_data_d1_din[63:0]   = ln1_data[63:0];
assign ln2_data_d1_din[4:0]    = ln2_data[4:0];
assign ln3_data_d1_din[4:0]    = ln3_data[4:0];
//-- need a cycle to check CRC and have output gate other signals
assign flit_din[511:0] = flit[511:0];

assign flit_to_tl_din[511:0] = is_data_flit ? flit_q[511:0]:
                                              {46'b0, flit_q[465:0]};
//-- outputs
assign flit_out[511:0] = flit_to_tl_q[511:0];

//-- flit_cycle_odd_q = 0:   This is when the flit_q data is valid when x4_not_x8_rx_mode_q = 1 (only using 1/2 of the input lanes)
//-- 8/14 make data_flit fault tolerent only need some of them to be found.
assign start_cycle =  (({data_flit[7], data_flit[5], data_flit[3], data_flit[1]} == 4'b1000) |               //-- stay on if 1 glitches high
                       ({data_flit[7], data_flit[5], data_flit[3], data_flit[1]} == 4'b0100) |
                       ({data_flit[7], data_flit[5], data_flit[3], data_flit[1]} == 4'b0010) |
                       ({data_flit[7], data_flit[5], data_flit[3], data_flit[1]} == 4'b0001) |
                       ({data_flit[7], data_flit[5], data_flit[3], data_flit[1]} == 4'b0000) |
                       ({data_flit[6], data_flit[4], data_flit[2], data_flit[0]} == 4'b1000) |
                       ({data_flit[6], data_flit[4], data_flit[2], data_flit[0]} == 4'b0100) |
                       ({data_flit[6], data_flit[4], data_flit[2], data_flit[0]} == 4'b0010) |
                       ({data_flit[6], data_flit[4], data_flit[2], data_flit[0]} == 4'b0001) |
                       ({data_flit[6], data_flit[4], data_flit[2], data_flit[0]} == 4'b0000)) &               //-- go off even if one glitches low
                     ~(({data_flit[7], data_flit[5], data_flit[3], data_flit[1]} == 4'b1110) |
                       ({data_flit[7], data_flit[5], data_flit[3], data_flit[1]} == 4'b0111) |
                       ({data_flit[7], data_flit[5], data_flit[3], data_flit[1]} == 4'b1011) |
                       ({data_flit[7], data_flit[5], data_flit[3], data_flit[1]} == 4'b1101) |
                       ({data_flit[7], data_flit[5], data_flit[3], data_flit[1]} == 4'b1111) |
                       ({data_flit[6], data_flit[4], data_flit[2], data_flit[0]} == 4'b1110) |
                       ({data_flit[6], data_flit[4], data_flit[2], data_flit[0]} == 4'b0111) |
                       ({data_flit[6], data_flit[4], data_flit[2], data_flit[0]} == 4'b1011) |
                       ({data_flit[6], data_flit[4], data_flit[2], data_flit[0]} == 4'b1101) |
                       ({data_flit[6], data_flit[4], data_flit[2], data_flit[0]} == 4'b1111));

assign flit_cycle_odd_din = start_cycle                     ? 1'b0:                        //-- tsm_q = 110
                             master_valid                   ? ~flit_cycle_odd_q:
                                                               flit_cycle_odd_q;

//-- Tell 1/2 of the ocx_dlx_lane.v logic to send through data from the other half when in x4_not_x8_rx_mode
assign x4_rx_good_evens =  good_evens_only_q ; 
assign x4_rx_good_odds  =  good_odds_only_q ; 

//-- only check crc during the 64 of 66 cycles in x8 mode, and only every other of the 64 of 66 cycles when in x4 mode.
assign valid_crc_din = (flit_cycle_odd_q & master_valid) | ~x4_not_x8_rx_mode_q;

//-- Eventually this will tell TL the data is good

//-------------------------------- crc --------------------------------------------------
ocx_dlx_crc crc_mod (
  .init                 (crc_init_q)
 ,.checkbits_in         (crc_bits)
 ,.data                 (flit[511:0])
 ,.checkbits0_out        (crc_bits0_out[35:0])
 ,.checkbits1_out        (crc_bits1_out[35:0])

);

assign crc_bits = crc_bits0_q ^ crc_bits1_q;

//-- hold crc bits during data flits, crc is only checked on the following command flit
assign crc_bits0_din[35:0] =                                                                    reset ? 36'h000000000:
                             master_valid & valid_crc_din & (flit_cycle_odd_q | ~x4_not_x8_rx_mode_q) ? crc_bits0_out[35:0]:
                                                                                                        crc_bits0_q[35:0];       //-- if this cycle valid, use it, else carry over bits for next cycle
assign crc_bits1_din[35:0] =                                                                    reset ? 36'h000000000:
                             master_valid & valid_crc_din & (flit_cycle_odd_q | ~x4_not_x8_rx_mode_q) ? crc_bits1_out[35:0]:
                                                                                                        crc_bits1_q[35:0];       //-- if this cycle valid, use it, else carry over bits for next cycle


//-- Must know to zero crc before we fully decode flit data, so grab this a cycle early
assign is_crc_data_flit   = ~x4_not_x8_rx_mode_q ?                     (run_length_din[3:0] != 4'b0000):                                                 //-- run length isn't 0 -> data flit
                                                   flit_cycle_odd_q  & (run_length_q[3:0]   != 4'b0000);                                           

//-- must keep this around longer in case master_valid causes a hiccup
assign is_crc_data_flit_din = master_valid ? is_crc_data_flit:
                                             is_crc_data_flit_q;

//-- gates above crc_bits_q inside of crc block, just zero them out when you start a new crc group
//-- was detecting crc errors before link was up
assign crc_init_din = (master_valid & ~is_crc_data_flit & ~(is_crc_data_flit_q & x4_not_x8_rx_mode_q)) | reset | ~link_is_tl_d3_q;        //-- valid non-data flit (including crc errors) -> clear crc bits

//assign crc_nonzero_din = crc_nonzero & linkup_q;
assign crc_nonzero = (|crc_bits) & linkup_q;

assign crc_error          =  ~x4_not_x8_rx_mode_q ?                      master_valid_q & ~is_crc_data_flit_q & crc_nonzero:     //-- valid non-data flit with failed crc -> actual crc error
                                                    ~flit_cycle_odd_q & (master_valid_q & ~is_crc_data_flit_q & crc_nonzero);    //-- valid non-data flit with failed crc -> actual crc error

assign replay_pending     = ~is_replay_flit & (crc_error | replay_pending_q) & ~reset;                      //-- 0 if replay flit, 1 if crc error, else keep past value

assign replay_ip          = is_replay_flit | (replay_ip_q & (rx_curr_ptr_q[6:0] != rx_ack_ptr_q[6:0]));     //-- 1 if replay flit or replay in progress and not to current pointer yet

//--assign replay_ip          = is_replay_flit | (replay_ip_q & (rx_curr_ptr_din[6:0] != rx_ack_ptr_q[6:0]));     //-- 1 if replay flit or replay in progress and not to current pointer yet

assign replay_pending_din = replay_pending;
assign replay_ip_din      = replay_ip;

assign flit_vld_din       = (is_data_flit | is_ctrl_flit) & ~(replay_pending | replay_ip) & linkup_q ;      //-- valid only if data flit or control flit, with no replay pending or in progress
assign crc_error_cntr_din[15:0] = reset     ? 16'h0000 :
                                  crc_error ? crc_error_cntr_q[15:0] + 16'h0001 :
                                              crc_error_cntr_q[15:0];

//-- assign flit_vld_din       = (is_data_flit | is_ctrl_flit) & ~(replay_pending | replay_ip_q | replay_ip);      //-- valid only if data flit or control flit, with no replay pending or in progress
assign tlx_crc_error_din  = is_replay_flit | crc_error;                                         //-- 1 if replay flit or actual crc error  
assign tx_crc_error_din   = crc_error | (replay_pending_q & (&(replay_deskew_cntr_q[7:0])));    //-- 1 if actual crc error, or timed out since replay request

//-- outputs
//-- Eventually this will tell TL the data is good
assign valid_out        = flit_vld_q;
assign tlx_crc_error    = tlx_crc_error_q;
assign tx_crc_error     = tx_crc_error_q;

//------------------------------ replay fields -------------------------------------------------
//-- nack 
assign nack_din            = (is_replay_flit & flit_q[468]);           //-- make 1 if replay flit with nack
assign tx_ack_ptr_vld_din  = is_replay_flit;                            //-- make 1 if replay flit
assign tx_ack_ptr_din[6:0] = {7{is_replay_flit}} & flit_q[422:416];     //-- acknowledgement sequence number's last 7 bits are ack pointer if replay flit

assign tx_ack_rtn_din[4:0] = ((is_ctrl_flit | is_dl2dl_flit) & ~replay_pending_q & train_ts67)  ? flit_q[475:471]:
                                                                                                  5'b0;           //-- ctrl/dl2tl flit -> output ack count field, otherwise no acks

//-- Note: ack count field is always 0 on replay flits so acks cannot be counted more than once

assign ack_cnt_din[3:0] = (~reset & is_data_flit)                  ? (ack_cnt_q[3:0] + 4'b0001) :  //-- data flit -> increment ack count
                          (x4_not_x8_rx_mode_q & flit_cycle_odd_q) ? ack_cnt_q[3:0]:               //-- hold when not a valid cycle         
                          (~reset & ~master_valid_q)               ? ack_cnt_q[3:0] :              //-- invalid -> carry over past value
                                                                     4'b0;                                                 //-- default (including ctrl/dl2dl flits and crc errors) -> zero

assign num_good_flits_rcvd[3:0] = (~reset & is_ctrl_flit & linkup_q) ? (ack_cnt_q[3:0] + 4'b0001) :                    //-- ctrl flit w/ crc 0 -> accumulated flits were good
                                                                        4'b0;                                           //-- default, including invalid and data/dl2dl flits and crc errors -> zero

assign tx_ack_inc_din[3:0] = ( ~(replay_pending | replay_ip) & master_valid_q ) ? num_good_flits_rcvd[3:0] :
                                                                                4'b0;                       //-- no replay pending/progress -> output accumulated acks to tx, otherwise 0

//--Note: since tx_ack_inc and num_good_flits_received will be 0 if ~master_valid, we don't have to handle master_valid here
assign rx_ack_ptr_din[6:0] = {7{~reset}} & (rx_ack_ptr_q[6:0] + {3'b0, tx_ack_inc_din[3:0]});              //-- add accumulated acks (clear on reset)
assign rx_curr_ptr_din[6:0] = reset            ? 7'b0 :                                                    //-- reset to 0
                              (is_replay_flit) ? flit_q[438:432] :                                         //-- replay flit -> copy starting pointer
                                                 (rx_curr_ptr_q[6:0] + {3'b0, num_good_flits_rcvd[3:0]});  //-- default -> add accumulated acks

//-- outputs
assign nack_out   =  master_valid_dly_q ? nack_q:      //-- don't break sending nacks just because of a stall in the middle. (it looks like two then)
                                          nack_dly_q;

assign nack_dly_din = master_valid_dly_q ? nack_q:
                                           nack_dly_q; 

assign ack_ptr_vld_out          = tx_ack_ptr_vld_q & train_ts67;
assign ack_ptr_out[6:0]         = tx_ack_ptr_q[6:0];
assign ack_rtn_out[4:0]         = tx_ack_rtn_q[4:0];
assign ack_inc_out[3:0]         = tx_ack_inc_q[3:0];

//--******************************************************************************************************
//-- this is training, not really building flits yet, look at each lane

//-- Note: with these signals latched here, data will sit in lane deskew buffers for at least one cycle, so read pointer cannot pass write pointer and data is latched before output to rx
assign deskew_reset_din = |(deskew_overflow[7:0] & ~disabled_lanes_q[7:0]) | reset;              //-- if any lane overflows or re-training begins, reset deskew buffers

assign deskew_all_valid_l0_din = &(deskew_valid[7:0] | disabled_lanes_q[7:0]) & ~deskew_reset_din; //-- if all lanes have data, allow lanes to return data
assign deskew_all_valid_l1_din = &(deskew_valid[7:0] | disabled_lanes_q[7:0]) & ~deskew_reset_din; //-- if all lanes have data, allow lanes to return data
assign deskew_all_valid_l2_din = &(deskew_valid[7:0] | disabled_lanes_q[7:0]) & ~deskew_reset_din; //-- if all lanes have data, allow lanes to return data
assign deskew_all_valid_l3_din = &(deskew_valid[7:0] | disabled_lanes_q[7:0]) & ~deskew_reset_din; //-- if all lanes have data, allow lanes to return data
assign deskew_all_valid_l4_din = &(deskew_valid[7:0] | disabled_lanes_q[7:0]) & ~deskew_reset_din; //-- if all lanes have data, allow lanes to return data
assign deskew_all_valid_l5_din = &(deskew_valid[7:0] | disabled_lanes_q[7:0]) & ~deskew_reset_din; //-- if all lanes have data, allow lanes to return data
assign deskew_all_valid_l6_din = &(deskew_valid[7:0] | disabled_lanes_q[7:0]) & ~deskew_reset_din; //-- if all lanes have data, allow lanes to return data
assign deskew_all_valid_l7_din = &(deskew_valid[7:0] | disabled_lanes_q[7:0]) & ~deskew_reset_din; //-- if all lanes have data, allow lanes to return data
assign deskew_all_valid_din = &(deskew_valid[7:0] | disabled_lanes_q[7:0]) & ~deskew_reset_din; //-- if all lanes have data, allow lanes to return data 

assign are_deskew = good_evens ? deskew_all_valid_d1_q & (ln0_data_d1_q[63:24] == 40'h4B1E1E1E1E):           //-- all lanes are deskew blocks
                                 deskew_all_valid_d1_q & (ln1_data_d1_q[63:24] == 40'h4B1E1E1E1E);

assign matching_deskew = good_evens ? are_deskew & (ln0_data_d1_q[23:5] == prev_deskew_q[23:5]):          //-- all lanes are deskew blocks and info matches last time
                                      are_deskew & (ln1_data_d1_q[23:5] == prev_deskew_q[23:5]);

assign prev_deskew_din[23:5] = (good_evens & are_deskew) ? ln0_data_d1_q[23:5] :       //-- update previous deskew data with new data if are deskew blocks, else maintain previous value, clear on reset
                                              are_deskew ? ln1_data_d1_q[23:5] :
                                                           (prev_deskew_q[23:5] & {19{~reset}});

assign replay_deskew_cntr_din[7:0] = (reset | (replay_pending_din & ~replay_pending_q))       ? 8'b0 :                                       //-- re-train, or replay pending newly raised -> clear counter
                                     ((training_enable & matching_deskew) | (replay_pending)) ? (replay_deskew_cntr_q[7:0] + 8'b00000001) :  //-- training and matching deskew, or replay pending -> increment counter
                                                                                                 replay_deskew_cntr_q[7:0];                  //-- default, including invalid cycles -> maintain previous value

//-- Note: tx deskew done is set when the lanes are aligned and 8 matching deskew blocks have been received
assign deskew_done_din = ((deskew_all_valid_q & (&(replay_deskew_cntr_q[2:0]))) | deskew_done_q) & ~reset;   //-- set when all lanes aligned and counter reaches 7 (8 matching blocks received), hold unless re-train
                



assign lane_swap_din = ~reset & ( lane_swap_q | (matching_deskew &                                                      //-- set when lanes are in reverse order, hold unless reset
                                ((good_evens & (ln0_data_d1_q[4:0] == 5'b00111)  & (ln2_data_d1_q[4:0] == 5'b00101)) | (good_odds & (ln1_data_d1_q[4:0] == 5'b00110) & (ln3_data_d1_q[4:0] == 5'b00100))) ));

assign linkup_din     = ~(reset | (retrain_q & retrain_d1_q & retrain_d2_q)) & (linkup_q | ((&(data_flit[7:0] | disabled_lanes_q[7:0])) & train_ts67));                        //-- linkup is used internally
assign tl_linkup_din  = ~reset & (tl_linkup_q | ( (&(data_flit[7:0] | disabled_lanes_q[7:0]))  & train_ts67) );                                  //-- linkup is sent to the TL 

assign link_is_tl_din    = ~reset & ~train_ts2 & (link_is_tl_q | (train_ts67 & ~start_cycle));       //-- all lanes up and seeing data flits (initial ipl and retraining of the link)
assign link_is_tl_d1_din = reset ? 1'b0 : deskew_all_valid_q ? link_is_tl_q    : link_is_tl_d1_q;
assign link_is_tl_d2_din = reset ? 1'b0 : deskew_all_valid_q ? link_is_tl_d1_q : link_is_tl_d2_q;
assign link_is_tl_d3_din = reset ? 1'b0 : deskew_all_valid_q ? link_is_tl_d2_q : link_is_tl_d3_q;


//-- 8/8 look for >1 ctl_headers ... ctl_header[x] is '10'b was the header
assign sum_ctl_headers[3:0] = {3'b000, (ctl_header[7] & ~disabled_lanes_q[7])} +
                              {3'b000, (ctl_header[6] & ~disabled_lanes_q[6])} +
                              {3'b000, (ctl_header[5] & ~disabled_lanes_q[5])} +
                              {3'b000, (ctl_header[4] & ~disabled_lanes_q[4])} +
                              {3'b000, (ctl_header[3] & ~disabled_lanes_q[3])} +
                              {3'b000, (ctl_header[2] & ~disabled_lanes_q[2])} +
                              {3'b000, (ctl_header[1] & ~disabled_lanes_q[1])} +
                              {3'b000, (ctl_header[0] & ~disabled_lanes_q[0])};

assign retrain_din    = (link_is_tl_q     & (|sum_ctl_headers[3:1]) & ~training_enable) | (train_ts67 & ~link_is_tl_q & (|(ctl_header[7:0] & rx_TS1[7:0] & ~disabled_lanes_q[7:0])));
assign retrain_d1_din = retrain_q;   
assign retrain_d2_din = retrain_d1_q;
assign retrain_d3_din = retrain_d2_q;

assign rx_tx_retrain = retrain_q & retrain_d1_q & retrain_d2_q;

//--  mux data out of even/odd sets for degraded mode.
assign disabled_lanes_din = disabled_lanes;

assign good_odds                   = ~(disabled_lanes_q[7] | disabled_lanes_q[5] | disabled_lanes_q[3] | disabled_lanes_q[1]); 
assign good_evens                  = ~(disabled_lanes_q[6] | disabled_lanes_q[4] | disabled_lanes_q[2] | disabled_lanes_q[0]); 

assign good_odds_only_din          = reset ? 1'b0 :
                                             good_odds & ~good_evens;

assign good_evens_only_din         = reset ? 1'b0 :
                                             good_evens & ~good_odds;

assign x4_not_x8_rx_mode_din       = good_odds_only_q || good_evens_only_q;

//-- outputs
assign deskew_all_valid_l0 = deskew_all_valid_l0_q;
assign deskew_all_valid_l1 = deskew_all_valid_l1_q;
assign deskew_all_valid_l2 = deskew_all_valid_l2_q;
assign deskew_all_valid_l3 = deskew_all_valid_l3_q;
assign deskew_all_valid_l4 = deskew_all_valid_l4_q;
assign deskew_all_valid_l5 = deskew_all_valid_l5_q;
assign deskew_all_valid_l6 = deskew_all_valid_l6_q;
assign deskew_all_valid_l7 = deskew_all_valid_l7_q;
assign deskew_reset        = deskew_reset_q;
assign deskew_done_out     = deskew_done_q;
assign lane_swap_out       = lane_swap_q;
assign linkup_out          = linkup_q;
assign tl_linkup_out       = tl_linkup_q;


//--******************************************************************************************************
//-- Note: deskew_all_valid_q is a command for the lanes to provide valid data this cycle, and rx doesn't need to look at lane data directly during training

assign master_valid         = deskew_all_valid_q & link_is_tl_d3_q & ~reset;
assign master_valid_din     = master_valid;
assign master_valid_dly_din = master_valid_q;

assign is_data_flit   = ~x4_not_x8_rx_mode_q ?                     master_valid_q & linkup_q & (run_length_q[3:0] != 4'b0000):                                                 //-- run length isn't 0 -> data flit
                                               ~flit_cycle_odd_q & master_valid_q & linkup_q & (run_length_q[3:0] != 4'b0000);                                           

assign is_ctrl_flit   = ~x4_not_x8_rx_mode_q ?                     master_valid_q & linkup_q & ~crc_error & (run_length_q[3:0] == 4'b0000) & (flit_q[451:448] <= 4'b1000):     //-- run length 0, run length field valid -> ctrl flit
                                               ~flit_cycle_odd_q & master_valid_q & linkup_q & ~crc_error & (run_length_q[3:0] == 4'b0000) & (flit_q[451:448] <= 4'b1000);  

assign is_dl2dl_flit  = ~x4_not_x8_rx_mode_q ?                     master_valid_q & linkup_q & ~crc_error & (run_length_q[3:0] == 4'b0000) & (flit_q[451:448] > 4'b1000):      //-- run length 0, run length field invalid -> dl2dl flit
                                               ~flit_cycle_odd_q & master_valid_q & linkup_q & ~crc_error & (run_length_q[3:0] == 4'b0000) & (flit_q[451:448] > 4'b1000);   

assign is_replay_flit = ~x4_not_x8_rx_mode_q ?                     master_valid_q & linkup_q & ~crc_error & (run_length_q[3:0] == 4'b0000) & (flit_q[451:448] == 4'hA):        //-- run length 0, run length field "A" -> replay flit
                                               ~flit_cycle_odd_q & master_valid_q & linkup_q & ~crc_error & (run_length_q[3:0] == 4'b0000) & (flit_q[451:448] == 4'hA);  

assign is_idle_flit   = ~x4_not_x8_rx_mode_q ?                     master_valid_q & linkup_q & ~crc_error & (run_length_q[3:0] == 4'b0000) & (flit_q[451:448] == 4'hF):        //-- run length 0, run length field "A" -> replay flit
                                               ~flit_cycle_odd_q & master_valid_q & linkup_q & ~crc_error & (run_length_q[3:0] == 4'b0000) & (flit_q[451:448] == 4'hF);  

//--   clear the run_length when we are (re)training
assign run_length_din[3:0] = ~train_ts67                                  ? 4'b0000:                        //-- clear the run length during a training/retraining
                             is_data_flit                                 ? (run_length_q[3:0] - 4'b0001):  //-- data flit -> decrement run length, otherwise...
                             is_ctrl_flit & ~flit_q[467]                  ? flit_q[451:448]:                //-- ctrl flit -> set run length from lane data, otherwise...
                             is_replay_flit & ~flit_q[467]                ? flit_q[455:452]:                //-- replay flit -> set run length from previous run length field, otherwise...
                             is_idle_flit & ~(flit_q[455:452] == 4'b0000) ? flit_q[455:452]:                //-- idle, if this interrupted a cmd to data exchange, this will hold the length
                             ~master_valid_q & ~reset                     ? run_length_q[3:0]:              //-- this cycle not valid (hiccup) -> carry over past value
                             flit_cycle_odd_q                             ? run_length_q[3:0]:              //-- not a valid cycle in x4 mode... hold to next valid cycle
                                                                            4'b0000;                        //-- default (including dl2dl flits, crc errors, reset, and training) -> 0


//--******************************************************************************************************
//-- Send info to TX
assign dlx_link_error_din[7:0] = is_replay_flit ? flit_q[463:456]:
                                                  dlx_link_error_q[7:0];

assign dlx_config_din[31:0] = is_replay_flit ? flit_q[415:384]:
                                               dlx_config_q[31:0];

assign dlx_config_info[31:0] = dlx_config_q[31:0];

always @(posedge rx_clk_in) begin
flit_q[511:0]              <= flit_din[511:0];
flit_to_tl_q[511:0]        <= flit_to_tl_din[511:0];
flit_cycle_odd_q           <= flit_cycle_odd_din;
crc_bits0_q[35:0]          <= crc_bits0_din[35:0];
crc_bits1_q[35:0]          <= crc_bits1_din[35:0];
crc_init_q                 <= crc_init_din;
replay_pending_q           <= replay_pending_din;
replay_ip_q                <= replay_ip_din;
flit_vld_q                 <= flit_vld_din;
tlx_crc_error_q            <= tlx_crc_error_din;
tx_crc_error_q             <= tx_crc_error_din;
deskew_reset_q             <= deskew_reset_din;
deskew_all_valid_d1_q      <= deskew_all_valid_d1_din;
ln0_data_d1_q[63:0]        <= ln0_data_d1_din[63:0];
ln1_data_d1_q[63:0]        <= ln1_data_d1_din[63:0];
ln2_data_d1_q[4:0]         <= ln2_data_d1_din[4:0];
ln3_data_d1_q[4:0]         <= ln3_data_d1_din[4:0];
deskew_all_valid_q         <= deskew_all_valid_din;
deskew_all_valid_l0_q      <= deskew_all_valid_l0_din;
deskew_all_valid_l1_q      <= deskew_all_valid_l1_din;
deskew_all_valid_l2_q      <= deskew_all_valid_l2_din;
deskew_all_valid_l3_q      <= deskew_all_valid_l3_din;
deskew_all_valid_l4_q      <= deskew_all_valid_l4_din;
deskew_all_valid_l5_q      <= deskew_all_valid_l5_din;
deskew_all_valid_l6_q      <= deskew_all_valid_l6_din;
deskew_all_valid_l7_q      <= deskew_all_valid_l7_din;
prev_deskew_q[23:5]        <= prev_deskew_din[23:5];
replay_deskew_cntr_q[7:0]  <= replay_deskew_cntr_din[7:0];
deskew_done_q              <= deskew_done_din;
lane_swap_q                <= lane_swap_din;
linkup_q                   <= linkup_din;
tl_linkup_q                <= tl_linkup_din;
link_is_tl_q               <= link_is_tl_din;
link_is_tl_d1_q            <= link_is_tl_d1_din;
link_is_tl_d2_q            <= link_is_tl_d2_din;
link_is_tl_d3_q            <= link_is_tl_d3_din;
retrain_q                  <= retrain_din;
retrain_d1_q               <= retrain_d1_din;
retrain_d2_q               <= retrain_d2_din;
retrain_d3_q               <= retrain_d3_din;
disabled_lanes_q           <= disabled_lanes_din;
good_evens_only_q          <= good_evens_only_din;
good_odds_only_q           <= good_odds_only_din;
x4_not_x8_rx_mode_q        <= x4_not_x8_rx_mode_din;
nack_q                     <= nack_din;
tx_ack_ptr_vld_q           <= tx_ack_ptr_vld_din;
tx_ack_ptr_q[6:0]          <= tx_ack_ptr_din[6:0];
tx_ack_rtn_q[4:0]          <= tx_ack_rtn_din[4:0];
ack_cnt_q[3:0]             <= ack_cnt_din[3:0];
tx_ack_inc_q[3:0]          <= tx_ack_inc_din[3:0];
rx_ack_ptr_q[6:0]          <= rx_ack_ptr_din[6:0];
rx_curr_ptr_q[6:0]         <= rx_curr_ptr_din[6:0];
run_length_q[3:0]          <= run_length_din[3:0];
dlx_config_q[31:0]         <= dlx_config_din[31:0];
dlx_link_error_q[7:0]      <= dlx_link_error_din[7:0];
is_crc_data_flit_q         <= is_crc_data_flit_din;
master_valid_q             <= master_valid_din;
master_valid_dly_q         <= master_valid_dly_din;
// crc_nonzero_q              <= crc_nonzero_din;
nack_dly_q                 <= nack_dly_din;
crc_error_cntr_q[15:0]     <= crc_error_cntr_din[15:0];
end

endmodule //-- ocx_dlx_rx_main
