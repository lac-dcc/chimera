/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [3:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [7:0] celloutsig_0_15z;
  wire [8:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [4:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [3:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [9:0] celloutsig_0_25z;
  wire [3:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [7:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [9:0] celloutsig_0_34z;
  wire [17:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  reg [7:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [2:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire [26:0] celloutsig_0_50z;
  wire [5:0] celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire [5:0] celloutsig_0_62z;
  wire celloutsig_0_65z;
  wire [2:0] celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire [5:0] celloutsig_0_73z;
  wire [6:0] celloutsig_0_78z;
  wire celloutsig_0_7z;
  wire celloutsig_0_81z;
  wire celloutsig_0_89z;
  wire [2:0] celloutsig_0_8z;
  wire [6:0] celloutsig_0_91z;
  wire celloutsig_0_92z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [10:0] celloutsig_1_18z;
  reg [7:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [29:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  reg [2:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [8:0] celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_33z = !(celloutsig_0_16z[7] ? celloutsig_0_7z : celloutsig_0_29z);
  assign celloutsig_0_36z = !(celloutsig_0_30z ? celloutsig_0_20z[2] : celloutsig_0_9z);
  assign celloutsig_0_5z = !(celloutsig_0_4z ? in_data[16] : celloutsig_0_4z);
  assign celloutsig_0_55z = !(celloutsig_0_43z ? celloutsig_0_38z[5] : celloutsig_0_13z);
  assign celloutsig_0_56z = !(celloutsig_0_42z ? celloutsig_0_16z[3] : celloutsig_0_2z);
  assign celloutsig_1_4z = !(celloutsig_1_3z ? celloutsig_1_1z : celloutsig_1_2z[21]);
  assign celloutsig_1_9z = !(celloutsig_1_3z ? celloutsig_1_2z[22] : celloutsig_1_6z);
  assign celloutsig_0_14z = !(celloutsig_0_13z ? celloutsig_0_6z : celloutsig_0_2z);
  assign celloutsig_0_32z = !(celloutsig_0_13z ? celloutsig_0_28z : celloutsig_0_26z[2]);
  assign celloutsig_0_43z = ~(celloutsig_0_34z[6] | celloutsig_0_5z);
  assign celloutsig_0_7z = ~(celloutsig_0_0z | in_data[75]);
  assign celloutsig_0_89z = ~((celloutsig_0_58z | in_data[24]) & celloutsig_0_54z);
  assign celloutsig_0_92z = ~((celloutsig_0_89z | celloutsig_0_27z) & celloutsig_0_78z[1]);
  assign celloutsig_1_11z = ~((celloutsig_1_5z[0] | celloutsig_1_1z) & celloutsig_1_3z);
  assign celloutsig_1_12z = ~((celloutsig_1_6z | celloutsig_1_2z[7]) & celloutsig_1_5z[2]);
  assign celloutsig_0_13z = ~((celloutsig_0_7z | celloutsig_0_0z) & celloutsig_0_1z);
  assign celloutsig_1_6z = ~((celloutsig_1_1z | in_data[190]) & (celloutsig_1_1z | celloutsig_1_2z[15]));
  assign celloutsig_0_62z = { celloutsig_0_34z[1], celloutsig_0_8z, celloutsig_0_43z, celloutsig_0_61z } / { 1'h1, celloutsig_0_31z[5:2], celloutsig_0_13z };
  assign celloutsig_0_31z = { celloutsig_0_10z[2:0], celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_5z } / { 1'h1, celloutsig_0_8z[1], celloutsig_0_14z, celloutsig_0_23z, celloutsig_0_29z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_0_39z = { celloutsig_0_9z, celloutsig_0_31z } == { celloutsig_0_26z, celloutsig_0_26z, celloutsig_0_23z };
  assign celloutsig_1_0z = in_data[116:114] == in_data[108:106];
  assign celloutsig_1_3z = { celloutsig_1_2z[8:7], celloutsig_1_1z, celloutsig_1_0z } == celloutsig_1_2z[7:4];
  assign celloutsig_0_21z = { in_data[74:66], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_0z } == { celloutsig_0_15z[5:0], celloutsig_0_17z, celloutsig_0_12z, celloutsig_0_9z };
  assign celloutsig_0_0z = in_data[11:3] === in_data[12:4];
  assign celloutsig_0_42z = { celloutsig_0_34z[9:6], celloutsig_0_2z, celloutsig_0_40z, celloutsig_0_29z, celloutsig_0_37z, celloutsig_0_0z, celloutsig_0_36z } === { celloutsig_0_34z[5:4], celloutsig_0_31z };
  assign celloutsig_0_23z = in_data[9:6] === { celloutsig_0_16z[3], celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_6z };
  assign celloutsig_0_24z = celloutsig_0_16z[6:2] === { celloutsig_0_10z[1:0], celloutsig_0_17z, celloutsig_0_18z, celloutsig_0_2z };
  assign celloutsig_0_17z = { celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_8z } > { celloutsig_0_3z[2:1], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_11z };
  assign celloutsig_0_19z = { celloutsig_0_15z[6:0], celloutsig_0_4z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_11z } > { celloutsig_0_16z[8:2], celloutsig_0_18z, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_28z = { celloutsig_0_26z[0], celloutsig_0_23z, celloutsig_0_11z } > { celloutsig_0_22z[2], celloutsig_0_22z[2], celloutsig_0_22z[0] };
  assign celloutsig_0_58z = { celloutsig_0_38z[7:6], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_39z, celloutsig_0_9z, celloutsig_0_55z, celloutsig_0_23z, celloutsig_0_24z, celloutsig_0_39z, celloutsig_0_14z } && { celloutsig_0_24z, celloutsig_0_25z };
  assign celloutsig_0_37z = ! { celloutsig_0_16z, celloutsig_0_23z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_19z, celloutsig_0_17z };
  assign celloutsig_0_61z = ! { celloutsig_0_55z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_43z, celloutsig_0_56z, celloutsig_0_8z, celloutsig_0_31z };
  assign celloutsig_0_1z = ! in_data[76:60];
  assign celloutsig_0_30z = ! { celloutsig_0_15z[3], celloutsig_0_26z };
  assign celloutsig_0_44z = { celloutsig_0_15z[4:2], celloutsig_0_4z } || { celloutsig_0_31z[5:3], celloutsig_0_19z };
  assign celloutsig_0_65z = celloutsig_0_31z[7:1] || { celloutsig_0_50z[16:14], celloutsig_0_12z };
  assign celloutsig_0_9z = { in_data[42:33], celloutsig_0_0z } < { celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_0_50z = { in_data[45:44], celloutsig_0_48z, celloutsig_0_14z, celloutsig_0_45z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_27z, celloutsig_0_16z, celloutsig_0_48z, celloutsig_0_32z, celloutsig_0_46z, celloutsig_0_32z, celloutsig_0_22z[3:2], celloutsig_0_22z[2], celloutsig_0_22z[0], celloutsig_0_17z, celloutsig_0_33z } * { celloutsig_0_25z[9:1], celloutsig_0_27z, celloutsig_0_11z, celloutsig_0_39z, celloutsig_0_14z, celloutsig_0_27z, celloutsig_0_29z, celloutsig_0_25z, celloutsig_0_46z, celloutsig_0_5z };
  assign celloutsig_0_78z = { in_data[52:51], celloutsig_0_43z, celloutsig_0_65z, celloutsig_0_1z, celloutsig_0_45z, celloutsig_0_11z } * { in_data[53:52], celloutsig_0_65z, celloutsig_0_19z, celloutsig_0_61z, celloutsig_0_13z, celloutsig_0_39z };
  assign celloutsig_1_7z = celloutsig_1_2z[24:16] * { celloutsig_1_2z[19:14], celloutsig_1_5z };
  assign celloutsig_1_8z = celloutsig_1_2z[26:23] * { in_data[112:111], celloutsig_1_4z, celloutsig_1_6z };
  assign celloutsig_0_73z = celloutsig_0_19z ? { celloutsig_0_15z[5:1], celloutsig_0_6z } : { celloutsig_0_12z[2:1], celloutsig_0_14z, celloutsig_0_69z };
  assign celloutsig_0_91z = celloutsig_0_55z ? { celloutsig_0_73z[2:0], celloutsig_0_81z, celloutsig_0_46z, celloutsig_0_41z, celloutsig_0_40z } : { celloutsig_0_16z[4:3], celloutsig_0_19z, celloutsig_0_14z, celloutsig_0_89z, celloutsig_0_33z, celloutsig_0_65z };
  assign celloutsig_0_12z = celloutsig_0_11z ? celloutsig_0_10z : { celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_26z = celloutsig_0_24z ? { celloutsig_0_22z[3:2], celloutsig_0_22z[2], celloutsig_0_22z[0] } : celloutsig_0_20z[3:0];
  assign celloutsig_1_13z = { celloutsig_1_3z, celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_0z } != { celloutsig_1_2z[17:9], celloutsig_1_12z };
  assign celloutsig_0_10z = { celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_6z } | { in_data[94:93], celloutsig_0_9z, celloutsig_0_7z };
  assign celloutsig_0_4z = & { celloutsig_0_3z, in_data[10:7], celloutsig_0_0z };
  assign celloutsig_0_81z = & { celloutsig_0_62z[4:1], celloutsig_0_32z };
  assign celloutsig_0_18z = & { celloutsig_0_16z, celloutsig_0_15z, celloutsig_0_13z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_27z = & { celloutsig_0_24z, celloutsig_0_16z[8], celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_46z = celloutsig_0_21z & celloutsig_0_19z;
  assign celloutsig_0_6z = celloutsig_0_3z[0] & in_data[61];
  assign celloutsig_0_11z = celloutsig_0_7z & celloutsig_0_1z;
  assign celloutsig_0_2z = celloutsig_0_1z & in_data[53];
  assign celloutsig_0_29z = celloutsig_0_11z & celloutsig_0_16z[2];
  assign celloutsig_0_45z = ~^ { celloutsig_0_38z[4:2], celloutsig_0_4z, celloutsig_0_18z };
  assign celloutsig_0_54z = ~^ { celloutsig_0_50z[25:16], celloutsig_0_44z, celloutsig_0_17z, celloutsig_0_40z, celloutsig_0_27z, celloutsig_0_4z };
  assign celloutsig_0_40z = ^ { celloutsig_0_16z[5:2], celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_6z };
  assign celloutsig_0_48z = ^ celloutsig_0_35z[8:2];
  assign celloutsig_1_1z = ^ { in_data[188:145], celloutsig_1_0z };
  assign celloutsig_0_69z = { celloutsig_0_34z[4:3], celloutsig_0_14z } <<< { celloutsig_0_53z[2], celloutsig_0_29z, celloutsig_0_61z };
  assign celloutsig_0_34z = { celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_23z, celloutsig_0_17z, celloutsig_0_2z } >>> { celloutsig_0_1z, celloutsig_0_30z, celloutsig_0_12z, celloutsig_0_10z };
  assign celloutsig_0_8z = { celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_5z } >>> { celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_5z };
  assign celloutsig_0_35z = { celloutsig_0_25z[6:3], celloutsig_0_33z, celloutsig_0_27z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_26z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_23z, celloutsig_0_7z } - { celloutsig_0_19z, celloutsig_0_4z, celloutsig_0_30z, celloutsig_0_7z, celloutsig_0_20z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_32z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_18z };
  assign celloutsig_0_53z = celloutsig_0_35z[15:10] - { celloutsig_0_5z, celloutsig_0_40z, celloutsig_0_48z, celloutsig_0_29z, celloutsig_0_40z, celloutsig_0_0z };
  assign celloutsig_1_2z = in_data[135:106] - { in_data[136:108], celloutsig_1_1z };
  assign celloutsig_1_18z = { celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_4z } - { in_data[185:177], celloutsig_1_3z, celloutsig_1_13z };
  assign celloutsig_0_15z = { celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_13z } - { celloutsig_0_8z[2:1], celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_12z };
  assign celloutsig_0_16z = { celloutsig_0_4z, celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_8z } - { celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_8z };
  assign celloutsig_0_20z = { celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_19z, celloutsig_0_6z, celloutsig_0_4z } - in_data[90:86];
  assign celloutsig_0_3z = { celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z } - { celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_25z = { celloutsig_0_24z, celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_19z } ^ { celloutsig_0_22z[0], celloutsig_0_8z, celloutsig_0_18z, celloutsig_0_11z, celloutsig_0_10z };
  assign celloutsig_0_41z = ~((celloutsig_0_0z & celloutsig_0_9z) | celloutsig_0_27z);
  always_latch
    if (clkin_data[64]) celloutsig_0_38z = 8'h00;
    else if (celloutsig_1_18z[0]) celloutsig_0_38z = { celloutsig_0_35z[17:11], celloutsig_0_37z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_5z = 3'h0;
    else if (clkin_data[0]) celloutsig_1_5z = { celloutsig_1_2z[11:10], celloutsig_1_3z };
  always_latch
    if (clkin_data[96]) celloutsig_1_19z = 8'h00;
    else if (!clkin_data[0]) celloutsig_1_19z = { celloutsig_1_7z[7:1], celloutsig_1_0z };
  assign { celloutsig_0_22z[3:2], celloutsig_0_22z[0] } = { celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_1z } ^ { celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_11z };
  assign celloutsig_0_22z[1] = celloutsig_0_22z[2];
  assign { out_data[138:128], out_data[103:96], out_data[38:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_91z, celloutsig_0_92z };
endmodule
