/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [20:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  reg [6:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  wire [3:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [2:0] celloutsig_0_26z;
  wire [9:0] celloutsig_0_29z;
  wire [5:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [12:0] celloutsig_0_3z;
  wire [4:0] celloutsig_0_42z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire [2:0] celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire celloutsig_0_66z;
  wire celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire [2:0] celloutsig_0_7z;
  reg [32:0] celloutsig_0_8z;
  wire celloutsig_1_0z;
  wire [2:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  reg [6:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [8:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [16:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_12z = celloutsig_1_7z ? celloutsig_1_6z[6] : celloutsig_1_9z[4];
  assign celloutsig_0_16z = celloutsig_0_5z ? celloutsig_0_2z[1] : celloutsig_0_7z[1];
  assign celloutsig_0_31z = ~((celloutsig_0_10z | celloutsig_0_8z[18]) & celloutsig_0_29z[8]);
  assign celloutsig_0_38z = ~((celloutsig_0_11z[1] | celloutsig_0_2z[4]) & celloutsig_0_16z);
  assign celloutsig_0_66z = ~((celloutsig_0_42z[4] | celloutsig_0_39z) & celloutsig_0_36z);
  assign celloutsig_0_19z = ~((celloutsig_0_17z | celloutsig_0_1z) & celloutsig_0_6z);
  assign celloutsig_0_24z = ~((celloutsig_0_5z | celloutsig_0_14z) & celloutsig_0_0z[18]);
  assign celloutsig_0_5z = celloutsig_0_2z[0] | ~(celloutsig_0_2z[2]);
  assign celloutsig_1_2z = celloutsig_1_1z | ~(celloutsig_1_1z);
  assign celloutsig_0_12z = celloutsig_0_1z | ~(celloutsig_0_8z[8]);
  assign celloutsig_0_14z = celloutsig_0_7z[2] | ~(celloutsig_0_7z[1]);
  assign celloutsig_0_4z = celloutsig_0_0z[2] | celloutsig_0_1z;
  assign celloutsig_0_6z = celloutsig_0_1z ^ celloutsig_0_2z[4];
  assign celloutsig_0_13z = ~(celloutsig_0_3z[3] ^ in_data[42]);
  assign celloutsig_1_11z = { celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_4z } + { celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_4z };
  assign celloutsig_0_26z = { in_data[82:81], celloutsig_0_23z } + { celloutsig_0_2z[2:1], celloutsig_0_15z };
  assign celloutsig_0_3z = in_data[58:46] & { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_70z = celloutsig_0_2z >= { celloutsig_0_66z, celloutsig_0_58z, celloutsig_0_12z, celloutsig_0_1z };
  assign celloutsig_1_3z = { in_data[163], celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z } <= { celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_8z = { in_data[101:96], celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_3z } <= { in_data[137], celloutsig_1_4z, celloutsig_1_6z };
  assign celloutsig_1_4z = { in_data[110], celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z } < in_data[182:179];
  assign celloutsig_1_18z = { celloutsig_1_15z[4:2], celloutsig_1_12z, celloutsig_1_17z } < celloutsig_1_15z[5:1];
  assign celloutsig_0_22z = in_data[95:80] < { in_data[31:24], celloutsig_0_6z, celloutsig_0_21z, celloutsig_0_14z, celloutsig_0_19z, celloutsig_0_4z };
  assign celloutsig_0_48z = in_data[9] & ~(celloutsig_0_11z[3]);
  assign celloutsig_1_7z = celloutsig_1_4z & ~(in_data[108]);
  assign celloutsig_1_17z = celloutsig_1_15z[3] & ~(celloutsig_1_2z);
  assign celloutsig_1_9z = { celloutsig_1_6z[8:2], celloutsig_1_8z, celloutsig_1_6z } % { 1'h1, celloutsig_1_6z[7:2], celloutsig_1_4z, celloutsig_1_6z[8:1], in_data[96] };
  assign celloutsig_0_29z = { celloutsig_0_3z[5:1], celloutsig_0_26z, celloutsig_0_23z, celloutsig_0_16z } % { 1'h1, celloutsig_0_3z[10:2] };
  assign celloutsig_0_7z = { celloutsig_0_2z[0], celloutsig_0_6z, celloutsig_0_6z } | { celloutsig_0_3z[4:3], celloutsig_0_5z };
  assign celloutsig_0_39z = & { celloutsig_0_38z, celloutsig_0_31z, celloutsig_0_7z };
  assign celloutsig_0_1z = & in_data[82:75];
  assign celloutsig_1_1z = celloutsig_1_0z & in_data[166];
  assign celloutsig_1_19z = celloutsig_1_6z[6] & in_data[165];
  assign celloutsig_0_15z = celloutsig_0_10z & celloutsig_0_7z[0];
  assign celloutsig_0_17z = celloutsig_0_1z & celloutsig_0_8z[28];
  assign celloutsig_0_10z = | { celloutsig_0_1z, celloutsig_0_0z[10:3] };
  assign celloutsig_0_18z = | { celloutsig_0_17z, celloutsig_0_5z, in_data[79:70] };
  assign celloutsig_0_36z = ^ { celloutsig_0_23z, celloutsig_0_5z, celloutsig_0_13z, celloutsig_0_34z };
  assign celloutsig_1_5z = ^ { in_data[118:112], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_0z };
  assign celloutsig_0_58z = { celloutsig_0_39z, celloutsig_0_24z, celloutsig_0_48z } >> { celloutsig_0_22z, celloutsig_0_19z, celloutsig_0_30z };
  assign celloutsig_1_6z = { celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_3z } >> { celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_0_21z = celloutsig_0_20z >> { celloutsig_0_7z, celloutsig_0_19z };
  assign celloutsig_0_42z = celloutsig_0_8z[6:2] - celloutsig_0_11z[5:1];
  assign celloutsig_0_2z = { celloutsig_0_0z[16:12], celloutsig_0_1z } - { celloutsig_0_0z[9:5], celloutsig_0_1z };
  assign celloutsig_0_20z = { celloutsig_0_6z, celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_18z } - celloutsig_0_11z[3:0];
  assign celloutsig_0_0z = in_data[62:42] ^ in_data[23:3];
  assign celloutsig_0_34z = ~((celloutsig_0_20z[0] & celloutsig_0_17z) | celloutsig_0_13z);
  assign celloutsig_0_69z = ~((celloutsig_0_31z & celloutsig_0_20z[1]) | celloutsig_0_22z);
  assign celloutsig_1_0z = ~((in_data[128] & in_data[118]) | in_data[124]);
  assign celloutsig_0_23z = ~((celloutsig_0_18z & celloutsig_0_4z) | celloutsig_0_5z);
  assign celloutsig_0_30z = ~((celloutsig_0_21z[0] & celloutsig_0_10z) | celloutsig_0_17z);
  always_latch
    if (clkin_data[96]) celloutsig_0_8z = 33'h000000000;
    else if (!clkin_data[0]) celloutsig_0_8z = { celloutsig_0_0z[18:13], celloutsig_0_2z, celloutsig_0_0z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_15z = 7'h00;
    else if (!clkin_data[64]) celloutsig_1_15z = { celloutsig_1_11z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_0z };
  always_latch
    if (!celloutsig_1_18z) celloutsig_0_11z = 7'h00;
    else if (!clkin_data[32]) celloutsig_0_11z = { celloutsig_0_0z[10:6], celloutsig_0_6z, celloutsig_0_4z };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_69z, celloutsig_0_70z };
endmodule
