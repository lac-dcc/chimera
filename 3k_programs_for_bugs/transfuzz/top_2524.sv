/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_13z;
  wire celloutsig_0_16z;
  reg [3:0] celloutsig_0_17z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [15:0] celloutsig_0_8z;
  reg [8:0] celloutsig_0_9z;
  wire [23:0] celloutsig_1_0z;
  wire [5:0] celloutsig_1_11z;
  reg [2:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [15:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  reg [5:0] celloutsig_1_18z;
  wire [13:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [7:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_8z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ~(in_data[54] | in_data[46]);
  assign celloutsig_0_13z = ~(in_data[46] | celloutsig_0_2z);
  assign celloutsig_0_4z = ~celloutsig_0_13z;
  assign celloutsig_0_1z = ~in_data[57];
  assign celloutsig_0_16z = ~celloutsig_0_5z;
  assign celloutsig_1_4z = ~celloutsig_1_0z[1];
  assign celloutsig_1_0z = in_data[174:151] & in_data[169:146];
  assign celloutsig_1_11z = { celloutsig_1_5z[6:2], celloutsig_1_4z } / { 1'h1, celloutsig_1_5z[5:1] };
  assign celloutsig_0_5z = { celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_0z } <= in_data[53:48];
  assign celloutsig_1_6z = celloutsig_1_5z[7:3] <= { celloutsig_1_5z[3:2], celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_1z };
  assign celloutsig_0_6z = in_data[64] & ~(celloutsig_0_13z);
  assign celloutsig_1_3z = celloutsig_1_2z[8] & ~(celloutsig_1_0z[21]);
  assign celloutsig_1_13z = in_data[158] & ~(celloutsig_1_1z);
  assign celloutsig_1_19z = { celloutsig_1_5z, celloutsig_1_11z } % { 1'h1, celloutsig_1_12z, celloutsig_1_5z, celloutsig_1_17z, celloutsig_1_13z };
  assign celloutsig_1_5z = { celloutsig_1_2z[7:1], celloutsig_1_3z } * celloutsig_1_2z[8:1];
  assign celloutsig_0_2z = { in_data[45:32], celloutsig_0_1z } != { in_data[75:66], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_8z = - { celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_13z };
  assign celloutsig_1_8z = - celloutsig_1_0z[23:21];
  assign celloutsig_1_15z = - { celloutsig_1_0z[10:4], celloutsig_1_2z };
  assign celloutsig_1_17z = & { celloutsig_1_15z[5:0], celloutsig_1_13z, celloutsig_1_4z };
  assign celloutsig_1_1z = | celloutsig_1_0z[19:13];
  assign celloutsig_0_7z = | { celloutsig_0_1z, in_data[35:33] };
  assign celloutsig_1_2z = in_data[116:108] <<< in_data[138:130];
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_9z = 9'h000;
    else if (clkin_data[32]) celloutsig_0_9z = celloutsig_0_8z[9:1];
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_17z = 4'h0;
    else if (clkin_data[0]) celloutsig_0_17z = { celloutsig_0_9z[4:2], celloutsig_0_0z };
  always_latch
    if (clkin_data[128]) celloutsig_1_12z = 3'h0;
    else if (!clkin_data[64]) celloutsig_1_12z = { celloutsig_1_8z[2:1], celloutsig_1_6z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_18z = 6'h00;
    else if (!clkin_data[64]) celloutsig_1_18z = in_data[106:101];
  assign { out_data[133:128], out_data[109:96], out_data[32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_16z, celloutsig_0_17z };
endmodule
