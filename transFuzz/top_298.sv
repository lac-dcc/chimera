/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  reg [3:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [9:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [3:0] celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [20:0] celloutsig_0_30z;
  wire [4:0] celloutsig_0_31z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [14:0] celloutsig_0_5z;
  reg [4:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [5:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [5:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [6:0] celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_2z = celloutsig_1_0z ? in_data[188] : in_data[183];
  assign celloutsig_1_4z = in_data[102] | ~(celloutsig_1_0z);
  assign celloutsig_0_4z = in_data[10] | ~(in_data[90]);
  assign celloutsig_0_13z = celloutsig_0_8z[0] | ~(celloutsig_0_12z);
  assign celloutsig_0_23z = celloutsig_0_13z | ~(in_data[9]);
  assign celloutsig_0_2z = celloutsig_0_0z | ~(in_data[12]);
  assign celloutsig_0_24z = celloutsig_0_19z[4] | ~(celloutsig_0_3z);
  assign celloutsig_1_0z = in_data[132] | ~(in_data[143]);
  assign celloutsig_0_0z = ~(in_data[85] ^ in_data[18]);
  assign celloutsig_1_10z = ~(celloutsig_1_6z[0] ^ celloutsig_1_3z[1]);
  assign celloutsig_0_17z = ~(in_data[58] ^ celloutsig_0_4z);
  assign celloutsig_0_28z = ~(celloutsig_0_25z ^ celloutsig_0_10z);
  assign celloutsig_0_5z = in_data[73:59] / { 1'h1, in_data[47:35], celloutsig_0_2z };
  assign celloutsig_0_3z = { in_data[5:0], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z } === { in_data[40:33], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_1_7z = { celloutsig_1_3z[2], celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_1z } === { celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_1_13z = { celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_10z } === in_data[142:139];
  assign celloutsig_0_9z = celloutsig_0_5z[6:1] === { celloutsig_0_6z, celloutsig_0_1z };
  assign celloutsig_1_1z = { in_data[171:165], celloutsig_1_0z } === in_data[122:115];
  assign celloutsig_0_7z = { celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_0z } >= { celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_0_1z = { in_data[43:42], celloutsig_0_0z } >= in_data[63:61];
  assign celloutsig_0_15z = { in_data[12:6], celloutsig_0_11z } > { celloutsig_0_8z[5:4], celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_14z };
  assign celloutsig_0_10z = { in_data[88:79], celloutsig_0_1z } || { celloutsig_0_5z[3:2], celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_9z, celloutsig_0_3z };
  assign celloutsig_0_18z = { celloutsig_0_16z[2], celloutsig_0_13z, celloutsig_0_17z } || celloutsig_0_8z[3:1];
  assign celloutsig_0_31z = { celloutsig_0_24z, celloutsig_0_9z, celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_17z } % { 1'h1, in_data[54:52], celloutsig_0_14z };
  assign celloutsig_1_18z = | celloutsig_1_9z[5:0];
  assign celloutsig_0_25z = | { in_data[68:67], celloutsig_0_20z };
  assign celloutsig_1_5z = ~^ { celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_0_11z = ~^ { celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_14z = ~^ { celloutsig_0_8z[4:0], celloutsig_0_0z };
  assign celloutsig_0_12z = ^ { celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_1_9z = { celloutsig_1_3z, celloutsig_1_7z } >> { celloutsig_1_3z[5:1], celloutsig_1_1z, celloutsig_1_7z };
  assign celloutsig_0_26z = { celloutsig_0_8z[3], celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_23z } >> celloutsig_0_8z[4:1];
  assign celloutsig_0_30z = { celloutsig_0_19z[8:2], celloutsig_0_14z, celloutsig_0_20z, celloutsig_0_4z, celloutsig_0_16z, celloutsig_0_28z, celloutsig_0_26z, celloutsig_0_4z, celloutsig_0_18z } >> { in_data[35:32], celloutsig_0_24z, celloutsig_0_17z, celloutsig_0_8z, celloutsig_0_17z, celloutsig_0_6z, celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_25z };
  assign celloutsig_1_3z = { in_data[142:140], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z } << in_data[188:183];
  assign celloutsig_1_6z = in_data[119:115] >> in_data[123:119];
  assign celloutsig_0_8z = { celloutsig_0_5z[5:2], celloutsig_0_7z, celloutsig_0_1z } ~^ in_data[49:44];
  assign celloutsig_0_19z = celloutsig_0_5z[14:5] ~^ { in_data[9:8], celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_15z };
  assign celloutsig_1_8z = ~((celloutsig_1_2z & celloutsig_1_0z) | celloutsig_1_6z[4]);
  assign celloutsig_1_19z = ~((celloutsig_1_0z & celloutsig_1_13z) | celloutsig_1_13z);
  assign celloutsig_0_20z = ~((celloutsig_0_19z[1] & celloutsig_0_3z) | celloutsig_0_14z);
  always_latch
    if (!clkin_data[32]) celloutsig_0_6z = 5'h00;
    else if (celloutsig_1_18z) celloutsig_0_6z = { in_data[52:49], celloutsig_0_0z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_16z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_16z = { celloutsig_0_5z[5:4], celloutsig_0_2z, celloutsig_0_3z };
  assign { out_data[128], out_data[96], out_data[52:32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_30z, celloutsig_0_31z };
endmodule
