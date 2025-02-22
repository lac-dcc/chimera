/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [8:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [5:0] celloutsig_0_16z;
  wire [7:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [6:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [5:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [2:0] celloutsig_0_27z;
  wire [5:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [13:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [8:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [2:0] celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [2:0] celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire [27:0] celloutsig_0_45z;
  wire [6:0] celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire [11:0] celloutsig_0_4z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire [18:0] celloutsig_0_54z;
  wire [18:0] celloutsig_0_55z;
  wire celloutsig_0_57z;
  wire celloutsig_0_5z;
  wire celloutsig_0_60z;
  wire [19:0] celloutsig_0_61z;
  wire [5:0] celloutsig_0_6z;
  wire celloutsig_0_73z;
  reg [2:0] celloutsig_0_74z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_12z;
  wire [16:0] celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [21:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [3:0] celloutsig_1_6z;
  wire [7:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [28:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_41z = ~((in_data[3] | celloutsig_0_40z) & celloutsig_0_22z[3]);
  assign celloutsig_1_2z = ~((in_data[140] | in_data[105]) & celloutsig_1_0z);
  assign celloutsig_1_5z = ~((in_data[157] | in_data[108]) & celloutsig_1_0z);
  assign celloutsig_1_8z = ~((celloutsig_1_7z[5] | celloutsig_1_0z) & in_data[114]);
  assign celloutsig_0_12z = ~((celloutsig_0_0z | celloutsig_0_9z) & celloutsig_0_0z);
  assign celloutsig_0_23z = ~((celloutsig_0_12z | celloutsig_0_5z) & celloutsig_0_5z);
  assign celloutsig_0_29z = ~((celloutsig_0_5z | celloutsig_0_14z) & celloutsig_0_0z);
  assign celloutsig_0_37z = ~((celloutsig_0_20z | celloutsig_0_27z[2]) & (celloutsig_0_28z[4] | celloutsig_0_23z));
  assign celloutsig_0_10z = ~((celloutsig_0_8z | celloutsig_0_5z) & (celloutsig_0_4z[10] | celloutsig_0_2z[10]));
  assign celloutsig_0_30z = ~((celloutsig_0_13z[4] | celloutsig_0_8z) & (celloutsig_0_17z[6] | celloutsig_0_27z[0]));
  assign celloutsig_0_32z = celloutsig_0_18z ^ celloutsig_0_14z;
  assign celloutsig_0_52z = celloutsig_0_27z[2] ^ celloutsig_0_23z;
  assign celloutsig_0_21z = celloutsig_0_9z ^ celloutsig_0_2z[8];
  assign celloutsig_0_26z = celloutsig_0_0z ^ celloutsig_0_7z;
  assign celloutsig_0_7z = ~(celloutsig_0_6z[1] ^ celloutsig_0_6z[5]);
  assign celloutsig_0_20z = ~(celloutsig_0_5z ^ celloutsig_0_14z);
  assign celloutsig_0_34z = { celloutsig_0_28z[1:0], celloutsig_0_33z } + celloutsig_0_17z[3:1];
  assign celloutsig_0_45z = { celloutsig_0_8z, celloutsig_0_26z, celloutsig_0_27z, celloutsig_0_15z, celloutsig_0_17z, celloutsig_0_40z, celloutsig_0_19z, celloutsig_0_43z, celloutsig_0_37z, celloutsig_0_32z, celloutsig_0_20z, celloutsig_0_1z, celloutsig_0_28z, celloutsig_0_30z } + { in_data[89:63], celloutsig_0_8z };
  assign celloutsig_0_46z = { celloutsig_0_4z[4:1], celloutsig_0_29z, celloutsig_0_26z, celloutsig_0_14z } + { celloutsig_0_31z[5], celloutsig_0_19z, celloutsig_0_15z, celloutsig_0_34z, celloutsig_0_33z };
  assign celloutsig_0_54z = { celloutsig_0_25z[5], celloutsig_0_23z, celloutsig_0_8z, celloutsig_0_21z, celloutsig_0_6z, celloutsig_0_28z, celloutsig_0_21z, celloutsig_0_47z, celloutsig_0_41z } + { celloutsig_0_49z, celloutsig_0_22z, celloutsig_0_47z, celloutsig_0_27z, celloutsig_0_33z, celloutsig_0_3z, celloutsig_0_32z, celloutsig_0_52z, celloutsig_0_14z, celloutsig_0_37z, celloutsig_0_21z };
  assign celloutsig_0_55z = { celloutsig_0_45z[22:13], celloutsig_0_36z, celloutsig_0_17z } + { celloutsig_0_19z, celloutsig_0_0z, celloutsig_0_24z, celloutsig_0_52z, celloutsig_0_8z, celloutsig_0_38z[2], 1'h1, celloutsig_0_38z[0], celloutsig_0_7z, celloutsig_0_48z, 1'h1, celloutsig_0_40z, celloutsig_0_38z[2], 1'h1, celloutsig_0_38z[0], celloutsig_0_48z, celloutsig_0_19z, celloutsig_0_41z, celloutsig_0_53z };
  assign celloutsig_0_61z = { celloutsig_0_55z[15:7], celloutsig_0_1z, celloutsig_0_25z, celloutsig_0_57z, celloutsig_0_60z, celloutsig_0_48z, celloutsig_0_48z } + { celloutsig_0_54z[10:6], celloutsig_0_3z, 1'h1, celloutsig_0_30z, celloutsig_0_6z, celloutsig_0_38z[2], 1'h1, celloutsig_0_38z[0], celloutsig_0_47z, celloutsig_0_7z, celloutsig_0_19z };
  assign celloutsig_0_22z = { celloutsig_0_16z[3], celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_20z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_10z } + in_data[44:38];
  assign celloutsig_0_27z = celloutsig_0_22z[6:4] + celloutsig_0_4z[6:4];
  assign celloutsig_0_0z = in_data[17:2] == in_data[39:24];
  assign celloutsig_0_36z = { celloutsig_0_28z[1], celloutsig_0_21z, celloutsig_0_7z } == { celloutsig_0_16z[5], celloutsig_0_24z, celloutsig_0_8z };
  assign celloutsig_0_5z = { in_data[20:17], celloutsig_0_3z, celloutsig_0_3z } == { celloutsig_0_2z[13:10], celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_47z = { celloutsig_0_17z[2:0], celloutsig_0_30z, celloutsig_0_34z, celloutsig_0_38z[2], 1'h1, celloutsig_0_38z[0], celloutsig_0_40z } == { celloutsig_0_28z[3:0], celloutsig_0_29z, celloutsig_0_1z, 1'h1, celloutsig_0_26z, celloutsig_0_27z };
  assign celloutsig_0_60z = { celloutsig_0_0z, celloutsig_0_53z, celloutsig_0_20z, celloutsig_0_15z } == { celloutsig_0_16z[3:1], celloutsig_0_36z };
  assign celloutsig_0_8z = in_data[61:52] == { in_data[50:43], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_0z = in_data[123:98] == in_data[151:126];
  assign celloutsig_0_9z = { in_data[68], celloutsig_0_6z, celloutsig_0_7z, celloutsig_0_8z } == { in_data[67:61], celloutsig_0_1z, celloutsig_0_7z };
  assign celloutsig_0_14z = celloutsig_0_6z[3:0] == { celloutsig_0_6z[5:3], celloutsig_0_12z };
  assign celloutsig_0_19z = celloutsig_0_17z[6:1] == celloutsig_0_16z;
  assign celloutsig_1_12z = celloutsig_1_4z[5:3] >= { celloutsig_1_4z[16:15], celloutsig_1_3z };
  assign celloutsig_0_40z = { celloutsig_0_23z, celloutsig_0_29z, celloutsig_0_25z, celloutsig_0_12z } && 1'h1;
  assign celloutsig_0_49z = { celloutsig_0_16z[1:0], celloutsig_0_18z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_23z } && { celloutsig_0_6z, celloutsig_0_24z, celloutsig_0_21z, celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_27z, celloutsig_0_23z };
  assign celloutsig_0_18z = 1'h1 && { in_data[27:12], celloutsig_0_17z, celloutsig_0_12z };
  assign celloutsig_0_43z = ~^ { in_data[11:9], celloutsig_0_40z, celloutsig_0_40z };
  assign celloutsig_0_48z = ~^ { celloutsig_0_31z[8], celloutsig_0_33z, celloutsig_0_23z, celloutsig_0_3z, celloutsig_0_33z, celloutsig_0_24z };
  assign celloutsig_0_57z = ~^ { celloutsig_0_4z[7:1], celloutsig_0_38z[2], 1'h1, celloutsig_0_38z[0], celloutsig_0_3z, celloutsig_0_48z };
  assign celloutsig_1_18z = ~^ { celloutsig_1_7z[7:3], in_data[130], celloutsig_1_7z[1:0], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_12z, celloutsig_1_16z };
  assign celloutsig_1_19z = ~^ { celloutsig_1_4z[10:7], celloutsig_1_3z };
  assign celloutsig_0_1z = ~^ { in_data[60:44], celloutsig_0_0z };
  assign celloutsig_0_24z = ~^ { celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_14z };
  assign celloutsig_0_3z = ~^ { in_data[3:1], celloutsig_0_0z };
  assign celloutsig_1_9z = { in_data[171:144], celloutsig_1_2z } <<< { in_data[191:188], celloutsig_1_6z[3:2], 1'h1, celloutsig_1_6z[0], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_7z[7:3], in_data[130], celloutsig_1_7z[1:0], celloutsig_1_5z, celloutsig_1_7z[7:3], in_data[130], celloutsig_1_7z[1:0], celloutsig_1_5z };
  assign celloutsig_1_14z = { celloutsig_1_9z[19:5], celloutsig_1_2z, celloutsig_1_12z } <<< { celloutsig_1_9z[27:22], celloutsig_1_0z, celloutsig_1_7z[7:3], in_data[130], celloutsig_1_7z[1:0], celloutsig_1_12z, celloutsig_1_3z };
  assign celloutsig_0_25z = { celloutsig_0_9z, celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_9z } <<< { celloutsig_0_13z[5:1], celloutsig_0_21z };
  assign celloutsig_0_31z = { celloutsig_0_27z[0], celloutsig_0_17z } ~^ celloutsig_0_13z;
  assign celloutsig_0_6z = { celloutsig_0_2z[4:0], celloutsig_0_5z } ~^ { celloutsig_0_4z[8:4], celloutsig_0_1z };
  assign celloutsig_1_4z = { in_data[155:138], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z } ~^ in_data[184:163];
  assign celloutsig_0_13z = in_data[48:40] ~^ { celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_9z, celloutsig_0_11z };
  assign celloutsig_0_16z = { celloutsig_0_2z[7:5], celloutsig_0_3z, celloutsig_0_10z, celloutsig_0_10z } ~^ { in_data[71:69], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_12z };
  assign celloutsig_0_17z = { celloutsig_0_2z[9:6], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_15z } ~^ { celloutsig_0_13z[8:7], celloutsig_0_15z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_14z };
  assign celloutsig_0_2z = in_data[92:79] ~^ { in_data[34:27], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_28z = { celloutsig_0_16z[3:0], celloutsig_0_15z, celloutsig_0_10z } ~^ celloutsig_0_6z;
  always_latch
    if (clkin_data[0]) celloutsig_0_74z = 3'h0;
    else if (!celloutsig_1_19z) celloutsig_0_74z = celloutsig_0_61z[3:1];
  assign celloutsig_0_33z = ~((celloutsig_0_17z[0] & celloutsig_0_25z[4]) | (celloutsig_0_22z[6] & celloutsig_0_32z));
  assign celloutsig_0_42z = ~((celloutsig_0_11z & celloutsig_0_16z[3]) | (celloutsig_0_40z & celloutsig_0_9z));
  assign celloutsig_0_53z = ~((celloutsig_0_42z & celloutsig_0_9z) | (celloutsig_0_17z[4] & celloutsig_0_17z[0]));
  assign celloutsig_0_73z = ~((celloutsig_0_27z[1] & in_data[56]) | (in_data[74] & celloutsig_0_46z[2]));
  assign celloutsig_1_1z = ~((in_data[164] & in_data[182]) | (celloutsig_1_0z & celloutsig_1_0z));
  assign celloutsig_1_3z = ~((celloutsig_1_1z & celloutsig_1_2z) | (in_data[109] & celloutsig_1_0z));
  assign celloutsig_1_16z = ~((celloutsig_1_9z[9] & celloutsig_1_12z) | (celloutsig_1_14z[7] & celloutsig_1_8z));
  assign celloutsig_0_11z = ~((celloutsig_0_2z[4] & celloutsig_0_7z) | (in_data[54] & celloutsig_0_1z));
  assign celloutsig_0_15z = ~((celloutsig_0_11z & celloutsig_0_13z[4]) | (celloutsig_0_7z & celloutsig_0_5z));
  assign celloutsig_0_4z[11:1] = celloutsig_0_2z[12:2] ~^ { in_data[43:36], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_1z };
  assign { celloutsig_0_38z[0], celloutsig_0_38z[2] } = { celloutsig_0_37z, celloutsig_0_5z } ~^ { celloutsig_0_11z, celloutsig_0_14z };
  assign { celloutsig_1_6z[0], celloutsig_1_6z[2], celloutsig_1_6z[3] } = { celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_0z } ~^ { celloutsig_1_1z, celloutsig_1_3z, in_data[188] };
  assign { celloutsig_1_7z[7:5], celloutsig_1_7z[0], celloutsig_1_7z[1], celloutsig_1_7z[3], celloutsig_1_7z[4] } = { celloutsig_1_4z[7:5], celloutsig_1_0z, celloutsig_1_6z[0], celloutsig_1_6z[2], celloutsig_1_6z[3] } ~^ { in_data[135:133], in_data[128], in_data[129], in_data[131], in_data[132] };
  assign celloutsig_0_38z[1] = 1'h1;
  assign celloutsig_0_4z[0] = 1'h1;
  assign celloutsig_1_6z[1] = 1'h1;
  assign celloutsig_1_7z[2] = in_data[130];
  assign { out_data[128], out_data[96], out_data[32], out_data[2:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_73z, celloutsig_0_74z };
endmodule
