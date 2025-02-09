/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [11:0] _01_;
  reg [5:0] _02_;
  reg [11:0] _03_;
  wire [11:0] _04_;
  wire [9:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [3:0] celloutsig_0_11z;
  wire [13:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [11:0] celloutsig_0_14z;
  wire [8:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [12:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [24:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [8:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [8:0] celloutsig_0_26z;
  wire [4:0] celloutsig_0_27z;
  wire [7:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [21:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [3:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [4:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_48z;
  wire [9:0] celloutsig_0_49z;
  wire [2:0] celloutsig_0_52z;
  wire celloutsig_0_55z;
  wire celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire [8:0] celloutsig_0_64z;
  wire celloutsig_0_66z;
  wire [4:0] celloutsig_0_67z;
  wire [8:0] celloutsig_0_69z;
  wire [11:0] celloutsig_0_6z;
  wire celloutsig_0_75z;
  wire celloutsig_0_76z;
  wire celloutsig_0_7z;
  wire celloutsig_0_80z;
  wire celloutsig_0_86z;
  wire [5:0] celloutsig_0_8z;
  wire [10:0] celloutsig_0_90z;
  wire celloutsig_0_91z;
  wire [2:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [7:0] celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire [27:0] celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire [7:0] celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_35z = ~((celloutsig_0_20z | celloutsig_0_16z) & celloutsig_0_20z);
  assign celloutsig_0_41z = ~((celloutsig_0_21z | _00_) & celloutsig_0_22z[23]);
  assign celloutsig_0_44z = ~((celloutsig_0_32z | celloutsig_0_8z[4]) & celloutsig_0_30z);
  assign celloutsig_0_45z = ~((celloutsig_0_18z | celloutsig_0_25z) & celloutsig_0_7z);
  assign celloutsig_1_18z = ~((celloutsig_1_0z | celloutsig_1_9z) & celloutsig_1_2z[5]);
  assign celloutsig_0_6z = { in_data[72:71], celloutsig_0_0z } + _01_;
  assign celloutsig_0_90z = { celloutsig_0_19z, celloutsig_0_49z } + { celloutsig_0_6z[10:2], celloutsig_0_80z, celloutsig_0_23z };
  assign celloutsig_1_3z = { in_data[139:119], celloutsig_1_2z } + { in_data[142:129], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_14z = celloutsig_0_6z + celloutsig_0_6z;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_19z[0])
    if (celloutsig_1_19z[0]) _02_ <= 6'h00;
    else _02_ <= celloutsig_0_28z[7:2];
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _01_ <= 12'h000;
    else _01_ <= in_data[72:61];
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _03_ <= 12'h000;
    else _03_ <= { celloutsig_0_24z[6:0], celloutsig_0_67z };
  reg [11:0] _17_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _17_ <= 12'h000;
    else _17_ <= in_data[84:73];
  assign { _00_, _04_[10:0] } = _17_;
  assign celloutsig_0_76z = { celloutsig_0_12z[7:3], celloutsig_0_3z, celloutsig_0_19z } == { celloutsig_0_69z[7:4], celloutsig_0_20z, celloutsig_0_33z, celloutsig_0_25z };
  assign celloutsig_0_18z = celloutsig_0_2z[20:16] == celloutsig_0_8z[5:1];
  assign celloutsig_0_21z = celloutsig_0_0z === { celloutsig_0_19z, celloutsig_0_15z };
  assign celloutsig_0_23z = { celloutsig_0_0z[6:4], celloutsig_0_19z } === celloutsig_0_14z[10:7];
  assign celloutsig_0_37z = { celloutsig_0_30z, celloutsig_0_30z, celloutsig_0_25z, celloutsig_0_25z, celloutsig_0_11z } > celloutsig_0_17z[10:3];
  assign celloutsig_0_48z = { celloutsig_0_14z[10:5], celloutsig_0_6z, celloutsig_0_24z, celloutsig_0_7z } > { in_data[34:19], _01_ };
  assign celloutsig_0_91z = { celloutsig_0_24z[4], celloutsig_0_66z, celloutsig_0_30z, celloutsig_0_26z, celloutsig_0_8z, celloutsig_0_25z, celloutsig_0_35z, celloutsig_0_75z } > { celloutsig_0_24z[3:1], celloutsig_0_52z, celloutsig_0_23z, celloutsig_0_52z, celloutsig_0_86z, celloutsig_0_26z, celloutsig_0_42z };
  assign celloutsig_1_0z = in_data[132:119] > in_data[115:102];
  assign celloutsig_1_14z = celloutsig_1_5z[6:1] > { celloutsig_1_9z, celloutsig_1_4z };
  assign celloutsig_0_10z = celloutsig_0_0z[6:0] > _04_[8:2];
  assign celloutsig_0_32z = { celloutsig_0_2z[7:0], celloutsig_0_18z } > celloutsig_0_2z[11:3];
  assign celloutsig_0_34z = celloutsig_0_17z[5:0] && celloutsig_0_28z[7:2];
  assign celloutsig_0_80z = { in_data[89:82], celloutsig_0_11z, celloutsig_0_30z, celloutsig_0_17z, celloutsig_0_44z } && { _01_[8:3], celloutsig_0_76z, celloutsig_0_31z, celloutsig_0_39z, celloutsig_0_42z, _03_, celloutsig_0_18z, celloutsig_0_21z };
  assign celloutsig_1_9z = in_data[157:146] && celloutsig_1_3z[23:12];
  assign celloutsig_1_10z = celloutsig_1_4z[3:1] && celloutsig_1_2z[5:3];
  assign celloutsig_0_25z = _01_[10:0] && celloutsig_0_6z[11:1];
  assign celloutsig_0_55z = ! celloutsig_0_6z[9:7];
  assign celloutsig_0_58z = ! { _01_[6:3], celloutsig_0_16z, celloutsig_0_27z };
  assign celloutsig_0_75z = ! _04_[9:4];
  assign celloutsig_0_7z = ! celloutsig_0_6z[4:0];
  assign celloutsig_1_8z = ! celloutsig_1_2z[5:0];
  assign celloutsig_1_16z = ! { in_data[184:182], celloutsig_1_9z };
  assign celloutsig_0_13z = ! { celloutsig_0_0z[9:7], celloutsig_0_10z, celloutsig_0_3z };
  assign celloutsig_0_16z = ! { celloutsig_0_15z[6:5], celloutsig_0_8z };
  assign celloutsig_0_33z = ! celloutsig_0_17z[10:0];
  assign celloutsig_0_3z = in_data[39] & ~(celloutsig_0_0z[1]);
  assign celloutsig_0_42z = celloutsig_0_23z & ~(celloutsig_0_0z[7]);
  assign celloutsig_0_5z = celloutsig_0_0z[8] & ~(in_data[65]);
  assign celloutsig_0_86z = celloutsig_0_24z[0] & ~(celloutsig_0_11z[0]);
  assign celloutsig_0_20z = celloutsig_0_17z[8] & ~(celloutsig_0_17z[2]);
  assign celloutsig_0_29z = celloutsig_0_3z & ~(celloutsig_0_15z[0]);
  assign celloutsig_0_0z = in_data[34:25] % { 1'h1, in_data[43:35] };
  assign celloutsig_0_49z = { celloutsig_0_48z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_23z, celloutsig_0_19z } % { 1'h1, celloutsig_0_26z[6:3], celloutsig_0_43z };
  assign celloutsig_0_69z = { celloutsig_0_22z[15:9], celloutsig_0_34z, celloutsig_0_37z } % { 1'h1, celloutsig_0_43z[2:1], _02_ };
  assign celloutsig_0_8z = in_data[84:79] % { 1'h1, celloutsig_0_2z[6:5], celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_5z };
  assign celloutsig_1_1z = in_data[169:167] % { 1'h1, in_data[181:180] };
  assign celloutsig_1_11z = { celloutsig_1_3z[23:22], celloutsig_1_8z } % { 1'h1, celloutsig_1_0z, in_data[96] };
  assign celloutsig_0_11z = { _01_[6:4], celloutsig_0_7z } % { 1'h1, celloutsig_0_2z[15], celloutsig_0_7z, celloutsig_0_5z };
  assign celloutsig_0_15z = { celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_7z } % { 1'h1, celloutsig_0_12z[9:2] };
  assign celloutsig_0_17z = { celloutsig_0_11z[2], _00_, _04_[10:0] } % { 1'h1, celloutsig_0_14z[10:0], celloutsig_0_5z };
  assign celloutsig_0_22z = { _04_[9:4], celloutsig_0_12z, celloutsig_0_18z, celloutsig_0_11z } % { 1'h1, celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_19z };
  assign celloutsig_0_31z = { celloutsig_0_8z[2:1], celloutsig_0_7z, celloutsig_0_7z } % { 1'h1, celloutsig_0_12z[10:8] };
  assign celloutsig_0_39z = | { celloutsig_0_33z, celloutsig_0_17z[8:4], celloutsig_0_9z, celloutsig_0_0z[7:4] };
  assign celloutsig_0_66z = | { celloutsig_0_34z, celloutsig_0_29z, celloutsig_0_18z, celloutsig_0_9z };
  assign celloutsig_1_7z = | celloutsig_1_4z[3:1];
  assign celloutsig_0_19z = | { celloutsig_0_15z[2:0], celloutsig_0_8z };
  assign celloutsig_0_30z = | celloutsig_0_17z[8:4];
  assign celloutsig_0_43z = { celloutsig_0_10z, celloutsig_0_25z, celloutsig_0_37z, celloutsig_0_39z, celloutsig_0_41z } <<< _04_[8:4];
  assign celloutsig_0_52z = celloutsig_0_43z[3:1] <<< { celloutsig_0_31z[1:0], celloutsig_0_32z };
  assign celloutsig_0_67z = celloutsig_0_64z[5:1] <<< { celloutsig_0_18z, celloutsig_0_66z, celloutsig_0_42z, celloutsig_0_41z, celloutsig_0_18z };
  assign celloutsig_1_4z = celloutsig_1_3z[21:17] <<< in_data[179:175];
  assign celloutsig_0_24z = celloutsig_0_6z[10:2] <<< celloutsig_0_2z[9:1];
  assign celloutsig_0_27z = celloutsig_0_2z[9:5] <<< celloutsig_0_17z[6:2];
  assign celloutsig_0_2z = { celloutsig_0_0z[3:2], celloutsig_0_0z, celloutsig_0_0z } <<< { celloutsig_0_0z, _00_, _04_[10:0] };
  assign celloutsig_0_64z = { celloutsig_0_28z[0], celloutsig_0_58z, celloutsig_0_41z, celloutsig_0_55z, celloutsig_0_20z, celloutsig_0_16z, celloutsig_0_19z, celloutsig_0_29z, celloutsig_0_45z } ~^ { celloutsig_0_15z[8:6], _02_ };
  assign celloutsig_1_2z = in_data[132:126] ~^ in_data[115:109];
  assign celloutsig_1_5z = in_data[188:181] ~^ { celloutsig_1_3z[20:14], celloutsig_1_0z };
  assign celloutsig_0_9z = { celloutsig_0_2z[9:8], celloutsig_0_5z } ~^ { celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_1_19z = { celloutsig_1_11z[2:1], celloutsig_1_9z, celloutsig_1_16z, celloutsig_1_18z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_16z } ~^ { celloutsig_1_14z, celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_11z, celloutsig_1_0z, celloutsig_1_14z };
  assign celloutsig_0_12z = { celloutsig_0_0z[3:1], celloutsig_0_0z, celloutsig_0_7z } ~^ { celloutsig_0_6z[6:5], _01_ };
  assign celloutsig_0_26z = { celloutsig_0_9z[1:0], celloutsig_0_8z, celloutsig_0_25z } ~^ celloutsig_0_6z[11:3];
  assign celloutsig_0_28z = { celloutsig_0_27z, celloutsig_0_18z, celloutsig_0_5z, celloutsig_0_16z } ~^ celloutsig_0_2z[9:2];
  assign _04_[11] = _00_;
  assign { out_data[128], out_data[103:96], out_data[42:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_90z, celloutsig_0_91z };
endmodule
