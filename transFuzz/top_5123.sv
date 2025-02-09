/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [8:0] _02_;
  wire [5:0] _03_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [12:0] celloutsig_0_12z;
  wire [15:0] celloutsig_0_13z;
  wire [4:0] celloutsig_0_14z;
  wire [12:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [9:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [4:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire [2:0] celloutsig_0_27z;
  wire [5:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [3:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [5:0] celloutsig_0_36z;
  wire [3:0] celloutsig_0_37z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  reg [7:0] celloutsig_0_41z;
  wire [11:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [9:0] celloutsig_0_52z;
  wire celloutsig_0_55z;
  wire celloutsig_0_57z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_71z;
  wire celloutsig_0_72z;
  wire [4:0] celloutsig_0_78z;
  wire celloutsig_0_7z;
  wire [3:0] celloutsig_0_86z;
  wire celloutsig_0_87z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [16:0] celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_87z = ~(celloutsig_0_72z | celloutsig_0_55z);
  assign celloutsig_0_0z = ~in_data[54];
  assign celloutsig_0_47z = ~celloutsig_0_16z;
  assign celloutsig_1_9z = ~celloutsig_1_4z;
  assign celloutsig_1_17z = ~celloutsig_1_10z;
  assign celloutsig_0_10z = ~celloutsig_0_7z;
  assign celloutsig_0_11z = ~celloutsig_0_8z;
  assign celloutsig_0_19z = ~celloutsig_0_13z[12];
  assign celloutsig_0_22z = ~celloutsig_0_5z;
  assign celloutsig_0_3z = ~in_data[31];
  assign celloutsig_0_31z = ~celloutsig_0_28z[3];
  assign celloutsig_0_43z = ~((celloutsig_0_15z[2] | celloutsig_0_18z[1]) & celloutsig_0_33z);
  assign celloutsig_0_55z = ~((celloutsig_0_39z | celloutsig_0_30z) & celloutsig_0_36z[0]);
  assign celloutsig_0_8z = ~((celloutsig_0_3z | celloutsig_0_7z) & celloutsig_0_4z);
  assign celloutsig_1_5z = ~((celloutsig_1_0z | in_data[146]) & celloutsig_1_10z);
  assign celloutsig_1_12z = ~((celloutsig_1_1z | celloutsig_1_9z) & in_data[173]);
  assign celloutsig_0_2z = ~((celloutsig_0_1z | celloutsig_0_1z) & in_data[19]);
  assign celloutsig_1_0z = in_data[151] | ~(in_data[103]);
  assign celloutsig_1_19z = celloutsig_1_6z | ~(celloutsig_1_9z);
  assign celloutsig_0_16z = celloutsig_0_15z[0] | ~(in_data[41]);
  assign celloutsig_0_29z = celloutsig_0_21z[4] | ~(celloutsig_0_8z);
  assign celloutsig_0_34z = celloutsig_0_1z | ~(celloutsig_0_17z);
  assign celloutsig_0_59z = celloutsig_0_58z ^ celloutsig_0_23z;
  assign celloutsig_0_6z = celloutsig_0_2z ^ celloutsig_0_1z;
  assign celloutsig_0_24z = celloutsig_0_2z ^ celloutsig_0_8z;
  assign celloutsig_0_30z = celloutsig_0_29z ^ celloutsig_0_23z;
  assign celloutsig_0_49z = ~(celloutsig_0_0z ^ celloutsig_0_28z[3]);
  assign celloutsig_0_71z = ~(celloutsig_0_37z[3] ^ celloutsig_0_21z[4]);
  assign celloutsig_1_6z = ~(celloutsig_1_0z ^ in_data[141]);
  reg [8:0] _33_;
  always_ff @(negedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _33_ <= 9'h000;
    else _33_ <= { celloutsig_0_13z[14:7], celloutsig_0_4z };
  assign { _02_[8:5], _01_, _02_[3:0] } = _33_;
  reg [5:0] _34_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[0])
    if (clkin_data[0]) _34_ <= 6'h00;
    else _34_ <= { celloutsig_0_15z[8:5], celloutsig_0_10z, celloutsig_0_3z };
  assign { _03_[5:2], _00_, _03_[0] } = _34_;
  assign celloutsig_0_42z = celloutsig_0_12z[11:0] & { celloutsig_0_26z, celloutsig_0_11z, celloutsig_0_41z, celloutsig_0_31z, celloutsig_0_34z };
  assign celloutsig_0_52z = celloutsig_0_18z & { celloutsig_0_28z[4:0], celloutsig_0_37z, celloutsig_0_22z };
  assign celloutsig_0_12z = in_data[26:14] & { celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_3z };
  assign celloutsig_0_32z = { _02_[1:0], celloutsig_0_17z, celloutsig_0_4z } & { _03_[4:2], _00_ };
  assign celloutsig_0_86z = celloutsig_0_78z[3:0] / { 1'h1, celloutsig_0_42z[7], celloutsig_0_47z, celloutsig_0_57z };
  assign celloutsig_0_13z = { celloutsig_0_12z[11:5], celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_0z } / { 1'h1, in_data[14:0] };
  assign celloutsig_0_14z = { celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_11z } / { 1'h1, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_7z };
  assign celloutsig_0_27z = { celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_17z } / { 1'h1, celloutsig_0_11z, celloutsig_0_22z };
  assign celloutsig_0_28z = celloutsig_0_12z[9:4] / { 1'h1, celloutsig_0_21z[0], celloutsig_0_19z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_11z };
  assign celloutsig_0_4z = { in_data[76:28], celloutsig_0_1z } <= { in_data[90:42], celloutsig_0_1z };
  assign celloutsig_0_39z = { in_data[65:62], celloutsig_0_10z, celloutsig_0_22z, celloutsig_0_34z, celloutsig_0_1z, celloutsig_0_1z } <= { celloutsig_0_19z, celloutsig_0_22z, celloutsig_0_32z, celloutsig_0_30z, celloutsig_0_31z, celloutsig_0_8z };
  assign celloutsig_0_72z = { celloutsig_0_37z[0], celloutsig_0_57z, celloutsig_0_27z, celloutsig_0_43z, celloutsig_0_0z } <= { celloutsig_0_59z, celloutsig_0_47z, celloutsig_0_2z, celloutsig_0_33z, celloutsig_0_71z, celloutsig_0_57z, celloutsig_0_39z };
  assign celloutsig_0_7z = { celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_6z } <= { in_data[43:42], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_1z = in_data[163:142] <= { in_data[186:167], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_10z = { in_data[100:96], celloutsig_1_0z, celloutsig_1_0z } <= { celloutsig_1_2z[11:8], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_4z = { celloutsig_1_2z[7:1], celloutsig_1_10z } <= in_data[163:156];
  assign celloutsig_1_18z = { celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_5z } <= { celloutsig_1_1z, celloutsig_1_17z, celloutsig_1_15z };
  assign celloutsig_0_26z = { celloutsig_0_7z, celloutsig_0_23z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_24z } <= celloutsig_0_12z[8:3];
  assign celloutsig_0_58z = ! { celloutsig_0_52z[7:3], celloutsig_0_39z };
  assign celloutsig_1_15z = ! { in_data[180], celloutsig_1_12z, celloutsig_1_1z };
  assign celloutsig_0_33z = ! { in_data[62], celloutsig_0_10z, celloutsig_0_24z, celloutsig_0_23z };
  assign celloutsig_0_17z = { celloutsig_0_15z[10:2], celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_8z } != { celloutsig_0_15z[5:1], celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_11z };
  assign celloutsig_0_15z = - { celloutsig_0_13z[13:2], celloutsig_0_7z };
  assign celloutsig_0_36z = ~ celloutsig_0_18z[7:2];
  assign celloutsig_0_37z = ~ { celloutsig_0_22z, celloutsig_0_34z, celloutsig_0_17z, celloutsig_0_23z };
  assign celloutsig_0_78z = ~ in_data[87:83];
  assign celloutsig_1_2z = ~ in_data[151:135];
  assign celloutsig_0_18z = ~ celloutsig_0_15z[11:2];
  assign celloutsig_0_1z = ~^ { in_data[9:1], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_23z = ~^ { celloutsig_0_12z[5:4], celloutsig_0_8z };
  assign celloutsig_0_21z = { celloutsig_0_18z[2:1], celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_10z } ^ { in_data[68:67], celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_11z };
  always_latch
    if (clkin_data[32]) celloutsig_0_41z = 8'h00;
    else if (!clkin_data[64]) celloutsig_0_41z = { celloutsig_0_14z[4:1], celloutsig_0_8z, celloutsig_0_27z };
  assign celloutsig_0_5z = ~((in_data[45] & celloutsig_0_1z) | (celloutsig_0_0z & celloutsig_0_1z));
  assign celloutsig_0_57z = ~((celloutsig_0_2z & in_data[54]) | (celloutsig_0_49z & celloutsig_0_11z));
  assign _02_[4] = _01_;
  assign _03_[1] = _00_;
  assign { out_data[128], out_data[96], out_data[35:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_86z, celloutsig_0_87z };
endmodule
