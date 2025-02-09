/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire [15:0] _06_;
  wire [35:0] _07_;
  reg [11:0] _08_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [14:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire [2:0] celloutsig_0_16z;
  wire [4:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [12:0] celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire [6:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [3:0] celloutsig_0_31z;
  wire [5:0] celloutsig_0_37z;
  wire [2:0] celloutsig_0_3z;
  wire celloutsig_0_48z;
  wire [3:0] celloutsig_0_49z;
  wire celloutsig_0_50z;
  wire [9:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [4:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_91z;
  wire celloutsig_0_92z;
  wire celloutsig_0_9z;
  wire [14:0] celloutsig_1_0z;
  wire [9:0] celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_17z;
  wire [21:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [3:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [13:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = !(in_data[92] ? in_data[92] : in_data[48]);
  assign celloutsig_0_48z = !(celloutsig_0_31z[0] ? celloutsig_0_37z[1] : celloutsig_0_27z);
  assign celloutsig_0_50z = !(celloutsig_0_48z ? celloutsig_0_31z[3] : celloutsig_0_9z);
  assign celloutsig_0_6z = !(_03_ ? celloutsig_0_0z : _00_);
  assign celloutsig_0_91z = !(celloutsig_0_14z[2] ? celloutsig_0_13z[2] : celloutsig_0_37z[2]);
  assign celloutsig_0_92z = !(celloutsig_0_49z[3] ? celloutsig_0_6z : celloutsig_0_50z);
  assign celloutsig_1_2z = !(celloutsig_1_1z ? in_data[127] : in_data[190]);
  assign celloutsig_1_6z = !(celloutsig_1_1z ? celloutsig_1_0z[6] : celloutsig_1_4z[2]);
  assign celloutsig_1_9z = !(celloutsig_1_6z ? celloutsig_1_6z : celloutsig_1_8z);
  assign celloutsig_1_14z = !(celloutsig_1_2z ? celloutsig_1_13z : celloutsig_1_13z);
  assign celloutsig_1_17z = !(celloutsig_1_9z ? celloutsig_1_9z : celloutsig_1_11z[0]);
  assign celloutsig_0_1z = !(celloutsig_0_0z ? celloutsig_0_0z : in_data[77]);
  assign celloutsig_0_20z = !(celloutsig_0_10z ? _04_ : celloutsig_0_19z);
  assign celloutsig_0_25z = !(_05_ ? celloutsig_0_13z[13] : celloutsig_0_13z[12]);
  assign celloutsig_0_27z = !(celloutsig_0_10z ? in_data[85] : celloutsig_0_0z);
  reg [15:0] _24_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _24_ <= 16'h0000;
    else _24_ <= in_data[50:35];
  assign { _00_, _06_[14:11], _05_, _01_, _06_[8:5], _03_, _06_[3:2], _04_, _06_[0] } = _24_;
  reg [35:0] _25_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _25_ <= 36'h000000000;
    else _25_ <= { celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_7z, _00_, _06_[14:11], _05_, _01_, _06_[8:5], _03_, _06_[3:2], _04_, _06_[0] };
  assign { _07_[35:15], _02_, _07_[13:0] } = _25_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _08_ <= 12'h000;
    else _08_ <= celloutsig_0_13z[12:1];
  assign celloutsig_0_8z = { _01_, _06_[8:7], celloutsig_0_5z } < { in_data[93:91], celloutsig_0_5z };
  assign celloutsig_1_1z = in_data[182:165] < in_data[150:133];
  assign celloutsig_0_9z = { celloutsig_0_7z[3:0], celloutsig_0_6z, celloutsig_0_8z } < { in_data[4:0], celloutsig_0_1z };
  assign celloutsig_1_3z = { in_data[120:115], celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z } < in_data[171:163];
  assign celloutsig_1_5z = { celloutsig_1_0z[12:7], celloutsig_1_2z } < { in_data[137:133], celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_1_8z = in_data[191:180] < { celloutsig_1_7z[11:5], celloutsig_1_4z, celloutsig_1_6z };
  assign celloutsig_0_10z = in_data[10:5] < { celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_1_13z = in_data[107:105] < in_data[146:144];
  assign celloutsig_1_19z = { celloutsig_1_18z[13:12], celloutsig_1_2z } < { celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_17z };
  assign celloutsig_0_12z = { celloutsig_0_11z, celloutsig_0_10z } < { _06_[7:5], _03_, celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_0_19z = { _00_, _06_[14:13] } < { _07_[25:24], celloutsig_0_10z };
  assign celloutsig_0_2z = in_data[66:59] < { in_data[47:41], celloutsig_0_0z };
  assign celloutsig_0_28z = { celloutsig_0_12z, celloutsig_0_26z, celloutsig_0_27z, celloutsig_0_25z, celloutsig_0_1z, celloutsig_0_20z, celloutsig_0_0z } < { celloutsig_0_23z[5:1], celloutsig_0_14z, celloutsig_0_18z };
  assign celloutsig_0_31z = { celloutsig_0_16z, celloutsig_0_12z } % { 1'h1, celloutsig_0_11z[2:0] };
  assign celloutsig_0_3z = { celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z } % { 1'h1, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_37z = { celloutsig_0_28z, celloutsig_0_7z } % { 1'h1, celloutsig_0_5z[5:1] };
  assign celloutsig_0_49z = celloutsig_0_23z[3:0] % { 1'h1, _08_[7:6], celloutsig_0_27z };
  assign celloutsig_0_5z = in_data[9:0] % { 1'h1, _06_[11], _05_, _01_, _06_[8:6], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_7z = celloutsig_0_5z[6:2] % { 1'h1, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_0z = in_data[121:107] % { 1'h1, in_data[142:129] };
  assign celloutsig_1_4z = { celloutsig_1_0z[2:0], celloutsig_1_2z } % { 1'h1, in_data[138:136] };
  assign celloutsig_1_7z = in_data[140:127] % { 1'h1, in_data[107:99], celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_3z };
  assign celloutsig_1_10z = { celloutsig_1_7z[10:2], celloutsig_1_1z } % { 1'h1, celloutsig_1_7z[3:2], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_5z };
  assign celloutsig_1_11z = { in_data[134], celloutsig_1_2z, celloutsig_1_2z } % { 1'h1, celloutsig_1_4z[2:1] };
  assign celloutsig_1_18z = { in_data[183:167], celloutsig_1_6z, celloutsig_1_4z } % { 1'h1, celloutsig_1_10z[8:3], celloutsig_1_2z, celloutsig_1_13z, celloutsig_1_5z, celloutsig_1_10z, celloutsig_1_17z, celloutsig_1_14z };
  assign celloutsig_0_11z = { _06_[2], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_6z } % { 1'h1, in_data[51:48] };
  assign celloutsig_0_13z = { celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_3z } % { 1'h1, celloutsig_0_5z[8:2], celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_12z };
  assign celloutsig_0_14z = in_data[46:44] % { 1'h1, celloutsig_0_1z, celloutsig_0_10z };
  assign celloutsig_0_16z = celloutsig_0_7z[4:2] % { 1'h1, celloutsig_0_12z, celloutsig_0_10z };
  assign celloutsig_0_18z = { celloutsig_0_7z[3], celloutsig_0_6z, celloutsig_0_16z } % { 1'h1, celloutsig_0_16z[1:0], celloutsig_0_9z, celloutsig_0_6z };
  assign celloutsig_0_23z = { celloutsig_0_7z[4:1], celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_19z } % { 1'h1, celloutsig_0_14z[1], celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_7z };
  assign celloutsig_0_26z = { _05_, _01_, _06_[8:5], _03_ } % { 1'h1, celloutsig_0_20z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_16z };
  assign { _06_[15], _06_[10:9], _06_[4], _06_[1] } = { _00_, _05_, _01_, _03_, _04_ };
  assign _07_[14] = _02_;
  assign { out_data[149:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_91z, celloutsig_0_92z };
endmodule
