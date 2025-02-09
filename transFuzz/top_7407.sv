/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [12:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [7:0] celloutsig_0_11z;
  wire [6:0] celloutsig_0_12z;
  wire [23:0] celloutsig_0_13z;
  wire [6:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [15:0] celloutsig_0_17z;
  wire [8:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [13:0] celloutsig_0_1z;
  wire [7:0] celloutsig_0_20z;
  wire [17:0] celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire [5:0] celloutsig_0_27z;
  reg [7:0] celloutsig_0_2z;
  wire [5:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  reg [34:0] celloutsig_0_32z;
  wire celloutsig_0_35z;
  wire celloutsig_0_38z;
  wire [4:0] celloutsig_0_3z;
  wire [16:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire [33:0] celloutsig_0_45z;
  wire celloutsig_0_48z;
  wire [29:0] celloutsig_0_49z;
  wire [4:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [6:0] celloutsig_0_8z;
  wire [7:0] celloutsig_0_9z;
  wire [20:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [3:0] celloutsig_1_11z;
  reg [28:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [8:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [17:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [3:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  reg [3:0] celloutsig_1_6z;
  reg [4:0] celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_7z = ~((celloutsig_0_4z[3] | celloutsig_0_5z) & celloutsig_0_6z);
  assign celloutsig_0_48z = ~(celloutsig_0_45z[16] ^ celloutsig_0_9z[5]);
  assign celloutsig_1_4z = ~(celloutsig_1_1z ^ celloutsig_1_0z[2]);
  assign celloutsig_0_3z = celloutsig_0_1z[7:3] + celloutsig_0_1z[7:3];
  assign celloutsig_1_3z = in_data[147:144] + { in_data[191:189], celloutsig_1_2z };
  assign celloutsig_0_9z = { in_data[89:83], celloutsig_0_7z } + celloutsig_0_2z;
  assign celloutsig_0_11z = { celloutsig_0_9z[6:1], celloutsig_0_5z, celloutsig_0_6z } + celloutsig_0_2z;
  assign celloutsig_0_14z = celloutsig_0_9z[6:0] + in_data[35:29];
  assign celloutsig_0_17z = { in_data[29:15], celloutsig_0_16z } + { in_data[28:25], celloutsig_0_3z, celloutsig_0_14z };
  assign celloutsig_0_20z = celloutsig_0_13z[18:11] + celloutsig_0_0z[11:4];
  assign celloutsig_0_30z = celloutsig_0_12z[5:0] + celloutsig_0_20z[6:1];
  assign celloutsig_0_31z = { in_data[65:37], celloutsig_0_25z } && { celloutsig_0_13z[22:12], celloutsig_0_27z, celloutsig_0_6z, celloutsig_0_18z, celloutsig_0_25z, celloutsig_0_16z, celloutsig_0_19z };
  assign celloutsig_1_2z = ! { celloutsig_1_0z[6], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_10z = ! { celloutsig_1_0z[20:11], celloutsig_1_8z };
  assign celloutsig_1_15z = ! celloutsig_1_0z[6:4];
  assign celloutsig_0_10z = ! { celloutsig_0_1z[10:7], celloutsig_0_5z };
  assign celloutsig_0_15z = ! celloutsig_0_12z[6:1];
  assign celloutsig_1_5z = celloutsig_1_3z[2:0] < { celloutsig_1_3z[1:0], celloutsig_1_2z };
  assign celloutsig_1_9z = { celloutsig_1_3z, celloutsig_1_8z } < { in_data[175:169], celloutsig_1_1z };
  assign celloutsig_0_16z = { celloutsig_0_1z[12:5], celloutsig_0_7z } < celloutsig_0_1z[11:3];
  assign celloutsig_0_44z = celloutsig_0_43z[8] & ~(celloutsig_0_10z);
  assign celloutsig_1_1z = celloutsig_1_0z[13] & ~(in_data[164]);
  assign celloutsig_1_18z = celloutsig_1_10z & ~(celloutsig_1_0z[10]);
  assign celloutsig_0_6z = in_data[42] & ~(in_data[37]);
  assign celloutsig_0_0z = in_data[57:45] % { 1'h1, in_data[25:14] };
  assign celloutsig_0_45z = { celloutsig_0_32z[0], celloutsig_0_30z, celloutsig_0_5z, celloutsig_0_17z, celloutsig_0_44z, celloutsig_0_11z, celloutsig_0_38z } % { 1'h1, celloutsig_0_0z[2:0], celloutsig_0_1z, celloutsig_0_31z, celloutsig_0_2z, celloutsig_0_8z };
  assign celloutsig_1_0z = in_data[147:127] % { 1'h1, in_data[169:150] };
  assign celloutsig_0_12z = { celloutsig_0_0z[5:1], celloutsig_0_7z, celloutsig_0_6z } % { 1'h1, celloutsig_0_2z[5:0] };
  assign celloutsig_1_8z = celloutsig_1_5z ? { celloutsig_1_6z[1:0], celloutsig_1_2z, celloutsig_1_4z } : { in_data[174:172], 1'h0 };
  assign celloutsig_0_38z = { celloutsig_0_2z[5:0], celloutsig_0_23z, celloutsig_0_25z, celloutsig_0_25z, celloutsig_0_5z } !== { celloutsig_0_14z[4:2], celloutsig_0_14z };
  assign celloutsig_0_19z = { celloutsig_0_16z, celloutsig_0_14z, celloutsig_0_15z } !== celloutsig_0_1z[9:1];
  assign celloutsig_0_43z = ~ { celloutsig_0_8z[4:2], celloutsig_0_1z };
  assign celloutsig_0_49z = ~ { in_data[23:0], celloutsig_0_35z, celloutsig_0_4z };
  assign celloutsig_0_27z = ~ celloutsig_0_1z[11:6];
  assign celloutsig_1_16z = { in_data[121:114], celloutsig_1_13z } | celloutsig_1_12z[12:4];
  assign celloutsig_1_19z = in_data[149:132] | { celloutsig_1_16z[7:1], celloutsig_1_11z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_14z, celloutsig_1_17z };
  assign celloutsig_0_18z = { celloutsig_0_2z[5:4], celloutsig_0_14z } | { celloutsig_0_12z[6:4], celloutsig_0_3z, celloutsig_0_6z };
  assign celloutsig_0_23z = | { celloutsig_0_21z[5:3], celloutsig_0_16z };
  assign celloutsig_0_35z = ^ celloutsig_0_32z[28:17];
  assign celloutsig_1_13z = ^ { celloutsig_1_7z[3:2], celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_9z, celloutsig_1_9z };
  assign celloutsig_1_14z = ^ { celloutsig_1_12z[15:11], celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_10z };
  assign celloutsig_1_17z = ^ { celloutsig_1_15z, celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_15z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_21z = { in_data[47:35], celloutsig_0_4z } >> { celloutsig_0_18z[8:1], celloutsig_0_18z, celloutsig_0_16z };
  assign celloutsig_0_4z = celloutsig_0_2z[6:2] << celloutsig_0_0z[5:1];
  assign celloutsig_1_11z = { celloutsig_1_2z, celloutsig_1_9z, celloutsig_1_5z, celloutsig_1_4z } << celloutsig_1_7z[4:1];
  assign celloutsig_0_8z = celloutsig_0_0z[7:1] << celloutsig_0_1z[11:5];
  assign celloutsig_0_1z = in_data[55:42] << { in_data[80], celloutsig_0_0z };
  assign celloutsig_0_13z = { celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_12z } << { celloutsig_0_12z[2:1], celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_1z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_6z = 4'h0;
    else if (!clkin_data[32]) celloutsig_1_6z = in_data[110:107];
  always_latch
    if (clkin_data[64]) celloutsig_1_7z = 5'h00;
    else if (!clkin_data[32]) celloutsig_1_7z = { in_data[156:154], celloutsig_1_5z, celloutsig_1_1z };
  always_latch
    if (clkin_data[64]) celloutsig_1_12z = 29'h00000000;
    else if (clkin_data[32]) celloutsig_1_12z = { celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_8z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_2z = 8'h00;
    else if (!clkin_data[0]) celloutsig_0_2z = celloutsig_0_1z[12:5];
  always_latch
    if (celloutsig_1_18z) celloutsig_0_32z = 35'h000000000;
    else if (!clkin_data[0]) celloutsig_0_32z = { celloutsig_0_0z[12:3], celloutsig_0_15z, celloutsig_0_13z };
  assign celloutsig_0_5z = ~((in_data[38] & celloutsig_0_1z[1]) | (celloutsig_0_0z[4] & celloutsig_0_4z[0]));
  assign celloutsig_0_25z = ~((celloutsig_0_12z[4] & celloutsig_0_21z[4]) | (celloutsig_0_0z[1] & celloutsig_0_12z[6]));
  assign { out_data[128], out_data[113:96], out_data[32], out_data[29:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_48z, celloutsig_0_49z };
endmodule
