/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [24:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [11:0] celloutsig_0_12z;
  wire celloutsig_0_14z;
  wire [18:0] celloutsig_0_15z;
  reg [10:0] celloutsig_0_16z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [7:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [21:0] celloutsig_0_28z;
  wire [21:0] celloutsig_0_2z;
  wire [3:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [5:0] celloutsig_0_33z;
  wire [11:0] celloutsig_0_35z;
  reg [4:0] celloutsig_0_37z;
  wire [6:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [12:0] celloutsig_0_42z;
  wire [5:0] celloutsig_0_4z;
  wire [5:0] celloutsig_0_5z;
  wire [8:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [21:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire [2:0] celloutsig_1_18z;
  wire [4:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  reg [2:0] celloutsig_1_8z;
  wire [4:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_7z = ~(celloutsig_0_0z[18] | celloutsig_0_0z[2]);
  assign celloutsig_0_14z = ~(celloutsig_0_12z[0] | celloutsig_0_0z[23]);
  assign celloutsig_0_40z = ~((celloutsig_0_19z | celloutsig_0_35z[11]) & (celloutsig_0_33z[4] | celloutsig_0_12z[11]));
  assign celloutsig_0_41z = ~((celloutsig_0_21z | celloutsig_0_40z) & (celloutsig_0_28z[7] | celloutsig_0_12z[2]));
  assign celloutsig_1_12z = ~((celloutsig_1_7z | celloutsig_1_9z[1]) & (celloutsig_1_10z | celloutsig_1_0z[0]));
  assign celloutsig_1_10z = celloutsig_1_1z | ~(celloutsig_1_7z);
  assign celloutsig_0_11z = celloutsig_0_0z[23] | ~(celloutsig_0_9z);
  assign celloutsig_0_24z = celloutsig_0_0z[7] | ~(celloutsig_0_10z);
  assign celloutsig_0_2z = { in_data[81:61], celloutsig_0_1z } / { 1'h1, in_data[50:32], celloutsig_0_1z, in_data[0] };
  assign celloutsig_1_3z = in_data[166:158] == { celloutsig_1_0z[3:1], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_5z = { celloutsig_1_4z, celloutsig_1_4z } == in_data[105:100];
  assign celloutsig_1_7z = { celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_5z } >= { celloutsig_1_2z[5:0], celloutsig_1_6z };
  assign celloutsig_0_1z = celloutsig_0_0z[17:3] && celloutsig_0_0z[17:3];
  assign celloutsig_0_9z = in_data[89] & ~(celloutsig_0_2z[18]);
  assign celloutsig_0_22z = celloutsig_0_5z[2] & ~(celloutsig_0_19z);
  assign celloutsig_0_32z = celloutsig_0_21z & ~(celloutsig_0_20z);
  assign celloutsig_0_8z = { celloutsig_0_2z[21:9], celloutsig_0_6z } % { 1'h1, celloutsig_0_2z[15:1], celloutsig_0_4z };
  assign celloutsig_0_4z = celloutsig_0_3z[5:0] % { 1'h1, celloutsig_0_3z[4:1], in_data[0] };
  assign celloutsig_1_0z = in_data[128:124] % { 1'h1, in_data[188:185] };
  assign celloutsig_0_23z = celloutsig_0_16z[10:3] % { 1'h1, in_data[70:67], celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_7z };
  assign celloutsig_1_2z = { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z } * { celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_35z = - { celloutsig_0_16z[4], celloutsig_0_22z, celloutsig_0_6z, celloutsig_0_21z };
  assign celloutsig_0_3z = - celloutsig_0_2z[6:0];
  assign celloutsig_1_19z = - { celloutsig_1_4z[0], celloutsig_1_4z, celloutsig_1_1z };
  assign celloutsig_1_14z = { celloutsig_1_9z, celloutsig_1_3z, celloutsig_1_12z, celloutsig_1_12z } !== { celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_3z };
  assign celloutsig_1_15z = { celloutsig_1_4z, celloutsig_1_1z } !== { celloutsig_1_4z[1:0], celloutsig_1_1z, celloutsig_1_14z };
  assign celloutsig_0_20z = { celloutsig_0_15z[17:15], celloutsig_0_15z, celloutsig_0_1z } !== { celloutsig_0_0z[16:8], celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_33z = ~ { celloutsig_0_28z[21:20], celloutsig_0_31z };
  assign celloutsig_1_4z = ~ { celloutsig_1_2z[4:3], celloutsig_1_1z };
  assign celloutsig_1_9z = { celloutsig_1_4z[1], celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_3z } | { celloutsig_1_8z[0], celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_7z };
  assign celloutsig_1_18z = celloutsig_1_8z | { celloutsig_1_16z, celloutsig_1_1z, celloutsig_1_15z };
  assign celloutsig_0_31z = { celloutsig_0_23z[7], celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_14z } | celloutsig_0_28z[6:3];
  assign celloutsig_1_1z = | { in_data[119], celloutsig_1_0z };
  assign celloutsig_1_6z = | { celloutsig_1_2z[3:1], celloutsig_1_1z };
  assign celloutsig_1_11z = | in_data[150:147];
  assign celloutsig_1_16z = | { in_data[187], celloutsig_1_9z };
  assign celloutsig_0_10z = | celloutsig_0_2z[20:15];
  assign celloutsig_0_19z = | { celloutsig_0_8z[18:4], celloutsig_0_10z };
  assign celloutsig_0_21z = ^ celloutsig_0_8z[16:3];
  assign celloutsig_0_6z = in_data[55:47] <<< { celloutsig_0_3z[2:1], celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_0_12z = { celloutsig_0_8z[20:10], celloutsig_0_11z } <<< { celloutsig_0_6z[7:4], celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_5z };
  assign celloutsig_0_42z = { celloutsig_0_3z[6:1], celloutsig_0_21z, celloutsig_0_33z } >>> { celloutsig_0_32z, celloutsig_0_20z, celloutsig_0_10z, celloutsig_0_21z, celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_32z, celloutsig_0_37z, celloutsig_0_24z };
  assign celloutsig_0_5z = in_data[53:48] >>> in_data[75:70];
  assign celloutsig_0_15z = { in_data[26:15], celloutsig_0_3z } >>> { celloutsig_0_8z[20:9], celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_1z };
  assign celloutsig_0_28z = { celloutsig_0_0z[17:7], celloutsig_0_23z, celloutsig_0_21z, celloutsig_0_7z, celloutsig_0_14z } >>> { celloutsig_0_21z, celloutsig_0_15z, celloutsig_0_21z, celloutsig_0_7z };
  always_latch
    if (clkin_data[32]) celloutsig_0_0z = 25'h0000000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_0z = in_data[63:39];
  always_latch
    if (!clkin_data[32]) celloutsig_0_37z = 5'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_37z = celloutsig_0_15z[8:4];
  always_latch
    if (!clkin_data[64]) celloutsig_1_8z = 3'h0;
    else if (clkin_data[0]) celloutsig_1_8z = in_data[168:166];
  always_latch
    if (clkin_data[32]) celloutsig_0_16z = 11'h000;
    else if (celloutsig_1_19z[0]) celloutsig_0_16z = { in_data[38:29], celloutsig_0_1z };
  assign { out_data[130:128], out_data[100:96], out_data[32], out_data[12:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_41z, celloutsig_0_42z };
endmodule
