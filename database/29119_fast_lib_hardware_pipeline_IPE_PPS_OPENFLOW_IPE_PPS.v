// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

`timescale 1 ps / 1 ps
module IPE_PPS(
input clk,
input reset,

input [5:0] in_fpgaac_channel_num,
input in_fpgaac_cpuid_cs,//switch cpuid allocate mode 0:round robin   1:port bind
input [31:0] cpuid_valid,//lxj20131224
input in_inputctrl_pkt_wr,
input [133:0] in_inputctrl_pkt,
input in_inputctrl_valid_wr,
input in_inputctrl_valid,
output out_inputctrl_pkt_almostfull,

output out_rdma_pkt_wr,
output [133:0] out_rdma_pkt,
output out_rdma_valid_wr,
output out_rdma_valid,
input in_rdma_pkt_almostfull,

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

EGRESS EGRESS(
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

wire in_ingress_key_wr;
wire [133:0] in_ingress_key;
wire out_ingress_key_almostfull;
wire in_ingress_valid_wr;
wire in_ingress_valid;

wire out_offset_key_wr;
wire [133:0] out_offset_key;
wire out_offset_valid;
wire out_offset_valid_wr;
wire in_offset_key_almostfull;
CLASSIFY CLASSIFY(
.clk(clk),
.reset(reset),

.in_ingress_key_wr(in_ingress_key_wr),
.in_ingress_key(in_ingress_key),
.out_ingress_key_almostfull(out_ingress_key_almostfull),
.in_ingress_valid_wr(in_ingress_valid_wr),
.in_ingress_valid(in_ingress_valid),

.out_offset_key_wr(out_offset_key_wr),
.out_offset_key(out_offset_key),
.out_offset_valid(out_offset_valid),
.out_offset_valid_wr(out_offset_valid_wr),
.in_offset_key_almostfull(in_offset_key_almostfull)
);

wire out_dispather_pkt_wr;
wire [133:0] out_dispather_pkt;
wire out_dispather_valid_wr;
wire out_dispather_valid;
wire in_dispather_pkt_almostfull;

INGRESS INGRESS(
.clk(clk),
.reset(reset),

.in_inputctrl_pkt_wr(in_inputctrl_pkt_wr),
.in_inputctrl_pkt(in_inputctrl_pkt),
.in_inputctrl_valid_wr(in_inputctrl_valid_wr),
.in_inputctrl_valid(in_inputctrl_valid),
.out_inputctrl_pkt_almostfull(out_inputctrl_pkt_almostfull),

.out_class_key_wr(in_ingress_key_wr),
.out_class_key(in_ingress_key),
.in_class_key_almostfull(out_ingress_key_almostfull),
.out_class_valid(in_ingress_valid),
.out_class_valid_wr(in_ingress_valid_wr),

.in_class_key_wr(out_offset_key_wr),
.in_class_key(out_offset_key),
.in_class_valid_wr(out_offset_valid_wr),
.in_class_valid(out_offset_valid),
.out_class_key_almostfull(in_offset_key_almostfull),

.out_dispather_pkt_wr(out_dispather_pkt_wr),
.out_dispather_pkt(out_dispather_pkt),
.out_dispather_valid_wr(out_dispather_valid_wr),
.out_dispather_valid(out_dispather_valid),
.in_dispather_pkt_almostfull(in_dispather_pkt_almostfull)
);

wire in_ppc_pkt_wr;
wire [133:0] in_ppc_pkt;
wire in_ppc_valid_wr;
wire in_ppc_valid;
wire out_ppc_pkt_almostfull;

/*wire out_ppc_pkt_wr;
wire [133:0] out_ppc_pkt;
wire out_ppc_valid_wr;
wire out_ppc_valid;
wire in_ppc_pkt_almostfull;*/
DISPATHER DISPATHER(
.clk(clk),
.reset(reset),

.in_fpgaac_channel_num(in_fpgaac_channel_num),
.in_fpgaac_cpuid_cs(in_fpgaac_cpuid_cs),
.cpuid_valid(cpuid_valid),
.in_ingress_pkt_wr(out_dispather_pkt_wr),
.in_ingress_pkt(out_dispather_pkt),
.in_ingress_valid_wr(out_dispather_valid_wr),
.in_ingress_valid(out_dispather_valid),
.out_ingress_pkt_almostfull(in_dispather_pkt_almostfull),

.out_rdma_pkt_wr(out_rdma_pkt_wr),
.out_rdma_pkt(out_rdma_pkt),
.out_rdma_valid_wr(out_rdma_valid_wr),
.out_rdma_valid(out_rdma_valid),
.in_rdma_pkt_almostfull(in_rdma_pkt_almostfull),

.in_ppc_pkt_wr(in_ppc_pkt_wr),
.in_ppc_pkt(in_ppc_pkt),
.in_ppc_valid_wr(in_ppc_valid_wr),
.in_ppc_valid(in_ppc_valid),
.out_ppc_pkt_almostfull(out_ppc_pkt_almostfull),

.out_ppc_pkt_wr(in_ppc_pkt_wr),
.out_ppc_pkt(in_ppc_pkt),
.out_ppc_valid_wr(in_ppc_valid_wr),
.out_ppc_valid(in_ppc_valid),
.in_ppc_pkt_almostfull(out_ppc_pkt_almostfull)
);



endmodule