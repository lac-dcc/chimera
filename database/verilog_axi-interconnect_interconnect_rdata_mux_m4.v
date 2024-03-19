module rdata_mux_m4(
input            areset,

// master
output    [3:0]  rid_m,
output   [31:0]  rdata_m,
output           rlast_m,
output    [1:0]  rresp_m,
output           rvalid_m,
input            rready_m,

// slave 1
input     [3:0]  rid_s1,
input    [31:0]  rdata_s1,
input            rlast_s1,
input     [1:0]  rresp_s1,
input            rvalid_s1,
output           rready_s1,

// slave 2
input     [3:0]  rid_s2,
input    [31:0]  rdata_s2,
input            rlast_s2,
input     [1:0]  rresp_s2,	
input            rvalid_s2,
output           rready_s2,

// slave 3
input     [3:0]  rid_s3,
input    [31:0]  rdata_s3,
input            rlast_s3,
input     [1:0]  rresp_s3,
input            rvalid_s3,
output           rready_s3,

// slave 4
input     [3:0]  rid_s4,
input    [31:0]  rdata_s4,
input            rlast_s4,
input     [1:0]  rresp_s4,
input            rvalid_s4,
output           rready_s4,

// select
input     [1:0]  sel
);


// rdata mux
assign rid_m     = ((rid_s1[3:2]==sel)&rvalid_s1) ? rid_s1[3:0] : ((rid_s2[3:2]==sel)&rvalid_s2) ? rid_s2[3:0] : ((rid_s3[3:2]==sel)&rvalid_s3) ? rid_s3[3:0] : rid_s4[3:0];
assign rdata_m   = ((rid_s1[3:2]==sel)&rvalid_s1) ? rdata_s1 : ((rid_s2[3:2]==sel)&rvalid_s2) ? rdata_s2 : ((rid_s3[3:2]==sel)&rvalid_s3) ? rdata_s3 : rdata_s4;
assign rresp_m   = ((rid_s1[3:2]==sel)&rvalid_s1) ? rresp_s1 : ((rid_s2[3:2]==sel)&rvalid_s2) ? rresp_s2 : ((rid_s3[3:2]==sel)&rvalid_s3) ? rresp_s3 : rresp_s4;
assign rlast_m   = ((rid_s1[3:2]==sel)&rvalid_s1) ? rlast_s1 : ((rid_s2[3:2]==sel)&rvalid_s2) ? rlast_s2 : ((rid_s3[3:2]==sel)&rvalid_s3) ? rlast_s3 : ((rid_s4[3:2]==sel)&rvalid_s4) ? rlast_s4 : 1'b0;
assign rvalid_m  = ((rid_s1[3:2]==sel)&rvalid_s1) ? rvalid_s1 : ((rid_s2[3:2]==sel)&rvalid_s2) ? rvalid_s2 : ((rid_s3[3:2]==sel)&rvalid_s3) ? rvalid_s3 : ((rid_s4[3:2]==sel)&rvalid_s4) ? rvalid_s4 : 1'b0;

// aasign ready singal
assign rready_s1 = ((rid_s1[3:2]==sel)&rvalid_s1) ? rready_m : ((rid_s2[3:2]==sel)&rvalid_s2) ? 1'b0 : ((rid_s3[3:2]==sel)&rvalid_s3) ? 1'b0 : ((rid_s4[3:2]==sel)&rvalid_s4) ? 1'b0 : 1'b0;
assign rready_s2 = ((rid_s1[3:2]==sel)&rvalid_s1) ? 1'b0 : ((rid_s2[3:2]==sel)&rvalid_s2) ? rready_m : ((rid_s3[3:2]==sel)&rvalid_s3) ? 1'b0 : ((rid_s4[3:2]==sel)&rvalid_s4) ? 1'b0 : 1'b0;
assign rready_s3 = ((rid_s1[3:2]==sel)&rvalid_s1) ? 1'b0 : ((rid_s2[3:2]==sel)&rvalid_s2) ? 1'b0 : ((rid_s3[3:2]==sel)&rvalid_s3) ? rready_m : ((rid_s4[3:2]==sel)&rvalid_s4) ? 1'b0 : 1'b0;
assign rready_s4 = ((rid_s1[3:2]==sel)&rvalid_s1) ? 1'b0 : ((rid_s2[3:2]==sel)&rvalid_s2) ? 1'b0 : ((rid_s3[3:2]==sel)&rvalid_s3) ? 1'b0 : ((rid_s4[3:2]==sel)&rvalid_s4) ? rready_m : 1'b0;

endmodule
