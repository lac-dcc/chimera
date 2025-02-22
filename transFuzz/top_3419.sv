/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  reg [2:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [10:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  reg [9:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [9:0] celloutsig_0_24z;
  wire [7:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [6:0] celloutsig_0_29z;
  wire [35:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [6:0] celloutsig_0_35z;
  wire [18:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [8:0] celloutsig_0_39z;
  wire [2:0] celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_54z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire [4:0] celloutsig_0_63z;
  wire celloutsig_0_65z;
  wire celloutsig_0_67z;
  wire [3:0] celloutsig_0_6z;
  wire [20:0] celloutsig_0_70z;
  wire celloutsig_0_72z;
  wire celloutsig_0_73z;
  wire celloutsig_0_74z;
  wire [4:0] celloutsig_0_75z;
  wire [2:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [4:0] celloutsig_0_9z;
  reg [19:0] celloutsig_1_0z;
  wire [5:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  reg [6:0] celloutsig_1_2z;
  wire [5:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [6:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_58z = celloutsig_0_42z ? celloutsig_0_25z[3] : celloutsig_0_51z;
  assign celloutsig_0_74z = celloutsig_0_6z[3] ? celloutsig_0_27z : celloutsig_0_5z;
  assign celloutsig_0_8z = celloutsig_0_2z[12] ? celloutsig_0_5z : celloutsig_0_0z;
  assign celloutsig_0_28z = celloutsig_0_13z ? celloutsig_0_13z : celloutsig_0_23z;
  assign celloutsig_0_42z = ~((celloutsig_0_29z[1] | celloutsig_0_38z) & celloutsig_0_19z);
  assign celloutsig_0_5z = ~((celloutsig_0_3z[2] | celloutsig_0_1z[6]) & (in_data[78] | celloutsig_0_2z[18]));
  assign celloutsig_1_18z = ~((celloutsig_1_15z | celloutsig_1_2z[2]) & (celloutsig_1_5z[0] | celloutsig_1_3z[2]));
  assign celloutsig_0_26z = ~((celloutsig_0_8z | celloutsig_0_4z) & (celloutsig_0_23z | celloutsig_0_12z));
  assign celloutsig_0_43z = celloutsig_0_34z | ~(celloutsig_0_29z[0]);
  assign celloutsig_0_48z = celloutsig_0_1z[6] | ~(celloutsig_0_5z);
  assign celloutsig_0_13z = celloutsig_0_7z[0] | ~(celloutsig_0_6z[3]);
  assign celloutsig_0_17z = celloutsig_0_4z | ~(celloutsig_0_14z[2]);
  assign celloutsig_0_27z = celloutsig_0_3z[2] | ~(celloutsig_0_14z[2]);
  assign celloutsig_0_31z = celloutsig_0_26z | ~(celloutsig_0_18z[1]);
  assign celloutsig_1_4z = celloutsig_1_1z[1] | in_data[163];
  assign celloutsig_1_9z = celloutsig_1_2z[0] | celloutsig_1_4z;
  assign celloutsig_0_10z = in_data[59] | celloutsig_0_3z[1];
  assign celloutsig_0_46z = ~(celloutsig_0_4z ^ celloutsig_0_12z);
  assign celloutsig_0_61z = ~(celloutsig_0_38z ^ celloutsig_0_11z);
  assign celloutsig_0_70z = { celloutsig_0_59z, celloutsig_0_20z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_27z, celloutsig_0_5z, celloutsig_0_30z, celloutsig_0_22z, celloutsig_0_26z, celloutsig_0_45z, celloutsig_0_59z } & { in_data[41:26], celloutsig_0_58z, celloutsig_0_3z, celloutsig_0_48z };
  assign celloutsig_0_75z = { celloutsig_0_73z, celloutsig_0_31z, celloutsig_0_65z, celloutsig_0_4z, celloutsig_0_72z } & { celloutsig_0_63z[3:2], celloutsig_0_54z, celloutsig_0_4z, celloutsig_0_27z };
  assign celloutsig_1_3z = { celloutsig_1_0z[6:4], celloutsig_1_1z } & { celloutsig_1_0z[11:9], celloutsig_1_1z };
  assign celloutsig_1_10z = celloutsig_1_5z[6:1] & celloutsig_1_5z[6:1];
  assign celloutsig_0_2z = { in_data[48:16], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } & in_data[36:1];
  assign celloutsig_1_15z = celloutsig_1_5z[4:0] == celloutsig_1_10z[4:0];
  assign celloutsig_0_20z = { celloutsig_0_18z[2:1], celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_18z } == { in_data[65:63], celloutsig_0_13z, celloutsig_0_15z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_17z, celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_17z, celloutsig_0_8z };
  assign celloutsig_0_11z = { celloutsig_0_2z[7:2], celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_5z } >= { celloutsig_0_1z[8:1], celloutsig_0_6z, celloutsig_0_10z };
  assign celloutsig_0_30z = celloutsig_0_7z >= in_data[86:84];
  assign celloutsig_0_15z = celloutsig_0_2z[27:24] > { celloutsig_0_11z, celloutsig_0_14z };
  assign celloutsig_0_33z = { celloutsig_0_9z[3:0], celloutsig_0_7z } <= { celloutsig_0_25z[3:2], celloutsig_0_9z };
  assign celloutsig_0_4z = { celloutsig_0_1z[10:1], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_1z } <= celloutsig_0_2z[26:0];
  assign celloutsig_0_59z = ! { celloutsig_0_31z, celloutsig_0_30z, celloutsig_0_11z };
  assign celloutsig_0_65z = celloutsig_0_29z[6:3] < { celloutsig_0_54z, celloutsig_0_42z, celloutsig_0_58z, celloutsig_0_61z };
  assign celloutsig_0_23z = { celloutsig_0_2z[18:17], celloutsig_0_11z, celloutsig_0_10z } < { in_data[84:83], celloutsig_0_11z, celloutsig_0_12z };
  assign celloutsig_0_35z = { celloutsig_0_26z, celloutsig_0_16z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_5z } % { 1'h1, celloutsig_0_25z[4:0], celloutsig_0_0z };
  assign celloutsig_0_36z = { celloutsig_0_4z, celloutsig_0_28z, celloutsig_0_9z, celloutsig_0_28z, celloutsig_0_32z, celloutsig_0_24z } % { 1'h1, celloutsig_0_35z[4:0], celloutsig_0_33z, celloutsig_0_16z, celloutsig_0_29z, celloutsig_0_20z, celloutsig_0_14z };
  assign celloutsig_0_9z = { in_data[46], celloutsig_0_6z } % { 1'h1, celloutsig_0_1z[4:1] };
  assign celloutsig_0_25z = { celloutsig_0_22z[8], celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_13z } % { 1'h1, celloutsig_0_22z[0], celloutsig_0_7z, celloutsig_0_19z, celloutsig_0_15z, celloutsig_0_8z };
  assign celloutsig_0_3z = in_data[19:17] * celloutsig_0_1z[7:5];
  assign celloutsig_0_39z = - { in_data[76], celloutsig_0_4z, celloutsig_0_15z, celloutsig_0_38z, celloutsig_0_26z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_26z };
  assign celloutsig_0_7z = - { celloutsig_0_1z[2], celloutsig_0_5z, celloutsig_0_5z };
  assign celloutsig_0_51z = { celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_20z } !== { celloutsig_0_35z[4], celloutsig_0_43z, celloutsig_0_42z, celloutsig_0_35z, celloutsig_0_45z, celloutsig_0_50z };
  assign celloutsig_0_63z = ~ celloutsig_0_36z[14:10];
  assign celloutsig_0_24z = ~ { celloutsig_0_22z[9:3], celloutsig_0_7z };
  assign celloutsig_0_0z = & in_data[64:60];
  assign celloutsig_0_45z = & celloutsig_0_29z[4:0];
  assign celloutsig_0_73z = & { celloutsig_0_70z[20:4], celloutsig_0_67z, celloutsig_0_50z, celloutsig_0_38z, celloutsig_0_27z, celloutsig_0_13z };
  assign celloutsig_0_19z = & { celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_4z };
  assign celloutsig_0_54z = | { celloutsig_0_47z, celloutsig_0_19z, celloutsig_0_17z };
  assign celloutsig_0_72z = | { celloutsig_0_36z[6], celloutsig_0_39z, celloutsig_0_13z, celloutsig_0_67z };
  assign celloutsig_0_12z = | { celloutsig_0_9z, celloutsig_0_4z };
  assign celloutsig_0_16z = | { in_data[70:69], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_15z, celloutsig_0_15z };
  assign celloutsig_0_32z = | { celloutsig_0_2z[23:16], celloutsig_0_4z };
  assign celloutsig_1_6z = celloutsig_1_4z & celloutsig_1_5z[3];
  assign celloutsig_0_50z = | { celloutsig_0_46z, celloutsig_0_42z, celloutsig_0_35z, in_data[38] };
  assign celloutsig_1_11z = | { celloutsig_1_10z[3:0], celloutsig_1_9z };
  assign celloutsig_0_34z = ~^ { in_data[81:67], celloutsig_0_5z };
  assign celloutsig_0_37z = ~^ { celloutsig_0_35z[5], celloutsig_0_24z };
  assign celloutsig_0_47z = ~^ { celloutsig_0_25z[6:0], celloutsig_0_12z, celloutsig_0_3z };
  assign celloutsig_0_6z = { celloutsig_0_2z[6:4], celloutsig_0_0z } >> celloutsig_0_1z[3:0];
  assign celloutsig_1_1z = in_data[151:149] >> celloutsig_1_0z[14:12];
  assign celloutsig_0_14z = celloutsig_0_3z >>> celloutsig_0_9z[2:0];
  assign celloutsig_1_5z = in_data[117:111] ^ { celloutsig_1_3z[5:1], celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_1z = in_data[32:22] ^ in_data[27:17];
  assign celloutsig_0_29z = { celloutsig_0_25z[5:0], celloutsig_0_11z } ^ celloutsig_0_22z[6:0];
  always_latch
    if (clkin_data[128]) celloutsig_1_0z = 20'h00000;
    else if (clkin_data[0]) celloutsig_1_0z = in_data[168:149];
  always_latch
    if (clkin_data[96]) celloutsig_1_2z = 7'h00;
    else if (clkin_data[32]) celloutsig_1_2z = { celloutsig_1_1z[2], celloutsig_1_1z, celloutsig_1_1z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_18z = 3'h0;
    else if (!celloutsig_1_18z) celloutsig_0_18z = { celloutsig_0_7z[2:1], celloutsig_0_17z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_22z = 10'h000;
    else if (!celloutsig_1_18z) celloutsig_0_22z = { celloutsig_0_19z, celloutsig_0_18z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_18z };
  assign celloutsig_0_38z = ~((celloutsig_0_22z[8] & celloutsig_0_17z) | (celloutsig_0_24z[7] & celloutsig_0_13z));
  assign celloutsig_0_67z = ~((celloutsig_0_37z & celloutsig_0_61z) | (celloutsig_0_14z[1] & celloutsig_0_30z));
  assign celloutsig_1_7z = ~((celloutsig_1_5z[2] & celloutsig_1_0z[3]) | (celloutsig_1_2z[0] & celloutsig_1_6z));
  assign celloutsig_1_19z = ~((celloutsig_1_7z & celloutsig_1_5z[5]) | (celloutsig_1_9z & celloutsig_1_11z));
  assign { out_data[128], out_data[96], out_data[32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_74z, celloutsig_0_75z };
endmodule
