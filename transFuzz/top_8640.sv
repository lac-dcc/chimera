/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [6:0] _00_;
  wire [9:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [6:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [4:0] celloutsig_0_13z;
  wire [20:0] celloutsig_0_14z;
  wire [24:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  reg [7:0] celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire [20:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [10:0] celloutsig_0_29z;
  wire [12:0] celloutsig_0_2z;
  wire [3:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire [8:0] celloutsig_0_35z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [11:0] celloutsig_0_4z;
  wire [4:0] celloutsig_0_5z;
  wire [6:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [20:0] celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [12:0] celloutsig_1_5z;
  reg [2:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [2:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_1z = ~in_data[185];
  assign celloutsig_0_31z = ~celloutsig_0_23z;
  assign celloutsig_0_3z = ~celloutsig_0_0z[6];
  assign celloutsig_1_2z = in_data[133] | ~(in_data[159]);
  assign celloutsig_1_7z = celloutsig_1_2z | ~(celloutsig_1_5z[11]);
  assign celloutsig_1_10z = celloutsig_1_9z[0] | ~(celloutsig_1_1z);
  assign celloutsig_1_18z = celloutsig_1_15z | ~(celloutsig_1_10z);
  assign celloutsig_1_19z = in_data[100] | ~(celloutsig_1_4z);
  assign celloutsig_0_34z = celloutsig_0_29z[8] | ~(celloutsig_0_31z);
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _00_ <= 7'h00;
    else _00_ <= celloutsig_0_0z[6:0];
  assign celloutsig_1_9z = { celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_3z } & { celloutsig_1_6z[2:1], celloutsig_1_1z };
  assign celloutsig_0_35z = { _00_[3:0], celloutsig_0_25z, celloutsig_0_18z } & celloutsig_0_14z[9:1];
  assign celloutsig_0_13z = _00_[5:1] / { 1'h1, celloutsig_0_2z[10:7] };
  assign celloutsig_0_40z = { celloutsig_0_0z[3:2], celloutsig_0_35z, celloutsig_0_1z, celloutsig_0_34z, celloutsig_0_26z, celloutsig_0_32z } >= { celloutsig_0_14z[15:2], celloutsig_0_39z };
  assign celloutsig_0_25z = { _00_[5:0], celloutsig_0_3z } >= { celloutsig_0_6z[6:1], celloutsig_0_10z };
  assign celloutsig_0_26z = { celloutsig_0_18z[3:1], celloutsig_0_18z } >= { in_data[86:81], celloutsig_0_16z };
  assign celloutsig_1_4z = in_data[112:109] > in_data[177:174];
  assign celloutsig_0_22z = _00_[5:2] > celloutsig_0_19z[7:4];
  assign celloutsig_0_23z = in_data[13:8] > { celloutsig_0_14z[14:10], celloutsig_0_10z };
  assign celloutsig_0_0z = in_data[76:67] % { 1'h1, in_data[10:2] };
  assign celloutsig_1_5z = { in_data[130:119], celloutsig_1_1z } % { 1'h1, in_data[143:142], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_11z = celloutsig_0_9z[6:0] % { 1'h1, celloutsig_0_0z[7:2] };
  assign celloutsig_0_29z = { celloutsig_0_14z[7:1], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_22z, celloutsig_0_28z } % { 1'h1, celloutsig_0_2z[9:1], celloutsig_0_27z };
  assign celloutsig_1_0z = in_data[168:164] % { 1'h1, in_data[168:165] };
  assign celloutsig_0_9z = { celloutsig_0_0z[7:0], celloutsig_0_2z } % { 1'h1, celloutsig_0_5z[1], celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_0_14z = { celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_6z } % { 1'h1, celloutsig_0_0z[8:0], celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_12z, celloutsig_0_12z, _00_ };
  assign celloutsig_0_6z = { celloutsig_0_2z[8], celloutsig_0_1z, celloutsig_0_5z } * { celloutsig_0_2z[8:3], celloutsig_0_1z };
  assign celloutsig_0_15z = { celloutsig_0_9z[19:16], celloutsig_0_9z } * { celloutsig_0_2z[8:3], celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_0_18z = celloutsig_0_17z[6:3] * celloutsig_0_5z[3:0];
  assign celloutsig_0_2z = { in_data[77:66], celloutsig_0_1z } * { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_10z = | { celloutsig_0_5z[4:1], celloutsig_0_6z };
  assign celloutsig_0_12z = | celloutsig_0_2z[11:7];
  assign celloutsig_0_1z = | celloutsig_0_0z[4:1];
  assign celloutsig_1_3z = ~^ { in_data[113:111], celloutsig_1_1z };
  assign celloutsig_1_15z = ~^ { celloutsig_1_1z, celloutsig_1_6z };
  assign celloutsig_0_32z = ~^ { in_data[41:24], celloutsig_0_13z };
  assign celloutsig_0_39z = ^ { celloutsig_0_15z[20:12], celloutsig_0_16z, celloutsig_0_30z, celloutsig_0_26z, celloutsig_0_1z, celloutsig_0_22z };
  assign celloutsig_0_7z = ^ { celloutsig_0_2z[7:0], celloutsig_0_3z, celloutsig_0_5z };
  assign celloutsig_0_16z = ^ celloutsig_0_15z[11:6];
  assign celloutsig_0_27z = ^ { celloutsig_0_10z, celloutsig_0_12z, celloutsig_0_10z };
  assign celloutsig_0_28z = ^ { celloutsig_0_15z[19:13], celloutsig_0_4z, celloutsig_0_23z };
  assign celloutsig_0_5z = in_data[32:28] >> celloutsig_0_0z[4:0];
  assign celloutsig_0_19z = { celloutsig_0_4z[9:6], celloutsig_0_6z, celloutsig_0_18z, celloutsig_0_3z, celloutsig_0_5z } >> celloutsig_0_14z;
  assign celloutsig_0_30z = { celloutsig_0_29z[6:4], celloutsig_0_16z } >> { in_data[66:65], celloutsig_0_22z, celloutsig_0_7z };
  assign celloutsig_0_4z = { celloutsig_0_2z[10], celloutsig_0_0z, celloutsig_0_1z } - in_data[79:68];
  always_latch
    if (clkin_data[32]) celloutsig_1_6z = 3'h0;
    else if (!clkin_data[96]) celloutsig_1_6z = { celloutsig_1_5z[3:2], celloutsig_1_3z };
  always_latch
    if (clkin_data[0]) celloutsig_0_17z = 8'h00;
    else if (!clkin_data[64]) celloutsig_0_17z = { celloutsig_0_11z[4], celloutsig_0_6z };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_39z, celloutsig_0_40z };
endmodule
