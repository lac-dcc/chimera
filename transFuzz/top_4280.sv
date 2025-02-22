/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [11:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [4:0] celloutsig_0_14z;
  wire [19:0] celloutsig_0_15z;
  wire [5:0] celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  reg [24:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [14:0] celloutsig_0_23z;
  reg [15:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [15:0] celloutsig_0_29z;
  wire [2:0] celloutsig_0_2z;
  wire [2:0] celloutsig_0_32z;
  reg [6:0] celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire [10:0] celloutsig_0_37z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [4:0] celloutsig_0_4z;
  reg [2:0] celloutsig_0_51z;
  wire [6:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [18:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [4:0] celloutsig_1_11z;
  wire [3:0] celloutsig_1_13z;
  wire [4:0] celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [5:0] celloutsig_1_7z;
  wire [12:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_12z = ~(celloutsig_0_11z & celloutsig_0_7z);
  assign celloutsig_0_40z = ~((celloutsig_0_9z | celloutsig_0_20z) & celloutsig_0_11z);
  assign celloutsig_0_20z = ~((celloutsig_0_1z[1] | celloutsig_0_12z) & celloutsig_0_13z);
  assign celloutsig_0_22z = ~((celloutsig_0_15z[6] | celloutsig_0_12z) & celloutsig_0_3z);
  assign celloutsig_0_25z = ~((celloutsig_0_17z[1] | celloutsig_0_3z) & celloutsig_0_21z);
  assign celloutsig_0_35z = celloutsig_0_29z[6] | ~(celloutsig_0_29z[6]);
  assign celloutsig_1_3z = ~(in_data[134] ^ celloutsig_1_0z[15]);
  assign celloutsig_1_16z = ~(celloutsig_1_10z ^ celloutsig_1_6z);
  assign celloutsig_1_19z = ~(celloutsig_1_16z ^ celloutsig_1_18z);
  assign celloutsig_1_10z = celloutsig_1_2z >= celloutsig_1_2z;
  assign celloutsig_1_1z = in_data[126:102] > in_data[147:123];
  assign celloutsig_1_4z = { celloutsig_1_0z[9:7], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z } > { celloutsig_1_0z[14], celloutsig_1_2z };
  assign celloutsig_0_19z = { celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_12z, celloutsig_0_14z } > { in_data[83:67], celloutsig_0_10z };
  assign celloutsig_0_21z = { celloutsig_0_0z[4:1], celloutsig_0_11z } > { celloutsig_0_5z[3:0], celloutsig_0_3z };
  assign celloutsig_0_3z = ! celloutsig_0_1z[11:4];
  assign celloutsig_0_10z = ! celloutsig_0_0z[11:3];
  assign celloutsig_0_11z = ! { celloutsig_0_0z[6:3], celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_0_13z = { celloutsig_0_0z[7:0], celloutsig_0_9z, celloutsig_0_11z } || in_data[47:38];
  assign celloutsig_0_6z = celloutsig_0_4z[3:0] < in_data[8:5];
  assign celloutsig_0_7z = { celloutsig_0_1z[3:0], celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_4z } < { celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_0z = in_data[38:27] % { 1'h1, in_data[34:24] };
  assign celloutsig_0_2z = celloutsig_0_0z[2:0] % { 1'h1, in_data[87:86] };
  assign celloutsig_0_14z = celloutsig_0_8z[0] ? { celloutsig_0_0z[7:4], celloutsig_0_7z } : { celloutsig_0_10z, celloutsig_0_8z[2:1], 1'h0, celloutsig_0_13z };
  assign celloutsig_0_23z = celloutsig_0_2z[2] ? { celloutsig_0_15z[11:4], celloutsig_0_22z, celloutsig_0_19z, celloutsig_0_14z } : { celloutsig_0_0z[10:3], celloutsig_0_5z };
  assign celloutsig_0_41z = { celloutsig_0_29z[3:1], celloutsig_0_25z } != { celloutsig_0_14z[2:0], celloutsig_0_7z };
  assign celloutsig_1_5z = { in_data[137], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_4z } != { in_data[178:169], celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_9z = { celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_8z } != { celloutsig_1_0z[4:3], 1'h1, celloutsig_1_7z[4], 1'h1, celloutsig_1_7z[2], 1'h1, celloutsig_1_7z[0], celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_9z = { in_data[86:84], celloutsig_0_2z } != celloutsig_0_1z[8:3];
  assign celloutsig_0_26z = { celloutsig_0_8z[2:1], celloutsig_0_18z, celloutsig_0_23z } != { in_data[90:86], celloutsig_0_24z };
  assign celloutsig_0_4z = ~ { celloutsig_0_1z[6:5], celloutsig_0_2z };
  assign celloutsig_1_18z = | { celloutsig_1_14z, celloutsig_1_11z[1:0] };
  assign celloutsig_1_6z = ^ { celloutsig_1_0z[10:8], celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_0z = in_data[163:145] >> in_data[147:129];
  assign celloutsig_1_14z = { celloutsig_1_7z[0], celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_5z } >> { celloutsig_1_11z[3], celloutsig_1_13z };
  assign celloutsig_0_8z = celloutsig_0_2z >> { celloutsig_0_2z[1:0], celloutsig_0_6z };
  assign celloutsig_0_37z = { celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_33z, celloutsig_0_12z } <<< { celloutsig_0_24z[14], celloutsig_0_3z, celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_32z };
  assign celloutsig_0_15z = { celloutsig_0_5z[6], celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_14z, celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_3z, celloutsig_0_13z, celloutsig_0_5z } <<< { celloutsig_0_5z[1], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_0_32z = celloutsig_0_2z >>> celloutsig_0_8z;
  assign celloutsig_0_5z = in_data[45:39] >>> { in_data[70:69], celloutsig_0_4z };
  assign celloutsig_0_17z = { celloutsig_0_14z, celloutsig_0_9z } >>> { celloutsig_0_1z[10:9], celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_1_8z = { celloutsig_1_0z[15:7], celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_6z } - { in_data[154:145], celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_1_11z = { celloutsig_1_8z[3:1], celloutsig_1_10z, celloutsig_1_1z } - { celloutsig_1_0z[12:11], celloutsig_1_1z, celloutsig_1_10z, celloutsig_1_9z };
  assign celloutsig_1_13z = celloutsig_1_8z[8:5] - celloutsig_1_2z[3:0];
  assign celloutsig_0_29z = { in_data[25:24], celloutsig_0_13z, celloutsig_0_20z, celloutsig_0_0z } ~^ { celloutsig_0_1z[13:5], celloutsig_0_5z };
  assign celloutsig_1_2z = celloutsig_1_0z[12:8] ^ celloutsig_1_0z[18:14];
  assign celloutsig_0_18z = { celloutsig_0_15z[3:1], celloutsig_0_6z } ^ { celloutsig_0_0z[4:2], celloutsig_0_3z };
  always_latch
    if (clkin_data[32]) celloutsig_0_33z = 7'h00;
    else if (clkin_data[0]) celloutsig_0_33z = { celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_12z };
  always_latch
    if (clkin_data[32]) celloutsig_0_51z = 3'h0;
    else if (clkin_data[0]) celloutsig_0_51z = { celloutsig_0_32z[1:0], celloutsig_0_22z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_1z = 25'h0000000;
    else if (!clkin_data[0]) celloutsig_0_1z = in_data[32:8];
  always_latch
    if (celloutsig_1_18z) celloutsig_0_24z = 16'h0000;
    else if (clkin_data[0]) celloutsig_0_24z = { celloutsig_0_15z[13:3], celloutsig_0_14z };
  assign { out_data[33:32], out_data[37], out_data[35], out_data[36] } = { celloutsig_0_41z, celloutsig_0_35z, celloutsig_0_20z, celloutsig_0_7z, celloutsig_0_6z } ^ { celloutsig_0_6z, celloutsig_0_26z, celloutsig_0_37z[8], celloutsig_0_12z, celloutsig_0_40z };
  assign { celloutsig_1_7z[4], celloutsig_1_7z[2], celloutsig_1_7z[0] } = { celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z } ~^ { celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_3z };
  assign { celloutsig_1_7z[5], celloutsig_1_7z[3], celloutsig_1_7z[1] } = 3'h7;
  assign { out_data[128], out_data[96], out_data[34], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, 1'h0, celloutsig_0_51z };
endmodule
