/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [13:0] celloutsig_0_0z;
  wire [9:0] celloutsig_0_10z;
  wire [2:0] celloutsig_0_11z;
  wire [17:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire [4:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire [4:0] celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [6:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  reg [5:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_14z;
  wire [17:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  reg [9:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = !(celloutsig_0_0z[13] ? celloutsig_0_2z : celloutsig_0_1z);
  assign celloutsig_1_19z = ~((celloutsig_1_3z[0] | celloutsig_1_18z[6]) & (celloutsig_1_8z | celloutsig_1_4z));
  assign celloutsig_1_11z = celloutsig_1_5z | ~(celloutsig_1_6z);
  assign celloutsig_1_4z = in_data[172] | celloutsig_1_3z[1];
  assign celloutsig_0_1z = in_data[23] | in_data[90];
  assign celloutsig_0_17z = celloutsig_0_12z[0] | celloutsig_0_4z;
  assign celloutsig_0_33z = celloutsig_0_26z[2:0] == { celloutsig_0_17z, celloutsig_0_28z, celloutsig_0_20z };
  assign celloutsig_0_5z = { celloutsig_0_0z[9:4], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_2z } == { in_data[43:35], celloutsig_0_3z };
  assign celloutsig_0_28z = { celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_23z, celloutsig_0_13z } == in_data[27:24];
  assign celloutsig_1_8z = { in_data[124:120], celloutsig_1_4z } === { celloutsig_1_2z[5:1], celloutsig_1_0z };
  assign celloutsig_0_18z = { celloutsig_0_10z[6:4], celloutsig_0_1z } === { celloutsig_0_11z[2:1], celloutsig_0_13z, celloutsig_0_13z };
  assign celloutsig_0_20z = { celloutsig_0_8z[4:0], celloutsig_0_18z, celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_18z, celloutsig_0_19z, celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_19z } === { celloutsig_0_19z, celloutsig_0_17z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_16z, celloutsig_0_1z };
  assign celloutsig_0_9z = in_data[8:2] < { celloutsig_0_8z[5:1], celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_0_23z = { celloutsig_0_18z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_20z } < celloutsig_0_6z[6:2];
  assign celloutsig_1_0z = in_data[180] & ~(in_data[153]);
  assign celloutsig_0_15z = celloutsig_0_1z & ~(celloutsig_0_10z[6]);
  assign celloutsig_0_21z = in_data[18] & ~(celloutsig_0_11z[0]);
  assign celloutsig_0_6z = in_data[65:59] % { 1'h1, celloutsig_0_0z[7:3], celloutsig_0_2z };
  assign celloutsig_1_18z = in_data[173:156] % { 1'h1, in_data[168:161], celloutsig_1_6z, celloutsig_1_14z, celloutsig_1_2z };
  assign celloutsig_0_34z = { celloutsig_0_23z, celloutsig_0_15z, celloutsig_0_32z, celloutsig_0_13z, celloutsig_0_11z } != { celloutsig_0_2z, celloutsig_0_23z, celloutsig_0_16z };
  assign celloutsig_1_6z = { celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_2z } != { in_data[133:126], celloutsig_1_5z };
  assign celloutsig_0_4z = { celloutsig_0_0z[4:1], celloutsig_0_2z } !== { celloutsig_0_0z[3:0], celloutsig_0_3z };
  assign celloutsig_0_19z = { celloutsig_0_8z[1:0], celloutsig_0_13z, celloutsig_0_9z } !== { celloutsig_0_8z[2], celloutsig_0_11z };
  assign celloutsig_0_0z = ~ in_data[83:70];
  assign celloutsig_1_2z = ~ in_data[153:147];
  assign celloutsig_0_12z = ~ in_data[31:14];
  assign celloutsig_0_26z = ~ in_data[61:57];
  assign celloutsig_1_1z = & in_data[128:124];
  assign celloutsig_0_13z = & in_data[80:74];
  assign celloutsig_0_32z = celloutsig_0_23z & celloutsig_0_21z;
  assign celloutsig_1_5z = celloutsig_1_1z & celloutsig_1_3z[1];
  assign celloutsig_1_14z = celloutsig_1_11z & in_data[174];
  assign celloutsig_0_7z = celloutsig_0_3z & celloutsig_0_4z;
  assign celloutsig_0_10z = { in_data[42:41], celloutsig_0_9z, celloutsig_0_6z } << { in_data[42:35], celloutsig_0_9z, celloutsig_0_3z };
  assign celloutsig_0_11z = celloutsig_0_10z[8:6] << { celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_16z = { celloutsig_0_8z[5:2], celloutsig_0_4z } << celloutsig_0_8z[5:1];
  always_latch
    if (!clkin_data[64]) celloutsig_1_3z = 10'h000;
    else if (!clkin_data[0]) celloutsig_1_3z = { celloutsig_1_2z[4:2], celloutsig_1_2z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_8z = 6'h00;
    else if (!celloutsig_1_18z[0]) celloutsig_0_8z = { celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_0_2z = ~((celloutsig_0_0z[5] & in_data[18]) | (celloutsig_0_0z[9] & in_data[46]));
  assign { out_data[145:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_33z, celloutsig_0_34z };
endmodule
