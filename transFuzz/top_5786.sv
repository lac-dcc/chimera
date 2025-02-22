/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [5:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  reg [3:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [12:0] celloutsig_0_16z;
  wire [19:0] celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  reg [2:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [9:0] celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  reg [7:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_16z;
  reg [4:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_19z = ~celloutsig_1_2z[2];
  assign celloutsig_0_5z = ~((celloutsig_0_3z[0] | celloutsig_0_0z) & (celloutsig_0_1z[0] | celloutsig_0_3z[0]));
  assign celloutsig_1_9z = ~((celloutsig_1_7z | celloutsig_1_2z[3]) & (celloutsig_1_3z | celloutsig_1_8z));
  assign celloutsig_1_13z = celloutsig_1_9z ^ celloutsig_1_2z[2];
  assign celloutsig_0_4z = celloutsig_0_0z ^ celloutsig_0_1z[2];
  assign celloutsig_0_23z = celloutsig_0_14z ^ celloutsig_0_20z[2];
  assign celloutsig_1_6z = in_data[114] ^ celloutsig_1_4z;
  assign celloutsig_1_10z = { celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_4z } >= { celloutsig_1_2z[4:2], celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_6z };
  assign celloutsig_0_22z = { in_data[42:33], celloutsig_0_5z } >= { celloutsig_0_11z[4], celloutsig_0_8z };
  assign celloutsig_0_0z = in_data[75:72] <= in_data[56:53];
  assign celloutsig_1_4z = in_data[137:133] <= { celloutsig_1_2z[4:1], celloutsig_1_0z };
  assign celloutsig_1_8z = { celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_7z } <= in_data[162:159];
  assign celloutsig_0_14z = celloutsig_0_1z[10:2] && { celloutsig_0_8z[9:2], celloutsig_0_6z };
  assign celloutsig_1_5z = { in_data[170:158], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z } || { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_12z = celloutsig_0_7z & ~(celloutsig_0_3z[1]);
  assign celloutsig_0_8z = { celloutsig_0_1z[16:8], celloutsig_0_4z } % { 1'h1, celloutsig_0_1z[7:3], celloutsig_0_6z, celloutsig_0_3z };
  assign celloutsig_0_20z = in_data[25:20] % { 1'h1, celloutsig_0_16z[5:1] };
  assign celloutsig_0_16z = { celloutsig_0_1z[11], celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_14z } % { 1'h1, celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_11z };
  assign celloutsig_1_16z = { celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_13z, celloutsig_1_10z, celloutsig_1_13z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_8z } != { celloutsig_1_12z[4:2], celloutsig_1_7z, celloutsig_1_12z };
  assign celloutsig_1_3z = | { in_data[185:182], celloutsig_1_2z };
  assign celloutsig_1_7z = | { celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_6z };
  assign celloutsig_1_0z = in_data[148] & in_data[98];
  assign celloutsig_0_6z = | celloutsig_0_1z[7:0];
  assign celloutsig_0_7z = | { celloutsig_0_5z, celloutsig_0_3z, in_data[86:80], celloutsig_0_0z };
  assign celloutsig_1_1z = | in_data[135:121];
  assign celloutsig_0_11z = { celloutsig_0_3z[2:1], celloutsig_0_3z, celloutsig_0_6z } - celloutsig_0_1z[19:14];
  assign celloutsig_1_2z = { in_data[135:134], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z } ~^ in_data[114:110];
  assign celloutsig_0_1z = in_data[75:56] ^ { in_data[84:66], celloutsig_0_0z };
  always_latch
    if (clkin_data[32]) celloutsig_0_3z = 3'h0;
    else if (!celloutsig_1_2z[2]) celloutsig_0_3z = celloutsig_0_1z[14:12];
  always_latch
    if (!clkin_data[96]) celloutsig_1_12z = 8'h00;
    else if (!clkin_data[0]) celloutsig_1_12z = { celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_2z };
  always_latch
    if (clkin_data[96]) celloutsig_1_18z = 5'h00;
    else if (!clkin_data[0]) celloutsig_1_18z = { celloutsig_1_12z[3:1], celloutsig_1_10z, celloutsig_1_16z };
  always_latch
    if (clkin_data[32]) celloutsig_0_13z = 4'h0;
    else if (celloutsig_1_2z[2]) celloutsig_0_13z = { celloutsig_0_12z, celloutsig_0_3z };
  assign { out_data[132:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_22z, celloutsig_0_23z };
endmodule
