/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [3:0] _03_;
  wire [8:0] _04_;
  wire [7:0] _05_;
  reg [15:0] _06_;
  wire [7:0] celloutsig_0_0z;
  wire [11:0] celloutsig_0_10z;
  wire [7:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [7:0] celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire [21:0] celloutsig_0_23z;
  wire [5:0] celloutsig_0_25z;
  wire [5:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_52z;
  wire celloutsig_0_63z;
  wire celloutsig_0_64z;
  wire [38:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [8:0] celloutsig_1_15z;
  wire [17:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [3:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_64z = celloutsig_0_13z[2] ? celloutsig_0_11z[6] : celloutsig_0_20z;
  assign celloutsig_0_8z = celloutsig_0_3z ? celloutsig_0_3z : celloutsig_0_6z[35];
  assign celloutsig_0_16z = celloutsig_0_0z[7] ? celloutsig_0_10z[8] : celloutsig_0_12z;
  assign celloutsig_0_19z = _00_ ? celloutsig_0_15z : celloutsig_0_16z;
  assign celloutsig_0_29z = celloutsig_0_7z ? celloutsig_0_19z : celloutsig_0_11z[6];
  assign celloutsig_1_7z = ~(celloutsig_1_1z & _01_);
  assign celloutsig_0_4z = celloutsig_0_0z[0] | ~(celloutsig_0_3z);
  assign celloutsig_1_18z = celloutsig_1_3z | ~(celloutsig_1_16z[9]);
  assign celloutsig_0_20z = celloutsig_0_7z | ~(in_data[91]);
  assign celloutsig_0_22z = _02_ | ~(celloutsig_0_1z);
  assign celloutsig_0_63z = celloutsig_0_52z | celloutsig_0_34z;
  assign celloutsig_1_3z = celloutsig_1_0z | in_data[102];
  assign celloutsig_1_12z = celloutsig_1_2z | celloutsig_1_9z;
  assign celloutsig_0_0z = in_data[57:50] + in_data[37:30];
  reg [3:0] _21_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[64])
    if (!clkin_data[64]) _21_ <= 4'h0;
    else _21_ <= { celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_1z };
  assign { _00_, _03_[2:0] } = _21_;
  reg [8:0] _22_;
  always_ff @(posedge clkin_data[32], negedge clkin_data[96])
    if (!clkin_data[96]) _22_ <= 9'h000;
    else _22_ <= { in_data[133:128], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_3z };
  assign { _04_[8], _01_, _04_[6:0] } = _22_;
  reg [7:0] _23_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[64])
    if (!clkin_data[64]) _23_ <= 8'h00;
    else _23_ <= { celloutsig_0_13z[6:3], celloutsig_0_12z, celloutsig_0_19z, celloutsig_0_18z, celloutsig_0_15z };
  assign { _02_, _05_[6:0] } = _23_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[64])
    if (clkin_data[64]) _06_ <= 16'h0000;
    else _06_ <= { celloutsig_0_23z[18:7], celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_20z, celloutsig_0_16z };
  assign celloutsig_1_6z = { _04_[3:1], celloutsig_1_2z } / { 1'h1, _04_[2:0] };
  assign celloutsig_1_4z = in_data[121:120] == { celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_13z = { _01_, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_1z } == { celloutsig_1_6z[2:0], celloutsig_1_2z };
  assign celloutsig_0_9z = celloutsig_0_6z[14:4] == { in_data[62:56], celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_1_0z = in_data[180:177] >= in_data[190:187];
  assign celloutsig_1_1z = in_data[165:158] > in_data[129:122];
  assign celloutsig_0_18z = celloutsig_0_13z[7:4] > { _03_[2], celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_16z };
  assign celloutsig_0_12z = { celloutsig_0_6z[0], celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_10z } <= { in_data[27:12], celloutsig_0_7z };
  assign celloutsig_0_1z = in_data[92:87] <= in_data[19:14];
  assign celloutsig_0_15z = { celloutsig_0_0z[2:1], celloutsig_0_1z, _00_, _03_[2:0], celloutsig_0_0z } <= { celloutsig_0_6z[8:2], celloutsig_0_13z };
  assign celloutsig_1_19z = { celloutsig_1_7z, celloutsig_1_13z, celloutsig_1_11z } && { celloutsig_1_7z, celloutsig_1_18z, celloutsig_1_7z };
  assign celloutsig_0_27z = { celloutsig_0_25z[5], celloutsig_0_4z, celloutsig_0_22z, celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_15z } && { celloutsig_0_1z, celloutsig_0_26z };
  assign celloutsig_1_8z = ! { _01_, _04_[6:5], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_7z = { in_data[32], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_3z } || { _00_, _03_[2:0] };
  assign celloutsig_1_2z = { in_data[133:131], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z } < { in_data[120:116], celloutsig_1_0z };
  assign celloutsig_0_13z = { celloutsig_0_6z[5:4], _00_, _03_[2:0], celloutsig_0_3z, celloutsig_0_8z } % { 1'h1, celloutsig_0_10z[7:1] };
  assign celloutsig_1_15z = { _04_[8], _01_, _04_[6:4], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_11z, celloutsig_1_3z } % { 1'h1, celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_13z, celloutsig_1_7z, celloutsig_1_12z, celloutsig_1_12z, celloutsig_1_9z };
  assign celloutsig_1_16z = { _04_[8], _01_, _04_[6:0], celloutsig_1_12z, celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_9z } % { 1'h1, celloutsig_1_15z[7:3], celloutsig_1_0z, _04_[8], _01_, _04_[6:0], celloutsig_1_12z, celloutsig_1_13z };
  assign celloutsig_0_23z = { celloutsig_0_6z[8:7], celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_12z } % { 1'h1, celloutsig_0_10z[10:7], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_6z = celloutsig_0_1z ? { in_data[39:2], celloutsig_0_4z } : { in_data[34:13], 1'h0, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_35z = celloutsig_0_23z[19:6] != { celloutsig_0_23z[21:9], celloutsig_0_29z };
  assign celloutsig_1_11z = { celloutsig_1_9z, celloutsig_1_2z } != { celloutsig_1_8z, celloutsig_1_3z };
  assign celloutsig_0_10z = - { celloutsig_0_0z[4:0], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_1z, _00_, _03_[2:0] };
  assign celloutsig_0_11z = - { celloutsig_0_6z[8], celloutsig_0_1z, celloutsig_0_7z, _00_, _03_[2:0], celloutsig_0_1z };
  assign celloutsig_0_25z = - celloutsig_0_13z[6:1];
  assign celloutsig_0_26z = - celloutsig_0_0z[6:1];
  assign celloutsig_0_3z = & celloutsig_0_0z[6:0];
  assign celloutsig_1_9z = & { celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_4z };
  assign celloutsig_0_34z = | { celloutsig_0_27z, _06_[8:6], celloutsig_0_20z };
  assign celloutsig_0_52z = | { celloutsig_0_35z, celloutsig_0_20z, celloutsig_0_11z[7:4] };
  assign _03_[3] = _00_;
  assign _04_[7] = _01_;
  assign _05_[7] = _02_;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_63z, celloutsig_0_64z };
endmodule
