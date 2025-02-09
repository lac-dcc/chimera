/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [6:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [2:0] celloutsig_0_11z;
  wire [6:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [3:0] celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire [3:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  wire [21:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [3:0] celloutsig_0_24z;
  wire [18:0] celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire [3:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [15:0] celloutsig_0_34z;
  wire [14:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [6:0] celloutsig_0_3z;
  wire [11:0] celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire celloutsig_0_46z;
  wire celloutsig_0_4z;
  wire [25:0] celloutsig_0_52z;
  wire [2:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [7:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire [3:0] celloutsig_1_18z;
  wire [4:0] celloutsig_1_19z;
  wire [8:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [18:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [9:0] celloutsig_1_7z;
  wire [4:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_1z = celloutsig_0_0z ? celloutsig_0_0z : in_data[25];
  assign celloutsig_0_13z = celloutsig_0_2z[1] ? celloutsig_0_3z[3] : celloutsig_0_5z[0];
  assign celloutsig_0_28z = celloutsig_0_20z[3] ? celloutsig_0_11z[2] : celloutsig_0_17z;
  assign celloutsig_0_30z = celloutsig_0_12z[3] ? in_data[70] : celloutsig_0_1z;
  assign celloutsig_0_36z = ~(in_data[91] | celloutsig_0_26z[15]);
  assign celloutsig_1_6z = ~(celloutsig_1_0z | celloutsig_1_0z);
  assign celloutsig_0_38z = celloutsig_0_11z[2] ^ celloutsig_0_4z;
  assign celloutsig_0_4z = celloutsig_0_2z[1] ^ celloutsig_0_0z;
  assign celloutsig_1_2z = ~(celloutsig_1_0z ^ in_data[186]);
  assign celloutsig_0_11z = { celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_4z } + celloutsig_0_3z[6:4];
  assign celloutsig_0_15z = celloutsig_0_12z[6:3] + { celloutsig_0_2z[2:1], celloutsig_0_0z, celloutsig_0_6z };
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[0])
    if (clkin_data[0]) _00_ <= 7'h00;
    else _00_ <= celloutsig_0_34z[14:8];
  reg [7:0] _13_;
  always_ff @(posedge celloutsig_1_18z[0], posedge clkin_data[0])
    if (clkin_data[0]) _13_ <= 8'h00;
    else _13_ <= { celloutsig_0_11z[2:1], celloutsig_0_9z, celloutsig_0_43z, celloutsig_0_15z };
  assign out_data[39:32] = _13_;
  assign celloutsig_1_5z = { celloutsig_1_1z[3:1], celloutsig_1_4z } & { celloutsig_1_3z[13:11], celloutsig_1_4z };
  assign celloutsig_1_7z = { celloutsig_1_1z[8:1], celloutsig_1_0z, celloutsig_1_4z } / { 1'h1, celloutsig_1_1z[7:1], celloutsig_1_0z, celloutsig_1_6z };
  assign celloutsig_0_46z = { celloutsig_0_23z, celloutsig_0_4z, celloutsig_0_21z } == { in_data[39:32], celloutsig_0_16z, celloutsig_0_19z, celloutsig_0_28z, _00_, celloutsig_0_37z };
  assign celloutsig_1_13z = celloutsig_1_3z[14:2] == { celloutsig_1_3z[16:6], celloutsig_1_0z, celloutsig_1_12z };
  assign celloutsig_0_14z = { celloutsig_0_2z[1], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_13z, celloutsig_0_7z } == { celloutsig_0_12z[3], celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_10z };
  assign celloutsig_0_32z = { in_data[41:18], celloutsig_0_17z } === { celloutsig_0_11z[0], celloutsig_0_18z, celloutsig_0_20z, celloutsig_0_14z, celloutsig_0_31z, celloutsig_0_3z[6:1], 1'h1, celloutsig_0_1z, celloutsig_0_15z, celloutsig_0_22z, celloutsig_0_13z };
  assign celloutsig_1_15z = in_data[160:146] === celloutsig_1_3z[15:1];
  assign celloutsig_0_22z = { celloutsig_0_8z[6:4], celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_0z } === { in_data[46:39], celloutsig_0_9z, celloutsig_0_15z };
  assign celloutsig_0_0z = in_data[21:6] >= in_data[93:78];
  assign celloutsig_1_0z = in_data[172:164] >= in_data[128:120];
  assign celloutsig_1_9z = { in_data[137:135], celloutsig_1_1z[8:1], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_6z } >= in_data[110:96];
  assign celloutsig_0_7z = { celloutsig_0_5z[2], celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_5z } <= { celloutsig_0_3z[6:1], celloutsig_0_0z, celloutsig_0_3z[6:1], 1'h1 };
  assign celloutsig_0_10z = { celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_4z } <= { celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_6z = { celloutsig_0_3z[6:2], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_2z } < { in_data[90:80], celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_23z = { celloutsig_0_16z[1], celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_1z } < { celloutsig_0_2z[3:1], celloutsig_0_14z };
  assign celloutsig_0_24z = { celloutsig_0_21z[3:1], celloutsig_0_13z } % { 1'h1, celloutsig_0_20z[2:0] };
  assign celloutsig_1_1z[8:1] = in_data[137] ? in_data[181:174] : { in_data[162:157], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_18z = celloutsig_0_8z[6] ? celloutsig_0_2z : celloutsig_0_12z[3:0];
  assign celloutsig_0_21z = celloutsig_0_1z ? { celloutsig_0_8z[6:0], 1'h1, celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_18z } : { in_data[52:47], celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_19z, celloutsig_0_20z, celloutsig_0_9z };
  assign celloutsig_0_37z = { celloutsig_0_14z, celloutsig_0_20z } != { celloutsig_0_35z[0], celloutsig_0_2z };
  assign celloutsig_0_35z = - { in_data[15:5], celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_5z = - celloutsig_0_3z[5:3];
  assign celloutsig_1_3z = - in_data[165:147];
  assign celloutsig_0_8z = - in_data[9:2];
  assign celloutsig_0_12z = - { celloutsig_0_3z[6:1], 1'h1 };
  assign celloutsig_0_19z = - { celloutsig_0_10z, celloutsig_0_11z };
  assign celloutsig_0_20z = - celloutsig_0_15z;
  assign celloutsig_0_43z = ^ { celloutsig_0_18z[1:0], celloutsig_0_28z, celloutsig_0_18z };
  assign celloutsig_1_4z = ^ { celloutsig_1_3z[7:0], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_17z = ^ { celloutsig_0_8z[6:5], celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_52z = { celloutsig_0_21z[14:2], celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_3z[6:1], 1'h1, celloutsig_0_32z, celloutsig_0_31z, celloutsig_0_38z, celloutsig_0_36z } <<< { celloutsig_0_24z[3:1], celloutsig_0_1z, celloutsig_0_41z, celloutsig_0_0z, celloutsig_0_43z, celloutsig_0_22z, celloutsig_0_46z, celloutsig_0_38z, celloutsig_0_23z, celloutsig_0_19z };
  assign celloutsig_1_8z = { celloutsig_1_7z[2], celloutsig_1_5z } <<< { celloutsig_1_3z[4:1], celloutsig_1_0z };
  assign celloutsig_1_18z = { celloutsig_1_1z[3:1], celloutsig_1_0z } <<< { celloutsig_1_8z[3:1], celloutsig_1_9z };
  assign celloutsig_0_16z = { celloutsig_0_15z[1:0], celloutsig_0_4z } <<< { celloutsig_0_2z[2:1], celloutsig_0_9z };
  assign celloutsig_0_2z = { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z } <<< in_data[87:84];
  assign celloutsig_0_34z = { celloutsig_0_26z[10:7], celloutsig_0_19z, celloutsig_0_8z } >>> { celloutsig_0_7z, celloutsig_0_30z, celloutsig_0_28z, celloutsig_0_3z[6:1], 1'h1, celloutsig_0_17z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_22z };
  assign celloutsig_1_19z = { celloutsig_1_8z[1:0], celloutsig_1_13z, celloutsig_1_15z, celloutsig_1_6z } >>> { celloutsig_1_7z[4:3], celloutsig_1_15z, celloutsig_1_15z, celloutsig_1_0z };
  assign celloutsig_0_26z = { celloutsig_0_5z[2], celloutsig_0_17z, celloutsig_0_19z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_14z, celloutsig_0_18z, celloutsig_0_7z, celloutsig_0_7z } >>> { in_data[22:5], celloutsig_0_22z };
  assign celloutsig_0_41z = { in_data[29:19], celloutsig_0_22z } ~^ celloutsig_0_34z[14:3];
  assign celloutsig_1_12z = ~((celloutsig_1_2z & celloutsig_1_5z[2]) | (celloutsig_1_8z[2] & celloutsig_1_5z[1]));
  assign celloutsig_0_9z = ~((celloutsig_0_6z & celloutsig_0_7z) | (celloutsig_0_6z & celloutsig_0_8z[0]));
  assign celloutsig_0_31z = ~((celloutsig_0_1z & celloutsig_0_4z) | (celloutsig_0_5z[0] & celloutsig_0_30z));
  assign { celloutsig_0_3z[4], celloutsig_0_3z[6], celloutsig_0_3z[3], celloutsig_0_3z[5], celloutsig_0_3z[2:1] } = { celloutsig_0_2z[3:2], celloutsig_0_2z[2:1], celloutsig_0_2z[1:0] } ~^ { in_data[90], in_data[92], in_data[89], in_data[91], in_data[88:87] };
  assign celloutsig_0_3z[0] = 1'h1;
  assign celloutsig_1_1z[0] = celloutsig_1_0z;
  assign { out_data[131:128], out_data[100:96], out_data[25:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_52z };
endmodule
