/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [4:0] celloutsig_0_12z;
  wire celloutsig_0_14z;
  reg [18:0] celloutsig_0_1z;
  reg [6:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [2:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [20:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [6:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [9:0] celloutsig_1_5z;
  wire [3:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [5:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = ~celloutsig_0_2z[2];
  assign celloutsig_0_4z = ~in_data[64];
  assign celloutsig_0_6z = ~((celloutsig_0_2z[2] | celloutsig_0_0z) & (in_data[87] | celloutsig_0_1z[2]));
  assign celloutsig_0_7z = ~((celloutsig_0_4z | celloutsig_0_4z) & (in_data[16] | celloutsig_0_1z[0]));
  assign celloutsig_0_11z = ~((celloutsig_0_6z | celloutsig_0_10z) & (celloutsig_0_2z[0] | in_data[61]));
  assign celloutsig_0_22z = ~((celloutsig_0_3z | celloutsig_0_4z) & (celloutsig_0_0z | celloutsig_0_21z[6]));
  assign celloutsig_1_7z = ~((celloutsig_1_5z[4] | celloutsig_1_1z) & (celloutsig_1_5z[8] | celloutsig_1_0z[17]));
  assign celloutsig_0_0z = in_data[95:92] == in_data[34:31];
  assign celloutsig_0_14z = { celloutsig_0_1z[15:4], celloutsig_0_7z, celloutsig_0_9z } >= { celloutsig_0_2z[2], celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_2z[2], celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_2z[2] };
  assign celloutsig_1_4z = { celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_2z } >= { celloutsig_1_0z[10], celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_10z = { celloutsig_1_0z[18:17], celloutsig_1_7z, celloutsig_1_8z } <= celloutsig_1_5z[7:4];
  assign celloutsig_0_8z = ! { in_data[66:63], celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_9z = ! { celloutsig_0_6z, celloutsig_0_2z[2], celloutsig_0_0z };
  assign celloutsig_1_1z = ! in_data[127:125];
  assign celloutsig_1_19z = celloutsig_1_12z[5] & ~(celloutsig_1_18z[0]);
  assign celloutsig_1_6z = ~ in_data[181:178];
  assign celloutsig_1_18z = { celloutsig_1_6z[3:2], celloutsig_1_4z, celloutsig_1_8z } | celloutsig_1_6z;
  assign celloutsig_0_2z = celloutsig_0_1z[4:2] | { in_data[28:27], celloutsig_0_0z };
  assign celloutsig_1_5z = { celloutsig_1_0z[17:10], celloutsig_1_4z, celloutsig_1_1z } | celloutsig_1_0z[14:5];
  assign celloutsig_1_3z = | { in_data[181:180], celloutsig_1_1z };
  assign celloutsig_1_8z = celloutsig_1_4z & celloutsig_1_7z;
  assign celloutsig_0_10z = celloutsig_0_7z & celloutsig_0_8z;
  assign celloutsig_1_2z = celloutsig_1_1z & in_data[133];
  assign celloutsig_0_12z = { celloutsig_0_1z[11:10], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_2z[2] } ~^ { celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_8z };
  assign celloutsig_1_0z = in_data[135:115] ~^ in_data[187:167];
  always_latch
    if (!clkin_data[64]) celloutsig_0_1z = 19'h00000;
    else if (!celloutsig_1_19z) celloutsig_0_1z = { in_data[18:2], celloutsig_0_0z, celloutsig_0_0z };
  always_latch
    if (clkin_data[32]) celloutsig_0_21z = 7'h00;
    else if (!celloutsig_1_19z) celloutsig_0_21z = { in_data[24:19], celloutsig_0_14z };
  assign { celloutsig_1_9z[0], celloutsig_1_12z[1], celloutsig_1_9z[5:3] } = { celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_0z[18:16] } ~^ { celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_0z[17:15] };
  assign { celloutsig_1_12z[0], celloutsig_1_12z[5:3], celloutsig_1_12z[6] } = { celloutsig_1_9z[0], celloutsig_1_9z[5:3], in_data[132] } & { celloutsig_1_10z, celloutsig_1_6z[3:1], celloutsig_1_0z[0] };
  assign celloutsig_1_12z[2] = celloutsig_1_6z[0];
  assign celloutsig_1_9z[2:1] = { 1'h1, celloutsig_1_12z[1] };
  assign { out_data[131:128], out_data[96], out_data[38:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_21z, celloutsig_0_22z };
endmodule
