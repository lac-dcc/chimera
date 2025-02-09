/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire [4:0] _04_;
  wire [31:0] _05_;
  wire [8:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [27:0] celloutsig_0_12z;
  wire [3:0] celloutsig_0_13z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire [17:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [16:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [13:0] celloutsig_1_10z;
  wire [24:0] celloutsig_1_11z;
  wire [5:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire [16:0] celloutsig_1_19z;
  wire [17:0] celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire [5:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_7z = _00_ ? celloutsig_0_2z : celloutsig_0_1z;
  assign celloutsig_1_4z = _01_ ? in_data[166] : celloutsig_1_3z[3];
  assign celloutsig_0_5z = ~(_02_ & celloutsig_0_2z);
  assign celloutsig_0_1z = ~(celloutsig_0_0z[4] & in_data[73]);
  assign celloutsig_1_18z = celloutsig_1_12z[1] ^ celloutsig_1_13z[0];
  assign celloutsig_0_2z = in_data[49] ^ celloutsig_0_0z[1];
  assign celloutsig_0_8z = { celloutsig_0_4z[16:9], celloutsig_0_0z } + { in_data[51:39], celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_1_12z = { celloutsig_1_3z[3], celloutsig_1_2z } + celloutsig_1_10z[12:7];
  reg [4:0] _14_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _14_ <= 5'h00;
    else _14_ <= { celloutsig_0_0z[4:1], celloutsig_0_1z };
  assign { _04_[4:3], _02_, _04_[1], _00_ } = _14_;
  reg [31:0] _15_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _15_ <= 32'd0;
    else _15_ <= in_data[138:107];
  assign { _05_[31:29], _01_, _05_[27:2], _03_, _05_[0] } = _15_;
  assign celloutsig_1_10z = { in_data[149:137], celloutsig_1_4z } & celloutsig_1_1z[14:1];
  assign celloutsig_0_9z = { in_data[71:67], _04_[4:3], _02_, _04_[1], _00_, celloutsig_0_2z } !== { in_data[4:2], celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_0_6z = celloutsig_0_5z & _04_[1];
  assign celloutsig_0_10z = celloutsig_0_2z & _04_[3];
  assign celloutsig_0_11z = celloutsig_0_2z & celloutsig_0_6z;
  assign celloutsig_1_5z = celloutsig_1_4z & celloutsig_1_1z[11];
  assign celloutsig_1_6z = ~^ { _05_[12:2], celloutsig_1_5z, celloutsig_1_2z };
  assign celloutsig_1_19z = celloutsig_1_1z[17:1] >> _05_[25:9];
  assign celloutsig_0_13z = { in_data[22:20], celloutsig_0_2z } >> celloutsig_0_8z[13:10];
  assign celloutsig_1_3z = { celloutsig_1_2z[4], celloutsig_1_2z } >> celloutsig_1_1z[14:9];
  assign celloutsig_1_11z = { _05_[18:2], celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_4z } >> in_data[151:127];
  assign celloutsig_1_2z = celloutsig_1_1z[12:8] >> _05_[8:4];
  assign celloutsig_1_13z = celloutsig_1_11z[23:20] >> in_data[158:155];
  assign celloutsig_0_0z = in_data[44:36] <<< in_data[58:50];
  assign celloutsig_0_12z = { in_data[34:15], _04_[4:3], _02_, _04_[1], _00_, celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_5z } - { celloutsig_0_4z[10:2], celloutsig_0_4z[2], celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_10z, _04_[4:3], _02_, _04_[1], _00_ };
  assign celloutsig_1_1z = in_data[185:168] ~^ { _05_[30:29], _01_, _05_[27:13] };
  assign { celloutsig_0_4z[0], celloutsig_0_4z[2], celloutsig_0_4z[17:3] } = ~ { celloutsig_0_2z, celloutsig_0_1z, in_data[61:47] };
  assign { _04_[2], _04_[0] } = { _02_, _00_ };
  assign { _05_[28], _05_[1] } = { _01_, _03_ };
  assign celloutsig_0_4z[1] = celloutsig_0_4z[2];
  assign { out_data[128], out_data[112:96], out_data[59:32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_12z, celloutsig_0_13z };
endmodule
