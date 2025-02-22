/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [19:0] _01_;
  wire [5:0] _02_;
  reg [8:0] _03_;
  wire [8:0] _04_;
  wire celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [7:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [28:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [8:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [5:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [4:0] _05_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[32])
    if (clkin_data[32]) _05_ <= 5'h00;
    else _05_ <= _02_[5:1];
  assign out_data[37:33] = _05_;
  assign celloutsig_0_1z = ~celloutsig_0_0z;
  assign celloutsig_0_3z = ~in_data[3];
  assign celloutsig_0_8z = ~((celloutsig_0_7z | celloutsig_0_6z) & (celloutsig_0_0z | celloutsig_0_1z));
  assign celloutsig_1_8z = ~((celloutsig_1_2z[1] | celloutsig_1_5z) & (celloutsig_1_1z[2] | in_data[126]));
  assign celloutsig_0_70z = celloutsig_0_15z | ~(_00_);
  assign celloutsig_0_15z = celloutsig_0_4z | ~(celloutsig_0_5z);
  assign celloutsig_0_5z = ~(celloutsig_0_1z ^ celloutsig_0_3z);
  assign celloutsig_0_20z = ~(celloutsig_0_5z ^ celloutsig_0_7z);
  assign celloutsig_1_1z = { in_data[143], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } + in_data[139:136];
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _03_ <= 9'h000;
    else _03_ <= { celloutsig_1_10z[26:21], celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_13z };
  reg [8:0] _16_;
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[64])
    if (clkin_data[64]) _16_ <= 9'h000;
    else _16_ <= { celloutsig_0_9z[7:6], 1'h1, celloutsig_0_9z[4:2], celloutsig_0_20z, celloutsig_0_3z, celloutsig_0_4z };
  assign { _04_[8:7], _02_[5:1], _04_[1:0] } = _16_;
  reg [4:0] _17_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[64])
    if (!clkin_data[64]) _17_ <= 5'h00;
    else _17_ <= { celloutsig_0_9z[4:3], celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_11z };
  assign { _00_, _01_[8:5] } = _17_;
  assign celloutsig_1_10z = { celloutsig_1_1z[2:0], celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_1z } & { in_data[161:141], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_1_7z = { in_data[177:171], celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_1z } === { celloutsig_1_2z[2:1], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_12z = { celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_0z } === { celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_8z };
  assign celloutsig_1_4z = { celloutsig_1_2z[2:1], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z } > { in_data[190:184], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_17z = { celloutsig_1_12z[4:3], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_5z } > { celloutsig_1_2z[2:1], _03_, celloutsig_1_11z };
  assign celloutsig_0_2z = { in_data[5:2], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z } || in_data[89:77];
  assign celloutsig_0_7z = { celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_0z } < { in_data[49:48], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_0z = in_data[136:125] < in_data[130:119];
  assign celloutsig_1_19z = { celloutsig_1_1z[2:0], celloutsig_1_9z, celloutsig_1_10z } < { celloutsig_1_10z[27:10], celloutsig_1_13z, celloutsig_1_17z, celloutsig_1_17z, celloutsig_1_15z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_1z };
  assign celloutsig_0_11z = { celloutsig_0_3z, celloutsig_0_0z, 1'h0 } < { celloutsig_0_0z, 1'h0, celloutsig_0_8z };
  assign celloutsig_1_13z = { celloutsig_1_10z[25:21], celloutsig_1_4z } != { celloutsig_1_12z[8:6], celloutsig_1_2z };
  assign celloutsig_1_18z = _03_[0] !== celloutsig_1_5z;
  assign celloutsig_0_0z = & in_data[58:52];
  assign celloutsig_0_6z = & { celloutsig_0_4z, in_data[21:10] };
  assign celloutsig_1_6z = & { celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_9z = & { celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_2z[0] };
  assign celloutsig_1_11z = & in_data[126:105];
  assign celloutsig_0_14z = celloutsig_0_12z & celloutsig_0_3z;
  assign celloutsig_1_15z = celloutsig_1_12z[5:0] >> { in_data[130:126], celloutsig_1_11z };
  assign celloutsig_1_2z = { in_data[104:103], celloutsig_1_0z } >>> in_data[171:169];
  assign celloutsig_1_12z = in_data[116:108] ~^ celloutsig_1_10z[19:11];
  assign celloutsig_0_4z = ~((celloutsig_0_3z & celloutsig_0_2z) | celloutsig_0_0z);
  assign celloutsig_1_3z = ~((in_data[111] & in_data[134]) | in_data[127]);
  assign celloutsig_1_5z = ~((celloutsig_1_1z[2] & celloutsig_1_2z[2]) | in_data[131]);
  assign { celloutsig_0_9z[4], celloutsig_0_9z[0], celloutsig_0_9z[3], celloutsig_0_9z[7], celloutsig_0_9z[2], celloutsig_0_9z[6] } = { celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_0z } ~^ { celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_6z };
  assign { _01_[19:17], _01_[11:9], _01_[3:2], _01_[0] } = { celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_20z, 1'h0, celloutsig_0_5z, _00_, celloutsig_0_1z, celloutsig_0_14z, celloutsig_0_15z };
  assign _02_[0] = 1'h0;
  assign _04_[6:2] = _02_[5:1];
  assign { celloutsig_0_9z[5], celloutsig_0_9z[1] } = { 1'h1, celloutsig_0_9z[6] };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, 1'h0, celloutsig_0_70z };
endmodule
