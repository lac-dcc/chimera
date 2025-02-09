/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [36:0] _00_;
  reg [34:0] _01_;
  reg [34:0] _02_;
  reg [2:0] _03_;
  wire celloutsig_0_0z;
  wire [18:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire [3:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire [2:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire [12:0] celloutsig_1_19z;
  wire [5:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_24z = ~(celloutsig_0_2z & celloutsig_0_19z);
  assign celloutsig_0_3z = ~(celloutsig_0_2z | celloutsig_0_1z);
  assign celloutsig_0_14z = ~(celloutsig_0_2z | celloutsig_0_5z);
  assign celloutsig_1_13z = ~celloutsig_1_9z;
  assign celloutsig_0_2z = ~((in_data[47] | in_data[83]) & (celloutsig_0_0z | celloutsig_0_0z));
  always_ff @(negedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _01_ <= 35'h000000000;
    else _01_ <= { celloutsig_1_1z[3:2], celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_11z, celloutsig_1_13z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_5z, celloutsig_1_1z };
  always_ff @(posedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _02_ <= 35'h000000000;
    else _02_ <= { _01_[26:4], celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_12z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_13z, celloutsig_1_4z, celloutsig_1_11z, celloutsig_1_2z, celloutsig_1_6z };
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _03_ <= 3'h0;
    else _03_ <= { celloutsig_0_14z, celloutsig_0_14z, celloutsig_0_7z };
  always_ff @(posedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _00_ <= 37'h0000000000;
    else _00_ <= { celloutsig_1_1z[3:2], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_5z };
  assign celloutsig_0_6z = in_data[3:0] === { in_data[64:62], celloutsig_0_5z };
  assign celloutsig_0_17z = { celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_13z } === { _03_[1:0], celloutsig_0_8z };
  assign celloutsig_0_7z = { in_data[40:39], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_0z } >= { celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_0_13z = { celloutsig_0_4z[3:2], celloutsig_0_0z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_1z } >= { in_data[39:34], celloutsig_0_12z };
  assign celloutsig_1_0z = in_data[125:120] >= in_data[108:103];
  assign celloutsig_1_2z = { in_data[168], celloutsig_1_1z } >= { celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_8z = { _00_[15:6], celloutsig_1_4z, celloutsig_1_4z } > { in_data[183:173], celloutsig_1_4z };
  assign celloutsig_0_8z = { in_data[73], celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_3z } > { celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_19z = { celloutsig_0_3z, celloutsig_0_14z, _03_, celloutsig_0_3z, celloutsig_0_1z } > { celloutsig_0_10z[17:14], celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_6z };
  assign celloutsig_0_1z = { in_data[28:24], celloutsig_0_0z } && { in_data[13:9], celloutsig_0_0z };
  assign celloutsig_1_18z = { _02_[29:28], celloutsig_1_6z, celloutsig_1_2z } < celloutsig_1_1z[5:2];
  assign celloutsig_0_5z = { in_data[91:80], celloutsig_0_0z, celloutsig_0_4z } < { in_data[82:80], celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_1_9z = { celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z } != { celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_1_12z = { celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z } != { celloutsig_1_1z[3:2], celloutsig_1_0z };
  assign celloutsig_1_1z = - in_data[164:159];
  assign celloutsig_1_4z = celloutsig_1_0z & in_data[104];
  assign celloutsig_1_5z = celloutsig_1_3z & celloutsig_1_1z[1];
  assign celloutsig_1_3z = ~^ { celloutsig_1_1z[1:0], celloutsig_1_0z };
  assign celloutsig_0_0z = ^ in_data[80:66];
  assign celloutsig_0_11z = ^ in_data[68:65];
  assign celloutsig_0_23z = ^ { in_data[20:9], celloutsig_0_17z, celloutsig_0_2z };
  assign celloutsig_1_6z = ^ in_data[113:106];
  assign celloutsig_0_4z = in_data[8:5] >> in_data[32:29];
  assign celloutsig_0_10z = { in_data[19:2], celloutsig_0_2z } >> { in_data[32:18], celloutsig_0_4z };
  assign celloutsig_0_12z = { celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_6z } >> celloutsig_0_4z;
  assign celloutsig_1_11z = in_data[164:162] >>> { in_data[97], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_19z = { _02_[24:13], celloutsig_1_3z } >>> { in_data[168:157], celloutsig_1_6z };
  assign { out_data[128], out_data[108:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_23z, celloutsig_0_24z };
endmodule
