/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [12:0] celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [5:0] celloutsig_0_13z;
  reg [10:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [2:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [8:0] celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire [5:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  reg [11:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [2:0] celloutsig_0_28z;
  wire [16:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [4:0] celloutsig_0_30z;
  wire [11:0] celloutsig_0_32z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [8:0] celloutsig_0_5z;
  wire [20:0] celloutsig_0_6z;
  wire [2:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [7:0] celloutsig_1_11z;
  wire [22:0] celloutsig_1_12z;
  wire [16:0] celloutsig_1_13z;
  wire [3:0] celloutsig_1_14z;
  wire [3:0] celloutsig_1_16z;
  wire [15:0] celloutsig_1_17z;
  wire [2:0] celloutsig_1_19z;
  wire [11:0] celloutsig_1_1z;
  wire [7:0] celloutsig_1_2z;
  wire [10:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [5:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [4:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_2z = ~(celloutsig_0_1z[0] & celloutsig_0_0z);
  assign celloutsig_0_8z = ~((celloutsig_0_6z[4] | in_data[64]) & (celloutsig_0_5z[3] | celloutsig_0_5z[3]));
  assign celloutsig_1_8z = celloutsig_1_0z[0] | ~(in_data[162]);
  assign celloutsig_0_12z = celloutsig_0_2z | ~(celloutsig_0_1z[4]);
  assign celloutsig_1_6z = celloutsig_1_4z | celloutsig_1_1z[0];
  assign celloutsig_0_26z = celloutsig_0_1z[6] | celloutsig_0_18z[2];
  assign celloutsig_1_9z = celloutsig_1_4z ^ celloutsig_1_0z[1];
  assign celloutsig_1_3z = { celloutsig_1_2z[2:0], celloutsig_1_2z } + { celloutsig_1_2z[3:1], celloutsig_1_2z };
  assign celloutsig_0_6z = { in_data[83:65], celloutsig_0_0z, celloutsig_0_2z } + { in_data[49:30], celloutsig_0_2z };
  assign celloutsig_0_7z = celloutsig_0_5z[3:1] + in_data[10:8];
  assign celloutsig_1_16z = celloutsig_1_12z[16:13] / { 1'h1, celloutsig_1_13z[3:1] };
  assign celloutsig_1_4z = { celloutsig_1_3z[8:3], celloutsig_1_0z } == { celloutsig_1_2z[1], celloutsig_1_2z };
  assign celloutsig_0_17z = { celloutsig_0_10z[7:6], celloutsig_0_12z, celloutsig_0_8z } == celloutsig_0_6z[11:8];
  assign celloutsig_0_19z = celloutsig_0_1z[5:0] > celloutsig_0_10z[8:3];
  assign celloutsig_0_9z = celloutsig_0_5z[4:0] && { celloutsig_0_5z[6:4], celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_0_3z = ! in_data[73:71];
  assign celloutsig_0_36z = ! { celloutsig_0_6z[16:12], celloutsig_0_17z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_24z, celloutsig_0_7z };
  assign celloutsig_0_4z = ! { in_data[39:33], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_23z = ! { in_data[29], celloutsig_0_8z, celloutsig_0_18z };
  assign celloutsig_0_35z = { celloutsig_0_32z[8:0], celloutsig_0_26z } < { celloutsig_0_10z[5:1], celloutsig_0_30z };
  assign celloutsig_0_37z = { celloutsig_0_10z[7:1], celloutsig_0_35z, celloutsig_0_10z } < { celloutsig_0_14z[6:3], celloutsig_0_29z };
  assign celloutsig_1_10z = in_data[140:137] < celloutsig_1_3z[7:4];
  assign celloutsig_0_15z = { celloutsig_0_10z[11:3], celloutsig_0_0z } < celloutsig_0_14z[9:0];
  assign celloutsig_0_10z = { in_data[45:36], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_2z } % { 1'h1, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, in_data[0] };
  assign celloutsig_0_13z = { celloutsig_0_6z[11:7], celloutsig_0_2z } % { 1'h1, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_7z };
  assign celloutsig_0_29z = { celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_19z, celloutsig_0_20z } % { 1'h1, celloutsig_0_6z[17:6], celloutsig_0_15z, celloutsig_0_23z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_1_14z = celloutsig_1_0z[1] ? celloutsig_1_2z[5:2] : { in_data[99:98], celloutsig_1_9z, celloutsig_1_9z };
  assign celloutsig_1_19z = in_data[163] ? celloutsig_1_17z[5:3] : { celloutsig_1_16z[1], celloutsig_1_10z, celloutsig_1_6z };
  assign celloutsig_0_11z = celloutsig_0_9z ? { celloutsig_0_6z[17], celloutsig_0_7z, celloutsig_0_3z } : { celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_7z };
  assign celloutsig_0_16z = celloutsig_0_10z[12:7] != in_data[6:1];
  assign celloutsig_0_0z = in_data[30:19] !== in_data[53:42];
  assign celloutsig_0_22z = celloutsig_0_14z[2] & celloutsig_0_21z[5];
  assign celloutsig_0_24z = ^ in_data[36:14];
  assign celloutsig_1_0z = in_data[151:149] >> in_data[122:120];
  assign celloutsig_1_7z = { celloutsig_1_3z[9:8], celloutsig_1_0z } << celloutsig_1_3z[10:6];
  assign celloutsig_1_11z = { celloutsig_1_3z[10:9], celloutsig_1_6z, celloutsig_1_7z } << { in_data[185:180], celloutsig_1_6z, celloutsig_1_4z };
  assign celloutsig_0_20z = { celloutsig_0_5z[3:1], celloutsig_0_7z } >> celloutsig_0_5z[6:1];
  assign celloutsig_1_2z = { in_data[186:182], celloutsig_1_0z } <<< in_data[181:174];
  assign celloutsig_1_17z = { celloutsig_1_13z[4:3], celloutsig_1_4z, celloutsig_1_14z, celloutsig_1_4z, celloutsig_1_16z, celloutsig_1_6z, celloutsig_1_0z } <<< { celloutsig_1_3z[8:3], celloutsig_1_11z, celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_18z = { celloutsig_0_14z[2:1], celloutsig_0_0z } <<< celloutsig_0_1z[8:6];
  assign celloutsig_0_28z = celloutsig_0_11z[3:1] <<< celloutsig_0_5z[3:1];
  assign celloutsig_0_5z = { in_data[43:36], celloutsig_0_0z } >>> in_data[33:25];
  assign celloutsig_0_1z = in_data[27:19] >>> in_data[58:50];
  assign celloutsig_1_1z = in_data[124:113] - { in_data[105:97], celloutsig_1_0z };
  assign celloutsig_1_12z = { celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_11z, celloutsig_1_5z } - { celloutsig_1_2z[5:0], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_5z };
  assign celloutsig_0_21z = { celloutsig_0_13z[4:0], celloutsig_0_2z } - celloutsig_0_20z;
  assign celloutsig_1_5z = celloutsig_1_1z[8:3] ~^ celloutsig_1_1z[10:5];
  assign celloutsig_1_13z = { celloutsig_1_10z, celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_10z } ~^ { in_data[187:183], celloutsig_1_3z, celloutsig_1_9z };
  assign celloutsig_0_30z = celloutsig_0_13z[4:0] ~^ { celloutsig_0_1z[5:4], celloutsig_0_28z };
  assign celloutsig_0_32z = { celloutsig_0_25z[11:6], celloutsig_0_13z } ~^ { celloutsig_0_30z[1], celloutsig_0_1z, celloutsig_0_22z, celloutsig_0_9z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_14z = 11'h000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_14z = { celloutsig_0_6z[9:0], celloutsig_0_0z };
  always_latch
    if (clkin_data[32]) celloutsig_0_25z = 12'h000;
    else if (celloutsig_1_19z[0]) celloutsig_0_25z = { celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_8z, celloutsig_0_18z, celloutsig_0_8z, celloutsig_0_11z };
  assign { out_data[128], out_data[98:96], out_data[32], out_data[0] } = { 1'h1, celloutsig_1_19z, celloutsig_0_36z, celloutsig_0_37z };
endmodule
