/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [2:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [13:0] celloutsig_0_17z;
  reg [7:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [19:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [12:0] celloutsig_0_5z;
  reg [8:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  reg [8:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [6:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  reg [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [33:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [11:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_7z = ~(celloutsig_1_6z[26] & in_data[145]);
  assign celloutsig_1_8z = ~(celloutsig_1_0z[4] & celloutsig_1_0z[4]);
  assign celloutsig_1_10z = ~(in_data[174] & celloutsig_1_4z);
  assign celloutsig_1_12z = ~(celloutsig_1_5z & celloutsig_1_0z[8]);
  assign celloutsig_1_14z = ~(celloutsig_1_4z & celloutsig_1_1z);
  assign celloutsig_1_18z = ~(celloutsig_1_16z & celloutsig_1_3z);
  assign celloutsig_0_8z = ~(celloutsig_0_0z & celloutsig_0_4z);
  assign celloutsig_0_9z = ~(celloutsig_0_4z & celloutsig_0_2z);
  assign celloutsig_0_11z = ~(celloutsig_0_10z & celloutsig_0_4z);
  assign celloutsig_1_3z = ~(celloutsig_1_2z[1] & celloutsig_1_2z[0]);
  assign celloutsig_1_16z = ~celloutsig_1_4z;
  assign celloutsig_0_7z = ~celloutsig_0_5z[1];
  assign celloutsig_0_10z = ~in_data[67];
  assign celloutsig_0_20z = ~celloutsig_0_11z;
  assign celloutsig_1_5z = ~((celloutsig_1_4z | celloutsig_1_0z[8]) & celloutsig_1_1z);
  assign celloutsig_0_3z = ~((celloutsig_0_0z | celloutsig_0_0z) & celloutsig_0_2z);
  assign celloutsig_0_12z = ~((celloutsig_0_4z | celloutsig_0_11z) & celloutsig_0_11z);
  assign celloutsig_0_13z = ~((celloutsig_0_7z | celloutsig_0_12z) & celloutsig_0_2z);
  assign celloutsig_0_15z = ~((celloutsig_0_0z | celloutsig_0_0z) & celloutsig_0_7z);
  assign celloutsig_0_16z = ~((celloutsig_0_7z | in_data[37]) & celloutsig_0_5z[9]);
  assign celloutsig_0_19z = ~((celloutsig_0_11z | celloutsig_0_3z) & celloutsig_0_8z);
  assign celloutsig_1_4z = ~((celloutsig_1_0z[8] | celloutsig_1_0z[3]) & celloutsig_1_2z[0]);
  assign celloutsig_0_0z = ~((in_data[17] | in_data[92]) & (in_data[35] | in_data[67]));
  assign celloutsig_1_11z = ~((celloutsig_1_1z | celloutsig_1_4z) & (celloutsig_1_10z | celloutsig_1_0z[1]));
  assign celloutsig_0_22z = ~((celloutsig_0_2z | celloutsig_0_11z) & (celloutsig_0_15z | celloutsig_0_3z));
  always_ff @(posedge clkin_data[96], negedge clkin_data[64])
    if (!clkin_data[64]) _00_ <= 3'h0;
    else _00_ <= { celloutsig_1_9z[3:2], celloutsig_1_12z };
  assign celloutsig_0_2z = celloutsig_0_1z[12:8] >= { in_data[54:53], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_15z = { celloutsig_1_13z[6], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_11z, celloutsig_1_12z, celloutsig_1_8z, celloutsig_1_11z, celloutsig_1_12z, celloutsig_1_13z } >= celloutsig_1_6z[33:17];
  assign celloutsig_1_19z = { celloutsig_1_6z[13:6], celloutsig_1_3z, celloutsig_1_15z, celloutsig_1_14z, celloutsig_1_18z, _00_, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_18z, celloutsig_1_8z, celloutsig_1_4z } >= { celloutsig_1_9z[6:0], celloutsig_1_15z, celloutsig_1_13z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_2z };
  assign celloutsig_0_4z = celloutsig_0_1z[19:4] >= { in_data[24:10], celloutsig_0_3z };
  assign celloutsig_0_21z = { celloutsig_0_1z[15:6], celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_12z } >= { celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_20z, celloutsig_0_18z, celloutsig_0_16z, celloutsig_0_19z };
  assign celloutsig_1_1z = celloutsig_1_0z[8:1] >= in_data[173:166];
  assign celloutsig_1_6z = celloutsig_1_5z ? { in_data[168:139], 1'h1, celloutsig_1_2z } : { celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_0z, 1'h0, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_9z = celloutsig_1_7z ? in_data[158:147] : { celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_1_13z = celloutsig_1_7z ? { celloutsig_1_9z[5:0], celloutsig_1_8z } : { celloutsig_1_0z[5:0], celloutsig_1_12z };
  assign celloutsig_0_5z = celloutsig_0_3z ? { in_data[10:2], 2'h3, celloutsig_0_2z, celloutsig_0_2z } : in_data[24:12];
  assign celloutsig_0_1z = in_data[2] ? in_data[73:54] : in_data[67:48];
  assign celloutsig_0_17z = celloutsig_0_5z[2] ? { celloutsig_0_5z[12:3], 1'h1, celloutsig_0_5z[1:0], celloutsig_0_9z } : { in_data[64:54], celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_13z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_6z = 9'h000;
    else if (celloutsig_1_19z) celloutsig_0_6z = celloutsig_0_5z[9:1];
  always_latch
    if (!clkin_data[32]) celloutsig_0_18z = 8'h00;
    else if (!celloutsig_1_19z) celloutsig_0_18z = celloutsig_0_17z[13:6];
  always_latch
    if (!clkin_data[64]) celloutsig_1_0z = 9'h000;
    else if (!clkin_data[0]) celloutsig_1_0z = in_data[122:114];
  always_latch
    if (!clkin_data[64]) celloutsig_1_2z = 3'h0;
    else if (clkin_data[0]) celloutsig_1_2z = in_data[124:122];
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_21z, celloutsig_0_22z };
endmodule
