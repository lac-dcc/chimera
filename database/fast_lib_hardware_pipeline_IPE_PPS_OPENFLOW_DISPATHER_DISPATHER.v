`timescale 1 ps / 1 ps
module DISPATHER(
input clk,
input reset,

input in_ingress_pkt_wr,
input [133:0] in_ingress_pkt,
input in_ingress_valid_wr,
input in_ingress_valid,
output out_ingress_pkt_almostfull,

output out_rdma_pkt_wr,
output [133:0] out_rdma_pkt,
output out_rdma_valid_wr,
output out_rdma_valid,
input in_rdma_pkt_almostfull,
input [5:0] in_fpgaac_channel_num,
input in_fpgaac_cpuid_cs,//switch cpuid allocate mode 0:round robin   1:port bind
input [31:0] cpuid_valid,

input in_ppc_pkt_wr,
input [133:0] in_ppc_pkt,
input in_ppc_valid_wr,
input in_ppc_valid,
output out_ppc_pkt_almostfull,

output out_ppc_pkt_wr,
output [133:0] out_ppc_pkt,
output out_ppc_valid_wr,
output out_ppc_valid,
input in_ppc_pkt_almostfull
);


wire [4:0] in_cpuid;//id of cpu thread which pkt would be send to
wire in_cpuid_ack;
wire in_cpuid_valid;
wire out_cpuid_ctl;
wire [4:0] out_cpuid_key; 

wire in_input_pkt_wr;
wire [133:0] in_input_pkt;
wire in_input_valid_wr;
wire in_input_valid;
wire out_input_pkt_almostfull;
DISPATHER_INPUT DISPATHER_INPUT (
.clk(clk),
.reset(reset),

.in_cpuid(in_cpuid),//id of cpu thread which pkt would be send to
.in_cpuid_ack(in_cpuid_ack),
.in_cpuid_valid(in_cpuid_valid),
.out_cpuid_ctl(out_cpuid_ctl),
.out_cpuid_key(out_cpuid_key),

.in_ingress_pkt_wr(in_ingress_pkt_wr),
.in_ingress_pkt(in_ingress_pkt),
.in_ingress_valid_wr(in_ingress_valid_wr),
.in_ingress_valid(in_ingress_valid),
.out_ingress_pkt_almostfull(out_ingress_pkt_almostfull),

.out_output_pkt_wr(in_input_pkt_wr),
.out_output_pkt(in_input_pkt),
.out_output_valid_wr(in_input_valid_wr),
.out_output_valid(in_input_valid),
.in_output_pkt_almostfull(out_input_pkt_almostfull),

.out_ppc_pkt_wr(out_ppc_pkt_wr),
.out_ppc_pkt(out_ppc_pkt),
.out_ppc_valid_wr(out_ppc_valid_wr),
.out_ppc_valid(out_ppc_valid),
.in_ppc_pkt_almostfull(in_ppc_pkt_almostfull)
);

DISPATHER_CPUID DISPATHER_CPUID (//round robin mode & port bind mode
.clk(clk),
.reset(reset),

.in_fpgaac_cpuid_cs(in_fpgaac_cpuid_cs),
.in_fpgaac_channel_num(in_fpgaac_channel_num),
.cpuid_valid(cpuid_valid),
.out_input_cpuid(in_cpuid),//id of cpu thread which pkt would be send to
.out_input_ack(in_cpuid_ack),
.out_input_valid(in_cpuid_valid),
.in_input_ctl(out_cpuid_ctl),
.in_input_key(out_cpuid_key)
);

DISPATHER_OUTPUT DISPATHER_OUTPUT(
.clk(clk),
.reset(reset),

.in_input_pkt_wr(in_input_pkt_wr),
.in_input_pkt(in_input_pkt),
.in_input_valid_wr(in_input_valid_wr),
.in_input_valid(in_input_valid),
.out_input_pkt_almostfull(out_input_pkt_almostfull),

.in_ppc_pkt_wr(in_ppc_pkt_wr),
.in_ppc_pkt(in_ppc_pkt),
.in_ppc_valid_wr(in_ppc_valid_wr),
.in_ppc_valid(in_ppc_valid),
.out_ppc_pkt_almostfull(out_ppc_pkt_almostfull),

.out_rdma_pkt_wr(out_rdma_pkt_wr),
.out_rdma_pkt(out_rdma_pkt),
.out_rdma_valid_wr(out_rdma_valid_wr),
.out_rdma_valid(out_rdma_valid),
.in_rdma_pkt_almostfull(in_rdma_pkt_almostfull)
);
	
endmodule