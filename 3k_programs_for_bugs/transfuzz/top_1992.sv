/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [5:0] _00_;
  reg [2:0] _01_;
  wire [4:0] celloutsig_0_0z;
  wire [3:0] celloutsig_0_10z;
  wire [27:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [10:0] celloutsig_0_13z;
  wire [29:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [16:0] celloutsig_0_18z;
  wire [5:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [10:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire [2:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_36z;
  wire [5:0] celloutsig_0_39z;
  wire [4:0] celloutsig_0_45z;
  wire [4:0] celloutsig_0_47z;
  wire [10:0] celloutsig_0_49z;
  wire [2:0] celloutsig_0_4z;
  wire celloutsig_0_55z;
  wire [4:0] celloutsig_0_56z;
  reg [3:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [3:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  reg [2:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [6:0] celloutsig_1_11z;
  wire [4:0] celloutsig_1_12z;
  wire [4:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [4:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [13:0] celloutsig_1_4z;
  reg [3:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_15z = celloutsig_1_9z | celloutsig_1_14z;
  assign celloutsig_0_27z = celloutsig_0_26z | celloutsig_0_18z[5];
  assign celloutsig_1_4z = { in_data[109:100], celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z } + { in_data[154:145], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_7z = { celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z } + { in_data[107:106], celloutsig_1_0z };
  assign celloutsig_1_11z = { celloutsig_1_5z[0], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_10z } + { celloutsig_1_5z[1:0], celloutsig_1_6z, celloutsig_1_5z };
  assign celloutsig_1_16z = { celloutsig_1_11z[2], celloutsig_1_7z, celloutsig_1_2z } + celloutsig_1_12z;
  reg [4:0] _08_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[0])
    if (clkin_data[0]) _08_ <= 5'h00;
    else _08_ <= in_data[56:52];
  assign _00_[4:0] = _08_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _01_ <= 3'h0;
    else _01_ <= celloutsig_0_0z[2:0];
  assign celloutsig_0_15z = { in_data[72:69], celloutsig_0_2z, _01_ } >= { celloutsig_0_13z[6:2], _00_[4:0] };
  assign celloutsig_0_39z = { celloutsig_0_15z, _01_, celloutsig_0_27z, celloutsig_0_36z } % { 1'h1, in_data[56], celloutsig_0_31z, celloutsig_0_2z };
  assign celloutsig_0_49z = { celloutsig_0_22z[6:2], celloutsig_0_47z, celloutsig_0_31z } % { 1'h1, celloutsig_0_18z[15:6] };
  assign celloutsig_0_4z = celloutsig_0_0z[4:2] % { 1'h1, celloutsig_0_2z[1:0] };
  assign celloutsig_1_12z = { celloutsig_1_11z[3:1], celloutsig_1_0z, celloutsig_1_1z } % { 1'h1, celloutsig_1_11z[4:2], celloutsig_1_2z };
  assign celloutsig_1_13z = celloutsig_1_11z[4:0] % { 1'h1, in_data[108:106], celloutsig_1_3z };
  assign celloutsig_0_14z = { celloutsig_0_11z[26:11], celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_12z } % { 1'h1, in_data[56:28] };
  assign celloutsig_0_18z = { celloutsig_0_11z[6:2], celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_9z } % { 1'h1, in_data[93:83], _00_[4:0] };
  assign celloutsig_0_22z = celloutsig_0_13z % { 1'h1, celloutsig_0_15z, celloutsig_0_20z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_15z };
  assign celloutsig_0_30z = { celloutsig_0_5z[3:2], celloutsig_0_21z } != celloutsig_0_5z[2:0];
  assign celloutsig_0_32z = { celloutsig_0_4z[2:1], celloutsig_0_6z, celloutsig_0_26z } != { celloutsig_0_31z, celloutsig_0_23z, celloutsig_0_29z, celloutsig_0_25z };
  assign celloutsig_0_8z = { celloutsig_0_0z[2:1], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_5z } != { celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_2z };
  assign celloutsig_0_21z = celloutsig_0_11z[13:6] != { _01_, celloutsig_0_0z };
  assign celloutsig_0_47z = - celloutsig_0_45z;
  assign celloutsig_0_7z = - in_data[80:77];
  assign celloutsig_0_10z = - { _01_[0], celloutsig_0_2z };
  assign celloutsig_0_20z = - { celloutsig_0_14z[29], celloutsig_0_6z, celloutsig_0_7z };
  assign celloutsig_0_31z = | { celloutsig_0_26z, celloutsig_0_23z, celloutsig_0_17z, celloutsig_0_2z };
  assign celloutsig_0_36z = | { celloutsig_0_29z, celloutsig_0_16z, celloutsig_0_14z[29:15], _01_ };
  assign celloutsig_1_19z = | { celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_56z = celloutsig_0_49z[6:2] << { celloutsig_0_11z[22], celloutsig_0_7z };
  assign celloutsig_0_13z = { celloutsig_0_8z, _00_[4:0], celloutsig_0_5z, celloutsig_0_6z } << { celloutsig_0_11z[17:10], celloutsig_0_4z };
  assign celloutsig_0_0z = in_data[68:64] <<< in_data[29:25];
  assign celloutsig_0_45z = celloutsig_0_18z[7:3] <<< celloutsig_0_39z[4:0];
  assign celloutsig_0_11z = { in_data[91:75], celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_10z } <<< { celloutsig_0_8z, celloutsig_0_9z, _00_[4:0], celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_5z, _01_, celloutsig_0_5z };
  assign celloutsig_0_2z = in_data[13:11] <<< celloutsig_0_0z[4:2];
  assign celloutsig_0_29z = ~((celloutsig_0_10z[0] & celloutsig_0_8z) | celloutsig_0_6z);
  assign celloutsig_1_1z = ~((in_data[163] & celloutsig_1_0z) | celloutsig_1_0z);
  assign celloutsig_1_2z = ~((in_data[125] & celloutsig_1_0z) | celloutsig_1_1z);
  assign celloutsig_1_3z = ~((in_data[96] & in_data[135]) | celloutsig_1_1z);
  assign celloutsig_1_6z = ~((in_data[125] & celloutsig_1_4z[10]) | celloutsig_1_2z);
  assign celloutsig_1_10z = ~((in_data[140] & celloutsig_1_8z) | celloutsig_1_8z);
  assign celloutsig_0_6z = ~((celloutsig_0_4z[2] & celloutsig_0_2z[0]) | in_data[29]);
  assign celloutsig_1_14z = ~((celloutsig_1_5z[3] & celloutsig_1_8z) | celloutsig_1_13z[4]);
  assign celloutsig_0_12z = ~((in_data[33] & celloutsig_0_4z[0]) | celloutsig_0_5z[1]);
  assign celloutsig_0_16z = ~((celloutsig_0_8z & celloutsig_0_9z[1]) | celloutsig_0_12z);
  assign celloutsig_0_17z = ~((celloutsig_0_9z[0] & celloutsig_0_9z[0]) | celloutsig_0_10z[2]);
  assign celloutsig_0_23z = ~((celloutsig_0_20z[5] & celloutsig_0_7z[1]) | celloutsig_0_20z[4]);
  always_latch
    if (!clkin_data[0]) celloutsig_0_5z = 4'h0;
    else if (!clkin_data[96]) celloutsig_0_5z = in_data[33:30];
  always_latch
    if (clkin_data[64]) celloutsig_1_5z = 4'h0;
    else if (clkin_data[128]) celloutsig_1_5z = { celloutsig_1_4z[10:8], celloutsig_1_0z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_9z = 3'h0;
    else if (!clkin_data[96]) celloutsig_0_9z = _01_;
  assign celloutsig_0_55z = ~((celloutsig_0_30z & celloutsig_0_30z) | (celloutsig_0_26z & celloutsig_0_32z));
  assign celloutsig_1_0z = ~((in_data[106] & in_data[127]) | (in_data[116] & in_data[108]));
  assign celloutsig_1_8z = ~((celloutsig_1_1z & celloutsig_1_7z[0]) | (celloutsig_1_0z & celloutsig_1_5z[2]));
  assign celloutsig_1_9z = ~((celloutsig_1_7z[2] & celloutsig_1_6z) | (celloutsig_1_6z & celloutsig_1_0z));
  assign celloutsig_1_17z = ~((celloutsig_1_7z[0] & celloutsig_1_15z) | (celloutsig_1_16z[2] & celloutsig_1_6z));
  assign celloutsig_1_18z = ~((celloutsig_1_3z & celloutsig_1_17z) | (celloutsig_1_10z & celloutsig_1_9z));
  assign celloutsig_0_25z = ~((celloutsig_0_23z & celloutsig_0_21z) | (celloutsig_0_8z & celloutsig_0_16z));
  assign celloutsig_0_26z = ~((celloutsig_0_13z[3] & celloutsig_0_14z[10]) | (celloutsig_0_12z & celloutsig_0_8z));
  assign _00_[5] = celloutsig_0_5z[3];
  assign { out_data[128], out_data[96], out_data[32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_55z, celloutsig_0_56z };
endmodule
