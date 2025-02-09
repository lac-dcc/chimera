/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [7:0] _02_;
  wire [9:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [7:0] celloutsig_0_14z;
  wire [3:0] celloutsig_0_15z;
  wire [4:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [9:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [19:0] celloutsig_0_21z;
  wire [2:0] celloutsig_0_22z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [7:0] celloutsig_0_29z;
  wire [6:0] celloutsig_0_31z;
  wire [21:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire celloutsig_0_38z;
  wire [11:0] celloutsig_0_3z;
  wire [2:0] celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire [10:0] celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire [27:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_5z;
  wire [14:0] celloutsig_0_60z;
  wire [3:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [5:0] celloutsig_0_83z;
  wire celloutsig_0_84z;
  wire [5:0] celloutsig_0_8z;
  wire [14:0] celloutsig_0_9z;
  wire [13:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [6:0] celloutsig_1_11z;
  wire [3:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire [31:0] celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [2:0] _03_;
  always_latch
    if (clkin_data[0]) _03_ = 3'h0;
    else if (!celloutsig_1_18z[0]) _03_ = celloutsig_0_0z[3:1];
  assign celloutsig_0_6z[3:1] = _03_;
  assign celloutsig_0_19z = !(celloutsig_0_8z[4] ? celloutsig_0_4z : celloutsig_0_12z);
  assign celloutsig_0_48z = ~_00_;
  assign celloutsig_0_84z = ~((_01_ | celloutsig_0_31z[3]) & celloutsig_0_11z);
  assign celloutsig_1_5z = ~((in_data[166] | celloutsig_1_10z) & celloutsig_1_2z[0]);
  assign celloutsig_0_13z = ~((in_data[22] | 1'h0) & celloutsig_0_7z);
  assign celloutsig_0_26z = ~((celloutsig_0_0z[6] | celloutsig_0_8z[3]) & celloutsig_0_9z[12]);
  assign celloutsig_0_11z = celloutsig_0_9z[1] | ~(celloutsig_0_1z);
  assign celloutsig_0_20z = celloutsig_0_3z[10] | ~(celloutsig_0_13z);
  assign celloutsig_0_7z = celloutsig_0_0z[0] | celloutsig_0_6z[1];
  assign celloutsig_0_5z = celloutsig_0_1z ^ celloutsig_0_4z;
  assign celloutsig_0_17z = celloutsig_0_16z[1] ^ in_data[67];
  assign celloutsig_0_25z = in_data[72] ^ celloutsig_0_19z;
  assign celloutsig_0_35z = ~(celloutsig_0_28z ^ celloutsig_0_18z[6]);
  assign celloutsig_0_50z = ~(celloutsig_0_27z ^ celloutsig_0_22z[0]);
  assign celloutsig_1_1z = ~(celloutsig_1_0z[0] ^ celloutsig_1_0z[4]);
  assign celloutsig_1_19z = ~(celloutsig_1_5z ^ celloutsig_1_3z);
  reg [7:0] _20_;
  always_ff @(negedge clkin_data[64], posedge clkin_data[0])
    if (clkin_data[0]) _20_ <= 8'h00;
    else _20_ <= { celloutsig_0_9z[8:2], celloutsig_0_4z };
  assign { _02_[7:6], _01_, _02_[4:3], _00_, _02_[1:0] } = _20_;
  assign celloutsig_0_33z = celloutsig_0_21z[19:1] >= { celloutsig_0_0z[7:5], celloutsig_0_26z, celloutsig_0_9z };
  assign celloutsig_0_43z = { celloutsig_0_14z[5:3], celloutsig_0_10z } <= { celloutsig_0_31z[2:0], celloutsig_0_35z };
  assign celloutsig_1_10z = celloutsig_1_0z[9:7] <= celloutsig_1_2z[4:2];
  assign celloutsig_0_10z = { celloutsig_0_8z[3:0], celloutsig_0_6z[3:1], 1'h0, celloutsig_0_7z } <= { celloutsig_0_3z[8:1], celloutsig_0_7z };
  assign celloutsig_0_38z = celloutsig_0_0z[7:1] && { celloutsig_0_22z[1:0], celloutsig_0_15z, celloutsig_0_11z };
  assign celloutsig_0_28z = { celloutsig_0_3z[9:7], celloutsig_0_16z, celloutsig_0_7z } && { celloutsig_0_22z[2], _02_[7:6], _01_, _02_[4:3], _00_, _02_[1:0] };
  assign celloutsig_0_12z = celloutsig_0_4z & ~(celloutsig_0_9z[12]);
  assign celloutsig_0_31z = { celloutsig_0_18z[9:4], 1'h0 } % { 1'h1, celloutsig_0_29z[5:0] };
  assign celloutsig_0_60z = { celloutsig_0_49z[17:8], celloutsig_0_22z, celloutsig_0_50z, celloutsig_0_1z } % { 1'h1, celloutsig_0_9z[8:6], celloutsig_0_43z, celloutsig_0_28z, celloutsig_0_19z, celloutsig_0_14z };
  assign celloutsig_0_29z = { celloutsig_0_26z, celloutsig_0_7z, celloutsig_0_25z, celloutsig_0_28z, celloutsig_0_6z[3:1], 1'h0 } % { 1'h1, celloutsig_0_14z[0], celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_26z, celloutsig_0_17z, celloutsig_0_28z, celloutsig_0_1z };
  assign celloutsig_0_15z = celloutsig_0_13z ? { celloutsig_0_9z[2:0], celloutsig_0_7z } : in_data[74:71];
  assign celloutsig_0_41z = ~ { celloutsig_0_0z[6:5], celloutsig_0_17z };
  assign celloutsig_0_83z = ~ { celloutsig_0_60z[13:10], celloutsig_0_20z, celloutsig_0_4z };
  assign celloutsig_0_8z = ~ { celloutsig_0_0z[7:3], celloutsig_0_4z };
  assign celloutsig_1_18z = ~ { celloutsig_1_12z[3], celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_3z };
  assign celloutsig_0_14z = ~ { celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_8z };
  assign celloutsig_1_2z = in_data[156:150] | { celloutsig_1_0z[7:2], celloutsig_1_1z };
  assign celloutsig_0_22z = { in_data[4:3], celloutsig_0_5z } | celloutsig_0_15z[2:0];
  assign celloutsig_1_7z = ^ celloutsig_1_0z[8:2];
  assign celloutsig_0_27z = ^ celloutsig_0_8z[3:1];
  assign celloutsig_0_47z = { celloutsig_0_44z, celloutsig_0_11z, celloutsig_0_16z, celloutsig_0_5z, celloutsig_0_17z, celloutsig_0_26z, celloutsig_0_28z } <<< { celloutsig_0_33z, 1'h0, celloutsig_0_12z, celloutsig_0_29z };
  assign celloutsig_1_0z = in_data[123:110] <<< in_data[139:126];
  assign celloutsig_1_8z = in_data[158:127] <<< { in_data[189:161], celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_7z };
  assign celloutsig_1_11z = { in_data[124:119], celloutsig_1_7z } <<< { celloutsig_1_8z[10:6], celloutsig_1_10z, celloutsig_1_10z };
  assign celloutsig_0_3z = in_data[78:67] >>> in_data[39:28];
  assign celloutsig_0_49z = { celloutsig_0_47z[8:0], celloutsig_0_24z, celloutsig_0_19z, celloutsig_0_27z, celloutsig_0_22z, celloutsig_0_41z, celloutsig_0_48z, _02_[7:6], _01_, _02_[4:3], _00_, _02_[1:0], celloutsig_0_38z } >>> { celloutsig_0_32z[10:7], celloutsig_0_31z, celloutsig_0_12z, celloutsig_0_3z, celloutsig_0_6z[3:1], 1'h0 };
  assign celloutsig_0_9z = { celloutsig_0_6z[3:1], 1'h0, celloutsig_0_0z, 1'h0 } >>> { in_data[94:91], celloutsig_0_0z, celloutsig_0_7z };
  assign celloutsig_0_0z = in_data[43:34] - in_data[55:46];
  assign celloutsig_0_32z = { celloutsig_0_9z[12:1], celloutsig_0_14z, celloutsig_0_27z, celloutsig_0_26z } - { celloutsig_0_31z[3], celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_17z, celloutsig_0_8z };
  assign celloutsig_1_12z = celloutsig_1_11z[5:2] - celloutsig_1_0z[8:5];
  assign celloutsig_0_16z = { celloutsig_0_15z, celloutsig_0_13z } - { celloutsig_0_3z[9:8], celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_7z };
  assign celloutsig_0_4z = ~((celloutsig_0_3z[6] & celloutsig_0_1z) | (1'h0 & in_data[35]));
  assign celloutsig_1_3z = ~((celloutsig_1_1z & in_data[166]) | (celloutsig_1_2z[5] & celloutsig_1_2z[0]));
  assign celloutsig_0_1z = ~((in_data[64] & in_data[49]) | (in_data[81] & in_data[62]));
  assign celloutsig_0_24z = ~((celloutsig_0_3z[10] & celloutsig_0_3z[2]) | (1'h0 & _02_[3]));
  assign celloutsig_0_21z[10] = ~ in_data[76];
  assign celloutsig_0_21z[15] = ~ in_data[81];
  assign { celloutsig_0_18z[0], celloutsig_0_18z[9:3], celloutsig_0_18z[1] } = { celloutsig_0_11z, in_data[43:37], in_data[35] } | { celloutsig_0_7z, celloutsig_0_0z[6:4], celloutsig_0_7z, celloutsig_0_6z[3:1], celloutsig_0_5z };
  assign { celloutsig_0_21z[4:0], celloutsig_0_21z[19:16], celloutsig_0_21z[14:11], celloutsig_0_21z[9:5] } = { celloutsig_0_16z, in_data[85:82], in_data[80:77], in_data[75:71] } ~^ { celloutsig_0_18z[4:3], in_data[36], celloutsig_0_18z[1:0], celloutsig_0_12z, celloutsig_0_6z[3:1], celloutsig_0_10z, celloutsig_0_6z[3:1], celloutsig_0_18z[9:5] };
  assign celloutsig_0_44z = ~celloutsig_0_24z;
  assign { _02_[5], _02_[2] } = { _01_, _00_ };
  assign celloutsig_0_18z[2] = in_data[36];
  assign celloutsig_0_6z[0] = 1'h0;
  assign { out_data[131:128], out_data[96], out_data[37:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_83z, celloutsig_0_84z };
endmodule
