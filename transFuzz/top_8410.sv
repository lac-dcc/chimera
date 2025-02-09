/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [4:0] _00_;
  wire [8:0] celloutsig_0_0z;
  wire [7:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [10:0] celloutsig_0_14z;
  wire [7:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [3:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [2:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [2:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [32:0] celloutsig_0_7z;
  wire [11:0] celloutsig_0_8z;
  wire [6:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_14z;
  wire [22:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [12:0] celloutsig_1_1z;
  wire [29:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [9:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [6:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_39z = celloutsig_0_0z[4] ? celloutsig_0_30z : celloutsig_0_6z;
  assign celloutsig_1_5z = !(celloutsig_1_4z[3] ? celloutsig_1_4z[2] : celloutsig_1_0z);
  assign celloutsig_0_16z = !(celloutsig_0_9z[0] ? celloutsig_0_2z : celloutsig_0_6z);
  assign celloutsig_1_14z = ~(celloutsig_1_4z[9] ^ celloutsig_1_8z);
  always_ff @(negedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _00_ <= 5'h00;
    else _00_ <= { celloutsig_0_14z[7:4], celloutsig_0_11z };
  assign celloutsig_1_2z = in_data[135:106] / { 1'h1, in_data[131:105], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_17z = { celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_14z, celloutsig_1_1z } / { 1'h1, in_data[145:125], celloutsig_1_7z };
  assign celloutsig_0_7z = in_data[68:36] / { 1'h1, celloutsig_0_0z[7:2], celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_5z };
  assign celloutsig_0_9z = in_data[88:82] / { 1'h1, celloutsig_0_8z[5:3], celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_15z = celloutsig_0_10z / { 1'h1, celloutsig_0_14z[4], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_4z };
  assign celloutsig_0_18z = { celloutsig_0_15z, celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_17z, celloutsig_0_4z, celloutsig_0_12z } == { celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_10z };
  assign celloutsig_1_19z = { celloutsig_1_17z[10:7], celloutsig_1_9z } === celloutsig_1_4z[8:4];
  assign celloutsig_0_11z = { celloutsig_0_10z[6:2], celloutsig_0_5z, celloutsig_0_10z } === celloutsig_0_7z[13:0];
  assign celloutsig_1_18z = celloutsig_1_17z[14:5] >= in_data[183:174];
  assign celloutsig_0_24z = { celloutsig_0_0z[8:1], celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_21z, celloutsig_0_11z } > { in_data[24:9], celloutsig_0_13z, celloutsig_0_21z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_20z };
  assign celloutsig_1_9z = { celloutsig_1_4z[9:4], celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_4z } && { in_data[181:171], celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_7z };
  assign celloutsig_0_33z = { celloutsig_0_32z, celloutsig_0_32z } || { _00_[3:0], celloutsig_0_16z, celloutsig_0_25z };
  assign celloutsig_1_0z = in_data[133:131] || in_data[125:123];
  assign celloutsig_0_38z = { celloutsig_0_0z[5:2], celloutsig_0_18z } < { celloutsig_0_33z, celloutsig_0_32z, celloutsig_0_28z };
  assign celloutsig_0_1z = celloutsig_0_0z[6:1] < in_data[94:89];
  assign celloutsig_0_2z = in_data[53:32] < in_data[91:70];
  assign celloutsig_0_25z = { celloutsig_0_14z[5:1], celloutsig_0_10z } < { celloutsig_0_7z[13:4], celloutsig_0_24z, celloutsig_0_16z, celloutsig_0_21z };
  assign celloutsig_0_28z = { celloutsig_0_8z[10:7], celloutsig_0_11z, celloutsig_0_4z } < celloutsig_0_7z[27:20];
  assign celloutsig_0_0z = in_data[57:49] * in_data[21:13];
  assign celloutsig_0_4z = { in_data[4:3], celloutsig_0_3z } * in_data[72:70];
  assign celloutsig_0_32z = celloutsig_0_14z[2] ? celloutsig_0_27z[3:1] : { celloutsig_0_7z[18:17], celloutsig_0_12z };
  assign celloutsig_1_1z = celloutsig_1_0z ? in_data[169:157] : in_data[160:148];
  assign celloutsig_1_4z = celloutsig_1_2z[9] ? in_data[185:176] : celloutsig_1_2z[23:14];
  assign celloutsig_1_6z = celloutsig_1_2z[22] ? celloutsig_1_2z[8:2] : celloutsig_1_1z[6:0];
  assign celloutsig_0_8z = celloutsig_0_2z ? { celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_6z } : { celloutsig_0_7z[11:2], celloutsig_0_1z, 1'h0 };
  assign celloutsig_0_14z = celloutsig_0_11z ? in_data[14:4] : in_data[80:70];
  assign celloutsig_0_13z = { celloutsig_0_4z[1], celloutsig_0_1z, celloutsig_0_2z } != in_data[35:33];
  assign celloutsig_0_3z = { in_data[80:64], celloutsig_0_1z } !== { celloutsig_0_0z[7:1], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_1_7z = celloutsig_1_1z[11:8] !== in_data[173:170];
  assign celloutsig_0_6z = celloutsig_0_0z[5:2] !== { in_data[20:19], celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_12z = { celloutsig_0_0z[7:2], celloutsig_0_1z } !== { celloutsig_0_9z[4:2], celloutsig_0_4z, celloutsig_0_2z };
  assign celloutsig_0_30z = celloutsig_0_8z[5:1] !== { celloutsig_0_0z[4:1], celloutsig_0_17z };
  assign celloutsig_0_10z = ~ in_data[78:71];
  assign celloutsig_1_3z = & in_data[115:111];
  assign celloutsig_0_5z = ^ in_data[23:16];
  assign celloutsig_1_8z = ^ celloutsig_1_6z[3:0];
  assign celloutsig_0_21z = ^ { celloutsig_0_9z[5], celloutsig_0_4z };
  assign celloutsig_0_27z = in_data[4:1] - { celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_18z };
  assign celloutsig_0_17z = ~((celloutsig_0_7z[14] & celloutsig_0_3z) | (celloutsig_0_6z & celloutsig_0_14z[7]));
  assign celloutsig_0_20z = ~((celloutsig_0_8z[9] & celloutsig_0_4z[0]) | (celloutsig_0_4z[0] & celloutsig_0_10z[4]));
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_38z, celloutsig_0_39z };
endmodule
