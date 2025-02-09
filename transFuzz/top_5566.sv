/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [2:0] _01_;
  wire [12:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire [16:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [7:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [28:0] celloutsig_0_19z;
  wire celloutsig_0_21z;
  wire celloutsig_0_24z;
  wire [11:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_6z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[51] ? in_data[65] : in_data[93];
  assign celloutsig_0_16z = in_data[41] ? in_data[73] : celloutsig_0_0z;
  assign celloutsig_1_6z = celloutsig_1_18z ? celloutsig_1_0z : in_data[109];
  assign celloutsig_0_6z = celloutsig_0_16z ? celloutsig_0_5z[11] : celloutsig_0_0z;
  assign celloutsig_0_10z = in_data[91] ? celloutsig_0_16z : celloutsig_0_21z;
  assign celloutsig_0_24z = celloutsig_0_19z[11] ? celloutsig_0_14z : celloutsig_0_21z;
  assign celloutsig_1_18z = in_data[117] ? in_data[174] : in_data[191];
  assign celloutsig_1_19z = ~celloutsig_1_6z;
  assign celloutsig_0_21z = ~out_data[0];
  assign celloutsig_0_9z = ~in_data[91];
  assign celloutsig_0_11z = ~celloutsig_0_16z;
  assign celloutsig_0_14z = ~celloutsig_0_12z[5];
  assign celloutsig_1_0z = ~in_data[145];
  reg [2:0] _16_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_6z)
    if (!celloutsig_1_6z) _16_ <= 3'h0;
    else _16_ <= { _01_[2:1], celloutsig_0_16z };
  assign celloutsig_0_15z[3:1] = _16_;
  reg [12:0] _17_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_6z)
    if (celloutsig_1_6z) _17_ <= 13'h0000;
    else _17_ <= in_data[44:32];
  assign { _02_[12], out_data[0], _02_[10], _00_, _02_[8:4], _01_[2:1], _02_[1:0] } = _17_;
  assign celloutsig_0_5z = out_data[0] ? { in_data[24:16], celloutsig_0_21z, celloutsig_0_0z, celloutsig_0_16z } : { 1'h0, _02_[10], _00_, _02_[8:4], _01_[2:1], _02_[1:0] };
  assign celloutsig_0_12z = celloutsig_0_16z ? { celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_21z } : { _02_[6:4], _01_[2], 1'h0, celloutsig_0_0z };
  assign { celloutsig_0_13z[16:11], celloutsig_0_13z[9:5], celloutsig_0_13z[3], celloutsig_0_13z[10], celloutsig_0_13z[0] } = celloutsig_0_15z[2] ? { in_data[20:15], celloutsig_0_15z[3], 1'h1, celloutsig_0_15z[1], celloutsig_0_16z, celloutsig_0_21z, celloutsig_0_21z, celloutsig_0_16z, celloutsig_0_11z } : { celloutsig_0_12z[5:1], celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_16z, celloutsig_0_0z, celloutsig_0_0z };
  assign { celloutsig_0_15z[7:5], celloutsig_0_15z[0] } = celloutsig_0_16z ? { celloutsig_0_12z[3:1], celloutsig_0_11z } : { celloutsig_0_11z, celloutsig_0_11z, 2'h0 };
  assign celloutsig_0_19z = _02_[7] ? { celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_15z[7:5], celloutsig_0_6z, celloutsig_0_15z[3:0], celloutsig_0_21z, celloutsig_0_9z, celloutsig_0_13z[16:5], celloutsig_0_21z, celloutsig_0_13z[3], celloutsig_0_13z[10], celloutsig_0_16z, celloutsig_0_13z[0] } : { in_data[91:64], celloutsig_0_16z };
  assign _01_[0] = celloutsig_0_16z;
  assign { _02_[11], _02_[9], _02_[3:2] } = { out_data[0], _00_, _01_[2:1] };
  assign { celloutsig_0_13z[4], celloutsig_0_13z[2:1] } = { celloutsig_0_21z, celloutsig_0_13z[10], celloutsig_0_16z };
  assign celloutsig_0_15z[4] = celloutsig_0_6z;
  assign { out_data[128], out_data[96], out_data[32] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_24z };
endmodule
