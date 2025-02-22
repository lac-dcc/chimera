/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [12:0] _01_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [22:0] celloutsig_0_12z;
  wire [9:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [4:0] celloutsig_0_19z;
  wire [6:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire celloutsig_0_37z;
  wire celloutsig_0_39z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire [15:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [7:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [7:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [16:0] celloutsig_1_6z;
  wire [22:0] celloutsig_1_7z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_41z = celloutsig_0_21z ? celloutsig_0_8z : celloutsig_0_7z;
  assign celloutsig_0_44z = celloutsig_0_32z ? celloutsig_0_17z : celloutsig_0_31z;
  assign celloutsig_1_2z = celloutsig_1_1z ? celloutsig_1_0z : in_data[138];
  assign celloutsig_1_10z = celloutsig_1_6z[14] ? celloutsig_1_4z : celloutsig_1_0z;
  assign celloutsig_0_14z = celloutsig_0_10z ? celloutsig_0_5z[1] : 1'h0;
  assign celloutsig_0_17z = celloutsig_0_7z ? celloutsig_0_16z : in_data[74];
  assign celloutsig_0_29z = _00_ ? celloutsig_0_12z[10] : celloutsig_0_21z;
  assign celloutsig_0_31z = ~(celloutsig_0_22z & celloutsig_0_17z);
  assign celloutsig_0_34z = ~(celloutsig_0_7z & celloutsig_0_18z);
  assign celloutsig_0_37z = ~(celloutsig_0_28z & celloutsig_0_12z[17]);
  assign celloutsig_0_45z = ~(celloutsig_0_44z & celloutsig_0_5z[2]);
  assign celloutsig_1_1z = ~(in_data[177] & celloutsig_1_0z);
  assign celloutsig_1_3z = ~(celloutsig_1_2z & in_data[140]);
  assign celloutsig_0_6z = ~(celloutsig_0_4z & in_data[31]);
  assign celloutsig_0_10z = ~(celloutsig_0_2z & celloutsig_0_5z[1]);
  assign celloutsig_0_16z = ~(in_data[19] & celloutsig_0_8z);
  assign celloutsig_0_21z = ~(celloutsig_0_7z & celloutsig_0_2z);
  assign celloutsig_1_0z = ~(in_data[140] | in_data[155]);
  assign celloutsig_0_7z = ~(1'h0 | celloutsig_0_5z[7]);
  assign celloutsig_0_9z = ~(celloutsig_0_1z[4] | in_data[18]);
  assign celloutsig_0_23z = ~((celloutsig_0_14z | celloutsig_0_15z) & celloutsig_0_7z);
  assign celloutsig_1_4z = ~((celloutsig_1_3z | celloutsig_1_1z) & (celloutsig_1_0z | celloutsig_1_2z));
  assign celloutsig_0_8z = ~((celloutsig_0_0z | 1'h0) & (celloutsig_0_4z | celloutsig_0_4z));
  assign celloutsig_0_20z = ~((celloutsig_0_5z[3] | 1'h0) & (celloutsig_0_5z[6] | celloutsig_0_12z[11]));
  assign celloutsig_0_39z = celloutsig_0_19z[2] ^ celloutsig_0_13z[4];
  assign celloutsig_1_11z = celloutsig_1_10z ^ celloutsig_1_3z;
  assign celloutsig_0_30z = in_data[66] ^ celloutsig_0_15z;
  assign celloutsig_0_32z = ~(celloutsig_0_5z[0] ^ celloutsig_0_12z[9]);
  assign celloutsig_1_5z = ~(celloutsig_1_1z ^ celloutsig_1_2z);
  assign celloutsig_0_5z = in_data[52:45] + { in_data[31:30], celloutsig_0_0z, celloutsig_0_4z, 1'h0, celloutsig_0_2z, 1'h0, celloutsig_0_4z };
  assign celloutsig_1_6z = { in_data[168:154], celloutsig_1_2z, celloutsig_1_1z } + { in_data[114:99], celloutsig_1_1z };
  assign celloutsig_1_7z = { celloutsig_1_6z[13:10], celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_4z } + { in_data[162:157], celloutsig_1_6z };
  assign celloutsig_0_12z = { _01_[10:9], _00_, _01_[7:2], celloutsig_0_10z, 1'h0, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_4z } + { in_data[22:18], celloutsig_0_6z, celloutsig_0_0z, _01_[10:9], _00_, _01_[7:1], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_7z };
  assign celloutsig_0_13z[9:1] = { celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_8z, 1'h0, celloutsig_0_2z, 1'h0, celloutsig_0_0z } + { celloutsig_0_1z[4:0], celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_2z };
  reg [9:0] _36_;
  always_ff @(negedge celloutsig_1_19z[0], negedge clkin_data[0])
    if (!clkin_data[0]) _36_ <= 10'h000;
    else _36_ <= { celloutsig_0_5z[4:0], celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_10z };
  assign { _01_[10:9], _00_, _01_[7:1] } = _36_;
  assign celloutsig_0_49z = { celloutsig_0_28z, celloutsig_0_34z, celloutsig_0_31z, _01_[10:9], _00_, _01_[7:1], celloutsig_0_23z, celloutsig_0_37z, celloutsig_0_14z } & { in_data[16:5], celloutsig_0_42z, celloutsig_0_41z, celloutsig_0_45z, celloutsig_0_37z };
  assign celloutsig_1_19z = { celloutsig_1_7z[9:4], celloutsig_1_11z, celloutsig_1_3z } & celloutsig_1_7z[12:5];
  assign celloutsig_0_1z = in_data[32:26] & { in_data[88:84], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_19z = { celloutsig_0_5z[4:1], celloutsig_0_6z } / { 1'h1, celloutsig_0_7z, celloutsig_0_18z, celloutsig_0_4z, celloutsig_0_15z };
  assign celloutsig_0_4z = { in_data[62:50], celloutsig_0_0z, celloutsig_0_2z } && { in_data[27:19], celloutsig_0_1z };
  assign celloutsig_0_2z = in_data[14:9] && { in_data[58:54], celloutsig_0_0z };
  assign celloutsig_0_0z = ! in_data[95:93];
  assign celloutsig_0_22z = ! { celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_20z, celloutsig_0_13z[9:1], celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_16z, celloutsig_0_1z, celloutsig_0_21z, celloutsig_0_1z, celloutsig_0_18z, celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_2z };
  assign celloutsig_0_28z = ! { celloutsig_0_13z[7:1], celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_23z, _01_[10:9], _00_, _01_[7:1], celloutsig_0_18z, celloutsig_0_15z };
  assign celloutsig_0_42z = { celloutsig_0_19z[2:1], 1'h0, celloutsig_0_31z, celloutsig_0_37z, celloutsig_0_32z, celloutsig_0_30z } != { celloutsig_0_24z, celloutsig_0_21z, celloutsig_0_6z, celloutsig_0_23z, celloutsig_0_29z, celloutsig_0_30z, celloutsig_0_22z };
  assign celloutsig_0_50z = { celloutsig_0_13z[7:4], celloutsig_0_39z } != celloutsig_0_12z[6:2];
  assign celloutsig_0_15z = in_data[44:39] != { celloutsig_0_12z[22:18], celloutsig_0_10z };
  assign celloutsig_0_18z = { in_data[57:40], 1'h0, celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_17z, celloutsig_0_2z, celloutsig_0_17z, celloutsig_0_4z } != { in_data[72:30], celloutsig_0_9z, celloutsig_0_9z, _01_[10:9], _00_, _01_[7:1] };
  assign celloutsig_0_24z = { celloutsig_0_1z[2:0], celloutsig_0_15z, celloutsig_0_21z, celloutsig_0_23z } != { celloutsig_0_1z[6:2], celloutsig_0_9z };
  assign { _01_[12:11], _01_[8], _01_[0] } = { celloutsig_0_21z, celloutsig_0_4z, _00_, celloutsig_0_22z };
  assign celloutsig_0_13z[0] = 1'h0;
  assign { out_data[128], out_data[103:96], out_data[47:32], out_data[0] } = { 1'h0, celloutsig_1_19z, celloutsig_0_49z, celloutsig_0_50z };
endmodule
