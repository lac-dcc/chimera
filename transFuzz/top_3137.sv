/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [2:0] _01_;
  wire [22:0] _02_;
  wire [4:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [12:0] celloutsig_0_12z;
  wire [4:0] celloutsig_0_13z;
  wire celloutsig_0_16z;
  wire [13:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_2z;
  wire celloutsig_0_4z;
  wire [10:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [4:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [15:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [10:0] celloutsig_1_12z;
  wire celloutsig_1_18z;
  wire [5:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [7:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [3:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_10z = ~(_00_ & celloutsig_0_6z);
  assign celloutsig_1_0z = ~(in_data[154] & in_data[174]);
  assign celloutsig_1_3z = ~(celloutsig_1_2z[4] | celloutsig_1_1z);
  assign celloutsig_1_4z = ~(celloutsig_1_2z[3] ^ celloutsig_1_1z);
  assign celloutsig_1_5z = ~(celloutsig_1_3z ^ celloutsig_1_2z[4]);
  assign celloutsig_1_18z = ~(celloutsig_1_1z ^ celloutsig_1_12z[10]);
  assign celloutsig_0_0z = in_data[86:82] + in_data[69:65];
  reg [22:0] _10_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[0])
    if (clkin_data[0]) _10_ <= 23'h000000;
    else _10_ <= { celloutsig_0_0z[2:0], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign { _02_[22:18], _00_, _02_[16:0] } = _10_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[32])
    if (clkin_data[32]) _01_ <= 3'h0;
    else _01_ <= celloutsig_0_0z[3:1];
  assign celloutsig_0_4z = { _02_[21:18], _00_, _02_[16:14], celloutsig_0_2z } === in_data[9:1];
  assign celloutsig_0_16z = { celloutsig_0_12z[2:1], celloutsig_0_13z } === celloutsig_0_12z[12:6];
  assign celloutsig_1_7z = { celloutsig_1_6z[2:1], celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_4z } <= { in_data[166:161], celloutsig_1_0z };
  assign celloutsig_1_8z = { celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_7z } <= { celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_3z };
  assign celloutsig_0_8z = { _02_[16:12], celloutsig_0_4z } <= _02_[8:3];
  assign celloutsig_0_24z = celloutsig_0_17z[13:1] <= { celloutsig_0_5z[7:0], _01_, celloutsig_0_16z, 1'h1 };
  assign celloutsig_1_6z = celloutsig_1_2z[5:2] % { 1'h1, in_data[186:185], celloutsig_1_3z };
  assign celloutsig_1_12z = celloutsig_1_10z[12:2] % { 1'h1, celloutsig_1_2z[6:0], celloutsig_1_3z, celloutsig_1_11z, celloutsig_1_5z };
  assign celloutsig_0_12z = { _02_[21:18], _00_, _02_[16:12], celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_4z } % { 1'h1, _02_[12:3], celloutsig_0_6z, celloutsig_0_11z };
  assign celloutsig_0_13z = in_data[37] ? celloutsig_0_7z : in_data[91:87];
  assign celloutsig_0_5z = - { _02_[18], _00_, _02_[16:8] };
  assign celloutsig_1_2z = { in_data[164:158], celloutsig_1_0z } << in_data[158:151];
  assign celloutsig_0_17z = { in_data[33:26], celloutsig_0_0z, celloutsig_0_16z } << { celloutsig_0_12z[10:2], celloutsig_0_0z };
  assign celloutsig_1_19z = { celloutsig_1_11z, celloutsig_1_6z, celloutsig_1_0z } ^ celloutsig_1_10z[11:6];
  assign celloutsig_0_6z = ~((celloutsig_0_2z & _00_) | celloutsig_0_0z[4]);
  assign celloutsig_0_9z = ~((celloutsig_0_0z[3] & 1'h1) | celloutsig_0_0z[0]);
  assign celloutsig_0_11z = ~((1'h1 & celloutsig_0_0z[4]) | _02_[3]);
  assign celloutsig_0_18z = ~((celloutsig_0_8z & in_data[66]) | celloutsig_0_9z);
  assign celloutsig_0_25z = ~((celloutsig_0_18z & celloutsig_0_10z) | _01_[0]);
  assign celloutsig_1_11z = ~((celloutsig_1_7z & celloutsig_1_3z) | (celloutsig_1_2z[3] & celloutsig_1_10z[6]));
  assign celloutsig_0_2z = ~((in_data[20] & _02_[18]) | (in_data[31] & _02_[18]));
  assign celloutsig_1_1z = ~((celloutsig_1_0z & in_data[172]) | (celloutsig_1_0z & celloutsig_1_0z));
  assign celloutsig_0_7z[2] = ~ in_data[1];
  assign { celloutsig_0_7z[0], celloutsig_0_7z[4:3], celloutsig_0_7z[1] } = { celloutsig_0_6z, celloutsig_0_5z[6:5], celloutsig_0_4z } ^ { celloutsig_0_4z, in_data[3:2], in_data[0] };
  assign { celloutsig_1_10z[12], celloutsig_1_10z[15:13], celloutsig_1_10z[11], celloutsig_1_10z[1], celloutsig_1_10z[10:2] } = { celloutsig_1_8z, celloutsig_1_6z[3:1], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_1z } ^ { in_data[188], in_data[191:189], in_data[187], celloutsig_1_5z, in_data[186:183], celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_8z };
  assign _02_[17] = _00_;
  assign celloutsig_1_10z[0] = 1'h0;
  assign { out_data[128], out_data[101:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_24z, celloutsig_0_25z };
endmodule
