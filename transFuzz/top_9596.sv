/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [7:0] _01_;
  wire [5:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [7:0] celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire [3:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire [5:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [14:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire [4:0] celloutsig_0_37z;
  wire [9:0] celloutsig_0_3z;
  wire celloutsig_0_45z;
  wire [5:0] celloutsig_0_48z;
  wire [15:0] celloutsig_0_4z;
  wire [6:0] celloutsig_0_53z;
  wire celloutsig_0_5z;
  wire [7:0] celloutsig_0_63z;
  wire celloutsig_0_6z;
  wire celloutsig_0_74z;
  wire [6:0] celloutsig_0_75z;
  wire [13:0] celloutsig_0_7z;
  wire [16:0] celloutsig_0_8z;
  wire [5:0] celloutsig_0_9z;
  wire [12:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [5:0] celloutsig_1_11z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire [11:0] celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [14:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [26:0] celloutsig_1_6z;
  wire [16:0] celloutsig_1_7z;
  wire [18:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_5z = celloutsig_1_0z[3] ? celloutsig_1_2z : celloutsig_1_3z;
  assign celloutsig_0_45z = ~(celloutsig_0_33z & celloutsig_0_9z[4]);
  assign celloutsig_1_2z = ~(celloutsig_1_0z[5] & in_data[191]);
  assign celloutsig_0_30z = ~(celloutsig_0_20z & celloutsig_0_20z);
  assign celloutsig_1_1z = ~(celloutsig_1_0z[1] | celloutsig_1_0z[12]);
  assign celloutsig_1_15z = ~(celloutsig_1_1z | in_data[120]);
  assign celloutsig_1_17z = ~(celloutsig_1_3z | celloutsig_1_15z);
  assign celloutsig_0_1z = ~((in_data[66] | celloutsig_0_0z[3]) & (celloutsig_0_0z[2] | celloutsig_0_0z[5]));
  assign celloutsig_0_17z = ~((celloutsig_0_7z[4] | _00_) & (celloutsig_0_4z[8] | celloutsig_0_5z));
  assign celloutsig_0_28z = ~((celloutsig_0_7z[2] | celloutsig_0_13z[1]) & (celloutsig_0_1z | celloutsig_0_11z[3]));
  assign celloutsig_1_3z = celloutsig_1_2z ^ in_data[182];
  assign celloutsig_1_11z = { in_data[105:101], celloutsig_1_2z } + celloutsig_1_4z[14:9];
  reg [7:0] _14_;
  always_ff @(posedge celloutsig_1_18z[0], posedge clkin_data[32])
    if (clkin_data[32]) _14_ <= 8'h00;
    else _14_ <= { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z };
  assign { _01_[7], _00_, _01_[5:0] } = _14_;
  assign celloutsig_0_3z = { _01_[5:4], _01_[7], _00_, _01_[5:0] } / { 1'h1, in_data[53], _01_[7], _00_, _01_[5:1], in_data[0] };
  assign celloutsig_0_53z = { celloutsig_0_0z[5:1], celloutsig_0_21z, celloutsig_0_28z } / { 1'h1, celloutsig_0_37z, celloutsig_0_30z };
  assign celloutsig_0_23z = celloutsig_0_4z[15:1] / { 1'h1, _01_[7], _00_, _01_[5:0], celloutsig_0_18z };
  assign celloutsig_0_0z = in_data[9:4] / { 1'h1, in_data[80:76] };
  assign celloutsig_0_48z = celloutsig_0_12z / { 1'h1, celloutsig_0_9z[4:0] };
  assign celloutsig_0_75z = celloutsig_0_63z[6:0] / { 1'h1, celloutsig_0_53z[5:0] };
  assign celloutsig_1_0z = in_data[117:105] / { 1'h1, in_data[158:147] };
  assign celloutsig_1_9z = { in_data[176], celloutsig_1_7z, celloutsig_1_1z } / { 1'h1, in_data[147:131], celloutsig_1_2z };
  assign celloutsig_0_12z = celloutsig_0_4z[6:1] / { 1'h1, celloutsig_0_8z[13:9] };
  assign celloutsig_0_10z = celloutsig_0_3z[7:1] == { celloutsig_0_8z[15:10], celloutsig_0_1z };
  assign celloutsig_0_15z = { celloutsig_0_7z[6], celloutsig_0_1z, celloutsig_0_6z } == in_data[76:74];
  assign celloutsig_0_24z = { celloutsig_0_3z[5:1], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_12z } >= { celloutsig_0_4z, celloutsig_0_18z };
  assign celloutsig_0_33z = { celloutsig_0_11z, celloutsig_0_17z, celloutsig_0_6z, celloutsig_0_27z, celloutsig_0_10z, celloutsig_0_24z, celloutsig_0_5z, celloutsig_0_31z } && { celloutsig_0_23z[14:1], celloutsig_0_15z };
  assign celloutsig_0_5z = { celloutsig_0_4z[13], celloutsig_0_0z } && { celloutsig_0_0z[0], celloutsig_0_0z };
  assign celloutsig_0_6z = celloutsig_0_4z[10:6] && { celloutsig_0_3z[6:3], celloutsig_0_5z };
  assign celloutsig_1_10z = { celloutsig_1_9z[16:14], celloutsig_1_2z, celloutsig_1_3z } && celloutsig_1_6z[12:8];
  assign celloutsig_0_20z = { _00_, _01_[5:1], celloutsig_0_7z } && { celloutsig_0_11z[6:4], celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_3z };
  assign celloutsig_0_27z = { celloutsig_0_0z[5:1], celloutsig_0_18z, celloutsig_0_11z, celloutsig_0_21z } && { _01_[7], _00_, _01_[5:3], celloutsig_0_14z, celloutsig_0_7z };
  assign celloutsig_0_31z = celloutsig_0_23z[13:1] && { celloutsig_0_8z[16:5], celloutsig_0_1z };
  assign celloutsig_0_21z = { celloutsig_0_18z[2:1], celloutsig_0_17z } || { celloutsig_0_8z[13], celloutsig_0_10z, celloutsig_0_10z };
  assign celloutsig_0_4z = - { celloutsig_0_3z[7], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_63z = - { celloutsig_0_21z, celloutsig_0_45z, celloutsig_0_48z };
  assign celloutsig_0_8z = - in_data[47:31];
  assign celloutsig_1_4z = { in_data[108:98], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z } | { celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_7z = { celloutsig_0_3z[8:6], celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_1z, _01_[7], _00_, _01_[5:0] } | { celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_74z = ~^ celloutsig_0_9z[5:2];
  assign celloutsig_0_14z = ~^ { celloutsig_0_3z[9:3], celloutsig_0_6z, celloutsig_0_10z, _01_[7], _00_, _01_[5:0] };
  assign celloutsig_0_18z = celloutsig_0_9z >> { _01_[4:0], celloutsig_0_10z };
  assign celloutsig_1_19z = { celloutsig_1_18z[10:1], celloutsig_1_5z } >> { celloutsig_1_9z[15:7], celloutsig_1_17z, celloutsig_1_10z };
  assign celloutsig_0_9z = celloutsig_0_7z[6:1] >> celloutsig_0_0z;
  assign celloutsig_0_11z = in_data[33:26] >> { celloutsig_0_0z[5:1], celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_10z };
  assign celloutsig_0_13z = celloutsig_0_8z[15:12] >> { celloutsig_0_8z[4:3], celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_0_37z = celloutsig_0_0z[5:1] ~^ { celloutsig_0_13z, celloutsig_0_30z };
  assign celloutsig_1_6z = { in_data[146:135], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_1z } ~^ { celloutsig_1_0z[12:1], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_7z = { celloutsig_1_6z[12], celloutsig_1_4z, celloutsig_1_1z } ~^ { celloutsig_1_6z[21], celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_1_18z = celloutsig_1_4z[14:3] ~^ { celloutsig_1_9z[7:2], celloutsig_1_11z };
  assign _01_[6] = _00_;
  assign { out_data[139:128], out_data[106:96], out_data[32], out_data[6:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_74z, celloutsig_0_75z };
endmodule
