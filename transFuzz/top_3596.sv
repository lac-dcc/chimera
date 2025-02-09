/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [11:0] celloutsig_0_11z;
  wire [9:0] celloutsig_0_12z;
  wire [16:0] celloutsig_0_14z;
  wire [15:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [7:0] celloutsig_0_17z;
  wire [2:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire [11:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  reg [22:0] celloutsig_0_22z;
  wire [4:0] celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [13:0] celloutsig_0_27z;
  wire [16:0] celloutsig_0_28z;
  reg [13:0] celloutsig_0_29z;
  wire [2:0] celloutsig_0_30z;
  wire [6:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [2:0] celloutsig_0_36z;
  wire celloutsig_0_39z;
  wire [4:0] celloutsig_0_3z;
  wire celloutsig_0_41z;
  reg [18:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire [3:0] celloutsig_0_46z;
  wire celloutsig_0_49z;
  wire [6:0] celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire [6:0] celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire [3:0] celloutsig_0_57z;
  wire [3:0] celloutsig_0_58z;
  wire [11:0] celloutsig_0_59z;
  reg [17:0] celloutsig_0_5z;
  reg [2:0] celloutsig_0_6z;
  wire celloutsig_0_71z;
  wire [6:0] celloutsig_0_75z;
  reg [3:0] celloutsig_0_76z;
  wire [19:0] celloutsig_0_7z;
  reg [18:0] celloutsig_0_8z;
  wire [2:0] celloutsig_0_9z;
  wire [6:0] celloutsig_1_0z;
  wire [5:0] celloutsig_1_11z;
  wire [22:0] celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire [4:0] celloutsig_1_19z;
  wire [6:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [7:0] celloutsig_1_4z;
  wire [20:0] celloutsig_1_5z;
  wire [4:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_51z = ~(1'h1 & celloutsig_0_4z[4]);
  assign celloutsig_1_2z = ~(celloutsig_1_0z[4] & celloutsig_1_1z[4]);
  assign celloutsig_1_9z = !(celloutsig_1_2z ? celloutsig_1_4z[3] : in_data[178]);
  assign celloutsig_0_21z = !(celloutsig_0_8z[1] ? celloutsig_0_3z[1] : celloutsig_0_16z);
  assign celloutsig_0_0z = ~in_data[19];
  assign celloutsig_0_35z = ~celloutsig_0_28z[11];
  assign celloutsig_0_39z = ~celloutsig_0_34z;
  assign celloutsig_0_41z = ~celloutsig_0_22z[16];
  assign celloutsig_0_52z = ~((celloutsig_0_17z[0] | celloutsig_0_1z) & celloutsig_0_16z);
  assign celloutsig_0_56z = ~((celloutsig_0_43z | celloutsig_0_42z[7]) & celloutsig_0_53z);
  assign celloutsig_0_71z = ~((celloutsig_0_55z[0] | celloutsig_0_4z[5]) & celloutsig_0_15z[15]);
  assign celloutsig_0_32z = celloutsig_0_1z | ~(celloutsig_0_20z[5]);
  assign celloutsig_0_34z = celloutsig_0_30z[1] | ~(celloutsig_0_29z[3]);
  assign celloutsig_0_49z = celloutsig_0_6z[2] | ~(celloutsig_0_29z[10]);
  assign celloutsig_1_3z = celloutsig_1_2z | ~(celloutsig_1_1z[0]);
  assign celloutsig_1_14z = celloutsig_1_1z[2] | ~(celloutsig_1_8z[4]);
  assign celloutsig_0_53z = celloutsig_0_22z[20] | celloutsig_0_46z[0];
  assign celloutsig_0_10z = in_data[66] | celloutsig_0_1z;
  assign celloutsig_0_16z = celloutsig_0_8z[10] | celloutsig_0_8z[6];
  assign celloutsig_0_25z = celloutsig_0_22z[10] | celloutsig_0_17z[4];
  assign celloutsig_0_43z = ~(celloutsig_0_18z[2] ^ celloutsig_0_23z[2]);
  assign celloutsig_1_8z = celloutsig_1_5z[16:12] + { celloutsig_1_0z[4:3], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_3z };
  assign celloutsig_0_46z = { celloutsig_0_34z, celloutsig_0_9z } / { 1'h1, celloutsig_0_9z[2:1], in_data[0] };
  assign celloutsig_0_57z = { celloutsig_0_17z[3:1], celloutsig_0_56z } / { 1'h1, celloutsig_0_22z[4:2] };
  assign celloutsig_1_0z = in_data[104:98] / { 1'h1, in_data[161:156] };
  assign celloutsig_0_17z = { in_data[87], celloutsig_0_4z } / { 1'h1, celloutsig_0_12z[6:0] };
  assign celloutsig_0_30z = celloutsig_0_29z[10:8] / { 1'h1, celloutsig_0_3z[1], celloutsig_0_25z };
  assign celloutsig_0_75z = celloutsig_0_59z[6:0] / { 1'h1, celloutsig_0_58z[2:0], celloutsig_0_41z, celloutsig_0_71z, celloutsig_0_26z };
  assign celloutsig_1_18z = celloutsig_1_12z[9:0] >= { celloutsig_1_4z[3:0], celloutsig_1_11z };
  assign celloutsig_0_1z = celloutsig_0_0z & ~(in_data[23]);
  assign celloutsig_0_20z = { celloutsig_0_5z[5:3], celloutsig_0_17z, celloutsig_0_10z } % { 1'h1, celloutsig_0_14z[4:2], 1'h1, celloutsig_0_4z };
  assign celloutsig_0_59z = { celloutsig_0_14z[0], celloutsig_0_57z, celloutsig_0_9z, celloutsig_0_36z, celloutsig_0_49z } % { 1'h1, celloutsig_0_20z[10:5], celloutsig_0_39z, celloutsig_0_10z, celloutsig_0_52z, celloutsig_0_43z, celloutsig_0_25z };
  assign celloutsig_0_55z = { celloutsig_0_27z[12:10], celloutsig_0_30z, celloutsig_0_26z } * { celloutsig_0_31z[6:1], celloutsig_0_53z };
  assign celloutsig_1_1z = celloutsig_1_0z * celloutsig_1_0z;
  assign celloutsig_1_12z = { celloutsig_1_8z[4:3], celloutsig_1_5z } * { in_data[149:136], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_9z };
  assign celloutsig_0_11z = { celloutsig_0_8z[10:5], celloutsig_0_1z, celloutsig_0_3z[4:1], celloutsig_0_1z } * { celloutsig_0_4z[4], celloutsig_0_6z, celloutsig_0_3z[4:1], celloutsig_0_1z, celloutsig_0_9z };
  assign celloutsig_0_12z = celloutsig_0_8z[15:6] * { celloutsig_0_5z[15:7], celloutsig_0_0z };
  assign celloutsig_0_14z = celloutsig_0_5z[16:0] * { celloutsig_0_9z[1:0], celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_0_18z = { celloutsig_0_6z[2:1], celloutsig_0_0z } * celloutsig_0_8z[17:15];
  assign celloutsig_0_3z[4:1] = in_data[42] ? { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z } : in_data[63:60];
  assign celloutsig_0_31z = - { celloutsig_0_4z[5:0], celloutsig_0_1z };
  assign celloutsig_0_58z = - { celloutsig_0_17z[3:2], 1'h1, celloutsig_0_51z };
  assign celloutsig_0_9z = - celloutsig_0_4z[5:3];
  assign celloutsig_1_19z = ~ { celloutsig_1_1z[4:1], celloutsig_1_14z };
  assign celloutsig_0_7z = { in_data[23:12], celloutsig_0_3z[4:1], celloutsig_0_1z, celloutsig_0_6z } << { celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_1_4z = in_data[147:140] << { celloutsig_1_1z[0], celloutsig_1_1z };
  assign celloutsig_1_11z = celloutsig_1_1z[5:0] << { celloutsig_1_5z[16:12], celloutsig_1_3z };
  assign celloutsig_0_23z = celloutsig_0_11z[8:4] >> in_data[85:81];
  assign celloutsig_0_36z = celloutsig_0_8z[12:10] - { celloutsig_0_29z[2], celloutsig_0_35z, celloutsig_0_32z };
  assign celloutsig_1_5z = in_data[117:97] - { celloutsig_1_4z[5:1], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_0_27z = celloutsig_0_7z[15:2] - { celloutsig_0_20z, celloutsig_0_25z, celloutsig_0_26z };
  assign celloutsig_0_4z = in_data[10:4] ^ { celloutsig_0_3z[2:1], celloutsig_0_3z[4:1], celloutsig_0_1z };
  assign celloutsig_0_15z = celloutsig_0_7z[15:0] ^ celloutsig_0_14z[16:1];
  assign celloutsig_0_28z = { celloutsig_0_17z[4:1], celloutsig_0_3z[4:1], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_4z } ^ { celloutsig_0_7z[17:16], celloutsig_0_27z, celloutsig_0_10z };
  assign celloutsig_0_26z = ~((celloutsig_0_1z & celloutsig_0_8z[2]) | celloutsig_0_0z);
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_42z = 19'h00000;
    else if (clkin_data[0]) celloutsig_0_42z = { celloutsig_0_20z[11:2], celloutsig_0_32z, celloutsig_0_31z, celloutsig_0_39z };
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_5z = 18'h00000;
    else if (!clkin_data[32]) celloutsig_0_5z = { in_data[83:77], celloutsig_0_3z[4:1], celloutsig_0_1z, celloutsig_0_3z[4:1], celloutsig_0_1z, celloutsig_0_0z };
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_6z = 3'h0;
    else if (clkin_data[32]) celloutsig_0_6z = in_data[19:17];
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_76z = 4'h0;
    else if (clkin_data[32]) celloutsig_0_76z = celloutsig_0_22z[16:13];
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_8z = 19'h00000;
    else if (clkin_data[0]) celloutsig_0_8z = { celloutsig_0_7z[17:7], celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_6z };
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_22z = 23'h000000;
    else if (!clkin_data[32]) celloutsig_0_22z = { celloutsig_0_7z[19:15], celloutsig_0_14z, celloutsig_0_10z };
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_29z = 14'h0000;
    else if (clkin_data[32]) celloutsig_0_29z = { celloutsig_0_17z[7:1], celloutsig_0_21z, celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_26z, celloutsig_0_0z };
  assign celloutsig_0_3z[0] = celloutsig_0_1z;
  assign { out_data[128], out_data[100:96], out_data[38:32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_75z, celloutsig_0_76z };
endmodule
