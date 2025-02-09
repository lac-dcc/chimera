/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [7:0] _00_;
  wire [7:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [4:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [11:0] celloutsig_0_17z;
  wire [3:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  wire [6:0] celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_2z;
  wire [6:0] celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire [2:0] celloutsig_0_35z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [7:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [11:0] celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire celloutsig_0_5z;
  wire [6:0] celloutsig_0_6z;
  wire [3:0] celloutsig_0_7z;
  wire [4:0] celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [14:0] celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [5:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [14:0] celloutsig_1_6z;
  wire [12:0] celloutsig_1_7z;
  wire [26:0] celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_40z = !(celloutsig_0_15z ? celloutsig_0_19z[1] : celloutsig_0_15z);
  assign celloutsig_0_5z = !(celloutsig_0_1z ? celloutsig_0_3z : celloutsig_0_3z);
  assign celloutsig_1_10z = !(celloutsig_1_0z[4] ? in_data[128] : celloutsig_1_0z[4]);
  assign celloutsig_1_3z = !(celloutsig_1_1z ? celloutsig_1_1z : in_data[185]);
  assign celloutsig_1_5z = !(celloutsig_1_0z[1] ? in_data[189] : celloutsig_1_0z[0]);
  assign celloutsig_0_33z = ~celloutsig_0_25z;
  assign celloutsig_0_4z = ~((celloutsig_0_3z | celloutsig_0_0z[0]) & celloutsig_0_3z);
  assign celloutsig_0_56z = ~((celloutsig_0_25z | celloutsig_0_9z[3]) & celloutsig_0_24z);
  assign celloutsig_1_11z = ~((celloutsig_1_7z[1] | celloutsig_1_8z[14]) & celloutsig_1_6z[3]);
  assign celloutsig_1_16z = ~((celloutsig_1_10z | celloutsig_1_10z) & celloutsig_1_11z);
  assign celloutsig_1_17z = ~((celloutsig_1_4z | celloutsig_1_4z) & celloutsig_1_12z[4]);
  assign celloutsig_0_15z = ~((celloutsig_0_2z | celloutsig_0_9z[4]) & celloutsig_0_2z);
  assign celloutsig_1_1z = celloutsig_1_0z[3] | ~(in_data[161]);
  assign celloutsig_1_19z = celloutsig_1_16z | ~(in_data[131]);
  assign celloutsig_0_25z = celloutsig_0_13z[2] | ~(celloutsig_0_13z[4]);
  assign celloutsig_1_14z = celloutsig_1_7z[5] ^ celloutsig_1_1z;
  assign celloutsig_1_6z = { in_data[131:118], celloutsig_1_3z } + { in_data[105:96], celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_10z };
  assign celloutsig_0_17z = { celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_9z } + { celloutsig_0_11z[2], celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_9z };
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _00_ <= 8'h00;
    else _00_ <= { in_data[64:59], celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_24z = celloutsig_0_17z[9:1] > in_data[51:43];
  assign celloutsig_1_4z = { celloutsig_1_10z, celloutsig_1_1z, celloutsig_1_10z } < { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_3z };
  assign celloutsig_0_10z = { celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_3z } < { _00_[6:3], celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_5z };
  assign celloutsig_0_2z = { in_data[38:34], celloutsig_0_0z } < { celloutsig_0_0z[4:1], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_11z = { in_data[63:60], celloutsig_0_3z } % { 1'h1, celloutsig_0_9z[3:0] };
  assign celloutsig_0_31z = celloutsig_0_6z % { 1'h1, celloutsig_0_25z, celloutsig_0_14z, celloutsig_0_20z };
  assign celloutsig_0_35z = celloutsig_0_13z[4:2] % { 1'h1, celloutsig_0_23z, celloutsig_0_14z };
  assign celloutsig_1_18z = { celloutsig_1_12z[9:7], celloutsig_1_10z, celloutsig_1_17z, celloutsig_1_14z } % { 1'h1, celloutsig_1_14z, celloutsig_1_4z, celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_10z };
  assign celloutsig_1_8z = { in_data[189:164], celloutsig_1_10z } * { in_data[156:145], celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_1z };
  assign celloutsig_0_20z = { celloutsig_0_0z[6:4], celloutsig_0_1z } * { in_data[2], celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_3z };
  assign celloutsig_0_55z = in_data[86] ? { celloutsig_0_49z[6:1], celloutsig_0_33z, celloutsig_0_11z } : { celloutsig_0_31z[3:0], celloutsig_0_21z, celloutsig_0_40z };
  assign celloutsig_0_49z = - { celloutsig_0_35z[1], celloutsig_0_6z };
  assign celloutsig_1_0z = - in_data[189:185];
  assign celloutsig_1_7z = - { celloutsig_1_0z[1:0], celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_4z };
  assign celloutsig_0_7z = - celloutsig_0_0z[3:0];
  assign celloutsig_0_9z = - { in_data[63:62], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_5z };
  assign celloutsig_0_0z = in_data[74:67] | in_data[7:0];
  assign celloutsig_0_6z = { celloutsig_0_0z[7:4], celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_3z } | { celloutsig_0_0z[5:1], celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_19z = { celloutsig_0_17z[8:6], celloutsig_0_12z } | { celloutsig_0_13z[3:1], celloutsig_0_3z };
  assign celloutsig_0_21z = { celloutsig_0_17z[7:6], celloutsig_0_4z, celloutsig_0_19z } | { celloutsig_0_6z[5:0], celloutsig_0_3z };
  assign celloutsig_0_14z = _00_[3] & _00_[1];
  assign celloutsig_0_23z = celloutsig_0_9z[4] & celloutsig_0_20z[0];
  assign celloutsig_0_3z = ^ { in_data[32:26], celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_12z = ^ celloutsig_0_11z[4:1];
  assign celloutsig_1_12z = { in_data[109:96], celloutsig_1_3z } <<< { in_data[111:110], celloutsig_1_7z };
  assign celloutsig_0_13z = { celloutsig_0_1z, celloutsig_0_7z } <<< { celloutsig_0_0z[7:6], celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_2z };
  assign celloutsig_0_1z = ~((celloutsig_0_0z[3] & in_data[1]) | in_data[30]);
  assign { out_data[133:128], out_data[96], out_data[43:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_55z, celloutsig_0_56z };
endmodule
