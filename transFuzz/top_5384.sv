/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [10:0] _03_;
  wire [11:0] _04_;
  wire [15:0] _05_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [16:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [8:0] celloutsig_0_14z;
  wire celloutsig_0_16z;
  wire [5:0] celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [13:0] celloutsig_0_20z;
  wire [25:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [2:0] celloutsig_0_27z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [10:0] celloutsig_0_31z;
  wire [5:0] celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire [8:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [2:0] celloutsig_0_3z;
  wire [10:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_4z;
  wire [13:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [14:0] celloutsig_0_7z;
  wire [17:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_13z;
  wire celloutsig_1_17z;
  wire [3:0] celloutsig_1_19z;
  wire [5:0] celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[95] | ~(in_data[20]);
  assign celloutsig_0_35z = celloutsig_0_33z[3] | ~(_00_);
  assign celloutsig_0_38z = celloutsig_0_14z[1] | ~(celloutsig_0_31z[4]);
  assign celloutsig_0_41z = celloutsig_0_40z[6] | ~(celloutsig_0_11z[1]);
  assign celloutsig_0_4z = celloutsig_0_2z | ~(celloutsig_0_0z);
  assign celloutsig_1_0z = in_data[153] | ~(in_data[190]);
  assign celloutsig_1_3z = in_data[174] | ~(celloutsig_1_1z[2]);
  assign celloutsig_1_7z = celloutsig_1_0z | ~(_01_);
  assign celloutsig_1_13z = celloutsig_1_8z[1] | ~(in_data[181]);
  assign celloutsig_1_17z = celloutsig_1_3z | ~(celloutsig_1_2z[3]);
  assign celloutsig_0_6z = celloutsig_0_0z | ~(celloutsig_0_0z);
  assign celloutsig_0_9z = celloutsig_0_0z | ~(in_data[58]);
  assign celloutsig_0_10z = celloutsig_0_4z | ~(celloutsig_0_1z);
  assign celloutsig_0_12z = celloutsig_0_9z | ~(celloutsig_0_0z);
  assign celloutsig_0_1z = in_data[53] | ~(in_data[62]);
  assign celloutsig_0_13z = celloutsig_0_7z[2] | ~(celloutsig_0_0z);
  assign celloutsig_0_16z = celloutsig_0_13z | ~(celloutsig_0_10z);
  assign celloutsig_0_19z = celloutsig_0_7z[4] | ~(celloutsig_0_2z);
  assign celloutsig_0_2z = in_data[9] | ~(celloutsig_0_1z);
  assign celloutsig_0_23z = celloutsig_0_11z[1] | ~(celloutsig_0_13z);
  assign celloutsig_0_24z = celloutsig_0_1z | ~(celloutsig_0_14z[1]);
  assign celloutsig_0_30z = celloutsig_0_0z | ~(celloutsig_0_13z);
  reg [10:0] _28_;
  always_ff @(negedge clkin_data[32], posedge clkin_data[160])
    if (clkin_data[160]) _28_ <= 11'h000;
    else _28_ <= { in_data[159:150], celloutsig_1_0z };
  assign { _03_[10:7], _01_, _03_[5:0] } = _28_;
  reg [3:0] _29_;
  always_ff @(negedge clkin_data[32], negedge clkin_data[128])
    if (!clkin_data[128]) _29_ <= 4'h0;
    else _29_ <= { celloutsig_1_8z[2:0], celloutsig_1_0z };
  assign out_data[131:128] = _29_;
  reg [11:0] _30_;
  always_ff @(posedge celloutsig_1_19z[0], negedge clkin_data[64])
    if (!clkin_data[64]) _30_ <= 12'h000;
    else _30_ <= { in_data[73:67], celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_12z };
  assign { _04_[11:1], _02_ } = _30_;
  reg [15:0] _31_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _31_ <= 16'h0000;
    else _31_ <= { celloutsig_0_3z[1], celloutsig_0_6z, celloutsig_0_20z };
  assign { _05_[15:2], _00_, _05_[0] } = _31_;
  assign celloutsig_0_3z = in_data[72:70] * { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_33z = { celloutsig_0_8z[7], celloutsig_0_24z, celloutsig_0_27z, celloutsig_0_30z } * celloutsig_0_22z[24:19];
  assign celloutsig_0_37z = celloutsig_0_22z[13:5] * { _04_[8:1], _02_ };
  assign celloutsig_0_40z = { celloutsig_0_4z, celloutsig_0_37z, celloutsig_0_19z } * { celloutsig_0_22z[5:3], celloutsig_0_38z, celloutsig_0_16z, celloutsig_0_24z, celloutsig_0_23z, celloutsig_0_19z, celloutsig_0_35z, celloutsig_0_9z, celloutsig_0_10z };
  assign celloutsig_1_1z = { in_data[153:149], celloutsig_1_0z } * in_data[177:172];
  assign celloutsig_1_2z = in_data[162:156] * { celloutsig_1_1z[4:0], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_8z = celloutsig_1_2z[6:3] * in_data[113:110];
  assign celloutsig_0_5z = { in_data[86:82], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_0z } * { in_data[88:81], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_19z = { _03_[7], _01_, celloutsig_1_7z, celloutsig_1_13z } * { in_data[115:113], celloutsig_1_17z };
  assign celloutsig_0_7z = { in_data[82], celloutsig_0_5z } * { celloutsig_0_5z[11:0], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_8z = { celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_1z } * { celloutsig_0_7z[12:0], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_6z };
  assign celloutsig_0_11z = { in_data[80:70], celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_4z } * { celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_9z };
  assign celloutsig_0_14z = { celloutsig_0_8z[7:4], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_3z } * { in_data[70:63], celloutsig_0_2z };
  assign celloutsig_0_17z = celloutsig_0_7z[6:1] * { celloutsig_0_7z[7:3], celloutsig_0_13z };
  assign celloutsig_0_20z = celloutsig_0_8z[13:0] * { celloutsig_0_5z[9:3], celloutsig_0_0z, celloutsig_0_17z };
  assign celloutsig_0_22z = { _04_[11:1], _02_, celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_4z } * { in_data[57:51], celloutsig_0_14z, celloutsig_0_14z, celloutsig_0_2z };
  assign celloutsig_0_27z = { celloutsig_0_12z, celloutsig_0_23z, celloutsig_0_12z } * { celloutsig_0_19z, celloutsig_0_2z, celloutsig_0_9z };
  assign celloutsig_0_31z = { in_data[13:4], celloutsig_0_24z } * { celloutsig_0_8z[4:2], celloutsig_0_13z, celloutsig_0_27z, celloutsig_0_27z, celloutsig_0_6z };
  assign _03_[6] = _01_;
  assign _04_[0] = _02_;
  assign _05_[1] = _00_;
  assign { out_data[99:96], out_data[42:32], out_data[0] } = { celloutsig_1_19z, celloutsig_0_40z, celloutsig_0_41z };
endmodule
