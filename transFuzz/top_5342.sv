/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [7:0] _01_;
  reg [3:0] _02_;
  wire celloutsig_0_0z;
  wire [8:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_14z;
  wire [7:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [3:0] celloutsig_0_17z;
  wire [8:0] celloutsig_0_19z;
  wire [16:0] celloutsig_0_1z;
  wire [9:0] celloutsig_0_20z;
  wire [3:0] celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_2z;
  wire celloutsig_0_32z;
  wire celloutsig_0_36z;
  wire celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire [6:0] celloutsig_0_4z;
  wire [4:0] celloutsig_0_5z;
  wire [17:0] celloutsig_0_63z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [7:0] celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [35:0] celloutsig_1_18z;
  wire [17:0] celloutsig_1_19z;
  wire [10:0] celloutsig_1_1z;
  wire [17:0] celloutsig_1_2z;
  wire [19:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [9:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [10:0] celloutsig_1_8z;
  wire [4:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_10z = !(celloutsig_1_6z[2] ? celloutsig_1_6z[8] : celloutsig_1_0z);
  assign celloutsig_1_7z = ~(celloutsig_1_4z | celloutsig_1_0z);
  assign celloutsig_0_2z = ~(in_data[7] | celloutsig_0_0z);
  assign celloutsig_0_27z = ~(celloutsig_0_6z | celloutsig_0_15z[0]);
  assign celloutsig_0_32z = ~celloutsig_0_11z;
  assign celloutsig_1_0z = ~in_data[154];
  assign celloutsig_1_15z = ~celloutsig_1_6z[4];
  assign celloutsig_0_16z = ~celloutsig_0_14z;
  assign celloutsig_0_36z = ~(celloutsig_0_12z ^ in_data[6]);
  assign celloutsig_0_6z = ~(celloutsig_0_4z[2] ^ celloutsig_0_3z);
  assign celloutsig_1_17z = ~(celloutsig_1_2z[6] ^ _00_);
  assign celloutsig_0_10z = { celloutsig_0_1z[12:5], celloutsig_0_7z } + { celloutsig_0_1z[11:4], celloutsig_0_9z };
  assign celloutsig_0_24z = celloutsig_0_1z[16:13] + { celloutsig_0_5z[4], celloutsig_0_0z, celloutsig_0_12z, celloutsig_0_0z };
  reg [7:0] _16_;
  always_ff @(negedge clkin_data[32], posedge clkin_data[64])
    if (clkin_data[64]) _16_ <= 8'h00;
    else _16_ <= { celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_9z, celloutsig_1_4z };
  assign { _01_[7:4], _00_, _01_[2:0] } = _16_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _02_ <= 4'h0;
    else _02_ <= { celloutsig_0_24z[3], celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_27z };
  assign celloutsig_0_0z = ! in_data[53:46];
  assign celloutsig_1_12z = ! { _01_[6:4], _00_, _01_[2:0] };
  assign celloutsig_0_14z = ! { celloutsig_0_1z[6:1], celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_11z };
  assign celloutsig_0_42z = { celloutsig_0_17z[0], celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_32z, celloutsig_0_8z, celloutsig_0_36z, celloutsig_0_9z } < { celloutsig_0_26z, _02_, celloutsig_0_12z, celloutsig_0_16z };
  assign celloutsig_1_4z = { celloutsig_1_1z[9:2], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z } < in_data[155:135];
  assign celloutsig_0_11z = celloutsig_0_1z[3:1] < { celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_8z };
  assign celloutsig_1_19z = { celloutsig_1_3z[5:0], celloutsig_1_8z, celloutsig_1_5z } % { 1'h1, celloutsig_1_1z[7:1], celloutsig_1_14z, _01_[7:4], _00_, _01_[2:0], celloutsig_1_14z };
  assign celloutsig_0_5z = celloutsig_0_1z[6:2] % { 1'h1, in_data[85:82] };
  assign celloutsig_1_1z = { in_data[117:108], celloutsig_1_0z } % { 1'h1, in_data[170:161] };
  assign celloutsig_1_2z = in_data[149:132] % { 1'h1, in_data[171:166], celloutsig_1_1z };
  assign celloutsig_1_8z = { celloutsig_1_1z[8], celloutsig_1_6z } % { 1'h1, celloutsig_1_6z[9:1], in_data[96] };
  assign celloutsig_0_15z = in_data[45:38] % { 1'h1, celloutsig_0_10z[4:0], celloutsig_0_12z, celloutsig_0_11z };
  assign celloutsig_0_7z = { celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_4z } != { celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_3z };
  assign celloutsig_1_13z = { celloutsig_1_9z[4:1], celloutsig_1_12z, celloutsig_1_1z } != { celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_9z };
  assign celloutsig_0_3z = in_data[37] != celloutsig_0_2z;
  assign celloutsig_0_4z = ~ { in_data[47:43], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_63z = ~ { in_data[24:8], celloutsig_0_42z };
  assign celloutsig_1_3z = ~ { in_data[132:131], celloutsig_1_2z };
  assign celloutsig_0_19z = ~ { celloutsig_0_1z[5:3], celloutsig_0_5z, celloutsig_0_14z };
  assign celloutsig_1_6z = { celloutsig_1_3z[9:2], celloutsig_1_0z, celloutsig_1_5z } | celloutsig_1_2z[11:2];
  assign celloutsig_1_5z = | in_data[177:166];
  assign celloutsig_0_9z = | { in_data[88:76], celloutsig_0_3z, celloutsig_0_6z };
  assign celloutsig_0_12z = | { celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_8z };
  assign celloutsig_1_14z = ~^ celloutsig_1_3z[10:7];
  assign celloutsig_0_26z = ~^ { celloutsig_0_20z[9:7], celloutsig_0_0z };
  assign celloutsig_0_17z = celloutsig_0_15z[4:1] >> { celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_9z, celloutsig_0_14z };
  assign celloutsig_1_9z = in_data[134:130] << { in_data[168:167], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_16z = celloutsig_1_1z[7:0] << celloutsig_1_3z[16:9];
  assign celloutsig_1_18z = { celloutsig_1_3z[18:3], celloutsig_1_5z, celloutsig_1_16z, celloutsig_1_6z, celloutsig_1_7z } << { celloutsig_1_8z[8:6], celloutsig_1_9z, celloutsig_1_5z, celloutsig_1_14z, celloutsig_1_15z, celloutsig_1_8z, celloutsig_1_13z, celloutsig_1_16z, celloutsig_1_4z, celloutsig_1_13z, celloutsig_1_14z, celloutsig_1_14z, celloutsig_1_17z };
  assign celloutsig_0_1z = in_data[29:13] ~^ { in_data[39:26], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_8z = ~((celloutsig_0_3z & celloutsig_0_4z[2]) | (celloutsig_0_0z & in_data[80]));
  assign celloutsig_0_20z[9:1] = { celloutsig_0_19z[7:0], celloutsig_0_8z } ~^ { celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_4z };
  assign _01_[3] = _00_;
  assign celloutsig_0_20z[0] = 1'h1;
  assign { out_data[159:128], out_data[113:96], out_data[32], out_data[17:0] } = { celloutsig_1_18z[31:0], celloutsig_1_19z, celloutsig_0_32z, celloutsig_0_63z };
endmodule
