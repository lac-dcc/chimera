/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire [4:0] _05_;
  reg [12:0] _06_;
  wire [12:0] _07_;
  wire celloutsig_0_0z;
  wire [15:0] celloutsig_0_10z;
  wire [8:0] celloutsig_0_11z;
  wire [7:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [2:0] celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [5:0] celloutsig_0_19z;
  wire [10:0] celloutsig_0_20z;
  wire [6:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [4:0] celloutsig_0_27z;
  wire [14:0] celloutsig_0_28z;
  wire [11:0] celloutsig_0_29z;
  wire [2:0] celloutsig_0_2z;
  wire [5:0] celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire [3:0] celloutsig_0_35z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [15:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [4:0] celloutsig_1_11z;
  wire [4:0] celloutsig_1_12z;
  wire [2:0] celloutsig_1_14z;
  wire [23:0] celloutsig_1_15z;
  wire [19:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [11:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire [15:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [5:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_43z = !(celloutsig_0_39z ? celloutsig_0_20z[5] : celloutsig_0_23z);
  assign celloutsig_0_6z = !(in_data[82] ? celloutsig_0_0z : _00_);
  assign celloutsig_0_40z = ~((_01_ | celloutsig_0_34z) & (celloutsig_0_28z[0] | celloutsig_0_35z[2]));
  assign celloutsig_1_8z = ~((celloutsig_1_0z | celloutsig_1_1z[1]) & (celloutsig_1_0z | celloutsig_1_0z));
  assign celloutsig_0_17z = ~((_02_ | celloutsig_0_2z[1]) & (celloutsig_0_12z[7] | _03_));
  assign celloutsig_1_5z = celloutsig_1_1z[9] | ~(celloutsig_1_3z[2]);
  assign celloutsig_0_8z = celloutsig_0_5z | ~(celloutsig_0_7z);
  assign celloutsig_0_13z = _04_ | ~(celloutsig_0_12z[3]);
  assign celloutsig_0_14z = celloutsig_0_10z[4] | celloutsig_0_6z;
  assign celloutsig_0_22z = { celloutsig_0_10z[10:5], celloutsig_0_9z } + { celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_17z };
  assign celloutsig_0_29z = in_data[67:56] + celloutsig_0_28z[14:3];
  reg [4:0] _19_;
  always_ff @(negedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _19_ <= 5'h00;
    else _19_ <= { celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_3z };
  assign { _04_, _05_[3], _01_, _05_[1:0] } = _19_;
  reg [12:0] _20_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[0])
    if (clkin_data[0]) _20_ <= 13'h0000;
    else _20_ <= { in_data[31:20], celloutsig_0_0z };
  assign { _07_[12:9], _00_, _02_, _07_[6:3], _03_, _07_[1:0] } = _20_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _06_ <= 13'h0000;
    else _06_ <= { celloutsig_0_10z[15:4], celloutsig_0_5z };
  assign celloutsig_0_11z = { _05_[3], _01_, _05_[1], celloutsig_0_7z, _04_, _05_[3], _01_, _05_[1:0] } & { in_data[9:2], celloutsig_0_5z };
  assign celloutsig_0_32z = celloutsig_0_29z[10:5] / { 1'h1, celloutsig_0_19z[4:0] };
  assign celloutsig_1_12z = { celloutsig_1_1z[3:0], celloutsig_1_8z } / { 1'h1, celloutsig_1_4z[8:7], celloutsig_1_2z, celloutsig_1_10z };
  assign celloutsig_0_10z = { in_data[43:29], celloutsig_0_6z } / { 1'h1, in_data[36:35], celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_5z, _04_, _05_[3], _01_, _05_[1:0], celloutsig_0_2z };
  assign celloutsig_0_19z = in_data[76:71] / { 1'h1, celloutsig_0_11z[6:2] };
  assign celloutsig_0_9z = { _04_, _04_, _05_[3], _01_, _05_[1:0] } == in_data[56:51];
  assign celloutsig_0_34z = in_data[49:45] === celloutsig_0_29z[9:5];
  assign celloutsig_1_0z = in_data[130:128] > in_data[128:126];
  assign celloutsig_1_18z = celloutsig_1_15z[8:2] > { celloutsig_1_17z[2:1], celloutsig_1_12z };
  assign celloutsig_1_7z = { celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_5z } && { celloutsig_1_4z[0], celloutsig_1_0z, celloutsig_1_5z };
  assign celloutsig_0_0z = in_data[20:12] < in_data[10:2];
  assign celloutsig_0_3z = { in_data[70:69], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z } < { in_data[83:74], celloutsig_0_0z };
  assign celloutsig_0_39z = { celloutsig_0_32z[3:1], celloutsig_0_32z } < celloutsig_0_29z[10:2];
  assign celloutsig_1_10z = in_data[142:128] < { celloutsig_1_1z[11:4], celloutsig_1_8z, celloutsig_1_6z };
  assign celloutsig_0_23z = { celloutsig_0_19z[4:1], celloutsig_0_0z, celloutsig_0_19z } < in_data[15:5];
  assign celloutsig_0_42z = { celloutsig_0_29z[11:4], celloutsig_0_19z, celloutsig_0_23z, celloutsig_0_5z } % { 1'h1, celloutsig_0_29z[9:4], celloutsig_0_40z, celloutsig_0_32z, celloutsig_0_34z, celloutsig_0_17z };
  assign celloutsig_1_1z = { in_data[134:125], celloutsig_1_0z, celloutsig_1_0z } * { in_data[129:119], celloutsig_1_0z };
  assign celloutsig_0_2z = { in_data[16:15], celloutsig_0_0z } * { _07_[3], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_28z = { celloutsig_0_12z[3], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_22z, celloutsig_0_18z } * { celloutsig_0_15z[1:0], _06_ };
  assign celloutsig_0_20z = celloutsig_0_5z ? celloutsig_0_10z[12:2] : { _05_[3], _01_, _05_[1], celloutsig_0_19z, celloutsig_0_18z, celloutsig_0_13z };
  assign celloutsig_1_15z = - { celloutsig_1_11z[2:1], celloutsig_1_14z, celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_7z, celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_2z };
  assign celloutsig_0_12z = - { _07_[9], _00_, _02_, _07_[6:3], _03_ };
  assign celloutsig_0_15z = - { in_data[81], celloutsig_0_3z, celloutsig_0_8z };
  assign celloutsig_1_17z = ~ { in_data[127:111], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_7z };
  assign celloutsig_0_18z = & { celloutsig_0_13z, celloutsig_0_12z[6:3] };
  assign celloutsig_0_5z = ~^ { in_data[48:37], celloutsig_0_2z, celloutsig_0_3z, _04_, _05_[3], _01_, _05_[1:0] };
  assign celloutsig_0_7z = ~^ { in_data[56:41], celloutsig_0_2z };
  assign celloutsig_0_35z = { _06_[10:9], celloutsig_0_5z, celloutsig_0_14z } >> { celloutsig_0_27z[2], celloutsig_0_15z };
  assign celloutsig_0_27z = in_data[9:5] >> { _06_[12:9], celloutsig_0_13z };
  assign celloutsig_1_11z = { 2'h3, celloutsig_1_3z[2:1], 1'h1 } << in_data[151:147];
  assign celloutsig_1_14z = celloutsig_1_4z[4:2] << celloutsig_1_6z[5:3];
  assign celloutsig_1_6z = { in_data[136:132], celloutsig_1_5z } >>> in_data[121:116];
  assign celloutsig_1_4z = in_data[173:158] ~^ { in_data[98:97], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_1_2z = ~((celloutsig_1_1z[6] & celloutsig_1_0z) | (in_data[153] & celloutsig_1_1z[0]));
  assign celloutsig_1_19z = ~((celloutsig_1_5z & celloutsig_1_11z[0]) | (celloutsig_1_11z[1] & celloutsig_1_12z[4]));
  assign celloutsig_1_3z[2:1] = { celloutsig_1_2z, celloutsig_1_0z } ~^ celloutsig_1_1z[3:2];
  assign { _05_[4], _05_[2] } = { _04_, _01_ };
  assign { _07_[8:7], _07_[2] } = { _00_, _02_, _03_ };
  assign { celloutsig_1_3z[9:3], celloutsig_1_3z[0] } = 8'hff;
  assign { out_data[128], out_data[96], out_data[47:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_42z, celloutsig_0_43z };
endmodule
