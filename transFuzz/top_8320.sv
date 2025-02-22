/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [28:0] _02_;
  wire [4:0] celloutsig_0_0z;
  wire [4:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire [24:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [2:0] celloutsig_0_15z;
  wire [3:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_2z;
  wire [4:0] celloutsig_0_35z;
  wire [16:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [7:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [6:0] celloutsig_0_5z;
  wire [5:0] celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [12:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [9:0] celloutsig_1_14z;
  wire [2:0] celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [3:0] celloutsig_1_2z;
  wire [3:0] celloutsig_1_3z;
  wire [6:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [13:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_1z = ~in_data[173];
  assign celloutsig_1_7z = ~celloutsig_1_4z[3];
  assign celloutsig_1_10z = ~celloutsig_1_8z;
  assign celloutsig_1_19z = ~celloutsig_1_16z;
  assign celloutsig_0_2z = ~celloutsig_0_0z[4];
  assign celloutsig_0_18z = ~celloutsig_0_11z;
  assign celloutsig_1_11z = ~((celloutsig_1_6z[12] | celloutsig_1_4z[6]) & (celloutsig_1_4z[6] | celloutsig_1_9z));
  assign celloutsig_0_8z = ~((in_data[83] | celloutsig_0_0z[2]) & (celloutsig_0_6z[3] | celloutsig_0_0z[0]));
  assign celloutsig_0_11z = _00_ ^ _01_;
  assign celloutsig_0_38z = { celloutsig_0_35z[1:0], celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_20z, celloutsig_0_4z, celloutsig_0_20z, celloutsig_0_12z } + { celloutsig_0_13z[15:0], celloutsig_0_17z };
  assign celloutsig_0_5z = in_data[82:76] + in_data[75:69];
  assign celloutsig_0_16z = celloutsig_0_3z[3:0] + { celloutsig_0_15z, celloutsig_0_11z };
  assign celloutsig_0_3z = in_data[8:1] + { celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_1z };
  reg [28:0] _16_;
  always_ff @(posedge celloutsig_1_16z, negedge clkin_data[0])
    if (!clkin_data[0]) _16_ <= 29'h00000000;
    else _16_ <= { celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_5z };
  assign { _00_, _02_[27:18], _01_, _02_[16:0] } = _16_;
  assign celloutsig_1_14z = { celloutsig_1_6z[10], celloutsig_1_11z, celloutsig_1_12z, celloutsig_1_2z, celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_7z } / { 1'h1, celloutsig_1_11z, celloutsig_1_5z, celloutsig_1_4z };
  assign celloutsig_0_4z = ! { in_data[91:86], celloutsig_0_1z };
  assign celloutsig_0_39z = ! { celloutsig_0_10z[0], celloutsig_0_1z, celloutsig_0_18z, celloutsig_0_20z };
  assign celloutsig_1_18z = ! celloutsig_1_14z[2:0];
  assign celloutsig_0_9z = ! { in_data[89:79], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_0_17z = ! { celloutsig_0_5z[5:0], celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_11z };
  assign celloutsig_1_13z = { celloutsig_1_6z[7:4], celloutsig_1_9z } || { celloutsig_1_1z, celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_10z, celloutsig_1_10z };
  assign celloutsig_1_9z = celloutsig_1_7z & ~(celloutsig_1_8z);
  assign celloutsig_0_35z = celloutsig_0_6z[4:0] * { celloutsig_0_16z, celloutsig_0_17z };
  assign celloutsig_1_0z = in_data[128:116] * in_data[149:137];
  assign celloutsig_1_2z = celloutsig_1_0z[11:8] * celloutsig_1_0z[3:0];
  assign celloutsig_1_3z = celloutsig_1_0z[6:3] * { celloutsig_1_0z[9:7], celloutsig_1_1z };
  assign celloutsig_1_6z = { celloutsig_1_3z[1], celloutsig_1_0z } * { celloutsig_1_2z[3], celloutsig_1_0z };
  assign celloutsig_1_15z = { celloutsig_1_9z, celloutsig_1_13z, celloutsig_1_12z } * { celloutsig_1_0z[7:6], celloutsig_1_8z };
  assign celloutsig_0_10z = { _02_[9:6], celloutsig_0_8z } * { celloutsig_0_0z[4:3], celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_9z };
  assign celloutsig_1_8z = { celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_7z } != celloutsig_1_6z[3:1];
  assign celloutsig_1_16z = { celloutsig_1_14z[6:0], celloutsig_1_11z, celloutsig_1_2z } != { in_data[138:131], celloutsig_1_10z, celloutsig_1_15z };
  assign celloutsig_0_14z = { celloutsig_0_10z[3], celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_11z } != { celloutsig_0_5z[5:1], celloutsig_0_11z, celloutsig_0_12z };
  assign celloutsig_0_19z = { _02_[23:18], _01_, _02_[16:10], celloutsig_0_8z, celloutsig_0_18z, celloutsig_0_0z } != { in_data[78:71], celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_6z };
  assign celloutsig_0_20z = { celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_17z } != { _02_[26:25], celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_18z, celloutsig_0_19z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_8z };
  assign celloutsig_0_0z = ~ in_data[23:19];
  assign celloutsig_0_13z = ~ in_data[63:39];
  assign celloutsig_1_5z = | { celloutsig_1_4z[2], celloutsig_1_2z };
  assign celloutsig_0_1z = | in_data[55:53];
  assign celloutsig_0_6z = celloutsig_0_5z[6:1] >> in_data[87:82];
  assign celloutsig_0_15z = celloutsig_0_3z[2:0] >> { celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_2z };
  assign celloutsig_1_4z = { celloutsig_1_0z[12:11], celloutsig_1_1z, celloutsig_1_3z } << { celloutsig_1_0z[7:5], celloutsig_1_3z };
  assign celloutsig_0_12z = in_data[31:26] ^ celloutsig_0_3z[6:1];
  assign celloutsig_1_12z = ~((celloutsig_1_6z[10] & celloutsig_1_9z) | (celloutsig_1_11z & celloutsig_1_5z));
  assign { _02_[28], _02_[17] } = { _00_, _01_ };
  assign { out_data[128], out_data[96], out_data[48:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_38z, celloutsig_0_39z };
endmodule
