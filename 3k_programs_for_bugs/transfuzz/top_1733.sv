/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire [4:0] celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [2:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  reg [11:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [3:0] celloutsig_0_28z;
  wire [2:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire [11:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [9:0] celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire [4:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire [8:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [5:0] celloutsig_1_4z;
  reg [10:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_14z = ~(celloutsig_1_5z[4] | celloutsig_1_11z);
  assign celloutsig_0_1z = ~(celloutsig_0_0z | in_data[76]);
  assign celloutsig_0_0z = ~in_data[61];
  assign celloutsig_1_13z = ~celloutsig_1_2z;
  assign celloutsig_0_27z = ~celloutsig_0_26z;
  assign celloutsig_1_9z = celloutsig_1_5z[3] | ~(celloutsig_1_0z);
  assign celloutsig_1_10z = celloutsig_1_3z | ~(celloutsig_1_1z[4]);
  assign celloutsig_0_8z = celloutsig_0_4z[10] | ~(celloutsig_0_1z);
  assign celloutsig_0_11z = celloutsig_0_1z | ~(celloutsig_0_7z);
  assign celloutsig_0_15z = 1'h0 | ~(celloutsig_0_3z);
  assign celloutsig_0_26z = 1'h0 | ~(celloutsig_0_1z);
  assign celloutsig_1_15z = { celloutsig_1_14z, celloutsig_1_1z } + { in_data[185:180], celloutsig_1_0z, celloutsig_1_11z, celloutsig_1_11z, celloutsig_1_0z };
  assign celloutsig_1_17z = { in_data[131], celloutsig_1_11z, celloutsig_1_7z, celloutsig_1_14z, celloutsig_1_11z } + { celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_13z, celloutsig_1_14z };
  assign celloutsig_0_28z = celloutsig_0_24z[10:7] + { celloutsig_0_2z[2], 1'h0, celloutsig_0_7z, celloutsig_0_25z };
  assign celloutsig_1_8z = { celloutsig_1_1z[4:2], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_6z } === celloutsig_1_5z;
  assign celloutsig_1_6z = { celloutsig_1_1z[6], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_0z } >= { celloutsig_1_5z[6:1], celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_0_6z = { celloutsig_0_4z[6:3], celloutsig_0_4z[3], celloutsig_0_1z, celloutsig_0_0z } >= { celloutsig_0_4z[5:3], celloutsig_0_4z[3], celloutsig_0_4z[1:0], celloutsig_0_5z };
  assign celloutsig_0_17z = { celloutsig_0_8z, celloutsig_0_2z[2], celloutsig_0_2z[2], celloutsig_0_2z[0], celloutsig_0_16z } >= { in_data[25:24], celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_3z };
  assign celloutsig_0_13z = in_data[61] ? { celloutsig_0_2z[2], celloutsig_0_2z[2], celloutsig_0_2z[0], celloutsig_0_7z, celloutsig_0_1z } : { celloutsig_0_4z[3], celloutsig_0_4z[1:0], celloutsig_0_0z, celloutsig_0_7z };
  assign celloutsig_1_12z = { celloutsig_1_5z[9:7], celloutsig_1_8z, celloutsig_1_10z } !== celloutsig_1_5z[6:2];
  assign celloutsig_1_18z = { celloutsig_1_15z, celloutsig_1_16z, celloutsig_1_6z, celloutsig_1_9z, celloutsig_1_6z } !== { celloutsig_1_1z[2:0], celloutsig_1_8z, celloutsig_1_16z, celloutsig_1_9z, celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_17z, celloutsig_1_16z };
  assign celloutsig_0_5z = in_data[75:69] !== { celloutsig_0_4z[7:3], celloutsig_0_4z[3], celloutsig_0_3z };
  assign celloutsig_0_16z = { celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_7z, 1'h0, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_0z, 1'h1, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_3z } !== { celloutsig_0_15z, 1'h1, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_4z[11:3], celloutsig_0_4z[3], celloutsig_0_4z[1:0], celloutsig_0_7z, celloutsig_0_0z };
  assign celloutsig_0_3z = { in_data[25:5], celloutsig_0_2z[2], celloutsig_0_2z[2], celloutsig_0_2z[0], celloutsig_0_2z[2], celloutsig_0_2z[2], celloutsig_0_2z[0], celloutsig_0_1z } !== in_data[33:6];
  assign celloutsig_1_2z = { celloutsig_1_1z[5:1], celloutsig_1_0z } !== in_data[144:139];
  assign celloutsig_1_3z = in_data[182:166] !== { in_data[168:154], celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_19z = { celloutsig_1_13z, celloutsig_1_1z, celloutsig_1_8z } | { celloutsig_1_5z[3:1], celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_10z, celloutsig_1_13z };
  assign celloutsig_0_19z = celloutsig_0_4z[7:5] | celloutsig_0_13z[2:0];
  assign celloutsig_0_20z = { celloutsig_0_11z, celloutsig_0_19z } | in_data[65:62];
  assign celloutsig_1_1z = { in_data[174:167], celloutsig_1_0z } | { in_data[186:181], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_7z = & celloutsig_1_5z[10:6];
  assign celloutsig_0_7z = & { celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_2z[2], celloutsig_0_2z[0], celloutsig_0_0z };
  assign celloutsig_1_0z = & in_data[171:163];
  assign celloutsig_1_4z = { in_data[123:121], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z } ^ in_data[104:99];
  always_latch
    if (clkin_data[64]) celloutsig_1_5z = 11'h000;
    else if (clkin_data[32]) celloutsig_1_5z = { in_data[123:114], celloutsig_1_3z };
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_24z = 12'h000;
    else if (!clkin_data[0]) celloutsig_0_24z = { in_data[85:75], celloutsig_0_17z };
  assign celloutsig_1_11z = ~((in_data[179] & celloutsig_1_3z) | (celloutsig_1_5z[10] & celloutsig_1_2z));
  assign celloutsig_1_16z = ~((celloutsig_1_11z & celloutsig_1_11z) | (celloutsig_1_1z[4] & celloutsig_1_11z));
  assign celloutsig_0_25z = ~((celloutsig_0_7z & celloutsig_0_24z[5]) | (celloutsig_0_20z[1] & 1'h1));
  assign { celloutsig_0_2z[2], celloutsig_0_2z[0] } = { celloutsig_0_1z, celloutsig_0_0z } | { celloutsig_0_0z, celloutsig_0_0z };
  assign { celloutsig_0_4z[3], celloutsig_0_4z[6:5], celloutsig_0_4z[1], celloutsig_0_4z[4], celloutsig_0_4z[10:9], celloutsig_0_4z[7], celloutsig_0_4z[0], celloutsig_0_4z[8], celloutsig_0_4z[11] } = { celloutsig_0_2z[2], celloutsig_0_2z[2], celloutsig_0_2z[2], celloutsig_0_2z[0], celloutsig_0_2z[0], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z, in_data[81] } | { celloutsig_0_2z[2], in_data[90:89], celloutsig_0_2z[0], in_data[88], in_data[94:93], in_data[91], celloutsig_0_1z, in_data[92], in_data[95] };
  assign celloutsig_0_2z[1] = celloutsig_0_2z[2];
  assign celloutsig_0_4z[2] = celloutsig_0_4z[3];
  assign { out_data[128], out_data[106:96], out_data[32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_27z, celloutsig_0_28z };
endmodule
