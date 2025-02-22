/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [16:0] _01_;
  reg [8:0] _02_;
  wire celloutsig_0_0z;
  wire [13:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [11:0] celloutsig_0_12z;
  wire [7:0] celloutsig_0_13z;
  wire [10:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [13:0] celloutsig_0_18z;
  wire [12:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [13:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [9:0] celloutsig_0_22z;
  wire celloutsig_0_26z;
  wire [4:0] celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [5:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_40z;
  wire [18:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [3:0] celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [13:0] celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [17:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [10:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [20:0] celloutsig_1_5z;
  wire [8:0] celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_5z = ~(celloutsig_0_1z & celloutsig_0_1z);
  assign celloutsig_0_33z = ~celloutsig_0_22z[6];
  assign celloutsig_1_9z = ~celloutsig_1_4z;
  assign celloutsig_1_11z = ~in_data[145];
  assign celloutsig_0_31z = ~((celloutsig_0_21z | celloutsig_0_16z) & celloutsig_0_6z);
  assign celloutsig_0_39z = ~((celloutsig_0_14z[6] | celloutsig_0_20z[9]) & celloutsig_0_18z[6]);
  assign celloutsig_0_9z = ~((celloutsig_0_6z | celloutsig_0_5z) & celloutsig_0_7z[1]);
  assign celloutsig_0_21z = ~((celloutsig_0_5z | celloutsig_0_4z[12]) & celloutsig_0_5z);
  assign celloutsig_0_15z = _00_ ^ celloutsig_0_2z[4];
  assign celloutsig_0_2z = { in_data[90:87], celloutsig_0_1z } + { in_data[73:70], celloutsig_0_1z };
  always_ff @(posedge clkin_data[32], posedge clkin_data[64])
    if (clkin_data[64]) _02_ <= 9'h000;
    else _02_ <= celloutsig_1_6z;
  reg [16:0] _14_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _14_ <= 17'h00000;
    else _14_ <= in_data[22:6];
  assign { _01_[16:4], _00_, _01_[2:0] } = _14_;
  assign celloutsig_1_2z = { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z } / { 1'h1, in_data[153:144] };
  assign celloutsig_1_18z = { celloutsig_1_6z[8:7], celloutsig_1_6z, celloutsig_1_15z, celloutsig_1_1z, celloutsig_1_0z } / { 1'h1, celloutsig_1_5z[19:3] };
  assign celloutsig_0_19z = celloutsig_0_18z[12:0] / { 1'h1, celloutsig_0_4z[11:6], celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_15z };
  assign celloutsig_0_38z = { celloutsig_0_14z[8:4], celloutsig_0_33z } / { 1'h1, celloutsig_0_1z, celloutsig_0_7z[3:1], 1'h0 };
  assign celloutsig_1_0z = in_data[121:117] / { 1'h1, in_data[135:132] };
  assign celloutsig_1_12z = { in_data[188:179], celloutsig_1_11z, celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_8z } / { 1'h1, celloutsig_1_2z[9:1], celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_9z, celloutsig_1_1z };
  assign celloutsig_0_10z = { in_data[19:16], celloutsig_0_2z, celloutsig_0_2z } / { 1'h1, _01_[10:4], _00_, celloutsig_0_2z[4:1], in_data[0] };
  assign celloutsig_0_12z = { celloutsig_0_10z[13:3], celloutsig_0_6z } / { 1'h1, in_data[54:52], celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_4z[12], celloutsig_0_2z };
  assign celloutsig_1_8z = celloutsig_1_5z[19:12] === { celloutsig_1_5z[9:3], celloutsig_1_3z };
  assign celloutsig_0_1z = in_data[45:42] === in_data[28:25];
  assign celloutsig_0_17z = { celloutsig_0_12z[8:4], celloutsig_0_1z } === { celloutsig_0_7z[3:1], 1'h0, celloutsig_0_1z, celloutsig_0_15z };
  assign celloutsig_0_11z = in_data[62:43] > { celloutsig_0_2z[2], celloutsig_0_10z, celloutsig_0_2z };
  assign celloutsig_1_17z = { celloutsig_1_5z[19:15], celloutsig_1_16z } <= { celloutsig_1_12z[9:5], celloutsig_1_15z };
  assign celloutsig_1_1z = { celloutsig_1_0z[2:0], celloutsig_1_0z } && in_data[171:164];
  assign celloutsig_1_15z = { in_data[184:169], celloutsig_1_11z } && in_data[122:106];
  assign celloutsig_0_26z = { _01_[6:4], _00_, _01_[2:1], celloutsig_0_2z } && celloutsig_0_14z;
  assign celloutsig_1_4z = in_data[135] & ~(celloutsig_1_3z);
  assign celloutsig_0_22z = celloutsig_0_20z[10:1] % { 1'h1, celloutsig_0_19z[11:3] };
  assign celloutsig_0_13z = { _01_[9:4], _00_, celloutsig_0_9z } * { celloutsig_0_12z[9:4], celloutsig_0_0z, celloutsig_0_4z[12] };
  assign celloutsig_0_4z[18:1] = in_data[82] ? { in_data[47:36], celloutsig_0_2z, celloutsig_0_0z } : { _01_[16:4], _00_, _01_[2:0], celloutsig_0_1z };
  assign celloutsig_1_5z = celloutsig_1_3z ? in_data[174:154] : { in_data[190:172], celloutsig_1_1z, 1'h0 };
  assign celloutsig_0_18z = celloutsig_0_0z ? { celloutsig_0_10z[11:0], celloutsig_0_15z, celloutsig_0_6z } : { _01_[14:4], _00_, _01_[2:1] };
  assign celloutsig_1_6z = - { celloutsig_1_2z[7:0], celloutsig_1_4z };
  assign celloutsig_1_3z = { celloutsig_1_2z[4:0], celloutsig_1_1z } !== { celloutsig_1_0z[3], celloutsig_1_0z };
  assign celloutsig_0_16z = celloutsig_0_14z[10:1] !== { _01_[13:5], celloutsig_0_9z };
  assign celloutsig_0_0z = ~^ in_data[41:36];
  assign celloutsig_0_34z = ~^ { _01_[14:9], celloutsig_0_7z[3:1], 1'h0, celloutsig_0_17z, celloutsig_0_31z, celloutsig_0_26z, celloutsig_0_13z, celloutsig_0_17z };
  assign celloutsig_0_40z = ~^ { celloutsig_0_38z[4:0], celloutsig_0_34z };
  assign celloutsig_1_10z = ~^ celloutsig_1_2z[8:0];
  assign celloutsig_1_19z = ~^ { celloutsig_1_12z[6], celloutsig_1_3z, celloutsig_1_15z, celloutsig_1_14z, celloutsig_1_17z, celloutsig_1_14z };
  assign celloutsig_1_14z = ^ { _02_, _02_ };
  assign celloutsig_0_6z = ^ celloutsig_0_2z[3:0];
  assign celloutsig_0_14z = celloutsig_0_4z[14:4] >>> { celloutsig_0_4z[11:2], celloutsig_0_11z };
  assign celloutsig_0_20z = { _01_[12:4], _00_, _01_[2:0], celloutsig_0_6z } - { celloutsig_0_19z[8:1], celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_1_16z = ~((celloutsig_1_14z & celloutsig_1_3z) | in_data[108]);
  assign celloutsig_0_7z[3:1] = celloutsig_0_4z[7:5] ^ celloutsig_0_2z[4:2];
  assign _01_[3] = _00_;
  assign celloutsig_0_4z[0] = celloutsig_0_4z[1];
  assign celloutsig_0_7z[0] = 1'h0;
  assign { out_data[145:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_39z, celloutsig_0_40z };
endmodule
