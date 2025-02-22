/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [4:0] _02_;
  wire [4:0] _03_;
  wire [5:0] _04_;
  wire [7:0] _05_;
  reg [7:0] _06_;
  wire celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire [12:0] celloutsig_0_12z;
  wire [5:0] celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire [16:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [2:0] celloutsig_0_18z;
  wire [2:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [2:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire [8:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [11:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [6:0] celloutsig_0_34z;
  wire [40:0] celloutsig_0_35z;
  wire [2:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [2:0] celloutsig_0_3z;
  wire [2:0] celloutsig_0_41z;
  wire [3:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire [4:0] celloutsig_0_56z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire celloutsig_0_66z;
  wire celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire [8:0] celloutsig_0_71z;
  wire [6:0] celloutsig_0_72z;
  wire celloutsig_0_73z;
  wire celloutsig_0_74z;
  wire [5:0] celloutsig_0_75z;
  wire [2:0] celloutsig_0_7z;
  wire celloutsig_0_87z;
  wire celloutsig_0_8z;
  wire celloutsig_0_94z;
  wire [3:0] celloutsig_0_96z;
  wire celloutsig_0_97z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [3:0] celloutsig_1_19z;
  wire [6:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire [5:0] celloutsig_1_7z;
  wire [11:0] celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_38z = celloutsig_0_12z[3] ? celloutsig_0_11z : celloutsig_0_16z[9];
  assign celloutsig_0_32z = celloutsig_0_23z ? celloutsig_0_23z : celloutsig_0_18z[1];
  assign celloutsig_0_51z = ~(celloutsig_0_31z[10] & celloutsig_0_9z);
  assign celloutsig_0_0z = ~(in_data[30] | in_data[48]);
  assign celloutsig_0_47z = ~(celloutsig_0_4z | celloutsig_0_17z);
  assign celloutsig_0_55z = ~(celloutsig_0_31z[11] | celloutsig_0_42z[0]);
  assign celloutsig_1_15z = ~(celloutsig_1_7z[0] | celloutsig_1_3z);
  assign celloutsig_0_15z = ~(celloutsig_0_4z | celloutsig_0_0z);
  assign celloutsig_0_4z = ~celloutsig_0_2z;
  assign celloutsig_0_73z = ~celloutsig_0_17z;
  assign celloutsig_0_11z = ~celloutsig_0_7z[2];
  assign celloutsig_1_13z = ~celloutsig_1_5z;
  assign celloutsig_1_2z = ~((celloutsig_1_0z | celloutsig_1_0z) & celloutsig_1_1z[6]);
  assign celloutsig_0_30z = ~((celloutsig_0_17z | celloutsig_0_9z) & celloutsig_0_5z);
  assign celloutsig_1_0z = ~((in_data[104] | in_data[117]) & (in_data[150] | in_data[121]));
  assign celloutsig_0_39z = celloutsig_0_21z | ~(celloutsig_0_19z[2]);
  assign celloutsig_0_43z = celloutsig_0_32z | ~(celloutsig_0_39z);
  assign celloutsig_0_59z = celloutsig_0_25z | ~(celloutsig_0_9z);
  assign celloutsig_0_65z = celloutsig_0_12z[5] | ~(celloutsig_0_37z[1]);
  assign celloutsig_0_66z = celloutsig_0_29z[3] | ~(celloutsig_0_52z);
  assign celloutsig_1_4z = in_data[103] | ~(celloutsig_1_1z[3]);
  assign celloutsig_1_11z = in_data[151] | ~(celloutsig_1_1z[1]);
  assign celloutsig_0_61z = celloutsig_0_35z[5] | celloutsig_0_49z;
  assign celloutsig_0_9z = ~(celloutsig_0_4z ^ celloutsig_0_7z[0]);
  assign celloutsig_0_2z = ~(in_data[41] ^ celloutsig_0_1z);
  assign celloutsig_0_3z = { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z } + { in_data[66:65], celloutsig_0_2z };
  assign celloutsig_1_9z = { in_data[180:174], celloutsig_1_6z } + { in_data[102:98], celloutsig_1_7z, celloutsig_1_5z };
  reg [4:0] _34_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _34_ <= 5'h00;
    else _34_ <= { celloutsig_0_31z[4:3], celloutsig_0_24z };
  assign { _02_[4:2], _00_, _02_[0] } = _34_;
  reg [5:0] _35_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _35_ <= 6'h00;
    else _35_ <= { celloutsig_0_3z[2], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_8z };
  assign { _04_[5:4], _03_[4:2], _04_[0] } = _35_;
  reg [7:0] _36_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _36_ <= 8'h00;
    else _36_ <= { celloutsig_0_3z[0], _04_[5:4], _03_[4:2], _04_[0], celloutsig_0_11z };
  assign { _05_[7:5], _01_, _05_[3:0] } = _36_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _06_ <= 8'h00;
    else _06_ <= { _04_[5:4], _03_[4:2], _04_[0], celloutsig_0_2z, celloutsig_0_9z };
  assign celloutsig_1_19z = { celloutsig_1_13z, celloutsig_1_12z, celloutsig_1_4z, celloutsig_1_17z } / { 1'h1, celloutsig_1_18z, celloutsig_1_18z, celloutsig_1_18z };
  assign celloutsig_0_24z = celloutsig_0_7z / { 1'h1, celloutsig_0_12z[6], celloutsig_0_5z };
  assign celloutsig_0_49z = { celloutsig_0_16z[6:0], celloutsig_0_4z } >= { _02_[4:2], _00_, _02_[0], celloutsig_0_18z };
  assign celloutsig_0_50z = { celloutsig_0_24z[2], celloutsig_0_2z, celloutsig_0_32z } >= in_data[35:33];
  assign celloutsig_0_69z = { _05_[7:5], _01_, _05_[3:0], celloutsig_0_24z, celloutsig_0_20z } >= { _05_[3:2], celloutsig_0_30z, celloutsig_0_5z, celloutsig_0_48z, celloutsig_0_55z, celloutsig_0_30z, celloutsig_0_43z, celloutsig_0_7z, celloutsig_0_66z };
  assign celloutsig_0_8z = { in_data[49:39], celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_5z } >= { in_data[51:29], celloutsig_0_6z };
  assign celloutsig_0_74z = { celloutsig_0_31z[6:3], celloutsig_0_25z, _04_[5:4], _03_[4:2], _04_[0], celloutsig_0_59z, celloutsig_0_20z, celloutsig_0_39z, celloutsig_0_51z, celloutsig_0_50z, celloutsig_0_22z, celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_44z, celloutsig_0_26z } >= { celloutsig_0_65z, celloutsig_0_18z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_71z, celloutsig_0_72z, celloutsig_0_26z, celloutsig_0_20z, celloutsig_0_32z, celloutsig_0_20z };
  assign celloutsig_0_97z = { celloutsig_0_56z, celloutsig_0_52z, celloutsig_0_47z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_38z, celloutsig_0_50z, celloutsig_0_65z } >= { celloutsig_0_34z[6:5], celloutsig_0_73z, celloutsig_0_94z, celloutsig_0_75z, celloutsig_0_0z, celloutsig_0_87z };
  assign celloutsig_0_1z = in_data[80:71] >= { in_data[56:49], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_17z = { celloutsig_0_7z[1], celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_5z } >= { _05_[5], _01_, _05_[3:1], celloutsig_0_0z };
  assign celloutsig_0_25z = { celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_21z } >= { celloutsig_0_16z[12:1], celloutsig_0_19z, celloutsig_0_4z };
  assign celloutsig_0_26z = { _05_[2], celloutsig_0_24z } >= { celloutsig_0_13z[1:0], celloutsig_0_23z, celloutsig_0_11z };
  assign celloutsig_0_5z = ! { celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_54z = ! { celloutsig_0_49z, celloutsig_0_15z, celloutsig_0_51z };
  assign celloutsig_0_64z = ! { celloutsig_0_59z, celloutsig_0_31z };
  assign celloutsig_0_87z = ! { celloutsig_0_34z, celloutsig_0_69z, celloutsig_0_19z, celloutsig_0_41z, celloutsig_0_39z };
  assign celloutsig_1_3z = ! { celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_17z = ! { celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_0_20z = ! celloutsig_0_12z;
  assign celloutsig_0_21z = ! { in_data[55:48], celloutsig_0_5z, celloutsig_0_8z };
  assign celloutsig_0_23z = ! { in_data[28:1], celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_22z, celloutsig_0_18z };
  assign celloutsig_1_18z = { celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_11z, celloutsig_1_7z } < { celloutsig_1_2z, celloutsig_1_11z, celloutsig_1_7z, celloutsig_1_14z, celloutsig_1_1z, celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_13z, celloutsig_1_5z, celloutsig_1_15z };
  assign celloutsig_0_34z = { celloutsig_0_7z[1], celloutsig_0_13z } * { celloutsig_0_12z[8:6], celloutsig_0_18z, celloutsig_0_4z };
  assign celloutsig_1_1z = { in_data[158:155], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } * in_data[156:150];
  assign celloutsig_1_6z = - { celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_2z };
  assign celloutsig_0_29z = ~ { _05_[6:5], _01_, _05_[3:0], celloutsig_0_15z, celloutsig_0_28z };
  assign celloutsig_0_37z = _06_[6:4] | { celloutsig_0_24z[2], celloutsig_0_0z, celloutsig_0_30z };
  assign celloutsig_0_42z = { celloutsig_0_38z, celloutsig_0_41z } | { celloutsig_0_34z[4:2], celloutsig_0_17z };
  assign celloutsig_0_96z = { celloutsig_0_18z, celloutsig_0_50z } | { _06_[6:4], celloutsig_0_9z };
  assign celloutsig_1_7z = { celloutsig_1_6z[4:2], celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_3z } | in_data[103:98];
  assign celloutsig_0_19z = { celloutsig_0_3z[2:1], celloutsig_0_17z } | celloutsig_0_12z[6:4];
  assign celloutsig_0_45z = & { celloutsig_0_31z[8:2], celloutsig_0_28z, celloutsig_0_18z, celloutsig_0_8z, celloutsig_0_3z };
  assign celloutsig_0_46z = & _06_[6:2];
  assign celloutsig_0_6z = & { celloutsig_0_3z[1], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_1_12z = & { celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_5z };
  assign celloutsig_1_14z = & celloutsig_1_7z;
  assign celloutsig_0_22z = & { celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_5z };
  assign celloutsig_0_94z = celloutsig_0_4z & celloutsig_0_21z;
  assign celloutsig_0_48z = ~^ { _02_[0], celloutsig_0_11z, celloutsig_0_38z };
  assign celloutsig_0_52z = ~^ { celloutsig_0_12z[8:7], celloutsig_0_29z, celloutsig_0_32z };
  assign celloutsig_1_5z = ~^ in_data[148:141];
  assign celloutsig_1_10z = ~^ { celloutsig_1_9z[5:4], celloutsig_1_0z };
  assign celloutsig_0_7z = { celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z } >> { in_data[51:50], celloutsig_0_0z };
  assign celloutsig_0_71z = { celloutsig_0_13z[5:3], celloutsig_0_37z, celloutsig_0_49z, celloutsig_0_6z, celloutsig_0_48z } >> { celloutsig_0_56z, celloutsig_0_64z, celloutsig_0_52z, celloutsig_0_49z, celloutsig_0_32z };
  assign celloutsig_0_75z = { celloutsig_0_29z[0], celloutsig_0_2z, celloutsig_0_54z, celloutsig_0_70z, celloutsig_0_65z, celloutsig_0_74z } >> { celloutsig_0_1z, celloutsig_0_61z, celloutsig_0_45z, celloutsig_0_25z, celloutsig_0_22z, celloutsig_0_39z };
  assign celloutsig_0_12z = { in_data[39:37], celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_1z } >> { in_data[52:45], celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_18z = { celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_4z } >> { celloutsig_0_8z, celloutsig_0_15z, celloutsig_0_1z };
  assign celloutsig_0_31z = { _06_[7:2], celloutsig_0_13z } >> { celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_24z, celloutsig_0_22z };
  assign celloutsig_0_72z = { _06_[6:3], celloutsig_0_7z } >>> { celloutsig_0_66z, celloutsig_0_44z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_54z };
  assign celloutsig_0_13z = { _04_[5:4], _03_[4:2], celloutsig_0_1z } >>> { _04_[5:4], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_35z = { in_data[64:43], celloutsig_0_12z, celloutsig_0_13z } - { in_data[39:25], celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_31z, celloutsig_0_23z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_41z = { celloutsig_0_12z[6:5], celloutsig_0_39z } - { _04_[4], _03_[4:3] };
  assign celloutsig_0_56z = { celloutsig_0_41z[2], celloutsig_0_9z, celloutsig_0_45z, celloutsig_0_25z, celloutsig_0_15z } - { in_data[5:4], celloutsig_0_26z, celloutsig_0_11z, celloutsig_0_45z };
  assign celloutsig_0_16z = { in_data[31:26], celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_7z } - { celloutsig_0_12z[12:4], celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_6z };
  assign celloutsig_0_44z = ~((celloutsig_0_25z & celloutsig_0_5z) | _02_[4]);
  assign celloutsig_0_70z = ~((celloutsig_0_46z & celloutsig_0_1z) | celloutsig_0_30z);
  assign celloutsig_0_28z = ~((celloutsig_0_7z[2] & celloutsig_0_16z[13]) | celloutsig_0_18z[2]);
  assign _02_[1] = _00_;
  assign _03_[1:0] = { celloutsig_0_74z, celloutsig_0_6z };
  assign _04_[3:1] = _03_[4:2];
  assign _05_[4] = _01_;
  assign { out_data[128], out_data[99:96], out_data[35:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_96z, celloutsig_0_97z };
endmodule
