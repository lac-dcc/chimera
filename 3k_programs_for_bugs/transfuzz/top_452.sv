/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [22:0] _02_;
  wire [3:0] _03_;
  wire [3:0] _04_;
  wire [11:0] _05_;
  wire [2:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [3:0] celloutsig_0_11z;
  wire [14:0] celloutsig_0_12z;
  wire [3:0] celloutsig_0_15z;
  wire [17:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [5:0] celloutsig_0_18z;
  wire [4:0] celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire [19:0] celloutsig_0_21z;
  wire [8:0] celloutsig_0_23z;
  wire [5:0] celloutsig_0_25z;
  wire [5:0] celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire [8:0] celloutsig_0_2z;
  wire [22:0] celloutsig_0_31z;
  reg [6:0] celloutsig_0_35z;
  wire celloutsig_0_39z;
  wire [7:0] celloutsig_0_41z;
  reg [13:0] celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [2:0] celloutsig_0_6z;
  wire [20:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [3:0] celloutsig_1_0z;
  wire [3:0] celloutsig_1_11z;
  wire [2:0] celloutsig_1_18z;
  reg [16:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [35:0] celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire [5:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_39z = celloutsig_0_2z[6] ? celloutsig_0_0z[0] : in_data[89];
  assign celloutsig_0_29z = celloutsig_0_23z[8] ? celloutsig_0_39z : celloutsig_0_9z;
  assign celloutsig_0_4z = celloutsig_0_39z ? celloutsig_0_39z : in_data[17];
  assign celloutsig_0_46z = _01_ ? celloutsig_0_41z[7] : celloutsig_0_27z[5];
  assign celloutsig_1_1z = in_data[109] ? in_data[165] : in_data[129];
  assign celloutsig_1_3z = celloutsig_1_2z[1] ? celloutsig_1_0z[0] : celloutsig_1_1z;
  assign celloutsig_1_4z = celloutsig_1_0z[0] ? celloutsig_1_2z[7] : in_data[177];
  assign celloutsig_0_5z = celloutsig_0_2z[5] ? in_data[49] : celloutsig_0_39z;
  assign celloutsig_1_7z = celloutsig_1_4z ? celloutsig_1_3z : celloutsig_1_1z;
  assign celloutsig_0_8z = celloutsig_0_1z[2] ? celloutsig_0_39z : in_data[14];
  assign celloutsig_0_9z = celloutsig_0_8z ? celloutsig_0_4z : celloutsig_0_39z;
  assign celloutsig_0_10z = celloutsig_0_0z[2] ? celloutsig_0_2z[7] : celloutsig_0_7z[2];
  assign celloutsig_0_17z = celloutsig_0_10z ? celloutsig_0_12z[8] : celloutsig_0_4z;
  assign celloutsig_0_0z = in_data[7:5] + in_data[44:42];
  assign celloutsig_0_31z = { _02_[22:18], celloutsig_0_16z } + { celloutsig_0_25z[2:0], celloutsig_0_21z };
  assign celloutsig_0_41z = { celloutsig_0_27z[4:1], celloutsig_0_15z } + { celloutsig_0_31z[10], celloutsig_0_35z };
  assign celloutsig_1_0z = in_data[108:105] + in_data[130:127];
  assign celloutsig_1_2z = { in_data[151:144], celloutsig_1_1z } + in_data[187:179];
  assign celloutsig_1_5z = in_data[178:143] + { in_data[112:96], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_9z = in_data[132:127] + { celloutsig_1_2z[5:4], celloutsig_1_0z };
  assign celloutsig_1_11z = { celloutsig_1_9z[5:3], celloutsig_1_7z } + { celloutsig_1_9z[1], celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_6z = celloutsig_0_0z + in_data[23:21];
  assign celloutsig_1_18z = { in_data[107:106], celloutsig_1_1z } + celloutsig_1_11z[3:1];
  assign celloutsig_0_7z = { in_data[36:27], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_39z, celloutsig_0_1z, celloutsig_0_5z } + { in_data[61:58], celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_39z };
  assign celloutsig_0_1z = in_data[79:77] + celloutsig_0_0z;
  assign celloutsig_0_11z = { celloutsig_0_2z[5:4], celloutsig_0_4z, celloutsig_0_8z } + { in_data[44:42], celloutsig_0_8z };
  assign celloutsig_0_12z = { celloutsig_0_6z[2], celloutsig_0_0z, celloutsig_0_39z, celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_8z } + { celloutsig_0_6z[1:0], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_9z };
  assign celloutsig_0_15z = { _04_[3:2], celloutsig_0_10z, celloutsig_0_10z } + { celloutsig_0_10z, celloutsig_0_0z };
  assign celloutsig_0_16z = { celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_9z } + { celloutsig_0_12z[11:8], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_39z, celloutsig_0_0z };
  assign celloutsig_0_18z = { celloutsig_0_5z, _00_, _04_[3:2], _01_, celloutsig_0_5z } + { celloutsig_0_1z[2:1], _00_, _04_[3:2], _01_ };
  assign celloutsig_0_19z = celloutsig_0_2z[5:1] + { in_data[22:19], celloutsig_0_5z };
  assign celloutsig_0_2z = { in_data[45:40], celloutsig_0_1z } + { in_data[82:77], celloutsig_0_0z };
  assign celloutsig_0_20z = { celloutsig_0_39z, celloutsig_0_11z, celloutsig_0_5z } + { celloutsig_0_16z[13:10], celloutsig_0_10z, celloutsig_0_17z };
  assign celloutsig_0_21z = { in_data[10:1], celloutsig_0_2z, celloutsig_0_10z } + { celloutsig_0_7z[20:4], celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_10z };
  assign celloutsig_0_23z = { celloutsig_0_18z[5:1], celloutsig_0_11z } + { celloutsig_0_18z[0], celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_10z };
  assign celloutsig_0_25z = { _03_[3], celloutsig_0_10z, celloutsig_0_11z } + { celloutsig_0_19z, celloutsig_0_10z };
  assign celloutsig_0_27z = { celloutsig_0_16z[3], celloutsig_0_19z } + { _04_[3:2], celloutsig_0_10z, celloutsig_0_0z };
  reg [3:0] _43_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _43_ <= 4'h0;
    else _43_ <= celloutsig_0_11z;
  assign { _00_, _04_[3:2], _01_ } = _43_;
  reg [11:0] _44_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _44_ <= 12'h000;
    else _44_ <= { celloutsig_0_2z[7:6], celloutsig_0_20z, celloutsig_0_15z };
  assign { _05_[11], _03_, _05_[6:5], _02_[22:18] } = _44_;
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_35z = 7'h00;
    else if (clkin_data[64]) celloutsig_0_35z = { celloutsig_0_18z, celloutsig_0_29z };
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_45z = 14'h0000;
    else if (clkin_data[64]) celloutsig_0_45z = { celloutsig_0_2z[3], celloutsig_0_23z, celloutsig_0_17z, celloutsig_0_6z };
  always_latch
    if (clkin_data[32]) celloutsig_1_19z = 17'h00000;
    else if (clkin_data[96]) celloutsig_1_19z = celloutsig_1_5z[32:16];
  assign _02_[17:0] = celloutsig_0_16z;
  assign _04_[1:0] = { celloutsig_0_10z, celloutsig_0_10z };
  assign { _05_[10:7], _05_[4:0] } = { _03_, _02_[22:18] };
  assign { out_data[130:128], out_data[112:96], out_data[45:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_45z, celloutsig_0_46z };
endmodule
