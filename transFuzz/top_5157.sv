/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [7:0] _01_;
  wire [12:0] _02_;
  wire [6:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [9:0] celloutsig_0_13z;
  wire [4:0] celloutsig_0_14z;
  wire [2:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [20:0] celloutsig_0_17z;
  wire [4:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [21:0] celloutsig_0_21z;
  wire [2:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [3:0] celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire [16:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [5:0] celloutsig_0_32z;
  wire [8:0] celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [3:0] celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire [4:0] celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [5:0] celloutsig_0_49z;
  wire [7:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_52z;
  wire celloutsig_0_55z;
  wire [7:0] celloutsig_0_5z;
  wire celloutsig_0_62z;
  wire [6:0] celloutsig_0_6z;
  wire [10:0] celloutsig_0_70z;
  wire celloutsig_0_7z;
  wire [3:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [14:0] celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [2:0] celloutsig_1_14z;
  wire [2:0] celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [27:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire [14:0] celloutsig_1_3z;
  wire [9:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [6:0] celloutsig_1_6z;
  wire [5:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_16z = ~((celloutsig_1_9z | in_data[111]) & celloutsig_1_0z[5]);
  assign celloutsig_0_9z = ~((celloutsig_0_0z[0] | celloutsig_0_5z[1]) & celloutsig_0_5z[6]);
  assign celloutsig_0_28z = ~((celloutsig_0_22z[1] | celloutsig_0_10z) & celloutsig_0_23z);
  assign celloutsig_0_7z = ~((celloutsig_0_2z | celloutsig_0_0z[6]) & (celloutsig_0_2z | celloutsig_0_5z[4]));
  assign celloutsig_1_18z = ~((celloutsig_1_7z[2] | celloutsig_1_10z[2]) & (celloutsig_1_8z | celloutsig_1_4z[4]));
  assign celloutsig_0_46z = celloutsig_0_6z[1] | ~(celloutsig_0_17z[5]);
  assign celloutsig_0_11z = celloutsig_0_5z[5] | ~(celloutsig_0_1z);
  assign celloutsig_0_23z = celloutsig_0_19z ^ celloutsig_0_8z[2];
  assign celloutsig_0_45z = ~(_00_ ^ celloutsig_0_23z);
  assign celloutsig_1_1z = ~(in_data[109] ^ celloutsig_1_0z[6]);
  assign celloutsig_1_17z = ~(celloutsig_1_8z ^ celloutsig_1_7z[3]);
  reg [4:0] _14_;
  always_ff @(negedge celloutsig_1_19z[0], posedge clkin_data[32])
    if (clkin_data[32]) _14_ <= 5'h00;
    else _14_ <= celloutsig_0_17z[19:15];
  assign _01_[5:1] = _14_;
  reg [12:0] _15_;
  always_ff @(negedge celloutsig_1_19z[0], posedge clkin_data[32])
    if (clkin_data[32]) _15_ <= 13'h0000;
    else _15_ <= { celloutsig_0_14z[4:2], celloutsig_0_33z, celloutsig_0_35z };
  assign { _02_[12], _00_, _02_[10:0] } = _15_;
  reg [2:0] _16_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[32])
    if (!clkin_data[32]) _16_ <= 3'h0;
    else _16_ <= in_data[85:83];
  assign out_data[34:32] = _16_;
  assign celloutsig_0_15z = { celloutsig_0_14z[1:0], celloutsig_0_12z } / { 1'h1, in_data[52], celloutsig_0_11z };
  assign celloutsig_0_32z = celloutsig_0_5z[6:1] / { 1'h1, celloutsig_0_14z };
  assign celloutsig_0_33z = { in_data[65:58], celloutsig_0_11z } / { 1'h1, celloutsig_0_5z[6:0], celloutsig_0_16z };
  assign celloutsig_0_35z = { celloutsig_0_12z, celloutsig_0_15z } == { celloutsig_0_15z, celloutsig_0_28z };
  assign celloutsig_0_62z = celloutsig_0_44z[4:1] == { celloutsig_0_49z[5:3], celloutsig_0_28z };
  assign celloutsig_0_16z = in_data[75:69] == { celloutsig_0_5z[7:2], celloutsig_0_11z };
  assign celloutsig_1_5z = { celloutsig_1_0z[14], celloutsig_1_0z } > in_data[122:107];
  assign celloutsig_0_36z = { celloutsig_0_0z[5:3], celloutsig_0_35z } <= { celloutsig_0_32z[3], celloutsig_0_22z };
  assign celloutsig_0_42z = { _01_[4:3], celloutsig_0_2z } <= celloutsig_0_33z[6:4];
  assign celloutsig_1_8z = { celloutsig_1_2z[3:0], celloutsig_1_6z, celloutsig_1_1z } <= { in_data[104:99], celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_10z = { celloutsig_0_6z[2], celloutsig_0_6z, celloutsig_0_6z } <= { celloutsig_0_4z[6:0], celloutsig_0_8z, celloutsig_0_3z };
  assign celloutsig_0_55z = in_data[64:54] || { celloutsig_0_46z, celloutsig_0_47z, celloutsig_0_45z, celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_52z, _01_[5:1] };
  assign celloutsig_1_2z = celloutsig_1_0z[6:2] % { 1'h1, in_data[124:122], celloutsig_1_1z };
  assign celloutsig_1_6z = { celloutsig_1_3z[8:3], celloutsig_1_5z } % { 1'h1, celloutsig_1_3z[11:6] };
  assign celloutsig_0_21z = { celloutsig_0_4z[3], celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_1z } % { 1'h1, celloutsig_0_17z };
  assign celloutsig_0_44z = { celloutsig_0_6z[2], celloutsig_0_26z } * in_data[33:29];
  assign celloutsig_1_7z = { celloutsig_1_6z[4:1], celloutsig_1_5z, celloutsig_1_5z } * { celloutsig_1_0z[14:10], celloutsig_1_1z };
  assign celloutsig_1_15z = celloutsig_1_0z[5:3] * celloutsig_1_7z[4:2];
  assign celloutsig_0_17z = { celloutsig_0_0z[5:1], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_1z } * { celloutsig_0_13z[4:2], celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_4z };
  assign celloutsig_0_47z = { celloutsig_0_21z[13], celloutsig_0_19z, celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_23z } != { _02_[10:1], celloutsig_0_42z };
  assign celloutsig_0_50z = { celloutsig_0_44z, celloutsig_0_16z, celloutsig_0_10z, celloutsig_0_18z, celloutsig_0_22z } != { celloutsig_0_26z[3:2], celloutsig_0_0z, celloutsig_0_49z };
  assign celloutsig_0_3z = - in_data[41:38];
  assign celloutsig_0_4z = - in_data[44:37];
  assign celloutsig_1_3z = - in_data[161:147];
  assign celloutsig_1_10z = - celloutsig_1_2z[2:0];
  assign celloutsig_1_14z = - { celloutsig_1_2z[1:0], celloutsig_1_8z };
  assign celloutsig_0_13z = - { in_data[59:57], celloutsig_0_0z };
  assign celloutsig_0_22z = - celloutsig_0_6z[5:3];
  assign celloutsig_0_26z = - in_data[29:26];
  assign celloutsig_1_0z = in_data[110:96] | in_data[118:104];
  assign celloutsig_1_9z = & { celloutsig_1_2z, in_data[133:113] };
  assign celloutsig_1_12z = & in_data[141:135];
  assign celloutsig_0_2z = & { celloutsig_0_1z, in_data[68:64] };
  assign celloutsig_1_13z = | { celloutsig_1_1z, celloutsig_1_0z[7:2] };
  assign celloutsig_0_19z = ~^ { in_data[44:37], celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_16z, celloutsig_0_10z };
  assign celloutsig_0_12z = ^ { in_data[19:14], celloutsig_0_7z };
  assign celloutsig_0_49z = { celloutsig_0_4z[7:3], celloutsig_0_28z } >>> { celloutsig_0_29z[12:8], celloutsig_0_36z };
  assign celloutsig_0_18z = { celloutsig_0_5z[4:2], celloutsig_0_11z, celloutsig_0_11z } >>> { celloutsig_0_15z[1:0], celloutsig_0_15z };
  assign celloutsig_1_4z = celloutsig_1_3z[12:3] - celloutsig_1_0z[12:3];
  assign celloutsig_0_8z = celloutsig_0_5z[3:0] - { celloutsig_0_4z[3:2], celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_1_19z = { celloutsig_1_6z[4:1], celloutsig_1_7z, celloutsig_1_14z, celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_8z, celloutsig_1_15z, celloutsig_1_15z } - { celloutsig_1_0z[13:9], celloutsig_1_10z, celloutsig_1_17z, celloutsig_1_12z, celloutsig_1_18z, celloutsig_1_18z, celloutsig_1_12z, celloutsig_1_16z, celloutsig_1_9z, celloutsig_1_16z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_13z };
  assign celloutsig_0_29z = { celloutsig_0_21z[5:0], celloutsig_0_23z, celloutsig_0_28z, celloutsig_0_18z, celloutsig_0_22z, celloutsig_0_2z } - { celloutsig_0_18z[2:0], celloutsig_0_11z, celloutsig_0_22z, celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_5z };
  assign celloutsig_0_5z = in_data[28:21] ~^ { celloutsig_0_4z[7:4], celloutsig_0_3z };
  assign celloutsig_0_6z = in_data[35:29] ~^ celloutsig_0_0z;
  assign celloutsig_0_70z = { celloutsig_0_28z, celloutsig_0_3z, celloutsig_0_55z, celloutsig_0_44z } ~^ { celloutsig_0_14z[3:0], _01_[5:1], celloutsig_0_62z, celloutsig_0_30z };
  assign celloutsig_0_14z = celloutsig_0_0z[6:2] ~^ { celloutsig_0_4z[3:0], celloutsig_0_11z };
  assign celloutsig_0_0z = in_data[23:17] ^ in_data[79:73];
  assign celloutsig_0_1z = ~((celloutsig_0_0z[6] & celloutsig_0_0z[4]) | in_data[73]);
  assign celloutsig_0_30z = ~((celloutsig_0_7z & celloutsig_0_11z) | celloutsig_0_29z[15]);
  assign celloutsig_0_52z = ~celloutsig_0_50z;
  assign _01_[7:6] = celloutsig_0_5z[6:5];
  assign _02_[11] = _00_;
  assign { out_data[128], out_data[123:96], out_data[10:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_70z };
endmodule
