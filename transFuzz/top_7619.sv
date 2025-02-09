/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [18:0] celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_1_0z;
  wire [17:0] celloutsig_1_10z;
  wire [5:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [6:0] celloutsig_1_1z;
  wire [13:0] celloutsig_1_2z;
  wire [5:0] celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_2z = in_data[68] ? in_data[81] : in_data[33];
  assign celloutsig_1_8z = !(celloutsig_1_1z[1] ? celloutsig_1_4z[4] : celloutsig_1_0z);
  assign celloutsig_1_5z = celloutsig_1_4z[1] ^ celloutsig_1_3z[4];
  assign celloutsig_1_9z = celloutsig_1_8z ^ celloutsig_1_7z;
  assign celloutsig_1_10z = { in_data[121:120], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_9z } / { 1'h1, celloutsig_1_9z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_9z, celloutsig_1_5z, in_data[96] };
  assign celloutsig_1_0z = ! in_data[181:157];
  assign celloutsig_1_7z = ! in_data[175:172];
  assign celloutsig_1_18z = { celloutsig_1_3z, celloutsig_1_7z } || celloutsig_1_2z[12:6];
  assign celloutsig_1_1z = { in_data[136:131], celloutsig_1_0z } % { 1'h1, in_data[188:183] };
  assign celloutsig_1_19z = celloutsig_1_3z[2] & celloutsig_1_16z[0];
  assign celloutsig_1_16z = celloutsig_1_10z[5:0] >> { celloutsig_1_2z[3], 5'h00 };
  assign celloutsig_1_2z = { celloutsig_1_1z[5:0], celloutsig_1_1z, celloutsig_1_0z } << { celloutsig_1_1z[5:0], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_3z = in_data[186:181] >> celloutsig_1_1z[6:1];
  assign celloutsig_1_4z = { celloutsig_1_2z[7:4], celloutsig_1_0z } <<< celloutsig_1_2z[11:7];
  always_latch
    if (!clkin_data[0]) celloutsig_0_1z = 19'h00000;
    else if (celloutsig_1_19z) celloutsig_0_1z = in_data[52:34];
  assign { out_data[128], out_data[96], out_data[50:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_1z, celloutsig_0_2z };
endmodule
