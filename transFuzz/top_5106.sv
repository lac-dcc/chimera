/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [6:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [2:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [3:0] celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [8:0] celloutsig_0_1z;
  wire [10:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [3:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  reg [3:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [3:0] celloutsig_0_26z;
  wire [12:0] celloutsig_0_27z;
  wire [19:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [18:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [6:0] celloutsig_0_31z;
  wire [2:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [6:0] celloutsig_0_38z;
  wire [8:0] celloutsig_0_39z;
  wire [5:0] celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_44z;
  wire [3:0] celloutsig_0_46z;
  wire [3:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_53z;
  wire [7:0] celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire [2:0] celloutsig_0_61z;
  wire [3:0] celloutsig_0_63z;
  wire celloutsig_0_66z;
  wire celloutsig_0_6z;
  wire celloutsig_0_71z;
  reg [3:0] celloutsig_0_74z;
  wire [2:0] celloutsig_0_7z;
  wire celloutsig_0_80z;
  wire celloutsig_0_89z;
  wire celloutsig_0_8z;
  wire celloutsig_0_90z;
  wire [13:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [18:0] celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire [3:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_53z = ~celloutsig_0_49z[0];
  assign celloutsig_0_5z = ~in_data[12];
  assign celloutsig_0_59z = ~celloutsig_0_22z[0];
  assign celloutsig_0_11z = ~celloutsig_0_4z;
  assign celloutsig_0_13z = ~in_data[36];
  assign celloutsig_0_17z = ~celloutsig_0_16z[1];
  assign celloutsig_0_21z = ~celloutsig_0_14z;
  assign celloutsig_1_18z = ~(celloutsig_1_1z ^ celloutsig_1_8z);
  assign celloutsig_0_23z = ~(celloutsig_0_17z ^ celloutsig_0_8z);
  assign celloutsig_0_49z = { celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_29z, celloutsig_0_8z } & { celloutsig_0_46z[2:0], celloutsig_0_13z };
  assign celloutsig_0_18z = celloutsig_0_1z[3:0] & { celloutsig_0_0z[6:4], celloutsig_0_11z };
  assign celloutsig_0_12z = in_data[62:60] / { 1'h1, celloutsig_0_7z[1:0] };
  assign celloutsig_0_31z = celloutsig_0_0z / { 1'h1, celloutsig_0_12z[1:0], celloutsig_0_18z };
  assign celloutsig_1_9z = ! { celloutsig_1_7z[2], celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_6z };
  assign celloutsig_0_29z = ! { celloutsig_0_2z[17:15], celloutsig_0_6z, celloutsig_0_8z };
  assign celloutsig_0_33z = ! { celloutsig_0_27z[11:6], celloutsig_0_19z, celloutsig_0_24z };
  assign celloutsig_0_89z = { celloutsig_0_3z[5], celloutsig_0_61z } || { celloutsig_0_16z[1:0], celloutsig_0_8z, celloutsig_0_44z };
  assign celloutsig_0_14z = { celloutsig_0_9z[11:5], celloutsig_0_0z } || { in_data[31:24], celloutsig_0_3z };
  assign celloutsig_0_19z = in_data[82:71] < { celloutsig_0_1z[8:6], celloutsig_0_1z };
  assign celloutsig_0_30z = { celloutsig_0_28z[18:0], celloutsig_0_21z } < { celloutsig_0_1z[8:6], celloutsig_0_20z, celloutsig_0_8z, celloutsig_0_17z, celloutsig_0_11z, celloutsig_0_16z };
  assign celloutsig_0_61z = { celloutsig_0_18z[2:1], celloutsig_0_41z } % { 1'h1, celloutsig_0_7z[1], celloutsig_0_21z };
  assign celloutsig_0_1z = { celloutsig_0_0z[3:2], celloutsig_0_0z } % { 1'h1, celloutsig_0_0z[1], celloutsig_0_0z[6:1], in_data[0] };
  assign celloutsig_0_15z = { celloutsig_0_2z[11], celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_11z } % { 1'h1, celloutsig_0_1z[6:4] };
  assign celloutsig_0_34z = { celloutsig_0_20z[9:6], celloutsig_0_15z, celloutsig_0_21z, celloutsig_0_33z, celloutsig_0_19z, celloutsig_0_25z, celloutsig_0_31z, celloutsig_0_11z, celloutsig_0_19z, celloutsig_0_26z } != { celloutsig_0_2z[10:7], celloutsig_0_0z, celloutsig_0_20z, celloutsig_0_30z, celloutsig_0_30z, celloutsig_0_13z };
  assign celloutsig_0_4z = celloutsig_0_1z[3:0] !== celloutsig_0_3z[3:0];
  assign celloutsig_1_3z = { in_data[182:180], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z } !== in_data[110:104];
  assign celloutsig_0_6z = & { celloutsig_0_4z, celloutsig_0_3z[4] };
  assign celloutsig_0_8z = & { celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_1_2z = & { celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_41z = | { celloutsig_0_27z[8:4], celloutsig_0_32z, celloutsig_0_38z, celloutsig_0_15z };
  assign celloutsig_0_44z = | celloutsig_0_26z[2:0];
  assign celloutsig_0_71z = | { celloutsig_0_38z, celloutsig_0_33z, celloutsig_0_26z, celloutsig_0_55z, celloutsig_0_32z };
  assign celloutsig_1_0z = | in_data[103:98];
  assign celloutsig_0_10z = | { in_data[43:41], celloutsig_0_8z, celloutsig_0_8z };
  assign celloutsig_0_25z = | celloutsig_0_20z[10:8];
  assign celloutsig_0_55z = ~^ { celloutsig_0_39z[8:6], celloutsig_0_34z, celloutsig_0_16z, celloutsig_0_34z };
  assign celloutsig_0_66z = ~^ { celloutsig_0_63z[3:2], celloutsig_0_19z, celloutsig_0_59z };
  assign celloutsig_0_80z = ~^ { celloutsig_0_46z[2:0], celloutsig_0_66z, celloutsig_0_38z, celloutsig_0_54z, celloutsig_0_18z };
  assign celloutsig_1_1z = ~^ { in_data[154:152], celloutsig_1_0z };
  assign celloutsig_1_6z = ~^ celloutsig_1_4z[12:6];
  assign celloutsig_1_8z = ~^ { in_data[168:148], celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_2z };
  assign celloutsig_1_19z = ~^ { celloutsig_1_7z[3:1], celloutsig_1_9z };
  assign celloutsig_0_46z = celloutsig_0_24z >> in_data[20:17];
  assign celloutsig_0_16z = { celloutsig_0_15z[0], celloutsig_0_4z, celloutsig_0_5z } >> in_data[14:12];
  assign celloutsig_0_0z = in_data[91:85] << in_data[46:40];
  assign celloutsig_1_7z = in_data[162:159] << celloutsig_1_4z[16:13];
  assign celloutsig_0_28z = in_data[85:66] << { in_data[25:22], celloutsig_0_1z, celloutsig_0_22z, celloutsig_0_16z };
  assign celloutsig_0_7z = celloutsig_0_2z[7:5] - celloutsig_0_2z[8:6];
  assign celloutsig_0_38z = in_data[18:12] ~^ celloutsig_0_27z[12:6];
  assign celloutsig_0_39z = { celloutsig_0_0z[0], celloutsig_0_0z, celloutsig_0_34z } ~^ { celloutsig_0_1z[5:3], celloutsig_0_29z, celloutsig_0_18z, celloutsig_0_19z };
  assign celloutsig_0_54z = { celloutsig_0_2z[14], celloutsig_0_12z, celloutsig_0_49z } ~^ { celloutsig_0_20z[4:2], celloutsig_0_44z, celloutsig_0_22z };
  assign celloutsig_0_9z = { celloutsig_0_2z[15:10], celloutsig_0_0z, celloutsig_0_8z } ~^ { celloutsig_0_3z[5:1], celloutsig_0_1z };
  assign celloutsig_0_20z = { celloutsig_0_16z[1], celloutsig_0_0z, celloutsig_0_16z } ~^ { celloutsig_0_9z[5:2], celloutsig_0_17z, celloutsig_0_4z, celloutsig_0_18z, celloutsig_0_14z };
  assign celloutsig_0_22z = celloutsig_0_1z[5:2] ~^ celloutsig_0_20z[4:1];
  assign celloutsig_0_2z = in_data[75:57] ~^ in_data[33:15];
  assign celloutsig_0_3z = celloutsig_0_1z[8:3] ^ celloutsig_0_0z[6:1];
  assign celloutsig_0_63z = { celloutsig_0_23z, celloutsig_0_19z, celloutsig_0_53z, celloutsig_0_8z } ^ celloutsig_0_0z[5:2];
  assign celloutsig_0_26z = { celloutsig_0_23z, celloutsig_0_7z } ^ { celloutsig_0_3z[2:1], celloutsig_0_8z, celloutsig_0_8z };
  assign celloutsig_0_27z = { celloutsig_0_26z[3:2], celloutsig_0_4z, celloutsig_0_18z, celloutsig_0_21z, celloutsig_0_24z, celloutsig_0_25z } ^ { celloutsig_0_2z[13:3], celloutsig_0_10z, celloutsig_0_23z };
  assign celloutsig_0_32z = celloutsig_0_7z ^ { in_data[39], celloutsig_0_4z, celloutsig_0_14z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_74z = 4'h0;
    else if (clkin_data[0]) celloutsig_0_74z = celloutsig_0_27z[10:7];
  always_latch
    if (celloutsig_1_18z) celloutsig_0_24z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_24z = { celloutsig_0_2z[12], celloutsig_0_19z, celloutsig_0_10z, celloutsig_0_8z };
  assign celloutsig_0_90z = ~((celloutsig_0_74z[0] & celloutsig_0_80z) | (celloutsig_0_71z & celloutsig_0_54z[4]));
  assign { celloutsig_1_4z[3], celloutsig_1_4z[5], celloutsig_1_4z[0], celloutsig_1_4z[4], celloutsig_1_4z[18:6] } = { celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_0z, in_data[127:115] } ^ { celloutsig_1_2z, in_data[134], celloutsig_1_3z, in_data[133], in_data[147:135] };
  assign celloutsig_1_4z[2:1] = 2'h0;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_89z, celloutsig_0_90z };
endmodule
