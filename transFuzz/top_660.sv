/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [10:0] celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire [11:0] celloutsig_0_13z;
  wire [6:0] celloutsig_0_14z;
  wire [22:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [7:0] celloutsig_0_17z;
  wire [4:0] celloutsig_0_18z;
  wire [8:0] celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire [20:0] celloutsig_0_20z;
  wire [7:0] celloutsig_0_21z;
  wire [12:0] celloutsig_0_23z;
  wire [2:0] celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire [15:0] celloutsig_0_2z;
  wire [13:0] celloutsig_0_31z;
  wire celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire [3:0] celloutsig_0_4z;
  wire celloutsig_0_57z;
  wire [3:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  reg [3:0] celloutsig_0_60z;
  wire celloutsig_0_6z;
  wire [2:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  reg [2:0] celloutsig_0_9z;
  wire [7:0] celloutsig_1_0z;
  wire celloutsig_1_12z;
  wire [4:0] celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire [3:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [8:0] celloutsig_1_6z;
  wire [7:0] celloutsig_1_7z;
  wire [38:0] celloutsig_1_8z;
  wire [3:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[66:63] / { 1'h1, in_data[59:57] };
  assign celloutsig_1_2z = celloutsig_1_0z[5:1] / { 1'h1, celloutsig_1_0z[5:2] };
  assign celloutsig_1_8z = { in_data[144:111], celloutsig_1_2z } / { 1'h1, in_data[159:145], celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_7z };
  assign celloutsig_0_7z = { celloutsig_0_2z[10], celloutsig_0_6z, celloutsig_0_5z } / { 1'h1, celloutsig_0_1z[0], celloutsig_0_6z };
  assign celloutsig_0_13z = celloutsig_0_2z[15:4] / { 1'h1, celloutsig_0_11z[2:0], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_7z };
  assign celloutsig_0_18z = { celloutsig_0_17z[4:1], celloutsig_0_3z } / { 1'h1, in_data[12:10], celloutsig_0_16z };
  assign celloutsig_0_19z = { in_data[91:86], celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_8z } / { 1'h1, in_data[70:68], celloutsig_0_18z };
  assign celloutsig_0_2z = { in_data[13:1], celloutsig_0_1z } / { 1'h1, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_42z = { celloutsig_0_14z[6:1], celloutsig_0_13z, celloutsig_0_16z, celloutsig_0_29z } && { celloutsig_0_31z[13:5], celloutsig_0_11z };
  assign celloutsig_0_5z = { celloutsig_0_4z, celloutsig_0_3z } && in_data[64:60];
  assign celloutsig_0_57z = celloutsig_0_15z[13:0] && celloutsig_0_2z[13:0];
  assign celloutsig_0_6z = celloutsig_0_0z && { celloutsig_0_2z[12:10], celloutsig_0_5z };
  assign celloutsig_1_3z = celloutsig_1_0z[7:3] && celloutsig_1_2z;
  assign celloutsig_1_5z = { celloutsig_1_2z[0], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_4z } && celloutsig_1_0z[6:1];
  assign celloutsig_1_12z = in_data[122:120] && celloutsig_1_2z[3:1];
  assign celloutsig_1_18z = { celloutsig_1_6z[7:3], celloutsig_1_12z } && { celloutsig_1_14z[4:3], celloutsig_1_9z };
  assign celloutsig_0_8z = in_data[32:19] && in_data[21:8];
  assign celloutsig_1_4z = celloutsig_1_0z[4:2] * { celloutsig_1_2z[0], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_12z = celloutsig_0_2z[7:4] * celloutsig_0_4z;
  assign celloutsig_0_14z = celloutsig_0_11z[9:3] * { celloutsig_0_2z[13:8], celloutsig_0_5z };
  assign celloutsig_0_59z = celloutsig_0_57z ? { celloutsig_0_27z[1:0], celloutsig_0_5z, celloutsig_0_42z } : celloutsig_0_19z[3:0];
  assign celloutsig_1_6z = celloutsig_1_2z[1] ? { celloutsig_1_0z[7:2], celloutsig_1_4z } : { in_data[99:96], celloutsig_1_2z[4:2], 1'h0, celloutsig_1_2z[0] };
  assign celloutsig_1_14z = celloutsig_1_12z ? celloutsig_1_2z : { celloutsig_1_8z[9:7], celloutsig_1_5z, 1'h0 };
  assign celloutsig_0_11z = celloutsig_0_0z[3] ? { celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_8z } : { in_data[31:26], celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_20z = celloutsig_0_18z[2] ? { celloutsig_0_2z[13:1], celloutsig_0_18z[4:3], 1'h1, celloutsig_0_18z[1:0], celloutsig_0_9z } : { celloutsig_0_19z[7:0], celloutsig_0_16z, celloutsig_0_13z };
  assign celloutsig_0_31z = celloutsig_0_9z[1] ? in_data[81:68] : { in_data[65:61], celloutsig_0_21z, celloutsig_0_10z };
  assign celloutsig_1_7z = - { celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_1_9z = - { celloutsig_1_7z[4:2], celloutsig_1_3z };
  assign celloutsig_1_19z = - { in_data[146:144], celloutsig_1_1z };
  assign celloutsig_0_15z = - { in_data[50:48], celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_10z };
  assign celloutsig_0_17z = - celloutsig_0_15z[17:10];
  assign celloutsig_0_21z = - celloutsig_0_20z[10:3];
  assign celloutsig_0_23z = - { in_data[81:72], celloutsig_0_9z };
  assign celloutsig_0_3z = & in_data[29:26];
  assign celloutsig_1_1z = & celloutsig_1_0z;
  assign celloutsig_0_10z = & celloutsig_0_4z[2:0];
  assign celloutsig_0_16z = & { celloutsig_0_2z[9:7], in_data[29:26] };
  assign celloutsig_0_29z = & celloutsig_0_0z[2:0];
  assign celloutsig_0_4z = celloutsig_0_2z[9:6] << celloutsig_0_0z;
  assign celloutsig_1_0z = in_data[112:105] << in_data[115:108];
  assign celloutsig_0_1z = celloutsig_0_0z[2:0] << in_data[43:41];
  assign celloutsig_0_27z = celloutsig_0_4z[2:0] << celloutsig_0_20z[11:9];
  always_latch
    if (clkin_data[0]) celloutsig_0_60z = 4'h0;
    else if (!celloutsig_1_18z) celloutsig_0_60z = { celloutsig_0_23z[12:10], celloutsig_0_42z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_9z = 3'h0;
    else if (celloutsig_1_18z) celloutsig_0_9z = { in_data[83], celloutsig_0_8z, celloutsig_0_8z };
  assign { out_data[128], out_data[99:96], out_data[35:32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_59z, celloutsig_0_60z };
endmodule
