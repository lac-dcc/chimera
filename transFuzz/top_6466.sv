/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [31:0] celloutsig_0_0z;
  wire [25:0] celloutsig_0_10z;
  reg [16:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire [11:0] celloutsig_0_16z;
  wire [13:0] celloutsig_0_18z;
  wire [27:0] celloutsig_0_19z;
  wire [13:0] celloutsig_0_1z;
  wire [32:0] celloutsig_0_20z;
  wire celloutsig_0_2z;
  wire [11:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [3:0] celloutsig_0_5z;
  reg [2:0] celloutsig_0_6z;
  wire [5:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire [11:0] celloutsig_1_13z;
  wire [5:0] celloutsig_1_15z;
  wire [11:0] celloutsig_1_16z;
  wire [11:0] celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire [7:0] celloutsig_1_1z;
  wire [43:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [13:0] celloutsig_1_4z;
  wire [8:0] celloutsig_1_6z;
  wire [7:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = celloutsig_0_1z[11:0] + in_data[58:47];
  assign celloutsig_1_13z = { celloutsig_1_4z[11:1], celloutsig_1_8z } + in_data[108:97];
  assign celloutsig_1_19z = celloutsig_1_16z[11:1] + { celloutsig_1_13z[5:2], celloutsig_1_15z, celloutsig_1_8z };
  assign celloutsig_0_5z = in_data[14:11] + { celloutsig_0_0z[26:25], celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_1_6z = { celloutsig_1_2z[31:24], celloutsig_1_0z } + celloutsig_1_2z[33:25];
  assign celloutsig_0_7z = { celloutsig_0_1z[12:8], celloutsig_0_2z } / { 1'h1, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_1_1z = in_data[169:162] / { 1'h1, in_data[175:169] };
  assign celloutsig_1_3z = celloutsig_1_1z[5:2] == { in_data[107:105], celloutsig_1_0z };
  assign celloutsig_0_4z = in_data[63:61] > celloutsig_0_0z[7:5];
  assign celloutsig_0_2z = celloutsig_0_0z[28:17] > celloutsig_0_1z[13:2];
  assign celloutsig_1_8z = { celloutsig_1_3z, celloutsig_1_1z } > { celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_0_8z = { celloutsig_0_7z[1:0], celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_5z } < celloutsig_0_1z[11:2];
  assign celloutsig_1_0z = in_data[150:135] < in_data[177:162];
  assign celloutsig_0_18z = { in_data[86:85], celloutsig_0_3z } % { 1'h1, celloutsig_0_10z[12:0] };
  assign celloutsig_1_16z = - in_data[109:98];
  assign celloutsig_0_16z = - { in_data[72:62], celloutsig_0_8z };
  assign celloutsig_1_4z = { in_data[183:173], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z } <<< { in_data[176:172], celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_15z = celloutsig_1_13z[5:0] >>> celloutsig_1_7z[5:0];
  assign celloutsig_0_14z = celloutsig_0_5z[3:1] >>> { celloutsig_0_7z[1:0], celloutsig_0_4z };
  assign celloutsig_1_2z = { in_data[170:154], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z } >>> { in_data[156:129], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_7z = celloutsig_1_4z[10:3] >>> { celloutsig_1_6z[7:1], celloutsig_1_0z };
  assign celloutsig_0_0z = in_data[80:49] ~^ in_data[58:27];
  assign celloutsig_1_18z = { celloutsig_1_1z[2:0], celloutsig_1_6z } ~^ celloutsig_1_13z;
  assign celloutsig_0_1z = celloutsig_0_0z[21:8] ~^ in_data[78:65];
  assign celloutsig_0_10z = celloutsig_0_0z[28:3] ^ { celloutsig_0_0z[29:5], celloutsig_0_8z };
  assign celloutsig_0_19z = { celloutsig_0_18z[10:4], celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_14z } ^ { in_data[12:0], celloutsig_0_18z, celloutsig_0_4z };
  assign celloutsig_0_20z = { celloutsig_0_6z[1], celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_5z } ^ { celloutsig_0_19z[19:16], celloutsig_0_13z, celloutsig_0_16z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_6z = 3'h0;
    else if (!celloutsig_1_18z[0]) celloutsig_0_6z = celloutsig_0_0z[29:27];
  always_latch
    if (!clkin_data[64]) celloutsig_0_13z = 17'h00000;
    else if (!celloutsig_1_18z[0]) celloutsig_0_13z = { in_data[36:26], celloutsig_0_7z };
  assign { out_data[139:128], out_data[106:96], out_data[59:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_19z, celloutsig_0_20z[32:1] };
endmodule
