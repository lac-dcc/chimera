module wr_demux_1to2(
input           areset,

// master 1
output   [3:0]  bid_m1,
output   [1:0]  bresp_m1,
output          bvalid_m1,
input           bready_m1,

// master 2
output   [3:0]  bid_m2,
output   [1:0]  bresp_m2,
output          bvalid_m2,
input           bready_m2,

// slave
input    [3:0]  bid_s,
input    [1:0]  bresp_s,
input           bvalid_s,
output          bready_s
);

// demux master 1
assign bid_m1    = bid_s[3:0];
assign bresp_m1  = bresp_s;
assign bvalid_m1 = ((bid_s[1]==1'b0)&bvalid_s) ? bvalid_s : ((bid_s[1]==1'b1)&bvalid_s) ? 1'b0 : 1'b0;

// demux master 2
assign bid_m2    = bid_s[3:0];
assign bresp_m2  = bresp_s;
assign bvalid_m2 = ((bid_s[1]==1'b0)&bvalid_s) ? 1'b0 : ((bid_s[1]==1'b1)&bvalid_s) ? bvalid_s : 1'b0;

// ready signal to slave
assign bready_s  = ((bid_s[1]==1'b0)&bvalid_s) ? bready_m1 : ((bid_s[1]==1'b1)&bvalid_s) ? bready_m2 : 1'b0;

endmodule
