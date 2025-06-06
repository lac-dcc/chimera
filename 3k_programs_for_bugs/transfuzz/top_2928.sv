/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [13:0] _00_;
  wire [20:0] _01_;
  reg [4:0] _02_;
  wire [3:0] celloutsig_0_0z;
  wire [5:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [3:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [5:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [7:0] celloutsig_0_19z;
  wire celloutsig_0_20z;
  wire [11:0] celloutsig_0_21z;
  wire [3:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [9:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [12:0] celloutsig_0_29z;
  wire [3:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [10:0] celloutsig_0_31z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [15:0] celloutsig_0_36z;
  wire [5:0] celloutsig_0_37z;
  wire [13:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire [12:0] celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire [3:0] celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire [20:0] celloutsig_0_5z;
  wire [2:0] celloutsig_0_62z;
  wire celloutsig_0_66z;
  wire celloutsig_0_67z;
  wire [10:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [18:0] celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire [6:0] celloutsig_1_11z;
  wire [2:0] celloutsig_1_13z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [14:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [18:0] celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire [18:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_67z = celloutsig_0_62z[0] | ~(celloutsig_0_51z);
  assign celloutsig_1_3z = celloutsig_1_0z[3] | ~(celloutsig_1_2z);
  assign celloutsig_0_66z = celloutsig_0_5z[3] | celloutsig_0_35z;
  assign celloutsig_0_14z = celloutsig_0_6z[6] | celloutsig_0_12z;
  assign celloutsig_0_34z = celloutsig_0_26z ^ celloutsig_0_12z;
  assign celloutsig_0_38z = { celloutsig_0_6z[9], celloutsig_0_29z } + { _00_[13:8], celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_37z };
  assign celloutsig_0_43z = celloutsig_0_38z[13:1] + { celloutsig_0_31z[10:9], celloutsig_0_6z };
  assign celloutsig_0_5z = in_data[93:73] + { in_data[30:27], _01_[16:12], _00_[13:12], _01_[9:5], celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_1_0z = in_data[120:116] + in_data[186:182];
  assign celloutsig_1_7z = { in_data[133:132], celloutsig_1_4z } + celloutsig_1_6z[11:9];
  assign celloutsig_1_8z = { celloutsig_1_6z[14:4], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_0z } + { celloutsig_1_6z[17:1], celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_17z = celloutsig_0_5z[13:8] + { celloutsig_0_10z[5:1], celloutsig_0_8z };
  reg [11:0] _15_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _15_ <= 12'h000;
    else _15_ <= { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign { _01_[16:12], _00_[13:12], _01_[9:5] } = _15_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _02_ <= 5'h00;
    else _02_ <= { celloutsig_0_5z[17:14], celloutsig_0_3z };
  reg [3:0] _17_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _17_ <= 4'h0;
    else _17_ <= celloutsig_0_9z[6:3];
  assign _00_[11:8] = _17_;
  assign celloutsig_1_6z = { in_data[155:138], celloutsig_1_4z } & { in_data[150:138], celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_11z = { celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_7z } & { celloutsig_1_8z[7:2], celloutsig_1_2z };
  assign celloutsig_0_9z = { celloutsig_0_5z[5:2], celloutsig_0_6z, celloutsig_0_0z } & celloutsig_0_5z[18:0];
  assign celloutsig_0_10z = { celloutsig_0_6z[4:1], celloutsig_0_8z, celloutsig_0_7z } & { celloutsig_0_6z[10:9], celloutsig_0_0z };
  assign celloutsig_0_21z = in_data[53:42] & { celloutsig_0_5z[14], celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_2z };
  assign celloutsig_0_51z = { celloutsig_0_5z[19:13], celloutsig_0_5z } == { celloutsig_0_43z[10:8], celloutsig_0_18z, celloutsig_0_39z, celloutsig_0_44z, celloutsig_0_11z, celloutsig_0_42z, celloutsig_0_10z, celloutsig_0_43z, celloutsig_0_18z };
  assign celloutsig_1_4z = in_data[132:126] == in_data[156:150];
  assign celloutsig_1_18z = { celloutsig_1_0z[1], celloutsig_1_11z, celloutsig_1_11z, celloutsig_1_5z, celloutsig_1_17z, celloutsig_1_5z } >= celloutsig_1_8z[18:1];
  assign celloutsig_0_35z = { _02_[4:3], celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_20z, celloutsig_0_15z } > { _01_[15:12], _00_[13:12], _01_[9] };
  assign celloutsig_0_3z = in_data[22:11] > { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_40z = { celloutsig_0_38z[2:0], celloutsig_0_35z, celloutsig_0_0z } > { _01_[16:12], _00_[13:12], _01_[9] };
  assign celloutsig_0_42z = { celloutsig_0_9z[16:11], celloutsig_0_35z, celloutsig_0_35z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_26z, celloutsig_0_15z } > { celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_30z, celloutsig_0_15z, celloutsig_0_40z, celloutsig_0_11z, celloutsig_0_40z, celloutsig_0_40z, celloutsig_0_12z };
  assign celloutsig_0_44z = { celloutsig_0_25z[1:0], celloutsig_0_42z, celloutsig_0_34z } > { celloutsig_0_31z[7:6], celloutsig_0_30z, celloutsig_0_24z };
  assign celloutsig_0_11z = in_data[21:19] > { celloutsig_0_4z[2:1], celloutsig_0_8z };
  assign celloutsig_0_27z = { _01_[16:12], _00_[13:12], _01_[9:7] } > { celloutsig_0_6z[5:0], celloutsig_0_13z };
  assign celloutsig_0_39z = in_data[72:43] <= { celloutsig_0_36z[14:2], celloutsig_0_29z, celloutsig_0_35z, celloutsig_0_3z, celloutsig_0_27z, celloutsig_0_20z };
  assign celloutsig_0_7z = { _00_[13:12], _01_[9:7] } <= celloutsig_0_6z[8:4];
  assign celloutsig_1_9z = { in_data[107:98], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_4z } && celloutsig_1_1z[13:1];
  assign celloutsig_1_2z = celloutsig_1_1z[10] & ~(celloutsig_1_0z[0]);
  assign celloutsig_1_17z = celloutsig_1_8z[16] & ~(celloutsig_1_16z);
  assign celloutsig_0_20z = celloutsig_0_4z[1] & ~(celloutsig_0_15z);
  assign celloutsig_0_6z = { celloutsig_0_0z[3:1], celloutsig_0_4z, celloutsig_0_2z } * { celloutsig_0_5z[18:12], celloutsig_0_4z };
  assign celloutsig_1_1z = in_data[166:152] * in_data[137:123];
  assign celloutsig_1_19z = { celloutsig_1_13z[1], celloutsig_1_2z } !== { celloutsig_1_3z, celloutsig_1_9z };
  assign celloutsig_0_15z = { celloutsig_0_2z[3:2], celloutsig_0_7z } !== celloutsig_0_10z[4:2];
  assign celloutsig_0_18z = celloutsig_0_4z[1:0] !== { celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_30z = celloutsig_0_10z[5:1] !== celloutsig_0_21z[9:5];
  assign celloutsig_0_26z = & celloutsig_0_19z[5:3];
  assign celloutsig_0_12z = celloutsig_0_5z[15] & celloutsig_0_3z;
  assign celloutsig_0_24z = celloutsig_0_2z[1] & celloutsig_0_23z[3];
  assign celloutsig_1_5z = ^ { celloutsig_1_1z[9:6], celloutsig_1_2z };
  assign celloutsig_1_16z = ^ { in_data[173:159], celloutsig_1_2z, celloutsig_1_6z };
  assign celloutsig_0_4z = { _00_[12], _01_[9:7] } >> celloutsig_0_0z;
  assign celloutsig_0_13z = celloutsig_0_4z >> { celloutsig_0_2z[1:0], celloutsig_0_3z, celloutsig_0_7z };
  assign celloutsig_0_29z = { celloutsig_0_2z[1], celloutsig_0_21z } >> { celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_8z, _02_, celloutsig_0_3z, celloutsig_0_14z };
  assign celloutsig_0_0z = in_data[24:21] >>> in_data[7:4];
  assign celloutsig_0_36z = { celloutsig_0_5z[11:8], celloutsig_0_34z, _00_[11:8], celloutsig_0_30z, celloutsig_0_10z } >>> { in_data[19:11], celloutsig_0_3z, celloutsig_0_17z };
  assign celloutsig_0_37z = { celloutsig_0_19z[6], celloutsig_0_13z, celloutsig_0_7z } >>> { celloutsig_0_9z[6:2], celloutsig_0_7z };
  assign celloutsig_0_62z = celloutsig_0_21z[3:1] >>> _02_[4:2];
  assign celloutsig_0_19z = { celloutsig_0_6z[9:7], celloutsig_0_15z, celloutsig_0_4z } >>> { celloutsig_0_10z[5:2], celloutsig_0_0z };
  assign celloutsig_0_25z = { _01_[14:12], _00_[13:12], _01_[9:5] } >>> { celloutsig_0_14z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_23z };
  assign celloutsig_0_31z = { _01_[15:12], _00_[13:12], _01_[9:5] } ~^ celloutsig_0_29z[11:1];
  assign celloutsig_0_23z = celloutsig_0_10z[3:0] ~^ celloutsig_0_10z[5:2];
  assign celloutsig_0_2z = in_data[39:36] ^ { _00_[12], _01_[9:7] };
  assign celloutsig_0_8z = ~((celloutsig_0_7z & celloutsig_0_3z) | (in_data[88] & celloutsig_0_3z));
  assign celloutsig_1_13z[1:0] = { celloutsig_1_7z[0], celloutsig_1_4z } ~^ { celloutsig_1_9z, celloutsig_1_5z };
  assign _00_[7:0] = { celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_37z };
  assign { _01_[20:17], _01_[11:10], _01_[4:0] } = { in_data[30:27], _00_[13:12], celloutsig_0_0z, celloutsig_0_3z };
  assign celloutsig_1_13z[2] = 1'h1;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_66z, celloutsig_0_67z };
endmodule
