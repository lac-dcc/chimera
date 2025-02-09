/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [6:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  reg [14:0] celloutsig_0_14z;
  reg [2:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [8:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire [14:0] celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [3:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [11:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [3:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [3:0] celloutsig_1_4z;
  wire [16:0] celloutsig_1_5z;
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
  assign celloutsig_1_15z = celloutsig_1_8z ? celloutsig_1_0z : in_data[179];
  assign celloutsig_1_16z = celloutsig_1_2z[4] ? celloutsig_1_9z : celloutsig_1_4z[2];
  assign celloutsig_0_17z = celloutsig_0_7z ? celloutsig_0_10z : celloutsig_0_1z;
  assign celloutsig_0_0z = ~in_data[70];
  assign celloutsig_0_16z = ~celloutsig_0_5z;
  assign celloutsig_1_1z = ~((in_data[130] | celloutsig_1_0z) & (celloutsig_1_0z | in_data[175]));
  assign celloutsig_1_3z = ~((celloutsig_1_1z | celloutsig_1_2z[3]) & (celloutsig_1_1z | in_data[155]));
  assign celloutsig_0_9z = ~((celloutsig_0_6z[6] | celloutsig_0_5z) & (celloutsig_0_8z[2] | celloutsig_0_3z[0]));
  assign celloutsig_0_37z = celloutsig_0_28z[13] | ~(celloutsig_0_16z);
  assign celloutsig_0_38z = ~(celloutsig_0_1z ^ celloutsig_0_11z[2]);
  assign celloutsig_1_7z = ~(celloutsig_1_0z ^ celloutsig_1_3z);
  assign celloutsig_1_8z = ~(celloutsig_1_7z ^ celloutsig_1_5z[2]);
  assign celloutsig_0_7z = ~(in_data[38] ^ celloutsig_0_3z[1]);
  assign celloutsig_0_10z = ~(celloutsig_0_5z ^ celloutsig_0_8z[3]);
  assign celloutsig_0_21z = ~(celloutsig_0_16z ^ celloutsig_0_18z);
  assign celloutsig_1_12z = { celloutsig_1_5z[12:0], celloutsig_1_4z } <= { in_data[131:116], celloutsig_1_0z };
  assign celloutsig_0_5z = in_data[17:11] <= { in_data[75:70], celloutsig_0_4z };
  assign celloutsig_0_23z = { celloutsig_0_14z[7:0], celloutsig_0_20z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_15z } <= { in_data[7:3], celloutsig_0_21z, celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_20z, celloutsig_0_13z, celloutsig_0_20z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_1_0z = in_data[136:128] < in_data[156:148];
  assign celloutsig_1_13z = in_data[179:169] < { in_data[138:129], celloutsig_1_8z };
  assign celloutsig_1_19z = in_data[185:183] < { in_data[173:172], celloutsig_1_14z };
  assign celloutsig_0_13z = celloutsig_0_11z[6:3] < { in_data[29], celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_12z };
  assign celloutsig_0_8z = celloutsig_0_3z % { 1'h1, celloutsig_0_6z[7:5] };
  assign celloutsig_1_4z = { in_data[123:121], celloutsig_1_3z } * { celloutsig_1_2z[3:1], celloutsig_1_3z };
  assign celloutsig_1_5z = in_data[129:113] * { in_data[166], celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_0_28z = { celloutsig_0_17z, celloutsig_0_19z, celloutsig_0_16z, celloutsig_0_17z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_23z } * celloutsig_0_14z;
  assign celloutsig_1_2z = - { in_data[179:177], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_18z = { celloutsig_0_14z[14:3], celloutsig_0_5z } !== { celloutsig_0_14z[11:9], celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_15z, celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_13z };
  assign celloutsig_1_18z = | { celloutsig_1_2z[3:2], celloutsig_1_15z, celloutsig_1_1z, celloutsig_1_15z, celloutsig_1_12z, celloutsig_1_6z, celloutsig_1_13z, celloutsig_1_9z, celloutsig_1_16z, celloutsig_1_0z };
  assign celloutsig_0_1z = | in_data[36:32];
  assign celloutsig_0_4z = celloutsig_0_0z & celloutsig_0_2z;
  assign celloutsig_1_14z = celloutsig_1_3z & in_data[191];
  assign celloutsig_1_6z = | celloutsig_1_2z[5:0];
  assign celloutsig_1_9z = ^ { celloutsig_1_5z[2], celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_12z = ^ { celloutsig_0_6z[10:9], celloutsig_0_8z, celloutsig_0_8z };
  assign celloutsig_0_20z = ^ celloutsig_0_6z[10:4];
  assign celloutsig_0_3z = in_data[25:22] << { in_data[52:51], celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_6z = { in_data[91:86], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_4z } >> { in_data[71:64], celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_11z = in_data[32:26] >> { celloutsig_0_8z[1:0], celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_0_19z = { celloutsig_0_6z[7:0], celloutsig_0_4z } >> { in_data[38:34], celloutsig_0_18z, celloutsig_0_16z, celloutsig_0_1z, celloutsig_0_7z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_14z = 15'h0000;
    else if (!celloutsig_1_19z) celloutsig_0_14z = { celloutsig_0_11z[4:1], celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_13z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_15z = 3'h0;
    else if (celloutsig_1_19z) celloutsig_0_15z = { celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_0z };
  assign celloutsig_0_2z = ~((celloutsig_0_1z & celloutsig_0_1z) | (in_data[23] & celloutsig_0_0z));
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_37z, celloutsig_0_38z };
endmodule
