// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module dd_next (
    //// input interface
    
    // context
    input           [`FLOW_WIN_SIZE-1:0]    rtx_wnd_in,
    input           [`TX_CNT_WIN_SIZE-1:0]  tx_cnt_wnd_in,
    input           [`FLOW_SEQ_NUM_W-1:0]   next_new_in,
    input           [`FLOW_WIN_IND_W-1:0]   wnd_start_ind_in,
    input           [`FLOW_SEQ_NUM_W-1:0]   wnd_start_in,
    input           [`FLOW_WIN_SIZE_W-1:0]  wnd_size_in,
    input           [`PKT_QUEUE_IND_W-1:0]  pkt_queue_size_in,
    input           [`FLOW_SEQ_NUM_W-1:0]   total_tx_cnt_in,

    // output interface
    output          [`FLOW_WIN_SIZE-1:0]    rtx_wnd_out,
    output          [`TX_CNT_WIN_SIZE-1:0]  tx_cnt_wnd_out,
    output          [`FLOW_SEQ_NUM_W-1:0]   next_new_out,
    output          [`PKT_QUEUE_IND_W-1:0]  pkt_queue_size_out,
    output          [`FLAG_W-1:0]           back_pressure_out,
    output          [`FLOW_SEQ_NUM_W-1:0]   total_tx_cnt_out,

    output  reg     [`FLOW_SEQ_NUM_W-1:0]   next_seq_out,                
    output          [`TX_CNT_W-1:0]         next_seq_tx_id_out,
    output  reg     [`FLOW_WIN_IND_W-1:0]   next_seq_ind_out 
);

//*********************************************************************************
// Wires and Regs
//*********************************************************************************

wire    [`FLOW_WIN_SIZE-1:0]    wnd_mask;

wire                            wnd_range_val_1;
wire    [`FLOW_WIN_IND_W-1:0]   wnd_range_start_1;
wire    [`FLOW_WIN_IND_W-1:0]   wnd_range_end_1;

wire                            wnd_range_val_2;
wire    [`FLOW_WIN_IND_W-1:0]   wnd_range_start_2;
wire    [`FLOW_WIN_IND_W-1:0]   wnd_range_end_2;

wire    [`FLOW_WIN_SIZE-1:0]    masked_rtx_wnd;
wire    [`FLOW_WIN_IND_W-1:0]   first_rtx_ind;
wire                            rtx_exists;

