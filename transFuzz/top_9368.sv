/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [11:0] _03_;
  wire [29:0] _04_;
  wire celloutsig_0_0z;
  wire [11:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire [11:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [3:0] celloutsig_0_16z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_23z;
  wire celloutsig_0_29z;
  wire [3:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_3z;
  wire [9:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire [5:0] celloutsig_1_13z;
  wire [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [5:0] celloutsig_1_8z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_29z = ~celloutsig_0_23z;
  assign celloutsig_0_14z = ~((_00_ | celloutsig_0_13z[2]) & _01_);
  assign celloutsig_1_19z = ~((celloutsig_1_1z[2] | celloutsig_1_10z) & (celloutsig_1_1z[1] | celloutsig_1_8z[3]));
  assign celloutsig_0_4z = { in_data[34:28], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_0z } + { in_data[74:66], celloutsig_0_3z };
  assign celloutsig_1_8z = { celloutsig_1_0z[4:1], celloutsig_1_4z, celloutsig_1_5z } + { celloutsig_1_0z[2], celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_1z[2], celloutsig_1_1z[2] };
  assign celloutsig_1_18z = celloutsig_1_13z[5:3] + celloutsig_1_13z[2:0];
  assign celloutsig_0_13z = { _03_[11:7], _00_, celloutsig_0_12z } + { in_data[13:3], celloutsig_0_5z };
  assign celloutsig_0_16z = { celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_14z, celloutsig_0_3z } + { celloutsig_0_13z[11], celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_8z };
  assign celloutsig_0_2z = in_data[21:18] + { in_data[82], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_1z = celloutsig_1_0z[4:2] + in_data[177:175];
  reg [29:0] _15_;
  always_ff @(posedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _15_ <= 30'h00000000;
    else _15_ <= { in_data[71:50], celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_1z };
  assign { _04_[29:25], _03_[11:7], _00_, _04_[18:11], _02_, _04_[9:7], _01_, _04_[5:0] } = _15_;
  assign celloutsig_0_6z = { in_data[35:33], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_2z } > { in_data[77:65], celloutsig_0_1z, celloutsig_0_2z };
  assign celloutsig_0_1z = in_data[74:65] > in_data[42:33];
  assign celloutsig_0_11z = in_data[95:93] > { celloutsig_0_2z[1:0], celloutsig_0_0z };
  assign celloutsig_0_15z = celloutsig_0_4z[9:5] > celloutsig_0_10z[10:6];
  assign celloutsig_1_5z = { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_4z } && { in_data[134:133], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_0z = ! in_data[85:74];
  assign celloutsig_1_2z = ! in_data[111:107];
  assign celloutsig_1_4z = ! { celloutsig_1_1z[2:1], celloutsig_1_2z };
  assign celloutsig_0_19z = ! { celloutsig_0_13z[3], celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_1z };
  assign celloutsig_0_23z = ! { celloutsig_0_16z[2:1], celloutsig_0_19z };
  assign celloutsig_1_10z = celloutsig_1_8z[0] & ~(celloutsig_1_4z);
  assign celloutsig_0_7z = celloutsig_0_4z[0] & ~(celloutsig_0_2z[0]);
  assign celloutsig_0_8z = celloutsig_0_7z & ~(celloutsig_0_1z);
  assign celloutsig_1_13z = { in_data[136:132], celloutsig_1_12z } * { celloutsig_1_1z[1:0], celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_1_6z = celloutsig_1_1z[0] & celloutsig_1_1z[2];
  assign celloutsig_1_12z = celloutsig_1_1z[0] & celloutsig_1_5z;
  assign celloutsig_0_30z = celloutsig_0_29z & celloutsig_0_6z;
  assign celloutsig_0_5z = ^ { celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_0_3z = ^ { in_data[55:6], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_0z };
  assign celloutsig_0_10z = { _04_[16:11], _02_, _04_[9:7], _01_, celloutsig_0_0z } >> { in_data[39:29], celloutsig_0_3z };
  assign celloutsig_0_12z = celloutsig_0_10z[11:6] >> { _04_[28], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_11z };
  assign celloutsig_1_0z = in_data[139:135] >> in_data[141:137];
  assign _03_[6:0] = { _00_, celloutsig_0_12z };
  assign { _04_[24:19], _04_[10], _04_[6] } = { _03_[11:7], _00_, _02_, _01_ };
  assign { out_data[130:128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_29z, celloutsig_0_30z };
endmodule
