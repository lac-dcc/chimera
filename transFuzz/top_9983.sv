/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire [3:0] celloutsig_0_13z;
  wire [18:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [12:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [23:0] celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_2z;
  wire celloutsig_0_33z;
  wire [14:0] celloutsig_0_34z;
  wire [2:0] celloutsig_0_35z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  reg [4:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [40:0] celloutsig_1_11z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire [16:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [5:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
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
  assign celloutsig_1_4z = !(celloutsig_1_1z[3] ? celloutsig_1_1z[2] : celloutsig_1_0z);
  assign celloutsig_0_20z = !(celloutsig_0_18z[1] ? celloutsig_0_2z : celloutsig_0_15z);
  assign celloutsig_1_8z = ~(celloutsig_1_5z | celloutsig_1_6z);
  assign celloutsig_1_9z = ~(celloutsig_1_8z | celloutsig_1_0z);
  assign celloutsig_0_27z = ~(celloutsig_0_24z | celloutsig_0_24z);
  assign celloutsig_1_2z = ~((celloutsig_1_1z[2] | in_data[150]) & celloutsig_1_0z);
  assign celloutsig_1_0z = ~((in_data[155] | in_data[130]) & (in_data[173] | in_data[177]));
  assign celloutsig_1_7z = ~((celloutsig_1_4z | celloutsig_1_6z) & (celloutsig_1_1z[1] | celloutsig_1_0z));
  assign celloutsig_0_1z = celloutsig_0_0z | ~(celloutsig_0_0z);
  assign celloutsig_0_17z = { celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_9z } == { in_data[43:38], celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_0_8z = { in_data[35:30], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_1z } === { in_data[43:36], celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_2z };
  assign celloutsig_0_33z = { celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_1z } > celloutsig_0_18z[3:0];
  assign celloutsig_1_16z = { in_data[165:137], celloutsig_1_15z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_0z } > { celloutsig_1_11z[37:10], celloutsig_1_1z };
  assign celloutsig_0_11z = { celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_7z } > { celloutsig_0_5z[0], celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_0_16z = celloutsig_0_14z[16:13] > celloutsig_0_12z[3:0];
  assign celloutsig_0_23z = { in_data[11], celloutsig_0_16z, celloutsig_0_4z, celloutsig_0_19z, celloutsig_0_0z, celloutsig_0_13z } > celloutsig_0_14z[10:2];
  assign celloutsig_0_2z = { in_data[26], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } > { in_data[74:64], celloutsig_0_1z };
  assign celloutsig_1_19z = { in_data[171:170], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_16z } <= { in_data[184:182], celloutsig_1_9z, celloutsig_1_7z };
  assign celloutsig_0_26z = { celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_6z } <= { celloutsig_0_21z[5:1], celloutsig_0_2z, celloutsig_0_16z, celloutsig_0_13z };
  assign celloutsig_0_3z = { in_data[45:42], celloutsig_0_2z, celloutsig_0_0z } && { in_data[70:66], celloutsig_0_0z };
  assign celloutsig_1_3z = { celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z } && { in_data[120], celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_6z = { in_data[5], celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_3z } && { in_data[22:12], celloutsig_0_4z };
  assign celloutsig_0_19z = { in_data[33:23], celloutsig_0_10z, celloutsig_0_18z, celloutsig_0_17z } && { in_data[37:11], celloutsig_0_4z };
  assign celloutsig_0_4z = ! { in_data[5:2], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_1_15z = in_data[186] & ~(celloutsig_1_1z[3]);
  assign celloutsig_0_9z = celloutsig_0_8z & ~(in_data[92]);
  assign celloutsig_0_24z = celloutsig_0_3z & ~(celloutsig_0_11z);
  assign celloutsig_0_12z = { celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_10z, celloutsig_0_0z } % { 1'h1, in_data[44:40] };
  assign celloutsig_0_21z = { in_data[26:11], celloutsig_0_12z, celloutsig_0_17z, celloutsig_0_6z } % { 1'h1, in_data[93:71] };
  assign celloutsig_1_18z = { celloutsig_1_11z[14:4], celloutsig_1_1z } * { celloutsig_1_11z[14:1], celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_7z };
  assign celloutsig_0_35z = - celloutsig_0_21z[8:6];
  assign celloutsig_0_10z = - celloutsig_0_5z[4:2];
  assign celloutsig_1_5z = & in_data[136:130];
  assign celloutsig_0_7z = & { celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_1_10z = celloutsig_1_0z & in_data[145];
  assign celloutsig_0_13z = { celloutsig_0_5z[2:0], celloutsig_0_6z } <<< celloutsig_0_5z[3:0];
  assign celloutsig_0_14z = { celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_2z } <<< { in_data[38:27], celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_6z };
  assign celloutsig_0_34z = { celloutsig_0_5z[4:1], celloutsig_0_20z, celloutsig_0_26z, celloutsig_0_23z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_27z, celloutsig_0_8z, celloutsig_0_19z, celloutsig_0_33z } >>> { celloutsig_0_18z[12:2], celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_15z };
  assign celloutsig_1_1z = in_data[149:144] >>> in_data[132:127];
  assign celloutsig_1_11z = { in_data[136:99], celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_2z } - { in_data[173:141], celloutsig_1_10z, celloutsig_1_9z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_10z };
  assign celloutsig_0_18z = { celloutsig_0_14z[14:7], celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_10z } ^ { celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_12z, celloutsig_0_3z };
  assign celloutsig_1_6z = ~((celloutsig_1_3z & celloutsig_1_1z[3]) | in_data[127]);
  always_latch
    if (!clkin_data[0]) celloutsig_0_5z = 5'h00;
    else if (!celloutsig_1_19z) celloutsig_0_5z = { in_data[62:59], celloutsig_0_2z };
  assign celloutsig_0_0z = ~((in_data[86] & in_data[10]) | (in_data[43] & in_data[66]));
  assign celloutsig_0_15z = ~((celloutsig_0_6z & celloutsig_0_7z) | (celloutsig_0_14z[7] & celloutsig_0_12z[5]));
  assign { out_data[144:128], out_data[96], out_data[46:32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_34z, celloutsig_0_35z };
endmodule
