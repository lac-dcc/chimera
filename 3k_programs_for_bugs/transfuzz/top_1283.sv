/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [7:0] _03_;
  reg [13:0] _04_;
  reg [7:0] _05_;
  wire celloutsig_0_0z;
  wire celloutsig_0_11z;
  wire [3:0] celloutsig_0_12z;
  wire celloutsig_0_14z;
  wire [5:0] celloutsig_0_17z;
  wire celloutsig_0_20z;
  wire celloutsig_0_25z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire [7:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [7:0] celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [4:0] celloutsig_1_13z;
  wire [3:0] celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire [4:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [8:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_11z = ~(1'h1 & celloutsig_0_3z);
  assign celloutsig_1_11z = !(celloutsig_1_9z ? celloutsig_1_4z[1] : celloutsig_1_3z);
  assign celloutsig_1_5z = ~celloutsig_1_4z[1];
  assign celloutsig_1_9z = ~celloutsig_1_0z[4];
  assign celloutsig_1_12z = ~celloutsig_1_6z[0];
  assign celloutsig_1_17z = ~celloutsig_1_8z;
  assign celloutsig_0_25z = ~celloutsig_0_12z[2];
  assign celloutsig_0_3z = ~((_00_ | _01_) & celloutsig_0_0z);
  assign celloutsig_1_2z = ~((celloutsig_1_0z[1] | in_data[98]) & (in_data[150] | in_data[172]));
  assign celloutsig_0_43z = ~(celloutsig_0_25z ^ in_data[65]);
  assign celloutsig_0_42z = { celloutsig_0_29z, 1'h0, celloutsig_0_17z } + { celloutsig_0_9z[4:0], celloutsig_0_28z, celloutsig_0_0z, celloutsig_0_41z };
  assign celloutsig_1_4z = { celloutsig_1_0z[1:0], celloutsig_1_3z } + { celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_3z };
  assign celloutsig_1_13z = { in_data[189:188], celloutsig_1_12z, celloutsig_1_12z, celloutsig_1_10z } + { in_data[171:169], celloutsig_1_5z, celloutsig_1_12z };
  always_ff @(posedge clkin_data[32], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _04_ <= 14'h0000;
    else _04_ <= { _01_, _03_[6:4], 1'h1, celloutsig_0_3z, _01_, _03_[6:2], _00_, _02_ };
  reg [7:0] _20_;
  always_ff @(negedge clkin_data[32], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _20_ <= 8'h00;
    else _20_ <= in_data[40:33];
  assign { _01_, _03_[6:2], _00_, _02_ } = _20_;
  always_ff @(negedge clkin_data[32], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _05_ <= 8'h00;
    else _05_ <= { celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_5z };
  assign celloutsig_0_5z = { _04_[0], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z } == _03_[6:3];
  assign celloutsig_0_20z = in_data[46:42] == _03_[6:2];
  assign celloutsig_1_7z = { celloutsig_1_5z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_3z } === { in_data[121:115], celloutsig_1_2z };
  assign celloutsig_0_14z = _04_[12:4] === { _03_[5:2], _00_, _02_, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_6z };
  assign celloutsig_1_1z = { in_data[120:113], celloutsig_1_0z, celloutsig_1_0z } > { in_data[145:133], celloutsig_1_0z };
  assign celloutsig_1_8z = celloutsig_1_6z[8:6] > { in_data[144:143], celloutsig_1_3z };
  assign celloutsig_1_19z = celloutsig_1_13z[3:1] > { celloutsig_1_13z[2:1], celloutsig_1_5z };
  assign celloutsig_0_0z = in_data[17:10] <= in_data[81:74];
  assign celloutsig_0_41z = ! { in_data[61:54], celloutsig_0_5z };
  assign celloutsig_1_10z = ! { celloutsig_1_6z[6:5], celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_3z };
  assign celloutsig_0_28z = ! in_data[72:60];
  assign celloutsig_0_29z = ! { _05_[3:1], celloutsig_0_25z, celloutsig_0_20z };
  assign celloutsig_0_6z = _00_ & ~(in_data[62]);
  assign celloutsig_1_18z = { celloutsig_1_13z[1], celloutsig_1_17z, celloutsig_1_10z, celloutsig_1_7z, celloutsig_1_2z } * { celloutsig_1_7z, celloutsig_1_15z };
  assign celloutsig_1_0z = in_data[161] ? in_data[149:145] : in_data[186:182];
  assign celloutsig_1_3z = { celloutsig_1_0z[2:1], celloutsig_1_1z, celloutsig_1_1z } != in_data[140:137];
  assign celloutsig_1_6z = { in_data[168:162], celloutsig_1_5z, celloutsig_1_2z } >> in_data[169:161];
  assign celloutsig_0_9z = { in_data[82:79], celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_0z } >> { _01_, _03_[6:2], _00_, celloutsig_0_3z };
  assign celloutsig_0_17z = { celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_3z } >> { _04_[9:6], celloutsig_0_14z, celloutsig_0_3z };
  assign celloutsig_1_15z = { celloutsig_1_0z[3], celloutsig_1_12z, celloutsig_1_7z, celloutsig_1_11z } <<< celloutsig_1_6z[3:0];
  assign celloutsig_0_12z = _04_[3:0] ^ { celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_14z };
  assign { _03_[7], _03_[1:0] } = { _01_, _00_, _02_ };
  assign { out_data[132:128], out_data[96], out_data[39:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_42z, celloutsig_0_43z };
endmodule
