/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire [5:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  reg [7:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  reg [6:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire [4:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [23:0] celloutsig_0_20z;
  wire [14:0] celloutsig_0_21z;
  wire [9:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [6:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire [20:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [43:0] celloutsig_0_31z;
  reg [4:0] celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire [2:0] celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire [8:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire [14:0] celloutsig_0_40z;
  wire [4:0] celloutsig_0_41z;
  wire [7:0] celloutsig_0_42z;
  wire [12:0] celloutsig_0_43z;
  wire [9:0] celloutsig_0_44z;
  reg [22:0] celloutsig_0_45z;
  wire [2:0] celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire [3:0] celloutsig_0_4z;
  wire celloutsig_0_54z;
  wire celloutsig_0_57z;
  wire [17:0] celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire celloutsig_0_63z;
  wire celloutsig_0_68z;
  wire celloutsig_0_6z;
  wire celloutsig_0_73z;
  wire celloutsig_0_77z;
  reg [8:0] celloutsig_0_7z;
  reg [13:0] celloutsig_0_8z;
  wire celloutsig_0_90z;
  wire [4:0] celloutsig_0_91z;
  wire celloutsig_0_92z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [5:0] celloutsig_1_12z;
  wire [3:0] celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [12:0] celloutsig_1_1z;
  wire [9:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_30z = celloutsig_0_10z[3] ? celloutsig_0_2z : celloutsig_0_12z[2];
  assign celloutsig_0_57z = celloutsig_0_26z ? celloutsig_0_27z[3] : celloutsig_0_39z[7];
  assign celloutsig_0_63z = celloutsig_0_24z ? celloutsig_0_42z[4] : celloutsig_0_54z;
  assign celloutsig_0_77z = celloutsig_0_23z ? celloutsig_0_15z : celloutsig_0_68z;
  assign celloutsig_0_11z = celloutsig_0_4z[3] ? in_data[7] : celloutsig_0_10z[2];
  assign celloutsig_0_17z = celloutsig_0_11z ? celloutsig_0_10z[2] : celloutsig_0_16z;
  assign celloutsig_0_19z = celloutsig_0_0z ? celloutsig_0_8z[9] : celloutsig_0_0z;
  assign celloutsig_0_25z = celloutsig_0_18z[1] ? celloutsig_0_17z : celloutsig_0_10z[2];
  assign celloutsig_0_48z = ~(celloutsig_0_43z[1] | celloutsig_0_44z[5]);
  assign celloutsig_0_90z = ~(celloutsig_0_57z | celloutsig_0_73z);
  assign celloutsig_1_6z = ~(celloutsig_1_1z[9] | celloutsig_1_0z);
  assign celloutsig_1_18z = ~(celloutsig_1_5z | celloutsig_1_6z);
  assign celloutsig_0_13z = ~(celloutsig_0_9z | celloutsig_0_1z);
  assign celloutsig_0_23z = ~(celloutsig_0_8z[11] | celloutsig_0_14z[2]);
  assign celloutsig_0_2z = ~(in_data[29] | in_data[90]);
  assign celloutsig_0_24z = ~(celloutsig_0_12z[6] | celloutsig_0_10z[5]);
  assign celloutsig_0_28z = ~(celloutsig_0_9z | celloutsig_0_7z[8]);
  assign celloutsig_0_34z = ~((celloutsig_0_7z[4] | celloutsig_0_22z[7]) & celloutsig_0_1z);
  assign celloutsig_0_37z = ~((celloutsig_0_16z | celloutsig_0_12z[3]) & celloutsig_0_10z[5]);
  assign celloutsig_0_5z = ~((celloutsig_0_2z | celloutsig_0_1z) & celloutsig_0_3z);
  assign celloutsig_0_54z = ~((celloutsig_0_11z | celloutsig_0_14z[5]) & celloutsig_0_46z[1]);
  assign celloutsig_0_6z = ~((celloutsig_0_5z | celloutsig_0_1z) & celloutsig_0_0z);
  assign celloutsig_0_68z = ~((celloutsig_0_27z[0] | celloutsig_0_12z[4]) & celloutsig_0_34z);
  assign celloutsig_1_5z = ~((celloutsig_1_0z | celloutsig_1_4z[0]) & in_data[179]);
  assign celloutsig_0_9z = ~((in_data[43] | celloutsig_0_0z) & celloutsig_0_7z[4]);
  assign celloutsig_1_19z = ~((celloutsig_1_0z | celloutsig_1_1z[4]) & celloutsig_1_13z[3]);
  assign celloutsig_0_1z = ~((celloutsig_0_0z | in_data[4]) & in_data[2]);
  assign celloutsig_0_16z = ~((celloutsig_0_10z[2] | celloutsig_0_4z[2]) & celloutsig_0_7z[2]);
  assign celloutsig_0_40z = { celloutsig_0_18z[4], celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_37z, celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_24z } + { celloutsig_0_31z[32:26], celloutsig_0_31z[43:36] };
  assign celloutsig_0_42z = { celloutsig_0_26z, celloutsig_0_27z } + { celloutsig_0_36z[2], celloutsig_0_36z[2:1], celloutsig_0_36z[2], celloutsig_0_19z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_34z };
  assign celloutsig_0_4z = in_data[95:92] + { in_data[47:45], celloutsig_0_1z };
  assign celloutsig_0_44z = { celloutsig_0_8z[11:4], celloutsig_0_23z, celloutsig_0_13z } + celloutsig_0_20z[23:14];
  assign celloutsig_0_46z = { celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_26z } + { celloutsig_0_30z, celloutsig_0_16z, celloutsig_0_25z };
  assign celloutsig_0_91z = celloutsig_0_58z[10:6] + { celloutsig_0_58z[14:11], celloutsig_0_90z };
  assign celloutsig_1_1z = in_data[120:108] + { in_data[113:103], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_4z = { celloutsig_1_1z[11:3], celloutsig_1_0z } + in_data[181:172];
  assign celloutsig_1_12z = in_data[105:100] + celloutsig_1_4z[6:1];
  assign celloutsig_1_13z = in_data[154:151] + celloutsig_1_12z[5:2];
  assign celloutsig_0_18z = { in_data[76:74], celloutsig_0_6z, celloutsig_0_3z } + { celloutsig_0_7z[5:4], celloutsig_0_17z, celloutsig_0_11z, celloutsig_0_2z };
  assign celloutsig_0_22z = { celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_1z } + { celloutsig_0_7z, celloutsig_0_2z };
  assign celloutsig_0_27z = { celloutsig_0_14z[6:1], celloutsig_0_13z } + { celloutsig_0_7z[2], celloutsig_0_10z[5:1], celloutsig_0_10z[2] };
  assign celloutsig_0_29z = { in_data[75:58], celloutsig_0_25z, celloutsig_0_13z, celloutsig_0_28z } + { celloutsig_0_18z[3], celloutsig_0_18z, celloutsig_0_21z };
  assign celloutsig_0_0z = in_data[69:57] >= in_data[58:46];
  assign celloutsig_0_3z = in_data[55:53] >= in_data[89:87];
  assign celloutsig_0_73z = { celloutsig_0_7z[6:0], celloutsig_0_4z } >= { celloutsig_0_45z[21:13], celloutsig_0_48z, celloutsig_0_57z };
  assign celloutsig_0_92z = { celloutsig_0_41z[3], celloutsig_0_16z, celloutsig_0_26z } >= { celloutsig_0_63z, celloutsig_0_77z, celloutsig_0_25z };
  assign celloutsig_1_0z = in_data[147:145] >= in_data[163:161];
  assign celloutsig_0_15z = { celloutsig_0_8z[4:1], celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_6z, celloutsig_0_13z } >= { celloutsig_0_12z[6:0], celloutsig_0_0z, celloutsig_0_9z };
  assign celloutsig_0_26z = celloutsig_0_21z[12:0] >= { in_data[88:77], celloutsig_0_3z };
  assign celloutsig_0_41z = ~ { celloutsig_0_40z[7:6], celloutsig_0_30z, celloutsig_0_25z, celloutsig_0_5z };
  assign celloutsig_0_43z = ~ { celloutsig_0_23z, celloutsig_0_30z, celloutsig_0_9z, celloutsig_0_25z, celloutsig_0_26z, celloutsig_0_3z, celloutsig_0_27z };
  assign celloutsig_0_21z = ~ celloutsig_0_20z[21:7];
  always_latch
    if (clkin_data[0]) celloutsig_0_32z = 5'h00;
    else if (!celloutsig_1_19z) celloutsig_0_32z = in_data[13:9];
  always_latch
    if (!clkin_data[0]) celloutsig_0_45z = 23'h000000;
    else if (celloutsig_1_19z) celloutsig_0_45z = { celloutsig_0_31z[27:26], celloutsig_0_31z[43:34], celloutsig_0_31z[15:12], celloutsig_0_31z[33], celloutsig_0_31z[10], celloutsig_0_1z, celloutsig_0_4z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_7z = 9'h000;
    else if (!celloutsig_1_19z) celloutsig_0_7z = { in_data[36], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_5z, celloutsig_0_0z, celloutsig_0_6z };
  always_latch
    if (!clkin_data[0]) celloutsig_0_8z = 14'h0000;
    else if (celloutsig_1_19z) celloutsig_0_8z = { in_data[87:78], celloutsig_0_4z };
  always_latch
    if (clkin_data[0]) celloutsig_0_12z = 8'h00;
    else if (celloutsig_1_19z) celloutsig_0_12z = { celloutsig_0_8z[2:1], celloutsig_0_10z[5:1], celloutsig_0_10z[2] };
  always_latch
    if (!clkin_data[0]) celloutsig_0_14z = 7'h00;
    else if (celloutsig_1_19z) celloutsig_0_14z = { celloutsig_0_4z[0], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_2z };
  assign { celloutsig_0_10z[5:4], celloutsig_0_10z[2], celloutsig_0_10z[3], celloutsig_0_10z[1] } = ~ { celloutsig_0_4z[1:0], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_0z };
  assign { celloutsig_0_31z[9], celloutsig_0_31z[32:26], celloutsig_0_31z[43:34], celloutsig_0_31z[15:12], celloutsig_0_31z[8:0], celloutsig_0_31z[33], celloutsig_0_31z[10] } = ~ { celloutsig_0_30z, celloutsig_0_29z, celloutsig_0_19z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_3z };
  assign { celloutsig_0_36z[1], celloutsig_0_36z[2] } = ~ { celloutsig_0_34z, celloutsig_0_28z };
  assign { celloutsig_0_39z[8], celloutsig_0_39z[5], celloutsig_0_39z[3], celloutsig_0_39z[7:6], celloutsig_0_39z[1], celloutsig_0_39z[4] } = ~ { celloutsig_0_32z[2], celloutsig_0_30z, celloutsig_0_25z, celloutsig_0_17z, celloutsig_0_15z, celloutsig_0_9z, celloutsig_0_2z };
  assign { celloutsig_0_20z[8:7], celloutsig_0_20z[5], celloutsig_0_20z[6], celloutsig_0_20z[4], celloutsig_0_20z[13:9], celloutsig_0_20z[2], celloutsig_0_20z[23:16], celloutsig_0_20z[14], celloutsig_0_20z[1], celloutsig_0_20z[15] } = ~ { celloutsig_0_10z[5:4], celloutsig_0_10z[2], celloutsig_0_10z[3], celloutsig_0_10z[1], celloutsig_0_18z, celloutsig_0_16z, celloutsig_0_7z[7:0], celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_0z };
  assign { celloutsig_0_58z[7:6], celloutsig_0_58z[4], celloutsig_0_58z[5], celloutsig_0_58z[3], celloutsig_0_58z[12:8], celloutsig_0_58z[1], celloutsig_0_58z[17:15], celloutsig_0_58z[13], celloutsig_0_58z[14], celloutsig_0_58z[0] } = ~ { celloutsig_0_20z[8:7], celloutsig_0_20z[5], celloutsig_0_20z[6], celloutsig_0_20z[4], celloutsig_0_20z[13:9], celloutsig_0_20z[2], celloutsig_0_20z[18:16], celloutsig_0_20z[14], celloutsig_0_20z[15], celloutsig_0_19z };
  assign celloutsig_0_10z[0] = celloutsig_0_10z[2];
  assign { celloutsig_0_20z[3], celloutsig_0_20z[0] } = { celloutsig_0_20z[5], celloutsig_0_20z[2] };
  assign { celloutsig_0_31z[25:16], celloutsig_0_31z[11] } = celloutsig_0_31z[43:33];
  assign celloutsig_0_36z[0] = celloutsig_0_36z[2];
  assign { celloutsig_0_39z[2], celloutsig_0_39z[0] } = { celloutsig_0_39z[4], celloutsig_0_39z[7] };
  assign celloutsig_0_58z[2] = celloutsig_0_58z[4];
  assign { out_data[128], out_data[96], out_data[36:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_91z, celloutsig_0_92z };
endmodule
