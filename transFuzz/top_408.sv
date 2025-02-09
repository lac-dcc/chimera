/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [5:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [5:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [6:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [6:0] celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire [22:0] celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [11:0] celloutsig_0_30z;
  wire celloutsig_0_3z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire [8:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [5:0] celloutsig_1_11z;
  wire [3:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [10:0] celloutsig_1_2z;
  wire [12:0] celloutsig_1_3z;
  wire [3:0] celloutsig_1_4z;
  wire [15:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire [4:0] celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_2z = ~((celloutsig_0_1z | celloutsig_0_1z) & (celloutsig_0_1z | celloutsig_0_0z));
  assign celloutsig_0_0z = in_data[33] | ~(in_data[55]);
  assign celloutsig_0_16z = celloutsig_0_15z | ~(celloutsig_0_15z);
  assign celloutsig_0_29z = celloutsig_0_10z | ~(celloutsig_0_14z);
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_19z[0])
    if (celloutsig_1_19z[0]) _00_ <= 6'h00;
    else _00_ <= { in_data[10], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_1_6z = in_data[120:112] == { celloutsig_1_5z[14:7], celloutsig_1_1z };
  assign celloutsig_1_13z = { celloutsig_1_3z[7:1], celloutsig_1_11z } == { celloutsig_1_5z[14:6], celloutsig_1_12z };
  assign celloutsig_0_10z = { celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_5z } == { celloutsig_0_9z[3:0], celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_2z };
  assign celloutsig_0_15z = { in_data[49:34], _00_, celloutsig_0_13z } == { celloutsig_0_13z[4:1], celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_9z };
  assign celloutsig_0_21z = { celloutsig_0_8z[0], celloutsig_0_1z, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_20z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_20z, celloutsig_0_5z } == { celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_3z, _00_, celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_19z, celloutsig_0_17z, _00_, celloutsig_0_19z, celloutsig_0_3z };
  assign celloutsig_0_22z = { in_data[19:14], celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_21z, celloutsig_0_16z } == { in_data[95:88], celloutsig_0_17z, celloutsig_0_11z };
  assign celloutsig_0_49z = { celloutsig_0_30z[5:3], celloutsig_0_30z[11], celloutsig_0_30z[11] } >= celloutsig_0_27z[10:6];
  assign celloutsig_1_0z = in_data[161:145] >= in_data[137:121];
  assign celloutsig_0_12z = { celloutsig_0_11z[2:0], celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_5z } >= { celloutsig_0_9z[4:2], celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_8z };
  assign celloutsig_0_14z = { celloutsig_0_9z[4:2], celloutsig_0_0z } >= { celloutsig_0_13z[5:3], celloutsig_0_5z };
  assign celloutsig_0_20z = { celloutsig_0_9z[8:6], celloutsig_0_7z } >= { celloutsig_0_13z[3:2], celloutsig_0_12z, celloutsig_0_3z };
  assign celloutsig_0_3z = ! in_data[64:59];
  assign celloutsig_1_1z = ! { in_data[118:115], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_6z = ! { in_data[67:53], _00_ };
  assign celloutsig_0_7z = ! in_data[78:73];
  assign celloutsig_0_1z = ! in_data[31:16];
  assign celloutsig_0_17z = ! { celloutsig_0_9z[8:1], _00_, celloutsig_0_14z, celloutsig_0_16z };
  assign celloutsig_0_19z = ! { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_14z, celloutsig_0_14z };
  assign celloutsig_1_12z = celloutsig_1_4z % { 1'h1, celloutsig_1_5z[7:5] };
  assign celloutsig_0_9z = { in_data[80:78], _00_ } % { 1'h1, celloutsig_0_0z, celloutsig_0_3z, _00_[5:1], in_data[0] };
  assign celloutsig_0_11z = { in_data[75:74], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_1z } % { 1'h1, _00_[2], celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_5z, in_data[0] };
  assign celloutsig_0_24z = { celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_17z, celloutsig_0_20z } % { 1'h1, celloutsig_0_13z[4:0], celloutsig_0_3z };
  assign celloutsig_1_11z = ~ { celloutsig_1_2z[5:1], celloutsig_1_1z };
  assign celloutsig_0_48z = ^ { celloutsig_0_30z[10:7], celloutsig_0_13z };
  assign celloutsig_1_8z = ^ { celloutsig_1_5z[13:9], celloutsig_1_1z };
  assign celloutsig_0_5z = ^ _00_[5:2];
  assign celloutsig_1_14z = ^ { celloutsig_1_3z[9:4], celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_2z };
  assign celloutsig_1_15z = ^ { celloutsig_1_3z[12:10], celloutsig_1_6z };
  assign celloutsig_1_18z = ^ { celloutsig_1_4z[3:2], celloutsig_1_15z, celloutsig_1_15z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_9z[4:2], celloutsig_1_9z[2], celloutsig_1_9z[0], celloutsig_1_14z, celloutsig_1_4z, celloutsig_1_13z, celloutsig_1_1z, celloutsig_1_13z };
  assign celloutsig_0_26z = ^ { _00_[4:2], celloutsig_0_3z, celloutsig_0_19z };
  assign celloutsig_1_2z = in_data[129:119] << in_data[134:124];
  assign celloutsig_1_3z = { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z } << { in_data[98], celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_4z = { in_data[130:128], celloutsig_1_1z } ^ in_data[162:159];
  assign celloutsig_1_19z = { celloutsig_1_11z[3:1], celloutsig_1_8z, celloutsig_1_15z, celloutsig_1_11z } ^ celloutsig_1_5z[11:1];
  assign celloutsig_0_8z = { celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z } ^ in_data[40:38];
  assign celloutsig_0_13z = { celloutsig_0_1z, _00_ } ^ { _00_, celloutsig_0_2z };
  assign { celloutsig_0_27z[11:5], celloutsig_0_27z[14], celloutsig_0_27z[17], celloutsig_0_27z[12], celloutsig_0_27z[15], celloutsig_0_27z[2:0], celloutsig_0_27z[4], celloutsig_0_27z[18], celloutsig_0_27z[3], celloutsig_0_27z[16], celloutsig_0_27z[13] } = { celloutsig_0_24z, celloutsig_0_22z, celloutsig_0_21z, celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_0z } ^ { celloutsig_0_8z[0], celloutsig_0_24z[6:1], celloutsig_0_21z, celloutsig_0_13z[1], celloutsig_0_8z[1], celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_20z, celloutsig_0_24z[0], celloutsig_0_13z[2], celloutsig_0_12z, celloutsig_0_13z[0], celloutsig_0_8z[2] };
  assign { celloutsig_0_30z[3], celloutsig_0_30z[11:4], celloutsig_0_30z[0] } = ~ { celloutsig_0_29z, celloutsig_0_26z, celloutsig_0_13z, celloutsig_0_2z };
  assign { celloutsig_1_5z[4:1], celloutsig_1_5z[15:5] } = ~ { celloutsig_1_4z, celloutsig_1_2z[10:1], celloutsig_1_1z };
  assign { celloutsig_1_9z[0], celloutsig_1_9z[4:2] } = ~ { celloutsig_1_8z, celloutsig_1_5z[14:13], celloutsig_1_0z };
  assign celloutsig_0_27z[22:19] = 4'h0;
  assign celloutsig_0_30z[2:1] = { celloutsig_0_30z[11], celloutsig_0_30z[11] };
  assign celloutsig_1_5z[0] = celloutsig_1_5z[5];
  assign celloutsig_1_9z[1] = celloutsig_1_9z[2];
  assign { out_data[128], out_data[106:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_48z, celloutsig_0_49z };
endmodule
