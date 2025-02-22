/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [10:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [2:0] celloutsig_0_18z;
  wire [8:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [11:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [6:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [8:0] celloutsig_0_31z;
  wire [8:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [2:0] celloutsig_0_34z;
  reg [8:0] celloutsig_0_35z;
  reg [16:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [18:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [2:0] celloutsig_0_3z;
  wire [6:0] celloutsig_0_42z;
  wire [5:0] celloutsig_0_45z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [6:0] celloutsig_0_50z;
  wire celloutsig_0_52z;
  wire celloutsig_0_55z;
  wire [4:0] celloutsig_0_5z;
  wire [18:0] celloutsig_0_60z;
  wire [16:0] celloutsig_0_61z;
  wire celloutsig_0_62z;
  wire [7:0] celloutsig_0_64z;
  wire [4:0] celloutsig_0_65z;
  wire [3:0] celloutsig_0_6z;
  wire [3:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire [8:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [15:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ~(in_data[22] & in_data[76]);
  assign celloutsig_1_9z = ~(celloutsig_1_5z & celloutsig_1_1z);
  assign celloutsig_0_26z = ~(celloutsig_0_3z[2] & celloutsig_0_6z[2]);
  assign celloutsig_1_4z = !(celloutsig_1_3z[1] ? celloutsig_1_0z : celloutsig_1_1z);
  assign celloutsig_0_21z = !(celloutsig_0_6z[0] ? celloutsig_0_18z[1] : celloutsig_0_1z);
  assign celloutsig_0_28z = !(celloutsig_0_8z ? celloutsig_0_17z : celloutsig_0_18z[0]);
  assign celloutsig_1_8z = ~(celloutsig_1_1z | in_data[116]);
  assign celloutsig_0_23z = ~celloutsig_0_7z[2];
  assign celloutsig_0_11z = ~((celloutsig_0_0z | celloutsig_0_4z) & celloutsig_0_5z[1]);
  assign celloutsig_0_52z = ~((celloutsig_0_7z[3] | celloutsig_0_45z[5]) & (celloutsig_0_42z[6] | celloutsig_0_28z));
  assign celloutsig_1_18z = ~((celloutsig_1_11z | celloutsig_1_5z) & (celloutsig_1_13z | celloutsig_1_9z));
  assign celloutsig_0_16z = ~((celloutsig_0_14z[0] | celloutsig_0_7z[3]) & (celloutsig_0_6z[0] | celloutsig_0_15z));
  assign celloutsig_1_19z = celloutsig_1_11z ^ celloutsig_1_10z[6];
  assign celloutsig_0_10z = in_data[37] ^ celloutsig_0_7z[0];
  assign celloutsig_1_2z = ~(in_data[129] ^ in_data[161]);
  assign celloutsig_0_42z = { celloutsig_0_22z[7:4], celloutsig_0_22z[4], celloutsig_0_22z[2], celloutsig_0_26z } & { celloutsig_0_19z[7:3], celloutsig_0_1z, celloutsig_0_24z };
  assign celloutsig_1_10z = { celloutsig_1_3z[12:5], celloutsig_1_2z } & { celloutsig_1_3z[11:4], celloutsig_1_2z };
  assign celloutsig_0_29z = { celloutsig_0_14z[1:0], celloutsig_0_26z, celloutsig_0_16z, celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_26z } & { celloutsig_0_7z[1:0], celloutsig_0_17z, celloutsig_0_6z };
  assign celloutsig_0_32z = { celloutsig_0_7z[3:2], celloutsig_0_3z, celloutsig_0_25z, celloutsig_0_24z, celloutsig_0_20z, celloutsig_0_13z } & { celloutsig_0_6z[0], celloutsig_0_18z, celloutsig_0_25z, celloutsig_0_16z, celloutsig_0_3z };
  assign celloutsig_0_3z = { celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z } / { 1'h1, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_38z = { celloutsig_0_14z[9:0], celloutsig_0_35z } / { 1'h1, celloutsig_0_5z[2:0], celloutsig_0_32z, celloutsig_0_17z, celloutsig_0_34z, celloutsig_0_24z, celloutsig_0_25z };
  assign celloutsig_0_60z = { celloutsig_0_28z, celloutsig_0_49z, celloutsig_0_50z[6:2], celloutsig_0_50z[6], celloutsig_0_50z[0], celloutsig_0_31z, celloutsig_0_39z } / { 1'h1, celloutsig_0_35z[5:1], celloutsig_0_21z, celloutsig_0_39z, celloutsig_0_20z, celloutsig_0_50z[6:2], celloutsig_0_50z[6], celloutsig_0_50z[0], celloutsig_0_55z, celloutsig_0_13z, celloutsig_0_10z };
  assign celloutsig_0_49z = celloutsig_0_19z[7:3] === celloutsig_0_31z[6:2];
  assign celloutsig_1_5z = { celloutsig_1_0z, celloutsig_1_1z } === { celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_2z = { in_data[45:43], celloutsig_0_0z } === in_data[77:74];
  assign celloutsig_0_33z = { celloutsig_0_22z[11:4], celloutsig_0_7z, celloutsig_0_25z } === { in_data[74:63], celloutsig_0_7z[2] };
  assign celloutsig_1_13z = { celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_4z } >= { celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_9z, celloutsig_1_2z };
  assign celloutsig_0_12z = { celloutsig_0_4z, celloutsig_0_6z } >= { in_data[16], celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_10z };
  assign celloutsig_0_24z = { celloutsig_0_19z[4:2], celloutsig_0_17z, celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_21z, celloutsig_0_15z } >= { celloutsig_0_14z[3], celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_12z, celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_16z };
  assign celloutsig_0_25z = { in_data[22:17], celloutsig_0_1z } >= { celloutsig_0_5z[2:1], celloutsig_0_11z, celloutsig_0_7z };
  assign celloutsig_0_62z = { celloutsig_0_17z, celloutsig_0_25z, celloutsig_0_37z, celloutsig_0_34z, celloutsig_0_28z } > { celloutsig_0_61z[11], celloutsig_0_61z[9:6], celloutsig_0_52z, celloutsig_0_27z };
  assign celloutsig_0_20z = { celloutsig_0_19z[8:1], celloutsig_0_18z, celloutsig_0_1z, celloutsig_0_16z, celloutsig_0_15z, celloutsig_0_1z } > { celloutsig_0_14z[7:0], celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_39z = { celloutsig_0_5z[3:2], celloutsig_0_32z } <= { celloutsig_0_19z[7], celloutsig_0_32z, celloutsig_0_26z };
  assign celloutsig_1_6z = { in_data[156:142], celloutsig_1_3z } <= { celloutsig_1_3z[8:0], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_4z = ! { in_data[52:43], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_15z = { in_data[12:10], celloutsig_0_2z } < { celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_0z };
  assign celloutsig_0_13z = { celloutsig_0_5z[3:0], celloutsig_0_15z } < { celloutsig_0_5z[2], celloutsig_0_6z };
  assign celloutsig_0_37z = celloutsig_0_0z & ~(celloutsig_0_7z[3]);
  assign celloutsig_0_55z = celloutsig_0_8z & ~(celloutsig_0_15z);
  assign celloutsig_1_11z = in_data[121] & ~(celloutsig_1_2z);
  assign celloutsig_0_27z = celloutsig_0_25z & ~(celloutsig_0_7z[0]);
  assign celloutsig_1_1z = in_data[191:173] != { in_data[170:153], celloutsig_1_0z };
  assign celloutsig_0_8z = { in_data[85:73], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_6z } != { celloutsig_0_7z[2], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_0_1z = in_data[36:33] != in_data[6:3];
  assign celloutsig_0_17z = { in_data[19:15], celloutsig_0_11z } != { celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_16z };
  assign celloutsig_0_6z = ~ { in_data[56:55], celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_7z = ~ in_data[72:69];
  assign celloutsig_1_3z = ~ { in_data[143:131], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_18z = ~ { celloutsig_0_7z[2:1], celloutsig_0_10z };
  assign celloutsig_1_0z = & in_data[122:99];
  assign celloutsig_0_45z = { celloutsig_0_21z, celloutsig_0_5z } <<< celloutsig_0_38z[11:6];
  assign celloutsig_0_5z = { celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_4z } - { in_data[48:47], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_0_64z = { celloutsig_0_19z[7:3], celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_62z } - celloutsig_0_60z[10:3];
  assign celloutsig_0_14z = { celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_7z } - { celloutsig_0_6z[1:0], celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_19z = { celloutsig_0_5z[4:2], celloutsig_0_13z, celloutsig_0_5z } - { celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_12z };
  assign celloutsig_0_31z = { celloutsig_0_5z[3:2], celloutsig_0_20z, celloutsig_0_3z, celloutsig_0_20z, celloutsig_0_28z, celloutsig_0_12z } - { celloutsig_0_14z[7:4], celloutsig_0_18z, celloutsig_0_1z, celloutsig_0_23z };
  assign celloutsig_0_34z = { celloutsig_0_7z[3], celloutsig_0_28z, celloutsig_0_27z } ~^ celloutsig_0_7z[2:0];
  assign celloutsig_0_65z = celloutsig_0_36z[4:0] ~^ { celloutsig_0_64z[2:0], celloutsig_0_4z, celloutsig_0_13z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_35z = 9'h000;
    else if (clkin_data[0]) celloutsig_0_35z = celloutsig_0_14z[10:2];
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_36z = 17'h00000;
    else if (clkin_data[0]) celloutsig_0_36z = { celloutsig_0_22z[6:4], celloutsig_0_22z[4], celloutsig_0_22z[2], celloutsig_0_5z, celloutsig_0_21z, celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_7z };
  assign { celloutsig_0_22z[11:4], celloutsig_0_22z[2:1] } = ~ { celloutsig_0_19z[6:0], celloutsig_0_17z, celloutsig_0_15z, celloutsig_0_1z };
  assign { celloutsig_0_50z[2], celloutsig_0_50z[5:4], celloutsig_0_50z[6], celloutsig_0_50z[3], celloutsig_0_50z[0] } = ~ { celloutsig_0_33z, celloutsig_0_24z, celloutsig_0_21z, celloutsig_0_17z, celloutsig_0_8z, celloutsig_0_7z[2] };
  assign { celloutsig_0_61z[16:11], celloutsig_0_61z[9:8], celloutsig_0_61z[6:0], celloutsig_0_61z[7] } = ~ { celloutsig_0_22z[9:4], celloutsig_0_22z[2:1], celloutsig_0_29z, celloutsig_0_4z };
  assign { celloutsig_0_22z[3], celloutsig_0_22z[0] } = { celloutsig_0_22z[4], celloutsig_0_22z[2] };
  assign celloutsig_0_50z[1] = celloutsig_0_50z[6];
  assign celloutsig_0_61z[10] = celloutsig_0_61z[11];
  assign { out_data[128], out_data[96], out_data[39:32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_64z, celloutsig_0_65z };
endmodule
