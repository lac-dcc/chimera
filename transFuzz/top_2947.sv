/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [3:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_1z;
  wire [38:0] celloutsig_0_2z;
  reg [10:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [2:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [5:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  reg [12:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [2:0] celloutsig_1_18z;
  reg [2:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_1z = ~(celloutsig_0_0z | in_data[12]);
  assign celloutsig_1_4z = ~(in_data[99] | celloutsig_1_1z[2]);
  assign celloutsig_1_14z = ~celloutsig_1_5z;
  assign celloutsig_1_6z = celloutsig_1_0z | ~(celloutsig_1_0z);
  assign celloutsig_1_7z = celloutsig_1_3z | celloutsig_1_5z;
  assign celloutsig_1_11z = in_data[176] | celloutsig_1_6z;
  assign celloutsig_0_0z = in_data[66:62] <= in_data[41:37];
  assign celloutsig_0_4z = { celloutsig_0_3z[6:1], celloutsig_0_1z } <= { celloutsig_0_3z[9:4], celloutsig_0_1z };
  assign celloutsig_1_2z = { celloutsig_1_1z[0], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z } <= { in_data[131:130], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_3z = { in_data[162:144], celloutsig_1_1z } <= { in_data[189:173], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_8z = in_data[173:165] <= { celloutsig_1_1z[1:0], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_5z };
  assign celloutsig_1_5z = { celloutsig_1_4z, celloutsig_1_1z } < { celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_12z = in_data[134:130] < { in_data[173:170], celloutsig_1_11z };
  assign celloutsig_0_9z = { celloutsig_0_3z[10:8], celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_4z } * { celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_2z = in_data[51:13] * { in_data[48:14], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_6z = { celloutsig_0_5z[2:1], celloutsig_0_0z } !== { celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_1_15z = { celloutsig_1_13z[1], celloutsig_1_11z, celloutsig_1_2z } !== { in_data[102:101], celloutsig_1_4z };
  assign celloutsig_0_5z = ~ celloutsig_0_2z[2:0];
  assign celloutsig_0_12z = & in_data[51:33];
  assign celloutsig_1_18z = { celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_14z } >>> celloutsig_1_13z[9:7];
  assign celloutsig_0_11z = celloutsig_0_9z[4:1] ^ { in_data[87], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_1_0z = ~((in_data[161] & in_data[149]) | in_data[148]);
  always_latch
    if (!clkin_data[32]) celloutsig_0_3z = 11'h000;
    else if (!out_data[96]) celloutsig_0_3z = { in_data[17:9], celloutsig_0_0z, celloutsig_0_0z };
  always_latch
    if (!clkin_data[96]) celloutsig_1_1z = 3'h0;
    else if (clkin_data[0]) celloutsig_1_1z = in_data[159:157];
  always_latch
    if (clkin_data[64]) celloutsig_1_13z = 13'h0000;
    else if (clkin_data[0]) celloutsig_1_13z = { celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_11z, celloutsig_1_12z, celloutsig_1_11z };
  assign { out_data[102], out_data[100], out_data[103], out_data[96], out_data[101], out_data[99] } = ~ { celloutsig_1_15z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z };
  assign { out_data[130:128], out_data[98:97], out_data[35:32], out_data[0] } = { celloutsig_1_18z, out_data[102:101], celloutsig_0_11z, celloutsig_0_12z };
endmodule
