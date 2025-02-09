/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [8:0] _01_;
  wire [2:0] _02_;
  reg [3:0] _03_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [8:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [3:0] celloutsig_0_13z;
  wire [3:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [6:0] celloutsig_0_16z;
  wire [12:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [9:0] celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire [10:0] celloutsig_0_22z;
  wire [5:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [2:0] celloutsig_0_27z;
  wire celloutsig_0_2z;
  wire [4:0] celloutsig_0_33z;
  wire [21:0] celloutsig_0_34z;
  wire [15:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [3:0] celloutsig_0_42z;
  wire [11:0] celloutsig_0_45z;
  wire celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire [5:0] celloutsig_0_50z;
  wire celloutsig_0_5z;
  wire [10:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [19:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [6:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [9:0] celloutsig_1_11z;
  wire [3:0] celloutsig_1_13z;
  wire [18:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [4:0] celloutsig_1_1z;
  wire [20:0] celloutsig_1_2z;
  wire [2:0] celloutsig_1_4z;
  wire [11:0] celloutsig_1_5z;
  wire [19:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_10z = celloutsig_0_9z ? celloutsig_0_1z[5] : celloutsig_0_8z[3];
  assign celloutsig_0_19z = !(celloutsig_0_5z ? celloutsig_0_8z[13] : celloutsig_0_13z[0]);
  assign celloutsig_0_5z = celloutsig_0_2z | ~(celloutsig_0_3z[0]);
  assign celloutsig_0_9z = celloutsig_0_2z | ~(celloutsig_0_5z);
  assign celloutsig_0_18z = in_data[6] | ~(celloutsig_0_13z[3]);
  assign celloutsig_0_2z = celloutsig_0_1z[5] | ~(celloutsig_0_0z);
  assign celloutsig_0_47z = _00_ ^ in_data[89];
  assign celloutsig_1_19z = celloutsig_1_5z[8] ^ celloutsig_1_5z[9];
  assign celloutsig_0_17z = { celloutsig_0_8z[15:6], celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_0z } + in_data[18:6];
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _01_ <= 9'h000;
    else _01_ <= { in_data[15:10], celloutsig_0_24z, celloutsig_0_9z, celloutsig_0_18z };
  reg [2:0] _14_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _14_ <= 3'h0;
    else _14_ <= celloutsig_0_11z[7:5];
  assign { _02_[2:1], _00_ } = _14_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[32])
    if (!clkin_data[32]) _03_ <= 4'h0;
    else _03_ <= { celloutsig_0_17z[3:2], celloutsig_0_2z, celloutsig_0_7z };
  assign celloutsig_1_6z = { celloutsig_1_2z[14:3], celloutsig_1_1z, celloutsig_1_4z } & { celloutsig_1_2z[20:6], celloutsig_1_1z };
  assign celloutsig_0_1z = { in_data[12:10], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } / { 1'h1, in_data[81:78], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, in_data[0] };
  assign celloutsig_0_14z = celloutsig_0_13z / { 1'h1, celloutsig_0_11z[2:0] };
  assign celloutsig_0_0z = in_data[72:70] >= in_data[11:9];
  assign celloutsig_0_49z = { celloutsig_0_19z, celloutsig_0_27z } >= { celloutsig_0_14z[2:1], celloutsig_0_21z, celloutsig_0_24z };
  assign celloutsig_0_24z = { celloutsig_0_23z[5:4], celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_18z } >= 5'h1f;
  assign celloutsig_0_34z = { celloutsig_0_7z, _01_, celloutsig_0_19z, celloutsig_0_16z[6:1], celloutsig_0_16z[1], celloutsig_0_14z } % { 1'h1, _03_[2:0], celloutsig_0_33z, celloutsig_0_17z };
  assign celloutsig_1_4z = celloutsig_1_2z[13:11] % { 1'h1, celloutsig_1_2z[9:8] };
  assign celloutsig_0_8z = { celloutsig_0_1z[8:2], 1'h0, celloutsig_0_6z[9:1], celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_7z } % { 10'h3ff, celloutsig_0_1z };
  assign celloutsig_0_13z = in_data[64:61] % { 1'h1, celloutsig_0_11z[4:2] };
  assign celloutsig_1_18z = ~ { celloutsig_1_6z[17:4], celloutsig_1_10z, celloutsig_1_13z };
  assign celloutsig_0_27z = ~ celloutsig_0_23z[4:2];
  assign celloutsig_1_10z = celloutsig_1_4z[2] & in_data[115];
  assign celloutsig_0_21z = celloutsig_0_16z[2] & celloutsig_0_9z;
  assign celloutsig_1_7z = ~^ { celloutsig_1_5z[7:6], celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_0_12z = ~^ { celloutsig_0_6z[5:3], celloutsig_0_5z };
  assign celloutsig_0_15z = ~^ { 8'hff, celloutsig_0_10z, 1'h0, celloutsig_0_6z[9:1], celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_7z };
  assign celloutsig_0_33z = celloutsig_0_23z[5:1] >> { celloutsig_0_2z, celloutsig_0_14z };
  assign celloutsig_0_42z = { celloutsig_0_8z[14:13], celloutsig_0_7z, celloutsig_0_40z } >> { celloutsig_0_17z[7:6], celloutsig_0_5z, celloutsig_0_40z };
  assign celloutsig_1_0z = in_data[175:169] >> in_data[185:179];
  assign celloutsig_1_5z = celloutsig_1_2z[11:0] >> { celloutsig_1_2z[9:1], celloutsig_1_4z };
  assign celloutsig_1_11z = { in_data[105:104], celloutsig_1_4z, celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_4z } >> { celloutsig_1_6z[19], celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_0z };
  assign celloutsig_1_2z = { celloutsig_1_0z[2:1], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z } << in_data[117:97];
  assign celloutsig_0_22z = { in_data[49:40], celloutsig_0_9z } << celloutsig_0_8z[19:9];
  assign celloutsig_0_45z = { celloutsig_0_40z, celloutsig_0_14z, celloutsig_0_23z, celloutsig_0_15z } <<< { celloutsig_0_34z[18:11], celloutsig_0_42z };
  assign celloutsig_1_1z = in_data[137:133] <<< celloutsig_1_0z[4:0];
  assign celloutsig_1_13z = in_data[191:188] <<< celloutsig_1_11z[3:0];
  assign celloutsig_0_3z = in_data[87:72] ~^ { celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_50z = celloutsig_0_45z[9:4] ^ { celloutsig_0_45z[6], celloutsig_0_47z, celloutsig_0_40z, celloutsig_0_27z };
  assign celloutsig_0_23z = { celloutsig_0_22z[3:1], celloutsig_0_21z, celloutsig_0_0z, celloutsig_0_2z } ^ { celloutsig_0_16z[4:1], celloutsig_0_16z[1], celloutsig_0_10z };
  assign celloutsig_0_40z = ~((celloutsig_0_5z & celloutsig_0_12z) | (celloutsig_0_22z[6] & celloutsig_0_1z[0]));
  assign celloutsig_0_6z[1] = ~ celloutsig_0_1z[1];
  assign celloutsig_0_6z[2] = ~ celloutsig_0_1z[2];
  assign celloutsig_0_6z[3] = ~ celloutsig_0_1z[3];
  assign celloutsig_0_6z[4] = ~ celloutsig_0_1z[4];
  assign celloutsig_0_6z[5] = ~ celloutsig_0_1z[5];
  assign celloutsig_0_6z[6] = ~ celloutsig_0_1z[6];
  assign celloutsig_0_6z[7] = ~ celloutsig_0_1z[7];
  assign celloutsig_0_6z[8] = ~ celloutsig_0_1z[8];
  assign celloutsig_0_6z[9] = ~ celloutsig_0_1z[9];
  assign { celloutsig_0_16z[6:5], celloutsig_0_16z[3], celloutsig_0_16z[4], celloutsig_0_16z[2:1] } = ~ { celloutsig_0_14z[3:2], celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_7z = celloutsig_0_0z ^ celloutsig_0_1z[0];
  assign { celloutsig_0_11z[0], celloutsig_0_11z[7:1] } = { celloutsig_0_5z, celloutsig_0_6z[9:3] } ^ { celloutsig_0_3z[7], celloutsig_0_3z[14:8] };
  assign _02_[0] = _00_;
  assign celloutsig_0_11z[8] = celloutsig_0_3z[15];
  assign celloutsig_0_16z[0] = celloutsig_0_16z[1];
  assign { celloutsig_0_6z[10], celloutsig_0_6z[0] } = { 1'h0, celloutsig_0_7z };
  assign { out_data[146:128], out_data[96], out_data[32], out_data[5:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_49z, celloutsig_0_50z };
endmodule
