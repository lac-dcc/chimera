/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [4:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  reg [2:0] celloutsig_0_12z;
  wire [5:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire [20:0] celloutsig_0_15z;
  wire celloutsig_0_1z;
  wire [4:0] celloutsig_0_20z;
  wire [2:0] celloutsig_0_22z;
  wire [6:0] celloutsig_0_23z;
  reg [2:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_2z;
  wire [6:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [12:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire [4:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [26:0] celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [7:0] celloutsig_1_6z;
  reg [3:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_8z = !(celloutsig_1_2z[7] ? celloutsig_1_2z[23] : celloutsig_1_4z);
  assign celloutsig_1_9z = !(celloutsig_1_0z ? in_data[140] : celloutsig_1_4z);
  assign celloutsig_1_15z = !(celloutsig_1_9z ? celloutsig_1_8z : celloutsig_1_1z);
  assign celloutsig_0_11z = !(celloutsig_0_9z ? celloutsig_0_10z : celloutsig_0_2z);
  assign celloutsig_0_26z = !(celloutsig_0_20z[2] ? celloutsig_0_14z[1] : celloutsig_0_23z[6]);
  assign celloutsig_1_4z = celloutsig_1_0z | celloutsig_1_2z[0];
  assign celloutsig_1_5z = in_data[122] | celloutsig_1_0z;
  assign celloutsig_1_16z = in_data[159] | celloutsig_1_4z;
  assign celloutsig_0_5z = in_data[40] | in_data[95];
  assign celloutsig_0_8z = celloutsig_0_7z | celloutsig_0_0z[2];
  assign celloutsig_0_2z = celloutsig_0_1z | in_data[67];
  assign celloutsig_1_0z = in_data[162] | in_data[173];
  assign celloutsig_1_1z = in_data[135] | in_data[114];
  assign celloutsig_0_13z = { celloutsig_0_12z[2], celloutsig_0_0z } + { celloutsig_0_3z[5:1], celloutsig_0_10z };
  assign celloutsig_0_15z = { celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_4z, celloutsig_0_1z } + { in_data[22:11], celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_13z };
  assign celloutsig_0_20z = celloutsig_0_15z[8:4] + { celloutsig_0_3z[5:2], celloutsig_0_4z };
  assign celloutsig_0_22z = { celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_9z } + celloutsig_0_3z[2:0];
  assign celloutsig_0_0z = in_data[7:3] / { 1'h1, in_data[79:76] };
  assign celloutsig_1_6z = { celloutsig_1_2z[23:18], celloutsig_1_1z, celloutsig_1_1z } / { 1'h1, celloutsig_1_2z[23:17] };
  assign celloutsig_1_17z = { celloutsig_1_13z, celloutsig_1_10z } / { 1'h1, celloutsig_1_7z[2:0], celloutsig_1_4z };
  assign celloutsig_0_23z = in_data[90:84] / { 1'h1, celloutsig_0_0z[2:1], celloutsig_0_5z, celloutsig_0_22z };
  assign celloutsig_1_19z = { celloutsig_1_10z[1], celloutsig_1_15z, celloutsig_1_4z, celloutsig_1_16z, celloutsig_1_16z, celloutsig_1_14z, celloutsig_1_8z } >= { in_data[188:179], celloutsig_1_7z, celloutsig_1_17z };
  assign celloutsig_0_7z = celloutsig_0_0z[2:0] >= { celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_5z };
  assign celloutsig_0_10z = { celloutsig_0_3z[4:3], celloutsig_0_5z } >= { celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_5z };
  assign celloutsig_0_3z = in_data[38:32] | { in_data[60:56], celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_1_10z = celloutsig_1_7z | { celloutsig_1_7z[3], celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_5z };
  assign celloutsig_1_14z = { celloutsig_1_2z[16:5], celloutsig_1_4z } | { celloutsig_1_7z[2:0], celloutsig_1_12z, celloutsig_1_6z, celloutsig_1_12z };
  assign celloutsig_0_14z = { celloutsig_0_3z[2:1], celloutsig_0_9z } | { celloutsig_0_12z[2], celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_1_2z = in_data[143:117] | in_data[125:99];
  assign celloutsig_1_13z = | celloutsig_1_6z[6:1];
  assign celloutsig_0_4z = | in_data[25:6];
  assign celloutsig_1_18z = | { celloutsig_1_6z[7:4], celloutsig_1_8z, celloutsig_1_15z };
  assign celloutsig_0_6z = | { in_data[73:67], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_1_12z = ~^ { in_data[147:138], celloutsig_1_9z, celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_10z, celloutsig_1_1z, celloutsig_1_11z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_7z = 4'h0;
    else if (!clkin_data[0]) celloutsig_1_7z = { in_data[148:147], celloutsig_1_0z, celloutsig_1_1z };
  always_latch
    if (clkin_data[32]) celloutsig_0_12z = 3'h0;
    else if (!celloutsig_1_18z) celloutsig_0_12z = celloutsig_0_0z[3:1];
  always_latch
    if (clkin_data[32]) celloutsig_0_25z = 3'h0;
    else if (!celloutsig_1_18z) celloutsig_0_25z = celloutsig_0_15z[7:5];
  assign celloutsig_1_11z = ~((celloutsig_1_5z & celloutsig_1_8z) | (celloutsig_1_4z & celloutsig_1_1z));
  assign celloutsig_0_9z = ~((celloutsig_0_3z[4] & celloutsig_0_8z) | (celloutsig_0_2z & celloutsig_0_2z));
  assign celloutsig_0_1z = ~((celloutsig_0_0z[0] & in_data[57]) | (in_data[38] & celloutsig_0_0z[0]));
  assign { out_data[128], out_data[96], out_data[34:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_25z, celloutsig_0_26z };
endmodule
