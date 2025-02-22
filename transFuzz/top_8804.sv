/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [4:0] _00_;
  reg [6:0] _01_;
  reg [4:0] _02_;
  wire [7:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [5:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [6:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [6:0] celloutsig_0_19z;
  wire [4:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [11:0] celloutsig_0_22z;
  wire [15:0] celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [8:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [4:0] celloutsig_0_30z;
  wire [13:0] celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire [8:0] celloutsig_0_38z;
  wire [16:0] celloutsig_0_39z;
  wire [2:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire [2:0] celloutsig_0_45z;
  wire celloutsig_0_49z;
  wire celloutsig_0_52z;
  wire celloutsig_0_55z;
  wire celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire [15:0] celloutsig_0_60z;
  wire celloutsig_0_62z;
  wire [5:0] celloutsig_0_6z;
  wire celloutsig_0_71z;
  wire [4:0] celloutsig_0_75z;
  wire [9:0] celloutsig_0_79z;
  wire celloutsig_0_7z;
  wire celloutsig_0_80z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [2:0] celloutsig_1_12z;
  wire [7:0] celloutsig_1_14z;
  wire [24:0] celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire [4:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [8:0] celloutsig_1_19z;
  wire celloutsig_1_3z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [9:0] celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_49z = ~(celloutsig_0_43z & celloutsig_0_12z);
  assign celloutsig_0_20z = ~(celloutsig_0_0z[4] & celloutsig_0_3z[2]);
  assign celloutsig_0_21z = ~(celloutsig_0_18z & in_data[86]);
  assign celloutsig_1_6z = !(1'h1 ? in_data[167] : celloutsig_1_0z);
  assign celloutsig_0_16z = !(celloutsig_0_10z ? in_data[59] : celloutsig_0_1z[4]);
  assign celloutsig_0_52z = ~((celloutsig_0_37z | celloutsig_0_20z) & celloutsig_0_2z);
  assign celloutsig_1_7z = ~((1'h1 | celloutsig_1_0z) & 1'h0);
  assign celloutsig_1_11z = ~((1'h1 | 1'h1) & celloutsig_1_6z);
  assign celloutsig_1_16z = ~((1'h1 | celloutsig_1_15z[21]) & 1'h1);
  assign celloutsig_0_40z = ~((celloutsig_0_33z | celloutsig_0_29z) & (celloutsig_0_38z[1] | celloutsig_0_13z[3]));
  assign celloutsig_1_0z = in_data[107] | ~(in_data[161]);
  assign celloutsig_0_58z = celloutsig_0_28z | celloutsig_0_22z[0];
  assign celloutsig_0_62z = celloutsig_0_5z | celloutsig_0_10z;
  assign celloutsig_0_9z = celloutsig_0_7z | celloutsig_0_1z[3];
  assign celloutsig_0_35z = celloutsig_0_31z[11] ^ celloutsig_0_10z;
  assign celloutsig_0_17z = celloutsig_0_16z ^ celloutsig_0_5z;
  assign celloutsig_0_57z = ~(celloutsig_0_31z[4] ^ celloutsig_0_37z);
  assign celloutsig_0_14z = ~(celloutsig_0_8z ^ celloutsig_0_0z[7]);
  assign celloutsig_0_2z = ~(celloutsig_0_1z[1] ^ in_data[1]);
  assign celloutsig_0_29z = ~(celloutsig_0_5z ^ in_data[71]);
  assign celloutsig_0_0z = in_data[69:62] + in_data[40:33];
  assign celloutsig_0_1z = in_data[10:6] + in_data[12:8];
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _00_ <= 5'h00;
    else _00_ <= { celloutsig_0_27z[6:4], celloutsig_0_26z, celloutsig_0_28z };
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[0])
    if (clkin_data[0]) _02_ <= 5'h00;
    else _02_ <= { celloutsig_0_1z[4], celloutsig_0_3z, celloutsig_0_2z };
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[0])
    if (clkin_data[0]) _01_ <= 7'h00;
    else _01_ <= { celloutsig_0_19z[4], _00_, celloutsig_0_10z };
  assign celloutsig_0_38z = celloutsig_0_27z / { 1'h1, celloutsig_0_0z };
  assign celloutsig_0_75z = celloutsig_0_15z[5:1] / { 1'h1, celloutsig_0_60z[13:11], celloutsig_0_55z };
  assign celloutsig_0_22z = { _02_[3:0], celloutsig_0_0z } / { 1'h1, celloutsig_0_3z[1:0], celloutsig_0_5z, celloutsig_0_15z, celloutsig_0_16z };
  assign celloutsig_0_5z = celloutsig_0_1z[4:1] == { celloutsig_0_1z[2:0], celloutsig_0_2z };
  assign celloutsig_1_3z = { celloutsig_1_0z, 2'h3, celloutsig_1_0z, 1'h1 } == in_data[186:182];
  assign celloutsig_1_5z = { in_data[172:171], celloutsig_1_3z, celloutsig_1_0z } == { in_data[146:145], 1'h1, celloutsig_1_3z };
  assign celloutsig_1_18z = { in_data[97], 2'h3, celloutsig_1_16z } == { celloutsig_1_12z[1:0], celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_0_10z = { celloutsig_0_6z[3:1], celloutsig_0_5z } == { celloutsig_0_0z[7:5], celloutsig_0_9z };
  assign celloutsig_0_12z = { celloutsig_0_0z[6:2], celloutsig_0_1z } == { in_data[86], celloutsig_0_10z, celloutsig_0_2z, _02_, celloutsig_0_8z, celloutsig_0_8z };
  assign celloutsig_0_41z = _02_[3:0] > { _02_[1:0], celloutsig_0_40z, celloutsig_0_33z };
  assign celloutsig_0_55z = { celloutsig_0_22z[8:1], celloutsig_0_18z, celloutsig_0_2z, celloutsig_0_45z, celloutsig_0_52z } > { celloutsig_0_6z[5:3], celloutsig_0_2z, celloutsig_0_27z, celloutsig_0_37z };
  assign celloutsig_0_43z = celloutsig_0_22z[8:0] <= { celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_29z };
  assign celloutsig_0_80z = { celloutsig_0_57z, celloutsig_0_58z, celloutsig_0_75z } <= { celloutsig_0_3z, celloutsig_0_49z, celloutsig_0_3z };
  assign celloutsig_0_26z = { celloutsig_0_13z[5:4], celloutsig_0_17z } <= { celloutsig_0_16z, celloutsig_0_21z, celloutsig_0_7z };
  assign celloutsig_0_33z = ! { celloutsig_0_15z[2:0], celloutsig_0_12z };
  assign celloutsig_0_28z = { celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_26z, celloutsig_0_7z, celloutsig_0_20z, celloutsig_0_11z } || { celloutsig_0_15z[5:0], celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_25z, celloutsig_0_21z };
  assign celloutsig_0_25z = celloutsig_0_18z & ~(in_data[2]);
  assign celloutsig_0_6z = celloutsig_0_0z[5:0] * { celloutsig_0_5z, celloutsig_0_1z };
  assign celloutsig_0_19z = - { celloutsig_0_0z[5:0], celloutsig_0_9z };
  assign celloutsig_0_71z = { celloutsig_0_0z[2], celloutsig_0_35z, celloutsig_0_9z, celloutsig_0_33z, celloutsig_0_58z, celloutsig_0_35z } !== celloutsig_0_31z[6:1];
  assign celloutsig_0_18z = { celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_16z } !== { celloutsig_0_13z[3:1], celloutsig_0_14z };
  assign celloutsig_1_14z = celloutsig_1_9z[9:2] | in_data[186:179];
  assign celloutsig_0_37z = | { celloutsig_0_8z, celloutsig_0_21z, celloutsig_0_30z };
  assign celloutsig_0_8z = | { celloutsig_0_6z[1], celloutsig_0_3z, celloutsig_0_5z };
  assign celloutsig_1_10z = | in_data[106:98];
  assign celloutsig_0_11z = | in_data[34:25];
  assign celloutsig_0_7z = ^ { in_data[16:3], celloutsig_0_2z };
  assign celloutsig_0_79z = { celloutsig_0_39z[11:10], celloutsig_0_19z, celloutsig_0_62z } >> { celloutsig_0_22z[5:1], celloutsig_0_10z, celloutsig_0_71z, celloutsig_0_71z, celloutsig_0_55z, celloutsig_0_41z };
  assign celloutsig_1_9z = { celloutsig_1_7z, celloutsig_1_0z, 2'h3, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_7z, 1'h0, celloutsig_1_3z, celloutsig_1_5z } >> { in_data[154:148], 1'h1, celloutsig_1_3z, 1'h1 };
  assign celloutsig_1_17z = { celloutsig_1_14z[4:2], celloutsig_1_11z, celloutsig_1_11z } >> { in_data[102:99], celloutsig_1_7z };
  assign celloutsig_0_15z = { celloutsig_0_1z[2:0], celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_14z } >> { _02_[0], _02_, celloutsig_0_2z };
  assign celloutsig_1_19z = { celloutsig_1_15z[7:5], celloutsig_1_6z, celloutsig_1_11z, 1'h0, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_18z } << { celloutsig_1_12z, celloutsig_1_17z, celloutsig_1_11z };
  assign celloutsig_0_60z = { celloutsig_0_31z[13:9], celloutsig_0_43z, celloutsig_0_2z, celloutsig_0_27z } <<< { celloutsig_0_16z, celloutsig_0_2z, celloutsig_0_49z, celloutsig_0_13z, _01_ };
  assign celloutsig_0_27z = { celloutsig_0_7z, celloutsig_0_0z } <<< { celloutsig_0_11z, celloutsig_0_26z, celloutsig_0_12z, celloutsig_0_6z };
  assign celloutsig_0_3z = { in_data[19:18], celloutsig_0_2z } >>> celloutsig_0_1z[4:2];
  assign celloutsig_0_45z = in_data[91:89] >>> { _00_[2:1], celloutsig_0_18z };
  assign celloutsig_1_12z = { 2'h3, celloutsig_1_11z } ~^ { celloutsig_1_6z, celloutsig_1_3z, 1'h1 };
  assign celloutsig_0_13z = { celloutsig_0_1z, celloutsig_0_11z } ~^ { _02_[3], celloutsig_0_1z };
  assign celloutsig_0_30z = { celloutsig_0_3z[2], celloutsig_0_25z, celloutsig_0_26z, celloutsig_0_25z, celloutsig_0_16z } ~^ celloutsig_0_6z[5:1];
  assign celloutsig_0_39z = { in_data[57:48], celloutsig_0_14z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_26z } ^ { celloutsig_0_23z[14:6], celloutsig_0_19z, celloutsig_0_25z };
  assign celloutsig_0_23z = { celloutsig_0_15z[5], celloutsig_0_18z, celloutsig_0_21z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_8z } ^ { celloutsig_0_13z[3:1], _02_, celloutsig_0_19z, celloutsig_0_12z };
  assign celloutsig_0_31z = { celloutsig_0_22z[9:6], celloutsig_0_0z, celloutsig_0_25z, celloutsig_0_25z } ^ celloutsig_0_23z[15:2];
  assign { celloutsig_1_15z[14], celloutsig_1_15z[24], celloutsig_1_15z[13], celloutsig_1_15z[23], celloutsig_1_15z[12], celloutsig_1_15z[22], celloutsig_1_15z[11], celloutsig_1_15z[21:20], celloutsig_1_15z[10:9], celloutsig_1_15z[19], celloutsig_1_15z[8], celloutsig_1_15z[18:17], celloutsig_1_15z[7], celloutsig_1_15z[16], celloutsig_1_15z[6], celloutsig_1_15z[15], celloutsig_1_15z[5:4], celloutsig_1_15z[0] } = { celloutsig_1_9z[9], celloutsig_1_9z[9:8], celloutsig_1_9z[8:7], celloutsig_1_9z[7:6], celloutsig_1_9z[6:5], celloutsig_1_9z[5:4], celloutsig_1_9z[4:3], celloutsig_1_9z[3:2], celloutsig_1_9z[2:1], celloutsig_1_9z[1:0], celloutsig_1_9z[0], celloutsig_1_3z, celloutsig_1_3z } ~^ { celloutsig_1_12z[2], in_data[132], celloutsig_1_12z[1], in_data[131], celloutsig_1_12z[0], in_data[130], celloutsig_1_10z, in_data[129], celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_11z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_12z[2], celloutsig_1_6z, celloutsig_1_12z[1], celloutsig_1_0z, celloutsig_1_12z[0], celloutsig_1_5z, celloutsig_1_11z, celloutsig_1_6z };
  assign celloutsig_1_15z[3:1] = 3'h7;
  assign { out_data[128], out_data[104:96], out_data[41:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_79z, celloutsig_0_80z };
endmodule
