/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [30:0] _00_;
  wire celloutsig_0_10z;
  wire [11:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [5:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire [5:0] celloutsig_0_1z;
  wire [7:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [6:0] celloutsig_0_23z;
  wire [17:0] celloutsig_0_24z;
  wire [5:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [5:0] celloutsig_0_27z;
  wire [4:0] celloutsig_0_28z;
  wire [3:0] celloutsig_0_29z;
  wire [37:0] celloutsig_0_2z;
  wire [8:0] celloutsig_0_30z;
  wire [6:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [30:0] celloutsig_0_33z;
  wire [2:0] celloutsig_0_34z;
  wire [15:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [4:0] celloutsig_0_38z;
  wire [8:0] celloutsig_0_39z;
  wire [3:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire [6:0] celloutsig_0_43z;
  wire [7:0] celloutsig_0_44z;
  wire [2:0] celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [8:0] celloutsig_0_4z;
  wire celloutsig_0_56z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_0_64z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [5:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [10:0] celloutsig_1_0z;
  wire [8:0] celloutsig_1_10z;
  wire [13:0] celloutsig_1_13z;
  wire [7:0] celloutsig_1_18z;
  wire [3:0] celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire [50:0] celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_64z = celloutsig_0_2z[7] ? celloutsig_0_16z : celloutsig_0_56z;
  assign celloutsig_0_16z = ~(celloutsig_0_11z[6] | celloutsig_0_3z[3]);
  assign celloutsig_0_19z = ~(celloutsig_0_2z[26] | celloutsig_0_4z[1]);
  assign celloutsig_0_9z = ~((celloutsig_0_5z[4] | in_data[8]) & (celloutsig_0_3z[2] | 1'h1));
  assign celloutsig_0_33z = { celloutsig_0_31z[1], _00_[29:24], celloutsig_0_20z[7:1], celloutsig_0_14z[0], celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_28z, celloutsig_0_4z } + { celloutsig_0_11z[8:5], celloutsig_0_29z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_22z, celloutsig_0_10z };
  assign celloutsig_1_10z = in_data[148:140] + in_data[133:125];
  assign celloutsig_0_30z = { in_data[63:57], celloutsig_0_10z, celloutsig_0_26z } + { celloutsig_0_8z[5:3], celloutsig_0_5z, celloutsig_0_22z };
  reg [3:0] _08_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[32])
    if (clkin_data[32]) _08_ <= 4'h0;
    else _08_ <= celloutsig_0_39z[7:4];
  assign out_data[35:32] = _08_;
  reg [5:0] _09_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _09_ <= 6'h00;
    else _09_ <= { celloutsig_0_2z[6:3], celloutsig_0_17z, celloutsig_0_15z };
  assign _00_[29:24] = _09_;
  assign celloutsig_0_34z = celloutsig_0_33z[25:23] & { celloutsig_0_14z[1], celloutsig_0_32z, celloutsig_0_19z };
  assign celloutsig_0_3z = celloutsig_0_1z[4:1] & celloutsig_0_2z[6:3];
  assign celloutsig_0_38z = { celloutsig_0_29z[3:1], celloutsig_0_32z, celloutsig_0_15z } & { celloutsig_0_30z[4:1], celloutsig_0_17z };
  assign celloutsig_0_45z = celloutsig_0_30z[8:6] & { celloutsig_0_36z, celloutsig_0_12z, celloutsig_0_6z };
  assign celloutsig_0_14z = celloutsig_0_1z & { celloutsig_0_3z[2:1], celloutsig_0_3z };
  assign celloutsig_0_23z = { celloutsig_0_1z[4:3], celloutsig_0_5z } & { celloutsig_0_19z, celloutsig_0_22z, celloutsig_0_5z };
  assign celloutsig_1_1z = in_data[130:127] / { 1'h1, celloutsig_1_0z[6:4] };
  assign celloutsig_0_36z = celloutsig_0_4z[8:3] == { celloutsig_0_20z[5:1], celloutsig_0_21z };
  assign celloutsig_0_12z = { celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_8z } == { celloutsig_0_2z[9:3], celloutsig_0_7z };
  assign celloutsig_0_40z = { celloutsig_0_23z[3:0], celloutsig_0_7z, celloutsig_0_36z, celloutsig_0_19z, celloutsig_0_36z, celloutsig_0_3z } > { celloutsig_0_2z[35], celloutsig_0_17z, celloutsig_0_7z, celloutsig_0_30z };
  assign celloutsig_0_47z = { celloutsig_0_24z[7:2], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_17z, celloutsig_0_46z, celloutsig_0_1z, celloutsig_0_31z, celloutsig_0_36z, celloutsig_0_46z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_44z, celloutsig_0_31z, celloutsig_0_6z, celloutsig_0_45z } > { celloutsig_0_33z[27:15], celloutsig_0_43z, celloutsig_0_16z, celloutsig_0_27z, celloutsig_0_45z, celloutsig_0_33z, celloutsig_0_15z, celloutsig_0_34z, celloutsig_0_17z };
  assign celloutsig_0_22z = { celloutsig_0_5z[4:3], celloutsig_0_5z, celloutsig_0_21z, celloutsig_0_16z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_14z } > celloutsig_0_2z[33:6];
  assign celloutsig_0_46z = { celloutsig_0_14z[2], celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_39z, celloutsig_0_42z } < { celloutsig_0_2z[24:18], celloutsig_0_39z, celloutsig_0_40z };
  assign celloutsig_0_56z = { celloutsig_0_22z, celloutsig_0_19z, _00_[29:24] } < { 1'h1, celloutsig_0_13z, celloutsig_0_47z, celloutsig_0_38z };
  assign celloutsig_1_4z = celloutsig_1_0z[3:0] < celloutsig_1_1z;
  assign celloutsig_0_7z = celloutsig_0_2z[19:10] < { celloutsig_0_2z[17:9], celloutsig_0_6z };
  assign celloutsig_0_35z = { celloutsig_0_4z[6:4], celloutsig_0_8z, celloutsig_0_32z, celloutsig_0_14z } % { 1'h1, celloutsig_0_2z[23:18], celloutsig_0_23z, celloutsig_0_15z, 1'h1 };
  assign celloutsig_0_11z = { celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_9z } % { 1'h1, celloutsig_0_4z[4:1], celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_7z };
  assign celloutsig_0_29z = { celloutsig_0_11z[5:4], celloutsig_0_6z, celloutsig_0_26z } % { 1'h1, in_data[32:31], celloutsig_0_16z };
  assign celloutsig_0_31z = celloutsig_0_17z ? { celloutsig_0_1z[3], celloutsig_0_1z } : celloutsig_0_2z[11:5];
  assign celloutsig_0_39z = celloutsig_0_14z[2] ? { celloutsig_0_2z[14:7], celloutsig_0_19z } : in_data[91:83];
  assign celloutsig_0_5z = celloutsig_0_4z[7] ? celloutsig_0_2z[30:26] : in_data[39:35];
  assign celloutsig_1_0z = in_data[122] ? in_data[170:160] : in_data[147:137];
  assign celloutsig_0_1z = in_data[26] ? { in_data[32:28], 1'h1 } : in_data[52:47];
  assign celloutsig_0_24z = celloutsig_0_19z ? { celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_16z, celloutsig_0_5z, celloutsig_0_12z } : { celloutsig_0_23z[4], celloutsig_0_5z, 1'h0, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_21z, celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_9z };
  assign celloutsig_0_2z = celloutsig_0_1z[1] ? { in_data[84:66], celloutsig_0_1z[5:2], 1'h1, celloutsig_0_1z[0], celloutsig_0_1z[5:2], 1'h1, celloutsig_0_1z[0], celloutsig_0_1z[5:2], 1'h1, celloutsig_0_1z[0], 1'h1 } : in_data[65:28];
  assign celloutsig_0_28z = _00_[29] ? { celloutsig_0_5z[4:1], celloutsig_0_7z } : { celloutsig_0_16z, celloutsig_0_3z };
  assign celloutsig_0_25z = - celloutsig_0_24z[11:6];
  assign celloutsig_0_6z = in_data[27:22] !== celloutsig_0_4z[5:0];
  assign celloutsig_0_13z = celloutsig_0_1z[4:0] !== { celloutsig_0_11z[11:10], celloutsig_0_7z, 2'h3 };
  assign celloutsig_0_15z = celloutsig_0_14z[2:0] !== { celloutsig_0_11z[3:2], celloutsig_0_10z };
  assign celloutsig_0_10z = & celloutsig_0_4z[7:2];
  assign celloutsig_0_32z = | { celloutsig_0_27z[3:0], celloutsig_0_21z, celloutsig_0_13z };
  assign celloutsig_0_42z = | { celloutsig_0_35z[11:7], celloutsig_0_19z, celloutsig_0_7z, celloutsig_0_6z };
  assign celloutsig_0_17z = | { celloutsig_0_15z, celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_4z[4] };
  assign celloutsig_0_4z = { celloutsig_0_2z[31:27], celloutsig_0_3z } >> { celloutsig_0_2z[4:2], celloutsig_0_1z };
  assign celloutsig_0_44z = { celloutsig_0_11z[6:5], celloutsig_0_42z, celloutsig_0_38z } << { in_data[41], celloutsig_0_16z, celloutsig_0_14z };
  assign celloutsig_1_19z = celloutsig_1_10z[3:0] << celloutsig_1_13z[12:9];
  assign celloutsig_0_8z = celloutsig_0_4z[6:1] << celloutsig_0_1z;
  assign celloutsig_0_43z = { celloutsig_0_31z[4:3], celloutsig_0_29z, celloutsig_0_10z } - { celloutsig_0_34z, celloutsig_0_29z };
  assign celloutsig_1_13z = { in_data[146:144], celloutsig_1_0z } - { celloutsig_1_2z[42:30], celloutsig_1_5z };
  assign celloutsig_0_27z = celloutsig_0_25z - in_data[29:24];
  assign celloutsig_1_2z = in_data[173:123] ^ { in_data[116:99], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_18z = { celloutsig_1_10z[6:0], celloutsig_1_5z } ^ celloutsig_1_10z[7:0];
  assign celloutsig_1_5z = ~((in_data[129] & celloutsig_1_0z[2]) | celloutsig_1_4z);
  assign celloutsig_0_21z = ~((1'h1 & celloutsig_0_19z) | celloutsig_0_13z);
  assign celloutsig_0_26z = ~((celloutsig_0_8z[1] & 1'h1) | celloutsig_0_9z);
  assign { celloutsig_0_20z[6:1], celloutsig_0_20z[7] } = { celloutsig_0_15z, celloutsig_0_14z[5:1], celloutsig_0_11z[6] } & { in_data[68:64], celloutsig_0_6z, in_data[69] };
  assign { _00_[30], _00_[23:0] } = { celloutsig_0_31z[1], celloutsig_0_20z[7:1], celloutsig_0_14z[0], celloutsig_0_6z, celloutsig_0_15z, celloutsig_0_28z, celloutsig_0_4z };
  assign celloutsig_0_20z[0] = celloutsig_0_14z[0];
  assign { out_data[135:128], out_data[99:96], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_64z };
endmodule
