/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [19:0] _00_;
  reg [6:0] _01_;
  wire [3:0] celloutsig_0_0z;
  wire [4:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [3:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [5:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [2:0] celloutsig_0_19z;
  wire [3:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [10:0] celloutsig_0_23z;
  wire [11:0] celloutsig_0_24z;
  wire [6:0] celloutsig_0_2z;
  wire [5:0] celloutsig_0_33z;
  wire [13:0] celloutsig_0_34z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [8:0] celloutsig_0_5z;
  wire [2:0] celloutsig_0_6z;
  wire [3:0] celloutsig_0_7z;
  wire [23:0] celloutsig_0_8z;
  wire [8:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [7:0] celloutsig_1_12z;
  wire [10:0] celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [14:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [19:0] celloutsig_1_7z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_1z = celloutsig_1_0z ? in_data[119] : in_data[105];
  assign celloutsig_0_11z = ~((celloutsig_0_1z[1] | celloutsig_0_6z[0]) & (celloutsig_0_5z[0] | celloutsig_0_0z[2]));
  assign celloutsig_0_15z = celloutsig_0_5z[1] | celloutsig_0_9z[2];
  assign celloutsig_0_33z = { celloutsig_0_24z[8:5], celloutsig_0_12z, celloutsig_0_4z } + { celloutsig_0_2z[2:1], celloutsig_0_20z, celloutsig_0_19z };
  assign celloutsig_1_7z = { celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_2z } + { celloutsig_1_4z[13:0], _00_[5:2], celloutsig_1_1z, celloutsig_1_5z };
  reg [3:0] _07_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _07_ <= 4'h0;
    else _07_ <= in_data[152:149];
  assign _00_[5:2] = _07_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _01_ <= 7'h00;
    else _01_ <= celloutsig_0_9z[8:2];
  assign celloutsig_1_4z = in_data[173:159] & { in_data[130:117], celloutsig_1_0z };
  assign celloutsig_0_19z = { celloutsig_0_2z[4], celloutsig_0_11z, celloutsig_0_4z } & celloutsig_0_17z[5:3];
  assign celloutsig_0_14z = celloutsig_0_8z[3:0] / { 1'h1, celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_3z };
  assign celloutsig_0_4z = { celloutsig_0_2z[5:0], celloutsig_0_1z } == { celloutsig_0_2z[6:4], celloutsig_0_2z };
  assign celloutsig_1_2z = in_data[187:172] > in_data[116:101];
  assign celloutsig_0_12z = celloutsig_0_7z && celloutsig_0_9z[5:2];
  assign celloutsig_1_18z = celloutsig_1_13z[3] & ~(celloutsig_1_7z[0]);
  assign celloutsig_1_19z = celloutsig_1_1z & ~(_00_[4]);
  assign celloutsig_0_20z = celloutsig_0_9z[0] & ~(celloutsig_0_6z[2]);
  assign celloutsig_0_34z = { celloutsig_0_23z[5:3], celloutsig_0_15z, celloutsig_0_0z, celloutsig_0_21z, celloutsig_0_14z, celloutsig_0_18z } % { 1'h1, _01_[5:0], celloutsig_0_2z };
  assign celloutsig_1_13z = { celloutsig_1_12z[6:0], _00_[5:2] } % { 1'h1, celloutsig_1_4z[13:5], celloutsig_1_0z };
  assign celloutsig_0_6z = { in_data[43:42], celloutsig_0_4z } % { 1'h1, celloutsig_0_2z[5:4] };
  assign celloutsig_0_2z = { in_data[60:58], celloutsig_0_0z } % { 1'h1, celloutsig_0_0z[2:1], celloutsig_0_1z };
  assign celloutsig_0_0z = in_data[52:49] % { 1'h1, in_data[26:24] };
  assign celloutsig_0_24z = { celloutsig_0_0z[1:0], celloutsig_0_20z, celloutsig_0_9z } * { celloutsig_0_23z[7:6], celloutsig_0_18z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_6z };
  assign celloutsig_0_3z = in_data[21] & in_data[86];
  assign celloutsig_1_0z = in_data[181] & in_data[155];
  assign celloutsig_1_5z = celloutsig_1_2z & celloutsig_1_0z;
  assign celloutsig_0_18z = celloutsig_0_2z[4] & celloutsig_0_6z[1];
  assign celloutsig_0_21z = | { celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_8z[14:4] };
  assign celloutsig_1_12z = celloutsig_1_4z[14:7] << celloutsig_1_7z[7:0];
  assign celloutsig_0_9z = { celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_1z } << { celloutsig_0_5z[2:1], celloutsig_0_2z };
  assign celloutsig_0_5z = in_data[43:35] <<< { celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_1z = in_data[78:75] <<< in_data[28:25];
  assign celloutsig_0_7z = celloutsig_0_1z >>> celloutsig_0_1z;
  assign celloutsig_0_23z = { celloutsig_0_1z[2], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_10z } >>> { celloutsig_0_9z[7:0], celloutsig_0_6z };
  assign celloutsig_0_10z = { celloutsig_0_4z, celloutsig_0_1z } - { celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_0_8z = { in_data[68:61], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_1z } ^ { in_data[8:7], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_0_17z = { celloutsig_0_2z[6:3], celloutsig_0_15z, celloutsig_0_3z } ^ celloutsig_0_2z[5:0];
  assign { _00_[19:6], _00_[1:0] } = { celloutsig_1_4z[13:0], celloutsig_1_1z, celloutsig_1_5z };
  assign { out_data[128], out_data[96], out_data[37:32], out_data[13:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_33z, celloutsig_0_34z };
endmodule
