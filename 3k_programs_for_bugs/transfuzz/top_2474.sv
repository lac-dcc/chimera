/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire [4:0] _05_;
  wire [8:0] _06_;
  reg [4:0] _07_;
  wire [34:0] _08_;
  wire [6:0] celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [3:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [7:0] celloutsig_0_28z;
  wire [19:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [7:0] celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire [11:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [3:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [25:0] celloutsig_0_41z;
  wire celloutsig_0_44z;
  wire [3:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire [2:0] celloutsig_0_4z;
  wire [3:0] celloutsig_0_51z;
  wire [8:0] celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire [4:0] celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire celloutsig_0_65z;
  wire celloutsig_0_68z;
  wire celloutsig_0_6z;
  wire celloutsig_0_73z;
  wire [14:0] celloutsig_0_76z;
  wire celloutsig_0_77z;
  wire [6:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_12z;
  wire [3:0] celloutsig_1_15z;
  wire [4:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [23:0] celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire [24:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_65z = ~(celloutsig_0_14z & celloutsig_0_51z[1]);
  assign celloutsig_1_0z = ~(in_data[176] & in_data[166]);
  assign celloutsig_0_30z = ~(celloutsig_0_17z[2] & celloutsig_0_14z);
  assign celloutsig_0_33z = !(celloutsig_0_29z[0] ? celloutsig_0_6z : celloutsig_0_4z[2]);
  assign celloutsig_1_2z = !(in_data[96] ? in_data[125] : celloutsig_1_1z);
  assign celloutsig_0_21z = !(in_data[20] ? celloutsig_0_12z : celloutsig_0_7z[1]);
  assign celloutsig_0_26z = !(celloutsig_0_1z ? celloutsig_0_2z : celloutsig_0_25z);
  assign celloutsig_0_27z = !(celloutsig_0_21z ? celloutsig_0_21z : celloutsig_0_20z);
  assign celloutsig_0_73z = ~(celloutsig_0_60z | celloutsig_0_4z[2]);
  assign celloutsig_1_8z = ~(celloutsig_1_6z[1] | celloutsig_1_3z);
  assign celloutsig_0_40z = ~((celloutsig_0_23z | celloutsig_0_14z) & celloutsig_0_3z);
  assign celloutsig_0_23z = ~((celloutsig_0_19z | in_data[52]) & celloutsig_0_9z);
  assign celloutsig_0_24z = ~((celloutsig_0_6z | celloutsig_0_10z[2]) & celloutsig_0_5z);
  assign celloutsig_0_6z = ~((celloutsig_0_0z[6] | celloutsig_0_0z[0]) & (celloutsig_0_0z[3] | in_data[78]));
  assign celloutsig_0_18z = ~((celloutsig_0_17z[2] | celloutsig_0_1z) & (celloutsig_0_12z | celloutsig_0_4z[2]));
  assign celloutsig_0_37z = celloutsig_0_2z | ~(celloutsig_0_11z);
  assign celloutsig_0_68z = celloutsig_0_51z[2] | ~(celloutsig_0_65z);
  assign celloutsig_1_3z = celloutsig_1_1z | ~(celloutsig_1_2z);
  assign celloutsig_0_1z = celloutsig_0_0z[2] | ~(in_data[49]);
  assign celloutsig_0_35z = celloutsig_0_18z ^ _00_;
  assign celloutsig_0_54z = celloutsig_0_30z ^ celloutsig_0_10z[1];
  assign celloutsig_0_58z = celloutsig_0_26z ^ celloutsig_0_16z;
  assign celloutsig_1_9z = celloutsig_1_7z[1] ^ celloutsig_1_7z[10];
  assign celloutsig_0_12z = celloutsig_0_0z[6] ^ celloutsig_0_8z;
  assign celloutsig_0_2z = celloutsig_0_0z[1] ^ celloutsig_0_1z;
  reg [4:0] _34_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[64])
    if (clkin_data[64]) _34_ <= 5'h00;
    else _34_ <= { celloutsig_0_4z[0], celloutsig_0_4z, celloutsig_0_8z };
  assign { _05_[4:3], _01_, _00_, _05_[0] } = _34_;
  reg [8:0] _35_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[64])
    if (!clkin_data[64]) _35_ <= 9'h000;
    else _35_ <= { celloutsig_0_28z, celloutsig_0_20z };
  assign { _06_[8], _03_, _06_[6:0] } = _35_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _07_ <= 5'h00;
    else _07_ <= { celloutsig_0_3z, celloutsig_0_37z, celloutsig_0_3z, celloutsig_0_30z, celloutsig_0_25z };
  reg [34:0] _37_;
  always_ff @(negedge clkin_data[32], negedge clkin_data[96])
    if (!clkin_data[96]) _37_ <= 35'h000000000;
    else _37_ <= { in_data[191:158], celloutsig_1_0z };
  assign { _08_[34], _04_, _08_[32], _02_, _08_[30:0] } = _37_;
  assign celloutsig_0_36z = { celloutsig_0_13z[2:1], celloutsig_0_11z, celloutsig_0_25z } & celloutsig_0_29z[15:12];
  assign celloutsig_0_7z = { in_data[16:11], celloutsig_0_3z } & celloutsig_0_0z;
  assign celloutsig_1_5z = { in_data[180:158], celloutsig_1_3z } & { _08_[30:9], celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_7z = { in_data[153:130], celloutsig_1_2z } & { in_data[148:125], celloutsig_1_2z };
  assign celloutsig_1_18z = { celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_12z, celloutsig_1_0z, celloutsig_1_12z } & { celloutsig_1_3z, celloutsig_1_15z };
  assign celloutsig_0_10z = celloutsig_0_4z & { celloutsig_0_7z[2], celloutsig_0_8z, celloutsig_0_8z };
  assign celloutsig_0_13z = { in_data[23:22], celloutsig_0_8z } & { celloutsig_0_10z[2:1], celloutsig_0_9z };
  assign celloutsig_0_57z = celloutsig_0_10z == celloutsig_0_41z[19:17];
  assign celloutsig_0_9z = { in_data[53:50], celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_4z } == { celloutsig_0_7z[6:1], celloutsig_0_4z, celloutsig_0_2z };
  assign celloutsig_0_4z = in_data[12:10] % { 1'h1, in_data[92], celloutsig_0_2z };
  assign celloutsig_0_48z = { celloutsig_0_4z, celloutsig_0_8z } % { 1'h1, celloutsig_0_13z };
  assign celloutsig_1_6z = celloutsig_1_5z[6:2] % { 1'h1, celloutsig_1_5z[14:13], celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_17z = { celloutsig_0_13z, celloutsig_0_11z } % { 1'h1, celloutsig_0_4z[1:0], celloutsig_0_8z };
  assign celloutsig_0_29z = { celloutsig_0_7z[6:5], celloutsig_0_20z, celloutsig_0_0z, celloutsig_0_21z, celloutsig_0_10z, celloutsig_0_17z, celloutsig_0_18z, celloutsig_0_20z } % { 1'h1, in_data[45:27] };
  assign celloutsig_0_44z = { celloutsig_0_24z, celloutsig_0_39z, celloutsig_0_10z } != { celloutsig_0_10z, celloutsig_0_35z, celloutsig_0_30z };
  assign celloutsig_0_77z = { celloutsig_0_28z[4:1], celloutsig_0_58z, celloutsig_0_57z, celloutsig_0_48z } != { celloutsig_0_48z[3:1], celloutsig_0_48z, celloutsig_0_35z, celloutsig_0_33z, celloutsig_0_3z };
  assign celloutsig_0_16z = { celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_11z } != { celloutsig_0_0z[2], celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_0_19z = { celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_17z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_13z } != { in_data[39:27], celloutsig_0_17z, celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_9z };
  assign celloutsig_0_25z = { in_data[72:69], celloutsig_0_17z, celloutsig_0_23z } != { celloutsig_0_17z[3:1], celloutsig_0_3z, celloutsig_0_20z, celloutsig_0_16z, celloutsig_0_19z, celloutsig_0_8z, celloutsig_0_9z };
  assign celloutsig_0_0z = - in_data[39:33];
  assign celloutsig_0_76z = - { _06_[4:2], celloutsig_0_55z, celloutsig_0_54z, celloutsig_0_68z, celloutsig_0_27z, celloutsig_0_38z, celloutsig_0_8z, celloutsig_0_15z, celloutsig_0_73z };
  assign celloutsig_0_49z = { _03_, _06_[6:3], celloutsig_0_13z, celloutsig_0_18z } !== { _07_, celloutsig_0_25z, celloutsig_0_44z, celloutsig_0_40z, celloutsig_0_40z };
  assign celloutsig_0_60z = { celloutsig_0_34z[3:2], celloutsig_0_56z, celloutsig_0_56z } !== { celloutsig_0_53z[7:5], celloutsig_0_14z };
  assign celloutsig_0_11z = { in_data[59:52], celloutsig_0_5z } !== { celloutsig_0_7z[6:1], celloutsig_0_4z };
  assign celloutsig_0_51z = { celloutsig_0_29z[7:6], celloutsig_0_38z, celloutsig_0_2z } | { celloutsig_0_29z[14:13], celloutsig_0_39z, celloutsig_0_26z };
  assign celloutsig_1_15z = { celloutsig_1_7z[20:19], celloutsig_1_2z, celloutsig_1_0z } | celloutsig_1_5z[14:11];
  assign celloutsig_0_38z = & { celloutsig_0_27z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_4z };
  assign celloutsig_1_12z = & { celloutsig_1_2z, in_data[116:104] };
  assign celloutsig_0_15z = & { celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_3z, in_data[40:36] };
  assign celloutsig_0_5z = celloutsig_0_1z & celloutsig_0_4z[0];
  assign celloutsig_0_56z = celloutsig_0_20z & celloutsig_0_7z[2];
  assign celloutsig_0_8z = celloutsig_0_4z[1] & celloutsig_0_5z;
  assign celloutsig_0_3z = celloutsig_0_1z & celloutsig_0_0z[0];
  assign celloutsig_1_19z = | { celloutsig_1_15z, celloutsig_1_8z, celloutsig_1_6z };
  assign celloutsig_0_14z = | { celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_8z, in_data[1] };
  assign celloutsig_0_20z = | { celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_4z, in_data[1] };
  assign celloutsig_1_1z = ~^ in_data[168:165];
  assign celloutsig_0_39z = ^ { celloutsig_0_10z[1:0], celloutsig_0_36z };
  assign celloutsig_0_34z = { celloutsig_0_14z, celloutsig_0_17z, celloutsig_0_13z, celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_11z } << { celloutsig_0_10z[0], celloutsig_0_24z, celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_14z };
  assign celloutsig_0_55z = { celloutsig_0_39z, celloutsig_0_33z, celloutsig_0_16z, celloutsig_0_38z, celloutsig_0_49z } << { celloutsig_0_10z[1], celloutsig_0_24z, celloutsig_0_27z, celloutsig_0_18z, celloutsig_0_27z };
  assign celloutsig_0_41z = { celloutsig_0_29z[10:5], celloutsig_0_28z, celloutsig_0_24z, celloutsig_0_20z, celloutsig_0_13z, celloutsig_0_0z } >> { celloutsig_0_9z, celloutsig_0_38z, celloutsig_0_6z, celloutsig_0_17z, _05_[4:3], _01_, _00_, _05_[0], celloutsig_0_21z, celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_20z, celloutsig_0_33z, celloutsig_0_35z, celloutsig_0_12z, celloutsig_0_2z, celloutsig_0_24z, celloutsig_0_39z, celloutsig_0_26z, celloutsig_0_27z };
  assign celloutsig_0_28z = { celloutsig_0_0z[3:0], celloutsig_0_4z, celloutsig_0_21z } >> { celloutsig_0_15z, celloutsig_0_7z };
  assign celloutsig_0_31z = { celloutsig_0_0z, celloutsig_0_11z } >> celloutsig_0_28z;
  assign celloutsig_0_53z = { celloutsig_0_28z[6:2], celloutsig_0_25z, celloutsig_0_20z, celloutsig_0_15z, celloutsig_0_25z } ~^ { celloutsig_0_31z[6:0], celloutsig_0_3z, celloutsig_0_49z };
  assign _05_[2:1] = { _01_, _00_ };
  assign _06_[7] = _03_;
  assign { _08_[33], _08_[31] } = { _04_, _02_ };
  assign { out_data[132:128], out_data[96], out_data[46:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_76z, celloutsig_0_77z };
endmodule
