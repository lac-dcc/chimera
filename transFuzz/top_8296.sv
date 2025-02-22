/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [4:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [4:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [26:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [3:0] celloutsig_0_16z;
  wire [21:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [3:0] celloutsig_0_1z;
  reg [47:0] celloutsig_0_20z;
  wire [15:0] celloutsig_0_21z;
  wire [9:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [16:0] celloutsig_0_25z;
  wire [7:0] celloutsig_0_26z;
  wire [3:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [17:0] celloutsig_0_2z;
  wire [25:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_36z;
  wire [10:0] celloutsig_0_37z;
  wire celloutsig_0_39z;
  wire [40:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire [17:0] celloutsig_0_45z;
  wire [13:0] celloutsig_0_46z;
  wire celloutsig_0_4z;
  reg [2:0] celloutsig_0_51z;
  wire [3:0] celloutsig_0_52z;
  wire [10:0] celloutsig_0_53z;
  wire [20:0] celloutsig_0_57z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_71z;
  wire [12:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [3:0] celloutsig_0_9z;
  wire [11:0] celloutsig_1_0z;
  wire [9:0] celloutsig_1_10z;
  wire [10:0] celloutsig_1_11z;
  wire [4:0] celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [7:0] celloutsig_1_2z;
  wire [6:0] celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [4:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_32z = ~((celloutsig_0_10z[0] | celloutsig_0_12z[2]) & (celloutsig_0_31z[20] | celloutsig_0_9z[2]));
  assign celloutsig_0_4z = ~((celloutsig_0_3z[14] | celloutsig_0_0z) & (celloutsig_0_2z[9] | celloutsig_0_0z));
  assign celloutsig_1_9z = ~((celloutsig_1_7z | celloutsig_1_5z[0]) & (celloutsig_1_8z[2] | celloutsig_1_0z[5]));
  assign celloutsig_0_0z = ~(in_data[58] ^ in_data[93]);
  assign celloutsig_0_42z = ~(celloutsig_0_9z[2] ^ celloutsig_0_7z[5]);
  assign celloutsig_0_11z = ~(celloutsig_0_4z ^ celloutsig_0_9z[1]);
  assign celloutsig_0_15z = ~(celloutsig_0_14z[2] ^ celloutsig_0_9z[2]);
  assign celloutsig_0_52z = { celloutsig_0_14z[14:12], celloutsig_0_43z } + celloutsig_0_21z[13:10];
  assign celloutsig_1_2z = celloutsig_1_0z[7:0] + { in_data[170:165], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_14z = celloutsig_1_11z[8:4] + { celloutsig_1_11z[10:7], celloutsig_1_9z };
  assign celloutsig_0_10z = { celloutsig_0_6z, celloutsig_0_9z } + in_data[68:64];
  assign celloutsig_0_16z = celloutsig_0_5z[4:1] + { celloutsig_0_9z[3:1], celloutsig_0_0z };
  assign celloutsig_0_8z = { celloutsig_0_2z[8:1], celloutsig_0_0z } === { celloutsig_0_7z[8], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_6z };
  assign celloutsig_1_19z = celloutsig_1_3z[6:2] === { celloutsig_1_10z[5:2], celloutsig_1_7z };
  assign celloutsig_0_13z = celloutsig_0_11z === celloutsig_0_3z[10];
  assign celloutsig_0_18z = celloutsig_0_2z[14:5] === { celloutsig_0_2z[12:8], celloutsig_0_12z };
  assign celloutsig_0_6z = celloutsig_0_2z[11:9] >= celloutsig_0_3z[36:34];
  assign celloutsig_0_70z = { celloutsig_0_3z[32:26], celloutsig_0_3z[29:27], celloutsig_0_52z, celloutsig_0_53z } >= { celloutsig_0_57z, celloutsig_0_24z, celloutsig_0_51z };
  assign celloutsig_1_6z = { celloutsig_1_4z[1:0], celloutsig_1_1z, celloutsig_1_3z } >= { celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_5z };
  assign celloutsig_0_29z = { celloutsig_0_3z[17], celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_11z } >= celloutsig_0_2z[5:1];
  assign celloutsig_0_33z = ! { celloutsig_0_1z[2:0], celloutsig_0_1z };
  assign celloutsig_0_36z = ! { celloutsig_0_20z[26:23], celloutsig_0_28z, celloutsig_0_9z };
  assign celloutsig_0_39z = ! celloutsig_0_20z[33:2];
  assign celloutsig_0_43z = ! { celloutsig_0_3z[29:26], celloutsig_0_3z[17:13], celloutsig_0_42z, celloutsig_0_36z, celloutsig_0_33z };
  assign celloutsig_1_18z = ! celloutsig_1_14z[4:2];
  assign celloutsig_0_23z = ! celloutsig_0_17z[18:3];
  assign celloutsig_0_24z = ! celloutsig_0_17z[9:3];
  assign celloutsig_0_7z[12:4] = celloutsig_0_2z[5] ? { celloutsig_0_1z[2:1], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_5z } : { celloutsig_0_2z[14:8], celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_1_4z = celloutsig_1_2z[4] ? celloutsig_1_3z[5:3] : celloutsig_1_0z[7:5];
  assign celloutsig_1_5z = in_data[133] ? in_data[116:114] : celloutsig_1_2z[2:0];
  assign celloutsig_1_11z = celloutsig_1_2z[6] ? { celloutsig_1_3z[6:2], celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_4z } : in_data[131:121];
  assign celloutsig_0_14z = celloutsig_0_6z ? { in_data[38:27], celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_11z } : { in_data[51:27], celloutsig_0_4z, celloutsig_0_13z };
  assign celloutsig_0_17z = celloutsig_0_12z[2] ? in_data[31:10] : { in_data[77:61], celloutsig_0_16z, celloutsig_0_13z };
  assign celloutsig_0_2z = celloutsig_0_1z[0] ? { in_data[81:77], celloutsig_0_0z, celloutsig_0_1z[3:1], 1'h1, celloutsig_0_1z[3:1], 1'h1, celloutsig_0_1z[3:1], 1'h1 } : in_data[82:65];
  assign celloutsig_0_57z = ~ { in_data[42:27], celloutsig_0_28z, celloutsig_0_43z };
  assign celloutsig_0_22z = ~ celloutsig_0_20z[33:24];
  assign celloutsig_0_25z = ~ { celloutsig_0_20z[25:13], celloutsig_0_9z };
  assign celloutsig_0_21z = { celloutsig_0_14z[25:13], celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_4z } <<< { celloutsig_0_20z[16:4], celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_15z };
  assign celloutsig_0_26z = celloutsig_0_22z[7:0] <<< celloutsig_0_25z[9:2];
  assign celloutsig_0_37z = { celloutsig_0_14z[20:14], celloutsig_0_32z, celloutsig_0_36z, celloutsig_0_29z, celloutsig_0_0z } - { celloutsig_0_31z[16:7], celloutsig_0_6z };
  assign celloutsig_0_45z = { celloutsig_0_31z[17:11], celloutsig_0_36z, celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_32z, celloutsig_0_36z } - { celloutsig_0_14z[20:15], celloutsig_0_42z, celloutsig_0_37z };
  assign celloutsig_0_46z = { celloutsig_0_13z, celloutsig_0_26z, celloutsig_0_15z, celloutsig_0_40z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_39z } - { celloutsig_0_2z[13:11], celloutsig_0_37z };
  assign celloutsig_0_53z = { celloutsig_0_45z[15:6], celloutsig_0_8z } - celloutsig_0_46z[13:3];
  assign celloutsig_0_5z = in_data[24:20] - celloutsig_0_3z[5:1];
  assign celloutsig_1_0z = in_data[130:119] - in_data[183:172];
  assign celloutsig_1_3z = { celloutsig_1_0z[8:3], celloutsig_1_1z } - in_data[167:161];
  assign celloutsig_1_8z = { celloutsig_1_2z[4:1], celloutsig_1_7z } - celloutsig_1_2z[4:0];
  assign celloutsig_1_10z = { celloutsig_1_8z, celloutsig_1_8z } - { celloutsig_1_0z[9:1], celloutsig_1_7z };
  assign celloutsig_0_9z = in_data[60:57] - celloutsig_0_7z[9:6];
  assign celloutsig_0_1z = in_data[91:88] - in_data[33:30];
  assign celloutsig_0_12z = celloutsig_0_7z[11:7] - in_data[63:59];
  assign celloutsig_0_28z = { celloutsig_0_9z[2:0], celloutsig_0_23z } - celloutsig_0_26z[6:3];
  assign celloutsig_0_31z = { in_data[30:6], celloutsig_0_23z } - { in_data[55:48], celloutsig_0_25z, celloutsig_0_11z };
  assign celloutsig_0_40z = ~((celloutsig_0_24z & celloutsig_0_33z) | celloutsig_0_15z);
  assign celloutsig_0_71z = ~((celloutsig_0_26z[4] & in_data[78]) | celloutsig_0_40z);
  assign celloutsig_1_1z = ~((celloutsig_1_0z[8] & in_data[144]) | in_data[182]);
  assign celloutsig_1_7z = ~((celloutsig_1_6z & celloutsig_1_2z[4]) | celloutsig_1_1z);
  always_latch
    if (clkin_data[32]) celloutsig_0_51z = 3'h0;
    else if (clkin_data[0]) celloutsig_0_51z = { celloutsig_0_1z[2:1], celloutsig_0_29z };
  always_latch
    if (clkin_data[32]) celloutsig_0_20z = 48'h000000000000;
    else if (celloutsig_1_18z) celloutsig_0_20z = { celloutsig_0_14z[19:15], celloutsig_0_6z, celloutsig_0_7z[12:4], celloutsig_0_1z, celloutsig_0_16z, celloutsig_0_7z[12:4], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_18z };
  assign { celloutsig_0_3z[17:0], celloutsig_0_3z[29:26], celloutsig_0_3z[40:30] } = ~ { celloutsig_0_2z, celloutsig_0_1z, in_data[58:49], celloutsig_0_0z };
  assign celloutsig_0_3z[25:18] = { celloutsig_0_3z[29:26], celloutsig_0_3z[29:26] };
  assign celloutsig_0_7z[3:0] = celloutsig_0_1z;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_70z, celloutsig_0_71z };
endmodule
