/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [9:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [7:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [6:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  reg [8:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [20:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [32:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  reg [3:0] celloutsig_0_29z;
  wire [7:0] celloutsig_0_2z;
  wire [9:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [20:0] celloutsig_0_3z;
  wire [28:0] celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire [8:0] celloutsig_0_44z;
  wire [2:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire [2:0] celloutsig_0_4z;
  wire celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire [18:0] celloutsig_0_62z;
  wire celloutsig_0_6z;
  wire celloutsig_0_71z;
  wire celloutsig_0_72z;
  wire celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  reg [10:0] celloutsig_1_11z;
  wire [3:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [9:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [5:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_33z = ~(celloutsig_0_14z & in_data[53]);
  assign celloutsig_0_58z = ~(celloutsig_0_44z[0] & celloutsig_0_10z[1]);
  assign celloutsig_0_6z = ~(celloutsig_0_4z[0] & celloutsig_0_4z[0]);
  assign celloutsig_1_9z = ~(celloutsig_1_0z & celloutsig_1_1z);
  assign celloutsig_0_1z = ~(celloutsig_0_0z & in_data[25]);
  assign celloutsig_0_16z = ~(celloutsig_0_13z & celloutsig_0_3z[2]);
  assign celloutsig_0_24z = ~(celloutsig_0_18z & celloutsig_0_3z[1]);
  assign celloutsig_0_0z = ~(in_data[31] | in_data[70]);
  assign celloutsig_0_37z = ~(celloutsig_0_26z | celloutsig_0_17z);
  assign celloutsig_1_4z = ~(celloutsig_1_1z | celloutsig_1_3z[5]);
  assign celloutsig_1_7z = ~(celloutsig_1_2z[8] | celloutsig_1_5z);
  assign celloutsig_1_13z = ~(celloutsig_1_2z[6] | celloutsig_1_1z);
  assign celloutsig_0_18z = ~(in_data[19] | celloutsig_0_14z);
  assign celloutsig_0_38z = ~((celloutsig_0_21z | celloutsig_0_32z) & (celloutsig_0_25z[15] | celloutsig_0_34z));
  assign celloutsig_0_49z = celloutsig_0_4z[0] | celloutsig_0_47z;
  assign celloutsig_0_71z = celloutsig_0_21z | celloutsig_0_14z;
  assign celloutsig_1_6z = in_data[107] | celloutsig_1_3z[1];
  assign celloutsig_0_14z = celloutsig_0_12z[0] | celloutsig_0_12z[1];
  assign celloutsig_1_0z = ~(in_data[111] ^ in_data[116]);
  assign celloutsig_1_12z = { celloutsig_1_11z[1], celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_7z } + { celloutsig_1_11z[2:0], celloutsig_1_1z };
  assign celloutsig_1_14z = { in_data[135:128], celloutsig_1_6z, celloutsig_1_5z } + { celloutsig_1_11z[9:3], celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_12z = { celloutsig_0_10z[7:3], celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_1z } + { celloutsig_0_3z[17:15], celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_1z };
  assign celloutsig_0_3z = { in_data[53:42], celloutsig_0_1z, celloutsig_0_2z } & { in_data[23:12], celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_40z = { celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_24z, celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_29z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_7z } & { in_data[48:47], celloutsig_0_19z, celloutsig_0_24z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_37z, celloutsig_0_11z, celloutsig_0_29z, celloutsig_0_27z, celloutsig_0_9z, celloutsig_0_31z, celloutsig_0_17z, celloutsig_0_31z, celloutsig_0_18z, celloutsig_0_6z };
  assign celloutsig_0_15z = { celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_0z } & celloutsig_0_2z[6:0];
  assign celloutsig_0_30z = celloutsig_0_3z[18:9] & in_data[76:67];
  assign celloutsig_1_5z = in_data[176:164] === { celloutsig_1_2z[8:6], celloutsig_1_3z };
  assign celloutsig_0_48z = { celloutsig_0_24z, celloutsig_0_23z, celloutsig_0_42z, celloutsig_0_22z, celloutsig_0_14z, celloutsig_0_42z } >= { celloutsig_0_2z[6:4], celloutsig_0_7z, celloutsig_0_32z, celloutsig_0_43z };
  assign celloutsig_0_31z = { celloutsig_0_3z[6:2], celloutsig_0_8z } >= { celloutsig_0_2z[6:3], celloutsig_0_8z, celloutsig_0_0z };
  assign celloutsig_0_72z = { celloutsig_0_62z[10:1], celloutsig_0_37z, celloutsig_0_58z, celloutsig_0_9z, celloutsig_0_23z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_58z, celloutsig_0_7z } > { in_data[56:54], celloutsig_0_61z, celloutsig_0_48z, celloutsig_0_34z, celloutsig_0_62z, celloutsig_0_57z, celloutsig_0_13z, celloutsig_0_46z };
  assign celloutsig_0_5z = { celloutsig_0_1z, celloutsig_0_4z } && { celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_1_1z = in_data[135:131] && { in_data[102:99], celloutsig_1_0z };
  assign celloutsig_0_9z = { celloutsig_0_3z[14:5], celloutsig_0_7z } && { in_data[53:52], celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_13z = { celloutsig_0_3z[19:15], celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_5z } && { celloutsig_0_3z[15:6], celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_7z };
  assign celloutsig_0_21z = { celloutsig_0_3z[10:0], celloutsig_0_12z, celloutsig_0_5z } || { celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_19z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_0z };
  assign celloutsig_0_23z = { celloutsig_0_3z[10:4], celloutsig_0_13z, celloutsig_0_22z } || { celloutsig_0_17z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_4z };
  assign celloutsig_0_47z = { celloutsig_0_25z[5:3], celloutsig_0_27z } < celloutsig_0_10z[4:1];
  assign celloutsig_0_32z = { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_26z, celloutsig_0_31z } < celloutsig_0_30z[4:0];
  assign celloutsig_0_42z = celloutsig_0_2z[1] & ~(celloutsig_0_6z);
  assign celloutsig_0_57z = celloutsig_0_49z & ~(celloutsig_0_40z[21]);
  assign celloutsig_0_7z = in_data[57] & ~(in_data[10]);
  assign celloutsig_1_18z = celloutsig_1_7z & ~(celloutsig_1_14z[8]);
  assign celloutsig_0_11z = celloutsig_0_2z[3] & ~(celloutsig_0_5z);
  assign celloutsig_0_26z = celloutsig_0_20z[0] & ~(celloutsig_0_18z);
  assign celloutsig_0_27z = celloutsig_0_4z[0] & ~(celloutsig_0_23z);
  assign celloutsig_0_44z = celloutsig_0_20z[16:8] % { 1'h1, celloutsig_0_10z[8:1] };
  assign celloutsig_0_20z = { celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_12z } % { 1'h1, celloutsig_0_6z, celloutsig_0_19z, celloutsig_0_19z, celloutsig_0_13z };
  assign celloutsig_0_46z = { celloutsig_0_10z[6:5], celloutsig_0_38z } % { 1'h1, celloutsig_0_21z, celloutsig_0_16z };
  assign celloutsig_0_8z = celloutsig_0_4z % { 1'h1, celloutsig_0_4z[0], celloutsig_0_1z };
  assign celloutsig_0_2z = in_data[92:85] % { 1'h1, in_data[78:76], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_2z = { in_data[171:165], celloutsig_1_0z, celloutsig_1_1z } * in_data[182:174];
  assign celloutsig_1_19z = celloutsig_1_3z[9:4] * { celloutsig_1_12z, celloutsig_1_13z, celloutsig_1_15z };
  assign celloutsig_0_10z = { celloutsig_0_3z[12:4], celloutsig_0_6z } * { celloutsig_0_3z[17:10], celloutsig_0_9z, celloutsig_0_9z };
  assign celloutsig_0_25z = { in_data[31:21], celloutsig_0_19z, celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_22z, celloutsig_0_7z } * { celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_22z, celloutsig_0_5z, celloutsig_0_20z, celloutsig_0_4z };
  assign celloutsig_0_62z = { celloutsig_0_19z, celloutsig_0_22z, celloutsig_0_48z, celloutsig_0_12z } | { celloutsig_0_10z[7:0], celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_19z };
  assign celloutsig_1_3z = { in_data[173], celloutsig_1_2z } | { celloutsig_1_2z[6:0], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_15z = & celloutsig_1_11z[8:6];
  assign celloutsig_0_22z = & { celloutsig_0_15z, celloutsig_0_11z };
  assign celloutsig_0_43z = | { celloutsig_0_23z, celloutsig_0_24z, celloutsig_0_33z };
  assign celloutsig_0_61z = | { celloutsig_0_20z[13:2], celloutsig_0_0z };
  assign celloutsig_0_34z = | celloutsig_0_20z[16:10];
  assign celloutsig_0_17z = | { celloutsig_0_11z, celloutsig_0_2z[5:3] };
  assign celloutsig_0_4z = { in_data[85], celloutsig_0_0z, celloutsig_0_1z } >> celloutsig_0_3z[15:13];
  always_latch
    if (!clkin_data[96]) celloutsig_1_11z = 11'h000;
    else if (clkin_data[0]) celloutsig_1_11z = { in_data[154:146], celloutsig_1_7z, celloutsig_1_1z };
  always_latch
    if (clkin_data[32]) celloutsig_0_19z = 9'h000;
    else if (!celloutsig_1_18z) celloutsig_0_19z = { celloutsig_0_15z, celloutsig_0_13z, celloutsig_0_11z };
  always_latch
    if (clkin_data[32]) celloutsig_0_29z = 4'h0;
    else if (celloutsig_1_18z) celloutsig_0_29z = celloutsig_0_12z[5:2];
  assign { out_data[128], out_data[101:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_71z, celloutsig_0_72z };
endmodule
