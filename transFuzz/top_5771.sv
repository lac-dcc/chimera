/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [10:0] _02_;
  reg [4:0] _03_;
  reg [3:0] _04_;
  reg [13:0] _05_;
  wire [6:0] _06_;
  wire [12:0] celloutsig_0_0z;
  wire [17:0] celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [10:0] celloutsig_0_14z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [10:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [12:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_26z;
  wire [4:0] celloutsig_0_29z;
  wire [5:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [27:0] celloutsig_0_3z;
  wire [15:0] celloutsig_0_4z;
  wire [7:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [9:0] celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire [13:0] celloutsig_1_10z;
  wire [4:0] celloutsig_1_13z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [4:0] celloutsig_1_5z;
  wire [5:0] celloutsig_1_7z;
  wire [2:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_1z = ~(celloutsig_1_0z & celloutsig_1_0z);
  assign celloutsig_1_3z = ~(celloutsig_1_0z & in_data[154]);
  assign celloutsig_1_19z = ~(celloutsig_1_8z[2] & in_data[165]);
  assign celloutsig_1_9z = ~((celloutsig_1_4z | _01_) & (celloutsig_1_7z[0] | celloutsig_1_0z));
  assign celloutsig_0_1z = ~((in_data[10] | celloutsig_0_0z[0]) & (celloutsig_0_0z[12] | in_data[4]));
  assign celloutsig_0_30z = ~((celloutsig_0_13z | _00_) & (celloutsig_0_2z[5] | _00_));
  reg [10:0] _13_;
  always_ff @(negedge clkin_data[32], posedge clkin_data[96])
    if (clkin_data[96]) _13_ <= 11'h000;
    else _13_ <= { in_data[183], celloutsig_1_2z, celloutsig_1_0z };
  assign { _02_[10:8], _01_, _02_[6:0] } = _13_;
  always_ff @(negedge clkin_data[32], negedge clkin_data[96])
    if (!clkin_data[96]) _03_ <= 5'h00;
    else _03_ <= _02_[6:2];
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[64])
    if (!clkin_data[64]) _04_ <= 4'h0;
    else _04_ <= celloutsig_0_0z[7:4];
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[64])
    if (clkin_data[64]) _05_ <= 14'h0000;
    else _05_ <= { celloutsig_0_19z[8:3], celloutsig_0_2z, celloutsig_0_22z, celloutsig_0_13z };
  reg [6:0] _17_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _17_ <= 7'h00;
    else _17_ <= { _05_[9:5], celloutsig_0_22z, celloutsig_0_26z };
  assign { _06_[6:3], _00_, _06_[1:0] } = _17_;
  assign celloutsig_1_18z = { celloutsig_1_5z, _03_, celloutsig_1_9z, celloutsig_1_16z } >= { celloutsig_1_2z[4:0], celloutsig_1_13z, celloutsig_1_16z, celloutsig_1_9z };
  assign celloutsig_0_18z = { celloutsig_0_0z[11:10], celloutsig_0_1z } >= { celloutsig_0_14z[9], celloutsig_0_17z, celloutsig_0_13z };
  assign celloutsig_1_0z = ! in_data[185:183];
  assign celloutsig_0_6z = ! celloutsig_0_3z[27:22];
  assign celloutsig_0_26z = ! celloutsig_0_21z[10:1];
  assign celloutsig_1_10z = celloutsig_1_3z ? { celloutsig_1_7z[5:1], celloutsig_1_2z } : in_data[114:101];
  assign celloutsig_0_4z = celloutsig_0_1z ? { celloutsig_0_3z[19:18], 1'h1, celloutsig_0_0z } : in_data[20:5];
  assign celloutsig_0_10z = celloutsig_0_8z[2] ? celloutsig_0_3z[18:1] : { celloutsig_0_5z, celloutsig_0_7z };
  assign celloutsig_0_0z = in_data[51:39] | in_data[55:43];
  assign celloutsig_1_5z = { celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_3z } | { celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_7z = in_data[138:133] | { celloutsig_1_5z[4:2], celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_5z = { celloutsig_0_0z[7:6], celloutsig_0_2z } | in_data[73:66];
  assign celloutsig_0_7z = celloutsig_0_4z[9:0] | { in_data[11:3], celloutsig_0_1z };
  assign celloutsig_0_8z = celloutsig_0_0z[11:9] | celloutsig_0_3z[3:1];
  assign celloutsig_0_11z = { in_data[89:87], celloutsig_0_6z, celloutsig_0_1z } | in_data[78:74];
  assign celloutsig_0_12z = celloutsig_0_3z[17:14] | { in_data[69], celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_1z };
  assign celloutsig_0_19z = { celloutsig_0_4z[8:3], celloutsig_0_6z, _04_ } | { celloutsig_0_10z[11:10], celloutsig_0_18z, celloutsig_0_5z };
  assign celloutsig_0_29z = _05_[10:6] | { _06_[6:3], _00_ };
  assign celloutsig_1_4z = & { celloutsig_1_2z, celloutsig_1_1z, in_data[161:153] };
  assign celloutsig_0_22z = & celloutsig_0_14z[9:3];
  assign celloutsig_1_16z = ~^ in_data[190:172];
  assign celloutsig_0_13z = ~^ { celloutsig_0_10z[10:5], celloutsig_0_11z };
  assign celloutsig_0_17z = ~^ { celloutsig_0_2z[4:0], celloutsig_0_12z, _04_ };
  assign celloutsig_1_2z = { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z } <<< { in_data[165], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_3z = { in_data[25:4], celloutsig_0_2z } <<< { in_data[38:18], celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_1_8z = celloutsig_1_5z[4:2] <<< { celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_13z = celloutsig_1_10z[9:5] <<< { celloutsig_1_2z[8:5], celloutsig_1_1z };
  assign celloutsig_0_14z = { celloutsig_0_7z[2:0], celloutsig_0_5z } <<< { in_data[68:62], celloutsig_0_12z };
  assign celloutsig_0_2z = in_data[69:64] <<< { celloutsig_0_0z[8:4], celloutsig_0_1z };
  assign celloutsig_0_21z = { celloutsig_0_0z[11:3], celloutsig_0_12z } ^ { in_data[41:30], celloutsig_0_17z };
  assign _02_[7] = _01_;
  assign _06_[2] = _00_;
  assign { out_data[128], out_data[96], out_data[36:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_29z, celloutsig_0_30z };
endmodule
