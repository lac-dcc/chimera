/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [20:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [8:0] celloutsig_0_14z;
  wire [9:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [4:0] celloutsig_0_20z;
  wire [2:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [7:0] celloutsig_0_24z;
  wire [20:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [2:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire [16:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [24:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [2:0] celloutsig_0_44z;
  wire celloutsig_0_48z;
  wire [3:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  reg [3:0] celloutsig_0_6z;
  wire [11:0] celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [10:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_14z;
  wire [11:0] celloutsig_1_16z;
  reg [11:0] celloutsig_1_17z;
  wire [4:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  reg [3:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_33z = celloutsig_0_21z[1] ? celloutsig_0_27z[0] : celloutsig_0_9z;
  assign celloutsig_0_35z = celloutsig_0_7z[4] ? celloutsig_0_1z : celloutsig_0_25z[1];
  assign celloutsig_0_3z = in_data[65] ? in_data[79] : celloutsig_0_0z;
  assign celloutsig_0_37z = celloutsig_0_19z ? celloutsig_0_34z[3] : celloutsig_0_9z;
  assign celloutsig_0_38z = celloutsig_0_12z ? celloutsig_0_13z : celloutsig_0_22z;
  assign celloutsig_0_40z = celloutsig_0_22z ? celloutsig_0_12z : celloutsig_0_31z;
  assign celloutsig_0_42z = celloutsig_0_23z ? celloutsig_0_40z : celloutsig_0_37z;
  assign celloutsig_1_1z = in_data[118] ? in_data[157] : celloutsig_1_0z;
  assign celloutsig_0_9z = celloutsig_0_0z ? celloutsig_0_5z : celloutsig_0_2z;
  assign celloutsig_0_11z = celloutsig_0_10z[14] ? celloutsig_0_9z : celloutsig_0_6z[1];
  assign celloutsig_0_13z = celloutsig_0_12z ? celloutsig_0_11z : celloutsig_0_4z;
  assign celloutsig_0_18z = celloutsig_0_3z ? in_data[54] : celloutsig_0_8z[0];
  assign celloutsig_0_22z = celloutsig_0_12z ? celloutsig_0_3z : celloutsig_0_11z;
  assign celloutsig_0_2z = in_data[14] ? in_data[25] : celloutsig_0_0z;
  assign celloutsig_0_26z = celloutsig_0_17z ? celloutsig_0_17z : celloutsig_0_14z[7];
  assign celloutsig_1_0z = ~(in_data[136] & in_data[129]);
  assign celloutsig_1_2z = ~(celloutsig_1_0z & celloutsig_1_0z);
  assign celloutsig_1_5z = ~(celloutsig_1_3z & in_data[104]);
  assign celloutsig_1_14z = ~(celloutsig_1_3z & celloutsig_1_11z);
  assign celloutsig_0_12z = ~(celloutsig_0_6z[2] & celloutsig_0_3z);
  assign celloutsig_0_23z = ~(celloutsig_0_13z & celloutsig_0_17z);
  assign celloutsig_0_31z = !(celloutsig_0_15z[3] ? celloutsig_0_5z : celloutsig_0_25z[2]);
  assign celloutsig_1_8z = !(celloutsig_1_1z ? celloutsig_1_6z : celloutsig_1_0z);
  assign celloutsig_0_16z = !(celloutsig_0_5z ? celloutsig_0_0z : celloutsig_0_12z);
  assign celloutsig_0_0z = ~((in_data[53] | in_data[84]) & (in_data[39] | in_data[4]));
  assign celloutsig_0_29z = ~((celloutsig_0_22z | celloutsig_0_13z) & (celloutsig_0_11z | celloutsig_0_1z));
  assign celloutsig_0_4z = ~((celloutsig_0_1z | celloutsig_0_1z) & (in_data[63] | celloutsig_0_2z));
  assign celloutsig_1_6z = ~((celloutsig_1_0z | celloutsig_1_4z[3]) & (in_data[188] | celloutsig_1_5z));
  assign celloutsig_0_34z = celloutsig_0_10z[19:3] + { celloutsig_0_24z[6:3], celloutsig_0_23z, celloutsig_0_26z, celloutsig_0_1z, celloutsig_0_15z };
  assign celloutsig_1_7z = celloutsig_1_4z[3:1] + in_data[103:101];
  assign celloutsig_1_10z = in_data[154:144] + { in_data[181], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_9z };
  assign celloutsig_1_18z = { celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_8z } + celloutsig_1_16z[7:3];
  assign celloutsig_0_8z = { in_data[80], celloutsig_0_1z, celloutsig_0_1z } + { celloutsig_0_7z[5:4], celloutsig_0_5z };
  assign celloutsig_0_10z = { celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_9z } + { in_data[32:13], celloutsig_0_9z };
  assign celloutsig_0_48z = celloutsig_0_41z[16:10] <= { in_data[80:75], celloutsig_0_40z };
  assign celloutsig_1_3z = { in_data[177:174], celloutsig_1_2z } <= { in_data[173], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_9z = celloutsig_1_4z <= { celloutsig_1_7z[2:1], celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_1_11z = { celloutsig_1_7z[2:1], celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_10z, celloutsig_1_1z } <= { in_data[122:117], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_10z };
  assign celloutsig_0_5z = { celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_2z } <= { celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_1_19z = { celloutsig_1_17z[4:0], celloutsig_1_11z } <= { in_data[151:147], celloutsig_1_0z };
  assign celloutsig_0_1z = { in_data[40:37], celloutsig_0_0z } <= in_data[57:53];
  assign celloutsig_0_17z = { celloutsig_0_6z[2:1], celloutsig_0_2z } <= celloutsig_0_10z[17:15];
  assign celloutsig_0_19z = { celloutsig_0_7z[8:4], celloutsig_0_1z, celloutsig_0_14z } <= { celloutsig_0_14z[1], celloutsig_0_7z, celloutsig_0_18z, celloutsig_0_16z };
  assign celloutsig_0_28z = { celloutsig_0_20z[0], celloutsig_0_1z, celloutsig_0_8z } <= { celloutsig_0_20z[3:0], celloutsig_0_13z };
  assign celloutsig_0_41z = { celloutsig_0_21z[2:1], celloutsig_0_17z, celloutsig_0_38z, celloutsig_0_6z, celloutsig_0_29z, celloutsig_0_21z, celloutsig_0_6z, celloutsig_0_22z, celloutsig_0_24z } % { 1'h1, celloutsig_0_34z[6:1], celloutsig_0_22z, celloutsig_0_35z, celloutsig_0_6z, celloutsig_0_21z, celloutsig_0_6z, celloutsig_0_17z, celloutsig_0_40z, celloutsig_0_31z, celloutsig_0_28z, celloutsig_0_35z };
  assign celloutsig_1_16z = { celloutsig_1_8z, celloutsig_1_10z } % { 1'h1, celloutsig_1_10z[9:0], celloutsig_1_14z };
  assign celloutsig_0_14z = { in_data[72:65], celloutsig_0_12z } % { 1'h1, celloutsig_0_12z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_13z };
  assign celloutsig_0_15z = { celloutsig_0_14z[7:6], celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_8z } % { 1'h1, celloutsig_0_10z[6:3], celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_4z };
  assign celloutsig_0_24z = { celloutsig_0_7z[11:5], celloutsig_0_2z } % { 1'h1, celloutsig_0_14z[2:0], celloutsig_0_6z };
  assign celloutsig_0_25z = { celloutsig_0_15z[7:1], celloutsig_0_18z, celloutsig_0_24z, celloutsig_0_20z } % { 1'h1, celloutsig_0_14z[5:3], celloutsig_0_2z, celloutsig_0_17z, celloutsig_0_22z, celloutsig_0_12z, celloutsig_0_24z, celloutsig_0_19z, celloutsig_0_1z, celloutsig_0_19z, celloutsig_0_9z, celloutsig_0_4z };
  assign celloutsig_0_44z = celloutsig_0_24z[7:5] | { celloutsig_0_29z, celloutsig_0_29z, celloutsig_0_42z };
  assign celloutsig_0_49z = { in_data[77:76], celloutsig_0_17z, celloutsig_0_40z } | { celloutsig_0_33z, celloutsig_0_44z };
  assign celloutsig_0_7z = { in_data[40:30], celloutsig_0_2z } | { in_data[73], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_4z };
  assign celloutsig_0_20z = { in_data[27:24], celloutsig_0_16z } | { celloutsig_0_10z[18:15], celloutsig_0_12z };
  assign celloutsig_0_21z = { celloutsig_0_15z[2:1], celloutsig_0_0z } | celloutsig_0_7z[10:8];
  assign celloutsig_0_27z = { celloutsig_0_11z, celloutsig_0_17z, celloutsig_0_4z } | celloutsig_0_15z[5:3];
  always_latch
    if (!clkin_data[64]) celloutsig_1_4z = 4'h0;
    else if (!clkin_data[32]) celloutsig_1_4z = { celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_17z = 12'h000;
    else if (clkin_data[32]) celloutsig_1_17z = { in_data[188:179], celloutsig_1_11z, celloutsig_1_11z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_6z = 4'h0;
    else if (clkin_data[0]) celloutsig_0_6z = { celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_4z };
  assign { out_data[132:128], out_data[96], out_data[32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_48z, celloutsig_0_49z };
endmodule
