/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [2:0] _00_;
  reg [21:0] _01_;
  reg [9:0] _02_;
  wire [10:0] _03_;
  wire [13:0] celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [4:0] celloutsig_0_16z;
  wire [11:0] celloutsig_0_17z;
  wire [3:0] celloutsig_0_1z;
  wire [8:0] celloutsig_0_22z;
  wire [36:0] celloutsig_0_2z;
  wire celloutsig_0_42z;
  wire [9:0] celloutsig_0_43z;
  wire [4:0] celloutsig_0_5z;
  wire [13:0] celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  wire [19:0] celloutsig_1_11z;
  wire [11:0] celloutsig_1_12z;
  wire [27:0] celloutsig_1_13z;
  wire [7:0] celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [8:0] celloutsig_1_1z;
  wire [10:0] celloutsig_1_2z;
  wire [20:0] celloutsig_1_3z;
  wire [7:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [6:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_7z = ~(celloutsig_1_1z[3] & celloutsig_1_0z);
  assign celloutsig_1_10z = { celloutsig_1_1z[3:2], celloutsig_1_7z } + _00_;
  assign celloutsig_1_14z = celloutsig_1_1z[8:1] + celloutsig_1_12z[11:4];
  assign celloutsig_0_1z = in_data[4:1] + celloutsig_0_0z[7:4];
  assign celloutsig_0_2z = in_data[77:41] + { in_data[90:86], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  always_ff @(negedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _01_ <= 22'h000000;
    else _01_ <= { in_data[38:19], celloutsig_0_8z, celloutsig_0_12z };
  always_ff @(negedge clkin_data[32], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _02_ <= 10'h000;
    else _02_ <= { celloutsig_0_2z[29:24], celloutsig_0_1z };
  reg [10:0] _11_;
  always_ff @(negedge clkin_data[64], negedge clkin_data[128])
    if (!clkin_data[128]) _11_ <= 11'h000;
    else _11_ <= { celloutsig_1_3z[17:15], celloutsig_1_6z, celloutsig_1_0z };
  assign { _03_[10:5], _00_, _03_[1:0] } = _11_;
  assign celloutsig_1_2z = { in_data[183:174], celloutsig_1_0z } & { in_data[172], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_6z = in_data[124:118] & { celloutsig_1_3z[9], celloutsig_1_1z[8:3] };
  assign celloutsig_1_13z = { in_data[140:118], celloutsig_1_10z, celloutsig_1_9z, celloutsig_1_0z } & { in_data[119:101], celloutsig_1_1z };
  assign celloutsig_0_6z = { celloutsig_0_0z[13:4], celloutsig_0_1z } & celloutsig_0_0z;
  assign celloutsig_0_16z = { celloutsig_0_5z[4:2], celloutsig_0_11z, celloutsig_0_8z } & celloutsig_0_6z[9:5];
  assign celloutsig_0_17z = { celloutsig_0_5z[4:2], celloutsig_0_1z, celloutsig_0_16z } / { 1'h1, in_data[82:72] };
  assign celloutsig_1_18z = { celloutsig_1_14z[2:0], celloutsig_1_7z } === celloutsig_1_13z[15:12];
  assign celloutsig_0_42z = celloutsig_0_6z[13:9] > celloutsig_0_22z[6:2];
  assign celloutsig_1_9z = { celloutsig_1_1z[6:4], celloutsig_1_5z } > { celloutsig_1_2z[8:6], celloutsig_1_5z };
  assign celloutsig_1_19z = celloutsig_1_13z[12:10] > celloutsig_1_11z[18:16];
  assign celloutsig_0_8z = celloutsig_0_1z[2] & ~(celloutsig_0_0z[9]);
  assign celloutsig_0_11z = celloutsig_0_0z[13] & ~(in_data[58]);
  assign celloutsig_1_12z = { in_data[140:139], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_5z } % { 1'h1, _03_[10:5], _00_, _03_[1:0] };
  assign celloutsig_0_43z = _02_ * _01_[15:6];
  assign celloutsig_1_1z = in_data[129:121] * { in_data[173:167], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_3z[20:9] = in_data[113] ? { in_data[176:174], celloutsig_1_1z } : { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_5z = { celloutsig_1_3z[10:9], celloutsig_1_1z[8] } != celloutsig_1_2z[4:2];
  assign celloutsig_0_5z = ~ celloutsig_0_2z[5:1];
  assign celloutsig_1_11z = ~ in_data[142:123];
  assign celloutsig_0_0z = in_data[75:62] | in_data[38:25];
  assign celloutsig_1_4z = in_data[115:108] | { celloutsig_1_3z[9], celloutsig_1_1z[8:2] };
  assign celloutsig_1_0z = ^ in_data[139:132];
  assign celloutsig_0_12z = ^ celloutsig_0_1z[3:1];
  assign celloutsig_0_22z = celloutsig_0_17z[10:2] << { in_data[72:65], celloutsig_0_12z };
  assign _03_[4:2] = _00_;
  assign celloutsig_1_3z[8:0] = celloutsig_1_1z;
  assign { out_data[128], out_data[96], out_data[32], out_data[9:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_42z, celloutsig_0_43z };
endmodule
