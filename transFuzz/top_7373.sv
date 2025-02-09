/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [3:0] celloutsig_0_0z;
  wire [10:0] celloutsig_0_10z;
  wire [7:0] celloutsig_0_12z;
  wire [4:0] celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire [21:0] celloutsig_0_16z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_25z;
  wire [16:0] celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [11:0] celloutsig_0_30z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  reg [3:0] celloutsig_0_5z;
  wire [8:0] celloutsig_0_6z;
  wire [13:0] celloutsig_0_7z;
  wire [29:0] celloutsig_0_8z;
  wire [5:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [6:0] celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire [9:0] celloutsig_1_14z;
  wire [8:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [7:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [5:0] celloutsig_1_4z;
  wire [15:0] celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_13z = celloutsig_1_7z ? celloutsig_1_9z : celloutsig_1_11z[1];
  assign celloutsig_0_4z = celloutsig_0_0z[1] ? celloutsig_0_1z : celloutsig_0_2z;
  assign celloutsig_0_20z = celloutsig_0_5z[3] ? celloutsig_0_13z[3] : celloutsig_0_8z[14];
  assign celloutsig_1_10z = ~((celloutsig_1_4z[1] | celloutsig_1_8z) & celloutsig_1_7z);
  assign celloutsig_0_1z = ~((celloutsig_0_0z[0] | in_data[76]) & celloutsig_0_0z[1]);
  assign celloutsig_0_7z = { in_data[47:37], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_4z } + { celloutsig_0_6z[8], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_2z };
  assign celloutsig_0_8z = { in_data[17:7], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_4z } + { celloutsig_0_6z[6:2], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_2z };
  assign celloutsig_1_14z = { celloutsig_1_2z[3:0], celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_13z, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_13z } / { 1'h1, celloutsig_1_9z, celloutsig_1_11z, celloutsig_1_10z };
  assign celloutsig_1_15z = { celloutsig_1_11z[3], celloutsig_1_11z, celloutsig_1_10z } / { 1'h1, celloutsig_1_5z[11:5], celloutsig_1_1z };
  assign celloutsig_0_6z = { celloutsig_0_5z[2:1], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_1z } / { 1'h1, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_5z };
  assign celloutsig_0_10z = { celloutsig_0_8z[12], celloutsig_0_0z, celloutsig_0_9z } / { 1'h1, celloutsig_0_6z[6:0], celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_0_12z = { celloutsig_0_8z[24:23], celloutsig_0_9z } / { 1'h1, celloutsig_0_8z[6:2], celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_1_3z = in_data[124:121] > { celloutsig_1_2z[7:5], celloutsig_1_0z };
  assign celloutsig_1_19z = { celloutsig_1_14z[2:1], celloutsig_1_7z, celloutsig_1_1z } && { celloutsig_1_17z, celloutsig_1_18z };
  assign celloutsig_0_15z = { celloutsig_0_12z[7:2], celloutsig_0_13z } && { celloutsig_0_10z[10:5], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_29z = { in_data[91], celloutsig_0_0z } && { celloutsig_0_16z[11], celloutsig_0_5z };
  assign celloutsig_1_0z = ! in_data[163:161];
  assign celloutsig_0_2z = ! in_data[49:31];
  assign celloutsig_1_7z = { celloutsig_1_1z, celloutsig_1_3z } !== in_data[136:135];
  assign celloutsig_1_9z = celloutsig_1_5z[15:4] !== { celloutsig_1_5z[14:4], celloutsig_1_8z };
  assign celloutsig_1_17z = { in_data[111:110], celloutsig_1_3z, celloutsig_1_8z } !== celloutsig_1_15z[5:2];
  assign celloutsig_0_0z = in_data[69:66] | in_data[75:72];
  assign celloutsig_1_18z = { celloutsig_1_11z[5:4], celloutsig_1_8z } | in_data[149:147];
  assign celloutsig_0_9z = in_data[51:46] | { in_data[41:40], celloutsig_0_5z };
  assign celloutsig_0_25z = | { celloutsig_0_12z[2:1], celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_1_11z = { in_data[106:101], celloutsig_1_8z } >> celloutsig_1_2z[7:1];
  assign celloutsig_0_13z = { celloutsig_0_3z, celloutsig_0_5z } >> celloutsig_0_6z[7:3];
  assign celloutsig_0_27z = { celloutsig_0_10z[10:2], celloutsig_0_9z, celloutsig_0_20z, celloutsig_0_20z } >> { celloutsig_0_10z[3], celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_25z };
  assign celloutsig_0_30z = { celloutsig_0_12z[4:0], celloutsig_0_4z, celloutsig_0_20z, celloutsig_0_5z, celloutsig_0_15z } >> { celloutsig_0_27z[14:4], celloutsig_0_25z };
  assign celloutsig_1_2z = in_data[153:146] <<< { in_data[165:160], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_5z = in_data[142:127] <<< { in_data[182:173], celloutsig_1_4z };
  assign celloutsig_1_4z = { in_data[190:186], celloutsig_1_0z } - { in_data[137:134], celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_0_16z = { celloutsig_0_8z[15:2], celloutsig_0_12z } ^ { celloutsig_0_7z[6:0], celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_1z };
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_5z = 4'h0;
    else if (clkin_data[32]) celloutsig_0_5z = { celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_3z = ~((in_data[25] & in_data[31]) | (in_data[51] & celloutsig_0_2z));
  assign celloutsig_1_1z = ~((celloutsig_1_0z & in_data[165]) | (celloutsig_1_0z & celloutsig_1_0z));
  assign celloutsig_1_8z = ~((celloutsig_1_4z[3] & celloutsig_1_5z[7]) | (celloutsig_1_7z & celloutsig_1_0z));
  assign { out_data[130:128], out_data[96], out_data[32], out_data[11:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_29z, celloutsig_0_30z };
endmodule
