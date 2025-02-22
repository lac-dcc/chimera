/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [3:0] celloutsig_0_0z;
  reg [5:0] celloutsig_0_10z;
  wire [8:0] celloutsig_0_17z;
  wire [7:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  reg [24:0] celloutsig_0_5z;
  wire [7:0] celloutsig_0_6z;
  wire [6:0] celloutsig_0_7z;
  wire [10:0] celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire [8:0] celloutsig_1_10z;
  wire [4:0] celloutsig_1_11z;
  wire [10:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [5:0] celloutsig_1_15z;
  wire [5:0] celloutsig_1_17z;
  wire [17:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [18:0] celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire [10:0] celloutsig_1_6z;
  reg [3:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = ~((celloutsig_0_1z | celloutsig_0_0z[2]) & (celloutsig_0_0z[2] | in_data[89]));
  assign celloutsig_1_19z = ~((celloutsig_1_6z[10] | celloutsig_1_15z[1]) & (celloutsig_1_4z | celloutsig_1_18z[5]));
  assign celloutsig_0_4z = ~((celloutsig_0_1z | celloutsig_0_0z[2]) & (celloutsig_0_3z | celloutsig_0_1z));
  assign celloutsig_0_17z = { celloutsig_0_6z[5:4], celloutsig_0_10z, celloutsig_0_4z } & in_data[58:50];
  assign celloutsig_1_1z = { in_data[186:169], celloutsig_1_0z } & in_data[150:132];
  assign celloutsig_1_5z = { celloutsig_1_0z, celloutsig_1_2z } & { in_data[124:122], celloutsig_1_4z };
  assign celloutsig_1_4z = { in_data[143:142], celloutsig_1_0z, celloutsig_1_2z } >= celloutsig_1_1z[18:13];
  assign celloutsig_1_14z = celloutsig_1_0z & ~(celloutsig_1_5z[0]);
  assign celloutsig_1_8z = celloutsig_1_5z[3] & ~(celloutsig_1_7z[1]);
  assign celloutsig_0_0z = in_data[11:8] * in_data[95:92];
  assign celloutsig_1_11z = celloutsig_1_1z[6:2] * { celloutsig_1_6z[7:5], celloutsig_1_4z, celloutsig_1_8z };
  assign celloutsig_1_15z = { celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_7z } * { celloutsig_1_2z[2:1], celloutsig_1_5z };
  assign celloutsig_1_2z = celloutsig_1_1z[2:0] * celloutsig_1_1z[12:10];
  assign celloutsig_1_13z = { celloutsig_1_5z[1:0], celloutsig_1_11z, celloutsig_1_5z } !== { celloutsig_1_11z[2:1], celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_7z };
  assign celloutsig_1_9z = celloutsig_1_2z !== { celloutsig_1_6z[2:1], celloutsig_1_6z[8] };
  assign celloutsig_1_12z = { celloutsig_1_10z[7:1], celloutsig_1_9z, celloutsig_1_2z } | { celloutsig_1_1z[10:1], celloutsig_1_0z };
  assign celloutsig_1_17z = { celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_0z } | { celloutsig_1_6z[7:6], celloutsig_1_14z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_1_18z = { celloutsig_1_10z[1], celloutsig_1_12z, celloutsig_1_17z } | { celloutsig_1_12z[1:0], celloutsig_1_7z, celloutsig_1_13z, celloutsig_1_10z, celloutsig_1_0z, celloutsig_1_14z };
  assign celloutsig_0_8z = { celloutsig_0_6z[6:0], celloutsig_0_0z } | { celloutsig_0_7z[5:3], celloutsig_0_4z, celloutsig_0_7z };
  assign celloutsig_0_18z = celloutsig_0_17z[8:1] | in_data[61:54];
  assign celloutsig_0_1z = celloutsig_0_0z[2] & celloutsig_0_0z[1];
  assign celloutsig_1_0z = in_data[146] & in_data[114];
  assign celloutsig_0_6z = { in_data[89:83], celloutsig_0_1z } << celloutsig_0_5z[20:13];
  assign celloutsig_0_7z = celloutsig_0_5z[15:9] << { celloutsig_0_6z[5:0], celloutsig_0_1z };
  assign celloutsig_1_10z = { celloutsig_1_6z[7:1], celloutsig_1_6z[8], celloutsig_1_8z } << celloutsig_1_6z[9:1];
  always_latch
    if (celloutsig_1_19z) celloutsig_0_5z = 25'h0000000;
    else if (clkin_data[0]) celloutsig_0_5z = { in_data[93:72], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_10z = 6'h00;
    else if (!clkin_data[0]) celloutsig_0_10z = celloutsig_0_8z[9:4];
  always_latch
    if (clkin_data[64]) celloutsig_1_7z = 4'h0;
    else if (!clkin_data[32]) celloutsig_1_7z = { in_data[129], celloutsig_1_2z };
  assign { celloutsig_1_6z[3], celloutsig_1_6z[6], celloutsig_1_6z[2], celloutsig_1_6z[10], celloutsig_1_6z[5], celloutsig_1_6z[1], celloutsig_1_6z[9], celloutsig_1_6z[4], celloutsig_1_6z[8:7] } = { celloutsig_1_4z, celloutsig_1_2z[2], celloutsig_1_2z[2], celloutsig_1_2z[2:1], celloutsig_1_2z[1], celloutsig_1_2z[1:0], celloutsig_1_2z[0], celloutsig_1_0z } | { celloutsig_1_2z[2], celloutsig_1_5z[2], celloutsig_1_2z[1], celloutsig_1_1z[7], celloutsig_1_5z[1], celloutsig_1_2z[0], celloutsig_1_0z, celloutsig_1_5z[0], celloutsig_1_0z, celloutsig_1_5z[3] };
  assign celloutsig_1_6z[0] = celloutsig_1_6z[8];
  assign { out_data[145:128], out_data[96], out_data[40:32], out_data[7:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_17z, celloutsig_0_18z };
endmodule
