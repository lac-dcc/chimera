/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_12z;
  wire celloutsig_0_14z;
  reg [2:0] celloutsig_0_16z;
  wire celloutsig_0_19z;
  wire [9:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_2z;
  wire [2:0] celloutsig_0_3z;
  wire celloutsig_0_5z;
  wire celloutsig_0_7z;
  wire [4:0] celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire [5:0] celloutsig_1_10z;
  wire [3:0] celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire [7:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire [15:0] celloutsig_1_18z;
  wire [19:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire [8:0] celloutsig_1_3z;
  wire [6:0] celloutsig_1_4z;
  wire [14:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [4:0] celloutsig_1_7z;
  wire [11:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ~in_data[54];
  assign celloutsig_0_5z = ~in_data[77];
  assign celloutsig_0_2z = ~celloutsig_0_1z[1];
  assign celloutsig_1_1z = ~in_data[151];
  assign celloutsig_1_17z = ~((celloutsig_1_15z[1] | celloutsig_1_12z[1]) & celloutsig_1_9z);
  assign celloutsig_0_14z = ~((celloutsig_0_3z[1] | celloutsig_0_7z) & celloutsig_0_3z[0]);
  assign celloutsig_0_19z = celloutsig_0_5z | celloutsig_0_7z;
  assign celloutsig_0_12z = ~(celloutsig_0_7z ^ celloutsig_0_8z[1]);
  assign celloutsig_1_18z = { celloutsig_1_5z[6:0], celloutsig_1_15z, celloutsig_1_17z } / { 1'h1, in_data[124:116], celloutsig_1_10z };
  assign celloutsig_1_0z = in_data[125:120] && in_data[144:139];
  assign celloutsig_1_6z = celloutsig_1_5z[7:0] || { in_data[104], celloutsig_1_4z };
  assign celloutsig_1_14z = { in_data[182:178], celloutsig_1_10z, celloutsig_1_6z } || { celloutsig_1_7z[3:1], celloutsig_1_3z };
  assign celloutsig_0_7z = in_data[53:41] != { in_data[64:53], celloutsig_0_0z };
  assign celloutsig_1_9z = celloutsig_1_5z[7:1] != celloutsig_1_3z[7:1];
  assign celloutsig_0_20z = celloutsig_0_1z[4:1] !== { celloutsig_0_14z, celloutsig_0_16z };
  assign celloutsig_1_2z = ~ { in_data[187], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_3z = ~ { in_data[132:125], celloutsig_1_0z };
  assign celloutsig_1_5z = { celloutsig_1_3z[7:1], celloutsig_1_4z, celloutsig_1_1z } | { in_data[165:160], celloutsig_1_3z };
  assign celloutsig_1_19z = { celloutsig_1_8z[5:2], celloutsig_1_18z } << { celloutsig_1_15z[3:2], celloutsig_1_18z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_8z = in_data[20:16] << in_data[46:42];
  assign celloutsig_0_1z = in_data[19:10] << { in_data[79:73], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_7z = { celloutsig_1_4z[3:0], celloutsig_1_1z } << celloutsig_1_4z[4:0];
  assign celloutsig_1_8z = { celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_0z } << celloutsig_1_5z[12:1];
  assign celloutsig_1_12z = celloutsig_1_3z[6:3] << { celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_1_10z = in_data[148:143] >> { celloutsig_1_7z[2], celloutsig_1_7z };
  assign celloutsig_1_4z = celloutsig_1_3z[7:1] <<< { celloutsig_1_3z[4:1], celloutsig_1_2z };
  assign celloutsig_0_3z = { in_data[53], celloutsig_0_2z, celloutsig_0_2z } >>> celloutsig_0_1z[5:3];
  assign celloutsig_1_15z = { celloutsig_1_12z[0], celloutsig_1_4z } - { celloutsig_1_4z[5], celloutsig_1_14z, celloutsig_1_1z, celloutsig_1_7z };
  always_latch
    if (clkin_data[0]) celloutsig_0_16z = 3'h0;
    else if (celloutsig_1_18z[0]) celloutsig_0_16z = { celloutsig_0_3z[2:1], celloutsig_0_12z };
  assign { out_data[143:128], out_data[115:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_19z, celloutsig_0_20z };
endmodule
