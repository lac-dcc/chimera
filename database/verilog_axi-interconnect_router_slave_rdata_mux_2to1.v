module rdata_mux_2to1(
input          areset,

// master
output   [3:0] rid_m,
output  [31:0] rdata_m,
output         rlast_m,
output   [1:0] rresp_m,
output         rvalid_m,
input          rready_m,

// slave 1
input    [3:0] rid_s1,
input   [31:0] rdata_s1,
input          rlast_s1,
input    [1:0] rresp_s1,
input          rvalid_s1,
output         rready_s1,

// slave 2
input    [3:0] rid_s2,
input   [31:0] rdata_s2,
input          rlast_s2,
input    [1:0] rresp_s2,
input          rvalid_s2,
output         rready_s2
);



// RDATA mux
assign rid_m     = rvalid_s1 ? rid_s1 : rid_s2;
assign rdata_m   = rvalid_s1 ? rdata_s1 : rdata_s2;
assign rresp_m   = rvalid_s1 ? rresp_s1 : rresp_s2;

assign rlast_m   = rvalid_s1 ? rlast_s1 : rvalid_s2 ? rlast_s2 : 1'b0;
assign rvalid_m  = rvalid_s1 ? rvalid_s1 : rvalid_s2 ? rvalid_s2 : 1'b0;
assign rready_s1 = rvalid_s1 ? rready_m : rvalid_s2 ? 1'b0 : 1'b0;
assign rready_s2 = rvalid_s1 ? 1'b0 : rvalid_s2 ? rready_m : 1'b0;

endmodule