/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [3:0] _01_;
  wire [10:0] _02_;
  reg [11:0] _03_;
  wire [14:0] celloutsig_0_0z;
  wire [3:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [19:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [3:0] celloutsig_0_17z;
  wire [11:0] celloutsig_0_19z;
  wire [7:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [16:0] celloutsig_0_3z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [8:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [4:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [6:0] celloutsig_1_13z;
  wire [3:0] celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [3:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [5:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_12z = !(celloutsig_0_7z ? celloutsig_0_1z[0] : celloutsig_0_6z);
  assign celloutsig_1_1z = !(celloutsig_1_0z[5] ? celloutsig_1_0z[8] : in_data[148]);
  assign celloutsig_0_6z = ~(in_data[29] | in_data[49]);
  assign celloutsig_0_9z = ~(in_data[71] | _00_);
  assign celloutsig_0_27z = ~(celloutsig_0_22z | celloutsig_0_21z);
  assign celloutsig_1_9z = ~((celloutsig_1_2z[3] | celloutsig_1_5z[5]) & (celloutsig_1_3z | celloutsig_1_4z));
  assign celloutsig_1_16z = ~(celloutsig_1_5z[1] ^ in_data[184]);
  assign celloutsig_0_7z = ~(celloutsig_0_6z ^ in_data[47]);
  assign celloutsig_0_2z = ~(celloutsig_0_0z[9] ^ celloutsig_0_0z[0]);
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _01_ <= 4'h0;
    else _01_ <= { 2'h3, celloutsig_1_3z, celloutsig_1_1z };
  reg [10:0] _14_;
  always_ff @(negedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _14_ <= 11'h000;
    else _14_ <= celloutsig_0_3z[16:6];
  assign { _02_[10:2], _00_, _02_[0] } = _14_;
  always_ff @(negedge celloutsig_1_19z, negedge clkin_data[64])
    if (!clkin_data[64]) _03_ <= 12'h000;
    else _03_ <= { in_data[89:79], celloutsig_0_8z };
  assign celloutsig_0_3z = { celloutsig_0_0z[13:1], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z } / { 1'h1, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_1_5z = { in_data[167:163], celloutsig_1_1z } / { 1'h1, celloutsig_1_0z[6:2] };
  assign celloutsig_1_0z = in_data[183:175] / { 1'h1, in_data[179:172] };
  assign celloutsig_0_28z = { celloutsig_0_17z[3:1], celloutsig_0_14z } === { celloutsig_0_1z[7:5], celloutsig_0_20z };
  assign celloutsig_1_4z = { celloutsig_1_0z, celloutsig_1_3z } || 1'h1;
  assign celloutsig_1_10z = { celloutsig_1_5z[4:0], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_8z } || { celloutsig_1_0z[5:0], celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_1_8z = { in_data[190:181], celloutsig_1_4z } < { celloutsig_1_5z[4:0], _01_, celloutsig_1_4z, celloutsig_1_6z };
  assign celloutsig_1_11z = { 2'h3, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_10z } * { celloutsig_1_2z[3:2], 2'h3, celloutsig_1_4z };
  assign celloutsig_0_1z = celloutsig_0_0z[14:7] * celloutsig_0_0z[8:1];
  assign celloutsig_0_17z = { in_data[95:93], celloutsig_0_11z } * in_data[84:81];
  assign celloutsig_0_19z = in_data[76:65] * { celloutsig_0_13z[16:6], celloutsig_0_12z };
  assign celloutsig_1_14z = celloutsig_1_6z ? celloutsig_1_2z[8:5] : { celloutsig_1_13z[5:4], celloutsig_1_12z, 1'h0 };
  assign celloutsig_0_10z[3:2] = celloutsig_0_3z[1] ? { celloutsig_0_6z, celloutsig_0_8z } : { celloutsig_0_8z, celloutsig_0_9z };
  assign celloutsig_1_12z = { _01_[0], celloutsig_1_8z, _01_ } !== { celloutsig_1_0z[5], celloutsig_1_11z };
  assign celloutsig_1_17z = { celloutsig_1_14z[2:0], celloutsig_1_16z } !== { celloutsig_1_5z[2:1], celloutsig_1_8z, celloutsig_1_9z };
  assign celloutsig_0_14z = { celloutsig_0_13z[9:6], celloutsig_0_9z } !== { celloutsig_0_0z[13:12], celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_8z };
  assign celloutsig_0_8z = | { celloutsig_0_6z, celloutsig_0_0z[11:10] };
  assign celloutsig_0_21z = | celloutsig_0_19z[6:0];
  assign celloutsig_0_22z = | { celloutsig_0_12z, celloutsig_0_3z[16:10], celloutsig_0_2z };
  assign celloutsig_1_19z = ~^ { celloutsig_1_0z[7:4], celloutsig_1_18z };
  assign celloutsig_1_3z = ^ celloutsig_1_0z[4:0];
  assign celloutsig_1_6z = ^ { celloutsig_1_2z[3:2], 1'h1 };
  assign celloutsig_0_11z = ^ { celloutsig_0_3z[8:7], celloutsig_0_6z };
  assign celloutsig_0_20z = ^ _03_[9:3];
  assign celloutsig_1_18z = celloutsig_1_13z[4:1] << { _01_[2:1], celloutsig_1_8z, celloutsig_1_17z };
  assign celloutsig_0_13z = { in_data[43:38], celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_2z, _02_[10:2], _00_, _02_[0] } <<< { celloutsig_0_3z[16:7], celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_10z[3:2], celloutsig_0_8z, celloutsig_0_10z[2], celloutsig_0_10z[3:2], celloutsig_0_8z, celloutsig_0_10z[2] };
  assign celloutsig_0_0z = in_data[31:17] ~^ in_data[48:34];
  assign celloutsig_1_13z = { celloutsig_1_5z[5:1], celloutsig_1_8z, celloutsig_1_4z } ~^ { celloutsig_1_1z, celloutsig_1_3z, _01_, celloutsig_1_6z };
  assign celloutsig_1_2z[8:2] = in_data[121:115] ~^ { celloutsig_1_0z[8:3], celloutsig_1_1z };
  assign _02_[1] = _00_;
  assign celloutsig_0_10z[1:0] = { celloutsig_0_8z, celloutsig_0_10z[2] };
  assign celloutsig_1_2z[1:0] = 2'h3;
  assign { out_data[131:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_27z, celloutsig_0_28z };
endmodule
