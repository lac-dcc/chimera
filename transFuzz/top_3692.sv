/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [17:0] _00_;
  wire [4:0] _01_;
  wire [16:0] _02_;
  wire [16:0] _03_;
  reg [4:0] _04_;
  wire [12:0] _05_;
  wire [32:0] celloutsig_0_0z;
  wire [11:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [10:0] celloutsig_0_14z;
  wire celloutsig_0_1z;
  wire [4:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [4:0] celloutsig_0_24z;
  wire celloutsig_0_27z;
  wire [7:0] celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [16:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [17:0] celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire [5:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [5:0] celloutsig_0_8z;
  wire [6:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [10:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [8:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire [17:0] celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [7:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[79:47] + in_data[51:19];
  assign celloutsig_0_38z = { _00_[17:9], celloutsig_0_3z, celloutsig_0_28z } + { celloutsig_0_31z[12:4], celloutsig_0_22z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_22z, celloutsig_0_21z };
  assign celloutsig_1_2z = in_data[136:128] + { in_data[174:169], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_5z = { celloutsig_1_2z[3:0], celloutsig_1_4z, celloutsig_1_2z } + { in_data[177:163], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_8z = in_data[27:22] + { celloutsig_0_0z[13:9], celloutsig_0_3z };
  assign celloutsig_0_14z = { celloutsig_0_11z[10:2], celloutsig_0_3z, celloutsig_0_2z } + { celloutsig_0_11z[8:4], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_4z };
  assign celloutsig_0_21z = celloutsig_0_0z[16:12] + celloutsig_0_11z[7:3];
  assign celloutsig_0_28z = _00_[16:9] + { celloutsig_0_21z[3:2], celloutsig_0_1z, celloutsig_0_24z };
  assign celloutsig_0_31z = { celloutsig_0_28z[7:4], _02_[12], _00_[17:9], _02_[2:0] } + { celloutsig_0_8z[4:3], celloutsig_0_8z, _03_[8:0] };
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _04_ <= 5'h00;
    else _04_ <= { celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z };
  reg [12:0] _16_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[64])
    if (clkin_data[64]) _16_ <= 13'h0000;
    else _16_ <= { in_data[69:58], celloutsig_0_5z };
  assign { _05_[12:8], _01_, _05_[2:0] } = _16_;
  reg [12:0] _17_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _17_ <= 13'h0000;
    else _17_ <= { celloutsig_0_2z, celloutsig_0_11z };
  assign { _02_[12], _00_[17:9], _02_[2:0] } = _17_;
  reg [8:0] _18_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[64])
    if (clkin_data[64]) _18_ <= 9'h000;
    else _18_ <= _00_[17:9];
  assign _03_[8:0] = _18_;
  assign celloutsig_0_5z = { in_data[56:46], celloutsig_0_2z, celloutsig_0_2z } <= { celloutsig_0_0z[26:15], celloutsig_0_4z };
  assign celloutsig_1_8z = { celloutsig_1_0z, _04_ } <= { celloutsig_1_4z, celloutsig_1_0z };
  assign celloutsig_1_11z = in_data[158:156] <= celloutsig_1_10z[2:0];
  assign celloutsig_1_13z = { celloutsig_1_2z[4], celloutsig_1_4z, celloutsig_1_3z } <= { _04_[1], _04_, celloutsig_1_1z };
  assign celloutsig_0_6z = celloutsig_0_0z[4:2] <= celloutsig_0_0z[10:8];
  assign celloutsig_1_15z = { celloutsig_1_5z[14:3], celloutsig_1_0z } <= { celloutsig_1_5z[16:6], celloutsig_1_13z, celloutsig_1_7z };
  assign celloutsig_1_18z = { celloutsig_1_9z[3:0], celloutsig_1_1z, celloutsig_1_15z } <= { _04_, celloutsig_1_16z };
  assign celloutsig_0_1z = in_data[41:35] <= in_data[54:48];
  assign celloutsig_0_22z = { _01_[3:0], _05_[2:1] } <= celloutsig_0_0z[22:17];
  assign celloutsig_0_27z = celloutsig_0_21z[3:1] <= { celloutsig_0_9z[6:5], celloutsig_0_13z };
  assign celloutsig_0_12z = ! celloutsig_0_0z[13:10];
  assign celloutsig_0_4z = | { celloutsig_0_0z[26:20], celloutsig_0_1z };
  assign celloutsig_0_43z = | { celloutsig_0_38z[8:3], celloutsig_0_27z };
  assign celloutsig_1_0z = | in_data[162:159];
  assign celloutsig_1_7z = | { _04_[4:2], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_16z = | { celloutsig_1_9z[7:3], celloutsig_1_8z };
  assign celloutsig_1_19z = | { celloutsig_1_5z[12:9], celloutsig_1_13z, celloutsig_1_14z };
  assign celloutsig_0_3z = | in_data[28:17];
  assign celloutsig_1_1z = ^ { in_data[127:120], celloutsig_1_0z };
  assign celloutsig_1_3z = ^ { in_data[152:145], celloutsig_1_1z };
  assign celloutsig_1_14z = ^ { in_data[178:176], celloutsig_1_3z, _04_, celloutsig_1_7z, celloutsig_1_11z, celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_11z, celloutsig_1_0z };
  assign celloutsig_0_7z = ^ { celloutsig_0_0z[31:17], celloutsig_0_1z, celloutsig_0_5z };
  assign celloutsig_0_13z = ^ { celloutsig_0_11z[7:1], celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_4z };
  assign celloutsig_0_2z = ^ celloutsig_0_0z[18:15];
  assign celloutsig_0_32z = ^ in_data[12:10];
  assign celloutsig_0_42z = celloutsig_0_14z[10:5] << { celloutsig_0_11z[10:7], celloutsig_0_32z, celloutsig_0_22z };
  assign celloutsig_1_4z = { celloutsig_1_2z[8:7], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_1z } << { celloutsig_1_2z[5:2], celloutsig_1_3z };
  assign celloutsig_1_9z = celloutsig_1_2z[8:1] << { _04_[4:3], celloutsig_1_4z, celloutsig_1_3z };
  assign celloutsig_1_10z = { celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_3z } << { _04_[2:1], celloutsig_1_9z, celloutsig_1_8z };
  assign celloutsig_0_9z = { celloutsig_0_0z[16:15], celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z } << { in_data[35:34], celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_11z = { _05_[10:8], _01_[4], celloutsig_0_3z, celloutsig_0_9z } << { _05_[9:8], _01_, _05_[2:0], celloutsig_0_7z, celloutsig_0_3z };
  assign celloutsig_0_24z = _03_[5:1] << celloutsig_0_0z[25:21];
  assign _00_[8:0] = { celloutsig_0_3z, celloutsig_0_28z };
  assign { _02_[16:13], _02_[11:3] } = { celloutsig_0_28z[7:4], _00_[17:9] };
  assign _03_[16:9] = { celloutsig_0_8z[4:3], celloutsig_0_8z };
  assign _05_[7:3] = _01_;
  assign { out_data[128], out_data[96], out_data[37:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_42z, celloutsig_0_43z };
endmodule
