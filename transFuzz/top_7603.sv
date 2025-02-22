/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [2:0] _00_;
  wire celloutsig_0_0z;
  wire [7:0] celloutsig_0_10z;
  wire [6:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [10:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [4:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [4:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [18:0] celloutsig_0_25z;
  wire [2:0] celloutsig_0_26z;
  wire [2:0] celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_34z;
  wire [8:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [2:0] celloutsig_0_3z;
  wire [7:0] celloutsig_0_4z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_78z;
  wire [2:0] celloutsig_0_79z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire [15:0] celloutsig_1_16z;
  wire [3:0] celloutsig_1_17z;
  wire [4:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [20:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [6:0] celloutsig_1_8z;
  wire [4:0] celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_5z = in_data[161] ? in_data[172] : in_data[135];
  assign celloutsig_0_20z = celloutsig_0_4z[4] ? in_data[45] : celloutsig_0_9z;
  assign celloutsig_1_7z = !(celloutsig_1_4z ? in_data[113] : celloutsig_1_5z);
  assign celloutsig_1_13z = !(celloutsig_1_11z ? celloutsig_1_2z : celloutsig_1_0z);
  assign celloutsig_1_0z = ~(in_data[175] | in_data[189]);
  assign celloutsig_1_11z = ~(1'h1 | celloutsig_1_0z);
  assign celloutsig_0_36z = ~celloutsig_0_2z;
  assign celloutsig_1_2z = ~((in_data[190] | celloutsig_1_0z) & celloutsig_1_0z);
  assign celloutsig_0_8z = in_data[44] | ~(celloutsig_0_5z[4]);
  assign celloutsig_0_15z = celloutsig_0_3z[1] | ~(celloutsig_0_10z[1]);
  assign celloutsig_0_12z = celloutsig_0_1z | celloutsig_0_5z[1];
  always_ff @(posedge clkin_data[32], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _00_ <= 3'h0;
    else _00_ <= { celloutsig_0_26z[2:1], 1'h1 };
  assign celloutsig_1_18z = { in_data[181:178], celloutsig_1_6z } & { celloutsig_1_17z[3], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_5z };
  assign celloutsig_0_5z = in_data[67:63] / { 1'h1, celloutsig_0_4z[4], celloutsig_0_4z[0], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_17z = { celloutsig_1_13z, celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_3z } / { 1'h1, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_0_21z = celloutsig_0_5z / { 1'h1, celloutsig_0_10z[6:4], celloutsig_0_6z };
  assign celloutsig_0_27z = { celloutsig_0_26z[1], 1'h1, celloutsig_0_13z } / { 1'h1, in_data[72], celloutsig_0_6z };
  assign celloutsig_1_19z = { celloutsig_1_17z[3:2], celloutsig_1_18z, celloutsig_1_10z } >= { celloutsig_1_16z[4:3], celloutsig_1_11z, celloutsig_1_9z[4:1], 1'h1 };
  assign celloutsig_0_13z = { celloutsig_0_10z[4:2], celloutsig_0_4z[7:3], celloutsig_0_4z[5:4], celloutsig_0_4z[0] } >= { celloutsig_0_4z[7:3], celloutsig_0_4z[5:4], celloutsig_0_3z, celloutsig_0_8z };
  assign celloutsig_0_1z = { in_data[53:52], celloutsig_0_0z } <= in_data[38:36];
  assign celloutsig_1_4z = ! { in_data[160:153], celloutsig_1_1z[1], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_3z, in_data[171:153], celloutsig_1_1z[1:0] };
  assign celloutsig_0_22z = ! { celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_7z };
  assign celloutsig_0_78z = { celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_12z, celloutsig_0_36z, _00_ } < { celloutsig_0_35z[6:5], celloutsig_0_35z[7], celloutsig_0_15z, celloutsig_0_26z[2:1], 1'h1 };
  assign celloutsig_0_17z = celloutsig_0_14z[7:5] < { celloutsig_0_3z[2:1], celloutsig_0_12z };
  assign celloutsig_0_11z = in_data[50:44] % { 1'h1, celloutsig_0_10z[4:0], celloutsig_0_6z };
  assign celloutsig_0_79z = celloutsig_0_26z[1] ? { celloutsig_0_26z[2], 2'h3 } : { celloutsig_0_4z[6:5], celloutsig_0_9z };
  assign celloutsig_1_1z[1:0] = in_data[172] ? in_data[152:151] : { celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_34z = celloutsig_0_25z[11:9] != { celloutsig_0_29z, celloutsig_0_0z, celloutsig_0_8z };
  assign celloutsig_0_2z = in_data[33:31] != in_data[78:76];
  assign celloutsig_0_3z = ~ { in_data[75:74], celloutsig_0_1z };
  assign celloutsig_0_10z = { celloutsig_0_4z[3], celloutsig_0_4z[5:4], celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_2z } | { celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_8z };
  assign celloutsig_1_10z = & celloutsig_1_9z[4:1];
  assign celloutsig_0_18z = & { celloutsig_0_10z[6:1], celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_6z };
  assign celloutsig_1_3z = ~^ in_data[163:160];
  assign celloutsig_0_25z = { celloutsig_0_21z, celloutsig_0_1z, celloutsig_0_20z, celloutsig_0_18z, celloutsig_0_21z, celloutsig_0_12z, celloutsig_0_19z } >> { celloutsig_0_21z[4:2], celloutsig_0_20z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_18z, celloutsig_0_22z, celloutsig_0_3z };
  assign celloutsig_1_8z = { in_data[167:163], celloutsig_1_0z, celloutsig_1_6z } - in_data[134:128];
  assign celloutsig_0_14z = { celloutsig_0_11z[3], celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_0z } ~^ { celloutsig_0_10z[6], celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_19z = { in_data[20], celloutsig_0_7z, celloutsig_0_3z } ~^ { celloutsig_0_14z[7:6], celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_15z };
  assign celloutsig_0_0z = ~((in_data[65] & in_data[33]) | (in_data[76] & in_data[80]));
  assign celloutsig_0_6z = ~((celloutsig_0_0z & celloutsig_0_4z[0]) | (celloutsig_0_1z & celloutsig_0_5z[4]));
  assign celloutsig_0_7z = ~((celloutsig_0_1z & celloutsig_0_2z) | (celloutsig_0_5z[0] & celloutsig_0_0z));
  assign celloutsig_1_6z = ~((celloutsig_1_2z & in_data[166]) | (celloutsig_1_3z & celloutsig_1_2z));
  assign celloutsig_0_9z = ~((celloutsig_0_6z & in_data[74]) | (celloutsig_0_5z[0] & celloutsig_0_3z[0]));
  assign celloutsig_0_29z = ~((celloutsig_0_14z[4] & celloutsig_0_17z) | (celloutsig_0_27z[1] & celloutsig_0_17z));
  assign { celloutsig_0_4z[3], celloutsig_0_4z[6:4], celloutsig_0_4z[0], celloutsig_0_4z[7] } = { celloutsig_0_3z[2], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_2z } & { celloutsig_0_3z[0], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_26z[2:1] = { celloutsig_0_18z, celloutsig_0_15z } ~^ { celloutsig_0_1z, celloutsig_0_17z };
  assign { celloutsig_1_9z[2:1], celloutsig_1_9z[4:3] } = { celloutsig_1_3z, celloutsig_1_3z, in_data[115:114] } ~^ { celloutsig_1_4z, celloutsig_1_0z, in_data[154], celloutsig_1_6z };
  assign { celloutsig_0_35z[5], celloutsig_0_35z[8:6], celloutsig_0_35z[2:0] } = ~ { celloutsig_0_4z[3], celloutsig_0_4z[6:4], celloutsig_0_4z[0], celloutsig_0_34z, celloutsig_0_1z };
  assign { celloutsig_1_16z[4], celloutsig_1_16z[11:9], celloutsig_1_16z[15], celloutsig_1_16z[8], celloutsig_1_16z[14], celloutsig_1_16z[7], celloutsig_1_16z[13:12], celloutsig_1_16z[5], celloutsig_1_16z[3], celloutsig_1_16z[0] } = { celloutsig_1_10z, celloutsig_1_8z[6:3], celloutsig_1_8z[3:2], celloutsig_1_8z[2:0], celloutsig_1_8z[0], celloutsig_1_3z, celloutsig_1_2z } ~^ { celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_9z[4:3], celloutsig_1_8z[2], celloutsig_1_9z[2], celloutsig_1_3z, celloutsig_1_9z[1], celloutsig_1_6z, celloutsig_1_11z, celloutsig_1_10z, celloutsig_1_5z, celloutsig_1_0z };
  assign celloutsig_0_26z[0] = 1'h1;
  assign celloutsig_0_35z[4:3] = celloutsig_0_35z[7:6];
  assign celloutsig_0_4z[2:1] = celloutsig_0_4z[5:4];
  assign { celloutsig_1_16z[6], celloutsig_1_16z[2:1] } = { celloutsig_1_8z[1], 2'h3 };
  assign celloutsig_1_1z[20:2] = in_data[171:153];
  assign celloutsig_1_9z[0] = 1'h1;
  assign { out_data[132:128], out_data[96], out_data[32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_78z, celloutsig_0_79z };
endmodule
