/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [3:0] _01_;
  wire [15:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_13z;
  wire [3:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [15:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_23z;
  wire [23:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [2:0] celloutsig_0_2z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [3:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_15z;
  wire [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire [3:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [19:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_9z = celloutsig_0_0z ? in_data[25] : celloutsig_0_2z[2];
  assign celloutsig_0_23z = celloutsig_0_7z ? in_data[48] : celloutsig_0_5z;
  assign celloutsig_1_15z = ~celloutsig_1_2z[2];
  assign celloutsig_0_5z = ~celloutsig_0_0z;
  assign celloutsig_0_6z = ~celloutsig_0_2z[0];
  assign celloutsig_0_19z = ~celloutsig_0_17z;
  assign celloutsig_0_13z = 1'h1 | ~(celloutsig_0_8z);
  assign celloutsig_1_0z = in_data[164] | ~(in_data[145]);
  assign celloutsig_1_5z = celloutsig_1_2z[1] | celloutsig_1_3z[0];
  assign celloutsig_1_8z = celloutsig_1_3z[2] | celloutsig_1_2z[2];
  assign celloutsig_1_9z = celloutsig_1_2z[4] | celloutsig_1_0z;
  assign celloutsig_1_19z = celloutsig_1_15z | celloutsig_1_12z;
  assign celloutsig_1_6z = in_data[164] ^ celloutsig_1_2z[3];
  assign celloutsig_0_27z = celloutsig_0_24z[17] ^ celloutsig_0_25z;
  assign celloutsig_1_12z = ~(celloutsig_1_10z ^ celloutsig_1_0z);
  assign celloutsig_0_4z = ~(celloutsig_0_2z[2] ^ celloutsig_0_2z[0]);
  assign celloutsig_0_10z = ~(celloutsig_0_7z ^ _00_);
  assign celloutsig_0_14z = { celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_4z } + { _00_, _01_[2:1], celloutsig_0_4z };
  assign celloutsig_0_16z = { in_data[10:1], celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_2z } + { _02_[15:1], celloutsig_0_5z };
  assign celloutsig_0_2z = { in_data[23], 1'h1, celloutsig_0_0z } + { celloutsig_0_0z, celloutsig_0_0z, 1'h1 };
  assign celloutsig_1_3z = celloutsig_1_2z[5:2] + { celloutsig_1_2z[3], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z };
  reg [14:0] _24_;
  always_ff @(negedge celloutsig_1_19z, posedge clkin_data[0])
    if (clkin_data[0]) _24_ <= 15'h0000;
    else _24_ <= { in_data[12:1], celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_10z };
  assign _02_[15:1] = _24_;
  reg [2:0] _25_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _25_ <= 3'h0;
    else _25_ <= { celloutsig_0_2z[2:1], celloutsig_0_0z };
  assign { _00_, _01_[2:1] } = _25_;
  assign celloutsig_1_11z = { celloutsig_1_3z[3], celloutsig_1_4z, celloutsig_1_9z, celloutsig_1_9z } / { 1'h1, celloutsig_1_5z, celloutsig_1_1z, in_data[96] };
  assign celloutsig_0_8z = { in_data[56:21], celloutsig_0_0z, 1'h1, celloutsig_0_4z } !== in_data[68:30];
  assign celloutsig_1_4z = | { celloutsig_1_3z[2], celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_0_7z = | { celloutsig_0_0z, celloutsig_0_2z, _00_, _01_[2:1], celloutsig_0_0z };
  assign celloutsig_0_15z = | { _02_[11], celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_9z };
  assign celloutsig_0_0z = ~^ in_data[69:43];
  assign celloutsig_0_17z = ~^ { celloutsig_0_16z[12:4], celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_7z };
  assign celloutsig_0_25z = ~^ { celloutsig_0_24z[20:19], 1'h1, celloutsig_0_2z, celloutsig_0_7z };
  assign celloutsig_0_26z = ~^ { celloutsig_0_14z, celloutsig_0_25z, celloutsig_0_19z };
  assign celloutsig_0_24z = { celloutsig_0_5z, _02_[15:1], 1'h1, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_10z } << { in_data[41:40], celloutsig_0_8z, _00_, _01_[2:1], celloutsig_0_15z, celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_18z, celloutsig_0_14z, celloutsig_0_19z, 1'h1, celloutsig_0_19z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_17z, celloutsig_0_23z };
  assign celloutsig_1_7z = { in_data[121:112], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_4z } >>> { in_data[171:159], celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_1_18z = celloutsig_1_7z[16:14] >>> celloutsig_1_11z[2:0];
  assign celloutsig_1_2z = in_data[171:165] ~^ { in_data[147:145], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_10z = ~((celloutsig_1_7z[18] & celloutsig_1_8z) | celloutsig_1_1z);
  assign celloutsig_1_1z = ~((in_data[172] & in_data[100]) | in_data[133]);
  assign celloutsig_0_18z = ~((_01_[2] & celloutsig_0_2z[0]) | (in_data[73] & celloutsig_0_6z));
  assign { _01_[3], _01_[0] } = { _00_, celloutsig_0_4z };
  assign _02_[0] = celloutsig_0_5z;
  assign { out_data[130:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_26z, celloutsig_0_27z };
endmodule
