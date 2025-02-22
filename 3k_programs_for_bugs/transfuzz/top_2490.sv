/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [16:0] _01_;
  wire [9:0] celloutsig_0_0z;
  wire [16:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [9:0] celloutsig_0_15z;
  wire [14:0] celloutsig_0_16z;
  wire [12:0] celloutsig_0_17z;
  wire [17:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  reg [10:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire [2:0] celloutsig_0_24z;
  wire [11:0] celloutsig_0_26z;
  wire [15:0] celloutsig_0_27z;
  wire celloutsig_0_29z;
  reg [8:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [8:0] celloutsig_0_31z;
  reg [9:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_38z;
  wire [9:0] celloutsig_0_3z;
  wire [10:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [20:0] celloutsig_0_43z;
  wire [9:0] celloutsig_0_4z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [39:0] celloutsig_1_11z;
  wire [4:0] celloutsig_1_18z;
  wire [11:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [29:0] celloutsig_1_2z;
  wire [10:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [16:0] celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_38z = !(celloutsig_0_30z ? celloutsig_0_19z : celloutsig_0_33z);
  assign celloutsig_0_13z = !(in_data[19] ? celloutsig_0_4z[8] : in_data[95]);
  assign celloutsig_0_41z = ~celloutsig_0_13z;
  assign celloutsig_0_58z = ~((celloutsig_0_40z[5] | celloutsig_0_4z[8]) & (celloutsig_0_14z | celloutsig_0_41z));
  assign celloutsig_0_59z = ~((celloutsig_0_9z | celloutsig_0_40z[0]) & (celloutsig_0_43z[2] | celloutsig_0_38z));
  assign celloutsig_0_11z = ~((celloutsig_0_2z[4] | celloutsig_0_10z[1]) & (celloutsig_0_7z | celloutsig_0_9z));
  assign celloutsig_0_22z = ~((celloutsig_0_7z | celloutsig_0_8z) & (celloutsig_0_4z[7] | celloutsig_0_17z[6]));
  assign celloutsig_0_6z = celloutsig_0_3z[7] | celloutsig_0_3z[4];
  assign celloutsig_1_7z = celloutsig_1_5z[13] ^ celloutsig_1_4z;
  assign celloutsig_0_8z = celloutsig_0_2z[4] ^ celloutsig_0_7z;
  assign celloutsig_0_29z = celloutsig_0_16z[11] ^ celloutsig_0_4z[8];
  reg [16:0] _13_;
  always_ff @(negedge clkin_data[64], posedge clkin_data[32])
    if (clkin_data[32]) _13_ <= 17'h00000;
    else _13_ <= { celloutsig_0_0z[1:0], celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_19z, celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_20z };
  assign { _01_[16:11], _00_, _01_[9:0] } = _13_;
  assign celloutsig_0_18z = { celloutsig_0_1z[6:1], celloutsig_0_14z, celloutsig_0_1z } / { 1'h1, celloutsig_0_1z[9:3], celloutsig_0_0z };
  assign celloutsig_0_5z = celloutsig_0_4z[7:4] == celloutsig_0_3z[7:4];
  assign celloutsig_0_14z = celloutsig_0_10z[6:2] == celloutsig_0_3z[9:5];
  assign celloutsig_0_12z = celloutsig_0_1z[7:3] <= celloutsig_0_2z[5:1];
  assign celloutsig_0_19z = ! celloutsig_0_15z[9:1];
  assign celloutsig_1_4z = { in_data[119:108], celloutsig_1_0z } || { celloutsig_1_2z[23:12], celloutsig_1_1z };
  assign celloutsig_0_20z = celloutsig_0_1z[8:1] || { celloutsig_0_16z[12:7], celloutsig_0_11z, celloutsig_0_12z };
  assign celloutsig_1_0z = in_data[97] & ~(in_data[147]);
  assign celloutsig_0_3z = celloutsig_0_0z % { 1'h1, in_data[90:82] };
  assign celloutsig_0_43z = { celloutsig_0_3z[9:7], celloutsig_0_18z } % { 1'h1, celloutsig_0_1z[9:2], celloutsig_0_32z, celloutsig_0_29z, celloutsig_0_7z };
  assign celloutsig_1_2z = in_data[147:118] % { 1'h1, in_data[180:159], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_17z = { in_data[35:29], celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_8z } % { 1'h1, celloutsig_0_10z[15:4] };
  assign celloutsig_0_24z = { celloutsig_0_16z[4], celloutsig_0_9z, celloutsig_0_22z } % { 1'h1, celloutsig_0_20z, celloutsig_0_20z };
  assign celloutsig_0_26z = { _01_[13:11], _00_, _01_[9:4], celloutsig_0_20z, celloutsig_0_22z } % { 1'h1, celloutsig_0_17z[10:0] };
  assign celloutsig_0_0z = in_data[92:83] * in_data[93:84];
  assign celloutsig_0_33z = celloutsig_0_17z[10:4] != { celloutsig_0_31z[8:5], celloutsig_0_24z };
  assign celloutsig_1_8z = celloutsig_1_5z[5:3] != celloutsig_1_3z[9:7];
  assign celloutsig_1_3z = - in_data[152:142];
  assign celloutsig_1_19z = - in_data[161:150];
  assign celloutsig_0_4z = ~ celloutsig_0_0z;
  assign celloutsig_0_10z = ~ { celloutsig_0_0z[9:2], celloutsig_0_2z };
  assign celloutsig_0_30z = celloutsig_0_4z[8] & celloutsig_0_13z;
  assign celloutsig_0_40z = { celloutsig_0_1z[8:1], celloutsig_0_14z, celloutsig_0_33z, celloutsig_0_9z } - { celloutsig_0_17z[11:2], celloutsig_0_7z };
  assign celloutsig_0_16z = { celloutsig_0_10z[16:14], celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_0z } - { celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_8z };
  assign celloutsig_0_27z = { _01_[4:2], celloutsig_0_26z, celloutsig_0_6z } - { _01_[15:11], _00_, _01_[9:0] };
  assign celloutsig_1_5z = { celloutsig_1_2z[21:7], celloutsig_1_0z, celloutsig_1_4z } ~^ { celloutsig_1_2z[23:8], celloutsig_1_0z };
  assign celloutsig_1_18z = celloutsig_1_3z[7:3] ~^ celloutsig_1_11z[25:21];
  assign celloutsig_0_31z = celloutsig_0_27z[15:7] ^ celloutsig_0_16z[10:2];
  assign celloutsig_1_11z = { in_data[149:141], celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_1z } ^ { celloutsig_1_2z[23:3], celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_5z };
  assign celloutsig_0_15z = { celloutsig_0_2z, celloutsig_0_6z } ^ celloutsig_0_1z[9:0];
  assign celloutsig_1_1z = ~((in_data[110] & celloutsig_1_0z) | celloutsig_1_0z);
  assign celloutsig_0_7z = ~((celloutsig_0_3z[5] & celloutsig_0_5z) | celloutsig_0_4z[4]);
  assign celloutsig_0_9z = ~((celloutsig_0_5z & celloutsig_0_8z) | celloutsig_0_7z);
  always_latch
    if (!clkin_data[32]) celloutsig_0_32z = 10'h000;
    else if (celloutsig_1_18z[0]) celloutsig_0_32z = { in_data[33:29], celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_20z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_1z = 11'h000;
    else if (!clkin_data[0]) celloutsig_0_1z = in_data[17:7];
  always_latch
    if (clkin_data[32]) celloutsig_0_2z = 9'h000;
    else if (clkin_data[0]) celloutsig_0_2z = celloutsig_0_0z[8:0];
  assign _01_[10] = _00_;
  assign { out_data[132:128], out_data[107:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_58z, celloutsig_0_59z };
endmodule
