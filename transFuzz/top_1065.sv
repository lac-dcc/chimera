/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [6:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  reg [9:0] celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [3:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [2:0] celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire [5:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire [2:0] celloutsig_0_2z;
  wire [14:0] celloutsig_0_31z;
  wire [9:0] celloutsig_0_32z;
  reg [5:0] celloutsig_0_37z;
  wire [3:0] celloutsig_0_3z;
  reg [5:0] celloutsig_0_4z;
  reg [4:0] celloutsig_0_55z;
  wire celloutsig_0_66z;
  wire celloutsig_0_67z;
  wire [2:0] celloutsig_0_6z;
  wire [14:0] celloutsig_0_7z;
  reg [30:0] celloutsig_0_9z;
  wire [3:0] celloutsig_1_0z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [17:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  reg [11:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [6:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_8z = !(celloutsig_1_7z[2] ? celloutsig_1_2z[3] : celloutsig_1_2z[1]);
  assign celloutsig_1_18z = !(celloutsig_1_6z ? celloutsig_1_2z[3] : celloutsig_1_1z);
  assign celloutsig_0_14z = ~(celloutsig_0_3z[0] | in_data[23]);
  assign celloutsig_0_25z = ~(celloutsig_0_1z[3] | 1'h1);
  assign celloutsig_1_12z = celloutsig_1_3z[6] | ~(celloutsig_1_1z);
  assign celloutsig_1_13z = celloutsig_1_3z[6] | ~(celloutsig_1_5z);
  assign celloutsig_0_3z = celloutsig_0_1z + { celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_6z = { in_data[50:49], 1'h1 } + celloutsig_0_1z[3:1];
  assign celloutsig_1_2z = { celloutsig_1_0z[2], celloutsig_1_0z, celloutsig_1_0z } + in_data[128:120];
  assign celloutsig_0_32z = { celloutsig_0_31z[8:7], celloutsig_0_3z, celloutsig_0_17z, celloutsig_0_27z } + { celloutsig_0_29z, celloutsig_0_27z, celloutsig_0_23z, celloutsig_0_10z, celloutsig_0_24z };
  assign celloutsig_1_4z = celloutsig_1_3z[5:3] & celloutsig_1_0z[3:1];
  assign celloutsig_0_66z = { celloutsig_0_37z, celloutsig_0_17z } === { celloutsig_0_31z[9:6], celloutsig_0_55z };
  assign celloutsig_0_13z = { in_data[62:61], 1'h1 } === celloutsig_0_9z[8:6];
  assign celloutsig_1_5z = celloutsig_1_0z[2:0] > { celloutsig_1_2z[5:4], celloutsig_1_1z };
  assign celloutsig_0_10z = { celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_7z[14:11], 1'h1, celloutsig_0_7z[9:0], celloutsig_0_6z, celloutsig_0_1z, 1'h1 } > { celloutsig_0_9z[29:7], celloutsig_0_3z, 1'h1 };
  assign celloutsig_0_0z = in_data[16:5] <= in_data[65:54];
  assign celloutsig_1_1z = in_data[170:164] <= { celloutsig_1_0z[3:1], celloutsig_1_0z };
  assign celloutsig_1_6z = { celloutsig_1_4z[2], celloutsig_1_1z, celloutsig_1_0z } <= { celloutsig_1_2z[2:0], celloutsig_1_4z };
  assign celloutsig_0_19z = celloutsig_0_9z[20:13] <= { celloutsig_0_4z[5:2], celloutsig_0_3z };
  assign celloutsig_0_11z = { celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_0z } && in_data[20:15];
  assign celloutsig_0_18z = 1'h1 || celloutsig_0_9z[25:7];
  assign celloutsig_0_67z = celloutsig_0_32z[8:4] !== celloutsig_0_16z[7:3];
  assign celloutsig_0_27z = { celloutsig_0_9z[28:20], celloutsig_0_4z, celloutsig_0_18z, celloutsig_0_19z } !== celloutsig_0_9z[21:5];
  assign celloutsig_0_29z = celloutsig_0_4z[3:0] !== { celloutsig_0_3z[1], 1'h1, celloutsig_0_19z, celloutsig_0_13z };
  assign celloutsig_1_0z = in_data[169:166] | in_data[166:163];
  assign celloutsig_0_17z = celloutsig_0_16z[5:3] | { celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_13z };
  assign celloutsig_0_2z = { in_data[76], celloutsig_0_0z, celloutsig_0_0z } | { celloutsig_0_1z[1:0], celloutsig_0_0z };
  assign celloutsig_0_20z = celloutsig_0_10z & celloutsig_0_4z[0];
  assign celloutsig_0_23z = ~^ { 1'h1, celloutsig_0_10z, celloutsig_0_18z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_20z, celloutsig_0_19z };
  assign celloutsig_1_3z = in_data[122:113] >> { in_data[120:112], celloutsig_1_1z };
  assign celloutsig_1_16z = { celloutsig_1_2z[6:3], celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_1z } >>> { celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_13z, celloutsig_1_12z };
  assign celloutsig_0_12z = celloutsig_0_9z[10:4] >>> { celloutsig_0_11z, 1'h1, celloutsig_0_11z, celloutsig_0_1z };
  assign celloutsig_0_21z = celloutsig_0_9z[13:11] >>> celloutsig_0_1z[3:1];
  assign celloutsig_0_24z = { 2'h3, celloutsig_0_19z, celloutsig_0_21z } >>> { celloutsig_0_4z[2:0], celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_20z };
  assign celloutsig_1_7z = celloutsig_1_3z[6:0] ^ { in_data[136:134], celloutsig_1_0z };
  assign celloutsig_0_1z = in_data[7:4] ^ { in_data[39:37], celloutsig_0_0z };
  always_latch
    if (clkin_data[32]) celloutsig_0_37z = 6'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_37z = { celloutsig_0_1z[1], celloutsig_0_31z[11:7] };
  always_latch
    if (clkin_data[32]) celloutsig_0_4z = 6'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_4z = { celloutsig_0_1z[1:0], celloutsig_0_3z };
  always_latch
    if (clkin_data[32]) celloutsig_0_55z = 5'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_55z = celloutsig_0_31z[9:5];
  always_latch
    if (clkin_data[64]) celloutsig_1_19z = 12'h000;
    else if (clkin_data[0]) celloutsig_1_19z = { celloutsig_1_16z[14:8], celloutsig_1_8z, celloutsig_1_8z, celloutsig_1_12z, celloutsig_1_8z, celloutsig_1_6z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_9z = 31'h00000000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_9z = { in_data[51:49], celloutsig_0_3z, 1'h1, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_7z[14:11], 1'h1, celloutsig_0_7z[9:0] };
  always_latch
    if (!clkin_data[32]) celloutsig_0_16z = 10'h000;
    else if (celloutsig_1_19z[0]) celloutsig_0_16z = { celloutsig_0_12z[4:3], celloutsig_0_12z, celloutsig_0_14z };
  assign { celloutsig_0_7z[9:0], celloutsig_0_7z[14:11] } = { celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_1z } | { celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z[1:0], celloutsig_0_6z[2:1] };
  assign { celloutsig_0_31z[2:1], celloutsig_0_31z[8], celloutsig_0_31z[0], celloutsig_0_31z[6], celloutsig_0_31z[11:9], celloutsig_0_31z[14:13], celloutsig_0_31z[5:3], celloutsig_0_31z[7] } = { celloutsig_0_19z, celloutsig_0_14z, celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_7z[9:7], celloutsig_0_7z[12:11], celloutsig_0_2z, celloutsig_0_0z } & { celloutsig_0_12z[0], celloutsig_0_25z, celloutsig_0_12z[6], celloutsig_0_25z, celloutsig_0_12z[4], celloutsig_0_1z[0], celloutsig_0_13z, celloutsig_0_29z, celloutsig_0_1z[3:2], celloutsig_0_12z[3:1], celloutsig_0_12z[5] };
  assign celloutsig_0_31z[12] = celloutsig_0_1z[1];
  assign celloutsig_0_7z[10] = 1'h1;
  assign { out_data[128], out_data[107:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_66z, celloutsig_0_67z };
endmodule
