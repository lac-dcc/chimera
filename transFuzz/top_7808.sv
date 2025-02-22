/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  reg [26:0] _06_;
  wire [7:0] _07_;
  wire [6:0] _08_;
  reg [5:0] _09_;
  wire [3:0] _10_;
  wire celloutsig_0_0z;
  wire [4:0] celloutsig_0_10z;
  wire [6:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [15:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [5:0] celloutsig_0_15z;
  wire [6:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [13:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [16:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [11:0] celloutsig_0_24z;
  wire [10:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [25:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [3:0] celloutsig_0_34z;
  wire [39:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [7:0] celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire [2:0] celloutsig_0_40z;
  wire [3:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire [3:0] celloutsig_0_46z;
  wire celloutsig_0_4z;
  wire celloutsig_0_53z;
  wire [11:0] celloutsig_0_54z;
  wire celloutsig_0_56z;
  wire celloutsig_0_57z;
  wire [8:0] celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire [30:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [11:0] celloutsig_0_8z;
  wire [5:0] celloutsig_0_9z;
  wire [3:0] celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire [3:0] celloutsig_1_15z;
  wire [4:0] celloutsig_1_17z;
  wire [12:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [5:0] celloutsig_1_3z;
  wire [9:0] celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire [23:0] celloutsig_1_7z;
  wire [22:0] celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ~((in_data[54] | in_data[68]) & (in_data[48] | in_data[74]));
  assign celloutsig_0_2z = ~((celloutsig_0_1z | in_data[67]) & (celloutsig_0_1z | in_data[91]));
  assign celloutsig_0_32z = ~((celloutsig_0_14z | celloutsig_0_5z) & (celloutsig_0_2z | celloutsig_0_22z[7]));
  assign celloutsig_0_3z = ~((celloutsig_0_0z | celloutsig_0_0z) & (celloutsig_0_0z | celloutsig_0_0z));
  assign celloutsig_0_56z = ~((celloutsig_0_14z | celloutsig_0_53z) & (celloutsig_0_17z | celloutsig_0_18z[0]));
  assign celloutsig_0_4z = ~((celloutsig_0_1z | celloutsig_0_0z) & (celloutsig_0_2z | celloutsig_0_0z));
  assign celloutsig_1_6z = ~((celloutsig_1_4z[1] | celloutsig_1_3z[5]) & (_00_ | _01_));
  assign celloutsig_1_13z = ~((celloutsig_1_1z | _02_) & (celloutsig_1_8z[21] | celloutsig_1_6z));
  assign celloutsig_1_19z = ~((celloutsig_1_15z[2] | celloutsig_1_17z[2]) & (celloutsig_1_3z[4] | celloutsig_1_17z[4]));
  assign celloutsig_0_1z = ~((in_data[90] | celloutsig_0_0z) & (celloutsig_0_0z | celloutsig_0_0z));
  assign celloutsig_0_20z = ~((celloutsig_0_9z[3] | celloutsig_0_17z) & (celloutsig_0_15z[5] | celloutsig_0_3z));
  assign celloutsig_0_23z = ~((celloutsig_0_11z[1] | celloutsig_0_4z) & (_03_ | celloutsig_0_20z));
  assign celloutsig_0_28z = celloutsig_0_23z ^ in_data[43];
  assign celloutsig_0_31z = celloutsig_0_22z[0] ^ _04_;
  assign celloutsig_0_53z = celloutsig_0_43z[3] ^ celloutsig_0_0z;
  assign celloutsig_1_2z = celloutsig_1_1z ^ _05_;
  assign celloutsig_0_5z = celloutsig_0_4z ^ in_data[78];
  assign celloutsig_0_7z = celloutsig_0_3z ^ celloutsig_0_2z;
  assign celloutsig_0_12z = celloutsig_0_0z ^ celloutsig_0_1z;
  assign celloutsig_0_21z = celloutsig_0_5z ^ celloutsig_0_20z;
  assign celloutsig_0_27z = celloutsig_0_25z[5] ^ celloutsig_0_7z;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _06_ <= 27'h0000000;
    else _06_ <= { celloutsig_0_38z[4:3], celloutsig_0_30z, celloutsig_0_16z, celloutsig_0_31z, celloutsig_0_27z, celloutsig_0_14z, celloutsig_0_24z, celloutsig_0_12z, celloutsig_0_32z };
  reg [7:0] _33_;
  always_ff @(posedge clkin_data[32], posedge clkin_data[96])
    if (clkin_data[96]) _33_ <= 8'h00;
    else _33_ <= in_data[138:131];
  assign { _07_[7:6], _01_, _07_[4:2], _05_, _07_[0] } = _33_;
  reg [6:0] _34_;
  always_ff @(posedge clkin_data[32], posedge clkin_data[64])
    if (clkin_data[64]) _34_ <= 7'h00;
    else _34_ <= in_data[183:177];
  assign { _02_, _08_[5:3], _00_, _08_[1:0] } = _34_;
  always_ff @(posedge clkin_data[32], posedge clkin_data[96])
    if (clkin_data[96]) _09_ <= 6'h00;
    else _09_ <= in_data[185:180];
  reg [3:0] _36_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _36_ <= 4'h0;
    else _36_ <= { celloutsig_0_10z[2], celloutsig_0_1z, celloutsig_0_17z, celloutsig_0_2z };
  assign { _03_, _10_[2:1], _04_ } = _36_;
  assign celloutsig_0_30z = { in_data[28:22], celloutsig_0_20z } >= { celloutsig_0_14z, celloutsig_0_9z, celloutsig_0_14z };
  assign celloutsig_0_33z = celloutsig_0_22z[2:0] >= { celloutsig_0_29z[21:20], celloutsig_0_21z };
  assign celloutsig_0_37z = { celloutsig_0_6z[21], celloutsig_0_33z, celloutsig_0_9z, celloutsig_0_32z, celloutsig_0_12z, celloutsig_0_15z } >= { celloutsig_0_36z[18:11], celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_14z };
  assign celloutsig_0_44z = { celloutsig_0_18z[7:4], celloutsig_0_17z, celloutsig_0_40z } >= { celloutsig_0_43z[2:0], celloutsig_0_30z, celloutsig_0_21z, celloutsig_0_12z, celloutsig_0_32z, celloutsig_0_5z };
  assign celloutsig_0_57z = { in_data[6:2], celloutsig_0_31z } >= { celloutsig_0_54z[10:6], celloutsig_0_33z };
  assign celloutsig_1_1z = in_data[156:135] >= { in_data[145:132], _07_[7:6], _01_, _07_[4:2], _05_, _07_[0] };
  assign celloutsig_0_14z = { celloutsig_0_11z[6:5], celloutsig_0_1z } >= celloutsig_0_6z[25:23];
  assign celloutsig_0_17z = { celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_13z, celloutsig_0_11z } >= { in_data[48:31], celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_26z = { celloutsig_0_7z, celloutsig_0_17z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_23z } >= { celloutsig_0_22z[9:5], celloutsig_0_3z, celloutsig_0_20z, celloutsig_0_23z, celloutsig_0_10z, celloutsig_0_21z, celloutsig_0_1z };
  assign celloutsig_0_29z = { celloutsig_0_22z[14:7], celloutsig_0_8z[11:3], celloutsig_0_8z[3], celloutsig_0_8z[1:0], celloutsig_0_21z, celloutsig_0_17z, _03_, _10_[2:1], _04_ } * in_data[89:64];
  assign celloutsig_0_34z = { celloutsig_0_33z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_31z } * { celloutsig_0_24z[11:9], celloutsig_0_5z };
  assign celloutsig_0_36z = { celloutsig_0_18z[12:1], celloutsig_0_2z, celloutsig_0_23z, celloutsig_0_12z, celloutsig_0_21z, celloutsig_0_7z, celloutsig_0_20z, celloutsig_0_22z, celloutsig_0_27z, celloutsig_0_14z, celloutsig_0_31z, celloutsig_0_26z, celloutsig_0_17z } * { celloutsig_0_18z[11:1], celloutsig_0_5z, celloutsig_0_34z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_15z, celloutsig_0_26z, celloutsig_0_7z, celloutsig_0_18z };
  assign celloutsig_0_46z = celloutsig_0_18z[3:0] * { celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_21z };
  assign celloutsig_0_54z = { celloutsig_0_10z[0], celloutsig_0_46z, celloutsig_0_9z, celloutsig_0_3z } * _06_[24:13];
  assign celloutsig_1_4z = in_data[150:141] * { in_data[157:150], celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_7z = { in_data[145:130], celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_3z } * { in_data[161:145], _02_, _08_[5:3], _00_, _08_[1:0] };
  assign celloutsig_1_8z = { _08_[3], _00_, _02_, _08_[5:3], _00_, _08_[1:0], _02_, _08_[5:3], _00_, _08_[1:0], _02_, _08_[5:3], _00_, _08_[1:0] } * { _02_, _08_[5:3], _00_, _08_[1:0], _07_[7:6], _01_, _07_[4:2], _05_, _07_[0], _02_, _08_[5:3], _00_, _08_[1:0], celloutsig_1_2z };
  assign celloutsig_1_11z = celloutsig_1_8z[21:18] * in_data[141:138];
  assign celloutsig_1_15z = celloutsig_1_11z * { _08_[3], _00_, _08_[1:0] };
  assign celloutsig_1_17z = { celloutsig_1_7z[2], celloutsig_1_11z } * { celloutsig_1_7z[0], celloutsig_1_15z };
  assign celloutsig_0_9z = { in_data[50], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_5z } * celloutsig_0_6z[25:20];
  assign celloutsig_0_10z = { in_data[47:44], celloutsig_0_2z } * in_data[50:46];
  assign celloutsig_0_11z = { celloutsig_0_9z[4:0], celloutsig_0_1z, celloutsig_0_7z } * { celloutsig_0_8z[1:0], celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_13z = { celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_5z } * { celloutsig_0_11z[6], celloutsig_0_8z[11:3], celloutsig_0_8z[3], celloutsig_0_8z[1:0], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_0_16z = celloutsig_0_6z[12:6] * { celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_4z };
  assign celloutsig_0_22z = in_data[77:61] * { celloutsig_0_11z[2], celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_11z };
  assign celloutsig_0_25z = { celloutsig_0_6z[21:16], celloutsig_0_10z } * celloutsig_0_13z[13:3];
  assign celloutsig_0_38z = { celloutsig_0_36z[14:8], celloutsig_0_28z } | { celloutsig_0_16z[6:2], celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_37z };
  assign celloutsig_0_40z = { celloutsig_0_16z[0], celloutsig_0_14z, celloutsig_0_37z } | { celloutsig_0_28z, celloutsig_0_1z, celloutsig_0_14z };
  assign celloutsig_0_43z = { celloutsig_0_8z[5:3], celloutsig_0_2z } | { celloutsig_0_7z, celloutsig_0_30z, celloutsig_0_27z, celloutsig_0_1z };
  assign celloutsig_0_58z = { celloutsig_0_13z[11:4], celloutsig_0_56z } | { celloutsig_0_54z[8:5], celloutsig_0_37z, celloutsig_0_4z, celloutsig_0_44z, celloutsig_0_17z, celloutsig_0_20z };
  assign celloutsig_1_3z = { _01_, _07_[4:2], celloutsig_1_2z, celloutsig_1_1z } | { in_data[140:138], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_18z = { celloutsig_1_8z[14:9], _09_, celloutsig_1_2z } | { celloutsig_1_4z[6:4], celloutsig_1_13z, _07_[7:6], _01_, _07_[4:2], _05_, _07_[0], celloutsig_1_6z };
  assign celloutsig_0_6z = { in_data[47:19], celloutsig_0_1z, celloutsig_0_5z } | { in_data[37:12], celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_15z = { celloutsig_0_13z[12:9], celloutsig_0_3z, celloutsig_0_12z } | { in_data[48:44], celloutsig_0_5z };
  assign celloutsig_0_18z = { celloutsig_0_6z[25:23], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_1z } | celloutsig_0_6z[20:7];
  assign celloutsig_0_24z = { celloutsig_0_8z[11:3], celloutsig_0_8z[3], celloutsig_0_8z[1:0] } | { in_data[33:27], _03_, _10_[2:1], _04_, celloutsig_0_4z };
  assign { celloutsig_0_8z[0], celloutsig_0_8z[7:6], celloutsig_0_8z[11], celloutsig_0_8z[8], celloutsig_0_8z[3], celloutsig_0_8z[5:4], celloutsig_0_8z[10:9], celloutsig_0_8z[1] } = { celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z } | { celloutsig_0_4z, celloutsig_0_6z[3:2], celloutsig_0_6z[7], celloutsig_0_6z[4], celloutsig_0_4z, celloutsig_0_6z[1:0], celloutsig_0_6z[6:5], celloutsig_0_2z };
  assign { _07_[5], _07_[1] } = { _01_, _05_ };
  assign { _08_[6], _08_[2] } = { _02_, _00_ };
  assign { _10_[3], _10_[0] } = { _03_, _04_ };
  assign celloutsig_0_8z[2] = celloutsig_0_8z[3];
  assign { out_data[140:128], out_data[96], out_data[32], out_data[8:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_57z, celloutsig_0_58z };
endmodule
