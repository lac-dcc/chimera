/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [3:0] celloutsig_0_0z;
  wire [5:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [6:0] celloutsig_0_12z;
  wire [6:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [13:0] celloutsig_0_18z;
  wire [6:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [7:0] celloutsig_0_22z;
  wire [16:0] celloutsig_0_23z;
  wire celloutsig_0_2z;
  reg [3:0] celloutsig_0_31z;
  wire celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire [18:0] celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [13:0] celloutsig_0_63z;
  wire [3:0] celloutsig_0_64z;
  wire celloutsig_0_6z;
  wire [2:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [13:0] celloutsig_1_0z;
  wire [5:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [23:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_17z;
  wire [5:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [8:0] celloutsig_1_4z;
  wire [5:0] celloutsig_1_5z;
  wire [6:0] celloutsig_1_6z;
  wire [4:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_6z = ~(celloutsig_0_3z[9] & in_data[82]);
  assign celloutsig_1_3z = ~(celloutsig_1_1z & in_data[138]);
  assign celloutsig_1_8z = ~celloutsig_1_4z[5];
  assign celloutsig_1_17z = celloutsig_1_8z | celloutsig_1_1z;
  assign celloutsig_0_63z = celloutsig_0_23z[16:3] / { 1'h1, celloutsig_0_3z[17:9], celloutsig_0_31z };
  assign celloutsig_0_13z = { celloutsig_0_7z[0], celloutsig_0_10z } / { 1'h1, in_data[38:34], celloutsig_0_6z };
  assign celloutsig_0_23z = in_data[68:52] / { 1'h1, celloutsig_0_19z[5:3], celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_4z };
  assign celloutsig_0_4z = celloutsig_0_3z[9:7] == { celloutsig_0_0z[3:2], celloutsig_0_2z };
  assign celloutsig_0_16z = { celloutsig_0_10z[4:2], celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_15z } == celloutsig_0_3z[15:6];
  assign celloutsig_0_17z = { celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_1z } == { celloutsig_0_10z[1], celloutsig_0_8z, celloutsig_0_0z };
  assign celloutsig_0_14z = { celloutsig_0_3z[10], celloutsig_0_0z } >= { celloutsig_0_10z[2:0], celloutsig_0_1z, celloutsig_0_6z };
  assign celloutsig_0_2z = { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z } >= { celloutsig_0_0z[1], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_12z = { celloutsig_1_11z, celloutsig_1_2z, celloutsig_1_8z } || { in_data[131:125], celloutsig_1_3z };
  assign celloutsig_1_0z = in_data[163:150] % { 1'h1, in_data[136:124] };
  assign celloutsig_1_18z = celloutsig_1_0z[6:1] % { 1'h1, celloutsig_1_11z[4:0] };
  assign celloutsig_0_8z = { celloutsig_0_3z[13:12], celloutsig_0_4z } !== { in_data[49:48], celloutsig_0_1z };
  assign celloutsig_1_11z = ~ celloutsig_1_6z[5:0];
  assign celloutsig_1_6z = { celloutsig_1_4z[8:4], celloutsig_1_4z[4], celloutsig_1_4z[4] } | { in_data[113:108], celloutsig_1_3z };
  assign celloutsig_0_5z = | { celloutsig_0_3z[11:1], in_data[64:45], celloutsig_0_0z };
  assign celloutsig_1_2z = | { celloutsig_1_1z, celloutsig_1_0z[11:6] };
  assign celloutsig_1_19z = | { celloutsig_1_18z, celloutsig_1_17z, celloutsig_1_14z, celloutsig_1_12z, celloutsig_1_3z, in_data[183:151] };
  assign celloutsig_0_11z = | { celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_0_1z = | { in_data[64:45], celloutsig_0_0z };
  assign celloutsig_0_42z = ^ { celloutsig_0_0z[2:1], celloutsig_0_14z };
  assign celloutsig_1_1z = ^ celloutsig_1_0z[4:1];
  assign celloutsig_1_14z = ^ { celloutsig_1_13z[23:17], in_data[151], celloutsig_1_13z[15:9], in_data[143], celloutsig_1_13z[7:4] };
  assign celloutsig_0_9z = ^ { celloutsig_0_7z[2:1], celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_15z = ^ { celloutsig_0_13z[3:2], celloutsig_0_4z, celloutsig_0_14z };
  assign celloutsig_0_12z = celloutsig_0_3z[14:8] >> { in_data[66:62], celloutsig_0_8z, celloutsig_0_2z };
  assign celloutsig_0_19z = celloutsig_0_3z[14:8] >> in_data[42:36];
  assign celloutsig_0_22z = { celloutsig_0_13z, celloutsig_0_6z } >> celloutsig_0_18z[11:4];
  assign celloutsig_0_18z = { celloutsig_0_7z[2], celloutsig_0_0z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_1z } >>> { celloutsig_0_13z[2:0], celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_15z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_15z, celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_1z, celloutsig_0_8z };
  assign celloutsig_0_3z = in_data[21:3] >>> { in_data[44:35], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_0z = in_data[77:74] ~^ in_data[11:8];
  assign celloutsig_0_64z = { celloutsig_0_35z, celloutsig_0_14z, celloutsig_0_37z, celloutsig_0_42z } ~^ celloutsig_0_31z;
  assign celloutsig_0_7z = { celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_2z } ~^ { celloutsig_0_3z[10:9], celloutsig_0_6z };
  assign celloutsig_1_7z = celloutsig_1_0z[11:7] ~^ { in_data[165:162], celloutsig_1_1z };
  assign celloutsig_0_10z = celloutsig_0_3z[6:1] ~^ { celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_6z };
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_31z = 4'h0;
    else if (clkin_data[0]) celloutsig_0_31z = { celloutsig_0_22z[6], celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_9z };
  assign celloutsig_0_35z = ~((celloutsig_0_17z & celloutsig_0_11z) | (celloutsig_0_5z & celloutsig_0_5z));
  assign celloutsig_0_37z = ~((celloutsig_0_19z[0] & celloutsig_0_16z) | (celloutsig_0_13z[1] & celloutsig_0_6z));
  assign { celloutsig_1_4z[1], celloutsig_1_4z[4], celloutsig_1_4z[5], celloutsig_1_4z[8:6] } = ~ { celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z[13:11] };
  assign celloutsig_1_5z[5:1] = in_data[181:177] ~^ { celloutsig_1_4z[6:4], celloutsig_1_4z[4], celloutsig_1_4z[4] };
  assign { celloutsig_1_13z[23], celloutsig_1_13z[6:0], celloutsig_1_13z[21], celloutsig_1_13z[13], celloutsig_1_13z[20], celloutsig_1_13z[12], celloutsig_1_13z[19], celloutsig_1_13z[11], celloutsig_1_13z[18], celloutsig_1_13z[10], celloutsig_1_13z[17], celloutsig_1_13z[9], celloutsig_1_13z[14], celloutsig_1_13z[22], celloutsig_1_13z[7], celloutsig_1_13z[15] } = { celloutsig_1_7z[1], celloutsig_1_6z, celloutsig_1_5z[5], celloutsig_1_5z[5:4], celloutsig_1_5z[4:3], celloutsig_1_5z[3:2], celloutsig_1_5z[2:1], celloutsig_1_5z[1], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z } & { in_data[158], in_data[141:138], celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_8z, in_data[156], in_data[148], in_data[155], in_data[147], in_data[154], in_data[146], in_data[153], in_data[145], in_data[152], in_data[144], in_data[149], in_data[157], in_data[142], in_data[150] };
  assign { celloutsig_1_13z[16], celloutsig_1_13z[8] } = { in_data[151], in_data[143] };
  assign { celloutsig_1_4z[3:2], celloutsig_1_4z[0] } = { celloutsig_1_4z[4], celloutsig_1_4z[4], celloutsig_1_4z[1] };
  assign celloutsig_1_5z[0] = 1'h1;
  assign { out_data[133:128], out_data[96], out_data[45:32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_63z, celloutsig_0_64z };
endmodule
