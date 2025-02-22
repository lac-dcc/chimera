/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [8:0] celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  reg [8:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [19:0] celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [13:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [36:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [4:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  reg [21:0] celloutsig_0_29z;
  wire [4:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [15:0] celloutsig_0_35z;
  wire [13:0] celloutsig_0_36z;
  wire [10:0] celloutsig_0_37z;
  wire [4:0] celloutsig_0_38z;
  wire [4:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [4:0] celloutsig_0_42z;
  wire celloutsig_0_44z;
  wire [2:0] celloutsig_0_45z;
  wire [2:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [19:0] celloutsig_0_4z;
  wire celloutsig_0_54z;
  reg [3:0] celloutsig_0_59z;
  wire [2:0] celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [3:0] celloutsig_0_66z;
  reg [15:0] celloutsig_0_67z;
  wire celloutsig_0_6z;
  reg [2:0] celloutsig_0_71z;
  wire [6:0] celloutsig_0_72z;
  wire [19:0] celloutsig_0_73z;
  wire [2:0] celloutsig_0_7z;
  wire [7:0] celloutsig_0_8z;
  wire [10:0] celloutsig_0_9z;
  wire [3:0] celloutsig_1_0z;
  wire [31:0] celloutsig_1_10z;
  wire [4:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_16z;
  wire [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [7:0] celloutsig_1_2z;
  wire [3:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [10:0] celloutsig_1_5z;
  wire [10:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_21z = !(celloutsig_0_1z ? celloutsig_0_0z[6] : celloutsig_0_20z);
  assign celloutsig_0_40z = in_data[57] | ~(celloutsig_0_16z);
  assign celloutsig_0_54z = celloutsig_0_31z | ~(celloutsig_0_47z);
  assign celloutsig_1_16z = celloutsig_1_9z[3] | ~(celloutsig_1_1z);
  assign celloutsig_0_26z = celloutsig_0_6z | ~(celloutsig_0_5z[1]);
  assign celloutsig_0_44z = celloutsig_0_18z[0] | celloutsig_0_36z[0];
  assign celloutsig_1_1z = in_data[101] | in_data[182];
  assign celloutsig_1_13z = celloutsig_1_10z[24] | celloutsig_1_4z;
  assign celloutsig_0_4z = { in_data[8:5], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_2z } + { in_data[85:71], celloutsig_0_3z };
  assign celloutsig_1_3z = celloutsig_1_2z[3:0] / { 1'h1, celloutsig_1_2z[5:4], celloutsig_1_1z };
  assign celloutsig_1_12z = { celloutsig_1_10z[15:14], celloutsig_1_11z } >= { celloutsig_1_9z[3:2], celloutsig_1_11z };
  assign celloutsig_1_19z = { celloutsig_1_0z[1], celloutsig_1_4z, celloutsig_1_11z } || { celloutsig_1_9z[9:6], celloutsig_1_13z, celloutsig_1_12z, celloutsig_1_12z };
  assign celloutsig_1_4z = { celloutsig_1_0z[2:1], celloutsig_1_1z } < celloutsig_1_2z[3:1];
  assign celloutsig_0_11z = { celloutsig_0_3z[0], celloutsig_0_10z, celloutsig_0_8z } < { celloutsig_0_3z[2:1], celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_0_14z = { in_data[43:37], celloutsig_0_9z } < celloutsig_0_4z[19:2];
  assign celloutsig_0_34z = { celloutsig_0_27z[4:2], celloutsig_0_27z, celloutsig_0_31z } < { celloutsig_0_24z[25:24], celloutsig_0_13z, celloutsig_0_28z, celloutsig_0_2z };
  assign celloutsig_0_3z = in_data[29:25] % { 1'h1, in_data[66:64], celloutsig_0_1z };
  assign celloutsig_0_42z = { celloutsig_0_22z[12:9], celloutsig_0_11z } % { 1'h1, celloutsig_0_37z[4:2], celloutsig_0_31z };
  assign celloutsig_0_45z = celloutsig_0_37z[10:8] % { 1'h1, celloutsig_0_42z[2], celloutsig_0_30z };
  assign celloutsig_0_73z = { celloutsig_0_24z[34:19], celloutsig_0_18z } % { 1'h1, celloutsig_0_35z[5:3], celloutsig_0_33z, celloutsig_0_26z, celloutsig_0_42z, celloutsig_0_26z, celloutsig_0_41z, celloutsig_0_59z, celloutsig_0_44z, celloutsig_0_12z, celloutsig_0_1z };
  assign celloutsig_0_10z = celloutsig_0_0z[7:5] % { 1'h1, celloutsig_0_9z[9:8] };
  assign celloutsig_0_0z = - in_data[11:3];
  assign celloutsig_0_38z = - { celloutsig_0_7z[2:1], celloutsig_0_10z };
  assign celloutsig_0_66z = - { celloutsig_0_46z[1:0], celloutsig_0_23z, celloutsig_0_21z };
  assign celloutsig_1_5z = - { celloutsig_1_3z[2:0], celloutsig_1_2z };
  assign celloutsig_0_9z = - { celloutsig_0_3z[2:0], celloutsig_0_8z };
  assign celloutsig_0_24z = - { in_data[37:6], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_11z };
  assign celloutsig_0_6z = { celloutsig_0_5z[2:1], celloutsig_0_3z, celloutsig_0_1z } !== celloutsig_0_4z[11:4];
  assign celloutsig_0_1z = celloutsig_0_0z[7:5] !== celloutsig_0_0z[3:1];
  assign celloutsig_0_28z = { celloutsig_0_8z[6:1], celloutsig_0_11z, celloutsig_0_27z, celloutsig_0_12z, celloutsig_0_10z } !== { celloutsig_0_2z[4:1], celloutsig_0_18z, celloutsig_0_8z };
  assign celloutsig_0_33z = { celloutsig_0_8z[7:3], celloutsig_0_14z } !== celloutsig_0_29z[16:11];
  assign celloutsig_0_41z = celloutsig_0_38z[2] & celloutsig_0_37z[1];
  assign celloutsig_0_13z = in_data[71] & celloutsig_0_4z[10];
  assign celloutsig_0_16z = celloutsig_0_10z[1] & celloutsig_0_12z;
  assign celloutsig_0_20z = celloutsig_0_6z & celloutsig_0_2z[4];
  assign celloutsig_0_23z = celloutsig_0_14z & celloutsig_0_3z[4];
  assign celloutsig_0_47z = ~^ { celloutsig_0_26z, celloutsig_0_21z, celloutsig_0_40z, celloutsig_0_11z, celloutsig_0_20z, celloutsig_0_5z, celloutsig_0_31z, celloutsig_0_45z, celloutsig_0_41z };
  assign celloutsig_0_60z = ~^ { celloutsig_0_29z[20:18], celloutsig_0_16z, celloutsig_0_30z, celloutsig_0_22z };
  assign celloutsig_0_12z = ~^ { celloutsig_0_8z[7:3], celloutsig_0_6z, celloutsig_0_10z };
  assign celloutsig_0_25z = ~^ { celloutsig_0_17z[18:7], celloutsig_0_20z };
  assign celloutsig_0_30z = ~^ { celloutsig_0_27z[4:2], celloutsig_0_28z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_31z = ~^ { celloutsig_0_17z[10:9], celloutsig_0_9z, celloutsig_0_26z };
  assign celloutsig_0_8z = { in_data[88:85], celloutsig_0_5z, celloutsig_0_6z } >> { celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_35z = { in_data[60:46], celloutsig_0_12z } >> { celloutsig_0_22z[11:0], celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_33z, celloutsig_0_23z };
  assign celloutsig_0_37z = { celloutsig_0_7z[0], celloutsig_0_15z, celloutsig_0_6z } >> { celloutsig_0_36z[11:6], celloutsig_0_10z, celloutsig_0_34z, celloutsig_0_12z };
  assign celloutsig_1_0z = in_data[127:124] >> in_data[143:140];
  assign celloutsig_1_2z = { in_data[126:123], celloutsig_1_0z } >> in_data[137:130];
  assign celloutsig_1_11z = { celloutsig_1_9z[0], celloutsig_1_3z } >> { celloutsig_1_3z[0], celloutsig_1_0z };
  assign celloutsig_0_18z = { celloutsig_0_7z, celloutsig_0_14z } >> { celloutsig_0_9z[9:7], celloutsig_0_1z };
  assign celloutsig_0_27z = { celloutsig_0_8z[4:1], celloutsig_0_13z } >> { celloutsig_0_2z[3:0], celloutsig_0_25z };
  assign celloutsig_0_36z = { celloutsig_0_2z[4:2], celloutsig_0_20z, celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_31z } >>> { celloutsig_0_24z[15:7], celloutsig_0_31z, celloutsig_0_11z, celloutsig_0_20z, celloutsig_0_13z, celloutsig_0_28z };
  assign celloutsig_0_5z = celloutsig_0_0z[3:1] ~^ in_data[82:80];
  assign celloutsig_0_17z = { in_data[56:48], celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_14z } ~^ { celloutsig_0_4z[8:1], celloutsig_0_9z, celloutsig_0_1z };
  assign celloutsig_0_46z = celloutsig_0_9z[4:2] ^ celloutsig_0_2z[2:0];
  assign celloutsig_0_7z = celloutsig_0_4z[5:3] ^ celloutsig_0_4z[16:14];
  assign celloutsig_0_72z = { celloutsig_0_22z[9:7], celloutsig_0_66z } ^ { celloutsig_0_8z[7], celloutsig_0_30z, celloutsig_0_33z, celloutsig_0_71z, celloutsig_0_54z };
  assign celloutsig_1_9z = { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z } ^ { celloutsig_1_2z[7:2], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_18z = celloutsig_1_11z[2:0] ^ { in_data[172:171], celloutsig_1_16z };
  assign celloutsig_0_2z = celloutsig_0_0z[7:3] ^ celloutsig_0_0z[5:1];
  assign celloutsig_0_22z = { celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_20z, celloutsig_0_6z, celloutsig_0_20z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_5z } ^ celloutsig_0_17z[17:4];
  always_latch
    if (clkin_data[64]) celloutsig_0_59z = 4'h0;
    else if (!celloutsig_1_19z) celloutsig_0_59z = { celloutsig_0_0z[8:6], celloutsig_0_13z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_67z = 16'h0000;
    else if (!celloutsig_1_19z) celloutsig_0_67z = { celloutsig_0_8z[6:3], celloutsig_0_9z, celloutsig_0_60z };
  always_latch
    if (clkin_data[64]) celloutsig_0_71z = 3'h0;
    else if (!celloutsig_1_19z) celloutsig_0_71z = { celloutsig_0_67z[7:6], celloutsig_0_44z };
  always_latch
    if (clkin_data[32]) celloutsig_0_15z = 9'h000;
    else if (!celloutsig_1_19z) celloutsig_0_15z = { celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_5z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_29z = 22'h000000;
    else if (!celloutsig_1_19z) celloutsig_0_29z = { in_data[77], celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_21z, celloutsig_0_26z, celloutsig_0_15z, celloutsig_0_1z };
  assign { celloutsig_1_10z[21], celloutsig_1_10z[31], celloutsig_1_10z[20], celloutsig_1_10z[30], celloutsig_1_10z[19], celloutsig_1_10z[29], celloutsig_1_10z[18], celloutsig_1_10z[28], celloutsig_1_10z[17], celloutsig_1_10z[27], celloutsig_1_10z[16], celloutsig_1_10z[26], celloutsig_1_10z[15], celloutsig_1_10z[25], celloutsig_1_10z[14], celloutsig_1_10z[24], celloutsig_1_10z[13:11], celloutsig_1_10z[8:1], celloutsig_1_10z[22], celloutsig_1_10z[10:9], celloutsig_1_10z[23] } = { celloutsig_1_5z[10], celloutsig_1_5z[10:9], celloutsig_1_5z[9:8], celloutsig_1_5z[8:7], celloutsig_1_5z[7:6], celloutsig_1_5z[6:5], celloutsig_1_5z[5:4], celloutsig_1_5z[4:3], celloutsig_1_5z[3:0], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z } ^ { celloutsig_1_9z[9], celloutsig_1_2z[4], celloutsig_1_9z[8], celloutsig_1_2z[7], celloutsig_1_9z[7], celloutsig_1_2z[6], celloutsig_1_9z[6], celloutsig_1_2z[5], celloutsig_1_9z[5], celloutsig_1_2z[4], celloutsig_1_9z[4], celloutsig_1_2z[3], celloutsig_1_9z[3], celloutsig_1_2z[2], celloutsig_1_9z[2], celloutsig_1_2z[1], celloutsig_1_9z[1:0], celloutsig_1_9z[10], celloutsig_1_9z[7:0], celloutsig_1_9z[10:8], celloutsig_1_2z[0] };
  assign celloutsig_1_10z[0] = 1'h0;
  assign { out_data[130:128], out_data[96], out_data[38:32], out_data[19:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_72z, celloutsig_0_73z };
endmodule
