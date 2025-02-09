/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [8:0] _02_;
  wire [3:0] _03_;
  reg [3:0] _04_;
  wire celloutsig_0_0z;
  wire [8:0] celloutsig_0_12z;
  wire [14:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [5:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [15:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [16:0] celloutsig_0_26z;
  wire [6:0] celloutsig_0_27z;
  wire [5:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [13:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [17:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [11:0] celloutsig_0_48z;
  wire [8:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [18:0] celloutsig_0_51z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire [4:0] celloutsig_0_56z;
  wire [12:0] celloutsig_0_5z;
  wire celloutsig_0_62z;
  wire celloutsig_0_68z;
  wire [14:0] celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_74z;
  wire [4:0] celloutsig_0_7z;
  wire celloutsig_0_88z;
  wire celloutsig_0_8z;
  wire [7:0] celloutsig_0_96z;
  wire celloutsig_0_97z;
  wire [2:0] celloutsig_0_9z;
  wire [22:0] celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [11:0] celloutsig_1_14z;
  wire [3:0] celloutsig_1_15z;
  wire [6:0] celloutsig_1_18z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [5:0] celloutsig_1_5z;
  wire [5:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_18z = celloutsig_0_0z ? celloutsig_0_2z : celloutsig_0_17z;
  assign celloutsig_0_23z = celloutsig_0_12z[4] ? celloutsig_0_0z : celloutsig_0_8z;
  assign celloutsig_0_35z = ~(_00_ & celloutsig_0_15z);
  assign celloutsig_0_97z = ~(celloutsig_0_15z & celloutsig_0_40z);
  assign celloutsig_0_24z = ~(celloutsig_0_12z[1] & celloutsig_0_19z);
  assign celloutsig_0_36z = ~celloutsig_0_27z[4];
  assign celloutsig_0_8z = ~celloutsig_0_3z;
  assign celloutsig_0_21z = ~celloutsig_0_17z;
  assign celloutsig_0_42z = ~((celloutsig_0_35z | celloutsig_0_18z) & celloutsig_0_28z[2]);
  assign celloutsig_0_46z = ~((celloutsig_0_26z[3] | celloutsig_0_3z) & (in_data[3] | celloutsig_0_26z[13]));
  assign celloutsig_0_54z = ~((celloutsig_0_5z[9] | celloutsig_0_39z) & (celloutsig_0_15z | celloutsig_0_4z));
  assign celloutsig_0_68z = ~((celloutsig_0_47z | celloutsig_0_62z) & (celloutsig_0_49z[0] | celloutsig_0_18z));
  assign celloutsig_0_29z = _00_ | celloutsig_0_24z;
  reg [8:0] _18_;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[0])
    if (clkin_data[0]) _18_ <= 9'h000;
    else _18_ <= { celloutsig_0_5z[7:4], celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_0z };
  assign { _02_[8], _01_, _02_[6:0] } = _18_;
  reg [3:0] _19_;
  always_ff @(posedge celloutsig_1_18z[0], posedge clkin_data[0])
    if (clkin_data[0]) _19_ <= 4'h0;
    else _19_ <= { celloutsig_0_7z[3:1], celloutsig_0_0z };
  assign { _03_[3:2], _00_, _03_[0] } = _19_;
  always_ff @(negedge celloutsig_1_18z[0], negedge clkin_data[0])
    if (!clkin_data[0]) _04_ <= 4'h0;
    else _04_ <= celloutsig_0_5z[4:1];
  assign celloutsig_0_38z = { celloutsig_0_19z, celloutsig_0_34z, celloutsig_0_14z, celloutsig_0_3z } & { celloutsig_0_6z[5:3], celloutsig_0_32z, celloutsig_0_19z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_36z, celloutsig_0_18z };
  assign celloutsig_0_96z = { celloutsig_0_56z[2], celloutsig_0_16z, celloutsig_0_53z } & { celloutsig_0_70z, celloutsig_0_74z, celloutsig_0_88z, celloutsig_0_53z, celloutsig_0_21z, celloutsig_0_42z, celloutsig_0_31z, celloutsig_0_34z };
  assign celloutsig_1_10z = { in_data[131:130], celloutsig_1_3z, celloutsig_1_7z } & { celloutsig_1_6z[3:1], celloutsig_1_1z };
  assign celloutsig_1_14z = { celloutsig_1_0z[11:8], celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_12z, celloutsig_1_2z, celloutsig_1_11z } & { in_data[158:152], celloutsig_1_12z, celloutsig_1_12z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_1z };
  assign celloutsig_0_12z = { celloutsig_0_6z[14:8], celloutsig_0_0z, celloutsig_0_1z } & { celloutsig_0_6z[5:1], celloutsig_0_2z, celloutsig_0_9z };
  assign celloutsig_0_20z = { celloutsig_0_5z[11:1], celloutsig_0_0z, _03_[3:2], _00_, _03_[0] } & { in_data[68:54], celloutsig_0_8z };
  assign celloutsig_0_28z = { celloutsig_0_7z[4:2], celloutsig_0_2z, celloutsig_0_21z, celloutsig_0_3z } & { celloutsig_0_26z[4:0], celloutsig_0_3z };
  assign celloutsig_0_48z = celloutsig_0_14z[12:1] / { 1'h1, celloutsig_0_20z[11:7], celloutsig_0_37z, celloutsig_0_7z };
  assign celloutsig_0_49z = { celloutsig_0_20z[12:5], celloutsig_0_43z } / { 1'h1, celloutsig_0_26z[15:8] };
  assign celloutsig_0_39z = { _03_[2], _00_, _03_[0] } == { _01_, _02_[6:5] };
  assign celloutsig_1_4z = in_data[149:145] == { in_data[116:113], celloutsig_1_1z };
  assign celloutsig_1_8z = { in_data[144], celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_7z } == in_data[127:119];
  assign celloutsig_0_40z = { celloutsig_0_29z, celloutsig_0_15z, celloutsig_0_37z } > celloutsig_0_9z;
  assign celloutsig_0_1z = in_data[80:71] > { in_data[64:56], celloutsig_0_0z };
  assign celloutsig_0_62z = { _02_[6:0], celloutsig_0_37z, celloutsig_0_17z } <= { _02_[4:2], celloutsig_0_16z };
  assign celloutsig_0_74z = { celloutsig_0_30z, celloutsig_0_34z, celloutsig_0_40z } <= { celloutsig_0_38z[11:2], celloutsig_0_39z, celloutsig_0_23z, celloutsig_0_37z, celloutsig_0_68z, celloutsig_0_54z, celloutsig_0_35z };
  assign celloutsig_1_2z = { in_data[177:168], celloutsig_1_1z, celloutsig_1_1z } <= { celloutsig_1_0z[14:4], celloutsig_1_1z };
  assign celloutsig_0_34z = ! { celloutsig_0_6z[9:4], _04_, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_22z };
  assign celloutsig_0_43z = ! { celloutsig_0_40z, celloutsig_0_4z, celloutsig_0_32z, celloutsig_0_15z };
  assign celloutsig_0_22z = ! { celloutsig_0_20z[9:1], celloutsig_0_2z, celloutsig_0_15z };
  assign celloutsig_1_9z = celloutsig_1_0z[14:11] < celloutsig_1_5z[4:1];
  assign celloutsig_1_11z = { in_data[183:182], celloutsig_1_1z, celloutsig_1_3z } < { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_7z };
  assign celloutsig_0_19z = _02_[5:3] < in_data[40:38];
  assign celloutsig_0_6z = { celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_4z } % { 1'h1, celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_9z = { celloutsig_0_7z[1:0], celloutsig_0_4z } % { 1'h1, in_data[53], in_data[0] };
  assign celloutsig_0_14z = { celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_9z, _02_[8], _01_, _02_[6:0], celloutsig_0_0z } % { 1'h1, celloutsig_0_5z[11:0], celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_30z = { celloutsig_0_5z, celloutsig_0_3z } % { 1'h1, celloutsig_0_20z[12:0] };
  assign celloutsig_0_5z = { in_data[69:64], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_0z } * { in_data[30], celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_2z };
  assign celloutsig_0_51z = celloutsig_0_26z[6] ? { in_data[28:19], celloutsig_0_49z } : { celloutsig_0_7z[4:3], celloutsig_0_26z[16:7], 1'h0, celloutsig_0_26z[5:0] };
  assign celloutsig_0_0z = in_data[4:0] != in_data[27:23];
  assign celloutsig_0_33z = { celloutsig_0_30z[10:3], celloutsig_0_22z, celloutsig_0_25z } != celloutsig_0_20z[13:4];
  assign celloutsig_0_47z = celloutsig_0_26z[14:1] != { celloutsig_0_5z[12:1], celloutsig_0_8z, celloutsig_0_43z };
  assign celloutsig_1_7z = { celloutsig_1_6z[2:0], celloutsig_1_1z, celloutsig_1_3z } != celloutsig_1_5z[5:1];
  assign celloutsig_0_37z = in_data[85:81] !== { celloutsig_0_20z[5:3], celloutsig_0_32z, celloutsig_0_8z };
  assign celloutsig_0_50z = celloutsig_0_16z[3:1] !== celloutsig_0_9z;
  assign celloutsig_0_2z = { in_data[92:91], celloutsig_0_1z } !== in_data[28:26];
  assign celloutsig_0_16z = { celloutsig_0_1z, celloutsig_0_3z, _04_ } | celloutsig_0_6z[6:1];
  assign celloutsig_0_44z = & { celloutsig_0_37z, celloutsig_0_36z, celloutsig_0_33z, celloutsig_0_28z, celloutsig_0_26z, celloutsig_0_20z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_5z[9:4], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_1_12z = & { celloutsig_1_11z, celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_5z[4:1], celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_15z = & { celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_5z[9:4], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_3z = celloutsig_0_0z & celloutsig_0_2z;
  assign celloutsig_0_88z = celloutsig_0_51z[18] & celloutsig_0_0z;
  assign celloutsig_1_3z = in_data[102] & celloutsig_1_1z;
  assign celloutsig_0_25z = celloutsig_0_23z & celloutsig_0_15z;
  assign celloutsig_0_53z = | { celloutsig_0_33z, celloutsig_0_31z, celloutsig_0_28z[0], celloutsig_0_19z };
  assign celloutsig_1_1z = | in_data[99:97];
  assign celloutsig_0_32z = | celloutsig_0_20z[15:12];
  assign celloutsig_0_4z = ^ { in_data[45:38], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_70z = ^ { celloutsig_0_48z[11:4], celloutsig_0_28z };
  assign celloutsig_1_13z = ^ { celloutsig_1_0z[19:17], celloutsig_1_2z, celloutsig_1_11z };
  assign celloutsig_0_17z = ^ { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_0_31z = ^ celloutsig_0_20z[11:3];
  assign celloutsig_1_0z = in_data[141:119] << in_data[142:120];
  assign celloutsig_0_26z = { celloutsig_0_4z, celloutsig_0_19z, celloutsig_0_12z, celloutsig_0_16z } << { celloutsig_0_6z[12:3], celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_15z };
  assign celloutsig_0_7z = celloutsig_0_5z[11:7] - { in_data[53:51], celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_1_5z = { celloutsig_1_0z[14:13], celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_2z } - celloutsig_1_0z[16:11];
  assign celloutsig_1_6z = celloutsig_1_0z[14:9] - { in_data[158:155], celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_1_18z = celloutsig_1_14z[6:0] - in_data[113:107];
  assign celloutsig_0_56z = { celloutsig_0_5z[7:5], celloutsig_0_19z, celloutsig_0_31z } ~^ { celloutsig_0_50z, celloutsig_0_24z, celloutsig_0_44z, celloutsig_0_31z, celloutsig_0_46z };
  assign celloutsig_1_15z = celloutsig_1_6z[4:1] ~^ { celloutsig_1_0z[11:10], celloutsig_1_11z, celloutsig_1_13z };
  assign celloutsig_0_27z = { celloutsig_0_14z[11:7], celloutsig_0_4z, celloutsig_0_25z } ~^ { in_data[81:76], celloutsig_0_15z };
  assign { out_data[99:96], out_data[101], out_data[109:102] } = { celloutsig_1_15z, celloutsig_1_13z, celloutsig_1_0z[9:2] } ~^ { celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_13z, in_data[117], in_data[125:118] };
  assign _02_[7] = _01_;
  assign _03_[1] = _00_;
  assign { out_data[134:128], out_data[100], out_data[39:32], out_data[0] } = { celloutsig_1_18z, 1'h1, celloutsig_0_96z, celloutsig_0_97z };
endmodule
