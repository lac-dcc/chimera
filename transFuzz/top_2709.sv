/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [24:0] celloutsig_0_1z;
  wire celloutsig_0_2z;
  wire celloutsig_0_5z;
  wire [5:0] celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [15:0] celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [24:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_5z = ~(celloutsig_0_2z ^ out_data[32]);
  assign celloutsig_1_3z = ~(in_data[182] ^ celloutsig_1_2z[1]);
  assign celloutsig_1_8z = ~(celloutsig_1_4z ^ celloutsig_1_6z);
  assign celloutsig_1_12z = ~(celloutsig_1_3z ^ celloutsig_1_9z[2]);
  assign celloutsig_1_18z = ~(celloutsig_1_4z ^ celloutsig_1_11z);
  assign celloutsig_0_2z = ~(celloutsig_0_1z[12] ^ celloutsig_0_1z[19]);
  reg [6:0] _06_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _06_ <= 7'h00;
    else _06_ <= in_data[39:33];
  assign out_data[38:32] = _06_;
  assign celloutsig_1_0z = in_data[124:119] & in_data[132:127];
  assign celloutsig_1_1z = celloutsig_1_0z[2:0] & in_data[168:166];
  assign celloutsig_1_2z = celloutsig_1_0z[2:0] & in_data[133:131];
  assign celloutsig_1_13z = in_data[126:111] & { in_data[151:138], celloutsig_1_6z, celloutsig_1_7z };
  assign celloutsig_1_7z = celloutsig_1_4z & ~(in_data[120]);
  assign celloutsig_1_4z = { celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_3z } !== { in_data[129:110], celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_5z = celloutsig_1_0z !== { in_data[150:148], celloutsig_1_2z };
  assign celloutsig_1_19z = celloutsig_1_9z[22:13] !== { celloutsig_1_13z[15:7], celloutsig_1_12z };
  assign celloutsig_1_9z = { in_data[131:113], celloutsig_1_0z } <<< { in_data[136:127], celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_0_1z = in_data[83:59] <<< in_data[53:29];
  assign celloutsig_1_6z = ~((celloutsig_1_1z[1] & in_data[120]) | (celloutsig_1_4z & celloutsig_1_1z[2]));
  assign celloutsig_1_11z = ~((celloutsig_1_3z & celloutsig_1_5z) | (celloutsig_1_1z[1] & celloutsig_1_7z));
  assign { out_data[128], out_data[96], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_5z };
endmodule
