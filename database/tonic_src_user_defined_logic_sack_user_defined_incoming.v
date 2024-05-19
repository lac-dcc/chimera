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

// local parameters
localparam  R_FLOW_WIN_IND_W = `FLOW_WIN_IND_W - 1;

wire                                                is_dup_ack;
wire                                                is_new_ack;
wire    [`FLOW_SEQ_NUM_W-1:0]                       wnd_jump_tmp;
wire                                                enter_fast_rtx;
wire                                                recovered;

wire                                                valid_old_min_sack;
reg     [`FLOW_SEQ_NUM_W-1:0]                       min_sack_out_reg;
wire    [`FLOW_WIN_SIZE_W-1:0]                      sacked_gt_min_plus_one;
wire    [`FLOW_WIN_SIZE_W-1:0]                      sacked_gt_min_tmp;
wire                                                extra_loss;

wire    [`FLOW_SEQ_NUM_W-1:0]                       extra_loss_min_sack;
wire    [`FLOW_SEQ_NUM_W-1:0]                       extra_loss_min_sack_ind;

reg     [`FLOW_WIN_SIZE_W-1:0]                      sacked_gt_min_out_reg;

wire    [`FLOW_WIN_SIZE_W-1:0]                      half_ss_thresh;

wire    [`FLOW_SEQ_NUM_W-1:0]                       last_marked_sack_ind_in;
wire    [`FLOW_WIN_SIZE_W:0]                        wnd_start_plus_one_ind;

wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_zero;
wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_one;
wire    [`FLOW_WIN_SIZE_W-1:0]                      wnd_two;

