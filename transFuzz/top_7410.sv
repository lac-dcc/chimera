/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [2:0] _01_;
  reg [72:0] _02_;
  reg [3:0] _03_;
  wire [3:0] _04_;
  reg [7:0] _05_;
  wire [5:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [8:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [6:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  wire [58:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_2z;
  wire [4:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [16:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [3:0] celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  wire [11:0] celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire [13:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [23:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [7:0] celloutsig_1_7z;
  wire [30:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_4z = celloutsig_1_1z[7] | ~(in_data[114]);
  assign celloutsig_1_3z = celloutsig_1_1z[9] ^ celloutsig_1_1z[6];
  assign celloutsig_0_8z = in_data[68] ^ celloutsig_0_5z;
  assign celloutsig_0_14z = celloutsig_0_12z ^ celloutsig_0_13z[2];
  assign celloutsig_1_2z = in_data[136] ^ in_data[146];
  assign celloutsig_0_25z = ~(celloutsig_0_24z[50] ^ _00_);
  assign celloutsig_0_13z = { celloutsig_0_0z[4:0], celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_5z } + { celloutsig_0_3z[4], celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_10z };
  always_ff @(negedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _01_ <= 3'h0;
    else _01_ <= { in_data[135:134], celloutsig_1_5z };
  always_ff @(posedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _02_ <= 73'h0000000000000000000;
    else _02_ <= { celloutsig_1_0z[1], celloutsig_1_11z, celloutsig_1_0z, _01_, celloutsig_1_3z, celloutsig_1_13z, celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_11z, celloutsig_1_10z };
  always_ff @(negedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _03_ <= 4'h0;
    else _03_ <= { _01_[2], _01_ };
  reg [3:0] _16_;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[64])
    if (clkin_data[64]) _16_ <= 4'h0;
    else _16_ <= { celloutsig_0_17z[1:0], celloutsig_0_11z, celloutsig_0_2z };
  assign { _04_[3:1], _00_ } = _16_;
  always_ff @(negedge celloutsig_1_18z[0], negedge clkin_data[32])
    if (!clkin_data[32]) _05_ <= 8'h00;
    else _05_ <= { celloutsig_0_13z[3:2], celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_2z };
  assign celloutsig_1_18z = celloutsig_1_8z[30:17] & { _02_[44:36], _03_, celloutsig_1_5z };
  assign celloutsig_0_20z = { celloutsig_0_15z[3:2], celloutsig_0_14z, celloutsig_0_11z } & { celloutsig_0_7z[15:13], celloutsig_0_16z };
  assign celloutsig_0_24z = { in_data[47:5], celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_17z, celloutsig_0_10z, _05_, celloutsig_0_2z, celloutsig_0_14z } & { _05_, _04_[3:1], _00_, celloutsig_0_17z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_17z };
  assign celloutsig_1_11z = { in_data[157:148], celloutsig_1_9z, celloutsig_1_2z } / { 1'h1, celloutsig_1_1z[19:9] };
  assign celloutsig_1_9z = { in_data[106:98], celloutsig_1_2z, _01_ } === in_data[182:170];
  assign celloutsig_0_4z = in_data[74:69] === { celloutsig_0_3z[3], celloutsig_0_3z };
  assign celloutsig_0_5z = { in_data[27:24], celloutsig_0_1z } === celloutsig_0_0z[5:1];
  assign celloutsig_0_16z = in_data[15:10] === { celloutsig_0_13z[2:1], celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_10z };
  assign celloutsig_1_5z = { celloutsig_1_1z[21:7], celloutsig_1_3z } >= { celloutsig_1_1z[21:7], celloutsig_1_3z };
  assign celloutsig_0_1z = celloutsig_0_0z[5:1] <= in_data[73:69];
  assign celloutsig_0_12z = celloutsig_0_3z <= { in_data[60:57], celloutsig_0_11z };
  assign celloutsig_1_19z = { in_data[183:178], celloutsig_1_11z, celloutsig_1_4z } || { celloutsig_1_11z[9:7], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_7z, _01_ };
  assign celloutsig_0_11z = { celloutsig_0_7z[13:12], celloutsig_0_2z, celloutsig_0_4z } || celloutsig_0_0z[5:2];
  assign celloutsig_0_0z = in_data[92:87] % { 1'h1, in_data[52:48] };
  assign celloutsig_0_7z = { celloutsig_0_0z[3:1], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_0z } % { 1'h1, celloutsig_0_0z[3:0], celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_1_13z = celloutsig_1_7z[6:0] != in_data[145:139];
  assign celloutsig_0_2z = celloutsig_0_0z != in_data[32:27];
  assign celloutsig_0_26z = { celloutsig_0_20z[3:2], celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_4z } != _05_[6:2];
  assign celloutsig_1_0z = in_data[144:141] << in_data[111:108];
  assign celloutsig_1_1z = in_data[146:123] << { in_data[166:147], celloutsig_1_0z };
  assign celloutsig_1_10z = { celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_5z } >> { celloutsig_1_1z[3], celloutsig_1_2z, celloutsig_1_9z };
  assign celloutsig_0_17z = { celloutsig_0_0z[0], celloutsig_0_8z, celloutsig_0_2z } >> { celloutsig_0_13z[7], celloutsig_0_1z, celloutsig_0_11z };
  assign celloutsig_0_3z = { celloutsig_0_0z[4:1], celloutsig_0_1z } <<< celloutsig_0_0z[4:0];
  assign celloutsig_1_7z = celloutsig_1_1z[20:13] ^ celloutsig_1_1z[23:16];
  assign celloutsig_1_8z = { _01_[1:0], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_2z, _01_, celloutsig_1_7z } ^ { in_data[166:139], _01_ };
  assign celloutsig_0_15z = { celloutsig_0_11z, celloutsig_0_0z } ^ { in_data[88:84], celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_6z = ~((celloutsig_0_4z & in_data[94]) | (celloutsig_0_4z & celloutsig_0_4z));
  assign celloutsig_0_10z = ~((celloutsig_0_6z & celloutsig_0_4z) | (in_data[63] & celloutsig_0_4z));
  assign _04_[0] = _00_;
  assign { out_data[141:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_25z, celloutsig_0_26z };
endmodule
