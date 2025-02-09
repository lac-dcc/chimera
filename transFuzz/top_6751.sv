/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [7:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [5:0] celloutsig_0_15z;
  wire [17:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [12:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [15:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [9:0] celloutsig_0_25z;
  wire [26:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [3:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  reg [15:0] celloutsig_0_33z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire [3:0] celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire [4:0] celloutsig_0_50z;
  wire celloutsig_0_5z;
  wire [14:0] celloutsig_0_6z;
  wire [4:0] celloutsig_0_73z;
  wire celloutsig_0_7z;
  wire celloutsig_0_80z;
  reg [4:0] celloutsig_0_81z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire [16:0] celloutsig_1_19z;
  wire [20:0] celloutsig_1_1z;
  wire [9:0] celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire [10:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [2:0] celloutsig_1_6z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_9z = ~(celloutsig_1_1z[6] | 1'h0);
  assign celloutsig_0_27z = celloutsig_0_4z ^ celloutsig_0_17z;
  assign celloutsig_0_3z = celloutsig_0_1z ^ celloutsig_0_0z;
  assign celloutsig_0_6z = { in_data[37:31], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_3z } / { 1'h1, in_data[67:56], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_2z = in_data[129:120] / { 1'h1, celloutsig_1_1z[18:10] };
  assign celloutsig_1_3z = { in_data[116:115], celloutsig_1_0z } / { 1'h1, in_data[133:132] };
  assign celloutsig_1_4z = celloutsig_1_1z[19:9] / { 1'h1, in_data[154:148], celloutsig_1_3z };
  assign celloutsig_0_16z = { in_data[79:64], celloutsig_0_8z, celloutsig_0_14z } / { 1'h1, celloutsig_0_5z, celloutsig_0_12z[7:1], 1'h1, celloutsig_0_3z, celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_13z };
  assign celloutsig_0_18z = { celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_12z[7:1], 1'h1, celloutsig_0_1z } / { 1'h1, in_data[22], celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_15z[5:3], 1'h1, celloutsig_0_15z[1:0], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_0_25z = celloutsig_0_18z[9:0] / { 1'h1, celloutsig_0_18z[8:1], in_data[0] };
  assign celloutsig_0_7z = { celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_5z } >= { celloutsig_0_6z[3], celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_0z = in_data[43:41] > in_data[43:41];
  assign celloutsig_0_42z = { celloutsig_0_33z[15:12], celloutsig_0_18z } > { celloutsig_0_25z[7:6], celloutsig_0_28z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_21z, celloutsig_0_17z, celloutsig_0_25z };
  assign celloutsig_0_28z = { in_data[57:56], celloutsig_0_1z, celloutsig_0_27z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_13z } > celloutsig_0_25z[7:0];
  assign celloutsig_1_0z = in_data[126:124] <= in_data[154:152];
  assign celloutsig_0_14z = { celloutsig_0_6z[6:5], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_9z } <= { celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_5z };
  assign celloutsig_0_43z = ! { celloutsig_0_40z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_24z = ! { in_data[2:0], celloutsig_0_1z, celloutsig_0_10z };
  assign celloutsig_1_6z = celloutsig_1_4z[2] ? celloutsig_1_3z : { celloutsig_1_2z[7:6], celloutsig_1_5z };
  assign celloutsig_1_19z = celloutsig_1_6z[2] ? { celloutsig_1_2z[7:2], celloutsig_1_4z } : { celloutsig_1_1z[16:2], 2'h0 };
  assign celloutsig_0_23z = celloutsig_0_4z ? { celloutsig_0_6z, celloutsig_0_7z } : { celloutsig_0_21z, celloutsig_0_1z, celloutsig_0_18z, celloutsig_0_22z };
  assign celloutsig_0_5z = in_data[62:59] !== { celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_5z = in_data[190:183] !== { in_data[116:113], celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_9z = { celloutsig_0_6z[6], celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_2z } !== { celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_1_18z = { celloutsig_1_6z, celloutsig_1_9z } !== celloutsig_1_4z[4:1];
  assign celloutsig_0_11z = { celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_8z } !== celloutsig_0_6z[10:4];
  assign celloutsig_0_17z = celloutsig_0_6z[13:3] !== { celloutsig_0_16z[6:0], celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_31z = { celloutsig_0_25z, celloutsig_0_17z } !== { celloutsig_0_16z[16:7], celloutsig_0_2z };
  assign celloutsig_0_80z = & { celloutsig_0_73z[3:1], celloutsig_0_43z, celloutsig_0_3z };
  assign celloutsig_0_2z = & { celloutsig_0_1z, in_data[42:41] };
  assign celloutsig_0_21z = & celloutsig_0_6z[9:6];
  assign celloutsig_0_1z = | in_data[27:17];
  assign celloutsig_0_40z = celloutsig_0_8z & celloutsig_0_31z;
  assign celloutsig_0_10z = celloutsig_0_7z & celloutsig_0_8z;
  assign celloutsig_0_13z = celloutsig_0_11z & celloutsig_0_9z;
  assign celloutsig_0_22z = | { celloutsig_0_18z[10:1], celloutsig_0_10z, celloutsig_0_9z };
  assign celloutsig_0_30z = { celloutsig_0_15z[5:3], 1'h1 } <<< { celloutsig_0_16z[11:9], celloutsig_0_11z };
  assign celloutsig_0_26z = { celloutsig_0_23z[11:1], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_21z, celloutsig_0_10z, celloutsig_0_12z[7:1], 1'h1, celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_9z } - { celloutsig_0_6z[9:1], celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_8z };
  assign celloutsig_0_50z = { celloutsig_0_16z[10:7], celloutsig_0_3z } ~^ { celloutsig_0_48z, celloutsig_0_7z };
  assign celloutsig_0_73z = celloutsig_0_18z[8:4] ~^ celloutsig_0_50z;
  assign celloutsig_0_48z = { celloutsig_0_18z[1], celloutsig_0_17z, celloutsig_0_24z, celloutsig_0_5z } ^ celloutsig_0_23z[10:7];
  assign celloutsig_0_4z = ~((celloutsig_0_2z & celloutsig_0_1z) | celloutsig_0_3z);
  assign celloutsig_0_8z = ~((celloutsig_0_3z & celloutsig_0_0z) | celloutsig_0_7z);
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_81z = 5'h00;
    else if (!clkin_data[32]) celloutsig_0_81z = { celloutsig_0_30z, celloutsig_0_42z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_33z = 16'h0000;
    else if (!clkin_data[0]) celloutsig_0_33z = { celloutsig_0_26z[26:12], celloutsig_0_0z };
  assign { celloutsig_0_12z[2], celloutsig_0_12z[3], celloutsig_0_12z[7], celloutsig_0_12z[4], celloutsig_0_12z[6:5], celloutsig_0_12z[1] } = { celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z } ~^ { in_data[1], in_data[2], in_data[6], in_data[3], in_data[5:4], celloutsig_0_8z };
  assign { celloutsig_0_15z[5], celloutsig_0_15z[0], celloutsig_0_15z[4:3], celloutsig_0_15z[1] } = { celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_1z } ~^ { celloutsig_0_12z[5], celloutsig_0_14z, celloutsig_0_12z[4:3], celloutsig_0_10z };
  assign { celloutsig_1_1z[2], celloutsig_1_1z[20:3] } = { celloutsig_1_0z, in_data[176:159] } ^ { in_data[171], in_data[189:172] };
  assign celloutsig_0_12z[0] = 1'h1;
  assign celloutsig_0_15z[2] = 1'h1;
  assign celloutsig_1_1z[1:0] = 2'h0;
  assign { out_data[128], out_data[112:96], out_data[32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_80z, celloutsig_0_81z };
endmodule
