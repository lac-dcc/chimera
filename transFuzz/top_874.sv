/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire [3:0] _05_;
  wire [3:0] _06_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [2:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [18:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [2:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [12:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [7:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [8:0] celloutsig_0_46z;
  wire [14:0] celloutsig_0_47z;
  wire [4:0] celloutsig_0_4z;
  wire celloutsig_0_53z;
  wire [12:0] celloutsig_0_56z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire [3:0] celloutsig_0_62z;
  wire [23:0] celloutsig_0_63z;
  wire celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire [7:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [4:0] celloutsig_1_12z;
  wire [21:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_42z = celloutsig_0_41z ? celloutsig_0_22z : celloutsig_0_36z;
  assign celloutsig_1_10z = celloutsig_1_8z ? celloutsig_1_8z : _02_;
  assign celloutsig_1_15z = celloutsig_1_2z ? celloutsig_1_2z : celloutsig_1_5z;
  assign celloutsig_1_16z = celloutsig_1_10z ? celloutsig_1_1z[0] : _03_;
  assign celloutsig_0_11z = celloutsig_0_1z ? celloutsig_0_1z : celloutsig_0_10z;
  assign celloutsig_0_24z = celloutsig_0_16z ? celloutsig_0_5z : celloutsig_0_1z;
  assign celloutsig_0_0z = in_data[43] | ~(in_data[66]);
  assign celloutsig_0_39z = celloutsig_0_0z | ~(celloutsig_0_26z[2]);
  assign celloutsig_0_31z = celloutsig_0_0z | ~(celloutsig_0_18z);
  assign celloutsig_0_5z = celloutsig_0_10z | in_data[70];
  assign celloutsig_0_53z = celloutsig_0_31z | celloutsig_0_46z[8];
  assign celloutsig_0_6z = celloutsig_0_5z | celloutsig_0_0z;
  assign celloutsig_0_22z = celloutsig_0_11z | celloutsig_0_5z;
  assign celloutsig_0_28z = celloutsig_0_10z | celloutsig_0_18z;
  reg [3:0] _21_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _21_ <= 4'h0;
    else _21_ <= { celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_4z };
  assign { _05_[3], _03_, _02_, _05_[0] } = _21_;
  reg [3:0] _22_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _22_ <= 4'h0;
    else _22_ <= { celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_8z };
  assign { _06_[3], _00_, _01_, _04_ } = _22_;
  assign celloutsig_0_47z = celloutsig_0_21z[18:4] & { celloutsig_0_29z[12:4], celloutsig_0_39z, celloutsig_0_11z, celloutsig_0_16z, celloutsig_0_42z, celloutsig_0_2z, celloutsig_0_36z };
  assign celloutsig_0_62z = celloutsig_0_56z[4:1] & celloutsig_0_38z[5:2];
  assign celloutsig_0_9z = { celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z } & { in_data[55], celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_26z = { celloutsig_0_21z[13:12], celloutsig_0_16z } & celloutsig_0_13z;
  assign celloutsig_0_8z = { celloutsig_0_4z[2:1], celloutsig_0_1z, celloutsig_0_4z[4:2], celloutsig_0_4z[0] } === { celloutsig_0_4z[3:0], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_1_19z = { in_data[132:124], celloutsig_1_8z, celloutsig_1_8z, celloutsig_1_9z } === { celloutsig_1_2z, celloutsig_1_15z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_14z = celloutsig_0_4z[4:1] === in_data[41:38];
  assign celloutsig_0_15z = celloutsig_0_9z[5:0] === { celloutsig_0_9z[1:0], celloutsig_0_6z, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_12z };
  assign celloutsig_1_0z = in_data[176:158] <= in_data[114:96];
  assign celloutsig_1_8z = { in_data[113:106], celloutsig_1_4z, celloutsig_1_3z } <= { in_data[165:158], celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_0_1z = { in_data[40:39], celloutsig_0_0z, celloutsig_0_0z } <= { in_data[10], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_17z = { celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_0z } <= { celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_18z = { in_data[21:15], celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_5z } <= { celloutsig_0_4z[2:0], celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_8z };
  assign celloutsig_0_16z = ! { celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_10z = { in_data[61:60], celloutsig_0_0z } < { in_data[35], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_4z = { in_data[140:138], celloutsig_1_2z } < celloutsig_1_1z;
  assign celloutsig_1_17z = { celloutsig_1_14z[17:11], celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_16z, celloutsig_1_9z } < celloutsig_1_14z[17:0];
  assign celloutsig_0_12z = { celloutsig_0_9z[5:2], celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_0z } < { in_data[12:2], celloutsig_0_8z };
  assign celloutsig_0_2z = { in_data[23:22], celloutsig_0_0z, celloutsig_0_0z } < in_data[20:17];
  assign celloutsig_0_27z = { celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_10z } < { celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_5z };
  assign celloutsig_0_41z = celloutsig_0_24z & ~(celloutsig_0_21z[18]);
  assign celloutsig_0_59z = celloutsig_0_8z & ~(celloutsig_0_37z);
  assign celloutsig_1_2z = celloutsig_1_1z[0] & ~(in_data[105]);
  assign celloutsig_1_5z = celloutsig_1_3z & ~(celloutsig_1_2z);
  assign celloutsig_1_7z = in_data[151] & ~(celloutsig_1_3z);
  assign celloutsig_1_18z = celloutsig_1_7z & ~(celloutsig_1_17z);
  assign celloutsig_0_20z = celloutsig_0_0z & ~(celloutsig_0_0z);
  assign celloutsig_0_23z = celloutsig_0_17z & ~(celloutsig_0_2z);
  assign celloutsig_0_38z = { in_data[6:0], celloutsig_0_16z } * celloutsig_0_9z;
  assign celloutsig_0_4z = { in_data[79:76], celloutsig_0_0z } * { in_data[92:89], celloutsig_0_2z };
  assign celloutsig_0_21z = { _00_, _01_, _04_, celloutsig_0_17z, celloutsig_0_12z, celloutsig_0_2z, celloutsig_0_20z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_20z, _06_[3], _00_, _01_, _04_, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_12z } * { in_data[15:6], celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_15z };
  assign celloutsig_0_36z = & { _01_, _00_, _04_, celloutsig_0_28z, _06_[3], celloutsig_0_11z };
  assign celloutsig_0_37z = & { celloutsig_0_27z, celloutsig_0_24z, celloutsig_0_16z };
  assign celloutsig_1_3z = & in_data[143:125];
  assign celloutsig_1_9z = & { celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_11z = & { _03_, _02_, _05_[3], _05_[0], in_data[130] };
  assign celloutsig_0_46z = { celloutsig_0_29z[11:8], celloutsig_0_24z, celloutsig_0_36z, celloutsig_0_13z } >> { celloutsig_0_9z[1], celloutsig_0_9z };
  assign celloutsig_1_1z = { in_data[135:133], celloutsig_1_0z } >> in_data[135:132];
  assign celloutsig_1_14z = { in_data[137:124], _05_[3], _03_, _02_, _05_[0], celloutsig_1_1z } >> { celloutsig_1_12z[0], celloutsig_1_3z, celloutsig_1_11z, celloutsig_1_5z, celloutsig_1_11z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_12z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_0z, celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_0z };
  assign celloutsig_0_56z = { in_data[61:53], _06_[3], _00_, _01_, _04_ } >>> { celloutsig_0_47z[12:3], celloutsig_0_53z, celloutsig_0_31z, celloutsig_0_28z };
  assign celloutsig_0_63z = { celloutsig_0_47z[14:4], celloutsig_0_9z, celloutsig_0_59z, celloutsig_0_15z, celloutsig_0_13z } >>> in_data[33:10];
  assign celloutsig_1_12z = { celloutsig_1_1z[3:2], celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_7z } >>> { celloutsig_1_0z, celloutsig_1_8z, celloutsig_1_4z, celloutsig_1_8z, celloutsig_1_0z };
  assign celloutsig_0_13z = in_data[9:7] >>> celloutsig_0_9z[5:3];
  assign celloutsig_0_29z = { celloutsig_0_24z, celloutsig_0_18z, _06_[3], _00_, _01_, _04_, celloutsig_0_14z, celloutsig_0_6z, celloutsig_0_16z, celloutsig_0_18z, celloutsig_0_28z, celloutsig_0_10z, celloutsig_0_23z } >>> celloutsig_0_21z[17:5];
  assign _05_[2:1] = { _03_, _02_ };
  assign _06_[2:0] = { _00_, _01_, _04_ };
  assign { out_data[128], out_data[96], out_data[35:32], out_data[23:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_62z, celloutsig_0_63z };
endmodule
