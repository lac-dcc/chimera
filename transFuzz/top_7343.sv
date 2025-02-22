/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [10:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  reg [9:0] celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire [20:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [22:0] celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire [4:0] celloutsig_1_18z;
  wire [8:0] celloutsig_1_19z;
  wire [8:0] celloutsig_1_1z;
  wire [16:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [6:0] celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_15z = ~((in_data[54] | celloutsig_0_2z) & celloutsig_0_10z);
  assign celloutsig_0_10z = celloutsig_0_2z | celloutsig_0_3z;
  assign celloutsig_1_6z = celloutsig_1_5z[0] | in_data[136];
  assign celloutsig_0_3z = celloutsig_0_1z ^ celloutsig_0_2z;
  assign celloutsig_0_0z = in_data[19:9] & in_data[83:73];
  assign celloutsig_1_0z = in_data[173:171] & in_data[169:167];
  assign celloutsig_1_2z = { in_data[105:98], celloutsig_1_1z } & { in_data[175:168], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_1z = in_data[149:141] / { 1'h1, in_data[160:153] };
  assign celloutsig_1_4z = in_data[111:105] / { 1'h1, in_data[178:173] };
  assign celloutsig_1_18z = { celloutsig_1_12z[11:10], celloutsig_1_14z, celloutsig_1_8z, celloutsig_1_6z } / { 1'h1, celloutsig_1_10z[18:17], celloutsig_1_6z, celloutsig_1_11z };
  assign celloutsig_1_19z = celloutsig_1_2z[9:1] / { 1'h1, celloutsig_1_10z[9:2] };
  assign celloutsig_1_12z = ~ { in_data[151:133], celloutsig_1_5z, celloutsig_1_3z };
  assign celloutsig_0_14z = | { celloutsig_0_13z, celloutsig_0_9z[7:0] };
  assign celloutsig_1_3z = | { celloutsig_1_2z, in_data[142:130] };
  assign celloutsig_0_4z = ^ celloutsig_0_0z[10:1];
  assign celloutsig_0_13z = ^ { in_data[50:36], celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_1z = ^ in_data[80:52];
  assign celloutsig_0_2z = ^ celloutsig_0_0z[6:4];
  assign celloutsig_1_8z = ^ celloutsig_1_2z[12:9];
  assign celloutsig_1_11z = ^ { celloutsig_1_1z[1], celloutsig_1_5z };
  assign celloutsig_1_14z = ^ { in_data[109:97], celloutsig_1_11z, celloutsig_1_4z };
  assign celloutsig_1_5z = celloutsig_1_4z[3:1] <<< { in_data[142:141], celloutsig_1_3z };
  assign celloutsig_1_10z = in_data[131:111] - { celloutsig_1_2z[5:4], celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_2z };
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_9z = 10'h000;
    else if (!clkin_data[0]) celloutsig_0_9z = { in_data[86:80], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_4z };
  assign { out_data[132:128], out_data[104:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_14z, celloutsig_0_15z };
endmodule
