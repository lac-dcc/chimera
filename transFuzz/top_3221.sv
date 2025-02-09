/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [19:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  reg [4:0] celloutsig_0_15z;
  wire [7:0] celloutsig_0_16z;
  wire [10:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [6:0] celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire [3:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [19:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [13:0] celloutsig_0_25z;
  wire [20:0] celloutsig_0_26z;
  wire [3:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [7:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [17:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [9:0] celloutsig_0_33z;
  wire [14:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [15:0] celloutsig_0_3z;
  reg [2:0] celloutsig_0_41z;
  wire [3:0] celloutsig_0_43z;
  wire [11:0] celloutsig_0_44z;
  wire celloutsig_0_45z;
  reg [4:0] celloutsig_0_47z;
  wire [5:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [7:0] celloutsig_0_61z;
  wire celloutsig_0_63z;
  wire [6:0] celloutsig_0_64z;
  wire [4:0] celloutsig_0_65z;
  wire celloutsig_0_66z;
  wire celloutsig_0_67z;
  wire celloutsig_0_68z;
  wire celloutsig_0_6z;
  wire celloutsig_0_75z;
  wire [3:0] celloutsig_0_76z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [4:0] celloutsig_1_13z;
  wire [24:0] celloutsig_1_18z;
  reg [2:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [11:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [11:0] celloutsig_1_8z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_58z = celloutsig_0_39z ? celloutsig_0_36z : celloutsig_0_20z[0];
  assign celloutsig_0_66z = celloutsig_0_12z[4] ? celloutsig_0_60z : celloutsig_0_33z[6];
  assign celloutsig_0_0z = ~(in_data[1] & in_data[76]);
  assign celloutsig_1_6z = ~(celloutsig_1_1z & celloutsig_1_1z);
  assign celloutsig_1_1z = ~in_data[147];
  assign celloutsig_0_14z = ~celloutsig_0_7z;
  assign celloutsig_0_52z = celloutsig_0_1z[2] | celloutsig_0_13z;
  assign celloutsig_0_57z = celloutsig_0_49z | celloutsig_0_0z;
  assign celloutsig_0_53z = celloutsig_0_8z ^ celloutsig_0_29z[2];
  assign celloutsig_0_60z = celloutsig_0_0z ^ celloutsig_0_57z;
  assign celloutsig_0_9z = in_data[48] ^ celloutsig_0_8z;
  assign celloutsig_1_10z = celloutsig_1_0z ^ celloutsig_1_2z;
  assign celloutsig_0_2z = celloutsig_0_0z ^ in_data[0];
  assign celloutsig_0_37z = ~(celloutsig_0_19z[5] ^ celloutsig_0_15z[0]);
  assign celloutsig_0_45z = ~(celloutsig_0_22z ^ celloutsig_0_3z[3]);
  assign celloutsig_0_54z = ~(celloutsig_0_5z ^ celloutsig_0_16z[2]);
  assign celloutsig_0_11z = ~(celloutsig_0_8z ^ celloutsig_0_6z);
  assign celloutsig_0_16z = { celloutsig_0_12z[19:15], celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_5z } + { in_data[54:51], celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_10z };
  assign celloutsig_0_23z = { celloutsig_0_12z[15:2], celloutsig_0_20z } & { celloutsig_0_17z[2:1], celloutsig_0_17z, celloutsig_0_19z };
  assign celloutsig_0_25z = { celloutsig_0_23z[14:6], celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_24z } & { celloutsig_0_17z[8:4], celloutsig_0_9z, celloutsig_0_16z };
  assign celloutsig_1_18z = in_data[133:109] / { 1'h1, celloutsig_1_13z, celloutsig_1_13z, celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_5z };
  assign celloutsig_0_8z = { in_data[91:80], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_4z } == { celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_7z };
  assign celloutsig_0_24z = { celloutsig_0_12z[0], celloutsig_0_8z, celloutsig_0_11z } == { celloutsig_0_23z[17:16], celloutsig_0_14z };
  assign celloutsig_0_36z = celloutsig_0_26z[12:3] === celloutsig_0_31z[10:1];
  assign celloutsig_0_68z = celloutsig_0_65z[4:1] === { celloutsig_0_1z, celloutsig_0_51z };
  assign celloutsig_1_3z = { in_data[116:110], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_0z } === in_data[172:162];
  assign celloutsig_0_49z = celloutsig_0_35z[13:8] <= { celloutsig_0_29z[6:2], celloutsig_0_14z };
  assign celloutsig_1_0z = in_data[108:106] <= in_data[172:170];
  assign celloutsig_1_5z = in_data[163:158] <= { celloutsig_1_4z[9:6], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_10z = { celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_9z } <= in_data[68:65];
  assign celloutsig_0_32z = { celloutsig_0_23z[17:10], celloutsig_0_28z } && celloutsig_0_12z[17:9];
  assign celloutsig_0_13z = ! { celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_11z };
  assign celloutsig_1_2z = celloutsig_1_0z & ~(celloutsig_1_0z);
  assign celloutsig_0_30z = celloutsig_0_24z & ~(celloutsig_0_4z);
  assign celloutsig_0_35z = { celloutsig_0_15z[0], celloutsig_0_25z } % { 1'h1, celloutsig_0_12z[1], celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_28z, celloutsig_0_20z, celloutsig_0_24z };
  assign celloutsig_1_4z = { in_data[155:146], celloutsig_1_3z, celloutsig_1_2z } % { 1'h1, in_data[122:115], celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_0_1z = { in_data[63], celloutsig_0_0z, celloutsig_0_0z } % { 1'h1, in_data[48:47] };
  assign celloutsig_0_26z = in_data[65:45] % { 1'h1, celloutsig_0_12z };
  assign celloutsig_0_44z = { celloutsig_0_2z, celloutsig_0_33z, celloutsig_0_5z } % { 1'h1, celloutsig_0_26z[7:6], celloutsig_0_32z, celloutsig_0_16z };
  assign celloutsig_0_64z = celloutsig_0_44z[9:3] % { 1'h1, celloutsig_0_16z[0], celloutsig_0_63z, celloutsig_0_41z, celloutsig_0_51z };
  assign celloutsig_0_33z = { celloutsig_0_25z[7], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_27z, celloutsig_0_32z } % { 1'h1, celloutsig_0_8z, celloutsig_0_21z, celloutsig_0_1z, celloutsig_0_22z };
  assign celloutsig_0_3z = { in_data[74:64], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z } * in_data[58:43];
  assign celloutsig_0_76z = celloutsig_0_64z[3:0] * { celloutsig_0_12z[14], celloutsig_0_52z, celloutsig_0_53z, celloutsig_0_58z };
  assign celloutsig_0_61z = - { celloutsig_0_33z[8:2], celloutsig_0_14z };
  assign celloutsig_0_12z = - { celloutsig_0_3z[11:0], celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_10z };
  assign celloutsig_0_19z = - celloutsig_0_17z[8:2];
  assign celloutsig_0_39z = { celloutsig_0_23z[11:4], celloutsig_0_0z, celloutsig_0_32z } !== celloutsig_0_33z;
  assign celloutsig_0_5z = { celloutsig_0_3z[7:2], celloutsig_0_0z } !== { celloutsig_0_3z[9:4], celloutsig_0_4z };
  assign celloutsig_0_51z = { celloutsig_0_3z[6:3], celloutsig_0_43z, celloutsig_0_47z } !== celloutsig_0_3z[15:3];
  assign celloutsig_0_59z = { celloutsig_0_1z, celloutsig_0_58z, celloutsig_0_12z } !== { celloutsig_0_23z[19:2], celloutsig_0_57z, celloutsig_0_54z, celloutsig_0_39z, celloutsig_0_1z };
  assign celloutsig_0_67z = { celloutsig_0_47z[3], celloutsig_0_27z, celloutsig_0_61z, celloutsig_0_1z } !== { celloutsig_0_26z[20:7], celloutsig_0_51z, celloutsig_0_59z };
  assign celloutsig_0_75z = { celloutsig_0_43z[1], celloutsig_0_48z, celloutsig_0_66z, celloutsig_0_39z, celloutsig_0_68z, celloutsig_0_1z, celloutsig_0_67z, celloutsig_0_51z, celloutsig_0_8z, celloutsig_0_20z, celloutsig_0_0z, celloutsig_0_52z, celloutsig_0_59z } !== { celloutsig_0_35z[10:2], celloutsig_0_35z, celloutsig_0_11z };
  assign celloutsig_0_6z = & { celloutsig_0_5z, in_data[57:33] };
  assign celloutsig_0_63z = & { celloutsig_0_58z, celloutsig_0_51z, celloutsig_0_49z, celloutsig_0_5z, in_data[57:33] };
  assign celloutsig_0_22z = & { celloutsig_0_20z, celloutsig_0_5z, celloutsig_0_2z, in_data[57:33] };
  assign celloutsig_0_28z = & { celloutsig_0_25z[12:10], celloutsig_0_18z };
  assign celloutsig_0_4z = ^ { celloutsig_0_3z[13:5], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_7z = ^ in_data[19:12];
  assign celloutsig_0_48z = { celloutsig_0_44z[2], celloutsig_0_27z, celloutsig_0_37z } >> celloutsig_0_31z[14:9];
  assign celloutsig_0_65z = { celloutsig_0_25z[10:8], celloutsig_0_51z, celloutsig_0_8z } >> celloutsig_0_16z[5:1];
  assign celloutsig_0_27z = celloutsig_0_20z[4:1] <<< { celloutsig_0_1z[1:0], celloutsig_0_7z, celloutsig_0_6z };
  assign celloutsig_0_31z = { celloutsig_0_23z[16:7], celloutsig_0_16z } <<< { celloutsig_0_20z[5:2], celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_30z, celloutsig_0_28z, celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_15z };
  assign celloutsig_1_8z = { celloutsig_1_4z[11:2], celloutsig_1_6z, celloutsig_1_7z } - celloutsig_1_4z;
  assign celloutsig_1_13z = celloutsig_1_8z[5:1] - { in_data[112], celloutsig_1_5z, celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_1z };
  assign celloutsig_0_17z = celloutsig_0_3z[14:4] - { celloutsig_0_3z[2:0], celloutsig_0_16z };
  assign celloutsig_0_21z = in_data[52:49] - { celloutsig_0_19z[1:0], celloutsig_0_14z, celloutsig_0_4z };
  assign celloutsig_0_29z = { in_data[31:25], celloutsig_0_24z } - { celloutsig_0_25z[10:5], celloutsig_0_18z, celloutsig_0_11z };
  assign celloutsig_0_43z = celloutsig_0_16z[5:2] ~^ { celloutsig_0_29z[3:2], celloutsig_0_28z, celloutsig_0_4z };
  assign celloutsig_0_20z = { celloutsig_0_17z[6:2], celloutsig_0_13z } ~^ { celloutsig_0_8z, celloutsig_0_15z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_41z = 3'h0;
    else if (celloutsig_1_18z[0]) celloutsig_0_41z = { celloutsig_0_33z[1:0], celloutsig_0_0z };
  always_latch
    if (clkin_data[64]) celloutsig_0_47z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_47z = { celloutsig_0_25z[2:1], celloutsig_0_39z, celloutsig_0_38z, celloutsig_0_45z };
  always_latch
    if (!clkin_data[160]) celloutsig_1_19z = 3'h0;
    else if (clkin_data[32]) celloutsig_1_19z = celloutsig_1_13z[2:0];
  always_latch
    if (!clkin_data[96]) celloutsig_0_15z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_15z = { celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_9z };
  assign celloutsig_0_38z = ~((celloutsig_0_29z[7] & celloutsig_0_14z) | (celloutsig_0_14z & celloutsig_0_22z));
  assign celloutsig_1_7z = ~((celloutsig_1_1z & celloutsig_1_0z) | (celloutsig_1_1z & celloutsig_1_5z));
  assign celloutsig_0_18z = ~((celloutsig_0_9z & celloutsig_0_0z) | (celloutsig_0_10z & celloutsig_0_10z));
  assign { out_data[152:128], out_data[98:96], out_data[32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_75z, celloutsig_0_76z };
endmodule
