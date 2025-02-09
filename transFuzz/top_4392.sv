/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_12z;
  wire [3:0] celloutsig_0_15z;
  reg [2:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [6:0] celloutsig_0_18z;
  wire [7:0] celloutsig_0_19z;
  wire [9:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire [4:0] celloutsig_0_4z;
  wire [2:0] celloutsig_0_5z;
  wire [2:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [11:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [2:0] celloutsig_1_15z;
  wire [12:0] celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire [34:0] celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [6:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_10z = !(1'h1 ? celloutsig_1_8z[6] : celloutsig_1_4z[6]);
  assign celloutsig_1_15z = { celloutsig_1_2z[1], 1'h1, celloutsig_1_12z } + { celloutsig_1_11z[8:7], celloutsig_1_1z };
  assign celloutsig_1_6z = { celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_1z } / { 1'h1, celloutsig_1_4z[14:11] };
  assign celloutsig_1_7z = { celloutsig_1_0z, celloutsig_1_6z } == celloutsig_1_2z[6:1];
  assign celloutsig_0_9z = celloutsig_0_1z[8:4] >= { celloutsig_0_4z[4:1], celloutsig_0_7z };
  assign celloutsig_1_0z = in_data[147:135] >= in_data[154:142];
  assign celloutsig_1_1z = { in_data[158:150], celloutsig_1_0z, celloutsig_1_0z } > in_data[172:162];
  assign celloutsig_1_9z = { celloutsig_1_4z[1], celloutsig_1_0z, celloutsig_1_3z } > celloutsig_1_6z;
  assign celloutsig_0_12z = ! in_data[47:16];
  assign celloutsig_0_0z = in_data[55:46] < in_data[27:18];
  assign celloutsig_1_12z = { celloutsig_1_4z[25:1], celloutsig_1_10z, celloutsig_1_10z } < { celloutsig_1_4z[8:1], celloutsig_1_2z[8:1], 1'h1, celloutsig_1_9z, celloutsig_1_2z[8:1], 1'h1 };
  assign celloutsig_0_3z = { celloutsig_0_1z[8:3], celloutsig_0_1z } < { celloutsig_0_1z[5:1], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_20z = celloutsig_0_9z & ~(celloutsig_0_18z[6]);
  assign celloutsig_1_18z = celloutsig_1_8z[3] ? { celloutsig_1_4z[21:13], celloutsig_1_1z, celloutsig_1_3z } : { celloutsig_1_11z, celloutsig_1_10z };
  assign celloutsig_0_5z = celloutsig_0_2z ? celloutsig_0_1z[7:5] : { celloutsig_0_4z[2:1], 1'h1 };
  assign celloutsig_0_1z = in_data[57] ? { in_data[63:58], 1'h1, in_data[56:54] } : in_data[55:46];
  assign celloutsig_1_3z = in_data[188] ? in_data[103:101] : { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_2z = in_data[94:92] != { in_data[85], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_19z = ~ celloutsig_1_15z;
  assign celloutsig_1_4z = ~ in_data[154:120];
  assign celloutsig_1_11z = ~ { celloutsig_1_4z[16:13], celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_0_7z = & celloutsig_0_4z[4:2];
  assign celloutsig_0_17z = | celloutsig_0_1z[6:1];
  assign celloutsig_0_19z = { in_data[12:10], celloutsig_0_15z, celloutsig_0_12z } << { celloutsig_0_1z[5:0], celloutsig_0_9z, celloutsig_0_0z };
  assign celloutsig_0_15z = { celloutsig_0_5z[1:0], celloutsig_0_9z, celloutsig_0_5z[2] } - celloutsig_0_1z[3:0];
  assign celloutsig_1_5z = in_data[160:157] - { in_data[178], celloutsig_1_3z };
  assign celloutsig_0_6z = celloutsig_0_4z[4:2] ~^ { celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_2z };
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_16z = 3'h0;
    else if (clkin_data[0]) celloutsig_0_16z = celloutsig_0_6z;
  assign celloutsig_0_4z[4:1] = celloutsig_0_1z[6:3] ~^ in_data[41:38];
  assign { celloutsig_0_18z[6:5], celloutsig_0_18z[0], celloutsig_0_18z[1] } = { celloutsig_0_15z[0], celloutsig_0_5z[2], celloutsig_0_5z[2], celloutsig_0_7z } ~^ { celloutsig_0_16z[1:0], celloutsig_0_0z, celloutsig_0_17z };
  assign { celloutsig_1_2z[4:1], celloutsig_1_2z[8:5] } = { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, in_data[150:147] } ~^ { in_data[170:167], in_data[174:171] };
  assign celloutsig_1_8z[6:1] = celloutsig_1_2z[8:3] ~^ { celloutsig_1_6z[4], celloutsig_1_5z, celloutsig_1_7z };
  assign celloutsig_0_18z[4:2] = 3'h7;
  assign celloutsig_0_4z[0] = 1'h1;
  assign celloutsig_1_2z[0] = 1'h1;
  assign celloutsig_1_8z[0] = 1'h1;
  assign { out_data[140:128], out_data[98:96], out_data[39:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_19z, celloutsig_0_20z };
endmodule
