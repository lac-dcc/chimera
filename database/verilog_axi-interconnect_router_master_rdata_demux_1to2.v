module rdata_demux_1to2(
input           areset,

// master 1
output   [3:0]  rid_m1,
output  [31:0]  rdata_m1,
output          rlast_m1,
output   [1:0]  rresp_m1,	
output          rvalid_m1,
input           rready_m1,

// master 2
output   [3:0]  rid_m2,
output  [31:0]  rdata_m2,
output          rlast_m2,
output   [1:0]  rresp_m2,
output          rvalid_m2,
input           rready_m2,

// slave
input    [3:0]  rid_s,
input   [31:0]  rdata_s,
input           rlast_s,
input    [1:0]  rresp_s,
input           rvalid_s,
output          rready_s
);



// RDATA demux
assign rid_m1    = rid_s[3:0];
assign rdata_m1  = rdata_s;
assign rresp_m1  = rresp_s;
assign rlast_m1  = rlast_s;
assign rvalid_m1 = ((rid_s[1]==1'b0)&rvalid_s) ? rvalid_s : ((rid_s[1]==1'b1)&rvalid_s) ? 1'b0 : 1'b0;

assign rid_m2    = rid_s[3:0];
assign rdata_m2  = rdata_s;
assign rresp_m2  = rresp_s;
assign rlast_m2  = rlast_s;
assign rvalid_m2 = ((rid_s[1]==1'b0)&rvalid_s) ? 1'b0 : ((rid_s[1]==1'b1)&rvalid_s) ? rvalid_s : 1'b0;

assign rready_s  = ((rid_s[1]==1'b0)&rvalid_s) ? rready_m1 : ((rid_s[1]==1'b1)&rvalid_s) ? rready_m2 : 1'b0;
endmodule
