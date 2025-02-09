/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [7:0] _03_;
  wire celloutsig_0_10z;
  wire [4:0] celloutsig_0_12z;
  wire [11:0] celloutsig_0_15z;
  wire celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire [5:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [8:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [2:0] celloutsig_0_9z;
  wire [6:0] celloutsig_1_0z;
  wire [7:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire [2:0] celloutsig_1_14z;
  wire [17:0] celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [10:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_11z = ~(celloutsig_1_0z[2] & celloutsig_1_2z);
  assign celloutsig_1_18z = ~(celloutsig_1_16z & celloutsig_1_17z);
  assign celloutsig_0_3z = ~(_00_ & in_data[35]);
  assign celloutsig_0_6z = ~(celloutsig_0_2z[1] & celloutsig_0_5z);
  assign celloutsig_0_21z = ~(celloutsig_0_15z[9] & celloutsig_0_3z);
  assign celloutsig_1_2z = ~(celloutsig_1_1z & in_data[181]);
  assign celloutsig_1_3z = ~(celloutsig_1_2z & in_data[135]);
  assign celloutsig_1_7z = ~(celloutsig_1_2z & celloutsig_1_1z);
  assign celloutsig_1_8z = ~in_data[154];
  assign celloutsig_1_13z = celloutsig_1_10z[5] ^ celloutsig_1_8z;
  assign celloutsig_1_17z = celloutsig_1_4z[2] ^ celloutsig_1_15z[14];
  assign celloutsig_0_4z = ~(_01_ ^ _02_);
  reg [7:0] _16_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[32])
    if (clkin_data[32]) _16_ <= 8'h00;
    else _16_ <= in_data[41:34];
  assign { _00_, _03_[6], _01_, _03_[4], _02_, _03_[2:0] } = _16_;
  reg [7:0] _17_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _17_ <= 8'h00;
    else _17_ <= { celloutsig_0_2z[3:2], celloutsig_0_12z, celloutsig_0_10z };
  assign out_data[39:32] = _17_;
  assign celloutsig_1_0z = in_data[112:106] / { 1'h1, in_data[187:182] };
  assign celloutsig_1_1z = celloutsig_1_0z >= in_data[148:142];
  assign celloutsig_0_5z = { _00_, _03_[6], _01_, celloutsig_0_4z } > celloutsig_0_2z[4:1];
  assign celloutsig_1_15z = celloutsig_1_14z[2] ? { celloutsig_1_4z[5:1], celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_4z } : { celloutsig_1_11z, 1'h0, celloutsig_1_14z[1:0], celloutsig_1_3z, celloutsig_1_13z, celloutsig_1_10z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_13z, celloutsig_1_5z };
  assign celloutsig_1_4z = celloutsig_1_0z[4] ? in_data[161:151] : { in_data[106:97], celloutsig_1_1z };
  assign celloutsig_1_10z = in_data[154] ? in_data[151:144] : { in_data[185:179], celloutsig_1_7z };
  assign celloutsig_1_5z = { in_data[167:153], celloutsig_1_1z, celloutsig_1_0z } != { celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_16z = { celloutsig_1_10z[4:1], celloutsig_1_8z } !== { celloutsig_1_14z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_0_8z = { _03_[2:1], celloutsig_0_4z } !== { celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_10z = { _02_, _03_[2:0], celloutsig_0_2z, _00_, _03_[6], _01_, _03_[4], _02_, _03_[2:0], celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_7z[1:0], celloutsig_0_1z } !== { celloutsig_0_7z[3], celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_6z, _00_, celloutsig_0_9z };
  assign celloutsig_1_14z = ~ celloutsig_1_0z[5:3];
  assign celloutsig_0_2z = ~ in_data[68:63];
  assign celloutsig_0_7z = ~ { in_data[14:7], celloutsig_0_6z };
  assign celloutsig_0_9z = ~ { in_data[73:72], celloutsig_0_5z };
  assign celloutsig_0_12z = ~ { _00_, _03_[6], _01_, _03_[4], _02_ };
  assign celloutsig_0_15z = ~ { in_data[66:64], celloutsig_0_7z };
  assign celloutsig_1_19z = ~((celloutsig_1_5z & celloutsig_1_14z[1]) | (celloutsig_1_10z[1] & celloutsig_1_17z));
  assign celloutsig_0_1z = ~((in_data[66] & _00_) | (in_data[79] & _01_));
  assign { _03_[7], _03_[5], _03_[3] } = { _00_, _01_, _02_ };
  assign { out_data[128], out_data[96], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_21z };
endmodule
