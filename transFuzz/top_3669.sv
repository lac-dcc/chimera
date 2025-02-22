/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [15:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [12:0] celloutsig_0_12z;
  wire [8:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [17:0] celloutsig_0_16z;
  wire celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  reg [7:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [2:0] celloutsig_0_22z;
  wire [8:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  reg [14:0] celloutsig_0_25z;
  reg [13:0] celloutsig_0_26z;
  wire [25:0] celloutsig_0_27z;
  reg [6:0] celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [2:0] celloutsig_0_31z;
  wire celloutsig_0_34z;
  wire [3:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [10:0] celloutsig_0_39z;
  wire [34:0] celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire [31:0] celloutsig_0_42z;
  reg [3:0] celloutsig_0_43z;
  wire [4:0] celloutsig_0_44z;
  wire [12:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [16:0] celloutsig_0_52z;
  wire celloutsig_0_55z;
  wire [50:0] celloutsig_0_5z;
  wire [11:0] celloutsig_0_66z;
  reg [5:0] celloutsig_0_6z;
  wire celloutsig_0_72z;
  wire [29:0] celloutsig_0_7z;
  wire [2:0] celloutsig_0_85z;
  wire [5:0] celloutsig_0_86z;
  wire celloutsig_0_87z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  reg [4:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [2:0] celloutsig_1_13z;
  reg [14:0] celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire [3:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  reg [5:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [7:0] celloutsig_1_7z;
  reg [14:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_38z = ~celloutsig_0_9z;
  assign celloutsig_0_47z = ~((celloutsig_0_26z[7] | celloutsig_0_28z[2]) & celloutsig_0_25z[0]);
  assign celloutsig_0_49z = ~((celloutsig_0_9z | celloutsig_0_47z) & (celloutsig_0_38z | celloutsig_0_42z[21]));
  assign celloutsig_0_0z = in_data[26] ^ in_data[37];
  assign celloutsig_1_9z = celloutsig_1_3z ^ celloutsig_1_0z;
  assign celloutsig_1_16z = celloutsig_1_3z ^ celloutsig_1_10z[1];
  assign celloutsig_0_30z = celloutsig_0_6z[2] ^ celloutsig_0_7z[28];
  assign celloutsig_0_41z = ~(celloutsig_0_37z ^ in_data[25]);
  assign celloutsig_0_72z = ~(celloutsig_0_52z[10] ^ celloutsig_0_6z[3]);
  assign celloutsig_0_8z = ~(celloutsig_0_4z ^ celloutsig_0_7z[20]);
  assign celloutsig_0_86z = celloutsig_0_66z[9:4] & { celloutsig_0_85z[0], celloutsig_0_44z };
  assign celloutsig_1_1z = { in_data[190:188], celloutsig_1_0z } & { in_data[98:96], celloutsig_1_0z };
  assign celloutsig_0_3z = in_data[74:40] & { in_data[71:55], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_42z = { celloutsig_0_16z[4:0], celloutsig_0_11z, celloutsig_0_36z, celloutsig_0_0z, celloutsig_0_22z, celloutsig_0_9z, celloutsig_0_41z, celloutsig_0_30z, celloutsig_0_10z, celloutsig_0_38z, celloutsig_0_37z } / { 1'h1, celloutsig_0_16z[15:3], celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_26z };
  assign celloutsig_1_2z = { in_data[103:101], celloutsig_1_0z } / { 1'h1, celloutsig_1_1z[2:0] };
  assign celloutsig_0_4z = celloutsig_0_3z[33:21] && { in_data[28:17], celloutsig_0_2z };
  assign celloutsig_0_50z = { celloutsig_0_20z[2:0], celloutsig_0_14z } < celloutsig_0_5z[28:25];
  assign celloutsig_0_9z = celloutsig_0_7z[8:1] < { celloutsig_0_7z[15:9], celloutsig_0_0z };
  assign celloutsig_1_12z = celloutsig_1_4z[3:0] < { in_data[154], celloutsig_1_10z };
  assign celloutsig_0_24z = { celloutsig_0_21z, celloutsig_0_1z } < { celloutsig_0_23z[3:2], celloutsig_0_11z, celloutsig_0_19z };
  assign celloutsig_1_6z = celloutsig_1_1z[0] & ~(in_data[140]);
  assign celloutsig_0_44z = { celloutsig_0_24z, celloutsig_0_43z } % { 1'h1, celloutsig_0_3z[16:13] };
  assign celloutsig_0_1z = { in_data[41:40], celloutsig_0_0z } % { 1'h1, in_data[62], in_data[0] };
  assign celloutsig_0_27z = { celloutsig_0_16z[16:0], celloutsig_0_14z, celloutsig_0_20z } % { 1'h1, celloutsig_0_5z[25:1] };
  assign celloutsig_0_10z = { celloutsig_0_5z[15:10], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_2z } % { 1'h1, celloutsig_0_3z[24:10] };
  assign celloutsig_0_52z = celloutsig_0_6z[1] ? { celloutsig_0_22z[2:1], celloutsig_0_19z, celloutsig_0_41z, celloutsig_0_12z } : { celloutsig_0_3z[33:20], celloutsig_0_49z, celloutsig_0_19z, celloutsig_0_24z };
  assign celloutsig_0_66z = celloutsig_0_3z[33] ? in_data[55:44] : { celloutsig_0_3z[31:26], celloutsig_0_55z, celloutsig_0_24z, celloutsig_0_35z };
  assign celloutsig_1_7z = in_data[108] ? { celloutsig_1_2z[1], celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_5z } : { in_data[114:111], celloutsig_1_2z };
  assign celloutsig_0_13z = celloutsig_0_8z ? { celloutsig_0_10z[6:4], celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_9z } : { celloutsig_0_5z[46:41], celloutsig_0_1z };
  assign celloutsig_0_16z = celloutsig_0_1z[1] ? { celloutsig_0_12z[12:5], celloutsig_0_13z, celloutsig_0_8z } : { celloutsig_0_13z[5:2], celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_1z[2], 1'h0, celloutsig_0_1z[0], celloutsig_0_1z[2], 1'h0, celloutsig_0_1z[0] };
  assign celloutsig_0_35z = ~ celloutsig_0_12z[3:0];
  assign celloutsig_0_85z = ~ celloutsig_0_28z[3:1];
  assign celloutsig_0_23z = ~ { celloutsig_0_3z[11:10], celloutsig_0_15z, celloutsig_0_6z };
  assign celloutsig_0_7z = { celloutsig_0_3z[24:7], celloutsig_0_6z, celloutsig_0_6z } | celloutsig_0_3z[34:5];
  assign celloutsig_1_10z = celloutsig_1_7z[5:3] | in_data[128:126];
  assign celloutsig_0_31z = celloutsig_0_13z[7:5] | celloutsig_0_16z[10:8];
  assign celloutsig_0_36z = | celloutsig_0_23z[6:1];
  assign celloutsig_0_11z = | in_data[34:23];
  assign celloutsig_0_34z = | { celloutsig_0_20z[5:1], celloutsig_0_1z };
  assign celloutsig_1_5z = | celloutsig_1_4z[3:0];
  assign celloutsig_0_14z = | { celloutsig_0_11z, celloutsig_0_5z[37:33], celloutsig_0_4z };
  assign celloutsig_0_15z = | in_data[34:9];
  assign celloutsig_0_55z = ~^ { celloutsig_0_12z[10:0], celloutsig_0_34z, celloutsig_0_50z, celloutsig_0_46z, celloutsig_0_31z, celloutsig_0_47z, celloutsig_0_37z, celloutsig_0_34z, celloutsig_0_11z };
  assign celloutsig_0_87z = ~^ { celloutsig_0_66z[8:6], celloutsig_0_72z, celloutsig_0_85z };
  assign celloutsig_1_0z = ~^ in_data[119:101];
  assign celloutsig_1_3z = ~^ in_data[135:133];
  assign celloutsig_0_19z = ~^ { celloutsig_0_7z[15:11], celloutsig_0_14z, celloutsig_0_8z };
  assign celloutsig_0_21z = ~^ { celloutsig_0_10z[14], celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_0_2z = ~^ { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_37z = ^ celloutsig_0_16z[7:1];
  assign celloutsig_1_18z = ^ { in_data[101:97], celloutsig_1_13z };
  assign celloutsig_1_19z = ^ { celloutsig_1_14z[6], celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_16z };
  assign celloutsig_0_46z = { celloutsig_0_5z[26:15], celloutsig_0_4z } <<< { celloutsig_0_27z[19], celloutsig_0_39z, celloutsig_0_9z };
  assign celloutsig_0_22z = celloutsig_0_13z[6:4] <<< celloutsig_0_7z[29:27];
  assign celloutsig_0_5z = { celloutsig_0_3z[18:12], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z } >>> { celloutsig_0_3z[20:19], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_39z = { celloutsig_0_16z[6], celloutsig_0_4z, celloutsig_0_23z } ^ celloutsig_0_25z[14:4];
  assign celloutsig_1_13z = { celloutsig_1_0z, celloutsig_1_9z, celloutsig_1_12z } ^ { celloutsig_1_1z[2], celloutsig_1_6z, celloutsig_1_9z };
  assign celloutsig_0_12z = { celloutsig_0_10z[14:3], celloutsig_0_0z } ^ { celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_6z };
  always_latch
    if (clkin_data[96]) celloutsig_0_43z = 4'h0;
    else if (clkin_data[0]) celloutsig_0_43z = celloutsig_0_10z[13:10];
  always_latch
    if (celloutsig_1_19z) celloutsig_0_6z = 6'h00;
    else if (clkin_data[0]) celloutsig_0_6z = { celloutsig_0_5z[27:23], celloutsig_0_0z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_4z = 6'h00;
    else if (!clkin_data[64]) celloutsig_1_4z = { celloutsig_1_2z[3:1], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z };
  always_latch
    if (clkin_data[160]) celloutsig_1_8z = 15'h0000;
    else if (clkin_data[64]) celloutsig_1_8z = { celloutsig_1_4z[3:0], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z };
  always_latch
    if (clkin_data[128]) celloutsig_1_11z = 5'h00;
    else if (clkin_data[32]) celloutsig_1_11z = celloutsig_1_8z[13:9];
  always_latch
    if (clkin_data[160]) celloutsig_1_14z = 15'h0000;
    else if (clkin_data[64]) celloutsig_1_14z = { celloutsig_1_10z[0], celloutsig_1_3z, celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_2z };
  always_latch
    if (clkin_data[96]) celloutsig_0_20z = 8'h00;
    else if (!clkin_data[0]) celloutsig_0_20z = { celloutsig_0_7z[17:13], celloutsig_0_1z };
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_25z = 15'h0000;
    else if (clkin_data[0]) celloutsig_0_25z = { celloutsig_0_3z[30:24], celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_11z };
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_26z = 14'h0000;
    else if (!clkin_data[0]) celloutsig_0_26z = { in_data[5], celloutsig_0_12z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_28z = 7'h00;
    else if (clkin_data[0]) celloutsig_0_28z = { celloutsig_0_7z[18:14], celloutsig_0_14z, celloutsig_0_8z };
  assign { out_data[128], out_data[96], out_data[37:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_86z, celloutsig_0_87z };
endmodule
