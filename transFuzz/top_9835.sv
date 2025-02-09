/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [4:0] _01_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_1z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [6:0] celloutsig_1_10z;
  wire [3:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [7:0] celloutsig_1_13z;
  wire [16:0] celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire [12:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [12:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = celloutsig_0_1z ? celloutsig_0_1z : celloutsig_0_0z;
  assign celloutsig_0_7z = celloutsig_0_1z ? celloutsig_0_1z : in_data[44];
  assign celloutsig_1_12z = ~(_00_ & celloutsig_1_11z[1]);
  assign celloutsig_0_11z = !(celloutsig_0_1z ? celloutsig_0_9z : celloutsig_0_9z);
  assign celloutsig_1_6z = !(in_data[140] ? celloutsig_1_2z : in_data[122]);
  assign celloutsig_0_0z = ~(in_data[65] | in_data[16]);
  assign celloutsig_1_5z = ~(celloutsig_1_0z | celloutsig_1_4z[9]);
  assign celloutsig_0_9z = ~celloutsig_0_6z;
  assign celloutsig_0_10z = celloutsig_0_8z | ~(celloutsig_0_4z);
  assign celloutsig_1_0z = in_data[116] | in_data[105];
  assign celloutsig_1_1z = ~(celloutsig_1_0z ^ in_data[146]);
  assign celloutsig_1_14z = { in_data[135:121], celloutsig_1_2z, celloutsig_1_2z } + { in_data[117:102], celloutsig_1_6z };
  reg [4:0] _14_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _14_ <= 5'h00;
    else _14_ <= { celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_9z };
  assign out_data[4:0] = _14_;
  reg [4:0] _15_;
  always_ff @(posedge clkin_data[32], posedge clkin_data[64])
    if (clkin_data[64]) _15_ <= 5'h00;
    else _15_ <= in_data[162:158];
  assign { _01_[4:3], _00_, _01_[1:0] } = _15_;
  assign celloutsig_1_4z = { in_data[183:172], celloutsig_1_0z } / { 1'h1, in_data[148:137] };
  assign celloutsig_1_11z = celloutsig_1_4z[4:1] / { 1'h1, in_data[157:156], celloutsig_1_5z };
  assign celloutsig_0_6z = { in_data[49:48], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z } && in_data[90:81];
  assign celloutsig_1_2z = ! { in_data[162:159], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_4z = { in_data[41:33], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z } < { in_data[19:9], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_3z = { in_data[125:121], celloutsig_1_1z, celloutsig_1_1z } < { in_data[142:141], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_1z = celloutsig_0_0z & ~(celloutsig_0_0z);
  assign celloutsig_1_19z = celloutsig_1_14z[13:1] % { 1'h1, celloutsig_1_13z, celloutsig_1_9z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_12z };
  assign celloutsig_1_10z = celloutsig_1_1z ? { in_data[179:174], celloutsig_1_0z } : { _01_[4], _01_[4:3], _00_, _01_[1:0], celloutsig_1_5z };
  assign celloutsig_1_13z = celloutsig_1_2z ? { celloutsig_1_0z, celloutsig_1_10z } : { _01_[4:3], _00_, celloutsig_1_6z, celloutsig_1_0z, 1'h0, celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_1_9z = in_data[172] & celloutsig_1_2z;
  assign celloutsig_1_18z = | { celloutsig_1_13z, celloutsig_1_5z, celloutsig_1_1z };
  assign celloutsig_0_5z = | { celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_1z, in_data[12:8], celloutsig_0_0z };
  assign celloutsig_0_12z = | { celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_1z, in_data[12:8], celloutsig_0_0z };
  assign celloutsig_0_8z = ^ { in_data[83:82], celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_3z };
  assign _01_[2] = _00_;
  assign { out_data[128], out_data[108:96], out_data[32] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_12z };
endmodule
