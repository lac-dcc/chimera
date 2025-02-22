/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [12:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [4:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_39z;
  wire [14:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_4z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [17:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [2:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_40z = ~(celloutsig_0_15z & celloutsig_0_39z);
  assign celloutsig_1_1z = ~(in_data[166] & in_data[171]);
  assign celloutsig_1_5z = ~(celloutsig_1_4z & in_data[106]);
  assign celloutsig_1_16z = ~(celloutsig_1_3z & celloutsig_1_2z);
  assign celloutsig_0_12z = ~(celloutsig_0_8z & celloutsig_0_3z[9]);
  assign celloutsig_0_14z = ~(celloutsig_0_5z[0] & celloutsig_0_9z);
  assign celloutsig_0_26z = ~(celloutsig_0_9z & celloutsig_0_20z);
  assign celloutsig_1_2z = !(celloutsig_1_1z ? in_data[110] : in_data[188]);
  assign celloutsig_1_7z = !(celloutsig_1_6z[2] ? celloutsig_1_3z : celloutsig_1_2z);
  assign celloutsig_1_18z = !(celloutsig_1_6z[0] ? celloutsig_1_5z : celloutsig_1_7z);
  assign celloutsig_0_8z = !(celloutsig_0_2z ? celloutsig_0_3z[13] : celloutsig_0_1z);
  assign celloutsig_1_0z = ~in_data[108];
  assign celloutsig_0_10z = ~celloutsig_0_6z;
  assign celloutsig_0_13z = ~celloutsig_0_2z;
  assign celloutsig_1_10z = ~((celloutsig_1_4z | celloutsig_1_1z) & (celloutsig_1_9z | celloutsig_1_5z));
  assign celloutsig_0_6z = ~((celloutsig_0_1z | in_data[89]) & (celloutsig_0_3z[4] | celloutsig_0_0z));
  assign celloutsig_0_1z = ~((celloutsig_0_0z | in_data[3]) & (in_data[30] | in_data[7]));
  assign celloutsig_0_22z = ~((celloutsig_0_9z | celloutsig_0_21z[2]) & (celloutsig_0_11z | celloutsig_0_2z));
  assign celloutsig_0_4z = celloutsig_0_1z | ~(celloutsig_0_2z);
  assign celloutsig_1_12z = celloutsig_1_0z | ~(celloutsig_1_9z);
  assign celloutsig_0_17z = celloutsig_0_9z | ~(celloutsig_0_15z);
  assign celloutsig_0_23z = celloutsig_0_20z | ~(celloutsig_0_11z);
  assign celloutsig_0_3z = { in_data[23:10], celloutsig_0_0z } + { in_data[67:56], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_1_6z = { celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z } + { celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_0_5z = { in_data[77], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_1z } + { celloutsig_0_3z[5:2], celloutsig_0_1z };
  assign celloutsig_1_19z = { in_data[167:164], celloutsig_1_8z, celloutsig_1_16z, celloutsig_1_11z, celloutsig_1_18z, celloutsig_1_16z, celloutsig_1_16z, celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_9z, celloutsig_1_18z, celloutsig_1_14z, celloutsig_1_17z, celloutsig_1_9z, celloutsig_1_7z } + { in_data[152:137], celloutsig_1_18z, celloutsig_1_8z };
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[0])
    if (clkin_data[0]) _00_ <= 13'h0000;
    else _00_ <= { celloutsig_0_5z[4:1], celloutsig_0_13z, celloutsig_0_12z, celloutsig_0_4z, celloutsig_0_15z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_17z, celloutsig_0_12z, celloutsig_0_12z };
  assign celloutsig_1_17z = { celloutsig_1_6z[0], celloutsig_1_16z, celloutsig_1_5z } === { celloutsig_1_4z, celloutsig_1_12z, celloutsig_1_3z };
  assign celloutsig_0_15z = { in_data[91:81], celloutsig_0_2z } === { celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_11z };
  assign celloutsig_1_4z = { celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z } >= { in_data[176:174], celloutsig_1_0z };
  assign celloutsig_1_9z = in_data[178:165] >= { in_data[111:101], celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_3z };
  assign celloutsig_0_24z = { _00_[11:4], celloutsig_0_6z } >= { celloutsig_0_3z[11:4], celloutsig_0_13z };
  assign celloutsig_1_14z = ! { celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_10z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_12z, celloutsig_1_9z, celloutsig_1_1z, celloutsig_1_11z, in_data[108] };
  assign celloutsig_0_39z = { in_data[46:42], celloutsig_0_22z, celloutsig_0_31z } < { in_data[21:19], celloutsig_0_6z, celloutsig_0_26z, celloutsig_0_22z, celloutsig_0_12z };
  assign celloutsig_1_3z = { in_data[145:135], celloutsig_1_0z } < { in_data[121:111], celloutsig_1_1z };
  assign celloutsig_0_9z = { celloutsig_0_5z[3:0], celloutsig_0_1z } < in_data[13:9];
  assign celloutsig_0_31z = { celloutsig_0_21z[4], celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_22z, celloutsig_0_23z, celloutsig_0_24z, celloutsig_0_4z, celloutsig_0_26z, celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_8z } < { celloutsig_0_5z[4:1], celloutsig_0_8z, celloutsig_0_24z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_17z };
  assign celloutsig_0_21z = { _00_[9:7], celloutsig_0_12z, celloutsig_0_4z } % { 1'h1, celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_9z };
  assign celloutsig_1_8z = { celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_2z } != { celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_7z };
  assign celloutsig_1_11z = { celloutsig_1_6z, celloutsig_1_9z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_1z } != { celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_7z };
  assign celloutsig_0_20z = { celloutsig_0_5z[3:1], celloutsig_0_13z, celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_17z } != { celloutsig_0_3z[4], celloutsig_0_11z, celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_0_2z = | { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_0z = | in_data[8:3];
  assign celloutsig_0_11z = | { celloutsig_0_6z, celloutsig_0_3z[11:1] };
  assign { out_data[128], out_data[113:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_39z, celloutsig_0_40z };
endmodule
