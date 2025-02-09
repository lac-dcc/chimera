/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [25:0] _02_;
  reg [3:0] _03_;
  wire [11:0] _04_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire [29:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire celloutsig_0_19z;
  wire [7:0] celloutsig_0_1z;
  wire celloutsig_0_23z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire [7:0] celloutsig_0_4z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  wire celloutsig_0_6z;
  wire [7:0] celloutsig_0_7z;
  wire [3:0] celloutsig_0_8z;
  wire [3:0] celloutsig_0_9z;
  wire [3:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [15:0] celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire [11:0] celloutsig_1_18z;
  wire [4:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [3:0] celloutsig_1_4z;
  wire [32:0] celloutsig_1_5z;
  wire [4:0] celloutsig_1_7z;
  wire [4:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_6z = ~((_00_ | celloutsig_0_2z) & celloutsig_0_2z);
  assign celloutsig_1_12z = ~((celloutsig_1_11z | celloutsig_1_7z[2]) & celloutsig_1_9z);
  assign celloutsig_0_23z = ~((celloutsig_0_11z[1] | celloutsig_0_19z) & celloutsig_0_13z);
  assign celloutsig_0_15z = ~((celloutsig_0_7z[1] | in_data[63]) & (celloutsig_0_7z[3] | celloutsig_0_3z));
  assign celloutsig_0_2z = ~((in_data[51] | celloutsig_0_1z[3]) & (celloutsig_0_1z[4] | in_data[47]));
  assign celloutsig_0_19z = ~((celloutsig_0_3z | celloutsig_0_13z) & (celloutsig_0_8z[3] | in_data[38]));
  assign celloutsig_0_58z = celloutsig_0_13z | celloutsig_0_15z;
  assign celloutsig_1_9z = celloutsig_1_8z[1] | celloutsig_1_8z[4];
  assign celloutsig_0_59z = celloutsig_0_23z ^ _01_;
  assign celloutsig_1_2z = ~(celloutsig_1_0z[0] ^ celloutsig_1_0z[3]);
  assign celloutsig_1_3z = ~(celloutsig_1_0z[0] ^ in_data[130]);
  reg [8:0] _16_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _16_ <= 9'h000;
    else _16_ <= { celloutsig_0_3z, celloutsig_0_4z[7:1], celloutsig_0_0z };
  assign { _02_[13:12], _00_, _02_[10:5] } = _16_;
  always_ff @(posedge clkin_data[32], negedge clkin_data[96])
    if (!clkin_data[96]) _03_ <= 4'h0;
    else _03_ <= in_data[131:128];
  reg [2:0] _18_;
  always_ff @(negedge clkin_data[32], negedge clkin_data[96])
    if (!clkin_data[96]) _18_ <= 3'h0;
    else _18_ <= { in_data[181], celloutsig_1_3z, celloutsig_1_16z };
  assign out_data[98:96] = _18_;
  reg [11:0] _19_;
  always_ff @(posedge celloutsig_1_18z[0], negedge clkin_data[64])
    if (!clkin_data[64]) _19_ <= 12'h000;
    else _19_ <= { in_data[57:51], celloutsig_0_11z };
  assign { _04_[11], _02_[25:24], _01_, _02_[22:18], _04_[2:0] } = _19_;
  assign celloutsig_1_0z = in_data[100:97] / { 1'h1, in_data[152:150] };
  assign celloutsig_1_18z = celloutsig_1_14z[14:3] / { 1'h1, in_data[170:160] };
  assign celloutsig_0_13z = { _02_[13:12], _00_, _02_[10], celloutsig_0_4z[7:1], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_8z } === celloutsig_0_12z[27:2];
  assign celloutsig_1_10z = { celloutsig_1_1z[4:3], celloutsig_1_7z, celloutsig_1_7z } <= celloutsig_1_5z[22:11];
  assign celloutsig_0_0z = in_data[56:44] < in_data[53:41];
  assign celloutsig_0_3z = in_data[72:65] < { celloutsig_0_1z[6:2], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_4z[7:1] = celloutsig_0_2z ? { celloutsig_0_1z[6:2], celloutsig_0_1z[2], celloutsig_0_1z[2] } : { in_data[26:21], celloutsig_0_3z };
  assign celloutsig_1_8z = in_data[126] ? { in_data[191:190], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_3z } : { celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_1_11z = { celloutsig_1_1z[3:2], celloutsig_1_1z } !== { celloutsig_1_4z[3], celloutsig_1_0z, celloutsig_1_9z, celloutsig_1_10z };
  assign celloutsig_1_16z = | { celloutsig_1_8z[2:1], _03_ };
  assign celloutsig_0_10z = | { celloutsig_0_4z[6:1], celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_6z };
  assign celloutsig_1_4z = { in_data[119:117], celloutsig_1_2z } >> celloutsig_1_1z[4:1];
  assign celloutsig_1_7z = { celloutsig_1_1z[3:0], celloutsig_1_3z } >> { celloutsig_1_0z[3], _03_ };
  assign celloutsig_1_5z = { in_data[155:132], celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_4z } << { in_data[166:140], celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_9z = _02_[9:6] << { celloutsig_0_7z[4], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_7z = { in_data[74:70], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_3z } >> { in_data[78:73], celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_1_1z = { in_data[174], celloutsig_1_0z } <<< { celloutsig_1_0z[0], celloutsig_1_0z };
  assign celloutsig_0_11z = { celloutsig_0_9z[3:1], celloutsig_0_3z, celloutsig_0_6z } <<< { celloutsig_0_4z[4:1], celloutsig_0_0z };
  assign celloutsig_0_8z = { celloutsig_0_4z[4], celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_2z } >>> { in_data[28:27], celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_0_12z = { celloutsig_0_11z[4:1], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_1z[7:2], celloutsig_0_1z[2], celloutsig_0_1z[2], celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_6z } - { celloutsig_0_1z[2], celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_4z[7:1], celloutsig_0_0z, celloutsig_0_10z, _02_[13:12], _00_, _02_[10:5], celloutsig_0_6z };
  assign celloutsig_1_14z = { celloutsig_1_0z, _03_, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_12z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_10z } ~^ { celloutsig_1_4z[3], celloutsig_1_4z, _03_, celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_1z };
  assign celloutsig_0_1z[7:2] = ~ { in_data[75:71], celloutsig_0_0z };
  assign { _02_[23], _02_[14], _02_[11], _02_[4:0] } = { _01_, celloutsig_0_0z, _00_, celloutsig_0_8z, celloutsig_0_3z };
  assign _04_[10:3] = { _02_[25:24], _01_, _02_[22:18] };
  assign celloutsig_0_1z[1:0] = { celloutsig_0_1z[2], celloutsig_0_1z[2] };
  assign celloutsig_0_4z[0] = celloutsig_0_0z;
  assign { out_data[139:128], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_0_58z, celloutsig_0_59z };
endmodule
