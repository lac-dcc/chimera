/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  reg [5:0] celloutsig_0_12z;
  wire [4:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire [2:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [19:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  reg [2:0] celloutsig_0_20z;
  reg [13:0] celloutsig_0_21z;
  reg [7:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [16:0] celloutsig_0_27z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [11:0] celloutsig_0_32z;
  wire [5:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [5:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire [14:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [10:0] celloutsig_0_9z;
  reg [8:0] celloutsig_1_0z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  reg [14:0] celloutsig_1_19z;
  wire [7:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [19:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [4:0] celloutsig_1_7z;
  wire [11:0] celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_39z = celloutsig_0_22z[5] ? celloutsig_0_20z[2] : celloutsig_0_32z[9];
  assign celloutsig_1_2z = celloutsig_1_0z[7] ? in_data[115] : celloutsig_1_0z[1];
  assign celloutsig_0_24z = celloutsig_0_14z[2] ? celloutsig_0_19z : celloutsig_0_6z;
  assign celloutsig_1_17z = ~celloutsig_1_9z[0];
  assign celloutsig_0_23z = ~celloutsig_0_17z;
  assign celloutsig_0_0z = ~((in_data[3] | in_data[56]) & in_data[72]);
  assign celloutsig_0_7z = ~((celloutsig_0_4z | celloutsig_0_2z) & celloutsig_0_1z);
  assign celloutsig_0_1z = ~((in_data[8] | celloutsig_0_0z) & celloutsig_0_0z);
  assign celloutsig_0_19z = ~((celloutsig_0_0z | celloutsig_0_5z[6]) & celloutsig_0_10z);
  assign celloutsig_0_30z = ~((celloutsig_0_12z[5] | celloutsig_0_27z[6]) & celloutsig_0_1z);
  assign celloutsig_1_1z = celloutsig_1_0z[7:0] & celloutsig_1_0z[7:0];
  assign celloutsig_0_9z = { celloutsig_0_3z[5:1], celloutsig_0_3z } & { celloutsig_0_5z[13:5], celloutsig_0_2z, celloutsig_0_6z };
  assign celloutsig_1_4z = { in_data[108:98], celloutsig_1_1z, celloutsig_1_3z } / { 1'h1, celloutsig_1_1z[5:4], celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_6z = { celloutsig_0_3z[5:4], celloutsig_0_1z } === celloutsig_0_5z[10:8];
  assign celloutsig_0_10z = celloutsig_0_9z[10:3] === { celloutsig_0_9z[5:0], celloutsig_0_4z, celloutsig_0_8z };
  assign celloutsig_0_53z = celloutsig_0_18z[15:2] > { celloutsig_0_3z, celloutsig_0_38z, celloutsig_0_24z, celloutsig_0_2z };
  assign celloutsig_0_54z = { celloutsig_0_27z[10:5], celloutsig_0_8z } > { celloutsig_0_27z[4:0], celloutsig_0_16z, celloutsig_0_39z };
  assign celloutsig_1_3z = in_data[145:132] > in_data[141:128];
  assign celloutsig_1_5z = { in_data[144:138], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z } > in_data[189:180];
  assign celloutsig_1_18z = { in_data[136], celloutsig_1_17z, celloutsig_1_5z } > celloutsig_1_7z[3:1];
  assign celloutsig_0_11z = celloutsig_0_5z[11:0] > in_data[11:0];
  assign celloutsig_0_16z = { celloutsig_0_5z[13], celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_2z } > { celloutsig_0_13z[2:1], celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_0z };
  assign celloutsig_0_17z = celloutsig_0_12z[3:1] > { celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_8z };
  assign celloutsig_0_2z = in_data[65:61] > { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_38z = { celloutsig_0_12z[4:0], celloutsig_0_17z } % { 1'h1, celloutsig_0_5z[5:3], celloutsig_0_25z, celloutsig_0_19z };
  assign celloutsig_0_14z = celloutsig_0_13z[2:0] % { 1'h1, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_15z = { celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_6z } % { 1'h1, celloutsig_0_13z[2], in_data[0] };
  assign celloutsig_0_32z = { celloutsig_0_27z[2:1], celloutsig_0_3z, celloutsig_0_20z, celloutsig_0_8z } * { celloutsig_0_20z[2:1], celloutsig_0_16z, celloutsig_0_30z, celloutsig_0_22z };
  assign celloutsig_0_3z = { celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z } * in_data[42:37];
  assign celloutsig_0_5z = { in_data[20:16], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_4z } * { in_data[24:22], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_1_8z = { celloutsig_1_1z[2:0], celloutsig_1_1z, celloutsig_1_3z } * { celloutsig_1_1z[7:1], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_0_27z = { celloutsig_0_21z[13:3], celloutsig_0_3z } * { celloutsig_0_21z[6:3], celloutsig_0_12z, celloutsig_0_23z, celloutsig_0_12z };
  assign celloutsig_1_7z = in_data[191:187] | celloutsig_1_1z[5:1];
  assign celloutsig_0_18z = { celloutsig_0_5z[14:2], celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_0z } | { celloutsig_0_3z[5:4], celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_12z };
  assign celloutsig_1_6z = | celloutsig_1_0z[6:2];
  assign celloutsig_0_25z = | celloutsig_0_9z[6:0];
  assign celloutsig_0_4z = | { celloutsig_0_3z[4:3], celloutsig_0_1z };
  assign celloutsig_0_8z = | { celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_13z = { celloutsig_0_9z[3], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_4z } << { celloutsig_0_12z[4:1], celloutsig_0_10z };
  assign celloutsig_1_9z = { celloutsig_1_4z[2], celloutsig_1_2z, celloutsig_1_2z } >>> celloutsig_1_0z[4:2];
  always_latch
    if (!clkin_data[64]) celloutsig_1_0z = 9'h000;
    else if (clkin_data[0]) celloutsig_1_0z = in_data[143:135];
  always_latch
    if (!clkin_data[64]) celloutsig_1_19z = 15'h0000;
    else if (clkin_data[0]) celloutsig_1_19z = { celloutsig_1_8z, celloutsig_1_9z };
  always_latch
    if (clkin_data[32]) celloutsig_0_12z = 6'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_12z = { celloutsig_0_3z[4:1], celloutsig_0_0z, celloutsig_0_0z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_20z = 3'h0;
    else if (celloutsig_1_19z[0]) celloutsig_0_20z = celloutsig_0_15z;
  always_latch
    if (clkin_data[32]) celloutsig_0_21z = 14'h0000;
    else if (celloutsig_1_19z[0]) celloutsig_0_21z = celloutsig_0_5z[14:1];
  always_latch
    if (!clkin_data[32]) celloutsig_0_22z = 8'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_22z = celloutsig_0_21z[11:4];
  assign { out_data[128], out_data[110:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_53z, celloutsig_0_54z };
endmodule
