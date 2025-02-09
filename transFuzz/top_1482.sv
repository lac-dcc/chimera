/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [6:0] _02_;
  wire [6:0] _03_;
  reg [6:0] _04_;
  wire [8:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [2:0] celloutsig_0_15z;
  wire [9:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [5:0] celloutsig_0_18z;
  wire [2:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire [4:0] celloutsig_0_22z;
  wire [16:0] celloutsig_0_23z;
  wire [5:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [8:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [7:0] celloutsig_0_31z;
  wire [2:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire [2:0] celloutsig_0_39z;
  wire [8:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire [12:0] celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire [4:0] celloutsig_0_52z;
  wire [16:0] celloutsig_0_53z;
  wire [2:0] celloutsig_0_55z;
  wire [6:0] celloutsig_0_56z;
  wire [4:0] celloutsig_0_58z;
  wire [10:0] celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire [4:0] celloutsig_0_62z;
  wire [10:0] celloutsig_0_65z;
  wire celloutsig_0_6z;
  wire [8:0] celloutsig_0_7z;
  wire celloutsig_0_80z;
  wire [5:0] celloutsig_0_8z;
  wire [7:0] celloutsig_0_94z;
  wire celloutsig_0_95z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire [3:0] celloutsig_1_13z;
  wire [6:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [8:0] celloutsig_1_4z;
  wire [10:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_19z = ~(celloutsig_1_5z[0] & in_data[167]);
  assign celloutsig_0_34z = !(celloutsig_0_11z ? celloutsig_0_33z[1] : celloutsig_0_2z);
  assign celloutsig_0_4z = !(celloutsig_0_2z ? celloutsig_0_2z : celloutsig_0_1z);
  assign celloutsig_0_51z = !(celloutsig_0_46z ? celloutsig_0_33z[1] : celloutsig_0_23z[11]);
  assign celloutsig_0_61z = !(celloutsig_0_42z ? celloutsig_0_12z : celloutsig_0_58z[2]);
  assign celloutsig_0_6z = !(celloutsig_0_5z[10] ? celloutsig_0_0z[1] : celloutsig_0_3z[2]);
  assign celloutsig_1_1z = !(celloutsig_1_0z ? celloutsig_1_0z : celloutsig_1_0z);
  assign celloutsig_0_10z = !(celloutsig_0_3z[2] ? celloutsig_0_4z : celloutsig_0_5z[2]);
  assign celloutsig_0_26z = !(celloutsig_0_2z ? celloutsig_0_18z[0] : celloutsig_0_0z[0]);
  assign celloutsig_0_95z = ~(celloutsig_0_36z | celloutsig_0_9z);
  assign celloutsig_0_30z = ~(celloutsig_0_27z[8] | celloutsig_0_2z);
  assign celloutsig_0_2z = in_data[33] | ~(in_data[60]);
  assign celloutsig_0_12z = celloutsig_0_6z | celloutsig_0_10z;
  assign celloutsig_0_36z = ~(celloutsig_0_11z ^ celloutsig_0_13z);
  assign celloutsig_0_45z = ~(_01_ ^ celloutsig_0_40z);
  assign celloutsig_0_9z = ~(celloutsig_0_4z ^ celloutsig_0_2z);
  assign celloutsig_1_6z = ~(celloutsig_1_2z ^ celloutsig_1_5z[10]);
  assign celloutsig_1_9z = ~(celloutsig_1_5z[10] ^ celloutsig_1_6z);
  assign celloutsig_1_10z = ~(celloutsig_1_9z ^ celloutsig_1_2z);
  assign celloutsig_0_11z = ~(celloutsig_0_10z ^ celloutsig_0_7z[1]);
  assign celloutsig_0_14z = ~(celloutsig_0_9z ^ celloutsig_0_5z[7]);
  assign celloutsig_0_17z = ~(celloutsig_0_5z[5] ^ celloutsig_0_5z[7]);
  reg [6:0] _27_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _27_ <= 7'h00;
    else _27_ <= { _02_[6:5], _00_, celloutsig_0_1z, _02_[6:5], _00_ };
  assign { _03_[6:3], _01_, _03_[1:0] } = _27_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _04_ <= 7'h00;
    else _04_ <= celloutsig_0_3z[8:2];
  reg [2:0] _29_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _29_ <= 3'h0;
    else _29_ <= celloutsig_0_8z[5:3];
  assign { _02_[6:5], _00_ } = _29_;
  assign celloutsig_0_80z = { celloutsig_0_3z[2], celloutsig_0_34z, celloutsig_0_31z, celloutsig_0_1z } === celloutsig_0_65z;
  assign celloutsig_1_0z = in_data[170:164] === in_data[147:141];
  assign celloutsig_0_42z = { _02_[5], _00_, celloutsig_0_19z } >= { in_data[92], _02_[6:5], _00_, celloutsig_0_30z };
  assign celloutsig_0_46z = { _04_[4:1], celloutsig_0_21z, celloutsig_0_15z, celloutsig_0_22z } >= { celloutsig_0_44z[10:2], celloutsig_0_17z, celloutsig_0_45z, celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_1_2z = in_data[147:145] >= { in_data[169:168], celloutsig_1_0z };
  assign celloutsig_0_21z = { celloutsig_0_18z[5:3], celloutsig_0_10z, celloutsig_0_17z } >= { in_data[23:20], celloutsig_0_12z };
  assign celloutsig_0_28z = { celloutsig_0_15z[1], celloutsig_0_9z, celloutsig_0_21z } >= { celloutsig_0_15z[2:1], celloutsig_0_25z };
  assign celloutsig_0_13z = celloutsig_0_8z[4:1] <= celloutsig_0_8z[3:0];
  assign celloutsig_0_1z = in_data[32:24] < celloutsig_0_0z;
  assign celloutsig_0_7z = { in_data[8:1], celloutsig_0_4z } % { 1'h1, celloutsig_0_3z[5:0], celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_0_31z = { celloutsig_0_5z[10:4], celloutsig_0_4z } * { celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_24z };
  assign celloutsig_0_52z = { celloutsig_0_24z[4:1], celloutsig_0_51z } * { celloutsig_0_27z[7:4], celloutsig_0_26z };
  assign celloutsig_1_5z = { in_data[129], celloutsig_1_0z, celloutsig_1_4z } * { in_data[185:176], celloutsig_1_1z };
  assign celloutsig_0_15z = { celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_4z } * { celloutsig_0_7z[4:3], celloutsig_0_11z };
  assign celloutsig_0_18z = { celloutsig_0_0z[5:2], celloutsig_0_12z, celloutsig_0_17z } * { celloutsig_0_5z[9:5], celloutsig_0_17z };
  assign celloutsig_0_5z = celloutsig_0_1z ? { in_data[29], celloutsig_0_0z, celloutsig_0_2z } : { celloutsig_0_0z[8:1], celloutsig_0_2z, 1'h0, celloutsig_0_4z };
  assign celloutsig_0_3z = - in_data[45:37];
  assign celloutsig_0_55z = - { celloutsig_0_39z[1:0], celloutsig_0_45z };
  assign celloutsig_0_94z = - { celloutsig_0_62z[3:0], celloutsig_0_51z, celloutsig_0_45z, celloutsig_0_80z, celloutsig_0_1z };
  assign celloutsig_1_18z = - { celloutsig_1_13z, celloutsig_1_11z };
  assign celloutsig_0_27z = - celloutsig_0_23z[16:8];
  assign celloutsig_0_58z = ~ { celloutsig_0_18z[4:1], celloutsig_0_34z };
  assign celloutsig_1_4z = ~ { in_data[165:158], celloutsig_1_0z };
  assign celloutsig_0_8z = { in_data[72:68], celloutsig_0_1z } | celloutsig_0_3z[6:1];
  assign celloutsig_0_24z = { celloutsig_0_3z[7:3], celloutsig_0_11z } | { celloutsig_0_23z[7:3], celloutsig_0_12z };
  assign celloutsig_0_25z = celloutsig_0_18z[2] & celloutsig_0_8z[2];
  assign celloutsig_0_0z = in_data[44:36] >> in_data[62:54];
  assign celloutsig_0_22z = { celloutsig_0_5z[5], celloutsig_0_19z, celloutsig_0_2z } >> { celloutsig_0_19z[1:0], celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_11z };
  assign celloutsig_0_33z = { celloutsig_0_18z[4:3], celloutsig_0_17z } << celloutsig_0_8z[2:0];
  assign celloutsig_0_44z = { celloutsig_0_23z[12:5], celloutsig_0_22z } << { celloutsig_0_4z, celloutsig_0_22z, _04_ };
  assign celloutsig_0_56z = { celloutsig_0_33z[2], celloutsig_0_18z } << celloutsig_0_53z[8:2];
  assign celloutsig_1_11z = celloutsig_1_4z[8:6] << { celloutsig_1_4z[7], celloutsig_1_6z, celloutsig_1_1z };
  assign celloutsig_0_16z = { in_data[87:83], celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_2z } << { celloutsig_0_5z[7:0], celloutsig_0_4z, celloutsig_0_2z };
  assign celloutsig_0_19z = in_data[17:15] <<< { celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_17z };
  assign celloutsig_0_53z = { celloutsig_0_18z[5:2], _04_, celloutsig_0_12z, celloutsig_0_52z } >>> { celloutsig_0_24z[4:3], celloutsig_0_22z, celloutsig_0_27z, celloutsig_0_17z };
  assign celloutsig_1_13z = { celloutsig_1_11z, celloutsig_1_10z } >>> { celloutsig_1_4z[2:1], celloutsig_1_6z, celloutsig_1_2z };
  assign celloutsig_0_65z = { celloutsig_0_44z[7:0], celloutsig_0_30z, celloutsig_0_61z, celloutsig_0_61z } - { _03_[6:3], _01_, _03_[1:0], _02_[6:5], _00_, celloutsig_0_1z };
  assign celloutsig_0_23z = { in_data[73:63], celloutsig_0_19z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_11z } - { celloutsig_0_0z[8:2], celloutsig_0_10z, celloutsig_0_3z };
  assign celloutsig_0_39z = { _02_[5], _00_, celloutsig_0_25z } ^ { celloutsig_0_16z[4], celloutsig_0_21z, celloutsig_0_30z };
  assign celloutsig_0_62z = { celloutsig_0_56z[5], celloutsig_0_28z, celloutsig_0_55z } ^ celloutsig_0_5z[7:3];
  assign celloutsig_0_40z = ~((celloutsig_0_27z[5] & celloutsig_0_14z) | celloutsig_0_31z[2]);
  assign _02_[4:0] = { _00_, celloutsig_0_1z, _02_[6:5], _00_ };
  assign _03_[2] = _01_;
  assign { out_data[134:128], out_data[96], out_data[39:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_94z, celloutsig_0_95z };
endmodule
