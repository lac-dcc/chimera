/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [5:0] _00_;
  reg [5:0] _01_;
  wire [14:0] _02_;
  wire celloutsig_0_0z;
  wire [5:0] celloutsig_0_10z;
  wire celloutsig_0_3z;
  wire [4:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [5:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [8:0] celloutsig_1_12z;
  wire celloutsig_1_15z;
  wire [6:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [3:0] celloutsig_1_4z;
  wire [9:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [9:0] celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_0z = in_data[147] ? in_data[103] : in_data[160];
  assign celloutsig_0_0z = ~(in_data[43] & in_data[49]);
  assign celloutsig_1_18z = ~celloutsig_1_15z;
  reg [14:0] _06_;
  always_ff @(posedge celloutsig_1_15z, posedge clkin_data[0])
    if (clkin_data[0]) _06_ <= 15'h0000;
    else _06_ <= in_data[24:10];
  assign { _02_[14:5], _00_[5], _02_[3:0] } = _06_;
  always_ff @(negedge celloutsig_1_15z, posedge clkin_data[32])
    if (clkin_data[32]) _01_ <= 6'h00;
    else _01_ <= { _00_[5], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_17z = { in_data[143:139], celloutsig_1_6z, celloutsig_1_3z } & celloutsig_1_5z[6:0];
  assign celloutsig_1_2z = { in_data[153:152], celloutsig_1_0z } == { in_data[191:190], celloutsig_1_1z };
  assign celloutsig_0_3z = _02_[3:1] && _02_[11:9];
  assign celloutsig_0_5z = { _02_[14:5], _00_[5], _02_[3:0] } && { _02_[14:5], _00_[5], _02_[3:0] };
  assign celloutsig_1_19z = { celloutsig_1_17z[1:0], celloutsig_1_3z, celloutsig_1_3z } || celloutsig_1_17z[4:1];
  assign celloutsig_1_15z = celloutsig_1_6z & ~(celloutsig_1_12z[7]);
  assign celloutsig_0_10z = - { _01_[4:1], celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_1_5z = - { celloutsig_1_4z[1:0], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_3z };
  assign celloutsig_0_9z = { in_data[42:38], celloutsig_0_0z } | { celloutsig_0_5z, celloutsig_0_4z };
  assign celloutsig_1_9z = { celloutsig_1_5z[0], celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_2z } | { celloutsig_1_5z[9:4], celloutsig_1_4z };
  assign celloutsig_0_4z = { _01_[5:3], celloutsig_0_0z, celloutsig_0_3z } - { in_data[2:0], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_4z = in_data[137:134] - { celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_1_12z = { celloutsig_1_9z[9:2], celloutsig_1_0z } ^ { celloutsig_1_5z[7:1], celloutsig_1_0z, celloutsig_1_7z };
  assign celloutsig_1_1z = ~((in_data[129] & in_data[166]) | (celloutsig_1_0z & celloutsig_1_0z));
  assign celloutsig_1_3z = ~((celloutsig_1_0z & celloutsig_1_1z) | (in_data[174] & celloutsig_1_0z));
  assign celloutsig_1_6z = ~((celloutsig_1_5z[4] & celloutsig_1_3z) | (celloutsig_1_5z[5] & celloutsig_1_5z[1]));
  assign celloutsig_1_7z = ~((celloutsig_1_1z & celloutsig_1_2z) | (celloutsig_1_3z & in_data[101]));
  assign _00_[4:0] = { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign _02_[4] = _00_[5];
  assign { out_data[128], out_data[96], out_data[37:32], out_data[5:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_9z, celloutsig_0_10z };
endmodule
