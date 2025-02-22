/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire [8:0] _05_;
  wire [10:0] _06_;
  wire [9:0] _07_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [7:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [2:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [9:0] celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire [3:0] celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire [7:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [5:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ~((in_data[17] | in_data[75]) & in_data[6]);
  assign celloutsig_0_3z = ~((celloutsig_0_2z | celloutsig_0_2z) & in_data[48]);
  assign celloutsig_0_10z = ~((_00_ | celloutsig_0_4z) & celloutsig_0_2z);
  assign celloutsig_0_1z = ~((celloutsig_0_0z | celloutsig_0_0z) & in_data[69]);
  assign celloutsig_0_24z = ~((celloutsig_0_8z | celloutsig_0_21z) & celloutsig_0_5z);
  assign celloutsig_0_29z = ~((celloutsig_0_22z | _01_) & (celloutsig_0_14z | celloutsig_0_6z));
  assign celloutsig_1_0z = ~((in_data[146] | in_data[119]) & (in_data[180] | in_data[156]));
  assign celloutsig_1_1z = ~((in_data[124] | celloutsig_1_0z) & (in_data[119] | in_data[108]));
  assign celloutsig_1_3z = ~((celloutsig_1_2z[1] | celloutsig_1_2z[1]) & (celloutsig_1_0z | in_data[191]));
  assign celloutsig_1_11z = ~((celloutsig_1_10z | celloutsig_1_8z) & (celloutsig_1_4z | celloutsig_1_0z));
  assign celloutsig_0_4z = ~((celloutsig_0_1z | celloutsig_0_3z) & (celloutsig_0_2z | celloutsig_0_2z));
  assign celloutsig_0_5z = ~((in_data[27] | celloutsig_0_3z) & (celloutsig_0_4z | celloutsig_0_0z));
  assign celloutsig_0_8z = ~((celloutsig_0_1z | celloutsig_0_2z) & (_02_ | celloutsig_0_3z));
  assign celloutsig_0_11z = ~((celloutsig_0_9z | _02_) & (in_data[35] | in_data[68]));
  assign celloutsig_0_16z = ~((celloutsig_0_3z | celloutsig_0_0z) & (in_data[36] | celloutsig_0_4z));
  assign celloutsig_1_5z = celloutsig_1_0z | ~(celloutsig_1_4z);
  assign celloutsig_1_10z = _03_ | ~(_04_);
  assign celloutsig_1_14z = celloutsig_1_8z | ~(celloutsig_1_2z[0]);
  assign celloutsig_0_6z = in_data[84] | ~(celloutsig_0_0z);
  assign celloutsig_0_15z = celloutsig_0_10z | ~(celloutsig_0_14z);
  assign celloutsig_0_19z = celloutsig_0_16z | ~(celloutsig_0_14z);
  assign celloutsig_0_22z = celloutsig_0_21z | ~(celloutsig_0_4z);
  assign celloutsig_0_25z = celloutsig_0_24z | ~(celloutsig_0_11z);
  assign celloutsig_0_26z = celloutsig_0_12z | ~(in_data[92]);
  reg [8:0] _32_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[64])
    if (clkin_data[64]) _32_ <= 9'h000;
    else _32_ <= { in_data[119:114], celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_5z };
  assign { _04_, _03_, _05_[6:0] } = _32_;
  reg [10:0] _33_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _33_ <= 11'h000;
    else _33_ <= { celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z };
  assign { _06_[10:9], _02_, _06_[7:6], _00_, _06_[4:0] } = _33_;
  reg [9:0] _34_;
  always_ff @(posedge celloutsig_1_18z, negedge clkin_data[32])
    if (!clkin_data[32]) _34_ <= 10'h000;
    else _34_ <= { _06_[9], _02_, _06_[7:6], _00_, _06_[4:3], celloutsig_0_18z };
  assign { _07_[9:6], _01_, _07_[4:0] } = _34_;
  assign celloutsig_0_28z = { celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_19z, celloutsig_0_8z, celloutsig_0_26z, celloutsig_0_22z, celloutsig_0_9z, celloutsig_0_25z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_11z } < { celloutsig_0_13z[6:0], celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_11z };
  assign celloutsig_1_4z = { celloutsig_1_2z[2:1], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z } < { in_data[164:162], celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_1_6z = { celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_4z } < { in_data[169:168], celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_0z };
  assign celloutsig_1_8z = { in_data[110:101], celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_0z } < { in_data[163:140], celloutsig_1_4z, celloutsig_1_0z };
  assign celloutsig_1_18z = { celloutsig_1_12z[4:3], celloutsig_1_14z } < celloutsig_1_12z[8:6];
  assign celloutsig_0_9z = { celloutsig_0_8z, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_6z } < { _06_[1:0], celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_12z = { _06_[7:6], _00_, _06_[4:3] } < { celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_3z };
  assign celloutsig_0_14z = celloutsig_0_13z[4:0] < { celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_10z };
  assign celloutsig_0_21z = { celloutsig_0_13z[7], celloutsig_0_15z, celloutsig_0_19z } < { _06_[6], _00_, _06_[4] };
  assign celloutsig_0_2z = in_data[17:12] < in_data[57:52];
  assign celloutsig_1_2z = in_data[121:119] >> { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_7z = { in_data[169:165], celloutsig_1_1z } >> in_data[150:145];
  assign celloutsig_1_12z = { _05_[1:0], celloutsig_1_11z, celloutsig_1_7z, celloutsig_1_11z } >> { celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_2z };
  assign celloutsig_1_15z = { celloutsig_1_2z, celloutsig_1_3z } >> celloutsig_1_12z[7:4];
  assign celloutsig_1_19z = { in_data[114:113], celloutsig_1_15z, celloutsig_1_1z, celloutsig_1_4z } >> celloutsig_1_12z[8:1];
  assign celloutsig_0_13z = { celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_2z } >> { in_data[80:77], celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_10z };
  assign celloutsig_0_18z = { celloutsig_0_13z[7:6], celloutsig_0_6z } >> celloutsig_0_13z[3:1];
  assign _05_[8:7] = { _04_, _03_ };
  assign { _06_[8], _06_[5] } = { _02_, _00_ };
  assign _07_[5] = _01_;
  assign { out_data[128], out_data[103:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_28z, celloutsig_0_29z };
endmodule
