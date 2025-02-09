/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire [4:0] _04_;
  wire celloutsig_0_0z;
  wire [3:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [6:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [25:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [15:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [9:0] celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_35z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [7:0] celloutsig_0_4z;
  wire [5:0] celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_75z;
  wire celloutsig_0_7z;
  wire celloutsig_0_80z;
  wire celloutsig_0_81z;
  wire [2:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [28:0] celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_80z = !(celloutsig_0_75z ? _01_ : celloutsig_0_23z[2]);
  assign celloutsig_0_81z = !(celloutsig_0_61z ? celloutsig_0_70z : celloutsig_0_1z);
  assign celloutsig_0_9z = !(celloutsig_0_3z ? celloutsig_0_4z[5] : celloutsig_0_4z[0]);
  assign celloutsig_0_1z = !(celloutsig_0_0z ? celloutsig_0_0z : celloutsig_0_0z);
  assign celloutsig_0_19z = !(celloutsig_0_12z[3] ? celloutsig_0_14z : celloutsig_0_16z);
  assign celloutsig_0_21z = !(celloutsig_0_12z[5] ? celloutsig_0_16z : celloutsig_0_11z);
  assign celloutsig_0_2z = !(celloutsig_0_0z ? celloutsig_0_1z : celloutsig_0_0z);
  assign celloutsig_0_29z = !(celloutsig_0_2z ? celloutsig_0_2z : celloutsig_0_18z);
  assign celloutsig_0_39z = celloutsig_0_8z[2] | ~(celloutsig_0_35z);
  assign celloutsig_1_9z = celloutsig_1_1z | ~(celloutsig_1_8z);
  assign celloutsig_0_11z = celloutsig_0_5z[4] | ~(celloutsig_0_0z);
  assign celloutsig_0_13z = celloutsig_0_4z[1] | ~(in_data[88]);
  assign celloutsig_0_16z = celloutsig_0_15z[13] | ~(celloutsig_0_6z);
  assign celloutsig_0_25z = celloutsig_0_15z[18] | ~(celloutsig_0_8z[2]);
  assign celloutsig_0_3z = in_data[85] ^ celloutsig_0_0z;
  assign celloutsig_0_61z = celloutsig_0_19z ^ celloutsig_0_0z;
  assign celloutsig_0_70z = _03_ ^ celloutsig_0_39z;
  assign celloutsig_0_75z = celloutsig_0_30z ^ celloutsig_0_5z[4];
  assign celloutsig_1_1z = celloutsig_1_0z[0] ^ celloutsig_1_0z[19];
  assign celloutsig_1_18z = celloutsig_1_0z[1] ^ celloutsig_1_8z;
  assign celloutsig_1_19z = celloutsig_1_18z ^ celloutsig_1_9z;
  assign celloutsig_0_28z = celloutsig_0_8z[2] ^ celloutsig_0_27z;
  assign celloutsig_0_30z = celloutsig_0_20z[7] ^ celloutsig_0_28z;
  reg [4:0] _28_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _28_ <= 5'h00;
    else _28_ <= { celloutsig_0_8z[1:0], celloutsig_0_25z, celloutsig_0_18z, celloutsig_0_29z };
  assign { _04_[4], _03_, _04_[2:0] } = _28_;
  reg [2:0] _29_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _29_ <= 3'h0;
    else _29_ <= { celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_14z };
  assign { _00_, _01_, _02_ } = _29_;
  assign celloutsig_0_7z = { celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_3z } && { in_data[35:26], celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_1_8z = celloutsig_1_0z[14:10] && celloutsig_1_0z[9:5];
  assign celloutsig_0_18z = { in_data[58:49], celloutsig_0_9z } && { celloutsig_0_12z[4:1], celloutsig_0_12z };
  assign celloutsig_0_27z = celloutsig_0_8z && celloutsig_0_20z[6:4];
  assign celloutsig_0_0z = in_data[73:70] != in_data[7:4];
  assign celloutsig_0_35z = { celloutsig_0_5z[3:0], celloutsig_0_21z, celloutsig_0_9z, celloutsig_0_25z, celloutsig_0_30z, celloutsig_0_21z } != { celloutsig_0_12z, celloutsig_0_27z, celloutsig_0_25z };
  assign celloutsig_0_6z = { celloutsig_0_4z[3:1], celloutsig_0_0z } != { celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_14z = { celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_10z } != { celloutsig_0_5z[5:1], celloutsig_0_0z, celloutsig_0_11z };
  assign celloutsig_0_4z = - { in_data[18:12], celloutsig_0_3z };
  assign celloutsig_0_5z = - { celloutsig_0_4z[5:1], celloutsig_0_1z };
  assign celloutsig_0_8z = - { celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_1_0z = - in_data[161:133];
  assign celloutsig_0_10z = - { celloutsig_0_8z, celloutsig_0_6z };
  assign celloutsig_0_12z = - { celloutsig_0_4z[7:2], celloutsig_0_2z };
  assign celloutsig_0_15z = - { in_data[54:42], celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_7z };
  assign celloutsig_0_20z = - { in_data[44:42], celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_16z, celloutsig_0_4z, celloutsig_0_11z };
  assign celloutsig_0_23z = - { celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_3z };
  assign _04_[3] = _03_;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_80z, celloutsig_0_81z };
endmodule
