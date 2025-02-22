/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [2:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [13:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  wire [6:0] celloutsig_0_17z;
  wire [15:0] celloutsig_0_18z;
  wire [9:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [6:0] celloutsig_0_24z;
  reg [4:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [10:0] celloutsig_0_27z;
  wire [3:0] celloutsig_0_28z;
  wire [13:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [3:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [12:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [17:0] celloutsig_0_34z;
  wire [3:0] celloutsig_0_35z;
  reg [9:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_43z;
  reg [7:0] celloutsig_0_44z;
  wire celloutsig_0_47z;
  wire [4:0] celloutsig_0_4z;
  reg [30:0] celloutsig_0_59z;
  wire [2:0] celloutsig_0_5z;
  wire [13:0] celloutsig_0_61z;
  wire celloutsig_0_63z;
  wire [26:0] celloutsig_0_64z;
  wire [15:0] celloutsig_0_66z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [15:0] celloutsig_0_8z;
  wire celloutsig_0_96z;
  wire [13:0] celloutsig_0_97z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [4:0] celloutsig_1_13z;
  wire [16:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire [8:0] celloutsig_1_3z;
  wire [6:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [3:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_96z = celloutsig_0_38z ? celloutsig_0_66z[12] : celloutsig_0_29z[6];
  assign celloutsig_0_15z = in_data[73] ? celloutsig_0_9z : celloutsig_0_3z;
  assign celloutsig_0_21z = celloutsig_0_13z ? celloutsig_0_18z[11] : celloutsig_0_10z;
  assign celloutsig_0_43z = ~(celloutsig_0_21z & celloutsig_0_35z[1]);
  assign celloutsig_0_6z = ~(celloutsig_0_3z & celloutsig_0_3z);
  assign celloutsig_0_63z = ~(celloutsig_0_13z & celloutsig_0_30z[2]);
  assign celloutsig_1_5z = ~(celloutsig_1_0z & in_data[152]);
  assign celloutsig_0_22z = ~(celloutsig_0_15z & celloutsig_0_12z);
  assign celloutsig_0_33z = ~(celloutsig_0_29z[2] & celloutsig_0_17z[4]);
  assign celloutsig_0_37z = ~(celloutsig_0_36z[5] ^ celloutsig_0_17z[2]);
  assign celloutsig_0_9z = ~(celloutsig_0_4z[1] ^ celloutsig_0_4z[3]);
  assign celloutsig_0_10z = ~(celloutsig_0_4z[1] ^ in_data[28]);
  assign celloutsig_0_13z = ~(celloutsig_0_5z[0] ^ celloutsig_0_10z);
  assign celloutsig_0_3z = { in_data[91:86], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z } == { in_data[62:54], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_38z = { celloutsig_0_16z[0], celloutsig_0_13z, celloutsig_0_21z, celloutsig_0_6z } == celloutsig_0_14z[11:8];
  assign celloutsig_0_47z = { celloutsig_0_36z[4:0], celloutsig_0_15z, celloutsig_0_20z } == { celloutsig_0_27z[5:0], celloutsig_0_38z };
  assign celloutsig_0_7z = in_data[16:12] == in_data[72:68];
  assign celloutsig_1_1z = in_data[124:119] == { in_data[188:184], celloutsig_1_0z };
  assign celloutsig_1_11z = { celloutsig_1_3z[8:5], celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_6z } == celloutsig_1_3z[6:0];
  assign celloutsig_0_2z = in_data[8:6] == { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_31z = celloutsig_0_27z[10:7] == { celloutsig_0_15z, celloutsig_0_22z, celloutsig_0_12z, celloutsig_0_2z };
  assign celloutsig_0_1z = { in_data[50:27], celloutsig_0_0z, celloutsig_0_0z } >= { in_data[51:27], celloutsig_0_0z };
  assign celloutsig_0_0z = in_data[62:57] < in_data[87:82];
  assign celloutsig_1_6z = in_data[106:99] < { celloutsig_1_3z[2], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_12z = in_data[166:154] < { celloutsig_1_9z[1:0], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_11z };
  assign celloutsig_1_18z = celloutsig_1_15z[10:6] < celloutsig_1_3z[6:2];
  assign celloutsig_0_20z = { celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_0z } < { celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_26z = celloutsig_0_14z[13:5] < { celloutsig_0_8z[10:5], celloutsig_0_5z };
  assign celloutsig_0_66z = { celloutsig_0_59z[30:16], celloutsig_0_63z } % { 1'h1, celloutsig_0_35z[2:0], celloutsig_0_44z, celloutsig_0_30z };
  assign celloutsig_1_7z = { celloutsig_1_4z[4], celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_0z } % { 1'h1, celloutsig_1_3z[5:3] };
  assign celloutsig_0_24z = { celloutsig_0_14z[12:8], celloutsig_0_15z, celloutsig_0_12z } % { 1'h1, celloutsig_0_18z[13:8] };
  assign celloutsig_0_30z = { celloutsig_0_4z[4:3], celloutsig_0_13z, celloutsig_0_13z } % { 1'h1, celloutsig_0_12z, celloutsig_0_26z, celloutsig_0_12z };
  assign celloutsig_0_4z = - in_data[17:13];
  assign celloutsig_0_5z = - celloutsig_0_4z[4:2];
  assign celloutsig_1_2z = - { in_data[137:134], celloutsig_1_1z };
  assign celloutsig_1_3z = - { celloutsig_1_2z[4:2], celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_17z = - celloutsig_0_14z[8:2];
  assign celloutsig_0_64z = ~ { celloutsig_0_59z[8:3], celloutsig_0_61z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_31z };
  assign celloutsig_0_97z = ~ { celloutsig_0_64z[17:5], celloutsig_0_7z };
  assign celloutsig_1_9z = ~ celloutsig_1_3z[3:1];
  assign celloutsig_0_11z = ~ celloutsig_0_5z;
  assign celloutsig_1_13z = ~ celloutsig_1_2z;
  assign celloutsig_0_16z = ~ celloutsig_0_8z[12:10];
  assign celloutsig_0_19z = ~ { celloutsig_0_16z, celloutsig_0_17z };
  assign celloutsig_0_27z = ~ { celloutsig_0_24z[0], celloutsig_0_19z };
  assign celloutsig_1_0z = in_data[180] & in_data[132];
  assign celloutsig_1_8z = celloutsig_1_2z[2] & celloutsig_1_5z;
  assign celloutsig_0_12z = celloutsig_0_11z[2] & celloutsig_0_4z[3];
  assign celloutsig_1_19z = celloutsig_1_5z & in_data[147];
  assign celloutsig_0_34z = { celloutsig_0_24z[2:1], celloutsig_0_10z, celloutsig_0_30z, celloutsig_0_33z, celloutsig_0_4z, celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_26z } << { celloutsig_0_30z[3:1], celloutsig_0_28z, celloutsig_0_16z, celloutsig_0_31z, celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_13z };
  assign celloutsig_0_35z = celloutsig_0_14z[12:9] << { celloutsig_0_1z, celloutsig_0_5z };
  assign celloutsig_0_61z = { celloutsig_0_29z[11:1], celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_37z } << { celloutsig_0_47z, celloutsig_0_4z, celloutsig_0_44z };
  assign celloutsig_1_4z = { celloutsig_1_3z[6:2], celloutsig_1_0z, celloutsig_1_0z } << celloutsig_1_3z[8:2];
  assign celloutsig_0_14z = { celloutsig_0_13z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_4z } << { celloutsig_0_8z[12:3], celloutsig_0_11z, celloutsig_0_6z };
  assign celloutsig_0_18z = { celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_11z } << { celloutsig_0_14z[8:4], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_13z, celloutsig_0_4z };
  assign celloutsig_0_28z = { celloutsig_0_4z[3:1], celloutsig_0_12z } << { celloutsig_0_5z[0], celloutsig_0_26z, celloutsig_0_10z, celloutsig_0_26z };
  assign celloutsig_0_29z = { celloutsig_0_27z[6:1], celloutsig_0_22z, celloutsig_0_17z } << { celloutsig_0_17z[5:2], celloutsig_0_20z, celloutsig_0_3z, celloutsig_0_22z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_21z };
  assign celloutsig_0_32z = { celloutsig_0_19z[6:2], celloutsig_0_31z, celloutsig_0_28z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_12z } << { celloutsig_0_14z[9:0], celloutsig_0_12z, celloutsig_0_26z, celloutsig_0_20z };
  assign celloutsig_0_8z = { in_data[20:8], celloutsig_0_5z } ^ { in_data[57:43], celloutsig_0_2z };
  assign celloutsig_1_15z = { celloutsig_1_4z[6:1], celloutsig_1_7z, celloutsig_1_13z, celloutsig_1_6z, celloutsig_1_12z } ^ { celloutsig_1_3z[7:0], celloutsig_1_2z, celloutsig_1_11z, celloutsig_1_9z };
  always_latch
    if (clkin_data[0]) celloutsig_0_36z = 10'h000;
    else if (!celloutsig_1_18z) celloutsig_0_36z = { celloutsig_0_32z[9:1], celloutsig_0_22z };
  always_latch
    if (clkin_data[32]) celloutsig_0_44z = 8'h00;
    else if (celloutsig_1_18z) celloutsig_0_44z = { celloutsig_0_34z[14], celloutsig_0_43z, celloutsig_0_4z, celloutsig_0_13z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_59z = 31'h00000000;
    else if (celloutsig_1_18z) celloutsig_0_59z = { celloutsig_0_32z[9:2], celloutsig_0_38z, celloutsig_0_37z, celloutsig_0_20z, celloutsig_0_29z, celloutsig_0_1z, celloutsig_0_25z };
  always_latch
    if (clkin_data[32]) celloutsig_0_25z = 5'h00;
    else if (celloutsig_1_18z) celloutsig_0_25z = { celloutsig_0_4z[4:1], celloutsig_0_9z };
  assign { out_data[128], out_data[96], out_data[32], out_data[13:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_96z, celloutsig_0_97z };
endmodule
