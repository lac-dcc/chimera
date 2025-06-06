/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [11:0] _00_;
  wire [17:0] _01_;
  wire [26:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire [7:0] celloutsig_0_15z;
  wire [2:0] celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [13:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [8:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [6:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [57:0] celloutsig_0_27z;
  wire [27:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [4:0] celloutsig_0_31z;
  wire celloutsig_0_37z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire [3:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_4z;
  wire celloutsig_0_55z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_63z;
  wire celloutsig_0_65z;
  wire [14:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_86z;
  wire [5:0] celloutsig_0_87z;
  wire [15:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [2:0] celloutsig_1_15z;
  wire [6:0] celloutsig_1_17z;
  wire [5:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [10:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [15:0] celloutsig_1_3z;
  wire [8:0] celloutsig_1_4z;
  wire [7:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_40z = celloutsig_0_27z[1] ? celloutsig_0_21z : celloutsig_0_4z;
  assign celloutsig_0_10z = celloutsig_0_0z ? celloutsig_0_9z : celloutsig_0_1z[2];
  assign celloutsig_1_13z = celloutsig_1_3z[3] ? celloutsig_1_10z : celloutsig_1_12z;
  assign celloutsig_0_25z = celloutsig_0_23z ? celloutsig_0_15z[1] : celloutsig_0_7z;
  assign celloutsig_0_19z = ~celloutsig_0_0z;
  assign celloutsig_0_37z = ~in_data[74];
  assign celloutsig_0_42z = ~celloutsig_0_26z;
  assign celloutsig_0_43z = ~celloutsig_0_13z;
  assign celloutsig_0_5z = ~celloutsig_0_2z;
  assign celloutsig_1_6z = ~celloutsig_1_4z[3];
  assign celloutsig_0_11z = ~celloutsig_0_8z[2];
  assign celloutsig_0_21z = ~celloutsig_0_20z;
  assign celloutsig_0_30z = ~celloutsig_0_24z[3];
  assign celloutsig_0_47z = ~((celloutsig_0_13z | celloutsig_0_42z) & celloutsig_0_40z);
  assign celloutsig_0_55z = ~((celloutsig_0_31z[3] | celloutsig_0_40z) & celloutsig_0_19z);
  assign celloutsig_1_9z = ~((celloutsig_1_0z[0] | celloutsig_1_8z) & celloutsig_1_1z[8]);
  assign celloutsig_0_20z = ~((in_data[91] | celloutsig_0_5z) & celloutsig_0_18z);
  assign celloutsig_0_86z = celloutsig_0_3z | ~(celloutsig_0_65z);
  assign celloutsig_0_9z = celloutsig_0_1z[11] | ~(celloutsig_0_7z);
  assign celloutsig_0_18z = celloutsig_0_2z | ~(celloutsig_0_16z[2]);
  assign celloutsig_1_18z = { celloutsig_1_15z[2:1], celloutsig_1_14z, celloutsig_1_0z } + { celloutsig_1_4z[8:6], celloutsig_1_13z, celloutsig_1_2z, celloutsig_1_9z };
  reg [26:0] _24_;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _24_ <= 27'h0000000;
    else _24_ <= { in_data[65:50], celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_10z };
  assign { _00_[11:5], _02_[19:16], _01_[17:15], _02_[12:0] } = _24_;
  assign celloutsig_0_87z = { celloutsig_0_14z[2:1], celloutsig_0_2z, celloutsig_0_63z, celloutsig_0_47z, celloutsig_0_55z } & { _02_[19:17], celloutsig_0_25z, celloutsig_0_30z, celloutsig_0_59z };
  assign celloutsig_1_17z = { celloutsig_1_1z[4:0], celloutsig_1_13z, celloutsig_1_7z } & in_data[179:173];
  assign celloutsig_0_17z = celloutsig_0_16z & celloutsig_0_1z[5:3];
  assign celloutsig_0_59z = { celloutsig_0_22z[8:2], celloutsig_0_9z, celloutsig_0_18z } === { in_data[63:60], celloutsig_0_46z, celloutsig_0_43z };
  assign celloutsig_1_7z = in_data[113:108] === { celloutsig_1_5z[5:1], celloutsig_1_6z };
  assign celloutsig_1_8z = celloutsig_1_4z[3:1] === celloutsig_1_3z[15:13];
  assign celloutsig_1_10z = { in_data[187:165], celloutsig_1_9z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_6z } === { in_data[183:168], celloutsig_1_1z };
  assign celloutsig_0_2z = in_data[56:31] === { in_data[22:11], celloutsig_0_1z };
  assign celloutsig_0_26z = { celloutsig_0_11z, celloutsig_0_21z, celloutsig_0_0z } === in_data[13:11];
  assign celloutsig_0_3z = in_data[83:82] === celloutsig_0_1z[1:0];
  assign celloutsig_0_63z = celloutsig_0_23z & ~(celloutsig_0_37z);
  assign celloutsig_1_12z = celloutsig_1_1z[7] & ~(celloutsig_1_7z);
  assign celloutsig_0_12z = celloutsig_0_7z & ~(celloutsig_0_11z);
  assign celloutsig_0_1z = { in_data[18:6], celloutsig_0_0z } % { 1'h1, in_data[80:68] };
  assign celloutsig_1_1z = { in_data[137:133], celloutsig_1_0z, celloutsig_1_0z } * { in_data[165:164], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_22z = { celloutsig_0_15z, celloutsig_0_7z } * { celloutsig_0_6z[12:9], celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_5z, celloutsig_0_19z, celloutsig_0_20z };
  assign celloutsig_0_0z = & in_data[87:78];
  assign celloutsig_0_7z = & { celloutsig_0_6z[10], celloutsig_0_3z, in_data[87:78] };
  assign celloutsig_1_14z = & { celloutsig_1_13z, celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_1z[10:5] };
  assign celloutsig_1_19z = & { celloutsig_1_18z, celloutsig_1_17z, celloutsig_1_15z, celloutsig_1_13z, celloutsig_1_8z, celloutsig_1_5z };
  assign celloutsig_0_13z = & { celloutsig_0_6z[2:0], in_data[87:78] };
  assign celloutsig_0_6z = { in_data[79:66], celloutsig_0_3z } <<< { in_data[8:2], celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_0_8z = { celloutsig_0_6z[14:1], celloutsig_0_2z, celloutsig_0_2z } <<< { celloutsig_0_1z[13:1], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_1_3z = { in_data[179:176], celloutsig_1_1z, celloutsig_1_2z } <<< { in_data[176:172], celloutsig_1_1z };
  assign celloutsig_1_15z = { celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_2z } <<< celloutsig_1_3z[10:8];
  assign celloutsig_0_31z = { celloutsig_0_6z[1], celloutsig_0_16z, celloutsig_0_9z } <<< { celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_16z };
  assign celloutsig_1_4z = celloutsig_1_3z[9:1] - in_data[105:97];
  assign celloutsig_0_24z = celloutsig_0_22z[7:1] - { celloutsig_0_11z, celloutsig_0_21z, celloutsig_0_21z, celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_29z = { celloutsig_0_22z[5:3], celloutsig_0_23z, celloutsig_0_18z, celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_20z, celloutsig_0_1z } - { celloutsig_0_27z[31:17], celloutsig_0_17z, celloutsig_0_15z, celloutsig_0_13z, celloutsig_0_7z };
  assign celloutsig_0_46z = celloutsig_0_29z[25:22] ^ celloutsig_0_31z[3:0];
  assign celloutsig_1_0z = in_data[124:122] ^ in_data[163:161];
  assign celloutsig_1_5z = { in_data[114:110], celloutsig_1_0z } ^ celloutsig_1_4z[7:0];
  assign celloutsig_0_14z = { celloutsig_0_8z[13], celloutsig_0_4z, celloutsig_0_5z } ^ { celloutsig_0_1z[10:9], celloutsig_0_12z };
  assign celloutsig_0_15z = { celloutsig_0_8z[3:1], celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_4z } ^ celloutsig_0_1z[7:0];
  assign celloutsig_0_16z = { celloutsig_0_1z[7:6], celloutsig_0_4z } ^ { celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_13z };
  assign celloutsig_0_27z = { in_data[73:56], celloutsig_0_0z, celloutsig_0_15z, celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_25z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_11z, celloutsig_0_21z, celloutsig_0_24z } ^ { celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_22z, celloutsig_0_10z, celloutsig_0_17z, celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_1z, celloutsig_0_19z, celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_18z, celloutsig_0_22z, celloutsig_0_14z, celloutsig_0_9z, celloutsig_0_12z };
  assign celloutsig_0_4z = ~((celloutsig_0_0z & celloutsig_0_0z) | (celloutsig_0_0z & celloutsig_0_3z));
  assign celloutsig_0_65z = ~((celloutsig_0_55z & celloutsig_0_11z) | (celloutsig_0_26z & celloutsig_0_63z));
  assign celloutsig_1_2z = ~((in_data[118] & celloutsig_1_0z[2]) | (in_data[147] & celloutsig_1_0z[0]));
  assign celloutsig_1_11z = ~((celloutsig_1_8z & celloutsig_1_10z) | (celloutsig_1_8z & celloutsig_1_10z));
  assign celloutsig_0_23z = ~((celloutsig_0_4z & celloutsig_0_19z) | (celloutsig_0_8z[14] & celloutsig_0_6z[4]));
  assign _00_[4:0] = celloutsig_0_31z;
  assign { _02_[26:20], _02_[15:13] } = { _00_[11:5], _01_[17:15] };
  assign { out_data[133:128], out_data[96], out_data[32], out_data[5:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_86z, celloutsig_0_87z };
endmodule
