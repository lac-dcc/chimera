/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [12:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [11:0] celloutsig_0_12z;
  wire [5:0] celloutsig_0_1z;
  wire [9:0] celloutsig_0_29z;
  reg [3:0] celloutsig_0_2z;
  wire [21:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_59z;
  wire [9:0] celloutsig_0_5z;
  wire [9:0] celloutsig_0_60z;
  reg [7:0] celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire [9:0] celloutsig_1_13z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [6:0] celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire [3:0] celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_4z = ~(celloutsig_0_1z[5] & in_data[45]);
  assign celloutsig_0_10z = !(celloutsig_0_2z[0] ? celloutsig_0_4z : celloutsig_0_8z);
  assign celloutsig_0_59z = celloutsig_0_12z[3] | ~(celloutsig_0_10z);
  assign celloutsig_1_0z = in_data[126] | ~(in_data[147]);
  assign celloutsig_1_12z = celloutsig_1_10z | ~(celloutsig_1_7z);
  assign celloutsig_1_19z = celloutsig_1_2z[0] | ~(celloutsig_1_17z);
  assign celloutsig_0_8z = celloutsig_0_5z[5] | ~(celloutsig_0_2z[1]);
  assign celloutsig_1_1z = in_data[154:148] & { in_data[184:179], celloutsig_1_0z };
  assign celloutsig_1_4z = celloutsig_1_1z[6:3] & celloutsig_1_1z[3:0];
  assign celloutsig_1_10z = celloutsig_1_2z[2:0] === { celloutsig_1_2z[4:3], celloutsig_1_8z };
  assign celloutsig_1_8z = { celloutsig_1_1z[1:0], celloutsig_1_4z } < in_data[134:129];
  assign celloutsig_1_6z = celloutsig_1_3z[1] & ~(celloutsig_1_1z[3]);
  assign celloutsig_1_2z = { in_data[134:131], celloutsig_1_0z } * celloutsig_1_1z[5:1];
  assign celloutsig_0_29z = ~ { celloutsig_0_12z[7:6], celloutsig_0_6z };
  assign celloutsig_0_5z = { celloutsig_0_3z[14:9], celloutsig_0_2z } | celloutsig_0_3z[18:9];
  assign celloutsig_0_1z = celloutsig_0_0z[9:4] | celloutsig_0_0z[10:5];
  assign celloutsig_1_7z = ~^ { celloutsig_1_4z[2:1], celloutsig_1_3z };
  assign celloutsig_1_17z = ~^ { celloutsig_1_13z[3], celloutsig_1_6z, celloutsig_1_4z };
  assign celloutsig_1_18z = ~^ { in_data[172:165], celloutsig_1_7z };
  assign celloutsig_0_60z = celloutsig_0_29z << celloutsig_0_0z[10:1];
  assign celloutsig_0_12z = { celloutsig_0_6z[5:1], celloutsig_0_4z, celloutsig_0_1z } << celloutsig_0_0z[11:0];
  assign celloutsig_0_0z = in_data[58:46] <<< in_data[79:67];
  assign celloutsig_0_3z = in_data[56:35] <<< { in_data[27:16], celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_1_3z = celloutsig_1_1z[3:1] <<< in_data[133:131];
  assign celloutsig_1_13z = { in_data[156:155], celloutsig_1_8z, celloutsig_1_12z, celloutsig_1_10z, celloutsig_1_2z } <<< in_data[184:175];
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_6z = 8'h00;
    else if (!clkin_data[0]) celloutsig_0_6z = in_data[17:10];
  always_latch
    if (celloutsig_1_19z) celloutsig_0_2z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_2z = in_data[64:61];
  assign { out_data[128], out_data[96], out_data[32], out_data[9:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_59z, celloutsig_0_60z };
endmodule
