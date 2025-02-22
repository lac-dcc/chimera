/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [14:0] celloutsig_0_10z;
  reg [5:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [18:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [31:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [17:0] celloutsig_0_23z;
  wire [14:0] celloutsig_0_24z;
  wire [13:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [17:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [15:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [6:0] celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [2:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [2:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [30:0] celloutsig_0_42z;
  wire [13:0] celloutsig_0_43z;
  wire [4:0] celloutsig_0_44z;
  reg [7:0] celloutsig_0_45z;
  wire [4:0] celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire [11:0] celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire celloutsig_0_53z;
  wire [6:0] celloutsig_0_57z;
  wire celloutsig_0_5z;
  wire celloutsig_0_65z;
  wire celloutsig_0_69z;
  wire [24:0] celloutsig_0_6z;
  wire celloutsig_0_71z;
  wire [7:0] celloutsig_0_76z;
  wire celloutsig_0_77z;
  wire celloutsig_0_7z;
  wire [12:0] celloutsig_0_8z;
  wire [15:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_12z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  reg [10:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [8:0] celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [2:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = celloutsig_0_1z ? celloutsig_0_1z : celloutsig_0_2z;
  assign celloutsig_0_51z = ~(celloutsig_0_28z | celloutsig_0_37z);
  assign celloutsig_0_5z = ~(celloutsig_0_3z | celloutsig_0_4z[2]);
  assign celloutsig_0_69z = ~(celloutsig_0_23z[12] | celloutsig_0_43z[9]);
  assign celloutsig_1_7z = ~(celloutsig_1_1z[1] | celloutsig_1_2z);
  assign celloutsig_0_0z = ~((in_data[95] | in_data[9]) & in_data[90]);
  assign celloutsig_0_35z = ~((celloutsig_0_5z | in_data[81]) & celloutsig_0_11z[5]);
  assign celloutsig_0_65z = ~((celloutsig_0_41z | celloutsig_0_16z) & celloutsig_0_31z);
  assign celloutsig_1_18z = ~((celloutsig_1_12z | celloutsig_1_4z[5]) & celloutsig_1_7z);
  assign celloutsig_0_17z = ~((celloutsig_0_0z | celloutsig_0_10z[10]) & celloutsig_0_10z[14]);
  assign celloutsig_0_18z = ~((celloutsig_0_9z[3] | celloutsig_0_15z) & celloutsig_0_17z);
  assign celloutsig_0_2z = ~((celloutsig_0_0z | celloutsig_0_1z) & in_data[6]);
  assign celloutsig_0_27z = ~((celloutsig_0_8z[9] | celloutsig_0_5z) & celloutsig_0_25z[4]);
  assign celloutsig_0_41z = ~((celloutsig_0_16z | celloutsig_0_7z) & (celloutsig_0_33z[2] | celloutsig_0_1z));
  assign celloutsig_0_22z = ~((celloutsig_0_8z[0] | celloutsig_0_5z) & (celloutsig_0_7z | celloutsig_0_3z));
  assign celloutsig_0_48z = celloutsig_0_17z | ~(celloutsig_0_30z[2]);
  assign celloutsig_1_19z = celloutsig_1_2z | ~(celloutsig_1_6z);
  assign celloutsig_1_0z = ~(in_data[190] ^ in_data[97]);
  assign celloutsig_1_2z = ~(celloutsig_1_1z[3] ^ celloutsig_1_0z);
  assign celloutsig_0_16z = ~(celloutsig_0_2z ^ celloutsig_0_10z[11]);
  assign celloutsig_0_40z = { celloutsig_0_4z[1], celloutsig_0_38z, celloutsig_0_12z } & { celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_31z };
  assign celloutsig_0_44z = celloutsig_0_33z[5:1] & { celloutsig_0_33z[4:2], celloutsig_0_22z, celloutsig_0_32z };
  assign celloutsig_0_4z = { in_data[50:45], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_2z } / { 1'h1, in_data[7:1], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z, in_data[0] };
  assign celloutsig_0_9z = celloutsig_0_6z[16:1] / { 1'h1, celloutsig_0_6z[6], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_13z = { in_data[58:42], celloutsig_0_7z, celloutsig_0_7z } / { 1'h1, celloutsig_0_8z[10:9], celloutsig_0_9z };
  assign celloutsig_0_57z = { celloutsig_0_33z[1:0], celloutsig_0_31z, celloutsig_0_21z, celloutsig_0_32z, celloutsig_0_3z, celloutsig_0_35z } / { 1'h1, celloutsig_0_44z[3:0], celloutsig_0_53z, celloutsig_0_51z };
  assign celloutsig_0_29z = { celloutsig_0_6z[21:5], celloutsig_0_16z } / { 1'h1, celloutsig_0_13z[14:1], celloutsig_0_0z, celloutsig_0_22z, celloutsig_0_15z };
  assign celloutsig_0_37z = { celloutsig_0_6z[15:6], celloutsig_0_2z, celloutsig_0_22z } === { celloutsig_0_19z[23:15], celloutsig_0_22z, celloutsig_0_21z, celloutsig_0_21z };
  assign celloutsig_0_71z = { celloutsig_0_29z[9:7], celloutsig_0_41z, celloutsig_0_5z } === { celloutsig_0_57z[3], celloutsig_0_40z, celloutsig_0_31z };
  assign celloutsig_0_77z = { celloutsig_0_46z[4], celloutsig_0_57z } === in_data[59:52];
  assign celloutsig_1_3z = in_data[98:96] === celloutsig_1_1z[8:6];
  assign celloutsig_0_1z = in_data[80:78] === in_data[42:40];
  assign celloutsig_0_32z = { celloutsig_0_4z[9:6], celloutsig_0_30z } <= { celloutsig_0_25z[11:7], celloutsig_0_4z, celloutsig_0_22z, celloutsig_0_1z, celloutsig_0_22z };
  assign celloutsig_0_38z = { celloutsig_0_4z[4:3], celloutsig_0_3z } <= celloutsig_0_8z[8:6];
  assign celloutsig_0_14z = celloutsig_0_6z[17:10] <= { celloutsig_0_6z[14:8], celloutsig_0_2z };
  assign celloutsig_0_15z = celloutsig_0_8z[7:4] <= { celloutsig_0_4z[9:8], celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_0_21z = { celloutsig_0_9z[15:13], celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_1z, celloutsig_0_7z } <= { celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_16z };
  assign celloutsig_0_7z = celloutsig_0_6z[19:9] && { celloutsig_0_4z[9:3], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_6z = in_data[190:175] < { in_data[160:147], celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_28z = { celloutsig_0_8z[12:1], celloutsig_0_3z, celloutsig_0_26z } < { in_data[66:54], celloutsig_0_7z };
  assign celloutsig_0_8z = { in_data[94], celloutsig_0_4z } % { 1'h1, in_data[53:42] };
  assign celloutsig_0_23z = { celloutsig_0_6z[14:6], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_11z } % { 1'h1, celloutsig_0_6z[19:5], celloutsig_0_17z, celloutsig_0_2z };
  assign celloutsig_0_76z = { celloutsig_0_6z[13:10], celloutsig_0_69z, celloutsig_0_53z, celloutsig_0_38z, celloutsig_0_53z } * { celloutsig_0_71z, celloutsig_0_65z, celloutsig_0_48z, celloutsig_0_39z, celloutsig_0_37z, celloutsig_0_53z };
  assign celloutsig_1_4z = { celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z } * in_data[154:146];
  assign celloutsig_0_39z = celloutsig_0_38z ? { celloutsig_0_0z, celloutsig_0_37z, celloutsig_0_17z } : celloutsig_0_30z[2:0];
  assign celloutsig_0_10z = celloutsig_0_0z ? in_data[83:69] : { celloutsig_0_6z[14:2], celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_12z = celloutsig_0_6z[16:9] !== celloutsig_0_9z[10:3];
  assign celloutsig_0_31z = & { celloutsig_0_29z[14:11], celloutsig_0_17z, celloutsig_0_0z };
  assign celloutsig_1_9z = & { celloutsig_1_8z, celloutsig_1_1z[6:0] };
  assign celloutsig_1_12z = ^ { celloutsig_1_8z[1], celloutsig_1_9z, celloutsig_1_8z };
  assign celloutsig_0_26z = ^ in_data[64:58];
  assign celloutsig_0_33z = { celloutsig_0_19z[11:6], celloutsig_0_32z } >> celloutsig_0_29z[13:7];
  assign celloutsig_0_46z = { celloutsig_0_45z[2:0], celloutsig_0_35z, celloutsig_0_27z } >> { in_data[24:21], celloutsig_0_32z };
  assign celloutsig_0_6z = { in_data[85:71], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_2z } >> { in_data[60:45], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_19z = { celloutsig_0_4z[10:9], celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_15z, celloutsig_0_8z } >> { celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_15z };
  assign celloutsig_0_24z = celloutsig_0_23z[14:0] >> { celloutsig_0_10z[13:5], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_18z, celloutsig_0_16z, celloutsig_0_17z, celloutsig_0_12z };
  assign celloutsig_0_30z = { celloutsig_0_28z, celloutsig_0_24z } << { celloutsig_0_1z, celloutsig_0_10z };
  assign celloutsig_1_8z = { celloutsig_1_4z[3:2], celloutsig_1_2z } << { celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_6z };
  assign celloutsig_0_25z = { celloutsig_0_8z[12:1], celloutsig_0_17z, celloutsig_0_18z } << { celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_4z };
  assign celloutsig_0_42z = { celloutsig_0_4z[9:2], celloutsig_0_3z, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_18z, celloutsig_0_26z } - { celloutsig_0_39z[1:0], celloutsig_0_23z, celloutsig_0_31z, celloutsig_0_33z, celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_5z };
  assign celloutsig_0_43z = { celloutsig_0_42z[26:14], celloutsig_0_35z } - { celloutsig_0_23z[9:0], celloutsig_0_0z, celloutsig_0_22z, celloutsig_0_26z, celloutsig_0_2z };
  assign celloutsig_0_53z = ~((celloutsig_0_35z & celloutsig_0_10z[11]) | celloutsig_0_9z[10]);
  always_latch
    if (!clkin_data[64]) celloutsig_0_45z = 8'h00;
    else if (!clkin_data[0]) celloutsig_0_45z = { celloutsig_0_23z[15:10], celloutsig_0_2z, celloutsig_0_22z };
  always_latch
    if (!clkin_data[96]) celloutsig_1_1z = 11'h000;
    else if (!clkin_data[32]) celloutsig_1_1z = { in_data[125:116], celloutsig_1_0z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_11z = 6'h00;
    else if (clkin_data[0]) celloutsig_0_11z = celloutsig_0_10z[11:6];
  assign { out_data[128], out_data[96], out_data[39:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_76z, celloutsig_0_77z };
endmodule
