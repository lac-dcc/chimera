/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [12:0] _03_;
  wire [9:0] _04_;
  wire [22:0] _05_;
  reg [6:0] _06_;
  wire [4:0] celloutsig_0_0z;
  wire [28:0] celloutsig_0_10z;
  wire [15:0] celloutsig_0_11z;
  wire [4:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire [14:0] celloutsig_0_16z;
  wire [13:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [48:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [11:0] celloutsig_0_25z;
  wire [14:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [13:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [7:0] celloutsig_0_32z;
  wire [9:0] celloutsig_0_33z;
  wire [14:0] celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire [19:0] celloutsig_0_40z;
  wire [4:0] celloutsig_0_41z;
  wire celloutsig_0_44z;
  wire [5:0] celloutsig_0_46z;
  wire [14:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [18:0] celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire [12:0] celloutsig_0_54z;
  wire [16:0] celloutsig_0_56z;
  wire celloutsig_0_57z;
  wire [32:0] celloutsig_0_60z;
  wire [8:0] celloutsig_0_62z;
  wire celloutsig_0_64z;
  wire celloutsig_0_66z;
  wire celloutsig_0_67z;
  wire [4:0] celloutsig_0_68z;
  wire [13:0] celloutsig_0_69z;
  wire [2:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_82z;
  wire celloutsig_0_83z;
  wire [9:0] celloutsig_0_8z;
  wire [5:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [30:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [2:0] celloutsig_1_12z;
  wire [6:0] celloutsig_1_14z;
  wire [6:0] celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire [7:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [9:0] celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [14:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_3z = celloutsig_1_1z[5] ^ celloutsig_1_0z;
  assign celloutsig_0_24z = celloutsig_0_2z ^ celloutsig_0_13z;
  assign celloutsig_0_27z = _00_ ^ celloutsig_0_2z;
  assign celloutsig_0_15z = ~(celloutsig_0_11z[2] ^ celloutsig_0_2z);
  assign celloutsig_0_30z = ~(celloutsig_0_18z[11] ^ celloutsig_0_0z[0]);
  assign celloutsig_0_31z = ~(celloutsig_0_28z[5] ^ celloutsig_0_13z);
  assign celloutsig_0_41z = celloutsig_0_25z[10:6] + celloutsig_0_20z[4:0];
  assign celloutsig_0_50z = { celloutsig_0_16z[14:8], celloutsig_0_0z, celloutsig_0_24z, celloutsig_0_20z } + { celloutsig_0_49z[10:0], celloutsig_0_44z, celloutsig_0_3z, celloutsig_0_41z, celloutsig_0_2z };
  assign celloutsig_0_54z = { celloutsig_0_18z[10:8], _02_, _03_[8:7], celloutsig_0_46z, celloutsig_0_51z } + celloutsig_0_34z[13:1];
  assign celloutsig_0_8z = { in_data[76:74], _00_, _04_[5:1], celloutsig_0_7z } + { in_data[44:41], celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_0_23z = { celloutsig_0_12z[3:0], celloutsig_0_3z, celloutsig_0_11z, 1'h1, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_20z, celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_13z, celloutsig_0_1z } + { celloutsig_0_8z[5:2], celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_20z, celloutsig_0_2z, celloutsig_0_11z };
  assign celloutsig_0_26z = { celloutsig_0_10z[14:5], celloutsig_0_0z } + { celloutsig_0_10z[14:12], celloutsig_0_24z, celloutsig_0_13z, celloutsig_0_19z, celloutsig_0_20z, celloutsig_0_6z };
  assign celloutsig_0_28z = celloutsig_0_23z[45:32] + { celloutsig_0_23z[14:3], celloutsig_0_3z, celloutsig_0_24z };
  reg [22:0] _20_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _20_ <= 23'h000000;
    else _20_ <= { celloutsig_0_23z[40:20], celloutsig_0_2z, celloutsig_0_19z };
  assign { _05_[22:21], _01_, _05_[19:0] } = _20_;
  reg [5:0] _21_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _21_ <= 6'h00;
    else _21_ <= { in_data[90:88], celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_4z };
  assign { _00_, _04_[5:1] } = _21_;
  reg [2:0] _22_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _22_ <= 3'h0;
    else _22_ <= celloutsig_0_9z[2:0];
  assign { _02_, _03_[8:7] } = _22_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _06_ <= 7'h00;
    else _06_ <= { celloutsig_0_11z[10:5], celloutsig_0_1z };
  assign celloutsig_1_7z = { in_data[191:182], celloutsig_1_5z, celloutsig_1_6z } / { 1'h1, celloutsig_1_1z[6:2], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_1_14z = { celloutsig_1_10z[29:26], celloutsig_1_11z, celloutsig_1_0z, celloutsig_1_11z } / { 1'h1, celloutsig_1_11z, celloutsig_1_5z, celloutsig_1_0z };
  assign celloutsig_0_68z = celloutsig_0_18z[6:2] / { 1'h1, celloutsig_0_21z, celloutsig_0_66z, celloutsig_0_24z, celloutsig_0_38z };
  assign celloutsig_1_4z = { celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_2z } / { 1'h1, in_data[113:108], celloutsig_1_3z, celloutsig_1_3z, in_data[96] };
  assign celloutsig_0_20z = celloutsig_0_10z[14:9] / { 1'h1, in_data[49:45] };
  assign celloutsig_0_36z = 1'h1 || { celloutsig_0_32z[7:2], celloutsig_0_19z, celloutsig_0_3z };
  assign celloutsig_0_7z = { in_data[92:89], celloutsig_0_2z } || { _00_, _04_[5:2] };
  assign celloutsig_0_83z = { celloutsig_0_62z[5:3], celloutsig_0_57z } || celloutsig_0_69z[7:4];
  assign celloutsig_1_0z = in_data[141:132] || in_data[125:116];
  assign celloutsig_1_6z = celloutsig_1_4z[5:1] || celloutsig_1_1z[6:2];
  assign celloutsig_0_19z = celloutsig_0_8z[3:1] || { _02_, _03_[8:7] };
  assign celloutsig_0_33z = { celloutsig_0_9z[3:0], celloutsig_0_19z, celloutsig_0_0z } % { 1'h1, celloutsig_0_8z[8:0] };
  assign celloutsig_1_18z = in_data[165:159] % { 1'h1, celloutsig_1_14z[5:1], celloutsig_1_6z };
  assign celloutsig_0_49z = { celloutsig_0_33z[9:1], celloutsig_0_9z } % { 1'h1, celloutsig_0_16z[13:2], 1'h1, celloutsig_0_29z };
  assign celloutsig_1_5z = { celloutsig_1_1z[5:3], celloutsig_1_0z } % { 1'h1, celloutsig_1_1z[4:2] };
  assign celloutsig_0_9z = { celloutsig_0_6z[2:1], celloutsig_0_6z, celloutsig_0_2z } % { 1'h1, in_data[52:48] };
  assign celloutsig_1_12z = { celloutsig_1_4z[8:7], celloutsig_1_6z } % { 1'h1, celloutsig_1_5z[0], celloutsig_1_0z };
  assign celloutsig_0_11z = celloutsig_0_10z[18] ? { _04_[5:4], _00_, _04_[5:1], _00_, _04_[5:1], celloutsig_0_2z, celloutsig_0_1z } : { celloutsig_0_6z, celloutsig_0_2z, _00_, _04_[5:1], celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_82z = { celloutsig_0_60z[11:4], celloutsig_0_67z } != _05_[9:1];
  assign celloutsig_1_11z = { celloutsig_1_4z[7:5], celloutsig_1_0z } != celloutsig_1_1z[3:0];
  assign celloutsig_0_3z = & { celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_4z = & { celloutsig_0_2z, in_data[9:6], celloutsig_0_0z };
  assign celloutsig_0_57z = & celloutsig_0_54z[11:3];
  assign celloutsig_0_51z = | celloutsig_0_26z[9:4];
  assign celloutsig_0_21z = | { celloutsig_0_20z[5:3], celloutsig_0_3z };
  assign celloutsig_0_2z = | in_data[39:33];
  assign celloutsig_0_66z = ~^ { celloutsig_0_4z, celloutsig_0_36z, celloutsig_0_18z, celloutsig_0_24z };
  assign celloutsig_0_29z = ~^ _06_[4:1];
  assign celloutsig_0_44z = ^ { celloutsig_0_11z[7:2], celloutsig_0_4z };
  assign celloutsig_0_64z = ^ celloutsig_0_49z[10:3];
  assign celloutsig_0_67z = ^ { celloutsig_0_24z, celloutsig_0_36z, celloutsig_0_20z };
  assign celloutsig_1_2z = ^ { in_data[123:121], celloutsig_1_0z };
  assign celloutsig_1_8z = ^ { celloutsig_1_1z[7:2], celloutsig_1_6z };
  assign celloutsig_0_13z = ^ { in_data[76:73], celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_7z };
  assign celloutsig_0_0z = in_data[4:0] >> in_data[5:1];
  assign celloutsig_0_40z = { celloutsig_0_36z, celloutsig_0_31z, celloutsig_0_2z, _02_, _03_[8:7], celloutsig_0_18z } >> { celloutsig_0_16z[10:6], celloutsig_0_38z, celloutsig_0_30z, celloutsig_0_0z, celloutsig_0_32z };
  assign celloutsig_0_46z = { _00_, _04_[5:1] } >> celloutsig_0_20z;
  assign celloutsig_0_56z = { celloutsig_0_21z, celloutsig_0_24z, celloutsig_0_16z } >> celloutsig_0_40z[19:3];
  assign celloutsig_0_60z = { celloutsig_0_10z[27:1], celloutsig_0_31z, celloutsig_0_0z } >> { celloutsig_0_56z[16:5], celloutsig_0_49z, celloutsig_0_1z, _02_, _03_[8:7], celloutsig_0_3z, celloutsig_0_29z };
  assign celloutsig_0_62z = { celloutsig_0_54z[7:0], celloutsig_0_36z } >> { celloutsig_0_60z[20:13], celloutsig_0_13z };
  assign celloutsig_0_69z = { celloutsig_0_50z[2:1], celloutsig_0_64z, celloutsig_0_68z, celloutsig_0_46z } >> { celloutsig_0_60z[15:10], celloutsig_0_32z };
  assign celloutsig_0_16z = { in_data[67:65], celloutsig_0_2z, _02_, _03_[8:7], celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_7z } >> { celloutsig_0_8z[6:4], celloutsig_0_2z, _00_, _04_[5:1], celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_0_25z = { _06_[6:2], _00_, _04_[5:1], 1'h1 } >> { celloutsig_0_10z[1:0], celloutsig_0_0z, celloutsig_0_6z, 2'h3 };
  assign celloutsig_0_6z = { _04_[2], celloutsig_0_3z, celloutsig_0_3z } << { celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_0_10z = { celloutsig_0_8z[8:4], celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_1z, _00_, _04_[5:1], celloutsig_0_1z, celloutsig_0_0z } << { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_3z };
  assign celloutsig_1_19z = { celloutsig_1_4z[1:0], celloutsig_1_3z } << celloutsig_1_12z;
  assign celloutsig_0_32z = { celloutsig_0_26z[7:4], celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_15z, celloutsig_0_7z } << { celloutsig_0_16z[4], celloutsig_0_29z, 1'h1, celloutsig_0_29z, _02_, _03_[8:7], celloutsig_0_1z };
  assign celloutsig_1_1z = { in_data[147:144], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } ~^ in_data[172:165];
  assign celloutsig_1_10z = { celloutsig_1_4z[7:0], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_6z } ~^ { celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_7z };
  assign celloutsig_0_18z = celloutsig_0_11z[13:0] ~^ { celloutsig_0_16z[12:0], celloutsig_0_13z };
  assign celloutsig_0_34z = { in_data[81:70], celloutsig_0_15z, celloutsig_0_31z, celloutsig_0_13z } ^ { celloutsig_0_20z, celloutsig_0_27z, celloutsig_0_20z, celloutsig_0_1z, celloutsig_0_19z };
  assign celloutsig_0_12z = { celloutsig_0_8z[2:0], celloutsig_0_3z, celloutsig_0_3z } ^ _04_[5:1];
  assign celloutsig_0_38z = ~((celloutsig_0_34z[7] & celloutsig_0_27z) | celloutsig_0_25z[4]);
  assign celloutsig_0_1z = ~((in_data[41] & in_data[3]) | in_data[61]);
  assign { _03_[12:9], _03_[6:0] } = { celloutsig_0_18z[10:8], _02_, celloutsig_0_46z, celloutsig_0_51z };
  assign { _04_[9:6], _04_[0] } = { in_data[76:74], _00_, celloutsig_0_7z };
  assign _05_[20] = _01_;
  assign { out_data[134:128], out_data[98:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_82z, celloutsig_0_83z };
endmodule
