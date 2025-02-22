/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [8:0] _02_;
  wire [5:0] _03_;
  wire celloutsig_0_0z;
  wire [10:0] celloutsig_0_10z;
  wire [2:0] celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_14z;
  reg [13:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [5:0] celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire [5:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [16:0] celloutsig_0_22z;
  wire [10:0] celloutsig_0_23z;
  wire [6:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire [14:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire [21:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [5:0] celloutsig_0_36z;
  wire [16:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire [2:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire [15:0] celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_57z;
  wire [8:0] celloutsig_0_5z;
  wire celloutsig_0_68z;
  wire [6:0] celloutsig_0_6z;
  wire [8:0] celloutsig_0_79z;
  wire celloutsig_0_7z;
  wire celloutsig_0_80z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [5:0] celloutsig_1_0z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [22:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_30z = celloutsig_0_27z ? celloutsig_0_26z : celloutsig_0_18z[0];
  assign celloutsig_0_26z = celloutsig_0_19z[2] ? celloutsig_0_2z[3] : celloutsig_0_5z[2];
  assign celloutsig_0_27z = celloutsig_0_4z ? celloutsig_0_23z[4] : celloutsig_0_14z;
  assign celloutsig_0_9z = ~(in_data[5] & celloutsig_0_3z);
  assign celloutsig_0_0z = !(in_data[44] ? in_data[37] : in_data[81]);
  assign celloutsig_0_3z = !(celloutsig_0_2z[5] ? celloutsig_0_2z[6] : celloutsig_0_0z);
  assign celloutsig_0_38z = !(celloutsig_0_5z[0] ? celloutsig_0_0z : celloutsig_0_29z);
  assign celloutsig_0_44z = !(celloutsig_0_24z[6] ? _00_ : celloutsig_0_38z);
  assign celloutsig_1_2z = !(in_data[180] ? celloutsig_1_1z[1] : celloutsig_1_0z[4]);
  assign celloutsig_0_14z = !(celloutsig_0_0z ? celloutsig_0_10z[4] : celloutsig_0_5z[6]);
  assign celloutsig_0_16z = !(celloutsig_0_14z ? celloutsig_0_8z : celloutsig_0_8z);
  assign celloutsig_1_7z = ~(_01_ | celloutsig_1_3z[3]);
  assign celloutsig_1_17z = ~(celloutsig_1_3z[3] | celloutsig_1_1z[1]);
  assign celloutsig_0_33z = ~celloutsig_0_2z[11];
  assign celloutsig_0_57z = ~celloutsig_0_31z;
  assign celloutsig_0_8z = ~celloutsig_0_0z;
  assign celloutsig_1_18z = ~celloutsig_1_15z;
  assign celloutsig_0_4z = ~((celloutsig_0_1z | celloutsig_0_2z[13]) & (celloutsig_0_2z[1] | celloutsig_0_2z[9]));
  assign celloutsig_0_35z = celloutsig_0_24z[1] | celloutsig_0_34z[9];
  assign celloutsig_0_68z = celloutsig_0_20z | celloutsig_0_31z;
  reg [8:0] _24_;
  always_ff @(negedge clkin_data[32], posedge clkin_data[64])
    if (clkin_data[64]) _24_ <= 9'h000;
    else _24_ <= { celloutsig_1_3z[11:9], celloutsig_1_0z };
  assign { _02_[8:1], _01_ } = _24_;
  reg [5:0] _25_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _25_ <= 6'h00;
    else _25_ <= in_data[73:68];
  assign { _03_[5:1], _00_ } = _25_;
  assign celloutsig_0_31z = celloutsig_0_2z[4:1] == { celloutsig_0_10z[0], celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_0_41z = celloutsig_0_34z[7:4] == celloutsig_0_2z[4:1];
  assign celloutsig_0_20z = in_data[34:11] == { celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_45z = { celloutsig_0_19z[3:0], celloutsig_0_44z, celloutsig_0_16z, celloutsig_0_5z } === { celloutsig_0_37z[12:2], celloutsig_0_11z, celloutsig_0_27z };
  assign celloutsig_0_80z = { celloutsig_0_48z[7:2], celloutsig_0_57z } === { celloutsig_0_22z[14:10], celloutsig_0_33z, celloutsig_0_68z };
  assign celloutsig_1_4z = in_data[108] === celloutsig_1_2z;
  assign celloutsig_1_9z = { celloutsig_1_3z[16:11], celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_7z } === { in_data[123:116], celloutsig_1_6z };
  assign celloutsig_0_7z = { celloutsig_0_5z[7:0], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z } <= { in_data[84:74], celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_1_19z = _02_[6:1] <= { celloutsig_1_6z, celloutsig_1_17z, celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_18z };
  assign celloutsig_0_1z = { in_data[12:0], celloutsig_0_0z, celloutsig_0_0z } <= in_data[41:27];
  assign celloutsig_0_29z = in_data[68:66] <= celloutsig_0_23z[3:1];
  assign celloutsig_0_79z = { celloutsig_0_5z[7:3], celloutsig_0_11z, celloutsig_0_4z } % { 1'h1, celloutsig_0_44z, celloutsig_0_36z, celloutsig_0_35z };
  assign celloutsig_0_34z = in_data[25] ? { celloutsig_0_5z[7:2], celloutsig_0_14z, celloutsig_0_27z, celloutsig_0_27z, celloutsig_0_1z, celloutsig_0_20z, celloutsig_0_11z, celloutsig_0_24z, celloutsig_0_20z } : { celloutsig_0_3z, celloutsig_0_24z, celloutsig_0_30z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_20z, celloutsig_0_19z };
  assign celloutsig_0_37z = celloutsig_0_12z[0] ? in_data[90:74] : { celloutsig_0_15z[12:0], celloutsig_0_12z[3:1], 1'h0 };
  assign celloutsig_0_2z = in_data[7] ? in_data[66:52] : { in_data[95:82], celloutsig_0_0z };
  assign celloutsig_0_48z = { celloutsig_0_2z[14:10], celloutsig_0_30z, _03_[5:1], _00_, celloutsig_0_43z, celloutsig_0_9z } | { celloutsig_0_10z[10:9], celloutsig_0_41z, celloutsig_0_45z, celloutsig_0_35z, celloutsig_0_38z, celloutsig_0_8z, celloutsig_0_35z, celloutsig_0_26z, celloutsig_0_0z, celloutsig_0_19z };
  assign celloutsig_0_6z = { in_data[9:4], celloutsig_0_0z } | { celloutsig_0_2z[9:6], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_1_0z = in_data[151:146] | in_data[156:151];
  assign celloutsig_0_23z = { celloutsig_0_15z[11:2], celloutsig_0_16z } | { celloutsig_0_19z[4:0], celloutsig_0_19z };
  assign celloutsig_1_6z = | { _01_, _02_[8:1], celloutsig_1_4z, celloutsig_1_2z };
  assign celloutsig_1_15z = | celloutsig_1_3z[17:0];
  assign celloutsig_0_25z = ^ { celloutsig_0_19z, celloutsig_0_17z, celloutsig_0_16z };
  assign celloutsig_0_12z = { celloutsig_0_6z[2:1], celloutsig_0_3z, celloutsig_0_4z } >> celloutsig_0_5z[5:2];
  assign celloutsig_0_36z = { celloutsig_0_5z[4:2], celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_26z } <<< { celloutsig_0_17z[4:2], celloutsig_0_25z, celloutsig_0_33z, celloutsig_0_27z };
  assign celloutsig_1_1z = celloutsig_1_0z[2:0] <<< in_data[166:164];
  assign celloutsig_0_11z = { celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_0z } <<< in_data[32:30];
  assign celloutsig_0_18z = celloutsig_0_12z <<< celloutsig_0_12z;
  assign celloutsig_0_19z = { in_data[39:35], celloutsig_0_8z } <<< { celloutsig_0_15z[7], celloutsig_0_7z, celloutsig_0_12z };
  assign celloutsig_0_24z = in_data[24:18] <<< celloutsig_0_10z[9:3];
  assign celloutsig_0_10z = { celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_5z } - { in_data[11:2], celloutsig_0_1z };
  assign celloutsig_0_43z = { celloutsig_0_31z, celloutsig_0_35z, celloutsig_0_41z } ~^ celloutsig_0_12z[2:0];
  assign celloutsig_0_5z = in_data[85:77] ~^ celloutsig_0_2z[8:0];
  assign celloutsig_1_3z = { in_data[166:160], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_0z } ~^ in_data[168:146];
  assign celloutsig_0_17z = { celloutsig_0_2z[8:4], celloutsig_0_3z } ~^ { _03_[5:1], _00_ };
  assign celloutsig_0_22z = { celloutsig_0_5z, _03_[5:1], _00_, celloutsig_0_20z, celloutsig_0_4z } ~^ { celloutsig_0_19z[3:0], _03_[5:1], _00_, _03_[5:1], _00_, celloutsig_0_0z };
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_15z = 14'h0000;
    else if (!clkin_data[96]) celloutsig_0_15z = { celloutsig_0_2z[10:5], celloutsig_0_7z, _03_[5:1], _00_, celloutsig_0_7z };
  assign _02_[0] = _01_;
  assign _03_[0] = _00_;
  assign { out_data[128], out_data[96], out_data[40:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_79z, celloutsig_0_80z };
endmodule
