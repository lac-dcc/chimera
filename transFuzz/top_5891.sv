/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [11:0] _01_;
  wire [10:0] _02_;
  reg [7:0] _03_;
  reg [22:0] _04_;
  reg [5:0] _05_;
  wire [15:0] celloutsig_0_0z;
  wire [15:0] celloutsig_0_10z;
  wire [3:0] celloutsig_0_11z;
  wire [14:0] celloutsig_0_12z;
  wire [8:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [3:0] celloutsig_0_15z;
  wire [9:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [5:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [13:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [8:0] celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [7:0] celloutsig_0_25z;
  wire [8:0] celloutsig_0_26z;
  wire [2:0] celloutsig_0_27z;
  wire [4:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [16:0] celloutsig_0_31z;
  wire [12:0] celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [12:0] celloutsig_0_3z;
  wire [5:0] celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire [6:0] celloutsig_0_43z;
  wire [18:0] celloutsig_0_44z;
  wire [58:0] celloutsig_0_45z;
  wire celloutsig_0_47z;
  wire [4:0] celloutsig_0_4z;
  wire [10:0] celloutsig_0_50z;
  wire [3:0] celloutsig_0_52z;
  wire [2:0] celloutsig_0_57z;
  wire celloutsig_0_61z;
  wire [2:0] celloutsig_0_62z;
  wire [11:0] celloutsig_0_65z;
  wire [13:0] celloutsig_0_66z;
  wire celloutsig_0_67z;
  wire [2:0] celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire [5:0] celloutsig_0_75z;
  wire [13:0] celloutsig_0_76z;
  wire celloutsig_0_79z;
  wire [13:0] celloutsig_0_7z;
  wire celloutsig_0_80z;
  wire celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [8:0] celloutsig_1_13z;
  wire [4:0] celloutsig_1_14z;
  wire [9:0] celloutsig_1_18z;
  wire [13:0] celloutsig_1_19z;
  wire [8:0] celloutsig_1_1z;
  wire [4:0] celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [3:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  wire [6:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_39z = celloutsig_0_20z ? _00_ : celloutsig_0_13z[8];
  assign celloutsig_0_47z = celloutsig_0_7z[11] ? in_data[6] : celloutsig_0_26z[2];
  assign celloutsig_0_79z = celloutsig_0_4z[0] ? celloutsig_0_67z : celloutsig_0_69z[2];
  assign celloutsig_0_14z = in_data[30] ? celloutsig_0_7z[12] : celloutsig_0_1z[4];
  assign celloutsig_0_29z = celloutsig_0_28z[0] ? celloutsig_0_27z[1] : celloutsig_0_26z[1];
  assign celloutsig_0_30z = celloutsig_0_4z[4] ? celloutsig_0_3z[7] : celloutsig_0_29z;
  always_ff @(posedge celloutsig_1_19z[0], negedge clkin_data[32])
    if (!clkin_data[32]) _01_ <= 12'h000;
    else _01_ <= { celloutsig_0_7z[5:0], celloutsig_0_18z };
  reg [10:0] _13_;
  always_ff @(posedge celloutsig_1_19z[0], posedge clkin_data[32])
    if (clkin_data[32]) _13_ <= 11'h000;
    else _13_ <= { celloutsig_0_21z[6:4], celloutsig_0_25z };
  assign { _02_[10:9], _00_, _02_[7:0] } = _13_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _03_ <= 8'h00;
    else _03_ <= in_data[138:131];
  always_ff @(negedge celloutsig_1_19z[0], posedge clkin_data[32])
    if (clkin_data[32]) _04_ <= 23'h000000;
    else _04_ <= { celloutsig_0_1z[4:0], celloutsig_0_3z, celloutsig_0_4z };
  always_ff @(posedge celloutsig_1_19z[0], posedge clkin_data[32])
    if (clkin_data[32]) _05_ <= 6'h00;
    else _05_ <= { celloutsig_0_12z[4], celloutsig_0_4z };
  assign celloutsig_0_38z = { celloutsig_0_18z[1:0], celloutsig_0_4z } === celloutsig_0_33z[8:2];
  assign celloutsig_0_6z = celloutsig_0_0z === { in_data[32:30], celloutsig_0_3z };
  assign celloutsig_0_80z = celloutsig_0_76z === { celloutsig_0_66z[13:1], celloutsig_0_79z };
  assign celloutsig_1_7z = celloutsig_1_3z[3:1] === { in_data[164], celloutsig_1_5z, celloutsig_1_0z };
  assign celloutsig_1_11z = in_data[100:97] === { _03_[5:3], celloutsig_1_0z };
  assign celloutsig_0_17z = { celloutsig_0_10z[15:3], celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_14z } === { in_data[51:45], celloutsig_0_16z, celloutsig_0_14z, celloutsig_0_12z };
  assign celloutsig_0_19z = celloutsig_0_7z[10:5] === celloutsig_0_16z[9:4];
  assign celloutsig_0_23z = celloutsig_0_15z[1:0] === { celloutsig_0_13z[0], celloutsig_0_14z };
  assign celloutsig_0_24z = { celloutsig_0_3z[5:2], _05_, celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_2z } === celloutsig_0_3z;
  assign celloutsig_0_35z = ! { celloutsig_0_28z[0], celloutsig_0_28z };
  assign celloutsig_0_42z = ! celloutsig_0_40z;
  assign celloutsig_0_61z = ! { _05_[3], celloutsig_0_50z, celloutsig_0_57z };
  assign celloutsig_0_67z = ! { _02_[10:9], _00_, _02_[7:0], celloutsig_0_61z, celloutsig_0_30z };
  assign celloutsig_1_0z = ! in_data[173:141];
  assign celloutsig_1_5z = ! { _03_[6:2], celloutsig_1_4z };
  assign celloutsig_0_20z = ! { celloutsig_0_10z[14:0], celloutsig_0_19z, celloutsig_0_6z };
  assign celloutsig_0_2z = ! in_data[54:51];
  assign celloutsig_0_0z = in_data[33:18] % { 1'h1, in_data[92:78] };
  assign celloutsig_0_45z = { celloutsig_0_0z[4:1], celloutsig_0_31z, celloutsig_0_11z, _01_, celloutsig_0_12z, celloutsig_0_43z } % { 1'h1, celloutsig_0_44z[2], celloutsig_0_38z, celloutsig_0_33z, celloutsig_0_17z, celloutsig_0_19z, _04_, celloutsig_0_25z, celloutsig_0_35z, celloutsig_0_26z };
  assign celloutsig_0_15z = celloutsig_0_7z[4:1] % 4'hf;
  assign celloutsig_1_8z = _03_[6:3] % { 1'h1, celloutsig_1_3z[3:1] };
  assign celloutsig_1_13z = { celloutsig_1_6z[2], celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_7z } % { 1'h1, in_data[131:128], celloutsig_1_6z };
  assign celloutsig_1_18z = { celloutsig_1_13z[8:6], celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_14z } % { 1'h1, celloutsig_1_10z[1:0], celloutsig_1_5z, celloutsig_1_11z, celloutsig_1_3z };
  assign celloutsig_0_10z = { celloutsig_0_7z[12:11], celloutsig_0_1z } % { 1'h1, celloutsig_0_3z[8], celloutsig_0_1z[13:1], in_data[0] };
  assign celloutsig_0_44z = { celloutsig_0_33z[7:4], celloutsig_0_12z } >>> { celloutsig_0_33z[7:0], celloutsig_0_28z, celloutsig_0_28z, celloutsig_0_23z };
  assign celloutsig_0_62z = celloutsig_0_25z[7:5] >>> celloutsig_0_21z[2:0];
  assign celloutsig_0_66z = { celloutsig_0_65z[9:5], celloutsig_0_13z } >>> { celloutsig_0_4z[2:1], _01_ };
  assign celloutsig_0_75z = celloutsig_0_66z[5:0] >>> { celloutsig_0_45z[44:40], celloutsig_0_39z };
  assign celloutsig_1_1z = { in_data[120:113], celloutsig_1_0z } >>> in_data[157:149];
  assign celloutsig_1_3z = { in_data[118:115], celloutsig_1_0z } >>> celloutsig_1_1z[6:2];
  assign celloutsig_1_4z = _03_[7:5] >>> celloutsig_1_1z[5:3];
  assign celloutsig_1_10z = celloutsig_1_9z[6:3] >>> celloutsig_1_8z;
  assign celloutsig_1_14z = { celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_4z } >>> { celloutsig_1_1z[7], celloutsig_1_10z };
  assign celloutsig_1_19z = { celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_5z } >>> in_data[157:144];
  assign celloutsig_0_1z = in_data[16:3] >>> celloutsig_0_0z[15:2];
  assign celloutsig_0_13z = { _04_[11:5], celloutsig_0_6z, celloutsig_0_6z } >>> { celloutsig_0_12z[8:2], celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_0_27z = celloutsig_0_18z[5:3] >>> celloutsig_0_4z[3:1];
  assign celloutsig_0_28z = celloutsig_0_3z[12:8] >>> { celloutsig_0_3z[9:7], celloutsig_0_24z, celloutsig_0_2z };
  assign celloutsig_0_33z = { celloutsig_0_3z[6:3], celloutsig_0_13z } ~^ { _04_[6:2], celloutsig_0_23z, celloutsig_0_18z, celloutsig_0_6z };
  assign celloutsig_0_4z = in_data[79:75] ~^ celloutsig_0_1z[5:1];
  assign celloutsig_0_43z = { celloutsig_0_15z[0], _05_ } ~^ celloutsig_0_1z[13:7];
  assign celloutsig_0_52z = celloutsig_0_7z[11:8] ~^ celloutsig_0_15z;
  assign celloutsig_0_57z = { celloutsig_0_33z[6:5], celloutsig_0_23z } ~^ { celloutsig_0_26z[1], celloutsig_0_42z, celloutsig_0_42z };
  assign celloutsig_0_65z = in_data[55:44] ~^ celloutsig_0_7z[11:0];
  assign celloutsig_0_7z = { celloutsig_0_3z, celloutsig_0_6z } ~^ { in_data[36:24], celloutsig_0_2z };
  assign celloutsig_0_69z = celloutsig_0_62z ~^ celloutsig_0_27z;
  assign celloutsig_0_76z = { celloutsig_0_75z[4:2], celloutsig_0_6z, celloutsig_0_52z, celloutsig_0_39z, celloutsig_0_15z, celloutsig_0_47z } ~^ { celloutsig_0_7z[13:1], celloutsig_0_61z };
  assign celloutsig_1_6z = in_data[163:160] ~^ { _03_[3], celloutsig_1_4z };
  assign celloutsig_1_9z = { celloutsig_1_1z[8:7], celloutsig_1_3z } ~^ { in_data[108:106], celloutsig_1_6z };
  assign celloutsig_0_11z = in_data[5:2] ~^ { _04_[22:20], celloutsig_0_2z };
  assign celloutsig_0_12z = celloutsig_0_0z[15:1] ~^ { in_data[91:78], celloutsig_0_2z };
  assign celloutsig_0_16z = { celloutsig_0_13z[1:0], celloutsig_0_11z, celloutsig_0_15z } ~^ { celloutsig_0_3z[4:0], celloutsig_0_15z, celloutsig_0_2z };
  assign celloutsig_0_18z = celloutsig_0_3z[10:5] ~^ celloutsig_0_16z[9:4];
  assign celloutsig_0_21z = celloutsig_0_16z[8:0] ~^ _04_[22:14];
  assign celloutsig_0_25z = celloutsig_0_10z[12:5] ~^ celloutsig_0_16z[7:0];
  assign celloutsig_0_26z = { celloutsig_0_13z[7:0], celloutsig_0_20z } ~^ in_data[36:28];
  assign celloutsig_0_3z = in_data[67:55] ~^ in_data[59:47];
  assign celloutsig_0_31z = { in_data[14:13], celloutsig_0_28z, celloutsig_0_27z, celloutsig_0_2z, celloutsig_0_18z } ~^ _04_[20:4];
  assign celloutsig_0_40z[0] = ~ celloutsig_0_35z;
  assign celloutsig_0_50z[0] = ~ celloutsig_0_26z[0];
  assign celloutsig_0_40z[5:1] = _02_[6:2] ~^ { celloutsig_0_31z[5:2], celloutsig_0_39z };
  assign { celloutsig_0_50z[10], celloutsig_0_50z[8:1], celloutsig_0_50z[9] } = { celloutsig_0_28z[0], celloutsig_0_26z[8:1], celloutsig_0_20z } ~^ { celloutsig_0_1z[10], celloutsig_0_1z[8:1], celloutsig_0_1z[9] };
  assign _02_[8] = _00_;
  assign { out_data[137:128], out_data[109:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_79z, celloutsig_0_80z };
endmodule
