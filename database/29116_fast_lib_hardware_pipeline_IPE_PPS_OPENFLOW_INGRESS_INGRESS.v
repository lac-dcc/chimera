// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

`timescale 1 ps / 1 ps
module INGRESS(
input clk,
input reset,

input in_inputctrl_pkt_wr,
input [133:0] in_inputctrl_pkt,
input in_inputctrl_valid_wr,
input in_inputctrl_valid,
output out_inputctrl_pkt_almostfull,

output out_class_key_wr,
output [133:0] out_class_key,
input in_class_key_almostfull,
output out_class_valid,
output out_class_valid_wr,

input in_class_key_wr,
input [133:0] in_class_key,
input in_class_valid_wr,
input in_class_valid,
output out_class_key_almostfull,

output out_dispather_pkt_wr,
output [133:0] out_dispather_pkt,
output out_dispather_valid_wr,
output out_dispather_valid,
input in_dispather_pkt_almostfull
);

wire out_offset_pkt_wr;
wire [133:0] out_offset_pkt;
wire out_offset_valid;
wire out_offset_valid_wr;
wire in_offset_pkt_almostfull;
INGRESS_CTRL INGRESS_CTRL(
.clk(clk),
.reset(reset),

.in_inputctrl_pkt_wr(in_inputctrl_pkt_wr),
.in_inputctrl_pkt(in_inputctrl_pkt),
.in_inputctrl_valid_wr(in_inputctrl_valid_wr),
.in_inputctrl_valid(in_inputctrl_valid),
.out_inputctrl_pkt_almostfull(out_inputctrl_pkt_almostfull),

.out_class_key_wr(out_class_key_wr),
.out_class_key(out_class_key),
.in_class_key_almostfull(in_class_key_almostfull),
.out_class_valid(out_class_valid),
.out_class_valid_wr(out_class_valid_wr),

.out_offset_pkt_wr(out_offset_pkt_wr),
.out_offset_pkt(out_offset_pkt),
.out_offset_valid(out_offset_valid),
.out_offset_valid_wr(out_offset_valid_wr),
.in_offset_pkt_almostfull(in_offset_pkt_almostfull)
);

INGRESS_OFFSET INGRESS_OFFSET(
.clk(clk),
.reset(reset),

.in_class_key_wr(in_class_key_wr),
.in_class_key(in_class_key),
.in_class_valid_wr(in_class_valid_wr),
.in_class_valid(in_class_valid),
.out_class_key_almostfull(out_class_key_almostfull),

.in_ingress_pkt_wr(out_offset_pkt_wr),
.in_ingress_pkt(out_offset_pkt),
.in_ingress_valid_wr(out_offset_valid_wr),
.in_ingress_valid(out_offset_valid),
.out_ingress_pkt_almostfull(in_offset_pkt_almostfull),

.out_dispather_pkt_wr(out_dispather_pkt_wr),
.out_dispather_pkt(out_dispather_pkt),
.out_dispather_valid_wr(out_dispather_valid_wr),
.out_dispather_valid(out_dispather_valid),
.in_dispather_pkt_almostfull(in_dispather_pkt_almostfull)
);

endmodule