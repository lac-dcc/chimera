/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [8:0] celloutsig_0_0z;
  wire celloutsig_0_1z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  reg [4:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_11z = !(celloutsig_1_0z ? celloutsig_1_2z : celloutsig_1_4z);
  assign celloutsig_1_2z = ~((celloutsig_1_0z | in_data[169]) & in_data[143]);
  assign celloutsig_1_5z = ~((celloutsig_1_0z | celloutsig_1_4z) & celloutsig_1_1z);
  assign celloutsig_1_7z = ~((celloutsig_1_2z | celloutsig_1_6z) & celloutsig_1_5z);
  assign celloutsig_1_0z = ~((in_data[163] | in_data[161]) & in_data[185]);
  assign celloutsig_1_8z = { in_data[103:102], celloutsig_1_6z } == { in_data[126], celloutsig_1_3z, celloutsig_1_7z };
  assign celloutsig_1_14z = { in_data[184:165], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_1z } == { in_data[172:142], celloutsig_1_2z };
  assign celloutsig_1_19z = { celloutsig_1_17z[3:1], celloutsig_1_12z } == { celloutsig_1_17z[4:2], celloutsig_1_0z };
  assign celloutsig_1_1z = ! in_data[169:163];
  assign celloutsig_1_4z = ! { celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_6z = ! { in_data[181:165], celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_9z = ! in_data[187:185];
  assign celloutsig_1_12z = ! { in_data[106:102], celloutsig_1_3z, celloutsig_1_7z };
  assign celloutsig_0_1z = ! celloutsig_0_0z[5:3];
  assign celloutsig_1_18z = ! { celloutsig_1_8z, celloutsig_1_11z, celloutsig_1_17z, celloutsig_1_14z };
  assign celloutsig_1_3z = ~((celloutsig_1_2z & celloutsig_1_0z) | in_data[106]);
  assign celloutsig_1_13z = ~((celloutsig_1_3z & celloutsig_1_11z) | celloutsig_1_8z);
  always_latch
    if (celloutsig_1_18z) celloutsig_0_0z = 9'h000;
    else if (!clkin_data[0]) celloutsig_0_0z = in_data[93:85];
  always_latch
    if (clkin_data[64]) celloutsig_1_17z = 5'h00;
    else if (!clkin_data[32]) celloutsig_1_17z = { celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_13z };
  assign { out_data[128], out_data[96], out_data[40:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_0z, celloutsig_0_1z };
endmodule
