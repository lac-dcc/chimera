/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire [5:0] _03_;
  wire celloutsig_0_0z;
  wire [6:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [4:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [6:0] celloutsig_0_18z;
  wire [7:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [30:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [6:0] celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire [2:0] celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_44z;
  wire [3:0] celloutsig_0_45z;
  wire [7:0] celloutsig_0_46z;
  wire celloutsig_0_4z;
  wire [3:0] celloutsig_0_51z;
  wire [5:0] celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire celloutsig_0_61z;
  wire [2:0] celloutsig_0_63z;
  wire [5:0] celloutsig_0_64z;
  reg [6:0] celloutsig_0_65z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [3:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_12z;
  wire [10:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [3:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [6:0] celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_6z;
  wire [5:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = !(in_data[48] ? in_data[35] : in_data[36]);
  assign celloutsig_0_40z = !(celloutsig_0_9z ? celloutsig_0_18z[0] : celloutsig_0_28z[0]);
  assign celloutsig_0_60z = !(celloutsig_0_15z ? celloutsig_0_38z[0] : celloutsig_0_4z);
  assign celloutsig_1_1z = !(in_data[102] ? celloutsig_1_0z[3] : celloutsig_1_0z[2]);
  assign celloutsig_1_4z = !(celloutsig_1_2z[2] ? celloutsig_1_3z[1] : in_data[156]);
  assign celloutsig_1_6z = !(celloutsig_1_2z[0] ? _00_ : in_data[143]);
  assign celloutsig_1_9z = !(celloutsig_1_3z[1] ? celloutsig_1_4z : celloutsig_1_1z);
  assign celloutsig_0_7z = !(celloutsig_0_1z ? celloutsig_0_2z : in_data[51]);
  assign celloutsig_1_16z = !(celloutsig_1_8z ? celloutsig_1_1z : celloutsig_1_3z[0]);
  assign celloutsig_0_8z = !(in_data[93] ? celloutsig_0_7z : celloutsig_0_4z);
  assign celloutsig_0_9z = !(celloutsig_0_2z ? celloutsig_0_8z : celloutsig_0_0z);
  assign celloutsig_0_14z = !(celloutsig_0_8z ? celloutsig_0_6z : celloutsig_0_3z);
  assign celloutsig_0_15z = !(celloutsig_0_4z ? celloutsig_0_2z : in_data[29]);
  assign celloutsig_0_16z = !(celloutsig_0_11z ? celloutsig_0_8z : celloutsig_0_2z);
  assign celloutsig_0_17z = !(celloutsig_0_1z ? celloutsig_0_0z : celloutsig_0_16z);
  assign celloutsig_0_2z = !(in_data[66] ? celloutsig_0_1z : celloutsig_0_1z);
  assign celloutsig_0_24z = !(celloutsig_0_14z ? celloutsig_0_23z : celloutsig_0_10z[4]);
  assign celloutsig_0_25z = !(celloutsig_0_3z ? in_data[49] : celloutsig_0_24z);
  assign celloutsig_0_27z = ~((celloutsig_0_21z[14] | celloutsig_0_21z[8]) & celloutsig_0_5z[4]);
  assign celloutsig_0_31z = ~((celloutsig_0_23z | celloutsig_0_26z) & celloutsig_0_28z[0]);
  assign celloutsig_0_3z = ~((celloutsig_0_0z | celloutsig_0_1z) & in_data[52]);
  assign celloutsig_0_44z = ~((celloutsig_0_4z | celloutsig_0_38z[0]) & celloutsig_0_3z);
  assign celloutsig_0_4z = ~((celloutsig_0_3z | celloutsig_0_1z) & in_data[66]);
  assign celloutsig_0_61z = ~((celloutsig_0_40z | celloutsig_0_4z) & celloutsig_0_13z);
  assign celloutsig_0_6z = ~((celloutsig_0_0z | celloutsig_0_3z) & celloutsig_0_2z);
  assign celloutsig_1_8z = ~((celloutsig_1_0z[1] | _01_) & celloutsig_1_4z);
  assign celloutsig_1_10z = ~((celloutsig_1_4z | celloutsig_1_2z[1]) & celloutsig_1_4z);
  assign celloutsig_1_12z = ~((_02_ | celloutsig_1_10z) & celloutsig_1_10z);
  assign celloutsig_1_14z = ~((celloutsig_1_13z[6] | celloutsig_1_6z) & celloutsig_1_2z[2]);
  assign celloutsig_1_18z = ~((celloutsig_1_12z | celloutsig_1_6z) & in_data[96]);
  assign celloutsig_0_11z = ~((celloutsig_0_0z | celloutsig_0_2z) & celloutsig_0_9z);
  assign celloutsig_0_1z = ~((in_data[14] | in_data[13]) & in_data[23]);
  assign celloutsig_0_13z = ~((celloutsig_0_3z | celloutsig_0_9z) & celloutsig_0_4z);
  assign celloutsig_0_20z = ~((celloutsig_0_9z | celloutsig_0_14z) & celloutsig_0_19z[4]);
  assign celloutsig_0_22z = ~((celloutsig_0_21z[5] | celloutsig_0_7z) & celloutsig_0_9z);
  assign celloutsig_0_23z = ~((celloutsig_0_7z | celloutsig_0_13z) & celloutsig_0_11z);
  assign celloutsig_0_26z = ~((celloutsig_0_23z | celloutsig_0_21z[17]) & celloutsig_0_24z);
  reg [5:0] _41_;
  always_ff @(negedge clkin_data[96], posedge clkin_data[64])
    if (clkin_data[64]) _41_ <= 6'h00;
    else _41_ <= { in_data[150:149], celloutsig_1_0z };
  assign { _00_, _02_, _03_[3:1], _01_ } = _41_;
  assign celloutsig_0_28z = { celloutsig_0_18z[6], celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_23z } % { 1'h1, celloutsig_0_21z[4:2], celloutsig_0_17z, celloutsig_0_7z, celloutsig_0_25z };
  assign celloutsig_0_38z = { celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_27z } % { 1'h1, celloutsig_0_13z, celloutsig_0_31z };
  assign celloutsig_0_46z = { celloutsig_0_21z[18:15], celloutsig_0_38z, celloutsig_0_22z } % { 1'h1, celloutsig_0_28z[5:0], in_data[0] };
  assign celloutsig_0_5z = { in_data[94:93], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_4z } % { 1'h1, in_data[66:62] };
  assign celloutsig_1_0z = in_data[106:103] % { 1'h1, in_data[145:143] };
  assign celloutsig_1_2z = { in_data[128:126], celloutsig_1_0z } % { 1'h1, in_data[139:138], celloutsig_1_0z[3:1], in_data[96] };
  assign celloutsig_1_7z = { celloutsig_1_2z[0], celloutsig_1_0z, celloutsig_1_4z } % { 1'h1, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_13z = { celloutsig_1_7z[4:3], celloutsig_1_6z, celloutsig_1_4z, _00_, _02_, _03_[3:1], _01_, celloutsig_1_1z } % { 1'h1, celloutsig_1_2z[4:0], celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_1_19z = { in_data[136:134], celloutsig_1_10z } % { 1'h1, celloutsig_1_9z, celloutsig_1_16z, celloutsig_1_14z };
  assign celloutsig_0_10z = { celloutsig_0_9z, celloutsig_0_5z } % { 1'h1, in_data[57:53], celloutsig_0_9z };
  assign celloutsig_0_18z = { celloutsig_0_10z[6:1], celloutsig_0_11z } % { 1'h1, in_data[44:42], celloutsig_0_13z, celloutsig_0_15z, celloutsig_0_15z };
  assign celloutsig_0_19z = { celloutsig_0_18z, celloutsig_0_8z } % { 1'h1, in_data[73:71], celloutsig_0_16z, celloutsig_0_4z, celloutsig_0_14z, celloutsig_0_17z };
  assign celloutsig_0_45z = { celloutsig_0_28z[5:4], celloutsig_0_27z, celloutsig_0_22z } >> { celloutsig_0_17z, celloutsig_0_11z, celloutsig_0_44z, celloutsig_0_7z };
  assign celloutsig_0_51z = { celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_16z, celloutsig_0_22z } >> { celloutsig_0_45z[2:0], celloutsig_0_22z };
  assign celloutsig_0_63z = { celloutsig_0_46z[3:2], celloutsig_0_15z } >> celloutsig_0_45z[2:0];
  assign celloutsig_0_64z = { celloutsig_0_61z, celloutsig_0_20z, celloutsig_0_63z, celloutsig_0_11z } >> { celloutsig_0_51z[2:1], celloutsig_0_45z };
  assign celloutsig_1_3z = { in_data[101:100], celloutsig_1_1z } >> in_data[121:119];
  assign celloutsig_0_12z = { celloutsig_0_10z[5:3], celloutsig_0_8z, celloutsig_0_3z } >> celloutsig_0_5z[5:1];
  assign celloutsig_0_21z = { celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_19z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_7z } >> { celloutsig_0_5z[2:0], celloutsig_0_2z, celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_12z, celloutsig_0_18z };
  always_latch
    if (!celloutsig_1_19z[0]) celloutsig_0_65z = 7'h00;
    else if (clkin_data[32]) celloutsig_0_65z = { celloutsig_0_28z[5:0], celloutsig_0_60z };
  assign { _03_[5:4], _03_[0] } = { _00_, _02_, _01_ };
  assign { out_data[128], out_data[99:96], out_data[37:32], out_data[6:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_64z, celloutsig_0_65z };
endmodule
