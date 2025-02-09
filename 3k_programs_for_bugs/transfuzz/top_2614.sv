/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_15z;
  wire [6:0] celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_33z;
  reg [12:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  reg [15:0] celloutsig_0_54z;
  wire [6:0] celloutsig_0_55z;
  wire [2:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [29:0] celloutsig_0_7z;
  wire [8:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [27:0] celloutsig_1_12z;
  wire [4:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [6:0] celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  reg [9:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [13:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  reg [11:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_7z = celloutsig_1_4z ? celloutsig_1_3z[9] : celloutsig_1_2z[3];
  assign celloutsig_1_8z = ~(in_data[187] & celloutsig_1_2z[0]);
  assign celloutsig_0_9z = ~(celloutsig_0_8z[2] & celloutsig_0_7z[7]);
  assign celloutsig_0_30z = ~(celloutsig_0_4z & celloutsig_0_9z);
  assign celloutsig_1_10z = !(celloutsig_1_4z ? celloutsig_1_1z[0] : celloutsig_1_5z);
  assign celloutsig_0_15z = ~((celloutsig_0_7z[16] | celloutsig_0_9z) & celloutsig_0_10z[1]);
  assign celloutsig_0_0z = in_data[26] | ~(in_data[31]);
  assign celloutsig_1_0z = in_data[150] | in_data[149];
  assign celloutsig_1_11z = celloutsig_1_3z[2] | celloutsig_1_2z[0];
  assign celloutsig_0_33z = { celloutsig_0_1z[1:0], celloutsig_0_15z, celloutsig_0_30z, celloutsig_0_2z, celloutsig_0_31z, celloutsig_0_9z } == { celloutsig_0_30z, celloutsig_0_10z, celloutsig_0_5z };
  assign celloutsig_0_6z = { celloutsig_0_3z[3], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_1z } == { celloutsig_0_3z[8:1], celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_5z = celloutsig_1_2z[2:0] == { celloutsig_1_3z[9], celloutsig_1_4z, celloutsig_1_0z };
  assign celloutsig_0_31z = { celloutsig_0_15z, celloutsig_0_30z, celloutsig_0_8z } == celloutsig_0_3z[12:2];
  assign celloutsig_1_4z = in_data[124:114] <= { in_data[108], celloutsig_1_3z };
  assign celloutsig_0_4z = ! in_data[53:49];
  assign celloutsig_0_8z = in_data[93:85] % { 1'h1, celloutsig_0_3z[8:1] };
  assign celloutsig_0_10z = celloutsig_0_3z[2] ? celloutsig_0_8z[3:1] : celloutsig_0_1z[2:0];
  assign celloutsig_1_1z = ~ in_data[185:179];
  assign celloutsig_1_6z = ~ in_data[136:123];
  assign celloutsig_1_18z = ~ { celloutsig_1_1z[6:4], celloutsig_1_8z, celloutsig_1_11z };
  assign celloutsig_0_1z = ~ { in_data[53:48], celloutsig_0_0z };
  assign celloutsig_0_5z = celloutsig_0_3z[5:3] | { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_2z = celloutsig_1_1z[4:0] | celloutsig_1_1z[4:0];
  assign celloutsig_0_7z = { in_data[27:5], celloutsig_0_1z } | { celloutsig_0_3z[11:1], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_1_19z = | celloutsig_1_12z[21:0];
  assign celloutsig_0_2z = | { celloutsig_0_1z, in_data[46] };
  assign celloutsig_1_12z = { celloutsig_1_9z[7:0], celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_5z } >>> { celloutsig_1_6z[12:11], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_10z, celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_9z };
  assign celloutsig_0_55z = celloutsig_0_54z[10:4] ~^ celloutsig_0_8z[7:1];
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_54z = 16'h0000;
    else if (clkin_data[0]) celloutsig_0_54z = { celloutsig_0_3z[12:7], celloutsig_0_33z, celloutsig_0_8z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_3z = 10'h000;
    else if (!clkin_data[32]) celloutsig_1_3z = { in_data[120:112], celloutsig_1_0z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_9z = 12'h000;
    else if (clkin_data[32]) celloutsig_1_9z = { celloutsig_1_1z[3:1], celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_7z };
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_3z = 13'h0000;
    else if (!clkin_data[0]) celloutsig_0_3z = { in_data[47:43], celloutsig_0_1z, celloutsig_0_0z };
  assign { out_data[132:128], out_data[96], out_data[47:32], out_data[6:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_54z, celloutsig_0_55z };
endmodule
