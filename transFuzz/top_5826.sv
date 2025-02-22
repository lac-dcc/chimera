/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [19:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [25:0] celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [10:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [3:0] celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire [2:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [15:0] celloutsig_0_25z;
  wire [7:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [3:0] celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_32z;
  wire [18:0] celloutsig_0_33z;
  wire [11:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_3z;
  reg [14:0] celloutsig_0_40z;
  wire [5:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire [4:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [2:0] celloutsig_0_51z;
  wire celloutsig_0_59z;
  wire [2:0] celloutsig_0_5z;
  wire celloutsig_0_68z;
  wire celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [11:0] celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire [7:0] celloutsig_1_19z;
  reg [15:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [3:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [6:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_6z = celloutsig_0_4z[4] ? celloutsig_0_0z : celloutsig_0_4z[4];
  assign celloutsig_0_8z = in_data[87] ? in_data[59] : celloutsig_0_2z;
  assign celloutsig_0_11z = in_data[41] ? celloutsig_0_3z : celloutsig_0_2z;
  assign celloutsig_0_16z = celloutsig_0_14z ? celloutsig_0_13z[2] : celloutsig_0_10z[5];
  assign celloutsig_0_23z = celloutsig_0_2z ? celloutsig_0_16z : celloutsig_0_11z;
  assign celloutsig_0_27z = celloutsig_0_6z ? celloutsig_0_2z : 1'h0;
  assign celloutsig_0_68z = celloutsig_0_12z[20] | celloutsig_0_59z;
  assign celloutsig_1_4z = celloutsig_1_1z[1] | celloutsig_1_1z[12];
  assign celloutsig_1_18z = celloutsig_1_13z | celloutsig_1_4z;
  assign celloutsig_0_14z = celloutsig_0_11z | celloutsig_0_4z[1];
  assign celloutsig_0_3z = celloutsig_0_0z ^ celloutsig_0_2z;
  assign celloutsig_0_49z = celloutsig_0_27z ^ celloutsig_0_48z[3];
  assign celloutsig_0_59z = celloutsig_0_51z[1] ^ celloutsig_0_4z[1];
  assign celloutsig_0_69z = celloutsig_0_49z ^ celloutsig_0_40z[7];
  assign celloutsig_1_2z = celloutsig_1_0z ^ celloutsig_1_1z[14];
  assign celloutsig_1_6z = celloutsig_1_2z ^ celloutsig_1_3z[1];
  assign celloutsig_1_9z = celloutsig_1_6z ^ celloutsig_1_3z[0];
  assign celloutsig_0_18z = celloutsig_0_15z[1] ^ celloutsig_0_0z;
  assign celloutsig_0_2z = in_data[10] ^ celloutsig_0_1z[2];
  assign celloutsig_1_5z = celloutsig_1_1z[8:2] / { 1'h1, celloutsig_1_1z[13:8] };
  assign celloutsig_1_11z = { in_data[191:184], celloutsig_1_3z } / { 1'h1, in_data[178:176], celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_10z, celloutsig_1_7z };
  assign celloutsig_0_28z = { celloutsig_0_10z[5:3], 1'h0 } / { 1'h1, celloutsig_0_20z[3:2], celloutsig_0_1z[1] };
  assign celloutsig_0_0z = in_data[22:18] && in_data[68:64];
  assign celloutsig_1_0z = in_data[129:118] && in_data[170:159];
  assign celloutsig_1_7z = { celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_3z } && { celloutsig_1_5z[4], celloutsig_1_4z, celloutsig_1_3z };
  assign celloutsig_1_10z = { celloutsig_1_5z[5:3], celloutsig_1_2z } && { celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_2z };
  assign celloutsig_0_32z = ! { celloutsig_0_1z[2:1], celloutsig_0_2z, celloutsig_0_17z };
  assign celloutsig_0_36z = ! celloutsig_0_35z[5:0];
  assign celloutsig_0_50z = ! { celloutsig_0_33z[13:2], celloutsig_0_36z, celloutsig_0_14z };
  assign celloutsig_1_13z = ! celloutsig_1_8z[2:0];
  assign celloutsig_0_4z = { in_data[6:3], celloutsig_0_0z } << { celloutsig_0_2z, celloutsig_0_1z[3:1], 1'h0 };
  assign celloutsig_0_48z = { celloutsig_0_13z[0], in_data[37], celloutsig_0_1z[3:1], 1'h0 } << celloutsig_0_10z[18:13];
  assign celloutsig_1_3z = { celloutsig_1_1z[9:8], celloutsig_1_2z, celloutsig_1_2z } << in_data[165:162];
  assign celloutsig_1_19z = celloutsig_1_11z[8:1] << { celloutsig_1_5z[4], celloutsig_1_18z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_0_13z = { celloutsig_0_5z[2:1], 1'h0 } << celloutsig_0_10z[18:16];
  assign celloutsig_0_33z = { celloutsig_0_17z[2:1], celloutsig_0_18z, celloutsig_0_25z } <<< { celloutsig_0_28z[3:2], celloutsig_0_32z, celloutsig_0_6z, celloutsig_0_22z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_26z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_35z = { in_data[73], celloutsig_0_20z[5:2], celloutsig_0_1z[1], celloutsig_0_0z, celloutsig_0_32z, celloutsig_0_28z } <<< { celloutsig_0_25z[10:0], celloutsig_0_8z };
  assign celloutsig_0_51z = celloutsig_0_40z[10:8] <<< { celloutsig_0_12z[25], celloutsig_0_11z, celloutsig_0_50z };
  assign celloutsig_0_12z = in_data[84:59] <<< { celloutsig_0_10z[19:7], in_data[41], celloutsig_0_10z[5:3], celloutsig_0_4z[2], celloutsig_0_10z[1:0], celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_15z = { celloutsig_0_5z[2:1], 1'h0, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_0z } <<< { celloutsig_0_2z, celloutsig_0_1z[3:1], 1'h0, celloutsig_0_5z[2:1], 1'h0, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_17z = { celloutsig_0_4z[4], celloutsig_0_4z[1], celloutsig_0_16z } <<< { celloutsig_0_1z[2:1], celloutsig_0_2z };
  assign celloutsig_0_25z = { celloutsig_0_13z[2:1], celloutsig_0_6z, celloutsig_0_4z[1], celloutsig_0_6z, celloutsig_0_15z } <<< { celloutsig_0_10z[19:7], in_data[41], celloutsig_0_10z[5:4] };
  assign celloutsig_1_8z = { celloutsig_1_5z[5:3], celloutsig_1_6z } ^ { celloutsig_1_3z[2:0], celloutsig_1_7z };
  assign celloutsig_0_22z = { celloutsig_0_12z[25], celloutsig_0_2z, celloutsig_0_8z } ^ { celloutsig_0_12z[12], celloutsig_0_14z, celloutsig_0_16z };
  assign celloutsig_0_26z = { celloutsig_0_14z, celloutsig_0_14z, celloutsig_0_23z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_22z } ^ { celloutsig_0_15z[5:0], celloutsig_0_8z, celloutsig_0_16z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_40z = 15'h0000;
    else if (clkin_data[0]) celloutsig_0_40z = { in_data[23:12], celloutsig_0_17z };
  always_latch
    if (clkin_data[96]) celloutsig_1_1z = 16'h0000;
    else if (!clkin_data[32]) celloutsig_1_1z = { in_data[154:140], celloutsig_1_0z };
  assign celloutsig_0_1z[3:1] = { in_data[15:14], celloutsig_0_0z } ^ in_data[31:29];
  assign celloutsig_0_5z[2:1] = in_data[74:73] ^ { celloutsig_0_3z, celloutsig_0_2z };
  assign { celloutsig_0_10z[5:3], celloutsig_0_10z[1], celloutsig_0_10z[19:7], celloutsig_0_10z[0] } = { celloutsig_0_1z[3:1], celloutsig_0_8z, in_data[54:42], celloutsig_0_0z } ^ { celloutsig_0_2z, celloutsig_0_4z[4:3], celloutsig_0_4z[1], celloutsig_0_1z[3:1], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_4z[1], celloutsig_0_3z, celloutsig_0_1z[3:1], celloutsig_0_4z[0] };
  assign { celloutsig_0_20z[4:2], celloutsig_0_20z[5] } = { celloutsig_0_1z[3:1], celloutsig_0_0z } ^ { in_data[81], celloutsig_0_1z[3:2], in_data[82] };
  assign { celloutsig_0_10z[6], celloutsig_0_10z[2] } = { in_data[41], celloutsig_0_4z[2] };
  assign celloutsig_0_1z[0] = 1'h0;
  assign celloutsig_0_20z[1:0] = { celloutsig_0_1z[1], celloutsig_0_0z };
  assign celloutsig_0_5z[0] = 1'h0;
  assign { out_data[128], out_data[103:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_68z, celloutsig_0_69z };
endmodule
