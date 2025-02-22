/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [3:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [19:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [13:0] celloutsig_0_24z;
  wire [20:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [8:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [2:0] celloutsig_0_29z;
  reg [22:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [10:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [5:0] celloutsig_0_36z;
  wire [33:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  reg [5:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire celloutsig_0_47z;
  wire [7:0] celloutsig_0_4z;
  reg [13:0] celloutsig_0_50z;
  wire [3:0] celloutsig_0_59z;
  wire [9:0] celloutsig_0_5z;
  wire [14:0] celloutsig_0_60z;
  wire celloutsig_0_6z;
  wire [7:0] celloutsig_0_7z;
  wire celloutsig_0_9z;
  wire [15:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  reg [2:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [13:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [223:0] clkin_data;
  wire [223:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[81] ? in_data[32] : in_data[77];
  assign celloutsig_1_2z = celloutsig_1_1z[0] ? celloutsig_1_0z[3] : celloutsig_1_0z[13];
  assign celloutsig_1_17z = celloutsig_1_14z ? celloutsig_1_3z : celloutsig_1_5z;
  assign celloutsig_0_12z = ~(celloutsig_0_7z[4] & celloutsig_0_3z);
  assign celloutsig_0_3z = !(in_data[19] ? in_data[90] : celloutsig_0_2z[7]);
  assign celloutsig_0_47z = !(celloutsig_0_29z[2] ? celloutsig_0_31z : celloutsig_0_31z);
  assign celloutsig_1_7z = ~celloutsig_1_3z;
  assign celloutsig_0_11z = ~celloutsig_0_5z[0];
  assign celloutsig_0_30z = ~celloutsig_0_22z[7];
  assign celloutsig_1_11z = ~((celloutsig_1_0z[5] | celloutsig_1_4z) & celloutsig_1_5z);
  assign celloutsig_1_14z = ~((celloutsig_1_8z | celloutsig_1_5z) & celloutsig_1_10z);
  assign celloutsig_1_16z = celloutsig_1_0z[3] | ~(celloutsig_1_6z[1]);
  assign celloutsig_0_31z = celloutsig_0_2z[8] | ~(celloutsig_0_0z);
  assign celloutsig_0_35z = celloutsig_0_6z ^ in_data[0];
  assign celloutsig_0_43z = celloutsig_0_27z[4] ^ celloutsig_0_38z;
  assign celloutsig_0_10z = celloutsig_0_2z[11] ^ celloutsig_0_4z[1];
  assign celloutsig_0_28z = celloutsig_0_6z ^ celloutsig_0_0z;
  always_ff @(negedge clkin_data[160], posedge clkin_data[96])
    if (clkin_data[96]) _00_ <= 4'h0;
    else _00_ <= celloutsig_0_4z[6:3];
  assign celloutsig_1_18z = { celloutsig_1_3z, celloutsig_1_16z, celloutsig_1_11z } & { celloutsig_1_17z, celloutsig_1_9z, celloutsig_1_10z };
  assign celloutsig_0_34z = { celloutsig_0_27z, celloutsig_0_3z, celloutsig_0_17z, celloutsig_0_26z, celloutsig_0_15z, celloutsig_0_19z } >= in_data[67:54];
  assign celloutsig_0_45z = { celloutsig_0_37z[22:9], celloutsig_0_9z, celloutsig_0_21z, celloutsig_0_32z, celloutsig_0_26z, celloutsig_0_36z, celloutsig_0_35z } >= { celloutsig_0_25z[15:0], celloutsig_0_4z, celloutsig_0_5z, celloutsig_0_33z };
  assign celloutsig_1_9z = { celloutsig_1_6z[13:1], celloutsig_1_2z, celloutsig_1_5z } >= { celloutsig_1_0z[13:1], celloutsig_1_3z, celloutsig_1_8z };
  assign celloutsig_0_6z = { celloutsig_0_5z[9:5], celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_1z } && in_data[16:2];
  assign celloutsig_0_18z = { _00_[3:1], celloutsig_0_0z } && celloutsig_0_4z[6:3];
  assign celloutsig_0_19z = ! { celloutsig_0_7z[3:2], celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_16z };
  assign celloutsig_1_8z = celloutsig_1_0z[10:8] || { celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_2z };
  assign celloutsig_0_9z = { in_data[20:18], celloutsig_0_10z, celloutsig_0_0z } || celloutsig_0_7z[5:1];
  assign celloutsig_0_38z = { celloutsig_0_5z[9:6], celloutsig_0_18z } < celloutsig_0_25z[19:15];
  assign celloutsig_0_40z = { celloutsig_0_2z[6:4], celloutsig_0_21z, celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_34z } < { celloutsig_0_7z[2], _00_, celloutsig_0_10z, celloutsig_0_19z, celloutsig_0_14z };
  assign celloutsig_1_4z = celloutsig_1_0z[14:1] < { celloutsig_1_0z[14:8], celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_5z = celloutsig_1_1z < in_data[136:134];
  assign celloutsig_1_12z = { celloutsig_1_0z[13:4], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_9z } < { celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_8z };
  assign celloutsig_0_1z = { in_data[38:37], celloutsig_0_0z, celloutsig_0_0z } < { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_15z = { _00_[3:1], celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_0z, _00_ } < celloutsig_0_2z[12:3];
  assign celloutsig_0_23z = { celloutsig_0_2z[21:1], celloutsig_0_9z, celloutsig_0_1z } < { in_data[94:93], celloutsig_0_0z, celloutsig_0_22z };
  assign celloutsig_1_10z = celloutsig_1_6z[5] & ~(celloutsig_1_8z);
  assign celloutsig_1_19z = celloutsig_1_12z & ~(celloutsig_1_0z[6]);
  assign celloutsig_0_20z = celloutsig_0_0z & ~(celloutsig_0_7z[4]);
  assign celloutsig_0_24z = { in_data[70:60], celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_21z } % { 1'h1, celloutsig_0_7z[5:3], celloutsig_0_14z, celloutsig_0_9z, celloutsig_0_9z, _00_, celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_15z };
  assign celloutsig_0_37z = ~ { in_data[60:29], celloutsig_0_10z, celloutsig_0_16z };
  assign celloutsig_0_4z = ~ celloutsig_0_2z[13:6];
  assign celloutsig_0_5z = ~ { in_data[71], celloutsig_0_0z, celloutsig_0_4z };
  assign celloutsig_0_60z = ~ { celloutsig_0_50z[13:1], celloutsig_0_45z, celloutsig_0_28z };
  assign celloutsig_0_7z = ~ celloutsig_0_4z;
  assign celloutsig_0_17z = | celloutsig_0_4z[4:0];
  assign celloutsig_0_25z = { celloutsig_0_5z[6:1], celloutsig_0_23z, celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_23z, celloutsig_0_5z, celloutsig_0_23z } >> celloutsig_0_2z[21:1];
  assign celloutsig_0_29z = { celloutsig_0_27z[4:3], celloutsig_0_18z } >> { _00_[1], celloutsig_0_17z, celloutsig_0_10z };
  assign celloutsig_0_59z = celloutsig_0_5z[8:5] <<< { celloutsig_0_5z[6], celloutsig_0_29z };
  assign celloutsig_0_32z = { celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_27z } ~^ { celloutsig_0_24z[9:0], celloutsig_0_17z };
  assign celloutsig_1_0z = in_data[151:136] ~^ in_data[190:175];
  assign celloutsig_1_6z = celloutsig_1_0z[15:2] ~^ celloutsig_1_0z[13:0];
  assign celloutsig_0_22z = { in_data[76:65], celloutsig_0_4z } ~^ { celloutsig_0_2z[20:6], celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_21z, celloutsig_0_3z, celloutsig_0_0z };
  assign celloutsig_0_36z = { celloutsig_0_4z[7:3], celloutsig_0_15z } ^ celloutsig_0_2z[19:14];
  assign celloutsig_0_27z = { celloutsig_0_5z[8:1], celloutsig_0_17z } ^ celloutsig_0_22z[16:8];
  assign celloutsig_0_33z = ~((celloutsig_0_3z & celloutsig_0_30z) | celloutsig_0_20z);
  assign celloutsig_0_16z = ~((celloutsig_0_10z & in_data[41]) | celloutsig_0_1z);
  assign celloutsig_0_21z = ~((celloutsig_0_12z & celloutsig_0_17z) | celloutsig_0_9z);
  always_latch
    if (clkin_data[96]) celloutsig_0_39z = 6'h00;
    else if (clkin_data[32]) celloutsig_0_39z = { celloutsig_0_29z[1:0], celloutsig_0_0z, celloutsig_0_28z, celloutsig_0_26z, celloutsig_0_20z };
  always_latch
    if (celloutsig_1_18z[0]) celloutsig_0_50z = 14'h0000;
    else if (!clkin_data[0]) celloutsig_0_50z = { _00_[1], celloutsig_0_43z, celloutsig_0_14z, celloutsig_0_40z, celloutsig_0_39z, celloutsig_0_47z, celloutsig_0_20z, celloutsig_0_21z, celloutsig_0_47z };
  always_latch
    if (clkin_data[128]) celloutsig_1_1z = 3'h0;
    else if (clkin_data[64]) celloutsig_1_1z = celloutsig_1_0z[8:6];
  always_latch
    if (!celloutsig_1_18z[0]) celloutsig_0_2z = 23'h000000;
    else if (!clkin_data[0]) celloutsig_0_2z = { in_data[95:78], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_1_3z = ~((in_data[169] & celloutsig_1_2z) | (celloutsig_1_2z & celloutsig_1_0z[8]));
  assign celloutsig_0_14z = ~((celloutsig_0_5z[0] & celloutsig_0_10z) | (celloutsig_0_4z[6] & celloutsig_0_10z));
  assign celloutsig_0_26z = ~((celloutsig_0_9z & celloutsig_0_18z) | (celloutsig_0_10z & celloutsig_0_22z[11]));
  assign { out_data[130:128], out_data[96], out_data[35:32], out_data[14:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_59z, celloutsig_0_60z };
endmodule
