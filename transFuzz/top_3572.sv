/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [9:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_18z;
  wire [17:0] celloutsig_0_19z;
  reg [5:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [3:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [19:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [17:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [3:0] celloutsig_0_31z;
  wire [4:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  reg [9:0] celloutsig_0_39z;
  wire [7:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [9:0] celloutsig_0_55z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [3:0] celloutsig_0_86z;
  wire celloutsig_0_87z;
  wire [2:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [3:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [15:0] celloutsig_1_5z;
  wire [7:0] celloutsig_1_6z;
  reg [11:0] celloutsig_1_7z;
  wire [14:0] celloutsig_1_8z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_10z = ~(celloutsig_0_9z & celloutsig_0_3z[6]);
  assign celloutsig_0_15z = ~(celloutsig_0_1z[2] & celloutsig_0_13z);
  assign celloutsig_0_16z = ~(celloutsig_0_2z & celloutsig_0_13z);
  assign celloutsig_0_24z = ~(celloutsig_0_9z & celloutsig_0_20z);
  assign celloutsig_1_3z = ~(celloutsig_1_1z | celloutsig_1_2z[1]);
  assign celloutsig_1_14z = ~(celloutsig_1_13z | celloutsig_1_10z);
  assign celloutsig_0_18z = ~(celloutsig_0_1z[4] | celloutsig_0_13z);
  assign celloutsig_0_26z = ~(celloutsig_0_7z | celloutsig_0_18z);
  assign celloutsig_0_2z = ~(celloutsig_0_1z[5] | in_data[11]);
  assign celloutsig_0_30z = ~(celloutsig_0_0z | celloutsig_0_28z);
  assign celloutsig_0_9z = ~celloutsig_0_0z;
  assign celloutsig_0_20z = ~celloutsig_0_16z;
  assign celloutsig_0_87z = ~((celloutsig_0_2z | celloutsig_0_7z) & celloutsig_0_22z);
  assign celloutsig_1_10z = ~((in_data[189] | celloutsig_1_4z) & celloutsig_1_5z[5]);
  assign celloutsig_1_18z = ~((in_data[135] | celloutsig_1_15z) & celloutsig_1_3z);
  assign celloutsig_0_13z = ~((celloutsig_0_2z | celloutsig_0_4z) & celloutsig_0_11z[9]);
  assign celloutsig_0_55z = { celloutsig_0_39z[9:4], celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_28z } + { celloutsig_0_29z[17:10], celloutsig_0_6z, celloutsig_0_30z };
  assign celloutsig_0_8z = { celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_4z } & { celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_2z };
  assign celloutsig_1_5z = in_data[178:163] & { in_data[149:147], celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_0_27z = { in_data[54:47], celloutsig_0_24z, celloutsig_0_10z, celloutsig_0_11z[9:5], celloutsig_0_11z[8:6], celloutsig_0_11z[1:0] } / { 1'h1, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_26z, celloutsig_0_25z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_26z, celloutsig_0_25z };
  assign celloutsig_1_11z = celloutsig_1_5z[12:6] == { celloutsig_1_6z[6:4], celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_4z = { celloutsig_0_1z[3:0], celloutsig_0_0z } > celloutsig_0_3z[4:0];
  assign celloutsig_0_6z = { celloutsig_0_3z[7:6], celloutsig_0_0z, celloutsig_0_0z } > { celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_28z = { celloutsig_0_23z, celloutsig_0_14z, celloutsig_0_2z } <= { celloutsig_0_20z, celloutsig_0_24z, celloutsig_0_24z };
  assign celloutsig_0_0z = in_data[14:11] || in_data[9:6];
  assign celloutsig_0_7z = { in_data[25:24], celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_4z } || { in_data[16:10], celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_12z = { celloutsig_0_1z[0], celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_5z } || { celloutsig_0_3z[4:1], celloutsig_0_5z, celloutsig_0_6z };
  assign celloutsig_1_1z = celloutsig_1_0z[2] & ~(celloutsig_1_0z[1]);
  assign celloutsig_0_23z = celloutsig_0_3z[7] & ~(celloutsig_0_6z);
  assign celloutsig_0_86z = celloutsig_0_55z[7:4] % { 1'h1, celloutsig_0_25z[2:0] };
  assign celloutsig_1_2z = in_data[166:164] * celloutsig_1_0z;
  assign celloutsig_1_12z = { celloutsig_1_8z[10:9], celloutsig_1_3z, celloutsig_1_10z } * { celloutsig_1_7z[3:2], celloutsig_1_11z, celloutsig_1_10z };
  assign celloutsig_0_3z = - { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_1_6z = ~ { in_data[121:118], celloutsig_1_2z, celloutsig_1_3z };
  assign celloutsig_0_29z = ~ { celloutsig_0_19z[10:1], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_20z };
  assign celloutsig_1_13z = | { in_data[104:102], celloutsig_1_12z };
  assign celloutsig_0_5z = | { celloutsig_0_3z[7:6], celloutsig_0_2z };
  assign celloutsig_0_22z = | { celloutsig_0_20z, celloutsig_0_3z[7:6], celloutsig_0_2z, celloutsig_0_1z[5:3], celloutsig_0_0z };
  assign celloutsig_1_15z = ~^ celloutsig_1_5z[13:1];
  assign celloutsig_1_4z = ^ { celloutsig_1_2z[1:0], celloutsig_1_2z, celloutsig_1_3z };
  assign celloutsig_0_14z = ^ { celloutsig_0_1z[2:1], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_10z };
  assign celloutsig_0_33z = ^ { celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_20z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_10z };
  assign celloutsig_1_0z = in_data[178:176] >>> in_data[128:126];
  assign celloutsig_0_31z = { celloutsig_0_8z[1:0], celloutsig_0_4z, celloutsig_0_6z } >>> { celloutsig_0_27z[10:9], celloutsig_0_30z, celloutsig_0_24z };
  assign celloutsig_0_32z = celloutsig_0_11z[9:5] >>> { celloutsig_0_25z, celloutsig_0_12z };
  assign celloutsig_0_19z = { in_data[93:83], celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_5z } ^ { celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_6z };
  assign celloutsig_0_25z = { celloutsig_0_1z[2], celloutsig_0_24z, celloutsig_0_14z, celloutsig_0_16z } ^ { celloutsig_0_9z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_23z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_39z = 10'h000;
    else if (clkin_data[0]) celloutsig_0_39z = { celloutsig_0_31z[1:0], celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_33z, celloutsig_0_32z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_7z = 12'h000;
    else if (!clkin_data[32]) celloutsig_1_7z = { in_data[156:149], celloutsig_1_3z, celloutsig_1_0z };
  always_latch
    if (clkin_data[96]) celloutsig_0_1z = 6'h00;
    else if (celloutsig_1_18z) celloutsig_0_1z = in_data[7:2];
  assign { celloutsig_0_11z[1], celloutsig_0_11z[8:6], celloutsig_0_11z[0], celloutsig_0_11z[9], celloutsig_0_11z[5] } = ~ { celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_3z[2], celloutsig_0_2z };
  assign { celloutsig_1_8z[8:1], celloutsig_1_8z[9], celloutsig_1_8z[12:10], celloutsig_1_8z[14:13] } = ~ { celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_0z[1:0] };
  assign { out_data[107], out_data[108], out_data[101], out_data[97:96], out_data[106], out_data[110:109], out_data[103], out_data[100:98] } = ~ { celloutsig_1_18z, celloutsig_1_15z, celloutsig_1_14z, celloutsig_1_13z, celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_0_11z[4:2] = celloutsig_0_11z[8:6];
  assign celloutsig_1_8z[0] = celloutsig_1_8z[9];
  assign { out_data[128], out_data[105:104], out_data[102], out_data[35:32], out_data[0] } = { celloutsig_1_18z, out_data[110:108], celloutsig_0_86z, celloutsig_0_87z };
endmodule
