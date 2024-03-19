`timescale 1 ps / 1 ps
module EGRESS(
input clk,
input reset,

input in_tdma_pkt_wr,
input [133:0] in_tdma_pkt,
input in_tdma_valid_wr,
input in_tdma_valid,
output out_tdma_pkt_almostfull,

output  out_outputctrl_pkt_wr,
output  [133:0] out_outputctrl_pkt,
output  out_outputctrl_valid_wr,
output  out_outputctrl_valid,
input in_outputctrl_pkt_almostfull
);

EGRESS_OFFSET EGRESS_OFFSET(
.clk(clk),
.reset(reset),

.in_tdma_pkt_wr(in_tdma_pkt_wr),
.in_tdma_pkt(in_tdma_pkt),
.in_tdma_valid_wr(in_tdma_valid_wr),
.in_tdma_valid(in_tdma_valid),
.out_tdma_pkt_almostfull(out_tdma_pkt_almostfull),

.out_outputctrl_pkt_wr(out_outputctrl_pkt_wr),
.out_outputctrl_pkt(out_outputctrl_pkt),
.out_outputctrl_valid_wr(out_outputctrl_valid_wr),
.out_outputctrl_valid(out_outputctrl_valid),
.in_outputctrl_pkt_almostfull(in_outputctrl_pkt_almostfull)
);

endmodule