/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [11:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [3:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [7:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [10:0] celloutsig_0_19z;
  wire [6:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [4:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [3:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [2:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [3:0] celloutsig_0_32z;
  wire [4:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [4:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [4:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [7:0] celloutsig_0_3z;
  wire [11:0] celloutsig_0_40z;
  wire [15:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  reg [5:0] celloutsig_0_45z;
  wire celloutsig_0_49z;
  wire [13:0] celloutsig_0_50z;
  wire [5:0] celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_54z;
  wire [15:0] celloutsig_0_55z;
  wire [2:0] celloutsig_0_57z;
  wire [4:0] celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire [12:0] celloutsig_0_64z;
  wire celloutsig_0_68z;
  wire celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire [6:0] celloutsig_0_75z;
  wire celloutsig_0_76z;
  wire celloutsig_0_7z;
  wire [11:0] celloutsig_0_8z;
  wire [10:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [7:0] celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire [10:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [9:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [9:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_49z = celloutsig_0_19z[2] ? celloutsig_0_34z : celloutsig_0_29z[2];
  assign celloutsig_0_70z = celloutsig_0_39z ? celloutsig_0_43z[10] : celloutsig_0_55z[12];
  assign celloutsig_1_3z = celloutsig_1_1z[7] ? celloutsig_1_2z : celloutsig_1_1z[6];
  assign celloutsig_0_18z = in_data[69] ? celloutsig_0_0z[6] : celloutsig_0_44z;
  assign celloutsig_0_26z = celloutsig_0_44z ? celloutsig_0_18z : celloutsig_0_14z[1];
  assign celloutsig_0_31z = celloutsig_0_18z ? celloutsig_0_8z[4] : celloutsig_0_14z[3];
  assign celloutsig_0_39z = celloutsig_0_2z ^ celloutsig_0_9z[4];
  assign celloutsig_0_52z = celloutsig_0_0z[5] ^ celloutsig_0_10z;
  assign celloutsig_0_24z = celloutsig_0_23z ^ celloutsig_0_20z[5];
  assign celloutsig_0_33z = { celloutsig_0_29z[3:2], celloutsig_0_22z, celloutsig_0_2z, celloutsig_0_24z } / { 1'h1, celloutsig_0_27z[3:1], celloutsig_0_16z };
  assign celloutsig_0_50z = celloutsig_0_43z[15:2] / { 1'h1, celloutsig_0_40z[5:1], celloutsig_0_3z };
  assign celloutsig_1_10z = celloutsig_1_1z[8:1] / { 1'h1, in_data[141], celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_0z };
  assign celloutsig_0_14z = celloutsig_0_8z[6:3] / { 1'h1, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_5z };
  assign celloutsig_0_19z = celloutsig_0_9z / { 1'h1, in_data[40:32], celloutsig_0_5z };
  assign celloutsig_0_20z = { in_data[93:88], celloutsig_0_18z } / { 1'h1, celloutsig_0_19z[7:5], celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_12z };
  assign celloutsig_0_27z = { celloutsig_0_0z[11:8], celloutsig_0_2z } / { 1'h1, celloutsig_0_17z[6:5], celloutsig_0_22z, celloutsig_0_16z };
  assign celloutsig_0_36z = in_data[91:84] > { celloutsig_0_14z[0], celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_16z, celloutsig_0_31z, celloutsig_0_31z, celloutsig_0_34z, celloutsig_0_44z };
  assign celloutsig_0_37z = celloutsig_0_19z[8:4] > celloutsig_0_27z;
  assign celloutsig_0_5z = { in_data[45:26], celloutsig_0_2z, celloutsig_0_44z } > { in_data[42:31], celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_2z };
  assign celloutsig_1_7z = { celloutsig_1_1z[8:4], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_0z } > { in_data[111:105], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_1_17z = { celloutsig_1_15z, celloutsig_1_6z, celloutsig_1_15z } > { celloutsig_1_2z, celloutsig_1_12z, celloutsig_1_7z };
  assign celloutsig_0_10z = celloutsig_0_8z[8:6] > { celloutsig_0_44z, celloutsig_0_5z, celloutsig_0_2z };
  assign celloutsig_0_12z = { celloutsig_0_8z[2:0], celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_5z } > { celloutsig_0_44z, celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_5z };
  assign celloutsig_0_13z = celloutsig_0_8z[7:5] > { celloutsig_0_8z[7], celloutsig_0_44z, celloutsig_0_11z };
  assign celloutsig_0_21z = { celloutsig_0_17z[3], celloutsig_0_20z } > in_data[79:72];
  assign celloutsig_0_28z = { celloutsig_0_9z[9:3], celloutsig_0_15z, celloutsig_0_18z } > { celloutsig_0_21z, celloutsig_0_3z };
  assign celloutsig_1_9z = celloutsig_1_1z[4:1] && celloutsig_1_1z[6:3];
  assign celloutsig_1_15z = { celloutsig_1_6z, celloutsig_1_8z } && in_data[187:177];
  assign celloutsig_1_19z = { celloutsig_1_10z[4:0], celloutsig_1_9z, celloutsig_1_13z, celloutsig_1_15z } && { celloutsig_1_8z[9:5], celloutsig_1_13z, celloutsig_1_6z, celloutsig_1_4z };
  assign celloutsig_0_25z = { celloutsig_0_8z[11:5], celloutsig_0_23z } && { celloutsig_0_17z[6:0], celloutsig_0_7z };
  assign celloutsig_0_34z = { celloutsig_0_9z[5:0], celloutsig_0_15z, celloutsig_0_29z, celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_23z, celloutsig_0_16z } < { celloutsig_0_32z[3], celloutsig_0_3z, celloutsig_0_20z, celloutsig_0_24z, celloutsig_0_18z };
  assign celloutsig_0_44z = { celloutsig_0_3z[7:2], celloutsig_0_15z } < { celloutsig_0_0z[11:6], celloutsig_0_15z };
  assign celloutsig_0_68z = celloutsig_0_33z[3:0] < { celloutsig_0_57z[2:1], celloutsig_0_54z, celloutsig_0_36z };
  assign celloutsig_1_12z = { in_data[137:127], celloutsig_1_3z } < { celloutsig_1_10z[4:3], celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_0z };
  assign celloutsig_1_13z = { celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_6z } < celloutsig_1_8z[9:3];
  assign celloutsig_0_15z = in_data[39:27] < in_data[90:78];
  assign celloutsig_0_11z = { celloutsig_0_6z, celloutsig_0_0z } < { celloutsig_0_9z[7:6], celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_44z };
  assign celloutsig_0_2z = { celloutsig_0_0z[2:0], celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_15z } < celloutsig_0_0z[8:2];
  assign celloutsig_0_23z = celloutsig_0_19z[9:0] < { celloutsig_0_14z[3:2], celloutsig_0_7z, celloutsig_0_20z };
  assign celloutsig_0_76z = { celloutsig_0_0z[6:4], celloutsig_0_64z } != { celloutsig_0_51z, celloutsig_0_22z, celloutsig_0_69z, celloutsig_0_70z, celloutsig_0_58z, celloutsig_0_18z, celloutsig_0_69z };
  assign celloutsig_1_0z = in_data[130:128] != in_data[131:129];
  assign celloutsig_1_2z = in_data[122:112] != in_data[162:152];
  assign celloutsig_0_16z = celloutsig_0_3z[7:3] != celloutsig_0_0z[8:4];
  assign celloutsig_0_22z = { celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_6z } != { celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_16z, celloutsig_0_15z, celloutsig_0_44z, celloutsig_0_21z };
  assign celloutsig_0_0z = - in_data[30:19];
  assign celloutsig_0_35z = - { celloutsig_0_9z[8:5], celloutsig_0_10z };
  assign celloutsig_0_40z = - celloutsig_0_8z;
  assign celloutsig_0_55z = - { celloutsig_0_30z, celloutsig_0_30z, celloutsig_0_12z, celloutsig_0_38z, celloutsig_0_49z, celloutsig_0_12z, celloutsig_0_37z, celloutsig_0_21z };
  assign celloutsig_0_64z = - { celloutsig_0_55z[11:1], celloutsig_0_6z, celloutsig_0_36z };
  assign celloutsig_0_75z = - { celloutsig_0_45z[4:0], celloutsig_0_68z, celloutsig_0_68z };
  assign celloutsig_0_8z = - celloutsig_0_0z;
  assign celloutsig_0_17z = - { celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_44z, celloutsig_0_5z };
  assign celloutsig_0_29z = - celloutsig_0_27z[4:1];
  assign celloutsig_0_38z = celloutsig_0_9z[4:0] <<< { celloutsig_0_35z[2], celloutsig_0_21z, celloutsig_0_5z, celloutsig_0_23z, celloutsig_0_13z };
  assign celloutsig_0_57z = { celloutsig_0_26z, celloutsig_0_49z, celloutsig_0_7z } <<< { celloutsig_0_38z[2], celloutsig_0_16z, celloutsig_0_13z };
  assign celloutsig_1_8z = { celloutsig_1_1z[9:3], celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_6z } <<< { celloutsig_1_1z[9:1], celloutsig_1_7z };
  assign celloutsig_1_18z = { celloutsig_1_8z[8:0], celloutsig_1_17z, celloutsig_1_17z } <<< { celloutsig_1_8z, celloutsig_1_13z };
  assign celloutsig_0_3z = celloutsig_0_0z[7:0] <<< celloutsig_0_0z[9:2];
  assign celloutsig_0_30z = { celloutsig_0_8z[9], celloutsig_0_10z, celloutsig_0_10z } <<< { celloutsig_0_26z, celloutsig_0_5z, celloutsig_0_26z };
  assign celloutsig_0_32z = celloutsig_0_14z ~^ { celloutsig_0_27z[1:0], celloutsig_0_25z, celloutsig_0_6z };
  assign celloutsig_0_43z = { celloutsig_0_38z, celloutsig_0_9z } ~^ { celloutsig_0_19z[3:0], celloutsig_0_8z };
  assign celloutsig_0_51z = celloutsig_0_19z[10:5] ~^ { celloutsig_0_0z[8:5], celloutsig_0_16z, celloutsig_0_15z };
  assign celloutsig_0_58z = { celloutsig_0_20z[3], celloutsig_0_23z, celloutsig_0_49z, celloutsig_0_7z, celloutsig_0_15z } ~^ { celloutsig_0_29z, celloutsig_0_52z };
  assign celloutsig_1_1z = in_data[132:123] ~^ { in_data[154:147], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_9z = { celloutsig_0_0z[8:0], celloutsig_0_2z, celloutsig_0_2z } ~^ { celloutsig_0_8z[2], celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_3z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_45z = 6'h00;
    else if (celloutsig_1_18z[0]) celloutsig_0_45z = celloutsig_0_17z[7:2];
  assign celloutsig_0_54z = ~((celloutsig_0_52z & celloutsig_0_28z) | (celloutsig_0_22z & celloutsig_0_38z[0]));
  assign celloutsig_0_6z = ~((celloutsig_0_3z[4] & celloutsig_0_15z) | (celloutsig_0_3z[3] & celloutsig_0_2z));
  assign celloutsig_0_69z = ~((celloutsig_0_10z & celloutsig_0_68z) | (celloutsig_0_29z[1] & celloutsig_0_50z[2]));
  assign celloutsig_0_7z = ~((celloutsig_0_5z & celloutsig_0_15z) | (in_data[64] & celloutsig_0_3z[6]));
  assign celloutsig_1_4z = ~((celloutsig_1_2z & celloutsig_1_0z) | (celloutsig_1_0z & celloutsig_1_1z[5]));
  assign celloutsig_1_6z = ~((celloutsig_1_3z & celloutsig_1_0z) | (celloutsig_1_0z & in_data[135]));
  assign { out_data[138:128], out_data[96], out_data[38:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_75z, celloutsig_0_76z };
endmodule
