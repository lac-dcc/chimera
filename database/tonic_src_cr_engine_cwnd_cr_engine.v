// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module cr_engine (
    input                               clk,
    input                               rst_n,    
    // Inputs
    input   [`FLOW_ID_W-1:0]            enq_fid_in,
    input   [`FLOW_SEQ_NUM_W-1:0]       enq_seq_in,
    input   [`TX_CNT_W-1:0]             enq_seq_tx_id_in,

    input   [`DD_CONTEXT_W-1:0]         dd_cntxt_in,

    input   [`FLOW_ID_W-1:0]            incoming_fid_in,
    input   [`PKT_TYPE_W-1:0]           pkt_type_in,
    input   [`PKT_DATA_W-1:0]           pkt_data_in,

    input   [`FLOW_ID_W-1:0]            timeout_fid_in,

    input                               tx_val,
    // Outputs
    
    output  [`FLOW_ID_W-1:0]            dp_fid_out,
    
    output  [`FLOW_ID_W-1:0]            next_seq_fid_out,
    output  [`FLOW_SEQ_NUM_W-1:0]       next_seq_out,
    output  [`TX_CNT_W-1:0]             next_seq_tx_id_out,

    output  [`CR_CONTEXT_W-1:0]         cr_cntxt_out
);

wire    [`FLOW_ID_W-1:0]        tx_fid_in;

//////// Credit Engine //////////////////

// transport engine outputs
wire    [`FLOW_ID_W-1:0]            tx_enq_fid1;
wire    [`FLOW_ID_W-1:0]            tx_enq_fid2;

assign  cr_cntxt_out  = {`CR_CONTEXT_W{1'b0}};

cr_core  core   (.clk                       (clk                    ),
                 .rst_n                     (rst_n                  ),
                 .enq_fid_in                (enq_fid_in             ),
                 .enq_seq_in                (enq_seq_in             ),
                 .enq_seq_tx_id_in          (enq_seq_tx_id_in       ),
                 .tx_fid_in                 (tx_fid_in              ),

                 .tx_enq_fid1               (tx_enq_fid1            ),
                 .tx_enq_fid2               (tx_enq_fid2            ),
                 .next_seq                  (next_seq_out           ),
                 .next_seq_tx_id            (next_seq_tx_id_out     ),
                 .next_seq_fid              (next_seq_fid_out       ),
                 .dp_fid                    (dp_fid_out             ));
                 

//////// TX Fifo ///////////////////////

// fifo inputs
wire    tx_fifo_w_val_0;
wire    tx_fifo_w_val_1;

reg     [`FLOW_ID_W - 1:0]      queue_w_data_0;    
reg     [`FLOW_ID_W - 1:0]      queue_w_data_1;    

wire    [`FLOW_ID_W:0]          ni_fifo_size;
wire                            ni_fifo_full;
wire                            ni_fifo_data_avail;

wire    [`FLOW_ID_W - 1:0]      tx_fid_tmp;


assign tx_fifo_w_val_0 = queue_w_data_0 != `FLOW_ID_NONE;
assign tx_fifo_w_val_1 = queue_w_data_1 != `FLOW_ID_NONE;

always @(posedge clk) begin
    if (~rst_n) begin
        queue_w_data_0 <= `FLOW_ID_NONE;
        queue_w_data_1 <= `FLOW_ID_NONE;
    end
    else begin
        queue_w_data_0 <= tx_enq_fid1;
        queue_w_data_1 <= tx_enq_fid2;
    end 
end

assign tx_fid_in = tx_val ? tx_fid_tmp : `FLOW_ID_NONE;

fifo_2w #(.FIFO_WIDTH  (`FLOW_ID_W     ),
          .FIFO_DEPTH  (`MAX_FLOW_CNT  ))
                 tx_fifo(.clk           (clk                ),
                         .rst_n         (rst_n              ),
                         
                         .w_val_0       (tx_fifo_w_val_0    ),
                         .w_data_0      (queue_w_data_0     ),
                         
                         .w_val_1       (tx_fifo_w_val_1    ),
                         .w_data_1      (queue_w_data_1     ),

                         .r_val         (tx_val             ),
                         .r_data        (tx_fid_tmp         ),

                         .size          (ni_fifo_size       ),
                         .full          (ni_fifo_full       ),
                         .data_avail    (ni_fifo_data_avail ));


// clogb2 function
`include "clogb2.vh"
endmodule
