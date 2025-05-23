/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [5:0] celloutsig_0_0z;
  reg [13:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [10:0] celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire [3:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire [3:0] celloutsig_0_23z;
  reg [9:0] celloutsig_0_29z;
  wire [3:0] celloutsig_0_2z;
  wire [2:0] celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire [2:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [4:0] celloutsig_0_4z;
  wire [5:0] celloutsig_0_5z;
  wire celloutsig_0_7z;
  wire [3:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire [13:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [8:0] celloutsig_1_14z;
  wire [14:0] celloutsig_1_15z;
  wire [6:0] celloutsig_1_17z;
  reg [9:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire [9:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [28:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [35:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_17z = celloutsig_0_13z[0] ? celloutsig_0_5z[4] : celloutsig_0_1z[0];
  assign celloutsig_1_0z = ~(in_data[186] & in_data[132]);
  assign celloutsig_1_13z = ~(celloutsig_1_10z[0] & celloutsig_1_2z[2]);
  assign celloutsig_0_16z = ~(celloutsig_0_5z[1] & celloutsig_0_7z);
  assign celloutsig_0_9z = celloutsig_0_4z[2] | ~(celloutsig_0_4z[1]);
  assign celloutsig_1_8z = celloutsig_1_6z | in_data[109];
  assign celloutsig_1_12z = celloutsig_1_9z[26] | celloutsig_1_8z;
  assign celloutsig_0_3z = celloutsig_0_1z[2] ^ celloutsig_0_0z[1];
  assign celloutsig_0_11z = celloutsig_0_2z[0] ^ celloutsig_0_0z[1];
  assign celloutsig_0_19z = celloutsig_0_10z[3] ^ celloutsig_0_7z;
  assign celloutsig_1_6z = ~(celloutsig_1_2z[2] ^ celloutsig_1_2z[0]);
  assign celloutsig_1_19z = ~(celloutsig_1_14z[3] ^ celloutsig_1_17z[6]);
  assign celloutsig_0_7z = ~(celloutsig_0_0z[4] ^ in_data[11]);
  assign celloutsig_1_7z = { in_data[160:159], celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_1z } & in_data[140:112];
  assign celloutsig_0_4z = { celloutsig_0_2z[3:1], celloutsig_0_3z, celloutsig_0_3z } / { 1'h1, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_1z = in_data[3:1] / { 1'h1, in_data[59:58] };
  assign celloutsig_0_23z = { celloutsig_0_14z, celloutsig_0_17z } / { 1'h1, celloutsig_0_5z[3:1] };
  assign celloutsig_1_5z = { celloutsig_1_3z[8:5], celloutsig_1_3z, celloutsig_1_1z } <= in_data[130:116];
  assign celloutsig_0_41z = celloutsig_0_38z % { 1'h1, celloutsig_0_29z[8:7] };
  assign celloutsig_0_2z = celloutsig_0_0z[5:2] % { 1'h1, celloutsig_0_0z[2:0] };
  assign celloutsig_1_14z = { celloutsig_1_10z[2:0], celloutsig_1_5z, celloutsig_1_12z, celloutsig_1_10z } % { 1'h1, celloutsig_1_11z[4:0], celloutsig_1_2z };
  assign celloutsig_1_2z = celloutsig_1_1z ? { in_data[168:167], 1'h1 } : 3'h0;
  assign celloutsig_1_11z = celloutsig_1_9z[21] ? in_data[139:126] : { celloutsig_1_4z[6:5], celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_8z = ~ celloutsig_0_5z[4:1];
  assign celloutsig_0_14z = ~ { celloutsig_0_4z[4:3], celloutsig_0_9z };
  assign celloutsig_0_42z = | { celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_2z };
  assign celloutsig_1_1z = ~^ { in_data[161:158], celloutsig_1_0z };
  assign celloutsig_1_3z = { in_data[189:181], celloutsig_1_0z } >> in_data[155:146];
  assign celloutsig_1_15z = { celloutsig_1_14z[4:0], celloutsig_1_4z } >> { celloutsig_1_7z[20:7], celloutsig_1_5z };
  assign celloutsig_0_15z = { celloutsig_0_0z[3], celloutsig_0_14z } >> { in_data[92], celloutsig_0_1z };
  assign celloutsig_0_38z = celloutsig_0_12z[3:1] << { celloutsig_0_29z[4:3], celloutsig_0_19z };
  assign celloutsig_0_12z = { celloutsig_0_4z[2:1], celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_11z } << { celloutsig_0_10z[2:1], celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_11z };
  assign celloutsig_0_5z = { celloutsig_0_2z[2:0], celloutsig_0_1z } <<< in_data[62:57];
  assign celloutsig_1_4z = in_data[180:171] >>> in_data[108:99];
  assign celloutsig_1_9z = { celloutsig_1_4z[7:2], celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_1z } >>> { celloutsig_1_7z[27:3], celloutsig_1_5z, celloutsig_1_4z };
  assign celloutsig_1_10z = { celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_8z } - celloutsig_1_3z[5:2];
  assign celloutsig_1_17z = { celloutsig_1_8z, celloutsig_1_13z, celloutsig_1_5z, celloutsig_1_10z } ^ in_data[138:132];
  assign celloutsig_0_13z = { celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_7z } ^ celloutsig_0_10z[4:2];
  always_latch
    if (!clkin_data[64]) celloutsig_0_0z = 6'h00;
    else if (clkin_data[0]) celloutsig_0_0z = in_data[10:5];
  always_latch
    if (!clkin_data[96]) celloutsig_1_18z = 10'h000;
    else if (clkin_data[32]) celloutsig_1_18z = celloutsig_1_15z[10:1];
  always_latch
    if (!clkin_data[64]) celloutsig_0_10z = 14'h0000;
    else if (celloutsig_1_19z) celloutsig_0_10z = { in_data[46:37], celloutsig_0_1z, celloutsig_0_7z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_29z = 10'h000;
    else if (celloutsig_1_19z) celloutsig_0_29z = { celloutsig_0_15z, celloutsig_0_23z, celloutsig_0_16z, celloutsig_0_11z };
  assign { out_data[137:128], out_data[96], out_data[34:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_41z, celloutsig_0_42z };
endmodule
