/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [2:0] _01_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [71:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_1z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [3:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[65] ? in_data[39] : in_data[69];
  assign celloutsig_0_8z = celloutsig_0_1z ? celloutsig_0_6z : in_data[79];
  assign celloutsig_1_3z = in_data[155] ? celloutsig_1_2z[7] : celloutsig_1_1z;
  assign celloutsig_1_10z = celloutsig_1_4z ? celloutsig_1_9z : celloutsig_1_2z[6];
  assign celloutsig_1_19z = !(in_data[155] ? celloutsig_1_15z : celloutsig_1_10z);
  assign celloutsig_1_1z = ~((in_data[174] | in_data[157]) & (in_data[148] | in_data[99]));
  assign celloutsig_0_9z = celloutsig_0_5z[4] | ~(_00_);
  assign celloutsig_1_5z = celloutsig_1_3z ^ celloutsig_1_4z;
  assign celloutsig_1_15z = celloutsig_1_3z ^ celloutsig_1_7z;
  reg [2:0] _11_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _11_ <= 3'h0;
    else _11_ <= { in_data[25:24], celloutsig_0_1z };
  assign { _01_[2], _00_, _01_[0] } = _11_;
  assign celloutsig_0_5z = { in_data[9], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z } / { 1'h1, in_data[89:86] };
  assign celloutsig_0_13z = { in_data[66:21], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, _01_[2], _00_, _01_[0], celloutsig_0_7z, _01_[2], _00_, _01_[0], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_8z, _01_[2], _00_, _01_[0] } / { 1'h1, in_data[66:51], celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_6z, _01_[2], _00_, _01_[0], celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_10z, _01_[2], _00_, _01_[0], celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_12z };
  assign celloutsig_1_18z = { celloutsig_1_2z[6:1], celloutsig_1_8z, celloutsig_1_17z } < celloutsig_1_2z[7:0];
  assign celloutsig_1_7z = { in_data[152], celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_6z } < { celloutsig_1_2z[6:5], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_3z };
  assign celloutsig_1_9z = celloutsig_1_2z[6] & ~(in_data[100]);
  assign celloutsig_1_12z = celloutsig_1_5z & ~(celloutsig_1_3z);
  assign celloutsig_0_6z = & in_data[57:36];
  assign celloutsig_0_1z = & in_data[42:39];
  assign celloutsig_0_10z = | { celloutsig_0_7z[1:0], _01_[2], _00_, _01_[0] };
  assign celloutsig_1_4z = | celloutsig_1_2z[6:3];
  assign celloutsig_0_12z = | { _00_, _01_[2], _01_[0] };
  assign celloutsig_1_8z = | { celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_2z[8:6] };
  assign celloutsig_0_7z = { _01_[2], _00_, _01_[0], celloutsig_0_1z } >>> { in_data[8:6], celloutsig_0_1z };
  assign celloutsig_1_2z = in_data[156:148] ^ in_data[140:132];
  assign celloutsig_1_17z = ~((celloutsig_1_7z & celloutsig_1_12z) | celloutsig_1_9z);
  assign celloutsig_0_11z = ~((celloutsig_0_1z & celloutsig_0_5z[0]) | celloutsig_0_0z);
  assign celloutsig_0_14z = ~((celloutsig_0_0z & celloutsig_0_1z) | celloutsig_0_9z);
  assign celloutsig_1_6z = ~((in_data[121] & celloutsig_1_4z) | celloutsig_1_2z[2]);
  assign _01_[1] = _00_;
  assign { out_data[128], out_data[96], out_data[63:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_13z[71:40], celloutsig_0_14z };
endmodule
