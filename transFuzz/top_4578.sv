/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [18:0] _00_;
  reg [8:0] _01_;
  reg [8:0] _02_;
  reg [29:0] _03_;
  wire [18:0] celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [9:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [7:0] celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire [8:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [14:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [18:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [45:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [12:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [15:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [18:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [31:0] celloutsig_0_41z;
  wire [11:0] celloutsig_0_42z;
  wire celloutsig_0_44z;
  wire [11:0] celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [10:0] celloutsig_0_51z;
  wire [5:0] celloutsig_0_52z;
  wire celloutsig_0_59z;
  wire [4:0] celloutsig_0_61z;
  wire [15:0] celloutsig_0_62z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [14:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [12:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [4:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_38z = ~(celloutsig_0_3z & celloutsig_0_19z[7]);
  assign celloutsig_1_0z = ~(in_data[111] & in_data[141]);
  assign celloutsig_1_5z = ~(celloutsig_1_4z[11] & celloutsig_1_4z[0]);
  assign celloutsig_1_7z = ~(celloutsig_1_0z & celloutsig_1_4z[9]);
  assign celloutsig_1_8z = ~(celloutsig_1_1z & celloutsig_1_0z);
  assign celloutsig_1_10z = ~(celloutsig_1_1z & celloutsig_1_9z[2]);
  assign celloutsig_1_19z = ~(celloutsig_1_11z & celloutsig_1_13z[0]);
  assign celloutsig_0_8z = ~(celloutsig_0_7z & celloutsig_0_7z);
  assign celloutsig_0_23z = ~(celloutsig_0_10z[15] & celloutsig_0_22z);
  assign celloutsig_0_24z = ~(in_data[67] & celloutsig_0_21z);
  assign celloutsig_0_25z = ~(celloutsig_0_21z & celloutsig_0_22z);
  assign celloutsig_0_28z = ~(celloutsig_0_24z & celloutsig_0_24z);
  assign celloutsig_0_29z = ~(celloutsig_0_3z & celloutsig_0_2z[15]);
  assign celloutsig_0_33z = ~(celloutsig_0_10z[10] & celloutsig_0_19z[1]);
  assign celloutsig_0_4z = ~celloutsig_0_1z[0];
  assign celloutsig_1_1z = ~in_data[170];
  assign celloutsig_0_12z = ~celloutsig_0_2z[8];
  assign celloutsig_0_17z = ~celloutsig_0_7z;
  assign celloutsig_1_13z = { in_data[128:126], celloutsig_1_10z } + celloutsig_1_12z[11:8];
  assign celloutsig_0_26z = { celloutsig_0_10z[12:1], celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_8z } + { celloutsig_0_15z[7:5], celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_21z, celloutsig_0_7z, celloutsig_0_24z, celloutsig_0_7z, celloutsig_0_21z, celloutsig_0_23z, celloutsig_0_17z, celloutsig_0_24z, celloutsig_0_7z };
  assign celloutsig_0_31z = { celloutsig_0_10z[17:16], celloutsig_0_28z, celloutsig_0_10z[18:1], 1'h0, celloutsig_0_23z, celloutsig_0_4z, celloutsig_0_21z, celloutsig_0_11z, celloutsig_0_25z, celloutsig_0_18z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_20z, celloutsig_0_24z, celloutsig_0_24z, celloutsig_0_6z } + { celloutsig_0_19z[4:0], celloutsig_0_20z, celloutsig_0_7z, celloutsig_0_20z, celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_24z, celloutsig_0_26z };
  assign celloutsig_0_2z = { in_data[31:16], celloutsig_0_1z } + { _00_[18:14], _00_[18:14], _00_[8:7], _00_[18:14], _00_[8:7] };
  reg [6:0] _26_;
  always_ff @(negedge clkin_data[32], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _26_ <= 7'h00;
    else _26_ <= in_data[23:17];
  assign { _00_[18:14], _00_[8:7] } = _26_;
  always_ff @(negedge clkin_data[32], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _01_ <= 9'h000;
    else _01_ <= celloutsig_0_41z[21:13];
  always_ff @(negedge clkin_data[32], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _02_ <= 9'h000;
    else _02_ <= { celloutsig_0_2z[6:1], celloutsig_0_1z };
  always_ff @(negedge clkin_data[64], negedge clkin_data[96])
    if (!clkin_data[96]) _03_ <= 30'h00000000;
    else _03_ <= { in_data[146:132], celloutsig_1_4z, celloutsig_1_8z, celloutsig_1_7z };
  assign celloutsig_0_37z = { celloutsig_0_15z[9:7], celloutsig_0_32z } && { celloutsig_0_18z, celloutsig_0_30z, celloutsig_0_13z };
  assign celloutsig_0_40z = { celloutsig_0_39z[15:13], celloutsig_0_17z } && celloutsig_0_15z[8:5];
  assign celloutsig_0_46z = { celloutsig_0_45z[4:3], celloutsig_0_28z } && { celloutsig_0_32z, celloutsig_0_7z, celloutsig_0_8z };
  assign celloutsig_0_48z = { celloutsig_0_16z, celloutsig_0_27z, celloutsig_0_14z, celloutsig_0_34z[12], celloutsig_0_15z[5], celloutsig_0_34z[10:0], celloutsig_0_29z, celloutsig_0_40z } && { celloutsig_0_36z[15:8], _01_, celloutsig_0_4z };
  assign celloutsig_0_50z = { celloutsig_0_3z, celloutsig_0_30z, celloutsig_0_38z, celloutsig_0_13z, celloutsig_0_48z } && { celloutsig_0_25z, celloutsig_0_35z, celloutsig_0_3z, celloutsig_0_44z, celloutsig_0_3z };
  assign celloutsig_0_3z = in_data[34] & ~(celloutsig_0_2z[2]);
  assign celloutsig_0_44z = celloutsig_0_42z[3] & ~(celloutsig_0_4z);
  assign celloutsig_0_6z = celloutsig_0_4z & ~(celloutsig_0_3z);
  assign celloutsig_0_7z = celloutsig_0_6z & ~(in_data[22]);
  assign celloutsig_0_9z = _00_[14] & ~(_00_[16]);
  assign celloutsig_0_14z = celloutsig_0_11z[0] & ~(celloutsig_0_4z);
  assign celloutsig_0_30z = celloutsig_0_12z & ~(celloutsig_0_19z[4]);
  assign celloutsig_0_52z = { celloutsig_0_31z[22:21], celloutsig_0_24z, celloutsig_0_38z, celloutsig_0_13z, celloutsig_0_25z } | { _00_[17:14], _00_[8:7] };
  assign celloutsig_0_11z = { in_data[4], celloutsig_0_4z, celloutsig_0_1z } | _02_[8:4];
  assign celloutsig_0_59z = | { celloutsig_0_52z[4:0], celloutsig_0_16z };
  assign celloutsig_1_3z = | in_data[132:130];
  assign celloutsig_1_11z = | { celloutsig_1_4z[7:2], celloutsig_1_5z };
  assign celloutsig_1_18z = | { _03_[24:22], celloutsig_1_10z, celloutsig_1_10z };
  assign celloutsig_0_18z = | { in_data[76:75], celloutsig_0_16z };
  assign celloutsig_0_27z = | in_data[73:60];
  assign celloutsig_0_13z = | celloutsig_0_2z[13:4];
  assign celloutsig_0_21z = | { celloutsig_0_17z, celloutsig_0_10z[11:6], celloutsig_0_9z };
  assign celloutsig_0_32z = | { celloutsig_0_31z[45:35], celloutsig_0_17z };
  assign celloutsig_0_35z = ^ { in_data[72:49], celloutsig_0_9z };
  assign celloutsig_1_2z = ^ in_data[100:96];
  assign celloutsig_0_16z = ^ { celloutsig_0_2z[11:0], celloutsig_0_9z };
  assign celloutsig_0_22z = ^ celloutsig_0_2z[10:5];
  assign celloutsig_0_36z = { in_data[7:6], celloutsig_0_15z, celloutsig_0_30z, celloutsig_0_32z, celloutsig_0_9z, celloutsig_0_16z } >> { celloutsig_0_11z[4:1], celloutsig_0_22z, celloutsig_0_19z[7], 1'h0, celloutsig_0_19z[5:0], celloutsig_0_6z, celloutsig_0_21z, celloutsig_0_28z };
  assign celloutsig_0_41z = { celloutsig_0_28z, celloutsig_0_25z, celloutsig_0_12z, celloutsig_0_23z, _00_[18:14], _00_[8:7], celloutsig_0_30z, celloutsig_0_8z, celloutsig_0_39z } >> { in_data[84:55], celloutsig_0_29z, celloutsig_0_23z };
  assign celloutsig_0_45z = celloutsig_0_36z[14:3] >> celloutsig_0_39z[13:2];
  assign celloutsig_0_51z = { celloutsig_0_26z[3:2], celloutsig_0_27z, celloutsig_0_1z, celloutsig_0_46z, celloutsig_0_29z, celloutsig_0_9z, celloutsig_0_29z, celloutsig_0_8z } >> { celloutsig_0_10z[9:1], celloutsig_0_25z, celloutsig_0_30z };
  assign celloutsig_1_12z = { celloutsig_1_5z, in_data[170], celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_10z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_2z } >> { celloutsig_1_9z[2:1], celloutsig_1_3z, celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_10z, in_data[170], celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_8z, in_data[170], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_5z };
  assign celloutsig_0_39z = { celloutsig_0_21z, celloutsig_0_36z, celloutsig_0_35z, celloutsig_0_18z } << { in_data[70:68], celloutsig_0_25z, celloutsig_0_15z, celloutsig_0_25z, celloutsig_0_23z, celloutsig_0_13z, celloutsig_0_12z, celloutsig_0_12z };
  assign celloutsig_0_42z = celloutsig_0_2z[17:6] << { celloutsig_0_33z, celloutsig_0_28z, celloutsig_0_3z, celloutsig_0_35z, celloutsig_0_4z, celloutsig_0_24z, celloutsig_0_27z, celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_37z };
  assign celloutsig_0_61z = { celloutsig_0_1z, celloutsig_0_50z, celloutsig_0_48z } << { celloutsig_0_59z, celloutsig_0_1z, celloutsig_0_13z };
  assign celloutsig_0_62z = celloutsig_0_36z << { celloutsig_0_61z[2], celloutsig_0_4z, celloutsig_0_35z, celloutsig_0_51z, celloutsig_0_37z, celloutsig_0_17z };
  assign celloutsig_1_4z = in_data[169:157] << { in_data[175:167], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_1_9z = { in_data[167:165], celloutsig_1_8z, celloutsig_1_0z } << { celloutsig_1_4z[6:3], celloutsig_1_8z };
  assign celloutsig_0_1z = _00_[17:15] << _00_[16:14];
  assign celloutsig_0_15z = in_data[43:34] ^ { celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_13z };
  assign celloutsig_0_20z = { celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_16z, celloutsig_0_3z, celloutsig_0_9z } ^ { celloutsig_0_11z[4:1], celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_14z };
  assign { celloutsig_0_10z[17:16], celloutsig_0_10z[18], celloutsig_0_10z[8], celloutsig_0_10z[15], celloutsig_0_10z[7], celloutsig_0_10z[14], celloutsig_0_10z[6], celloutsig_0_10z[13], celloutsig_0_10z[5], celloutsig_0_10z[12], celloutsig_0_10z[4:3], celloutsig_0_10z[11], celloutsig_0_10z[2], celloutsig_0_10z[10], celloutsig_0_10z[1], celloutsig_0_10z[9] } = { celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_4z, _00_[18], _00_[18:17], _00_[17:16], _00_[16:15], _00_[15:14], _00_[14], _00_[8], _00_[8:7], _00_[7] } ^ { in_data[28:27], in_data[29], in_data[19], in_data[26], in_data[18], in_data[25], in_data[17], in_data[24], in_data[16], in_data[23], in_data[15], celloutsig_0_9z, in_data[22], celloutsig_0_9z, in_data[21], celloutsig_0_9z, in_data[20] };
  assign { celloutsig_0_19z[7], celloutsig_0_19z[0], celloutsig_0_19z[5:1] } = { celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_11z } ^ { celloutsig_0_15z[8], celloutsig_0_14z, celloutsig_0_1z, celloutsig_0_18z, celloutsig_0_18z };
  assign { celloutsig_0_34z[0], celloutsig_0_34z[12], celloutsig_0_34z[10:1] } = { celloutsig_0_29z, celloutsig_0_15z[6], celloutsig_0_15z[4:0], celloutsig_0_11z } | { celloutsig_0_1z[0], celloutsig_0_19z[7], celloutsig_0_19z[5:0], celloutsig_0_21z, celloutsig_0_7z, celloutsig_0_1z[2:1] };
  assign { out_data[0], out_data[23:8], out_data[1], out_data[6:2] } = { celloutsig_0_48z, celloutsig_0_36z[14:0], celloutsig_0_19z[7], celloutsig_0_19z[0], celloutsig_0_19z[5:1] } ^ { celloutsig_0_50z, celloutsig_0_31z[26:11], celloutsig_0_6z, celloutsig_0_31z[9:6], celloutsig_0_3z };
  assign { _00_[13:9], _00_[6:0] } = { _00_[18:14], _00_[18:14], _00_[8:7] };
  assign celloutsig_0_10z[0] = 1'h0;
  assign celloutsig_0_19z[6] = 1'h0;
  assign celloutsig_0_34z[11] = celloutsig_0_15z[5];
  assign { out_data[128], out_data[96], out_data[47:32], out_data[7] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_62z, celloutsig_0_31z[10] };
endmodule
