/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [5:0] _01_;
  wire [8:0] _02_;
  wire celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire [11:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [7:0] celloutsig_0_19z;
  wire [12:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [9:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [2:0] celloutsig_0_24z;
  wire [12:0] celloutsig_0_25z;
  wire [17:0] celloutsig_0_26z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire [4:0] celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire [3:0] celloutsig_0_39z;
  wire [2:0] celloutsig_0_3z;
  wire [3:0] celloutsig_0_40z;
  wire celloutsig_0_44z;
  wire celloutsig_0_4z;
  wire celloutsig_0_54z;
  wire celloutsig_0_57z;
  wire [9:0] celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire celloutsig_0_6z;
  wire [7:0] celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [3:0] celloutsig_1_2z;
  wire [12:0] celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [11:0] celloutsig_1_7z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_54z = !(celloutsig_0_39z[2] ? celloutsig_0_40z[1] : celloutsig_0_3z[1]);
  assign celloutsig_0_44z = ~celloutsig_0_57z;
  assign celloutsig_0_65z = ~(celloutsig_0_44z ^ celloutsig_0_57z);
  assign celloutsig_0_13z = ~(_00_ ^ celloutsig_0_10z);
  assign celloutsig_0_20z = ~(celloutsig_0_57z ^ celloutsig_0_10z);
  assign celloutsig_0_32z = ~(celloutsig_0_22z[4] ^ celloutsig_0_18z);
  assign celloutsig_0_35z = { celloutsig_0_12z[2:0], celloutsig_0_20z, celloutsig_0_30z } + { celloutsig_0_32z, celloutsig_0_24z, celloutsig_0_4z };
  assign celloutsig_1_7z = { in_data[144:137], celloutsig_1_2z } + { celloutsig_1_4z[10:4], celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_0z };
  reg [8:0] _11_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _11_ <= 9'h000;
    else _11_ <= in_data[33:25];
  assign { _02_[8:4], _00_, _02_[2:0] } = _11_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _01_ <= 6'h00;
    else _01_ <= in_data[189:184];
  assign celloutsig_0_3z = in_data[84:82] & in_data[13:11];
  assign celloutsig_1_4z = { _01_[0], celloutsig_1_0z, _01_, celloutsig_1_0z, celloutsig_1_2z } & in_data[189:177];
  assign celloutsig_0_11z = { _02_[7:4], celloutsig_0_9z } & { in_data[50:49], celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_17z = { celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_57z } & { celloutsig_0_1z[5:4], celloutsig_0_15z };
  assign celloutsig_0_40z = celloutsig_0_26z[7:4] / { 1'h1, celloutsig_0_25z[1:0], celloutsig_0_4z };
  assign celloutsig_0_64z = { celloutsig_0_7z[6:2], celloutsig_0_30z, celloutsig_0_54z, celloutsig_0_3z } / { 1'h1, celloutsig_0_1z[7:4], celloutsig_0_13z, celloutsig_0_40z };
  assign celloutsig_0_24z = celloutsig_0_22z[7:5] / { 1'h1, celloutsig_0_7z[1:0] };
  assign celloutsig_0_25z = { celloutsig_0_57z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_24z, celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_23z } / { 1'h1, in_data[86:75] };
  assign celloutsig_0_4z = { celloutsig_0_1z[12:1], celloutsig_0_2z } >= { celloutsig_0_1z[8], celloutsig_0_3z, _02_[8:4], _00_, _02_[2:0] };
  assign celloutsig_0_10z = celloutsig_0_1z[9:6] >= in_data[80:77];
  assign celloutsig_0_39z = _02_[1] ? { celloutsig_0_3z[2], celloutsig_0_24z } : { celloutsig_0_22z[5:3], celloutsig_0_37z };
  assign celloutsig_0_7z = _02_[5] ? { in_data[60:55], celloutsig_0_2z, celloutsig_0_57z } : { celloutsig_0_1z[10:4], celloutsig_0_4z };
  assign celloutsig_1_2z = celloutsig_1_0z ? in_data[148:145] : 4'h0;
  assign celloutsig_0_12z = celloutsig_0_57z ? { celloutsig_0_3z, _02_[8:4], _00_, _02_[2:0] } : { celloutsig_0_11z[3:0], 1'h0, celloutsig_0_10z, celloutsig_0_44z, celloutsig_0_11z };
  assign celloutsig_0_19z = celloutsig_0_6z ? { celloutsig_0_1z[5:4], celloutsig_0_15z, celloutsig_0_17z, celloutsig_0_4z, 1'h1 } : { celloutsig_0_12z[10:6], celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_16z };
  assign celloutsig_0_22z[9:3] = celloutsig_0_57z ? { in_data[40:37], celloutsig_0_18z, celloutsig_0_4z, celloutsig_0_9z } : celloutsig_0_19z[6:0];
  assign celloutsig_0_26z = celloutsig_0_57z ? { celloutsig_0_19z, celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_19z } : { celloutsig_0_25z[12:1], celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_44z };
  assign celloutsig_0_15z = { celloutsig_0_11z, _02_[8:4], _00_, _02_[2:0], celloutsig_0_57z } != { celloutsig_0_12z[9:1], celloutsig_0_11z, celloutsig_0_13z };
  assign celloutsig_1_5z = ~ celloutsig_1_2z[2:0];
  assign celloutsig_0_1z = ~ in_data[14:2];
  assign celloutsig_0_57z = | celloutsig_0_3z;
  assign celloutsig_1_0z = | in_data[154:139];
  assign celloutsig_0_9z = | { _02_[8:4], _00_, _02_[2] };
  assign celloutsig_0_23z = | { celloutsig_0_12z[5:0], _02_[8:4], _00_, _02_[2:0], celloutsig_0_17z };
  assign celloutsig_0_30z = | { celloutsig_0_15z, celloutsig_0_17z };
  assign celloutsig_0_37z = ~^ celloutsig_0_35z[3:0];
  assign celloutsig_0_6z = ~^ { celloutsig_0_1z[8:7], celloutsig_0_2z };
  assign celloutsig_1_6z = ~^ { in_data[162:160], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_18z = ~^ celloutsig_1_7z[9:5];
  assign celloutsig_1_19z = ~^ { celloutsig_1_7z[7:1], celloutsig_1_6z, celloutsig_1_5z };
  assign celloutsig_0_16z = ~^ { celloutsig_0_12z[11:8], celloutsig_0_44z };
  assign celloutsig_0_18z = ~^ { in_data[83:82], celloutsig_0_15z, celloutsig_0_1z };
  assign celloutsig_0_2z = ~^ { _02_[6:4], _00_, _02_[2] };
  assign _02_[3] = _00_;
  assign celloutsig_0_22z[2:0] = celloutsig_0_3z;
  assign { out_data[128], out_data[96], out_data[41:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_64z, celloutsig_0_65z };
endmodule
