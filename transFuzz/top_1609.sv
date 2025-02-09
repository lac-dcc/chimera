/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_12z;
  wire [5:0] celloutsig_0_14z;
  wire [6:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire [7:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [9:0] celloutsig_0_20z;
  wire celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_29z;
  wire [6:0] celloutsig_0_30z;
  wire celloutsig_0_34z;
  wire celloutsig_0_3z;
  wire [8:0] celloutsig_0_47z;
  wire [6:0] celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [14:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [6:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [2:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [11:0] celloutsig_1_14z;
  wire [7:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  wire [15:0] celloutsig_1_2z;
  reg [5:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [5:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [2:0] _00_;
  always_latch
    if (!clkin_data[32]) _00_ = 3'h0;
    else if (celloutsig_1_19z) _00_ = { 1'h1, celloutsig_0_12z, celloutsig_0_5z };
  assign { celloutsig_0_15z[6:5], celloutsig_0_15z[0] } = _00_;
  assign celloutsig_0_19z = ~celloutsig_0_15z[0];
  assign celloutsig_0_34z = ~celloutsig_0_20z[1];
  assign celloutsig_1_4z = celloutsig_1_0z | celloutsig_1_1z[1];
  assign celloutsig_1_11z = celloutsig_1_6z | celloutsig_1_9z[2];
  assign celloutsig_0_23z = celloutsig_0_16z | celloutsig_0_17z[0];
  assign celloutsig_0_25z = celloutsig_0_19z | celloutsig_0_8z;
  assign celloutsig_1_6z = { celloutsig_1_2z[15:9], celloutsig_1_0z } > celloutsig_1_2z[14:7];
  assign celloutsig_1_10z = celloutsig_1_2z[15:12] > { celloutsig_1_2z[6:4], celloutsig_1_4z };
  assign celloutsig_1_13z = { celloutsig_1_2z[5:4], celloutsig_1_8z } <= { celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_6z };
  assign celloutsig_0_5z = 1'h0 && { in_data[62:61], celloutsig_0_4z };
  assign celloutsig_0_8z = 1'h1 && { celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_1_0z = ! in_data[140:136];
  assign celloutsig_0_12z = celloutsig_0_7z[14:9] || celloutsig_0_7z[13:8];
  assign celloutsig_0_16z = 1'h1 || { in_data[74:71], celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_6z };
  assign celloutsig_0_29z = 1'h1 || in_data[86:84];
  assign celloutsig_1_8z = celloutsig_1_0z & ~(celloutsig_1_0z);
  assign celloutsig_0_48z = { celloutsig_0_9z[5:1], celloutsig_0_4z, 1'h0 } % { 1'h1, celloutsig_0_30z[5:2], 1'h1, celloutsig_0_12z };
  assign celloutsig_1_18z = { in_data[106:101], celloutsig_1_0z, celloutsig_1_6z } % { 1'h1, celloutsig_1_14z[8], celloutsig_1_3z };
  assign celloutsig_0_7z = { celloutsig_0_5z, 9'h010, celloutsig_0_5z, 4'h0 } % { 1'h1, in_data[35:23], celloutsig_0_6z };
  assign celloutsig_0_47z = { celloutsig_0_18z[0], celloutsig_0_15z[6:5], 4'h0, celloutsig_0_15z[0], celloutsig_0_29z } * { 2'h0, celloutsig_0_34z, celloutsig_0_5z, celloutsig_0_23z, celloutsig_0_25z, celloutsig_0_25z, celloutsig_0_6z, celloutsig_0_5z };
  assign celloutsig_1_9z = celloutsig_1_2z[5:0] * { celloutsig_1_3z[5:2], celloutsig_1_8z, celloutsig_1_6z };
  assign celloutsig_0_18z = { celloutsig_0_17z[2], celloutsig_0_8z, celloutsig_0_14z } * { celloutsig_0_15z[6:5], 1'h0, celloutsig_0_17z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_20z = { celloutsig_0_7z[12:4], celloutsig_0_12z } * { celloutsig_0_7z[10:2], 1'h1 };
  assign celloutsig_1_2z = - { in_data[185:176], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_14z = - { celloutsig_0_9z[5:1], celloutsig_0_4z };
  assign celloutsig_0_6z = | { in_data[36:32], celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_1_19z = | { celloutsig_1_9z[3], celloutsig_1_7z[2:1], celloutsig_1_10z, celloutsig_1_7z[2:1] };
  assign celloutsig_0_3z = ^ in_data[55:42];
  assign celloutsig_0_4z = ^ in_data[81:60];
  assign celloutsig_1_1z = in_data[164:162] ^ { in_data[170:169], celloutsig_1_0z };
  assign celloutsig_1_12z = { celloutsig_1_1z[1:0], celloutsig_1_8z } ^ celloutsig_1_9z[3:1];
  assign celloutsig_1_14z = { celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_10z, celloutsig_1_12z, celloutsig_1_1z, celloutsig_1_13z, celloutsig_1_11z } ^ celloutsig_1_2z[13:2];
  always_latch
    if (!clkin_data[64]) celloutsig_1_3z = 6'h00;
    else if (!clkin_data[0]) celloutsig_1_3z = { celloutsig_1_1z[2:1], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_7z[2:1] = celloutsig_1_3z[3:2] ^ celloutsig_1_3z[5:4];
  assign celloutsig_0_9z[6:1] = in_data[16:11] ~^ { celloutsig_0_7z[4:1], celloutsig_0_4z, celloutsig_0_6z };
  assign { celloutsig_0_30z[1], celloutsig_0_30z[6:2] } = { celloutsig_0_29z, celloutsig_0_14z[5:1] } ^ { celloutsig_0_18z[1], celloutsig_0_18z[6:2] };
  assign celloutsig_0_17z = ~ { celloutsig_0_14z[4:3], celloutsig_0_5z };
  assign celloutsig_0_15z[4:1] = 4'h0;
  assign celloutsig_0_9z[0] = celloutsig_0_4z;
  assign celloutsig_1_7z[0] = 1'h0;
  assign { out_data[135:128], out_data[96], out_data[40:32], out_data[6:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_47z, celloutsig_0_48z };
endmodule
