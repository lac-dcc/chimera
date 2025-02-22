/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [33:0] _01_;
  reg [14:0] _02_;
  wire [7:0] _03_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [8:0] celloutsig_0_16z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [5:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [7:0] celloutsig_0_22z;
  wire [12:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [12:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [6:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [18:0] celloutsig_0_35z;
  wire [3:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [10:0] celloutsig_0_3z;
  wire [2:0] celloutsig_0_40z;
  wire [5:0] celloutsig_0_41z;
  wire [6:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire [5:0] celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire [4:0] celloutsig_0_49z;
  wire [2:0] celloutsig_0_4z;
  wire [5:0] celloutsig_0_51z;
  wire celloutsig_0_54z;
  wire celloutsig_0_57z;
  wire [8:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [7:0] celloutsig_0_65z;
  wire celloutsig_0_6z;
  wire [7:0] celloutsig_0_73z;
  wire celloutsig_0_74z;
  wire celloutsig_0_7z;
  wire [7:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [29:0] celloutsig_1_10z;
  wire [8:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_15z;
  wire [4:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_5z;
  wire [5:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = !(in_data[7] ? in_data[69] : in_data[22]);
  assign celloutsig_0_13z = !(celloutsig_0_6z ? celloutsig_0_4z[2] : celloutsig_0_11z);
  assign celloutsig_0_32z = !(celloutsig_0_9z ? celloutsig_0_19z : celloutsig_0_13z);
  assign celloutsig_0_57z = celloutsig_0_11z | celloutsig_0_38z;
  assign celloutsig_0_6z = celloutsig_0_3z[1] | celloutsig_0_1z[0];
  assign celloutsig_0_12z = celloutsig_0_9z | celloutsig_0_2z;
  assign celloutsig_0_18z = in_data[39] | celloutsig_0_0z;
  assign celloutsig_0_34z = celloutsig_0_5z ^ celloutsig_0_10z;
  assign celloutsig_0_28z = celloutsig_0_3z[2] ^ celloutsig_0_26z;
  assign celloutsig_0_36z = { celloutsig_0_33z[6], celloutsig_0_0z, celloutsig_0_24z, celloutsig_0_2z } + in_data[92:89];
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[0])
    if (!clkin_data[0]) _01_ <= 34'h000000000;
    else _01_ <= { celloutsig_0_8z[5:3], celloutsig_0_44z, celloutsig_0_12z, celloutsig_0_60z, celloutsig_0_48z, celloutsig_0_51z, celloutsig_0_59z, celloutsig_0_12z, celloutsig_0_34z, celloutsig_0_7z, celloutsig_0_54z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_38z, celloutsig_0_12z, celloutsig_0_21z, celloutsig_0_40z };
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[0])
    if (clkin_data[0]) _02_ <= 15'h0000;
    else _02_ <= { _01_[21:8], celloutsig_0_48z };
  reg [7:0] _16_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[0])
    if (!clkin_data[0]) _16_ <= 8'h00;
    else _16_ <= celloutsig_0_8z;
  assign { _03_[7:5], _00_, _03_[3:0] } = _16_;
  assign celloutsig_0_4z = celloutsig_0_3z[4:2] & in_data[62:60];
  assign celloutsig_0_65z = { celloutsig_0_4z[0], celloutsig_0_51z, celloutsig_0_43z } & { celloutsig_0_23z[3:1], celloutsig_0_21z, celloutsig_0_4z, celloutsig_0_38z };
  assign celloutsig_1_10z = { celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_5z } & in_data[149:120];
  assign celloutsig_1_11z = in_data[129:121] & { celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_9z };
  assign celloutsig_0_47z = { celloutsig_0_33z[6:5], celloutsig_0_45z, celloutsig_0_40z } / { 1'h1, _03_[6:5], _00_, _03_[3:2] };
  assign celloutsig_1_6z = { 1'h0, celloutsig_1_0z, celloutsig_1_0z, 1'h0, celloutsig_1_3z, celloutsig_1_0z } / { 1'h1, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_5z, in_data[96] };
  assign celloutsig_0_35z = { celloutsig_0_4z[2:1], celloutsig_0_3z, celloutsig_0_28z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_28z } / { 1'h1, _03_[5], _00_, _03_[3], celloutsig_0_20z, celloutsig_0_29z, celloutsig_0_16z, celloutsig_0_29z, celloutsig_0_19z, celloutsig_0_18z, celloutsig_0_31z };
  assign celloutsig_0_49z = celloutsig_0_16z[4:0] / { 1'h1, celloutsig_0_41z[2:1], celloutsig_0_15z, celloutsig_0_2z };
  assign celloutsig_0_43z = celloutsig_0_35z[13:2] == { celloutsig_0_26z, celloutsig_0_41z, celloutsig_0_39z, celloutsig_0_28z, celloutsig_0_37z, celloutsig_0_26z, celloutsig_0_14z };
  assign celloutsig_0_44z = celloutsig_0_35z[14:12] == { celloutsig_0_25z[4:3], celloutsig_0_26z };
  assign celloutsig_0_48z = { celloutsig_0_9z, celloutsig_0_40z } == celloutsig_0_23z[9:6];
  assign celloutsig_0_74z = _01_[15:13] == celloutsig_0_65z[3:1];
  assign celloutsig_0_29z = { celloutsig_0_4z, celloutsig_0_26z, celloutsig_0_1z, _03_[7:5], _00_, _03_[3:0] } == { celloutsig_0_10z, celloutsig_0_12z, celloutsig_0_26z, celloutsig_0_21z, celloutsig_0_7z, celloutsig_0_25z };
  assign celloutsig_1_0z = in_data[182:177] === in_data[143:138];
  assign celloutsig_1_7z = { 1'h0, celloutsig_1_0z } === { celloutsig_1_0z, celloutsig_1_5z };
  assign celloutsig_0_38z = { celloutsig_0_35z[6:1], celloutsig_0_32z, celloutsig_0_11z } >= celloutsig_0_16z[7:0];
  assign celloutsig_0_5z = { celloutsig_0_4z[1:0], celloutsig_0_0z } >= celloutsig_0_1z[2:0];
  assign celloutsig_1_3z = { in_data[154], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } >= in_data[151:148];
  assign celloutsig_0_9z = celloutsig_0_8z[6:3] >= celloutsig_0_1z[5:2];
  assign celloutsig_0_10z = { in_data[5], celloutsig_0_6z, celloutsig_0_4z } > { in_data[71:70], celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_14z = { celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_0z } && { celloutsig_0_8z[7:1], celloutsig_0_5z, celloutsig_0_1z };
  assign celloutsig_0_60z = celloutsig_0_25z[11:0] < { celloutsig_0_3z[2:0], celloutsig_0_31z, _03_[7:5], _00_, _03_[3:0] };
  assign celloutsig_0_7z = { celloutsig_0_1z[3:2], celloutsig_0_0z } < celloutsig_0_1z[2:0];
  assign celloutsig_1_15z = { in_data[122:111], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_12z } < { celloutsig_1_11z, celloutsig_1_5z, celloutsig_1_6z };
  assign celloutsig_1_18z = { celloutsig_1_16z[0], celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_12z } < { celloutsig_1_6z[0], celloutsig_1_7z, celloutsig_1_17z, celloutsig_1_7z };
  assign celloutsig_0_20z = { in_data[8:4], celloutsig_0_15z } < { in_data[59:56], celloutsig_0_7z, celloutsig_0_9z };
  assign celloutsig_0_24z = { celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_11z } < { celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_20z, celloutsig_0_0z };
  assign celloutsig_0_42z = { celloutsig_0_26z, celloutsig_0_38z, celloutsig_0_13z, celloutsig_0_40z, celloutsig_0_9z } % { 1'h1, celloutsig_0_29z, celloutsig_0_39z, celloutsig_0_36z };
  assign celloutsig_1_9z = { celloutsig_1_6z[0], celloutsig_1_8z, celloutsig_1_5z } % { 1'h1, celloutsig_1_7z, celloutsig_1_7z };
  assign celloutsig_1_5z = & { celloutsig_1_3z, celloutsig_1_0z, in_data[152:147] };
  assign celloutsig_0_21z = celloutsig_0_11z & celloutsig_0_20z;
  assign celloutsig_0_37z = ~^ { celloutsig_0_3z[6], celloutsig_0_28z, celloutsig_0_26z };
  assign celloutsig_1_2z = ~^ { in_data[150:137], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_8z = ~^ { in_data[161:160], celloutsig_1_6z };
  assign celloutsig_1_17z = ~^ { celloutsig_1_11z[4:2], celloutsig_1_0z, celloutsig_1_16z, celloutsig_1_3z };
  assign celloutsig_0_11z = ~^ { celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_2z = ~^ celloutsig_0_1z;
  assign celloutsig_0_39z = ^ { celloutsig_0_35z[3], celloutsig_0_32z, celloutsig_0_7z };
  assign celloutsig_1_12z = ^ { celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_11z, celloutsig_1_3z };
  assign celloutsig_0_15z = ^ { celloutsig_0_3z[6:5], celloutsig_0_9z, celloutsig_0_8z };
  assign celloutsig_0_26z = ^ { celloutsig_0_23z[10:1], celloutsig_0_11z };
  assign celloutsig_0_31z = ^ { celloutsig_0_1z[4:3], celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_14z };
  assign celloutsig_0_3z = { celloutsig_0_1z[4], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z } << { celloutsig_0_1z[5:1], celloutsig_0_1z };
  assign celloutsig_0_1z = { in_data[30:27], celloutsig_0_0z, celloutsig_0_0z } << in_data[75:70];
  assign celloutsig_0_40z = in_data[30:28] >> { celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_59z = { celloutsig_0_49z, celloutsig_0_57z, celloutsig_0_39z, celloutsig_0_12z, celloutsig_0_34z } >> { celloutsig_0_34z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_41z };
  assign celloutsig_0_23z = { in_data[58:50], celloutsig_0_10z, celloutsig_0_12z, celloutsig_0_21z, celloutsig_0_10z } >> { celloutsig_0_16z[5:1], celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_20z, celloutsig_0_5z, celloutsig_0_6z };
  assign celloutsig_0_51z = { _03_[7:6], celloutsig_0_36z } <<< { celloutsig_0_1z[5:2], celloutsig_0_29z, celloutsig_0_24z };
  assign celloutsig_0_8z = { celloutsig_0_3z[10:7], celloutsig_0_2z, celloutsig_0_4z } <<< { celloutsig_0_1z[3:0], celloutsig_0_7z, celloutsig_0_4z };
  assign celloutsig_1_16z = { celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_3z } <<< celloutsig_1_10z[16:12];
  assign celloutsig_0_33z = { celloutsig_0_22z[6:2], celloutsig_0_12z, celloutsig_0_9z } >>> { _03_[5], _00_, _03_[3:1], celloutsig_0_13z, celloutsig_0_21z };
  assign celloutsig_0_16z = { in_data[70:68], celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_9z } >>> { celloutsig_0_1z[4:1], celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_0z };
  assign celloutsig_0_41z = { celloutsig_0_19z, celloutsig_0_19z, celloutsig_0_11z, celloutsig_0_20z, celloutsig_0_14z, celloutsig_0_0z } - celloutsig_0_22z[7:2];
  assign celloutsig_0_73z = { _02_[13:11], celloutsig_0_21z, celloutsig_0_43z, celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_21z } ~^ { celloutsig_0_33z[2], celloutsig_0_47z, celloutsig_0_20z };
  assign celloutsig_0_22z = { _00_, _03_[3:1], celloutsig_0_18z, celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_11z } ~^ celloutsig_0_8z;
  assign celloutsig_0_25z = { celloutsig_0_8z[7:1], celloutsig_0_10z, celloutsig_0_19z, celloutsig_0_2z, celloutsig_0_21z, celloutsig_0_2z, celloutsig_0_12z } ~^ in_data[26:14];
  assign celloutsig_0_19z = ~((celloutsig_0_9z & celloutsig_0_16z[7]) | celloutsig_0_12z);
  assign celloutsig_0_45z = ~((celloutsig_0_8z[7] & celloutsig_0_42z[1]) | (celloutsig_0_11z & celloutsig_0_32z));
  assign celloutsig_0_54z = ~((celloutsig_0_10z & celloutsig_0_39z) | (celloutsig_0_18z & celloutsig_0_4z[1]));
  assign out_data[98] = ~ in_data[149];
  assign out_data[96] = ~ celloutsig_1_17z;
  assign { out_data[102], out_data[107:104], out_data[101:99], out_data[103], out_data[97] } = { celloutsig_1_15z, celloutsig_1_10z[17:14], celloutsig_1_9z, celloutsig_1_5z, celloutsig_1_0z } ~^ { in_data[153], in_data[158:155], in_data[152:150], in_data[154], in_data[148] };
  assign _03_[4] = _00_;
  assign { out_data[128], out_data[39:32], out_data[0] } = { celloutsig_1_18z, celloutsig_0_73z, celloutsig_0_74z };
endmodule
