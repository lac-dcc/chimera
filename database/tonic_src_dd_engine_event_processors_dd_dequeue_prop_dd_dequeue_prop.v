// This program was cloned from: https://github.com/minmit/tonic
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ns

module dd_dequeue_prop (
    // Inputs
    input   [`PKT_QUEUE_IND_W-1:0]  pkt_queue_size_in,
    input   [`FLAG_W-1:0]           back_pressure_in,

    // Outputs
    output  [`PKT_QUEUE_IND_W-1:0]  pkt_queue_size_out,
    output  [`FLAG_W-1:0]           back_pressure_out,
    output  [`FLAG_W-1:0]           activated_by_dp
);

assign pkt_queue_size_out = pkt_queue_size_in - {{(`PKT_QUEUE_IND_W-1){1'b0}}, 1'b1};

assign back_pressure_out = ~(back_pressure_in & pkt_queue_size_out < `PKT_QUEUE_START_THRESH) & back_pressure_in;
assign activated_by_dp = back_pressure_in & pkt_queue_size_out < `PKT_QUEUE_START_THRESH;

// clogb2 function
`include "clogb2.vh"

endmodule
