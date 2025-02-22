/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [10:0] celloutsig_0_13z;
  wire [10:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  reg [30:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [10:0] celloutsig_0_1z;
  reg [2:0] celloutsig_0_20z;
  wire [3:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  reg [3:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [8:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [11:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [20:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  reg [8:0] celloutsig_0_34z;
  wire [10:0] celloutsig_0_35z;
  wire celloutsig_0_3z;
  wire [8:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [15:0] celloutsig_1_0z;
  wire [5:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  reg [16:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire [6:0] celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [6:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_5z = celloutsig_0_1z[2] ? in_data[43] : celloutsig_0_0z;
  assign celloutsig_0_6z = celloutsig_0_0z ? celloutsig_0_2z : in_data[55];
  assign celloutsig_0_12z = celloutsig_0_9z ? celloutsig_0_6z : celloutsig_0_10z;
  assign celloutsig_0_24z = celloutsig_0_23z[2] ? celloutsig_0_7z : celloutsig_0_15z;
  assign celloutsig_1_4z = !(celloutsig_1_1z[3] ? celloutsig_1_1z[3] : celloutsig_1_2z[1]);
  assign celloutsig_0_10z = celloutsig_0_7z | celloutsig_0_3z;
  assign celloutsig_0_18z = celloutsig_0_9z | celloutsig_0_5z;
  assign celloutsig_0_7z = ~(celloutsig_0_2z ^ in_data[18]);
  assign celloutsig_0_32z = { celloutsig_0_27z[10:6], celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_4z } == { celloutsig_0_27z[8:2], celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_18z, celloutsig_0_7z, celloutsig_0_8z };
  assign celloutsig_1_18z = celloutsig_1_16z[8:5] == celloutsig_1_1z[6:3];
  assign celloutsig_0_8z = { in_data[14:4], celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_2z } == { in_data[92:82], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_11z = { celloutsig_0_1z[3:2], celloutsig_0_3z } == { celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_9z };
  assign celloutsig_0_16z = { celloutsig_0_1z[10:3], celloutsig_0_0z } == { celloutsig_0_1z[9:3], celloutsig_0_0z, celloutsig_0_11z };
  assign celloutsig_0_26z = celloutsig_0_17z[15:9] == { celloutsig_0_23z, celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_28z = { celloutsig_0_23z[0], celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_19z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_15z, celloutsig_0_0z, celloutsig_0_14z, celloutsig_0_3z } == { celloutsig_0_13z[9:3], celloutsig_0_14z, celloutsig_0_22z, celloutsig_0_15z };
  assign celloutsig_0_9z = in_data[86:53] >= { in_data[48:41], celloutsig_0_3z, celloutsig_0_1z[10:1], celloutsig_0_1z[1], celloutsig_0_1z[10:1], celloutsig_0_1z[1], celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_0_22z = { celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_11z } >= { celloutsig_0_17z[23:9], celloutsig_0_5z };
  assign celloutsig_0_3z = celloutsig_0_1z[6:3] >= celloutsig_0_1z[9:6];
  assign celloutsig_1_6z = { celloutsig_1_3z[1:0], celloutsig_1_2z } % { 1'h1, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_1_13z = { celloutsig_1_6z[6:2], celloutsig_1_4z } % { 1'h1, celloutsig_1_6z[4:0] };
  assign celloutsig_1_2z = celloutsig_1_1z[4:0] % { 1'h1, in_data[150:147] };
  assign celloutsig_0_19z = celloutsig_0_13z[8:5] != { celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_16z, celloutsig_0_10z };
  assign celloutsig_1_3z = ~ celloutsig_1_1z[4:2];
  assign celloutsig_0_13z = { celloutsig_0_1z[8:3], celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_0z } | { celloutsig_0_1z[9:1], celloutsig_0_1z[1], celloutsig_0_11z };
  assign celloutsig_0_2z = | { in_data[63:62], celloutsig_0_0z };
  assign celloutsig_0_0z = in_data[3] & in_data[68];
  assign celloutsig_0_29z = celloutsig_0_28z & celloutsig_0_21z[0];
  assign celloutsig_0_31z = ~^ { celloutsig_0_29z, celloutsig_0_14z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_20z, celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_6z };
  assign celloutsig_0_44z = ^ celloutsig_0_17z[20:18];
  assign celloutsig_1_7z = ^ celloutsig_1_2z[4:1];
  assign celloutsig_1_14z = ^ { celloutsig_1_13z[4:2], celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_1z };
  assign celloutsig_1_1z = in_data[157:151] << celloutsig_1_0z[9:3];
  assign celloutsig_1_19z = { celloutsig_1_0z[7], celloutsig_1_4z, celloutsig_1_18z } << celloutsig_1_16z[8:6];
  assign celloutsig_0_21z = { celloutsig_0_14z[3:1], celloutsig_0_3z } << celloutsig_0_17z[22:19];
  assign celloutsig_0_25z = celloutsig_0_14z[10:2] << { celloutsig_0_1z[10:6], celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_16z, celloutsig_0_6z };
  assign celloutsig_0_27z = { celloutsig_0_16z, celloutsig_0_20z, celloutsig_0_0z, celloutsig_0_21z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_7z } << { celloutsig_0_25z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_26z };
  assign celloutsig_0_35z = celloutsig_0_14z >> { celloutsig_0_34z[8:5], celloutsig_0_24z, celloutsig_0_31z, celloutsig_0_32z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_22z };
  assign celloutsig_0_43z = { celloutsig_0_35z[8], celloutsig_0_4z, celloutsig_0_26z, celloutsig_0_12z, celloutsig_0_23z, celloutsig_0_32z } >> celloutsig_0_30z[16:8];
  assign celloutsig_1_0z = in_data[134:119] ~^ in_data[133:118];
  assign celloutsig_0_14z = { celloutsig_0_13z[9:6], celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_2z } ~^ { celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_30z = in_data[76:56] ~^ { in_data[37:21], celloutsig_0_20z, celloutsig_0_2z };
  assign celloutsig_0_4z = ~((celloutsig_0_2z & celloutsig_0_3z) | celloutsig_0_3z);
  assign celloutsig_0_15z = ~((celloutsig_0_3z & celloutsig_0_3z) | celloutsig_0_1z[9]);
  always_latch
    if (!clkin_data[64]) celloutsig_0_34z = 9'h000;
    else if (!celloutsig_1_18z) celloutsig_0_34z = { in_data[51:44], celloutsig_0_24z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_16z = 17'h00000;
    else if (!clkin_data[0]) celloutsig_1_16z = { in_data[191:184], celloutsig_1_14z, celloutsig_1_3z, celloutsig_1_14z, celloutsig_1_3z, celloutsig_1_14z };
  always_latch
    if (clkin_data[96]) celloutsig_0_17z = 31'h00000000;
    else if (celloutsig_1_18z) celloutsig_0_17z = { in_data[88:62], celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_10z };
  always_latch
    if (clkin_data[96]) celloutsig_0_20z = 3'h0;
    else if (celloutsig_1_18z) celloutsig_0_20z = { celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_11z };
  always_latch
    if (clkin_data[96]) celloutsig_0_23z = 4'h0;
    else if (celloutsig_1_18z) celloutsig_0_23z = { celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_18z, celloutsig_0_9z };
  assign celloutsig_0_1z[10:1] = ~ { in_data[23:15], celloutsig_0_0z };
  assign celloutsig_0_1z[0] = celloutsig_0_1z[1];
  assign { out_data[128], out_data[98:96], out_data[40:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_43z, celloutsig_0_44z };
endmodule
