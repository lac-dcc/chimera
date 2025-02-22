/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire [8:0] _07_;
  wire [28:0] _08_;
  wire [28:0] _09_;
  wire [7:0] _10_;
  wire [18:0] _11_;
  wire [5:0] _12_;
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [2:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [5:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [3:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [8:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [4:0] celloutsig_0_25z;
  wire [16:0] celloutsig_0_27z;
  wire [21:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [5:0] celloutsig_0_36z;
  wire [6:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [47:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire [8:0] celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [10:0] celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire [7:0] celloutsig_0_58z;
  wire [9:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire [4:0] celloutsig_0_62z;
  wire [2:0] celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire celloutsig_0_66z;
  wire celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire [14:0] celloutsig_0_72z;
  wire celloutsig_0_73z;
  wire celloutsig_0_7z;
  wire celloutsig_0_81z;
  wire celloutsig_0_82z;
  wire [2:0] celloutsig_0_85z;
  wire celloutsig_0_86z;
  wire [5:0] celloutsig_0_8z;
  wire celloutsig_0_96z;
  wire [30:0] celloutsig_0_97z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_12z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [10:0] celloutsig_1_3z;
  wire [10:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [18:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [16:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_81z = ~(celloutsig_0_1z & _00_);
  assign celloutsig_0_9z = ~(celloutsig_0_7z & celloutsig_0_2z);
  assign celloutsig_0_2z = !(in_data[24] ? celloutsig_0_0z[2] : celloutsig_0_0z[1]);
  assign celloutsig_0_65z = ~(celloutsig_0_21z | _03_);
  assign celloutsig_0_7z = ~(celloutsig_0_6z | in_data[7]);
  assign celloutsig_1_5z = ~(celloutsig_1_0z | celloutsig_1_0z);
  assign celloutsig_1_17z = ~(_04_ | celloutsig_1_7z);
  assign celloutsig_0_21z = ~(celloutsig_0_8z[4] | celloutsig_0_1z);
  assign celloutsig_0_30z = ~(1'h1 | celloutsig_0_23z);
  assign celloutsig_0_40z = ~((celloutsig_0_1z | celloutsig_0_6z) & celloutsig_0_25z[4]);
  assign celloutsig_0_53z = ~((celloutsig_0_31z | celloutsig_0_41z) & celloutsig_0_6z);
  assign celloutsig_0_66z = ~((celloutsig_0_51z[0] | celloutsig_0_36z[5]) & (celloutsig_0_41z | celloutsig_0_62z[3]));
  assign celloutsig_0_4z = celloutsig_0_0z[1] | ~(celloutsig_0_2z);
  assign celloutsig_1_1z = in_data[122] | ~(celloutsig_1_0z);
  assign celloutsig_0_12z = celloutsig_0_9z | ~(celloutsig_0_2z);
  assign celloutsig_1_18z = ~(celloutsig_1_4z[6] ^ celloutsig_1_1z);
  assign celloutsig_0_31z = ~(celloutsig_0_27z[9] ^ celloutsig_0_2z);
  assign celloutsig_0_59z = { celloutsig_0_25z[4:1], celloutsig_0_53z, celloutsig_0_19z, celloutsig_0_14z } + { celloutsig_0_0z, celloutsig_0_45z, celloutsig_0_45z, celloutsig_0_19z };
  assign celloutsig_0_62z = celloutsig_0_36z[4:0] + { celloutsig_0_20z[4:1], celloutsig_0_33z };
  assign celloutsig_0_85z = { celloutsig_0_56z, celloutsig_0_53z, celloutsig_0_50z } + { celloutsig_0_34z, celloutsig_0_61z, celloutsig_0_24z };
  assign celloutsig_0_22z = { _07_[8:4], celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_4z, celloutsig_0_9z } + { celloutsig_0_20z[2:0], celloutsig_0_17z };
  reg [28:0] _34_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _34_ <= 29'h00000000;
    else _34_ <= { _08_[28:27], _00_, _08_[25:24], celloutsig_0_6z, celloutsig_0_34z, celloutsig_0_0z, _08_[17], _01_, _08_[15:13], celloutsig_0_32z, celloutsig_0_32z, celloutsig_0_14z, celloutsig_0_18z, celloutsig_0_22z };
  assign { _09_[28:22], _02_, _09_[20:0] } = _34_;
  reg [4:0] _35_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _35_ <= 5'h00;
    else _35_ <= in_data[37:33];
  assign { _08_[17], _01_, _08_[15:13] } = _35_;
  reg [7:0] _36_;
  always_ff @(posedge clkin_data[32], posedge clkin_data[64])
    if (clkin_data[64]) _36_ <= 8'h00;
    else _36_ <= celloutsig_1_8z[12:5];
  assign { _10_[7:1], _04_ } = _36_;
  reg [18:0] _37_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _37_ <= 19'h00000;
    else _37_ <= { in_data[78:74], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_0z, 1'h1 };
  assign { _11_[18:16], _06_, _11_[14], _05_, _11_[12:10], celloutsig_0_42z[9], _03_, _07_[8:4], _11_[2:0] } = _37_;
  reg [5:0] _38_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _38_ <= 6'h00;
    else _38_ <= { celloutsig_0_20z[3], celloutsig_0_0z, celloutsig_0_12z };
  assign { _12_[5], _08_[28:27], _00_, _08_[25:24] } = _38_;
  assign celloutsig_1_3z = { in_data[114:105], celloutsig_1_1z } & { in_data[147:146], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_4z = in_data[173:163] & { celloutsig_1_3z[10:2], celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_58z = celloutsig_0_22z[7:0] / { 1'h1, celloutsig_0_0z[1:0], celloutsig_0_52z, celloutsig_0_21z, celloutsig_0_29z, celloutsig_0_14z, celloutsig_0_2z };
  assign celloutsig_0_38z = { celloutsig_0_13z, celloutsig_0_37z, celloutsig_0_34z, celloutsig_0_2z } === { in_data[28:23], celloutsig_0_19z };
  assign celloutsig_0_54z = celloutsig_0_27z[11:1] === { _08_[17], _01_, _08_[15:14], celloutsig_0_52z, celloutsig_0_25z, celloutsig_0_34z };
  assign celloutsig_0_1z = { in_data[14:12], celloutsig_0_0z } >= { in_data[60:58], celloutsig_0_0z };
  assign celloutsig_0_49z = { celloutsig_0_36z[0], celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_16z, celloutsig_0_12z } && { celloutsig_0_0z[3:1], celloutsig_0_18z, celloutsig_0_31z };
  assign celloutsig_0_50z = { celloutsig_0_0z[2:1], _08_[17], _01_, _08_[15:13], celloutsig_0_23z } && { celloutsig_0_47z[6:0], celloutsig_0_18z };
  assign celloutsig_0_46z = { celloutsig_0_33z, celloutsig_0_29z, celloutsig_0_23z, celloutsig_0_38z, celloutsig_0_24z } || { celloutsig_0_4z, celloutsig_0_19z };
  assign celloutsig_0_67z = { celloutsig_0_64z, celloutsig_0_50z } || { in_data[43:42], celloutsig_0_35z, celloutsig_0_12z };
  assign celloutsig_0_82z = { celloutsig_0_25z[0], celloutsig_0_45z, celloutsig_0_6z, celloutsig_0_40z, celloutsig_0_49z } || celloutsig_0_42z[37:33];
  assign celloutsig_0_86z = { celloutsig_0_81z, celloutsig_0_73z, celloutsig_0_65z, celloutsig_0_82z } || { celloutsig_0_66z, celloutsig_0_50z, celloutsig_0_1z, celloutsig_0_65z };
  assign celloutsig_1_9z = celloutsig_1_6z[10:5] || celloutsig_1_6z[11:6];
  assign celloutsig_0_33z = celloutsig_0_7z & ~(_08_[14]);
  assign celloutsig_0_52z = in_data[26] & ~(celloutsig_0_18z);
  assign celloutsig_0_5z = celloutsig_0_1z & ~(celloutsig_0_0z[0]);
  assign celloutsig_0_6z = celloutsig_0_1z & ~(in_data[68]);
  assign celloutsig_0_73z = celloutsig_0_61z & ~(celloutsig_0_64z[2]);
  assign celloutsig_0_23z = celloutsig_0_4z & ~(celloutsig_0_0z[0]);
  assign celloutsig_0_37z = { celloutsig_0_28z[17:13], celloutsig_0_6z, celloutsig_0_18z } % { 1'h1, celloutsig_0_36z[4:0], celloutsig_0_30z };
  assign celloutsig_0_8z = { in_data[42:41], celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_2z } % { 1'h1, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_1_6z = { in_data[112:110], celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_1z } % { 1'h1, in_data[122:118], celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_5z };
  assign celloutsig_1_8z = { celloutsig_1_4z[5:2], celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_1z } % { 1'h1, celloutsig_1_6z[13:12], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_7z };
  assign celloutsig_0_27z = { celloutsig_0_22z, celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_8z } % { 1'h1, celloutsig_0_19z[0], celloutsig_0_19z, celloutsig_0_1z, celloutsig_0_14z, celloutsig_0_14z, celloutsig_0_7z, _08_[17], _01_, _08_[15:13], celloutsig_0_14z, celloutsig_0_14z };
  assign celloutsig_0_28z = in_data[41:20] % { 1'h1, celloutsig_0_20z[4:0], celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_21z, celloutsig_0_7z, _12_[5], _08_[28:27], _00_, _08_[25:24], celloutsig_0_5z };
  assign celloutsig_0_47z = { celloutsig_0_28z[16:11], celloutsig_0_35z, celloutsig_0_35z, celloutsig_0_4z } % { 1'h1, celloutsig_0_0z[2:1], celloutsig_0_20z };
  assign celloutsig_0_64z = { celloutsig_0_17z[4:3], celloutsig_0_33z } % { 1'h1, celloutsig_0_1z, celloutsig_0_32z };
  assign celloutsig_0_72z = { celloutsig_0_51z[5:1], celloutsig_0_53z, celloutsig_0_43z, celloutsig_0_58z } % { 1'h1, celloutsig_0_59z, celloutsig_0_14z, celloutsig_0_70z, celloutsig_0_14z, celloutsig_0_52z };
  assign celloutsig_0_25z = celloutsig_0_8z[4:0] % { 1'h1, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_4z };
  assign celloutsig_0_15z = in_data[55:53] * { celloutsig_0_42z[9], _03_, _07_[8] };
  assign celloutsig_0_0z = in_data[92] ? { in_data[95:93], 1'h1 } : in_data[78:75];
  assign celloutsig_0_51z = celloutsig_0_43z ? { _09_[11:2], celloutsig_0_14z } : { celloutsig_0_22z[6:3], _12_[5], _08_[28:27], _00_, _08_[25:24], celloutsig_0_2z };
  assign celloutsig_0_97z = celloutsig_0_23z ? { celloutsig_0_21z, celloutsig_0_67z, celloutsig_0_85z, celloutsig_0_29z, celloutsig_0_41z, celloutsig_0_86z, celloutsig_0_28z, celloutsig_0_54z } : { celloutsig_0_25z, celloutsig_0_41z, celloutsig_0_72z, celloutsig_0_35z, celloutsig_0_47z };
  assign celloutsig_0_17z = - { celloutsig_0_15z[2:1], celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_4z, 1'h1 };
  assign celloutsig_0_19z = - { celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_7z };
  assign celloutsig_0_34z = | { in_data[82:70], celloutsig_0_1z, celloutsig_0_33z, celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_12z, celloutsig_0_6z };
  assign celloutsig_1_12z = | { celloutsig_1_8z[16:3], celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_5z, _10_[7:1], _04_ };
  assign celloutsig_0_16z = | { _11_[14], _05_, _11_[12:10], celloutsig_0_42z[9], _03_, _07_[8:4] };
  assign celloutsig_0_43z = | { celloutsig_0_27z[11:2], celloutsig_0_16z };
  assign celloutsig_0_55z = | celloutsig_0_37z[5:1];
  assign celloutsig_0_96z = | { celloutsig_0_82z, celloutsig_0_46z, celloutsig_0_45z, celloutsig_0_30z, celloutsig_0_1z };
  assign celloutsig_1_0z = | in_data[188:176];
  assign celloutsig_1_2z = | in_data[186:179];
  assign celloutsig_1_19z = | { celloutsig_1_17z, celloutsig_1_12z, celloutsig_1_6z[6:2] };
  assign celloutsig_0_24z = | { celloutsig_0_23z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_29z = | in_data[18:12];
  assign celloutsig_0_41z = ~^ { celloutsig_0_28z[4:0], celloutsig_0_40z, celloutsig_0_33z };
  assign celloutsig_0_70z = ~^ celloutsig_0_17z;
  assign celloutsig_1_7z = ~^ { celloutsig_1_6z[6:1], celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_13z = ~^ { _07_[6:4], _11_[2:1], celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_4z };
  assign celloutsig_0_18z = ~^ { _07_[6:5], celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_0_35z = ^ { _08_[17], _01_, _08_[15:14], celloutsig_0_18z, celloutsig_0_23z };
  assign celloutsig_0_56z = ^ { _08_[28:27], _00_, _08_[25:24], _12_[5], _08_[28:27], _00_, _08_[25:24] };
  assign celloutsig_0_14z = ^ { _05_, _11_[12:10], celloutsig_0_42z[9] };
  assign celloutsig_0_20z = { celloutsig_0_4z, _08_[17], _01_, _08_[15:13] } >>> { celloutsig_0_8z[4:2], celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_2z };
  assign celloutsig_0_36z = celloutsig_0_22z[7:2] ^ { _11_[12:10], celloutsig_0_42z[9], _03_, _07_[8] };
  assign celloutsig_0_32z = ~((celloutsig_0_0z[1] & celloutsig_0_18z) | celloutsig_0_6z);
  assign celloutsig_0_45z = ~((celloutsig_0_20z[1] & celloutsig_0_27z[13]) | (celloutsig_0_31z & celloutsig_0_33z));
  assign celloutsig_0_61z = ~((celloutsig_0_31z & celloutsig_0_31z) | (celloutsig_0_55z & celloutsig_0_6z));
  assign { celloutsig_0_42z[20], celloutsig_0_42z[35], celloutsig_0_42z[42:37], celloutsig_0_42z[19], celloutsig_0_42z[47:43], celloutsig_0_42z[28], celloutsig_0_42z[21], celloutsig_0_42z[18:10], celloutsig_0_42z[8:0], celloutsig_0_42z[27], celloutsig_0_42z[34:33], celloutsig_0_42z[26], celloutsig_0_42z[32], celloutsig_0_42z[25], celloutsig_0_42z[31], celloutsig_0_42z[24], celloutsig_0_42z[30], celloutsig_0_42z[23], celloutsig_0_42z[29], celloutsig_0_42z[22], celloutsig_0_42z[36] } = { celloutsig_0_40z, celloutsig_0_38z, _12_[5], _08_[28:27], _00_, _08_[25:24], celloutsig_0_24z, celloutsig_0_22z[5:1], celloutsig_0_14z, celloutsig_0_12z, _11_[18:16], _06_, _11_[14], _05_, _11_[12:10], _03_, _07_[8:4], _11_[2:0], celloutsig_0_8z[5], celloutsig_0_8z[5:4], celloutsig_0_8z[4:3], celloutsig_0_8z[3:2], celloutsig_0_8z[2:1], celloutsig_0_8z[1:0], celloutsig_0_8z[0], celloutsig_0_6z } & { celloutsig_0_27z[3], celloutsig_0_7z, celloutsig_0_0z[2:0], celloutsig_0_16z, celloutsig_0_40z, celloutsig_0_35z, celloutsig_0_27z[2], celloutsig_0_8z[4:3], celloutsig_0_13z, celloutsig_0_35z, celloutsig_0_0z[3], celloutsig_0_27z[11], celloutsig_0_27z[4], celloutsig_0_27z[1:0], celloutsig_0_1z, celloutsig_0_24z, celloutsig_0_25z, celloutsig_0_7z, celloutsig_0_17z, celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_27z[10], celloutsig_0_24z, celloutsig_0_27z[16], celloutsig_0_27z[9], celloutsig_0_27z[15], celloutsig_0_27z[8], celloutsig_0_27z[14], celloutsig_0_27z[7], celloutsig_0_27z[13], celloutsig_0_27z[6], celloutsig_0_27z[12], celloutsig_0_27z[5], celloutsig_0_16z };
  assign _07_[3:0] = { celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_4z, celloutsig_0_9z };
  assign { _08_[26], _08_[23:18], _08_[16], _08_[12:0] } = { _00_, celloutsig_0_6z, celloutsig_0_34z, celloutsig_0_0z, _01_, celloutsig_0_32z, celloutsig_0_32z, celloutsig_0_14z, celloutsig_0_18z, celloutsig_0_22z };
  assign _09_[21] = _02_;
  assign _10_[0] = _04_;
  assign { _11_[15], _11_[13], _11_[9:3] } = { _06_, _05_, celloutsig_0_42z[9], _03_, _07_[8:4] };
  assign _12_[4:0] = { _08_[28:27], _00_, _08_[25:24] };
  assign { out_data[128], out_data[96], out_data[32], out_data[30:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_96z, celloutsig_0_97z };
endmodule
