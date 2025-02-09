/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [15:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [16:0] celloutsig_0_15z;
  wire [4:0] celloutsig_0_16z;
  wire [9:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [9:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  reg [4:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [5:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [9:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [20:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  reg [6:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_46z;
  wire [13:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire [6:0] celloutsig_0_4z;
  wire celloutsig_0_52z;
  wire celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire [53:0] celloutsig_0_63z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_82z;
  wire [25:0] celloutsig_0_83z;
  wire celloutsig_0_8z;
  wire [12:0] celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [14:0] celloutsig_1_16z;
  wire [4:0] celloutsig_1_17z;
  wire [2:0] celloutsig_1_18z;
  wire [5:0] celloutsig_1_19z;
  wire [9:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [3:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [6:0] celloutsig_1_8z;
  wire [7:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_52z = in_data[45] ? celloutsig_0_0z[6] : celloutsig_0_3z[2];
  assign celloutsig_1_6z = celloutsig_1_3z[0] ? celloutsig_1_1z[0] : in_data[167];
  assign celloutsig_0_30z = celloutsig_0_8z ? in_data[84] : celloutsig_0_9z[2];
  assign celloutsig_0_38z = !(in_data[44] ? celloutsig_0_10z : celloutsig_0_14z);
  assign celloutsig_0_8z = !(celloutsig_0_6z ? celloutsig_0_5z : celloutsig_0_6z);
  assign celloutsig_0_82z = !(celloutsig_0_15z[5] ? celloutsig_0_21z : celloutsig_0_28z);
  assign celloutsig_1_11z = !(celloutsig_1_6z ? celloutsig_1_6z : celloutsig_1_4z);
  assign celloutsig_0_18z = !(celloutsig_0_3z[3] ? celloutsig_0_7z : celloutsig_0_1z);
  assign celloutsig_0_2z = !(celloutsig_0_1z ? in_data[50] : celloutsig_0_0z[0]);
  assign celloutsig_0_26z = !(celloutsig_0_22z ? celloutsig_0_12z : celloutsig_0_12z);
  assign celloutsig_0_25z = ~(celloutsig_0_7z | celloutsig_0_8z);
  assign celloutsig_0_46z = ~((celloutsig_0_5z | celloutsig_0_0z[15]) & (celloutsig_0_24z | celloutsig_0_25z));
  assign celloutsig_0_14z = ~((celloutsig_0_0z[9] | celloutsig_0_5z) & (celloutsig_0_5z | celloutsig_0_2z));
  assign celloutsig_0_55z = celloutsig_0_17z[6] | ~(celloutsig_0_46z);
  assign celloutsig_0_28z = celloutsig_0_22z | ~(celloutsig_0_12z);
  assign celloutsig_0_39z = celloutsig_0_15z[15:0] && { celloutsig_0_32z, celloutsig_0_20z, celloutsig_0_28z, celloutsig_0_35z, celloutsig_0_18z, celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_20z };
  assign celloutsig_1_14z = { celloutsig_1_1z[8:6], celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_13z, celloutsig_1_1z } && { celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_13z, celloutsig_1_12z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_6z };
  assign celloutsig_0_36z = ! { celloutsig_0_11z[1:0], celloutsig_0_35z };
  assign celloutsig_0_42z = ! { celloutsig_0_0z[7:0], celloutsig_0_6z, celloutsig_0_33z, celloutsig_0_30z, celloutsig_0_21z, celloutsig_0_31z, celloutsig_0_15z, celloutsig_0_33z, celloutsig_0_40z };
  assign celloutsig_0_5z = ! celloutsig_0_0z[12:0];
  assign celloutsig_1_2z = ! celloutsig_1_1z[9:1];
  assign celloutsig_0_10z = ! { celloutsig_0_9z[12:5], celloutsig_0_2z };
  assign celloutsig_0_12z = ! { celloutsig_0_4z[4:2], celloutsig_0_8z };
  assign celloutsig_1_4z = in_data[179] & ~(in_data[127]);
  assign celloutsig_1_12z = celloutsig_1_0z[0] & ~(celloutsig_1_0z[1]);
  assign celloutsig_0_22z = celloutsig_0_13z & ~(celloutsig_0_19z[8]);
  assign celloutsig_0_32z = celloutsig_0_4z[6] & ~(celloutsig_0_19z[6]);
  assign celloutsig_0_83z = { celloutsig_0_20z, celloutsig_0_16z, celloutsig_0_0z } % { 1'h1, celloutsig_0_63z[50:38], celloutsig_0_8z, celloutsig_0_21z, celloutsig_0_31z };
  assign celloutsig_0_0z = in_data[53:38] % { 1'h1, in_data[81:67] };
  assign celloutsig_0_37z = { celloutsig_0_9z[7:0], celloutsig_0_2z, celloutsig_0_17z, celloutsig_0_32z, celloutsig_0_12z } % { 1'h1, in_data[70:60], celloutsig_0_6z, celloutsig_0_27z, celloutsig_0_4z };
  assign celloutsig_1_16z = { celloutsig_1_1z[7:6], celloutsig_1_8z, celloutsig_1_11z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_2z } % { 1'h1, celloutsig_1_6z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_14z, celloutsig_1_12z };
  assign celloutsig_0_11z = celloutsig_0_0z[15:11] % { 1'h1, celloutsig_0_4z[5:2] };
  assign celloutsig_0_16z = celloutsig_0_11z % { 1'h1, celloutsig_0_9z[1:0], celloutsig_0_14z, celloutsig_0_2z };
  assign celloutsig_0_17z = { celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_10z } % { 1'h1, celloutsig_0_9z[7:0], celloutsig_0_14z };
  assign celloutsig_1_3z = { in_data[175:173], celloutsig_1_2z } * celloutsig_1_0z[4:1];
  assign celloutsig_1_8z = in_data[137:131] * { celloutsig_1_3z[1], celloutsig_1_5z, celloutsig_1_0z };
  assign celloutsig_0_23z = { celloutsig_0_3z[4:1], celloutsig_0_5z, celloutsig_0_13z } * { celloutsig_0_0z[4:1], celloutsig_0_12z, celloutsig_0_6z };
  assign celloutsig_0_63z = celloutsig_0_15z[16] ? { celloutsig_0_9z[12:1], celloutsig_0_38z, celloutsig_0_42z, celloutsig_0_39z, celloutsig_0_22z, celloutsig_0_52z, celloutsig_0_44z, celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_56z, celloutsig_0_46z, celloutsig_0_22z, celloutsig_0_61z, celloutsig_0_59z, celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_13z } : { celloutsig_0_19z[5:3], celloutsig_0_16z, celloutsig_0_55z, celloutsig_0_42z, celloutsig_0_21z, celloutsig_0_48z, celloutsig_0_32z, celloutsig_0_6z, celloutsig_0_37z, celloutsig_0_40z, celloutsig_0_39z, celloutsig_0_22z, celloutsig_0_33z, celloutsig_0_59z, celloutsig_0_33z };
  assign celloutsig_1_0z = in_data[174] ? in_data[163:159] : in_data[185:181];
  assign celloutsig_0_35z = { celloutsig_0_20z[4:3], celloutsig_0_34z } != celloutsig_0_31z[6:4];
  assign celloutsig_1_1z = - in_data[141:132];
  assign celloutsig_0_9z = - { celloutsig_0_0z[10:0], celloutsig_0_8z, celloutsig_0_7z };
  assign celloutsig_1_19z = - celloutsig_1_16z[8:3];
  assign celloutsig_0_19z = - in_data[82:73];
  assign celloutsig_0_31z = - { celloutsig_0_4z[6:1], celloutsig_0_25z, celloutsig_0_13z, celloutsig_0_22z, celloutsig_0_26z };
  assign celloutsig_0_34z = { celloutsig_0_11z[4:2], celloutsig_0_33z, celloutsig_0_1z, celloutsig_0_13z } !== celloutsig_0_15z[14:9];
  assign celloutsig_0_40z = { celloutsig_0_37z[18:6], celloutsig_0_13z, celloutsig_0_7z } !== { celloutsig_0_32z, celloutsig_0_1z, celloutsig_0_23z, celloutsig_0_35z, celloutsig_0_36z, celloutsig_0_38z, celloutsig_0_28z, celloutsig_0_21z, celloutsig_0_21z, celloutsig_0_2z };
  assign celloutsig_0_7z = { celloutsig_0_0z[9:2], celloutsig_0_6z, celloutsig_0_5z } !== in_data[51:42];
  assign celloutsig_1_10z = { celloutsig_1_8z[5:0], celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_0z } !== { celloutsig_1_0z[3:1], celloutsig_1_2z, celloutsig_1_9z, celloutsig_1_3z };
  assign celloutsig_0_13z = celloutsig_0_4z[6:1] !== { celloutsig_0_3z[2], celloutsig_0_11z };
  assign celloutsig_0_1z = celloutsig_0_0z[11:4] !== celloutsig_0_0z[15:8];
  assign celloutsig_0_21z = celloutsig_0_19z[7:5] !== celloutsig_0_4z[6:4];
  assign celloutsig_0_48z = { celloutsig_0_27z, celloutsig_0_14z, celloutsig_0_39z, celloutsig_0_42z, celloutsig_0_32z, celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_21z, celloutsig_0_33z, celloutsig_0_1z } | in_data[25:12];
  assign celloutsig_1_17z = celloutsig_1_1z[8:4] | celloutsig_1_16z[14:10];
  assign celloutsig_0_15z = { celloutsig_0_12z, celloutsig_0_0z } | { celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_0_56z = | { celloutsig_0_11z[4:3], celloutsig_0_19z, celloutsig_0_40z };
  assign celloutsig_0_6z = | { celloutsig_0_3z[4:1], celloutsig_0_0z };
  assign celloutsig_0_24z = | celloutsig_0_19z[4:0];
  assign celloutsig_0_43z = celloutsig_0_39z & celloutsig_0_37z[13];
  assign celloutsig_1_13z = celloutsig_1_3z[3] & celloutsig_1_5z;
  assign celloutsig_0_33z = | in_data[74:72];
  assign celloutsig_0_41z = | { celloutsig_0_21z, celloutsig_0_4z[5:3] };
  assign celloutsig_0_49z = | celloutsig_0_3z[4:0];
  assign celloutsig_1_5z = | celloutsig_1_3z;
  assign celloutsig_0_44z = ^ { celloutsig_0_4z[4:1], celloutsig_0_35z };
  assign celloutsig_0_59z = ^ { in_data[54:44], celloutsig_0_46z, celloutsig_0_43z, celloutsig_0_15z, celloutsig_0_30z };
  assign celloutsig_0_61z = ^ { celloutsig_0_15z[2], celloutsig_0_39z, celloutsig_0_25z, celloutsig_0_19z, celloutsig_0_58z, celloutsig_0_39z, celloutsig_0_41z };
  assign celloutsig_0_27z = ^ { celloutsig_0_15z[14:2], celloutsig_0_25z, celloutsig_0_21z, celloutsig_0_7z, celloutsig_0_22z };
  assign celloutsig_0_4z = celloutsig_0_0z[6:0] <<< celloutsig_0_3z;
  assign celloutsig_1_9z = { celloutsig_1_1z[1], celloutsig_1_8z } <<< in_data[123:116];
  assign celloutsig_1_18z = { celloutsig_1_8z[0], celloutsig_1_13z, celloutsig_1_2z } ^ celloutsig_1_17z[3:1];
  always_latch
    if (clkin_data[0]) celloutsig_0_3z = 7'h00;
    else if (!celloutsig_1_18z[0]) celloutsig_0_3z = celloutsig_0_0z[15:9];
  always_latch
    if (!clkin_data[0]) celloutsig_0_20z = 5'h00;
    else if (celloutsig_1_18z[0]) celloutsig_0_20z = celloutsig_0_17z[8:4];
  assign celloutsig_0_58z = ~((celloutsig_0_32z & celloutsig_0_49z) | (celloutsig_0_26z & celloutsig_0_52z));
  assign { out_data[130:128], out_data[101:96], out_data[32], out_data[25:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_82z, celloutsig_0_83z };
endmodule
