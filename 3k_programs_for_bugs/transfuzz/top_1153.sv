/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [3:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [5:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  reg [5:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [2:0] celloutsig_0_25z;
  wire [17:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [4:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [4:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [3:0] celloutsig_0_33z;
  wire [4:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [2:0] celloutsig_0_42z;
  wire [2:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire [2:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire [22:0] celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire [3:0] celloutsig_0_55z;
  wire celloutsig_0_57z;
  wire celloutsig_0_59z;
  wire [9:0] celloutsig_0_5z;
  wire [5:0] celloutsig_0_60z;
  wire celloutsig_0_65z;
  wire [11:0] celloutsig_0_66z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_81z;
  wire [4:0] celloutsig_0_82z;
  wire celloutsig_0_83z;
  reg [12:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  reg [18:0] celloutsig_1_0z;
  wire celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [17:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [8:0] celloutsig_1_4z;
  wire [16:0] celloutsig_1_5z;
  wire [3:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_37z = !(celloutsig_0_17z ? celloutsig_0_4z : celloutsig_0_24z);
  assign celloutsig_0_39z = !(celloutsig_0_35z ? celloutsig_0_0z : celloutsig_0_4z);
  assign celloutsig_0_40z = !(celloutsig_0_35z ? celloutsig_0_0z : celloutsig_0_2z);
  assign celloutsig_0_44z = !(celloutsig_0_32z ? celloutsig_0_10z[3] : celloutsig_0_34z[3]);
  assign celloutsig_1_1z = !(celloutsig_1_0z[6] ? celloutsig_1_0z[16] : celloutsig_1_0z[6]);
  assign celloutsig_1_3z = !(celloutsig_1_0z[15] ? celloutsig_1_1z : celloutsig_1_1z);
  assign celloutsig_1_7z = !(celloutsig_1_0z[13] ? celloutsig_1_1z : celloutsig_1_5z[15]);
  assign celloutsig_1_9z = !(celloutsig_1_6z[0] ? celloutsig_1_0z[10] : celloutsig_1_4z[1]);
  assign celloutsig_0_12z = !(celloutsig_0_4z ? celloutsig_0_7z : celloutsig_0_8z[3]);
  assign celloutsig_0_16z = !(celloutsig_0_0z ? celloutsig_0_6z : celloutsig_0_3z);
  assign celloutsig_0_17z = !(celloutsig_0_15z ? celloutsig_0_7z : celloutsig_0_11z);
  assign celloutsig_0_19z = !(celloutsig_0_11z ? celloutsig_0_4z : celloutsig_0_11z);
  assign celloutsig_0_28z = !(celloutsig_0_22z ? celloutsig_0_21z[0] : celloutsig_0_7z);
  assign celloutsig_0_31z = !(in_data[79] ? celloutsig_0_8z[6] : in_data[43]);
  assign celloutsig_0_6z = ~celloutsig_0_3z;
  assign celloutsig_0_83z = ~celloutsig_0_57z;
  assign celloutsig_0_4z = ~(celloutsig_0_1z ^ in_data[54]);
  assign celloutsig_1_2z = ~(celloutsig_1_0z[6] ^ celloutsig_1_0z[16]);
  assign celloutsig_1_14z = ~(celloutsig_1_1z ^ celloutsig_1_12z);
  assign celloutsig_0_13z = ~(celloutsig_0_0z ^ celloutsig_0_2z);
  assign celloutsig_0_5z = { in_data[19:13], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_2z } & { in_data[55:50], celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_0_14z = celloutsig_0_8z[7:2] / { 1'h1, celloutsig_0_10z[2:0], celloutsig_0_4z, celloutsig_0_11z };
  assign celloutsig_0_30z = { celloutsig_0_14z[3:0], celloutsig_0_3z } / { 1'h1, celloutsig_0_17z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_20z };
  assign celloutsig_1_15z = in_data[147:137] === { celloutsig_1_4z, celloutsig_1_9z, celloutsig_1_7z };
  assign celloutsig_0_38z = celloutsig_0_10z[3:1] >= { celloutsig_0_30z[3], celloutsig_0_28z, celloutsig_0_6z };
  assign celloutsig_0_7z = { in_data[8:1], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_6z } >= { celloutsig_0_5z[9:1], celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_0_1z = in_data[91:88] >= in_data[72:69];
  assign celloutsig_0_35z = { celloutsig_0_25z[2], celloutsig_0_4z, celloutsig_0_1z } <= { celloutsig_0_14z[5:4], celloutsig_0_7z };
  assign celloutsig_0_47z = celloutsig_0_8z[11:0] <= { celloutsig_0_43z, celloutsig_0_13z, celloutsig_0_41z, celloutsig_0_19z, celloutsig_0_13z, celloutsig_0_29z };
  assign celloutsig_0_52z = celloutsig_0_51z[13:9] <= { celloutsig_0_21z[3], celloutsig_0_12z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_28z };
  assign celloutsig_0_24z = { celloutsig_0_10z, celloutsig_0_7z } <= { celloutsig_0_5z[9:6], celloutsig_0_2z };
  assign celloutsig_0_32z = { celloutsig_0_5z[6:2], celloutsig_0_19z, celloutsig_0_15z } && { celloutsig_0_22z, celloutsig_0_27z, celloutsig_0_29z };
  assign celloutsig_0_53z = { celloutsig_0_46z[1:0], celloutsig_0_52z } && { celloutsig_0_20z, celloutsig_0_28z, celloutsig_0_17z };
  assign celloutsig_0_57z = { celloutsig_0_10z, celloutsig_0_53z, celloutsig_0_4z, celloutsig_0_25z, celloutsig_0_52z, celloutsig_0_27z, celloutsig_0_54z, celloutsig_0_43z, celloutsig_0_24z } && { celloutsig_0_51z[13:1], celloutsig_0_23z, celloutsig_0_9z, celloutsig_0_28z };
  assign celloutsig_0_11z = { in_data[24], celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_3z } && { in_data[50:48], celloutsig_0_9z };
  assign celloutsig_0_20z = { celloutsig_0_8z[10:0], celloutsig_0_6z } && { celloutsig_0_8z[9:8], celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_17z };
  assign celloutsig_0_23z = { celloutsig_0_14z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_22z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_0z } && { in_data[57:46], celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_17z };
  assign celloutsig_0_36z = ! { celloutsig_0_27z, celloutsig_0_20z, celloutsig_0_35z, celloutsig_0_2z };
  assign celloutsig_0_41z = ! { celloutsig_0_26z[9:3], celloutsig_0_16z };
  assign celloutsig_0_3z = ! { in_data[43:25], celloutsig_0_0z };
  assign celloutsig_0_45z = in_data[94:89] || { celloutsig_0_44z, celloutsig_0_35z, celloutsig_0_9z, celloutsig_0_27z, celloutsig_0_37z, celloutsig_0_38z };
  assign celloutsig_0_22z = { celloutsig_0_8z[12:4], celloutsig_0_15z, celloutsig_0_13z } || { celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_17z, celloutsig_0_11z, celloutsig_0_19z, celloutsig_0_4z, celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_16z };
  assign celloutsig_0_0z = in_data[35:33] < in_data[77:75];
  assign celloutsig_0_48z = { celloutsig_0_43z[2:1], celloutsig_0_40z, celloutsig_0_2z, celloutsig_0_46z, celloutsig_0_4z, celloutsig_0_28z, celloutsig_0_16z } < { celloutsig_0_39z, celloutsig_0_31z, celloutsig_0_30z, celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_47z };
  assign celloutsig_0_81z = { celloutsig_0_15z, celloutsig_0_65z, celloutsig_0_6z, celloutsig_0_17z, celloutsig_0_7z, celloutsig_0_59z } < celloutsig_0_66z[7:2];
  assign celloutsig_1_8z = celloutsig_1_5z[3:1] < celloutsig_1_0z[16:14];
  assign celloutsig_1_4z = { celloutsig_1_0z[12:5], celloutsig_1_3z } * { celloutsig_1_0z[11:6], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_10z = { celloutsig_0_8z[8:6], celloutsig_0_6z } * celloutsig_0_5z[8:5];
  assign celloutsig_0_59z = { celloutsig_0_26z[7:6], celloutsig_0_12z } != { celloutsig_0_40z, celloutsig_0_24z, celloutsig_0_31z };
  assign celloutsig_0_9z = { celloutsig_0_8z[12:6], celloutsig_0_1z } != celloutsig_0_5z[8:1];
  assign celloutsig_0_15z = celloutsig_0_5z[6:1] != { celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_3z };
  assign celloutsig_0_54z = { celloutsig_0_25z[2:1], celloutsig_0_34z, celloutsig_0_6z, celloutsig_0_44z, celloutsig_0_35z, celloutsig_0_14z, celloutsig_0_18z, celloutsig_0_23z, celloutsig_0_39z } !== { celloutsig_0_51z[18:16], celloutsig_0_8z, celloutsig_0_47z, celloutsig_0_18z, celloutsig_0_37z };
  assign celloutsig_0_65z = { celloutsig_0_26z[15], celloutsig_0_39z, celloutsig_0_43z } !== { celloutsig_0_60z[5:3], celloutsig_0_57z, celloutsig_0_35z };
  assign celloutsig_0_27z = { celloutsig_0_21z[3:0], celloutsig_0_1z, celloutsig_0_4z } !== { celloutsig_0_25z, celloutsig_0_25z };
  assign celloutsig_0_60z = { celloutsig_0_8z[4:0], celloutsig_0_32z } | { celloutsig_0_33z[1:0], celloutsig_0_45z, celloutsig_0_57z, celloutsig_0_52z, celloutsig_0_6z };
  assign celloutsig_0_26z = { celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_17z, celloutsig_0_22z, celloutsig_0_24z, celloutsig_0_25z, celloutsig_0_5z } | { celloutsig_0_8z[12:3], celloutsig_0_24z, celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_6z };
  assign celloutsig_0_29z = { celloutsig_0_23z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_7z } | { celloutsig_0_14z[2:1], celloutsig_0_3z, celloutsig_0_27z, celloutsig_0_28z };
  assign celloutsig_0_18z = & { celloutsig_0_15z, celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_8z[11:8], celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_1_12z = | { celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_8z };
  assign celloutsig_1_18z = | { celloutsig_1_4z[5:3], celloutsig_1_14z };
  assign celloutsig_0_2z = | { in_data[45:44], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_82z = { celloutsig_0_55z, celloutsig_0_32z } <<< { celloutsig_0_53z, celloutsig_0_42z, celloutsig_0_81z };
  assign celloutsig_1_5z = celloutsig_1_0z[17:1] <<< in_data[157:141];
  assign celloutsig_0_25z = { celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_13z } <<< { celloutsig_0_10z[2], celloutsig_0_9z, celloutsig_0_7z };
  assign celloutsig_0_46z = { celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_32z } - { celloutsig_0_30z[3:2], celloutsig_0_20z };
  assign celloutsig_0_51z = { celloutsig_0_8z[10:5], celloutsig_0_31z, celloutsig_0_36z, celloutsig_0_13z, celloutsig_0_19z, celloutsig_0_39z, celloutsig_0_19z, celloutsig_0_33z, celloutsig_0_28z, celloutsig_0_43z, celloutsig_0_25z } - { in_data[25:12], celloutsig_0_36z, celloutsig_0_36z, celloutsig_0_19z, celloutsig_0_38z, celloutsig_0_31z, celloutsig_0_47z, celloutsig_0_22z, celloutsig_0_13z, celloutsig_0_48z };
  assign celloutsig_1_6z = { celloutsig_1_0z[3:1], celloutsig_1_2z } - celloutsig_1_5z[3:0];
  assign celloutsig_1_19z = { celloutsig_1_0z[14:4], celloutsig_1_15z, celloutsig_1_15z, celloutsig_1_9z, celloutsig_1_18z, celloutsig_1_15z, celloutsig_1_12z, celloutsig_1_18z } - { in_data[112:99], celloutsig_1_6z };
  assign celloutsig_0_55z = { celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_48z, celloutsig_0_2z } ~^ celloutsig_0_8z[5:2];
  assign celloutsig_0_66z = { celloutsig_0_43z[2:1], celloutsig_0_39z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_14z, celloutsig_0_57z } ~^ { celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_22z, celloutsig_0_9z, celloutsig_0_42z, celloutsig_0_47z, celloutsig_0_52z };
  assign celloutsig_0_33z = { celloutsig_0_25z[2:1], celloutsig_0_2z, celloutsig_0_7z } ^ in_data[76:73];
  assign celloutsig_0_34z = { in_data[94:93], celloutsig_0_19z, celloutsig_0_19z, celloutsig_0_17z } ^ { celloutsig_0_3z, celloutsig_0_28z, celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_32z };
  assign celloutsig_0_42z = { celloutsig_0_8z[1], celloutsig_0_15z, celloutsig_0_32z } ^ { celloutsig_0_34z[2:1], celloutsig_0_18z };
  assign celloutsig_0_43z = celloutsig_0_25z ^ { celloutsig_0_10z[3], celloutsig_0_19z, celloutsig_0_6z };
  always_latch
    if (clkin_data[32]) celloutsig_0_8z = 13'h0000;
    else if (celloutsig_1_19z[0]) celloutsig_0_8z = { in_data[74:64], celloutsig_0_7z, celloutsig_0_2z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_0z = 19'h00000;
    else if (!clkin_data[0]) celloutsig_1_0z = in_data[167:149];
  always_latch
    if (clkin_data[32]) celloutsig_0_21z = 6'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_21z = celloutsig_0_8z[10:5];
  assign { out_data[128], out_data[113:96], out_data[36:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_82z, celloutsig_0_83z };
endmodule
