/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [2:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  reg [3:0] celloutsig_0_19z;
  wire [18:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [28:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  reg [11:0] celloutsig_0_37z;
  wire [2:0] celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire [19:0] celloutsig_0_46z;
  wire celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire [6:0] celloutsig_0_53z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [10:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [4:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire [28:0] celloutsig_1_18z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_7z = ~celloutsig_1_3z;
  assign celloutsig_0_10z = ~celloutsig_0_8z;
  assign celloutsig_0_26z = ~celloutsig_0_24z;
  assign celloutsig_0_30z = ~celloutsig_0_13z;
  assign celloutsig_0_32z = ~celloutsig_0_25z;
  assign celloutsig_0_40z = ~((celloutsig_0_35z | celloutsig_0_26z) & celloutsig_0_2z);
  assign celloutsig_0_4z = ~((celloutsig_0_3z | celloutsig_0_3z) & celloutsig_0_2z);
  assign celloutsig_0_5z = ~((celloutsig_0_1z[9] | celloutsig_0_1z[17]) & in_data[12]);
  assign celloutsig_1_5z = ~((celloutsig_1_1z | celloutsig_1_4z) & in_data[126]);
  assign celloutsig_1_15z = ~((celloutsig_1_0z | celloutsig_1_2z) & celloutsig_1_10z);
  assign celloutsig_0_6z = ~((celloutsig_0_4z | celloutsig_0_5z) & celloutsig_0_2z);
  assign celloutsig_0_17z = ~((celloutsig_0_8z | celloutsig_0_14z) & celloutsig_0_11z);
  assign celloutsig_0_45z = ~(celloutsig_0_0z[0] ^ celloutsig_0_13z);
  assign celloutsig_0_9z = ~(celloutsig_0_5z ^ in_data[63]);
  assign celloutsig_0_15z = ~(in_data[24] ^ celloutsig_0_9z);
  assign celloutsig_0_18z = ~(celloutsig_0_13z ^ celloutsig_0_1z[18]);
  assign celloutsig_0_38z = { celloutsig_0_33z, celloutsig_0_25z, celloutsig_0_36z } + { celloutsig_0_37z[3], celloutsig_0_33z, celloutsig_0_34z };
  assign celloutsig_0_46z = { celloutsig_0_25z, celloutsig_0_45z, celloutsig_0_45z, celloutsig_0_35z, celloutsig_0_38z, celloutsig_0_27z, celloutsig_0_7z, celloutsig_0_42z } + { celloutsig_0_31z[24:21], celloutsig_0_7z, celloutsig_0_43z, celloutsig_0_42z, celloutsig_0_24z, celloutsig_0_15z, celloutsig_0_2z };
  assign celloutsig_0_53z = { celloutsig_0_44z, celloutsig_0_34z, celloutsig_0_51z, celloutsig_0_44z, celloutsig_0_10z, celloutsig_0_24z, celloutsig_0_51z } + { celloutsig_0_25z, celloutsig_0_40z, celloutsig_0_26z, celloutsig_0_15z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_3z };
  assign celloutsig_1_12z = { celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_8z } + { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_10z, celloutsig_1_1z };
  assign celloutsig_1_18z = { in_data[190:166], celloutsig_1_0z, celloutsig_1_11z, celloutsig_1_15z, celloutsig_1_6z } + { in_data[109:107], celloutsig_1_4z, celloutsig_1_15z, celloutsig_1_14z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_13z, celloutsig_1_13z, celloutsig_1_1z, celloutsig_1_12z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_17z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_11z, celloutsig_1_10z, celloutsig_1_14z, celloutsig_1_9z, celloutsig_1_15z, celloutsig_1_7z };
  assign celloutsig_0_7z = { celloutsig_0_1z[15:11], celloutsig_0_0z, celloutsig_0_0z } + { in_data[50:48], celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_0_1z = in_data[31:13] + in_data[71:53];
  assign celloutsig_0_31z = { in_data[25:11], celloutsig_0_28z, celloutsig_0_15z, celloutsig_0_24z, celloutsig_0_0z, celloutsig_0_30z, celloutsig_0_20z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_25z, celloutsig_0_2z, celloutsig_0_27z, celloutsig_0_22z } + { in_data[35:8], celloutsig_0_9z };
  assign celloutsig_0_35z = { celloutsig_0_19z, celloutsig_0_23z, celloutsig_0_33z, celloutsig_0_20z } >= { celloutsig_0_1z[16:11], celloutsig_0_34z };
  assign celloutsig_0_36z = { celloutsig_0_7z[4:3], celloutsig_0_33z, celloutsig_0_22z } >= { celloutsig_0_25z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_5z };
  assign celloutsig_0_52z = { celloutsig_0_7z[4], celloutsig_0_33z, celloutsig_0_51z, celloutsig_0_13z } >= celloutsig_0_1z[18:15];
  assign celloutsig_1_0z = in_data[109:102] >= in_data[151:144];
  assign celloutsig_1_2z = { in_data[118:102], celloutsig_1_1z } >= { in_data[177:173], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_3z = { in_data[177:165], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z } >= { in_data[173:158], celloutsig_1_1z };
  assign celloutsig_1_17z = { celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_9z } >= { in_data[137], celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_0_11z = { celloutsig_0_1z[8:3], celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_3z } >= { celloutsig_0_1z[11:1], celloutsig_0_9z };
  assign celloutsig_0_16z = { in_data[58:55], celloutsig_0_12z, celloutsig_0_15z } >= { in_data[73:70], celloutsig_0_15z, celloutsig_0_15z };
  assign celloutsig_0_20z = in_data[21:13] >= celloutsig_0_1z[15:7];
  assign celloutsig_0_21z = { celloutsig_0_19z, celloutsig_0_3z, celloutsig_0_3z } >= { celloutsig_0_7z[5:1], celloutsig_0_10z };
  assign celloutsig_0_22z = { celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_14z } >= { celloutsig_0_4z, celloutsig_0_20z, celloutsig_0_6z };
  assign celloutsig_0_25z = { celloutsig_0_11z, celloutsig_0_24z, celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_24z, celloutsig_0_16z } >= { celloutsig_0_19z[1], celloutsig_0_19z, celloutsig_0_11z };
  assign celloutsig_0_27z = { celloutsig_0_18z, celloutsig_0_21z, celloutsig_0_19z, celloutsig_0_21z } >= celloutsig_0_7z[8:2];
  assign celloutsig_0_51z = { celloutsig_0_37z[6:0], celloutsig_0_21z, celloutsig_0_36z } || { celloutsig_0_46z[11:4], celloutsig_0_12z };
  assign celloutsig_1_13z = { celloutsig_1_12z[3:0], celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_9z } || { celloutsig_1_12z[3:0], celloutsig_1_10z, celloutsig_1_0z, celloutsig_1_5z };
  assign celloutsig_1_14z = in_data[139:136] || { celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_8z };
  assign celloutsig_0_24z = { celloutsig_0_7z[2:1], celloutsig_0_14z, celloutsig_0_22z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_6z } || { celloutsig_0_1z[12:6], celloutsig_0_18z };
  assign celloutsig_1_1z = { in_data[102:101], celloutsig_1_0z } < in_data[175:173];
  assign celloutsig_1_4z = { in_data[172:171], celloutsig_1_1z } < { in_data[127], celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_0_12z = { celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_2z } < { celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_11z };
  assign celloutsig_0_23z = { celloutsig_0_1z[16:9], celloutsig_0_15z, celloutsig_0_20z, celloutsig_0_18z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_22z, celloutsig_0_2z } < { celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_5z };
  assign celloutsig_0_33z = { celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_26z, celloutsig_0_21z, celloutsig_0_28z, celloutsig_0_18z, celloutsig_0_28z, celloutsig_0_28z, celloutsig_0_20z } != { celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_8z };
  assign celloutsig_0_34z = { celloutsig_0_31z[12:11], celloutsig_0_25z, celloutsig_0_6z, celloutsig_0_22z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_20z } != { celloutsig_0_33z, celloutsig_0_0z, celloutsig_0_32z, celloutsig_0_17z, celloutsig_0_11z, celloutsig_0_32z };
  assign celloutsig_0_3z = { in_data[64:61], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z } != celloutsig_0_1z[18:11];
  assign celloutsig_0_42z = { celloutsig_0_21z, celloutsig_0_36z, celloutsig_0_28z, celloutsig_0_37z, celloutsig_0_22z } != { celloutsig_0_1z[17:9], celloutsig_0_8z, celloutsig_0_35z, celloutsig_0_0z, celloutsig_0_23z, celloutsig_0_21z };
  assign celloutsig_0_43z = { celloutsig_0_0z[1], celloutsig_0_17z, celloutsig_0_34z, celloutsig_0_27z, celloutsig_0_21z } != { celloutsig_0_19z, celloutsig_0_24z };
  assign celloutsig_0_44z = { celloutsig_0_37z[9:2], celloutsig_0_11z, celloutsig_0_42z, celloutsig_0_25z, celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_26z, celloutsig_0_24z } != { celloutsig_0_4z, celloutsig_0_43z, celloutsig_0_12z, celloutsig_0_15z, celloutsig_0_7z };
  assign celloutsig_1_6z = { in_data[129:123], celloutsig_1_2z, celloutsig_1_2z } != in_data[179:171];
  assign celloutsig_1_8z = { in_data[141:139], celloutsig_1_1z } != { celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_2z };
  assign celloutsig_1_9z = in_data[109:104] != { celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_4z };
  assign celloutsig_1_10z = { in_data[120:117], celloutsig_1_5z } != { in_data[116:114], celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_1_11z = { celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_4z } != in_data[118:116];
  assign celloutsig_0_8z = { celloutsig_0_1z[16:8], celloutsig_0_5z, celloutsig_0_4z } != { celloutsig_0_7z[8:0], celloutsig_0_6z, celloutsig_0_5z };
  assign celloutsig_0_14z = { celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_13z } != { celloutsig_0_1z[18:6], celloutsig_0_2z };
  assign celloutsig_0_2z = celloutsig_0_1z[18:5] != in_data[34:21];
  assign celloutsig_0_28z = { celloutsig_0_10z, celloutsig_0_22z, celloutsig_0_24z, celloutsig_0_6z } != celloutsig_0_1z[10:7];
  assign celloutsig_0_13z = ~^ { celloutsig_0_1z[17:13], celloutsig_0_3z, celloutsig_0_5z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_0z = 3'h0;
    else if (!clkin_data[0]) celloutsig_0_0z = in_data[43:41];
  always_latch
    if (clkin_data[32]) celloutsig_0_37z = 12'h000;
    else if (celloutsig_1_18z[0]) celloutsig_0_37z = celloutsig_0_1z[14:3];
  always_latch
    if (!clkin_data[32]) celloutsig_0_19z = 4'h0;
    else if (!celloutsig_1_18z[0]) celloutsig_0_19z = { celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_5z };
  assign { out_data[156:128], out_data[96], out_data[32], out_data[6:0] } = { celloutsig_1_18z, 1'h1, celloutsig_0_52z, celloutsig_0_53z };
endmodule
