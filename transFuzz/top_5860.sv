/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [3:0] _00_;
  reg [10:0] _01_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [3:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [9:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [18:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [16:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_24z;
  wire [7:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire [2:0] celloutsig_0_37z;
  wire [4:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [2:0] celloutsig_0_40z;
  wire celloutsig_0_43z;
  wire [9:0] celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [15:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_59z;
  wire [14:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [9:0] celloutsig_0_73z;
  wire celloutsig_0_74z;
  wire celloutsig_0_7z;
  reg [4:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [8:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [6:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_34z = celloutsig_0_17z ? celloutsig_0_2z : celloutsig_0_4z;
  assign celloutsig_0_33z = celloutsig_0_19z ? celloutsig_0_11z : celloutsig_0_10z;
  assign celloutsig_1_7z = ~(celloutsig_1_1z & celloutsig_1_4z);
  assign celloutsig_1_0z = !(in_data[175] ? in_data[140] : in_data[137]);
  assign celloutsig_0_49z = ~(celloutsig_0_8z[2] | in_data[92]);
  assign celloutsig_0_27z = ~(celloutsig_0_9z | celloutsig_0_6z);
  assign celloutsig_0_30z = ~(in_data[40] | celloutsig_0_24z);
  assign celloutsig_1_1z = ~in_data[130];
  assign celloutsig_1_19z = ~celloutsig_1_6z;
  assign celloutsig_0_36z = celloutsig_0_20z | ~(celloutsig_0_2z);
  assign celloutsig_0_4z = celloutsig_0_0z | ~(celloutsig_0_3z);
  assign celloutsig_1_2z = in_data[182] | ~(celloutsig_1_1z);
  assign celloutsig_0_20z = celloutsig_0_15z[4] | ~(celloutsig_0_14z);
  assign celloutsig_1_6z = celloutsig_1_0z | celloutsig_1_3z;
  assign celloutsig_1_9z = celloutsig_1_4z | celloutsig_1_3z;
  assign celloutsig_1_16z = celloutsig_1_2z | celloutsig_1_11z;
  assign celloutsig_0_14z = celloutsig_0_3z | celloutsig_0_0z;
  assign celloutsig_0_28z = in_data[27] | celloutsig_0_12z;
  assign celloutsig_0_21z = celloutsig_0_2z ^ celloutsig_0_3z;
  assign celloutsig_0_45z = ~(celloutsig_0_16z ^ celloutsig_0_30z);
  assign celloutsig_0_46z = ~(celloutsig_0_45z ^ celloutsig_0_7z);
  assign celloutsig_0_6z = ~(celloutsig_0_0z ^ celloutsig_0_3z);
  assign celloutsig_1_11z = ~(celloutsig_1_2z ^ celloutsig_1_4z);
  assign celloutsig_1_12z = ~(celloutsig_1_2z ^ celloutsig_1_8z);
  assign celloutsig_0_16z = ~(celloutsig_0_15z[1] ^ celloutsig_0_8z[4]);
  assign celloutsig_0_2z = ~(in_data[38] ^ in_data[14]);
  always_ff @(negedge clkin_data[96], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _00_ <= 4'h0;
    else _00_ <= celloutsig_0_5z[12:9];
  always_ff @(negedge clkin_data[128], posedge clkin_data[64])
    if (clkin_data[64]) _01_ <= 11'h000;
    else _01_ <= { celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_1z };
  assign celloutsig_0_39z = { celloutsig_0_33z, celloutsig_0_6z, celloutsig_0_37z } / { 1'h1, celloutsig_0_26z[6:4], celloutsig_0_16z };
  assign celloutsig_0_48z = { celloutsig_0_18z[15:5], _00_, celloutsig_0_28z } / { 1'h1, celloutsig_0_39z[2:1], celloutsig_0_13z[3:1], celloutsig_0_2z, celloutsig_0_21z, celloutsig_0_19z, celloutsig_0_9z, celloutsig_0_16z, celloutsig_0_0z, celloutsig_0_46z, celloutsig_0_40z };
  assign celloutsig_0_1z = { in_data[35:22], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } / { 1'h1, in_data[51:36] };
  assign celloutsig_0_47z = { celloutsig_0_7z, celloutsig_0_22z, celloutsig_0_7z, celloutsig_0_27z, celloutsig_0_27z, celloutsig_0_46z, celloutsig_0_3z, celloutsig_0_10z, celloutsig_0_45z } == { celloutsig_0_44z[9:5], celloutsig_0_2z, celloutsig_0_44z[3:1] };
  assign celloutsig_1_15z = { in_data[109:103], celloutsig_1_2z, celloutsig_1_9z } > { in_data[131], celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_12z, celloutsig_1_7z };
  assign celloutsig_0_74z = { celloutsig_0_19z, celloutsig_0_49z, celloutsig_0_11z } <= { celloutsig_0_26z[5:4], celloutsig_0_47z };
  assign celloutsig_1_3z = { in_data[158], celloutsig_1_2z, celloutsig_1_1z } <= { celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_5z = { in_data[104:101], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z } <= { in_data[188:187], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_0_17z = { celloutsig_0_15z[7:2], celloutsig_0_4z, celloutsig_0_3z } < { celloutsig_0_8z[4:2], celloutsig_0_8z };
  assign celloutsig_0_22z = { celloutsig_0_15z[8:4], celloutsig_0_19z, celloutsig_0_0z } < celloutsig_0_18z[8:2];
  assign { celloutsig_0_44z[9:5], celloutsig_0_44z[3:0] } = celloutsig_0_20z ? { celloutsig_0_15z[5:1], celloutsig_0_14z, celloutsig_0_21z, celloutsig_0_17z, celloutsig_0_10z } : { celloutsig_0_5z[11:10], celloutsig_0_13z[3:1], celloutsig_0_13z[3:1], celloutsig_0_2z };
  assign celloutsig_1_18z = in_data[130] ? { in_data[156:152], celloutsig_1_17z, celloutsig_1_0z } : { celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_5z, celloutsig_1_16z, celloutsig_1_16z, celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_0_13z[3:1] = celloutsig_0_6z ? celloutsig_0_1z[5:3] : celloutsig_0_8z[3:1];
  assign celloutsig_0_18z = celloutsig_0_16z ? { celloutsig_0_1z[16:2], 1'h1, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_7z } : { celloutsig_0_8z[4:1], celloutsig_0_7z, celloutsig_0_14z, 1'h0, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_17z, 1'h0, celloutsig_0_8z, 1'h0, celloutsig_0_4z, 1'h0 };
  assign celloutsig_0_0z = in_data[62:47] != in_data[74:59];
  assign celloutsig_1_4z = in_data[142:139] != { celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_0_37z = ~ { celloutsig_0_34z, celloutsig_0_10z, celloutsig_0_36z };
  assign celloutsig_0_43z = | { celloutsig_0_40z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_3z };
  assign celloutsig_0_59z = | in_data[57:54];
  assign celloutsig_0_3z = | celloutsig_0_1z[16:4];
  assign celloutsig_0_11z = | { celloutsig_0_10z, celloutsig_0_1z[10:9] };
  assign celloutsig_0_12z = | { celloutsig_0_4z, celloutsig_0_1z[9:2] };
  assign celloutsig_0_19z = | { celloutsig_0_16z, celloutsig_0_13z[3:1], celloutsig_0_5z[12], celloutsig_0_2z };
  assign celloutsig_0_24z = | { celloutsig_0_10z, celloutsig_0_1z[10:9], in_data[62:38] };
  assign celloutsig_0_9z = ~^ { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_7z };
  assign celloutsig_0_5z = { in_data[14:4], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_0z } >> in_data[92:78];
  assign celloutsig_1_10z = { in_data[142], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_4z } >> { celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_0_15z = { celloutsig_0_13z[1], celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_2z } - { celloutsig_0_11z, celloutsig_0_13z[3:1], celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_0_40z = { celloutsig_0_13z[2:1], celloutsig_0_2z } ^ celloutsig_0_1z[8:6];
  assign celloutsig_0_73z = celloutsig_0_48z[9:0] ^ { celloutsig_0_44z[8:5], celloutsig_0_2z, celloutsig_0_44z[3], celloutsig_0_43z, celloutsig_0_59z, celloutsig_0_2z, celloutsig_0_59z };
  assign celloutsig_0_26z = { celloutsig_0_18z[17:16], celloutsig_0_22z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_16z } ^ { celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_8z };
  assign celloutsig_0_7z = ~((celloutsig_0_3z & celloutsig_0_2z) | celloutsig_0_5z[5]);
  assign celloutsig_1_8z = ~((in_data[149] & celloutsig_1_4z) | celloutsig_1_2z);
  assign celloutsig_1_17z = ~((celloutsig_1_15z & _01_[5]) | celloutsig_1_2z);
  assign celloutsig_0_10z = ~((celloutsig_0_7z & celloutsig_0_7z) | celloutsig_0_1z[7]);
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_8z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_8z = { in_data[52:49], celloutsig_0_7z };
  assign celloutsig_0_13z[0] = celloutsig_0_2z;
  assign celloutsig_0_44z[4] = celloutsig_0_2z;
  assign { out_data[134:128], out_data[96], out_data[41:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_73z, celloutsig_0_74z };
endmodule
