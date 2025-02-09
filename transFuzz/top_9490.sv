/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [8:0] _01_;
  reg [9:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [15:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [61:0] celloutsig_0_13z;
  wire [8:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [4:0] celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [4:0] celloutsig_0_19z;
  wire [20:0] celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [12:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [10:0] celloutsig_0_29z;
  reg [23:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [3:0] celloutsig_0_32z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [5:0] celloutsig_0_43z;
  wire [16:0] celloutsig_0_46z;
  wire celloutsig_0_4z;
  wire celloutsig_0_53z;
  wire celloutsig_0_58z;
  wire celloutsig_0_59z;
  wire [8:0] celloutsig_0_5z;
  wire [15:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  reg [9:0] celloutsig_0_9z;
  wire [14:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [4:0] celloutsig_1_15z;
  wire [6:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [19:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [4:0] celloutsig_1_5z;
  wire [10:0] celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_53z = celloutsig_0_46z[2] ? celloutsig_0_31z : celloutsig_0_29z[3];
  assign celloutsig_0_27z = celloutsig_0_3z ? celloutsig_0_25z : celloutsig_0_15z;
  assign celloutsig_0_30z = celloutsig_0_11z[12] ? celloutsig_0_26z : celloutsig_0_9z[5];
  assign celloutsig_0_37z = !(celloutsig_0_4z ? celloutsig_0_19z[0] : celloutsig_0_28z);
  assign celloutsig_0_58z = !(celloutsig_0_29z[1] ? _00_ : celloutsig_0_53z);
  assign celloutsig_1_4z = !(celloutsig_1_0z[14] ? in_data[160] : celloutsig_1_3z[19]);
  assign celloutsig_1_9z = !(celloutsig_1_8z ? celloutsig_1_2z : celloutsig_1_5z[4]);
  assign celloutsig_0_22z = celloutsig_0_1z[2] | ~(celloutsig_0_9z[0]);
  assign celloutsig_0_59z = celloutsig_0_39z | celloutsig_0_19z[2];
  reg [8:0] _12_;
  always_ff @(negedge clkin_data[96], posedge clkin_data[0])
    if (clkin_data[0]) _12_ <= 9'h000;
    else _12_ <= { celloutsig_0_5z[6:0], celloutsig_0_28z, celloutsig_0_25z };
  assign { _01_[8:5], _00_, _01_[3:0] } = _12_;
  always_ff @(negedge clkin_data[128], negedge clkin_data[64])
    if (!clkin_data[64]) _02_ <= 10'h000;
    else _02_ <= in_data[112:103];
  assign celloutsig_1_6z = { celloutsig_1_0z[5:0], celloutsig_1_5z } / { 1'h1, celloutsig_1_0z[6:4], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_16z = { celloutsig_0_2z[9:6], celloutsig_0_15z } / { 1'h1, celloutsig_0_6z[4:3], celloutsig_0_0z, celloutsig_0_8z };
  assign celloutsig_0_17z = celloutsig_0_6z[4:2] / { 1'h1, celloutsig_0_4z, celloutsig_0_15z };
  assign celloutsig_0_31z = { celloutsig_0_1z[5], celloutsig_0_26z, celloutsig_0_30z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_25z, celloutsig_0_27z, celloutsig_0_22z } == { celloutsig_0_25z, celloutsig_0_22z, celloutsig_0_16z, celloutsig_0_10z, celloutsig_0_21z };
  assign celloutsig_0_25z = { celloutsig_0_23z, celloutsig_0_6z, celloutsig_0_19z, celloutsig_0_18z, celloutsig_0_23z } == { celloutsig_0_11z[7], celloutsig_0_17z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_0_28z = { celloutsig_0_23z, celloutsig_0_16z } == { celloutsig_0_27z, celloutsig_0_22z, celloutsig_0_25z, celloutsig_0_27z, celloutsig_0_18z, celloutsig_0_8z };
  assign celloutsig_1_2z = in_data[110:102] === { celloutsig_1_0z[6:4], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_10z = in_data[46:35] === { celloutsig_0_6z[11:4], celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_8z };
  assign celloutsig_0_0z = in_data[33:29] >= in_data[67:63];
  assign celloutsig_1_19z = _02_[8:3] >= { in_data[116:115], celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_0_4z = { celloutsig_0_1z[15:11], celloutsig_0_0z, celloutsig_0_1z[20:2], 2'h3 } > { celloutsig_0_2z[20:16], celloutsig_0_0z, celloutsig_0_1z[20:2], 2'h3 };
  assign celloutsig_0_21z = { celloutsig_0_6z[6:4], celloutsig_0_12z } && { celloutsig_0_16z[2:0], celloutsig_0_7z };
  assign celloutsig_0_23z = { celloutsig_0_5z[4:0], celloutsig_0_18z } && { celloutsig_0_13z[0], celloutsig_0_17z, celloutsig_0_22z, celloutsig_0_3z };
  assign celloutsig_0_29z = { celloutsig_0_5z, celloutsig_0_18z, celloutsig_0_18z } * { celloutsig_0_9z[8:5], celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_19z };
  assign celloutsig_0_3z = in_data[82:68] !== { celloutsig_0_2z[13:0], celloutsig_0_0z };
  assign celloutsig_0_41z = & celloutsig_0_14z[8:3];
  assign celloutsig_0_8z = & celloutsig_0_2z[21:16];
  assign celloutsig_1_8z = | { celloutsig_1_4z, celloutsig_1_0z[8] };
  assign celloutsig_1_10z = | { celloutsig_1_9z, celloutsig_1_6z[9:2], celloutsig_1_2z };
  assign celloutsig_0_18z = | celloutsig_0_6z[12:10];
  assign celloutsig_0_38z = ~^ { celloutsig_0_9z[7:0], celloutsig_0_37z, celloutsig_0_14z };
  assign celloutsig_0_42z = ~^ celloutsig_0_32z;
  assign celloutsig_0_15z = ~^ { celloutsig_0_14z[5:2], celloutsig_0_0z };
  assign celloutsig_0_5z = { in_data[51:44], celloutsig_0_0z } >> celloutsig_0_1z[20:12];
  assign celloutsig_0_32z = { celloutsig_0_16z[0], celloutsig_0_31z, celloutsig_0_26z, celloutsig_0_4z } << celloutsig_0_1z[16:13];
  assign celloutsig_1_0z = in_data[178:164] << in_data[120:106];
  assign celloutsig_0_46z = { celloutsig_0_9z[7:4], celloutsig_0_37z, celloutsig_0_8z, celloutsig_0_38z, celloutsig_0_3z, celloutsig_0_43z, celloutsig_0_42z, celloutsig_0_12z, celloutsig_0_41z } >> { celloutsig_0_13z[10:9], celloutsig_0_41z, celloutsig_0_37z, celloutsig_0_24z };
  assign celloutsig_1_18z = { celloutsig_1_6z[6], celloutsig_1_15z, celloutsig_1_10z } >> { celloutsig_1_5z[4:3], celloutsig_1_5z };
  assign celloutsig_0_11z = { celloutsig_0_6z[15:1], celloutsig_0_0z } >> celloutsig_0_6z;
  assign celloutsig_0_13z = { celloutsig_0_2z[18:5], celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_12z } >> { celloutsig_0_6z[14], celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_0_43z = { celloutsig_0_9z[8:5], celloutsig_0_8z, celloutsig_0_27z } <<< celloutsig_0_1z[16:11];
  assign celloutsig_0_6z = celloutsig_0_2z[21:6] <<< celloutsig_0_1z[17:2];
  assign celloutsig_1_5z = { celloutsig_1_3z[16:15], celloutsig_1_1z } <<< celloutsig_1_3z[7:3];
  assign celloutsig_1_3z = { in_data[175:159], celloutsig_1_1z } - in_data[169:150];
  assign celloutsig_1_15z = celloutsig_1_3z[19:15] - celloutsig_1_0z[5:1];
  assign celloutsig_0_14z = { celloutsig_0_9z[9:2], celloutsig_0_0z } - celloutsig_0_1z[20:12];
  assign celloutsig_0_24z = { celloutsig_0_14z[6:4], celloutsig_0_9z } ~^ { celloutsig_0_1z[11:8], celloutsig_0_14z };
  assign celloutsig_1_1z = in_data[173:171] ^ celloutsig_1_0z[12:10];
  assign celloutsig_0_19z = { celloutsig_0_5z[6:4], celloutsig_0_8z, celloutsig_0_15z } ^ { celloutsig_0_16z[3:0], celloutsig_0_0z };
  assign celloutsig_0_39z = ~((celloutsig_0_2z[22] & celloutsig_0_21z) | celloutsig_0_9z[9]);
  assign celloutsig_0_26z = ~((celloutsig_0_23z & celloutsig_0_7z) | celloutsig_0_3z);
  always_latch
    if (!clkin_data[32]) celloutsig_0_9z = 10'h000;
    else if (celloutsig_1_19z) celloutsig_0_9z = celloutsig_0_1z[16:7];
  always_latch
    if (clkin_data[0]) celloutsig_0_2z = 24'h000000;
    else if (celloutsig_1_19z) celloutsig_0_2z = { in_data[93:91], celloutsig_0_1z[20:2], 2'h3 };
  assign celloutsig_0_7z = ~((celloutsig_0_3z & celloutsig_0_4z) | (celloutsig_0_1z[19] & celloutsig_0_1z[11]));
  assign celloutsig_0_12z = ~((celloutsig_0_1z[8] & celloutsig_0_0z) | (celloutsig_0_4z & celloutsig_0_9z[5]));
  assign celloutsig_0_1z[20:2] = in_data[27:9] ~^ in_data[25:7];
  assign _01_[4] = _00_;
  assign celloutsig_0_1z[1:0] = 2'h3;
  assign { out_data[134:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_58z, celloutsig_0_59z };
endmodule
