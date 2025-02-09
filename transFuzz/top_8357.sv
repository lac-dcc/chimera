/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [7:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [16:0] celloutsig_0_12z;
  reg [7:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [3:0] celloutsig_0_18z;
  wire [6:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [5:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [7:0] celloutsig_0_26z;
  reg [3:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  reg [29:0] celloutsig_0_31z;
  wire [9:0] celloutsig_0_32z;
  wire [16:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [13:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  reg [16:0] celloutsig_0_44z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [10:0] celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire [2:0] celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire [8:0] celloutsig_0_54z;
  wire [4:0] celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire [8:0] celloutsig_0_57z;
  wire celloutsig_0_5z;
  wire celloutsig_0_63z;
  wire celloutsig_0_78z;
  wire celloutsig_0_79z;
  wire celloutsig_0_7z;
  wire [4:0] celloutsig_0_8z;
  wire [14:0] celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [6:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  reg [7:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [7:0] _00_;
  always_latch
    if (clkin_data[32]) _00_ = 8'h00;
    else if (celloutsig_1_19z[0]) _00_ = { celloutsig_0_3z[11:7], celloutsig_0_49z, celloutsig_0_26z[6], celloutsig_0_53z };
  assign { celloutsig_0_57z[8:2], celloutsig_0_57z[0] } = _00_;
  assign celloutsig_1_7z = celloutsig_1_4z ? celloutsig_1_2z[0] : celloutsig_1_6z;
  assign celloutsig_0_14z = celloutsig_0_13z[1] ? celloutsig_0_1z[4] : celloutsig_0_7z;
  assign celloutsig_1_3z = ~((celloutsig_1_2z[5] | in_data[172]) & (celloutsig_1_2z[7] | celloutsig_1_2z[4]));
  assign celloutsig_0_21z = ~((celloutsig_0_0z | celloutsig_0_3z[0]) & (celloutsig_0_10z[0] | celloutsig_0_0z));
  assign celloutsig_0_40z = celloutsig_0_25z | ~(1'h1);
  assign celloutsig_0_49z = celloutsig_0_26z[5] | ~(celloutsig_0_12z[3]);
  assign celloutsig_0_15z = celloutsig_0_4z | ~(in_data[50]);
  assign celloutsig_0_25z = celloutsig_0_8z[3] | ~(celloutsig_0_23z);
  assign celloutsig_0_3z = { celloutsig_0_1z[3:2], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z } & in_data[78:65];
  assign celloutsig_0_52z = celloutsig_0_3z[4:2] & { celloutsig_0_12z[12], celloutsig_0_20z, celloutsig_0_51z };
  assign celloutsig_0_32z = { celloutsig_0_25z, celloutsig_0_2z, celloutsig_0_26z } / { 1'h1, celloutsig_0_12z[9:2], celloutsig_0_30z };
  assign celloutsig_0_55z = celloutsig_0_12z[16:12] / { 1'h1, celloutsig_0_54z[1:0], celloutsig_0_34z, celloutsig_0_51z };
  assign celloutsig_1_0z = in_data[171:169] / { 1'h1, in_data[155:154] };
  assign celloutsig_1_19z = { celloutsig_1_15z, celloutsig_1_5z, celloutsig_1_4z } / { 1'h1, celloutsig_1_9z, celloutsig_1_6z };
  assign celloutsig_0_12z = { celloutsig_0_3z[8:2], 1'h0, celloutsig_0_7z, celloutsig_0_10z } / { 1'h1, celloutsig_0_9z[10:6], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_7z };
  assign celloutsig_0_18z = celloutsig_0_1z[3:0] / { 1'h1, celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_7z };
  assign celloutsig_0_5z = { celloutsig_0_1z[4:3], celloutsig_0_0z, celloutsig_0_4z } == celloutsig_0_1z[3:0];
  assign celloutsig_1_12z = { celloutsig_1_2z[3], celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_5z } == { in_data[149:148], celloutsig_1_10z, celloutsig_1_11z };
  assign celloutsig_1_15z = { celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_12z, celloutsig_1_10z } == { celloutsig_1_12z, celloutsig_1_12z, celloutsig_1_9z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_14z, celloutsig_1_6z };
  assign celloutsig_0_20z = { celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_4z, celloutsig_0_15z } == { 1'h0, celloutsig_0_18z };
  assign celloutsig_0_56z = celloutsig_0_33z[16:7] === { celloutsig_0_23z, celloutsig_0_15z, celloutsig_0_10z };
  assign celloutsig_1_1z = celloutsig_1_0z === in_data[122:120];
  assign celloutsig_1_11z = { in_data[102:98], celloutsig_1_9z } === { celloutsig_1_0z[1], celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_10z, celloutsig_1_6z };
  assign celloutsig_0_0z = in_data[16:9] >= in_data[38:31];
  assign celloutsig_0_48z = { celloutsig_0_32z[1:0], 1'h0, celloutsig_0_40z, celloutsig_0_5z } > { celloutsig_0_24z[5:2], celloutsig_0_15z };
  assign celloutsig_0_51z = { celloutsig_0_31z[26:11], 1'h0 } > { celloutsig_0_12z[14:11], 1'h0, celloutsig_0_23z, celloutsig_0_50z };
  assign celloutsig_0_7z = { in_data[35:26], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_5z, 1'h0, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_1z } > in_data[28:0];
  assign celloutsig_1_8z = { in_data[169:165], celloutsig_1_7z } > { in_data[175:173], celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_6z };
  assign celloutsig_0_53z = { celloutsig_0_31z[14:13], celloutsig_0_48z, celloutsig_0_30z } <= { celloutsig_0_8z[3:1], celloutsig_0_34z };
  assign celloutsig_0_79z = { celloutsig_0_44z[8:1], celloutsig_0_18z } <= { celloutsig_0_31z[21:19], celloutsig_0_56z, celloutsig_0_78z, celloutsig_0_24z[5:1], celloutsig_0_21z, celloutsig_0_63z };
  assign celloutsig_1_13z = in_data[180:178] <= celloutsig_1_2z[4:2];
  assign celloutsig_1_14z = { in_data[167:154], celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_1z } <= { in_data[180:168], celloutsig_1_13z, celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_8z };
  assign celloutsig_0_47z = ! { celloutsig_0_44z[13:12], celloutsig_0_7z, celloutsig_0_20z, celloutsig_0_2z };
  assign celloutsig_0_63z = ! { celloutsig_0_55z[4:3], celloutsig_0_18z };
  assign celloutsig_1_5z = ! in_data[105:102];
  assign celloutsig_0_50z = { celloutsig_0_31z[20], celloutsig_0_12z[14:11], celloutsig_0_8z, celloutsig_0_11z } * { celloutsig_0_44z[9:2], celloutsig_0_0z, celloutsig_0_49z, celloutsig_0_47z };
  assign celloutsig_0_78z = { celloutsig_0_57z[8:4], celloutsig_0_52z } !== { 7'h7f, celloutsig_0_30z };
  assign celloutsig_0_2z = { in_data[73:58], celloutsig_0_1z } !== in_data[44:22];
  assign celloutsig_0_23z = celloutsig_0_8z[4:1] !== { celloutsig_0_18z[1:0], celloutsig_0_14z, celloutsig_0_7z };
  assign celloutsig_0_4z = in_data[65] & in_data[69];
  assign celloutsig_1_4z = in_data[99] & celloutsig_1_3z;
  assign celloutsig_1_6z = celloutsig_1_3z & in_data[97];
  assign celloutsig_1_10z = celloutsig_1_4z & celloutsig_1_9z;
  assign celloutsig_1_18z = celloutsig_1_16z[1] & celloutsig_1_6z;
  assign celloutsig_0_22z = celloutsig_0_10z[4] & celloutsig_0_8z[0];
  assign celloutsig_0_30z = celloutsig_0_12z[10] & celloutsig_0_20z;
  assign celloutsig_1_9z = | in_data[161:115];
  assign celloutsig_0_11z = ~^ celloutsig_0_1z[5:0];
  assign celloutsig_0_29z = ~^ { celloutsig_0_12z[13:11], celloutsig_0_4z };
  assign celloutsig_0_33z = { celloutsig_0_1z, celloutsig_0_21z, celloutsig_0_21z, celloutsig_0_28z, celloutsig_0_12z[14:11] } << { celloutsig_0_31z[7:1], celloutsig_0_22z, celloutsig_0_1z, celloutsig_0_20z, celloutsig_0_20z };
  assign celloutsig_0_1z = in_data[59:53] << { in_data[87:83], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_10z = { celloutsig_0_3z[5:0], celloutsig_0_0z, 1'h0 } <<< { celloutsig_0_3z[7:1], celloutsig_0_4z };
  assign celloutsig_1_16z = { in_data[135:132], celloutsig_1_0z } - { in_data[119:116], celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_12z };
  assign celloutsig_0_54z = { celloutsig_0_1z[6:2], celloutsig_0_18z } ~^ { celloutsig_0_44z[11:7], celloutsig_0_52z, celloutsig_0_29z };
  assign celloutsig_0_8z = { in_data[62:59], celloutsig_0_5z } ^ celloutsig_0_3z[9:5];
  assign celloutsig_0_26z = celloutsig_0_12z[10:3] ^ { celloutsig_0_24z[3:2], celloutsig_0_24z[5:1], celloutsig_0_21z };
  assign celloutsig_0_34z = ~((celloutsig_0_13z[1] & celloutsig_0_30z) | celloutsig_0_13z[7]);
  always_latch
    if (clkin_data[32]) celloutsig_0_44z = 17'h00000;
    else if (celloutsig_1_19z[0]) celloutsig_0_44z = { celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_23z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_2z = 8'h00;
    else if (!clkin_data[0]) celloutsig_1_2z = { in_data[109:103], celloutsig_1_1z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_13z = 8'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_13z = { celloutsig_0_12z[9:5], celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_0z };
  always_latch
    if (clkin_data[32]) celloutsig_0_28z = 4'h0;
    else if (celloutsig_1_19z[0]) celloutsig_0_28z = { celloutsig_0_26z[1:0], celloutsig_0_0z, celloutsig_0_2z };
  always_latch
    if (clkin_data[32]) celloutsig_0_31z = 30'h00000000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_31z = { celloutsig_0_12z[16:2], celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_29z, celloutsig_0_4z, celloutsig_0_12z[14:11] };
  assign celloutsig_0_9z[13] = ~ celloutsig_0_3z[13];
  assign { celloutsig_0_9z[12:0], celloutsig_0_9z[14] } = { celloutsig_0_3z[12:0], celloutsig_0_0z } ~^ { celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z[1] };
  assign { celloutsig_0_24z[3], celloutsig_0_24z[1], celloutsig_0_24z[2], celloutsig_0_24z[5:4] } = { celloutsig_0_23z, celloutsig_0_20z, celloutsig_0_14z, celloutsig_0_12z[4:3] } ^ { celloutsig_0_13z[2], celloutsig_0_13z[0], celloutsig_0_13z[1], celloutsig_0_13z[4:3] };
  assign celloutsig_0_24z[0] = celloutsig_0_21z;
  assign celloutsig_0_57z[1] = 1'h0;
  assign { out_data[128], out_data[98:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_78z, celloutsig_0_79z };
endmodule
