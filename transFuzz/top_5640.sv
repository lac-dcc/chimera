/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire [8:0] _06_;
  wire [4:0] _07_;
  wire [4:0] celloutsig_0_0z;
  wire [17:0] celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [2:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [15:0] celloutsig_0_16z;
  wire [26:0] celloutsig_0_18z;
  wire [2:0] celloutsig_0_1z;
  wire celloutsig_0_23z;
  wire [10:0] celloutsig_0_2z;
  wire celloutsig_0_32z;
  wire [9:0] celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_47z;
  wire [6:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [6:0] celloutsig_0_8z;
  wire celloutsig_0_98z;
  wire [3:0] celloutsig_0_99z;
  wire [8:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [6:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [22:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [24:0] celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire [7:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [2:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_5z = !(celloutsig_0_2z[4] ? celloutsig_0_0z[0] : celloutsig_0_0z[4]);
  assign celloutsig_1_11z = !(celloutsig_1_4z[8] ? celloutsig_1_9z : celloutsig_1_9z);
  assign celloutsig_0_41z = ~(celloutsig_0_7z | celloutsig_0_1z[1]);
  assign celloutsig_0_98z = ~(_03_ | celloutsig_0_47z);
  assign celloutsig_1_0z = ~(in_data[130] | in_data[142]);
  assign celloutsig_0_12z = ~(celloutsig_0_0z[1] | celloutsig_0_9z[3]);
  assign celloutsig_0_23z = ~(celloutsig_0_3z[9] | celloutsig_0_18z[4]);
  assign celloutsig_1_9z = ~celloutsig_1_5z[2];
  assign celloutsig_1_18z = ~celloutsig_1_15z;
  assign celloutsig_0_4z = celloutsig_0_2z[10] | ~(celloutsig_0_1z[2]);
  assign celloutsig_0_6z = celloutsig_0_5z | ~(celloutsig_0_3z[1]);
  assign celloutsig_1_7z = celloutsig_1_1z | ~(celloutsig_1_6z[5]);
  reg [8:0] _20_;
  always_ff @(posedge clkin_data[32], posedge celloutsig_1_19z[0])
    if (celloutsig_1_19z[0]) _20_ <= 9'h000;
    else _20_ <= { in_data[16:15], celloutsig_0_32z, celloutsig_0_4z, celloutsig_0_0z };
  assign { _06_[8:3], _01_, _00_, _04_ } = _20_;
  reg [4:0] _21_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _21_ <= 5'h00;
    else _21_ <= { celloutsig_0_11z[3:0], celloutsig_0_5z };
  assign { _07_[4], _02_, _07_[2], _05_, _03_ } = _21_;
  assign celloutsig_0_3z = { celloutsig_0_2z[9:3], celloutsig_0_1z } / { 1'h1, in_data[38:33], celloutsig_0_1z[2:1], in_data[0] };
  assign celloutsig_0_99z = celloutsig_0_16z[8:5] / { 1'h1, celloutsig_0_49z[2:0] };
  assign celloutsig_1_2z = in_data[172:150] / { 1'h1, in_data[123:102] };
  assign celloutsig_1_5z = { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_3z } / { 1'h1, celloutsig_1_4z[14:12] };
  assign celloutsig_1_6z = { celloutsig_1_2z[8:3], celloutsig_1_3z, celloutsig_1_0z } / { 1'h1, in_data[165:161], celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_10z = { celloutsig_0_8z[4:3], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_1z } / { 1'h1, in_data[17:9], celloutsig_0_8z, celloutsig_0_4z };
  assign celloutsig_1_8z = { in_data[180], celloutsig_1_7z, celloutsig_1_1z } / { 1'h1, celloutsig_1_4z[16], celloutsig_1_7z };
  assign celloutsig_1_19z = celloutsig_1_4z[21:15] / { 1'h1, celloutsig_1_4z[6:2], celloutsig_1_9z };
  assign celloutsig_0_16z = { celloutsig_0_10z[16:11], celloutsig_0_9z, celloutsig_0_5z } / { 1'h1, celloutsig_0_10z[14:0] };
  assign celloutsig_0_18z = { in_data[30:6], celloutsig_0_4z, celloutsig_0_15z } / { 1'h1, celloutsig_0_10z[16:0], celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_8z };
  assign celloutsig_0_2z = in_data[62:52] / { 1'h1, celloutsig_0_1z[0], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_0z = in_data[40:36] % { 1'h1, in_data[21:18] };
  assign celloutsig_0_49z = in_data[20:14] % { 1'h1, celloutsig_0_9z[6:1] };
  assign celloutsig_0_1z = in_data[24:22] % { 1'h1, in_data[58:57] };
  assign celloutsig_0_7z = { in_data[42:40], celloutsig_0_4z } != { celloutsig_0_2z[5:3], celloutsig_0_5z };
  assign celloutsig_1_12z = celloutsig_1_6z[7:2] != { celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_11z };
  assign celloutsig_0_47z = & { celloutsig_0_41z, _06_[8:5], celloutsig_0_23z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_7z, in_data[46] };
  assign celloutsig_1_1z = & in_data[154:139];
  assign celloutsig_1_3z = & celloutsig_1_2z[16:14];
  assign celloutsig_1_15z = & { celloutsig_1_12z, celloutsig_1_9z, celloutsig_1_2z[5:0], in_data[154:139] };
  assign celloutsig_0_15z = & { celloutsig_0_14z[2:1], celloutsig_0_12z };
  assign celloutsig_0_32z = & { celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_7z, in_data[46] };
  assign celloutsig_0_8z = { celloutsig_0_0z[4:3], celloutsig_0_0z } >> celloutsig_0_2z[6:0];
  assign celloutsig_0_9z = { in_data[91:84], celloutsig_0_4z } >> { in_data[69:62], celloutsig_0_4z };
  assign celloutsig_1_4z = { in_data[143:120], celloutsig_1_3z } >> { celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_11z = { celloutsig_0_3z[3:0], celloutsig_0_7z } >> celloutsig_0_9z[5:1];
  assign celloutsig_0_14z = celloutsig_0_11z[2:0] >> { celloutsig_0_2z[4:3], celloutsig_0_12z };
  assign _06_[2:0] = { _01_, _00_, _04_ };
  assign { _07_[3], _07_[1:0] } = { _02_, _05_, _03_ };
  assign { out_data[128], out_data[102:96], out_data[32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_98z, celloutsig_0_99z };
endmodule
