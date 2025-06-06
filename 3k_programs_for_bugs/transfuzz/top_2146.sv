/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [8:0] celloutsig_0_12z;
  wire [11:0] celloutsig_0_13z;
  wire [3:0] celloutsig_0_14z;
  wire [3:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [32:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [10:0] celloutsig_0_23z;
  wire [4:0] celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire [9:0] celloutsig_0_27z;
  wire [2:0] celloutsig_0_28z;
  reg [7:0] celloutsig_0_29z;
  wire [4:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire [3:0] celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire [2:0] celloutsig_0_36z;
  wire [4:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [5:0] celloutsig_0_41z;
  wire [7:0] celloutsig_0_4z;
  wire celloutsig_0_51z;
  reg [12:0] celloutsig_0_52z;
  wire [14:0] celloutsig_0_5z;
  wire [6:0] celloutsig_0_62z;
  wire celloutsig_0_66z;
  wire celloutsig_0_67z;
  wire [3:0] celloutsig_0_6z;
  wire [22:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [13:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [17:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [7:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [3:0] celloutsig_1_6z;
  wire [14:0] celloutsig_1_7z;
  wire [19:0] celloutsig_1_8z;
  wire [13:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_11z = !(celloutsig_1_9z[13] ? celloutsig_1_5z : celloutsig_1_7z[4]);
  assign celloutsig_0_16z = !(celloutsig_0_6z[1] ? celloutsig_0_7z[9] : celloutsig_0_12z[8]);
  assign celloutsig_1_1z = ~((celloutsig_1_0z | celloutsig_1_0z) & celloutsig_1_0z);
  assign celloutsig_1_5z = ~((celloutsig_1_1z | celloutsig_1_1z) & celloutsig_1_0z);
  assign celloutsig_0_32z = ~((celloutsig_0_20z | celloutsig_0_23z[7]) & celloutsig_0_16z);
  assign celloutsig_0_0z = in_data[20] | ~(in_data[28]);
  assign celloutsig_1_10z = celloutsig_1_1z | ~(in_data[111]);
  assign celloutsig_0_11z = celloutsig_0_2z[2] | ~(celloutsig_0_1z);
  assign celloutsig_0_30z = celloutsig_0_18z | ~(celloutsig_0_11z);
  assign celloutsig_1_7z = in_data[182:168] + { in_data[143:135], celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_1z };
  assign celloutsig_0_27z = { celloutsig_0_9z[12], celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_22z, celloutsig_0_11z } + { celloutsig_0_7z[14:6], celloutsig_0_19z };
  assign celloutsig_0_26z = celloutsig_0_7z[19:2] === { celloutsig_0_9z[8:1], celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_24z };
  assign celloutsig_1_0z = in_data[138:130] >= in_data[142:134];
  assign celloutsig_1_12z = in_data[167:153] >= { celloutsig_1_8z[19:6], celloutsig_1_11z };
  assign celloutsig_0_40z = { celloutsig_0_17z[32:7], celloutsig_0_19z } > { in_data[40:23], celloutsig_0_35z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_19z };
  assign celloutsig_1_18z = celloutsig_1_2z[14:6] > { celloutsig_1_8z[19:14], celloutsig_1_14z, celloutsig_1_3z, celloutsig_1_12z };
  assign celloutsig_0_1z = { in_data[84:82], celloutsig_0_0z, celloutsig_0_0z } > in_data[19:15];
  assign celloutsig_0_35z = { celloutsig_0_29z[6], celloutsig_0_9z } <= { celloutsig_0_9z[7:0], celloutsig_0_6z, celloutsig_0_28z };
  assign celloutsig_0_21z = { celloutsig_0_17z[20:0], celloutsig_0_1z } <= { celloutsig_0_3z[1], celloutsig_0_4z, celloutsig_0_13z, celloutsig_0_18z };
  assign celloutsig_0_67z = { celloutsig_0_41z[4:1], celloutsig_0_11z } < { celloutsig_0_62z[5], celloutsig_0_6z };
  assign celloutsig_0_19z = celloutsig_0_10z[0] & ~(celloutsig_0_14z[2]);
  assign celloutsig_0_3z = { in_data[13], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } % { 1'h1, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, in_data[0] };
  assign celloutsig_0_4z = { celloutsig_0_3z[4:2], celloutsig_0_3z } % { 1'h1, celloutsig_0_3z[3:2], celloutsig_0_3z[4:1], in_data[0] };
  assign celloutsig_0_5z = { celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z } % { 1'h1, celloutsig_0_3z[2:1], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_1_4z = { celloutsig_1_2z[14:8], celloutsig_1_0z } % { 1'h1, in_data[165:159] };
  assign celloutsig_1_8z = { celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_4z } % { 1'h1, in_data[172:158], celloutsig_1_6z };
  assign celloutsig_0_17z = { celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_0z } % { 1'h1, in_data[56:37], celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_0_2z = { in_data[93], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z } % { 1'h1, in_data[16], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_24z = celloutsig_0_7z[11:7] % { 1'h1, celloutsig_0_4z[0], celloutsig_0_10z };
  assign celloutsig_1_9z = celloutsig_1_1z ? { in_data[129:117], celloutsig_1_0z } : celloutsig_1_7z[14:1];
  assign celloutsig_1_19z = celloutsig_1_0z ? { celloutsig_1_4z[1:0], celloutsig_1_10z } : celloutsig_1_4z[7:5];
  assign celloutsig_0_12z = celloutsig_0_9z[10] ? { celloutsig_0_4z[7], celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_10z } : { celloutsig_0_7z[8:1], celloutsig_0_8z };
  assign celloutsig_1_3z = in_data[176:169] != { celloutsig_1_2z[12:6], celloutsig_1_0z };
  assign celloutsig_1_14z = in_data[126:124] != celloutsig_1_7z[12:10];
  assign celloutsig_0_18z = celloutsig_0_6z != celloutsig_0_4z[7:4];
  assign celloutsig_0_7z = { in_data[77:68], celloutsig_0_2z, celloutsig_0_4z } | { celloutsig_0_6z[2:1], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_51z = | { celloutsig_0_23z[6], celloutsig_0_23z[2:0] };
  assign celloutsig_0_20z = | { celloutsig_0_18z, celloutsig_0_15z };
  assign celloutsig_0_22z = | celloutsig_0_14z[3:1];
  assign celloutsig_0_66z = ~^ { celloutsig_0_27z[9:1], celloutsig_0_32z, celloutsig_0_30z, celloutsig_0_35z, celloutsig_0_40z };
  assign celloutsig_0_8z = ~^ { celloutsig_0_2z[3:0], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_6z };
  assign celloutsig_0_33z = celloutsig_0_24z[3:0] >> celloutsig_0_13z[3:0];
  assign celloutsig_0_41z = { celloutsig_0_36z[2], celloutsig_0_40z, celloutsig_0_10z, celloutsig_0_0z } >> { celloutsig_0_2z[2:1], celloutsig_0_6z };
  assign celloutsig_0_13z = { celloutsig_0_12z[4], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_0z } >> { in_data[72:65], celloutsig_0_1z, celloutsig_0_10z };
  assign celloutsig_0_14z = celloutsig_0_12z[4:1] >> in_data[24:21];
  assign celloutsig_0_6z = celloutsig_0_5z[4:1] << { celloutsig_0_3z[3:1], celloutsig_0_0z };
  assign celloutsig_1_2z = in_data[124:107] << { in_data[158:143], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_15z = celloutsig_0_2z[3:0] << { celloutsig_0_3z[2:0], celloutsig_0_11z };
  assign celloutsig_0_36z = celloutsig_0_27z[2:0] <<< { celloutsig_0_3z[3:2], celloutsig_0_16z };
  assign celloutsig_0_62z = celloutsig_0_52z[9:3] <<< { celloutsig_0_26z, celloutsig_0_33z, celloutsig_0_8z, celloutsig_0_51z };
  assign celloutsig_1_6z = { celloutsig_1_2z[13:12], celloutsig_1_5z, celloutsig_1_3z } <<< celloutsig_1_4z[5:2];
  assign celloutsig_0_9z = { celloutsig_0_7z[15:7], celloutsig_0_6z, celloutsig_0_0z } <<< { celloutsig_0_7z[17:5], celloutsig_0_0z };
  assign celloutsig_0_10z = celloutsig_0_9z[12:10] <<< celloutsig_0_7z[15:13];
  assign celloutsig_0_28z = { celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_21z } - celloutsig_0_9z[13:11];
  always_latch
    if (!clkin_data[64]) celloutsig_0_52z = 13'h0000;
    else if (celloutsig_1_19z[0]) celloutsig_0_52z = { celloutsig_0_2z[4:1], celloutsig_0_30z, celloutsig_0_4z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_29z = 8'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_29z = in_data[60:53];
  assign { celloutsig_0_23z[0], celloutsig_0_23z[2], celloutsig_0_23z[10:6], celloutsig_0_23z[1] } = ~ { celloutsig_0_19z, celloutsig_0_18z, celloutsig_0_13z[4:3], celloutsig_0_10z, celloutsig_0_8z };
  assign celloutsig_0_23z[5:3] = celloutsig_0_23z[8:6];
  assign { out_data[128], out_data[98:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_66z, celloutsig_0_67z };
endmodule
