/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [12:0] _00_;
  reg [6:0] _01_;
  reg [15:0] _02_;
  wire celloutsig_0_0z;
  wire [18:0] celloutsig_0_10z;
  wire [17:0] celloutsig_0_11z;
  wire [8:0] celloutsig_0_12z;
  wire [19:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [15:0] celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire [17:0] celloutsig_0_20z;
  wire [4:0] celloutsig_0_21z;
  wire [11:0] celloutsig_0_25z;
  wire [4:0] celloutsig_0_26z;
  wire [2:0] celloutsig_0_27z;
  wire [11:0] celloutsig_0_28z;
  wire [8:0] celloutsig_0_2z;
  wire [6:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [20:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [8:0] celloutsig_0_39z;
  wire [9:0] celloutsig_0_3z;
  wire [6:0] celloutsig_0_43z;
  wire [3:0] celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire [3:0] celloutsig_0_48z;
  wire [3:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [10:0] celloutsig_0_53z;
  wire celloutsig_0_56z;
  wire [2:0] celloutsig_0_5z;
  wire [2:0] celloutsig_0_64z;
  wire [6:0] celloutsig_0_66z;
  wire celloutsig_0_67z;
  wire celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire [5:0] celloutsig_0_7z;
  wire [3:0] celloutsig_0_85z;
  wire [2:0] celloutsig_0_86z;
  wire celloutsig_0_8z;
  wire [4:0] celloutsig_0_9z;
  wire [7:0] celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [5:0] celloutsig_1_13z;
  wire [14:0] celloutsig_1_14z;
  wire [5:0] celloutsig_1_17z;
  wire [22:0] celloutsig_1_18z;
  wire [7:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [9:0] celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [4:0] celloutsig_1_5z;
  wire [14:0] celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire [3:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  always_ff @(negedge clkin_data[32], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _00_ <= 13'h0000;
    else _00_ <= { celloutsig_0_16z[1:0], celloutsig_0_33z, celloutsig_0_2z, celloutsig_0_17z };
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _01_ <= 7'h00;
    else _01_ <= { celloutsig_0_12z[5:0], celloutsig_0_4z };
  always_ff @(posedge clkin_data[32], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _02_ <= 16'h0000;
    else _02_ <= { celloutsig_0_3z[8:4], celloutsig_0_21z, celloutsig_0_7z };
  assign celloutsig_0_48z = celloutsig_0_45z | _01_[6:3];
  assign celloutsig_0_64z = { celloutsig_0_1z[2:1], celloutsig_0_36z } | celloutsig_0_43z[2:0];
  assign celloutsig_0_7z = { celloutsig_0_2z[7:4], celloutsig_0_6z, celloutsig_0_0z } | { celloutsig_0_1z[1:0], celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_1_3z = { in_data[133:132], celloutsig_1_0z } | { in_data[169], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_9z = { celloutsig_0_5z[1:0], celloutsig_0_1z } | { celloutsig_0_3z[7:5], celloutsig_0_8z, celloutsig_0_4z };
  assign celloutsig_1_7z = { celloutsig_1_6z[7], celloutsig_1_4z, celloutsig_1_4z } | in_data[181:179];
  assign celloutsig_1_8z = celloutsig_1_5z[4:1] | celloutsig_1_2z[7:4];
  assign celloutsig_1_14z = { celloutsig_1_6z[4:2], celloutsig_1_2z, celloutsig_1_11z, celloutsig_1_1z } | { celloutsig_1_8z[3], celloutsig_1_8z, celloutsig_1_13z, celloutsig_1_8z };
  assign celloutsig_1_19z = celloutsig_1_6z[13:6] | { celloutsig_1_2z[4:2], celloutsig_1_5z };
  assign celloutsig_0_11z = { celloutsig_0_9z[3:1], celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_4z } | { in_data[68:61], celloutsig_0_3z };
  assign celloutsig_0_12z = { celloutsig_0_2z[7:0], celloutsig_0_4z } | { celloutsig_0_11z[17:15], celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_8z };
  assign celloutsig_0_1z = { in_data[83:82], celloutsig_0_0z } | { in_data[52:51], celloutsig_0_0z };
  assign celloutsig_0_19z = { celloutsig_0_9z[3:0], celloutsig_0_16z, celloutsig_0_2z } | { celloutsig_0_5z, celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_9z };
  assign celloutsig_0_20z = { celloutsig_0_19z[12:4], celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_16z } | { celloutsig_0_14z[14:11], celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_18z, celloutsig_0_9z, celloutsig_0_1z };
  assign celloutsig_0_21z = celloutsig_0_19z[7:3] | { celloutsig_0_2z[6:3], celloutsig_0_4z };
  assign celloutsig_0_25z = { celloutsig_0_2z[7:2], celloutsig_0_7z } | _02_[13:2];
  assign celloutsig_0_26z = { celloutsig_0_19z[4:1], celloutsig_0_17z } | _01_[6:2];
  assign celloutsig_0_30z = { celloutsig_0_26z, celloutsig_0_6z, celloutsig_0_17z } | { celloutsig_0_12z[5:3], celloutsig_0_15z, celloutsig_0_1z };
  assign celloutsig_0_33z = ^ celloutsig_0_14z[9:5];
  assign celloutsig_0_36z = ^ { celloutsig_0_9z[4:2], celloutsig_0_1z };
  assign celloutsig_0_4z = ^ in_data[84:75];
  assign celloutsig_0_56z = ^ { celloutsig_0_28z[9:2], celloutsig_0_2z, celloutsig_0_48z, celloutsig_0_4z, celloutsig_0_7z };
  assign celloutsig_0_6z = ^ celloutsig_0_2z[7:1];
  assign celloutsig_0_67z = ^ celloutsig_0_20z[11:4];
  assign celloutsig_1_4z = ^ celloutsig_1_3z[7:2];
  assign celloutsig_1_9z = ^ { celloutsig_1_3z[5:4], celloutsig_1_7z };
  assign celloutsig_0_15z = ^ { _01_[5:1], celloutsig_0_0z };
  assign celloutsig_0_18z = ^ { celloutsig_0_10z[8:6], celloutsig_0_8z };
  assign celloutsig_0_31z = ^ celloutsig_0_21z[4:1];
  assign celloutsig_0_35z = { celloutsig_0_2z[7:3], celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_31z, celloutsig_0_33z, celloutsig_0_1z } >> { celloutsig_0_14z[19:3], celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_39z = { celloutsig_0_12z[6:0], celloutsig_0_31z, celloutsig_0_18z } >> { celloutsig_0_1z, celloutsig_0_21z, celloutsig_0_36z };
  assign celloutsig_0_43z = { celloutsig_0_30z[6:1], celloutsig_0_36z } >> { celloutsig_0_35z[13:8], celloutsig_0_36z };
  assign celloutsig_0_49z = celloutsig_0_9z[3:0] >> { celloutsig_0_46z, celloutsig_0_27z };
  assign celloutsig_0_5z = celloutsig_0_3z[2:0] >> celloutsig_0_2z[6:4];
  assign celloutsig_0_53z = celloutsig_0_19z[12:2] >> { celloutsig_0_5z[2:1], celloutsig_0_39z };
  assign celloutsig_0_85z = celloutsig_0_66z[5:2] >> { celloutsig_0_7z[5:3], celloutsig_0_4z };
  assign celloutsig_0_86z = { celloutsig_0_25z[6], celloutsig_0_69z, celloutsig_0_17z } >> celloutsig_0_14z[12:10];
  assign celloutsig_1_0z = in_data[111:104] >> in_data[183:176];
  assign celloutsig_1_2z = { celloutsig_1_0z[7:1], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z } >> { celloutsig_1_0z[2:1], celloutsig_1_0z };
  assign celloutsig_1_5z = celloutsig_1_3z[6:2] >> in_data[147:143];
  assign celloutsig_1_6z = { celloutsig_1_2z[8:3], celloutsig_1_4z, celloutsig_1_0z } >> { in_data[164:155], celloutsig_1_5z };
  assign celloutsig_1_10z = { celloutsig_1_6z[13:11], celloutsig_1_9z } >> { celloutsig_1_2z[9:7], celloutsig_1_9z };
  assign celloutsig_1_13z = { celloutsig_1_11z, celloutsig_1_5z } >> { celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_4z };
  assign celloutsig_1_18z = { celloutsig_1_6z[11:3], celloutsig_1_8z, celloutsig_1_8z, celloutsig_1_17z } >> { celloutsig_1_6z[13:3], celloutsig_1_0z, celloutsig_1_10z };
  assign celloutsig_0_14z = { celloutsig_0_10z[18:2], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_0z } >> { celloutsig_0_3z[2], celloutsig_0_8z, celloutsig_0_11z };
  assign celloutsig_0_16z = celloutsig_0_9z[4:2] >> in_data[8:6];
  assign celloutsig_0_2z = { in_data[34:27], celloutsig_0_0z } >> { in_data[87:84], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_27z = celloutsig_0_10z[12:10] >> celloutsig_0_11z[17:15];
  assign celloutsig_0_3z = { celloutsig_0_2z[3:2], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z } ^ in_data[32:23];
  assign celloutsig_0_45z = _00_[5:2] ^ { celloutsig_0_20z[2:0], celloutsig_0_6z };
  assign celloutsig_0_66z = { celloutsig_0_49z[3], celloutsig_0_27z, celloutsig_0_64z } ^ celloutsig_0_53z[10:4];
  assign celloutsig_0_10z = { celloutsig_0_7z[3:1], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_7z } ^ { in_data[82:73], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_9z };
  assign celloutsig_1_17z = { celloutsig_1_14z[9:8], celloutsig_1_1z, celloutsig_1_7z } ^ { celloutsig_1_10z[2], celloutsig_1_10z, celloutsig_1_11z };
  assign celloutsig_0_28z = { celloutsig_0_14z[11:1], celloutsig_0_6z } ^ celloutsig_0_20z[15:4];
  assign celloutsig_0_0z = ~((in_data[31] & in_data[26]) | in_data[32]);
  assign celloutsig_0_32z = ~((celloutsig_0_3z[9] & celloutsig_0_12z[1]) | celloutsig_0_1z[2]);
  assign celloutsig_0_46z = ~((celloutsig_0_32z & celloutsig_0_4z) | celloutsig_0_33z);
  assign celloutsig_0_69z = ~((celloutsig_0_56z & celloutsig_0_45z[1]) | celloutsig_0_67z);
  assign celloutsig_0_8z = ~((celloutsig_0_3z[7] & celloutsig_0_6z) | celloutsig_0_1z[1]);
  assign celloutsig_1_1z = ~((celloutsig_1_0z[6] & in_data[187]) | celloutsig_1_0z[3]);
  assign celloutsig_1_11z = ~((celloutsig_1_9z & in_data[122]) | celloutsig_1_2z[7]);
  assign celloutsig_0_17z = ~((celloutsig_0_1z[0] & celloutsig_0_16z[0]) | celloutsig_0_7z[3]);
  assign { out_data[150:128], out_data[103:96], out_data[35:32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_85z, celloutsig_0_86z };
endmodule
