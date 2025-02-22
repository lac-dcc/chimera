/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [5:0] _01_;
  reg [2:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [18:0] celloutsig_0_16z;
  wire [8:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [2:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [3:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_29z;
  wire [3:0] celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [4:0] celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire celloutsig_0_55z;
  wire [21:0] celloutsig_0_56z;
  wire [14:0] celloutsig_0_5z;
  wire [6:0] celloutsig_0_64z;
  wire celloutsig_0_67z;
  wire celloutsig_0_6z;
  wire celloutsig_0_72z;
  wire celloutsig_0_7z;
  wire [27:0] celloutsig_0_8z;
  wire [8:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [8:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [7:0] celloutsig_1_12z;
  wire [11:0] celloutsig_1_13z;
  wire [3:0] celloutsig_1_14z;
  wire [13:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [7:0] celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [2:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_21z = celloutsig_0_5z[14] ? celloutsig_0_0z : celloutsig_0_5z[5];
  assign celloutsig_0_29z = celloutsig_0_10z ? celloutsig_0_20z : celloutsig_0_15z;
  assign celloutsig_0_32z = celloutsig_0_7z ? celloutsig_0_9z[8] : celloutsig_0_11z;
  assign celloutsig_0_33z = celloutsig_0_4z ? celloutsig_0_16z[1] : celloutsig_0_16z[17];
  assign celloutsig_0_34z = celloutsig_0_1z ? celloutsig_0_0z : celloutsig_0_5z[6];
  assign celloutsig_0_35z = ~(celloutsig_0_14z | celloutsig_0_16z[15]);
  assign celloutsig_0_55z = ~(celloutsig_0_39z | celloutsig_0_3z[0]);
  assign celloutsig_0_72z = ~(celloutsig_0_64z[6] | celloutsig_0_51z);
  assign celloutsig_0_18z = ~(celloutsig_0_17z[3] | celloutsig_0_16z[15]);
  assign celloutsig_1_4z = ~in_data[152];
  assign celloutsig_0_14z = ~celloutsig_0_5z[14];
  assign celloutsig_1_7z = celloutsig_1_3z[5] | ~(celloutsig_1_5z);
  assign celloutsig_0_11z = celloutsig_0_7z | ~(celloutsig_0_7z);
  assign celloutsig_0_67z = celloutsig_0_5z[7] ^ _00_;
  assign celloutsig_1_17z = celloutsig_1_3z[9] ^ celloutsig_1_10z[2];
  assign celloutsig_1_8z = ~(celloutsig_1_6z ^ in_data[130]);
  assign celloutsig_0_13z = ~(celloutsig_0_11z ^ celloutsig_0_5z[4]);
  assign celloutsig_0_23z = ~(celloutsig_0_2z[3] ^ celloutsig_0_11z);
  assign celloutsig_0_26z = ~(celloutsig_0_1z ^ celloutsig_0_15z);
  assign celloutsig_0_31z = ~(celloutsig_0_23z ^ celloutsig_0_29z);
  assign celloutsig_1_3z = { in_data[111:104], celloutsig_1_0z, celloutsig_1_1z } + { in_data[103:97], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_3z = in_data[18:14] + { in_data[49], celloutsig_0_2z[3:1], celloutsig_0_2z[2] };
  reg [5:0] _25_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _25_ <= 6'h00;
    else _25_ <= { celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_22z, celloutsig_0_34z };
  assign { _01_[5], _00_, _01_[3:0] } = _25_;
  reg [7:0] _26_;
  always_ff @(negedge clkin_data[32], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _26_ <= 8'h00;
    else _26_ <= { celloutsig_0_64z[2], celloutsig_0_4z, celloutsig_0_29z, celloutsig_0_67z, celloutsig_0_49z, celloutsig_0_23z, celloutsig_0_6z, celloutsig_0_55z };
  assign out_data[7:0] = _26_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _02_ <= 3'h0;
    else _02_ <= celloutsig_0_25z[2:0];
  assign celloutsig_1_13z = { celloutsig_1_12z[5:1], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_6z } & { in_data[177:168], celloutsig_1_11z, celloutsig_1_6z };
  assign celloutsig_0_17z = { celloutsig_0_16z[15:8], celloutsig_0_13z } / { 1'h1, celloutsig_0_5z[11:7], celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_10z };
  assign celloutsig_0_39z = { in_data[66:61], celloutsig_0_4z } >= { celloutsig_0_5z[5:0], celloutsig_0_7z };
  assign celloutsig_1_0z = in_data[168:147] >= in_data[146:125];
  assign celloutsig_0_10z = { in_data[68:61], celloutsig_0_1z } >= { celloutsig_0_9z[8:1], celloutsig_0_1z };
  assign celloutsig_0_19z = celloutsig_0_5z[6:0] >= celloutsig_0_9z[8:2];
  assign celloutsig_0_49z = ! celloutsig_0_25z[2:0];
  assign celloutsig_1_5z = ! celloutsig_1_3z[5:2];
  assign celloutsig_0_4z = { in_data[63:54], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_1z } || { in_data[74:58], celloutsig_0_1z };
  assign celloutsig_1_1z = { in_data[115:111], celloutsig_1_0z } || { in_data[159:155], celloutsig_1_0z };
  assign celloutsig_0_15z = { celloutsig_0_2z[3], celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_11z } || { celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_64z = celloutsig_0_56z[13:7] * { celloutsig_0_16z[14:13], celloutsig_0_31z, celloutsig_0_6z, celloutsig_0_35z, celloutsig_0_19z, celloutsig_0_18z };
  assign celloutsig_1_16z = { celloutsig_1_13z[10:0], celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_0z } * { in_data[171:168], celloutsig_1_3z };
  assign celloutsig_1_19z = celloutsig_1_14z[3:1] * celloutsig_1_12z[4:2];
  assign celloutsig_0_37z = { celloutsig_0_5z[11:2], celloutsig_0_34z } !== { celloutsig_0_12z, celloutsig_0_32z, celloutsig_0_36z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_26z, celloutsig_0_4z, celloutsig_0_2z[3:1], celloutsig_0_2z[2] };
  assign celloutsig_0_20z = celloutsig_0_16z[18:14] !== { celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_1z };
  assign celloutsig_1_2z = ~ in_data[179:172];
  assign celloutsig_0_9z = ~ { celloutsig_0_8z[24:18], celloutsig_0_6z, celloutsig_0_1z };
  assign celloutsig_1_14z = ~ celloutsig_1_2z[6:3];
  assign celloutsig_0_25z = ~ celloutsig_0_5z[3:0];
  assign celloutsig_1_9z = { celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_6z } | { celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_16z = { celloutsig_0_8z[19:5], celloutsig_0_8z[9:7], celloutsig_0_8z[1] } | { celloutsig_0_8z[22:11], celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_4z };
  assign celloutsig_0_22z = celloutsig_0_16z[13:11] | { celloutsig_0_9z[1], celloutsig_0_7z, celloutsig_0_7z };
  assign celloutsig_0_0z = & in_data[53:45];
  assign celloutsig_0_38z = & { celloutsig_0_18z, celloutsig_0_17z[6:2], celloutsig_0_10z };
  assign celloutsig_0_6z = & { celloutsig_0_2z[3:1], in_data[53:45] };
  assign celloutsig_0_1z = & in_data[23:20];
  assign celloutsig_0_12z = & { celloutsig_0_10z, celloutsig_0_7z, in_data[23:20] };
  assign celloutsig_0_42z = | { celloutsig_0_21z, celloutsig_0_20z, celloutsig_0_12z, celloutsig_0_3z[4:2] };
  assign celloutsig_0_7z = | { celloutsig_0_6z, celloutsig_0_5z[12:9], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_1_11z = | celloutsig_1_3z[9:1];
  assign celloutsig_0_51z = ~^ { celloutsig_0_16z[14:1], celloutsig_0_2z[3:1], celloutsig_0_2z[2], celloutsig_0_49z, celloutsig_0_36z, celloutsig_0_29z, celloutsig_0_19z };
  assign celloutsig_1_6z = ~^ in_data[138:136];
  assign celloutsig_1_18z = ~^ { celloutsig_1_16z[9:2], celloutsig_1_6z, celloutsig_1_17z, celloutsig_1_11z, celloutsig_1_9z, celloutsig_1_12z, celloutsig_1_6z, celloutsig_1_14z, celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_7z };
  assign celloutsig_0_36z = ^ { celloutsig_0_8z[19:18], celloutsig_0_19z, _02_, celloutsig_0_29z, celloutsig_0_17z };
  assign celloutsig_0_56z = { celloutsig_0_14z, celloutsig_0_20z, celloutsig_0_26z, celloutsig_0_35z, celloutsig_0_13z, celloutsig_0_39z, celloutsig_0_32z, celloutsig_0_23z, celloutsig_0_10z, celloutsig_0_33z, celloutsig_0_11z, celloutsig_0_19z, _02_, celloutsig_0_18z, celloutsig_0_26z, celloutsig_0_39z, celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_6z, celloutsig_0_37z } >>> { celloutsig_0_16z[15:3], celloutsig_0_12z, celloutsig_0_42z, _02_, celloutsig_0_38z, celloutsig_0_32z, celloutsig_0_13z, celloutsig_0_11z };
  assign celloutsig_0_5z = { in_data[60], celloutsig_0_2z[3:1], celloutsig_0_2z[2], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_0z } - in_data[40:26];
  assign celloutsig_1_12z = { celloutsig_1_10z[7:5], celloutsig_1_10z[5], celloutsig_1_10z[3:0] } - celloutsig_1_2z;
  assign { celloutsig_0_2z[2], celloutsig_0_2z[3], celloutsig_0_2z[1] } = ~ { celloutsig_0_1z, in_data[69], celloutsig_0_0z };
  assign { celloutsig_0_8z[0], celloutsig_0_8z[17], celloutsig_0_8z[23], celloutsig_0_8z[12], celloutsig_0_8z[6], celloutsig_0_8z[11], celloutsig_0_8z[27], celloutsig_0_8z[5], celloutsig_0_8z[10], celloutsig_0_8z[26], celloutsig_0_8z[9], celloutsig_0_8z[25], celloutsig_0_8z[8], celloutsig_0_8z[24], celloutsig_0_8z[7], celloutsig_0_8z[21], celloutsig_0_8z[16:15], celloutsig_0_8z[20], celloutsig_0_8z[14], celloutsig_0_8z[19], celloutsig_0_8z[13], celloutsig_0_8z[18], celloutsig_0_8z[22], celloutsig_0_8z[1] } = { celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_3z[4], celloutsig_0_3z[4], celloutsig_0_3z[4:3], celloutsig_0_3z[3], celloutsig_0_3z[3:2], celloutsig_0_3z[2:1], celloutsig_0_3z[1:0], celloutsig_0_2z[3], celloutsig_0_2z[3:2], celloutsig_0_2z[2:1], celloutsig_0_2z[1], celloutsig_0_2z[2], celloutsig_0_2z[2], celloutsig_0_1z, celloutsig_0_0z } & { celloutsig_0_3z[0], in_data[43], in_data[49], celloutsig_0_2z[2], celloutsig_0_3z[1], celloutsig_0_1z, in_data[53], celloutsig_0_3z[0], celloutsig_0_1z, in_data[52], celloutsig_0_3z[4], in_data[51], celloutsig_0_3z[3], in_data[50], celloutsig_0_3z[2], in_data[47], in_data[42], celloutsig_0_2z[3], in_data[46], celloutsig_0_2z[2], in_data[45], celloutsig_0_2z[1], in_data[44], in_data[48], celloutsig_0_3z[1] };
  assign { celloutsig_1_10z[3:1], celloutsig_1_10z[6:5], celloutsig_1_10z[0], celloutsig_1_10z[8:7] } = ~ { celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_1z, in_data[126:125] };
  assign _01_[4] = _00_;
  assign celloutsig_0_2z[0] = celloutsig_0_2z[2];
  assign celloutsig_0_8z[4:2] = celloutsig_0_8z[9:7];
  assign celloutsig_1_10z[4] = celloutsig_1_10z[5];
  assign { out_data[128], out_data[98:96], out_data[32] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_72z };
endmodule
