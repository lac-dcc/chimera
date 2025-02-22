/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [5:0] _02_;
  reg [10:0] _03_;
  wire [36:0] _04_;
  wire [7:0] _05_;
  reg [3:0] _06_;
  reg [4:0] _07_;
  wire celloutsig_0_0z;
  wire [4:0] celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [5:0] celloutsig_0_18z;
  wire [18:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_22z;
  wire [4:0] celloutsig_0_23z;
  wire [2:0] celloutsig_0_24z;
  wire [9:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [9:0] celloutsig_0_27z;
  wire [3:0] celloutsig_0_28z;
  wire [8:0] celloutsig_0_29z;
  wire [3:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [10:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [2:0] celloutsig_0_35z;
  wire [20:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [12:0] celloutsig_0_40z;
  wire [5:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_46z;
  wire [5:0] celloutsig_0_47z;
  wire [26:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire [31:0] celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire [6:0] celloutsig_0_54z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_6z;
  wire celloutsig_0_74z;
  wire [4:0] celloutsig_0_75z;
  wire [4:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire [12:0] celloutsig_1_10z;
  wire [9:0] celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire [3:0] celloutsig_1_17z;
  wire [4:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [11:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_16z = ~(celloutsig_1_8z & _00_);
  assign celloutsig_0_14z = ~(celloutsig_0_11z[0] & _01_);
  assign celloutsig_0_6z = ~celloutsig_0_2z[1];
  always_ff @(posedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _03_ <= 11'h000;
    else _03_ <= { celloutsig_1_5z[10:1], celloutsig_1_6z };
  reg [36:0] _12_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _12_ <= 37'h0000000000;
    else _12_ <= { in_data[160:141], celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_0z };
  assign { _04_[36:23], _00_, _04_[21:0] } = _12_;
  reg [7:0] _13_;
  always_ff @(negedge celloutsig_1_19z, posedge clkin_data[64])
    if (clkin_data[64]) _13_ <= 8'h00;
    else _13_ <= { in_data[33], celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_4z };
  assign { _05_[7:6], _02_[5:2], _01_, _02_[0] } = _13_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _06_ <= 4'h0;
    else _06_ <= celloutsig_0_2z;
  always_ff @(negedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _07_ <= 5'h00;
    else _07_ <= { celloutsig_0_2z[1:0], celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_9z };
  assign celloutsig_0_35z = celloutsig_0_11z[4:2] / { 1'h1, in_data[52], celloutsig_0_4z };
  assign celloutsig_1_0z = in_data[182:180] / { 1'h1, in_data[99:98] };
  assign celloutsig_0_3z = in_data[76:69] == in_data[30:23];
  assign celloutsig_1_3z = { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z } == { in_data[186:178], celloutsig_1_2z };
  assign celloutsig_0_30z = { celloutsig_0_27z[9:2], celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_9z } == { celloutsig_0_23z[2:0], celloutsig_0_0z, celloutsig_0_9z, _07_, celloutsig_0_5z };
  assign celloutsig_0_0z = in_data[15:8] === in_data[61:54];
  assign celloutsig_0_32z = { celloutsig_0_4z, celloutsig_0_8z, _07_ } === { celloutsig_0_25z[5:2], celloutsig_0_24z };
  assign celloutsig_0_8z = { celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_5z } === in_data[56:53];
  assign celloutsig_0_9z = celloutsig_0_7z[4:1] === { celloutsig_0_2z[1], celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_1_13z = { celloutsig_1_11z[9:3], celloutsig_1_3z, celloutsig_1_4z } === celloutsig_1_5z[11:3];
  assign celloutsig_0_17z = celloutsig_0_7z[3:1] === { celloutsig_0_12z[2], celloutsig_0_8z, celloutsig_0_9z };
  assign celloutsig_0_4z = celloutsig_0_2z >= celloutsig_0_2z;
  assign celloutsig_0_51z = { celloutsig_0_18z[5:1], celloutsig_0_6z, celloutsig_0_16z, celloutsig_0_49z } >= { in_data[72:70], celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_0_74z = { celloutsig_0_47z[2:1], celloutsig_0_61z, celloutsig_0_59z, celloutsig_0_0z, celloutsig_0_43z } >= { celloutsig_0_47z[4:1], celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_1_19z = { celloutsig_1_17z[0], celloutsig_1_15z, celloutsig_1_15z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_15z, celloutsig_1_6z } >= { celloutsig_1_10z[12:11], 2'h0, celloutsig_1_16z, celloutsig_1_2z, celloutsig_1_13z };
  assign celloutsig_0_38z = { celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_24z } <= { celloutsig_0_33z[5:1], celloutsig_0_15z };
  assign celloutsig_1_6z = in_data[175:168] <= { in_data[127:126], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_0_22z = { celloutsig_0_7z[2:0], celloutsig_0_18z } <= { in_data[7:3], celloutsig_0_2z };
  assign celloutsig_0_39z = { celloutsig_0_31z, celloutsig_0_23z, celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_5z } && { _07_[3:0], celloutsig_0_31z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_31z };
  assign celloutsig_0_43z = { celloutsig_0_19z[15:13], celloutsig_0_19z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_34z, celloutsig_0_28z } && { celloutsig_0_14z, _07_, celloutsig_0_39z, celloutsig_0_38z, celloutsig_0_35z, celloutsig_0_37z, celloutsig_0_8z, celloutsig_0_24z, celloutsig_0_9z, celloutsig_0_37z, celloutsig_0_27z, celloutsig_0_15z };
  assign celloutsig_0_59z = { celloutsig_0_25z[1], celloutsig_0_31z, celloutsig_0_41z } && { celloutsig_0_5z, celloutsig_0_42z, celloutsig_0_58z, _06_, celloutsig_0_37z };
  assign celloutsig_0_61z = celloutsig_0_54z[5:2] && { celloutsig_0_53z, celloutsig_0_50z, celloutsig_0_42z, celloutsig_0_3z };
  assign celloutsig_1_15z = { _03_[2:0], celloutsig_1_1z } && { _03_[8:6], celloutsig_1_3z };
  assign celloutsig_0_15z = in_data[31:29] && { in_data[34:33], celloutsig_0_8z };
  assign celloutsig_0_16z = { celloutsig_0_12z[3:1], celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_2z } && { celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_12z };
  assign celloutsig_0_46z = in_data[71:46] || { celloutsig_0_28z[2], celloutsig_0_34z, _07_, celloutsig_0_24z, celloutsig_0_31z, celloutsig_0_34z, celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_31z, celloutsig_0_31z, celloutsig_0_41z, celloutsig_0_13z, celloutsig_0_37z, celloutsig_0_34z };
  assign celloutsig_0_5z = { in_data[56:51], celloutsig_0_3z, celloutsig_0_1z } || { celloutsig_0_2z[0], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_0_58z = { celloutsig_0_11z[3:2], celloutsig_0_43z, celloutsig_0_23z, celloutsig_0_38z, celloutsig_0_1z, _05_[7:6], _02_[5:2], _01_, _02_[0], celloutsig_0_26z, celloutsig_0_26z, celloutsig_0_39z, celloutsig_0_32z } || { celloutsig_0_36z[15:0], celloutsig_0_41z };
  assign celloutsig_0_1z = in_data[41:33] || in_data[31:23];
  assign celloutsig_0_49z = { celloutsig_0_25z[8:1], celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_35z } != in_data[64:52];
  assign celloutsig_0_53z = { celloutsig_0_52z[20:19], celloutsig_0_41z } != { celloutsig_0_36z[14:8], celloutsig_0_13z };
  assign celloutsig_1_8z = in_data[169:161] != { _03_[5:2], celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_6z };
  assign celloutsig_0_13z = { _05_[6], _02_[5:4] } != { in_data[37:36], celloutsig_0_5z };
  assign celloutsig_0_31z = { _06_[3], celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_27z, celloutsig_0_26z, _05_[7:6], _02_[5:2], _01_, _02_[0], celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_26z, celloutsig_0_23z, celloutsig_0_30z } != { celloutsig_0_25z[0], celloutsig_0_28z, celloutsig_0_30z, celloutsig_0_29z, celloutsig_0_25z, celloutsig_0_5z, celloutsig_0_16z, celloutsig_0_12z };
  assign celloutsig_1_1z = in_data[184:136] !== in_data[167:119];
  assign celloutsig_0_26z = { celloutsig_0_22z, celloutsig_0_6z, celloutsig_0_7z } !== { celloutsig_0_18z[4:0], celloutsig_0_3z, celloutsig_0_22z };
  assign celloutsig_0_29z = ~ { celloutsig_0_19z[17:12], celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_13z };
  assign celloutsig_0_34z = & celloutsig_0_28z;
  assign celloutsig_1_2z = & { celloutsig_1_0z, in_data[123:110] };
  assign celloutsig_1_4z = & { celloutsig_1_1z, celloutsig_1_0z, in_data[135:126], in_data[123:110] };
  assign celloutsig_0_37z = celloutsig_0_16z & celloutsig_0_31z;
  assign celloutsig_0_50z = celloutsig_0_18z[3] & celloutsig_0_19z[9];
  assign celloutsig_0_42z = ^ celloutsig_0_7z[3:1];
  assign celloutsig_1_17z = { celloutsig_1_11z[8], celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_8z } << in_data[111:108];
  assign celloutsig_1_18z = { celloutsig_1_17z[1:0], celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_16z } << { 2'h0, celloutsig_1_6z, celloutsig_1_15z, celloutsig_1_1z };
  assign celloutsig_0_18z = { in_data[80], celloutsig_0_11z } << { _02_[3:2], _01_, celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_6z };
  assign celloutsig_0_2z = { in_data[55:53], celloutsig_0_0z } << { in_data[76:74], celloutsig_0_0z };
  assign celloutsig_0_23z = celloutsig_0_18z[5:1] << celloutsig_0_19z[9:5];
  assign celloutsig_0_24z = celloutsig_0_19z[9:7] << { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_47z = { celloutsig_0_29z[8:4], celloutsig_0_5z } >> { _02_[5:2], _01_, _02_[0] };
  assign celloutsig_0_52z = { celloutsig_0_19z[16:1], celloutsig_0_4z, celloutsig_0_30z, celloutsig_0_38z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_47z, celloutsig_0_9z } >> { celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_48z };
  assign celloutsig_0_25z = celloutsig_0_19z[12:3] >> { celloutsig_0_19z[17:9], celloutsig_0_9z };
  assign celloutsig_0_54z = { celloutsig_0_25z[5:0], celloutsig_0_42z } <<< { celloutsig_0_5z, celloutsig_0_43z, celloutsig_0_35z, celloutsig_0_5z, celloutsig_0_14z };
  assign celloutsig_0_11z = { in_data[19:16], celloutsig_0_8z } <<< { celloutsig_0_7z[4:1], celloutsig_0_5z };
  assign celloutsig_0_12z = { celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_5z } <<< { celloutsig_0_2z[3:1], celloutsig_0_5z };
  assign celloutsig_0_27z = { _05_[7:6], _02_[5:2], _01_, celloutsig_0_22z, celloutsig_0_17z, celloutsig_0_15z } <<< { celloutsig_0_23z[2:0], celloutsig_0_22z, celloutsig_0_1z, _06_, celloutsig_0_0z };
  assign celloutsig_0_33z = celloutsig_0_19z[15:5] - { celloutsig_0_25z[7:1], celloutsig_0_31z, celloutsig_0_22z, celloutsig_0_13z, celloutsig_0_13z };
  assign celloutsig_0_41z = { celloutsig_0_33z[5:4], celloutsig_0_2z } - { _07_[3:1], celloutsig_0_31z, celloutsig_0_34z, celloutsig_0_1z };
  assign celloutsig_0_7z = { celloutsig_0_2z[3:1], celloutsig_0_4z, celloutsig_0_4z } - in_data[90:86];
  assign celloutsig_0_19z = { celloutsig_0_12z[1:0], _05_[7:6], _02_[5:2], _01_, _02_[0], celloutsig_0_16z, celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_6z } - { in_data[37:33], celloutsig_0_15z, celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_3z };
  assign celloutsig_0_28z = { celloutsig_0_25z[8:7], celloutsig_0_8z, celloutsig_0_16z } - { celloutsig_0_2z[3:1], celloutsig_0_22z };
  assign celloutsig_0_36z = { celloutsig_0_3z, celloutsig_0_13z, celloutsig_0_33z, celloutsig_0_3z, celloutsig_0_18z, celloutsig_0_32z } ^ { celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_22z, celloutsig_0_17z, celloutsig_0_30z, celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_31z, celloutsig_0_3z, celloutsig_0_30z, celloutsig_0_24z, celloutsig_0_9z };
  assign celloutsig_0_40z = { celloutsig_0_36z[14:10], celloutsig_0_4z, celloutsig_0_4z, _07_, celloutsig_0_22z } ^ { celloutsig_0_36z[13:3], celloutsig_0_22z, celloutsig_0_16z };
  assign celloutsig_0_48z = { celloutsig_0_47z[4:0], celloutsig_0_35z, celloutsig_0_9z, celloutsig_0_46z, celloutsig_0_7z, celloutsig_0_34z, celloutsig_0_22z, celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_32z, celloutsig_0_34z, _06_, celloutsig_0_31z } ^ { celloutsig_0_23z[1:0], celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_14z, celloutsig_0_43z, celloutsig_0_40z, celloutsig_0_32z, celloutsig_0_42z };
  assign celloutsig_0_75z = { celloutsig_0_36z[19], celloutsig_0_6z, celloutsig_0_51z, celloutsig_0_15z, celloutsig_0_43z } ^ { celloutsig_0_2z[3:1], celloutsig_0_3z, celloutsig_0_34z };
  assign celloutsig_1_5z = { in_data[182:174], celloutsig_1_0z } ^ { in_data[187:177], celloutsig_1_2z };
  assign celloutsig_1_11z = { in_data[106:98], celloutsig_1_8z } ^ { in_data[148:142], celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_6z };
  assign celloutsig_1_10z[12:11] = { celloutsig_1_6z, celloutsig_1_3z } ^ { celloutsig_1_4z, celloutsig_1_6z };
  assign _02_[1] = _01_;
  assign _04_[22] = _00_;
  assign _05_[5:0] = { _02_[5:2], _01_, _02_[0] };
  assign celloutsig_1_10z[10:0] = 11'h000;
  assign { out_data[132:128], out_data[96], out_data[32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_74z, celloutsig_0_75z };
endmodule
