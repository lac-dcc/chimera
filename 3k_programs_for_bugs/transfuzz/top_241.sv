/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [9:0] celloutsig_0_12z;
  reg [3:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  reg [4:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [10:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [2:0] celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [6:0] celloutsig_0_38z;
  wire [6:0] celloutsig_0_3z;
  wire [9:0] celloutsig_0_46z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_5z;
  wire [13:0] celloutsig_0_6z;
  reg [7:0] celloutsig_0_7z;
  wire [17:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [5:0] celloutsig_1_11z;
  wire [20:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [18:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [16:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [12:0] celloutsig_1_8z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_34z = celloutsig_0_28z[2] ? celloutsig_0_2z : celloutsig_0_19z;
  assign celloutsig_0_52z = celloutsig_0_7z[0] ? celloutsig_0_26z : celloutsig_0_14z;
  assign celloutsig_1_0z = in_data[175] ? in_data[175] : in_data[177];
  assign celloutsig_0_10z = celloutsig_0_0z ? celloutsig_0_8z[15] : celloutsig_0_6z[8];
  assign celloutsig_0_21z = celloutsig_0_10z ? celloutsig_0_7z[2] : celloutsig_0_17z;
  assign celloutsig_0_23z = celloutsig_0_17z ? celloutsig_0_19z : celloutsig_0_9z;
  assign celloutsig_0_6z = { celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_46z[3:2], celloutsig_0_46z[2], celloutsig_0_46z[0], celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_46z[3:2], celloutsig_0_46z[2], celloutsig_0_46z[0] } + { in_data[68:60], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_6z = { in_data[147:145], celloutsig_1_4z, celloutsig_1_4z } + celloutsig_1_3z[7:3];
  assign celloutsig_1_11z = { celloutsig_1_3z[10], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_5z } + celloutsig_1_3z[10:5];
  assign celloutsig_1_12z = { celloutsig_1_3z[3:0], celloutsig_1_8z[12:5], celloutsig_1_8z[11:7], celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_2z } + { celloutsig_1_3z[14:5], celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_10z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_0z };
  assign celloutsig_0_35z = { celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_23z, celloutsig_0_21z, celloutsig_0_18z } === celloutsig_0_6z[9:2];
  assign celloutsig_1_7z = { celloutsig_1_4z, celloutsig_1_3z } === { celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_13z = { celloutsig_1_8z[12:5], celloutsig_1_7z } === { celloutsig_1_8z[11:5], celloutsig_1_8z[11], celloutsig_1_2z };
  assign celloutsig_1_19z = celloutsig_1_8z[9:6] === celloutsig_1_18z[18:15];
  assign celloutsig_0_11z = { celloutsig_0_8z[8:2], celloutsig_0_10z } === { celloutsig_0_46z[3:2], celloutsig_0_46z[2], celloutsig_0_9z, celloutsig_0_46z[3:2], celloutsig_0_46z[2], celloutsig_0_46z[0] };
  assign celloutsig_0_18z = { celloutsig_0_6z[9:8], celloutsig_0_46z[3:2], celloutsig_0_46z[2], celloutsig_0_46z[0] } === { celloutsig_0_12z[9:5], celloutsig_0_1z };
  assign celloutsig_0_2z = { in_data[33:14], celloutsig_0_0z } === in_data[90:70];
  assign celloutsig_0_25z = celloutsig_0_12z[8:1] === { celloutsig_0_6z[13:11], celloutsig_0_16z };
  assign celloutsig_0_0z = in_data[41:36] <= in_data[49:44];
  assign celloutsig_0_5z = { celloutsig_0_3z[4:0], celloutsig_0_0z } <= celloutsig_0_3z[6:1];
  assign celloutsig_1_5z = { in_data[176:170], celloutsig_1_2z, celloutsig_1_4z } <= { celloutsig_1_3z[7:0], celloutsig_1_4z };
  assign celloutsig_1_14z = celloutsig_1_3z[10:6] <= { in_data[149:146], celloutsig_1_13z };
  assign celloutsig_0_26z = { celloutsig_0_1z, celloutsig_0_46z[3:2], celloutsig_0_46z[2], celloutsig_0_46z[0], celloutsig_0_25z } <= { celloutsig_0_7z[6:5], celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_14z };
  assign celloutsig_1_2z = in_data[182:164] && { in_data[135:119], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_15z = in_data[163:159] && { celloutsig_1_11z[5:2], celloutsig_1_14z };
  assign celloutsig_1_16z = { celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_10z, celloutsig_1_15z, celloutsig_1_10z, celloutsig_1_14z } && in_data[128:123];
  assign celloutsig_1_17z = celloutsig_1_3z[9:0] && { celloutsig_1_12z[9:6], celloutsig_1_6z, celloutsig_1_16z };
  assign celloutsig_0_9z = { celloutsig_0_3z[3], celloutsig_0_3z } && { celloutsig_0_3z[3], celloutsig_0_3z };
  assign celloutsig_0_1z = ! in_data[74:61];
  assign celloutsig_0_51z = celloutsig_0_38z[2:0] || { celloutsig_0_46z[8:7], celloutsig_0_10z };
  assign celloutsig_1_4z = { in_data[105:96], celloutsig_1_2z } || { celloutsig_1_3z[15:7], celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_0_17z = celloutsig_0_7z[7:1] || celloutsig_0_7z[7:1];
  assign celloutsig_1_18z = { in_data[180:169], celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_17z } * { celloutsig_1_5z, celloutsig_1_14z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_8z[12:5], celloutsig_1_8z[11:7], celloutsig_1_10z, celloutsig_1_4z };
  assign celloutsig_0_20z = { celloutsig_0_8z[10:9], celloutsig_0_13z, celloutsig_0_16z } * { celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_19z, celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_17z, celloutsig_0_15z };
  assign celloutsig_0_3z = in_data[38:32] * { in_data[63:60], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_46z[9:4] = celloutsig_0_17z ? { celloutsig_0_8z[8:5], celloutsig_0_2z, celloutsig_0_2z } : { celloutsig_0_16z[2:0], celloutsig_0_34z, celloutsig_0_0z, celloutsig_0_9z };
  assign celloutsig_1_3z = ~ { in_data[150:135], celloutsig_1_0z };
  assign celloutsig_0_12z = ~ { celloutsig_0_7z[3:2], celloutsig_0_10z, celloutsig_0_3z };
  assign celloutsig_1_10z = | { celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_0z };
  assign celloutsig_0_14z = | in_data[35:29];
  assign celloutsig_0_15z = | { celloutsig_0_5z, celloutsig_0_3z[4:3] };
  assign celloutsig_0_28z = { celloutsig_0_7z[7:6], celloutsig_0_25z } >> { celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_26z };
  assign celloutsig_0_38z = celloutsig_0_20z[10:4] >> { celloutsig_0_35z, celloutsig_0_9z, celloutsig_0_35z, celloutsig_0_46z[3:2], celloutsig_0_46z[2], celloutsig_0_46z[0] };
  assign celloutsig_0_8z = { celloutsig_0_3z[6:3], celloutsig_0_6z } >> in_data[36:19];
  always_latch
    if (!clkin_data[32]) celloutsig_0_7z = 8'h00;
    else if (!celloutsig_1_19z) celloutsig_0_7z = in_data[27:20];
  always_latch
    if (!clkin_data[32]) celloutsig_0_13z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_13z = { in_data[95:94], celloutsig_0_10z, celloutsig_0_10z };
  always_latch
    if (clkin_data[32]) celloutsig_0_16z = 5'h00;
    else if (!celloutsig_1_19z) celloutsig_0_16z = celloutsig_0_6z[7:3];
  assign celloutsig_1_1z = ~((celloutsig_1_0z & celloutsig_1_0z) | (celloutsig_1_0z & celloutsig_1_0z));
  assign celloutsig_0_19z = ~((celloutsig_0_16z[2] & celloutsig_0_11z) | (celloutsig_0_14z & celloutsig_0_0z));
  assign { celloutsig_0_46z[3:2], celloutsig_0_46z[0] } = ~ { celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z };
  assign { celloutsig_1_8z[6], celloutsig_1_8z[11:7], celloutsig_1_8z[5], celloutsig_1_8z[12] } = ~ { celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_0z };
  assign celloutsig_0_46z[1] = celloutsig_0_46z[2];
  assign celloutsig_1_8z[4:0] = celloutsig_1_8z[11:7];
  assign { out_data[146:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_51z, celloutsig_0_52z };
endmodule
