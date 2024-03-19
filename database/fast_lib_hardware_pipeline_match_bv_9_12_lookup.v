`timescale 1ns/1ps

module lookup(
clk,
reset,
p2k_valid,
p2k_ingress,
p2k_rloc_src,
p2k_eid_dst,
p2k_metadata,

mode,
xtr_id,
action2parser_en,
transmit2action_en,

pkt_buffer_label_valid_in,
pkt_buffer_label_in,
pkt_head_valid_in,
pkt_head_in,
fragment_valid,
fragment_pkt_buffer_label,
outrule_valid,
outrule,
pkt_buffer_label_valid_out,
pkt_buffer_label_out,
pkt_head_valid_out,
pkt_head_out,

localbus_cs_n,
localbus_rd_wr,
localbus_data,
localbus_ale, 
localbus_ack_n,  
localbus_data_out

);
input clk;
input  reset;
input p2k_valid;
input [7:0]   p2k_ingress;
input [127:0] p2k_rloc_src;
input [127:0] p2k_eid_dst;
input [71:0]   p2k_metadata;

input mode;
input [7:0] xtr_id;
output action2parser_en;
input	transmit2action_en;


input pkt_buffer_label_valid_in;
input [31:0]  pkt_buffer_label_in;
input pkt_head_valid_in;
input [138:0] pkt_head_in;

output  fragment_valid;
output  [31:0]  fragment_pkt_buffer_label;
output  outrule_valid;
output  [15:0] outrule;
output  pkt_buffer_label_valid_out;
output  [31:0]  pkt_buffer_label_out;
output  pkt_head_valid_out;
output  [138:0] pkt_head_out;

input localbus_cs_n;
input localbus_rd_wr;
input [31:0]  localbus_data;
input localbus_ale;
output  localbus_ack_n;
output  [31:0]  localbus_data_out;

wire  fragment_valid;
wire  [31:0]  fragment_pkt_buffer_label;

wire	action2parser_en;

wire  outrule_valid;
wire  [15:0] outrule;
wire  pkt_buffer_label_valid_out;
wire  [31:0]  pkt_buffer_label_out;
wire  pkt_head_valid_out;
wire  [138:0] pkt_head_out;

wire  localbus_ack_n;
wire  [31:0]  localbus_data_out;

wire  k2m_metadata_valid;
wire  [107:0] k2m_metadata;
wire  action_valid;
wire  [15:0]  action;
wire  action_data_valid;
wire  [351:0] action_data;

key_gen key_gen(
.clk(clk),
.reset(reset),
.p2k_valid(p2k_valid),
.p2k_ingress(p2k_ingress),
.p2k_rloc_src(p2k_rloc_src),
.p2k_eid_dst(p2k_eid_dst),
.p2k_metadata(p2k_metadata[71:64]),

.mode(mode),
.k2m_metadata_valid(k2m_metadata_valid),
.k2m_metadata(k2m_metadata)
);
match match(
.clk(clk),
.reset(reset),
.metadata_valid(k2m_metadata_valid),
.metadata(k2m_metadata),

.localbus_cs_n(localbus_cs_n),
.localbus_rd_wr(localbus_rd_wr),
.localbus_data(localbus_data),
.localbus_ale(localbus_ale), 
.localbus_ack_n(localbus_ack_n),  
.localbus_data_out(localbus_data_out),

.action_valid(action_valid),
.action(action),
.action_data_valid(action_data_valid),
.action_data(action_data)
);
endmodule

