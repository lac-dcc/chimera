/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [4:0] _00_;
  reg [6:0] _01_;
  wire [8:0] celloutsig_0_0z;
  wire [15:0] celloutsig_0_10z;
  wire [21:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [23:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  reg [4:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [14:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [3:0] celloutsig_0_21z;
  wire [16:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [3:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [3:0] celloutsig_0_26z;
  wire [2:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [16:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [7:0] celloutsig_0_31z;
  wire [4:0] celloutsig_0_32z;
  wire [4:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [10:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [3:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [19:0] celloutsig_0_39z;
  wire [7:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [14:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire [42:0] celloutsig_0_46z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [6:0] celloutsig_0_52z;
  wire [14:0] celloutsig_0_53z;
  wire [4:0] celloutsig_0_54z;
  wire [2:0] celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire [27:0] celloutsig_0_62z;
  wire celloutsig_0_63z;
  wire [3:0] celloutsig_0_65z;
  wire celloutsig_0_66z;
  wire celloutsig_0_69z;
  wire celloutsig_0_70z;
  wire celloutsig_0_71z;
  wire [5:0] celloutsig_0_72z;
  wire [8:0] celloutsig_0_73z;
  wire celloutsig_0_74z;
  wire [3:0] celloutsig_0_7z;
  wire celloutsig_0_80z;
  wire celloutsig_0_81z;
  wire [2:0] celloutsig_0_84z;
  wire [3:0] celloutsig_0_85z;
  wire celloutsig_0_86z;
  wire celloutsig_0_87z;
  wire celloutsig_0_88z;
  wire celloutsig_0_92z;
  wire celloutsig_0_93z;
  wire [41:0] celloutsig_0_94z;
  wire [9:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_17z;
  wire [7:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [20:0] celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire [3:0] celloutsig_1_8z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_4z = ~in_data[60];
  assign celloutsig_0_58z = ~celloutsig_0_21z[2];
  assign celloutsig_0_66z = ~celloutsig_0_63z;
  assign celloutsig_1_10z = ~celloutsig_1_5z;
  assign celloutsig_0_5z = celloutsig_0_1z[9] | in_data[17];
  assign celloutsig_1_3z = celloutsig_1_2z[3] | celloutsig_1_0z;
  assign celloutsig_0_30z = celloutsig_0_11z[17] | celloutsig_0_27z[0];
  assign celloutsig_0_88z = celloutsig_0_16z[15] ^ celloutsig_0_46z[28];
  assign celloutsig_0_93z = celloutsig_0_66z ^ celloutsig_0_33z[4];
  assign celloutsig_1_17z = celloutsig_1_2z[2] ^ celloutsig_1_4z;
  assign celloutsig_0_14z = celloutsig_0_0z[4] ^ celloutsig_0_13z;
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _00_ <= 5'h00;
    else _00_ <= { celloutsig_0_21z[0], celloutsig_0_37z };
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _01_ <= 7'h00;
    else _01_ <= { in_data[58:54], celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_57z = in_data[58:56] / { 1'h1, celloutsig_0_10z[4], celloutsig_0_4z };
  assign celloutsig_0_62z = { celloutsig_0_53z[14:6], celloutsig_0_53z, celloutsig_0_58z, celloutsig_0_57z } / { 1'h1, celloutsig_0_41z[7:1], celloutsig_0_57z, celloutsig_0_54z, celloutsig_0_43z, celloutsig_0_45z, celloutsig_0_42z, 1'h0, celloutsig_0_30z, celloutsig_0_36z, celloutsig_0_33z, celloutsig_0_17z };
  assign celloutsig_0_43z = { celloutsig_0_11z[21:20], celloutsig_0_28z, celloutsig_0_23z } && celloutsig_0_39z[12:9];
  assign celloutsig_0_45z = { celloutsig_0_10z[11:9], celloutsig_0_40z, celloutsig_0_13z, celloutsig_0_41z, celloutsig_0_29z } && { celloutsig_0_27z[2:1], celloutsig_0_5z, celloutsig_0_20z, celloutsig_0_0z, celloutsig_0_14z, celloutsig_0_32z, celloutsig_0_28z, celloutsig_0_12z };
  assign celloutsig_0_87z = { celloutsig_0_11z[2:0], celloutsig_0_29z, celloutsig_0_7z } && { celloutsig_0_86z, celloutsig_0_32z, celloutsig_0_74z, celloutsig_0_50z };
  assign celloutsig_0_92z = { celloutsig_0_2z[2], celloutsig_0_34z, celloutsig_0_4z } && celloutsig_0_72z[2:0];
  assign celloutsig_0_19z = celloutsig_0_10z[4:0] && celloutsig_0_1z[9:5];
  assign celloutsig_0_23z = _01_[4:0] && { celloutsig_0_1z[3:0], celloutsig_0_17z };
  assign celloutsig_0_29z = { celloutsig_0_10z[5:3], celloutsig_0_15z } && { in_data[10:9], celloutsig_0_23z, celloutsig_0_12z };
  assign celloutsig_0_36z = { celloutsig_0_0z[6], celloutsig_0_24z } || { celloutsig_0_5z, celloutsig_0_27z, celloutsig_0_19z };
  assign celloutsig_0_70z = { in_data[10:7], _01_ } || { celloutsig_0_24z[1], celloutsig_0_65z, celloutsig_0_32z, celloutsig_0_42z };
  assign celloutsig_0_49z = { celloutsig_0_32z, celloutsig_0_15z, celloutsig_0_28z } < { celloutsig_0_2z[8:3], 1'h0 };
  assign celloutsig_0_50z = { _01_[3:1], celloutsig_0_44z } < { celloutsig_0_27z[1:0], celloutsig_0_40z, celloutsig_0_36z };
  assign celloutsig_0_63z = { celloutsig_0_16z[19:4], celloutsig_0_4z, celloutsig_0_5z } < { celloutsig_0_9z[9:6], celloutsig_0_32z, celloutsig_0_31z, 1'h0 };
  assign celloutsig_0_71z = { celloutsig_0_27z[2:1], celloutsig_0_69z } < { celloutsig_0_41z[6:5], celloutsig_0_40z };
  assign celloutsig_0_74z = { celloutsig_0_70z, celloutsig_0_28z, celloutsig_0_57z, celloutsig_0_37z, celloutsig_0_26z, celloutsig_0_45z } < { celloutsig_0_46z[30], celloutsig_0_46z[28:24], celloutsig_0_3z };
  assign celloutsig_1_19z = celloutsig_1_2z[4:2] < { celloutsig_1_6z[3:2], celloutsig_1_3z };
  assign celloutsig_0_12z = _01_ < { _01_[5:0], celloutsig_0_4z };
  assign celloutsig_0_20z = { _01_[5:0], celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_19z } < in_data[67:52];
  assign celloutsig_0_25z = celloutsig_0_10z[12:9] < celloutsig_0_16z[7:4];
  assign celloutsig_1_0z = in_data[164] & ~(in_data[128]);
  assign celloutsig_1_5z = celloutsig_1_1z[20] & ~(celloutsig_1_4z);
  assign celloutsig_0_37z = { celloutsig_0_18z[2:0], celloutsig_0_13z } % { 1'h1, celloutsig_0_3z[2:0] };
  assign celloutsig_0_53z = { celloutsig_0_11z[15:5], celloutsig_0_26z } % { 1'h1, celloutsig_0_1z[13:5], celloutsig_0_45z, celloutsig_0_29z, celloutsig_0_40z, celloutsig_0_14z, celloutsig_0_44z };
  assign celloutsig_1_8z = { celloutsig_1_6z[1:0], celloutsig_1_3z, celloutsig_1_4z } % { 1'h1, celloutsig_1_1z[16:15], in_data[96] };
  assign celloutsig_0_0z = in_data[63] ? in_data[56:48] : in_data[20:12];
  assign celloutsig_0_52z = in_data[48] ? { 1'h0, celloutsig_0_46z[38:33] } : celloutsig_0_31z[6:0];
  assign celloutsig_0_94z = celloutsig_0_18z[2] ? { celloutsig_0_62z[27:19], celloutsig_0_87z, celloutsig_0_88z, celloutsig_0_92z, celloutsig_0_80z, celloutsig_0_70z, celloutsig_0_72z, celloutsig_0_2z, celloutsig_0_32z } : { celloutsig_0_52z[6:1], celloutsig_0_73z, celloutsig_0_12z, celloutsig_0_85z, celloutsig_0_23z, celloutsig_0_39z[19:15], 1'h1, celloutsig_0_39z[13:7], 1'h1, celloutsig_0_39z[5], celloutsig_0_39z[5], celloutsig_0_39z[3:0], celloutsig_0_17z };
  assign celloutsig_0_86z = { celloutsig_0_32z, celloutsig_0_25z, celloutsig_0_81z, celloutsig_0_21z, 1'h0 } !== { celloutsig_0_7z[2:0], celloutsig_0_85z, celloutsig_0_33z };
  assign celloutsig_0_85z = ~ { celloutsig_0_27z[2], celloutsig_0_84z };
  assign celloutsig_1_2z = ~ in_data[111:103];
  assign celloutsig_0_22z = ~ { celloutsig_0_3z[5:1], celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_9z };
  assign celloutsig_0_35z = { celloutsig_0_22z[10:8], celloutsig_0_15z, _01_ } | { celloutsig_0_16z[20:11], celloutsig_0_4z };
  assign celloutsig_0_72z = celloutsig_0_41z[7:2] | { celloutsig_0_22z[8:7], celloutsig_0_71z, celloutsig_0_49z, celloutsig_0_66z, celloutsig_0_19z };
  assign celloutsig_0_9z = { celloutsig_0_7z[3:1], _01_ } | { in_data[71:70], celloutsig_0_3z };
  assign celloutsig_1_18z = { celloutsig_1_1z[16:15], celloutsig_1_17z, celloutsig_1_8z, celloutsig_1_3z } | { celloutsig_1_2z[7:3], celloutsig_1_17z, celloutsig_1_10z, celloutsig_1_17z };
  assign celloutsig_0_21z = { celloutsig_0_2z[3], celloutsig_0_20z, celloutsig_0_17z, celloutsig_0_4z } | celloutsig_0_16z[16:13];
  assign celloutsig_0_81z = | { celloutsig_0_57z, celloutsig_0_0z[8:1] };
  assign celloutsig_0_17z = | celloutsig_0_16z[11:8];
  assign celloutsig_0_38z = ^ { in_data[7:3], celloutsig_0_7z, celloutsig_0_7z };
  assign celloutsig_0_42z = ^ celloutsig_0_11z[20:11];
  assign celloutsig_0_69z = ^ celloutsig_0_22z[13:7];
  assign celloutsig_1_4z = ^ { celloutsig_1_1z[17:8], celloutsig_1_3z };
  assign celloutsig_0_28z = ^ celloutsig_0_10z[12:9];
  assign celloutsig_0_7z = in_data[89:86] >> celloutsig_0_3z[6:3];
  assign celloutsig_0_11z = { in_data[92:82], 1'h0, celloutsig_0_9z } >> in_data[66:45];
  assign celloutsig_0_1z = in_data[55:41] >> in_data[68:54];
  assign celloutsig_0_16z = { in_data[40:33], celloutsig_0_10z } >> { celloutsig_0_2z[6:0], celloutsig_0_2z };
  assign celloutsig_0_26z = celloutsig_0_11z[15:12] >> { celloutsig_0_1z[9], celloutsig_0_13z, celloutsig_0_20z, celloutsig_0_4z };
  assign celloutsig_0_27z = celloutsig_0_18z[2:0] >> celloutsig_0_9z[5:3];
  assign celloutsig_0_33z = celloutsig_0_16z[18:14] << { _01_[4:1], celloutsig_0_25z };
  assign celloutsig_0_3z = celloutsig_0_2z[11:4] << in_data[84:77];
  assign celloutsig_0_54z = celloutsig_0_33z << { celloutsig_0_13z, celloutsig_0_37z };
  assign celloutsig_0_73z = { celloutsig_0_0z[3:2], celloutsig_0_26z, celloutsig_0_27z } << { _01_[3:0], celloutsig_0_23z, celloutsig_0_21z };
  assign celloutsig_0_84z = celloutsig_0_18z[4:2] << celloutsig_0_10z[15:13];
  assign celloutsig_1_1z = { in_data[139:124], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } << in_data[186:166];
  assign celloutsig_1_6z = celloutsig_1_1z[18:14] << { in_data[167:165], celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_24z = { celloutsig_0_18z[3:1], celloutsig_0_4z } << celloutsig_0_11z[9:6];
  assign celloutsig_0_2z = { celloutsig_0_1z[7:6], celloutsig_0_1z } << { celloutsig_0_1z[2:1], celloutsig_0_1z };
  assign celloutsig_0_31z = celloutsig_0_3z << { _01_[3:1], celloutsig_0_7z, celloutsig_0_12z };
  assign celloutsig_0_32z = celloutsig_0_9z[6:2] << { celloutsig_0_11z[4:2], celloutsig_0_29z, celloutsig_0_17z };
  assign celloutsig_0_41z = { celloutsig_0_9z[9:1], celloutsig_0_14z, celloutsig_0_20z, celloutsig_0_26z } - { celloutsig_0_10z[12:5], celloutsig_0_38z, celloutsig_0_29z, celloutsig_0_4z, celloutsig_0_21z };
  assign celloutsig_0_65z = { celloutsig_0_9z[5:3], celloutsig_0_58z } - { celloutsig_0_1z[3:1], celloutsig_0_4z };
  assign celloutsig_0_10z = celloutsig_0_2z[15:0] - { celloutsig_0_5z, celloutsig_0_1z };
  assign celloutsig_0_34z = ~((in_data[37] & celloutsig_0_33z[3]) | celloutsig_0_19z);
  assign celloutsig_0_40z = ~((1'h0 & celloutsig_0_5z) | 1'h0);
  assign celloutsig_0_44z = ~((celloutsig_0_5z & celloutsig_0_3z[2]) | celloutsig_0_18z[1]);
  assign celloutsig_0_80z = ~((celloutsig_0_52z[3] & celloutsig_0_9z[8]) | _00_[0]);
  assign celloutsig_0_13z = ~((celloutsig_0_5z & celloutsig_0_7z[3]) | celloutsig_0_4z);
  assign celloutsig_0_15z = ~((celloutsig_0_3z[4] & celloutsig_0_7z[0]) | celloutsig_0_5z);
  always_latch
    if (!clkin_data[96]) celloutsig_0_18z = 5'h00;
    else if (!celloutsig_1_18z[0]) celloutsig_0_18z = _01_[6:2];
  assign { celloutsig_0_39z[19:15], celloutsig_0_39z[7], celloutsig_0_39z[8], celloutsig_0_39z[13:9], celloutsig_0_39z[5], celloutsig_0_39z[3:0] } = ~ { celloutsig_0_33z, celloutsig_0_28z, celloutsig_0_23z, celloutsig_0_18z, celloutsig_0_12z, celloutsig_0_7z };
  assign { celloutsig_0_46z[24], celloutsig_0_46z[1], celloutsig_0_46z[12:2], celloutsig_0_46z[13], celloutsig_0_46z[17:14], celloutsig_0_46z[22:18], celloutsig_0_46z[23], celloutsig_0_46z[42:40], celloutsig_0_46z[32], celloutsig_0_46z[33], celloutsig_0_46z[38:34], celloutsig_0_46z[30], celloutsig_0_46z[28:25], celloutsig_0_46z[0] } = ~ { celloutsig_0_45z, celloutsig_0_40z, celloutsig_0_35z, celloutsig_0_28z, celloutsig_0_27z, celloutsig_0_19z, celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_39z[17:15], celloutsig_0_39z[7], celloutsig_0_39z[8], celloutsig_0_39z[13:9], celloutsig_0_39z[5], celloutsig_0_39z[3:0], celloutsig_0_4z };
  assign { celloutsig_0_39z[14], celloutsig_0_39z[6], celloutsig_0_39z[4] } = { 2'h3, celloutsig_0_39z[5] };
  assign { celloutsig_0_46z[39], celloutsig_0_46z[31], celloutsig_0_46z[29] } = { 2'h0, celloutsig_0_46z[30] };
  assign { out_data[135:128], out_data[96], out_data[32:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_93z, celloutsig_0_94z[31:0] };
endmodule
