/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [6:0] _00_;
  wire [18:0] celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire [4:0] celloutsig_0_13z;
  reg [20:0] celloutsig_0_14z;
  wire [6:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [9:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [8:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [8:0] celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire [13:0] celloutsig_0_28z;
  wire [7:0] celloutsig_0_29z;
  wire [19:0] celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire [5:0] celloutsig_0_32z;
  wire [8:0] celloutsig_0_35z;
  wire [29:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [7:0] celloutsig_1_14z;
  wire [9:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [6:0] celloutsig_1_3z;
  wire [9:0] celloutsig_1_4z;
  wire [6:0] celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [10:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_11z = ~(celloutsig_1_7z & in_data[143]);
  assign celloutsig_0_11z = ~(celloutsig_0_3z & celloutsig_0_4z);
  assign celloutsig_0_16z = ~(celloutsig_0_3z & celloutsig_0_14z[4]);
  assign celloutsig_0_19z = !(in_data[47] ? in_data[43] : celloutsig_0_8z);
  assign celloutsig_1_8z = ~((in_data[118] | celloutsig_1_6z[0]) & celloutsig_1_7z);
  assign celloutsig_1_10z = ~((celloutsig_1_0z[2] | celloutsig_1_7z) & celloutsig_1_7z);
  assign celloutsig_0_23z = celloutsig_0_17z[0] | celloutsig_0_2z[16];
  assign celloutsig_0_24z = celloutsig_0_7z | celloutsig_0_9z;
  assign celloutsig_1_7z = celloutsig_1_6z[3] ^ celloutsig_1_6z[2];
  assign celloutsig_0_8z = celloutsig_0_7z ^ celloutsig_0_0z[18];
  assign celloutsig_0_31z = celloutsig_0_0z[10] ^ celloutsig_0_19z;
  always_ff @(negedge clkin_data[96], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _00_ <= 7'h00;
    else _00_ <= { celloutsig_0_15z[2:0], celloutsig_0_12z };
  assign celloutsig_0_7z = ! celloutsig_0_0z[11:6];
  assign celloutsig_0_6z = celloutsig_0_0z[9:0] < { in_data[75:67], celloutsig_0_5z };
  assign celloutsig_1_12z = celloutsig_1_3z[5:2] < { celloutsig_1_9z[9:7], celloutsig_1_2z };
  assign celloutsig_0_9z = { celloutsig_0_2z[12:3], celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_6z } < { celloutsig_0_2z[12:1], celloutsig_0_6z, celloutsig_0_7z };
  assign celloutsig_0_10z = celloutsig_0_6z ? { celloutsig_0_2z[2:1], celloutsig_0_9z } : { celloutsig_0_1z[7:6], celloutsig_0_3z };
  assign celloutsig_1_18z = - { celloutsig_1_4z[9:1], celloutsig_1_12z };
  assign celloutsig_0_1z = - celloutsig_0_0z[14:6];
  assign celloutsig_0_15z = - celloutsig_0_2z[7:1];
  assign celloutsig_0_0z = in_data[19:1] | in_data[89:71];
  assign celloutsig_0_38z = { celloutsig_0_15z[5:0], celloutsig_0_32z, celloutsig_0_35z, celloutsig_0_18z, celloutsig_0_26z, celloutsig_0_13z, celloutsig_0_19z, celloutsig_0_5z } | { celloutsig_0_12z[3:1], celloutsig_0_24z, celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_19z, _00_, celloutsig_0_23z, celloutsig_0_35z, celloutsig_0_24z, celloutsig_0_31z };
  assign celloutsig_1_0z = in_data[143:141] | in_data[140:138];
  assign celloutsig_1_6z = celloutsig_1_4z[9:5] | celloutsig_1_5z[5:1];
  assign celloutsig_0_32z = { celloutsig_0_29z[6:2], celloutsig_0_23z } | { celloutsig_0_29z[6], celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_20z, celloutsig_0_5z, celloutsig_0_16z };
  assign celloutsig_1_1z = & { celloutsig_1_0z, in_data[184:166] };
  assign celloutsig_0_18z = | { in_data[74:65], celloutsig_0_1z, celloutsig_0_16z };
  assign celloutsig_0_26z = | { celloutsig_0_0z[2:1], celloutsig_0_7z };
  assign celloutsig_0_39z = celloutsig_0_1z[4] & celloutsig_0_4z;
  assign celloutsig_1_19z = celloutsig_1_0z[2] & celloutsig_1_14z[5];
  assign celloutsig_0_20z = celloutsig_0_6z & celloutsig_0_0z[1];
  assign celloutsig_0_4z = | { celloutsig_0_1z, in_data[43:38] };
  assign celloutsig_1_2z = | in_data[181:167];
  assign celloutsig_0_5z = | { celloutsig_0_2z[11:8], celloutsig_0_1z, in_data[43:38] };
  assign celloutsig_0_3z = | in_data[54:30];
  assign celloutsig_1_4z = { celloutsig_1_3z[6:2], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z } >> in_data[121:112];
  assign celloutsig_0_35z = celloutsig_0_28z[13:5] - { celloutsig_0_0z[4:3], celloutsig_0_19z, celloutsig_0_4z, celloutsig_0_13z };
  assign celloutsig_1_3z = in_data[105:99] - in_data[172:166];
  assign celloutsig_1_5z = { celloutsig_1_3z[5:0], celloutsig_1_1z } - { celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_9z = { celloutsig_1_6z[1], celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_7z } - { celloutsig_1_4z, celloutsig_1_1z };
  assign celloutsig_1_14z = { in_data[160:156], celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_11z } - { celloutsig_1_5z[6:1], celloutsig_1_10z, celloutsig_1_1z };
  assign celloutsig_0_12z = celloutsig_0_1z[4:1] - { in_data[34:32], celloutsig_0_5z };
  assign celloutsig_0_13z = celloutsig_0_0z[6:2] - { celloutsig_0_12z, celloutsig_0_8z };
  assign celloutsig_0_17z = { celloutsig_0_10z[2:1], celloutsig_0_12z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_8z } - { celloutsig_0_2z[10:4], celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_9z };
  assign celloutsig_0_2z = { celloutsig_0_1z[3], celloutsig_0_0z } - { in_data[68], celloutsig_0_0z };
  assign celloutsig_0_21z = { celloutsig_0_15z[5:0], celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_7z } - { in_data[12:5], celloutsig_0_6z };
  assign celloutsig_0_28z = celloutsig_0_14z[14:1] - { celloutsig_0_14z[8:3], celloutsig_0_6z, _00_ };
  assign celloutsig_0_29z = { celloutsig_0_2z[7:1], celloutsig_0_26z } - { celloutsig_0_21z[3:1], celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_26z, celloutsig_0_23z, celloutsig_0_3z };
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_14z = 21'h000000;
    else if (!clkin_data[0]) celloutsig_0_14z = { in_data[48:30], celloutsig_0_11z, celloutsig_0_7z };
  assign { out_data[137:128], out_data[96], out_data[61:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_38z, celloutsig_0_39z };
endmodule
