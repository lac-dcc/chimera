/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [3:0] _02_;
  wire [6:0] celloutsig_0_0z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire [3:0] celloutsig_0_4z;
  wire [7:0] celloutsig_0_5z;
  wire [8:0] celloutsig_0_6z;
  wire [2:0] celloutsig_0_7z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [20:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_13z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [8:0] celloutsig_1_1z;
  wire celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire [9:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_2z = !(celloutsig_0_0z[3] ? celloutsig_0_1z : in_data[74]);
  assign celloutsig_1_0z = ~((in_data[128] | in_data[174]) & (in_data[138] | in_data[141]));
  assign celloutsig_1_19z = ~((celloutsig_1_17z | celloutsig_1_1z[3]) & (_00_ | celloutsig_1_7z[1]));
  assign celloutsig_1_10z = celloutsig_1_7z[3] | _01_;
  assign celloutsig_1_11z = celloutsig_1_7z[5] ^ celloutsig_1_9z;
  assign celloutsig_0_5z = { in_data[48:42], celloutsig_0_2z } + { in_data[45:42], celloutsig_0_4z };
  assign celloutsig_1_13z = celloutsig_1_12z[18:15] + { _02_[3], _00_, _01_, _02_[0] };
  reg [11:0] _10_;
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[32])
    if (clkin_data[32]) _10_ <= 12'h000;
    else _10_ <= { celloutsig_0_0z[5:4], celloutsig_0_3z, celloutsig_0_6z };
  assign out_data[11:0] = _10_;
  reg [3:0] _11_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _11_ <= 4'h0;
    else _11_ <= celloutsig_1_1z[6:3];
  assign { _02_[3], _00_, _01_, _02_[0] } = _11_;
  assign celloutsig_1_6z = { celloutsig_1_1z[5:2], _02_[3], _00_, _01_, _02_[0] } && { in_data[96], celloutsig_1_0z, _02_[3], _00_, _01_, _02_[0] };
  assign celloutsig_0_3z = celloutsig_0_0z || in_data[77:71];
  assign celloutsig_0_1z = in_data[55:53] || celloutsig_0_0z[2:0];
  assign celloutsig_1_8z = { celloutsig_1_1z[8:1], celloutsig_1_0z, celloutsig_1_0z } || in_data[163:154];
  assign celloutsig_0_7z = celloutsig_0_5z[4:2] % { 1'h1, in_data[73:72] };
  assign celloutsig_1_7z = { in_data[145:140], celloutsig_1_4z, celloutsig_1_0z, 2'h0 } % { 1'h1, in_data[145:137] };
  assign celloutsig_0_0z = in_data[32:26] * in_data[74:68];
  assign celloutsig_0_4z = celloutsig_0_0z[3:0] * { in_data[95:94], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_6z = celloutsig_0_1z ? in_data[65:57] : { celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_1_1z[8:1] = in_data[123] ? { in_data[150:144], celloutsig_1_0z } : in_data[104:97];
  assign celloutsig_1_9z = celloutsig_1_6z & celloutsig_1_8z;
  assign celloutsig_1_17z = | { celloutsig_1_11z, celloutsig_1_4z, celloutsig_1_1z[3:1], celloutsig_1_0z };
  assign celloutsig_1_4z = ^ { in_data[176:174], _02_[3], _00_, _01_, _02_[0] };
  assign celloutsig_1_18z = ^ { celloutsig_1_13z[0], celloutsig_1_4z, celloutsig_1_8z };
  assign { celloutsig_1_12z[14], celloutsig_1_12z[11], celloutsig_1_12z[13:12], celloutsig_1_12z[18:15], celloutsig_1_12z[20:19], celloutsig_1_12z[1] } = ~ { celloutsig_1_10z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_4z, _02_[3], _00_, _01_, _02_[0], celloutsig_1_1z[5:4], celloutsig_1_0z };
  assign _02_[2:1] = { _00_, _01_ };
  assign { celloutsig_1_12z[10:2], celloutsig_1_12z[0] } = { celloutsig_1_12z[18:15], celloutsig_1_12z[18:15], celloutsig_1_12z[12], 1'h1 };
  assign celloutsig_1_1z[0] = celloutsig_1_0z;
  assign { out_data[128], out_data[96], out_data[34:32] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_7z };
endmodule
