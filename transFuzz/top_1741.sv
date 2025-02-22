/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [9:0] _03_;
  wire [11:0] _04_;
  reg [11:0] _05_;
  wire [12:0] _06_;
  reg [11:0] _07_;
  wire [2:0] _08_;
  reg [11:0] _09_;
  wire celloutsig_0_0z;
  wire [12:0] celloutsig_0_10z;
  wire [15:0] celloutsig_0_11z;
  wire [2:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [4:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [11:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [14:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [18:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [3:0] celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire [5:0] celloutsig_0_37z;
  wire [2:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [3:0] celloutsig_0_40z;
  wire [9:0] celloutsig_0_41z;
  wire [12:0] celloutsig_0_42z;
  wire [6:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [10:0] celloutsig_0_51z;
  wire [11:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire [2:0] celloutsig_0_71z;
  wire celloutsig_0_72z;
  wire [52:0] celloutsig_0_73z;
  wire [12:0] celloutsig_0_78z;
  wire celloutsig_0_79z;
  wire [4:0] celloutsig_0_7z;
  wire [5:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [8:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_16z;
  wire [3:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_2z;
  wire [10:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_65z = celloutsig_0_0z ? celloutsig_0_51z[8] : _00_;
  assign celloutsig_1_10z = celloutsig_1_4z ? celloutsig_1_3z[4] : celloutsig_1_9z[2];
  assign celloutsig_0_18z = celloutsig_0_5z ? celloutsig_0_4z : celloutsig_0_0z;
  assign celloutsig_0_4z = ~(in_data[77] & in_data[10]);
  assign celloutsig_0_20z = ~(celloutsig_0_16z & celloutsig_0_10z[1]);
  assign celloutsig_0_22z = !(celloutsig_0_8z[3] ? celloutsig_0_14z : celloutsig_0_1z);
  assign celloutsig_0_31z = ~(celloutsig_0_14z | celloutsig_0_29z);
  assign celloutsig_0_13z = ~celloutsig_0_3z;
  assign celloutsig_0_23z = ~celloutsig_0_0z;
  assign celloutsig_0_72z = ~((celloutsig_0_64z | celloutsig_0_12z[2]) & celloutsig_0_15z[0]);
  assign celloutsig_0_1z = celloutsig_0_0z ^ in_data[41];
  assign celloutsig_0_16z = celloutsig_0_3z ^ celloutsig_0_12z[1];
  assign celloutsig_0_29z = in_data[75] ^ celloutsig_0_15z[4];
  reg [9:0] _23_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _23_ <= 10'h000;
    else _23_ <= { in_data[79:75], celloutsig_0_18z, celloutsig_0_24z, celloutsig_0_20z, celloutsig_0_23z, celloutsig_0_3z };
  assign { _03_[9:1], _00_ } = _23_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _05_ <= 12'h000;
    else _05_ <= _04_;
  reg [12:0] _25_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _25_ <= 13'h0000;
    else _25_ <= { in_data[87:81], celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_4z };
  assign { _06_[12], _04_ } = _25_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _07_ <= 12'h000;
    else _07_ <= { celloutsig_0_71z[2], celloutsig_0_51z };
  reg [2:0] _27_;
  always_ff @(posedge clkin_data[32], posedge clkin_data[64])
    if (clkin_data[64]) _27_ <= 3'h0;
    else _27_ <= celloutsig_1_0z[2:0];
  assign { _08_[2], _01_, _02_ } = _27_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _09_ <= 12'h000;
    else _09_ <= { celloutsig_0_19z[9:5], celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_21z };
  assign celloutsig_0_34z = celloutsig_0_10z[4:1] & { celloutsig_0_10z[10:9], celloutsig_0_29z, celloutsig_0_33z };
  assign celloutsig_0_51z = { celloutsig_0_23z, celloutsig_0_49z, celloutsig_0_8z, celloutsig_0_30z, celloutsig_0_1z, celloutsig_0_33z } & { celloutsig_0_11z[10:1], celloutsig_0_16z };
  assign celloutsig_0_7z = in_data[34:30] & in_data[14:10];
  assign celloutsig_1_0z = in_data[124:116] & in_data[127:119];
  assign celloutsig_0_19z = celloutsig_0_10z[12:1] & { in_data[4], celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_26z = celloutsig_0_12z == { celloutsig_0_18z, celloutsig_0_21z, celloutsig_0_18z };
  assign celloutsig_0_39z = { celloutsig_0_37z[4:3], celloutsig_0_4z } <= { celloutsig_0_15z[3], celloutsig_0_16z, celloutsig_0_27z };
  assign celloutsig_1_2z = in_data[171:167] <= celloutsig_1_0z[5:1];
  assign celloutsig_0_0z = in_data[94] & ~(in_data[93]);
  assign celloutsig_0_33z = celloutsig_0_13z & ~(celloutsig_0_26z);
  assign celloutsig_0_36z = celloutsig_0_31z & ~(celloutsig_0_28z[8]);
  assign celloutsig_0_47z = celloutsig_0_28z[11] & ~(celloutsig_0_18z);
  assign celloutsig_0_5z = celloutsig_0_4z & ~(celloutsig_0_2z);
  assign celloutsig_0_64z = celloutsig_0_40z[0] & ~(celloutsig_0_47z);
  assign celloutsig_1_16z = celloutsig_1_4z & ~(in_data[148]);
  assign celloutsig_1_19z = celloutsig_1_2z & ~(celloutsig_1_16z);
  assign celloutsig_0_27z = _09_[8] & ~(celloutsig_0_20z);
  assign celloutsig_0_30z = celloutsig_0_4z & ~(celloutsig_0_1z);
  assign celloutsig_0_9z = { celloutsig_0_8z[3:0], celloutsig_0_2z, celloutsig_0_0z } != { celloutsig_0_7z[3:1], celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_32z = - { celloutsig_0_11z[14:0], celloutsig_0_5z, celloutsig_0_22z, celloutsig_0_1z, celloutsig_0_26z };
  assign celloutsig_0_73z = - { celloutsig_0_59z[10:5], celloutsig_0_11z, celloutsig_0_26z, celloutsig_0_24z, celloutsig_0_12z, celloutsig_0_39z, celloutsig_0_22z, celloutsig_0_27z, celloutsig_0_41z, celloutsig_0_48z, _05_ };
  assign celloutsig_0_10z = - { _04_[6:4], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_9z };
  assign celloutsig_0_11z = - in_data[68:53];
  assign celloutsig_0_3z = { in_data[13:6], celloutsig_0_1z, celloutsig_0_0z } !== { in_data[11:3], celloutsig_0_1z };
  assign celloutsig_0_48z = { celloutsig_0_8z[5:3], celloutsig_0_13z, celloutsig_0_18z } !== { celloutsig_0_46z[6:4], celloutsig_0_5z, celloutsig_0_23z };
  assign celloutsig_0_79z = { celloutsig_0_73z[18:14], celloutsig_0_72z, celloutsig_0_22z } !== { celloutsig_0_32z[18:15], celloutsig_0_71z };
  assign celloutsig_0_21z = & { celloutsig_0_20z, celloutsig_0_15z, celloutsig_0_14z, in_data[29:26] };
  assign celloutsig_0_2z = in_data[89] & celloutsig_0_0z;
  assign celloutsig_0_24z = celloutsig_0_1z & celloutsig_0_14z;
  assign celloutsig_0_49z = ~^ { celloutsig_0_11z[13:6], celloutsig_0_36z };
  assign celloutsig_1_4z = ~^ { celloutsig_1_0z[8:2], _08_[2], _01_, _02_ };
  assign celloutsig_1_8z = ~^ in_data[105:98];
  assign celloutsig_1_3z = { _01_, celloutsig_1_2z, celloutsig_1_0z } >> in_data[170:160];
  assign celloutsig_0_8z = { _04_[8:5], celloutsig_0_2z, celloutsig_0_1z } >> { in_data[4:0], celloutsig_0_2z };
  assign celloutsig_0_12z = celloutsig_0_7z[2:0] >> celloutsig_0_8z[3:1];
  assign celloutsig_0_15z = celloutsig_0_7z >> in_data[72:68];
  assign celloutsig_0_28z = { in_data[22:13], celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_20z } >> { in_data[84:71], celloutsig_0_22z };
  assign celloutsig_0_46z = { _06_[12], _04_[11:6] } >> { celloutsig_0_41z[5:0], celloutsig_0_22z };
  assign celloutsig_0_71z = { celloutsig_0_46z[2:1], celloutsig_0_33z } >> celloutsig_0_34z[2:0];
  assign celloutsig_0_37z = celloutsig_0_28z[10:5] <<< { celloutsig_0_36z, celloutsig_0_12z, celloutsig_0_18z, celloutsig_0_0z };
  assign celloutsig_0_42z = { celloutsig_0_28z[2:0], celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_22z, celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_3z } <<< { celloutsig_0_19z[7:3], celloutsig_0_7z, celloutsig_0_26z, celloutsig_0_31z, celloutsig_0_2z };
  assign celloutsig_0_78z = { celloutsig_0_39z, _07_ } >>> { _06_[12], _04_[11:2], celloutsig_0_36z, celloutsig_0_65z };
  assign celloutsig_0_38z = { celloutsig_0_2z, celloutsig_0_31z, celloutsig_0_21z } - celloutsig_0_12z;
  assign celloutsig_0_41z = { celloutsig_0_16z, celloutsig_0_9z, celloutsig_0_38z, celloutsig_0_38z, celloutsig_0_30z, celloutsig_0_29z } - { celloutsig_0_22z, celloutsig_0_27z, celloutsig_0_17z, celloutsig_0_40z, celloutsig_0_4z, celloutsig_0_16z, celloutsig_0_27z };
  assign celloutsig_0_59z = { celloutsig_0_42z[12:2], celloutsig_0_49z } - { _05_[9:0], celloutsig_0_49z, celloutsig_0_29z };
  assign celloutsig_1_9z = celloutsig_1_0z[6:4] - { _08_[2], _01_, _02_ };
  assign celloutsig_1_18z = { in_data[100:99], celloutsig_1_16z, celloutsig_1_8z } - { celloutsig_1_3z[6:4], celloutsig_1_10z };
  assign celloutsig_0_40z = { celloutsig_0_7z[1:0], celloutsig_0_3z, celloutsig_0_2z } ^ { celloutsig_0_32z[10:8], celloutsig_0_13z };
  assign celloutsig_0_14z = ~((celloutsig_0_7z[1] & celloutsig_0_7z[2]) | celloutsig_0_11z[8]);
  assign celloutsig_0_17z = ~((celloutsig_0_7z[2] & celloutsig_0_7z[4]) | celloutsig_0_10z[9]);
  assign _03_[0] = _00_;
  assign _06_[11:0] = _04_;
  assign _08_[1:0] = { _01_, _02_ };
  assign { out_data[131:128], out_data[96], out_data[44:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_78z, celloutsig_0_79z };
endmodule
