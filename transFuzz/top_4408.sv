/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [7:0] celloutsig_0_0z;
  reg [2:0] celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire [9:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire [7:0] celloutsig_1_14z;
  wire [6:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [3:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [18:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_6z = celloutsig_0_3z[5] ? celloutsig_0_3z[1] : celloutsig_0_4z;
  assign celloutsig_1_3z = celloutsig_1_0z ? celloutsig_1_1z : in_data[140];
  assign celloutsig_1_5z = celloutsig_1_4z ? celloutsig_1_4z : in_data[157];
  assign celloutsig_1_11z = celloutsig_1_4z ? celloutsig_1_8z : in_data[176];
  assign celloutsig_0_4z = !(in_data[18] ? celloutsig_0_0z[0] : celloutsig_0_0z[5]);
  assign celloutsig_1_13z = ~((celloutsig_1_5z | celloutsig_1_6z) & celloutsig_1_5z);
  assign celloutsig_0_5z = ~((celloutsig_0_3z[3] | in_data[76]) & (celloutsig_0_2z | in_data[69]));
  assign celloutsig_1_1z = ~((in_data[173] | celloutsig_1_0z) & (celloutsig_1_0z | celloutsig_1_0z));
  assign celloutsig_1_4z = in_data[127] ^ celloutsig_1_2z;
  assign celloutsig_1_9z = { celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_6z } / { 1'h1, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_1_2z = in_data[109:105] > { in_data[172:170], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_8z = { in_data[112:110], celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_5z } > { celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_4z };
  assign celloutsig_0_2z = celloutsig_0_1z > in_data[91:89];
  assign celloutsig_1_18z = ! { celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_15z };
  assign celloutsig_1_19z = ! celloutsig_1_9z[5:1];
  assign celloutsig_1_6z = celloutsig_1_1z & ~(celloutsig_1_4z);
  assign celloutsig_0_3z = { in_data[32:31], celloutsig_0_0z } % { 1'h1, celloutsig_0_0z[6:1], celloutsig_0_1z };
  assign celloutsig_0_0z = in_data[12:5] * in_data[70:63];
  assign celloutsig_1_0z = | in_data[128:126];
  assign celloutsig_1_7z = { celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_5z } <<< { in_data[177], celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_14z = { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_2z } - { celloutsig_1_9z[9], celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_13z, celloutsig_1_6z };
  assign celloutsig_1_15z = { celloutsig_1_9z[17:12], celloutsig_1_11z } ~^ { celloutsig_1_14z[7:2], celloutsig_1_0z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_1z = 3'h0;
    else if (clkin_data[0]) celloutsig_0_1z = in_data[52:50];
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_5z, celloutsig_0_6z };
endmodule
