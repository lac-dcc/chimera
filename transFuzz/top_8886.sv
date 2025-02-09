/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [3:0] _00_;
  reg [31:0] _01_;
  wire [7:0] celloutsig_0_0z;
  wire [22:0] celloutsig_0_10z;
  wire [6:0] celloutsig_0_11z;
  wire [12:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [6:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [16:0] celloutsig_0_1z;
  wire [12:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_27z;
  wire celloutsig_0_2z;
  wire [2:0] celloutsig_0_36z;
  wire [9:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [3:0] celloutsig_0_3z;
  wire [2:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire [7:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [6:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_0z = !(in_data[156] ? in_data[125] : in_data[153]);
  assign celloutsig_1_3z = !(celloutsig_1_0z ? in_data[142] : celloutsig_1_0z);
  assign celloutsig_1_4z = !(celloutsig_1_0z ? celloutsig_1_0z : celloutsig_1_2z[1]);
  assign celloutsig_0_6z = !(celloutsig_0_1z[12] ? celloutsig_0_5z : celloutsig_0_2z);
  assign celloutsig_0_14z = !(celloutsig_0_13z ? celloutsig_0_9z : celloutsig_0_6z);
  always_ff @(negedge clkin_data[32], negedge clkin_data[96])
    if (!clkin_data[96]) _00_ <= 4'h0;
    else _00_ <= in_data[115:112];
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _01_ <= 32'd0;
    else _01_ <= { in_data[41:38], celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_0_38z = { celloutsig_0_1z[4:0], celloutsig_0_7z, celloutsig_0_18z } === { celloutsig_0_11z[5:2], celloutsig_0_36z };
  assign celloutsig_1_6z = in_data[162:142] === { celloutsig_1_2z[4], _00_, celloutsig_1_2z, _00_, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_1_8z = { in_data[115:104], celloutsig_1_6z } === { celloutsig_1_2z[6:4], celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_0_5z = { celloutsig_0_1z[14:11], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_0z } === in_data[58:42];
  assign celloutsig_0_15z = { celloutsig_0_0z[6:3], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_5z } === celloutsig_0_10z;
  assign celloutsig_0_22z = _01_[6:4] === celloutsig_0_21z[3:1];
  assign celloutsig_1_7z = { _00_, celloutsig_1_3z } < { celloutsig_1_3z, _00_ };
  assign celloutsig_1_19z = in_data[186:179] < { celloutsig_1_2z[5:0], celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_0_13z = { celloutsig_0_1z[12:8], celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_5z } < { in_data[58], celloutsig_0_7z, celloutsig_0_10z };
  assign celloutsig_0_16z = in_data[42:39] < { in_data[37:35], celloutsig_0_5z };
  assign celloutsig_0_18z = { in_data[65:56], celloutsig_0_9z } < { celloutsig_0_4z[2], celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_13z, celloutsig_0_11z };
  assign celloutsig_0_19z = { celloutsig_0_12z[12:3], celloutsig_0_17z, celloutsig_0_13z, celloutsig_0_13z } < { celloutsig_0_17z[3:2], celloutsig_0_18z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_7z };
  assign celloutsig_1_11z = | { in_data[111:109], celloutsig_1_6z, celloutsig_1_8z };
  assign celloutsig_0_7z = | { celloutsig_0_0z[2:1], celloutsig_0_5z };
  assign celloutsig_0_9z = | { celloutsig_0_1z[13:6], celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_0_2z = | in_data[73:58];
  assign celloutsig_1_18z = | { celloutsig_1_15z[3], celloutsig_1_11z, celloutsig_1_7z, _00_ };
  assign celloutsig_0_27z = | { celloutsig_0_22z, _01_[8:6], celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_36z = { celloutsig_0_17z[5:4], celloutsig_0_15z } >> celloutsig_0_11z[4:2];
  assign celloutsig_0_4z = celloutsig_0_1z[9:7] >> in_data[53:51];
  assign celloutsig_1_2z = { in_data[181:180], celloutsig_1_0z, _00_ } >> in_data[136:130];
  assign celloutsig_0_12z = { celloutsig_0_11z[4:1], celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_9z } >> { _01_[14:12], celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_21z = { celloutsig_0_1z[10:0], celloutsig_0_9z, celloutsig_0_14z } >> { celloutsig_0_17z[3:2], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_19z, celloutsig_0_13z, celloutsig_0_7z };
  assign celloutsig_0_0z = in_data[43:36] <<< in_data[16:9];
  assign celloutsig_0_37z = { celloutsig_0_12z[10:3], celloutsig_0_27z, celloutsig_0_27z } <<< celloutsig_0_10z[18:9];
  assign celloutsig_1_5z = celloutsig_1_2z[5:2] <<< celloutsig_1_2z[3:0];
  assign celloutsig_1_15z = { celloutsig_1_2z[3:0], celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_3z } <<< in_data[136:129];
  assign celloutsig_0_10z = { in_data[18:0], celloutsig_0_3z } <<< { in_data[13:11], celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_11z = { celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_5z } <<< { celloutsig_0_4z[1:0], celloutsig_0_3z, celloutsig_0_9z };
  assign celloutsig_0_1z = in_data[50:34] <<< { celloutsig_0_0z[5], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_17z = { celloutsig_0_5z, celloutsig_0_16z, celloutsig_0_14z, celloutsig_0_3z } <<< celloutsig_0_1z[15:9];
  assign celloutsig_0_3z = in_data[94:91] <<< in_data[43:40];
  assign { out_data[128], out_data[96], out_data[41:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_37z, celloutsig_0_38z };
endmodule
