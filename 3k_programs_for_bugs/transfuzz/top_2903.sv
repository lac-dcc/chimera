/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [3:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [11:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [7:0] celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [8:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [2:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [6:0] celloutsig_0_41z;
  wire celloutsig_0_43z;
  reg [13:0] celloutsig_0_48z;
  wire [4:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_53z;
  wire [2:0] celloutsig_0_54z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [13:0] celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [4:0] celloutsig_1_14z;
  reg [10:0] celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire [12:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  reg [7:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [12:0] celloutsig_1_5z;
  reg [23:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = ~(celloutsig_0_2z[4] & in_data[61]);
  assign celloutsig_1_4z = ~(celloutsig_1_0z[1] & celloutsig_1_0z[10]);
  assign celloutsig_1_11z = ~(in_data[190] & celloutsig_1_9z);
  assign celloutsig_1_13z = ~(celloutsig_1_1z[2] & celloutsig_1_2z);
  assign celloutsig_0_9z = !(celloutsig_0_4z[0] ? in_data[81] : celloutsig_0_3z);
  assign celloutsig_0_18z = !(celloutsig_0_4z[0] ? celloutsig_0_4z[0] : celloutsig_0_5z);
  assign celloutsig_0_50z = ~(celloutsig_0_4z[0] | celloutsig_0_26z[11]);
  assign celloutsig_0_5z = ~(celloutsig_0_3z | celloutsig_0_1z[2]);
  assign celloutsig_1_7z = ~(celloutsig_1_6z[7] | celloutsig_1_0z[0]);
  assign celloutsig_0_10z = ~(in_data[17] | celloutsig_0_3z);
  assign celloutsig_0_0z = ~((in_data[16] | in_data[23]) & in_data[10]);
  assign celloutsig_0_37z = ~((celloutsig_0_36z | celloutsig_0_21z) & celloutsig_0_21z);
  assign celloutsig_1_8z = ~((celloutsig_1_5z[12] | celloutsig_1_3z) & celloutsig_1_0z[9]);
  assign celloutsig_0_32z = celloutsig_0_21z | celloutsig_0_22z;
  assign celloutsig_0_43z = celloutsig_0_40z | celloutsig_0_13z[0];
  assign celloutsig_1_2z = in_data[134] | celloutsig_1_0z[12];
  assign celloutsig_0_6z = in_data[19] ^ in_data[69];
  assign celloutsig_0_14z = celloutsig_0_1z[0] ^ celloutsig_0_12z;
  assign celloutsig_0_27z = celloutsig_0_3z ^ celloutsig_0_14z;
  assign celloutsig_1_18z = { celloutsig_1_1z[6:0], celloutsig_1_14z, celloutsig_1_9z } / { 1'h1, celloutsig_1_6z[12:1] };
  assign celloutsig_1_19z = { celloutsig_1_15z[2], celloutsig_1_15z } == { celloutsig_1_0z[13:4], celloutsig_1_3z, celloutsig_1_16z };
  assign celloutsig_0_20z = { celloutsig_0_2z[7:4], celloutsig_0_10z } == { celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_0z };
  assign celloutsig_1_9z = { celloutsig_1_5z[11:1], celloutsig_1_1z } <= in_data[177:159];
  assign celloutsig_0_7z = { celloutsig_0_4z[3:1], celloutsig_0_3z } <= { celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_5z };
  assign celloutsig_0_21z = { in_data[25:6], celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_19z } <= { celloutsig_0_2z[5:1], celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_20z, celloutsig_0_17z, celloutsig_0_3z, celloutsig_0_17z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_16z };
  assign celloutsig_0_22z = { celloutsig_0_2z[5:4], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_21z } <= { in_data[61:56], celloutsig_0_21z };
  assign celloutsig_0_40z = ! { celloutsig_0_27z, celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_24z };
  assign celloutsig_0_25z = ! in_data[45:39];
  assign celloutsig_0_17z = { celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_0z } != { celloutsig_0_2z[7:2], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_11z };
  assign celloutsig_0_35z = ~ { celloutsig_0_33z[2:1], celloutsig_0_9z };
  assign celloutsig_0_26z = ~ { celloutsig_0_22z, celloutsig_0_15z, celloutsig_0_24z, celloutsig_0_21z, celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_16z };
  assign celloutsig_0_36z = & { celloutsig_0_25z, celloutsig_0_24z, celloutsig_0_6z, celloutsig_0_2z[3] };
  assign celloutsig_1_3z = & { celloutsig_1_2z, celloutsig_1_1z[7:2] };
  assign celloutsig_0_8z = & { celloutsig_0_5z, in_data[10:4] };
  assign celloutsig_0_31z = celloutsig_0_11z & celloutsig_0_18z;
  assign celloutsig_0_12z = | { celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_34z = ~^ { celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_22z };
  assign celloutsig_0_53z = ^ { celloutsig_0_41z[3], celloutsig_0_50z, celloutsig_0_34z, celloutsig_0_14z, celloutsig_0_43z, celloutsig_0_10z, celloutsig_0_19z, celloutsig_0_6z };
  assign celloutsig_1_12z = ^ celloutsig_1_6z[17:12];
  assign celloutsig_1_16z = ^ { celloutsig_1_9z, celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_11z, celloutsig_1_5z };
  assign celloutsig_0_15z = ^ { in_data[5:2], celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_5z };
  assign celloutsig_0_2z = { in_data[10:5], celloutsig_0_0z, celloutsig_0_0z } >> in_data[69:62];
  assign celloutsig_1_14z = { celloutsig_1_11z, celloutsig_1_9z, celloutsig_1_11z, celloutsig_1_11z, celloutsig_1_4z } >>> in_data[106:102];
  assign celloutsig_0_1z = in_data[11:8] >>> in_data[35:32];
  assign celloutsig_0_41z = { 2'h3, celloutsig_0_33z[6:3], celloutsig_0_31z } - { celloutsig_0_32z, celloutsig_0_37z, celloutsig_0_4z };
  assign celloutsig_0_4z = { celloutsig_0_0z, celloutsig_0_1z } - { celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_0z = in_data[162:149] ~^ in_data[117:104];
  assign celloutsig_0_54z = { celloutsig_0_2z[3:2], celloutsig_0_12z } ^ celloutsig_0_48z[7:5];
  assign celloutsig_1_5z = celloutsig_1_0z[13:1] ^ { celloutsig_1_0z[12:1], celloutsig_1_4z };
  assign celloutsig_0_13z = { celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_11z } ^ celloutsig_0_4z[4:2];
  assign celloutsig_0_16z = ~((celloutsig_0_1z[3] & celloutsig_0_4z[1]) | celloutsig_0_9z);
  assign celloutsig_0_19z = ~((celloutsig_0_9z & in_data[76]) | celloutsig_0_1z[3]);
  always_latch
    if (celloutsig_1_19z) celloutsig_0_48z = 14'h0000;
    else if (clkin_data[0]) celloutsig_0_48z = { celloutsig_0_0z, celloutsig_0_32z, celloutsig_0_35z, celloutsig_0_13z, celloutsig_0_36z, celloutsig_0_4z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_1z = 8'h00;
    else if (clkin_data[32]) celloutsig_1_1z = in_data[146:139];
  always_latch
    if (!clkin_data[96]) celloutsig_1_6z = 24'h000000;
    else if (!clkin_data[32]) celloutsig_1_6z = { celloutsig_1_0z[10:1], celloutsig_1_0z };
  always_latch
    if (!clkin_data[96]) celloutsig_1_15z = 11'h000;
    else if (!clkin_data[64]) celloutsig_1_15z = { celloutsig_1_5z[9:5], celloutsig_1_12z, celloutsig_1_9z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_8z, celloutsig_1_13z };
  assign celloutsig_0_11z = ~((celloutsig_0_7z & celloutsig_0_7z) | (celloutsig_0_1z[1] & celloutsig_0_0z));
  assign celloutsig_0_24z = ~((celloutsig_0_4z[2] & celloutsig_0_4z[2]) | (celloutsig_0_17z & celloutsig_0_17z));
  assign { celloutsig_0_33z[2], celloutsig_0_33z[3], celloutsig_0_33z[1], celloutsig_0_33z[6:4], celloutsig_0_33z[0] } = { celloutsig_0_32z, celloutsig_0_24z, celloutsig_0_20z, celloutsig_0_13z, celloutsig_0_5z } ~^ { celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_1z[1], celloutsig_0_3z, celloutsig_0_10z, celloutsig_0_15z };
  assign celloutsig_0_33z[8:7] = 2'h3;
  assign { out_data[140:128], out_data[96], out_data[32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_53z, celloutsig_0_54z };
endmodule
