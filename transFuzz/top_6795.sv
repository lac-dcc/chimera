/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [12:0] celloutsig_0_0z;
  reg [8:0] celloutsig_0_10z;
  wire [7:0] celloutsig_0_15z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [6:0] celloutsig_1_11z;
  wire [6:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [32:0] celloutsig_1_2z;
  wire [22:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_19z = ~(celloutsig_1_1z & celloutsig_1_11z[0]);
  assign celloutsig_0_6z = !(celloutsig_0_4z ? celloutsig_0_0z[2] : celloutsig_0_3z);
  assign celloutsig_0_7z = !(1'h1 ? celloutsig_0_6z : celloutsig_0_5z);
  assign celloutsig_0_18z = celloutsig_0_9z | celloutsig_0_8z;
  assign celloutsig_1_11z = { celloutsig_1_3z[15:14], celloutsig_1_5z, celloutsig_1_6z } + { in_data[101:96], celloutsig_1_7z };
  assign celloutsig_0_17z = { celloutsig_0_10z[5], celloutsig_0_7z, celloutsig_0_6z } + { in_data[56:55], celloutsig_0_3z };
  assign celloutsig_1_4z = { celloutsig_1_2z[25:21], celloutsig_1_1z } == celloutsig_1_2z[27:22];
  assign celloutsig_1_7z = { in_data[187:180], celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_0z } == { celloutsig_1_2z[18:2], celloutsig_1_4z };
  assign celloutsig_0_9z = in_data[29:26] == { celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_5z };
  assign celloutsig_0_38z = { celloutsig_0_15z[5:4], celloutsig_0_7z, 1'h1, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_15z } >= { celloutsig_0_4z, celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_18z };
  assign celloutsig_1_0z = in_data[140:122] >= in_data[159:141];
  assign celloutsig_0_1z = in_data[56:29] >= in_data[37:10];
  assign celloutsig_0_3z = celloutsig_0_0z[12:1] > celloutsig_0_0z[12:1];
  assign celloutsig_1_1z = { in_data[165:157], celloutsig_1_0z, celloutsig_1_0z } != in_data[130:120];
  assign celloutsig_0_8z = celloutsig_0_0z[5:3] != { celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_5z };
  assign celloutsig_1_3z = - celloutsig_1_2z[28:6];
  assign celloutsig_1_18z = - celloutsig_1_11z;
  assign celloutsig_0_15z = - in_data[73:66];
  assign celloutsig_1_5z = { in_data[171:169], celloutsig_1_1z } | { celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_4z = ^ in_data[32:27];
  assign celloutsig_1_6z = ^ { celloutsig_1_2z[23:21], celloutsig_1_5z };
  assign celloutsig_0_5z = ^ in_data[85:83];
  assign celloutsig_0_0z = in_data[12:0] << in_data[12:0];
  always_latch
    if (celloutsig_1_19z) celloutsig_0_10z = 9'h000;
    else if (!clkin_data[0]) celloutsig_0_10z = { celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_5z, 1'h1, celloutsig_0_3z, celloutsig_0_9z, 1'h1, celloutsig_0_3z, celloutsig_0_1z };
  assign { celloutsig_1_2z[3:2], celloutsig_1_2z[32:4] } = ~ { celloutsig_1_1z, celloutsig_1_0z, in_data[149:121] };
  assign celloutsig_1_2z[1:0] = { celloutsig_1_2z[2], celloutsig_1_2z[3] };
  assign { out_data[134:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_38z, 1'h1 };
endmodule
