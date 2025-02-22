/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  reg [22:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [25:0] celloutsig_0_14z;
  wire [7:0] celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [16:0] celloutsig_0_18z;
  wire [11:0] celloutsig_0_19z;
  wire [4:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [10:0] celloutsig_0_24z;
  wire [3:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [2:0] celloutsig_0_29z;
  wire [13:0] celloutsig_0_2z;
  wire [8:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [9:0] celloutsig_0_34z;
  wire [4:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [9:0] celloutsig_0_38z;
  wire [12:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [3:0] celloutsig_0_49z;
  wire [3:0] celloutsig_0_4z;
  wire celloutsig_0_57z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_0_64z;
  wire [4:0] celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire [4:0] celloutsig_0_71z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  reg [4:0] celloutsig_1_0z;
  wire [6:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [13:0] celloutsig_1_14z;
  wire [10:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [9:0] celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [9:0] celloutsig_1_5z;
  wire [2:0] celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[15] ? in_data[68] : in_data[61];
  assign celloutsig_0_32z = celloutsig_0_3z ? celloutsig_0_30z[2] : celloutsig_0_26z;
  assign celloutsig_0_43z = celloutsig_0_8z ? celloutsig_0_22z : celloutsig_0_36z;
  assign celloutsig_0_46z = celloutsig_0_41z ? celloutsig_0_4z[2] : celloutsig_0_43z;
  assign celloutsig_0_57z = celloutsig_0_46z ? celloutsig_0_47z : celloutsig_0_25z[0];
  assign celloutsig_0_64z = celloutsig_0_49z[1] ? celloutsig_0_35z[2] : celloutsig_0_18z[8];
  assign celloutsig_0_70z = celloutsig_0_43z ? celloutsig_0_64z : celloutsig_0_39z[10];
  assign celloutsig_1_1z = celloutsig_1_0z[4] ? in_data[123] : in_data[189];
  assign celloutsig_1_4z = celloutsig_1_0z[1] ? in_data[116] : celloutsig_1_3z[6];
  assign celloutsig_1_11z = celloutsig_1_3z[9] ? celloutsig_1_8z : celloutsig_1_5z[0];
  assign celloutsig_1_19z = celloutsig_1_11z ? celloutsig_1_2z[6] : celloutsig_1_9z;
  assign celloutsig_0_9z = celloutsig_0_5z[3] ? celloutsig_0_2z[9] : celloutsig_0_0z;
  assign celloutsig_0_11z = celloutsig_0_5z[2] ? celloutsig_0_7z : celloutsig_0_6z[1];
  assign celloutsig_0_13z = celloutsig_0_9z ? celloutsig_0_9z : celloutsig_0_0z;
  assign celloutsig_0_21z = in_data[58] ? celloutsig_0_8z : celloutsig_0_4z[1];
  assign celloutsig_0_22z = celloutsig_0_10z[13] ? celloutsig_0_15z[5] : celloutsig_0_8z;
  assign celloutsig_0_26z = celloutsig_0_11z ? celloutsig_0_17z : celloutsig_0_24z[9];
  assign celloutsig_0_28z = !(celloutsig_0_15z[0] ? celloutsig_0_15z[1] : celloutsig_0_25z[3]);
  assign celloutsig_0_31z = !(celloutsig_0_27z ? celloutsig_0_29z[1] : celloutsig_0_18z[2]);
  assign celloutsig_0_3z = !(in_data[4] ? celloutsig_0_2z[6] : celloutsig_0_2z[9]);
  assign celloutsig_0_33z = !(celloutsig_0_2z[13] ? celloutsig_0_31z : celloutsig_0_10z[22]);
  assign celloutsig_0_36z = !(celloutsig_0_0z ? celloutsig_0_19z[11] : celloutsig_0_11z);
  assign celloutsig_0_41z = !(celloutsig_0_28z ? celloutsig_0_35z[3] : celloutsig_0_8z);
  assign celloutsig_0_47z = !(celloutsig_0_9z ? celloutsig_0_17z : celloutsig_0_5z[1]);
  assign celloutsig_0_7z = !(celloutsig_0_0z ? celloutsig_0_2z[2] : celloutsig_0_0z);
  assign celloutsig_1_8z = !(celloutsig_1_6z[0] ? celloutsig_1_4z : celloutsig_1_2z[0]);
  assign celloutsig_0_8z = !(celloutsig_0_0z ? celloutsig_0_7z : celloutsig_0_5z[3]);
  assign celloutsig_1_9z = !(celloutsig_1_3z[8] ? celloutsig_1_1z : celloutsig_1_1z);
  assign celloutsig_0_12z = !(celloutsig_0_7z ? celloutsig_0_2z[7] : celloutsig_0_8z);
  assign celloutsig_0_16z = !(celloutsig_0_13z ? celloutsig_0_3z : celloutsig_0_0z);
  assign celloutsig_0_17z = !(celloutsig_0_14z[25] ? celloutsig_0_11z : celloutsig_0_5z[4]);
  assign celloutsig_0_27z = !(celloutsig_0_26z ? celloutsig_0_20z[0] : celloutsig_0_7z);
  assign celloutsig_0_29z = { celloutsig_0_4z[2], celloutsig_0_0z, celloutsig_0_0z } & { celloutsig_0_19z[3], celloutsig_0_16z, celloutsig_0_7z };
  assign celloutsig_0_30z = { in_data[39:33], celloutsig_0_9z, celloutsig_0_12z } & { celloutsig_0_19z[7:4], celloutsig_0_6z };
  assign celloutsig_0_34z = { celloutsig_0_2z[13:5], celloutsig_0_11z } & { celloutsig_0_14z[8:3], celloutsig_0_25z };
  assign celloutsig_0_35z = { celloutsig_0_14z[3:0], celloutsig_0_16z } & { celloutsig_0_6z[1:0], celloutsig_0_7z, celloutsig_0_27z, celloutsig_0_32z };
  assign celloutsig_0_38z = { in_data[23:16], celloutsig_0_33z, celloutsig_0_7z } & { celloutsig_0_24z[2], celloutsig_0_31z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_5z };
  assign celloutsig_0_39z = { celloutsig_0_38z[8:4], celloutsig_0_3z, celloutsig_0_22z, celloutsig_0_17z, celloutsig_0_21z, celloutsig_0_0z, celloutsig_0_29z } & { celloutsig_0_2z[12:8], celloutsig_0_25z, celloutsig_0_25z };
  assign celloutsig_0_4z = { in_data[5:3], celloutsig_0_0z } & in_data[89:86];
  assign celloutsig_0_49z = { celloutsig_0_25z[2:0], celloutsig_0_21z } & celloutsig_0_34z[3:0];
  assign celloutsig_0_5z = { celloutsig_0_2z[4:1], celloutsig_0_3z } & in_data[45:41];
  assign celloutsig_0_6z = { celloutsig_0_4z, celloutsig_0_0z } & { celloutsig_0_5z[4:2], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_71z = celloutsig_0_6z & { celloutsig_0_49z[2], celloutsig_0_17z, celloutsig_0_22z, celloutsig_0_57z, celloutsig_0_47z };
  assign celloutsig_1_2z = { in_data[162:154], celloutsig_1_1z } & in_data[153:144];
  assign celloutsig_1_3z = in_data[176:167] & in_data[188:179];
  assign celloutsig_1_5z = { celloutsig_1_3z[8:1], celloutsig_1_4z, celloutsig_1_4z } & celloutsig_1_2z;
  assign celloutsig_1_6z = in_data[143:141] & celloutsig_1_5z[2:0];
  assign celloutsig_1_10z = { celloutsig_1_3z[8:5], celloutsig_1_6z } & { celloutsig_1_6z[2:1], celloutsig_1_0z };
  assign celloutsig_1_14z = { celloutsig_1_10z[4:2], celloutsig_1_9z, celloutsig_1_3z } & { celloutsig_1_3z[5:0], celloutsig_1_11z, celloutsig_1_10z };
  assign celloutsig_1_18z = in_data[129:119] & celloutsig_1_14z[12:2];
  assign celloutsig_0_14z = { celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_11z, celloutsig_0_4z, celloutsig_0_11z } & { celloutsig_0_10z[18:6], celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_0z };
  assign celloutsig_0_15z = { in_data[63:58], celloutsig_0_0z, celloutsig_0_9z } & { celloutsig_0_2z[13:8], celloutsig_0_11z, celloutsig_0_0z };
  assign celloutsig_0_18z = { celloutsig_0_10z[16:2], celloutsig_0_12z, celloutsig_0_8z } & celloutsig_0_14z[24:8];
  assign celloutsig_0_19z = in_data[72:61] & { celloutsig_0_15z[6:1], celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_20z = { celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_17z } & { celloutsig_0_14z[25:22], celloutsig_0_16z };
  assign celloutsig_0_24z = celloutsig_0_19z[10:0] & { celloutsig_0_14z[23:15], celloutsig_0_11z, celloutsig_0_0z };
  assign celloutsig_0_2z = { in_data[40:28], celloutsig_0_0z } & { in_data[92:87], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_25z = { celloutsig_0_18z[9], celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_13z } & { celloutsig_0_2z[4:2], celloutsig_0_13z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_0z = 5'h00;
    else if (!clkin_data[32]) celloutsig_1_0z = in_data[170:166];
  always_latch
    if (clkin_data[64]) celloutsig_0_10z = 23'h000000;
    else if (celloutsig_1_18z[0]) celloutsig_0_10z = { celloutsig_0_5z[3], celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_6z };
  assign { out_data[138:128], out_data[96], out_data[32], out_data[4:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_70z, celloutsig_0_71z };
endmodule
