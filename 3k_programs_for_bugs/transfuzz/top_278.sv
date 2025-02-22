/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  reg [12:0] celloutsig_0_1z;
  reg [5:0] celloutsig_0_2z;
  wire [12:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [18:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_13z;
  wire [14:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [4:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_5z = in_data[69:53] == { celloutsig_0_2z[5:4], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_1_8z = { in_data[111:107], celloutsig_1_5z } == { celloutsig_1_1z[1:0], celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_7z };
  assign celloutsig_1_10z = { in_data[113:111], celloutsig_1_2z } == { celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_9z };
  assign celloutsig_1_19z = { celloutsig_1_18z[10:8], celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_10z } == { celloutsig_1_0z[12:8], celloutsig_1_13z };
  assign celloutsig_0_4z = { celloutsig_0_3z[9:3], celloutsig_0_0z } > { celloutsig_0_2z[1], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_9z = { in_data[74:70], celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_4z } > { celloutsig_0_3z[11:3], celloutsig_0_3z };
  assign celloutsig_1_2z = { celloutsig_1_0z[15:10], celloutsig_1_1z } > in_data[155:145];
  assign celloutsig_1_4z = { in_data[143:132], celloutsig_1_2z, celloutsig_1_2z } > celloutsig_1_0z[14:1];
  assign celloutsig_1_5z = { in_data[123:120], celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_3z } > in_data[172:166];
  assign celloutsig_1_6z = { celloutsig_1_1z[1], celloutsig_1_5z, celloutsig_1_3z } > { celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_3z };
  assign celloutsig_0_6z = celloutsig_0_1z || { celloutsig_0_1z[11:0], celloutsig_0_0z };
  assign celloutsig_0_7z = celloutsig_0_1z[8:4] || { in_data[19:17], celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_1_3z = celloutsig_1_0z[18:14] || celloutsig_1_0z[14:10];
  assign celloutsig_1_7z = celloutsig_1_1z[3:0] || { in_data[136:135], celloutsig_1_4z, celloutsig_1_3z };
  assign celloutsig_1_13z = { in_data[141:139], celloutsig_1_4z, celloutsig_1_0z } || { celloutsig_1_0z[14:4], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_9z };
  assign celloutsig_0_0z = ^ in_data[19:16];
  assign celloutsig_0_8z = ^ { in_data[83:72], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_1_9z = ^ { celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_5z };
  assign celloutsig_0_3z = celloutsig_0_1z ^ { in_data[40:34], celloutsig_0_2z };
  assign celloutsig_1_0z = in_data[136:118] ^ in_data[122:104];
  assign celloutsig_1_1z = celloutsig_1_0z[9:5] ^ celloutsig_1_0z[14:10];
  assign celloutsig_1_18z = celloutsig_1_0z[14:0] ^ { in_data[120:117], celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_1z };
  always_latch
    if (clkin_data[0]) celloutsig_0_1z = 13'h0000;
    else if (celloutsig_1_18z[0]) celloutsig_0_1z = in_data[61:49];
  always_latch
    if (clkin_data[0]) celloutsig_0_2z = 6'h00;
    else if (celloutsig_1_18z[0]) celloutsig_0_2z = { in_data[11:7], celloutsig_0_0z };
  assign { out_data[142:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_8z, celloutsig_0_9z };
endmodule
