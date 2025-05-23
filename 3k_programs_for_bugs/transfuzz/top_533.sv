/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire [3:0] _05_;
  wire [3:0] _06_;
  reg [2:0] _07_;
  wire [3:0] _08_;
  wire [5:0] _09_;
  wire [16:0] _10_;
  reg [6:0] _11_;
  reg [15:0] _12_;
  reg [7:0] _13_;
  reg [7:0] _14_;
  wire [16:0] _15_;
  wire [8:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [29:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [16:0] celloutsig_0_17z;
  wire [11:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire [2:0] celloutsig_0_21z;
  wire [3:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [6:0] celloutsig_0_27z;
  wire [7:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [8:0] celloutsig_0_31z;
  wire [19:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [7:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [35:0] celloutsig_0_37z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [3:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [13:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire [22:0] celloutsig_0_49z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire [19:0] celloutsig_0_53z;
  wire celloutsig_0_55z;
  wire celloutsig_0_57z;
  wire celloutsig_0_59z;
  wire [9:0] celloutsig_0_5z;
  wire [2:0] celloutsig_0_61z;
  wire [4:0] celloutsig_0_62z;
  wire [4:0] celloutsig_0_63z;
  wire [17:0] celloutsig_0_64z;
  wire [9:0] celloutsig_0_65z;
  wire [3:0] celloutsig_0_66z;
  wire [5:0] celloutsig_0_70z;
  wire celloutsig_0_71z;
  wire celloutsig_0_75z;
  wire [5:0] celloutsig_0_76z;
  wire celloutsig_0_82z;
  wire [2:0] celloutsig_0_8z;
  wire [10:0] celloutsig_0_94z;
  wire [11:0] celloutsig_0_96z;
  wire celloutsig_0_97z;
  wire [26:0] celloutsig_0_9z;
  wire [5:0] celloutsig_1_0z;
  wire [4:0] celloutsig_1_12z;
  wire [18:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [14:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [12:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [30:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_39z = celloutsig_0_14z ? celloutsig_0_37z[6] : _00_;
  assign celloutsig_0_46z = celloutsig_0_22z[1] ? celloutsig_0_11z : celloutsig_0_14z;
  assign celloutsig_0_52z = celloutsig_0_21z[0] ? celloutsig_0_30z : celloutsig_0_32z[19];
  assign celloutsig_0_59z = celloutsig_0_20z[4] ? celloutsig_0_1z : _01_;
  assign celloutsig_0_33z = ~(celloutsig_0_20z[1] | celloutsig_0_23z);
  assign celloutsig_0_51z = ~(celloutsig_0_22z[1] | celloutsig_0_20z[0]);
  assign celloutsig_0_55z = ~(celloutsig_0_26z | celloutsig_0_39z);
  assign celloutsig_0_75z = ~(celloutsig_0_35z | _02_);
  assign celloutsig_1_8z = ~(celloutsig_1_1z | celloutsig_1_7z);
  assign celloutsig_0_48z = ~((celloutsig_0_28z[2] | _03_) & celloutsig_0_32z[13]);
  assign celloutsig_0_82z = ~((celloutsig_0_52z | celloutsig_0_70z[1]) & celloutsig_0_48z);
  assign celloutsig_0_1z = in_data[70] | celloutsig_0_0z[2];
  assign celloutsig_0_30z = ~(celloutsig_0_18z[7] ^ celloutsig_0_8z[0]);
  assign celloutsig_0_10z = ~(celloutsig_0_2z ^ celloutsig_0_8z[1]);
  assign celloutsig_0_25z = ~(celloutsig_0_3z ^ _04_);
  assign celloutsig_0_40z = { _03_, _01_, _05_[1], celloutsig_0_15z } + { _06_[3:1], _00_ };
  assign celloutsig_1_0z = in_data[157:152] + in_data[150:145];
  reg [5:0] _33_;
  always_ff @(posedge celloutsig_1_18z[0], negedge clkin_data[96])
    if (!clkin_data[96]) _33_ <= 6'h00;
    else _33_ <= { in_data[60:57], celloutsig_0_3z, celloutsig_0_3z };
  assign { _09_[5:4], _03_, _01_, _05_[1], _09_[0] } = _33_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _07_ <= 3'h0;
    else _07_ <= celloutsig_0_34z[7:5];
  reg [3:0] _35_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _35_ <= 4'h0;
    else _35_ <= celloutsig_0_9z[18:15];
  assign { _08_[3:1], _02_ } = _35_;
  reg [16:0] _36_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _36_ <= 17'h00000;
    else _36_ <= { celloutsig_0_5z[3:0], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_2z };
  assign { _10_[16:9], _04_, _10_[7:0] } = _36_;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[64])
    if (clkin_data[64]) _11_ <= 7'h00;
    else _11_ <= celloutsig_0_5z[7:1];
  always_ff @(posedge clkin_data[32], posedge clkin_data[128])
    if (clkin_data[128]) _12_ <= 16'h0000;
    else _12_ <= { celloutsig_1_6z[11:5], celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_5z };
  always_ff @(negedge clkin_data[32], negedge clkin_data[128])
    if (!clkin_data[128]) _13_ <= 8'h00;
    else _13_ <= celloutsig_1_9z[24:17];
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _14_ <= 8'h00;
    else _14_ <= { celloutsig_0_3z, _11_ };
  reg [16:0] _41_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _41_ <= 17'h00000;
    else _41_ <= { _03_, _01_, _05_[1], _09_[0], celloutsig_0_21z, _14_, celloutsig_0_3z, celloutsig_0_3z };
  assign { _15_[16:5], _06_[3:1], _00_, _15_[0] } = _41_;
  assign celloutsig_0_5z = { in_data[58:54], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z } & { celloutsig_0_0z[7:0], celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_28z = { _10_[9], _04_, _10_[7:4], celloutsig_0_13z, celloutsig_0_3z } & { _15_[11:5], _06_[3] };
  assign celloutsig_0_42z = { celloutsig_0_5z[2:1], celloutsig_0_16z, celloutsig_0_21z, celloutsig_0_34z } / { 1'h1, _10_[10:9], _04_, _10_[7:6], celloutsig_0_34z[7:1], in_data[0] };
  assign celloutsig_0_8z = { celloutsig_0_0z[2:1], celloutsig_0_3z } / { 1'h1, celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_0_12z = { celloutsig_0_9z[26:1], celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_10z } / { 1'h1, celloutsig_0_5z[4:3], celloutsig_0_9z };
  assign celloutsig_1_3z = { in_data[157], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z } > { in_data[140:127], celloutsig_1_1z };
  assign celloutsig_0_41z = in_data[50:33] || { celloutsig_0_20z[0], celloutsig_0_34z, celloutsig_0_16z, celloutsig_0_23z, celloutsig_0_2z, celloutsig_0_20z };
  assign celloutsig_0_14z = { celloutsig_0_0z[6:3], celloutsig_0_2z, celloutsig_0_10z } || celloutsig_0_5z[8:3];
  assign celloutsig_0_2z = { in_data[40:31], celloutsig_0_0z, celloutsig_0_1z } || in_data[55:36];
  assign celloutsig_0_97z = { celloutsig_0_35z, celloutsig_0_76z, celloutsig_0_59z, celloutsig_0_13z } < celloutsig_0_42z[10:2];
  assign celloutsig_1_19z = { celloutsig_1_18z[16:11], celloutsig_1_7z } < celloutsig_1_18z[12:6];
  assign celloutsig_0_11z = { in_data[81:78], celloutsig_0_10z } < _10_[7:3];
  assign celloutsig_0_23z = { _14_[1:0], celloutsig_0_14z } < _11_[4:2];
  assign celloutsig_0_0z = in_data[71:63] % { 1'h1, in_data[11:4] };
  assign celloutsig_0_32z = { celloutsig_0_18z[6:4], celloutsig_0_17z } % { 1'h1, celloutsig_0_9z[25:11], celloutsig_0_16z, celloutsig_0_21z };
  assign celloutsig_0_37z = { _04_, _10_[7:1], celloutsig_0_15z, celloutsig_0_9z } % { 1'h1, celloutsig_0_5z[5:3], celloutsig_0_12z, celloutsig_0_2z, celloutsig_0_25z };
  assign celloutsig_1_9z = { in_data[129:122], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_5z } % { 1'h1, celloutsig_1_6z[11:2], celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_1_12z = { celloutsig_1_0z[4:1], celloutsig_1_7z } % { 1'h1, celloutsig_1_4z[5:2] };
  assign celloutsig_1_18z = { _12_[15:1], celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_1z } % { 1'h1, celloutsig_1_0z[3:0], celloutsig_1_12z, celloutsig_1_3z, _13_ };
  assign celloutsig_0_18z = { in_data[88:82], celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_8z } % { 1'h1, _04_, _10_[7:6], celloutsig_0_10z, _11_ };
  assign celloutsig_0_22z = { celloutsig_0_17z[3:1], celloutsig_0_15z } % { 1'h1, celloutsig_0_18z[3:1] };
  assign celloutsig_0_27z = celloutsig_0_0z[8:2] % { 1'h1, in_data[48:46], celloutsig_0_8z };
  assign celloutsig_0_71z = { _14_[6:0], celloutsig_0_28z, celloutsig_0_41z, celloutsig_0_20z, celloutsig_0_55z } != { celloutsig_0_9z[15:3], celloutsig_0_44z, _11_, celloutsig_0_10z, celloutsig_0_3z };
  assign celloutsig_1_5z = celloutsig_1_4z[11:4] != { celloutsig_1_4z[5], celloutsig_1_2z };
  assign celloutsig_0_15z = { celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_11z } != _10_[6:4];
  assign celloutsig_0_53z = - { celloutsig_0_9z[9:4], celloutsig_0_26z, celloutsig_0_23z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_0z };
  assign celloutsig_0_63z = - { celloutsig_0_52z, celloutsig_0_22z };
  assign celloutsig_1_4z = - in_data[125:111];
  assign celloutsig_1_6z = - { in_data[189:179], celloutsig_1_5z, celloutsig_1_3z };
  assign celloutsig_0_21z = - { _14_[4:3], celloutsig_0_11z };
  assign celloutsig_1_1z = in_data[162:159] !== celloutsig_1_0z[5:2];
  assign celloutsig_0_26z = celloutsig_0_9z[20:14] !== { _14_[7:2], celloutsig_0_14z };
  assign celloutsig_0_34z = celloutsig_0_0z[7:0] | celloutsig_0_12z[10:3];
  assign celloutsig_0_64z = { celloutsig_0_31z[5], celloutsig_0_63z, celloutsig_0_26z, celloutsig_0_43z, celloutsig_0_0z, celloutsig_0_13z } | { celloutsig_0_63z[4], celloutsig_0_15z, _11_, celloutsig_0_10z, celloutsig_0_59z, celloutsig_0_27z };
  assign celloutsig_0_65z = { celloutsig_0_53z[16:8], celloutsig_0_57z } | celloutsig_0_53z[12:3];
  assign celloutsig_1_7z = celloutsig_1_6z[12] & celloutsig_1_5z;
  assign celloutsig_0_13z = celloutsig_0_12z[13] & celloutsig_0_10z;
  assign celloutsig_0_44z = | { celloutsig_0_39z, celloutsig_0_28z, celloutsig_0_27z, _14_[6:4], celloutsig_0_13z, celloutsig_0_11z };
  assign celloutsig_0_57z = | { celloutsig_0_29z, celloutsig_0_23z, celloutsig_0_18z[10:0], celloutsig_0_11z };
  assign celloutsig_0_16z = | { celloutsig_0_13z, celloutsig_0_5z[2:0] };
  assign celloutsig_0_3z = ~^ { in_data[53:39], celloutsig_0_2z };
  assign celloutsig_0_43z = ~^ { celloutsig_0_26z, celloutsig_0_39z, celloutsig_0_10z, celloutsig_0_16z };
  assign celloutsig_0_31z = { celloutsig_0_20z[5:2], celloutsig_0_22z, celloutsig_0_15z } << { celloutsig_0_17z[6:1], celloutsig_0_14z, celloutsig_0_30z, celloutsig_0_25z };
  assign celloutsig_0_9z = in_data[50:24] << { celloutsig_0_5z[9:6], _09_[5:4], _03_, _01_, _05_[1], _09_[0], _09_[5:4], _03_, _01_, _05_[1], _09_[0], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_62z = celloutsig_0_12z[25:21] <<< celloutsig_0_31z[5:1];
  assign celloutsig_0_66z = celloutsig_0_17z[5:2] <<< { celloutsig_0_27z[6:4], celloutsig_0_13z };
  assign celloutsig_1_2z = { celloutsig_1_1z, celloutsig_1_0z } <<< { celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_20z = { celloutsig_0_9z[24], celloutsig_0_15z, celloutsig_0_8z, celloutsig_0_10z } >>> { _09_[4], _03_, _01_, _05_[1], _09_[0], celloutsig_0_1z };
  assign celloutsig_0_49z = { celloutsig_0_37z[17:4], _11_, celloutsig_0_14z, celloutsig_0_3z } - { celloutsig_0_9z[21:1], celloutsig_0_33z, celloutsig_0_2z };
  assign celloutsig_0_61z = celloutsig_0_31z[3:1] - { celloutsig_0_37z[31:30], celloutsig_0_26z };
  assign celloutsig_0_70z = { celloutsig_0_49z[8:7], celloutsig_0_11z, celloutsig_0_46z, celloutsig_0_11z, celloutsig_0_16z } - { celloutsig_0_23z, celloutsig_0_43z, celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_30z, celloutsig_0_51z };
  assign celloutsig_0_76z = { celloutsig_0_21z, celloutsig_0_59z, celloutsig_0_71z, celloutsig_0_44z } - { celloutsig_0_0z[5], celloutsig_0_40z, celloutsig_0_13z };
  assign celloutsig_0_94z = { celloutsig_0_8z[2], celloutsig_0_82z, celloutsig_0_75z, _07_, celloutsig_0_63z } - celloutsig_0_64z[12:2];
  assign celloutsig_0_96z = { celloutsig_0_65z[4:0], celloutsig_0_61z, celloutsig_0_66z } - { celloutsig_0_62z[1], celloutsig_0_94z };
  assign celloutsig_0_17z = { _09_[4], _03_, _01_, celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_1z, celloutsig_0_10z } - { celloutsig_0_9z[17:5], celloutsig_0_2z, celloutsig_0_8z };
  assign celloutsig_0_35z = ~((celloutsig_0_11z & celloutsig_0_16z) | (_06_[3] & celloutsig_0_22z[1]));
  assign celloutsig_0_29z = ~((_14_[7] & celloutsig_0_16z) | (in_data[1] & celloutsig_0_13z));
  assign { _05_[3:2], _05_[0] } = { _03_, _01_, celloutsig_0_15z };
  assign _06_[0] = _00_;
  assign _08_[0] = _02_;
  assign _09_[3:1] = { _03_, _01_, _05_[1] };
  assign _10_[8] = _04_;
  assign _15_[4:1] = { _06_[3:1], _00_ };
  assign { out_data[146:128], out_data[96], out_data[43:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_96z, celloutsig_0_97z };
endmodule
