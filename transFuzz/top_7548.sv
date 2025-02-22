/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [6:0] celloutsig_0_0z;
  wire [15:0] celloutsig_0_10z;
  wire [5:0] celloutsig_0_11z;
  wire [5:0] celloutsig_0_14z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire [8:0] celloutsig_0_2z;
  reg [3:0] celloutsig_0_30z;
  reg [8:0] celloutsig_0_31z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [6:0] celloutsig_0_6z;
  wire [16:0] celloutsig_0_7z;
  wire [20:0] celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [2:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [4:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [5:0] celloutsig_1_19z;
  wire [16:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [7:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [14:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_2z = celloutsig_1_0z ? celloutsig_1_1z[1] : celloutsig_1_1z[8];
  assign celloutsig_1_9z = celloutsig_1_2z ? celloutsig_1_4z : celloutsig_1_5z;
  assign celloutsig_0_27z = ~(celloutsig_0_14z[2] & celloutsig_0_1z);
  assign celloutsig_1_10z = !(celloutsig_1_9z ? celloutsig_1_7z : celloutsig_1_7z);
  assign celloutsig_1_18z = ~(celloutsig_1_16z[1] | celloutsig_1_7z);
  assign celloutsig_1_5z = ~celloutsig_1_2z;
  assign celloutsig_1_11z = ~celloutsig_1_10z;
  assign celloutsig_0_4z = celloutsig_0_1z | ~(celloutsig_0_0z[5]);
  assign celloutsig_1_0z = in_data[166] | in_data[113];
  assign celloutsig_1_12z = { celloutsig_1_3z[6:2], celloutsig_1_0z } >= celloutsig_1_1z[13:8];
  assign celloutsig_0_3z = { in_data[60], celloutsig_0_1z, celloutsig_0_1z } >= celloutsig_0_2z[8:6];
  assign celloutsig_0_10z = { celloutsig_0_7z[11:7], celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z } * { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_14z = celloutsig_0_6z[5:0] * in_data[74:69];
  assign celloutsig_1_1z = ~ in_data[114:98];
  assign celloutsig_0_7z = ~ in_data[79:63];
  assign celloutsig_0_8z = { celloutsig_0_7z[15:2], celloutsig_0_0z } | { celloutsig_0_6z[1:0], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_6z };
  assign celloutsig_0_2z = { celloutsig_0_0z[6:5], celloutsig_0_0z } | in_data[46:38];
  assign celloutsig_1_4z = celloutsig_1_0z & in_data[191];
  assign celloutsig_0_5z = in_data[36] & celloutsig_0_4z;
  assign celloutsig_1_13z = ^ { in_data[139:132], celloutsig_1_11z, celloutsig_1_4z };
  assign celloutsig_0_1z = ^ in_data[44:29];
  assign celloutsig_0_29z = ^ { celloutsig_0_8z[20:14], celloutsig_0_27z };
  assign celloutsig_1_8z = in_data[183:169] >>> { in_data[172:159], celloutsig_1_0z };
  assign celloutsig_1_14z = { celloutsig_1_1z[15:14], celloutsig_1_5z } >>> celloutsig_1_1z[9:7];
  assign celloutsig_0_11z = celloutsig_0_2z[7:2] >>> { celloutsig_0_7z[13:9], celloutsig_0_3z };
  assign celloutsig_0_0z = in_data[37:31] ~^ in_data[84:78];
  assign celloutsig_1_16z = { celloutsig_1_8z[0], celloutsig_1_14z, celloutsig_1_13z } ~^ { celloutsig_1_8z[9:7], celloutsig_1_15z, celloutsig_1_4z };
  assign celloutsig_1_3z = { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_2z } ^ { celloutsig_1_1z[14:9], celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_19z = { in_data[106:104], celloutsig_1_12z, celloutsig_1_7z, celloutsig_1_6z } ^ { celloutsig_1_3z[7:5], celloutsig_1_14z };
  assign celloutsig_0_6z = celloutsig_0_2z[7:1] ^ { celloutsig_0_2z[8:4], celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_1_6z = ~((celloutsig_1_2z & celloutsig_1_0z) | celloutsig_1_2z);
  assign celloutsig_1_7z = ~((celloutsig_1_5z & in_data[188]) | celloutsig_1_1z[2]);
  assign celloutsig_1_15z = ~((celloutsig_1_0z & celloutsig_1_11z) | celloutsig_1_2z);
  assign celloutsig_0_20z = ~((celloutsig_0_3z & celloutsig_0_4z) | celloutsig_0_3z);
  always_latch
    if (!clkin_data[0]) celloutsig_0_30z = 4'h0;
    else if (!celloutsig_1_19z[0]) celloutsig_0_30z = celloutsig_0_10z[8:5];
  always_latch
    if (clkin_data[0]) celloutsig_0_31z = 9'h000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_31z = { celloutsig_0_20z, celloutsig_0_5z, celloutsig_0_29z, celloutsig_0_11z };
  assign { out_data[128], out_data[101:96], out_data[35:32], out_data[8:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_30z, celloutsig_0_31z };
endmodule
