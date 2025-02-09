/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [4:0] celloutsig_0_0z;
  wire [9:0] celloutsig_0_10z;
  wire [17:0] celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [2:0] celloutsig_0_17z;
  wire [18:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  wire [3:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_25z;
  reg [20:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [9:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire [11:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire celloutsig_0_39z;
  wire [3:0] celloutsig_0_3z;
  wire [2:0] celloutsig_0_45z;
  wire [21:0] celloutsig_0_48z;
  wire [11:0] celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire [3:0] celloutsig_0_52z;
  wire [14:0] celloutsig_0_5z;
  wire [2:0] celloutsig_0_6z;
  wire [3:0] celloutsig_0_7z;
  wire [7:0] celloutsig_0_8z;
  wire [11:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [2:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [4:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [3:0] celloutsig_1_19z;
  wire [14:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [13:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  reg [2:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_18z = ~(celloutsig_1_15z[2] & celloutsig_1_13z[1]);
  assign celloutsig_0_1z = ~(celloutsig_0_0z[4] & in_data[95]);
  assign celloutsig_0_22z = ~(in_data[48] & celloutsig_0_15z);
  assign celloutsig_0_25z = ~(celloutsig_0_7z[1] & celloutsig_0_3z[2]);
  assign celloutsig_1_8z = ~(celloutsig_1_7z[2] | celloutsig_1_0z);
  assign celloutsig_1_17z = celloutsig_1_15z[2] | celloutsig_1_15z[4];
  assign celloutsig_1_13z = celloutsig_1_1z[11:9] & { celloutsig_1_4z[12:11], celloutsig_1_6z };
  assign celloutsig_0_7z = in_data[40:37] & celloutsig_0_0z[3:0];
  assign celloutsig_0_17z = celloutsig_0_3z[3:1] & in_data[90:88];
  assign celloutsig_1_3z = { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z } === celloutsig_1_1z[12:9];
  assign celloutsig_0_30z = in_data[51:39] === { celloutsig_0_18z[15:4], celloutsig_0_23z };
  assign celloutsig_0_39z = { celloutsig_0_18z[9], celloutsig_0_2z, celloutsig_0_34z } && { celloutsig_0_9z[11:2], celloutsig_0_14z, celloutsig_0_14z, celloutsig_0_37z, celloutsig_0_13z };
  assign celloutsig_1_6z = celloutsig_1_4z[10:7] && { celloutsig_1_4z[10], celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_0z };
  assign celloutsig_0_15z = { celloutsig_0_11z[15], celloutsig_0_12z, celloutsig_0_6z } && celloutsig_0_11z[16:9];
  assign celloutsig_0_35z = ! { celloutsig_0_29z[8:0], celloutsig_0_28z };
  assign celloutsig_1_14z = celloutsig_1_4z[11:7] < celloutsig_1_1z[6:2];
  assign celloutsig_0_14z = { celloutsig_0_5z[8:2], celloutsig_0_13z } < { celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_0_0z = in_data[93:89] * in_data[79:75];
  assign celloutsig_1_4z = { celloutsig_1_1z[13:2], celloutsig_1_2z, celloutsig_1_0z } * in_data[162:149];
  assign celloutsig_1_7z = celloutsig_1_1z[6:4] * in_data[171:169];
  assign celloutsig_0_18z = { celloutsig_0_10z[7], celloutsig_0_11z } * in_data[86:68];
  assign celloutsig_1_19z = ~ { celloutsig_1_17z, celloutsig_1_8z, celloutsig_1_14z, celloutsig_1_3z };
  assign celloutsig_0_10z = ~ in_data[89:80];
  assign celloutsig_0_12z = ~ celloutsig_0_10z[3:0];
  assign celloutsig_0_51z = | { celloutsig_0_20z[3:2], celloutsig_0_32z };
  assign celloutsig_1_0z = | in_data[183:168];
  assign celloutsig_0_28z = | { celloutsig_0_6z, celloutsig_0_23z, celloutsig_0_18z, celloutsig_0_9z };
  assign celloutsig_0_32z = | { celloutsig_0_10z[4:1], celloutsig_0_30z };
  assign celloutsig_0_37z = celloutsig_0_0z[4] & celloutsig_0_5z[7];
  assign celloutsig_1_2z = in_data[147] & celloutsig_1_1z[2];
  assign celloutsig_1_5z = celloutsig_1_1z[7] & in_data[120];
  assign celloutsig_0_19z = celloutsig_0_17z[2] & celloutsig_0_18z[12];
  assign celloutsig_0_23z = celloutsig_0_1z & celloutsig_0_12z[0];
  assign celloutsig_0_2z = in_data[42] & in_data[64];
  assign celloutsig_0_13z = | { celloutsig_0_6z, celloutsig_0_1z };
  assign celloutsig_0_8z = celloutsig_0_5z[12:5] >> { celloutsig_0_3z[3:2], celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_0_9z = { celloutsig_0_4z[7:2], celloutsig_0_0z, celloutsig_0_1z } >> { celloutsig_0_8z[5], celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_0_20z = { celloutsig_0_8z[0], celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_13z } >> celloutsig_0_11z[3:0];
  assign celloutsig_0_29z = celloutsig_0_9z[10:1] >> celloutsig_0_10z;
  assign celloutsig_0_3z = { celloutsig_0_0z[2:0], celloutsig_0_2z } - { in_data[9:7], celloutsig_0_1z };
  assign celloutsig_0_52z = { celloutsig_0_48z[9], celloutsig_0_2z, celloutsig_0_35z, celloutsig_0_51z } - { celloutsig_0_48z[18], celloutsig_0_22z, celloutsig_0_2z, celloutsig_0_19z };
  assign celloutsig_0_5z = in_data[29:15] - { in_data[55:47], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_6z = celloutsig_0_3z[3:1] - { celloutsig_0_3z[1:0], celloutsig_0_1z };
  assign celloutsig_0_11z = { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_9z } - { celloutsig_0_8z[7], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_21z = celloutsig_0_4z[11:8] - celloutsig_0_4z[6:3];
  assign celloutsig_0_34z = { celloutsig_0_20z[3:2], celloutsig_0_22z, celloutsig_0_0z, celloutsig_0_21z } ^ { celloutsig_0_14z, celloutsig_0_32z, celloutsig_0_29z };
  assign celloutsig_0_4z = in_data[64:53] ^ { in_data[80:76], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_45z = celloutsig_0_12z[2:0] ^ celloutsig_0_3z[3:1];
  assign celloutsig_0_48z = { celloutsig_0_27z[16:7], celloutsig_0_19z, celloutsig_0_19z, celloutsig_0_30z, celloutsig_0_39z, celloutsig_0_0z, celloutsig_0_45z } ^ { celloutsig_0_18z[17:15], celloutsig_0_18z };
  assign celloutsig_1_15z = { celloutsig_1_9z[1], celloutsig_1_13z, celloutsig_1_14z } ^ { celloutsig_1_4z[6:3], celloutsig_1_5z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_9z = 3'h0;
    else if (clkin_data[32]) celloutsig_1_9z = celloutsig_1_7z;
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_27z = 21'h000000;
    else if (!clkin_data[0]) celloutsig_0_27z = { celloutsig_0_10z[9], celloutsig_0_25z, celloutsig_0_12z, celloutsig_0_17z, celloutsig_0_9z };
  assign celloutsig_1_1z[14:1] = in_data[109:96] ^ { in_data[121:109], celloutsig_1_0z };
  assign celloutsig_1_1z[0] = 1'h0;
  assign { out_data[128], out_data[99:96], out_data[32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_51z, celloutsig_0_52z };
endmodule
