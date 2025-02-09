/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [15:0] _01_;
  wire celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_12z;
  wire [9:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [5:0] celloutsig_0_16z;
  wire celloutsig_0_1z;
  wire [5:0] celloutsig_0_25z;
  wire celloutsig_0_2z;
  wire [15:0] celloutsig_0_31z;
  wire [10:0] celloutsig_0_32z;
  wire [9:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [17:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [13:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [4:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [6:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [9:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [10:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_1z = ~(celloutsig_1_0z | in_data[113]);
  assign celloutsig_0_1z = ~(celloutsig_0_0z | celloutsig_0_0z);
  assign celloutsig_1_2z = ~((in_data[112] | celloutsig_1_1z) & (celloutsig_1_1z | celloutsig_1_0z));
  assign celloutsig_0_9z = ~((celloutsig_0_5z[0] | celloutsig_0_8z) & (celloutsig_0_7z[3] | celloutsig_0_1z));
  assign celloutsig_1_7z = celloutsig_1_4z ^ celloutsig_1_5z;
  assign celloutsig_0_6z = celloutsig_0_1z ^ celloutsig_0_0z;
  assign celloutsig_0_15z = celloutsig_0_2z ^ in_data[56];
  assign celloutsig_0_31z = { in_data[64:62], _01_[12:7], _00_, _01_[5:0] } + { in_data[32:19], celloutsig_0_9z, celloutsig_0_6z };
  assign celloutsig_1_9z = { in_data[132], celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_4z } + { in_data[133:124], celloutsig_1_0z };
  reg [12:0] _11_;
  always_ff @(negedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _11_ <= 13'h0000;
    else _11_ <= { celloutsig_0_3z[7:0], celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_15z };
  assign { _01_[12:7], _00_, _01_[5:0] } = _11_;
  assign celloutsig_0_3z = { in_data[41:40], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z } & { in_data[75:69], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_6z = { celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_0z } & { in_data[133:132], celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_0_25z = { celloutsig_0_7z[4:1], celloutsig_0_6z, celloutsig_0_0z } & celloutsig_0_14z[9:4];
  assign celloutsig_1_3z = { in_data[116], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z } / { 1'h1, in_data[142:138], celloutsig_1_0z };
  assign celloutsig_0_10z = celloutsig_0_7z[5:3] / { 1'h1, celloutsig_0_9z, celloutsig_0_0z };
  assign celloutsig_0_32z = { celloutsig_0_10z, celloutsig_0_25z, celloutsig_0_12z, celloutsig_0_9z } / { 1'h1, _00_, _01_[5:3], celloutsig_0_16z };
  assign celloutsig_0_0z = in_data[8:5] >= in_data[49:46];
  assign celloutsig_1_5z = celloutsig_1_3z[6:2] || celloutsig_1_3z[4:0];
  assign celloutsig_0_8z = celloutsig_0_5z[14:4] || { celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_2z = { in_data[43:28], celloutsig_0_1z } || { in_data[15:1], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_19z = celloutsig_1_9z[0] & ~(celloutsig_1_18z[2]);
  assign celloutsig_0_5z = { celloutsig_0_3z[8:4], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_3z } % { 1'h1, celloutsig_0_3z[8:4], celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_3z[9:1], in_data[0] };
  assign celloutsig_1_18z = { celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_8z } % { 1'h1, celloutsig_1_9z[4:1] };
  assign celloutsig_0_16z = { celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_9z } % { 1'h1, celloutsig_0_3z[5:1] };
  assign celloutsig_1_4z = { in_data[126:125], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z } != in_data[179:175];
  assign celloutsig_0_4z = in_data[46:9] != { in_data[70:34], celloutsig_0_0z };
  assign celloutsig_0_12z = { in_data[74:73], celloutsig_0_8z } != { celloutsig_0_10z[1:0], celloutsig_0_2z };
  assign celloutsig_1_0z = ~^ in_data[177:170];
  assign celloutsig_1_8z = ~^ { celloutsig_1_6z[2:0], celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_0_7z = celloutsig_0_5z[17:4] << { celloutsig_0_5z[13:1], celloutsig_0_2z };
  assign celloutsig_0_14z = in_data[21:12] << in_data[87:78];
  assign { _01_[15:13], _01_[6] } = { in_data[64:62], _00_ };
  assign { out_data[132:128], out_data[96], out_data[47:32], out_data[10:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_31z, celloutsig_0_32z };
endmodule
