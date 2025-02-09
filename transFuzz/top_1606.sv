/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [3:0] _01_;
  wire [4:0] _02_;
  wire [8:0] _03_;
  wire [9:0] _04_;
  wire [7:0] _05_;
  wire [9:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [9:0] celloutsig_0_11z;
  wire [38:0] celloutsig_0_12z;
  wire [11:0] celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire [6:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_21z;
  wire [16:0] celloutsig_0_22z;
  wire [8:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [2:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire [18:0] celloutsig_0_3z;
  wire [27:0] celloutsig_0_40z;
  wire [3:0] celloutsig_0_44z;
  wire celloutsig_0_46z;
  wire celloutsig_0_48z;
  wire [12:0] celloutsig_0_4z;
  wire [5:0] celloutsig_0_51z;
  wire [10:0] celloutsig_0_58z;
  wire celloutsig_0_5z;
  wire [4:0] celloutsig_0_69z;
  wire [21:0] celloutsig_0_6z;
  wire celloutsig_0_70z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_92z;
  wire celloutsig_0_93z;
  wire celloutsig_0_9z;
  wire [4:0] celloutsig_1_0z;
  wire [2:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [12:0] celloutsig_1_13z;
  wire [4:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [13:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire [22:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_7z = celloutsig_0_5z ? celloutsig_0_0z[0] : celloutsig_0_3z[14];
  assign celloutsig_0_9z = celloutsig_0_2z ? celloutsig_0_4z[6] : in_data[69];
  assign celloutsig_1_11z = celloutsig_1_0z[4] ? in_data[114] : celloutsig_1_7z[4];
  assign celloutsig_0_18z = celloutsig_0_14z ? celloutsig_0_2z : celloutsig_0_7z;
  assign celloutsig_0_35z = ~(celloutsig_0_22z[0] | _00_);
  assign celloutsig_0_25z = ~(celloutsig_0_6z[5] | celloutsig_0_6z[14]);
  assign celloutsig_0_30z = ~(celloutsig_0_25z | celloutsig_0_16z);
  assign celloutsig_0_46z = ~celloutsig_0_27z;
  assign celloutsig_1_2z = ~in_data[180];
  assign celloutsig_0_10z = ~celloutsig_0_0z[9];
  assign celloutsig_0_48z = celloutsig_0_10z | celloutsig_0_5z;
  assign celloutsig_0_92z = celloutsig_0_30z | celloutsig_0_70z;
  assign celloutsig_0_44z = { _01_[3:2], celloutsig_0_7z, celloutsig_0_27z } + celloutsig_0_3z[18:15];
  assign celloutsig_1_17z = _02_ + { celloutsig_1_1z[5:2], celloutsig_1_2z };
  reg [9:0] _20_;
  always_ff @(negedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _20_ <= 10'h000;
    else _20_ <= { celloutsig_0_4z[11:5], celloutsig_0_32z, celloutsig_0_15z, celloutsig_0_34z };
  assign { _04_[9:4], _01_[3:2], _04_[1:0] } = _20_;
  reg [7:0] _21_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _21_ <= 8'h00;
    else _21_ <= { celloutsig_1_7z[12:6], celloutsig_1_9z };
  assign { _05_[7], _02_, _05_[1:0] } = _21_;
  reg [8:0] _22_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _22_ <= 9'h000;
    else _22_ <= celloutsig_0_23z;
  assign { _00_, _03_[7:0] } = _22_;
  assign celloutsig_0_51z = celloutsig_0_40z[16:11] & { celloutsig_0_44z[2:1], celloutsig_0_15z, celloutsig_0_15z, celloutsig_0_16z, celloutsig_0_48z };
  assign celloutsig_0_58z = { _03_[1:0], celloutsig_0_46z, celloutsig_0_32z, celloutsig_0_51z, celloutsig_0_10z } & in_data[87:77];
  assign celloutsig_0_69z = { celloutsig_0_4z[6:3], celloutsig_0_19z } & { _03_[4:2], celloutsig_0_10z, celloutsig_0_14z };
  assign celloutsig_0_23z = { celloutsig_0_22z[11:10], celloutsig_0_17z } & { celloutsig_0_17z, celloutsig_0_21z, celloutsig_0_9z };
  assign celloutsig_0_22z = { in_data[12:5], celloutsig_0_17z, celloutsig_0_15z, celloutsig_0_18z } / { 1'h1, celloutsig_0_3z[16:1] };
  assign celloutsig_0_8z = celloutsig_0_6z[16:4] == celloutsig_0_3z[17:5];
  assign celloutsig_1_3z = { celloutsig_1_1z[11:7], celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_0z } == { celloutsig_1_1z[5:0], celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_0_14z = { celloutsig_0_13z[11:6], celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_8z } == in_data[11:2];
  assign celloutsig_0_16z = in_data[14:11] == { celloutsig_0_11z[7:5], celloutsig_0_14z };
  assign celloutsig_0_34z = celloutsig_0_13z[11:2] >= celloutsig_0_0z;
  assign celloutsig_0_5z = celloutsig_0_4z[11:4] >= celloutsig_0_4z[11:4];
  assign celloutsig_0_70z = celloutsig_0_22z[14:5] >= { celloutsig_0_58z[10:2], celloutsig_0_26z };
  assign celloutsig_1_4z = { celloutsig_1_0z[4:1], celloutsig_1_0z, celloutsig_1_3z } >= { in_data[154:146], celloutsig_1_3z };
  assign celloutsig_0_1z = celloutsig_0_0z[9:4] >= in_data[25:20];
  assign celloutsig_1_9z = in_data[174:170] >= celloutsig_1_1z[12:8];
  assign celloutsig_1_12z = { celloutsig_1_3z, celloutsig_1_6z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_10z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_5z } >= { celloutsig_1_1z[12:6], celloutsig_1_9z, celloutsig_1_4z, celloutsig_1_11z, celloutsig_1_5z };
  assign celloutsig_1_19z = { celloutsig_1_13z[8:5], celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_8z, celloutsig_1_12z } != { celloutsig_1_1z[12:6], celloutsig_1_17z, celloutsig_1_11z };
  assign celloutsig_0_24z = { celloutsig_0_3z[10:5], celloutsig_0_14z, celloutsig_0_10z } != celloutsig_0_4z[9:2];
  assign celloutsig_0_0z = ~ in_data[65:56];
  assign celloutsig_0_6z = ~ in_data[63:42];
  assign celloutsig_1_10z = ~ celloutsig_1_7z[6:4];
  assign celloutsig_0_31z = ~ celloutsig_0_12z[14:12];
  assign celloutsig_0_19z = & { celloutsig_0_18z, celloutsig_0_10z, celloutsig_0_9z, in_data[37:31] };
  assign celloutsig_0_27z = & { celloutsig_0_24z, celloutsig_0_6z[13:11] };
  assign celloutsig_0_32z = & { celloutsig_0_17z, celloutsig_0_12z[38:26], celloutsig_0_8z, celloutsig_0_2z };
  assign celloutsig_1_8z = celloutsig_1_1z[5] & celloutsig_1_0z[4];
  assign celloutsig_0_15z = celloutsig_0_14z & celloutsig_0_5z;
  assign celloutsig_0_21z = celloutsig_0_6z[5] & celloutsig_0_14z;
  assign celloutsig_0_93z = ^ celloutsig_0_69z;
  assign celloutsig_1_5z = ^ { celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_1_6z = ^ { celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_1_18z = ^ { celloutsig_1_17z[3], celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_3z = { celloutsig_0_0z[7:2], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_2z } <<< { in_data[24:10], celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_1_0z = in_data[160:156] <<< in_data[156:152];
  assign celloutsig_1_1z = { in_data[122:114], celloutsig_1_0z } <<< { celloutsig_1_0z[4:1], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_7z = { in_data[151:132], celloutsig_1_5z, celloutsig_1_5z, celloutsig_1_6z } <<< { in_data[116:101], celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_6z };
  assign celloutsig_1_13z = celloutsig_1_1z[13:1] <<< { in_data[176:168], celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_11z, celloutsig_1_6z };
  assign celloutsig_0_11z = { celloutsig_0_6z[13:6], celloutsig_0_9z, celloutsig_0_7z } <<< { celloutsig_0_4z[6:0], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_2z };
  assign celloutsig_0_40z = { celloutsig_0_4z[5:1], celloutsig_0_13z, celloutsig_0_15z, celloutsig_0_31z, celloutsig_0_16z, celloutsig_0_31z, celloutsig_0_8z, celloutsig_0_26z, celloutsig_0_34z } ~^ { celloutsig_0_0z, celloutsig_0_16z, celloutsig_0_18z, celloutsig_0_30z, celloutsig_0_13z, celloutsig_0_35z, celloutsig_0_35z, celloutsig_0_2z };
  assign celloutsig_0_17z = { celloutsig_0_4z[5:4], celloutsig_0_16z, celloutsig_0_7z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_14z } ~^ celloutsig_0_0z[9:3];
  assign celloutsig_0_4z = in_data[27:15] ^ { celloutsig_0_3z[14:4], celloutsig_0_2z, celloutsig_0_1z };
  assign celloutsig_0_12z = { celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_8z } ^ { in_data[48:44], celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_5z };
  assign celloutsig_0_13z = { celloutsig_0_0z[7], celloutsig_0_0z, celloutsig_0_2z } ^ celloutsig_0_4z[11:0];
  assign celloutsig_0_2z = ~((in_data[76] & celloutsig_0_1z) | in_data[44]);
  assign celloutsig_0_26z = ~((celloutsig_0_23z[0] & celloutsig_0_25z) | (celloutsig_0_12z[31] & celloutsig_0_18z));
  assign _01_[1:0] = { celloutsig_0_7z, celloutsig_0_27z };
  assign _03_[8] = _00_;
  assign _04_[3:2] = _01_[3:2];
  assign _05_[6:2] = _02_;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_92z, celloutsig_0_93z };
endmodule
