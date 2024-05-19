// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module user_defined_timeout (
    // input
    input                           timeout_expired,
    input   [`TIME_W-1:0]           now,
    input   [`FLOW_WIN_SIZE-1:0]    acked_wnd_in,
    input   [`FLOW_WIN_SIZE-1:0]    rtx_wnd_in,
    input   [`TX_CNT_WIN_SIZE-1:0]  tx_cnt_wnd_in,
    input   [`FLOW_SEQ_NUM_W-1:0]   wnd_start_in,
    input   [`FLOW_WIN_SIZE_W-1:0]  wnd_size_in,
    input   [`FLOW_SEQ_NUM_W-1:0]   next_new_in,
    input   [`TIMER_W-1:0]          rtx_timer_amnt_in,
    input   [`FLOW_SEQ_NUM_W-1:0]   total_tx_cnt_in,
    input   [`USER_CONTEXT_W-1:0]   user_cntxt_in,
    
    // output
    output  [`FLAG_W-1:0]           mark_rtx,
    output  [`FLOW_SEQ_NUM_W-1:0]   rtx_start,
    output  [`FLOW_SEQ_NUM_W-1:0]   rtx_end,
    output  [`FLOW_WIN_SIZE_W-1:0]  wnd_size_out,
    output  [`TIMER_W-1:0]          rtx_timer_amnt_out,
    output  [`USER_CONTEXT_W-1:0]   user_cntxt_out
);
 
//*********************************************************************************
// Wires and Regs
//*********************************************************************************
// user context
wire   [`FLOW_WIN_SIZE_W-1:0]  cwnd_in;
wire   [`FLOW_WIN_SIZE_W-1:0]  ss_thresh_in;
wire   [`FLOW_WIN_SIZE_W-1:0]  sacked_in;
wire   [`FLOW_WIN_SIZE_W-1:0]  dup_acks_in;
wire   [`FLOW_WIN_SIZE_W-1:0]  sacked_gt_min_in;
wire   [`FLOW_WIN_SIZE_W-1:0]  wnd_inc_cntr_in;
wire   [`FLOW_SEQ_NUM_W-1:0]   min_sack_in;
wire   [`FLOW_SEQ_NUM_W-1:0]   last_marked_sack_in; 
wire   [`FLOW_SEQ_NUM_W-1:0]   recover_in;
wire   [`FLAG_W-1:0]           in_recovery_in;  
wire   [`FLAG_W-1:0]           in_timeout_in;

wire   [`FLOW_WIN_SIZE_W-1:0]  cwnd_out;
wire   [`FLOW_WIN_SIZE_W-1:0]  ss_thresh_out;
wire   [`FLOW_WIN_SIZE_W-1:0]  sacked_out;
wire   [`FLOW_WIN_SIZE_W-1:0]  dup_acks_out;
wire   [`FLOW_WIN_SIZE_W-1:0]  sacked_gt_min_out;
wire   [`FLOW_WIN_SIZE_W-1:0]  wnd_inc_cntr_out;
wire   [`FLOW_SEQ_NUM_W-1:0]   min_sack_out;
wire   [`FLOW_SEQ_NUM_W-1:0]   last_marked_sack_out; 
wire   [`FLOW_SEQ_NUM_W-1:0]   recover_out;
wire   [`FLAG_W-1:0]           in_recovery_out;  
wire   [`FLAG_W-1:0]           in_timeout_out;

//*********************************************************************************
// Logic
//*********************************************************************************
assign user_cntxt_out = {in_timeout_out, in_recovery_out, recover_out,
                          last_marked_sack_out, min_sack_out, wnd_inc_cntr_out,
                          sacked_gt_min_out, dup_acks_out, sacked_out, 
                          ss_thresh_out, cwnd_out};
 
assign {in_timeout_in, in_recovery_in, recover_in,
        last_marked_sack_in, min_sack_in, wnd_inc_cntr_in,
        sacked_gt_min_in, dup_acks_in, sacked_in, 
        ss_thresh_in, cwnd_in} = user_cntxt_in;

assign  wnd_zero = {`FLOW_WIN_SIZE_W{1'b0}};
assign  wnd_two = {{(`FLOW_WIN_SIZE_W-2){1'b0}}, {2'd2}};

assign mark_rtx  = 1'b1; // Is derived from user's policy

assign wnd_size_out = wnd_size_in;
assign rtx_timer_amnt_out = rtx_timer_amnt_in;

assign rtx_start = wnd_start_in;
assign rtx_end = next_new_in;

assign cwnd_out         = cwnd_in;
assign ss_thresh_out    = wnd_size_in > wnd_two ? {1'b0, wnd_size_in[`FLOW_WIN_SIZE_W-1:1]} : wnd_two; 
assign sacked_out       = sacked_in;
assign dup_acks_out     = wnd_zero;    
assign sacked_gt_min_out    = wnd_zero;
assign wnd_inc_cntr_out     = wnd_zero;
assign min_sack_out         = `FLOW_SEQ_NONE;
assign last_marked_sack_out = last_marked_sack_in;
assign recover_out          = next_new_in - 1;
assign in_recovery_out      = 1'b0;
assign in_timeout_out       = 1'b1;

// clogb2 function
`include "clogb2.vh"

endmodule
