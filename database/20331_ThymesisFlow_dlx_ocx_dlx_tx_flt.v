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
//-- TITLE:    ocx_dlx_tx_flt.v
//-- FUNCTION: Manages flits to be transmitted across the OpenCAPI link
//--           
//--
//------------------------------------------------------------------------

module ocx_dlx_tx_flt (

     dlx_reset                              // -- <  input 
    ,rx_tx_sync                             // -- <  input [7:0]
    ,rx_tx_lane_inverted                    // -- <  input [7:0]
    ,tlx_dlx_debug_encode                   // -- <  input [3:0]
    ,tlx_dlx_debug_info                     // -- <  input [31:0]
    ,ctl_flt_train_done                     // -- <  input 
    ,ctl_flt_stall                          // -- <  input 
    ,ctl_x4_not_x8_tx_mode                  // -- <  input
    ,ctl_que_tx_ts2                         // -- <  input
    ,pulse_1us                              // -- <  input 

 
    // --Signals to/from TL
    ,dlx_tlx_init_flit_depth                // --  > output [2:0]
    ,dlx_tlx_flit_credit                    // --  > output
    ,tlx_dlx_flit_valid                     // -- <  input
    ,tlx_dlx_flit                           // -- <  input  [511:0]
    ,cfg_transmit_order                     // --  < input

    // --Signals from RX
    ,rx_tx_crc_error                      // -- <  input
    ,rx_tx_nack                           // -- <  input
    ,rx_tx_rx_ack_inc                     // -- <  input  [3:0]
    ,rx_tx_tx_ack_rtn                     // -- <  input  [4:0]
    ,rx_tx_tx_ack_ptr_vld                 // -- <  input
    ,rx_tx_tx_ack_ptr                     // -- <  input  [6:0]

    // --Signals to RX
    ,tx_rx_reset                          // --  > output 
    ,error_no_fwd_progress                // --  > output 

    // --Signals to Queue
    ,flt_que_data                         // --  > output [511:0]

//--     ,gnd                                  // -- <> inout
//--     ,vdn                                  // -- <> inout
    ,dlx_clk                              // -- <  input
    );

    input          dlx_reset;               // -- Reset
    input  [7:0]   rx_tx_sync;
    input  [7:0]   rx_tx_lane_inverted;
    input  [3:0]   tlx_dlx_debug_encode;
    input  [31:0]  tlx_dlx_debug_info;

    input          ctl_flt_train_done;      // -- Signal for training done from control (level)
    input          ctl_flt_stall;           // -- Signal for stalling the data flow 2/66 cycles
    input          ctl_x4_not_x8_tx_mode;   // -- degraded mode on xmit
    input          ctl_que_tx_ts2;          // -- tsm_q = 5
    input          pulse_1us;               // -- 1 us pulse

    output [2:0]   dlx_tlx_init_flit_depth; // -- Static signal to TL indicated storage capacity of flit buffer
    output         dlx_tlx_flit_credit;     // -- Signal to TL that it can send another flit
    input          tlx_dlx_flit_valid;      // -- Incoming valid data from TL for flit buffer
    input  [511:0] tlx_dlx_flit;            // -- ECC from TL for flit buffer
    input          cfg_transmit_order;

    // --Signals from RX
    input          rx_tx_crc_error;         // -- Signaling crc error, need for nack                                               -send right away
    input          rx_tx_nack;              // -- Signalig p nack was received from the other side                                 -send right away
    input  [3:0]   rx_tx_rx_ack_inc;        // -- Saying how many to increment (to eventually send back to the other side)         -send right away
    input  [4:0]   rx_tx_tx_ack_rtn;        // -- Saying how many good flits the other side has seen (increment ack ptr in rpb)    -send right away
    input          rx_tx_tx_ack_ptr_vld;    // -- Signals replay                                                                   -signal repay, finish current flit first
    input  [6:0]   rx_tx_tx_ack_ptr;        // -- Address to start reading replays from

    // --Signal to RX
    output         tx_rx_reset;             // -- Reset the link and begin re-training
    output         error_no_fwd_progress;   // -- report that the frame buffer has packets to send, but we haven't made forward progress.
 
    // --Signal to Queues
    output [511:0] flt_que_data;            // -- Data sent to queues

    // --input dlx_clk;
    input          dlx_clk;

//--     inout gnd;
//--     (* GROUND_PIN="1" *)
//--     wire gnd;

//--     inout vdn;
//--     (* POWER_PIN="1" *)
//--     wire vdn;


//-- reverse functions
function [35:0] reverse36 (input [35:0] forward);
  integer i;
  for (i=0; i<=35; i=i+1)
    reverse36[35-i] = forward[i];
endfunction

    wire [511:0] flt_que_data_int;            // -- Data sent to queues

    wire [511:0] zeros = 512'h0;
    wire         reset_din; 
    wire         no_fwd_progress; 
    reg          reset_q;
    wire [1:0]   flit_type;  
    wire [1:0]   flit_type_din;  
    reg  [1:0]   flit_type_q;
    wire [3:0]   run_length_din;
    reg  [3:0]   run_length_q;
    wire         train_done;
    wire         train_done_din;
    reg          train_done_q;
    wire [7:0]   link_errors_din;
    reg  [7:0]   link_errors_q;
    wire [7:0]   lane_inverted_din;
    reg  [7:0]   lane_inverted_q;
    wire [7:0]   sync_was_detected_din;
    reg  [7:0]   sync_was_detected_q;
    wire [63:0]  link_info_din;
    reg  [63:0]  link_info_q;
    wire [6:0]   rx_ack_ptr_din;  
    reg  [6:0] rx_ack_ptr_q;
    wire [6:0]   tx_ack_ptr_din;
    reg  [6:0] tx_ack_ptr_q;
    wire [5:0]   no_progress_cnt_din;
    reg  [5:0]   no_progress_cnt_q;
    wire [5:0]   rtn_ack_cnt_din;   // -- count of rx flits received that need to be returned
    reg  [5:0]   rtn_ack_cnt_q;
    wire [5:0]   rtn_acks;  // -- actual acks returned in a cmd or replay flits
    wire         acks_sent;
    wire         max_ack_cnt;
    wire [1:0]   dl2dl_ack;
    wire         replay_start;
    wire         idle;
    wire         crc_zero_din;
    reg          crc_zero_q;
    wire         crc_zero_d1_din;
    reg          crc_zero_d1_q;
    wire         crc_zero_d2_din;
    reg          crc_zero_d2_q;
