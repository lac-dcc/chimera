/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [3:0] celloutsig_0_0z;
  wire [14:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [4:0] celloutsig_0_12z;
  wire [42:0] celloutsig_0_13z;
  wire [4:0] celloutsig_0_14z;
  wire [22:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [17:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [6:0] celloutsig_0_20z;
  wire [7:0] celloutsig_0_22z;
  wire [3:0] celloutsig_0_23z;
  wire [7:0] celloutsig_0_24z;
  wire [8:0] celloutsig_0_25z;
  wire [5:0] celloutsig_0_26z;
  wire [3:0] celloutsig_0_27z;
  wire [7:0] celloutsig_0_28z;
  wire [4:0] celloutsig_0_2z;
  wire [21:0] celloutsig_0_31z;
  wire [14:0] celloutsig_0_32z;
  wire [19:0] celloutsig_0_33z;
  wire [8:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [17:0] celloutsig_0_5z;
  reg [10:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [12:0] celloutsig_1_11z;
  wire [8:0] celloutsig_1_13z;
  wire [7:0] celloutsig_1_14z;
  wire [16:0] celloutsig_1_16z;
  wire [12:0] celloutsig_1_17z;
  wire [18:0] celloutsig_1_18z;
  wire [14:0] celloutsig_1_19z;
  reg [2:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [7:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [13:0] celloutsig_1_5z;
  wire [18:0] celloutsig_1_6z;
  reg [6:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_0z = in_data[110] ? in_data[114] : in_data[190];
  assign celloutsig_0_11z = celloutsig_0_4z ? celloutsig_0_1z : celloutsig_0_10z[9];
  assign celloutsig_1_9z = ~(celloutsig_1_1z[0] ^ celloutsig_1_2z);
  assign celloutsig_0_7z = ~(celloutsig_0_3z[7] ^ celloutsig_0_0z[1]);
  assign celloutsig_1_3z = { in_data[115:111], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z } + { in_data[182:181], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_6z = { in_data[120:107], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_4z } + { celloutsig_1_5z[10:0], celloutsig_1_3z };
  assign celloutsig_1_14z = { in_data[121:118], celloutsig_1_1z, celloutsig_1_9z } + { in_data[133:128], celloutsig_1_4z, celloutsig_1_10z };
  assign celloutsig_1_16z = { celloutsig_1_11z[9:3], celloutsig_1_7z, celloutsig_1_1z } + { celloutsig_1_5z[6:2], celloutsig_1_1z, celloutsig_1_13z };
  assign celloutsig_1_17z = { celloutsig_1_14z[6:4], celloutsig_1_9z, celloutsig_1_10z, celloutsig_1_3z } + celloutsig_1_5z[12:0];
  assign celloutsig_0_12z = celloutsig_0_10z[11:7] + { celloutsig_0_2z[3:0], celloutsig_0_9z };
  assign celloutsig_0_14z = celloutsig_0_5z[7:3] + { celloutsig_0_10z[3:2], celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_8z };
  assign celloutsig_0_15z = { celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_12z } + celloutsig_0_13z[38:16];
  assign celloutsig_0_17z = { celloutsig_0_10z[8:6], celloutsig_0_16z, celloutsig_0_8z, celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_7z } + { celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_7z };
  assign celloutsig_0_22z = { celloutsig_0_3z[3:1], celloutsig_0_2z } + celloutsig_0_5z[16:9];
  assign celloutsig_0_2z = { in_data[23:20], celloutsig_0_1z } + { celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_4z = in_data[34] & ~(in_data[92]);
  assign celloutsig_1_8z = celloutsig_1_6z[5] & ~(celloutsig_1_2z);
  assign celloutsig_0_8z = celloutsig_0_2z[1] & ~(celloutsig_0_4z);
  assign celloutsig_0_19z = celloutsig_0_15z[0] & ~(celloutsig_0_3z[1]);
  assign celloutsig_1_19z = celloutsig_1_6z[16:2] % { 1'h1, celloutsig_1_0z, celloutsig_1_17z };
  assign celloutsig_0_26z = celloutsig_0_22z[5:0] % { 1'h1, in_data[71:67] };
  assign celloutsig_0_25z = { celloutsig_0_12z[2:0], celloutsig_0_7z, celloutsig_0_2z } % { 1'h1, celloutsig_0_20z[0], celloutsig_0_16z, celloutsig_0_12z, celloutsig_0_1z };
  assign celloutsig_0_28z = { celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_26z } % { 1'h1, celloutsig_0_27z[2:1], celloutsig_0_14z };
  assign celloutsig_1_5z = { in_data[165:153], celloutsig_1_2z } * { celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_1_13z = { celloutsig_1_8z, celloutsig_1_10z, celloutsig_1_7z } * { celloutsig_1_7z[5:4], celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_20z = celloutsig_0_13z[41:35] * celloutsig_0_5z[15:9];
  assign celloutsig_1_4z = { celloutsig_1_3z[7:1], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z } != { in_data[166:163], celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_1_10z = celloutsig_1_5z[9:6] != { celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_0_18z = celloutsig_0_17z[15:3] != { celloutsig_0_13z[2], celloutsig_0_3z, celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_16z };
  assign celloutsig_1_2z = celloutsig_1_0z & in_data[177];
  assign celloutsig_0_9z = celloutsig_0_7z & celloutsig_0_1z;
  assign celloutsig_0_1z = in_data[30] & in_data[29];
  assign celloutsig_0_16z = celloutsig_0_7z & celloutsig_0_14z[0];
  assign celloutsig_1_18z = { celloutsig_1_11z[4:3], celloutsig_1_16z } >> { celloutsig_1_14z[7:2], celloutsig_1_17z };
  assign celloutsig_0_10z = in_data[43:29] >> in_data[87:73];
  assign celloutsig_0_13z = { in_data[85:58], celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_11z } >> { celloutsig_0_3z[8:7], celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_12z };
  assign celloutsig_0_24z = celloutsig_0_22z >> { celloutsig_0_6z[4:0], celloutsig_0_18z, celloutsig_0_19z, celloutsig_0_8z };
  assign celloutsig_0_0z = in_data[19:16] >> in_data[16:13];
  assign celloutsig_0_3z = in_data[65:57] >> { celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_1_11z = { celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_1z } >> { celloutsig_1_6z[14:3], celloutsig_1_0z };
  assign celloutsig_0_23z = { celloutsig_0_13z[33], celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_18z } >> { celloutsig_0_12z[2:1], celloutsig_0_7z, celloutsig_0_7z };
  assign celloutsig_0_27z = { celloutsig_0_3z[8:6], celloutsig_0_9z } >> celloutsig_0_13z[18:15];
  assign celloutsig_0_32z = { celloutsig_0_13z[30:24], celloutsig_0_22z } >> celloutsig_0_17z[16:2];
  assign celloutsig_0_33z = { celloutsig_0_3z[2:1], celloutsig_0_4z, celloutsig_0_24z, celloutsig_0_28z, celloutsig_0_8z } - { celloutsig_0_31z[19:1], celloutsig_0_8z };
  assign celloutsig_0_5z = { in_data[22:20], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_2z } - { in_data[37:26], celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_31z = { celloutsig_0_25z, celloutsig_0_26z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_23z, celloutsig_0_16z } - { celloutsig_0_5z[11:0], celloutsig_0_1z, celloutsig_0_16z, celloutsig_0_24z };
  always_latch
    if (clkin_data[96]) celloutsig_1_1z = 3'h0;
    else if (!clkin_data[0]) celloutsig_1_1z = { in_data[97], celloutsig_1_0z, celloutsig_1_0z };
  always_latch
    if (clkin_data[96]) celloutsig_1_7z = 7'h00;
    else if (clkin_data[32]) celloutsig_1_7z = { celloutsig_1_3z[2:0], celloutsig_1_1z, celloutsig_1_2z };
  always_latch
    if (clkin_data[64]) celloutsig_0_6z = 11'h000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_6z = celloutsig_0_5z[16:6];
  assign { out_data[146:128], out_data[110:96], out_data[46:32], out_data[19:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_32z, celloutsig_0_33z };
endmodule
