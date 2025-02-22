/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [7:0] celloutsig_0_0z;
  wire [13:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  reg [4:0] celloutsig_0_17z;
  wire [17:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  reg [11:0] celloutsig_0_21z;
  wire [4:0] celloutsig_0_22z;
  wire [9:0] celloutsig_0_23z;
  wire [9:0] celloutsig_0_24z;
  wire [2:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  reg [5:0] celloutsig_0_2z;
  wire [2:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [6:0] celloutsig_0_33z;
  reg [3:0] celloutsig_0_34z;
  wire [4:0] celloutsig_0_35z;
  wire [25:0] celloutsig_0_36z;
  wire [3:0] celloutsig_0_37z;
  wire [6:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [18:0] celloutsig_0_41z;
  wire [33:0] celloutsig_0_42z;
  wire [6:0] celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire [17:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  reg [19:0] celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_57z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_65z;
  wire celloutsig_0_66z;
  wire [22:0] celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire celloutsig_0_72z;
  wire celloutsig_0_7z;
  wire [16:0] celloutsig_0_81z;
  wire [27:0] celloutsig_0_82z;
  wire celloutsig_0_8z;
  reg [23:0] celloutsig_0_9z;
  wire [6:0] celloutsig_1_0z;
  wire [10:0] celloutsig_1_10z;
  wire [5:0] celloutsig_1_11z;
  wire [2:0] celloutsig_1_15z;
  wire [6:0] celloutsig_1_17z;
  wire [3:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [5:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_7z;
  reg [6:0] celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_5z = !(celloutsig_0_1z ? in_data[93] : celloutsig_0_4z[6]);
  assign celloutsig_0_65z = !(celloutsig_0_3z ? celloutsig_0_22z[4] : celloutsig_0_45z);
  assign celloutsig_0_19z = !(celloutsig_0_16z ? celloutsig_0_11z : celloutsig_0_14z);
  assign celloutsig_0_26z = !(celloutsig_0_18z[11] ? celloutsig_0_3z : celloutsig_0_5z);
  assign celloutsig_0_29z = !(celloutsig_0_2z[3] ? celloutsig_0_14z : celloutsig_0_21z[10]);
  assign celloutsig_0_3z = ~(celloutsig_0_2z[5] | celloutsig_0_0z[0]);
  assign celloutsig_0_40z = ~(celloutsig_0_37z[3] | celloutsig_0_32z);
  assign celloutsig_0_27z = ~(in_data[15] | celloutsig_0_16z);
  assign celloutsig_0_46z = ~celloutsig_0_0z[2];
  assign celloutsig_0_15z = ~((celloutsig_0_1z | celloutsig_0_8z) & celloutsig_0_12z);
  assign celloutsig_0_38z = { celloutsig_0_14z, celloutsig_0_20z, celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_31z, celloutsig_0_28z, celloutsig_0_6z } & { celloutsig_0_20z, celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_27z, celloutsig_0_32z, celloutsig_0_19z, celloutsig_0_1z };
  assign celloutsig_0_41z = celloutsig_0_9z[20:2] & { celloutsig_0_10z[12:7], celloutsig_0_0z, celloutsig_0_22z };
  assign celloutsig_0_42z = { celloutsig_0_33z[2:1], celloutsig_0_41z, celloutsig_0_38z, celloutsig_0_17z, celloutsig_0_5z } & { celloutsig_0_4z[14:0], celloutsig_0_29z, celloutsig_0_23z, celloutsig_0_32z, celloutsig_0_32z, celloutsig_0_12z, celloutsig_0_35z };
  assign celloutsig_0_81z = celloutsig_0_41z[16:0] & { celloutsig_0_69z[21:7], celloutsig_0_12z, celloutsig_0_57z };
  assign celloutsig_1_0z = in_data[191:185] & in_data[123:117];
  assign celloutsig_1_18z = celloutsig_1_17z[6:3] & in_data[166:163];
  assign celloutsig_0_10z = { celloutsig_0_0z[7:2], celloutsig_0_0z } & celloutsig_0_4z[17:4];
  assign celloutsig_0_13z = { celloutsig_0_9z[9], celloutsig_0_3z, celloutsig_0_7z } & { celloutsig_0_4z[14:13], celloutsig_0_3z };
  assign celloutsig_0_25z = { celloutsig_0_20z, celloutsig_0_12z, celloutsig_0_6z } & { celloutsig_0_17z[1:0], celloutsig_0_11z };
  assign celloutsig_0_36z = { celloutsig_0_9z[17:15], celloutsig_0_4z, celloutsig_0_20z, celloutsig_0_8z, celloutsig_0_13z } / { 1'h1, celloutsig_0_9z[20:11], celloutsig_0_14z, celloutsig_0_25z, celloutsig_0_17z, celloutsig_0_5z, celloutsig_0_17z };
  assign celloutsig_1_15z = { celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_5z } / { 1'h1, celloutsig_1_0z[2:1] };
  assign celloutsig_0_24z = { celloutsig_0_0z[4:0], celloutsig_0_17z } / { 1'h1, in_data[49:41] };
  assign celloutsig_0_48z = { celloutsig_0_33z[4:1], celloutsig_0_40z, celloutsig_0_8z, celloutsig_0_17z, celloutsig_0_32z } == { celloutsig_0_2z[2:0], celloutsig_0_34z, celloutsig_0_31z, celloutsig_0_26z, celloutsig_0_32z, celloutsig_0_1z, celloutsig_0_20z };
  assign celloutsig_0_14z = { celloutsig_0_10z[11:7], celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_3z } == celloutsig_0_9z[21:13];
  assign celloutsig_0_32z = { celloutsig_0_6z, celloutsig_0_31z, celloutsig_0_25z, celloutsig_0_11z } <= celloutsig_0_2z;
  assign celloutsig_0_51z = { celloutsig_0_43z[4:3], celloutsig_0_46z, celloutsig_0_15z } <= celloutsig_0_33z[6:3];
  assign celloutsig_0_54z = { celloutsig_0_41z[9], celloutsig_0_50z, celloutsig_0_30z } <= celloutsig_0_42z[22:18];
  assign celloutsig_0_57z = { celloutsig_0_33z[3:2], celloutsig_0_1z } <= celloutsig_0_36z[10:8];
  assign celloutsig_0_12z = { celloutsig_0_9z[17:12], celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_7z } <= { in_data[41:33], celloutsig_0_5z };
  assign celloutsig_0_47z = { celloutsig_0_43z[5:1], celloutsig_0_43z, celloutsig_0_22z, celloutsig_0_13z, celloutsig_0_28z, celloutsig_0_31z, celloutsig_0_40z, celloutsig_0_7z, celloutsig_0_31z, celloutsig_0_39z } || { celloutsig_0_18z[16:1], celloutsig_0_43z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_7z };
  assign celloutsig_0_50z = { celloutsig_0_23z[9:7], celloutsig_0_12z } || { celloutsig_0_30z[2:1], celloutsig_0_14z, celloutsig_0_8z };
  assign celloutsig_0_72z = celloutsig_0_24z[9:6] || celloutsig_0_18z[13:10];
  assign celloutsig_1_3z = { celloutsig_1_0z[5:0], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z } || in_data[161:152];
  assign celloutsig_0_11z = { celloutsig_0_10z[5], celloutsig_0_7z, celloutsig_0_8z } || celloutsig_0_10z[12:10];
  assign celloutsig_0_16z = { celloutsig_0_10z[13:8], celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_12z } || { celloutsig_0_0z[6], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_14z };
  assign celloutsig_0_0z = in_data[18:11] % { 1'h1, in_data[51:45] };
  assign celloutsig_0_35z = { celloutsig_0_1z, celloutsig_0_25z, celloutsig_0_31z } % { 1'h1, celloutsig_0_23z[1:0], celloutsig_0_6z, celloutsig_0_15z };
  assign celloutsig_0_37z = { celloutsig_0_2z[3:1], celloutsig_0_26z } % { 1'h1, celloutsig_0_36z[14:12] };
  assign celloutsig_0_22z = - { celloutsig_0_10z[3:1], celloutsig_0_3z, celloutsig_0_12z };
  assign celloutsig_0_23z = - celloutsig_0_18z[15:6];
  assign celloutsig_0_31z = celloutsig_0_18z[15:2] !== { celloutsig_0_24z[0], celloutsig_0_1z, celloutsig_0_29z, celloutsig_0_15z, celloutsig_0_22z, celloutsig_0_14z, celloutsig_0_30z, celloutsig_0_15z };
  assign celloutsig_0_8z = celloutsig_0_6z & celloutsig_0_2z[3];
  assign celloutsig_0_45z = | { celloutsig_0_43z[5], celloutsig_0_9z[19:12], celloutsig_0_0z };
  assign celloutsig_0_7z = | celloutsig_0_4z[8:2];
  assign celloutsig_1_1z = | in_data[161:158];
  assign celloutsig_0_1z = | celloutsig_0_0z;
  assign celloutsig_0_28z = | celloutsig_0_9z[19:12];
  assign celloutsig_0_4z = in_data[57:40] >> { in_data[95:87], celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_69z = { celloutsig_0_10z[11:2], celloutsig_0_35z, celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_48z, celloutsig_0_54z } >> { celloutsig_0_2z[2:1], celloutsig_0_47z, celloutsig_0_2z, celloutsig_0_26z, celloutsig_0_59z, celloutsig_0_23z, celloutsig_0_65z, celloutsig_0_12z };
  assign celloutsig_0_82z = { celloutsig_0_53z[17:2], celloutsig_0_54z, celloutsig_0_11z, celloutsig_0_38z, celloutsig_0_27z, celloutsig_0_1z, celloutsig_0_28z } >> { celloutsig_0_18z[7:2], celloutsig_0_47z, celloutsig_0_65z, celloutsig_0_66z, celloutsig_0_72z, celloutsig_0_81z, celloutsig_0_66z };
  assign celloutsig_1_10z = in_data[186:176] >> { celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_11z = celloutsig_1_10z[8:3] >> celloutsig_1_4z;
  assign celloutsig_1_17z = { celloutsig_1_4z[2:0], celloutsig_1_7z, celloutsig_1_15z } >> { celloutsig_1_11z, celloutsig_1_5z };
  assign celloutsig_0_30z = { celloutsig_0_9z[16], celloutsig_0_15z, celloutsig_0_26z } >> celloutsig_0_2z[5:3];
  assign celloutsig_0_33z = { celloutsig_0_30z[2:1], celloutsig_0_14z, celloutsig_0_29z, celloutsig_0_11z, celloutsig_0_20z, celloutsig_0_19z } ^ { in_data[47:43], celloutsig_0_5z, celloutsig_0_6z };
  assign celloutsig_0_43z = { celloutsig_0_38z[6:1], celloutsig_0_12z } ^ celloutsig_0_41z[6:0];
  assign celloutsig_1_4z = in_data[104:99] ^ in_data[120:115];
  assign celloutsig_0_18z = { in_data[38:27], celloutsig_0_2z } ^ { celloutsig_0_4z[11:2], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_16z };
  assign celloutsig_0_39z = ~((celloutsig_0_0z[6] & celloutsig_0_29z) | celloutsig_0_20z);
  assign celloutsig_0_59z = ~((celloutsig_0_7z & celloutsig_0_8z) | celloutsig_0_43z[4]);
  assign celloutsig_0_6z = ~((celloutsig_0_4z[6] & celloutsig_0_0z[5]) | celloutsig_0_5z);
  assign celloutsig_0_66z = ~((celloutsig_0_50z & celloutsig_0_7z) | celloutsig_0_26z);
  assign celloutsig_1_5z = ~((celloutsig_1_2z & celloutsig_1_1z) | celloutsig_1_1z);
  assign celloutsig_1_7z = ~((celloutsig_1_4z[5] & in_data[145]) | celloutsig_1_2z);
  assign celloutsig_1_19z = ~((celloutsig_1_7z & celloutsig_1_15z[0]) | in_data[157]);
  assign celloutsig_0_20z = ~((celloutsig_0_16z & celloutsig_0_13z[0]) | celloutsig_0_15z);
  always_latch
    if (!clkin_data[32]) celloutsig_0_34z = 4'h0;
    else if (!celloutsig_1_18z[0]) celloutsig_0_34z = { celloutsig_0_17z[1], celloutsig_0_16z, celloutsig_0_14z, celloutsig_0_12z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_53z = 20'h00000;
    else if (celloutsig_1_18z[0]) celloutsig_0_53z = { in_data[60:44], celloutsig_0_8z, celloutsig_0_16z, celloutsig_0_51z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_9z = 24'h000000;
    else if (celloutsig_1_18z[0]) celloutsig_0_9z = { in_data[90:68], celloutsig_0_3z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_8z = 7'h00;
    else if (!clkin_data[0]) celloutsig_1_8z = { celloutsig_1_0z[6:5], celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_3z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_17z = 5'h00;
    else if (celloutsig_1_18z[0]) celloutsig_0_17z = { celloutsig_0_0z[7:4], celloutsig_0_1z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_2z = 6'h00;
    else if (!celloutsig_1_18z[0]) celloutsig_0_2z = celloutsig_0_0z[5:0];
  always_latch
    if (clkin_data[32]) celloutsig_0_21z = 12'h000;
    else if (celloutsig_1_18z[0]) celloutsig_0_21z = { celloutsig_0_10z[12:7], celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_14z };
  assign celloutsig_1_2z = ~((celloutsig_1_1z & celloutsig_1_1z) | (in_data[158] & celloutsig_1_1z));
  assign { out_data[131:128], out_data[96], out_data[48:32], out_data[27:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_81z, celloutsig_0_82z };
endmodule
