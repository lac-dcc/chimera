/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [21:0] _01_;
  reg [6:0] _02_;
  wire [6:0] _03_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [8:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [12:0] celloutsig_0_20z;
  wire [20:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_24z;
  wire [6:0] celloutsig_0_25z;
  wire [5:0] celloutsig_0_27z;
  wire [11:0] celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [2:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [3:0] celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  reg [10:0] celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [12:0] celloutsig_0_52z;
  wire celloutsig_0_54z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_64z;
  wire celloutsig_0_68z;
  wire celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire [6:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [10:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_35z = celloutsig_0_2z ? celloutsig_0_2z : celloutsig_0_1z;
  assign celloutsig_0_46z = celloutsig_0_44z ? celloutsig_0_7z : celloutsig_0_41z;
  assign celloutsig_0_3z = ~(celloutsig_0_2z & celloutsig_0_2z);
  assign celloutsig_0_43z = ~(celloutsig_0_28z[4] & celloutsig_0_35z);
  assign celloutsig_0_7z = ~(celloutsig_0_6z & celloutsig_0_3z);
  assign celloutsig_0_61z = !(in_data[14] ? celloutsig_0_22z : celloutsig_0_17z);
  assign celloutsig_0_17z = !(celloutsig_0_11z ? celloutsig_0_7z : celloutsig_0_14z);
  assign celloutsig_1_9z = ~(celloutsig_1_6z | celloutsig_1_0z);
  assign celloutsig_0_6z = ~celloutsig_0_3z;
  assign celloutsig_1_6z = ~celloutsig_1_0z;
  assign celloutsig_0_14z = ~celloutsig_0_2z;
  assign celloutsig_0_0z = in_data[14] | ~(in_data[68]);
  assign celloutsig_0_34z = _00_ | ~(celloutsig_0_6z);
  assign celloutsig_1_11z = celloutsig_1_5z | ~(celloutsig_1_9z);
  assign celloutsig_0_22z = celloutsig_0_20z[12] | ~(celloutsig_0_16z);
  assign celloutsig_0_1z = in_data[81] | celloutsig_0_0z;
  assign celloutsig_0_18z = celloutsig_0_14z | celloutsig_0_15z[7];
  assign celloutsig_0_44z = celloutsig_0_8z ^ celloutsig_0_22z;
  assign celloutsig_1_4z = in_data[188] ^ celloutsig_1_0z;
  assign celloutsig_1_19z = celloutsig_1_7z ^ celloutsig_1_9z;
  assign celloutsig_0_10z = celloutsig_0_0z ^ celloutsig_0_3z;
  assign celloutsig_0_31z = celloutsig_0_30z[2] ^ celloutsig_0_10z;
  assign celloutsig_0_48z = ~(celloutsig_0_10z ^ celloutsig_0_13z);
  assign celloutsig_1_2z = ~(in_data[111] ^ celloutsig_1_0z);
  always_ff @(negedge clkin_data[32], negedge clkin_data[64])
    if (!clkin_data[64]) _01_ <= 22'h000000;
    else _01_ <= { celloutsig_0_20z[10:4], celloutsig_0_38z, celloutsig_0_9z, celloutsig_0_52z };
  always_ff @(posedge clkin_data[32], posedge clkin_data[64])
    if (clkin_data[64]) _02_ <= 7'h00;
    else _02_ <= { celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_5z };
  reg [6:0] _30_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _30_ <= 7'h00;
    else _30_ <= { celloutsig_0_25z[6:1], celloutsig_0_8z };
  assign { _03_[6], _00_, _03_[4:0] } = _30_;
  assign celloutsig_0_21z = { celloutsig_0_15z[6:0], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_2z, _02_, celloutsig_0_8z, celloutsig_0_4z } & { in_data[41:35], celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_11z };
  assign celloutsig_0_32z = { in_data[6:4], celloutsig_0_24z } & { celloutsig_0_28z[1:0], celloutsig_0_17z, celloutsig_0_10z };
  assign celloutsig_1_7z = in_data[148:142] === { celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_5z };
  assign celloutsig_1_15z = { celloutsig_1_11z, celloutsig_1_7z, celloutsig_1_11z } === celloutsig_1_12z[5:3];
  assign celloutsig_0_11z = { in_data[32:24], celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_3z } === { celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_1_13z = celloutsig_1_12z >= { celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_11z, celloutsig_1_9z };
  assign celloutsig_0_4z = in_data[82:72] > in_data[74:64];
  assign celloutsig_0_68z = { in_data[66:65], celloutsig_0_4z, celloutsig_0_41z } > { celloutsig_0_52z[5:4], celloutsig_0_43z, celloutsig_0_61z };
  assign celloutsig_0_38z = { in_data[61:57], celloutsig_0_10z } <= { celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_13z };
  assign celloutsig_1_0z = in_data[155:150] <= in_data[190:185];
  assign celloutsig_1_1z = in_data[189:178] <= in_data[156:145];
  assign celloutsig_1_8z = { in_data[119:107], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_7z } <= { celloutsig_1_3z[7:1], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_7z };
  assign celloutsig_0_50z = { celloutsig_0_15z[6:0], celloutsig_0_41z } || { celloutsig_0_21z[19:17], celloutsig_0_32z, celloutsig_0_18z };
  assign celloutsig_0_2z = { in_data[44:41], celloutsig_0_1z } || in_data[72:68];
  assign celloutsig_0_9z = in_data[59] & ~(celloutsig_0_1z);
  assign celloutsig_0_24z = celloutsig_0_1z & ~(celloutsig_0_4z);
  assign celloutsig_0_27z = { celloutsig_0_25z[4:1], celloutsig_0_2z, celloutsig_0_13z } * { celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_18z };
  assign celloutsig_0_52z = celloutsig_0_19z ? { celloutsig_0_45z, celloutsig_0_11z, celloutsig_0_50z } : { celloutsig_0_28z[9:2], celloutsig_0_16z, celloutsig_0_44z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_48z };
  assign celloutsig_1_3z = celloutsig_1_2z ? { in_data[156:153], celloutsig_1_0z, celloutsig_1_1z, 2'h3, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z } : in_data[134:124];
  assign celloutsig_1_12z = - celloutsig_1_3z[9:3];
  assign celloutsig_0_15z = - { celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_7z };
  assign celloutsig_0_25z = - { celloutsig_0_5z, celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_28z = - { celloutsig_0_21z[12:2], celloutsig_0_13z };
  assign celloutsig_0_54z = ~^ celloutsig_0_27z;
  assign celloutsig_0_8z = ~^ { in_data[39:37], celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_0_16z = ~^ { celloutsig_0_5z, celloutsig_0_15z };
  assign celloutsig_0_5z = ^ { in_data[41:24], celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_69z = ^ { celloutsig_0_64z, celloutsig_0_54z, celloutsig_0_46z };
  assign celloutsig_1_5z = ^ celloutsig_1_3z[7:2];
  assign celloutsig_1_18z = ^ { celloutsig_1_6z, celloutsig_1_13z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_9z, celloutsig_1_15z, celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_15z };
  assign celloutsig_0_19z = ^ { celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_7z };
  assign celloutsig_0_20z = { in_data[61], celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_15z } ~^ { _02_[2:1], celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_16z, celloutsig_0_3z, celloutsig_0_14z };
  assign celloutsig_0_30z = { celloutsig_0_27z[0], celloutsig_0_16z, celloutsig_0_8z } ~^ _02_[2:0];
  assign celloutsig_0_64z = ~((celloutsig_0_14z & celloutsig_0_31z) | _01_[8]);
  always_latch
    if (!clkin_data[64]) celloutsig_0_45z = 11'h000;
    else if (celloutsig_1_19z) celloutsig_0_45z = { in_data[8:4], celloutsig_0_34z, celloutsig_0_35z, celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_22z, celloutsig_0_9z };
  assign celloutsig_0_41z = ~((celloutsig_0_15z[7] & celloutsig_0_15z[0]) | (celloutsig_0_4z & celloutsig_0_24z));
  assign celloutsig_0_13z = ~((celloutsig_0_1z & celloutsig_0_6z) | (celloutsig_0_8z & celloutsig_0_6z));
  assign _03_[5] = _00_;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_68z, celloutsig_0_69z };
endmodule
