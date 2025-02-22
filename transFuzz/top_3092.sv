/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [4:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [10:0] celloutsig_0_12z;
  wire [13:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [2:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [15:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [9:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire [9:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [8:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [9:0] celloutsig_0_32z;
  wire [2:0] celloutsig_0_36z;
  wire [8:0] celloutsig_0_37z;
  wire celloutsig_0_3z;
  wire [4:0] celloutsig_0_4z;
  reg [7:0] celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire [2:0] celloutsig_0_5z;
  wire [8:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [9:0] celloutsig_0_8z;
  wire [12:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [3:0] celloutsig_1_11z;
  wire [5:0] celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire [18:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [13:0] celloutsig_1_1z;
  wire [11:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [14:0] celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire [27:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_53z = !(celloutsig_0_52z[5] ? celloutsig_0_27z[9] : celloutsig_0_19z);
  assign celloutsig_1_19z = !(celloutsig_1_11z[3] ? celloutsig_1_17z : celloutsig_1_16z[13]);
  assign celloutsig_1_3z = in_data[120] ^ celloutsig_1_1z[10];
  assign celloutsig_1_2z = { in_data[135:125], celloutsig_1_0z } & celloutsig_1_1z[13:2];
  assign celloutsig_0_2z = { in_data[13:10], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z } & { in_data[50:44], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_13z = celloutsig_1_6z[23:18] / { 1'h1, celloutsig_1_5z[5:1] };
  assign celloutsig_0_17z = { celloutsig_0_13z[7], celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_5z } > { in_data[3], celloutsig_0_7z, celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_1z };
  assign celloutsig_0_30z = celloutsig_0_9z[8:5] > { celloutsig_0_9z[12:10], celloutsig_0_0z };
  assign celloutsig_0_0z = ! in_data[46:42];
  assign celloutsig_1_8z = ! celloutsig_1_2z[3:0];
  assign celloutsig_1_10z = ! celloutsig_1_2z[11:3];
  assign celloutsig_1_7z = { in_data[150:149], celloutsig_1_3z } || { in_data[189], celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_1_15z = { celloutsig_1_11z[2], celloutsig_1_7z, celloutsig_1_7z } || { celloutsig_1_6z[4:3], celloutsig_1_0z };
  assign celloutsig_1_5z = celloutsig_1_1z[11:3] % { 1'h1, celloutsig_1_1z[7:1], celloutsig_1_0z };
  assign celloutsig_0_16z = { celloutsig_0_5z[1:0], celloutsig_0_7z } % { 1'h1, celloutsig_0_10z[3:2] };
  assign celloutsig_0_37z = celloutsig_0_32z[8:0] % { 1'h1, celloutsig_0_27z[8:1] };
  assign celloutsig_1_11z = { celloutsig_1_1z[8:6], celloutsig_1_3z } % { 1'h1, celloutsig_1_5z[3:1] };
  assign celloutsig_0_32z = { celloutsig_0_8z[9], celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_16z } * { celloutsig_0_23z[6:2], celloutsig_0_24z, celloutsig_0_22z, celloutsig_0_19z, celloutsig_0_26z, celloutsig_0_30z };
  assign celloutsig_1_4z = { celloutsig_1_0z, celloutsig_1_1z } * { celloutsig_1_2z[7:6], celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_0_23z = { celloutsig_0_2z[7:6], celloutsig_0_20z, celloutsig_0_20z } * { celloutsig_0_13z[8], celloutsig_0_2z };
  assign celloutsig_0_10z = celloutsig_0_0z ? { celloutsig_0_5z[1:0], celloutsig_0_5z } : celloutsig_0_6z[4:0];
  assign celloutsig_0_12z = celloutsig_0_5z[0] ? in_data[87:77] : { celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_3z };
  assign celloutsig_0_18z = in_data[90] ? { celloutsig_0_2z[7:1], celloutsig_0_11z, celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_5z } : { celloutsig_0_9z[10:0], celloutsig_0_4z };
  assign celloutsig_0_27z = celloutsig_0_17z ? { celloutsig_0_9z[7:0], celloutsig_0_26z, celloutsig_0_0z } : { celloutsig_0_2z[7:0], celloutsig_0_3z, celloutsig_0_21z };
  assign celloutsig_0_4z = ~ in_data[95:91];
  assign celloutsig_0_20z = ~ { celloutsig_0_6z[2], celloutsig_0_14z, celloutsig_0_1z, celloutsig_0_17z };
  assign celloutsig_0_22z = & { celloutsig_0_16z[1], celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_54z = | { celloutsig_0_37z, celloutsig_0_36z, celloutsig_0_28z, celloutsig_0_22z, celloutsig_0_18z[7:3], celloutsig_0_11z, celloutsig_0_10z[4], celloutsig_0_4z };
  assign celloutsig_0_21z = | celloutsig_0_2z[7:0];
  assign celloutsig_0_24z = | { celloutsig_0_22z, celloutsig_0_11z, celloutsig_0_10z[4] };
  assign celloutsig_0_3z = | celloutsig_0_2z[8:4];
  assign celloutsig_0_1z = ~^ in_data[94:91];
  assign celloutsig_0_28z = ~^ { celloutsig_0_27z[1], celloutsig_0_26z, celloutsig_0_4z, celloutsig_0_22z };
  assign celloutsig_1_9z = ^ { celloutsig_1_4z[8:2], celloutsig_1_7z, celloutsig_1_7z };
  assign celloutsig_1_18z = ^ { in_data[180:166], celloutsig_1_8z };
  assign celloutsig_0_6z = { celloutsig_0_2z[2:1], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z } >> in_data[15:7];
  assign celloutsig_1_6z = { celloutsig_1_1z, celloutsig_1_1z } >> { celloutsig_1_4z[8:7], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_5z };
  assign celloutsig_1_16z = { in_data[165:148], celloutsig_1_9z } >> { in_data[117:100], celloutsig_1_0z };
  assign celloutsig_0_9z = in_data[14:2] >> { in_data[42:40], celloutsig_0_8z };
  assign celloutsig_0_36z = celloutsig_0_12z[7:5] >> { celloutsig_0_4z[4:3], celloutsig_0_17z };
  assign celloutsig_0_8z = { celloutsig_0_6z, celloutsig_0_3z } >> { celloutsig_0_2z, celloutsig_0_7z };
  assign celloutsig_0_5z = in_data[17:15] <<< celloutsig_0_4z[2:0];
  assign celloutsig_0_13z = { celloutsig_0_6z[3:1], celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_1z } <<< { celloutsig_0_9z[1], celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_2z };
  assign celloutsig_1_1z = in_data[174:161] ^ in_data[121:108];
  always_latch
    if (clkin_data[0]) celloutsig_0_52z = 8'h00;
    else if (celloutsig_1_18z) celloutsig_0_52z = celloutsig_0_37z[8:1];
  assign celloutsig_1_0z = ~((in_data[154] & in_data[175]) | (in_data[168] & in_data[111]));
  assign celloutsig_0_7z = ~((celloutsig_0_5z[1] & celloutsig_0_1z) | (celloutsig_0_6z[2] & celloutsig_0_0z));
  assign celloutsig_1_17z = ~((celloutsig_1_15z & celloutsig_1_10z) | (celloutsig_1_10z & celloutsig_1_13z[0]));
  assign celloutsig_0_11z = ~((celloutsig_0_7z & celloutsig_0_9z[8]) | (in_data[65] & celloutsig_0_10z[0]));
  assign celloutsig_0_14z = ~((celloutsig_0_13z[13] & celloutsig_0_3z) | (celloutsig_0_12z[9] & celloutsig_0_3z));
  assign celloutsig_0_19z = ~((celloutsig_0_2z[8] & celloutsig_0_8z[0]) | (celloutsig_0_14z & celloutsig_0_2z[8]));
  assign celloutsig_0_26z = ~((celloutsig_0_10z[4] & celloutsig_0_5z[0]) | (celloutsig_0_5z[2] & celloutsig_0_24z));
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_53z, celloutsig_0_54z };
endmodule
