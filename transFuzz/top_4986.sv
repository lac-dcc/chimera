/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [6:0] _03_;
  wire [14:0] _04_;
  wire celloutsig_0_0z;
  wire [6:0] celloutsig_0_10z;
  wire [16:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [3:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [25:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire celloutsig_0_20z;
  wire celloutsig_0_23z;
  wire [3:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire [2:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_35z;
  reg [12:0] celloutsig_0_3z;
  wire [3:0] celloutsig_0_41z;
  wire celloutsig_0_4z;
  wire [3:0] celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire [8:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [4:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [5:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [6:0] celloutsig_1_11z;
  wire [6:0] celloutsig_1_12z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [7:0] celloutsig_1_4z;
  wire [12:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [5:0] celloutsig_1_8z;
  wire [7:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_4z = ~(celloutsig_0_19z & celloutsig_0_2z);
  assign celloutsig_0_14z = ~(celloutsig_0_3z[2] & celloutsig_0_6z);
  assign celloutsig_0_2z = ~(celloutsig_0_19z & celloutsig_0_0z);
  assign celloutsig_0_31z = ~(celloutsig_0_11z[13] & _01_);
  assign celloutsig_1_19z = ~(celloutsig_1_4z[5] | celloutsig_1_8z[3]);
  assign celloutsig_0_35z = celloutsig_0_3z[11] | celloutsig_0_32z[2];
  assign celloutsig_1_2z = in_data[157] | in_data[140];
  assign celloutsig_0_23z = celloutsig_0_20z ^ in_data[48];
  reg [6:0] _13_;
  always_ff @(posedge clkin_data[96], negedge clkin_data[32])
    if (!clkin_data[32]) _13_ <= 7'h00;
    else _13_ <= { in_data[111:106], celloutsig_1_0z };
  assign { _02_, _03_[5:0] } = _13_;
  reg [14:0] _14_;
  always_ff @(negedge clkin_data[64], negedge clkin_data[0])
    if (!clkin_data[0]) _14_ <= 15'h0000;
    else _14_ <= { celloutsig_0_3z[12], celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_14z };
  assign { _00_, _04_[13:6], _01_, _04_[4:0] } = _14_;
  assign celloutsig_1_6z = _03_[4:2] === in_data[150:148];
  assign celloutsig_0_51z = { celloutsig_0_32z[2:1], celloutsig_0_10z, celloutsig_0_32z } >= { celloutsig_0_7z[2:1], celloutsig_0_9z[2], celloutsig_0_5z };
  assign celloutsig_1_3z = { _03_[4:1], celloutsig_1_0z } >= { _02_, _03_[5:3], celloutsig_1_0z };
  assign celloutsig_0_12z = { in_data[93:82], celloutsig_0_7z } <= { celloutsig_0_10z, celloutsig_0_19z, celloutsig_0_5z };
  assign celloutsig_0_17z = { in_data[43], celloutsig_0_13z, celloutsig_0_6z } <= { celloutsig_0_13z[2:0], celloutsig_0_19z, celloutsig_0_0z, celloutsig_0_8z };
  assign celloutsig_0_33z = celloutsig_0_11z[15:6] < { celloutsig_0_16z[13:5], celloutsig_0_23z };
  assign celloutsig_0_20z = { celloutsig_0_16z[15:6], celloutsig_0_0z } < { in_data[95:90], celloutsig_0_17z, celloutsig_0_19z, celloutsig_0_19z, celloutsig_0_19z, celloutsig_0_4z };
  assign celloutsig_0_6z = celloutsig_0_5z[4] & ~(celloutsig_0_3z[2]);
  assign celloutsig_1_10z = celloutsig_1_6z & ~(celloutsig_1_9z[4]);
  assign celloutsig_0_5z = in_data[44:36] % { 1'h1, celloutsig_0_3z[9:2] };
  assign celloutsig_0_50z = { celloutsig_0_7z[2:1], celloutsig_0_9z[2:1] } % { 1'h1, celloutsig_0_41z[1], celloutsig_0_4z, celloutsig_0_33z };
  assign celloutsig_0_16z = { in_data[70:52], celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_12z } % { 1'h1, in_data[89:69], celloutsig_0_13z };
  assign celloutsig_1_4z = celloutsig_1_0z ? { 1'h1, _02_, _03_[5:0] } : in_data[127:120];
  assign celloutsig_1_12z = celloutsig_1_11z[1] ? celloutsig_1_9z[7:1] : { celloutsig_1_8z, celloutsig_1_10z };
  assign celloutsig_0_9z[2:1] = celloutsig_0_2z ? { celloutsig_0_0z, celloutsig_0_8z } : { celloutsig_0_7z[0], celloutsig_0_0z };
  assign celloutsig_0_25z = celloutsig_0_3z[5] ? { celloutsig_0_10z[0], celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_20z } : { celloutsig_0_7z[2:1], celloutsig_0_9z[2:1] };
  assign celloutsig_0_41z = { celloutsig_0_5z[8:6], celloutsig_0_23z } | { celloutsig_0_33z, celloutsig_0_35z, celloutsig_0_31z, celloutsig_0_26z };
  assign celloutsig_1_18z = | { _03_[1], celloutsig_1_12z };
  assign celloutsig_0_26z = | { _00_, _01_, _04_[13:6], _04_[4:0], celloutsig_0_20z, celloutsig_0_19z, celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_0z = ~^ in_data[27:3];
  assign celloutsig_0_8z = ~^ celloutsig_0_5z[8:3];
  assign celloutsig_0_19z = ~^ in_data[42:35];
  assign celloutsig_1_8z = _03_[5:0] >> celloutsig_1_4z[7:2];
  assign celloutsig_1_11z = celloutsig_1_5z[7:1] >> celloutsig_1_5z[8:2];
  assign celloutsig_1_9z = celloutsig_1_4z << { _02_, _03_[5:0], celloutsig_1_0z };
  assign celloutsig_0_7z = celloutsig_0_3z[9:5] << { celloutsig_0_5z[4:1], celloutsig_0_2z };
  assign celloutsig_0_32z = { celloutsig_0_25z[3:2], celloutsig_0_17z } << { celloutsig_0_7z[2:1], celloutsig_0_9z[2] };
  assign celloutsig_1_5z = in_data[175:163] >>> { celloutsig_1_4z[5:3], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_0_11z = { celloutsig_0_5z[2:0], celloutsig_0_19z, celloutsig_0_3z } >>> { celloutsig_0_3z[7:0], celloutsig_0_7z[3:1], celloutsig_0_9z[2:1], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_4z };
  assign celloutsig_0_10z = celloutsig_0_3z[12:6] ^ in_data[7:1];
  assign celloutsig_0_13z = { celloutsig_0_3z[6:4], celloutsig_0_0z } ^ celloutsig_0_3z[10:7];
  assign celloutsig_1_0z = ~((in_data[121] & in_data[150]) | in_data[133]);
  always_latch
    if (clkin_data[0]) celloutsig_0_3z = 13'h0000;
    else if (celloutsig_1_18z) celloutsig_0_3z = { in_data[31:23], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_19z, celloutsig_0_19z };
  assign _03_[6] = _02_;
  assign { _04_[14], _04_[5] } = { _00_, _01_ };
  assign { celloutsig_0_9z[5:3], celloutsig_0_9z[0] } = { celloutsig_0_7z[3:1], celloutsig_0_0z };
  assign { out_data[128], out_data[96], out_data[35:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_50z, celloutsig_0_51z };
endmodule
