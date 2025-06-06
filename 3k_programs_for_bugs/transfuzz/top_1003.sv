/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire [26:0] _04_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [11:0] celloutsig_0_11z;
  wire [4:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [12:0] celloutsig_0_23z;
  wire celloutsig_0_3z;
  wire [2:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [25:0] celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [15:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [10:0] celloutsig_1_14z;
  wire [9:0] celloutsig_1_15z;
  wire [9:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [12:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [11:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[23] ? in_data[21] : in_data[42];
  assign celloutsig_1_13z = celloutsig_1_12z[2] ? celloutsig_1_9z[10] : celloutsig_1_5z[2];
  assign celloutsig_1_18z = celloutsig_1_2z ? celloutsig_1_17z : celloutsig_1_4z;
  assign celloutsig_1_19z = celloutsig_1_6z ? celloutsig_1_0z : celloutsig_1_2z;
  assign celloutsig_0_3z = _01_ ? _00_ : celloutsig_0_0z;
  assign celloutsig_0_22z = ~(celloutsig_0_12z[3] & celloutsig_0_18z);
  assign celloutsig_1_0z = ~(in_data[187] & in_data[173]);
  assign celloutsig_1_6z = ~(celloutsig_1_1z & celloutsig_1_1z);
  assign celloutsig_1_8z = ~(celloutsig_1_2z & celloutsig_1_4z);
  assign celloutsig_1_17z = celloutsig_1_16z[6] | ~(celloutsig_1_2z);
  assign celloutsig_0_6z = _03_ | ~(in_data[89]);
  reg [26:0] _16_;
  always_ff @(negedge celloutsig_1_19z, posedge clkin_data[0])
    if (clkin_data[0]) _16_ <= 27'h0000000;
    else _16_ <= in_data[94:68];
  assign { _04_[26], _02_, _04_[24:23], _01_, _04_[21:8], _00_, _04_[6:5], _03_, _04_[3:0] } = _16_;
  assign celloutsig_0_11z = celloutsig_0_7z[12:1] / { 1'h1, _04_[21:11] };
  assign celloutsig_0_23z = { _04_[26], _02_, _04_[24:23], _01_, _04_[21], celloutsig_0_12z, celloutsig_0_21z, celloutsig_0_20z } / { 1'h1, celloutsig_0_7z[19:12], celloutsig_0_5z, celloutsig_0_16z };
  assign celloutsig_1_7z = { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_2z } / { 1'h1, in_data[132:123], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_21z = ! { _04_[8], _00_, _04_[6:5], _03_, _04_[3:1], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_9z = ! { in_data[37:31], celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_15z = ! celloutsig_0_12z[4:2];
  assign celloutsig_1_3z = ! { in_data[102:100], celloutsig_1_1z };
  assign celloutsig_0_10z = { _02_, _04_[24:23], _01_, _04_[21:15] } < { _04_[24:23], _01_, _04_[21:15], celloutsig_0_6z };
  assign celloutsig_0_13z = celloutsig_0_7z[18:12] < in_data[40:34];
  assign celloutsig_0_14z = { celloutsig_0_12z[1], celloutsig_0_3z, celloutsig_0_0z } < in_data[65:63];
  assign celloutsig_0_17z = in_data[65:40] < { _04_[20:12], celloutsig_0_21z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_3z };
  assign celloutsig_1_14z = { celloutsig_1_9z[8:1], celloutsig_1_5z } % { 1'h1, in_data[155:147], celloutsig_1_13z };
  assign celloutsig_1_1z = in_data[171:163] !== { in_data[162:158], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_20z = & { celloutsig_0_21z, celloutsig_0_14z, celloutsig_0_9z, in_data[43:38] };
  assign celloutsig_0_16z = ~^ { celloutsig_0_7z[9:2], celloutsig_0_10z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_0z };
  assign celloutsig_0_18z = ~^ { celloutsig_0_7z[5:4], celloutsig_0_16z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_17z };
  assign celloutsig_1_4z = ~^ { celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_1_16z = celloutsig_1_7z[11:2] << celloutsig_1_15z;
  assign celloutsig_0_5z = { _04_[18:17], celloutsig_0_21z } << { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_9z = { in_data[150:140], celloutsig_1_2z } <<< celloutsig_1_7z[11:0];
  assign celloutsig_1_12z = in_data[126:111] <<< { in_data[165:152], celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_12z = { celloutsig_0_7z[3], celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_21z, celloutsig_0_10z } <<< { celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_21z };
  assign celloutsig_1_15z = { celloutsig_1_9z[11:3], celloutsig_1_0z } - { celloutsig_1_14z[7:4], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_8z };
  assign celloutsig_0_7z = { in_data[80:58], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_21z } - { _01_, _04_[21:8], _00_, _04_[6:5], _03_, _04_[3:0], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_1_5z = { in_data[163:162], celloutsig_1_2z } - { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_1_2z = ~((celloutsig_1_1z & celloutsig_1_1z) | (celloutsig_1_1z & in_data[110]));
  assign { _04_[25], _04_[22], _04_[7], _04_[4] } = { _02_, _01_, _00_, _03_ };
  assign { out_data[128], out_data[96], out_data[32], out_data[12:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_22z, celloutsig_0_23z };
endmodule
