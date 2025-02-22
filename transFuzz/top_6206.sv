/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [8:0] celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [7:0] celloutsig_0_13z;
  wire [8:0] celloutsig_0_14z;
  reg [20:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire [13:0] celloutsig_0_21z;
  reg [32:0] celloutsig_0_22z;
  wire [4:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  reg [2:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [19:0] celloutsig_0_30z;
  wire [21:0] celloutsig_0_31z;
  wire [4:0] celloutsig_0_32z;
  wire [16:0] celloutsig_0_33z;
  reg [10:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire [5:0] celloutsig_0_38z;
  wire [4:0] celloutsig_0_39z;
  wire [9:0] celloutsig_0_3z;
  wire [3:0] celloutsig_0_40z;
  wire [3:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [5:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  reg [3:0] celloutsig_0_50z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_56z;
  wire [3:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire [5:0] celloutsig_0_60z;
  reg [2:0] celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire celloutsig_0_66z;
  wire [2:0] celloutsig_0_67z;
  wire [5:0] celloutsig_0_6z;
  wire celloutsig_0_74z;
  wire [9:0] celloutsig_0_75z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [7:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [14:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [10:0] celloutsig_1_5z;
  wire [17:0] celloutsig_1_6z;
  wire [28:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [11:0] celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [4:0] _00_;
  always_latch
    if (!clkin_data[0]) _00_ = 5'h00;
    else if (!celloutsig_1_18z) _00_ = { celloutsig_0_20z[5:3], celloutsig_0_20z[1:0] };
  assign { celloutsig_0_60z[5:3], celloutsig_0_60z[1:0] } = _00_;
  assign celloutsig_1_2z = celloutsig_1_1z ? in_data[152] : celloutsig_1_1z;
  assign celloutsig_1_18z = celloutsig_1_16z ? celloutsig_1_9z[9] : celloutsig_1_13z[2];
  assign celloutsig_0_8z = celloutsig_0_4z ? celloutsig_0_3z[9] : celloutsig_0_7z;
  assign celloutsig_0_19z = celloutsig_0_2z ? celloutsig_0_17z : celloutsig_0_12z;
  assign celloutsig_0_26z = celloutsig_0_7z ? celloutsig_0_24z : celloutsig_0_1z;
  assign celloutsig_0_54z = ~(celloutsig_0_38z[0] & celloutsig_0_5z);
  assign celloutsig_0_24z = ~(celloutsig_0_19z & celloutsig_0_13z[7]);
  assign celloutsig_0_44z = !(celloutsig_0_35z ? celloutsig_0_33z[13] : celloutsig_0_20z[3]);
  assign celloutsig_0_52z = !(celloutsig_0_42z ? celloutsig_0_9z[5] : celloutsig_0_4z);
  assign celloutsig_1_10z = !(celloutsig_1_3z ? celloutsig_1_1z : celloutsig_1_3z);
  assign celloutsig_1_16z = !(celloutsig_1_5z[7] ? celloutsig_1_10z : in_data[165]);
  assign celloutsig_0_18z = !(celloutsig_0_7z ? celloutsig_0_7z : celloutsig_0_4z);
  assign celloutsig_0_47z = ~((celloutsig_0_0z | celloutsig_0_43z[4]) & celloutsig_0_37z);
  assign celloutsig_0_4z = ~((celloutsig_0_1z | celloutsig_0_1z) & (celloutsig_0_2z | in_data[23]));
  assign celloutsig_0_65z = ~((celloutsig_0_34z[7] | celloutsig_0_7z) & (celloutsig_0_35z | celloutsig_0_49z));
  assign celloutsig_0_66z = ~((celloutsig_0_23z[1] | celloutsig_0_19z) & (celloutsig_0_4z | celloutsig_0_20z[4]));
  assign celloutsig_1_0z = ~((in_data[130] | in_data[116]) & (in_data[135] | in_data[167]));
  assign celloutsig_0_7z = ~((celloutsig_0_0z | celloutsig_0_2z) & (celloutsig_0_6z[2] | celloutsig_0_0z));
  assign celloutsig_0_1z = ~((in_data[71] | celloutsig_0_0z) & (celloutsig_0_0z | in_data[29]));
  assign celloutsig_0_2z = ~((celloutsig_0_0z | in_data[12]) & (celloutsig_0_0z | in_data[44]));
  assign celloutsig_0_28z = celloutsig_0_17z | ~(celloutsig_0_5z);
  assign celloutsig_0_29z = in_data[70] ^ celloutsig_0_8z;
  assign celloutsig_0_49z = celloutsig_0_30z[0] ^ celloutsig_0_24z;
  assign celloutsig_1_3z = in_data[113] ^ celloutsig_1_1z;
  assign celloutsig_1_4z = in_data[177] ^ in_data[121];
  assign celloutsig_1_14z = celloutsig_1_12z ^ celloutsig_1_6z[13];
  assign celloutsig_0_37z = ~(celloutsig_0_1z ^ celloutsig_0_19z);
  assign celloutsig_1_8z = ~(celloutsig_1_5z[7] ^ celloutsig_1_2z);
  assign celloutsig_1_11z = ~(celloutsig_1_0z ^ in_data[169]);
  assign celloutsig_1_17z = ~(celloutsig_1_1z ^ in_data[146]);
  assign celloutsig_0_16z = ~(celloutsig_0_0z ^ celloutsig_0_3z[7]);
  assign celloutsig_0_25z = ~(celloutsig_0_13z[3] ^ celloutsig_0_1z);
  assign celloutsig_0_31z = { celloutsig_0_22z[28:9], celloutsig_0_5z, celloutsig_0_29z } & { celloutsig_0_22z[29:14], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_17z, celloutsig_0_7z };
  assign celloutsig_0_32z = { celloutsig_0_10z[8:5], celloutsig_0_28z } & { celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_19z, celloutsig_0_7z };
  assign celloutsig_0_59z = celloutsig_0_41z & { celloutsig_0_39z[3:1], celloutsig_0_29z };
  assign celloutsig_0_9z = in_data[48:41] & { celloutsig_0_3z[9:7], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_0z = in_data[30:23] > in_data[32:25];
  assign celloutsig_0_42z = celloutsig_0_13z[7:2] > { celloutsig_0_15z[10:9], celloutsig_0_40z };
  assign celloutsig_0_53z = celloutsig_0_30z[14:9] > { celloutsig_0_27z[2:1], celloutsig_0_16z, celloutsig_0_19z, celloutsig_0_42z, celloutsig_0_12z };
  assign celloutsig_0_56z = { celloutsig_0_3z[7], celloutsig_0_3z[8], celloutsig_0_3z[9], celloutsig_0_27z, celloutsig_0_54z } > celloutsig_0_15z[13:7];
  assign celloutsig_0_5z = { celloutsig_0_3z[9:7], celloutsig_0_3z[7], celloutsig_0_3z[9] } > { in_data[40:38], celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_74z = { celloutsig_0_9z[5:0], celloutsig_0_59z, celloutsig_0_0z } > { celloutsig_0_60z[4:3], 1'h0, celloutsig_0_60z[1:0], celloutsig_0_64z, celloutsig_0_52z, celloutsig_0_42z, celloutsig_0_56z };
  assign celloutsig_1_19z = { celloutsig_1_13z[13], celloutsig_1_14z, celloutsig_1_9z, celloutsig_1_3z, celloutsig_1_17z, celloutsig_1_1z } > { celloutsig_1_7z[26:11], celloutsig_1_11z };
  assign celloutsig_0_12z = { celloutsig_0_6z[5:4], celloutsig_0_0z } > { celloutsig_0_6z[2:1], celloutsig_0_4z };
  assign celloutsig_0_17z = celloutsig_0_10z[6:1] > celloutsig_0_14z[6:1];
  assign celloutsig_0_46z = { celloutsig_0_32z[4:3], celloutsig_0_35z, celloutsig_0_9z, celloutsig_0_26z } || { celloutsig_0_32z[2:1], celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_24z, celloutsig_0_32z };
  assign celloutsig_1_12z = celloutsig_1_3z & ~(celloutsig_1_5z[2]);
  assign celloutsig_0_75z = { celloutsig_0_30z[10:7], celloutsig_0_44z, celloutsig_0_37z, celloutsig_0_66z, celloutsig_0_67z } % { 1'h1, celloutsig_0_11z[3:0], celloutsig_0_17z, celloutsig_0_50z };
  assign celloutsig_0_13z = celloutsig_0_10z[8:1] % { 1'h1, celloutsig_0_10z[4:0], celloutsig_0_7z, celloutsig_0_8z };
  assign celloutsig_0_23z = { celloutsig_0_15z[3:0], celloutsig_0_18z } % { 1'h1, celloutsig_0_14z[5], celloutsig_0_7z, celloutsig_0_1z, in_data[0] };
  assign celloutsig_1_1z = { in_data[186:179], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } != in_data[112:102];
  assign celloutsig_0_67z = - { celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_65z };
  assign celloutsig_0_40z = ~ { celloutsig_0_31z[12], celloutsig_0_25z, celloutsig_0_5z, celloutsig_0_2z };
  assign celloutsig_1_9z = ~ in_data[189:178];
  assign celloutsig_0_14z = ~ { celloutsig_0_13z, celloutsig_0_12z };
  assign celloutsig_0_35z = | celloutsig_0_20z[1:0];
  assign celloutsig_0_30z = { celloutsig_0_15z[19:14], celloutsig_0_12z, celloutsig_0_29z, celloutsig_0_19z, celloutsig_0_4z, celloutsig_0_16z, celloutsig_0_10z } >>> { celloutsig_0_15z[13:7], celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_23z };
  assign celloutsig_0_33z = { celloutsig_0_14z, celloutsig_0_13z } >>> { celloutsig_0_10z, celloutsig_0_26z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_32z };
  assign celloutsig_0_38z = celloutsig_0_30z[14:9] >>> celloutsig_0_13z[5:0];
  assign celloutsig_1_6z = { celloutsig_1_5z[7], celloutsig_1_5z[7], celloutsig_1_5z[7], celloutsig_1_5z[4:3], celloutsig_1_5z[10], celloutsig_1_5z[10], celloutsig_1_5z[10], celloutsig_1_5z[7], celloutsig_1_5z[7], celloutsig_1_5z[7], celloutsig_1_5z[4:2], celloutsig_1_5z[3], celloutsig_1_5z[7], celloutsig_1_4z, celloutsig_1_1z } >>> in_data[167:150];
  assign celloutsig_1_7z = { in_data[156:147], celloutsig_1_0z, celloutsig_1_6z } >>> { in_data[177:171], celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_1_13z = { in_data[183:181], celloutsig_1_5z[10], celloutsig_1_5z[10], celloutsig_1_5z[10], celloutsig_1_5z[7], celloutsig_1_5z[7], celloutsig_1_5z[7], celloutsig_1_5z[4:2], celloutsig_1_5z[3], celloutsig_1_5z[7], celloutsig_1_4z } >>> { celloutsig_1_9z[10:3], celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_12z, celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_8z };
  assign celloutsig_0_11z = { celloutsig_0_6z[2:1], celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_5z } >>> celloutsig_0_6z[4:0];
  assign celloutsig_0_6z = in_data[35:30] - { celloutsig_0_3z[7], celloutsig_0_3z[9:7], celloutsig_0_3z[8], celloutsig_0_3z[9] };
  assign celloutsig_0_10z = { celloutsig_0_3z[8], celloutsig_0_3z[9], celloutsig_0_6z, celloutsig_0_5z } - in_data[65:57];
  assign celloutsig_0_39z = { celloutsig_0_15z[8], celloutsig_0_21z[9:6] } ^ celloutsig_0_15z[15:11];
  assign celloutsig_0_41z = celloutsig_0_14z[3:0] ^ celloutsig_0_33z[12:9];
  assign celloutsig_0_43z = { celloutsig_0_30z[12:10], celloutsig_0_8z, celloutsig_0_35z, celloutsig_0_4z } ^ celloutsig_0_6z;
  always_latch
    if (clkin_data[32]) celloutsig_0_34z = 11'h000;
    else if (celloutsig_1_18z) celloutsig_0_34z = { celloutsig_0_21z[13:11], celloutsig_0_15z[8], celloutsig_0_21z[9:4], celloutsig_0_0z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_50z = 4'h0;
    else if (celloutsig_1_18z) celloutsig_0_50z = { celloutsig_0_16z, celloutsig_0_47z, celloutsig_0_46z, celloutsig_0_24z };
  always_latch
    if (clkin_data[32]) celloutsig_0_64z = 3'h0;
    else if (celloutsig_1_18z) celloutsig_0_64z = { celloutsig_0_53z, celloutsig_0_18z, celloutsig_0_53z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_15z = 21'h000000;
    else if (!celloutsig_1_18z) celloutsig_0_15z = { celloutsig_0_6z[4], celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_4z, celloutsig_0_4z };
  always_latch
    if (clkin_data[0]) celloutsig_0_22z = 33'h000000000;
    else if (celloutsig_1_18z) celloutsig_0_22z = { celloutsig_0_14z[1], celloutsig_0_15z, celloutsig_0_13z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_18z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_27z = 3'h0;
    else if (celloutsig_1_18z) celloutsig_0_27z = { celloutsig_0_25z, celloutsig_0_2z, celloutsig_0_18z };
  assign { celloutsig_0_3z[8], celloutsig_0_3z[9], celloutsig_0_3z[7] } = ~ { celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z };
  assign { celloutsig_0_20z[5], celloutsig_0_20z[1:0], celloutsig_0_20z[3], celloutsig_0_20z[4] } = { celloutsig_0_18z, celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_4z } ^ { celloutsig_0_3z[7], celloutsig_0_17z, celloutsig_0_12z, celloutsig_0_3z[9:8] };
  assign { celloutsig_1_5z[10], celloutsig_1_5z[3], celloutsig_1_5z[4], celloutsig_1_5z[2], celloutsig_1_5z[7] } = ~ { celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z };
  assign { celloutsig_0_21z[8:0], celloutsig_0_21z[13], celloutsig_0_21z[9], celloutsig_0_21z[11], celloutsig_0_21z[12] } = { celloutsig_0_14z, celloutsig_0_20z[5], celloutsig_0_20z[1], celloutsig_0_20z[3], celloutsig_0_20z[4] } ^ { celloutsig_0_15z[6:0], celloutsig_0_19z, celloutsig_0_18z, celloutsig_0_15z[11], celloutsig_0_15z[7], celloutsig_0_15z[9], celloutsig_0_15z[10] };
  assign celloutsig_0_20z[2] = 1'h0;
  assign celloutsig_0_21z[10] = celloutsig_0_15z[8];
  assign celloutsig_0_3z[6:0] = { celloutsig_0_3z[7], celloutsig_0_3z[9:7], celloutsig_0_3z[8], celloutsig_0_3z[9], celloutsig_0_3z[7] };
  assign celloutsig_0_60z[2] = 1'h0;
  assign { celloutsig_1_5z[9:8], celloutsig_1_5z[6:5], celloutsig_1_5z[1:0] } = { celloutsig_1_5z[10], celloutsig_1_5z[10], celloutsig_1_5z[7], celloutsig_1_5z[7], celloutsig_1_5z[3], celloutsig_1_5z[7] };
  assign { out_data[128], out_data[96], out_data[32], out_data[9:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_74z, celloutsig_0_75z };
endmodule
