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
  reg [23:0] celloutsig_0_2z;
  reg [2:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  reg [5:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_57z;
  reg [16:0] celloutsig_0_58z;
  wire celloutsig_0_59z;
  reg [18:0] celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_62z;
  wire celloutsig_0_65z;
  wire celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_71z;
  wire celloutsig_0_72z;
  wire celloutsig_0_74z;
  wire celloutsig_0_75z;
  wire celloutsig_0_7z;
  wire celloutsig_0_80z;
  wire celloutsig_0_81z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [19:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  reg [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [16:0] _00_;
  always_latch
    if (!clkin_data[96]) _00_ = 17'h00000;
    else if (clkin_data[32]) _00_ = { in_data[122:111], celloutsig_1_15z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_4z };
  assign { celloutsig_1_17z[19:7], celloutsig_1_17z[5], celloutsig_1_17z[3:2], celloutsig_1_17z[0] } = _00_;
  assign celloutsig_0_38z = celloutsig_0_31z ^ celloutsig_0_12z;
  assign celloutsig_0_43z = celloutsig_0_1z ^ celloutsig_0_29z;
  assign celloutsig_0_44z = celloutsig_0_0z ^ celloutsig_0_25z;
  assign celloutsig_0_45z = celloutsig_0_18z ^ celloutsig_0_41z;
  assign celloutsig_0_39z = celloutsig_0_32z ^ celloutsig_0_14z;
  assign celloutsig_0_48z = celloutsig_0_30z[1] ^ celloutsig_0_10z;
  assign celloutsig_0_49z = celloutsig_0_5z[14] ^ celloutsig_0_10z;
  assign celloutsig_0_51z = celloutsig_0_28z ^ celloutsig_0_27z;
  assign celloutsig_0_53z = celloutsig_0_49z ^ celloutsig_0_42z;
  assign celloutsig_0_57z = celloutsig_0_9z ^ celloutsig_0_20z;
  assign celloutsig_0_62z = celloutsig_0_54z ^ celloutsig_0_24z;
  assign celloutsig_0_65z = celloutsig_0_57z ^ celloutsig_0_20z;
  assign celloutsig_0_71z = celloutsig_0_19z ^ celloutsig_0_67z;
  assign celloutsig_0_6z = celloutsig_0_4z ^ celloutsig_0_3z[0];
  assign celloutsig_0_74z = celloutsig_0_62z ^ celloutsig_0_15z;
  assign celloutsig_0_81z = celloutsig_0_15z ^ celloutsig_0_59z;
  assign celloutsig_1_0z = in_data[144] ^ in_data[150];
  assign celloutsig_1_4z = in_data[152] ^ celloutsig_1_15z;
  assign celloutsig_1_5z = celloutsig_1_3z ^ celloutsig_1_15z;
  assign celloutsig_1_6z = celloutsig_1_0z ^ celloutsig_1_4z;
  assign celloutsig_1_8z = celloutsig_1_6z ^ celloutsig_1_7z;
  assign celloutsig_0_8z = celloutsig_0_5z[0] ^ celloutsig_0_3z[0];
  assign celloutsig_1_14z = celloutsig_1_2z[1] ^ celloutsig_1_10z;
  assign celloutsig_0_10z = in_data[81] ^ celloutsig_0_7z;
  assign celloutsig_0_12z = celloutsig_0_5z[9] ^ celloutsig_0_0z;
  assign celloutsig_0_13z = celloutsig_0_1z ^ celloutsig_0_6z;
  assign celloutsig_0_14z = celloutsig_0_3z[5] ^ celloutsig_0_3z[3];
  assign celloutsig_0_15z = celloutsig_0_2z[20] ^ celloutsig_0_4z;
  assign celloutsig_0_18z = in_data[19] ^ in_data[36];
  assign celloutsig_0_20z = celloutsig_0_1z ^ celloutsig_0_5z[12];
  assign celloutsig_0_22z = celloutsig_0_9z ^ celloutsig_0_7z;
  assign celloutsig_0_24z = celloutsig_0_5z[3] ^ celloutsig_0_9z;
  assign celloutsig_0_25z = celloutsig_0_23z ^ celloutsig_0_19z;
  assign celloutsig_0_28z = celloutsig_0_20z ^ celloutsig_0_24z;
  assign celloutsig_0_29z = celloutsig_0_20z ^ celloutsig_0_18z;
  assign celloutsig_0_31z = celloutsig_0_8z ^ celloutsig_0_3z[0];
  assign celloutsig_0_32z = celloutsig_0_31z ^ celloutsig_0_4z;
  assign celloutsig_0_34z = celloutsig_0_24z ^ celloutsig_0_30z[0];
  assign celloutsig_0_0z = ! in_data[33:4];
  assign celloutsig_0_37z = ! { celloutsig_0_3z[5:2], celloutsig_0_14z, celloutsig_0_9z, celloutsig_0_18z };
  assign celloutsig_0_40z = ! { celloutsig_0_25z, celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_37z, celloutsig_0_4z };
  assign celloutsig_0_41z = ! { celloutsig_0_3z[4:1], celloutsig_0_9z };
  assign celloutsig_0_42z = ! { celloutsig_0_3z[3], celloutsig_0_12z, celloutsig_0_31z, celloutsig_0_23z, celloutsig_0_25z };
  assign celloutsig_0_46z = ! { celloutsig_0_5z[10:9], celloutsig_0_34z, celloutsig_0_45z, celloutsig_0_20z, celloutsig_0_26z, celloutsig_0_37z, celloutsig_0_37z };
  assign celloutsig_0_4z = ! in_data[38:32];
  assign celloutsig_0_50z = ! celloutsig_0_2z[19:6];
  assign celloutsig_0_54z = ! { celloutsig_0_3z[5:1], celloutsig_0_13z, celloutsig_0_25z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_43z, celloutsig_0_48z, celloutsig_0_21z, celloutsig_0_50z, celloutsig_0_17z, celloutsig_0_45z, celloutsig_0_44z, celloutsig_0_9z, celloutsig_0_50z, celloutsig_0_38z };
  assign celloutsig_0_55z = ! { celloutsig_0_30z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_39z };
  assign celloutsig_0_59z = ! { celloutsig_0_2z[8:6], celloutsig_0_38z };
  assign celloutsig_0_61z = ! { celloutsig_0_5z[10:3], celloutsig_0_8z, celloutsig_0_59z, celloutsig_0_41z, celloutsig_0_12z, celloutsig_0_44z, celloutsig_0_11z, celloutsig_0_43z, celloutsig_0_33z, celloutsig_0_34z, celloutsig_0_37z, celloutsig_0_50z, celloutsig_0_51z, celloutsig_0_51z, celloutsig_0_3z, celloutsig_0_29z, celloutsig_0_21z, celloutsig_0_57z, celloutsig_0_6z, celloutsig_0_42z, celloutsig_0_49z };
  assign celloutsig_0_67z = ! { celloutsig_0_30z[1:0], celloutsig_0_18z, celloutsig_0_32z, celloutsig_0_34z, celloutsig_0_20z, celloutsig_0_46z, celloutsig_0_42z, celloutsig_0_36z };
  assign celloutsig_0_70z = ! celloutsig_0_58z[7:0];
  assign celloutsig_0_72z = ! { celloutsig_0_65z, celloutsig_0_30z, celloutsig_0_55z, celloutsig_0_50z, celloutsig_0_17z, celloutsig_0_61z };
  assign celloutsig_0_75z = ! { celloutsig_0_42z, celloutsig_0_24z, celloutsig_0_34z, celloutsig_0_72z, celloutsig_0_27z };
  assign celloutsig_0_80z = ! { celloutsig_0_3z, celloutsig_0_44z, celloutsig_0_65z, celloutsig_0_46z, celloutsig_0_45z, celloutsig_0_70z, celloutsig_0_18z, celloutsig_0_27z, celloutsig_0_71z, celloutsig_0_3z, celloutsig_0_74z, celloutsig_0_48z, celloutsig_0_46z, celloutsig_0_75z, celloutsig_0_74z, celloutsig_0_27z, celloutsig_0_57z, celloutsig_0_16z, celloutsig_0_23z, celloutsig_0_25z, celloutsig_0_7z };
  assign celloutsig_1_15z = ! { in_data[111:103], celloutsig_1_0z };
  assign celloutsig_0_7z = ! { celloutsig_0_2z[7:2], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_1_3z = ! { celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_15z };
  assign celloutsig_1_7z = ! { in_data[190:189], celloutsig_1_0z, celloutsig_1_15z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_15z };
  assign celloutsig_1_10z = ! { in_data[181:178], celloutsig_1_15z, celloutsig_1_4z, celloutsig_1_8z };
  assign celloutsig_1_18z = ! { celloutsig_1_17z[19:7], celloutsig_1_8z, celloutsig_1_15z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_14z, celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_15z };
  assign celloutsig_1_19z = ! { celloutsig_1_18z, celloutsig_1_8z, celloutsig_1_18z, celloutsig_1_6z, celloutsig_1_10z, celloutsig_1_4z };
  assign celloutsig_0_9z = ! { celloutsig_0_2z[2], celloutsig_0_7z, celloutsig_0_1z };
  assign celloutsig_0_1z = ! { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_11z = ! { celloutsig_0_5z[17:13], celloutsig_0_6z };
  assign celloutsig_0_16z = ! { celloutsig_0_2z[13], celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_0_17z = ! { in_data[55:54], celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_10z };
  assign celloutsig_0_19z = ! { celloutsig_0_8z, celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_17z };
  assign celloutsig_0_21z = ! { celloutsig_0_16z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_20z, celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_12z };
  assign celloutsig_0_23z = ! { celloutsig_0_20z, celloutsig_0_7z, celloutsig_0_14z, celloutsig_0_20z, celloutsig_0_17z };
  assign celloutsig_0_26z = ! { in_data[3:0], celloutsig_0_15z, celloutsig_0_24z };
  assign celloutsig_0_27z = ! { celloutsig_0_2z[2], celloutsig_0_25z, celloutsig_0_18z, celloutsig_0_4z, celloutsig_0_15z, celloutsig_0_8z, celloutsig_0_0z };
  assign celloutsig_0_33z = ! { celloutsig_0_5z[18:16], celloutsig_0_14z, celloutsig_0_1z, celloutsig_0_31z, celloutsig_0_0z, celloutsig_0_22z, celloutsig_0_0z, celloutsig_0_19z, celloutsig_0_17z, celloutsig_0_12z, celloutsig_0_31z, celloutsig_0_18z };
  assign celloutsig_0_36z = ! { in_data[12:8], celloutsig_0_26z };
  always_latch
    if (clkin_data[64]) celloutsig_0_5z = 19'h00000;
    else if (celloutsig_1_19z) celloutsig_0_5z = celloutsig_0_2z[20:2];
  always_latch
    if (!clkin_data[64]) celloutsig_0_58z = 17'h00000;
    else if (!clkin_data[0]) celloutsig_0_58z = { celloutsig_0_50z, celloutsig_0_12z, celloutsig_0_49z, celloutsig_0_7z, celloutsig_0_49z, celloutsig_0_32z, celloutsig_0_29z, celloutsig_0_36z, celloutsig_0_10z, celloutsig_0_21z, celloutsig_0_53z, celloutsig_0_27z, celloutsig_0_23z, celloutsig_0_53z, celloutsig_0_24z, celloutsig_0_38z, celloutsig_0_40z };
  always_latch
    if (!clkin_data[96]) celloutsig_1_2z = 3'h0;
    else if (!clkin_data[32]) celloutsig_1_2z = { in_data[130:129], celloutsig_1_15z };
  always_latch
    if (clkin_data[64]) celloutsig_0_2z = 24'h000000;
    else if (!clkin_data[0]) celloutsig_0_2z = in_data[93:70];
  always_latch
    if (!clkin_data[64]) celloutsig_0_30z = 3'h0;
    else if (!clkin_data[0]) celloutsig_0_30z = { in_data[17:16], celloutsig_0_18z };
  always_latch
    if (clkin_data[64]) celloutsig_0_3z = 6'h00;
    else if (celloutsig_1_19z) celloutsig_0_3z = in_data[57:52];
  assign { celloutsig_1_17z[6], celloutsig_1_17z[4], celloutsig_1_17z[1] } = 3'h0;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_80z, celloutsig_0_81z };
endmodule
