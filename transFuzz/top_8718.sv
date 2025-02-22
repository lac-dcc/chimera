/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [7:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  reg [5:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [10:0] celloutsig_0_18z;
  wire [3:0] celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [13:0] celloutsig_0_21z;
  wire [2:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  reg [4:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [3:0] celloutsig_0_31z;
  wire [4:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [2:0] celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_47z;
  wire celloutsig_0_49z;
  reg [11:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [3:0] celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire [9:0] celloutsig_0_55z;
  wire [17:0] celloutsig_0_5z;
  wire [4:0] celloutsig_0_65z;
  wire celloutsig_0_67z;
  wire [5:0] celloutsig_0_6z;
  wire celloutsig_0_75z;
  wire celloutsig_0_76z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [11:0] celloutsig_0_9z;
  wire [9:0] celloutsig_1_0z;
  reg [2:0] celloutsig_1_10z;
  wire celloutsig_1_15z;
  wire [2:0] celloutsig_1_16z;
  wire [2:0] celloutsig_1_18z;
  wire [3:0] celloutsig_1_19z;
  wire [9:0] celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire [13:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  reg [7:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_38z = ~(celloutsig_0_2z | celloutsig_0_11z);
  assign celloutsig_0_39z = ~(in_data[93] | celloutsig_0_22z[2]);
  assign celloutsig_0_44z = ~(in_data[57] | celloutsig_0_16z[4]);
  assign celloutsig_0_50z = ~(celloutsig_0_34z | celloutsig_0_31z[1]);
  assign celloutsig_0_76z = ~(celloutsig_0_1z[1] | celloutsig_0_29z);
  assign celloutsig_1_8z = ~(celloutsig_1_7z[2] | celloutsig_1_4z[11]);
  assign celloutsig_0_24z = ~(celloutsig_0_20z | celloutsig_0_23z);
  assign celloutsig_0_29z = ~(celloutsig_0_28z | celloutsig_0_20z);
  assign celloutsig_0_13z = ~((celloutsig_0_4z[6] | celloutsig_0_7z) & celloutsig_0_6z[0]);
  assign celloutsig_0_15z = ~((in_data[21] | celloutsig_0_2z) & in_data[38]);
  assign celloutsig_0_20z = ~((celloutsig_0_7z | in_data[94]) & celloutsig_0_1z[0]);
  assign celloutsig_0_7z = ~((celloutsig_0_0z | in_data[66]) & (celloutsig_0_0z | celloutsig_0_6z[4]));
  assign celloutsig_0_75z = ~((celloutsig_0_15z | celloutsig_0_67z) & (celloutsig_0_55z[9] | celloutsig_0_10z[3]));
  assign celloutsig_1_5z = ~((celloutsig_1_3z[1] | celloutsig_1_2z[4]) & (celloutsig_1_1z[6] | celloutsig_1_4z[9]));
  assign celloutsig_0_2z = ~((celloutsig_0_0z | celloutsig_0_0z) & (celloutsig_0_0z | celloutsig_0_1z[1]));
  assign celloutsig_0_45z = celloutsig_0_22z[1] | celloutsig_0_12z;
  assign celloutsig_0_23z = celloutsig_0_11z | celloutsig_0_20z;
  assign celloutsig_0_33z = { celloutsig_0_23z, celloutsig_0_24z, celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_20z } & { celloutsig_0_23z, celloutsig_0_28z, celloutsig_0_15z, celloutsig_0_24z, celloutsig_0_29z };
  assign celloutsig_1_1z = in_data[146:137] & celloutsig_1_0z;
  assign celloutsig_0_10z = celloutsig_0_9z[8:1] & { celloutsig_0_4z[11], celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_18z = { in_data[50:43], celloutsig_0_1z } & { celloutsig_0_1z[1:0], celloutsig_0_7z, celloutsig_0_10z };
  assign celloutsig_0_31z = { celloutsig_0_25z, celloutsig_0_15z, celloutsig_0_12z, celloutsig_0_20z } & celloutsig_0_9z[9:6];
  assign celloutsig_0_34z = { celloutsig_0_24z, celloutsig_0_17z, celloutsig_0_1z, celloutsig_0_25z } == { celloutsig_0_29z, celloutsig_0_33z };
  assign celloutsig_0_49z = { celloutsig_0_9z[11:4], celloutsig_0_16z } == { in_data[59:51], celloutsig_0_23z, celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_29z, celloutsig_0_45z };
  assign celloutsig_0_67z = { celloutsig_0_10z[5:0], celloutsig_0_2z, celloutsig_0_4z } == { celloutsig_0_20z, celloutsig_0_9z, celloutsig_0_44z, celloutsig_0_65z };
  assign celloutsig_0_17z = { celloutsig_0_1z[0], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_7z } == { in_data[71:65], celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_14z };
  assign celloutsig_0_0z = in_data[81:77] >= in_data[54:50];
  assign celloutsig_0_8z = { in_data[86:72], celloutsig_0_3z, celloutsig_0_1z } >= { celloutsig_0_5z[17:2], celloutsig_0_1z };
  assign celloutsig_1_15z = celloutsig_1_2z[3:0] >= in_data[148:145];
  assign celloutsig_0_11z = { celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_3z } >= { celloutsig_0_5z[14:1], celloutsig_0_3z };
  assign celloutsig_0_12z = { celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_6z } >= { celloutsig_0_9z[8:3], celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_0_14z = in_data[54:52] >= celloutsig_0_1z;
  assign celloutsig_0_28z = { celloutsig_0_26z[2], celloutsig_0_24z, celloutsig_0_25z, celloutsig_0_25z, celloutsig_0_2z, celloutsig_0_19z, celloutsig_0_6z } >= { celloutsig_0_21z[10:0], celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_20z, celloutsig_0_0z };
  assign celloutsig_0_43z = { celloutsig_0_38z, celloutsig_0_41z } && celloutsig_0_5z[4:1];
  assign celloutsig_0_53z = { celloutsig_0_10z[5:0], celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_19z, celloutsig_0_34z, celloutsig_0_29z, celloutsig_0_20z, celloutsig_0_22z, celloutsig_0_3z } && { celloutsig_0_27z, celloutsig_0_5z };
  assign celloutsig_0_3z = ! { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_27z = ! { celloutsig_0_6z, celloutsig_0_16z };
  assign celloutsig_0_41z = { celloutsig_0_10z[2:1], celloutsig_0_14z } % { 1'h1, celloutsig_0_4z[10:9] };
  assign celloutsig_0_9z = { in_data[62:54], celloutsig_0_1z } % { 1'h1, celloutsig_0_4z[9:2], celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_7z };
  assign celloutsig_0_5z = in_data[72] ? in_data[32:15] : { in_data[19:10], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_1_0z = in_data[167] ? in_data[159:150] : in_data[152:143];
  assign celloutsig_1_18z = in_data[167] ? { celloutsig_1_16z[2:1], celloutsig_1_8z } : { celloutsig_1_1z[4:3], celloutsig_1_15z };
  assign celloutsig_0_55z = - { celloutsig_0_19z, celloutsig_0_52z, celloutsig_0_53z, celloutsig_0_49z };
  assign celloutsig_0_6z = - { celloutsig_0_4z[6:2], celloutsig_0_2z };
  assign celloutsig_1_4z = - { celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_0_1z = - { in_data[85:84], celloutsig_0_0z };
  assign celloutsig_0_22z = - celloutsig_0_1z;
  assign celloutsig_0_65z = ~ { celloutsig_0_2z, celloutsig_0_50z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_43z };
  assign celloutsig_1_2z = ~ celloutsig_1_0z[8:2];
  assign celloutsig_1_16z = ~ { celloutsig_1_0z[1:0], celloutsig_1_5z };
  assign celloutsig_0_19z = { in_data[35:34], celloutsig_0_14z, celloutsig_0_7z } | { celloutsig_0_18z[10:8], celloutsig_0_8z };
  assign celloutsig_0_47z = celloutsig_0_41z[1] & celloutsig_0_39z;
  assign celloutsig_0_25z = celloutsig_0_4z[4] & celloutsig_0_0z;
  assign celloutsig_0_52z = { celloutsig_0_33z[2:0], celloutsig_0_14z } >> { celloutsig_0_0z, celloutsig_0_47z, celloutsig_0_20z, celloutsig_0_13z };
  assign celloutsig_1_3z = celloutsig_1_1z >> in_data[181:172];
  assign celloutsig_1_19z = celloutsig_1_0z[9:6] >> { celloutsig_1_10z, celloutsig_1_8z };
  assign celloutsig_0_21z = { celloutsig_0_16z[2:1], celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_1z } >> { celloutsig_0_5z[14:8], celloutsig_0_3z, celloutsig_0_6z };
  always_latch
    if (clkin_data[64]) celloutsig_0_4z = 12'h000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_4z = { in_data[10:7], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  always_latch
    if (!clkin_data[96]) celloutsig_1_7z = 8'h00;
    else if (!clkin_data[32]) celloutsig_1_7z = { celloutsig_1_3z[7], celloutsig_1_2z };
  always_latch
    if (!clkin_data[96]) celloutsig_1_10z = 3'h0;
    else if (clkin_data[32]) celloutsig_1_10z = { celloutsig_1_4z[7:6], celloutsig_1_5z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_16z = 6'h00;
    else if (clkin_data[0]) celloutsig_0_16z = celloutsig_0_4z[6:1];
  always_latch
    if (!clkin_data[64]) celloutsig_0_26z = 5'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_26z = { celloutsig_0_16z[3:0], celloutsig_0_14z };
  assign { out_data[130:128], out_data[99:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_75z, celloutsig_0_76z };
endmodule
