/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [4:0] celloutsig_0_0z;
  wire [3:0] celloutsig_0_1z;
  wire [2:0] celloutsig_0_2z;
  reg [2:0] celloutsig_0_3z;
  wire [3:0] celloutsig_0_4z;
  wire [15:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [4:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_17z;
  wire [4:0] celloutsig_1_18z;
  wire [3:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [5:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [11:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_9z = celloutsig_1_6z ? celloutsig_1_7z : celloutsig_1_4z[0];
  assign celloutsig_1_12z = in_data[190] ? celloutsig_1_0z[7] : celloutsig_1_2z[2];
  assign celloutsig_1_0z = in_data[117:102] + in_data[180:165];
  assign celloutsig_1_11z = celloutsig_1_4z[4:0] + { celloutsig_1_0z[14:13], celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_3z };
  assign celloutsig_0_2z = celloutsig_0_0z[3:1] + celloutsig_0_1z[2:0];
  assign celloutsig_1_18z = { celloutsig_1_11z[3:1], celloutsig_1_9z, celloutsig_1_12z } + celloutsig_1_11z;
  assign celloutsig_1_7z = { celloutsig_1_4z[10:4], celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_4z } === { celloutsig_1_0z[13:2], celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_10z = celloutsig_1_2z[4:1] === { celloutsig_1_0z[15], celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_6z };
  assign celloutsig_1_17z = { celloutsig_1_11z[4:1], celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_14z } <= { celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_12z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_0z = in_data[8:4] % { 1'h1, in_data[14:11] };
  assign celloutsig_1_1z = in_data[132:123] != in_data[146:137];
  assign celloutsig_0_1z = - in_data[37:34];
  assign celloutsig_1_6z = | { celloutsig_1_2z[5:2], celloutsig_1_1z };
  assign celloutsig_1_5z = ~^ { celloutsig_1_0z[2], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_8z = ^ celloutsig_1_0z[15:12];
  assign celloutsig_0_4z = { celloutsig_0_2z[1], celloutsig_0_3z } << { celloutsig_0_2z[1], celloutsig_0_2z };
  assign celloutsig_1_19z = { celloutsig_1_18z[2:1], celloutsig_1_17z, celloutsig_1_6z } << celloutsig_1_4z[6:3];
  assign celloutsig_1_2z = in_data[161:156] >> in_data[109:104];
  assign celloutsig_1_4z = { celloutsig_1_0z[7:4], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_2z } - in_data[151:140];
  assign celloutsig_1_3z = ~((celloutsig_1_1z & celloutsig_1_1z) | in_data[115]);
  assign celloutsig_1_14z = ~((celloutsig_1_2z[1] & in_data[174]) | celloutsig_1_8z);
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_3z = 3'h0;
    else if (clkin_data[0]) celloutsig_0_3z = in_data[6:4];
  assign { out_data[132:128], out_data[99:96], out_data[34:32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_3z, celloutsig_0_4z };
endmodule
