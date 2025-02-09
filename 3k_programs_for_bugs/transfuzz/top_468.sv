/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [11:0] _01_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [2:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [11:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [9:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [17:0] celloutsig_0_19z;
  wire [7:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_28z;
  wire [23:0] celloutsig_0_2z;
  wire [8:0] celloutsig_0_30z;
  wire [3:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  reg [16:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_46z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire [7:0] celloutsig_0_54z;
  wire celloutsig_0_5z;
  wire celloutsig_0_65z;
  wire celloutsig_0_66z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [8:0] celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_13z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [8:0] celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_3z = !(celloutsig_1_1z[1] ? celloutsig_1_0z : celloutsig_1_1z[1]);
  assign celloutsig_1_18z = !(celloutsig_1_10z ? celloutsig_1_13z : celloutsig_1_8z[5]);
  assign celloutsig_1_19z = !(celloutsig_1_13z ? celloutsig_1_17z : celloutsig_1_4z);
  assign celloutsig_0_18z = !(celloutsig_0_11z[2] ? celloutsig_0_2z[7] : celloutsig_0_1z[5]);
  assign celloutsig_0_25z = !(celloutsig_0_23z ? celloutsig_0_0z : _00_);
  assign celloutsig_0_3z = ~(celloutsig_0_1z[2] | celloutsig_0_1z[0]);
  assign celloutsig_0_39z = ~(celloutsig_0_19z[5] | in_data[1]);
  assign celloutsig_0_42z = ~(celloutsig_0_20z | celloutsig_0_40z);
  assign celloutsig_0_46z = ~(celloutsig_0_41z[10] | celloutsig_0_41z[4]);
  assign celloutsig_0_49z = ~(celloutsig_0_33z | celloutsig_0_23z);
  assign celloutsig_0_5z = ~(celloutsig_0_4z | celloutsig_0_3z);
  assign celloutsig_0_13z = ~(celloutsig_0_2z[11] | in_data[73]);
  assign celloutsig_0_15z = ~(in_data[1] | celloutsig_0_5z);
  assign celloutsig_0_22z = ~(celloutsig_0_0z | celloutsig_0_14z[1]);
  assign celloutsig_0_23z = ~(celloutsig_0_14z[4] | celloutsig_0_20z);
  assign celloutsig_0_24z = ~(in_data[22] | celloutsig_0_0z);
  assign celloutsig_0_16z = ~((celloutsig_0_3z | celloutsig_0_14z[9]) & celloutsig_0_6z);
  assign celloutsig_0_66z = ~((celloutsig_0_3z | celloutsig_0_7z) & (celloutsig_0_46z | celloutsig_0_51z));
  assign celloutsig_1_6z = ~((celloutsig_1_0z | celloutsig_1_2z) & (in_data[147] | celloutsig_1_1z[2]));
  assign celloutsig_0_0z = in_data[64] | ~(in_data[71]);
  assign celloutsig_0_33z = in_data[93] | ~(celloutsig_0_28z);
  assign celloutsig_1_5z = celloutsig_1_2z | ~(celloutsig_1_4z);
  assign celloutsig_1_10z = in_data[151] | ~(celloutsig_1_6z);
  assign celloutsig_0_12z = celloutsig_0_5z | ~(celloutsig_0_4z);
  assign celloutsig_0_65z = celloutsig_0_54z[1] | celloutsig_0_51z;
  assign celloutsig_0_51z = ~(celloutsig_0_49z ^ celloutsig_0_39z);
  assign celloutsig_0_7z = ~(celloutsig_0_3z ^ celloutsig_0_6z);
  reg [11:0] _29_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[32])
    if (clkin_data[32]) _29_ <= 12'h000;
    else _29_ <= { celloutsig_0_2z[16:6], celloutsig_0_6z };
  assign { _01_[11:4], _00_, _01_[2:0] } = _29_;
  assign celloutsig_1_1z = in_data[185:183] / { 1'h1, in_data[115:114] };
  assign celloutsig_0_30z = { celloutsig_0_14z[11:5], celloutsig_0_24z, celloutsig_0_25z } / { 1'h1, _01_[8:4], _00_, _01_[2], celloutsig_0_22z };
  assign celloutsig_0_6z = celloutsig_0_2z[9:4] === { celloutsig_0_2z[8:7], celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_1_2z = { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z } === { in_data[138:136], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_21z = { celloutsig_0_19z[6:3], celloutsig_0_16z, celloutsig_0_20z, celloutsig_0_14z } === { celloutsig_0_8z[6:2], _01_[11:4], _00_, _01_[2:0], celloutsig_0_15z };
  assign celloutsig_0_40z = celloutsig_0_32z[3] & ~(celloutsig_0_22z);
  assign celloutsig_0_4z = celloutsig_0_1z[7] & ~(celloutsig_0_1z[5]);
  assign celloutsig_1_0z = in_data[113] & ~(in_data[122]);
  assign celloutsig_1_4z = celloutsig_1_3z & ~(celloutsig_1_0z);
  assign celloutsig_0_20z = celloutsig_0_18z & ~(celloutsig_0_17z[6]);
  assign celloutsig_0_28z = celloutsig_0_1z[1] & ~(celloutsig_0_10z);
  assign celloutsig_0_54z = { celloutsig_0_30z[4:2], celloutsig_0_21z, celloutsig_0_10z, celloutsig_0_33z, celloutsig_0_42z, celloutsig_0_42z } % { 1'h1, celloutsig_0_1z[4:1], celloutsig_0_11z };
  assign celloutsig_0_32z = { celloutsig_0_2z[2], celloutsig_0_0z, celloutsig_0_21z, celloutsig_0_0z } | { celloutsig_0_19z[4:3], celloutsig_0_6z, celloutsig_0_3z };
  assign celloutsig_0_8z = { celloutsig_0_2z[10:4], celloutsig_0_4z, celloutsig_0_0z } | { in_data[21:16], celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_0z };
  assign celloutsig_0_2z = { in_data[55:42], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z } | { in_data[54:47], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_13z = | celloutsig_1_8z[8:1];
  assign celloutsig_0_10z = | { in_data[71], celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_1_8z = { celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_6z } >> { celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_4z };
  assign celloutsig_0_14z = in_data[77:66] >> { celloutsig_0_2z[13:3], celloutsig_0_3z };
  assign celloutsig_0_19z = { celloutsig_0_8z[7:4], celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_17z } >> { celloutsig_0_17z[5:1], celloutsig_0_5z, celloutsig_0_14z };
  assign celloutsig_0_11z = { celloutsig_0_1z[3:2], celloutsig_0_5z } - { celloutsig_0_8z[6:5], celloutsig_0_6z };
  assign celloutsig_0_1z = in_data[27:20] - in_data[82:75];
  assign celloutsig_0_17z = in_data[35:26] - { celloutsig_0_8z[4:0], celloutsig_0_13z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_6z };
  always_latch
    if (clkin_data[64]) celloutsig_0_41z = 17'h00000;
    else if (!celloutsig_1_18z) celloutsig_0_41z = { celloutsig_0_8z[4:0], _01_[11:4], _00_, _01_[2:0] };
  assign celloutsig_1_7z = ~((celloutsig_1_1z[2] & celloutsig_1_1z[0]) | (celloutsig_1_6z & celloutsig_1_4z));
  assign celloutsig_1_17z = ~((celloutsig_1_4z & celloutsig_1_1z[0]) | (celloutsig_1_5z & celloutsig_1_1z[2]));
  assign _01_[3] = _00_;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_65z, celloutsig_0_66z };
endmodule
