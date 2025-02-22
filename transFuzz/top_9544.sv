/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [3:0] celloutsig_0_0z;
  wire [9:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_13z;
  wire [6:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [7:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_27z;
  wire [9:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [11:0] celloutsig_0_9z;
  wire [7:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire [18:0] celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire [11:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [16:0] celloutsig_1_5z;
  wire celloutsig_1_7z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_13z = ~(celloutsig_1_7z & celloutsig_1_11z);
  assign celloutsig_0_4z = ~(celloutsig_0_0z[3] & in_data[80]);
  assign celloutsig_1_3z = ~((celloutsig_1_1z | celloutsig_1_1z) & in_data[122]);
  assign celloutsig_0_3z = ~((in_data[94] | in_data[53]) & (celloutsig_0_1z | in_data[12]));
  assign celloutsig_0_6z = ~((celloutsig_0_3z | celloutsig_0_2z[3]) & (celloutsig_0_5z | celloutsig_0_5z));
  reg [9:0] _05_;
  always_ff @(negedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _05_ <= 10'h000;
    else _05_ <= { celloutsig_0_9z[0], celloutsig_0_18z, celloutsig_0_3z };
  assign out_data[41:32] = _05_;
  assign celloutsig_0_9z = { celloutsig_0_2z[7:6], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_6z } & { celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_2z = { celloutsig_0_0z[1], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z } & in_data[13:4];
  assign celloutsig_1_7z = celloutsig_1_5z[12:8] == celloutsig_1_5z[13:9];
  assign celloutsig_1_19z = celloutsig_1_5z[11:4] == { celloutsig_1_14z[13:7], celloutsig_1_1z };
  assign celloutsig_0_15z = celloutsig_0_2z[6:3] >= celloutsig_0_14z[3:0];
  assign celloutsig_0_7z = { celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_6z } <= { in_data[92:90], celloutsig_0_5z };
  assign celloutsig_0_11z = { celloutsig_0_2z, celloutsig_0_5z } && { celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_1z = { in_data[55:48], celloutsig_0_0z, celloutsig_0_0z } && in_data[19:4];
  assign celloutsig_0_13z = { in_data[15], celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_11z } && { in_data[79:74], celloutsig_0_4z };
  assign celloutsig_0_16z = { celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_13z } && { celloutsig_0_2z[9:7], celloutsig_0_13z, celloutsig_0_13z };
  assign celloutsig_1_11z = { celloutsig_1_5z[10:9], celloutsig_1_4z } || { in_data[127:126], celloutsig_1_4z };
  assign celloutsig_1_4z = celloutsig_1_2z & ~(celloutsig_1_1z);
  assign celloutsig_1_16z = celloutsig_1_4z & ~(celloutsig_1_10z[3]);
  assign celloutsig_1_10z = { celloutsig_1_5z[7:1], celloutsig_1_3z } % { 1'h1, celloutsig_1_5z[9:3] };
  assign celloutsig_0_10z = { in_data[33:30], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_5z } * { in_data[72:67], celloutsig_0_0z };
  assign celloutsig_0_5z = { celloutsig_0_2z[9:4], celloutsig_0_3z } !== { celloutsig_0_0z[1:0], celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_1_2z = in_data[179:175] !== { celloutsig_1_1z, celloutsig_1_1z, 1'h0, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_14z = ~ celloutsig_0_2z[6:0];
  assign celloutsig_1_14z = { in_data[170:153], celloutsig_1_11z } | { celloutsig_1_5z[5:4], celloutsig_1_5z[16:1], celloutsig_1_5z[3] };
  assign celloutsig_1_1z = | in_data[178:169];
  assign celloutsig_0_0z = in_data[68:65] >> in_data[55:52];
  assign celloutsig_1_18z = { celloutsig_1_14z[18:9], celloutsig_1_16z, celloutsig_1_16z } >>> { celloutsig_1_10z[6:1], celloutsig_1_16z, celloutsig_1_16z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_16z, celloutsig_1_13z };
  assign celloutsig_0_18z = { celloutsig_0_10z[8:2], celloutsig_0_1z } >>> { celloutsig_0_14z[3:0], celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_16z };
  assign celloutsig_0_27z = ~((celloutsig_0_0z[0] & celloutsig_0_0z[3]) | in_data[14]);
  assign { celloutsig_1_5z[1], celloutsig_1_5z[3:2], celloutsig_1_5z[16:4] } = ~ { celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z, in_data[153:141] };
  assign celloutsig_1_5z[0] = celloutsig_1_5z[3];
  assign { out_data[139:128], out_data[96], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_27z };
endmodule
