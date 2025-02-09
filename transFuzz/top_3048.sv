/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [13:0] _00_;
  reg [7:0] _01_;
  wire [9:0] celloutsig_0_0z;
  wire [6:0] celloutsig_0_10z;
  wire [5:0] celloutsig_0_11z;
  wire [15:0] celloutsig_0_12z;
  wire [6:0] celloutsig_0_13z;
  wire [8:0] celloutsig_0_14z;
  wire [4:0] celloutsig_0_15z;
  wire [2:0] celloutsig_0_19z;
  wire [13:0] celloutsig_0_1z;
  wire [9:0] celloutsig_0_20z;
  wire [3:0] celloutsig_0_22z;
  wire [3:0] celloutsig_0_23z;
  wire [2:0] celloutsig_0_26z;
  wire [17:0] celloutsig_0_27z;
  wire [26:0] celloutsig_0_28z;
  wire [7:0] celloutsig_0_2z;
  wire [28:0] celloutsig_0_32z;
  wire [4:0] celloutsig_0_37z;
  wire [7:0] celloutsig_0_3z;
  wire [9:0] celloutsig_0_42z;
  wire [7:0] celloutsig_0_44z;
  wire [2:0] celloutsig_0_55z;
  wire [3:0] celloutsig_0_58z;
  wire [2:0] celloutsig_0_5z;
  wire [9:0] celloutsig_0_67z;
  wire [8:0] celloutsig_0_68z;
  wire [13:0] celloutsig_0_6z;
  wire [6:0] celloutsig_0_7z;
  wire [4:0] celloutsig_0_9z;
  wire [9:0] celloutsig_1_0z;
  wire [4:0] celloutsig_1_11z;
  wire [4:0] celloutsig_1_18z;
  wire [14:0] celloutsig_1_19z;
  wire [11:0] celloutsig_1_1z;
  wire [7:0] celloutsig_1_2z;
  wire [13:0] celloutsig_1_3z;
  wire [16:0] celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire [5:0] celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  always_ff @(negedge celloutsig_1_18z[0], negedge clkin_data[0])
    if (!clkin_data[0]) _00_ <= 14'h0000;
    else _00_ <= { celloutsig_0_2z[5:0], celloutsig_0_2z };
  always_ff @(posedge celloutsig_1_18z[0], negedge clkin_data[0])
    if (!clkin_data[0]) _01_ <= 8'h00;
    else _01_ <= { celloutsig_0_9z[2:1], celloutsig_0_11z };
  assign celloutsig_0_0z = in_data[84:75] % { 1'h1, in_data[63:55] };
  assign celloutsig_0_3z = celloutsig_0_1z[8:1] % { 1'h1, celloutsig_0_1z[6:0] };
  assign celloutsig_0_32z = { celloutsig_0_6z[6:0], celloutsig_0_27z, celloutsig_0_23z } % { 1'h1, celloutsig_0_0z[7:4], celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_14z };
  assign celloutsig_0_37z = celloutsig_0_32z[17:13] % { 1'h1, in_data[46:43] };
  assign celloutsig_0_42z = { _01_[6:0], celloutsig_0_19z } % { 1'h1, celloutsig_0_28z[25:20], celloutsig_0_26z };
  assign celloutsig_0_44z = celloutsig_0_1z[7:0] % { 1'h1, celloutsig_0_14z[5:4], celloutsig_0_37z };
  assign celloutsig_0_55z = celloutsig_0_44z[3:1] % { 1'h1, celloutsig_0_19z[1:0] };
  assign celloutsig_0_58z = celloutsig_0_10z[6:3] % { 1'h1, celloutsig_0_20z[2:0] };
  assign celloutsig_0_5z = celloutsig_0_3z[6:4] % { 1'h1, celloutsig_0_1z[12:11] };
  assign celloutsig_0_67z = { celloutsig_0_13z[4], celloutsig_0_55z, celloutsig_0_11z } % { 1'h1, celloutsig_0_20z[8:0] };
  assign celloutsig_0_68z = { celloutsig_0_15z, celloutsig_0_58z } % { 1'h1, celloutsig_0_42z[7:0] };
  assign celloutsig_0_6z = { celloutsig_0_1z[10:5], celloutsig_0_3z } % { 1'h1, celloutsig_0_3z[6:5], celloutsig_0_3z, celloutsig_0_5z };
  assign celloutsig_1_0z = in_data[177:168] % { 1'h1, in_data[163:155] };
  assign celloutsig_1_1z = { celloutsig_1_0z[9:8], celloutsig_1_0z } % { 1'h1, in_data[146], celloutsig_1_0z[9:1], in_data[96] };
  assign celloutsig_1_2z = celloutsig_1_1z[9:2] % { 1'h1, celloutsig_1_1z[6:0] };
  assign celloutsig_1_3z = in_data[185:172] % { 1'h1, celloutsig_1_1z[10], celloutsig_1_1z };
  assign celloutsig_1_4z = { celloutsig_1_2z[6:0], celloutsig_1_0z } % { 1'h1, celloutsig_1_0z[8:7], celloutsig_1_3z };
  assign celloutsig_1_5z = celloutsig_1_3z[10:2] % { 1'h1, in_data[137:130] };
  assign celloutsig_1_8z = celloutsig_1_1z[11:6] % { 1'h1, celloutsig_1_3z[6:2] };
  assign celloutsig_0_7z = _00_[6:0] % { 1'h1, celloutsig_0_1z[11:6] };
  assign celloutsig_1_11z = celloutsig_1_1z[10:6] % { 1'h1, celloutsig_1_5z[7:4] };
  assign celloutsig_1_18z = celloutsig_1_8z[5:1] % { 1'h1, celloutsig_1_5z[7:4] };
  assign celloutsig_1_19z = { celloutsig_1_18z, celloutsig_1_11z, celloutsig_1_18z } % { 1'h1, celloutsig_1_4z[13:0] };
  assign celloutsig_0_9z = celloutsig_0_3z[5:1] % { 1'h1, celloutsig_0_1z[6:3] };
  assign celloutsig_0_10z = in_data[78:72] % { 1'h1, celloutsig_0_3z[1], celloutsig_0_9z };
  assign celloutsig_0_11z = celloutsig_0_0z[8:3] % { 1'h1, celloutsig_0_3z[4:0] };
  assign celloutsig_0_12z = { celloutsig_0_0z[6:1], celloutsig_0_0z } % { 1'h1, _00_[5:1], celloutsig_0_0z[9:1], in_data[0] };
  assign celloutsig_0_1z = in_data[24:11] % { 1'h1, in_data[89:77] };
  assign celloutsig_0_13z = { celloutsig_0_6z[5], celloutsig_0_11z } % { 1'h1, celloutsig_0_10z[5:0] };
  assign celloutsig_0_14z = celloutsig_0_0z[9:1] % { 1'h1, celloutsig_0_9z[3], celloutsig_0_10z };
  assign celloutsig_0_15z = celloutsig_0_3z[5:1] % { 1'h1, in_data[4:1] };
  assign celloutsig_0_19z = celloutsig_0_10z[5:3] % { 1'h1, celloutsig_0_9z[1:0] };
  assign celloutsig_0_20z = celloutsig_0_6z[13:4] % { 1'h1, celloutsig_0_14z };
  assign celloutsig_0_2z = celloutsig_0_1z[12:5] % { 1'h1, in_data[38:32] };
  assign celloutsig_0_22z = in_data[44:41] % { 1'h1, _01_[5:3] };
  assign celloutsig_0_23z = celloutsig_0_14z[5:2] % { 1'h1, celloutsig_0_14z[4:3], in_data[0] };
  assign celloutsig_0_26z = celloutsig_0_6z[6:4] % { 1'h1, celloutsig_0_12z[3:2] };
  assign celloutsig_0_27z = { celloutsig_0_1z[13:1], celloutsig_0_15z } % { 1'h1, celloutsig_0_12z[2:0], celloutsig_0_6z };
  assign celloutsig_0_28z = { celloutsig_0_7z[1:0], celloutsig_0_7z, celloutsig_0_26z, celloutsig_0_20z, celloutsig_0_15z } % { 1'h1, celloutsig_0_1z[12:8], _00_, celloutsig_0_19z, celloutsig_0_22z };
  assign { out_data[132:128], out_data[110:96], out_data[41:32], out_data[8:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_67z, celloutsig_0_68z };
endmodule
