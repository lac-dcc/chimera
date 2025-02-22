/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_4z;
  reg [8:0] celloutsig_0_5z;
  wire [5:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [2:0] celloutsig_1_12z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  reg [3:0] celloutsig_1_4z;
  wire [14:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [4:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_17z = ~(celloutsig_1_12z[1] | celloutsig_1_11z);
  assign celloutsig_0_4z = ~((celloutsig_0_2z | celloutsig_0_2z) & celloutsig_0_1z);
  assign celloutsig_1_8z = celloutsig_1_5z[11] ^ celloutsig_1_0z[5];
  assign celloutsig_0_2z = celloutsig_0_0z ^ in_data[64];
  assign celloutsig_1_10z = celloutsig_1_7z[2] ^ celloutsig_1_5z[12];
  assign celloutsig_1_15z = celloutsig_1_2z ^ celloutsig_1_8z;
  assign celloutsig_1_16z = { celloutsig_1_7z[4:3], celloutsig_1_15z, celloutsig_1_8z } == celloutsig_1_0z[5:2];
  assign celloutsig_1_19z = { celloutsig_1_17z, celloutsig_1_2z, celloutsig_1_10z } == celloutsig_1_5z[9:7];
  assign celloutsig_1_1z = in_data[99] & ~(in_data[119]);
  assign celloutsig_1_2z = in_data[156] & ~(in_data[175]);
  assign celloutsig_1_18z = celloutsig_1_6z ? celloutsig_1_4z[3:1] : { celloutsig_1_1z, celloutsig_1_17z, celloutsig_1_16z };
  assign celloutsig_1_11z = { celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_1z, celloutsig_1_4z } != { celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_8z, celloutsig_1_6z };
  assign celloutsig_1_0z = in_data[183:178] | in_data[138:133];
  assign celloutsig_0_1z = | in_data[68:60];
  assign celloutsig_0_0z = ^ in_data[81:75];
  assign celloutsig_1_6z = ^ { celloutsig_1_0z[2:0], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_5z = { celloutsig_1_0z[5], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z } >>> { in_data[148:135], celloutsig_1_1z };
  assign celloutsig_1_7z = { celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_1z } >>> { celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_1_12z = { celloutsig_1_0z[3], celloutsig_1_3z, celloutsig_1_8z } ~^ celloutsig_1_5z[8:6];
  assign celloutsig_1_3z = ~((celloutsig_1_1z & celloutsig_1_2z) | celloutsig_1_1z);
  always_latch
    if (!clkin_data[32]) celloutsig_0_5z = 9'h000;
    else if (celloutsig_1_19z) celloutsig_0_5z = { in_data[75:69], celloutsig_0_0z, celloutsig_0_1z };
  always_latch
    if (clkin_data[64]) celloutsig_1_4z = 4'h0;
    else if (clkin_data[0]) celloutsig_1_4z = { in_data[113:111], celloutsig_1_2z };
  assign { out_data[130:128], out_data[96], out_data[32], out_data[8:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_4z, celloutsig_0_5z };
endmodule
