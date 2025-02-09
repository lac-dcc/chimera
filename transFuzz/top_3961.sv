/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [7:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_1z;
  wire [31:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [7:0] celloutsig_0_5z;
  reg [3:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [9:0] celloutsig_1_2z;
  wire [12:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  reg [14:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_19z = celloutsig_1_8z[14] ? celloutsig_1_16z : celloutsig_1_10z;
  assign celloutsig_0_4z = !(celloutsig_0_3z ? in_data[87] : celloutsig_0_1z);
  assign celloutsig_0_8z = ~celloutsig_0_5z[6];
  assign celloutsig_0_1z = ~celloutsig_0_0z;
  assign celloutsig_1_15z = ~celloutsig_1_11z;
  always_ff @(posedge clkin_data[96], negedge clkin_data[64])
    if (!clkin_data[64]) _00_ <= 8'h00;
    else _00_ <= in_data[154:147];
  assign celloutsig_1_3z = in_data[164] ? in_data[109:97] : { in_data[145:136], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_1z = in_data[136:129] != { in_data[166:162], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_2z = - in_data[40:9];
  assign celloutsig_0_3z = in_data[80:69] !== celloutsig_0_2z[26:15];
  assign celloutsig_1_17z = { celloutsig_1_8z[13:2], celloutsig_1_9z } !== { in_data[153:144], celloutsig_1_0z, celloutsig_1_14z, celloutsig_1_6z };
  assign celloutsig_0_0z = | in_data[39:25];
  assign celloutsig_1_5z = | celloutsig_1_3z;
  assign celloutsig_1_9z = | { celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_1_10z = | { celloutsig_1_3z[10:2], celloutsig_1_6z, celloutsig_1_6z };
  assign celloutsig_1_11z = | { celloutsig_1_3z[11:9], celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_10z, celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_1_13z = | { in_data[163:161], celloutsig_1_11z, celloutsig_1_10z };
  assign celloutsig_1_18z = celloutsig_1_2z[4:2] <<< { celloutsig_1_2z[3], celloutsig_1_15z, celloutsig_1_17z };
  assign celloutsig_0_5z = { celloutsig_0_2z[17:16], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_4z } >>> { celloutsig_0_2z[19:15], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_1_2z = { in_data[174:167], celloutsig_1_0z, celloutsig_1_0z } >>> { in_data[123:118], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_7z = ~((celloutsig_0_6z[0] & celloutsig_0_0z) | celloutsig_0_6z[0]);
  assign celloutsig_1_0z = ~((in_data[151] & in_data[177]) | in_data[110]);
  assign celloutsig_1_4z = ~((celloutsig_1_1z & celloutsig_1_2z[4]) | celloutsig_1_3z[1]);
  assign celloutsig_1_6z = ~((celloutsig_1_5z & celloutsig_1_3z[11]) | in_data[138]);
  assign celloutsig_1_14z = ~((celloutsig_1_13z & _00_[0]) | celloutsig_1_6z);
  assign celloutsig_1_16z = ~((celloutsig_1_0z & celloutsig_1_3z[7]) | celloutsig_1_15z);
  always_latch
    if (!clkin_data[32]) celloutsig_0_6z = 4'h0;
    else if (!celloutsig_1_19z) celloutsig_0_6z = in_data[77:74];
  always_latch
    if (!clkin_data[64]) celloutsig_1_8z = 15'h0000;
    else if (clkin_data[0]) celloutsig_1_8z = { in_data[152], celloutsig_1_0z, celloutsig_1_3z };
  assign { out_data[130:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_7z, celloutsig_0_8z };
endmodule
