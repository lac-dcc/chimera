/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire [19:0] _04_;
  wire [4:0] _05_;
  wire [12:0] _06_;
  reg [3:0] _07_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [15:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [8:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [17:0] celloutsig_0_2z;
  wire celloutsig_0_33z;
  wire [2:0] celloutsig_0_35z;
  wire [2:0] celloutsig_0_39z;
  wire [3:0] celloutsig_0_3z;
  wire [7:0] celloutsig_0_40z;
  wire [16:0] celloutsig_0_56z;
  wire [2:0] celloutsig_0_57z;
  wire [23:0] celloutsig_0_5z;
  wire [6:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [5:0] celloutsig_0_8z;
  wire [9:0] celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [3:0] celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire [7:0] celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[49] | ~(in_data[38]);
  assign celloutsig_0_33z = celloutsig_0_2z[2] | ~(celloutsig_0_24z);
  assign celloutsig_1_1z = in_data[154] | ~(celloutsig_1_0z[7]);
  assign celloutsig_1_2z = celloutsig_1_0z[0] | ~(in_data[136]);
  assign celloutsig_1_7z = celloutsig_1_3z[2] | ~(celloutsig_1_2z);
  assign celloutsig_1_8z = celloutsig_1_5z[5] | ~(celloutsig_1_7z);
  assign celloutsig_1_9z = celloutsig_1_8z | ~(in_data[97]);
  assign celloutsig_1_18z = celloutsig_1_9z | ~(in_data[139]);
  assign celloutsig_1_19z = in_data[155] | ~(celloutsig_1_1z);
  assign celloutsig_0_7z = celloutsig_0_3z[2] | ~(in_data[3]);
  assign celloutsig_0_10z = celloutsig_0_6z[4] | ~(_02_);
  assign celloutsig_0_12z = celloutsig_0_7z | ~(celloutsig_0_10z);
  assign celloutsig_0_13z = celloutsig_0_6z[0] | ~(celloutsig_0_5z[2]);
  assign celloutsig_0_14z = celloutsig_0_13z | ~(celloutsig_0_12z);
  assign celloutsig_0_17z = celloutsig_0_7z | ~(in_data[37]);
  assign celloutsig_0_18z = celloutsig_0_3z[0] | ~(celloutsig_0_12z);
  assign celloutsig_0_21z = celloutsig_0_8z[3] | ~(celloutsig_0_18z);
  assign celloutsig_0_22z = celloutsig_0_14z | ~(_03_);
  assign celloutsig_0_24z = celloutsig_0_14z | ~(celloutsig_0_5z[15]);
  reg [4:0] _27_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[32])
    if (!clkin_data[32]) _27_ <= 5'h00;
    else _27_ <= celloutsig_0_40z[5:1];
  assign { _05_[4:1], _00_ } = _27_;
  reg [12:0] _28_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _28_ <= 13'h0000;
    else _28_ <= { celloutsig_0_2z[17:6], celloutsig_0_0z };
  assign { _04_[12:5], _01_, _04_[3:0] } = _28_;
  reg [12:0] _29_;
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[32])
    if (clkin_data[32]) _29_ <= 13'h0000;
    else _29_ <= { in_data[30:20], celloutsig_0_0z, celloutsig_0_0z };
  assign { _06_[12:11], _02_, _06_[9], _03_, _06_[7:0] } = _29_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[64])
    if (!clkin_data[64]) _07_ <= 4'h0;
    else _07_ <= celloutsig_0_16z[15:12];
  assign celloutsig_0_35z = { _04_[2], celloutsig_0_22z, celloutsig_0_22z } >> { celloutsig_0_23z[7], celloutsig_0_18z, celloutsig_0_7z };
  assign celloutsig_0_3z = { _02_, _06_[9], _03_, _06_[7] } >> in_data[30:27];
  assign celloutsig_0_39z = celloutsig_0_5z[13:11] >> _06_[4:2];
  assign celloutsig_0_40z = { _07_, celloutsig_0_21z, celloutsig_0_35z } >> { in_data[29:24], celloutsig_0_22z, celloutsig_0_33z };
  assign celloutsig_0_56z = celloutsig_0_2z[16:0] >> { _06_[6:0], celloutsig_0_10z, celloutsig_0_23z };
  assign celloutsig_0_57z = { celloutsig_0_39z[1], celloutsig_0_12z, celloutsig_0_17z } >> _05_[3:1];
  assign celloutsig_1_0z = in_data[186:177] >> in_data[154:145];
  assign celloutsig_1_3z = { celloutsig_1_0z[9:8], celloutsig_1_2z, celloutsig_1_1z } >> { in_data[107:105], celloutsig_1_1z };
  assign celloutsig_1_4z = { celloutsig_1_3z[1:0], celloutsig_1_2z } >> { celloutsig_1_0z[4], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_5z = { _04_[11:8], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_0z } >> { _04_[11:5], _01_, _04_[3:2], _06_[12:11], _02_, _06_[9], _03_, _06_[7:0], celloutsig_0_0z };
  assign celloutsig_1_5z = { celloutsig_1_0z[8:4], celloutsig_1_4z } >> in_data[158:151];
  assign celloutsig_0_6z = celloutsig_0_2z[17:11] >> celloutsig_0_5z[18:12];
  assign celloutsig_0_8z = { _06_[11], _02_, _06_[9], _03_, _06_[7:6] } >> { in_data[90:86], celloutsig_0_0z };
  assign celloutsig_0_16z = { celloutsig_0_5z[17:15], _04_[12:5], _01_, _04_[3:0] } >> { _06_[11], _02_, _06_[9], _06_[12:11], _02_, _06_[9], _03_, _06_[7:0] };
  assign celloutsig_0_23z = { celloutsig_0_16z[10:5], celloutsig_0_17z, celloutsig_0_21z, celloutsig_0_14z } >> in_data[9:1];
  assign celloutsig_0_2z = { _06_[5:2], _06_[12:11], _02_, _06_[9], _03_, _06_[7:0], celloutsig_0_0z } >> { _06_[12:11], _02_, _06_[9], celloutsig_0_0z, _06_[12:11], _02_, _06_[9], _03_, _06_[7:0] };
  assign { _04_[19], _04_[17], _04_[13], _04_[4] } = { celloutsig_0_35z[2], celloutsig_0_0z, celloutsig_0_24z, _01_ };
  assign _05_[0] = _00_;
  assign { _06_[10], _06_[8] } = { _02_, _03_ };
  assign { out_data[128], out_data[96], out_data[48:32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_56z, celloutsig_0_57z };
endmodule
