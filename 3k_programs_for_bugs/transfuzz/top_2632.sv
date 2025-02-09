/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  reg [2:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [15:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [4:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [4:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[81] ? in_data[2] : in_data[66];
  assign celloutsig_0_49z = ~((celloutsig_0_42z | celloutsig_0_33z) & (celloutsig_0_26z | celloutsig_0_21z));
  assign celloutsig_0_7z = ~((celloutsig_0_0z | celloutsig_0_0z) & (in_data[74] | celloutsig_0_0z));
  assign celloutsig_0_13z = ~((celloutsig_0_0z | celloutsig_0_2z) & (in_data[62] | celloutsig_0_3z));
  assign celloutsig_0_22z = ~((celloutsig_0_11z[2] | celloutsig_0_10z) & (celloutsig_0_16z[12] | celloutsig_0_5z));
  assign celloutsig_0_48z = celloutsig_0_24z | ~(celloutsig_0_14z);
  assign celloutsig_0_5z = celloutsig_0_0z | ~(celloutsig_0_1z[2]);
  assign celloutsig_1_7z = celloutsig_1_6z | ~(celloutsig_1_4z);
  assign celloutsig_1_8z = celloutsig_1_3z | ~(celloutsig_1_0z);
  assign celloutsig_0_24z = celloutsig_0_1z[4] | ~(celloutsig_0_17z);
  assign celloutsig_0_32z = celloutsig_0_23z | ~(celloutsig_0_30z);
  assign celloutsig_0_4z = celloutsig_0_3z ^ celloutsig_0_0z;
  assign celloutsig_1_5z = celloutsig_1_1z ^ celloutsig_1_2z[1];
  assign celloutsig_1_14z = celloutsig_1_8z ^ celloutsig_1_13z;
  assign celloutsig_1_18z = celloutsig_1_4z ^ in_data[143];
  assign celloutsig_0_9z = celloutsig_0_4z ^ celloutsig_0_0z;
  assign celloutsig_0_12z = celloutsig_0_6z[0] ^ celloutsig_0_2z;
  assign celloutsig_0_25z = celloutsig_0_4z ^ celloutsig_0_15z;
  assign celloutsig_0_42z = { in_data[1], celloutsig_0_2z, celloutsig_0_29z } === { celloutsig_0_11z[2:1], celloutsig_0_14z };
  assign celloutsig_1_0z = in_data[171:168] === in_data[190:187];
  assign celloutsig_1_15z = { celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_12z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_11z, celloutsig_1_13z } === { celloutsig_1_14z, celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_11z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_14z, celloutsig_1_4z, celloutsig_1_12z };
  assign celloutsig_0_14z = { celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_8z } === celloutsig_0_6z;
  assign celloutsig_0_20z = { celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_4z } === celloutsig_0_6z;
  assign celloutsig_0_29z = { celloutsig_0_20z, celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_13z, celloutsig_0_25z } === { celloutsig_0_6z[3:1], celloutsig_0_24z, celloutsig_0_9z, celloutsig_0_4z };
  assign celloutsig_0_30z = { celloutsig_0_9z, celloutsig_0_25z, celloutsig_0_12z, celloutsig_0_7z } >= { celloutsig_0_16z[6:5], celloutsig_0_25z, celloutsig_0_3z };
  assign celloutsig_1_1z = in_data[141:131] && { in_data[178:169], celloutsig_1_0z };
  assign celloutsig_1_6z = { celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_1z } && in_data[182:172];
  assign celloutsig_1_9z = { in_data[172], celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_6z } && { celloutsig_1_2z[1:0], celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_1_10z = { celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_1z } && { celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_8z = ! { celloutsig_0_6z[4:2], celloutsig_0_3z };
  assign celloutsig_0_17z = ! { celloutsig_0_16z[1:0], celloutsig_0_15z, celloutsig_0_0z };
  assign celloutsig_0_26z = ! { in_data[82:80], celloutsig_0_22z, celloutsig_0_25z, celloutsig_0_22z, celloutsig_0_18z, celloutsig_0_21z, celloutsig_0_21z, celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_24z, celloutsig_0_24z };
  assign celloutsig_0_2z = ! in_data[36:23];
  assign celloutsig_0_3z = { celloutsig_0_1z[4:1], 1'h0 } !== { in_data[23:20], celloutsig_0_2z };
  assign celloutsig_1_3z = in_data[150:103] !== { in_data[165:121], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_19z = { in_data[161], celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_16z, celloutsig_1_15z, celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_12z, celloutsig_1_4z, celloutsig_1_16z } !== { celloutsig_1_14z, celloutsig_1_6z, celloutsig_1_16z, celloutsig_1_15z, celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_14z, celloutsig_1_14z, celloutsig_1_10z, celloutsig_1_15z, celloutsig_1_9z, celloutsig_1_15z, celloutsig_1_8z, celloutsig_1_13z, celloutsig_1_18z, celloutsig_1_5z };
  assign celloutsig_0_15z = celloutsig_0_1z[3:1] !== { 1'h0, celloutsig_0_8z, celloutsig_0_13z };
  assign celloutsig_1_4z = & { celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_11z = & { celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_12z = & { celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_13z = & { celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_16z = & { celloutsig_1_15z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_0z, in_data[139:121] };
  assign celloutsig_0_10z = & in_data[63:46];
  assign celloutsig_0_23z = | celloutsig_0_1z[2:1];
  assign celloutsig_0_33z = | { celloutsig_0_25z, celloutsig_0_24z, celloutsig_0_21z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_29z, celloutsig_0_32z, celloutsig_0_13z, celloutsig_0_20z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_24z };
  assign celloutsig_0_18z = | { celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_1z[4:1], in_data[50:46], celloutsig_0_0z };
  assign celloutsig_0_21z = | { celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_7z };
  assign celloutsig_1_2z = { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } <<< { in_data[136], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_6z = { celloutsig_0_1z[1], 1'h0, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_2z } <<< { celloutsig_0_1z[1], 1'h0, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_5z };
  assign celloutsig_0_16z = { celloutsig_0_7z, celloutsig_0_14z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z[4:1], 1'h0, celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_13z } <<< { in_data[17:8], celloutsig_0_15z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_13z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_11z = 3'h0;
    else if (clkin_data[0]) celloutsig_0_11z = in_data[87:85];
  assign celloutsig_0_1z[4:1] = { in_data[39:37], celloutsig_0_0z } ^ in_data[46:43];
  assign celloutsig_0_1z[0] = 1'h0;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_48z, celloutsig_0_49z };
endmodule
