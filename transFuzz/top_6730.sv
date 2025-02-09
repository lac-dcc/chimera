/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [5:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [8:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [8:0] celloutsig_0_16z;
  wire [15:0] celloutsig_0_17z;
  wire [3:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [20:0] celloutsig_0_20z;
  wire [3:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [17:0] celloutsig_0_23z;
  wire [7:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  reg [2:0] celloutsig_0_31z;
  wire [3:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [10:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [29:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [25:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire [30:0] celloutsig_0_45z;
  wire [5:0] celloutsig_0_46z;
  wire [5:0] celloutsig_0_47z;
  wire celloutsig_0_4z;
  wire celloutsig_0_52z;
  wire celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [5:0] celloutsig_0_6z;
  wire [4:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [7:0] celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [10:0] celloutsig_1_18z;
  wire [9:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [20:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_10z = ~(celloutsig_0_6z[0] & celloutsig_0_4z);
  assign celloutsig_0_25z = ~(celloutsig_0_14z & celloutsig_0_8z[0]);
  assign celloutsig_1_16z = celloutsig_1_4z[14] | ~(celloutsig_1_12z);
  assign celloutsig_0_34z = celloutsig_0_10z ^ celloutsig_0_32z[2];
  assign celloutsig_0_41z = celloutsig_0_37z ^ celloutsig_0_27z;
  assign celloutsig_0_14z = celloutsig_0_0z ^ celloutsig_0_2z;
  assign celloutsig_0_39z = ~(celloutsig_0_35z ^ celloutsig_0_15z);
  assign celloutsig_0_27z = ~(celloutsig_0_5z ^ celloutsig_0_10z);
  always_ff @(negedge clkin_data[64], negedge clkin_data[32])
    if (!clkin_data[32]) _00_ <= 6'h00;
    else _00_ <= { celloutsig_1_14z[7], celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_2z };
  assign celloutsig_0_40z = { celloutsig_0_23z[17:1], celloutsig_0_6z, celloutsig_0_31z } & { in_data[64:53], celloutsig_0_5z, celloutsig_0_34z, celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_3z, celloutsig_0_14z };
  assign celloutsig_1_4z = { in_data[131:113], celloutsig_1_2z, celloutsig_1_3z } & { in_data[171:166], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_3z };
  assign celloutsig_0_17z = { celloutsig_0_12z[7:2], celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_15z } & { celloutsig_0_6z[4:0], celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_23z = { celloutsig_0_16z[6], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_19z, celloutsig_0_21z, celloutsig_0_9z, celloutsig_0_12z } & { celloutsig_0_13z, celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_19z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_11z };
  assign celloutsig_0_45z = { celloutsig_0_40z[23:2], celloutsig_0_29z, celloutsig_0_43z, celloutsig_0_31z, celloutsig_0_0z, celloutsig_0_14z, celloutsig_0_4z, celloutsig_0_11z } / { 1'h1, celloutsig_0_36z[6:4], celloutsig_0_43z, celloutsig_0_10z, celloutsig_0_12z, celloutsig_0_21z, celloutsig_0_25z, celloutsig_0_36z };
  assign celloutsig_0_6z = { celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_4z } / { 1'h1, in_data[6:2] };
  assign celloutsig_1_14z = { celloutsig_1_4z[8:4], celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_10z } / { 1'h1, celloutsig_1_4z[19:14], celloutsig_1_7z };
  assign celloutsig_0_12z = { in_data[76:69], celloutsig_0_0z } / { 1'h1, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_3z };
  assign celloutsig_0_24z = celloutsig_0_16z[8:1] / { 1'h1, celloutsig_0_14z, celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_1_17z = in_data[132:123] === { celloutsig_1_14z[6:0], celloutsig_1_8z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_1_5z = { celloutsig_1_4z[19:3], celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_1z } > { celloutsig_1_4z[19:7], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_3z };
  assign celloutsig_0_35z = ! in_data[53:51];
  assign celloutsig_0_11z = ! { celloutsig_0_6z[3:2], celloutsig_0_10z, celloutsig_0_2z };
  assign celloutsig_0_43z = { celloutsig_0_6z, celloutsig_0_27z, celloutsig_0_16z, celloutsig_0_39z, celloutsig_0_21z, celloutsig_0_30z } || { celloutsig_0_41z, celloutsig_0_27z, celloutsig_0_5z, celloutsig_0_25z, celloutsig_0_24z, celloutsig_0_22z, celloutsig_0_16z };
  assign celloutsig_0_60z = { celloutsig_0_36z[8:2], celloutsig_0_27z, celloutsig_0_26z } || { celloutsig_0_39z, celloutsig_0_52z, celloutsig_0_6z, celloutsig_0_34z };
  assign celloutsig_1_10z = { celloutsig_1_4z[20:16], celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_8z } || { in_data[126:125], celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_0_13z = { in_data[43:31], celloutsig_0_3z } || { in_data[90:79], celloutsig_0_10z, celloutsig_0_3z };
  assign celloutsig_0_26z = { celloutsig_0_20z[19:15], celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_11z, celloutsig_0_25z, celloutsig_0_10z } || { celloutsig_0_10z, celloutsig_0_12z };
  assign celloutsig_0_59z = celloutsig_0_38z < { celloutsig_0_46z[3:1], celloutsig_0_43z, celloutsig_0_40z };
  assign celloutsig_0_9z = { celloutsig_0_8z[2:0], celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_1z } < in_data[91:83];
  assign celloutsig_0_3z = { in_data[9:5], celloutsig_0_2z } < { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_0z = in_data[45] & ~(in_data[6]);
  assign celloutsig_1_11z = in_data[138] & ~(celloutsig_1_4z[7]);
  assign celloutsig_0_15z = celloutsig_0_10z & ~(celloutsig_0_8z[2]);
  assign celloutsig_0_30z = celloutsig_0_16z[6] & ~(in_data[65]);
  assign celloutsig_0_47z = celloutsig_0_36z[6:1] % { 1'h1, celloutsig_0_40z[18:15], celloutsig_0_15z };
  assign celloutsig_1_18z = { _00_[4], celloutsig_1_13z, celloutsig_1_13z, celloutsig_1_14z } % { 1'h1, in_data[125:121], celloutsig_1_0z };
  assign celloutsig_0_21z = { celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_19z } * celloutsig_0_17z[15:12];
  assign celloutsig_0_18z[0] = celloutsig_0_12z[4] ? celloutsig_0_16z[4] : celloutsig_0_0z;
  assign celloutsig_1_1z = in_data[116:114] != celloutsig_1_0z[3:1];
  assign celloutsig_1_2z = in_data[186:184] != in_data[124:122];
  assign celloutsig_1_7z = { in_data[178:172], celloutsig_1_1z } != celloutsig_1_4z[11:4];
  assign celloutsig_1_12z = in_data[191:185] != { celloutsig_1_4z[12:7], celloutsig_1_10z };
  assign celloutsig_0_1z = in_data[11:3] != in_data[89:81];
  assign celloutsig_0_36z = - { celloutsig_0_24z[4:3], celloutsig_0_6z, celloutsig_0_33z, celloutsig_0_30z, celloutsig_0_27z };
  assign celloutsig_0_38z = - { celloutsig_0_20z[8], celloutsig_0_4z, celloutsig_0_34z, celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_31z, celloutsig_0_4z, celloutsig_0_16z[7:5], celloutsig_0_18z[0], celloutsig_0_16z, celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_19z, celloutsig_0_32z };
  assign celloutsig_1_19z = - { celloutsig_1_0z, celloutsig_1_12z, celloutsig_1_9z, celloutsig_1_8z, celloutsig_1_17z, celloutsig_1_16z };
  assign celloutsig_0_20z = - { celloutsig_0_8z[1:0], celloutsig_0_12z, celloutsig_0_10z, celloutsig_0_12z };
  assign celloutsig_0_32z = - { celloutsig_0_31z, celloutsig_0_4z };
  assign celloutsig_1_0z = in_data[128:124] | in_data[186:182];
  assign celloutsig_0_37z = celloutsig_0_24z[0] & celloutsig_0_33z;
  assign celloutsig_0_4z = celloutsig_0_0z & in_data[37];
  assign celloutsig_1_13z = celloutsig_1_9z & celloutsig_1_4z[18];
  assign celloutsig_0_19z = celloutsig_0_11z & celloutsig_0_14z;
  assign celloutsig_0_22z = celloutsig_0_20z[7] & celloutsig_0_19z;
  assign celloutsig_1_8z = | { celloutsig_1_6z, celloutsig_1_4z[2:1], celloutsig_1_1z };
  assign celloutsig_0_52z = ^ { celloutsig_0_40z[12:4], celloutsig_0_43z, celloutsig_0_43z, celloutsig_0_25z, celloutsig_0_47z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_34z, celloutsig_0_9z };
  assign celloutsig_0_2z = ^ { celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_29z = ^ { celloutsig_0_17z[13:8], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_14z };
  assign celloutsig_0_33z = ^ { celloutsig_0_24z[0], celloutsig_0_2z, celloutsig_0_24z, celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_19z };
  assign celloutsig_0_8z = in_data[9:5] <<< { in_data[22:19], celloutsig_0_5z };
  assign celloutsig_0_46z = celloutsig_0_17z[5:0] ~^ { celloutsig_0_45z[6:2], celloutsig_0_22z };
  assign celloutsig_0_16z = { celloutsig_0_6z[4], celloutsig_0_0z, celloutsig_0_6z, celloutsig_0_11z } ~^ { in_data[27:24], celloutsig_0_11z, celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_5z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_31z = 3'h0;
    else if (celloutsig_1_19z[0]) celloutsig_0_31z = in_data[43:41];
  assign celloutsig_0_5z = ~((celloutsig_0_1z & celloutsig_0_1z) | (celloutsig_0_1z & celloutsig_0_4z));
  assign celloutsig_1_3z = ~((celloutsig_1_0z[1] & celloutsig_1_1z) | (celloutsig_1_1z & in_data[173]));
  assign celloutsig_1_6z = ~((celloutsig_1_1z & celloutsig_1_4z[3]) | (celloutsig_1_0z[0] & celloutsig_1_3z));
  assign celloutsig_1_9z = ~((celloutsig_1_5z & celloutsig_1_6z) | (celloutsig_1_3z & celloutsig_1_4z[1]));
  assign celloutsig_0_18z[3:1] = celloutsig_0_16z[7:5];
  assign { out_data[138:128], out_data[105:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_59z, celloutsig_0_60z };
endmodule
