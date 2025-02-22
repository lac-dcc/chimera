/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire [16:0] _05_;
  wire [9:0] _06_;
  wire [15:0] _07_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [10:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire [14:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [6:0] celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [13:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [6:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_35z = celloutsig_0_14z ? celloutsig_0_18z : _00_;
  assign celloutsig_1_6z = celloutsig_1_4z ? celloutsig_1_4z : celloutsig_1_2z;
  assign celloutsig_1_10z = celloutsig_1_0z[1] ? celloutsig_1_0z[2] : celloutsig_1_9z;
  assign celloutsig_1_16z = celloutsig_1_12z ? _01_ : celloutsig_1_4z;
  assign celloutsig_0_9z = celloutsig_0_4z ? celloutsig_0_7z : celloutsig_0_3z;
  assign celloutsig_0_15z = celloutsig_0_2z[7] ? _02_ : celloutsig_0_9z;
  assign celloutsig_0_17z = celloutsig_0_2z[4] ? celloutsig_0_15z : celloutsig_0_10z;
  assign celloutsig_0_19z = celloutsig_0_16z ? celloutsig_0_7z : celloutsig_0_18z;
  assign celloutsig_0_26z = celloutsig_0_0z ? celloutsig_0_9z : celloutsig_0_13z;
  assign celloutsig_0_30z = celloutsig_0_26z ? celloutsig_0_5z : celloutsig_0_21z;
  assign celloutsig_0_33z = ~(celloutsig_0_9z ^ celloutsig_0_26z);
  assign celloutsig_0_3z = ~(in_data[51] ^ celloutsig_0_2z[3]);
  assign celloutsig_0_40z = ~(celloutsig_0_10z ^ celloutsig_0_5z);
  assign celloutsig_0_43z = ~(celloutsig_0_40z ^ celloutsig_0_38z);
  assign celloutsig_0_4z = ~(_03_ ^ celloutsig_0_3z);
  assign celloutsig_0_50z = ~(celloutsig_0_6z ^ celloutsig_0_44z);
  assign celloutsig_0_53z = ~(celloutsig_0_18z ^ celloutsig_0_9z);
  assign celloutsig_0_11z = ~(celloutsig_0_2z[5] ^ celloutsig_0_8z);
  assign celloutsig_0_16z = ~(celloutsig_0_15z ^ celloutsig_0_7z);
  assign celloutsig_0_22z = ~(celloutsig_0_0z ^ celloutsig_0_4z);
  assign celloutsig_0_25z = ~(_04_ ^ celloutsig_0_22z);
  reg [16:0] _29_;
  always_ff @(posedge clkin_data[32], negedge clkin_data[64])
    if (!clkin_data[64]) _29_ <= 17'h00000;
    else _29_ <= in_data[134:118];
  assign { _05_[16:7], _01_, _05_[5:0] } = _29_;
  reg [9:0] _30_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _30_ <= 10'h000;
    else _30_ <= { in_data[47:39], celloutsig_0_0z };
  assign { _02_, _06_[8], _03_, _06_[6], _04_, _06_[4:0] } = _30_;
  reg [15:0] _31_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _31_ <= 16'h0000;
    else _31_ <= { in_data[42], celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_24z, celloutsig_0_10z, celloutsig_0_5z };
  assign { _07_[15:4], _00_, _07_[2:0] } = _31_;
  assign celloutsig_1_4z = { _05_[16:10], celloutsig_1_3z } == in_data[153:146];
  assign celloutsig_1_7z = in_data[186:181] == { in_data[102:100], celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_3z };
  assign celloutsig_1_18z = { _05_[9], celloutsig_1_16z, celloutsig_1_7z } == in_data[132:130];
  assign celloutsig_0_13z = { _03_, _06_[6], _04_, _06_[4:2], celloutsig_0_0z, celloutsig_0_9z } == { celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_11z };
  assign celloutsig_0_14z = { celloutsig_0_2z[14:3], celloutsig_0_10z } == { celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_11z };
  assign celloutsig_0_18z = { _06_[3:1], celloutsig_0_15z, celloutsig_0_14z } == { _06_[8], _03_, _06_[6], celloutsig_0_17z, celloutsig_0_4z };
  assign celloutsig_0_21z = { celloutsig_0_2z[14:8], celloutsig_0_18z, _02_, _06_[8], _03_, _06_[6], _04_, _06_[4:0], celloutsig_0_18z, celloutsig_0_8z, celloutsig_0_3z } == { celloutsig_0_17z, celloutsig_0_18z, celloutsig_0_19z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_19z };
  assign celloutsig_0_27z = { celloutsig_0_2z[13:2], celloutsig_0_8z, celloutsig_0_19z, celloutsig_0_25z, celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_18z } == { in_data[67:56], celloutsig_0_13z, celloutsig_0_20z, celloutsig_0_8z, celloutsig_0_20z, celloutsig_0_10z, celloutsig_0_18z, celloutsig_0_17z, celloutsig_0_3z };
  assign celloutsig_1_9z = { celloutsig_1_0z[12:6], celloutsig_1_5z, celloutsig_1_2z } <= { celloutsig_1_0z[2:0], celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_2z };
  assign celloutsig_0_10z = { celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_8z } <= { celloutsig_0_2z[14:13], celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_20z = { celloutsig_0_2z[12], celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_18z, celloutsig_0_10z } <= { celloutsig_0_2z[0], celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_12z };
  assign celloutsig_0_29z = { celloutsig_0_10z, celloutsig_0_20z, celloutsig_0_27z, celloutsig_0_18z, _02_, _06_[8], _03_, _06_[6], _04_, _06_[4:0] } <= { celloutsig_0_15z, celloutsig_0_15z, _02_, _06_[8], _03_, _06_[6], _04_, _06_[4:0], celloutsig_0_15z, celloutsig_0_8z };
  assign celloutsig_0_44z = { celloutsig_0_3z, celloutsig_0_27z, celloutsig_0_39z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_19z, celloutsig_0_43z, celloutsig_0_23z, celloutsig_0_30z } != { celloutsig_0_24z[8:0], celloutsig_0_37z };
  assign celloutsig_0_52z = { in_data[53], celloutsig_0_31z } != { celloutsig_0_9z, celloutsig_0_35z, celloutsig_0_17z, celloutsig_0_50z, celloutsig_0_40z, celloutsig_0_41z, celloutsig_0_42z, celloutsig_0_21z };
  assign celloutsig_1_3z = _05_[14:12] != _05_[16:14];
  assign celloutsig_0_6z = celloutsig_0_2z[7:4] != in_data[87:84];
  assign celloutsig_0_7z = { in_data[28:24], celloutsig_0_0z } != { celloutsig_0_2z[13:9], celloutsig_0_4z };
  assign celloutsig_0_8z = { celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_7z, _02_, _06_[8], _03_, _06_[6], _04_, _06_[4:0] } != { celloutsig_0_0z, _02_, _06_[8], _03_, _06_[6], _04_, _06_[4:0], celloutsig_0_7z, celloutsig_0_0z };
  assign celloutsig_0_0z = ~^ in_data[84:74];
  assign celloutsig_0_37z = ~^ { celloutsig_0_24z[3:2], celloutsig_0_35z, celloutsig_0_21z, celloutsig_0_18z, celloutsig_0_29z, celloutsig_0_20z };
  assign celloutsig_0_38z = ~^ { celloutsig_0_2z[14:2], celloutsig_0_4z };
  assign celloutsig_0_41z = ~^ { celloutsig_0_21z, celloutsig_0_30z, celloutsig_0_38z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_22z, celloutsig_0_14z, celloutsig_0_27z };
  assign celloutsig_1_2z = ~^ { _01_, _05_[5:1] };
  assign celloutsig_1_5z = ~^ _05_[9:7];
  assign celloutsig_1_19z = ~^ { celloutsig_1_0z[3:1], celloutsig_1_11z };
  assign celloutsig_0_39z = ^ { _07_[8:4], _00_, _07_[2:0], celloutsig_0_17z, celloutsig_0_22z, celloutsig_0_17z };
  assign celloutsig_0_42z = ^ { celloutsig_0_35z, celloutsig_0_17z, celloutsig_0_19z, celloutsig_0_9z, celloutsig_0_26z, celloutsig_0_33z, celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_30z, celloutsig_0_4z, celloutsig_0_22z, celloutsig_0_23z, celloutsig_0_30z, celloutsig_0_35z, celloutsig_0_21z, celloutsig_0_39z };
  assign celloutsig_0_5z = ^ { in_data[8:0], celloutsig_0_3z, _02_, _06_[8], _03_, _06_[6], _04_, _06_[4:0], _02_, _06_[8], _03_, _06_[6], _04_, _06_[4:0] };
  assign celloutsig_1_8z = ^ { in_data[102:100], celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_1_12z = ^ { celloutsig_1_11z[3:0], celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_0_12z = ^ celloutsig_0_2z[13:7];
  assign celloutsig_0_23z = ^ { celloutsig_0_5z, celloutsig_0_22z, celloutsig_0_15z, celloutsig_0_22z };
  assign celloutsig_0_31z = { in_data[81:76], celloutsig_0_4z } >>> { celloutsig_0_12z, celloutsig_0_18z, celloutsig_0_17z, celloutsig_0_4z, celloutsig_0_19z, celloutsig_0_17z, celloutsig_0_18z };
  assign celloutsig_1_0z = in_data[168:155] >>> in_data[191:178];
  assign celloutsig_1_11z = { celloutsig_1_5z, celloutsig_1_10z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_9z } >>> in_data[177:171];
  assign celloutsig_0_24z = in_data[90:80] >>> { in_data[61:55], celloutsig_0_5z, celloutsig_0_18z, celloutsig_0_9z, celloutsig_0_3z };
  assign celloutsig_0_2z = { in_data[46:33], celloutsig_0_0z } >>> in_data[85:71];
  assign _05_[6] = _01_;
  assign { _06_[9], _06_[7], _06_[5] } = { _02_, _03_, _04_ };
  assign _07_[3] = _00_;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_52z, celloutsig_0_53z };
endmodule
