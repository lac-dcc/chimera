/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [17:0] _00_;
  wire celloutsig_0_0z;
  wire [9:0] celloutsig_0_11z;
  wire [14:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [8:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [6:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [2:0] celloutsig_0_22z;
  wire [16:0] celloutsig_0_23z;
  wire [9:0] celloutsig_0_24z;
  wire [13:0] celloutsig_0_25z;
  wire [11:0] celloutsig_0_26z;
  wire [3:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [20:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [3:0] celloutsig_0_30z;
  wire [8:0] celloutsig_0_31z;
  reg [2:0] celloutsig_0_33z;
  wire [6:0] celloutsig_0_34z;
  wire [2:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [4:0] celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire [2:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_5z;
  wire [7:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [3:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [17:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [9:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_14z;
  wire [4:0] celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire [6:0] celloutsig_1_1z;
  wire [5:0] celloutsig_1_2z;
  wire [23:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_46z = celloutsig_0_43z | ~(celloutsig_0_20z);
  assign celloutsig_0_48z = celloutsig_0_35z[2] | ~(celloutsig_0_33z[2]);
  assign celloutsig_1_10z = celloutsig_1_5z | ~(in_data[105]);
  assign celloutsig_0_20z = celloutsig_0_9z | ~(celloutsig_0_3z);
  assign celloutsig_0_23z = { celloutsig_0_14z[8:2], celloutsig_0_3z, celloutsig_0_14z } + { celloutsig_0_14z[8:1], celloutsig_0_16z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_17z, celloutsig_0_3z, celloutsig_0_21z, celloutsig_0_20z };
  assign celloutsig_0_26z = { celloutsig_0_11z[8:7], celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_17z } + { celloutsig_0_24z[5:4], celloutsig_0_5z, celloutsig_0_14z };
  reg [8:0] _07_;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_19z[0])
    if (!celloutsig_1_19z[0]) _07_ <= 9'h000;
    else _07_ <= { celloutsig_0_8z[0], celloutsig_0_6z };
  assign _00_[12:4] = _07_;
  assign celloutsig_0_29z = { in_data[95:81], celloutsig_0_22z, celloutsig_0_15z, celloutsig_0_0z, celloutsig_0_7z } / { 1'h1, celloutsig_0_26z[7:2], celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_15z, celloutsig_0_4z, celloutsig_0_20z, celloutsig_0_27z };
  assign celloutsig_0_3z = { in_data[92:86], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_2z } || { in_data[16:9], celloutsig_0_1z, celloutsig_0_0z };
  assign celloutsig_0_37z = { in_data[27:25], celloutsig_0_34z, celloutsig_0_27z, celloutsig_0_1z, celloutsig_0_36z, celloutsig_0_6z } || { celloutsig_0_23z[15:2], celloutsig_0_26z };
  assign celloutsig_0_40z = celloutsig_0_27z || { celloutsig_0_27z[1:0], celloutsig_0_28z, celloutsig_0_13z };
  assign celloutsig_0_51z = { in_data[93:88], celloutsig_0_34z, celloutsig_0_48z, celloutsig_0_46z, celloutsig_0_20z } || { celloutsig_0_23z[14:11], celloutsig_0_21z, celloutsig_0_36z, celloutsig_0_40z, celloutsig_0_28z, celloutsig_0_22z, celloutsig_0_17z, celloutsig_0_40z, celloutsig_0_40z, celloutsig_0_46z, celloutsig_0_0z };
  assign celloutsig_1_7z = { celloutsig_1_3z[13], celloutsig_1_4z, celloutsig_1_4z } || { in_data[157:156], celloutsig_1_4z };
  assign celloutsig_0_15z = { celloutsig_0_6z[2], celloutsig_0_14z } || { celloutsig_0_11z[6:3], celloutsig_0_1z, celloutsig_0_13z, celloutsig_0_9z, celloutsig_0_13z };
  assign celloutsig_1_3z = { in_data[160:150], celloutsig_1_1z, celloutsig_1_2z } % { 1'h1, in_data[128:106] };
  assign celloutsig_1_18z = celloutsig_1_3z[15:11] % { 1'h1, celloutsig_1_14z[1:0], celloutsig_1_10z, celloutsig_1_7z };
  assign celloutsig_0_1z = in_data[68:66] % { 1'h1, in_data[62:61] };
  assign celloutsig_0_18z = celloutsig_0_11z[7:1] % { 1'h1, celloutsig_0_12z[5:0] };
  assign celloutsig_0_22z = celloutsig_0_14z[6:4] % { 1'h1, celloutsig_0_4z[1], celloutsig_0_13z };
  assign celloutsig_0_30z = { celloutsig_0_20z, celloutsig_0_1z } % { 1'h1, celloutsig_0_22z };
  assign celloutsig_0_34z = { celloutsig_0_30z, celloutsig_0_22z } % { 1'h1, celloutsig_0_25z[6:1] };
  assign celloutsig_0_41z = { celloutsig_0_35z[2:1], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_19z } % { 1'h1, celloutsig_0_0z, celloutsig_0_20z, celloutsig_0_17z, celloutsig_0_37z };
  assign celloutsig_0_11z = in_data[17:8] % { 1'h1, celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_24z = { celloutsig_0_6z[6:1], celloutsig_0_4z, celloutsig_0_16z } % { 1'h1, in_data[79:71] };
  assign celloutsig_0_31z = { celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_21z, celloutsig_0_5z, celloutsig_0_28z, celloutsig_0_30z } % { 1'h1, celloutsig_0_29z[18:11] };
  assign celloutsig_0_4z = - in_data[85:83];
  assign celloutsig_0_8z = - { celloutsig_0_1z[1], celloutsig_0_1z };
  assign celloutsig_0_12z = - { celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_9z, _00_[12:4], celloutsig_0_0z };
  assign celloutsig_0_36z = { celloutsig_0_12z[9:5], celloutsig_0_20z } !== in_data[82:77];
  assign celloutsig_0_5z = { celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_3z } !== { celloutsig_0_1z[0], celloutsig_0_3z, celloutsig_0_1z[2:1] };
  assign celloutsig_1_4z = celloutsig_1_0z[12:8] !== celloutsig_1_2z[4:0];
  assign celloutsig_0_19z = { celloutsig_0_8z[1:0], celloutsig_0_17z } !== celloutsig_0_6z[2:0];
  assign celloutsig_0_21z = in_data[78:73] !== { celloutsig_0_6z[6:2], celloutsig_0_19z };
  assign celloutsig_0_2z = { celloutsig_0_1z[2:1], celloutsig_0_0z } !== in_data[95:93];
  assign celloutsig_0_28z = { celloutsig_0_14z[7], celloutsig_0_9z, celloutsig_0_7z } !== celloutsig_0_1z;
  assign celloutsig_0_50z = ~^ { celloutsig_0_21z, celloutsig_0_41z, celloutsig_0_11z, celloutsig_0_36z, celloutsig_0_2z };
  assign celloutsig_0_7z = ~^ { celloutsig_0_1z[1:0], celloutsig_0_0z };
  assign celloutsig_0_9z = ~^ in_data[93:72];
  assign celloutsig_0_16z = ~^ { celloutsig_0_6z[6:5], celloutsig_0_15z };
  assign celloutsig_0_17z = ~^ { celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_35z = celloutsig_0_22z >> in_data[58:56];
  assign celloutsig_1_0z = in_data[119:102] >> in_data[175:158];
  assign celloutsig_1_1z = celloutsig_1_0z[7:1] >> in_data[137:131];
  assign celloutsig_1_2z = celloutsig_1_0z[7:2] >> celloutsig_1_0z[5:0];
  assign celloutsig_0_6z = { in_data[53:49], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_3z } >> in_data[45:38];
  assign celloutsig_0_14z = in_data[57:49] >> { _00_[12:5], celloutsig_0_3z };
  assign celloutsig_0_25z = { celloutsig_0_3z, celloutsig_0_24z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_15z } >> { celloutsig_0_8z[1:0], celloutsig_0_21z, _00_[12:4], celloutsig_0_16z, celloutsig_0_15z };
  assign celloutsig_0_27z = { celloutsig_0_22z[0], celloutsig_0_7z, celloutsig_0_5z, celloutsig_0_15z } >> { _00_[12:10], celloutsig_0_13z };
  assign celloutsig_1_12z = celloutsig_1_3z[18:9] - celloutsig_1_3z[16:7];
  assign celloutsig_1_14z = celloutsig_1_2z[5:2] - celloutsig_1_2z[3:0];
  assign celloutsig_1_19z = { in_data[116:107], celloutsig_1_7z } - { celloutsig_1_12z[8:0], celloutsig_1_10z, celloutsig_1_6z };
  assign celloutsig_0_0z = ~((in_data[4] & in_data[49]) | in_data[56]);
  assign celloutsig_0_43z = ~((celloutsig_0_5z & celloutsig_0_21z) | celloutsig_0_18z[2]);
  assign celloutsig_1_5z = ~((celloutsig_1_1z[4] & celloutsig_1_2z[0]) | celloutsig_1_0z[3]);
  assign celloutsig_1_6z = ~((celloutsig_1_2z[3] & in_data[183]) | in_data[157]);
  assign celloutsig_0_13z = ~((celloutsig_0_12z[0] & celloutsig_0_12z[0]) | celloutsig_0_11z[8]);
  always_latch
    if (celloutsig_1_19z[0]) celloutsig_0_33z = 3'h0;
    else if (!clkin_data[32]) celloutsig_0_33z = celloutsig_0_31z[6:4];
  assign { _00_[17:13], _00_[3:0] } = { celloutsig_0_6z[3:1], celloutsig_0_46z, celloutsig_0_17z, celloutsig_0_30z };
  assign { out_data[132:128], out_data[106:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_50z, celloutsig_0_51z };
endmodule
