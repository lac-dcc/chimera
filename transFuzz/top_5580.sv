/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [15:0] celloutsig_0_10z;
  wire [14:0] celloutsig_0_11z;
  wire [10:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  reg [8:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [30:0] celloutsig_0_1z;
  wire [2:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [3:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire [22:0] celloutsig_0_2z;
  wire [4:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  reg [3:0] celloutsig_0_3z;
  wire [7:0] celloutsig_0_41z;
  wire [7:0] celloutsig_0_4z;
  wire celloutsig_0_56z;
  wire celloutsig_0_5z;
  wire celloutsig_0_67z;
  wire [8:0] celloutsig_0_68z;
  wire celloutsig_0_6z;
  wire [9:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [22:0] celloutsig_1_1z;
  wire [3:0] celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [26:0] celloutsig_1_5z;
  reg [5:0] celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire [13:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_33z = celloutsig_0_16z ? celloutsig_0_12z[0] : celloutsig_0_6z;
  assign celloutsig_0_36z = celloutsig_0_17z ? celloutsig_0_8z : celloutsig_0_16z;
  assign celloutsig_1_4z = celloutsig_1_3z[5] ? celloutsig_1_2z[2] : celloutsig_1_0z;
  assign celloutsig_0_17z = celloutsig_0_12z[3] ? celloutsig_0_13z : celloutsig_0_14z;
  assign celloutsig_0_67z = ~(celloutsig_0_35z | celloutsig_0_33z);
  assign celloutsig_1_0z = ~(in_data[184] | in_data[108]);
  assign celloutsig_0_9z = ~(celloutsig_0_6z | in_data[83]);
  assign celloutsig_0_19z = ~(celloutsig_0_11z[14] | celloutsig_0_9z);
  assign celloutsig_0_6z = ~celloutsig_0_3z[0];
  assign celloutsig_0_13z = ~celloutsig_0_11z[10];
  assign celloutsig_0_22z = ~celloutsig_0_7z[5];
  assign celloutsig_1_19z = ~((celloutsig_1_7z[1] | in_data[124]) & celloutsig_1_9z[0]);
  assign celloutsig_1_2z = in_data[191:188] + in_data[175:172];
  assign celloutsig_0_1z = { in_data[32:4], celloutsig_0_0z, celloutsig_0_0z } + { in_data[95:66], celloutsig_0_0z };
  assign celloutsig_0_2z = { in_data[27:6], celloutsig_0_0z } + { celloutsig_0_1z[19:0], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_0z = in_data[69:66] == in_data[25:22];
  assign celloutsig_0_5z = celloutsig_0_2z[19:16] === celloutsig_0_2z[14:11];
  assign celloutsig_1_18z = celloutsig_1_5z[20:12] === celloutsig_1_9z[13:5];
  assign celloutsig_0_14z = { celloutsig_0_10z[11:2], celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_13z } === { celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_4z };
  assign celloutsig_0_4z = celloutsig_0_2z[16:9] % { 1'h1, celloutsig_0_2z[18:16], celloutsig_0_3z };
  assign celloutsig_1_9z = { celloutsig_1_5z[20:10], celloutsig_1_7z } % { 1'h1, celloutsig_1_1z[14:2] };
  assign celloutsig_0_18z = { celloutsig_0_12z[7:5], celloutsig_0_0z } % { 1'h1, celloutsig_0_15z[7:5] };
  assign celloutsig_0_32z = { celloutsig_0_21z, celloutsig_0_27z, celloutsig_0_25z } % { 1'h1, celloutsig_0_7z[6], celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_13z };
  assign celloutsig_1_3z = - { in_data[176:172], celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_5z = - { celloutsig_1_1z[21:0], celloutsig_1_4z, celloutsig_1_2z };
  assign celloutsig_0_10z = - { celloutsig_0_1z[28:24], celloutsig_0_5z, celloutsig_0_7z };
  assign celloutsig_1_1z = ~ { in_data[149:128], celloutsig_1_0z };
  assign celloutsig_0_35z = | celloutsig_0_2z[21:18];
  assign celloutsig_0_56z = | celloutsig_0_24z[2:0];
  assign celloutsig_0_27z = | { celloutsig_0_18z[1:0], celloutsig_0_25z };
  assign celloutsig_0_12z = { celloutsig_0_1z[13:4], celloutsig_0_5z } >> { celloutsig_0_1z[12:6], celloutsig_0_3z };
  assign celloutsig_0_41z = { celloutsig_0_1z[30:25], celloutsig_0_36z, celloutsig_0_27z } >> { celloutsig_0_18z[2], celloutsig_0_8z, celloutsig_0_22z, celloutsig_0_32z };
  assign celloutsig_0_24z = { celloutsig_0_10z[4:2], celloutsig_0_16z } >> celloutsig_0_7z[5:2];
  assign celloutsig_1_7z = celloutsig_1_5z[7:5] <<< { celloutsig_1_6z[4], celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_68z = { celloutsig_0_41z[3:1], celloutsig_0_56z, celloutsig_0_3z, celloutsig_0_67z } ~^ celloutsig_0_12z[8:0];
  assign celloutsig_0_7z = { celloutsig_0_1z[13:6], celloutsig_0_6z, celloutsig_0_0z } ~^ celloutsig_0_1z[23:14];
  assign celloutsig_0_11z = { celloutsig_0_2z[11], celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_8z } ~^ { celloutsig_0_4z[6:0], celloutsig_0_4z };
  assign celloutsig_0_21z = { celloutsig_0_12z[9], celloutsig_0_9z, celloutsig_0_19z } ~^ celloutsig_0_1z[7:5];
  always_latch
    if (!clkin_data[32]) celloutsig_0_3z = 4'h0;
    else if (!celloutsig_1_18z) celloutsig_0_3z = in_data[66:63];
  always_latch
    if (clkin_data[64]) celloutsig_1_6z = 6'h00;
    else if (clkin_data[0]) celloutsig_1_6z = { celloutsig_1_5z[10:9], celloutsig_1_2z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_15z = 9'h000;
    else if (celloutsig_1_18z) celloutsig_0_15z = { celloutsig_0_3z[1], celloutsig_0_4z };
  assign celloutsig_0_8z = ~((celloutsig_0_5z & celloutsig_0_6z) | (celloutsig_0_2z[13] & celloutsig_0_5z));
  assign celloutsig_0_16z = ~((celloutsig_0_8z & celloutsig_0_3z[0]) | (in_data[25] & celloutsig_0_14z));
  assign celloutsig_0_25z = ~((celloutsig_0_10z[15] & celloutsig_0_19z) | (in_data[76] & celloutsig_0_13z));
  assign { out_data[128], out_data[96], out_data[32], out_data[8:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_67z, celloutsig_0_68z };
endmodule
