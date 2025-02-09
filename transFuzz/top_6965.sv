/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [31:0] celloutsig_0_10z;
  wire [12:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [4:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  reg [7:0] celloutsig_0_18z;
  reg [16:0] celloutsig_0_19z;
  reg [7:0] celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [9:0] celloutsig_0_22z;
  wire [11:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire [3:0] celloutsig_0_2z;
  reg [3:0] celloutsig_0_31z;
  wire [30:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_39z;
  reg [15:0] celloutsig_0_3z;
  wire [19:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [6:0] celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_52z;
  wire celloutsig_0_56z;
  wire celloutsig_0_57z;
  wire celloutsig_0_5z;
  wire [7:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [2:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  reg [12:0] celloutsig_1_2z;
  wire [12:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_0z = in_data[146] ? in_data[141] : in_data[166];
  assign celloutsig_1_5z = celloutsig_1_3z[7] ? celloutsig_1_3z[9] : celloutsig_1_1z;
  assign celloutsig_0_39z = !(celloutsig_0_23z[2] ? celloutsig_0_11z[3] : celloutsig_0_9z[2]);
  assign celloutsig_0_45z = !(celloutsig_0_13z ? celloutsig_0_35z : celloutsig_0_24z);
  assign celloutsig_0_5z = !(celloutsig_0_3z[1] ? celloutsig_0_2z[2] : in_data[53]);
  assign celloutsig_0_34z = ~(celloutsig_0_3z[4] | celloutsig_0_11z[12]);
  assign celloutsig_0_4z = ~(celloutsig_0_3z[2] | celloutsig_0_2z[2]);
  assign celloutsig_0_27z = ~(celloutsig_0_24z | celloutsig_0_10z[5]);
  assign celloutsig_1_14z = ~celloutsig_1_10z;
  assign celloutsig_0_47z = ~((celloutsig_0_42z | celloutsig_0_10z[29]) & celloutsig_0_1z[6]);
  assign celloutsig_1_4z = ~((in_data[189] | celloutsig_1_1z) & celloutsig_1_1z);
  assign celloutsig_1_8z = ~((celloutsig_1_7z | celloutsig_1_6z) & celloutsig_1_1z);
  assign celloutsig_1_18z = ~((celloutsig_1_8z | celloutsig_1_5z) & celloutsig_1_1z);
  assign celloutsig_1_19z = ~((celloutsig_1_14z | celloutsig_1_8z) & in_data[176]);
  assign celloutsig_0_13z = ~((celloutsig_0_0z | celloutsig_0_2z[1]) & celloutsig_0_11z[2]);
  assign celloutsig_0_17z = ~((celloutsig_0_9z[0] | celloutsig_0_10z[18]) & celloutsig_0_15z);
  assign celloutsig_0_14z = ~(celloutsig_0_3z[9] ^ celloutsig_0_3z[2]);
  assign celloutsig_0_9z = celloutsig_0_2z[3:1] + { celloutsig_0_3z[2:1], celloutsig_0_7z };
  assign celloutsig_0_16z = { celloutsig_0_1z[2], celloutsig_0_14z, celloutsig_0_9z } + in_data[31:27];
  assign celloutsig_0_10z = { in_data[58:39], celloutsig_0_2z, celloutsig_0_1z } & in_data[47:16];
  assign celloutsig_0_7z = celloutsig_0_2z[2:0] >= in_data[88:86];
  assign celloutsig_0_46z = { celloutsig_0_40z[4], celloutsig_0_4z, celloutsig_0_35z, celloutsig_0_26z, celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_14z, celloutsig_0_15z } <= { celloutsig_0_11z[9:3], celloutsig_0_41z };
  assign celloutsig_0_57z = { celloutsig_0_9z[1], celloutsig_0_5z, celloutsig_0_26z, celloutsig_0_14z, celloutsig_0_47z, celloutsig_0_52z, celloutsig_0_0z } <= { in_data[60:55], celloutsig_0_34z };
  assign celloutsig_0_15z = { celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_5z } <= in_data[20:17];
  assign celloutsig_0_21z = { celloutsig_0_16z[2:1], celloutsig_0_17z, celloutsig_0_15z, celloutsig_0_12z } <= celloutsig_0_18z[6:2];
  assign celloutsig_1_6z = in_data[137:133] || in_data[148:144];
  assign celloutsig_0_12z = { celloutsig_0_6z[5:3], celloutsig_0_5z } || celloutsig_0_3z[11:8];
  assign celloutsig_0_56z = { celloutsig_0_19z[16], celloutsig_0_34z, celloutsig_0_24z, celloutsig_0_29z, celloutsig_0_0z } < in_data[14:10];
  assign celloutsig_0_24z = celloutsig_0_1z[3] & ~(celloutsig_0_0z);
  assign celloutsig_0_33z = { celloutsig_0_19z, celloutsig_0_16z, celloutsig_0_24z, celloutsig_0_12z, celloutsig_0_20z, celloutsig_0_24z } * { celloutsig_0_10z[20:3], celloutsig_0_5z, celloutsig_0_23z };
  assign celloutsig_0_44z = - { celloutsig_0_23z[3], celloutsig_0_39z, celloutsig_0_17z, celloutsig_0_26z, celloutsig_0_9z };
  assign celloutsig_1_3z = - celloutsig_1_2z;
  assign celloutsig_0_11z = - { in_data[70:59], celloutsig_0_5z };
  assign celloutsig_0_23z = ~ { celloutsig_0_19z[9:6], celloutsig_0_1z };
  assign celloutsig_0_20z = { celloutsig_0_6z[6:2], celloutsig_0_15z } | celloutsig_0_6z[6:1];
  assign celloutsig_1_1z = & { celloutsig_1_0z, in_data[162] };
  assign celloutsig_0_0z = | in_data[57:49];
  assign celloutsig_0_48z = | { celloutsig_0_3z[12:10], celloutsig_0_46z, celloutsig_0_39z, celloutsig_0_27z };
  assign celloutsig_0_52z = | { celloutsig_0_10z[21:2], celloutsig_0_7z, celloutsig_0_48z, celloutsig_0_31z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_44z, celloutsig_0_45z, celloutsig_0_42z };
  assign celloutsig_0_29z = | { celloutsig_0_20z[3:1], celloutsig_0_26z, celloutsig_0_21z, celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_22z };
  assign celloutsig_0_26z = celloutsig_0_20z[3] & celloutsig_0_10z[13];
  assign celloutsig_0_35z = ^ { celloutsig_0_3z[5:2], celloutsig_0_9z };
  assign celloutsig_0_41z = ^ celloutsig_0_33z[16:14];
  assign celloutsig_0_42z = ^ celloutsig_0_40z[16:0];
  assign celloutsig_1_7z = ^ { in_data[173:171], celloutsig_1_4z };
  assign celloutsig_1_10z = ^ { celloutsig_1_3z[9:8], celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_0z };
  assign celloutsig_0_40z = { celloutsig_0_22z[9:3], celloutsig_0_11z } >> { celloutsig_0_18z[7], celloutsig_0_22z, celloutsig_0_17z, celloutsig_0_1z };
  assign celloutsig_0_2z = { celloutsig_0_1z[3:2], celloutsig_0_0z, celloutsig_0_0z } >> in_data[81:78];
  assign celloutsig_0_22z = { celloutsig_0_2z, celloutsig_0_20z } >> { celloutsig_0_10z[30:23], celloutsig_0_7z, celloutsig_0_0z };
  assign celloutsig_0_6z = in_data[95:88] - { celloutsig_0_1z[6:1], celloutsig_0_5z, celloutsig_0_5z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_3z = 16'h0000;
    else if (celloutsig_1_18z) celloutsig_0_3z = { in_data[63:53], celloutsig_0_2z, celloutsig_0_0z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_2z = 13'h0000;
    else if (!clkin_data[0]) celloutsig_1_2z = in_data[179:167];
  always_latch
    if (clkin_data[32]) celloutsig_0_1z = 8'h00;
    else if (celloutsig_1_18z) celloutsig_0_1z = { in_data[51:45], celloutsig_0_0z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_18z = 8'h00;
    else if (!celloutsig_1_18z) celloutsig_0_18z = celloutsig_0_10z[14:7];
  always_latch
    if (!clkin_data[32]) celloutsig_0_19z = 17'h00000;
    else if (!celloutsig_1_18z) celloutsig_0_19z = { celloutsig_0_3z[14:1], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_15z };
  always_latch
    if (clkin_data[32]) celloutsig_0_31z = 4'h0;
    else if (celloutsig_1_18z) celloutsig_0_31z = { celloutsig_0_23z[2:1], celloutsig_0_29z, celloutsig_0_0z };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_56z, celloutsig_0_57z };
endmodule
