/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [9:0] _02_;
  wire [2:0] _03_;
  wire celloutsig_0_0z;
  wire [23:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [27:0] celloutsig_0_13z;
  wire [20:0] celloutsig_0_15z;
  wire [35:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [50:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [5:0] celloutsig_0_1z;
  wire [13:0] celloutsig_0_22z;
  wire [6:0] celloutsig_0_2z;
  wire [2:0] celloutsig_0_31z;
  wire [4:0] celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire [3:0] celloutsig_0_43z;
  wire celloutsig_0_4z;
  wire [10:0] celloutsig_0_5z;
  wire [13:0] celloutsig_0_6z;
  wire [12:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [13:0] celloutsig_1_12z;
  wire [2:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [17:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [18:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_5z;
  wire [9:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [11:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_8z = !(celloutsig_1_1z ? _00_ : celloutsig_1_0z);
  assign celloutsig_0_42z = ~(celloutsig_0_11z | celloutsig_0_12z);
  assign celloutsig_1_17z = ~(celloutsig_1_3z | celloutsig_1_9z[0]);
  assign celloutsig_0_12z = ~(celloutsig_0_6z[13] | in_data[76]);
  assign celloutsig_0_17z = ~(celloutsig_0_9z | celloutsig_0_6z[0]);
  assign celloutsig_0_19z = ~(celloutsig_0_15z[9] | celloutsig_0_8z);
  assign celloutsig_1_0z = in_data[123] | in_data[101];
  assign celloutsig_0_0z = in_data[33] ^ in_data[22];
  reg [9:0] _12_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _12_ <= 10'h000;
    else _12_ <= { in_data[136:131], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_3z };
  assign { _02_[9:4], _00_, _02_[2:0] } = _12_;
  reg [2:0] _13_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _13_ <= 3'h0;
    else _13_ <= { celloutsig_0_3z[3:2], celloutsig_0_11z };
  assign { _03_[2], _01_, _03_[0] } = _13_;
  assign celloutsig_1_14z = { _02_[9:4], _00_, _02_[2:0], celloutsig_1_1z } >= { in_data[179:173], celloutsig_1_8z, celloutsig_1_13z };
  assign celloutsig_0_9z = { in_data[87:63], celloutsig_0_7z } >= { in_data[11:10], celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_7z };
  assign celloutsig_1_3z = { in_data[130], celloutsig_1_0z, celloutsig_1_2z } && { in_data[170:169], celloutsig_1_0z };
  assign celloutsig_1_11z = in_data[150:141] && { _02_[9:4], _00_, _02_[2:0] };
  assign celloutsig_1_18z = { celloutsig_1_15z[14:11], celloutsig_1_0z } && { celloutsig_1_12z[4:2], celloutsig_1_5z, celloutsig_1_11z };
  assign celloutsig_0_11z = ! celloutsig_0_5z[8:4];
  assign celloutsig_1_1z = in_data[106:104] || { in_data[112], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_5z = celloutsig_1_2z & ~(celloutsig_1_0z);
  assign celloutsig_1_7z = celloutsig_1_5z & ~(celloutsig_1_3z);
  assign celloutsig_1_10z = celloutsig_1_3z & ~(celloutsig_1_7z);
  assign celloutsig_0_8z = celloutsig_0_3z[1] & ~(celloutsig_0_5z[3]);
  assign celloutsig_1_13z = { celloutsig_1_12z[6], celloutsig_1_11z, celloutsig_1_10z } % { 1'h1, celloutsig_1_9z[8:7] };
  assign celloutsig_1_15z = { celloutsig_1_6z[3:2], 1'h0, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_2z, _02_[9:4], _00_, _02_[2:0], celloutsig_1_7z, celloutsig_1_5z } % { 1'h1, in_data[146:130] };
  assign celloutsig_0_6z = { in_data[91:85], celloutsig_0_1z, celloutsig_0_4z } % { 1'h1, celloutsig_0_5z[5:0], celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_16z = { celloutsig_0_1z[5:3], _03_[2], _01_, _03_[0], celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_10z } % { 1'h1, celloutsig_0_7z[8:3], celloutsig_0_13z, celloutsig_0_12z };
  assign celloutsig_1_19z = celloutsig_1_3z ? { in_data[145:142], 1'h1, celloutsig_1_6z[9:2], 1'h0, celloutsig_1_6z[0], celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_11z, celloutsig_1_8z } : { 1'h0, celloutsig_1_14z, _02_[9:4], _00_, _02_[2:0], celloutsig_1_10z, celloutsig_1_13z, celloutsig_1_18z, celloutsig_1_1z, celloutsig_1_17z };
  assign celloutsig_0_22z = _03_[0] ? celloutsig_0_13z[27:14] : { celloutsig_0_16z[24:19], celloutsig_0_12z, celloutsig_0_2z };
  assign celloutsig_0_3z = - celloutsig_0_1z[5:1];
  assign celloutsig_0_5z = - { in_data[61:58], celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_18z = - { celloutsig_0_1z[2:1], celloutsig_0_17z, celloutsig_0_4z, _03_[2], _01_, _03_[0], celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_9z, _03_[2], _01_, _03_[0], celloutsig_0_4z };
  assign celloutsig_0_4z = | { celloutsig_0_3z[4:2], celloutsig_0_0z };
  assign celloutsig_1_2z = | { in_data[154:143], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_9z = { in_data[189:179], celloutsig_1_8z } >> { celloutsig_1_6z[9:2], 1'h0, celloutsig_1_6z[0], celloutsig_1_8z, celloutsig_1_7z };
  assign celloutsig_0_1z = { in_data[15:11], celloutsig_0_0z } >> { in_data[74:70], celloutsig_0_0z };
  assign celloutsig_0_2z = { in_data[12:7], celloutsig_0_0z } >> { in_data[90:85], celloutsig_0_0z };
  assign celloutsig_0_31z = { celloutsig_0_22z[11], celloutsig_0_8z, celloutsig_0_17z } >> { _01_, _03_[0], celloutsig_0_19z };
  assign celloutsig_0_15z = { in_data[13:8], celloutsig_0_6z, celloutsig_0_9z } >> { celloutsig_0_1z[4:0], celloutsig_0_11z, _03_[2], _01_, _03_[0], celloutsig_0_12z, celloutsig_0_5z };
  assign celloutsig_0_13z = { celloutsig_0_5z[5:3], celloutsig_0_10z, celloutsig_0_8z } ~^ { celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_4z };
  assign celloutsig_0_43z = celloutsig_0_18z[9:6] ^ { celloutsig_0_31z, celloutsig_0_0z };
  assign celloutsig_1_12z = { _02_[7:5], _02_[9:4], _00_, _02_[2:0], celloutsig_1_3z } ^ { in_data[162:159], _02_[9:4], _00_, _02_[2:0] };
  assign celloutsig_0_7z = { celloutsig_0_1z[3:2], celloutsig_0_3z, celloutsig_0_1z } ^ { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_10z = { celloutsig_0_6z[5:0], celloutsig_0_2z, celloutsig_0_5z } ^ { celloutsig_0_5z[7:1], celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign { celloutsig_1_6z[3], celloutsig_1_6z[6], celloutsig_1_6z[0], celloutsig_1_6z[7], celloutsig_1_6z[4], celloutsig_1_6z[5], celloutsig_1_6z[2], celloutsig_1_6z[9:8] } = { celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z } ^ { celloutsig_1_2z, _02_[5], celloutsig_1_2z, _02_[6], celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_0z, _02_[8:7] };
  assign _02_[3] = _00_;
  assign _03_[1] = _01_;
  assign celloutsig_1_6z[1] = 1'h0;
  assign { out_data[128], out_data[114:96], out_data[32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_42z, celloutsig_0_43z };
endmodule
