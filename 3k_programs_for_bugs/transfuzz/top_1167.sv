/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [16:0] _00_;
  reg [5:0] _01_;
  reg [12:0] _02_;
  reg [7:0] _03_;
  wire [45:0] _04_;
  wire celloutsig_0_10z;
  wire [6:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire [10:0] celloutsig_0_15z;
  wire [9:0] celloutsig_0_16z;
  wire [4:0] celloutsig_0_17z;
  wire [16:0] celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [5:0] celloutsig_0_26z;
  wire [3:0] celloutsig_0_27z;
  wire celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [8:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_3z;
  wire [6:0] celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire celloutsig_0_45z;
  wire celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [7:0] celloutsig_0_51z;
  wire celloutsig_0_5z;
  wire [22:0] celloutsig_0_60z;
  wire celloutsig_0_66z;
  wire [13:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [3:0] celloutsig_0_94z;
  wire [2:0] celloutsig_0_95z;
  wire [17:0] celloutsig_0_9z;
  wire [16:0] celloutsig_1_0z;
  wire [9:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [12:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [5:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [6:0] celloutsig_1_3z;
  wire [7:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [2:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_33z = !(celloutsig_0_9z[0] ? celloutsig_0_21z : celloutsig_0_7z);
  assign celloutsig_1_11z = !(in_data[103] ? celloutsig_1_4z[4] : celloutsig_1_10z[3]);
  assign celloutsig_0_13z = !(celloutsig_0_8z ? celloutsig_0_12z : celloutsig_0_6z[10]);
  always_ff @(negedge celloutsig_1_19z[0], negedge clkin_data[32])
    if (!clkin_data[32]) _01_ <= 6'h00;
    else _01_ <= in_data[11:6];
  always_ff @(posedge celloutsig_1_19z[0], negedge clkin_data[32])
    if (!clkin_data[32]) _02_ <= 13'h0000;
    else _02_ <= { celloutsig_0_15z[8:1], celloutsig_0_17z };
  always_ff @(negedge clkin_data[0], negedge clkin_data[32])
    if (!clkin_data[32]) _03_ <= 8'h00;
    else _03_ <= celloutsig_0_9z[10:3];
  reg [45:0] _11_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[32])
    if (clkin_data[32]) _11_ <= 46'h000000000000;
    else _11_ <= { celloutsig_0_9z[16:5], celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_21z, celloutsig_0_6z };
  assign { _00_[16:1], _04_[29:0] } = _11_;
  assign celloutsig_0_7z = in_data[51:39] === { _01_, celloutsig_0_1z, _01_ };
  assign celloutsig_0_4z = _01_[2:0] > in_data[60:58];
  assign celloutsig_1_2z = in_data[129:127] > celloutsig_1_0z[15:13];
  assign celloutsig_1_15z = { celloutsig_1_4z[3:2], celloutsig_1_6z } > { celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_11z };
  assign celloutsig_0_3z = in_data[87:80] <= in_data[83:76];
  assign celloutsig_0_42z = { _03_, celloutsig_0_35z } <= { celloutsig_0_18z[13:10], celloutsig_0_31z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_35z };
  assign celloutsig_0_45z = { celloutsig_0_11z[4:3], celloutsig_0_7z } <= celloutsig_0_27z[2:0];
  assign celloutsig_0_49z = { _00_[14:10], celloutsig_0_5z } <= celloutsig_0_18z[10:5];
  assign celloutsig_1_6z = { celloutsig_1_3z[5], celloutsig_1_2z, celloutsig_1_3z } <= { in_data[146:140], celloutsig_1_5z, celloutsig_1_2z };
  assign celloutsig_1_9z = celloutsig_1_0z[5:3] <= in_data[146:144];
  assign celloutsig_0_10z = { celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_2z } <= celloutsig_0_6z[4:2];
  assign celloutsig_0_31z = { celloutsig_0_8z, celloutsig_0_26z, celloutsig_0_17z, celloutsig_0_21z, celloutsig_0_23z, celloutsig_0_27z } && { _01_[4], celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_4z, celloutsig_0_17z, celloutsig_0_7z };
  assign celloutsig_1_5z = in_data[172:170] && celloutsig_1_3z[6:4];
  assign celloutsig_1_13z = { celloutsig_1_0z[8:4], celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_12z, celloutsig_1_1z, celloutsig_1_10z[9:3], celloutsig_1_10z[7:5] } && { celloutsig_1_10z[8:3], celloutsig_1_10z[7:5], celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_10z[9:3], celloutsig_1_10z[7:5], celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_1_1z = ! in_data[182:173];
  assign celloutsig_0_21z = ! { celloutsig_0_9z[11], celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_35z = celloutsig_0_11z[6:3] < { celloutsig_0_6z[1:0], celloutsig_0_34z, celloutsig_0_12z };
  assign celloutsig_0_37z = { celloutsig_0_36z[2:0], celloutsig_0_22z } < celloutsig_0_36z[7:4];
  assign celloutsig_1_18z = { celloutsig_1_1z, celloutsig_1_13z, celloutsig_1_14z, celloutsig_1_1z } < { celloutsig_1_4z[3:1], celloutsig_1_13z };
  assign celloutsig_0_2z = celloutsig_0_1z & ~(in_data[33]);
  assign celloutsig_1_8z = celloutsig_1_0z[0] & ~(celloutsig_1_7z[1]);
  assign celloutsig_1_14z = in_data[119] & ~(celloutsig_1_6z);
  assign celloutsig_0_12z = { celloutsig_0_6z[8:0], _01_ } !== { in_data[58:48], celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_10z, celloutsig_0_2z };
  assign celloutsig_0_40z = ~ { _02_[11:6], celloutsig_0_33z };
  assign celloutsig_0_51z = { celloutsig_0_47z, celloutsig_0_40z } | { celloutsig_0_17z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_4z };
  assign celloutsig_0_60z = { celloutsig_0_26z, celloutsig_0_18z } | { _03_[4:0], celloutsig_0_27z, celloutsig_0_35z, celloutsig_0_42z, celloutsig_0_36z, celloutsig_0_37z, celloutsig_0_49z, celloutsig_0_14z };
  assign celloutsig_0_95z = { celloutsig_0_9z[5], celloutsig_0_45z, celloutsig_0_50z } | celloutsig_0_60z[14:12];
  assign celloutsig_1_4z = { in_data[159:153], celloutsig_1_2z } | in_data[127:120];
  assign celloutsig_1_7z = celloutsig_1_4z[5:3] | celloutsig_1_0z[6:4];
  assign celloutsig_0_15z = { celloutsig_0_11z[4:3], celloutsig_0_8z, _01_, celloutsig_0_3z, celloutsig_0_3z } | in_data[91:81];
  assign celloutsig_0_5z = | { celloutsig_0_2z, celloutsig_0_1z, _01_, in_data[45:34] };
  assign celloutsig_0_66z = | { celloutsig_0_51z[6:4], celloutsig_0_35z, celloutsig_0_34z, celloutsig_0_21z };
  assign celloutsig_0_22z = | celloutsig_0_18z[7:3];
  assign celloutsig_0_6z = { celloutsig_0_1z, celloutsig_0_1z, _01_, _01_ } << { celloutsig_0_2z, _01_, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z };
  assign celloutsig_1_3z = { in_data[187:183], celloutsig_1_1z, celloutsig_1_1z } << { celloutsig_1_0z[10:6], celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_12z = { celloutsig_1_0z[13:10], celloutsig_1_5z, celloutsig_1_4z } << { in_data[127:126], celloutsig_1_10z[9:3], celloutsig_1_10z[7:5], celloutsig_1_11z };
  assign celloutsig_0_16z = { in_data[85:83], celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_10z } << { _01_[5:4], celloutsig_0_1z, celloutsig_0_11z };
  assign celloutsig_0_17z = { celloutsig_0_6z[7:5], celloutsig_0_4z, celloutsig_0_12z } << { celloutsig_0_11z[3:1], celloutsig_0_5z, celloutsig_0_8z };
  assign celloutsig_0_18z = { celloutsig_0_17z[3:2], celloutsig_0_14z, celloutsig_0_17z, celloutsig_0_12z, celloutsig_0_3z, _01_, celloutsig_0_1z } << { celloutsig_0_17z, celloutsig_0_1z, celloutsig_0_15z };
  assign celloutsig_0_26z = { celloutsig_0_18z[9:5], celloutsig_0_23z } << { celloutsig_0_16z[7:3], celloutsig_0_2z };
  assign celloutsig_0_94z = in_data[75:72] <<< { celloutsig_0_11z[3:2], celloutsig_0_50z, celloutsig_0_66z };
  assign celloutsig_0_9z = in_data[45:28] <<< { in_data[75:72], celloutsig_0_6z };
  assign celloutsig_0_27z = { _01_[1:0], celloutsig_0_2z, celloutsig_0_7z } <<< celloutsig_0_18z[15:12];
  assign celloutsig_0_36z = { celloutsig_0_6z[5:2], celloutsig_0_27z, celloutsig_0_31z } ~^ { _03_, celloutsig_0_14z };
  assign celloutsig_1_0z = in_data[134:118] ~^ in_data[156:140];
  assign celloutsig_1_19z = { celloutsig_1_11z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_15z, celloutsig_1_9z } ~^ celloutsig_1_0z[11:6];
  assign celloutsig_0_11z = { celloutsig_0_9z[9:7], celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_10z } ~^ { _01_[1], celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_34z = ~((celloutsig_0_8z & celloutsig_0_5z) | _01_[4]);
  assign celloutsig_0_47z = ~((celloutsig_0_12z & celloutsig_0_13z) | celloutsig_0_37z);
  assign celloutsig_0_50z = ~((celloutsig_0_13z & _03_[6]) | celloutsig_0_22z);
  assign celloutsig_0_8z = ~((celloutsig_0_7z & _01_[5]) | celloutsig_0_3z);
  assign celloutsig_0_1z = ~((in_data[85] & in_data[72]) | _01_[2]);
  assign celloutsig_0_14z = ~((_01_[5] & celloutsig_0_9z[12]) | (celloutsig_0_4z & celloutsig_0_13z));
  assign celloutsig_0_23z = ~((celloutsig_0_7z & celloutsig_0_14z) | (celloutsig_0_18z[2] & celloutsig_0_16z[9]));
  assign { celloutsig_1_10z[7:5], celloutsig_1_10z[3], celloutsig_1_10z[9:8], celloutsig_1_10z[4] } = ~ { celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_3z[3:2], celloutsig_1_1z };
  assign _00_[0] = celloutsig_0_23z;
  assign _04_[45:30] = _00_[16:1];
  assign celloutsig_1_10z[2:0] = celloutsig_1_10z[7:5];
  assign { out_data[128], out_data[101:96], out_data[35:32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_94z, celloutsig_0_95z };
endmodule
