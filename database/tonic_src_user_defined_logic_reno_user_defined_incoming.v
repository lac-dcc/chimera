// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

`include "user_constants.vh"

module user_defined_incoming (
    // input
    input   [`PKT_TYPE_W-1:0]       pkt_type_in,
    input   [`PKT_DATA_W-1:0]       pkt_data_in,
    input   [`FLOW_SEQ_NUM_W-1:0]   cumulative_ack_in,
    input   [`FLOW_SEQ_NUM_W-1:0]   selective_ack_in,
    input   [`TX_CNT_W-1:0]         sack_tx_id_in,

    input   [`TIME_W-1:0]           now,
    input   [`FLAG_W-1:0]           valid_selective_ack,
    input   [`FLOW_WIN_IND_W-1:0]   new_c_acks_cnt,
    input   [`FLOW_SEQ_NUM_W-1:0]   old_wnd_start_in,
    
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
    output  [`FLAG_W-1:0]           reset_rtx_timer,
    output  [`TIMER_W-1:0]          rtx_timer_amnt_out,
    output  [`USER_CONTEXT_W-1:0]   user_cntxt_out
);

// wires and regs
wire                                                is_new_ack;
wire                                                is_dup_ack;

reg     [`FLOW_WIN_SIZE_W-1:0]                      wnd_size_out_tmp;
reg     [`FLOW_WIN_SIZE_W-1:0]                      wnd_inc_cntr_out_tmp;
wire    [`FLOW_WIN_SIZE_W-1:0]                      half_ss_thresh;

wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_zero;
wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_one;
wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_two;

// user-defined context

wire    [`FLOW_WIN_SIZE_W-1:0]                      dup_acks_in;
wire    [`FLOW_WIN_SIZE_W-1:0]                      ss_thresh_in;
wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_inc_cntr_in;
wire    [`FLAG_W-1:0]                               in_timeout_in;

wire    [`FLOW_WIN_SIZE_W-1:0]                      dup_acks_out;
wire    [`FLOW_WIN_SIZE_W-1:0]                      ss_thresh_out;
wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_inc_cntr_out;
wire    [`FLAG_W-1:0]                               in_timeout_out;

//------------------------------------------------------------------------
// Combinational logic

assign {in_timeout_in, wnd_inc_cntr_in, ss_thresh_in,
        dup_acks_in} = user_cntxt_in;

assign user_cntxt_out =  {in_timeout_out, wnd_inc_cntr_out, ss_thresh_out,
                          dup_acks_out};

assign  wnd_zero = {`FLOW_WIN_SIZE_W{1'b0}};
assign  wnd_one = {{(`FLOW_WIN_SIZE_W-1){1'b0}}, {1'b1}};
assign  wnd_two = {{(`FLOW_WIN_SIZE_W-2){1'b0}}, {2'd2}};

assign is_dup_ack = old_wnd_start_in == cumulative_ack_in;
assign is_new_ack = wnd_start_in > old_wnd_start_in;
assign dup_acks_out = is_new_ack ? wnd_zero:
                      is_dup_ack ? dup_acks_in + wnd_one : dup_acks_in;

// rtx
assign mark_rtx = ~in_timeout_in & dup_acks_out == `DUP_ACKS_THRESH;
assign rtx_start = wnd_start_in;
assign rtx_end = wnd_start_in + 1;

assign wnd_size_out         = wnd_size_out_tmp >= `MAX_FLOW_WIN_SIZE ? `MAX_FLOW_WIN_SIZE : wnd_size_out_tmp;
assign wnd_inc_cntr_out     = wnd_inc_cntr_out_tmp;
assign rtx_timer_amnt_out   = rtx_timer_amnt_in;
assign reset_rtx_timer      = is_new_ack;
assign in_timeout_out       = (~is_new_ack) & in_timeout_in;

assign half_ss_thresh = wnd_size_in > wnd_two ? {1'b0, wnd_size_in[`FLOW_WIN_SIZE_W-1:1]} : wnd_two;
assign ss_thresh_out = ~in_timeout_in & dup_acks_out == `DUP_ACKS_THRESH ? half_ss_thresh : ss_thresh_in;

// wnd size tmp
always @(*) begin
    if (is_new_ack) begin
        if (~in_timeout_in & dup_acks_in > 0 & dup_acks_in < `DUP_ACKS_THRESH) begin
            wnd_size_out_tmp = wnd_size_in - dup_acks_in;
        end
        else if(~in_timeout_in & dup_acks_in >= `DUP_ACKS_THRESH) begin
            wnd_size_out_tmp = ss_thresh_in;
        end
        else if(wnd_size_in < ss_thresh_in) begin
            wnd_size_out_tmp = wnd_size_in + wnd_one;
        end
        else begin
            wnd_size_out_tmp = wnd_inc_cntr_in == wnd_size_in ? wnd_size_in + wnd_one : wnd_size_in;
        end 
    end
    else if (~in_timeout_in & is_dup_ack & 
              dup_acks_out < `MAX_DUP_ACKS) begin
        wnd_size_out_tmp = wnd_size_in + wnd_one;
    end
    else begin
        wnd_size_out_tmp = wnd_size_in;
    end
end

// wnd inc cntr tmp
always @(*) begin
    if (is_new_ack) begin
        wnd_inc_cntr_out_tmp = wnd_inc_cntr_in == wnd_size_in ? wnd_zero : wnd_inc_cntr_in + wnd_one;
    end
    else if (~in_timeout_in & is_dup_ack) begin
        wnd_inc_cntr_out_tmp = (dup_acks_out >= `DUP_ACKS_THRESH) ? wnd_zero : wnd_inc_cntr_in;
    end
    else begin
        wnd_inc_cntr_out_tmp = wnd_inc_cntr_in;
    end
end

// clogb2 function
`include "clogb2.vh"

endmodule
