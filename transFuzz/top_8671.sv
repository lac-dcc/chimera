/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [13:0] _00_;
  reg [5:0] _01_;
  reg [11:0] _02_;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [4:0] celloutsig_0_13z;
  wire [8:0] celloutsig_0_14z;
  wire [15:0] celloutsig_0_15z;
  wire [19:0] celloutsig_0_16z;
  wire [12:0] celloutsig_0_18z;
  wire [12:0] celloutsig_0_19z;
  wire [7:0] celloutsig_0_1z;
  wire [13:0] celloutsig_0_20z;
  wire celloutsig_0_23z;
  wire [2:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [3:0] celloutsig_0_29z;
  wire celloutsig_0_31z;
  wire [7:0] celloutsig_0_33z;
  wire [4:0] celloutsig_0_34z;
  wire [5:0] celloutsig_0_3z;
  wire [26:0] celloutsig_0_4z;
  wire [19:0] celloutsig_0_5z;
  wire [10:0] celloutsig_0_6z;
  wire [4:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire [16:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [7:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_19z;
  wire [8:0] celloutsig_1_1z;
  wire [15:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [6:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_31z = ~((celloutsig_0_15z[6] | celloutsig_0_19z[3]) & (celloutsig_0_5z[9] | celloutsig_0_1z[4]));
  assign celloutsig_1_5z = ~((in_data[119] | celloutsig_1_0z[4]) & (celloutsig_1_2z[12] | celloutsig_1_1z[2]));
  assign celloutsig_1_6z = ~((in_data[140] | celloutsig_1_2z[6]) & (celloutsig_1_0z[2] | celloutsig_1_3z));
  assign celloutsig_0_9z = ~((celloutsig_0_5z[15] | celloutsig_0_4z[25]) & (celloutsig_0_4z[22] | celloutsig_0_1z[3]));
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _02_ <= 12'h000;
    else _02_ <= in_data[70:59];
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _00_ <= 14'h0000;
    else _00_ <= in_data[39:26];
  always_ff @(negedge clkin_data[32], posedge clkin_data[64])
    if (clkin_data[64]) _01_ <= 6'h00;
    else _01_ <= celloutsig_1_2z[5:0];
  reg [7:0] _10_;
  always_ff @(posedge clkin_data[32], posedge clkin_data[64])
    if (clkin_data[64]) _10_ <= 8'h00;
    else _10_ <= { in_data[185:179], celloutsig_1_11z };
  assign out_data[135:128] = _10_;
  assign celloutsig_0_33z = { _00_[6:3], celloutsig_0_29z } % { 1'h1, _00_[9:4], celloutsig_0_31z };
  assign celloutsig_1_1z = in_data[135:127] % { 1'h1, in_data[150:143] };
  assign celloutsig_0_15z = { celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_13z } % 16'hffff;
  assign celloutsig_0_19z = { celloutsig_0_4z[22:21], celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_10z } % { 1'h1, celloutsig_0_16z[14:8], celloutsig_0_13z };
  assign celloutsig_0_29z = celloutsig_0_13z[3:0] % { 1'h1, celloutsig_0_27z, celloutsig_0_23z, celloutsig_0_9z };
  assign celloutsig_1_0z = in_data[128:124] * in_data[115:111];
  assign celloutsig_1_2z = in_data[115:100] * in_data[136:121];
  assign celloutsig_0_3z = celloutsig_0_1z[5:0] * in_data[31:26];
  assign celloutsig_1_10z = { celloutsig_1_0z[4], celloutsig_1_2z } * { celloutsig_1_8z[6:2], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_9z, celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_1_16z = { celloutsig_1_2z[9:4], celloutsig_1_4z, celloutsig_1_9z } * celloutsig_1_1z[8:1];
  assign celloutsig_0_4z = { in_data[81:61], celloutsig_0_3z } * { _00_[13:1], _00_ };
  assign celloutsig_0_5z = celloutsig_0_4z[19:0] * celloutsig_0_4z[24:5];
  assign celloutsig_0_6z = _02_[11:1] * { _00_[6:4], celloutsig_0_1z };
  assign celloutsig_0_7z = _00_[10:6] * celloutsig_0_3z[4:0];
  assign celloutsig_0_16z = { celloutsig_0_4z[21:15], celloutsig_0_8z, _02_ } * { in_data[6:4], celloutsig_0_15z, celloutsig_0_8z };
  assign celloutsig_0_34z = celloutsig_0_13z[0] ? celloutsig_0_18z[8:4] : celloutsig_0_15z[9:5];
  assign celloutsig_1_8z = celloutsig_1_5z ? { _01_, celloutsig_1_6z } : { celloutsig_1_1z[4:0], celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_13z = celloutsig_0_3z[1] ? { 3'h7, celloutsig_0_9z, celloutsig_0_8z } : { celloutsig_0_5z[10:7], celloutsig_0_9z };
  assign celloutsig_0_1z = in_data[47] ? _02_[7:0] : in_data[68:61];
  assign celloutsig_0_18z = celloutsig_0_14z[8] ? _00_[13:1] : { celloutsig_0_15z[13:2], celloutsig_0_8z };
  assign celloutsig_0_20z = celloutsig_0_19z[0] ? { celloutsig_0_10z, celloutsig_0_8z, _02_ } : { _00_[12:0], celloutsig_0_10z };
  assign celloutsig_0_26z = celloutsig_0_3z[4] ? celloutsig_0_16z[12:10] : celloutsig_0_1z[6:4];
  assign celloutsig_1_3z = celloutsig_1_2z[7:1] !== in_data[102:96];
  assign celloutsig_1_4z = celloutsig_1_1z !== celloutsig_1_2z[12:4];
  assign celloutsig_1_17z = { celloutsig_1_1z[8:2], celloutsig_1_16z, _01_, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_9z } !== { in_data[162:156], celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_11z, celloutsig_1_13z, celloutsig_1_4z, celloutsig_1_11z, celloutsig_1_12z, celloutsig_1_13z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_11z };
  assign celloutsig_1_19z = { celloutsig_1_10z[12:9], celloutsig_1_17z, celloutsig_1_17z } !== { celloutsig_1_8z[6:2], celloutsig_1_12z };
  assign celloutsig_0_10z = { celloutsig_0_5z[4:1], celloutsig_0_9z } !== _00_[13:9];
  assign celloutsig_0_11z = { _02_[8:7], celloutsig_0_8z } !== { celloutsig_0_1z[5], celloutsig_0_9z, celloutsig_0_10z };
  assign celloutsig_0_27z = { celloutsig_0_6z[7], celloutsig_0_26z } !== celloutsig_0_20z[11:8];
  assign celloutsig_1_13z = celloutsig_1_6z & celloutsig_1_1z[5];
  assign celloutsig_1_9z = ~^ celloutsig_1_1z[5:0];
  assign celloutsig_1_12z = ~^ { celloutsig_1_10z[11:5], celloutsig_1_11z };
  assign celloutsig_1_11z = ^ { celloutsig_1_9z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_3z, _01_, celloutsig_1_5z };
  assign celloutsig_0_8z = ^ { _00_[6], celloutsig_0_3z };
  assign celloutsig_0_23z = ^ { in_data[73:63], celloutsig_0_8z, celloutsig_0_5z };
  assign celloutsig_0_14z = _02_[11:3] ~^ { _00_[7:3], celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_10z };
  assign { out_data[96], out_data[39:32], out_data[4:0] } = { celloutsig_1_19z, celloutsig_0_33z, celloutsig_0_34z };
endmodule
