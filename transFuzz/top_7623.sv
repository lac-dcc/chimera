/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  reg [21:0] _02_;
  wire [6:0] _03_;
  wire [9:0] _04_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [16:0] celloutsig_0_12z;
  wire [4:0] celloutsig_0_13z;
  wire [3:0] celloutsig_0_14z;
  wire [16:0] celloutsig_0_15z;
  wire [31:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [7:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [8:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [3:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [3:0] celloutsig_0_2z;
  wire [5:0] celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire [15:0] celloutsig_0_36z;
  wire [8:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [5:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire [2:0] celloutsig_0_54z;
  wire [3:0] celloutsig_0_5z;
  wire [7:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [13:0] celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire [8:0] celloutsig_1_9z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_18z = celloutsig_1_2z ? celloutsig_1_17z : celloutsig_1_11z;
  assign celloutsig_1_0z = !(in_data[149] ? in_data[123] : in_data[110]);
  assign celloutsig_1_19z = !(celloutsig_1_1z ? celloutsig_1_9z[8] : celloutsig_1_16z);
  assign celloutsig_0_9z = !(celloutsig_0_7z ? celloutsig_0_0z : celloutsig_0_3z[4]);
  assign celloutsig_0_43z = ~(celloutsig_0_41z | celloutsig_0_11z);
  assign celloutsig_1_11z = ~(_01_ | in_data[141]);
  assign celloutsig_0_18z = ~(celloutsig_0_13z[0] | celloutsig_0_7z);
  assign celloutsig_1_17z = ~((celloutsig_1_16z | celloutsig_1_3z) & (celloutsig_1_7z | celloutsig_1_0z));
  reg [6:0] _13_;
  always_ff @(negedge celloutsig_1_19z, posedge clkin_data[64])
    if (clkin_data[64]) _13_ <= 7'h00;
    else _13_ <= { celloutsig_0_5z[2:1], celloutsig_0_32z, celloutsig_0_28z, celloutsig_0_20z, celloutsig_0_21z, celloutsig_0_8z };
  assign { _03_[6:5], _00_, _03_[3:0] } = _13_;
  reg [7:0] _14_;
  always_ff @(negedge celloutsig_1_19z, negedge clkin_data[64])
    if (!clkin_data[64]) _14_ <= 8'h00;
    else _14_ <= { celloutsig_0_25z, celloutsig_0_42z, celloutsig_0_43z };
  assign out_data[39:32] = _14_;
  reg [9:0] _15_;
  always_ff @(posedge clkin_data[32], negedge clkin_data[160])
    if (!clkin_data[160]) _15_ <= 10'h000;
    else _15_ <= { celloutsig_1_5z[11:3], celloutsig_1_1z };
  assign { _04_[9:7], _01_, _04_[5:0] } = _15_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[96])
    if (!clkin_data[96]) _02_ <= 22'h000000;
    else _02_ <= celloutsig_0_16z[25:4];
  assign celloutsig_0_14z = in_data[85:82] / { 1'h1, celloutsig_0_2z[2:1], celloutsig_0_0z };
  assign celloutsig_0_8z = in_data[28:8] === { in_data[51:40], celloutsig_0_3z[8:1], 1'h0 };
  assign celloutsig_0_28z = { celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_22z } === { celloutsig_0_24z[4], celloutsig_0_3z[8:1], 1'h0, celloutsig_0_19z };
  assign celloutsig_0_21z = celloutsig_0_12z[8:5] > celloutsig_0_5z;
  assign celloutsig_0_25z = { celloutsig_0_3z[6:4], celloutsig_0_23z, celloutsig_0_17z } > { celloutsig_0_3z[4], celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_17z };
  assign celloutsig_0_17z = { celloutsig_0_12z[6:4], celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_5z } && celloutsig_0_15z[14:3];
  assign celloutsig_0_32z = celloutsig_0_16z[4:2] < { celloutsig_0_17z, celloutsig_0_11z, celloutsig_0_17z };
  assign celloutsig_0_5z = { celloutsig_0_2z[1], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } % { 1'h1, celloutsig_0_2z[1], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_5z = { in_data[124:118], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_1z } % { 1'h1, in_data[185:174], celloutsig_1_4z };
  assign celloutsig_1_9z = celloutsig_1_5z[8:0] % { 1'h1, celloutsig_1_5z[10:3] };
  assign celloutsig_0_13z = { celloutsig_0_5z, celloutsig_0_8z } % { 1'h1, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_0z };
  assign celloutsig_0_42z = celloutsig_0_40z ? { celloutsig_0_36z[10:6], celloutsig_0_0z } : celloutsig_0_30z;
  assign celloutsig_0_16z = celloutsig_0_15z[6] ? { celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_15z[16:7], 1'h1, celloutsig_0_15z[5:1], celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_14z } : { celloutsig_0_15z[14:10], celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_3z[8:1], 1'h0 };
  assign celloutsig_0_2z[3:1] = in_data[93] ? in_data[57:55] : in_data[53:51];
  assign celloutsig_0_40z = { _00_, _03_[3:0], celloutsig_0_13z } != { celloutsig_0_15z[5:1], celloutsig_0_0z, celloutsig_0_2z[3:1], celloutsig_0_0z };
  assign celloutsig_0_7z = { in_data[89:69], celloutsig_0_0z, celloutsig_0_0z } != { in_data[42:27], celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_10z };
  assign celloutsig_1_4z = & { celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_0z = in_data[93] & in_data[71];
  assign celloutsig_0_41z = celloutsig_0_7z & celloutsig_0_32z;
  assign celloutsig_1_1z = in_data[148] & celloutsig_1_0z;
  assign celloutsig_0_10z = celloutsig_0_0z & celloutsig_0_2z[2];
  assign celloutsig_1_7z = ^ { celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_11z = ^ { celloutsig_0_3z[8:1], 1'h0 };
  assign celloutsig_0_19z = ^ celloutsig_0_12z[13:11];
  assign celloutsig_0_20z = ^ { celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_13z };
  assign celloutsig_0_27z = celloutsig_0_3z[6:3] >> celloutsig_0_13z[4:1];
  assign celloutsig_0_54z = { celloutsig_0_3z[2:1], 1'h0 } << celloutsig_0_13z[3:1];
  assign celloutsig_0_6z = { celloutsig_0_2z[2:1], celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_0z } << { celloutsig_0_3z[7:1], 1'h0 };
  assign celloutsig_0_12z = { in_data[55:46], celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_10z } << { celloutsig_0_3z[8:6], celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_3z[8:1], 1'h0 };
  assign celloutsig_0_24z = { celloutsig_0_15z[8:1], celloutsig_0_0z } << { celloutsig_0_3z[8:1], 1'h0 };
  assign celloutsig_0_36z = { _03_[6:5], _00_, _03_[3:0], celloutsig_0_27z, celloutsig_0_8z, celloutsig_0_23z, celloutsig_0_25z, celloutsig_0_20z, celloutsig_0_0z } - { _02_[2], celloutsig_0_18z, celloutsig_0_22z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_20z, celloutsig_0_9z, celloutsig_0_32z };
  assign celloutsig_0_22z = { celloutsig_0_3z[5:3], celloutsig_0_5z, celloutsig_0_0z } ^ { celloutsig_0_5z[2:0], celloutsig_0_13z };
  assign celloutsig_0_30z = { celloutsig_0_15z[10:8], celloutsig_0_28z, celloutsig_0_18z, celloutsig_0_7z } ^ { celloutsig_0_5z[3], celloutsig_0_7z, celloutsig_0_2z[3:1], celloutsig_0_0z };
  assign celloutsig_0_23z = ~((celloutsig_0_19z & celloutsig_0_18z) | celloutsig_0_21z);
  assign celloutsig_1_2z = ~((celloutsig_1_1z & celloutsig_1_1z) | (celloutsig_1_0z & celloutsig_1_0z));
  assign celloutsig_1_3z = ~((celloutsig_1_2z & celloutsig_1_0z) | (celloutsig_1_0z & celloutsig_1_1z));
  assign celloutsig_1_16z = ~((celloutsig_1_1z & celloutsig_1_11z) | (celloutsig_1_11z & celloutsig_1_1z));
  assign { celloutsig_0_3z[3], celloutsig_0_3z[8], celloutsig_0_3z[2], celloutsig_0_3z[7:6], celloutsig_0_3z[1], celloutsig_0_3z[4], celloutsig_0_3z[5] } = { celloutsig_0_2z[3], celloutsig_0_2z[3:2], celloutsig_0_2z[2:1], celloutsig_0_2z[1], celloutsig_0_0z, celloutsig_0_0z } ^ { celloutsig_0_2z[2], in_data[62], celloutsig_0_2z[1], in_data[61:60], celloutsig_0_0z, celloutsig_0_2z[3], in_data[59] };
  assign { celloutsig_0_15z[3], celloutsig_0_15z[8], celloutsig_0_15z[2], celloutsig_0_15z[7:6], celloutsig_0_15z[1], celloutsig_0_15z[4], celloutsig_0_15z[5], celloutsig_0_15z[16], celloutsig_0_15z[11], celloutsig_0_15z[9], celloutsig_0_15z[15:12], celloutsig_0_15z[10] } = { celloutsig_0_3z[3], celloutsig_0_3z[8], celloutsig_0_3z[2], celloutsig_0_3z[7:6], celloutsig_0_3z[1], celloutsig_0_3z[4], celloutsig_0_3z[5], celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_2z[3:1], celloutsig_0_0z, celloutsig_0_0z } ^ { celloutsig_0_2z[3], celloutsig_0_13z[4], celloutsig_0_2z[2], celloutsig_0_13z[3:2], celloutsig_0_2z[1], celloutsig_0_13z[0], celloutsig_0_13z[1], celloutsig_0_12z[16], celloutsig_0_12z[11], celloutsig_0_12z[9], celloutsig_0_12z[15:12], celloutsig_0_12z[10] };
  assign _03_[4] = _00_;
  assign _04_[6] = _01_;
  assign celloutsig_0_15z[0] = celloutsig_0_0z;
  assign celloutsig_0_2z[0] = celloutsig_0_0z;
  assign celloutsig_0_3z[0] = 1'h0;
  assign { out_data[128], out_data[96], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_54z };
endmodule
