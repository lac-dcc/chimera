/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [7:0] celloutsig_0_0z;
  wire celloutsig_0_1z;
  reg [2:0] celloutsig_0_2z;
  reg [7:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [4:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [7:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_3z = celloutsig_1_2z[7] ? celloutsig_1_1z : celloutsig_1_0z[3];
  assign celloutsig_1_5z = ~((celloutsig_1_3z | celloutsig_1_2z[6]) & celloutsig_1_2z[2]);
  assign celloutsig_0_1z = ~((celloutsig_0_0z[5] | celloutsig_0_0z[5]) & celloutsig_0_0z[1]);
  assign celloutsig_1_12z = ~((celloutsig_1_0z[0] | celloutsig_1_2z[2]) & celloutsig_1_1z);
  assign celloutsig_1_19z = ~((celloutsig_1_11z | celloutsig_1_1z) & celloutsig_1_14z);
  assign celloutsig_1_6z = celloutsig_1_0z[4] | ~(celloutsig_1_0z[2]);
  assign celloutsig_1_11z = celloutsig_1_8z | celloutsig_1_0z[3];
  assign celloutsig_1_9z = ~(celloutsig_1_5z ^ celloutsig_1_0z[1]);
  assign celloutsig_1_4z = in_data[162:158] === celloutsig_1_2z[7:3];
  assign celloutsig_1_13z = { celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_8z } || { celloutsig_1_11z, celloutsig_1_12z, celloutsig_1_4z };
  assign celloutsig_1_1z = celloutsig_1_0z[1] & ~(celloutsig_1_0z[0]);
  assign celloutsig_1_14z = celloutsig_1_12z & ~(celloutsig_1_0z[3]);
  assign celloutsig_1_2z = celloutsig_1_1z ? in_data[139:132] : in_data[180:173];
  assign celloutsig_0_0z = - in_data[17:10];
  assign celloutsig_1_10z = { celloutsig_1_2z[6:5], celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_6z } !== { celloutsig_1_0z[4], celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_8z = ^ celloutsig_1_0z[7:3];
  assign celloutsig_1_18z = { celloutsig_1_2z[4:3], celloutsig_1_11z, celloutsig_1_13z, celloutsig_1_6z } - { celloutsig_1_10z, celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_1z, celloutsig_1_11z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_0z = 8'h00;
    else if (clkin_data[32]) celloutsig_1_0z = in_data[117:110];
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_2z = 3'h0;
    else if (!clkin_data[0]) celloutsig_0_2z = in_data[41:39];
  assign { out_data[132:128], out_data[96], out_data[32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_1z, celloutsig_0_2z };
endmodule
