/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  reg [23:0] _02_;
  wire [3:0] _03_;
  wire [11:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [15:0] celloutsig_0_11z;
  wire [3:0] celloutsig_0_13z;
  wire [14:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [4:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [8:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [10:0] celloutsig_0_25z;
  wire [18:0] celloutsig_0_26z;
  reg [3:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [11:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [2:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [9:0] celloutsig_0_32z;
  wire [3:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [15:0] celloutsig_0_35z;
  wire [3:0] celloutsig_0_36z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire [3:0] celloutsig_0_44z;
  wire [37:0] celloutsig_0_46z;
  wire [29:0] celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [7:0] celloutsig_0_50z;
  wire celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_57z;
  wire [29:0] celloutsig_0_58z;
  wire celloutsig_0_60z;
  wire celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_77z;
  wire celloutsig_0_7z;
  wire celloutsig_0_82z;
  wire [6:0] celloutsig_0_83z;
  wire [3:0] celloutsig_0_8z;
  wire [11:0] celloutsig_0_9z;
  reg [18:0] celloutsig_1_0z;
  wire [4:0] celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire [10:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire [20:0] celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire [4:0] celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire [13:0] celloutsig_1_7z;
  wire [3:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_14z = !(celloutsig_1_5z[4] ? in_data[113] : celloutsig_1_3z[4]);
  assign celloutsig_0_1z = !(celloutsig_0_0z[4] ? celloutsig_0_0z[5] : in_data[79]);
  assign celloutsig_0_22z = !(celloutsig_0_11z[13] ? celloutsig_0_9z[4] : celloutsig_0_13z[2]);
  assign celloutsig_0_60z = ~(celloutsig_0_14z[0] | celloutsig_0_8z[0]);
  assign celloutsig_0_18z = ~(celloutsig_0_16z[1] | celloutsig_0_15z);
  assign celloutsig_0_34z = ~celloutsig_0_0z[4];
  assign celloutsig_0_4z = ~in_data[87];
  assign celloutsig_0_6z = ~celloutsig_0_2z;
  assign celloutsig_0_42z = ~((celloutsig_0_8z[2] | celloutsig_0_22z) & celloutsig_0_15z);
  assign celloutsig_1_1z = ~((in_data[171] | in_data[127]) & celloutsig_1_0z[17]);
  assign celloutsig_0_28z = ~((celloutsig_0_11z[11] | celloutsig_0_3z) & celloutsig_0_10z);
  assign celloutsig_0_3z = celloutsig_0_2z | celloutsig_0_0z[7];
  assign celloutsig_0_38z = celloutsig_0_3z | in_data[93];
  assign celloutsig_0_57z = celloutsig_0_27z[1] | celloutsig_0_24z;
  assign celloutsig_0_77z = celloutsig_0_67z | celloutsig_0_17z;
  assign celloutsig_1_12z = celloutsig_1_1z | celloutsig_1_5z[4];
  assign celloutsig_0_82z = celloutsig_0_11z[5] ^ celloutsig_0_57z;
  always_ff @(posedge celloutsig_1_18z[0], posedge clkin_data[0])
    if (clkin_data[0]) _02_ <= 24'h000000;
    else _02_ <= { in_data[31:14], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_4z };
  reg [3:0] _22_;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[32])
    if (clkin_data[32]) _22_ <= 4'h0;
    else _22_ <= { celloutsig_0_8z[3:1], celloutsig_0_3z };
  assign { _03_[3], _00_, _03_[1], _01_ } = _22_;
  assign celloutsig_0_8z = { celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_2z } / { 1'h1, celloutsig_0_0z[7:5] };
  assign celloutsig_1_3z = { in_data[105:104], celloutsig_1_0z } / { 1'h1, celloutsig_1_0z[14:0], celloutsig_1_2z };
  assign celloutsig_1_5z = celloutsig_1_2z / { 1'h1, celloutsig_1_2z[3:1], in_data[96] };
  assign celloutsig_0_49z = celloutsig_0_47z[2:0] === { _00_, celloutsig_0_18z, celloutsig_0_39z };
  assign celloutsig_0_54z = { celloutsig_0_46z[22:0], celloutsig_0_15z } === { celloutsig_0_50z[4:2], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_44z, celloutsig_0_2z, celloutsig_0_32z, celloutsig_0_33z };
  assign celloutsig_0_7z = in_data[59:52] === { _02_[18:12], celloutsig_0_6z };
  assign celloutsig_0_17z = { celloutsig_0_9z, _03_[3], _00_, _03_[1], _01_, celloutsig_0_3z } === { celloutsig_0_13z[0], celloutsig_0_11z };
  assign celloutsig_0_23z = { in_data[89:68], celloutsig_0_18z } === { in_data[84:63], celloutsig_0_2z };
  assign celloutsig_0_67z = { celloutsig_0_58z[22:7], celloutsig_0_54z, celloutsig_0_31z } < { celloutsig_0_29z[6:2], celloutsig_0_18z, celloutsig_0_34z, celloutsig_0_13z, celloutsig_0_60z, celloutsig_0_22z, celloutsig_0_21z, celloutsig_0_22z, celloutsig_0_1z, celloutsig_0_34z, celloutsig_0_60z };
  assign celloutsig_0_9z = { celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_8z } % { 1'h1, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_1z };
  assign celloutsig_0_0z = in_data[68:57] * in_data[67:56];
  assign celloutsig_0_44z = { celloutsig_0_15z, celloutsig_0_38z, celloutsig_0_23z, celloutsig_0_15z } * { celloutsig_0_26z[5:4], celloutsig_0_4z, celloutsig_0_39z };
  assign celloutsig_0_58z = { celloutsig_0_26z[11:2], celloutsig_0_53z, celloutsig_0_23z, celloutsig_0_49z, celloutsig_0_40z, celloutsig_0_11z } * { celloutsig_0_11z[15:3], celloutsig_0_20z, celloutsig_0_24z, celloutsig_0_28z, celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_33z, celloutsig_0_38z, celloutsig_0_17z };
  assign celloutsig_0_29z = { celloutsig_0_26z[14:4], celloutsig_0_21z } * { celloutsig_0_0z[10:1], celloutsig_0_18z, celloutsig_0_4z };
  assign celloutsig_0_50z = celloutsig_0_16z[2] ? { celloutsig_0_8z[2:0], celloutsig_0_36z, celloutsig_0_40z } : { celloutsig_0_35z[4:1], _03_[3], _00_, _03_[1], _01_ };
  assign celloutsig_1_18z = celloutsig_1_10z[3] ? celloutsig_1_3z[20:10] : { celloutsig_1_4z[3:0], celloutsig_1_12z, celloutsig_1_14z, celloutsig_1_10z[4], 1'h0, celloutsig_1_10z[2:0] };
  assign celloutsig_0_19z = in_data[87] ? { celloutsig_0_13z[2:0], celloutsig_0_1z, celloutsig_0_13z, celloutsig_0_3z } : celloutsig_0_11z[14:6];
  assign celloutsig_0_30z = celloutsig_0_2z ? celloutsig_0_8z[3:1] : { celloutsig_0_29z[1], celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_1_19z = celloutsig_1_9z[3:2] !== celloutsig_1_9z[1:0];
  assign celloutsig_0_15z = celloutsig_0_14z[1] !== celloutsig_0_2z;
  assign celloutsig_1_10z = celloutsig_1_7z[13:9] | celloutsig_1_7z[7:3];
  assign celloutsig_0_40z = & { celloutsig_0_39z, celloutsig_0_38z, celloutsig_0_29z[11:3], celloutsig_0_20z, celloutsig_0_18z, celloutsig_0_17z, celloutsig_0_8z, celloutsig_0_1z };
  assign celloutsig_0_10z = & celloutsig_0_9z[11:3];
  assign celloutsig_0_21z = & { celloutsig_0_16z, celloutsig_0_15z, celloutsig_0_6z };
  assign celloutsig_0_24z = & { celloutsig_0_22z, celloutsig_0_13z, in_data[42:15] };
  assign celloutsig_0_2z = & { celloutsig_0_1z, in_data[72:66] };
  assign celloutsig_0_39z = celloutsig_0_16z[1] & celloutsig_0_22z;
  assign celloutsig_0_31z = celloutsig_0_10z & _01_;
  assign celloutsig_0_53z = | { celloutsig_0_42z, celloutsig_0_31z, celloutsig_0_23z, celloutsig_0_22z, celloutsig_0_0z[10:0] };
  assign celloutsig_0_20z = | { celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_9z[7:4] };
  assign celloutsig_0_35z = celloutsig_0_11z >> { celloutsig_0_0z[7], celloutsig_0_14z };
  assign celloutsig_1_9z = { celloutsig_1_0z[14:12], celloutsig_1_1z } >> celloutsig_1_4z[3:0];
  assign celloutsig_0_13z = in_data[19:16] >> celloutsig_0_8z;
  assign celloutsig_1_2z = in_data[177:173] << in_data[125:121];
  assign celloutsig_1_6z = celloutsig_1_2z << celloutsig_1_5z;
  assign celloutsig_1_7z = { celloutsig_1_0z[5:3], celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_2z } << celloutsig_1_3z[20:7];
  assign celloutsig_0_25z = in_data[92:82] << { celloutsig_0_9z[6:0], celloutsig_0_17z, celloutsig_0_21z, celloutsig_0_17z, celloutsig_0_1z };
  assign celloutsig_0_11z = { in_data[65:53], celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_4z } >> in_data[67:52];
  assign celloutsig_0_33z = { celloutsig_0_25z[10:8], celloutsig_0_18z } >>> { celloutsig_0_25z[9:7], celloutsig_0_10z };
  assign celloutsig_0_83z = celloutsig_0_11z[10:4] >>> { celloutsig_0_58z[28:24], celloutsig_0_17z, celloutsig_0_77z };
  assign celloutsig_0_14z = { celloutsig_0_9z[7:1], celloutsig_0_2z, _03_[3], _00_, _03_[1], _01_, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_1z } >>> celloutsig_0_11z[15:1];
  assign celloutsig_0_32z = in_data[45:36] - { celloutsig_0_19z[0], celloutsig_0_8z, celloutsig_0_27z, celloutsig_0_15z };
  assign celloutsig_0_47z = { celloutsig_0_14z[7], celloutsig_0_30z, _02_, celloutsig_0_20z, celloutsig_0_34z } ~^ { celloutsig_0_19z[8:4], celloutsig_0_13z, celloutsig_0_26z, celloutsig_0_21z, celloutsig_0_24z };
  assign celloutsig_1_4z = { celloutsig_1_0z[12:9], celloutsig_1_1z } ~^ in_data[124:120];
  assign celloutsig_0_16z = { celloutsig_0_9z[8], celloutsig_0_8z } ~^ { _03_[3], _00_, _03_[1], _01_, celloutsig_0_6z };
  assign celloutsig_0_36z = celloutsig_0_9z[11:8] ^ { celloutsig_0_35z[3:1], celloutsig_0_24z };
  assign celloutsig_0_46z = { in_data[88:56], celloutsig_0_20z, celloutsig_0_28z, celloutsig_0_17z, celloutsig_0_23z, celloutsig_0_3z } ^ { celloutsig_0_26z[15:0], celloutsig_0_34z, celloutsig_0_9z, celloutsig_0_19z };
  assign celloutsig_0_26z = in_data[55:37] ^ { celloutsig_0_0z[7:3], celloutsig_0_7z, celloutsig_0_25z, celloutsig_0_21z, celloutsig_0_24z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_0z = 19'h00000;
    else if (clkin_data[128]) celloutsig_1_0z = in_data[147:129];
  always_latch
    if (!clkin_data[0]) celloutsig_0_27z = 4'h0;
    else if (!clkin_data[96]) celloutsig_0_27z = { celloutsig_0_16z[3:1], celloutsig_0_2z };
  assign { _03_[2], _03_[0] } = { _00_, _01_ };
  assign { out_data[138:128], out_data[96], out_data[32], out_data[6:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_82z, celloutsig_0_83z };
endmodule
