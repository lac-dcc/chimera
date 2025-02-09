/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [9:0] celloutsig_0_0z;
  wire [4:0] celloutsig_0_10z;
  reg [8:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire [5:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [3:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  reg [4:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  reg [3:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [7:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [11:0] celloutsig_0_32z;
  wire [7:0] celloutsig_0_33z;
  wire [16:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [6:0] celloutsig_0_37z;
  reg [10:0] celloutsig_0_38z;
  wire [7:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [12:0] celloutsig_0_40z;
  wire [11:0] celloutsig_0_43z;
  wire [7:0] celloutsig_0_44z;
  wire [26:0] celloutsig_0_46z;
  wire [3:0] celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [33:0] celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire [3:0] celloutsig_0_59z;
  wire [14:0] celloutsig_0_5z;
  wire [5:0] celloutsig_0_60z;
  wire celloutsig_0_68z;
  wire [3:0] celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire [17:0] celloutsig_0_72z;
  wire [5:0] celloutsig_0_78z;
  wire celloutsig_0_79z;
  wire [15:0] celloutsig_0_7z;
  wire [4:0] celloutsig_0_8z;
  wire [12:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [13:0] celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire [19:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [20:0] celloutsig_1_6z;
  wire [3:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  reg [4:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_35z = ~(celloutsig_0_12z | celloutsig_0_25z);
  assign celloutsig_0_4z = ~(celloutsig_0_0z[7] | celloutsig_0_2z);
  assign celloutsig_0_68z = ~(celloutsig_0_59z[0] | celloutsig_0_15z);
  assign celloutsig_1_3z = ~(celloutsig_1_1z | in_data[101]);
  assign celloutsig_1_4z = ~(celloutsig_1_0z | celloutsig_1_2z);
  assign celloutsig_1_5z = ~(celloutsig_1_1z | celloutsig_1_3z);
  assign celloutsig_0_15z = ~(celloutsig_0_14z[2] | in_data[86]);
  assign celloutsig_0_17z = ~(celloutsig_0_3z | celloutsig_0_11z[5]);
  assign celloutsig_0_25z = ~(celloutsig_0_20z[1] | celloutsig_0_17z);
  assign celloutsig_0_28z = ~(celloutsig_0_22z | celloutsig_0_9z[0]);
  assign celloutsig_0_36z = ~((celloutsig_0_22z | celloutsig_0_33z[2]) & celloutsig_0_35z);
  assign celloutsig_0_49z = ~((celloutsig_0_11z[3] | celloutsig_0_8z[3]) & celloutsig_0_35z);
  assign celloutsig_0_58z = ~((celloutsig_0_28z | celloutsig_0_48z) & celloutsig_0_35z);
  assign celloutsig_1_17z = ~((celloutsig_1_14z | celloutsig_1_9z[4]) & celloutsig_1_12z[10]);
  assign celloutsig_0_22z = ~((in_data[60] | celloutsig_0_4z) & celloutsig_0_7z[15]);
  assign celloutsig_0_23z = ~((celloutsig_0_1z | celloutsig_0_15z) & celloutsig_0_13z[2]);
  assign celloutsig_0_24z = ~((celloutsig_0_21z[0] | celloutsig_0_12z) & in_data[89]);
  assign celloutsig_0_27z = ~((celloutsig_0_19z | celloutsig_0_4z) & celloutsig_0_25z);
  assign celloutsig_0_48z = celloutsig_0_10z[0] | celloutsig_0_17z;
  assign celloutsig_0_57z = celloutsig_0_28z | celloutsig_0_24z;
  assign celloutsig_0_70z = celloutsig_0_39z[1] | celloutsig_0_60z[2];
  assign celloutsig_1_0z = in_data[134] | in_data[167];
  assign celloutsig_1_1z = celloutsig_1_0z | in_data[145];
  assign celloutsig_1_18z = celloutsig_1_4z | celloutsig_1_15z[10];
  assign celloutsig_0_12z = celloutsig_0_10z[3] | celloutsig_0_7z[7];
  assign celloutsig_0_1z = in_data[21] | celloutsig_0_0z[2];
  assign celloutsig_0_19z = celloutsig_0_1z | celloutsig_0_12z;
  assign celloutsig_0_30z = celloutsig_0_22z | celloutsig_0_15z;
  assign celloutsig_0_33z = celloutsig_0_29z & { celloutsig_0_10z[3:0], celloutsig_0_6z };
  assign celloutsig_0_47z = celloutsig_0_6z & celloutsig_0_18z;
  assign celloutsig_0_59z = { celloutsig_0_13z, celloutsig_0_30z } & { celloutsig_0_49z, celloutsig_0_36z, celloutsig_0_35z, celloutsig_0_49z };
  assign celloutsig_0_6z = { celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_4z } & { celloutsig_0_5z[12:10], celloutsig_0_4z };
  assign celloutsig_0_8z = { celloutsig_0_7z[10:7], celloutsig_0_3z } & { in_data[40:37], celloutsig_0_1z };
  assign celloutsig_1_6z = in_data[137:117] & in_data[149:129];
  assign celloutsig_0_20z = { celloutsig_0_6z[3:1], celloutsig_0_4z } & celloutsig_0_14z[3:0];
  assign celloutsig_0_55z = celloutsig_0_54z[28:21] >= celloutsig_0_44z;
  assign celloutsig_1_2z = { in_data[119], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z } >= in_data[174:168];
  assign celloutsig_1_10z = { celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_9z } >= { celloutsig_1_6z[10:1], celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_5z };
  assign celloutsig_1_14z = celloutsig_1_7z[2:0] >= celloutsig_1_9z[2:0];
  assign celloutsig_0_2z = { in_data[24:9], celloutsig_0_1z } >= { in_data[57:43], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_3z = { celloutsig_0_0z[5:1], celloutsig_0_1z } > in_data[64:59];
  assign celloutsig_0_79z = { celloutsig_0_72z[12], celloutsig_0_59z } > { celloutsig_0_6z[0], celloutsig_0_6z };
  assign celloutsig_1_8z = { celloutsig_1_7z[3], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_5z } > { in_data[182:178], celloutsig_1_5z };
  assign celloutsig_0_34z = { celloutsig_0_29z[5:2], celloutsig_0_32z, celloutsig_0_3z } % { 1'h1, celloutsig_0_33z[5:0], celloutsig_0_2z, celloutsig_0_11z };
  assign celloutsig_0_43z = { celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_25z, celloutsig_0_36z, celloutsig_0_39z } % { 1'h1, in_data[25:22], celloutsig_0_13z, celloutsig_0_26z };
  assign celloutsig_0_44z = { celloutsig_0_5z[7:6], celloutsig_0_10z, celloutsig_0_27z } % { 1'h1, celloutsig_0_6z[2], celloutsig_0_26z, celloutsig_0_22z, celloutsig_0_28z };
  assign celloutsig_0_72z = { celloutsig_0_46z[25:17], celloutsig_0_33z, celloutsig_0_12z } % { 1'h1, celloutsig_0_68z, celloutsig_0_57z, celloutsig_0_59z, celloutsig_0_70z, celloutsig_0_11z, celloutsig_0_58z };
  assign celloutsig_1_7z = in_data[188:185] % { 1'h1, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_4z };
  assign celloutsig_0_10z = { celloutsig_0_6z, celloutsig_0_1z } % { 1'h1, celloutsig_0_8z[1:0], celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_18z = celloutsig_0_7z[6:3] % { 1'h1, celloutsig_0_9z[5], celloutsig_0_4z, celloutsig_0_12z };
  assign celloutsig_0_29z = celloutsig_0_7z[12:5] % { 1'h1, celloutsig_0_16z[2:1], celloutsig_0_27z, celloutsig_0_4z, celloutsig_0_13z };
  assign celloutsig_0_32z = - { celloutsig_0_18z[2:1], celloutsig_0_0z };
  assign celloutsig_0_40z = - { celloutsig_0_38z[8:3], celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_30z };
  assign celloutsig_0_60z = - celloutsig_0_38z[8:3];
  assign celloutsig_1_19z = - { celloutsig_1_14z, celloutsig_1_17z, celloutsig_1_4z };
  assign celloutsig_0_0z = in_data[71:62] ~^ in_data[68:59];
  assign celloutsig_0_37z = celloutsig_0_34z[16:10] ~^ { celloutsig_0_11z[5], celloutsig_0_30z, celloutsig_0_21z };
  assign celloutsig_0_39z = celloutsig_0_7z[13:6] ~^ celloutsig_0_33z;
  assign celloutsig_0_46z = { celloutsig_0_34z[11:1], celloutsig_0_18z, celloutsig_0_43z } ~^ { celloutsig_0_44z[3:0], celloutsig_0_16z, celloutsig_0_21z, celloutsig_0_23z, celloutsig_0_40z };
  assign celloutsig_0_5z = { in_data[32:19], celloutsig_0_2z } ~^ { celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_0_54z = { celloutsig_0_32z[10:4], celloutsig_0_27z, celloutsig_0_47z, celloutsig_0_12z, celloutsig_0_35z, celloutsig_0_47z, celloutsig_0_8z, celloutsig_0_35z, celloutsig_0_0z } ~^ { celloutsig_0_37z[6:1], celloutsig_0_11z, celloutsig_0_20z, celloutsig_0_5z };
  assign celloutsig_0_78z = { celloutsig_0_0z[7:3], celloutsig_0_55z } ~^ { celloutsig_0_21z, celloutsig_0_48z };
  assign celloutsig_0_9z = { celloutsig_0_6z[3:1], celloutsig_0_0z } ~^ { celloutsig_0_5z[12:11], celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_1_12z = { celloutsig_1_6z[18:10], celloutsig_1_10z, celloutsig_1_7z } ~^ celloutsig_1_6z[13:0];
  assign celloutsig_1_15z = { celloutsig_1_12z[11:1], celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_14z, celloutsig_1_10z, celloutsig_1_8z } ~^ in_data[155:136];
  assign celloutsig_0_13z = { in_data[93:92], celloutsig_0_4z } ~^ celloutsig_0_8z[3:1];
  assign celloutsig_0_14z = { celloutsig_0_10z[3:2], celloutsig_0_13z, celloutsig_0_2z } ~^ { celloutsig_0_8z, celloutsig_0_4z };
  assign celloutsig_0_16z = celloutsig_0_7z[7:4] ~^ celloutsig_0_6z;
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_38z = 11'h000;
    else if (!clkin_data[0]) celloutsig_0_38z = in_data[67:57];
  always_latch
    if (clkin_data[64]) celloutsig_1_9z = 5'h00;
    else if (clkin_data[32]) celloutsig_1_9z = { celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z };
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_11z = 9'h000;
    else if (clkin_data[0]) celloutsig_0_11z = { celloutsig_0_8z[3:1], celloutsig_0_4z, celloutsig_0_8z };
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_21z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_21z = { celloutsig_0_17z, celloutsig_0_13z, celloutsig_0_17z };
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_26z = 4'h0;
    else if (clkin_data[0]) celloutsig_0_26z = celloutsig_0_18z;
  assign { celloutsig_0_7z[12], celloutsig_0_7z[1], celloutsig_0_7z[15:13], celloutsig_0_7z[11:2] } = { celloutsig_0_4z, celloutsig_0_3z, in_data[92:90], celloutsig_0_0z } ~^ { celloutsig_0_2z, celloutsig_0_0z[0], in_data[22:20], celloutsig_0_3z, celloutsig_0_0z[9:1] };
  assign celloutsig_0_7z[0] = 1'h1;
  assign { out_data[128], out_data[98:96], out_data[37:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_78z, celloutsig_0_79z };
endmodule
