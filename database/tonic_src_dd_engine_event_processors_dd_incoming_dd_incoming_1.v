// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module dd_incoming_1 (
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
    input   [`FLOW_WIN_IND_W-1:0]   wnd_start_ind_in,
    input   [`FLOW_SEQ_NUM_W-1:0]   wnd_start_in,
    input   [`FLOW_WIN_SIZE_W-1:0]  wnd_size_in,
    input   [`FLOW_SEQ_NUM_W-1:0]   next_new_in,
    input   [`TIMER_W-1:0]          rtx_timer_amnt_in,
    input   [`FLOW_SEQ_NUM_W-1:0]   total_tx_cnt_in,
    input   [`USER_CONTEXT_W-1:0]   user_cntxt_in,
    
    // output
    output  [`FLOW_WIN_SIZE-1:0]    rtx_wnd_out,
    output  [`FLOW_WIN_SIZE_W-1:0]  wnd_size_out,
    output  [`FLAG_W-1:0]           reset_rtx_timer,
    output  [`TIMER_W-1:0]          rtx_timer_amnt_out, 
    output  [`USER_CONTEXT_W-1:0]   user_cntxt_out
);

localparam  R_FLOW_WIN_IND_W = `FLOW_WIN_IND_W - 1;

//*********************************************************************************
// Wires and Regs
//*********************************************************************************

wire                                                mark_rtx;

wire    [`FLOW_SEQ_NUM_W-1:0]                       rtx_start_ind_tmp;
wire    [`FLOW_WIN_IND_W-1:0]                       rtx_start_ind;

wire    [`FLOW_SEQ_NUM_W-1:0]                       rtx_end_ind_tmp;
wire    [`FLOW_WIN_IND_W-1:0]                       rtx_end_ind;

wire                                                rtx_range_val_1;
wire    [`FLOW_WIN_IND_W-1:0]                       rtx_range_start_1;
wire    [`FLOW_WIN_IND_W-1:0]                       rtx_range_end_1;

wire                                                rtx_range_val_2;
wire    [`FLOW_WIN_IND_W-1:0]                       rtx_range_start_2;
wire    [`FLOW_WIN_IND_W-1:0]                       rtx_range_end_2;

wire    [`FLOW_SEQ_NUM_W-1:0]                       rtx_start;
wire    [`FLOW_SEQ_NUM_W-1:0]                       rtx_end;

//*********************************************************************************
// Logic
//*********************************************************************************

user_defined_incoming ud_inc (.pkt_type_in          (pkt_type_in          ),
                              .pkt_data_in          (pkt_data_in          ),
                              .cumulative_ack_in    (cumulative_ack_in    ),
                              .selective_ack_in     (selective_ack_in     ),
                              .sack_tx_id_in        (sack_tx_id_in        ),
                              .now                  (now                  ),

                              .valid_selective_ack  (valid_selective_ack  ),
                              .new_c_acks_cnt       (new_c_acks_cnt       ),
                              .old_wnd_start_in     (old_wnd_start_in     ),
    
                              .acked_wnd_in         (acked_wnd_in         ),
                              .rtx_wnd_in           (rtx_wnd_in           ),
                              .tx_cnt_wnd_in        (tx_cnt_wnd_in        ),
                              .wnd_start_in         (wnd_start_in         ),
                              .wnd_size_in          (wnd_size_in          ),
                              .next_new_in          (next_new_in          ),
                              .rtx_timer_amnt_in    (rtx_timer_amnt_in    ),
                              .total_tx_cnt_in      (total_tx_cnt_in      ),
                              .user_cntxt_in        (user_cntxt_in        ),

                              .mark_rtx             (mark_rtx             ),
                              .rtx_start            (rtx_start            ),
                              .rtx_end              (rtx_end              ),
                              .wnd_size_out         (wnd_size_out         ),
                              .reset_rtx_timer      (reset_rtx_timer      ),
                              .rtx_timer_amnt_out   (rtx_timer_amnt_out   ),
                              .user_cntxt_out       (user_cntxt_out       ));
// rtx_wnd
assign rtx_start_ind_tmp = rtx_start - wnd_start_in + wnd_start_ind_in;
assign rtx_start_ind = {1'b0, rtx_start_ind_tmp[R_FLOW_WIN_IND_W-1:0]};

assign rtx_end_ind_tmp = rtx_end - wnd_start_in + wnd_start_ind_in;
assign rtx_end_ind     = {1'b0, rtx_end_ind_tmp[R_FLOW_WIN_IND_W-1:0]};

assign rtx_range_val_1 = 1'b1;
assign rtx_range_start_1 = rtx_start_ind;
assign rtx_range_end_1 = (rtx_end_ind >= rtx_start_ind) ? rtx_end_ind : `FLOW_WIN_SIZE;

assign rtx_range_val_2 = rtx_end_ind < rtx_start_ind;
assign rtx_range_start_2 = {(R_FLOW_WIN_IND_W+1){1'b0}};
assign rtx_range_end_2 = rtx_end_ind;

genvar i;

generate
for (i = 0; i < `FLOW_WIN_SIZE; i = i + 1) begin: gen_rtx
    assign rtx_wnd_out[i] = ~acked_wnd_in[i] & 
                            ((mark_rtx &
                             ((rtx_range_val_1 & i >= rtx_range_start_1 & i < rtx_range_end_1) |
                              (rtx_range_val_2 & i >= rtx_range_start_2 & i < rtx_range_end_2))) 
                            ? 1'b1 : rtx_wnd_in[i]);
end
endgenerate

// clogb2 function
`include "clogb2.vh"
endmodule
