/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [4:0] _01_;
  reg [4:0] _02_;
  wire [5:0] _03_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [6:0] celloutsig_0_1z;
  wire [22:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [6:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [4:0] celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_36z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [14:0] celloutsig_0_3z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [4:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [5:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_4z;
  wire celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_31z = ~(celloutsig_0_27z & celloutsig_0_0z);
  assign celloutsig_1_12z = !(celloutsig_1_7z ? celloutsig_1_8z[2] : celloutsig_1_10z);
  assign celloutsig_1_15z = !(celloutsig_1_8z[1] ? celloutsig_1_7z : celloutsig_1_9z);
  assign celloutsig_0_17z = !(celloutsig_0_7z ? 1'h0 : celloutsig_0_1z[4]);
  assign celloutsig_0_26z = !(celloutsig_0_3z[12] ? 1'h0 : celloutsig_0_6z);
  assign celloutsig_0_38z = ~((celloutsig_0_22z[1] | celloutsig_0_31z) & celloutsig_0_36z);
  assign celloutsig_0_39z = ~((1'h1 | celloutsig_0_11z) & 1'h0);
  assign celloutsig_0_8z = celloutsig_0_0z | ~(_00_);
  assign celloutsig_0_21z = celloutsig_0_7z ^ in_data[29];
  assign celloutsig_1_14z = ~(celloutsig_1_0z ^ celloutsig_1_1z);
  reg [5:0] _14_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[64])
    if (!clkin_data[64]) _14_ <= 6'h00;
    else _14_ <= celloutsig_0_3z[8:3];
  assign { _03_[5], _00_, _03_[3:0] } = _14_;
  always_ff @(posedge clkin_data[32], posedge clkin_data[96])
    if (clkin_data[96]) _01_ <= 5'h00;
    else _01_ <= { celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_1z };
  always_ff @(posedge clkin_data[0], negedge clkin_data[128])
    if (!clkin_data[128]) _02_ <= 5'h00;
    else _02_ <= { in_data[141], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_1_11z = { in_data[164:163], celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_10z, celloutsig_1_0z, celloutsig_1_4z, _02_, _01_, celloutsig_1_4z, celloutsig_1_4z } == { in_data[106:97], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_10z, _02_, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_10z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_10z };
  assign celloutsig_1_7z = { _02_[2], _02_, celloutsig_1_4z } > { _01_[3], celloutsig_1_0z, _01_ };
  assign celloutsig_0_16z = { celloutsig_0_3z[5:1], 1'h0, celloutsig_0_1z[4] } > { celloutsig_0_1z[4:1], celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_18z = { in_data[34:32], celloutsig_0_1z, 2'h0, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_1z } > { celloutsig_0_6z, 1'h0, celloutsig_0_7z, celloutsig_0_1z[4], _03_[5], _00_, _03_[3:0], _03_[5], _00_, _03_[3:0], celloutsig_0_1z };
  assign celloutsig_0_23z = { celloutsig_0_3z[14:10], celloutsig_0_0z, celloutsig_0_2z } > in_data[26:20];
  assign celloutsig_0_24z = { 5'h1f, celloutsig_0_10z, celloutsig_0_18z, celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_18z } > { _03_[5], _00_, _03_[3:0], celloutsig_0_17z, celloutsig_0_1z[4], celloutsig_0_21z, celloutsig_0_23z };
  assign celloutsig_1_13z = { celloutsig_1_8z[2:1], celloutsig_1_11z } <= { celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_0_6z = 10'h3ff <= { celloutsig_0_1z[4:3], _03_[5], _00_, _03_[3:0], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_11z = { in_data[73:60], celloutsig_0_8z } <= { in_data[26:16], celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_7z };
  assign celloutsig_0_19z = { celloutsig_0_3z[12:3], 1'h0, celloutsig_0_6z } <= { 1'h0, _03_[5], _00_, _03_[3:0], celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_2z, 1'h0, celloutsig_0_9z };
  assign celloutsig_0_0z = ! in_data[50:48];
  assign celloutsig_1_1z = ! in_data[115:105];
  assign celloutsig_1_4z = in_data[145:141] || { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_9z = { _02_[3], celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_4z } || in_data[126:123];
  assign celloutsig_1_10z = { in_data[190:181], celloutsig_1_0z } || in_data[182:172];
  assign celloutsig_0_2z = in_data[12:10] || celloutsig_0_1z[2:0];
  assign celloutsig_0_27z = in_data[74:56] || { celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_24z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_15z, celloutsig_0_19z, celloutsig_0_1z, celloutsig_0_24z, celloutsig_0_19z, celloutsig_0_18z };
  assign celloutsig_0_36z = { celloutsig_0_27z, celloutsig_0_18z, celloutsig_0_2z } < { celloutsig_0_28z[1:0], celloutsig_0_21z };
  assign celloutsig_1_0z = in_data[119:106] < in_data[149:136];
  assign celloutsig_1_18z = { in_data[103:98], celloutsig_1_0z } < { celloutsig_1_8z[3], celloutsig_1_14z, celloutsig_1_12z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_10z = celloutsig_0_2z & ~(in_data[60]);
  assign celloutsig_0_15z = 1'h0 & ~(celloutsig_0_1z[0]);
  assign celloutsig_1_17z = _02_[4:2] != celloutsig_1_16z[3:1];
  assign celloutsig_0_28z = { celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_18z, celloutsig_0_2z, celloutsig_0_24z } | { celloutsig_0_20z[12], celloutsig_0_10z, celloutsig_0_18z, celloutsig_0_24z, celloutsig_0_26z };
  assign celloutsig_0_3z = { celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z } | in_data[53:39];
  assign celloutsig_0_9z = in_data[8] & celloutsig_0_0z;
  assign celloutsig_1_8z = { in_data[168:166], celloutsig_1_1z } >>> { in_data[130:129], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_19z = { _02_[4], celloutsig_1_15z, celloutsig_1_0z, celloutsig_1_17z, celloutsig_1_7z, celloutsig_1_11z } - { celloutsig_1_17z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_0_1z = in_data[21:15] ^ in_data[39:33];
  assign celloutsig_0_7z = ~((in_data[82] & in_data[63]) | celloutsig_0_2z);
  assign { celloutsig_1_16z[1], celloutsig_1_16z[4:2] } = { celloutsig_1_13z, in_data[179:177] } ~^ { celloutsig_1_11z, in_data[131], celloutsig_1_12z, celloutsig_1_11z };
  assign { celloutsig_0_20z[15], celloutsig_0_20z[16], celloutsig_0_20z[22], celloutsig_0_20z[12], celloutsig_0_20z[21], celloutsig_0_20z[11], celloutsig_0_20z[20], celloutsig_0_20z[10], celloutsig_0_20z[19], celloutsig_0_20z[9], celloutsig_0_20z[18], celloutsig_0_20z[8], celloutsig_0_20z[17], celloutsig_0_20z[7:2], celloutsig_0_20z[0] } = { celloutsig_0_9z, celloutsig_0_6z, _03_[5], _03_[5], _00_, _00_, _03_[3], _03_[3:2], _03_[2:1], _03_[1:0], _03_[0], celloutsig_0_1z[6:2], celloutsig_0_1z[0] } | { in_data[70], in_data[71], in_data[77], in_data[67], in_data[76], in_data[66], in_data[75], in_data[65], in_data[74], in_data[64], in_data[73], in_data[63], in_data[72], in_data[62:57], celloutsig_0_19z };
  assign { celloutsig_0_22z[2:1], celloutsig_0_22z[6], celloutsig_0_22z[4:3] } = { celloutsig_0_18z, celloutsig_0_2z, celloutsig_0_1z[4], celloutsig_0_1z[2:1] } ^ { celloutsig_0_7z, celloutsig_0_16z, _03_[3], celloutsig_0_11z, celloutsig_0_10z };
  assign _03_[4] = _00_;
  assign { celloutsig_0_20z[14:13], celloutsig_0_20z[1] } = { in_data[69:68], celloutsig_0_1z[1] };
  assign { celloutsig_0_22z[5], celloutsig_0_22z[0] } = { celloutsig_0_1z[3], celloutsig_0_17z };
  assign celloutsig_1_16z[0] = 1'h1;
  assign { out_data[128], out_data[101:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_38z, celloutsig_0_39z };
endmodule
