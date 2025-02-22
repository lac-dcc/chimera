/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [16:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [19:0] celloutsig_0_11z;
  reg [24:0] celloutsig_0_12z;
  wire [9:0] celloutsig_0_13z;
  wire [7:0] celloutsig_0_14z;
  wire [13:0] celloutsig_0_15z;
  wire [7:0] celloutsig_0_16z;
  wire [20:0] celloutsig_0_17z;
  reg [11:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [20:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [14:0] celloutsig_0_23z;
  wire [6:0] celloutsig_0_25z;
  wire [6:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [2:0] celloutsig_0_31z;
  wire [4:0] celloutsig_0_35z;
  wire [20:0] celloutsig_0_36z;
  wire celloutsig_0_3z;
  reg [9:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire [4:0] celloutsig_0_4z;
  wire [3:0] celloutsig_0_59z;
  wire [2:0] celloutsig_0_5z;
  wire celloutsig_0_62z;
  wire [4:0] celloutsig_0_6z;
  wire celloutsig_0_71z;
  wire celloutsig_0_7z;
  wire [6:0] celloutsig_0_8z;
  wire [2:0] celloutsig_0_91z;
  wire celloutsig_0_92z;
  wire celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire [6:0] celloutsig_1_12z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [5:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [6:0] celloutsig_1_3z;
  wire [14:0] celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire [4:0] celloutsig_1_7z;
  wire [15:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_43z = ~(celloutsig_0_40z[4] | celloutsig_0_36z[2]);
  assign celloutsig_0_44z = ~(celloutsig_0_18z[4] | celloutsig_0_0z[1]);
  assign celloutsig_0_62z = ~(celloutsig_0_43z | celloutsig_0_17z[7]);
  assign celloutsig_0_9z = ~(celloutsig_0_4z[2] | celloutsig_0_4z[3]);
  assign celloutsig_0_92z = ~(celloutsig_0_35z[3] | celloutsig_0_44z);
  assign celloutsig_1_2z = ~(celloutsig_1_1z[2] | in_data[182]);
  assign celloutsig_0_10z = ~(celloutsig_0_4z[0] | celloutsig_0_9z);
  assign celloutsig_1_18z = ~(celloutsig_1_11z | celloutsig_1_4z[3]);
  assign celloutsig_1_19z = ~(celloutsig_1_12z[6] | celloutsig_1_9z[5]);
  assign celloutsig_0_20z = ~(celloutsig_0_17z[6] | celloutsig_0_16z[5]);
  assign celloutsig_0_22z = ~(celloutsig_0_21z[8] | celloutsig_0_9z);
  assign celloutsig_0_41z = ~celloutsig_0_7z;
  assign celloutsig_0_71z = ~celloutsig_0_62z;
  assign celloutsig_1_6z = ~in_data[135];
  assign celloutsig_1_11z = ~celloutsig_1_7z[4];
  assign celloutsig_0_3z = ~celloutsig_0_1z;
  assign celloutsig_0_6z = celloutsig_0_0z[8:4] / { 1'h1, in_data[45:42] };
  assign celloutsig_1_0z = in_data[154:150] / { 1'h1, in_data[130:127] };
  assign celloutsig_1_12z = { celloutsig_1_0z[1], celloutsig_1_6z, celloutsig_1_7z } / { 1'h1, in_data[133:128] };
  assign celloutsig_0_11z = { in_data[91:82], celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_3z } / { 1'h1, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_1z };
  assign celloutsig_0_21z = { celloutsig_0_0z[9:4], celloutsig_0_8z, celloutsig_0_16z } / { 1'h1, in_data[85:81], celloutsig_0_20z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_9z };
  assign celloutsig_0_25z = { celloutsig_0_23z[14:9], celloutsig_0_3z } / { 1'h1, celloutsig_0_17z[9:5], celloutsig_0_20z };
  assign celloutsig_0_7z = { celloutsig_0_5z, celloutsig_0_5z } === in_data[53:48];
  assign celloutsig_0_1z = in_data[55:51] === in_data[78:74];
  assign celloutsig_0_2z = celloutsig_0_0z[15:0] === in_data[91:76];
  assign celloutsig_0_35z = { celloutsig_0_17z[5:2], celloutsig_0_22z } % { 1'h1, celloutsig_0_8z[4:1] };
  assign celloutsig_0_4z = celloutsig_0_0z[14:10] % { 1'h1, celloutsig_0_0z[7:4] };
  assign celloutsig_1_4z = { celloutsig_1_0z[2], celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_3z } % { 1'h1, in_data[181:175], celloutsig_1_3z[6:1], in_data[96] };
  assign celloutsig_0_14z = { celloutsig_0_0z[3:1], celloutsig_0_6z } % { 1'h1, celloutsig_0_11z[4:0], celloutsig_0_2z, celloutsig_0_7z };
  assign celloutsig_0_29z = celloutsig_0_16z[6:0] % { 1'h1, celloutsig_0_12z[13:9], celloutsig_0_2z };
  assign celloutsig_0_31z = { celloutsig_0_25z[5:4], celloutsig_0_20z } % { 1'h1, celloutsig_0_29z[1:0] };
  assign celloutsig_0_0z = - in_data[27:11];
  assign celloutsig_0_36z = - { celloutsig_0_21z[1], celloutsig_0_0z, celloutsig_0_31z };
  assign celloutsig_0_8z = - { in_data[83:79], celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_1_3z = - { celloutsig_1_0z[0], celloutsig_1_1z };
  assign celloutsig_0_16z = - { celloutsig_0_14z[7:5], celloutsig_0_6z };
  assign celloutsig_0_5z = { in_data[10:9], celloutsig_0_1z } - { celloutsig_0_4z[1:0], celloutsig_0_2z };
  assign celloutsig_0_59z = celloutsig_0_18z[3:0] - celloutsig_0_8z[5:2];
  assign celloutsig_0_91z = celloutsig_0_23z[11:9] - { celloutsig_0_59z[1], celloutsig_0_71z, celloutsig_0_41z };
  assign celloutsig_1_1z = { celloutsig_1_0z[1], celloutsig_1_0z } - in_data[138:133];
  assign celloutsig_1_7z = celloutsig_1_4z[8:4] - celloutsig_1_1z[5:1];
  assign celloutsig_1_9z = { celloutsig_1_3z[6:2], celloutsig_1_0z, celloutsig_1_1z } - in_data[117:102];
  assign celloutsig_0_13z = { celloutsig_0_0z[16:14], celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_1z } - { celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_10z, celloutsig_0_8z };
  assign celloutsig_0_15z = celloutsig_0_12z[16:3] - celloutsig_0_0z[15:2];
  assign celloutsig_0_17z = { celloutsig_0_10z, celloutsig_0_11z } - { celloutsig_0_11z, celloutsig_0_2z };
  assign celloutsig_0_23z = { celloutsig_0_11z[10:9], celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_22z } - { celloutsig_0_18z[10:1], celloutsig_0_6z };
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_40z = 10'h000;
    else if (!clkin_data[0]) celloutsig_0_40z = { celloutsig_0_15z[13:9], celloutsig_0_4z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_12z = 25'h0000000;
    else if (clkin_data[0]) celloutsig_0_12z = { in_data[22:15], celloutsig_0_0z };
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_18z = 12'h000;
    else if (clkin_data[0]) celloutsig_0_18z = { celloutsig_0_15z[11:3], celloutsig_0_5z };
  assign { out_data[128], out_data[96], out_data[34:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_91z, celloutsig_0_92z };
endmodule
