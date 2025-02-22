/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [7:0] _01_;
  reg [6:0] _02_;
  reg [5:0] _03_;
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [9:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [11:0] celloutsig_0_14z;
  wire [5:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [3:0] celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  wire [3:0] celloutsig_0_21z;
  wire [4:0] celloutsig_0_22z;
  wire [10:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [13:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [3:0] celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire [25:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [2:0] celloutsig_0_36z;
  wire [5:0] celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire [5:0] celloutsig_0_41z;
  wire [4:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire [6:0] celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire [2:0] celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire [22:0] celloutsig_0_53z;
  wire celloutsig_0_55z;
  wire [3:0] celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [8:0] celloutsig_0_61z;
  wire [8:0] celloutsig_0_62z;
  wire celloutsig_0_63z;
  wire celloutsig_0_64z;
  wire [2:0] celloutsig_0_68z;
  wire celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire celloutsig_0_76z;
  wire celloutsig_0_77z;
  wire [3:0] celloutsig_0_7z;
  wire [8:0] celloutsig_0_80z;
  wire celloutsig_0_84z;
  wire celloutsig_0_85z;
  wire [25:0] celloutsig_0_87z;
  wire celloutsig_0_8z;
  wire celloutsig_0_95z;
  wire [15:0] celloutsig_0_96z;
  wire [6:0] celloutsig_0_9z;
  wire [28:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [4:0] celloutsig_1_16z;
  wire [15:0] celloutsig_1_17z;
  wire [6:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [9:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [12:0] celloutsig_1_6z;
  wire [13:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_43z = ~(celloutsig_0_15z[0] & celloutsig_0_19z[2]);
  assign celloutsig_0_52z = ~(celloutsig_0_1z[1] & celloutsig_0_9z[3]);
  assign celloutsig_0_28z = ~(celloutsig_0_19z[3] & celloutsig_0_21z[1]);
  assign celloutsig_0_6z = !(celloutsig_0_3z ? in_data[33] : celloutsig_0_4z[1]);
  assign celloutsig_1_4z = !(celloutsig_1_0z[13] ? celloutsig_1_3z : celloutsig_1_1z);
  assign celloutsig_1_10z = !(celloutsig_1_1z ? celloutsig_1_6z[8] : celloutsig_1_2z[8]);
  assign celloutsig_1_19z = !(celloutsig_1_18z[5] ? celloutsig_1_2z[9] : celloutsig_1_12z);
  assign celloutsig_0_76z = ~((celloutsig_0_42z[2] | celloutsig_0_52z) & celloutsig_0_60z);
  assign celloutsig_1_1z = ~((in_data[181] | celloutsig_1_0z[26]) & celloutsig_1_0z[12]);
  assign celloutsig_1_12z = ~((celloutsig_1_2z[5] | celloutsig_1_2z[3]) & celloutsig_1_1z);
  assign celloutsig_0_17z = ~((celloutsig_0_10z | celloutsig_0_2z) & celloutsig_0_16z);
  assign celloutsig_0_24z = ~((celloutsig_0_21z[1] | celloutsig_0_16z) & celloutsig_0_22z[3]);
  assign celloutsig_0_46z = ~((celloutsig_0_35z | celloutsig_0_25z) & (celloutsig_0_45z[0] | celloutsig_0_36z[0]));
  assign celloutsig_0_47z = ~((celloutsig_0_33z | celloutsig_0_21z[0]) & (celloutsig_0_36z[0] | celloutsig_0_3z));
  assign celloutsig_0_84z = ~((celloutsig_0_15z[5] | celloutsig_0_27z) & (celloutsig_0_36z[0] | celloutsig_0_76z));
  assign celloutsig_0_10z = ~((in_data[69] | celloutsig_0_2z) & (celloutsig_0_6z | celloutsig_0_6z));
  assign celloutsig_0_18z = ~((celloutsig_0_8z | celloutsig_0_0z[3]) & (celloutsig_0_6z | celloutsig_0_16z));
  assign celloutsig_0_30z = ~((celloutsig_0_5z | celloutsig_0_11z[2]) & (celloutsig_0_29z[0] | celloutsig_0_21z[0]));
  assign celloutsig_0_55z = celloutsig_0_5z ^ _00_;
  assign celloutsig_1_5z = celloutsig_1_1z ^ celloutsig_1_2z[8];
  reg [7:0] _24_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _24_ <= 8'h00;
    else _24_ <= { celloutsig_0_34z[13:11], celloutsig_0_7z, celloutsig_0_26z };
  assign { _01_[7], _00_, _01_[5:0] } = _24_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[0])
    if (clkin_data[0]) _02_ <= 7'h00;
    else _02_ <= { celloutsig_0_22z[1:0], celloutsig_0_0z, celloutsig_0_8z };
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _03_ <= 6'h00;
    else _03_ <= celloutsig_0_23z[7:2];
  assign celloutsig_0_0z = in_data[27:24] & in_data[24:21];
  assign celloutsig_0_87z = { celloutsig_0_85z, celloutsig_0_16z, celloutsig_0_43z, celloutsig_0_2z, celloutsig_0_38z, celloutsig_0_46z, celloutsig_0_60z, celloutsig_0_23z[10:1], celloutsig_0_23z[6], celloutsig_0_68z } & { celloutsig_0_53z[16:8], celloutsig_0_26z, celloutsig_0_10z, celloutsig_0_52z, celloutsig_0_21z, celloutsig_0_13z, celloutsig_0_77z, celloutsig_0_30z, celloutsig_0_9z[6:1], celloutsig_0_9z[1] };
  assign celloutsig_0_11z = { celloutsig_0_9z[6:4], celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_7z } & { celloutsig_0_9z[6:2], celloutsig_0_8z, celloutsig_0_7z };
  assign celloutsig_0_1z = celloutsig_0_0z[3:1] & in_data[45:43];
  assign celloutsig_0_36z = { celloutsig_0_9z[2:1], celloutsig_0_3z } / { 1'h1, celloutsig_0_2z, celloutsig_0_27z };
  assign celloutsig_0_19z = celloutsig_0_0z / { 1'h1, celloutsig_0_16z, celloutsig_0_18z, celloutsig_0_6z };
  assign celloutsig_0_29z = { celloutsig_0_22z[4], celloutsig_0_12z, celloutsig_0_15z, celloutsig_0_22z, celloutsig_0_5z } / { 1'h1, celloutsig_0_23z[7:5], celloutsig_0_10z, celloutsig_0_9z[6:1], celloutsig_0_9z[1], celloutsig_0_24z, celloutsig_0_13z };
  assign celloutsig_1_7z = { celloutsig_1_6z, celloutsig_1_3z } / { 1'h1, in_data[131:119] };
  assign celloutsig_0_14z = { in_data[42:35], celloutsig_0_0z } / { 1'h1, celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_9z[6:1], celloutsig_0_9z[1] };
  assign celloutsig_0_20z = { celloutsig_0_14z[8], celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_3z } / { 1'h1, in_data[11:9] };
  assign celloutsig_0_22z = { celloutsig_0_15z[3:0], celloutsig_0_12z } / { 1'h1, celloutsig_0_0z[2:0], celloutsig_0_6z };
  assign celloutsig_0_35z = celloutsig_0_0z[3:1] <= celloutsig_0_23z[3:1];
  assign celloutsig_1_9z = { celloutsig_1_2z[8:3], celloutsig_1_4z } <= { celloutsig_1_0z[15:11], celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_1_14z = { celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_13z, celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_11z, celloutsig_1_13z } <= { celloutsig_1_6z[12:9], celloutsig_1_2z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_5z };
  assign celloutsig_0_85z = celloutsig_0_41z[3:0] || { celloutsig_0_80z[3:2], celloutsig_0_84z, celloutsig_0_25z };
  assign celloutsig_1_13z = { celloutsig_1_6z[8:1], celloutsig_1_11z, celloutsig_1_12z } || { celloutsig_1_7z[12:6], celloutsig_1_5z, celloutsig_1_10z, celloutsig_1_12z };
  assign celloutsig_0_13z = { celloutsig_0_9z[6:1], celloutsig_0_9z[1], celloutsig_0_11z } || { celloutsig_0_4z[0], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_51z = { celloutsig_0_15z[4:2], celloutsig_0_26z, celloutsig_0_17z } < { celloutsig_0_7z, celloutsig_0_6z };
  assign celloutsig_0_95z = { celloutsig_0_87z[3], _02_, celloutsig_0_69z, celloutsig_0_47z, celloutsig_0_31z } < { celloutsig_0_52z, celloutsig_0_61z, celloutsig_0_7z };
  assign celloutsig_0_44z = celloutsig_0_18z & ~(celloutsig_0_18z);
  assign celloutsig_0_5z = celloutsig_0_2z & ~(celloutsig_0_2z);
  assign celloutsig_0_49z = celloutsig_0_16z & ~(celloutsig_0_1z[2]);
  assign celloutsig_0_64z = celloutsig_0_58z[0] & ~(celloutsig_0_60z);
  assign celloutsig_0_77z = celloutsig_0_62z[3] & ~(celloutsig_0_58z[2]);
  assign celloutsig_0_12z = celloutsig_0_1z[0] & ~(celloutsig_0_11z[7]);
  assign celloutsig_0_2z = celloutsig_0_1z[0] & ~(celloutsig_0_0z[1]);
  assign celloutsig_0_38z = { _01_[7], _00_, _01_[5:2] } % { 1'h1, celloutsig_0_22z };
  assign celloutsig_0_41z = { celloutsig_0_33z, celloutsig_0_4z, celloutsig_0_17z, celloutsig_0_6z } % { 1'h1, celloutsig_0_15z[2:1], celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_2z };
  assign celloutsig_0_53z = { celloutsig_0_34z[21:1], 1'h1, celloutsig_0_35z } % { 1'h1, celloutsig_0_22z[2:0], celloutsig_0_36z, celloutsig_0_38z, celloutsig_0_11z };
  assign celloutsig_0_62z = { celloutsig_0_20z[3:2], celloutsig_0_45z } % { 1'h1, celloutsig_0_33z, _02_ };
  assign celloutsig_0_7z = { in_data[60:59], celloutsig_0_6z, celloutsig_0_3z } % { 1'h1, in_data[17:15] };
  assign celloutsig_1_6z = in_data[191:179] % { 1'h1, in_data[146:136], celloutsig_1_4z };
  assign celloutsig_0_68z = celloutsig_0_64z ? { celloutsig_0_49z, celloutsig_0_46z, celloutsig_0_44z } : celloutsig_0_53z[15:13];
  assign celloutsig_0_21z = celloutsig_0_17z ? celloutsig_0_0z : { celloutsig_0_10z, 2'h0, celloutsig_0_16z };
  assign celloutsig_0_33z = { celloutsig_0_2z, celloutsig_0_11z } !== celloutsig_0_29z[13:3];
  assign celloutsig_1_8z = celloutsig_1_0z[16:1] !== { celloutsig_1_0z[11], celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_5z };
  assign celloutsig_1_15z = { celloutsig_1_2z[7:1], celloutsig_1_10z, celloutsig_1_12z } !== celloutsig_1_2z[8:0];
  assign celloutsig_0_25z = { celloutsig_0_7z, celloutsig_0_8z } !== celloutsig_0_11z[7:3];
  assign celloutsig_0_26z = in_data[42:31] !== { celloutsig_0_1z[0], celloutsig_0_10z, celloutsig_0_18z, celloutsig_0_25z, celloutsig_0_22z, celloutsig_0_1z };
  assign celloutsig_0_27z = celloutsig_0_11z[7:5] !== celloutsig_0_23z[6:4];
  assign celloutsig_0_4z = ~ celloutsig_0_1z;
  assign celloutsig_0_42z = ~ celloutsig_0_41z[4:0];
  assign celloutsig_0_45z = ~ in_data[10:4];
  assign celloutsig_0_58z = ~ { celloutsig_0_1z[2:1], celloutsig_0_3z, celloutsig_0_18z };
  assign celloutsig_0_61z = ~ { _02_, celloutsig_0_28z, celloutsig_0_27z };
  assign celloutsig_0_80z = ~ { celloutsig_0_42z, celloutsig_0_68z, celloutsig_0_63z };
  assign celloutsig_0_96z = ~ { _03_[5:3], celloutsig_0_14z, celloutsig_0_77z };
  assign celloutsig_1_0z = ~ in_data[183:155];
  assign celloutsig_1_2z = ~ in_data[167:158];
  assign celloutsig_1_16z = ~ { celloutsig_1_6z[7:5], celloutsig_1_4z, celloutsig_1_10z };
  assign celloutsig_0_15z = ~ celloutsig_0_14z[8:3];
  assign celloutsig_0_31z = ~ celloutsig_0_29z[6:3];
  assign celloutsig_0_3z = & in_data[50:41];
  assign celloutsig_0_60z = & { celloutsig_0_55z, celloutsig_0_52z, celloutsig_0_51z, celloutsig_0_43z, celloutsig_0_23z[10:3] };
  assign celloutsig_0_63z = & celloutsig_0_7z[2:0];
  assign celloutsig_0_69z = & { celloutsig_0_51z, celloutsig_0_26z, celloutsig_0_20z[3:1] };
  assign celloutsig_0_8z = & in_data[50:44];
  assign celloutsig_1_3z = & celloutsig_1_2z[7:5];
  assign celloutsig_1_11z = & { celloutsig_1_9z, celloutsig_1_4z, celloutsig_1_2z[7:5], celloutsig_1_0z[25:23] };
  assign celloutsig_0_16z = & in_data[53:50];
  assign celloutsig_1_17z = { celloutsig_1_2z[9:1], celloutsig_1_10z, celloutsig_1_16z, celloutsig_1_12z } ~^ { in_data[163:159], celloutsig_1_8z, celloutsig_1_14z, celloutsig_1_14z, celloutsig_1_5z, celloutsig_1_16z, celloutsig_1_5z, celloutsig_1_15z };
  assign celloutsig_1_18z = { celloutsig_1_0z[14:9], celloutsig_1_9z } ~^ celloutsig_1_17z[6:0];
  assign { celloutsig_0_9z[1], celloutsig_0_9z[6:2] } = ~ { celloutsig_0_5z, in_data[81:77] };
  assign { celloutsig_0_23z[4:1], celloutsig_0_23z[6:5], celloutsig_0_23z[10:7] } = ~ { celloutsig_0_21z, celloutsig_0_16z, celloutsig_0_12z, celloutsig_0_9z[5:2] };
  assign { celloutsig_0_34z[15:2], celloutsig_0_34z[22], celloutsig_0_34z[25:23], celloutsig_0_34z[1], celloutsig_0_34z[21:16] } = { celloutsig_0_29z, celloutsig_0_18z, celloutsig_0_14z[10:8], celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_0z } ~^ { in_data[34:27], celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_24z, celloutsig_0_0z[3:1], in_data[41], in_data[44:42], celloutsig_0_0z[0], in_data[40:35] };
  assign _01_[6] = _00_;
  assign celloutsig_0_23z[0] = celloutsig_0_23z[6];
  assign celloutsig_0_34z[0] = 1'h1;
  assign celloutsig_0_9z[0] = celloutsig_0_9z[1];
  assign { out_data[134:128], out_data[96], out_data[32], out_data[15:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_95z, celloutsig_0_96z };
endmodule
