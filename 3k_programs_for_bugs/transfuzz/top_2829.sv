/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire [5:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [12:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [11:0] celloutsig_0_19z;
  wire [5:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [5:0] celloutsig_0_21z;
  wire [2:0] celloutsig_0_22z;
  wire [16:0] celloutsig_0_23z;
  wire [9:0] celloutsig_0_24z;
  wire [10:0] celloutsig_0_25z;
  wire [7:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [2:0] celloutsig_0_28z;
  wire [26:0] celloutsig_0_29z;
  wire [20:0] celloutsig_0_2z;
  wire [11:0] celloutsig_0_30z;
  wire [3:0] celloutsig_0_32z;
  wire [29:0] celloutsig_0_33z;
  wire [16:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  reg [3:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [4:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire [3:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_55z;
  wire celloutsig_0_57z;
  wire [12:0] celloutsig_0_5z;
  wire celloutsig_0_61z;
  reg [11:0] celloutsig_0_63z;
  wire [6:0] celloutsig_0_64z;
  wire [3:0] celloutsig_0_76z;
  reg [30:0] celloutsig_0_7z;
  wire [15:0] celloutsig_0_82z;
  wire celloutsig_0_89z;
  wire celloutsig_0_8z;
  wire celloutsig_0_90z;
  wire [16:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [21:0] celloutsig_1_11z;
  wire [22:0] celloutsig_1_12z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire [4:0] celloutsig_1_6z;
  reg [20:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = celloutsig_0_1z[2] ? celloutsig_0_0z : in_data[33];
  assign celloutsig_0_51z = celloutsig_0_38z ? celloutsig_0_11z : celloutsig_0_43z;
  assign celloutsig_0_17z = celloutsig_0_16z[7] ? celloutsig_0_7z[24] : celloutsig_0_5z[12];
  assign celloutsig_0_39z = ~(celloutsig_0_17z | celloutsig_0_32z[1]);
  assign celloutsig_0_46z = ~(1'h1 | celloutsig_0_16z[10]);
  assign celloutsig_0_11z = ~(celloutsig_0_8z | celloutsig_0_2z[2]);
  assign celloutsig_0_14z = celloutsig_0_7z[16] | ~(celloutsig_0_10z);
  assign celloutsig_0_27z = celloutsig_0_25z[0] | celloutsig_0_21z[3];
  assign celloutsig_0_42z = ~(celloutsig_0_21z[5] ^ celloutsig_0_25z[8]);
  assign celloutsig_0_48z = ~(celloutsig_0_40z ^ celloutsig_0_23z[2]);
  assign celloutsig_1_2z = ~(in_data[129] ^ celloutsig_1_1z);
  assign celloutsig_0_34z = celloutsig_0_2z[17:1] + { celloutsig_0_24z[6:1], celloutsig_0_22z, celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_27z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_41z = celloutsig_0_12z[4:0] + { celloutsig_0_1z[2:0], celloutsig_0_40z, celloutsig_0_17z };
  assign celloutsig_0_76z = celloutsig_0_24z[5:2] + { celloutsig_0_63z[3:1], celloutsig_0_8z };
  assign celloutsig_1_6z = celloutsig_1_12z[7:3] + { in_data[112:109], celloutsig_1_1z };
  assign celloutsig_0_1z = { in_data[34:30], celloutsig_0_0z } + { in_data[65:62], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_23z = { celloutsig_0_5z[3], celloutsig_0_10z, celloutsig_0_17z, 1'h1, celloutsig_0_12z, celloutsig_0_15z, celloutsig_0_20z, celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_17z, celloutsig_0_15z } + { celloutsig_0_9z[15:7], 1'h1, celloutsig_0_17z, celloutsig_0_1z };
  assign celloutsig_0_29z = { celloutsig_0_16z[9:5], celloutsig_0_27z, celloutsig_0_22z, celloutsig_0_0z, celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_18z, celloutsig_0_20z, celloutsig_0_17z } + { celloutsig_0_7z[12], celloutsig_0_12z, celloutsig_0_22z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_20z, celloutsig_0_24z, celloutsig_0_10z };
  assign celloutsig_0_16z = in_data[83:71] & { in_data[70:60], celloutsig_0_15z, celloutsig_0_8z };
  assign celloutsig_0_2z = { in_data[21:13], celloutsig_0_1z, celloutsig_0_1z } & { in_data[85:66], celloutsig_0_0z };
  assign celloutsig_0_19z = celloutsig_0_5z[12:1] / { 1'h1, celloutsig_0_9z[3:0], celloutsig_0_1z, celloutsig_0_17z };
  assign celloutsig_0_57z = { in_data[22:20], celloutsig_0_5z } == { celloutsig_0_7z[15:13], celloutsig_0_16z };
  assign celloutsig_1_4z = in_data[174:170] === { 1'h1, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_16z = in_data[172:165] === in_data[112:105];
  assign celloutsig_0_40z = celloutsig_0_25z[9:0] > { celloutsig_0_17z, celloutsig_0_21z, celloutsig_0_36z, celloutsig_0_11z, celloutsig_0_27z };
  assign celloutsig_0_15z = celloutsig_0_2z[18:1] > { celloutsig_0_9z[14:3], celloutsig_0_1z };
  assign celloutsig_0_55z = { celloutsig_0_29z[17:10], celloutsig_0_4z, celloutsig_0_18z } <= { celloutsig_0_16z[2:1], celloutsig_0_41z, celloutsig_0_12z };
  assign celloutsig_1_0z = in_data[158:151] <= in_data[131:124];
  assign celloutsig_1_18z = { celloutsig_1_12z[10:3], in_data[133], celloutsig_1_2z, celloutsig_1_0z, 1'h0, celloutsig_1_16z } <= { celloutsig_1_11z[21:10], celloutsig_1_1z };
  assign celloutsig_0_61z = 1'h1 && { celloutsig_0_57z, celloutsig_0_18z, celloutsig_0_11z };
  assign celloutsig_0_8z = celloutsig_0_5z[4:0] && { celloutsig_0_4z[1], celloutsig_0_4z };
  assign celloutsig_0_36z = ! { celloutsig_0_13z[5:4], celloutsig_0_14z, celloutsig_0_26z, celloutsig_0_17z };
  assign celloutsig_0_38z = ! celloutsig_0_33z[7:5];
  assign celloutsig_0_52z = ! { in_data[89:88], celloutsig_0_37z, celloutsig_0_51z, celloutsig_0_35z, celloutsig_0_3z };
  assign celloutsig_0_89z = ! { celloutsig_0_29z[8:4], celloutsig_0_28z, celloutsig_0_50z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_90z = ! { celloutsig_0_82z[0], celloutsig_0_39z, celloutsig_0_46z };
  assign celloutsig_1_1z = ! { in_data[187], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_19z = ! { celloutsig_1_6z[2], celloutsig_1_9z, celloutsig_1_16z };
  assign celloutsig_0_43z = 1'h1 || celloutsig_0_33z[19:17];
  assign celloutsig_0_50z = { celloutsig_0_34z[5:2], celloutsig_0_48z, celloutsig_0_30z } < { celloutsig_0_9z[13:7], celloutsig_0_24z };
  assign celloutsig_0_18z = { celloutsig_0_2z[16:9], celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_11z } < in_data[47:37];
  assign celloutsig_0_33z = { celloutsig_0_30z[6:1], celloutsig_0_15z, celloutsig_0_17z, celloutsig_0_19z, celloutsig_0_11z, celloutsig_0_32z, celloutsig_0_10z, celloutsig_0_32z } % { 1'h1, celloutsig_0_7z[27:3], celloutsig_0_20z, celloutsig_0_15z, celloutsig_0_17z, celloutsig_0_18z };
  assign celloutsig_0_64z = { celloutsig_0_5z[9:4], celloutsig_0_42z } % { 1'h1, celloutsig_0_4z[2:0], celloutsig_0_10z, celloutsig_0_61z, celloutsig_0_55z };
  assign celloutsig_0_9z = { celloutsig_0_2z[18:7], 1'h1, celloutsig_0_4z } % { 1'h1, celloutsig_0_5z[11:5], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_12z = in_data[25:20] % { 1'h1, celloutsig_0_1z[4:0] };
  assign celloutsig_0_21z = celloutsig_0_19z[5:0] % { 1'h1, celloutsig_0_19z[10], celloutsig_0_14z, 2'h3, celloutsig_0_11z };
  assign celloutsig_0_22z = celloutsig_0_9z[5:3] % { 1'h1, celloutsig_0_21z[2:1] };
  assign celloutsig_0_28z = celloutsig_0_16z[8:6] % { 1'h1, celloutsig_0_15z, 1'h1 };
  assign celloutsig_0_5z = { celloutsig_0_2z[16:10], celloutsig_0_1z } % { 1'h1, in_data[22:11] };
  assign celloutsig_0_32z = { celloutsig_0_13z[4:2], 1'h1 } * celloutsig_0_30z[6:3];
  assign celloutsig_0_82z = celloutsig_0_48z ? { celloutsig_0_28z[1:0], celloutsig_0_3z, celloutsig_0_30z, celloutsig_0_39z } : { celloutsig_0_2z[5:4], celloutsig_0_57z, celloutsig_0_52z, celloutsig_0_76z, celloutsig_0_35z, celloutsig_0_64z };
  assign celloutsig_0_13z[5:1] = celloutsig_0_7z[11] ? celloutsig_0_12z[4:0] : celloutsig_0_2z[5:1];
  assign celloutsig_0_24z = celloutsig_0_11z ? { celloutsig_0_2z[20:12], celloutsig_0_10z } : celloutsig_0_5z[11:2];
  assign celloutsig_0_25z = celloutsig_0_8z ? { celloutsig_0_2z[1], celloutsig_0_24z } : { celloutsig_0_23z[15:9], celloutsig_0_11z, celloutsig_0_15z, 1'h0, celloutsig_0_18z };
  assign celloutsig_0_26z = - in_data[42:35];
  assign celloutsig_0_30z = { celloutsig_0_28z[1:0], celloutsig_0_24z } <<< { celloutsig_0_23z[16:6], celloutsig_0_8z };
  assign celloutsig_1_11z = { in_data[123:104], 2'h1 } <<< { celloutsig_1_9z, celloutsig_1_8z };
  assign celloutsig_0_4z = in_data[60:57] ~^ celloutsig_0_1z[3:0];
  assign celloutsig_1_9z = ~((in_data[117] & celloutsig_1_0z) | celloutsig_1_2z);
  assign celloutsig_0_10z = ~((1'h1 & celloutsig_0_8z) | celloutsig_0_4z[2]);
  assign celloutsig_0_20z = ~((celloutsig_0_15z & celloutsig_0_4z[0]) | celloutsig_0_10z);
  always_latch
    if (!celloutsig_1_19z) celloutsig_0_37z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_37z = celloutsig_0_16z[8:5];
  always_latch
    if (clkin_data[64]) celloutsig_0_63z = 12'h000;
    else if (clkin_data[0]) celloutsig_0_63z = { celloutsig_0_7z[22:12], celloutsig_0_50z };
  always_latch
    if (celloutsig_1_19z) celloutsig_0_7z = 31'h00000000;
    else if (clkin_data[0]) celloutsig_0_7z = { celloutsig_0_1z[5:3], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z };
  always_latch
    if (clkin_data[96]) celloutsig_1_8z = 21'h000000;
    else if (!clkin_data[32]) celloutsig_1_8z = { in_data[176:167], celloutsig_1_12z[12:3], in_data[133] };
  assign celloutsig_0_0z = ~((in_data[88] & in_data[0]) | (in_data[89] & in_data[75]));
  assign celloutsig_0_35z = ~((celloutsig_0_27z & celloutsig_0_30z[6]) | (celloutsig_0_33z[29] & celloutsig_0_1z[1]));
  assign celloutsig_1_12z[12:3] = in_data[143:134] & { in_data[173:167], celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_2z };
  assign celloutsig_0_13z[0] = celloutsig_0_11z;
  assign { celloutsig_1_12z[22:13], celloutsig_1_12z[2:0] } = { celloutsig_1_11z[7:5], celloutsig_1_6z, 1'h0, celloutsig_1_0z, in_data[133], 1'h1, celloutsig_1_4z };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_89z, celloutsig_0_90z };
endmodule
