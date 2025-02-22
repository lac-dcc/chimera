/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [5:0] celloutsig_0_0z;
  wire [9:0] celloutsig_0_10z;
  wire [2:0] celloutsig_0_11z;
  wire [6:0] celloutsig_0_12z;
  wire [3:0] celloutsig_0_13z;
  wire [19:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [24:0] celloutsig_0_16z;
  reg [3:0] celloutsig_0_17z;
  wire [14:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [7:0] celloutsig_0_21z;
  wire [21:0] celloutsig_0_22z;
  wire [2:0] celloutsig_0_23z;
  wire [19:0] celloutsig_0_24z;
  reg [11:0] celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire [2:0] celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire [6:0] celloutsig_0_32z;
  wire [13:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [3:0] celloutsig_0_39z;
  wire [2:0] celloutsig_0_3z;
  wire [4:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [7:0] celloutsig_0_61z;
  wire celloutsig_0_6z;
  wire [7:0] celloutsig_0_75z;
  wire [3:0] celloutsig_0_76z;
  wire [2:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [4:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [3:0] celloutsig_1_13z;
  wire [5:0] celloutsig_1_16z;
  wire [15:0] celloutsig_1_18z;
  wire [5:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire [12:0] celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire [6:0] celloutsig_1_6z;
  wire [3:0] celloutsig_1_7z;
  wire [11:0] celloutsig_1_8z;
  wire [8:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_0z = ~(in_data[125] | in_data[110]);
  assign celloutsig_0_8z = ~(celloutsig_0_6z | celloutsig_0_3z[1]);
  assign celloutsig_0_1z = ~(celloutsig_0_0z[1] | celloutsig_0_0z[5]);
  assign celloutsig_0_20z = ~(celloutsig_0_7z[1] | celloutsig_0_7z[2]);
  assign celloutsig_0_6z = celloutsig_0_5z | ~(celloutsig_0_3z[2]);
  assign celloutsig_1_1z = celloutsig_1_0z | ~(celloutsig_1_0z);
  assign celloutsig_0_15z = celloutsig_0_6z | ~(celloutsig_0_0z[1]);
  assign celloutsig_0_27z = celloutsig_0_21z[7] | ~(celloutsig_0_22z[5]);
  assign celloutsig_0_75z = celloutsig_0_10z[7:0] + { celloutsig_0_15z, celloutsig_0_27z, celloutsig_0_15z, celloutsig_0_20z, celloutsig_0_39z };
  assign celloutsig_1_6z = celloutsig_1_4z[9:3] & in_data[165:159];
  assign celloutsig_0_12z = { in_data[88:86], celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_6z } & { in_data[59], celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_1_2z = { in_data[114:97], celloutsig_1_0z, celloutsig_1_1z } <= { in_data[134:117], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_36z = { celloutsig_0_16z[22:11], celloutsig_0_6z, celloutsig_0_6z } * { celloutsig_0_9z[3:1], celloutsig_0_17z, celloutsig_0_32z };
  assign celloutsig_0_7z = celloutsig_0_4z[4:2] * { in_data[25:24], celloutsig_0_6z };
  assign celloutsig_1_4z = { in_data[137:132], celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z } * in_data[156:144];
  assign celloutsig_1_5z = { celloutsig_1_4z[7:6], celloutsig_1_1z } * celloutsig_1_4z[10:8];
  assign celloutsig_1_9z = { celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_1z } * { celloutsig_1_6z[5:1], celloutsig_1_7z };
  assign celloutsig_1_13z = celloutsig_1_8z[5:2] * { celloutsig_1_1z, celloutsig_1_5z };
  assign celloutsig_0_9z = { celloutsig_0_7z[1], celloutsig_0_7z, celloutsig_0_8z } * { celloutsig_0_3z[2], celloutsig_0_8z, celloutsig_0_7z };
  assign celloutsig_0_13z = { celloutsig_0_9z[4], celloutsig_0_3z } * celloutsig_0_12z[4:1];
  assign celloutsig_0_23z = celloutsig_0_16z[2:0] * celloutsig_0_21z[3:1];
  assign celloutsig_0_39z = - celloutsig_0_32z[5:2];
  assign celloutsig_0_76z = - { celloutsig_0_61z[6:4], celloutsig_0_37z };
  assign celloutsig_1_3z = - { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_1_7z = - { celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_1_16z = - { celloutsig_1_9z[7:6], celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_18z = - { celloutsig_1_5z[2:1], celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_16z };
  assign celloutsig_0_11z = - { celloutsig_0_0z[2:1], celloutsig_0_6z };
  assign celloutsig_0_21z = - { celloutsig_0_16z[8:2], celloutsig_0_5z };
  assign celloutsig_0_24z = - { celloutsig_0_13z, celloutsig_0_19z, celloutsig_0_8z };
  assign celloutsig_0_37z = { celloutsig_0_24z[19:7], celloutsig_0_31z } !== { celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_23z };
  assign celloutsig_0_5z = { celloutsig_0_2z[2:1], celloutsig_0_2z } !== celloutsig_0_4z;
  assign celloutsig_1_10z = in_data[123:118] !== celloutsig_1_6z[6:1];
  assign celloutsig_0_31z = { celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_27z, celloutsig_0_17z, celloutsig_0_7z } !== { celloutsig_0_14z[12:11], celloutsig_0_20z, celloutsig_0_7z, celloutsig_0_17z, celloutsig_0_13z, celloutsig_0_9z };
  assign celloutsig_0_4z = celloutsig_0_0z[5:1] <<< { celloutsig_0_2z[2:1], celloutsig_0_3z };
  assign celloutsig_1_19z = { celloutsig_1_16z[5:1], celloutsig_1_2z } <<< { celloutsig_1_5z[2], celloutsig_1_13z, celloutsig_1_10z };
  assign celloutsig_0_14z = { celloutsig_0_9z[3:0], celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_2z } <<< { celloutsig_0_4z[2:0], celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_0_3z = { celloutsig_0_2z[2:1], celloutsig_0_1z } - celloutsig_0_2z;
  assign celloutsig_0_61z = celloutsig_0_10z[9:2] - { celloutsig_0_36z[13:10], celloutsig_0_11z, celloutsig_0_15z };
  assign celloutsig_1_8z = { in_data[158:148], celloutsig_1_2z } - in_data[125:114];
  assign celloutsig_0_10z = { celloutsig_0_0z[4:0], celloutsig_0_4z } - { celloutsig_0_9z[2:0], celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_5z };
  assign celloutsig_0_16z = { in_data[82:63], celloutsig_0_9z } - in_data[77:53];
  assign celloutsig_0_19z = { in_data[91:79], celloutsig_0_8z, celloutsig_0_6z } - { celloutsig_0_16z[16:3], celloutsig_0_1z };
  assign celloutsig_0_22z = { celloutsig_0_16z[21:1], celloutsig_0_8z } - in_data[78:57];
  assign celloutsig_0_2z = celloutsig_0_0z[2:0] - celloutsig_0_0z[3:1];
  assign celloutsig_0_32z = celloutsig_0_25z[6:0] - { in_data[50:48], celloutsig_0_17z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_0z = 6'h00;
    else if (!celloutsig_1_18z[0]) celloutsig_0_0z = in_data[69:64];
  always_latch
    if (!clkin_data[0]) celloutsig_0_17z = 4'h0;
    else if (!celloutsig_1_18z[0]) celloutsig_0_17z = celloutsig_0_13z;
  always_latch
    if (!clkin_data[0]) celloutsig_0_25z = 12'h000;
    else if (!celloutsig_1_18z[0]) celloutsig_0_25z = celloutsig_0_14z[16:5];
  assign { out_data[143:128], out_data[101:96], out_data[39:32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_75z, celloutsig_0_76z };
endmodule
