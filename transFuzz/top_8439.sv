/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [2:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [2:0] celloutsig_0_12z;
  wire [21:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [23:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [18:0] celloutsig_0_17z;
  wire [8:0] celloutsig_0_18z;
  wire [7:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [21:0] celloutsig_0_21z;
  wire [12:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  reg [4:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [14:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [8:0] celloutsig_0_31z;
  wire [11:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [7:0] celloutsig_0_35z;
  wire [2:0] celloutsig_0_37z;
  wire celloutsig_0_39z;
  wire [4:0] celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire [10:0] celloutsig_0_46z;
  wire [5:0] celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire [6:0] celloutsig_0_56z;
  wire celloutsig_0_57z;
  wire [6:0] celloutsig_0_58z;
  wire [13:0] celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_64z;
  wire celloutsig_0_66z;
  wire [30:0] celloutsig_0_68z;
  wire celloutsig_0_6z;
  reg [5:0] celloutsig_0_77z;
  wire celloutsig_0_78z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [22:0] celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [5:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [5:0] celloutsig_1_19z;
  wire [17:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [4:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [2:0] celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_2z = ~(celloutsig_1_1z[9] & celloutsig_1_1z[4]);
  assign celloutsig_0_61z = !(in_data[1] ? celloutsig_0_39z : celloutsig_0_16z);
  assign celloutsig_0_66z = !(celloutsig_0_21z[7] ? celloutsig_0_17z[6] : celloutsig_0_17z[17]);
  assign celloutsig_0_33z = ~(celloutsig_0_4z | celloutsig_0_0z[1]);
  assign celloutsig_0_45z = ~(celloutsig_0_37z[2] | celloutsig_0_29z);
  assign celloutsig_0_64z = ~(celloutsig_0_32z[0] | celloutsig_0_57z);
  assign celloutsig_0_2z = ~(celloutsig_0_0z[0] | in_data[13]);
  assign celloutsig_0_29z = ~(celloutsig_0_3z[0] | celloutsig_0_17z[13]);
  assign celloutsig_0_9z = ~in_data[3];
  assign celloutsig_0_30z = ~((celloutsig_0_19z[4] | celloutsig_0_18z[1]) & celloutsig_0_1z);
  assign celloutsig_0_42z = ~((celloutsig_0_3z[4] | celloutsig_0_31z[5]) & celloutsig_0_25z);
  assign celloutsig_0_4z = celloutsig_0_0z[1] | ~(celloutsig_0_1z);
  assign celloutsig_1_15z = celloutsig_1_11z | ~(in_data[170]);
  assign celloutsig_0_28z = celloutsig_0_2z | ~(celloutsig_0_3z[2]);
  assign celloutsig_1_13z = celloutsig_1_12z | celloutsig_1_8z[0];
  assign celloutsig_0_7z = celloutsig_0_1z ^ celloutsig_0_4z;
  assign celloutsig_1_5z = celloutsig_1_3z[4] ^ celloutsig_1_0z[19];
  assign celloutsig_1_11z = ~(celloutsig_1_1z[1] ^ in_data[132]);
  assign celloutsig_0_21z = { celloutsig_0_15z[3:0], celloutsig_0_16z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_11z } + { celloutsig_0_17z[17:5], celloutsig_0_18z };
  assign celloutsig_0_46z = celloutsig_0_26z[14:4] & { in_data[87:80], celloutsig_0_2z, celloutsig_0_42z, celloutsig_0_8z };
  assign celloutsig_0_15z = { in_data[62:53], celloutsig_0_9z, celloutsig_0_14z, celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_6z } & { in_data[90:74], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_9z };
  assign celloutsig_0_0z = in_data[95:93] / { 1'h1, in_data[38:37] };
  assign celloutsig_0_32z = in_data[73:62] / { 1'h1, celloutsig_0_22z[10:0] };
  assign celloutsig_0_35z = { celloutsig_0_3z[3:2], celloutsig_0_9z, celloutsig_0_24z } / { 1'h1, in_data[49:48], celloutsig_0_25z, celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_23z, celloutsig_0_25z };
  assign celloutsig_0_18z = in_data[48:40] / { 1'h1, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_8z };
  assign celloutsig_0_34z = { celloutsig_0_18z[3:0], celloutsig_0_29z } == { celloutsig_0_31z[5], celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_20z, celloutsig_0_16z };
  assign celloutsig_0_52z = celloutsig_0_21z[17:14] == celloutsig_0_19z[4:1];
  assign celloutsig_0_11z = celloutsig_0_3z[4:3] == { celloutsig_0_5z[2], celloutsig_0_6z };
  assign celloutsig_0_27z = celloutsig_0_19z[7:1] == celloutsig_0_19z[6:0];
  assign celloutsig_0_78z = { celloutsig_0_23z, celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_42z } >= { celloutsig_0_56z[6:4], celloutsig_0_53z };
  assign celloutsig_1_4z = celloutsig_1_3z >= in_data[105:101];
  assign celloutsig_0_39z = { celloutsig_0_9z, celloutsig_0_0z } <= celloutsig_0_3z[3:0];
  assign celloutsig_0_53z = celloutsig_0_24z[4:1] <= { celloutsig_0_24z[2:0], celloutsig_0_6z };
  assign celloutsig_0_47z = { celloutsig_0_3z, celloutsig_0_29z } % { 1'h1, celloutsig_0_24z };
  assign celloutsig_0_12z = { celloutsig_0_3z[0], celloutsig_0_7z, celloutsig_0_10z } % { 1'h1, celloutsig_0_0z[1], celloutsig_0_2z };
  assign celloutsig_0_26z = { celloutsig_0_13z[4:2], celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_3z } * celloutsig_0_21z[19:5];
  assign celloutsig_0_44z = celloutsig_0_21z[21:11] != { celloutsig_0_22z[8:1], celloutsig_0_0z };
  assign celloutsig_0_25z = celloutsig_0_13z[21:5] != { celloutsig_0_22z[10:8], celloutsig_0_5z };
  assign celloutsig_1_8z = ~ in_data[119:117];
  assign celloutsig_1_19z = ~ { celloutsig_1_1z[7:3], celloutsig_1_15z };
  assign celloutsig_0_37z = { celloutsig_0_12z[1:0], celloutsig_0_11z } | { celloutsig_0_19z[7:6], celloutsig_0_10z };
  assign celloutsig_0_58z = celloutsig_0_19z[7:1] | { celloutsig_0_6z, celloutsig_0_44z, celloutsig_0_25z, celloutsig_0_45z, celloutsig_0_34z, celloutsig_0_52z, celloutsig_0_6z };
  assign celloutsig_0_17z = { celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_2z } | celloutsig_0_13z[18:0];
  assign celloutsig_0_19z = celloutsig_0_17z[16:9] | celloutsig_0_17z[18:11];
  assign celloutsig_0_41z = & celloutsig_0_19z[5:3];
  assign celloutsig_0_57z = & celloutsig_0_21z[16:13];
  assign celloutsig_0_16z = & { celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_6z = celloutsig_0_2z & celloutsig_0_4z;
  assign celloutsig_1_12z = ^ celloutsig_1_0z[3:0];
  assign celloutsig_0_31z = { celloutsig_0_18z[8:2], celloutsig_0_8z, celloutsig_0_8z } >> { in_data[71:66], celloutsig_0_23z, celloutsig_0_6z, celloutsig_0_30z };
  assign celloutsig_0_3z = { in_data[55], celloutsig_0_0z, celloutsig_0_1z } >> in_data[6:2];
  assign celloutsig_0_5z = { in_data[25:14], celloutsig_0_1z, celloutsig_0_2z } >> in_data[60:47];
  assign celloutsig_1_0z = in_data[154:132] >> in_data[147:125];
  assign celloutsig_0_13z = { in_data[51:32], celloutsig_0_8z, celloutsig_0_2z } >> { celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_0_56z = { celloutsig_0_15z[16:11], celloutsig_0_33z } ^ { celloutsig_0_21z[1:0], celloutsig_0_7z, celloutsig_0_41z, celloutsig_0_12z };
  assign celloutsig_0_68z = { celloutsig_0_58z[4:3], celloutsig_0_61z, celloutsig_0_26z, celloutsig_0_64z, celloutsig_0_44z, celloutsig_0_1z, celloutsig_0_25z, celloutsig_0_28z, celloutsig_0_58z, celloutsig_0_16z } ^ { celloutsig_0_31z[6:1], celloutsig_0_52z, celloutsig_0_66z, celloutsig_0_35z, celloutsig_0_31z, celloutsig_0_33z, celloutsig_0_41z, celloutsig_0_48z, celloutsig_0_20z, celloutsig_0_53z, celloutsig_0_27z };
  assign celloutsig_1_1z = celloutsig_1_0z[18:1] ^ in_data[142:125];
  assign celloutsig_1_3z = { celloutsig_1_0z[12:9], celloutsig_1_2z } ^ in_data[133:129];
  assign celloutsig_1_14z = { in_data[191:187], celloutsig_1_2z } ^ { celloutsig_1_0z[8:4], celloutsig_1_4z };
  assign celloutsig_0_22z = celloutsig_0_17z[14:2] ^ { celloutsig_0_18z[8:6], celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_14z };
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_77z = 6'h00;
    else if (!clkin_data[32]) celloutsig_0_77z = celloutsig_0_68z[7:2];
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_24z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_24z = { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_14z };
  assign celloutsig_0_48z = ~((celloutsig_0_16z & celloutsig_0_47z[4]) | (celloutsig_0_46z[4] & celloutsig_0_32z[3]));
  assign celloutsig_0_8z = ~((in_data[65] & in_data[34]) | (celloutsig_0_7z & celloutsig_0_7z));
  assign celloutsig_1_18z = ~((celloutsig_1_13z & celloutsig_1_14z[3]) | (celloutsig_1_13z & celloutsig_1_5z));
  assign celloutsig_0_10z = ~((celloutsig_0_7z & celloutsig_0_9z) | (celloutsig_0_7z & celloutsig_0_7z));
  assign celloutsig_0_1z = ~((in_data[0] & in_data[25]) | (in_data[0] & in_data[2]));
  assign celloutsig_0_14z = ~((celloutsig_0_5z[9] & celloutsig_0_13z[2]) | (celloutsig_0_11z & celloutsig_0_6z));
  assign celloutsig_0_20z = ~((celloutsig_0_5z[13] & celloutsig_0_2z) | (celloutsig_0_5z[10] & celloutsig_0_2z));
  assign celloutsig_0_23z = ~((celloutsig_0_19z[6] & celloutsig_0_0z[0]) | (celloutsig_0_4z & in_data[8]));
  assign { out_data[128], out_data[101:96], out_data[37:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_77z, celloutsig_0_78z };
endmodule
