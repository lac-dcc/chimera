/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [11:0] _00_;
  wire [7:0] celloutsig_0_0z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire [9:0] celloutsig_0_3z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire [12:0] celloutsig_1_5z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_18z = ~(celloutsig_1_13z & celloutsig_1_5z[11]);
  assign celloutsig_1_19z = ~(celloutsig_1_0z[1] & celloutsig_1_1z);
  assign celloutsig_0_1z = ~(celloutsig_0_0z[6] | in_data[56]);
  assign celloutsig_1_1z = ~(in_data[162] | celloutsig_1_0z[1]);
  assign celloutsig_0_18z = in_data[38] | celloutsig_0_3z[8];
  assign celloutsig_0_2z = in_data[76] | celloutsig_0_0z[1];
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _00_ <= 12'h000;
    else _00_ <= { celloutsig_0_0z[3:0], celloutsig_0_0z };
  assign celloutsig_1_2z = { in_data[174:171], celloutsig_1_1z, celloutsig_1_1z } <= in_data[186:181];
  assign celloutsig_1_13z = celloutsig_1_4z[0] & ~(celloutsig_1_2z);
  assign celloutsig_1_5z = { in_data[155:154], celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_0z } % { 1'h1, in_data[129:128], celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_0_0z = ~ in_data[21:14];
  assign celloutsig_1_0z = in_data[137:133] | in_data[150:146];
  assign celloutsig_1_3z = | { celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_17z = _00_[2:0] <<< { _00_[8:7], celloutsig_0_1z };
  assign celloutsig_0_3z = { celloutsig_0_0z[4], celloutsig_0_2z, celloutsig_0_0z } <<< { celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_4z = { celloutsig_1_0z[1], celloutsig_1_1z, celloutsig_1_2z } ~^ { celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z };
  assign { out_data[128], out_data[96], out_data[34:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_17z, celloutsig_0_18z };
endmodule
