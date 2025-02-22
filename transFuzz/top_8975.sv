/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [4:0] _03_;
  wire [10:0] _04_;
  wire [2:0] _05_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [20:0] celloutsig_0_11z;
  wire [4:0] celloutsig_0_12z;
  wire [2:0] celloutsig_0_14z;
  wire [3:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [8:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [4:0] celloutsig_0_20z;
  wire [6:0] celloutsig_0_21z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [2:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [10:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [19:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [7:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [4:0] celloutsig_0_36z;
  wire [3:0] celloutsig_0_37z;
  wire [7:0] celloutsig_0_38z;
  wire [5:0] celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire [4:0] celloutsig_0_49z;
  wire celloutsig_0_53z;
  wire [7:0] celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_5z;
  wire [5:0] celloutsig_0_61z;
  wire celloutsig_0_63z;
  wire [2:0] celloutsig_0_66z;
  wire [3:0] celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire [4:0] celloutsig_0_74z;
  wire [5:0] celloutsig_0_75z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [14:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [5:0] celloutsig_1_14z;
  wire [6:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [18:0] celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [7:0] celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [10:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_32z = celloutsig_0_1z ? celloutsig_0_28z : celloutsig_0_1z;
  assign celloutsig_0_41z = in_data[65] ? celloutsig_0_19z : celloutsig_0_34z;
  assign celloutsig_0_53z = celloutsig_0_8z ? celloutsig_0_23z : celloutsig_0_30z[8];
  assign celloutsig_0_55z = celloutsig_0_30z[14] ? celloutsig_0_37z[0] : _00_;
  assign celloutsig_0_70z = celloutsig_0_5z ? celloutsig_0_5z : celloutsig_0_66z[2];
  assign celloutsig_1_6z = celloutsig_1_5z[1] ? in_data[98] : celloutsig_1_5z[0];
  assign celloutsig_0_9z = celloutsig_0_0z ? celloutsig_0_8z : celloutsig_0_3z[0];
  assign celloutsig_1_17z = celloutsig_1_2z ? celloutsig_1_15z[4] : celloutsig_1_7z;
  assign celloutsig_0_43z = celloutsig_0_41z ^ celloutsig_0_20z[2];
  assign celloutsig_0_63z = celloutsig_0_53z ^ celloutsig_0_54z[7];
  assign celloutsig_0_10z = celloutsig_0_3z[4] ^ celloutsig_0_5z;
  assign celloutsig_0_16z = celloutsig_0_2z ^ celloutsig_0_6z[2];
  assign celloutsig_0_27z = celloutsig_0_24z ^ celloutsig_0_15z[2];
  assign celloutsig_0_36z = { celloutsig_0_30z[7:5], celloutsig_0_26z, celloutsig_0_10z } + { celloutsig_0_11z[20:17], celloutsig_0_31z };
  assign celloutsig_0_49z = celloutsig_0_33z[7:3] + celloutsig_0_18z[8:4];
  assign celloutsig_0_21z = { celloutsig_0_15z[3], celloutsig_0_3z } + { celloutsig_0_15z[3:2], celloutsig_0_1z, celloutsig_0_6z[3:2], celloutsig_0_6z[2], celloutsig_0_6z[0] };
  assign celloutsig_0_25z = { celloutsig_0_6z[2], celloutsig_0_6z[0], celloutsig_0_19z } + celloutsig_0_18z[3:1];
  reg [4:0] _23_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[0])
    if (clkin_data[0]) _23_ <= 5'h00;
    else _23_ <= { celloutsig_0_3z[1:0], celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_2z };
  assign { _01_, _03_[3:0] } = _23_;
  reg [10:0] _24_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[0])
    if (!clkin_data[0]) _24_ <= 11'h000;
    else _24_ <= { celloutsig_0_6z[3:2], celloutsig_0_6z[2], celloutsig_0_6z[0], celloutsig_0_8z, _01_, _03_[3:0], celloutsig_0_10z };
  assign { _04_[10:9], _02_, _04_[7:0] } = _24_;
  reg [2:0] _25_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[0])
    if (!clkin_data[0]) _25_ <= 3'h0;
    else _25_ <= celloutsig_0_20z[2:0];
  assign { _05_[2], _00_, _05_[0] } = _25_;
  assign celloutsig_1_0z = in_data[104:96] === in_data[184:176];
  assign celloutsig_0_8z = in_data[45:43] === { _01_, _03_[3:2] };
  assign celloutsig_1_18z = { celloutsig_1_10z[12:9], celloutsig_1_4z } === { celloutsig_1_0z, celloutsig_1_15z, celloutsig_1_1z };
  assign celloutsig_0_17z = { _03_[3:0], _04_[10:9], _02_, _04_[7:0], celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_2z, celloutsig_0_6z[3:2], celloutsig_0_6z[2], celloutsig_0_6z[0], celloutsig_0_0z, _04_[10:9], _02_, _04_[7:0], celloutsig_0_0z, celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_16z } === { celloutsig_0_12z[3:2], celloutsig_0_12z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_9z };
  assign celloutsig_0_19z = { celloutsig_0_6z[3], celloutsig_0_16z, celloutsig_0_9z } === { _04_[3:2], celloutsig_0_5z };
  assign celloutsig_0_24z = { celloutsig_0_11z[15:14], celloutsig_0_1z, _01_, _03_[3:0], celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_23z, celloutsig_0_1z } === { celloutsig_0_5z, _04_[10:9], _02_, _04_[7:0] };
  assign celloutsig_0_26z = { celloutsig_0_18z[5:1], celloutsig_0_15z, celloutsig_0_3z, celloutsig_0_16z } === { celloutsig_0_21z[4:0], _05_[2], _00_, _05_[0], celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_17z, celloutsig_0_12z };
  assign celloutsig_0_35z = { celloutsig_0_29z[5:3], celloutsig_0_10z } > { celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_34z, celloutsig_0_27z };
  assign celloutsig_1_2z = { in_data[166:158], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_1z } > { in_data[167:154], celloutsig_1_1z };
  assign celloutsig_1_8z = { in_data[182:174], celloutsig_1_1z } > { celloutsig_1_4z[1], celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_1_11z = celloutsig_1_10z[13:11] > celloutsig_1_4z[2:0];
  assign celloutsig_0_23z = celloutsig_0_11z[16:3] > { celloutsig_0_6z[3:2], _05_[2], _00_, _05_[0], celloutsig_0_18z };
  assign celloutsig_0_1z = celloutsig_0_0z & ~(celloutsig_0_0z);
  assign celloutsig_0_5z = celloutsig_0_3z[4] & ~(celloutsig_0_3z[2]);
  assign celloutsig_1_3z = celloutsig_1_2z & ~(celloutsig_1_1z[2]);
  assign celloutsig_1_7z = celloutsig_1_3z & ~(in_data[106]);
  assign celloutsig_0_2z = celloutsig_0_0z & ~(in_data[75]);
  assign celloutsig_1_9z = in_data[167] ? { in_data[120:111], celloutsig_1_2z } : { celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_4z };
  assign celloutsig_1_10z = celloutsig_1_0z ? { in_data[111:105], celloutsig_1_4z } : { celloutsig_1_9z[4:1], 1'h0, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_1_14z = celloutsig_1_1z[1] ? celloutsig_1_9z[6:1] : { celloutsig_1_10z[9:8], celloutsig_1_1z[3:2], 1'h0, celloutsig_1_1z[0] };
  assign celloutsig_0_15z = celloutsig_0_12z[3] ? { celloutsig_0_14z, celloutsig_0_5z } : { _01_, _03_[3:2], celloutsig_0_10z };
  assign celloutsig_0_29z = celloutsig_0_10z ? { celloutsig_0_18z[3:1], celloutsig_0_21z, 1'h1 } : { celloutsig_0_20z[3:1], celloutsig_0_6z[3:2], celloutsig_0_6z[2], celloutsig_0_6z[0], celloutsig_0_17z, celloutsig_0_16z, celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_0z = ^ in_data[28:20];
  assign celloutsig_0_31z = ^ { _03_[2:1], celloutsig_0_23z, celloutsig_0_5z, celloutsig_0_20z, celloutsig_0_26z, celloutsig_0_14z, celloutsig_0_17z };
  assign celloutsig_0_34z = ^ { celloutsig_0_17z, celloutsig_0_11z, celloutsig_0_24z };
  assign celloutsig_0_28z = ^ celloutsig_0_12z[3:1];
  assign celloutsig_0_74z = { celloutsig_0_15z, celloutsig_0_2z } >> celloutsig_0_61z[5:1];
  assign celloutsig_1_4z = in_data[173:166] >> { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_14z = _03_[2:0] >> _03_[3:1];
  assign celloutsig_0_3z = { in_data[48:46], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z } >> { in_data[48:45], celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_37z = { celloutsig_0_3z[3], _05_[2], _00_, _05_[0] } <<< { in_data[23], celloutsig_0_1z, celloutsig_0_28z, celloutsig_0_34z };
  assign celloutsig_0_54z = { in_data[80:74], celloutsig_0_32z } <<< celloutsig_0_38z;
  assign celloutsig_1_5z = { celloutsig_1_2z, celloutsig_1_4z } <<< { celloutsig_1_4z[5:1], celloutsig_1_1z };
  assign celloutsig_1_15z = celloutsig_1_10z[6:0] <<< { in_data[165:161], celloutsig_1_6z, celloutsig_1_8z };
  assign celloutsig_0_11z = { _01_, _03_[3:0], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_1z, _01_, _03_[3:0], celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_6z[3:2], celloutsig_0_6z[2], celloutsig_0_6z[0] } <<< { in_data[67:57], celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_1z, _01_, _03_[3:0] };
  assign celloutsig_0_38z = { celloutsig_0_30z[10], celloutsig_0_20z, celloutsig_0_19z, celloutsig_0_27z } >>> { celloutsig_0_33z[5], celloutsig_0_24z, celloutsig_0_27z, celloutsig_0_35z, celloutsig_0_25z, celloutsig_0_0z };
  assign celloutsig_0_61z = { celloutsig_0_36z[3:2], celloutsig_0_14z, celloutsig_0_28z } >>> { celloutsig_0_6z[2], _01_, _03_[3:0] };
  assign celloutsig_0_66z = { celloutsig_0_6z[0], celloutsig_0_63z, celloutsig_0_55z } >>> { celloutsig_0_20z[3], celloutsig_0_16z, celloutsig_0_43z };
  assign celloutsig_0_75z = { celloutsig_0_70z, _01_, _03_[3:0] } >>> { celloutsig_0_37z[0], celloutsig_0_49z };
  assign celloutsig_1_1z = in_data[140:137] >>> { in_data[111], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_19z = { celloutsig_1_4z[5:3], celloutsig_1_17z, celloutsig_1_14z, celloutsig_1_7z, celloutsig_1_4z } >>> { celloutsig_1_9z[6:5], celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_7z, celloutsig_1_18z, celloutsig_1_9z, celloutsig_1_3z, celloutsig_1_11z };
  assign celloutsig_0_12z = celloutsig_0_3z[4:0] >>> celloutsig_0_11z[14:10];
  assign celloutsig_0_18z = { celloutsig_0_3z[4:1], celloutsig_0_12z } >>> { celloutsig_0_11z[5], celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_8z };
  assign celloutsig_0_20z = celloutsig_0_18z[5:1] >>> in_data[26:22];
  assign celloutsig_0_30z = { celloutsig_0_14z[2], celloutsig_0_23z, celloutsig_0_2z, celloutsig_0_27z, celloutsig_0_29z, celloutsig_0_20z } >>> { celloutsig_0_6z[3:2], celloutsig_0_6z[2], celloutsig_0_14z, _05_[2], _00_, _05_[0], _01_, _03_[3:0], celloutsig_0_3z };
  assign { celloutsig_0_6z[2], celloutsig_0_6z[3], celloutsig_0_6z[0] } = ~ { celloutsig_0_5z, in_data[31], celloutsig_0_0z };
  assign { celloutsig_0_33z[2], celloutsig_0_33z[3], celloutsig_0_33z[0], celloutsig_0_33z[6:4], celloutsig_0_33z[7] } = ~ { celloutsig_0_6z[2], celloutsig_0_6z[3], celloutsig_0_6z[0], celloutsig_0_32z, celloutsig_0_17z, celloutsig_0_16z, celloutsig_0_11z[5] };
  assign _03_[4] = _01_;
  assign _04_[8] = _02_;
  assign _05_[1] = _00_;
  assign celloutsig_0_33z[1] = celloutsig_0_33z[2];
  assign celloutsig_0_6z[1] = celloutsig_0_6z[2];
  assign { out_data[128], out_data[114:96], out_data[36:32], out_data[5:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_74z, celloutsig_0_75z };
endmodule
