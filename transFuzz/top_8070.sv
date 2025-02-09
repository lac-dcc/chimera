/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [6:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [11:0] celloutsig_0_22z;
  wire [6:0] celloutsig_0_23z;
  wire [11:0] celloutsig_0_24z;
  wire [20:0] celloutsig_0_25z;
  wire [10:0] celloutsig_0_26z;
  wire [8:0] celloutsig_0_27z;
  wire [2:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [6:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [39:0] celloutsig_0_41z;
  wire [6:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire celloutsig_0_47z;
  wire [15:0] celloutsig_0_50z;
  reg [23:0] celloutsig_0_52z;
  wire [2:0] celloutsig_0_53z;
  wire celloutsig_0_55z;
  wire [2:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  reg [10:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [15:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [3:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [5:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [5:0] celloutsig_1_3z;
  reg [11:0] celloutsig_1_4z;
  wire [5:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_11z = in_data[117] ? celloutsig_1_4z[3] : celloutsig_1_7z;
  assign celloutsig_0_14z = celloutsig_0_2z ? celloutsig_0_6z : celloutsig_0_9z[1];
  assign celloutsig_1_1z = ~((in_data[112] | celloutsig_1_0z) & (celloutsig_1_0z | celloutsig_1_0z));
  assign celloutsig_0_13z = celloutsig_0_11z | ~(in_data[53]);
  assign celloutsig_0_18z = celloutsig_0_11z | ~(in_data[25]);
  assign celloutsig_0_29z = celloutsig_0_9z[4] | ~(celloutsig_0_6z);
  assign celloutsig_1_0z = in_data[150] | in_data[154];
  assign celloutsig_0_1z = celloutsig_0_0z[5] | in_data[95];
  assign celloutsig_0_16z = celloutsig_0_0z[4] | celloutsig_0_6z;
  assign celloutsig_0_53z = { celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_37z } & { in_data[36], celloutsig_0_2z, celloutsig_0_45z };
  assign celloutsig_0_26z = { celloutsig_0_9z[3:0], celloutsig_0_23z } & { celloutsig_0_23z[5:2], celloutsig_0_19z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_13z, celloutsig_0_21z };
  assign celloutsig_0_59z = celloutsig_0_52z[2:0] / { 1'h1, celloutsig_0_27z[0], celloutsig_0_11z };
  assign celloutsig_0_22z = { celloutsig_0_9z[8:0], celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_1z } / { 1'h1, in_data[67:60], celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_8z };
  assign celloutsig_0_28z = { celloutsig_0_27z[2:1], celloutsig_0_19z } / { 1'h1, celloutsig_0_17z[1:0] };
  assign celloutsig_0_43z = { celloutsig_0_9z, celloutsig_0_40z } === { celloutsig_0_25z[17:7], celloutsig_0_21z };
  assign celloutsig_1_12z = { celloutsig_1_10z[7:0], celloutsig_1_7z, celloutsig_1_11z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_0z } === { celloutsig_1_6z[3:1], celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_0_30z = { celloutsig_0_6z, celloutsig_0_29z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_29z, celloutsig_0_3z, celloutsig_0_21z, celloutsig_0_12z, celloutsig_0_23z, celloutsig_0_20z } === { celloutsig_0_17z[0], celloutsig_0_16z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_27z };
  assign celloutsig_0_55z = { celloutsig_0_42z[3:0], celloutsig_0_16z, celloutsig_0_19z } >= { celloutsig_0_32z[6:3], celloutsig_0_39z, celloutsig_0_29z };
  assign celloutsig_0_7z = { celloutsig_0_0z, celloutsig_0_1z } >= { in_data[57:51], celloutsig_0_2z };
  assign celloutsig_1_18z = celloutsig_1_3z[4:2] >= { in_data[142:141], celloutsig_1_2z };
  assign celloutsig_0_12z = celloutsig_0_9z[10:7] >= celloutsig_0_0z[3:0];
  assign celloutsig_0_19z = { celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_2z } >= { celloutsig_0_9z[2:1], celloutsig_0_18z };
  assign celloutsig_0_20z = celloutsig_0_0z[4:1] >= { celloutsig_0_0z[4:3], celloutsig_0_2z, celloutsig_0_14z };
  assign celloutsig_0_60z = { celloutsig_0_24z[9:3], celloutsig_0_30z } <= { celloutsig_0_50z[5:3], celloutsig_0_55z, celloutsig_0_53z, celloutsig_0_1z };
  assign celloutsig_0_11z = { celloutsig_0_9z[9:0], celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_3z } <= in_data[62:49];
  assign celloutsig_0_21z = { celloutsig_0_9z[4:1], celloutsig_0_2z, celloutsig_0_7z } <= { celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_14z };
  assign celloutsig_1_2z = { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z } < { in_data[152:148], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_33z = celloutsig_0_11z & ~(celloutsig_0_2z);
  assign celloutsig_0_45z = celloutsig_0_9z[2] & ~(celloutsig_0_8z);
  assign celloutsig_0_10z = celloutsig_0_5z & ~(celloutsig_0_1z);
  assign celloutsig_0_50z = { celloutsig_0_26z[8:4], celloutsig_0_1z, celloutsig_0_27z, celloutsig_0_43z } % { 1'h1, celloutsig_0_41z[32:22], celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_14z };
  assign celloutsig_1_19z = { celloutsig_1_1z, celloutsig_1_15z, celloutsig_1_12z } % { 1'h1, celloutsig_1_4z[7:4], celloutsig_1_7z };
  assign celloutsig_0_23z = { celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_19z } % { 1'h1, celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_14z, celloutsig_0_19z, celloutsig_0_20z };
  assign celloutsig_0_25z = { celloutsig_0_17z[2], celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_23z, celloutsig_0_9z } % { 1'h1, in_data[69:62], celloutsig_0_16z, celloutsig_0_21z, celloutsig_0_3z, celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_19z, celloutsig_0_21z, celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_20z };
  assign celloutsig_0_47z = { celloutsig_0_27z[4:0], celloutsig_0_40z } != celloutsig_0_25z[6:1];
  assign celloutsig_0_3z = { celloutsig_0_0z[3:2], celloutsig_0_2z } != in_data[72:70];
  assign celloutsig_1_15z = ~ { celloutsig_1_6z[4:2], celloutsig_1_7z };
  assign celloutsig_0_42z = celloutsig_0_0z | { celloutsig_0_22z[6:5], celloutsig_0_17z, celloutsig_0_1z, celloutsig_0_16z };
  assign celloutsig_0_40z = & { celloutsig_0_14z, celloutsig_0_9z[4:3] };
  assign celloutsig_0_6z = & in_data[87:80];
  assign celloutsig_0_38z = | { celloutsig_0_25z[15:10], celloutsig_0_14z };
  assign celloutsig_0_39z = | { celloutsig_0_33z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_2z };
  assign celloutsig_1_9z = | { celloutsig_1_6z[3], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_8z = | { celloutsig_0_2z, in_data[10:9] };
  assign celloutsig_0_15z = | { celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z, in_data[85] };
  assign celloutsig_0_37z = ^ { celloutsig_0_27z[7:5], celloutsig_0_11z, celloutsig_0_14z };
  assign celloutsig_1_7z = ^ { celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_0_2z = ^ { in_data[68:56], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_10z = { celloutsig_1_4z[8:5], celloutsig_1_3z, celloutsig_1_3z } << in_data[163:148];
  assign celloutsig_0_41z = { in_data[66:38], celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_38z, celloutsig_0_23z, celloutsig_0_10z } >> { in_data[52:15], celloutsig_0_15z, celloutsig_0_14z };
  assign celloutsig_1_3z = { in_data[144:140], celloutsig_1_2z } >> { in_data[109:105], celloutsig_1_1z };
  assign celloutsig_0_24z = { celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_23z } >> { celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_21z, celloutsig_0_0z };
  assign celloutsig_0_0z = in_data[88:82] >>> in_data[81:75];
  assign celloutsig_1_6z = celloutsig_1_3z - { celloutsig_1_3z[5:1], celloutsig_1_0z };
  assign celloutsig_0_17z = { celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_6z } - { celloutsig_0_0z[4:3], celloutsig_0_16z };
  assign celloutsig_0_32z = in_data[68:62] ~^ { celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_28z, celloutsig_0_12z };
  assign celloutsig_0_27z = { celloutsig_0_9z[8:1], celloutsig_0_1z } ^ { celloutsig_0_23z[4:0], celloutsig_0_18z, celloutsig_0_19z, celloutsig_0_14z, celloutsig_0_2z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_52z = 24'h000000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_52z = { celloutsig_0_41z[25:21], celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_15z, celloutsig_0_39z, celloutsig_0_27z, celloutsig_0_38z, celloutsig_0_47z, celloutsig_0_15z };
  always_latch
    if (clkin_data[128]) celloutsig_1_4z = 12'h000;
    else if (clkin_data[32]) celloutsig_1_4z = in_data[167:156];
  always_latch
    if (clkin_data[96]) celloutsig_0_9z = 11'h000;
    else if (!clkin_data[0]) celloutsig_0_9z = { in_data[93:92], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_5z = ~((celloutsig_0_2z & celloutsig_0_0z[0]) | (celloutsig_0_3z & in_data[4]));
  assign { out_data[128], out_data[101:96], out_data[34:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_59z, celloutsig_0_60z };
endmodule
