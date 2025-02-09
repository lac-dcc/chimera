/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [2:0] _01_;
  wire [2:0] _02_;
  reg [4:0] _03_;
  wire celloutsig_0_0z;
  wire [4:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [5:0] celloutsig_0_13z;
  wire [7:0] celloutsig_0_14z;
  wire [15:0] celloutsig_0_15z;
  wire [7:0] celloutsig_0_16z;
  wire [6:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [29:0] celloutsig_0_20z;
  wire [8:0] celloutsig_0_2z;
  wire [7:0] celloutsig_0_30z;
  wire [4:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire [28:0] celloutsig_1_0z;
  wire [16:0] celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire [2:0] celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [9:0] celloutsig_1_18z;
  wire [4:0] celloutsig_1_19z;
  wire [6:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [5:0] celloutsig_1_4z;
  wire [6:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [4:0] celloutsig_1_8z;
  wire [5:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_33z = celloutsig_0_20z[19] ? celloutsig_0_16z[3] : celloutsig_0_20z[2];
  assign celloutsig_1_6z = celloutsig_1_5z[1] ? celloutsig_1_3z : celloutsig_1_1z[4];
  assign celloutsig_0_11z = _00_ ? celloutsig_0_7z : in_data[45];
  assign celloutsig_1_2z = !(in_data[167] ? celloutsig_1_1z[6] : in_data[163]);
  assign celloutsig_1_7z = !(celloutsig_1_6z ? celloutsig_1_3z : celloutsig_1_5z[5]);
  always_ff @(posedge clkin_data[64], posedge clkin_data[96])
    if (clkin_data[96]) _01_ <= 3'h0;
    else _01_ <= celloutsig_1_5z[4:2];
  reg [2:0] _10_;
  always_ff @(posedge clkin_data[32], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _10_ <= 3'h0;
    else _10_ <= { celloutsig_0_2z[2], celloutsig_0_4z, celloutsig_0_4z };
  assign { _00_, _02_[1:0] } = _10_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _03_ <= 5'h00;
    else _03_ <= { celloutsig_0_18z[5:2], celloutsig_0_12z };
  assign celloutsig_1_1z = in_data[180:174] & celloutsig_1_0z[23:17];
  assign celloutsig_1_10z = { celloutsig_1_0z[27:20], celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_7z } & { celloutsig_1_9z[1:0], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_0_16z = { celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_9z, _00_, _02_[1:0], celloutsig_0_12z, celloutsig_0_9z } & { celloutsig_0_15z[10:9], celloutsig_0_10z, celloutsig_0_9z };
  assign celloutsig_0_13z = { celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_11z } / { 1'h1, celloutsig_0_10z[3:0], celloutsig_0_1z };
  assign celloutsig_0_20z = { celloutsig_0_18z[5], celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_19z, celloutsig_0_4z } / { 1'h1, in_data[27:14], celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_14z };
  assign celloutsig_0_32z = celloutsig_0_30z[7:3] / { 1'h1, _03_[3:0] };
  assign celloutsig_1_13z = { celloutsig_1_5z[5], celloutsig_1_12z, celloutsig_1_6z } / { 1'h1, celloutsig_1_8z[1:0] };
  assign celloutsig_0_12z = { celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_1z } > { in_data[89:87], celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_10z };
  assign celloutsig_1_15z = in_data[166:162] && celloutsig_1_10z[13:9];
  assign celloutsig_0_3z = ! { celloutsig_0_2z[6:2], celloutsig_0_1z };
  assign celloutsig_1_3z = ! celloutsig_1_1z[5:1];
  assign celloutsig_0_0z = in_data[53] & ~(in_data[0]);
  assign celloutsig_0_4z = celloutsig_0_0z & ~(celloutsig_0_2z[7]);
  assign celloutsig_1_16z = celloutsig_1_0z[6] & ~(celloutsig_1_8z[2]);
  assign celloutsig_0_9z = celloutsig_0_2z[7] & ~(celloutsig_0_1z);
  assign celloutsig_0_19z = celloutsig_0_1z & ~(celloutsig_0_3z);
  assign celloutsig_1_0z = in_data[139] ? in_data[180:152] : in_data[175:147];
  assign celloutsig_1_4z = celloutsig_1_1z[0] ? celloutsig_1_1z[6:1] : celloutsig_1_0z[13:8];
  assign celloutsig_1_9z = celloutsig_1_5z[6] ? { celloutsig_1_3z, celloutsig_1_8z } : { celloutsig_1_1z[5:1], celloutsig_1_6z };
  assign celloutsig_1_18z = celloutsig_1_5z[4] ? { celloutsig_1_17z, celloutsig_1_15z, celloutsig_1_13z, celloutsig_1_16z, _01_, celloutsig_1_6z } : { celloutsig_1_12z, celloutsig_1_16z, celloutsig_1_16z, celloutsig_1_12z, _01_, celloutsig_1_13z };
  assign celloutsig_1_19z = celloutsig_1_9z[3] ? celloutsig_1_0z[13:9] : { celloutsig_1_3z, _01_, celloutsig_1_16z };
  assign celloutsig_0_2z = celloutsig_0_0z ? { in_data[19:16], 1'h1, celloutsig_0_1z, 3'h7 } : in_data[32:24];
  assign celloutsig_0_30z = celloutsig_0_20z[18] ? { in_data[29:24], celloutsig_0_12z, celloutsig_0_19z } : celloutsig_0_15z[11:4];
  assign celloutsig_1_5z = ~ { celloutsig_1_0z[14], celloutsig_1_4z };
  assign celloutsig_0_1z = & in_data[37:28];
  assign celloutsig_1_12z = | { celloutsig_1_7z, celloutsig_1_4z[5:1] };
  assign celloutsig_0_6z = | { celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_7z = | { celloutsig_0_4z, celloutsig_0_3z, in_data[18:6], celloutsig_0_0z };
  assign celloutsig_1_8z = { celloutsig_1_1z[5:3], celloutsig_1_2z, celloutsig_1_3z } >> celloutsig_1_5z[6:2];
  assign celloutsig_0_10z = celloutsig_0_2z[4:0] >> { celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_15z = { celloutsig_0_2z[7:0], celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_12z, celloutsig_0_7z } >> { celloutsig_0_14z[4], celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_13z, celloutsig_0_12z };
  assign celloutsig_0_18z = celloutsig_0_14z[6:0] >> { celloutsig_0_2z[6:1], celloutsig_0_1z };
  assign celloutsig_0_14z = { celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_9z, _00_, _02_[1:0], celloutsig_0_3z, celloutsig_0_1z } <<< { celloutsig_0_10z[3:2], celloutsig_0_13z };
  assign celloutsig_1_17z = ~((celloutsig_1_1z[4] & celloutsig_1_0z[8]) | (celloutsig_1_3z & celloutsig_1_2z));
  assign _02_[2] = _00_;
  assign { out_data[137:128], out_data[100:96], out_data[36:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_32z, celloutsig_0_33z };
endmodule
