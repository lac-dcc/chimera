/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [6:0] _02_;
  wire [12:0] _03_;
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [4:0] celloutsig_0_16z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [4:0] celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire [3:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [12:0] celloutsig_1_2z;
  wire [13:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [9:0] celloutsig_1_6z;
  wire [36:0] celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_13z = !(_00_ ? celloutsig_0_12z : in_data[43]);
  assign celloutsig_0_12z = ~(_01_ | celloutsig_0_6z);
  assign celloutsig_0_1z = ~celloutsig_0_0z[0];
  assign celloutsig_1_4z = ~((celloutsig_1_0z[1] | celloutsig_1_2z[2]) & celloutsig_1_3z[11]);
  assign celloutsig_0_9z = { celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_5z } + { celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_1_7z = { celloutsig_1_3z[12:4], celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_1z } + { celloutsig_1_3z[13:8], celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_1z };
  reg [6:0] _10_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _10_ <= 7'h00;
    else _10_ <= { celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_1z };
  assign { _02_[6:5], _01_, _02_[3:0] } = _10_;
  reg [12:0] _11_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _11_ <= 13'h0000;
    else _11_ <= { _02_[6:5], _01_, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_0z[0] };
  assign { _03_[12:4], _00_, _03_[2:0] } = _11_;
  assign celloutsig_0_2z = in_data[67] & ~(celloutsig_0_0z[0]);
  assign celloutsig_0_0z = in_data[62:59] % { 1'h1, in_data[85:83] };
  assign celloutsig_1_0z = in_data[139:137] % { 1'h1, in_data[178:177] };
  assign celloutsig_1_2z = celloutsig_1_1z ? in_data[157:145] : { in_data[189:187], celloutsig_1_0z, 1'h0, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_4z = { in_data[74:72], celloutsig_0_2z } != { celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z[0], celloutsig_0_0z[0] };
  assign celloutsig_0_6z = { in_data[4:2], celloutsig_0_0z[0], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_5z } != { in_data[82:76], celloutsig_0_4z };
  assign celloutsig_1_1z = in_data[178:163] != { in_data[157:148], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_18z = ~ { celloutsig_1_6z[9:7], celloutsig_1_4z };
  assign celloutsig_0_7z = | { celloutsig_0_0z[3:2], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_0z[0], celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_14z = | celloutsig_0_0z[3:1];
  assign celloutsig_0_5z = ^ { celloutsig_0_0z[2:1], celloutsig_0_4z, celloutsig_0_2z };
  assign celloutsig_1_6z = { celloutsig_1_3z[7:2], celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_4z } >> { celloutsig_1_2z[10:2], celloutsig_1_1z };
  assign celloutsig_0_16z = { celloutsig_0_9z[2:1], celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_1z } ^ { celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_12z };
  assign celloutsig_1_3z = { celloutsig_1_2z[8:0], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z } ^ in_data[177:164];
  assign celloutsig_1_8z = in_data[124:121] ^ { celloutsig_1_7z[7], celloutsig_1_0z };
  assign celloutsig_1_19z = ~((celloutsig_1_4z & celloutsig_1_8z[0]) | (1'h1 & in_data[136]));
  assign { out_data[36], out_data[43:38], out_data[35:32] } = ~ { celloutsig_0_14z, celloutsig_0_9z[4:1], celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_0z };
  assign _02_[4] = _01_;
  assign _03_[3] = _00_;
  assign { out_data[131:128], out_data[96], out_data[37], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, out_data[39], celloutsig_0_16z };
endmodule
