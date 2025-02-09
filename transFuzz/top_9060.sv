/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [22:0] _01_;
  reg [4:0] _02_;
  wire celloutsig_0_10z;
  wire [7:0] celloutsig_0_11z;
  wire [10:0] celloutsig_0_12z;
  wire [17:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [12:0] celloutsig_0_15z;
  wire [10:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [2:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [4:0] celloutsig_0_20z;
  wire [11:0] celloutsig_0_21z;
  wire [2:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [22:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [9:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [5:0] celloutsig_0_33z;
  wire [6:0] celloutsig_0_34z;
  wire [11:0] celloutsig_0_36z;
  wire [11:0] celloutsig_0_37z;
  wire [4:0] celloutsig_0_3z;
  wire [6:0] celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire [5:0] celloutsig_0_4z;
  wire [3:0] celloutsig_0_52z;
  wire [4:0] celloutsig_0_56z;
  wire celloutsig_0_5z;
  wire [13:0] celloutsig_0_62z;
  wire [29:0] celloutsig_0_63z;
  wire [7:0] celloutsig_0_64z;
  wire [4:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [4:0] celloutsig_1_13z;
  wire [2:0] celloutsig_1_14z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [3:0] celloutsig_1_3z;
  wire [5:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire [3:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_2z = ~(in_data[123] & celloutsig_1_1z);
  assign celloutsig_0_9z = ~(celloutsig_0_5z & celloutsig_0_8z);
  assign celloutsig_0_2z = ~((_00_ | celloutsig_0_1z) & celloutsig_0_1z);
  assign celloutsig_1_5z = ~((celloutsig_1_4z[0] | celloutsig_1_1z) & celloutsig_1_2z);
  assign celloutsig_1_19z = ~((celloutsig_1_14z[0] | celloutsig_1_1z) & celloutsig_1_14z[1]);
  assign celloutsig_0_8z = ~((celloutsig_0_4z[5] | in_data[2]) & celloutsig_0_6z[2]);
  assign celloutsig_0_10z = ~((celloutsig_0_6z[4] | celloutsig_0_5z) & celloutsig_0_3z[3]);
  assign celloutsig_0_1z = ~((in_data[53] | in_data[47]) & in_data[79]);
  assign celloutsig_1_3z = { in_data[102:100], celloutsig_1_0z } + { in_data[135:134], celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_1_6z = { celloutsig_1_3z, celloutsig_1_5z } + in_data[175:171];
  assign celloutsig_0_24z = { celloutsig_0_19z[1:0], celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_9z, _00_, _01_[14:12], celloutsig_0_17z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_9z } + { celloutsig_0_15z[10:1], celloutsig_0_21z, celloutsig_0_7z };
  reg [3:0] _14_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _14_ <= 4'h0;
    else _14_ <= in_data[32:29];
  assign { _00_, _01_[14:12] } = _14_;
  reg [16:0] _15_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _15_ <= 17'h00000;
    else _15_ <= { in_data[133:129], celloutsig_1_2z, celloutsig_1_10z, celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_6z };
  assign out_data[144:128] = _15_;
  always_ff @(negedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _02_ <= 5'h00;
    else _02_ <= celloutsig_0_12z[4:0];
  assign celloutsig_0_56z = { celloutsig_0_15z[10:7], celloutsig_0_17z } & celloutsig_0_20z;
  assign celloutsig_1_7z = celloutsig_1_3z & { celloutsig_1_4z[4:3], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_14z = in_data[138:136] & { celloutsig_1_13z[3], celloutsig_1_8z, celloutsig_1_2z };
  assign celloutsig_0_27z = { celloutsig_0_13z[7:0], celloutsig_0_26z, celloutsig_0_14z } & celloutsig_0_13z[9:0];
  assign celloutsig_0_64z = { celloutsig_0_19z, celloutsig_0_56z } / { 1'h1, celloutsig_0_62z[6:0] };
  assign celloutsig_0_16z = celloutsig_0_15z[10:0] / { 1'h1, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_5z };
  assign celloutsig_0_17z = { celloutsig_0_15z, celloutsig_0_5z } === { celloutsig_0_12z[5:1], celloutsig_0_11z, celloutsig_0_1z };
  assign celloutsig_0_25z = { _01_[14:12], celloutsig_0_19z, celloutsig_0_2z } >= { celloutsig_0_3z[3:1], celloutsig_0_1z, celloutsig_0_19z };
  assign celloutsig_0_28z = celloutsig_0_13z[14:2] >= celloutsig_0_24z[15:3];
  assign celloutsig_0_29z = celloutsig_0_27z[7:0] >= { celloutsig_0_27z[8:2], celloutsig_0_7z };
  assign celloutsig_1_1z = in_data[180:157] && { in_data[134:115], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_5z = { in_data[93:47], celloutsig_0_2z, celloutsig_0_3z[4:1], celloutsig_0_1z } && { in_data[72:28], celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_14z = celloutsig_0_7z & ~(celloutsig_0_5z);
  assign celloutsig_0_3z[4:1] = in_data[30] ? { _00_, _01_[14:12] } : in_data[46:43];
  assign celloutsig_1_4z = celloutsig_1_3z[2] ? in_data[131:126] : { in_data[107:104], celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_0_6z = celloutsig_0_5z ? { celloutsig_0_4z[4], _00_, _01_[14:12] } : { celloutsig_0_4z[5:2], celloutsig_0_2z };
  assign celloutsig_1_10z = { celloutsig_1_6z[2:1], celloutsig_1_2z, celloutsig_1_1z } !== { celloutsig_1_6z[3:1], celloutsig_1_5z };
  assign celloutsig_0_34z = ~ celloutsig_0_16z[9:3];
  assign celloutsig_0_63z = ~ { in_data[33:28], celloutsig_0_6z, celloutsig_0_36z, celloutsig_0_47z };
  assign celloutsig_0_19z = ~ { in_data[75], celloutsig_0_10z, celloutsig_0_14z };
  assign celloutsig_0_33z = celloutsig_0_16z[5:0] | celloutsig_0_21z[8:3];
  assign celloutsig_0_47z = celloutsig_0_12z[6:0] | celloutsig_0_37z[11:5];
  assign celloutsig_0_4z = in_data[91:86] | { celloutsig_0_3z[4:1], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_62z = { celloutsig_0_6z[3:2], celloutsig_0_28z, celloutsig_0_48z, celloutsig_0_34z, celloutsig_0_2z, celloutsig_0_23z, celloutsig_0_29z } | { celloutsig_0_52z[3], celloutsig_0_27z, celloutsig_0_19z };
  assign celloutsig_0_15z = { celloutsig_0_13z[12:1], celloutsig_0_8z } | { celloutsig_0_12z[9:0], celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_14z };
  assign celloutsig_0_20z = { celloutsig_0_1z, celloutsig_0_14z, celloutsig_0_19z } | celloutsig_0_13z[6:2];
  assign celloutsig_0_21z = { celloutsig_0_16z[7], celloutsig_0_14z, celloutsig_0_7z, _00_, _01_[14:12], celloutsig_0_19z, celloutsig_0_1z, celloutsig_0_7z } | { celloutsig_0_19z[2:1], celloutsig_0_17z, celloutsig_0_5z, celloutsig_0_11z };
  assign celloutsig_0_22z = celloutsig_0_16z[6:4] | celloutsig_0_12z[5:3];
  assign celloutsig_0_48z = celloutsig_0_5z & celloutsig_0_25z;
  assign celloutsig_1_0z = in_data[126] & in_data[156];
  assign celloutsig_1_8z = celloutsig_1_5z & celloutsig_1_4z[5];
  assign celloutsig_0_7z = celloutsig_0_3z[3] & celloutsig_0_6z[1];
  assign celloutsig_0_23z = celloutsig_0_1z & celloutsig_0_6z[1];
  assign celloutsig_0_26z = celloutsig_0_12z[4] & celloutsig_0_14z;
  assign celloutsig_1_13z = { celloutsig_1_6z[0], celloutsig_1_3z } >> { celloutsig_1_5z, celloutsig_1_7z };
  assign celloutsig_0_36z = { celloutsig_0_11z[7], celloutsig_0_33z, _02_ } >> celloutsig_0_13z[17:6];
  assign celloutsig_0_37z = { celloutsig_0_34z[5], celloutsig_0_12z } >> { celloutsig_0_16z[10:7], celloutsig_0_11z };
  assign celloutsig_0_52z = { celloutsig_0_22z, celloutsig_0_25z } >> celloutsig_0_4z[5:2];
  assign celloutsig_0_13z = { celloutsig_0_11z[4], celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_4z } >> { celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_1z };
  assign celloutsig_0_11z = { celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_6z } ^ { in_data[29:23], celloutsig_0_10z };
  assign celloutsig_0_12z = { celloutsig_0_10z, _00_, _01_[14:12], celloutsig_0_1z, celloutsig_0_1z, _00_, _01_[14:12] } ^ { celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_11z };
  assign { _01_[22:15], _01_[11:0] } = { celloutsig_0_19z[1:0], celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_9z, _00_, celloutsig_0_17z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_9z };
  assign celloutsig_0_3z[0] = celloutsig_0_1z;
  assign { out_data[96], out_data[61:32], out_data[7:0] } = { celloutsig_1_19z, celloutsig_0_63z, celloutsig_0_64z };
endmodule
