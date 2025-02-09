/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [10:0] celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire [8:0] celloutsig_0_11z;
  wire [4:0] celloutsig_0_12z;
  wire [12:0] celloutsig_0_13z;
  wire [7:0] celloutsig_0_14z;
  wire [6:0] celloutsig_0_15z;
  wire [11:0] celloutsig_0_16z;
  reg [3:0] celloutsig_0_17z;
  wire [2:0] celloutsig_0_18z;
  wire [4:0] celloutsig_0_1z;
  wire [11:0] celloutsig_0_20z;
  wire [16:0] celloutsig_0_21z;
  wire [15:0] celloutsig_0_24z;
  wire [10:0] celloutsig_0_25z;
  wire [2:0] celloutsig_0_28z;
  wire [3:0] celloutsig_0_29z;
  wire [5:0] celloutsig_0_2z;
  wire [3:0] celloutsig_0_31z;
  wire [11:0] celloutsig_0_32z;
  wire [6:0] celloutsig_0_33z;
  wire [4:0] celloutsig_0_35z;
  wire [21:0] celloutsig_0_38z;
  wire [7:0] celloutsig_0_39z;
  wire [24:0] celloutsig_0_3z;
  wire [19:0] celloutsig_0_43z;
  wire [3:0] celloutsig_0_49z;
  wire [5:0] celloutsig_0_4z;
  wire [26:0] celloutsig_0_50z;
  wire [2:0] celloutsig_0_5z;
  wire [4:0] celloutsig_0_61z;
  wire [18:0] celloutsig_0_65z;
  wire [3:0] celloutsig_0_66z;
  wire [27:0] celloutsig_0_6z;
  wire [6:0] celloutsig_0_7z;
  wire [28:0] celloutsig_0_8z;
  wire [7:0] celloutsig_0_9z;
  wire [12:0] celloutsig_1_0z;
  wire [10:0] celloutsig_1_11z;
  wire [14:0] celloutsig_1_12z;
  reg [4:0] celloutsig_1_13z;
  wire [39:0] celloutsig_1_15z;
  wire [13:0] celloutsig_1_18z;
  wire [19:0] celloutsig_1_19z;
  wire [6:0] celloutsig_1_1z;
  reg [2:0] celloutsig_1_2z;
  wire [14:0] celloutsig_1_3z;
  wire [9:0] celloutsig_1_4z;
  wire [4:0] celloutsig_1_5z;
  wire [8:0] celloutsig_1_6z;
  wire [3:0] celloutsig_1_7z;
  wire [2:0] celloutsig_1_8z;
  wire [8:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_33z = { celloutsig_0_6z[10:7], celloutsig_0_18z } | { celloutsig_0_21z[13:11], celloutsig_0_31z };
  assign celloutsig_0_35z = { celloutsig_0_32z[3:2], celloutsig_0_28z } | celloutsig_0_11z[6:2];
  assign celloutsig_0_49z = in_data[49:46] | celloutsig_0_39z[7:4];
  assign celloutsig_0_5z = celloutsig_0_3z[19:17] | celloutsig_0_3z[11:9];
  assign celloutsig_0_61z = celloutsig_0_12z | celloutsig_0_15z[5:1];
  assign celloutsig_0_66z = celloutsig_0_43z[13:10] | celloutsig_0_61z[3:0];
  assign celloutsig_1_3z = { celloutsig_1_1z[3:2], celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z } | { celloutsig_1_1z[3:2], celloutsig_1_0z };
  assign celloutsig_1_4z = { celloutsig_1_0z[6:0], celloutsig_1_2z } | in_data[143:134];
  assign celloutsig_1_5z = celloutsig_1_1z[6:2] | celloutsig_1_3z[11:7];
  assign celloutsig_1_7z = celloutsig_1_3z[11:8] | celloutsig_1_3z[5:2];
  assign celloutsig_1_8z = celloutsig_1_4z[2:0] | celloutsig_1_4z[9:7];
  assign celloutsig_1_9z = in_data[189:181] | { celloutsig_1_4z[8:5], celloutsig_1_5z };
  assign celloutsig_1_12z = celloutsig_1_3z | in_data[169:155];
  assign celloutsig_1_15z = { celloutsig_1_3z[11:7], celloutsig_1_11z, celloutsig_1_9z, celloutsig_1_12z } | { celloutsig_1_6z[6:2], celloutsig_1_13z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_11z };
  assign celloutsig_1_19z = { celloutsig_1_15z[37:33], celloutsig_1_3z } | { celloutsig_1_18z[12:2], celloutsig_1_6z };
  assign celloutsig_0_11z = { celloutsig_0_9z[7:2], celloutsig_0_5z } | celloutsig_0_8z[15:7];
  assign celloutsig_0_12z = celloutsig_0_9z[5:1] | celloutsig_0_1z;
  assign celloutsig_0_1z = celloutsig_0_0z[8:4] | in_data[43:39];
  assign celloutsig_0_13z = celloutsig_0_6z[14:2] | { celloutsig_0_9z[7:3], celloutsig_0_1z, celloutsig_0_5z };
  assign celloutsig_0_18z = celloutsig_0_4z[5:3] | celloutsig_0_4z[4:2];
  assign celloutsig_0_20z = { celloutsig_0_0z[7:1], celloutsig_0_12z } | { celloutsig_0_2z[4:0], celloutsig_0_7z };
  assign celloutsig_0_28z = celloutsig_0_20z[11:9] | celloutsig_0_14z[4:2];
  assign celloutsig_0_0z = in_data[33:23] ~^ in_data[80:70];
  assign celloutsig_0_3z = { celloutsig_0_0z[10:8], celloutsig_0_0z, celloutsig_0_0z } ~^ in_data[45:21];
  assign celloutsig_0_38z = { celloutsig_0_3z[18:0], celloutsig_0_28z } ~^ { celloutsig_0_10z[1], celloutsig_0_18z, celloutsig_0_12z, celloutsig_0_13z };
  assign celloutsig_0_39z = celloutsig_0_0z[8:1] ~^ celloutsig_0_8z[20:13];
  assign celloutsig_0_4z = celloutsig_0_2z ~^ in_data[17:12];
  assign celloutsig_0_43z = celloutsig_0_38z[19:0] ~^ { in_data[51:39], celloutsig_0_31z, celloutsig_0_5z };
  assign celloutsig_0_50z = { celloutsig_0_33z[6:1], celloutsig_0_35z, celloutsig_0_49z, celloutsig_0_32z } ~^ { celloutsig_0_3z[23:1], celloutsig_0_29z };
  assign celloutsig_0_6z = { celloutsig_0_2z[3], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_4z } ~^ { celloutsig_0_3z[5:3], celloutsig_0_3z };
  assign celloutsig_0_65z = { celloutsig_0_24z[15:1], celloutsig_0_49z } ~^ { celloutsig_0_50z[26:25], celloutsig_0_20z, celloutsig_0_12z };
  assign celloutsig_1_0z = in_data[133:121] ~^ in_data[137:125];
  assign celloutsig_1_1z = in_data[167:161] ~^ celloutsig_1_0z[11:5];
  assign celloutsig_0_7z = celloutsig_0_3z[6:0] ~^ { celloutsig_0_4z[3:2], celloutsig_0_1z };
  assign celloutsig_1_6z = in_data[142:134] ~^ { celloutsig_1_1z[5:0], celloutsig_1_2z };
  assign celloutsig_1_11z = in_data[138:128] ~^ { celloutsig_1_0z[9:3], celloutsig_1_7z };
  assign celloutsig_0_8z = { in_data[83:78], celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_7z } ~^ { celloutsig_0_6z[3:0], celloutsig_0_3z };
  assign celloutsig_1_18z = in_data[122:109] ~^ { celloutsig_1_8z[0], celloutsig_1_0z };
  assign celloutsig_0_9z = celloutsig_0_8z[9:2] ~^ celloutsig_0_8z[16:9];
  assign celloutsig_0_10z = in_data[47:45] ~^ celloutsig_0_6z[26:24];
  assign celloutsig_0_14z = { in_data[91], celloutsig_0_7z } ~^ { celloutsig_0_9z[5:1], celloutsig_0_5z };
  assign celloutsig_0_15z = { celloutsig_0_0z[5], celloutsig_0_2z } ~^ { celloutsig_0_3z[4:3], celloutsig_0_12z };
  assign celloutsig_0_16z = { celloutsig_0_2z[5:1], celloutsig_0_7z } ~^ { celloutsig_0_1z[4:1], celloutsig_0_9z };
  assign celloutsig_0_21z = { celloutsig_0_13z[12:1], celloutsig_0_12z } ~^ { celloutsig_0_15z[4:0], celloutsig_0_17z, celloutsig_0_9z };
  assign celloutsig_0_2z = celloutsig_0_0z[7:2] ~^ in_data[88:83];
  assign celloutsig_0_24z = { celloutsig_0_16z[11:4], celloutsig_0_14z } ~^ { celloutsig_0_11z[4:2], celloutsig_0_17z, celloutsig_0_11z };
  assign celloutsig_0_25z = { celloutsig_0_6z[9:4], celloutsig_0_1z } ~^ { celloutsig_0_6z[5], celloutsig_0_17z, celloutsig_0_2z };
  assign celloutsig_0_29z = celloutsig_0_25z[4:1] ~^ celloutsig_0_2z[4:1];
  assign celloutsig_0_31z = celloutsig_0_4z[5:2] ~^ celloutsig_0_13z[4:1];
  assign celloutsig_0_32z = celloutsig_0_13z[12:1] ~^ celloutsig_0_21z[15:4];
  always_latch
    if (clkin_data[128]) celloutsig_1_2z = 3'h0;
    else if (!clkin_data[32]) celloutsig_1_2z = celloutsig_1_0z[11:9];
  always_latch
    if (clkin_data[128]) celloutsig_1_13z = 5'h00;
    else if (clkin_data[32]) celloutsig_1_13z = celloutsig_1_12z[8:4];
  always_latch
    if (clkin_data[96]) celloutsig_0_17z = 4'h0;
    else if (!celloutsig_1_19z[0]) celloutsig_0_17z = celloutsig_0_4z[4:1];
  assign { out_data[141:128], out_data[115:96], out_data[50:32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_65z, celloutsig_0_66z };
endmodule
