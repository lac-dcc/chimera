/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_2z;
  wire celloutsig_1_0z;
  wire [12:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire [4:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [20:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [4:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [3:0] _00_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _00_ <= 4'h0;
    else _00_ <= { in_data[3:1], celloutsig_0_0z };
  assign out_data[35:32] = _00_;
  assign celloutsig_1_9z = celloutsig_1_1z & in_data[122:118];
  assign celloutsig_1_2z = celloutsig_1_1z[4:1] >= in_data[118:115];
  assign celloutsig_1_0z = in_data[120:104] <= in_data[149:133];
  assign celloutsig_1_11z = { in_data[141:139], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z } && { celloutsig_1_9z[4], celloutsig_1_1z };
  assign celloutsig_1_18z = ! { celloutsig_1_9z[4:1], celloutsig_1_11z, celloutsig_1_11z };
  assign celloutsig_1_6z = in_data[125] & ~(in_data[108]);
  assign celloutsig_1_1z = { in_data[143:140], celloutsig_1_0z } * in_data[132:128];
  assign celloutsig_1_10z = { celloutsig_1_7z[15:6], celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_2z } * { celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_1z };
  assign celloutsig_1_14z = { celloutsig_1_10z[12:4], celloutsig_1_4z, celloutsig_1_13z, celloutsig_1_13z, celloutsig_1_13z } != { celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_13z, celloutsig_1_5z, celloutsig_1_9z };
  assign celloutsig_0_2z = { in_data[42:41], celloutsig_0_0z } !== in_data[45:43];
  assign celloutsig_1_8z = & { celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z, in_data[118:110] };
  assign celloutsig_1_19z = celloutsig_1_7z[11:1] - { celloutsig_1_7z[17:9], celloutsig_1_14z, celloutsig_1_2z };
  assign celloutsig_1_7z = { in_data[155:149], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_3z } ~^ { in_data[153:134], celloutsig_1_0z };
  assign celloutsig_0_0z = ~((in_data[59] & in_data[29]) | in_data[1]);
  assign celloutsig_1_4z = ~((celloutsig_1_3z & celloutsig_1_0z) | celloutsig_1_0z);
  assign celloutsig_1_5z = ~((celloutsig_1_4z & celloutsig_1_0z) | celloutsig_1_4z);
  assign celloutsig_1_13z = ~((celloutsig_1_3z & in_data[189]) | celloutsig_1_6z);
  assign celloutsig_1_3z = ~((celloutsig_1_1z[1] & celloutsig_1_1z[1]) | (celloutsig_1_2z & celloutsig_1_2z));
  assign { out_data[128], out_data[106:96], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_2z };
endmodule
