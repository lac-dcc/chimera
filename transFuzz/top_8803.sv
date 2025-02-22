/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [10:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [6:0] celloutsig_0_11z;
  wire [3:0] celloutsig_0_1z;
  wire celloutsig_0_2z;
  reg [2:0] celloutsig_0_3z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [21:0] celloutsig_0_7z;
  wire [8:0] celloutsig_1_0z;
  wire [12:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [4:0] celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire [17:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [11:0] celloutsig_1_1z;
  wire [17:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [5:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_12z = ~celloutsig_1_8z;
  assign celloutsig_1_1z = in_data[184:173] + { in_data[141:139], celloutsig_1_0z };
  assign celloutsig_0_1z = { in_data[87:85], celloutsig_0_0z } + in_data[89:86];
  assign celloutsig_1_2z = { celloutsig_1_1z[10:5], celloutsig_1_1z } + { celloutsig_1_0z[6:1], celloutsig_1_1z };
  always_ff @(negedge clkin_data[32], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _00_ <= 11'h000;
    else _00_ <= { in_data[90:84], celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_0_7z = { in_data[94:74], celloutsig_0_5z } / { 1'h1, _00_[9:1], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_1_7z = in_data[191:177] === { celloutsig_1_1z[3:2], celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_1_9z = { celloutsig_1_0z[7:5], celloutsig_1_7z } === { in_data[132:130], celloutsig_1_4z };
  assign celloutsig_0_0z = in_data[26:18] >= in_data[14:6];
  assign celloutsig_1_4z = celloutsig_1_1z[6:2] <= in_data[157:153];
  assign celloutsig_1_13z = { celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_4z } || { celloutsig_1_12z, celloutsig_1_4z, celloutsig_1_11z };
  assign celloutsig_1_11z = { celloutsig_1_1z[11:1], celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_6z } < { celloutsig_1_1z[9], celloutsig_1_4z, celloutsig_1_8z, celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_7z };
  assign celloutsig_1_19z = { celloutsig_1_10z[6:2], celloutsig_1_13z, celloutsig_1_14z } != { celloutsig_1_10z[11:3], celloutsig_1_12z, celloutsig_1_7z };
  assign celloutsig_1_0z = - in_data[105:97];
  assign celloutsig_1_10z = - { in_data[153:148], celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_6z, celloutsig_1_9z };
  assign celloutsig_1_18z = - { celloutsig_1_10z[10:0], celloutsig_1_16z, celloutsig_1_7z, celloutsig_1_14z };
  assign celloutsig_1_5z = ~ in_data[185:180];
  assign celloutsig_1_14z = { celloutsig_1_0z[1], celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_9z, celloutsig_1_6z } | { celloutsig_1_5z[3:0], celloutsig_1_4z };
  assign celloutsig_0_6z = & in_data[89:40];
  assign celloutsig_0_10z = & { celloutsig_0_7z[15], _00_, celloutsig_0_2z };
  assign celloutsig_1_3z = & celloutsig_1_2z[14:8];
  assign celloutsig_1_6z = & in_data[160:151];
  assign celloutsig_0_5z = | { in_data[22:11], celloutsig_0_2z };
  assign celloutsig_0_2z = celloutsig_0_1z[3] & celloutsig_0_0z;
  assign celloutsig_1_8z = ^ { celloutsig_1_5z[4], celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_1_16z = ^ celloutsig_1_0z[8:5];
  assign celloutsig_0_11z = { celloutsig_0_1z[2:0], celloutsig_0_10z, celloutsig_0_3z } ^ { in_data[72], celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_6z };
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_3z = 3'h0;
    else if (clkin_data[0]) celloutsig_0_3z = { in_data[17:16], celloutsig_0_0z };
  assign { out_data[145:128], out_data[96], out_data[32], out_data[6:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_10z, celloutsig_0_11z };
endmodule
