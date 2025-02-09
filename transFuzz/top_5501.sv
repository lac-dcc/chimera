/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [7:0] _01_;
  wire [2:0] _02_;
  reg [2:0] _03_;
  wire celloutsig_0_0z;
  wire [2:0] celloutsig_0_10z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [6:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [12:0] celloutsig_0_23z;
  wire [8:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [3:0] celloutsig_0_26z;
  wire celloutsig_0_2z;
  wire [23:0] celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [8:0] celloutsig_0_36z;
  wire celloutsig_0_3z;
  wire [6:0] celloutsig_0_44z;
  wire celloutsig_0_46z;
  wire celloutsig_0_4z;
  reg [26:0] celloutsig_0_54z;
  wire celloutsig_0_5z;
  wire [5:0] celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire celloutsig_0_6z;
  wire [3:0] celloutsig_0_7z;
  wire [4:0] celloutsig_0_8z;
  wire [30:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [5:0] celloutsig_1_18z;
  wire [12:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [4:0] celloutsig_1_3z;
  wire [13:0] celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire [2:0] celloutsig_1_6z;
  wire [7:0] celloutsig_1_7z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_12z = !(celloutsig_0_5z ? celloutsig_0_0z : 1'h1);
  assign celloutsig_0_20z = !(celloutsig_0_4z ? 1'h1 : celloutsig_0_19z);
  assign celloutsig_1_16z = ~(1'h0 | 1'h0);
  assign celloutsig_1_13z = ~((_00_ | celloutsig_1_10z) & celloutsig_1_7z[0]);
  assign celloutsig_0_21z = ~((1'h1 | 1'h1) & celloutsig_0_20z);
  assign celloutsig_0_32z = ~((celloutsig_0_2z | celloutsig_0_30z[16]) & in_data[80]);
  assign celloutsig_0_3z = celloutsig_0_1z[2] | celloutsig_0_1z[5];
  assign celloutsig_0_5z = celloutsig_0_3z | celloutsig_0_0z;
  assign celloutsig_1_14z = celloutsig_1_5z[0] | celloutsig_1_5z[8];
  assign celloutsig_1_17z = celloutsig_1_14z ^ celloutsig_1_1z;
  assign celloutsig_0_15z = celloutsig_0_4z ^ celloutsig_0_5z;
  always_ff @(negedge clkin_data[32], negedge clkin_data[128])
    if (!clkin_data[128]) _01_ <= 8'h00;
    else _01_ <= celloutsig_1_7z;
  reg [2:0] _16_;
  always_ff @(posedge clkin_data[32], negedge clkin_data[128])
    if (!clkin_data[128]) _16_ <= 3'h0;
    else _16_ <= { celloutsig_1_3z[4], celloutsig_1_1z, celloutsig_1_0z };
  assign { _00_, _02_[1:0] } = _16_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _03_ <= 3'h0;
    else _03_ <= { celloutsig_0_14z, celloutsig_0_17z, celloutsig_0_13z };
  assign celloutsig_0_46z = { celloutsig_0_30z[17:13], celloutsig_0_20z, 1'h1, celloutsig_0_25z } == celloutsig_0_36z[8:1];
  assign celloutsig_1_0z = in_data[145:139] == in_data[185:179];
  assign celloutsig_1_15z = { celloutsig_1_4z[13:11], celloutsig_1_1z, 1'h0 } == celloutsig_1_4z[9:5];
  assign celloutsig_0_13z = { 1'h1, celloutsig_0_6z, celloutsig_0_6z } == celloutsig_0_8z[4:2];
  assign celloutsig_0_65z = { _03_, celloutsig_0_21z } > celloutsig_0_54z[19:16];
  assign celloutsig_0_0z = in_data[92:83] && in_data[64:55];
  assign celloutsig_1_1z = { in_data[102], celloutsig_1_0z, celloutsig_1_0z } && { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_4z = ! { in_data[14:11], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_6z = ! celloutsig_0_1z[6:1];
  assign celloutsig_1_10z = ! { _00_, _02_[1], celloutsig_1_6z[2:1], celloutsig_1_4z[11] };
  assign celloutsig_0_17z = ! { celloutsig_0_10z[0], celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_14z = { celloutsig_0_1z[0], celloutsig_0_0z, celloutsig_0_2z } != { celloutsig_0_1z[1:0], celloutsig_0_3z };
  assign celloutsig_0_25z = celloutsig_0_24z[8:1] != { celloutsig_0_18z[3], celloutsig_0_1z };
  assign celloutsig_0_34z = { _03_[2:1], celloutsig_0_20z } !== { celloutsig_0_19z, celloutsig_0_25z, celloutsig_0_2z };
  assign celloutsig_0_23z = ~ { celloutsig_0_13z, celloutsig_0_17z, celloutsig_0_1z, celloutsig_0_15z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_0_26z = ~ { celloutsig_0_8z[2:0], celloutsig_0_21z };
  assign celloutsig_0_2z = celloutsig_0_1z[6] & celloutsig_0_1z[4];
  assign celloutsig_0_19z = | { celloutsig_0_15z, celloutsig_0_12z, celloutsig_0_9z[26], celloutsig_0_2z };
  assign celloutsig_0_24z = { celloutsig_0_23z[11:9], celloutsig_0_19z, celloutsig_0_5z, celloutsig_0_17z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_5z } >> { in_data[58:54], celloutsig_0_7z };
  assign celloutsig_0_36z = { celloutsig_0_4z, celloutsig_0_35z, _03_, celloutsig_0_2z, celloutsig_0_32z, celloutsig_0_4z, 1'h1 } >> { celloutsig_0_26z, celloutsig_0_4z, celloutsig_0_7z };
  assign celloutsig_0_64z = celloutsig_0_9z[29:24] >> celloutsig_0_54z[25:20];
  assign celloutsig_1_19z = { celloutsig_1_4z[13:4], celloutsig_1_16z, celloutsig_1_16z, celloutsig_1_17z } >> { in_data[114:109], celloutsig_1_6z[2:1], celloutsig_1_4z[11], celloutsig_1_1z, celloutsig_1_6z[2:1], celloutsig_1_4z[11] };
  assign celloutsig_0_9z = { celloutsig_0_1z[4:0], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_7z } >> in_data[44:14];
  assign celloutsig_0_7z = in_data[10:7] <<< in_data[81:78];
  assign celloutsig_1_18z = { celloutsig_1_3z[1], celloutsig_1_3z[4], 2'h3, celloutsig_1_3z[1:0] } <<< { _01_[6:3], celloutsig_1_15z, celloutsig_1_13z };
  assign celloutsig_1_4z = { in_data[180:168], celloutsig_1_1z } - in_data[185:172];
  assign celloutsig_1_6z[2:1] = celloutsig_1_4z[13:12] - in_data[146:145];
  assign celloutsig_0_8z = { celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_6z } ~^ celloutsig_0_1z[4:0];
  assign celloutsig_0_1z = in_data[91:85] ~^ in_data[57:51];
  assign celloutsig_0_30z = celloutsig_0_9z[23:0] ~^ in_data[40:17];
  always_latch
    if (clkin_data[96]) celloutsig_0_54z = 27'h0000000;
    else if (celloutsig_1_18z[0]) celloutsig_0_54z = { celloutsig_0_44z[6:1], 1'h1, celloutsig_0_21z, celloutsig_0_46z, celloutsig_0_25z, celloutsig_0_7z, celloutsig_0_23z };
  assign celloutsig_1_7z[2] = ~ celloutsig_1_4z[8];
  assign celloutsig_1_7z[3] = ~ celloutsig_1_4z[9];
  assign celloutsig_0_10z[0] = celloutsig_0_2z ~^ celloutsig_0_1z[2];
  assign { celloutsig_1_3z[1:0], celloutsig_1_3z[4] } = ~ { celloutsig_1_1z, celloutsig_1_0z, in_data[152] };
  assign { celloutsig_0_18z[1], celloutsig_0_18z[3:2] } = { celloutsig_0_15z, celloutsig_0_9z[2:1] } ~^ { celloutsig_0_0z, celloutsig_0_1z[3], celloutsig_0_3z };
  assign { celloutsig_0_44z[1], celloutsig_0_44z[3:2], celloutsig_0_44z[4], celloutsig_0_44z[5], celloutsig_0_44z[6] } = ~ { celloutsig_0_35z, celloutsig_0_34z, celloutsig_0_25z, celloutsig_0_19z, celloutsig_0_13z, celloutsig_0_3z };
  assign { celloutsig_1_5z[8:5], celloutsig_1_5z[1:0], celloutsig_1_5z[4] } = ~ { celloutsig_1_4z[9:6], celloutsig_1_3z[1:0], celloutsig_1_3z[4] };
  assign { celloutsig_1_7z[7:5], celloutsig_1_7z[1:0], celloutsig_1_7z[4] } = { celloutsig_1_5z[7:5], celloutsig_1_5z[1:0], celloutsig_1_5z[4] } ~^ { celloutsig_1_4z[13:11], celloutsig_1_4z[7:6], celloutsig_1_4z[10] };
  assign celloutsig_0_35z = ~celloutsig_0_24z[4];
  assign _02_[2] = _00_;
  assign celloutsig_0_10z[2:1] = 2'h3;
  assign celloutsig_0_18z[0] = celloutsig_0_4z;
  assign celloutsig_0_44z[0] = 1'h0;
  assign celloutsig_1_3z[3:2] = 2'h3;
  assign celloutsig_1_5z[3:2] = 2'h0;
  assign celloutsig_1_6z[0] = celloutsig_1_4z[11];
  assign { out_data[133:128], out_data[108:96], out_data[37:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_64z, celloutsig_0_65z };
endmodule
