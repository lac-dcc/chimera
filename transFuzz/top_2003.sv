/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [10:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  reg [6:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [5:0] celloutsig_0_24z;
  wire [11:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_40z;
  reg [9:0] celloutsig_0_43z;
  wire celloutsig_0_4z;
  wire [2:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_92z;
  wire celloutsig_0_9z;
  wire [28:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire [5:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [5:0] celloutsig_1_2z;
  wire [3:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [6:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_7z = !(celloutsig_0_35z ? celloutsig_0_0z : celloutsig_0_6z);
  assign celloutsig_1_6z = !(celloutsig_1_3z[0] ? celloutsig_1_3z[3] : celloutsig_1_3z[0]);
  assign celloutsig_1_9z = !(celloutsig_1_5z[0] ? celloutsig_1_3z[2] : celloutsig_1_6z);
  assign celloutsig_0_11z = ~in_data[36];
  assign celloutsig_0_0z = in_data[61] ^ in_data[5];
  assign celloutsig_0_6z = celloutsig_0_4z ^ in_data[52];
  assign celloutsig_1_13z = celloutsig_1_3z[1] ^ celloutsig_1_2z[0];
  assign celloutsig_0_19z = celloutsig_0_35z ^ celloutsig_0_15z;
  assign celloutsig_0_22z = celloutsig_0_10z ^ celloutsig_0_2z;
  assign celloutsig_1_18z = ~(celloutsig_1_11z ^ celloutsig_1_17z[4]);
  assign celloutsig_0_13z = ~(celloutsig_0_4z ^ celloutsig_0_1z);
  assign celloutsig_0_14z = ~(celloutsig_0_13z ^ celloutsig_0_1z);
  assign celloutsig_0_35z = ~(celloutsig_0_0z ^ celloutsig_0_1z);
  assign celloutsig_1_0z = in_data[128:100] + in_data[177:149];
  assign celloutsig_1_2z = celloutsig_1_0z[14:9] + celloutsig_1_0z[16:11];
  assign celloutsig_1_3z = celloutsig_1_0z[28:25] + celloutsig_1_2z[5:2];
  assign celloutsig_1_5z = { celloutsig_1_0z[17:15], celloutsig_1_3z } + celloutsig_1_0z[18:12];
  assign celloutsig_0_24z = { celloutsig_0_18z[6:5], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_35z, celloutsig_0_12z } + { celloutsig_0_22z, celloutsig_0_1z, celloutsig_0_21z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_14z };
  assign celloutsig_0_25z = { celloutsig_0_18z[3:2], celloutsig_0_20z, celloutsig_0_19z, celloutsig_0_23z, celloutsig_0_9z } + { celloutsig_0_18z[9:0], celloutsig_0_15z, celloutsig_0_13z };
  assign celloutsig_1_1z = celloutsig_1_0z[21:19] && celloutsig_1_0z[5:3];
  assign celloutsig_0_10z = { celloutsig_0_2z, celloutsig_0_35z, celloutsig_0_7z, celloutsig_0_35z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_35z } && { celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_15z = { celloutsig_0_13z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } && { celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_5z };
  assign celloutsig_0_33z = { celloutsig_0_5z[1:0], celloutsig_0_14z, celloutsig_0_35z, celloutsig_0_4z } && 1'h1;
  assign celloutsig_0_16z = { in_data[23:17], celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_9z } || { in_data[62:57], celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_11z };
  assign celloutsig_0_9z = celloutsig_0_2z & ~(celloutsig_0_2z);
  assign celloutsig_1_8z = celloutsig_1_5z[0] & ~(celloutsig_1_2z[4]);
  assign celloutsig_1_11z = celloutsig_1_2z[2] & ~(celloutsig_1_4z);
  assign celloutsig_0_12z = celloutsig_0_2z & ~(1'h1);
  assign celloutsig_0_2z = celloutsig_0_1z & ~(celloutsig_0_1z);
  assign celloutsig_0_31z = celloutsig_0_28z & ~(celloutsig_0_26z);
  assign celloutsig_0_1z = & { in_data[84:77], celloutsig_0_0z };
  assign celloutsig_0_34z = celloutsig_0_2z & celloutsig_0_33z;
  assign celloutsig_1_4z = celloutsig_1_3z[3] & celloutsig_1_1z;
  assign celloutsig_0_26z = celloutsig_0_4z & celloutsig_0_23z;
  assign celloutsig_0_40z = | { celloutsig_0_36z, celloutsig_0_31z, celloutsig_0_27z, celloutsig_0_24z, celloutsig_0_20z[4], in_data[57:39] };
  assign celloutsig_0_4z = | in_data[57:39];
  assign celloutsig_0_92z = | celloutsig_0_43z[5:0];
  assign celloutsig_0_28z = | { celloutsig_0_26z, celloutsig_0_21z, celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_0_21z = ^ { celloutsig_0_18z[7], celloutsig_0_20z, celloutsig_0_2z };
  assign celloutsig_0_5z = { celloutsig_0_4z, celloutsig_0_35z, celloutsig_0_0z } >> { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_35z };
  assign celloutsig_0_18z = { 1'h1, celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_16z, celloutsig_0_2z } >> { in_data[70:61], celloutsig_0_16z };
  assign celloutsig_1_17z = { celloutsig_1_4z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_11z, celloutsig_1_4z, celloutsig_1_4z } << { celloutsig_1_5z[5:3], celloutsig_1_13z, celloutsig_1_9z, celloutsig_1_11z };
  assign celloutsig_0_36z = ~((celloutsig_0_35z & celloutsig_0_26z) | celloutsig_0_5z[0]);
  assign celloutsig_1_10z = ~((celloutsig_1_9z & celloutsig_1_5z[5]) | celloutsig_1_9z);
  assign celloutsig_1_19z = ~((celloutsig_1_6z & celloutsig_1_2z[1]) | celloutsig_1_10z);
  assign celloutsig_0_23z = ~((celloutsig_0_15z & 1'h1) | 1'h1);
  always_latch
    if (!clkin_data[0]) celloutsig_0_43z = 10'h000;
    else if (!celloutsig_1_19z) celloutsig_0_43z = { celloutsig_0_25z[9:7], celloutsig_0_28z, celloutsig_0_0z, celloutsig_0_34z, celloutsig_0_40z, celloutsig_0_9z, celloutsig_0_23z, celloutsig_0_23z };
  always_latch
    if (clkin_data[0]) celloutsig_0_20z = 7'h00;
    else if (celloutsig_1_19z) celloutsig_0_20z = { celloutsig_0_35z, 2'h3, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_19z };
  assign celloutsig_0_27z = ~celloutsig_0_35z;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_92z, 1'h0 };
endmodule
