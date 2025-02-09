/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [4:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [12:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [7:0] celloutsig_0_18z;
  wire [2:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire [5:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_36z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire [4:0] celloutsig_0_46z;
  wire [6:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [5:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [8:0] celloutsig_1_1z;
  wire [11:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  reg [5:0] celloutsig_1_6z;
  wire [8:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_4z = celloutsig_1_2z[5] ? in_data[172] : in_data[126];
  assign celloutsig_1_10z = ~(celloutsig_1_2z[9] | celloutsig_1_5z);
  assign celloutsig_0_14z = ~celloutsig_0_7z;
  assign celloutsig_0_36z = ~((celloutsig_0_23z | celloutsig_0_30z) & (celloutsig_0_22z | celloutsig_0_21z));
  assign celloutsig_0_11z = ~((celloutsig_0_4z | _00_) & (celloutsig_0_3z | celloutsig_0_8z));
  assign celloutsig_0_15z = ~((celloutsig_0_9z[3] | _01_) & (celloutsig_0_7z | celloutsig_0_1z));
  assign celloutsig_0_17z = ~((celloutsig_0_16z | celloutsig_0_4z) & (celloutsig_0_4z | celloutsig_0_12z));
  assign celloutsig_0_49z = celloutsig_0_46z[0] ^ celloutsig_0_11z;
  assign celloutsig_0_8z = in_data[75] ^ celloutsig_0_0z;
  reg [4:0] _12_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[0])
    if (!clkin_data[0]) _12_ <= 5'h00;
    else _12_ <= { celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z };
  assign { _00_, _02_[3:2], _01_, _02_[0] } = _12_;
  assign celloutsig_0_46z = { celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_24z, celloutsig_0_25z, celloutsig_0_24z } / { 1'h1, celloutsig_0_0z, celloutsig_0_15z, celloutsig_0_16z, celloutsig_0_42z };
  assign celloutsig_0_19z = { _01_, celloutsig_0_10z, celloutsig_0_0z } / { 1'h1, celloutsig_0_9z[3:2] };
  assign celloutsig_0_29z = { celloutsig_0_9z[3:0], celloutsig_0_11z, celloutsig_0_27z } / { 1'h1, celloutsig_0_1z, celloutsig_0_21z, celloutsig_0_21z, celloutsig_0_20z, celloutsig_0_12z };
  assign celloutsig_1_19z = { celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_12z, celloutsig_1_6z } == { celloutsig_1_2z[4], celloutsig_1_13z, celloutsig_1_2z, celloutsig_1_14z, celloutsig_1_0z };
  assign celloutsig_0_1z = in_data[29:23] == in_data[58:52];
  assign celloutsig_0_27z = { celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_22z } == { celloutsig_0_5z, celloutsig_0_25z, celloutsig_0_5z };
  assign celloutsig_0_4z = { in_data[71:69], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_0z } && { in_data[79:75], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_10z = { in_data[31:23], celloutsig_0_2z, celloutsig_0_1z } && { _00_, _02_[3:2], _01_, celloutsig_0_4z, celloutsig_0_1z, _00_, _02_[3:2], _01_, _02_[0] };
  assign celloutsig_0_2z = { in_data[21:15], celloutsig_0_1z, celloutsig_0_1z } && in_data[19:11];
  assign celloutsig_0_24z = { celloutsig_0_9z[4:3], celloutsig_0_3z, _00_, _02_[3:2], _01_, _02_[0], celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_19z, celloutsig_0_11z } && { celloutsig_0_13z[12:4], celloutsig_0_22z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_17z, celloutsig_0_9z };
  assign celloutsig_0_30z = celloutsig_0_13z[9:0] && { celloutsig_0_18z[7:6], celloutsig_0_9z, celloutsig_0_24z, celloutsig_0_12z };
  assign celloutsig_1_5z = ! { celloutsig_1_2z[4:2], celloutsig_1_4z };
  assign celloutsig_0_22z = ! { in_data[37:27], celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_21z, celloutsig_0_2z };
  assign celloutsig_0_48z = { celloutsig_0_36z, celloutsig_0_29z } * { celloutsig_0_24z, celloutsig_0_29z };
  assign celloutsig_0_42z = { celloutsig_0_13z[4:2], celloutsig_0_40z, celloutsig_0_24z, celloutsig_0_40z, celloutsig_0_14z } != celloutsig_0_13z[6:0];
  assign celloutsig_1_9z = { celloutsig_1_7z[6:2], celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_3z } != { celloutsig_1_1z[8:3], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_7z };
  assign celloutsig_1_18z = { celloutsig_1_2z[7:4], celloutsig_1_10z, celloutsig_1_13z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z } != { celloutsig_1_7z, celloutsig_1_9z };
  assign celloutsig_0_12z = { celloutsig_0_9z[4:3], celloutsig_0_8z } != { in_data[10], celloutsig_0_1z, celloutsig_0_5z };
  assign celloutsig_0_16z = { in_data[90:78], celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_8z } != { celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_10z, _00_, _02_[3:2], _01_, _02_[0], celloutsig_0_0z };
  assign celloutsig_1_2z = ~ in_data[153:142];
  assign celloutsig_0_9z = ~ { _00_, _02_[3:2], _01_, _02_[0], celloutsig_0_5z };
  assign celloutsig_1_14z = & in_data[153:141];
  assign celloutsig_0_20z = | { celloutsig_0_13z, celloutsig_0_2z };
  assign celloutsig_0_3z = | in_data[80:69];
  assign celloutsig_1_12z = | { celloutsig_1_9z, celloutsig_1_7z[6:4], celloutsig_1_5z, celloutsig_1_3z };
  assign celloutsig_0_21z = | in_data[22:20];
  assign celloutsig_0_25z = | { celloutsig_0_20z, celloutsig_0_13z[11:10], celloutsig_0_10z, celloutsig_0_5z };
  assign celloutsig_0_0z = ^ in_data[64:60];
  assign celloutsig_1_3z = ^ celloutsig_1_2z[8:2];
  assign celloutsig_1_8z = ^ in_data[120:117];
  assign celloutsig_1_13z = ^ celloutsig_1_7z[6:0];
  assign celloutsig_0_23z = ^ { celloutsig_0_13z[6:3], celloutsig_0_16z, celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_11z };
  assign celloutsig_1_7z = in_data[178:170] ~^ { celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_5z };
  assign celloutsig_0_13z = { celloutsig_0_9z[3:0], celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_1z } ^ { in_data[80:71], celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_40z = ~((celloutsig_0_1z & celloutsig_0_21z) | celloutsig_0_27z);
  always_latch
    if (clkin_data[32]) celloutsig_1_6z = 6'h00;
    else if (!clkin_data[64]) celloutsig_1_6z = { in_data[188:187], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_5z };
  assign celloutsig_0_5z = ~((celloutsig_0_0z & celloutsig_0_1z) | (celloutsig_0_0z & in_data[68]));
  assign celloutsig_1_0z = ~((in_data[102] & in_data[167]) | (in_data[113] & in_data[123]));
  assign celloutsig_0_7z = ~((_02_[3] & in_data[83]) | (celloutsig_0_2z & celloutsig_0_2z));
  assign { celloutsig_0_18z[4], celloutsig_0_18z[5], celloutsig_0_18z[3], celloutsig_0_18z[7:6], celloutsig_0_18z[0], celloutsig_0_18z[1] } = { celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_2z } ~^ { celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_13z[1], celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_10z };
  assign celloutsig_1_1z[8:1] = in_data[140:133] ^ in_data[178:171];
  assign { _02_[4], _02_[1] } = { _00_, _01_ };
  assign celloutsig_0_18z[2] = 1'h1;
  assign celloutsig_1_1z[0] = 1'h0;
  assign { out_data[128], out_data[96], out_data[38:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_48z, celloutsig_0_49z };
endmodule
