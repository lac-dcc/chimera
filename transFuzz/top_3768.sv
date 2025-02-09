/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [14:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [22:0] celloutsig_0_12z;
  wire [30:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire [5:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  reg [3:0] celloutsig_0_20z;
  wire [4:0] celloutsig_0_21z;
  wire [19:0] celloutsig_0_22z;
  wire [7:0] celloutsig_0_24z;
  wire [16:0] celloutsig_0_25z;
  wire [4:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [7:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [6:0] celloutsig_0_36z;
  wire celloutsig_0_3z;
  wire [6:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [8:0] celloutsig_0_5z;
  wire [11:0] celloutsig_0_6z;
  wire [26:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [20:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_17z;
  wire [4:0] celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [3:0] celloutsig_1_2z;
  wire [22:0] celloutsig_1_3z;
  wire [11:0] celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire [4:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_9z = ~(celloutsig_1_8z[3] & celloutsig_1_0z[4]);
  assign celloutsig_1_17z = !(celloutsig_1_9z ? in_data[121] : celloutsig_1_11z);
  assign celloutsig_1_6z = celloutsig_1_0z[8] | in_data[133];
  assign celloutsig_0_9z = celloutsig_0_3z | celloutsig_0_0z;
  assign celloutsig_0_0z = ~(in_data[27] ^ in_data[92]);
  assign celloutsig_1_11z = ~(celloutsig_1_7z[1] ^ celloutsig_1_0z[14]);
  assign celloutsig_1_14z = ~(celloutsig_1_6z ^ celloutsig_1_4z[8]);
  assign celloutsig_0_2z = ~(celloutsig_0_0z ^ in_data[65]);
  assign celloutsig_0_21z = celloutsig_0_6z[9:5] / { 1'h1, celloutsig_0_6z[9:8], celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_0_4z = { celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_2z } >= { in_data[44:39], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_1_12z = { in_data[171:170], celloutsig_1_11z } >= { celloutsig_1_6z, celloutsig_1_10z, celloutsig_1_6z };
  assign celloutsig_0_8z = { in_data[57:35], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_3z } >= { in_data[27:6], celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_17z = { celloutsig_0_7z[18], celloutsig_0_10z[5:0], celloutsig_0_15z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_14z } >= celloutsig_0_6z[11:1];
  assign celloutsig_0_19z = celloutsig_0_13z[18:2] >= celloutsig_0_7z[20:4];
  assign celloutsig_0_1z = { in_data[46:36], celloutsig_0_0z } && in_data[57:46];
  assign celloutsig_0_35z = { celloutsig_0_6z[11:8], celloutsig_0_2z } || { celloutsig_0_34z[3:1], celloutsig_0_14z, celloutsig_0_28z };
  assign celloutsig_0_50z = { celloutsig_0_36z[6:4], celloutsig_0_9z, celloutsig_0_35z } || { celloutsig_0_49z[5:4], celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_36z = celloutsig_0_12z[13:7] * celloutsig_0_12z[10:4];
  assign celloutsig_1_19z = { celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_10z, celloutsig_1_17z, celloutsig_1_11z, celloutsig_1_12z, celloutsig_1_14z } * { in_data[169:164], celloutsig_1_14z, celloutsig_1_1z, celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_11z };
  assign celloutsig_0_18z = celloutsig_0_17z ? { celloutsig_0_10z[9:8], celloutsig_0_7z[19:18], celloutsig_0_10z[5:4] } : celloutsig_0_13z[20:15];
  assign celloutsig_0_12z = - { celloutsig_0_7z[17:13], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_10z[14:8], celloutsig_0_7z[19:18], celloutsig_0_10z[5:0] };
  assign celloutsig_0_24z = - celloutsig_0_22z[7:0];
  assign celloutsig_1_4z = ~ { celloutsig_1_3z[18:11], celloutsig_1_2z };
  assign celloutsig_0_14z = | { celloutsig_0_7z[18:15], celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_0_3z = | { celloutsig_0_2z, celloutsig_0_1z, in_data[69] };
  assign celloutsig_0_11z = | celloutsig_0_7z[16:3];
  assign celloutsig_0_34z = celloutsig_0_6z[9:2] >> { celloutsig_0_5z[8:7], 2'h0, celloutsig_0_4z, celloutsig_0_14z, celloutsig_0_17z, celloutsig_0_8z };
  assign celloutsig_1_2z = { celloutsig_1_0z[9:7], celloutsig_1_1z } >> celloutsig_1_0z[18:15];
  assign celloutsig_0_25z = in_data[40:24] >> celloutsig_0_13z[25:9];
  assign celloutsig_1_8z = celloutsig_1_3z[11:7] << in_data[110:106];
  assign celloutsig_1_0z = in_data[156:136] >> in_data[177:157];
  assign celloutsig_0_6z = { in_data[72:64], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z } >> { in_data[83:74], celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_7z = { in_data[53:28], celloutsig_0_1z } >> { in_data[50:29], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_49z = { celloutsig_0_24z[2:0], celloutsig_0_20z } <<< { 2'h0, celloutsig_0_5z[4:0] };
  assign celloutsig_1_7z = celloutsig_1_4z[5:3] >>> { in_data[97:96], celloutsig_1_6z };
  assign celloutsig_0_13z = in_data[71:41] - { celloutsig_0_7z[6:4], celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_1z };
  assign celloutsig_0_22z = { celloutsig_0_7z[16:13], celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_14z, celloutsig_0_19z, celloutsig_0_4z } - { celloutsig_0_12z[18:5], celloutsig_0_21z, celloutsig_0_19z };
  assign celloutsig_1_3z = { celloutsig_1_2z[3], celloutsig_1_1z, celloutsig_1_0z } ^ { in_data[127:115], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_18z = { celloutsig_1_4z[6:3], celloutsig_1_11z } ^ { celloutsig_1_4z[7], celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_9z };
  assign celloutsig_0_27z = celloutsig_0_25z[7:3] ^ celloutsig_0_18z[5:1];
  assign celloutsig_0_15z = ~((celloutsig_0_10z[4] & celloutsig_0_8z) | celloutsig_0_8z);
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_20z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_20z = celloutsig_0_18z[4:1];
  assign celloutsig_1_1z = ~((celloutsig_1_0z[17] & in_data[110]) | (celloutsig_1_0z[1] & in_data[123]));
  assign celloutsig_1_10z = ~((in_data[147] & celloutsig_1_4z[2]) | (celloutsig_1_4z[4] & celloutsig_1_1z));
  assign celloutsig_0_28z = ~((celloutsig_0_27z[2] & celloutsig_0_10z[13]) | (celloutsig_0_22z[17] & celloutsig_0_21z[3]));
  assign { celloutsig_0_5z[1:0], celloutsig_0_5z[2], celloutsig_0_5z[4], celloutsig_0_5z[7], celloutsig_0_5z[8], celloutsig_0_5z[3] } = { celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z, in_data[42], celloutsig_0_0z } ^ { celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z };
  assign { celloutsig_0_10z[14:8], celloutsig_0_10z[5:0] } = { celloutsig_0_7z[26:20], celloutsig_0_7z[17:12] } ^ { celloutsig_0_6z[3:0], celloutsig_0_4z, celloutsig_0_5z[8:7], celloutsig_0_5z[4:0], celloutsig_0_1z };
  assign celloutsig_0_10z[7:6] = celloutsig_0_7z[19:18];
  assign celloutsig_0_5z[6:5] = 2'h0;
  assign { out_data[132:128], out_data[106:96], out_data[38:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_49z, celloutsig_0_50z };
endmodule
