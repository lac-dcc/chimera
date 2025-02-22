/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [5:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  reg [16:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [13:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [8:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  reg [31:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  reg [22:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [8:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  reg [7:0] celloutsig_0_29z;
  wire [3:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [3:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [5:0] celloutsig_0_33z;
  wire [9:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire [22:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [2:0] celloutsig_0_40z;
  wire [5:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [6:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  reg [9:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  reg [2:0] celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire [6:0] celloutsig_0_55z;
  wire celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  wire [2:0] celloutsig_0_61z;
  wire celloutsig_0_62z;
  wire celloutsig_0_63z;
  wire celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire [2:0] celloutsig_0_68z;
  wire celloutsig_0_6z;
  wire celloutsig_0_73z;
  wire celloutsig_0_77z;
  wire [9:0] celloutsig_0_78z;
  wire celloutsig_0_7z;
  wire celloutsig_0_80z;
  reg [14:0] celloutsig_0_81z;
  wire celloutsig_0_86z;
  wire celloutsig_0_87z;
  wire [3:0] celloutsig_0_88z;
  wire celloutsig_0_8z;
  wire celloutsig_0_94z;
  wire [8:0] celloutsig_0_98z;
  wire celloutsig_0_99z;
  wire celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [8:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_5z;
  wire [2:0] celloutsig_1_6z;
  reg [6:0] celloutsig_1_9z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_46z = !(celloutsig_0_39z ? celloutsig_0_34z[7] : celloutsig_0_24z);
  assign celloutsig_0_59z = !(celloutsig_0_13z ? celloutsig_0_13z : celloutsig_0_41z[3]);
  assign celloutsig_0_62z = !(celloutsig_0_14z[2] ? celloutsig_0_55z[2] : celloutsig_0_61z[2]);
  assign celloutsig_0_39z = ~celloutsig_0_0z;
  assign celloutsig_0_65z = ~celloutsig_0_55z[3];
  assign celloutsig_0_73z = ~celloutsig_0_25z[5];
  assign celloutsig_1_0z = ~in_data[115];
  assign celloutsig_1_5z = ~in_data[102];
  assign celloutsig_1_18z = ~celloutsig_1_1z[6];
  assign celloutsig_0_21z = ~celloutsig_0_30z;
  assign celloutsig_0_0z = ~(in_data[51] ^ in_data[92]);
  assign celloutsig_0_50z = ~(celloutsig_0_30z ^ celloutsig_0_16z[3]);
  assign celloutsig_0_33z = celloutsig_0_14z[13:8] + celloutsig_0_29z[5:0];
  assign celloutsig_0_61z = { celloutsig_0_17z, celloutsig_0_6z, celloutsig_0_19z } + { celloutsig_0_51z, celloutsig_0_57z, celloutsig_0_30z };
  assign celloutsig_1_1z = { in_data[148:142], celloutsig_1_0z, celloutsig_1_0z } + in_data[111:103];
  assign celloutsig_0_34z = celloutsig_0_14z[12:3] / { 1'h1, celloutsig_0_33z[4:0], celloutsig_0_31z };
  assign celloutsig_0_78z = { in_data[93:85], celloutsig_0_51z } / { 1'h1, celloutsig_0_34z[5:0], celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_58z };
  assign celloutsig_0_32z = celloutsig_0_14z[9:4] == { celloutsig_0_4z[2], celloutsig_0_7z, celloutsig_0_39z, celloutsig_0_1z };
  assign celloutsig_0_64z = { celloutsig_0_63z, celloutsig_0_28z, celloutsig_0_46z, celloutsig_0_27z } == in_data[7:4];
  assign celloutsig_0_28z = celloutsig_0_20z[21:0] == in_data[81:60];
  assign celloutsig_0_45z = { celloutsig_0_34z[6:5], celloutsig_0_1z, celloutsig_0_21z } > celloutsig_0_16z[5:0];
  assign celloutsig_0_51z = celloutsig_0_38z[3:1] > celloutsig_0_20z[31:29];
  assign celloutsig_0_7z = in_data[22:17] > in_data[8:3];
  assign celloutsig_0_22z = in_data[93:83] > celloutsig_0_20z[21:11];
  assign celloutsig_0_35z = { celloutsig_0_2z[1:0], celloutsig_0_24z } <= celloutsig_0_33z[4:2];
  assign celloutsig_0_42z = { celloutsig_0_14z[11:5], celloutsig_0_16z } <= { celloutsig_0_16z[6:0], celloutsig_0_29z, celloutsig_0_7z };
  assign celloutsig_0_58z = { celloutsig_0_12z[9], celloutsig_0_39z, celloutsig_0_21z, celloutsig_0_26z, celloutsig_0_28z } <= { celloutsig_0_20z[8:6], celloutsig_0_45z, celloutsig_0_42z };
  assign celloutsig_0_80z = { celloutsig_0_47z, celloutsig_0_61z, celloutsig_0_63z, celloutsig_0_68z, celloutsig_0_58z, celloutsig_0_27z } <= { celloutsig_0_16z[4:0], celloutsig_0_77z, celloutsig_0_57z, celloutsig_0_13z, celloutsig_0_50z, celloutsig_0_28z };
  assign celloutsig_0_94z = { celloutsig_0_81z[13:4], celloutsig_0_68z, celloutsig_0_62z, celloutsig_0_19z, celloutsig_0_52z, celloutsig_0_73z, celloutsig_0_50z } <= { celloutsig_0_43z[6:3], celloutsig_0_86z, celloutsig_0_35z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_28z, celloutsig_0_78z, celloutsig_0_39z };
  assign celloutsig_0_15z = { celloutsig_0_2z, celloutsig_0_8z } <= celloutsig_0_12z[6:2];
  assign celloutsig_0_18z = celloutsig_0_14z[10:5] <= { celloutsig_0_12z[13:9], celloutsig_0_6z };
  assign celloutsig_0_53z = celloutsig_0_37z & ~(celloutsig_0_32z);
  assign celloutsig_0_6z = celloutsig_0_39z & ~(celloutsig_0_1z[0]);
  assign celloutsig_1_3z = celloutsig_1_1z[8] & ~(celloutsig_1_2z);
  assign celloutsig_0_17z = celloutsig_0_0z & ~(celloutsig_0_39z);
  assign celloutsig_0_47z = { celloutsig_0_16z[8:1], celloutsig_0_31z, celloutsig_0_6z, celloutsig_0_45z, celloutsig_0_45z, celloutsig_0_26z, celloutsig_0_23z } != { celloutsig_0_14z[7:3], celloutsig_0_39z, celloutsig_0_11z, celloutsig_0_21z, celloutsig_0_43z, celloutsig_0_33z, celloutsig_0_40z, celloutsig_0_17z, celloutsig_0_0z, celloutsig_0_24z, celloutsig_0_39z, celloutsig_0_11z, celloutsig_0_19z, celloutsig_0_43z, celloutsig_0_13z, celloutsig_0_37z };
  assign celloutsig_0_8z = { celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_2z } != { in_data[16:8], celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_6z };
  assign celloutsig_1_2z = { in_data[166:156], celloutsig_1_0z, celloutsig_1_0z } !== in_data[117:105];
  assign celloutsig_0_44z = & { celloutsig_0_34z[8:4], celloutsig_0_33z, celloutsig_0_28z, celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_4z[3:0], celloutsig_0_0z };
  assign celloutsig_0_30z = & celloutsig_0_4z[3:0];
  assign celloutsig_0_57z = & celloutsig_0_29z[4:2];
  assign celloutsig_0_86z = & { celloutsig_0_51z, celloutsig_0_10z[3:1], celloutsig_0_2z };
  assign celloutsig_0_87z = & { celloutsig_0_41z[3:2], celloutsig_0_27z, celloutsig_0_10z, celloutsig_0_0z };
  assign celloutsig_0_99z = & { celloutsig_0_94z, celloutsig_0_29z[7:5], celloutsig_0_27z };
  assign celloutsig_0_11z = & { celloutsig_0_39z, celloutsig_0_10z[5:4], celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_4z[3:0], celloutsig_0_2z };
  assign celloutsig_0_19z = & { celloutsig_0_39z, celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_2z };
  assign celloutsig_1_19z = ^ celloutsig_1_9z[6:4];
  assign celloutsig_0_13z = ^ { celloutsig_0_10z[3:0], celloutsig_0_21z, celloutsig_0_30z, celloutsig_0_1z };
  assign celloutsig_0_55z = { celloutsig_0_21z, celloutsig_0_17z, celloutsig_0_31z, celloutsig_0_18z } <<< { in_data[14:9], celloutsig_0_27z };
  assign celloutsig_0_68z = celloutsig_0_14z[7:5] <<< { celloutsig_0_62z, celloutsig_0_11z, celloutsig_0_18z };
  assign celloutsig_1_6z = { celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z } <<< { celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_0_2z = { celloutsig_0_1z, celloutsig_0_0z } <<< { celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_88z = { celloutsig_0_81z[11], celloutsig_0_32z, celloutsig_0_57z, celloutsig_0_8z } - { celloutsig_0_87z, celloutsig_0_59z, celloutsig_0_64z, celloutsig_0_0z };
  assign celloutsig_0_10z = { in_data[3:0], celloutsig_0_21z, celloutsig_0_30z } - { in_data[14:13], celloutsig_0_2z };
  assign celloutsig_0_14z = { celloutsig_0_4z[8:0], celloutsig_0_21z, celloutsig_0_2z } - { in_data[17], celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_39z, celloutsig_0_30z, celloutsig_0_39z, celloutsig_0_30z };
  assign celloutsig_0_38z = { in_data[81:68], celloutsig_0_19z, celloutsig_0_29z } ~^ { celloutsig_0_29z[5:0], celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_16z };
  assign celloutsig_0_40z = celloutsig_0_12z[6:4] ~^ { celloutsig_0_34z[8], celloutsig_0_24z, celloutsig_0_32z };
  assign celloutsig_0_41z = { celloutsig_0_2z[1], celloutsig_0_24z, celloutsig_0_6z, celloutsig_0_1z } ~^ { celloutsig_0_33z[2:0], celloutsig_0_30z, celloutsig_0_32z, celloutsig_0_35z };
  assign celloutsig_0_43z = { celloutsig_0_38z[9:6], celloutsig_0_22z, celloutsig_0_24z, celloutsig_0_21z } ~^ { celloutsig_0_12z[10:5], celloutsig_0_0z };
  assign celloutsig_0_98z = { celloutsig_0_78z[8:1], celloutsig_0_53z } ~^ { celloutsig_0_35z, celloutsig_0_58z, celloutsig_0_65z, celloutsig_0_88z, celloutsig_0_94z, celloutsig_0_47z };
  assign celloutsig_0_1z = { in_data[50], celloutsig_0_0z, celloutsig_0_0z } ~^ in_data[33:31];
  assign celloutsig_0_16z = { celloutsig_0_10z[3:2], celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_30z } ~^ { celloutsig_0_12z[16:13], celloutsig_0_2z, celloutsig_0_39z };
  assign celloutsig_0_25z = { celloutsig_0_14z[3], celloutsig_0_7z, celloutsig_0_24z, celloutsig_0_39z, celloutsig_0_0z, celloutsig_0_2z } ~^ { celloutsig_0_23z[17:16], celloutsig_0_30z, celloutsig_0_1z, celloutsig_0_21z, celloutsig_0_21z, celloutsig_0_6z };
  assign celloutsig_0_31z = { celloutsig_0_2z[3], celloutsig_0_0z, celloutsig_0_22z, celloutsig_0_19z } ~^ celloutsig_0_16z[3:0];
  always_latch
    if (clkin_data[96]) celloutsig_0_4z = 10'h000;
    else if (clkin_data[32]) celloutsig_0_4z = in_data[63:54];
  always_latch
    if (!celloutsig_1_1z[6]) celloutsig_0_52z = 3'h0;
    else if (!clkin_data[32]) celloutsig_0_52z = celloutsig_0_1z;
  always_latch
    if (clkin_data[96]) celloutsig_0_81z = 15'h0000;
    else if (!clkin_data[32]) celloutsig_0_81z = { celloutsig_0_52z[1:0], celloutsig_0_16z, celloutsig_0_73z, celloutsig_0_47z, celloutsig_0_80z, celloutsig_0_44z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_9z = 7'h00;
    else if (clkin_data[64]) celloutsig_1_9z = { in_data[170:169], celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_5z };
  always_latch
    if (!celloutsig_1_1z[6]) celloutsig_0_12z = 17'h00000;
    else if (!clkin_data[32]) celloutsig_0_12z = { celloutsig_0_4z[0], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_39z, celloutsig_0_39z, celloutsig_0_21z, celloutsig_0_21z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_20z = 32'd0;
    else if (!clkin_data[0]) celloutsig_0_20z = { celloutsig_0_4z[4:3], celloutsig_0_30z, celloutsig_0_21z, celloutsig_0_30z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_21z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_23z = 23'h000000;
    else if (!clkin_data[0]) celloutsig_0_23z = { celloutsig_0_14z[11:7], celloutsig_0_17z, celloutsig_0_12z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_29z = 8'h00;
    else if (!clkin_data[0]) celloutsig_0_29z = { celloutsig_0_23z[20:17], celloutsig_0_24z, celloutsig_0_22z, celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_0_37z = ~((celloutsig_0_25z[0] & celloutsig_0_25z[4]) | (celloutsig_0_30z & celloutsig_0_23z[20]));
  assign celloutsig_0_63z = ~((celloutsig_0_50z & celloutsig_0_6z) | (celloutsig_0_22z & celloutsig_0_21z));
  assign celloutsig_0_77z = ~((celloutsig_0_24z & celloutsig_0_41z[5]) | (celloutsig_0_33z[4] & celloutsig_0_61z[1]));
  assign celloutsig_0_24z = ~((celloutsig_0_10z[5] & celloutsig_0_39z) | (celloutsig_0_2z[3] & celloutsig_0_13z));
  assign celloutsig_0_26z = ~((celloutsig_0_8z & celloutsig_0_15z) | (celloutsig_0_7z & celloutsig_0_1z[1]));
  assign celloutsig_0_27z = ~((celloutsig_0_10z[4] & celloutsig_0_1z[2]) | (celloutsig_0_8z & in_data[89]));
  assign { out_data[128], out_data[96], out_data[40:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_98z, celloutsig_0_99z };
endmodule
