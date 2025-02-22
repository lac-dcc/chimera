/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [14:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [7:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  reg [2:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [6:0] celloutsig_0_2z;
  wire [9:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [8:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [2:0] celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire celloutsig_0_44z;
  wire [7:0] celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [3:0] celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  reg [7:0] celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire [9:0] celloutsig_0_57z;
  wire [4:0] celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_62z;
  wire [18:0] celloutsig_0_63z;
  wire [25:0] celloutsig_0_6z;
  wire celloutsig_0_73z;
  reg [7:0] celloutsig_0_74z;
  wire [18:0] celloutsig_0_7z;
  wire [6:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [3:0] celloutsig_1_0z;
  wire [5:0] celloutsig_1_10z;
  wire [8:0] celloutsig_1_13z;
  wire celloutsig_1_15z;
  wire [2:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [2:0] celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [8:0] celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_23z = celloutsig_0_19z ? celloutsig_0_9z : celloutsig_0_21z;
  assign celloutsig_0_31z = celloutsig_0_26z ? celloutsig_0_12z : celloutsig_0_17z[3];
  assign celloutsig_0_47z = ~(celloutsig_0_38z & celloutsig_0_16z);
  assign celloutsig_0_61z = ~(celloutsig_0_38z & celloutsig_0_9z);
  assign celloutsig_0_1z = ~(in_data[95] & celloutsig_0_0z);
  assign celloutsig_1_7z = !(in_data[140] ? celloutsig_1_3z : celloutsig_1_5z);
  assign celloutsig_0_9z = !(celloutsig_0_7z[17] ? celloutsig_0_5z[3] : celloutsig_0_5z[4]);
  assign celloutsig_0_29z = !(celloutsig_0_9z ? celloutsig_0_10z[8] : celloutsig_0_21z);
  assign celloutsig_0_32z = !(celloutsig_0_13z ? celloutsig_0_26z : celloutsig_0_9z);
  assign celloutsig_0_26z = ~(celloutsig_0_14z[2] | celloutsig_0_18z);
  assign celloutsig_0_4z = celloutsig_0_3z | celloutsig_0_2z[1];
  assign celloutsig_1_5z = celloutsig_1_1z ^ celloutsig_1_3z;
  assign celloutsig_0_5z = { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_0z } + celloutsig_0_2z[6:2];
  assign celloutsig_0_2z = in_data[60:54] + in_data[41:35];
  assign celloutsig_0_51z = { celloutsig_0_5z[3:1], celloutsig_0_34z } / { 1'h1, celloutsig_0_47z, celloutsig_0_40z, celloutsig_0_44z };
  assign celloutsig_0_13z = celloutsig_0_7z[17:10] == { in_data[74:68], celloutsig_0_11z };
  assign celloutsig_0_44z = celloutsig_0_30z[5:0] === { celloutsig_0_7z[10], celloutsig_0_39z, celloutsig_0_26z, celloutsig_0_41z };
  assign celloutsig_0_20z = { celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_3z } === celloutsig_0_7z[9:0];
  assign celloutsig_0_24z = celloutsig_0_2z[5:3] === { celloutsig_0_14z[1:0], celloutsig_0_18z };
  assign celloutsig_0_42z = { celloutsig_0_7z[17:16], celloutsig_0_0z, celloutsig_0_15z } >= celloutsig_0_6z[13:10];
  assign celloutsig_1_15z = { in_data[168:153], celloutsig_1_4z, celloutsig_1_1z } >= { celloutsig_1_10z[5:1], celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_16z = { celloutsig_0_7z[15:11], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_4z } >= { celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_15z };
  assign celloutsig_0_27z = { celloutsig_0_2z[4:2], celloutsig_0_14z } >= { celloutsig_0_3z, celloutsig_0_24z, celloutsig_0_13z, celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_11z };
  assign celloutsig_0_37z = { celloutsig_0_10z[12], celloutsig_0_29z, celloutsig_0_18z, celloutsig_0_29z, celloutsig_0_27z, celloutsig_0_27z, celloutsig_0_5z } > { celloutsig_0_20z, celloutsig_0_34z, celloutsig_0_36z };
  assign celloutsig_0_55z = { celloutsig_0_23z, celloutsig_0_52z, celloutsig_0_54z, celloutsig_0_21z } > { celloutsig_0_37z, celloutsig_0_54z, celloutsig_0_3z, celloutsig_0_44z };
  assign celloutsig_1_18z = { celloutsig_1_13z[2:1], celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_10z } > { celloutsig_1_10z[5:2], celloutsig_1_10z };
  assign celloutsig_0_18z = { celloutsig_0_6z[20:14], celloutsig_0_13z, celloutsig_0_9z, celloutsig_0_3z, celloutsig_0_16z, celloutsig_0_17z, celloutsig_0_0z } > { celloutsig_0_17z[3], celloutsig_0_16z, celloutsig_0_2z, celloutsig_0_15z, celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_15z };
  assign celloutsig_0_0z = in_data[45:34] && in_data[13:2];
  assign celloutsig_0_34z = { celloutsig_0_21z, celloutsig_0_32z, celloutsig_0_17z } && { celloutsig_0_6z[17:9], celloutsig_0_33z };
  assign celloutsig_0_22z = { celloutsig_0_17z[5:3], celloutsig_0_2z, celloutsig_0_8z } && in_data[81:65];
  assign celloutsig_0_46z = { celloutsig_0_30z[8:1], celloutsig_0_39z, celloutsig_0_2z } < { in_data[94:83], celloutsig_0_25z, celloutsig_0_11z, celloutsig_0_42z, celloutsig_0_24z };
  assign celloutsig_0_48z = { celloutsig_0_7z[14], celloutsig_0_20z, celloutsig_0_24z, celloutsig_0_8z } < { in_data[88:87], celloutsig_0_25z, celloutsig_0_27z, celloutsig_0_31z, celloutsig_0_26z, celloutsig_0_39z, celloutsig_0_40z, celloutsig_0_42z, celloutsig_0_11z };
  assign celloutsig_0_53z = celloutsig_0_46z & ~(celloutsig_0_51z[0]);
  assign celloutsig_1_1z = celloutsig_1_0z[1] & ~(in_data[96]);
  assign celloutsig_0_15z = celloutsig_0_0z & ~(celloutsig_0_11z);
  assign celloutsig_0_57z = { celloutsig_0_15z, celloutsig_0_29z, celloutsig_0_44z, celloutsig_0_35z, celloutsig_0_41z, celloutsig_0_0z, celloutsig_0_35z, celloutsig_0_12z } % { 1'h1, celloutsig_0_12z, celloutsig_0_55z, celloutsig_0_28z, celloutsig_0_21z, celloutsig_0_15z, celloutsig_0_21z, celloutsig_0_44z };
  assign celloutsig_0_6z = { in_data[2:1], celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_5z } % { 1'h1, in_data[39:30], celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_0_36z = celloutsig_0_2z[2] ? { celloutsig_0_34z, celloutsig_0_17z } : { celloutsig_0_10z[14:9], celloutsig_0_3z, celloutsig_0_35z, celloutsig_0_27z };
  assign celloutsig_0_50z = { celloutsig_0_48z, celloutsig_0_28z, celloutsig_0_25z } != { celloutsig_0_2z[0], celloutsig_0_31z, celloutsig_0_20z, celloutsig_0_29z, celloutsig_0_48z };
  assign celloutsig_1_3z = { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z } !== celloutsig_1_0z[2:0];
  assign celloutsig_0_19z = { celloutsig_0_2z[6:1], celloutsig_0_0z } !== { celloutsig_0_8z[5:2], celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_3z };
  assign celloutsig_0_21z = { celloutsig_0_10z[11:2], celloutsig_0_2z } !== { celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_18z, celloutsig_0_11z };
  assign celloutsig_1_6z = ~ in_data[161:153];
  assign celloutsig_0_39z = & { celloutsig_0_35z, celloutsig_0_30z[8:0], celloutsig_0_24z, celloutsig_0_11z };
  assign celloutsig_1_4z = & { celloutsig_1_2z, celloutsig_1_1z, in_data[106:104] };
  assign celloutsig_0_11z = celloutsig_0_8z[1] & celloutsig_0_10z[5];
  assign celloutsig_0_52z = | { celloutsig_0_51z, celloutsig_0_45z, celloutsig_0_40z, celloutsig_0_32z, celloutsig_0_31z, celloutsig_0_25z, celloutsig_0_13z };
  assign celloutsig_0_3z = ^ { celloutsig_0_2z[4:1], celloutsig_0_0z };
  assign celloutsig_0_35z = ^ { celloutsig_0_2z[0], celloutsig_0_24z, celloutsig_0_31z, celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_28z, celloutsig_0_3z, celloutsig_0_15z };
  assign celloutsig_0_38z = ^ { celloutsig_0_10z[6:4], celloutsig_0_17z, celloutsig_0_13z, celloutsig_0_37z, celloutsig_0_5z };
  assign celloutsig_0_73z = ^ { celloutsig_0_63z[8:0], celloutsig_0_53z, celloutsig_0_25z, celloutsig_0_62z };
  assign celloutsig_1_19z = ^ { celloutsig_1_2z[1], celloutsig_1_17z, celloutsig_1_8z };
  assign celloutsig_0_12z = ^ { celloutsig_0_10z[11:2], celloutsig_0_3z };
  assign celloutsig_0_25z = ^ { celloutsig_0_12z, celloutsig_0_14z, celloutsig_0_18z };
  assign celloutsig_1_2z = in_data[163:161] << { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_0_41z = celloutsig_0_17z[6:4] >> celloutsig_0_17z[5:3];
  assign celloutsig_0_45z = { celloutsig_0_7z[12:8], celloutsig_0_28z } >> celloutsig_0_30z[7:0];
  assign celloutsig_0_8z = celloutsig_0_7z[16:10] >> celloutsig_0_7z[15:9];
  assign celloutsig_1_10z = { celloutsig_1_6z[1], celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_2z } >> { celloutsig_1_6z[5:3], celloutsig_1_2z };
  assign celloutsig_1_13z = { celloutsig_1_6z[8:1], celloutsig_1_8z } >> { celloutsig_1_6z[0], celloutsig_1_1z, celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_2z, celloutsig_1_5z, celloutsig_1_8z };
  assign celloutsig_0_17z = { celloutsig_0_2z[6:1], celloutsig_0_11z, celloutsig_0_1z } >> { celloutsig_0_13z, celloutsig_0_8z };
  assign celloutsig_0_63z = { celloutsig_0_2z[1], celloutsig_0_0z, celloutsig_0_48z, celloutsig_0_42z, celloutsig_0_61z, celloutsig_0_42z, celloutsig_0_0z, celloutsig_0_15z, celloutsig_0_57z, celloutsig_0_38z } <<< { celloutsig_0_26z, celloutsig_0_61z, celloutsig_0_52z, celloutsig_0_16z, celloutsig_0_62z, celloutsig_0_28z, celloutsig_0_17z, celloutsig_0_24z, celloutsig_0_35z, celloutsig_0_19z };
  assign celloutsig_0_7z = { celloutsig_0_6z[17:4], celloutsig_0_5z } <<< celloutsig_0_6z[20:2];
  assign celloutsig_1_0z = in_data[153:150] <<< in_data[149:146];
  assign celloutsig_0_10z = celloutsig_0_7z[18:4] <<< { celloutsig_0_2z[4:0], celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_30z = { celloutsig_0_6z[4], celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_24z, celloutsig_0_0z, celloutsig_0_18z } <<< { celloutsig_0_8z[4:0], celloutsig_0_5z };
  assign celloutsig_1_17z = celloutsig_1_2z ~^ { celloutsig_1_15z, celloutsig_1_5z, celloutsig_1_15z };
  assign celloutsig_0_14z = celloutsig_0_10z[2:0] ~^ { celloutsig_0_10z[14:13], celloutsig_0_12z };
  assign celloutsig_0_33z = ~((celloutsig_0_28z[1] & celloutsig_0_0z) | celloutsig_0_24z);
  assign celloutsig_0_40z = ~((celloutsig_0_36z[3] & celloutsig_0_33z) | celloutsig_0_22z);
  assign celloutsig_0_62z = ~((celloutsig_0_61z & celloutsig_0_27z) | celloutsig_0_47z);
  assign celloutsig_1_8z = ~((celloutsig_1_4z & celloutsig_1_3z) | celloutsig_1_7z);
  always_latch
    if (clkin_data[32]) celloutsig_0_54z = 8'h00;
    else if (!clkin_data[0]) celloutsig_0_54z = { celloutsig_0_10z[1], celloutsig_0_50z, celloutsig_0_40z, celloutsig_0_51z, celloutsig_0_47z };
  always_latch
    if (clkin_data[64]) celloutsig_0_74z = 8'h00;
    else if (celloutsig_1_19z) celloutsig_0_74z = { celloutsig_0_36z[8:3], celloutsig_0_53z, celloutsig_0_27z };
  always_latch
    if (clkin_data[32]) celloutsig_0_28z = 3'h0;
    else if (!celloutsig_1_19z) celloutsig_0_28z = celloutsig_0_10z[10:8];
  assign { out_data[128], out_data[96], out_data[32], out_data[7:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_73z, celloutsig_0_74z };
endmodule
