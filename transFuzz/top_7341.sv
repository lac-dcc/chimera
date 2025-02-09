/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire [3:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [15:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [9:0] celloutsig_0_16z;
  reg [19:0] celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [6:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [7:0] celloutsig_0_25z;
  wire [10:0] celloutsig_0_28z;
  wire [6:0] celloutsig_0_29z;
  reg [6:0] celloutsig_0_2z;
  wire celloutsig_0_34z;
  wire [4:0] celloutsig_0_37z;
  wire celloutsig_0_39z;
  wire [5:0] celloutsig_0_3z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire [21:0] celloutsig_0_50z;
  wire [2:0] celloutsig_0_51z;
  wire celloutsig_0_5z;
  wire [11:0] celloutsig_0_6z;
  wire [2:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [7:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [5:0] celloutsig_1_13z;
  wire [2:0] celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire [10:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [6:0] celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [7:0] celloutsig_1_4z;
  reg [14:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [12:0] celloutsig_1_7z;
  reg [2:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_4z = celloutsig_0_2z[5] ? celloutsig_0_3z[3] : celloutsig_0_2z[4];
  assign celloutsig_0_12z = celloutsig_0_11z[2] ? celloutsig_0_0z : celloutsig_0_4z;
  assign celloutsig_1_6z = !(in_data[172] ? celloutsig_1_4z[2] : celloutsig_1_2z);
  assign celloutsig_0_8z = !(celloutsig_0_2z[6] ? celloutsig_0_6z[5] : celloutsig_0_2z[0]);
  assign celloutsig_0_22z = !(celloutsig_0_17z[7] ? celloutsig_0_0z : celloutsig_0_19z);
  assign celloutsig_0_48z = ~((celloutsig_0_23z | celloutsig_0_28z[10]) & (celloutsig_0_19z | celloutsig_0_20z[5]));
  assign celloutsig_1_3z = ~((celloutsig_1_2z | in_data[136]) & (celloutsig_1_0z | celloutsig_1_1z[0]));
  assign celloutsig_0_19z = ~((celloutsig_0_7z[2] | celloutsig_0_17z[11]) & (celloutsig_0_10z[0] | celloutsig_0_10z[2]));
  assign celloutsig_0_34z = celloutsig_0_8z | celloutsig_0_17z[1];
  assign celloutsig_0_5z = celloutsig_0_0z | in_data[28];
  assign celloutsig_1_10z = celloutsig_1_5z[6] | celloutsig_1_9z;
  assign celloutsig_0_14z = celloutsig_0_5z | celloutsig_0_2z[0];
  assign celloutsig_0_23z = celloutsig_0_13z[13] | celloutsig_0_20z[4];
  assign celloutsig_1_4z = { celloutsig_1_1z[1], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z } + { in_data[157:154], celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_7z = in_data[111:99] + { celloutsig_1_5z[14:3], celloutsig_1_2z };
  assign celloutsig_1_13z = celloutsig_1_7z[10:5] + celloutsig_1_4z[6:1];
  assign celloutsig_0_11z = { celloutsig_0_7z, celloutsig_0_8z } + { celloutsig_0_3z[5:3], celloutsig_0_0z };
  assign celloutsig_0_13z = { celloutsig_0_6z[1], celloutsig_0_3z[5:1], celloutsig_0_3z[1], celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_4z } + { celloutsig_0_11z[1:0], celloutsig_0_8z, celloutsig_0_3z[5:1], celloutsig_0_3z[1], celloutsig_0_8z, celloutsig_0_3z[5:1], celloutsig_0_3z[1] };
  assign celloutsig_0_39z = celloutsig_0_25z[5:0] > in_data[79:74];
  assign celloutsig_1_12z = celloutsig_1_5z[11:7] > { celloutsig_1_1z[2:1], celloutsig_1_1z };
  assign celloutsig_1_18z = { celloutsig_1_17z[8:5], celloutsig_1_10z, celloutsig_1_9z } > { celloutsig_1_8z[1:0], celloutsig_1_1z, celloutsig_1_16z };
  assign celloutsig_0_1z = { in_data[75], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } > in_data[13:10];
  assign celloutsig_0_15z = { celloutsig_0_10z[1:0], celloutsig_0_4z } > celloutsig_0_2z[6:4];
  assign celloutsig_0_0z = in_data[89:72] <= in_data[85:68];
  assign celloutsig_1_2z = { in_data[142:134], celloutsig_1_0z } <= { in_data[135:132], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_9z = { celloutsig_1_1z[2], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_2z } <= celloutsig_1_7z[5:2];
  assign celloutsig_1_16z = { celloutsig_1_13z[5:1], celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_3z } <= { celloutsig_1_5z[13:6], celloutsig_1_12z, celloutsig_1_6z };
  assign celloutsig_0_9z = { celloutsig_0_6z, celloutsig_0_8z } <= { celloutsig_0_6z[10:0], celloutsig_0_8z, celloutsig_0_8z };
  assign celloutsig_0_21z = { celloutsig_0_20z[5:3], celloutsig_0_3z[5:1], celloutsig_0_3z[1] } <= { celloutsig_0_6z[8:2], celloutsig_0_1z, celloutsig_0_12z };
  assign celloutsig_1_11z = { celloutsig_1_7z[10:7], celloutsig_1_10z, celloutsig_1_1z } * { celloutsig_1_1z[1:0], celloutsig_1_10z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_6z };
  assign celloutsig_1_17z = { celloutsig_1_13z[3:0], celloutsig_1_10z, celloutsig_1_13z } * { celloutsig_1_11z[3:2], celloutsig_1_16z, celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_1_19z = celloutsig_1_17z[8:2] * { celloutsig_1_13z[1:0], celloutsig_1_2z, celloutsig_1_14z, celloutsig_1_12z };
  assign celloutsig_0_7z = { in_data[30:29], celloutsig_0_0z } * in_data[12:10];
  assign celloutsig_0_16z = { celloutsig_0_2z, celloutsig_0_10z } * { celloutsig_0_2z[3], celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_8z };
  assign celloutsig_0_25z = { celloutsig_0_17z[9:4], celloutsig_0_14z, celloutsig_0_23z } * { celloutsig_0_13z[11:7], celloutsig_0_9z, celloutsig_0_14z, celloutsig_0_22z };
  assign celloutsig_0_51z = - { celloutsig_0_2z[5], celloutsig_0_21z, celloutsig_0_34z };
  assign celloutsig_1_1z = - in_data[119:117];
  assign celloutsig_0_29z = - { celloutsig_0_20z[5:3], celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_14z };
  assign celloutsig_0_50z = { celloutsig_0_13z[15:5], celloutsig_0_23z, celloutsig_0_25z, celloutsig_0_21z, celloutsig_0_14z } | { celloutsig_0_48z, celloutsig_0_25z, celloutsig_0_37z, celloutsig_0_39z, celloutsig_0_9z, celloutsig_0_39z, celloutsig_0_37z };
  assign celloutsig_0_28z = { celloutsig_0_3z[4:1], celloutsig_0_8z, celloutsig_0_3z[5:1], celloutsig_0_3z[1] } | { celloutsig_0_2z[5:4], celloutsig_0_9z, celloutsig_0_15z, celloutsig_0_20z };
  assign celloutsig_1_0z = ~^ in_data[125:115];
  assign celloutsig_0_37z = { in_data[62:61], celloutsig_0_10z } <<< { celloutsig_0_29z[5:2], celloutsig_0_4z };
  assign celloutsig_0_6z = { in_data[94:91], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_3z[5:1], celloutsig_0_3z[1] } <<< { celloutsig_0_2z[6:2], celloutsig_0_2z };
  assign celloutsig_0_10z = { celloutsig_0_2z[6], celloutsig_0_9z, celloutsig_0_8z } <<< { celloutsig_0_2z[0], celloutsig_0_5z, celloutsig_0_5z };
  assign celloutsig_1_14z = { celloutsig_1_5z[9:8], celloutsig_1_12z } >>> celloutsig_1_13z[2:0];
  assign celloutsig_0_20z = { celloutsig_0_3z[4:2], celloutsig_0_11z } >>> celloutsig_0_6z[10:4];
  always_latch
    if (clkin_data[128]) celloutsig_1_5z = 15'h0000;
    else if (clkin_data[64]) celloutsig_1_5z = { celloutsig_1_4z[3:1], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_4z };
  always_latch
    if (clkin_data[160]) celloutsig_1_8z = 3'h0;
    else if (clkin_data[64]) celloutsig_1_8z = celloutsig_1_4z[2:0];
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_17z = 20'h00000;
    else if (clkin_data[0]) celloutsig_0_17z = { celloutsig_0_16z, celloutsig_0_16z };
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_2z = 7'h00;
    else if (!clkin_data[32]) celloutsig_0_2z = { in_data[91:88], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_3z[5:1] = { celloutsig_0_2z[4:1], celloutsig_0_1z } | { celloutsig_0_2z[6:3], celloutsig_0_0z };
  assign celloutsig_0_3z[0] = celloutsig_0_3z[1];
  assign { out_data[128], out_data[102:96], out_data[53:32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_50z, celloutsig_0_51z };
endmodule
