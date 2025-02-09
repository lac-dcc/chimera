/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [7:0] _00_;
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire [10:0] celloutsig_0_4z;
  wire [5:0] celloutsig_0_5z;
  wire [3:0] celloutsig_0_6z;
  wire [2:0] celloutsig_0_7z;
  wire [10:0] celloutsig_0_9z;
  wire [17:0] celloutsig_1_0z;
  wire [5:0] celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire [9:0] celloutsig_1_17z;
  wire [7:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_3z;
  wire [29:0] celloutsig_1_4z;
  wire [11:0] celloutsig_1_5z;
  wire [52:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [15:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_2z = ~(in_data[52] & celloutsig_0_0z[3]);
  assign celloutsig_0_1z = !(celloutsig_0_0z[2] ? in_data[18] : in_data[24]);
  assign celloutsig_1_7z = celloutsig_1_0z[14] | celloutsig_1_6z[12];
  reg [6:0] _04_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _04_ <= 7'h00;
    else _04_ <= { celloutsig_0_4z[6:1], celloutsig_0_3z };
  assign out_data[38:32] = _04_;
  always_ff @(posedge clkin_data[32], negedge clkin_data[64])
    if (!clkin_data[64]) _00_ <= 8'h00;
    else _00_ <= in_data[138:131];
  assign celloutsig_1_19z = celloutsig_1_4z[19:15] === celloutsig_1_9z[10:6];
  assign celloutsig_0_3z = celloutsig_0_0z === in_data[42:39];
  assign celloutsig_0_11z = { in_data[49], out_data[38:32], celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z } === { celloutsig_0_9z[7], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_1z };
  assign celloutsig_1_3z = in_data[179:147] === in_data[150:118];
  assign celloutsig_1_1z = celloutsig_1_0z[17:8] >= celloutsig_1_0z[11:2];
  assign celloutsig_0_0z = in_data[14:11] % { 1'h1, in_data[27:25] };
  assign celloutsig_1_5z = { celloutsig_1_0z[13:3], celloutsig_1_3z } % { 1'h1, celloutsig_1_0z[13:3] };
  assign celloutsig_1_6z = celloutsig_1_4z[11] ? { celloutsig_1_0z[14:6], celloutsig_1_4z[29:12], 1'h1, celloutsig_1_4z[10:0], celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_1z } : { celloutsig_1_4z[18:14], celloutsig_1_0z, celloutsig_1_4z[29:12], 1'h0, celloutsig_1_4z[10:0] };
  assign celloutsig_0_5z = { in_data[74:70], celloutsig_0_3z } | in_data[83:78];
  assign celloutsig_0_9z = { celloutsig_0_6z[2:1], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z } | { in_data[95:87], celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_1_4z = { celloutsig_1_0z[15:7], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_1z } | { celloutsig_1_0z[14:1], _00_, _00_ };
  assign celloutsig_1_17z = celloutsig_1_6z[36:27] | celloutsig_1_4z[9:0];
  assign celloutsig_1_18z = { celloutsig_1_17z[8:3], celloutsig_1_3z, celloutsig_1_13z } << celloutsig_1_6z[19:12];
  assign celloutsig_0_4z = { in_data[84:81], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_3z } << { in_data[12:5], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_1_9z = { celloutsig_1_0z[10], celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_5z } << { celloutsig_1_6z[50], celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_0_7z = celloutsig_0_0z[2:0] ~^ in_data[27:25];
  assign celloutsig_1_0z = in_data[150:133] ~^ in_data[191:174];
  assign celloutsig_1_11z = { celloutsig_1_4z[22:18], celloutsig_1_3z } ^ celloutsig_1_9z[8:3];
  assign celloutsig_1_13z = ~((celloutsig_1_9z[7] & celloutsig_1_11z[5]) | (celloutsig_1_5z[2] & celloutsig_1_3z));
  assign { celloutsig_0_6z[1], celloutsig_0_6z[3:2] } = ~ { celloutsig_0_2z, celloutsig_0_0z[1:0] };
  assign celloutsig_0_6z[0] = celloutsig_0_6z[1];
  assign { out_data[135:128], out_data[96], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_11z };
endmodule
