/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [8:0] celloutsig_0_12z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [10:0] celloutsig_0_17z;
  wire [2:0] celloutsig_0_18z;
  wire [3:0] celloutsig_0_19z;
  wire [28:0] celloutsig_0_1z;
  wire [7:0] celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [3:0] celloutsig_0_25z;
  reg [3:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [15:0] celloutsig_0_33z;
  wire [9:0] celloutsig_0_35z;
  reg [2:0] celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire [7:0] celloutsig_0_44z;
  reg [3:0] celloutsig_0_45z;
  wire celloutsig_0_4z;
  wire [7:0] celloutsig_0_5z;
  wire [51:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [5:0] celloutsig_0_9z;
  wire [7:0] celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire [4:0] celloutsig_1_12z;
  wire [21:0] celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [7:0] celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire [6:0] celloutsig_1_7z;
  wire [7:0] celloutsig_1_8z;
  wire [8:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_11z = !(celloutsig_1_3z ? celloutsig_1_8z[5] : celloutsig_1_2z[0]);
  assign celloutsig_1_19z = !(celloutsig_1_12z[2] ? celloutsig_1_4z[1] : celloutsig_1_7z[5]);
  assign celloutsig_0_8z = !(celloutsig_0_2z ? celloutsig_0_1z[6] : celloutsig_0_7z);
  assign celloutsig_0_15z = !(celloutsig_0_3z[1] ? celloutsig_0_4z : in_data[27]);
  assign celloutsig_0_2z = !(celloutsig_0_1z[11] ? in_data[95] : celloutsig_0_1z[2]);
  assign celloutsig_0_0z = in_data[12] ^ in_data[20];
  assign celloutsig_1_6z = celloutsig_1_3z ^ celloutsig_1_2z[2];
  assign celloutsig_0_23z = celloutsig_0_19z[1] ^ celloutsig_0_10z;
  assign celloutsig_1_0z = in_data[171:164] & in_data[110:103];
  assign celloutsig_1_7z = { celloutsig_1_1z[2:0], celloutsig_1_6z, celloutsig_1_4z } & { celloutsig_1_1z[3:0], celloutsig_1_4z };
  assign celloutsig_1_18z = celloutsig_1_14z[12:10] == { celloutsig_1_1z[3:2], celloutsig_1_3z };
  assign celloutsig_0_10z = { celloutsig_0_5z[3:2], celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_3z } == in_data[20:7];
  assign celloutsig_0_14z = { celloutsig_0_9z[3], celloutsig_0_4z, celloutsig_0_2z } == { celloutsig_0_1z[11:10], celloutsig_0_8z };
  assign celloutsig_0_4z = in_data[79:73] >= { celloutsig_0_1z[19:15], celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_7z = { celloutsig_0_1z[17:7], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_4z } >= { celloutsig_0_6z[12:0], celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_22z = { celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_2z } >= { celloutsig_0_9z[3:1], celloutsig_0_19z };
  assign celloutsig_0_28z = { in_data[83:77], celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_23z, celloutsig_0_18z } >= { in_data[69:62], celloutsig_0_25z, celloutsig_0_27z };
  assign celloutsig_0_33z = { celloutsig_0_0z, celloutsig_0_28z, celloutsig_0_19z, celloutsig_0_18z, celloutsig_0_9z, celloutsig_0_10z } % { 1'h1, celloutsig_0_6z[47:33] };
  assign celloutsig_0_44z = celloutsig_0_33z[11:4] % { 1'h1, celloutsig_0_20z[4:1], celloutsig_0_41z, celloutsig_0_4z, celloutsig_0_7z };
  assign celloutsig_1_8z = { in_data[158:154], celloutsig_1_4z } % { 1'h1, celloutsig_1_7z[3:0], celloutsig_1_2z };
  assign celloutsig_0_5z = { in_data[70:64], celloutsig_0_0z } % { 1'h1, celloutsig_0_1z[14:8] };
  assign celloutsig_0_9z = celloutsig_0_1z[14:9] % { 1'h1, in_data[87:86], celloutsig_0_3z };
  assign celloutsig_0_18z = in_data[29:27] % { 1'h1, celloutsig_0_9z[2:1] };
  assign celloutsig_0_35z = celloutsig_0_1z[23:14] * { celloutsig_0_15z, celloutsig_0_12z };
  assign celloutsig_1_14z = in_data[120:99] * { celloutsig_1_9z[6:2], celloutsig_1_12z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_0_17z = { celloutsig_0_1z[13:4], celloutsig_0_8z } * { celloutsig_0_5z[7], celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_4z };
  assign celloutsig_0_20z = { celloutsig_0_17z[5:4], celloutsig_0_9z } * { celloutsig_0_17z[7:1], celloutsig_0_8z };
  assign celloutsig_0_25z = { celloutsig_0_8z, celloutsig_0_3z } * celloutsig_0_19z;
  assign celloutsig_0_27z = ~^ celloutsig_0_1z[18:15];
  assign celloutsig_1_1z = celloutsig_1_0z <<< celloutsig_1_0z;
  assign celloutsig_1_2z = celloutsig_1_0z[7:5] <<< in_data[109:107];
  assign celloutsig_1_9z = { celloutsig_1_1z[5:0], celloutsig_1_4z } <<< { celloutsig_1_1z[5:0], celloutsig_1_4z };
  assign celloutsig_0_6z = { celloutsig_0_1z[23:22], celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_5z } <<< { celloutsig_0_1z[23:19], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_1z = in_data[87:59] <<< { in_data[79:53], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_12z = celloutsig_0_1z[19:11] <<< { celloutsig_0_5z, celloutsig_0_11z };
  assign celloutsig_1_4z = celloutsig_1_0z[4:2] ^ celloutsig_1_1z[3:1];
  assign celloutsig_1_12z = { celloutsig_1_7z[3:2], celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_11z } ^ { in_data[148:145], celloutsig_1_6z };
  assign celloutsig_0_19z = celloutsig_0_5z[6:3] ^ { celloutsig_0_14z, celloutsig_0_18z };
  assign celloutsig_0_41z = ~((celloutsig_0_26z[2] & celloutsig_0_6z[6]) | celloutsig_0_33z[4]);
  assign celloutsig_1_3z = ~((celloutsig_1_1z[2] & celloutsig_1_2z[1]) | celloutsig_1_1z[5]);
  assign celloutsig_0_11z = ~((celloutsig_0_2z & celloutsig_0_0z) | celloutsig_0_2z);
  assign celloutsig_0_16z = ~((celloutsig_0_15z & celloutsig_0_3z[2]) | celloutsig_0_3z[1]);
  assign celloutsig_0_24z = ~((celloutsig_0_14z & celloutsig_0_20z[2]) | celloutsig_0_16z);
  always_latch
    if (clkin_data[64]) celloutsig_0_3z = 3'h0;
    else if (!celloutsig_1_18z) celloutsig_0_3z = { celloutsig_0_1z[15:14], celloutsig_0_0z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_45z = 4'h0;
    else if (celloutsig_1_18z) celloutsig_0_45z = { celloutsig_0_35z[6:4], celloutsig_0_4z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_26z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_26z = { celloutsig_0_22z, celloutsig_0_24z, celloutsig_0_22z, celloutsig_0_0z };
  assign { out_data[128], out_data[96], out_data[39:32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_44z, celloutsig_0_45z };
endmodule
