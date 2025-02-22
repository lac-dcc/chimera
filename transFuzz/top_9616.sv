/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  reg [2:0] celloutsig_0_12z;
  wire [6:0] celloutsig_0_1z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_2z;
  wire [2:0] celloutsig_0_4z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_1_0z;
  reg [15:0] celloutsig_1_10z;
  wire [4:0] celloutsig_1_11z;
  wire [14:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  reg [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [7:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [16:0] celloutsig_1_7z;
  wire [4:0] celloutsig_1_8z;
  wire [7:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_14z = ~(celloutsig_1_13z[6] & celloutsig_1_1z);
  assign celloutsig_0_2z = ~(celloutsig_0_0z[3] & celloutsig_0_1z[3]);
  assign celloutsig_1_1z = !(celloutsig_1_0z ? in_data[168] : celloutsig_1_0z);
  assign celloutsig_1_17z = ~((celloutsig_1_2z | celloutsig_1_6z) & celloutsig_1_14z);
  assign celloutsig_0_10z = ~((celloutsig_0_1z[5] | celloutsig_0_4z[1]) & celloutsig_0_0z[2]);
  assign celloutsig_1_0z = in_data[137] | ~(in_data[170]);
  assign celloutsig_1_4z = celloutsig_1_0z | ~(celloutsig_1_1z);
  assign celloutsig_1_7z = { in_data[113:103], celloutsig_1_5z, celloutsig_1_5z } / { 1'h1, in_data[167:166], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_6z };
  assign celloutsig_1_19z = { celloutsig_1_18z[2:1], celloutsig_1_5z, celloutsig_1_17z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_14z } > { celloutsig_1_9z[5:0], celloutsig_1_16z, celloutsig_1_5z, celloutsig_1_17z, celloutsig_1_2z };
  assign celloutsig_0_7z = { celloutsig_0_0z[2], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_2z } > { in_data[18:15], celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_0_6z = celloutsig_0_0z[2:0] && celloutsig_0_5z[3:1];
  assign celloutsig_1_2z = in_data[143:141] && in_data[131:129];
  assign celloutsig_0_0z = in_data[11:8] % { 1'h1, in_data[83:81] };
  assign celloutsig_1_9z = celloutsig_1_1z ? { in_data[121:115], 1'h1 } : { in_data[161:156], celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_11z = celloutsig_1_2z ? celloutsig_1_10z[4:0] : { celloutsig_1_10z[5], celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_5z = celloutsig_1_1z ? { celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_2z } : { celloutsig_1_3z[7:6], 1'h0 };
  assign celloutsig_1_8z = - { celloutsig_1_7z[10:9], celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_0z };
  assign celloutsig_0_4z = - in_data[59:57];
  assign celloutsig_1_13z = - { celloutsig_1_8z[3:1], celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_0_1z = - in_data[11:5];
  assign celloutsig_1_3z = - in_data[119:112];
  assign celloutsig_0_23z = & { celloutsig_0_10z, celloutsig_0_1z[6:4] };
  assign celloutsig_1_16z = celloutsig_1_13z[7] & celloutsig_1_4z;
  assign celloutsig_1_6z = ~^ { celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_5z = celloutsig_0_1z[6:2] - { in_data[9:7], celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_22z = ~((celloutsig_0_12z[2] & in_data[5]) | in_data[94]);
  always_latch
    if (clkin_data[96]) celloutsig_1_10z = 16'h0000;
    else if (clkin_data[32]) celloutsig_1_10z = { celloutsig_1_7z[11:10], celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_6z };
  always_latch
    if (!clkin_data[96]) celloutsig_1_18z = 3'h0;
    else if (clkin_data[0]) celloutsig_1_18z = celloutsig_1_11z[2:0];
  always_latch
    if (clkin_data[64]) celloutsig_0_12z = 3'h0;
    else if (celloutsig_1_19z) celloutsig_0_12z = { celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_6z };
  assign { out_data[130:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_22z, celloutsig_0_23z };
endmodule
