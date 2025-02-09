/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [5:0] _00_;
  reg [12:0] _01_;
  reg [3:0] _02_;
  reg [16:0] _03_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [2:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [4:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [2:0] celloutsig_0_24z;
  wire [13:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [31:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [5:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [22:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [10:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [14:0] celloutsig_0_42z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [4:0] celloutsig_0_49z;
  wire [14:0] celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire [7:0] celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire [5:0] celloutsig_0_54z;
  wire celloutsig_0_57z;
  wire [2:0] celloutsig_0_58z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_62z;
  wire celloutsig_0_65z;
  wire [23:0] celloutsig_0_66z;
  wire celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_75z;
  wire celloutsig_0_7z;
  wire [4:0] celloutsig_0_80z;
  wire celloutsig_0_82z;
  wire celloutsig_0_8z;
  wire celloutsig_0_98z;
  wire [23:0] celloutsig_0_99z;
  wire celloutsig_0_9z;
  wire [3:0] celloutsig_1_0z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [3:0] celloutsig_1_2z;
  wire [5:0] celloutsig_1_3z;
  wire [9:0] celloutsig_1_4z;
  wire celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_39z = ~(celloutsig_0_19z | celloutsig_0_5z);
  assign celloutsig_0_46z = ~(celloutsig_0_0z | celloutsig_0_20z);
  assign celloutsig_0_47z = ~(celloutsig_0_45z | celloutsig_0_17z);
  assign celloutsig_0_51z = ~(celloutsig_0_36z | celloutsig_0_15z);
  assign celloutsig_0_59z = ~(celloutsig_0_5z | celloutsig_0_38z[18]);
  assign celloutsig_0_62z = ~(celloutsig_0_27z | celloutsig_0_9z);
  assign celloutsig_1_8z = ~(in_data[140] | celloutsig_1_0z[3]);
  assign celloutsig_0_13z = ~(celloutsig_0_2z | celloutsig_0_7z);
  assign celloutsig_0_19z = ~(celloutsig_0_2z | celloutsig_0_10z);
  assign celloutsig_0_41z = ~((in_data[17] | celloutsig_0_33z[12]) & celloutsig_0_2z);
  assign celloutsig_0_7z = ~((celloutsig_0_3z | celloutsig_0_0z) & celloutsig_0_0z);
  assign celloutsig_0_65z = ~((celloutsig_0_19z | celloutsig_0_58z[1]) & celloutsig_0_25z[8]);
  assign celloutsig_0_20z = ~((celloutsig_0_17z | celloutsig_0_13z) & celloutsig_0_13z);
  assign celloutsig_0_30z = ~((celloutsig_0_28z | celloutsig_0_9z) & celloutsig_0_26z);
  assign celloutsig_1_1z = in_data[161] | in_data[181];
  assign celloutsig_0_15z = celloutsig_0_4z[14] | celloutsig_0_3z;
  assign celloutsig_0_17z = celloutsig_0_15z | celloutsig_0_16z;
  assign celloutsig_0_53z = celloutsig_0_16z ^ celloutsig_0_18z;
  assign celloutsig_0_61z = celloutsig_0_1z ^ celloutsig_0_4z[2];
  assign celloutsig_0_75z = celloutsig_0_18z ^ celloutsig_0_66z[14];
  always_ff @(negedge clkin_data[32], posedge celloutsig_1_19z[0])
    if (celloutsig_1_19z[0]) _00_ <= 6'h00;
    else _00_ <= { celloutsig_0_35z[5:2], celloutsig_0_53z, celloutsig_0_7z };
  always_ff @(posedge clkin_data[32], negedge clkin_data[64])
    if (!clkin_data[64]) _01_ <= 13'h0000;
    else _01_ <= { _00_[3:0], celloutsig_0_20z, celloutsig_0_49z, celloutsig_0_17z, celloutsig_0_41z, celloutsig_0_7z };
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _02_ <= 4'h0;
    else _02_ <= { celloutsig_0_38z[14:13], celloutsig_0_67z, celloutsig_0_28z };
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _03_ <= 17'h00000;
    else _03_ <= { celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_24z, celloutsig_0_54z, celloutsig_0_22z };
  assign celloutsig_0_0z = ! in_data[7:3];
  assign celloutsig_0_37z = ! { celloutsig_0_33z[27], celloutsig_0_21z, celloutsig_0_27z, celloutsig_0_12z[2:1], celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_30z, celloutsig_0_31z };
  assign celloutsig_0_67z = ! { _00_[1:0], celloutsig_0_21z, celloutsig_0_44z, celloutsig_0_65z, celloutsig_0_62z, celloutsig_0_3z, celloutsig_0_57z, celloutsig_0_18z, celloutsig_0_5z, celloutsig_0_44z, celloutsig_0_15z, celloutsig_0_11z };
  assign celloutsig_0_8z = ! in_data[11:2];
  assign celloutsig_0_9z = ! { celloutsig_0_4z[3:1], celloutsig_0_2z };
  assign celloutsig_0_10z = ! { celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_1z = ! { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_2z = ! { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_18z = ! { celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_16z };
  assign celloutsig_0_21z = ! { celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_18z, celloutsig_0_14z };
  assign celloutsig_0_26z = ! { celloutsig_0_22z, celloutsig_0_21z, celloutsig_0_6z };
  assign celloutsig_0_27z = ! { celloutsig_0_25z[12:7], celloutsig_0_14z, celloutsig_0_5z };
  assign celloutsig_0_31z = ! { in_data[36:33], celloutsig_0_7z, celloutsig_0_27z, celloutsig_0_15z, celloutsig_0_24z };
  assign celloutsig_0_32z = ! { celloutsig_0_7z, celloutsig_0_22z, celloutsig_0_3z };
  assign celloutsig_0_34z = ! { celloutsig_0_1z, celloutsig_0_31z, celloutsig_0_26z };
  assign celloutsig_0_36z = { celloutsig_0_33z[20:11], celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_18z, celloutsig_0_10z } < { celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_28z };
  assign celloutsig_0_5z = in_data[15:13] < { in_data[72:71], celloutsig_0_1z };
  assign celloutsig_0_45z = { celloutsig_0_40z[9:1], celloutsig_0_5z, celloutsig_0_16z, celloutsig_0_35z[5:1], celloutsig_0_27z } < { celloutsig_0_25z[12:3], celloutsig_0_36z, celloutsig_0_35z[5:1], celloutsig_0_27z };
  assign celloutsig_0_57z = { celloutsig_0_22z[1], celloutsig_0_28z, celloutsig_0_0z } < { celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_28z };
  assign celloutsig_0_82z = { celloutsig_0_80z[3:2], celloutsig_0_30z } < { celloutsig_0_75z, celloutsig_0_23z, celloutsig_0_67z };
  assign celloutsig_0_11z = { celloutsig_0_4z[10:6], celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_8z } < { in_data[32:25], celloutsig_0_10z };
  assign celloutsig_0_98z = { _03_[8:5], celloutsig_0_82z } < { celloutsig_0_25z[1], _02_ };
  assign celloutsig_1_17z = { celloutsig_1_4z, celloutsig_1_4z } < { in_data[118:100], celloutsig_1_8z };
  assign celloutsig_0_14z = { celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_2z } < { celloutsig_0_4z[11:7], celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_0z };
  assign celloutsig_0_16z = { in_data[87:67], celloutsig_0_11z, celloutsig_0_1z } < { in_data[91:72], celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_9z };
  assign celloutsig_0_28z = { celloutsig_0_23z, celloutsig_0_12z[2:1], celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_18z } < { celloutsig_0_22z[3:2], celloutsig_0_7z, celloutsig_0_26z, celloutsig_0_11z, celloutsig_0_17z, celloutsig_0_0z };
  assign celloutsig_0_29z = { celloutsig_0_19z, celloutsig_0_6z, celloutsig_0_20z, celloutsig_0_13z, celloutsig_0_23z, celloutsig_0_22z, celloutsig_0_8z, celloutsig_0_24z, celloutsig_0_19z, celloutsig_0_9z } < { celloutsig_0_4z, celloutsig_0_2z };
  assign celloutsig_0_6z = celloutsig_0_1z & ~(celloutsig_0_5z);
  assign celloutsig_0_23z = celloutsig_0_13z & ~(celloutsig_0_19z);
  assign celloutsig_0_38z = { in_data[79:61], celloutsig_0_28z, celloutsig_0_17z, celloutsig_0_13z, celloutsig_0_32z } % { 1'h1, in_data[26], celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_36z, celloutsig_0_19z, celloutsig_0_27z, celloutsig_0_10z, celloutsig_0_2z };
  assign celloutsig_0_49z = celloutsig_0_4z[7:3] % { 1'h1, celloutsig_0_12z[1], celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_31z };
  assign celloutsig_0_54z = { celloutsig_0_46z, celloutsig_0_34z, celloutsig_0_24z, celloutsig_0_41z } % { 1'h1, in_data[80:79], celloutsig_0_19z, celloutsig_0_44z, celloutsig_0_53z };
  assign celloutsig_0_80z = { celloutsig_0_58z[0], celloutsig_0_47z, celloutsig_0_28z, celloutsig_0_6z, celloutsig_0_6z } % { 1'h1, _00_[3:2], celloutsig_0_61z, celloutsig_0_1z };
  assign celloutsig_0_99z = { celloutsig_0_80z, celloutsig_0_42z[14:1], celloutsig_0_20z, celloutsig_0_51z, celloutsig_0_58z } % { 1'h1, _01_[8:2], _02_, _02_, celloutsig_0_80z, celloutsig_0_13z, celloutsig_0_61z, celloutsig_0_59z };
  assign celloutsig_1_3z = in_data[136:131] % { 1'h1, celloutsig_1_0z[1], celloutsig_1_0z };
  assign celloutsig_1_19z = { celloutsig_1_0z[2:1], celloutsig_1_17z } % { 1'h1, celloutsig_1_2z[2:1] };
  assign celloutsig_0_22z = { celloutsig_0_4z[11:9], celloutsig_0_11z, celloutsig_0_0z } % { 1'h1, celloutsig_0_19z, celloutsig_0_21z, celloutsig_0_10z, celloutsig_0_19z };
  assign celloutsig_0_25z = { celloutsig_0_22z, celloutsig_0_10z, celloutsig_0_21z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_19z, celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_10z } % { 1'h1, celloutsig_0_22z[3:1], celloutsig_0_22z, celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_23z };
  assign celloutsig_0_40z = celloutsig_0_3z ? { celloutsig_0_33z[18:11], celloutsig_0_32z, celloutsig_0_14z, celloutsig_0_13z } : { celloutsig_0_33z[9:7], celloutsig_0_24z, celloutsig_0_27z, celloutsig_0_9z, celloutsig_0_29z, celloutsig_0_7z, celloutsig_0_7z };
  assign celloutsig_0_42z[14:1] = celloutsig_0_28z ? { celloutsig_0_38z[21:10], celloutsig_0_10z, celloutsig_0_3z } : { celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_37z, celloutsig_0_36z, celloutsig_0_36z, celloutsig_0_23z, celloutsig_0_29z, celloutsig_0_8z, celloutsig_0_2z };
  assign celloutsig_0_52z = celloutsig_0_6z ? { celloutsig_0_33z[9:5], celloutsig_0_10z, celloutsig_0_26z, celloutsig_0_30z } : { celloutsig_0_10z, celloutsig_0_35z[5:1], celloutsig_0_27z, celloutsig_0_39z };
  assign celloutsig_0_12z[2:1] = celloutsig_0_10z ? { 1'h1, celloutsig_0_8z } : { celloutsig_0_11z, celloutsig_0_6z };
  assign celloutsig_1_4z = celloutsig_1_0z[1] ? { in_data[108:100], celloutsig_1_1z } : { in_data[128:123], celloutsig_1_0z[3:2], 1'h0, celloutsig_1_0z[0] };
  assign celloutsig_0_33z = celloutsig_0_27z ? in_data[57:26] : { in_data[19:17], celloutsig_0_24z, celloutsig_0_14z, celloutsig_0_26z, celloutsig_0_22z, celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_21z, 1'h0, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_17z, celloutsig_0_19z, celloutsig_0_10z, celloutsig_0_31z, celloutsig_0_19z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_20z, celloutsig_0_9z, celloutsig_0_32z, celloutsig_0_2z, celloutsig_0_23z };
  assign celloutsig_0_35z[5:1] = celloutsig_0_17z ? { celloutsig_0_28z, celloutsig_0_31z, celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_10z } : { celloutsig_0_0z, celloutsig_0_26z, celloutsig_0_19z, celloutsig_0_23z, celloutsig_0_31z };
  assign celloutsig_0_58z = { celloutsig_0_36z, celloutsig_0_23z, celloutsig_0_8z } | celloutsig_0_52z[3:1];
  assign celloutsig_0_66z = { celloutsig_0_12z[2], celloutsig_0_38z } | { celloutsig_0_25z[10:0], celloutsig_0_26z, celloutsig_0_22z, celloutsig_0_31z, celloutsig_0_65z, celloutsig_0_53z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_51z, celloutsig_0_65z };
  assign celloutsig_1_0z = in_data[167:164] | in_data[168:165];
  assign celloutsig_1_2z = in_data[191:188] | in_data[116:113];
  assign celloutsig_0_24z = { celloutsig_0_4z[14], celloutsig_0_10z, celloutsig_0_20z } | { celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_15z };
  assign celloutsig_0_4z = { in_data[69:58], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z } | { in_data[37:24], celloutsig_0_3z };
  assign celloutsig_0_44z = | { celloutsig_0_20z, celloutsig_0_6z, celloutsig_0_28z, celloutsig_0_29z, celloutsig_0_30z };
  assign celloutsig_1_16z = | celloutsig_1_3z[4:0];
  assign celloutsig_1_18z = | { in_data[108:105], celloutsig_1_3z, celloutsig_1_16z };
  assign celloutsig_0_3z = | in_data[8:6];
  assign celloutsig_0_12z[0] = celloutsig_0_11z;
  assign celloutsig_0_35z[0] = celloutsig_0_27z;
  assign celloutsig_0_42z[0] = celloutsig_0_20z;
  assign { out_data[128], out_data[98:96], out_data[32], out_data[23:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_98z, celloutsig_0_99z };
endmodule
