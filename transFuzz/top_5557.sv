/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [9:0] _03_;
  wire [24:0] _04_;
  wire [24:0] _05_;
  reg [3:0] _06_;
  wire [3:0] _07_;
  wire celloutsig_0_0z;
  wire [7:0] celloutsig_0_10z;
  wire [4:0] celloutsig_0_12z;
  wire [13:0] celloutsig_0_13z;
  wire [3:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire [9:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [3:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [24:0] celloutsig_0_21z;
  wire celloutsig_0_24z;
  wire [10:0] celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire [4:0] celloutsig_0_28z;
  wire celloutsig_0_30z;
  wire celloutsig_0_33z;
  wire celloutsig_0_39z;
  wire [5:0] celloutsig_0_3z;
  wire [3:0] celloutsig_0_41z;
  wire celloutsig_0_4z;
  wire [2:0] celloutsig_0_5z;
  wire celloutsig_0_62z;
  wire celloutsig_0_63z;
  wire celloutsig_0_6z;
  wire [6:0] celloutsig_0_7z;
  wire [8:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [18:0] celloutsig_1_18z;
  wire [7:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [11:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [23:0] celloutsig_1_4z;
  wire [21:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [3:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_62z = ~(_00_ & celloutsig_0_30z);
  assign celloutsig_1_17z = ~(in_data[188] & celloutsig_1_3z);
  assign celloutsig_0_20z = ~(celloutsig_0_3z[4] | celloutsig_0_3z[4]);
  assign celloutsig_1_12z = ~((celloutsig_1_6z | in_data[119]) & (celloutsig_1_5z[16] | celloutsig_1_4z[15]));
  assign celloutsig_0_0z = in_data[29] | ~(in_data[1]);
  assign celloutsig_0_30z = celloutsig_0_10z[4] | ~(celloutsig_0_12z[2]);
  assign celloutsig_1_6z = ~(celloutsig_1_2z[2] ^ celloutsig_1_3z);
  assign celloutsig_0_17z = ~(celloutsig_0_6z ^ _02_);
  assign celloutsig_0_24z = ~(celloutsig_0_6z ^ celloutsig_0_20z);
  assign celloutsig_0_21z = { _04_[24:23], _03_[9:6], _00_, _04_[17:15], _04_[24:23], _03_[9:5], _04_[7:6], celloutsig_0_12z, celloutsig_0_20z } + { celloutsig_0_9z[6:0], celloutsig_0_17z, _05_[16:11], celloutsig_0_18z, celloutsig_0_15z };
  reg [12:0] _18_;
  always_ff @(posedge celloutsig_1_18z[0], negedge clkin_data[0])
    if (!clkin_data[0]) _18_ <= 13'h0000;
    else _18_ <= { celloutsig_0_1z[1:0], celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_4z };
  assign { _00_, _04_[17:15], _04_[24:23], _03_[9:5], _04_[7:6] } = _18_;
  reg [3:0] _19_;
  always_ff @(negedge celloutsig_1_18z[0], negedge clkin_data[0])
    if (!clkin_data[0]) _19_ <= 4'h0;
    else _19_ <= _06_;
  assign { _07_[3:2], _01_, _02_ } = _19_;
  reg [5:0] _20_;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[0])
    if (clkin_data[0]) _20_ <= 6'h00;
    else _20_ <= celloutsig_0_3z;
  assign _05_[16:11] = _20_;
  always_ff @(posedge celloutsig_1_18z[0], negedge clkin_data[0])
    if (!clkin_data[0]) _06_ <= 4'h0;
    else _06_ <= celloutsig_0_1z;
  assign celloutsig_1_4z = { celloutsig_1_2z, celloutsig_1_2z } / { 1'h1, in_data[124:103], celloutsig_1_0z };
  assign celloutsig_0_12z = { celloutsig_0_3z[5:2], celloutsig_0_4z } / { 1'h1, in_data[14:11] };
  assign celloutsig_0_13z = { celloutsig_0_3z[3], celloutsig_0_10z, celloutsig_0_12z } / { 1'h1, in_data[73:69], celloutsig_0_10z };
  assign celloutsig_0_4z = { _06_[3:1], celloutsig_0_0z, _06_, _06_, celloutsig_0_3z, celloutsig_0_3z } == { in_data[39:20], _06_ };
  assign celloutsig_1_13z = { celloutsig_1_7z[1], celloutsig_1_3z, celloutsig_1_12z, celloutsig_1_3z } == celloutsig_1_5z[15:12];
  assign celloutsig_0_27z = _05_[16:12] == { celloutsig_0_7z[4], _07_[3:2], _01_, _02_ };
  assign celloutsig_0_6z = in_data[74] & ~(celloutsig_0_4z);
  assign celloutsig_1_9z = celloutsig_1_4z[17] & ~(celloutsig_1_5z[15]);
  assign celloutsig_0_5z = in_data[14:12] * celloutsig_0_1z[2:0];
  assign celloutsig_1_19z = { celloutsig_1_18z[7:1], celloutsig_1_13z } * { celloutsig_1_2z[3:1], celloutsig_1_16z, celloutsig_1_11z, celloutsig_1_17z };
  assign celloutsig_1_18z = celloutsig_1_10z ? { in_data[116:113], celloutsig_1_11z, celloutsig_1_16z, celloutsig_1_14z, celloutsig_1_7z, celloutsig_1_3z, 1'h1, celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_17z } : { in_data[127:126], celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_13z, celloutsig_1_9z, 1'h0, celloutsig_1_2z };
  assign celloutsig_1_11z = - in_data[163:161];
  assign celloutsig_1_5z = { celloutsig_1_2z[11:4], celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_0z } | { in_data[184:165], celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_18z = { _03_[9:7], _05_[16:11], celloutsig_0_6z } | { celloutsig_0_10z[7:4], celloutsig_0_3z };
  assign celloutsig_1_3z = | celloutsig_1_2z[2:0];
  assign celloutsig_0_33z = celloutsig_0_19z & celloutsig_0_9z[0];
  assign celloutsig_1_10z = celloutsig_1_8z & celloutsig_1_2z[10];
  assign celloutsig_0_19z = celloutsig_0_13z[7] & celloutsig_0_6z;
  assign celloutsig_1_0z = | in_data[191:189];
  assign celloutsig_1_16z = | { celloutsig_1_11z[2], celloutsig_1_5z };
  assign celloutsig_0_39z = ^ { celloutsig_0_1z[3:1], celloutsig_0_33z, celloutsig_0_27z, celloutsig_0_28z };
  assign celloutsig_0_63z = ^ { in_data[68:61], celloutsig_0_41z, celloutsig_0_24z, celloutsig_0_25z };
  assign celloutsig_1_1z = ^ { in_data[189:188], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_14z = ^ celloutsig_1_5z[10:8];
  assign celloutsig_0_28z = celloutsig_0_10z[6:2] >> celloutsig_0_9z[7:3];
  assign celloutsig_1_7z = { celloutsig_1_2z[8:6], celloutsig_1_6z } << celloutsig_1_5z[14:11];
  assign celloutsig_0_41z = { celloutsig_0_9z[5:3], celloutsig_0_6z } <<< { celloutsig_0_21z[2:0], celloutsig_0_39z };
  assign celloutsig_0_9z = { in_data[74:68], celloutsig_0_0z, celloutsig_0_0z } <<< { _03_[7], _06_, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_14z = { celloutsig_0_1z[2:0], celloutsig_0_0z } <<< { celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_3z = { in_data[39:38], _06_ } - { in_data[48], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_2z = { in_data[149:143], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z } ~^ in_data[168:157];
  assign celloutsig_0_7z = { celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z } ~^ { in_data[57:52], celloutsig_0_6z };
  assign celloutsig_0_10z = { celloutsig_0_3z[2], celloutsig_0_3z, celloutsig_0_4z } ~^ in_data[41:34];
  assign celloutsig_0_1z = in_data[85:82] ~^ { in_data[72:70], celloutsig_0_0z };
  assign celloutsig_0_25z = celloutsig_0_13z[12:2] ~^ { _04_[15], _04_[24:23], _03_[9:6], _06_ };
  assign celloutsig_1_8z = ~((celloutsig_1_5z[6] & celloutsig_1_7z[0]) | (in_data[135] & celloutsig_1_1z));
  assign celloutsig_0_15z = ~((celloutsig_0_9z[6] & celloutsig_0_7z[4]) | (celloutsig_0_14z[0] & _06_[2]));
  assign _03_[4:1] = { celloutsig_0_27z, celloutsig_0_20z, celloutsig_0_19z, celloutsig_0_30z };
  assign { _04_[22:18], _04_[14:8], _04_[5:0] } = { _03_[9:6], _00_, _04_[24:23], _03_[9:5], celloutsig_0_12z, celloutsig_0_20z };
  assign { _05_[24:17], _05_[10:0] } = { celloutsig_0_9z[6:0], celloutsig_0_17z, celloutsig_0_18z, celloutsig_0_15z };
  assign _07_[1:0] = { _01_, _02_ };
  assign { out_data[146:128], out_data[103:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_62z, celloutsig_0_63z };
endmodule
