/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [6:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [6:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [9:0] celloutsig_0_18z;
  reg [6:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  reg [13:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [2:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [11:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [6:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [15:0] celloutsig_0_2z;
  wire [6:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [4:0] celloutsig_0_33z;
  wire [14:0] celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire [9:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire [2:0] celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire celloutsig_0_48z;
  wire [4:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [8:0] celloutsig_0_50z;
  wire [26:0] celloutsig_0_53z;
  wire [4:0] celloutsig_0_54z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  reg [2:0] celloutsig_0_5z;
  wire celloutsig_0_64z;
  wire [14:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [10:0] celloutsig_0_82z;
  wire celloutsig_0_83z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  reg [5:0] celloutsig_1_0z;
  wire [7:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [7:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  reg [22:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [10:0] celloutsig_1_6z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_41z = celloutsig_0_9z ? celloutsig_0_5z[2] : in_data[5];
  assign celloutsig_1_9z = in_data[180] ? in_data[139] : celloutsig_1_2z[6];
  assign celloutsig_0_59z = ~(celloutsig_0_48z | celloutsig_0_36z);
  assign celloutsig_0_31z = ~((in_data[21] | celloutsig_0_12z[0]) & (celloutsig_0_24z | celloutsig_0_25z));
  assign celloutsig_0_36z = ~((celloutsig_0_6z[11] | celloutsig_0_22z) & (celloutsig_0_34z[10] | celloutsig_0_22z));
  assign celloutsig_0_4z = ~((celloutsig_0_3z | celloutsig_0_3z) & (celloutsig_0_1z | celloutsig_0_2z[3]));
  assign celloutsig_0_48z = ~((celloutsig_0_43z[2] | celloutsig_0_34z[2]) & (celloutsig_0_21z[5] | celloutsig_0_8z));
  assign celloutsig_0_58z = celloutsig_0_16z[4] | ~(celloutsig_0_29z);
  assign celloutsig_0_17z = celloutsig_0_0z[1] | ~(celloutsig_0_10z);
  assign celloutsig_0_45z = celloutsig_0_2z[13] | celloutsig_0_4z;
  assign celloutsig_0_83z = celloutsig_0_54z[0] | celloutsig_0_45z;
  assign celloutsig_1_1z = celloutsig_1_0z[2] | in_data[185];
  assign celloutsig_0_8z = celloutsig_0_6z[14] | celloutsig_0_1z;
  assign celloutsig_0_0z = in_data[18:12] + in_data[65:59];
  assign celloutsig_0_34z = { celloutsig_0_33z[1], celloutsig_0_21z } + { celloutsig_0_6z[12:8], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_32z, celloutsig_0_20z };
  assign celloutsig_1_2z = { celloutsig_1_1z, celloutsig_1_0z } + { celloutsig_1_0z[5], celloutsig_1_0z };
  assign celloutsig_1_6z = { celloutsig_1_3z, celloutsig_1_4z } + { celloutsig_1_2z[6:3], celloutsig_1_2z };
  assign celloutsig_0_12z = { celloutsig_0_0z[6], celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_9z } + { celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_3z };
  assign celloutsig_0_18z = { celloutsig_0_0z[6:1], celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_7z } + { in_data[55:54], celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_17z, celloutsig_0_17z };
  assign celloutsig_0_33z = { celloutsig_0_6z[3], celloutsig_0_5z, celloutsig_0_27z } / { 1'h1, in_data[69], celloutsig_0_13z, celloutsig_0_17z, celloutsig_0_32z };
  assign celloutsig_1_19z = { celloutsig_1_6z[8:2], celloutsig_1_5z, celloutsig_1_14z, celloutsig_1_11z, celloutsig_1_14z } / { 1'h1, in_data[141:139], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_16z = { celloutsig_0_12z, celloutsig_0_10z } / { 1'h1, celloutsig_0_6z[10:7], celloutsig_0_9z, celloutsig_0_11z };
  assign celloutsig_0_2z = in_data[41:26] / { 1'h1, in_data[33:19] };
  assign celloutsig_0_26z = { celloutsig_0_6z[4:0], celloutsig_0_10z, celloutsig_0_23z, celloutsig_0_23z } / { 1'h1, in_data[80:78], celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_15z };
  assign celloutsig_0_32z = { celloutsig_0_1z, celloutsig_0_23z, celloutsig_0_4z, celloutsig_0_20z, celloutsig_0_4z } > { celloutsig_0_0z[5:3], celloutsig_0_15z, celloutsig_0_27z, celloutsig_0_7z, celloutsig_0_25z };
  assign celloutsig_0_9z = celloutsig_0_6z[14:1] > in_data[24:11];
  assign celloutsig_0_64z = { celloutsig_0_30z, celloutsig_0_5z } <= { celloutsig_0_53z[24:19], celloutsig_0_59z, celloutsig_0_5z };
  assign celloutsig_1_18z = celloutsig_1_15z[7:5] <= celloutsig_1_6z[7:5];
  assign celloutsig_0_25z = in_data[11:5] <= { celloutsig_0_19z[6:1], celloutsig_0_22z };
  assign celloutsig_0_27z = { celloutsig_0_21z[13], celloutsig_0_13z, celloutsig_0_1z } && celloutsig_0_5z;
  assign celloutsig_0_10z = ! { in_data[83:75], celloutsig_0_5z };
  assign celloutsig_0_20z = ! { celloutsig_0_12z[4], celloutsig_0_12z };
  assign celloutsig_0_24z = ! { celloutsig_0_2z[7:6], celloutsig_0_23z, celloutsig_0_17z, celloutsig_0_15z, celloutsig_0_20z, celloutsig_0_15z };
  assign celloutsig_0_11z = celloutsig_0_10z & ~(celloutsig_0_10z);
  assign celloutsig_0_1z = celloutsig_0_0z[2] & ~(in_data[62]);
  assign celloutsig_0_13z = celloutsig_0_5z[0] & ~(in_data[55]);
  assign celloutsig_0_15z = celloutsig_0_8z & ~(celloutsig_0_0z[3]);
  assign celloutsig_0_53z = { celloutsig_0_34z[8], celloutsig_0_49z, celloutsig_0_30z, celloutsig_0_4z, celloutsig_0_29z, celloutsig_0_1z, celloutsig_0_27z, celloutsig_0_50z, celloutsig_0_41z } % { 1'h1, celloutsig_0_30z[5:0], celloutsig_0_21z, celloutsig_0_49z, celloutsig_0_45z };
  assign celloutsig_0_6z = celloutsig_0_2z[14:0] % { 1'h1, celloutsig_0_0z[5:4], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_1_10z = celloutsig_1_6z[7:0] % { 1'h1, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_13z = { celloutsig_1_6z[9:4], celloutsig_1_1z, celloutsig_1_9z } % { 1'h1, celloutsig_1_3z[8:3], celloutsig_1_1z };
  assign celloutsig_0_39z = celloutsig_0_16z[5] ? { celloutsig_0_12z[2:1], celloutsig_0_31z, celloutsig_0_9z, celloutsig_0_12z } : { celloutsig_0_16z[6], 1'h0, celloutsig_0_16z[4:0], celloutsig_0_27z, celloutsig_0_25z, celloutsig_0_3z };
  assign celloutsig_0_50z = celloutsig_0_45z ? { celloutsig_0_21z[9:4], celloutsig_0_31z, celloutsig_0_25z, celloutsig_0_15z } : { celloutsig_0_5z[2:1], celloutsig_0_28z };
  assign celloutsig_0_54z = celloutsig_0_15z ? { celloutsig_0_39z[2], celloutsig_0_24z, celloutsig_0_5z } : { celloutsig_0_12z[4:1], celloutsig_0_7z };
  assign celloutsig_0_28z = celloutsig_0_0z[3] ? { celloutsig_0_18z[3:0], celloutsig_0_22z, celloutsig_0_14z, celloutsig_0_14z } : { celloutsig_0_2z[14:9], celloutsig_0_25z };
  assign celloutsig_0_43z = ~ celloutsig_0_19z[3:1];
  assign celloutsig_0_82z = ~ { celloutsig_0_34z[14:6], celloutsig_0_58z, celloutsig_0_64z };
  assign celloutsig_0_23z = ~ { celloutsig_0_12z[1], celloutsig_0_14z, celloutsig_0_9z };
  assign celloutsig_0_49z = in_data[82:78] | celloutsig_0_34z[8:4];
  assign celloutsig_0_30z = { celloutsig_0_6z[4:0], celloutsig_0_8z, celloutsig_0_11z } | celloutsig_0_26z[9:3];
  assign celloutsig_0_3z = in_data[55] & celloutsig_0_0z[6];
  assign celloutsig_0_7z = celloutsig_0_1z & celloutsig_0_3z;
  assign celloutsig_1_4z = celloutsig_1_2z[2] & in_data[132];
  assign celloutsig_1_11z = celloutsig_1_6z[6] & celloutsig_1_4z;
  assign celloutsig_0_22z = celloutsig_0_20z & celloutsig_0_13z;
  assign celloutsig_1_5z = | celloutsig_1_0z;
  assign celloutsig_1_3z = { in_data[188:185], celloutsig_1_0z } <<< in_data[107:98];
  always_latch
    if (!clkin_data[96]) celloutsig_0_5z = 3'h0;
    else if (!celloutsig_1_18z) celloutsig_0_5z = { celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_4z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_0z = 6'h00;
    else if (clkin_data[32]) celloutsig_1_0z = in_data[111:106];
  always_latch
    if (clkin_data[128]) celloutsig_1_15z = 23'h000000;
    else if (clkin_data[32]) celloutsig_1_15z = { celloutsig_1_0z[4:3], celloutsig_1_9z, celloutsig_1_6z, celloutsig_1_13z, celloutsig_1_11z };
  always_latch
    if (clkin_data[64]) celloutsig_0_19z = 7'h00;
    else if (!clkin_data[0]) celloutsig_0_19z = { celloutsig_0_6z[9:6], celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_13z };
  always_latch
    if (clkin_data[96]) celloutsig_0_21z = 14'h0000;
    else if (!celloutsig_1_18z) celloutsig_0_21z = { celloutsig_0_12z[4:0], celloutsig_0_12z, celloutsig_0_5z };
  assign celloutsig_1_14z = ~((celloutsig_1_10z[1] & celloutsig_1_9z) | (celloutsig_1_10z[4] & celloutsig_1_6z[9]));
  assign celloutsig_0_14z = ~((celloutsig_0_5z[2] & celloutsig_0_7z) | (in_data[30] & celloutsig_0_13z));
  assign celloutsig_0_29z = ~((celloutsig_0_12z[1] & celloutsig_0_17z) | (celloutsig_0_1z & celloutsig_0_20z));
  assign { out_data[128], out_data[106:96], out_data[42:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_82z, celloutsig_0_83z };
endmodule
