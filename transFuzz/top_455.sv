/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [12:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [16:0] celloutsig_0_20z;
  wire [2:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [14:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [9:0] celloutsig_0_30z;
  wire celloutsig_0_32z;
  reg [6:0] celloutsig_0_34z;
  reg [2:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire celloutsig_0_55z;
  wire [21:0] celloutsig_0_59z;
  wire [10:0] celloutsig_0_5z;
  wire [16:0] celloutsig_0_6z;
  wire [5:0] celloutsig_0_74z;
  wire celloutsig_0_75z;
  wire celloutsig_0_7z;
  wire [4:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [6:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  reg [15:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire [10:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [9:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_1z = ~(in_data[127] & celloutsig_1_0z[2]);
  assign celloutsig_1_2z = ~(in_data[133] & celloutsig_1_0z[6]);
  assign celloutsig_1_3z = ~(in_data[155] & in_data[155]);
  assign celloutsig_0_2z = ~(in_data[68] & celloutsig_0_0z);
  assign celloutsig_0_28z = ~(celloutsig_0_13z & celloutsig_0_9z);
  assign celloutsig_0_55z = ~(celloutsig_0_19z | celloutsig_0_0z);
  assign celloutsig_0_75z = ~(celloutsig_0_19z | celloutsig_0_59z[4]);
  assign celloutsig_1_15z = ~(celloutsig_1_14z[0] | celloutsig_1_2z);
  assign celloutsig_1_18z = ~((celloutsig_1_9z[0] | celloutsig_1_17z) & (celloutsig_1_9z[7] | celloutsig_1_5z[8]));
  assign celloutsig_0_9z = celloutsig_0_0z | ~(celloutsig_0_2z);
  assign celloutsig_0_1z = in_data[88] | ~(celloutsig_0_0z);
  assign celloutsig_0_17z = celloutsig_0_4z | ~(celloutsig_0_6z[2]);
  assign celloutsig_1_6z = { celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z } & { celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_3z };
  assign celloutsig_0_51z = { celloutsig_0_3z[2], celloutsig_0_13z, celloutsig_0_32z, celloutsig_0_13z } && celloutsig_0_12z[9:6];
  assign celloutsig_1_4z = { celloutsig_1_0z[2:1], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z } && { in_data[159:150], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_17z = { celloutsig_1_5z[4:1], celloutsig_1_2z, celloutsig_1_15z, celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_8z } && { celloutsig_1_5z[8:3], celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_2z };
  assign celloutsig_0_24z = { celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_1z } && { celloutsig_0_8z[0], celloutsig_0_15z, celloutsig_0_4z };
  assign celloutsig_0_25z = { in_data[40:39], celloutsig_0_4z } && celloutsig_0_20z[16:14];
  assign celloutsig_0_26z = celloutsig_0_23z && celloutsig_0_3z;
  assign celloutsig_0_32z = { celloutsig_0_11z, celloutsig_0_25z, celloutsig_0_28z, celloutsig_0_8z, celloutsig_0_13z } && { in_data[57:52], celloutsig_0_28z, celloutsig_0_1z, celloutsig_0_25z };
  assign celloutsig_1_7z = celloutsig_1_6z[8:2] < celloutsig_1_0z;
  assign celloutsig_1_11z = { celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_8z, celloutsig_1_10z, celloutsig_1_4z } < { celloutsig_1_9z[9:6], celloutsig_1_7z, celloutsig_1_10z };
  assign celloutsig_0_10z = celloutsig_0_8z[4:1] < { celloutsig_0_6z[14], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_1_8z = celloutsig_1_0z[2] & ~(celloutsig_1_7z);
  assign celloutsig_0_74z = { celloutsig_0_27z[4:1], celloutsig_0_25z, celloutsig_0_51z } * { celloutsig_0_34z[3:0], celloutsig_0_7z, celloutsig_0_55z };
  assign celloutsig_0_12z = { celloutsig_0_5z[7:4], celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_8z } * { celloutsig_0_6z[13:9], celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_10z };
  assign celloutsig_0_20z = { in_data[40:28], celloutsig_0_16z, celloutsig_0_0z } * { celloutsig_0_6z[14:2], celloutsig_0_10z, celloutsig_0_16z };
  assign celloutsig_0_23z = celloutsig_0_6z[6:4] * celloutsig_0_8z[2:0];
  assign celloutsig_0_27z = { celloutsig_0_5z[10:7], celloutsig_0_5z } * { celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_10z };
  assign celloutsig_0_8z = - { in_data[50:47], celloutsig_0_0z };
  assign celloutsig_1_14z = - celloutsig_1_6z[3:0];
  assign celloutsig_0_0z = in_data[13:8] !== in_data[74:69];
  assign celloutsig_1_10z = { celloutsig_1_0z[3:2], celloutsig_1_5z, celloutsig_1_1z } !== { celloutsig_1_3z, celloutsig_1_6z };
  assign celloutsig_1_19z = celloutsig_1_12z[13:7] !== { celloutsig_1_0z[5:1], celloutsig_1_8z, celloutsig_1_4z };
  assign celloutsig_0_11z = { celloutsig_0_6z[3:1], celloutsig_0_3z, celloutsig_0_4z } !== { celloutsig_0_5z[4:1], celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_7z };
  assign celloutsig_0_7z = ^ { in_data[42], celloutsig_0_3z };
  assign celloutsig_0_15z = ^ { celloutsig_0_6z[15:0], celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_7z };
  assign celloutsig_0_5z = { in_data[27:21], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_4z } >>> { celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_6z = { in_data[45:31], celloutsig_0_1z, celloutsig_0_1z } >>> { celloutsig_0_5z[10:6], celloutsig_0_5z, celloutsig_0_1z };
  assign celloutsig_1_0z = in_data[155:149] >>> in_data[129:123];
  assign celloutsig_0_16z = { celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_7z } >>> in_data[35:33];
  assign celloutsig_1_5z = in_data[138:130] ~^ { in_data[115:111], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_1_9z = { celloutsig_1_1z, celloutsig_1_5z } ~^ { celloutsig_1_6z[8:1], celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_0_59z = { celloutsig_0_34z[3:0], celloutsig_0_20z, celloutsig_0_11z } ^ { in_data[1], celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_51z };
  assign celloutsig_0_30z = celloutsig_0_5z[10:1] ^ { celloutsig_0_12z[2:1], celloutsig_0_15z, celloutsig_0_16z, celloutsig_0_19z, celloutsig_0_17z, celloutsig_0_24z, celloutsig_0_26z };
  assign celloutsig_0_4z = ~((celloutsig_0_1z & celloutsig_0_1z) | celloutsig_0_0z);
  assign celloutsig_0_13z = ~((celloutsig_0_1z & celloutsig_0_7z) | celloutsig_0_9z);
  assign celloutsig_0_19z = ~((in_data[38] & celloutsig_0_1z) | celloutsig_0_17z);
  always_latch
    if (clkin_data[64]) celloutsig_0_3z = 3'h0;
    else if (clkin_data[0]) celloutsig_0_3z = { in_data[34:33], celloutsig_0_1z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_34z = 7'h00;
    else if (celloutsig_1_19z) celloutsig_0_34z = { celloutsig_0_30z[8:3], celloutsig_0_24z };
  always_latch
    if (clkin_data[128]) celloutsig_1_12z = 16'h0000;
    else if (!clkin_data[32]) celloutsig_1_12z = { celloutsig_1_0z[4:0], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_11z };
  assign { out_data[128], out_data[96], out_data[37:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_74z, celloutsig_0_75z };
endmodule