reg     [`FLOW_WIN_IND_W-1:0]   tmp_next_seq_out;

wire    [`FLOW_WIN_IND_W-1:0]   end_of_wnd_ind_tmp;
wire    [`FLOW_WIN_IND_W-1:0]   end_of_wnd_ind;

wire    [`FLOW_SEQ_NUM_W-1:0]   next_new_ind_tmp;
wire    [`FLOW_WIN_IND_W-1:0]   next_new_ind;
 
//*********************************************************************************
// Logic
//*********************************************************************************

localparam  R_FLOW_IND_W = `FLOW_WIN_IND_W-1;

wire  [`FLOW_SEQ_NUM_W-1:0] padded_wnd_size_in;
assign  padded_wnd_size_in = {{(`FLOW_SEQ_NUM_W - `FLOW_WIN_SIZE_W){1'b0}}, wnd_size_in};

// next new ind
assign next_new_ind_tmp = next_new_in - wnd_start_in + wnd_start_ind_in; 
assign next_new_ind = {1'b0, next_new_ind_tmp[R_FLOW_IND_W-1:0]};
 

assign end_of_wnd_ind_tmp = wnd_start_ind_in + wnd_size_in;
assign end_of_wnd_ind = {1'b0, end_of_wnd_ind_tmp[R_FLOW_IND_W-1:0]};

//// mask window
assign end_of_wnd_ind_tmp = wnd_start_ind_in + wnd_size_in;
assign end_of_wnd_ind = {1'b0, end_of_wnd_ind_tmp[R_FLOW_IND_W-1:0]};

// wnd mask
assign wnd_range_val_1 = 1'b1;
assign wnd_range_start_1 = wnd_start_ind_in;
assign wnd_range_end_1 = (end_of_wnd_ind >= wnd_start_ind_in) ? end_of_wnd_ind : `FLOW_WIN_SIZE;

assign wnd_range_val_2 = end_of_wnd_ind < wnd_start_ind_in;
assign wnd_range_start_2 = {(R_FLOW_IND_W+1){1'b0}};
assign wnd_range_end_2 = end_of_wnd_ind;

genvar i;

// create mask
generate
for (i = 0; i < `FLOW_WIN_SIZE; i = i + 1) begin: gen_wnd_mask
    assign wnd_mask[i] = (wnd_range_val_1 & (i >= wnd_range_start_1) & (i < wnd_range_end_1)) |
                         (wnd_range_val_2 & (i >= wnd_range_start_2) & (i < wnd_range_end_2)) ;
end
endgenerate


// mask rtx_wnd
generate
for (i = 0; i < `FLOW_WIN_SIZE; i = i + 1) begin: gen_masekd_rtx_wnd
    assign masked_rtx_wnd[i] = rtx_wnd_in[i] & wnd_mask[i];
end
endgenerate

// tx cnt wnd
generate 
for (i = 0; i < `FLOW_WIN_SIZE; i = i + 1) begin: gen_tx_cnt_wnd
    assign tx_cnt_wnd_out[((i + 1) * `TX_CNT_W) - 1 -: `TX_CNT_W] = 
                    (i == next_seq_ind_out & rtx_exists & 
                     tx_cnt_wnd_in[((i + 1)*`TX_CNT_W)-1-:`TX_CNT_W]< `MAX_TX_CNT)  ? tx_cnt_wnd_in[((i + 1) * `TX_CNT_W) - 1 -: `TX_CNT_W] + {{(`TX_CNT_W - 1){1'b0}}, 1'b1}:
                    (i == next_seq_ind_out & !rtx_exists)                           ? {`TX_CNT_W{1'b0}} 
                                                                                    : tx_cnt_wnd_in[((i + 1) * `TX_CNT_W) - 1 -: `TX_CNT_W]; 
end
endgenerate

// find first to retransmit
ff_wnd  #(
    .VECT_WIDTH         (`FLOW_WIN_SIZE     ),
    .VECT_IND_WIDTH     (`FLOW_WIN_IND_W    ),
    .BLOCK_WIDTH        (4                  )
)   
find_first          (
    .vect_in            (masked_rtx_wnd     ),
    .select_set_in      (1'b1               ),
    .head_in            (wnd_start_ind_in   ),
    .val_out            (rtx_exists         ),
    .ind_out            (first_rtx_ind      )
);


// update rtx_wnd if there is anything to retransmit
generate
for (i = 0; i < `FLOW_WIN_SIZE; i = i + 1) begin: gen_rtx_wnd
    assign rtx_wnd_out[i] = (rtx_exists & (i == first_rtx_ind)) ? 1'b0 : masked_rtx_wnd[i];
end
endgenerate

// Decide what next sequence number should be:
// if there is anything to retransmit, then retransmit
// else if you have more new to send, send new
// else output None
always @(*) begin
    if (rtx_exists) begin
        tmp_next_seq_out = `FLOW_WIN_SIZE + first_rtx_ind - wnd_start_ind_in; 
        next_seq_out = {{(`FLOW_SEQ_NUM_W - R_FLOW_IND_W){1'b0}}, tmp_next_seq_out[R_FLOW_IND_W-1:0]} + wnd_start_in;  
    end
    else if (next_new_in < wnd_start_in + padded_wnd_size_in) begin
        next_seq_out = next_new_in;
    end  
    else begin
        next_seq_out = `FLOW_SEQ_NONE;
    end  
end

always @(*) begin
    if (rtx_exists) begin
        next_seq_ind_out = first_rtx_ind;
    end
    else if (next_new_in < wnd_start_in + padded_wnd_size_in) begin
        next_seq_ind_out = next_new_ind;
    end  
    else begin
        next_seq_ind_out = end_of_wnd_ind;
    end  
end

assign next_seq_tx_id_out = tx_cnt_wnd_out[(next_seq_ind_out + 1) * `TX_CNT_W - 1 -: `TX_CNT_W];

//// Update Context
wire    [`FLOW_SEQ_NUM_W-1:0]   end_wnd_seq;
assign  end_wnd_seq = wnd_start_in + padded_wnd_size_in;

assign next_new_out = next_new_in + ((~rtx_exists) & (next_new_in < end_wnd_seq) ? 1 : 0);

// pkt_queue_size_out
assign pkt_queue_size_out = pkt_queue_size_in + {{(`PKT_QUEUE_IND_W - 1){1'b0}}, 1'b1};

// back_pressure
assign back_pressure_out = pkt_queue_size_out >= `PKT_QUEUE_STOP_THRESH;

assign total_tx_cnt_out = next_seq_out == `FLOW_SEQ_NONE ? total_tx_cnt_in : total_tx_cnt_in + 1;
// clogb2 function
`include "clogb2.vh"

endmodule
