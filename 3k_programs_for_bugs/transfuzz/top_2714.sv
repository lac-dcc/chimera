/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_11z;
  wire celloutsig_0_16z;
  wire celloutsig_0_44z;
  wire celloutsig_0_47z;
  reg [16:0] celloutsig_0_7z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  reg [5:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_47z = in_data[74] ? in_data[74] : celloutsig_0_44z;
  assign celloutsig_1_2z = celloutsig_1_0z ? celloutsig_1_1z : celloutsig_1_0z;
  assign celloutsig_1_3z = celloutsig_1_2z ? celloutsig_1_1z : celloutsig_1_2z;
  assign celloutsig_1_8z = in_data[181] ? celloutsig_1_6z : celloutsig_1_0z;
  assign celloutsig_1_17z = celloutsig_1_1z ? celloutsig_1_11z : celloutsig_1_7z;
  assign celloutsig_0_11z = celloutsig_0_7z[8] ? 1'h1 : in_data[59];
  assign celloutsig_0_44z = ~(in_data[59] ^ celloutsig_0_16z);
  assign celloutsig_1_0z = ~(in_data[150] ^ in_data[110]);
  assign celloutsig_1_1z = ~(in_data[125] ^ celloutsig_1_0z);
  assign celloutsig_1_16z = ~(in_data[172] ^ celloutsig_1_1z);
  assign celloutsig_1_6z = ~(in_data[170] ^ celloutsig_1_3z);
  assign celloutsig_1_7z = ~(celloutsig_1_1z ^ celloutsig_1_6z);
  assign celloutsig_1_11z = ~(celloutsig_1_0z ^ celloutsig_1_16z);
  assign celloutsig_1_15z = ~(celloutsig_1_3z ^ celloutsig_1_8z);
  assign celloutsig_1_19z = ~(celloutsig_1_16z ^ celloutsig_1_15z);
  assign celloutsig_0_16z = ~(celloutsig_0_7z[11] ^ celloutsig_0_11z);
  always_latch
    if (!clkin_data[96]) celloutsig_1_18z = 6'h00;
    else if (!clkin_data[0]) celloutsig_1_18z = { celloutsig_1_1z, celloutsig_1_16z, celloutsig_1_17z, celloutsig_1_16z, celloutsig_1_11z, celloutsig_1_11z };
  always_latch
    if (clkin_data[32]) celloutsig_0_7z = 17'h00000;
    else if (!celloutsig_1_18z[0]) celloutsig_0_7z = { in_data[50:38], 1'h1, in_data[74], in_data[74], 1'h1 };
  assign { out_data[133:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_16z, celloutsig_0_47z };
endmodule
