/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [10:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [8:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [14:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [6:0] celloutsig_0_23z;
  reg [9:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [9:0] celloutsig_0_27z;
  wire [5:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  reg [23:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [3:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [6:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [5:0] celloutsig_0_40z;
  reg [11:0] celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire [5:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [5:0] celloutsig_0_53z;
  wire celloutsig_0_55z;
  wire [12:0] celloutsig_0_58z;
  wire [2:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire [7:0] celloutsig_0_62z;
  wire celloutsig_0_64z;
  wire celloutsig_0_6z;
  reg [4:0] celloutsig_0_74z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_91z;
  wire celloutsig_0_97z;
  wire [10:0] celloutsig_0_98z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [6:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [2:0] celloutsig_1_16z;
  wire [2:0] celloutsig_1_18z;
  wire [19:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire [13:0] celloutsig_1_3z;
  wire [12:0] celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  reg [6:0] celloutsig_1_7z;
  wire [8:0] celloutsig_1_8z;
  reg [19:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_2z = celloutsig_0_0z ? celloutsig_0_1z : in_data[60];
  assign celloutsig_0_30z = celloutsig_0_26z ? celloutsig_0_11z : celloutsig_0_19z;
  assign celloutsig_0_43z = ~(celloutsig_0_35z & celloutsig_0_34z[3]);
  assign celloutsig_0_91z = ~(celloutsig_0_40z[1] & celloutsig_0_28z[3]);
  assign celloutsig_0_12z = ~(celloutsig_0_9z | in_data[41]);
  assign celloutsig_0_33z = ~(celloutsig_0_30z | celloutsig_0_21z[2]);
  assign celloutsig_0_6z = celloutsig_0_5z | ~(celloutsig_0_0z);
  assign celloutsig_0_8z = celloutsig_0_4z[3] | ~(celloutsig_0_2z);
  assign celloutsig_0_17z = celloutsig_0_12z | ~(celloutsig_0_15z);
  assign celloutsig_0_1z = in_data[50] ^ celloutsig_0_0z;
  assign celloutsig_1_14z = ~(in_data[158] ^ celloutsig_1_3z[10]);
  assign celloutsig_0_29z = ~(celloutsig_0_0z ^ celloutsig_0_20z);
  assign celloutsig_0_58z = celloutsig_0_32z[20:8] + { celloutsig_0_41z[8:4], celloutsig_0_53z, celloutsig_0_20z, celloutsig_0_55z };
  assign celloutsig_0_62z = celloutsig_0_14z[9:2] + celloutsig_0_58z[10:3];
  assign celloutsig_0_98z = { in_data[92:83], celloutsig_0_9z } + { celloutsig_0_62z, celloutsig_0_2z, celloutsig_0_33z, celloutsig_0_64z };
  assign celloutsig_1_5z = { in_data[167:164], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z } + { in_data[143:136], celloutsig_1_2z };
  assign celloutsig_0_16z = { celloutsig_0_14z[8:3], celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_9z } + in_data[20:12];
  assign celloutsig_0_59z = celloutsig_0_27z[3:1] & celloutsig_0_4z[2:0];
  assign celloutsig_0_11z = in_data[38:36] === { celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_5z };
  assign celloutsig_0_22z = { celloutsig_0_9z, celloutsig_0_19z, celloutsig_0_0z } === in_data[17:15];
  assign celloutsig_0_9z = celloutsig_0_4z[3:1] > { celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_3z = { in_data[64:53], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z } || { in_data[42:31], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_20z = { in_data[84:80], celloutsig_0_5z } || { celloutsig_0_4z[4:1], celloutsig_0_10z, celloutsig_0_12z };
  assign celloutsig_0_39z = { celloutsig_0_23z[6:1], celloutsig_0_11z, celloutsig_0_9z } < { celloutsig_0_27z[6:1], celloutsig_0_18z, celloutsig_0_2z };
  assign celloutsig_0_10z = { celloutsig_0_4z[4:3], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_7z } < { celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_8z };
  assign celloutsig_1_10z = celloutsig_1_8z[6:0] < celloutsig_1_5z[11:5];
  assign celloutsig_0_36z = celloutsig_0_7z & ~(celloutsig_0_14z[9]);
  assign celloutsig_0_48z = celloutsig_0_36z & ~(celloutsig_0_12z);
  assign celloutsig_0_25z = celloutsig_0_0z & ~(celloutsig_0_7z);
  assign celloutsig_1_2z = { in_data[164:163], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z } % { 1'h1, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, in_data[96] };
  assign celloutsig_1_16z = celloutsig_1_7z[3:1] % { 1'h1, celloutsig_1_12z, celloutsig_1_12z };
  assign celloutsig_1_11z = { celloutsig_1_8z[5:0], celloutsig_1_10z } % { 1'h1, celloutsig_1_3z[12:7] };
  assign celloutsig_0_23z = { celloutsig_0_16z[5:1], celloutsig_0_9z, celloutsig_0_8z } % { 1'h1, celloutsig_0_22z, celloutsig_0_18z, celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_15z };
  assign celloutsig_0_47z = { celloutsig_0_16z[3:1], celloutsig_0_43z } !== { in_data[86:84], celloutsig_0_39z };
  assign celloutsig_0_50z = { celloutsig_0_48z, celloutsig_0_0z, celloutsig_0_4z } !== { in_data[55:49], celloutsig_0_1z };
  assign celloutsig_0_5z = { in_data[85], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z } !== { celloutsig_0_4z[4:1], celloutsig_0_3z };
  assign celloutsig_0_55z = { celloutsig_0_38z[4:3], celloutsig_0_50z } !== { celloutsig_0_7z, celloutsig_0_47z, celloutsig_0_5z };
  assign celloutsig_1_0z = in_data[162:148] !== in_data[119:105];
  assign celloutsig_0_40z = { celloutsig_0_14z[1:0], celloutsig_0_34z } | celloutsig_0_21z[9:4];
  assign celloutsig_0_53z = { celloutsig_0_21z[8:7], celloutsig_0_30z, celloutsig_0_29z, celloutsig_0_22z, celloutsig_0_35z } | celloutsig_0_28z;
  assign celloutsig_1_8z = { celloutsig_1_6z[2:0], celloutsig_1_6z, celloutsig_1_0z } | celloutsig_1_5z[12:4];
  assign celloutsig_0_21z = { celloutsig_0_4z[2], celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_3z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_17z, celloutsig_0_17z } | { in_data[87:82], celloutsig_0_19z, celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_35z = | { in_data[15:8], celloutsig_0_8z };
  assign celloutsig_0_64z = | { celloutsig_0_59z[0], celloutsig_0_11z, celloutsig_0_22z, celloutsig_0_47z };
  assign celloutsig_0_7z = | in_data[32:28];
  assign celloutsig_1_1z = | in_data[122:112];
  assign celloutsig_1_15z = | { celloutsig_1_7z[6:5], celloutsig_1_8z, celloutsig_1_12z, celloutsig_1_14z, celloutsig_1_12z };
  assign celloutsig_0_26z = | { in_data[54:52], celloutsig_0_13z, celloutsig_0_12z };
  assign celloutsig_0_13z = | { celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_2z, in_data[72:71] };
  assign celloutsig_0_0z = ~^ in_data[90:79];
  assign celloutsig_1_12z = ~^ { celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_15z = ~^ { in_data[56:53], celloutsig_0_6z };
  assign celloutsig_0_19z = ~^ { celloutsig_0_16z[8:4], celloutsig_0_0z, celloutsig_0_12z };
  assign celloutsig_0_97z = ^ { celloutsig_0_74z[3:2], celloutsig_0_91z };
  assign celloutsig_0_18z = ^ celloutsig_0_14z[8:3];
  assign celloutsig_0_4z = { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z } >> { in_data[70:68], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_1_19z = { celloutsig_1_11z[6:1], celloutsig_1_16z, celloutsig_1_15z, celloutsig_1_18z, celloutsig_1_7z } << { celloutsig_1_9z[14:3], celloutsig_1_16z, celloutsig_1_18z, celloutsig_1_14z, celloutsig_1_14z };
  assign celloutsig_0_27z = celloutsig_0_24z << { celloutsig_0_16z[8:2], celloutsig_0_10z, celloutsig_0_20z, celloutsig_0_25z };
  assign celloutsig_0_28z = { celloutsig_0_23z[6:3], celloutsig_0_0z, celloutsig_0_10z } << celloutsig_0_27z[7:2];
  assign celloutsig_0_34z = celloutsig_0_16z[5:2] <<< celloutsig_0_24z[4:1];
  assign celloutsig_0_38z = { celloutsig_0_32z[11:7], celloutsig_0_29z, celloutsig_0_26z } <<< { celloutsig_0_23z[1], celloutsig_0_35z, celloutsig_0_29z, celloutsig_0_29z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_6z };
  assign celloutsig_1_6z = celloutsig_1_3z[4:0] <<< celloutsig_1_3z[10:6];
  assign celloutsig_1_18z = celloutsig_1_16z <<< celloutsig_1_9z[10:8];
  assign celloutsig_0_14z = { celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_5z } <<< { celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_3z };
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_41z = 12'h000;
    else if (clkin_data[0]) celloutsig_0_41z = { in_data[57:47], celloutsig_0_22z };
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_74z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_74z = celloutsig_0_16z[8:4];
  always_latch
    if (clkin_data[128]) celloutsig_1_7z = 7'h00;
    else if (clkin_data[64]) celloutsig_1_7z = { celloutsig_1_3z[12:11], celloutsig_1_2z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_9z = 20'h00000;
    else if (clkin_data[96]) celloutsig_1_9z = in_data[138:119];
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_24z = 10'h000;
    else if (!clkin_data[0]) celloutsig_0_24z = { celloutsig_0_4z[3:2], celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_7z };
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_32z = 24'h000000;
    else if (!clkin_data[32]) celloutsig_0_32z = { celloutsig_0_21z[8:4], celloutsig_0_25z, celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_30z, celloutsig_0_1z, celloutsig_0_26z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_2z };
  assign { celloutsig_1_3z[12], celloutsig_1_3z[6], celloutsig_1_3z[11], celloutsig_1_3z[5:4], celloutsig_1_3z[10:9], celloutsig_1_3z[3], celloutsig_1_3z[8], celloutsig_1_3z[2], celloutsig_1_3z[7], celloutsig_1_3z[1:0] } = { celloutsig_1_2z[4], celloutsig_1_2z[4:3], celloutsig_1_2z[3:2], celloutsig_1_2z[2:1], celloutsig_1_2z[1:0], celloutsig_1_2z[0], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } ^ { celloutsig_1_2z[3], celloutsig_1_2z[1], celloutsig_1_2z[2], celloutsig_1_2z[0], celloutsig_1_2z[4], celloutsig_1_2z[1], celloutsig_1_2z[4:3], celloutsig_1_2z[3:2], celloutsig_1_2z[2:0] };
  assign celloutsig_1_3z[13] = 1'h0;
  assign { out_data[130:128], out_data[115:96], out_data[32], out_data[10:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_97z, celloutsig_0_98z };
endmodule
