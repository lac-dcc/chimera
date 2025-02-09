/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [4:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [12:0] celloutsig_0_19z;
  wire [4:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [5:0] celloutsig_0_33z;
  wire celloutsig_0_3z;
  wire [16:0] celloutsig_0_4z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [9:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  wire [4:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [6:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ~((in_data[9] | in_data[35]) & (in_data[23] | in_data[89]));
  assign celloutsig_0_5z = ~((celloutsig_0_4z[15] | celloutsig_0_0z) & (celloutsig_0_4z[16] | celloutsig_0_2z));
  assign celloutsig_1_7z = ~((celloutsig_1_4z[5] | celloutsig_1_3z) & (celloutsig_1_6z | celloutsig_1_0z));
  assign celloutsig_0_11z = ~((celloutsig_0_6z | celloutsig_0_4z[1]) & (in_data[55] | celloutsig_0_0z));
  assign celloutsig_0_18z = ~((celloutsig_0_6z | celloutsig_0_0z) & (celloutsig_0_12z[0] | celloutsig_0_6z));
  assign celloutsig_0_52z = celloutsig_0_27z ^ celloutsig_0_33z[0];
  assign celloutsig_1_0z = in_data[175] ^ in_data[109];
  assign celloutsig_1_2z = in_data[98] ^ celloutsig_1_0z;
  assign celloutsig_1_16z = celloutsig_1_0z ^ celloutsig_1_9z;
  assign celloutsig_0_22z = celloutsig_0_4z[2] ^ celloutsig_0_0z;
  assign celloutsig_0_29z = _01_ ^ celloutsig_0_12z[0];
  reg [4:0] _14_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[0])
    if (clkin_data[0]) _14_ <= 5'h00;
    else _14_ <= in_data[48:44];
  assign { _02_[4], _01_, _02_[2], _00_, _02_[0] } = _14_;
  assign celloutsig_1_3z = in_data[144:140] >= { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_5z = { in_data[136:126], celloutsig_1_0z, celloutsig_1_1z } >= { celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_9z = { in_data[12:7], celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_0z } >= celloutsig_0_4z[11:0];
  assign celloutsig_0_17z = { _02_[2], _00_, _02_[0] } >= { celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_14z };
  assign celloutsig_0_26z = { celloutsig_0_4z[8:5], celloutsig_0_15z } >= { in_data[67:65], celloutsig_0_17z, celloutsig_0_8z };
  assign celloutsig_0_27z = { celloutsig_0_7z[6:0], celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_22z, celloutsig_0_17z, celloutsig_0_6z, celloutsig_0_22z, celloutsig_0_3z, celloutsig_0_14z, celloutsig_0_22z } >= { celloutsig_0_19z[9:1], celloutsig_0_6z, _02_[4], _01_, _02_[2], _00_, _02_[0], celloutsig_0_17z };
  assign celloutsig_1_6z = ! { in_data[128:120], celloutsig_1_4z, celloutsig_1_1z };
  assign celloutsig_1_1z = in_data[107] & ~(celloutsig_1_0z);
  assign celloutsig_0_20z = celloutsig_0_8z & ~(celloutsig_0_6z);
  assign celloutsig_0_24z = celloutsig_0_0z & ~(celloutsig_0_10z);
  assign celloutsig_0_33z = { celloutsig_0_20z, celloutsig_0_17z, celloutsig_0_14z, celloutsig_0_24z, celloutsig_0_11z, celloutsig_0_14z } | { _00_, _02_[0], celloutsig_0_5z, celloutsig_0_30z, celloutsig_0_30z, celloutsig_0_26z };
  assign celloutsig_1_10z = { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z } | { in_data[183:182], celloutsig_1_5z };
  assign celloutsig_1_15z = { in_data[138:136], celloutsig_1_7z } | celloutsig_1_4z[3:0];
  assign celloutsig_0_12z = in_data[49:46] | celloutsig_0_7z[3:0];
  assign celloutsig_0_3z = | in_data[92:79];
  assign celloutsig_1_9z = | { in_data[179:175], celloutsig_1_8z };
  assign celloutsig_1_19z = | { celloutsig_1_16z, celloutsig_1_8z, celloutsig_1_16z, celloutsig_1_12z, celloutsig_1_2z };
  assign celloutsig_0_8z = | in_data[63:59];
  assign celloutsig_0_15z = | { celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_16z = | in_data[69:57];
  assign celloutsig_0_21z = | { in_data[57:46], celloutsig_0_8z, celloutsig_0_16z, celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_15z, celloutsig_0_10z };
  assign celloutsig_0_30z = celloutsig_0_8z & celloutsig_0_9z;
  assign celloutsig_1_8z = celloutsig_1_2z & celloutsig_1_4z[6];
  assign celloutsig_1_18z = celloutsig_1_15z[0] & celloutsig_1_15z[2];
  assign celloutsig_0_6z = celloutsig_0_4z[2] & celloutsig_0_1z[0];
  assign celloutsig_0_14z = celloutsig_0_4z[12] & celloutsig_0_6z;
  assign celloutsig_0_4z = in_data[48:32] >> { in_data[6:2], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_4z = { in_data[179], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_2z } >> { in_data[176:172], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_12z = { in_data[140], celloutsig_1_10z, celloutsig_1_5z } >> { in_data[103:100], celloutsig_1_7z };
  assign celloutsig_0_7z = in_data[83:74] >> { celloutsig_0_4z[12:10], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_1z = { in_data[42:39], celloutsig_0_0z } >> { in_data[89:87], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_19z = { celloutsig_0_1z[4:2], celloutsig_0_12z, celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_18z, celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_11z } >> celloutsig_0_4z[13:1];
  assign celloutsig_0_53z = ~((celloutsig_0_18z & celloutsig_0_29z) | (celloutsig_0_24z & celloutsig_0_21z));
  assign celloutsig_0_10z = ~((celloutsig_0_7z[8] & celloutsig_0_8z) | (celloutsig_0_3z & celloutsig_0_2z));
  assign celloutsig_0_2z = ~((in_data[2] & in_data[86]) | (in_data[71] & in_data[90]));
  assign { _02_[3], _02_[1] } = { _01_, _00_ };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_52z, celloutsig_0_53z };
endmodule
