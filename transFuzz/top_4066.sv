/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [7:0] _00_;
  reg [13:0] _01_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [6:0] celloutsig_0_12z;
  wire [2:0] celloutsig_0_14z;
  wire [2:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_26z;
  wire [2:0] celloutsig_0_27z;
  wire [8:0] celloutsig_0_31z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [38:0] celloutsig_0_5z;
  wire [37:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [2:0] celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire [11:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [20:0] celloutsig_1_13z;
  wire [7:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_3z;
  wire [17:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [10:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_11z = ~(celloutsig_1_8z & celloutsig_1_1z);
  assign celloutsig_0_8z = ~celloutsig_0_4z;
  assign celloutsig_0_26z = ~celloutsig_0_16z;
  assign celloutsig_0_3z = ~celloutsig_0_0z;
  assign celloutsig_0_10z = ~celloutsig_0_17z;
  assign celloutsig_1_7z = celloutsig_1_0z[0] | ~(celloutsig_1_0z[0]);
  assign celloutsig_1_3z = celloutsig_1_0z[1] | celloutsig_1_0z[0];
  assign celloutsig_1_5z = celloutsig_1_0z[0] | in_data[119];
  assign celloutsig_1_15z = celloutsig_1_14z[5] | celloutsig_1_0z[0];
  assign celloutsig_0_18z = celloutsig_0_15z[2] | celloutsig_0_12z[1];
  assign celloutsig_0_20z = in_data[46] | celloutsig_0_10z;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[0])
    if (!clkin_data[0]) _00_ <= 8'h00;
    else _00_ <= { celloutsig_0_5z[15:10], celloutsig_0_10z, celloutsig_0_7z };
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[0])
    if (clkin_data[0]) _01_ <= 14'h0000;
    else _01_ <= { celloutsig_0_5z[17:5], celloutsig_0_18z };
  assign celloutsig_1_0z = in_data[186:184] / { 1'h1, in_data[144:143] };
  assign celloutsig_1_6z = { celloutsig_1_4z[15], celloutsig_1_4z[17], celloutsig_1_4z[13:12], celloutsig_1_4z[16:15], celloutsig_1_4z[13:12], celloutsig_1_4z[16], celloutsig_1_4z[13], celloutsig_1_3z } / { 1'h1, celloutsig_1_4z[13:12], celloutsig_1_4z[16], celloutsig_1_4z[16], celloutsig_1_4z[13:12], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, in_data[96] };
  assign celloutsig_1_10z = { celloutsig_1_6z[8:6], celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_0z[0], celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_0z } / { 1'h1, in_data[190:184], celloutsig_1_0z[0], celloutsig_1_8z, celloutsig_1_8z, celloutsig_1_3z };
  assign celloutsig_0_35z = celloutsig_0_31z[7:4] == _01_[3:0];
  assign celloutsig_1_1z = in_data[112:110] == celloutsig_1_0z;
  assign celloutsig_0_16z = { celloutsig_0_12z[1:0], celloutsig_0_7z, celloutsig_0_0z } && _00_[5:2];
  assign celloutsig_1_17z = ! celloutsig_1_13z[19:14];
  assign celloutsig_0_0z = in_data[78:71] || in_data[84:77];
  assign celloutsig_1_8z = { in_data[146:144], celloutsig_1_0z } || { celloutsig_1_4z[13:12], celloutsig_1_4z[16], celloutsig_1_4z[13:12], celloutsig_1_4z[16] };
  assign celloutsig_0_5z = { in_data[53:16], celloutsig_0_1z } % { 1'h1, in_data[48:15], celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_1z, in_data[0] };
  assign celloutsig_1_14z = { celloutsig_1_6z[8:5], celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_5z } % { 1'h1, celloutsig_1_6z[6:0] };
  assign celloutsig_0_14z = { in_data[60:59], celloutsig_0_1z } % { 1'h1, celloutsig_0_8z, celloutsig_0_0z };
  assign celloutsig_0_9z = celloutsig_0_5z[27:25] % { 1'h1, celloutsig_0_8z, celloutsig_0_3z };
  assign celloutsig_1_18z = celloutsig_1_6z[6:0] !== { in_data[108:103], celloutsig_1_17z };
  assign celloutsig_0_36z = | { celloutsig_0_5z[14:2], celloutsig_0_19z, celloutsig_0_0z, celloutsig_0_14z, celloutsig_0_27z, celloutsig_0_9z, celloutsig_0_15z, celloutsig_0_0z };
  assign celloutsig_1_19z = | { celloutsig_1_14z[6:3], celloutsig_1_0z[0], celloutsig_1_18z, celloutsig_1_14z, celloutsig_1_17z, celloutsig_1_15z };
  assign celloutsig_0_1z = | { in_data[49:44], celloutsig_0_0z };
  assign celloutsig_1_9z = celloutsig_1_0z[0] & celloutsig_1_6z[3];
  assign celloutsig_0_4z = | { celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_19z = | { celloutsig_0_1z, in_data[41:38] };
  assign celloutsig_0_12z = { celloutsig_0_17z, celloutsig_0_6z[8:3] } << { celloutsig_0_6z[37:32], celloutsig_0_3z };
  assign celloutsig_0_15z = { celloutsig_0_9z[1], celloutsig_0_10z, celloutsig_0_0z } << celloutsig_0_14z;
  assign celloutsig_0_27z = { celloutsig_0_20z, celloutsig_0_16z, celloutsig_0_26z } ^ { celloutsig_0_12z[4:3], celloutsig_0_8z };
  assign celloutsig_0_31z = celloutsig_0_5z[32:24] ^ celloutsig_0_5z[11:3];
  assign celloutsig_0_7z = ~((celloutsig_0_1z & celloutsig_0_4z) | (celloutsig_0_5z[34] & celloutsig_0_1z));
  assign { celloutsig_0_6z[37:10], celloutsig_0_17z, celloutsig_0_6z[8:1] } = celloutsig_0_5z[37:1] ^ { celloutsig_0_5z[32:3], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_1z };
  assign { celloutsig_1_4z[15], celloutsig_1_4z[17], celloutsig_1_4z[13:12], celloutsig_1_4z[16] } = ~ { celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_0z };
  assign { celloutsig_1_13z[0], celloutsig_1_13z[12], celloutsig_1_13z[20:14], celloutsig_1_13z[4:1], celloutsig_1_13z[13] } = ~ { celloutsig_1_11z, celloutsig_1_10z, celloutsig_1_9z };
  assign { celloutsig_0_6z[9], celloutsig_0_6z[0] } = { celloutsig_0_17z, 1'h0 };
  assign celloutsig_1_13z[11:5] = celloutsig_1_13z[20:14];
  assign { celloutsig_1_4z[14], celloutsig_1_4z[11:0] } = { celloutsig_1_4z[17:15], celloutsig_1_4z[13:12], celloutsig_1_4z[16], celloutsig_1_4z[13:12], celloutsig_1_4z[16], celloutsig_1_4z[16], celloutsig_1_4z[13:12], celloutsig_1_4z[16] };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_35z, celloutsig_0_36z };
endmodule
