/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [7:0] celloutsig_0_15z;
  reg [7:0] celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_24z;
  wire [9:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [5:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [11:0] celloutsig_0_34z;
  wire celloutsig_0_37z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [10:0] celloutsig_0_43z;
  wire celloutsig_0_48z;
  wire [3:0] celloutsig_0_4z;
  wire [8:0] celloutsig_0_50z;
  wire celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire celloutsig_0_97z;
  reg [10:0] celloutsig_0_98z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire [12:0] celloutsig_1_12z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [16:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [15:0] celloutsig_1_7z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_0z = ~(in_data[121] & in_data[100]);
  assign celloutsig_0_13z = ~(celloutsig_0_4z[0] & celloutsig_0_4z[1]);
  assign celloutsig_0_9z = !(celloutsig_0_8z ? celloutsig_0_0z[2] : celloutsig_0_4z[3]);
  assign celloutsig_0_14z = !(celloutsig_0_3z ? celloutsig_0_2z[2] : celloutsig_0_3z);
  assign celloutsig_0_19z = !(celloutsig_0_3z ? celloutsig_0_16z[0] : celloutsig_0_11z);
  assign celloutsig_0_30z = !(celloutsig_0_4z[0] ? celloutsig_0_6z : celloutsig_0_10z);
  assign celloutsig_0_3z = ~((celloutsig_0_1z | celloutsig_0_0z[0]) & celloutsig_0_2z[5]);
  assign celloutsig_0_33z = ~((celloutsig_0_17z[0] | celloutsig_0_9z) & celloutsig_0_20z[1]);
  assign celloutsig_0_32z = ~((celloutsig_0_0z[0] | celloutsig_0_8z) & (celloutsig_0_31z | celloutsig_0_21z));
  assign celloutsig_0_11z = ~((celloutsig_0_0z[2] | celloutsig_0_8z) & (celloutsig_0_3z | celloutsig_0_4z[0]));
  assign celloutsig_0_31z = celloutsig_0_21z | celloutsig_0_22z;
  assign celloutsig_0_40z = celloutsig_0_30z | celloutsig_0_3z;
  assign celloutsig_1_3z = celloutsig_1_1z ^ in_data[135];
  assign celloutsig_0_12z = celloutsig_0_3z ^ celloutsig_0_2z[5];
  assign celloutsig_0_2z = in_data[86:81] & { in_data[44:43], celloutsig_0_0z };
  assign celloutsig_1_2z = in_data[177:161] / { 1'h1, in_data[162:147] };
  assign celloutsig_0_15z = { celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_13z } / { 1'h1, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_6z };
  assign celloutsig_0_10z = celloutsig_0_0z[2:0] == { in_data[18:17], celloutsig_0_8z };
  assign celloutsig_1_5z = { in_data[152:141], celloutsig_1_4z } == celloutsig_1_2z[14:2];
  assign celloutsig_1_18z = { celloutsig_1_2z[4:2], celloutsig_1_11z, celloutsig_1_0z } == celloutsig_1_7z[15:11];
  assign celloutsig_1_19z = in_data[126:124] == celloutsig_1_12z[2:0];
  assign celloutsig_0_1z = celloutsig_0_0z == in_data[21:18];
  assign celloutsig_0_18z = { celloutsig_0_4z[3:2], celloutsig_0_14z, celloutsig_0_6z } == { celloutsig_0_0z[3:1], celloutsig_0_12z };
  assign celloutsig_0_21z = { celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_19z, celloutsig_0_2z } == { celloutsig_0_20z[4], celloutsig_0_2z[5:3], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_17z };
  assign celloutsig_0_0z = in_data[80:77] % { 1'h1, in_data[77:75] };
  assign celloutsig_1_7z = celloutsig_1_2z[15:0] % { 1'h1, in_data[126:117], celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_6z };
  assign celloutsig_0_26z = { celloutsig_0_16z[7:1], celloutsig_0_11z, celloutsig_0_24z, celloutsig_0_21z } % { 1'h1, celloutsig_0_2z[4:0], celloutsig_0_17z, celloutsig_0_19z };
  assign celloutsig_0_20z = celloutsig_0_13z ? { celloutsig_0_15z[6:2], celloutsig_0_14z } : { celloutsig_0_17z, 1'h0, celloutsig_0_8z, celloutsig_0_10z };
  assign celloutsig_0_6z = celloutsig_0_2z != { in_data[1:0], celloutsig_0_0z };
  assign celloutsig_1_4z = { celloutsig_1_2z[16:12], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_3z } != in_data[116:109];
  assign celloutsig_0_22z = { celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_20z, celloutsig_0_12z } != { celloutsig_0_2z[1:0], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_18z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_2z[5:3], celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_14z };
  assign celloutsig_0_27z = celloutsig_0_20z != { celloutsig_0_15z[6:4], celloutsig_0_17z };
  assign celloutsig_0_4z = - in_data[54:51];
  assign celloutsig_0_17z = - { celloutsig_0_2z[3], celloutsig_0_3z, celloutsig_0_8z };
  assign celloutsig_0_41z = | { celloutsig_0_16z[6:4], celloutsig_0_10z, celloutsig_0_24z, celloutsig_0_18z, celloutsig_0_37z, celloutsig_0_3z, celloutsig_0_24z, celloutsig_0_9z };
  assign celloutsig_0_8z = | { in_data[46:38], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_28z = | { celloutsig_0_26z, celloutsig_0_12z };
  assign celloutsig_0_97z = celloutsig_0_8z & celloutsig_0_50z[5];
  assign celloutsig_1_1z = celloutsig_1_0z & in_data[120];
  assign celloutsig_1_11z = celloutsig_1_1z & celloutsig_1_2z[4];
  assign celloutsig_1_6z = | celloutsig_1_2z[7:1];
  assign celloutsig_0_34z = { celloutsig_0_11z, celloutsig_0_26z, celloutsig_0_13z } <<< { celloutsig_0_10z, celloutsig_0_17z, celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_2z[5:3], celloutsig_0_3z, celloutsig_0_21z };
  assign celloutsig_0_50z = { celloutsig_0_43z[9:2], celloutsig_0_31z } <<< { celloutsig_0_16z[4:0], celloutsig_0_48z, celloutsig_0_3z, celloutsig_0_40z, celloutsig_0_41z };
  assign celloutsig_1_12z = celloutsig_1_2z[12:0] <<< celloutsig_1_7z[13:1];
  assign celloutsig_0_43z = { celloutsig_0_26z[6:5], celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_40z, celloutsig_0_27z, celloutsig_0_28z, celloutsig_0_21z, celloutsig_0_3z, celloutsig_0_8z } - { celloutsig_0_26z[9:5], celloutsig_0_33z, celloutsig_0_0z, celloutsig_0_32z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_98z = 11'h000;
    else if (!celloutsig_1_19z) celloutsig_0_98z = { celloutsig_0_34z[10:7], celloutsig_0_2z, celloutsig_0_28z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_16z = 8'h00;
    else if (celloutsig_1_19z) celloutsig_0_16z = { celloutsig_0_12z, celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_0_37z = ~((celloutsig_0_0z[3] & celloutsig_0_3z) | (celloutsig_0_3z & in_data[19]));
  assign celloutsig_0_48z = ~((celloutsig_0_22z & celloutsig_0_30z) | (celloutsig_0_11z & celloutsig_0_30z));
  assign celloutsig_0_24z = ~((celloutsig_0_14z & celloutsig_0_12z) | (celloutsig_0_6z & celloutsig_0_21z));
  assign { out_data[128], out_data[96], out_data[32], out_data[10:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_97z, celloutsig_0_98z };
endmodule
