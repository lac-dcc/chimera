/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [7:0] _00_;
  reg [2:0] _01_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [4:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [14:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [3:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [4:0] celloutsig_0_21z;
  wire [2:0] celloutsig_0_22z;
  wire [6:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [7:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [10:0] celloutsig_0_34z;
  wire [13:0] celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire [2:0] celloutsig_0_38z;
  reg [4:0] celloutsig_0_39z;
  wire [7:0] celloutsig_0_3z;
  wire [5:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire [6:0] celloutsig_0_45z;
  wire [5:0] celloutsig_0_46z;
  wire [16:0] celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_54z;
  wire [17:0] celloutsig_0_56z;
  wire [9:0] celloutsig_0_57z;
  reg [7:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_63z;
  wire celloutsig_0_65z;
  reg [3:0] celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_72z;
  wire celloutsig_0_74z;
  wire celloutsig_0_77z;
  wire celloutsig_0_7z;
  wire celloutsig_0_80z;
  wire [19:0] celloutsig_0_85z;
  wire [5:0] celloutsig_0_8z;
  reg [2:0] celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire [2:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  reg [4:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [10:0] celloutsig_1_18z;
  wire [8:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [10:0] celloutsig_1_8z;
  wire [7:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_63z = celloutsig_0_59z[0] ? celloutsig_0_38z[0] : celloutsig_0_50z;
  assign celloutsig_0_7z = ~((celloutsig_0_0z | celloutsig_0_0z) & (celloutsig_0_3z[7] | celloutsig_0_4z));
  assign celloutsig_1_2z = ~((in_data[146] | celloutsig_1_1z) & (in_data[168] | celloutsig_1_1z));
  assign celloutsig_1_17z = ~((celloutsig_1_16z[3] | celloutsig_1_4z) & (celloutsig_1_4z | celloutsig_1_11z));
  assign celloutsig_0_20z = ~((celloutsig_0_17z[4] | celloutsig_0_15z) & (celloutsig_0_19z[3] | celloutsig_0_3z[2]));
  assign celloutsig_0_24z = ~((celloutsig_0_2z | celloutsig_0_4z) & (celloutsig_0_23z[3] | celloutsig_0_10z));
  assign celloutsig_0_27z = ~((celloutsig_0_20z | celloutsig_0_8z[0]) & (celloutsig_0_4z | celloutsig_0_10z));
  assign celloutsig_0_29z = celloutsig_0_3z[5] | ~(celloutsig_0_4z);
  reg [15:0] _10_;
  always_ff @(negedge clkin_data[96], negedge clkin_data[32])
    if (!clkin_data[32]) _10_ <= 16'h0000;
    else _10_ <= { celloutsig_0_47z[16:13], celloutsig_0_65z, celloutsig_0_28z, celloutsig_0_80z, celloutsig_0_63z, celloutsig_0_40z, celloutsig_0_7z, celloutsig_0_37z };
  assign out_data[47:32] = _10_;
  always_ff @(negedge clkin_data[128], negedge clkin_data[64])
    if (!clkin_data[64]) _00_ <= 8'h00;
    else _00_ <= celloutsig_1_8z[7:0];
  always_ff @(negedge clkin_data[128], negedge clkin_data[64])
    if (!clkin_data[64]) _01_ <= 3'h0;
    else _01_ <= { celloutsig_1_8z[6:5], celloutsig_1_6z };
  assign celloutsig_0_0z = in_data[68:56] >= in_data[66:54];
  assign celloutsig_0_43z = { celloutsig_0_34z[10:1], celloutsig_0_10z, celloutsig_0_40z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_19z, celloutsig_0_10z, celloutsig_0_23z } >= { celloutsig_0_40z, celloutsig_0_22z, celloutsig_0_37z, celloutsig_0_28z, celloutsig_0_26z, celloutsig_0_42z, celloutsig_0_14z, celloutsig_0_28z, celloutsig_0_39z, celloutsig_0_5z, celloutsig_0_20z, celloutsig_0_39z };
  assign celloutsig_0_15z = { celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_6z } >= { celloutsig_0_3z[3:1], celloutsig_0_12z };
  assign celloutsig_0_52z = ! { celloutsig_0_17z[9:3], celloutsig_0_39z, celloutsig_0_39z };
  assign celloutsig_0_65z = ! celloutsig_0_59z[5:1];
  assign celloutsig_0_74z = ! { celloutsig_0_19z[3:2], celloutsig_0_18z, celloutsig_0_70z, celloutsig_0_54z, celloutsig_0_7z, celloutsig_0_46z, celloutsig_0_15z, celloutsig_0_38z, celloutsig_0_26z };
  assign celloutsig_0_2z = ! in_data[50:48];
  assign celloutsig_0_26z = ! { celloutsig_0_17z[13:0], celloutsig_0_19z, celloutsig_0_10z, celloutsig_0_18z };
  assign celloutsig_0_28z = ! { in_data[57:56], celloutsig_0_1z };
  assign celloutsig_0_37z = { celloutsig_0_12z, celloutsig_0_29z, celloutsig_0_4z, celloutsig_0_31z, celloutsig_0_31z, celloutsig_0_18z, celloutsig_0_10z } || celloutsig_0_30z[7:1];
  assign celloutsig_0_16z = { celloutsig_0_8z[3:1], celloutsig_0_1z } || { celloutsig_0_8z[5:4], celloutsig_0_12z, celloutsig_0_0z };
  assign celloutsig_0_31z = { celloutsig_0_6z, celloutsig_0_24z, celloutsig_0_11z, celloutsig_0_16z } || celloutsig_0_30z[5:2];
  assign celloutsig_0_5z = { in_data[54:48], celloutsig_0_2z } < { celloutsig_0_3z[6:3], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_6z = in_data[25:19] < celloutsig_0_3z[7:1];
  assign celloutsig_0_72z = { celloutsig_0_3z[4:2], celloutsig_0_10z, celloutsig_0_10z } < in_data[77:73];
  assign celloutsig_0_77z = { celloutsig_0_45z[4:3], celloutsig_0_26z, celloutsig_0_22z, celloutsig_0_70z, celloutsig_0_44z, celloutsig_0_18z } < { celloutsig_0_30z[7:3], celloutsig_0_29z, celloutsig_0_12z, celloutsig_0_25z, celloutsig_0_7z };
  assign celloutsig_0_80z = { celloutsig_0_56z[9:7], celloutsig_0_19z, celloutsig_0_77z, celloutsig_0_27z, celloutsig_0_44z, celloutsig_0_63z, celloutsig_0_43z, celloutsig_0_74z } < { celloutsig_0_34z[6:0], celloutsig_0_74z, celloutsig_0_67z, celloutsig_0_72z };
  assign celloutsig_1_4z = { in_data[136:126], celloutsig_1_0z } < { in_data[165:153], celloutsig_1_1z };
  assign celloutsig_1_6z = { in_data[139:137], celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_3z } < { celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_1_14z = celloutsig_1_3z ? { in_data[107:106], celloutsig_1_4z } : celloutsig_1_9z[6:4];
  assign celloutsig_0_45z = ~ celloutsig_0_17z[7:1];
  assign celloutsig_0_85z = ~ { celloutsig_0_38z[1:0], celloutsig_0_56z };
  assign celloutsig_0_14z = ~ { celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_0_56z = { celloutsig_0_50z, celloutsig_0_46z, celloutsig_0_43z, celloutsig_0_12z, celloutsig_0_38z, celloutsig_0_14z, celloutsig_0_51z } | { celloutsig_0_14z[2:1], celloutsig_0_52z, celloutsig_0_12z, celloutsig_0_38z, celloutsig_0_23z, celloutsig_0_10z, celloutsig_0_24z, celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_41z = | celloutsig_0_3z;
  assign celloutsig_1_1z = | { in_data[111:104], celloutsig_1_0z };
  assign celloutsig_1_5z = | { in_data[111:110], celloutsig_1_1z, celloutsig_1_3z };
  assign celloutsig_0_11z = | { celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_8z };
  assign celloutsig_0_4z = in_data[35] & celloutsig_0_0z;
  assign celloutsig_0_44z = celloutsig_0_17z[9] & celloutsig_0_14z[0];
  assign celloutsig_0_49z = celloutsig_0_43z & celloutsig_0_18z;
  assign celloutsig_0_50z = celloutsig_0_12z & celloutsig_0_41z;
  assign celloutsig_1_7z = in_data[178] & celloutsig_1_2z;
  assign celloutsig_0_18z = celloutsig_0_11z & celloutsig_0_15z;
  assign celloutsig_0_25z = celloutsig_0_4z & celloutsig_0_11z;
  assign celloutsig_0_42z = | celloutsig_0_35z[11:9];
  assign celloutsig_0_54z = | in_data[25:22];
  assign celloutsig_1_13z = | { _01_, celloutsig_1_11z, _00_, celloutsig_1_9z, celloutsig_1_6z, celloutsig_1_5z };
  assign celloutsig_0_13z = | { celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_5z };
  assign celloutsig_0_32z = ~^ { celloutsig_0_23z[5:3], celloutsig_0_13z };
  assign celloutsig_1_15z = ~^ { celloutsig_1_0z[1:0], celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_0z, _00_, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_14z };
  assign celloutsig_0_1z = ~^ { in_data[55:46], celloutsig_0_0z };
  assign celloutsig_0_35z = { celloutsig_0_30z[7:4], celloutsig_0_31z, celloutsig_0_10z, celloutsig_0_12z, celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_19z, celloutsig_0_32z } >> { celloutsig_0_1z, celloutsig_0_33z, celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_21z, celloutsig_0_24z, celloutsig_0_26z, celloutsig_0_33z, celloutsig_0_31z, celloutsig_0_0z };
  assign celloutsig_0_38z = { celloutsig_0_21z[1], celloutsig_0_27z, celloutsig_0_18z } >> { celloutsig_0_35z[3:2], celloutsig_0_6z };
  assign celloutsig_0_8z = { in_data[49:45], celloutsig_0_4z } >> { celloutsig_0_3z[6], celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_19z = { celloutsig_0_8z[0], celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_15z } >> { celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_1z };
  assign celloutsig_0_23z = { celloutsig_0_22z[1:0], celloutsig_0_4z, celloutsig_0_20z, celloutsig_0_18z, celloutsig_0_12z, celloutsig_0_20z } >> { celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_22z, celloutsig_0_10z };
  assign celloutsig_0_30z = { celloutsig_0_19z[1:0], celloutsig_0_13z, celloutsig_0_14z } >> { celloutsig_0_3z[7:1], celloutsig_0_4z };
  assign celloutsig_0_47z = { celloutsig_0_33z, celloutsig_0_18z, celloutsig_0_16z, celloutsig_0_30z, celloutsig_0_13z, celloutsig_0_20z, celloutsig_0_29z, celloutsig_0_1z, celloutsig_0_29z, celloutsig_0_12z } >> { celloutsig_0_23z[6:5], celloutsig_0_17z };
  assign celloutsig_1_18z = { _00_[7:1], celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_17z, celloutsig_1_13z } <<< celloutsig_1_8z;
  assign celloutsig_1_19z = { celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_15z, celloutsig_1_5z, celloutsig_1_13z, _01_ } >>> { celloutsig_1_9z, celloutsig_1_3z };
  assign celloutsig_0_34z = in_data[70:60] - in_data[81:71];
  assign celloutsig_0_40z = { celloutsig_0_3z[4:0], celloutsig_0_0z } - in_data[46:41];
  assign celloutsig_0_57z = { celloutsig_0_17z[13:6], celloutsig_0_20z, celloutsig_0_0z } - { celloutsig_0_19z, celloutsig_0_1z, celloutsig_0_22z, celloutsig_0_43z, celloutsig_0_7z };
  assign celloutsig_1_8z = { celloutsig_1_0z[2], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_7z } - { in_data[191:186], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_1_9z = { in_data[140:135], celloutsig_1_4z, celloutsig_1_7z } - celloutsig_1_8z[7:0];
  assign celloutsig_0_21z = { celloutsig_0_19z, celloutsig_0_12z } - celloutsig_0_8z[4:0];
  assign celloutsig_0_22z = { celloutsig_0_3z[7:6], celloutsig_0_12z } - { celloutsig_0_21z[2:1], celloutsig_0_2z };
  assign celloutsig_0_3z = in_data[92:85] - in_data[28:21];
  assign celloutsig_0_46z = { celloutsig_0_34z[6:2], celloutsig_0_4z } ~^ { celloutsig_0_34z[10:6], celloutsig_0_37z };
  assign celloutsig_0_17z = { celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_16z } ^ { celloutsig_0_3z[7:1], celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_10z };
  assign celloutsig_0_51z = ~((celloutsig_0_19z[3] & celloutsig_0_49z) | celloutsig_0_5z);
  always_latch
    if (clkin_data[32]) celloutsig_0_39z = 5'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_39z = { celloutsig_0_21z[4], celloutsig_0_19z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_59z = 8'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_59z = celloutsig_0_57z[9:2];
  always_latch
    if (clkin_data[32]) celloutsig_0_67z = 4'h0;
    else if (celloutsig_1_19z[0]) celloutsig_0_67z = { celloutsig_0_34z[4:3], celloutsig_0_13z, celloutsig_0_33z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_0z = 3'h0;
    else if (clkin_data[0]) celloutsig_1_0z = in_data[128:126];
  always_latch
    if (clkin_data[64]) celloutsig_1_16z = 5'h00;
    else if (clkin_data[0]) celloutsig_1_16z = celloutsig_1_8z[7:3];
  assign celloutsig_0_33z = ~((celloutsig_0_18z & celloutsig_0_13z) | (celloutsig_0_6z & celloutsig_0_30z[5]));
  assign celloutsig_0_70z = ~((celloutsig_0_28z & celloutsig_0_0z) | (celloutsig_0_8z[3] & celloutsig_0_26z));
  assign celloutsig_0_10z = ~((celloutsig_0_0z & celloutsig_0_8z[1]) | (celloutsig_0_7z & celloutsig_0_3z[6]));
  assign celloutsig_1_3z = ~((celloutsig_1_2z & celloutsig_1_1z) | (celloutsig_1_1z & in_data[153]));
  assign celloutsig_1_11z = ~((in_data[171] & celloutsig_1_8z[5]) | (celloutsig_1_1z & celloutsig_1_6z));
  assign celloutsig_0_12z = ~((celloutsig_0_3z[3] & celloutsig_0_4z) | (celloutsig_0_5z & celloutsig_0_0z));
  assign { out_data[138:128], out_data[104:96], out_data[19:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_85z };
endmodule
