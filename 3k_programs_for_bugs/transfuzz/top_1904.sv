/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [5:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  reg [24:0] celloutsig_0_13z;
  wire [9:0] celloutsig_0_14z;
  wire [4:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [22:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [3:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [16:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  reg [3:0] celloutsig_0_27z;
  wire [4:0] celloutsig_0_28z;
  reg [2:0] celloutsig_0_29z;
  reg [18:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [11:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [10:0] celloutsig_0_36z;
  wire [7:0] celloutsig_0_37z;
  wire [5:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [2:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [5:0] celloutsig_0_42z;
  wire celloutsig_0_44z;
  wire [20:0] celloutsig_0_45z;
  wire [3:0] celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire [2:0] celloutsig_0_52z;
  wire celloutsig_0_56z;
  wire [25:0] celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire celloutsig_0_64z;
  wire [6:0] celloutsig_0_66z;
  wire celloutsig_0_6z;
  wire celloutsig_0_72z;
  wire [9:0] celloutsig_0_75z;
  wire [19:0] celloutsig_0_76z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [19:0] celloutsig_1_14z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [4:0] celloutsig_1_19z;
  reg [5:0] celloutsig_1_1z;
  wire [3:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [12:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [2:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_17z = ~(celloutsig_0_7z | celloutsig_0_9z);
  assign celloutsig_0_50z = ~celloutsig_0_13z[22];
  assign celloutsig_1_0z = ~in_data[178];
  assign celloutsig_1_3z = ~in_data[102];
  assign celloutsig_0_9z = ~celloutsig_0_3z;
  assign celloutsig_0_33z = ~((celloutsig_0_25z | celloutsig_0_1z) & (celloutsig_0_24z | celloutsig_0_28z[0]));
  assign celloutsig_0_56z = ~((in_data[89] | celloutsig_0_51z) & (celloutsig_0_51z | celloutsig_0_15z[0]));
  assign celloutsig_0_64z = ~((celloutsig_0_44z | celloutsig_0_58z[10]) & (celloutsig_0_22z | celloutsig_0_13z[7]));
  assign celloutsig_1_12z = ~((celloutsig_1_1z[0] | celloutsig_1_5z) & (celloutsig_1_11z | celloutsig_1_4z[5]));
  assign celloutsig_0_8z = ~((in_data[31] | celloutsig_0_3z) & (celloutsig_0_6z | celloutsig_0_3z));
  assign celloutsig_0_1z = ~((in_data[65] | celloutsig_0_0z[4]) & (in_data[77] | celloutsig_0_0z[3]));
  assign celloutsig_0_4z = celloutsig_0_0z[1] | ~(celloutsig_0_3z);
  assign celloutsig_0_20z = celloutsig_0_0z[5] | ~(celloutsig_0_10z);
  assign celloutsig_0_40z = celloutsig_0_36z[4:2] + celloutsig_0_37z[6:4];
  assign celloutsig_0_32z = { celloutsig_0_14z[9:6], celloutsig_0_12z, celloutsig_0_30z, celloutsig_0_26z, celloutsig_0_31z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_22z } === { celloutsig_0_23z[11:2], celloutsig_0_12z, celloutsig_0_20z, celloutsig_0_24z, celloutsig_0_12z };
  assign celloutsig_0_3z = celloutsig_0_0z[4:1] === { celloutsig_0_0z[2:1], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_44z = { celloutsig_0_29z[0], celloutsig_0_15z } === { celloutsig_0_32z, celloutsig_0_30z, celloutsig_0_27z };
  assign celloutsig_0_12z = { in_data[9:2], celloutsig_0_8z } === in_data[52:44];
  assign celloutsig_0_22z = { celloutsig_0_2z[18:15], celloutsig_0_20z } === { celloutsig_0_13z[14:13], celloutsig_0_19z, celloutsig_0_5z, celloutsig_0_11z };
  assign celloutsig_0_35z = ! celloutsig_0_13z[12:10];
  assign celloutsig_0_51z = ! { celloutsig_0_29z[2:1], celloutsig_0_17z };
  assign celloutsig_0_16z = ! { celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_6z };
  assign celloutsig_0_7z = in_data[84:40] < in_data[72:28];
  assign celloutsig_1_10z = { celloutsig_1_1z[4:2], celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z } < { in_data[139:130], celloutsig_1_2z, celloutsig_1_3z };
  assign celloutsig_0_37z = { celloutsig_0_14z[7:2], celloutsig_0_1z, celloutsig_0_5z } % { 1'h1, celloutsig_0_14z[7:1] };
  assign celloutsig_1_4z = in_data[164:152] % { 1'h1, in_data[188:177] };
  assign celloutsig_1_19z = { celloutsig_1_14z[9:6], celloutsig_1_11z } % { 1'h1, celloutsig_1_8z[0], celloutsig_1_10z, celloutsig_1_12z, celloutsig_1_9z };
  assign celloutsig_0_18z = { in_data[15:6], celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_8z } % { 1'h1, in_data[35:16], celloutsig_0_16z, celloutsig_0_1z };
  assign celloutsig_0_48z = { celloutsig_0_39z[3:2], celloutsig_0_39z[2], celloutsig_0_33z, celloutsig_0_24z, celloutsig_0_1z } != celloutsig_0_42z;
  assign celloutsig_0_6z = { in_data[30:23], celloutsig_0_1z } != { celloutsig_0_0z[5:3], celloutsig_0_0z };
  assign celloutsig_0_41z = { celloutsig_0_18z[18:10], celloutsig_0_25z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_32z, celloutsig_0_6z, celloutsig_0_20z } !== { celloutsig_0_36z[10:1], celloutsig_0_28z };
  assign celloutsig_0_49z = { celloutsig_0_0z[5], celloutsig_0_5z, celloutsig_0_48z } !== { celloutsig_0_23z[2:1], celloutsig_0_5z };
  assign celloutsig_1_5z = { celloutsig_1_1z, celloutsig_1_1z } !== in_data[146:135];
  assign celloutsig_1_9z = { in_data[161:160], celloutsig_1_2z } !== { celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_7z };
  assign celloutsig_1_11z = { celloutsig_1_8z, celloutsig_1_9z } !== { in_data[98:97], celloutsig_1_10z, celloutsig_1_7z };
  assign celloutsig_1_17z = { celloutsig_1_12z, celloutsig_1_8z } !== celloutsig_1_2z;
  assign celloutsig_0_10z = { in_data[73:59], celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_3z } !== { in_data[71:65], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_25z = { celloutsig_0_18z[15:1], celloutsig_0_16z, celloutsig_0_6z } !== { celloutsig_0_23z[14:5], celloutsig_0_24z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_21z };
  assign celloutsig_0_52z = ~ { celloutsig_0_24z, celloutsig_0_48z, celloutsig_0_16z };
  assign celloutsig_0_42z = celloutsig_0_36z[10:5] | in_data[24:19];
  assign celloutsig_0_58z = { celloutsig_0_18z[20:7], celloutsig_0_52z, celloutsig_0_22z, celloutsig_0_28z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_35z } | { celloutsig_0_36z[6:1], celloutsig_0_49z, celloutsig_0_7z, celloutsig_0_14z, celloutsig_0_24z, celloutsig_0_35z, celloutsig_0_39z[5:2], celloutsig_0_39z[2], celloutsig_0_39z[0] };
  assign celloutsig_0_66z = { celloutsig_0_34z[4:0], celloutsig_0_50z, celloutsig_0_33z } | celloutsig_0_37z[7:1];
  assign celloutsig_0_76z = { in_data[68:62], celloutsig_0_10z, celloutsig_0_32z, celloutsig_0_27z, celloutsig_0_27z, celloutsig_0_22z, celloutsig_0_56z, celloutsig_0_72z } | { celloutsig_0_45z[15:1], celloutsig_0_1z, celloutsig_0_19z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_44z };
  assign celloutsig_0_15z = { celloutsig_0_14z[6:4], celloutsig_0_10z, celloutsig_0_4z } | { celloutsig_0_14z[5:3], celloutsig_0_12z, celloutsig_0_11z };
  assign celloutsig_0_72z = | { celloutsig_0_44z, celloutsig_0_40z, celloutsig_0_34z[11:6] };
  assign celloutsig_1_18z = | { celloutsig_1_17z, celloutsig_1_11z, celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_0_31z = ^ { celloutsig_0_27z[0], celloutsig_0_22z, celloutsig_0_30z };
  assign celloutsig_1_6z = ^ { celloutsig_1_4z[11], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_11z = ^ celloutsig_0_2z[18:9];
  assign celloutsig_1_8z = celloutsig_1_1z[3:1] <<< { celloutsig_1_4z[12:11], celloutsig_1_6z };
  assign celloutsig_1_14z = { in_data[183:165], celloutsig_1_7z } <<< { celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_7z };
  assign celloutsig_0_28z = { celloutsig_0_27z[2:0], celloutsig_0_12z, celloutsig_0_25z } <<< celloutsig_0_2z[4:0];
  assign celloutsig_0_0z = in_data[28:23] >>> in_data[64:59];
  assign celloutsig_0_36z = { celloutsig_0_13z[14:9], celloutsig_0_20z, celloutsig_0_32z, celloutsig_0_19z, celloutsig_0_5z, celloutsig_0_26z } >>> { celloutsig_0_34z[10:3], celloutsig_0_29z };
  assign celloutsig_0_46z = celloutsig_0_0z[4:1] >>> { celloutsig_0_37z[4:3], celloutsig_0_1z, celloutsig_0_32z };
  assign celloutsig_1_2z = celloutsig_1_1z[3:0] >>> { in_data[112:110], celloutsig_1_0z };
  assign celloutsig_0_21z = { celloutsig_0_15z[2:0], celloutsig_0_16z } - { celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_8z };
  assign celloutsig_0_34z = { celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_33z, celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_12z } ^ { celloutsig_0_18z[14:4], celloutsig_0_10z };
  assign celloutsig_0_45z = { celloutsig_0_13z[7:1], celloutsig_0_33z, celloutsig_0_16z, celloutsig_0_36z, celloutsig_0_26z } ^ { celloutsig_0_23z[15:6], celloutsig_0_25z, celloutsig_0_35z, celloutsig_0_41z, celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_42z };
  assign celloutsig_0_75z = { celloutsig_0_46z[3:1], celloutsig_0_27z, celloutsig_0_10z, celloutsig_0_35z, celloutsig_0_17z } ^ { celloutsig_0_64z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_66z };
  assign celloutsig_0_14z = in_data[50:41] ^ { celloutsig_0_13z[14:9], celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_9z };
  assign celloutsig_0_23z = celloutsig_0_18z[16:0] ^ { celloutsig_0_18z[21:6], celloutsig_0_3z };
  assign celloutsig_0_5z = ~((in_data[11] & celloutsig_0_3z) | celloutsig_0_0z[1]);
  assign celloutsig_0_19z = ~((celloutsig_0_12z & celloutsig_0_9z) | celloutsig_0_4z);
  assign celloutsig_0_24z = ~((celloutsig_0_2z[8] & celloutsig_0_11z) | celloutsig_0_10z);
  always_latch
    if (clkin_data[96]) celloutsig_1_1z = 6'h00;
    else if (!clkin_data[0]) celloutsig_1_1z = { in_data[137:133], celloutsig_1_0z };
  always_latch
    if (clkin_data[64]) celloutsig_0_13z = 25'h0000000;
    else if (!celloutsig_1_18z) celloutsig_0_13z = in_data[93:69];
  always_latch
    if (clkin_data[32]) celloutsig_0_2z = 19'h00000;
    else if (!celloutsig_1_18z) celloutsig_0_2z = { in_data[72:66], celloutsig_0_0z, celloutsig_0_0z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_27z = 4'h0;
    else if (!celloutsig_1_18z) celloutsig_0_27z = { celloutsig_0_23z[3:1], celloutsig_0_16z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_29z = 3'h0;
    else if (!celloutsig_1_18z) celloutsig_0_29z = { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_16z };
  assign celloutsig_0_30z = ~((celloutsig_0_29z[1] & celloutsig_0_7z) | (celloutsig_0_6z & celloutsig_0_13z[12]));
  assign celloutsig_1_7z = ~((celloutsig_1_2z[2] & in_data[103]) | (celloutsig_1_0z & celloutsig_1_3z));
  assign celloutsig_0_26z = ~((celloutsig_0_18z[15] & in_data[39]) | (celloutsig_0_20z & celloutsig_0_5z));
  assign { celloutsig_0_39z[2], celloutsig_0_39z[5:3], celloutsig_0_39z[0] } = ~ { celloutsig_0_32z, celloutsig_0_28z[2:0], celloutsig_0_19z };
  assign celloutsig_0_39z[1] = celloutsig_0_39z[2];
  assign { out_data[128], out_data[100:96], out_data[41:32], out_data[19:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_75z, celloutsig_0_76z };
endmodule
