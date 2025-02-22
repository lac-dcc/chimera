/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [14:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire [9:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [3:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [4:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  reg [19:0] celloutsig_0_1z;
  wire [16:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [12:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [5:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [11:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [22:0] celloutsig_0_30z;
  wire celloutsig_0_33z;
  wire [5:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [12:0] celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire [2:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [2:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [8:0] celloutsig_0_8z;
  wire [9:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  reg [3:0] celloutsig_1_10z;
  wire [4:0] celloutsig_1_11z;
  reg [6:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire [6:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [10:0] celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_4z = ~(celloutsig_0_0z[14] | celloutsig_0_1z[11]);
  assign celloutsig_1_2z = ~(celloutsig_1_1z[1] | celloutsig_1_1z[6]);
  assign celloutsig_1_4z = ~(celloutsig_1_1z[1] | celloutsig_1_1z[1]);
  assign celloutsig_1_17z = ~(celloutsig_1_16z[5] | celloutsig_1_5z);
  assign celloutsig_0_21z = ~(in_data[34] | celloutsig_0_15z);
  assign celloutsig_0_27z = ~(celloutsig_0_24z[5] | celloutsig_0_24z[3]);
  assign celloutsig_0_30z = { in_data[87:86], celloutsig_0_12z, celloutsig_0_20z } & { celloutsig_0_22z[9:0], celloutsig_0_22z };
  assign celloutsig_0_43z = { celloutsig_0_20z[13:3], celloutsig_0_33z } <= { celloutsig_0_29z[9:4], celloutsig_0_21z, celloutsig_0_23z, celloutsig_0_12z };
  assign celloutsig_0_7z = celloutsig_0_1z[10:4] <= { in_data[52:48], celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_17z = celloutsig_0_0z[5:3] <= celloutsig_0_1z[7:5];
  assign celloutsig_0_2z = { celloutsig_0_1z[18:8], celloutsig_0_0z } <= in_data[72:47];
  assign celloutsig_0_33z = { celloutsig_0_1z[11:4], celloutsig_0_24z } <= in_data[88:75];
  assign celloutsig_0_3z = celloutsig_0_2z & ~(celloutsig_0_0z[4]);
  assign celloutsig_0_47z = celloutsig_0_41z[1] & ~(celloutsig_0_8z[4]);
  assign celloutsig_1_3z = celloutsig_1_1z[5] & ~(in_data[187]);
  assign celloutsig_1_18z = celloutsig_1_3z & ~(celloutsig_1_3z);
  assign celloutsig_0_11z = celloutsig_0_2z & ~(celloutsig_0_5z);
  assign celloutsig_1_6z = | { celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_5z = | { in_data[44:41], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_2z };
  assign celloutsig_0_10z = | { celloutsig_0_8z[8:1], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_25z = | { celloutsig_0_18z[4:2], celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_10z };
  assign celloutsig_0_28z = | { celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_21z };
  assign celloutsig_1_0z = in_data[182] & in_data[98];
  assign celloutsig_1_5z = celloutsig_1_1z[0] & celloutsig_1_1z[2];
  assign celloutsig_0_15z = celloutsig_0_5z & celloutsig_0_8z[0];
  assign celloutsig_0_19z = celloutsig_0_17z & celloutsig_0_18z[1];
  assign celloutsig_0_23z = celloutsig_0_15z & celloutsig_0_2z;
  assign celloutsig_0_46z = celloutsig_0_30z[18:16] >> { celloutsig_0_14z[0], celloutsig_0_3z, celloutsig_0_43z };
  assign celloutsig_1_1z = in_data[182:176] >> { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_7z = { celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_4z } >> { in_data[179:176], celloutsig_1_1z };
  assign celloutsig_1_19z = { celloutsig_1_11z[1:0], celloutsig_1_17z } >> celloutsig_1_8z[3:1];
  assign celloutsig_0_13z = { celloutsig_0_0z[8:2], celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_4z } >> { celloutsig_0_8z[2:1], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_4z };
  assign celloutsig_0_14z = celloutsig_0_13z[7:5] >> celloutsig_0_13z[3:1];
  assign celloutsig_0_16z = { celloutsig_0_8z[3], celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_5z } >> celloutsig_0_0z[5:2];
  assign celloutsig_0_29z = { celloutsig_0_12z[3:2], celloutsig_0_21z, celloutsig_0_19z, celloutsig_0_15z, celloutsig_0_28z, celloutsig_0_25z, celloutsig_0_25z, celloutsig_0_14z, celloutsig_0_28z } >> { celloutsig_0_13z[9:2], celloutsig_0_25z, celloutsig_0_28z, celloutsig_0_11z, celloutsig_0_19z };
  assign celloutsig_0_8z = { celloutsig_0_0z[8:1], celloutsig_0_7z } - celloutsig_0_0z[8:0];
  assign celloutsig_0_12z = { celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_3z } - { celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_0_18z = { celloutsig_0_8z[5:2], celloutsig_0_17z } - { celloutsig_0_16z[0], celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_11z };
  assign celloutsig_0_22z = { celloutsig_0_9z[5:2], celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_21z, celloutsig_0_17z } - { celloutsig_0_16z, celloutsig_0_19z, celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_12z };
  assign celloutsig_0_24z = { celloutsig_0_12z, celloutsig_0_23z, celloutsig_0_2z } - { celloutsig_0_20z[16:15], celloutsig_0_4z, celloutsig_0_14z };
  assign celloutsig_0_0z = in_data[22:8] ^ in_data[34:20];
  assign celloutsig_0_39z = { celloutsig_0_20z[9:5], celloutsig_0_23z } ^ { celloutsig_0_33z, celloutsig_0_7z, celloutsig_0_16z };
  assign celloutsig_0_41z = { celloutsig_0_0z[11:0], celloutsig_0_23z } ^ { celloutsig_0_8z[6:1], celloutsig_0_27z, celloutsig_0_39z };
  assign celloutsig_1_8z = celloutsig_1_1z[3:0] ^ { celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_3z };
  assign celloutsig_1_11z = { celloutsig_1_7z[8:5], celloutsig_1_4z } ^ { celloutsig_1_4z, celloutsig_1_10z };
  assign celloutsig_0_6z = celloutsig_0_0z[8:6] ^ celloutsig_0_1z[18:16];
  assign celloutsig_0_9z = { in_data[30:26], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_6z } ^ { celloutsig_0_6z[1], celloutsig_0_8z };
  assign celloutsig_0_20z = { celloutsig_0_9z[4:1], celloutsig_0_13z, celloutsig_0_14z } ^ { celloutsig_0_1z[18:17], celloutsig_0_0z };
  always_latch
    if (!clkin_data[96]) celloutsig_1_10z = 4'h0;
    else if (clkin_data[0]) celloutsig_1_10z = { celloutsig_1_1z[0], celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_3z };
  always_latch
    if (clkin_data[96]) celloutsig_1_16z = 7'h00;
    else if (!clkin_data[0]) celloutsig_1_16z = { celloutsig_1_7z[4:0], celloutsig_1_4z, celloutsig_1_5z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_1z = 20'h00000;
    else if (celloutsig_1_18z) celloutsig_0_1z = in_data[93:74];
  assign { out_data[128], out_data[98:96], out_data[34:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_46z, celloutsig_0_47z };
endmodule
