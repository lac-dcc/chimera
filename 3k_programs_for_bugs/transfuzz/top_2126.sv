/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [3:0] _00_;
  reg [3:0] _01_;
  reg [11:0] _02_;
  reg [11:0] _03_;
  wire [7:0] _04_;
  reg [6:0] _05_;
  wire celloutsig_0_0z;
  wire [4:0] celloutsig_0_10z;
  wire [10:0] celloutsig_0_11z;
  wire celloutsig_0_13z;
  wire celloutsig_0_16z;
  wire celloutsig_0_18z;
  wire [12:0] celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire [2:0] celloutsig_0_23z;
  wire [3:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire [16:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [14:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire celloutsig_1_15z;
  wire [13:0] celloutsig_1_17z;
  wire [3:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire [20:0] celloutsig_1_2z;
  wire [8:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [10:0] celloutsig_1_7z;
  wire [3:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[64])
    if (clkin_data[64]) _01_ <= 4'h0;
    else _01_ <= _00_;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[32])
    if (clkin_data[32]) _02_ <= 12'h000;
    else _02_ <= { in_data[67:61], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_3z };
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _03_ <= 12'h000;
    else _03_ <= in_data[146:135];
  reg [7:0] _09_;
  always_ff @(posedge celloutsig_1_18z[0], negedge clkin_data[32])
    if (!clkin_data[32]) _09_ <= 8'h00;
    else _09_ <= { in_data[11:9], celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_0z };
  assign { _04_[7], _00_, _04_[2:0] } = _09_;
  always_ff @(posedge celloutsig_1_18z[0], negedge clkin_data[64])
    if (!clkin_data[64]) _05_ <= 7'h00;
    else _05_ <= { _02_[8:3], celloutsig_0_0z };
  assign celloutsig_0_0z = in_data[14:8] > in_data[88:82];
  assign celloutsig_0_3z = in_data[85:76] > in_data[63:54];
  assign celloutsig_1_5z = celloutsig_1_2z[3:0] > { celloutsig_1_1z[2:1], 1'h0, celloutsig_1_0z };
  assign celloutsig_1_19z = { celloutsig_1_1z[3:1], 1'h0 } > celloutsig_1_17z[13:10];
  assign celloutsig_0_8z = celloutsig_0_1z[9:1] > { celloutsig_0_29z[3], celloutsig_0_7z[7:2], celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_0_18z = { _02_[5:1], _04_[7], _00_, _04_[2:0] } > { 1'h0, celloutsig_0_7z[12:9], celloutsig_0_29z[3], celloutsig_0_7z[7:1] };
  assign celloutsig_0_2z = in_data[78:68] > in_data[75:65];
  assign celloutsig_0_21z = { celloutsig_0_7z[14], 1'h0, celloutsig_0_7z[12] } > celloutsig_0_10z[3:1];
  assign celloutsig_0_37z = { celloutsig_0_23z, celloutsig_0_13z } != celloutsig_0_11z[3:0];
  assign celloutsig_0_38z = { _01_, celloutsig_0_8z, celloutsig_0_16z } != _05_[6:1];
  assign celloutsig_1_0z = in_data[181:168] != in_data[160:147];
  assign celloutsig_1_4z = { celloutsig_1_1z[1], 1'h0, celloutsig_1_0z } != { celloutsig_1_3z[5:4], in_data[150] };
  assign celloutsig_1_15z = celloutsig_1_5z != celloutsig_1_7z[4];
  assign celloutsig_0_6z = { _02_[8:0], celloutsig_0_1z[12:1], 1'h0, celloutsig_0_2z, celloutsig_0_0z } != { celloutsig_0_1z[12:2], _02_, celloutsig_0_2z };
  assign celloutsig_0_13z = { celloutsig_0_5z[14:12], celloutsig_0_6z, celloutsig_0_2z } != { celloutsig_0_5z[12:11], celloutsig_0_11z[9], celloutsig_0_5z[9], celloutsig_0_6z };
  assign celloutsig_0_16z = { _04_[7], _00_, _04_[2:1] } != { celloutsig_0_5z[15:11], celloutsig_0_11z[9], celloutsig_0_5z[9] };
  assign celloutsig_1_2z = in_data[121:101] ^ in_data[170:150];
  assign celloutsig_1_7z = { celloutsig_1_2z[8:0], celloutsig_1_5z, celloutsig_1_5z } ^ { celloutsig_1_3z[8:4], in_data[150], celloutsig_1_3z[2:0], celloutsig_1_4z, celloutsig_1_0z };
  assign celloutsig_1_18z = { _03_[5:3], celloutsig_1_15z } ^ in_data[146:143];
  assign celloutsig_0_10z = _02_[4:0] ^ celloutsig_0_1z[11:7];
  assign celloutsig_0_23z = { celloutsig_0_21z, celloutsig_0_13z, celloutsig_0_18z } ^ { _00_[0], _04_[2], celloutsig_0_0z };
  assign celloutsig_0_1z[12:1] = { in_data[88:81], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } ^ in_data[80:69];
  assign celloutsig_1_1z[3:1] = in_data[122:120] ^ in_data[147:145];
  assign { celloutsig_1_9z[1], celloutsig_1_9z[3:2] } = { celloutsig_1_4z, in_data[170:169] } ^ { celloutsig_1_1z[1], celloutsig_1_1z[3:2] };
  assign { celloutsig_0_5z[13:11], celloutsig_0_11z[9], celloutsig_0_5z[9:8], celloutsig_0_5z[16], celloutsig_0_5z[7], celloutsig_0_5z[15], celloutsig_0_5z[6], celloutsig_0_5z[14], celloutsig_0_5z[5:2] } = { _02_[11:6], _02_[6:5], _02_[5:4], _02_[4:0] } ^ { celloutsig_0_1z[12:7], _02_[2], celloutsig_0_1z[6], celloutsig_0_0z, celloutsig_0_1z[5], celloutsig_0_3z, celloutsig_0_1z[4:1] };
  assign { celloutsig_0_7z[12:9], celloutsig_0_29z[3], celloutsig_0_7z[7:1], celloutsig_0_7z[14] } = { celloutsig_0_1z[12:1], celloutsig_0_5z[2] } ^ { _02_, _02_[11] };
  assign { celloutsig_0_11z[10], celloutsig_0_11z[8:0] } = { celloutsig_0_5z[11], celloutsig_0_5z[9:2], celloutsig_0_2z } ^ { celloutsig_0_7z[14], celloutsig_0_7z[12:9], celloutsig_0_29z[3], celloutsig_0_7z[7:6], celloutsig_0_3z, celloutsig_0_0z };
  assign { celloutsig_1_3z[8:4], celloutsig_1_3z[2:0] } = { in_data[155:151], in_data[149:147] } ^ { celloutsig_1_2z[3], celloutsig_1_0z, celloutsig_1_1z[3:1], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign { celloutsig_1_10z[1], celloutsig_1_10z[3:2] } = { celloutsig_1_9z[1], celloutsig_1_9z[3:2] } ^ { in_data[154], in_data[156:155] };
  assign { celloutsig_1_17z[8:5], celloutsig_1_17z[13:9], celloutsig_1_17z[4:1] } = { celloutsig_1_10z[3:1], in_data[153], celloutsig_1_3z[7:4], in_data[150], celloutsig_1_0z, celloutsig_1_1z[3:1] } ^ { _03_[7:4], celloutsig_1_3z[6], _03_[11:8], _03_[3:0] };
  assign _04_[6:3] = _00_;
  assign celloutsig_0_1z[0] = 1'h0;
  assign { celloutsig_0_5z[10], celloutsig_0_5z[1:0] } = { celloutsig_0_11z[9], celloutsig_0_2z, 1'h0 };
  assign { celloutsig_0_7z[13], celloutsig_0_7z[8], celloutsig_0_7z[0] } = { 1'h0, celloutsig_0_29z[3], celloutsig_0_3z };
  assign celloutsig_1_10z[0] = in_data[153];
  assign celloutsig_1_17z[0] = celloutsig_1_15z;
  assign celloutsig_1_1z[0] = 1'h0;
  assign celloutsig_1_3z[3] = in_data[150];
  assign celloutsig_1_9z[0] = 1'h0;
  assign { out_data[131:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_37z, celloutsig_0_38z };
endmodule
