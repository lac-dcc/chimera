/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [7:0] _01_;
  wire celloutsig_0_0z;
  wire [10:0] celloutsig_0_10z;
  wire [8:0] celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire [14:0] celloutsig_0_13z;
  wire [10:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [4:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [10:0] celloutsig_0_1z;
  wire celloutsig_0_26z;
  wire [10:0] celloutsig_0_27z;
  wire [4:0] celloutsig_0_2z;
  wire [26:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [2:0] celloutsig_0_8z;
  wire [6:0] celloutsig_0_9z;
  wire [9:0] celloutsig_1_0z;
  wire celloutsig_1_18z;
  wire [17:0] celloutsig_1_19z;
  wire [12:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire [39:0] celloutsig_1_5z;
  wire [11:0] celloutsig_1_6z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_2z = !(celloutsig_1_1z[2] ? in_data[182] : celloutsig_1_1z[9]);
  assign celloutsig_0_4z = ~((celloutsig_0_2z[3] | celloutsig_0_1z[9]) & celloutsig_0_0z);
  assign celloutsig_0_12z = celloutsig_0_11z[7:2] + celloutsig_0_1z[7:2];
  assign celloutsig_1_1z = { celloutsig_1_0z[2:0], celloutsig_1_0z } + in_data[165:153];
  reg [7:0] _06_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z)
    if (celloutsig_1_18z) _06_ <= 8'h00;
    else _06_ <= { celloutsig_0_2z[1:0], celloutsig_0_2z, celloutsig_0_4z };
  assign { _01_[7:2], _00_, _01_[0] } = _06_;
  assign celloutsig_0_11z = { celloutsig_0_3z[22:15], celloutsig_0_7z } & celloutsig_0_10z[10:2];
  assign celloutsig_0_1z = { in_data[25:17], celloutsig_0_0z, celloutsig_0_0z } & in_data[53:43];
  assign celloutsig_0_0z = in_data[91:76] && in_data[32:17];
  assign celloutsig_0_16z = celloutsig_0_15z[9:0] && { celloutsig_0_13z[8:0], celloutsig_0_7z };
  assign celloutsig_0_19z = celloutsig_0_10z[10:6] && celloutsig_0_13z[11:7];
  assign celloutsig_1_3z = ! celloutsig_1_1z[9:0];
  assign celloutsig_1_6z = - { in_data[139:138], celloutsig_1_0z };
  assign celloutsig_1_19z = - { celloutsig_1_0z[8:4], celloutsig_1_18z, celloutsig_1_6z };
  assign celloutsig_1_18z = celloutsig_1_4z !== { celloutsig_1_5z[6:5], celloutsig_1_2z };
  assign celloutsig_0_26z = celloutsig_0_1z[7:5] !== { celloutsig_0_1z[0], celloutsig_0_16z, celloutsig_0_0z };
  assign celloutsig_0_8z = in_data[84:82] | { celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_0_7z = & celloutsig_0_3z[15:6];
  assign celloutsig_0_6z = ^ { in_data[57:52], celloutsig_0_4z };
  assign celloutsig_0_9z = celloutsig_0_1z[8:2] >> { in_data[87:86], celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_6z };
  assign celloutsig_0_10z = { in_data[41:34], celloutsig_0_8z } >> celloutsig_0_3z[25:15];
  assign celloutsig_0_13z = { celloutsig_0_10z[9:0], celloutsig_0_2z } >> in_data[14:0];
  assign celloutsig_0_15z = { celloutsig_0_9z[4:3], _01_[7:2], _00_, _01_[0], celloutsig_0_6z } >> { celloutsig_0_12z[5:1], celloutsig_0_12z };
  assign celloutsig_0_18z = { celloutsig_0_13z[5], celloutsig_0_4z, celloutsig_0_8z } >> { _01_[2], _00_, _01_[0], celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_1_4z = { in_data[156:155], celloutsig_1_3z } ~^ celloutsig_1_1z[11:9];
  assign celloutsig_1_0z = in_data[181:172] ~^ in_data[105:96];
  assign celloutsig_1_5z = { celloutsig_1_0z[4:0], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_0z } ^ { in_data[169:166], celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_0_2z = { in_data[75:73], celloutsig_0_0z, celloutsig_0_0z } ^ in_data[66:62];
  assign celloutsig_0_27z = celloutsig_0_10z ^ { celloutsig_0_15z[5:2], celloutsig_0_18z, celloutsig_0_19z, celloutsig_0_6z };
  assign { celloutsig_0_3z[11:7], celloutsig_0_3z[26:12], celloutsig_0_3z[6:5] } = { celloutsig_0_2z, in_data[66:52], celloutsig_0_0z, celloutsig_0_0z } ^ { in_data[43:39], in_data[58:44], in_data[38:37] };
  assign _01_[1] = _00_;
  assign celloutsig_0_3z[4:0] = 5'h00;
  assign { out_data[128], out_data[113:96], out_data[32], out_data[10:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_26z, celloutsig_0_27z };
endmodule