//--    wire         crc_zero_d3_din;
//--    reg          crc_zero_d3_q;
    wire         stall_d0_din;
    reg          stall_d0_q;
    wire         stall_d1_din;
    reg          stall_d1_q;
    wire         stall_d2_din;
    reg          stall_d2_q;
    wire         stall_d3_din;
    reg          stall_d3_q;
    wire         stall_d4_din;
    reg          stall_d4_q;
    wire         send_nack_din;
    reg          send_nack_q;
//--    wire         send_nack_d1_din;
//--    reg          send_nack_d1_q;
    wire [511:0] flit_buf0_data_din;
    wire [511:0] flit_buf1_data_din;
    wire [511:0] flit_buf2_data_din;
    wire [511:0] flit_buf3_data_din;
    reg  [511:0] flit_buf0_data_q;
    reg  [511:0] flit_buf1_data_q;
    reg  [511:0] flit_buf2_data_q;
    reg  [511:0] flit_buf3_data_q;
    wire [1:0]   flit_wr_ptr_din;
    reg  [1:0]   flit_wr_ptr_q;
    wire [1:0]   flit_rd_ptr_din;
    reg  [1:0]   flit_rd_ptr_q; 
    wire         flit_vld;
    wire         ftb_empty;
    wire         flit_vld_din;
    reg          flit_vld_q;
    wire         x4_replay_restart;
    wire         x4_replay_restart_din;
    reg          x4_replay_restart_q;
    wire         x4_replay_restart_d1_din;
    reg          x4_replay_restart_d1_q;
    wire         ftb_full_din;
    reg          ftb_full_q;
    wire [511:0] flit_data;
    wire [511:0] rpb_data;
    wire [6:0]   rpb_ecc;   
    wire [3:0]   replay_cnt_s0_din;
    reg  [3:0]   replay_cnt_s0_q;
    wire [3:0]   replay_cnt_s2_din;
    reg  [3:0]   replay_cnt_s2_q;
    wire [6:0]   rpb_wr_ptr_din;
    reg  [6:0]   rpb_wr_ptr_q;
    wire [6:0]   rpb_rd_ptr_din; 
    reg  [6:0]   rpb_rd_ptr_q; 
    wire         rpb_rd_vld_din;
    reg          rpb_rd_vld_q;
    wire         rpb_full_din;
    reg          rpb_full_q;
    wire         rpb_empty;
    wire         sbiterr;
    wire         dbiterr;
    wire         replay_done;
    wire [511:0] tlx_data;
    wire [511:0] ctl_flit;
    wire         send_ctl_flit;
    wire         init_replay_done_din;
    reg          init_replay_done_q;
    wire         nack_din;
    reg          nack_q;
    wire         nack_dly_din;
    reg          nack_dly_q;
    wire         nack_pend_din;
    reg          nack_pend_q;
    wire         dl_rp_flit_ip_din;
    reg          dl_rp_flit_ip_q;
    wire         replay_done_din; 
    reg          replay_done_q;
    wire         replay_done_dly_din; 
    reg          replay_done_dly_q;
    wire         replay_ip_din; 
    reg          replay_ip_q;
    wire [3:0]   prev_cmd_run_length;
    wire [511:0] dl2dl_replay_flit; // --9 total sent  
    wire [511:0] dl2dl_idle_flit;      
    wire [511:0] mux_data;
    wire [511:0] pre_crc_data_din;
    reg  [511:0] pre_crc_data_q;
    wire [511:0] out_data_din;
    reg  [511:0] out_data_q;
    wire [35:0]  crc_checkbits_din;
    reg  [35:0]  crc_checkbits_q;
    wire [35:0]  crc_checkbits0_out;
    wire [35:0]  crc_checkbits1_out;
    reg          flit_vld_dly_q;
    wire         flit_vld_dly_din;
    reg          ftb_empty_dly_q;
    wire         ftb_empty_dly_din;
    wire         full_idle;
    wire         tlx_input_error;
    wire [3:0]   dlx_errors;
    wire [31:0]  dlx_info;
    wire         flt_buf_underrun_din;
    reg          flt_buf_underrun_q;
    wire         flt_buf_overflow_din;
    reg          flt_buf_overflow_q;
    wire         rpb_buf_underrun_din;
    reg          rpb_buf_underrun_q;
    wire         rpb_buf_overflow_din;
    reg          rpb_buf_overflow_q;

    wire         cfg_force_crc_error;
    wire         injected_crc_error;
    wire [2:0]   injected_crc_cnt_din;
    reg  [2:0]   injected_crc_cnt_q;
    wire         zero_crc;
    wire [6:0]   replay_flit_rpb_pointer_din;
    reg  [6:0]   replay_flit_rpb_pointer_q;
    wire         init_replay_done_dly_din;
    reg          init_replay_done_dly_q;
    wire         rpb_empty_din;
    reg          rpb_empty_q;
    wire         rpb_empty_d1_din;
    reg          rpb_empty_d1_q;
    wire         send_no_replay_data_din;
    reg          send_no_replay_data_q;
    wire [7:0]   link_errors_last_din;
    reg  [7:0]   link_errors_last_q;
    wire         replay_due2_errors;
    wire         vld_switch_to_idle;
    reg          tx_rl_not_vld_q;
    wire         tx_rl_not_vld_din;
    reg          rx_ack_ptr_6_d_q;
    wire         rx_ack_ptr_6_d_din;
    reg          rx_rl_not_vld_q;
    wire         rx_rl_not_vld_din;
    reg          force_idle_flit_q;
    wire         force_idle_flit_din;
    reg          force_idle_2nd_cycle_q;
    wire         force_idle_2nd_cycle_din;
    reg          replay_after_idle_f_q;
    wire         replay_after_idle_f_din;
    reg          replay_start_q;
    wire         replay_start_din;


//--******************************************************************************************************
//-- 512 bit flits come in, may be intermixed with dl2dl (data link to data link) flits and replay flits
//--    PRIORITY is as FOLLOWS:
//--      1) Stall -- 2 cycles after every 64 functional cycles -- send nothing
//--      2) DL2DL replay flit -- can be caused by 4 conditions (crc_error, replay_flit from rx (nack), after initialization, internal error)
//--      3) data from replay buffer (follows most replay flits)
//--      4) Normal Flit from Transaction Layer (TL)
//--      5) DL2DL idle flit -- must send something each valid cycle
//--
//--******************************************************************************************************
//-- Dataflow == tlx_dlx_flit -> flit_buf? -> flit_data             -> pre_crc_data -> out_data_q
//--                                                    -> rpb_data ->                                  (replay buffer)

    // --Fill flit buffer with incoming data at the address specified by the flt_wr_ptr
    // --Only write to _din if the frame is valid, otherwise, we grab the previous value (what is being held there)
