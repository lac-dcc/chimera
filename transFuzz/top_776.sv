/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [31:0] _01_;
  wire [31:0] _02_;
  wire [27:0] _03_;
  wire [9:0] _04_;
  wire celloutsig_0_0z;
  wire [25:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [8:0] celloutsig_0_14z;
  wire [4:0] celloutsig_0_15z;
  reg [8:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [3:0] celloutsig_0_19z;
  wire celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [10:0] celloutsig_0_27z;
  wire [9:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [2:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  reg [6:0] celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_53z;
  wire [4:0] celloutsig_0_55z;
  wire celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire [4:0] celloutsig_0_5z;
  wire [9:0] celloutsig_0_60z;
  wire celloutsig_0_61z;
  wire celloutsig_0_63z;
  wire celloutsig_0_64z;
  wire celloutsig_0_66z;
  wire [10:0] celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[81] ? in_data[61] : in_data[78];
  assign celloutsig_0_33z = celloutsig_0_9z ? celloutsig_0_23z : celloutsig_0_6z;
  assign celloutsig_0_24z = celloutsig_0_18z ? celloutsig_0_15z[3] : celloutsig_0_15z[1];
  assign celloutsig_0_57z = ~(_00_ | celloutsig_0_12z);
  assign celloutsig_1_18z = ~(celloutsig_1_9z | in_data[107]);
  assign celloutsig_0_23z = ~(celloutsig_0_19z[1] | celloutsig_0_10z[22]);
  assign celloutsig_0_58z = ~celloutsig_0_48z;
  assign celloutsig_1_9z = ~celloutsig_1_7z;
  assign celloutsig_0_37z = ~((celloutsig_0_23z | celloutsig_0_23z) & (celloutsig_0_8z | celloutsig_0_0z));
  assign celloutsig_0_39z = ~((celloutsig_0_6z | celloutsig_0_20z) & (celloutsig_0_12z | celloutsig_0_0z));
  assign celloutsig_1_8z = ~((celloutsig_1_2z | celloutsig_1_3z) & (celloutsig_1_0z | celloutsig_1_1z[0]));
  assign celloutsig_0_18z = ~((celloutsig_0_13z | celloutsig_0_3z) & (celloutsig_0_9z | celloutsig_0_2z));
  assign celloutsig_0_35z = celloutsig_0_14z[2] | ~(celloutsig_0_30z);
  assign celloutsig_0_51z = celloutsig_0_37z | ~(celloutsig_0_17z);
  assign celloutsig_0_61z = celloutsig_0_41z[0] | ~(celloutsig_0_60z[3]);
  assign celloutsig_1_7z = celloutsig_1_2z | ~(celloutsig_1_2z);
  assign celloutsig_0_26z = celloutsig_0_10z[23] | ~(celloutsig_0_22z);
  assign celloutsig_0_29z = celloutsig_0_24z | ~(celloutsig_0_6z);
  assign celloutsig_0_50z = celloutsig_0_43z | celloutsig_0_29z;
  assign celloutsig_0_6z = celloutsig_0_5z[0] | in_data[23];
  assign celloutsig_1_2z = in_data[104] | celloutsig_1_1z[0];
  assign celloutsig_1_19z = celloutsig_1_8z | celloutsig_1_9z;
  assign celloutsig_0_63z = celloutsig_0_58z ^ celloutsig_0_45z;
  assign celloutsig_0_66z = celloutsig_0_64z ^ celloutsig_0_61z;
  assign celloutsig_0_9z = in_data[95] ^ celloutsig_0_0z;
  assign celloutsig_0_40z = ~(celloutsig_0_15z[0] ^ celloutsig_0_19z[3]);
  assign celloutsig_0_48z = ~(celloutsig_0_37z ^ celloutsig_0_2z);
  assign celloutsig_0_2z = ~(in_data[79] ^ in_data[37]);
  assign celloutsig_0_5z = in_data[89:85] + { celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_60z = { celloutsig_0_53z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_57z, celloutsig_0_45z, celloutsig_0_15z } + { celloutsig_0_14z[7], celloutsig_0_36z, celloutsig_0_24z, celloutsig_0_57z, celloutsig_0_24z, celloutsig_0_23z, celloutsig_0_33z, celloutsig_0_20z, celloutsig_0_18z, celloutsig_0_24z };
  assign celloutsig_0_10z = { in_data[66:42], celloutsig_0_3z } + { in_data[39:18], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_6z };
  reg [27:0] _36_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _36_ <= 28'h0000000;
    else _36_ <= { in_data[18:8], celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z };
  assign { _03_[27:26], _02_[31:30], _01_[31:8] } = _36_;
  reg [9:0] _37_;
  always_ff @(negedge clkin_data[32], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _37_ <= 10'h000;
    else _37_ <= { celloutsig_0_14z[6], celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_20z, celloutsig_0_15z, celloutsig_0_20z };
  assign { _04_[9:5], _00_, _04_[3:0] } = _37_;
  assign celloutsig_0_32z = celloutsig_0_10z[23:4] >= { _01_[26:16], celloutsig_0_17z, celloutsig_0_2z, celloutsig_0_19z, celloutsig_0_26z, celloutsig_0_11z, celloutsig_0_8z };
  assign celloutsig_0_47z = { celloutsig_0_5z[1], celloutsig_0_19z } >= { celloutsig_0_11z, celloutsig_0_39z, celloutsig_0_35z, celloutsig_0_8z, celloutsig_0_25z };
  assign celloutsig_0_22z = celloutsig_0_10z[18:9] >= { celloutsig_0_14z[8:1], celloutsig_0_18z, celloutsig_0_17z };
  assign celloutsig_0_36z = { celloutsig_0_16z[8:2], celloutsig_0_0z } <= _01_[26:19];
  assign celloutsig_0_53z = { celloutsig_0_33z, celloutsig_0_51z, celloutsig_0_32z, celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_0z } <= celloutsig_0_14z[5:0];
  assign celloutsig_0_13z = { _01_[30:20], celloutsig_0_4z, celloutsig_0_2z } <= in_data[40:28];
  assign celloutsig_0_30z = { in_data[42:30], celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_29z } || { celloutsig_0_5z[3:0], celloutsig_0_0z, celloutsig_0_27z };
  assign celloutsig_0_4z = { in_data[78:65], celloutsig_0_0z } || in_data[77:63];
  assign celloutsig_0_64z = celloutsig_0_28z[9:1] || { celloutsig_0_40z, celloutsig_0_41z, celloutsig_0_50z };
  assign celloutsig_0_20z = { celloutsig_0_16z[4:0], celloutsig_0_17z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_17z, celloutsig_0_4z, celloutsig_0_4z } || { in_data[54:50], celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_19z };
  assign celloutsig_0_25z = { celloutsig_0_5z[4:3], celloutsig_0_14z } || { _02_[30], _01_[31:29], celloutsig_0_17z, celloutsig_0_5z, celloutsig_0_11z };
  assign celloutsig_0_34z = _04_[8:6] % { 1'h1, in_data[50:49] };
  assign celloutsig_0_3z = { in_data[54:46], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z } != in_data[88:77];
  assign celloutsig_0_43z = { celloutsig_0_28z[3:0], celloutsig_0_11z } != { celloutsig_0_14z[7:4], celloutsig_0_12z };
  assign celloutsig_0_44z = { in_data[69:66], celloutsig_0_36z, celloutsig_0_32z, celloutsig_0_30z } != { celloutsig_0_15z[2:0], celloutsig_0_34z, celloutsig_0_0z };
  assign celloutsig_1_3z = { in_data[145], celloutsig_1_1z } != { celloutsig_1_1z[3:2], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_0_8z = { in_data[79:59], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_5z } != { _03_[27:26], _02_[31:30], _01_[31:8], celloutsig_0_0z };
  assign celloutsig_0_11z = { celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } != { celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_8z };
  assign celloutsig_0_12z = _01_[28:25] != { celloutsig_0_5z[1:0], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_17z = & { celloutsig_0_15z[1:0], celloutsig_0_9z, celloutsig_0_6z };
  assign celloutsig_0_45z = ^ { _04_[7:5], _00_, _04_[3:2], celloutsig_0_0z };
  assign celloutsig_1_0z = ^ in_data[159:144];
  assign celloutsig_0_55z = { celloutsig_0_15z[2:0], celloutsig_0_20z, celloutsig_0_47z } >> celloutsig_0_5z;
  assign celloutsig_0_14z = { celloutsig_0_10z[19:17], celloutsig_0_0z, celloutsig_0_5z } >> { celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_9z };
  assign celloutsig_0_67z = { celloutsig_0_60z[7], celloutsig_0_2z, celloutsig_0_33z, celloutsig_0_32z, celloutsig_0_44z, celloutsig_0_66z, celloutsig_0_44z, celloutsig_0_25z, celloutsig_0_35z, celloutsig_0_53z, celloutsig_0_18z } << { celloutsig_0_63z, celloutsig_0_55z, celloutsig_0_32z, celloutsig_0_6z, celloutsig_0_33z, celloutsig_0_33z, celloutsig_0_6z };
  assign celloutsig_0_27z = { celloutsig_0_5z[4:1], celloutsig_0_23z, celloutsig_0_19z, celloutsig_0_24z, celloutsig_0_18z } << { _04_[5], celloutsig_0_22z, celloutsig_0_16z };
  assign celloutsig_1_1z = { in_data[128], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } <<< in_data[147:144];
  assign celloutsig_0_15z = celloutsig_0_10z[5:1] <<< in_data[73:69];
  assign celloutsig_0_19z = celloutsig_0_5z[3:0] <<< _01_[21:18];
  assign celloutsig_0_28z = { celloutsig_0_10z[25:18], celloutsig_0_26z, celloutsig_0_4z } ^ celloutsig_0_27z[10:1];
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_41z = 7'h00;
    else if (!clkin_data[96]) celloutsig_0_41z = { celloutsig_0_32z, celloutsig_0_24z, celloutsig_0_37z, celloutsig_0_35z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_36z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_16z = 9'h000;
    else if (!clkin_data[128]) celloutsig_0_16z = { celloutsig_0_10z[17:10], celloutsig_0_0z };
  assign _01_[7:0] = { celloutsig_0_41z, celloutsig_0_22z };
  assign { _02_[29:6], _02_[4:0] } = { _01_[31:8], celloutsig_0_9z, celloutsig_0_25z, celloutsig_0_23z, celloutsig_0_6z, celloutsig_0_36z };
  assign _03_[25:0] = { _02_[31:30], _01_[31:8] };
  assign _04_[4] = _00_;
  assign { out_data[128], out_data[96], out_data[32], out_data[10:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_66z, celloutsig_0_67z };
endmodule
