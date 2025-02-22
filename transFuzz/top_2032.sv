/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [9:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [4:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  reg [6:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [29:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [5:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [19:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [9:0] celloutsig_0_30z;
  wire [3:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [9:0] celloutsig_0_34z;
  wire [8:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [14:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [7:0] celloutsig_0_3z;
  wire [11:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [9:0] celloutsig_0_48z;
  wire [5:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire celloutsig_0_55z;
  wire [9:0] celloutsig_0_56z;
  reg [11:0] celloutsig_0_57z;
  wire [13:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [5:0] celloutsig_0_61z;
  wire celloutsig_0_62z;
  wire [13:0] celloutsig_0_64z;
  wire [8:0] celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire [7:0] celloutsig_0_71z;
  wire [7:0] celloutsig_0_76z;
  wire celloutsig_0_7z;
  wire celloutsig_0_81z;
  wire [2:0] celloutsig_0_82z;
  wire celloutsig_0_87z;
  wire celloutsig_0_8z;
  wire celloutsig_0_94z;
  wire celloutsig_0_95z;
  wire [17:0] celloutsig_0_9z;
  wire [7:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire [3:0] celloutsig_1_14z;
  wire [4:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [27:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [9:0] celloutsig_1_7z;
  wire [4:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_8z = !(celloutsig_0_7z ? celloutsig_0_7z : celloutsig_0_5z);
  assign celloutsig_1_9z = !(celloutsig_1_8z[1] ? celloutsig_1_3z : celloutsig_1_6z);
  assign celloutsig_1_10z = !(celloutsig_1_5z ? in_data[138] : celloutsig_1_6z);
  assign celloutsig_0_22z = !(celloutsig_0_1z ? in_data[28] : celloutsig_0_10z);
  assign celloutsig_0_39z = ~celloutsig_0_38z;
  assign celloutsig_1_17z = ~celloutsig_1_13z;
  assign celloutsig_0_16z = ~celloutsig_0_12z;
  assign celloutsig_0_21z = ~((celloutsig_0_2z | celloutsig_0_12z) & (celloutsig_0_4z | celloutsig_0_7z));
  assign celloutsig_0_23z = ~((celloutsig_0_6z | celloutsig_0_7z) & (celloutsig_0_11z[7] | celloutsig_0_22z));
  assign celloutsig_0_44z = celloutsig_0_9z[17] | celloutsig_0_22z;
  assign celloutsig_0_7z = celloutsig_0_5z | celloutsig_0_6z;
  assign celloutsig_0_0z = in_data[8] ^ in_data[27];
  assign celloutsig_0_4z = celloutsig_0_0z ^ celloutsig_0_2z;
  assign celloutsig_0_41z = in_data[79] ^ celloutsig_0_25z[5];
  assign celloutsig_0_60z = in_data[31] ^ celloutsig_0_51z;
  assign celloutsig_1_5z = celloutsig_1_2z ^ celloutsig_1_0z[0];
  assign celloutsig_0_18z = celloutsig_0_6z ^ celloutsig_0_16z;
  assign celloutsig_0_26z = celloutsig_0_17z[1] ^ celloutsig_0_21z;
  assign celloutsig_0_62z = ~(celloutsig_0_35z[6] ^ celloutsig_0_29z[13]);
  assign celloutsig_0_33z = { celloutsig_0_30z[7:1], celloutsig_0_24z, celloutsig_0_7z, celloutsig_0_24z } >= { celloutsig_0_9z[9:1], celloutsig_0_15z };
  assign celloutsig_0_42z = celloutsig_0_17z >= celloutsig_0_34z[9:3];
  assign celloutsig_0_46z = celloutsig_0_40z[10:4] >= { celloutsig_0_20z[3:1], celloutsig_0_36z, celloutsig_0_16z, celloutsig_0_1z, celloutsig_0_39z };
  assign celloutsig_0_50z = { celloutsig_0_31z, celloutsig_0_8z, celloutsig_0_23z } >= celloutsig_0_9z[13:8];
  assign celloutsig_0_53z = { celloutsig_0_30z[9:6], celloutsig_0_47z, celloutsig_0_18z, celloutsig_0_15z } >= { celloutsig_0_40z[6:4], celloutsig_0_26z, celloutsig_0_50z, celloutsig_0_4z, celloutsig_0_42z };
  assign celloutsig_0_55z = { celloutsig_0_34z[8:0], celloutsig_0_44z, celloutsig_0_44z } >= { celloutsig_0_17z[6:3], celloutsig_0_46z, celloutsig_0_4z, celloutsig_0_32z, celloutsig_0_5z, celloutsig_0_16z, celloutsig_0_24z, celloutsig_0_8z };
  assign celloutsig_0_94z = { in_data[42:18], celloutsig_0_32z, celloutsig_0_25z, celloutsig_0_6z, celloutsig_0_60z, celloutsig_0_44z, celloutsig_0_52z, celloutsig_0_87z } >= { celloutsig_0_48z[9], celloutsig_0_61z, celloutsig_0_18z, celloutsig_0_17z, celloutsig_0_82z, celloutsig_0_44z, celloutsig_0_11z, celloutsig_0_51z, celloutsig_0_17z };
  assign celloutsig_0_10z = { celloutsig_0_3z[5:2], celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z } >= { celloutsig_0_9z[14:4], celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_1_3z = { in_data[169:136], celloutsig_1_0z } >= { in_data[181:145], celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_2z = in_data[70:62] >= { in_data[31:28], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_24z = { celloutsig_0_11z[6:5], celloutsig_0_16z, celloutsig_0_11z } >= { celloutsig_0_1z, celloutsig_0_14z, celloutsig_0_21z, celloutsig_0_18z, celloutsig_0_20z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_32z = { celloutsig_0_19z[17:3], celloutsig_0_8z } >= { celloutsig_0_9z[15:2], celloutsig_0_7z, celloutsig_0_16z };
  assign celloutsig_0_52z = { celloutsig_0_49z[5:1], celloutsig_0_23z } <= { celloutsig_0_29z[9:5], celloutsig_0_39z };
  assign celloutsig_0_6z = celloutsig_0_3z[4:0] <= in_data[83:79];
  assign celloutsig_1_11z = { celloutsig_1_7z[6:1], celloutsig_1_6z, celloutsig_1_2z } <= { celloutsig_1_4z[26:22], celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_6z };
  assign celloutsig_0_51z = ! { celloutsig_0_41z, celloutsig_0_32z, celloutsig_0_43z, celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_38z };
  assign celloutsig_0_81z = ! { in_data[22:20], celloutsig_0_39z, celloutsig_0_62z, celloutsig_0_29z, celloutsig_0_49z, celloutsig_0_36z, celloutsig_0_7z, celloutsig_0_28z };
  assign celloutsig_0_14z = ! { celloutsig_0_11z[9:1], celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_7z };
  assign celloutsig_1_13z = { celloutsig_1_4z[21], celloutsig_1_5z, celloutsig_1_10z } || { celloutsig_1_8z[2:1], celloutsig_1_6z };
  assign celloutsig_1_19z = { celloutsig_1_1z[3:1], celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_18z, celloutsig_1_1z, celloutsig_1_17z } || { celloutsig_1_3z, celloutsig_1_14z, celloutsig_1_1z, celloutsig_1_8z };
  assign celloutsig_0_15z = { celloutsig_0_13z[2:1], celloutsig_0_13z } || { celloutsig_0_9z[12:7], celloutsig_0_4z };
  assign celloutsig_0_28z = { celloutsig_0_3z[3:0], celloutsig_0_10z, celloutsig_0_6z } || celloutsig_0_25z;
  assign celloutsig_0_36z = celloutsig_0_29z[18:12] < { celloutsig_0_3z[6:1], celloutsig_0_4z };
  assign celloutsig_0_43z = { celloutsig_0_30z[3:1], celloutsig_0_36z, celloutsig_0_18z } < celloutsig_0_9z[6:2];
  assign celloutsig_1_2z = celloutsig_1_0z[4:2] < celloutsig_1_1z[2:0];
  assign celloutsig_0_12z = { celloutsig_0_9z[10:5], celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_10z } < { celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_6z };
  assign celloutsig_0_27z = { celloutsig_0_11z[9:3], celloutsig_0_23z } < { celloutsig_0_19z[3:1], celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_21z, celloutsig_0_0z, celloutsig_0_22z };
  assign celloutsig_0_59z = { celloutsig_0_3z[4], celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_56z, celloutsig_0_26z } % { 1'h1, celloutsig_0_55z, celloutsig_0_38z, celloutsig_0_34z, celloutsig_0_51z };
  assign celloutsig_0_61z = celloutsig_0_17z[6:1] % { 1'h1, celloutsig_0_25z[3:0], celloutsig_0_47z };
  assign celloutsig_0_71z = { celloutsig_0_3z[7:1], celloutsig_0_33z } % { 1'h1, celloutsig_0_59z[7:1] };
  assign celloutsig_0_82z = celloutsig_0_64z[3:1] % { 1'h1, celloutsig_0_11z[4], celloutsig_0_44z };
  assign celloutsig_1_4z = { in_data[149:123], celloutsig_1_3z } % { 1'h1, in_data[121:105], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_0_34z = { celloutsig_0_29z[15:9], celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_22z } * { celloutsig_0_30z[8:0], celloutsig_0_2z };
  assign celloutsig_0_3z = { in_data[87:81], celloutsig_0_2z } * in_data[66:59];
  assign celloutsig_0_49z = - celloutsig_0_34z[5:0];
  assign celloutsig_0_56z = - { celloutsig_0_35z[7:0], celloutsig_0_26z, celloutsig_0_16z };
  assign celloutsig_0_67z = - { celloutsig_0_13z[4], celloutsig_0_39z, celloutsig_0_61z, celloutsig_0_2z };
  assign celloutsig_0_76z = - celloutsig_0_48z[7:0];
  assign celloutsig_1_0z = - in_data[117:110];
  assign celloutsig_1_7z = - celloutsig_1_4z[18:9];
  assign celloutsig_1_8z = - { celloutsig_1_4z[23:21], celloutsig_1_5z, celloutsig_1_2z };
  assign celloutsig_1_15z = - { celloutsig_1_4z[5:2], celloutsig_1_6z };
  assign celloutsig_0_20z = - celloutsig_0_9z[4:1];
  assign celloutsig_0_47z = & in_data[4:1];
  assign celloutsig_0_5z = & { celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_95z = & { celloutsig_0_82z, celloutsig_0_76z[7:3] };
  assign celloutsig_1_6z = & celloutsig_1_4z[18:9];
  assign celloutsig_0_1z = & in_data[75:67];
  assign celloutsig_0_48z = { celloutsig_0_9z[10:2], celloutsig_0_26z } >>> { celloutsig_0_31z[2], celloutsig_0_16z, celloutsig_0_39z, celloutsig_0_17z };
  assign celloutsig_0_9z = in_data[56:39] >>> { in_data[21:8], celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_5z };
  assign celloutsig_1_1z = in_data[107:104] >>> celloutsig_1_0z[5:2];
  assign celloutsig_0_31z = in_data[85:82] >>> celloutsig_0_3z[7:4];
  assign celloutsig_0_37z = { celloutsig_0_11z[7:1], celloutsig_0_15z, celloutsig_0_25z, celloutsig_0_33z } - { in_data[31:26], celloutsig_0_21z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_20z, celloutsig_0_15z };
  assign celloutsig_0_11z = { celloutsig_0_9z[5], celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z } - celloutsig_0_9z[10:1];
  assign celloutsig_0_13z = { in_data[3:1], celloutsig_0_7z, celloutsig_0_10z } - celloutsig_0_11z[8:4];
  assign celloutsig_0_19z = { celloutsig_0_9z[14:5], celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_17z } - { in_data[82:62], celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_4z };
  assign celloutsig_0_29z = { celloutsig_0_13z[3:2], celloutsig_0_16z, celloutsig_0_10z, celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_22z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_8z } - { celloutsig_0_9z[17:1], celloutsig_0_27z, celloutsig_0_6z, celloutsig_0_24z };
  assign celloutsig_0_35z = celloutsig_0_29z[8:0] ^ { celloutsig_0_19z[21:16], celloutsig_0_28z, celloutsig_0_6z, celloutsig_0_33z };
  assign celloutsig_0_40z = { celloutsig_0_19z[27:20], celloutsig_0_26z, celloutsig_0_1z, celloutsig_0_28z, celloutsig_0_39z } ^ celloutsig_0_37z[11:0];
  assign celloutsig_0_64z = { celloutsig_0_57z, celloutsig_0_14z, celloutsig_0_53z } ^ { celloutsig_0_19z[9], celloutsig_0_32z, celloutsig_0_40z };
  assign celloutsig_1_14z = celloutsig_1_1z ^ { celloutsig_1_11z, celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_2z };
  assign celloutsig_0_25z = { celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_10z } ^ { celloutsig_0_13z[3:2], celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_24z };
  assign celloutsig_0_30z = { celloutsig_0_20z[2:1], celloutsig_0_14z, celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_26z } ^ { in_data[49:41], celloutsig_0_15z };
  always_latch
    if (clkin_data[64]) celloutsig_0_57z = 12'h000;
    else if (!clkin_data[0]) celloutsig_0_57z = { celloutsig_0_11z[7:0], celloutsig_0_26z, celloutsig_0_21z, celloutsig_0_28z, celloutsig_0_47z };
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_17z = 7'h00;
    else if (clkin_data[0]) celloutsig_0_17z = celloutsig_0_11z[6:0];
  assign celloutsig_0_38z = ~((celloutsig_0_18z & celloutsig_0_10z) | (celloutsig_0_37z[7] & celloutsig_0_20z[2]));
  assign celloutsig_0_87z = ~((celloutsig_0_67z[5] & celloutsig_0_71z[6]) | (celloutsig_0_81z & celloutsig_0_16z));
  assign celloutsig_1_18z = ~((celloutsig_1_15z[4] & celloutsig_1_13z) | (celloutsig_1_9z & celloutsig_1_9z));
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_94z, celloutsig_0_95z };
endmodule
