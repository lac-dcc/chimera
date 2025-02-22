/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [10:0] _00_;
  wire [6:0] celloutsig_0_0z;
  wire [3:0] celloutsig_0_10z;
  wire celloutsig_0_13z;
  wire celloutsig_0_1z;
  wire celloutsig_0_3z;
  wire [13:0] celloutsig_0_5z;
  wire [3:0] celloutsig_0_6z;
  wire [16:0] celloutsig_0_7z;
  wire [7:0] celloutsig_0_9z;
  wire [15:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [8:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [9:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [3:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [10:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_3z = celloutsig_1_0z[3] ^ celloutsig_1_1z[3];
  assign celloutsig_1_4z = celloutsig_1_3z ^ in_data[179];
  assign celloutsig_1_9z = ~(celloutsig_1_8z ^ celloutsig_1_2z);
  reg [10:0] _04_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _04_ <= 11'h000;
    else _04_ <= { in_data[18:9], celloutsig_0_3z };
  assign { _00_[10:9], out_data[32], _00_[7:0] } = _04_;
  assign celloutsig_1_0z = in_data[135:120] & in_data[174:159];
  assign celloutsig_1_1z = celloutsig_1_0z[7:4] & in_data[186:183];
  assign celloutsig_1_6z = { in_data[142:133], celloutsig_1_2z } & { in_data[128:120], celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_1_16z = celloutsig_1_1z & celloutsig_1_11z[5:2];
  assign celloutsig_0_13z = { in_data[91:73], celloutsig_0_10z } >= { celloutsig_0_0z[5:3], out_data[32], celloutsig_0_10z, celloutsig_0_10z, _00_[10:9], out_data[32], _00_[7:0] };
  assign celloutsig_1_18z = { celloutsig_1_16z[3:1], celloutsig_1_13z, celloutsig_1_10z, celloutsig_1_14z } >= { celloutsig_1_11z[7:0], celloutsig_1_13z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_15z, celloutsig_1_9z };
  assign celloutsig_1_2z = ! in_data[163:160];
  assign celloutsig_1_7z = ! { celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_8z = ! in_data[138:121];
  assign celloutsig_1_10z = ! { celloutsig_1_6z[8:7], celloutsig_1_5z };
  assign celloutsig_1_12z = ! { celloutsig_1_8z, celloutsig_1_10z, celloutsig_1_1z };
  assign celloutsig_1_15z = ! { celloutsig_1_10z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_6z };
  assign celloutsig_0_3z = ! { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_1_14z = { celloutsig_1_11z[8:4], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_13z, celloutsig_1_3z } % { 1'h1, celloutsig_1_0z[10:5], celloutsig_1_2z, celloutsig_1_12z, celloutsig_1_4z };
  assign celloutsig_0_1z = | { in_data[63:57], celloutsig_0_0z };
  assign celloutsig_1_5z = | celloutsig_1_0z[11:7];
  assign celloutsig_1_13z = | { celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_9z };
  assign celloutsig_1_19z = | { celloutsig_1_15z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_0_0z = in_data[69:63] >> in_data[13:7];
  assign celloutsig_0_9z = in_data[93:86] >> { celloutsig_0_7z[16:15], 1'h0, celloutsig_0_7z[13:9] };
  assign celloutsig_1_11z = { celloutsig_1_0z[9:3], celloutsig_1_2z, celloutsig_1_4z } >> { celloutsig_1_0z[6:4], celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_2z };
  assign celloutsig_0_10z = { celloutsig_0_6z[2], 1'h0, celloutsig_0_6z[0], celloutsig_0_1z } >>> celloutsig_0_9z[5:2];
  assign { celloutsig_0_7z[0], celloutsig_0_7z[3:2], celloutsig_0_7z[13:5], celloutsig_0_7z[16:15] } = { celloutsig_0_3z, celloutsig_0_5z[2:1], celloutsig_0_5z[12:4], celloutsig_0_1z, celloutsig_0_1z } & { _00_[0], _00_[3:2], _00_[2:0], _00_[10:9], out_data[32], _00_[7:5], _00_[5:4] };
  assign { celloutsig_0_6z[2], celloutsig_0_6z[0] } = { out_data[32], celloutsig_0_1z } & { celloutsig_0_5z[2], celloutsig_0_3z };
  assign { celloutsig_0_5z[2:1], celloutsig_0_5z[12:4] } = { celloutsig_0_3z, celloutsig_0_3z, in_data[44:36] } & { _00_[1:0], celloutsig_0_1z, _00_[10:9], out_data[32], _00_[7:3] };
  assign _00_[8] = out_data[32];
  assign { celloutsig_0_5z[13], celloutsig_0_5z[3], celloutsig_0_5z[0] } = 3'h0;
  assign { celloutsig_0_6z[3], celloutsig_0_6z[1] } = 2'h0;
  assign { celloutsig_0_7z[14], celloutsig_0_7z[4], celloutsig_0_7z[1] } = 3'h0;
  assign { out_data[128], out_data[96], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_13z };
endmodule
