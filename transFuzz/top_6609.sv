/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  reg [8:0] celloutsig_0_1z;
  wire [6:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [2:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  reg [2:0] celloutsig_0_8z;
  wire [7:0] celloutsig_1_0z;
  reg [6:0] celloutsig_1_10z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire [3:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire [5:0] celloutsig_1_5z;
  wire [11:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [9:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_10z = ~(celloutsig_0_0z & celloutsig_0_8z[0]);
  assign celloutsig_1_2z = ~(celloutsig_1_1z[0] & in_data[112]);
  assign celloutsig_1_18z = ~((celloutsig_1_1z[2] | celloutsig_1_16z) & (celloutsig_1_9z[7] | celloutsig_1_17z[1]));
  assign celloutsig_0_14z = ~((in_data[14] | celloutsig_0_10z) & (celloutsig_0_4z | celloutsig_0_2z[1]));
  assign celloutsig_1_1z = celloutsig_1_0z[3:1] + in_data[191:189];
  assign celloutsig_1_5z = celloutsig_1_0z[6:1] + { 2'h3, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_19z = { celloutsig_1_6z[10], celloutsig_1_5z[3:2], celloutsig_1_3z, celloutsig_1_6z[6:0] } & { celloutsig_1_1z, celloutsig_1_10z, celloutsig_1_15z };
  assign celloutsig_0_4z = { in_data[82:80], celloutsig_0_0z } === in_data[41:38];
  assign celloutsig_0_3z = celloutsig_0_1z[6:2] && celloutsig_0_2z[6:2];
  assign celloutsig_0_15z = { celloutsig_0_6z[1:0], celloutsig_0_8z, celloutsig_0_14z } && { celloutsig_0_6z[0], celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_7z };
  assign celloutsig_0_5z = { in_data[23:21], celloutsig_0_4z } != celloutsig_0_2z[6:3];
  assign celloutsig_1_15z = { in_data[157], celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_1z } != { celloutsig_1_10z[6:2], celloutsig_1_6z[11:10], celloutsig_1_5z[3:2], celloutsig_1_3z, celloutsig_1_6z[6:0] };
  assign celloutsig_0_7z = | { celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_3z = | in_data[178:175];
  assign celloutsig_0_0z = ~^ in_data[95:84];
  assign celloutsig_1_8z = ~^ { in_data[139:137], celloutsig_1_7z };
  assign celloutsig_1_7z = ^ { in_data[107:105], celloutsig_1_5z, celloutsig_1_6z[11:10], celloutsig_1_5z[3:2], celloutsig_1_3z, celloutsig_1_6z[6:0], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_0_6z = { celloutsig_0_2z[4], celloutsig_0_3z, celloutsig_0_0z } << celloutsig_0_1z[4:2];
  assign celloutsig_1_0z = in_data[126:119] << in_data[171:164];
  assign celloutsig_1_17z = in_data[161:158] <<< { 1'h1, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_15z };
  assign celloutsig_1_9z = { celloutsig_1_0z[5:4], celloutsig_1_0z } - { celloutsig_1_1z[2:1], celloutsig_1_0z };
  assign celloutsig_0_2z = celloutsig_0_1z[6:0] ~^ in_data[44:38];
  always_latch
    if (!clkin_data[32]) celloutsig_0_8z = 3'h0;
    else if (celloutsig_1_19z[0]) celloutsig_0_8z = { celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_5z };
  always_latch
    if (clkin_data[32]) celloutsig_0_1z = 9'h000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_1z = { in_data[42:36], celloutsig_0_0z, celloutsig_0_0z };
  always_latch
    if (clkin_data[64]) celloutsig_1_10z = 7'h00;
    else if (clkin_data[0]) celloutsig_1_10z = { celloutsig_1_0z[6:2], celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_1_16z = ~((celloutsig_1_8z & 1'h1) | (celloutsig_1_3z & celloutsig_1_8z));
  assign celloutsig_1_4z[4:3] = { celloutsig_1_3z, celloutsig_1_2z } ~^ celloutsig_1_0z[1:0];
  assign { celloutsig_1_6z[11], celloutsig_1_6z[6], celloutsig_1_6z[10], celloutsig_1_6z[5:0] } = { celloutsig_1_5z[5], celloutsig_1_5z[5:4], celloutsig_1_5z[4:0], celloutsig_1_3z } ~^ { celloutsig_1_4z[4], celloutsig_1_3z, celloutsig_1_4z[3], celloutsig_1_5z };
  assign celloutsig_1_4z[2:0] = 3'h7;
  assign celloutsig_1_6z[9:7] = { celloutsig_1_5z[3:2], celloutsig_1_3z };
  assign { out_data[128], out_data[106:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_14z, celloutsig_0_15z };
endmodule
