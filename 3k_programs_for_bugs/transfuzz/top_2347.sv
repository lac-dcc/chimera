/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [3:0] _00_;
  reg [9:0] _01_;
  wire celloutsig_0_0z;
  wire [6:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire [3:0] celloutsig_0_18z;
  wire [18:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [2:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [13:0] celloutsig_0_25z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [13:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [5:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [8:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [6:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [5:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_9z = ~in_data[39];
  assign celloutsig_0_22z = ~celloutsig_0_15z;
  assign celloutsig_0_2z = ~celloutsig_0_0z;
  assign celloutsig_1_17z = ~((celloutsig_1_4z[2] | celloutsig_1_9z) & (celloutsig_1_13z | in_data[170]));
  assign celloutsig_0_11z = ~((celloutsig_0_6z | in_data[72]) & (in_data[69] | celloutsig_0_0z));
  assign celloutsig_0_12z = ~((celloutsig_0_5z[9] | celloutsig_0_8z) & (celloutsig_0_1z | celloutsig_0_9z));
  assign celloutsig_0_21z = ~((celloutsig_0_19z[7] | celloutsig_0_9z) & (celloutsig_0_20z[1] | celloutsig_0_8z));
  always_ff @(negedge clkin_data[64], posedge clkin_data[96])
    if (clkin_data[96]) _00_ <= 4'h0;
    else _00_ <= in_data[144:141];
  always_ff @(negedge clkin_data[32], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _01_ <= 10'h000;
    else _01_ <= { celloutsig_0_13z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_10z };
  assign celloutsig_0_0z = in_data[50:35] == in_data[64:49];
  assign celloutsig_1_8z = { celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_4z } == { _00_[2:1], celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_3z };
  assign celloutsig_1_9z = { in_data[179:166], _00_, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_5z } == { celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_8z, _00_, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_8z, celloutsig_1_1z, _00_, celloutsig_1_8z };
  assign celloutsig_1_10z = { in_data[183:161], celloutsig_1_3z, celloutsig_1_7z } == in_data[171:147];
  assign celloutsig_1_13z = { in_data[108:103], celloutsig_1_5z } == { _00_[2], celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_9z };
  assign celloutsig_1_18z = { _00_[2], celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_13z } == { celloutsig_1_15z[3:1], celloutsig_1_7z };
  assign celloutsig_0_6z = { in_data[44:41], celloutsig_0_0z, celloutsig_0_4z } == celloutsig_0_5z[8:3];
  assign celloutsig_0_1z = in_data[67:65] == in_data[93:91];
  assign celloutsig_0_13z = { celloutsig_0_1z, celloutsig_0_4z } == { celloutsig_0_10z[1], celloutsig_0_11z };
  assign celloutsig_0_23z = celloutsig_0_19z[18:14] == in_data[60:56];
  assign celloutsig_0_24z = { celloutsig_0_1z, celloutsig_0_13z, celloutsig_0_4z, celloutsig_0_20z, celloutsig_0_13z, celloutsig_0_15z, celloutsig_0_3z } == { celloutsig_0_3z, celloutsig_0_20z, celloutsig_0_21z, celloutsig_0_18z };
  assign celloutsig_1_1z = { in_data[163:134], celloutsig_1_0z } == in_data[168:138];
  assign celloutsig_0_5z = { in_data[20:8], celloutsig_0_3z } * { celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_1_15z = { celloutsig_1_12z[3], _00_, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_3z } * { celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_0_18z = { celloutsig_0_10z[4:3], celloutsig_0_12z, celloutsig_0_3z } * celloutsig_0_5z[7:4];
  assign celloutsig_1_4z = - { celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_0_19z = - { celloutsig_0_5z[11:4], celloutsig_0_1z, _01_ };
  assign celloutsig_0_20z = - { celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_13z };
  assign celloutsig_0_25z = - { in_data[16:8], celloutsig_0_3z, celloutsig_0_24z, in_data[39], celloutsig_0_11z, celloutsig_0_21z };
  assign celloutsig_1_3z = | in_data[184:181];
  assign celloutsig_1_7z = | { celloutsig_1_5z, celloutsig_1_4z, in_data[184:181], in_data[159:154], in_data[112:100] };
  assign celloutsig_0_15z = | in_data[35:28];
  assign celloutsig_0_30z = | { celloutsig_0_25z[10:9], celloutsig_0_23z };
  assign celloutsig_1_0z = | in_data[112:100];
  assign celloutsig_1_5z = ~^ { in_data[173:161], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_4z = ~^ { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_1_11z = ~^ in_data[132:115];
  assign celloutsig_0_8z = ~^ { in_data[6:5], celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_3z };
  assign celloutsig_0_3z = ~^ in_data[36:19];
  assign celloutsig_0_31z = ~^ { celloutsig_0_8z, celloutsig_0_21z, celloutsig_0_23z, celloutsig_0_12z, celloutsig_0_22z };
  assign celloutsig_1_12z = { celloutsig_1_2z[3:1], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_3z } - celloutsig_1_2z;
  assign celloutsig_1_19z = { celloutsig_1_2z[4], celloutsig_1_17z, _00_, celloutsig_1_11z } - { _00_[3:1], celloutsig_1_18z, celloutsig_1_17z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_0_10z = { celloutsig_0_5z[8:4], celloutsig_0_1z, celloutsig_0_6z } - { in_data[78], celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_9z };
  assign celloutsig_1_2z = in_data[107:102] - { in_data[156:154], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z };
  assign { out_data[128], out_data[102:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_30z, celloutsig_0_31z };
endmodule
