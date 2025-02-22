/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [22:0] _02_;
  wire [22:0] _03_;
  reg [6:0] _04_;
  wire celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire [22:0] celloutsig_0_14z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [10:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [8:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [4:0] celloutsig_0_5z;
  wire [6:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [9:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_13z;
  wire [2:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [14:0] celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [3:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_4z = in_data[65] ? in_data[4] : celloutsig_0_1z;
  assign celloutsig_1_18z = celloutsig_1_15z[0] ? celloutsig_1_8z : celloutsig_1_13z;
  assign celloutsig_1_19z = ~(celloutsig_1_3z & celloutsig_1_0z);
  assign celloutsig_0_8z = ~(celloutsig_0_3z & in_data[35]);
  assign celloutsig_1_0z = ~(in_data[139] & in_data[123]);
  assign celloutsig_0_1z = ~in_data[65];
  assign celloutsig_0_3z = ~in_data[47];
  assign celloutsig_1_9z = celloutsig_1_7z[0] ^ celloutsig_1_4z;
  assign celloutsig_1_13z = celloutsig_1_3z ^ celloutsig_1_9z;
  assign celloutsig_0_6z = in_data[68:62] + { celloutsig_0_2z[7:5], celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_14z = { celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_4z, _02_[11:9], _00_, _02_[7:3], _01_, _02_[1:0] } + { celloutsig_0_2z[2], celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_11z, _03_[18:0] };
  assign celloutsig_0_2z = in_data[65:57] + { in_data[78:71], celloutsig_0_1z };
  assign celloutsig_1_2z = in_data[187:179] + { in_data[153:146], celloutsig_1_0z };
  reg [11:0] _18_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _18_ <= 12'h000;
    else _18_ <= { celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_0z };
  assign { _02_[11:9], _00_, _02_[7:3], _01_, _02_[1:0] } = _18_;
  reg [18:0] _19_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[32])
    if (clkin_data[32]) _19_ <= 19'h00000;
    else _19_ <= { celloutsig_0_6z[5:3], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_2z };
  assign _03_[18:0] = _19_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _04_ <= 7'h00;
    else _04_ <= { celloutsig_0_11z, celloutsig_0_17z, celloutsig_0_5z };
  assign celloutsig_0_9z = { celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_3z } & { celloutsig_0_2z[8:6], celloutsig_0_6z };
  assign celloutsig_0_26z = { _04_[4:3], celloutsig_0_19z, _04_, celloutsig_0_4z } & celloutsig_0_14z[12:2];
  assign celloutsig_1_1z = { in_data[165:152], celloutsig_1_0z } & in_data[191:177];
  assign celloutsig_1_7z = { celloutsig_1_2z[7:5], celloutsig_1_4z } / { 1'h1, in_data[184:182] };
  assign celloutsig_1_8z = ! in_data[104:102];
  assign celloutsig_0_19z = ! { celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_7z, celloutsig_0_17z };
  assign celloutsig_1_3z = celloutsig_1_1z[4] & ~(celloutsig_1_2z[4]);
  assign celloutsig_1_15z = { celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_13z } % { 1'h1, in_data[143:142] };
  assign celloutsig_1_4z = { celloutsig_1_1z[8:1], celloutsig_1_2z, celloutsig_1_0z } != in_data[179:162];
  assign celloutsig_0_7z = celloutsig_0_6z[3:0] != { in_data[58], celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_11z = { celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_5z } != { celloutsig_0_2z[8:3], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_0_18z = celloutsig_0_14z[18:4] != { celloutsig_0_14z[21:8], celloutsig_0_1z };
  assign celloutsig_0_0z = in_data[74:71] !== in_data[57:54];
  assign celloutsig_0_5z = { celloutsig_0_2z[3:2], celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_1z } | { in_data[30:27], celloutsig_0_0z };
  assign celloutsig_0_17z = ^ { celloutsig_0_9z[5:1], celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_0_27z = ^ _03_[11:6];
  assign celloutsig_1_10z = ~((celloutsig_1_9z & celloutsig_1_7z[0]) | celloutsig_1_0z);
  assign { _02_[22:12], _02_[8], _02_[2] } = { celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_4z, _00_, _01_ };
  assign _03_[22:19] = { celloutsig_0_2z[2], celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_11z };
  assign { out_data[128], out_data[96], out_data[42:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_26z, celloutsig_0_27z };
endmodule
