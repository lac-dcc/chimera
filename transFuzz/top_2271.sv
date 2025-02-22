/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [13:0] _00_;
  wire celloutsig_0_0z;
  wire [4:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  reg [6:0] celloutsig_0_13z;
  wire [8:0] celloutsig_0_14z;
  wire [4:0] celloutsig_0_15z;
  wire [10:0] celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire [6:0] celloutsig_0_18z;
  reg [2:0] celloutsig_0_19z;
  wire [2:0] celloutsig_0_1z;
  wire [8:0] celloutsig_0_20z;
  wire [6:0] celloutsig_0_21z;
  wire [3:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  reg [3:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  reg [4:0] celloutsig_0_27z;
  wire [48:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [21:0] celloutsig_0_30z;
  wire [9:0] celloutsig_0_31z;
  wire [9:0] celloutsig_0_32z;
  wire [19:0] celloutsig_0_34z;
  reg [3:0] celloutsig_0_36z;
  wire [10:0] celloutsig_0_37z;
  wire [17:0] celloutsig_0_39z;
  reg [13:0] celloutsig_0_3z;
  wire [5:0] celloutsig_0_41z;
  wire [2:0] celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire [3:0] celloutsig_0_44z;
  wire [7:0] celloutsig_0_45z;
  wire [4:0] celloutsig_0_46z;
  wire [18:0] celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire [5:0] celloutsig_0_4z;
  wire [23:0] celloutsig_0_52z;
  wire [4:0] celloutsig_0_53z;
  wire [4:0] celloutsig_0_56z;
  wire [18:0] celloutsig_0_57z;
  wire [7:0] celloutsig_0_5z;
  reg [16:0] celloutsig_0_61z;
  wire [5:0] celloutsig_0_62z;
  wire [3:0] celloutsig_0_63z;
  wire celloutsig_0_64z;
  wire [6:0] celloutsig_0_65z;
  wire celloutsig_0_69z;
  wire [20:0] celloutsig_0_6z;
  wire celloutsig_0_74z;
  wire celloutsig_0_78z;
  wire [3:0] celloutsig_0_7z;
  wire [11:0] celloutsig_0_86z;
  wire [13:0] celloutsig_0_87z;
  wire [19:0] celloutsig_0_8z;
  wire [12:0] celloutsig_0_9z;
  wire [2:0] celloutsig_1_0z;
  wire [6:0] celloutsig_1_13z;
  wire [2:0] celloutsig_1_14z;
  wire [5:0] celloutsig_1_18z;
  wire [7:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire [16:0] celloutsig_1_2z;
  wire [3:0] celloutsig_1_3z;
  wire [18:0] celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire [7:0] celloutsig_1_6z;
  wire [16:0] celloutsig_1_8z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  always_ff @(posedge celloutsig_1_18z[0], negedge clkin_data[96])
    if (!clkin_data[96]) _00_ <= 14'h0000;
    else _00_ <= { celloutsig_0_16z[3:0], celloutsig_0_21z, celloutsig_0_1z };
  assign celloutsig_0_32z = celloutsig_0_30z[13:4] / { 1'h1, celloutsig_0_30z[15:7] };
  assign celloutsig_0_37z = { celloutsig_0_2z, celloutsig_0_23z, celloutsig_0_17z, celloutsig_0_12z, celloutsig_0_12z, celloutsig_0_12z } / { 1'h1, celloutsig_0_8z[5:0], celloutsig_0_36z };
  assign celloutsig_0_44z = celloutsig_0_4z[4:1] / { 1'h1, celloutsig_0_14z[7:5] };
  assign celloutsig_0_47z = celloutsig_0_28z[44:26] / { 1'h1, celloutsig_0_30z[9:2], celloutsig_0_13z, celloutsig_0_42z };
  assign celloutsig_0_62z = celloutsig_0_41z / { 1'h1, celloutsig_0_47z[6:2] };
  assign celloutsig_0_8z = { in_data[28:23], celloutsig_0_3z } / { 1'h1, celloutsig_0_3z[9:0], celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_1_0z = in_data[171:169] / { 1'h1, in_data[186:185] };
  assign celloutsig_1_3z = in_data[105:102] / { 1'h1, celloutsig_1_0z };
  assign celloutsig_1_19z = { celloutsig_1_0z[2:1], celloutsig_1_18z } / { 1'h1, celloutsig_1_2z[15:12], celloutsig_1_14z };
  assign celloutsig_0_14z = { celloutsig_0_5z[3:2], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_10z } / { 1'h1, celloutsig_0_6z[10:3] };
  assign celloutsig_0_17z = celloutsig_0_10z[3:1] / { 1'h1, in_data[28], celloutsig_0_0z };
  assign celloutsig_0_0z = in_data[30:26] && in_data[63:59];
  assign celloutsig_0_43z = celloutsig_0_21z && celloutsig_0_30z[17:11];
  assign celloutsig_0_64z = { in_data[24:3], celloutsig_0_44z, celloutsig_0_63z } && { celloutsig_0_57z[14:4], celloutsig_0_47z };
  assign celloutsig_0_69z = celloutsig_0_37z[5:1] && celloutsig_0_9z[9:5];
  assign celloutsig_0_78z = { celloutsig_0_61z[15], celloutsig_0_0z, celloutsig_0_26z } && celloutsig_0_8z[2:0];
  assign celloutsig_1_1z = { in_data[122:97], celloutsig_1_0z } && { in_data[174:149], celloutsig_1_0z };
  assign celloutsig_0_11z = celloutsig_0_10z && celloutsig_0_3z[8:4];
  assign celloutsig_0_2z = { celloutsig_0_1z[2:1], celloutsig_0_0z, celloutsig_0_0z } && { in_data[86:84], celloutsig_0_0z };
  assign celloutsig_0_26z = { in_data[35], celloutsig_0_14z } && { celloutsig_0_21z, celloutsig_0_19z };
  assign celloutsig_0_29z = { celloutsig_0_7z[3:1], celloutsig_0_7z[1] } && _00_[4:1];
  assign celloutsig_0_39z = celloutsig_0_28z[40:23] % { 1'h1, celloutsig_0_20z[6:1], celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_15z };
  assign celloutsig_0_65z = { celloutsig_0_62z, celloutsig_0_26z } % { 1'h1, celloutsig_0_39z[6:1] };
  assign celloutsig_0_42z = ~ celloutsig_0_19z;
  assign celloutsig_1_2z = ~ { in_data[158:145], celloutsig_1_0z };
  assign celloutsig_1_5z = ~ celloutsig_1_2z[15:12];
  assign celloutsig_1_6z = ~ celloutsig_1_2z[8:1];
  assign celloutsig_0_1z = ~ in_data[67:65];
  assign celloutsig_0_31z = ~ _00_[13:4];
  assign celloutsig_0_45z = celloutsig_0_5z >> { celloutsig_0_31z[9:8], celloutsig_0_29z, celloutsig_0_36z, celloutsig_0_43z };
  assign celloutsig_0_46z = celloutsig_0_13z[4:0] >> celloutsig_0_20z[5:1];
  assign celloutsig_0_5z = celloutsig_0_3z[11:4] >> in_data[73:66];
  assign celloutsig_0_53z = { celloutsig_0_7z[3:2], celloutsig_0_17z } >> celloutsig_0_37z[10:6];
  assign celloutsig_0_56z = _00_[8:4] >> { celloutsig_0_53z[4], celloutsig_0_7z[3:1], celloutsig_0_7z[1] };
  assign celloutsig_0_6z = { celloutsig_0_3z[13:1], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_2z } >> { celloutsig_0_5z[4:0], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_0_86z = { in_data[73:63], celloutsig_0_26z } >> { celloutsig_0_56z[4:1], celloutsig_0_78z, celloutsig_0_65z };
  assign celloutsig_0_10z = in_data[77:73] >> celloutsig_0_5z[6:2];
  assign celloutsig_1_4z = { in_data[187], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_3z } >> { celloutsig_1_2z[13:3], celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_18z = celloutsig_1_6z[6:1] >> celloutsig_1_13z[5:0];
  assign celloutsig_0_15z = { celloutsig_0_6z[13:12], celloutsig_0_1z } >> celloutsig_0_14z[5:1];
  assign celloutsig_0_21z = in_data[47:41] >> celloutsig_0_13z;
  assign celloutsig_0_34z = { celloutsig_0_8z[19:11], celloutsig_0_32z, celloutsig_0_29z } - celloutsig_0_8z;
  assign celloutsig_0_41z = { celloutsig_0_19z[2], celloutsig_0_15z } - celloutsig_0_20z[8:3];
  assign celloutsig_0_4z = { celloutsig_0_3z[7:4], celloutsig_0_0z, celloutsig_0_0z } - { in_data[31:30], celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_52z = { celloutsig_0_1z[1:0], celloutsig_0_30z } - { celloutsig_0_34z[17:11], celloutsig_0_21z, celloutsig_0_41z, celloutsig_0_36z };
  assign celloutsig_0_57z = { celloutsig_0_27z[2:0], celloutsig_0_5z, celloutsig_0_45z } - { celloutsig_0_52z[22:17], celloutsig_0_45z, celloutsig_0_2z, celloutsig_0_44z };
  assign celloutsig_0_63z = celloutsig_0_6z[7:4] - celloutsig_0_32z[3:0];
  assign celloutsig_0_87z = celloutsig_0_47z[13:0] - { celloutsig_0_46z[4:2], celloutsig_0_43z, celloutsig_0_64z, celloutsig_0_25z, celloutsig_0_36z, celloutsig_0_74z };
  assign celloutsig_1_8z = in_data[188:172] - celloutsig_1_4z[18:2];
  assign celloutsig_1_13z = celloutsig_1_6z[6:0] - celloutsig_1_8z[14:8];
  assign celloutsig_1_14z = celloutsig_1_5z[2:0] - celloutsig_1_5z[3:1];
  assign celloutsig_0_16z = { celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_11z } - celloutsig_0_8z[16:6];
  assign celloutsig_0_20z = { celloutsig_0_5z[5:0], celloutsig_0_17z } - { celloutsig_0_18z[4:3], celloutsig_0_18z[6], celloutsig_0_18z[6], celloutsig_0_10z };
  assign celloutsig_0_23z = celloutsig_0_10z[3:0] - in_data[3:0];
  assign celloutsig_0_28z = { celloutsig_0_16z[10:3], celloutsig_0_13z, celloutsig_0_5z, celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_21z, celloutsig_0_5z } - { celloutsig_0_3z, celloutsig_0_27z, celloutsig_0_9z[12:2], celloutsig_0_9z[2], celloutsig_0_9z[2], celloutsig_0_18z[6], celloutsig_0_18z[6], celloutsig_0_18z[4:3], celloutsig_0_18z[6], celloutsig_0_18z[6], celloutsig_0_18z[0], celloutsig_0_14z, celloutsig_0_24z };
  assign celloutsig_0_30z = { celloutsig_0_6z[13:12], celloutsig_0_8z } - { celloutsig_0_8z[12:1], celloutsig_0_20z, celloutsig_0_24z };
  assign celloutsig_0_49z = ~((celloutsig_0_47z[17] & in_data[75]) | celloutsig_0_3z[0]);
  assign celloutsig_0_74z = ~((celloutsig_0_69z & celloutsig_0_30z[1]) | celloutsig_0_36z[0]);
  assign celloutsig_0_12z = ~((celloutsig_0_10z[2] & celloutsig_0_1z[1]) | celloutsig_0_4z[1]);
  assign celloutsig_0_24z = ~((celloutsig_0_4z[1] & celloutsig_0_3z[10]) | celloutsig_0_11z);
  always_latch
    if (clkin_data[96]) celloutsig_0_36z = 4'h0;
    else if (clkin_data[0]) celloutsig_0_36z = celloutsig_0_5z[6:3];
  always_latch
    if (clkin_data[96]) celloutsig_0_61z = 17'h00000;
    else if (clkin_data[0]) celloutsig_0_61z = { celloutsig_0_53z, celloutsig_0_49z, celloutsig_0_41z, celloutsig_0_29z, celloutsig_0_25z };
  always_latch
    if (clkin_data[96]) celloutsig_0_13z = 7'h00;
    else if (clkin_data[0]) celloutsig_0_13z = { celloutsig_0_6z[5], celloutsig_0_4z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_19z = 3'h0;
    else if (!clkin_data[32]) celloutsig_0_19z = celloutsig_0_3z[11:9];
  always_latch
    if (!clkin_data[96]) celloutsig_0_25z = 4'h0;
    else if (clkin_data[32]) celloutsig_0_25z = { celloutsig_0_3z[8], celloutsig_0_19z };
  always_latch
    if (!clkin_data[96]) celloutsig_0_27z = 5'h00;
    else if (clkin_data[32]) celloutsig_0_27z = { celloutsig_0_6z[6:3], celloutsig_0_11z };
  always_latch
    if (clkin_data[96]) celloutsig_0_3z = 14'h0000;
    else if (!clkin_data[0]) celloutsig_0_3z = in_data[51:38];
  assign { celloutsig_0_7z[1], celloutsig_0_7z[3:2] } = ~ { celloutsig_0_2z, celloutsig_0_1z[1], celloutsig_0_0z };
  assign celloutsig_0_9z[12:2] = ~ { celloutsig_0_6z[4:3], celloutsig_0_5z, celloutsig_0_2z };
  assign { celloutsig_0_18z[6], celloutsig_0_18z[4:3], celloutsig_0_18z[0] } = ~ { celloutsig_0_7z[1], celloutsig_0_7z[3:2], celloutsig_0_2z };
  assign { celloutsig_0_18z[5], celloutsig_0_18z[2:1] } = { celloutsig_0_18z[6], celloutsig_0_18z[6], celloutsig_0_18z[6] };
  assign celloutsig_0_7z[0] = celloutsig_0_7z[1];
  assign celloutsig_0_9z[1:0] = { celloutsig_0_9z[2], celloutsig_0_9z[2] };
  assign { out_data[133:128], out_data[103:96], out_data[43:32], out_data[13:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_86z, celloutsig_0_87z };
endmodule
