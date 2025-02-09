/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  reg [4:0] celloutsig_0_1z;
  wire celloutsig_1_0z;
  wire [4:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [4:0] celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  reg [3:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [4:0] celloutsig_1_3z;
  wire [23:0] celloutsig_1_4z;
  wire [15:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [4:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [4:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ~((in_data[60] | in_data[65]) & (in_data[72] | in_data[79]));
  assign celloutsig_1_0z = ~((in_data[101] | in_data[181]) & (in_data[138] | in_data[145]));
  assign celloutsig_1_2z = ~((celloutsig_1_1z[2] | celloutsig_1_0z) & (celloutsig_1_0z | celloutsig_1_1z[1]));
  assign celloutsig_1_6z = ~((celloutsig_1_3z[0] | celloutsig_1_4z[12]) & (celloutsig_1_5z[7] | celloutsig_1_5z[3]));
  assign celloutsig_1_8z = ~((celloutsig_1_2z | celloutsig_1_2z) & (celloutsig_1_6z | celloutsig_1_2z));
  assign celloutsig_1_12z = ~((celloutsig_1_6z | celloutsig_1_2z) & (celloutsig_1_3z[3] | in_data[132]));
  assign celloutsig_1_18z = ~((celloutsig_1_13z[2] | celloutsig_1_2z) & (celloutsig_1_12z | celloutsig_1_6z));
  assign celloutsig_1_19z = ~((celloutsig_1_0z | celloutsig_1_7z[1]) & (celloutsig_1_8z | celloutsig_1_5z[14]));
  assign celloutsig_1_4z = { celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z } & { in_data[135:116], celloutsig_1_1z };
  assign celloutsig_1_7z = { celloutsig_1_3z[2:0], celloutsig_1_2z, celloutsig_1_2z } & celloutsig_1_3z;
  assign celloutsig_1_11z = { celloutsig_1_9z[2:0], celloutsig_1_0z, celloutsig_1_8z } & celloutsig_1_9z;
  assign celloutsig_1_13z = { celloutsig_1_9z[4], celloutsig_1_1z } & celloutsig_1_11z;
  assign celloutsig_1_3z = { in_data[134:131], celloutsig_1_2z } * in_data[156:152];
  assign celloutsig_1_5z = in_data[122:107] * { in_data[170:160], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_9z = { in_data[97], celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_8z } * { celloutsig_1_0z, celloutsig_1_1z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_1z = 4'h0;
    else if (clkin_data[32]) celloutsig_1_1z = { in_data[157:155], celloutsig_1_0z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_1z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_1z = in_data[74:70];
  assign { out_data[128], out_data[96], out_data[32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_0z, celloutsig_0_1z };
endmodule
