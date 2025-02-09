/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [7:0] celloutsig_0_0z;
  wire [5:0] celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire celloutsig_0_18z;
  wire [3:0] celloutsig_0_1z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  reg [20:0] celloutsig_0_2z;
  reg [5:0] celloutsig_0_3z;
  wire [3:0] celloutsig_0_4z;
  wire [9:0] celloutsig_0_5z;
  wire [12:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire [18:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [3:0] celloutsig_1_11z;
  wire [3:0] celloutsig_1_12z;
  wire [15:0] celloutsig_1_13z;
  wire [21:0] celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [37:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_10z = ~(celloutsig_1_6z & celloutsig_1_6z);
  assign celloutsig_1_18z = ~(celloutsig_1_6z & celloutsig_1_5z);
  assign celloutsig_1_4z = ~((celloutsig_1_1z | celloutsig_1_1z) & (celloutsig_1_0z[9] | celloutsig_1_2z));
  assign celloutsig_1_3z = celloutsig_1_0z[0] | ~(celloutsig_1_2z);
  assign celloutsig_0_29z = celloutsig_0_9z | ~(celloutsig_0_18z);
  assign celloutsig_1_14z = { celloutsig_1_13z[13:8], 1'h1, celloutsig_1_13z[6:1], celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_12z, celloutsig_1_9z } + { in_data[154:137], celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_8z };
  assign celloutsig_0_0z = in_data[7:0] & in_data[46:39];
  assign celloutsig_1_9z = { celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_2z } & { celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_1_11z = { celloutsig_1_9z[2:1], celloutsig_1_4z, celloutsig_1_2z } & { celloutsig_1_4z, celloutsig_1_9z };
  assign celloutsig_0_13z = celloutsig_0_5z[6:1] & { celloutsig_0_0z[5:1], celloutsig_0_7z };
  assign celloutsig_1_0z = in_data[160:142] & in_data[142:124];
  assign celloutsig_1_6z = ! celloutsig_1_0z[14:11];
  assign celloutsig_1_5z = in_data[110:107] < { celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_8z = { celloutsig_1_0z[1:0], celloutsig_1_6z } < { celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_3z };
  assign celloutsig_0_18z = { celloutsig_0_0z[6:4], celloutsig_0_15z } < celloutsig_0_4z;
  assign celloutsig_0_6z = { celloutsig_0_5z[6:4], celloutsig_0_5z } % { 1'h1, in_data[68:57] };
  assign celloutsig_0_1z = in_data[63:60] % { 1'h1, celloutsig_0_0z[6:4] };
  assign celloutsig_1_2z = in_data[176:172] != { in_data[125:122], celloutsig_1_1z };
  assign celloutsig_1_1z = celloutsig_1_0z[14:12] != in_data[164:162];
  assign celloutsig_0_9z = | { celloutsig_0_2z[17:16], celloutsig_0_3z };
  assign celloutsig_0_15z = ~^ celloutsig_0_13z[3:0];
  assign celloutsig_0_28z = ~^ in_data[91:74];
  assign celloutsig_1_7z = in_data[165:128] ~^ in_data[150:113];
  assign celloutsig_0_4z = in_data[43:40] ~^ celloutsig_0_1z;
  assign celloutsig_1_19z = celloutsig_1_7z[17:15] ~^ celloutsig_1_14z[7:5];
  assign celloutsig_1_12z = { celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_2z, celloutsig_1_6z } ^ { celloutsig_1_9z, celloutsig_1_5z };
  assign celloutsig_0_5z = in_data[74:65] ^ celloutsig_0_2z[12:3];
  assign celloutsig_0_7z = ~((celloutsig_0_6z[2] & celloutsig_0_5z[9]) | celloutsig_0_4z[2]);
  always_latch
    if (clkin_data[0]) celloutsig_0_3z = 6'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_3z = in_data[15:10];
  always_latch
    if (clkin_data[0]) celloutsig_0_2z = 21'h000000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_2z = { in_data[79:67], celloutsig_0_0z };
  assign { celloutsig_1_13z[1], celloutsig_1_13z[4:2], celloutsig_1_13z[5], celloutsig_1_13z[6], celloutsig_1_13z[0], celloutsig_1_13z[15:8] } = { celloutsig_1_10z, celloutsig_1_9z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_2z, in_data[117:110] } ~^ { celloutsig_1_11z[1], celloutsig_1_3z, celloutsig_1_11z[3:2], celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_11z[0], in_data[147:144], celloutsig_1_2z, celloutsig_1_9z };
  assign celloutsig_1_13z[7] = 1'h1;
  assign { out_data[128], out_data[98:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_28z, celloutsig_0_29z };
endmodule
