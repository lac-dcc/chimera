/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [4:0] _01_;
  wire [15:0] _02_;
  reg [5:0] _03_;
  wire celloutsig_0_0z;
  wire [3:0] celloutsig_0_10z;
  wire [3:0] celloutsig_0_12z;
  wire [6:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire [8:0] celloutsig_0_2z;
  wire [39:0] celloutsig_0_3z;
  wire [4:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_4z;
  wire [4:0] celloutsig_0_5z;
  wire [22:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [16:0] celloutsig_0_8z;
  wire [2:0] celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  wire [13:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [5:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [8:0] celloutsig_1_1z;
  wire [9:0] celloutsig_1_4z;
  wire [4:0] celloutsig_1_5z;
  wire [12:0] celloutsig_1_6z;
  wire [8:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [3:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_44z = ~(celloutsig_0_27z | celloutsig_0_7z);
  assign celloutsig_0_4z = celloutsig_0_3z[10] | ~(celloutsig_0_3z[6]);
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _01_ <= 5'h00;
    else _01_ <= in_data[152:148];
  reg [15:0] _07_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _07_ <= 16'h0000;
    else _07_ <= { celloutsig_1_1z[6:2], _01_, celloutsig_1_0z, celloutsig_1_0z };
  assign { _02_[15:6], _00_, _02_[4:0] } = _07_;
  always_ff @(negedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _03_ <= 6'h00;
    else _03_ <= { celloutsig_0_8z[3:2], celloutsig_0_10z };
  assign celloutsig_1_4z = { celloutsig_1_1z[8:7], _01_, celloutsig_1_0z } / { 1'h1, _02_[10:6], _00_, _02_[4:2] };
  assign celloutsig_1_11z = { celloutsig_1_1z, celloutsig_1_5z } / { 1'h1, _02_[13:6], _00_, _02_[4:1] };
  assign celloutsig_1_15z = { celloutsig_1_11z[10:6], celloutsig_1_8z } / { 1'h1, celloutsig_1_6z[10:7], in_data[96] };
  assign celloutsig_1_12z = { celloutsig_1_10z[1:0], celloutsig_1_8z } == _01_[2:0];
  assign celloutsig_0_1z = in_data[45:36] === in_data[90:81];
  assign celloutsig_0_25z = celloutsig_0_5z[3:0] === { celloutsig_0_3z[38:36], celloutsig_0_7z };
  assign celloutsig_0_27z = { celloutsig_0_12z[2:0], celloutsig_0_25z } === celloutsig_0_19z[4:1];
  assign celloutsig_1_6z = { _02_[13:6], _00_, _02_[4:1] } * { celloutsig_1_4z[5:2], celloutsig_1_1z };
  assign celloutsig_0_5z = in_data[60:56] * celloutsig_0_3z[25:21];
  assign celloutsig_0_12z = in_data[55:52] * { celloutsig_0_10z[2:0], celloutsig_0_4z };
  assign celloutsig_0_19z = celloutsig_0_6z[14:8] * { celloutsig_0_6z[14:13], celloutsig_0_5z };
  assign celloutsig_0_2z = { in_data[94:91], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } * { in_data[53:51], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_10z = celloutsig_1_5z[4] ? in_data[111:109] : { celloutsig_1_0z[1:0], celloutsig_1_8z };
  assign celloutsig_0_0z = in_data[37:35] != in_data[74:72];
  assign celloutsig_1_19z = { celloutsig_1_9z[2:0], celloutsig_1_10z } != in_data[106:101];
  assign celloutsig_0_43z = - _03_[5:1];
  assign celloutsig_1_5z = - _02_[10:6];
  assign celloutsig_1_7z = _02_[14:6] | _02_[15:7];
  assign celloutsig_0_6z = in_data[43:21] | { in_data[50:45], celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_0_8z = in_data[45:29] | { celloutsig_0_6z[16:1], celloutsig_0_1z };
  assign celloutsig_1_8z = _01_[3] & celloutsig_1_4z[7];
  assign celloutsig_0_7z = ^ celloutsig_0_6z[9:3];
  assign celloutsig_1_0z = in_data[148:146] <<< in_data[182:180];
  assign celloutsig_1_9z = celloutsig_1_4z[8:5] <<< _02_[3:0];
  assign celloutsig_0_3z = { in_data[83:64], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z } - { in_data[53:15], celloutsig_0_0z };
  assign celloutsig_1_1z = { in_data[121:119], celloutsig_1_0z, celloutsig_1_0z } ^ in_data[144:136];
  assign celloutsig_0_10z = celloutsig_0_2z[4:1] ^ { in_data[58:57], celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_1_18z = ~((celloutsig_1_9z[3] & celloutsig_1_7z[7]) | (celloutsig_1_15z[4] & celloutsig_1_12z));
  assign _02_[5] = _00_;
  assign { out_data[128], out_data[96], out_data[36:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_43z, celloutsig_0_44z };
endmodule
