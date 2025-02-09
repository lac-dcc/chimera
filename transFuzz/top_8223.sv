/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_1z;
  wire celloutsig_0_3z;
  reg [27:0] celloutsig_0_4z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [9:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [7:0] celloutsig_1_17z;
  wire [7:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  reg [5:0] celloutsig_1_1z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_7z = !(celloutsig_1_4z ? celloutsig_1_6z : celloutsig_1_1z[5]);
  assign celloutsig_1_8z = !(celloutsig_1_1z[0] ? in_data[114] : celloutsig_1_1z[0]);
  assign celloutsig_0_3z = ~(celloutsig_0_0z ^ celloutsig_0_1z);
  assign celloutsig_0_1z = ~(in_data[9] ^ in_data[78]);
  assign celloutsig_1_5z = ~(celloutsig_1_4z ^ celloutsig_1_1z[2]);
  assign celloutsig_1_10z = ~(celloutsig_1_9z ^ celloutsig_1_7z);
  assign celloutsig_0_7z = { celloutsig_0_4z[9:2], celloutsig_0_1z } > { celloutsig_0_4z[10:7], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_1_6z = { in_data[167:157], celloutsig_1_3z } > { in_data[109:107], celloutsig_1_3z, celloutsig_1_3z, 5'h00, celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_1_9z = in_data[132:116] > { celloutsig_1_0z[9:3], celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_4z, 5'h00, celloutsig_1_3z };
  assign celloutsig_1_12z = { celloutsig_1_1z[5:1], celloutsig_1_10z, celloutsig_1_1z } > { in_data[159:149], celloutsig_1_8z };
  assign celloutsig_1_3z = { celloutsig_1_0z[7:5], celloutsig_1_1z } && celloutsig_1_0z[8:0];
  assign celloutsig_1_11z = { celloutsig_1_0z[6], celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_3z } && { celloutsig_1_0z[9:8], celloutsig_1_10z, celloutsig_1_9z, celloutsig_1_3z, celloutsig_1_7z };
  assign celloutsig_1_4z = { in_data[117:114], 15'h0000, celloutsig_1_0z } < { in_data[169:168], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_0z = in_data[82] & ~(in_data[12]);
  assign celloutsig_0_6z = celloutsig_0_1z & ~(celloutsig_0_1z);
  assign celloutsig_1_0z = in_data[129:120] % { 1'h1, in_data[150:142] };
  assign celloutsig_1_18z = { celloutsig_1_0z[7:2], celloutsig_1_8z, celloutsig_1_6z } % { 1'h1, in_data[123:120], celloutsig_1_17z[1:0], celloutsig_1_7z };
  assign celloutsig_1_19z = ~^ { celloutsig_1_11z, celloutsig_1_9z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_1z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_4z = 28'h0000000;
    else if (clkin_data[0]) celloutsig_0_4z = in_data[73:46];
  always_latch
    if (clkin_data[64]) celloutsig_1_1z = 6'h00;
    else if (clkin_data[32]) celloutsig_1_1z = in_data[178:173];
  assign { celloutsig_1_17z[1], celloutsig_1_17z[7], celloutsig_1_17z[0] } = { celloutsig_1_12z, celloutsig_1_7z, celloutsig_1_5z } | { in_data[119], in_data[125], in_data[118] };
  assign celloutsig_1_17z[6:2] = in_data[124:120];
  assign { out_data[135:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_6z, celloutsig_0_7z };
endmodule
