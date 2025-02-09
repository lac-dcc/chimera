/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [13:0] celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [7:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [6:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [4:0] celloutsig_0_1z;
  wire [18:0] celloutsig_0_20z;
  wire [3:0] celloutsig_0_21z;
  wire [5:0] celloutsig_0_22z;
  wire [11:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [7:0] celloutsig_0_25z;
  wire [7:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [18:0] celloutsig_0_28z;
  wire [6:0] celloutsig_0_29z;
  reg [4:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  reg [2:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [2:0] celloutsig_0_35z;
  wire [8:0] celloutsig_0_36z;
  wire [8:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [17:0] celloutsig_0_40z;
  wire celloutsig_0_44z;
  wire [5:0] celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire [6:0] celloutsig_0_49z;
  reg [3:0] celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_57z;
  wire [9:0] celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_62z;
  wire celloutsig_0_66z;
  wire [16:0] celloutsig_0_6z;
  wire [4:0] celloutsig_0_70z;
  wire celloutsig_0_71z;
  wire [15:0] celloutsig_0_72z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire [3:0] celloutsig_1_12z;
  wire [4:0] celloutsig_1_13z;
  wire [7:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [21:0] celloutsig_1_19z;
  wire [14:0] celloutsig_1_1z;
  wire [17:0] celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [16:0] celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_30z = ~celloutsig_0_19z;
  assign celloutsig_0_33z = ~((celloutsig_0_6z[16] | celloutsig_0_20z[1]) & celloutsig_0_7z);
  assign celloutsig_0_7z = ~((celloutsig_0_2z[1] | celloutsig_0_3z) & celloutsig_0_0z);
  assign celloutsig_0_36z = { celloutsig_0_29z, celloutsig_0_8z, celloutsig_0_33z } + { celloutsig_0_29z[5:1], celloutsig_0_17z, celloutsig_0_13z };
  assign celloutsig_0_72z = celloutsig_0_40z[15:0] + { celloutsig_0_12z[9:5], celloutsig_0_23z[5:2], celloutsig_0_53z, celloutsig_0_61z, celloutsig_0_70z };
  assign celloutsig_1_1z = in_data[168:154] + in_data[144:130];
  assign celloutsig_1_17z = { celloutsig_1_2z[17:11], celloutsig_1_5z } + { celloutsig_1_1z[8:2], celloutsig_1_0z };
  assign celloutsig_1_10z = { celloutsig_1_3z[1:0], celloutsig_1_8z, celloutsig_1_0z } & celloutsig_1_1z[11:8];
  assign celloutsig_0_21z = { celloutsig_0_5z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_7z } & celloutsig_0_4z;
  assign celloutsig_0_25z = { celloutsig_0_5z, celloutsig_0_18z } & { celloutsig_0_18z, celloutsig_0_15z };
  assign celloutsig_0_31z = celloutsig_0_12z[7:0] >= { celloutsig_0_25z[5:2], celloutsig_0_13z, celloutsig_0_9z };
  assign celloutsig_0_53z = celloutsig_0_6z[15:3] >= { celloutsig_0_36z[6:1], celloutsig_0_46z, celloutsig_0_33z };
  assign celloutsig_0_15z = { celloutsig_0_6z[6:5], celloutsig_0_2z, celloutsig_0_11z } >= { celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_1z };
  assign celloutsig_1_4z = { celloutsig_1_2z[11:9], celloutsig_1_0z } < celloutsig_1_1z[5:2];
  assign celloutsig_0_14z = { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_5z } < celloutsig_0_6z[15:11];
  assign celloutsig_0_46z = { celloutsig_0_26z[1], celloutsig_0_2z } % { 1'h1, celloutsig_0_18z[4:0] };
  assign celloutsig_0_49z = celloutsig_0_36z[6:0] % { 1'h1, celloutsig_0_37z[5:0] };
  assign celloutsig_1_13z = celloutsig_1_2z[8:4] % { 1'h1, celloutsig_1_12z };
  assign celloutsig_0_1z = { in_data[20:17], celloutsig_0_0z } % { 1'h1, in_data[86:83] };
  assign celloutsig_0_12z = { in_data[57:48], celloutsig_0_7z, celloutsig_0_10z } % { 1'h1, celloutsig_0_2z[2:0], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_13z = celloutsig_0_1z[4:2] % { 1'h1, celloutsig_0_12z[6], celloutsig_0_11z };
  assign celloutsig_0_16z = { celloutsig_0_13z[2:1], celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_9z } % { 1'h1, celloutsig_0_12z[10:4] };
  assign celloutsig_1_3z = { celloutsig_1_1z[6:5], celloutsig_1_0z } % { 1'h1, celloutsig_1_2z[15:14] };
  assign celloutsig_0_20z = { celloutsig_0_4z[2], celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_12z } % { 1'h1, celloutsig_0_6z[14:5], celloutsig_0_1z, celloutsig_0_13z };
  assign celloutsig_0_37z = { in_data[9:8], celloutsig_0_31z, celloutsig_0_4z, celloutsig_0_33z, celloutsig_0_14z } * { celloutsig_0_21z, celloutsig_0_27z, celloutsig_0_9z, celloutsig_0_10z };
  assign celloutsig_0_18z = { celloutsig_0_1z[0], celloutsig_0_1z, celloutsig_0_9z } * { celloutsig_0_4z[2:0], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_14z };
  assign celloutsig_0_35z = celloutsig_0_0z ? { 1'h1, celloutsig_0_31z, celloutsig_0_33z } : { celloutsig_0_28z[6:5], celloutsig_0_15z };
  assign celloutsig_0_40z = celloutsig_0_24z ? { celloutsig_0_28z[18:16], celloutsig_0_1z, celloutsig_0_39z, celloutsig_0_37z } : { celloutsig_0_37z[6:2], celloutsig_0_36z, celloutsig_0_8z, celloutsig_0_17z, celloutsig_0_30z, celloutsig_0_34z };
  assign celloutsig_0_70z = celloutsig_0_62z ? { celloutsig_0_12z[9:6], celloutsig_0_48z } : { celloutsig_0_32z[1], celloutsig_0_54z, celloutsig_0_33z, celloutsig_0_52z, celloutsig_0_66z };
  assign celloutsig_1_2z = celloutsig_1_1z[14] ? in_data[179:162] : { celloutsig_1_1z[6:4], 1'h0, celloutsig_1_1z[13:0] };
  assign celloutsig_0_23z[5:0] = celloutsig_0_15z ? { celloutsig_0_12z[4:0], 1'h1 } : { celloutsig_0_22z[5:1], 1'h0 };
  assign celloutsig_0_66z = { celloutsig_0_46z[4:3], celloutsig_0_30z } != { celloutsig_0_12z[7], celloutsig_0_51z, celloutsig_0_57z };
  assign celloutsig_0_71z = celloutsig_0_6z[15:11] != { celloutsig_0_49z[4:2], celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_1_18z = { celloutsig_1_10z[3:1], celloutsig_1_17z } != in_data[178:168];
  assign celloutsig_1_0z = in_data[150:145] !== in_data[162:157];
  assign celloutsig_1_8z = { in_data[184:181], celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_5z } !== celloutsig_1_1z[9:3];
  assign celloutsig_0_58z = ~ { celloutsig_0_3z, celloutsig_0_36z };
  assign celloutsig_1_12z = ~ { celloutsig_1_2z[15:14], celloutsig_1_0z, celloutsig_1_8z };
  assign celloutsig_1_9z = { celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_1z } | { celloutsig_1_2z[9:3], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_3z };
  assign celloutsig_0_48z = | { celloutsig_0_6z[11:6], celloutsig_0_34z };
  assign celloutsig_0_54z = | { celloutsig_0_28z[18:13], celloutsig_0_51z, celloutsig_0_35z };
  assign celloutsig_0_62z = | celloutsig_0_28z[15:3];
  assign celloutsig_0_11z = | { celloutsig_0_6z[10:4], celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_0z = | in_data[42:20];
  assign celloutsig_0_52z = | { celloutsig_0_39z, celloutsig_0_38z, celloutsig_0_28z[14:10], celloutsig_0_13z };
  assign celloutsig_1_7z = | { celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_17z = | { celloutsig_0_8z, celloutsig_0_6z[9:2], in_data[42:20] };
  assign celloutsig_0_3z = ~^ { in_data[95:80], celloutsig_0_2z };
  assign celloutsig_0_44z = ~^ { celloutsig_0_6z[2:1], celloutsig_0_9z, celloutsig_0_35z };
  assign celloutsig_0_61z = ~^ celloutsig_0_58z[5:3];
  assign celloutsig_0_19z = ~^ { celloutsig_0_6z[7:2], celloutsig_0_14z };
  assign celloutsig_0_6z = { in_data[45:40], celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_4z } >> { in_data[57:42], celloutsig_0_3z };
  assign celloutsig_0_29z = celloutsig_0_20z[17:11] >> { celloutsig_0_15z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_1_19z = { celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_12z } ~^ { in_data[136:132], celloutsig_1_13z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_10z = { celloutsig_0_2z[1:0], celloutsig_0_7z } ~^ in_data[33:31];
  assign celloutsig_0_34z = ~((celloutsig_0_4z[3] & celloutsig_0_1z[2]) | celloutsig_0_0z);
  assign celloutsig_0_39z = ~((celloutsig_0_8z & celloutsig_0_22z[2]) | celloutsig_0_27z);
  assign celloutsig_0_51z = ~((celloutsig_0_19z & celloutsig_0_31z) | celloutsig_0_44z);
  assign celloutsig_0_57z = ~((celloutsig_0_48z & celloutsig_0_14z) | celloutsig_0_51z);
  assign celloutsig_0_27z = ~((celloutsig_0_16z[2] & in_data[84]) | celloutsig_0_5z);
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_32z = 3'h0;
    else if (!clkin_data[32]) celloutsig_0_32z = { celloutsig_0_25z[3:2], celloutsig_0_11z };
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_4z = 4'h0;
    else if (!clkin_data[32]) celloutsig_0_4z = { celloutsig_0_2z[2:0], celloutsig_0_0z };
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_2z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_2z = { in_data[58:57], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_38z = ~((celloutsig_0_21z[0] & celloutsig_0_27z) | (celloutsig_0_10z[1] & celloutsig_0_5z));
  assign celloutsig_0_5z = ~((in_data[24] & celloutsig_0_0z) | (celloutsig_0_4z[1] & celloutsig_0_4z[1]));
  assign celloutsig_1_5z = ~((celloutsig_1_3z[0] & celloutsig_1_2z[14]) | (in_data[145] & celloutsig_1_3z[1]));
  assign celloutsig_0_8z = ~((celloutsig_0_0z & in_data[30]) | (celloutsig_0_1z[4] & celloutsig_0_2z[0]));
  assign celloutsig_0_9z = ~((celloutsig_0_3z & celloutsig_0_3z) | (celloutsig_0_1z[4] & celloutsig_0_8z));
  assign celloutsig_0_24z = ~((celloutsig_0_20z[2] & celloutsig_0_0z) | (celloutsig_0_15z & celloutsig_0_1z[0]));
  assign celloutsig_0_28z[7] = ~ celloutsig_0_20z[7];
  assign { celloutsig_0_22z[1], celloutsig_0_22z[5:2] } = { celloutsig_0_14z, celloutsig_0_2z[3:0] } ^ { celloutsig_0_8z, celloutsig_0_6z[13:10] };
  assign { celloutsig_0_26z[4], celloutsig_0_26z[7:5], celloutsig_0_26z[0], celloutsig_0_26z[2:1] } = { celloutsig_0_22z[1], celloutsig_0_22z[4:2], celloutsig_0_24z, celloutsig_0_17z, celloutsig_0_17z } ~^ { celloutsig_0_18z[4], celloutsig_0_1z[2], celloutsig_0_18z[6:5], celloutsig_0_18z[0], celloutsig_0_18z[2:1] };
  assign { celloutsig_0_28z[18:8], celloutsig_0_28z[6:0] } = { celloutsig_0_20z[18:8], celloutsig_0_20z[6:3], celloutsig_0_10z } ~^ { celloutsig_0_23z[5:0], celloutsig_0_22z[5:1], celloutsig_0_10z, celloutsig_0_21z };
  assign celloutsig_0_22z[0] = 1'h0;
  assign celloutsig_0_23z[11:6] = celloutsig_0_12z[10:5];
  assign { out_data[128], out_data[117:96], out_data[32], out_data[15:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_71z, celloutsig_0_72z };
endmodule
