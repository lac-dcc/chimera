/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [6:0] _00_;
  wire [11:0] _01_;
  reg [11:0] _02_;
  reg [52:0] _03_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_13z;
  wire [4:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [7:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [11:0] celloutsig_0_19z;
  wire [5:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [7:0] celloutsig_0_22z;
  wire [2:0] celloutsig_0_23z;
  wire [13:0] celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [2:0] celloutsig_0_2z;
  wire [6:0] celloutsig_0_31z;
  wire [12:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [5:0] celloutsig_0_35z;
  wire [11:0] celloutsig_0_36z;
  wire [7:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [8:0] celloutsig_0_3z;
  wire [2:0] celloutsig_0_43z;
  wire [7:0] celloutsig_0_46z;
  wire celloutsig_0_4z;
  wire celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire [4:0] celloutsig_0_57z;
  wire [5:0] celloutsig_0_5z;
  wire [6:0] celloutsig_0_68z;
  wire [4:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_85z;
  wire celloutsig_0_86z;
  wire [9:0] celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_17z;
  wire [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_2z = !(in_data[143] ? in_data[167] : celloutsig_1_1z);
  assign celloutsig_1_19z = !(celloutsig_1_11z ? celloutsig_1_3z : celloutsig_1_17z);
  assign celloutsig_1_0z = ~((in_data[160] | in_data[141]) & in_data[153]);
  assign celloutsig_0_26z = ~((celloutsig_0_17z | celloutsig_0_20z) & celloutsig_0_8z[6]);
  assign celloutsig_1_5z = celloutsig_1_2z | celloutsig_1_4z;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _00_ <= 7'h00;
    else _00_ <= celloutsig_0_3z[8:2];
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _02_ <= 12'h000;
    else _02_ <= { celloutsig_0_43z[2:1], celloutsig_0_14z, _01_[4:0] };
  always_ff @(negedge clkin_data[32], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _03_ <= 53'h00000000000000;
    else _03_ <= { celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_0z };
  reg [4:0] _12_;
  always_ff @(posedge clkin_data[32], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _12_ <= 5'h00;
    else _12_ <= celloutsig_0_5z[5:1];
  assign _01_[4:0] = _12_;
  assign celloutsig_1_6z = { in_data[170:156], celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_5z } >= { in_data[182:172], celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_29z = celloutsig_0_14z && _01_[4:0];
  assign celloutsig_0_10z = ! celloutsig_0_1z[2:0];
  assign celloutsig_0_33z = { celloutsig_0_7z, _01_[4:0] } || _03_[31:26];
  assign celloutsig_0_54z = celloutsig_0_32z[9:0] < { celloutsig_0_43z[1:0], celloutsig_0_38z };
  assign celloutsig_0_20z = { celloutsig_0_1z[5:4], celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_0z } < { _03_[38:35], celloutsig_0_18z };
  assign celloutsig_0_28z = { celloutsig_0_3z[8:4], celloutsig_0_20z, celloutsig_0_14z } < celloutsig_0_24z[10:0];
  assign celloutsig_0_31z = { _03_[14:10], celloutsig_0_15z, celloutsig_0_20z } % { 1'h1, celloutsig_0_1z };
  assign celloutsig_0_3z = in_data[26:18] % { 1'h1, celloutsig_0_1z[4:0], celloutsig_0_2z };
  assign celloutsig_0_36z = { _03_[39:35], celloutsig_0_18z, celloutsig_0_5z } % { 1'h1, celloutsig_0_8z, celloutsig_0_33z };
  assign celloutsig_0_68z = { celloutsig_0_46z[1:0], celloutsig_0_57z } % { 1'h1, celloutsig_0_20z, celloutsig_0_14z };
  assign celloutsig_0_24z = { celloutsig_0_3z[7:4], celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_7z, celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_14z } % { 1'h1, _03_[50:38] };
  assign celloutsig_0_8z = { celloutsig_0_3z[8:3], celloutsig_0_2z, celloutsig_0_7z } * { celloutsig_0_1z[2:1], celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_14z = celloutsig_0_3z[5:1] * _01_[4:0];
  assign celloutsig_0_1z = in_data[5:0] * in_data[77:72];
  assign celloutsig_0_32z = celloutsig_0_6z[1] ? { celloutsig_0_26z, celloutsig_0_26z, celloutsig_0_8z, celloutsig_0_17z } : celloutsig_0_24z[13:1];
  assign celloutsig_0_57z = celloutsig_0_36z[2] ? celloutsig_0_5z[5:1] : { celloutsig_0_32z[3:1], celloutsig_0_54z, celloutsig_0_39z };
  assign celloutsig_1_18z = celloutsig_1_5z ? in_data[136:134] : { celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_19z = celloutsig_0_7z ? { celloutsig_0_17z, celloutsig_0_3z, celloutsig_0_18z, celloutsig_0_4z } : { celloutsig_0_14z[3], _01_[4:0], celloutsig_0_5z };
  assign celloutsig_0_39z = celloutsig_0_36z[9:1] != { celloutsig_0_36z[8:6], celloutsig_0_35z };
  assign celloutsig_0_55z = celloutsig_0_32z[10:7] != { celloutsig_0_16z[2:0], celloutsig_0_33z };
  assign celloutsig_1_4z = { in_data[174:173], celloutsig_1_2z } != in_data[126:124];
  assign celloutsig_0_11z = { in_data[36:23], celloutsig_0_0z } != in_data[79:65];
  assign celloutsig_0_13z = { celloutsig_0_1z[5:4], celloutsig_0_5z, celloutsig_0_3z } != { celloutsig_0_8z[8:2], celloutsig_0_3z, celloutsig_0_4z };
  assign celloutsig_0_15z = { _03_[18:16], celloutsig_0_7z, celloutsig_0_4z } != _03_[7:3];
  assign celloutsig_0_86z = celloutsig_0_55z & celloutsig_0_29z;
  assign celloutsig_1_11z = ~^ { celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_0z };
  assign celloutsig_1_17z = ~^ in_data[135:131];
  assign celloutsig_0_18z = ~^ { celloutsig_0_5z[5:2], celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_17z };
  assign celloutsig_0_4z = ^ { in_data[23], celloutsig_0_3z };
  assign celloutsig_0_17z = ^ { _01_[3], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_13z };
  assign celloutsig_0_35z = celloutsig_0_24z[13:8] >> celloutsig_0_31z[5:0];
  assign celloutsig_0_5z = in_data[86:81] >> celloutsig_0_1z;
  assign celloutsig_0_6z = celloutsig_0_3z[6:2] >> celloutsig_0_5z[4:0];
  assign celloutsig_0_23z = { celloutsig_0_22z[7:6], celloutsig_0_7z } >> celloutsig_0_19z[6:4];
  assign celloutsig_0_2z = { celloutsig_0_1z[1:0], celloutsig_0_0z } >> { in_data[7:6], celloutsig_0_0z };
  assign celloutsig_0_43z = { _00_[3:2], celloutsig_0_15z } - { celloutsig_0_23z[2:1], celloutsig_0_7z };
  assign celloutsig_0_46z = celloutsig_0_32z[8:1] - { celloutsig_0_23z, _01_[4:0] };
  assign celloutsig_0_38z = celloutsig_0_19z[9:2] ^ { celloutsig_0_19z[11:6], celloutsig_0_28z, celloutsig_0_10z };
  assign celloutsig_0_16z = { _03_[15], _01_[4:0], celloutsig_0_7z, celloutsig_0_7z } ^ in_data[78:71];
  assign celloutsig_0_0z = ~((in_data[20] & in_data[77]) | (in_data[32] & in_data[49]));
  assign celloutsig_0_7z = ~((celloutsig_0_3z[7] & celloutsig_0_5z[5]) | (celloutsig_0_0z & in_data[23]));
  assign celloutsig_0_85z = ~((in_data[88] & _02_[3]) | (celloutsig_0_68z[3] & celloutsig_0_17z));
  assign celloutsig_1_1z = ~((in_data[164] & celloutsig_1_0z) | (in_data[155] & in_data[123]));
  assign celloutsig_1_3z = ~((celloutsig_1_1z & celloutsig_1_2z) | (celloutsig_1_1z & in_data[166]));
  assign celloutsig_0_22z[7:1] = { celloutsig_0_19z[6:1], celloutsig_0_10z } ^ celloutsig_0_3z[7:1];
  assign _01_[11:5] = { celloutsig_0_43z[2:1], celloutsig_0_14z };
  assign celloutsig_0_22z[0] = 1'h0;
  assign { out_data[130:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_85z, celloutsig_0_86z };
endmodule
