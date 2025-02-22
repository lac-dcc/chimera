/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [7:0] celloutsig_0_0z;
  wire celloutsig_0_11z;
  reg [4:0] celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire [6:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire [27:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [15:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [22:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  reg [18:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_19z = ~(celloutsig_1_11z & celloutsig_1_2z);
  assign celloutsig_0_1z = ~(in_data[27] | celloutsig_0_0z[3]);
  assign celloutsig_0_17z = ~(celloutsig_0_15z | celloutsig_0_1z);
  assign celloutsig_0_2z = ~(celloutsig_0_0z[0] | celloutsig_0_0z[1]);
  assign celloutsig_1_11z = ~(celloutsig_1_1z | celloutsig_1_10z[14]);
  assign celloutsig_0_9z = ~((celloutsig_0_7z[10] | celloutsig_0_2z) & celloutsig_0_2z);
  assign celloutsig_0_11z = ~((in_data[44] | celloutsig_0_4z) & celloutsig_0_9z);
  assign celloutsig_0_15z = ~((celloutsig_0_3z[19] | celloutsig_0_1z) & celloutsig_0_6z);
  assign celloutsig_1_2z = celloutsig_1_0z ^ celloutsig_1_1z;
  assign celloutsig_1_10z = { celloutsig_1_5z[18:8], celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_2z } / { 1'h1, in_data[118:98], in_data[96] };
  assign celloutsig_0_6z = { celloutsig_0_0z[4:1], celloutsig_0_1z, celloutsig_0_5z } > { celloutsig_0_3z[5:2], celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_1_3z = { in_data[146], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z } && { in_data[179], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_8z = { celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z } && { in_data[176:169], celloutsig_1_6z };
  assign celloutsig_1_6z = ! { in_data[182:180], celloutsig_1_0z };
  assign celloutsig_1_18z = { celloutsig_1_5z[13:3], celloutsig_1_8z, celloutsig_1_8z } != { in_data[145:134], celloutsig_1_1z };
  assign celloutsig_0_5z = { celloutsig_0_3z[10:3], celloutsig_0_2z, celloutsig_0_4z } != in_data[43:34];
  assign celloutsig_1_1z = { in_data[148], celloutsig_1_0z } != in_data[142:141];
  assign celloutsig_1_4z = { in_data[104:100], celloutsig_1_3z } != in_data[103:98];
  assign celloutsig_1_9z = | in_data[176:172];
  assign celloutsig_0_4z = celloutsig_0_0z[0] & celloutsig_0_1z;
  assign celloutsig_1_7z = in_data[183] & celloutsig_1_2z;
  assign celloutsig_0_3z = { in_data[67:44], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z } >> { in_data[76:74], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_7z = { in_data[59:49], celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_5z } >> { celloutsig_0_0z[4], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_16z = in_data[67:61] ~^ { celloutsig_0_13z[4:3], celloutsig_0_13z };
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_0z = 8'h00;
    else if (clkin_data[0]) celloutsig_0_0z = in_data[55:48];
  always_latch
    if (celloutsig_1_19z) celloutsig_0_13z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_13z = { celloutsig_0_7z[13:12], celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_8z };
  always_latch
    if (!clkin_data[96]) celloutsig_1_5z = 19'h00000;
    else if (!clkin_data[64]) celloutsig_1_5z = in_data[136:118];
  assign celloutsig_0_8z = ~((celloutsig_0_3z[2] & celloutsig_0_7z[1]) | (celloutsig_0_4z & celloutsig_0_7z[12]));
  assign celloutsig_1_0z = ~((in_data[129] & in_data[107]) | (in_data[139] & in_data[109]));
  assign { out_data[128], out_data[96], out_data[38:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_16z, celloutsig_0_17z };
endmodule
