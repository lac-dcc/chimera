/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  reg [8:0] _02_;
  wire [12:0] _03_;
  wire celloutsig_0_0z;
  wire [7:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [16:0] celloutsig_0_13z;
  reg [3:0] celloutsig_0_14z;
  wire [4:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [4:0] celloutsig_0_23z;
  wire [21:0] celloutsig_0_24z;
  wire celloutsig_0_26z;
  reg [5:0] celloutsig_0_2z;
  reg [6:0] celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [3:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire [7:0] celloutsig_0_60z;
  wire [7:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_1_12z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [8:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[58] ? in_data[57] : in_data[92];
  assign celloutsig_0_33z = celloutsig_0_4z ? celloutsig_0_26z : celloutsig_0_31z[0];
  assign celloutsig_0_49z = celloutsig_0_39z ? celloutsig_0_0z : celloutsig_0_33z;
  assign celloutsig_0_7z = celloutsig_0_5z ? celloutsig_0_0z : celloutsig_0_6z[0];
  assign celloutsig_0_16z = celloutsig_0_12z ? celloutsig_0_3z : celloutsig_0_8z;
  assign celloutsig_0_17z = celloutsig_0_4z ? celloutsig_0_13z[4] : celloutsig_0_0z;
  assign celloutsig_0_20z = celloutsig_0_17z ? celloutsig_0_16z : celloutsig_0_4z;
  assign celloutsig_0_21z = celloutsig_0_20z ? celloutsig_0_15z[1] : celloutsig_0_20z;
  assign celloutsig_0_39z = ~(celloutsig_0_21z & celloutsig_0_14z[2]);
  assign celloutsig_0_5z = ~(celloutsig_0_0z & celloutsig_0_0z);
  assign celloutsig_1_5z = ~(celloutsig_1_4z[5] & in_data[180]);
  assign celloutsig_1_8z = ~(celloutsig_1_5z & celloutsig_1_2z);
  assign celloutsig_1_18z = ~(celloutsig_1_7z & celloutsig_1_12z);
  always_ff @(posedge clkin_data[64], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _02_ <= 9'h000;
    else _02_ <= celloutsig_0_13z[13:5];
  reg [12:0] _18_;
  always_ff @(posedge clkin_data[128], negedge clkin_data[32])
    if (!clkin_data[32]) _18_ <= 13'h0000;
    else _18_ <= in_data[172:160];
  assign { _03_[12], _01_, _03_[10:8], _00_, _03_[6:0] } = _18_;
  assign celloutsig_0_18z = { celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_6z, celloutsig_0_8z } == celloutsig_0_13z[16:1];
  assign celloutsig_0_26z = { celloutsig_0_12z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_12z } == { celloutsig_0_21z, celloutsig_0_7z, celloutsig_0_18z, celloutsig_0_5z };
  assign celloutsig_1_1z = { in_data[107:104], _03_[12], _01_, _03_[10:8], _00_, _03_[6:0] } === in_data[113:97];
  assign celloutsig_1_2z = { in_data[179:165], celloutsig_1_1z } === { _03_[5:4], celloutsig_1_1z, _03_[12], _01_, _03_[10:8], _00_, _03_[6:0] };
  assign celloutsig_1_6z = _03_[2:0] === { _03_[5:4], celloutsig_1_5z };
  assign celloutsig_1_12z = celloutsig_1_4z[3:1] === { celloutsig_1_4z[1], celloutsig_1_3z, celloutsig_1_8z };
  assign celloutsig_0_3z = { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z } >= in_data[51:48];
  assign celloutsig_0_4z = celloutsig_0_2z[4:1] >= { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_1_19z = celloutsig_1_4z[4:0] >= { _03_[1:0], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_6z };
  assign celloutsig_0_11z = { celloutsig_0_6z[1:0], celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_0z } >= { in_data[60:58], celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_12z = { celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_4z } >= celloutsig_0_2z[5:2];
  assign celloutsig_0_1z = { in_data[68:60], celloutsig_0_0z } >= { in_data[50:42], celloutsig_0_0z };
  assign celloutsig_0_22z = { celloutsig_0_6z[6:2], celloutsig_0_5z } >= { celloutsig_0_0z, celloutsig_0_15z };
  assign celloutsig_0_41z = { celloutsig_0_24z[11:7], celloutsig_0_21z } < { _02_[4:0], celloutsig_0_3z };
  assign celloutsig_1_3z = { in_data[148], celloutsig_1_2z, celloutsig_1_2z } < { celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_7z = { celloutsig_1_4z[4:1], celloutsig_1_2z, celloutsig_1_4z } < { _01_, _03_[10:8], _00_, _03_[6:0], celloutsig_1_2z, celloutsig_1_3z };
  assign celloutsig_0_8z = { in_data[87:74], celloutsig_0_3z, celloutsig_0_5z } < { in_data[81:74], celloutsig_0_6z };
  assign celloutsig_0_19z = { celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_5z } < { in_data[14:4], celloutsig_0_0z };
  assign celloutsig_0_59z = { celloutsig_0_41z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_11z } | celloutsig_0_23z[4:1];
  assign celloutsig_0_60z = celloutsig_0_10z | { celloutsig_0_13z[12:9], celloutsig_0_49z, celloutsig_0_22z, celloutsig_0_16z, celloutsig_0_26z };
  assign celloutsig_0_6z = { celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_5z } | { celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_2z };
  assign celloutsig_1_4z = { _03_[10:8], _00_, _03_[6:4], celloutsig_1_2z, celloutsig_1_1z } | { _03_[12], _01_, _03_[10:8], _00_, _03_[6:5], celloutsig_1_2z };
  assign celloutsig_0_10z = celloutsig_0_6z | { in_data[57:51], celloutsig_0_8z };
  assign celloutsig_0_13z = { in_data[23:8], celloutsig_0_0z } | { celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_10z };
  assign celloutsig_0_15z = { celloutsig_0_2z[0], celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_0z } | celloutsig_0_13z[15:11];
  assign celloutsig_0_23z = celloutsig_0_2z[4:0] | { celloutsig_0_15z[4:1], celloutsig_0_0z };
  assign celloutsig_0_24z = { in_data[80:68], celloutsig_0_22z, celloutsig_0_23z, celloutsig_0_17z, celloutsig_0_0z, celloutsig_0_4z } | { in_data[43:38], celloutsig_0_19z, celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_2z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_31z = 7'h00;
    else if (!clkin_data[0]) celloutsig_0_31z = { celloutsig_0_10z[3], celloutsig_0_2z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_14z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_14z = in_data[33:30];
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_2z = 6'h00;
    else if (clkin_data[0]) celloutsig_0_2z = in_data[23:18];
  assign { _03_[11], _03_[7] } = { _01_, _00_ };
  assign { out_data[128], out_data[96], out_data[35:32], out_data[7:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_59z, celloutsig_0_60z };
endmodule
