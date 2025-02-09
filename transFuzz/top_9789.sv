/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [2:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [9:0] celloutsig_0_12z;
  reg [14:0] celloutsig_0_13z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_1z;
  wire [13:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire [10:0] celloutsig_0_4z;
  wire [5:0] celloutsig_0_5z;
  wire [4:0] celloutsig_0_6z;
  wire [14:0] celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [3:0] celloutsig_1_0z;
  wire [4:0] celloutsig_1_10z;
  wire [25:0] celloutsig_1_11z;
  wire [4:0] celloutsig_1_18z;
  wire [9:0] celloutsig_1_19z;
  wire [20:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [12:0] celloutsig_1_4z;
  wire [11:0] celloutsig_1_5z;
  wire [10:0] celloutsig_1_6z;
  wire [8:0] celloutsig_1_7z;
  wire [12:0] celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = !(in_data[7] ? in_data[9] : in_data[84]);
  always_ff @(negedge clkin_data[64], negedge clkin_data[32])
    if (!clkin_data[32]) _00_ <= 3'h0;
    else _00_ <= celloutsig_1_7z[6:4];
  assign celloutsig_0_4z = { celloutsig_0_2z[9:0], celloutsig_0_3z } & in_data[94:84];
  assign celloutsig_0_5z = { celloutsig_0_2z[8:6], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z } & celloutsig_0_2z[5:0];
  assign celloutsig_0_10z = { celloutsig_0_7z[6], celloutsig_0_6z, celloutsig_0_4z } && { celloutsig_0_6z[2:1], celloutsig_0_7z };
  assign celloutsig_0_11z = { celloutsig_0_7z[12:3], celloutsig_0_10z } && celloutsig_0_4z;
  assign celloutsig_0_1z = { in_data[84:69], celloutsig_0_0z } && { in_data[9:0], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_17z = celloutsig_0_2z[13:5] || celloutsig_0_7z[13:5];
  assign celloutsig_0_3z = celloutsig_0_2z[5] & ~(in_data[22]);
  assign celloutsig_0_2z = { in_data[67:55], celloutsig_0_0z } % { 1'h1, in_data[53:42], celloutsig_0_1z };
  assign celloutsig_1_11z = { in_data[113:101], celloutsig_1_0z, celloutsig_1_7z } % { 1'h1, celloutsig_1_1z[18:7], celloutsig_1_8z };
  assign celloutsig_1_3z = in_data[137:126] != { in_data[123:117], celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_0_16z = { celloutsig_0_4z[7:4], celloutsig_0_12z, celloutsig_0_11z } !== { celloutsig_0_13z[13:0], celloutsig_0_9z };
  assign celloutsig_1_2z = in_data[187:178] !== celloutsig_1_1z[15:6];
  assign celloutsig_1_1z = { in_data[103:99], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } | { in_data[134:118], celloutsig_1_0z };
  assign celloutsig_1_6z = { celloutsig_1_4z[12:3], celloutsig_1_2z } | { celloutsig_1_5z[8:2], celloutsig_1_0z };
  assign celloutsig_1_8z = { celloutsig_1_5z[10:0], celloutsig_1_2z, celloutsig_1_2z } | { celloutsig_1_1z[7:4], celloutsig_1_7z };
  assign celloutsig_1_10z = celloutsig_1_6z[8:4] | celloutsig_1_4z[9:5];
  assign celloutsig_0_9z = ~^ { celloutsig_0_2z[8:7], celloutsig_0_8z, celloutsig_0_5z };
  assign celloutsig_1_18z = { in_data[122], celloutsig_1_0z } >> celloutsig_1_7z[7:3];
  assign celloutsig_1_0z = in_data[151:148] >> in_data[123:120];
  assign celloutsig_0_7z = { in_data[59:51], celloutsig_0_6z, celloutsig_0_0z } << in_data[17:3];
  assign celloutsig_1_5z = celloutsig_1_1z[18:7] << { celloutsig_1_4z[10:0], celloutsig_1_2z };
  assign celloutsig_1_7z = celloutsig_1_4z[8:0] << celloutsig_1_5z[9:1];
  assign celloutsig_1_19z = { celloutsig_1_11z[23:18], celloutsig_1_0z } <<< { _00_[2], celloutsig_1_10z, celloutsig_1_0z };
  assign celloutsig_0_8z = { celloutsig_0_2z[4], celloutsig_0_1z, celloutsig_0_0z } >>> celloutsig_0_7z[9:7];
  assign celloutsig_0_12z = celloutsig_0_4z[10:1] >>> { celloutsig_0_2z[13:10], celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_1z };
  assign celloutsig_1_4z = { in_data[117:112], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z } >>> { in_data[145:137], celloutsig_1_0z };
  assign celloutsig_0_6z = { celloutsig_0_4z[6:3], celloutsig_0_0z } - celloutsig_0_2z[5:1];
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_13z = 15'h0000;
    else if (clkin_data[0]) celloutsig_0_13z = { celloutsig_0_7z[7:0], celloutsig_0_3z, celloutsig_0_5z };
  assign { out_data[132:128], out_data[105:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_16z, celloutsig_0_17z };
endmodule
