/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [9:0] _00_;
  wire [2:0] _01_;
  wire [10:0] _02_;
  reg [2:0] _03_;
  wire [13:0] celloutsig_0_0z;
  wire [5:0] celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire [5:0] celloutsig_0_14z;
  wire [2:0] celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire [2:0] celloutsig_0_18z;
  wire [8:0] celloutsig_0_19z;
  wire [4:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [14:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire [9:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [11:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [7:0] celloutsig_1_13z;
  wire [10:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [5:0] celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [6:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire [6:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_13z = { celloutsig_1_10z[3], celloutsig_1_0z, celloutsig_1_11z, celloutsig_1_6z, celloutsig_1_10z } + { celloutsig_1_5z[3:0], celloutsig_1_10z };
  assign celloutsig_1_15z = { celloutsig_1_2z[2], celloutsig_1_2z, celloutsig_1_5z } + { celloutsig_1_3z[8:3], celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_4z };
  assign celloutsig_0_5z = in_data[74:65] + { _00_[9:6], _00_[9:7], _00_[2:0] };
  assign celloutsig_0_8z = { _00_[6], _00_[9:7], _00_[2:0], celloutsig_0_1z } + { celloutsig_0_0z[13:8], celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_0_12z = celloutsig_0_0z[9:4] + { celloutsig_0_8z[10:6], celloutsig_0_7z };
  assign celloutsig_0_15z = in_data[79:77] + _01_;
  assign celloutsig_1_1z = { in_data[124:120], celloutsig_1_0z } + { in_data[164:161], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_3z = { in_data[176:172], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z } + in_data[142:133];
  assign celloutsig_1_5z = { in_data[111:109], celloutsig_1_2z, celloutsig_1_0z } + celloutsig_1_3z[6:0];
  assign celloutsig_1_7z = { celloutsig_1_5z[3:2], celloutsig_1_6z } + celloutsig_1_1z[2:0];
  assign celloutsig_1_8z = { celloutsig_1_1z[5:1], celloutsig_1_0z, celloutsig_1_0z } + { celloutsig_1_5z[3:0], celloutsig_1_7z };
  reg [6:0] _15_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _15_ <= 7'h00;
    else _15_ <= { celloutsig_0_2z[12:11], celloutsig_0_1z };
  assign { _00_[6], _00_[9:7], _00_[2:0] } = _15_;
  reg [10:0] _16_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _16_ <= 11'h000;
    else _16_ <= { celloutsig_0_5z[8:1], celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_7z };
  assign { _02_[10:9], _01_, _02_[5:0] } = _16_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _03_ <= 3'h0;
    else _03_ <= { celloutsig_0_1z[2:1], celloutsig_0_6z };
  assign celloutsig_0_0z = in_data[21:8] & in_data[24:11];
  assign celloutsig_1_10z = celloutsig_1_5z[6:3] & { celloutsig_1_3z[7:5], celloutsig_1_9z };
  assign celloutsig_0_11z = { celloutsig_0_1z[0], celloutsig_0_1z } & in_data[65:60];
  assign celloutsig_0_1z = celloutsig_0_0z[7:3] & in_data[9:5];
  assign celloutsig_0_14z = celloutsig_0_12z & celloutsig_0_0z[6:1];
  assign celloutsig_0_18z = _03_ & celloutsig_0_8z[6:4];
  assign celloutsig_0_19z = celloutsig_0_0z[12:4] & { celloutsig_0_2z[10:5], celloutsig_0_18z };
  assign celloutsig_0_2z = in_data[65:51] & { celloutsig_0_1z[4], celloutsig_0_0z };
  assign celloutsig_1_2z = { celloutsig_1_1z[5:4], celloutsig_1_0z } & in_data[132:130];
  assign celloutsig_1_11z = { celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_9z } >= { in_data[190:189], celloutsig_1_0z };
  assign celloutsig_0_7z = celloutsig_0_2z[12:10] >= { celloutsig_0_0z[13:12], celloutsig_0_3z };
  assign celloutsig_0_9z = celloutsig_0_2z[9:3] >= celloutsig_0_2z[12:6];
  assign celloutsig_1_4z = { in_data[138:136], celloutsig_1_0z } >= celloutsig_1_3z[8:5];
  assign celloutsig_1_6z = { celloutsig_1_1z[1:0], celloutsig_1_0z } >= celloutsig_1_1z[4:2];
  assign celloutsig_1_9z = in_data[136:134] >= celloutsig_1_8z[3:1];
  assign celloutsig_0_3z = celloutsig_0_2z[13:10] <= in_data[92:89];
  assign celloutsig_1_18z = { in_data[168:162], celloutsig_1_6z } <= celloutsig_1_15z[8:1];
  assign celloutsig_1_19z = in_data[180:177] <= { celloutsig_1_13z[6:4], celloutsig_1_11z };
  assign celloutsig_0_6z = { celloutsig_0_0z[12:4], celloutsig_0_3z } <= celloutsig_0_0z[11:2];
  assign celloutsig_0_17z = { celloutsig_0_1z, celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_14z } <= { celloutsig_0_11z, celloutsig_0_2z };
  assign celloutsig_0_20z = { in_data[12:5], celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_12z } <= { celloutsig_0_2z[14:9], celloutsig_0_3z, celloutsig_0_19z };
  assign celloutsig_1_0z = in_data[163:161] <= in_data[153:151];
  assign _00_[5:3] = _00_[9:7];
  assign _02_[8:6] = _01_;
  assign { out_data[128], out_data[96], out_data[40:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_19z, celloutsig_0_20z };
endmodule
