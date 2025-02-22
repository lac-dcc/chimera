/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  reg [3:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [10:0] celloutsig_0_15z;
  reg [13:0] celloutsig_0_16z;
  wire [7:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire [5:0] celloutsig_0_23z;
  wire [6:0] celloutsig_0_25z;
  wire [12:0] celloutsig_0_26z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [6:0] celloutsig_0_3z;
  wire [32:0] celloutsig_0_4z;
  wire [10:0] celloutsig_0_5z;
  wire [2:0] celloutsig_0_6z;
  wire [6:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire [11:0] celloutsig_1_18z;
  wire [8:0] celloutsig_1_19z;
  reg [8:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [29:0] celloutsig_1_4z;
  wire [21:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_19z = ~celloutsig_0_17z[2];
  assign celloutsig_0_20z = ~celloutsig_0_5z[1];
  assign celloutsig_1_8z = ~((celloutsig_1_1z[8] | in_data[154]) & (celloutsig_1_0z | celloutsig_1_4z[26]));
  assign celloutsig_0_14z = ~((celloutsig_0_11z | celloutsig_0_0z) & (celloutsig_0_1z | celloutsig_0_13z[2]));
  assign celloutsig_0_0z = in_data[80] | in_data[73];
  assign celloutsig_1_2z = in_data[111] | celloutsig_1_1z[4];
  assign celloutsig_1_12z = celloutsig_1_2z ^ celloutsig_1_11z[0];
  assign celloutsig_1_13z = ~(celloutsig_1_0z ^ celloutsig_1_8z);
  assign celloutsig_0_29z = ~(celloutsig_0_23z[3] ^ celloutsig_0_26z[2]);
  assign celloutsig_0_3z = { in_data[93:90], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z } + { in_data[9:4], celloutsig_0_0z };
  assign celloutsig_1_18z = in_data[127:116] & { celloutsig_1_5z[10:4], celloutsig_1_12z, celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_13z };
  assign celloutsig_0_7z = { celloutsig_0_4z[20:15], celloutsig_0_0z } & in_data[88:82];
  assign celloutsig_0_8z = { celloutsig_0_5z[6:0], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z } == { celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_12z = { celloutsig_0_6z[1:0], celloutsig_0_7z } == { celloutsig_0_3z[3], celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_0_22z = celloutsig_0_4z[21:13] == celloutsig_0_4z[29:21];
  assign celloutsig_0_10z = celloutsig_0_5z[9:6] > celloutsig_0_7z[6:3];
  assign celloutsig_1_6z = ! { in_data[101:96], celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_1_10z = { celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_8z } || { celloutsig_1_5z[3:1], celloutsig_1_7z };
  assign celloutsig_1_15z = celloutsig_1_11z || { celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_7z };
  assign celloutsig_0_30z = { celloutsig_0_16z[11:6], celloutsig_0_22z, celloutsig_0_29z, celloutsig_0_29z, celloutsig_0_20z } < { celloutsig_0_3z[3], celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_8z };
  assign celloutsig_0_1z = celloutsig_0_0z & ~(in_data[21]);
  assign celloutsig_0_23z = - celloutsig_0_15z[5:0];
  assign celloutsig_0_11z = in_data[39:35] !== celloutsig_0_5z[6:2];
  assign celloutsig_1_11z = in_data[167:165] | { celloutsig_1_1z[6:5], celloutsig_1_8z };
  assign celloutsig_1_19z = { celloutsig_1_18z[8:2], celloutsig_1_6z, celloutsig_1_10z } | { celloutsig_1_4z[18:16], celloutsig_1_11z, celloutsig_1_15z, celloutsig_1_6z, celloutsig_1_2z };
  assign celloutsig_0_26z = { celloutsig_0_4z[20:14], celloutsig_0_23z } | { celloutsig_0_5z[7:2], celloutsig_0_7z };
  assign celloutsig_0_36z = ^ { celloutsig_0_25z[2], celloutsig_0_19z, celloutsig_0_12z, celloutsig_0_1z };
  assign celloutsig_1_0z = ^ in_data[122:109];
  assign celloutsig_0_18z = ^ celloutsig_0_16z[11:3];
  assign celloutsig_1_5z = { celloutsig_1_4z[25:15], celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_0z } >> in_data[159:138];
  assign celloutsig_0_6z = { celloutsig_0_5z[5:4], celloutsig_0_1z } >> in_data[17:15];
  assign celloutsig_0_15z = celloutsig_0_4z[20:10] << { celloutsig_0_4z[24:15], celloutsig_0_2z };
  assign celloutsig_1_4z = { in_data[183:155], celloutsig_1_0z } >> { in_data[126:106], celloutsig_1_1z };
  assign celloutsig_0_5z = in_data[62:52] <<< { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_25z = celloutsig_0_17z[7:1] <<< { in_data[32:27], celloutsig_0_14z };
  assign celloutsig_0_4z = { in_data[33:2], celloutsig_0_0z } ~^ in_data[78:46];
  assign celloutsig_0_17z = { celloutsig_0_4z[31:29], celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_6z } ~^ { in_data[60:58], celloutsig_0_1z, celloutsig_0_13z };
  assign celloutsig_0_35z = ~((celloutsig_0_18z & celloutsig_0_25z[6]) | celloutsig_0_30z);
  assign celloutsig_1_3z = ~((in_data[163] & in_data[145]) | in_data[156]);
  assign celloutsig_1_7z = ~((celloutsig_1_1z[3] & celloutsig_1_6z) | celloutsig_1_0z);
  assign celloutsig_0_9z = ~((celloutsig_0_4z[4] & celloutsig_0_0z) | celloutsig_0_8z);
  assign celloutsig_0_2z = ~((celloutsig_0_1z & celloutsig_0_1z) | celloutsig_0_0z);
  always_latch
    if (clkin_data[96]) celloutsig_1_1z = 9'h000;
    else if (!clkin_data[0]) celloutsig_1_1z = in_data[129:121];
  always_latch
    if (!clkin_data[64]) celloutsig_0_13z = 4'h0;
    else if (celloutsig_1_18z[0]) celloutsig_0_13z = { celloutsig_0_4z[13], celloutsig_0_6z };
  always_latch
    if (clkin_data[32]) celloutsig_0_16z = 14'h0000;
    else if (!celloutsig_1_18z[0]) celloutsig_0_16z = { celloutsig_0_6z[2:1], celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_10z };
  assign { out_data[139:128], out_data[104:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_35z, celloutsig_0_36z };
endmodule
