/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [19:0] celloutsig_0_0z;
  reg [3:0] celloutsig_0_1z;
  wire [4:0] celloutsig_0_2z;
  wire [4:0] celloutsig_1_0z;
  wire [44:0] celloutsig_1_10z;
  wire [18:0] celloutsig_1_13z;
  wire [3:0] celloutsig_1_14z;
  wire [17:0] celloutsig_1_16z;
  wire [2:0] celloutsig_1_19z;
  wire [4:0] celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire [11:0] celloutsig_1_3z;
  wire [17:0] celloutsig_1_4z;
  wire [2:0] celloutsig_1_5z;
  wire [15:0] celloutsig_1_6z;
  wire [42:0] celloutsig_1_7z;
  wire [24:0] celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[62:43] ~^ in_data[30:11];
  assign celloutsig_1_0z = in_data[165:161] ~^ in_data[179:175];
  assign celloutsig_1_1z = in_data[178:174] ~^ celloutsig_1_0z;
  assign celloutsig_1_2z = celloutsig_1_1z[4:2] ~^ celloutsig_1_0z[2:0];
  assign celloutsig_1_3z = in_data[143:132] ~^ { celloutsig_1_1z[4:1], celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_5z = in_data[160:158] ~^ in_data[115:113];
  assign celloutsig_1_9z = celloutsig_1_8z[23:21] ~^ celloutsig_1_7z[8:6];
  assign celloutsig_1_10z = { celloutsig_1_6z[12:3], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_5z, celloutsig_1_1z } ~^ { celloutsig_1_4z[14:13], celloutsig_1_7z[42:5], celloutsig_1_6z[4:0] };
  assign celloutsig_1_13z = { in_data[163:150], celloutsig_1_0z } ~^ { celloutsig_1_8z[24:11], out_data[129:128], celloutsig_1_8z[8:6] };
  assign celloutsig_1_14z = celloutsig_1_13z[16:13] ~^ celloutsig_1_0z[3:0];
  assign celloutsig_1_16z = celloutsig_1_10z[27:10] ~^ { celloutsig_1_5z[1:0], celloutsig_1_3z, celloutsig_1_14z };
  assign celloutsig_1_19z = celloutsig_1_16z[7:5] ~^ celloutsig_1_0z[2:0];
  assign celloutsig_0_2z = celloutsig_0_0z[10:6] ~^ celloutsig_0_0z[17:13];
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_1z = 4'h0;
    else if (clkin_data[0]) celloutsig_0_1z = celloutsig_0_0z[13:10];
  assign { celloutsig_1_4z[12:10], celloutsig_1_4z[17], celloutsig_1_4z[9], celloutsig_1_4z[16], celloutsig_1_4z[8], celloutsig_1_4z[15], celloutsig_1_4z[7], celloutsig_1_4z[14], celloutsig_1_4z[6], celloutsig_1_4z[13], celloutsig_1_4z[5] } = { celloutsig_1_2z, celloutsig_1_1z[4], celloutsig_1_1z[4:3], celloutsig_1_1z[3:2], celloutsig_1_1z[2:1], celloutsig_1_1z[1:0], celloutsig_1_1z[0] } ~^ { in_data[172:170], in_data[177], in_data[169], in_data[176], in_data[168], in_data[175], in_data[167], in_data[174], in_data[166], in_data[173], in_data[165] };
  assign { celloutsig_1_8z[18:11], celloutsig_1_8z[24], out_data[129], celloutsig_1_8z[23], out_data[128], celloutsig_1_8z[22], celloutsig_1_8z[8:3], celloutsig_1_8z[21:19] } = { in_data[118:116], celloutsig_1_6z[12:7], celloutsig_1_6z[7:6], celloutsig_1_6z[6:5], celloutsig_1_6z[5:0], celloutsig_1_2z } ~^ { in_data[179:172], in_data[185], in_data[171], in_data[184], in_data[170], in_data[183], in_data[169], celloutsig_1_1z, in_data[182:180] };
  assign celloutsig_1_6z[12:0] = in_data[115:103] ~^ { celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_0z };
  assign { celloutsig_1_7z[15:5], celloutsig_1_7z[30:16], celloutsig_1_7z[42:31] } = { in_data[118:116], celloutsig_1_6z[12:5], celloutsig_1_5z, celloutsig_1_3z, in_data[155:144] } ~^ { celloutsig_1_4z[15:5], in_data[160:151], celloutsig_1_2z, celloutsig_1_4z[17:16], in_data[172:161] };
  assign { out_data[137:130], out_data[138] } = { celloutsig_1_8z[18:11], celloutsig_1_8z[19] } ~^ { celloutsig_1_4z[12:5], celloutsig_1_4z[13] };
  assign celloutsig_1_4z[4:0] = 5'h1f;
  assign celloutsig_1_6z[15:13] = in_data[118:116];
  assign celloutsig_1_7z[4:0] = celloutsig_1_6z[4:0];
  assign { celloutsig_1_8z[10:9], celloutsig_1_8z[2:0] } = { out_data[129:128], 3'h7 };
  assign { out_data[98:96], out_data[35:32], out_data[4:0] } = { celloutsig_1_19z, celloutsig_0_1z, celloutsig_0_2z };
endmodule
