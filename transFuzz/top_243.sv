/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [3:0] celloutsig_0_0z;
  reg [19:0] celloutsig_0_10z;
  reg [6:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [3:0] celloutsig_0_17z;
  wire [2:0] celloutsig_0_18z;
  reg [27:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [10:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [4:0] celloutsig_0_24z;
  wire [14:0] celloutsig_0_25z;
  wire [27:0] celloutsig_0_27z;
  wire [4:0] celloutsig_0_29z;
  wire [22:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  reg [9:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [6:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [17:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  reg [2:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  reg [19:0] celloutsig_1_2z;
  wire [4:0] celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [2:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [15:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_9z = celloutsig_1_8z[9] ? celloutsig_1_8z[15] : celloutsig_1_0z[2];
  assign celloutsig_1_5z = ~(1'h1 & 1'h1);
  assign celloutsig_1_7z = ~(1'h1 & celloutsig_1_4z[2]);
  assign celloutsig_0_9z = ~(celloutsig_0_5z & celloutsig_0_3z);
  assign celloutsig_0_20z = ~(celloutsig_0_16z & celloutsig_0_11z[6]);
  assign celloutsig_1_10z = ~(celloutsig_1_9z | in_data[149]);
  assign celloutsig_0_7z = ~((in_data[49] | celloutsig_0_1z) & (in_data[42] | celloutsig_0_6z));
  assign celloutsig_0_30z = celloutsig_0_21z[10] | ~(celloutsig_0_6z);
  assign celloutsig_0_3z = in_data[72] ^ celloutsig_0_0z[1];
  assign celloutsig_1_0z = in_data[183:177] + in_data[154:148];
  assign celloutsig_0_14z = { in_data[42:40], celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_9z } == { celloutsig_0_10z[17:15], celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_0_16z = { celloutsig_0_10z[14:7], celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_9z } == { celloutsig_0_12z, celloutsig_0_8z };
  assign celloutsig_0_22z = { in_data[89:71], celloutsig_0_3z, celloutsig_0_9z } == celloutsig_0_19z[20:0];
  assign celloutsig_0_12z = { celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_9z } === { celloutsig_0_10z[19:18], celloutsig_0_5z };
  assign celloutsig_1_11z = { celloutsig_1_4z, celloutsig_1_9z } <= celloutsig_1_2z[6:1];
  assign celloutsig_0_4z = celloutsig_0_2z[16:7] <= celloutsig_0_2z[9:0];
  assign celloutsig_0_5z = { in_data[88:81], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_3z } && { in_data[10:9], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_21z = { celloutsig_0_2z[9:1], celloutsig_0_3z, celloutsig_0_15z } % { 1'h1, celloutsig_0_10z[11:6], celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_12z };
  assign celloutsig_0_24z = { celloutsig_0_11z[2:1], celloutsig_0_7z, celloutsig_0_22z, celloutsig_0_6z } % { 1'h1, celloutsig_0_18z, celloutsig_0_14z };
  assign celloutsig_0_29z = { celloutsig_0_2z[19], celloutsig_0_15z, celloutsig_0_20z, celloutsig_0_3z, celloutsig_0_1z } % { 1'h1, celloutsig_0_27z[22:20], celloutsig_0_12z };
  assign celloutsig_1_14z = { in_data[100:96], celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_7z } != { celloutsig_1_13z[8:0], celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_5z };
  assign celloutsig_1_18z = { celloutsig_1_17z, 1'h1, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_4z } != celloutsig_1_2z[18:3];
  assign celloutsig_1_3z = ~ celloutsig_1_2z[10:6];
  assign celloutsig_0_6z = | { in_data[93:90], celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_1z };
  assign celloutsig_0_1z = in_data[27] & celloutsig_0_0z[2];
  assign celloutsig_0_13z = ^ { celloutsig_0_0z[2], celloutsig_0_0z };
  assign celloutsig_0_15z = ^ { celloutsig_0_8z[4:2], celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_18z = { celloutsig_0_2z[21:20], celloutsig_0_14z } >> { in_data[39], celloutsig_0_9z, celloutsig_0_5z };
  assign celloutsig_0_17z = { celloutsig_0_9z, celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_13z } << celloutsig_0_2z[15:12];
  assign celloutsig_0_27z = { celloutsig_0_24z[3:2], celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_24z } << { celloutsig_0_10z[12:4], celloutsig_0_12z, celloutsig_0_25z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_14z };
  assign celloutsig_1_8z = in_data[113:98] >>> { celloutsig_1_3z[4:1], celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_1_13z = celloutsig_1_2z[17:0] - { celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_10z };
  assign celloutsig_1_4z = celloutsig_1_0z[6:2] ^ celloutsig_1_2z[16:12];
  assign celloutsig_1_6z = celloutsig_1_2z[7:5] ^ in_data[155:153];
  assign celloutsig_0_2z = { in_data[48:46], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z } ^ in_data[94:72];
  assign celloutsig_0_25z = in_data[57:43] ^ { celloutsig_0_11z[5:0], celloutsig_0_22z, celloutsig_0_11z, celloutsig_0_1z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_0z = 4'h0;
    else if (clkin_data[0]) celloutsig_0_0z = in_data[16:13];
  always_latch
    if (clkin_data[96]) celloutsig_1_2z = 20'h00000;
    else if (!clkin_data[64]) celloutsig_1_2z = { celloutsig_1_0z[5:2], 1'h1, celloutsig_1_0z, celloutsig_1_0z, 1'h1 };
  always_latch
    if (clkin_data[96]) celloutsig_1_17z = 3'h0;
    else if (clkin_data[64]) celloutsig_1_17z = { celloutsig_1_3z[3:2], celloutsig_1_14z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_8z = 10'h000;
    else if (!clkin_data[32]) celloutsig_0_8z = { celloutsig_0_2z[15:7], celloutsig_0_1z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_10z = 20'h00000;
    else if (!clkin_data[0]) celloutsig_0_10z = { in_data[95:77], celloutsig_0_9z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_11z = 7'h00;
    else if (clkin_data[32]) celloutsig_0_11z = { celloutsig_0_10z[18], celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_0z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_19z = 28'h0000000;
    else if (clkin_data[32]) celloutsig_0_19z = { celloutsig_0_8z[5:4], celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_11z };
  assign { out_data[128], out_data[96], out_data[36:32], out_data[0] } = { celloutsig_1_18z, 1'h0, celloutsig_0_29z, celloutsig_0_30z };
endmodule
