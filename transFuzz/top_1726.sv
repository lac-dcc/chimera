/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  reg [42:0] celloutsig_0_38z;
  reg [3:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  reg [11:0] celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_62z;
  wire celloutsig_0_65z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_74z;
  wire celloutsig_0_76z;
  wire celloutsig_0_77z;
  wire celloutsig_0_7z;
  reg [3:0] celloutsig_0_85z;
  wire celloutsig_0_89z;
  wire celloutsig_0_8z;
  wire celloutsig_0_90z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  reg [2:0] celloutsig_1_1z;
  reg [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ^ in_data[21:18];
  assign celloutsig_0_47z = ^ { celloutsig_0_6z, celloutsig_0_21z, celloutsig_0_30z, celloutsig_0_22z, celloutsig_0_41z, celloutsig_0_33z };
  assign celloutsig_0_48z = ^ { celloutsig_0_27z, celloutsig_0_2z, celloutsig_0_33z, celloutsig_0_12z };
  assign celloutsig_0_49z = ^ { celloutsig_0_38z[15:12], celloutsig_0_18z, celloutsig_0_31z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_33z, celloutsig_0_27z, celloutsig_0_21z, celloutsig_0_45z, celloutsig_0_42z, celloutsig_0_25z, celloutsig_0_30z, celloutsig_0_9z, celloutsig_0_29z, celloutsig_0_23z, celloutsig_0_14z, celloutsig_0_37z, celloutsig_0_3z };
  assign celloutsig_0_50z = ^ { celloutsig_0_35z, celloutsig_0_3z, celloutsig_0_33z, celloutsig_0_20z, celloutsig_0_25z, celloutsig_0_24z, celloutsig_0_25z, celloutsig_0_17z, celloutsig_0_12z };
  assign celloutsig_0_51z = ^ { celloutsig_0_13z, celloutsig_0_37z, celloutsig_0_9z, celloutsig_0_18z, celloutsig_0_24z };
  assign celloutsig_0_52z = ^ in_data[92:84];
  assign celloutsig_0_53z = ^ { celloutsig_0_5z[11:2], celloutsig_0_50z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_29z, celloutsig_0_32z, celloutsig_0_28z, celloutsig_0_49z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_31z, celloutsig_0_26z };
  assign celloutsig_0_54z = ^ { celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_22z, celloutsig_0_26z, celloutsig_0_26z, celloutsig_0_20z, celloutsig_0_33z, celloutsig_0_53z };
  assign celloutsig_0_55z = ^ { in_data[17:14], celloutsig_0_46z, celloutsig_0_17z, celloutsig_0_39z };
  assign celloutsig_0_56z = ^ { celloutsig_0_5z, celloutsig_0_33z, celloutsig_0_44z, celloutsig_0_12z, celloutsig_0_45z, celloutsig_0_17z, celloutsig_0_27z, celloutsig_0_24z };
  assign celloutsig_0_57z = ^ { celloutsig_0_3z, celloutsig_0_35z, celloutsig_0_45z, celloutsig_0_35z, celloutsig_0_21z, celloutsig_0_35z, celloutsig_0_32z, celloutsig_0_45z, celloutsig_0_19z, celloutsig_0_14z, celloutsig_0_32z, celloutsig_0_6z, celloutsig_0_24z };
  assign celloutsig_0_58z = ^ { celloutsig_0_5z[2:0], celloutsig_0_49z, celloutsig_0_43z };
  assign celloutsig_0_59z = ^ { celloutsig_0_38z[7], celloutsig_0_8z, celloutsig_0_22z, celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_52z, celloutsig_0_54z, celloutsig_0_20z, celloutsig_0_18z, celloutsig_0_29z, celloutsig_0_48z, celloutsig_0_12z, celloutsig_0_33z, celloutsig_0_27z, celloutsig_0_41z, celloutsig_0_55z, celloutsig_0_41z, celloutsig_0_0z, celloutsig_0_30z, celloutsig_0_55z, celloutsig_0_4z, celloutsig_0_56z, celloutsig_0_33z, celloutsig_0_35z, celloutsig_0_51z, celloutsig_0_6z, celloutsig_0_37z, celloutsig_0_12z };
  assign celloutsig_0_61z = ^ { celloutsig_0_38z[33:23], celloutsig_0_8z, celloutsig_0_19z, celloutsig_0_57z, celloutsig_0_59z, celloutsig_0_29z, celloutsig_0_24z, celloutsig_0_19z, celloutsig_0_1z, celloutsig_0_49z, celloutsig_0_33z, celloutsig_0_43z, celloutsig_0_35z, celloutsig_0_11z, celloutsig_0_40z, celloutsig_0_41z };
  assign celloutsig_0_62z = ^ { celloutsig_0_18z, celloutsig_0_30z, celloutsig_0_43z, celloutsig_0_21z, celloutsig_0_42z, celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_50z, celloutsig_0_57z };
  assign celloutsig_0_65z = ^ { in_data[64:51], celloutsig_0_6z, celloutsig_0_40z, celloutsig_0_58z, celloutsig_0_62z };
  assign celloutsig_0_70z = ^ { celloutsig_0_15z, celloutsig_0_37z, celloutsig_0_61z, celloutsig_0_11z, celloutsig_0_27z };
  assign celloutsig_0_6z = ^ celloutsig_0_5z[9:4];
  assign celloutsig_0_74z = ^ { celloutsig_0_5z[8:4], celloutsig_0_21z, celloutsig_0_61z, celloutsig_0_45z, celloutsig_0_41z };
  assign celloutsig_0_76z = ^ { celloutsig_0_52z, celloutsig_0_61z, celloutsig_0_49z };
  assign celloutsig_0_77z = ^ { celloutsig_0_8z, celloutsig_0_29z, celloutsig_0_36z, celloutsig_0_1z, celloutsig_0_16z, celloutsig_0_47z, celloutsig_0_70z, celloutsig_0_0z, celloutsig_0_37z, celloutsig_0_56z, celloutsig_0_28z };
  assign celloutsig_0_7z = ^ { in_data[39], celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_0_8z = ^ celloutsig_0_5z[3:1];
  assign celloutsig_0_89z = ^ { celloutsig_0_40z, celloutsig_0_21z, celloutsig_0_47z, celloutsig_0_61z, celloutsig_0_29z, celloutsig_0_0z, celloutsig_0_74z, celloutsig_0_76z };
  assign celloutsig_0_90z = ^ { celloutsig_0_38z[13], celloutsig_0_70z, celloutsig_0_77z, celloutsig_0_58z, celloutsig_0_85z, celloutsig_0_65z };
  assign celloutsig_1_0z = ^ in_data[141:138];
  assign celloutsig_1_3z = ^ in_data[147:137];
  assign celloutsig_1_4z = ^ { in_data[136:132], celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_5z = ^ { in_data[159:155], celloutsig_1_2z };
  assign celloutsig_0_9z = ^ in_data[24:21];
  assign celloutsig_1_6z = ^ { celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_7z = ^ { in_data[171:158], celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_1_8z = ^ in_data[149:138];
  assign celloutsig_1_9z = ^ { in_data[114], celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_5z };
  assign celloutsig_1_10z = ^ { in_data[140:139], celloutsig_1_6z, celloutsig_1_5z };
  assign celloutsig_1_11z = ^ { celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_5z };
  assign celloutsig_1_12z = ^ { celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_9z, celloutsig_1_7z };
  assign celloutsig_1_13z = ^ { celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_2z };
  assign celloutsig_0_10z = ^ in_data[65:58];
  assign celloutsig_1_15z = ^ { in_data[169:128], celloutsig_1_11z, celloutsig_1_11z };
  assign celloutsig_1_16z = ^ { celloutsig_1_2z[1:0], celloutsig_1_5z, celloutsig_1_10z, celloutsig_1_15z };
  assign celloutsig_1_17z = ^ { in_data[120:118], celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_11z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_12z, celloutsig_1_10z, celloutsig_1_13z, celloutsig_1_15z, celloutsig_1_2z, celloutsig_1_15z };
  assign celloutsig_1_18z = ^ { celloutsig_1_7z, celloutsig_1_13z, celloutsig_1_12z, celloutsig_1_0z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_10z, celloutsig_1_2z, celloutsig_1_10z, celloutsig_1_2z, celloutsig_1_16z, celloutsig_1_12z };
  assign celloutsig_1_19z = ^ { celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_12z, celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_12z, celloutsig_1_3z, celloutsig_1_17z, celloutsig_1_3z, celloutsig_1_13z, celloutsig_1_15z, celloutsig_1_8z };
  assign celloutsig_0_11z = ^ { celloutsig_0_5z[7:5], celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_12z = ^ celloutsig_0_5z[4:1];
  assign celloutsig_0_13z = ^ { in_data[70:65], celloutsig_0_12z, celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_0_1z = ^ { in_data[89:85], celloutsig_0_0z };
  assign celloutsig_0_14z = ^ { celloutsig_0_5z[8:3], celloutsig_0_11z };
  assign celloutsig_0_15z = ^ { in_data[73:49], celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_0_16z = ^ { celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_13z, celloutsig_0_1z };
  assign celloutsig_0_17z = ^ { celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_15z };
  assign celloutsig_0_18z = ^ { celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_16z, celloutsig_0_8z, celloutsig_0_8z };
  assign celloutsig_0_19z = ^ in_data[60:55];
  assign celloutsig_0_20z = ^ { celloutsig_0_5z[7:5], celloutsig_0_9z, celloutsig_0_15z, celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_14z, celloutsig_0_11z };
  assign celloutsig_0_21z = ^ { celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_11z };
  assign celloutsig_0_22z = ^ { celloutsig_0_19z, celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_7z };
  assign celloutsig_0_23z = ^ { celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_17z, celloutsig_0_8z };
  assign celloutsig_0_2z = ^ { in_data[74:61], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_24z = ^ { celloutsig_0_23z, celloutsig_0_20z, celloutsig_0_17z, celloutsig_0_16z };
  assign celloutsig_0_25z = ^ { celloutsig_0_20z, celloutsig_0_22z, celloutsig_0_23z, celloutsig_0_24z };
  assign celloutsig_0_26z = ^ { celloutsig_0_14z, celloutsig_0_25z, celloutsig_0_12z, celloutsig_0_3z, celloutsig_0_8z };
  assign celloutsig_0_27z = ^ { celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_7z };
  assign celloutsig_0_28z = ^ { in_data[31:13], celloutsig_0_27z, celloutsig_0_3z, celloutsig_0_25z, celloutsig_0_11z, celloutsig_0_7z };
  assign celloutsig_0_29z = ^ { celloutsig_0_2z, celloutsig_0_16z, celloutsig_0_18z, celloutsig_0_27z, celloutsig_0_8z, celloutsig_0_16z, celloutsig_0_24z, celloutsig_0_23z, celloutsig_0_10z };
  assign celloutsig_0_30z = ^ { celloutsig_0_16z, celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_1z };
  assign celloutsig_0_31z = ^ { celloutsig_0_3z, celloutsig_0_26z, celloutsig_0_8z, celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_30z, celloutsig_0_12z };
  assign celloutsig_0_32z = ^ { celloutsig_0_6z, celloutsig_0_17z, celloutsig_0_21z, celloutsig_0_30z, celloutsig_0_1z, celloutsig_0_23z, celloutsig_0_28z, celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_31z };
  assign celloutsig_0_33z = ^ { in_data[51:37], celloutsig_0_13z, celloutsig_0_29z, celloutsig_0_3z, celloutsig_0_29z, celloutsig_0_11z, celloutsig_0_19z, celloutsig_0_30z, celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_20z, celloutsig_0_4z, celloutsig_0_12z };
  assign celloutsig_0_3z = ^ { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_34z = ^ { celloutsig_0_1z, celloutsig_0_22z, celloutsig_0_7z };
  assign celloutsig_0_35z = ^ { in_data[94:87], celloutsig_0_21z, celloutsig_0_22z };
  assign celloutsig_0_36z = ^ { celloutsig_0_0z, celloutsig_0_15z, celloutsig_0_17z, celloutsig_0_23z };
  assign celloutsig_0_37z = ^ { celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_9z };
  assign celloutsig_0_40z = ^ { celloutsig_0_15z, celloutsig_0_29z, celloutsig_0_30z, celloutsig_0_0z };
  assign celloutsig_0_41z = ^ { in_data[11:8], celloutsig_0_39z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_20z, celloutsig_0_23z, celloutsig_0_18z };
  assign celloutsig_0_4z = ^ in_data[75:69];
  assign celloutsig_0_42z = ^ { celloutsig_0_41z, celloutsig_0_26z, celloutsig_0_23z, celloutsig_0_31z, celloutsig_0_16z, celloutsig_0_23z, celloutsig_0_23z, celloutsig_0_25z, celloutsig_0_7z, celloutsig_0_20z, celloutsig_0_23z, celloutsig_0_0z, celloutsig_0_30z };
  assign celloutsig_0_43z = ^ { celloutsig_0_38z[4:0], celloutsig_0_25z, celloutsig_0_39z };
  assign celloutsig_0_44z = ^ { celloutsig_0_38z[32:24], celloutsig_0_15z };
  assign celloutsig_0_45z = ^ { in_data[89:83], celloutsig_0_34z, celloutsig_0_31z, celloutsig_0_43z, celloutsig_0_27z, celloutsig_0_10z, celloutsig_0_12z };
  assign celloutsig_0_46z = ^ { celloutsig_0_5z[7:2], celloutsig_0_4z, celloutsig_0_18z, celloutsig_0_43z, celloutsig_0_25z, celloutsig_0_40z, celloutsig_0_22z, celloutsig_0_2z, celloutsig_0_26z, celloutsig_0_23z, celloutsig_0_45z, celloutsig_0_45z, celloutsig_0_27z, celloutsig_0_12z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_5z = 12'h000;
    else if (celloutsig_1_18z) celloutsig_0_5z = { in_data[58:50], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_85z = 4'h0;
    else if (!celloutsig_1_18z) celloutsig_0_85z = { celloutsig_0_42z, celloutsig_0_18z, celloutsig_0_56z, celloutsig_0_0z };
  always_latch
    if (clkin_data[96]) celloutsig_1_1z = 3'h0;
    else if (!clkin_data[32]) celloutsig_1_1z = in_data[174:172];
  always_latch
    if (!clkin_data[128]) celloutsig_1_2z = 3'h0;
    else if (!clkin_data[0]) celloutsig_1_2z = in_data[190:188];
  always_latch
    if (clkin_data[64]) celloutsig_0_38z = 43'h00000000000;
    else if (celloutsig_1_18z) celloutsig_0_38z = { in_data[88:84], celloutsig_0_37z, celloutsig_0_7z, celloutsig_0_18z, celloutsig_0_31z, celloutsig_0_26z, celloutsig_0_34z, celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_32z, celloutsig_0_29z, celloutsig_0_19z, celloutsig_0_37z, celloutsig_0_17z, celloutsig_0_4z, celloutsig_0_36z, celloutsig_0_32z, celloutsig_0_26z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_37z, celloutsig_0_30z, celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_37z, celloutsig_0_19z, celloutsig_0_30z, celloutsig_0_13z, celloutsig_0_21z, celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_35z, celloutsig_0_14z, celloutsig_0_34z, celloutsig_0_35z, celloutsig_0_0z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_39z = 4'h0;
    else if (!celloutsig_1_18z) celloutsig_0_39z = { celloutsig_0_38z[32:30], celloutsig_0_20z };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_89z, celloutsig_0_90z };
endmodule
