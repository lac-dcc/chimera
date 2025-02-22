/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [7:0] _01_;
  reg [17:0] _02_;
  wire celloutsig_0_0z;
  wire [17:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire [5:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [6:0] celloutsig_0_20z;
  wire [16:0] celloutsig_0_21z;
  wire [2:0] celloutsig_0_22z;
  wire [4:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [13:0] celloutsig_0_33z;
  wire [5:0] celloutsig_0_34z;
  wire [11:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [6:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_54z;
  wire celloutsig_0_58z;
  wire [4:0] celloutsig_0_59z;
  wire [8:0] celloutsig_0_5z;
  wire [14:0] celloutsig_0_6z;
  wire [26:0] celloutsig_0_71z;
  wire celloutsig_0_7z;
  wire [28:0] celloutsig_0_81z;
  wire celloutsig_0_8z;
  wire celloutsig_0_90z;
  wire celloutsig_0_91z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [14:0] celloutsig_1_13z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire [5:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_9z = celloutsig_0_7z ? in_data[86] : celloutsig_0_4z;
  assign celloutsig_0_38z = !(celloutsig_0_5z[6] ? celloutsig_0_3z : celloutsig_0_32z);
  assign celloutsig_0_14z = !(celloutsig_0_6z[12] ? celloutsig_0_9z : celloutsig_0_5z[8]);
  assign celloutsig_0_54z = ~celloutsig_0_49z;
  assign celloutsig_0_91z = ~celloutsig_0_34z[2];
  assign celloutsig_0_41z = celloutsig_0_4z ^ celloutsig_0_5z[5];
  assign celloutsig_1_4z = ~(_00_ ^ in_data[187]);
  assign celloutsig_0_34z = { celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_32z, celloutsig_0_25z, celloutsig_0_25z } + { celloutsig_0_18z[2], celloutsig_0_23z };
  assign celloutsig_0_71z = { celloutsig_0_6z[12:10], celloutsig_0_17z, celloutsig_0_43z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_41z, celloutsig_0_12z, celloutsig_0_38z, celloutsig_0_39z, celloutsig_0_17z, celloutsig_0_38z, celloutsig_0_43z, celloutsig_0_47z, celloutsig_0_32z, celloutsig_0_25z, celloutsig_0_54z, celloutsig_0_43z, celloutsig_0_18z, celloutsig_0_52z, celloutsig_0_3z } + { celloutsig_0_10z[16:5], celloutsig_0_31z, celloutsig_0_31z, celloutsig_0_20z, celloutsig_0_59z, celloutsig_0_8z };
  assign celloutsig_1_5z = { in_data[161:154], celloutsig_1_1z } + in_data[154:146];
  reg [7:0] _13_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _13_ <= 8'h00;
    else _13_ <= { in_data[173:167], celloutsig_1_1z };
  assign { _00_, _01_[6:0] } = _13_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _02_ <= 18'h00000;
    else _02_ <= { celloutsig_0_10z[4:1], celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_5z };
  assign celloutsig_0_36z = { celloutsig_0_4z, celloutsig_0_32z, celloutsig_0_26z, celloutsig_0_28z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_22z } == { celloutsig_0_21z[15:14], celloutsig_0_1z, celloutsig_0_23z, celloutsig_0_0z };
  assign celloutsig_0_52z = { celloutsig_0_21z[15:11], celloutsig_0_40z, celloutsig_0_22z } == { celloutsig_0_6z[3:1], celloutsig_0_0z, celloutsig_0_51z, celloutsig_0_45z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_25z };
  assign celloutsig_1_0z = in_data[132:127] == in_data[156:151];
  assign celloutsig_0_47z = { celloutsig_0_35z[9:7], celloutsig_0_17z, celloutsig_0_28z, celloutsig_0_22z, celloutsig_0_37z, celloutsig_0_3z } === { celloutsig_0_5z[7:1], celloutsig_0_29z, celloutsig_0_38z, celloutsig_0_30z };
  assign celloutsig_0_26z = { celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_11z } === { celloutsig_0_23z[1:0], celloutsig_0_0z };
  assign celloutsig_0_32z = _02_[16:0] >= { celloutsig_0_10z[13:4], celloutsig_0_29z, celloutsig_0_8z, celloutsig_0_31z, celloutsig_0_4z, celloutsig_0_24z, celloutsig_0_28z, celloutsig_0_11z };
  assign celloutsig_1_12z = { in_data[167:156], celloutsig_1_5z } >= { celloutsig_1_11z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_10z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_5z };
  assign celloutsig_0_25z = { celloutsig_0_18z[3:2], celloutsig_0_19z, _02_ } >= { celloutsig_0_22z[1:0], celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_15z, celloutsig_0_23z, celloutsig_0_7z };
  assign celloutsig_0_45z = celloutsig_0_42z[2:0] && celloutsig_0_10z[8:6];
  assign celloutsig_0_49z = { celloutsig_0_21z[12:5], celloutsig_0_23z } && { celloutsig_0_6z[9:0], celloutsig_0_31z, celloutsig_0_1z, celloutsig_0_12z };
  assign celloutsig_0_8z = in_data[72:66] && { celloutsig_0_6z[13:11], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_1_19z = celloutsig_1_11z && { celloutsig_1_12z, celloutsig_1_12z, celloutsig_1_16z };
  assign celloutsig_0_37z = { celloutsig_0_21z[16:10], celloutsig_0_36z } || celloutsig_0_6z[9:2];
  assign celloutsig_1_1z = { in_data[111:110], celloutsig_1_0z } || in_data[171:169];
  assign celloutsig_0_11z = { celloutsig_0_10z[14:2], celloutsig_0_3z, celloutsig_0_9z } || in_data[37:23];
  assign celloutsig_0_12z = { celloutsig_0_6z[12:5], celloutsig_0_1z } || { celloutsig_0_10z[15:8], celloutsig_0_9z };
  assign celloutsig_0_2z = { in_data[55:43], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z } || in_data[17:2];
  assign celloutsig_0_31z = celloutsig_0_28z & ~(celloutsig_0_26z);
  assign celloutsig_0_90z = celloutsig_0_81z[14] & ~(celloutsig_0_21z[5]);
  assign celloutsig_1_17z = in_data[150] & ~(celloutsig_1_9z);
  assign celloutsig_0_15z = celloutsig_0_9z & ~(celloutsig_0_14z);
  assign celloutsig_0_1z = in_data[61] & ~(celloutsig_0_0z);
  assign celloutsig_0_28z = celloutsig_0_3z & ~(celloutsig_0_20z[4]);
  assign celloutsig_0_20z = celloutsig_0_18z[4] ? { celloutsig_0_10z[10:5], celloutsig_0_1z } : { in_data[78:74], celloutsig_0_15z, celloutsig_0_4z };
  assign celloutsig_0_23z = celloutsig_0_18z[2] ? { _02_[10:9], celloutsig_0_1z, celloutsig_0_14z, celloutsig_0_4z } : { 1'h0, celloutsig_0_18z[1], celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_12z };
  assign celloutsig_0_43z = celloutsig_0_42z[6:1] != { in_data[77:76], celloutsig_0_22z, celloutsig_0_39z };
  assign celloutsig_0_4z = { celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z } != { celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_0_51z = { celloutsig_0_33z[10], celloutsig_0_18z } != { celloutsig_0_47z, celloutsig_0_31z, celloutsig_0_37z, celloutsig_0_37z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_30z };
  assign celloutsig_1_16z = { celloutsig_1_11z, celloutsig_1_10z } != celloutsig_1_5z[3:0];
  assign celloutsig_0_19z = { celloutsig_0_10z[3:1], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_11z } != { celloutsig_0_10z[11:9], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_7z };
  assign celloutsig_0_24z = celloutsig_0_6z[10:0] != { celloutsig_0_6z[13:11], celloutsig_0_20z, celloutsig_0_1z };
  assign celloutsig_0_81z = - { celloutsig_0_71z[15:10], celloutsig_0_52z, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_36z, celloutsig_0_51z };
  assign celloutsig_1_13z = - { in_data[183:170], celloutsig_1_7z };
  assign celloutsig_0_33z = { celloutsig_0_10z[16:12], celloutsig_0_30z, celloutsig_0_3z, celloutsig_0_23z, celloutsig_0_25z, celloutsig_0_11z } | { celloutsig_0_10z[12:5], celloutsig_0_14z, celloutsig_0_17z, celloutsig_0_13z, celloutsig_0_12z, celloutsig_0_28z, celloutsig_0_24z };
  assign celloutsig_0_5z = { celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_4z } | in_data[44:36];
  assign celloutsig_0_6z = { celloutsig_0_5z[3:0], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z } | { in_data[78:68], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_1_6z = { _00_, _01_[6:3], celloutsig_1_1z } | { _00_, _01_[6:3], celloutsig_1_4z };
  assign celloutsig_0_39z = celloutsig_0_3z & celloutsig_0_33z[8];
  assign celloutsig_0_40z = celloutsig_0_25z & celloutsig_0_5z[2];
  assign celloutsig_0_48z = celloutsig_0_47z & celloutsig_0_14z;
  assign celloutsig_0_58z = celloutsig_0_48z & celloutsig_0_18z[4];
  assign celloutsig_1_9z = in_data[187] & celloutsig_1_1z;
  assign celloutsig_0_13z = celloutsig_0_8z & celloutsig_0_10z[5];
  assign celloutsig_0_17z = celloutsig_0_2z & celloutsig_0_4z;
  assign celloutsig_0_29z = celloutsig_0_8z & celloutsig_0_13z;
  assign celloutsig_0_3z = | in_data[93:91];
  assign celloutsig_1_2z = | { celloutsig_1_1z, celloutsig_1_0z, in_data[106:105] };
  assign celloutsig_1_10z = | in_data[150:113];
  assign celloutsig_0_30z = | { celloutsig_0_24z, celloutsig_0_22z, celloutsig_0_21z[12], celloutsig_0_17z, celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_7z, in_data[93:91] };
  assign celloutsig_0_42z = { celloutsig_0_25z, celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_19z, celloutsig_0_26z } >> { celloutsig_0_6z[9:4], celloutsig_0_1z };
  assign celloutsig_0_59z = { _02_[11:8], celloutsig_0_19z } >> { celloutsig_0_54z, celloutsig_0_41z, celloutsig_0_58z, celloutsig_0_43z, celloutsig_0_24z };
  assign celloutsig_1_11z = { celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_0z } >> { in_data[147:146], celloutsig_1_7z };
  assign celloutsig_0_18z = { celloutsig_0_5z[5:4], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_15z } >> celloutsig_0_5z[7:2];
  assign celloutsig_0_22z = { celloutsig_0_5z[8:7], celloutsig_0_7z } <<< { in_data[76:75], celloutsig_0_2z };
  assign celloutsig_0_35z = { celloutsig_0_21z[12:7], celloutsig_0_29z, celloutsig_0_15z, celloutsig_0_22z, celloutsig_0_32z } - { celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_28z, celloutsig_0_30z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_23z };
  assign celloutsig_0_21z = { _02_[16:2], celloutsig_0_1z, celloutsig_0_11z } - { celloutsig_0_20z, celloutsig_0_5z, celloutsig_0_1z };
  assign celloutsig_0_10z = { celloutsig_0_6z[10:2], celloutsig_0_5z } ^ { celloutsig_0_5z[5:2], celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_7z = ~((celloutsig_0_5z[6] & celloutsig_0_2z) | celloutsig_0_3z);
  assign celloutsig_1_8z = ~((celloutsig_1_6z[1] & celloutsig_1_0z) | celloutsig_1_2z);
  assign celloutsig_0_0z = ~((in_data[69] & in_data[70]) | (in_data[65] & in_data[84]));
  assign celloutsig_1_7z = ~((celloutsig_1_4z & in_data[166]) | (celloutsig_1_6z[4] & celloutsig_1_2z));
  assign celloutsig_1_18z = ~((celloutsig_1_17z & celloutsig_1_10z) | (celloutsig_1_16z & celloutsig_1_13z[11]));
  assign _01_[7] = _00_;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_90z, celloutsig_0_91z };
endmodule
