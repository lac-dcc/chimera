/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [6:0] celloutsig_0_13z;
  wire celloutsig_0_1z;
  reg [13:0] celloutsig_0_2z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  reg [18:0] celloutsig_0_5z;
  reg [27:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [7:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire [6:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_1z;
  reg [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [15:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [26:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_9z = !(celloutsig_1_4z ? celloutsig_1_1z : celloutsig_1_6z);
  assign celloutsig_0_10z = !(celloutsig_0_0z ? celloutsig_0_0z : celloutsig_0_9z);
  assign celloutsig_0_0z = ~(in_data[67] ^ in_data[37]);
  assign celloutsig_1_3z = ~(celloutsig_1_2z[2] ^ in_data[130]);
  assign celloutsig_0_8z = ~(celloutsig_0_7z ^ celloutsig_0_2z[12]);
  assign celloutsig_1_8z = { celloutsig_1_0z[6:0], celloutsig_1_4z, celloutsig_1_1z } > celloutsig_1_7z[25:17];
  assign celloutsig_1_13z = { celloutsig_1_0z[7:1], celloutsig_1_0z, celloutsig_1_9z } > { in_data[185:182], celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_9z, celloutsig_1_9z };
  assign celloutsig_1_18z = { celloutsig_1_7z[16], celloutsig_1_7z[14:12], celloutsig_1_7z[19:17], celloutsig_1_15z } > { celloutsig_1_0z[6:0], celloutsig_1_6z };
  assign celloutsig_0_3z = { celloutsig_0_2z[12:7], celloutsig_0_1z, celloutsig_0_1z } && { celloutsig_0_2z[8:2], celloutsig_0_0z };
  assign celloutsig_1_1z = in_data[151:149] && celloutsig_1_0z[2:0];
  assign celloutsig_1_4z = { celloutsig_1_0z[7:4], celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_3z } < { in_data[158:151], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_1_11z = { celloutsig_1_0z[5:2], celloutsig_1_2z, celloutsig_1_6z } < { celloutsig_1_0z[3:2], celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_10z };
  assign celloutsig_0_9z = { celloutsig_0_5z[10], celloutsig_0_8z, celloutsig_0_7z } < { celloutsig_0_6z[20:19], celloutsig_0_3z };
  assign celloutsig_0_1z = { in_data[56], celloutsig_0_0z, celloutsig_0_0z } < in_data[87:85];
  assign celloutsig_1_17z = ~ { celloutsig_1_5z[15:13], celloutsig_1_5z[4:1] };
  assign celloutsig_0_13z = ~ celloutsig_0_2z[12:6];
  assign celloutsig_1_0z = ~ in_data[189:182];
  assign celloutsig_1_6z = & { celloutsig_1_5z[15:12], celloutsig_1_5z[10:8], celloutsig_1_5z[4], celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_1_10z = & { celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_0z[2:0] };
  assign celloutsig_1_12z = & { celloutsig_1_9z, celloutsig_1_5z[15], celloutsig_1_5z[8], celloutsig_1_4z };
  assign celloutsig_1_15z = & { celloutsig_1_13z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_5z[15], celloutsig_1_5z[13], celloutsig_1_5z[8], celloutsig_1_5z[4:1], celloutsig_1_4z, celloutsig_1_2z };
  assign celloutsig_0_4z = & in_data[21:8];
  assign celloutsig_0_7z = & celloutsig_0_2z[12:5];
  assign celloutsig_0_32z = & { celloutsig_0_10z, celloutsig_0_5z[18:7], celloutsig_0_0z };
  assign celloutsig_0_33z = & celloutsig_0_13z[3:1];
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_5z = 19'h00000;
    else if (clkin_data[0]) celloutsig_0_5z = { celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_0z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_6z = 28'h0000000;
    else if (!clkin_data[32]) celloutsig_0_6z = { in_data[5:4], celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_0z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_2z = 14'h0000;
    else if (clkin_data[32]) celloutsig_0_2z = in_data[51:38];
  always_latch
    if (clkin_data[96]) celloutsig_1_2z = 3'h0;
    else if (!clkin_data[64]) celloutsig_1_2z = in_data[145:143];
  assign { celloutsig_1_5z[12], celloutsig_1_5z[2:1], celloutsig_1_5z[10:8], celloutsig_1_5z[15:13], celloutsig_1_5z[4:3] } = ~ { celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_0z };
  assign { out_data[110], out_data[118:112], out_data[119], out_data[100], out_data[109], out_data[105], out_data[121:120], out_data[111], out_data[108:106], out_data[101] } = ~ { celloutsig_1_18z, celloutsig_1_17z, celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_5z[13], celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z };
  assign { celloutsig_1_7z[3], celloutsig_1_7z[20], celloutsig_1_7z[2:0], celloutsig_1_7z[16], celloutsig_1_7z[6:5], celloutsig_1_7z[14:12], celloutsig_1_7z[19:17], celloutsig_1_7z[8:7], celloutsig_1_7z[26:21] } = ~ { celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_5z[12], celloutsig_1_5z[2:1], celloutsig_1_5z[10:8], celloutsig_1_5z[15:13], celloutsig_1_5z[4:3], in_data[191:186] };
  assign { celloutsig_1_5z[11], celloutsig_1_5z[7:5], celloutsig_1_5z[0] } = { celloutsig_1_5z[12], celloutsig_1_5z[15:13], celloutsig_1_5z[2] };
  assign { celloutsig_1_7z[15], celloutsig_1_7z[11:9], celloutsig_1_7z[4] } = { celloutsig_1_7z[16], celloutsig_1_7z[19:17], celloutsig_1_7z[6] };
  assign { out_data[128], out_data[104:102], out_data[99:96], out_data[32], out_data[0] } = { celloutsig_1_18z, out_data[109], out_data[109], out_data[120], out_data[105], out_data[108:106], celloutsig_0_32z, celloutsig_0_33z };
endmodule
