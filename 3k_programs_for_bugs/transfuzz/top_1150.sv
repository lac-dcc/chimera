/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [8:0] celloutsig_0_0z;
  wire [8:0] celloutsig_0_10z;
  wire [19:0] celloutsig_0_11z;
  wire [6:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [5:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  reg [2:0] celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire [2:0] celloutsig_0_24z;
  wire [5:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [4:0] celloutsig_0_28z;
  wire [14:0] celloutsig_0_2z;
  wire [10:0] celloutsig_0_31z;
  reg [6:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire [3:0] celloutsig_0_36z;
  wire [34:0] celloutsig_0_37z;
  wire [11:0] celloutsig_0_3z;
  wire [7:0] celloutsig_0_4z;
  wire [15:0] celloutsig_0_5z;
  wire [8:0] celloutsig_0_6z;
  wire [5:0] celloutsig_0_7z;
  wire [12:0] celloutsig_0_8z;
  wire [14:0] celloutsig_0_9z;
  wire [7:0] celloutsig_1_0z;
  reg [5:0] celloutsig_1_12z;
  reg [22:0] celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [5:0] celloutsig_1_1z;
  wire [14:0] celloutsig_1_2z;
  wire [7:0] celloutsig_1_3z;
  wire [6:0] celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire [14:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_36z = celloutsig_0_8z[12:9] & { celloutsig_0_0z[8:6], celloutsig_0_33z };
  assign celloutsig_0_7z = celloutsig_0_2z[12:7] & celloutsig_0_5z[13:8];
  assign celloutsig_0_12z = in_data[84:78] & celloutsig_0_3z[6:0];
  assign celloutsig_0_1z = celloutsig_0_0z[5:3] & celloutsig_0_0z[7:5];
  assign celloutsig_0_16z = { celloutsig_0_4z[5:1], celloutsig_0_13z } & celloutsig_0_10z[8:3];
  assign celloutsig_0_20z = celloutsig_0_2z[9:4] & { celloutsig_0_5z[11:7], celloutsig_0_14z };
  assign celloutsig_0_25z = { in_data[63:61], celloutsig_0_24z } & celloutsig_0_2z[8:3];
  assign celloutsig_1_7z = { celloutsig_1_5z[4:2], celloutsig_1_3z } < celloutsig_1_2z[11:1];
  assign celloutsig_1_8z = { celloutsig_1_6z[0], celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_5z } < { celloutsig_1_0z[5:2], celloutsig_1_2z };
  assign celloutsig_1_18z = celloutsig_1_14z[17:15] < celloutsig_1_6z[10:8];
  assign celloutsig_1_19z = celloutsig_1_4z[6:1] < celloutsig_1_14z[22:17];
  assign celloutsig_0_13z = celloutsig_0_6z[6:3] < celloutsig_0_2z[13:10];
  assign celloutsig_0_15z = { celloutsig_0_7z[5:3], celloutsig_0_4z } < { celloutsig_0_4z[3:0], celloutsig_0_12z };
  assign celloutsig_0_22z = { celloutsig_0_20z[5:1], celloutsig_0_17z } < celloutsig_0_3z[7:2];
  assign celloutsig_0_26z = { celloutsig_0_5z[2], celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_18z } < { celloutsig_0_0z[5:1], celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_1_2z = { in_data[169:161], celloutsig_1_1z } % { 1'h1, celloutsig_1_0z[3:2], celloutsig_1_1z, celloutsig_1_1z[5:1], in_data[96] };
  assign celloutsig_1_4z = celloutsig_1_0z[6:0] % { 1'h1, celloutsig_1_2z[6:1] };
  assign celloutsig_0_4z = celloutsig_0_0z[8:1] % { 1'h1, celloutsig_0_2z[10:4] };
  assign celloutsig_0_9z = in_data[91:77] % { 1'h1, celloutsig_0_0z[4:3], celloutsig_0_3z };
  assign celloutsig_0_10z = celloutsig_0_3z[8:0] % { 1'h1, in_data[68:61] };
  assign celloutsig_0_11z = { celloutsig_0_5z[13:5], celloutsig_0_1z, celloutsig_0_4z } % { 1'h1, in_data[27:9] };
  assign celloutsig_0_2z = { in_data[56:48], celloutsig_0_1z, celloutsig_0_1z } % { 1'h1, celloutsig_0_0z[7:6], celloutsig_0_0z, celloutsig_0_1z[2:1], in_data[0] };
  assign celloutsig_0_24z = celloutsig_0_3z[9:7] % { 1'h1, celloutsig_0_8z[4:3] };
  assign celloutsig_0_31z = { celloutsig_0_7z[5:1], celloutsig_0_25z } % { 1'h1, celloutsig_0_2z[12:3] };
  assign celloutsig_0_35z = ~^ { celloutsig_0_1z[2:1], celloutsig_0_15z, celloutsig_0_13z, celloutsig_0_33z, celloutsig_0_32z };
  assign celloutsig_0_14z = ~^ celloutsig_0_4z[5:1];
  assign celloutsig_0_17z = ~^ celloutsig_0_12z[3:0];
  assign celloutsig_0_18z = ~^ { celloutsig_0_11z[17:16], celloutsig_0_15z };
  assign celloutsig_0_27z = ~^ { celloutsig_0_11z[12:8], celloutsig_0_13z, celloutsig_0_22z };
  assign celloutsig_0_33z = ~^ { celloutsig_0_4z[3:2], celloutsig_0_22z, celloutsig_0_27z };
  assign celloutsig_0_0z = in_data[82:74] ^ in_data[23:15];
  assign celloutsig_0_3z = { celloutsig_0_2z[8:6], celloutsig_0_0z } ^ { in_data[52:47], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_37z = { celloutsig_0_16z[4:0], celloutsig_0_19z, celloutsig_0_10z, celloutsig_0_35z, celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_35z } ^ { celloutsig_0_24z[2:1], celloutsig_0_4z, celloutsig_0_31z, celloutsig_0_28z, celloutsig_0_6z };
  assign celloutsig_1_0z = in_data[179:172] ^ in_data[129:122];
  assign celloutsig_1_1z = in_data[180:175] ^ in_data[169:164];
  assign celloutsig_1_3z = in_data[166:159] ^ in_data[161:154];
  assign celloutsig_1_5z = celloutsig_1_2z[12:4] ^ in_data[140:132];
  assign celloutsig_1_6z = { celloutsig_1_2z[14:7], celloutsig_1_4z } ^ in_data[127:113];
  assign celloutsig_0_5z = in_data[60:45] ^ { celloutsig_0_1z[1], celloutsig_0_2z };
  assign celloutsig_0_6z = { celloutsig_0_1z[0], celloutsig_0_4z } ^ celloutsig_0_0z;
  assign celloutsig_0_8z = { celloutsig_0_0z[6:2], celloutsig_0_4z } ^ { celloutsig_0_6z[4], celloutsig_0_3z };
  assign celloutsig_0_28z = { celloutsig_0_25z[3:0], celloutsig_0_15z } ^ { celloutsig_0_9z[4:1], celloutsig_0_26z };
  always_latch
    if (!clkin_data[96]) celloutsig_1_12z = 6'h00;
    else if (clkin_data[32]) celloutsig_1_12z = in_data[174:169];
  always_latch
    if (clkin_data[96]) celloutsig_1_14z = 23'h000000;
    else if (clkin_data[32]) celloutsig_1_14z = { celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_12z };
  always_latch
    if (clkin_data[64]) celloutsig_0_19z = 3'h0;
    else if (!clkin_data[0]) celloutsig_0_19z = celloutsig_0_5z[5:3];
  always_latch
    if (celloutsig_1_19z) celloutsig_0_32z = 7'h00;
    else if (!clkin_data[0]) celloutsig_0_32z = celloutsig_0_5z[12:6];
  assign { out_data[128], out_data[96], out_data[35:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_36z, celloutsig_0_37z[34:3] };
endmodule
