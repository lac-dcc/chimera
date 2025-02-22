/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [10:0] celloutsig_0_0z;
  wire [7:0] celloutsig_0_10z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [22:0] celloutsig_0_7z;
  wire [20:0] celloutsig_0_9z;
  wire [7:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  reg [7:0] celloutsig_1_11z;
  wire [9:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [10:0] celloutsig_1_6z;
  wire [4:0] celloutsig_1_7z;
  wire [5:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = ~(celloutsig_0_2z | celloutsig_0_0z[0]);
  assign celloutsig_0_6z = ~(celloutsig_0_4z | celloutsig_0_3z);
  assign celloutsig_0_2z = ~(celloutsig_0_1z | in_data[34]);
  assign celloutsig_0_4z = ~celloutsig_0_3z;
  assign celloutsig_1_3z = ~celloutsig_1_2z[2];
  assign celloutsig_1_9z = celloutsig_1_6z[3] | ~(celloutsig_1_6z[8]);
  assign celloutsig_1_10z = celloutsig_1_4z[1] | ~(celloutsig_1_8z[5]);
  assign celloutsig_1_19z = celloutsig_1_3z | ~(celloutsig_1_18z[7]);
  assign celloutsig_0_7z = { celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_1z } / { 1'h1, celloutsig_0_0z[4:0], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_10z = celloutsig_0_0z[9:2] / { 1'h1, celloutsig_0_9z[5:2], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_1_5z = in_data[120:107] <= in_data[122:109];
  assign celloutsig_0_9z = { in_data[88:86], celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_3z } % { 1'h1, celloutsig_0_7z[11:7], celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_5z = ~^ { in_data[13], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_1_1z = ~^ in_data[115:99];
  assign celloutsig_0_1z = ~^ in_data[57:54];
  assign celloutsig_1_7z = { in_data[126:123], celloutsig_1_5z } << { celloutsig_1_6z[10:7], celloutsig_1_1z };
  assign celloutsig_1_18z = { celloutsig_1_8z[5:3], celloutsig_1_10z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z } << { celloutsig_1_11z[6:0], celloutsig_1_2z };
  assign celloutsig_1_2z = in_data[107:105] >>> celloutsig_1_0z[2:0];
  assign celloutsig_1_6z = { in_data[137:130], celloutsig_1_2z } >>> { celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_1_8z = { celloutsig_1_2z, celloutsig_1_2z } >>> { celloutsig_1_0z[4:0], celloutsig_1_5z };
  assign celloutsig_1_4z = { celloutsig_1_2z[2], celloutsig_1_3z, celloutsig_1_3z } - { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_0z = in_data[170:163] ~^ in_data[122:115];
  always_latch
    if (clkin_data[32]) celloutsig_0_0z = 11'h000;
    else if (!celloutsig_1_19z) celloutsig_0_0z = in_data[37:27];
  always_latch
    if (clkin_data[64]) celloutsig_1_11z = 8'h00;
    else if (clkin_data[0]) celloutsig_1_11z = { celloutsig_1_7z[0], celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_2z };
  assign { out_data[137:128], out_data[96], out_data[52:32], out_data[7:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_9z, celloutsig_0_10z };
endmodule
