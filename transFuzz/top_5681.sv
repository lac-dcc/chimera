/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  reg [8:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [13:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  reg [2:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [16:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [3:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [4:0] celloutsig_0_33z;
  wire [7:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [10:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire [2:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_43z;
  reg [3:0] celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire [9:0] celloutsig_0_52z;
  wire celloutsig_0_54z;
  wire celloutsig_0_57z;
  wire [2:0] celloutsig_0_58z;
  wire [12:0] celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_74z;
  wire [3:0] celloutsig_0_7z;
  wire [16:0] celloutsig_0_8z;
  wire [10:0] celloutsig_0_95z;
  wire celloutsig_0_96z;
  wire celloutsig_0_9z;
  reg [3:0] celloutsig_1_0z;
  wire [7:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [25:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [6:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_4z = ~(celloutsig_0_3z & celloutsig_0_2z);
  assign celloutsig_0_14z = ~(celloutsig_0_9z & celloutsig_0_8z[15]);
  assign celloutsig_0_15z = ~(celloutsig_0_6z & in_data[65]);
  assign celloutsig_0_20z = ~(celloutsig_0_13z & celloutsig_0_18z);
  assign celloutsig_0_25z = ~(celloutsig_0_17z[1] & celloutsig_0_7z[1]);
  assign celloutsig_0_35z = ~((celloutsig_0_2z | celloutsig_0_28z) & celloutsig_0_26z[14]);
  assign celloutsig_0_3z = ~((celloutsig_0_1z[5] | in_data[50]) & celloutsig_0_2z);
  assign celloutsig_0_47z = ~((celloutsig_0_6z | celloutsig_0_18z) & celloutsig_0_30z);
  assign celloutsig_1_7z = ~((celloutsig_1_0z[0] | celloutsig_1_2z[4]) & in_data[162]);
  assign celloutsig_1_19z = ~((celloutsig_1_13z | celloutsig_1_0z[2]) & celloutsig_1_3z);
  assign celloutsig_0_12z = ~((celloutsig_0_6z | celloutsig_0_5z[7]) & 1'h1);
  assign celloutsig_0_19z = ~((celloutsig_0_5z[4] | celloutsig_0_9z) & celloutsig_0_0z);
  assign celloutsig_0_27z = ~((celloutsig_0_21z | celloutsig_0_21z) & celloutsig_0_13z);
  assign celloutsig_0_54z = ~((celloutsig_0_15z | celloutsig_0_45z) & (celloutsig_0_18z | celloutsig_0_34z[6]));
  assign celloutsig_0_57z = ~((celloutsig_0_36z | celloutsig_0_52z[5]) & (celloutsig_0_1z[11] | celloutsig_0_27z));
  assign celloutsig_0_67z = ~((celloutsig_0_3z | celloutsig_0_60z) & (celloutsig_0_14z | celloutsig_0_16z));
  assign celloutsig_0_96z = ~((celloutsig_0_74z | celloutsig_0_48z) & (celloutsig_0_67z | celloutsig_0_44z[1]));
  assign celloutsig_0_16z = ~((celloutsig_0_2z | celloutsig_0_3z) & (celloutsig_0_11z | celloutsig_0_7z[1]));
  assign celloutsig_0_2z = ~((celloutsig_0_1z[0] | in_data[68]) & (celloutsig_0_1z[7] | in_data[27]));
  assign celloutsig_0_21z = ~((celloutsig_0_5z[1] | celloutsig_0_6z) & (celloutsig_0_12z | in_data[28]));
  assign celloutsig_0_0z = ~(in_data[83] ^ in_data[13]);
  assign celloutsig_1_4z = ~(celloutsig_1_1z ^ celloutsig_1_2z[20]);
  assign celloutsig_1_12z = ~(celloutsig_1_2z[16] ^ in_data[145]);
  assign celloutsig_0_23z = ~(celloutsig_0_5z[10] ^ celloutsig_0_13z);
  assign celloutsig_0_28z = ~(celloutsig_0_2z ^ celloutsig_0_8z[14]);
  assign celloutsig_0_30z = ~(celloutsig_0_20z ^ celloutsig_0_24z);
  assign celloutsig_0_32z = { celloutsig_0_30z, celloutsig_0_12z, celloutsig_0_13z } > { celloutsig_0_27z, celloutsig_0_31z, celloutsig_0_4z };
  assign celloutsig_0_45z = { celloutsig_0_35z, celloutsig_0_24z, celloutsig_0_13z } > { celloutsig_0_11z, celloutsig_0_32z, celloutsig_0_27z };
  assign celloutsig_0_48z = { in_data[22:19], celloutsig_0_38z } > celloutsig_0_34z[6:2];
  assign celloutsig_0_60z = { celloutsig_0_5z[9:1], celloutsig_0_21z, celloutsig_0_58z, celloutsig_0_1z, celloutsig_0_43z } > { celloutsig_0_1z, celloutsig_0_40z, celloutsig_0_52z, celloutsig_0_57z };
  assign celloutsig_1_3z = in_data[190:186] > celloutsig_1_2z[11:7];
  assign celloutsig_0_11z = { celloutsig_0_5z[7:4], celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_3z } > { celloutsig_0_1z[10:2], celloutsig_0_9z, celloutsig_0_6z };
  assign celloutsig_1_13z = { celloutsig_1_2z[16:13], celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_4z } > { celloutsig_1_11z[2:0], celloutsig_1_12z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_7z };
  assign celloutsig_0_38z = celloutsig_0_0z & ~(celloutsig_0_34z[2]);
  assign celloutsig_0_74z = celloutsig_0_60z & ~(celloutsig_0_17z[7]);
  assign celloutsig_0_40z = celloutsig_0_37z[3:1] % { 1'h1, celloutsig_0_12z, celloutsig_0_21z };
  assign celloutsig_0_8z = { celloutsig_0_1z[5:4], celloutsig_0_1z, celloutsig_0_2z } % { 1'h1, celloutsig_0_5z[3], celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_0_1z = { in_data[91:80], celloutsig_0_0z, celloutsig_0_0z } % { 1'h1, in_data[37:26], in_data[0] };
  assign celloutsig_0_29z = { celloutsig_0_5z[7:6], celloutsig_0_4z, celloutsig_0_6z } % { 1'h1, celloutsig_0_15z, celloutsig_0_13z, in_data[0] };
  assign celloutsig_0_34z = - celloutsig_0_1z[11:4];
  assign celloutsig_0_58z = - { celloutsig_0_15z, celloutsig_0_54z, celloutsig_0_47z };
  assign celloutsig_0_7z = - { celloutsig_0_5z[8], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_4z };
  assign celloutsig_0_95z = - { celloutsig_0_37z[9:0], celloutsig_0_35z };
  assign celloutsig_1_11z = - celloutsig_1_2z[17:10];
  assign celloutsig_0_26z = - { celloutsig_0_5z, celloutsig_0_24z, celloutsig_0_22z };
  assign celloutsig_0_31z = { celloutsig_0_29z[2], celloutsig_0_28z, celloutsig_0_7z, celloutsig_0_26z, celloutsig_0_23z, celloutsig_0_2z } !== { celloutsig_0_9z, celloutsig_0_22z, celloutsig_0_23z, celloutsig_0_22z, celloutsig_0_20z, celloutsig_0_28z, celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_28z, celloutsig_0_11z, celloutsig_0_29z, celloutsig_0_11z, celloutsig_0_22z, celloutsig_0_23z };
  assign celloutsig_0_36z = { celloutsig_0_26z[11:3], celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_34z, 1'h1, celloutsig_0_23z, celloutsig_0_14z } !== { celloutsig_0_26z[16:1], celloutsig_0_33z, celloutsig_0_27z };
  assign celloutsig_0_41z = { celloutsig_0_11z, celloutsig_0_40z } !== { celloutsig_0_27z, celloutsig_0_24z, celloutsig_0_18z, celloutsig_0_20z };
  assign celloutsig_0_43z = { celloutsig_0_41z, celloutsig_0_19z, celloutsig_0_11z, celloutsig_0_13z } !== { celloutsig_0_1z[3:2], celloutsig_0_24z, celloutsig_0_4z };
  assign celloutsig_0_9z = { in_data[7:3], celloutsig_0_7z, celloutsig_0_6z } !== celloutsig_0_8z[9:0];
  assign celloutsig_0_13z = { in_data[79:75], celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_3z } !== celloutsig_0_8z[13:2];
  assign celloutsig_0_18z = { celloutsig_0_1z[12:0], celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_9z } !== { celloutsig_0_1z[13:10], celloutsig_0_16z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_15z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_6z = & { celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_1_1z = & celloutsig_1_0z[2:0];
  assign celloutsig_1_6z = & { celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_3z };
  assign celloutsig_0_24z = & { celloutsig_0_22z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z[13:8] };
  assign celloutsig_0_33z = celloutsig_0_26z[6:2] >>> { celloutsig_0_24z, celloutsig_0_23z, celloutsig_0_6z, celloutsig_0_32z, celloutsig_0_20z };
  assign celloutsig_0_37z = { celloutsig_0_5z[9:7], celloutsig_0_7z, celloutsig_0_22z, celloutsig_0_6z } >>> { celloutsig_0_17z, 1'h1, celloutsig_0_9z };
  assign celloutsig_0_52z = { celloutsig_0_17z[7], celloutsig_0_6z, celloutsig_0_16z, celloutsig_0_29z, celloutsig_0_43z, celloutsig_0_36z, celloutsig_0_18z } >>> { celloutsig_0_5z[11:3], celloutsig_0_25z };
  assign celloutsig_0_5z = { in_data[19:11], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_3z } >>> { in_data[65:55], celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_1_2z = in_data[132:107] >>> { in_data[163:151], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_5z = celloutsig_1_2z[13:7] >>> { celloutsig_1_0z[1:0], celloutsig_1_0z, celloutsig_1_1z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_44z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_44z = { in_data[58], celloutsig_0_36z, celloutsig_0_20z, celloutsig_0_12z };
  always_latch
    if (clkin_data[96]) celloutsig_1_0z = 4'h0;
    else if (clkin_data[32]) celloutsig_1_0z = in_data[136:133];
  always_latch
    if (!clkin_data[64]) celloutsig_0_17z = 9'h000;
    else if (clkin_data[0]) celloutsig_0_17z = in_data[8:0];
  always_latch
    if (!clkin_data[64]) celloutsig_0_22z = 3'h0;
    else if (celloutsig_1_19z) celloutsig_0_22z = celloutsig_0_7z[3:1];
  assign { out_data[128], out_data[96], out_data[42:32], out_data[0] } = { 1'h1, celloutsig_1_19z, celloutsig_0_95z, celloutsig_0_96z };
endmodule
