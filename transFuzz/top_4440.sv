/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [24:0] _00_;
  wire [3:0] celloutsig_0_0z;
  wire [45:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [3:0] celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [3:0] celloutsig_0_6z;
  reg [6:0] celloutsig_0_7z;
  wire [7:0] celloutsig_0_8z;
  wire [2:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [8:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  reg [5:0] celloutsig_1_2z;
  wire [6:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [18:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [8:0] celloutsig_1_7z;
  wire [7:0] celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_1z = ~celloutsig_1_0z[2];
  assign celloutsig_1_4z = ~((in_data[117] | in_data[121]) & (celloutsig_1_3z[4] | celloutsig_1_3z[5]));
  assign celloutsig_0_5z = ~(celloutsig_0_1z[2] ^ celloutsig_0_2z);
  always_ff @(posedge clkin_data[96], posedge clkin_data[32])
    if (clkin_data[32]) _00_ <= 25'h0000000;
    else _00_ <= { in_data[81:65], celloutsig_0_6z, celloutsig_0_1z };
  assign celloutsig_0_13z = celloutsig_0_7z[5:2] == celloutsig_0_0z;
  assign celloutsig_0_14z = { celloutsig_0_11z[25:12], celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_3z, celloutsig_0_12z } === { in_data[34:26], celloutsig_0_8z, celloutsig_0_3z };
  assign celloutsig_1_6z = { celloutsig_1_2z[3], celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_4z } <= { celloutsig_1_5z[10:6], celloutsig_1_2z[5:3] };
  assign celloutsig_1_10z = celloutsig_1_8z[7:2] || celloutsig_1_2z;
  assign celloutsig_1_8z = { celloutsig_1_5z[10:6], celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_4z } % { 1'h1, celloutsig_1_7z[7:1] };
  assign celloutsig_0_1z = celloutsig_0_0z % { 1'h1, celloutsig_0_0z[2:1], in_data[0] };
  assign celloutsig_0_0z = in_data[12:9] * in_data[25:22];
  assign celloutsig_1_5z[18:6] = in_data[123] ? in_data[166:154] : { celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_0_12z = celloutsig_0_8z[5:3] !== celloutsig_0_0z[3:1];
  assign celloutsig_1_7z = in_data[166:158] | { celloutsig_1_2z[3:2], celloutsig_1_2z, celloutsig_1_6z };
  assign celloutsig_0_4z = | { in_data[93:52], celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_3z = ~^ { in_data[95], celloutsig_0_1z };
  assign celloutsig_0_6z = celloutsig_0_0z >> { celloutsig_0_0z[3:1], celloutsig_0_5z };
  assign celloutsig_0_8z = in_data[24:17] >> { celloutsig_0_1z[3:1], celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_0_11z = in_data[47:2] >> { celloutsig_0_8z[2:0], celloutsig_0_6z, celloutsig_0_6z, _00_, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_5z };
  assign celloutsig_1_0z = in_data[155:153] >> in_data[175:173];
  assign celloutsig_1_3z = in_data[168:162] >> in_data[179:173];
  assign celloutsig_1_18z = { celloutsig_1_8z, celloutsig_1_10z } >>> { celloutsig_1_7z[0], celloutsig_1_8z };
  assign celloutsig_1_19z = ~((celloutsig_1_1z & celloutsig_1_4z) | celloutsig_1_8z[4]);
  assign celloutsig_0_2z = ~((celloutsig_0_1z[3] & in_data[92]) | celloutsig_0_0z[3]);
  always_latch
    if (!clkin_data[32]) celloutsig_0_7z = 7'h00;
    else if (!celloutsig_1_18z[0]) celloutsig_0_7z = { celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_2z };
  always_latch
    if (clkin_data[64]) celloutsig_1_2z = 6'h00;
    else if (clkin_data[0]) celloutsig_1_2z = { celloutsig_1_0z[2:1], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_5z[5:0] = celloutsig_1_2z;
  assign { out_data[136:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_13z, celloutsig_0_14z };
endmodule
