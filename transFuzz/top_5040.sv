/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [9:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [7:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [7:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [11:0] celloutsig_0_22z;
  wire [4:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [7:0] celloutsig_0_27z;
  wire [4:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [7:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  reg [10:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_36z;
  reg [5:0] celloutsig_0_37z;
  wire [11:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [3:0] celloutsig_0_3z;
  reg [4:0] celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire [2:0] celloutsig_0_44z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [3:0] celloutsig_0_50z;
  wire [13:0] celloutsig_0_52z;
  wire [22:0] celloutsig_0_53z;
  wire [19:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [17:0] celloutsig_0_91z;
  wire [9:0] celloutsig_0_92z;
  wire celloutsig_0_9z;
  wire [12:0] celloutsig_1_0z;
  wire [2:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [4:0] celloutsig_1_18z;
  wire [7:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire celloutsig_1_6z;
  reg [6:0] celloutsig_1_7z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_31z = !(celloutsig_0_8z ? celloutsig_0_15z : celloutsig_0_12z);
  assign celloutsig_0_14z = ~celloutsig_0_1z;
  assign celloutsig_0_4z = celloutsig_0_3z[1] | celloutsig_0_2z;
  assign celloutsig_0_42z = celloutsig_0_16z[5] | celloutsig_0_36z;
  assign celloutsig_0_6z = celloutsig_0_4z | celloutsig_0_0z[8];
  assign celloutsig_0_21z = celloutsig_0_2z | celloutsig_0_4z;
  assign celloutsig_0_24z = celloutsig_0_20z | in_data[19];
  assign celloutsig_0_26z = celloutsig_0_19z | celloutsig_0_20z;
  assign celloutsig_0_33z = celloutsig_0_29z[3] | celloutsig_0_12z;
  assign celloutsig_0_8z = celloutsig_0_3z[3] ^ celloutsig_0_5z[2];
  assign celloutsig_0_92z = celloutsig_0_22z[11:2] / { 1'h1, celloutsig_0_53z[19], celloutsig_0_13z };
  assign celloutsig_1_6z = { celloutsig_1_0z[4:0], celloutsig_1_1z } || { in_data[156:153], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_1z = celloutsig_1_0z[3:1] < in_data[136:134];
  assign celloutsig_0_11z = { celloutsig_0_0z[8:1], celloutsig_0_6z } < { celloutsig_0_0z[8:1], celloutsig_0_10z };
  assign celloutsig_0_91z = celloutsig_0_16z[7] ? celloutsig_0_53z[17:0] : { celloutsig_0_22z[6:3], celloutsig_0_25z, celloutsig_0_9z, celloutsig_0_44z[2:1], 1'h0, celloutsig_0_30z, celloutsig_0_6z };
  assign celloutsig_0_22z = - { in_data[30:24], celloutsig_0_3z, celloutsig_0_10z };
  assign celloutsig_0_29z = - { celloutsig_0_5z[17], celloutsig_0_26z, celloutsig_0_26z, celloutsig_0_19z, celloutsig_0_24z };
  assign celloutsig_0_53z = { in_data[35:14], celloutsig_0_21z } | { celloutsig_0_32z[7:1], celloutsig_0_52z, celloutsig_0_42z, celloutsig_0_14z };
  assign celloutsig_0_18z = & celloutsig_0_16z[6:4];
  assign celloutsig_0_9z = | { celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_8z };
  assign celloutsig_0_12z = | { celloutsig_0_8z, celloutsig_0_3z };
  assign celloutsig_0_15z = | in_data[21:17];
  assign celloutsig_0_17z = | { celloutsig_0_5z[17:14], celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_6z, celloutsig_0_9z };
  assign celloutsig_0_46z = celloutsig_0_37z[5] & celloutsig_0_0z[3];
  assign celloutsig_0_7z = celloutsig_0_2z & in_data[66];
  assign celloutsig_1_15z = celloutsig_1_0z[2] & celloutsig_1_4z;
  assign celloutsig_0_39z = | in_data[93:91];
  assign celloutsig_0_47z = ~^ { celloutsig_0_38z[10:0], celloutsig_0_31z, celloutsig_0_20z };
  assign celloutsig_0_49z = ~^ { celloutsig_0_0z[9:8], celloutsig_0_36z, celloutsig_0_22z };
  assign celloutsig_1_2z = ~^ { celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_4z = ~^ in_data[176:144];
  assign celloutsig_0_10z = ~^ { celloutsig_0_5z[18:11], celloutsig_0_6z };
  assign celloutsig_0_1z = ~^ { celloutsig_0_0z[3:0], celloutsig_0_0z };
  assign celloutsig_0_20z = ~^ { celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_18z };
  assign celloutsig_0_25z = ~^ { celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_22z, celloutsig_0_8z, celloutsig_0_18z, celloutsig_0_23z };
  assign celloutsig_0_36z = ~^ celloutsig_0_3z;
  assign celloutsig_0_19z = ^ { celloutsig_0_16z[6:2], celloutsig_0_1z, celloutsig_0_15z, celloutsig_0_0z };
  assign celloutsig_0_2z = ^ in_data[7:0];
  assign celloutsig_0_38z = { celloutsig_0_5z[14:12], celloutsig_0_29z, celloutsig_0_24z, celloutsig_0_25z, celloutsig_0_15z, celloutsig_0_14z } << { celloutsig_0_27z[7:5], celloutsig_0_33z, celloutsig_0_37z, celloutsig_0_8z, celloutsig_0_24z };
  assign celloutsig_0_50z = { celloutsig_0_3z[2:1], celloutsig_0_18z, celloutsig_0_1z } << { celloutsig_0_4z, celloutsig_0_47z, celloutsig_0_8z, celloutsig_0_46z };
  assign celloutsig_1_0z = in_data[120:108] << in_data[180:168];
  assign celloutsig_1_14z = { in_data[153:152], celloutsig_1_1z } << { 2'h0, celloutsig_1_6z };
  assign celloutsig_0_13z = { celloutsig_0_0z[9:3], celloutsig_0_11z } << celloutsig_0_0z[9:2];
  assign celloutsig_0_27z = { celloutsig_0_22z[8:3], celloutsig_0_4z, celloutsig_0_20z } << { celloutsig_0_23z[4], celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_25z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_19z };
  assign celloutsig_0_30z = { celloutsig_0_23z[2:0], celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_15z, celloutsig_0_1z, celloutsig_0_8z } >> { celloutsig_0_13z[4], celloutsig_0_7z, celloutsig_0_23z, celloutsig_0_18z };
  assign celloutsig_0_3z = celloutsig_0_0z[7:4] >> { celloutsig_0_0z[2], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_0z = in_data[41:32] - in_data[31:22];
  assign celloutsig_0_5z = { in_data[79:61], celloutsig_0_4z } - { in_data[40:31], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_52z = { celloutsig_0_9z, celloutsig_0_50z, celloutsig_0_31z, celloutsig_0_39z, celloutsig_0_1z, celloutsig_0_47z, celloutsig_0_49z, celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_19z } - { celloutsig_0_16z[6:3], celloutsig_0_29z, celloutsig_0_6z, celloutsig_0_49z, celloutsig_0_33z, celloutsig_0_11z, celloutsig_0_18z };
  assign celloutsig_1_19z = in_data[126:119] - { celloutsig_1_7z, celloutsig_1_1z };
  assign celloutsig_0_16z = { celloutsig_0_13z[4:1], celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_1z } - { celloutsig_0_3z[2:0], celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_4z, celloutsig_0_10z };
  assign celloutsig_0_23z = { celloutsig_0_13z[4:1], celloutsig_0_19z } - { celloutsig_0_22z[5], celloutsig_0_1z, celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_17z };
  assign celloutsig_1_18z = { celloutsig_1_14z[0], celloutsig_1_14z, celloutsig_1_15z } ^ celloutsig_1_0z[5:1];
  always_latch
    if (clkin_data[64]) celloutsig_0_40z = 5'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_40z = { celloutsig_0_32z[4:2], celloutsig_0_17z, celloutsig_0_11z };
  always_latch
    if (!clkin_data[96]) celloutsig_1_7z = 7'h00;
    else if (clkin_data[32]) celloutsig_1_7z = { in_data[174:169], celloutsig_1_2z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_32z = 11'h000;
    else if (!clkin_data[0]) celloutsig_0_32z = { celloutsig_0_22z[10:3], celloutsig_0_1z, celloutsig_0_21z, celloutsig_0_26z };
  always_latch
    if (clkin_data[64]) celloutsig_0_37z = 6'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_37z = { celloutsig_0_22z[3:0], celloutsig_0_26z, celloutsig_0_2z };
  assign { celloutsig_0_44z[1], celloutsig_0_44z[2] } = { celloutsig_0_18z, celloutsig_0_2z } ^ { celloutsig_0_40z[0], celloutsig_0_40z[1] };
  assign celloutsig_0_44z[0] = 1'h0;
  assign { out_data[132:128], out_data[103:96], out_data[49:32], out_data[9:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_91z, celloutsig_0_92z };
endmodule
