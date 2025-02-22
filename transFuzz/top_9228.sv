/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [8:0] _01_;
  wire [13:0] _02_;
  wire [4:0] _03_;
  reg [7:0] _04_;
  reg [17:0] _05_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_16z;
  wire [19:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [3:0] celloutsig_0_1z;
  wire [2:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [2:0] celloutsig_0_24z;
  wire [17:0] celloutsig_0_25z;
  wire [4:0] celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire [5:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [6:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_44z;
  wire celloutsig_0_5z;
  wire [41:0] celloutsig_0_63z;
  wire celloutsig_0_6z;
  wire [2:0] celloutsig_0_7z;
  wire [4:0] celloutsig_0_80z;
  wire celloutsig_0_81z;
  wire celloutsig_0_8z;
  wire [9:0] celloutsig_0_9z;
  wire [8:0] celloutsig_1_0z;
  wire [7:0] celloutsig_1_10z;
  wire [4:0] celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [14:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [12:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [6:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_33z = ~(celloutsig_0_26z[0] & celloutsig_0_3z);
  assign celloutsig_0_5z = ~(in_data[17] & _00_);
  assign celloutsig_1_1z = ~(in_data[148] & celloutsig_1_0z[8]);
  assign celloutsig_1_13z = ~(celloutsig_1_8z & celloutsig_1_4z);
  assign celloutsig_0_16z = ~(celloutsig_0_3z & in_data[69]);
  assign celloutsig_1_7z = ~((celloutsig_1_2z[10] | celloutsig_1_2z[0]) & celloutsig_1_6z[1]);
  assign celloutsig_0_18z = ~((celloutsig_0_7z[1] | celloutsig_0_7z[2]) & celloutsig_0_11z);
  assign celloutsig_0_28z = ~((celloutsig_0_9z[5] | celloutsig_0_18z) & celloutsig_0_1z[0]);
  assign celloutsig_0_40z = ~(celloutsig_0_18z ^ celloutsig_0_6z);
  assign celloutsig_1_8z = ~(in_data[152] ^ celloutsig_1_6z[10]);
  assign celloutsig_0_13z = ~(celloutsig_0_11z ^ celloutsig_0_0z);
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _01_ <= 9'h000;
    else _01_ <= { celloutsig_0_1z, celloutsig_0_24z, celloutsig_0_6z, celloutsig_0_8z };
  reg [4:0] _18_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _18_ <= 5'h00;
    else _18_ <= { in_data[78:77], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z };
  assign { _00_, _03_[3:0] } = _18_;
  always_ff @(negedge clkin_data[32], negedge clkin_data[96])
    if (!clkin_data[96]) _04_ <= 8'h00;
    else _04_ <= { celloutsig_1_9z[3:2], celloutsig_1_11z, celloutsig_1_4z };
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _05_ <= 18'h00000;
    else _05_ <= { celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_9z[9:7], celloutsig_0_9z[7], celloutsig_0_9z[5:2], celloutsig_0_9z[2], celloutsig_0_9z[7], celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_11z };
  reg [5:0] _21_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _21_ <= 6'h00;
    else _21_ <= _05_[9:4];
  assign _02_[7:2] = _21_;
  assign celloutsig_1_0z = in_data[119:111] & in_data[186:178];
  assign celloutsig_1_2z = { celloutsig_1_0z[5:0], celloutsig_1_0z } & in_data[157:143];
  assign celloutsig_1_11z = celloutsig_1_2z[12:8] & { celloutsig_1_10z[4:2], celloutsig_1_10z[4:3] };
  assign celloutsig_0_17z = { _05_[15:2], _00_, _03_[3:0], celloutsig_0_6z } & { _05_[6], celloutsig_0_7z, celloutsig_0_9z[9:7], celloutsig_0_9z[7], celloutsig_0_9z[5:2], celloutsig_0_9z[2], celloutsig_0_9z[7], _00_, _03_[3:0], celloutsig_0_16z };
  assign celloutsig_0_26z = _05_[10:6] & { celloutsig_0_8z, celloutsig_0_1z };
  assign celloutsig_0_0z = in_data[81:65] <= in_data[58:42];
  assign celloutsig_0_44z = { in_data[78:44], celloutsig_0_40z } <= { celloutsig_0_9z[5:2], celloutsig_0_9z[2], celloutsig_0_22z, celloutsig_0_9z[9:7], celloutsig_0_9z[7], celloutsig_0_9z[5:2], celloutsig_0_9z[2], celloutsig_0_9z[7], celloutsig_0_37z, celloutsig_0_33z, _01_, _00_, _03_[3:0], celloutsig_0_19z, celloutsig_0_0z, celloutsig_0_39z, celloutsig_0_8z };
  assign celloutsig_1_4z = in_data[155:139] <= { in_data[120:115], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_18z = { _04_[6:0], celloutsig_1_2z } <= { celloutsig_1_2z[12:1], celloutsig_1_10z[7:2], celloutsig_1_10z[4:3], celloutsig_1_8z, celloutsig_1_3z };
  assign celloutsig_0_19z = { _05_[12:6], celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_10z } && { celloutsig_0_11z, _00_, _03_[3:0], celloutsig_0_1z };
  assign celloutsig_0_21z = { _02_[6:2], celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_1z } && { celloutsig_0_9z[7], celloutsig_0_9z[9:7], celloutsig_0_9z[7], celloutsig_0_9z[5:2], celloutsig_0_9z[2], celloutsig_0_9z[7], celloutsig_0_16z, celloutsig_0_11z };
  assign celloutsig_0_36z = { _01_[8:5], celloutsig_0_5z, celloutsig_0_26z, celloutsig_0_6z, celloutsig_0_16z } || { celloutsig_0_25z[10:0], celloutsig_0_16z };
  assign celloutsig_0_39z = { celloutsig_0_32z[5:3], celloutsig_0_36z, celloutsig_0_33z } || celloutsig_0_25z[17:13];
  assign celloutsig_0_23z = { celloutsig_0_9z[5:2], celloutsig_0_6z, _00_, _03_[3:0], celloutsig_0_2z } || { celloutsig_0_17z[15:7], celloutsig_0_2z, celloutsig_0_12z };
  assign celloutsig_0_8z = { in_data[9:7], celloutsig_0_5z, celloutsig_0_3z } != { _00_, _03_[3:0] };
  assign celloutsig_0_32z = - { celloutsig_0_29z, celloutsig_0_21z };
  assign celloutsig_0_7z = - { celloutsig_0_1z[3:2], celloutsig_0_6z };
  assign celloutsig_0_24z = - { celloutsig_0_20z[1], celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_0_29z = - celloutsig_0_25z[8:3];
  assign celloutsig_0_80z = ~ celloutsig_0_63z[36:32];
  assign celloutsig_0_1z = ~ { in_data[6:4], celloutsig_0_0z };
  assign celloutsig_0_34z = | { _05_[17:3], celloutsig_0_28z, celloutsig_0_10z, celloutsig_0_18z };
  assign celloutsig_0_6z = | { celloutsig_0_1z[1:0], celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_81z = | celloutsig_0_17z[17:7];
  assign celloutsig_0_10z = | { celloutsig_0_7z[0], celloutsig_0_1z };
  assign celloutsig_0_37z = _00_ & celloutsig_0_17z[2];
  assign celloutsig_0_11z = in_data[80] & celloutsig_0_7z[2];
  assign celloutsig_0_22z = celloutsig_0_5z & celloutsig_0_21z;
  assign celloutsig_1_6z = in_data[175:163] << { celloutsig_1_0z[8:7], celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_25z = { celloutsig_0_17z[15:8], celloutsig_0_9z[9:7], celloutsig_0_9z[7], celloutsig_0_9z[5:2], celloutsig_0_9z[2], celloutsig_0_9z[7] } << { _05_[9:3], celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_7z, _00_, _03_[3:0], celloutsig_0_23z };
  assign celloutsig_0_3z = ~((celloutsig_0_2z & celloutsig_0_2z) | celloutsig_0_1z[3]);
  assign celloutsig_1_3z = ~((celloutsig_1_2z[13] & celloutsig_1_1z) | celloutsig_1_2z[7]);
  assign celloutsig_1_19z = ~((celloutsig_1_1z & celloutsig_1_4z) | celloutsig_1_13z);
  assign celloutsig_0_12z = ~((celloutsig_0_1z[3] & celloutsig_0_11z) | (celloutsig_0_6z & celloutsig_0_8z));
  assign celloutsig_0_2z = ~((celloutsig_0_1z[2] & celloutsig_0_1z[3]) | (in_data[52] & celloutsig_0_1z[3]));
  assign { celloutsig_0_9z[8], celloutsig_0_9z[5:3], celloutsig_0_9z[9], celloutsig_0_9z[2], celloutsig_0_9z[7] } = ~ { celloutsig_0_8z, celloutsig_0_7z, _03_[2], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_20z[2:1] = ~ { celloutsig_0_18z, celloutsig_0_11z };
  assign { celloutsig_1_9z[4:3], celloutsig_1_9z[6:5], celloutsig_1_9z[2] } = ~ { celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_2z[13:12], celloutsig_1_1z };
  assign { celloutsig_0_63z[12], celloutsig_0_63z[9:7], celloutsig_0_63z[13], celloutsig_0_63z[6], celloutsig_0_63z[11], celloutsig_0_63z[2], celloutsig_0_63z[0], celloutsig_0_63z[3], celloutsig_0_63z[33:32], celloutsig_0_63z[41:34], celloutsig_0_63z[23:14], celloutsig_0_63z[1] } = ~ { celloutsig_0_9z[8], celloutsig_0_9z[5:3], celloutsig_0_9z[9], celloutsig_0_9z[2], celloutsig_0_9z[7], celloutsig_0_44z, celloutsig_0_37z, celloutsig_0_34z, celloutsig_0_17z, celloutsig_0_13z };
  assign { celloutsig_1_10z[7], celloutsig_1_10z[4:3], celloutsig_1_10z[6:5], celloutsig_1_10z[2] } = ~ { celloutsig_1_7z, celloutsig_1_9z[4:3], celloutsig_1_9z[6:5], celloutsig_1_9z[2] };
  assign { _02_[13], _02_[8], _02_[0] } = { celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_37z };
  assign _03_[4] = _00_;
  assign celloutsig_0_20z[0] = celloutsig_0_20z[1];
  assign { celloutsig_0_63z[31:24], celloutsig_0_63z[10], celloutsig_0_63z[5:4] } = { celloutsig_0_63z[41:34], celloutsig_0_63z[11], celloutsig_0_63z[6], celloutsig_0_63z[11] };
  assign { celloutsig_0_9z[6], celloutsig_0_9z[1:0] } = { celloutsig_0_9z[7], celloutsig_0_9z[2], celloutsig_0_9z[7] };
  assign celloutsig_1_10z[1:0] = celloutsig_1_10z[4:3];
  assign celloutsig_1_9z[1:0] = celloutsig_1_9z[4:3];
  assign { out_data[128], out_data[96], out_data[36:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_80z, celloutsig_0_81z };
endmodule
