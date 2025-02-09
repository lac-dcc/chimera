/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [7:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [4:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [24:0] celloutsig_0_21z;
  wire [4:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [15:0] celloutsig_0_24z;
  wire [8:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [17:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [6:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [2:0] celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire [8:0] celloutsig_0_40z;
  wire [29:0] celloutsig_0_46z;
  wire [9:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [5:0] celloutsig_0_50z;
  wire [17:0] celloutsig_0_51z;
  wire [20:0] celloutsig_0_5z;
  wire [9:0] celloutsig_0_6z;
  wire [2:0] celloutsig_0_78z;
  reg [3:0] celloutsig_0_7z;
  wire [2:0] celloutsig_0_80z;
  wire celloutsig_0_82z;
  wire celloutsig_0_83z;
  wire celloutsig_0_84z;
  wire [9:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  reg [6:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_16z;
  wire [7:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [6:0] celloutsig_1_4z;
  reg [18:0] celloutsig_1_5z;
  wire [14:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [15:0] celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_4z = ~(celloutsig_0_1z & celloutsig_0_1z);
  assign celloutsig_1_0z = ~(in_data[115] & in_data[129]);
  assign celloutsig_1_3z = ~(celloutsig_1_1z & celloutsig_1_1z);
  assign celloutsig_0_12z = ~(celloutsig_0_6z[8] & celloutsig_0_2z[5]);
  assign celloutsig_0_20z = ~(celloutsig_0_19z & celloutsig_0_11z);
  assign celloutsig_0_30z = ~(celloutsig_0_27z & celloutsig_0_6z[8]);
  assign celloutsig_0_31z = ~(celloutsig_0_20z & celloutsig_0_17z);
  assign celloutsig_0_37z = celloutsig_0_13z | celloutsig_0_12z;
  assign celloutsig_0_49z = celloutsig_0_1z | celloutsig_0_48z[2];
  assign celloutsig_0_82z = celloutsig_0_80z[2] | celloutsig_0_46z[2];
  assign celloutsig_0_84z = celloutsig_0_51z[17] | celloutsig_0_19z;
  assign celloutsig_1_10z = celloutsig_1_3z | in_data[120];
  assign celloutsig_1_19z = celloutsig_1_7z | celloutsig_1_16z;
  assign celloutsig_0_11z = celloutsig_0_4z | in_data[42];
  assign celloutsig_0_16z = celloutsig_0_6z[7] | celloutsig_0_11z;
  assign celloutsig_0_17z = celloutsig_0_12z | celloutsig_0_1z;
  assign celloutsig_0_19z = celloutsig_0_0z[3] | celloutsig_0_1z;
  assign celloutsig_0_26z = celloutsig_0_1z | celloutsig_0_14z;
  assign celloutsig_0_27z = in_data[88] | celloutsig_0_1z;
  assign celloutsig_0_29z = celloutsig_0_5z[14] | celloutsig_0_9z;
  assign celloutsig_0_40z = { celloutsig_0_24z[0], celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_22z, celloutsig_0_13z } + celloutsig_0_28z[11:3];
  assign celloutsig_1_6z = celloutsig_1_5z[15:1] + { in_data[182:170], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_8z = { celloutsig_1_2z, celloutsig_1_6z } + { celloutsig_1_5z[17:3], celloutsig_1_0z };
  assign celloutsig_0_46z = { celloutsig_0_11z, celloutsig_0_21z, celloutsig_0_38z, celloutsig_0_29z } & { in_data[58:30], celloutsig_0_19z };
  assign celloutsig_0_48z = { celloutsig_0_8z[9:1], celloutsig_0_19z } & { celloutsig_0_5z[11:10], celloutsig_0_2z, celloutsig_0_23z };
  assign celloutsig_0_50z = { celloutsig_0_28z[16:14], celloutsig_0_27z, celloutsig_0_33z, celloutsig_0_49z } & { celloutsig_0_24z[14:11], celloutsig_0_4z, celloutsig_0_9z };
  assign celloutsig_0_5z = in_data[33:13] & { in_data[40:22], celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_0_6z = in_data[9:0] & { in_data[22:15], celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_0_25z = { celloutsig_0_6z[9:3], celloutsig_0_20z, celloutsig_0_23z } & celloutsig_0_6z[8:0];
  assign celloutsig_0_0z = in_data[26:19] / { 1'h1, in_data[52:46] };
  assign celloutsig_0_80z = { celloutsig_0_30z, celloutsig_0_36z, celloutsig_0_37z } / { 1'h1, celloutsig_0_78z[1:0] };
  assign celloutsig_0_8z = { celloutsig_0_0z[6:5], celloutsig_0_2z, celloutsig_0_3z } / { 1'h1, celloutsig_0_6z[6:2], celloutsig_0_7z };
  assign celloutsig_1_18z = { celloutsig_1_1z, celloutsig_1_4z } / { 1'h1, celloutsig_1_13z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_13z };
  assign celloutsig_0_18z = celloutsig_0_5z[11:7] / { 1'h1, celloutsig_0_0z[6:4], celloutsig_0_16z };
  assign celloutsig_0_2z = celloutsig_0_0z[6:0] / { 1'h1, in_data[86:81] };
  assign celloutsig_0_24z = { celloutsig_0_8z[9:5], celloutsig_0_1z, celloutsig_0_18z, celloutsig_0_22z } / { 1'h1, celloutsig_0_5z[12:1], celloutsig_0_14z, celloutsig_0_19z, celloutsig_0_15z };
  assign celloutsig_0_3z = { in_data[37:30], celloutsig_0_1z, celloutsig_0_1z } == { in_data[50:49], celloutsig_0_0z };
  assign celloutsig_0_10z = celloutsig_0_0z[6:4] == celloutsig_0_2z[2:0];
  assign celloutsig_0_15z = { celloutsig_0_7z[1:0], celloutsig_0_10z } == { celloutsig_0_2z[1:0], celloutsig_0_12z };
  assign celloutsig_0_1z = { in_data[43:15], celloutsig_0_0z, celloutsig_0_0z } > in_data[68:24];
  assign celloutsig_0_33z = in_data[84:80] && { celloutsig_0_21z[6:4], celloutsig_0_17z, celloutsig_0_31z };
  assign celloutsig_0_34z = { in_data[87:67], celloutsig_0_9z, celloutsig_0_6z } && { celloutsig_0_25z[7:3], celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_30z, celloutsig_0_10z, celloutsig_0_18z };
  assign celloutsig_1_2z = in_data[117:115] && { in_data[137], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_9z = { in_data[4:3], celloutsig_0_0z, celloutsig_0_6z } && in_data[26:7];
  assign celloutsig_1_13z = { celloutsig_1_7z, celloutsig_1_10z, celloutsig_1_11z } && { celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_2z };
  assign celloutsig_0_14z = { celloutsig_0_7z[2:1], celloutsig_0_11z } && { in_data[20], celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_38z = { celloutsig_0_0z[4:3], celloutsig_0_30z } * { celloutsig_0_4z, celloutsig_0_27z, celloutsig_0_12z };
  assign celloutsig_0_51z = { celloutsig_0_40z[0], celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_40z } * { celloutsig_0_50z, celloutsig_0_15z, celloutsig_0_26z, celloutsig_0_48z };
  assign celloutsig_0_78z = { celloutsig_0_21z[1:0], celloutsig_0_30z } * { celloutsig_0_46z[8], celloutsig_0_29z, celloutsig_0_17z };
  assign celloutsig_1_4z = { in_data[164:161], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_1z } * in_data[128:122];
  assign celloutsig_0_21z = { in_data[26:8], celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_19z, celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_19z } * { in_data[69:47], celloutsig_0_17z, celloutsig_0_3z };
  assign celloutsig_0_22z = celloutsig_0_6z[5:1] * { celloutsig_0_2z[3:0], celloutsig_0_11z };
  assign celloutsig_0_28z = { in_data[19:16], celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_9z } * { celloutsig_0_5z[18:2], celloutsig_0_23z };
  assign celloutsig_0_36z = & { celloutsig_0_33z, celloutsig_0_12z, celloutsig_0_5z[20:12], celloutsig_0_4z };
  assign celloutsig_0_83z = & { celloutsig_0_82z, celloutsig_0_78z, celloutsig_0_34z, celloutsig_0_13z, celloutsig_0_6z };
  assign celloutsig_1_1z = & in_data[174:169];
  assign celloutsig_1_7z = & { celloutsig_1_4z[4:0], celloutsig_1_2z };
  assign celloutsig_0_23z = & { celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_10z, in_data[85:75] };
  always_latch
    if (!clkin_data[32]) celloutsig_0_7z = 4'h0;
    else if (celloutsig_1_19z) celloutsig_0_7z = { celloutsig_0_2z[6:5], celloutsig_0_3z, celloutsig_0_4z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_5z = 19'h00000;
    else if (!clkin_data[0]) celloutsig_1_5z = { in_data[140:131], celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_2z };
  always_latch
    if (clkin_data[64]) celloutsig_1_12z = 7'h00;
    else if (clkin_data[0]) celloutsig_1_12z = { celloutsig_1_8z[10:5], celloutsig_1_0z };
  assign celloutsig_1_11z = ~((celloutsig_1_3z & in_data[107]) | (celloutsig_1_8z[1] & celloutsig_1_7z));
  assign celloutsig_1_16z = ~((celloutsig_1_10z & in_data[106]) | (celloutsig_1_12z[3] & celloutsig_1_1z));
  assign celloutsig_0_13z = ~((in_data[14] & celloutsig_0_3z) | (celloutsig_0_9z & celloutsig_0_6z[0]));
  assign { out_data[135:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_83z, celloutsig_0_84z };
endmodule
