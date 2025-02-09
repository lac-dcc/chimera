/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [4:0] _02_;
  reg [37:0] _03_;
  reg [5:0] _04_;
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_1z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_2z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [6:0] celloutsig_0_7z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [9:0] celloutsig_1_14z;
  wire [3:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_3z;
  wire [3:0] celloutsig_1_4z;
  wire [9:0] celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [6:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_16z = celloutsig_0_4z ? celloutsig_0_11z : celloutsig_0_15z;
  assign celloutsig_1_19z = ~(celloutsig_1_5z[4] | celloutsig_1_12z);
  assign celloutsig_0_2z = celloutsig_0_1z ^ in_data[49];
  assign celloutsig_1_14z = { celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_7z } + in_data[133:124];
  reg [4:0] _09_;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[64])
    if (clkin_data[64]) _09_ <= 5'h00;
    else _09_ <= { in_data[58:55], celloutsig_0_5z };
  assign { _01_, _00_, _02_[2:0] } = _09_;
  always_ff @(posedge celloutsig_1_18z[0], negedge clkin_data[64])
    if (!clkin_data[64]) _03_ <= 38'h0000000000;
    else _03_ <= { in_data[58:22], celloutsig_0_6z };
  always_ff @(posedge clkin_data[32], negedge clkin_data[96])
    if (!clkin_data[96]) _04_ <= 6'h00;
    else _04_ <= { in_data[112:109], celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_0_7z = { in_data[71:67], celloutsig_0_6z, celloutsig_0_2z } / { 1'h1, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_0_6z = { celloutsig_0_4z, celloutsig_0_0z } > { 4'h0, celloutsig_0_5z };
  assign celloutsig_1_7z = celloutsig_1_5z[8:6] > in_data[175:173];
  assign celloutsig_0_11z = { celloutsig_0_7z[6], celloutsig_0_2z, celloutsig_0_2z } && { in_data[52:47], celloutsig_0_6z };
  assign celloutsig_1_0z = in_data[132:122] && in_data[112:102];
  assign celloutsig_1_11z = { in_data[145:141], celloutsig_1_10z, celloutsig_1_1z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_10z, celloutsig_1_9z } || { in_data[155:154], celloutsig_1_9z, celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_9z };
  assign celloutsig_1_3z = { in_data[183:166], celloutsig_1_0z } || { in_data[163:148], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_12z = celloutsig_1_3z & ~(celloutsig_1_11z);
  assign celloutsig_1_1z = in_data[107] & ~(celloutsig_1_0z);
  assign celloutsig_1_9z = { _04_[5:3], celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_0z } % { 1'h1, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_0z };
  assign celloutsig_1_18z = { celloutsig_1_5z[8:6], celloutsig_1_0z } % { 1'h1, celloutsig_1_14z[2:0] };
  assign celloutsig_0_5z = { celloutsig_0_2z, 4'h0, celloutsig_0_2z } != in_data[52:47];
  assign celloutsig_0_13z = celloutsig_0_7z[6:3] != { celloutsig_0_0z[2:0], celloutsig_0_11z };
  assign celloutsig_1_10z = { celloutsig_1_5z[5], celloutsig_1_7z, celloutsig_1_7z } !== in_data[115:113];
  assign celloutsig_1_8z = & { _04_[2:1], celloutsig_1_0z };
  assign celloutsig_0_1z = & in_data[28:25];
  assign celloutsig_0_15z = & _03_[27:13];
  assign celloutsig_0_4z = | { celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_23z = | { celloutsig_0_16z, celloutsig_0_13z, _01_, _00_, _02_[2:0] };
  assign celloutsig_0_22z = | celloutsig_0_0z[3:1];
  assign celloutsig_0_0z = in_data[48:45] >> in_data[26:23];
  assign celloutsig_1_4z = in_data[108:105] << { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_5z = { celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z } - in_data[124:115];
  assign _02_[4:3] = { _01_, _00_ };
  assign { out_data[131:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_22z, celloutsig_0_23z };
endmodule
