/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [16:0] _00_;
  wire [16:0] _01_;
  wire [5:0] _02_;
  reg [5:0] _03_;
  reg [2:0] _04_;
  wire [6:0] _05_;
  reg [9:0] _06_;
  wire [2:0] celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire [3:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [4:0] celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire celloutsig_0_20z;
  wire [6:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire [5:0] celloutsig_0_28z;
  wire [25:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [13:0] celloutsig_0_30z;
  wire celloutsig_0_36z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [11:0] celloutsig_0_42z;
  wire celloutsig_0_4z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [5:0] celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [16:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
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
  assign celloutsig_1_5z = ~(celloutsig_1_1z | celloutsig_1_2z);
  assign celloutsig_0_54z = celloutsig_0_42z[0] ^ celloutsig_0_19z;
  assign celloutsig_1_2z = in_data[103] ^ celloutsig_1_0z[3];
  assign celloutsig_0_8z = celloutsig_0_3z ^ in_data[2];
  assign celloutsig_0_19z = celloutsig_0_7z ^ celloutsig_0_0z[2];
  assign celloutsig_1_1z = ~(celloutsig_1_0z[3] ^ celloutsig_1_0z[4]);
  assign celloutsig_0_5z = ~(celloutsig_0_4z ^ celloutsig_0_0z[1]);
  assign celloutsig_1_19z = ~(celloutsig_1_15z ^ celloutsig_1_14z);
  assign celloutsig_0_23z = ~(celloutsig_0_5z ^ celloutsig_0_6z);
  assign celloutsig_0_24z = ~(celloutsig_0_13z ^ celloutsig_0_17z[2]);
  assign celloutsig_1_12z = { _00_[16], celloutsig_1_6z, celloutsig_1_10z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_7z } + { _00_[16], _01_[15:14], celloutsig_1_0z, _00_[16], _01_[15:14], _01_[5:2], celloutsig_1_10z, celloutsig_1_1z };
  always_ff @(posedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _03_ <= 6'h00;
    else _03_ <= _02_;
  always_ff @(negedge clkin_data[64], posedge clkin_data[128])
    if (clkin_data[128]) _04_ <= 3'h0;
    else _04_ <= { celloutsig_1_0z[2:1], celloutsig_1_2z };
  reg [6:0] _20_;
  always_ff @(posedge clkin_data[64], negedge clkin_data[128])
    if (!clkin_data[128]) _20_ <= 7'h00;
    else _20_ <= { in_data[101], celloutsig_1_2z, celloutsig_1_7z, _04_, celloutsig_1_1z };
  assign { _00_[16], _01_[15:14], _01_[5:2] } = _20_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _06_ <= 10'h000;
    else _06_ <= { in_data[13:7], celloutsig_0_0z };
  reg [6:0] _22_;
  always_ff @(negedge clkin_data[32], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _22_ <= 7'h00;
    else _22_ <= { in_data[8:5], celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_3z };
  assign { _05_[6], _02_ } = _22_;
  assign celloutsig_0_17z = { 1'h0, celloutsig_0_8z, celloutsig_0_0z } / { 1'h1, celloutsig_0_10z[1:0], 1'h0, celloutsig_0_15z };
  assign celloutsig_0_28z = { celloutsig_0_25z, celloutsig_0_27z, celloutsig_0_24z, celloutsig_0_22z, celloutsig_0_4z, celloutsig_0_24z } / { 1'h1, celloutsig_0_24z, celloutsig_0_24z, celloutsig_0_24z, celloutsig_0_13z, celloutsig_0_2z };
  assign celloutsig_0_3z = _06_[7:1] == { in_data[33:30], celloutsig_0_0z };
  assign celloutsig_1_18z = { celloutsig_1_5z, _04_, celloutsig_1_2z, celloutsig_1_3z } == { _04_[2:1], celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_14z, celloutsig_1_13z };
  assign celloutsig_1_3z = { in_data[135:120], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z } <= { in_data[138:129], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_7z = { in_data[122:120], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_5z, _04_ } && in_data[181:170];
  assign celloutsig_0_12z = ! { _06_[9:3], celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_11z };
  assign celloutsig_0_22z = ! { celloutsig_0_13z, celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_11z };
  assign celloutsig_0_7z = { celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_4z } || { celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_5z };
  assign celloutsig_0_13z = { _06_[8:1], celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_6z } || { _06_[7:4], celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_40z = { celloutsig_0_38z, celloutsig_0_11z } < _03_[4:0];
  assign celloutsig_0_41z = _06_[7:0] < { celloutsig_0_40z, celloutsig_0_38z, _03_ };
  assign celloutsig_1_14z = celloutsig_1_12z[16:8] < in_data[113:105];
  assign celloutsig_0_4z = _06_[9:7] != { _06_[3:2], celloutsig_0_2z };
  assign celloutsig_1_13z = { celloutsig_1_0z[4:1], celloutsig_1_5z, celloutsig_1_10z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_7z } != celloutsig_1_12z[15:7];
  assign celloutsig_0_36z = { _02_, celloutsig_0_20z } !== { celloutsig_0_21z[6:1], celloutsig_0_3z };
  assign celloutsig_1_10z = { in_data[184:183], celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_2z } !== { _04_[0], celloutsig_1_3z, celloutsig_1_8z, _00_[16], _01_[15:14], _01_[5:2], celloutsig_1_1z };
  assign celloutsig_0_14z = { _06_[8:3], celloutsig_0_13z } !== { celloutsig_0_9z[1], celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_12z };
  assign celloutsig_0_25z = celloutsig_0_0z !== { celloutsig_0_19z, celloutsig_0_24z, celloutsig_0_20z };
  assign celloutsig_0_30z = celloutsig_0_29z[22:9] | { _06_[5], celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_23z, celloutsig_0_2z, celloutsig_0_13z };
  assign celloutsig_0_9z = { celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_8z } | { _06_[5:4], celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_10z = { celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_4z } | { celloutsig_0_0z[0], celloutsig_0_8z, celloutsig_0_6z };
  assign celloutsig_0_11z = { celloutsig_0_10z[2], celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_3z } | { celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_0_21z = { celloutsig_0_9z[4:2], celloutsig_0_11z } | { in_data[41:36], celloutsig_0_14z };
  assign celloutsig_1_6z = | { in_data[187:179], _04_ };
  assign celloutsig_0_38z = ^ { celloutsig_0_30z[7:4], celloutsig_0_3z };
  assign celloutsig_1_8z = ^ { in_data[178:157], celloutsig_1_2z };
  assign celloutsig_1_15z = ^ { in_data[147:145], celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_42z = { celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_22z, celloutsig_0_23z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_20z, celloutsig_0_41z, celloutsig_0_36z } >> { celloutsig_0_28z, celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_23z, celloutsig_0_2z };
  assign celloutsig_1_0z = in_data[128:124] >> in_data[157:153];
  assign celloutsig_0_0z = in_data[53:51] ^ in_data[29:27];
  assign celloutsig_0_53z = ~((celloutsig_0_21z[2] & celloutsig_0_21z[5]) | celloutsig_0_27z);
  assign celloutsig_0_2z = ~((_06_[9] & celloutsig_0_0z[2]) | in_data[22]);
  assign celloutsig_0_6z = ~((celloutsig_0_2z & celloutsig_0_2z) | (celloutsig_0_0z[2] & celloutsig_0_4z));
  assign celloutsig_0_15z = ~((celloutsig_0_7z & celloutsig_0_11z[3]) | (celloutsig_0_10z[1] & celloutsig_0_10z[2]));
  assign celloutsig_0_20z = ~((celloutsig_0_4z & celloutsig_0_3z) | (celloutsig_0_17z[3] & celloutsig_0_7z));
  assign celloutsig_0_27z = ~((in_data[72] & celloutsig_0_22z) | (celloutsig_0_12z & celloutsig_0_20z));
  assign { celloutsig_0_29z[14:6], celloutsig_0_29z[4:2], celloutsig_0_29z[25:15] } = { celloutsig_0_25z, celloutsig_0_21z, celloutsig_0_13z, celloutsig_0_11z[3:1], in_data[35:25] } | { celloutsig_0_9z[4:0], celloutsig_0_6z, celloutsig_0_23z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_20z, celloutsig_0_19z, _06_[7:5], _05_[6], _02_, celloutsig_0_9z[5] };
  assign _00_[15:0] = { celloutsig_1_6z, celloutsig_1_10z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_7z };
  assign { _01_[16], _01_[13:6], _01_[1:0] } = { _00_[16], celloutsig_1_0z, _00_[16], _01_[15:14], celloutsig_1_10z, celloutsig_1_1z };
  assign _05_[5:0] = _02_;
  assign { celloutsig_0_29z[5], celloutsig_0_29z[1:0] } = { celloutsig_0_22z, celloutsig_0_11z[0], celloutsig_0_23z };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_53z, celloutsig_0_54z };
endmodule
