/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [3:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [5:0] celloutsig_0_16z;
  wire [26:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [4:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire [4:0] celloutsig_0_24z;
  wire [4:0] celloutsig_0_25z;
  wire [8:0] celloutsig_0_26z;
  reg [12:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [2:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [11:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [15:0] celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire [4:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [11:0] celloutsig_0_41z;
  wire [3:0] celloutsig_0_42z;
  wire [3:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_48z;
  reg [8:0] celloutsig_0_4z;
  reg [3:0] celloutsig_0_50z;
  wire [18:0] celloutsig_0_54z;
  wire celloutsig_0_55z;
  reg [12:0] celloutsig_0_57z;
  wire [31:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire [17:0] celloutsig_0_60z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [13:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [8:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [17:0] celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire [6:0] celloutsig_1_19z;
  reg [6:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [17:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_40z = ~(celloutsig_0_12z & celloutsig_0_28z);
  assign celloutsig_1_8z = ~(in_data[125] & celloutsig_1_4z);
  assign celloutsig_0_45z = !(celloutsig_0_16z[0] ? celloutsig_0_14z : celloutsig_0_31z);
  assign celloutsig_0_55z = !(celloutsig_0_33z ? celloutsig_0_45z : celloutsig_0_3z);
  assign celloutsig_1_13z = !(celloutsig_1_7z ? celloutsig_1_9z[5] : in_data[104]);
  assign celloutsig_1_18z = !(celloutsig_1_14z[6] ? celloutsig_1_12z : in_data[114]);
  assign celloutsig_0_3z = ~(celloutsig_0_2z | celloutsig_0_2z);
  assign celloutsig_1_3z = ~(celloutsig_1_0z | celloutsig_1_1z[3]);
  assign celloutsig_0_21z = ~(celloutsig_0_14z | celloutsig_0_20z);
  assign celloutsig_0_32z = ~((celloutsig_0_28z | celloutsig_0_26z[1]) & celloutsig_0_25z[4]);
  assign celloutsig_0_5z = ~((celloutsig_0_4z[5] | celloutsig_0_1z) & celloutsig_0_0z);
  assign celloutsig_0_2z = celloutsig_0_0z | ~(celloutsig_0_1z);
  assign celloutsig_0_48z = ~(celloutsig_0_16z[2] ^ celloutsig_0_17z[12]);
  assign celloutsig_0_7z = ~(celloutsig_0_1z ^ celloutsig_0_6z);
  assign celloutsig_0_60z = { celloutsig_0_54z[16:0], celloutsig_0_48z } / { 1'h1, celloutsig_0_42z, celloutsig_0_14z, celloutsig_0_41z };
  assign celloutsig_0_25z = { celloutsig_0_19z[0], celloutsig_0_11z } / { 1'h1, celloutsig_0_24z[3], celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_18z };
  assign celloutsig_1_6z = in_data[173:169] > { celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_0_31z = celloutsig_0_8z[13:9] <= { celloutsig_0_17z[22], celloutsig_0_23z, celloutsig_0_20z, celloutsig_0_12z, celloutsig_0_5z };
  assign celloutsig_0_36z = celloutsig_0_17z[15:10] <= celloutsig_0_8z[8:3];
  assign celloutsig_1_5z = { celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_3z } <= { in_data[104:101], celloutsig_1_2z };
  assign celloutsig_0_12z = { in_data[82:78], celloutsig_0_6z } <= { in_data[52:48], celloutsig_0_3z };
  assign celloutsig_0_18z = { celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_9z } <= in_data[42:39];
  assign celloutsig_0_1z = { in_data[52:51], celloutsig_0_0z } <= { in_data[59:58], celloutsig_0_0z };
  assign celloutsig_0_10z = { celloutsig_0_8z[4:0], celloutsig_0_0z, celloutsig_0_6z } && in_data[59:53];
  assign celloutsig_0_14z = { in_data[88:68], celloutsig_0_9z, celloutsig_0_12z } && { celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_0_15z = { celloutsig_0_8z[8:4], celloutsig_0_10z } && { celloutsig_0_11z[3:1], celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_33z = celloutsig_0_28z & ~(celloutsig_0_26z[5]);
  assign celloutsig_1_7z = celloutsig_1_0z & ~(celloutsig_1_5z);
  assign celloutsig_0_54z = { celloutsig_0_38z[4:1], celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_31z, celloutsig_0_42z, celloutsig_0_48z, celloutsig_0_24z, celloutsig_0_18z } % { 1'h1, celloutsig_0_30z[8:3], celloutsig_0_41z };
  assign celloutsig_0_26z = { celloutsig_0_25z[4:1], celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_7z, celloutsig_0_23z } % { 1'h1, celloutsig_0_8z[4:3], celloutsig_0_25z, celloutsig_0_20z };
  assign celloutsig_0_42z = { celloutsig_0_29z, celloutsig_0_23z } % { 1'h1, celloutsig_0_25z[3:1] };
  assign celloutsig_1_9z = { in_data[112:98], celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_5z } % { 1'h1, in_data[122:121], celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_1_11z = { in_data[131:124], celloutsig_1_6z } % { 1'h1, in_data[141:134] };
  assign celloutsig_0_16z = { celloutsig_0_4z[6:4], celloutsig_0_9z, celloutsig_0_14z, celloutsig_0_5z } % { 1'h1, celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_6z };
  assign celloutsig_0_29z = { celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_13z } % { 1'h1, celloutsig_0_1z, celloutsig_0_20z };
  assign celloutsig_0_41z = ~ { in_data[90:80], celloutsig_0_20z };
  assign celloutsig_0_43z = ~ celloutsig_0_16z[5:2];
  assign celloutsig_0_24z = ~ { celloutsig_0_8z[11:8], celloutsig_0_13z };
  assign celloutsig_0_13z = ~^ celloutsig_0_4z[6:2];
  assign celloutsig_0_44z = ^ { celloutsig_0_30z[11:2], celloutsig_0_41z, celloutsig_0_26z, celloutsig_0_13z, celloutsig_0_40z, celloutsig_0_11z };
  assign celloutsig_1_4z = ^ { celloutsig_1_1z[5:2], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_10z = ^ { celloutsig_1_9z[15:5], celloutsig_1_3z };
  assign celloutsig_1_12z = ^ { celloutsig_1_11z[1:0], celloutsig_1_7z };
  assign celloutsig_0_9z = ^ { in_data[24:19], celloutsig_0_0z };
  assign celloutsig_0_34z = { celloutsig_0_17z[5:1], celloutsig_0_5z, celloutsig_0_26z, celloutsig_0_0z } << { celloutsig_0_30z[10:2], celloutsig_0_13z, celloutsig_0_32z, celloutsig_0_11z, celloutsig_0_10z };
  assign celloutsig_0_38z = celloutsig_0_4z[5:1] << { in_data[34:31], celloutsig_0_7z };
  assign celloutsig_0_8z = { in_data[4:1], celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_5z } << { celloutsig_0_4z[1], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_4z };
  assign celloutsig_0_11z = celloutsig_0_8z[3:0] << { celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_17z = { celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_15z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_16z } << { celloutsig_0_4z[7:1], celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_3z };
  assign celloutsig_0_19z = { celloutsig_0_3z, celloutsig_0_11z } << { in_data[14:11], celloutsig_0_5z };
  assign celloutsig_0_30z = { celloutsig_0_27z[7:2], celloutsig_0_16z } << { celloutsig_0_24z[4:1], celloutsig_0_21z, celloutsig_0_21z, celloutsig_0_19z, celloutsig_0_15z };
  assign celloutsig_0_59z = { celloutsig_0_43z[2:0], celloutsig_0_23z, celloutsig_0_13z, celloutsig_0_43z, celloutsig_0_40z, celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_44z, celloutsig_0_36z, celloutsig_0_29z, celloutsig_0_57z, celloutsig_0_7z, celloutsig_0_21z } >>> { celloutsig_0_34z[14:1], celloutsig_0_55z, celloutsig_0_39z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_50z, celloutsig_0_4z, celloutsig_0_14z };
  assign celloutsig_1_19z = celloutsig_1_1z >>> { celloutsig_1_1z[3:1], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_2z };
  assign celloutsig_1_14z = { celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_12z, celloutsig_1_10z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_13z, celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_4z } - { celloutsig_1_11z[7:4], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_4z };
  assign celloutsig_0_39z = ~((celloutsig_0_1z & celloutsig_0_2z) | celloutsig_0_9z);
  assign celloutsig_1_2z = ~((in_data[147] & in_data[156]) | celloutsig_1_1z[3]);
  assign celloutsig_0_6z = ~((celloutsig_0_4z[8] & celloutsig_0_0z) | celloutsig_0_1z);
  assign celloutsig_0_20z = ~((celloutsig_0_13z & celloutsig_0_1z) | celloutsig_0_3z);
  assign celloutsig_0_23z = ~((celloutsig_0_19z[3] & celloutsig_0_19z[2]) | celloutsig_0_6z);
  always_latch
    if (clkin_data[32]) celloutsig_0_4z = 9'h000;
    else if (celloutsig_1_19z[0]) celloutsig_0_4z = { in_data[83:76], celloutsig_0_0z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_50z = 4'h0;
    else if (!celloutsig_1_19z[0]) celloutsig_0_50z = celloutsig_0_34z[14:11];
  always_latch
    if (!clkin_data[32]) celloutsig_0_57z = 13'h0000;
    else if (celloutsig_1_19z[0]) celloutsig_0_57z = { celloutsig_0_34z[11:0], celloutsig_0_45z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_1z = 7'h00;
    else if (!clkin_data[0]) celloutsig_1_1z = { in_data[173:168], celloutsig_1_0z };
  always_latch
    if (clkin_data[32]) celloutsig_0_27z = 13'h0000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_27z = { celloutsig_0_17z[17:10], celloutsig_0_25z };
  assign celloutsig_0_0z = ~((in_data[26] & in_data[55]) | (in_data[14] & in_data[64]));
  assign celloutsig_1_0z = ~((in_data[134] & in_data[136]) | (in_data[186] & in_data[187]));
  assign celloutsig_0_28z = ~((celloutsig_0_4z[6] & celloutsig_0_1z) | (celloutsig_0_12z & celloutsig_0_23z));
  assign { out_data[128], out_data[102:96], out_data[63:32], out_data[17:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_59z, celloutsig_0_60z };
endmodule
