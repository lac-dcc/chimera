/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [11:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire [3:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  reg [8:0] celloutsig_0_5z;
  wire [13:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_12z;
  reg [7:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [16:0] celloutsig_1_15z;
  wire [4:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  reg [2:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [4:0] celloutsig_1_5z;
  reg [24:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [13:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = !(in_data[94] ? in_data[7] : in_data[47]);
  assign celloutsig_1_10z = !(celloutsig_1_6z[0] ? celloutsig_1_5z[1] : celloutsig_1_2z);
  assign celloutsig_1_12z = !(celloutsig_1_4z ? in_data[151] : celloutsig_1_3z[0]);
  assign celloutsig_0_9z = !(celloutsig_0_1z ? celloutsig_0_5z[8] : celloutsig_0_3z);
  assign celloutsig_0_13z = !(celloutsig_0_4z ? celloutsig_0_11z[7] : celloutsig_0_0z);
  assign celloutsig_0_3z = in_data[35:7] == in_data[89:61];
  assign celloutsig_0_4z = { in_data[31:26], celloutsig_0_3z } == { celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_7z = celloutsig_0_6z[8:0] == celloutsig_0_6z[10:2];
  assign celloutsig_0_1z = { in_data[93:66], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } == in_data[36:5];
  assign celloutsig_0_17z = celloutsig_0_5z[6:4] == { in_data[74:73], celloutsig_0_4z };
  assign celloutsig_0_25z = { in_data[19:18], celloutsig_0_1z } == { celloutsig_0_11z[3:2], celloutsig_0_17z };
  assign celloutsig_1_0z = in_data[191:189] == in_data[133:131];
  assign celloutsig_0_10z = { celloutsig_0_5z[8:1], celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_8z } || in_data[85:69];
  assign celloutsig_0_18z = { in_data[73:70], celloutsig_0_2z, celloutsig_0_10z } || { celloutsig_0_17z, celloutsig_0_16z, celloutsig_0_17z, celloutsig_0_8z };
  assign celloutsig_0_23z = in_data[19:15] || { celloutsig_0_22z, celloutsig_0_21z };
  assign celloutsig_0_2z = { in_data[91:60], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z } || { in_data[32:0], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_4z = { in_data[105:103], celloutsig_1_3z, celloutsig_1_1z } || { in_data[133], celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_1_7z = celloutsig_1_0z & celloutsig_1_2z;
  assign celloutsig_1_9z = celloutsig_1_0z & in_data[154];
  assign celloutsig_1_14z = celloutsig_1_7z & celloutsig_1_5z[4];
  assign celloutsig_1_19z = celloutsig_1_7z & celloutsig_1_8z[7];
  assign celloutsig_0_16z = celloutsig_0_0z & celloutsig_0_10z;
  assign celloutsig_1_2z = celloutsig_1_0z & in_data[189];
  assign celloutsig_1_18z = ~^ { celloutsig_1_5z[2:0], celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_16z, celloutsig_1_10z };
  assign celloutsig_0_12z = ~^ { celloutsig_0_5z[3:1], celloutsig_0_0z, celloutsig_0_8z };
  assign celloutsig_0_21z = ~^ { in_data[48:44], celloutsig_0_8z };
  assign celloutsig_0_24z = ~^ { in_data[26:21], celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_23z, celloutsig_0_18z, celloutsig_0_16z, celloutsig_0_21z, celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_1z };
  assign celloutsig_1_1z = ~^ in_data[146:142];
  assign celloutsig_1_8z = in_data[185:172] >>> { celloutsig_1_6z[11:10], celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_5z };
  assign celloutsig_1_15z = { celloutsig_1_13z[5:0], celloutsig_1_14z, celloutsig_1_10z, celloutsig_1_13z, celloutsig_1_1z } >>> { celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_12z, celloutsig_1_4z, celloutsig_1_12z, celloutsig_1_14z };
  assign celloutsig_1_16z = { celloutsig_1_13z[5], celloutsig_1_12z, celloutsig_1_3z } >>> { celloutsig_1_15z[2:0], celloutsig_1_14z, celloutsig_1_0z };
  assign celloutsig_0_6z = { in_data[35:25], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_4z } >>> { in_data[93:82], celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_8z = in_data[56:54] >>> celloutsig_0_5z[3:1];
  assign celloutsig_0_11z = { celloutsig_0_6z[5], celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_8z } >>> { celloutsig_0_6z[4], celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_4z };
  assign celloutsig_0_22z = celloutsig_0_5z[7:4] >>> { celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_18z };
  assign celloutsig_1_5z = { in_data[138], celloutsig_1_2z, celloutsig_1_3z } >>> in_data[158:154];
  always_latch
    if (!clkin_data[64]) celloutsig_1_13z = 8'h00;
    else if (clkin_data[0]) celloutsig_1_13z = { in_data[141:137], celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_4z };
  always_latch
    if (clkin_data[32]) celloutsig_0_5z = 9'h000;
    else if (!celloutsig_1_18z) celloutsig_0_5z = in_data[60:52];
  always_latch
    if (!clkin_data[64]) celloutsig_1_3z = 3'h0;
    else if (!clkin_data[0]) celloutsig_1_3z = { celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z };
  always_latch
    if (clkin_data[96]) celloutsig_1_6z = 25'h0000000;
    else if (clkin_data[0]) celloutsig_1_6z = { in_data[183:173], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_3z };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_24z, celloutsig_0_25z };
endmodule
