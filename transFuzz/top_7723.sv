/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  reg [9:0] _02_;
  wire [13:0] _03_;
  reg [9:0] _04_;
  wire [4:0] celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire [15:0] celloutsig_0_11z;
  wire [7:0] celloutsig_0_12z;
  wire [6:0] celloutsig_0_13z;
  wire [15:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [49:0] celloutsig_0_17z;
  wire [37:0] celloutsig_0_1z;
  wire [4:0] celloutsig_0_20z;
  wire [5:0] celloutsig_0_21z;
  wire [5:0] celloutsig_0_23z;
  wire [32:0] celloutsig_0_24z;
  wire celloutsig_0_27z;
  wire [26:0] celloutsig_0_28z;
  wire [17:0] celloutsig_0_2z;
  wire [9:0] celloutsig_0_31z;
  wire celloutsig_0_3z;
  wire celloutsig_0_47z;
  wire [3:0] celloutsig_0_48z;
  wire [4:0] celloutsig_0_4z;
  wire [6:0] celloutsig_0_5z;
  wire [10:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [4:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [3:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_14z;
  wire [2:0] celloutsig_1_15z;
  wire [30:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [5:0] celloutsig_1_3z;
  wire [11:0] celloutsig_1_4z;
  wire [29:0] celloutsig_1_5z;
  wire [10:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = ~(in_data[6] | celloutsig_0_1z[18]);
  assign celloutsig_1_8z = ~(celloutsig_1_4z[4] | celloutsig_1_2z);
  assign celloutsig_1_9z = ~(celloutsig_1_2z | celloutsig_1_6z[9]);
  assign celloutsig_0_8z = ~(in_data[33] | celloutsig_0_7z[3]);
  assign celloutsig_0_9z = ~(_01_ | celloutsig_0_2z[11]);
  assign celloutsig_0_47z = ~celloutsig_0_31z[8];
  assign celloutsig_1_11z = ~celloutsig_1_0z;
  assign celloutsig_0_15z = ~celloutsig_0_5z[0];
  always_ff @(negedge clkin_data[32], negedge clkin_data[64])
    if (!clkin_data[64]) _02_ <= 10'h000;
    else _02_ <= { in_data[114:106], celloutsig_1_8z };
  reg [13:0] _14_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _14_ <= 14'h0000;
    else _14_ <= in_data[18:5];
  assign { _03_[13:10], _00_, _03_[8:7], _01_, _03_[5:0] } = _14_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _04_ <= 10'h000;
    else _04_ <= { in_data[51:43], celloutsig_0_15z };
  assign celloutsig_1_4z = in_data[163:152] / { 1'h1, in_data[182:176], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_14z = celloutsig_1_5z[12:9] / { 1'h1, celloutsig_1_12z[2:0] };
  assign celloutsig_0_7z = { in_data[72:69], celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_3z } / { 1'h1, celloutsig_0_2z[16:7] };
  assign celloutsig_0_12z = { celloutsig_0_9z, celloutsig_0_5z } / { 1'h1, celloutsig_0_5z[5:0], celloutsig_0_3z };
  assign celloutsig_0_14z = celloutsig_0_11z / { 1'h1, celloutsig_0_2z[14:5], 5'h00 };
  assign celloutsig_0_20z = celloutsig_0_11z[10:6] / { 1'h1, celloutsig_0_14z[6:3] };
  assign celloutsig_0_21z = { in_data[84:83], celloutsig_0_10z, celloutsig_0_8z } / { 1'h1, _03_[7], _01_, _03_[5:3] };
  assign celloutsig_0_28z = { celloutsig_0_16z, celloutsig_0_4z, celloutsig_0_14z, celloutsig_0_20z } / { 1'h1, _04_[7:1], celloutsig_0_4z, _03_[13:10], _00_, _03_[8:7], _01_, _03_[5:0] };
  assign celloutsig_1_0z = in_data[111:97] == in_data[129:115];
  assign celloutsig_1_2z = in_data[156:146] == in_data[108:98];
  assign celloutsig_1_19z = { _02_[2:0], celloutsig_1_10z } == { celloutsig_1_8z, celloutsig_1_15z, celloutsig_1_14z };
  assign celloutsig_0_27z = { celloutsig_0_10z[2:1], celloutsig_0_16z } == celloutsig_0_2z[7:5];
  assign celloutsig_0_48z = { celloutsig_0_28z[25:23], celloutsig_0_27z } % { 1'h1, _03_[11:10], _00_ };
  assign celloutsig_1_3z = { in_data[154:150], celloutsig_1_2z } % { 1'h1, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_2z, in_data[96] };
  assign celloutsig_1_10z = { celloutsig_1_6z[8:5], celloutsig_1_7z } % { 1'h1, celloutsig_1_4z[4:1] };
  assign celloutsig_0_11z = { celloutsig_0_1z[12:1], celloutsig_0_10z, celloutsig_0_9z } % { 1'h1, celloutsig_0_1z[15:1] };
  assign celloutsig_1_6z = in_data[179:169] * { in_data[143:139], celloutsig_1_3z };
  assign celloutsig_1_5z = celloutsig_1_1z ? { in_data[144:116], 1'h1 } : { in_data[191:174], celloutsig_1_4z };
  assign celloutsig_1_15z = celloutsig_1_14z[3] ? { celloutsig_1_11z, celloutsig_1_9z, celloutsig_1_7z } : { celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_9z };
  assign celloutsig_0_17z = celloutsig_0_9z ? { in_data[49:16], celloutsig_0_11z } : { celloutsig_0_1z[33:1], celloutsig_0_16z, celloutsig_0_14z[15:8], 1'h0, celloutsig_0_14z[6:0] };
  assign celloutsig_0_24z = celloutsig_0_14z[7] ? { celloutsig_0_1z[25:21], celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_0z } : celloutsig_0_17z[43:11];
  assign celloutsig_0_16z = & { celloutsig_0_15z, celloutsig_0_9z, in_data[69:65] };
  assign celloutsig_1_1z = | { celloutsig_1_0z, in_data[130:127] };
  assign celloutsig_1_7z = | { celloutsig_1_2z, celloutsig_1_0z, in_data[122] };
  assign celloutsig_0_4z = { celloutsig_0_0z[3:0], celloutsig_0_3z } << celloutsig_0_0z;
  assign celloutsig_0_5z = celloutsig_0_1z[23:17] << { celloutsig_0_0z[1:0], celloutsig_0_4z };
  assign celloutsig_1_12z = celloutsig_1_10z[4:1] << { celloutsig_1_6z[3:2], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_0z = in_data[22:18] >>> in_data[51:47];
  assign celloutsig_0_10z = celloutsig_0_1z[30:28] >>> celloutsig_0_2z[17:15];
  assign celloutsig_0_1z = { in_data[56:29], celloutsig_0_0z, celloutsig_0_0z } >>> in_data[37:0];
  assign celloutsig_0_23z = celloutsig_0_21z >>> { celloutsig_0_4z, celloutsig_0_16z };
  assign celloutsig_0_31z = { celloutsig_0_23z[4:2], celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_4z } >>> celloutsig_0_24z[20:11];
  assign celloutsig_1_18z = { celloutsig_1_5z[27:0], celloutsig_1_9z, celloutsig_1_9z, celloutsig_1_9z } ^ { celloutsig_1_4z[8:3], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_11z, celloutsig_1_1z };
  assign celloutsig_0_13z = celloutsig_0_7z[8:2] ^ celloutsig_0_11z[7:1];
  assign celloutsig_0_2z[17:5] = { in_data[28:21], celloutsig_0_0z } ^ in_data[24:12];
  assign { _03_[9], _03_[6] } = { _00_, _01_ };
  assign celloutsig_0_2z[4:0] = 5'h00;
  assign { out_data[158:128], out_data[96], out_data[32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_47z, celloutsig_0_48z };
endmodule
