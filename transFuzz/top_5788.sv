/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [11:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [5:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [20:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [16:0] celloutsig_0_1z;
  reg [2:0] celloutsig_0_21z;
  wire [13:0] celloutsig_0_22z;
  wire [7:0] celloutsig_0_2z;
  reg [11:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  reg [11:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire [5:0] celloutsig_1_13z;
  wire [2:0] celloutsig_1_14z;
  wire [15:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [4:0] celloutsig_1_19z;
  wire [16:0] celloutsig_1_1z;
  wire [11:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire [3:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  reg [5:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_6z = ~(celloutsig_1_0z & celloutsig_1_0z);
  assign celloutsig_1_12z = ~(celloutsig_1_7z[2] & in_data[183]);
  assign celloutsig_0_7z = ~(celloutsig_0_3z[10] & celloutsig_0_6z);
  assign celloutsig_1_17z = ~((celloutsig_1_1z[13] | celloutsig_1_16z[15]) & (celloutsig_1_4z | celloutsig_1_12z));
  assign celloutsig_0_17z = ~((celloutsig_0_1z[7] | celloutsig_0_12z[1]) & (celloutsig_0_9z[1] | celloutsig_0_3z[9]));
  assign celloutsig_1_3z = ~((celloutsig_1_2z[7] | in_data[176]) & (celloutsig_1_0z | celloutsig_1_2z[4]));
  assign celloutsig_0_19z = ~(celloutsig_0_6z ^ celloutsig_0_18z[16]);
  assign celloutsig_1_1z = in_data[169:153] & in_data[156:140];
  assign celloutsig_1_10z = { celloutsig_1_1z[12:8], celloutsig_1_9z } === { celloutsig_1_2z[9:0], celloutsig_1_3z };
  assign celloutsig_1_4z = { in_data[189:175], celloutsig_1_3z } === { celloutsig_1_1z[16:13], celloutsig_1_2z };
  assign celloutsig_1_0z = in_data[153:151] <= in_data[118:116];
  assign celloutsig_0_0z = in_data[70:65] || in_data[42:37];
  assign celloutsig_0_5z = celloutsig_0_3z[10:1] || celloutsig_0_1z[14:5];
  assign celloutsig_0_13z = { celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_10z } || celloutsig_0_2z[5:3];
  assign celloutsig_0_4z = { celloutsig_0_0z, celloutsig_0_3z } < { in_data[25:21], celloutsig_0_2z };
  assign celloutsig_0_6z = { in_data[14:5], celloutsig_0_4z } < { celloutsig_0_1z[12:3], celloutsig_0_0z };
  assign celloutsig_0_14z = celloutsig_0_1z[8:5] < celloutsig_0_1z[7:4];
  assign celloutsig_0_15z = { celloutsig_0_1z[11:5], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_10z } < { celloutsig_0_2z[6:2], celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_9z };
  assign celloutsig_1_8z = celloutsig_1_1z[6] & ~(celloutsig_1_1z[6]);
  assign celloutsig_0_12z = { celloutsig_0_9z[11:1], celloutsig_0_8z } % { 1'h1, celloutsig_0_2z[2:0], celloutsig_0_2z };
  assign celloutsig_0_18z = { celloutsig_0_0z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_17z, celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_17z, celloutsig_0_5z } % { 1'h1, celloutsig_0_3z[9:0], celloutsig_0_16z, celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_10z };
  assign celloutsig_1_2z = in_data[147:136] % { 1'h1, celloutsig_1_1z[13:3] };
  assign celloutsig_0_1z[16:3] = in_data[3] ? in_data[41:28] : in_data[78:65];
  assign celloutsig_0_8z = { celloutsig_0_2z[5:3], celloutsig_0_5z } !== celloutsig_0_2z[3:0];
  assign celloutsig_1_19z = ~ celloutsig_1_9z[4:0];
  assign celloutsig_0_22z = ~ { celloutsig_0_18z[9:4], celloutsig_0_7z, celloutsig_0_21z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_19z };
  assign celloutsig_1_18z = ^ { celloutsig_1_1z[14:12], celloutsig_1_17z, celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_8z };
  assign celloutsig_1_7z = { celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } - { celloutsig_1_2z[5:4], celloutsig_1_4z, celloutsig_1_0z };
  assign celloutsig_1_13z = { celloutsig_1_1z[15], celloutsig_1_6z, celloutsig_1_7z } - { celloutsig_1_1z[11:7], celloutsig_1_10z };
  assign celloutsig_1_14z = { celloutsig_1_2z[2:1], celloutsig_1_3z } - { in_data[138:137], celloutsig_1_12z };
  assign celloutsig_1_16z = { celloutsig_1_2z[10:5], celloutsig_1_0z, celloutsig_1_14z, celloutsig_1_9z } - { celloutsig_1_13z[5:1], celloutsig_1_7z, celloutsig_1_13z, celloutsig_1_4z };
  assign celloutsig_0_2z = celloutsig_0_1z[10:3] - in_data[7:0];
  assign celloutsig_0_16z = { celloutsig_0_2z[4:3], celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_13z } ~^ in_data[82:77];
  always_latch
    if (clkin_data[32]) celloutsig_0_3z = 12'h000;
    else if (!celloutsig_1_18z) celloutsig_0_3z = celloutsig_0_1z[15:4];
  always_latch
    if (!clkin_data[64]) celloutsig_1_9z = 6'h00;
    else if (!clkin_data[0]) celloutsig_1_9z = celloutsig_1_2z[7:2];
  always_latch
    if (clkin_data[32]) celloutsig_0_9z = 12'h000;
    else if (!celloutsig_1_18z) celloutsig_0_9z = celloutsig_0_3z;
  always_latch
    if (!clkin_data[32]) celloutsig_0_21z = 3'h0;
    else if (celloutsig_1_18z) celloutsig_0_21z = { celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_15z };
  assign celloutsig_0_10z = ~((celloutsig_0_6z & celloutsig_0_1z[3]) | (celloutsig_0_4z & celloutsig_0_8z));
  assign celloutsig_0_11z = ~((celloutsig_0_7z & celloutsig_0_6z) | (celloutsig_0_7z & celloutsig_0_10z));
  assign celloutsig_0_1z[2:0] = { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign { out_data[128], out_data[100:96], out_data[34:32], out_data[13:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_21z, celloutsig_0_22z };
endmodule
