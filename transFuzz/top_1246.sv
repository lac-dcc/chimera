/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [3:0] _00_;
  reg [18:0] _01_;
  wire [16:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [20:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [6:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [5:0] celloutsig_0_20z;
  wire [9:0] celloutsig_0_21z;
  wire [23:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [2:0] celloutsig_0_26z;
  wire [5:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [4:0] celloutsig_0_2z;
  wire [7:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [2:0] celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire [20:0] celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire [3:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_43z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire [3:0] celloutsig_0_48z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire [5:0] celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_57z;
  wire [17:0] celloutsig_0_58z;
  wire celloutsig_0_59z;
  wire [17:0] celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire [11:0] celloutsig_0_62z;
  wire celloutsig_0_67z;
  wire [13:0] celloutsig_0_68z;
  wire celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_71z;
  wire celloutsig_0_73z;
  wire [5:0] celloutsig_0_74z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [6:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [8:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [4:0] celloutsig_1_4z;
  wire [7:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [24:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = in_data[78:62] + in_data[93:77];
  assign celloutsig_0_39z = { celloutsig_0_5z[4:3], celloutsig_0_16z, celloutsig_0_12z } + { in_data[3], celloutsig_0_31z, celloutsig_0_4z, celloutsig_0_25z };
  assign celloutsig_0_48z = in_data[51:48] + celloutsig_0_14z[5:2];
  assign celloutsig_0_5z = { celloutsig_0_4z, celloutsig_0_0z } + { celloutsig_0_0z[7:6], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_58z = { celloutsig_0_30z[7:2], celloutsig_0_48z, celloutsig_0_8z, celloutsig_0_18z, celloutsig_0_24z, celloutsig_0_48z, celloutsig_0_25z } + { celloutsig_0_50z, celloutsig_0_29z, celloutsig_0_57z, celloutsig_0_20z, celloutsig_0_30z, celloutsig_0_35z };
  assign celloutsig_1_4z = in_data[177:173] + { in_data[131:130], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_5z = { celloutsig_1_4z[4:3], celloutsig_1_0z, celloutsig_1_4z } + { in_data[132:127], celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_0_11z = in_data[88:68] + { celloutsig_0_0z[16:14], celloutsig_0_5z };
  assign celloutsig_0_14z = { in_data[10:7], celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_8z } + { in_data[87:83], celloutsig_0_10z, celloutsig_0_10z };
  assign celloutsig_0_21z = { celloutsig_0_0z[14:6], celloutsig_0_4z } + celloutsig_0_5z[11:2];
  assign celloutsig_0_26z = celloutsig_0_9z[2:0] + celloutsig_0_0z[4:2];
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _00_ <= 4'h0;
    else _00_ <= { celloutsig_0_0z[7:6], celloutsig_0_17z, celloutsig_0_45z };
  always_ff @(negedge celloutsig_1_19z, negedge clkin_data[0])
    if (!clkin_data[0]) _01_ <= 19'h00000;
    else _01_ <= { celloutsig_0_37z[20], celloutsig_0_12z, celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_32z, celloutsig_0_28z, celloutsig_0_25z, celloutsig_0_26z, celloutsig_0_9z };
  assign celloutsig_0_45z = { celloutsig_0_20z[0], celloutsig_0_16z, celloutsig_0_43z } >= { in_data[2], celloutsig_0_36z, celloutsig_0_12z };
  assign celloutsig_0_50z = { _00_[2:0], celloutsig_0_1z, celloutsig_0_41z, celloutsig_0_18z } >= { celloutsig_0_5z[2:1], celloutsig_0_8z, celloutsig_0_17z, celloutsig_0_6z, celloutsig_0_34z };
  assign celloutsig_0_54z = { celloutsig_0_15z, celloutsig_0_26z, celloutsig_0_46z } >= { celloutsig_0_51z[4:1], celloutsig_0_12z };
  assign celloutsig_0_57z = { _01_[10:9], celloutsig_0_43z, celloutsig_0_54z, celloutsig_0_36z } >= { celloutsig_0_5z[9:8], celloutsig_0_38z, celloutsig_0_17z, celloutsig_0_8z };
  assign celloutsig_0_7z = celloutsig_0_5z[11:3] >= { celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_4z };
  assign celloutsig_0_67z = { _01_[17:15], celloutsig_0_52z, celloutsig_0_38z } >= { celloutsig_0_62z[9:6], celloutsig_0_29z };
  assign celloutsig_0_70z = { celloutsig_0_51z[5:2], celloutsig_0_35z } >= { celloutsig_0_16z, celloutsig_0_13z, celloutsig_0_49z, celloutsig_0_3z, celloutsig_0_49z };
  assign celloutsig_0_73z = { celloutsig_0_51z[4:3], celloutsig_0_43z, celloutsig_0_70z, celloutsig_0_28z, celloutsig_0_61z, celloutsig_0_67z, celloutsig_0_1z, celloutsig_0_8z } >= { celloutsig_0_68z[12:5], celloutsig_0_59z };
  assign celloutsig_1_0z = in_data[116:108] >= in_data[167:159];
  assign celloutsig_1_11z = celloutsig_1_9z[16:5] >= { celloutsig_1_5z[6:5], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_5z };
  assign celloutsig_0_10z = { celloutsig_0_5z[12:0], celloutsig_0_3z } >= { celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_4z };
  assign celloutsig_1_19z = { celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_18z, celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_18z, celloutsig_1_10z } >= { celloutsig_1_9z[9:3], celloutsig_1_4z, celloutsig_1_1z };
  assign celloutsig_0_12z = { in_data[26:22], celloutsig_0_4z } >= { celloutsig_0_9z[5:1], celloutsig_0_1z };
  assign celloutsig_0_15z = { celloutsig_0_11z[12:2], celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_7z, celloutsig_0_2z } >= { celloutsig_0_9z[5:1], celloutsig_0_13z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_4z };
  assign celloutsig_0_16z = { celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_6z } >= celloutsig_0_11z[12:0];
  assign celloutsig_0_19z = celloutsig_0_11z[12:1] >= { celloutsig_0_0z[12:6], celloutsig_0_15z, celloutsig_0_18z, celloutsig_0_17z, celloutsig_0_10z, celloutsig_0_3z };
  assign celloutsig_0_36z = celloutsig_0_20z >= { celloutsig_0_14z[5:4], celloutsig_0_23z, celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_35z };
  assign celloutsig_0_4z = in_data[92:75] > { in_data[47:31], celloutsig_0_1z };
  assign celloutsig_0_52z = { celloutsig_0_11z[4:2], _00_, celloutsig_0_10z } > { celloutsig_0_30z[6:3], celloutsig_0_7z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_59z = { celloutsig_0_21z[5:0], celloutsig_0_27z, celloutsig_0_23z, celloutsig_0_55z, celloutsig_0_43z, celloutsig_0_48z } > { celloutsig_0_58z[16:11], celloutsig_0_23z, celloutsig_0_21z, celloutsig_0_15z, celloutsig_0_13z };
  assign celloutsig_1_1z = in_data[184:178] > in_data[173:167];
  assign celloutsig_1_3z = in_data[175:173] > { celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_7z = { celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_4z } > { celloutsig_1_5z[7:4], celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_0z };
  assign celloutsig_1_18z = { celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_10z, celloutsig_1_10z } > { celloutsig_1_16z[2:0], celloutsig_1_12z };
  assign celloutsig_0_18z = { celloutsig_0_11z[19], celloutsig_0_2z, celloutsig_0_17z, celloutsig_0_16z, celloutsig_0_10z, celloutsig_0_17z, celloutsig_0_15z } > { celloutsig_0_0z[9:1], celloutsig_0_4z, celloutsig_0_16z };
  assign celloutsig_0_24z = celloutsig_0_20z[4:1] > celloutsig_0_14z[5:2];
  assign celloutsig_0_28z = { celloutsig_0_0z[16:6], celloutsig_0_24z, celloutsig_0_8z, celloutsig_0_22z, celloutsig_0_1z, celloutsig_0_25z, celloutsig_0_16z } > { celloutsig_0_27z[5:4], celloutsig_0_1z, celloutsig_0_23z, celloutsig_0_20z, celloutsig_0_3z, celloutsig_0_27z, celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_13z };
  assign celloutsig_0_29z = { celloutsig_0_27z[5:4], celloutsig_0_25z } > { celloutsig_0_24z, celloutsig_0_8z, celloutsig_0_4z };
  assign celloutsig_0_34z = { celloutsig_0_30z[3:1], celloutsig_0_1z, celloutsig_0_23z } > { celloutsig_0_5z[12:10], celloutsig_0_13z, celloutsig_0_24z };
  assign celloutsig_0_35z = celloutsig_0_20z > celloutsig_0_5z[9:4];
  assign celloutsig_0_51z = - { celloutsig_0_22z[1], celloutsig_0_17z, celloutsig_0_29z, celloutsig_0_28z, celloutsig_0_13z, celloutsig_0_46z };
  assign celloutsig_0_9z = - { celloutsig_0_0z[15:10], celloutsig_0_8z };
  assign celloutsig_1_9z = - { in_data[162:148], celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_0z, celloutsig_1_6z };
  assign celloutsig_1_16z = - { in_data[183:177], celloutsig_1_8z, celloutsig_1_8z };
  assign celloutsig_0_20z = - { in_data[64], celloutsig_0_3z, celloutsig_0_19z, celloutsig_0_16z, celloutsig_0_10z, celloutsig_0_8z };
  assign celloutsig_0_32z = - { celloutsig_0_26z[2:1], celloutsig_0_24z };
  assign celloutsig_0_43z = ~^ { celloutsig_0_26z, celloutsig_0_26z };
  assign celloutsig_0_71z = ~^ { celloutsig_0_11z[15:0], celloutsig_0_62z };
  assign celloutsig_1_12z = ~^ { celloutsig_1_10z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_8z, celloutsig_1_3z };
  assign celloutsig_0_1z = ~^ in_data[61:48];
  assign celloutsig_0_17z = ~^ celloutsig_0_9z[5:3];
  assign celloutsig_0_25z = ~^ celloutsig_0_22z[19:13];
  assign celloutsig_0_3z = ~^ celloutsig_0_0z[13:4];
  assign celloutsig_0_38z = ^ { celloutsig_0_27z[1], celloutsig_0_19z, celloutsig_0_9z };
  assign celloutsig_0_41z = ^ { celloutsig_0_27z[4:2], celloutsig_0_29z };
  assign celloutsig_0_46z = ^ { celloutsig_0_21z[5], celloutsig_0_23z, celloutsig_0_25z };
  assign celloutsig_0_49z = ^ { celloutsig_0_11z[20:9], celloutsig_0_12z, celloutsig_0_3z };
  assign celloutsig_0_55z = ^ { celloutsig_0_21z[5:4], celloutsig_0_13z };
  assign celloutsig_0_6z = ^ { celloutsig_0_5z[16:10], celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_0_8z = ^ { in_data[37:24], celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_4z };
  assign celloutsig_1_2z = ^ { in_data[148:137], celloutsig_1_0z };
  assign celloutsig_1_6z = ^ in_data[155:150];
  assign celloutsig_0_13z = ^ { celloutsig_0_0z[14:8], celloutsig_0_1z };
  assign celloutsig_0_23z = ^ { celloutsig_0_5z[16:1], celloutsig_0_17z };
  assign celloutsig_0_31z = ^ { celloutsig_0_1z, celloutsig_0_29z, celloutsig_0_26z, celloutsig_0_3z, celloutsig_0_20z };
  assign celloutsig_0_37z = { celloutsig_0_11z[17:2], celloutsig_0_26z, celloutsig_0_4z, celloutsig_0_35z } >>> { in_data[80:63], celloutsig_0_29z, celloutsig_0_8z, celloutsig_0_18z };
  assign celloutsig_0_62z = { celloutsig_0_20z, celloutsig_0_2z, celloutsig_0_15z } >>> _01_[13:2];
  assign celloutsig_0_68z = { celloutsig_0_11z[12:1], celloutsig_0_36z, celloutsig_0_40z } >>> { celloutsig_0_51z[3:2], celloutsig_0_59z, celloutsig_0_48z, celloutsig_0_35z, celloutsig_0_49z, celloutsig_0_7z, celloutsig_0_54z, celloutsig_0_23z, celloutsig_0_12z, celloutsig_0_57z };
  assign celloutsig_0_74z = { celloutsig_0_37z[20:17], celloutsig_0_17z, celloutsig_0_24z } >>> { celloutsig_0_14z[1], celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_69z, celloutsig_0_46z, celloutsig_0_71z };
  assign celloutsig_0_22z = { celloutsig_0_5z[17:1], celloutsig_0_4z, celloutsig_0_20z } >>> { celloutsig_0_11z[17:1], celloutsig_0_19z, celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_12z };
  assign celloutsig_0_2z = celloutsig_0_0z[10:6] >>> celloutsig_0_0z[6:2];
  assign celloutsig_0_27z = { celloutsig_0_22z[23:20], celloutsig_0_3z, celloutsig_0_15z } >>> { celloutsig_0_11z[12:10], celloutsig_0_25z, celloutsig_0_15z, celloutsig_0_4z };
  assign celloutsig_0_30z = { celloutsig_0_5z[4:3], celloutsig_0_20z } >>> { celloutsig_0_5z[12:6], celloutsig_0_7z };
  assign celloutsig_0_40z = ~((celloutsig_0_10z & celloutsig_0_39z[1]) | celloutsig_0_17z);
  assign celloutsig_0_61z = ~((celloutsig_0_41z & celloutsig_0_50z) | celloutsig_0_54z);
  assign celloutsig_0_69z = ~((celloutsig_0_7z & celloutsig_0_62z[11]) | in_data[40]);
  assign celloutsig_1_8z = ~((celloutsig_1_2z & celloutsig_1_1z) | celloutsig_1_0z);
  assign celloutsig_1_10z = ~((celloutsig_1_6z & celloutsig_1_6z) | celloutsig_1_2z);
  assign { out_data[128], out_data[96], out_data[32], out_data[5:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_73z, celloutsig_0_74z };
endmodule
