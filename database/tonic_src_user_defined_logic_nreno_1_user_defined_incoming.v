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
wire                                                full_ack;
wire                                                partial_ack;
wire                                                do_fast_rtx;

reg    [`FLOW_WIN_SIZE_W-1:0]                      wnd_size_out_tmp;
reg     [`FLOW_WIN_SIZE_W-1:0]                      wnd_inc_cntr_out_tmp;
wire    [`FLOW_WIN_SIZE_W-1:0]                      half_ss_thresh;
wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_min_dups;
wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_plus_one;

wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_zero;
wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_one;
wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_two;

wire    [`FLOW_WIN_SIZE_W-1:0]                      in_flight;
wire    [`FLOW_WIN_SIZE_W-1:0]                      available_cwnd;
// user-defined context

wire    [`FLOW_WIN_SIZE_W-1:0]                      dup_acks_in;
wire    [`FLOW_WIN_SIZE_W-1:0]                      ss_thresh_in;
wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_inc_cntr_in;
wire    [`FLAG_W-1:0]                               in_timeout_in;
wire    [`FLOW_SEQ_NUM_W-1:0]                       recover_in;
wire    [`FLAG_W-1:0]                               in_recovery_in;
wire    [`FLOW_SEQ_NUM_W-1:0]                       prev_hgst_ack_in;
wire    [`FLOW_WIN_SIZE_W-1:0]                      cwnd_in;

