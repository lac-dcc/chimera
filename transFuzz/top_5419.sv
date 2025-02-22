/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [8:0] _02_;
  wire [3:0] _03_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [3:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [9:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [14:0] celloutsig_0_20z;
  wire [2:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [19:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire [5:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_35z;
  wire [21:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire [9:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [4:0] celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire [9:0] celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [7:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire [4:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_2z = ~(celloutsig_1_0z[8] & celloutsig_1_0z[5]);
  assign celloutsig_1_8z = ~(celloutsig_1_6z & celloutsig_1_0z[6]);
  assign celloutsig_0_9z = ~(celloutsig_0_1z & celloutsig_0_6z);
  assign celloutsig_0_22z = ~(celloutsig_0_12z & celloutsig_0_11z[3]);
  assign celloutsig_0_35z = !(celloutsig_0_1z ? celloutsig_0_31z : celloutsig_0_20z[6]);
  assign celloutsig_0_4z = !(celloutsig_0_3z ? celloutsig_0_1z : celloutsig_0_2z[0]);
  assign celloutsig_1_3z = !(celloutsig_1_2z ? celloutsig_1_0z[4] : in_data[179]);
  assign celloutsig_1_6z = !(celloutsig_1_0z[5] ? celloutsig_1_5z[0] : celloutsig_1_2z);
  assign celloutsig_0_3z = ~(in_data[20] | celloutsig_0_2z[1]);
  assign celloutsig_1_18z = ~(celloutsig_1_3z | celloutsig_1_17z[6]);
  assign celloutsig_0_0z = ~((in_data[54] | in_data[34]) & (in_data[69] | in_data[70]));
  assign celloutsig_1_12z = ~(_00_ ^ celloutsig_1_2z);
  assign celloutsig_1_19z = ~(celloutsig_1_2z ^ celloutsig_1_9z[2]);
  assign celloutsig_0_16z = ~(celloutsig_0_7z[3] ^ celloutsig_0_7z[2]);
  assign celloutsig_0_26z = ~(celloutsig_0_24z[18] ^ _01_);
  assign celloutsig_0_30z = ~(celloutsig_0_0z ^ in_data[92]);
  reg [8:0] _20_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _20_ <= 9'h000;
    else _20_ <= { celloutsig_1_9z, celloutsig_1_10z[2], celloutsig_1_10z[2], celloutsig_1_10z[2], celloutsig_1_1z };
  assign { _02_[8], _00_, _02_[6:0] } = _20_;
  reg [3:0] _21_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _21_ <= 4'h0;
    else _21_ <= { celloutsig_0_20z[4], celloutsig_0_21z };
  assign { _03_[3:1], _01_ } = _21_;
  assign celloutsig_0_13z = celloutsig_0_11z[3:0] & { in_data[86:85], celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_18z = { celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_9z } / { 1'h1, celloutsig_0_2z[1:0], celloutsig_0_5z, celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_3z };
  assign celloutsig_0_49z = { celloutsig_0_25z, celloutsig_0_21z } == { celloutsig_0_2z[4:3], celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_0_17z = in_data[23:17] == { celloutsig_0_14z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_12z };
  assign celloutsig_0_43z = { celloutsig_0_18z[4], celloutsig_0_13z } === in_data[13:9];
  assign celloutsig_0_12z = { celloutsig_0_9z, celloutsig_0_2z } === { celloutsig_0_7z[3:0], celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_0_6z = { celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_2z } && { celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_2z };
  assign celloutsig_0_5z = ! { in_data[67:65], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_25z = ! in_data[91:76];
  assign celloutsig_1_1z = in_data[191:187] < celloutsig_1_0z[6:2];
  assign celloutsig_0_42z = celloutsig_0_38z & ~(celloutsig_0_6z);
  assign celloutsig_0_29z = celloutsig_0_14z[0] & ~(celloutsig_0_25z);
  assign celloutsig_0_48z = { celloutsig_0_11z, celloutsig_0_26z, celloutsig_0_14z, celloutsig_0_42z } * { celloutsig_0_37z[12:8], celloutsig_0_35z, celloutsig_0_29z, celloutsig_0_19z, celloutsig_0_43z, celloutsig_0_12z };
  assign celloutsig_1_5z = celloutsig_1_4z[4:2] * in_data[139:137];
  assign celloutsig_1_9z = { celloutsig_1_4z[4:3], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_1z } * { in_data[148:147], celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_6z };
  assign celloutsig_1_17z = { celloutsig_1_9z[4:3], celloutsig_1_12z, celloutsig_1_10z[2], celloutsig_1_10z[2], celloutsig_1_10z[2], celloutsig_1_2z, celloutsig_1_13z } * { _02_[6:0], celloutsig_1_2z };
  assign celloutsig_0_11z = { celloutsig_0_7z[3:1], celloutsig_0_9z, celloutsig_0_0z } * { celloutsig_0_2z[2:0], celloutsig_0_1z, celloutsig_0_9z };
  assign celloutsig_0_20z = { in_data[33:27], celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_4z } * { celloutsig_0_18z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_19z, celloutsig_0_4z, celloutsig_0_12z };
  assign celloutsig_0_2z = { in_data[42:38], celloutsig_0_1z } * { in_data[12:8], celloutsig_0_0z };
  assign celloutsig_1_4z = ~ { celloutsig_1_0z[4:2], celloutsig_1_2z, celloutsig_1_3z };
  assign celloutsig_0_7z = ~ celloutsig_0_2z[4:0];
  assign celloutsig_0_14z = ~ in_data[18:16];
  assign celloutsig_0_24z = ~ { in_data[79:64], _03_[3:1], _01_ };
  assign celloutsig_0_38z = & { celloutsig_0_22z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_10z = & { celloutsig_0_6z, celloutsig_0_1z, in_data[40] };
  assign celloutsig_0_19z = & { celloutsig_0_16z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_11z[3:2], celloutsig_0_0z };
  assign celloutsig_0_31z = & { celloutsig_0_14z, celloutsig_0_11z[4:3], celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_1z, in_data[40] };
  assign celloutsig_0_27z = celloutsig_0_18z[7] & celloutsig_0_12z;
  assign celloutsig_0_1z = ~^ { in_data[41:38], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_13z = ^ in_data[179:170];
  assign celloutsig_0_37z = { celloutsig_0_10z, celloutsig_0_17z, celloutsig_0_25z, celloutsig_0_26z, celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_27z, celloutsig_0_35z, celloutsig_0_17z, celloutsig_0_16z, celloutsig_0_21z } ~^ { in_data[87:68], celloutsig_0_30z, celloutsig_0_22z };
  assign celloutsig_1_0z = in_data[179:170] ~^ in_data[117:108];
  assign celloutsig_0_21z = { celloutsig_0_2z[1:0], celloutsig_0_17z } ~^ { celloutsig_0_2z[2], celloutsig_0_12z, celloutsig_0_0z };
  assign celloutsig_1_10z[2] = ~ celloutsig_1_2z;
  assign _02_[7] = _00_;
  assign _03_[0] = _01_;
  assign celloutsig_1_10z[1:0] = { celloutsig_1_10z[2], celloutsig_1_10z[2] };
  assign { out_data[128], out_data[96], out_data[41:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_48z, celloutsig_0_49z };
endmodule
