/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [21:0] _01_;
  wire [21:0] _02_;
  wire celloutsig_0_0z;
  wire [3:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [6:0] celloutsig_0_13z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [3:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [4:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire [14:0] celloutsig_0_36z;
  wire celloutsig_0_3z;
  wire [18:0] celloutsig_0_40z;
  wire [26:0] celloutsig_0_47z;
  wire [2:0] celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire [11:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire [7:0] celloutsig_1_0z;
  wire [10:0] celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [4:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [7:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [7:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [18:0] _03_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _03_ <= 19'h00000;
    else _03_ <= { _01_[21:16], _01_[21:19], celloutsig_0_1z, celloutsig_0_32z, celloutsig_0_20z, celloutsig_0_2z, celloutsig_0_26z, celloutsig_0_10z, celloutsig_0_2z };
  assign { _02_[21:13], _00_, _02_[11:8], _02_[4:0] } = _03_;
  assign celloutsig_0_32z = ~((1'h0 | celloutsig_0_11z) & (celloutsig_0_19z | celloutsig_0_26z));
  assign celloutsig_1_19z = ~((celloutsig_1_17z | in_data[144]) & (celloutsig_1_16z | celloutsig_1_9z));
  assign celloutsig_0_15z = ~((in_data[44] | 1'h0) & (celloutsig_0_4z[1] | celloutsig_0_3z));
  assign celloutsig_0_19z = ~((celloutsig_0_13z[2] | celloutsig_0_10z[3]) & (celloutsig_0_17z | 1'h0));
  assign celloutsig_0_31z = celloutsig_0_24z | ~(in_data[27]);
  assign celloutsig_1_6z = celloutsig_1_0z[7] | ~(celloutsig_1_2z[4]);
  assign celloutsig_0_9z = 1'h0 | ~(celloutsig_0_7z);
  assign celloutsig_0_22z = celloutsig_0_4z[0] | ~(celloutsig_0_3z);
  assign celloutsig_0_3z = celloutsig_0_1z ^ in_data[92];
  assign celloutsig_1_13z = celloutsig_1_12z ^ in_data[167];
  assign celloutsig_0_20z = celloutsig_0_13z[3] ^ celloutsig_0_0z;
  assign celloutsig_0_2z = celloutsig_0_0z ^ celloutsig_0_1z;
  assign celloutsig_0_27z = celloutsig_0_21z ^ celloutsig_0_15z;
  assign celloutsig_0_56z = ~(celloutsig_0_13z[2] ^ _00_);
  assign celloutsig_0_7z = ~(celloutsig_0_6z ^ celloutsig_0_1z);
  assign celloutsig_0_23z = ~(celloutsig_0_7z ^ celloutsig_0_17z);
  assign celloutsig_0_24z = ~(celloutsig_0_2z ^ celloutsig_0_16z);
  assign celloutsig_0_26z = ~(celloutsig_0_0z ^ celloutsig_0_22z);
  assign celloutsig_0_29z = ~(celloutsig_0_16z ^ celloutsig_0_18z);
  reg [5:0] _23_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _23_ <= 6'h00;
    else _23_ <= { celloutsig_0_13z[4:0], celloutsig_0_9z };
  assign { _01_[18:16], _01_[21:19] } = _23_;
  assign celloutsig_0_5z = { in_data[28], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_3z } / { 1'h1, in_data[31:27], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_4z, in_data[0] };
  assign celloutsig_0_36z = { celloutsig_0_13z[5], _01_[18:16], _01_[21:19], celloutsig_0_16z, celloutsig_0_20z, _01_[18:16], _01_[21:19] } / { 1'h1, celloutsig_0_22z, _01_[18:16], _01_[21:19], celloutsig_0_30z, celloutsig_0_27z, celloutsig_0_9z };
  assign celloutsig_0_10z = { 2'h0, celloutsig_0_3z, celloutsig_0_7z } / { 1'h1, celloutsig_0_4z };
  assign celloutsig_0_51z = celloutsig_0_47z[20:5] === celloutsig_0_47z[23:8];
  assign celloutsig_1_1z = in_data[106:105] === in_data[109:108];
  assign celloutsig_1_9z = { in_data[125:117], celloutsig_1_4z, celloutsig_1_8z } === { in_data[137:134], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_6z };
  assign celloutsig_0_12z = celloutsig_0_10z > celloutsig_0_10z;
  assign celloutsig_0_17z = celloutsig_0_5z[10:0] > { celloutsig_0_16z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_34z = { celloutsig_0_17z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_31z } <= { _02_[9:8], 1'h0, celloutsig_0_21z };
  assign celloutsig_0_55z = { celloutsig_0_22z, celloutsig_0_51z, celloutsig_0_34z } <= { celloutsig_0_30z[4:3], celloutsig_0_0z };
  assign celloutsig_1_4z = { celloutsig_1_2z[4:0], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z } <= { in_data[105:103], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_1z = in_data[80:72] <= { in_data[64:57], celloutsig_0_0z };
  assign celloutsig_1_3z = ! { in_data[177:172], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_1_14z = ! { in_data[152:150], celloutsig_1_6z };
  assign celloutsig_1_15z = ! { celloutsig_1_10z[2:0], celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_8z, celloutsig_1_13z };
  assign celloutsig_1_17z = ! { celloutsig_1_0z[4:3], celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_0_6z = { celloutsig_0_5z[8], celloutsig_0_1z, celloutsig_0_3z } || celloutsig_0_5z[8:6];
  assign celloutsig_1_7z = { celloutsig_1_0z[5:2], celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_5z } || { in_data[176:173], celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_1_12z = celloutsig_1_0z[7:1] || { celloutsig_1_9z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_9z, celloutsig_1_1z };
  assign celloutsig_1_16z = celloutsig_1_10z[6:0] || celloutsig_1_2z[6:0];
  assign celloutsig_0_16z = { celloutsig_0_13z[2:1], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_9z, _01_[18:16], _01_[21:19] } || { celloutsig_0_4z[2:1], celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_6z };
  assign celloutsig_0_25z = { in_data[69:64], celloutsig_0_7z, celloutsig_0_1z } || { celloutsig_0_13z[6:5], celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_0z };
  assign celloutsig_0_21z = celloutsig_0_15z & ~(celloutsig_0_12z);
  assign celloutsig_0_40z = celloutsig_0_6z ? { _02_[19:13], _00_, _02_[11:10], celloutsig_0_22z, celloutsig_0_31z, celloutsig_0_28z, celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_17z } : { _02_[8], 2'h0, celloutsig_0_24z, celloutsig_0_21z, _01_[18:16], _01_[21:19], celloutsig_0_25z, 3'h0, celloutsig_0_29z, celloutsig_0_29z, celloutsig_0_15z, celloutsig_0_12z };
  assign { celloutsig_1_10z[10], celloutsig_1_10z[8:0] } = celloutsig_1_0z[2] ? { celloutsig_1_5z[7], celloutsig_1_0z[7:3], 1'h1, celloutsig_1_0z[1:0], celloutsig_1_7z } : { celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_6z };
  assign celloutsig_0_28z = celloutsig_0_4z[0] ? { celloutsig_0_27z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_21z } : { celloutsig_0_23z, celloutsig_0_9z, celloutsig_0_26z, celloutsig_0_19z };
  assign celloutsig_0_47z = - { celloutsig_0_40z[17:10], celloutsig_0_3z, celloutsig_0_31z, celloutsig_0_23z, celloutsig_0_29z, celloutsig_0_36z };
  assign celloutsig_0_0z = in_data[19:17] !== in_data[58:56];
  assign celloutsig_1_8z = { celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_4z } !== { celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_7z };
  assign celloutsig_0_11z = { celloutsig_0_10z[3], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_3z } !== { celloutsig_0_5z[6:2], celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_18z = { celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_0z } !== { 2'h0, celloutsig_0_12z };
  assign celloutsig_1_2z = { in_data[126:120], celloutsig_1_1z } | celloutsig_1_0z;
  assign celloutsig_1_11z = celloutsig_1_2z[4:2] >>> celloutsig_1_2z[6:4];
  assign celloutsig_0_13z = { celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_0z } >>> celloutsig_0_5z[6:0];
  assign celloutsig_1_0z = in_data[138:131] ~^ in_data[144:137];
  assign celloutsig_0_4z = in_data[4:2] ^ { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_1_5z = in_data[155:148] ^ { celloutsig_1_2z[6:0], celloutsig_1_1z };
  assign celloutsig_1_18z = { celloutsig_1_10z[5], celloutsig_1_15z, celloutsig_1_4z, celloutsig_1_13z, celloutsig_1_17z } ^ { in_data[173:172], celloutsig_1_6z, celloutsig_1_14z, celloutsig_1_9z };
  assign celloutsig_0_30z = { celloutsig_0_2z, celloutsig_0_21z, celloutsig_0_26z, celloutsig_0_20z, celloutsig_0_18z } ^ celloutsig_0_13z[4:0];
  assign _01_[15:0] = { _01_[21:19], celloutsig_0_1z, celloutsig_0_32z, celloutsig_0_20z, celloutsig_0_2z, celloutsig_0_26z, 3'h0, celloutsig_0_10z, celloutsig_0_2z };
  assign { _02_[12], _02_[7:5] } = { _00_, 3'h0 };
  assign celloutsig_1_10z[9] = celloutsig_1_1z;
  assign { out_data[132:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_55z, celloutsig_0_56z };
endmodule
