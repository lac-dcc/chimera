/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [4:0] _01_;
  wire celloutsig_0_0z;
  wire [12:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [15:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  reg [5:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [11:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [5:0] celloutsig_0_27z;
  wire [5:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [8:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire [4:0] celloutsig_0_35z;
  wire [4:0] celloutsig_0_36z;
  wire [4:0] celloutsig_0_37z;
  wire [6:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire [20:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire [10:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire [14:0] celloutsig_0_52z;
  wire [2:0] celloutsig_0_53z;
  wire celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire [2:0] celloutsig_0_57z;
  wire celloutsig_0_5z;
  wire [3:0] celloutsig_0_67z;
  wire [17:0] celloutsig_0_6z;
  reg [9:0] celloutsig_0_70z;
  wire celloutsig_0_78z;
  wire [20:0] celloutsig_0_79z;
  reg [2:0] celloutsig_0_7z;
  wire celloutsig_0_87z;
  wire [2:0] celloutsig_0_88z;
  wire celloutsig_0_8z;
  wire [4:0] celloutsig_0_9z;
  wire [5:0] celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [18:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [2:0] celloutsig_1_7z;
  wire [6:0] celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_31z = ~((celloutsig_0_15z | celloutsig_0_29z) & celloutsig_0_10z[4]);
  assign celloutsig_0_32z = ~((celloutsig_0_23z[0] | celloutsig_0_30z) & celloutsig_0_0z);
  assign celloutsig_0_3z = ~((celloutsig_0_2z[0] | celloutsig_0_2z[2]) & celloutsig_0_1z);
  assign celloutsig_0_45z = ~((celloutsig_0_19z | celloutsig_0_44z) & celloutsig_0_24z);
  assign celloutsig_0_54z = ~((celloutsig_0_39z[0] | celloutsig_0_0z) & _00_);
  assign celloutsig_0_8z = ~((celloutsig_0_3z | celloutsig_0_2z[2]) & in_data[5]);
  assign celloutsig_1_5z = ~((celloutsig_1_1z | in_data[133]) & celloutsig_1_4z);
  assign celloutsig_0_1z = ~((in_data[55] | in_data[23]) & celloutsig_0_0z);
  assign celloutsig_0_15z = ~((celloutsig_0_13z[0] | celloutsig_0_12z) & celloutsig_0_4z);
  assign celloutsig_0_17z = ~((celloutsig_0_4z | celloutsig_0_4z) & celloutsig_0_11z);
  assign celloutsig_0_21z = ~((celloutsig_0_11z | celloutsig_0_9z[0]) & celloutsig_0_8z);
  assign celloutsig_0_29z = ~((celloutsig_0_6z[2] | celloutsig_0_27z[1]) & celloutsig_0_20z);
  reg [4:0] _14_;
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[64])
    if (clkin_data[64]) _14_ <= 5'h00;
    else _14_ <= celloutsig_0_13z[4:0];
  assign { _01_[4:3], _00_, _01_[1:0] } = _14_;
  assign celloutsig_0_0z = in_data[78:67] && in_data[67:56];
  assign celloutsig_0_44z = { celloutsig_0_6z[16:0], celloutsig_0_29z } && { in_data[67:52], celloutsig_0_20z, celloutsig_0_20z };
  assign celloutsig_0_55z = celloutsig_0_36z[3:0] && { celloutsig_0_10z[7], celloutsig_0_14z };
  assign celloutsig_0_56z = { celloutsig_0_24z, celloutsig_0_20z, celloutsig_0_32z, celloutsig_0_7z } && { celloutsig_0_52z[4:2], celloutsig_0_45z, celloutsig_0_34z, celloutsig_0_43z };
  assign celloutsig_0_78z = celloutsig_0_42z[15:9] && { celloutsig_0_15z, celloutsig_0_28z };
  assign celloutsig_0_19z = { _01_[0], celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_14z, celloutsig_0_2z } && { celloutsig_0_13z[15:3], celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_5z };
  assign celloutsig_0_34z = celloutsig_0_33z & ~(celloutsig_0_26z);
  assign celloutsig_0_43z = celloutsig_0_30z & ~(celloutsig_0_20z);
  assign celloutsig_0_49z = celloutsig_0_13z[11] & ~(celloutsig_0_19z);
  assign celloutsig_0_51z = celloutsig_0_45z & ~(celloutsig_0_43z);
  assign celloutsig_0_5z = celloutsig_0_2z[3] & ~(celloutsig_0_1z);
  assign celloutsig_1_1z = in_data[96] & ~(in_data[151]);
  assign celloutsig_1_4z = celloutsig_1_0z[4] & ~(in_data[128]);
  assign celloutsig_1_19z = celloutsig_1_7z[1] & ~(celloutsig_1_4z);
  assign celloutsig_0_16z = celloutsig_0_8z & ~(celloutsig_0_0z);
  assign celloutsig_0_22z = celloutsig_0_20z & ~(celloutsig_0_16z);
  assign celloutsig_0_26z = celloutsig_0_16z & ~(celloutsig_0_12z);
  assign celloutsig_0_30z = celloutsig_0_0z & ~(celloutsig_0_3z);
  assign celloutsig_0_37z = { celloutsig_0_10z[10:7], celloutsig_0_26z } % { 1'h1, celloutsig_0_7z, celloutsig_0_24z };
  assign celloutsig_0_48z = { celloutsig_0_23z, celloutsig_0_7z, celloutsig_0_24z, celloutsig_0_22z } % { 1'h1, celloutsig_0_42z[13:8], celloutsig_0_33z, celloutsig_0_31z, celloutsig_0_29z, celloutsig_0_12z };
  assign celloutsig_1_3z = { in_data[190:174], celloutsig_1_1z, celloutsig_1_1z } % { 1'h1, in_data[151:140], celloutsig_1_0z };
  assign celloutsig_1_7z = { celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_1z } % { 1'h1, celloutsig_1_0z[0], celloutsig_1_5z };
  assign celloutsig_1_8z = in_data[182:176] % { 1'h1, celloutsig_1_3z[2:0], celloutsig_1_7z };
  assign celloutsig_0_9z = celloutsig_0_2z[5:1] % { 1'h1, in_data[26:24], celloutsig_0_8z };
  assign celloutsig_0_10z = { celloutsig_0_2z[7:1], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z } % { 1'h1, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_13z = { celloutsig_0_10z[9:0], celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_11z } % { 1'h1, celloutsig_0_6z[14:3], celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_3z };
  assign celloutsig_0_14z = { celloutsig_0_10z[11:10], celloutsig_0_11z } % { 1'h1, celloutsig_0_6z[13], celloutsig_0_1z };
  assign celloutsig_0_2z = { in_data[94:87], celloutsig_0_0z } % { 1'h1, in_data[21:14] };
  assign celloutsig_0_27z = { celloutsig_0_10z[12], celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_20z, celloutsig_0_5z, celloutsig_0_17z } % { 1'h1, celloutsig_0_19z, celloutsig_0_14z, celloutsig_0_5z };
  assign celloutsig_0_28z = { celloutsig_0_14z[1], celloutsig_0_22z, celloutsig_0_26z, celloutsig_0_15z, celloutsig_0_22z, celloutsig_0_3z } % { 1'h1, celloutsig_0_9z[3:0], celloutsig_0_11z };
  assign celloutsig_0_33z = ^ celloutsig_0_9z[4:1];
  assign celloutsig_0_41z = ^ { celloutsig_0_34z, celloutsig_0_34z, celloutsig_0_39z };
  assign celloutsig_0_4z = ^ in_data[93:89];
  assign celloutsig_0_87z = ^ { celloutsig_0_79z[15:6], celloutsig_0_70z };
  assign celloutsig_1_18z = ^ { in_data[139:109], celloutsig_1_8z };
  assign celloutsig_0_11z = ^ celloutsig_0_10z[6:4];
  assign celloutsig_0_12z = ^ { celloutsig_0_6z[8:3], celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_11z };
  assign celloutsig_0_20z = ^ celloutsig_0_10z[8:3];
  assign celloutsig_0_24z = ^ celloutsig_0_6z[14:6];
  assign celloutsig_0_35z = { celloutsig_0_10z[6:4], celloutsig_0_34z, celloutsig_0_3z } << { celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_34z, celloutsig_0_0z, celloutsig_0_34z };
  assign celloutsig_0_36z = celloutsig_0_27z[5:1] << { celloutsig_0_23z[3:0], celloutsig_0_33z };
  assign celloutsig_0_39z = { celloutsig_0_23z[1], celloutsig_0_14z, celloutsig_0_24z, celloutsig_0_31z, celloutsig_0_26z } << { celloutsig_0_37z[2:0], celloutsig_0_7z, celloutsig_0_19z };
  assign celloutsig_0_42z = { in_data[85:80], celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_0z } << { in_data[77:59], celloutsig_0_30z, celloutsig_0_11z };
  assign celloutsig_0_52z = { celloutsig_0_6z[8:1], celloutsig_0_1z, celloutsig_0_23z } << { celloutsig_0_37z[3:1], celloutsig_0_16z, celloutsig_0_35z, celloutsig_0_33z, celloutsig_0_29z, celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_26z };
  assign celloutsig_0_53z = celloutsig_0_28z[2:0] << { celloutsig_0_48z[1:0], celloutsig_0_20z };
  assign celloutsig_0_57z = { celloutsig_0_31z, celloutsig_0_51z, celloutsig_0_45z } << celloutsig_0_39z[6:4];
  assign celloutsig_0_6z = { in_data[46:30], celloutsig_0_3z } << in_data[50:33];
  assign celloutsig_0_67z = { celloutsig_0_28z[3:2], celloutsig_0_31z, celloutsig_0_3z } << { celloutsig_0_23z[5:3], celloutsig_0_19z };
  assign celloutsig_0_79z = { celloutsig_0_25z[9:7], celloutsig_0_39z, celloutsig_0_28z, celloutsig_0_57z, celloutsig_0_4z, celloutsig_0_54z } << { celloutsig_0_41z, celloutsig_0_48z, celloutsig_0_7z, celloutsig_0_78z, celloutsig_0_67z, celloutsig_0_0z };
  assign celloutsig_0_88z = celloutsig_0_13z[12:10] << { celloutsig_0_56z, celloutsig_0_31z, celloutsig_0_49z };
  assign celloutsig_1_0z = in_data[157:152] << in_data[156:151];
  assign celloutsig_0_25z = { in_data[95:86], celloutsig_0_0z, celloutsig_0_11z } << { in_data[83:80], celloutsig_0_16z, celloutsig_0_21z, celloutsig_0_1z, _01_[4:3], _00_, _01_[1:0] };
  always_latch
    if (clkin_data[64]) celloutsig_0_70z = 10'h000;
    else if (clkin_data[32]) celloutsig_0_70z = { celloutsig_0_42z[17:16], celloutsig_0_32z, celloutsig_0_51z, celloutsig_0_24z, celloutsig_0_55z, celloutsig_0_53z, celloutsig_0_43z };
  always_latch
    if (clkin_data[64]) celloutsig_0_7z = 3'h0;
    else if (clkin_data[0]) celloutsig_0_7z = { celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_3z };
  always_latch
    if (clkin_data[64]) celloutsig_0_23z = 6'h00;
    else if (clkin_data[32]) celloutsig_0_23z = { celloutsig_0_6z[16:15], celloutsig_0_8z, celloutsig_0_16z, celloutsig_0_0z, celloutsig_0_5z };
  assign _01_[2] = _00_;
  assign { out_data[128], out_data[96], out_data[32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_87z, celloutsig_0_88z };
endmodule
