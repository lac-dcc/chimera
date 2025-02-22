/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  reg [3:0] celloutsig_0_10z;
  reg [24:0] celloutsig_0_11z;
  wire celloutsig_0_13z;
  wire [23:0] celloutsig_0_14z;
  wire [2:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_18z;
  wire [10:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [4:0] celloutsig_0_21z;
  wire celloutsig_0_2z;
  wire [2:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [8:0] celloutsig_0_6z;
  reg [4:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [13:0] celloutsig_1_11z;
  wire [20:0] celloutsig_1_14z;
  wire [6:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  reg [2:0] celloutsig_1_5z;
  wire [5:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_10z = celloutsig_1_1z ^ celloutsig_1_3z;
  assign celloutsig_0_8z = ~(celloutsig_0_0z ^ in_data[32]);
  assign celloutsig_1_1z = ~(in_data[106] ^ in_data[164]);
  assign celloutsig_0_4z = in_data[78:65] == { in_data[41:29], celloutsig_0_0z };
  assign celloutsig_0_9z = celloutsig_0_1z[4:0] <= { celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_8z };
  assign celloutsig_0_16z = { celloutsig_0_14z[8:1], celloutsig_0_13z } <= { celloutsig_0_7z[3:0], celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_9z };
  assign celloutsig_1_0z = in_data[131:124] <= in_data[180:173];
  assign celloutsig_1_11z = in_data[113:100] % { 1'h1, celloutsig_1_6z[4:0], celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_1z };
  assign celloutsig_1_14z = { celloutsig_1_6z[4:0], celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_0z } % { 1'h1, in_data[175:162], celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_8z };
  assign celloutsig_0_3z = in_data[9:7] % { 1'h1, in_data[23:22] };
  assign celloutsig_0_1z = in_data[10:0] % { 1'h1, in_data[53:44] };
  assign celloutsig_0_15z = celloutsig_0_6z[5:3] % { 1'h1, celloutsig_0_11z[2:1] };
  assign celloutsig_1_6z = in_data[145:140] % { 1'h1, in_data[113:110], celloutsig_1_1z };
  assign celloutsig_0_21z = - celloutsig_0_1z[4:0];
  assign celloutsig_1_8z = celloutsig_1_6z[2] & celloutsig_1_3z;
  assign celloutsig_1_9z = celloutsig_1_4z & celloutsig_1_0z;
  assign celloutsig_0_20z = ~^ { celloutsig_0_9z, celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_8z, celloutsig_0_18z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_7z };
  assign celloutsig_1_3z = ~^ { celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_18z = ^ { celloutsig_0_14z[16:9], celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_4z };
  assign celloutsig_1_4z = ^ { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_18z = in_data[176:170] ~^ celloutsig_1_11z[9:3];
  assign celloutsig_0_6z = { celloutsig_0_1z[6:2], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_0z } ~^ { in_data[31:29], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_0_14z = { celloutsig_0_11z[24:4], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z } ~^ { celloutsig_0_11z[15:13], celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_10z };
  assign celloutsig_0_0z = ~((in_data[13] & in_data[78]) | in_data[6]);
  assign celloutsig_1_19z = ~((celloutsig_1_6z[0] & celloutsig_1_2z) | celloutsig_1_14z[0]);
  assign celloutsig_0_5z = ~((celloutsig_0_3z[0] & celloutsig_0_4z) | celloutsig_0_0z);
  assign celloutsig_0_13z = ~((celloutsig_0_2z & in_data[7]) | celloutsig_0_1z[2]);
  assign celloutsig_1_2z = ~((celloutsig_1_1z & celloutsig_1_1z) | celloutsig_1_0z);
  assign celloutsig_0_2z = ~((in_data[36] & celloutsig_0_0z) | celloutsig_0_1z[7]);
  assign celloutsig_1_7z = ~((celloutsig_1_3z & celloutsig_1_2z) | celloutsig_1_4z);
  always_latch
    if (!clkin_data[64]) celloutsig_0_7z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_7z = celloutsig_0_1z[9:5];
  always_latch
    if (clkin_data[64]) celloutsig_0_10z = 4'h0;
    else if (clkin_data[0]) celloutsig_0_10z = { celloutsig_0_6z[4:2], celloutsig_0_2z };
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_11z = 25'h0000000;
    else if (clkin_data[0]) celloutsig_0_11z = in_data[32:8];
  always_latch
    if (clkin_data[96]) celloutsig_1_5z = 3'h0;
    else if (!clkin_data[32]) celloutsig_1_5z = { celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z };
  assign { out_data[134:128], out_data[96], out_data[32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_20z, celloutsig_0_21z };
endmodule
