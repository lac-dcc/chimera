/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [31:0] celloutsig_0_10z;
  wire [8:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [6:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [2:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  reg [2:0] celloutsig_0_18z;
  wire [5:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [2:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [8:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire [28:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [4:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  reg [7:0] celloutsig_0_32z;
  wire [5:0] celloutsig_0_34z;
  wire celloutsig_0_37z;
  wire celloutsig_0_3z;
  wire celloutsig_0_42z;
  reg [4:0] celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_4z;
  reg [11:0] celloutsig_0_50z;
  reg [6:0] celloutsig_0_52z;
  wire celloutsig_0_55z;
  wire [13:0] celloutsig_0_56z;
  wire celloutsig_0_57z;
  wire [10:0] celloutsig_0_5z;
  wire [27:0] celloutsig_0_6z;
  wire [3:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [3:0] celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [9:0] celloutsig_1_19z;
  wire [7:0] celloutsig_1_1z;
  wire [9:0] celloutsig_1_2z;
  wire [22:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [11:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [17:0] celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_30z = celloutsig_0_15z[1] ? celloutsig_0_15z[0] : celloutsig_0_2z;
  assign celloutsig_1_18z = celloutsig_1_15z ^ celloutsig_1_7z;
  assign celloutsig_0_1z = celloutsig_0_0z ^ in_data[38];
  assign celloutsig_0_16z = celloutsig_0_8z ^ celloutsig_0_2z;
  assign celloutsig_0_23z = celloutsig_0_3z ^ celloutsig_0_9z;
  assign celloutsig_1_13z = in_data[169:166] & celloutsig_1_2z[4:1];
  assign celloutsig_0_2z = { in_data[16:7], celloutsig_0_0z } === { in_data[85:79], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_11z = { celloutsig_1_2z[8:4], celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_4z } > { celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_15z = celloutsig_1_8z[16:8] > { celloutsig_1_8z[6:2], celloutsig_1_9z, celloutsig_1_12z };
  assign celloutsig_0_9z = { in_data[22:11], celloutsig_0_2z, celloutsig_0_8z } > celloutsig_0_6z[21:8];
  assign celloutsig_0_28z = celloutsig_0_11z[6:4] > celloutsig_0_15z;
  assign celloutsig_0_0z = in_data[67:58] <= in_data[12:3];
  assign celloutsig_0_37z = { celloutsig_0_34z[4:2], celloutsig_0_15z, celloutsig_0_34z, celloutsig_0_14z, celloutsig_0_23z } <= { celloutsig_0_27z[15:3], celloutsig_0_4z };
  assign celloutsig_1_6z = { celloutsig_1_3z[3:0], celloutsig_1_4z } <= celloutsig_1_3z[11:7];
  assign celloutsig_1_7z = { celloutsig_1_5z[10:3], celloutsig_1_4z } <= celloutsig_1_3z[22:14];
  assign celloutsig_1_10z = { celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_1z } <= { celloutsig_1_5z[10:3], celloutsig_1_7z, celloutsig_1_6z };
  assign celloutsig_1_12z = { celloutsig_1_2z[9], celloutsig_1_9z, celloutsig_1_11z } <= { celloutsig_1_2z[7], celloutsig_1_9z, celloutsig_1_10z };
  assign celloutsig_0_55z = ! celloutsig_0_10z[28:7];
  assign celloutsig_0_8z = ! { celloutsig_0_5z[7:6], celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_57z = celloutsig_0_37z & ~(celloutsig_0_20z[1]);
  assign celloutsig_1_4z = celloutsig_1_3z[3] & ~(celloutsig_1_3z[10]);
  assign celloutsig_0_3z = celloutsig_0_1z & celloutsig_0_2z;
  assign celloutsig_0_42z = celloutsig_0_10z[15] & celloutsig_0_18z[0];
  assign celloutsig_0_45z = celloutsig_0_42z & celloutsig_0_16z;
  assign celloutsig_0_14z = celloutsig_0_0z & celloutsig_0_4z;
  assign celloutsig_0_21z = celloutsig_0_19z[3] & celloutsig_0_20z[0];
  assign celloutsig_0_25z = in_data[81] & celloutsig_0_21z;
  assign celloutsig_0_6z = { in_data[11:4], celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_1z } >> { in_data[83:61], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_1_19z = { in_data[135:132], celloutsig_1_0z, celloutsig_1_6z } >> { celloutsig_1_1z[4], celloutsig_1_0z, celloutsig_1_13z };
  assign celloutsig_0_11z = { celloutsig_0_10z[13:8], celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_8z } >> { celloutsig_0_10z[25:18], celloutsig_0_2z };
  assign celloutsig_0_13z = { celloutsig_0_6z[13:12], celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_4z } >> celloutsig_0_11z[8:2];
  assign celloutsig_0_34z = { celloutsig_0_7z[1:0], celloutsig_0_20z, celloutsig_0_30z } >> celloutsig_0_32z[7:2];
  assign celloutsig_1_0z = in_data[156:152] >> in_data[132:128];
  assign celloutsig_1_2z = { in_data[165:164], celloutsig_1_1z } >> in_data[116:107];
  assign celloutsig_1_3z = { in_data[152:140], celloutsig_1_2z } >> { in_data[190:181], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_7z = { celloutsig_0_6z[14:12], celloutsig_0_0z } >> { in_data[18:16], celloutsig_0_2z };
  assign celloutsig_0_10z = { celloutsig_0_6z[11], celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_1z } >> { in_data[92:63], celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_0_5z = { in_data[48:39], celloutsig_0_0z } <<< { in_data[28:21], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_1_8z = { in_data[153:137], celloutsig_1_6z } <<< in_data[170:153];
  assign celloutsig_0_19z = { in_data[42], celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_1z, celloutsig_0_16z } <<< { celloutsig_0_10z[31:29], celloutsig_0_16z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_22z = { in_data[47:43], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_21z, celloutsig_0_2z } <<< { in_data[5:2], celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_20z };
  assign celloutsig_0_29z = { celloutsig_0_22z[7:6], celloutsig_0_15z } <<< { celloutsig_0_18z[1:0], celloutsig_0_16z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_56z = { celloutsig_0_50z[5:4], celloutsig_0_55z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_45z, celloutsig_0_13z } - { celloutsig_0_44z[1], celloutsig_0_46z, celloutsig_0_7z, celloutsig_0_25z, celloutsig_0_52z };
  assign celloutsig_1_5z = { celloutsig_1_2z[9:8], celloutsig_1_2z } - celloutsig_1_3z[11:0];
  assign celloutsig_0_15z = celloutsig_0_7z[3:1] - { in_data[94:93], celloutsig_0_4z };
  assign celloutsig_0_20z = celloutsig_0_5z[9:7] - { celloutsig_0_15z[1:0], celloutsig_0_9z };
  assign celloutsig_1_1z = { in_data[175:173], celloutsig_1_0z } ^ in_data[105:98];
  assign celloutsig_1_9z = celloutsig_1_5z[9:7] ^ celloutsig_1_3z[10:8];
  assign celloutsig_0_27z = { celloutsig_0_10z[31:28], celloutsig_0_3z, celloutsig_0_23z, celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_14z, celloutsig_0_18z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_0z } ^ in_data[42:14];
  assign celloutsig_0_4z = ~((in_data[85] & celloutsig_0_2z) | celloutsig_0_2z);
  assign celloutsig_0_46z = ~((celloutsig_0_5z[3] & celloutsig_0_4z) | celloutsig_0_7z[1]);
  assign celloutsig_0_12z = ~((celloutsig_0_10z[18] & celloutsig_0_0z) | celloutsig_0_3z);
  always_latch
    if (clkin_data[32]) celloutsig_0_32z = 8'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_32z = { celloutsig_0_20z, celloutsig_0_7z, celloutsig_0_14z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_44z = 5'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_44z = { celloutsig_0_15z, celloutsig_0_30z, celloutsig_0_4z };
  always_latch
    if (clkin_data[0]) celloutsig_0_50z = 12'h000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_50z = { celloutsig_0_18z, celloutsig_0_28z, celloutsig_0_18z, celloutsig_0_44z };
  always_latch
    if (clkin_data[32]) celloutsig_0_52z = 7'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_52z = { celloutsig_0_50z[8], celloutsig_0_29z, celloutsig_0_1z };
  always_latch
    if (clkin_data[0]) celloutsig_0_18z = 3'h0;
    else if (celloutsig_1_19z[0]) celloutsig_0_18z = celloutsig_0_11z[5:3];
  assign { out_data[128], out_data[105:96], out_data[45:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_56z, celloutsig_0_57z };
endmodule
