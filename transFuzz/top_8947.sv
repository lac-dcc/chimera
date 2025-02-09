/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [8:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [27:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [12:0] celloutsig_0_17z;
  wire [13:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  reg [17:0] celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  reg [3:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [3:0] celloutsig_0_32z;
  wire [3:0] celloutsig_0_34z;
  wire [3:0] celloutsig_0_36z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  reg [4:0] celloutsig_0_43z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_53z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  reg [10:0] celloutsig_1_1z;
  wire [11:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [8:0] celloutsig_1_8z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_41z = celloutsig_0_28z[3] ? celloutsig_0_32z[3] : celloutsig_0_32z[1];
  assign celloutsig_0_2z = !(celloutsig_0_1z ? celloutsig_0_0z[2] : celloutsig_0_0z[2]);
  assign celloutsig_0_10z = ~celloutsig_0_0z[7];
  assign celloutsig_0_16z = celloutsig_0_7z | ~(celloutsig_0_1z);
  assign celloutsig_0_3z = in_data[44] | celloutsig_0_0z[0];
  assign celloutsig_0_48z = celloutsig_0_7z | celloutsig_0_16z;
  assign celloutsig_1_4z = celloutsig_1_1z[5] | celloutsig_1_0z;
  assign celloutsig_1_6z = celloutsig_1_0z | celloutsig_1_4z;
  assign celloutsig_1_7z = celloutsig_1_5z[0] | celloutsig_1_3z;
  assign celloutsig_0_12z = celloutsig_0_10z | in_data[90];
  assign celloutsig_0_19z = celloutsig_0_5z[1] | celloutsig_0_5z[4];
  assign celloutsig_0_4z = ~(in_data[41] ^ celloutsig_0_0z[1]);
  assign celloutsig_1_0z = ~(in_data[185] ^ in_data[169]);
  assign celloutsig_1_3z = ~(celloutsig_1_2z[5] ^ celloutsig_1_2z[2]);
  assign celloutsig_0_24z = ~(celloutsig_0_0z[6] ^ celloutsig_0_8z);
  assign celloutsig_0_25z = ~(celloutsig_0_4z ^ celloutsig_0_5z[3]);
  assign celloutsig_0_50z = { celloutsig_0_18z[10:9], celloutsig_0_36z } == { celloutsig_0_2z, celloutsig_0_31z, celloutsig_0_48z, celloutsig_0_10z, celloutsig_0_47z, celloutsig_0_24z };
  assign celloutsig_0_8z = { celloutsig_0_0z[7:0], celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_5z } == { in_data[19:17], celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_0_6z = { in_data[64:63], celloutsig_0_2z, celloutsig_0_4z } === { celloutsig_0_5z[4:2], celloutsig_0_2z };
  assign celloutsig_1_13z = { celloutsig_1_1z[5:2], celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_5z } === { in_data[158:150], celloutsig_1_5z, celloutsig_1_7z };
  assign celloutsig_0_14z = { celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_6z } >= { in_data[81:69], celloutsig_0_13z };
  assign celloutsig_0_47z = { celloutsig_0_17z[10:5], celloutsig_0_30z } > { celloutsig_0_18z[9], celloutsig_0_17z[7:6], celloutsig_0_18z[6:4], celloutsig_0_41z };
  assign celloutsig_0_7z = { in_data[36:30], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_3z } > { in_data[32:30], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_1z };
  assign celloutsig_1_18z = { celloutsig_1_1z[9:4], celloutsig_1_6z, celloutsig_1_13z } > celloutsig_1_8z[7:0];
  assign celloutsig_0_26z = { celloutsig_0_20z[3:1], celloutsig_0_16z } > { in_data[63:61], celloutsig_0_25z };
  assign celloutsig_0_29z = { celloutsig_0_25z, celloutsig_0_19z, celloutsig_0_17z } > { celloutsig_0_20z[3:1], celloutsig_0_16z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_16z };
  assign celloutsig_0_53z = { celloutsig_0_36z, celloutsig_0_26z, celloutsig_0_46z, celloutsig_0_23z, celloutsig_0_4z, celloutsig_0_48z, celloutsig_0_50z } && { celloutsig_0_34z, celloutsig_0_1z, celloutsig_0_46z, celloutsig_0_28z };
  assign celloutsig_0_65z = celloutsig_0_43z[4:1] && celloutsig_0_15z[16:13];
  assign celloutsig_0_31z = celloutsig_0_21z[13:0] && { celloutsig_0_18z[9], celloutsig_0_17z[7:6], celloutsig_0_18z[6:3], celloutsig_0_29z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_24z, celloutsig_0_25z, celloutsig_0_6z, celloutsig_0_26z };
  assign celloutsig_0_46z = { celloutsig_0_15z[27:16], celloutsig_0_7z } < { celloutsig_0_5z, celloutsig_0_34z, celloutsig_0_20z[3:1], celloutsig_0_16z };
  assign celloutsig_0_5z = in_data[22] ? { celloutsig_0_0z[4:1], celloutsig_0_2z } : { in_data[5:4], celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_20z[3:1] = in_data[68] ? { celloutsig_0_15z[25:24], celloutsig_0_14z } : { celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_16z };
  assign celloutsig_0_36z = - celloutsig_0_15z[3:0];
  assign celloutsig_1_8z = - { in_data[156], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_6z };
  assign celloutsig_1_10z = - { celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_0_15z = - { celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_7z, 1'h1, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_17z = - { celloutsig_0_15z[15:4], 1'h1 };
  assign celloutsig_0_34z = ~ { celloutsig_0_5z[2], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_25z };
  assign celloutsig_1_2z = ~ in_data[155:144];
  assign celloutsig_0_64z = celloutsig_0_53z & celloutsig_0_0z[3];
  assign celloutsig_0_1z = in_data[73] & celloutsig_0_0z[5];
  assign celloutsig_0_9z = | celloutsig_0_5z;
  assign celloutsig_0_30z = | { celloutsig_0_26z, celloutsig_0_18z[13:9], celloutsig_0_17z[7] };
  assign celloutsig_1_19z = ~^ { celloutsig_1_0z, celloutsig_1_5z };
  assign celloutsig_0_13z = ~^ { celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_1_5z = in_data[118:116] >> { celloutsig_1_1z[9], celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_0_32z = { celloutsig_0_0z[8], celloutsig_0_1z, celloutsig_0_19z, celloutsig_0_26z } >> { celloutsig_0_16z, celloutsig_0_9z, celloutsig_0_3z, 1'h1 };
  always_latch
    if (!clkin_data[96]) celloutsig_0_0z = 9'h000;
    else if (celloutsig_1_18z) celloutsig_0_0z = in_data[51:43];
  always_latch
    if (!clkin_data[96]) celloutsig_0_43z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_43z = { celloutsig_0_5z[3:0], celloutsig_0_16z };
  always_latch
    if (clkin_data[128]) celloutsig_1_1z = 11'h000;
    else if (clkin_data[32]) celloutsig_1_1z = in_data[125:115];
  always_latch
    if (clkin_data[64]) celloutsig_0_21z = 18'h00000;
    else if (clkin_data[0]) celloutsig_0_21z = { celloutsig_0_3z, celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_17z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_28z = 4'h0;
    else if (!celloutsig_1_18z) celloutsig_0_28z = { in_data[56:55], celloutsig_0_23z, celloutsig_0_3z };
  assign celloutsig_0_23z = ~((celloutsig_0_12z & celloutsig_0_12z) | (celloutsig_0_19z & celloutsig_0_0z[0]));
  assign { celloutsig_0_18z[13:9], celloutsig_0_18z[6:2], celloutsig_0_18z[0] } = { celloutsig_0_17z[12:8], celloutsig_0_17z[5:1], celloutsig_0_7z } & { celloutsig_0_0z[7:6], celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_3z };
  assign { celloutsig_0_18z[8:7], celloutsig_0_18z[1] } = { celloutsig_0_17z[7:6], celloutsig_0_10z };
  assign celloutsig_0_20z[0] = celloutsig_0_16z;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_64z, celloutsig_0_65z };
endmodule
