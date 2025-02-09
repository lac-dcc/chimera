/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [16:0] _01_;
  reg [3:0] _02_;
  reg [8:0] _03_;
  wire [11:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [14:0] celloutsig_0_15z;
  wire [6:0] celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [11:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [3:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [3:0] celloutsig_0_2z;
  wire [5:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [6:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [5:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [10:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_44z;
  wire [11:0] celloutsig_0_45z;
  wire [20:0] celloutsig_0_46z;
  wire [10:0] celloutsig_0_4z;
  wire celloutsig_0_55z;
  wire [11:0] celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire celloutsig_0_61z;
  wire [3:0] celloutsig_0_64z;
  wire [9:0] celloutsig_0_65z;
  wire [12:0] celloutsig_0_66z;
  wire [3:0] celloutsig_0_69z;
  wire [7:0] celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [8:0] celloutsig_1_0z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [6:0] celloutsig_1_17z;
  wire [16:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [19:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [7:0] celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_8z = ~(celloutsig_0_0z[10] & celloutsig_0_3z);
  assign celloutsig_0_21z = ~(celloutsig_0_10z & celloutsig_0_13z);
  assign celloutsig_0_61z = !(celloutsig_0_35z ? celloutsig_0_14z : celloutsig_0_41z);
  assign celloutsig_0_70z = ~(celloutsig_0_66z[7] | celloutsig_0_15z[5]);
  assign celloutsig_0_10z = ~(in_data[42] | celloutsig_0_7z);
  assign celloutsig_0_40z = ~celloutsig_0_18z;
  assign celloutsig_0_44z = celloutsig_0_9z | ~(celloutsig_0_22z[3]);
  assign celloutsig_0_60z = celloutsig_0_20z[10] | ~(celloutsig_0_21z);
  assign celloutsig_1_13z = celloutsig_1_6z[4] | ~(celloutsig_1_12z);
  assign celloutsig_1_19z = celloutsig_1_17z[0] | ~(celloutsig_1_2z[12]);
  assign celloutsig_0_28z = celloutsig_0_10z | ~(celloutsig_0_13z);
  assign celloutsig_0_31z = celloutsig_0_22z[3] | ~(celloutsig_0_11z);
  assign celloutsig_0_34z = celloutsig_0_8z | celloutsig_0_20z[8];
  assign celloutsig_0_19z = celloutsig_0_0z[0] | celloutsig_0_15z[1];
  assign celloutsig_0_23z = in_data[69] | celloutsig_0_20z[10];
  assign celloutsig_0_26z = celloutsig_0_17z[2] | celloutsig_0_0z[5];
  assign celloutsig_0_46z = { celloutsig_0_45z[11:1], celloutsig_0_26z, celloutsig_0_39z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_26z, celloutsig_0_28z, celloutsig_0_25z, celloutsig_0_44z, celloutsig_0_40z, celloutsig_0_11z } + { in_data[56:49], celloutsig_0_28z, celloutsig_0_5z };
  assign celloutsig_0_5z = { celloutsig_0_3z, celloutsig_0_4z } + { celloutsig_0_3z, celloutsig_0_4z };
  assign celloutsig_1_6z = { celloutsig_1_5z[1:0], celloutsig_1_5z } + celloutsig_1_0z[6:2];
  assign celloutsig_1_17z = { celloutsig_1_0z[5:0], celloutsig_1_1z } + celloutsig_1_4z[6:0];
  assign celloutsig_1_18z = { celloutsig_1_4z[7:1], celloutsig_1_3z, _01_[8:4], _00_, _01_[2:1], celloutsig_1_13z } + in_data[126:110];
  assign celloutsig_0_2z = { celloutsig_0_0z[0], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z } + in_data[34:31];
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[64])
    if (!clkin_data[64]) _03_ <= 9'h000;
    else _03_ <= { celloutsig_0_21z, celloutsig_0_31z, celloutsig_0_30z, celloutsig_0_24z };
  reg [7:0] _27_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _27_ <= 8'h00;
    else _27_ <= { in_data[190:186], celloutsig_1_5z };
  assign { _01_[8:4], _00_, _01_[2:1] } = _27_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _02_ <= 4'h0;
    else _02_ <= { celloutsig_0_12z[3:1], celloutsig_0_14z };
  assign celloutsig_0_36z = celloutsig_0_4z[8:3] / { 1'h1, celloutsig_0_33z[5:1] };
  assign celloutsig_1_5z = { in_data[108:107], celloutsig_1_3z } / { 1'h1, celloutsig_1_3z, in_data[96] };
  assign celloutsig_0_25z = celloutsig_0_0z[11:4] > { in_data[36:33], celloutsig_0_2z };
  assign celloutsig_0_29z = { celloutsig_0_16z[1:0], celloutsig_0_26z, celloutsig_0_28z, celloutsig_0_9z, celloutsig_0_15z } > { celloutsig_0_5z[10:6], celloutsig_0_23z, celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_22z, celloutsig_0_11z };
  assign celloutsig_0_39z = { celloutsig_0_38z[8:1], celloutsig_0_23z } && { in_data[94:90], celloutsig_0_2z };
  assign celloutsig_1_3z = in_data[104:97] && { celloutsig_1_0z[6:0], celloutsig_1_1z };
  assign celloutsig_0_24z = { celloutsig_0_6z[6:2], celloutsig_0_18z, celloutsig_0_10z } && celloutsig_0_16z;
  assign celloutsig_0_55z = { celloutsig_0_16z, celloutsig_0_36z, celloutsig_0_11z } < { celloutsig_0_46z[14:2], celloutsig_0_19z };
  assign celloutsig_0_18z = { celloutsig_0_4z[8], celloutsig_0_5z } < { in_data[46:35], celloutsig_0_11z };
  assign celloutsig_0_66z = { celloutsig_0_61z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_34z, celloutsig_0_41z, celloutsig_0_64z, celloutsig_0_18z } % { 1'h1, celloutsig_0_15z[2:1], celloutsig_0_2z, celloutsig_0_22z, celloutsig_0_60z, celloutsig_0_1z };
  assign celloutsig_1_0z = in_data[120:112] % { 1'h1, in_data[149:142] };
  assign celloutsig_0_15z = { celloutsig_0_5z[6:0], celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_11z } % { 1'h1, celloutsig_0_4z[9:0], celloutsig_0_2z };
  assign celloutsig_0_45z = celloutsig_0_25z ? { celloutsig_0_16z[1], celloutsig_0_39z, celloutsig_0_37z, celloutsig_0_24z, celloutsig_0_36z, celloutsig_0_23z, celloutsig_0_31z } : { 1'h0, celloutsig_0_9z, celloutsig_0_36z, _02_ };
  assign celloutsig_0_6z = celloutsig_0_3z ? celloutsig_0_4z[8:1] : celloutsig_0_5z[10:3];
  assign celloutsig_0_41z = celloutsig_0_38z[10:3] !== { celloutsig_0_38z[7:2], celloutsig_0_37z, celloutsig_0_13z };
  assign celloutsig_1_7z = { celloutsig_1_0z[7], celloutsig_1_6z } !== celloutsig_1_0z[6:1];
  assign celloutsig_0_1z = celloutsig_0_0z[8:0] !== celloutsig_0_0z[11:3];
  assign celloutsig_0_14z = celloutsig_0_5z[3:0] !== celloutsig_0_6z[3:0];
  assign celloutsig_0_4z = { in_data[71:65], celloutsig_0_2z } | { in_data[19:10], celloutsig_0_3z };
  assign celloutsig_0_37z = & celloutsig_0_2z[2:0];
  assign celloutsig_0_3z = ^ celloutsig_0_0z;
  assign celloutsig_0_7z = ^ celloutsig_0_0z[3:0];
  assign celloutsig_1_12z = ^ { celloutsig_1_2z[15:10], celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_4z };
  assign celloutsig_0_33z = { celloutsig_0_16z[5:0], celloutsig_0_1z } >> in_data[41:35];
  assign celloutsig_0_12z = { celloutsig_0_0z[9], celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_8z } >> celloutsig_0_6z[5:2];
  assign celloutsig_0_30z = celloutsig_0_0z[8:3] <<< celloutsig_0_6z[5:0];
  assign celloutsig_0_0z = in_data[57:46] - in_data[80:69];
  assign celloutsig_0_16z = { celloutsig_0_4z[10], celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_10z } - celloutsig_0_0z[7:1];
  assign celloutsig_0_17z = celloutsig_0_12z[2:0] - celloutsig_0_4z[5:3];
  assign celloutsig_0_20z = in_data[23:12] - { celloutsig_0_15z[12:6], celloutsig_0_17z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_38z = { celloutsig_0_0z[3:1], celloutsig_0_30z, celloutsig_0_13z, celloutsig_0_1z } ~^ { celloutsig_0_20z[11:3], celloutsig_0_19z, celloutsig_0_29z };
  assign celloutsig_0_64z = { celloutsig_0_2z[2:1], celloutsig_0_10z, celloutsig_0_21z } ~^ celloutsig_0_15z[13:10];
  assign celloutsig_0_65z = { celloutsig_0_40z, celloutsig_0_61z, celloutsig_0_6z } ^ { celloutsig_0_45z[2:0], celloutsig_0_55z, celloutsig_0_44z, celloutsig_0_25z, _02_ };
  assign celloutsig_0_69z = { _03_[7:5], celloutsig_0_61z } ^ { celloutsig_0_65z[7], celloutsig_0_34z, celloutsig_0_34z, celloutsig_0_1z };
  assign celloutsig_1_2z = { in_data[155:138], celloutsig_1_1z, celloutsig_1_1z } ^ { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_4z = { celloutsig_1_0z[8:2], celloutsig_1_3z } ^ celloutsig_1_0z[7:0];
  assign celloutsig_0_22z = celloutsig_0_12z ^ { celloutsig_0_2z[3:1], celloutsig_0_9z };
  assign celloutsig_0_35z = ~((celloutsig_0_1z & celloutsig_0_0z[3]) | in_data[2]);
  assign celloutsig_1_1z = ~((in_data[148] & celloutsig_1_0z[5]) | celloutsig_1_0z[0]);
  assign celloutsig_0_9z = ~((celloutsig_0_3z & celloutsig_0_2z[3]) | celloutsig_0_6z[2]);
  assign celloutsig_0_13z = ~((celloutsig_0_2z[1] & celloutsig_0_4z[10]) | celloutsig_0_5z[9]);
  assign celloutsig_0_11z = ~((celloutsig_0_3z & celloutsig_0_9z) | (celloutsig_0_1z & celloutsig_0_4z[7]));
  assign { _01_[16:9], _01_[3], _01_[0] } = { celloutsig_1_4z[7:1], celloutsig_1_3z, _00_, celloutsig_1_13z };
  assign { out_data[144:128], out_data[96], out_data[35:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_69z, celloutsig_0_70z };
endmodule
