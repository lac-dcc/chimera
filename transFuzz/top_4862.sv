/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [15:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire [25:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [3:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  reg [6:0] celloutsig_0_19z;
  wire [12:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [10:0] celloutsig_0_22z;
  wire [2:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  reg [4:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [6:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [3:0] celloutsig_0_33z;
  wire [10:0] celloutsig_0_35z;
  wire [18:0] celloutsig_0_36z;
  wire [10:0] celloutsig_0_37z;
  wire [3:0] celloutsig_0_38z;
  wire [4:0] celloutsig_0_39z;
  wire [39:0] celloutsig_0_3z;
  wire [7:0] celloutsig_0_40z;
  wire celloutsig_0_42z;
  reg [25:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire [11:0] celloutsig_0_45z;
  wire [12:0] celloutsig_0_46z;
  wire [10:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_53z;
  reg [13:0] celloutsig_0_54z;
  wire [2:0] celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire celloutsig_0_59z;
  wire [5:0] celloutsig_0_5z;
  wire [3:0] celloutsig_0_62z;
  wire celloutsig_0_63z;
  wire [20:0] celloutsig_0_65z;
  wire [4:0] celloutsig_0_66z;
  wire [13:0] celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire [10:0] celloutsig_0_71z;
  wire [3:0] celloutsig_0_77z;
  wire [6:0] celloutsig_0_7z;
  wire celloutsig_0_89z;
  wire celloutsig_0_8z;
  wire celloutsig_0_95z;
  wire [9:0] celloutsig_0_96z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [17:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  reg [3:0] celloutsig_1_5z;
  reg [12:0] celloutsig_1_6z;
  wire [3:0] celloutsig_1_7z;
  wire [7:0] celloutsig_1_8z;
  wire [4:0] celloutsig_1_9z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_56z = ~(in_data[4] | celloutsig_0_23z[2]);
  assign celloutsig_0_6z = ~(celloutsig_0_4z | celloutsig_0_4z);
  assign celloutsig_0_63z = ~(celloutsig_0_10z | celloutsig_0_15z);
  assign celloutsig_0_89z = ~(celloutsig_0_42z | celloutsig_0_66z[0]);
  assign celloutsig_1_0z = ~(in_data[147] | in_data[136]);
  assign celloutsig_1_3z = ~(celloutsig_1_1z | celloutsig_1_0z);
  assign celloutsig_0_12z = ~(celloutsig_0_9z | in_data[10]);
  assign celloutsig_1_19z = ~(celloutsig_1_1z | celloutsig_1_6z[7]);
  assign celloutsig_0_17z = ~(celloutsig_0_14z[24] | celloutsig_0_1z[12]);
  assign celloutsig_0_24z = ~(celloutsig_0_9z | celloutsig_0_18z);
  assign celloutsig_0_42z = ! celloutsig_0_40z[7:2];
  assign celloutsig_0_4z = ! celloutsig_0_3z[24:21];
  assign celloutsig_0_70z = ! { celloutsig_0_49z[5:3], celloutsig_0_53z, celloutsig_0_32z };
  assign celloutsig_0_10z = ! { celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_8z };
  assign celloutsig_0_15z = ! celloutsig_0_11z[9:7];
  assign celloutsig_0_18z = ! { celloutsig_0_11z[5:2], celloutsig_0_4z, celloutsig_0_2z };
  assign celloutsig_0_21z = ! celloutsig_0_7z[4:0];
  assign celloutsig_0_2z = ! celloutsig_0_1z[8:5];
  assign celloutsig_0_45z = celloutsig_0_11z[13:2] % { 1'h1, celloutsig_0_14z[13:3] };
  assign celloutsig_0_49z = celloutsig_0_3z[33:23] % { 1'h1, celloutsig_0_35z[9:0] };
  assign celloutsig_0_96z = { celloutsig_0_66z, celloutsig_0_25z, celloutsig_0_13z, celloutsig_0_89z } % { 1'h1, celloutsig_0_71z[8:5], celloutsig_0_70z, celloutsig_0_77z };
  assign celloutsig_1_9z = in_data[179:175] % { 1'h1, celloutsig_1_6z[4], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_11z = { celloutsig_1_9z, celloutsig_1_8z[7:5], 4'hf, celloutsig_1_8z[0], celloutsig_1_1z, celloutsig_1_5z } % { 1'h1, celloutsig_1_9z[3:0], celloutsig_1_2z, celloutsig_1_8z[7:5], 4'hf, celloutsig_1_8z[0], celloutsig_1_7z[3:1], celloutsig_1_7z[1] };
  assign celloutsig_0_33z = celloutsig_0_0z % { 1'h1, celloutsig_0_0z[2:1], in_data[0] };
  assign celloutsig_0_3z = { in_data[33:20], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z[12:4], 4'h0, celloutsig_0_0z, celloutsig_0_0z } % { 1'h1, in_data[39:6], celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_35z = in_data[37:27] % { 1'h1, celloutsig_0_11z[4:0], celloutsig_0_17z, celloutsig_0_16z };
  assign celloutsig_0_37z = { celloutsig_0_5z[4:0], celloutsig_0_26z, celloutsig_0_15z } % { 1'h1, celloutsig_0_36z[15:6] };
  assign celloutsig_0_55z = celloutsig_0_1z[8:6] * celloutsig_0_38z[3:1];
  assign celloutsig_0_69z = { celloutsig_0_65z[18:10], celloutsig_0_39z } * { celloutsig_0_56z, celloutsig_0_6z, celloutsig_0_59z, celloutsig_0_8z, celloutsig_0_16z, celloutsig_0_20z, celloutsig_0_12z, celloutsig_0_55z, celloutsig_0_30z };
  assign celloutsig_0_22z = { in_data[50], celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_8z, celloutsig_0_6z } * { celloutsig_0_11z[14:9], celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_13z };
  assign celloutsig_0_0z = in_data[91:88] | in_data[22:19];
  assign celloutsig_0_39z = celloutsig_0_36z[9:5] | celloutsig_0_11z[6:2];
  assign celloutsig_0_46z = { celloutsig_0_14z[21:10], celloutsig_0_6z } | { celloutsig_0_36z[13:4], celloutsig_0_25z, celloutsig_0_44z, celloutsig_0_17z };
  assign celloutsig_0_5z = { celloutsig_0_0z[3], celloutsig_0_2z, celloutsig_0_0z } | { celloutsig_0_0z[1], celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_62z = { celloutsig_0_4z, celloutsig_0_24z, celloutsig_0_8z, celloutsig_0_21z } | celloutsig_0_5z[3:0];
  assign celloutsig_0_71z = { celloutsig_0_37z[8:1], celloutsig_0_27z, celloutsig_0_59z, celloutsig_0_10z } | { celloutsig_0_69z[9:4], celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_70z, celloutsig_0_9z, celloutsig_0_17z };
  assign celloutsig_0_7z = { celloutsig_0_1z[10:5], celloutsig_0_2z } | { in_data[21:16], celloutsig_0_4z };
  assign celloutsig_0_16z = celloutsig_0_11z[8:5] | celloutsig_0_7z[3:0];
  assign celloutsig_0_23z = { celloutsig_0_21z, celloutsig_0_12z, celloutsig_0_8z } | { in_data[20:19], celloutsig_0_18z };
  assign celloutsig_0_53z = | celloutsig_0_46z[6:4];
  assign celloutsig_0_59z = | celloutsig_0_45z[11:4];
  assign celloutsig_0_8z = | { celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_2z };
  assign celloutsig_1_1z = | { celloutsig_1_0z, in_data[158:153] };
  assign celloutsig_1_12z = | { celloutsig_1_8z[7:5], celloutsig_1_0z, in_data[158:153] };
  assign celloutsig_0_25z = | celloutsig_0_19z[6:1];
  assign celloutsig_0_27z = | celloutsig_0_5z[3:0];
  assign celloutsig_0_31z = | { celloutsig_0_16z, celloutsig_0_7z[4] };
  assign celloutsig_0_32z = | celloutsig_0_19z[4:1];
  assign celloutsig_0_44z = ~^ { celloutsig_0_15z, celloutsig_0_30z, celloutsig_0_13z, celloutsig_0_6z };
  assign celloutsig_0_9z = ~^ { in_data[82:61], celloutsig_0_2z };
  assign celloutsig_0_95z = ~^ { celloutsig_0_20z, celloutsig_0_31z, celloutsig_0_4z };
  assign celloutsig_1_2z = ~^ in_data[162:160];
  assign celloutsig_1_4z = ~^ { in_data[150:146], celloutsig_1_2z };
  assign celloutsig_1_18z = ~^ { celloutsig_1_11z[13], celloutsig_1_12z, celloutsig_1_12z, celloutsig_1_4z };
  assign celloutsig_0_20z = ~^ { celloutsig_0_18z, celloutsig_0_7z };
  assign celloutsig_0_28z = ~^ { in_data[30:8], celloutsig_0_26z };
  assign celloutsig_0_30z = ~^ { celloutsig_0_0z[3:1], celloutsig_0_0z, celloutsig_0_28z, celloutsig_0_10z };
  assign celloutsig_0_38z = celloutsig_0_19z[6:3] ~^ in_data[21:18];
  assign celloutsig_0_40z = celloutsig_0_14z[21:14] ~^ { celloutsig_0_39z, celloutsig_0_15z, celloutsig_0_21z, celloutsig_0_2z };
  assign celloutsig_0_65z = { celloutsig_0_38z[3:2], celloutsig_0_29z, celloutsig_0_28z, celloutsig_0_0z, celloutsig_0_29z } ~^ { celloutsig_0_13z[0], celloutsig_0_20z, celloutsig_0_54z, celloutsig_0_10z, celloutsig_0_62z };
  assign celloutsig_0_14z = { celloutsig_0_3z[19:7], celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_13z } ~^ { celloutsig_0_3z[4:3], celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_11z };
  assign celloutsig_0_36z = { in_data[52:38], celloutsig_0_33z } ~^ { celloutsig_0_25z, celloutsig_0_26z, celloutsig_0_21z, celloutsig_0_24z, celloutsig_0_35z };
  assign celloutsig_0_66z = { celloutsig_0_23z, celloutsig_0_63z, celloutsig_0_63z } ^ celloutsig_0_49z[4:0];
  assign celloutsig_0_77z = { celloutsig_0_19z[5:3], celloutsig_0_44z } ^ celloutsig_0_43z[16:13];
  assign celloutsig_0_13z = celloutsig_0_3z[38:36] ^ celloutsig_0_0z[3:1];
  assign celloutsig_0_29z = { celloutsig_0_7z[5], celloutsig_0_24z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_17z, celloutsig_0_18z, celloutsig_0_4z } ^ in_data[10:4];
  always_latch
    if (!clkin_data[96]) celloutsig_0_43z = 26'h0000000;
    else if (celloutsig_1_19z) celloutsig_0_43z = { in_data[92:90], celloutsig_0_40z, celloutsig_0_38z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_23z, celloutsig_0_25z, celloutsig_0_20z, celloutsig_0_18z };
  always_latch
    if (clkin_data[96]) celloutsig_0_54z = 14'h0000;
    else if (!clkin_data[0]) celloutsig_0_54z = celloutsig_0_43z[16:3];
  always_latch
    if (clkin_data[160]) celloutsig_1_5z = 4'h0;
    else if (!clkin_data[32]) celloutsig_1_5z = { in_data[134:133], celloutsig_1_0z, celloutsig_1_3z };
  always_latch
    if (clkin_data[160]) celloutsig_1_6z = 13'h0000;
    else if (clkin_data[32]) celloutsig_1_6z = { in_data[151:149], celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_19z = 7'h00;
    else if (clkin_data[0]) celloutsig_0_19z = { celloutsig_0_11z[1:0], celloutsig_0_16z, celloutsig_0_2z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_26z = 5'h00;
    else if (!clkin_data[0]) celloutsig_0_26z = { celloutsig_0_22z[5:3], celloutsig_0_20z, celloutsig_0_4z };
  assign celloutsig_0_11z[2] = ~ celloutsig_0_0z[0];
  assign celloutsig_0_11z[3] = ~ celloutsig_0_0z[1];
  assign celloutsig_0_11z[0] = ~ celloutsig_0_9z;
  assign celloutsig_0_11z[1] = ~ celloutsig_0_10z;
  assign celloutsig_0_1z[12:4] = in_data[66:58] ^ in_data[85:77];
  assign { celloutsig_1_7z[1], celloutsig_1_7z[3:2] } = { celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_0z } ~^ { celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_3z };
  assign { celloutsig_1_8z[0], celloutsig_1_8z[5], celloutsig_1_8z[7:6] } = { celloutsig_1_2z, celloutsig_1_0z, in_data[113:112] } ~^ { celloutsig_1_1z, celloutsig_1_6z[0], celloutsig_1_6z[2:1] };
  assign { celloutsig_0_11z[11], celloutsig_0_11z[15], celloutsig_0_11z[10], celloutsig_0_11z[14], celloutsig_0_11z[9], celloutsig_0_11z[13], celloutsig_0_11z[8:6], celloutsig_0_11z[12], celloutsig_0_11z[5:4] } = { celloutsig_0_5z[5], celloutsig_0_5z[5:4], celloutsig_0_5z[4:3], celloutsig_0_5z[3:0], celloutsig_0_2z, celloutsig_0_0z[3:2] } ~^ { celloutsig_0_1z[11], in_data[76], celloutsig_0_1z[10], in_data[75], celloutsig_0_1z[9], in_data[74], celloutsig_0_1z[8:6], celloutsig_0_1z[12], celloutsig_0_1z[5:4] };
  assign celloutsig_0_1z[3:0] = 4'h0;
  assign celloutsig_1_7z[0] = celloutsig_1_7z[1];
  assign celloutsig_1_8z[4:1] = 4'hf;
  assign { out_data[128], out_data[96], out_data[32], out_data[9:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_95z, celloutsig_0_96z };
endmodule
