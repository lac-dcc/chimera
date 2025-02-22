/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [8:0] _01_;
  wire [2:0] celloutsig_0_0z;
  wire [7:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [2:0] celloutsig_0_12z;
  wire [11:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [5:0] celloutsig_0_18z;
  wire [3:0] celloutsig_0_1z;
  wire [7:0] celloutsig_0_20z;
  wire [9:0] celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [6:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [11:0] celloutsig_0_33z;
  wire [6:0] celloutsig_0_34z;
  wire [27:0] celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire [3:0] celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire [2:0] celloutsig_0_45z;
  wire [3:0] celloutsig_0_46z;
  wire celloutsig_0_4z;
  wire [3:0] celloutsig_0_54z;
  wire celloutsig_0_57z;
  wire [18:0] celloutsig_0_5z;
  wire [2:0] celloutsig_0_61z;
  wire celloutsig_0_62z;
  wire [3:0] celloutsig_0_6z;
  wire [8:0] celloutsig_0_7z;
  wire [4:0] celloutsig_0_8z;
  wire [14:0] celloutsig_0_9z;
  wire [7:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [6:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [17:0] celloutsig_1_14z;
  wire [3:0] celloutsig_1_16z;
  wire [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [12:0] celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire [5:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_19z = ~(celloutsig_1_14z[5] & celloutsig_1_12z[5]);
  assign celloutsig_0_30z = ~(celloutsig_0_11z | celloutsig_0_10z[4]);
  assign celloutsig_0_37z = ~celloutsig_0_11z;
  assign celloutsig_1_1z = ~((celloutsig_1_0z[2] | celloutsig_1_0z[1]) & (celloutsig_1_0z[0] | in_data[171]));
  assign celloutsig_1_11z = ~((celloutsig_1_10z | celloutsig_1_9z) & (celloutsig_1_1z | celloutsig_1_8z[0]));
  assign celloutsig_1_13z = celloutsig_1_1z | ~(celloutsig_1_5z);
  assign celloutsig_1_9z = celloutsig_1_1z | celloutsig_1_3z[7];
  assign celloutsig_0_17z = celloutsig_0_15z[2] | celloutsig_0_10z[6];
  assign celloutsig_0_25z = celloutsig_0_3z[3] | celloutsig_0_2z[0];
  assign celloutsig_0_26z = celloutsig_0_8z[0] | celloutsig_0_21z[4];
  assign celloutsig_0_23z = celloutsig_0_16z ^ celloutsig_0_15z[0];
  reg [18:0] _13_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _13_ <= 19'h00000;
    else _13_ <= { celloutsig_0_35z[20:15], celloutsig_0_32z, celloutsig_0_15z, celloutsig_0_16z, celloutsig_0_23z, celloutsig_0_34z };
  assign out_data[18:0] = _13_;
  reg [8:0] _14_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _14_ <= 9'h000;
    else _14_ <= { celloutsig_0_2z[2:1], celloutsig_0_2z };
  assign { _01_[8:1], _00_ } = _14_;
  assign celloutsig_0_0z = in_data[47:45] / { 1'h1, in_data[14:13] };
  assign celloutsig_0_6z = celloutsig_0_3z / { 1'h1, celloutsig_0_0z };
  assign celloutsig_0_21z = { celloutsig_0_8z[2:0], celloutsig_0_12z, celloutsig_0_1z } / { 1'h1, celloutsig_0_5z[10:2] };
  assign celloutsig_0_57z = { celloutsig_0_8z[3:2], celloutsig_0_26z, celloutsig_0_37z, celloutsig_0_12z } >= { celloutsig_0_8z[3], celloutsig_0_17z, celloutsig_0_54z, celloutsig_0_32z };
  assign celloutsig_0_16z = ! celloutsig_0_5z[15:12];
  assign celloutsig_0_46z = { celloutsig_0_10z[3:2], celloutsig_0_42z, celloutsig_0_16z } % { 1'h1, celloutsig_0_45z };
  assign celloutsig_1_0z = in_data[150:143] % { 1'h1, in_data[116:110] };
  assign celloutsig_0_61z = { celloutsig_0_33z[11:10], celloutsig_0_31z } % { 1'h1, celloutsig_0_46z[2:1] };
  assign celloutsig_0_8z = celloutsig_0_2z[6:2] % { 1'h1, celloutsig_0_5z[7:4] };
  assign celloutsig_0_9z = { in_data[25:14], celloutsig_0_0z } % { 1'h1, celloutsig_0_0z[1:0], celloutsig_0_8z, celloutsig_0_2z };
  assign celloutsig_0_1z = in_data[23:20] % { 1'h1, celloutsig_0_0z };
  assign celloutsig_0_35z = { celloutsig_0_6z[3:2], celloutsig_0_30z, celloutsig_0_15z, _01_[8:1], _00_, celloutsig_0_11z, celloutsig_0_33z } * { in_data[45:40], celloutsig_0_20z, celloutsig_0_30z, celloutsig_0_34z, celloutsig_0_12z, celloutsig_0_32z, celloutsig_0_32z, celloutsig_0_17z };
  assign celloutsig_0_7z = { celloutsig_0_3z[1:0], celloutsig_0_2z } * { celloutsig_0_1z[2], celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_1_16z = { celloutsig_1_12z[3:1], celloutsig_1_13z } * celloutsig_1_14z[8:5];
  assign celloutsig_0_10z = { celloutsig_0_7z[6:2], celloutsig_0_0z } * { celloutsig_0_6z[3:1], celloutsig_0_8z };
  assign celloutsig_0_15z = celloutsig_0_13z[7:5] * celloutsig_0_3z[3:1];
  assign celloutsig_0_18z = celloutsig_0_7z[8:3] * { celloutsig_0_2z[4:1], celloutsig_0_4z, celloutsig_0_11z };
  assign celloutsig_0_2z = in_data[54:48] * in_data[49:43];
  assign celloutsig_0_42z = | { celloutsig_0_16z, celloutsig_0_21z };
  assign celloutsig_1_7z = | in_data[173:164];
  assign celloutsig_0_31z = | celloutsig_0_2z[5:3];
  assign celloutsig_0_4z = in_data[84] & celloutsig_0_0z[2];
  assign celloutsig_1_2z = ~^ { celloutsig_1_0z[4:1], celloutsig_1_1z };
  assign celloutsig_1_10z = ~^ { in_data[170:162], celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_7z };
  assign celloutsig_0_11z = ~^ celloutsig_0_2z;
  assign celloutsig_0_62z = ^ { celloutsig_0_54z[3], celloutsig_0_45z, celloutsig_0_61z, celloutsig_0_57z };
  assign celloutsig_0_32z = ^ celloutsig_0_7z[6:1];
  assign celloutsig_1_8z = celloutsig_1_3z[12:7] >> { celloutsig_1_3z[10:6], celloutsig_1_2z };
  assign celloutsig_0_12z = celloutsig_0_9z[9:7] >> celloutsig_0_1z[3:1];
  assign celloutsig_0_13z = celloutsig_0_5z[12:1] >> { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_0_3z = in_data[9:6] - celloutsig_0_1z;
  assign celloutsig_0_34z = celloutsig_0_10z[7:1] - { celloutsig_0_33z[8:6], celloutsig_0_31z, celloutsig_0_25z, celloutsig_0_32z, celloutsig_0_31z };
  assign celloutsig_1_12z = { in_data[126:124], celloutsig_1_2z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_11z } - { in_data[154:149], celloutsig_1_7z };
  assign celloutsig_1_18z = { celloutsig_1_16z[1:0], celloutsig_1_2z } - in_data[129:127];
  assign celloutsig_0_20z = { celloutsig_0_8z[3], celloutsig_0_15z, celloutsig_0_6z } - { celloutsig_0_5z[3:0], celloutsig_0_6z };
  assign celloutsig_0_45z = celloutsig_0_15z ^ { in_data[9:8], celloutsig_0_16z };
  assign celloutsig_0_54z = celloutsig_0_18z[4:1] ^ celloutsig_0_7z[3:0];
  assign celloutsig_0_5z = in_data[73:55] ^ { celloutsig_0_1z[3:1], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_1_3z = in_data[150:138] ^ in_data[129:117];
  assign celloutsig_1_4z = celloutsig_1_0z[2:0] ^ celloutsig_1_0z[5:3];
  assign celloutsig_1_14z = { celloutsig_1_8z[2:1], celloutsig_1_13z, celloutsig_1_12z, celloutsig_1_12z, celloutsig_1_10z } ^ { in_data[113:106], celloutsig_1_4z, celloutsig_1_12z };
  assign celloutsig_0_33z = { celloutsig_0_7z[3:0], celloutsig_0_10z } ^ celloutsig_0_9z[11:0];
  assign celloutsig_1_5z = ~((in_data[120] & celloutsig_1_1z) | (celloutsig_1_4z[1] & celloutsig_1_4z[2]));
  assign _01_[0] = _00_;
  assign { out_data[130:128], out_data[96], out_data[32] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_62z };
endmodule
