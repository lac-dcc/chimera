/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [43:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [9:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  reg [12:0] celloutsig_0_18z;
  wire [11:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [7:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [5:0] celloutsig_0_25z;
  reg [12:0] celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire [18:0] celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [3:0] celloutsig_0_39z;
  wire [5:0] celloutsig_0_3z;
  wire celloutsig_0_44z;
  wire [4:0] celloutsig_0_4z;
  wire celloutsig_0_53z;
  wire [32:0] celloutsig_0_54z;
  wire [14:0] celloutsig_0_5z;
  wire [6:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [6:0] celloutsig_1_0z;
  wire [6:0] celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire [15:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [27:0] celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  reg [5:0] celloutsig_1_5z;
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
  assign celloutsig_1_9z = ~((celloutsig_1_5z[1] | celloutsig_1_7z) & in_data[151]);
  assign celloutsig_0_1z = ~((in_data[32] | in_data[69]) & celloutsig_0_0z);
  assign celloutsig_0_13z = ~((celloutsig_0_3z[3] | celloutsig_0_11z[2]) & celloutsig_0_5z[11]);
  assign celloutsig_0_24z = ~((celloutsig_0_16z | celloutsig_0_13z) & celloutsig_0_12z);
  assign celloutsig_0_37z = celloutsig_0_12z | ~(celloutsig_0_24z);
  assign celloutsig_1_18z = celloutsig_1_16z | ~(celloutsig_1_3z);
  assign celloutsig_0_53z = celloutsig_0_0z ^ celloutsig_0_35z[3];
  assign celloutsig_1_16z = celloutsig_1_10z[5] ^ celloutsig_1_10z[6];
  assign celloutsig_0_9z = celloutsig_0_4z[4] ^ celloutsig_0_2z;
  assign celloutsig_0_14z = celloutsig_0_5z[6] ^ celloutsig_0_10z;
  assign celloutsig_0_0z = in_data[92:89] == in_data[75:72];
  assign celloutsig_0_12z = { celloutsig_0_5z[11], celloutsig_0_3z, celloutsig_0_4z } == { celloutsig_0_6z[1:0], celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_8z };
  assign celloutsig_1_6z = { celloutsig_1_4z[2:1], celloutsig_1_4z, celloutsig_1_5z } === { celloutsig_1_1z[23:16], celloutsig_1_4z };
  assign celloutsig_1_7z = { in_data[99:98], celloutsig_1_3z } === { celloutsig_1_4z[2:1], celloutsig_1_6z };
  assign celloutsig_0_8z = { celloutsig_0_3z[5:1], celloutsig_0_1z, celloutsig_0_2z } === in_data[62:56];
  assign celloutsig_0_39z = celloutsig_0_5z[12] ? { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_13z, celloutsig_0_34z } : celloutsig_0_4z[3:0];
  assign celloutsig_0_4z = celloutsig_0_1z ? in_data[29:25] : { celloutsig_0_3z[4:3], 3'h0 };
  assign celloutsig_1_2z = celloutsig_1_0z[0] ? celloutsig_1_1z[19:17] : celloutsig_1_1z[24:22];
  assign celloutsig_1_4z = celloutsig_1_2z[1] ? in_data[154:150] : celloutsig_1_0z[5:1];
  assign celloutsig_0_6z = celloutsig_0_1z ? in_data[30:24] : { celloutsig_0_5z[13:8], celloutsig_0_2z };
  assign celloutsig_1_13z = in_data[117] ? celloutsig_1_1z[20:5] : { celloutsig_1_1z[18:5], celloutsig_1_7z, celloutsig_1_9z };
  assign out_data[112:97] = celloutsig_1_1z[2] ? celloutsig_1_13z : { celloutsig_1_1z[10:3], 1'h0, celloutsig_1_1z[1:0], celloutsig_1_12z, celloutsig_1_14z, celloutsig_1_16z, celloutsig_1_18z, celloutsig_1_16z };
  assign celloutsig_0_30z = { celloutsig_0_15z[8:1], celloutsig_0_9z } !== { celloutsig_0_19z[8:2], celloutsig_0_12z, celloutsig_0_0z };
  assign celloutsig_0_31z = { celloutsig_0_15z[8:7], celloutsig_0_16z } !== { in_data[74:73], celloutsig_0_10z };
  assign celloutsig_0_34z = { celloutsig_0_15z[5:4], celloutsig_0_23z, celloutsig_0_20z, celloutsig_0_28z, 2'h0 } !== celloutsig_0_6z;
  assign celloutsig_0_38z = celloutsig_0_26z[12:10] !== { celloutsig_0_6z[2], celloutsig_0_34z, celloutsig_0_14z };
  assign celloutsig_1_3z = in_data[124:119] !== { in_data[128:126], celloutsig_1_2z };
  assign celloutsig_1_12z = { celloutsig_1_2z[1:0], celloutsig_1_6z } !== celloutsig_1_0z[3:1];
  assign celloutsig_1_14z = { celloutsig_1_1z[27:1], celloutsig_1_4z } !== { celloutsig_1_13z[10:9], celloutsig_1_1z, celloutsig_1_12z, celloutsig_1_3z };
  assign celloutsig_0_20z = { celloutsig_0_15z, celloutsig_0_0z, 1'h0 } !== { celloutsig_0_15z[8:1], celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_16z };
  assign celloutsig_0_54z = ~ { celloutsig_0_39z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_22z, celloutsig_0_37z, celloutsig_0_31z, celloutsig_0_0z, celloutsig_0_44z, celloutsig_0_13z, celloutsig_0_38z, celloutsig_0_23z, celloutsig_0_21z };
  assign celloutsig_1_0z = ~ in_data[169:163];
  assign celloutsig_1_1z = ~ in_data[162:135];
  assign celloutsig_0_32z = | { celloutsig_0_25z[5:1], celloutsig_0_2z, in_data[71:60] };
  assign celloutsig_0_7z = | { celloutsig_0_2z, in_data[71:60] };
  assign celloutsig_0_10z = | { celloutsig_0_6z, celloutsig_0_0z };
  assign celloutsig_0_22z = | { celloutsig_0_21z[5:3], celloutsig_0_0z };
  assign celloutsig_0_5z = { in_data[92:79], celloutsig_0_2z } << { celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_1_10z = { in_data[102:99], celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_8z } << { celloutsig_1_5z, celloutsig_1_7z };
  assign celloutsig_0_35z = { in_data[47:31], celloutsig_0_30z, celloutsig_0_2z } >>> { celloutsig_0_26z[7:3], celloutsig_0_18z, celloutsig_0_32z };
  assign celloutsig_0_3z = in_data[70:65] >>> { in_data[15:14], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_15z = { celloutsig_0_4z[4:2], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_8z } >>> { celloutsig_0_11z[43], celloutsig_0_11z[33], celloutsig_0_11z[42:38], celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_12z };
  assign celloutsig_0_19z = { celloutsig_0_6z[6:4], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_3z, 1'h0 } >>> { celloutsig_0_18z[10:0], celloutsig_0_7z };
  assign celloutsig_0_21z = { celloutsig_0_6z[5:0], celloutsig_0_13z, celloutsig_0_8z } >>> celloutsig_0_15z[8:1];
  assign celloutsig_0_25z = { celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_7z } >>> celloutsig_0_21z[7:2];
  always_latch
    if (!clkin_data[96]) celloutsig_1_5z = 6'h00;
    else if (clkin_data[32]) celloutsig_1_5z = { celloutsig_1_4z[4], celloutsig_1_4z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_18z = 13'h0000;
    else if (!clkin_data[0]) celloutsig_0_18z = { celloutsig_0_15z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_1z };
  always_latch
    if (celloutsig_1_18z) celloutsig_0_26z = 13'h0000;
    else if (!clkin_data[0]) celloutsig_0_26z = { celloutsig_0_18z[11:2], celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_24z };
  assign celloutsig_0_44z = ~((celloutsig_0_12z & celloutsig_0_14z) | (celloutsig_0_14z & celloutsig_0_31z));
  assign celloutsig_1_8z = ~((celloutsig_1_4z[4] & celloutsig_1_6z) | (celloutsig_1_4z[1] & celloutsig_1_2z[1]));
  assign celloutsig_0_16z = ~((celloutsig_0_6z[1] & celloutsig_0_13z) | (celloutsig_0_1z & celloutsig_0_9z));
  assign celloutsig_0_23z = ~((celloutsig_0_3z[4] & celloutsig_0_20z) | (celloutsig_0_20z & celloutsig_0_5z[9]));
  assign celloutsig_0_2z = ~((celloutsig_0_1z & celloutsig_0_0z) | (celloutsig_0_1z & celloutsig_0_0z));
  assign celloutsig_0_28z = ~((celloutsig_0_13z & celloutsig_0_1z) | (celloutsig_0_20z & 1'h0));
  assign { celloutsig_0_11z[33], celloutsig_0_11z[35], celloutsig_0_11z[42:36], celloutsig_0_11z[21:7], celloutsig_0_11z[5:0], celloutsig_0_11z[43], celloutsig_0_11z[25:24] } = ~ { celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z };
  assign { celloutsig_0_11z[34], celloutsig_0_11z[32:26], celloutsig_0_11z[23:22], celloutsig_0_11z[6] } = { celloutsig_0_11z[43:36], celloutsig_0_11z[33], celloutsig_0_11z[25:24] };
  assign { out_data[128], out_data[96], out_data[32:0] } = { celloutsig_1_18z, celloutsig_1_3z, celloutsig_0_53z, celloutsig_0_54z[32:1] };
endmodule
