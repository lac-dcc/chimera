/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [3:0] celloutsig_0_19z;
  wire [7:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [17:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [5:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [5:0] celloutsig_0_2z;
  wire [8:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  reg [8:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [5:0] celloutsig_0_37z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  reg [3:0] celloutsig_0_40z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_46z;
  reg [2:0] celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire [5:0] celloutsig_0_4z;
  wire celloutsig_0_52z;
  wire [7:0] celloutsig_0_53z;
  reg [2:0] celloutsig_0_55z;
  wire [2:0] celloutsig_0_56z;
  wire [39:0] celloutsig_0_59z;
  wire [5:0] celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire celloutsig_0_62z;
  wire [12:0] celloutsig_0_65z;
  wire [9:0] celloutsig_0_66z;
  wire celloutsig_0_6z;
  wire [14:0] celloutsig_0_74z;
  wire celloutsig_0_7z;
  reg [4:0] celloutsig_0_80z;
  wire celloutsig_0_81z;
  wire celloutsig_0_8z;
  wire [4:0] celloutsig_0_9z;
  wire [10:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [5:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [9:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_52z = ~(celloutsig_0_36z & celloutsig_0_18z);
  assign celloutsig_0_62z = ~(celloutsig_0_2z[3] & celloutsig_0_4z[3]);
  assign celloutsig_1_5z = ~(celloutsig_1_3z & celloutsig_1_4z);
  assign celloutsig_0_12z = ~(1'h1 & celloutsig_0_3z);
  assign celloutsig_0_24z = ~(1'h1 & celloutsig_0_6z);
  assign celloutsig_0_3z = ~(celloutsig_0_1z[5] | 1'h1);
  assign celloutsig_1_13z = ~(celloutsig_1_6z | celloutsig_1_2z);
  assign celloutsig_0_18z = ~(celloutsig_0_1z[0] | celloutsig_0_4z[3]);
  assign celloutsig_0_60z = celloutsig_0_48z | ~(celloutsig_0_43z);
  assign celloutsig_1_10z = celloutsig_1_1z | ~(celloutsig_1_3z);
  assign celloutsig_1_18z = celloutsig_1_0z[10] | ~(in_data[135]);
  assign celloutsig_0_11z = in_data[76] | ~(1'h1);
  assign celloutsig_0_81z = celloutsig_0_40z[1] | celloutsig_0_44z;
  assign celloutsig_0_8z = ~(celloutsig_0_3z ^ in_data[39]);
  assign celloutsig_0_29z = ~(celloutsig_0_12z ^ celloutsig_0_13z);
  assign celloutsig_0_53z = { celloutsig_0_30z[1:0], celloutsig_0_29z, celloutsig_0_19z, celloutsig_0_29z } / { 1'h1, celloutsig_0_30z[6:0] };
  assign celloutsig_0_9z = { in_data[38:36], 1'h1, celloutsig_0_7z } / { 1'h1, in_data[73:70] };
  assign celloutsig_1_2z = celloutsig_1_0z[9:0] === { celloutsig_1_0z[8:0], celloutsig_1_1z };
  assign celloutsig_1_6z = in_data[137:135] === celloutsig_1_0z[3:1];
  assign celloutsig_0_13z = { in_data[89:88], celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_3z } === { celloutsig_0_5z[5:2], celloutsig_0_8z };
  assign celloutsig_0_15z = { 1'h1, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_14z } === { celloutsig_0_4z[3:1], celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_17z = { celloutsig_0_2z[5:2], celloutsig_0_12z } === in_data[25:21];
  assign celloutsig_0_23z = { celloutsig_0_5z[3:0], celloutsig_0_13z } === { celloutsig_0_21z[12:9], celloutsig_0_7z };
  assign celloutsig_0_26z = { celloutsig_0_24z, 2'h3 } === { celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_11z };
  assign celloutsig_0_28z = { celloutsig_0_19z[3:2], celloutsig_0_7z } === { celloutsig_0_25z[4], celloutsig_0_24z, celloutsig_0_13z };
  assign celloutsig_0_48z = { celloutsig_0_37z[5:4], celloutsig_0_13z, celloutsig_0_31z, celloutsig_0_32z, celloutsig_0_11z, celloutsig_0_23z, celloutsig_0_31z, celloutsig_0_27z, celloutsig_0_32z } >= { celloutsig_0_4z[5:2], celloutsig_0_13z, celloutsig_0_40z, celloutsig_0_27z };
  assign celloutsig_1_3z = { celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z } >= in_data[163:161];
  assign celloutsig_0_14z = celloutsig_0_2z && in_data[60:55];
  assign celloutsig_0_35z = ! { celloutsig_0_25z[0], celloutsig_0_13z, celloutsig_0_20z, celloutsig_0_20z, celloutsig_0_28z, celloutsig_0_32z };
  assign celloutsig_0_39z = ! { celloutsig_0_35z, celloutsig_0_36z, celloutsig_0_12z, celloutsig_0_7z };
  assign celloutsig_0_43z = ! { celloutsig_0_17z, celloutsig_0_1z };
  assign celloutsig_0_46z = ! { celloutsig_0_11z, celloutsig_0_35z, celloutsig_0_6z };
  assign celloutsig_0_7z = { celloutsig_0_4z[5:3], 1'h1 } < { celloutsig_0_2z[4:2], 1'h1 };
  assign celloutsig_1_16z = { celloutsig_1_11z, celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_9z } < { celloutsig_1_2z, celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_13z, celloutsig_1_12z, celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_16z = { in_data[49:47], celloutsig_0_13z, celloutsig_0_9z } < { celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_9z };
  assign celloutsig_0_44z = 1'h1 & ~(celloutsig_0_28z);
  assign celloutsig_1_15z = celloutsig_1_2z & ~(celloutsig_1_8z[2]);
  assign celloutsig_0_20z = celloutsig_0_13z & ~(celloutsig_0_8z);
  assign celloutsig_0_31z = celloutsig_0_2z[4] & ~(celloutsig_0_24z);
  assign celloutsig_0_37z = { celloutsig_0_4z[4:1], celloutsig_0_35z, celloutsig_0_7z } % { 1'h1, celloutsig_0_30z[1:0], celloutsig_0_23z, celloutsig_0_16z, celloutsig_0_13z };
  assign celloutsig_0_4z = celloutsig_0_2z % { 1'h1, celloutsig_0_2z[4:1], in_data[0] };
  assign celloutsig_0_30z = { celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_27z, celloutsig_0_29z, celloutsig_0_19z, celloutsig_0_26z } % { 1'h1, in_data[18:11] };
  assign celloutsig_0_21z = { celloutsig_0_4z[2:1], celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_8z } * { in_data[16:4], celloutsig_0_3z, celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_1_19z = celloutsig_1_18z ? { in_data[166:161], celloutsig_1_9z, 1'h1 } : { celloutsig_1_11z, celloutsig_1_15z, celloutsig_1_14z, celloutsig_1_16z, celloutsig_1_12z };
  assign celloutsig_0_19z = celloutsig_0_4z[5] ? { celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_13z } : { celloutsig_0_4z[4:2], celloutsig_0_10z };
  assign celloutsig_1_4z = { in_data[122:106], celloutsig_1_3z, celloutsig_1_3z } != { in_data[147:140], celloutsig_1_0z };
  assign celloutsig_1_7z = celloutsig_1_0z[6:2] != in_data[160:156];
  assign celloutsig_1_11z = { celloutsig_1_0z[10:4], celloutsig_1_2z, celloutsig_1_9z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_1z } != { celloutsig_1_0z[8:0], celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_0z };
  assign celloutsig_0_65z = - { celloutsig_0_59z[17:12], celloutsig_0_12z, 1'h1, celloutsig_0_24z, celloutsig_0_60z, celloutsig_0_62z, celloutsig_0_17z, celloutsig_0_52z };
  assign celloutsig_1_9z = - { celloutsig_1_8z[3:2], celloutsig_1_5z };
  assign celloutsig_0_32z = | { celloutsig_0_1z[6:4], celloutsig_0_12z, celloutsig_0_26z };
  assign celloutsig_1_12z = celloutsig_1_6z & celloutsig_1_10z;
  assign celloutsig_0_22z = celloutsig_0_3z & celloutsig_0_12z;
  assign celloutsig_0_36z = ^ { in_data[55:51], celloutsig_0_23z, celloutsig_0_8z, celloutsig_0_20z, celloutsig_0_12z, celloutsig_0_31z };
  assign celloutsig_0_6z = ^ celloutsig_0_4z[3:0];
  assign celloutsig_1_1z = ^ celloutsig_1_0z[8:4];
  assign celloutsig_0_10z = ^ in_data[82:68];
  assign celloutsig_0_27z = ^ { celloutsig_0_1z, celloutsig_0_22z, celloutsig_0_8z };
  assign celloutsig_0_74z = { celloutsig_0_9z[1], celloutsig_0_65z, celloutsig_0_31z } >> { celloutsig_0_30z[7:4], celloutsig_0_66z, celloutsig_0_22z };
  assign celloutsig_0_1z = in_data[49:42] >> { in_data[32:26], 1'h1 };
  assign celloutsig_0_5z = { in_data[46:44], 2'h3, celloutsig_0_3z } << in_data[80:75];
  assign celloutsig_0_56z = celloutsig_0_40z[3:1] << { celloutsig_0_20z, celloutsig_0_31z, celloutsig_0_12z };
  assign celloutsig_0_66z = { celloutsig_0_3z, celloutsig_0_13z, celloutsig_0_32z, celloutsig_0_5z, celloutsig_0_11z } << { celloutsig_0_30z[8:7], celloutsig_0_53z };
  assign celloutsig_1_14z = { celloutsig_1_9z[1:0], celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_3z } << { in_data[140:138], celloutsig_1_9z };
  assign celloutsig_1_8z = { celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_5z } >>> celloutsig_1_0z[7:4];
  assign celloutsig_0_2z = celloutsig_0_1z[5:0] >>> celloutsig_0_1z[7:2];
  assign celloutsig_0_25z = { celloutsig_0_21z[10:8], celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_22z } >>> celloutsig_0_5z;
  assign celloutsig_1_0z = in_data[149:139] ^ in_data[154:144];
  always_latch
    if (clkin_data[64]) celloutsig_0_34z = 9'h000;
    else if (clkin_data[0]) celloutsig_0_34z = { celloutsig_0_21z[11:5], celloutsig_0_3z, celloutsig_0_18z };
  always_latch
    if (clkin_data[64]) celloutsig_0_40z = 4'h0;
    else if (!celloutsig_1_19z[0]) celloutsig_0_40z = celloutsig_0_34z[3:0];
  always_latch
    if (clkin_data[64]) celloutsig_0_47z = 3'h0;
    else if (!celloutsig_1_19z[0]) celloutsig_0_47z = { in_data[43:42], celloutsig_0_44z };
  always_latch
    if (clkin_data[64]) celloutsig_0_55z = 3'h0;
    else if (!celloutsig_1_19z[0]) celloutsig_0_55z = { celloutsig_0_9z[4:3], celloutsig_0_18z };
  always_latch
    if (clkin_data[64]) celloutsig_0_80z = 5'h00;
    else if (!clkin_data[0]) celloutsig_0_80z = celloutsig_0_74z[12:8];
  assign { celloutsig_0_59z[36:31], celloutsig_0_59z[20], celloutsig_0_59z[18:16], celloutsig_0_59z[30], celloutsig_0_59z[22], celloutsig_0_59z[6:3], celloutsig_0_59z[21], celloutsig_0_59z[14:9], celloutsig_0_59z[23], celloutsig_0_59z[1], celloutsig_0_59z[2], celloutsig_0_59z[8], celloutsig_0_59z[0], celloutsig_0_59z[39:37], celloutsig_0_59z[29:24], celloutsig_0_59z[15] } = ~ { celloutsig_0_56z, celloutsig_0_55z, celloutsig_0_48z, celloutsig_0_47z, celloutsig_0_46z, celloutsig_0_43z, celloutsig_0_40z, celloutsig_0_39z, celloutsig_0_37z, celloutsig_0_36z, celloutsig_0_29z, celloutsig_0_28z, celloutsig_0_27z, celloutsig_0_11z, celloutsig_0_9z[2:0], celloutsig_0_5z, celloutsig_0_3z };
  assign { celloutsig_0_59z[19], celloutsig_0_59z[7] } = { celloutsig_0_59z[22], celloutsig_0_59z[22] };
  assign { out_data[128], out_data[105:96], out_data[36:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_80z, celloutsig_0_81z };
endmodule
