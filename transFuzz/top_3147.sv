/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [2:0] _00_;
  reg [3:0] _01_;
  reg [9:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_13z;
  wire [8:0] celloutsig_0_14z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire [5:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [7:0] celloutsig_0_8z;
  wire [2:0] celloutsig_1_0z;
  wire [5:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [8:0] celloutsig_1_12z;
  wire [5:0] celloutsig_1_13z;
  wire [3:0] celloutsig_1_15z;
  wire [2:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [13:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [5:0] celloutsig_1_2z;
  wire [38:0] celloutsig_1_3z;
  wire [12:0] celloutsig_1_4z;
  wire [29:0] celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire [18:0] celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ~((in_data[49] | in_data[4]) & in_data[94]);
  assign celloutsig_0_1z = ~((celloutsig_0_0z | celloutsig_0_0z) & celloutsig_0_0z);
  assign celloutsig_1_17z = ~((celloutsig_1_10z[4] | celloutsig_1_10z[3]) & celloutsig_1_16z[2]);
  always_ff @(posedge celloutsig_1_18z[0], posedge clkin_data[64])
    if (clkin_data[64]) _00_ <= 3'h0;
    else _00_ <= { celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_3z };
  always_ff @(posedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _01_ <= 4'h0;
    else _01_ <= celloutsig_0_8z[7:4];
  always_ff @(posedge celloutsig_1_18z[0], posedge clkin_data[64])
    if (clkin_data[64]) _02_ <= 10'h000;
    else _02_ <= in_data[23:14];
  assign celloutsig_1_2z = in_data[126:121] / { 1'h1, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_19z = { celloutsig_1_5z[25:18], celloutsig_1_17z, celloutsig_1_9z, celloutsig_1_18z } === { celloutsig_1_6z[4:2], celloutsig_1_18z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_0_6z = { celloutsig_0_5z[4:2], celloutsig_0_0z } === celloutsig_0_5z[5:2];
  assign celloutsig_0_7z = in_data[28:20] === { in_data[15], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_13z = _02_[6:1] === { celloutsig_0_11z, celloutsig_0_2z, _00_, celloutsig_0_0z };
  assign celloutsig_0_3z = ! { in_data[65:57], celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_11z = ! { _00_[0], celloutsig_0_1z, celloutsig_0_7z, _00_, _01_, celloutsig_0_10z, _01_, celloutsig_0_2z, _01_ };
  assign celloutsig_1_11z = ! celloutsig_1_3z[32:29];
  assign celloutsig_0_2z = ! in_data[87:85];
  assign celloutsig_0_5z = { in_data[82:79], celloutsig_0_1z, celloutsig_0_2z } % { 1'h1, _00_[1], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_15z = celloutsig_1_4z[9:6] % { 1'h1, celloutsig_1_2z[2:0] };
  assign celloutsig_1_0z = in_data[157:155] % { 1'h1, in_data[151:150] };
  assign celloutsig_1_13z = { celloutsig_1_1z, celloutsig_1_6z } % { 1'h1, in_data[170], celloutsig_1_9z, celloutsig_1_11z };
  assign celloutsig_0_8z = { _00_[0], celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_7z, _00_, celloutsig_0_1z } * { _00_[2:1], celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_1_3z = { in_data[149:134], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z } * { in_data[134:99], celloutsig_1_0z };
  assign celloutsig_1_16z = celloutsig_1_12z[2:0] * celloutsig_1_0z;
  assign celloutsig_1_6z = - celloutsig_1_3z[27:23];
  assign celloutsig_1_8z = - in_data[188:170];
  assign celloutsig_1_9z = - celloutsig_1_3z[7:5];
  assign celloutsig_1_12z = - { celloutsig_1_6z[4:2], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_11z, celloutsig_1_1z };
  assign celloutsig_1_10z = celloutsig_1_3z[8:3] | { celloutsig_1_8z[10:8], celloutsig_1_9z };
  assign celloutsig_0_10z = ^ { celloutsig_0_3z, _01_, _01_ };
  assign celloutsig_1_1z = ^ in_data[119:111];
  assign celloutsig_0_14z = { _02_[8:6], celloutsig_0_1z, _01_, celloutsig_0_3z } >> { celloutsig_0_8z[7:2], celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_0z };
  assign celloutsig_1_5z = { celloutsig_1_3z[23:3], celloutsig_1_0z, celloutsig_1_2z } << celloutsig_1_3z[35:6];
  assign celloutsig_1_18z = { celloutsig_1_10z, celloutsig_1_17z, celloutsig_1_13z, celloutsig_1_11z } >> { celloutsig_1_1z, celloutsig_1_15z, celloutsig_1_12z };
  assign celloutsig_1_4z = { in_data[113:108], celloutsig_1_2z, celloutsig_1_1z } >> celloutsig_1_3z[34:22];
  assign { out_data[141:128], out_data[96], out_data[32], out_data[8:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_13z, celloutsig_0_14z };
endmodule
