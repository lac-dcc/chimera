/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [7:0] _00_;
  reg [2:0] _01_;
  reg [16:0] _02_;
  wire celloutsig_0_0z;
  wire [27:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire [2:0] celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_29z;
  wire [14:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire [6:0] celloutsig_0_35z;
  wire celloutsig_0_38z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire [22:0] celloutsig_0_4z;
  wire [8:0] celloutsig_0_5z;
  wire [10:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [13:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_16z = ~(celloutsig_0_15z & celloutsig_0_7z);
  assign celloutsig_1_10z = ~celloutsig_1_6z;
  assign celloutsig_0_31z = ~celloutsig_0_4z[18];
  assign celloutsig_0_34z = ~((celloutsig_0_19z | celloutsig_0_18z) & (celloutsig_0_6z[9] | celloutsig_0_26z));
  assign celloutsig_1_2z = ~((in_data[113] | celloutsig_1_1z[11]) & (celloutsig_1_0z | celloutsig_1_0z));
  assign celloutsig_1_18z = ~((celloutsig_1_13z | celloutsig_1_2z) & (celloutsig_1_12z | celloutsig_1_1z[2]));
  assign celloutsig_1_0z = in_data[173] | ~(in_data[135]);
  assign celloutsig_1_6z = in_data[115] | ~(celloutsig_1_4z);
  assign celloutsig_1_11z = celloutsig_1_9z | ~(celloutsig_1_7z);
  assign celloutsig_0_15z = celloutsig_0_2z[2] | ~(celloutsig_0_0z);
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _02_ <= 17'h00000;
    else _02_ <= celloutsig_0_4z[22:6];
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _01_ <= 3'h0;
    else _01_ <= in_data[85:83];
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _00_ <= 8'h00;
    else _00_ <= _02_[15:8];
  assign celloutsig_0_35z = { _00_[4:3], celloutsig_0_16z, celloutsig_0_24z, celloutsig_0_30z } & { celloutsig_0_10z[26:21], celloutsig_0_32z };
  assign celloutsig_0_10z = { celloutsig_0_2z[8:6], celloutsig_0_9z, celloutsig_0_0z, _01_, celloutsig_0_1z, _01_, celloutsig_0_2z, celloutsig_0_0z } & { in_data[19:5], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_9z };
  assign celloutsig_0_24z = celloutsig_0_10z[15:13] / { 1'h1, celloutsig_0_0z, celloutsig_0_11z };
  assign celloutsig_0_8z = { _01_[1:0], _01_ } === { in_data[47:45], celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_0_20z = { celloutsig_0_10z[21:20], celloutsig_0_6z } === { celloutsig_0_6z[8:0], celloutsig_0_11z, _01_ };
  assign celloutsig_1_12z = { in_data[183:181], celloutsig_1_7z } <= { celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_10z };
  assign celloutsig_0_7z = celloutsig_0_2z[11:0] && { in_data[64:54], celloutsig_0_0z };
  assign celloutsig_1_5z = celloutsig_1_1z[11:6] || { celloutsig_1_1z[10:6], celloutsig_1_0z };
  assign celloutsig_1_9z = { in_data[156:155], celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_3z } || in_data[117:113];
  assign celloutsig_1_13z = { in_data[130:124], celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_10z } || { celloutsig_1_4z, celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_0z, celloutsig_1_12z, celloutsig_1_12z, celloutsig_1_12z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_0z };
  assign celloutsig_0_11z = in_data[91:81] || { celloutsig_0_2z[9:0], celloutsig_0_1z };
  assign celloutsig_0_26z = { in_data[73:71], celloutsig_0_8z } || { celloutsig_0_6z[5:3], celloutsig_0_8z };
  assign celloutsig_0_30z = { _02_[11:4], celloutsig_0_11z, celloutsig_0_29z } || celloutsig_0_6z[10:1];
  assign celloutsig_0_1z = in_data[59:23] < { in_data[91:56], celloutsig_0_0z };
  assign celloutsig_0_29z = { in_data[17:16], celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_7z } < { _02_[11:8], celloutsig_0_22z };
  assign celloutsig_0_38z = { celloutsig_0_35z[3:0], _01_ } != celloutsig_0_6z[8:2];
  assign celloutsig_0_44z = { celloutsig_0_10z[6:1], celloutsig_0_15z, celloutsig_0_34z, celloutsig_0_31z } != { celloutsig_0_4z[20:18], celloutsig_0_38z, celloutsig_0_16z, celloutsig_0_1z, celloutsig_0_43z, celloutsig_0_43z, celloutsig_0_30z };
  assign celloutsig_0_9z = celloutsig_0_2z[7:0] != { in_data[34:28], celloutsig_0_1z };
  assign celloutsig_0_2z = ~ in_data[50:36];
  assign celloutsig_1_3z = | { celloutsig_1_1z[10:5], celloutsig_1_0z };
  assign celloutsig_1_4z = | { celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_1_19z = | { celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_8z };
  assign celloutsig_0_22z = | { in_data[44:38], celloutsig_0_11z };
  assign celloutsig_0_0z = | in_data[95:69];
  assign celloutsig_1_7z = | celloutsig_1_1z[13:7];
  assign celloutsig_1_8z = ~^ { in_data[107:100], celloutsig_1_7z };
  assign celloutsig_0_18z = ~^ celloutsig_0_5z[8:3];
  assign celloutsig_0_32z = ^ celloutsig_0_5z[4:2];
  assign celloutsig_0_4z = { celloutsig_0_2z[14:7], celloutsig_0_2z } << { in_data[34:28], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_5z = { in_data[56:51], _01_ } >> in_data[49:41];
  assign celloutsig_0_6z = celloutsig_0_2z[11:1] >> in_data[58:48];
  assign celloutsig_1_1z = in_data[156:143] <<< in_data[157:144];
  assign celloutsig_0_43z = ~((celloutsig_0_11z & celloutsig_0_20z) | celloutsig_0_38z);
  assign celloutsig_0_19z = ~((in_data[94] & celloutsig_0_5z[2]) | celloutsig_0_8z);
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_43z, celloutsig_0_44z };
endmodule
