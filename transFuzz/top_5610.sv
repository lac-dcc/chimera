/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire [2:0] _07_;
  wire [6:0] _08_;
  wire [11:0] _09_;
  wire [22:0] _10_;
  reg [2:0] _11_;
  wire [14:0] _12_;
  wire [11:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [8:0] celloutsig_0_12z;
  wire [8:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire [3:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [5:0] celloutsig_0_21z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_2z;
  wire [13:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [17:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [7:0] celloutsig_0_7z;
  wire [51:0] celloutsig_0_8z;
  wire [5:0] celloutsig_0_9z;
  wire [5:0] celloutsig_1_0z;
  wire celloutsig_1_13z;
  wire [2:0] celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [6:0] celloutsig_1_4z;
  wire [21:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_11z = ~(celloutsig_0_4z & in_data[55]);
  assign celloutsig_0_10z = ~(celloutsig_0_2z | celloutsig_0_5z);
  assign celloutsig_0_31z = ~celloutsig_0_30z[4];
  assign celloutsig_0_26z = ~celloutsig_0_10z;
  assign celloutsig_0_19z = ~((celloutsig_0_3z[4] | celloutsig_0_8z[46]) & _02_);
  assign celloutsig_1_19z = celloutsig_1_7z | ~(_03_);
  assign celloutsig_0_17z = celloutsig_0_16z | ~(celloutsig_0_13z[6]);
  assign celloutsig_0_20z = celloutsig_0_11z | ~(celloutsig_0_12z[0]);
  assign celloutsig_0_4z = celloutsig_0_0z[1] ^ celloutsig_0_3z[14];
  assign celloutsig_0_27z = celloutsig_0_4z ^ celloutsig_0_17z;
  reg [2:0] _23_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _23_ <= 3'h0;
    else _23_ <= { in_data[181:180], celloutsig_1_1z };
  assign { _07_[2:1], _01_ } = _23_;
  reg [6:0] _24_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _24_ <= 7'h00;
    else _24_ <= in_data[181:175];
  assign { _04_, _08_[5:0] } = _24_;
  reg [11:0] _25_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _25_ <= 12'h000;
    else _25_ <= { _04_, _08_[5:1], celloutsig_1_0z };
  assign { _09_[11:10], _03_, _09_[8:7], _05_, _00_, _09_[4:0] } = _25_;
  reg [22:0] _26_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _26_ <= 23'h000000;
    else _26_ <= { celloutsig_1_6z[17:0], celloutsig_1_7z, _07_[2:1], _01_, celloutsig_1_8z };
  assign { _10_[22:10], _06_, _10_[8:0] } = _26_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _11_ <= 3'h0;
    else _11_ <= { celloutsig_0_1z[2:1], celloutsig_0_2z };
  reg [14:0] _28_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[64])
    if (clkin_data[64]) _28_ <= 15'h0000;
    else _28_ <= { in_data[11:6], celloutsig_0_13z };
  assign { _12_[14:12], _02_, _12_[10:0] } = _28_;
  assign celloutsig_1_0z = in_data[183:178] / { 1'h1, in_data[116:112] };
  assign celloutsig_0_12z = { celloutsig_0_7z, celloutsig_0_11z } / { 1'h1, celloutsig_0_0z[1:0], celloutsig_0_9z };
  assign celloutsig_0_13z = { celloutsig_0_12z[0], _11_, celloutsig_0_10z, celloutsig_0_1z } / { 1'h1, celloutsig_0_8z[10:5], celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_1_18z = { _10_[20], celloutsig_1_7z, celloutsig_1_14z } && { in_data[144:141], celloutsig_1_7z };
  assign celloutsig_0_5z = celloutsig_0_3z[11:1] && { in_data[51:49], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_14z = ! { celloutsig_0_0z[11:2], celloutsig_0_11z };
  assign celloutsig_0_32z = celloutsig_0_1z[0] & ~(_11_[2]);
  assign celloutsig_0_15z = celloutsig_0_0z[7] & ~(celloutsig_0_5z);
  assign celloutsig_0_16z = celloutsig_0_9z[1] & ~(celloutsig_0_8z[21]);
  assign celloutsig_0_0z = in_data[46:35] % { 1'h1, in_data[55:45] };
  assign celloutsig_1_4z = { _08_[0], celloutsig_1_0z } % { 1'h1, in_data[116:111] };
  assign celloutsig_0_30z = { in_data[30:21], celloutsig_0_15z, celloutsig_0_26z, celloutsig_0_27z, celloutsig_0_10z } % { 1'h1, _11_[1:0], celloutsig_0_21z, _11_, celloutsig_0_20z, celloutsig_0_14z };
  assign celloutsig_0_8z = celloutsig_0_4z ? { in_data[31:21], celloutsig_0_7z, _11_, celloutsig_0_0z, celloutsig_0_3z } : { in_data[92:61], 1'h0, celloutsig_0_1z, celloutsig_0_0z, _11_ };
  assign celloutsig_1_7z = { celloutsig_1_0z[2:1], celloutsig_1_1z } !== { _07_[2:1], _01_ };
  assign celloutsig_1_8z = { celloutsig_1_6z[20:14], celloutsig_1_7z } !== { _09_[11:10], _03_, _09_[8:7], _05_, _00_, _09_[4] };
  assign celloutsig_0_3z = { celloutsig_0_1z[2:1], celloutsig_0_0z, celloutsig_0_1z } >>> in_data[94:77];
  assign celloutsig_1_6z = { in_data[147:134], celloutsig_1_1z, celloutsig_1_4z } >>> { in_data[151:137], celloutsig_1_4z };
  assign celloutsig_1_14z = { _09_[7], _05_, _00_ } >>> { celloutsig_1_1z, celloutsig_1_13z, celloutsig_1_1z };
  assign celloutsig_0_7z = { in_data[83:77], celloutsig_0_5z } >>> { in_data[90:87], celloutsig_0_1z };
  assign celloutsig_0_9z = in_data[63:58] >>> { celloutsig_0_3z[6:4], _11_ };
  assign celloutsig_0_1z = in_data[45:42] >>> celloutsig_0_0z[5:2];
  assign celloutsig_0_21z = { _11_[2], celloutsig_0_4z, celloutsig_0_1z } >>> { celloutsig_0_12z[2:1], celloutsig_0_19z, celloutsig_0_16z, celloutsig_0_20z, celloutsig_0_4z };
  assign celloutsig_1_1z = ~((celloutsig_1_0z[5] & in_data[139]) | (in_data[110] & in_data[158]));
  assign celloutsig_1_13z = ~((celloutsig_1_6z[4] & celloutsig_1_1z) | (celloutsig_1_7z & celloutsig_1_1z));
  assign celloutsig_0_2z = ~((in_data[35] & in_data[50]) | (celloutsig_0_1z[2] & celloutsig_0_0z[10]));
  assign _07_[0] = _01_;
  assign _08_[6] = _04_;
  assign { _09_[9], _09_[6:5] } = { _03_, _05_, _00_ };
  assign _10_[9] = _06_;
  assign _12_[11] = _02_;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_31z, celloutsig_0_32z };
endmodule
