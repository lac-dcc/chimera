/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [11:0] celloutsig_0_0z;
  wire [8:0] celloutsig_0_1z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [9:0] celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [4:0] celloutsig_1_8z;
  reg [13:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_14z = ~(celloutsig_1_8z[1] | celloutsig_1_9z[3]);
  assign celloutsig_1_19z = celloutsig_1_3z ^ celloutsig_1_14z;
  assign celloutsig_1_8z = { celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_4z } + celloutsig_1_5z[7:3];
  assign celloutsig_1_6z = in_data[111:107] & { celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_1_0z = in_data[128:118] == in_data[109:99];
  assign celloutsig_1_2z = { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z } || in_data[114:112];
  assign celloutsig_1_7z = { celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_5z } || { in_data[150:135], celloutsig_1_3z, celloutsig_1_6z };
  assign celloutsig_1_5z = in_data[134:125] | { in_data[157:153], celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_1z = in_data[88:80] | in_data[35:27];
  assign celloutsig_1_4z = | { in_data[156:154], celloutsig_1_1z };
  assign celloutsig_1_11z = | { celloutsig_1_5z[1:0], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_1z = ~^ { in_data[176:173], celloutsig_1_0z };
  assign celloutsig_1_3z = ~^ { in_data[183:149], celloutsig_1_1z };
  assign celloutsig_1_18z = ~^ { celloutsig_1_8z[4:2], celloutsig_1_14z, celloutsig_1_2z, celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_6z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_0z = 12'h000;
    else if (!celloutsig_1_18z) celloutsig_0_0z = in_data[91:80];
  always_latch
    if (clkin_data[64]) celloutsig_1_9z = 14'h0000;
    else if (clkin_data[0]) celloutsig_1_9z = { celloutsig_1_8z[1:0], celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_6z };
  assign { out_data[128], out_data[96], out_data[43:32], out_data[8:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_0z, celloutsig_0_1z };
endmodule
