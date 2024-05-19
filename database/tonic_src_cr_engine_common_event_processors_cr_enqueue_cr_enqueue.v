// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module cr_enqueue (
    //// Inputs
            
    input   [`FLOW_SEQ_NUM_W-1:0]       enq_seq,
    input   [`TX_CNT_W-1:0]             enq_seq_tx_id,

    // context
    input   [`MAX_QUEUE_BITS-1:0]       pkt_queue_in,
    input   [`MAX_TX_ID_BITS-1:0]       tx_id_queue_in,
    input   [`PKT_QUEUE_IND_W-1:0]      pkt_queue_tail_in,
    input   [`PKT_QUEUE_IND_W-1:0]      pkt_queue_size_in,

    //// Outputs
    output  [`MAX_QUEUE_BITS-1:0]       pkt_queue_out,
    output  [`MAX_TX_ID_BITS-1:0]       tx_id_queue_out,
    output  [`PKT_QUEUE_IND_W-1:0]      pkt_queue_tail_out,
    output  [`PKT_QUEUE_IND_W-1:0]      pkt_queue_size_out
);


// pkt_queue
genvar i;

generate
for (i = 0; i < `MAX_PKT_QUEUE_SIZE; i = i + 1) begin: gen_pkt_queue
    assign pkt_queue_out[(i + 1) * `FLOW_SEQ_NUM_W - 1 -: `FLOW_SEQ_NUM_W] = (i == pkt_queue_tail_in) ? enq_seq : 
                                                                             pkt_queue_in[(i + 1) * `FLOW_SEQ_NUM_W - 1 -: `FLOW_SEQ_NUM_W];    
end
endgenerate

// tx_id_queue
generate
for (i = 0; i < `MAX_PKT_QUEUE_SIZE; i = i + 1) begin: gen_tx_id_queue
    assign tx_id_queue_out[(i + 1) * `TX_CNT_W - 1 -: `TX_CNT_W] = (i == pkt_queue_tail_in) ? enq_seq_tx_id : 
                                                                   tx_id_queue_in[(i + 1) * `TX_CNT_W - 1 -: `TX_CNT_W];    
end
endgenerate


// pkt_queue_tail
wire    [`PKT_QUEUE_IND_W:0]    next_tail;
assign  next_tail = pkt_queue_tail_in + {{(`PKT_QUEUE_IND_W-1){1'b0}}, 1'b1};

assign pkt_queue_tail_out = (enq_seq == `FLOW_SEQ_NONE) ? pkt_queue_tail_in : next_tail[`PKT_QUEUE_IND_W-1:0];

// pkt_queue_size
assign pkt_queue_size_out = (enq_seq == `FLOW_SEQ_NONE) ? pkt_queue_size_in : (pkt_queue_size_in + {{(`PKT_QUEUE_IND_W-1){1'b0}}, 1'b1});

// clogb2 function
`include "clogb2.vh"
endmodule 
