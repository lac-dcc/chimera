/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_13z;
  wire [17:0] celloutsig_0_14z;
  wire [24:0] celloutsig_0_15z;
  wire [11:0] celloutsig_0_17z;
  wire [34:0] celloutsig_0_18z;
  reg [3:0] celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [5:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [33:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [10:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [4:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire [5:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_19z = ~(celloutsig_1_13z & celloutsig_1_15z);
  assign celloutsig_0_10z = ~(celloutsig_0_1z[1] & celloutsig_0_5z);
  assign celloutsig_1_11z = ~((celloutsig_1_6z | celloutsig_1_3z) & celloutsig_1_8z[0]);
  assign celloutsig_0_7z = ~((celloutsig_0_6z[0] | in_data[70]) & celloutsig_0_3z);
  assign celloutsig_0_0z = ~((in_data[0] | in_data[73]) & (in_data[42] | in_data[51]));
  assign celloutsig_0_11z = ~((celloutsig_0_7z | celloutsig_0_6z[4]) & (celloutsig_0_5z | celloutsig_0_1z[0]));
  assign celloutsig_1_16z = in_data[187] | ~(celloutsig_1_12z[3]);
  assign celloutsig_0_9z = celloutsig_0_3z | ~(celloutsig_0_8z[4]);
  assign celloutsig_1_17z = celloutsig_1_16z ^ celloutsig_1_0z[7];
  assign celloutsig_0_2z = ~(in_data[26] ^ celloutsig_0_1z[2]);
  assign celloutsig_1_15z = ~(celloutsig_1_2z ^ celloutsig_1_9z);
  assign celloutsig_0_4z = ~(in_data[53] ^ in_data[38]);
  assign celloutsig_1_1z = ~(celloutsig_1_0z[4] ^ celloutsig_1_0z[2]);
  assign celloutsig_1_5z = ~(in_data[164] ^ in_data[150]);
  assign celloutsig_0_14z = in_data[21:4] + { celloutsig_0_8z[26:19], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_9z };
  assign celloutsig_1_9z = { celloutsig_1_0z[8:1], celloutsig_1_7z, celloutsig_1_1z } == { in_data[126:116], celloutsig_1_6z };
  assign celloutsig_1_13z = { celloutsig_1_4z, celloutsig_1_9z } === { celloutsig_1_4z[3:0], celloutsig_1_6z, celloutsig_1_11z };
  assign celloutsig_0_3z = in_data[55:36] === in_data[78:59];
  assign celloutsig_0_5z = { in_data[85:74], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_2z } === { in_data[66:47], celloutsig_0_3z };
  assign celloutsig_0_13z = celloutsig_0_8z[27:14] === in_data[13:0];
  assign celloutsig_1_10z = { celloutsig_1_8z[5:1], celloutsig_1_7z } || { celloutsig_1_0z[2], celloutsig_1_5z, celloutsig_1_8z };
  assign celloutsig_1_2z = in_data[111:105] < celloutsig_1_0z[6:0];
  assign celloutsig_0_8z = { in_data[40:9], celloutsig_0_7z, celloutsig_0_4z } % { 1'h1, in_data[52:21], celloutsig_0_5z };
  assign celloutsig_1_8z = { in_data[145:143], celloutsig_1_7z } % { 1'h1, celloutsig_1_0z[4:2], celloutsig_1_6z, celloutsig_1_5z };
  assign celloutsig_1_12z = { celloutsig_1_2z, celloutsig_1_9z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_10z } >> { celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_9z, celloutsig_1_11z };
  assign celloutsig_0_15z = { celloutsig_0_8z[18:15], celloutsig_0_14z, celloutsig_0_13z, 1'h0, celloutsig_0_9z } >> celloutsig_0_8z[27:3];
  assign celloutsig_1_4z = { celloutsig_1_0z[6:4], celloutsig_1_3z, celloutsig_1_1z } >> { in_data[113:110], celloutsig_1_1z };
  assign celloutsig_0_18z = { celloutsig_0_8z, celloutsig_0_2z } >>> { celloutsig_0_8z[11], celloutsig_0_11z, celloutsig_0_4z, 1'h0, celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_6z = { celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_1z } ^ { celloutsig_0_1z[3], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_2z };
  assign celloutsig_0_17z = celloutsig_0_14z[17:6] ^ { celloutsig_0_14z[9:2], celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_0z };
  assign celloutsig_1_0z = in_data[138:128] ^ in_data[187:177];
  assign celloutsig_1_7z = { celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_2z } ^ celloutsig_1_0z[9:7];
  always_latch
    if (out_data[130]) celloutsig_0_1z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_1z = { in_data[61:59], celloutsig_0_0z };
  assign celloutsig_1_3z = ~((in_data[173] & celloutsig_1_1z) | (celloutsig_1_2z & celloutsig_1_1z));
  assign celloutsig_1_6z = ~((celloutsig_1_5z & celloutsig_1_1z) | (in_data[166] & celloutsig_1_5z));
  assign { out_data[131], out_data[129], out_data[130], out_data[139:132] } = ~ { celloutsig_1_17z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_0z[9:2] };
  assign { out_data[128], out_data[96], out_data[43:0] } = { out_data[130], celloutsig_1_19z, celloutsig_0_17z, celloutsig_0_18z[33:2] };
endmodule
