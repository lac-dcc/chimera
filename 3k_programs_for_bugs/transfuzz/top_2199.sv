/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [5:0] _00_;
  reg [14:0] _01_;
  wire [20:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [5:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [24:0] celloutsig_0_14z;
  wire [8:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [11:0] celloutsig_0_17z;
  wire [6:0] celloutsig_0_18z;
  wire [21:0] celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire [13:0] celloutsig_0_29z;
  wire [23:0] celloutsig_0_2z;
  wire [5:0] celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire [2:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [31:0] celloutsig_0_36z;
  wire [17:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [6:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_49z;
  wire [4:0] celloutsig_0_4z;
  wire celloutsig_0_58z;
  wire [28:0] celloutsig_0_5z;
  wire [5:0] celloutsig_0_60z;
  wire celloutsig_0_63z;
  wire celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire [9:0] celloutsig_1_11z;
  wire [13:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_14z;
  wire [7:0] celloutsig_1_18z;
  wire [4:0] celloutsig_1_19z;
  wire [28:0] celloutsig_1_1z;
  wire [5:0] celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire [12:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [10:0] celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_35z = celloutsig_0_0z[17] ^ celloutsig_0_28z;
  assign celloutsig_1_0z = in_data[104] ^ in_data[167];
  assign celloutsig_0_40z = ~(celloutsig_0_5z[28] ^ celloutsig_0_10z);
  assign celloutsig_0_45z = ~(celloutsig_0_11z[3] ^ celloutsig_0_19z[13]);
  assign celloutsig_0_16z = ~(celloutsig_0_3z[6] ^ celloutsig_0_13z);
  assign celloutsig_0_23z = ~(celloutsig_0_2z[13] ^ celloutsig_0_8z);
  always_ff @(negedge celloutsig_1_19z[0], posedge clkin_data[0])
    if (clkin_data[0]) _00_ <= 6'h00;
    else _00_ <= { celloutsig_0_34z[2], celloutsig_0_13z, celloutsig_0_45z, celloutsig_0_46z, celloutsig_0_42z, celloutsig_0_45z };
  always_ff @(negedge celloutsig_1_19z[0], negedge clkin_data[0])
    if (!clkin_data[0]) _01_ <= 15'h0000;
    else _01_ <= in_data[47:33];
  assign celloutsig_0_63z = ! { celloutsig_0_37z[9:5], celloutsig_0_21z, celloutsig_0_60z };
  assign celloutsig_0_12z = ! { celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_8z };
  assign celloutsig_0_41z = celloutsig_0_37z[10:3] < celloutsig_0_36z[18:11];
  assign celloutsig_0_42z = celloutsig_0_29z[12:1] < { celloutsig_0_24z, celloutsig_0_41z, celloutsig_0_9z, celloutsig_0_35z, celloutsig_0_26z, celloutsig_0_30z, celloutsig_0_13z };
  assign celloutsig_0_64z = { celloutsig_0_19z[20:16], celloutsig_0_16z, celloutsig_0_28z, celloutsig_0_35z, celloutsig_0_63z } < { _00_[4:2], celloutsig_0_49z, celloutsig_0_4z };
  assign celloutsig_0_65z = { celloutsig_0_14z[11], celloutsig_0_30z, _00_, celloutsig_0_9z } < { _01_[5:1], celloutsig_0_38z, celloutsig_0_38z, celloutsig_0_4z, celloutsig_0_58z, celloutsig_0_9z };
  assign celloutsig_0_8z = { celloutsig_0_0z[7:0], celloutsig_0_5z } < { in_data[37:6], celloutsig_0_4z };
  assign celloutsig_0_26z = { celloutsig_0_19z[19:1], celloutsig_0_12z } < { celloutsig_0_2z[19:4], celloutsig_0_1z, celloutsig_0_24z };
  assign celloutsig_0_28z = { celloutsig_0_11z, celloutsig_0_1z } < { celloutsig_0_2z[6:1], celloutsig_0_25z, celloutsig_0_16z, celloutsig_0_20z };
  assign celloutsig_0_32z = celloutsig_0_17z[3:0] < { in_data[82:80], celloutsig_0_20z };
  assign celloutsig_0_39z = celloutsig_0_34z[1] & ~(celloutsig_0_3z[5]);
  assign celloutsig_0_9z = celloutsig_0_5z[8] & ~(celloutsig_0_5z[14]);
  assign celloutsig_0_20z = celloutsig_0_1z[0] & ~(celloutsig_0_10z);
  assign celloutsig_0_21z = celloutsig_0_10z & ~(celloutsig_0_1z[0]);
  assign celloutsig_0_25z = celloutsig_0_5z[28] & ~(celloutsig_0_17z[2]);
  assign celloutsig_0_37z = { celloutsig_0_30z[3:1], celloutsig_0_11z, celloutsig_0_15z } % { 1'h1, celloutsig_0_0z[18:9], celloutsig_0_3z };
  assign celloutsig_0_4z = in_data[15:11] % { 1'h1, celloutsig_0_3z[0], celloutsig_0_1z };
  assign celloutsig_1_19z = celloutsig_1_8z[6:2] % { 1'h1, celloutsig_1_12z[12], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_6z };
  assign celloutsig_0_14z = { celloutsig_0_3z[3:0], celloutsig_0_0z } % { 1'h1, celloutsig_0_2z[8:0], celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_3z };
  assign celloutsig_0_19z = { celloutsig_0_14z[13:2], celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_18z } % { 1'h1, celloutsig_0_14z[20:1], celloutsig_0_9z };
  assign celloutsig_0_29z = celloutsig_0_0z[15:2] % { 1'h1, celloutsig_0_17z[1:0], celloutsig_0_7z, celloutsig_0_21z, celloutsig_0_9z, celloutsig_0_26z, celloutsig_0_26z, celloutsig_0_12z, celloutsig_0_24z, celloutsig_0_24z, celloutsig_0_24z, celloutsig_0_20z, celloutsig_0_13z };
  assign celloutsig_0_0z = in_data[22:2] * in_data[73:53];
  assign celloutsig_0_60z = { celloutsig_0_3z[6:2], celloutsig_0_12z } * _00_;
  assign celloutsig_1_8z = celloutsig_1_4z[11:1] * celloutsig_1_4z[11:1];
  assign celloutsig_1_10z = celloutsig_1_2z[5:2] * celloutsig_1_1z[20:17];
  assign celloutsig_1_12z = { in_data[152:144], celloutsig_1_10z, celloutsig_1_0z } * { celloutsig_1_11z[7], celloutsig_1_4z };
  assign celloutsig_0_1z = in_data[95:93] * celloutsig_0_0z[4:2];
  assign celloutsig_0_30z = { celloutsig_0_15z[5:1], celloutsig_0_23z } * in_data[82:77];
  assign celloutsig_0_3z = { in_data[79:76], celloutsig_0_1z } | celloutsig_0_2z[6:0];
  assign celloutsig_1_4z = { celloutsig_1_1z[6:3], celloutsig_1_2z, celloutsig_1_3z } | in_data[134:122];
  assign celloutsig_0_15z = celloutsig_0_0z[9:1] | { celloutsig_0_14z[7:1], celloutsig_0_9z, celloutsig_0_10z };
  assign celloutsig_0_17z = celloutsig_0_5z[24:13] | { celloutsig_0_0z[6], celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_15z };
  assign celloutsig_0_2z = { celloutsig_0_0z[17:15], celloutsig_0_0z } | in_data[84:61];
  assign celloutsig_0_58z = celloutsig_0_40z & _01_[13];
  assign celloutsig_0_6z = celloutsig_0_3z[6] & celloutsig_0_4z[0];
  assign celloutsig_1_5z = celloutsig_1_4z[9] & celloutsig_1_3z[1];
  assign celloutsig_1_6z = celloutsig_1_2z[4] & celloutsig_1_4z[12];
  assign celloutsig_0_7z = celloutsig_0_6z & celloutsig_0_0z[18];
  assign celloutsig_0_10z = celloutsig_0_2z[17] & in_data[18];
  assign celloutsig_0_38z = ~^ celloutsig_0_37z[15:13];
  assign celloutsig_0_46z = ~^ { celloutsig_0_37z[10:3], celloutsig_0_26z, celloutsig_0_20z };
  assign celloutsig_0_49z = ~^ { celloutsig_0_5z[28:26], celloutsig_0_39z, celloutsig_0_30z };
  assign celloutsig_0_13z = ~^ { celloutsig_0_2z[17:7], celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_0_24z = ~^ { celloutsig_0_5z[24:16], celloutsig_0_13z };
  assign celloutsig_0_36z = { celloutsig_0_2z[18:14], celloutsig_0_32z, celloutsig_0_26z, celloutsig_0_23z, celloutsig_0_2z } >>> { celloutsig_0_5z[7:1], celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_6z };
  assign celloutsig_0_5z = { in_data[40], celloutsig_0_0z, celloutsig_0_3z } >>> { celloutsig_0_2z[23:1], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_1z = { in_data[161:135], celloutsig_1_0z, celloutsig_1_0z } >>> in_data[137:109];
  assign celloutsig_1_2z = { in_data[150:146], celloutsig_1_0z } >>> celloutsig_1_1z[20:15];
  assign celloutsig_1_11z = { celloutsig_1_4z[5:1], celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_3z } >>> { in_data[187:179], celloutsig_1_0z };
  assign celloutsig_1_3z = celloutsig_1_1z[13:11] - in_data[107:105];
  assign celloutsig_1_14z = celloutsig_1_2z[3:0] - celloutsig_1_11z[7:4];
  assign celloutsig_1_18z = celloutsig_1_11z[9:2] - { celloutsig_1_10z[3:1], celloutsig_1_5z, celloutsig_1_14z };
  assign celloutsig_0_11z = { celloutsig_0_4z[2:0], celloutsig_0_1z } - { in_data[19:15], celloutsig_0_7z };
  assign celloutsig_0_18z = celloutsig_0_14z[16:10] - { celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_1z };
  assign celloutsig_0_34z = celloutsig_0_3z[4:2] - { celloutsig_0_12z, celloutsig_0_24z, celloutsig_0_12z };
  assign { out_data[135:128], out_data[100:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_64z, celloutsig_0_65z };
endmodule
