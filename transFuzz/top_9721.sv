/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [5:0] _02_;
  wire [11:0] _03_;
  wire [5:0] _04_;
  wire [18:0] celloutsig_0_10z;
  wire [9:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [11:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [2:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [2:0] celloutsig_0_22z;
  wire [26:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire [5:0] celloutsig_0_2z;
  wire [3:0] celloutsig_0_30z;
  wire [9:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [3:0] celloutsig_0_33z;
  wire [3:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [3:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire celloutsig_0_47z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [3:0] celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire [3:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_68z;
  wire celloutsig_0_6z;
  wire [13:0] celloutsig_0_71z;
  wire [3:0] celloutsig_0_72z;
  wire celloutsig_0_7z;
  wire [9:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_35z = celloutsig_0_26z ? celloutsig_0_5z : celloutsig_0_10z[12];
  assign celloutsig_0_4z = celloutsig_0_3z ? celloutsig_0_2z[5] : celloutsig_0_3z;
  assign celloutsig_0_41z = celloutsig_0_24z ? celloutsig_0_11z[7] : celloutsig_0_40z;
  assign celloutsig_0_5z = celloutsig_0_4z ? celloutsig_0_1z : _00_;
  assign celloutsig_0_54z = celloutsig_0_45z ? celloutsig_0_2z[0] : celloutsig_0_51z[3];
  assign celloutsig_1_6z = in_data[154] ? celloutsig_1_3z : in_data[159];
  assign celloutsig_0_13z = celloutsig_0_10z[16] ? in_data[33] : celloutsig_0_7z;
  assign celloutsig_0_15z = celloutsig_0_14z ? celloutsig_0_7z : celloutsig_0_14z;
  assign celloutsig_1_3z = !(celloutsig_1_1z ? celloutsig_1_0z : celloutsig_1_2z);
  assign celloutsig_0_27z = !(celloutsig_0_22z[0] ? celloutsig_0_25z : celloutsig_0_24z);
  assign celloutsig_0_36z = ~((celloutsig_0_23z[14] | celloutsig_0_3z) & (celloutsig_0_14z | celloutsig_0_25z));
  assign celloutsig_0_37z = ~((celloutsig_0_4z | celloutsig_0_23z[12]) & (celloutsig_0_35z | celloutsig_0_31z[7]));
  assign celloutsig_0_50z = ~((celloutsig_0_45z | celloutsig_0_22z[2]) & (celloutsig_0_5z | celloutsig_0_39z[0]));
  assign celloutsig_0_52z = ~((_01_ | celloutsig_0_24z) & (celloutsig_0_33z[1] | celloutsig_0_42z));
  assign celloutsig_0_24z = ~((celloutsig_0_16z[1] | celloutsig_0_17z) & (celloutsig_0_2z[3] | celloutsig_0_4z));
  assign celloutsig_0_47z = celloutsig_0_32z | celloutsig_0_41z;
  assign celloutsig_0_12z = in_data[95] | celloutsig_0_7z;
  assign celloutsig_0_14z = celloutsig_0_12z | celloutsig_0_3z;
  assign celloutsig_0_40z = ~(celloutsig_0_24z ^ in_data[23]);
  assign celloutsig_1_7z = ~(in_data[130] ^ celloutsig_1_4z);
  assign celloutsig_0_59z = celloutsig_0_33z + { celloutsig_0_34z[0], celloutsig_0_36z, celloutsig_0_56z, celloutsig_0_53z };
  assign celloutsig_0_10z = in_data[51:33] + { in_data[46:30], celloutsig_0_3z, celloutsig_0_3z };
  reg [5:0] _27_;
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[64])
    if (clkin_data[64]) _27_ <= 6'h00;
    else _27_ <= in_data[89:84];
  assign { _04_[5:4], _00_, _04_[2:0] } = _27_;
  reg [11:0] _28_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[64])
    if (!clkin_data[64]) _28_ <= 12'h000;
    else _28_ <= { in_data[58:48], celloutsig_0_7z };
  assign { _03_[11], _02_[5], celloutsig_0_33z[3:1], _01_, _02_[0], _03_[4:0] } = _28_;
  assign celloutsig_0_31z = { celloutsig_0_23z[18:15], celloutsig_0_22z, celloutsig_0_19z } / { 1'h1, in_data[70:63], celloutsig_0_5z };
  assign celloutsig_0_51z = { in_data[78:77], celloutsig_0_24z, celloutsig_0_3z } / { 1'h1, celloutsig_0_30z[0], celloutsig_0_3z, celloutsig_0_15z };
  assign celloutsig_0_72z = { celloutsig_0_36z, celloutsig_0_17z, celloutsig_0_56z, celloutsig_0_5z } / { 1'h1, celloutsig_0_50z, celloutsig_0_43z, celloutsig_0_12z };
  assign celloutsig_0_16z = { celloutsig_0_2z[5:3], _04_[5:4], _00_, _04_[2:0], celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_15z } / { 1'h1, celloutsig_0_2z[2:1], celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_2z };
  assign celloutsig_0_3z = { celloutsig_0_1z, _04_[5:4], _00_, _04_[2:0], celloutsig_0_1z } >= { in_data[28], celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_68z = { celloutsig_0_52z, celloutsig_0_6z, celloutsig_0_27z, celloutsig_0_26z, celloutsig_0_15z } >= { celloutsig_0_22z[2:1], celloutsig_0_14z, celloutsig_0_42z, celloutsig_0_1z };
  assign celloutsig_0_43z = { celloutsig_0_23z[1:0], celloutsig_0_34z } > { celloutsig_0_1z, celloutsig_0_37z, celloutsig_0_41z, celloutsig_0_38z, celloutsig_0_18z, celloutsig_0_24z };
  assign celloutsig_0_55z = { celloutsig_0_31z[2:1], celloutsig_0_16z } > { celloutsig_0_10z[4:0], celloutsig_0_52z, celloutsig_0_47z, celloutsig_0_38z, celloutsig_0_30z, celloutsig_0_54z, celloutsig_0_37z };
  assign celloutsig_1_0z = in_data[191:170] > in_data[164:143];
  assign celloutsig_1_1z = { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } > { in_data[123], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_2z = { in_data[159:108], celloutsig_1_0z } > in_data[171:119];
  assign celloutsig_1_4z = { in_data[134:119], celloutsig_1_0z } > { in_data[142:128], celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_0_17z = celloutsig_0_9z[8:0] > celloutsig_0_11z[8:0];
  assign celloutsig_0_18z = in_data[69:56] > { celloutsig_0_10z[6:5], celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_17z };
  assign celloutsig_0_61z = { celloutsig_0_2z[5:1], celloutsig_0_42z, celloutsig_0_52z, celloutsig_0_3z, celloutsig_0_19z, celloutsig_0_22z, celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_54z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_29z, celloutsig_0_35z } <= { celloutsig_0_10z[11:5], celloutsig_0_22z, celloutsig_0_20z, celloutsig_0_42z, celloutsig_0_39z, celloutsig_0_18z, celloutsig_0_42z, celloutsig_0_43z, celloutsig_0_41z, celloutsig_0_13z, celloutsig_0_35z };
  assign celloutsig_0_26z = { in_data[23:9], celloutsig_0_7z, celloutsig_0_14z, celloutsig_0_25z } <= { celloutsig_0_33z[2], celloutsig_0_20z, celloutsig_0_24z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_21z };
  assign celloutsig_0_45z = { celloutsig_0_16z[11:3], celloutsig_0_19z, celloutsig_0_22z, celloutsig_0_6z } < { _03_[4:3], celloutsig_0_1z, celloutsig_0_42z, celloutsig_0_30z, celloutsig_0_35z, celloutsig_0_7z, celloutsig_0_20z };
  assign celloutsig_0_71z = { celloutsig_0_68z, celloutsig_0_30z, celloutsig_0_22z, celloutsig_0_13z, celloutsig_0_59z, celloutsig_0_12z } % { 1'h1, celloutsig_0_10z[12:7], celloutsig_0_40z, celloutsig_0_4z, celloutsig_0_61z, celloutsig_0_33z };
  assign celloutsig_0_33z[0] = celloutsig_0_25z ? celloutsig_0_32z : _01_;
  assign celloutsig_1_8z[3:1] = in_data[145] ? { celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_3z } : { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_7z };
  assign celloutsig_0_9z = celloutsig_0_4z ? { celloutsig_0_2z[3:0], celloutsig_0_2z } : { 1'h0, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_56z = celloutsig_0_33z[3:1] != { celloutsig_0_43z, celloutsig_0_55z, celloutsig_0_5z };
  assign celloutsig_0_6z = { in_data[13:8], celloutsig_0_1z } != { in_data[81:78], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_7z = { in_data[54:52], celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_1z, _04_[5:4], _00_, _04_[2:0], celloutsig_0_3z } != { in_data[24:22], _04_[5:4], _00_, _04_[2:0], celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_21z = { celloutsig_0_33z[2:1], _01_, _02_[0], _03_[4:1] } !== { celloutsig_0_16z[8:2], celloutsig_0_7z };
  assign celloutsig_0_25z = celloutsig_0_10z[10:2] !== celloutsig_0_9z[8:0];
  assign celloutsig_0_32z = ^ celloutsig_0_2z[4:1];
  assign celloutsig_0_53z = ^ { celloutsig_0_23z[21:18], celloutsig_0_3z, celloutsig_0_40z, celloutsig_0_3z, celloutsig_0_30z, celloutsig_0_30z, celloutsig_0_13z, celloutsig_0_25z, _04_[5:4], _00_, _04_[2:0], celloutsig_0_5z, celloutsig_0_34z, celloutsig_0_34z };
  assign celloutsig_1_18z = ^ { celloutsig_1_2z, celloutsig_1_8z[3:1], celloutsig_1_2z, celloutsig_1_6z };
  assign celloutsig_1_19z = ^ { in_data[156:154], celloutsig_1_2z };
  assign celloutsig_0_1z = ^ { in_data[55:45], _04_[5:4], _00_, _04_[2:0] };
  assign celloutsig_0_29z = ^ celloutsig_0_11z[6:0];
  assign celloutsig_0_30z = celloutsig_0_16z[6:3] >> { celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_15z, celloutsig_0_18z };
  assign celloutsig_0_34z = { celloutsig_0_20z[1:0], celloutsig_0_13z, celloutsig_0_4z } >> { celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_15z };
  assign celloutsig_0_20z = { celloutsig_0_11z[8:4], celloutsig_0_3z } >> { _02_[5], celloutsig_0_33z[3:1], _01_, celloutsig_0_1z };
  assign celloutsig_0_22z = in_data[59:57] <<< celloutsig_0_11z[7:5];
  assign celloutsig_0_23z = { celloutsig_0_20z, celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_1z } <<< { _00_, _04_[2], _03_[11], _02_[5], celloutsig_0_33z[3:1], _01_, _02_[0], _03_[4:0], celloutsig_0_18z, _03_[11], _02_[5], celloutsig_0_33z[3:1], _01_, _02_[0], _03_[4:0] };
  assign celloutsig_0_11z = { celloutsig_0_10z[11:4], celloutsig_0_6z, celloutsig_0_6z } >>> { _04_[2:0], celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_0_39z = { _04_[5:4], _00_, _04_[2] } ~^ { celloutsig_0_11z[5:3], celloutsig_0_35z };
  assign celloutsig_0_19z = { _03_[2:1], celloutsig_0_13z } ~^ { in_data[61], celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_0_2z = { in_data[10:8], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z } ~^ in_data[89:84];
  assign celloutsig_0_38z = ~((_03_[2] & celloutsig_0_34z[1]) | (celloutsig_0_35z & celloutsig_0_9z[5]));
  assign celloutsig_0_42z = ~((celloutsig_0_35z & _02_[0]) | (celloutsig_0_15z & in_data[27]));
  assign _02_[4:1] = { celloutsig_0_33z[3:1], _01_ };
  assign _03_[10:5] = { _02_[5], celloutsig_0_33z[3:1], _01_, _02_[0] };
  assign _04_[3] = _00_;
  assign celloutsig_1_8z[0] = celloutsig_1_2z;
  assign { out_data[128], out_data[96], out_data[45:32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_71z, celloutsig_0_72z };
endmodule
