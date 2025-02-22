/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [4:0] _03_;
  wire [6:0] _04_;
  reg [2:0] _05_;
  reg [29:0] _06_;
  wire [9:0] _07_;
  wire [2:0] celloutsig_0_0z;
  wire [23:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [11:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  reg [4:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [4:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [2:0] celloutsig_0_22z;
  wire [13:0] celloutsig_0_23z;
  wire [22:0] celloutsig_0_24z;
  wire [26:0] celloutsig_0_26z;
  wire [6:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [7:0] celloutsig_0_30z;
  wire [2:0] celloutsig_0_31z;
  wire [13:0] celloutsig_0_32z;
  wire [14:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  reg [13:0] celloutsig_0_36z;
  wire [16:0] celloutsig_0_38z;
  wire [4:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [15:0] celloutsig_0_43z;
  wire [6:0] celloutsig_0_45z;
  wire [5:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [4:0] celloutsig_0_49z;
  wire [5:0] celloutsig_0_4z;
  wire [40:0] celloutsig_0_51z;
  wire celloutsig_0_54z;
  wire [5:0] celloutsig_0_55z;
  wire [8:0] celloutsig_0_56z;
  wire celloutsig_0_58z;
  wire [2:0] celloutsig_0_5z;
  wire [8:0] celloutsig_0_60z;
  wire [5:0] celloutsig_0_62z;
  wire [3:0] celloutsig_0_63z;
  wire [7:0] celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_72z;
  wire celloutsig_0_73z;
  wire [3:0] celloutsig_0_75z;
  wire celloutsig_0_77z;
  wire celloutsig_0_7z;
  wire [2:0] celloutsig_0_82z;
  wire [2:0] celloutsig_0_85z;
  wire [23:0] celloutsig_0_88z;
  wire [9:0] celloutsig_0_96z;
  wire [8:0] celloutsig_0_97z;
  wire celloutsig_0_9z;
  wire [13:0] celloutsig_1_0z;
  wire [35:0] celloutsig_1_11z;
  wire [2:0] celloutsig_1_14z;
  wire [9:0] celloutsig_1_15z;
  wire [5:0] celloutsig_1_16z;
  wire [13:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [6:0] celloutsig_1_1z;
  wire [3:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [7:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  reg [44:0] celloutsig_1_7z;
  wire [6:0] celloutsig_1_8z;
  wire [18:0] celloutsig_1_9z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_65z = ~((celloutsig_0_24z[15] | celloutsig_0_9z) & (celloutsig_0_51z[31] | celloutsig_0_54z));
  assign celloutsig_0_72z = ~((celloutsig_0_26z[15] | celloutsig_0_7z) & (celloutsig_0_23z[9] | celloutsig_0_51z[19]));
  assign celloutsig_1_5z = ~((celloutsig_1_1z[4] | in_data[160]) & (celloutsig_1_2z[3] | celloutsig_1_2z[0]));
  assign celloutsig_0_34z = celloutsig_0_28z | ~(celloutsig_0_32z[10]);
  assign celloutsig_0_7z = celloutsig_0_3z | ~(celloutsig_0_1z);
  assign celloutsig_1_6z = celloutsig_1_1z[3] | ~(celloutsig_1_3z);
  assign celloutsig_0_13z = celloutsig_0_4z[5] | ~(in_data[11]);
  assign celloutsig_0_14z = celloutsig_0_13z | ~(celloutsig_0_13z);
  assign celloutsig_0_28z = celloutsig_0_23z[11] | ~(celloutsig_0_23z[11]);
  assign celloutsig_0_0z = in_data[22:20] + in_data[43:41];
  assign celloutsig_0_39z = { _03_[4], _02_, _03_[2:0] } + { _03_[4], _02_, _03_[2:0] };
  assign celloutsig_0_56z = celloutsig_0_24z[11:3] + celloutsig_0_23z[9:1];
  reg [6:0] _20_;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[32])
    if (clkin_data[32]) _20_ <= 7'h00;
    else _20_ <= { celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_6z };
  assign { _04_[6:5], _03_[4], _02_, _03_[2:0] } = _20_;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[32])
    if (clkin_data[32]) _05_ <= 3'h0;
    else _05_ <= _03_[2:0];
  always_ff @(posedge celloutsig_1_18z[0], posedge clkin_data[32])
    if (clkin_data[32]) _06_ <= 30'h00000000;
    else _06_ <= { celloutsig_0_20z[2:1], celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_12z, celloutsig_0_15z, celloutsig_0_13z };
  reg [9:0] _23_;
  always_ff @(posedge celloutsig_1_18z[0], negedge clkin_data[0])
    if (!clkin_data[0]) _23_ <= 10'h000;
    else _23_ <= { celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_20z, celloutsig_0_11z, celloutsig_0_21z };
  assign { _07_[9:8], _00_, _01_, _07_[5:0] } = _23_;
  assign celloutsig_0_41z = { celloutsig_0_4z[4:2], celloutsig_0_22z } <= _06_[25:20];
  assign celloutsig_0_58z = { celloutsig_0_24z[11:3], celloutsig_0_41z } <= celloutsig_0_10z[13:4];
  assign celloutsig_0_21z = { celloutsig_0_20z[4:3], celloutsig_0_2z, _04_[6:5], _03_[4], _02_, _03_[2:0], celloutsig_0_13z } <= { celloutsig_0_19z[3:1], _04_[6:5], _03_[4], _02_, _03_[2:0], celloutsig_0_1z };
  assign celloutsig_0_35z = { celloutsig_0_17z[11:7], celloutsig_0_30z, celloutsig_0_28z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_18z } < { _06_[23:8], celloutsig_0_14z };
  assign celloutsig_0_42z = celloutsig_0_26z[12:5] < { celloutsig_0_30z[7:1], celloutsig_0_9z };
  assign celloutsig_0_70z = { celloutsig_0_28z, celloutsig_0_1z, celloutsig_0_67z } < celloutsig_0_32z[11:9];
  assign celloutsig_0_73z = { celloutsig_0_4z[1], celloutsig_0_35z, celloutsig_0_30z, celloutsig_0_72z } < { celloutsig_0_43z[10:6], celloutsig_0_4z };
  assign celloutsig_0_9z = celloutsig_0_0z < { _03_[1], celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_1_3z = celloutsig_1_2z[3:1] < celloutsig_1_0z[12:10];
  assign celloutsig_0_11z = { celloutsig_0_10z[23], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_5z } < { celloutsig_0_4z[2], celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_7z };
  assign celloutsig_0_12z = { in_data[48:47], celloutsig_0_3z } < { in_data[74], celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_0_15z = { celloutsig_0_4z[4], celloutsig_0_5z } < { in_data[61:60], celloutsig_0_2z, celloutsig_0_12z };
  assign celloutsig_0_85z = celloutsig_0_82z % { 1'h1, celloutsig_0_5z[1:0] };
  assign celloutsig_0_96z = celloutsig_0_36z[10:1] % { 1'h1, celloutsig_0_88z[21:18], celloutsig_0_63z, celloutsig_0_15z };
  assign celloutsig_0_26z = { celloutsig_0_23z[13:1], celloutsig_0_23z } % { 1'h1, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_21z, celloutsig_0_11z, _04_[6:5], _03_[4], _02_, _03_[2:0], celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_17z, celloutsig_0_11z };
  assign celloutsig_0_60z = _06_[14:6] * { celloutsig_0_12z, celloutsig_0_47z, celloutsig_0_55z, celloutsig_0_18z };
  assign celloutsig_0_63z = { celloutsig_0_23z[3:1], celloutsig_0_6z } * { celloutsig_0_36z[0], celloutsig_0_14z, celloutsig_0_58z, celloutsig_0_54z };
  assign celloutsig_0_75z = { _06_[7:5], celloutsig_0_70z } * { celloutsig_0_39z[4:3], celloutsig_0_1z, celloutsig_0_58z };
  assign celloutsig_0_82z = { celloutsig_0_75z[3:2], celloutsig_0_3z } * { celloutsig_0_45z[5:4], celloutsig_0_7z };
  assign celloutsig_0_10z = { celloutsig_0_4z[3], _04_[6:5], _03_[4], _02_, _03_[2:0], celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_4z, _04_[6:5], _03_[4], _02_, _03_[2:0] } * in_data[71:48];
  assign celloutsig_1_16z = { celloutsig_1_1z[5:2], celloutsig_1_3z, celloutsig_1_3z } * { celloutsig_1_11z[15:11], celloutsig_1_3z };
  assign celloutsig_0_62z = celloutsig_0_15z ? { celloutsig_0_4z[4:0], celloutsig_0_34z } : { celloutsig_0_55z[4:0], celloutsig_0_54z };
  assign celloutsig_1_2z = in_data[149] ? in_data[172:169] : in_data[145:142];
  assign celloutsig_1_8z = celloutsig_1_2z[2] ? celloutsig_1_7z[25:19] : celloutsig_1_0z[7:1];
  assign celloutsig_1_15z = celloutsig_1_3z ? { celloutsig_1_7z[5:4], celloutsig_1_5z, celloutsig_1_8z } : { celloutsig_1_1z[1:0], celloutsig_1_14z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_14z };
  assign celloutsig_0_23z = celloutsig_0_5z[1] ? in_data[83:70] : { celloutsig_0_2z, celloutsig_0_7z, _05_, celloutsig_0_5z[2], 1'h0, celloutsig_0_5z[0], celloutsig_0_22z, celloutsig_0_1z, celloutsig_0_18z, celloutsig_0_18z };
  assign celloutsig_0_31z = - celloutsig_0_23z[13:11];
  assign celloutsig_0_4z = - { in_data[5:4], celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_45z = - celloutsig_0_33z[9:3];
  assign celloutsig_0_5z = - { in_data[20:19], celloutsig_0_1z };
  assign celloutsig_0_55z = - { _06_[6:2], celloutsig_0_15z };
  assign celloutsig_1_9z = - { celloutsig_1_2z[2:0], celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_5z };
  assign celloutsig_1_18z = - { celloutsig_1_15z[9:2], celloutsig_1_16z };
  assign celloutsig_0_17z = - { celloutsig_0_4z[4:2], celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_6z };
  assign celloutsig_0_3z = { in_data[58:56], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z } !== { celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_77z = celloutsig_0_60z[5:1] !== { celloutsig_0_23z[7:4], celloutsig_0_73z };
  assign celloutsig_0_51z = ~ { celloutsig_0_38z[15:1], celloutsig_0_46z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_42z, celloutsig_0_28z, celloutsig_0_2z, celloutsig_0_33z };
  assign celloutsig_1_1z = ~ in_data[145:139];
  assign celloutsig_1_14z = ~ celloutsig_1_8z[3:1];
  assign celloutsig_0_20z = ~ celloutsig_0_17z[7:3];
  assign celloutsig_0_30z = ~ { celloutsig_0_27z[6:1], celloutsig_0_11z, celloutsig_0_15z };
  assign celloutsig_1_19z = celloutsig_1_11z[14] & celloutsig_1_15z[9];
  assign celloutsig_0_1z = in_data[79] & celloutsig_0_0z[1];
  assign celloutsig_0_18z = celloutsig_0_3z & celloutsig_0_15z;
  assign celloutsig_0_33z = { celloutsig_0_17z[9:0], celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_14z } << { celloutsig_0_17z[11:2], celloutsig_0_20z };
  assign celloutsig_0_38z = { celloutsig_0_24z[12:0], celloutsig_0_34z, celloutsig_0_18z, celloutsig_0_2z, celloutsig_0_11z } << { in_data[37:24], celloutsig_0_14z, celloutsig_0_18z, celloutsig_0_7z };
  assign celloutsig_0_46z = { in_data[22:18], celloutsig_0_21z } << celloutsig_0_4z;
  assign celloutsig_0_49z = { celloutsig_0_30z[0], celloutsig_0_0z, celloutsig_0_11z } << celloutsig_0_46z[5:1];
  assign celloutsig_0_88z = { celloutsig_0_23z[13:6], celloutsig_0_62z, celloutsig_0_65z, celloutsig_0_39z, celloutsig_0_85z, celloutsig_0_42z } << { _07_[9:8], _00_, _01_, _07_[5:3], celloutsig_0_28z, celloutsig_0_47z, _04_[6:5], _03_[4], _02_, _03_[2:0], celloutsig_0_27z, celloutsig_0_6z };
  assign celloutsig_0_97z = { celloutsig_0_5z[1], _05_, celloutsig_0_31z, celloutsig_0_42z, celloutsig_0_35z } << { celloutsig_0_27z[4:0], _05_, celloutsig_0_77z };
  assign celloutsig_1_0z = in_data[177:164] << in_data[144:131];
  assign celloutsig_1_4z = { celloutsig_1_0z[13], celloutsig_1_1z } << { in_data[173], celloutsig_1_1z };
  assign celloutsig_1_11z = { celloutsig_1_7z[39:11], celloutsig_1_1z } << { celloutsig_1_9z[9:4], celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_0_32z = { celloutsig_0_10z[3:2], _04_[6:5], _03_[4], _02_, _03_[2:0], celloutsig_0_31z, celloutsig_0_1z, celloutsig_0_9z } >>> { celloutsig_0_23z[4:0], celloutsig_0_9z, celloutsig_0_30z };
  assign celloutsig_0_43z = { celloutsig_0_4z[5:2], celloutsig_0_17z } >>> { celloutsig_0_32z[8:3], celloutsig_0_27z, celloutsig_0_2z, celloutsig_0_35z, celloutsig_0_28z };
  assign celloutsig_0_64z = { celloutsig_0_56z[6], celloutsig_0_3z, celloutsig_0_63z, celloutsig_0_18z, celloutsig_0_34z } >>> { celloutsig_0_49z[3:2], celloutsig_0_62z };
  assign celloutsig_0_22z = celloutsig_0_17z[6:4] - { celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_12z };
  assign celloutsig_0_24z = { celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_20z, celloutsig_0_17z, celloutsig_0_18z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_13z } - { celloutsig_0_17z[9:1], celloutsig_0_6z, celloutsig_0_21z, _04_[6:5], _03_[4], _02_, _03_[2:0], celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_12z };
  assign celloutsig_0_27z = celloutsig_0_24z[13:7] - celloutsig_0_23z[7:1];
  assign celloutsig_0_47z = ~((celloutsig_0_14z & in_data[59]) | celloutsig_0_30z[6]);
  assign celloutsig_0_54z = ~((celloutsig_0_5z[2] & celloutsig_0_21z) | celloutsig_0_34z);
  assign celloutsig_0_6z = ~((celloutsig_0_0z[0] & celloutsig_0_2z) | celloutsig_0_1z);
  assign celloutsig_0_67z = ~((_01_ & celloutsig_0_18z) | celloutsig_0_64z[5]);
  assign celloutsig_0_2z = ~((celloutsig_0_1z & celloutsig_0_1z) | celloutsig_0_1z);
  always_latch
    if (clkin_data[0]) celloutsig_0_36z = 14'h0000;
    else if (!clkin_data[128]) celloutsig_0_36z = { celloutsig_0_32z[13:7], celloutsig_0_27z };
  always_latch
    if (clkin_data[64]) celloutsig_1_7z = 45'h000000000000;
    else if (clkin_data[160]) celloutsig_1_7z = { in_data[125:117], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_0z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_19z = 5'h00;
    else if (!clkin_data[128]) celloutsig_0_19z = celloutsig_0_4z[4:0];
  assign _03_[3] = _02_;
  assign _04_[4:0] = { _03_[4], _02_, _03_[2:0] };
  assign _07_[7:6] = { _00_, _01_ };
  assign { out_data[141:128], out_data[96], out_data[41:32], out_data[8:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_96z, celloutsig_0_97z };
endmodule
