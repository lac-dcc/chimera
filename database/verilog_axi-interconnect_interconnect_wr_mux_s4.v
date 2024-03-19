module wr_mux_s4(
input      areset,

// master
output  [3:0]  bid_m,
output  [1:0]  bresp_m,
output         bvalid_m,
input          bready_m,

// slave 1
input   [3:0]  bid_s1,
input   [1:0]  bresp_s1,
input          bvalid_s1,
output         bready_s1,

// slave 2
input   [3:0]  bid_s2,
input   [1:0]  bresp_s2,
input          bvalid_s2,
output         bready_s2,

// slave 3
input   [3:0]  bid_s3,
input   [1:0]  bresp_s3,
input          bvalid_s3,
output         bready_s3,

// slave 4
input   [3:0]  bid_s4,
input   [1:0]  bresp_s4,
input          bvalid_s4,
output         bready_s4,

// select
input   [1:0]  sel
);

// wresponse mux
assign bid_m     = ((bid_s1[3:2]==sel)&bvalid_s1) ? bid_s1[3:0] : ((bid_s2[3:2]==sel)&bvalid_s2) ? bid_s2[3:0] : ((bid_s3[3:2]==sel)&bvalid_s3) ? bid_s3[3:0] : bid_s4[3:0];
assign bvalid_m  = ((bid_s1[3:2]==sel)&bvalid_s1) ? bvalid_s1 : ((bid_s2[3:2]==sel)&bvalid_s2) ? bvalid_s2 : ((bid_s3[3:2]==sel)&bvalid_s3) ? bvalid_s3 : ((bid_s4[3:2]==sel)&bvalid_s4) ? bvalid_s4 : 1'b0;
assign bresp_m   = ((bid_s1[3:2]==sel)&bvalid_s1) ? bresp_s1 : ((bid_s2[3:2]==sel)&bvalid_s2) ? bresp_s2 : ((bid_s3[3:2]==sel)&bvalid_s3) ? bresp_s3 : bresp_s4 ;

assign bready_s1 = ((bid_s1[3:2]==sel)&bvalid_s1) ? bready_m : ((bid_s2[3:2]==sel)&bvalid_s2) ? 1'b0 : ((bid_s3[3:2]==sel)&bvalid_s3) ? 1'b0 : ((bid_s4[3:2]==sel)&bvalid_s4) ? 1'b0 : 1'b0;
assign bready_s2 = ((bid_s1[3:2]==sel)&bvalid_s1) ? 1'b0 : ((bid_s2[3:2]==sel)&bvalid_s2) ? bready_m : ((bid_s3[3:2]==sel)&bvalid_s3) ? 1'b0 : ((bid_s4[3:2]==sel)&bvalid_s4) ? 1'b0 : 1'b0;
assign bready_s3 = ((bid_s1[3:2]==sel)&bvalid_s1) ? 1'b0 : ((bid_s2[3:2]==sel)&bvalid_s2) ? 1'b0 : ((bid_s3[3:2]==sel)&bvalid_s3) ? bready_m : ((bid_s4[3:2]==sel)&bvalid_s4) ? 1'b0 : 1'b0;
assign bready_s4 = ((bid_s1[3:2]==sel)&bvalid_s1) ? 1'b0 : ((bid_s2[3:2]==sel)&bvalid_s2) ? 1'b0 : ((bid_s3[3:2]==sel)&bvalid_s3) ? 1'b0 : ((bid_s4[3:2]==sel)&bvalid_s4) ? bready_m : 1'b0;

endmodule
