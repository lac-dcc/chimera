/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire [5:0] _05_;
  reg [6:0] _06_;
  wire [5:0] _07_;
  reg [15:0] _08_;
  wire [4:0] celloutsig_0_0z;
  wire [5:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [15:0] celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire [7:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [11:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [15:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [6:0] celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [14:0] celloutsig_0_29z;
  wire [16:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire [4:0] celloutsig_0_35z;
  wire [3:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [4:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [19:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire [6:0] celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire [7:0] celloutsig_0_46z;
  wire [23:0] celloutsig_0_48z;
  wire [3:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire [11:0] celloutsig_0_54z;
  wire [12:0] celloutsig_0_55z;
  wire [7:0] celloutsig_0_56z;
  wire celloutsig_0_59z;
  wire [13:0] celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire [2:0] celloutsig_0_65z;
  wire celloutsig_0_68z;
  wire [5:0] celloutsig_0_6z;
  wire celloutsig_0_75z;
  wire celloutsig_0_76z;
  wire [11:0] celloutsig_0_78z;
  wire celloutsig_0_7z;
  wire [16:0] celloutsig_0_81z;
  wire [43:0] celloutsig_0_82z;
  wire [3:0] celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [26:0] celloutsig_1_11z;
  wire [22:0] celloutsig_1_12z;
  wire celloutsig_1_15z;
  wire [9:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [13:0] celloutsig_1_19z;
  wire [5:0] celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [5:0] celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [8:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_18z = ~celloutsig_1_7z;
  assign celloutsig_0_32z = ~((celloutsig_0_11z | celloutsig_0_21z) & celloutsig_0_29z[14]);
  assign celloutsig_1_10z = ~((celloutsig_1_2z[1] | celloutsig_1_2z[1]) & celloutsig_1_3z);
  assign celloutsig_0_30z = ~((celloutsig_0_14z | _00_) & (celloutsig_0_6z[3] | _01_));
  assign celloutsig_0_4z = ~((celloutsig_0_2z[11] | celloutsig_0_1z[2]) & (celloutsig_0_2z[7] | celloutsig_0_2z[6]));
  assign celloutsig_0_75z = ~((celloutsig_0_37z | celloutsig_0_37z) & (_03_ | celloutsig_0_50z));
  assign celloutsig_0_13z = ~((celloutsig_0_10z[2] | _01_) & (celloutsig_0_9z[3] | celloutsig_0_6z[1]));
  assign celloutsig_0_19z = ~((celloutsig_0_6z[1] | celloutsig_0_18z[7]) & (celloutsig_0_10z[0] | celloutsig_0_9z[0]));
  assign celloutsig_0_76z = celloutsig_0_50z | celloutsig_0_15z[5];
  assign celloutsig_1_3z = celloutsig_1_1z[2] | in_data[189];
  assign celloutsig_0_14z = celloutsig_0_1z[0] | celloutsig_0_3z;
  assign celloutsig_0_42z = ~(celloutsig_0_27z ^ _04_);
  reg [5:0] _21_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _21_ <= 6'h00;
    else _21_ <= { celloutsig_0_9z[2:0], celloutsig_0_11z, celloutsig_0_24z, celloutsig_0_27z };
  assign { _05_[5], _02_, _05_[3:2], _03_, _05_[0] } = _21_;
  reg [5:0] _22_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _22_ <= 6'h00;
    else _22_ <= celloutsig_0_6z;
  assign { _07_[5:4], _04_, _01_, _00_, _07_[0] } = _22_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _08_ <= 16'h0000;
    else _08_ <= { celloutsig_0_2z[9:0], celloutsig_0_6z };
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _06_ <= 7'h00;
    else _06_ <= { celloutsig_0_25z[6:2], celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_0_49z = celloutsig_0_6z[4:1] & { celloutsig_0_39z[2:1], celloutsig_0_21z, celloutsig_0_24z };
  assign celloutsig_1_16z = { celloutsig_1_8z[8:1], celloutsig_1_10z, celloutsig_1_15z } & { celloutsig_1_11z[16:9], celloutsig_1_10z, celloutsig_1_10z };
  assign celloutsig_0_22z = { celloutsig_0_5z[4:2], celloutsig_0_7z, celloutsig_0_1z } & { celloutsig_0_5z[12:3], celloutsig_0_6z };
  assign celloutsig_0_39z = { celloutsig_0_36z, celloutsig_0_30z } / { 1'h1, celloutsig_0_1z[10:7] };
  assign celloutsig_1_8z = { celloutsig_1_4z[4:0], celloutsig_1_6z, celloutsig_1_2z } / { 1'h1, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_6z };
  assign celloutsig_0_2z = in_data[32:16] / { 1'h1, in_data[46:31] };
  assign celloutsig_0_56z = { celloutsig_0_24z, celloutsig_0_12z, celloutsig_0_14z } / { 1'h1, celloutsig_0_1z[5:3], celloutsig_0_51z, celloutsig_0_27z, celloutsig_0_11z, celloutsig_0_24z };
  assign celloutsig_1_1z = { celloutsig_1_0z[2], celloutsig_1_0z } / { 1'h1, in_data[123:119] };
  assign celloutsig_1_4z = { celloutsig_1_0z[2:0], celloutsig_1_2z } / { 1'h1, celloutsig_1_0z };
  assign celloutsig_0_45z = { _07_[4], _04_, _01_, _00_, _07_[0] } == { celloutsig_0_44z[5:2], celloutsig_0_42z };
  assign celloutsig_0_21z = celloutsig_0_5z[6:1] == { celloutsig_0_12z[3:0], celloutsig_0_14z, celloutsig_0_13z };
  assign celloutsig_0_50z = { celloutsig_0_39z[2:0], celloutsig_0_32z, celloutsig_0_36z } === { celloutsig_0_24z, celloutsig_0_4z, celloutsig_0_24z, celloutsig_0_36z, celloutsig_0_20z };
  assign celloutsig_1_6z = celloutsig_1_1z[5:1] === celloutsig_1_0z;
  assign celloutsig_0_20z = celloutsig_0_6z[5:2] === { _07_[5:4], _04_, _01_ };
  assign celloutsig_0_23z = { celloutsig_0_1z[7:6], celloutsig_0_9z, celloutsig_0_14z } <= { _07_[4], _04_, _01_, _00_, _07_[0], celloutsig_0_3z, celloutsig_0_13z };
  assign celloutsig_0_3z = { in_data[18:10], celloutsig_0_2z } && { celloutsig_0_1z[9:6], celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_43z = { celloutsig_0_5z[7:3], celloutsig_0_19z } && { celloutsig_0_21z, celloutsig_0_9z, celloutsig_0_27z };
  assign celloutsig_0_61z = { celloutsig_0_11z, celloutsig_0_36z } && celloutsig_0_56z[7:3];
  assign celloutsig_1_9z = { celloutsig_1_0z[3:1], celloutsig_1_4z } < { celloutsig_1_4z[5:1], celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_3z };
  assign celloutsig_0_27z = { celloutsig_0_9z[2:1], celloutsig_0_4z, celloutsig_0_19z } < celloutsig_0_12z[3:0];
  assign celloutsig_0_46z = celloutsig_0_5z[10:3] % { 1'h1, celloutsig_0_0z[3:2], celloutsig_0_45z, celloutsig_0_9z };
  assign celloutsig_0_54z = { celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_45z } % { 1'h1, celloutsig_0_41z[11:6], celloutsig_0_35z };
  assign celloutsig_0_81z = { celloutsig_0_44z[5:0], celloutsig_0_49z, _05_[5], _02_, _05_[3:2], _03_, _05_[0], celloutsig_0_14z } % { 1'h1, celloutsig_0_9z[2:0], celloutsig_0_68z, celloutsig_0_78z };
  assign celloutsig_0_59z = { _05_[5], _02_, _05_[3:2], _03_ } != celloutsig_0_48z[16:12];
  assign celloutsig_0_7z = celloutsig_0_2z[12:9] != { celloutsig_0_2z[4:3], celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_28z = { celloutsig_0_2z[6:2], celloutsig_0_4z, celloutsig_0_13z, celloutsig_0_23z, celloutsig_0_13z } != { celloutsig_0_22z[8:2], celloutsig_0_20z, celloutsig_0_17z };
  assign celloutsig_0_11z = { celloutsig_0_10z[5:2], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_4z } !== { celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_36z = ~ { celloutsig_0_14z, celloutsig_0_30z, celloutsig_0_32z, celloutsig_0_13z };
  assign celloutsig_0_48z = ~ { _07_[5:4], _04_, _01_, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_45z, celloutsig_0_42z, celloutsig_0_44z };
  assign celloutsig_0_6z = ~ celloutsig_0_1z[7:2];
  assign celloutsig_0_9z = ~ celloutsig_0_2z[3:0];
  assign celloutsig_0_0z = in_data[47:43] | in_data[10:6];
  assign celloutsig_0_78z = { celloutsig_0_15z[8:0], celloutsig_0_65z } | celloutsig_0_55z[12:1];
  assign celloutsig_1_11z = { celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_8z } | { celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_7z };
  assign celloutsig_1_19z = { celloutsig_1_12z[22:11], celloutsig_1_18z, celloutsig_1_10z } | { celloutsig_1_16z[7:2], celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_15z, celloutsig_1_2z, celloutsig_1_9z, celloutsig_1_10z };
  assign celloutsig_0_1z = in_data[86:75] | in_data[30:19];
  assign celloutsig_0_17z = celloutsig_0_4z & celloutsig_0_12z[4];
  assign celloutsig_0_68z = | celloutsig_0_35z;
  assign celloutsig_1_7z = | celloutsig_1_4z;
  assign celloutsig_0_24z = | celloutsig_0_1z[7:2];
  assign celloutsig_0_37z = ^ { celloutsig_0_29z[13], celloutsig_0_24z, celloutsig_0_32z, celloutsig_0_20z };
  assign celloutsig_0_40z = ^ celloutsig_0_2z[15:5];
  assign celloutsig_0_51z = ^ { celloutsig_0_41z[7:6], celloutsig_0_28z };
  assign celloutsig_1_15z = ^ { celloutsig_1_11z[24:14], celloutsig_1_6z };
  assign celloutsig_0_10z = { in_data[49:48], celloutsig_0_9z } >> { celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_0_35z = { _07_[4], celloutsig_0_9z } >> { _05_[3:2], celloutsig_0_13z, celloutsig_0_21z, celloutsig_0_23z };
  assign celloutsig_0_5z = in_data[63:50] >> { in_data[89:81], celloutsig_0_0z };
  assign celloutsig_0_82z = { _05_[2], celloutsig_0_43z, celloutsig_0_21z, celloutsig_0_59z, celloutsig_0_65z, celloutsig_0_29z, celloutsig_0_25z, _06_, celloutsig_0_12z, celloutsig_0_61z, celloutsig_0_3z } >> { _08_, celloutsig_0_54z, celloutsig_0_6z, celloutsig_0_23z, celloutsig_0_24z, celloutsig_0_65z, celloutsig_0_75z, celloutsig_0_76z, celloutsig_0_50z, celloutsig_0_59z, celloutsig_0_28z };
  assign celloutsig_0_41z = { celloutsig_0_9z[1], celloutsig_0_20z, celloutsig_0_28z, celloutsig_0_2z } <<< { _06_[1:0], celloutsig_0_22z, celloutsig_0_11z, celloutsig_0_7z };
  assign celloutsig_0_44z = celloutsig_0_5z[6:0] <<< { celloutsig_0_0z[3:2], celloutsig_0_40z, celloutsig_0_36z };
  assign celloutsig_1_0z = in_data[112:108] <<< in_data[107:103];
  assign celloutsig_0_12z = celloutsig_0_10z <<< celloutsig_0_5z[7:2];
  assign celloutsig_0_15z = { in_data[64:62], celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_3z } <<< { _07_[4], _04_, _01_, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_10z };
  assign celloutsig_0_18z = { celloutsig_0_10z[1:0], celloutsig_0_12z } <<< { _07_[5:4], _04_, _01_, _00_, _07_[0], celloutsig_0_7z, celloutsig_0_14z };
  assign celloutsig_0_29z = { celloutsig_0_22z[2:1], celloutsig_0_10z, celloutsig_0_28z, celloutsig_0_4z, celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_19z, celloutsig_0_27z, celloutsig_0_3z } <<< { in_data[44:37], celloutsig_0_12z, celloutsig_0_13z };
  assign celloutsig_0_55z = { celloutsig_0_42z, celloutsig_0_37z, celloutsig_0_39z, celloutsig_0_0z, celloutsig_0_42z } >>> { celloutsig_0_36z, celloutsig_0_24z, celloutsig_0_46z };
  assign celloutsig_0_65z = celloutsig_0_35z[2:0] >>> celloutsig_0_5z[13:11];
  assign celloutsig_1_2z = celloutsig_1_0z[4:2] >>> celloutsig_1_1z[3:1];
  assign celloutsig_1_12z = { celloutsig_1_11z[17:13], celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_0z } >>> { in_data[173:152], celloutsig_1_6z };
  assign celloutsig_0_25z = _08_[7:1] >>> { in_data[24:20], celloutsig_0_17z, celloutsig_0_21z };
  assign { _05_[4], _05_[1] } = { _02_, _03_ };
  assign _07_[3:1] = { _04_, _01_, _00_ };
  assign { out_data[128], out_data[109:96], out_data[48:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_81z, celloutsig_0_82z[33:2] };
endmodule
