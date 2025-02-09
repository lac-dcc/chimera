/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire [3:0] _05_;
  wire [5:0] _06_;
  wire [10:0] _07_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [8:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [15:0] celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [2:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [6:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [3:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [10:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [14:0] celloutsig_0_29z;
  wire [5:0] celloutsig_0_2z;
  wire [34:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [4:0] celloutsig_0_32z;
  wire [7:0] celloutsig_0_33z;
  wire [12:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [19:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [9:0] celloutsig_0_48z;
  wire [11:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [4:0] celloutsig_0_50z;
  wire celloutsig_0_53z;
  wire [9:0] celloutsig_0_54z;
  wire [2:0] celloutsig_0_55z;
  wire [15:0] celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [9:0] celloutsig_0_62z;
  wire [26:0] celloutsig_0_65z;
  wire celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_71z;
  wire celloutsig_0_78z;
  wire [4:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_91z;
  wire [23:0] celloutsig_0_92z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [8:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_42z = ~(celloutsig_0_0z & celloutsig_0_37z);
  assign celloutsig_0_67z = ~(celloutsig_0_42z & celloutsig_0_47z);
  assign celloutsig_0_71z = ~(celloutsig_0_38z & celloutsig_0_23z[0]);
  assign celloutsig_1_10z = ~(celloutsig_1_1z & celloutsig_1_4z[3]);
  assign celloutsig_0_1z = ~(in_data[27] & in_data[89]);
  assign celloutsig_0_3z = !(celloutsig_0_2z[0] ? celloutsig_0_1z : celloutsig_0_0z);
  assign celloutsig_0_31z = !(1'h0 ? celloutsig_0_6z : celloutsig_0_10z);
  assign celloutsig_1_5z = !(celloutsig_1_2z ? celloutsig_1_3z : celloutsig_1_2z);
  assign celloutsig_0_22z = !(celloutsig_0_13z ? celloutsig_0_5z[7] : celloutsig_0_11z);
  assign celloutsig_1_1z = ~((in_data[107] | in_data[120]) & (celloutsig_1_0z | in_data[113]));
  assign celloutsig_1_7z = ~((celloutsig_1_1z | celloutsig_1_5z) & (celloutsig_1_2z | celloutsig_1_5z));
  assign celloutsig_1_11z = ~((in_data[119] | in_data[156]) & (celloutsig_1_4z[8] | in_data[109]));
  assign celloutsig_1_12z = ~((celloutsig_1_10z | celloutsig_1_4z[7]) & (celloutsig_1_0z | celloutsig_1_7z));
  assign celloutsig_0_18z = ~((celloutsig_0_4z | celloutsig_0_5z[0]) & (celloutsig_0_11z | celloutsig_0_0z));
  assign celloutsig_0_28z = ~((celloutsig_0_10z | _01_) & (celloutsig_0_7z[2] | celloutsig_0_1z));
  assign celloutsig_0_0z = in_data[87] | in_data[92];
  assign celloutsig_0_37z = celloutsig_0_27z | _02_;
  assign celloutsig_0_38z = celloutsig_0_4z | celloutsig_0_36z;
  assign celloutsig_0_4z = celloutsig_0_3z | celloutsig_0_0z;
  assign celloutsig_0_46z = celloutsig_0_22z | celloutsig_0_3z;
  assign celloutsig_0_8z = celloutsig_0_4z | celloutsig_0_6z;
  assign celloutsig_1_6z = celloutsig_1_5z | celloutsig_1_0z;
  assign celloutsig_1_18z = celloutsig_1_11z | celloutsig_1_13z;
  assign celloutsig_0_36z = _03_ ^ celloutsig_0_11z;
  assign celloutsig_0_60z = celloutsig_0_46z ^ celloutsig_0_7z[3];
  assign celloutsig_0_91z = celloutsig_0_67z ^ celloutsig_0_71z;
  assign celloutsig_1_2z = celloutsig_1_0z ^ celloutsig_1_1z;
  assign celloutsig_1_13z = in_data[177] ^ celloutsig_1_1z;
  assign celloutsig_0_11z = celloutsig_0_4z ^ celloutsig_0_3z;
  assign celloutsig_0_27z = celloutsig_0_5z[7] ^ celloutsig_0_12z[6];
  reg [3:0] _38_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _38_ <= 4'h0;
    else _38_ <= { celloutsig_0_21z[6:4], celloutsig_0_31z };
  assign { _05_[3:1], _00_ } = _38_;
  reg [5:0] _39_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _39_ <= 6'h00;
    else _39_ <= in_data[32:27];
  assign { _06_[5], _02_, _06_[3], _01_, _06_[1:0] } = _39_;
  reg [10:0] _40_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _40_ <= 11'h000;
    else _40_ <= celloutsig_0_15z[13:3];
  assign { _07_[10:8], _03_, _07_[6], _04_, _07_[4:0] } = _40_;
  assign celloutsig_0_49z = { celloutsig_0_37z, celloutsig_0_47z, celloutsig_0_37z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_18z, celloutsig_0_14z, celloutsig_0_35z, 1'h0, celloutsig_0_31z, celloutsig_0_46z, celloutsig_0_24z } / { 1'h1, celloutsig_0_34z[11:1] };
  assign celloutsig_0_50z = celloutsig_0_12z[4:0] / { 1'h1, celloutsig_0_23z };
  assign celloutsig_0_55z = { celloutsig_0_32z[4:3], celloutsig_0_27z } / { 1'h1, celloutsig_0_42z, celloutsig_0_10z };
  assign celloutsig_1_4z = in_data[133:125] / { 1'h1, in_data[139:132] };
  assign celloutsig_0_19z = celloutsig_0_12z[8:6] / { 1'h1, celloutsig_0_7z[1:0] };
  assign celloutsig_0_29z = { celloutsig_0_8z, celloutsig_0_19z, celloutsig_0_6z, _06_[5], _02_, _06_[3], _01_, _06_[1:0], celloutsig_0_10z, 1'h0, celloutsig_0_26z, celloutsig_0_0z } / { 1'h1, celloutsig_0_12z[3:1], celloutsig_0_3z, celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_35z = celloutsig_0_30z[18:0] >= { celloutsig_0_33z[4], celloutsig_0_26z, celloutsig_0_31z, celloutsig_0_15z };
  assign celloutsig_0_40z = celloutsig_0_33z[4:1] >= { in_data[40], celloutsig_0_22z, 1'h0, celloutsig_0_26z };
  assign celloutsig_0_47z = in_data[67:65] >= { celloutsig_0_41z[14], 1'h0, celloutsig_0_8z };
  assign celloutsig_0_53z = { celloutsig_0_29z[12:4], celloutsig_0_27z, celloutsig_0_40z, celloutsig_0_40z } >= { celloutsig_0_41z[17:8], 1'h0, celloutsig_0_26z };
  assign celloutsig_0_10z = { _06_[5], _02_, celloutsig_0_1z } && celloutsig_0_5z[5:3];
  assign celloutsig_1_19z = { celloutsig_1_6z, celloutsig_1_12z, celloutsig_1_18z, celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_13z, celloutsig_1_10z } && { celloutsig_1_4z[5:1], celloutsig_1_6z, celloutsig_1_8z };
  assign celloutsig_0_26z = celloutsig_0_25z[9:2] && celloutsig_0_25z[8:1];
  assign celloutsig_0_6z = { celloutsig_0_5z[2:1], celloutsig_0_1z } < in_data[17:15];
  assign celloutsig_0_78z = { celloutsig_0_12z[6:0], celloutsig_0_60z, celloutsig_0_55z, 1'h0 } < { celloutsig_0_41z[8:0], celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_53z };
  assign celloutsig_1_0z = in_data[130:120] < in_data[126:116];
  assign celloutsig_1_3z = { in_data[112:103], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_0z } < in_data[111:96];
  assign celloutsig_0_14z = { celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_6z } < { celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_32z = celloutsig_0_25z[8:4] % { 1'h1, celloutsig_0_21z[4:2], celloutsig_0_13z };
  assign celloutsig_0_54z = { celloutsig_0_7z[3:0], celloutsig_0_0z, celloutsig_0_8z, _05_[3:1], _00_ } % { 1'h1, celloutsig_0_49z[10:2] };
  assign celloutsig_0_62z = celloutsig_0_41z[9:0] % { 1'h1, in_data[91:83] };
  assign celloutsig_0_92z = { celloutsig_0_54z, celloutsig_0_28z, celloutsig_0_42z, celloutsig_0_62z, 1'h0, celloutsig_0_46z } % { 1'h1, celloutsig_0_65z[14:3], celloutsig_0_41z[0], _05_[3:1], _00_, celloutsig_0_50z, celloutsig_0_78z };
  assign celloutsig_0_12z = { celloutsig_0_5z[6:1], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z } % { 1'h1, celloutsig_0_8z, celloutsig_0_0z, _06_[5], _02_, _06_[3], _01_, _06_[1:0] };
  assign celloutsig_0_21z = { _07_[8], _03_, _07_[6], _04_, _07_[4:3], celloutsig_0_18z } % { 1'h1, celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_17z };
  assign celloutsig_0_23z = celloutsig_0_5z[15:12] % { 1'h1, celloutsig_0_15z[14:12] };
  assign celloutsig_0_25z = { celloutsig_0_15z[9:7], 1'h0, celloutsig_0_1z, celloutsig_0_2z } % { 1'h1, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_24z, celloutsig_0_18z };
  assign celloutsig_0_33z = celloutsig_0_29z[7:0] * { _07_[10:8], _03_, _07_[6], _04_, _07_[4:3] };
  assign celloutsig_0_34z[12:1] = { celloutsig_0_15z[14:5], celloutsig_0_11z, celloutsig_0_3z } * celloutsig_0_29z[12:0];
  assign celloutsig_0_48z = { celloutsig_0_5z[8:3], _05_[3:1], _00_ } * { celloutsig_0_30z[9:7], celloutsig_0_21z };
  assign celloutsig_0_15z = { celloutsig_0_7z[3:2], celloutsig_0_12z, celloutsig_0_7z } * { celloutsig_0_5z[14:3], celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_1z };
  assign celloutsig_1_8z = ^ { celloutsig_1_4z[7:0], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_6z };
  assign celloutsig_0_13z = ^ { _06_[5], _02_, _06_[3], _01_, _06_[1:0] };
  assign celloutsig_0_17z = ^ { _06_[3], _01_, _06_[1], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_24z = ^ celloutsig_0_12z[7:1];
  assign celloutsig_0_41z = { _07_[8], _03_, _07_[6], celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z } ^ { celloutsig_0_12z[7:0], celloutsig_0_3z, celloutsig_0_27z, celloutsig_0_18z, celloutsig_0_2z, celloutsig_0_38z, celloutsig_0_38z, celloutsig_0_24z };
  assign celloutsig_0_5z = in_data[75:60] ^ { in_data[54:40], celloutsig_0_4z };
  assign celloutsig_0_7z = celloutsig_0_2z[5:1] ^ in_data[8:4];
  assign celloutsig_0_2z = in_data[58:53] ^ { in_data[9:5], celloutsig_0_1z };
  assign { celloutsig_0_30z[23:9], celloutsig_0_30z[1], celloutsig_0_30z[8], celloutsig_0_30z[0], celloutsig_0_30z[33:27], celloutsig_0_30z[24], celloutsig_0_30z[26], celloutsig_0_30z[7:3], celloutsig_0_30z[25], celloutsig_0_30z[2] } = { celloutsig_0_29z, celloutsig_0_26z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_12z[7:1], celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_0z } ^ { celloutsig_0_29z[13:0], celloutsig_0_4z, celloutsig_0_7z[1], celloutsig_0_26z, celloutsig_0_7z[0], celloutsig_0_28z, celloutsig_0_2z, celloutsig_0_29z[14], celloutsig_0_11z, celloutsig_0_19z, celloutsig_0_7z[4:3], celloutsig_0_17z, celloutsig_0_7z[2] };
  assign { celloutsig_0_65z[1], celloutsig_0_65z[17:15], celloutsig_0_65z[26:19], celloutsig_0_65z[14:3], celloutsig_0_65z[18] } = { celloutsig_0_60z, celloutsig_0_55z, celloutsig_0_48z[8:1], celloutsig_0_34z[12:1], celloutsig_0_31z } ^ { celloutsig_0_17z, celloutsig_0_41z[15:13], celloutsig_0_30z[31:28], celloutsig_0_22z, celloutsig_0_41z[19:17], celloutsig_0_41z[12:1], celloutsig_0_41z[16] };
  assign _05_[0] = _00_;
  assign { _06_[4], _06_[2] } = { _02_, _01_ };
  assign { _07_[7], _07_[5] } = { _03_, _04_ };
  assign celloutsig_0_30z[34] = celloutsig_0_12z[8];
  assign celloutsig_0_34z[0] = 1'h0;
  assign { celloutsig_0_65z[2], celloutsig_0_65z[0] } = { celloutsig_0_41z[0], celloutsig_0_28z };
  assign { out_data[128], out_data[96], out_data[32], out_data[23:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_91z, celloutsig_0_92z };
endmodule
