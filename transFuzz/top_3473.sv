/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [15:0] _02_;
  wire [5:0] _03_;
  wire [21:0] _04_;
  wire [7:0] _05_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [2:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [9:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_20z;
  wire [5:0] celloutsig_0_22z;
  wire [2:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [17:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [15:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [4:0] celloutsig_0_37z;
  wire [4:0] celloutsig_0_38z;
  wire [15:0] celloutsig_0_3z;
  wire [7:0] celloutsig_0_42z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_56z;
  wire celloutsig_0_57z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [3:0] celloutsig_0_7z;
  wire [5:0] celloutsig_0_8z;
  wire [6:0] celloutsig_0_9z;
  wire [13:0] celloutsig_1_10z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [4:0] celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_20z = celloutsig_0_6z ? celloutsig_0_14z : celloutsig_0_16z;
  assign celloutsig_0_0z = ~(in_data[50] & in_data[62]);
  assign celloutsig_0_46z = ~(celloutsig_0_20z & celloutsig_0_38z[0]);
  assign celloutsig_1_3z = !(celloutsig_1_1z ? in_data[178] : _01_);
  assign celloutsig_1_6z = !(celloutsig_1_1z ? celloutsig_1_4z : celloutsig_1_5z);
  assign celloutsig_0_15z = ~in_data[71];
  assign celloutsig_0_14z = ~celloutsig_0_0z;
  assign celloutsig_0_56z = celloutsig_0_31z | ~(celloutsig_0_16z);
  assign celloutsig_1_7z = celloutsig_1_4z | ~(celloutsig_1_5z);
  assign celloutsig_0_48z = celloutsig_0_42z[1] ^ celloutsig_0_24z;
  assign celloutsig_1_1z = ~(in_data[124] ^ in_data[138]);
  assign celloutsig_0_16z = ~(celloutsig_0_14z ^ celloutsig_0_10z);
  assign celloutsig_0_3z = _02_ + in_data[89:74];
  assign celloutsig_1_10z = { celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_8z } + { celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_0_25z = { celloutsig_0_8z[0], celloutsig_0_16z, celloutsig_0_23z[2], celloutsig_0_23z[2], celloutsig_0_23z[0], celloutsig_0_11z, celloutsig_0_22z, celloutsig_0_8z } + { _02_[8:1], celloutsig_0_9z, celloutsig_0_23z[2], celloutsig_0_23z[2], celloutsig_0_23z[0] };
  reg [5:0] _21_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _21_ <= 6'h00;
    else _21_ <= in_data[172:167];
  assign { _01_, _03_[4:0] } = _21_;
  reg [21:0] _22_;
  always_ff @(negedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _22_ <= 22'h000000;
    else _22_ <= { in_data[60:40], celloutsig_0_0z };
  assign { _04_[21:19], _02_, _04_[2:0] } = _22_;
  reg [7:0] _23_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _23_ <= 8'h00;
    else _23_ <= { celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_23z[2], celloutsig_0_23z[2], celloutsig_0_23z[0], celloutsig_0_20z, celloutsig_0_10z };
  assign { _05_[7:4], _00_, _05_[2:0] } = _23_;
  assign celloutsig_0_38z = { celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_35z } / { 1'h1, celloutsig_0_25z[3:0] };
  assign celloutsig_1_8z = { celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z } / { 1'h1, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_2z };
  assign celloutsig_0_22z = { celloutsig_0_8z[2:1], celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_20z, celloutsig_0_10z } / { 1'h1, celloutsig_0_7z[2:1], celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_16z };
  assign celloutsig_0_33z = { celloutsig_0_3z[15:3], celloutsig_0_28z, celloutsig_0_23z[2], celloutsig_0_23z[2], celloutsig_0_23z[0] } == { celloutsig_0_3z[9:0], celloutsig_0_5z, celloutsig_0_24z, celloutsig_0_29z, celloutsig_0_14z, celloutsig_0_12z };
  assign celloutsig_0_10z = { celloutsig_0_3z[5], celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_5z } > { celloutsig_0_8z, celloutsig_0_0z };
  assign celloutsig_0_57z = ! { celloutsig_0_35z, celloutsig_0_48z, celloutsig_0_18z, celloutsig_0_49z, celloutsig_0_15z, celloutsig_0_29z };
  assign celloutsig_0_6z = ! _02_[7:1];
  assign celloutsig_1_18z = ! celloutsig_1_10z[7:5];
  assign celloutsig_0_11z = ! celloutsig_0_8z[3:1];
  assign celloutsig_0_24z = ! { celloutsig_0_7z[0], celloutsig_0_11z, celloutsig_0_22z };
  assign celloutsig_0_31z = ! celloutsig_0_3z[9:4];
  assign celloutsig_0_49z = { celloutsig_0_38z, celloutsig_0_37z, celloutsig_0_30z } || { celloutsig_0_45z, celloutsig_0_37z, celloutsig_0_28z, celloutsig_0_46z, celloutsig_0_26z, celloutsig_0_31z, celloutsig_0_29z };
  assign celloutsig_0_29z = celloutsig_0_9z[5:1] || { celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_14z };
  assign celloutsig_0_45z = celloutsig_0_17z[9:1] < { in_data[15:12], celloutsig_0_38z };
  assign celloutsig_1_2z = { in_data[117:116], _01_, _03_[4:0] } < { _01_, _03_[4:0], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_5z = in_data[70:61] < { _04_[19], _02_[15:7] };
  assign celloutsig_1_4z = { _03_[3:2], celloutsig_1_1z, celloutsig_1_3z } < { in_data[148:146], celloutsig_1_3z };
  assign celloutsig_1_19z = { celloutsig_1_10z[12:10], celloutsig_1_4z } < celloutsig_1_10z[6:3];
  assign celloutsig_0_18z = { celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_0z } < { _02_[6:3], celloutsig_0_8z };
  assign celloutsig_0_12z = { celloutsig_0_9z[6:5], celloutsig_0_10z } % { 1'h1, celloutsig_0_3z[11], celloutsig_0_5z };
  assign celloutsig_0_9z = celloutsig_0_3z[9:3] % { 1'h1, in_data[84:79] };
  assign celloutsig_0_32z = { celloutsig_0_17z[5:4], celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_17z, celloutsig_0_28z } % { 1'h1, _05_[7:4], _00_, _05_[2:0], celloutsig_0_28z, celloutsig_0_8z };
  assign celloutsig_0_30z = { celloutsig_0_9z[3], _05_[7:4], _00_, _05_[2:0], _04_[21:19], _02_, _04_[2:0] } != { celloutsig_0_25z[9:5], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_23z[2], celloutsig_0_23z[2], celloutsig_0_23z[0], celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_29z };
  assign celloutsig_0_36z = celloutsig_0_3z[11] & celloutsig_0_15z;
  assign celloutsig_0_4z = celloutsig_0_0z & celloutsig_0_3z[11];
  assign celloutsig_1_5z = | { celloutsig_1_3z, celloutsig_1_1z, in_data[167:152] };
  assign celloutsig_0_13z = | { celloutsig_0_8z[5], celloutsig_0_0z };
  assign celloutsig_0_42z = { celloutsig_0_3z[15], celloutsig_0_0z, celloutsig_0_38z, celloutsig_0_16z } << celloutsig_0_32z[14:7];
  assign celloutsig_0_7z = in_data[21:18] << { _02_[0], _04_[2:1], celloutsig_0_5z };
  assign celloutsig_0_37z = { celloutsig_0_33z, celloutsig_0_35z, celloutsig_0_15z, celloutsig_0_0z, celloutsig_0_29z } - { celloutsig_0_36z, celloutsig_0_0z, celloutsig_0_20z, celloutsig_0_0z, celloutsig_0_35z };
  assign celloutsig_0_8z = { in_data[74:70], celloutsig_0_4z } - { _02_[15:11], celloutsig_0_4z };
  assign celloutsig_0_17z = { in_data[38:31], celloutsig_0_0z, celloutsig_0_0z } ~^ { celloutsig_0_9z[5:3], celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_15z, celloutsig_0_0z, celloutsig_0_12z };
  assign celloutsig_0_35z = ~((celloutsig_0_32z[12] & celloutsig_0_22z[4]) | (celloutsig_0_11z & celloutsig_0_30z));
  assign celloutsig_0_26z = ~((in_data[1] & _02_[1]) | (celloutsig_0_13z & celloutsig_0_0z));
  assign celloutsig_0_28z = ~((celloutsig_0_8z[0] & celloutsig_0_13z) | (celloutsig_0_14z & celloutsig_0_7z[1]));
  assign { celloutsig_0_23z[2], celloutsig_0_23z[0] } = ~ { celloutsig_0_16z, celloutsig_0_11z };
  assign _03_[5] = _01_;
  assign _04_[18:3] = _02_;
  assign _05_[3] = _00_;
  assign celloutsig_0_23z[1] = celloutsig_0_23z[2];
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_56z, celloutsig_0_57z };
endmodule
