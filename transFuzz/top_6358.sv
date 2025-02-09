/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [4:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [5:0] celloutsig_0_13z;
  wire [5:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [17:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [11:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [16:0] celloutsig_0_1z;
  wire [14:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [3:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [2:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [6:0] celloutsig_0_27z;
  wire [2:0] celloutsig_0_28z;
  wire [22:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  reg [6:0] celloutsig_0_30z;
  wire [3:0] celloutsig_0_31z;
  wire [30:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [11:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [3:0] celloutsig_0_3z;
  wire [2:0] celloutsig_0_40z;
  wire [32:0] celloutsig_0_42z;
  wire [10:0] celloutsig_0_43z;
  reg [20:0] celloutsig_0_44z;
  wire [3:0] celloutsig_0_49z;
  wire [2:0] celloutsig_0_4z;
  wire [11:0] celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire [13:0] celloutsig_0_53z;
  wire celloutsig_0_55z;
  wire [8:0] celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire [10:0] celloutsig_0_62z;
  wire celloutsig_0_63z;
  wire celloutsig_0_65z;
  wire [10:0] celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire [23:0] celloutsig_0_71z;
  wire [19:0] celloutsig_0_72z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [16:0] celloutsig_1_0z;
  wire [25:0] celloutsig_1_10z;
  wire [43:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [3:0] celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [17:0] celloutsig_1_1z;
  wire [11:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [17:0] celloutsig_1_4z;
  reg [3:0] celloutsig_1_5z;
  wire [14:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [4:0] celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_3z = ~(celloutsig_1_1z[8] & celloutsig_1_2z[9]);
  assign celloutsig_1_12z = ~(celloutsig_1_8z[3] & celloutsig_1_2z[3]);
  assign celloutsig_1_16z = ~(celloutsig_1_4z[8] & celloutsig_1_14z);
  assign celloutsig_0_11z = ~(celloutsig_0_9z & celloutsig_0_0z);
  assign celloutsig_0_26z = ~(celloutsig_0_24z[1] & celloutsig_0_2z);
  assign celloutsig_0_0z = ~(in_data[50] | in_data[90]);
  assign celloutsig_0_35z = ~(celloutsig_0_11z | celloutsig_0_4z[1]);
  assign celloutsig_0_36z = ~(celloutsig_0_16z[4] | celloutsig_0_34z[2]);
  assign celloutsig_0_51z = ~(celloutsig_0_12z | celloutsig_0_50z[0]);
  assign celloutsig_0_52z = ~(celloutsig_0_22z[3] | celloutsig_0_27z[2]);
  assign celloutsig_0_55z = ~(celloutsig_0_4z[0] | celloutsig_0_53z[4]);
  assign celloutsig_0_70z = ~(celloutsig_0_7z | celloutsig_0_52z);
  assign celloutsig_0_7z = ~(celloutsig_0_0z | celloutsig_0_6z);
  assign celloutsig_1_14z = ~(celloutsig_1_10z[10] | celloutsig_1_2z[10]);
  assign celloutsig_0_15z = ~(celloutsig_0_1z[11] | celloutsig_0_1z[11]);
  assign celloutsig_0_17z = ~(celloutsig_0_12z | celloutsig_0_14z[4]);
  assign celloutsig_0_2z = ~(in_data[35] | celloutsig_0_1z[11]);
  assign celloutsig_0_33z = { celloutsig_0_4z, celloutsig_0_8z } >= { celloutsig_0_16z[7:5], celloutsig_0_15z };
  assign celloutsig_0_37z = celloutsig_0_3z >= { celloutsig_0_22z[3:2], celloutsig_0_6z, celloutsig_0_11z };
  assign celloutsig_0_38z = { celloutsig_0_18z[9:0], celloutsig_0_33z, celloutsig_0_35z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_26z, celloutsig_0_12z, celloutsig_0_36z } >= { in_data[71:56], celloutsig_0_5z };
  assign celloutsig_0_39z = { celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_0z } >= { celloutsig_0_32z[13:12], celloutsig_0_14z, celloutsig_0_21z };
  assign celloutsig_0_5z = { in_data[34:24], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } >= { in_data[82:76], celloutsig_0_3z, celloutsig_0_4z };
  assign celloutsig_0_6z = celloutsig_0_1z[15:5] >= celloutsig_0_1z[15:5];
  assign celloutsig_0_63z = { celloutsig_0_18z[10], celloutsig_0_38z, celloutsig_0_21z, celloutsig_0_40z, celloutsig_0_37z, celloutsig_0_15z, celloutsig_0_25z, celloutsig_0_33z } >= in_data[55:46];
  assign celloutsig_0_65z = { celloutsig_0_16z[3:0], celloutsig_0_19z, celloutsig_0_23z } >= celloutsig_0_13z;
  assign celloutsig_1_7z = celloutsig_1_2z[9:1] >= { in_data[132:125], celloutsig_1_3z };
  assign celloutsig_0_8z = { celloutsig_0_0z, celloutsig_0_4z } >= in_data[65:62];
  assign celloutsig_1_13z = celloutsig_1_1z[15:9] >= { in_data[161:156], celloutsig_1_3z };
  assign celloutsig_1_18z = { celloutsig_1_0z[13:1], celloutsig_1_16z, celloutsig_1_15z } >= in_data[135:118];
  assign celloutsig_0_9z = { celloutsig_0_1z[15:14], celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_6z } >= { celloutsig_0_1z[5:4], celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_0z };
  assign celloutsig_1_19z = celloutsig_1_11z[39:35] >= { celloutsig_1_10z[5:2], celloutsig_1_12z };
  assign celloutsig_0_12z = { celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_6z } >= { celloutsig_0_1z[16:4], celloutsig_0_8z };
  assign celloutsig_0_19z = { in_data[48:47], celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_8z } >= { in_data[22:19], celloutsig_0_2z };
  assign celloutsig_0_21z = { in_data[68:67], celloutsig_0_12z } >= celloutsig_0_4z;
  assign celloutsig_0_23z = celloutsig_0_16z[15:11] >= in_data[33:29];
  assign celloutsig_0_25z = celloutsig_0_14z[4:1] >= celloutsig_0_22z;
  assign celloutsig_0_34z = { celloutsig_0_9z, celloutsig_0_31z, celloutsig_0_5z, celloutsig_0_22z, celloutsig_0_0z, celloutsig_0_23z } % { 1'h1, celloutsig_0_22z, celloutsig_0_0z, celloutsig_0_26z, celloutsig_0_2z, celloutsig_0_31z };
  assign celloutsig_0_40z = { celloutsig_0_31z[1], celloutsig_0_35z, celloutsig_0_36z } % { 1'h1, celloutsig_0_1z[2:1] };
  assign celloutsig_0_50z = { celloutsig_0_44z[10:3], celloutsig_0_35z, celloutsig_0_39z, celloutsig_0_7z, celloutsig_0_6z } % { 1'h1, celloutsig_0_43z[1:0], celloutsig_0_24z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_49z };
  assign celloutsig_0_58z = { celloutsig_0_3z, celloutsig_0_19z, celloutsig_0_40z, celloutsig_0_8z } % { 1'h1, celloutsig_0_34z[9:2] };
  assign celloutsig_1_0z = in_data[140:124] % { 1'h1, in_data[136:121] };
  assign celloutsig_1_6z = in_data[118:104] % { 1'h1, celloutsig_1_4z[14:1] };
  assign celloutsig_1_10z = { celloutsig_1_0z[11:1], celloutsig_1_6z } % { 1'h1, celloutsig_1_6z[13:7], celloutsig_1_1z };
  assign celloutsig_0_20z = { celloutsig_0_10z[3:1], celloutsig_0_19z, celloutsig_0_4z, celloutsig_0_17z, celloutsig_0_19z, celloutsig_0_10z, celloutsig_0_11z } % { 1'h1, celloutsig_0_18z, celloutsig_0_17z, celloutsig_0_0z };
  assign celloutsig_0_22z = { celloutsig_0_4z[1:0], celloutsig_0_11z, celloutsig_0_17z } % { 1'h1, celloutsig_0_20z[12:11], celloutsig_0_9z };
  assign celloutsig_0_27z = { celloutsig_0_24z, celloutsig_0_4z, celloutsig_0_8z } % { 1'h1, celloutsig_0_4z[1:0], celloutsig_0_3z };
  assign celloutsig_0_28z = celloutsig_0_18z[11:9] % { 1'h1, celloutsig_0_10z[3:2] };
  assign celloutsig_0_3z = { in_data[72:70], celloutsig_0_0z } * { celloutsig_0_1z[7:5], celloutsig_0_0z };
  assign celloutsig_0_53z = { celloutsig_0_32z[25:16], celloutsig_0_31z } * { celloutsig_0_29z[16:4], celloutsig_0_23z };
  assign celloutsig_0_67z = { celloutsig_0_62z[10:1], celloutsig_0_5z } * { in_data[14], celloutsig_0_65z, celloutsig_0_23z, celloutsig_0_63z, celloutsig_0_30z };
  assign celloutsig_0_71z = in_data[68:45] * { celloutsig_0_42z[28:10], celloutsig_0_51z, celloutsig_0_24z, celloutsig_0_70z };
  assign celloutsig_1_2z = celloutsig_1_1z[13:2] * celloutsig_1_0z[15:4];
  assign celloutsig_1_8z = { celloutsig_1_5z, celloutsig_1_3z } * celloutsig_1_0z[6:2];
  assign celloutsig_1_11z = { celloutsig_1_8z[1:0], celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z } * { in_data[154:112], celloutsig_1_7z };
  assign celloutsig_0_10z = { celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_7z } * { celloutsig_0_1z[10:9], celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_2z };
  assign celloutsig_0_13z = { celloutsig_0_10z[0], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_12z } * { celloutsig_0_10z, celloutsig_0_2z };
  assign celloutsig_0_29z = { celloutsig_0_18z[7:6], celloutsig_0_12z, celloutsig_0_24z, celloutsig_0_27z, celloutsig_0_6z, celloutsig_0_23z, celloutsig_0_25z, celloutsig_0_13z, celloutsig_0_8z } * { celloutsig_0_20z[11:5], celloutsig_0_14z, celloutsig_0_24z, celloutsig_0_27z };
  assign celloutsig_0_31z = celloutsig_0_30z[3:0] * celloutsig_0_18z[10:7];
  assign celloutsig_0_32z = { celloutsig_0_29z[13:4], celloutsig_0_1z, celloutsig_0_23z, celloutsig_0_28z } * { in_data[89:60], celloutsig_0_19z };
  assign celloutsig_0_42z = { celloutsig_0_16z[1], celloutsig_0_23z, celloutsig_0_29z, celloutsig_0_33z, celloutsig_0_36z, celloutsig_0_10z, celloutsig_0_7z } >>> { celloutsig_0_32z[28:16], celloutsig_0_27z, celloutsig_0_33z, celloutsig_0_37z, celloutsig_0_28z, celloutsig_0_2z, celloutsig_0_30z };
  assign celloutsig_0_4z = { celloutsig_0_3z[2:1], celloutsig_0_2z } >>> { celloutsig_0_3z[1:0], celloutsig_0_0z };
  assign celloutsig_0_43z = { celloutsig_0_10z, celloutsig_0_21z, celloutsig_0_22z, celloutsig_0_26z } >>> { celloutsig_0_20z[10:1], celloutsig_0_33z };
  assign celloutsig_0_49z = { celloutsig_0_12z, celloutsig_0_40z } >>> celloutsig_0_34z[3:0];
  assign celloutsig_0_62z = { in_data[30:21], celloutsig_0_26z } >>> { celloutsig_0_58z[8:3], celloutsig_0_31z, celloutsig_0_38z };
  assign celloutsig_0_72z = { celloutsig_0_44z[17:13], celloutsig_0_5z, celloutsig_0_67z, celloutsig_0_51z, celloutsig_0_55z, celloutsig_0_17z } >>> { celloutsig_0_44z[12:0], celloutsig_0_24z, celloutsig_0_3z };
  assign celloutsig_1_1z = in_data[165:148] >>> in_data[174:157];
  assign celloutsig_1_4z = { celloutsig_1_2z[6:1], celloutsig_1_2z } >>> { celloutsig_1_1z[17:1], celloutsig_1_3z };
  assign celloutsig_1_15z = { celloutsig_1_12z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_7z } >>> { celloutsig_1_0z[2:0], celloutsig_1_13z };
  assign celloutsig_0_1z = in_data[27:11] >>> { in_data[85:70], celloutsig_0_0z };
  assign celloutsig_0_14z = celloutsig_0_1z[13:8] >>> { celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_8z };
  assign celloutsig_0_16z = { in_data[62:50], celloutsig_0_2z, celloutsig_0_3z } >>> { celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_12z };
  assign celloutsig_0_18z = { celloutsig_0_16z[11:3], celloutsig_0_17z, celloutsig_0_7z, celloutsig_0_12z } >>> { in_data[7:2], celloutsig_0_14z };
  assign celloutsig_0_24z = { celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_17z } >>> in_data[47:45];
  always_latch
    if (!clkin_data[32]) celloutsig_0_44z = 21'h000000;
    else if (celloutsig_1_18z) celloutsig_0_44z = { celloutsig_0_34z[10:2], celloutsig_0_43z, celloutsig_0_33z };
  always_latch
    if (clkin_data[64]) celloutsig_1_5z = 4'h0;
    else if (!clkin_data[0]) celloutsig_1_5z = celloutsig_1_4z[7:4];
  always_latch
    if (clkin_data[32]) celloutsig_0_30z = 7'h00;
    else if (!celloutsig_1_18z) celloutsig_0_30z = { celloutsig_0_10z[3:2], celloutsig_0_24z, celloutsig_0_5z, celloutsig_0_25z };
  assign { out_data[128], out_data[96], out_data[55:32], out_data[19:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_71z, celloutsig_0_72z };
endmodule
