/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  reg [5:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [3:0] celloutsig_0_14z;
  wire celloutsig_0_17z;
  wire celloutsig_0_20z;
  wire [31:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire [5:0] celloutsig_0_27z;
  wire [7:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [7:0] celloutsig_0_30z;
  reg [2:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [2:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [2:0] celloutsig_0_40z;
  wire [3:0] celloutsig_0_43z;
  wire [10:0] celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [10:0] celloutsig_0_55z;
  wire [5:0] celloutsig_0_58z;
  reg [7:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire [9:0] celloutsig_0_60z;
  wire celloutsig_0_6z;
  wire [3:0] celloutsig_0_71z;
  wire celloutsig_0_72z;
  wire celloutsig_0_7z;
  reg [2:0] celloutsig_0_8z;
  wire [2:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [11:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire [8:0] celloutsig_1_15z;
  wire [3:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [18:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire [13:0] celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire [20:0] celloutsig_1_5z;
  wire [13:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [29:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_4z = ~(in_data[34] & celloutsig_0_0z);
  assign celloutsig_1_14z = ~(celloutsig_1_6z[12] & celloutsig_1_6z[11]);
  assign celloutsig_0_11z = ~(celloutsig_0_10z[5] & 1'h0);
  assign celloutsig_0_13z = ~(celloutsig_0_7z & celloutsig_0_11z);
  assign celloutsig_0_22z = ~(celloutsig_0_13z & celloutsig_0_7z);
  assign celloutsig_0_6z = !(celloutsig_0_2z ? 1'h0 : celloutsig_0_4z);
  assign celloutsig_0_5z = ~celloutsig_0_2z;
  assign celloutsig_1_10z = ~((celloutsig_1_9z[28] | in_data[159]) & (celloutsig_1_8z | celloutsig_1_6z[11]));
  assign celloutsig_0_17z = ~((celloutsig_0_6z | celloutsig_0_5z) & (celloutsig_0_2z | in_data[94]));
  assign celloutsig_0_50z = celloutsig_0_24z ^ celloutsig_0_40z[2];
  assign celloutsig_1_12z = celloutsig_1_5z[13] ^ celloutsig_1_3z[4];
  assign celloutsig_1_4z = { celloutsig_1_3z[9:6], celloutsig_1_0z } + { celloutsig_1_3z[5:2], celloutsig_1_1z };
  assign celloutsig_0_35z = { celloutsig_0_24z, celloutsig_0_5z, celloutsig_0_24z } == { celloutsig_0_26z, celloutsig_0_6z, celloutsig_0_33z };
  assign celloutsig_0_45z = { celloutsig_0_21z[29:20], celloutsig_0_6z, celloutsig_0_32z } == { in_data[67:59], celloutsig_0_35z, celloutsig_0_20z, celloutsig_0_6z };
  assign celloutsig_1_8z = { celloutsig_1_6z[5], celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_4z } == { celloutsig_1_4z[4:1], celloutsig_1_6z };
  assign celloutsig_1_18z = celloutsig_1_11z[5:3] == celloutsig_1_16z[3:1];
  assign celloutsig_0_24z = in_data[88:86] == { in_data[71], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_33z = { in_data[11:8], celloutsig_0_24z, celloutsig_0_12z } == { celloutsig_0_11z, celloutsig_0_22z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_13z };
  assign celloutsig_0_12z = { celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_0z } >= { celloutsig_0_10z[2:1], celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_6z };
  assign celloutsig_0_20z = in_data[95:91] >= { celloutsig_0_8z[2], celloutsig_0_11z, 1'h0, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_26z = { 1'h0, celloutsig_0_11z, celloutsig_0_6z, 1'h0 } >= { celloutsig_0_8z, 1'h0 };
  assign celloutsig_0_72z = { celloutsig_0_60z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_12z } <= { celloutsig_0_44z[10:3], celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_26z };
  assign celloutsig_0_7z = { celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_6z } <= { 1'h0, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_1_0z = in_data[102:100] <= in_data[154:152];
  assign celloutsig_1_7z = celloutsig_1_5z[17:15] <= { celloutsig_1_3z[10:9], celloutsig_1_0z };
  assign celloutsig_0_2z = { in_data[21:14], 2'h0 } <= in_data[44:35];
  assign celloutsig_0_40z = celloutsig_0_8z * { celloutsig_0_32z, celloutsig_0_32z, celloutsig_0_32z };
  assign celloutsig_0_34z = - { celloutsig_0_21z[5:4], 1'h0 };
  assign celloutsig_0_71z = - celloutsig_0_59z[6:3];
  assign celloutsig_1_3z = - { celloutsig_1_2z[3:1], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_19z = - { celloutsig_1_15z[8:4], celloutsig_1_12z, celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_18z };
  assign celloutsig_0_21z = - { in_data[95:68], celloutsig_0_14z };
  assign celloutsig_0_28z = - celloutsig_0_21z[11:4];
  assign celloutsig_0_58z = ~ celloutsig_0_28z[6:1];
  assign celloutsig_0_0z = | in_data[71:63];
  assign celloutsig_1_1z = | in_data[137:112];
  assign celloutsig_0_29z = | { celloutsig_0_10z[1], celloutsig_0_26z, celloutsig_0_22z, celloutsig_0_11z };
  assign celloutsig_0_32z = | { celloutsig_0_28z[6:2], celloutsig_0_5z };
  assign celloutsig_1_11z = { celloutsig_1_3z[6:0], celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_10z } >> { celloutsig_1_3z[13:3], celloutsig_1_8z };
  assign celloutsig_1_16z = { celloutsig_1_3z[5:3], celloutsig_1_0z } >> in_data[179:176];
  assign celloutsig_0_9z = { in_data[16], celloutsig_0_4z, celloutsig_0_5z } >> { celloutsig_0_8z[0], celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_0_55z = celloutsig_0_44z << { celloutsig_0_30z[0], celloutsig_0_50z, celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_20z, celloutsig_0_8z };
  assign celloutsig_0_60z = { celloutsig_0_58z, celloutsig_0_35z, celloutsig_0_31z } << { celloutsig_0_55z[1], celloutsig_0_45z, celloutsig_0_28z };
  assign celloutsig_1_2z = { in_data[109:107], celloutsig_1_1z, celloutsig_1_1z } << { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_5z = { in_data[123:108], celloutsig_1_4z } << { in_data[170:155], celloutsig_1_4z };
  assign celloutsig_1_6z = celloutsig_1_3z << celloutsig_1_3z;
  assign celloutsig_1_15z = { celloutsig_1_9z[6:0], celloutsig_1_8z, celloutsig_1_14z } << celloutsig_1_6z[9:1];
  assign celloutsig_0_14z = { celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_13z, 1'h0 } << celloutsig_0_10z[4:1];
  assign celloutsig_0_27z = { celloutsig_0_12z, celloutsig_0_14z, 1'h0 } << { celloutsig_0_17z, celloutsig_0_5z, celloutsig_0_13z, celloutsig_0_9z };
  assign celloutsig_0_30z = { celloutsig_0_29z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_20z, celloutsig_0_8z, 1'h0 } << { celloutsig_0_28z[3:0], celloutsig_0_0z, 1'h0, celloutsig_0_7z, celloutsig_0_6z };
  assign celloutsig_0_43z = { celloutsig_0_40z, 1'h0 } <<< { 1'h0, celloutsig_0_34z };
  assign celloutsig_0_44z = { 1'h1, celloutsig_0_24z, celloutsig_0_10z, 1'h0, celloutsig_0_4z, celloutsig_0_29z } <<< { celloutsig_0_27z[5:1], celloutsig_0_43z, 1'h1, celloutsig_0_26z };
  assign celloutsig_1_9z = { celloutsig_1_2z[2:1], celloutsig_1_6z, celloutsig_1_6z } ~^ { celloutsig_1_5z[19:1], celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_4z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_59z = 8'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_59z = { celloutsig_0_55z[6:0], celloutsig_0_24z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_8z = 3'h0;
    else if (celloutsig_1_19z[0]) celloutsig_0_8z = in_data[43:41];
  always_latch
    if (!clkin_data[0]) celloutsig_0_10z = 6'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_10z = { celloutsig_0_8z[0], celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_7z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_31z = 3'h0;
    else if (!celloutsig_1_19z[0]) celloutsig_0_31z = celloutsig_0_28z[5:3];
  assign { out_data[128], out_data[114:96], out_data[35:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_71z, celloutsig_0_72z };
endmodule
