/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [8:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [5:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [19:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [9:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [26:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [4:0] celloutsig_0_27z;
  wire [8:0] celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [5:0] celloutsig_0_30z;
  wire [6:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [9:0] celloutsig_0_36z;
  wire [12:0] celloutsig_0_37z;
  wire [10:0] celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire [17:0] celloutsig_0_4z;
  wire [3:0] celloutsig_0_50z;
  wire celloutsig_0_57z;
  reg [4:0] celloutsig_0_58z;
  reg [6:0] celloutsig_0_5z;
  wire [6:0] celloutsig_0_6z;
  wire [5:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [7:0] celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire [27:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_13z;
  wire [7:0] celloutsig_1_14z;
  wire [5:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire [4:0] celloutsig_1_1z;
  wire [11:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  reg [4:0] celloutsig_1_4z;
  wire [10:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [10:0] celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_57z = celloutsig_0_34z ? celloutsig_0_34z : celloutsig_0_37z[3];
  assign celloutsig_0_16z = celloutsig_0_3z ? celloutsig_0_12z : celloutsig_0_3z;
  assign celloutsig_1_7z = !(celloutsig_1_2z[1] ? in_data[157] : celloutsig_1_6z);
  assign celloutsig_0_0z = ~((in_data[50] | in_data[89]) & (in_data[79] | in_data[9]));
  assign celloutsig_0_13z = ~((celloutsig_0_9z | celloutsig_0_7z[5]) & (celloutsig_0_10z | celloutsig_0_8z));
  assign celloutsig_0_17z = ~((celloutsig_0_2z | celloutsig_0_3z) & (celloutsig_0_13z | in_data[57]));
  assign celloutsig_0_18z = ~((celloutsig_0_8z | celloutsig_0_10z) & (celloutsig_0_13z | celloutsig_0_0z));
  assign celloutsig_0_15z = celloutsig_0_10z | ~(celloutsig_0_10z);
  assign celloutsig_0_2z = celloutsig_0_1z | ~(celloutsig_0_0z);
  assign celloutsig_1_6z = celloutsig_1_5z[1] ^ celloutsig_1_5z[5];
  assign celloutsig_0_10z = celloutsig_0_6z[1] ^ celloutsig_0_3z;
  assign celloutsig_1_17z = ~(celloutsig_1_13z[3] ^ celloutsig_1_7z);
  assign celloutsig_0_26z = ~(celloutsig_0_22z ^ celloutsig_0_19z[5]);
  assign celloutsig_0_4z = { in_data[65:49], celloutsig_0_1z } + in_data[24:7];
  assign celloutsig_1_0z = in_data[135:128] + in_data[131:124];
  assign celloutsig_0_7z = { celloutsig_0_4z[10:9], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_2z } + celloutsig_0_4z[6:1];
  assign celloutsig_0_50z = { celloutsig_0_38z[2], celloutsig_0_26z, celloutsig_0_2z, celloutsig_0_21z } / { 1'h1, celloutsig_0_17z, celloutsig_0_12z, celloutsig_0_17z };
  assign celloutsig_0_11z = { celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_6z } / { 1'h1, in_data[94:87] };
  assign celloutsig_0_27z = { celloutsig_0_5z[5:4], celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_9z } / { 1'h1, celloutsig_0_20z[14], celloutsig_0_13z, celloutsig_0_21z, celloutsig_0_26z };
  assign celloutsig_0_36z = celloutsig_0_25z[9:0] / { 1'h1, celloutsig_0_4z[10:3], celloutsig_0_1z };
  assign celloutsig_1_3z = celloutsig_1_2z == { in_data[165:162], celloutsig_1_0z };
  assign celloutsig_0_22z = celloutsig_0_5z[5:0] == celloutsig_0_19z;
  assign celloutsig_0_14z = { celloutsig_0_5z[4:0], celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_13z, celloutsig_0_1z } <= { celloutsig_0_4z[17:4], celloutsig_0_8z, celloutsig_0_3z };
  assign celloutsig_0_3z = ! { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_18z = ! { celloutsig_1_9z[2], celloutsig_1_17z, celloutsig_1_9z, celloutsig_1_14z, celloutsig_1_11z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_17z, celloutsig_1_10z, celloutsig_1_15z };
  assign celloutsig_0_9z = ! { celloutsig_0_5z[2:0], celloutsig_0_0z };
  assign celloutsig_0_1z = ! { in_data[69:65], celloutsig_0_0z };
  assign celloutsig_0_21z = ! { celloutsig_0_4z[11:3], celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_34z = celloutsig_0_26z & ~(celloutsig_0_21z);
  assign celloutsig_1_2z = in_data[174] ? { celloutsig_1_0z[6:3], celloutsig_1_0z } : { in_data[120:114], celloutsig_1_1z };
  assign celloutsig_1_5z = celloutsig_1_2z[11] ? { celloutsig_1_0z[7:2], celloutsig_1_1z } : { celloutsig_1_4z[3], celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_1_9z = celloutsig_1_2z[8] ? celloutsig_1_4z[2:0] : celloutsig_1_0z[2:0];
  assign celloutsig_0_23z = celloutsig_0_2z ? { celloutsig_0_6z[2], celloutsig_0_15z, celloutsig_0_10z, 1'h1, celloutsig_0_19z } : { celloutsig_0_6z[5:0], celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_10z };
  assign celloutsig_0_28z = celloutsig_0_26z ? { celloutsig_0_22z, celloutsig_0_9z, celloutsig_0_14z, celloutsig_0_7z } : { in_data[15:9], celloutsig_0_13z, celloutsig_0_10z };
  assign celloutsig_0_8z = { in_data[80:72], celloutsig_0_2z, celloutsig_0_3z } !== { celloutsig_0_4z[13:4], celloutsig_0_1z };
  assign celloutsig_0_12z = & { celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_2z };
  assign celloutsig_0_24z = & { celloutsig_0_23z[3], celloutsig_0_17z, celloutsig_0_0z };
  assign celloutsig_0_37z = { celloutsig_0_19z[3:0], celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_30z } >> { celloutsig_0_25z[8:2], celloutsig_0_27z, celloutsig_0_22z };
  assign celloutsig_0_6z = { celloutsig_0_5z[5:1], celloutsig_0_1z, celloutsig_0_0z } >> { in_data[72:67], celloutsig_0_3z };
  assign celloutsig_1_11z = { celloutsig_1_10z[1:0], celloutsig_1_3z } << celloutsig_1_10z;
  assign celloutsig_0_33z = { celloutsig_0_7z[4:0], celloutsig_0_9z, celloutsig_0_8z } <<< { celloutsig_0_7z[5:2], celloutsig_0_26z, celloutsig_0_0z, celloutsig_0_9z };
  assign celloutsig_0_38z = { celloutsig_0_33z[5:3], celloutsig_0_5z, celloutsig_0_2z } <<< { celloutsig_0_28z, celloutsig_0_21z, celloutsig_0_14z };
  assign celloutsig_1_8z = celloutsig_1_2z[10:0] <<< { celloutsig_1_5z[10:8], celloutsig_1_0z };
  assign celloutsig_1_12z = { in_data[176:159], celloutsig_1_1z, celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_6z } <<< { celloutsig_1_0z[3], celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_2z };
  assign celloutsig_1_15z = { celloutsig_1_9z[2:1], celloutsig_1_11z, celloutsig_1_7z } <<< { celloutsig_1_1z[4:3], celloutsig_1_13z };
  assign celloutsig_1_19z = celloutsig_1_9z <<< celloutsig_1_10z;
  assign celloutsig_0_20z = { celloutsig_0_19z[4:3], celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_16z, celloutsig_0_3z, celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_1z } <<< { celloutsig_0_6z[5:1], celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_18z, celloutsig_0_10z };
  assign celloutsig_0_25z = { celloutsig_0_6z[6:1], celloutsig_0_10z, celloutsig_0_24z, celloutsig_0_4z, celloutsig_0_14z } <<< { celloutsig_0_20z[11:0], celloutsig_0_19z, celloutsig_0_11z };
  assign celloutsig_0_30z = celloutsig_0_19z <<< celloutsig_0_4z[14:9];
  assign celloutsig_1_1z = celloutsig_1_0z[4:0] >>> celloutsig_1_0z[5:1];
  assign celloutsig_1_13z = { celloutsig_1_0z[2:0], celloutsig_1_7z } >>> celloutsig_1_12z[21:18];
  assign celloutsig_1_14z = celloutsig_1_12z[24:17] >>> { celloutsig_1_2z[2:0], celloutsig_1_1z };
  assign celloutsig_1_10z = { celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_6z } - celloutsig_1_0z[6:4];
  assign celloutsig_0_19z = celloutsig_0_7z ~^ { in_data[69:66], celloutsig_0_13z, celloutsig_0_14z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_5z = 7'h00;
    else if (!clkin_data[0]) celloutsig_0_5z = in_data[66:60];
  always_latch
    if (celloutsig_1_18z) celloutsig_0_58z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_58z = { celloutsig_0_36z[5], celloutsig_0_50z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_4z = 5'h00;
    else if (clkin_data[32]) celloutsig_1_4z = { celloutsig_1_0z[6:3], celloutsig_1_3z };
  assign { out_data[128], out_data[98:96], out_data[32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_57z, celloutsig_0_58z };
endmodule
