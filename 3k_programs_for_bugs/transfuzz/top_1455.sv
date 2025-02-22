/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [19:0] _03_;
  reg [19:0] _04_;
  wire [18:0] _05_;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire [4:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire [4:0] celloutsig_1_10z;
  wire [21:0] celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [14:0] celloutsig_1_2z;
  wire [12:0] celloutsig_1_3z;
  wire [5:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_2z = ~(celloutsig_0_1z & celloutsig_0_1z);
  assign celloutsig_1_17z = ~(celloutsig_1_7z & celloutsig_1_16z);
  assign celloutsig_0_4z = ~((_00_ | _01_) & celloutsig_0_3z[4]);
  assign celloutsig_0_11z = ~((celloutsig_0_8z | celloutsig_0_3z[2]) & celloutsig_0_8z);
  assign celloutsig_1_13z = ~((celloutsig_1_8z | celloutsig_1_6z) & celloutsig_1_2z[0]);
  assign celloutsig_1_7z = celloutsig_1_1z ^ in_data[164];
  assign celloutsig_1_8z = ~(celloutsig_1_3z[11] ^ celloutsig_1_7z);
  assign celloutsig_1_2z = in_data[116:102] + { in_data[182:175], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z };
  reg [18:0] _14_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[64])
    if (clkin_data[64]) _14_ <= 19'h00000;
    else _14_ <= in_data[74:56];
  assign { _05_[18:15], _02_, _01_, _05_[12:10], _03_[19:18], _00_, _03_[16:10] } = _14_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _04_ <= 20'h00000;
    else _04_ <= { _03_[19:18], _00_, _03_[16:10], celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_1_11z = { celloutsig_1_2z[6:1], celloutsig_1_7z, celloutsig_1_2z } & { in_data[111:99], celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_1z };
  assign celloutsig_0_1z = in_data[61:45] === { _05_[16:15], _02_, _01_, _05_[12:10], _03_[19:18], _00_, _03_[16:10] };
  assign celloutsig_1_9z = { celloutsig_1_4z[5:1], celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_1z } <= celloutsig_1_3z[10:2];
  assign celloutsig_1_18z = { celloutsig_1_11z[14:6], celloutsig_1_8z } <= { celloutsig_1_2z[8:0], celloutsig_1_17z };
  assign celloutsig_0_8z = { in_data[75:71], celloutsig_0_2z } || in_data[87:82];
  assign celloutsig_1_6z = celloutsig_1_3z || celloutsig_1_2z[13:1];
  assign celloutsig_1_0z = in_data[162] & ~(in_data[150]);
  assign celloutsig_1_16z = celloutsig_1_5z & ~(celloutsig_1_8z);
  assign celloutsig_0_3z = { in_data[88:85], celloutsig_0_1z } % { 1'h1, _05_[17:15], _02_ };
  assign celloutsig_1_3z = in_data[148:136] % { 1'h1, in_data[150:139] };
  assign celloutsig_1_10z = { celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_1z } % { 1'h1, celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_9z };
  assign celloutsig_1_19z = { celloutsig_1_11z[15:14], celloutsig_1_13z } % { 1'h1, celloutsig_1_18z, celloutsig_1_5z };
  assign celloutsig_1_1z = & in_data[107:100];
  assign celloutsig_1_5z = | { celloutsig_1_3z[6:5], celloutsig_1_0z };
  assign celloutsig_0_10z = ~^ { _04_[16:6], celloutsig_0_8z };
  assign celloutsig_1_4z = { celloutsig_1_3z[12:8], celloutsig_1_1z } <<< celloutsig_1_2z[9:4];
  assign { _03_[17], _03_[9:0] } = { _00_, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_4z };
  assign { _05_[14:13], _05_[9:0] } = { _02_, _01_, _03_[19:18], _00_, _03_[16:10] };
  assign { out_data[128], out_data[98:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_10z, celloutsig_0_11z };
endmodule
