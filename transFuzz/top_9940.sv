/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  reg [6:0] _02_;
  wire [4:0] _03_;
  wire [10:0] _04_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire [8:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [9:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [25:0] celloutsig_0_24z;
  wire [8:0] celloutsig_0_25z;
  wire [8:0] celloutsig_0_26z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [4:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [9:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire [8:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_4z;
  wire [3:0] celloutsig_0_51z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire [4:0] celloutsig_0_60z;
  wire celloutsig_0_6z;
  wire [7:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [9:0] celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire [10:0] celloutsig_1_16z;
  wire [3:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [5:0] celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire [24:0] celloutsig_1_3z;
  wire celloutsig_1_7z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_32z = ~((celloutsig_0_4z | celloutsig_0_25z[2]) & celloutsig_0_31z[1]);
  assign celloutsig_0_38z = ~((_00_ | celloutsig_0_24z[21]) & celloutsig_0_12z);
  assign celloutsig_0_42z = ~((_01_ | celloutsig_0_8z) & celloutsig_0_29z);
  assign celloutsig_0_59z = ~((celloutsig_0_2z | celloutsig_0_34z[1]) & celloutsig_0_51z[2]);
  assign celloutsig_1_7z = ~((celloutsig_1_0z[9] | in_data[150]) & celloutsig_1_3z[21]);
  assign celloutsig_1_19z = ~((celloutsig_1_1z[5] | celloutsig_1_2z[3]) & celloutsig_1_7z);
  assign celloutsig_0_11z = ~((celloutsig_0_9z | celloutsig_0_3z) & celloutsig_0_1z);
  assign celloutsig_0_17z = ~((celloutsig_0_5z | celloutsig_0_7z[1]) & celloutsig_0_4z);
  assign celloutsig_0_21z = ~((celloutsig_0_14z[0] | celloutsig_0_19z) & celloutsig_0_2z);
  assign celloutsig_0_30z = ~((celloutsig_0_9z | celloutsig_0_4z) & celloutsig_0_2z);
  assign celloutsig_0_0z = in_data[81] | ~(in_data[12]);
  assign celloutsig_0_3z = celloutsig_0_0z | ~(celloutsig_0_1z);
  assign celloutsig_0_4z = celloutsig_0_0z | ~(celloutsig_0_2z);
  assign celloutsig_0_47z = celloutsig_0_32z | ~(celloutsig_0_13z);
  assign celloutsig_0_5z = celloutsig_0_0z | ~(celloutsig_0_3z);
  assign celloutsig_0_6z = celloutsig_0_5z | ~(celloutsig_0_0z);
  assign celloutsig_0_8z = celloutsig_0_6z | ~(celloutsig_0_0z);
  assign celloutsig_0_12z = celloutsig_0_3z | ~(celloutsig_0_9z);
  assign celloutsig_0_13z = celloutsig_0_2z | ~(celloutsig_0_8z);
  assign celloutsig_0_18z = celloutsig_0_1z | ~(celloutsig_0_3z);
  assign celloutsig_0_19z = celloutsig_0_10z | ~(celloutsig_0_8z);
  assign celloutsig_0_2z = celloutsig_0_0z | ~(celloutsig_0_0z);
  always_ff @(negedge clkin_data[32], posedge clkin_data[64])
    if (clkin_data[64]) _02_ <= 7'h00;
    else _02_ <= in_data[126:120];
  reg [4:0] _28_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _28_ <= 5'h00;
    else _28_ <= { celloutsig_0_7z[2:0], celloutsig_0_0z, celloutsig_0_9z };
  assign { _03_[4:3], _01_, _03_[1:0] } = _28_;
  reg [10:0] _29_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _29_ <= 11'h000;
    else _29_ <= { celloutsig_0_26z[1], celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_18z, celloutsig_0_4z, celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_19z };
  assign { _04_[10:8], _00_, _04_[6:0] } = _29_;
  assign celloutsig_0_35z = { celloutsig_0_7z[1:0], celloutsig_0_32z, celloutsig_0_0z, celloutsig_0_30z } < { _04_[3], celloutsig_0_21z, celloutsig_0_14z };
  assign celloutsig_1_11z = celloutsig_1_2z[3:1] < { celloutsig_1_2z[3:2], celloutsig_1_7z };
  assign celloutsig_0_9z = in_data[51:44] < { in_data[44], celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_4z };
  assign celloutsig_0_10z = { celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_6z } < { celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_8z };
  assign celloutsig_0_1z = { in_data[53:40], celloutsig_0_0z } < in_data[21:7];
  assign celloutsig_0_20z = { celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_1z } < { _03_[1], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_10z };
  assign celloutsig_0_23z = { celloutsig_0_22z[5], celloutsig_0_21z, celloutsig_0_19z } < { celloutsig_0_16z[4:3], celloutsig_0_17z };
  assign celloutsig_0_29z = { celloutsig_0_26z[4:0], _03_[4:3], _01_, _03_[1:0], celloutsig_0_1z, celloutsig_0_6z } < celloutsig_0_24z[12:1];
  assign celloutsig_0_34z = ~ { celloutsig_0_16z, celloutsig_0_30z };
  assign celloutsig_1_0z = ~ in_data[148:139];
  assign celloutsig_1_1z = ~ celloutsig_1_0z[7:2];
  assign celloutsig_1_2z = ~ celloutsig_1_0z[7:3];
  assign celloutsig_1_3z = ~ { in_data[183:165], celloutsig_1_1z };
  assign celloutsig_0_7z = ~ { in_data[87:86], celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_6z };
  assign celloutsig_1_16z = ~ in_data[156:146];
  assign celloutsig_0_14z = ~ { celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_10z };
  assign celloutsig_0_16z = ~ { in_data[47:43], celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_6z };
  assign celloutsig_0_22z = ~ { celloutsig_0_7z[6:1], celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_19z, celloutsig_0_18z };
  assign celloutsig_0_31z = ~ { celloutsig_0_22z[3], celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_9z };
  assign celloutsig_0_46z = { _04_[9:8], _00_, _04_[6:1] } ^ { celloutsig_0_16z[7:0], celloutsig_0_38z };
  assign celloutsig_0_51z = celloutsig_0_26z[7:4] ^ celloutsig_0_46z[4:1];
  assign celloutsig_0_60z = { celloutsig_0_9z, celloutsig_0_42z, celloutsig_0_47z, celloutsig_0_19z, celloutsig_0_35z } ^ celloutsig_0_7z[4:0];
  assign celloutsig_1_18z = { celloutsig_1_16z[7:5], celloutsig_1_11z } ^ _02_[6:3];
  assign celloutsig_0_24z = { in_data[73:59], celloutsig_0_2z, celloutsig_0_16z, celloutsig_0_2z } ^ { in_data[70], celloutsig_0_23z, celloutsig_0_5z, celloutsig_0_20z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_11z };
  assign celloutsig_0_25z = { _03_[4:3], _01_, _03_[1:0], celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_17z } ^ { celloutsig_0_16z[8:2], celloutsig_0_12z, celloutsig_0_6z };
  assign celloutsig_0_26z = { celloutsig_0_24z[23:16], celloutsig_0_18z } ^ { celloutsig_0_16z[6:0], celloutsig_0_19z, celloutsig_0_11z };
  assign _03_[2] = _01_;
  assign _04_[7] = _00_;
  assign { out_data[131:128], out_data[96], out_data[32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_59z, celloutsig_0_60z };
endmodule
