/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [4:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [4:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [5:0] celloutsig_0_19z;
  reg [13:0] celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [3:0] celloutsig_0_24z;
  reg [3:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [13:0] celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire celloutsig_0_37z;
  wire [7:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [10:0] celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire [3:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire [2:0] celloutsig_0_4z;
  wire celloutsig_0_57z;
  wire celloutsig_0_5z;
  wire celloutsig_0_63z;
  wire [7:0] celloutsig_0_64z;
  wire celloutsig_0_6z;
  reg [11:0] celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [26:0] celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [4:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_1z = in_data[109] ? celloutsig_1_0z : in_data[175];
  assign celloutsig_1_12z = celloutsig_1_3z ? celloutsig_1_8z : celloutsig_1_11z;
  assign celloutsig_0_15z = celloutsig_0_14z[2] ? celloutsig_0_6z : celloutsig_0_12z;
  assign celloutsig_0_32z = ~(celloutsig_0_15z & celloutsig_0_18z);
  assign celloutsig_0_11z = ~(celloutsig_0_9z & celloutsig_0_2z);
  assign celloutsig_0_16z = ~(celloutsig_0_12z & celloutsig_0_10z);
  assign celloutsig_1_4z = !(celloutsig_1_2z[0] ? celloutsig_1_3z : celloutsig_1_0z);
  assign celloutsig_1_17z = !(celloutsig_1_4z ? celloutsig_1_12z : celloutsig_1_0z);
  assign celloutsig_0_21z = !(celloutsig_0_4z[1] ? celloutsig_0_10z : celloutsig_0_7z[5]);
  assign celloutsig_0_2z = !(in_data[43] ? celloutsig_0_1z[3] : celloutsig_0_0z[2]);
  assign celloutsig_0_43z = ~((celloutsig_0_12z | celloutsig_0_39z) & (celloutsig_0_28z[3] | celloutsig_0_39z));
  assign celloutsig_1_11z = ~((in_data[184] | celloutsig_1_2z[4]) & (celloutsig_1_7z | celloutsig_1_3z));
  assign celloutsig_1_16z = ~((celloutsig_1_12z | celloutsig_1_7z) & (celloutsig_1_12z | celloutsig_1_7z));
  assign celloutsig_1_18z = ~((celloutsig_1_14z[15] | celloutsig_1_11z) & (celloutsig_1_7z | celloutsig_1_6z));
  assign celloutsig_0_29z = ~((celloutsig_0_24z[1] | celloutsig_0_17z) & (celloutsig_0_7z[0] | celloutsig_0_3z[2]));
  assign celloutsig_0_6z = celloutsig_0_0z[1] ^ celloutsig_0_0z[2];
  assign celloutsig_0_17z = celloutsig_0_15z ^ celloutsig_0_10z;
  assign celloutsig_0_48z = celloutsig_0_14z[3:0] + { in_data[7], celloutsig_0_41z, celloutsig_0_16z, celloutsig_0_18z };
  assign celloutsig_0_4z = celloutsig_0_3z[2:0] + in_data[80:78];
  assign celloutsig_0_64z = in_data[67:60] + { celloutsig_0_3z[3:1], celloutsig_0_8z, celloutsig_0_43z, celloutsig_0_49z };
  assign celloutsig_0_3z = celloutsig_0_1z[13:3] / { 1'h1, celloutsig_0_0z[3:0], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_1_14z = { in_data[152:128], celloutsig_1_12z, celloutsig_1_10z } / { 1'h1, in_data[170:149], celloutsig_1_13z, celloutsig_1_8z, celloutsig_1_8z, celloutsig_1_4z };
  assign celloutsig_1_19z = { celloutsig_1_16z, celloutsig_1_17z, celloutsig_1_9z, celloutsig_1_10z, celloutsig_1_7z } / { 1'h1, celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_12z, celloutsig_1_11z };
  assign celloutsig_0_41z = in_data[58:53] === celloutsig_0_30z[8:3];
  assign celloutsig_0_22z = { celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_21z, celloutsig_0_17z } === celloutsig_0_0z[4:1];
  assign celloutsig_0_49z = in_data[38:27] <= { celloutsig_0_1z[5], celloutsig_0_38z, celloutsig_0_16z, celloutsig_0_2z, celloutsig_0_37z };
  assign celloutsig_0_5z = in_data[89:77] <= { celloutsig_0_4z[2:1], celloutsig_0_3z };
  assign celloutsig_1_9z = { celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_1z } <= { celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_6z };
  assign celloutsig_0_12z = { celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_6z } <= { celloutsig_0_0z[4], celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_63z = { celloutsig_0_30z[8:6], celloutsig_0_15z, celloutsig_0_18z } && { celloutsig_0_48z[3], celloutsig_0_4z, celloutsig_0_57z };
  assign celloutsig_1_13z = { in_data[121:112], celloutsig_1_5z } && in_data[122:112];
  assign celloutsig_0_37z = ! celloutsig_0_24z[2:0];
  assign celloutsig_1_7z = ! { in_data[179:178], celloutsig_1_6z };
  assign celloutsig_1_8z = ! { in_data[154], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_1_0z = in_data[123:120] || in_data[180:177];
  assign celloutsig_1_3z = { celloutsig_1_2z[2:0], celloutsig_1_1z } || { celloutsig_1_2z[1], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_18z = { celloutsig_0_1z[12:5], celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_17z } || { celloutsig_0_7z[9:1], celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_10z };
  assign celloutsig_0_38z = { celloutsig_0_7z[8:4], celloutsig_0_13z, celloutsig_0_22z, celloutsig_0_22z } % { 1'h1, in_data[80:75], celloutsig_0_13z };
  assign celloutsig_0_10z = & { celloutsig_0_5z, celloutsig_0_1z[7:1] };
  assign celloutsig_0_57z = celloutsig_0_28z[0] & celloutsig_0_38z[3];
  assign celloutsig_0_9z = celloutsig_0_2z & celloutsig_0_6z;
  assign celloutsig_0_13z = celloutsig_0_4z[1] & celloutsig_0_9z;
  assign celloutsig_0_39z = ^ { celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_32z };
  assign celloutsig_1_5z = ^ in_data[159:145];
  assign celloutsig_1_6z = ^ { celloutsig_1_2z[3:1], celloutsig_1_3z };
  assign celloutsig_1_10z = ^ { celloutsig_1_9z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_3z };
  assign celloutsig_1_2z = in_data[167:161] << in_data[177:171];
  assign celloutsig_0_8z = celloutsig_0_7z[2:0] << { celloutsig_0_4z[2:1], celloutsig_0_5z };
  assign celloutsig_0_19z = celloutsig_0_3z[5:0] << { celloutsig_0_9z, celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_15z };
  assign celloutsig_0_24z = celloutsig_0_19z[4:1] << { celloutsig_0_4z, celloutsig_0_11z };
  assign celloutsig_0_14z = { celloutsig_0_0z[4:1], celloutsig_0_11z } ~^ { celloutsig_0_3z[4:1], celloutsig_0_12z };
  assign celloutsig_0_30z = { celloutsig_0_0z[3:0], celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_15z } ~^ { celloutsig_0_14z[2], celloutsig_0_29z, celloutsig_0_3z, celloutsig_0_16z };
  always_latch
    if (clkin_data[32]) celloutsig_0_0z = 5'h00;
    else if (!clkin_data[0]) celloutsig_0_0z = in_data[49:45];
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_7z = 12'h000;
    else if (clkin_data[0]) celloutsig_0_7z = { celloutsig_0_4z[0], celloutsig_0_3z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_1z = 14'h0000;
    else if (!clkin_data[0]) celloutsig_0_1z = in_data[90:77];
  always_latch
    if (!clkin_data[32]) celloutsig_0_28z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_28z = celloutsig_0_0z[4:1];
  assign { out_data[128], out_data[100:96], out_data[32], out_data[7:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_63z, celloutsig_0_64z };
endmodule
