/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [15:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  reg [12:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [4:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [21:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [7:0] celloutsig_0_21z;
  wire [3:0] celloutsig_0_22z;
  wire [10:0] celloutsig_0_25z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [5:0] celloutsig_0_5z;
  wire [9:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire [13:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [14:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [5:0] celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_14z = celloutsig_0_1z ? celloutsig_0_3z : celloutsig_0_13z;
  assign celloutsig_1_6z = ~((celloutsig_1_3z | celloutsig_1_0z) & celloutsig_1_2z[4]);
  assign celloutsig_0_1z = ~((celloutsig_0_0z[7] | in_data[47]) & in_data[89]);
  assign celloutsig_0_2z = ~((celloutsig_0_1z | celloutsig_0_1z) & celloutsig_0_0z[13]);
  assign celloutsig_0_30z = ~((celloutsig_0_6z[9] | celloutsig_0_25z[1]) & celloutsig_0_14z);
  assign celloutsig_1_14z = in_data[168] | ~(celloutsig_1_10z);
  assign celloutsig_0_11z = celloutsig_0_5z[4] | celloutsig_0_6z[2];
  assign celloutsig_0_21z = { celloutsig_0_12z[5], celloutsig_0_7z, celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_8z } & { celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_15z, celloutsig_0_11z };
  assign celloutsig_1_7z = { celloutsig_1_4z[1:0], celloutsig_1_1z } / { 1'h1, celloutsig_1_6z, in_data[96] };
  assign celloutsig_1_17z = { celloutsig_1_2z[10:1], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_6z } / { 1'h1, celloutsig_1_9z[1], celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_13z, celloutsig_1_6z, celloutsig_1_15z, celloutsig_1_14z, celloutsig_1_16z };
  assign celloutsig_1_0z = in_data[178:164] === in_data[127:113];
  assign celloutsig_1_11z = { in_data[141], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_7z } === { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_9z };
  assign celloutsig_1_16z = { celloutsig_1_12z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_15z } === { celloutsig_1_2z[11:0], celloutsig_1_13z, celloutsig_1_13z };
  assign celloutsig_0_17z = celloutsig_0_0z[8:2] === celloutsig_0_0z[12:6];
  assign celloutsig_1_15z = { in_data[182:163], celloutsig_1_9z, celloutsig_1_6z, celloutsig_1_6z } >= { celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_13z, celloutsig_1_13z, celloutsig_1_12z, celloutsig_1_13z, celloutsig_1_11z, celloutsig_1_13z, celloutsig_1_4z };
  assign celloutsig_0_10z = { celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_9z } >= { celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_5z };
  assign celloutsig_1_8z = celloutsig_1_4z[3:1] > { celloutsig_1_5z[6:5], celloutsig_1_1z };
  assign celloutsig_1_18z = { celloutsig_1_2z[2:1], celloutsig_1_13z, celloutsig_1_7z } > { celloutsig_1_2z[10], celloutsig_1_3z, celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_15z, celloutsig_1_8z };
  assign celloutsig_0_20z = { celloutsig_0_6z[8], celloutsig_0_17z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_12z } > { celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_19z[21:2], celloutsig_0_19z[17], celloutsig_0_19z[0] };
  assign celloutsig_1_19z = { celloutsig_1_16z, celloutsig_1_2z, celloutsig_1_11z, celloutsig_1_17z } <= { celloutsig_1_14z, celloutsig_1_3z, celloutsig_1_12z, celloutsig_1_15z, celloutsig_1_0z, celloutsig_1_14z, celloutsig_1_7z, celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_15z, celloutsig_1_1z, celloutsig_1_12z, celloutsig_1_6z, celloutsig_1_17z, celloutsig_1_8z };
  assign celloutsig_0_29z = { celloutsig_0_5z[4:3], celloutsig_0_18z } <= celloutsig_0_22z[3:1];
  assign celloutsig_1_3z = { celloutsig_1_2z[14:9], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z } || { celloutsig_1_2z[12:8], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_4z = { celloutsig_0_0z[11:7], celloutsig_0_1z } || in_data[57:52];
  assign celloutsig_1_13z = { celloutsig_1_11z, celloutsig_1_10z, celloutsig_1_5z } < { in_data[164:158], celloutsig_1_9z, celloutsig_1_1z };
  assign celloutsig_0_9z = { celloutsig_0_0z[4:2], celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_3z } < celloutsig_0_0z[11:6];
  assign celloutsig_0_8z = celloutsig_0_7z & ~(celloutsig_0_0z[8]);
  assign celloutsig_0_13z = celloutsig_0_3z & ~(celloutsig_0_4z);
  assign celloutsig_1_2z = { in_data[127:124], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z } % { 1'h1, in_data[137:124] };
  assign celloutsig_1_5z = { celloutsig_1_2z[8:6], celloutsig_1_4z } % { 1'h1, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_6z = { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_3z } % { 1'h1, celloutsig_0_0z[13:5] };
  assign celloutsig_0_16z = celloutsig_0_12z[10:6] % { 1'h1, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_11z };
  assign celloutsig_0_25z = { celloutsig_0_19z[17:8], celloutsig_0_11z } % { 1'h1, celloutsig_0_5z[2], celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_17z, celloutsig_0_22z, celloutsig_0_20z, celloutsig_0_20z };
  assign celloutsig_1_4z = celloutsig_1_2z[14] ? celloutsig_1_2z[10:5] : { celloutsig_1_2z[8:4], celloutsig_1_3z };
  assign celloutsig_0_5z = celloutsig_0_4z ? in_data[51:46] : { celloutsig_0_3z, 1'h0, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z };
  assign { celloutsig_0_19z[21:18], celloutsig_0_19z[16:2], celloutsig_0_19z[17], celloutsig_0_19z[0] } = celloutsig_0_9z ? { celloutsig_0_6z[4:3], celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_13z, 2'h3, celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_18z } : { celloutsig_0_0z[11:9], celloutsig_0_8z, celloutsig_0_15z, celloutsig_0_17z, celloutsig_0_13z, celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_11z };
  assign celloutsig_1_9z = celloutsig_1_7z | { celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_18z = | { celloutsig_0_17z, celloutsig_0_2z, celloutsig_0_16z };
  assign celloutsig_0_15z = celloutsig_0_11z & celloutsig_0_14z;
  assign celloutsig_1_1z = ~^ in_data[113:105];
  assign celloutsig_0_3z = ~^ in_data[44:35];
  assign celloutsig_1_10z = ~^ { celloutsig_1_2z[7:1], celloutsig_1_6z };
  assign celloutsig_1_12z = ~^ in_data[110:102];
  assign celloutsig_0_7z = ~^ celloutsig_0_0z[9:1];
  assign celloutsig_0_22z = { celloutsig_0_21z[7:5], celloutsig_0_3z } >>> { celloutsig_0_16z[4:3], celloutsig_0_13z, celloutsig_0_4z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_0z = 16'h0000;
    else if (!celloutsig_1_19z) celloutsig_0_0z = in_data[85:70];
  always_latch
    if (!clkin_data[0]) celloutsig_0_12z = 13'h0000;
    else if (celloutsig_1_19z) celloutsig_0_12z = { in_data[92:90], celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_8z };
  assign celloutsig_0_19z[1] = celloutsig_0_19z[17];
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_29z, celloutsig_0_30z };
endmodule
