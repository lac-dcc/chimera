module wr_mux_2to1(
input           areset,

// master
output   [3:0]  bid_m,
output   [1:0]  bresp_m,
output          bvalid_m,
input           bready_m,

// slave 1
input    [3:0]  bid_s1,
input    [1:0]  bresp_s1,
input           bvalid_s1,
output          bready_s1,

// slave 2
input    [3:0]  bid_s2,
input    [1:0]  bresp_s2,
input           bvalid_s2,
output          bready_s2
);

// wresponse mux
assign bid_m     = bvalid_s1 ? bid_s1 : bid_s2;
assign bresp_m   = bvalid_s1 ? bresp_s1 : bresp_s2;
assign bvalid_m  = bvalid_s1 ? bvalid_s1 : bvalid_s2 ? bvalid_s2 : 1'b0;

// ready signal
assign bready_s1 = bvalid_s1 ? bready_m : bvalid_s2 ? 1'b0 : 1'b0;
assign bready_s2 = bvalid_s1 ? 1'b0 : bvalid_s2 ? bready_m : 1'b0;
endmodule
