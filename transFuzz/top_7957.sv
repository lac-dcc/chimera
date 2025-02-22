/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [25:0] _03_;
  wire celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [29:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [3:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [3:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [2:0] celloutsig_0_30z;
  wire [3:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [3:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [14:0] celloutsig_0_36z;
  wire [3:0] celloutsig_0_37z;
  wire [3:0] celloutsig_0_38z;
  wire [7:0] celloutsig_0_3z;
  wire [3:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [11:0] celloutsig_0_43z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [4:0] celloutsig_0_6z;
  wire [13:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [10:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire [5:0] celloutsig_1_18z;
  wire [19:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [30:0] celloutsig_1_4z;
  wire [27:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [19:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_12z = in_data[179] ? celloutsig_1_2z[6] : celloutsig_1_6z;
  assign celloutsig_0_20z = celloutsig_0_4z ? celloutsig_0_19z : celloutsig_0_16z;
  assign celloutsig_0_4z = ~(celloutsig_0_2z & celloutsig_0_3z[4]);
  assign celloutsig_1_6z = ~(celloutsig_1_4z[8] & celloutsig_1_3z);
  assign celloutsig_0_22z = ~(celloutsig_0_0z & _00_);
  assign celloutsig_1_1z = ~(celloutsig_1_0z | celloutsig_1_0z);
  assign celloutsig_1_16z = ~(celloutsig_1_1z | celloutsig_1_15z);
  assign celloutsig_0_16z = ~(celloutsig_0_15z | celloutsig_0_7z[10]);
  assign celloutsig_0_19z = ~(celloutsig_0_12z | celloutsig_0_18z);
  assign celloutsig_0_18z = ~((celloutsig_0_14z | _02_) & (celloutsig_0_0z | celloutsig_0_3z[1]));
  reg [25:0] _14_;
  always_ff @(negedge celloutsig_1_19z[0], negedge clkin_data[0])
    if (!clkin_data[0]) _14_ <= 26'h0000000;
    else _14_ <= { celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_9z };
  assign { _03_[25:22], _01_, _03_[20:2], _02_, _00_ } = _14_;
  assign celloutsig_0_33z = { celloutsig_0_3z[5], celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_12z } / { 1'h1, celloutsig_0_12z, celloutsig_0_23z, celloutsig_0_28z };
  assign celloutsig_0_37z = { celloutsig_0_21z[18:16], celloutsig_0_5z } / { 1'h1, celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_1z };
  assign celloutsig_0_11z = { celloutsig_0_3z, celloutsig_0_6z } == { celloutsig_0_7z[11], celloutsig_0_9z, celloutsig_0_0z };
  assign celloutsig_0_12z = celloutsig_0_7z[10:3] == { celloutsig_0_3z[1:0], celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_15z = { _03_[25:22], _01_, _03_[20:3], celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_5z } == { celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_7z };
  assign celloutsig_0_17z = { _03_[7], celloutsig_0_14z } == { celloutsig_0_12z, celloutsig_0_4z };
  assign celloutsig_1_3z = { in_data[180:177], celloutsig_1_2z, celloutsig_1_0z } === { celloutsig_1_2z[5:0], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_14z = { _03_[17:5], celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_11z } === in_data[94:64];
  assign celloutsig_1_15z = ! { celloutsig_1_2z[5:3], celloutsig_1_1z };
  assign celloutsig_0_2z = ! { in_data[66:65], celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_42z = { celloutsig_0_21z[28:3], celloutsig_0_32z } < { celloutsig_0_38z[0], celloutsig_0_41z, celloutsig_0_30z, celloutsig_0_11z, celloutsig_0_25z, celloutsig_0_36z, celloutsig_0_17z, celloutsig_0_26z };
  assign celloutsig_0_5z = celloutsig_0_3z[0] & ~(celloutsig_0_3z[1]);
  assign celloutsig_0_23z = celloutsig_0_15z & ~(celloutsig_0_11z);
  assign celloutsig_0_26z = celloutsig_0_7z[6] & ~(celloutsig_0_5z);
  assign celloutsig_0_32z = celloutsig_0_18z & ~(celloutsig_0_28z);
  assign celloutsig_0_41z = { celloutsig_0_9z[3:1], celloutsig_0_17z } % { 1'h1, celloutsig_0_28z, celloutsig_0_25z, celloutsig_0_18z };
  assign celloutsig_0_6z = { in_data[69:67], celloutsig_0_5z, celloutsig_0_0z } % { 1'h1, celloutsig_0_3z[6:4], celloutsig_0_4z };
  assign celloutsig_1_8z = celloutsig_1_5z[24:5] % { 1'h1, celloutsig_1_4z[11:5], celloutsig_1_4z[7], celloutsig_1_4z[7], celloutsig_1_4z[9:8], celloutsig_1_4z[5], celloutsig_1_2z };
  assign celloutsig_1_19z = { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_15z, celloutsig_1_18z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_12z, celloutsig_1_18z } % { 1'h1, celloutsig_1_8z[18:0] };
  assign celloutsig_0_36z = { celloutsig_0_9z[7:3], celloutsig_0_13z, celloutsig_0_26z, celloutsig_0_31z, celloutsig_0_27z } * { celloutsig_0_26z, celloutsig_0_1z, celloutsig_0_17z, celloutsig_0_31z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_33z, celloutsig_0_1z, celloutsig_0_32z };
  assign celloutsig_0_38z = _03_[14:11] * { celloutsig_0_15z, celloutsig_0_19z, celloutsig_0_20z, celloutsig_0_2z };
  assign celloutsig_0_43z = { celloutsig_0_30z[1:0], celloutsig_0_8z, celloutsig_0_17z, celloutsig_0_26z, celloutsig_0_12z, celloutsig_0_37z, celloutsig_0_20z, celloutsig_0_0z } * { celloutsig_0_21z[25:16], celloutsig_0_20z, celloutsig_0_34z };
  assign celloutsig_0_7z = { in_data[16:13], celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_3z } | { in_data[50:38], celloutsig_0_5z };
  assign celloutsig_0_9z = { in_data[23:17], celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_8z } | { in_data[12:5], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_0_21z = { celloutsig_0_9z[9:1], celloutsig_0_1z, celloutsig_0_13z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_0z } | { in_data[53:31], celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_19z, celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_14z, celloutsig_0_4z };
  assign celloutsig_0_30z = { celloutsig_0_24z[1:0], celloutsig_0_23z } | celloutsig_0_6z[4:2];
  assign celloutsig_0_0z = | in_data[14:0];
  assign celloutsig_0_13z = | { _03_[24:22], _01_, _03_[20:18] };
  assign celloutsig_0_25z = | { in_data[83:74], celloutsig_0_12z };
  assign celloutsig_0_28z = | { celloutsig_0_21z[16:5], celloutsig_0_8z, celloutsig_0_19z, celloutsig_0_5z, celloutsig_0_23z };
  assign celloutsig_0_34z = ~^ { celloutsig_0_6z[4:2], celloutsig_0_28z };
  assign celloutsig_1_9z = ^ celloutsig_1_4z[24:17];
  assign celloutsig_1_10z = ^ { in_data[166:165], celloutsig_1_9z, celloutsig_1_1z };
  assign celloutsig_0_1z = ^ { in_data[58:43], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_2z = { in_data[176:173], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z } <<< in_data[134:128];
  assign celloutsig_1_5z = { celloutsig_1_4z[27:5], celloutsig_1_4z[7], celloutsig_1_4z[7], celloutsig_1_4z[9:8], celloutsig_1_3z } <<< { celloutsig_1_4z[27:5], celloutsig_1_4z[7], celloutsig_1_4z[7], celloutsig_1_4z[9:8], celloutsig_1_4z[5] };
  assign celloutsig_1_18z = { celloutsig_1_4z[18:14], celloutsig_1_16z } <<< { in_data[185:181], celloutsig_1_10z };
  assign celloutsig_0_3z = { in_data[13:11], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z } <<< { in_data[75], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_24z = in_data[51:48] <<< { in_data[64:62], celloutsig_0_1z };
  assign celloutsig_0_27z = { celloutsig_0_7z[0], celloutsig_0_22z, celloutsig_0_15z, celloutsig_0_14z } <<< { celloutsig_0_20z, celloutsig_0_11z, celloutsig_0_26z, celloutsig_0_2z };
  assign celloutsig_0_31z = { celloutsig_0_20z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_0z } ^ celloutsig_0_21z[22:19];
  assign celloutsig_1_0z = ~((in_data[165] & in_data[188]) | in_data[148]);
  assign celloutsig_0_8z = ~((celloutsig_0_6z[1] & celloutsig_0_5z) | (celloutsig_0_4z & celloutsig_0_1z));
  assign { celloutsig_1_4z[9], celloutsig_1_4z[13:12], celloutsig_1_4z[7], celloutsig_1_4z[10], celloutsig_1_4z[14], celloutsig_1_4z[11], celloutsig_1_4z[6], celloutsig_1_4z[8], celloutsig_1_4z[5], celloutsig_1_4z[30:15] } = { celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, in_data[133:118] } | { celloutsig_1_3z, celloutsig_1_2z[2:1], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z[3], celloutsig_1_2z[0], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, in_data[115:105], celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_2z[6:4] };
  assign { _03_[21], _03_[1:0] } = { _01_, _02_, _00_ };
  assign celloutsig_1_4z[4:0] = { celloutsig_1_4z[7], celloutsig_1_4z[7], celloutsig_1_4z[9:8], celloutsig_1_4z[5] };
  assign { out_data[133:128], out_data[115:96], out_data[32], out_data[11:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_42z, celloutsig_0_43z };
endmodule
