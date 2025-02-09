/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [17:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [23:0] celloutsig_0_12z;
  wire [4:0] celloutsig_0_14z;
  wire [3:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [2:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [16:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_32z;
  wire celloutsig_0_37z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [12:0] celloutsig_0_4z;
  reg [27:0] celloutsig_0_5z;
  reg [9:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_94z;
  wire celloutsig_0_95z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [5:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [8:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  reg [5:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_24z = celloutsig_0_21z ? celloutsig_0_6z[8] : celloutsig_0_8z;
  assign celloutsig_0_3z = in_data[54] ? celloutsig_0_0z : celloutsig_0_1z;
  assign celloutsig_1_4z = ~(celloutsig_1_3z | celloutsig_1_2z);
  assign celloutsig_1_12z = ~(celloutsig_1_6z | celloutsig_1_5z);
  assign celloutsig_0_39z = celloutsig_0_0z | celloutsig_0_37z;
  assign celloutsig_0_94z = celloutsig_0_32z | celloutsig_0_39z;
  assign celloutsig_1_1z = in_data[188] | in_data[164];
  assign celloutsig_1_6z = in_data[129] | in_data[136];
  assign celloutsig_1_13z = celloutsig_1_10z[3] | celloutsig_1_9z;
  assign celloutsig_0_18z = celloutsig_0_3z | celloutsig_0_8z;
  assign celloutsig_0_1z = in_data[25:14] <= { in_data[61:51], celloutsig_0_0z };
  assign celloutsig_0_11z = celloutsig_0_4z <= { celloutsig_0_6z[8:1], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_8z };
  assign celloutsig_0_19z = { celloutsig_0_18z, celloutsig_0_17z, celloutsig_0_0z, celloutsig_0_14z } <= { celloutsig_0_6z, celloutsig_0_8z };
  assign celloutsig_0_8z = { in_data[46:38], celloutsig_0_2z } && { celloutsig_0_6z[9:3], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_0_95z = { celloutsig_0_24z, celloutsig_0_37z, celloutsig_0_2z, celloutsig_0_29z, celloutsig_0_21z } && celloutsig_0_6z[7:3];
  assign celloutsig_1_0z = in_data[184:168] && in_data[161:145];
  assign celloutsig_0_9z = { celloutsig_0_5z[26:1], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_6z } && { celloutsig_0_5z[9:1], celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_6z };
  assign celloutsig_1_11z = { celloutsig_1_10z, celloutsig_1_9z, celloutsig_1_9z } && { celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_8z };
  assign celloutsig_0_2z = { in_data[20:19], celloutsig_0_0z, celloutsig_0_0z } && in_data[7:4];
  assign celloutsig_0_29z = celloutsig_0_23z[12:4] && { celloutsig_0_12z[9:2], celloutsig_0_25z };
  assign celloutsig_1_7z = { celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_4z } || { celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_0_21z = { celloutsig_0_5z[19:18], celloutsig_0_19z, celloutsig_0_20z } || { celloutsig_0_12z[9:8], celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_9z };
  assign celloutsig_0_25z = celloutsig_0_10z[15:3] || in_data[53:41];
  assign celloutsig_0_32z = { celloutsig_0_23z[10:1], celloutsig_0_14z } < celloutsig_0_12z[22:8];
  assign celloutsig_0_7z = { celloutsig_0_5z[23:18], celloutsig_0_2z } < { celloutsig_0_4z[7:3], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_2z = { in_data[163:159], celloutsig_1_1z } < { in_data[134:130], celloutsig_1_0z };
  assign celloutsig_1_9z = { in_data[191:185], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_0z } < in_data[133:123];
  assign celloutsig_1_14z = { celloutsig_1_10z[1:0], celloutsig_1_1z } < in_data[136:134];
  assign celloutsig_1_18z = { celloutsig_1_8z[1:0], celloutsig_1_3z, celloutsig_1_2z } < { celloutsig_1_12z, celloutsig_1_9z, celloutsig_1_1z, celloutsig_1_5z };
  assign celloutsig_0_4z = { in_data[54:44], celloutsig_0_2z, celloutsig_0_1z } * in_data[32:20];
  assign celloutsig_1_10z = { celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_5z } * { celloutsig_1_8z[2], celloutsig_1_6z, celloutsig_1_9z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_0_12z = { celloutsig_0_6z[9:2], celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_11z } * { in_data[54:49], celloutsig_0_10z };
  assign celloutsig_0_14z = { celloutsig_0_10z[12], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_1z } * celloutsig_0_10z[9:5];
  assign celloutsig_0_20z = celloutsig_0_6z[7:5] * celloutsig_0_5z[23:21];
  assign celloutsig_0_0z = & in_data[41:33];
  assign celloutsig_0_37z = & { celloutsig_0_17z[2:0], celloutsig_0_6z };
  assign celloutsig_1_5z = & { celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_15z = & { celloutsig_1_14z, celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_16z = & { celloutsig_1_13z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_0z };
  assign celloutsig_1_3z = | in_data[158:154];
  assign celloutsig_0_10z = celloutsig_0_5z[20:3] << { in_data[77:61], celloutsig_0_7z };
  assign celloutsig_1_19z = { celloutsig_1_14z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_14z, celloutsig_1_14z, celloutsig_1_16z, celloutsig_1_18z, celloutsig_1_13z } << { celloutsig_1_16z, celloutsig_1_10z, celloutsig_1_0z, celloutsig_1_15z };
  assign celloutsig_0_17z = celloutsig_0_12z[20:17] << celloutsig_0_10z[4:1];
  assign celloutsig_0_23z = celloutsig_0_10z[16:0] << { celloutsig_0_10z[13:9], celloutsig_0_19z, celloutsig_0_11z, celloutsig_0_6z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_5z = 28'h0000000;
    else if (clkin_data[32]) celloutsig_0_5z = { celloutsig_0_4z[10:1], celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_6z = 10'h000;
    else if (!clkin_data[32]) celloutsig_0_6z = celloutsig_0_5z[14:5];
  always_latch
    if (clkin_data[128]) celloutsig_1_8z = 6'h00;
    else if (clkin_data[64]) celloutsig_1_8z = { in_data[102], celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_6z };
  assign { out_data[128], out_data[104:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_94z, celloutsig_0_95z };
endmodule
