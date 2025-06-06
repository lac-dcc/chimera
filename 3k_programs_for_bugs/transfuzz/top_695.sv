/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [2:0] _00_;
  reg [11:0] _01_;
  reg [7:0] _02_;
  wire [15:0] celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [2:0] celloutsig_0_20z;
  wire [4:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [7:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_28z;
  wire [11:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [10:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire [6:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire [6:0] celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [12:0] celloutsig_1_7z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_36z = ~(celloutsig_0_8z ^ celloutsig_0_32z);
  assign celloutsig_0_13z = ~(celloutsig_0_11z ^ celloutsig_0_0z[15]);
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _00_ <= 3'h0;
    else _00_ <= celloutsig_1_2z[2:0];
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _01_ <= 12'h000;
    else _01_ <= { _00_[1:0], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  always_ff @(negedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _02_ <= 8'h00;
    else _02_ <= { celloutsig_0_7z[6:0], celloutsig_0_6z };
  assign celloutsig_0_34z = { celloutsig_0_7z[5], celloutsig_0_23z, celloutsig_0_15z, celloutsig_0_19z, celloutsig_0_8z, celloutsig_0_32z, celloutsig_0_1z, celloutsig_0_25z, celloutsig_0_28z, celloutsig_0_8z } === { _02_[4:1], celloutsig_0_32z, celloutsig_0_23z, celloutsig_0_9z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_16z };
  assign celloutsig_1_5z = { celloutsig_1_4z[1:0], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z } === { in_data[178:161], celloutsig_1_4z };
  assign celloutsig_0_4z = { in_data[26:16], celloutsig_0_3z } === { celloutsig_0_0z[9:0], celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_6z = { in_data[68], celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_2z } === { celloutsig_0_0z[9:5], celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_0_1z = celloutsig_0_0z[10:1] === in_data[69:60];
  assign celloutsig_0_15z = { celloutsig_0_0z[13:12], celloutsig_0_4z } === _02_[5:3];
  assign celloutsig_0_2z = in_data[82:45] === { in_data[86:82], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_28z = { _02_[6:3], celloutsig_0_3z } === { celloutsig_0_9z, celloutsig_0_25z, celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_11z };
  assign celloutsig_0_3z = celloutsig_0_0z[13:4] >= celloutsig_0_0z[13:4];
  assign celloutsig_0_35z = { celloutsig_0_5z, celloutsig_0_32z, celloutsig_0_20z, celloutsig_0_30z, celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_23z, celloutsig_0_34z, celloutsig_0_18z } >= { celloutsig_0_24z[7:1], celloutsig_0_3z, celloutsig_0_16z, celloutsig_0_21z[4:1], celloutsig_0_21z[1] };
  assign celloutsig_0_5z = { in_data[58:54], celloutsig_0_1z, celloutsig_0_3z } >= { in_data[81:79], celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_22z = { in_data[57:55], celloutsig_0_20z, celloutsig_0_13z, celloutsig_0_3z } >= { celloutsig_0_17z, celloutsig_0_21z[4:1], celloutsig_0_21z[1], celloutsig_0_16z, celloutsig_0_13z };
  assign celloutsig_0_25z = celloutsig_0_7z[9:1] >= { celloutsig_0_21z[4:1], celloutsig_0_21z[1], celloutsig_0_23z, celloutsig_0_19z, celloutsig_0_22z, celloutsig_0_14z };
  assign celloutsig_0_30z = { _02_[5:2], celloutsig_0_15z } >= { celloutsig_0_25z, celloutsig_0_3z, celloutsig_0_22z, celloutsig_0_25z, celloutsig_0_28z };
  assign celloutsig_0_32z = { celloutsig_0_29z[6:0], celloutsig_0_19z, celloutsig_0_23z } >= { _02_[7:4], celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_17z, celloutsig_0_31z };
  assign celloutsig_1_0z = ! in_data[152:144];
  assign celloutsig_1_1z = ! { in_data[180:167], celloutsig_1_0z };
  assign celloutsig_1_18z = ! celloutsig_1_3z[6:2];
  assign celloutsig_0_11z = ! { _02_[6:4], celloutsig_0_5z, celloutsig_0_5z };
  assign celloutsig_0_16z = ! celloutsig_0_0z[12:0];
  assign celloutsig_1_13z = { celloutsig_1_7z[5:1], celloutsig_1_1z, celloutsig_1_12z, _00_, _00_ } || { celloutsig_1_2z[1:0], celloutsig_1_10z, _00_, celloutsig_1_2z, celloutsig_1_5z };
  assign celloutsig_0_8z = { in_data[30:28], celloutsig_0_6z, celloutsig_0_2z } || { celloutsig_0_7z[3], celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_1z };
  assign celloutsig_0_12z = { _02_[4], celloutsig_0_9z, celloutsig_0_11z } || celloutsig_0_0z[10:8];
  assign celloutsig_0_19z = { in_data[74:65], celloutsig_0_14z, celloutsig_0_13z } || { celloutsig_0_0z[12:2], celloutsig_0_11z };
  assign celloutsig_1_6z = celloutsig_1_4z[4:2] < { celloutsig_1_2z[2:1], celloutsig_1_0z };
  assign celloutsig_1_19z = { celloutsig_1_7z[10:6], celloutsig_1_13z } < celloutsig_1_3z[6:1];
  assign celloutsig_0_9z = { celloutsig_0_7z[5:1], celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_6z } < { celloutsig_0_7z[10:1], celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_14z = { celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_4z } < { in_data[48:47], celloutsig_0_2z };
  assign celloutsig_0_17z = { in_data[24:17], celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_3z } < { celloutsig_0_7z[7:6], celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_9z };
  assign celloutsig_0_29z = celloutsig_0_9z ? { _02_[4:0], celloutsig_0_19z, celloutsig_0_12z, celloutsig_0_23z, celloutsig_0_22z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_15z } : { celloutsig_0_0z[12:3], celloutsig_0_16z, celloutsig_0_25z };
  assign celloutsig_0_0z = in_data[29:14] | in_data[16:1];
  assign celloutsig_1_2z = in_data[144:136] | in_data[133:125];
  assign celloutsig_1_3z = { celloutsig_1_2z[8:4], celloutsig_1_1z, celloutsig_1_0z } | { celloutsig_1_2z[8:4], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_4z = celloutsig_1_3z[4:0] | in_data[184:180];
  assign celloutsig_1_7z = { in_data[146:144], celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_4z } | { in_data[134:133], celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_12z = { celloutsig_1_6z, _00_, _00_ } | { celloutsig_1_7z[9:8], celloutsig_1_4z };
  assign celloutsig_0_7z = { celloutsig_0_0z[5:0], celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_5z } | { celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_2z };
  assign celloutsig_0_20z = { in_data[38], celloutsig_0_11z, celloutsig_0_2z } | { celloutsig_0_7z[5:4], celloutsig_0_2z };
  assign celloutsig_0_23z = ~^ { celloutsig_0_18z[2:0], celloutsig_0_12z, celloutsig_0_17z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_19z };
  assign celloutsig_0_31z = ~^ { celloutsig_0_29z[6:2], celloutsig_0_19z, celloutsig_0_20z, celloutsig_0_20z, celloutsig_0_15z, celloutsig_0_6z };
  assign celloutsig_1_10z = celloutsig_1_7z[8:5] >> { _01_[10:8], celloutsig_1_6z };
  assign celloutsig_0_18z = { celloutsig_0_7z[5], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_11z } >> { celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_9z };
  assign celloutsig_0_24z = { celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_13z, celloutsig_0_16z, celloutsig_0_23z, celloutsig_0_22z, celloutsig_0_22z, celloutsig_0_14z } >> { celloutsig_0_0z[12:10], celloutsig_0_19z, celloutsig_0_1z, celloutsig_0_19z, celloutsig_0_22z, celloutsig_0_23z };
  assign { celloutsig_0_21z[2:1], celloutsig_0_21z[4:3] } = { celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_0z[11:10] } | { celloutsig_0_16z, celloutsig_0_8z, celloutsig_0_15z, celloutsig_0_9z };
  assign celloutsig_0_21z[0] = celloutsig_0_21z[1];
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_35z, celloutsig_0_36z };
endmodule
