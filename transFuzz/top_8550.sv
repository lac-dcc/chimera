/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [2:0] _00_;
  reg [8:0] _01_;
  wire celloutsig_0_0z;
  wire [16:0] celloutsig_0_10z;
  wire [6:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  reg [2:0] celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  wire [7:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [5:0] celloutsig_0_21z;
  wire [17:0] celloutsig_0_22z;
  wire [6:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [14:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [2:0] celloutsig_0_27z;
  wire [5:0] celloutsig_0_28z;
  wire [8:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [8:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [11:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [8:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire [3:0] celloutsig_0_49z;
  wire [15:0] celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire celloutsig_0_55z;
  wire celloutsig_0_5z;
  wire celloutsig_0_62z;
  wire celloutsig_0_65z;
  wire celloutsig_0_66z;
  wire celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [9:0] celloutsig_1_1z;
  reg [7:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_39z = celloutsig_0_10z[6] ? celloutsig_0_22z[4] : celloutsig_0_7z;
  assign celloutsig_0_66z = celloutsig_0_15z[0] ? celloutsig_0_27z[2] : celloutsig_0_51z;
  assign celloutsig_0_14z = celloutsig_0_8z ? celloutsig_0_2z[3] : celloutsig_0_12z;
  assign celloutsig_0_55z = ~(celloutsig_0_25z[2] | celloutsig_0_38z);
  assign celloutsig_1_9z = ~(celloutsig_1_4z | celloutsig_1_8z);
  assign celloutsig_0_24z = ~(celloutsig_0_18z | celloutsig_0_19z);
  assign celloutsig_0_26z = ~(celloutsig_0_7z | celloutsig_0_24z);
  always_ff @(posedge clkin_data[96], posedge clkin_data[32])
    if (clkin_data[32]) _01_ <= 9'h000;
    else _01_ <= { in_data[42:40], celloutsig_0_40z, celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_19z };
  always_ff @(negedge clkin_data[96], posedge clkin_data[32])
    if (clkin_data[32]) _00_ <= 3'h0;
    else _00_ <= { celloutsig_0_23z[1:0], celloutsig_0_9z };
  assign celloutsig_0_38z = { celloutsig_0_22z[8:3], celloutsig_0_17z, celloutsig_0_31z, celloutsig_0_26z } == { celloutsig_0_25z[13:4], celloutsig_0_21z };
  assign celloutsig_1_4z = celloutsig_1_2z[7:5] == celloutsig_1_0z[3:1];
  assign celloutsig_1_10z = { in_data[123:121], celloutsig_1_9z, celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_3z } == { celloutsig_1_2z[2], celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_0_9z = celloutsig_0_4z[15:13] == celloutsig_0_2z[5:3];
  assign celloutsig_1_19z = { celloutsig_1_1z[7:0], celloutsig_1_9z, celloutsig_1_6z, celloutsig_1_10z } > { celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_2z };
  assign celloutsig_0_32z = { celloutsig_0_13z, celloutsig_0_25z[14:2], celloutsig_0_25z[2], celloutsig_0_25z[5], celloutsig_0_27z, celloutsig_0_30z } > { celloutsig_0_3z[10:0], celloutsig_0_30z, celloutsig_0_23z, celloutsig_0_13z };
  assign celloutsig_0_30z = ! { celloutsig_0_3z[7:3], celloutsig_0_16z };
  assign celloutsig_0_51z = { celloutsig_0_11z[3:0], celloutsig_0_27z } || { celloutsig_0_3z[10:5], celloutsig_0_32z };
  assign celloutsig_0_67z = { celloutsig_0_25z[12:2], celloutsig_0_25z[2], celloutsig_0_25z[5] } || { celloutsig_0_4z[4:1], celloutsig_0_39z, celloutsig_0_18z, celloutsig_0_65z, celloutsig_0_30z, celloutsig_0_62z, celloutsig_0_0z, celloutsig_0_46z, celloutsig_0_43z, celloutsig_0_48z };
  assign celloutsig_1_5z = { celloutsig_1_2z[4:1], celloutsig_1_0z } || celloutsig_1_1z[9:1];
  assign celloutsig_0_20z = in_data[50:47] || { celloutsig_0_11z[6:4], celloutsig_0_7z };
  assign celloutsig_0_11z = { celloutsig_0_3z[10:7], celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_5z } % { 1'h1, celloutsig_0_4z[10:9], celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_16z = { celloutsig_0_10z[15], celloutsig_0_10z[1:0] } % { 1'h1, celloutsig_0_4z[12], celloutsig_0_9z };
  assign celloutsig_0_21z = { celloutsig_0_4z[11:9], celloutsig_0_20z, celloutsig_0_8z, celloutsig_0_14z } % { 1'h1, celloutsig_0_11z[4:0] };
  assign celloutsig_0_3z = { in_data[11:4], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z } % { 1'h1, celloutsig_0_2z[3], celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_27z = { celloutsig_0_25z[12:11], celloutsig_0_14z } % { 1'h1, celloutsig_0_16z[1:0] };
  assign celloutsig_0_37z = { celloutsig_0_28z[5:4], celloutsig_0_14z, celloutsig_0_31z, celloutsig_0_7z, celloutsig_0_20z, celloutsig_0_27z } * celloutsig_0_4z[11:3];
  assign celloutsig_0_23z = celloutsig_0_22z[15:9] * { celloutsig_0_10z[13:8], celloutsig_0_12z };
  assign celloutsig_0_28z = celloutsig_0_3z[5:0] * { celloutsig_0_13z, celloutsig_0_9z, celloutsig_0_16z, celloutsig_0_14z };
  assign celloutsig_0_46z = { celloutsig_0_6z, celloutsig_0_42z, celloutsig_0_19z } != celloutsig_0_25z[4:2];
  assign celloutsig_0_7z = in_data[27:24] != celloutsig_0_3z[6:3];
  assign celloutsig_1_13z = { celloutsig_1_11z[2], celloutsig_1_0z } != { in_data[99:98], celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_12z, celloutsig_1_10z };
  assign celloutsig_1_17z = { celloutsig_1_6z, celloutsig_1_13z, celloutsig_1_11z } != { in_data[125], celloutsig_1_7z, celloutsig_1_12z, celloutsig_1_13z, celloutsig_1_5z };
  assign celloutsig_0_48z = celloutsig_0_37z[8:4] !== { celloutsig_0_37z[5:2], celloutsig_0_6z };
  assign celloutsig_0_6z = in_data[40:33] !== in_data[24:17];
  assign celloutsig_0_8z = { celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_0z } !== { celloutsig_0_2z[8:2], celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_6z };
  assign celloutsig_1_12z = { celloutsig_1_2z[6:3], celloutsig_1_11z } !== { celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_6z };
  assign celloutsig_1_18z = { celloutsig_1_0z[0], celloutsig_1_17z, celloutsig_1_4z } !== { celloutsig_1_0z[4:3], celloutsig_1_13z };
  assign celloutsig_0_41z = ~ { celloutsig_0_17z, celloutsig_0_40z };
  assign celloutsig_1_0z = ~ in_data[131:127];
  assign celloutsig_1_1z = ~ in_data[109:100];
  assign celloutsig_1_11z = ~ { celloutsig_1_1z[1:0], celloutsig_1_6z };
  assign celloutsig_0_2z = ~ { in_data[91:84], celloutsig_0_0z };
  assign celloutsig_0_0z = | in_data[48:42];
  assign celloutsig_0_40z = | in_data[56:53];
  assign celloutsig_0_42z = | celloutsig_0_3z[8:4];
  assign celloutsig_0_43z = | celloutsig_0_41z[5:1];
  assign celloutsig_0_5z = | { celloutsig_0_3z[10:7], celloutsig_0_2z };
  assign celloutsig_0_62z = | { celloutsig_0_55z, _01_[5:3], in_data[46:35] };
  assign celloutsig_0_65z = | { celloutsig_0_49z[0], _00_ };
  assign celloutsig_1_3z = | in_data[169:159];
  assign celloutsig_1_7z = | in_data[185:174];
  assign celloutsig_1_8z = | { celloutsig_1_5z, in_data[185:174], in_data[169:159], in_data[155:153] };
  assign celloutsig_0_1z = | in_data[84:79];
  assign celloutsig_0_12z = | celloutsig_0_11z[3:0];
  assign celloutsig_0_13z = | celloutsig_0_3z[10:5];
  assign celloutsig_0_18z = | { celloutsig_0_2z, in_data[55:41] };
  assign celloutsig_0_19z = | { celloutsig_0_6z, celloutsig_0_4z[14:11] };
  assign celloutsig_0_31z = | in_data[46:35];
  assign celloutsig_0_49z = { celloutsig_0_16z[1], celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_1z } >> { celloutsig_0_46z, celloutsig_0_32z, celloutsig_0_9z, celloutsig_0_14z };
  assign celloutsig_0_17z = { in_data[81:77], celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_6z } >> { celloutsig_0_10z[9:4], celloutsig_0_13z, celloutsig_0_6z };
  assign celloutsig_0_22z = { celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_15z, celloutsig_0_19z, celloutsig_0_20z } >> { celloutsig_0_3z[11:2], celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_16z, celloutsig_0_18z, celloutsig_0_14z, celloutsig_0_13z };
  assign celloutsig_0_4z = { in_data[69:63], celloutsig_0_2z } >> { in_data[53:47], celloutsig_0_2z };
  assign celloutsig_1_6z = ~((celloutsig_1_1z[5] & in_data[126]) | celloutsig_1_4z);
  always_latch
    if (!clkin_data[64]) celloutsig_1_2z = 8'h00;
    else if (!clkin_data[0]) celloutsig_1_2z = celloutsig_1_1z[7:0];
  always_latch
    if (!clkin_data[32]) celloutsig_0_15z = 3'h0;
    else if (!celloutsig_1_18z) celloutsig_0_15z = celloutsig_0_2z[3:1];
  assign { celloutsig_0_10z[0], celloutsig_0_10z[1], celloutsig_0_10z[14:3], celloutsig_0_10z[16:15] } = ~ { celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_0z };
  assign { celloutsig_0_25z[14:6], celloutsig_0_25z[2], celloutsig_0_25z[5:3] } = ~ { celloutsig_0_22z[10:2], celloutsig_0_20z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_5z };
  assign celloutsig_0_10z[2] = celloutsig_0_10z[15];
  assign celloutsig_0_25z[1:0] = { celloutsig_0_25z[2], celloutsig_0_25z[5] };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_66z, celloutsig_0_67z };
endmodule
