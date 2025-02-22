/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [10:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[81] ? in_data[19] : in_data[70];
  assign celloutsig_1_0z = !(in_data[187] ? in_data[178] : in_data[101]);
  assign celloutsig_1_2z = !(celloutsig_1_0z ? celloutsig_1_0z : in_data[159]);
  assign celloutsig_1_7z = !(celloutsig_1_0z ? celloutsig_1_0z : celloutsig_1_3z);
  assign celloutsig_1_18z = ~(celloutsig_1_11z | celloutsig_1_8z);
  assign celloutsig_0_6z = ~((celloutsig_0_3z | celloutsig_0_1z) & celloutsig_0_2z);
  assign celloutsig_1_3z = ~((celloutsig_1_2z | in_data[120]) & in_data[152]);
  assign celloutsig_0_2z = ~((celloutsig_0_0z | celloutsig_0_0z) & in_data[63]);
  assign celloutsig_0_8z = celloutsig_0_0z | ~(celloutsig_0_0z);
  assign celloutsig_0_1z = in_data[26] | ~(celloutsig_0_0z);
  assign celloutsig_1_4z = in_data[107] | celloutsig_1_2z;
  reg [17:0] _11_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _11_ <= 18'h00000;
    else _11_ <= { in_data[69:53], celloutsig_0_6z };
  assign out_data[17:0] = _11_;
  assign celloutsig_1_8z = { celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_7z } > { celloutsig_1_1z[6:3], celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_1_5z = { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z } && { in_data[136:132], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_1_6z = { in_data[187:176], celloutsig_1_0z } && { celloutsig_1_1z[9:0], celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_1_19z = { celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_18z, celloutsig_1_4z, celloutsig_1_5z } && celloutsig_1_1z[9:5];
  assign celloutsig_1_1z = in_data[154:144] * in_data[189:179];
  assign celloutsig_0_3z = { in_data[55:51], celloutsig_0_1z, celloutsig_0_1z } != { in_data[30:26], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_1_11z = ^ { in_data[168:160], celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_0z };
  assign { out_data[128], out_data[96], out_data[32] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_8z };
endmodule
