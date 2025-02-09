/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [6:0] _00_;
  reg [6:0] _01_;
  reg [3:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire [10:0] celloutsig_0_13z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [3:0] celloutsig_0_1z;
  wire [3:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [3:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [3:0] celloutsig_1_12z;
  wire [2:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [33:0] celloutsig_1_18z;
  wire [9:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [10:0] celloutsig_1_3z;
  wire [8:0] celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_1z = ~((in_data[137] | celloutsig_1_0z) & celloutsig_1_0z);
  assign celloutsig_1_2z = ~((celloutsig_1_1z | in_data[120]) & celloutsig_1_1z);
  assign celloutsig_0_4z = celloutsig_0_0z ^ celloutsig_0_1z[0];
  assign celloutsig_1_7z = celloutsig_1_1z ^ celloutsig_1_2z;
  assign celloutsig_1_8z = in_data[176] ^ celloutsig_1_6z;
  always_ff @(posedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _01_ <= 7'h00;
    else _01_ <= { celloutsig_1_4z[6], _00_[5:0] };
  always_ff @(negedge celloutsig_1_18z[1], negedge clkin_data[32])
    if (!clkin_data[32]) _02_ <= 4'h0;
    else _02_ <= celloutsig_0_2z;
  reg [5:0] _10_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _10_ <= 6'h00;
    else _10_ <= { celloutsig_1_4z[5:1], celloutsig_1_2z };
  assign _00_[5:0] = _10_;
  assign celloutsig_1_14z = _00_[4:2] & celloutsig_1_3z[4:2];
  assign celloutsig_1_18z = { celloutsig_1_4z[7:0], celloutsig_1_7z, _01_, celloutsig_1_12z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_17z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_7z } & { in_data[152:120], celloutsig_1_2z };
  assign celloutsig_1_19z = celloutsig_1_3z[10:1] & in_data[139:130];
  assign celloutsig_0_1z = in_data[30:27] & in_data[92:89];
  assign celloutsig_0_13z = { in_data[19:14], celloutsig_0_2z, celloutsig_0_6z } & in_data[30:20];
  assign celloutsig_0_2z = { celloutsig_0_1z[2:0], celloutsig_0_0z } & in_data[5:2];
  assign celloutsig_1_3z = { in_data[188:180], celloutsig_1_0z, celloutsig_1_1z } & { in_data[128:120], celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_1_4z = celloutsig_1_3z[9:1] & { in_data[132:125], celloutsig_1_0z };
  assign celloutsig_0_0z = in_data[57:38] > in_data[70:51];
  assign celloutsig_1_17z = { celloutsig_1_16z, celloutsig_1_14z, celloutsig_1_16z, celloutsig_1_14z, _00_[5:0], celloutsig_1_6z, _01_ } > { celloutsig_1_14z[1:0], celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_15z, _01_ };
  assign celloutsig_0_8z = { _02_[1:0], celloutsig_0_4z } > { in_data[91:90], celloutsig_0_3z };
  assign celloutsig_0_11z = { celloutsig_0_5z[1:0], celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_0z } > { _02_[0], celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_8z };
  assign celloutsig_0_18z = { celloutsig_0_13z[10:7], celloutsig_0_6z, celloutsig_0_4z } > { celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_0_19z = in_data[38:34] > { celloutsig_0_11z, celloutsig_0_5z };
  assign celloutsig_1_0z = in_data[118:111] > in_data[188:181];
  assign celloutsig_1_6z = celloutsig_1_3z > { _00_[1:0], celloutsig_1_4z };
  assign celloutsig_1_9z = { in_data[167], celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_0z } > { celloutsig_1_4z[4:2], celloutsig_1_8z, _00_[5:0], _00_[5:0] };
  assign celloutsig_1_10z = { in_data[128:113], _00_[5:0], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z } > { celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_6z };
  assign celloutsig_1_15z = ! { _01_[5:4], celloutsig_1_8z };
  assign celloutsig_0_3z = { in_data[20:16], celloutsig_0_1z } !== { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_1_16z = { celloutsig_1_2z, celloutsig_1_15z, celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_9z } !== in_data[130:118];
  assign celloutsig_0_6z = celloutsig_0_5z !== { celloutsig_0_2z[3:1], celloutsig_0_3z };
  assign celloutsig_1_12z = { celloutsig_1_4z[7], celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_10z } >> { celloutsig_1_3z[2], celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_10z };
  assign celloutsig_0_5z = celloutsig_0_2z >> in_data[46:43];
  assign _00_[6] = celloutsig_1_4z[6];
  assign { out_data[159:128], out_data[105:96], out_data[32], out_data[0] } = { celloutsig_1_18z[32:1], celloutsig_1_19z, celloutsig_0_18z, celloutsig_0_19z };
endmodule
