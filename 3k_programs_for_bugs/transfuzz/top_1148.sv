/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [9:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [5:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [10:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [9:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_35z;
  wire celloutsig_0_38z;
  wire celloutsig_0_40z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [18:0] celloutsig_1_0z;
  wire celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [16:0] celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [5:0] _01_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[0])
    if (clkin_data[0]) _01_ <= 6'h00;
    else _01_ <= { in_data[13:11], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z };
  assign { _00_[6:2], _00_[0] } = _01_;
  assign celloutsig_0_16z = celloutsig_0_10z ^ celloutsig_0_12z;
  assign celloutsig_0_28z = celloutsig_0_10z ^ celloutsig_0_23z;
  assign celloutsig_1_6z = { in_data[131:116], celloutsig_1_1z } + { celloutsig_1_0z[14:0], celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_0_8z = { celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_0z } + { celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_7z };
  assign celloutsig_0_30z = { 1'h0, celloutsig_0_7z, 1'h0, _00_[6:2], 1'h0, _00_[0] } + { celloutsig_0_13z[3:1], celloutsig_0_29z, celloutsig_0_28z, celloutsig_0_25z, celloutsig_0_22z, celloutsig_0_19z, celloutsig_0_10z, celloutsig_0_18z };
  reg [10:0] _07_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _07_ <= 11'h000;
    else _07_ <= in_data[94:84];
  assign out_data[10:0] = _07_;
  assign celloutsig_0_35z = { celloutsig_0_26z[8], celloutsig_0_26z[8], celloutsig_0_26z[6:4], celloutsig_0_26z[5], celloutsig_0_32z, celloutsig_0_15z, celloutsig_0_23z } === { in_data[36:34], celloutsig_0_32z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_23z, celloutsig_0_11z };
  assign celloutsig_1_9z = in_data[172:170] === { celloutsig_1_6z[4], celloutsig_1_8z, celloutsig_1_2z };
  assign celloutsig_0_6z = { _00_[6:3], 1'h0, celloutsig_0_1z } === { _00_[4:2], 1'h0, _00_[0], 1'h0 };
  assign celloutsig_0_7z = in_data[31:20] === { celloutsig_0_1z, _00_[6:2], 1'h0, _00_[0], celloutsig_0_0z, 1'h0, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_9z = { celloutsig_0_6z, celloutsig_0_7z, 1'h0 } === { in_data[78:77], celloutsig_0_1z };
  assign celloutsig_0_23z = { _00_[6], celloutsig_0_9z, celloutsig_0_5z } === { celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_9z };
  assign celloutsig_0_29z = { celloutsig_0_5z, 1'h0, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_27z, _00_[6:2], 1'h0, _00_[0], celloutsig_0_15z, celloutsig_0_13z[5], celloutsig_0_13z[5], celloutsig_0_13z[3:1], celloutsig_0_13z[2], celloutsig_0_24z } === { celloutsig_0_13z[5], celloutsig_0_25z, celloutsig_0_16z, celloutsig_0_15z, celloutsig_0_24z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_27z, celloutsig_0_17z, celloutsig_0_19z, celloutsig_0_26z[10:8], celloutsig_0_26z[8], celloutsig_0_26z[6:4], celloutsig_0_26z[5], celloutsig_0_26z[2:0], 1'h0 };
  assign celloutsig_0_32z = { celloutsig_0_13z[5], celloutsig_0_13z[5], celloutsig_0_13z[3], celloutsig_0_9z, celloutsig_0_28z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_25z, celloutsig_0_11z, celloutsig_0_23z, celloutsig_0_15z } === { _00_[6:2], celloutsig_0_23z, celloutsig_0_18z, celloutsig_0_0z, celloutsig_0_19z, celloutsig_0_1z, celloutsig_0_24z };
  assign celloutsig_0_40z = { celloutsig_0_13z[5], celloutsig_0_13z[5], celloutsig_0_13z[3], celloutsig_0_20z, celloutsig_0_38z, _00_[6:2], _00_[0], celloutsig_0_13z[5], celloutsig_0_13z[5], celloutsig_0_13z[3:1], celloutsig_0_13z[2], celloutsig_0_35z } && { celloutsig_0_15z, celloutsig_0_32z, celloutsig_0_31z, celloutsig_0_30z, celloutsig_0_16z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_7z };
  assign celloutsig_1_4z = in_data[167:162] && { celloutsig_1_0z[18:14], celloutsig_1_3z };
  assign celloutsig_0_5z = in_data[78:59] && { in_data[46:31], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_31z = { celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_14z, celloutsig_0_12z } && { in_data[30:28], celloutsig_0_11z, celloutsig_0_11z };
  assign celloutsig_0_0z = in_data[93:90] || in_data[78:75];
  assign celloutsig_0_38z = { celloutsig_0_1z, celloutsig_0_31z, celloutsig_0_17z, celloutsig_0_15z, celloutsig_0_0z } || { celloutsig_0_26z[8], celloutsig_0_26z[8], celloutsig_0_26z[6:4] };
  assign celloutsig_0_11z = { _00_[6:2], celloutsig_0_0z } || { _00_[6:2], _00_[0] };
  assign celloutsig_1_0z = ~ in_data[119:101];
  assign celloutsig_1_2z = | { celloutsig_1_0z[16:13], celloutsig_1_1z };
  assign celloutsig_1_3z = | in_data[142:133];
  assign celloutsig_1_8z = | { celloutsig_1_0z[16:9], celloutsig_1_1z };
  assign celloutsig_1_18z = | { celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_3z };
  assign celloutsig_0_18z = | { celloutsig_0_13z[5], celloutsig_0_13z[5], celloutsig_0_13z[3:1], celloutsig_0_13z[2], celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_16z };
  assign celloutsig_0_25z = | { in_data[63:48], celloutsig_0_5z };
  assign celloutsig_0_1z = ~^ { in_data[53:26], celloutsig_0_0z };
  assign celloutsig_0_15z = ~^ { celloutsig_0_8z[2:1], _00_[6:2], 1'h0, _00_[0], celloutsig_0_11z };
  assign celloutsig_0_19z = ~^ { in_data[74:72], celloutsig_0_12z, celloutsig_0_1z, 1'h0, celloutsig_0_14z, 1'h0, celloutsig_0_16z, celloutsig_0_17z };
  assign celloutsig_0_27z = ~^ { in_data[65:59], celloutsig_0_24z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_25z, _00_[6:2], 1'h0, _00_[0] };
  assign celloutsig_1_13z = ^ { in_data[121:120], celloutsig_1_4z, celloutsig_1_9z };
  assign celloutsig_0_14z = ^ { celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_10z, 1'h0, celloutsig_0_5z };
  assign celloutsig_0_17z = ^ { celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_12z, 1'h0, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_13z[5], celloutsig_0_13z[5], celloutsig_0_13z[3:1], celloutsig_0_13z[2], celloutsig_0_8z };
  assign celloutsig_0_20z = ^ { in_data[20:10], celloutsig_0_14z, celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_24z = ^ { 1'h0, celloutsig_0_7z, celloutsig_0_6z, 1'h0, celloutsig_0_23z, celloutsig_0_22z, celloutsig_0_18z, celloutsig_0_7z, celloutsig_0_16z, 1'h0, _00_[6:2], 1'h0, _00_[0], celloutsig_0_16z, celloutsig_0_14z, celloutsig_0_12z };
  assign celloutsig_1_1z = ~((celloutsig_1_0z[15] & celloutsig_1_0z[4]) | celloutsig_1_0z[18]);
  assign celloutsig_1_19z = ~((celloutsig_1_6z[13] & celloutsig_1_8z) | celloutsig_1_13z);
  assign celloutsig_0_10z = ~((1'h0 & celloutsig_0_6z) | celloutsig_0_7z);
  assign celloutsig_0_12z = ~((celloutsig_0_1z & celloutsig_0_0z) | celloutsig_0_6z);
  assign celloutsig_0_22z = ~((celloutsig_0_12z & in_data[6]) | _00_[4]);
  assign { celloutsig_0_13z[5], celloutsig_0_13z[3], celloutsig_0_13z[1], celloutsig_0_13z[2] } = ~ { celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_1z };
  assign { celloutsig_0_26z[1], celloutsig_0_26z[9], celloutsig_0_26z[0], celloutsig_0_26z[2], celloutsig_0_26z[8], celloutsig_0_26z[6], celloutsig_0_26z[4], celloutsig_0_26z[5], celloutsig_0_26z[10] } = ~ { celloutsig_0_20z, celloutsig_0_19z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_13z[5], celloutsig_0_13z[3], celloutsig_0_13z[1], celloutsig_0_13z[2], celloutsig_0_0z };
  assign { _00_[9:7], _00_[1] } = { 1'h0, celloutsig_0_7z, 2'h0 };
  assign { celloutsig_0_13z[4], celloutsig_0_13z[0] } = { celloutsig_0_13z[5], celloutsig_0_13z[2] };
  assign { celloutsig_0_26z[7], celloutsig_0_26z[3] } = { celloutsig_0_26z[8], celloutsig_0_26z[5] };
  assign { out_data[128], out_data[96], out_data[32] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_40z };
endmodule
