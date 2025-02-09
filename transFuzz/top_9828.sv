/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [6:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire [2:0] celloutsig_0_20z;
  wire [5:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [15:0] celloutsig_0_25z;
  wire celloutsig_0_28z;
  wire [6:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [11:0] celloutsig_0_33z;
  wire [11:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire celloutsig_0_4z;
  wire celloutsig_0_59z;
  wire [16:0] celloutsig_0_5z;
  reg [2:0] celloutsig_0_60z;
  wire [3:0] celloutsig_0_6z;
  wire [65:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [10:0] celloutsig_0_9z;
  wire [9:0] celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire [9:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [7:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_4z = celloutsig_1_2z ? celloutsig_1_3z : celloutsig_1_1z;
  assign celloutsig_0_13z = celloutsig_0_6z[0] ? celloutsig_0_9z[1] : celloutsig_0_2z;
  assign celloutsig_0_2z = ~(in_data[77] & celloutsig_0_1z);
  assign celloutsig_0_17z = !(celloutsig_0_11z ? celloutsig_0_0z : celloutsig_0_6z[0]);
  assign celloutsig_1_18z = ~((celloutsig_1_11z | celloutsig_1_0z[7]) & celloutsig_1_9z);
  assign celloutsig_1_19z = ~((celloutsig_1_7z | celloutsig_1_9z) & celloutsig_1_8z[4]);
  assign celloutsig_0_24z = ~((celloutsig_0_21z[1] | celloutsig_0_12z) & celloutsig_0_22z);
  assign celloutsig_0_12z = celloutsig_0_6z[1] ^ celloutsig_0_1z;
  assign celloutsig_0_16z = celloutsig_0_15z ^ celloutsig_0_11z;
  assign celloutsig_0_5z = { in_data[72:57], celloutsig_0_4z } / { 1'h1, in_data[30:21], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_25z = { celloutsig_0_7z[46:44], celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_12z } / { 1'h1, in_data[53:52], celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_20z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_24z, celloutsig_0_14z };
  assign celloutsig_0_59z = celloutsig_0_34z === { in_data[85:75], celloutsig_0_22z };
  assign celloutsig_0_4z = in_data[37:29] >= in_data[49:41];
  assign celloutsig_0_42z = { celloutsig_0_6z[3:2], celloutsig_0_1z, celloutsig_0_4z } >= { celloutsig_0_18z[6:4], celloutsig_0_35z };
  assign celloutsig_1_11z = { celloutsig_1_6z[6:3], celloutsig_1_7z } >= { in_data[142:139], celloutsig_1_2z };
  assign celloutsig_0_1z = in_data[83:76] >= in_data[14:7];
  assign celloutsig_0_3z = { celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z } <= { in_data[42:31], celloutsig_0_0z };
  assign celloutsig_1_2z = { celloutsig_1_0z[3:1], celloutsig_1_1z } <= celloutsig_1_0z[8:5];
  assign celloutsig_0_23z = in_data[22:20] <= { celloutsig_0_1z, celloutsig_0_15z, celloutsig_0_0z };
  assign celloutsig_1_3z = { in_data[144:134], celloutsig_1_1z } && { in_data[120:110], celloutsig_1_1z };
  assign celloutsig_0_0z = in_data[60:55] || in_data[46:41];
  assign celloutsig_0_8z = { in_data[87:85], celloutsig_0_0z } || celloutsig_0_7z[64:61];
  assign celloutsig_0_14z = { celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_11z } || { in_data[45:29], celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_12z };
  assign celloutsig_0_30z = { celloutsig_0_25z[7:6], celloutsig_0_28z, celloutsig_0_29z, celloutsig_0_20z } || { celloutsig_0_7z[60:58], celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_16z, celloutsig_0_4z, celloutsig_0_23z };
  assign celloutsig_1_5z = in_data[117:115] * { in_data[136], celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_1_6z[9:1] = celloutsig_1_4z ? { celloutsig_1_5z[1:0], celloutsig_1_2z, 1'h1, celloutsig_1_5z, celloutsig_1_1z, 1'h1 } : { celloutsig_1_0z[8:1], celloutsig_1_3z };
  assign celloutsig_0_7z = in_data[37] ? { in_data[92:38], 1'h1, in_data[36:28], celloutsig_0_2z } : { in_data[93:38], 1'h0, in_data[36:35], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_18z = celloutsig_0_4z ? { in_data[23:18], celloutsig_0_12z } : celloutsig_0_9z[10:4];
  assign celloutsig_1_1z = celloutsig_1_0z[8:3] != in_data[166:161];
  assign celloutsig_1_9z = { in_data[114:106], celloutsig_1_5z, celloutsig_1_8z[7:4], celloutsig_1_8z[4], celloutsig_1_8z[2:0] } != in_data[166:147];
  assign celloutsig_1_0z = ~ in_data[172:163];
  assign celloutsig_0_6z = ~ { celloutsig_0_5z[4:2], celloutsig_0_0z };
  assign celloutsig_0_35z = celloutsig_0_12z & celloutsig_0_10z[2];
  assign celloutsig_0_11z = | celloutsig_0_6z[2:0];
  assign celloutsig_0_15z = | { celloutsig_0_13z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_6z[2:0], celloutsig_0_5z[10:4], celloutsig_0_0z };
  assign celloutsig_0_22z = | { celloutsig_0_20z, celloutsig_0_18z, celloutsig_0_5z[12:10] };
  assign celloutsig_0_20z = celloutsig_0_9z[7:5] << { celloutsig_0_9z[4], celloutsig_0_3z, celloutsig_0_16z };
  assign celloutsig_0_33z = celloutsig_0_7z[16:5] >> { celloutsig_0_6z[3:1], celloutsig_0_24z, celloutsig_0_13z, celloutsig_0_18z };
  assign celloutsig_0_34z = { celloutsig_0_25z[14:12], celloutsig_0_0z, celloutsig_0_29z, celloutsig_0_1z } >> { celloutsig_0_33z[11:2], celloutsig_0_24z, celloutsig_0_4z };
  assign celloutsig_0_9z = { in_data[37:30], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_3z } - { in_data[42:34], celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_10z = celloutsig_0_6z[2:0] - celloutsig_0_9z[6:4];
  assign celloutsig_0_21z = celloutsig_0_7z[17:12] - { celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_2z };
  assign celloutsig_0_29z = celloutsig_0_5z[10:4] - { celloutsig_0_7z[3:1], celloutsig_0_24z, celloutsig_0_10z };
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_60z = 3'h0;
    else if (!clkin_data[0]) celloutsig_0_60z = { in_data[38], celloutsig_0_42z, celloutsig_0_30z };
  assign celloutsig_1_7z = ~((celloutsig_1_4z & celloutsig_1_6z[1]) | (celloutsig_1_0z[1] & celloutsig_1_5z[0]));
  assign celloutsig_0_28z = ~((celloutsig_0_22z & celloutsig_0_22z) | (celloutsig_0_1z & celloutsig_0_25z[5]));
  assign { celloutsig_1_8z[2:0], celloutsig_1_8z[4], celloutsig_1_8z[5], celloutsig_1_8z[7:6] } = ~ { celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z[6:5] };
  assign celloutsig_1_6z[0] = celloutsig_1_6z[1];
  assign celloutsig_1_8z[3] = celloutsig_1_8z[4];
  assign { out_data[128], out_data[96], out_data[32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_59z, celloutsig_0_60z };
endmodule
