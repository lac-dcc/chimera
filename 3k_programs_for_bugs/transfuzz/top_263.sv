/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [25:0] _02_;
  wire [12:0] _03_;
  reg [26:0] _04_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [4:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [2:0] celloutsig_0_19z;
  wire [12:0] celloutsig_0_1z;
  wire [2:0] celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire [4:0] celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire [12:0] celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire [12:0] celloutsig_0_4z;
  wire celloutsig_0_52z;
  wire [13:0] celloutsig_0_54z;
  wire [11:0] celloutsig_0_55z;
  wire celloutsig_0_57z;
  wire celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire celloutsig_0_61z;
  wire celloutsig_0_63z;
  wire celloutsig_0_66z;
  wire celloutsig_0_68z;
  wire celloutsig_0_6z;
  wire [8:0] celloutsig_0_73z;
  wire [3:0] celloutsig_0_7z;
  wire [15:0] celloutsig_0_80z;
  wire celloutsig_0_82z;
  wire celloutsig_0_88z;
  wire celloutsig_0_8z;
  wire celloutsig_0_90z;
  wire celloutsig_0_91z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [35:0] celloutsig_1_13z;
  wire [31:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [3:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [12:0] celloutsig_1_18z;
  wire [16:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [25:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [4:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_15z = celloutsig_0_11z ? celloutsig_0_1z[5] : celloutsig_0_14z[3];
  assign celloutsig_0_24z = celloutsig_0_0z ? celloutsig_0_12z : celloutsig_0_13z;
  assign celloutsig_0_41z = ~(celloutsig_0_25z & celloutsig_0_4z[4]);
  assign celloutsig_0_61z = ~(celloutsig_0_2z & celloutsig_0_22z);
  assign celloutsig_1_4z = ~(celloutsig_1_0z & celloutsig_1_0z);
  assign celloutsig_1_8z = ~(celloutsig_1_2z[1] & celloutsig_1_6z);
  assign celloutsig_0_13z = ~(celloutsig_0_1z[6] & celloutsig_0_5z);
  assign celloutsig_0_2z = ~(in_data[66] & celloutsig_0_1z[3]);
  assign celloutsig_0_48z = !(celloutsig_0_24z ? celloutsig_0_31z : celloutsig_0_31z);
  assign celloutsig_0_17z = !(celloutsig_0_4z[2] ? celloutsig_0_4z[8] : celloutsig_0_8z);
  assign celloutsig_0_10z = ~celloutsig_0_1z[8];
  assign celloutsig_0_16z = ~in_data[95];
  assign celloutsig_0_38z = in_data[6] | ~(celloutsig_0_24z);
  assign celloutsig_0_12z = celloutsig_0_7z[2] | ~(celloutsig_0_7z[2]);
  assign celloutsig_0_3z = celloutsig_0_2z | in_data[33];
  assign celloutsig_0_5z = celloutsig_0_2z | celloutsig_0_4z[0];
  assign celloutsig_0_88z = celloutsig_0_66z | celloutsig_0_63z;
  assign celloutsig_1_11z = celloutsig_1_9z[1] | celloutsig_1_2z[24];
  assign celloutsig_0_30z = celloutsig_0_0z ^ celloutsig_0_1z[12];
  reg [25:0] _24_;
  always_ff @(negedge celloutsig_1_18z[0], negedge clkin_data[0])
    if (!clkin_data[0]) _24_ <= 26'h0000000;
    else _24_ <= in_data[27:2];
  assign { _02_[25:12], _00_, _02_[10:0] } = _24_;
  reg [12:0] _25_;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[0])
    if (clkin_data[0]) _25_ <= 13'h0000;
    else _25_ <= celloutsig_0_1z;
  assign { _03_[12], _01_, _03_[10:0] } = _25_;
  always_ff @(posedge celloutsig_1_18z[0], posedge clkin_data[0])
    if (clkin_data[0]) _04_ <= 27'h0000000;
    else _04_ <= { celloutsig_0_1z[12:2], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_20z, celloutsig_0_5z, celloutsig_0_15z, celloutsig_0_13z, celloutsig_0_14z };
  assign celloutsig_0_54z = { celloutsig_0_52z, celloutsig_0_1z } & { celloutsig_0_4z[12:2], celloutsig_0_30z, celloutsig_0_11z, celloutsig_0_9z };
  assign celloutsig_0_73z = { celloutsig_0_38z, celloutsig_0_34z, celloutsig_0_24z, celloutsig_0_45z, celloutsig_0_0z, celloutsig_0_12z, celloutsig_0_41z, celloutsig_0_60z, celloutsig_0_63z } & celloutsig_0_54z[13:5];
  assign celloutsig_1_2z = { in_data[155:133], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z } & in_data[154:129];
  assign celloutsig_1_12z = celloutsig_1_2z[4:2] == { celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_0_8z = in_data[64:62] === celloutsig_0_1z[4:2];
  assign celloutsig_0_9z = { celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_6z } === { in_data[21:20], celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_0_22z = { celloutsig_0_4z[8], celloutsig_0_19z } === { celloutsig_0_7z[1:0], celloutsig_0_13z, celloutsig_0_6z };
  assign celloutsig_0_26z = { celloutsig_0_14z, celloutsig_0_24z, celloutsig_0_1z } === { _04_[23:15], celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_17z, celloutsig_0_17z };
  assign celloutsig_0_36z = ! _04_[22:16];
  assign celloutsig_0_90z = ! { celloutsig_0_46z[4:1], celloutsig_0_73z, celloutsig_0_88z, celloutsig_0_10z };
  assign celloutsig_1_7z = ! in_data[120:110];
  assign celloutsig_0_43z = { celloutsig_0_4z[3:1], celloutsig_0_9z, celloutsig_0_36z } % { 1'h1, celloutsig_0_7z[1:0], celloutsig_0_17z, celloutsig_0_12z };
  assign celloutsig_0_80z = { _02_[18:12], _00_, _02_[10:3] } % { 1'h1, celloutsig_0_46z[11:1], celloutsig_0_13z, celloutsig_0_22z, celloutsig_0_6z, celloutsig_0_57z };
  assign celloutsig_1_18z = { in_data[142:138], celloutsig_1_17z, celloutsig_1_15z, celloutsig_1_7z, celloutsig_1_16z[3:1], 1'h1, celloutsig_1_12z } % { 1'h1, celloutsig_1_17z, celloutsig_1_9z, celloutsig_1_17z, celloutsig_1_17z, celloutsig_1_16z[3:1], 1'h1 };
  assign celloutsig_0_55z = - celloutsig_0_4z[11:0];
  assign celloutsig_0_7z = - { celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_3z };
  assign celloutsig_0_1z = - { in_data[81:70], celloutsig_0_0z };
  assign celloutsig_0_31z = | in_data[73:64];
  assign celloutsig_0_57z = | celloutsig_0_55z[8:2];
  assign celloutsig_0_25z = | { celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_16z };
  assign celloutsig_0_34z = celloutsig_0_33z & celloutsig_0_24z;
  assign celloutsig_1_10z = celloutsig_1_9z[2:0] >> { celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_8z };
  assign celloutsig_1_14z = celloutsig_1_13z[34:3] >> { celloutsig_1_7z, celloutsig_1_11z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_14z = { celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_6z } >> { celloutsig_0_7z[3:2], celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_8z };
  assign celloutsig_0_20z = { celloutsig_0_4z[0], celloutsig_0_17z, celloutsig_0_17z } >> in_data[93:91];
  assign celloutsig_0_4z = celloutsig_0_1z - { celloutsig_0_1z[11:0], celloutsig_0_2z };
  assign celloutsig_1_9z = { celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_7z } - { in_data[183:180], celloutsig_1_8z };
  assign celloutsig_1_19z = { celloutsig_1_15z, celloutsig_1_12z, celloutsig_1_16z[3:1], 1'h1, celloutsig_1_11z, celloutsig_1_16z[3:1], 1'h1, celloutsig_1_6z, celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_11z } - { celloutsig_1_18z[11], celloutsig_1_18z, celloutsig_1_10z };
  assign celloutsig_0_46z = { _04_[16:5], celloutsig_0_13z } ~^ celloutsig_0_4z;
  assign celloutsig_1_13z = { in_data[127:104], celloutsig_1_8z, celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_12z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_6z } ~^ { in_data[142:133], celloutsig_1_2z };
  assign celloutsig_0_19z = { in_data[24:23], celloutsig_0_2z } ~^ { celloutsig_0_1z[6:5], celloutsig_0_0z };
  assign celloutsig_0_0z = ~((in_data[30] & in_data[23]) | (in_data[61] & in_data[50]));
  assign celloutsig_0_29z = ~((celloutsig_0_10z & celloutsig_0_14z[1]) | (celloutsig_0_3z & celloutsig_0_2z));
  assign celloutsig_0_33z = ~((_04_[1] & celloutsig_0_29z) | (celloutsig_0_3z & celloutsig_0_16z));
  assign celloutsig_0_37z = ~((celloutsig_0_2z & celloutsig_0_27z) | (celloutsig_0_24z & celloutsig_0_5z));
  assign celloutsig_0_45z = ~((celloutsig_0_24z & celloutsig_0_19z[1]) | (celloutsig_0_28z & celloutsig_0_0z));
  assign celloutsig_0_52z = ~((in_data[35] & celloutsig_0_30z) | (celloutsig_0_11z & celloutsig_0_45z));
  assign celloutsig_0_6z = ~((celloutsig_0_2z & celloutsig_0_4z[1]) | (celloutsig_0_3z & celloutsig_0_1z[2]));
  assign celloutsig_0_60z = ~((celloutsig_0_55z[3] & celloutsig_0_14z[1]) | (celloutsig_0_38z & celloutsig_0_26z));
  assign celloutsig_0_63z = ~((celloutsig_0_31z & celloutsig_0_37z) | (celloutsig_0_43z[0] & celloutsig_0_28z));
  assign celloutsig_0_66z = ~((celloutsig_0_60z & celloutsig_0_2z) | (celloutsig_0_52z & celloutsig_0_61z));
  assign celloutsig_0_68z = ~((celloutsig_0_5z & celloutsig_0_48z) | (celloutsig_0_6z & celloutsig_0_24z));
  assign celloutsig_0_82z = ~((_03_[2] & celloutsig_0_54z[12]) | (celloutsig_0_80z[14] & celloutsig_0_10z));
  assign celloutsig_0_91z = ~((celloutsig_0_34z & celloutsig_0_82z) | (celloutsig_0_68z & celloutsig_0_19z[1]));
  assign celloutsig_1_0z = ~((in_data[188] & in_data[126]) | (in_data[131] & in_data[140]));
  assign celloutsig_1_1z = ~((in_data[116] & celloutsig_1_0z) | (in_data[140] & celloutsig_1_0z));
  assign celloutsig_1_3z = ~((celloutsig_1_2z[14] & celloutsig_1_1z) | (celloutsig_1_2z[5] & celloutsig_1_0z));
  assign celloutsig_1_5z = ~((celloutsig_1_4z & celloutsig_1_4z) | (celloutsig_1_4z & celloutsig_1_2z[6]));
  assign celloutsig_0_11z = ~((celloutsig_0_7z[3] & celloutsig_0_10z) | (celloutsig_0_8z & celloutsig_0_3z));
  assign celloutsig_1_6z = ~((in_data[188] & celloutsig_1_4z) | (celloutsig_1_0z & celloutsig_1_1z));
  assign celloutsig_1_15z = ~((celloutsig_1_12z & celloutsig_1_12z) | (celloutsig_1_2z[14] & celloutsig_1_14z[1]));
  assign celloutsig_1_17z = ~((celloutsig_1_9z[4] & celloutsig_1_10z[1]) | (in_data[116] & celloutsig_1_12z));
  assign celloutsig_0_27z = ~((celloutsig_0_20z[0] & celloutsig_0_9z) | (_04_[17] & celloutsig_0_15z));
  assign celloutsig_0_28z = ~((celloutsig_0_12z & celloutsig_0_13z) | (celloutsig_0_4z[4] & celloutsig_0_16z));
  assign celloutsig_1_16z[3:1] = in_data[112:110] ~^ celloutsig_1_13z[23:21];
  assign _02_[11] = _00_;
  assign _03_[11] = _01_;
  assign celloutsig_1_16z[0] = 1'h1;
  assign { out_data[140:128], out_data[112:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_90z, celloutsig_0_91z };
endmodule
