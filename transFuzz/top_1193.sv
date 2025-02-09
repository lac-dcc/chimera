/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [4:0] _00_;
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [7:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [6:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [9:0] celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [8:0] celloutsig_0_21z;
  wire [24:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [6:0] celloutsig_0_27z;
  wire [2:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire [4:0] celloutsig_0_32z;
  wire [6:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [14:0] celloutsig_0_36z;
  wire [9:0] celloutsig_0_3z;
  wire celloutsig_0_43z;
  wire celloutsig_0_4z;
  wire [3:0] celloutsig_0_5z;
  wire celloutsig_0_67z;
  reg [5:0] celloutsig_0_6z;
  wire celloutsig_0_77z;
  wire [8:0] celloutsig_0_78z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [19:0] celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_11z = ~(celloutsig_1_0z & celloutsig_1_3z);
  assign celloutsig_1_0z = ~(in_data[109] | in_data[183]);
  assign celloutsig_0_14z = ~(celloutsig_0_7z | celloutsig_0_5z[1]);
  assign celloutsig_0_77z = ~((celloutsig_0_43z | celloutsig_0_67z) & celloutsig_0_67z);
  assign celloutsig_1_5z = ~((celloutsig_1_1z | celloutsig_1_4z) & celloutsig_1_4z);
  assign celloutsig_0_11z = ~((celloutsig_0_8z | celloutsig_0_6z[5]) & in_data[24]);
  assign celloutsig_0_20z = ~((celloutsig_0_17z[2] | celloutsig_0_16z) & celloutsig_0_1z);
  assign celloutsig_0_4z = in_data[71] | celloutsig_0_3z[5];
  assign celloutsig_0_9z = celloutsig_0_7z | celloutsig_0_3z[1];
  always_ff @(posedge clkin_data[32], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _00_ <= 5'h00;
    else _00_ <= { celloutsig_0_0z, celloutsig_0_8z };
  assign celloutsig_0_34z = celloutsig_0_15z === { celloutsig_0_5z[2], celloutsig_0_11z, celloutsig_0_32z };
  assign celloutsig_1_7z = { celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_5z } === { in_data[159:158], celloutsig_1_0z };
  assign celloutsig_0_16z = { in_data[84], celloutsig_0_5z, celloutsig_0_10z } === { celloutsig_0_0z[2], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_67z = { celloutsig_0_0z[0], celloutsig_0_31z, celloutsig_0_7z, celloutsig_0_7z } || celloutsig_0_23z[17:14];
  assign celloutsig_0_7z = { in_data[76:52], celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_5z } || in_data[89:55];
  assign celloutsig_0_10z = { celloutsig_0_3z[5:2], celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_8z } || { in_data[5:0], celloutsig_0_9z, celloutsig_0_9z };
  assign celloutsig_0_1z = celloutsig_0_0z[2:0] || in_data[74:72];
  assign celloutsig_0_31z = in_data[45:26] < { celloutsig_0_6z[5:1], celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_27z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_20z, celloutsig_0_29z, celloutsig_0_11z, celloutsig_0_14z };
  assign celloutsig_1_8z = { celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_7z } < { celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_2z };
  assign celloutsig_1_18z = { celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_2z, celloutsig_1_7z } < { celloutsig_1_13z[17:12], celloutsig_1_10z, celloutsig_1_11z };
  assign celloutsig_0_2z = in_data[70:57] < { in_data[45:33], celloutsig_0_1z };
  assign celloutsig_0_29z = { celloutsig_0_23z[23:11], celloutsig_0_9z, celloutsig_0_18z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_2z } < { celloutsig_0_23z[15:7], celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_21z, celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_10z };
  assign celloutsig_1_1z = celloutsig_1_0z & ~(in_data[154]);
  assign celloutsig_1_4z = celloutsig_1_1z & ~(celloutsig_1_2z[0]);
  assign celloutsig_1_12z = celloutsig_1_5z & ~(celloutsig_1_10z);
  assign celloutsig_1_19z = celloutsig_1_12z & ~(celloutsig_1_13z[18]);
  assign celloutsig_0_3z = { in_data[56:48], celloutsig_0_1z } % { 1'h1, in_data[53], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, in_data[0] };
  assign celloutsig_0_23z = { _00_[4:2], celloutsig_0_20z, celloutsig_0_16z, celloutsig_0_17z, celloutsig_0_18z, celloutsig_0_20z, celloutsig_0_18z, celloutsig_0_8z } * in_data[46:22];
  assign celloutsig_0_28z = { celloutsig_0_15z[4:3], celloutsig_0_24z } * { celloutsig_0_23z[11], celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_0_0z = in_data[34] ? in_data[85:82] : in_data[14:11];
  assign celloutsig_0_33z = celloutsig_0_6z[5] ? celloutsig_0_15z : { celloutsig_0_23z[21:19], celloutsig_0_8z, celloutsig_0_28z };
  assign celloutsig_0_36z = celloutsig_0_24z ? { celloutsig_0_6z[4:0], celloutsig_0_20z, celloutsig_0_4z, celloutsig_0_16z, celloutsig_0_18z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_34z } : { celloutsig_0_32z[3:0], celloutsig_0_33z, celloutsig_0_34z, celloutsig_0_31z, celloutsig_0_8z, celloutsig_0_10z };
  assign celloutsig_1_2z = celloutsig_1_1z ? in_data[112:110] : { in_data[189], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_13z = celloutsig_0_6z[2] ? { celloutsig_0_3z[4:1], celloutsig_0_5z } : { in_data[23:18], celloutsig_0_10z, celloutsig_0_1z };
  assign celloutsig_0_15z = celloutsig_0_9z ? celloutsig_0_13z[6:0] : { celloutsig_0_3z[0], celloutsig_0_6z };
  assign celloutsig_0_78z = - { celloutsig_0_36z[10], celloutsig_0_15z, celloutsig_0_43z };
  assign celloutsig_0_21z = ~ celloutsig_0_17z[8:0];
  assign celloutsig_0_27z = ~ celloutsig_0_13z[6:0];
  assign celloutsig_0_5z = { celloutsig_0_3z[2:0], celloutsig_0_1z } | celloutsig_0_0z;
  assign celloutsig_0_17z = { celloutsig_0_15z[5:1], celloutsig_0_0z, celloutsig_0_11z } | { celloutsig_0_5z[3:2], celloutsig_0_15z, celloutsig_0_4z };
  assign celloutsig_1_3z = celloutsig_1_0z & in_data[181];
  assign celloutsig_1_10z = celloutsig_1_6z & celloutsig_1_5z;
  assign celloutsig_0_32z = celloutsig_0_27z[4:0] ~^ { celloutsig_0_6z[2], celloutsig_0_5z };
  assign celloutsig_1_13z = { in_data[139:123], celloutsig_1_12z, celloutsig_1_0z, celloutsig_1_0z } ~^ { celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_4z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_10z };
  assign celloutsig_0_18z = { celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_9z } ~^ { celloutsig_0_3z[5:3], celloutsig_0_8z };
  assign celloutsig_0_43z = ~((celloutsig_0_7z & celloutsig_0_0z[1]) | celloutsig_0_14z);
  assign celloutsig_0_8z = ~((celloutsig_0_1z & celloutsig_0_7z) | celloutsig_0_2z);
  assign celloutsig_1_6z = ~((celloutsig_1_1z & celloutsig_1_2z[2]) | celloutsig_1_3z);
  assign celloutsig_1_9z = ~((celloutsig_1_4z & celloutsig_1_4z) | celloutsig_1_2z[1]);
  assign celloutsig_0_12z = ~((celloutsig_0_7z & celloutsig_0_5z[3]) | celloutsig_0_0z[1]);
  assign celloutsig_0_24z = ~((celloutsig_0_11z & celloutsig_0_9z) | celloutsig_0_3z[4]);
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_6z = 6'h00;
    else if (clkin_data[0]) celloutsig_0_6z = { in_data[44:42], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_2z };
  assign { out_data[128], out_data[96], out_data[32], out_data[8:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_77z, celloutsig_0_78z };
endmodule
