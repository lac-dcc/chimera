/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [6:0] _02_;
  wire [3:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [10:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [4:0] celloutsig_0_22z;
  wire [4:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [28:0] celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [7:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [16:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [4:0] celloutsig_0_9z;
  wire [6:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [7:0] celloutsig_1_11z;
  wire [2:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_11z = celloutsig_0_10z ? in_data[65] : celloutsig_0_4z[4];
  assign celloutsig_1_4z = ~(in_data[120] & celloutsig_1_3z[2]);
  assign celloutsig_1_19z = ~(celloutsig_1_5z & celloutsig_1_2z);
  assign celloutsig_0_16z = ~(celloutsig_0_11z | celloutsig_0_6z);
  assign celloutsig_0_20z = ~(celloutsig_0_7z[10] | celloutsig_0_19z);
  assign celloutsig_0_26z = ~celloutsig_0_10z;
  assign celloutsig_1_16z = celloutsig_1_14z | ~(celloutsig_1_6z);
  assign celloutsig_0_8z = celloutsig_0_5z | ~(celloutsig_0_1z);
  assign celloutsig_0_10z = in_data[58] | ~(celloutsig_0_9z[0]);
  assign celloutsig_0_21z = celloutsig_0_1z | ~(celloutsig_0_19z);
  assign celloutsig_0_31z = celloutsig_0_21z | ~(_01_);
  assign celloutsig_0_15z = ~(celloutsig_0_11z ^ celloutsig_0_10z);
  reg [6:0] _15_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _15_ <= 7'h00;
    else _15_ <= in_data[27:21];
  assign { _00_, _01_, _02_[4:0] } = _15_;
  assign celloutsig_0_0z = in_data[54:51] & in_data[8:5];
  assign celloutsig_0_4z = in_data[81:74] & { _02_[1], _00_, _01_, _02_[4:0] };
  assign celloutsig_1_6z = celloutsig_1_0z[5:2] === { in_data[149:148], celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_1_8z = { celloutsig_1_0z[5:3], celloutsig_1_7z } === { in_data[131:129], celloutsig_1_4z };
  assign celloutsig_0_5z = in_data[73:71] === in_data[56:54];
  assign celloutsig_0_14z = { celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_13z, _00_, _01_, _02_[4:0] } === in_data[46:37];
  assign celloutsig_0_27z = { celloutsig_0_7z[7:6], celloutsig_0_12z } === { celloutsig_0_23z[4], celloutsig_0_26z, celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_24z, celloutsig_0_25z };
  assign celloutsig_0_30z = celloutsig_0_4z[6:0] === { celloutsig_0_12z[3], celloutsig_0_24z, celloutsig_0_12z, celloutsig_0_8z };
  assign celloutsig_0_32z = { in_data[67:52], celloutsig_0_2z, celloutsig_0_16z, celloutsig_0_20z, celloutsig_0_15z, celloutsig_0_30z, celloutsig_0_2z } === { celloutsig_0_28z[28:9], celloutsig_0_1z, celloutsig_0_5z };
  assign celloutsig_0_6z = { in_data[29:18], celloutsig_0_1z, celloutsig_0_0z } > { celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, _00_, _01_, _02_[4:0] };
  assign celloutsig_1_7z = in_data[171:147] <= { in_data[116:104], celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_4z };
  assign celloutsig_0_17z = { _01_, celloutsig_0_4z, _00_, _01_, _02_[4:0] } <= { _01_, _02_[4], celloutsig_0_1z, celloutsig_0_16z, celloutsig_0_0z, celloutsig_0_1z, _00_, _01_, _02_[4:0] };
  assign celloutsig_1_14z = { in_data[141:138], celloutsig_1_4z } && { celloutsig_1_3z[6:5], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_10z };
  assign celloutsig_0_19z = { celloutsig_0_9z[4:1], celloutsig_0_11z } && celloutsig_0_7z[13:9];
  assign celloutsig_1_1z = celloutsig_1_0z[5] & ~(in_data[133]);
  assign celloutsig_1_2z = celloutsig_1_0z[6] & ~(in_data[176]);
  assign celloutsig_0_24z = celloutsig_0_16z & ~(celloutsig_0_4z[5]);
  assign celloutsig_0_25z = celloutsig_0_14z & ~(celloutsig_0_14z);
  assign celloutsig_1_11z = { celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_10z, celloutsig_1_1z, celloutsig_1_2z } % { 1'h1, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_1_13z = celloutsig_1_0z[3:1] % { 1'h1, celloutsig_1_11z[4:3] };
  assign celloutsig_0_7z = { in_data[45:34], celloutsig_0_0z, celloutsig_0_6z } % { 1'h1, in_data[82:67] };
  assign celloutsig_0_9z = { _02_[4:1], celloutsig_0_8z } % { 1'h1, celloutsig_0_7z[8:5] };
  assign celloutsig_0_12z = - { _00_, _01_, _02_[4:3] };
  assign celloutsig_0_13z = { in_data[36:21], _00_, _01_, _02_[4:0], celloutsig_0_6z } !== { celloutsig_0_7z[16:11], celloutsig_0_7z, celloutsig_0_5z };
  assign celloutsig_0_22z = ~ in_data[78:74];
  assign celloutsig_1_5z = ^ celloutsig_1_0z;
  assign celloutsig_1_10z = ^ { celloutsig_1_7z, celloutsig_1_3z };
  assign celloutsig_1_18z = ^ { celloutsig_1_10z, celloutsig_1_1z, celloutsig_1_13z, celloutsig_1_16z, celloutsig_1_2z, celloutsig_1_7z };
  assign celloutsig_0_1z = ^ { in_data[47:39], celloutsig_0_0z };
  assign celloutsig_0_2z = ^ in_data[16:6];
  assign celloutsig_0_18z = { in_data[29:27], celloutsig_0_4z } >> { celloutsig_0_13z, celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_4z };
  assign celloutsig_1_0z = in_data[106:100] >> in_data[165:159];
  assign celloutsig_0_23z = { celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_16z, celloutsig_0_5z } >> celloutsig_0_9z;
  assign celloutsig_1_3z = { celloutsig_1_0z[6], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z } ~^ { in_data[148], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_28z = { celloutsig_0_26z, celloutsig_0_4z, celloutsig_0_27z, celloutsig_0_22z, celloutsig_0_1z, _00_, _01_, _02_[4:0], celloutsig_0_27z, celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_24z } ~^ { celloutsig_0_18z[7:0], celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_17z, _00_, _01_, _02_[4:0], celloutsig_0_15z };
  assign _02_[6:5] = { _00_, _01_ };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_31z, celloutsig_0_32z };
endmodule
