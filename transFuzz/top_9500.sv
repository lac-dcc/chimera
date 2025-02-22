/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [3:0] celloutsig_0_0z;
  wire [6:0] celloutsig_0_10z;
  wire [4:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [11:0] celloutsig_0_15z;
  wire [7:0] celloutsig_0_16z;
  wire celloutsig_0_1z;
  wire [4:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [6:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [3:0] celloutsig_1_12z;
  wire celloutsig_1_15z;
  wire [4:0] celloutsig_1_16z;
  wire [8:0] celloutsig_1_18z;
  wire [14:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [7:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [9:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_8z = !(celloutsig_1_4z ? celloutsig_1_3z : celloutsig_1_0z[0]);
  assign celloutsig_1_4z = ~in_data[102];
  assign celloutsig_0_6z = ~((celloutsig_0_0z[3] | celloutsig_0_3z) & celloutsig_0_0z[3]);
  assign celloutsig_0_9z = ~((celloutsig_0_6z | celloutsig_0_1z) & (celloutsig_0_4z | celloutsig_0_8z));
  reg [19:0] _04_;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[32])
    if (clkin_data[32]) _04_ <= 20'h00000;
    else _04_ <= { celloutsig_0_15z[11:1], celloutsig_0_13z, celloutsig_0_16z };
  assign out_data[19:0] = _04_;
  assign celloutsig_1_11z = celloutsig_1_2z[4:0] == celloutsig_1_5z[6:2];
  assign celloutsig_0_3z = { in_data[13:5], celloutsig_0_0z } == in_data[36:24];
  assign celloutsig_0_8z = ! { celloutsig_0_7z[6:2], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_1_10z = ! celloutsig_1_5z[6:2];
  assign celloutsig_0_4z = { in_data[62], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z } || in_data[93:76];
  assign celloutsig_0_0z = in_data[40:37] * in_data[36:33];
  assign celloutsig_1_18z = { celloutsig_1_16z[4:3], celloutsig_1_16z, celloutsig_1_8z, celloutsig_1_3z } * { in_data[164:160], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_9z };
  assign celloutsig_1_16z = - { celloutsig_1_12z, celloutsig_1_6z };
  assign celloutsig_0_5z = - celloutsig_0_2z;
  assign celloutsig_0_7z = - { in_data[43:42], celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_1_2z = - { celloutsig_1_0z[2:1], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_12z = - { celloutsig_1_7z[7:5], celloutsig_1_10z };
  assign celloutsig_1_6z = & in_data[108:97];
  assign celloutsig_1_9z = & celloutsig_1_5z;
  assign celloutsig_1_1z = in_data[127] & in_data[100];
  assign celloutsig_0_13z = | { celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_6z };
  assign celloutsig_0_1z = | in_data[88:85];
  assign celloutsig_1_3z = | { celloutsig_1_1z, celloutsig_1_0z[1:0] };
  assign celloutsig_1_15z = | { celloutsig_1_11z, celloutsig_1_6z, celloutsig_1_2z };
  assign celloutsig_0_2z = { in_data[15], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z } >> { celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_1_7z = { celloutsig_1_0z[2], celloutsig_1_5z, celloutsig_1_4z } >> { celloutsig_1_5z[6:5], celloutsig_1_5z };
  assign celloutsig_1_19z = { celloutsig_1_12z[0], celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_4z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_4z } - { celloutsig_1_7z[5:3], celloutsig_1_1z, celloutsig_1_15z, celloutsig_1_10z, celloutsig_1_9z, celloutsig_1_5z };
  assign celloutsig_0_10z = { in_data[21:20], celloutsig_0_0z, celloutsig_0_4z } - { in_data[24:20], celloutsig_0_8z, celloutsig_0_1z };
  assign celloutsig_0_15z = in_data[42:31] - { celloutsig_0_7z[4:3], celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_7z };
  assign celloutsig_1_0z = in_data[141:139] - in_data[187:185];
  assign celloutsig_0_12z = celloutsig_0_10z[6:2] ~^ celloutsig_0_2z;
  assign celloutsig_0_16z = { celloutsig_0_0z[3:1], celloutsig_0_12z } ~^ { celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_5z };
  assign celloutsig_1_5z = in_data[113:106] ~^ { in_data[187:182], celloutsig_1_1z, celloutsig_1_4z };
  assign { out_data[136:128], out_data[110:96], out_data[39:32] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_16z };
endmodule
