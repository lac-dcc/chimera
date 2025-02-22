/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [9:0] _01_;
  reg [9:0] _02_;
  wire [8:0] _03_;
  wire celloutsig_0_0z;
  wire [3:0] celloutsig_0_11z;
  wire [4:0] celloutsig_0_13z;
  wire [8:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [3:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [2:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [29:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [2:0] celloutsig_0_45z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire [3:0] celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire [2:0] celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [7:0] celloutsig_0_61z;
  wire celloutsig_0_6z;
  wire [2:0] celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_14z;
  wire [7:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [15:0] celloutsig_1_5z;
  wire [15:0] celloutsig_1_8z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_18z = celloutsig_0_9z ? celloutsig_0_5z[0] : celloutsig_0_1z;
  assign celloutsig_0_19z = ~(celloutsig_0_4z[3] & celloutsig_0_3z);
  assign celloutsig_0_36z = !(celloutsig_0_24z[0] ? celloutsig_0_17z : _00_);
  assign celloutsig_0_40z = !(celloutsig_0_3z ? celloutsig_0_32z : celloutsig_0_16z[1]);
  assign celloutsig_0_42z = !(celloutsig_0_0z ? celloutsig_0_40z : celloutsig_0_15z);
  assign celloutsig_1_14z = !(celloutsig_1_10z ? celloutsig_1_10z : celloutsig_1_8z[11]);
  assign celloutsig_0_35z = ~(celloutsig_0_19z | celloutsig_0_17z);
  assign celloutsig_0_15z = ~(celloutsig_0_9z | celloutsig_0_6z);
  assign celloutsig_0_31z = ~((celloutsig_0_26z | celloutsig_0_13z[2]) & (celloutsig_0_13z[2] | celloutsig_0_23z));
  assign celloutsig_0_2z = ~((celloutsig_0_0z | celloutsig_0_0z) & (in_data[13] | celloutsig_0_0z));
  assign celloutsig_0_37z = ~((celloutsig_0_33z[21] | celloutsig_0_8z[2]) & (celloutsig_0_33z[17] | celloutsig_0_13z[2]));
  assign celloutsig_0_1z = ~((in_data[79] | in_data[66]) & (celloutsig_0_0z | celloutsig_0_0z));
  assign celloutsig_0_32z = celloutsig_0_21z | celloutsig_0_24z[3];
  assign celloutsig_0_9z = celloutsig_0_8z[1] | celloutsig_0_1z;
  assign celloutsig_0_25z = celloutsig_0_3z | celloutsig_0_18z;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[0])
    if (!clkin_data[0]) _02_ <= 10'h000;
    else _02_ <= { in_data[69:68], celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_6z };
  reg [8:0] _20_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[32])
    if (clkin_data[32]) _20_ <= 9'h000;
    else _20_ <= { celloutsig_0_5z[2:1], celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_7z };
  assign { _03_[8:7], _01_[9:7], _00_, _01_[5:3] } = _20_;
  assign celloutsig_0_5z = { celloutsig_0_4z[1:0], celloutsig_0_1z } / { 1'h1, celloutsig_0_4z[2:1] };
  assign celloutsig_0_3z = { in_data[15], celloutsig_0_0z } === in_data[21:20];
  assign celloutsig_0_26z = { celloutsig_0_14z[2:1], celloutsig_0_24z, celloutsig_0_24z, celloutsig_0_7z, celloutsig_0_21z, celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_25z } === { celloutsig_0_13z[4:1], celloutsig_0_16z, _02_ };
  assign celloutsig_0_41z = { _02_[3:1], celloutsig_0_15z, celloutsig_0_1z, celloutsig_0_26z, celloutsig_0_24z, celloutsig_0_27z } >= { celloutsig_0_24z[3:1], celloutsig_0_20z, celloutsig_0_6z, celloutsig_0_26z, celloutsig_0_35z, celloutsig_0_24z };
  assign celloutsig_1_0z = in_data[186:179] >= in_data[125:118];
  assign celloutsig_0_38z = { celloutsig_0_1z, celloutsig_0_36z, celloutsig_0_15z } > { celloutsig_0_29z[1:0], celloutsig_0_28z };
  assign celloutsig_0_60z = { _01_[4:3], celloutsig_0_34z, celloutsig_0_16z, celloutsig_0_37z, celloutsig_0_36z, celloutsig_0_7z } > { _02_, celloutsig_0_38z };
  assign celloutsig_0_6z = { celloutsig_0_0z, celloutsig_0_4z } || in_data[15:11];
  assign celloutsig_0_22z = { celloutsig_0_5z[1:0], celloutsig_0_7z, celloutsig_0_4z } || { celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_21z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_17z };
  assign celloutsig_0_34z = { in_data[45:41], celloutsig_0_15z, celloutsig_0_27z, celloutsig_0_8z, celloutsig_0_22z, celloutsig_0_17z, celloutsig_0_13z, celloutsig_0_27z, celloutsig_0_30z, celloutsig_0_27z } < { in_data[62:45], celloutsig_0_31z, celloutsig_0_27z };
  assign celloutsig_0_27z = { celloutsig_0_13z[1], celloutsig_0_15z, celloutsig_0_23z, celloutsig_0_9z, celloutsig_0_22z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_11z } < { in_data[53:41], celloutsig_0_16z };
  assign celloutsig_0_11z = in_data[41:38] % { 1'h1, _02_[4:2] };
  assign celloutsig_1_2z = { celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z } * { in_data[183:182], celloutsig_1_0z };
  assign celloutsig_1_15z = { celloutsig_1_8z[11:5], celloutsig_1_14z } * { in_data[135:131], celloutsig_1_2z };
  assign celloutsig_0_14z = { in_data[77:71], celloutsig_0_9z, celloutsig_0_0z } * { _03_[7], _01_[9:7], _00_, _01_[5:4], celloutsig_0_6z, celloutsig_0_1z };
  assign celloutsig_0_30z = { _03_[8:7], _01_[9], celloutsig_0_2z, _02_, celloutsig_0_25z, celloutsig_0_17z, celloutsig_0_28z } != { celloutsig_0_8z, celloutsig_0_11z, _02_ };
  assign celloutsig_0_49z = { celloutsig_0_19z, celloutsig_0_11z } != { celloutsig_0_21z, celloutsig_0_24z };
  assign celloutsig_0_51z = { celloutsig_0_18z, celloutsig_0_41z, celloutsig_0_42z, celloutsig_0_17z, celloutsig_0_18z, celloutsig_0_7z, celloutsig_0_45z, celloutsig_0_32z, celloutsig_0_31z, celloutsig_0_4z, celloutsig_0_18z, celloutsig_0_48z } != { _01_[9:7], _00_, _01_[5:3], celloutsig_0_35z, celloutsig_0_0z, celloutsig_0_45z, celloutsig_0_6z, celloutsig_0_49z, celloutsig_0_7z, celloutsig_0_22z, celloutsig_0_37z };
  assign celloutsig_1_1z = { in_data[109:107], celloutsig_1_0z, celloutsig_1_0z } != in_data[187:183];
  assign celloutsig_1_3z = { in_data[102:101], celloutsig_1_1z, celloutsig_1_2z[2], celloutsig_1_2z[0] } != { celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_4z = { in_data[129:120], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z } != in_data[142:124];
  assign celloutsig_1_10z = celloutsig_1_8z[10:6] != in_data[127:123];
  assign celloutsig_0_23z = { celloutsig_0_14z[7:3], celloutsig_0_16z, celloutsig_0_20z, celloutsig_0_13z, celloutsig_0_13z } != { _01_[7], _00_, _01_[5:4], celloutsig_0_15z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_7z };
  assign celloutsig_0_45z = - in_data[92:90];
  assign celloutsig_1_19z = - celloutsig_1_15z[6:4];
  assign celloutsig_1_8z = { in_data[159:157], celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_2z } | { celloutsig_1_5z[11:0], celloutsig_1_4z, celloutsig_1_2z };
  assign celloutsig_0_7z = { celloutsig_0_4z[1], celloutsig_0_1z, celloutsig_0_2z } | { in_data[93:92], celloutsig_0_3z };
  assign celloutsig_0_29z = celloutsig_0_13z[3:1] | celloutsig_0_5z;
  assign celloutsig_0_17z = & { celloutsig_0_15z, celloutsig_0_13z, celloutsig_0_7z[1], celloutsig_0_5z };
  assign celloutsig_1_18z = ~^ celloutsig_1_8z[13:7];
  assign celloutsig_0_20z = ~^ { celloutsig_0_16z[1:0], celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_18z };
  assign celloutsig_0_21z = ~^ { celloutsig_0_11z[1:0], celloutsig_0_19z, celloutsig_0_2z, celloutsig_0_16z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_3z };
  assign celloutsig_0_48z = ^ { in_data[51:50], celloutsig_0_17z, celloutsig_0_11z, celloutsig_0_38z, celloutsig_0_38z };
  assign celloutsig_1_5z = { celloutsig_1_2z[2], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z } <<< { in_data[118:114], celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_8z = { celloutsig_0_5z[2:1], celloutsig_0_3z } <<< { celloutsig_0_7z[2], celloutsig_0_6z, celloutsig_0_1z };
  assign celloutsig_0_24z = { celloutsig_0_9z, celloutsig_0_8z } <<< { celloutsig_0_4z[1], celloutsig_0_23z, celloutsig_0_17z, celloutsig_0_23z };
  assign celloutsig_0_33z = { celloutsig_0_4z[3], celloutsig_0_25z, celloutsig_0_30z, _03_[8:7], _01_[9:7], _00_, _01_[5:3], celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_26z, celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_13z } - { celloutsig_0_15z, celloutsig_0_29z, celloutsig_0_4z, celloutsig_0_28z, celloutsig_0_18z, celloutsig_0_8z, celloutsig_0_31z, celloutsig_0_15z, celloutsig_0_22z, celloutsig_0_32z, celloutsig_0_29z, celloutsig_0_19z, celloutsig_0_28z, celloutsig_0_17z, celloutsig_0_23z, celloutsig_0_30z, celloutsig_0_23z, celloutsig_0_7z, celloutsig_0_22z };
  assign celloutsig_0_13z = { celloutsig_0_7z[2], celloutsig_0_8z, celloutsig_0_3z } - { celloutsig_0_5z[2:1], celloutsig_0_8z };
  assign celloutsig_0_4z = in_data[16:13] ~^ { celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_61z = { in_data[82:79], celloutsig_0_24z } ~^ { _02_[4:2], celloutsig_0_51z, celloutsig_0_49z, celloutsig_0_42z, celloutsig_0_25z, celloutsig_0_2z };
  assign celloutsig_0_16z = { _02_[7:6], celloutsig_0_0z } ~^ { celloutsig_0_13z[0], celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_0z = ~((in_data[42] & in_data[84]) | (in_data[75] & in_data[50]));
  assign celloutsig_0_28z = ~((_01_[5] & celloutsig_0_23z) | (_02_[4] & celloutsig_0_22z));
  assign { _01_[6], _01_[2:0] } = { _00_, celloutsig_0_29z };
  assign _03_[6:0] = { _01_[9:7], _00_, _01_[5:3] };
  assign { out_data[128], out_data[98:96], out_data[32], out_data[7:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_60z, celloutsig_0_61z };
endmodule
