/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [25:0] _02_;
  wire [7:0] celloutsig_0_0z;
  wire [4:0] celloutsig_0_10z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [2:0] celloutsig_0_19z;
  wire [10:0] celloutsig_0_1z;
  wire celloutsig_0_25z;
  wire [11:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_33z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_49z;
  reg [8:0] celloutsig_0_4z;
  wire celloutsig_0_53z;
  wire celloutsig_0_5z;
  wire [14:0] celloutsig_0_6z;
  wire celloutsig_0_76z;
  wire celloutsig_0_81z;
  wire celloutsig_0_82z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_14z;
  wire [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [5:0] celloutsig_1_3z;
  wire [5:0] celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_49z = celloutsig_0_13z ? celloutsig_0_9z : celloutsig_0_33z;
  assign celloutsig_0_5z = in_data[41] ? celloutsig_0_1z[1] : celloutsig_0_4z[0];
  assign celloutsig_0_82z = celloutsig_0_49z ? celloutsig_0_53z : celloutsig_0_76z;
  assign celloutsig_0_3z = ~(celloutsig_0_2z & celloutsig_0_0z[7]);
  assign celloutsig_0_81z = ~(celloutsig_0_2z & celloutsig_0_29z[10]);
  assign celloutsig_1_9z = ~(celloutsig_1_7z[3] & in_data[182]);
  assign celloutsig_1_19z = ~(celloutsig_1_14z & in_data[155]);
  assign celloutsig_0_13z = ~(in_data[8] & celloutsig_0_10z[3]);
  assign celloutsig_0_15z = ~(celloutsig_0_5z & celloutsig_0_5z);
  assign celloutsig_0_37z = ~(celloutsig_0_29z[5] | celloutsig_0_1z[0]);
  assign celloutsig_0_38z = ~(celloutsig_0_8z | celloutsig_0_12z[1]);
  assign celloutsig_1_0z = ~(in_data[149] | in_data[115]);
  assign celloutsig_0_9z = ~(_01_ | celloutsig_0_6z[12]);
  assign celloutsig_0_53z = ~(celloutsig_0_19z[2] ^ celloutsig_0_38z);
  assign celloutsig_1_14z = ~(celloutsig_1_3z[0] ^ celloutsig_1_9z);
  assign celloutsig_0_2z = ~(in_data[69] ^ celloutsig_0_0z[0]);
  reg [25:0] _19_;
  always_ff @(negedge celloutsig_1_19z, negedge clkin_data[96])
    if (!clkin_data[96]) _19_ <= 26'h0000000;
    else _19_ <= { in_data[79:70], celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_3z };
  assign { _02_[25:12], _01_, _02_[10:9], _00_, _02_[7:0] } = _19_;
  assign celloutsig_0_33z = celloutsig_0_0z[6:2] < { celloutsig_0_19z[2:1], celloutsig_0_19z };
  assign celloutsig_1_2z = { in_data[104], celloutsig_1_1z } < in_data[182:178];
  assign celloutsig_1_1z = { in_data[117], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } % { 1'h1, in_data[174:172] };
  assign celloutsig_1_7z = celloutsig_1_3z % { 1'h1, in_data[150:146] };
  assign celloutsig_0_10z = celloutsig_0_1z[5:1] % { 1'h1, celloutsig_0_0z[4:1] };
  assign celloutsig_0_1z = in_data[43:33] % { 1'h1, in_data[35:26] };
  assign celloutsig_0_19z = { celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_8z } % { 1'h1, celloutsig_0_15z, celloutsig_0_9z };
  assign celloutsig_0_12z = { celloutsig_0_6z[9], celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_8z } * in_data[42:39];
  assign celloutsig_0_76z = celloutsig_0_37z & celloutsig_0_13z;
  assign celloutsig_0_8z = in_data[2] & celloutsig_0_3z;
  assign celloutsig_0_18z = celloutsig_0_12z[2] & celloutsig_0_15z;
  assign celloutsig_0_25z = _02_[21] & celloutsig_0_2z;
  assign celloutsig_0_6z = { celloutsig_0_1z[9:4], celloutsig_0_0z, celloutsig_0_5z } << { celloutsig_0_1z[3:0], celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_4z };
  assign celloutsig_1_3z = { in_data[111:109], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z } << in_data[184:179];
  assign celloutsig_1_18z = celloutsig_1_1z[2:0] << celloutsig_1_3z[4:2];
  assign celloutsig_0_17z = { celloutsig_0_6z[3:2], celloutsig_0_13z } << { _00_, _02_[7], celloutsig_0_3z };
  assign celloutsig_0_29z = { celloutsig_0_17z[2:1], celloutsig_0_8z, celloutsig_0_4z } << { celloutsig_0_25z, celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_8z };
  assign celloutsig_0_0z = in_data[40:33] >>> in_data[10:3];
  always_latch
    if (!clkin_data[96]) celloutsig_0_4z = 9'h000;
    else if (clkin_data[0]) celloutsig_0_4z = { celloutsig_0_0z, celloutsig_0_2z };
  assign { _02_[11], _02_[8] } = { _01_, _00_ };
  assign { out_data[130:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_81z, celloutsig_0_82z };
endmodule
