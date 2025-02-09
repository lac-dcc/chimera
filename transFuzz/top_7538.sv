/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [13:0] _03_;
  wire [3:0] _04_;
  reg [3:0] _05_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [5:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [8:0] celloutsig_0_16z;
  wire [11:0] celloutsig_0_17z;
  wire [24:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [6:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [5:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_29z;
  wire [13:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [4:0] celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [5:0] celloutsig_0_39z;
  wire [5:0] celloutsig_0_3z;
  wire [8:0] celloutsig_0_42z;
  wire celloutsig_0_46z;
  wire [18:0] celloutsig_0_4z;
  wire [5:0] celloutsig_0_50z;
  wire [16:0] celloutsig_0_5z;
  wire [7:0] celloutsig_0_62z;
  wire celloutsig_0_63z;
  wire celloutsig_0_64z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [19:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [9:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [6:0] celloutsig_1_16z;
  wire [3:0] celloutsig_1_17z;
  wire [4:0] celloutsig_1_18z;
  wire [5:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [12:0] celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire [3:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [10:0] celloutsig_1_7z;
  wire [2:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_1z = !(in_data[72] ? in_data[55] : in_data[78]);
  assign celloutsig_0_13z = ~celloutsig_0_2z[11];
  assign celloutsig_0_38z = ~((celloutsig_0_10z | celloutsig_0_4z[16]) & (in_data[79] | celloutsig_0_26z));
  assign celloutsig_0_63z = ~((celloutsig_0_46z | celloutsig_0_62z[3]) & (celloutsig_0_30z | celloutsig_0_50z[4]));
  assign celloutsig_0_9z = ~((celloutsig_0_1z | celloutsig_0_2z[10]) & (in_data[48] | celloutsig_0_6z));
  assign celloutsig_0_25z = ~((celloutsig_0_24z[1] | celloutsig_0_12z[0]) & (celloutsig_0_8z[19] | celloutsig_0_10z));
  assign celloutsig_0_29z = ~((celloutsig_0_11z | celloutsig_0_25z) & (celloutsig_0_2z[7] | celloutsig_0_9z));
  assign celloutsig_0_0z = in_data[26] | ~(in_data[68]);
  assign celloutsig_0_11z = celloutsig_0_7z | ~(celloutsig_0_0z);
  assign celloutsig_0_15z = celloutsig_0_4z[10] | ~(celloutsig_0_2z[2]);
  assign celloutsig_0_37z = celloutsig_0_16z[8] ^ celloutsig_0_23z;
  assign celloutsig_1_15z = _01_ ^ _02_;
  assign celloutsig_0_10z = celloutsig_0_5z[11] ^ celloutsig_0_1z;
  assign celloutsig_0_64z = ~(celloutsig_0_20z ^ celloutsig_0_24z[2]);
  assign celloutsig_0_26z = ~(celloutsig_0_9z ^ celloutsig_0_16z[6]);
  reg [13:0] _21_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_19z[0])
    if (celloutsig_1_19z[0]) _21_ <= 14'h0000;
    else _21_ <= { celloutsig_0_37z, celloutsig_0_22z, celloutsig_0_3z };
  assign { _03_[13:5], _00_, _03_[3:0] } = _21_;
  reg [3:0] _22_;
  always_ff @(negedge clkin_data[32], posedge clkin_data[64])
    if (clkin_data[64]) _22_ <= 4'h0;
    else _22_ <= { celloutsig_1_3z[8:7], celloutsig_1_11z, celloutsig_1_11z };
  assign { _04_[3:2], _02_, _01_ } = _22_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _05_ <= 4'h0;
    else _05_ <= in_data[30:27];
  assign celloutsig_0_2z = in_data[32:19] / { 1'h1, in_data[16:5], celloutsig_0_1z };
  assign celloutsig_1_14z = { celloutsig_1_13z[8:3], celloutsig_1_8z } > { celloutsig_1_7z[2], celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_9z, celloutsig_1_8z };
  assign celloutsig_0_6z = { celloutsig_0_5z[6:4], celloutsig_0_1z } || celloutsig_0_4z[10:7];
  assign celloutsig_1_1z = in_data[171:169] || { in_data[100:99], celloutsig_1_0z };
  assign celloutsig_1_0z = in_data[148] & ~(in_data[171]);
  assign celloutsig_1_6z = celloutsig_1_1z & ~(celloutsig_1_4z[0]);
  assign celloutsig_1_8z = { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_6z } % { 1'h1, celloutsig_1_2z[5:4] };
  assign celloutsig_0_12z = { celloutsig_0_4z[2:1], celloutsig_0_7z, celloutsig_0_11z } % { 1'h1, celloutsig_0_3z[3:2], celloutsig_0_7z };
  assign celloutsig_0_42z = { celloutsig_0_4z[6:0], celloutsig_0_9z, celloutsig_0_38z } * { celloutsig_0_14z, celloutsig_0_20z, celloutsig_0_9z, celloutsig_0_29z };
  assign celloutsig_1_3z = celloutsig_1_2z[10:1] * { in_data[177:170], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_13z = { celloutsig_1_9z, _04_[3:2], _02_, _01_, celloutsig_1_10z, _04_[3:2], _02_, _01_ } * celloutsig_1_7z[10:1];
  assign celloutsig_0_5z = celloutsig_0_3z[3] ? in_data[17:1] : celloutsig_0_4z[17:1];
  assign celloutsig_1_4z = celloutsig_1_3z[8] ? { celloutsig_1_3z[9], 1'h1, celloutsig_1_3z[7:6] } : { celloutsig_1_2z[8:6], celloutsig_1_0z };
  assign celloutsig_0_24z = celloutsig_0_17z[7] ? celloutsig_0_3z : celloutsig_0_14z;
  assign celloutsig_0_46z = celloutsig_0_34z != { _05_[1:0], celloutsig_0_21z, celloutsig_0_37z, celloutsig_0_36z };
  assign celloutsig_1_5z = { in_data[124:123], celloutsig_1_1z, celloutsig_1_0z } !== in_data[188:185];
  assign celloutsig_1_10z = { in_data[182:166], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z } !== { in_data[165:149], celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_9z };
  assign celloutsig_1_11z = { celloutsig_1_1z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_5z } !== { celloutsig_1_3z[5:0], celloutsig_1_0z };
  assign celloutsig_0_20z = celloutsig_0_8z[10:0] !== { celloutsig_0_18z[20:11], celloutsig_0_15z };
  assign celloutsig_1_16z = { celloutsig_1_2z[1], celloutsig_1_4z, celloutsig_1_11z, celloutsig_1_5z } | { celloutsig_1_13z[8:3], celloutsig_1_5z };
  assign celloutsig_0_18z = { celloutsig_0_17z[7:0], celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_2z } | { celloutsig_0_2z[10:0], celloutsig_0_15z, celloutsig_0_1z, celloutsig_0_17z };
  assign celloutsig_0_7z = & celloutsig_0_5z[15:3];
  assign celloutsig_1_9z = & { celloutsig_1_8z[2:1], celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_0_21z = & { celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_4z[9:6] };
  assign celloutsig_0_36z = celloutsig_0_26z & celloutsig_0_7z;
  assign celloutsig_0_30z = | celloutsig_0_14z[3:0];
  assign celloutsig_0_34z = celloutsig_0_18z[6:2] >> { celloutsig_0_3z[4:1], celloutsig_0_21z };
  assign celloutsig_1_7z = { celloutsig_1_3z[9:3], celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_6z } >> { celloutsig_1_3z[8:0], celloutsig_1_6z, celloutsig_1_1z };
  assign celloutsig_1_19z = celloutsig_1_13z[9:4] >> { celloutsig_1_4z[1], celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_9z };
  assign celloutsig_0_4z = in_data[86:68] << { celloutsig_0_2z[11:8], celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_1_2z = in_data[131:119] << in_data[178:166];
  assign celloutsig_1_17z = { celloutsig_1_15z, celloutsig_1_11z, celloutsig_1_14z, celloutsig_1_9z } >> { celloutsig_1_16z[6:5], celloutsig_1_9z, celloutsig_1_14z };
  assign celloutsig_1_18z = celloutsig_1_3z[8:4] <<< { celloutsig_1_16z[4], celloutsig_1_17z };
  assign celloutsig_0_17z = { celloutsig_0_12z[3:2], celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_11z } <<< { celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_1z };
  assign celloutsig_0_39z = { celloutsig_0_5z[4:0], celloutsig_0_25z } >>> { celloutsig_0_22z[6:3], celloutsig_0_13z, celloutsig_0_30z };
  assign celloutsig_0_62z = { _03_[9:5], _00_, _03_[3], celloutsig_0_6z } >>> celloutsig_0_42z[8:1];
  assign celloutsig_0_8z = { in_data[63:62], celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_0z } >>> { celloutsig_0_2z[11:7], celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_16z = celloutsig_0_5z[8:0] >>> { celloutsig_0_12z[1], celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_7z };
  assign celloutsig_0_22z = { celloutsig_0_17z[10:6], celloutsig_0_10z, celloutsig_0_9z } >>> { celloutsig_0_17z[10:5], celloutsig_0_9z };
  assign celloutsig_0_50z = celloutsig_0_5z[15:10] - celloutsig_0_39z;
  assign celloutsig_0_3z = { celloutsig_0_2z[4:0], celloutsig_0_0z } ~^ in_data[71:66];
  assign celloutsig_0_14z = { celloutsig_0_3z[5:1], celloutsig_0_9z } ~^ { celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_12z };
  assign celloutsig_0_23z = ~((celloutsig_0_15z & celloutsig_0_11z) | (celloutsig_0_16z[7] & celloutsig_0_12z[0]));
  assign _03_[4] = _00_;
  assign _04_[1:0] = { _02_, _01_ };
  assign { out_data[132:128], out_data[101:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_63z, celloutsig_0_64z };
endmodule
