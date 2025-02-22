/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [7:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire [6:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [7:0] celloutsig_0_19z;
  wire [6:0] celloutsig_0_1z;
  wire [3:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  reg [9:0] celloutsig_0_3z;
  wire [5:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [2:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [3:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire [10:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [10:0] celloutsig_1_13z;
  wire [3:0] celloutsig_1_14z;
  reg [15:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  reg [15:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [12:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_7z = ~(celloutsig_1_5z & celloutsig_1_5z);
  assign celloutsig_1_8z = ~(celloutsig_1_5z & celloutsig_1_0z[3]);
  assign celloutsig_0_7z = ~(celloutsig_0_1z[5] & celloutsig_0_2z);
  assign celloutsig_0_24z = ~(in_data[54] & celloutsig_0_13z);
  assign celloutsig_0_18z = celloutsig_0_16z[0] ^ celloutsig_0_17z;
  assign celloutsig_1_4z = celloutsig_1_2z[13] ^ celloutsig_1_1z[2];
  assign celloutsig_1_10z = { celloutsig_1_6z[10:1], celloutsig_1_7z } + celloutsig_1_2z[10:0];
  assign celloutsig_1_14z = celloutsig_1_13z[9:6] + { in_data[132:131], celloutsig_1_9z, celloutsig_1_11z };
  assign celloutsig_0_16z = { in_data[44], celloutsig_0_4z } + celloutsig_0_1z;
  assign celloutsig_0_23z = celloutsig_0_3z[7:4] + { celloutsig_0_8z[3:1], celloutsig_0_9z };
  assign celloutsig_0_15z = { celloutsig_0_3z[1], celloutsig_0_8z, celloutsig_0_10z } === celloutsig_0_3z[9:4];
  assign celloutsig_0_17z = celloutsig_0_1z[5:0] === { celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_0_28z = { celloutsig_0_19z[3], celloutsig_0_24z } === { celloutsig_0_13z, celloutsig_0_25z };
  assign celloutsig_1_5z = { in_data[154:130], celloutsig_1_3z } === { in_data[187:181], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_0_2z = ! { celloutsig_0_1z[4:3], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_3z = ! celloutsig_1_2z[9:0];
  assign celloutsig_0_10z = { in_data[59:41], celloutsig_0_1z } || { in_data[4:3], celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_1_11z = celloutsig_1_6z[0] & ~(celloutsig_1_10z[5]);
  assign celloutsig_1_19z = celloutsig_1_14z[2] & ~(in_data[113]);
  assign celloutsig_0_12z = celloutsig_0_7z & ~(celloutsig_0_4z[1]);
  assign celloutsig_0_13z = celloutsig_0_7z & ~(celloutsig_0_3z[8]);
  assign celloutsig_0_27z = celloutsig_0_13z & ~(celloutsig_0_18z);
  assign celloutsig_1_13z = { celloutsig_1_6z[10:2], celloutsig_1_9z, celloutsig_1_11z } * { in_data[115:110], celloutsig_1_1z, celloutsig_1_11z, celloutsig_1_8z };
  assign celloutsig_0_11z = { celloutsig_0_1z[6], celloutsig_0_4z, celloutsig_0_5z } * { celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_8z = ~ celloutsig_0_4z[4:1];
  assign celloutsig_0_0z = ^ in_data[21:11];
  assign celloutsig_1_9z = ^ { celloutsig_1_2z[1], celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_0_5z = ^ { celloutsig_0_4z[2:0], celloutsig_0_1z };
  assign celloutsig_0_9z = ^ { in_data[44:41], celloutsig_0_6z, celloutsig_0_3z };
  assign celloutsig_0_25z = ^ { celloutsig_0_11z[6:2], celloutsig_0_23z };
  assign celloutsig_0_4z = in_data[24:19] << celloutsig_0_1z[5:0];
  assign celloutsig_0_6z = { celloutsig_0_1z[1:0], celloutsig_0_2z } << celloutsig_0_1z[5:3];
  assign celloutsig_0_1z = { in_data[39:34], celloutsig_0_0z } << in_data[75:69];
  assign celloutsig_1_1z = celloutsig_1_0z[4:2] << celloutsig_1_0z[4:2];
  assign celloutsig_1_6z = { celloutsig_1_2z[11:2], celloutsig_1_1z } >> { celloutsig_1_0z[2], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_5z };
  assign celloutsig_0_19z = { celloutsig_0_15z, celloutsig_0_1z } >> celloutsig_0_3z[9:2];
  assign celloutsig_1_0z = in_data[134:130] >> in_data[137:133];
  always_latch
    if (clkin_data[96]) celloutsig_1_18z = 16'h0000;
    else if (!clkin_data[0]) celloutsig_1_18z = { celloutsig_1_2z[8:5], celloutsig_1_4z, celloutsig_1_13z };
  always_latch
    if (clkin_data[64]) celloutsig_0_3z = 10'h000;
    else if (!celloutsig_1_19z) celloutsig_0_3z = { in_data[22:21], celloutsig_0_2z, celloutsig_0_1z };
  always_latch
    if (clkin_data[128]) celloutsig_1_2z = 16'h0000;
    else if (!clkin_data[32]) celloutsig_1_2z = in_data[125:110];
  assign { out_data[143:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_27z, celloutsig_0_28z };
endmodule