wire    [`FLOW_WIN_SIZE_W-1:0]                      dup_acks_out;
wire    [`FLOW_WIN_SIZE_W-1:0]                      ss_thresh_out;
wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_inc_cntr_out;
wire    [`FLAG_W-1:0]                               in_timeout_out;
wire    [`FLOW_SEQ_NUM_W-1:0]                       recover_out;
wire    [`FLAG_W-1:0]                               in_recovery_out;
wire    [`FLOW_SEQ_NUM_W-1:0]                       prev_hgst_ack_out;
reg     [`FLOW_WIN_SIZE_W-1:0]                      cwnd_out;

//------------------------------------------------------------------------
// Combinational logic

assign {prev_hgst_ack_in, in_recovery_in, recover_in,
        in_timeout_in, wnd_inc_cntr_in, ss_thresh_in,
        dup_acks_in, cwnd_in} = user_cntxt_in;

assign user_cntxt_out =  {prev_hgst_ack_out, in_recovery_out, recover_out,
                          in_timeout_out, wnd_inc_cntr_out, ss_thresh_out,
                          dup_acks_out, cwnd_out};

// constant window sizes
assign  wnd_zero = {`FLOW_WIN_SIZE_W{1'b0}};
assign  wnd_one = {{(`FLOW_WIN_SIZE_W-1){1'b0}}, {1'b1}};
assign  wnd_two = {{(`FLOW_WIN_SIZE_W-2){1'b0}}, {2'd2}};

// rtx
assign mark_rtx = do_fast_rtx | partial_ack;

assign rtx_start = wnd_start_in;
assign rtx_end = wnd_start_in + 1;

// other state variables
assign is_dup_ack = old_wnd_start_in == cumulative_ack_in;
assign is_new_ack = wnd_start_in > old_wnd_start_in;
assign dup_acks_out = is_new_ack ? wnd_zero:
                      is_dup_ack ? dup_acks_in + wnd_one : dup_acks_in;

assign do_fast_rtx = dup_acks_out == `DUP_ACKS_THRESH & 
                     ((cumulative_ack_in > recover_in) |
                      (wnd_size_in > wnd_one &
                       cumulative_ack_in - prev_hgst_ack_in <= 4));

assign recover_out = do_fast_rtx ? next_new_in - 1: recover_in;

assign ss_thresh_out = do_fast_rtx ? half_ss_thresh : ss_thresh_in;

assign full_ack = is_new_ack & cumulative_ack_in > recover_in;
assign partial_ack = is_new_ack & cumulative_ack_in <= recover_in;

assign in_recovery_out = (in_recovery_in & cumulative_ack_in <= recover_in) |
                         (do_fast_rtx);

assign  prev_hgst_ack_out = is_new_ack ? old_wnd_start_in : prev_hgst_ack_in;

assign wnd_size_out         = wnd_size_out_tmp >= `MAX_FLOW_WIN_SIZE ? `MAX_FLOW_WIN_SIZE : wnd_size_out_tmp;
assign wnd_inc_cntr_out     = wnd_inc_cntr_out_tmp;
assign rtx_timer_amnt_out   = rtx_timer_amnt_in;
assign reset_rtx_timer      = ~in_recovery_out;
assign in_timeout_out       = (~full_ack) & in_timeout_in;

assign half_ss_thresh = in_flight > wnd_two ? {1'b0, in_flight[`FLOW_WIN_SIZE_W-1:1]} : wnd_one;
//assign wnd_min_dups = wnd_size_in - dup_acks_in; 
//assign wnd_plus_one = wnd_size_in + wnd_one; 

// in flight

wire  [`FLOW_WIN_SIZE_W-2:0]  next_new_ind;
wire  [`FLOW_WIN_SIZE_W-2:0]  wnd_start_ind;
wire  [`FLOW_WIN_SIZE_W-1:0]  sent_tmp;
wire  [`FLOW_WIN_SIZE_W-2:0]  sent_out;

assign next_new_ind = next_new_in[`FLOW_WIN_SIZE_W-2:0];
assign wnd_start_ind = wnd_start_in[`FLOW_WIN_SIZE_W-2:0];
assign sent_tmp = {1'b1, next_new_ind} - wnd_start_ind;
assign sent_out = sent_tmp[`FLOW_WIN_SIZE_W-2:0]; 
assign in_flight = sent_out - dup_acks_out; 
// wnd size tmp
always @(*) begin
  if (do_fast_rtx) begin
    // cwnd_out = ss_thresh_out
    cwnd_out = sent_out > 5 ? sent_out[`FLOW_WIN_SIZE_W-2:1] - 7'd1 : wnd_one; 
  end
  else if (~in_recovery_in & is_new_ack) begin
    if (cwnd_in < ss_thresh_out) begin
      cwnd_out = cwnd_in + new_c_acks_cnt;
    end
    else if (wnd_inc_cntr_in >= cwnd_in) begin
      cwnd_out = cwnd_in + wnd_one;
    end
    else begin
      cwnd_out = cwnd_in;
    end
  end
  else begin
    cwnd_out = cwnd_in;
  end 
end

wire there_is_more;

assign there_is_more = in_flight >= cwnd_in;

always @(*) begin
  if (do_fast_rtx) begin
    wnd_size_out_tmp = sent_out;
  end
  else if (~in_recovery_in & is_new_ack) begin
    wnd_size_out_tmp = cwnd_out;
  end
  else begin
    wnd_size_out_tmp = there_is_more ? sent_out : cwnd_in + dup_acks_out;
  end
end
 
//assign wnd_size_out_tmp = in_flight > cwnd_out ? sent_out : cwnd_out + dup_acks_out;
//assign available_cwnd = in_flight > cwnd_out ? 0 : (cwnd_out - in_flight);
//assign wnd_size_out_tmp = sent_out + available_cwnd;

// wnd inc cntr tmp
always @(*) begin
    if (in_recovery_out & ~in_timeout_in) begin
        wnd_inc_cntr_out_tmp = wnd_zero;
    end
    else if (is_new_ack & cwnd_in >= ss_thresh_out) begin
        wnd_inc_cntr_out_tmp = wnd_inc_cntr_in == cwnd_in ? wnd_zero : wnd_inc_cntr_in + wnd_one;
    end
    else begin
        wnd_inc_cntr_out_tmp = wnd_inc_cntr_in;
    end
end

// clogb2 function
`include "clogb2.vh"

endmodule
