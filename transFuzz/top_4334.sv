/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [10:0] celloutsig_0_10z;
  wire [6:0] celloutsig_0_13z;
  wire [6:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [23:0] celloutsig_0_1z;
  wire [4:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [14:0] celloutsig_0_5z;
  reg [7:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [2:0] celloutsig_0_9z;
  wire [3:0] celloutsig_1_0z;
  wire [42:0] celloutsig_1_10z;
  wire [4:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [8:0] celloutsig_1_13z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire [2:0] celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [5:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_4z = ~(celloutsig_0_0z | celloutsig_0_0z);
  assign celloutsig_1_3z = ~(celloutsig_1_2z | celloutsig_1_2z);
  assign celloutsig_0_13z = celloutsig_0_5z[6:0] / { 1'h1, celloutsig_0_2z[3:0], celloutsig_0_7z, celloutsig_0_7z };
  assign celloutsig_0_14z = { celloutsig_0_13z[6:1], celloutsig_0_4z } / { 1'h1, celloutsig_0_10z[5:3], celloutsig_0_9z };
  assign celloutsig_1_0z = in_data[129:126] / { 1'h1, in_data[132:130] };
  assign celloutsig_1_1z = celloutsig_1_0z[3:1] / { 1'h1, celloutsig_1_0z[1:0] };
  assign celloutsig_1_7z = celloutsig_1_5z[7:5] / { 1'h1, celloutsig_1_1z[1:0] };
  assign celloutsig_1_10z = { in_data[170:154], celloutsig_1_9z[5:2], celloutsig_1_9z[3:2], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_9z[5:2], celloutsig_1_9z[3:2] } / { 1'h1, in_data[184:147], celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_7z = in_data[27:6] <= celloutsig_0_1z[23:2];
  assign celloutsig_0_15z = celloutsig_0_10z[5:3] <= celloutsig_0_5z[11:9];
  assign celloutsig_1_4z = { celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z } <= { celloutsig_1_1z[2], celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_17z = { celloutsig_1_1z[2], celloutsig_1_2z, celloutsig_1_12z, celloutsig_1_6z } <= { celloutsig_1_1z[2:1], celloutsig_1_7z, celloutsig_1_12z };
  assign celloutsig_1_19z = { celloutsig_1_5z[7:6], celloutsig_1_17z, celloutsig_1_5z[8:5], 4'hf, celloutsig_1_5z[0] } <= { in_data[118:108], celloutsig_1_4z };
  assign celloutsig_1_2z = in_data[121:116] !== { in_data[172:170], celloutsig_1_1z };
  assign celloutsig_0_3z = in_data[32:23] !== { in_data[19:16], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_1_18z = { celloutsig_1_10z[33:25], celloutsig_1_11z } !== { celloutsig_1_13z[8], in_data[138:137], celloutsig_1_13z[5:0], celloutsig_1_0z, celloutsig_1_8z };
  assign celloutsig_0_9z = ~ celloutsig_0_6z[6:4];
  assign celloutsig_0_2z = ~ celloutsig_0_1z[20:16];
  assign celloutsig_0_0z = ^ in_data[76:74];
  assign celloutsig_1_8z = ^ { in_data[136:118], celloutsig_1_4z };
  assign celloutsig_1_12z = ^ in_data[113:100];
  assign celloutsig_0_5z = { in_data[13:3], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_4z } >> { in_data[88:80], celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_1_6z = celloutsig_1_1z >> celloutsig_1_5z[7:5];
  assign celloutsig_0_10z = { celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z } ^ { celloutsig_0_1z[14:9], celloutsig_0_2z };
  assign celloutsig_0_1z = { in_data[54:34], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } ^ in_data[56:33];
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_6z = 8'h00;
    else if (!clkin_data[0]) celloutsig_0_6z = { celloutsig_0_5z[2], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_4z };
  assign celloutsig_1_11z[0] = ~ celloutsig_1_3z;
  assign { celloutsig_1_5z[0], celloutsig_1_5z[8:5] } = { celloutsig_1_3z, in_data[120:117] } ~^ { celloutsig_1_4z, celloutsig_1_0z[2:0], celloutsig_1_4z };
  assign { celloutsig_1_9z[5:4], celloutsig_1_9z[2], celloutsig_1_9z[3] } = ~ { celloutsig_1_7z[1:0], celloutsig_1_4z, celloutsig_1_2z };
  assign celloutsig_1_11z[4:1] = celloutsig_1_5z[8:5] ^ { celloutsig_1_9z[2], celloutsig_1_9z[3:2], celloutsig_1_2z };
  assign { celloutsig_1_13z[8], celloutsig_1_13z[5:0] } = { in_data[139], in_data[136:131] } ~^ { celloutsig_1_5z[5], celloutsig_1_8z, celloutsig_1_11z };
  assign celloutsig_1_13z[7:6] = in_data[138:137];
  assign celloutsig_1_5z[4:1] = 4'hf;
  assign celloutsig_1_9z[1:0] = celloutsig_1_9z[3:2];
  assign { out_data[128], out_data[96], out_data[38:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_14z, celloutsig_0_15z };
endmodule
