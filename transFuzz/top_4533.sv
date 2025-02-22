/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire [2:0] _07_;
  reg [2:0] _08_;
  wire [16:0] _09_;
  wire [7:0] _10_;
  wire [7:0] _11_;
  wire [2:0] _12_;
  wire [15:0] celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [23:0] celloutsig_0_15z;
  wire [17:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [9:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [5:0] celloutsig_0_2z;
  wire celloutsig_0_33z;
  wire celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire [2:0] celloutsig_0_38z;
  wire [6:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [2:0] celloutsig_0_42z;
  wire [3:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [18:0] celloutsig_0_6z;
  wire [12:0] celloutsig_0_7z;
  wire [2:0] celloutsig_0_9z;
  wire [8:0] celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [7:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [9:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [11:0] celloutsig_1_8z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_19z = ~(celloutsig_1_15z & celloutsig_1_18z);
  assign celloutsig_0_49z = ~(celloutsig_0_18z | celloutsig_0_42z[1]);
  assign celloutsig_0_11z = ~(celloutsig_0_2z[5] | celloutsig_0_7z[4]);
  assign celloutsig_0_20z = ~(_00_ | celloutsig_0_19z);
  assign celloutsig_0_35z = ~((_01_ | _02_) & (celloutsig_0_22z | _03_));
  assign celloutsig_1_11z = ~((celloutsig_1_8z[10] | celloutsig_1_4z) & (celloutsig_1_7z | celloutsig_1_2z));
  assign celloutsig_1_18z = ~((celloutsig_1_4z | celloutsig_1_2z) & (celloutsig_1_3z[0] | celloutsig_1_8z[9]));
  assign celloutsig_0_19z = ~((_04_ | celloutsig_0_16z[14]) & (_05_ | celloutsig_0_15z[16]));
  assign celloutsig_1_15z = celloutsig_1_11z | celloutsig_1_6z[3];
  reg [2:0] _22_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[32])
    if (!clkin_data[32]) _22_ <= 3'h0;
    else _22_ <= { celloutsig_0_23z, celloutsig_0_20z, celloutsig_0_29z };
  assign { _07_[2:1], _01_ } = _22_;
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[32])
    if (clkin_data[32]) _08_ <= 3'h0;
    else _08_ <= { celloutsig_0_12z, celloutsig_0_28z, celloutsig_0_28z };
  reg [16:0] _24_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[32])
    if (clkin_data[32]) _24_ <= 17'h00000;
    else _24_ <= { celloutsig_0_6z[16:6], celloutsig_0_2z };
  assign { _09_[16], _06_, _09_[14:9], _02_, _04_, _09_[6:0] } = _24_;
  reg [7:0] _25_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _25_ <= 8'h00;
    else _25_ <= { _09_[13:9], _02_, _04_, celloutsig_0_1z };
  assign { _10_[7:6], _03_, _10_[4:0] } = _25_;
  reg [7:0] _26_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[32])
    if (clkin_data[32]) _26_ <= 8'h00;
    else _26_ <= { _09_[14:9], _02_, _04_ };
  assign { _11_[7:4], _05_, _11_[2:0] } = _26_;
  reg [2:0] _27_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[32])
    if (clkin_data[32]) _27_ <= 3'h0;
    else _27_ <= celloutsig_0_6z[15:13];
  assign { _12_[2], _00_, _12_[0] } = _27_;
  assign celloutsig_0_25z = celloutsig_0_0z[15:6] / { 1'h1, _11_[7:4], _05_, _11_[2:0], celloutsig_0_17z };
  assign celloutsig_0_3z = celloutsig_0_2z[2:0] && celloutsig_0_0z[10:8];
  assign celloutsig_0_37z = { celloutsig_0_2z[4:3], celloutsig_0_3z, celloutsig_0_21z, celloutsig_0_22z } && { _08_[0], celloutsig_0_24z, celloutsig_0_35z, celloutsig_0_19z, celloutsig_0_3z };
  assign celloutsig_0_5z = in_data[25:20] && { in_data[17:13], celloutsig_0_1z };
  assign celloutsig_1_2z = { celloutsig_1_0z[2:1], celloutsig_1_0z } && { in_data[98:97], celloutsig_1_0z };
  assign celloutsig_1_4z = { in_data[139:137], celloutsig_1_1z } && { celloutsig_1_0z[3:2], celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_7z = in_data[121:105] && { celloutsig_1_6z[8:1], celloutsig_1_0z };
  assign celloutsig_0_21z = { _12_[2], _00_, celloutsig_0_20z, celloutsig_0_12z } && celloutsig_0_15z[11:8];
  assign celloutsig_0_24z = { in_data[69], celloutsig_0_9z } && { celloutsig_0_21z, celloutsig_0_9z };
  assign celloutsig_0_33z = { in_data[20:15], celloutsig_0_17z } || celloutsig_0_7z[7:1];
  assign celloutsig_1_5z = celloutsig_1_0z || { in_data[182:175], celloutsig_1_1z };
  assign celloutsig_0_29z = { celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_4z } || { celloutsig_0_16z[13:5], _09_[16], _06_, _09_[14:9], _02_, _04_, _09_[6:0] };
  assign celloutsig_0_18z = _11_[6:4] < { _03_, _10_[4:3] };
  assign celloutsig_0_4z = celloutsig_0_1z & ~(celloutsig_0_2z[0]);
  assign celloutsig_1_1z = in_data[124] & ~(in_data[160]);
  assign celloutsig_0_1z = celloutsig_0_0z[0] & ~(celloutsig_0_0z[15]);
  assign celloutsig_0_12z = celloutsig_0_4z & ~(celloutsig_0_3z);
  assign celloutsig_0_17z = celloutsig_0_3z & ~(_10_[1]);
  assign celloutsig_0_22z = celloutsig_0_6z[13] & ~(_12_[0]);
  assign celloutsig_0_28z = _11_[5] & ~(celloutsig_0_26z);
  assign celloutsig_0_0z = in_data[91:76] % { 1'h1, in_data[86:72] };
  assign celloutsig_1_6z = { celloutsig_1_0z[7:1], celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_4z } % { 1'h1, celloutsig_1_3z, in_data[96] };
  assign celloutsig_1_3z = { celloutsig_1_0z[6:0], celloutsig_1_1z } * celloutsig_1_0z[8:1];
  assign celloutsig_0_23z = celloutsig_0_7z[1] & celloutsig_0_19z;
  assign celloutsig_0_26z = ^ { celloutsig_0_9z[2], celloutsig_0_1z, celloutsig_0_24z };
  assign celloutsig_0_42z = { _11_[4], _05_, _11_[2] } >> { _10_[7:6], _03_ };
  assign celloutsig_0_38z = { celloutsig_0_4z, celloutsig_0_24z, celloutsig_0_20z } << { _00_, celloutsig_0_12z, celloutsig_0_26z };
  assign celloutsig_0_39z = { _11_[5:4], _05_, _11_[2:1], celloutsig_0_33z, celloutsig_0_26z } >> celloutsig_0_25z[9:3];
  assign celloutsig_1_8z = { celloutsig_1_0z[0], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_5z } >> { celloutsig_1_6z[7:6], celloutsig_1_6z };
  assign celloutsig_0_7z = { in_data[84:82], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_2z } >> celloutsig_0_0z[13:1];
  assign celloutsig_0_15z = { in_data[76:54], celloutsig_0_4z } >> { celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_9z };
  assign celloutsig_0_48z = celloutsig_0_39z[6:3] >>> { celloutsig_0_37z, celloutsig_0_38z };
  assign celloutsig_0_9z = celloutsig_0_0z[11:9] >>> _09_[4:2];
  assign celloutsig_1_0z = in_data[127:119] - in_data[186:178];
  assign celloutsig_0_6z = { in_data[10:5], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_3z } ^ { celloutsig_0_2z[0], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_16z = celloutsig_0_6z[18:1] ^ celloutsig_0_6z[17:0];
  assign celloutsig_0_2z = in_data[6:1] ^ in_data[36:31];
  assign _07_[0] = _01_;
  assign { _09_[15], _09_[8:7] } = { _06_, _02_, _04_ };
  assign _10_[5] = _03_;
  assign _11_[3] = _05_;
  assign _12_[1] = _00_;
  assign { out_data[128], out_data[96], out_data[35:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_48z, celloutsig_0_49z };
endmodule
