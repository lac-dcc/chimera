/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [3:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [4:0] celloutsig_0_17z;
  wire [9:0] celloutsig_0_18z;
  wire [2:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [2:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [5:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [11:0] celloutsig_0_24z;
  wire [4:0] celloutsig_0_25z;
  wire [7:0] celloutsig_0_26z;
  wire [6:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [9:0] celloutsig_0_29z;
  reg [2:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [6:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [7:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  reg [3:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  reg [6:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [2:0] celloutsig_0_42z;
  wire [21:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [25:0] celloutsig_0_48z;
  wire [15:0] celloutsig_0_4z;
  wire [16:0] celloutsig_0_50z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire [9:0] celloutsig_0_54z;
  wire celloutsig_0_56z;
  wire celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire [2:0] celloutsig_0_5z;
  wire [3:0] celloutsig_0_60z;
  wire celloutsig_0_61z;
  wire celloutsig_0_62z;
  wire celloutsig_0_63z;
  wire celloutsig_0_64z;
  wire [6:0] celloutsig_0_65z;
  wire [4:0] celloutsig_0_67z;
  wire celloutsig_0_68z;
  wire celloutsig_0_69z;
  wire [4:0] celloutsig_0_6z;
  wire celloutsig_0_74z;
  wire [3:0] celloutsig_0_78z;
  wire celloutsig_0_7z;
  wire celloutsig_0_88z;
  wire [5:0] celloutsig_0_89z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_13z;
  wire [39:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [13:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire [17:0] celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_33z = !(in_data[36] ? in_data[16] : celloutsig_0_4z[13]);
  assign celloutsig_0_63z = !(celloutsig_0_28z ? celloutsig_0_38z : celloutsig_0_60z[1]);
  assign celloutsig_0_68z = !(celloutsig_0_54z[1] ? celloutsig_0_67z[1] : celloutsig_0_58z);
  assign celloutsig_1_4z = !(celloutsig_1_10z ? celloutsig_1_2z : celloutsig_1_0z[0]);
  assign celloutsig_0_11z = !(celloutsig_0_6z[1] ? celloutsig_0_0z : celloutsig_0_3z[2]);
  assign celloutsig_0_30z = !(celloutsig_0_20z[0] ? celloutsig_0_22z[5] : celloutsig_0_22z[4]);
  assign celloutsig_1_10z = ~celloutsig_1_0z[2];
  assign celloutsig_0_9z = ~celloutsig_0_3z[0];
  assign celloutsig_0_61z = ~((celloutsig_0_50z[12] | celloutsig_0_33z) & celloutsig_0_20z[0]);
  assign celloutsig_0_62z = ~((celloutsig_0_9z | celloutsig_0_48z[14]) & celloutsig_0_26z[4]);
  assign celloutsig_0_1z = ~((in_data[46] | celloutsig_0_0z) & in_data[44]);
  assign celloutsig_0_44z = celloutsig_0_20z[2] | celloutsig_0_3z[1];
  assign celloutsig_0_56z = celloutsig_0_14z | celloutsig_0_52z;
  assign celloutsig_0_64z = celloutsig_0_2z[0] | celloutsig_0_58z;
  assign celloutsig_0_0z = in_data[72] ^ in_data[60];
  assign celloutsig_0_35z = ~(celloutsig_0_27z[2] ^ celloutsig_0_26z[7]);
  assign celloutsig_0_47z = ~(celloutsig_0_13z[0] ^ celloutsig_0_18z[8]);
  assign celloutsig_0_57z = ~(celloutsig_0_17z[1] ^ celloutsig_0_23z);
  assign celloutsig_0_7z = ~(celloutsig_0_5z[2] ^ in_data[42]);
  assign celloutsig_1_9z = ~(celloutsig_1_1z[1] ^ celloutsig_1_6z[4]);
  assign celloutsig_0_32z = ~(celloutsig_0_24z[2] ^ celloutsig_0_19z[0]);
  assign celloutsig_0_54z = { celloutsig_0_37z[1:0], celloutsig_0_38z, celloutsig_0_3z } + { celloutsig_0_34z[6:0], celloutsig_0_20z };
  assign celloutsig_0_65z = { in_data[23:18], celloutsig_0_46z } + { celloutsig_0_5z[1:0], celloutsig_0_39z, celloutsig_0_14z, celloutsig_0_61z, celloutsig_0_33z, celloutsig_0_47z };
  assign celloutsig_1_1z = { in_data[115:111], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } + in_data[171:158];
  assign celloutsig_0_19z = celloutsig_0_17z[4:2] + { celloutsig_0_18z[4], celloutsig_0_7z, celloutsig_0_7z };
  assign celloutsig_0_29z = { celloutsig_0_25z[4:1], celloutsig_0_22z } + { celloutsig_0_23z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_23z, celloutsig_0_7z, celloutsig_0_12z };
  always_ff @(negedge clkin_data[96], negedge clkin_data[64])
    if (!clkin_data[64]) _00_ <= 4'h0;
    else _00_ <= { celloutsig_0_6z[1], celloutsig_0_19z };
  assign celloutsig_1_17z = { in_data[150:118], celloutsig_1_2z, celloutsig_1_10z, celloutsig_1_0z, celloutsig_1_13z, celloutsig_1_9z } & in_data[141:102];
  assign celloutsig_0_17z = { celloutsig_0_4z[12:10], celloutsig_0_4z[12:11] } & { celloutsig_0_2z[2], celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_7z };
  assign celloutsig_0_8z = in_data[61:56] === { celloutsig_0_1z, celloutsig_0_6z };
  assign celloutsig_1_13z = celloutsig_1_6z[2:0] === { in_data[146:145], celloutsig_1_2z };
  assign celloutsig_1_19z = { celloutsig_1_6z[3:2], celloutsig_1_18z, celloutsig_1_5z } === celloutsig_1_1z[11:8];
  assign celloutsig_0_23z = { in_data[3:2], celloutsig_0_20z, celloutsig_0_21z } === { celloutsig_0_5z[2], celloutsig_0_6z };
  assign celloutsig_1_18z = { celloutsig_1_17z[37:34], celloutsig_1_5z } <= celloutsig_1_7z[10:6];
  assign celloutsig_0_36z = ! celloutsig_0_6z[3:1];
  assign celloutsig_0_46z = ! { celloutsig_0_30z, celloutsig_0_2z, _00_, celloutsig_0_26z };
  assign celloutsig_0_58z = ! { celloutsig_0_42z[2:1], celloutsig_0_44z, celloutsig_0_24z };
  assign celloutsig_0_74z = { celloutsig_0_68z, celloutsig_0_64z, celloutsig_0_53z, celloutsig_0_64z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_9z } < { celloutsig_0_42z[0], celloutsig_0_65z, celloutsig_0_64z };
  assign celloutsig_0_28z = { celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_25z, celloutsig_0_27z, celloutsig_0_23z, celloutsig_0_14z, celloutsig_0_25z, celloutsig_0_24z, celloutsig_0_20z, celloutsig_0_23z, celloutsig_0_9z, celloutsig_0_8z } < { celloutsig_0_18z[7:0], celloutsig_0_18z, celloutsig_0_23z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_20z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_17z };
  assign celloutsig_0_43z = { in_data[59:39], celloutsig_0_0z } % { 1'h1, celloutsig_0_34z[5:0], celloutsig_0_30z, celloutsig_0_28z, celloutsig_0_17z, celloutsig_0_22z, celloutsig_0_38z, celloutsig_0_9z };
  assign celloutsig_0_50z = { celloutsig_0_48z[19:13], celloutsig_0_23z, celloutsig_0_38z, celloutsig_0_27z, celloutsig_0_23z } % { 1'h1, celloutsig_0_48z[19:5], celloutsig_0_8z };
  assign celloutsig_0_6z = in_data[37:33] % { 1'h1, celloutsig_0_3z[2:0], celloutsig_0_0z };
  assign celloutsig_0_78z = { celloutsig_0_63z, celloutsig_0_32z, celloutsig_0_53z, celloutsig_0_69z } % { 1'h1, celloutsig_0_65z[2:0] };
  assign celloutsig_0_89z = { celloutsig_0_48z[6:4], celloutsig_0_74z, celloutsig_0_23z, celloutsig_0_28z } % { 1'h1, celloutsig_0_27z[3:2], celloutsig_0_62z, celloutsig_0_1z, celloutsig_0_57z };
  assign celloutsig_1_0z = in_data[137:135] % { 1'h1, in_data[180:179] };
  assign celloutsig_1_7z = { in_data[156:141], celloutsig_1_4z, celloutsig_1_4z } % { 1'h1, celloutsig_1_0z[1:0], celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_18z = { celloutsig_0_4z[15:10], celloutsig_0_4z[12:10], celloutsig_0_4z[6] } % { 1'h1, celloutsig_0_12z, 2'h0, celloutsig_0_13z[0], celloutsig_0_17z };
  assign celloutsig_0_20z = { celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_7z } % { 1'h1, celloutsig_0_2z[1:0] };
  assign celloutsig_0_25z = celloutsig_0_17z % { 1'h1, celloutsig_0_20z[0], celloutsig_0_5z };
  assign celloutsig_0_27z = celloutsig_0_3z % { 1'h1, celloutsig_0_1z, celloutsig_0_6z };
  assign celloutsig_0_42z = - celloutsig_0_19z;
  assign celloutsig_0_67z = - celloutsig_0_48z[19:15];
  assign celloutsig_0_40z = & { celloutsig_0_34z, celloutsig_0_30z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_1z, in_data[46:42] };
  assign celloutsig_0_52z = & { celloutsig_0_38z, celloutsig_0_32z, celloutsig_0_26z, celloutsig_0_11z };
  assign celloutsig_1_2z = & in_data[103:97];
  assign celloutsig_0_12z = & { celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_14z = & { in_data[86:78], celloutsig_0_0z };
  assign celloutsig_0_15z = & celloutsig_0_3z[6:3];
  assign celloutsig_0_21z = & in_data[76:57];
  assign celloutsig_0_38z = celloutsig_0_22z[5] & celloutsig_0_20z[2];
  assign celloutsig_0_53z = celloutsig_0_27z[5] & celloutsig_0_11z;
  assign celloutsig_0_88z = celloutsig_0_78z[1] & celloutsig_0_78z[3];
  assign celloutsig_1_5z = celloutsig_1_1z[11] & celloutsig_1_1z[6];
  assign celloutsig_0_10z = celloutsig_0_2z[0] & celloutsig_0_3z[0];
  assign celloutsig_0_39z = | { celloutsig_0_18z[8:2], celloutsig_0_11z };
  assign celloutsig_0_69z = | { celloutsig_0_63z, celloutsig_0_56z, celloutsig_0_29z, celloutsig_0_18z[8:2], celloutsig_0_11z };
  assign celloutsig_0_48z = { celloutsig_0_31z[6:4], celloutsig_0_35z, celloutsig_0_9z, celloutsig_0_32z, celloutsig_0_27z, celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_38z } <<< { celloutsig_0_27z[1:0], celloutsig_0_12z, celloutsig_0_40z, celloutsig_0_43z };
  assign celloutsig_1_6z = celloutsig_1_1z[10:6] <<< { in_data[137:136], celloutsig_1_5z, celloutsig_1_10z, celloutsig_1_5z };
  assign celloutsig_0_24z = { celloutsig_0_3z[5:0], celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_10z } <<< { celloutsig_0_18z[9:1], celloutsig_0_23z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_31z = { celloutsig_0_18z[4], celloutsig_0_12z, celloutsig_0_17z } <<< { celloutsig_0_27z[6:4], celloutsig_0_23z, 2'h0, celloutsig_0_13z[0] };
  assign celloutsig_0_34z = celloutsig_0_24z[11:4] - { celloutsig_0_3z[6:1], celloutsig_0_23z, celloutsig_0_23z };
  assign celloutsig_0_60z = celloutsig_0_17z[4:1] - { celloutsig_0_32z, celloutsig_0_36z, celloutsig_0_52z, celloutsig_0_33z };
  assign celloutsig_0_5z = in_data[62:60] - celloutsig_0_2z;
  assign celloutsig_0_22z = { celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_10z } - { celloutsig_0_6z, celloutsig_0_9z };
  assign celloutsig_0_26z = { in_data[75:69], celloutsig_0_11z } ^ { celloutsig_0_21z, celloutsig_0_23z, celloutsig_0_22z };
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_37z = 4'h0;
    else if (!clkin_data[32]) celloutsig_0_37z = { celloutsig_0_36z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_30z };
  always_latch
    if (clkin_data[64]) celloutsig_0_3z = 7'h00;
    else if (!clkin_data[0]) celloutsig_0_3z = { in_data[54], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_2z = 3'h0;
    else if (clkin_data[0]) celloutsig_0_2z = { in_data[63:62], celloutsig_0_0z };
  assign { celloutsig_0_4z[15], celloutsig_0_4z[4], celloutsig_0_4z[11], celloutsig_0_4z[14], celloutsig_0_4z[3], celloutsig_0_4z[10], celloutsig_0_4z[13], celloutsig_0_4z[6], celloutsig_0_4z[2], celloutsig_0_4z[12], celloutsig_0_4z[5], celloutsig_0_4z[1:0] } = { celloutsig_0_3z[6], celloutsig_0_2z[2], celloutsig_0_2z[2], celloutsig_0_2z[2:1], celloutsig_0_2z[1], celloutsig_0_2z[1:0], celloutsig_0_2z[0], celloutsig_0_2z[0], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z } ^ { in_data[73], celloutsig_0_3z[4], celloutsig_0_2z[1], in_data[72], celloutsig_0_3z[3], celloutsig_0_2z[0], celloutsig_0_0z, celloutsig_0_3z[6], celloutsig_0_3z[2], celloutsig_0_2z[2], celloutsig_0_3z[5], celloutsig_0_3z[1:0] };
  assign celloutsig_0_13z[0] = celloutsig_0_5z[0] ^ celloutsig_0_0z;
  assign celloutsig_0_13z[2:1] = 2'h0;
  assign celloutsig_0_4z[9:7] = celloutsig_0_4z[12:10];
  assign { out_data[128], out_data[96], out_data[32], out_data[5:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_88z, celloutsig_0_89z };
endmodule
