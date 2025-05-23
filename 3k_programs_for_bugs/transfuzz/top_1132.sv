/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [8:0] _03_;
  wire [2:0] _04_;
  wire [5:0] _05_;
  wire [5:0] _06_;
  wire [5:0] _07_;
  wire [25:0] _08_;
  wire [8:0] _09_;
  reg [2:0] _10_;
  wire [7:0] _11_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [25:0] celloutsig_0_14z;
  wire [5:0] celloutsig_0_15z;
  wire [4:0] celloutsig_0_16z;
  wire [8:0] celloutsig_0_17z;
  wire [12:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [21:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [3:0] celloutsig_0_26z;
  wire [13:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [12:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [18:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [9:0] celloutsig_0_36z;
  wire [4:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_40z;
  wire [2:0] celloutsig_0_41z;
  wire [10:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire [11:0] celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire [2:0] celloutsig_0_4z;
  wire [20:0] celloutsig_0_50z;
  wire [6:0] celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire [8:0] celloutsig_0_57z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [3:0] celloutsig_0_62z;
  wire [5:0] celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire celloutsig_0_74z;
  wire celloutsig_0_7z;
  wire celloutsig_0_80z;
  wire [10:0] celloutsig_0_83z;
  wire celloutsig_0_8z;
  wire [9:0] celloutsig_0_92z;
  wire celloutsig_0_93z;
  wire [15:0] celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire [4:0] celloutsig_1_11z;
  wire [3:0] celloutsig_1_15z;
  wire [6:0] celloutsig_1_16z;
  wire celloutsig_1_19z;
  wire [4:0] celloutsig_1_1z;
  wire [5:0] celloutsig_1_2z;
  wire [14:0] celloutsig_1_3z;
  wire [3:0] celloutsig_1_4z;
  wire [10:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_43z = ~((celloutsig_0_22z[5] | celloutsig_0_15z[3]) & _01_);
  assign celloutsig_0_7z = ~((in_data[46] | in_data[3]) & celloutsig_0_6z);
  assign celloutsig_0_1z = ~((in_data[38] | in_data[50]) & in_data[45]);
  assign celloutsig_0_13z = ~((celloutsig_0_10z | celloutsig_0_1z) & celloutsig_0_8z);
  assign celloutsig_0_23z = ~((celloutsig_0_16z[1] | celloutsig_0_21z) & celloutsig_0_11z);
  assign celloutsig_0_0z = in_data[0] | ~(in_data[48]);
  assign celloutsig_0_74z = celloutsig_0_45z | ~(celloutsig_0_23z);
  assign celloutsig_0_8z = celloutsig_0_2z | ~(celloutsig_0_2z);
  assign celloutsig_0_93z = celloutsig_0_83z[5] | ~(_02_);
  assign celloutsig_0_19z = celloutsig_0_2z | ~(celloutsig_0_11z);
  assign celloutsig_0_21z = celloutsig_0_6z | ~(celloutsig_0_13z);
  assign celloutsig_0_24z = celloutsig_0_21z | ~(celloutsig_0_4z[2]);
  assign celloutsig_0_36z = { celloutsig_0_14z[20:13], celloutsig_0_11z, celloutsig_0_19z } + { celloutsig_0_23z, celloutsig_0_12z, celloutsig_0_20z, celloutsig_0_2z, celloutsig_0_24z };
  assign celloutsig_0_4z = { in_data[79:78], celloutsig_0_0z } + { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_57z = celloutsig_0_50z[17:9] + { _03_[8:7], celloutsig_0_31z, celloutsig_0_38z, celloutsig_0_31z };
  assign celloutsig_0_69z = { celloutsig_0_45z, celloutsig_0_59z, celloutsig_0_52z, celloutsig_0_4z } + celloutsig_0_15z;
  assign celloutsig_0_92z = { celloutsig_0_62z[2:1], celloutsig_0_55z, celloutsig_0_69z, celloutsig_0_44z } + { celloutsig_0_51z[4:3], celloutsig_0_80z, _06_[5:4], _01_, _06_[2:0], celloutsig_0_43z };
  assign celloutsig_1_3z = { in_data[126:117], celloutsig_1_1z } + in_data[165:151];
  assign celloutsig_1_5z = { celloutsig_1_3z[9:4], celloutsig_1_1z } + { celloutsig_1_3z[14:11], celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_0_14z = { celloutsig_0_12z[3:0], _07_[5:4], _02_, _07_[2:0], _08_[15:4], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_11z } + { in_data[85:61], celloutsig_0_0z };
  assign celloutsig_0_18z = { celloutsig_0_14z[16:6], celloutsig_0_6z, celloutsig_0_5z } + { _02_, _07_[2:0], _08_[15:11], celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_8z };
  reg [17:0] _33_;
  always_ff @(negedge celloutsig_1_19z, posedge clkin_data[96])
    if (clkin_data[96]) _33_ <= 18'h00000;
    else _33_ <= in_data[21:4];
  assign { _07_[5:4], _02_, _07_[2:0], _08_[15:4] } = _33_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _10_ <= 3'h0;
    else _10_ <= { celloutsig_0_4z[0], celloutsig_0_52z, celloutsig_0_21z };
  reg [7:0] _35_;
  always_ff @(posedge clkin_data[32], posedge clkin_data[128])
    if (clkin_data[128]) _35_ <= 8'h00;
    else _35_ <= { celloutsig_1_8z[1], celloutsig_1_16z };
  assign out_data[135:128] = _35_;
  reg [7:0] _36_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[96])
    if (!clkin_data[96]) _36_ <= 8'h00;
    else _36_ <= { celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_13z };
  assign { _05_[5:2], _04_[2:1], _11_[1:0] } = _36_;
  reg [5:0] _37_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _37_ <= 6'h00;
    else _37_ <= { celloutsig_0_7z, celloutsig_0_23z, celloutsig_0_4z, celloutsig_0_8z };
  assign { _06_[5:4], _01_, _06_[2:0] } = _37_;
  reg [8:0] _38_;
  always_ff @(negedge celloutsig_1_19z, negedge clkin_data[64])
    if (!clkin_data[64]) _38_ <= 9'h000;
    else _38_ <= { celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_20z, _06_[5:4], _01_, _06_[2:0] };
  assign { _09_[8], _00_, _09_[6:4], _03_[8:7], _09_[1:0] } = _38_;
  assign celloutsig_0_31z = { celloutsig_0_16z[4:1], celloutsig_0_7z, celloutsig_0_4z } == celloutsig_0_18z[8:1];
  assign celloutsig_0_34z = { _04_[1], _11_[1:0], _06_[5:4], _01_, _06_[2:0] } == { _09_[1:0], celloutsig_0_15z, celloutsig_0_8z };
  assign celloutsig_0_55z = celloutsig_0_50z[14:3] == { celloutsig_0_22z[14:5], celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_6z = { _02_, _07_[2] } == celloutsig_0_4z[1:0];
  assign celloutsig_1_6z = celloutsig_1_1z[4:1] == celloutsig_1_4z;
  assign celloutsig_0_10z = in_data[45:34] == { _08_[13:7], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_4z };
  assign celloutsig_0_20z = celloutsig_0_12z[3:1] == { celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_6z };
  assign celloutsig_0_44z = { in_data[95:79], celloutsig_0_34z, celloutsig_0_12z, celloutsig_0_7z } === { celloutsig_0_32z[16:0], _05_[5:2], _04_[2:1], _11_[1:0] };
  assign celloutsig_0_2z = in_data[19:13] === { in_data[5:3], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_45z = { celloutsig_0_12z[4:1], celloutsig_0_34z } <= { _08_[8], celloutsig_0_21z, celloutsig_0_4z };
  assign celloutsig_0_52z = { celloutsig_0_12z, celloutsig_0_40z } <= { celloutsig_0_51z[4:0], celloutsig_0_48z, celloutsig_0_33z };
  assign celloutsig_1_19z = { celloutsig_1_3z[12:2], celloutsig_1_16z, celloutsig_1_9z, celloutsig_1_1z } <= { in_data[163:149], celloutsig_1_11z, celloutsig_1_15z };
  assign celloutsig_0_62z = { _09_[4], _03_[8:7], _09_[1] } % { 1'h1, celloutsig_0_38z[2], celloutsig_0_39z, celloutsig_0_44z };
  assign celloutsig_1_2z = in_data[140:135] % { 1'h1, celloutsig_1_1z };
  assign celloutsig_1_4z = celloutsig_1_1z[4:1] % { 1'h1, celloutsig_1_3z[5:3] };
  assign celloutsig_0_9z = { _08_[7:4], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_5z } % { 1'h1, in_data[38:30], celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_1_16z = in_data[178:172] % { 1'h1, in_data[171:166] };
  assign celloutsig_0_12z = { _07_[5], celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_0z } % { 1'h1, _08_[9:5] };
  assign celloutsig_0_16z = { celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_13z } % { 1'h1, celloutsig_0_12z[4:1] };
  assign celloutsig_0_46z = { celloutsig_0_30z[8:3], celloutsig_0_12z } % { 1'h1, celloutsig_0_32z[8:0], celloutsig_0_21z, celloutsig_0_0z };
  assign celloutsig_1_1z = in_data[168:164] % { 1'h1, in_data[118], celloutsig_1_0z };
  assign celloutsig_0_17z = in_data[33:25] % { 1'h1, celloutsig_0_9z[7:2], celloutsig_0_7z, celloutsig_0_8z };
  assign celloutsig_0_22z = { celloutsig_0_14z[2:1], celloutsig_0_17z, celloutsig_0_19z, celloutsig_0_10z, celloutsig_0_17z } % { 1'h1, celloutsig_0_17z[4:2], _07_[5:4], _02_, _07_[2:0], _08_[15:4] };
  assign celloutsig_0_33z = { celloutsig_0_17z[6:5], celloutsig_0_1z, celloutsig_0_21z } !== { celloutsig_0_30z[10:8], celloutsig_0_5z };
  assign celloutsig_0_35z = { celloutsig_0_15z[5:4], celloutsig_0_6z } !== celloutsig_0_12z[3:1];
  assign celloutsig_0_39z = { celloutsig_0_4z[2:1], celloutsig_0_0z, celloutsig_0_38z } !== { celloutsig_0_32z[15:9], celloutsig_0_23z };
  assign celloutsig_0_48z = { celloutsig_0_32z[13:12], celloutsig_0_1z } !== celloutsig_0_14z[19:17];
  assign celloutsig_0_60z = { _08_[14], celloutsig_0_14z, celloutsig_0_7z } !== { celloutsig_0_32z[15:1], celloutsig_0_4z, _09_[8], _00_, _09_[6:4], _03_[8:7], _09_[1:0], celloutsig_0_5z };
  assign celloutsig_1_9z = { celloutsig_1_5z[10:1], celloutsig_1_4z } !== { celloutsig_1_5z[8:6], celloutsig_1_5z };
  assign celloutsig_0_11z = { in_data[12:5], celloutsig_0_10z, celloutsig_0_2z } !== in_data[38:29];
  assign celloutsig_0_51z = { _08_[10], celloutsig_0_26z, celloutsig_0_1z, celloutsig_0_1z } << celloutsig_0_18z[6:0];
  assign celloutsig_0_83z = { celloutsig_0_17z[6:0], _10_, celloutsig_0_54z } << { celloutsig_0_46z[3:2], celloutsig_0_34z, celloutsig_0_74z, celloutsig_0_15z, celloutsig_0_60z };
  assign celloutsig_1_8z = celloutsig_1_4z[2:0] << { celloutsig_1_4z[2:1], celloutsig_1_6z };
  assign celloutsig_0_15z = { celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_11z } << { celloutsig_0_12z[5:2], celloutsig_0_7z, celloutsig_0_6z };
  assign celloutsig_0_26z = celloutsig_0_22z[14:11] << { celloutsig_0_14z[12:10], celloutsig_0_5z };
  assign celloutsig_0_38z = { _08_[8:5], celloutsig_0_31z } <<< { celloutsig_0_30z[4:1], celloutsig_0_35z };
  assign celloutsig_0_41z = celloutsig_0_36z[5:3] <<< celloutsig_0_38z[2:0];
  assign celloutsig_0_42z = { celloutsig_0_30z[8:0], celloutsig_0_33z, celloutsig_0_13z } <<< { celloutsig_0_36z[7], celloutsig_0_17z, celloutsig_0_33z };
  assign celloutsig_0_50z = in_data[62:42] <<< { celloutsig_0_22z[19:2], celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_21z };
  assign celloutsig_1_0z = in_data[152:150] <<< in_data[166:164];
  assign celloutsig_0_29z = { _03_[8:7], _09_[1:0], _05_[5:2], _04_[2:1], _11_[1:0], celloutsig_0_7z, celloutsig_0_5z } ^ { celloutsig_0_23z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_23z, celloutsig_0_16z, celloutsig_0_0z, celloutsig_0_21z, celloutsig_0_21z, celloutsig_0_24z, celloutsig_0_19z };
  assign celloutsig_0_30z = { _00_, _09_[6:4], _03_[8], celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_2z } ^ { _05_[2], _04_[2:1], _11_[1], celloutsig_0_17z };
  assign celloutsig_0_32z = { in_data[67:63], celloutsig_0_29z } ^ { celloutsig_0_29z[5:3], celloutsig_0_7z, _09_[8], _00_, _09_[6:4], _03_[8:7], _09_[1:0], celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_31z, celloutsig_0_21z };
  assign celloutsig_1_11z = { celloutsig_1_2z[4:3], celloutsig_1_8z } ^ { in_data[122:121], celloutsig_1_0z };
  assign celloutsig_1_15z = { celloutsig_1_5z[7:5], celloutsig_1_6z } ^ celloutsig_1_2z[3:0];
  assign celloutsig_0_40z = ~((celloutsig_0_35z & _09_[1]) | (celloutsig_0_4z[1] & celloutsig_0_19z));
  assign celloutsig_0_54z = ~((celloutsig_0_29z[9] & celloutsig_0_10z) | (celloutsig_0_50z[2] & celloutsig_0_41z[0]));
  assign celloutsig_0_5z = ~((in_data[42] & _08_[4]) | (celloutsig_0_4z[0] & celloutsig_0_2z));
  assign celloutsig_0_59z = ~((celloutsig_0_45z & celloutsig_0_18z[5]) | (celloutsig_0_42z[5] & celloutsig_0_4z[0]));
  assign celloutsig_0_80z = ~((celloutsig_0_44z & celloutsig_0_57z[4]) | (celloutsig_0_14z[3] & celloutsig_0_7z));
  assign _03_[6:0] = { celloutsig_0_31z, celloutsig_0_38z, celloutsig_0_31z };
  assign _04_[0] = celloutsig_0_34z;
  assign _05_[1:0] = { celloutsig_0_40z, celloutsig_0_43z };
  assign _06_[3] = _01_;
  assign _07_[3] = _02_;
  assign { _08_[25:16], _08_[3:0] } = { celloutsig_0_12z[3:0], _07_[5:4], _02_, _07_[2:0], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_11z };
  assign { _09_[7], _09_[3:2] } = { _00_, _03_[8:7] };
  assign _11_[7:2] = { _05_[5:2], _04_[2:1] };
  assign { out_data[96], out_data[41:32], out_data[0] } = { celloutsig_1_19z, celloutsig_0_92z, celloutsig_0_93z };
endmodule
