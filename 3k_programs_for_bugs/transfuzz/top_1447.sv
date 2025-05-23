/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [11:0] _00_;
  reg [8:0] _01_;
  wire [10:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [3:0] celloutsig_0_13z;
  wire [3:0] celloutsig_0_14z;
  wire [9:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [14:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [4:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [13:0] celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [3:0] celloutsig_0_29z;
  wire [45:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [10:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [12:0] celloutsig_0_33z;
  wire [6:0] celloutsig_0_35z;
  wire [2:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [7:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [5:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [18:0] celloutsig_0_41z;
  wire [7:0] celloutsig_0_42z;
  wire [13:0] celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [3:0] celloutsig_0_4z;
  wire [2:0] celloutsig_0_51z;
  wire [6:0] celloutsig_0_53z;
  wire [7:0] celloutsig_0_54z;
  wire celloutsig_0_58z;
  wire [2:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire [2:0] celloutsig_0_60z;
  reg [4:0] celloutsig_0_61z;
  wire [4:0] celloutsig_0_64z;
  wire celloutsig_0_67z;
  wire [2:0] celloutsig_0_68z;
  wire celloutsig_0_6z;
  wire celloutsig_0_76z;
  wire [19:0] celloutsig_0_77z;
  wire celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire [5:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [12:0] celloutsig_1_11z;
  wire celloutsig_1_15z;
  wire [23:0] celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [16:0] celloutsig_1_4z;
  wire [4:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [15:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [6:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_67z = celloutsig_0_41z[11] ? celloutsig_0_59z[2] : celloutsig_0_33z[1];
  assign celloutsig_1_0z = in_data[112] ? in_data[164] : in_data[133];
  assign celloutsig_1_15z = celloutsig_1_11z[11] ? in_data[134] : celloutsig_1_0z;
  assign celloutsig_0_18z = celloutsig_0_4z[1] ? celloutsig_0_15z[1] : celloutsig_0_9z[4];
  assign celloutsig_0_37z = ~(celloutsig_0_29z[0] & celloutsig_0_8z[0]);
  assign celloutsig_0_40z = ~(celloutsig_0_0z[8] & celloutsig_0_20z[4]);
  assign celloutsig_0_45z = ~(celloutsig_0_6z & celloutsig_0_31z[10]);
  assign celloutsig_0_58z = ~(celloutsig_0_31z[4] & celloutsig_0_39z);
  assign celloutsig_1_3z = ~(in_data[122] & celloutsig_1_2z[3]);
  assign celloutsig_0_19z = ~(celloutsig_0_4z[3] & celloutsig_0_12z);
  assign celloutsig_0_21z = ~(celloutsig_0_3z[3] & celloutsig_0_18z);
  assign celloutsig_0_25z = ~(celloutsig_0_19z & celloutsig_0_21z);
  assign celloutsig_0_32z = celloutsig_0_28z | ~(celloutsig_0_23z[0]);
  assign celloutsig_1_10z = celloutsig_1_1z[0] | ~(celloutsig_1_5z[0]);
  assign celloutsig_0_10z = in_data[43] | ~(in_data[85]);
  assign celloutsig_0_11z = celloutsig_0_3z[2] | ~(celloutsig_0_2z[33]);
  assign celloutsig_0_33z = { celloutsig_0_20z[4:3], celloutsig_0_19z, celloutsig_0_21z, celloutsig_0_14z, celloutsig_0_21z, celloutsig_0_14z } + in_data[51:39];
  assign celloutsig_0_4z = in_data[53:50] + { celloutsig_0_2z[13:11], celloutsig_0_2z[21] };
  assign celloutsig_0_38z = { celloutsig_0_3z, celloutsig_0_19z, celloutsig_0_32z } + { celloutsig_0_9z[5:1], celloutsig_0_36z };
  assign celloutsig_0_44z = celloutsig_0_41z[18:5] + { celloutsig_0_15z[7:1], celloutsig_0_35z };
  assign celloutsig_0_59z = celloutsig_0_2z[13:11] + celloutsig_0_54z[3:1];
  assign celloutsig_0_64z = { in_data[36:33], celloutsig_0_21z } + celloutsig_0_53z[6:2];
  assign celloutsig_0_8z = celloutsig_0_4z[3:1] + { celloutsig_0_4z[0], celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_1_11z = { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_10z } + { in_data[162:157], celloutsig_1_9z };
  assign celloutsig_1_18z = { celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_9z } + { celloutsig_1_11z[5:0], celloutsig_1_8z, celloutsig_1_15z, celloutsig_1_7z };
  assign celloutsig_1_19z = { celloutsig_1_2z[1:0], celloutsig_1_6z } + { celloutsig_1_9z[6:5], celloutsig_1_3z };
  assign celloutsig_0_15z = { celloutsig_0_2z[27:19], celloutsig_0_7z } + { in_data[50:46], celloutsig_0_7z, celloutsig_0_13z };
  always_ff @(posedge clkin_data[0], posedge clkin_data[32])
    if (clkin_data[32]) _00_ <= 12'h000;
    else _00_ <= { in_data[51:41], celloutsig_0_10z };
  always_ff @(posedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _01_ <= 9'h000;
    else _01_ <= { celloutsig_0_13z[3:1], celloutsig_0_9z };
  assign celloutsig_0_46z = { celloutsig_0_38z, celloutsig_0_29z } >= celloutsig_0_33z[12:1];
  assign celloutsig_0_76z = { celloutsig_0_54z[4:2], celloutsig_0_68z, celloutsig_0_58z, celloutsig_0_51z } >= { celloutsig_0_2z[29:27], celloutsig_0_59z, celloutsig_0_59z, celloutsig_0_27z };
  assign celloutsig_1_6z = { in_data[154:148], celloutsig_1_0z, celloutsig_1_2z } >= { celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_1_8z = in_data[177:175] >= celloutsig_1_2z[3:1];
  assign celloutsig_0_12z = { celloutsig_0_3z[5], celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_5z } >= { celloutsig_0_3z[4:1], celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_0z };
  assign celloutsig_0_16z = { in_data[61], celloutsig_0_14z, celloutsig_0_1z } >= { in_data[47:43], celloutsig_0_10z };
  assign celloutsig_0_39z = { celloutsig_0_20z, celloutsig_0_22z } && { celloutsig_0_14z[1:0], celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_25z, celloutsig_0_32z };
  assign celloutsig_0_47z = { celloutsig_0_21z, celloutsig_0_36z, celloutsig_0_4z, celloutsig_0_40z, celloutsig_0_27z, celloutsig_0_46z, celloutsig_0_7z } && { celloutsig_0_44z[13:11], celloutsig_0_42z, celloutsig_0_10z };
  assign celloutsig_0_7z = { celloutsig_0_0z[7:6], celloutsig_0_4z, celloutsig_0_6z } && celloutsig_0_2z[45:39];
  assign celloutsig_0_30z = { celloutsig_0_2z[36:31], celloutsig_0_6z, celloutsig_0_22z, celloutsig_0_19z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_7z } && { celloutsig_0_15z[8:3], celloutsig_0_10z, celloutsig_0_20z, celloutsig_0_20z, celloutsig_0_20z };
  assign celloutsig_0_5z = celloutsig_0_3z[3:1] < celloutsig_0_2z[40:38];
  assign celloutsig_0_6z = celloutsig_0_2z[43:21] < celloutsig_0_2z[38:16];
  assign celloutsig_0_1z = in_data[30:28] < celloutsig_0_0z[9:7];
  assign celloutsig_0_22z = { celloutsig_0_19z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_19z } < { celloutsig_0_15z[6:2], celloutsig_0_16z };
  assign celloutsig_0_27z = { celloutsig_0_17z[11], celloutsig_0_7z, celloutsig_0_5z } < { _01_[8:7], celloutsig_0_21z };
  assign celloutsig_0_28z = celloutsig_0_13z[2:0] < { celloutsig_0_0z[10:9], celloutsig_0_12z };
  assign celloutsig_0_41z = { celloutsig_0_0z[7:2], celloutsig_0_33z } % { 1'h1, celloutsig_0_3z[2:0], celloutsig_0_17z[14:10], celloutsig_0_17z[13:10], celloutsig_0_17z[5:0] };
  assign celloutsig_0_42z = celloutsig_0_23z[13:6] % { 1'h1, celloutsig_0_38z[3:1], celloutsig_0_30z, celloutsig_0_40z, celloutsig_0_28z, celloutsig_0_19z };
  assign celloutsig_0_77z = { celloutsig_0_23z[9:5], celloutsig_0_17z[14:10], celloutsig_0_17z[13:10], celloutsig_0_17z[5:0] } % { 1'h1, celloutsig_0_61z[2], celloutsig_0_64z, celloutsig_0_8z, celloutsig_0_67z, celloutsig_0_60z, celloutsig_0_28z, celloutsig_0_46z, celloutsig_0_4z };
  assign celloutsig_1_7z = celloutsig_1_4z[15:0] % { 1'h1, celloutsig_1_4z[11:6], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_3z };
  assign celloutsig_0_14z = { celloutsig_0_8z[0], celloutsig_0_8z } % { 1'h1, celloutsig_0_4z[2:0] };
  assign celloutsig_0_20z = celloutsig_0_0z[10:6] % { 1'h1, celloutsig_0_4z[2:0], celloutsig_0_19z };
  assign celloutsig_0_53z = celloutsig_0_28z ? { 1'h1, celloutsig_0_4z, celloutsig_0_45z, celloutsig_0_27z } : { _00_[11:6], celloutsig_0_39z };
  assign celloutsig_1_1z = celloutsig_1_0z ? { in_data[127:126], 2'h3 } : in_data[130:127];
  assign celloutsig_1_5z = celloutsig_1_4z[8] ? in_data[104:100] : { celloutsig_1_4z[12:9], 1'h0 };
  assign celloutsig_0_13z = celloutsig_0_9z[0] ? { celloutsig_0_9z[3:2], celloutsig_0_5z, celloutsig_0_7z } : celloutsig_0_4z;
  assign celloutsig_0_29z = celloutsig_0_3z[1] ? { celloutsig_0_2z[21], celloutsig_0_18z, celloutsig_0_5z, celloutsig_0_12z } : { celloutsig_0_17z[11:10], celloutsig_0_17z[13], celloutsig_0_18z };
  assign celloutsig_0_51z = ~ { in_data[85:84], celloutsig_0_5z };
  assign celloutsig_1_4z = ~ { in_data[130:124], celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_0_3z = ~ celloutsig_0_2z[21:16];
  assign celloutsig_0_54z = { _00_[3:0], celloutsig_0_29z } <<< { celloutsig_0_44z[13:10], celloutsig_0_39z, celloutsig_0_47z, celloutsig_0_47z, celloutsig_0_45z };
  assign celloutsig_0_60z = celloutsig_0_54z[2:0] <<< { _00_[8:7], celloutsig_0_37z };
  assign celloutsig_1_2z = { in_data[177:173], celloutsig_1_1z } <<< { in_data[189:187], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_68z = { celloutsig_0_54z[7], celloutsig_0_39z, celloutsig_0_25z } - celloutsig_0_51z;
  assign celloutsig_0_9z = { celloutsig_0_8z[2:1], celloutsig_0_4z } - celloutsig_0_0z[10:5];
  assign celloutsig_0_0z = in_data[75:65] ^ in_data[44:34];
  assign celloutsig_0_35z = { celloutsig_0_29z[0], celloutsig_0_32z, celloutsig_0_19z, celloutsig_0_8z, celloutsig_0_7z } ^ { celloutsig_0_28z, celloutsig_0_4z, celloutsig_0_21z, celloutsig_0_6z };
  assign celloutsig_0_36z = { celloutsig_0_14z[1:0], celloutsig_0_19z } ^ { celloutsig_0_14z[3:2], celloutsig_0_16z };
  assign celloutsig_1_9z = in_data[167:161] ^ celloutsig_1_2z[8:2];
  assign celloutsig_0_23z = { celloutsig_0_20z[4:2], celloutsig_0_0z } ^ { celloutsig_0_17z[13:10], celloutsig_0_17z[13:10], celloutsig_0_17z[5:0] };
  assign celloutsig_0_31z = { in_data[72:65], celloutsig_0_1z, celloutsig_0_18z, celloutsig_0_10z } ^ { celloutsig_0_17z[13:10], celloutsig_0_17z[13:10], celloutsig_0_17z[5:3] };
  always_latch
    if (clkin_data[64]) celloutsig_0_61z = 5'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_61z = { celloutsig_0_23z[9:6], celloutsig_0_27z };
  assign celloutsig_0_2z[45:11] = ~ { in_data[82:59], celloutsig_0_0z };
  assign { celloutsig_0_17z[13:10], celloutsig_0_17z[14], celloutsig_0_17z[5:0] } = ~ { celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_17z[9:6] = celloutsig_0_17z[13:10];
  assign celloutsig_0_2z[10:0] = celloutsig_0_2z[21:11];
  assign { out_data[151:128], out_data[98:96], out_data[32], out_data[19:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_76z, celloutsig_0_77z };
endmodule
