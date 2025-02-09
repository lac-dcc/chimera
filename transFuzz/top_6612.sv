/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire [18:0] _05_;
  wire [34:0] _06_;
  wire [7:0] _07_;
  reg [11:0] _08_;
  reg [4:0] _09_;
  wire [5:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [17:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [6:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire [10:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [6:0] celloutsig_0_23z;
  wire [9:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [8:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [22:0] celloutsig_0_36z;
  wire [10:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_48z;
  wire [7:0] celloutsig_0_51z;
  wire celloutsig_0_5z;
  wire [24:0] celloutsig_0_6z;
  wire [2:0] celloutsig_0_7z;
  wire celloutsig_0_83z;
  wire celloutsig_0_84z;
  wire celloutsig_0_8z;
  wire [25:0] celloutsig_0_9z;
  wire celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [15:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_43z = celloutsig_0_35z ? celloutsig_0_23z[5] : celloutsig_0_3z;
  assign celloutsig_0_25z = celloutsig_0_18z ? celloutsig_0_12z : celloutsig_0_17z;
  assign celloutsig_0_8z = !(celloutsig_0_3z ? _01_ : celloutsig_0_0z[5]);
  assign celloutsig_0_12z = !(celloutsig_0_0z[3] ? celloutsig_0_0z[2] : celloutsig_0_10z);
  assign celloutsig_0_1z = !(celloutsig_0_0z[3] ? in_data[73] : in_data[50]);
  assign celloutsig_0_19z = !(celloutsig_0_7z[1] ? celloutsig_0_0z[4] : celloutsig_0_14z[2]);
  assign celloutsig_0_32z = ~(celloutsig_0_17z | celloutsig_0_9z[12]);
  assign celloutsig_0_44z = ~(celloutsig_0_34z | celloutsig_0_38z[3]);
  assign celloutsig_0_45z = ~(celloutsig_0_11z[8] | celloutsig_0_21z);
  assign celloutsig_0_5z = ~(celloutsig_0_3z | _02_);
  assign celloutsig_0_83z = ~(celloutsig_0_33z | celloutsig_0_25z);
  assign celloutsig_1_17z = ~(celloutsig_1_3z | celloutsig_1_12z);
  assign celloutsig_0_17z = ~(celloutsig_0_1z | celloutsig_0_2z);
  assign celloutsig_0_20z = ~(celloutsig_0_0z[3] | in_data[51]);
  assign celloutsig_0_31z = ~(celloutsig_0_1z | celloutsig_0_30z[4]);
  assign celloutsig_0_33z = celloutsig_0_9z[4] | ~(celloutsig_0_10z);
  assign celloutsig_0_34z = _02_ | ~(celloutsig_0_6z[11]);
  assign celloutsig_1_10z = celloutsig_1_3z | ~(celloutsig_1_9z[4]);
  assign celloutsig_0_39z = celloutsig_0_12z ^ celloutsig_0_11z[15];
  assign celloutsig_1_3z = _03_ ^ celloutsig_1_2z;
  assign celloutsig_1_4z = celloutsig_1_3z ^ celloutsig_1_2z;
  assign celloutsig_1_6z = celloutsig_1_1z ^ _04_;
  assign celloutsig_1_18z = celloutsig_1_3z ^ celloutsig_1_10z;
  assign celloutsig_0_10z = celloutsig_0_7z[0] ^ celloutsig_0_0z[5];
  assign celloutsig_0_18z = celloutsig_0_3z ^ celloutsig_0_10z;
  assign celloutsig_0_2z = celloutsig_0_1z ^ in_data[22];
  assign celloutsig_0_14z = celloutsig_0_13z[4:2] + celloutsig_0_6z[3:1];
  assign celloutsig_0_24z = celloutsig_0_9z[22:13] + { celloutsig_0_7z[2:1], celloutsig_0_1z, celloutsig_0_20z, celloutsig_0_0z };
  reg [2:0] _38_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _38_ <= 3'h0;
    else _38_ <= in_data[34:32];
  assign { _00_, _01_, _02_ } = _38_;
  reg [34:0] _39_;
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[64])
    if (clkin_data[64]) _39_ <= 35'h000000000;
    else _39_ <= { celloutsig_0_6z[10:2], celloutsig_0_28z, celloutsig_0_45z, celloutsig_0_32z, celloutsig_0_51z, celloutsig_0_44z, celloutsig_0_43z, celloutsig_0_32z, celloutsig_0_3z, celloutsig_0_38z };
  assign { _06_[34:32], _05_[18:2], _06_[14:0] } = _39_;
  reg [7:0] _40_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[128])
    if (!clkin_data[128]) _40_ <= 8'h00;
    else _40_ <= in_data[174:167];
  assign { _07_[7:6], _04_, _07_[4:2], _03_, _07_[0] } = _40_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[128])
    if (clkin_data[128]) _08_ <= 12'h000;
    else _08_ <= { _07_[7:6], _04_, _07_[4:2], _03_, _07_[0], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_3z };
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _09_ <= 5'h00;
    else _09_ <= celloutsig_1_9z[9:5];
  assign celloutsig_0_48z = { celloutsig_0_36z[14:2], celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_0z } || { in_data[61:53], celloutsig_0_28z, celloutsig_0_39z, celloutsig_0_16z };
  assign celloutsig_1_1z = _07_[3] & ~(in_data[166]);
  assign celloutsig_0_0z = in_data[76] ? in_data[25:20] : in_data[26:21];
  assign celloutsig_0_38z = celloutsig_0_20z ? { celloutsig_0_18z, celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_3z } : in_data[74:64];
  assign celloutsig_0_3z = { in_data[20:5], celloutsig_0_2z } != { celloutsig_0_0z[5:3], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_2z = { in_data[153:148], _07_[7:6], _04_, _07_[4:2], _03_, _07_[0] } != { in_data[178:166], celloutsig_1_1z };
  assign celloutsig_1_7z = in_data[157:153] != { in_data[153:152], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_12z = in_data[147:137] != _08_[10:0];
  assign celloutsig_1_19z = { in_data[102:101], celloutsig_1_12z, _08_ } != { _09_[1], celloutsig_1_3z, celloutsig_1_17z, _09_, _09_, celloutsig_1_2z, celloutsig_1_7z };
  assign celloutsig_0_13z = ~ { celloutsig_0_7z[1:0], _00_, _01_, _02_, celloutsig_0_10z, celloutsig_0_8z };
  assign celloutsig_0_51z = { celloutsig_0_16z[10:8], celloutsig_0_48z, celloutsig_0_28z, _00_, _01_, _02_ } | { celloutsig_0_6z[13:8], celloutsig_0_19z, celloutsig_0_21z };
  assign celloutsig_0_84z = | { _05_[14:4], celloutsig_0_32z, celloutsig_0_19z };
  assign celloutsig_0_28z = | { celloutsig_0_16z[5:1], celloutsig_0_27z, celloutsig_0_20z, celloutsig_0_26z };
  assign celloutsig_0_26z = celloutsig_0_12z & celloutsig_0_8z;
  assign celloutsig_0_27z = celloutsig_0_5z & celloutsig_0_25z;
  assign celloutsig_0_35z = | celloutsig_0_16z[10:7];
  assign celloutsig_1_8z = | { celloutsig_1_7z, celloutsig_1_1z, in_data[128] };
  assign celloutsig_0_21z = | { celloutsig_0_20z, celloutsig_0_14z, celloutsig_0_9z[17:13] };
  assign celloutsig_0_16z = { in_data[61:52], celloutsig_0_3z } >>> { celloutsig_0_9z[3:1], _00_, _01_, _02_, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_8z };
  assign celloutsig_0_36z = { celloutsig_0_30z[5:1], celloutsig_0_2z, _00_, _01_, _02_, celloutsig_0_26z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_24z, celloutsig_0_18z } - { celloutsig_0_11z[15:7], celloutsig_0_11z[17], celloutsig_0_11z[13], celloutsig_0_7z, celloutsig_0_17z, _00_, _01_, _02_, celloutsig_0_28z, celloutsig_0_31z, celloutsig_0_25z, celloutsig_0_35z, celloutsig_0_33z };
  assign celloutsig_0_6z = { in_data[50:30], celloutsig_0_2z, _00_, _01_, _02_ } - { in_data[42:27], celloutsig_0_0z, _00_, _01_, _02_ };
  assign celloutsig_0_7z = { in_data[57:56], celloutsig_0_1z } - { in_data[2], celloutsig_0_5z, celloutsig_0_1z };
  assign celloutsig_0_9z = in_data[33:8] - { celloutsig_0_6z[11:0], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_7z };
  assign celloutsig_0_30z = { celloutsig_0_24z[9:8], celloutsig_0_0z, celloutsig_0_2z } - celloutsig_0_16z[9:1];
  assign { celloutsig_0_11z[7], celloutsig_0_11z[14], celloutsig_0_11z[15], celloutsig_0_11z[17], celloutsig_0_11z[13:8] } = ~ { celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_0z };
  assign { celloutsig_0_23z[1], celloutsig_0_23z[4:3], celloutsig_0_23z[6:5], celloutsig_0_23z[2] } = ~ { celloutsig_0_20z, celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_9z[24:23], celloutsig_0_3z };
  assign { celloutsig_1_9z[15:12], celloutsig_1_9z[2:1], celloutsig_1_9z[3], celloutsig_1_9z[11:4] } = { _08_[8:5], celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_1z, _07_[7:6], _04_, _07_[4:2], _03_, _07_[0] } | { _08_[11:8], celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_6z, _08_[7:1], celloutsig_1_3z };
  assign _06_[31:15] = _05_[18:2];
  assign { _07_[5], _07_[1] } = { _04_, _03_ };
  assign { celloutsig_0_11z[16], celloutsig_0_11z[6:0] } = { celloutsig_0_11z[17], celloutsig_0_11z[17], celloutsig_0_11z[13:8] };
  assign celloutsig_0_23z[0] = celloutsig_0_23z[3];
  assign celloutsig_1_9z[0] = celloutsig_1_9z[2];
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_83z, celloutsig_0_84z };
endmodule
