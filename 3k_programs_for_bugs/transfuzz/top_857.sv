/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [10:0] _00_;
  wire celloutsig_0_0z;
  wire [13:0] celloutsig_0_11z;
  reg [9:0] celloutsig_0_12z;
  reg [7:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [25:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire [5:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [8:0] celloutsig_0_23z;
  reg [3:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire [14:0] celloutsig_0_3z;
  wire [2:0] celloutsig_0_40z;
  wire [20:0] celloutsig_0_41z;
  wire celloutsig_0_46z;
  wire [4:0] celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_52z;
  wire [2:0] celloutsig_0_53z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [10:0] celloutsig_0_9z;
  wire [10:0] celloutsig_1_0z;
  wire [7:0] celloutsig_1_10z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire [7:0] celloutsig_1_18z;
  wire [2:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_4z = ~(in_data[102] & celloutsig_1_2z);
  assign celloutsig_1_7z = ~(celloutsig_1_0z[4] & in_data[133]);
  assign celloutsig_1_16z = ~(in_data[186] & celloutsig_1_14z);
  assign celloutsig_0_17z = ~(celloutsig_0_9z[6] & celloutsig_0_16z);
  assign celloutsig_0_20z = ~celloutsig_0_1z[4];
  assign celloutsig_0_0z = ~((in_data[52] | in_data[39]) & in_data[25]);
  assign celloutsig_0_4z = ~((celloutsig_0_3z[11] | celloutsig_0_3z[7]) & celloutsig_0_0z);
  assign celloutsig_1_8z = ~((celloutsig_1_19z[2] | celloutsig_1_19z[0]) & celloutsig_1_0z[0]);
  assign celloutsig_1_14z = ~((celloutsig_1_13z | celloutsig_1_19z[2]) & celloutsig_1_5z);
  assign celloutsig_0_8z = ~((celloutsig_0_0z | celloutsig_0_1z[4]) & celloutsig_0_6z);
  assign celloutsig_0_28z = ~((celloutsig_0_13z[2] | celloutsig_0_15z[23]) & celloutsig_0_1z[0]);
  assign celloutsig_0_5z = ~((celloutsig_0_2z | celloutsig_0_3z[10]) & (celloutsig_0_4z | celloutsig_0_4z));
  assign celloutsig_1_1z = celloutsig_1_0z[4] | in_data[188];
  assign celloutsig_1_3z = celloutsig_1_0z[4] | celloutsig_1_1z;
  assign celloutsig_0_6z = celloutsig_0_5z | in_data[41];
  assign celloutsig_0_7z = celloutsig_0_6z | celloutsig_0_2z;
  assign celloutsig_0_14z = celloutsig_0_2z | celloutsig_0_9z[3];
  assign celloutsig_0_21z = celloutsig_0_0z | celloutsig_0_9z[7];
  assign celloutsig_0_30z = celloutsig_0_20z | celloutsig_0_6z;
  assign celloutsig_0_34z = celloutsig_0_15z[16] ^ celloutsig_0_17z;
  assign celloutsig_1_5z = celloutsig_1_2z ^ celloutsig_1_4z;
  assign celloutsig_0_16z = celloutsig_0_6z ^ celloutsig_0_11z[9];
  assign celloutsig_1_10z = { celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_19z, celloutsig_1_19z } + { celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_4z, celloutsig_1_19z, celloutsig_1_4z, celloutsig_1_8z };
  assign celloutsig_1_18z = celloutsig_1_0z[9:2] + { celloutsig_1_10z[6:1], celloutsig_1_4z, celloutsig_1_16z };
  always_ff @(posedge clkin_data[32], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _00_ <= 11'h000;
    else _00_ <= { celloutsig_0_9z[5], celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_22z, celloutsig_0_6z, celloutsig_0_16z, celloutsig_0_0z, celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_21z };
  assign celloutsig_0_40z = { celloutsig_0_12z[4], celloutsig_0_4z, celloutsig_0_7z } & { celloutsig_0_3z[11:10], celloutsig_0_29z };
  assign celloutsig_0_11z = { celloutsig_0_3z[12:9], celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_6z } & { celloutsig_0_9z[5:1], celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_6z };
  assign celloutsig_1_19z = { celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_5z } / { 1'h1, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_0_1z = { in_data[17:13], celloutsig_0_0z } / { 1'h1, in_data[67:63] };
  assign celloutsig_0_36z = in_data[30:3] >= { celloutsig_0_9z[7:1], celloutsig_0_17z, celloutsig_0_27z, celloutsig_0_34z, celloutsig_0_3z };
  assign celloutsig_0_19z = { celloutsig_0_9z[9:6], celloutsig_0_8z, celloutsig_0_17z, celloutsig_0_7z, celloutsig_0_17z } && celloutsig_0_15z[17:10];
  assign celloutsig_0_22z = { celloutsig_0_15z[15:13], celloutsig_0_13z, celloutsig_0_12z } && { in_data[49:45], celloutsig_0_14z, celloutsig_0_19z, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_20z, celloutsig_0_0z };
  assign celloutsig_0_29z = celloutsig_0_23z[8:2] && celloutsig_0_12z[7:1];
  assign celloutsig_0_15z = { celloutsig_0_11z[13:4], celloutsig_0_13z, celloutsig_0_13z } % { 1'h1, in_data[45:22], celloutsig_0_6z };
  assign celloutsig_0_2z = | in_data[59:53];
  assign celloutsig_0_46z = in_data[61] & celloutsig_0_28z;
  assign celloutsig_0_52z = celloutsig_0_15z[3] & celloutsig_0_20z;
  assign celloutsig_1_0z = in_data[187:177] >> in_data[166:156];
  assign celloutsig_0_9z = { in_data[87:79], celloutsig_0_6z, celloutsig_0_0z } >> { celloutsig_0_1z[2:0], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_41z = { celloutsig_0_28z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_23z, celloutsig_0_13z } <<< { celloutsig_0_15z[24:7], celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_22z };
  assign celloutsig_0_23z = celloutsig_0_3z[14:6] <<< in_data[14:6];
  assign celloutsig_0_3z = { celloutsig_0_1z[3:2], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z } - { in_data[6:4], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_0_47z = { celloutsig_0_16z, celloutsig_0_5z, celloutsig_0_30z, celloutsig_0_21z, celloutsig_0_36z } - celloutsig_0_41z[12:8];
  assign celloutsig_0_53z = celloutsig_0_40z - { celloutsig_0_1z[5], celloutsig_0_0z, celloutsig_0_48z };
  assign celloutsig_1_2z = ~((in_data[170] & celloutsig_1_1z) | in_data[190]);
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_12z = 10'h000;
    else if (clkin_data[0]) celloutsig_0_12z = { in_data[12:11], celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_7z };
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_13z = 8'h00;
    else if (clkin_data[0]) celloutsig_0_13z = { celloutsig_0_3z[9], celloutsig_0_1z, celloutsig_0_8z };
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_27z = 4'h0;
    else if (!clkin_data[0]) celloutsig_0_27z = celloutsig_0_15z[4:1];
  assign celloutsig_0_48z = ~((celloutsig_0_46z & celloutsig_0_7z) | (celloutsig_0_47z[1] & _00_[5]));
  assign celloutsig_1_13z = ~((celloutsig_1_8z & celloutsig_1_3z) | (celloutsig_1_10z[3] & in_data[154]));
  assign { out_data[135:128], out_data[98:96], out_data[32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_52z, celloutsig_0_53z };
endmodule
