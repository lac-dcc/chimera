/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [9:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [7:0] celloutsig_0_19z;
  wire [7:0] celloutsig_0_1z;
  wire [5:0] celloutsig_0_22z;
  wire [3:0] celloutsig_0_23z;
  wire [2:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [5:0] celloutsig_0_30z;
  wire [2:0] celloutsig_0_32z;
  wire celloutsig_0_3z;
  wire [6:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [4:0] celloutsig_0_4z;
  wire [4:0] celloutsig_0_5z;
  reg [9:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  reg [27:0] celloutsig_0_8z;
  wire [6:0] celloutsig_0_9z;
  wire [13:0] celloutsig_1_0z;
  wire celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  reg [7:0] celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire [5:0] celloutsig_1_3z;
  wire [9:0] celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire [5:0] celloutsig_1_6z;
  wire celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_13z = !(celloutsig_0_11z ? celloutsig_0_2z : celloutsig_0_9z[2]);
  assign celloutsig_1_18z = ~((celloutsig_1_6z[3] | celloutsig_1_8z) & celloutsig_1_4z[9]);
  assign celloutsig_1_19z = ~((celloutsig_1_14z | celloutsig_1_1z[6]) & in_data[119]);
  assign celloutsig_0_11z = ~((celloutsig_0_1z[4] | celloutsig_0_5z[1]) & in_data[89]);
  assign celloutsig_0_15z = ~((celloutsig_0_8z[12] | celloutsig_0_7z) & celloutsig_0_14z);
  assign celloutsig_0_30z = celloutsig_0_6z[9:4] + { celloutsig_0_8z[22:18], celloutsig_0_11z };
  assign celloutsig_1_6z = celloutsig_1_1z[7:2] + celloutsig_1_0z[5:0];
  assign celloutsig_0_5z = celloutsig_0_1z[4:0] + celloutsig_0_4z;
  assign celloutsig_0_22z = { celloutsig_0_5z[2:0], celloutsig_0_15z, celloutsig_0_3z, celloutsig_0_13z } + in_data[13:8];
  assign celloutsig_0_23z = { celloutsig_0_22z[3:1], celloutsig_0_10z } + { celloutsig_0_1z[3:1], celloutsig_0_17z };
  assign celloutsig_0_29z = { celloutsig_0_22z[5:4], celloutsig_0_16z } & celloutsig_0_1z[5:3];
  assign celloutsig_0_41z = { celloutsig_0_19z[7:4], celloutsig_0_32z } & celloutsig_0_8z[19:13];
  assign celloutsig_1_0z = in_data[128:115] & in_data[124:111];
  assign celloutsig_0_1z = celloutsig_0_0z[9:2] & in_data[88:81];
  assign celloutsig_0_17z = { celloutsig_0_1z[1:0], celloutsig_0_5z, celloutsig_0_15z, celloutsig_0_15z } && { celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_14z };
  assign celloutsig_0_7z = in_data[77] & ~(celloutsig_0_2z);
  assign celloutsig_0_32z = celloutsig_0_29z * celloutsig_0_23z[3:1];
  assign celloutsig_0_16z = { celloutsig_0_1z[7:2], celloutsig_0_12z, celloutsig_0_1z } != { celloutsig_0_6z[9:1], celloutsig_0_4z, celloutsig_0_13z };
  assign celloutsig_0_2z = celloutsig_0_1z[7:3] != celloutsig_0_0z[5:1];
  assign celloutsig_1_14z = & in_data[131:129];
  assign celloutsig_0_42z = ^ { celloutsig_0_30z[5:2], celloutsig_0_2z };
  assign celloutsig_1_8z = ^ { celloutsig_1_0z[13:7], celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_4z[9:6], 6'h3f, celloutsig_1_3z, celloutsig_1_5z };
  assign celloutsig_0_14z = ^ { celloutsig_0_0z[7:1], celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_1_3z = celloutsig_1_1z[6:1] << in_data[115:110];
  assign celloutsig_1_5z = { celloutsig_1_3z[5:3], celloutsig_1_3z } << in_data[153:145];
  assign celloutsig_0_19z = { celloutsig_0_8z[22:16], celloutsig_0_16z } <<< { celloutsig_0_4z[2:0], celloutsig_0_4z };
  assign celloutsig_1_2z = celloutsig_1_0z[13:7] >>> in_data[188:182];
  assign celloutsig_0_9z = celloutsig_0_6z[7:1] >>> celloutsig_0_6z[6:0];
  assign celloutsig_0_4z = { celloutsig_0_1z[3:1], celloutsig_0_3z, celloutsig_0_2z } ~^ in_data[77:73];
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_0z = 10'h000;
    else if (!clkin_data[0]) celloutsig_0_0z = in_data[30:21];
  always_latch
    if (clkin_data[64]) celloutsig_1_1z = 8'h00;
    else if (clkin_data[32]) celloutsig_1_1z = celloutsig_1_0z[10:3];
  always_latch
    if (celloutsig_1_19z) celloutsig_0_6z = 10'h000;
    else if (!clkin_data[0]) celloutsig_0_6z = { celloutsig_0_0z[8:4], celloutsig_0_5z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_8z = 28'h0000000;
    else if (!clkin_data[0]) celloutsig_0_8z = { in_data[50:28], celloutsig_0_4z };
  assign celloutsig_0_3z = ~((celloutsig_0_2z & in_data[0]) | (celloutsig_0_2z & celloutsig_0_2z));
  assign celloutsig_0_10z = ~((celloutsig_0_1z[0] & celloutsig_0_8z[21]) | (celloutsig_0_0z[4] & celloutsig_0_2z));
  assign celloutsig_0_12z = ~((celloutsig_0_4z[4] & celloutsig_0_5z[3]) | (celloutsig_0_8z[21] & celloutsig_0_8z[2]));
  assign celloutsig_1_4z[9:6] = celloutsig_1_2z[4:1] ~^ celloutsig_1_0z[9:6];
  assign celloutsig_1_4z[5:0] = 6'h3f;
  assign { out_data[128], out_data[96], out_data[38:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_41z, celloutsig_0_42z };
endmodule
