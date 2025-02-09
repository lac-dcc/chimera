/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [4:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [5:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  reg [16:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [24:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [13:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  reg [10:0] celloutsig_0_3z;
  wire [7:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire [4:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire [9:0] celloutsig_0_4z;
  wire celloutsig_0_52z;
  wire celloutsig_0_55z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_65z;
  wire celloutsig_0_66z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_13z;
  wire [4:0] celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [4:0] celloutsig_1_3z;
  wire [10:0] celloutsig_1_4z;
  reg [11:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_31z = celloutsig_0_3z[4] ? celloutsig_0_21z : in_data[4];
  assign celloutsig_0_49z = celloutsig_0_38z ? celloutsig_0_1z : celloutsig_0_12z;
  assign celloutsig_1_9z = celloutsig_1_6z ? celloutsig_1_6z : celloutsig_1_3z[4];
  assign celloutsig_0_11z = celloutsig_0_0z ? celloutsig_0_0z : celloutsig_0_9z;
  assign celloutsig_0_12z = celloutsig_0_2z ? celloutsig_0_5z : celloutsig_0_1z;
  assign celloutsig_0_2z = in_data[92] ? in_data[7] : celloutsig_0_0z;
  assign celloutsig_0_27z = celloutsig_0_18z ? celloutsig_0_12z : celloutsig_0_20z;
  assign celloutsig_0_34z = ~((celloutsig_0_7z | celloutsig_0_1z) & (celloutsig_0_8z | celloutsig_0_29z));
  assign celloutsig_0_35z = ~((celloutsig_0_30z[5] | celloutsig_0_11z) & (celloutsig_0_26z | celloutsig_0_30z[3]));
  assign celloutsig_0_36z = ~((celloutsig_0_23z | celloutsig_0_28z) & (celloutsig_0_31z | celloutsig_0_25z));
  assign celloutsig_0_52z = ~((celloutsig_0_8z | celloutsig_0_43z[7]) & (celloutsig_0_47z | celloutsig_0_18z));
  assign celloutsig_0_5z = ~((celloutsig_0_3z[3] | celloutsig_0_0z) & (celloutsig_0_4z[9] | celloutsig_0_1z));
  assign celloutsig_0_61z = ~((celloutsig_0_36z | celloutsig_0_55z) & (celloutsig_0_49z | celloutsig_0_7z));
  assign celloutsig_1_0z = ~((in_data[146] | in_data[119]) & (in_data[154] | in_data[153]));
  assign celloutsig_1_1z = ~((celloutsig_1_0z | celloutsig_1_0z) & (celloutsig_1_0z | in_data[186]));
  assign celloutsig_1_2z = ~((celloutsig_1_0z | celloutsig_1_1z) & (celloutsig_1_0z | in_data[174]));
  assign celloutsig_1_18z = ~((celloutsig_1_7z | celloutsig_1_7z) & (celloutsig_1_1z | celloutsig_1_14z[2]));
  assign celloutsig_1_19z = ~((celloutsig_1_7z | celloutsig_1_9z) & (celloutsig_1_13z | celloutsig_1_1z));
  assign celloutsig_0_8z = ~((celloutsig_0_7z | celloutsig_0_2z) & (celloutsig_0_4z[9] | celloutsig_0_6z));
  assign celloutsig_0_1z = ~((in_data[17] | celloutsig_0_0z) & (in_data[81] | celloutsig_0_0z));
  assign celloutsig_0_15z = ~((celloutsig_0_5z | celloutsig_0_1z) & (celloutsig_0_9z | celloutsig_0_5z));
  assign celloutsig_0_17z = ~((celloutsig_0_5z | celloutsig_0_10z[1]) & (celloutsig_0_14z[2] | in_data[20]));
  assign celloutsig_0_25z = ~((celloutsig_0_12z | in_data[38]) & (celloutsig_0_12z | celloutsig_0_8z));
  assign celloutsig_0_30z = { celloutsig_0_3z[10:4], celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_4z, celloutsig_0_15z, celloutsig_0_10z } + { celloutsig_0_3z[7:4], celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_4z };
  assign celloutsig_0_33z = { celloutsig_0_3z[4:2], celloutsig_0_4z, celloutsig_0_29z } + { celloutsig_0_13z, celloutsig_0_17z, celloutsig_0_31z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_27z, celloutsig_0_19z };
  assign celloutsig_0_43z = { celloutsig_0_14z[2:0], celloutsig_0_21z, celloutsig_0_22z, celloutsig_0_8z, celloutsig_0_15z, celloutsig_0_22z } + { celloutsig_0_23z, celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_31z, celloutsig_0_35z, celloutsig_0_5z, celloutsig_0_29z, celloutsig_0_39z };
  assign celloutsig_0_46z = { celloutsig_0_43z[3:0], celloutsig_0_32z } + { celloutsig_0_3z[5], celloutsig_0_10z, celloutsig_0_28z };
  assign celloutsig_0_4z = { in_data[8:1], celloutsig_0_1z, celloutsig_0_2z } + { in_data[79:76], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_1_3z = { celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z } + in_data[134:130];
  assign celloutsig_1_4z = in_data[167:157] + { in_data[152:149], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_14z = { celloutsig_1_4z[9:7], celloutsig_1_0z, celloutsig_1_9z } + { celloutsig_1_3z[2:0], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_10z = { in_data[43], celloutsig_0_5z, celloutsig_0_1z } + { in_data[14], celloutsig_0_1z, celloutsig_0_5z };
  assign celloutsig_0_14z = { celloutsig_0_4z[2:1], celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_1z } + { celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_7z };
  assign celloutsig_0_19z = in_data[47:42] + { celloutsig_0_4z[7], celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_10z };
  assign celloutsig_0_28z = celloutsig_0_24z < { celloutsig_0_19z[4:0], celloutsig_0_8z, celloutsig_0_17z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_22z, celloutsig_0_14z, celloutsig_0_22z };
  assign celloutsig_0_47z = { celloutsig_0_30z[24:20], celloutsig_0_17z, celloutsig_0_44z, celloutsig_0_15z, celloutsig_0_23z, celloutsig_0_26z, celloutsig_0_35z, celloutsig_0_10z, celloutsig_0_28z, celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_16z } < { celloutsig_0_4z[9:1], celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_46z, celloutsig_0_25z };
  assign celloutsig_0_66z = { celloutsig_0_61z, celloutsig_0_47z, celloutsig_0_23z, celloutsig_0_65z, celloutsig_0_52z } < { celloutsig_0_6z, celloutsig_0_34z, celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_44z };
  assign celloutsig_0_6z = { celloutsig_0_4z[7:6], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_4z } < { in_data[25:14], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_5z };
  assign celloutsig_1_7z = in_data[149:137] < { celloutsig_1_4z[4:0], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_6z };
  assign celloutsig_1_13z = { celloutsig_1_5z[1], celloutsig_1_9z, celloutsig_1_9z } < celloutsig_1_3z[2:0];
  assign celloutsig_0_16z = { celloutsig_0_3z[6:0], celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_6z } < { celloutsig_0_3z[9:1], celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_6z };
  assign celloutsig_0_20z = { celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_14z } < { celloutsig_0_3z[8:2], celloutsig_0_17z };
  assign celloutsig_0_21z = { in_data[70:69], celloutsig_0_5z, celloutsig_0_18z, celloutsig_0_11z, celloutsig_0_15z } < { celloutsig_0_20z, celloutsig_0_13z, celloutsig_0_20z, celloutsig_0_20z, celloutsig_0_8z, celloutsig_0_13z };
  assign celloutsig_0_22z = { celloutsig_0_3z[8:7], celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_16z } < { celloutsig_0_19z, celloutsig_0_11z };
  assign celloutsig_0_23z = celloutsig_0_19z[5:3] < { celloutsig_0_10z[2:1], celloutsig_0_15z };
  assign celloutsig_0_0z = in_data[76] & ~(in_data[0]);
  assign celloutsig_0_37z = celloutsig_0_3z[10] & ~(celloutsig_0_32z);
  assign celloutsig_0_44z = celloutsig_0_15z & ~(celloutsig_0_25z);
  assign celloutsig_1_6z = celloutsig_1_0z & ~(celloutsig_1_2z);
  assign celloutsig_0_18z = celloutsig_0_7z & ~(celloutsig_0_1z);
  assign celloutsig_0_26z = celloutsig_0_24z[13] & ~(celloutsig_0_25z);
  assign celloutsig_0_29z = | { celloutsig_0_24z[16:3], celloutsig_0_18z, celloutsig_0_19z, celloutsig_0_17z, celloutsig_0_20z };
  assign celloutsig_0_32z = | { celloutsig_0_30z[15:8], celloutsig_0_17z, celloutsig_0_31z, celloutsig_0_28z };
  assign celloutsig_0_38z = | celloutsig_0_3z[2:0];
  assign celloutsig_0_39z = | { celloutsig_0_37z, celloutsig_0_34z, celloutsig_0_12z, celloutsig_0_22z, celloutsig_0_35z, celloutsig_0_38z };
  assign celloutsig_0_55z = | celloutsig_0_19z[4:1];
  assign celloutsig_0_65z = | { celloutsig_0_33z[12:0], celloutsig_0_1z };
  assign celloutsig_0_7z = | celloutsig_0_3z[3:1];
  assign celloutsig_0_9z = | celloutsig_0_3z[8:5];
  assign celloutsig_0_13z = | { celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_1z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_3z = 11'h000;
    else if (clkin_data[0]) celloutsig_0_3z = { in_data[90:82], celloutsig_0_0z, celloutsig_0_2z };
  always_latch
    if (clkin_data[96]) celloutsig_1_5z = 12'h000;
    else if (!clkin_data[32]) celloutsig_1_5z = { celloutsig_1_4z[10:1], celloutsig_1_2z, celloutsig_1_1z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_24z = 17'h00000;
    else if (!clkin_data[0]) celloutsig_0_24z = in_data[16:0];
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_65z, celloutsig_0_66z };
endmodule
