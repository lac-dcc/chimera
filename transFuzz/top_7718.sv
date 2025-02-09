/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [4:0] _00_;
  reg [4:0] _01_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  reg [6:0] celloutsig_0_13z;
  reg [5:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [9:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [8:0] celloutsig_0_22z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire [4:0] celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire [17:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  reg [3:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [9:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire [5:0] celloutsig_0_47z;
  wire [17:0] celloutsig_0_48z;
  wire [2:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_52z;
  wire [2:0] celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire [3:0] celloutsig_0_55z;
  wire [13:0] celloutsig_0_56z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_0_63z;
  wire celloutsig_0_64z;
  wire celloutsig_0_66z;
  wire celloutsig_0_68z;
  wire [8:0] celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_71z;
  wire celloutsig_0_72z;
  wire [8:0] celloutsig_0_74z;
  wire [5:0] celloutsig_0_75z;
  wire celloutsig_0_77z;
  wire [3:0] celloutsig_0_7z;
  wire [17:0] celloutsig_0_83z;
  wire [9:0] celloutsig_0_84z;
  wire [4:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [5:0] celloutsig_1_0z;
  wire [7:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [7:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [14:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [22:0] celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_32z = ~(celloutsig_0_18z & celloutsig_0_3z);
  assign celloutsig_0_40z = ~(celloutsig_0_21z & celloutsig_0_5z[0]);
  assign celloutsig_0_45z = !(celloutsig_0_30z ? celloutsig_0_14z[0] : celloutsig_0_0z);
  assign celloutsig_0_26z = !(celloutsig_0_7z[0] ? celloutsig_0_9z : celloutsig_0_3z);
  assign celloutsig_0_64z = ~(celloutsig_0_39z[8] | celloutsig_0_20z);
  assign celloutsig_0_29z = ~(celloutsig_0_24z | celloutsig_0_9z);
  assign celloutsig_1_12z = ~((celloutsig_1_5z | celloutsig_1_2z[14]) & celloutsig_1_5z);
  assign celloutsig_1_5z = celloutsig_1_3z | celloutsig_1_0z[1];
  assign celloutsig_1_8z = celloutsig_1_3z | celloutsig_1_6z[11];
  assign celloutsig_0_31z = celloutsig_0_1z | celloutsig_0_4z;
  assign celloutsig_0_38z = celloutsig_0_18z ^ celloutsig_0_2z[4];
  assign celloutsig_0_0z = ~(in_data[15] ^ in_data[45]);
  assign celloutsig_0_50z = ~(celloutsig_0_0z ^ celloutsig_0_49z[2]);
  assign celloutsig_0_66z = ~(celloutsig_0_10z ^ celloutsig_0_54z);
  assign celloutsig_0_16z = ~(in_data[49] ^ celloutsig_0_3z);
  assign celloutsig_0_18z = ~(celloutsig_0_0z ^ celloutsig_0_13z[3]);
  always_ff @(negedge clkin_data[128], negedge clkin_data[32])
    if (!clkin_data[32]) _00_ <= 5'h00;
    else _00_ <= celloutsig_0_8z;
  always_ff @(negedge clkin_data[128], negedge clkin_data[64])
    if (!clkin_data[64]) _01_ <= 5'h00;
    else _01_ <= _00_;
  assign celloutsig_0_74z = { in_data[86:81], celloutsig_0_42z, celloutsig_0_40z, celloutsig_0_18z } / { 1'h1, celloutsig_0_6z[6:0], celloutsig_0_21z };
  assign celloutsig_1_10z = celloutsig_1_2z[8:1] / { 1'h1, celloutsig_1_2z[11:6], celloutsig_1_9z };
  assign celloutsig_0_22z = { _00_[4:1], celloutsig_0_16z, celloutsig_0_7z } / { 1'h1, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_9z };
  assign celloutsig_0_49z = celloutsig_0_7z[2:0] / { 1'h1, celloutsig_0_6z[1], celloutsig_0_18z };
  assign celloutsig_0_42z = { celloutsig_0_13z[4:0], celloutsig_0_30z } == { celloutsig_0_8z[4:1], celloutsig_0_21z, celloutsig_0_40z };
  assign celloutsig_1_11z = celloutsig_1_6z[5:3] == { celloutsig_1_10z[5:4], celloutsig_1_3z };
  assign celloutsig_1_14z = { celloutsig_1_0z[5:4], celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_12z, celloutsig_1_11z } == { celloutsig_1_0z[3:0], celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_0_1z = { in_data[29:20], celloutsig_0_0z } == in_data[34:24];
  assign celloutsig_0_33z = { celloutsig_0_2z[5:0], celloutsig_0_18z, celloutsig_0_4z } && { _01_[4:3], celloutsig_0_15z, celloutsig_0_8z };
  assign celloutsig_1_19z = celloutsig_1_6z[21:6] && { celloutsig_1_10z[6:3], celloutsig_1_4z, celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_13z, celloutsig_1_15z, celloutsig_1_17z, celloutsig_1_15z };
  assign celloutsig_0_30z = { celloutsig_0_13z[4:1], celloutsig_0_10z, celloutsig_0_11z } && { in_data[46:43], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_44z = ! { celloutsig_0_30z, celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_0z };
  assign celloutsig_1_13z = ! { celloutsig_1_6z[8], celloutsig_1_9z, celloutsig_1_5z };
  assign celloutsig_0_20z = ! { celloutsig_0_12z[0], celloutsig_0_13z, celloutsig_0_6z };
  assign celloutsig_0_35z = { celloutsig_0_16z, celloutsig_0_6z } || { celloutsig_0_2z[17:16], celloutsig_0_20z, celloutsig_0_0z, celloutsig_0_21z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_31z, celloutsig_0_29z, celloutsig_0_32z };
  assign celloutsig_0_63z = { celloutsig_0_5z[2], celloutsig_0_22z, celloutsig_0_13z } || { celloutsig_0_22z[5], _01_, celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_10z };
  assign celloutsig_0_47z = { celloutsig_0_13z[2:1], celloutsig_0_46z, celloutsig_0_34z, celloutsig_0_35z, celloutsig_0_42z } * { celloutsig_0_34z, celloutsig_0_42z, celloutsig_0_0z, celloutsig_0_29z, celloutsig_0_11z, celloutsig_0_29z };
  assign celloutsig_0_6z = { celloutsig_0_2z[4:1], celloutsig_0_5z } * { in_data[92:85], celloutsig_0_1z };
  assign celloutsig_0_55z = { celloutsig_0_12z[3], celloutsig_0_40z, celloutsig_0_52z, celloutsig_0_10z } * { _00_[3:1], celloutsig_0_21z };
  assign celloutsig_0_56z = { celloutsig_0_2z[15:6], celloutsig_0_44z, celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_1z } * { celloutsig_0_5z[2:0], celloutsig_0_49z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_31z, celloutsig_0_55z };
  assign celloutsig_0_83z = { celloutsig_0_74z[8:1], celloutsig_0_75z, celloutsig_0_21z, celloutsig_0_24z, celloutsig_0_70z, celloutsig_0_11z } * { celloutsig_0_56z[7:4], celloutsig_0_26z, celloutsig_0_46z, celloutsig_0_26z, celloutsig_0_6z, celloutsig_0_64z, celloutsig_0_33z };
  assign celloutsig_0_84z = { celloutsig_0_83z[6:5], celloutsig_0_21z, celloutsig_0_63z, celloutsig_0_49z, celloutsig_0_45z, celloutsig_0_63z, celloutsig_0_30z } * { celloutsig_0_17z[3:0], celloutsig_0_77z, celloutsig_0_71z, celloutsig_0_1z, celloutsig_0_33z, celloutsig_0_72z, celloutsig_0_31z };
  assign celloutsig_0_2z = { in_data[50:36], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z } * { in_data[46:30], celloutsig_0_0z };
  assign celloutsig_0_39z = celloutsig_0_3z ? celloutsig_0_17z : { celloutsig_0_30z, celloutsig_0_6z };
  assign celloutsig_1_0z = in_data[117] ? in_data[182:177] : in_data[138:133];
  assign celloutsig_1_2z = celloutsig_1_0z[1] ? { in_data[189:181], celloutsig_1_0z[5:2], 1'h1, celloutsig_1_0z[0] } : in_data[161:147];
  assign celloutsig_0_27z = celloutsig_0_18z ? in_data[44:40] : { celloutsig_0_14z[5:2], celloutsig_0_11z };
  assign celloutsig_0_34z = { celloutsig_0_27z[2:0], celloutsig_0_11z } != { celloutsig_0_22z[5:3], celloutsig_0_16z };
  assign celloutsig_0_41z = { in_data[81:76], celloutsig_0_37z, celloutsig_0_4z, celloutsig_0_0z } != { celloutsig_0_2z[16:15], celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_36z, celloutsig_0_35z };
  assign celloutsig_0_70z = { celloutsig_0_12z[2:1], celloutsig_0_10z, celloutsig_0_54z, celloutsig_0_31z, celloutsig_0_33z } != { _00_[3:0], celloutsig_0_68z, celloutsig_0_1z };
  assign celloutsig_0_72z = { celloutsig_0_14z[3:0], celloutsig_0_32z, celloutsig_0_52z } != { celloutsig_0_2z[13], celloutsig_0_27z };
  assign celloutsig_0_77z = { celloutsig_0_35z, celloutsig_0_52z, celloutsig_0_24z, celloutsig_0_53z } != { celloutsig_0_49z[0], celloutsig_0_63z, celloutsig_0_36z };
  assign celloutsig_0_15z = { in_data[35:28], celloutsig_0_11z } != { celloutsig_0_2z[15:10], celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_21z = { celloutsig_0_12z[3], celloutsig_0_16z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_3z } != { celloutsig_0_13z[5:2], celloutsig_0_0z };
  assign celloutsig_0_53z = - _01_[4:2];
  assign celloutsig_0_12z = - { celloutsig_0_7z[2:0], celloutsig_0_1z };
  assign celloutsig_0_46z = { celloutsig_0_13z[3:2], celloutsig_0_38z } !== celloutsig_0_2z[7:5];
  assign celloutsig_0_52z = { celloutsig_0_34z, celloutsig_0_35z, celloutsig_0_17z, celloutsig_0_50z, celloutsig_0_26z, celloutsig_0_16z, celloutsig_0_35z } !== { in_data[26:25], celloutsig_0_46z, celloutsig_0_26z, celloutsig_0_12z, celloutsig_0_45z, celloutsig_0_18z, celloutsig_0_46z, celloutsig_0_50z, celloutsig_0_44z, celloutsig_0_29z, celloutsig_0_33z, celloutsig_0_26z };
  assign celloutsig_0_54z = { in_data[55:53], celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_46z } !== { celloutsig_0_12z[2:0], celloutsig_0_31z, celloutsig_0_45z, celloutsig_0_10z };
  assign celloutsig_0_68z = { celloutsig_0_22z[6:5], celloutsig_0_29z, celloutsig_0_45z, celloutsig_0_45z } !== { celloutsig_0_47z[3], celloutsig_0_26z, celloutsig_0_43z, celloutsig_0_11z, celloutsig_0_29z };
  assign celloutsig_0_9z = celloutsig_0_2z[9:2] !== in_data[81:74];
  assign celloutsig_1_1z = in_data[114] !== celloutsig_1_0z[0];
  assign celloutsig_1_4z = in_data[190:185] !== { in_data[173:172], celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_10z = in_data[35:26] !== { celloutsig_0_2z[7:3], celloutsig_0_7z, celloutsig_0_3z };
  assign celloutsig_1_17z = { celloutsig_1_0z[5:2], celloutsig_1_12z } !== { celloutsig_1_16z[6:4], celloutsig_1_11z, celloutsig_1_4z };
  assign celloutsig_0_8z = in_data[68:64] | { celloutsig_0_7z, celloutsig_0_0z };
  assign celloutsig_0_75z = { celloutsig_0_48z[15:14], celloutsig_0_15z, celloutsig_0_37z, celloutsig_0_50z, celloutsig_0_4z } | { celloutsig_0_48z[6], celloutsig_0_48z[7], celloutsig_0_48z[4], celloutsig_0_64z, celloutsig_0_70z, celloutsig_0_32z };
  assign celloutsig_0_17z = { in_data[8:0], celloutsig_0_11z } | { celloutsig_0_6z[8:4], celloutsig_0_5z };
  assign celloutsig_1_3z = & celloutsig_1_0z;
  assign celloutsig_1_9z = & { celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_37z = | { celloutsig_0_13z[1], celloutsig_0_34z, celloutsig_0_4z };
  assign celloutsig_0_11z = | { celloutsig_0_6z[7], celloutsig_0_3z, celloutsig_0_9z };
  assign celloutsig_1_15z = ~^ { celloutsig_1_2z[4], celloutsig_1_11z, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_0_3z = ^ celloutsig_0_2z[14:10];
  assign celloutsig_0_4z = ^ in_data[27:22];
  assign celloutsig_0_71z = ^ { celloutsig_0_39z[6:0], celloutsig_0_66z };
  assign celloutsig_0_7z = { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_4z } << celloutsig_0_5z[3:0];
  assign celloutsig_0_5z = { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_1z } - { celloutsig_0_2z[4:1], celloutsig_0_3z };
  assign celloutsig_1_6z = in_data[149:127] ~^ in_data[142:120];
  assign celloutsig_1_16z = { celloutsig_1_6z[18:13], celloutsig_1_12z, celloutsig_1_4z } ~^ { celloutsig_1_10z[4:1], celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_9z };
  assign celloutsig_0_24z = ~((in_data[34] & in_data[28]) | celloutsig_0_17z[4]);
  always_latch
    if (!clkin_data[64]) celloutsig_0_36z = 4'h0;
    else if (!celloutsig_1_18z) celloutsig_0_36z = { celloutsig_0_27z[2:1], celloutsig_0_26z, celloutsig_0_20z };
  always_latch
    if (clkin_data[64]) celloutsig_0_13z = 7'h00;
    else if (clkin_data[0]) celloutsig_0_13z = { in_data[53:49], celloutsig_0_9z, celloutsig_0_4z };
  always_latch
    if (clkin_data[32]) celloutsig_0_14z = 6'h00;
    else if (!celloutsig_1_18z) celloutsig_0_14z = in_data[23:18];
  assign celloutsig_0_43z = ~((celloutsig_0_42z & celloutsig_0_15z) | (in_data[45] & celloutsig_0_30z));
  assign celloutsig_1_18z = ~((celloutsig_1_14z & celloutsig_1_2z[12]) | (celloutsig_1_8z & celloutsig_1_3z));
  assign { celloutsig_0_48z[6], celloutsig_0_48z[7], celloutsig_0_48z[14], celloutsig_0_48z[9:8], celloutsig_0_48z[3], celloutsig_0_48z[10], celloutsig_0_48z[12], celloutsig_0_48z[0], celloutsig_0_48z[4], celloutsig_0_48z[1], celloutsig_0_48z[17:15], celloutsig_0_48z[13] } = ~ { celloutsig_0_44z, celloutsig_0_41z, celloutsig_0_40z, celloutsig_0_35z, celloutsig_0_32z, celloutsig_0_20z, celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_1z, in_data[67:65], celloutsig_0_0z };
  assign { celloutsig_0_48z[11], celloutsig_0_48z[5], celloutsig_0_48z[2] } = { celloutsig_0_48z[14], celloutsig_0_48z[7], celloutsig_0_48z[10] };
  assign { out_data[128], out_data[96], out_data[49:32], out_data[9:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_83z, celloutsig_0_84z };
endmodule
