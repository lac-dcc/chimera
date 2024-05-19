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
wire    [`FLOW_WIN_SIZE_W-1:0]  wnd_two;

// user context
wire   [`FLOW_WIN_SIZE_W-1:0]  dup_acks_in;
wire   [`FLOW_WIN_SIZE_W-1:0]  ss_thresh_in;
wire   [`FLOW_WIN_SIZE_W-1:0]  wnd_inc_cntr_in;
wire   [`FLAG_W-1:0]           in_timeout_in;

wire   [`FLOW_WIN_SIZE_W-1:0]  dup_acks_out;
wire   [`FLOW_WIN_SIZE_W-1:0]  ss_thresh_out;
wire   [`FLOW_WIN_SIZE_W-1:0]  wnd_inc_cntr_out;
wire   [`FLAG_W-1:0]           in_timeout_out;


//*********************************************************************************
// Logic
//*********************************************************************************
assign {in_timeout_in, wnd_inc_cntr_in, 
        ss_thresh_in, dup_acks_in} = user_cntxt_in;

assign user_cntxt_out =  timeout_expired ? {in_timeout_out, wnd_inc_cntr_out, 
                          ss_thresh_out, dup_acks_out} : user_cntxt_in;


assign  wnd_two = {{(`FLOW_WIN_SIZE_W-2){1'b0}}, {2'd2}};

assign mark_rtx  = 1'b1; // Is derived from user's policy
assign rtx_start = wnd_start_in;
assign rtx_end = wnd_start_in + 1;

assign wnd_size_out = timeout_expired ? {{(`FLOW_WIN_SIZE_W-1){1'b0}}, 1'b1} : timeout_expired;
assign rtx_timer_amnt_out = rtx_timer_amnt_in;
assign dup_acks_out = {`FLOW_WIN_SIZE_W{1'b0}};
assign ss_thresh_out = wnd_size_in > wnd_two ? {1'b0, wnd_size_in[`FLOW_WIN_SIZE_W-1:1]} : wnd_two;
assign wnd_inc_cntr_out = {`FLOW_WIN_SIZE_W{1'b0}};
assign in_timeout_out = 1'b1;
 
// clogb2 function
`include "clogb2.vh"

endmodule
