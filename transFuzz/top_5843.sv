/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  reg [5:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [5:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [4:0] celloutsig_0_22z;
  wire [10:0] celloutsig_0_24z;
  wire [17:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [18:0] celloutsig_0_30z;
  wire [2:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [4:0] celloutsig_0_34z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [6:0] celloutsig_0_5z;
  wire [2:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [3:0] celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire [17:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [8:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [5:0] celloutsig_1_19z;
  wire [4:0] celloutsig_1_1z;
  wire [13:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  reg [12:0] celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [14:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [6:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ~(in_data[90] | in_data[15]);
  assign celloutsig_0_3z = ~(celloutsig_0_2z | celloutsig_0_2z);
  assign celloutsig_0_28z = ~(celloutsig_0_26z[8] | celloutsig_0_14z[2]);
  assign celloutsig_0_4z = ~celloutsig_0_1z[4];
  assign celloutsig_0_10z = ~celloutsig_0_5z[4];
  assign celloutsig_1_18z = celloutsig_1_12z | ~(celloutsig_1_15z[7]);
  assign celloutsig_0_8z = celloutsig_0_4z | ~(celloutsig_0_5z[1]);
  assign celloutsig_0_20z = celloutsig_0_5z[2] | ~(celloutsig_0_1z[4]);
  assign celloutsig_0_7z = in_data[17:15] + { celloutsig_0_1z[1:0], celloutsig_0_2z };
  assign celloutsig_0_9z = celloutsig_0_1z[3:0] + { celloutsig_0_1z[5:3], celloutsig_0_8z };
  assign celloutsig_0_1z = { in_data[25:21], celloutsig_0_0z } + in_data[22:17];
  assign celloutsig_0_15z = celloutsig_0_5z[2:0] == { celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_11z };
  assign celloutsig_0_29z = { celloutsig_0_1z[2:1], celloutsig_0_14z, celloutsig_0_14z } == in_data[84:77];
  assign celloutsig_1_11z = in_data[170:147] >= { celloutsig_1_10z[15:0], celloutsig_1_8z, celloutsig_1_9z };
  assign celloutsig_1_12z = celloutsig_1_4z[12:2] < celloutsig_1_10z[17:7];
  assign celloutsig_0_17z = { celloutsig_0_1z[1:0], celloutsig_0_0z } < in_data[14:12];
  assign celloutsig_0_2z = celloutsig_0_1z < in_data[49:44];
  assign celloutsig_0_33z = celloutsig_0_17z & ~(celloutsig_0_32z[1]);
  assign celloutsig_1_0z = in_data[119:115] % { 1'h1, in_data[172:169] };
  assign celloutsig_1_2z = in_data[145:132] % { 1'h1, in_data[120:108] };
  assign celloutsig_1_7z = { celloutsig_1_2z[6:4], celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_1z } % { 1'h1, celloutsig_1_4z[8:0], celloutsig_1_0z };
  assign celloutsig_1_10z = { celloutsig_1_2z[7:2], celloutsig_1_9z, celloutsig_1_0z } % { 1'h1, in_data[133:117] };
  assign celloutsig_0_5z = { celloutsig_0_1z[4:0], celloutsig_0_4z, celloutsig_0_4z } % { 1'h1, in_data[11:7], celloutsig_0_0z };
  assign celloutsig_0_24z = { celloutsig_0_22z[2:0], celloutsig_0_0z, celloutsig_0_20z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_14z, celloutsig_0_15z } % { 1'h1, celloutsig_0_5z[3:1], celloutsig_0_5z };
  assign celloutsig_0_26z = { celloutsig_0_14z[2], celloutsig_0_18z, celloutsig_0_12z, celloutsig_0_24z, celloutsig_0_4z } % { 1'h1, celloutsig_0_5z[1], celloutsig_0_3z, celloutsig_0_20z, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_7z };
  assign celloutsig_0_30z = { celloutsig_0_26z[11:6], celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_29z, celloutsig_0_27z, celloutsig_0_3z, celloutsig_0_8z } % { 1'h1, celloutsig_0_13z[4:0], celloutsig_0_13z, celloutsig_0_28z, celloutsig_0_1z };
  assign celloutsig_1_19z = { celloutsig_1_11z, celloutsig_1_0z } * { celloutsig_1_1z[4:1], celloutsig_1_6z, celloutsig_1_11z };
  assign celloutsig_1_1z = - celloutsig_1_0z;
  assign celloutsig_1_9z = - { celloutsig_1_5z[6:2], celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_12z = - { in_data[16:14], celloutsig_0_2z };
  assign celloutsig_0_14z = - in_data[94:92];
  assign celloutsig_0_32z = - { celloutsig_0_14z[2:1], celloutsig_0_18z };
  assign celloutsig_0_27z = { celloutsig_0_12z, celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_0z } !== { celloutsig_0_10z, celloutsig_0_1z };
  assign celloutsig_0_34z = celloutsig_0_1z[5:1] >> { celloutsig_0_30z[8:7], celloutsig_0_14z };
  assign celloutsig_0_22z = { celloutsig_0_1z[3:2], celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_18z } >>> { celloutsig_0_9z[2:1], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_8z };
  assign celloutsig_1_5z = { celloutsig_1_0z[4:1], celloutsig_1_1z } ~^ { celloutsig_1_4z[12:5], celloutsig_1_3z };
  assign celloutsig_1_15z = { celloutsig_1_0z[3:1], celloutsig_1_12z, celloutsig_1_1z } ~^ { celloutsig_1_10z[7:0], celloutsig_1_12z };
  assign celloutsig_0_11z = ~((celloutsig_0_5z[4] & celloutsig_0_8z) | celloutsig_0_1z[2]);
  assign celloutsig_0_18z = ~((celloutsig_0_2z & celloutsig_0_3z) | celloutsig_0_12z[0]);
  always_latch
    if (!clkin_data[64]) celloutsig_1_4z = 13'h0000;
    else if (!clkin_data[32]) celloutsig_1_4z = { celloutsig_1_1z[2:0], celloutsig_1_1z, celloutsig_1_0z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_13z = 6'h00;
    else if (!clkin_data[0]) celloutsig_0_13z = { in_data[50:46], celloutsig_0_1z[4] };
  assign celloutsig_1_3z = ~((celloutsig_1_0z[0] & celloutsig_1_0z[1]) | (celloutsig_1_0z[0] & celloutsig_1_1z[1]));
  assign celloutsig_1_6z = ~((celloutsig_1_1z[2] & celloutsig_1_3z) | (celloutsig_1_4z[12] & celloutsig_1_4z[4]));
  assign celloutsig_1_8z = ~((celloutsig_1_7z[6] & celloutsig_1_4z[12]) | (celloutsig_1_2z[8] & celloutsig_1_3z));
  assign { out_data[128], out_data[101:96], out_data[32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_33z, celloutsig_0_34z };
endmodule
