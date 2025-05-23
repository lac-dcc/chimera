/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [2:0] celloutsig_0_0z;
  wire [24:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  reg [11:0] celloutsig_0_12z;
  wire [7:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire [20:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire [4:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [6:0] celloutsig_0_21z;
  wire [5:0] celloutsig_0_22z;
  wire celloutsig_0_24z;
  wire [2:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [37:0] celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [7:0] celloutsig_0_30z;
  wire [2:0] celloutsig_0_32z;
  wire [4:0] celloutsig_0_34z;
  wire [7:0] celloutsig_0_37z;
  wire [3:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [29:0] celloutsig_0_48z;
  wire [4:0] celloutsig_0_49z;
  wire [8:0] celloutsig_0_4z;
  wire [3:0] celloutsig_0_58z;
  wire [8:0] celloutsig_0_5z;
  reg [9:0] celloutsig_0_66z;
  wire [14:0] celloutsig_0_6z;
  wire celloutsig_0_74z;
  wire celloutsig_0_75z;
  wire [3:0] celloutsig_0_7z;
  wire [3:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  wire [11:0] celloutsig_1_17z;
  wire [23:0] celloutsig_1_18z;
  wire [11:0] celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire [12:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [4:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_42z = !(celloutsig_0_11z ? celloutsig_0_37z[3] : celloutsig_0_34z[0]);
  assign celloutsig_0_75z = !(celloutsig_0_13z[2] ? celloutsig_0_19z[2] : celloutsig_0_30z[2]);
  assign celloutsig_1_2z = !(celloutsig_1_0z[0] ? in_data[113] : in_data[186]);
  assign celloutsig_1_3z = !(celloutsig_1_2z ? celloutsig_1_0z[2] : celloutsig_1_2z);
  assign celloutsig_1_6z = !(celloutsig_1_5z[7] ? in_data[182] : celloutsig_1_5z[3]);
  assign celloutsig_0_9z = !(celloutsig_0_1z ? celloutsig_0_3z[3] : celloutsig_0_3z[1]);
  assign celloutsig_0_11z = !(celloutsig_0_9z ? in_data[11] : celloutsig_0_5z[2]);
  assign celloutsig_0_16z = !(celloutsig_0_5z[2] ? celloutsig_0_13z[1] : celloutsig_0_1z);
  assign celloutsig_0_20z = !(celloutsig_0_19z[2] ? celloutsig_0_9z : celloutsig_0_13z[7]);
  assign celloutsig_0_2z = !(celloutsig_0_1z ? celloutsig_0_0z[1] : celloutsig_0_1z);
  assign celloutsig_0_24z = !(celloutsig_0_16z ? celloutsig_0_13z[6] : celloutsig_0_12z[6]);
  assign celloutsig_0_26z = !(celloutsig_0_10z[3] ? celloutsig_0_14z[1] : celloutsig_0_12z[9]);
  assign celloutsig_0_0z = in_data[13:11] / { 1'h1, in_data[20:19] };
  assign celloutsig_0_3z = { celloutsig_0_0z, celloutsig_0_1z } / { 1'h1, in_data[66:64] };
  assign celloutsig_0_34z = { celloutsig_0_4z[8:5], celloutsig_0_11z } / { 1'h1, celloutsig_0_22z[4:1] };
  assign celloutsig_0_48z = { in_data[65:45], celloutsig_0_19z, celloutsig_0_1z, celloutsig_0_16z, celloutsig_0_27z, celloutsig_0_9z } / { 1'h1, celloutsig_0_10z[22:3], 1'h1, celloutsig_0_20z, celloutsig_0_2z, celloutsig_0_26z, celloutsig_0_42z, celloutsig_0_14z, celloutsig_0_40z };
  assign celloutsig_0_13z = { celloutsig_0_7z[3:2], celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_9z } / { 1'h1, in_data[78:73], celloutsig_0_1z };
  assign celloutsig_0_14z = celloutsig_0_5z[3:1] / { 1'h1, celloutsig_0_6z[2:1] };
  assign celloutsig_0_28z = { celloutsig_0_1z, celloutsig_0_22z, celloutsig_0_21z, celloutsig_0_27z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_22z, celloutsig_0_25z } / { 1'h1, celloutsig_0_6z[13:1], celloutsig_0_15z, celloutsig_0_17z };
  assign celloutsig_0_6z = { in_data[72:67], celloutsig_0_5z } / { 1'h1, in_data[50:39], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_1z = in_data[162:159] / { 1'h1, celloutsig_1_0z[3:1] };
  assign celloutsig_1_10z = { celloutsig_1_4z[2:1], celloutsig_1_3z } / { 1'h1, celloutsig_1_0z[2], celloutsig_1_8z };
  assign celloutsig_1_18z = { in_data[133:111], celloutsig_1_8z } / { 1'h1, celloutsig_1_17z[11:1], 1'h1, celloutsig_1_7z, celloutsig_1_10z, celloutsig_1_10z };
  assign celloutsig_0_17z = celloutsig_0_5z[6:4] / { 1'h1, celloutsig_0_8z[1:0] };
  assign celloutsig_0_22z = { celloutsig_0_10z[17:13], celloutsig_0_9z } / { 1'h1, celloutsig_0_12z[10:6] };
  assign celloutsig_0_40z = celloutsig_0_21z[6:2] == celloutsig_0_37z[5:1];
  assign celloutsig_0_41z = celloutsig_0_30z[5:0] == { celloutsig_0_30z[7:6], celloutsig_0_11z, celloutsig_0_25z };
  assign celloutsig_0_74z = { celloutsig_0_66z[1], celloutsig_0_41z, celloutsig_0_11z } == celloutsig_0_58z[2:0];
  assign celloutsig_1_8z = in_data[111:101] == { in_data[183:180], celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_7z };
  assign celloutsig_1_9z = { celloutsig_1_5z[9:2], celloutsig_1_1z, celloutsig_1_4z } == { celloutsig_1_0z[3:2], celloutsig_1_5z };
  assign celloutsig_0_1z = { in_data[35:29], celloutsig_0_0z, celloutsig_0_0z } == in_data[78:66];
  assign celloutsig_0_27z = { celloutsig_0_26z, celloutsig_0_0z } == celloutsig_0_4z[5:2];
  assign celloutsig_0_4z = { in_data[83:79], celloutsig_0_3z } >> { in_data[90:83], celloutsig_0_2z };
  assign celloutsig_1_4z = { celloutsig_1_0z[2:1], celloutsig_1_2z } >> celloutsig_1_1z[2:0];
  assign celloutsig_0_15z = { celloutsig_0_4z[3:0], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_5z } >> in_data[62:42];
  assign celloutsig_0_25z = celloutsig_0_17z >> celloutsig_0_21z[3:1];
  assign celloutsig_0_30z = celloutsig_0_4z[7:0] ~^ { celloutsig_0_8z[2:0], celloutsig_0_27z, celloutsig_0_16z, celloutsig_0_25z };
  assign celloutsig_0_32z = { celloutsig_0_19z[3:2], celloutsig_0_24z } ~^ celloutsig_0_8z[2:0];
  assign celloutsig_0_37z = { celloutsig_0_22z[1:0], celloutsig_0_20z, celloutsig_0_19z } ~^ { celloutsig_0_28z[34:30], celloutsig_0_14z };
  assign celloutsig_0_49z = { celloutsig_0_28z[22:21], celloutsig_0_32z } ~^ { celloutsig_0_17z[2:1], celloutsig_0_17z };
  assign celloutsig_0_5z = { celloutsig_0_4z[8:1], celloutsig_0_2z } ~^ { in_data[74:71], celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_0_58z = celloutsig_0_15z[6:3] ~^ celloutsig_0_49z[4:1];
  assign celloutsig_0_7z = celloutsig_0_4z[8:5] ~^ { in_data[51:49], celloutsig_0_1z };
  assign celloutsig_1_0z = in_data[125:121] ~^ in_data[190:186];
  assign celloutsig_0_8z = { celloutsig_0_4z[8:6], celloutsig_0_1z } ~^ celloutsig_0_5z[4:1];
  assign celloutsig_1_5z = { in_data[164:157], celloutsig_1_0z } ~^ { celloutsig_1_0z[4:1], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_7z = { in_data[175:174], celloutsig_1_4z } ~^ { celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_19z = celloutsig_1_18z[18:7] ~^ { celloutsig_1_18z[20:11], celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_0_19z = { celloutsig_0_12z[9:6], celloutsig_0_11z } ~^ { celloutsig_0_6z[8:7], celloutsig_0_14z };
  assign celloutsig_0_21z = { celloutsig_0_14z, celloutsig_0_7z } ~^ celloutsig_0_15z[19:13];
  always_latch
    if (clkin_data[0]) celloutsig_0_66z = 10'h000;
    else if (!celloutsig_1_18z[0]) celloutsig_0_66z = celloutsig_0_48z[20:11];
  always_latch
    if (clkin_data[0]) celloutsig_0_12z = 12'h000;
    else if (!celloutsig_1_18z[0]) celloutsig_0_12z = { celloutsig_0_3z[2:0], celloutsig_0_5z };
  assign { celloutsig_0_10z[15:3], celloutsig_0_10z[16], celloutsig_0_10z[24:17] } = { celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_2z, in_data[22:15] } ~^ { celloutsig_0_4z[6:0], celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_4z[7], celloutsig_0_8z[1:0], celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_4z[8] };
  assign celloutsig_1_17z[11:1] = { celloutsig_1_5z[10:4], celloutsig_1_1z } ~^ { in_data[149:140], celloutsig_1_9z };
  assign celloutsig_0_10z[2:0] = 3'h7;
  assign celloutsig_1_17z[0] = 1'h1;
  assign { out_data[151:128], out_data[107:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_74z, celloutsig_0_75z };
endmodule
