/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [23:0] celloutsig_0_11z;
  wire [25:0] celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire [18:0] celloutsig_0_14z;
  wire [19:0] celloutsig_0_15z;
  wire [7:0] celloutsig_0_16z;
  wire [7:0] celloutsig_0_17z;
  wire [5:0] celloutsig_0_18z;
  wire [23:0] celloutsig_0_19z;
  wire [27:0] celloutsig_0_1z;
  reg [11:0] celloutsig_0_20z;
  wire [8:0] celloutsig_0_21z;
  wire [5:0] celloutsig_0_22z;
  wire [12:0] celloutsig_0_23z;
  wire [9:0] celloutsig_0_24z;
  wire [15:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [9:0] celloutsig_0_28z;
  wire [2:0] celloutsig_0_29z;
  reg [3:0] celloutsig_0_2z;
  wire [3:0] celloutsig_0_30z;
  wire [15:0] celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire [17:0] celloutsig_0_36z;
  wire [12:0] celloutsig_0_38z;
  wire [6:0] celloutsig_0_39z;
  wire [14:0] celloutsig_0_3z;
  wire [32:0] celloutsig_0_40z;
  wire [4:0] celloutsig_0_44z;
  wire celloutsig_0_47z;
  wire [8:0] celloutsig_0_4z;
  wire [11:0] celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire [5:0] celloutsig_0_53z;
  wire [9:0] celloutsig_0_55z;
  wire [6:0] celloutsig_0_59z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [10:0] celloutsig_0_61z;
  wire [4:0] celloutsig_0_67z;
  wire [6:0] celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_74z;
  wire [19:0] celloutsig_0_79z;
  wire [4:0] celloutsig_0_7z;
  wire [17:0] celloutsig_0_88z;
  wire celloutsig_0_89z;
  wire celloutsig_0_8z;
  wire [19:0] celloutsig_0_9z;
  wire [5:0] celloutsig_1_0z;
  wire [11:0] celloutsig_1_10z;
  wire [12:0] celloutsig_1_11z;
  wire [8:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire [10:0] celloutsig_1_18z;
  wire [11:0] celloutsig_1_19z;
  reg [9:0] celloutsig_1_1z;
  wire [17:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [13:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  reg [12:0] celloutsig_1_6z;
  wire [6:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_52z = ~celloutsig_0_19z[20];
  assign celloutsig_0_74z = ~celloutsig_0_40z[26];
  assign celloutsig_1_3z = ~celloutsig_1_0z[0];
  assign celloutsig_0_10z = ~celloutsig_0_1z[13];
  assign celloutsig_1_10z = celloutsig_1_4z[12:1] & { celloutsig_1_4z[11:1], celloutsig_1_3z };
  assign celloutsig_0_15z = in_data[85:66] & { celloutsig_0_9z[4:1], celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_0_25z = { celloutsig_0_3z[14:5], celloutsig_0_18z } & celloutsig_0_1z[20:5];
  assign celloutsig_0_30z = celloutsig_0_21z[6:3] & celloutsig_0_16z[3:0];
  assign celloutsig_0_32z = celloutsig_0_1z[18:3] & { celloutsig_0_21z[8:5], celloutsig_0_6z, celloutsig_0_27z, celloutsig_0_30z };
  assign celloutsig_0_70z = { celloutsig_0_51z[8:0], celloutsig_0_47z } && celloutsig_0_61z[9:0];
  assign celloutsig_1_5z = celloutsig_1_4z[11:0] && celloutsig_1_4z[12:1];
  assign celloutsig_0_26z = celloutsig_0_24z[2:0] && in_data[93:91];
  assign celloutsig_0_34z = ! celloutsig_0_20z[10:8];
  assign celloutsig_0_47z = ! celloutsig_0_4z[7:0];
  assign celloutsig_0_3z = celloutsig_0_1z[23:9] % { 1'h1, celloutsig_0_1z[13:0] };
  assign celloutsig_1_18z = celloutsig_1_4z[12:2] % { 1'h1, celloutsig_1_12z[5:0], celloutsig_1_9z, celloutsig_1_17z };
  assign celloutsig_0_11z = { in_data[45:28], celloutsig_0_5z, celloutsig_0_10z } % { 1'h1, celloutsig_0_9z[4], celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_3z, in_data[0] };
  assign celloutsig_0_1z = in_data[74:47] % { 1'h1, in_data[80:55], celloutsig_0_0z };
  assign celloutsig_0_38z = celloutsig_0_9z[3] ? celloutsig_0_23z : celloutsig_0_3z[13:1];
  assign celloutsig_0_40z = celloutsig_0_4z[6] ? { celloutsig_0_13z[2:1], celloutsig_0_29z, celloutsig_0_1z } : { celloutsig_0_32z[9:7], celloutsig_0_25z, celloutsig_0_6z, celloutsig_0_39z };
  assign celloutsig_0_5z = celloutsig_0_3z[1] ? in_data[43:39] : in_data[44:40];
  assign celloutsig_0_6z = celloutsig_0_4z[4] ? { celloutsig_0_4z[6:5], 1'h1, celloutsig_0_4z[3:0] } : in_data[80:74];
  assign celloutsig_1_7z = celloutsig_1_4z[12] ? celloutsig_1_1z[8:2] : { celloutsig_1_6z[4:1], celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_9z = celloutsig_0_7z[2] ? { celloutsig_0_3z[12:7], celloutsig_0_2z, celloutsig_0_7z[4:3], 1'h1, celloutsig_0_7z[1:0], celloutsig_0_5z } : { in_data[37:26], celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_0_13z = celloutsig_0_5z[4] ? { celloutsig_0_2z[3], celloutsig_0_10z, celloutsig_0_8z } : { celloutsig_0_7z[2], celloutsig_0_8z, celloutsig_0_10z };
  assign celloutsig_0_28z = celloutsig_0_23z[11] ? { celloutsig_0_23z[12], 1'h1, celloutsig_0_23z[10:3] } : { celloutsig_0_5z[2:0], celloutsig_0_6z };
  assign celloutsig_0_0z = in_data[33:16] != in_data[44:27];
  assign celloutsig_0_60z = { in_data[85], celloutsig_0_4z } != { celloutsig_0_53z[4], celloutsig_0_21z };
  assign celloutsig_0_27z = { celloutsig_0_24z[2:1], celloutsig_0_25z } != { celloutsig_0_4z[5:2], celloutsig_0_22z, celloutsig_0_17z };
  assign celloutsig_0_51z = - { celloutsig_0_28z[9:2], celloutsig_0_2z };
  assign celloutsig_0_55z = - { celloutsig_0_36z[13:11], celloutsig_0_52z, celloutsig_0_18z };
  assign celloutsig_0_59z = - celloutsig_0_55z[9:3];
  assign celloutsig_0_67z = - celloutsig_0_23z[11:7];
  assign celloutsig_0_88z = - { celloutsig_0_79z[18:2], celloutsig_0_70z };
  assign celloutsig_1_4z = - { in_data[155:148], celloutsig_1_0z };
  assign celloutsig_1_9z = - { in_data[136], celloutsig_1_8z, celloutsig_1_5z };
  assign celloutsig_1_12z = - { celloutsig_1_7z[5:0], celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_5z };
  assign celloutsig_0_14z = - celloutsig_0_12z[21:3];
  assign celloutsig_0_18z = - in_data[37:32];
  assign celloutsig_0_19z = - { in_data[52:30], celloutsig_0_8z };
  assign celloutsig_0_21z = - celloutsig_0_19z[16:8];
  assign celloutsig_0_22z = - { celloutsig_0_6z[6:4], celloutsig_0_13z };
  assign celloutsig_0_23z = - { celloutsig_0_22z[5:1], celloutsig_0_6z, celloutsig_0_8z };
  assign celloutsig_0_24z = - celloutsig_0_23z[9:0];
  assign celloutsig_0_29z = - celloutsig_0_21z[8:6];
  assign celloutsig_0_39z = celloutsig_0_15z[6:0] | { celloutsig_0_38z[8:3], celloutsig_0_34z };
  assign celloutsig_0_44z = { celloutsig_0_3z[14:11], celloutsig_0_10z } | celloutsig_0_3z[12:8];
  assign celloutsig_0_53z = { celloutsig_0_21z[3:0], celloutsig_0_26z, celloutsig_0_10z } | celloutsig_0_17z[5:0];
  assign celloutsig_0_61z = { celloutsig_0_19z[15:9], celloutsig_0_60z, celloutsig_0_29z } | celloutsig_0_19z[15:5];
  assign celloutsig_0_79z = { celloutsig_0_11z[15:1], celloutsig_0_44z } | { celloutsig_0_38z[11:4], celloutsig_0_59z, celloutsig_0_67z };
  assign celloutsig_1_2z = in_data[119:102] | in_data[140:123];
  assign celloutsig_1_11z = { celloutsig_1_4z[7], celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_8z, celloutsig_1_8z } | { celloutsig_1_2z[13:2], celloutsig_1_3z };
  assign celloutsig_1_19z = { in_data[165:160], celloutsig_1_5z, celloutsig_1_13z, celloutsig_1_17z } | { celloutsig_1_18z[5], celloutsig_1_18z };
  assign celloutsig_0_12z = { celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_8z } | celloutsig_0_1z[25:0];
  assign celloutsig_0_16z = celloutsig_0_11z[11:4] | { celloutsig_0_9z[19:13], celloutsig_0_8z };
  assign celloutsig_0_89z = ^ { celloutsig_0_15z[17:14], celloutsig_0_74z };
  assign celloutsig_1_8z = ^ { in_data[145:127], celloutsig_1_3z };
  assign celloutsig_1_15z = ^ celloutsig_1_10z[11:2];
  assign celloutsig_0_36z = celloutsig_0_12z[21:4] >> { celloutsig_0_23z[1], celloutsig_0_32z, celloutsig_0_27z };
  assign celloutsig_0_4z = celloutsig_0_3z[14:6] >> { celloutsig_0_1z[27:21], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_7z = celloutsig_0_4z[7:3] >> in_data[88:84];
  assign celloutsig_1_0z = in_data[161:156] >> in_data[166:161];
  assign celloutsig_1_13z = celloutsig_1_11z[10:7] >> in_data[132:129];
  assign celloutsig_0_17z = { celloutsig_0_4z[8:2], celloutsig_0_10z } >> { celloutsig_0_16z[3:1], celloutsig_0_5z };
  always_latch
    if (clkin_data[96]) celloutsig_1_1z = 10'h000;
    else if (clkin_data[32]) celloutsig_1_1z = in_data[119:110];
  always_latch
    if (!clkin_data[96]) celloutsig_1_6z = 13'h0000;
    else if (clkin_data[32]) celloutsig_1_6z = { celloutsig_1_2z[6:4], celloutsig_1_1z };
  always_latch
    if (clkin_data[64]) celloutsig_0_20z = 12'h000;
    else if (clkin_data[0]) celloutsig_0_20z = { celloutsig_0_14z[10:4], celloutsig_0_2z, celloutsig_0_8z };
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_2z = 4'h0;
    else if (clkin_data[0]) celloutsig_0_2z = { celloutsig_0_1z[2:1], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_8z = ~((celloutsig_0_5z[3] & celloutsig_0_0z) | (celloutsig_0_4z[6] & celloutsig_0_4z[6]));
  assign celloutsig_1_17z = ~((celloutsig_1_15z & celloutsig_1_4z[2]) | (celloutsig_1_11z[12] & celloutsig_1_2z[2]));
  assign { out_data[138:128], out_data[107:96], out_data[49:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_88z, celloutsig_0_89z };
endmodule
