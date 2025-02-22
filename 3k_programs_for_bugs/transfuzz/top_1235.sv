/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [9:0] _00_;
  wire celloutsig_0_1z;
  wire [15:0] celloutsig_0_2z;
  wire [19:0] celloutsig_0_4z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [3:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_5z = ~((celloutsig_1_2z | celloutsig_1_1z) & celloutsig_1_3z[3]);
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _00_ <= 10'h000;
    else _00_ <= in_data[67:58];
  assign celloutsig_1_6z = in_data[129:123] && { celloutsig_1_3z[3:1], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_0z = in_data[191:183] < in_data[121:113];
  assign celloutsig_0_1z = _00_[3] & ~(in_data[49]);
  assign celloutsig_0_4z = in_data[69:50] * { celloutsig_0_2z[15:6], _00_ };
  assign celloutsig_1_3z = celloutsig_1_2z ? { celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z } : { in_data[141:139], celloutsig_1_1z };
  assign celloutsig_1_1z = & { celloutsig_1_0z, in_data[141:130] };
  assign celloutsig_1_8z = & { celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_3z[2], celloutsig_1_0z };
  assign celloutsig_1_19z = | in_data[186:177];
  assign celloutsig_1_2z = ~^ { in_data[163:157], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_4z = ^ { celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_3z };
  assign celloutsig_0_2z = in_data[47:32] >> { _00_[9:6], celloutsig_0_1z, _00_, celloutsig_0_1z };
  assign celloutsig_0_5z = celloutsig_0_4z[15:11] ^ { celloutsig_0_2z[3:0], celloutsig_0_1z };
  assign celloutsig_1_18z = ~((celloutsig_1_5z & celloutsig_1_8z) | (celloutsig_1_6z & celloutsig_1_3z[3]));
  assign { out_data[128], out_data[96], out_data[51:32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_4z, celloutsig_0_5z };
endmodule