wire    [`FLOW_SEQ_NUM_W-1:0]                       last_marked_sack_out_tmp;

reg     [`FLOW_WIN_SIZE_W-1:0]                      cwnd_out_reg;
reg     [`FLOW_WIN_SIZE_W-1:0]                      wnd_inc_cntr_out_reg;

// user-defined context
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

//------------------------------------------------------------------------
// Combinational logic

assign user_cntxt_out = {in_timeout_out, in_recovery_out, recover_out,
                          last_marked_sack_out, min_sack_out, wnd_inc_cntr_out,
                          sacked_gt_min_out, dup_acks_out, sacked_out, 
                          ss_thresh_out, cwnd_out};
 
assign {in_timeout_in, in_recovery_in, recover_in,
        last_marked_sack_in, min_sack_in, wnd_inc_cntr_in,
        sacked_gt_min_in, dup_acks_in, sacked_in, 
        ss_thresh_in, cwnd_in} = user_cntxt_in;


assign  wnd_zero = {`FLOW_WIN_SIZE_W{1'b0}};
assign  wnd_one = {{(`FLOW_WIN_SIZE_W-1){1'b0}}, {1'b1}};
assign  wnd_two = {{(`FLOW_WIN_SIZE_W-2){1'b0}}, {2'd2}};

assign is_dup_ack = valid_selective_ack;
assign is_new_ack = cumulative_ack_in > old_wnd_start_in;

// sacked_cnt
assign wnd_jump_tmp         = wnd_start_in - old_wnd_start_in;
assign sacked_out           = sacked_in - wnd_jump_tmp[`FLOW_WIN_IND_W-2:0] + new_c_acks_cnt + valid_selective_ack;

// dup_acks
assign dup_acks_out         = in_timeout_out ? dup_acks_in : 
                              pkt_type_in == `CACK_PKT ? wnd_zero : dup_acks_in + is_dup_ack;

// decide fast rtx
assign enter_fast_rtx       = ~in_recovery_in & dup_acks_out == `DUP_ACKS_THRESH;

// min_sack
assign  valid_old_min_sack  = min_sack_in > wnd_start_in;
assign  min_sack_out        = in_timeout_out ? min_sack_in : min_sack_out_reg;

// decide if more packets than the first element of the window are lost
assign sacked_gt_min_plus_one = sacked_gt_min_in + wnd_one;
assign sacked_gt_min_tmp    = valid_selective_ack ? sacked_gt_min_plus_one : sacked_gt_min_in;
assign sacked_gt_min_out    = in_timeout_out ? sacked_gt_min_in : sacked_gt_min_out_reg;

assign extra_loss           = valid_old_min_sack & sacked_gt_min_tmp == `DUP_ACKS_THRESH; 

// updated last marked sack
assign last_marked_sack_out_tmp = mark_rtx & extra_loss ? extra_loss_min_sack : last_marked_sack_in;
assign last_marked_sack_out     = last_marked_sack_out_tmp >= wnd_start_in ? last_marked_sack_out_tmp : wnd_start_in;

assign recovered            = cumulative_ack_in > recover_in;
assign recover_out          = ~in_timeout_out & enter_fast_rtx ? next_new_in - 1 : recover_in;
assign in_recovery_out      = ~in_timeout_out & (enter_fast_rtx | (in_recovery_in & ~recovered));

assign half_ss_thresh       = wnd_size_in > wnd_two ? {1'b0, wnd_size_in[`FLOW_WIN_SIZE_W-1:1]} : wnd_two;
assign ss_thresh_out        = ~in_timeout_out & enter_fast_rtx ? half_ss_thresh : ss_thresh_in;

assign cwnd_out             = cwnd_out_reg;
assign wnd_size_out         = cwnd_out + (in_timeout_out ? wnd_zero : sacked_out);
assign rtx_timer_amnt_out   = rtx_timer_amnt_in;
assign reset_rtx_timer      = valid_selective_ack;
assign in_timeout_out       = in_timeout_in & ~recovered;
assign wnd_inc_cntr_out     = wnd_inc_cntr_out_reg;

// rtx
assign mark_rtx = ~in_timeout_out & (enter_fast_rtx | (in_recovery_in & extra_loss));

assign rtx_start            = enter_fast_rtx ? wnd_start_in : last_marked_sack_in;

assign extra_loss_min_sack  = selective_ack_in > min_sack_in ? min_sack_in : selective_ack_in;
assign rtx_end                 = extra_loss ? extra_loss_min_sack : wnd_start_in + 1;

// ff
wire    [`FLOW_SEQ_NUM_W-1:0]   msack_hd_tmp;
wire    [`FLOW_WIN_IND_W-1:0]   msack_hd;
wire                            msack_val;
wire    [`FLOW_WIN_IND_W-1:0]   msack_ind;
wire    [`FLOW_WIN_IND_W:0]     msack_diff_tmp;
wire    [`FLOW_SEQ_NUM_W-1:0]   min_sack_from_ff;

assign  msack_hd_tmp    = min_sack_in + 1 - wnd_start_in + wnd_start_in[6:0];
assign  msack_hd        = valid_old_min_sack ? msack_hd_tmp[`FLOW_WIN_IND_W-2:0] : wnd_start_in[6:0];
assign  msack_diff_tmp  = msack_ind - wnd_start_in[6:0] + `FLOW_WIN_SIZE;
assign  min_sack_from_ff = wnd_start_in + msack_diff_tmp[`FLOW_WIN_IND_W-2:0];

ff_wnd #(.VECT_WIDTH        (`FLOW_WIN_SIZE     ),
         .VECT_IND_WIDTH    (`FLOW_WIN_IND_W    ))
       ff_min_sack (.vect_in        (acked_wnd_in),
                    .select_set_in  (1'b1        ),
                    .head_in        (msack_hd    ),
                    .val_out        (msack_val   ),
                    .ind_out        (msack_ind   ));

// regs
always @(*) begin
    if (min_sack_in == `FLOW_SEQ_NONE) begin
        min_sack_out_reg = valid_selective_ack ? selective_ack_in : `FLOW_SEQ_NONE;
    end
    else begin
        if (valid_old_min_sack) begin
            if (valid_selective_ack) begin
                if (selective_ack_in > min_sack_in |
                    selective_ack_in <= last_marked_sack_in) begin
                    min_sack_out_reg = extra_loss ? min_sack_from_ff : min_sack_in;
                end
                else begin
                    min_sack_out_reg = extra_loss ? min_sack_in : selective_ack_in;
                end 
            end
            else begin
                min_sack_out_reg = min_sack_in;
            end
        end
        else begin
            min_sack_out_reg = msack_val ? min_sack_from_ff : `FLOW_SEQ_NONE;
        end 
    end
end

always @(*) begin
    if (min_sack_in == `FLOW_SEQ_NONE) begin
        sacked_gt_min_out_reg = valid_selective_ack ? wnd_one : wnd_zero;
    end
    else begin
        if (valid_old_min_sack) begin
            if (valid_selective_ack) begin
                sacked_gt_min_out_reg = extra_loss ? sacked_gt_min_in : sacked_gt_min_plus_one;
            end
            else begin
                sacked_gt_min_out_reg = sacked_gt_min_in;
            end
        end
        else begin
            sacked_gt_min_out_reg = sacked_gt_min_in - new_c_acks_cnt;
        end 
    end
end

// wnd size tmp
always @(*) begin
    if (in_timeout_in) begin
        cwnd_out_reg = recovered ? wnd_one: cwnd_in;
    end
    else if (in_recovery_in & recovered) begin
        cwnd_out_reg = ss_thresh_in;
    end
    else if (is_new_ack) begin
        if(cwnd_in < ss_thresh_in) begin
            cwnd_out_reg = cwnd_in + wnd_one;
        end
        else begin
            cwnd_out_reg = wnd_inc_cntr_in == cwnd_in ? cwnd_in + wnd_one : cwnd_in;
        end 
    end
    else begin
        cwnd_out_reg = cwnd_in;
    end
end

// wnd inc cntr tmp
always @(*) begin
    if (in_timeout_out | in_recovery_out) begin
        wnd_inc_cntr_out_reg = wnd_zero;
    end
    else if (is_new_ack & cwnd_in >= ss_thresh_in) begin
        wnd_inc_cntr_out_reg = wnd_inc_cntr_in == wnd_size_in ? wnd_zero : wnd_inc_cntr_in + wnd_one;
    end
    else begin
        wnd_inc_cntr_out_reg = wnd_inc_cntr_in;
    end
end


// clogb2 function
`include "clogb2.vh"

endmodule

