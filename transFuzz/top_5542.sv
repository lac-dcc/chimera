/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [5:0] celloutsig_0_0z;
  reg [2:0] celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire [12:0] celloutsig_0_12z;
  wire [16:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire [3:0] celloutsig_0_15z;
  reg [12:0] celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [4:0] celloutsig_0_22z;
  wire [8:0] celloutsig_0_23z;
  wire [4:0] celloutsig_0_24z;
  wire [3:0] celloutsig_0_25z;
  wire [5:0] celloutsig_0_2z;
  wire [10:0] celloutsig_0_30z;
  wire [4:0] celloutsig_0_31z;
  wire [33:0] celloutsig_0_32z;
  reg [7:0] celloutsig_0_34z;
  wire celloutsig_0_37z;
  wire [2:0] celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [3:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [12:0] celloutsig_0_8z;
  wire [3:0] celloutsig_0_9z;
  wire [18:0] celloutsig_1_0z;
  reg [3:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [4:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [11:0] celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire [5:0] celloutsig_1_4z;
  reg [2:0] celloutsig_1_6z;
  wire [3:0] celloutsig_1_7z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_1z = ~celloutsig_1_0z[13];
  assign celloutsig_0_6z = ~celloutsig_0_4z;
  assign celloutsig_0_1z = ~in_data[73];
  assign celloutsig_0_3z = ~celloutsig_0_2z[5];
  assign celloutsig_1_7z = celloutsig_1_0z[11:8] + celloutsig_1_0z[10:7];
  assign celloutsig_0_13z = { celloutsig_0_12z[10:7], celloutsig_0_12z } + { celloutsig_0_5z[3], 1'h1, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_11z };
  assign celloutsig_0_14z = celloutsig_0_5z[3:1] + celloutsig_0_8z[11:9];
  assign celloutsig_0_15z = celloutsig_0_12z[6:3] + { celloutsig_0_11z[1], celloutsig_0_10z };
  assign celloutsig_0_31z = celloutsig_0_2z[5:1] + celloutsig_0_23z[7:3];
  assign celloutsig_0_37z = { celloutsig_0_32z[31:1], celloutsig_0_3z } && 1'h1;
  assign celloutsig_0_4z = { celloutsig_0_0z[4:0], celloutsig_0_3z, celloutsig_0_3z } && { celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_18z = 1'h1 && { celloutsig_0_15z[3:2], celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_17z, celloutsig_0_3z };
  assign celloutsig_0_19z = { celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_17z } && { celloutsig_0_9z[1:0], celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_17z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_5z };
  assign celloutsig_0_20z = { in_data[28:19], celloutsig_0_15z } && { celloutsig_0_0z[2], celloutsig_0_12z };
  assign celloutsig_1_3z = celloutsig_1_2z[9:0] * { celloutsig_1_0z[9:1], celloutsig_1_1z };
  assign celloutsig_1_19z = celloutsig_1_4z[5:1] * { celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_18z };
  assign celloutsig_0_24z = celloutsig_0_0z[4:0] * { celloutsig_0_11z[4:1], celloutsig_0_6z };
  assign celloutsig_1_18z = | { in_data[133:128], celloutsig_1_4z, celloutsig_1_17z };
  assign celloutsig_0_38z = { celloutsig_0_34z[0], celloutsig_0_19z, celloutsig_0_1z } >> celloutsig_0_32z[8:6];
  assign celloutsig_1_4z = celloutsig_1_2z[8:3] >> { celloutsig_1_3z[8:4], celloutsig_1_1z };
  assign celloutsig_0_9z = { celloutsig_0_2z[3:1], celloutsig_0_6z } >> { 2'h3, celloutsig_0_8z[0], 1'h1 };
  assign celloutsig_0_11z = { in_data[37:34], celloutsig_0_4z } >> { celloutsig_0_0z[4], celloutsig_0_10z, 1'h1 };
  assign celloutsig_0_12z = { 4'hf, celloutsig_0_8z[0], celloutsig_0_5z, celloutsig_0_5z } >> { celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_9z };
  assign celloutsig_0_22z = { celloutsig_0_17z[0], celloutsig_0_3z, celloutsig_0_17z } >> { celloutsig_0_14z[1:0], celloutsig_0_20z, celloutsig_0_1z, celloutsig_0_6z };
  assign celloutsig_0_25z = celloutsig_0_13z[6:3] >> celloutsig_0_22z[4:1];
  assign celloutsig_0_30z = { celloutsig_0_12z[10:6], celloutsig_0_0z } >> celloutsig_0_13z[10:0];
  assign celloutsig_0_0z = in_data[85:80] ~^ in_data[54:49];
  assign celloutsig_1_0z = in_data[151:133] ~^ in_data[150:132];
  assign celloutsig_1_2z = in_data[172:161] ~^ { celloutsig_1_0z[14:4], celloutsig_1_1z };
  assign celloutsig_0_2z = in_data[9:4] ~^ { celloutsig_0_0z[5:2], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_23z = { celloutsig_0_14z, celloutsig_0_0z } ~^ { celloutsig_0_13z[16:9], celloutsig_0_20z };
  assign celloutsig_0_5z = { celloutsig_0_0z[2:0], celloutsig_0_1z } ^ { celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_17z = celloutsig_0_13z[8:6] ^ { celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_4z };
  always_latch
    if (clkin_data[96]) celloutsig_1_6z = 3'h0;
    else if (!clkin_data[64]) celloutsig_1_6z = celloutsig_1_2z[9:7];
  always_latch
    if (!clkin_data[128]) celloutsig_1_17z = 4'h0;
    else if (!clkin_data[64]) celloutsig_1_17z = celloutsig_1_7z;
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_10z = 3'h0;
    else if (clkin_data[0]) celloutsig_0_10z = celloutsig_0_5z[2:0];
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_16z = 13'h0000;
    else if (clkin_data[0]) celloutsig_0_16z = { celloutsig_0_13z[3], celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_5z };
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_34z = 8'h00;
    else if (clkin_data[0]) celloutsig_0_34z = in_data[83:76];
  assign celloutsig_0_32z[15] = ~ celloutsig_0_15z[2];
  assign celloutsig_0_32z[16] = ~ celloutsig_0_15z[3];
  assign celloutsig_0_32z[17] = ~ celloutsig_0_25z[0];
  assign celloutsig_0_32z[18] = ~ celloutsig_0_25z[1];
  assign celloutsig_0_32z[19] = ~ celloutsig_0_25z[2];
  assign celloutsig_0_32z[20] = ~ celloutsig_0_25z[3];
  assign { celloutsig_0_8z[0], celloutsig_0_8z[12:7] } = { celloutsig_0_3z, in_data[25:20] } ~^ { celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_5z };
  assign { celloutsig_0_32z[33], celloutsig_0_32z[13:3], celloutsig_0_32z[30:27], celloutsig_0_32z[14], celloutsig_0_32z[26:21], celloutsig_0_32z[32], celloutsig_0_32z[0], celloutsig_0_32z[31], celloutsig_0_32z[1], celloutsig_0_32z[2] } = { celloutsig_0_31z[3], celloutsig_0_30z, celloutsig_0_25z, celloutsig_0_8z[0], celloutsig_0_8z[12:7], celloutsig_0_20z, celloutsig_0_20z, celloutsig_0_4z, celloutsig_0_3z, in_data[73] } ^ { celloutsig_0_24z[4], celloutsig_0_15z[0], celloutsig_0_16z[12:3], celloutsig_0_31z[4:1], celloutsig_0_15z[1], celloutsig_0_31z[0], celloutsig_0_31z, celloutsig_0_24z[3], celloutsig_0_16z[0], celloutsig_0_24z[2], celloutsig_0_16z[1], celloutsig_0_16z[2] };
  assign celloutsig_0_8z[6:1] = 6'h3f;
  assign { out_data[128], out_data[100:96], out_data[32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_37z, celloutsig_0_38z };
endmodule
