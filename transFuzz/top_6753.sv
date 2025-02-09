/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [30:0] _01_;
  wire [30:0] _02_;
  wire [5:0] _03_;
  wire [2:0] _04_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [22:0] celloutsig_0_11z;
  wire [6:0] celloutsig_0_12z;
  wire celloutsig_0_15z;
  wire [8:0] celloutsig_0_16z;
  wire [7:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire [2:0] celloutsig_0_20z;
  wire [4:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [5:0] celloutsig_0_25z;
  wire [13:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_35z;
  wire [14:0] celloutsig_0_36z;
  wire celloutsig_0_38z;
  wire [16:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire [4:0] celloutsig_0_43z;
  wire celloutsig_0_46z;
  wire [5:0] celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire [16:0] celloutsig_0_5z;
  wire [30:0] celloutsig_0_62z;
  wire celloutsig_0_63z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [5:0] celloutsig_0_8z;
  wire [3:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire [4:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [5:0] celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  reg [1:0] _05_;
  always_ff @(negedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _05_ <= 2'h0;
    else _05_ <= { celloutsig_1_4z, celloutsig_1_1z };
  assign { _04_[2], _04_[0] } = _05_;
  assign celloutsig_0_38z = celloutsig_0_10z ? celloutsig_0_6z : celloutsig_0_10z;
  assign celloutsig_1_5z = celloutsig_1_0z ? in_data[170] : 1'h0;
  assign celloutsig_0_35z = ~(in_data[94] | celloutsig_0_20z[2]);
  assign celloutsig_0_0z = ~((in_data[7] | in_data[74]) & (in_data[35] | in_data[40]));
  assign celloutsig_0_15z = ~((celloutsig_0_9z[0] | celloutsig_0_11z[15]) & (celloutsig_0_5z[9] | celloutsig_0_3z));
  assign celloutsig_0_28z = ~((celloutsig_0_18z[4] | celloutsig_0_11z[17]) & (celloutsig_0_2z | _00_));
  assign celloutsig_1_18z = celloutsig_1_5z | in_data[102];
  assign celloutsig_0_46z = ~(celloutsig_0_43z[0] ^ celloutsig_0_40z);
  assign celloutsig_0_7z = ~(celloutsig_0_6z ^ celloutsig_0_2z);
  assign celloutsig_0_62z = { celloutsig_0_39z[8:1], celloutsig_0_49z, celloutsig_0_40z, celloutsig_0_42z, celloutsig_0_8z, celloutsig_0_46z, _01_[7:4], _00_, _01_[2:0] } + { celloutsig_0_5z[14:0], _02_[15:10], celloutsig_0_6z, celloutsig_0_23z, celloutsig_0_46z, celloutsig_0_22z, celloutsig_0_0z, celloutsig_0_35z };
  reg [5:0] _16_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[128])
    if (!clkin_data[128]) _16_ <= 6'h00;
    else _16_ <= celloutsig_1_2z;
  assign { _03_[5:2], celloutsig_1_14z, _03_[0] } = _16_;
  reg [7:0] _17_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _17_ <= 8'h00;
    else _17_ <= { celloutsig_0_12z, celloutsig_0_0z };
  assign { _01_[7:4], _00_, _01_[2:0] } = _17_;
  reg [5:0] _18_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[64])
    if (!clkin_data[64]) _18_ <= 6'h00;
    else _18_ <= { celloutsig_0_18z[7:3], celloutsig_0_6z };
  assign _02_[15:10] = _18_;
  assign celloutsig_0_23z = { in_data[16:7], _02_[15:10], celloutsig_0_15z } == { celloutsig_0_18z[5:3], celloutsig_0_8z, celloutsig_0_18z };
  assign celloutsig_0_42z = ! { celloutsig_0_20z, celloutsig_0_38z, celloutsig_0_0z, celloutsig_0_28z, celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_0z };
  assign celloutsig_1_0z = ! in_data[143:136];
  assign celloutsig_1_4z = ! { in_data[150:136], celloutsig_1_1z };
  assign celloutsig_0_40z = celloutsig_0_28z & ~(celloutsig_0_7z);
  assign celloutsig_0_6z = celloutsig_0_5z[2] & ~(celloutsig_0_0z);
  assign celloutsig_0_1z = in_data[83] & ~(in_data[7]);
  assign celloutsig_0_39z = celloutsig_0_5z % { 1'h1, celloutsig_0_36z[13:12], celloutsig_0_27z };
  assign celloutsig_0_5z = { in_data[25:22], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_0z } * in_data[86:70];
  assign celloutsig_1_2z = { in_data[177:173], celloutsig_1_1z } * { in_data[170:166], celloutsig_1_1z };
  assign celloutsig_0_11z = { in_data[26:5], celloutsig_0_6z } * { in_data[36:27], celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_8z };
  assign celloutsig_0_18z = { celloutsig_0_12z, celloutsig_0_10z } * { celloutsig_0_16z[7:2], celloutsig_0_6z, celloutsig_0_4z };
  assign celloutsig_0_25z = { celloutsig_0_11z[13], celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_20z } * { _01_[7:4], _00_, _01_[2] };
  assign celloutsig_1_19z = in_data[137] ? { _03_[3:2], celloutsig_1_14z, _03_[0], celloutsig_1_14z } : { in_data[163:162], _04_[2], 1'h0, _04_[0] };
  assign celloutsig_0_20z = celloutsig_0_16z[8] ? celloutsig_0_8z[4:2] : { celloutsig_0_9z[3], celloutsig_0_15z, celloutsig_0_4z };
  assign celloutsig_0_63z = celloutsig_0_11z[21:18] != celloutsig_0_62z[4:1];
  assign celloutsig_0_2z = { in_data[68:58], celloutsig_0_1z } != { in_data[65:60], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_36z = - { celloutsig_0_5z[14:9], celloutsig_0_12z, celloutsig_0_31z, celloutsig_0_23z };
  assign celloutsig_0_43z = - { celloutsig_0_9z, celloutsig_0_38z };
  assign celloutsig_0_3z = { in_data[83:72], celloutsig_0_1z, celloutsig_0_0z } !== { in_data[23:14], celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_1_1z = in_data[159:156] !== in_data[110:107];
  assign celloutsig_0_10z = { celloutsig_0_8z[4:2], celloutsig_0_3z } !== { celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_0_31z = & celloutsig_0_18z[7:5];
  assign celloutsig_0_4z = & { celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_49z = { celloutsig_0_5z[13], celloutsig_0_22z } >> { _01_[5:4], _00_, _01_[2:0] };
  assign celloutsig_0_27z = { celloutsig_0_18z[5:2], celloutsig_0_1z, celloutsig_0_10z, _01_[7:4], _00_, _01_[2:0] } >> { celloutsig_0_6z, celloutsig_0_25z, celloutsig_0_12z };
  assign celloutsig_0_8z = { celloutsig_0_5z[14:13], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z } << celloutsig_0_5z[14:9];
  assign celloutsig_0_9z = { celloutsig_0_5z[11], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_4z } <<< { in_data[30:28], celloutsig_0_1z };
  assign celloutsig_0_16z = in_data[33:25] ~^ { celloutsig_0_5z[7:0], celloutsig_0_3z };
  assign celloutsig_0_22z = { celloutsig_0_16z[8:7], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_2z } ~^ celloutsig_0_5z[13:9];
  assign celloutsig_0_12z = in_data[27:21] ^ { celloutsig_0_9z[3:1], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_6z };
  assign { _01_[30:8], _01_[3] } = { celloutsig_0_39z[8:1], celloutsig_0_49z, celloutsig_0_40z, celloutsig_0_42z, celloutsig_0_8z, celloutsig_0_46z, _00_ };
  assign { _02_[30:16], _02_[9:0] } = { celloutsig_0_5z[14:0], celloutsig_0_6z, celloutsig_0_23z, celloutsig_0_46z, celloutsig_0_22z, celloutsig_0_0z, celloutsig_0_35z };
  assign _03_[1] = celloutsig_1_14z;
  assign _04_[1] = 1'h0;
  assign { out_data[128], out_data[100:96], out_data[62:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_62z, celloutsig_0_63z };
endmodule
