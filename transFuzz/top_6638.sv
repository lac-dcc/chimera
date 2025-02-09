/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [11:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  reg [11:0] celloutsig_0_12z;
  wire [4:0] celloutsig_0_13z;
  reg [12:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  reg [10:0] celloutsig_0_17z;
  wire [7:0] celloutsig_0_18z;
  wire [25:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  reg [8:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [10:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [4:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [22:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [6:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [10:0] celloutsig_0_32z;
  wire [5:0] celloutsig_0_33z;
  wire [26:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [14:0] celloutsig_0_37z;
  wire [21:0] celloutsig_0_38z;
  wire [10:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [3:0] celloutsig_0_43z;
  wire [3:0] celloutsig_0_44z;
  wire [6:0] celloutsig_0_45z;
  wire [6:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire [23:0] celloutsig_0_4z;
  wire [7:0] celloutsig_0_54z;
  wire [24:0] celloutsig_0_56z;
  wire [8:0] celloutsig_0_59z;
  wire [17:0] celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [6:0] celloutsig_0_63z;
  wire [7:0] celloutsig_0_66z;
  wire [2:0] celloutsig_0_6z;
  wire [16:0] celloutsig_0_79z;
  wire [4:0] celloutsig_0_7z;
  wire celloutsig_0_80z;
  wire [15:0] celloutsig_0_86z;
  wire [5:0] celloutsig_0_87z;
  wire [16:0] celloutsig_0_8z;
  reg [11:0] celloutsig_0_9z;
  reg [2:0] celloutsig_1_0z;
  wire [18:0] celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire [8:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [4:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [7:0] celloutsig_1_1z;
  wire [3:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [14:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_7z = ~(celloutsig_1_3z & celloutsig_1_0z[1]);
  assign celloutsig_0_11z = ~(celloutsig_0_3z & celloutsig_0_7z[0]);
  assign celloutsig_0_23z = ~(celloutsig_0_18z[4] & in_data[38]);
  assign celloutsig_0_0z = ~(in_data[44] | in_data[76]);
  assign celloutsig_0_48z = ~(celloutsig_0_5z[14] | celloutsig_0_46z[5]);
  assign celloutsig_1_3z = ~celloutsig_1_0z[2];
  assign celloutsig_1_17z = ~celloutsig_1_11z[2];
  assign celloutsig_0_22z = ~celloutsig_0_11z;
  assign celloutsig_0_29z = ~celloutsig_0_25z;
  assign celloutsig_0_38z = { celloutsig_0_16z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_15z } / { 1'h1, celloutsig_0_8z[9:7], celloutsig_0_5z };
  assign celloutsig_0_39z = { celloutsig_0_9z[11:2], celloutsig_0_27z } / { 1'h1, celloutsig_0_9z[10:1] };
  assign celloutsig_1_9z = in_data[147:145] / { 1'h1, celloutsig_1_1z[3:2] };
  assign celloutsig_1_10z = { in_data[131:114], celloutsig_1_8z } / { 1'h1, in_data[164:149], celloutsig_1_5z, celloutsig_1_3z };
  assign celloutsig_1_16z = celloutsig_1_1z[4:0] / { 1'h1, in_data[183], celloutsig_1_13z, celloutsig_1_14z, celloutsig_1_7z };
  assign celloutsig_0_13z = { celloutsig_0_4z[12:9], celloutsig_0_3z } / { 1'h1, celloutsig_0_9z[9:6] };
  assign celloutsig_0_3z = in_data[9:2] == { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_35z = { celloutsig_0_33z, celloutsig_0_22z, celloutsig_0_25z, celloutsig_0_25z } == { celloutsig_0_19z[20], celloutsig_0_27z, celloutsig_0_30z };
  assign celloutsig_0_49z = celloutsig_0_44z[3:2] == celloutsig_0_30z[3:2];
  assign celloutsig_0_80z = celloutsig_0_59z[3:1] == celloutsig_0_10z[2:0];
  assign celloutsig_1_5z = { celloutsig_1_2z[2:0], celloutsig_1_3z } == celloutsig_1_1z[3:0];
  assign celloutsig_1_14z = celloutsig_1_10z[18:1] == { celloutsig_1_1z[5:3], celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_18z = { celloutsig_1_1z[6], celloutsig_1_0z, celloutsig_1_17z, celloutsig_1_13z } == { celloutsig_1_16z, celloutsig_1_7z };
  assign celloutsig_1_19z = celloutsig_1_4z[13:5] == { celloutsig_1_1z[6:1], celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_5z };
  assign celloutsig_0_27z = { celloutsig_0_16z, celloutsig_0_1z } == celloutsig_0_8z[14:11];
  assign celloutsig_0_31z = { celloutsig_0_14z[0], celloutsig_0_3z, celloutsig_0_3z } == celloutsig_0_8z[13:11];
  assign celloutsig_0_60z = celloutsig_0_56z[5:3] >= celloutsig_0_7z[2:0];
  assign celloutsig_0_15z = { celloutsig_0_10z[6:4], celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_13z } >= { celloutsig_0_9z[11:4], celloutsig_0_11z, celloutsig_0_0z };
  assign celloutsig_0_21z = celloutsig_0_10z[8:5] >= celloutsig_0_17z[4:1];
  assign celloutsig_0_2z = { in_data[45:43], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z } >= { in_data[58:53], celloutsig_0_0z };
  assign celloutsig_0_40z = { celloutsig_0_4z[22:2], celloutsig_0_1z, celloutsig_0_0z } || in_data[84:62];
  assign celloutsig_0_47z = { celloutsig_0_39z[7:6], celloutsig_0_45z } || { celloutsig_0_20z[7:0], celloutsig_0_0z };
  assign celloutsig_1_6z = { in_data[171:165], celloutsig_1_3z, celloutsig_1_4z } || in_data[173:151];
  assign celloutsig_1_8z = { celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_2z } || { celloutsig_1_1z[4], celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_1_13z = { celloutsig_1_11z, celloutsig_1_9z } || { celloutsig_1_12z[6:4], celloutsig_1_9z };
  assign celloutsig_0_1z = { in_data[87:66], celloutsig_0_0z, celloutsig_0_0z } || { in_data[84:62], celloutsig_0_0z };
  assign celloutsig_0_25z = { celloutsig_0_9z[10:8], celloutsig_0_11z } || celloutsig_0_24z[9:6];
  assign celloutsig_0_54z = celloutsig_0_48z ? { celloutsig_0_34z[19:13], celloutsig_0_23z } : celloutsig_0_20z[7:0];
  assign celloutsig_0_4z = { in_data[78:63], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_0z } >> { in_data[38:22], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_44z = { celloutsig_0_6z[2], celloutsig_0_21z, celloutsig_0_40z, celloutsig_0_2z } >> celloutsig_0_19z[14:11];
  assign celloutsig_0_6z = { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z } >> { celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_63z = { celloutsig_0_46z[5:0], celloutsig_0_25z } >> { celloutsig_0_59z[7:5], celloutsig_0_43z };
  assign celloutsig_1_2z = celloutsig_1_1z[6:3] >> in_data[131:128];
  assign celloutsig_1_4z = { in_data[138:129], celloutsig_1_3z, celloutsig_1_2z } >> { celloutsig_1_1z[5], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_11z = { celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_3z } >> celloutsig_1_0z;
  assign celloutsig_1_12z = { celloutsig_1_10z[13:7], celloutsig_1_3z, celloutsig_1_6z } >> { celloutsig_1_1z, celloutsig_1_8z };
  assign celloutsig_0_19z = { celloutsig_0_5z[16:8], celloutsig_0_13z, celloutsig_0_10z } >> in_data[48:23];
  assign celloutsig_0_28z = { celloutsig_0_4z[20:12], celloutsig_0_20z, celloutsig_0_26z } >> { celloutsig_0_4z[12:11], celloutsig_0_17z, celloutsig_0_26z, celloutsig_0_26z };
  assign celloutsig_0_34z = { celloutsig_0_6z[2:1], celloutsig_0_31z, celloutsig_0_3z, celloutsig_0_25z, celloutsig_0_9z, celloutsig_0_18z, celloutsig_0_22z, celloutsig_0_1z } <<< { celloutsig_0_19z[22:16], celloutsig_0_29z, celloutsig_0_29z, celloutsig_0_11z, celloutsig_0_8z };
  assign celloutsig_0_43z = celloutsig_0_33z[3:0] <<< celloutsig_0_8z[16:13];
  assign celloutsig_0_66z = { celloutsig_0_5z[2:1], celloutsig_0_11z, celloutsig_0_27z, celloutsig_0_43z } <<< { celloutsig_0_13z[1], celloutsig_0_22z, celloutsig_0_33z };
  assign celloutsig_0_79z = { 14'h0000, celloutsig_0_37z[0], celloutsig_0_60z, celloutsig_0_22z } <<< { celloutsig_0_56z[11:3], celloutsig_0_63z, celloutsig_0_49z };
  assign celloutsig_0_33z = celloutsig_0_5z[6:1] >>> { celloutsig_0_25z, celloutsig_0_7z };
  assign celloutsig_0_5z = { celloutsig_0_4z[20:4], celloutsig_0_0z } >>> in_data[34:17];
  assign celloutsig_0_87z = celloutsig_0_54z[7:2] >>> celloutsig_0_32z[7:2];
  assign celloutsig_1_1z = in_data[143:136] >>> { in_data[108:104], celloutsig_1_0z };
  assign celloutsig_0_30z = { celloutsig_0_28z[9:5], celloutsig_0_29z, celloutsig_0_1z } >>> { celloutsig_0_9z[0], celloutsig_0_22z, celloutsig_0_26z };
  assign celloutsig_0_45z = { celloutsig_0_12z[10:9], celloutsig_0_25z, celloutsig_0_43z } - { 6'h00, celloutsig_0_2z };
  assign celloutsig_0_59z = celloutsig_0_28z[12:4] - celloutsig_0_17z[9:1];
  assign celloutsig_0_86z = celloutsig_0_79z[16:1] - { celloutsig_0_66z[7:4], celloutsig_0_80z, celloutsig_0_17z };
  assign celloutsig_0_10z = { celloutsig_0_4z[19:11], celloutsig_0_6z } - celloutsig_0_8z[14:3];
  assign celloutsig_0_16z = { celloutsig_0_7z[1:0], celloutsig_0_0z } - celloutsig_0_5z[11:9];
  assign celloutsig_0_24z = celloutsig_0_8z[16:6] - celloutsig_0_5z[17:7];
  assign celloutsig_0_26z = celloutsig_0_17z[7:3] - celloutsig_0_12z[7:3];
  assign celloutsig_0_32z = celloutsig_0_24z ~^ celloutsig_0_17z;
  assign celloutsig_0_18z = celloutsig_0_9z[9:2] ~^ celloutsig_0_14z[8:1];
  assign celloutsig_0_46z = { celloutsig_0_9z[8:5], celloutsig_0_6z } ^ celloutsig_0_38z[13:7];
  assign celloutsig_0_56z = { celloutsig_0_5z[16:5], celloutsig_0_10z, celloutsig_0_11z } ^ { celloutsig_0_20z[8:7], celloutsig_0_46z, celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_26z, celloutsig_0_23z, celloutsig_0_35z, celloutsig_0_22z, celloutsig_0_47z, celloutsig_0_29z };
  assign celloutsig_0_7z = { celloutsig_0_6z[1:0], celloutsig_0_6z } ^ celloutsig_0_5z[5:1];
  assign celloutsig_0_8z = { celloutsig_0_5z[17:2], celloutsig_0_0z } ^ in_data[76:60];
  always_latch
    if (!clkin_data[96]) celloutsig_1_0z = 3'h0;
    else if (!clkin_data[0]) celloutsig_1_0z = in_data[98:96];
  always_latch
    if (clkin_data[64]) celloutsig_0_9z = 12'h000;
    else if (celloutsig_1_18z) celloutsig_0_9z = celloutsig_0_4z[20:9];
  always_latch
    if (clkin_data[32]) celloutsig_0_12z = 12'h000;
    else if (celloutsig_1_18z) celloutsig_0_12z = { in_data[48:38], celloutsig_0_1z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_14z = 13'h0000;
    else if (celloutsig_1_18z) celloutsig_0_14z = { celloutsig_0_12z, celloutsig_0_3z };
  always_latch
    if (clkin_data[64]) celloutsig_0_17z = 11'h000;
    else if (!celloutsig_1_18z) celloutsig_0_17z = { celloutsig_0_12z[11:2], celloutsig_0_1z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_20z = 9'h000;
    else if (celloutsig_1_18z) celloutsig_0_20z = celloutsig_0_4z[11:3];
  assign celloutsig_0_37z[0] = celloutsig_0_2z ^ celloutsig_0_8z[1];
  assign celloutsig_0_37z[14:1] = 14'h0000;
  assign { out_data[128], out_data[96], out_data[47:32], out_data[5:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_86z, celloutsig_0_87z };
endmodule
