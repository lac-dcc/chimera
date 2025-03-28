/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [3:0] _00_;
  wire [5:0] celloutsig_0_0z;
  wire [3:0] celloutsig_0_1z;
  wire [9:0] celloutsig_0_20z;
  wire [3:0] celloutsig_0_21z;
  wire [6:0] celloutsig_0_3z;
  wire [9:0] celloutsig_0_4z;
  wire [13:0] celloutsig_0_5z;
  wire [2:0] celloutsig_0_6z;
  wire [8:0] celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire [4:0] celloutsig_1_0z;
  wire [4:0] celloutsig_1_10z;
  wire [5:0] celloutsig_1_11z;
  wire [5:0] celloutsig_1_12z;
  wire [16:0] celloutsig_1_13z;
  wire [11:0] celloutsig_1_14z;
  wire [24:0] celloutsig_1_16z;
  wire [9:0] celloutsig_1_18z;
  wire [21:0] celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire [12:0] celloutsig_1_2z;
  wire [15:0] celloutsig_1_3z;
  wire [3:0] celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire [27:0] celloutsig_1_6z;
  wire [16:0] celloutsig_1_7z;
  wire [8:0] celloutsig_1_8z;
  wire [3:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _00_ <= 4'h0;
    else _00_ <= celloutsig_0_1z;
  assign celloutsig_0_0z = in_data[92:87] >>> in_data[21:16];
  assign celloutsig_1_11z = celloutsig_1_2z[5:0] >>> celloutsig_1_6z[25:20];
  assign celloutsig_1_12z = { celloutsig_1_9z[1:0], celloutsig_1_5z } >>> celloutsig_1_7z[13:8];
  assign celloutsig_1_13z = { celloutsig_1_11z[4:1], celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_4z } >>> { celloutsig_1_3z[15:12], celloutsig_1_1z, celloutsig_1_8z };
  assign celloutsig_1_14z = celloutsig_1_2z[11:0] >>> { celloutsig_1_13z[12:7], celloutsig_1_11z };
  assign celloutsig_1_16z = { celloutsig_1_6z[23:3], celloutsig_1_1z } >>> { celloutsig_1_12z[3], celloutsig_1_14z, celloutsig_1_12z, celloutsig_1_11z };
  assign celloutsig_0_3z = { _00_[3], celloutsig_0_0z } >>> { celloutsig_0_1z[0], celloutsig_0_0z };
  assign celloutsig_1_18z = celloutsig_1_16z[10:1] >>> celloutsig_1_2z[11:2];
  assign celloutsig_1_19z = { in_data[143:128], celloutsig_1_12z } >>> { celloutsig_1_6z[25:9], celloutsig_1_10z };
  assign celloutsig_0_4z = { celloutsig_0_0z[3:2], celloutsig_0_1z, _00_ } >>> { _00_[3:1], celloutsig_0_3z };
  assign celloutsig_0_5z = { celloutsig_0_4z[9:6], celloutsig_0_4z } >>> in_data[88:75];
  assign celloutsig_0_6z = celloutsig_0_5z[2:0] >>> _00_[2:0];
  assign celloutsig_0_7z = { celloutsig_0_4z[9:7], celloutsig_0_6z, celloutsig_0_6z } >>> in_data[49:41];
  assign celloutsig_0_8z = celloutsig_0_6z >>> _00_[3:1];
  assign celloutsig_0_1z = celloutsig_0_0z[4:1] >>> celloutsig_0_0z[5:2];
  assign celloutsig_0_20z = { in_data[51:46], celloutsig_0_1z } >>> { celloutsig_0_0z[4:2], celloutsig_0_8z, _00_ };
  assign celloutsig_0_21z = celloutsig_0_7z[4:1] >>> celloutsig_0_7z[4:1];
  assign celloutsig_1_0z = in_data[183:179] >>> in_data[131:127];
  assign celloutsig_1_1z = in_data[105:102] >>> celloutsig_1_0z[4:1];
  assign celloutsig_1_2z = { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z } >>> { celloutsig_1_0z[3:0], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_3z = { celloutsig_1_2z[10:0], celloutsig_1_0z } >>> { celloutsig_1_1z[2:0], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_4z = celloutsig_1_3z[8:5] >>> celloutsig_1_0z[4:1];
  assign celloutsig_1_5z = celloutsig_1_2z[10:7] >>> celloutsig_1_3z[12:9];
  assign celloutsig_1_6z = { celloutsig_1_2z[2], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_0z } >>> { celloutsig_1_2z[11:0], celloutsig_1_3z };
  assign celloutsig_1_7z = { in_data[114:106], celloutsig_1_5z, celloutsig_1_4z } >>> { celloutsig_1_6z[20:9], celloutsig_1_0z };
  assign celloutsig_1_8z = celloutsig_1_2z[11:3] >>> in_data[133:125];
  assign celloutsig_1_9z = celloutsig_1_0z[4:1] >>> celloutsig_1_5z;
  assign celloutsig_1_10z = celloutsig_1_8z[5:1] >>> celloutsig_1_6z[16:12];
  assign { out_data[137:128], out_data[117:96], out_data[41:32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_20z, celloutsig_0_21z };
endmodule
