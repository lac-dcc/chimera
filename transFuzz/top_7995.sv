/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [15:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [6:0] celloutsig_0_16z;
  wire [24:0] celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [13:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [9:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [2:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [14:0] celloutsig_0_27z;
  wire [4:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [5:0] celloutsig_0_31z;
  wire [18:0] celloutsig_0_32z;
  wire [5:0] celloutsig_0_33z;
  wire celloutsig_0_35z;
  reg [12:0] celloutsig_0_37z;
  wire [2:0] celloutsig_0_38z;
  wire [13:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [4:0] celloutsig_0_51z;
  wire [3:0] celloutsig_0_52z;
  reg [4:0] celloutsig_0_58z;
  reg [3:0] celloutsig_0_5z;
  wire celloutsig_0_63z;
  wire celloutsig_0_66z;
  wire celloutsig_0_6z;
  wire celloutsig_0_77z;
  wire celloutsig_0_78z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  reg [4:0] celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [24:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  reg [4:0] celloutsig_1_17z;
  reg [2:0] celloutsig_1_18z;
  wire [15:0] celloutsig_1_19z;
  wire [10:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ~((in_data[63] | in_data[95]) & in_data[58]);
  assign celloutsig_0_40z = ~((celloutsig_0_5z[3] | celloutsig_0_3z[6]) & celloutsig_0_13z);
  assign celloutsig_1_8z = ~((celloutsig_1_7z | celloutsig_1_6z) & celloutsig_1_5z);
  assign celloutsig_0_13z = ~((celloutsig_0_1z[5] | celloutsig_0_1z[1]) & celloutsig_0_0z);
  assign celloutsig_0_63z = ~(celloutsig_0_12z ^ celloutsig_0_22z);
  assign celloutsig_0_77z = ~(celloutsig_0_58z[0] ^ celloutsig_0_66z);
  assign celloutsig_1_2z = ~(celloutsig_1_1z[2] ^ celloutsig_1_1z[0]);
  assign celloutsig_1_6z = ~(celloutsig_1_5z ^ celloutsig_1_1z[6]);
  assign celloutsig_1_9z = ~(celloutsig_1_4z ^ celloutsig_1_1z[2]);
  assign celloutsig_1_11z = ~(celloutsig_1_1z[9] ^ in_data[134]);
  assign celloutsig_1_14z = ~(celloutsig_1_8z ^ celloutsig_1_7z);
  assign celloutsig_1_16z = ~(celloutsig_1_9z ^ celloutsig_1_10z[0]);
  assign celloutsig_0_10z = ~(celloutsig_0_7z ^ celloutsig_0_8z);
  assign celloutsig_0_14z = ~(celloutsig_0_1z[0] ^ celloutsig_0_12z);
  assign celloutsig_0_15z = ~(celloutsig_0_6z ^ in_data[58]);
  assign celloutsig_0_19z = ~(celloutsig_0_14z ^ celloutsig_0_5z[0]);
  assign celloutsig_0_25z = ~(celloutsig_0_10z ^ celloutsig_0_16z[5]);
  assign celloutsig_0_32z = { celloutsig_0_13z, celloutsig_0_16z, celloutsig_0_5z, celloutsig_0_22z, celloutsig_0_25z, celloutsig_0_2z } + in_data[49:31];
  assign celloutsig_0_3z = { in_data[66:59], celloutsig_0_0z, celloutsig_0_2z } + in_data[62:49];
  assign celloutsig_1_1z = { in_data[114:109], celloutsig_1_0z } + { in_data[152:147], celloutsig_1_0z };
  assign celloutsig_0_23z = { celloutsig_0_18z[1:0], celloutsig_0_14z } + in_data[57:55];
  assign celloutsig_0_2z = celloutsig_0_1z[6:2] + { in_data[72:69], celloutsig_0_0z };
  assign celloutsig_1_10z = { celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_8z } / { 1'h1, celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_5z };
  assign celloutsig_0_11z = in_data[71:56] / { 1'h1, in_data[65:51] };
  assign celloutsig_0_18z = celloutsig_0_17z[21:18] / { 1'h1, celloutsig_0_2z[3:2], celloutsig_0_8z };
  assign celloutsig_0_27z = { celloutsig_0_11z[8:3], celloutsig_0_26z, celloutsig_0_7z, celloutsig_0_16z } / { 1'h1, celloutsig_0_3z[12:1], celloutsig_0_8z, celloutsig_0_6z };
  assign celloutsig_0_4z = celloutsig_0_1z[7:4] <= celloutsig_0_3z[7:4];
  assign celloutsig_0_49z = { celloutsig_0_18z, celloutsig_0_14z } <= { celloutsig_0_31z[1], celloutsig_0_30z, celloutsig_0_35z, celloutsig_0_24z, celloutsig_0_4z };
  assign celloutsig_1_5z = { celloutsig_1_1z[4:1], celloutsig_1_4z } <= { celloutsig_1_1z[5:3], celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_12z = celloutsig_0_1z[5:2] <= { celloutsig_0_5z[2:0], celloutsig_0_4z };
  assign celloutsig_0_66z = { celloutsig_0_33z, celloutsig_0_63z, celloutsig_0_25z, celloutsig_0_3z, celloutsig_0_13z, celloutsig_0_49z, celloutsig_0_14z, celloutsig_0_52z, celloutsig_0_18z, celloutsig_0_6z } && { celloutsig_0_37z[12:1], celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_32z, celloutsig_0_22z };
  assign celloutsig_1_3z = celloutsig_1_1z[4:0] && { celloutsig_1_1z[7:5], celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_13z = { celloutsig_1_10z[2:0], celloutsig_1_0z, celloutsig_1_6z } && celloutsig_1_12z[20:12];
  assign celloutsig_0_9z = celloutsig_0_3z[3:0] && celloutsig_0_5z;
  assign celloutsig_0_20z = { celloutsig_0_5z[2:0], celloutsig_0_4z } && celloutsig_0_17z[24:21];
  assign celloutsig_0_24z = { celloutsig_0_17z[18:3], celloutsig_0_23z } && { celloutsig_0_21z[9:4], celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_15z, celloutsig_0_19z, celloutsig_0_18z, celloutsig_0_14z, celloutsig_0_18z };
  assign celloutsig_0_26z = { celloutsig_0_9z, celloutsig_0_21z, celloutsig_0_22z, celloutsig_0_15z, celloutsig_0_24z, celloutsig_0_8z } && { in_data[93:80], celloutsig_0_7z };
  assign celloutsig_0_41z = celloutsig_0_17z[17:14] < { celloutsig_0_38z, celloutsig_0_9z };
  assign celloutsig_0_78z = celloutsig_0_16z[3:0] < { celloutsig_0_21z[2:0], celloutsig_0_26z };
  assign celloutsig_0_30z = { celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_22z } < { celloutsig_0_18z[1:0], celloutsig_0_13z };
  assign celloutsig_0_35z = | celloutsig_0_21z;
  assign celloutsig_1_7z = | { celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_1z[4:1] };
  assign celloutsig_0_8z = | { celloutsig_0_7z, celloutsig_0_4z, in_data[17:16], celloutsig_0_0z };
  assign celloutsig_0_51z = celloutsig_0_37z[11:7] >> { celloutsig_0_16z[2:0], celloutsig_0_41z, celloutsig_0_20z };
  assign celloutsig_1_12z = { celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_10z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_11z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_10z } >> { in_data[174:157], celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_10z, celloutsig_1_3z };
  assign celloutsig_1_19z = { celloutsig_1_17z[3:1], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_14z } >> { celloutsig_1_18z[0], celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_18z, celloutsig_1_13z, celloutsig_1_10z };
  assign celloutsig_0_21z = { celloutsig_0_1z[9:4], celloutsig_0_19z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_0z } >> { celloutsig_0_11z[11:3], celloutsig_0_6z };
  assign celloutsig_0_31z = { celloutsig_0_27z[11:9], celloutsig_0_14z, celloutsig_0_25z, celloutsig_0_24z } - { celloutsig_0_17z[16:12], celloutsig_0_8z };
  assign celloutsig_0_33z = { celloutsig_0_18z, celloutsig_0_20z, celloutsig_0_8z } - { celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_7z };
  assign celloutsig_0_38z = { celloutsig_0_3z[7], celloutsig_0_20z, celloutsig_0_0z } - { celloutsig_0_18z[2], celloutsig_0_7z, celloutsig_0_0z };
  assign celloutsig_0_52z = { celloutsig_0_2z[1:0], celloutsig_0_7z, celloutsig_0_40z } - { celloutsig_0_16z[5:3], celloutsig_0_6z };
  assign celloutsig_0_1z = in_data[88:75] - { in_data[43:31], celloutsig_0_0z };
  assign celloutsig_0_16z = { celloutsig_0_1z[11:8], celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_14z } - { celloutsig_0_3z[11:6], celloutsig_0_10z };
  assign celloutsig_0_17z = in_data[95:71] - { celloutsig_0_3z[13:1], celloutsig_0_12z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_7z };
  always_latch
    if (clkin_data[64]) celloutsig_0_37z = 13'h0000;
    else if (celloutsig_1_18z[0]) celloutsig_0_37z = { celloutsig_0_27z[11:1], celloutsig_0_14z, celloutsig_0_9z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_5z = 4'h0;
    else if (!celloutsig_1_18z[0]) celloutsig_0_5z = celloutsig_0_1z[7:4];
  always_latch
    if (clkin_data[64]) celloutsig_0_58z = 5'h00;
    else if (celloutsig_1_18z[0]) celloutsig_0_58z = { celloutsig_0_51z[4:2], celloutsig_0_22z, celloutsig_0_14z };
  always_latch
    if (clkin_data[128]) celloutsig_1_0z = 5'h00;
    else if (!clkin_data[0]) celloutsig_1_0z = in_data[163:159];
  always_latch
    if (clkin_data[128]) celloutsig_1_17z = 5'h00;
    else if (clkin_data[0]) celloutsig_1_17z = { celloutsig_1_16z, celloutsig_1_10z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_18z = 3'h0;
    else if (clkin_data[32]) celloutsig_1_18z = { celloutsig_1_9z, celloutsig_1_11z, celloutsig_1_7z };
  assign celloutsig_0_6z = ~((in_data[87] & celloutsig_0_4z) | (celloutsig_0_3z[5] & celloutsig_0_3z[12]));
  assign celloutsig_0_7z = ~((celloutsig_0_5z[2] & celloutsig_0_2z[0]) | (in_data[34] & celloutsig_0_3z[11]));
  assign celloutsig_1_4z = ~((celloutsig_1_1z[6] & celloutsig_1_0z[3]) | (celloutsig_1_3z & celloutsig_1_0z[4]));
  assign celloutsig_0_22z = ~((celloutsig_0_3z[2] & celloutsig_0_8z) | (celloutsig_0_20z & celloutsig_0_3z[13]));
  assign { out_data[130:128], out_data[111:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_77z, celloutsig_0_78z };
endmodule
