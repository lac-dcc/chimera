/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [5:0] _00_;
  reg [3:0] _01_;
  wire celloutsig_0_0z;
  wire [7:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [12:0] celloutsig_0_15z;
  wire [11:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [5:0] celloutsig_0_18z;
  wire [2:0] celloutsig_0_1z;
  wire [2:0] celloutsig_0_21z;
  wire [5:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [4:0] celloutsig_0_3z;
  wire [11:0] celloutsig_0_4z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [3:0] celloutsig_0_8z;
  wire [6:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [29:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [7:0] celloutsig_1_2z;
  wire [22:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [5:0] celloutsig_1_5z;
  wire [3:0] celloutsig_1_6z;
  wire [14:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_13z = celloutsig_0_3z[0] | ~(celloutsig_0_4z[10]);
  assign celloutsig_0_12z = ~(celloutsig_0_4z[10] ^ celloutsig_0_7z);
  assign celloutsig_0_14z = ~(celloutsig_0_4z[10] ^ celloutsig_0_2z);
  assign celloutsig_1_0z = ~(in_data[102] ^ in_data[162]);
  assign celloutsig_0_21z = { celloutsig_0_15z[12], celloutsig_0_11z, celloutsig_0_17z } + celloutsig_0_18z[2:0];
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _00_ <= 6'h00;
    else _00_ <= { in_data[62:59], celloutsig_0_2z, celloutsig_0_2z };
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _01_ <= 4'h0;
    else _01_ <= celloutsig_0_16z[6:3];
  assign celloutsig_0_3z = in_data[33:29] / { 1'h1, celloutsig_0_1z[2], 2'h3, celloutsig_0_0z };
  assign celloutsig_0_10z = { celloutsig_0_9z, celloutsig_0_6z } / { 1'h1, in_data[55:50], celloutsig_0_2z };
  assign celloutsig_0_15z = { celloutsig_0_13z, celloutsig_0_4z } / { 1'h1, celloutsig_0_3z[3:1], celloutsig_0_11z, celloutsig_0_10z };
  assign celloutsig_1_18z = { in_data[135:133], celloutsig_1_9z, celloutsig_1_4z, celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_12z } == { celloutsig_1_2z[5:2], celloutsig_1_6z };
  assign celloutsig_0_23z = _00_ == celloutsig_0_15z[12:7];
  assign celloutsig_0_7z = { _00_[5:2], celloutsig_0_3z, celloutsig_0_4z, _00_ } > { celloutsig_0_3z[3], celloutsig_0_2z, celloutsig_0_1z[2], 2'h3, celloutsig_0_2z, celloutsig_0_0z, _00_, celloutsig_0_6z, celloutsig_0_1z[2], 2'h3, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z[2], 2'h3 };
  assign celloutsig_0_17z = in_data[84:63] && { celloutsig_0_9z[5:0], celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_9z };
  assign celloutsig_1_12z = ! celloutsig_1_10z[18:9];
  assign celloutsig_1_17z = ! { celloutsig_1_7z[9:3], celloutsig_1_9z };
  assign celloutsig_1_4z = { celloutsig_1_3z[21:18], celloutsig_1_1z, celloutsig_1_0z } || in_data[124:119];
  assign celloutsig_1_11z = { in_data[100], celloutsig_1_5z } || celloutsig_1_3z[18:12];
  assign celloutsig_0_29z = 1'h1 || { celloutsig_0_16z[8:0], celloutsig_0_12z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_22z, celloutsig_0_28z };
  assign celloutsig_1_9z = in_data[180:173] < { celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_1_14z = celloutsig_1_2z[6:4] < { celloutsig_1_5z[4:3], celloutsig_1_0z };
  assign celloutsig_0_30z = { celloutsig_0_17z, celloutsig_0_14z, _01_ } < { celloutsig_0_18z[4:1], celloutsig_0_28z, celloutsig_0_0z };
  assign celloutsig_1_2z = { in_data[168:166], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z } % { 1'h1, in_data[150:144] };
  assign celloutsig_0_16z = { in_data[30:28], celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_8z } % { 1'h1, celloutsig_0_3z[0], celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_6z };
  assign celloutsig_0_18z = - in_data[12:7];
  assign celloutsig_0_6z = { _00_[2], celloutsig_0_2z } !== { in_data[35], celloutsig_0_0z };
  assign celloutsig_0_11z = celloutsig_0_4z[5:1] !== in_data[34:30];
  assign celloutsig_0_28z = { celloutsig_0_1z[2], 1'h1, celloutsig_0_16z } !== { celloutsig_0_23z, celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_12z, celloutsig_0_18z, celloutsig_0_12z, celloutsig_0_1z[2], 2'h3 };
  assign celloutsig_1_3z = { in_data[170:159], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z } | { celloutsig_1_2z[6:0], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_5z = { celloutsig_1_2z[3], celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_4z } | in_data[117:112];
  assign celloutsig_1_6z = celloutsig_1_5z[3:0] | celloutsig_1_2z[4:1];
  assign celloutsig_1_7z = { celloutsig_1_3z[12:6], celloutsig_1_2z } | celloutsig_1_3z[16:2];
  assign celloutsig_0_9z = in_data[17:11] | { in_data[74:72], celloutsig_0_8z };
  assign celloutsig_0_0z = | in_data[15:7];
  assign celloutsig_1_8z = | celloutsig_1_3z[18:2];
  assign celloutsig_1_1z = ^ in_data[115:110];
  assign celloutsig_1_19z = ^ { celloutsig_1_6z[2], celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_14z, celloutsig_1_6z, celloutsig_1_17z, celloutsig_1_14z, celloutsig_1_14z };
  assign celloutsig_0_4z = { celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z } << in_data[26:15];
  assign celloutsig_0_8z = { 1'h1, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z } << { in_data[75:73], celloutsig_0_7z };
  assign celloutsig_1_10z = { in_data[160:155], celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_9z, celloutsig_1_4z, celloutsig_1_5z } ~^ { celloutsig_1_2z[2:1], celloutsig_1_0z, celloutsig_1_9z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_9z };
  assign celloutsig_0_22z = { _00_[2:1], celloutsig_0_21z, celloutsig_0_17z } ~^ { celloutsig_0_4z[4:2], celloutsig_0_0z, celloutsig_0_12z, celloutsig_0_7z };
  assign celloutsig_0_2z = ~((1'h1 & celloutsig_0_0z) | in_data[10]);
  assign celloutsig_0_1z[2] = celloutsig_0_0z ~^ in_data[83];
  assign celloutsig_0_1z[1:0] = 2'h3;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_29z, celloutsig_0_30z };
endmodule
