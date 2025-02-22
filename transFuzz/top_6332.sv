/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [5:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [3:0] celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire [6:0] celloutsig_0_13z;
  reg [4:0] celloutsig_0_14z;
  wire [38:0] celloutsig_0_15z;
  wire [3:0] celloutsig_0_16z;
  wire [6:0] celloutsig_0_17z;
  reg [13:0] celloutsig_0_18z;
  wire [4:0] celloutsig_0_19z;
  wire [5:0] celloutsig_0_1z;
  wire [9:0] celloutsig_0_20z;
  wire [2:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [8:0] celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [3:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [8:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [17:0] celloutsig_0_32z;
  wire [8:0] celloutsig_0_35z;
  wire [4:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [5:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire [4:0] celloutsig_0_46z;
  wire [9:0] celloutsig_0_47z;
  wire [9:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  reg [10:0] celloutsig_0_7z;
  wire [23:0] celloutsig_0_8z;
  wire [5:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [3:0] celloutsig_1_13z;
  wire [3:0] celloutsig_1_18z;
  wire [6:0] celloutsig_1_19z;
  wire [5:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire [10:0] celloutsig_1_5z;
  wire [7:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [52:0] celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_5z = celloutsig_0_4z[2] ? celloutsig_0_4z[5] : celloutsig_0_4z[0];
  assign celloutsig_0_3z = in_data[74] ? celloutsig_0_1z[3] : celloutsig_0_2z[5];
  assign celloutsig_0_10z = ~(celloutsig_0_3z & celloutsig_0_2z[1]);
  assign celloutsig_0_38z = ~((celloutsig_0_4z[1] | celloutsig_0_1z[3]) & (celloutsig_0_20z[2] | celloutsig_0_25z));
  assign celloutsig_0_6z = ~((celloutsig_0_5z | celloutsig_0_0z[1]) & (in_data[45] | celloutsig_0_2z[7]));
  assign celloutsig_0_25z = ~((celloutsig_0_6z | celloutsig_0_16z[1]) & (celloutsig_0_8z[20] | celloutsig_0_22z));
  assign celloutsig_0_31z = celloutsig_0_16z[2] | celloutsig_0_7z[4];
  assign celloutsig_0_44z = celloutsig_0_8z[16] ^ celloutsig_0_39z[1];
  assign celloutsig_1_7z = celloutsig_1_5z[3] ^ celloutsig_1_3z;
  assign celloutsig_0_22z = celloutsig_0_5z ^ in_data[35];
  assign celloutsig_0_35z = celloutsig_0_23z & in_data[37:29];
  assign celloutsig_0_4z = { in_data[10:7], celloutsig_0_1z } & { celloutsig_0_1z[3:0], celloutsig_0_1z };
  assign celloutsig_1_1z = { in_data[167:163], celloutsig_1_0z } & { in_data[113:109], celloutsig_1_0z };
  assign celloutsig_1_13z = celloutsig_1_1z[5:2] & celloutsig_1_6z[6:3];
  assign celloutsig_0_15z = { celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_13z, celloutsig_0_10z } & { celloutsig_0_14z[3:0], celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_7z };
  assign celloutsig_1_18z = { celloutsig_1_8z[36:34], celloutsig_1_10z } / { 1'h1, celloutsig_1_6z[4:2] };
  assign celloutsig_0_37z = { celloutsig_0_35z[6:1], celloutsig_0_21z, celloutsig_0_6z } > { celloutsig_0_1z[3:2], celloutsig_0_28z, celloutsig_0_16z };
  assign celloutsig_0_26z = { celloutsig_0_8z[22:20], celloutsig_0_4z } > { celloutsig_0_12z[1:0], celloutsig_0_19z, celloutsig_0_0z };
  assign celloutsig_1_0z = in_data[143:136] <= in_data[150:143];
  assign celloutsig_0_36z = { celloutsig_0_17z[4:2], celloutsig_0_5z, celloutsig_0_30z } % { 1'h1, celloutsig_0_35z[6:3] };
  assign celloutsig_0_46z = celloutsig_0_20z[6:2] % { 1'h1, celloutsig_0_32z[9:7], celloutsig_0_44z };
  assign celloutsig_1_5z = in_data[172:162] % { 1'h1, in_data[136:127] };
  assign celloutsig_0_9z = celloutsig_0_2z[6:1] % { 1'h1, celloutsig_0_8z[12:8] };
  assign celloutsig_0_16z = { celloutsig_0_1z[2:1], celloutsig_0_5z, celloutsig_0_10z } % { 1'h1, celloutsig_0_0z[4:2] };
  assign celloutsig_0_32z = { celloutsig_0_15z[35:23], celloutsig_0_3z, celloutsig_0_26z, celloutsig_0_31z, celloutsig_0_29z, celloutsig_0_6z } * { celloutsig_0_8z[8:3], celloutsig_0_25z, celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_0_1z = in_data[41:36] * celloutsig_0_0z;
  assign celloutsig_0_11z = { celloutsig_0_8z[11:10], celloutsig_0_10z, celloutsig_0_5z } * { celloutsig_0_7z[6:5], celloutsig_0_3z, celloutsig_0_6z };
  assign celloutsig_0_2z = { in_data[65:63], celloutsig_0_0z } * { celloutsig_0_1z[4:2], celloutsig_0_0z };
  assign celloutsig_0_20z = celloutsig_0_18z[10:1] * { celloutsig_0_15z[20:18], celloutsig_0_17z };
  assign celloutsig_0_0z = - in_data[10:5];
  assign celloutsig_0_19z = - celloutsig_0_2z[6:2];
  assign celloutsig_1_10z = & celloutsig_1_1z[5:1];
  assign celloutsig_0_29z = & { celloutsig_0_8z[23:2], celloutsig_0_3z };
  assign celloutsig_0_30z = | celloutsig_0_8z[9:3];
  assign celloutsig_1_2z = ^ celloutsig_1_1z[4:0];
  assign celloutsig_1_3z = ^ { celloutsig_1_1z[4:2], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_1_4z = celloutsig_1_1z[4:0] >> { in_data[151:148], celloutsig_1_0z };
  assign celloutsig_1_19z = { in_data[184], celloutsig_1_1z } >> { celloutsig_1_18z[2], celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_13z };
  assign celloutsig_0_12z = celloutsig_0_11z >> { celloutsig_0_0z[3:1], celloutsig_0_3z };
  assign celloutsig_0_8z = { in_data[90], celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_3z } >> { in_data[93:83], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_28z = { celloutsig_0_8z[21:19], celloutsig_0_10z } <<< celloutsig_0_11z;
  assign celloutsig_0_47z = { celloutsig_0_18z[11:3], celloutsig_0_38z } >>> { celloutsig_0_17z[4:2], celloutsig_0_37z, celloutsig_0_43z, celloutsig_0_14z };
  assign celloutsig_0_13z = { celloutsig_0_8z[18:13], celloutsig_0_10z } >>> { celloutsig_0_4z[3:1], celloutsig_0_11z };
  assign celloutsig_0_23z = { celloutsig_0_19z[3:0], celloutsig_0_14z } >>> { celloutsig_0_15z[30], celloutsig_0_3z, celloutsig_0_17z };
  assign celloutsig_0_21z = celloutsig_0_17z[5:3] - celloutsig_0_16z[2:0];
  assign celloutsig_0_39z = { celloutsig_0_23z[5:1], celloutsig_0_31z } ~^ { celloutsig_0_36z, celloutsig_0_37z };
  assign celloutsig_1_6z = { celloutsig_1_4z[3:2], celloutsig_1_1z } ~^ { in_data[102:98], celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_1_8z = { celloutsig_1_5z[8:7], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z } ~^ { in_data[168:149], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_6z };
  assign celloutsig_0_17z = celloutsig_0_7z[6:0] ^ { celloutsig_0_2z[5:3], celloutsig_0_11z };
  always_latch
    if (clkin_data[0]) celloutsig_0_7z = 11'h000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_7z = { celloutsig_0_1z[2], celloutsig_0_2z, celloutsig_0_5z };
  always_latch
    if (clkin_data[0]) celloutsig_0_14z = 5'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_14z = { in_data[30], celloutsig_0_11z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_18z = 14'h0000;
    else if (celloutsig_1_19z[0]) celloutsig_0_18z = { celloutsig_0_1z[2:0], celloutsig_0_12z, celloutsig_0_17z };
  assign celloutsig_0_43z = ~((celloutsig_0_8z[4] & celloutsig_0_11z[2]) | (celloutsig_0_7z[1] & celloutsig_0_15z[8]));
  assign { out_data[131:128], out_data[102:96], out_data[36:32], out_data[9:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_46z, celloutsig_0_47z };
endmodule
