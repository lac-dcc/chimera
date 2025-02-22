/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [18:0] _03_;
  reg [5:0] _04_;
  reg [8:0] _05_;
  wire [2:0] _06_;
  wire celloutsig_0_0z;
  wire [12:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [6:0] celloutsig_0_14z;
  wire celloutsig_0_16z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_25z;
  wire [25:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire [6:0] celloutsig_0_46z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire [5:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire [3:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [5:0] celloutsig_1_16z;
  wire [19:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [5:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire [24:0] celloutsig_1_4z;
  wire [4:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [2:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_18z = ~(celloutsig_1_17z[2] & celloutsig_1_3z[0]);
  assign celloutsig_1_11z = ~celloutsig_1_4z[5];
  assign celloutsig_1_19z = ~celloutsig_1_5z[4];
  assign celloutsig_0_3z = ~in_data[6];
  assign celloutsig_0_11z = ~((celloutsig_0_3z | celloutsig_0_10z[6]) & celloutsig_0_6z[2]);
  assign celloutsig_1_2z = ~((celloutsig_1_0z | celloutsig_1_0z) & (celloutsig_1_0z | celloutsig_1_0z));
  assign celloutsig_1_6z = ~((in_data[99] | celloutsig_1_4z[3]) & (celloutsig_1_2z | celloutsig_1_5z[1]));
  assign celloutsig_0_22z = celloutsig_0_12z ^ celloutsig_0_19z;
  assign celloutsig_0_25z = celloutsig_0_20z ^ celloutsig_0_19z;
  assign celloutsig_0_53z = ~(celloutsig_0_25z ^ celloutsig_0_46z[3]);
  assign celloutsig_0_54z = ~(celloutsig_0_21z ^ in_data[6]);
  assign celloutsig_1_0z = ~(in_data[180] ^ in_data[162]);
  assign celloutsig_1_7z = ~(celloutsig_1_2z ^ celloutsig_1_6z);
  assign celloutsig_0_12z = ~(celloutsig_0_0z ^ celloutsig_0_2z[0]);
  assign celloutsig_0_16z = ~(celloutsig_0_0z ^ _02_);
  reg [18:0] _22_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[96])
    if (!clkin_data[96]) _22_ <= 19'h00000;
    else _22_ <= { celloutsig_0_2z[23:6], celloutsig_0_3z };
  assign { _03_[18:2], _01_, _03_[0] } = _22_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[128])
    if (clkin_data[128]) _04_ <= 6'h00;
    else _04_ <= { celloutsig_1_2z, celloutsig_1_5z };
  always_ff @(negedge clkin_data[32], negedge clkin_data[128])
    if (!clkin_data[128]) _05_ <= 9'h000;
    else _05_ <= { celloutsig_1_1z, celloutsig_1_8z };
  reg [2:0] _25_;
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[64])
    if (clkin_data[64]) _25_ <= 3'h0;
    else _25_ <= _03_[18:16];
  assign { _00_, _06_[1], _02_ } = _25_;
  assign celloutsig_1_5z = celloutsig_1_1z[5:1] & celloutsig_1_4z[18:14];
  assign celloutsig_1_17z = { celloutsig_1_13z[1], celloutsig_1_16z, celloutsig_1_13z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_14z } & { celloutsig_1_16z[2:1], celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_15z, celloutsig_1_5z };
  assign celloutsig_0_14z = { _03_[7:3], celloutsig_0_3z, celloutsig_0_7z } / { 1'h1, celloutsig_0_10z[11], celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_9z = celloutsig_0_2z[20:15] > { celloutsig_0_2z[5:3], 1'h1, in_data[6], celloutsig_0_7z };
  assign celloutsig_0_19z = { celloutsig_0_2z[11:3], in_data[6] } > { celloutsig_0_14z[5:0], celloutsig_0_16z, 1'h1, celloutsig_0_3z, celloutsig_0_9z };
  assign celloutsig_0_20z = { celloutsig_0_2z[19:15], celloutsig_0_9z, in_data[6], celloutsig_0_0z, celloutsig_0_0z } && 1'h1;
  assign celloutsig_0_21z = 1'h1 && { _03_[14:13], _00_, _06_[1], _02_, _00_, _06_[1], _02_, celloutsig_0_12z };
  assign celloutsig_0_46z = { celloutsig_0_14z[6:3], _00_, _06_[1], _02_ } % { 1'h1, _03_[3:2], _01_, celloutsig_0_16z, celloutsig_0_22z, celloutsig_0_25z };
  assign celloutsig_1_1z = in_data[156:151] % { 1'h1, in_data[115:111] };
  assign celloutsig_1_3z = { in_data[132:131], celloutsig_1_0z } % { 1'h1, celloutsig_1_1z[1:0] };
  assign celloutsig_0_6z = _03_[14:9] % { 1'h1, in_data[35], celloutsig_0_1z, celloutsig_0_1z, 1'h1, celloutsig_0_3z };
  assign celloutsig_1_16z = { _05_[6:5], celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_14z, celloutsig_1_15z } % { 1'h1, celloutsig_1_13z[2:1], celloutsig_1_15z, celloutsig_1_6z, celloutsig_1_9z };
  assign celloutsig_0_2z = { in_data[24:0], celloutsig_0_1z } % { 1'h1, in_data[27:3] };
  assign celloutsig_1_4z = { in_data[131:114], celloutsig_1_0z, celloutsig_1_1z } % { 1'h1, in_data[131:109], celloutsig_1_2z };
  assign celloutsig_0_10z = { _03_[13:7], celloutsig_0_3z, 1'h1, celloutsig_0_1z, in_data[6], celloutsig_0_7z, celloutsig_0_0z } % { 1'h1, celloutsig_0_6z[1:0], celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_0z, 2'h3, celloutsig_0_7z, in_data[6] };
  assign celloutsig_1_8z = - celloutsig_1_1z[2:0];
  assign celloutsig_1_13z = { celloutsig_1_3z[1:0], celloutsig_1_9z, celloutsig_1_2z } | { celloutsig_1_1z[3], celloutsig_1_11z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_9z = & { celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_1z[0] };
  assign celloutsig_0_7z = & celloutsig_0_2z[11:0];
  assign celloutsig_0_1z = | { in_data[95:93], celloutsig_0_0z };
  assign celloutsig_0_0z = ^ in_data[49:14];
  assign celloutsig_1_14z = ^ { in_data[175:167], _04_ };
  assign celloutsig_1_15z = ~((_04_[3] & celloutsig_1_2z) | (in_data[156] & celloutsig_1_0z));
  assign _03_[1] = _01_;
  assign { _06_[2], _06_[0] } = { _00_, _02_ };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_53z, celloutsig_0_54z };
endmodule
