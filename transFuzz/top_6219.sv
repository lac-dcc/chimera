/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [6:0] _01_;
  wire [22:0] celloutsig_0_0z;
  wire [7:0] celloutsig_0_11z;
  wire [25:0] celloutsig_0_13z;
  wire celloutsig_0_34z;
  reg [11:0] celloutsig_0_35z;
  wire celloutsig_1_0z;
  wire [2:0] celloutsig_1_13z;
  wire [5:0] celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire celloutsig_1_2z;
  wire [12:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_9z = ~celloutsig_1_5z;
  assign celloutsig_0_34z = ~_00_;
  assign celloutsig_1_4z = ~((celloutsig_1_0z | 1'h0) & (celloutsig_1_0z | 1'h0));
  reg [6:0] _05_;
  always_ff @(posedge clkin_data[64], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _05_ <= 7'h00;
    else _05_ <= in_data[67:61];
  assign { _01_[6:5], _00_, _01_[3:0] } = _05_;
  assign celloutsig_0_11z = { in_data[16:10], in_data[52] } & in_data[28:21];
  assign celloutsig_1_13z = in_data[179:177] / { 1'h1, celloutsig_1_7z, celloutsig_1_9z };
  assign celloutsig_1_3z[12:1] = { in_data[154:147], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z } * in_data[183:172];
  assign celloutsig_0_13z = - { celloutsig_0_11z[3:1], celloutsig_0_0z };
  assign celloutsig_1_2z = ~^ { celloutsig_1_0z, 2'h0 };
  assign celloutsig_1_0z = ^ in_data[135:117];
  assign celloutsig_1_5z = ^ { celloutsig_1_3z[7:1], 1'h0 };
  assign celloutsig_1_19z = celloutsig_1_13z >> { in_data[98:97], celloutsig_1_9z };
  assign celloutsig_0_0z = in_data[33:11] - in_data[93:71];
  assign celloutsig_1_18z = { celloutsig_1_3z[11:10], 1'h0, celloutsig_1_6z, 2'h0 } - { celloutsig_1_3z[7:3], celloutsig_1_5z };
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_35z = 12'h000;
    else if (!clkin_data[0]) celloutsig_0_35z = { celloutsig_0_13z[14:4], celloutsig_0_34z };
  assign celloutsig_1_6z = ~((in_data[99] & in_data[97]) | (celloutsig_1_3z[9] & in_data[128]));
  assign celloutsig_1_7z = ~((celloutsig_1_4z & celloutsig_1_2z) | (in_data[154] & celloutsig_1_6z));
  assign _01_[4] = _00_;
  assign celloutsig_1_3z[0] = 1'h0;
  assign { out_data[133:128], out_data[98:96], out_data[32], out_data[11:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_34z, celloutsig_0_35z };
endmodule
