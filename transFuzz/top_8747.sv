/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [13:0] _01_;
  reg [39:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [5:0] celloutsig_0_15z;
  wire [12:0] celloutsig_0_18z;
  wire [2:0] celloutsig_0_19z;
  wire [5:0] celloutsig_0_1z;
  wire [14:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [6:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [9:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [3:0] celloutsig_0_28z;
  wire [11:0] celloutsig_0_2z;
  wire [2:0] celloutsig_0_30z;
  wire [15:0] celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire [5:0] celloutsig_0_34z;
  wire [7:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [6:0] celloutsig_0_3z;
  wire [2:0] celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire celloutsig_0_49z;
  wire [7:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [17:0] celloutsig_0_51z;
  wire [3:0] celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire [16:0] celloutsig_0_5z;
  wire [22:0] celloutsig_0_6z;
  wire [11:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [7:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [8:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [5:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [7:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [4:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [7:0] celloutsig_1_8z;
  wire [8:0] celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_8z = celloutsig_0_2z[9] ? in_data[48] : celloutsig_0_4z[5];
  assign celloutsig_0_12z = celloutsig_0_6z[5] ? celloutsig_0_8z : celloutsig_0_5z[12];
  assign celloutsig_0_14z = celloutsig_0_2z[3] ? celloutsig_0_13z : celloutsig_0_8z;
  assign celloutsig_0_23z = celloutsig_0_1z[5] ? celloutsig_0_3z[2] : celloutsig_0_1z[2];
  assign celloutsig_0_43z = ~(1'h0 & celloutsig_0_35z[3]);
  assign celloutsig_0_10z = ~(celloutsig_0_7z[1] & celloutsig_0_9z[7]);
  assign celloutsig_0_13z = !(celloutsig_0_1z[2] ? celloutsig_0_12z : celloutsig_0_6z[22]);
  assign celloutsig_0_11z = ~(celloutsig_0_8z | celloutsig_0_9z[7]);
  assign celloutsig_0_50z = ~celloutsig_0_8z;
  assign celloutsig_1_16z = ~celloutsig_1_8z[3];
  assign celloutsig_0_21z = ~celloutsig_0_15z[0];
  assign celloutsig_1_10z = ~((celloutsig_1_6z | celloutsig_1_6z) & celloutsig_1_7z);
  assign celloutsig_1_7z = ~((celloutsig_1_6z | celloutsig_1_2z) & (celloutsig_1_0z | celloutsig_1_6z));
  assign celloutsig_0_49z = celloutsig_0_20z[10] | celloutsig_0_36z;
  assign celloutsig_1_19z = celloutsig_1_9z[4] | celloutsig_1_17z;
  reg [13:0] _18_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _18_ <= 14'h0000;
    else _18_ <= { celloutsig_0_7z[8:1], celloutsig_0_1z[5:1], celloutsig_0_15z[0] };
  assign { _01_[13], _00_, _01_[11:0] } = _18_;
  always_ff @(negedge clkin_data[32], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _02_ <= 40'h0000000000;
    else _02_ <= { celloutsig_0_1z[3], celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_26z, celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_41z = celloutsig_0_5z[6:4] / { 1'h1, _02_[17], celloutsig_0_37z };
  assign celloutsig_0_22z = { celloutsig_0_21z, celloutsig_0_1z } / { 1'h1, celloutsig_0_18z[11:6] };
  assign celloutsig_0_26z = { celloutsig_0_18z[5:2], celloutsig_0_19z, celloutsig_0_23z, celloutsig_0_12z, celloutsig_0_0z } / { 1'h1, celloutsig_0_14z, celloutsig_0_9z };
  assign celloutsig_0_36z = celloutsig_0_20z[8:3] == in_data[54:49];
  assign celloutsig_0_58z = { celloutsig_0_18z[6:4], celloutsig_0_30z[2:1], 1'h0 } == { celloutsig_0_22z[4:0], celloutsig_0_49z };
  assign celloutsig_1_0z = in_data[146:129] == in_data[121:104];
  assign celloutsig_1_4z = { in_data[120:113], celloutsig_1_0z } == { celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_15z = { in_data[128:123], celloutsig_1_6z, celloutsig_1_0z } == celloutsig_1_8z;
  assign celloutsig_1_17z = { celloutsig_1_16z, celloutsig_1_3z, celloutsig_1_10z } == { celloutsig_1_5z[2:1], celloutsig_1_16z };
  assign celloutsig_1_12z = in_data[172:141] > { celloutsig_1_8z[7:1], celloutsig_1_2z, celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_2z };
  assign celloutsig_0_25z = ! celloutsig_0_9z[3:1];
  assign celloutsig_1_3z = celloutsig_1_1z[4:2] < { celloutsig_1_1z[2:1], celloutsig_1_2z };
  assign celloutsig_1_14z = { celloutsig_1_1z[2], celloutsig_1_7z, celloutsig_1_12z } < { celloutsig_1_11z[8:7], celloutsig_1_2z };
  assign celloutsig_0_27z = celloutsig_0_5z[15:1] < { celloutsig_0_1z[4:1], celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_21z };
  assign celloutsig_0_0z = in_data[16] & ~(in_data[15]);
  assign celloutsig_0_37z = celloutsig_0_34z[3] & ~(in_data[38]);
  assign celloutsig_1_2z = celloutsig_1_1z[3] & ~(celloutsig_1_0z);
  assign celloutsig_0_24z = celloutsig_0_10z & ~(celloutsig_0_22z[6]);
  assign celloutsig_0_4z = { celloutsig_0_2z[10:4], celloutsig_0_0z } % { 1'h1, in_data[24:19], in_data[0] };
  assign celloutsig_1_11z = { celloutsig_1_8z[4:0], celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_7z } % { 1'h1, celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_4z, in_data[96] };
  assign celloutsig_0_34z = { celloutsig_0_1z[4:1], celloutsig_0_15z[0], celloutsig_0_27z } % { 1'h1, celloutsig_0_22z[5:1] };
  assign celloutsig_0_35z = { celloutsig_0_2z[11:5], celloutsig_0_8z } % { 1'h1, celloutsig_0_7z[10:4] };
  assign celloutsig_0_51z = in_data[38:21] % { 1'h1, celloutsig_0_1z[2:1], celloutsig_0_43z, celloutsig_0_9z, celloutsig_0_33z, celloutsig_0_41z, celloutsig_0_24z, celloutsig_0_50z };
  assign celloutsig_0_5z = celloutsig_0_2z[10] ? { in_data[25:16], celloutsig_0_3z } : in_data[59:43];
  assign celloutsig_1_18z = celloutsig_1_13z[3] ? { celloutsig_1_15z, celloutsig_1_2z, celloutsig_1_7z } : { celloutsig_1_3z, celloutsig_1_17z, celloutsig_1_14z };
  assign celloutsig_0_15z[0] = celloutsig_0_3z[1] ? celloutsig_0_8z : celloutsig_0_1z[0];
  assign celloutsig_0_18z = in_data[50] ? { celloutsig_0_3z, celloutsig_0_1z[5:1], celloutsig_0_15z[0] } : { celloutsig_0_3z[3:0], celloutsig_0_12z, celloutsig_0_1z[5:1], celloutsig_0_15z[0], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_6z = in_data[161:159] !== { celloutsig_1_5z[2:1], celloutsig_1_0z };
  assign celloutsig_0_3z = ~ { celloutsig_0_2z[9:4], celloutsig_0_0z };
  assign celloutsig_1_8z = ~ { celloutsig_1_1z[6:1], celloutsig_1_0z, celloutsig_1_7z };
  assign celloutsig_1_1z = { in_data[182:176], celloutsig_1_0z } | { in_data[177:171], celloutsig_1_0z };
  assign celloutsig_1_9z = { in_data[160:153], celloutsig_1_7z } | { celloutsig_1_5z[3:0], celloutsig_1_5z };
  assign celloutsig_0_7z = celloutsig_0_5z[14:3] | { celloutsig_0_6z[11:7], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_13z = { celloutsig_1_8z[5:1], celloutsig_1_3z } | { celloutsig_1_1z[7:3], celloutsig_1_0z };
  assign celloutsig_0_1z = in_data[49:44] | in_data[13:8];
  assign celloutsig_0_20z = { celloutsig_0_2z[10], celloutsig_0_8z, celloutsig_0_18z } | { celloutsig_0_7z[6:0], celloutsig_0_4z };
  assign celloutsig_0_2z = in_data[78:67] | { in_data[18:13], celloutsig_0_1z };
  assign celloutsig_0_28z = { celloutsig_0_2z[4:2], celloutsig_0_11z } <<< { in_data[78:76], celloutsig_0_11z };
  assign celloutsig_0_31z = { celloutsig_0_3z, celloutsig_0_25z, celloutsig_0_23z, celloutsig_0_1z[5:1], celloutsig_0_15z[0], celloutsig_0_8z } - { celloutsig_0_6z[18:12], celloutsig_0_4z, celloutsig_0_23z };
  assign celloutsig_1_5z = { in_data[163:160], celloutsig_1_0z } - celloutsig_1_1z[6:2];
  assign celloutsig_0_19z = celloutsig_0_7z[4:2] - _01_[6:4];
  assign celloutsig_0_57z = celloutsig_0_51z[13:10] ^ { celloutsig_0_31z[8:6], celloutsig_0_33z };
  assign celloutsig_0_6z = { celloutsig_0_2z[11:2], celloutsig_0_3z, celloutsig_0_1z } ^ { in_data[37:16], celloutsig_0_0z };
  assign celloutsig_0_9z = in_data[32:25] ^ { celloutsig_0_5z[7:1], celloutsig_0_0z };
  assign celloutsig_0_33z = ~((celloutsig_0_4z[7] & _02_[24]) | celloutsig_0_5z[15]);
  assign celloutsig_0_30z[2:1] = celloutsig_0_1z[3:2] ^ celloutsig_0_28z[2:1];
  assign _01_[12] = _00_;
  assign celloutsig_0_15z[5:1] = celloutsig_0_1z[5:1];
  assign celloutsig_0_30z[0] = 1'h0;
  assign { out_data[130:128], out_data[96], out_data[35:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_57z, celloutsig_0_58z };
endmodule
