/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire [2:0] _02_;
  wire [14:0] _03_;
  wire [4:0] _04_;
  wire [11:0] _05_;
  wire [16:0] _06_;
  wire [2:0] celloutsig_0_10z;
  wire [21:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [9:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [7:0] celloutsig_0_19z;
  wire [16:0] celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire [6:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [8:0] celloutsig_0_24z;
  wire [9:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [12:0] celloutsig_0_27z;
  wire [12:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire [5:0] celloutsig_0_35z;
  wire [6:0] celloutsig_0_36z;
  wire celloutsig_0_38z;
  wire celloutsig_0_40z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_45z;
  wire celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire [2:0] celloutsig_0_49z;
  wire [3:0] celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_52z;
  wire [14:0] celloutsig_0_53z;
  wire [16:0] celloutsig_0_56z;
  wire celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire celloutsig_0_61z;
  wire celloutsig_0_64z;
  wire celloutsig_0_67z;
  wire [9:0] celloutsig_0_6z;
  wire celloutsig_0_73z;
  wire celloutsig_0_7z;
  wire celloutsig_0_82z;
  wire celloutsig_0_8z;
  wire [10:0] celloutsig_0_93z;
  wire [14:0] celloutsig_0_94z;
  wire [9:0] celloutsig_0_95z;
  wire [5:0] celloutsig_1_0z;
  wire celloutsig_1_12z;
  wire [4:0] celloutsig_1_13z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [5:0] celloutsig_1_1z;
  wire [4:0] celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [30:0] celloutsig_1_6z;
  wire [17:0] celloutsig_1_7z;
  wire [10:0] celloutsig_1_8z;
  wire [9:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_34z = celloutsig_0_27z[8] | celloutsig_0_5z;
  assign celloutsig_0_38z = celloutsig_0_13z | celloutsig_0_11z[3];
  assign celloutsig_0_15z = celloutsig_0_1z[15] | celloutsig_0_1z[2];
  assign celloutsig_0_40z = celloutsig_0_2z | celloutsig_0_4z[0];
  assign celloutsig_0_17z = celloutsig_0_2z | celloutsig_0_12z;
  assign celloutsig_0_43z = celloutsig_0_23z | in_data[25];
  assign celloutsig_0_44z = celloutsig_0_1z[16] | celloutsig_0_40z;
  assign celloutsig_0_45z = celloutsig_0_26z | celloutsig_0_40z;
  assign celloutsig_0_46z = celloutsig_0_35z[2] | celloutsig_0_45z;
  assign celloutsig_0_48z = celloutsig_0_30z | celloutsig_0_17z;
  assign celloutsig_0_50z = celloutsig_0_11z[3] | celloutsig_0_29z[9];
  assign celloutsig_0_51z = celloutsig_0_19z[7] | celloutsig_0_12z;
  assign celloutsig_0_52z = celloutsig_0_18z | celloutsig_0_51z;
  assign celloutsig_0_5z = celloutsig_0_2z | celloutsig_0_15z;
  assign celloutsig_0_58z = celloutsig_0_40z | celloutsig_0_48z;
  assign celloutsig_0_61z = celloutsig_0_29z[11] | celloutsig_0_46z;
  assign celloutsig_0_64z = celloutsig_0_34z | celloutsig_0_58z;
  assign celloutsig_0_67z = celloutsig_0_40z | celloutsig_0_27z[6];
  assign celloutsig_0_73z = _00_ | celloutsig_0_7z;
  assign celloutsig_0_7z = in_data[61] | celloutsig_0_15z;
  assign celloutsig_0_82z = celloutsig_0_56z[9] | celloutsig_0_40z;
  assign celloutsig_0_8z = _01_ | celloutsig_0_6z[9];
  assign celloutsig_1_5z = celloutsig_1_0z[5] | celloutsig_1_1z[1];
  assign celloutsig_1_12z = celloutsig_1_2z[2] | celloutsig_1_3z[2];
  assign celloutsig_1_18z = celloutsig_1_13z[4] | celloutsig_1_9z[8];
  assign celloutsig_1_19z = celloutsig_1_8z[6] | celloutsig_1_2z[0];
  assign celloutsig_0_12z = _00_ | celloutsig_0_2z;
  assign celloutsig_0_13z = celloutsig_0_10z[1] | celloutsig_0_4z[0];
  assign celloutsig_0_18z = in_data[39] | celloutsig_0_12z;
  assign celloutsig_0_16z = celloutsig_0_8z | celloutsig_0_15z;
  assign celloutsig_0_21z = celloutsig_0_14z[1] | celloutsig_0_1z[12];
  assign celloutsig_0_23z = celloutsig_0_16z | celloutsig_0_4z[1];
  assign celloutsig_0_26z = celloutsig_0_19z[1] | celloutsig_0_10z[0];
  assign celloutsig_0_2z = in_data[90] | celloutsig_0_1z[14];
  assign celloutsig_0_30z = celloutsig_0_21z | celloutsig_0_15z;
  assign celloutsig_0_31z = in_data[64] | celloutsig_0_15z;
  assign celloutsig_0_32z = celloutsig_0_11z[13] | celloutsig_0_6z[8];
  assign celloutsig_0_35z = { celloutsig_0_6z[5:1], celloutsig_0_18z } + { celloutsig_0_25z[7:3], celloutsig_0_18z };
  assign celloutsig_0_36z = { celloutsig_0_27z[6:2], celloutsig_0_2z, celloutsig_0_26z } + celloutsig_0_27z[12:6];
  assign celloutsig_0_4z = { celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z } + { in_data[47], celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_2z };
  assign celloutsig_0_49z = celloutsig_0_22z[4:2] + { celloutsig_0_19z[3:2], celloutsig_0_13z };
  assign celloutsig_0_53z = { celloutsig_0_36z, celloutsig_0_19z } + { celloutsig_0_29z[10:4], celloutsig_0_19z };
  assign celloutsig_0_56z = { celloutsig_0_29z[10:3], celloutsig_0_24z } + { celloutsig_0_24z[6:3], celloutsig_0_30z, celloutsig_0_23z, celloutsig_0_2z, celloutsig_0_44z, celloutsig_0_43z, celloutsig_0_46z, celloutsig_0_38z, celloutsig_0_49z, celloutsig_0_12z, celloutsig_0_31z, celloutsig_0_18z };
  assign celloutsig_0_6z = { celloutsig_0_1z[16:9], celloutsig_0_15z, celloutsig_0_2z } + celloutsig_0_1z[10:1];
  assign celloutsig_0_93z = { celloutsig_0_27z[6:0], celloutsig_0_67z, celloutsig_0_82z, celloutsig_0_32z, celloutsig_0_16z } + { celloutsig_0_25z, celloutsig_0_52z };
  assign celloutsig_0_94z = { celloutsig_0_25z[8:4], celloutsig_0_48z, celloutsig_0_50z, celloutsig_0_61z, _03_[6:0] } + { celloutsig_0_53z[14:7], celloutsig_0_15z, celloutsig_0_16z, celloutsig_0_64z, celloutsig_0_17z, celloutsig_0_17z, celloutsig_0_61z, celloutsig_0_73z };
  assign celloutsig_0_95z = celloutsig_0_93z[10:1] + { celloutsig_0_56z[14:6], celloutsig_0_30z };
  assign celloutsig_1_0z = in_data[153:148] + in_data[156:151];
  assign celloutsig_1_1z = in_data[110:105] + celloutsig_1_0z;
  assign celloutsig_1_2z = celloutsig_1_0z[5:1] + celloutsig_1_0z[4:0];
  assign celloutsig_1_3z = celloutsig_1_0z[2:0] + celloutsig_1_0z[5:3];
  assign celloutsig_1_4z = celloutsig_1_1z[2:0] + celloutsig_1_3z;
  assign celloutsig_1_6z = { in_data[136:118], celloutsig_1_1z, celloutsig_1_0z } + { in_data[121:103], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z };
  assign celloutsig_1_7z = { celloutsig_1_6z[17:9], celloutsig_1_0z, celloutsig_1_3z } + { celloutsig_1_6z[14:2], celloutsig_1_2z };
  assign celloutsig_1_8z = { celloutsig_1_2z, celloutsig_1_0z } + { celloutsig_1_1z[5:1], celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_1_9z = celloutsig_1_7z[13:4] + { celloutsig_1_6z[20:15], celloutsig_1_5z, celloutsig_1_4z };
  assign celloutsig_0_10z = { celloutsig_0_1z[2], celloutsig_0_8z, celloutsig_0_2z } + celloutsig_0_4z[3:1];
  assign celloutsig_1_13z = celloutsig_1_0z[4:0] + { _04_[4:1], celloutsig_1_12z };
  assign celloutsig_0_11z = { celloutsig_0_4z[3:2], celloutsig_0_7z, celloutsig_0_15z, celloutsig_0_1z, celloutsig_0_5z } + { celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_0_14z = { celloutsig_0_1z[10:2], celloutsig_0_7z } + { celloutsig_0_1z[3:2], celloutsig_0_13z, celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_12z };
  assign celloutsig_0_1z = { in_data[87:75], _00_, _02_[1], _01_, _06_[0] } + in_data[62:46];
  assign celloutsig_0_19z = { celloutsig_0_6z[7:1], celloutsig_0_13z } + celloutsig_0_6z[8:1];
  assign celloutsig_0_22z = { celloutsig_0_10z, celloutsig_0_5z, celloutsig_0_16z, celloutsig_0_17z, celloutsig_0_12z } + celloutsig_0_14z[6:0];
  assign celloutsig_0_24z = { celloutsig_0_19z, celloutsig_0_15z } + in_data[29:21];
  assign celloutsig_0_25z = { celloutsig_0_6z[4:2], celloutsig_0_15z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_12z } + { celloutsig_0_24z[8:1], celloutsig_0_15z, celloutsig_0_18z };
  assign celloutsig_0_27z = celloutsig_0_1z[13:1] + { celloutsig_0_14z[9:1], _00_, _02_[1], _01_, _06_[0] };
  assign celloutsig_0_29z = { celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_21z, celloutsig_0_6z } + { celloutsig_0_22z[3:2], celloutsig_0_17z, celloutsig_0_6z };
  reg [3:0] _74_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[96])
    if (!clkin_data[96]) _74_ <= 4'h0;
    else _74_ <= in_data[31:28];
  assign { _00_, _02_[1], _01_, _06_[0] } = _74_;
  reg [6:0] _75_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _75_ <= 7'h00;
    else _75_ <= { celloutsig_0_4z[2:1], celloutsig_0_4z, celloutsig_0_17z };
  assign _03_[6:0] = _75_;
  reg [10:0] _76_;
  always_ff @(posedge clkin_data[32], negedge clkin_data[128])
    if (!clkin_data[128]) _76_ <= 11'h000;
    else _76_ <= { celloutsig_1_8z[10:3], celloutsig_1_4z };
  assign { _05_[11:8], _04_[4:1], _05_[3:1] } = _76_;
  assign { _02_[2], _02_[0] } = { _00_, _01_ };
  assign _03_[14:7] = { celloutsig_0_25z[8:4], celloutsig_0_48z, celloutsig_0_50z, celloutsig_0_61z };
  assign _04_[0] = celloutsig_1_12z;
  assign { _05_[7:4], _05_[0] } = { _04_[4:1], celloutsig_1_12z };
  assign _06_[16:1] = { in_data[87:75], _00_, _02_[1], _01_ };
  assign { out_data[128], out_data[96], out_data[46:32], out_data[9:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_94z, celloutsig_0_95z };
endmodule
