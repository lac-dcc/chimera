/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire [6:0] _04_;
  wire [5:0] _05_;
  wire [12:0] _06_;
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [2:0] celloutsig_0_14z;
  wire [6:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [10:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [10:0] celloutsig_0_1z;
  wire [2:0] celloutsig_0_20z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [8:0] celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_31z;
  wire celloutsig_0_34z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [2:0] celloutsig_0_40z;
  wire [16:0] celloutsig_0_41z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [6:0] celloutsig_1_3z;
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
  assign celloutsig_0_31z = !(celloutsig_0_3z ? celloutsig_0_9z : _00_);
  assign celloutsig_0_45z = !(celloutsig_0_17z[5] ? celloutsig_0_17z[4] : celloutsig_0_11z);
  assign celloutsig_1_2z = !(in_data[159] ? celloutsig_1_1z : celloutsig_1_0z);
  assign celloutsig_1_14z = !(celloutsig_1_1z ? celloutsig_1_0z : celloutsig_1_5z);
  assign celloutsig_0_10z = !(celloutsig_0_8z ? celloutsig_0_4z : celloutsig_0_1z[1]);
  assign celloutsig_0_18z = !(in_data[37] ? in_data[52] : celloutsig_0_15z[1]);
  assign celloutsig_0_34z = ~celloutsig_0_12z;
  assign celloutsig_1_6z = _01_ | ~(celloutsig_1_0z);
  assign celloutsig_1_1z = celloutsig_1_0z ^ in_data[156];
  assign celloutsig_1_5z = in_data[178] ^ _02_;
  assign celloutsig_1_10z = celloutsig_1_8z ^ celloutsig_1_7z;
  assign celloutsig_0_12z = celloutsig_0_11z ^ celloutsig_0_5z;
  assign celloutsig_0_16z = celloutsig_0_12z ^ celloutsig_0_9z;
  assign celloutsig_0_23z = _03_ ^ celloutsig_0_3z;
  reg [5:0] _21_;
  always_ff @(posedge clkin_data[32], negedge clkin_data[128])
    if (!clkin_data[128]) _21_ <= 6'h00;
    else _21_ <= { celloutsig_1_3z[4:1], celloutsig_1_0z, celloutsig_1_1z };
  assign { _05_[5], _01_, _05_[3:2], _02_, _05_[0] } = _21_;
  reg [8:0] _22_;
  always_ff @(negedge clkin_data[32], posedge clkin_data[128])
    if (clkin_data[128]) _22_ <= 9'h000;
    else _22_ <= { in_data[148:144], celloutsig_1_14z, celloutsig_1_18z, celloutsig_1_18z, celloutsig_1_18z };
  assign out_data[104:96] = _22_;
  reg [12:0] _23_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[96])
    if (clkin_data[96]) _23_ <= 13'h0000;
    else _23_ <= { _04_[5], _00_, _04_[3:1], celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_8z };
  assign { _06_[12:7], _03_, _06_[5:0] } = _23_;
  reg [6:0] _24_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _24_ <= 7'h00;
    else _24_ <= { in_data[73:71], celloutsig_0_0z };
  assign { _04_[6:5], _00_, _04_[3:0] } = _24_;
  assign celloutsig_0_20z = { celloutsig_0_15z[1], celloutsig_0_3z, celloutsig_0_4z } / { 1'h1, _00_, celloutsig_0_9z };
  assign celloutsig_0_3z = in_data[31:16] === { in_data[3:2], _04_[6:5], _00_, _04_[3:0], _04_[6:5], _00_, _04_[3:0] };
  assign celloutsig_0_46z = in_data[47:41] === { celloutsig_0_41z[15:11], celloutsig_0_39z, celloutsig_0_9z };
  assign celloutsig_0_8z = { _00_, _04_[3:0], celloutsig_0_7z, celloutsig_0_6z, _04_[6:5], _00_, _04_[3:0], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_6z } >= { in_data[9:4], celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_29z = { in_data[41:35], celloutsig_0_6z } >= { celloutsig_0_1z[6:1], celloutsig_0_19z, celloutsig_0_19z };
  assign celloutsig_0_4z = celloutsig_0_0z[3:1] || celloutsig_0_1z[8:6];
  assign celloutsig_0_19z = { celloutsig_0_1z[6:2], celloutsig_0_16z, celloutsig_0_12z } || { _06_[11:7], celloutsig_0_4z, celloutsig_0_9z };
  assign celloutsig_0_9z = celloutsig_0_0z[2] & ~(celloutsig_0_3z);
  assign celloutsig_0_0z = in_data[16:13] % { 1'h1, in_data[17:15] };
  assign celloutsig_0_1z = in_data[39] ? in_data[52:42] : in_data[57:47];
  assign celloutsig_0_26z = celloutsig_0_19z ? { celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_18z, celloutsig_0_3z, celloutsig_0_10z, celloutsig_0_24z, celloutsig_0_9z } : { in_data[52:51], celloutsig_0_5z, celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_16z };
  assign celloutsig_1_18z = { _05_[5], _01_, _05_[3], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_10z } !== celloutsig_1_3z;
  assign celloutsig_0_41z = { in_data[82], celloutsig_0_34z, celloutsig_0_31z, celloutsig_0_17z, celloutsig_0_40z } | { _06_[12:7], _03_, _06_[5:0], celloutsig_0_12z, celloutsig_0_18z, celloutsig_0_5z, celloutsig_0_29z };
  assign celloutsig_1_3z = in_data[190:184] | { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_0z = | in_data[121:116];
  assign celloutsig_1_8z = | in_data[129:119];
  assign celloutsig_0_6z = | { _00_, celloutsig_0_5z, _04_[6:5] };
  assign celloutsig_1_7z = ~^ { _05_[5], celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_2z };
  assign celloutsig_0_7z = ~^ in_data[18:4];
  assign celloutsig_0_28z = ^ { celloutsig_0_20z[1:0], celloutsig_0_18z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_19z };
  assign celloutsig_0_40z = { celloutsig_0_26z[1:0], celloutsig_0_11z } >>> { celloutsig_0_18z, celloutsig_0_4z, celloutsig_0_11z };
  assign celloutsig_0_14z = celloutsig_0_1z[2:0] ~^ { _06_[1:0], celloutsig_0_3z };
  assign celloutsig_0_17z = { celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_15z } ~^ { in_data[17:8], celloutsig_0_10z };
  assign celloutsig_0_15z = celloutsig_0_1z[8:2] ^ in_data[58:52];
  assign celloutsig_0_39z = ~((celloutsig_0_23z & celloutsig_0_26z[6]) | celloutsig_0_28z);
  assign celloutsig_0_5z = ~((celloutsig_0_4z & celloutsig_0_3z) | celloutsig_0_1z[0]);
  assign celloutsig_0_11z = ~((celloutsig_0_10z & celloutsig_0_9z) | celloutsig_0_10z);
  assign celloutsig_0_24z = ~((celloutsig_0_11z & celloutsig_0_10z) | celloutsig_0_8z);
  assign _04_[4] = _00_;
  assign { _05_[4], _05_[1] } = { _01_, _02_ };
  assign _06_[6] = _03_;
  assign { out_data[128], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_0_45z, celloutsig_0_46z };
endmodule
