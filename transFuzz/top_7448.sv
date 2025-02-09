/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [5:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire [9:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [4:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [16:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [12:0] celloutsig_0_2z;
  reg [15:0] celloutsig_0_30z;
  wire [14:0] celloutsig_0_31z;
  wire [25:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [31:0] celloutsig_0_35z;
  wire [6:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [3:0] celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire celloutsig_0_47z;
  wire [2:0] celloutsig_0_48z;
  wire [2:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [3:0] celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_55z;
  reg [6:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  reg [25:0] celloutsig_0_60z;
  wire celloutsig_0_64z;
  wire [4:0] celloutsig_0_6z;
  wire celloutsig_0_73z;
  wire celloutsig_0_76z;
  wire celloutsig_0_79z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_92z;
  wire [18:0] celloutsig_0_93z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [11:0] celloutsig_1_12z;
  wire [17:0] celloutsig_1_13z;
  wire [3:0] celloutsig_1_18z;
  wire [33:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [13:0] celloutsig_1_7z;
  wire [2:0] celloutsig_1_8z;
  reg [12:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_47z = !(celloutsig_0_15z ? celloutsig_0_2z[5] : celloutsig_0_37z);
  assign celloutsig_1_3z = !(celloutsig_1_2z ? in_data[171] : celloutsig_1_0z);
  assign celloutsig_0_19z = !(celloutsig_0_9z ? celloutsig_0_8z : celloutsig_0_11z);
  assign celloutsig_0_27z = !(in_data[26] ? celloutsig_0_18z[9] : in_data[39]);
  assign celloutsig_0_79z = ~(celloutsig_0_35z[12] | celloutsig_0_76z);
  assign celloutsig_1_4z = ~(celloutsig_1_2z | celloutsig_1_0z);
  assign celloutsig_0_12z = ~(celloutsig_0_11z | celloutsig_0_2z[4]);
  assign celloutsig_0_50z = ~((celloutsig_0_3z | celloutsig_0_15z) & (celloutsig_0_48z[2] | celloutsig_0_22z));
  assign celloutsig_0_64z = ~((celloutsig_0_17z | celloutsig_0_59z[1]) & (celloutsig_0_14z | celloutsig_0_33z));
  assign celloutsig_0_8z = ~((celloutsig_0_7z | celloutsig_0_2z[4]) & (celloutsig_0_2z[6] | in_data[11]));
  assign celloutsig_0_76z = celloutsig_0_73z ^ celloutsig_0_24z[0];
  assign celloutsig_0_6z = celloutsig_0_0z[5:1] + { celloutsig_0_2z[7:6], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_93z = { celloutsig_0_32z[24:8], celloutsig_0_37z, celloutsig_0_3z } + { celloutsig_0_60z[19:4], celloutsig_0_73z, celloutsig_0_79z, celloutsig_0_92z };
  assign celloutsig_1_12z = { in_data[186:177], celloutsig_1_6z, celloutsig_1_2z } + { in_data[189:179], celloutsig_1_1z };
  assign celloutsig_0_20z = { celloutsig_0_0z[4:0], celloutsig_0_13z } + { celloutsig_0_6z[3:0], celloutsig_0_8z, celloutsig_0_13z };
  assign celloutsig_0_3z = celloutsig_0_2z[6:2] == in_data[66:62];
  assign celloutsig_0_33z = { celloutsig_0_20z[4:0], celloutsig_0_6z, celloutsig_0_7z } == { celloutsig_0_24z[3:1], celloutsig_0_29z, celloutsig_0_19z, celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_0_4z = in_data[88:76] == { celloutsig_0_0z[3:0], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_25z = { celloutsig_0_24z, celloutsig_0_2z, celloutsig_0_19z, celloutsig_0_19z, celloutsig_0_12z, celloutsig_0_21z } == { celloutsig_0_18z[1:0], celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_14z, celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_0_42z = { celloutsig_0_2z[12:5], celloutsig_0_2z, celloutsig_0_7z } === { celloutsig_0_35z[26:10], celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_12z, celloutsig_0_15z };
  assign celloutsig_1_1z = in_data[175:173] >= in_data[114:112];
  assign celloutsig_0_10z = { celloutsig_0_2z[2:1], celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_8z } >= celloutsig_0_2z;
  assign celloutsig_0_11z = { in_data[69], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_6z } > { celloutsig_0_2z[5:0], celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_5z };
  assign celloutsig_0_13z = { celloutsig_0_2z[10:7], celloutsig_0_8z, celloutsig_0_7z } > { celloutsig_0_6z, celloutsig_0_8z };
  assign celloutsig_0_55z = { in_data[80:76], celloutsig_0_50z } && { celloutsig_0_11z, celloutsig_0_51z, celloutsig_0_3z };
  assign celloutsig_0_15z = { in_data[65:56], celloutsig_0_5z, celloutsig_0_4z } && { celloutsig_0_2z[3:0], celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_11z };
  assign celloutsig_0_17z = { celloutsig_0_1z[2:1], celloutsig_0_14z, celloutsig_0_5z } && { celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_15z };
  assign celloutsig_0_37z = ! in_data[59:45];
  assign celloutsig_0_28z = ! { celloutsig_0_1z[2:1], celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_22z };
  assign celloutsig_1_6z = { in_data[115:113], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_1z } || { in_data[170:159], celloutsig_1_0z };
  assign celloutsig_0_92z = celloutsig_0_25z & ~(celloutsig_0_64z);
  assign celloutsig_1_2z = celloutsig_1_1z & ~(in_data[161]);
  assign celloutsig_0_21z = celloutsig_0_13z & ~(celloutsig_0_2z[10]);
  assign celloutsig_0_5z = celloutsig_0_0z[5:3] != in_data[65:63];
  assign celloutsig_0_7z = in_data[71:32] != { in_data[13:7], celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_1z };
  assign celloutsig_0_24z = - celloutsig_0_18z[7:3];
  assign celloutsig_0_14z = { celloutsig_0_2z[10:4], celloutsig_0_3z } !== { celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_7z };
  assign celloutsig_0_29z = { celloutsig_0_22z, celloutsig_0_1z, celloutsig_0_9z } !== { celloutsig_0_2z[1:0], celloutsig_0_8z, celloutsig_0_22z, celloutsig_0_12z };
  assign celloutsig_0_51z = ~ celloutsig_0_30z[9:6];
  assign celloutsig_0_26z = ~ { in_data[25:23], celloutsig_0_19z, celloutsig_0_2z };
  assign celloutsig_0_52z = | { celloutsig_0_30z[5:3], celloutsig_0_11z, celloutsig_0_38z };
  assign celloutsig_0_73z = | celloutsig_0_35z[11:9];
  assign celloutsig_1_0z = | in_data[186:175];
  assign celloutsig_0_9z = | celloutsig_0_0z;
  assign celloutsig_0_22z = ^ { celloutsig_0_0z[5:2], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_17z, celloutsig_0_20z };
  assign celloutsig_1_5z = { celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_1z } >> { celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_0_36z = { celloutsig_0_24z[4:2], celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_13z, celloutsig_0_4z } >> { celloutsig_0_0z[4:0], celloutsig_0_14z, celloutsig_0_29z };
  assign celloutsig_1_19z = { celloutsig_1_13z[16:6], celloutsig_1_1z, celloutsig_1_13z[17:5], celloutsig_1_13z[17], celloutsig_1_13z[3:0], celloutsig_1_5z } >> { in_data[165:158], celloutsig_1_9z, celloutsig_1_9z };
  assign celloutsig_0_18z = celloutsig_0_2z[12:3] >> in_data[58:49];
  assign celloutsig_0_2z = in_data[84:72] >> in_data[24:12];
  assign celloutsig_0_31z = { celloutsig_0_18z[2:1], celloutsig_0_2z } >> { celloutsig_0_6z[4:3], celloutsig_0_20z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_18z = { celloutsig_1_5z[0], celloutsig_1_8z } <<< { in_data[111:109], celloutsig_1_2z };
  assign celloutsig_0_49z = { celloutsig_0_32z[7:6], celloutsig_0_15z } >>> { celloutsig_0_6z[3:2], celloutsig_0_25z };
  assign celloutsig_0_0z = in_data[24:19] - in_data[57:52];
  assign celloutsig_0_38z = celloutsig_0_36z[4:1] - celloutsig_0_2z[12:9];
  assign celloutsig_0_48z = { celloutsig_0_28z, celloutsig_0_25z, celloutsig_0_42z } ~^ { celloutsig_0_21z, celloutsig_0_33z, celloutsig_0_21z };
  assign celloutsig_1_8z = { celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_2z } ~^ { celloutsig_1_7z[7:6], celloutsig_1_0z };
  assign celloutsig_0_32z = { celloutsig_0_30z[10:8], celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_28z, celloutsig_0_0z } ~^ { celloutsig_0_26z[8:2], celloutsig_0_29z, celloutsig_0_27z, celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_13z };
  assign celloutsig_0_35z = { celloutsig_0_31z[11:8], celloutsig_0_33z, celloutsig_0_4z, celloutsig_0_32z } ^ { celloutsig_0_30z[9:1], celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_29z, celloutsig_0_19z, celloutsig_0_24z, celloutsig_0_28z };
  assign celloutsig_1_7z = { in_data[189:187], celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_4z } ^ { in_data[186:174], celloutsig_1_1z };
  assign celloutsig_0_1z = celloutsig_0_0z[5:3] ^ in_data[47:45];
  always_latch
    if (!clkin_data[64]) celloutsig_0_59z = 7'h00;
    else if (!clkin_data[0]) celloutsig_0_59z = { celloutsig_0_32z[21:18], celloutsig_0_29z, celloutsig_0_7z, celloutsig_0_22z };
  always_latch
    if (clkin_data[96]) celloutsig_0_60z = 26'h0000000;
    else if (clkin_data[0]) celloutsig_0_60z = { celloutsig_0_59z[5:0], celloutsig_0_6z, celloutsig_0_22z, celloutsig_0_14z, celloutsig_0_27z, celloutsig_0_47z, celloutsig_0_50z, celloutsig_0_42z, celloutsig_0_1z, celloutsig_0_52z, celloutsig_0_11z, celloutsig_0_55z, celloutsig_0_49z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_9z = 13'h0000;
    else if (!clkin_data[32]) celloutsig_1_9z = { in_data[173:162], celloutsig_1_0z };
  always_latch
    if (clkin_data[96]) celloutsig_0_30z = 16'h0000;
    else if (celloutsig_1_18z[0]) celloutsig_0_30z = { celloutsig_0_26z[7:6], celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_22z, celloutsig_0_19z, celloutsig_0_19z, celloutsig_0_8z };
  assign { celloutsig_1_13z[11:5], celloutsig_1_13z[17], celloutsig_1_13z[3:0], celloutsig_1_13z[16:12] } = ~ { celloutsig_1_12z, celloutsig_1_5z, celloutsig_1_1z };
  assign celloutsig_1_13z[4] = celloutsig_1_13z[17];
  assign { out_data[131:96], out_data[32], out_data[18:0] } = { celloutsig_1_18z, celloutsig_1_19z[33:2], celloutsig_0_92z, celloutsig_0_93z };
endmodule
