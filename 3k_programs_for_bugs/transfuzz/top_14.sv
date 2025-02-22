/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [6:0] celloutsig_0_10z;
  wire [15:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [15:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [8:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [2:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [17:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  reg [7:0] celloutsig_0_24z;
  wire [2:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [11:0] celloutsig_0_27z;
  wire [4:0] celloutsig_0_28z;
  wire [2:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  reg [4:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [3:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [5:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [7:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  reg [8:0] celloutsig_0_41z;
  reg [10:0] celloutsig_0_42z;
  wire celloutsig_0_44z;
  wire [5:0] celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire [9:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  reg [4:0] celloutsig_0_51z;
  wire celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_56z;
  wire celloutsig_0_57z;
  reg [5:0] celloutsig_0_58z;
  wire [7:0] celloutsig_0_59z;
  wire celloutsig_0_5z;
  wire [2:0] celloutsig_0_60z;
  wire [12:0] celloutsig_0_64z;
  wire celloutsig_0_68z;
  wire celloutsig_0_6z;
  wire celloutsig_0_73z;
  reg [2:0] celloutsig_0_79z;
  wire [24:0] celloutsig_0_80z;
  wire [8:0] celloutsig_0_87z;
  wire celloutsig_0_88z;
  wire celloutsig_0_8z;
  wire [5:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [14:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire [5:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire [2:0] celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire [3:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [7:0] celloutsig_1_7z;
  wire [12:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_33z = celloutsig_0_10z[5] ? celloutsig_0_29z[0] : celloutsig_0_9z[5];
  assign celloutsig_1_0z = in_data[165] ? in_data[117] : in_data[154];
  assign celloutsig_1_5z = celloutsig_1_0z ? celloutsig_1_4z : celloutsig_1_0z;
  assign celloutsig_0_20z = in_data[90] ? celloutsig_0_4z : celloutsig_0_3z[5];
  assign celloutsig_0_23z = celloutsig_0_4z ? celloutsig_0_11z[8] : celloutsig_0_11z[12];
  assign celloutsig_0_49z = !(celloutsig_0_48z[5] ? celloutsig_0_24z[1] : celloutsig_0_19z);
  assign celloutsig_1_9z = !(celloutsig_1_0z ? celloutsig_1_4z : celloutsig_1_1z[0]);
  assign celloutsig_0_88z = ~((celloutsig_0_38z[5] | celloutsig_0_54z) & celloutsig_0_58z[5]);
  assign celloutsig_0_12z = ~((celloutsig_0_1z[9] | celloutsig_0_0z) & celloutsig_0_10z[1]);
  assign celloutsig_0_15z = ~((celloutsig_0_3z[5] | celloutsig_0_0z) & celloutsig_0_3z[0]);
  assign celloutsig_0_17z = ~((celloutsig_0_1z[7] | celloutsig_0_15z) & celloutsig_0_11z[13]);
  assign celloutsig_0_2z = ~((celloutsig_0_1z[4] | celloutsig_0_0z) & celloutsig_0_1z[8]);
  assign celloutsig_0_21z = ~((celloutsig_0_13z[10] | celloutsig_0_12z) & celloutsig_0_6z);
  assign celloutsig_0_5z = ~((celloutsig_0_3z[2] | in_data[59]) & (celloutsig_0_2z | in_data[42]));
  assign celloutsig_1_4z = ~((celloutsig_1_1z[3] | in_data[152]) & (celloutsig_1_1z[0] | celloutsig_1_3z));
  assign celloutsig_1_17z = ~((celloutsig_1_3z | celloutsig_1_9z) & (celloutsig_1_3z | celloutsig_1_13z));
  assign celloutsig_0_19z = ~((celloutsig_0_9z[5] | celloutsig_0_4z) & (celloutsig_0_16z[0] | celloutsig_0_15z));
  assign celloutsig_1_16z = celloutsig_1_11z ^ celloutsig_1_7z[0];
  assign celloutsig_1_6z = ~(celloutsig_1_0z ^ celloutsig_1_2z);
  assign celloutsig_0_54z = { in_data[17:5], celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_22z, celloutsig_0_4z, celloutsig_0_39z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_50z, celloutsig_0_33z } > { celloutsig_0_20z, celloutsig_0_18z, celloutsig_0_16z, celloutsig_0_30z, celloutsig_0_24z, celloutsig_0_29z };
  assign celloutsig_0_4z = in_data[66] & ~(celloutsig_0_0z);
  assign celloutsig_0_8z = celloutsig_0_3z[2] & ~(celloutsig_0_3z[6]);
  assign celloutsig_0_3z = { celloutsig_0_1z[11:5], celloutsig_0_2z } % { 1'h1, celloutsig_0_1z[13:7] };
  assign celloutsig_0_64z = { celloutsig_0_60z[2], celloutsig_0_4z, celloutsig_0_26z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_59z } % { 1'h1, in_data[41:39], celloutsig_0_55z, celloutsig_0_40z, celloutsig_0_38z, celloutsig_0_15z };
  assign celloutsig_0_16z = { celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_12z } % { 1'h1, celloutsig_0_1z[7:0] };
  assign celloutsig_0_10z = { in_data[90:87], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_5z } * { celloutsig_0_1z[5:0], celloutsig_0_6z };
  assign celloutsig_1_18z = { celloutsig_1_13z, celloutsig_1_11z, celloutsig_1_17z } * { celloutsig_1_5z, celloutsig_1_16z, celloutsig_1_3z };
  assign celloutsig_0_27z = celloutsig_0_2z ? { celloutsig_0_11z[9:2], celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_17z, celloutsig_0_19z } : { celloutsig_0_1z[11:1], celloutsig_0_12z };
  assign celloutsig_1_7z = - in_data[115:108];
  assign celloutsig_0_13z = - { celloutsig_0_1z[12:9], celloutsig_0_5z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_4z, celloutsig_0_5z };
  assign celloutsig_0_0z = in_data[55:49] !== in_data[94:88];
  assign celloutsig_0_40z = { celloutsig_0_1z[16:8], celloutsig_0_39z, celloutsig_0_4z } !== { celloutsig_0_3z[5:1], celloutsig_0_29z, celloutsig_0_6z, celloutsig_0_23z, celloutsig_0_20z };
  assign celloutsig_0_46z = { celloutsig_0_42z[8:5], celloutsig_0_22z, celloutsig_0_6z, celloutsig_0_23z } !== { celloutsig_0_25z[2:1], celloutsig_0_6z, celloutsig_0_31z, celloutsig_0_21z, celloutsig_0_21z, celloutsig_0_12z };
  assign celloutsig_0_57z = celloutsig_0_30z[3:0] !== { celloutsig_0_36z[2:1], celloutsig_0_35z, celloutsig_0_17z };
  assign celloutsig_0_68z = { celloutsig_0_51z[2:0], celloutsig_0_36z, celloutsig_0_0z } !== { celloutsig_0_57z, celloutsig_0_10z };
  assign celloutsig_0_73z = { celloutsig_0_56z, celloutsig_0_57z, celloutsig_0_45z } !== { celloutsig_0_38z[1:0], celloutsig_0_18z, celloutsig_0_68z, celloutsig_0_49z, celloutsig_0_8z };
  assign celloutsig_1_3z = { in_data[186:157], celloutsig_1_0z } !== { in_data[166:140], celloutsig_1_1z };
  assign celloutsig_0_14z = in_data[61:58] !== { celloutsig_0_10z[3:1], celloutsig_0_2z };
  assign celloutsig_0_22z = { celloutsig_0_11z[9:7], celloutsig_0_20z, celloutsig_0_6z } !== { celloutsig_0_9z[4:1], celloutsig_0_4z };
  assign celloutsig_0_26z = { celloutsig_0_10z[6:2], celloutsig_0_17z, celloutsig_0_12z, celloutsig_0_4z } !== { celloutsig_0_13z[11], celloutsig_0_18z, celloutsig_0_18z, celloutsig_0_22z };
  assign celloutsig_1_12z = { in_data[157:153], celloutsig_1_4z } | { celloutsig_1_0z, celloutsig_1_11z, celloutsig_1_1z };
  assign celloutsig_0_1z = in_data[49:32] | in_data[35:18];
  assign celloutsig_0_18z = { in_data[25], celloutsig_0_2z, celloutsig_0_14z } | celloutsig_0_13z[4:2];
  assign celloutsig_0_31z = & { celloutsig_0_28z[4:1], celloutsig_0_26z, celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_1z[14:7] };
  assign celloutsig_0_34z = & celloutsig_0_27z[11:9];
  assign celloutsig_0_39z = & { celloutsig_0_28z[4:1], celloutsig_0_26z, celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_1z[14:7], in_data[79:75] };
  assign celloutsig_0_44z = & { celloutsig_0_37z, celloutsig_0_16z[4:2], celloutsig_0_14z };
  assign celloutsig_0_56z = & { celloutsig_0_46z, celloutsig_0_38z, celloutsig_0_37z, celloutsig_0_28z[4:1], celloutsig_0_26z, celloutsig_0_21z, celloutsig_0_16z[4:2], celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_1z[14:7], in_data[71:66], in_data[35:29], celloutsig_0_0z };
  assign celloutsig_0_6z = & { celloutsig_0_5z, celloutsig_0_2z, in_data[35:29] };
  assign celloutsig_1_11z = & celloutsig_1_10z[13:7];
  assign celloutsig_0_35z = | { celloutsig_0_30z, celloutsig_0_16z };
  assign celloutsig_0_87z = { celloutsig_0_80z[23:18], celloutsig_0_73z, celloutsig_0_22z, celloutsig_0_49z } >> celloutsig_0_80z[16:8];
  assign celloutsig_1_1z = in_data[156:153] >> in_data[136:133];
  assign celloutsig_1_8z = { in_data[138:131], celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_6z } << { celloutsig_1_1z[3:1], celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_7z };
  assign celloutsig_0_9z = celloutsig_0_1z[12:7] >> { celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_0_59z = { celloutsig_0_10z, celloutsig_0_31z } <<< { celloutsig_0_13z[10], celloutsig_0_51z, celloutsig_0_34z, celloutsig_0_6z };
  assign celloutsig_1_10z = { celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_0z } >>> { in_data[111:98], celloutsig_1_4z };
  assign celloutsig_1_19z = { in_data[171:170], celloutsig_1_12z, celloutsig_1_5z, celloutsig_1_17z, celloutsig_1_5z } >>> { celloutsig_1_8z[8:0], celloutsig_1_9z, celloutsig_1_2z };
  assign celloutsig_0_29z = { celloutsig_0_18z[2:1], celloutsig_0_17z } ~^ celloutsig_0_27z[11:9];
  assign celloutsig_0_36z = { celloutsig_0_27z[11:9], celloutsig_0_22z } ~^ { celloutsig_0_3z[2:0], celloutsig_0_15z };
  assign celloutsig_0_38z = { celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_36z } ~^ celloutsig_0_24z[7:2];
  assign celloutsig_0_45z = { celloutsig_0_41z[5:1], celloutsig_0_31z } ~^ { celloutsig_0_3z[7:3], celloutsig_0_40z };
  assign celloutsig_0_60z = celloutsig_0_36z[3:1] ~^ celloutsig_0_16z[6:4];
  assign celloutsig_0_80z = { in_data[62:39], celloutsig_0_73z } ~^ { celloutsig_0_64z[11:1], celloutsig_0_3z, celloutsig_0_29z, celloutsig_0_79z };
  assign celloutsig_0_11z = { in_data[4:0], celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_3z } ~^ { celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_2z, celloutsig_0_10z };
  assign celloutsig_0_25z = celloutsig_0_3z[7:5] ~^ { celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_8z };
  always_latch
    if (clkin_data[0]) celloutsig_0_30z = 5'h00;
    else if (celloutsig_1_19z[0]) celloutsig_0_30z = { celloutsig_0_29z, celloutsig_0_8z, celloutsig_0_12z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_41z = 9'h000;
    else if (celloutsig_1_19z[0]) celloutsig_0_41z = celloutsig_0_13z[14:6];
  always_latch
    if (!clkin_data[0]) celloutsig_0_42z = 11'h000;
    else if (!celloutsig_1_19z[0]) celloutsig_0_42z = { celloutsig_0_38z[2:1], celloutsig_0_34z, celloutsig_0_3z };
  always_latch
    if (clkin_data[0]) celloutsig_0_51z = 5'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_51z = { celloutsig_0_28z[4:1], 1'h1 };
  always_latch
    if (!clkin_data[0]) celloutsig_0_58z = 6'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_58z = { celloutsig_0_6z, celloutsig_0_48z[6:2] };
  always_latch
    if (!clkin_data[0]) celloutsig_0_79z = 3'h0;
    else if (!celloutsig_1_19z[0]) celloutsig_0_79z = celloutsig_0_51z[3:1];
  always_latch
    if (clkin_data[0]) celloutsig_0_24z = 8'h00;
    else if (!celloutsig_1_19z[0]) celloutsig_0_24z = { celloutsig_0_3z[7:1], celloutsig_0_6z };
  assign celloutsig_0_37z = ~((celloutsig_0_25z[2] & celloutsig_0_36z[1]) | (celloutsig_0_12z & celloutsig_0_9z[5]));
  assign celloutsig_0_50z = ~((celloutsig_0_21z & celloutsig_0_45z[5]) | (celloutsig_0_31z & celloutsig_0_20z));
  assign celloutsig_0_55z = ~((celloutsig_0_2z & celloutsig_0_25z[2]) | (celloutsig_0_20z & celloutsig_0_13z[14]));
  assign celloutsig_1_2z = ~((celloutsig_1_0z & celloutsig_1_0z) | (celloutsig_1_0z & celloutsig_1_0z));
  assign celloutsig_1_13z = ~((celloutsig_1_7z[5] & celloutsig_1_0z) | (celloutsig_1_4z & celloutsig_1_12z[5]));
  assign celloutsig_0_28z[4:1] = celloutsig_0_27z[11:8] ~^ celloutsig_0_10z[5:2];
  assign { celloutsig_0_48z[0], celloutsig_0_48z[6:2], celloutsig_0_48z[8], celloutsig_0_48z[9], celloutsig_0_48z[1] } = { celloutsig_0_40z, celloutsig_0_36z, celloutsig_0_19z, celloutsig_0_6z, celloutsig_0_3z[3], celloutsig_0_2z } ~^ { celloutsig_0_0z, celloutsig_0_30z, celloutsig_0_28z[1], celloutsig_0_28z[2], celloutsig_0_44z };
  assign celloutsig_0_28z[0] = 1'h1;
  assign celloutsig_0_48z[7] = celloutsig_0_6z;
  assign { out_data[130:128], out_data[106:96], out_data[40:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_87z, celloutsig_0_88z };
endmodule
