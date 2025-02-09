/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [8:0] _00_;
  reg [11:0] _01_;
  wire [2:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [15:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [14:0] celloutsig_0_19z;
  wire [5:0] celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  reg [4:0] celloutsig_0_21z;
  wire [2:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [2:0] celloutsig_0_28z;
  wire [8:0] celloutsig_0_29z;
  wire [3:0] celloutsig_0_2z;
  wire [45:0] celloutsig_0_30z;
  wire [12:0] celloutsig_0_31z;
  wire [18:0] celloutsig_0_32z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire [15:0] celloutsig_0_4z;
  wire [3:0] celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire [2:0] celloutsig_0_63z;
  wire celloutsig_0_6z;
  wire celloutsig_0_71z;
  wire [5:0] celloutsig_0_72z;
  wire celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire [3:0] celloutsig_1_19z;
  wire [8:0] celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [2:0] celloutsig_1_8z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_41z = celloutsig_0_27z ? celloutsig_0_3z : celloutsig_0_28z[2];
  assign celloutsig_0_6z = celloutsig_0_4z[0] ? celloutsig_0_5z[3] : in_data[23];
  assign celloutsig_1_18z = celloutsig_1_5z ? celloutsig_1_5z : celloutsig_1_4z;
  assign celloutsig_0_11z = celloutsig_0_0z[1] ? celloutsig_0_2z[0] : celloutsig_0_4z[8];
  assign celloutsig_0_26z = celloutsig_0_7z ? in_data[5] : celloutsig_0_12z;
  assign celloutsig_1_0z = !(in_data[155] ? in_data[179] : in_data[137]);
  assign celloutsig_0_9z = !(celloutsig_0_6z ? 1'h1 : celloutsig_0_5z[1]);
  assign celloutsig_0_17z = !(celloutsig_0_15z[1] ? celloutsig_0_11z : celloutsig_0_16z);
  assign celloutsig_0_3z = ~in_data[42];
  assign celloutsig_0_29z = { celloutsig_0_12z, _00_[7:0] } + { celloutsig_0_5z[2], celloutsig_0_27z, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_6z };
  assign celloutsig_0_30z = { _00_[7:0], celloutsig_0_3z, celloutsig_0_26z, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_29z, celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_24z, celloutsig_0_14z, celloutsig_0_15z[15:10], celloutsig_0_4z[6], celloutsig_0_15z[8:1], celloutsig_0_2z[0], celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_13z } + { celloutsig_0_3z, celloutsig_0_28z, celloutsig_0_24z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_27z, _00_[7:0], celloutsig_0_1z, celloutsig_0_14z, celloutsig_0_23z, celloutsig_0_7z, celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_10z };
  assign celloutsig_0_23z = celloutsig_0_4z[8:6] + { 1'h1, celloutsig_0_13z, celloutsig_0_16z };
  assign celloutsig_0_28z = in_data[27:25] + { in_data[21:20], celloutsig_0_13z };
  always_ff @(negedge celloutsig_1_19z[0], negedge clkin_data[64])
    if (!clkin_data[64]) _01_ <= 12'h000;
    else _01_ <= celloutsig_0_4z[11:0];
  reg [7:0] _16_;
  always_ff @(negedge celloutsig_1_19z[0], posedge clkin_data[64])
    if (clkin_data[64]) _16_ <= 8'h00;
    else _16_ <= { celloutsig_0_4z[6:0], celloutsig_0_12z };
  assign _00_[7:0] = _16_;
  assign celloutsig_0_32z = { celloutsig_0_28z[2], celloutsig_0_26z, celloutsig_0_17z, celloutsig_0_4z } & in_data[86:68];
  assign celloutsig_0_4z = { in_data[14:6], celloutsig_0_1z, celloutsig_0_3z } & { celloutsig_0_2z[0], celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_72z = celloutsig_0_30z[8:3] & { celloutsig_0_15z[7:4], celloutsig_0_40z, celloutsig_0_39z };
  assign celloutsig_1_2z = in_data[162:154] & in_data[111:103];
  assign celloutsig_0_1z = in_data[17:12] & { in_data[66:64], celloutsig_0_0z };
  assign celloutsig_0_20z = { celloutsig_0_8z[2], celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_13z } & celloutsig_0_19z[10:7];
  assign celloutsig_1_5z = { celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_0z } >= in_data[155:153];
  assign celloutsig_0_14z = celloutsig_0_4z[2:0] >= celloutsig_0_4z[14:12];
  assign celloutsig_0_24z = { celloutsig_0_23z[1:0], celloutsig_0_20z, celloutsig_0_14z, celloutsig_0_19z, celloutsig_0_17z } >= { in_data[89:85], celloutsig_0_4z, celloutsig_0_16z, celloutsig_0_16z };
  assign celloutsig_0_27z = { celloutsig_0_15z[11:10], celloutsig_0_4z[6], celloutsig_0_15z[8:2], celloutsig_0_3z, celloutsig_0_7z } >= { celloutsig_0_23z[1:0], celloutsig_0_2z, celloutsig_0_23z, celloutsig_0_17z, celloutsig_0_3z, celloutsig_0_11z };
  assign celloutsig_0_12z = { in_data[8:7], celloutsig_0_9z, celloutsig_0_3z } <= { celloutsig_0_2z[3:2], celloutsig_0_6z, celloutsig_0_6z };
  assign celloutsig_0_13z = celloutsig_0_2z[3:1] <= celloutsig_0_1z[4:2];
  assign celloutsig_0_39z = celloutsig_0_31z[6] & ~(celloutsig_0_9z);
  assign celloutsig_0_40z = celloutsig_0_31z[6] & ~(celloutsig_0_1z[0]);
  assign celloutsig_1_14z = celloutsig_1_0z & ~(celloutsig_1_4z);
  assign celloutsig_0_16z = celloutsig_0_15z[11] & ~(celloutsig_0_15z[2]);
  assign celloutsig_0_61z = { _01_[5:4], celloutsig_0_40z, celloutsig_0_16z } != _00_[7:4];
  assign celloutsig_0_7z = { celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_6z } != in_data[85:74];
  assign celloutsig_1_4z = in_data[159:155] != celloutsig_1_2z[8:4];
  assign celloutsig_0_0z = in_data[95:93] >> in_data[35:33];
  assign celloutsig_1_8z = { celloutsig_1_2z[5:4], celloutsig_1_5z } >> { in_data[189:188], celloutsig_1_4z };
  assign celloutsig_1_19z = celloutsig_1_2z[6:3] >> { celloutsig_1_14z, celloutsig_1_8z };
  assign celloutsig_0_2z = in_data[66:63] >> in_data[14:11];
  assign celloutsig_0_31z = { celloutsig_0_15z[15:10], celloutsig_0_4z[6], celloutsig_0_15z[8:7], celloutsig_0_2z } ~^ { celloutsig_0_1z[5:1], celloutsig_0_10z, celloutsig_0_18z, celloutsig_0_24z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_11z };
  assign celloutsig_0_5z = celloutsig_0_1z[5:2] ~^ { celloutsig_0_4z[15], celloutsig_0_0z };
  assign celloutsig_0_63z = { celloutsig_0_4z[13:12], celloutsig_0_16z } ~^ { celloutsig_0_32z[3:2], celloutsig_0_41z };
  assign celloutsig_0_19z = { in_data[37:24], celloutsig_0_18z } ~^ { celloutsig_0_2z[3:1], celloutsig_0_16z, celloutsig_0_1z, celloutsig_0_17z, celloutsig_0_7z, celloutsig_0_0z };
  always_latch
    if (clkin_data[96]) celloutsig_0_21z = 5'h00;
    else if (!clkin_data[0]) celloutsig_0_21z = celloutsig_0_15z[7:3];
  assign celloutsig_0_71z = ~((celloutsig_0_63z[2] & celloutsig_0_61z) | (celloutsig_0_15z[4] & celloutsig_0_21z[1]));
  assign celloutsig_0_10z = ~((celloutsig_0_5z[2] & celloutsig_0_9z) | (celloutsig_0_6z & celloutsig_0_4z[10]));
  assign celloutsig_0_18z = ~((celloutsig_0_13z & celloutsig_0_11z) | (celloutsig_0_6z & in_data[50]));
  assign { celloutsig_0_8z[1], celloutsig_0_8z[2] } = { celloutsig_0_7z, celloutsig_0_6z } ~^ { celloutsig_0_5z[1], celloutsig_0_5z[2] };
  assign { celloutsig_0_15z[10], celloutsig_0_15z[1], celloutsig_0_15z[15], celloutsig_0_15z[11], celloutsig_0_15z[2], celloutsig_0_15z[12], celloutsig_0_15z[8], celloutsig_0_15z[14], celloutsig_0_15z[3], celloutsig_0_15z[13], celloutsig_0_15z[7:4] } = { celloutsig_0_8z[1], celloutsig_0_8z[1], celloutsig_0_8z[2], celloutsig_0_8z[2], celloutsig_0_8z[2], celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_2z } ~^ { celloutsig_0_4z[7], celloutsig_0_2z[1], celloutsig_0_4z[12], celloutsig_0_4z[8], celloutsig_0_2z[2], celloutsig_0_4z[9], celloutsig_0_4z[5], celloutsig_0_4z[11], celloutsig_0_2z[3], celloutsig_0_4z[10], celloutsig_0_4z[4:1] };
  assign _00_[8] = celloutsig_0_12z;
  assign { celloutsig_0_15z[9], celloutsig_0_15z[0] } = { celloutsig_0_4z[6], celloutsig_0_2z[0] };
  assign celloutsig_0_8z[0] = 1'h1;
  assign { out_data[128], out_data[99:96], out_data[32], out_data[5:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_71z, celloutsig_0_72z };
endmodule
