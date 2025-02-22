/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [2:0] _00_;
  wire [8:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_18z;
  wire [3:0] celloutsig_0_23z;
  wire [2:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_2z;
  wire [4:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [12:0] celloutsig_0_6z;
  wire [6:0] celloutsig_0_7z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [2:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [3:0] celloutsig_1_15z;
  reg [17:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire [37:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  reg [3:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [12:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_7z = !(celloutsig_1_1z[25] ? celloutsig_1_1z[26] : celloutsig_1_4z[0]);
  assign celloutsig_0_18z = !(celloutsig_0_14z ? celloutsig_0_16z : celloutsig_0_6z[4]);
  assign celloutsig_0_2z = !(in_data[43] ? celloutsig_0_0z[1] : celloutsig_0_0z[4]);
  assign celloutsig_1_9z = ~((celloutsig_1_2z | celloutsig_1_2z) & (celloutsig_1_0z | celloutsig_1_6z));
  assign celloutsig_0_25z = ~((celloutsig_0_18z | celloutsig_0_23z[3]) & (celloutsig_0_15z | celloutsig_0_24z[0]));
  assign celloutsig_1_3z = ~((celloutsig_1_2z | in_data[177]) & (in_data[124] | celloutsig_1_1z[2]));
  assign celloutsig_1_2z = in_data[131] | ~(celloutsig_1_1z[4]);
  assign celloutsig_1_0z = in_data[183] | in_data[173];
  assign celloutsig_1_6z = ~(celloutsig_1_1z[27] ^ celloutsig_1_1z[8]);
  assign celloutsig_1_18z = ~(celloutsig_1_1z[10] ^ celloutsig_1_13z[0]);
  always_ff @(negedge celloutsig_1_19z[0], posedge clkin_data[0])
    if (clkin_data[0]) _00_ <= 3'h0;
    else _00_ <= { celloutsig_0_0z[7:6], celloutsig_0_4z };
  assign celloutsig_0_0z = in_data[55:47] & in_data[9:1];
  assign celloutsig_0_3z = in_data[47:43] / { 1'h1, in_data[46:44], in_data[0] };
  assign celloutsig_1_15z = in_data[114:111] / { 1'h1, celloutsig_1_7z, celloutsig_1_14z, celloutsig_1_11z };
  assign celloutsig_1_11z = celloutsig_1_8z[9:6] === celloutsig_1_1z[12:9];
  assign celloutsig_0_10z = celloutsig_0_0z[3:1] === celloutsig_0_6z[10:8];
  assign celloutsig_0_15z = { celloutsig_0_7z[1:0], celloutsig_0_11z, celloutsig_0_5z } === { celloutsig_0_3z[4:2], celloutsig_0_12z };
  assign celloutsig_1_14z = celloutsig_1_8z[12:10] || { celloutsig_1_8z[2], celloutsig_1_11z, celloutsig_1_0z };
  assign celloutsig_0_11z = celloutsig_0_2z & ~(in_data[67]);
  assign celloutsig_0_7z = celloutsig_0_6z[12:6] % { 1'h1, celloutsig_0_0z[7:3], celloutsig_0_4z };
  assign celloutsig_1_8z = in_data[129] ? { in_data[176:170], celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_7z } : { in_data[174:173], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_6z };
  assign celloutsig_0_6z = celloutsig_0_5z ? { celloutsig_0_0z[4:0], celloutsig_0_0z[8:4], 1'h1, celloutsig_0_4z, 1'h1 } : in_data[62:50];
  assign celloutsig_0_23z = celloutsig_0_14z ? in_data[21:18] : { in_data[25:24], celloutsig_0_13z, celloutsig_0_12z };
  assign celloutsig_0_12z = { celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_10z } !== celloutsig_0_6z[6:4];
  assign celloutsig_0_13z = { in_data[81:78], celloutsig_0_10z } !== { celloutsig_0_0z[1:0], celloutsig_0_0z[8:7], celloutsig_0_4z };
  assign celloutsig_1_12z = | celloutsig_1_1z[27:20];
  assign celloutsig_0_4z = | { in_data[75:65], celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_0_14z = | { in_data[59:54], celloutsig_0_10z };
  assign celloutsig_1_5z = celloutsig_1_3z & celloutsig_1_2z;
  assign celloutsig_0_5z = | celloutsig_0_0z[4:1];
  assign celloutsig_0_16z = ~^ _00_;
  assign celloutsig_1_13z = { celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_9z } >> celloutsig_1_4z[2:0];
  assign celloutsig_0_24z = celloutsig_0_7z[5:3] >> { celloutsig_0_0z[4:3], celloutsig_0_2z };
  assign celloutsig_1_19z = { celloutsig_1_17z[14:9], celloutsig_1_15z, celloutsig_1_9z } - { in_data[138:137], celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_12z, celloutsig_1_2z, celloutsig_1_13z, celloutsig_1_7z, celloutsig_1_9z };
  assign celloutsig_1_1z = { in_data[165:129], celloutsig_1_0z } - { in_data[166:130], celloutsig_1_0z };
  always_latch
    if (clkin_data[64]) celloutsig_1_17z = 18'h00000;
    else if (!clkin_data[96]) celloutsig_1_17z = { celloutsig_1_11z, celloutsig_1_6z, celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_0z };
  always_latch
    if (clkin_data[32]) celloutsig_1_4z = 4'h0;
    else if (!clkin_data[96]) celloutsig_1_4z = { celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z };
  assign { out_data[128], out_data[106:96], out_data[34:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_24z, celloutsig_0_25z };
endmodule
