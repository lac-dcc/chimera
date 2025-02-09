/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [2:0] _01_;
  wire [12:0] _02_;
  wire [5:0] celloutsig_0_0z;
  reg [2:0] celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [15:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [6:0] celloutsig_1_0z;
  wire celloutsig_1_13z;
  wire [7:0] celloutsig_1_17z;
  wire [14:0] celloutsig_1_18z;
  wire [4:0] celloutsig_1_19z;
  wire [4:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [4:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_13z = ~(_00_ | in_data[130]);
  assign celloutsig_0_5z = ~(celloutsig_0_0z[4] ^ celloutsig_0_1z[1]);
  reg [12:0] _05_;
  always_ff @(posedge clkin_data[64], posedge clkin_data[32])
    if (clkin_data[32]) _05_ <= 13'h0000;
    else _05_ <= { celloutsig_1_0z[6:1], celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_3z };
  assign { _02_[12:8], _01_[2:1], _00_, _02_[4:0] } = _05_;
  assign celloutsig_1_7z = { celloutsig_1_3z, celloutsig_1_2z } == { celloutsig_1_1z[2:1], celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_1_9z = celloutsig_1_0z[6:4] <= { celloutsig_1_3z[1], celloutsig_1_8z, celloutsig_1_4z };
  assign celloutsig_0_3z = { in_data[75:57], celloutsig_0_1z, celloutsig_0_0z } <= { in_data[70:49], celloutsig_0_0z };
  assign celloutsig_0_8z = celloutsig_0_3z & ~(celloutsig_0_2z);
  assign celloutsig_0_0z = - in_data[32:27];
  assign celloutsig_1_0z = - in_data[128:122];
  assign celloutsig_1_1z = in_data[156:152] | celloutsig_1_0z[5:1];
  assign celloutsig_1_17z = { celloutsig_1_3z[2], celloutsig_1_1z, celloutsig_1_13z, celloutsig_1_7z } | { _02_[9:8], _01_[2:1], _00_, _02_[4:2] };
  assign celloutsig_0_6z = | celloutsig_0_0z[2:0];
  assign celloutsig_1_2z = | { celloutsig_1_0z[5:3], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_8z = celloutsig_1_3z[0] & celloutsig_1_0z[0];
  assign celloutsig_0_2z = ~^ { in_data[36:31], celloutsig_0_1z };
  assign celloutsig_1_3z = celloutsig_1_1z >> { celloutsig_1_0z[4:2], celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_18z = { in_data[163:156], celloutsig_1_0z } >> { celloutsig_1_1z[4:3], celloutsig_1_1z, celloutsig_1_17z };
  assign celloutsig_1_19z = in_data[150:146] <<< { celloutsig_1_18z[8:6], celloutsig_1_9z, celloutsig_1_4z };
  assign celloutsig_0_7z = { in_data[32:18], celloutsig_0_5z } >>> { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_2z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_1z = 3'h0;
    else if (!celloutsig_1_19z[0]) celloutsig_0_1z = in_data[28:26];
  assign celloutsig_1_4z = ~((celloutsig_1_0z[1] & celloutsig_1_1z[1]) | (celloutsig_1_1z[2] & celloutsig_1_2z));
  assign _01_[0] = _00_;
  assign _02_[7:5] = { _01_[2:1], _00_ };
  assign { out_data[142:128], out_data[100:96], out_data[47:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_7z, celloutsig_0_8z };
endmodule
