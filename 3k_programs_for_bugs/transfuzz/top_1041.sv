/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [5:0] celloutsig_0_0z;
  wire celloutsig_0_1z;
  reg [2:0] celloutsig_0_2z;
  wire [2:0] celloutsig_0_3z;
  wire [18:0] celloutsig_1_0z;
  wire [26:0] celloutsig_1_10z;
  wire [6:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire [16:0] celloutsig_1_18z;
  wire [9:0] celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [8:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire [13:0] celloutsig_1_6z;
  wire [5:0] celloutsig_1_7z;
  wire [18:0] celloutsig_1_8z;
  wire [4:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_2z = in_data[191] | ~(celloutsig_1_1z[1]);
  assign celloutsig_1_12z = celloutsig_1_10z[17] | ~(celloutsig_1_6z[3]);
  assign celloutsig_1_15z = celloutsig_1_12z | ~(celloutsig_1_8z[15]);
  assign celloutsig_1_1z = in_data[186:183] + celloutsig_1_0z[17:14];
  assign celloutsig_1_3z = { in_data[138:136], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z } / { 1'h1, in_data[163:156] };
  assign celloutsig_1_7z = { celloutsig_1_0z[9:5], celloutsig_1_2z } / { 1'h1, celloutsig_1_6z[12:8] };
  assign celloutsig_1_9z = celloutsig_1_0z[17:13] / { 1'h1, celloutsig_1_0z[10:7] };
  assign celloutsig_1_4z = { celloutsig_1_3z[2:0], celloutsig_1_1z, celloutsig_1_1z } && celloutsig_1_0z[12:2];
  assign celloutsig_0_1z = in_data[21:3] && { in_data[78:66], celloutsig_0_0z };
  assign celloutsig_1_13z = { celloutsig_1_8z[10:1], celloutsig_1_2z } && { celloutsig_1_8z[11], celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_0_3z = celloutsig_0_2z % { 1'h1, celloutsig_0_2z[1], in_data[0] };
  assign celloutsig_1_5z = { celloutsig_1_1z[2:1], celloutsig_1_2z } % { 1'h1, celloutsig_1_4z, in_data[96] };
  assign celloutsig_1_18z = { celloutsig_1_9z[3:0], celloutsig_1_11z, celloutsig_1_7z } % { 1'h1, celloutsig_1_8z[5:3], celloutsig_1_1z, celloutsig_1_3z };
  assign celloutsig_1_0z = in_data[124:106] * in_data[176:158];
  assign celloutsig_1_19z = { celloutsig_1_8z[12:8], celloutsig_1_15z, celloutsig_1_5z, celloutsig_1_13z } * { celloutsig_1_3z, celloutsig_1_15z };
  assign celloutsig_1_6z = ~ { celloutsig_1_0z[16:4], celloutsig_1_4z };
  assign celloutsig_1_8z = ~ celloutsig_1_0z;
  assign celloutsig_1_11z = celloutsig_1_3z[8:2] - celloutsig_1_0z[8:2];
  assign celloutsig_0_0z = in_data[38:33] ~^ in_data[61:56];
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_2z = 3'h0;
    else if (!clkin_data[0]) celloutsig_0_2z = { celloutsig_0_0z[3:2], celloutsig_0_1z };
  assign celloutsig_1_10z[26:9] = { celloutsig_1_8z[15:1], celloutsig_1_5z } ~^ in_data[191:174];
  assign celloutsig_1_10z[8:0] = 9'h1ff;
  assign { out_data[144:128], out_data[105:96], out_data[34:32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_2z, celloutsig_0_3z };
endmodule
