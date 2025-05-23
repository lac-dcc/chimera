/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [3:0] celloutsig_0_11z;
  reg [6:0] celloutsig_0_12z;
  wire [10:0] celloutsig_0_13z;
  reg [2:0] celloutsig_0_14z;
  reg [6:0] celloutsig_0_16z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [13:0] celloutsig_0_25z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire [7:0] celloutsig_0_43z;
  wire celloutsig_0_4z;
  wire [6:0] celloutsig_0_5z;
  reg [18:0] celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [3:0] celloutsig_0_8z;
  wire [7:0] celloutsig_0_91z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [3:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [2:0] celloutsig_1_16z;
  wire [7:0] celloutsig_1_17z;
  wire [4:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [5:0] celloutsig_1_1z;
  wire [20:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [8:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [23:0] celloutsig_1_8z;
  wire [14:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_4z = celloutsig_0_1z ^ celloutsig_0_2z;
  assign celloutsig_1_5z = celloutsig_1_4z[2] ^ celloutsig_1_0z;
  assign celloutsig_0_21z = celloutsig_0_9z ^ celloutsig_0_20z;
  assign celloutsig_0_9z = { in_data[33:18], celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_0z } == { in_data[85:67], celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_4z };
  assign celloutsig_1_6z = in_data[123:101] == in_data[160:138];
  assign celloutsig_1_10z = { celloutsig_1_8z[15:13], celloutsig_1_8z[21:13], celloutsig_1_8z[23], celloutsig_1_8z[2], celloutsig_1_8z[23] } == { in_data[111:98], celloutsig_1_7z };
  assign celloutsig_1_19z = celloutsig_1_9z[4:0] == { celloutsig_1_4z[4:1], celloutsig_1_10z };
  assign celloutsig_0_20z = { celloutsig_0_13z[4], celloutsig_0_3z, celloutsig_0_9z } == { celloutsig_0_11z[3:2], 1'h1 };
  assign celloutsig_0_10z = in_data[41:29] > { celloutsig_0_5z[4:0], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_3z };
  assign celloutsig_1_3z = { in_data[163:128], celloutsig_1_0z } > { in_data[176:144], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_7z = ! { in_data[93:92], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_2z = ! { in_data[53:47], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_19z = ! { celloutsig_0_18z[2], celloutsig_0_14z, celloutsig_0_12z };
  assign celloutsig_0_6z = { in_data[12:4], celloutsig_0_4z } < in_data[67:58];
  assign celloutsig_1_13z = { celloutsig_1_2z[20], celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_1z } < { celloutsig_1_8z[18:14], celloutsig_1_3z, celloutsig_1_12z, celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_10z, celloutsig_1_10z };
  assign celloutsig_0_11z = celloutsig_0_6z ? { in_data[10:9], celloutsig_0_3z, celloutsig_0_2z } : celloutsig_0_5z[3:0];
  assign celloutsig_1_16z = celloutsig_1_5z ? celloutsig_1_11z[3:1] : celloutsig_1_9z[10:8];
  assign celloutsig_1_17z = celloutsig_1_0z ? { celloutsig_1_9z[1], celloutsig_1_6z, celloutsig_1_1z } : { celloutsig_1_8z[15:13], celloutsig_1_8z[23], celloutsig_1_16z, celloutsig_1_6z };
  assign celloutsig_0_18z = celloutsig_0_7z ? celloutsig_0_16z[3:0] : { celloutsig_0_8z[3:1], 1'h0 };
  assign celloutsig_0_5z = ~ { in_data[51:48], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_43z = ~ celloutsig_0_25z[8:1];
  assign celloutsig_1_1z = ~ in_data[118:113];
  assign celloutsig_1_2z = ~ in_data[130:110];
  assign celloutsig_1_4z = ~ in_data[164:156];
  assign celloutsig_1_9z = ~ in_data[137:123];
  assign celloutsig_0_25z = ~ { celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_19z };
  assign celloutsig_0_0z = | in_data[58:35];
  assign celloutsig_1_7z = | { celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_6z };
  assign celloutsig_0_1z = | { in_data[79:75], celloutsig_0_0z };
  assign celloutsig_1_0z = in_data[140] & in_data[168];
  assign celloutsig_1_12z = celloutsig_1_10z & celloutsig_1_8z[14];
  assign celloutsig_0_3z = celloutsig_0_0z & in_data[64];
  assign celloutsig_0_8z = { in_data[81:80], celloutsig_0_6z, celloutsig_0_2z } <<< { celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_11z = { celloutsig_1_9z[14:13], celloutsig_1_10z, celloutsig_1_10z } <<< celloutsig_1_9z[3:0];
  assign celloutsig_0_91z = celloutsig_0_67z[15:8] - celloutsig_0_25z[7:0];
  assign celloutsig_1_18z = { celloutsig_1_8z[13], celloutsig_1_8z[21:18] } - { celloutsig_1_17z[3:2], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_13z };
  assign celloutsig_0_13z = { in_data[73:71], celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_10z } - { celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_10z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_67z = 19'h00000;
    else if (clkin_data[0]) celloutsig_0_67z = { celloutsig_0_13z[10:9], celloutsig_0_43z, celloutsig_0_12z, celloutsig_0_21z, celloutsig_0_19z };
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_12z = 7'h00;
    else if (!clkin_data[0]) celloutsig_0_12z = { celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_1z };
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_14z = 3'h0;
    else if (!clkin_data[0]) celloutsig_0_14z = celloutsig_0_13z[10:8];
  always_latch
    if (celloutsig_1_19z) celloutsig_0_16z = 7'h00;
    else if (clkin_data[0]) celloutsig_0_16z = { celloutsig_0_5z[6:2], celloutsig_0_7z, celloutsig_0_6z };
  assign { celloutsig_1_8z[2], celloutsig_1_8z[23], celloutsig_1_8z[21:13], celloutsig_1_8z[0] } = ~ { celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_3z };
  assign { celloutsig_1_8z[22], celloutsig_1_8z[12:3], celloutsig_1_8z[1] } = { celloutsig_1_8z[23], celloutsig_1_8z[21:13], celloutsig_1_8z[23], celloutsig_1_8z[23] };
  assign { out_data[132:128], out_data[96], out_data[32], out_data[7:0] } = { celloutsig_1_18z, celloutsig_1_19z, 1'h1, celloutsig_0_91z };
endmodule
