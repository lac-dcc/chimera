/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [5:0] _02_;
  wire [3:0] _03_;
  reg [8:0] _04_;
  wire [16:0] celloutsig_0_0z;
  wire [9:0] celloutsig_0_10z;
  wire [6:0] celloutsig_0_11z;
  wire celloutsig_0_13z;
  wire [20:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [3:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [12:0] celloutsig_0_1z;
  wire [6:0] celloutsig_0_20z;
  wire [11:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [4:0] celloutsig_0_23z;
  wire [3:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_28z;
  wire [6:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  reg [11:0] celloutsig_0_31z;
  wire [5:0] celloutsig_0_32z;
  wire [3:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [7:0] celloutsig_0_35z;
  wire [13:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [4:0] celloutsig_0_41z;
  wire [3:0] celloutsig_0_42z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_49z;
  wire [5:0] celloutsig_0_4z;
  wire [7:0] celloutsig_0_52z;
  wire [29:0] celloutsig_0_53z;
  wire celloutsig_0_56z;
  wire celloutsig_0_5z;
  wire [6:0] celloutsig_0_64z;
  wire celloutsig_0_6z;
  wire celloutsig_0_73z;
  wire celloutsig_0_7z;
  wire [9:0] celloutsig_0_82z;
  wire [2:0] celloutsig_0_89z;
  wire celloutsig_0_8z;
  wire celloutsig_0_90z;
  wire [6:0] celloutsig_0_9z;
  wire [19:0] celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [8:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [9:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [3:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_5z = ~(celloutsig_1_3z & celloutsig_1_1z);
  assign celloutsig_0_15z = ~(in_data[11] & in_data[34]);
  assign celloutsig_0_25z = ~(celloutsig_0_23z[1] & celloutsig_0_3z);
  assign celloutsig_0_34z = ~celloutsig_0_14z[12];
  assign celloutsig_0_56z = ~celloutsig_0_13z;
  assign celloutsig_0_49z = celloutsig_0_15z | ~(celloutsig_0_36z[13]);
  assign celloutsig_0_6z = celloutsig_0_4z[0] | ~(celloutsig_0_1z[5]);
  assign celloutsig_1_8z = celloutsig_1_5z | ~(in_data[97]);
  assign celloutsig_1_13z = celloutsig_1_1z | ~(celloutsig_1_1z);
  assign celloutsig_0_2z = celloutsig_0_1z[8] | ~(in_data[76]);
  assign celloutsig_0_7z = celloutsig_0_6z | celloutsig_0_2z;
  assign celloutsig_0_18z = celloutsig_0_9z[1] | _01_;
  assign celloutsig_0_73z = ~(celloutsig_0_40z ^ _00_);
  assign celloutsig_1_3z = ~(in_data[129] ^ celloutsig_1_1z);
  assign celloutsig_0_13z = ~(celloutsig_0_1z[4] ^ celloutsig_0_4z[2]);
  assign celloutsig_0_17z = ~(celloutsig_0_5z ^ celloutsig_0_3z);
  assign celloutsig_1_0z = in_data[150:131] + in_data[127:108];
  reg [5:0] _22_;
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[32])
    if (clkin_data[32]) _22_ <= 6'h00;
    else _22_ <= { celloutsig_0_9z[1:0], celloutsig_0_46z, celloutsig_0_56z, celloutsig_0_22z, celloutsig_0_28z };
  assign { _02_[5:3], _00_, _02_[1:0] } = _22_;
  reg [3:0] _23_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[0])
    if (clkin_data[0]) _23_ <= 4'h0;
    else _23_ <= celloutsig_0_11z[6:3];
  assign { _03_[3], _01_, _03_[1:0] } = _23_;
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[32])
    if (clkin_data[32]) _04_ <= 9'h000;
    else _04_ <= celloutsig_0_1z[9:1];
  assign celloutsig_0_33z = celloutsig_0_9z[3:0] / { 1'h1, celloutsig_0_16z[2:0] };
  assign celloutsig_0_52z = { celloutsig_0_9z[6:1], celloutsig_0_18z, celloutsig_0_34z } / { 1'h1, celloutsig_0_20z[5:4], _03_[3], _01_, _03_[1:0], celloutsig_0_49z };
  assign celloutsig_0_10z = celloutsig_0_0z[16:7] / { 1'h1, celloutsig_0_4z[2:0], celloutsig_0_4z };
  assign celloutsig_1_10z = celloutsig_1_2z / { 1'h1, celloutsig_1_8z, celloutsig_1_5z };
  assign celloutsig_0_11z = { celloutsig_0_1z[12:9], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_5z } / { 1'h1, celloutsig_0_0z[10:5] };
  assign celloutsig_0_14z = { celloutsig_0_0z[16:15], celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_8z } / { 1'h1, _01_, _03_[1:0], celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_2z, _03_[3], _01_, _03_[1:0] };
  assign celloutsig_0_16z = in_data[47:44] / { 1'h1, celloutsig_0_4z[2:0] };
  assign celloutsig_0_5z = { celloutsig_0_0z[2], celloutsig_0_4z } == in_data[66:60];
  assign celloutsig_0_45z = { celloutsig_0_38z, celloutsig_0_37z, celloutsig_0_8z, celloutsig_0_41z } === in_data[30:23];
  assign celloutsig_1_4z = { in_data[106:104], celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z } < { celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_1_12z = { celloutsig_1_3z, celloutsig_1_7z } < celloutsig_1_0z[15:11];
  assign celloutsig_0_22z = { in_data[62:21], celloutsig_0_15z } < { celloutsig_0_1z[12:1], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_3z = in_data[25] & ~(celloutsig_0_1z[12]);
  assign celloutsig_1_1z = in_data[121] & ~(in_data[147]);
  assign celloutsig_0_30z = celloutsig_0_22z & ~(celloutsig_0_10z[7]);
  assign celloutsig_0_0z = in_data[84] ? { in_data[85], 1'h1, in_data[83:69] } : in_data[31:15];
  assign celloutsig_1_2z = celloutsig_1_0z[6] ? celloutsig_1_0z[11:9] : { in_data[105:104], celloutsig_1_1z };
  assign celloutsig_0_37z = { celloutsig_0_31z[6], celloutsig_0_10z } != { celloutsig_0_0z[5:1], celloutsig_0_7z, _03_[3], _01_, _03_[1:0], celloutsig_0_3z };
  assign celloutsig_0_40z = { celloutsig_0_36z[13:12], celloutsig_0_18z, celloutsig_0_37z } != celloutsig_0_29z[5:2];
  assign celloutsig_1_17z = { celloutsig_1_11z, celloutsig_1_5z } != celloutsig_1_7z;
  assign celloutsig_1_11z = in_data[160:158] | celloutsig_1_0z[14:12];
  assign celloutsig_1_19z = { celloutsig_1_11z[0], celloutsig_1_16z } | { celloutsig_1_7z[2:0], celloutsig_1_7z, celloutsig_1_12z, celloutsig_1_8z, celloutsig_1_13z };
  assign celloutsig_0_21z = { celloutsig_0_1z[12:2], celloutsig_0_6z } | { celloutsig_0_10z[4:0], celloutsig_0_9z };
  assign celloutsig_0_23z = { _04_[7:4], celloutsig_0_22z } | celloutsig_0_14z[15:11];
  assign celloutsig_0_8z = ~^ { celloutsig_0_4z[3:2], celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_90z = ~^ { celloutsig_0_42z[1:0], celloutsig_0_30z };
  assign celloutsig_1_14z = ~^ { celloutsig_1_7z[2:0], celloutsig_1_5z };
  assign celloutsig_0_38z = ^ celloutsig_0_0z[7:5];
  assign celloutsig_1_18z = ^ { in_data[152:151], celloutsig_1_4z, celloutsig_1_17z, celloutsig_1_14z, celloutsig_1_8z, celloutsig_1_12z, celloutsig_1_5z };
  assign celloutsig_0_32z = celloutsig_0_11z[5:0] << { celloutsig_0_11z[5:1], celloutsig_0_28z };
  assign celloutsig_0_4z = { celloutsig_0_1z[12:8], celloutsig_0_2z } << celloutsig_0_0z[5:0];
  assign celloutsig_0_82z = celloutsig_0_36z[9:0] >> { celloutsig_0_0z[9:2], celloutsig_0_2z, celloutsig_0_38z };
  assign celloutsig_0_9z = { celloutsig_0_0z[5], celloutsig_0_4z } >> celloutsig_0_1z[10:4];
  assign celloutsig_1_16z = { celloutsig_1_2z[1:0], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_5z } >> { celloutsig_1_12z, celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_8z, celloutsig_1_10z };
  assign celloutsig_0_1z = in_data[46:34] >> celloutsig_0_0z[12:0];
  assign celloutsig_0_41z = celloutsig_0_11z[4:0] >>> { celloutsig_0_4z[5:2], celloutsig_0_38z };
  assign celloutsig_0_89z = celloutsig_0_64z[3:1] >>> { celloutsig_0_82z[7], celloutsig_0_2z, celloutsig_0_73z };
  assign celloutsig_0_42z = celloutsig_0_21z[7:4] ~^ celloutsig_0_36z[13:10];
  assign celloutsig_0_29z = _04_[6:0] ~^ { celloutsig_0_28z, celloutsig_0_15z, celloutsig_0_23z };
  assign celloutsig_0_35z = { celloutsig_0_1z[2:1], celloutsig_0_4z } ^ { celloutsig_0_4z[2:0], celloutsig_0_23z };
  assign celloutsig_0_36z = in_data[22:9] ^ { celloutsig_0_31z[6:1], celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_5z };
  assign celloutsig_0_53z = { celloutsig_0_36z[10:4], celloutsig_0_28z, celloutsig_0_25z, _04_, celloutsig_0_2z, celloutsig_0_23z, celloutsig_0_32z } ^ { celloutsig_0_0z[11:5], celloutsig_0_35z, celloutsig_0_8z, celloutsig_0_33z, celloutsig_0_22z, celloutsig_0_29z, celloutsig_0_45z, celloutsig_0_28z };
  assign celloutsig_0_64z = celloutsig_0_52z[7:1] ^ { celloutsig_0_53z[26:21], celloutsig_0_22z };
  assign celloutsig_1_7z = { celloutsig_1_0z[18:16], celloutsig_1_4z } ^ { celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_20z = { celloutsig_0_11z[6:1], celloutsig_0_15z } ^ { celloutsig_0_14z[14:9], celloutsig_0_18z };
  assign celloutsig_0_24z = celloutsig_0_21z[4:1] ^ in_data[38:35];
  assign celloutsig_0_46z = ~((celloutsig_0_42z[3] & celloutsig_0_17z) | celloutsig_0_37z);
  assign celloutsig_0_28z = ~((celloutsig_0_3z & celloutsig_0_8z) | celloutsig_0_11z[5]);
  always_latch
    if (clkin_data[0]) celloutsig_0_31z = 12'h000;
    else if (clkin_data[64]) celloutsig_0_31z = { celloutsig_0_1z[11:9], celloutsig_0_24z, celloutsig_0_7z, celloutsig_0_18z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_17z };
  assign _02_[2] = _00_;
  assign _03_[2] = _01_;
  assign { out_data[128], out_data[105:96], out_data[34:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_89z, celloutsig_0_90z };
endmodule
