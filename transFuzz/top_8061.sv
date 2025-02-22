/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [3:0] _03_;
  wire [17:0] _04_;
  wire [9:0] _05_;
  wire [9:0] _06_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire celloutsig_0_13z;
  wire [4:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [3:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [26:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_25z;
  wire celloutsig_0_35z;
  wire celloutsig_0_4z;
  wire [3:0] celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire [2:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [4:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [16:0] celloutsig_1_10z;
  wire celloutsig_1_13z;
  wire [6:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [12:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire [6:0] celloutsig_1_7z;
  wire [7:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[20] ? in_data[32] : in_data[50];
  assign celloutsig_1_4z = celloutsig_1_1z ? in_data[105] : _00_;
  assign celloutsig_0_8z = in_data[76] ? celloutsig_0_7z[2] : celloutsig_0_6z;
  assign celloutsig_0_18z = celloutsig_0_14z[0] ? in_data[8] : celloutsig_0_14z[2];
  assign celloutsig_0_21z = celloutsig_0_16z ? _01_ : celloutsig_0_14z[1];
  assign celloutsig_1_3z = in_data[182] ^ celloutsig_1_0z;
  assign celloutsig_1_16z = celloutsig_1_5z[2] ^ celloutsig_1_5z[0];
  assign celloutsig_0_25z = celloutsig_0_16z ^ celloutsig_0_14z[4];
  assign celloutsig_0_5z = { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } + in_data[3:1];
  assign celloutsig_1_8z = { in_data[161:155], celloutsig_1_4z } + { in_data[182:180], celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_5z };
  reg [17:0] _17_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _17_ <= 18'h00000;
    else _17_ <= { in_data[155:140], celloutsig_1_1z, celloutsig_1_0z };
  assign { _04_[17:2], _00_, _04_[0] } = _17_;
  reg [9:0] _18_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[32])
    if (clkin_data[32]) _18_ <= 10'h000;
    else _18_ <= { in_data[69:68], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z };
  assign { _05_[9:6], _01_, _05_[4:3], _03_[3:1] } = _18_;
  reg [9:0] _19_;
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[32])
    if (clkin_data[32]) _19_ <= 10'h000;
    else _19_ <= { celloutsig_0_20z[5:1], celloutsig_0_17z, celloutsig_0_0z };
  assign { _06_[9:7], _02_, _06_[5:0] } = _19_;
  assign celloutsig_1_14z = { celloutsig_1_10z[8], celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_13z } & in_data[176:170];
  assign celloutsig_0_7z = { celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_0z } & { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_19z = { celloutsig_0_11z[2:0], celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_16z } & { _03_[3:2], celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_18z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_0z, _05_[9:6], _01_, _05_[4:3], _03_[3:1], celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_18z };
  assign celloutsig_0_20z = { celloutsig_0_7z, celloutsig_0_0z } & { _05_[4:3], _03_[3:2], celloutsig_0_6z, celloutsig_0_18z };
  assign celloutsig_1_6z = _04_[9:5] / { 1'h1, celloutsig_1_5z[0], celloutsig_1_5z };
  assign celloutsig_1_7z = { _04_[13:9], celloutsig_1_0z, celloutsig_1_0z } % { 1'h1, celloutsig_1_6z, in_data[96] };
  assign celloutsig_1_10z = { celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_3z } % { 1'h1, in_data[183:176], celloutsig_1_8z };
  assign celloutsig_1_19z = { celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_14z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_13z, celloutsig_1_3z } % { 1'h1, _04_[12:6], celloutsig_1_13z, celloutsig_1_15z, celloutsig_1_15z, celloutsig_1_1z, celloutsig_1_16z };
  assign celloutsig_0_14z = celloutsig_0_7z % { 1'h1, in_data[8:5] };
  assign celloutsig_1_5z = { in_data[165:164], celloutsig_1_3z } % { 1'h1, celloutsig_1_4z, celloutsig_1_1z };
  assign celloutsig_0_17z = { celloutsig_0_11z[1], celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_1z } % { 1'h1, _05_[3], _03_[3], celloutsig_0_16z };
  assign celloutsig_0_35z = { celloutsig_0_17z[3:2], celloutsig_0_0z, _06_[9:7], _02_, _06_[5:0] } != { celloutsig_0_20z[3:0], celloutsig_0_25z, celloutsig_0_5z, celloutsig_0_21z, celloutsig_0_17z };
  assign celloutsig_1_1z = in_data[158:151] != { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_13z = celloutsig_1_8z[4:0] != { in_data[190:187], celloutsig_1_0z };
  assign celloutsig_1_18z = { celloutsig_1_14z[2:1], celloutsig_1_4z, celloutsig_1_3z } != celloutsig_1_10z[15:12];
  assign celloutsig_0_10z = { celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_5z } != { celloutsig_0_5z[1], celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_6z };
  assign celloutsig_0_13z = { celloutsig_0_7z[3:2], celloutsig_0_11z } != { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_0z };
  assign celloutsig_0_15z = { in_data[93:84], celloutsig_0_4z } != { celloutsig_0_11z[3:1], celloutsig_0_4z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_9z };
  assign celloutsig_0_1z = in_data[76:72] != { in_data[67:65], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_11z = { celloutsig_0_7z[4:3], celloutsig_0_5z } | { celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_1_15z = | { _04_[17:13], celloutsig_1_9z, celloutsig_1_4z };
  assign celloutsig_0_9z = | { celloutsig_0_7z[3:0], celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_0z };
  assign celloutsig_0_55z = celloutsig_0_21z & celloutsig_0_35z;
  assign celloutsig_1_0z = in_data[165] & in_data[154];
  assign celloutsig_0_6z = celloutsig_0_0z & in_data[35];
  assign celloutsig_0_16z = celloutsig_0_0z & celloutsig_0_4z;
  assign celloutsig_0_4z = | { in_data[13], celloutsig_0_0z };
  assign celloutsig_1_9z = | { celloutsig_1_7z, in_data[160:147] };
  assign celloutsig_0_54z = { celloutsig_0_19z[2], celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_13z } >> celloutsig_0_19z[20:17];
  assign _03_[0] = celloutsig_0_35z;
  assign _04_[1] = _00_;
  assign { _05_[5], _05_[2:0] } = { _01_, _03_[3:1] };
  assign _06_[6] = _02_;
  assign { out_data[128], out_data[108:96], out_data[35:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_54z, celloutsig_0_55z };
endmodule
