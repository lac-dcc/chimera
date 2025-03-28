/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [24:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_12z;
  wire [24:0] celloutsig_0_13z;
  wire celloutsig_0_16z;
  wire [4:0] celloutsig_0_17z;
  wire celloutsig_0_1z;
  wire [12:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire [6:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [12:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [7:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [7:0] celloutsig_1_2z;
  wire [8:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [6:0] celloutsig_1_5z;
  wire [28:0] celloutsig_1_6z;
  wire [14:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[75] ? in_data[84] : in_data[55];
  assign celloutsig_1_14z = celloutsig_1_9z ? in_data[97] : in_data[145];
  assign celloutsig_1_15z = celloutsig_1_7z[2] ? celloutsig_1_12z : celloutsig_1_1z;
  assign celloutsig_1_17z = celloutsig_1_2z[3] ? celloutsig_1_12z : celloutsig_1_14z;
  assign celloutsig_0_5z = celloutsig_0_0z ? celloutsig_0_4z[6] : in_data[17];
  assign celloutsig_0_12z = celloutsig_0_0z ? celloutsig_0_1z : celloutsig_0_5z;
  assign celloutsig_0_16z = celloutsig_0_0z ? celloutsig_0_5z : in_data[28];
  assign celloutsig_1_0z = in_data[140] ? in_data[191] : in_data[116];
  assign celloutsig_0_2z = celloutsig_0_0z ? celloutsig_0_1z : in_data[59];
  assign celloutsig_0_3z = ~in_data[28];
  assign celloutsig_0_13z = { celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_2z, in_data[28], _00_[20:15], celloutsig_0_10z, _00_[13:1], celloutsig_0_12z } + { _00_[13:1], in_data[28], celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_1_3z = { celloutsig_1_1z, celloutsig_1_2z } + in_data[109:101];
  assign celloutsig_1_5z = { celloutsig_1_3z[5:0], celloutsig_1_1z } + celloutsig_1_2z[6:0];
  assign celloutsig_1_6z = { in_data[178:167], celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_5z } + in_data[179:151];
  reg [5:0] _15_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[32])
    if (clkin_data[32]) _15_ <= 6'h00;
    else _15_ <= { celloutsig_0_4z[6:2], celloutsig_0_7z };
  assign _00_[20:15] = _15_;
  reg [12:0] _16_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _16_ <= 13'h0000;
    else _16_ <= in_data[83:71];
  assign _00_[13:1] = _16_;
  assign celloutsig_1_9z = { celloutsig_1_3z[6:5], celloutsig_1_4z, celloutsig_1_1z } <= { celloutsig_1_6z[12:10], celloutsig_1_0z };
  assign celloutsig_1_12z = { celloutsig_1_11z[6:3], celloutsig_1_8z, celloutsig_1_0z } <= celloutsig_1_11z[11:6];
  assign celloutsig_1_16z = { celloutsig_1_11z[7:2], celloutsig_1_12z } <= celloutsig_1_3z[8:2];
  assign celloutsig_0_7z = { in_data[66:65], celloutsig_0_4z, in_data[28], in_data[28], in_data[28], celloutsig_0_2z } <= { in_data[51:40], celloutsig_0_5z };
  assign celloutsig_0_9z = { celloutsig_0_4z[4], celloutsig_0_3z, celloutsig_0_2z } <= { in_data[28], celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_1z = { in_data[16:0], celloutsig_0_0z } <= in_data[55:38];
  assign celloutsig_0_21z = { celloutsig_0_13z[13:7], celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_17z } <= { _00_[4], celloutsig_0_20z };
  assign celloutsig_1_1z = { in_data[100], celloutsig_1_0z, celloutsig_1_0z } <= in_data[183:181];
  assign celloutsig_0_4z = { in_data[58:54], celloutsig_0_2z, celloutsig_0_0z } % { 1'h1, in_data[68], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z, in_data[0] };
  assign celloutsig_1_8z = { celloutsig_1_2z[3:1], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_5z } != { in_data[178:160], celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_1_18z = { celloutsig_1_5z[4:3], celloutsig_1_0z, celloutsig_1_5z } != { celloutsig_1_2z[7:2], celloutsig_1_14z, celloutsig_1_1z, celloutsig_1_15z, celloutsig_1_0z };
  assign celloutsig_1_19z = { in_data[113:104], celloutsig_1_16z, celloutsig_1_17z, celloutsig_1_1z } != { in_data[158:157], celloutsig_1_18z, celloutsig_1_13z, celloutsig_1_4z, celloutsig_1_8z };
  assign celloutsig_0_10z = { celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_0z, in_data[28], celloutsig_0_5z } != in_data[69:65];
  assign celloutsig_1_4z = { celloutsig_1_3z[3:1], celloutsig_1_1z } != celloutsig_1_2z[4:1];
  assign celloutsig_1_7z = celloutsig_1_6z[25:11] ^ in_data[191:177];
  assign celloutsig_1_11z = { celloutsig_1_5z[5:1], celloutsig_1_2z } ^ celloutsig_1_6z[23:11];
  assign celloutsig_1_13z = celloutsig_1_6z[13:6] ^ { in_data[178:173], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_17z = celloutsig_0_4z[4:0] ^ { celloutsig_0_13z[16:15], celloutsig_0_16z, celloutsig_0_9z, celloutsig_0_7z };
  assign celloutsig_0_20z = { _00_[13:2], celloutsig_0_0z } ^ { in_data[8:1], in_data[28], celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_16z };
  assign celloutsig_1_2z = in_data[163:156] ^ { in_data[172:166], celloutsig_1_1z };
  assign { _00_[24:21], _00_[14], _00_[0] } = { celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_2z, in_data[28], celloutsig_0_10z, celloutsig_0_12z };
  assign { out_data[128], out_data[96], out_data[44:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_20z, celloutsig_0_21z };
endmodule
