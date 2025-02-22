/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  reg [3:0] _02_;
  wire [2:0] _03_;
  wire [6:0] _04_;
  wire [5:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [6:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [6:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [2:0] celloutsig_0_23z;
  wire [2:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [8:0] celloutsig_0_30z;
  wire [3:0] celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire celloutsig_0_37z;
  wire celloutsig_0_43z;
  wire [13:0] celloutsig_0_45z;
  wire [7:0] celloutsig_0_47z;
  wire celloutsig_0_4z;
  wire [10:0] celloutsig_0_57z;
  wire [12:0] celloutsig_0_5z;
  wire celloutsig_0_64z;
  wire [8:0] celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_8z;
  wire [18:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [8:0] celloutsig_1_12z;
  wire celloutsig_1_17z;
  wire [17:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [24:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [12:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [6:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_3z = ~((celloutsig_1_1z | celloutsig_1_0z) & (celloutsig_1_2z[13] | in_data[158]));
  assign celloutsig_0_8z = ~((celloutsig_0_5z[11] | celloutsig_0_5z[5]) & (celloutsig_0_2z | celloutsig_0_0z[4]));
  assign celloutsig_0_1z = ~((in_data[10] | in_data[14]) & (in_data[62] | in_data[3]));
  assign celloutsig_0_10z = ~((celloutsig_0_0z[1] | celloutsig_0_1z) & (in_data[56] | celloutsig_0_0z[0]));
  assign celloutsig_0_19z = ~((in_data[8] | in_data[75]) & (celloutsig_0_4z | in_data[8]));
  assign celloutsig_0_22z = ~((celloutsig_0_16z | celloutsig_0_11z[4]) & (celloutsig_0_1z | celloutsig_0_0z[4]));
  assign celloutsig_0_2z = ~((celloutsig_0_1z | in_data[34]) & (celloutsig_0_0z[4] | celloutsig_0_0z[3]));
  assign celloutsig_0_25z = ~((celloutsig_0_6z[4] | celloutsig_0_15z) & (celloutsig_0_10z | celloutsig_0_8z));
  assign celloutsig_0_34z = ~(celloutsig_0_24z[0] ^ celloutsig_0_0z[5]);
  assign celloutsig_0_43z = ~(celloutsig_0_16z ^ celloutsig_0_14z[1]);
  assign celloutsig_0_4z = ~(celloutsig_0_0z[5] ^ in_data[65]);
  assign celloutsig_0_70z = ~(celloutsig_0_37z ^ celloutsig_0_43z);
  assign celloutsig_1_1z = ~(celloutsig_1_0z ^ in_data[140]);
  assign celloutsig_1_7z = ~(celloutsig_1_2z[15] ^ celloutsig_1_6z[3]);
  assign celloutsig_1_8z = ~(in_data[109] ^ celloutsig_1_7z);
  assign celloutsig_0_15z = ~(celloutsig_0_12z ^ celloutsig_0_11z[5]);
  always_ff @(posedge clkin_data[32], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _02_ <= 4'h0;
    else _02_ <= { celloutsig_0_19z, celloutsig_0_12z, celloutsig_0_34z, celloutsig_0_4z };
  reg [2:0] _22_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z[0])
    if (!celloutsig_1_18z[0]) _22_ <= 3'h0;
    else _22_ <= _02_[2:0];
  assign { _03_[2:1], _01_ } = _22_;
  reg [16:0] _23_;
  always_ff @(negedge clkin_data[32], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _23_ <= 17'h00000;
    else _23_ <= { celloutsig_0_45z[6:5], celloutsig_0_64z, celloutsig_0_30z, celloutsig_0_32z, celloutsig_0_22z };
  assign out_data[48:32] = _23_;
  reg [6:0] _24_;
  always_ff @(posedge clkin_data[32], posedge celloutsig_1_18z[0])
    if (celloutsig_1_18z[0]) _24_ <= 7'h00;
    else _24_ <= { in_data[19:14], celloutsig_0_4z };
  assign { _00_, _04_[5:0] } = _24_;
  assign celloutsig_0_0z = - in_data[83:78];
  assign celloutsig_0_30z = - { celloutsig_0_21z, celloutsig_0_23z, celloutsig_0_16z, celloutsig_0_24z, celloutsig_0_4z };
  assign celloutsig_0_32z = - { celloutsig_0_23z[2], celloutsig_0_23z };
  assign celloutsig_0_45z = - celloutsig_0_9z[18:5];
  assign celloutsig_0_47z = - { celloutsig_0_30z[7:2], celloutsig_0_21z, celloutsig_0_25z };
  assign celloutsig_0_57z = - { celloutsig_0_47z[6:0], celloutsig_0_29z, _03_[2:1], _01_ };
  assign celloutsig_0_5z = - { in_data[75:71], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_6z = - { celloutsig_0_5z[2:0], celloutsig_0_0z };
  assign celloutsig_1_2z = - { in_data[135:113], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_4z = - { in_data[136:125], celloutsig_1_1z };
  assign celloutsig_1_6z = - celloutsig_1_4z[9:3];
  assign celloutsig_1_12z = - { celloutsig_1_5z, celloutsig_1_6z, celloutsig_1_3z };
  assign celloutsig_1_18z = - { celloutsig_1_2z[20:14], celloutsig_1_17z, celloutsig_1_1z, celloutsig_1_12z };
  assign celloutsig_0_9z = - in_data[31:13];
  assign celloutsig_0_11z = - { celloutsig_0_9z[16:11], celloutsig_0_10z };
  assign celloutsig_0_14z = - { celloutsig_0_0z[5:1], celloutsig_0_8z, celloutsig_0_12z };
  assign celloutsig_0_23z = - celloutsig_0_14z[6:4];
  assign celloutsig_0_24z = - { celloutsig_0_14z[1:0], celloutsig_0_16z };
  assign celloutsig_0_29z = celloutsig_0_4z & _04_[1];
  assign celloutsig_0_37z = celloutsig_0_25z & celloutsig_0_23z[1];
  assign celloutsig_0_64z = celloutsig_0_57z[7] & celloutsig_0_24z[2];
  assign celloutsig_1_0z = in_data[151] & in_data[107];
  assign celloutsig_1_5z = in_data[113] & celloutsig_1_2z[16];
  assign celloutsig_1_17z = celloutsig_1_6z[0] & celloutsig_1_2z[10];
  assign celloutsig_1_19z = celloutsig_1_2z[22] & celloutsig_1_8z;
  assign celloutsig_0_12z = _04_[2] & celloutsig_0_10z;
  assign celloutsig_0_16z = celloutsig_0_1z & celloutsig_0_10z;
  assign celloutsig_0_21z = in_data[27] & in_data[43];
  assign _03_[0] = _01_;
  assign _04_[6] = _00_;
  assign { out_data[145:128], out_data[96], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_70z };
endmodule
