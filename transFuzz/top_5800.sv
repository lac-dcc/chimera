/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  reg [2:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [39:0] celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  wire [6:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [30:0] celloutsig_0_1z;
  wire [4:0] celloutsig_0_21z;
  wire [21:0] celloutsig_0_23z;
  wire celloutsig_0_27z;
  wire celloutsig_0_2z;
  wire [14:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_3z;
  wire [5:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [8:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_12z;
  reg [9:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [8:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_12z = celloutsig_0_0z ? celloutsig_0_9z : celloutsig_0_1z[0];
  assign celloutsig_1_2z = ~celloutsig_1_0z;
  assign celloutsig_1_19z = ~celloutsig_1_15z[1];
  assign celloutsig_0_3z = ~celloutsig_0_2z;
  assign celloutsig_1_18z = ~((in_data[172] | in_data[152]) & (celloutsig_1_2z | celloutsig_1_8z[0]));
  assign celloutsig_0_32z = ~((celloutsig_0_13z[2] | celloutsig_0_15z[31]) & (in_data[66] | celloutsig_0_11z));
  assign celloutsig_1_0z = in_data[104] | ~(in_data[120]);
  assign celloutsig_0_5z = celloutsig_0_1z[8] ^ celloutsig_0_1z[27];
  assign celloutsig_0_0z = in_data[83:68] == in_data[85:70];
  assign celloutsig_0_6z = { celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_2z } == { celloutsig_0_1z[25:18], celloutsig_0_3z };
  assign celloutsig_0_19z = { celloutsig_0_8z[3:1], celloutsig_0_18z, celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_7z } == { in_data[57:53], celloutsig_0_3z, celloutsig_0_13z, celloutsig_0_4z };
  assign celloutsig_0_10z = in_data[38:24] === { celloutsig_0_1z[14:1], celloutsig_0_0z };
  assign celloutsig_0_2z = { celloutsig_0_1z[29:26], celloutsig_0_0z } === in_data[57:53];
  assign celloutsig_1_3z = { celloutsig_1_1z[8:7], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z } >= celloutsig_1_1z[6:1];
  assign celloutsig_0_9z = { in_data[67:65], celloutsig_0_4z } <= in_data[62:54];
  assign celloutsig_1_12z = in_data[108:99] && { celloutsig_1_1z[5:0], celloutsig_1_8z, celloutsig_1_0z };
  assign celloutsig_0_18z = { celloutsig_0_15z[34:30], celloutsig_0_12z, celloutsig_0_5z } % { 1'h1, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_7z };
  assign celloutsig_0_8z = { in_data[10:4], celloutsig_0_5z, celloutsig_0_3z } * { celloutsig_0_1z[21:14], celloutsig_0_3z };
  assign celloutsig_0_21z = { celloutsig_0_8z[7:6], celloutsig_0_3z, celloutsig_0_19z, celloutsig_0_19z } * in_data[72:68];
  assign celloutsig_0_1z = - in_data[43:13];
  assign celloutsig_0_31z = - { celloutsig_0_15z[16:6], celloutsig_0_2z, celloutsig_0_27z, celloutsig_0_11z, celloutsig_0_9z };
  assign celloutsig_0_14z = in_data[12:1] !== { celloutsig_0_8z[8:1], celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_10z };
  assign celloutsig_1_1z = { in_data[138:131], celloutsig_1_0z } | { in_data[122:115], celloutsig_1_0z };
  assign celloutsig_0_23z = { celloutsig_0_21z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_0z } | { celloutsig_0_1z[25:24], celloutsig_0_21z, celloutsig_0_18z, celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_16z };
  assign celloutsig_1_6z = | in_data[106:101];
  assign celloutsig_0_27z = | { celloutsig_0_23z[5:2], celloutsig_0_14z, celloutsig_0_11z };
  assign celloutsig_0_7z = ~^ { celloutsig_0_4z[0], celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_4z = celloutsig_0_1z[22:17] <<< { celloutsig_0_1z[10:6], celloutsig_0_0z };
  assign celloutsig_0_15z = { celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_13z } >>> { celloutsig_0_1z[30:4], celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_9z };
  assign celloutsig_1_8z = { celloutsig_1_1z[6:5], celloutsig_1_2z } ^ celloutsig_1_1z[4:2];
  assign celloutsig_0_16z = { celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_12z } ^ { celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_11z };
  always_latch
    if (clkin_data[64]) celloutsig_1_15z = 10'h000;
    else if (clkin_data[0]) celloutsig_1_15z = { celloutsig_1_1z[1:0], celloutsig_1_3z, celloutsig_1_12z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_0z };
  always_latch
    if (clkin_data[32]) celloutsig_0_13z = 3'h0;
    else if (!celloutsig_1_18z) celloutsig_0_13z = { celloutsig_0_4z[4:3], celloutsig_0_7z };
  assign celloutsig_0_11z = ~((celloutsig_0_10z & celloutsig_0_1z[12]) | (celloutsig_0_3z & celloutsig_0_7z));
  assign { out_data[128], out_data[96], out_data[46:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_31z, celloutsig_0_32z };
endmodule
