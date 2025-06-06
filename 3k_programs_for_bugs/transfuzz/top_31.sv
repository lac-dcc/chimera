/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_13z;
  reg [5:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [10:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [6:0] celloutsig_0_1z;
  wire [8:0] celloutsig_0_20z;
  wire [14:0] celloutsig_0_21z;
  wire [5:0] celloutsig_0_22z;
  wire [14:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [2:0] celloutsig_0_25z;
  wire [5:0] celloutsig_0_26z;
  wire [4:0] celloutsig_0_27z;
  wire [13:0] celloutsig_0_28z;
  wire celloutsig_0_30z;
  wire [6:0] celloutsig_0_31z;
  wire [5:0] celloutsig_0_32z;
  wire celloutsig_0_38z;
  wire [11:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  reg [25:0] celloutsig_0_52z;
  wire celloutsig_0_56z;
  reg [15:0] celloutsig_0_5z;
  wire [15:0] celloutsig_0_68z;
  wire [6:0] celloutsig_0_6z;
  wire celloutsig_0_78z;
  wire [7:0] celloutsig_0_79z;
  wire [6:0] celloutsig_0_7z;
  reg [4:0] celloutsig_0_8z;
  wire [14:0] celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire [9:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire [13:0] celloutsig_1_15z;
  wire [4:0] celloutsig_1_18z;
  wire [6:0] celloutsig_1_19z;
  wire [12:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire [9:0] celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[75] ^ in_data[36];
  assign celloutsig_0_78z = celloutsig_0_56z ^ celloutsig_0_14z[2];
  assign celloutsig_1_13z = celloutsig_1_2z ^ celloutsig_1_8z;
  assign celloutsig_1_14z = celloutsig_1_2z ^ in_data[114];
  assign celloutsig_0_13z = celloutsig_0_4z ^ celloutsig_0_3z[8];
  assign celloutsig_0_18z = celloutsig_0_10z ^ celloutsig_0_0z;
  assign celloutsig_0_30z = in_data[94:71] <= { celloutsig_0_3z[9:1], celloutsig_0_6z, celloutsig_0_1z[5:1], celloutsig_0_25z[2:1], celloutsig_0_24z };
  assign celloutsig_0_38z = celloutsig_0_31z[6:4] <= { celloutsig_0_32z[5:4], celloutsig_0_13z };
  assign celloutsig_0_4z = celloutsig_0_3z[10:7] <= celloutsig_0_1z[4:1];
  assign celloutsig_1_4z = in_data[104:100] <= { in_data[140:137], celloutsig_1_3z };
  assign celloutsig_1_9z = { celloutsig_1_1z[6:0], celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_3z } <= { in_data[144:138], celloutsig_1_0z };
  assign celloutsig_0_15z = celloutsig_0_8z[3:1] <= celloutsig_0_8z[2:0];
  assign celloutsig_0_16z = celloutsig_0_1z[5:0] <= { celloutsig_0_14z[3:1], celloutsig_0_15z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_32z = celloutsig_0_22z[0] ? { celloutsig_0_9z[6], celloutsig_0_8z } : { celloutsig_0_9z[14:12], celloutsig_0_25z[2:1], celloutsig_0_24z };
  assign celloutsig_0_3z = in_data[38] ? in_data[84:73] : { in_data[13:3], celloutsig_0_0z };
  assign celloutsig_1_1z = in_data[114] ? in_data[174:162] : in_data[157:145];
  assign celloutsig_1_5z = celloutsig_1_0z[1] ? { in_data[176:169], celloutsig_1_2z } : { in_data[155:150], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_1_6z = celloutsig_1_5z[8] ? { celloutsig_1_1z[8], 1'h1, celloutsig_1_5z[7:0] } : { celloutsig_1_1z[9:1], celloutsig_1_4z };
  assign celloutsig_1_15z = celloutsig_1_8z ? { celloutsig_1_0z[1:0], celloutsig_1_14z, celloutsig_1_11z, celloutsig_1_6z } : { celloutsig_1_10z[4:0], celloutsig_1_5z };
  assign celloutsig_0_17z = celloutsig_0_4z ? { in_data[18:9], celloutsig_0_10z } : { celloutsig_0_5z[11:8], celloutsig_0_7z };
  assign celloutsig_0_20z = celloutsig_0_18z ? { celloutsig_0_17z[9:7], celloutsig_0_16z, celloutsig_0_1z[5:1] } : { 1'h0, celloutsig_0_7z, celloutsig_0_10z };
  assign celloutsig_0_22z = celloutsig_0_20z[7] ? { celloutsig_0_1z[3], celloutsig_0_8z } : celloutsig_0_7z[6:1];
  assign celloutsig_0_25z[2:1] = celloutsig_0_8z[4] ? { celloutsig_0_14z[0], celloutsig_0_0z } : { celloutsig_0_1z[1], celloutsig_0_24z };
  assign celloutsig_0_28z = celloutsig_0_21z[6] ? { celloutsig_0_26z[4:2], celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_20z } : { celloutsig_0_27z[3:1], celloutsig_0_17z };
  assign celloutsig_0_56z = | { celloutsig_0_38z, celloutsig_0_20z[7:3], celloutsig_0_17z };
  assign celloutsig_1_2z = | in_data[148:136];
  assign celloutsig_1_3z = | { celloutsig_1_1z, in_data[165:157] };
  assign celloutsig_1_8z = | celloutsig_1_6z[9:3];
  assign celloutsig_1_11z = | { celloutsig_1_6z[9:3], celloutsig_1_4z, celloutsig_1_1z, in_data[165:157], in_data[148:136], in_data[107] };
  assign celloutsig_0_10z = | in_data[51:31];
  assign celloutsig_0_24z = | celloutsig_0_1z[3:1];
  assign celloutsig_0_7z = celloutsig_0_6z >> { celloutsig_0_5z[3:0], celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_79z = celloutsig_0_28z[10:3] >> { celloutsig_0_68z[0], celloutsig_0_31z };
  assign celloutsig_1_0z = in_data[187:185] >> in_data[129:127];
  assign celloutsig_1_18z = in_data[125:121] >> celloutsig_1_6z[4:0];
  assign celloutsig_0_1z = in_data[6:0] >> { in_data[63:59], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_23z = { celloutsig_0_17z[8:7], celloutsig_0_22z, celloutsig_0_1z } >> { celloutsig_0_22z[4:1], celloutsig_0_1z[5:1], celloutsig_0_14z };
  assign celloutsig_0_26z = celloutsig_0_5z[12:7] >> celloutsig_0_21z[8:3];
  assign celloutsig_0_31z = { celloutsig_0_30z, celloutsig_0_0z, celloutsig_0_27z } << celloutsig_0_21z[12:6];
  assign celloutsig_0_6z = in_data[21:15] << { celloutsig_0_5z[7:2], celloutsig_0_4z };
  assign celloutsig_0_68z = { celloutsig_0_17z[9], celloutsig_0_9z } << celloutsig_0_52z[18:3];
  assign celloutsig_1_10z = { celloutsig_1_1z[8:0], celloutsig_1_3z } << { celloutsig_1_6z[8:0], celloutsig_1_9z };
  assign celloutsig_1_19z = { celloutsig_1_15z[13:10], celloutsig_1_13z, celloutsig_1_3z, celloutsig_1_9z } << celloutsig_1_6z[7:1];
  assign celloutsig_0_9z = { celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_7z } << celloutsig_0_5z[14:0];
  assign celloutsig_0_21z = { celloutsig_0_8z[1:0], celloutsig_0_1z[5:1], celloutsig_0_16z, celloutsig_0_1z } << { celloutsig_0_5z[14:1], celloutsig_0_4z };
  assign celloutsig_0_27z = celloutsig_0_14z[4:0] << { celloutsig_0_5z[7:4], celloutsig_0_24z };
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_52z = 26'h0000000;
    else if (!clkin_data[0]) celloutsig_0_52z = { celloutsig_0_23z[11:1], celloutsig_0_28z, celloutsig_0_30z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_5z = 16'h0000;
    else if (clkin_data[0]) celloutsig_0_5z = { in_data[80:77], celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_1z[5:1], celloutsig_0_1z[5:1] };
  always_latch
    if (!clkin_data[32]) celloutsig_0_8z = 5'h00;
    else if (clkin_data[0]) celloutsig_0_8z = celloutsig_0_3z[10:6];
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_14z = 6'h00;
    else if (!clkin_data[0]) celloutsig_0_14z = { celloutsig_0_6z[5:1], celloutsig_0_0z };
  assign celloutsig_0_25z[0] = celloutsig_0_24z;
  assign { out_data[132:128], out_data[102:96], out_data[32], out_data[7:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_78z, celloutsig_0_79z };
endmodule
