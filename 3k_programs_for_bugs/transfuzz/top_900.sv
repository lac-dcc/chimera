/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  reg [3:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
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
  assign celloutsig_0_0z = ~((in_data[56] | in_data[3]) & in_data[43]);
  assign celloutsig_1_17z = ~((celloutsig_1_4z | in_data[146]) & celloutsig_1_11z);
  assign celloutsig_1_18z = ~((celloutsig_1_17z | celloutsig_1_15z) & celloutsig_1_11z);
  assign celloutsig_0_5z = ~((celloutsig_0_1z | in_data[1]) & celloutsig_0_4z);
  assign celloutsig_0_6z = ~((celloutsig_0_2z | celloutsig_0_5z) & celloutsig_0_1z);
  assign celloutsig_0_7z = ~((celloutsig_0_0z | celloutsig_0_2z) & celloutsig_0_1z);
  assign celloutsig_1_5z = ~((celloutsig_1_1z | celloutsig_1_3z) & celloutsig_1_4z);
  assign celloutsig_1_9z = ~((celloutsig_1_4z | celloutsig_1_8z) & celloutsig_1_2z);
  assign celloutsig_1_11z = ~((celloutsig_1_3z | in_data[124]) & celloutsig_1_9z);
  assign celloutsig_1_15z = celloutsig_1_5z ^ celloutsig_1_3z;
  assign celloutsig_0_4z = celloutsig_0_3z ^ in_data[6];
  assign celloutsig_0_14z = celloutsig_0_10z ^ celloutsig_0_13z;
  assign celloutsig_1_0z = in_data[118] ^ in_data[172];
  assign celloutsig_1_3z = in_data[128] ^ celloutsig_1_0z;
  assign celloutsig_1_8z = celloutsig_1_6z ^ celloutsig_1_3z;
  assign celloutsig_1_10z = in_data[139] ^ celloutsig_1_1z;
  assign celloutsig_1_19z = { celloutsig_1_5z, celloutsig_1_15z, celloutsig_1_10z, celloutsig_1_12z } == { celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_4z };
  assign celloutsig_0_9z = { celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_1z } == { in_data[15:0], celloutsig_0_3z };
  assign celloutsig_0_10z = in_data[64:45] == { in_data[79:75], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_9z };
  assign celloutsig_0_13z = { celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_10z } == { in_data[66:64], celloutsig_0_2z, celloutsig_0_8z };
  assign celloutsig_0_1z = in_data[93:78] == { in_data[37:23], celloutsig_0_0z };
  assign celloutsig_0_15z = celloutsig_0_8z == { in_data[45:43], celloutsig_0_6z };
  assign celloutsig_1_1z = in_data[157:132] == in_data[159:134];
  assign celloutsig_1_2z = in_data[122:114] == { in_data[170:165], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_4z = { celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_2z } == in_data[116:113];
  assign celloutsig_1_12z = in_data[137:135] == { celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_11z };
  assign celloutsig_0_3z = ~((in_data[23] & celloutsig_0_2z) | celloutsig_0_2z);
  assign celloutsig_1_6z = ~((celloutsig_1_4z & celloutsig_1_1z) | celloutsig_1_0z);
  assign celloutsig_0_2z = ~((in_data[27] & in_data[47]) | celloutsig_0_0z);
  assign celloutsig_1_7z = ~((in_data[156] & in_data[178]) | in_data[133]);
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_8z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_8z = { celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_0z };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_14z, celloutsig_0_15z };
endmodule
