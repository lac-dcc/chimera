// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module cr_transmit (
                //// Inputs
                // context
                input       [`MAX_QUEUE_BITS-1:0]       pkt_queue,
                input       [`MAX_TX_ID_BITS-1:0]       tx_id_queue,
                input       [`PKT_QUEUE_IND_W-1:0]      pkt_queue_head_in,
                input       [`PKT_QUEUE_IND_W-1:0]      pkt_queue_size_in,
                
                //// Outputs
                output      [`PKT_QUEUE_IND_W-1:0]      pkt_queue_head_out,
                output      [`PKT_QUEUE_IND_W-1:0]      pkt_queue_size_out,

                output      [`FLOW_SEQ_NUM_W-1:0]       next_seq_out,
                output      [`TX_CNT_W-1:0]             next_seq_tx_id_out 
);

localparam FLOW_SEQ_NUM_LOG = clogb2(`FLOW_SEQ_NUM_W);
localparam TX_ID_LOG = clogb2(`TX_CNT_W);

// pkt_queue_head_out
wire    [`PKT_QUEUE_IND_W:0] head_out;
assign  head_out = pkt_queue_head_in + {{(`PKT_QUEUE_IND_W-1){1'b0}}, 1'b1};
assign  pkt_queue_head_out = head_out[`PKT_QUEUE_IND_W-1:0];

// pkt_queue_size_out
assign  pkt_queue_size_out = pkt_queue_size_in - {{(`PKT_QUEUE_IND_W-1){1'b0}}, 1'b1};

// next_seq_out
wire    [`PKT_QUEUE_IND_W + FLOW_SEQ_NUM_LOG - 1: 0] head_ind;
assign  head_ind = {pkt_queue_head_in, {FLOW_SEQ_NUM_LOG{1'b1}}};
assign next_seq_out = pkt_queue[head_ind -: `FLOW_SEQ_NUM_W];

// next_seq_tx_id_out
wire    [`PKT_QUEUE_IND_W + TX_ID_LOG - 1: 0]   tx_id_head_ind;
assign  tx_id_head_ind = {pkt_queue_head_in, {TX_ID_LOG{1'b1}}};
assign next_seq_tx_id_out = tx_id_queue[tx_id_head_ind -: `TX_CNT_W];

// clogb2 function
`include "clogb2.vh"

endmodule 
