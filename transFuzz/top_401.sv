/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [3:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [4:0] celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [4:0] celloutsig_0_21z;
  wire celloutsig_0_24z;
  wire [2:0] celloutsig_0_25z;
  wire [14:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [2:0] celloutsig_0_5z;
  wire [12:0] celloutsig_0_6z;
  reg [22:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [15:0] celloutsig_1_10z;
  wire [23:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [15:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_12z = ~(celloutsig_0_4z & celloutsig_0_1z);
  assign celloutsig_1_0z = ~(in_data[142] & in_data[132]);
  assign celloutsig_1_6z = ~((celloutsig_1_5z | celloutsig_1_0z) & celloutsig_1_5z);
  assign celloutsig_1_18z = ~((in_data[125] | celloutsig_1_4z) & celloutsig_1_4z);
  assign celloutsig_0_14z = ~((celloutsig_0_9z | celloutsig_0_0z) & celloutsig_0_8z);
  assign celloutsig_0_20z = ~((celloutsig_0_14z | celloutsig_0_15z) & celloutsig_0_19z);
  assign celloutsig_1_1z = ~((in_data[114] | in_data[99]) & in_data[105]);
  assign celloutsig_0_4z = ~((celloutsig_0_1z | celloutsig_0_0z) & (celloutsig_0_0z | celloutsig_0_2z[0]));
  assign celloutsig_0_16z = celloutsig_0_12z | celloutsig_0_11z[3];
  assign celloutsig_0_19z = celloutsig_0_15z | celloutsig_0_5z[1];
  assign celloutsig_1_19z = celloutsig_1_15z[23:8] / { 1'h1, celloutsig_1_10z[10:3], celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_0z };
  assign celloutsig_0_6z = celloutsig_0_2z[13:1] / { 1'h1, in_data[22:11] };
  assign celloutsig_0_24z = celloutsig_0_7z[10:5] >= { celloutsig_0_14z, celloutsig_0_21z };
  assign celloutsig_1_15z = in_data[161:138] % { 1'h1, in_data[153:147], celloutsig_1_10z };
  assign celloutsig_0_11z = { celloutsig_0_6z[5], celloutsig_0_5z } % { 1'h1, celloutsig_0_6z[11:9] };
  assign celloutsig_1_7z = { in_data[175:172], celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_6z } != { celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_2z };
  assign celloutsig_0_9z = { celloutsig_0_6z[7:1], celloutsig_0_8z } != { celloutsig_0_7z[19:13], celloutsig_0_4z };
  assign celloutsig_1_8z = { celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_6z } | { celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_3z };
  assign celloutsig_1_3z = | in_data[104:102];
  assign celloutsig_0_1z = ~^ { in_data[64:59], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_3z = ^ celloutsig_0_2z[12:4];
  assign celloutsig_0_8z = ^ { in_data[16:9], celloutsig_0_7z };
  assign celloutsig_0_2z = in_data[41:27] >> { in_data[69:63], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_5z = { celloutsig_0_2z[11:10], celloutsig_0_1z } << { in_data[85:84], celloutsig_0_3z };
  assign celloutsig_0_21z = celloutsig_0_6z[8:4] << { celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_19z, celloutsig_0_16z };
  assign celloutsig_1_10z = { in_data[148:140], celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_0z } >> { in_data[140:126], celloutsig_1_1z };
  assign celloutsig_0_17z = { celloutsig_0_16z, celloutsig_0_15z, celloutsig_0_5z } >> { celloutsig_0_12z, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_15z, celloutsig_0_8z };
  assign celloutsig_0_25z = { celloutsig_0_8z, celloutsig_0_16z, celloutsig_0_20z } <<< { celloutsig_0_17z[2:1], celloutsig_0_24z };
  assign celloutsig_0_0z = ~((in_data[30] & in_data[6]) | in_data[2]);
  assign celloutsig_1_2z = ~((celloutsig_1_1z & celloutsig_1_1z) | celloutsig_1_0z);
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_7z = 23'h000000;
    else if (clkin_data[0]) celloutsig_0_7z = { celloutsig_0_2z[10:5], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_2z };
  assign celloutsig_1_5z = ~((celloutsig_1_3z & celloutsig_1_1z) | (celloutsig_1_0z & celloutsig_1_0z));
  assign celloutsig_0_15z = ~((celloutsig_0_11z[3] & celloutsig_0_2z[11]) | (celloutsig_0_7z[14] & celloutsig_0_0z));
  assign celloutsig_1_4z = ~((celloutsig_1_3z & celloutsig_1_3z) | (celloutsig_1_1z & celloutsig_1_1z));
  assign { out_data[128], out_data[111:96], out_data[32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_24z, celloutsig_0_25z };
endmodule
