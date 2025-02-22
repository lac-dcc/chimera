/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [8:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [9:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [16:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [4:0] celloutsig_0_1z;
  wire [2:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [12:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [9:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [2:0] celloutsig_0_26z;
  wire [2:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [6:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [3:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  reg [15:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [13:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [14:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [12:0] celloutsig_0_44z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [5:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire [2:0] celloutsig_0_53z;
  wire [4:0] celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire [4:0] celloutsig_0_60z;
  wire celloutsig_0_61z;
  wire celloutsig_0_63z;
  wire celloutsig_0_64z;
  wire celloutsig_0_66z;
  wire [4:0] celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire [3:0] celloutsig_0_71z;
  wire celloutsig_0_7z;
  wire celloutsig_0_84z;
  wire [3:0] celloutsig_0_89z;
  wire celloutsig_0_8z;
  wire [33:0] celloutsig_0_93z;
  wire celloutsig_0_94z;
  wire celloutsig_0_9z;
  wire [9:0] celloutsig_1_0z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_5z;
  wire [5:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_41z = celloutsig_0_10z[3] ? celloutsig_0_11z : celloutsig_0_36z[4];
  assign celloutsig_0_58z = celloutsig_0_13z[6] ? celloutsig_0_17z : celloutsig_0_19z;
  assign celloutsig_1_9z = celloutsig_1_2z ? celloutsig_1_3z : celloutsig_1_7z;
  assign celloutsig_0_19z = celloutsig_0_3z ? celloutsig_0_1z[1] : celloutsig_0_13z[3];
  assign celloutsig_0_38z = ~(celloutsig_0_24z[5] & celloutsig_0_32z);
  assign celloutsig_0_52z = ~(celloutsig_0_22z[1] & celloutsig_0_18z);
  assign celloutsig_0_6z = ~(celloutsig_0_4z[2] & celloutsig_0_3z);
  assign celloutsig_0_66z = ~(celloutsig_0_55z & celloutsig_0_29z);
  assign celloutsig_0_84z = ~(celloutsig_0_71z[1] & celloutsig_0_70z);
  assign celloutsig_1_2z = ~(in_data[168] & celloutsig_1_1z);
  assign celloutsig_1_3z = ~(in_data[179] & in_data[174]);
  assign celloutsig_1_18z = ~(celloutsig_1_9z & celloutsig_1_5z);
  assign celloutsig_0_12z = ~(celloutsig_0_7z & celloutsig_0_1z[1]);
  assign celloutsig_0_21z = ~(celloutsig_0_2z[1] & celloutsig_0_10z[0]);
  assign celloutsig_0_32z = ~(celloutsig_0_10z[0] | celloutsig_0_31z[1]);
  assign celloutsig_0_34z = ~(celloutsig_0_13z[4] | celloutsig_0_22z[12]);
  assign celloutsig_0_50z = ~celloutsig_0_22z[1];
  assign celloutsig_0_0z = in_data[89] | in_data[92];
  assign celloutsig_0_55z = celloutsig_0_24z[3] | celloutsig_0_52z;
  assign celloutsig_0_61z = celloutsig_0_58z | celloutsig_0_51z;
  assign celloutsig_0_8z = celloutsig_0_4z[4] | celloutsig_0_5z;
  assign celloutsig_1_5z = celloutsig_1_3z | in_data[160];
  assign celloutsig_0_28z = { celloutsig_0_17z, celloutsig_0_19z, celloutsig_0_0z } & { celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_5z };
  assign celloutsig_0_3z = celloutsig_0_2z == { celloutsig_0_1z[4:3], celloutsig_0_1z };
  assign celloutsig_0_64z = { celloutsig_0_39z[7:6], celloutsig_0_0z, celloutsig_0_2z } == { celloutsig_0_36z[5:2], celloutsig_0_14z, celloutsig_0_50z, celloutsig_0_46z, celloutsig_0_51z };
  assign celloutsig_0_7z = { celloutsig_0_4z[0], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z } == in_data[59:46];
  assign celloutsig_0_70z = { celloutsig_0_13z[5:2], celloutsig_0_63z, celloutsig_0_66z, celloutsig_0_11z } == { celloutsig_0_53z[0], celloutsig_0_6z, celloutsig_0_23z, celloutsig_0_47z, celloutsig_0_64z, celloutsig_0_38z, celloutsig_0_17z };
  assign celloutsig_0_29z = celloutsig_0_24z[8:4] == celloutsig_0_2z[5:1];
  assign celloutsig_0_30z = { celloutsig_0_20z, celloutsig_0_19z, celloutsig_0_5z } == { celloutsig_0_24z[3:1], celloutsig_0_15z, celloutsig_0_18z };
  assign celloutsig_0_51z = { celloutsig_0_36z[5], celloutsig_0_26z, celloutsig_0_11z } > celloutsig_0_13z[4:0];
  assign celloutsig_0_94z = { celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_34z, celloutsig_0_52z } > { celloutsig_0_61z, celloutsig_0_89z, celloutsig_0_31z, celloutsig_0_17z };
  assign celloutsig_0_5z = { in_data[22:20], celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_3z } && { celloutsig_0_1z[3:0], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_37z = ! celloutsig_0_10z[8:1];
  assign celloutsig_1_16z = ! { celloutsig_1_6z[4:0], celloutsig_1_9z };
  assign celloutsig_1_7z = { celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_5z } || { celloutsig_1_0z[4:3], celloutsig_1_0z };
  assign celloutsig_0_17z = { celloutsig_0_2z[4:2], celloutsig_0_0z } || { celloutsig_0_16z[13], celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_5z };
  assign celloutsig_0_23z = celloutsig_0_10z[8:4] || { celloutsig_0_8z, celloutsig_0_19z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_6z };
  assign celloutsig_0_4z = { in_data[77:73], celloutsig_0_0z } % { 1'h1, celloutsig_0_1z };
  assign celloutsig_0_54z = { celloutsig_0_33z[15:12], celloutsig_0_8z } % { 1'h1, celloutsig_0_26z[1:0], celloutsig_0_34z, celloutsig_0_9z };
  assign celloutsig_1_6z = { celloutsig_1_0z[6:3], celloutsig_1_2z, celloutsig_1_3z } % { 1'h1, in_data[102:98] };
  assign celloutsig_0_36z = { celloutsig_0_33z[4:0], celloutsig_0_20z, celloutsig_0_25z, celloutsig_0_32z, celloutsig_0_25z, celloutsig_0_9z, celloutsig_0_32z, celloutsig_0_17z } % { 1'h1, celloutsig_0_10z[5:0], celloutsig_0_8z, celloutsig_0_34z, celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_19z };
  assign celloutsig_0_44z = { celloutsig_0_2z[6:1], celloutsig_0_38z, celloutsig_0_12z, celloutsig_0_41z, celloutsig_0_38z, celloutsig_0_30z, celloutsig_0_38z, celloutsig_0_40z } % { 1'h1, celloutsig_0_11z, celloutsig_0_24z, celloutsig_0_19z };
  assign celloutsig_0_60z = { celloutsig_0_15z, celloutsig_0_26z, celloutsig_0_42z } % { 1'h1, celloutsig_0_33z[11:9], celloutsig_0_17z };
  assign celloutsig_0_10z = { celloutsig_0_2z[4:3], celloutsig_0_4z, celloutsig_0_7z } % { 1'h1, in_data[78:73], celloutsig_0_8z, celloutsig_0_0z };
  assign celloutsig_0_14z = { in_data[23:22], celloutsig_0_11z } % { 1'h1, celloutsig_0_1z[3:2] };
  assign celloutsig_0_2z = { celloutsig_0_1z[3], celloutsig_0_1z, celloutsig_0_0z } % { 1'h1, celloutsig_0_1z, in_data[0] };
  assign celloutsig_0_59z = & { celloutsig_0_52z, celloutsig_0_47z, celloutsig_0_30z, celloutsig_0_24z[2], celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_5z };
  assign celloutsig_0_63z = celloutsig_0_33z[4] & celloutsig_0_54z[2];
  assign celloutsig_1_1z = in_data[124] & in_data[123];
  assign celloutsig_0_18z = celloutsig_0_6z & celloutsig_0_14z[0];
  assign celloutsig_0_40z = | { celloutsig_0_29z, celloutsig_0_11z, celloutsig_0_8z, in_data[88:84], celloutsig_0_0z };
  assign celloutsig_0_42z = ~^ { in_data[51:42], celloutsig_0_30z, celloutsig_0_40z, celloutsig_0_38z, celloutsig_0_7z, celloutsig_0_11z };
  assign celloutsig_0_9z = ~^ { celloutsig_0_1z[4:1], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_0_39z = { celloutsig_0_33z[8], celloutsig_0_20z, celloutsig_0_25z, celloutsig_0_1z, celloutsig_0_19z, celloutsig_0_28z, celloutsig_0_8z } >> { celloutsig_0_24z[4:1], celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_10z };
  assign celloutsig_0_89z = { celloutsig_0_44z[0], celloutsig_0_63z, celloutsig_0_6z, celloutsig_0_12z } >> { celloutsig_0_22z[11], celloutsig_0_37z, celloutsig_0_11z, celloutsig_0_84z };
  assign celloutsig_0_22z = { celloutsig_0_10z[2:0], celloutsig_0_15z, celloutsig_0_10z } >> { celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_6z };
  assign celloutsig_0_67z = celloutsig_0_2z[4:0] <<< { celloutsig_0_28z[1:0], celloutsig_0_52z, celloutsig_0_18z, celloutsig_0_61z };
  assign celloutsig_1_0z = in_data[163:154] <<< in_data[188:179];
  assign celloutsig_0_1z = in_data[52:48] <<< in_data[79:75];
  assign celloutsig_0_16z = { celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_3z } <<< { celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_12z };
  assign celloutsig_0_26z = { celloutsig_0_10z[5:4], celloutsig_0_3z } <<< { celloutsig_0_1z[2:1], celloutsig_0_3z };
  assign celloutsig_0_93z = { celloutsig_0_39z[10:4], celloutsig_0_39z, celloutsig_0_37z, celloutsig_0_53z, celloutsig_0_59z, celloutsig_0_12z, celloutsig_0_30z, celloutsig_0_54z } - { celloutsig_0_59z, celloutsig_0_36z, celloutsig_0_14z, celloutsig_0_60z, celloutsig_0_67z, celloutsig_0_4z };
  assign celloutsig_0_13z = { celloutsig_0_4z[3], celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_5z } - { in_data[52:48], celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_5z };
  assign celloutsig_0_20z = { celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_11z } - { in_data[30], celloutsig_0_11z, celloutsig_0_5z };
  assign celloutsig_0_53z = celloutsig_0_28z ~^ { celloutsig_0_44z[0], celloutsig_0_51z, celloutsig_0_41z };
  assign celloutsig_0_31z = celloutsig_0_13z[3:0] ~^ { celloutsig_0_28z[1:0], celloutsig_0_18z, celloutsig_0_3z };
  assign celloutsig_0_71z = { celloutsig_0_31z[1:0], celloutsig_0_46z, celloutsig_0_35z } ^ { celloutsig_0_31z[2:0], celloutsig_0_66z };
  assign celloutsig_0_24z = { celloutsig_0_4z[5:2], celloutsig_0_14z, celloutsig_0_21z, celloutsig_0_5z, celloutsig_0_17z } ^ { celloutsig_0_22z[10:9], celloutsig_0_18z, celloutsig_0_4z, celloutsig_0_7z };
  assign celloutsig_0_47z = ~((celloutsig_0_0z & celloutsig_0_4z[4]) | celloutsig_0_20z[1]);
  assign celloutsig_0_11z = ~((celloutsig_0_9z & celloutsig_0_6z) | celloutsig_0_5z);
  always_latch
    if (celloutsig_1_18z) celloutsig_0_33z = 16'h0000;
    else if (clkin_data[0]) celloutsig_0_33z = { in_data[54:52], celloutsig_0_23z, celloutsig_0_2z, celloutsig_0_25z, celloutsig_0_0z, celloutsig_0_20z };
  assign celloutsig_0_35z = ~((celloutsig_0_24z[0] & celloutsig_0_24z[8]) | (celloutsig_0_8z & celloutsig_0_23z));
  assign celloutsig_0_46z = ~((celloutsig_0_34z & celloutsig_0_7z) | (celloutsig_0_14z[0] & celloutsig_0_38z));
  assign celloutsig_1_19z = ~((celloutsig_1_2z & celloutsig_1_16z) | (celloutsig_1_1z & in_data[155]));
  assign celloutsig_0_15z = ~((celloutsig_0_4z[1] & celloutsig_0_0z) | (celloutsig_0_9z & celloutsig_0_8z));
  assign celloutsig_0_25z = ~((celloutsig_0_17z & celloutsig_0_4z[5]) | (celloutsig_0_21z & celloutsig_0_4z[0]));
  assign { out_data[128], out_data[96], out_data[63:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_93z[32:1], celloutsig_0_94z };
endmodule
