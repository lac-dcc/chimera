/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [7:0] _01_;
  wire [2:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [15:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [5:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [7:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [8:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire celloutsig_0_47z;
  wire celloutsig_0_4z;
  wire celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [3:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [3:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [6:0] celloutsig_1_13z;
  wire celloutsig_1_17z;
  wire [2:0] celloutsig_1_18z;
  wire [3:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [9:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [1:0] _03_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[32])
    if (!clkin_data[32]) _03_ <= 2'h0;
    else _03_ <= celloutsig_0_7z[2:1];
  assign _02_[2:1] = _03_;
  assign celloutsig_0_22z = celloutsig_0_16z[2] ? celloutsig_0_20z : celloutsig_0_5z;
  assign celloutsig_0_23z = ~(_00_ & celloutsig_0_14z);
  assign celloutsig_1_12z = !(celloutsig_1_9z ? in_data[109] : celloutsig_1_10z);
  assign celloutsig_1_10z = ~((celloutsig_1_7z | celloutsig_1_4z) & (celloutsig_1_9z | in_data[173]));
  assign celloutsig_0_30z = ~((celloutsig_0_20z | celloutsig_0_8z) & (celloutsig_0_18z[1] | celloutsig_0_1z[6]));
  assign celloutsig_0_41z = celloutsig_0_5z | ~(celloutsig_0_6z);
  assign celloutsig_0_10z = in_data[22] | ~(celloutsig_0_9z);
  assign celloutsig_0_3z = celloutsig_0_0z | ~(celloutsig_0_1z[2]);
  assign celloutsig_0_0z = in_data[63] | in_data[20];
  assign celloutsig_0_36z = celloutsig_0_28z | celloutsig_0_9z;
  assign celloutsig_0_37z = celloutsig_0_14z | celloutsig_0_2z;
  assign celloutsig_0_56z = celloutsig_0_45z | celloutsig_0_47z;
  assign celloutsig_1_7z = celloutsig_1_4z | celloutsig_1_5z;
  assign celloutsig_0_28z = celloutsig_0_22z | celloutsig_0_10z;
  assign celloutsig_0_55z = celloutsig_0_47z ^ celloutsig_0_34z;
  assign celloutsig_1_1z = in_data[103] ^ in_data[143];
  assign celloutsig_0_20z = celloutsig_0_19z ^ celloutsig_0_15z;
  assign celloutsig_0_32z = ~(celloutsig_0_27z ^ celloutsig_0_4z);
  assign celloutsig_0_34z = ~(celloutsig_0_6z ^ celloutsig_0_19z);
  assign celloutsig_1_9z = ~(celloutsig_1_3z ^ celloutsig_1_5z);
  assign celloutsig_1_13z = { celloutsig_1_2z[3:2], celloutsig_1_3z, celloutsig_1_0z } + { celloutsig_1_11z, celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_11z };
  reg [7:0] _25_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _25_ <= 8'h00;
    else _25_ <= { in_data[36:31], celloutsig_0_4z, celloutsig_0_8z };
  assign { _00_, _01_[6], celloutsig_0_40z[5], _01_[4:0] } = _25_;
  assign celloutsig_0_47z = { celloutsig_0_39z[6:2], celloutsig_0_25z, celloutsig_0_32z, celloutsig_0_41z, 1'h0, celloutsig_0_36z, celloutsig_0_36z, celloutsig_0_27z, celloutsig_0_15z, celloutsig_0_4z, 1'h0, celloutsig_0_11z, celloutsig_0_42z, celloutsig_0_24z, celloutsig_0_24z } <= { celloutsig_0_39z[6:2], celloutsig_0_22z, celloutsig_0_42z, celloutsig_0_19z, celloutsig_0_22z, _00_, _01_[6], celloutsig_0_40z[5], _01_[4:0], celloutsig_0_37z, celloutsig_0_23z };
  assign celloutsig_1_3z = celloutsig_1_0z <= celloutsig_1_0z;
  assign celloutsig_1_4z = { in_data[111:108], celloutsig_1_1z, celloutsig_1_1z } <= { celloutsig_1_0z[0], celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_9z = { celloutsig_0_7z[2:1], 1'h0, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_2z } <= { celloutsig_0_7z[2:1], celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_14z = { celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_2z } || celloutsig_0_1z[15:13];
  assign celloutsig_0_15z = { _00_, _01_[6], celloutsig_0_40z[5], _01_[4:2], celloutsig_0_8z } || { _01_[6], celloutsig_0_40z[5], _01_[4:2], celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_27z = { celloutsig_0_1z[7:5], celloutsig_0_25z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_23z, celloutsig_0_24z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_22z, _02_[2:1], celloutsig_0_3z } || { celloutsig_0_1z[14:0], celloutsig_0_7z[3:1] };
  assign celloutsig_0_4z = celloutsig_0_1z[12:10] < { in_data[83:82], celloutsig_0_2z };
  assign celloutsig_0_43z = { in_data[50:47], celloutsig_0_20z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_32z } < { celloutsig_0_39z[6:2], celloutsig_0_30z, celloutsig_0_42z, celloutsig_0_0z };
  assign celloutsig_0_6z = in_data[20:9] < { celloutsig_0_1z[10:1], celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_8z = { in_data[28], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_0z } < { celloutsig_0_1z[12:10], celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_0_25z = { in_data[73], celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_24z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_9z } < { _00_, _01_[6], celloutsig_0_40z[5], _01_[4], celloutsig_0_19z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_8z };
  assign celloutsig_1_0z = in_data[137:134] * in_data[111:108];
  assign celloutsig_0_45z = { celloutsig_0_27z, celloutsig_0_19z, celloutsig_0_43z, celloutsig_0_14z, celloutsig_0_34z, 1'h0, celloutsig_0_39z } != in_data[94:81];
  assign celloutsig_1_11z = in_data[178:147] !== { in_data[156:136], celloutsig_1_2z, celloutsig_1_7z };
  assign celloutsig_1_19z = { celloutsig_1_3z, celloutsig_1_18z } | { celloutsig_1_4z, celloutsig_1_12z, celloutsig_1_7z, celloutsig_1_17z };
  assign celloutsig_0_1z = { in_data[31:17], celloutsig_0_0z } | in_data[83:68];
  assign celloutsig_0_5z = & { celloutsig_0_4z, in_data[64:60] };
  assign celloutsig_0_2z = | in_data[49:47];
  assign celloutsig_0_24z = | { celloutsig_0_19z, celloutsig_0_18z, celloutsig_0_16z[0] };
  assign celloutsig_0_42z = ^ { celloutsig_0_24z, celloutsig_0_40z, celloutsig_0_9z, celloutsig_0_16z[2], celloutsig_0_1z[6], celloutsig_0_16z[0], celloutsig_0_23z, celloutsig_0_14z };
  assign celloutsig_1_5z = ^ in_data[156:151];
  assign celloutsig_1_17z = ^ { celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_13z };
  assign celloutsig_1_18z = { celloutsig_1_2z[0], celloutsig_1_5z, celloutsig_1_17z } >> { celloutsig_1_5z, celloutsig_1_3z, celloutsig_1_17z };
  assign celloutsig_0_39z = { celloutsig_0_24z, celloutsig_0_9z, celloutsig_0_20z, celloutsig_0_28z, celloutsig_0_7z[3:1], 1'h0 } - { celloutsig_0_19z, celloutsig_0_19z, celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_19z, celloutsig_0_8z, celloutsig_0_14z };
  assign celloutsig_0_18z = { celloutsig_0_15z, celloutsig_0_9z, 1'h0, celloutsig_0_2z } - celloutsig_0_1z[15:12];
  assign celloutsig_1_2z = in_data[170:161] ~^ { in_data[173:165], celloutsig_1_1z };
  assign celloutsig_0_11z = ~((celloutsig_0_7z[1] & celloutsig_0_4z) | 1'h0);
  assign celloutsig_0_19z = ~((celloutsig_0_18z[0] & celloutsig_0_6z) | celloutsig_0_0z);
  assign celloutsig_0_7z[3:1] = celloutsig_0_1z[9:7] ^ celloutsig_0_1z[10:8];
  assign { celloutsig_0_16z[0], celloutsig_0_16z[2] } = { celloutsig_0_15z, _01_[1] } ^ { celloutsig_0_1z[5], celloutsig_0_1z[7] };
  assign { celloutsig_0_40z[8:6], celloutsig_0_40z[4:0] } = { celloutsig_0_29z[3], _00_, _01_[6], _01_[4:0] } ^ { celloutsig_0_25z, celloutsig_0_27z, celloutsig_0_5z, celloutsig_0_32z, celloutsig_0_20z, celloutsig_0_27z, celloutsig_0_6z, celloutsig_0_22z };
  assign { celloutsig_0_29z[2], celloutsig_0_29z[3], celloutsig_0_29z[5:4] } = { _02_[2], celloutsig_0_11z, celloutsig_0_7z[2:1] } ~^ { _02_[1], _02_[2], celloutsig_0_0z, celloutsig_0_8z };
  assign { _01_[7], _01_[5] } = { _00_, celloutsig_0_40z[5] };
  assign _02_[0] = 1'h0;
  assign celloutsig_0_16z[1] = celloutsig_0_1z[6];
  assign celloutsig_0_7z[0] = 1'h0;
  assign { out_data[130:128], out_data[99:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_55z, celloutsig_0_56z };
endmodule