assign flit_buf0_data_din[511:0] = ((flit_wr_ptr_q == 2'b00) && tlx_dlx_flit_valid) ? tlx_dlx_flit[511:0]:
                                                                                      flit_buf0_data_q[511:0];

assign flit_buf1_data_din[511:0] = ((flit_wr_ptr_q == 2'b01) && tlx_dlx_flit_valid) ? tlx_dlx_flit[511:0]:
                                                                                      flit_buf1_data_q[511:0];

assign flit_buf2_data_din[511:0] = ((flit_wr_ptr_q == 2'b10) && tlx_dlx_flit_valid) ? tlx_dlx_flit[511:0]:
                                                                                      flit_buf2_data_q[511:0];

assign flit_buf3_data_din[511:0] = ((flit_wr_ptr_q == 2'b11) && tlx_dlx_flit_valid) ? tlx_dlx_flit[511:0]:
                                                                                      flit_buf3_data_q[511:0];

    // --Grab flit data from buffer (based on the read pointer)
assign flit_data[511:0] = (flit_rd_ptr_q == 2'b00) ? flit_buf0_data_q[511:0]: 
                          (flit_rd_ptr_q == 2'b01) ? flit_buf1_data_q[511:0]:
                          (flit_rd_ptr_q == 2'b10) ? flit_buf2_data_q[511:0]:
                                                     flit_buf3_data_q[511:0];


    // --flit_type [1:0] ==> "00" = flit; "01" = from rp buffer; "10" = replay cmd flit; "11" = idle flit
    // -- if not replay data, send normal flit
assign tlx_data[511:0] = (flit_type[1:0] == 2'b01) ?  rpb_data[511:0]:
                                                     flit_data[511:0];

    // --Flit type from ctl used to decide between dl2dl replay command, flit/replay data, and dl2dl idle command,
assign mux_data[511:0] = (flit_type == 2'b10) & ~stall_d2_q ? dl2dl_replay_flit[511:0]:
                         (flit_type == 2'b01) & ~stall_d2_q ?          tlx_data[511:0]:
                         (flit_type == 2'b00) & ~stall_d2_q ?          tlx_data[511:0]:
                         (flit_type == 2'b11) & ~stall_d2_q ?   dl2dl_idle_flit[511:0]:
                                                                 pre_crc_data_q[511:0];

   //-- stall, adjusted flit (for ctl), or data flit
assign pre_crc_data_din[511:0] = stall_d2_q    ? pre_crc_data_q[511:0]:    // --If stalled, grab previous cycle data 
                                 send_ctl_flit ?       ctl_flit[511:0]:    // --Last flit of frame, send ack count
                                                       mux_data[511:0];

   //-- latch up for timing
assign out_data_din[511:0] = pre_crc_data_q[511:0];

// ------------------------------------------------CRC----------------------------------------------
ocx_dlx_crc crc_mod (.init (zero_crc),       
                     .checkbits_in (crc_checkbits_q[35:0]),
                     .data (pre_crc_data_q[511:0]),
                     .checkbits0_out (crc_checkbits0_out[35:0]),
                     .checkbits1_out (crc_checkbits1_out[35:0])
                     );

    // --If stalled, grab prvious value, otherwise use the out
assign crc_checkbits_din =  stall_d3_q ? crc_checkbits_q: 
                                         crc_checkbits0_out ^ crc_checkbits1_out;

// ------------------------------------------------END CRC----------------------------------------------

  //-- crc_zero_d1_q = ctl flit, either w or w/o errors, or other flit

assign flt_que_data_int[511:0] = crc_zero_d1_q & ~injected_crc_error ? {reverse36(crc_checkbits_q[35:0]), out_data_q[475:0]}:
                                 crc_zero_d1_q                       ? {reverse36({crc_checkbits_q[35:1],~crc_checkbits_q[0]}), out_data_q[475:0]}:
                                                                        out_data_q[511:0];
assign flt_que_data[511:0] = cfg_transmit_order ?  flt_que_data_int[511:0] :
                                                  {flt_que_data_int[511:496],flt_que_data_int[383:368],flt_que_data_int[255:240],flt_que_data_int[127:112],
                                                   flt_que_data_int[495:480],flt_que_data_int[367:352],flt_que_data_int[239:224],flt_que_data_int[111:096],
                                                   flt_que_data_int[479:464],flt_que_data_int[351:336],flt_que_data_int[223:208],flt_que_data_int[095:080],
                                                   flt_que_data_int[463:448],flt_que_data_int[335:320],flt_que_data_int[207:192],flt_que_data_int[079:064],
                                                   flt_que_data_int[447:432],flt_que_data_int[319:304],flt_que_data_int[191:176],flt_que_data_int[063:048],
                                                   flt_que_data_int[431:416],flt_que_data_int[303:288],flt_que_data_int[175:160],flt_que_data_int[047:032],
                                                   flt_que_data_int[415:400],flt_que_data_int[287:272],flt_que_data_int[159:144],flt_que_data_int[031:016],
                                                   flt_que_data_int[399:384],flt_que_data_int[271:256],flt_que_data_int[143:128],flt_que_data_int[015:000]};

                                                  
//--******************************************************************************************************
//-- BUILD FLITS in case they are needed
   //-- Create control flit if needed   
assign ctl_flit[511:0] = {zeros[511:476],                         //*bits=511:476 crc 0's*/
                          rtn_acks[4:0],                          //*bits=475:471 ack cnt*/
                          dl2dl_ack[1:0],                         //*bits=470:469 dl2dl ack (power management)*/
                          mux_data[468:0]};                       //*bits 468:0   Rest of control flit (came from TL input)*/

    // --Create dl2dl replay just in case - 48 bytes reserved, last 16 bytes:
assign dl2dl_replay_flit[511:0] = {zeros[511:476],                //*bits=511:476 crc 0's*/
                                   rtn_acks[4:0],                 //*bits=475:471 ack cnt*/
                                   dl2dl_ack[1:0],                //*bits=470:469 dl2dl ack (power management)*/
                                   send_nack_q,                   //*bit =468     nack*/
                                   zeros[467:464],                //*bits=467:464 reserved*/
                                   link_errors_q[7:0],            //*bits=463:456 link errors*/
                                   prev_cmd_run_length[3:0],      //*bits=455:452 previous run length*/
                                   4'hA,                          //*bits=451:448 "A" run length for dl2dl replay flit*/
                                   zeros[447:439],                //*bits=447:439 */
                                   replay_flit_rpb_pointer_q,     //*bits=438:432 starting seq # (where this side will restart from)*/
                                   zeros[431:423],                //*bits=431:423 */
                                   rx_ack_ptr_q[6:0],             //*bits=422:416 ack seq # (where we are requesting the other side to start from)*/
                                   link_info_q[63:0],             //*bits=415:352 Link error info*/
                                   zeros[351:0]};             

    // --Create dl2dl idle just in case - 56 bytes reserved, last 8 bytes
assign dl2dl_idle_flit[511:0] = {zeros[511:476],                  //*bits=511:476 crc 0's*/
                                 rtn_acks[4:0],                   //*bits=475:471 ack cnt*/
                                 dl2dl_ack[1:0],                  //*bits=470:469 dl2dl ack (power management)*/
                                 zeros[468:452], 
                                 4'hF,                            //*bits=451:448  "F" run length for dl2dl idle flit*/
                                 zeros[447:0]};

//--******************************************************************************************************
// -------------------------------------Replay Buffer-----------------------------------
    ocx_bram_infer bram (
         .clka (dlx_clk)
        ,.clkb      (1'b0)                   // --Not used in ocx_bram_infer.v; tie to 0 
        ,.ena       (1'b0)                   // --Not used in ocx_bram_infer.v; tie to 0
        ,.enb       (rpb_rd_vld_q)           // --Acts as read enable
        ,.wea       (flit_vld_q)             // --write enable
        ,.addra     (rpb_wr_ptr_q[6:0])      // --input write address
        ,.addrb     (rpb_rd_ptr_q[6:0])      // --input read address
        ,.dina      (pre_crc_data_q[511:0])  // --input write data         
        ,.doutb     (rpb_data[511:0])        // --output read data
        ,.dbiterr   (dbiterr)                // --output double bit error tied to 0
        ,.rdaddrecc (rpb_ecc)                // --output ecc address (where error was?) tied to 0
        ,.sbiterr   (sbiterr)
        ,.rstb      (1'b0)
        );
  
//--******************************************************************************************************   
//-- Control Logic - Basic decodes
//-- 
    // -- use reset and send on one cycle later
assign reset_din   = dlx_reset;
assign tx_rx_reset = reset_q;

    //-- Stall chain, delays to match dataflow cycles
assign stall_d0_din            = ctl_flt_stall; 
assign stall_d1_din            = stall_d0_q;
assign stall_d2_din            = stall_d1_q;
assign stall_d3_din            = stall_d2_q;
assign stall_d4_din            = stall_d3_q; 

assign train_done                 = ctl_flt_train_done & ~train_done_q;
assign train_done_din             = ctl_flt_train_done;

    // --Determine flit type
    // --flit_type [1:0] ==> "00" = flit;   "01" = from rp buffer;   "10" = replay cmd flit;   "11" = idle flit
assign init_replay_done_dly_din = init_replay_done_q;

//-- switch after data, or after control flit of 0 length.
assign vld_switch_to_idle = (((run_length_q[3:0] - 4'h1) == 4'h0) | (flit_data[451:448] == 4'h0));

assign flit_type[1:0] = ((force_idle_flit_q & replay_start & (replay_cnt_s2_q == 4'b1000)) | (force_idle_2nd_cycle_q & ctl_x4_not_x8_tx_mode))                        ? 2'b11:    //-- put in idle flit to break deadlock, follow with another set of 2'b10
                        replay_start | ((replay_cnt_s2_q < 4'b1000) | ~ctl_flt_train_done) | ((replay_cnt_s2_q == 4'b1000) & (ctl_x4_not_x8_tx_mode & ~stall_d1_q))   ? 2'b10:    //-- dl2dl replay flit -> 9 total
                        (replay_ip_q  | ((replay_cnt_s2_q == 4'b1000) & ~replay_done_dly_q)) & init_replay_done_dly_q & ~send_no_replay_data_q                        ? 2'b01:    //-- replay in progress, read from replay buffer .. rpb_empty is set by @ that are two cycles ahead
                        ~ftb_empty & idle & vld_switch_to_idle                                                                                                        ? 2'b11:    //-- rtp full go to idle if possible
                        ~ftb_empty & ~idle                                                                                                                            ? 2'b00:    //-- no replay, flits available, send normal flits
                                                                                                                                                                        2'b11;    //-- nothing else to do, send idle

assign flit_type_din[1:0] = flit_type[1:0];

    //--  Set run length of frame
    // --flit_type [1:0] ==> "00" = flit buffer;   "01" = from rp buffer;   "10" = replay cmd flit;   "11" = idle flit
assign run_length_din[3:0] = reset_q | replay_start                                                                                   ? 4'b0000:                  //-- If there's a reset, or a replay that hits in the middle
                             stall_d2_q                                                                                               ? run_length_q[3:0]:        //-- If stalled, grab previous data 
                             (run_length_q[3:0] > 4'h0)                                                                               ? run_length_q[3:0] - 4'h1: //-- Sending Data Flits, decrement as each flit is sent
                             ((flit_type[1:0]==2'b10) && (replay_cnt_s2_q[3:0] == 4'b0111) && init_replay_done_q)
                                                                      & (rx_rl_not_vld_q & (prev_cmd_run_length[3:0] == 4'b0000))     ? 4'b0000:                  // --Replay after reset, before any acks were received
                             ((flit_type[1:0]==2'b10) && (replay_cnt_s2_q[3:0] == 4'b0111) && init_replay_done_q)                     ? prev_cmd_run_length[3:0]: // --Replay Started
                             (flit_type[1:0]==2'b00) | (flit_type[1:0]==2'b01)                                                        ? tlx_data[451:448]:        // --Beginning of new flit
                                                                                                                                        4'b0000;         

assign send_ctl_flit         = (run_length_q[3:0] == 4'b0000) | replay_start;      

assign crc_zero_din          = stall_d2_q ? crc_zero_q:
                                            send_ctl_flit;

assign crc_zero_d1_din       = crc_zero_q;
assign crc_zero_d2_din       = crc_zero_d1_q | replay_start | replay_start_q;

assign zero_crc              = ctl_x4_not_x8_tx_mode ? crc_zero_d2_q:
                                                       crc_zero_d1_q;

//--******************************************************************************************************   
//-- Control Logic -- Buffer Pointer Info & Acks

    //-- This keeps track of the replay buffer pointer that will be where a replay starts, it will be sent if we request a replay
    //-- Add in good flits seen by rx from ODL (will send these back to other side as ack_rtn - this is an intermediate step in case the state
    //-- machine is in the middle of an operation)
    //-- (accounts for any acks missed from flits that were never received)
assign rx_ack_ptr_din[6:0] = reset_q  ? 7'b0000000:
                                        rx_ack_ptr_q[6:0] + {3'b000, rx_tx_rx_ack_inc[3:0]};

    //-- Ack to return to ODL, this is an intermediate step 
    //-- If the count exceeded F(rtn_ack_cnt_q[5]), keep track of overflow
    //-- If acks have been sent, replace the count with the new value
    //-- Otherwise, add the new count to the previous count
assign rtn_ack_cnt_din[5:0] = reset_q                         ? 6'b0:
                              (rtn_ack_cnt_q[5] && acks_sent) ? {2'b0, rx_tx_rx_ack_inc[3:0]} + {1'b0, rtn_ack_cnt_q[4:0]} + 6'b000001:
                              acks_sent                       ? {2'b0, rx_tx_rx_ack_inc[3:0]}:
                                                                {2'b0, rx_tx_rx_ack_inc[3:0]} + rtn_ack_cnt_q[5:0]; 

    // --This is the acks that are returned to ODL
    // --If the value is =100000, we can only send 31 acks, otherwise we can send the full count
assign rtn_acks[5:0] = rtn_ack_cnt_q[5] ? 6'b011111:
                                          rtn_ack_cnt_q[5:0];

    // --Acks sent ctl_flits or dl2dl flits
assign acks_sent = (send_ctl_flit || flit_type[1]) && ~stall_d2_q;  

    // --Don't overflow returned ack count, not sure how we could, but put in logic to handle anyway
    // --Signals to send an idle flit (to send back the acks)
assign max_ack_cnt = (rtn_ack_cnt_q[5:4] == 2'b11);
    
    // --Update tx pointer, normally just keeps adding in acks, but a replay from ODL gives us a new start pointer
assign tx_ack_ptr_din[6:0] = reset_q              ? 7'b0000000:
                             rx_tx_tx_ack_ptr_vld ? rx_tx_tx_ack_ptr[6:0]: 
                                                    tx_ack_ptr_q[6:0] + {2'b00, rx_tx_tx_ack_rtn[4:0]};

assign send_no_replay_data_din = reset_q                                                                                                                  ? 1'b0:
                                 ((ctl_x4_not_x8_tx_mode & (replay_cnt_s0_q[3:0]==4'b0100)) | (~ctl_x4_not_x8_tx_mode & (replay_cnt_s0_q[3:0]==4'b0011))) ? (rpb_wr_ptr_q[6:0] == tx_ack_ptr_q[6:0]): 
                                                                                                                                                            send_no_replay_data_q;

    // --Grab from flit & replay if ctl sends active (not training) & not dl2dl flit request
assign flit_vld = train_done_q && (flit_type[1:0] == 2'b00) && ~idle && ~stall_d2_q;

assign flit_vld_dly_din = flit_vld;
assign flit_vld_din = flit_vld;

    // --When pulling from flit buffer, send credit response to TL
assign dlx_tlx_flit_credit = ctl_x4_not_x8_tx_mode ? flit_vld_dly_q & ~ftb_empty_dly_q:
                                                     flit_vld;


assign dl2dl_ack[1:0] = 2'b00; 


// ------------------------------------ Flit Buffer -----------------------------------

assign flit_wr_ptr_din[1:0] = reset_q              ? 2'b0:
                              tlx_dlx_flit_valid   ? flit_wr_ptr_q[1:0] + 2'b01:
                                                     flit_wr_ptr_q[1:0];
 
assign flit_rd_ptr_din[1:0] = reset_q               ? 2'b0:
                              flit_vld & ~ftb_empty ? flit_rd_ptr_q[1:0] + 2'b01 :
                                                      flit_rd_ptr_q[1:0];


    // --Define flit buffer depth to TL (static value)
assign dlx_tlx_init_flit_depth = 3'b100;

    // --check to see if buffers are full - (tlx_dlx_flit_valid = add an entry) (flit_vld = clear an entry)
    // --Signal shows that pointers are equal because it is "full" and not because it is empty (may only have 3 slots written to)
assign ftb_full_din = ((((flit_wr_ptr_q[1:0] + 2'b01) == flit_rd_ptr_q[1:0]) && tlx_dlx_flit_valid  && ~flit_vld) ||
                        ((flit_wr_ptr_q[1:0]          == flit_rd_ptr_q[1:0]) && ftb_full_q && ~flit_vld) ||
                        ((flit_wr_ptr_q[1:0]          == flit_rd_ptr_q[1:0]) && ctl_x4_not_x8_tx_mode && ftb_full_q && ~flit_vld_dly_q))
                      & ~reset_q;

    // --check to see if buffer is empty - signal to ctl so it doesn't request a TL flit
assign ftb_empty = ((flit_wr_ptr_q[1:0] == flit_rd_ptr_q[1:0]) && ~ftb_full_q);
assign ftb_empty_dly_din = ftb_empty;

assign flt_buf_overflow_din      = (flit_wr_ptr_q[1:0] == flit_rd_ptr_q[1:0]) & ftb_full_q  & tlx_dlx_flit_valid;
assign flt_buf_underrun_din      = ftb_empty & flit_vld;

    // --Update flit buffer read pointer if the flit buffer has been read from
 
//--******************************************************************************************************   
//-- Control Logic -- Replay Buffer (RPB) Info & Acks

    // --check to see if buffer is full - "full" if wr ptr is within 16 of tx_ack ptr
assign rpb_full_din = (rpb_wr_ptr_q[6:4] + 3'b001) == tx_ack_ptr_q[6:4];

    // --Check to see if rpb is empty
assign rpb_empty = ((rpb_wr_ptr_q[6:0] == rpb_rd_ptr_q[6:0]) && ~rpb_full_q);
assign rpb_empty_din = rpb_empty;
assign rpb_empty_d1_din = rpb_empty_q;

    // --Update replay buffer write pointer (when a new flit was taken from flit buffer, not if replaying)
assign rpb_wr_ptr_din[6:0] = reset_q     ? 7'b0000000:
                             flit_vld_q  ? rpb_wr_ptr_q[6:0] + 7'b0000001: 
                                           rpb_wr_ptr_q[6:0];

assign rpb_rd_vld_din = (replay_cnt_s0_q[3:0] == 4'b0001)                                                                                                                  ? 1'b0:  //-- when 2nd replay hits (while doing the first) must reset valid
                        ((ctl_x4_not_x8_tx_mode & (replay_cnt_s0_q[3:0] == 4'b0110)) | (~ctl_x4_not_x8_tx_mode & (replay_cnt_s0_q[3:0] == 4'b0100))) & init_replay_done_q  ? 1'b1:
                        ((((rpb_rd_ptr_q[6:0] + 7'b0000001) == rpb_wr_ptr_q[6:0]) & ~stall_d0_q) | rpb_empty)                                                              ? 1'b0:
                                                                                                                                                                             rpb_rd_vld_q;

    //-- Save replay pointer to use in replay command (in case incomming replay flit tells me to start at another address... which will only happen if we happen to do another replay)
assign replay_flit_rpb_pointer_din[6:0] = ((ctl_x4_not_x8_tx_mode & (replay_cnt_s0_q[3:0]==4'b0100)) | (~ctl_x4_not_x8_tx_mode & (replay_cnt_s0_q[3:0]==4'b0011))) ? tx_ack_ptr_q[6:0]:
                                                                                                                                                                     replay_flit_rpb_pointer_q[6:0];

    // --Update replay buffer read pointer - based on acks received from other side
assign rpb_rd_ptr_din[6:0] = reset_q                                                                                                                                              ? 7'b0000000:
                             ((ctl_x4_not_x8_tx_mode & (replay_cnt_s0_q[3:0]==4'b0100)) | (~ctl_x4_not_x8_tx_mode & (replay_cnt_s0_q[3:0]==4'b0011)))                             ? tx_ack_ptr_q[6:0]:         // --If a dl2dl replay flit, update replay pointer (octlx_flt_tx_ack_ptr has full address)
                             ((ctl_x4_not_x8_tx_mode & (replay_cnt_s0_q[3:0]==4'b0101) & ~stall_d2_q) | (~ctl_x4_not_x8_tx_mode & (replay_cnt_s0_q[3:0]==4'b0100) & ~stall_d0_q)) ? rpb_rd_ptr_q[6:0] - 7'b1:  // --Decrement to get the length of the last comand to put into the last replay flit
                             (rpb_rd_vld_q & ~stall_d0_q)                                                                                                                         ? rpb_rd_ptr_q[6:0] + 7'b1:  // --If replaying data, increment ptr towards wr_ptr
                                                                                                                                                                                    rpb_rd_ptr_q[6:0];         // --If not a dl2dl replay flit, move ptr based on acks

assign tx_rl_not_vld_din           = (reset_q | tx_rl_not_vld_q) &  (tx_ack_ptr_q[6:0] == 7'b0000000);        //-- after reset, ignore left over run length from replay buffer
assign rx_ack_ptr_6_d_din          = rx_ack_ptr_q[6];                                                        //-- keep old bit six for use below
assign rx_rl_not_vld_din           = (reset_q | rx_rl_not_vld_q) & ~(rx_ack_ptr_6_d_q & ~rx_ack_ptr_q[6]) ;  //-- ignore runlength on replay after a reset until the receive counter rolls

    // --While replaying data, signal replay done when replay pointer catches up with write pointer
assign replay_done         =  (rpb_rd_ptr_q[6:0] == rpb_wr_ptr_q[6:0]) & ~stall_d0_q;
assign replay_done_din     = replay_done;
assign replay_done_dly_din = replay_done_q;

assign rpb_buf_overflow_din      = (tx_ack_ptr_q[6:0] == (rpb_wr_ptr_q[6:0] + 7'b0000001));
assign rpb_buf_underrun_din      = (rpb_rd_ptr_q[6:0] == rpb_wr_ptr_q[6:0]) & rpb_rd_vld_q & ~stall_d1_q;

// ----------------------------------------Replay Info---------------------------------------

    // --Start replay if we detect a crc error(nack_q) or RX replay flit w/nack(nack_pend_q), other side requests replay, or if training done - AND we're not in the middle of something or stalled.
assign replay_start = ((nack_dly_q || nack_q || nack_pend_q || replay_after_idle_f_q) & ~dl_rp_flit_ip_q & ~stall_d2_q & ctl_flt_train_done) | train_done;
//-- added 7/14/17 for x4 mode, zero_crc first beat
assign replay_start_din = replay_start;


    //--Need to know this is the 'replay' after training... set after initial training
assign init_replay_done_din = ((~stall_d2_q & (replay_cnt_s2_q[3:0]==4'b1000)) | init_replay_done_q) & ~reset_q;

    // --In middle of sending dl2dl replay flits (9)
assign dl_rp_flit_ip_din = (replay_start & ~force_idle_flit_q) | (dl_rp_flit_ip_q & ~((ctl_x4_not_x8_tx_mode & (replay_cnt_s0_q[3:0] == 4'h8)) | (~ctl_x4_not_x8_tx_mode & (replay_cnt_s0_q[3:0] == 4'h7))));

    // --Nack set it RX received CRC error or a replay flit w/ Nack set, keep it on until is is processed
assign nack_din = (rx_tx_crc_error || replay_due2_errors || (nack_q && (~replay_start || stall_d2_q || idle))) && ~reset_q; 
assign nack_dly_din = (nack_q | nack_dly_q) & ~init_replay_done_q;

    // --rx side detected an error and we need to send to nack to other end of link but crc error already reported and replay not done
    // --If in middle of replay flits (we requested) if we detect a nack, we will resend replay flits
assign nack_pend_din = (rx_tx_nack || (nack_pend_q && (~replay_start || stall_d2_q || idle))) && ~reset_q;

assign force_idle_flit_din = ctl_que_tx_ts2                                          ? 1'b0:                         //-- start the replay before setting this
                             nack_pend_q & (replay_cnt_s2_q == 4'b0110)              ? 1'b1:                          //-- start the replay before setting this
                             (flit_type[1:0] == 2'b11)                               ? 1'b0:
                                                                                       force_idle_flit_q;

assign force_idle_2nd_cycle_din = force_idle_flit_q & replay_start;

assign replay_after_idle_f_din = ((force_idle_flit_q & replay_start) | replay_after_idle_f_q) & ~(replay_cnt_s2_q == 4'b0010) ;

    // --Decide if nack back to tx is =0 or =1
    // --send=1 if previous was nacked, or previously sent && not 9th replay 
assign send_nack_din = nack_q || (send_nack_q && ~(replay_cnt_s2_q[3] == 1'b1)); 
    
    //-- Count to control replays.  This will stall with d0 as it is used for RePlay Buffer(RPB) reads that are two cycles before the mux_data
assign replay_cnt_s0_din[3:0] = reset_q                                                             ? 4'b0000:
                                                         replay_start & ~stall_d0_q & ~stall_d1_q   ? 4'b0000:                        // --set = 0 when replay begins and no stalls in the way
                                ~ctl_x4_not_x8_tx_mode & replay_start & ~stall_d0_q &  stall_d1_q   ? 4'b1111:                        // --set = 0 when replay begins
                                                         replay_start &  stall_d0_q & ~stall_d1_q   ? 4'b1111:                        // --set = 0 when replay begins
                                ~ctl_x4_not_x8_tx_mode & replay_start &  stall_d0_q &  stall_d1_q   ? 4'b1110:                        // --set = 0 when replay begins
                                 ctl_x4_not_x8_tx_mode & replay_start &  stall_d0_q                 ? 4'b1111:                        // --x4 mode stall
                                 ctl_x4_not_x8_tx_mode & replay_start                               ? 4'b0000:                        // --x4 mode no stall
                                stall_d0_q                                                          ? replay_cnt_s0_q[3:0]:           // --stalled or idle, use previous value
                                (replay_cnt_s0_q[3] == 1'b0) | (replay_cnt_s0_q[3:2] == 2'b11)      ? replay_cnt_s0_q[3:0] + 4'h1:    // --increment count to signal dl2dl flits sent
                                                                                                      4'b1011;                        // --this it to make the previous behavior work

assign x4_replay_restart_din     = (x4_replay_restart_q | ((replay_cnt_s2_q[3:0] == 4'b0010) & ctl_x4_not_x8_tx_mode & ~init_replay_done_q)) & ~reset_q;
assign x4_replay_restart_d1_din  = x4_replay_restart_q;
assign x4_replay_restart         = x4_replay_restart_q & ~x4_replay_restart_d1_q;

//-- Count to control replays.  This will stall with d2.  If no stall are present it will match replay_cnt_s0_q.  This will be used to control things in the cycle with mux_data     
assign replay_cnt_s2_din[3:0] = reset_q                                    ? 4'b1111:
                                (replay_start | x4_replay_restart)         ? 4'b0000:                        // --set = 0 when replay begins, begin counting up for dl2dl replay flits sent
                                stall_d2_q                                 ? replay_cnt_s2_q[3:0]:           // --stalled or idle, use previous value
                                (replay_cnt_s2_q[3:0] <= 4'h7)             ? replay_cnt_s2_q[3:0] + 4'h1:    // --increment count to signal dl2dl flits sent
                                                                             4'b1111;
           
    // --Replay in progress if 8 dl2dl replay flits have been sent (and no stall) or replay is already in progress and replay isn't done or started (again?)
assign replay_ip_din = ((((replay_cnt_s2_q[3:0] == 4'b1000) && ~stall_d2_q) || replay_ip_q) && ~replay_done_q && ~(replay_start || reset_q || ~init_replay_done_dly_q)); 

   // --Idle when things are empty, full, or max count (Cannot be idle if in the middle of a replay or in the middle of a frame)
   //-- Full and send and idle when.  replay buffer is full and the next command is not a control flit (to send back acks)
assign full_idle = ((rpb_full_q) && send_ctl_flit && ~(replay_start || replay_ip_q || dl_rp_flit_ip_q));
assign idle      = reset_q || max_ack_cnt || ((full_idle || ftb_empty) && ~(replay_start || replay_ip_din || replay_ip_q || dl_rp_flit_ip_q));

    // --Grab previous run length when taking from the replay buffer - Sent 9th with replay flit, init_replay_done_dly_q is used to block data on last replay flit after first training.
    // -- also after reset, don't send 'old' value for length, send zeros
assign prev_cmd_run_length[3:0]  = (replay_cnt_s2_q[3:0] == 4'b0111) & init_replay_done_dly_q & ~tx_rl_not_vld_q & ~force_idle_flit_q & ~nack_pend_q ? rpb_data[451:448]:
                                                                                                                                                      4'b0000;
 
//--******************************************************************************************************   
//-- Control Logic -- Link Info & Errors


// -------------------------------------timer for forward progress not being made -----------------------
assign no_progress_cnt_din[5:0]  = (flit_vld | ~train_done_q)  ? 6'b000000                          :   //-- read from flit buffer
                                   (pulse_1us & ~ftb_empty)    ? no_progress_cnt_q[5:0] + 6'b000001 :
                                                                 no_progress_cnt_q[5:0]; 

assign no_fwd_progress           = train_done_q & no_progress_cnt_q[3];
assign error_no_fwd_progress     = no_fwd_progress;

// --------------------------------Link Info & Errors-------------------------------
assign tlx_input_error = ftb_empty & (run_length_din[3:0]==4'b0000) & (flit_type[1:0]==2'b00);

assign dlx_errors[3:0]      = {(flt_buf_underrun_q | flt_buf_overflow_q | rpb_buf_underrun_q | rpb_buf_overflow_q | tlx_input_error ), no_fwd_progress, 1'b0, 1'b0};

assign dlx_info[31:0]       =  {flt_buf_underrun_q,                 //-- bit 31
                                flt_buf_overflow_q,                 //-- bit 30 
                                rpb_buf_underrun_q,                 //-- bit 29 
                                rpb_buf_overflow_q,                 //-- bit 28 
                                tlx_input_error,                    //-- bit 27 
                                3'b000,                             //-- bit 26:24
                                no_fwd_progress,                    //-- bit 23 
                                7'b0,
                                lane_inverted_q[7:0], sync_was_detected_q[7:0] };                             //-- bit 22:0

//--            hold sync value if it was ever found. 
assign sync_was_detected_din[7:0] =  reset_q   ?  8'b00000000         :
                                                  (rx_tx_sync[7:0] | sync_was_detected_q[7:0]);

//--            hold lane inverted information 
assign lane_inverted_din[7:0]    =  rx_tx_lane_inverted[7:0];

assign link_errors_din[7:0]      = {dlx_errors[3:0],tlx_dlx_debug_encode[3:0]};
assign link_errors_last_din[7:0] = link_errors_q[7:0];
assign link_info_din[63:0]       = {dlx_info[31:0] ,tlx_dlx_debug_info[31:0]};

assign replay_due2_errors        = ~(link_errors_q[7:0] == link_errors_last_din[7:0]);

// -------------------------------------Error Injection-----------------------------------

//-- cfg_force_crc_error is always tied, it is used by verification to force an error
assign cfg_force_crc_error       = 1'b0; 
assign injected_crc_error        =  cfg_force_crc_error & (out_data_q[11:0] == 12'h3C0) & (injected_crc_cnt_q[2:0] == 3'b0);
assign injected_crc_cnt_din[2:0] = (cfg_force_crc_error & (out_data_q[11:0] == 12'h3C0)) ? injected_crc_cnt_q[2:0] + 3'b1 :
                                                                                           injected_crc_cnt_q[2:0];


//-- registers
    always @(posedge dlx_clk) begin
      injected_crc_cnt_q[2:0]  <= injected_crc_cnt_din[2:0];
      crc_zero_q               <= crc_zero_din;
      crc_zero_d1_q            <= crc_zero_d1_din;
      crc_zero_d2_q            <= crc_zero_d2_din;
//--      crc_zero_d3_q            <= crc_zero_d3_din;
      crc_checkbits_q[35:0]    <= crc_checkbits_din[35:0];
      dl_rp_flit_ip_q          <= dl_rp_flit_ip_din;
      flit_buf0_data_q[511:0]  <= ((flit_wr_ptr_q == 2'b00) && tlx_dlx_flit_valid) ? flit_buf0_data_din[511:0] : flit_buf0_data_q[511:0];
      flit_buf1_data_q[511:0]  <= ((flit_wr_ptr_q == 2'b01) && tlx_dlx_flit_valid) ? flit_buf1_data_din[511:0] : flit_buf1_data_q[511:0];
      flit_buf2_data_q[511:0]  <= ((flit_wr_ptr_q == 2'b10) && tlx_dlx_flit_valid) ? flit_buf2_data_din[511:0] : flit_buf2_data_q[511:0];
      flit_buf3_data_q[511:0]  <= ((flit_wr_ptr_q == 2'b11) && tlx_dlx_flit_valid) ? flit_buf3_data_din[511:0] : flit_buf3_data_q[511:0];
      flit_rd_ptr_q[1:0]       <= flit_rd_ptr_din[1:0];
      flit_vld_q              <= flit_vld_din;
      flit_type_q[1:0]         <= flit_type_din[1:0];
      flit_wr_ptr_q[1:0]       <= flit_wr_ptr_din[1:0];
      ftb_full_q               <= ftb_full_din;
      link_errors_q[7:0]       <= link_errors_din[7:0];
      lane_inverted_q[7:0]     <= lane_inverted_din[7:0];
      sync_was_detected_q[7:0] <= sync_was_detected_din[7:0];
      link_info_q[63:0]        <= link_info_din[63:0];
      nack_pend_q              <= nack_pend_din;
      nack_q                   <= nack_din;
      nack_dly_q               <= nack_dly_din;
      init_replay_done_q       <= init_replay_done_din;
      out_data_q[511:0]        <= out_data_din[511:0];
      pre_crc_data_q[511:0]    <= pre_crc_data_din[511:0];
      replay_cnt_s0_q[3:0]     <= replay_cnt_s0_din[3:0];
      replay_cnt_s2_q[3:0]     <= replay_cnt_s2_din[3:0];
      x4_replay_restart_q      <= x4_replay_restart_din;
      x4_replay_restart_d1_q   <= x4_replay_restart_d1_din;
      replay_done_q            <= replay_done_din;
      replay_done_dly_q        <= replay_done_dly_din;
      replay_ip_q              <= replay_ip_din; 
      reset_q                  <= reset_din;
      rpb_full_q               <= rpb_full_din;
      rpb_rd_ptr_q[6:0]        <= rpb_rd_ptr_din[6:0];
      rpb_rd_vld_q             <= rpb_rd_vld_din;
      rpb_wr_ptr_q[6:0]        <= rpb_wr_ptr_din[6:0];
      rtn_ack_cnt_q[5:0]       <= rtn_ack_cnt_din[5:0];
      run_length_q[3:0]        <= run_length_din[3:0];
      rx_ack_ptr_q[6:0]        <= rx_ack_ptr_din[6:0];
      send_nack_q              <= send_nack_din;
      stall_d0_q               <= stall_d0_din;
      stall_d1_q               <= stall_d1_din;
      stall_d2_q               <= stall_d2_din;
      stall_d3_q               <= stall_d3_din;
      stall_d4_q               <= stall_d4_din;
      train_done_q             <= train_done_din;
      tx_ack_ptr_q[6:0]        <= tx_ack_ptr_din[6:0];
      no_progress_cnt_q[5:0]   <= no_progress_cnt_din[5:0];
      flt_buf_underrun_q       <= flt_buf_underrun_din;
      flt_buf_overflow_q       <= flt_buf_overflow_din;
      rpb_buf_underrun_q       <= rpb_buf_underrun_din;
      rpb_buf_overflow_q       <= rpb_buf_overflow_din;
      flit_vld_dly_q           <= flit_vld_dly_din;
      ftb_empty_dly_q          <= ftb_empty_dly_din;
      replay_flit_rpb_pointer_q[6:0] <= replay_flit_rpb_pointer_din[6:0];
      init_replay_done_dly_q   <= init_replay_done_dly_din;
      rpb_empty_q              <= rpb_empty_din;
      rpb_empty_d1_q           <= rpb_empty_d1_din;
      send_no_replay_data_q    <= send_no_replay_data_din;
      link_errors_last_q       <= link_errors_last_din;
      tx_rl_not_vld_q          <= tx_rl_not_vld_din;
      rx_ack_ptr_6_d_q         <= rx_ack_ptr_6_d_din;
      rx_rl_not_vld_q          <= rx_rl_not_vld_din;
      force_idle_flit_q        <= force_idle_flit_din;
      force_idle_2nd_cycle_q   <= force_idle_2nd_cycle_din;
      replay_after_idle_f_q    <= replay_after_idle_f_din;
      replay_start_q           <= replay_start_din;
    end

endmodule 

