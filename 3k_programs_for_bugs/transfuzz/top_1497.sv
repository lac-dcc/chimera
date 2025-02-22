/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [4:0] _00_;
  wire [10:0] celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [8:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [13:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [9:0] celloutsig_0_20z;
  wire [2:0] celloutsig_0_21z;
  wire [29:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [4:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [15:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [11:0] celloutsig_0_31z;
  wire [22:0] celloutsig_0_32z;
  wire celloutsig_0_36z;
  wire [10:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [3:0] celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  reg [4:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [22:0] celloutsig_0_8z;
  wire [6:0] celloutsig_0_9z;
  wire [3:0] celloutsig_1_0z;
  wire celloutsig_1_12z;
  wire [3:0] celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [2:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_3z = celloutsig_1_1z ? celloutsig_1_0z[1] : in_data[184];
  assign celloutsig_0_30z = ~(celloutsig_0_26z | celloutsig_0_6z);
  assign celloutsig_1_19z = ~celloutsig_1_6z[0];
  assign celloutsig_0_27z = ~celloutsig_0_26z;
  assign celloutsig_0_4z = ~((in_data[53] | in_data[39]) & celloutsig_0_2z);
  assign celloutsig_0_1z = ~((in_data[31] | celloutsig_0_0z[4]) & in_data[75]);
  assign celloutsig_0_15z = ~((celloutsig_0_6z | celloutsig_0_9z[1]) & (celloutsig_0_6z | celloutsig_0_13z));
  always_ff @(negedge celloutsig_1_6z[0], negedge clkin_data[32])
    if (!clkin_data[32]) _00_ <= 5'h00;
    else _00_ <= celloutsig_0_5z;
  assign celloutsig_0_31z = { celloutsig_0_18z[8:4], celloutsig_0_24z, celloutsig_0_14z, celloutsig_0_14z, celloutsig_0_23z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_23z } & { celloutsig_0_22z[23:13], celloutsig_0_13z };
  assign celloutsig_0_22z = { celloutsig_0_0z[8:0], _00_, celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_1z, celloutsig_0_19z, celloutsig_0_6z, _00_, celloutsig_0_12z } & { celloutsig_0_8z[15:9], celloutsig_0_8z[9], celloutsig_0_8z[7:2], celloutsig_0_8z[9], celloutsig_0_8z[22], celloutsig_0_18z };
  assign celloutsig_0_11z = { celloutsig_0_8z[17], celloutsig_0_2z, celloutsig_0_4z } >= celloutsig_0_8z[16:14];
  assign celloutsig_1_1z = { celloutsig_1_0z[2:1], celloutsig_1_0z } > { in_data[107:106], celloutsig_1_0z };
  assign celloutsig_0_6z = { celloutsig_0_0z, celloutsig_0_2z } <= in_data[75:64];
  assign celloutsig_0_14z = _00_ && _00_;
  assign celloutsig_0_24z = { celloutsig_0_22z[26:14], celloutsig_0_4z, celloutsig_0_19z } || { celloutsig_0_18z[13:11], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_16z, celloutsig_0_12z };
  assign celloutsig_1_2z = { in_data[132:130], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z } % { 1'h1, in_data[149:142] };
  assign celloutsig_1_6z = { in_data[140:139], celloutsig_1_1z } % { 1'h1, celloutsig_1_2z[4], celloutsig_1_3z };
  assign celloutsig_1_14z = in_data[190:187] % { 1'h1, celloutsig_1_2z[6:5], celloutsig_1_8z };
  assign celloutsig_0_25z = celloutsig_0_18z[6:2] % { 1'h1, celloutsig_0_5z[3:0] };
  assign celloutsig_1_4z = { in_data[102], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z } % { 1'h1, celloutsig_1_2z[3:0] };
  assign celloutsig_0_20z = { in_data[60:59], celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_19z, celloutsig_0_5z } % { 1'h1, in_data[68:62], celloutsig_0_3z, celloutsig_0_6z };
  assign celloutsig_0_39z = celloutsig_0_9z[4] ? { celloutsig_0_29z[10:2], celloutsig_0_4z, celloutsig_0_7z } : { celloutsig_0_20z[7:4], celloutsig_0_13z, celloutsig_0_30z, celloutsig_0_21z, celloutsig_0_23z, celloutsig_0_23z };
  assign celloutsig_0_48z = { celloutsig_0_20z[5], celloutsig_0_36z, celloutsig_0_47z, celloutsig_0_1z, celloutsig_0_23z } != celloutsig_0_32z[9:2];
  assign celloutsig_1_8z = in_data[98:96] != celloutsig_1_6z;
  assign celloutsig_0_21z = { celloutsig_0_16z[5], celloutsig_0_13z, celloutsig_0_17z } | celloutsig_0_0z[9:7];
  assign celloutsig_1_12z = | { celloutsig_1_5z, celloutsig_1_1z, in_data[167:164] };
  assign celloutsig_0_17z = | celloutsig_0_9z[5:1];
  assign celloutsig_0_19z = | { celloutsig_0_18z[3:0], celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_6z };
  assign celloutsig_0_2z = | celloutsig_0_0z[8:4];
  assign celloutsig_0_26z = | { celloutsig_0_11z, _00_ };
  assign celloutsig_1_18z = ~^ { celloutsig_1_0z[3:1], celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_14z, celloutsig_1_12z, celloutsig_1_1z };
  assign celloutsig_0_13z = ~^ { celloutsig_0_5z, _00_, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_6z };
  assign celloutsig_0_36z = ^ { celloutsig_0_25z[3:0], celloutsig_0_26z, celloutsig_0_27z, celloutsig_0_14z, celloutsig_0_24z, _00_ };
  assign celloutsig_1_7z = ^ { celloutsig_1_0z[2:1], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_0_18z = in_data[72:59] >> { in_data[83:73], celloutsig_0_12z, celloutsig_0_15z, celloutsig_0_14z };
  assign celloutsig_0_9z = { celloutsig_0_8z[19:14], celloutsig_0_1z } << { celloutsig_0_0z[6:2], celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_0_29z = { celloutsig_0_20z[9:2], celloutsig_0_4z, celloutsig_0_13z, _00_, celloutsig_0_2z } << celloutsig_0_22z[20:5];
  assign celloutsig_0_0z = in_data[67:57] >> in_data[90:80];
  assign celloutsig_0_16z = { _00_[3], celloutsig_0_9z, celloutsig_0_15z } >> { celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_7z };
  assign celloutsig_0_32z = { celloutsig_0_20z[9:4], celloutsig_0_31z, celloutsig_0_25z } - celloutsig_0_22z[28:6];
  assign celloutsig_0_47z = { celloutsig_0_39z[8:7], celloutsig_0_1z, celloutsig_0_7z } ^ _00_[3:0];
  assign celloutsig_1_0z = in_data[156:153] ^ in_data[162:159];
  assign celloutsig_1_5z = ~((in_data[117] & celloutsig_1_0z[0]) | celloutsig_1_1z);
  always_latch
    if (!clkin_data[32]) celloutsig_0_5z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_5z = { in_data[38:35], celloutsig_0_1z };
  assign celloutsig_0_3z = ~((celloutsig_0_0z[2] & in_data[91]) | (celloutsig_0_1z & celloutsig_0_0z[10]));
  assign celloutsig_0_7z = ~((celloutsig_0_0z[1] & celloutsig_0_2z) | (celloutsig_0_5z[2] & celloutsig_0_4z));
  assign celloutsig_0_12z = ~((celloutsig_0_5z[2] & celloutsig_0_4z) | (celloutsig_0_6z & celloutsig_0_9z[4]));
  assign celloutsig_0_23z = ~((celloutsig_0_6z & celloutsig_0_13z) | (celloutsig_0_5z[2] & celloutsig_0_3z));
  assign { celloutsig_0_8z[6:2], celloutsig_0_8z[9], celloutsig_0_8z[10], celloutsig_0_8z[22], celloutsig_0_8z[7], celloutsig_0_8z[21:11] } = ~ { celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z };
  assign { celloutsig_0_8z[8], celloutsig_0_8z[1:0] } = { celloutsig_0_8z[9], celloutsig_0_8z[9], celloutsig_0_8z[22] };
  assign { out_data[128], out_data[96], out_data[35:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_47z, celloutsig_0_48z };
endmodule
