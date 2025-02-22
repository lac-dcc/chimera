/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [9:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire celloutsig_0_16z;
  wire celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [7:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_2z;
  reg [6:0] celloutsig_0_3z;
  wire [12:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [17:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [8:0] celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_7z = celloutsig_1_2z[0] ? celloutsig_1_2z[3] : celloutsig_1_4z;
  assign celloutsig_1_16z = celloutsig_1_1z ? celloutsig_1_6z : celloutsig_1_2z[1];
  assign celloutsig_0_18z = celloutsig_0_2z ? celloutsig_0_10z : celloutsig_0_4z[5];
  assign celloutsig_0_23z = celloutsig_0_7z[16] ? celloutsig_0_18z : celloutsig_0_6z;
  assign celloutsig_1_4z = celloutsig_1_1z ? in_data[185] : celloutsig_1_3z;
  assign celloutsig_1_18z = ~(celloutsig_1_12z | celloutsig_1_2z[3]);
  assign celloutsig_1_1z = ~(celloutsig_1_0z[0] | in_data[130]);
  assign celloutsig_0_1z = ~((celloutsig_0_0z | celloutsig_0_0z) & celloutsig_0_0z);
  assign celloutsig_0_5z = ~((celloutsig_0_0z | celloutsig_0_3z[0]) & (celloutsig_0_3z[1] | celloutsig_0_4z[5]));
  assign celloutsig_0_2z = celloutsig_0_0z | ~(celloutsig_0_0z);
  assign celloutsig_1_11z = celloutsig_1_1z | in_data[121];
  assign celloutsig_1_19z = { celloutsig_1_2z[8:3], celloutsig_1_6z, celloutsig_1_14z, celloutsig_1_16z, celloutsig_1_7z, celloutsig_1_16z } / { 1'h1, celloutsig_1_2z[6:1], celloutsig_1_3z, celloutsig_1_16z, celloutsig_1_3z, celloutsig_1_10z };
  assign celloutsig_0_7z = { in_data[51:36], celloutsig_0_0z, celloutsig_0_0z } / { 1'h1, celloutsig_0_3z[3:0], celloutsig_0_4z };
  assign celloutsig_0_0z = in_data[55:33] > in_data[30:8];
  assign celloutsig_0_16z = { celloutsig_0_3z[6:3], celloutsig_0_5z } > { celloutsig_0_14z[2], celloutsig_0_14z, celloutsig_0_6z };
  assign celloutsig_1_10z = celloutsig_1_2z[7] & ~(celloutsig_1_3z);
  assign celloutsig_1_12z = celloutsig_1_3z & ~(celloutsig_1_3z);
  assign celloutsig_1_14z = celloutsig_1_11z & ~(celloutsig_1_7z);
  assign celloutsig_0_8z = celloutsig_0_2z & ~(celloutsig_0_4z[6]);
  assign celloutsig_0_10z = celloutsig_0_5z & ~(celloutsig_0_6z);
  assign celloutsig_0_11z = celloutsig_0_0z & ~(celloutsig_0_5z);
  assign celloutsig_0_21z = celloutsig_0_0z & ~(celloutsig_0_14z[1]);
  assign celloutsig_0_4z = { celloutsig_0_3z[2], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_0z } % { 1'h1, in_data[89:78] };
  assign celloutsig_0_9z = { in_data[8:1], celloutsig_0_6z } % { 1'h1, celloutsig_0_4z[8:4], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_22z = { celloutsig_0_13z[4:0], celloutsig_0_18z, celloutsig_0_1z, celloutsig_0_20z } % { 1'h1, celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_16z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_21z };
  assign celloutsig_1_0z = in_data[162:158] % { 1'h1, in_data[135:132] };
  assign celloutsig_0_14z = celloutsig_0_4z[0] ? celloutsig_0_13z[6:4] : celloutsig_0_3z[6:4];
  assign celloutsig_0_20z = celloutsig_0_10z & celloutsig_0_1z;
  assign celloutsig_0_6z = ~^ { celloutsig_0_3z[4:0], celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_12z = ~^ { celloutsig_0_3z[2:0], celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_13z = { celloutsig_0_9z[7:1], celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_0z } << { celloutsig_0_7z[14:11], celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_2z, celloutsig_0_8z };
  assign celloutsig_1_2z = in_data[115:107] >> { celloutsig_1_0z[3:0], celloutsig_1_0z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_3z = 7'h00;
    else if (!clkin_data[0]) celloutsig_0_3z = { celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_6z = ~((celloutsig_1_5z & celloutsig_1_3z) | (celloutsig_1_3z & celloutsig_1_1z));
  assign celloutsig_1_3z = ~((in_data[172] & celloutsig_1_2z[0]) | (celloutsig_1_0z[3] & celloutsig_1_0z[2]));
  assign celloutsig_1_5z = ~((celloutsig_1_2z[8] & celloutsig_1_3z) | (celloutsig_1_2z[8] & celloutsig_1_3z));
  assign { out_data[128], out_data[106:96], out_data[39:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_22z, celloutsig_0_23z };
endmodule
