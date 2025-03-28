/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [4:0] celloutsig_0_14z;
  wire [10:0] celloutsig_0_15z;
  wire [5:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  reg [9:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [11:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [5:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [5:0] celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [13:0] celloutsig_0_37z;
  wire [4:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [3:0] celloutsig_0_41z;
  reg [6:0] celloutsig_0_47z;
  wire celloutsig_0_4z;
  wire celloutsig_0_56z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  reg [7:0] celloutsig_0_5z;
  wire [8:0] celloutsig_0_6z;
  wire [4:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [4:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire [7:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [14:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  reg [5:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [14:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_25z = celloutsig_0_22z ? celloutsig_0_9z[4] : celloutsig_0_13z;
  assign celloutsig_0_4z = !(celloutsig_0_1z ? celloutsig_0_3z[2] : celloutsig_0_2z);
  assign celloutsig_0_59z = !(celloutsig_0_28z ? celloutsig_0_36z : celloutsig_0_5z[2]);
  assign celloutsig_0_0z = ~(in_data[59] | in_data[63]);
  assign celloutsig_0_10z = ~(celloutsig_0_9z[1] | celloutsig_0_0z);
  assign celloutsig_1_1z = ~((in_data[104] | celloutsig_1_0z) & in_data[141]);
  assign celloutsig_0_12z = ~((celloutsig_0_8z | celloutsig_0_9z[1]) & celloutsig_0_4z);
  assign celloutsig_0_17z = ~((in_data[48] | celloutsig_0_8z) & in_data[94]);
  assign celloutsig_1_7z = celloutsig_1_0z | ~(celloutsig_1_5z);
  assign celloutsig_0_13z = celloutsig_0_4z | ~(celloutsig_0_2z);
  assign celloutsig_0_35z = celloutsig_0_33z[3] | celloutsig_0_9z[2];
  assign celloutsig_0_40z = celloutsig_0_13z | celloutsig_0_3z[1];
  assign celloutsig_1_0z = in_data[151] | in_data[107];
  assign celloutsig_1_2z = celloutsig_1_0z | in_data[164];
  assign celloutsig_1_3z = celloutsig_1_1z | celloutsig_1_2z;
  assign celloutsig_0_1z = in_data[14] | celloutsig_0_0z;
  assign celloutsig_0_2z = celloutsig_0_0z | in_data[86];
  assign celloutsig_0_23z = celloutsig_0_21z[11] | celloutsig_0_14z[3];
  assign celloutsig_0_28z = celloutsig_0_20z | celloutsig_0_8z;
  assign celloutsig_0_31z = celloutsig_0_23z | celloutsig_0_8z;
  assign celloutsig_0_37z = { celloutsig_0_28z, celloutsig_0_23z, celloutsig_0_30z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_31z } / { 1'h1, celloutsig_0_16z[4:0], celloutsig_0_35z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_12z };
  assign celloutsig_0_9z = celloutsig_0_7z / { 1'h1, celloutsig_0_7z[3:1], celloutsig_0_8z };
  assign celloutsig_1_13z = { celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_4z } == { celloutsig_1_4z[5], celloutsig_1_9z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_3z };
  assign celloutsig_1_14z = { in_data[182:180], celloutsig_1_12z, celloutsig_1_4z, 1'h0, celloutsig_1_9z } == { celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_12z, celloutsig_1_0z, celloutsig_1_13z };
  assign celloutsig_1_15z = { celloutsig_1_6z[11:1], celloutsig_1_13z, celloutsig_1_7z } == { in_data[139:132], celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_5z, celloutsig_1_14z, celloutsig_1_5z };
  assign celloutsig_1_16z = { celloutsig_1_6z[7], 1'h0, celloutsig_1_10z, celloutsig_1_0z } == in_data[123:120];
  assign celloutsig_0_56z = celloutsig_0_37z[11:0] <= { celloutsig_0_21z[11:1], celloutsig_0_17z };
  assign celloutsig_1_10z = celloutsig_1_6z[14:6] <= { celloutsig_1_4z[3:2], celloutsig_1_9z, celloutsig_1_4z };
  assign celloutsig_1_18z = { celloutsig_1_4z[5:2], celloutsig_1_4z, celloutsig_1_17z, celloutsig_1_16z } <= { in_data[140:133], celloutsig_1_15z, 1'h0, celloutsig_1_12z, celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_4z };
  assign celloutsig_0_36z = { celloutsig_0_13z, celloutsig_0_27z, celloutsig_0_22z, celloutsig_0_7z } && celloutsig_0_5z;
  assign celloutsig_1_5z = { celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z } && { in_data[112:110], celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_0_22z = { in_data[76:71], celloutsig_0_7z } && { celloutsig_0_15z[8:1], celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_4z };
  assign celloutsig_0_27z = celloutsig_0_14z[2:0] && celloutsig_0_14z[4:2];
  assign celloutsig_0_30z = { celloutsig_0_7z[4:2], celloutsig_0_25z, celloutsig_0_28z } && celloutsig_0_19z[7:3];
  assign celloutsig_0_29z = celloutsig_0_8z & ~(celloutsig_0_7z[0]);
  assign celloutsig_1_17z = { celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_4z } % { 1'h1, celloutsig_1_4z[1:0], celloutsig_1_5z, celloutsig_1_16z, celloutsig_1_5z, celloutsig_1_10z, celloutsig_1_1z };
  assign celloutsig_0_14z = { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_10z } % { 1'h1, celloutsig_0_5z[6:3] };
  assign celloutsig_0_15z = { celloutsig_0_4z, celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_2z } * { celloutsig_0_14z[4:2], celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_11z };
  assign celloutsig_0_8z = { celloutsig_0_6z[7], celloutsig_0_7z } !== { celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_0_18z = { celloutsig_0_7z[4:3], celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_17z, celloutsig_0_15z, celloutsig_0_16z } !== { celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_16z, celloutsig_0_4z };
  assign celloutsig_1_19z = ~ { celloutsig_1_6z[14:2], celloutsig_1_12z, celloutsig_1_13z };
  assign celloutsig_0_16z = ~ celloutsig_0_6z[5:0];
  assign celloutsig_0_21z = ~ { celloutsig_0_7z[1:0], celloutsig_0_19z };
  assign celloutsig_1_8z = | { celloutsig_1_6z[7:1], celloutsig_1_1z };
  assign celloutsig_0_11z = | { celloutsig_0_7z, in_data[92] };
  assign celloutsig_0_58z = ~^ { celloutsig_0_14z[4:2], celloutsig_0_41z, celloutsig_0_40z, celloutsig_0_47z, celloutsig_0_18z, celloutsig_0_36z, celloutsig_0_4z, celloutsig_0_56z };
  assign celloutsig_1_9z = ~^ { celloutsig_1_6z[8], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_5z };
  assign celloutsig_1_12z = ^ { celloutsig_1_0z, celloutsig_1_3z, 1'h0, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_0z };
  assign celloutsig_0_20z = ^ { celloutsig_0_5z[7:3], celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_0_33z = { celloutsig_0_24z[2:0], celloutsig_0_20z, celloutsig_0_28z, celloutsig_0_17z } >> { celloutsig_0_5z[2:0], celloutsig_0_29z, celloutsig_0_31z, celloutsig_0_12z };
  assign celloutsig_0_3z = { in_data[21:20], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z } >> in_data[5:1];
  assign celloutsig_0_6z = { celloutsig_0_5z[2], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z } >> in_data[92:84];
  assign celloutsig_0_41z = { celloutsig_0_15z[3:1], celloutsig_0_23z } >>> celloutsig_0_5z[4:1];
  assign celloutsig_0_24z = celloutsig_0_5z[7:2] >>> { celloutsig_0_0z, celloutsig_0_7z };
  assign celloutsig_0_7z = celloutsig_0_3z - { celloutsig_0_3z[4:1], celloutsig_0_1z };
  assign celloutsig_1_6z = { in_data[144:134], celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_1z } ~^ { celloutsig_1_4z[4:0], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_3z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_47z = 7'h00;
    else if (!clkin_data[0]) celloutsig_0_47z = { celloutsig_0_5z[7:6], celloutsig_0_3z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_5z = 8'h00;
    else if (!clkin_data[0]) celloutsig_0_5z = { celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_4z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_4z = 6'h00;
    else if (clkin_data[32]) celloutsig_1_4z = { in_data[173:170], celloutsig_1_1z, celloutsig_1_2z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_19z = 10'h000;
    else if (clkin_data[0]) celloutsig_0_19z = { in_data[93:86], celloutsig_0_8z, celloutsig_0_1z };
  assign { out_data[128], out_data[110:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_58z, celloutsig_0_59z };
endmodule
