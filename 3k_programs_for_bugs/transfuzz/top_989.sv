/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [4:0] _00_;
  wire celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [4:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [17:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [8:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [31:0] celloutsig_0_21z;
  wire [14:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [19:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [3:0] celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire [7:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [13:0] celloutsig_1_2z;
  wire [21:0] celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire [6:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [6:0] celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = ~((celloutsig_0_0z | celloutsig_0_0z) & celloutsig_0_0z);
  assign celloutsig_0_4z = ~((celloutsig_0_0z | celloutsig_0_0z) & celloutsig_0_1z);
  assign celloutsig_1_10z = in_data[99] ^ in_data[118];
  assign celloutsig_0_8z = celloutsig_0_3z ^ in_data[93];
  assign celloutsig_0_1z = in_data[22] ^ celloutsig_0_0z;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _00_ <= 5'h00;
    else _00_ <= { in_data[41:39], celloutsig_0_23z, celloutsig_0_8z };
  assign celloutsig_1_1z = celloutsig_1_0z > celloutsig_1_0z;
  assign celloutsig_0_6z = in_data[24:9] > { in_data[30:18], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_7z = { in_data[1:0], celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_2z } > { in_data[51:29], celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_0_9z = { in_data[37:36], celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z } > { celloutsig_0_2z[17:12], celloutsig_0_2z, celloutsig_0_8z };
  assign celloutsig_0_11z = { celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_8z } > celloutsig_0_2z[19:13];
  assign celloutsig_0_18z = { celloutsig_0_17z, celloutsig_0_1z, celloutsig_0_15z, celloutsig_0_10z } > { in_data[41:38], celloutsig_0_4z, celloutsig_0_13z };
  assign celloutsig_0_0z = in_data[65:55] && in_data[81:71];
  assign celloutsig_0_42z = { celloutsig_0_10z[2:1], celloutsig_0_16z } && { celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_41z };
  assign celloutsig_1_7z = { celloutsig_1_2z[11:6], celloutsig_1_2z, celloutsig_1_5z } && { in_data[124:123], celloutsig_1_4z };
  assign celloutsig_1_11z = { celloutsig_1_4z[20:4], celloutsig_1_10z, celloutsig_1_7z } && { in_data[187:177], celloutsig_1_8z, celloutsig_1_7z };
  assign celloutsig_0_15z = { celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_6z } && { celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_11z };
  assign celloutsig_0_23z = { celloutsig_0_0z, celloutsig_0_20z, celloutsig_0_3z, celloutsig_0_19z, celloutsig_0_3z } && { in_data[58:49], celloutsig_0_10z };
  assign celloutsig_0_40z = ! celloutsig_0_22z[11:1];
  assign celloutsig_0_5z = ! { in_data[47:38], celloutsig_0_4z };
  assign celloutsig_0_20z = ! { celloutsig_0_2z[19:1], celloutsig_0_5z, celloutsig_0_16z, celloutsig_0_11z };
  assign celloutsig_1_0z = in_data[106:102] % { 1'h1, in_data[130:127] };
  assign celloutsig_1_2z = in_data[119:106] % { 1'h1, in_data[150:145], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_6z = celloutsig_1_4z[7:1] % { 1'h1, celloutsig_1_2z[5:4], celloutsig_1_5z };
  assign celloutsig_1_8z = in_data[162:156] % { 1'h1, in_data[135:130] };
  assign celloutsig_1_15z = { celloutsig_1_2z[7:6], celloutsig_1_14z, celloutsig_1_5z, celloutsig_1_1z } % { 1'h1, celloutsig_1_8z[5:0], in_data[96] };
  assign celloutsig_0_12z = { celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_11z } % { 1'h1, celloutsig_0_10z[1], celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_1z };
  assign celloutsig_0_19z = { celloutsig_0_14z[10:4], celloutsig_0_16z, celloutsig_0_5z } % { 1'h1, celloutsig_0_2z[18:16], celloutsig_0_12z };
  assign celloutsig_0_2z = { in_data[93:75], celloutsig_0_1z } % { 1'h1, in_data[83:65] };
  assign celloutsig_0_22z = { celloutsig_0_21z[28:22], celloutsig_0_0z, celloutsig_0_20z, celloutsig_0_11z, celloutsig_0_12z } % { 1'h1, celloutsig_0_21z[14:2], celloutsig_0_16z };
  assign celloutsig_0_41z = { _00_[4:1], celloutsig_0_9z } !== { celloutsig_0_14z[9:6], celloutsig_0_40z };
  assign celloutsig_1_14z = { celloutsig_1_6z[6:4], celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_12z, celloutsig_1_12z } !== in_data[156:144];
  assign celloutsig_0_21z = { in_data[42:26], celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_18z, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_17z } >>> in_data[35:4];
  assign celloutsig_1_4z = { in_data[103:102], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z } - { in_data[142:122], celloutsig_1_1z };
  assign celloutsig_1_5z = celloutsig_1_2z[10:7] - celloutsig_1_0z[3:0];
  assign celloutsig_1_12z = celloutsig_1_8z[4:1] - celloutsig_1_8z[6:3];
  assign celloutsig_0_10z = { celloutsig_0_2z[3], celloutsig_0_6z, celloutsig_0_0z } - { celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_7z };
  assign celloutsig_0_14z = { in_data[80], celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_7z } - { celloutsig_0_2z[18:2], celloutsig_0_3z };
  assign celloutsig_1_18z = ~((in_data[160] & celloutsig_1_5z[0]) | celloutsig_1_2z[4]);
  assign celloutsig_1_19z = ~((celloutsig_1_15z[7] & in_data[98]) | celloutsig_1_6z[1]);
  assign celloutsig_0_13z = ~((celloutsig_0_9z & celloutsig_0_6z) | celloutsig_0_11z);
  assign celloutsig_0_16z = ~((celloutsig_0_5z & celloutsig_0_4z) | celloutsig_0_7z);
  assign celloutsig_0_17z = ~((celloutsig_0_5z & celloutsig_0_3z) | celloutsig_0_14z[7]);
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_41z, celloutsig_0_42z };
endmodule
