/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [15:0] _00_;
  reg [10:0] _01_;
  wire [5:0] celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [9:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [7:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [9:0] celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [11:0] celloutsig_0_29z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [9:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire [5:0] celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [6:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [22:0] celloutsig_0_51z;
  wire [17:0] celloutsig_0_55z;
  wire celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire celloutsig_0_65z;
  wire celloutsig_0_69z;
  wire [15:0] celloutsig_0_6z;
  wire [19:0] celloutsig_0_7z;
  wire [5:0] celloutsig_0_80z;
  wire celloutsig_0_81z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [12:0] celloutsig_1_0z;
  wire [4:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire [26:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [6:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [18:0] _02_;
  always_latch
    if (!clkin_data[32]) _02_ = 19'h00000;
    else if (!celloutsig_1_19z) _02_ = { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_0z };
  assign { celloutsig_0_7z[19:7], celloutsig_0_7z[5:0] } = _02_;
  assign celloutsig_0_33z = celloutsig_0_3z ? celloutsig_0_13z : celloutsig_0_24z;
  assign celloutsig_1_19z = celloutsig_1_8z[1] ? celloutsig_1_5z : celloutsig_1_15z;
  assign celloutsig_0_42z = ~(celloutsig_0_27z | celloutsig_0_29z[1]);
  assign celloutsig_1_2z = ~(celloutsig_1_1z | celloutsig_1_0z[11]);
  assign celloutsig_1_7z = ~(celloutsig_1_3z | celloutsig_1_2z);
  assign celloutsig_1_13z = ~(celloutsig_1_0z[2] | celloutsig_1_7z);
  reg [4:0] _09_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _09_ <= 5'h00;
    else _09_ <= in_data[79:75];
  assign _00_[14:10] = _09_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _01_ <= 11'h000;
    else _01_ <= { celloutsig_0_7z[4:1], _00_[14:10], celloutsig_0_5z, celloutsig_0_9z };
  assign celloutsig_0_13z = celloutsig_0_7z[4:2] == { celloutsig_0_7z[11:10], celloutsig_0_9z };
  assign celloutsig_0_34z = { celloutsig_0_20z[9:5], celloutsig_0_23z, celloutsig_0_10z } >= celloutsig_0_32z[9:1];
  assign celloutsig_0_3z = in_data[51:39] >= in_data[12:0];
  assign celloutsig_0_46z = { celloutsig_0_17z, celloutsig_0_13z, celloutsig_0_28z, celloutsig_0_17z } >= _00_[13:10];
  assign celloutsig_0_60z = { celloutsig_0_55z[3:0], celloutsig_0_47z, celloutsig_0_58z, celloutsig_0_18z, celloutsig_0_8z } >= { in_data[39:29], celloutsig_0_17z, celloutsig_0_31z, celloutsig_0_36z, celloutsig_0_31z };
  assign celloutsig_0_81z = { celloutsig_0_34z, celloutsig_0_4z, celloutsig_0_25z, celloutsig_0_60z } >= { celloutsig_0_80z[1], celloutsig_0_30z, celloutsig_0_69z, celloutsig_0_38z };
  assign celloutsig_0_9z = { in_data[95:94], celloutsig_0_5z, celloutsig_0_8z } >= in_data[6:3];
  assign celloutsig_0_16z = { celloutsig_0_7z[11:8], celloutsig_0_4z } >= in_data[40:36];
  assign celloutsig_0_24z = { celloutsig_0_0z[4:0], _01_ } >= { in_data[21:9], celloutsig_0_3z, celloutsig_0_22z, 1'h0 };
  assign celloutsig_0_58z = { _00_[13:10], celloutsig_0_35z, 1'h0, celloutsig_0_40z } <= { celloutsig_0_7z[11:9], celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_46z, celloutsig_0_43z };
  assign celloutsig_0_65z = { celloutsig_0_42z, celloutsig_0_43z, celloutsig_0_49z } <= { celloutsig_0_47z, celloutsig_0_8z, celloutsig_0_40z, celloutsig_0_0z };
  assign celloutsig_1_1z = celloutsig_1_0z[2:0] <= celloutsig_1_0z[6:4];
  assign celloutsig_1_5z = { in_data[151:147], celloutsig_1_2z, celloutsig_1_2z } <= { celloutsig_1_0z[7], celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_3z };
  assign celloutsig_1_11z = { celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_6z } <= celloutsig_1_10z[3:1];
  assign celloutsig_0_23z = { celloutsig_0_20z[6], celloutsig_0_22z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_12z } <= { in_data[24:20], 1'h0, celloutsig_0_3z, celloutsig_0_19z };
  assign celloutsig_0_4z = in_data[46:39] && in_data[50:44];
  assign celloutsig_1_3z = { celloutsig_1_0z[5:3], celloutsig_1_2z } && celloutsig_1_0z[11:8];
  assign celloutsig_1_6z = celloutsig_1_0z[9:7] && { celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_5z };
  assign celloutsig_0_8z = in_data[87:73] && { celloutsig_0_6z[14:2], celloutsig_0_5z };
  assign celloutsig_1_18z = { celloutsig_1_16z[17:10], celloutsig_1_6z } && { in_data[133:127], celloutsig_1_3z, celloutsig_1_6z };
  assign celloutsig_0_11z = { _00_[14:10], celloutsig_0_5z } && { celloutsig_0_0z[2:0], celloutsig_0_4z };
  assign celloutsig_0_30z = celloutsig_0_7z[11:7] && { _01_[10:6], celloutsig_0_5z };
  assign celloutsig_0_36z = { celloutsig_0_15z[6:2], celloutsig_0_35z, celloutsig_0_27z, celloutsig_0_27z, celloutsig_0_16z, celloutsig_0_4z, celloutsig_0_13z, _01_, celloutsig_0_31z, celloutsig_0_30z, celloutsig_0_16z, celloutsig_0_9z, celloutsig_0_31z, celloutsig_0_25z, celloutsig_0_22z, celloutsig_0_16z, celloutsig_0_27z, celloutsig_0_33z } || { _01_, celloutsig_0_35z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_35z, celloutsig_0_22z, celloutsig_0_27z, celloutsig_0_25z, celloutsig_0_30z, celloutsig_0_11z, celloutsig_0_8z, _01_ };
  assign celloutsig_0_39z = { celloutsig_0_22z, celloutsig_0_10z } || { celloutsig_0_24z, celloutsig_0_31z, celloutsig_0_33z, celloutsig_0_8z };
  assign celloutsig_0_47z = { celloutsig_0_12z[2:0], celloutsig_0_5z } || { celloutsig_0_0z[3:2], celloutsig_0_39z, celloutsig_0_4z };
  assign celloutsig_0_5z = { in_data[87:76], celloutsig_0_3z } || in_data[59:47];
  assign celloutsig_0_69z = { celloutsig_0_51z[18:13], celloutsig_0_30z, celloutsig_0_37z, celloutsig_0_47z, celloutsig_0_34z, celloutsig_0_34z } || { celloutsig_0_51z[11:2], celloutsig_0_65z };
  assign celloutsig_1_15z = in_data[191:187] || celloutsig_1_8z[4:0];
  assign celloutsig_0_22z = { celloutsig_0_6z[15:11], celloutsig_0_12z, celloutsig_0_12z, _01_, celloutsig_0_13z } || { in_data[80:57], celloutsig_0_4z };
  assign celloutsig_0_27z = { celloutsig_0_18z[4:0], celloutsig_0_25z, celloutsig_0_24z } || celloutsig_0_6z[9:3];
  assign celloutsig_0_28z = celloutsig_0_6z[9:0] || { celloutsig_0_15z[8:6], celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_1_0z = in_data[124:112] % { 1'h1, in_data[126:115] };
  assign celloutsig_0_15z = { celloutsig_0_6z[14:6], celloutsig_0_13z } % { 1'h1, in_data[83:78], celloutsig_0_10z };
  assign celloutsig_0_37z = { celloutsig_0_20z[8:4], celloutsig_0_36z } !== { celloutsig_0_20z[2:0], celloutsig_0_19z, celloutsig_0_30z, celloutsig_0_8z };
  assign celloutsig_0_17z = { celloutsig_0_12z, celloutsig_0_16z } !== { celloutsig_0_12z[2:0], celloutsig_0_9z, 1'h0 };
  assign celloutsig_0_19z = { celloutsig_0_0z[5], celloutsig_0_0z } !== { celloutsig_0_15z[2:0], celloutsig_0_10z, celloutsig_0_13z };
  assign celloutsig_0_25z = _00_[13:10] !== { celloutsig_0_15z[0], celloutsig_0_8z, celloutsig_0_23z, celloutsig_0_16z };
  assign celloutsig_1_10z = ~ { celloutsig_1_0z[6:3], celloutsig_1_7z };
  assign celloutsig_0_10z = ~ celloutsig_0_6z[5:3];
  assign celloutsig_0_29z = ~ { in_data[59:55], celloutsig_0_22z, celloutsig_0_0z };
  assign celloutsig_0_32z = ~ { in_data[50:43], celloutsig_0_27z, celloutsig_0_8z };
  assign celloutsig_0_35z = | celloutsig_0_15z[5:1];
  assign celloutsig_0_38z = | { celloutsig_0_36z, celloutsig_0_15z[7:2], celloutsig_0_9z };
  assign celloutsig_0_31z = | { _00_[14:10], celloutsig_0_30z, celloutsig_0_18z };
  assign celloutsig_0_40z = ^ { celloutsig_0_7z[16:8], celloutsig_0_11z, celloutsig_0_30z, celloutsig_0_31z };
  assign celloutsig_0_43z = ^ { celloutsig_0_7z[8:7], 1'h0, celloutsig_0_7z[5:4] };
  assign celloutsig_1_9z = ^ { celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_2z };
  assign celloutsig_1_12z = ^ { celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_9z };
  assign celloutsig_0_6z = { in_data[38:31], 2'h0, celloutsig_0_4z, 1'h0, celloutsig_0_5z, 1'h0, celloutsig_0_4z, celloutsig_0_3z } >> { in_data[87:86], celloutsig_0_3z, celloutsig_0_3z, _00_[14:10], celloutsig_0_4z, celloutsig_0_4z, _00_[14:10] };
  assign celloutsig_1_8z = { in_data[187:182], celloutsig_1_7z } >> { celloutsig_1_0z[2:1], celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_2z };
  assign celloutsig_1_16z = { celloutsig_1_0z[12:3], celloutsig_1_11z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_11z, celloutsig_1_0z } >> { celloutsig_1_12z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_13z, celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_7z, celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_9z };
  assign celloutsig_0_12z = { celloutsig_0_3z, 1'h0, celloutsig_0_4z, celloutsig_0_3z } >> { celloutsig_0_6z[3:1], celloutsig_0_3z };
  assign celloutsig_0_20z = { celloutsig_0_7z[14:7], 1'h0, celloutsig_0_9z } >> { celloutsig_0_15z[9:4], celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_13z };
  assign celloutsig_0_49z = { celloutsig_0_10z[2:1], celloutsig_0_38z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_37z, celloutsig_0_11z } <<< { celloutsig_0_7z[9:7], 1'h0, celloutsig_0_7z[5], celloutsig_0_34z, celloutsig_0_11z };
  assign celloutsig_0_51z = { celloutsig_0_29z[11:10], celloutsig_0_39z, celloutsig_0_45z, celloutsig_0_10z, celloutsig_0_49z, celloutsig_0_19z, celloutsig_0_22z, celloutsig_0_3z, celloutsig_0_33z } <<< { celloutsig_0_20z[7:3], celloutsig_0_18z, celloutsig_0_45z, celloutsig_0_10z, celloutsig_0_37z };
  assign celloutsig_0_55z = { celloutsig_0_6z[12:0], celloutsig_0_33z, celloutsig_0_22z, celloutsig_0_16z, celloutsig_0_42z, celloutsig_0_34z } <<< { celloutsig_0_12z[3:1], celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_34z, celloutsig_0_27z, celloutsig_0_49z, celloutsig_0_24z, celloutsig_0_43z, celloutsig_0_22z };
  assign celloutsig_0_18z = { celloutsig_0_0z[5:1], celloutsig_0_11z, celloutsig_0_8z, 1'h0 } >>> { celloutsig_0_11z, 1'h0, _00_[14:10], celloutsig_0_4z };
  assign celloutsig_0_0z = in_data[16:11] - in_data[54:49];
  assign celloutsig_0_45z = { celloutsig_0_43z, celloutsig_0_9z, celloutsig_0_43z, celloutsig_0_9z, celloutsig_0_42z, celloutsig_0_5z } - { celloutsig_0_6z[7:5], celloutsig_0_30z, celloutsig_0_5z, celloutsig_0_35z };
  assign celloutsig_0_80z = { celloutsig_0_7z[7], celloutsig_0_34z, celloutsig_0_33z, celloutsig_0_8z, celloutsig_0_23z, celloutsig_0_9z } - celloutsig_0_18z[6:1];
  assign celloutsig_1_4z = { in_data[127:126], celloutsig_1_3z } - { in_data[121:120], celloutsig_1_2z };
  assign { _00_[15], _00_[9:0] } = { celloutsig_0_7z[17], celloutsig_0_32z };
  assign celloutsig_0_7z[6] = 1'h0;
  assign { out_data[128], out_data[96], out_data[37:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_80z, celloutsig_0_81z };
endmodule
