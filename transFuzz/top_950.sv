/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [15:0] _03_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [9:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [10:0] celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [4:0] celloutsig_0_22z;
  wire [2:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [9:0] celloutsig_0_30z;
  wire [11:0] celloutsig_0_32z;
  wire [4:0] celloutsig_0_35z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_44z;
  wire [4:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [7:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_5z = ~(celloutsig_0_1z & celloutsig_0_1z);
  assign celloutsig_0_1z = ~(in_data[81] & celloutsig_0_0z);
  assign celloutsig_0_0z = ~(in_data[81] | in_data[55]);
  assign celloutsig_1_13z = ~(celloutsig_1_1z | celloutsig_1_5z);
  assign celloutsig_1_16z = ~(celloutsig_1_14z | celloutsig_1_15z);
  assign celloutsig_0_12z = ~(celloutsig_0_9z | celloutsig_0_8z);
  assign celloutsig_0_14z = ~(celloutsig_0_10z | in_data[43]);
  assign celloutsig_0_21z = ~(celloutsig_0_3z | celloutsig_0_10z);
  assign celloutsig_1_6z = ~((celloutsig_1_3z | celloutsig_1_5z) & celloutsig_1_3z);
  assign celloutsig_0_7z = ~((celloutsig_0_5z | in_data[3]) & celloutsig_0_3z);
  assign celloutsig_0_8z = ~((celloutsig_0_3z | celloutsig_0_7z) & celloutsig_0_2z);
  assign celloutsig_1_18z = ~((_00_ | celloutsig_1_13z) & (celloutsig_1_11z | celloutsig_1_7z));
  assign celloutsig_0_3z = in_data[29] ^ in_data[6];
  assign celloutsig_1_7z = celloutsig_1_2z ^ _01_;
  assign celloutsig_1_12z = celloutsig_1_5z ^ celloutsig_1_11z;
  assign celloutsig_1_17z = celloutsig_1_16z ^ celloutsig_1_10z;
  assign celloutsig_0_41z = ~(celloutsig_0_17z ^ celloutsig_0_6z);
  assign celloutsig_1_5z = ~(_02_ ^ celloutsig_1_4z);
  assign celloutsig_0_19z = ~(celloutsig_0_0z ^ celloutsig_0_2z);
  assign celloutsig_0_2z = ~(in_data[71] ^ in_data[84]);
  reg [5:0] _24_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _24_ <= 6'h00;
    else _24_ <= { celloutsig_0_4z, celloutsig_0_17z };
  assign out_data[5:0] = _24_;
  reg [15:0] _25_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _25_ <= 16'h0000;
    else _25_ <= in_data[137:122];
  assign { _00_, _03_[14:8], _01_, _02_, _03_[5:0] } = _25_;
  assign celloutsig_1_1z = { _03_[12:8], _01_, _02_ } <= _03_[14:8];
  assign celloutsig_1_10z = { in_data[108:105], celloutsig_1_1z, celloutsig_1_5z } <= { in_data[104:100], celloutsig_1_4z };
  assign celloutsig_1_15z = { celloutsig_1_8z[2:0], celloutsig_1_12z } && { celloutsig_1_11z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_7z };
  assign celloutsig_1_2z = _03_[3] & ~(_03_[1]);
  assign celloutsig_0_9z = celloutsig_0_7z & ~(celloutsig_0_3z);
  assign celloutsig_0_22z = { celloutsig_0_13z[4:1], celloutsig_0_3z } % { 1'h1, celloutsig_0_16z, celloutsig_0_17z };
  assign celloutsig_1_8z = celloutsig_1_4z ? { in_data[119:117], celloutsig_1_7z } : { in_data[175:173], celloutsig_1_3z };
  assign celloutsig_1_19z = celloutsig_1_3z ? { celloutsig_1_17z, celloutsig_1_14z, celloutsig_1_17z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_2z } : { celloutsig_1_9z[2:1], celloutsig_1_8z, celloutsig_1_15z, 1'h0 };
  assign celloutsig_0_13z = celloutsig_0_1z ? { in_data[17:13], celloutsig_0_4z } : { in_data[72:70], celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_8z, 1'h0 };
  assign celloutsig_0_16z = celloutsig_0_11z ? celloutsig_0_15z[5:3] : { celloutsig_0_13z[7], celloutsig_0_7z, celloutsig_0_10z };
  assign celloutsig_0_23z = celloutsig_0_11z ? { celloutsig_0_8z, celloutsig_0_17z, celloutsig_0_19z } : { celloutsig_0_20z, celloutsig_0_19z, celloutsig_0_9z };
  assign celloutsig_0_30z = celloutsig_0_7z ? { in_data[24:17], celloutsig_0_19z, celloutsig_0_24z } : { celloutsig_0_23z[1:0], 1'h0, celloutsig_0_9z, celloutsig_0_21z, celloutsig_0_22z };
  assign celloutsig_0_32z = celloutsig_0_28z ? { celloutsig_0_13z[8:3], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_11z, 1'h1 } : { celloutsig_0_24z, celloutsig_0_18z, celloutsig_0_30z };
  assign celloutsig_1_14z = { celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_13z } !== { celloutsig_1_8z[3:2], celloutsig_1_10z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_6z };
  assign celloutsig_1_9z = ~ { celloutsig_1_8z[1:0], celloutsig_1_1z };
  assign celloutsig_1_4z = | { in_data[100:97], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_6z = | { celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_10z = | { celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_0_17z = | { celloutsig_0_13z[9:3], celloutsig_0_12z };
  assign celloutsig_0_20z = | { celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_19z, celloutsig_0_18z };
  assign celloutsig_0_27z = | { celloutsig_0_13z[4:1], celloutsig_0_0z, celloutsig_0_21z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_11z = celloutsig_0_10z & celloutsig_0_7z;
  assign celloutsig_0_44z = ~^ { celloutsig_0_35z[3:1], celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_20z, celloutsig_0_23z, celloutsig_0_10z, celloutsig_0_19z, celloutsig_0_28z, celloutsig_0_41z, celloutsig_0_4z };
  assign celloutsig_1_3z = ~^ in_data[134:128];
  assign celloutsig_1_11z = ~^ { celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_0_18z = ~^ { in_data[27:19], celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_9z };
  assign celloutsig_0_24z = ~^ in_data[19:15];
  assign celloutsig_0_28z = ~^ { celloutsig_0_27z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_4z = { in_data[72], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_0z } >> { in_data[59:57], celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_0_15z = { celloutsig_0_13z[6:1], celloutsig_0_4z } ~^ { celloutsig_0_13z[9:3], celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_6z };
  assign celloutsig_0_35z = { celloutsig_0_17z, celloutsig_0_28z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_20z } ^ { celloutsig_0_32z[5:2], celloutsig_0_14z };
  assign { _03_[15], _03_[7:6] } = { _00_, _01_, _02_ };
  assign { out_data[128], out_data[103:96], out_data[32] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_44z };
endmodule
