/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire [4:0] _04_;
  wire [15:0] _05_;
  wire celloutsig_0_0z;
  wire [11:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire [15:0] celloutsig_0_16z;
  wire [10:0] celloutsig_0_17z;
  wire [4:0] celloutsig_0_18z;
  wire [2:0] celloutsig_0_1z;
  wire [11:0] celloutsig_0_27z;
  wire [15:0] celloutsig_0_2z;
  wire [5:0] celloutsig_0_33z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [10:0] celloutsig_0_3z;
  wire [3:0] celloutsig_0_5z;
  reg [3:0] celloutsig_0_6z;
  wire [3:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [3:0] celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire [9:0] celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [4:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [3:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [8:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_3z = ~(_00_ | celloutsig_1_2z[2]);
  assign celloutsig_1_4z = ~(_01_ | _02_);
  assign celloutsig_1_17z = ~(celloutsig_1_15z[9] | celloutsig_1_5z);
  assign celloutsig_0_11z = ~(celloutsig_0_10z[8] | in_data[66]);
  assign celloutsig_1_7z = ~((celloutsig_1_3z | celloutsig_1_3z) & (celloutsig_1_4z | celloutsig_1_0z));
  assign celloutsig_1_19z = ~((celloutsig_1_16z | celloutsig_1_17z) & (celloutsig_1_3z | celloutsig_1_0z));
  reg [4:0] _12_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _12_ <= 5'h00;
    else _12_ <= in_data[112:108];
  assign { _01_, _04_[3], _00_, _02_, _04_[0] } = _12_;
  reg [15:0] _13_;
  always_ff @(posedge celloutsig_1_18z[0], posedge clkin_data[32])
    if (clkin_data[32]) _13_ <= 16'h0000;
    else _13_ <= { in_data[71:67], celloutsig_0_3z };
  assign { _05_[15], _03_, _05_[13:0] } = _13_;
  assign celloutsig_0_17z = { celloutsig_0_2z[3:1], celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_8z } / { 1'h1, in_data[47:38] };
  assign celloutsig_1_0z = in_data[116:114] == in_data[160:158];
  assign celloutsig_1_8z = in_data[138:133] === { celloutsig_1_6z[5], _01_, _04_[3], _00_, _02_, _04_[0] };
  assign celloutsig_1_5z = { _04_[3], _00_, _02_, _04_[0], celloutsig_1_0z } <= in_data[171:167];
  assign celloutsig_1_14z = { celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_7z } <= { _01_, _04_[3], _00_, _02_ };
  assign celloutsig_0_0z = in_data[18:8] < in_data[29:19];
  assign celloutsig_0_9z = celloutsig_0_3z[10:1] < { celloutsig_0_3z[6:5], celloutsig_0_6z, celloutsig_0_5z };
  assign celloutsig_1_16z = celloutsig_1_14z & ~(in_data[102]);
  assign celloutsig_0_12z = { celloutsig_0_1z, celloutsig_0_11z } % { 1'h1, celloutsig_0_3z[7:6], in_data[0] };
  assign celloutsig_0_18z = { in_data[34:33], celloutsig_0_15z, celloutsig_0_13z, celloutsig_0_9z } % { 1'h1, celloutsig_0_5z };
  assign celloutsig_1_2z = _02_ ? { in_data[142:141], celloutsig_1_0z, celloutsig_1_0z } : { _01_, _04_[3], _00_, 1'h0 };
  assign celloutsig_1_6z = celloutsig_1_0z ? in_data[108:100] : { in_data[125:118], 1'h0 };
  assign celloutsig_0_16z = _05_[5] ? { in_data[42:32], celloutsig_0_6z, celloutsig_0_9z } : celloutsig_0_2z;
  assign celloutsig_0_2z = celloutsig_0_0z ? { in_data[61:58], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z } : { in_data[40:30], celloutsig_0_1z, 2'h0 };
  assign celloutsig_0_13z = { celloutsig_0_2z[14:7], celloutsig_0_1z } != { celloutsig_0_2z[10:1], celloutsig_0_0z };
  assign celloutsig_0_3z = ~ in_data[12:2];
  assign celloutsig_0_7z = ~ celloutsig_0_6z;
  assign celloutsig_0_10z = ~ { _05_[11:1], celloutsig_0_0z };
  assign celloutsig_0_37z = celloutsig_0_33z[1] & celloutsig_0_12z[2];
  assign celloutsig_0_36z = ^ { celloutsig_0_1z, celloutsig_0_33z, celloutsig_0_17z };
  assign celloutsig_1_10z = ^ { _01_, _04_[3], _00_, _02_, _04_[0] };
  assign celloutsig_0_15z = ^ { celloutsig_0_6z[2:0], celloutsig_0_9z };
  assign celloutsig_1_12z = { celloutsig_1_6z[4], celloutsig_1_4z, celloutsig_1_11z, celloutsig_1_8z } >> { celloutsig_1_9z, celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_10z };
  assign celloutsig_0_1z = { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } >> in_data[91:89];
  assign celloutsig_0_33z = { celloutsig_0_27z[8:5], celloutsig_0_13z, celloutsig_0_9z } ~^ { celloutsig_0_2z[5:1], celloutsig_0_11z };
  assign celloutsig_1_18z = { celloutsig_1_6z[6:3], celloutsig_1_0z } ~^ { in_data[180:179], celloutsig_1_9z, celloutsig_1_3z, celloutsig_1_8z };
  assign celloutsig_0_27z = { celloutsig_0_16z[9:3], celloutsig_0_18z } ~^ { _05_[10:4], celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_11z };
  assign celloutsig_0_5z = celloutsig_0_2z[14:11] ^ _05_[13:10];
  assign celloutsig_1_9z = ~((celloutsig_1_4z & celloutsig_1_8z) | celloutsig_1_6z[4]);
  assign celloutsig_1_11z = ~((celloutsig_1_8z & celloutsig_1_8z) | celloutsig_1_3z);
  assign celloutsig_0_8z = ~((in_data[66] & celloutsig_0_6z[2]) | celloutsig_0_3z[2]);
  always_latch
    if (!clkin_data[64]) celloutsig_0_6z = 4'h0;
    else if (!clkin_data[128]) celloutsig_0_6z = celloutsig_0_3z[6:3];
  assign { celloutsig_1_15z[0], celloutsig_1_15z[6:2], celloutsig_1_15z[9:7] } = { celloutsig_1_14z, celloutsig_1_12z, celloutsig_1_8z, celloutsig_1_2z[3:1] } ~^ { celloutsig_1_9z, _01_, _04_[3], _00_, _02_, _04_[0], celloutsig_1_2z[2:0] };
  assign { _04_[4], _04_[2:1] } = { _01_, _00_, _02_ };
  assign _05_[14] = _03_;
  assign celloutsig_1_15z[1] = 1'h1;
  assign { out_data[132:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_36z, celloutsig_0_37z };
endmodule
