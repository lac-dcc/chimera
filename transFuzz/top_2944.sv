/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [13:0] celloutsig_0_0z;
  wire [3:0] celloutsig_0_4z;
  wire celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire [6:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_13z;
  wire [4:0] celloutsig_1_15z;
  wire [5:0] celloutsig_1_16z;
  wire [16:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [4:0] celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire [16:0] celloutsig_1_3z;
  wire [5:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [11:0] celloutsig_1_6z;
  wire [3:0] celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_0z = in_data[154] | ~(in_data[174]);
  assign celloutsig_1_9z = celloutsig_1_0z | ~(celloutsig_1_7z[1]);
  assign celloutsig_1_18z = celloutsig_1_16z[2] | ~(celloutsig_1_6z[11]);
  assign celloutsig_1_6z = { celloutsig_1_3z[15:5], celloutsig_1_5z } + { celloutsig_1_2z[2:1], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_12z = { celloutsig_1_11z, celloutsig_1_10z[3:1], celloutsig_1_10z[1] } + { celloutsig_1_1z[2:1], celloutsig_1_1z, celloutsig_1_9z };
  assign celloutsig_1_13z = { in_data[169:167], celloutsig_1_0z } + celloutsig_1_7z;
  reg [4:0] _06_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _06_ <= 5'h00;
    else _06_ <= in_data[78:74];
  assign out_data[36:32] = _06_;
  assign celloutsig_0_4z = celloutsig_0_0z[4:1] / { 1'h1, celloutsig_0_0z[5:3] };
  assign celloutsig_1_1z = in_data[170:167] / { 1'h1, in_data[99:97] };
  assign celloutsig_1_19z = celloutsig_1_17z[16:12] / { 1'h1, celloutsig_1_12z[5:2] };
  assign celloutsig_1_5z = ! { celloutsig_1_2z[3], celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_0_0z = in_data[48:35] % { 1'h1, in_data[89:77] };
  assign celloutsig_1_7z = celloutsig_1_3z[15:12] % { 1'h1, celloutsig_1_4z[4:3], celloutsig_1_0z };
  assign celloutsig_1_15z = { celloutsig_1_9z, celloutsig_1_10z[3:1], celloutsig_1_10z[1] } * celloutsig_1_4z[4:0];
  assign celloutsig_1_4z = - { celloutsig_1_2z[0], celloutsig_1_2z };
  assign celloutsig_1_11z = - celloutsig_1_7z[3:1];
  assign celloutsig_1_16z = ~ { celloutsig_1_15z[2:1], celloutsig_1_13z };
  assign celloutsig_1_2z = in_data[110:106] >>> { in_data[172], celloutsig_1_1z };
  assign celloutsig_1_3z = { celloutsig_1_2z[4:3], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z } >>> in_data[121:105];
  assign celloutsig_1_17z = { celloutsig_1_15z, celloutsig_1_6z } >>> { celloutsig_1_1z[3], celloutsig_1_1z, celloutsig_1_16z, celloutsig_1_15z, celloutsig_1_0z };
  assign { celloutsig_1_10z[1], celloutsig_1_10z[3:2] } = ~ { celloutsig_1_5z, celloutsig_1_2z[1:0] };
  assign celloutsig_1_10z[0] = celloutsig_1_10z[1];
  assign { out_data[128], out_data[100:96], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_4z };
endmodule
