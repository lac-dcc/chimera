/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [10:0] _00_;
  wire celloutsig_0_0z;
  wire [15:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [4:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  reg [26:0] celloutsig_0_1z;
  wire [11:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [34:0] celloutsig_0_23z;
  wire [3:0] celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [4:0] celloutsig_0_34z;
  wire [5:0] celloutsig_0_3z;
  wire [19:0] celloutsig_0_40z;
  wire [7:0] celloutsig_0_45z;
  wire [5:0] celloutsig_0_4z;
  wire celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  wire [6:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [19:0] celloutsig_1_14z;
  wire [2:0] celloutsig_1_15z;
  wire [6:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [10:0] celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire [4:0] celloutsig_1_5z;
  wire [15:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_21z = celloutsig_0_15z[0] ? celloutsig_0_11z : in_data[95];
  assign celloutsig_0_5z = ~celloutsig_0_0z;
  assign celloutsig_0_17z = ~celloutsig_0_15z[0];
  assign celloutsig_0_2z = ~in_data[77];
  assign celloutsig_1_19z = ~((celloutsig_1_14z[12] | celloutsig_1_15z[0]) & (celloutsig_1_5z[1] | celloutsig_1_15z[1]));
  assign celloutsig_0_7z = celloutsig_0_5z ^ celloutsig_0_1z[15];
  assign celloutsig_0_55z = ~(celloutsig_0_45z[1] ^ celloutsig_0_14z);
  assign celloutsig_0_14z = ~(celloutsig_0_12z ^ celloutsig_0_10z[4]);
  assign celloutsig_0_16z = ~(celloutsig_0_10z[5] ^ celloutsig_0_11z);
  assign celloutsig_1_14z = { celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_8z } + { celloutsig_1_5z[3:1], celloutsig_1_8z, celloutsig_1_6z };
  always_ff @(negedge clkin_data[32], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _00_ <= 11'h000;
    else _00_ <= celloutsig_0_1z[26:16];
  assign celloutsig_0_9z = { in_data[52:49], celloutsig_0_6z, celloutsig_0_0z } == { _00_[3:1], celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_5z };
  assign celloutsig_0_6z = in_data[6:0] <= { in_data[19:16], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_18z = celloutsig_1_17z[6:2] <= celloutsig_1_12z[4:0];
  assign celloutsig_0_11z = { celloutsig_0_10z[4], 2'h3, celloutsig_0_7z } <= { celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_9z };
  assign celloutsig_1_9z = celloutsig_1_4z || { celloutsig_1_4z[1], celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_7z };
  assign celloutsig_0_12z = 1'h1 || { celloutsig_0_10z[5:4], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_10z[1] };
  assign celloutsig_0_30z = { celloutsig_0_4z[1:0], celloutsig_0_18z, celloutsig_0_24z, celloutsig_0_18z } || { celloutsig_0_23z[13:7], celloutsig_0_16z };
  assign celloutsig_0_0z = in_data[8] & ~(in_data[42]);
  assign celloutsig_1_17z = { celloutsig_1_15z, celloutsig_1_3z, celloutsig_1_9z } % { 1'h1, celloutsig_1_6z[9:5], celloutsig_1_13z };
  assign celloutsig_0_40z = { celloutsig_0_23z[19:4], 1'h1, celloutsig_0_23z[2:0] } % { 1'h1, celloutsig_0_4z[4:0], _00_, celloutsig_0_30z, celloutsig_0_17z, celloutsig_0_21z };
  assign celloutsig_1_15z = celloutsig_1_5z[3:1] % { 1'h1, celloutsig_1_14z[17:16] };
  assign celloutsig_0_45z = celloutsig_0_20z[6] ? celloutsig_0_40z[18:11] : { celloutsig_0_34z[3:2], celloutsig_0_12z, celloutsig_0_26z, celloutsig_0_24z };
  assign celloutsig_1_12z = celloutsig_1_8z ? { celloutsig_1_2z[8:3], celloutsig_1_1z } : celloutsig_1_6z[13:7];
  assign celloutsig_0_20z = celloutsig_0_15z[3] ? { celloutsig_0_3z[5:4], celloutsig_0_10z[5:4], 2'h3, celloutsig_0_4z } : { celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_13z };
  assign celloutsig_0_56z = | { celloutsig_0_1z[24:10], celloutsig_0_18z };
  assign celloutsig_1_0z = in_data[160] & in_data[186];
  assign celloutsig_0_26z = ~^ { celloutsig_0_1z[26:12], celloutsig_0_15z, celloutsig_0_12z, celloutsig_0_14z };
  assign celloutsig_1_1z = ^ in_data[109:100];
  assign celloutsig_1_8z = ^ { celloutsig_1_2z[6:3], celloutsig_1_3z };
  assign celloutsig_1_10z = in_data[146:144] >> celloutsig_1_4z[3:1];
  assign celloutsig_0_24z = celloutsig_0_1z[24:21] >> { celloutsig_0_20z[11:9], celloutsig_0_14z };
  assign celloutsig_0_4z = { celloutsig_0_3z[5:4], celloutsig_0_10z[5:4], 2'h3 } <<< in_data[32:27];
  assign celloutsig_0_13z = { celloutsig_0_10z[5:4], 1'h1 } <<< { celloutsig_0_3z[4], celloutsig_0_10z[5], celloutsig_0_7z };
  assign celloutsig_0_15z = { in_data[73:71], celloutsig_0_12z, celloutsig_0_14z } <<< _00_[4:0];
  assign celloutsig_1_4z = celloutsig_1_2z[10:6] - { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_3z };
  assign celloutsig_1_5z = in_data[177:173] ~^ { in_data[154:153], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_6z = in_data[115:100] ~^ { celloutsig_1_4z[1:0], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_34z = { celloutsig_0_24z[3:1], celloutsig_0_21z, celloutsig_0_21z } ^ { in_data[51], celloutsig_0_13z, celloutsig_0_14z };
  assign celloutsig_1_2z = in_data[109:99] ^ in_data[131:121];
  assign celloutsig_1_3z = in_data[123:121] ^ celloutsig_1_2z[2:0];
  always_latch
    if (celloutsig_1_19z) celloutsig_0_1z = 27'h0000000;
    else if (!clkin_data[0]) celloutsig_0_1z = { in_data[51:27], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_7z = ~((celloutsig_1_4z[4] & celloutsig_1_5z[1]) | (celloutsig_1_2z[3] & celloutsig_1_2z[0]));
  assign celloutsig_1_13z = ~((celloutsig_1_10z[1] & celloutsig_1_9z) | (celloutsig_1_1z & celloutsig_1_10z[0]));
  assign celloutsig_0_18z = ~((celloutsig_0_7z & _00_[4]) | (celloutsig_0_16z & celloutsig_0_0z));
  assign celloutsig_0_22z = ~((celloutsig_0_6z & celloutsig_0_14z) | (celloutsig_0_17z & in_data[95]));
  assign { celloutsig_0_10z[4], celloutsig_0_3z[5:4], celloutsig_0_10z[5] } = { celloutsig_0_2z, in_data[83:81] } ~^ { celloutsig_0_1z[1], celloutsig_0_1z[4:2] };
  assign { celloutsig_0_10z[6], celloutsig_0_10z[9:7], celloutsig_0_10z[0], celloutsig_0_10z[1], celloutsig_0_10z[15:12] } = { celloutsig_0_10z[4], celloutsig_0_3z[5:4], celloutsig_0_10z[5], celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_1z[20:17] } ~^ { celloutsig_0_3z[4], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_3z[5], celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_3z[5:4], celloutsig_0_10z[5:4] };
  assign { celloutsig_0_23z[7], celloutsig_0_23z[26], celloutsig_0_23z[10], celloutsig_0_23z[29], celloutsig_0_23z[9], celloutsig_0_23z[28], celloutsig_0_23z[8], celloutsig_0_23z[27], celloutsig_0_23z[1], celloutsig_0_23z[2], celloutsig_0_23z[21], celloutsig_0_23z[16:15], celloutsig_0_23z[34], celloutsig_0_23z[14], celloutsig_0_23z[33], celloutsig_0_23z[13], celloutsig_0_23z[32], celloutsig_0_23z[5], celloutsig_0_23z[24], celloutsig_0_23z[6], celloutsig_0_23z[25], celloutsig_0_23z[17], celloutsig_0_23z[0], celloutsig_0_23z[19], celloutsig_0_23z[4], celloutsig_0_23z[23], celloutsig_0_23z[18], celloutsig_0_23z[22], celloutsig_0_23z[20], celloutsig_0_23z[12], celloutsig_0_23z[31], celloutsig_0_23z[11], celloutsig_0_23z[30] } = { celloutsig_0_10z[6], celloutsig_0_10z[6], celloutsig_0_10z[9], celloutsig_0_10z[9:8], celloutsig_0_10z[8:7], celloutsig_0_10z[7], celloutsig_0_10z[0], celloutsig_0_10z[1], celloutsig_0_10z[1], celloutsig_0_10z[15:14], celloutsig_0_10z[14:13], celloutsig_0_10z[13:12], celloutsig_0_10z[12], celloutsig_0_10z[4], celloutsig_0_10z[4], celloutsig_0_10z[5], celloutsig_0_10z[5], celloutsig_0_22z, celloutsig_0_21z, celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_1z[16], celloutsig_0_1z[16:15], celloutsig_0_1z[15] } ~^ { celloutsig_0_20z[2], celloutsig_0_1z[16], celloutsig_0_20z[5], celloutsig_0_1z[19], celloutsig_0_20z[4], celloutsig_0_1z[18], celloutsig_0_20z[3], celloutsig_0_1z[17], celloutsig_0_6z, celloutsig_0_17z, celloutsig_0_1z[11], celloutsig_0_20z[11:10], celloutsig_0_1z[24], celloutsig_0_20z[9], celloutsig_0_1z[23], celloutsig_0_20z[8], celloutsig_0_1z[22], celloutsig_0_20z[0], celloutsig_0_1z[14], celloutsig_0_20z[1], celloutsig_0_1z[15], celloutsig_0_18z, celloutsig_0_2z, celloutsig_0_1z[9], celloutsig_0_7z, celloutsig_0_1z[13], celloutsig_0_1z[8], celloutsig_0_1z[12], celloutsig_0_1z[10], celloutsig_0_20z[7], celloutsig_0_1z[21], celloutsig_0_20z[6], celloutsig_0_1z[20] };
  assign { celloutsig_0_10z[11:10], celloutsig_0_10z[3:2] } = { celloutsig_0_1z[16:15], celloutsig_0_6z, celloutsig_0_5z };
  assign celloutsig_0_23z[3] = 1'h1;
  assign celloutsig_0_3z[3:0] = { celloutsig_0_10z[5:4], 2'h3 };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_55z, celloutsig_0_56z };
endmodule
