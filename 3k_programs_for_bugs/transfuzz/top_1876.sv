/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [12:0] _01_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [3:0] celloutsig_0_12z;
  wire [2:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [16:0] celloutsig_0_1z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  reg [16:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [3:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [6:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [6:0] celloutsig_1_5z;
  wire [21:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [3:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_4z = ~(celloutsig_1_2z | celloutsig_1_0z);
  assign celloutsig_1_2z = ~(celloutsig_1_1z[2] | in_data[138]);
  assign celloutsig_1_11z = ~((celloutsig_1_1z[1] | celloutsig_1_6z[8]) & (celloutsig_1_9z[1] | celloutsig_1_0z));
  assign celloutsig_0_5z = ~((celloutsig_0_0z | in_data[10]) & (_00_ | celloutsig_0_0z));
  assign celloutsig_1_3z = ~((celloutsig_1_2z | celloutsig_1_0z) & (in_data[154] | celloutsig_1_1z[1]));
  assign celloutsig_1_14z = celloutsig_1_6z[18] ^ celloutsig_1_13z;
  assign celloutsig_0_25z = celloutsig_0_16z ^ celloutsig_0_15z;
  assign celloutsig_1_0z = in_data[142] ^ in_data[145];
  reg [12:0] _10_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _10_ <= 13'h0000;
    else _10_ <= in_data[72:60];
  assign { _01_[12:10], _00_, _01_[8:0] } = _10_;
  assign celloutsig_0_1z = in_data[27:11] / { 1'h1, in_data[24:9] };
  assign celloutsig_0_8z = { in_data[39:17], celloutsig_0_3z } > { in_data[21:19], celloutsig_0_4z, _01_[12:10], _00_, _01_[8:0], celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_10z = { _01_[12:10], _00_, _01_[8:0] } > { in_data[8:1], celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_7z };
  assign celloutsig_1_15z = { celloutsig_1_6z[12:0], celloutsig_1_13z, celloutsig_1_6z } && { celloutsig_1_4z, celloutsig_1_14z, celloutsig_1_4z, celloutsig_1_8z, celloutsig_1_13z, celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_1z };
  assign celloutsig_1_19z = { celloutsig_1_9z[3:1], celloutsig_1_15z, celloutsig_1_11z, celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_15z, celloutsig_1_8z, celloutsig_1_4z } && { celloutsig_1_12z[2:0], celloutsig_1_10z, celloutsig_1_15z, celloutsig_1_3z, celloutsig_1_16z, celloutsig_1_16z };
  assign celloutsig_0_6z = { _01_[4:2], celloutsig_0_4z } || { in_data[10:8], celloutsig_0_0z };
  assign celloutsig_1_10z = { celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_4z } < { celloutsig_1_1z[2:1], celloutsig_1_7z };
  assign celloutsig_1_18z = { celloutsig_1_16z[6:5], celloutsig_1_1z } < celloutsig_1_16z[4:0];
  assign celloutsig_0_4z = in_data[55:51] < _01_[5:1];
  assign celloutsig_0_15z = { _01_[10], _00_, _01_[8] } < celloutsig_0_14z;
  assign celloutsig_1_8z = celloutsig_1_5z[3] & ~(celloutsig_1_2z);
  assign celloutsig_0_24z = celloutsig_0_10z & ~(celloutsig_0_14z[0]);
  assign celloutsig_1_12z = { celloutsig_1_1z[1:0], celloutsig_1_11z, celloutsig_1_10z } % { 1'h1, celloutsig_1_6z[17:16], celloutsig_1_11z };
  assign celloutsig_1_1z = in_data[156:154] * { in_data[143:142], celloutsig_1_0z };
  assign celloutsig_0_3z = celloutsig_0_1z[8:2] != in_data[8:2];
  assign celloutsig_1_13z = celloutsig_1_6z[7:4] != { celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_1_6z = - { celloutsig_1_5z[6:3], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_1_16z = - { celloutsig_1_5z[5:3], celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_3z };
  assign celloutsig_0_0z = in_data[81:72] !== in_data[74:65];
  assign celloutsig_1_7z = { in_data[102], celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_2z } !== { celloutsig_1_6z[21:18], celloutsig_1_5z, celloutsig_1_1z };
  assign celloutsig_1_9z = ~ { celloutsig_1_7z, celloutsig_1_1z };
  assign celloutsig_0_12z = celloutsig_0_9z[15:12] << { celloutsig_0_1z[13:11], celloutsig_0_4z };
  assign celloutsig_0_14z = celloutsig_0_9z[16:14] << { celloutsig_0_9z[9], celloutsig_0_3z, celloutsig_0_8z };
  assign celloutsig_1_5z = in_data[181:175] >>> in_data[154:148];
  assign celloutsig_0_7z = ~((celloutsig_0_5z & celloutsig_0_0z) | _01_[4]);
  assign celloutsig_0_16z = ~((celloutsig_0_12z[2] & celloutsig_0_10z) | celloutsig_0_12z[0]);
  always_latch
    if (clkin_data[32]) celloutsig_0_9z = 17'h00000;
    else if (clkin_data[64]) celloutsig_0_9z = { _01_[12:10], _00_, _01_[8:1], celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_3z };
  assign _01_[9] = _00_;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_24z, celloutsig_0_25z };
endmodule
