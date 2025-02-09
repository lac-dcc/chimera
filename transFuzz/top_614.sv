/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [3:0] celloutsig_0_0z;
  wire celloutsig_0_1z;
  wire [3:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_18z;
  wire [11:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire [7:0] celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire [7:0] celloutsig_1_6z;
  wire [20:0] celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_0z = ~((in_data[100] | in_data[143]) & in_data[167]);
  assign celloutsig_1_2z = ~((in_data[185] | in_data[96]) & celloutsig_1_1z);
  assign celloutsig_1_3z = { in_data[182:175], celloutsig_1_0z, celloutsig_1_0z } / { 1'h1, in_data[121:113] };
  assign celloutsig_0_3z = { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z } == in_data[31:29];
  assign celloutsig_1_10z = { celloutsig_1_6z[6:5], celloutsig_1_0z, celloutsig_1_9z } == in_data[138:135];
  assign celloutsig_1_1z = in_data[161:141] > in_data[160:140];
  assign celloutsig_1_9z = { in_data[176:170], celloutsig_1_6z, celloutsig_1_4z } || in_data[142:120];
  assign celloutsig_1_6z = celloutsig_1_3z[7:0] % { 1'h1, celloutsig_1_4z[4:0], celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_5z = celloutsig_1_3z[3:0] * in_data[170:167];
  assign celloutsig_1_19z = - { celloutsig_1_7z[17:8], celloutsig_1_2z, celloutsig_1_10z };
  assign celloutsig_0_1z = | in_data[37:33];
  assign celloutsig_1_18z = ^ { celloutsig_1_7z[16:3], celloutsig_1_5z, celloutsig_1_1z };
  assign celloutsig_1_7z = { in_data[190:186], celloutsig_1_6z, celloutsig_1_4z } <<< { celloutsig_1_5z[2], celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_1_4z = celloutsig_1_3z[9:2] - celloutsig_1_3z[7:0];
  assign celloutsig_0_2z = in_data[15:12] ^ celloutsig_0_0z;
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_0z = 4'h0;
    else if (clkin_data[0]) celloutsig_0_0z = in_data[52:49];
  assign { out_data[128], out_data[107:96], out_data[35:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_2z, celloutsig_0_3z };
endmodule
