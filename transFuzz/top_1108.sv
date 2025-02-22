/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  reg [5:0] _02_;
  reg [8:0] _03_;
  wire [3:0] _04_;
  wire [4:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [2:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [2:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire [7:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_28z;
  wire celloutsig_0_34z;
  wire [5:0] celloutsig_0_35z;
  wire celloutsig_0_3z;
  wire celloutsig_0_46z;
  wire [18:0] celloutsig_0_4z;
  wire [6:0] celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [2:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [5:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire [6:0] celloutsig_1_17z;
  wire celloutsig_1_19z;
  wire [14:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [22:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_34z = celloutsig_0_16z[0] ? celloutsig_0_11z[2] : celloutsig_0_17z;
  assign celloutsig_0_51z = celloutsig_0_46z ? celloutsig_0_11z[1] : celloutsig_0_46z;
  assign celloutsig_1_19z = ~(celloutsig_1_14z & celloutsig_1_4z);
  assign celloutsig_1_9z = !(celloutsig_1_2z ? celloutsig_1_3z[1] : in_data[99]);
  assign celloutsig_0_10z = !(celloutsig_0_3z ? celloutsig_0_1z : celloutsig_0_4z[10]);
  assign celloutsig_0_1z = !(in_data[94] ? celloutsig_0_0z[1] : celloutsig_0_0z[3]);
  assign celloutsig_0_18z = !(celloutsig_0_0z[1] ? celloutsig_0_14z : celloutsig_0_4z[7]);
  assign celloutsig_0_21z = !(celloutsig_0_11z[2] ? in_data[55] : _00_);
  reg [18:0] _13_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _13_ <= 19'h00000;
    else _13_ <= { celloutsig_1_17z, celloutsig_1_16z, celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_2z, celloutsig_1_14z, celloutsig_1_9z, celloutsig_1_12z };
  assign out_data[146:128] = _13_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _03_ <= 9'h000;
    else _03_ <= in_data[48:40];
  reg [3:0] _15_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _15_ <= 4'h0;
    else _15_ <= in_data[77:74];
  assign { _00_, _01_, _04_[1:0] } = _15_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _02_ <= 6'h00;
    else _02_ <= { in_data[23:20], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_0z = in_data[91:87] / { 1'h1, in_data[74:71] };
  assign celloutsig_1_12z = { celloutsig_1_1z[10:6], celloutsig_1_9z } / { 1'h1, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_2z };
  assign celloutsig_1_17z = { celloutsig_1_12z[5:1], celloutsig_1_13z, celloutsig_1_4z } / { 1'h1, celloutsig_1_12z[0], celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_7z };
  assign celloutsig_0_3z = { celloutsig_0_0z[3:0], _02_, celloutsig_0_1z } === { _02_, celloutsig_0_0z };
  assign celloutsig_1_2z = { celloutsig_1_1z[11:7], celloutsig_1_0z, celloutsig_1_0z } === celloutsig_1_1z[9:3];
  assign celloutsig_1_4z = celloutsig_1_1z[12:7] === { in_data[118:114], celloutsig_1_0z };
  assign celloutsig_1_10z = { celloutsig_1_3z[14:13], celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_2z } === { in_data[153:148], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_13z = { celloutsig_1_3z[17:14], celloutsig_1_6z } === { celloutsig_1_7z[2], celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_9z };
  assign celloutsig_0_12z = { _00_, _01_, _04_[1:0], celloutsig_0_9z, celloutsig_0_10z } === { celloutsig_0_4z[18:13], celloutsig_0_6z, celloutsig_0_3z };
  assign celloutsig_0_14z = celloutsig_0_9z === { celloutsig_0_4z[6], celloutsig_0_4z[6], celloutsig_0_4z[4] };
  assign celloutsig_0_17z = { _02_[2:1], _02_, celloutsig_0_3z } === { celloutsig_0_11z[1:0], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_13z };
  assign celloutsig_0_28z = { _03_[7:4], celloutsig_0_14z } === { celloutsig_0_16z, celloutsig_0_21z, celloutsig_0_24z };
  assign celloutsig_1_6z = celloutsig_1_5z[2:0] <= celloutsig_1_3z[9:7];
  assign celloutsig_1_0z = ! in_data[151:149];
  assign celloutsig_1_14z = ! { celloutsig_1_3z[11], celloutsig_1_12z, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_0_6z = ! { _02_[4:2], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_1_16z = ! celloutsig_1_3z[22:14];
  assign celloutsig_0_46z = { celloutsig_0_35z[3:0], celloutsig_0_23z, celloutsig_0_3z } || { _03_[6:2], celloutsig_0_28z, celloutsig_0_18z, celloutsig_0_35z };
  assign celloutsig_0_5z = { in_data[39:32], celloutsig_0_3z } || { _02_[4:1], celloutsig_0_0z };
  assign celloutsig_0_13z = { _02_[2:1], celloutsig_0_3z, _03_ } || { celloutsig_0_4z[11:6], celloutsig_0_4z[6], celloutsig_0_4z[4:1], celloutsig_0_12z };
  assign celloutsig_0_11z = { _01_, _04_[1], celloutsig_0_6z } % { 1'h1, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_50z = ~ { celloutsig_0_46z, celloutsig_0_35z };
  assign celloutsig_1_7z = ~ celloutsig_1_5z[2:0];
  assign celloutsig_0_9z = ~ { _00_, _01_, _04_[1] };
  assign celloutsig_0_24z = celloutsig_0_11z[0] & celloutsig_0_5z;
  assign celloutsig_0_35z = { _02_[5:1], celloutsig_0_34z } >> { celloutsig_0_4z[14:11], celloutsig_0_14z, celloutsig_0_18z };
  assign celloutsig_1_5z = { celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_0z } >> celloutsig_1_1z[4:1];
  assign celloutsig_0_16z = celloutsig_0_9z >> celloutsig_0_9z;
  assign celloutsig_1_3z = in_data[146:124] << { in_data[135:129], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_1z = { in_data[148:137], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } <<< in_data[158:144];
  assign celloutsig_0_23z = { celloutsig_0_11z[2:1], _00_, _01_, _04_[1:0], celloutsig_0_1z, celloutsig_0_14z } <<< { celloutsig_0_16z[2:1], celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_13z };
  assign { celloutsig_0_4z[6], celloutsig_0_4z[18:7], celloutsig_0_4z[4:0] } = ~ { celloutsig_0_3z, in_data[67:56], celloutsig_0_0z };
  assign _04_[3:2] = { _00_, _01_ };
  assign celloutsig_0_4z[5] = celloutsig_0_4z[6];
  assign { out_data[96], out_data[38:32], out_data[0] } = { celloutsig_1_19z, celloutsig_0_50z, celloutsig_0_51z };
endmodule
