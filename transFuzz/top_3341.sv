/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [2:0] _01_;
  wire [21:0] _02_;
  wire [15:0] _03_;
  wire [2:0] celloutsig_0_0z;
  wire [11:0] celloutsig_0_10z;
  wire [4:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [12:0] celloutsig_0_15z;
  wire [4:0] celloutsig_0_16z;
  wire [29:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [28:0] celloutsig_0_19z;
  wire [7:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [8:0] celloutsig_0_28z;
  wire [2:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [3:0] celloutsig_0_31z;
  wire [2:0] celloutsig_0_32z;
  wire [12:0] celloutsig_0_33z;
  wire [2:0] celloutsig_0_34z;
  wire [12:0] celloutsig_0_35z;
  wire [19:0] celloutsig_0_36z;
  wire [6:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [18:0] celloutsig_0_39z;
  wire [3:0] celloutsig_0_40z;
  wire [7:0] celloutsig_0_41z;
  wire [15:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire [18:0] celloutsig_0_46z;
  wire celloutsig_0_49z;
  wire [14:0] celloutsig_0_4z;
  wire [7:0] celloutsig_0_51z;
  wire [9:0] celloutsig_0_53z;
  wire [7:0] celloutsig_0_54z;
  wire [2:0] celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire celloutsig_0_57z;
  wire [2:0] celloutsig_0_58z;
  wire [6:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_62z;
  wire celloutsig_0_63z;
  wire [3:0] celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire [7:0] celloutsig_0_66z;
  wire celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_71z;
  wire [5:0] celloutsig_0_73z;
  wire [3:0] celloutsig_0_74z;
  wire [2:0] celloutsig_0_75z;
  wire [13:0] celloutsig_0_77z;
  wire [3:0] celloutsig_0_79z;
  wire celloutsig_0_7z;
  wire celloutsig_0_82z;
  wire celloutsig_0_85z;
  wire [9:0] celloutsig_0_86z;
  wire [2:0] celloutsig_0_8z;
  wire [7:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [15:0] celloutsig_1_13z;
  wire [2:0] celloutsig_1_14z;
  wire [4:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  reg [4:0] celloutsig_1_18z;
  wire [8:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  reg [2:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [2:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [2:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [27:0] _04_;
  always_latch
    if (celloutsig_1_18z[0]) _04_ = 28'h0000000;
    else if (!clkin_data[96]) _04_ = { in_data[59:47], celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_10z };
  assign { celloutsig_0_19z[28:13], celloutsig_0_19z[11:0] } = _04_;
  assign celloutsig_0_45z = celloutsig_0_21z ? celloutsig_0_41z[7] : celloutsig_0_42z[5];
  assign celloutsig_0_5z = celloutsig_0_2z ? celloutsig_0_0z[2] : celloutsig_0_1z[1];
  assign celloutsig_1_5z = celloutsig_1_2z ? celloutsig_1_2z : celloutsig_1_0z;
  assign celloutsig_1_9z = celloutsig_1_2z ? celloutsig_1_3z : in_data[137];
  assign celloutsig_0_25z = _00_ ? celloutsig_0_18z : celloutsig_0_20z;
  assign celloutsig_0_7z = ~(in_data[76] & celloutsig_0_1z[1]);
  assign celloutsig_0_82z = ~(celloutsig_0_32z[2] & celloutsig_0_73z[0]);
  assign celloutsig_1_17z = ~(celloutsig_1_12z & celloutsig_1_0z);
  assign celloutsig_0_57z = celloutsig_0_35z[7] ^ celloutsig_0_40z[2];
  assign celloutsig_0_62z = celloutsig_0_43z ^ celloutsig_0_53z[5];
  assign celloutsig_0_63z = celloutsig_0_30z ^ celloutsig_0_57z;
  assign celloutsig_0_6z = celloutsig_0_4z[9] ^ celloutsig_0_4z[3];
  assign celloutsig_1_7z = in_data[161] ^ celloutsig_1_6z[1];
  assign celloutsig_1_11z = in_data[110] ^ celloutsig_1_4z[1];
  assign celloutsig_0_41z = { celloutsig_0_28z[5:0], celloutsig_0_20z, celloutsig_0_23z } + { celloutsig_0_39z[16:12], celloutsig_0_32z };
  assign celloutsig_0_42z = { celloutsig_0_9z[7:4], celloutsig_0_9z, celloutsig_0_40z } + { celloutsig_0_10z[11:1], celloutsig_0_7z, celloutsig_0_32z, celloutsig_0_27z };
  assign celloutsig_0_73z = { celloutsig_0_1z[2:1], celloutsig_0_57z, celloutsig_0_63z, celloutsig_0_24z, celloutsig_0_27z } + { 1'h1, celloutsig_0_28z[5], celloutsig_0_58z, celloutsig_0_38z };
  assign celloutsig_0_8z = { _01_[2:1], celloutsig_0_6z } + in_data[77:75];
  reg [15:0] _23_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _23_ <= 16'h0000;
    else _23_ <= in_data[46:31];
  assign { _03_[15:13], _00_, _03_[11:0] } = _23_;
  reg [21:0] _24_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _24_ <= 22'h000000;
    else _24_ <= in_data[29:8];
  assign { _02_[21:12], _01_[2:1], _02_[9:0] } = _24_;
  assign celloutsig_0_65z = { celloutsig_0_64z, celloutsig_0_32z, celloutsig_0_37z } >= { celloutsig_0_15z[1:0], celloutsig_0_64z, celloutsig_0_37z, celloutsig_0_63z };
  assign celloutsig_0_71z = { celloutsig_0_46z[11:7], celloutsig_0_7z, celloutsig_0_63z, celloutsig_0_2z, celloutsig_0_65z } >= { celloutsig_0_67z, celloutsig_0_62z, celloutsig_0_24z, celloutsig_0_55z, celloutsig_0_29z };
  assign celloutsig_1_2z = in_data[171:165] >= { in_data[117:115], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_10z = { celloutsig_1_4z[1], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_0z } >= { celloutsig_1_4z[1], celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_6z };
  assign celloutsig_0_24z = { _03_[13], _00_, _03_[11:8] } >= celloutsig_0_4z[8:3];
  assign celloutsig_0_27z = { celloutsig_0_17z[7:2], celloutsig_0_6z, celloutsig_0_22z } >= { _02_[17:12], _01_[2:1] };
  assign celloutsig_0_30z = { celloutsig_0_10z[6:0], celloutsig_0_25z } >= in_data[83:76];
  assign celloutsig_0_49z = celloutsig_0_17z[22:11] > { _02_[12], _01_[2:1], _02_[9:1] };
  assign celloutsig_0_67z = { celloutsig_0_42z[13:5], celloutsig_0_51z, celloutsig_0_49z } > { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_13z, celloutsig_0_56z };
  assign celloutsig_0_85z = { celloutsig_0_77z[7:0], celloutsig_0_71z, celloutsig_0_79z } > { celloutsig_0_74z[1], celloutsig_0_38z, celloutsig_0_23z, celloutsig_0_82z, celloutsig_0_71z, celloutsig_0_51z };
  assign celloutsig_1_3z = { celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z } > in_data[153:151];
  assign celloutsig_0_18z = { celloutsig_0_16z[4:1], celloutsig_0_16z } > { 1'h0, celloutsig_0_9z };
  assign celloutsig_0_21z = { _03_[14:13], _00_, _03_[11:5] } > in_data[82:73];
  assign celloutsig_0_0z = in_data[7:5] % { 1'h1, in_data[7:6] };
  assign celloutsig_0_39z = { celloutsig_0_17z[11:4], celloutsig_0_5z, celloutsig_0_38z, celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_34z } % { 1'h1, celloutsig_0_4z[13:1], celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_4z = in_data[89:75] % { 1'h1, in_data[28:16], celloutsig_0_2z };
  assign celloutsig_0_59z = celloutsig_0_15z[6:0] % { 1'h1, celloutsig_0_36z[5], celloutsig_0_43z, celloutsig_0_22z, celloutsig_0_32z };
  assign celloutsig_0_64z = { celloutsig_0_36z[17], 1'h1, celloutsig_0_36z[15:14] } % { 1'h1, celloutsig_0_0z };
  assign celloutsig_0_74z = celloutsig_0_39z[9:6] % { 1'h1, celloutsig_0_29z };
  assign celloutsig_0_75z = { _03_[8], celloutsig_0_38z, celloutsig_0_57z } % { 1'h1, celloutsig_0_15z[6:5] };
  assign celloutsig_1_8z = { celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_7z } % { 1'h1, celloutsig_1_5z, celloutsig_1_2z };
  assign celloutsig_1_13z = { in_data[102:100], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_11z, celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_5z, celloutsig_1_10z, celloutsig_1_6z } % { 1'h1, celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_12z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_11z, celloutsig_1_9z };
  assign celloutsig_1_19z = { celloutsig_1_13z[11:5], celloutsig_1_10z, celloutsig_1_5z } % { 1'h1, celloutsig_1_13z[13:12], celloutsig_1_17z, celloutsig_1_14z, celloutsig_1_17z, celloutsig_1_0z };
  assign celloutsig_0_10z = { celloutsig_0_4z[4], celloutsig_0_9z, celloutsig_0_0z } % { 1'h1, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_12z = celloutsig_0_4z[6:2] % { 1'h1, celloutsig_0_10z[5:2] };
  assign celloutsig_0_1z = { celloutsig_0_0z[2:1], celloutsig_0_0z, celloutsig_0_0z } % { 1'h1, in_data[17:14], celloutsig_0_0z[2:1], in_data[0] };
  assign celloutsig_0_31z = celloutsig_0_28z[5:2] % { 1'h1, celloutsig_0_15z[9:7] };
  assign celloutsig_0_34z = celloutsig_0_10z[8:6] * { 1'h1, celloutsig_0_28z[5], celloutsig_0_23z };
  assign celloutsig_0_46z = { celloutsig_0_40z[1], celloutsig_0_31z, celloutsig_0_21z, celloutsig_0_43z, celloutsig_0_43z, celloutsig_0_5z, celloutsig_0_16z, celloutsig_0_31z, celloutsig_0_7z } * { celloutsig_0_33z[6:4], celloutsig_0_16z, celloutsig_0_29z, celloutsig_0_32z, 1'h0, celloutsig_0_40z };
  assign celloutsig_0_51z = { celloutsig_0_28z[7], 1'h1, celloutsig_0_28z[5:3], celloutsig_0_29z } * { celloutsig_0_20z, celloutsig_0_31z, celloutsig_0_32z };
  assign celloutsig_0_29z = { celloutsig_0_17z[23], celloutsig_0_2z, celloutsig_0_2z } * { _03_[14:13], _00_ };
  assign celloutsig_0_35z = ~ { in_data[24:13], celloutsig_0_21z };
  assign celloutsig_0_53z = ~ celloutsig_0_4z[11:2];
  assign celloutsig_0_55z = ~ in_data[85:83];
  assign celloutsig_0_79z = ~ { in_data[13:12], celloutsig_0_26z, celloutsig_0_25z };
  assign celloutsig_0_38z = ^ { 1'h0, celloutsig_0_19z[11:9] };
  assign celloutsig_0_43z = ^ { _03_[5:3], celloutsig_0_7z };
  assign celloutsig_0_56z = ^ { celloutsig_0_42z[14:3], celloutsig_0_23z, celloutsig_0_18z, celloutsig_0_20z };
  assign celloutsig_1_0z = ^ in_data[155:151];
  assign celloutsig_1_1z = ^ in_data[142:136];
  assign celloutsig_1_12z = ^ { celloutsig_1_8z[2], celloutsig_1_2z, celloutsig_1_6z };
  assign celloutsig_0_13z = ^ { celloutsig_0_9z[3], celloutsig_0_0z };
  assign celloutsig_0_20z = ^ { _02_[12], _01_[2:1], _02_[9:3] };
  assign celloutsig_0_2z = ^ { in_data[27:26], celloutsig_0_0z };
  assign celloutsig_0_22z = ^ { celloutsig_0_16z, celloutsig_0_18z };
  assign celloutsig_0_23z = ^ { in_data[45:28], celloutsig_0_8z };
  assign celloutsig_0_26z = ^ { celloutsig_0_19z[13], 1'h0, celloutsig_0_19z[11:7] };
  assign celloutsig_0_54z = celloutsig_0_4z[9:2] << celloutsig_0_51z;
  assign celloutsig_0_66z = { celloutsig_0_19z[24:18], celloutsig_0_65z } << celloutsig_0_42z[9:2];
  assign celloutsig_0_77z = { celloutsig_0_31z[1:0], celloutsig_0_59z, celloutsig_0_49z, celloutsig_0_74z } << { celloutsig_0_75z, celloutsig_0_66z, celloutsig_0_45z, celloutsig_0_63z, celloutsig_0_25z };
  assign celloutsig_0_86z = { celloutsig_0_40z[2:1], celloutsig_0_9z } << celloutsig_0_35z[10:1];
  assign celloutsig_1_14z = celloutsig_1_4z << { celloutsig_1_1z, celloutsig_1_12z, celloutsig_1_12z };
  assign celloutsig_0_15z = { celloutsig_0_4z[14:5], celloutsig_0_0z } << { in_data[29:23], celloutsig_0_2z, celloutsig_0_12z };
  assign celloutsig_0_32z = { celloutsig_0_7z, celloutsig_0_25z, celloutsig_0_20z } << celloutsig_0_8z;
  assign celloutsig_0_33z = { celloutsig_0_20z, celloutsig_0_29z, celloutsig_0_5z, celloutsig_0_32z, celloutsig_0_0z, celloutsig_0_27z, celloutsig_0_22z } <<< { in_data[69:61], celloutsig_0_32z, celloutsig_0_23z };
  assign celloutsig_0_58z = celloutsig_0_54z[2:0] <<< celloutsig_0_29z;
  assign celloutsig_1_6z = { in_data[172:171], celloutsig_1_0z } <<< { celloutsig_1_4z[1:0], celloutsig_1_1z };
  assign celloutsig_0_16z = celloutsig_0_4z[7:3] <<< { celloutsig_0_15z[12], celloutsig_0_5z, celloutsig_0_8z };
  assign celloutsig_0_17z = { in_data[20:7], celloutsig_0_2z, celloutsig_0_4z } <<< { celloutsig_0_1z[6:0], celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_37z = { _03_[6:1], celloutsig_0_23z } ^ { celloutsig_0_7z, celloutsig_0_34z, celloutsig_0_32z };
  assign celloutsig_0_40z = { celloutsig_0_31z[2:0], celloutsig_0_24z } ^ { celloutsig_0_18z, celloutsig_0_27z, celloutsig_0_7z, celloutsig_0_22z };
  assign celloutsig_0_9z = _02_[8:1] ^ celloutsig_0_4z[8:1];
  assign celloutsig_1_16z = { celloutsig_1_6z[0], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_11z, celloutsig_1_3z } ^ { celloutsig_1_4z[1:0], celloutsig_1_8z };
  always_latch
    if (clkin_data[32]) celloutsig_1_4z = 3'h0;
    else if (!clkin_data[160]) celloutsig_1_4z = { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z };
  always_latch
    if (clkin_data[64]) celloutsig_1_18z = 5'h00;
    else if (clkin_data[128]) celloutsig_1_18z = celloutsig_1_16z;
  assign { celloutsig_0_28z[5], celloutsig_0_28z[8:7], celloutsig_0_28z[4], celloutsig_0_28z[0], celloutsig_0_28z[3:1] } = ~ { celloutsig_0_18z, celloutsig_0_8z[1:0], celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_0z };
  assign { celloutsig_0_36z[0], celloutsig_0_36z[15], celloutsig_0_36z[1], celloutsig_0_36z[14:2], celloutsig_0_36z[19:17] } = ~ { celloutsig_0_30z, celloutsig_0_27z, celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_10z[8:6] };
  assign _01_[0] = celloutsig_0_6z;
  assign _02_[11:10] = _01_[2:1];
  assign _03_[12] = _00_;
  assign celloutsig_0_19z[12] = 1'h0;
  assign celloutsig_0_28z[6] = 1'h1;
  assign celloutsig_0_36z[16] = 1'h1;
  assign { out_data[132:128], out_data[104:96], out_data[32], out_data[9:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_85z, celloutsig_0_86z };
endmodule
