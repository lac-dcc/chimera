// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module dd_incoming_0 (
    //// input interface
    input   [`PKT_TYPE_W-1:0]       pkt_type_in,
    input   [`FLOW_SEQ_NUM_W-1:0]   cumulative_ack_in,
    input   [`FLOW_SEQ_NUM_W-1:0]   selective_ack_in,
    input   [`TX_CNT_W-1:0]         sack_tx_id_in,

    // context
    input   [`FLOW_WIN_SIZE-1:0]    acked_wnd_in,
    input   [`FLOW_WIN_IND_W-1:0]   wnd_start_ind_in,
    input   [`FLOW_SEQ_NUM_W-1:0]   wnd_start_in,
    input   [`FLOW_WIN_SIZE_W-1:0]  wnd_size_in,

    //// output interface

    output  [`FLAG_W-1:0]           valid_selective_ack,
    output  [`FLOW_WIN_IND_W-1:0]   new_c_acks_cnt,

    // context
    
    output  [`FLOW_WIN_SIZE-1:0]    acked_wnd_out,
    output  [`FLOW_WIN_IND_W-1:0]   wnd_start_ind_out,
    output  [`FLOW_SEQ_NUM_W-1:0]   wnd_start_out
);

localparam  R_FLOW_WIN_IND_W = `FLOW_WIN_IND_W - 1;

//*********************************************************************************
// Wires and Regs
//*********************************************************************************

wire    [`FLOW_SEQ_NUM_W-1:0]                       selective_ack_ind_tmp;
wire    [`FLOW_WIN_IND_W-2:0]                       selective_ack_ind;

wire    [`FLOW_WIN_IND_W-1:0]                       end_of_wnd_ind_tmp;
wire    [`FLOW_WIN_IND_W-1:0]                       end_of_wnd_ind;

// window
wire    [`FLOW_WIN_SIZE-1:0]                        wnd_mask;
wire                                                wnd_range_val_1;
wire    [`FLOW_WIN_IND_W-1:0]                       wnd_range_start_1;
wire    [`FLOW_WIN_IND_W-1:0]                       wnd_range_end_1;

wire                                                wnd_range_val_2;
wire    [`FLOW_WIN_IND_W-1:0]                       wnd_range_start_2;
wire    [`FLOW_WIN_IND_W-1:0]                       wnd_range_end_2;

// newly-acked
wire    [`FLOW_WIN_SIZE-1:0]                        nwack_wnd_mask;
wire    [`FLOW_WIN_SIZE-1:0]                        nwack_wnd;

wire                                                nwack_wnd_range_val_1;
wire    [`FLOW_WIN_IND_W-1:0]                       nwack_wnd_range_start_1;
wire    [`FLOW_WIN_IND_W-1:0]                       nwack_wnd_range_end_1;

wire                                                nwack_wnd_range_val_2;
wire    [`FLOW_WIN_IND_W-1:0]                       nwack_wnd_range_start_2;
wire    [`FLOW_WIN_IND_W-1:0]                       nwack_wnd_range_end_2;

//*********************************************************************************
// Logic
//*********************************************************************************

assign end_of_wnd_ind_tmp = wnd_start_ind_out + wnd_size_in;
assign end_of_wnd_ind = {1'b0, end_of_wnd_ind_tmp[R_FLOW_WIN_IND_W-1:0]};

// wnd start output
assign wnd_start_out = (cumulative_ack_in > wnd_start_in) ? cumulative_ack_in : wnd_start_in;

wire   [`FLOW_SEQ_NUM_W-1:0]    wnd_start_ind_out_tmp;
assign wnd_start_ind_out_tmp = wnd_start_ind_in + wnd_start_out - wnd_start_in;
assign wnd_start_ind_out = {1'b0, wnd_start_ind_out_tmp[R_FLOW_WIN_IND_W-1:0]};

// wnd mask
assign wnd_range_val_1 = 1'b1;
assign wnd_range_start_1 = wnd_start_ind_out;
assign wnd_range_end_1 = (end_of_wnd_ind >= wnd_start_ind_out) ? end_of_wnd_ind : `FLOW_WIN_SIZE;

assign wnd_range_val_2 = end_of_wnd_ind < wnd_start_ind_out;
assign wnd_range_start_2 = {(R_FLOW_WIN_IND_W+1){1'b0}};
assign wnd_range_end_2 = end_of_wnd_ind;

// acks
assign selective_ack_ind_tmp = selective_ack_in - wnd_start_in + wnd_start_ind_in;
assign selective_ack_ind = selective_ack_ind_tmp[R_FLOW_WIN_IND_W-1:0];

assign valid_selective_ack = ~acked_wnd_in[selective_ack_ind] & 
                             selective_ack_in > wnd_start_out &
                             (selective_ack_in < wnd_start_out + wnd_size_in);

genvar i;

// mask for new window
generate
for (i = 0; i < `FLOW_WIN_SIZE; i = i + 1) begin: gen_wnd_mask
    assign wnd_mask[i] = (wnd_range_val_1 & (i >= wnd_range_start_1) & (i < wnd_range_end_1)) |
                             (wnd_range_val_2 & (i >= wnd_range_start_2) & (i < wnd_range_end_2)) ;
end
endgenerate

// update acked_wnd
generate
for (i = 0; i < `FLOW_WIN_SIZE; i = i + 1) begin: gen_ack
    assign acked_wnd_out[i] = wnd_mask[i] & ~nwack_wnd_mask[i] &
                              (((i == selective_ack_ind) & valid_selective_ack) ? 1'b1 : acked_wnd_in[i]);
end
endgenerate

// newly-acked ranges
assign nwack_wnd_range_val_1 = 1'b1;
assign nwack_wnd_range_start_1 = wnd_start_ind_in;
assign nwack_wnd_range_end_1 = (wnd_start_ind_out >= wnd_start_ind_in) ? wnd_start_ind_out : `FLOW_WIN_SIZE;

assign nwack_wnd_range_val_2 = wnd_start_ind_out < wnd_start_ind_in;
assign nwack_wnd_range_start_2 = {(R_FLOW_WIN_IND_W+1){1'b0}};
assign nwack_wnd_range_end_2 = wnd_start_ind_out;

// nwack_wnd_mask
generate
for (i = 0; i < `FLOW_WIN_SIZE; i = i + 1) begin: gen_nwack_wnd_mask
    assign nwack_wnd_mask[i] = (nwack_wnd_range_val_1 & (i >= nwack_wnd_range_start_1) & (i < nwack_wnd_range_end_1)) |
                          (nwack_wnd_range_val_2 & (i >= nwack_wnd_range_start_2) & (i < nwack_wnd_range_end_2)); 
end
endgenerate


// nwack_wnd
generate
for (i = 0; i < `FLOW_WIN_SIZE; i = i + 1) begin: gen_nwack_wnd
    assign nwack_wnd[i] = ~acked_wnd_in[i] & nwack_wnd_mask[i];
end
endgenerate

// count new acks
cnt_wnd  #(
    .VECT_WIDTH         (`FLOW_WIN_SIZE     ),
    .VECT_IND_WIDTH     (`FLOW_WIN_IND_W    )
) 
cnt_wnd (
    .vect_in            (nwack_wnd          ),
    .select_set_in      (1'b1               ),
    .cnt_out            (new_c_acks_cnt     )
);

// clogb2 function
`include "clogb2.vh"
endmodule
