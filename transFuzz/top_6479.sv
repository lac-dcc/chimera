/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [8:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [4:0] celloutsig_0_12z;
  reg [10:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [5:0] celloutsig_0_15z;
  wire [5:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [16:0] celloutsig_0_1z;
  wire [2:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [3:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [3:0] celloutsig_0_29z;
  wire [4:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [9:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [11:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_37z;
  wire [2:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  reg [4:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  reg [18:0] celloutsig_0_43z;
  wire [7:0] celloutsig_0_44z;
  reg [24:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [3:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [3:0] celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_56z;
  wire celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire [3:0] celloutsig_0_61z;
  wire [6:0] celloutsig_0_62z;
  wire [20:0] celloutsig_0_6z;
  wire celloutsig_0_78z;
  wire celloutsig_0_79z;
  wire [4:0] celloutsig_0_7z;
  wire celloutsig_0_83z;
  wire celloutsig_0_88z;
  wire celloutsig_0_89z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [5:0] celloutsig_1_0z;
  reg [6:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [15:0] celloutsig_1_17z;
  wire [13:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire [6:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_23z = ~(celloutsig_0_11z & celloutsig_0_18z);
  assign celloutsig_0_34z = ~(celloutsig_0_20z[2] | celloutsig_0_33z[8]);
  assign celloutsig_0_9z = ~(celloutsig_0_4z[1] | celloutsig_0_5z);
  assign celloutsig_0_83z = ~((celloutsig_0_30z | celloutsig_0_9z) & (celloutsig_0_62z[5] | celloutsig_0_58z));
  assign celloutsig_0_26z = ~((celloutsig_0_4z[1] | celloutsig_0_5z) & (celloutsig_0_18z | celloutsig_0_8z));
  assign celloutsig_0_0z = in_data[81] | in_data[32];
  assign celloutsig_0_42z = celloutsig_0_8z | celloutsig_0_25z;
  assign celloutsig_0_88z = celloutsig_0_61z[1] | celloutsig_0_46z[10];
  assign celloutsig_1_1z = in_data[178] ^ celloutsig_1_0z[4];
  assign celloutsig_0_44z = { celloutsig_0_10z[7], celloutsig_0_40z, celloutsig_0_25z, celloutsig_0_19z, celloutsig_0_32z, celloutsig_0_20z } + { celloutsig_0_37z, celloutsig_0_7z, celloutsig_0_21z, celloutsig_0_39z };
  assign celloutsig_0_61z = { celloutsig_0_12z[2:0], celloutsig_0_5z } + { celloutsig_0_40z, celloutsig_0_50z, celloutsig_0_3z, celloutsig_0_28z };
  assign celloutsig_0_62z = { celloutsig_0_21z, celloutsig_0_19z, celloutsig_0_28z, celloutsig_0_21z, celloutsig_0_58z, celloutsig_0_34z, celloutsig_0_40z } + { celloutsig_0_40z, celloutsig_0_56z, celloutsig_0_7z };
  assign celloutsig_0_7z = celloutsig_0_6z[16:12] + celloutsig_0_2z;
  assign celloutsig_1_0z = in_data[109:104] + in_data[142:137];
  assign celloutsig_0_38z = { celloutsig_0_29z[3:2], celloutsig_0_24z } & celloutsig_0_6z[14:12];
  assign celloutsig_0_4z = celloutsig_0_2z[4:1] & celloutsig_0_2z[3:0];
  assign celloutsig_0_10z = { celloutsig_0_4z[2:0], celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_5z } & { celloutsig_0_7z[4:2], celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_1_5z = { in_data[122], celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_3z } & { celloutsig_1_4z[0], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_1_18z = in_data[187:174] & { celloutsig_1_17z[15:5], celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_9z };
  assign celloutsig_0_15z = { celloutsig_0_12z, celloutsig_0_14z } & { in_data[66], celloutsig_0_12z };
  assign celloutsig_1_17z = { celloutsig_1_11z[4], celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_2z } / { 1'h1, celloutsig_1_0z[4:0], celloutsig_1_0z, celloutsig_1_9z, celloutsig_1_1z, celloutsig_1_9z, in_data[96] };
  assign celloutsig_0_31z = { celloutsig_0_15z, celloutsig_0_21z, celloutsig_0_30z, celloutsig_0_5z, celloutsig_0_26z } / { 1'h1, celloutsig_0_1z[2:0], celloutsig_0_0z, celloutsig_0_12z };
  assign celloutsig_0_40z = { celloutsig_0_13z[6:1], celloutsig_0_14z, celloutsig_0_9z } == { celloutsig_0_33z[10:4], celloutsig_0_21z };
  assign celloutsig_0_24z = { in_data[23:10], celloutsig_0_20z, celloutsig_0_14z, celloutsig_0_19z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_23z, celloutsig_0_19z, celloutsig_0_20z, celloutsig_0_19z } == { celloutsig_0_22z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_1_3z = in_data[157:137] === in_data[123:103];
  assign celloutsig_1_12z = { celloutsig_1_4z[2], celloutsig_1_3z, celloutsig_1_3z } === { celloutsig_1_0z[3:2], celloutsig_1_9z };
  assign celloutsig_0_18z = { celloutsig_0_4z[2], celloutsig_0_5z, celloutsig_0_9z } >= { celloutsig_0_15z[1:0], celloutsig_0_3z };
  assign celloutsig_0_19z = { celloutsig_0_13z[10:2], celloutsig_0_18z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_9z, celloutsig_0_8z } >= { celloutsig_0_6z[16:2], celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_0z };
  assign celloutsig_0_30z = { celloutsig_0_6z[7], celloutsig_0_7z, celloutsig_0_24z } >= { celloutsig_0_1z[15:11], celloutsig_0_24z, celloutsig_0_23z };
  assign celloutsig_0_32z = celloutsig_0_31z[5:1] >= celloutsig_0_1z[8:4];
  assign celloutsig_1_9z = celloutsig_1_8z[6:1] > { celloutsig_1_5z[3:2], celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_0_37z = { celloutsig_0_33z[8:5], celloutsig_0_16z, celloutsig_0_26z, celloutsig_0_23z, celloutsig_0_27z } || { celloutsig_0_31z[8:5], celloutsig_0_4z, celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_0z, celloutsig_0_9z };
  assign celloutsig_0_47z = { celloutsig_0_15z[1], celloutsig_0_15z } || in_data[76:70];
  assign celloutsig_0_17z = { celloutsig_0_7z[1:0], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_12z } || { celloutsig_0_6z[18:1], celloutsig_0_3z };
  assign celloutsig_0_28z = { celloutsig_0_15z[1:0], celloutsig_0_9z, celloutsig_0_4z } || { celloutsig_0_24z, celloutsig_0_25z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_50z = { celloutsig_0_4z, celloutsig_0_28z, celloutsig_0_28z, celloutsig_0_7z } < { celloutsig_0_33z[7:6], celloutsig_0_4z, celloutsig_0_28z, celloutsig_0_27z, celloutsig_0_26z, celloutsig_0_37z, celloutsig_0_39z };
  assign celloutsig_0_56z = { celloutsig_0_20z[1], celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_44z, celloutsig_0_44z, celloutsig_0_50z, celloutsig_0_54z } < { celloutsig_0_53z, celloutsig_0_6z };
  assign celloutsig_0_57z = celloutsig_0_46z[23:7] < { celloutsig_0_10z[7:3], celloutsig_0_33z };
  assign celloutsig_0_58z = { celloutsig_0_6z[11:6], celloutsig_0_37z, celloutsig_0_56z } < { celloutsig_0_31z[8:2], celloutsig_0_14z };
  assign celloutsig_0_79z = { celloutsig_0_61z[3:2], celloutsig_0_78z, celloutsig_0_58z } < celloutsig_0_53z;
  assign celloutsig_0_89z = { celloutsig_0_46z[13:11], celloutsig_0_17z, celloutsig_0_42z, celloutsig_0_21z, celloutsig_0_17z } < { celloutsig_0_46z[14:11], celloutsig_0_27z, celloutsig_0_79z, celloutsig_0_83z };
  assign celloutsig_1_19z = { celloutsig_1_11z[6:3], celloutsig_1_12z } < celloutsig_1_0z[4:0];
  assign celloutsig_0_14z = { celloutsig_0_0z, celloutsig_0_2z } < celloutsig_0_6z[19:14];
  assign celloutsig_0_21z = celloutsig_0_10z[5:0] < { celloutsig_0_13z[5:1], celloutsig_0_9z };
  assign celloutsig_0_25z = { celloutsig_0_1z[16:10], celloutsig_0_14z } < { celloutsig_0_21z, celloutsig_0_23z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_19z };
  assign celloutsig_0_1z = { in_data[52:40], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } % { 1'h1, in_data[92:77] };
  assign celloutsig_1_8z = { celloutsig_1_4z[1:0], celloutsig_1_6z } % { 1'h1, celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_6z = in_data[25:5] * { in_data[67:52], celloutsig_0_3z, celloutsig_0_4z };
  assign celloutsig_0_78z = { celloutsig_0_57z, celloutsig_0_54z, celloutsig_0_23z } !== celloutsig_0_62z[5:3];
  assign celloutsig_0_53z = celloutsig_0_33z[11:8] | { celloutsig_0_47z, celloutsig_0_19z, celloutsig_0_39z, celloutsig_0_34z };
  assign celloutsig_0_12z = { in_data[10:7], celloutsig_0_9z } | { celloutsig_0_1z[4:1], celloutsig_0_9z };
  assign celloutsig_0_20z = { in_data[62:61], celloutsig_0_19z } | in_data[70:68];
  assign celloutsig_0_2z = in_data[58:54] | celloutsig_0_1z[11:7];
  assign celloutsig_0_3z = ^ { in_data[57:27], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_5z = ^ { in_data[90:89], celloutsig_0_3z };
  assign celloutsig_0_8z = ^ { in_data[93:91], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_1_2z = ^ { in_data[151:140], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_11z = ^ { in_data[54:53], celloutsig_0_3z };
  assign celloutsig_0_27z = ^ { celloutsig_0_21z, celloutsig_0_2z, celloutsig_0_20z };
  assign celloutsig_1_4z = in_data[191:189] >>> { in_data[126], celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_1_6z = in_data[155:151] - { in_data[144:143], celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_29z = { celloutsig_0_1z[12:10], celloutsig_0_25z } - { celloutsig_0_25z, celloutsig_0_28z, celloutsig_0_5z, celloutsig_0_26z };
  assign celloutsig_0_33z = { in_data[94:85], celloutsig_0_24z, celloutsig_0_30z } - { celloutsig_0_31z[4:1], celloutsig_0_28z, celloutsig_0_11z, celloutsig_0_25z, celloutsig_0_7z };
  assign celloutsig_0_16z = { celloutsig_0_15z[1], celloutsig_0_2z } ~^ { celloutsig_0_4z[3], celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_22z = celloutsig_0_12z[4:1] ^ { celloutsig_0_13z[10:8], celloutsig_0_19z };
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_41z = 5'h00;
    else if (!clkin_data[0]) celloutsig_0_41z = { celloutsig_0_12z[4:1], celloutsig_0_40z };
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_43z = 19'h00000;
    else if (clkin_data[0]) celloutsig_0_43z = { celloutsig_0_6z[18:8], celloutsig_0_41z, celloutsig_0_38z };
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_46z = 25'h0000000;
    else if (!clkin_data[0]) celloutsig_0_46z = { celloutsig_0_1z[16:15], celloutsig_0_43z, celloutsig_0_29z };
  always_latch
    if (clkin_data[96]) celloutsig_1_11z = 7'h00;
    else if (!clkin_data[64]) celloutsig_1_11z = { in_data[180:178], celloutsig_1_5z };
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_13z = 11'h000;
    else if (!clkin_data[32]) celloutsig_0_13z = { celloutsig_0_12z[4:1], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_12z };
  assign celloutsig_0_39z = ~((celloutsig_0_37z & celloutsig_0_2z[3]) | (celloutsig_0_26z & celloutsig_0_11z));
  assign celloutsig_0_54z = ~((celloutsig_0_17z & celloutsig_0_11z) | (celloutsig_0_3z & celloutsig_0_3z));
  assign { out_data[141:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_88z, celloutsig_0_89z };
endmodule
