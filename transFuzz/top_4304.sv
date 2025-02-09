/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [16:0] _01_;
  reg [3:0] _02_;
  wire [5:0] celloutsig_0_0z;
  wire [28:0] celloutsig_0_10z;
  wire [4:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire [10:0] celloutsig_0_16z;
  wire [3:0] celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire [6:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [7:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [5:0] celloutsig_0_23z;
  wire [10:0] celloutsig_0_24z;
  wire [16:0] celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [2:0] celloutsig_0_27z;
  wire [4:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [7:0] celloutsig_0_30z;
  wire [11:0] celloutsig_0_31z;
  wire [2:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [6:0] celloutsig_0_35z;
  wire [12:0] celloutsig_0_39z;
  wire [12:0] celloutsig_0_3z;
  wire celloutsig_0_46z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire [11:0] celloutsig_0_52z;
  wire [10:0] celloutsig_0_58z;
  wire [5:0] celloutsig_0_5z;
  wire [2:0] celloutsig_0_63z;
  wire [8:0] celloutsig_0_64z;
  wire celloutsig_0_65z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [13:0] celloutsig_0_82z;
  wire celloutsig_0_83z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [3:0] celloutsig_1_11z;
  wire [8:0] celloutsig_1_12z;
  wire [15:0] celloutsig_1_13z;
  wire [5:0] celloutsig_1_14z;
  wire [2:0] celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [2:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [6:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_6z = ~(celloutsig_0_1z[4] & celloutsig_0_2z);
  assign celloutsig_0_7z = ~(celloutsig_0_0z[5] & celloutsig_0_2z);
  assign celloutsig_1_19z = ~(celloutsig_1_18z & celloutsig_1_13z[6]);
  assign celloutsig_0_8z = ~((celloutsig_0_0z[5] | celloutsig_0_1z[3]) & celloutsig_0_7z);
  assign celloutsig_0_33z = celloutsig_0_24z[1] | ~(celloutsig_0_16z[0]);
  assign celloutsig_0_46z = _00_ | ~(celloutsig_0_29z[3]);
  assign celloutsig_0_64z = { celloutsig_0_23z[3:1], celloutsig_0_0z } + { celloutsig_0_52z[8:1], celloutsig_0_7z };
  assign celloutsig_0_16z = celloutsig_0_10z[12:2] + { celloutsig_0_11z[3:0], celloutsig_0_11z, celloutsig_0_6z, celloutsig_0_13z };
  assign celloutsig_0_17z = { celloutsig_0_3z[7:6], celloutsig_0_14z, celloutsig_0_14z } + { celloutsig_0_0z[5:4], celloutsig_0_4z, celloutsig_0_8z };
  reg [16:0] _12_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[32])
    if (!clkin_data[32]) _12_ <= 17'h00000;
    else _12_ <= { celloutsig_0_35z[6:4], celloutsig_0_23z, celloutsig_0_1z, celloutsig_0_12z };
  assign { _01_[16], _00_, _01_[14:0] } = _12_;
  always_ff @(negedge celloutsig_1_19z, posedge clkin_data[32])
    if (clkin_data[32]) _02_ <= 4'h0;
    else _02_ <= celloutsig_0_16z[4:1];
  assign celloutsig_0_27z = { celloutsig_0_5z[3], celloutsig_0_20z, celloutsig_0_20z } & celloutsig_0_25z[3:1];
  assign celloutsig_1_3z = { in_data[151:146], celloutsig_1_2z, celloutsig_1_1z } >= { in_data[144:137], celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_9z = { in_data[142:136], celloutsig_1_0z } >= { celloutsig_1_4z, celloutsig_1_7z };
  assign celloutsig_0_14z = { celloutsig_0_0z[2], celloutsig_0_1z } >= { in_data[82:76], celloutsig_0_9z };
  assign celloutsig_0_50z = { celloutsig_0_39z[11:6], celloutsig_0_22z, celloutsig_0_33z } > { celloutsig_0_35z[5:2], celloutsig_0_17z };
  assign celloutsig_1_16z = { celloutsig_1_12z[7:3], celloutsig_1_12z[4], celloutsig_1_12z[1], celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_0z } > { celloutsig_1_13z[10:5], celloutsig_1_13z[5], celloutsig_1_12z[8:3], celloutsig_1_12z[4], celloutsig_1_12z[1:0] };
  assign celloutsig_0_12z = { celloutsig_0_1z[6:1], celloutsig_0_8z } > { celloutsig_0_10z[9], celloutsig_0_8z, celloutsig_0_11z };
  assign celloutsig_0_65z = { celloutsig_0_58z[7], celloutsig_0_63z, celloutsig_0_8z, celloutsig_0_3z } <= { celloutsig_0_3z[10:1], celloutsig_0_5z, celloutsig_0_26z, celloutsig_0_13z };
  assign celloutsig_1_6z = in_data[108:103] <= celloutsig_1_4z[5:0];
  assign celloutsig_1_18z = { celloutsig_1_16z, celloutsig_1_7z, celloutsig_1_4z } <= { celloutsig_1_14z, celloutsig_1_15z };
  assign celloutsig_0_22z = { celloutsig_0_2z, celloutsig_0_0z } <= { celloutsig_0_3z[5:4], _02_, celloutsig_0_20z };
  assign celloutsig_0_51z = ! { celloutsig_0_30z[7:5], celloutsig_0_27z };
  assign celloutsig_1_2z = ! { in_data[135:115], celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_26z = ! { celloutsig_0_5z[2:1], celloutsig_0_22z, celloutsig_0_14z, celloutsig_0_7z };
  assign celloutsig_0_83z = celloutsig_0_17z[2] & ~(celloutsig_0_33z);
  assign celloutsig_0_9z = celloutsig_0_8z & ~(celloutsig_0_7z);
  assign celloutsig_0_13z = celloutsig_0_6z & ~(celloutsig_0_8z);
  assign celloutsig_0_15z = celloutsig_0_3z[4] & ~(celloutsig_0_12z);
  assign celloutsig_0_19z = celloutsig_0_1z[1] & ~(celloutsig_0_0z[1]);
  assign celloutsig_0_20z = celloutsig_0_15z & ~(celloutsig_0_2z);
  assign celloutsig_0_52z = { celloutsig_0_51z, celloutsig_0_27z, celloutsig_0_21z } % { 1'h1, celloutsig_0_10z[12:3], celloutsig_0_33z };
  assign celloutsig_1_14z = { celloutsig_1_13z[8:5], celloutsig_1_13z[5], celloutsig_1_13z[3] } * { celloutsig_1_8z, celloutsig_1_1z, celloutsig_1_7z, celloutsig_1_3z };
  assign celloutsig_1_15z = { celloutsig_1_11z[1:0], celloutsig_1_6z } * { in_data[132], celloutsig_1_8z, celloutsig_1_8z };
  assign celloutsig_0_11z = celloutsig_0_3z[11:7] * { celloutsig_0_5z[2:0], celloutsig_0_7z, celloutsig_0_9z };
  assign celloutsig_0_23z = in_data[19:14] * celloutsig_0_1z[5:0];
  assign celloutsig_0_29z = celloutsig_0_16z[8:4] * { celloutsig_0_21z[3:1], celloutsig_0_4z, celloutsig_0_19z };
  assign celloutsig_0_31z = { celloutsig_0_23z[4:1], celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_27z } * { celloutsig_0_17z[3:1], celloutsig_0_12z, celloutsig_0_30z };
  assign celloutsig_1_5z = | celloutsig_1_4z[2:0];
  assign celloutsig_0_2z = | { in_data[92:66], celloutsig_0_0z };
  assign celloutsig_0_0z = in_data[21:16] >> in_data[22:17];
  assign celloutsig_0_35z = { celloutsig_0_30z[5:0], celloutsig_0_9z } >> { celloutsig_0_33z, celloutsig_0_23z };
  assign celloutsig_0_5z = { celloutsig_0_0z[4:0], celloutsig_0_2z } >> in_data[22:17];
  assign celloutsig_0_58z = { celloutsig_0_39z[10:1], celloutsig_0_7z } >> celloutsig_0_16z;
  assign celloutsig_0_63z = { _02_[1:0], celloutsig_0_50z } >> celloutsig_0_3z[6:4];
  assign celloutsig_1_1z = in_data[158:156] >> { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_0_10z = in_data[29:1] >> { in_data[26:11], celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_2z };
  assign celloutsig_0_1z = in_data[14:8] >> in_data[66:60];
  assign celloutsig_0_24z = { celloutsig_0_3z[7:3], celloutsig_0_23z } >> { celloutsig_0_16z[10:1], celloutsig_0_22z };
  assign celloutsig_0_39z = { _01_[3], celloutsig_0_26z, celloutsig_0_21z, celloutsig_0_32z } <<< { _01_[16], _00_, _01_[14:4] };
  assign celloutsig_0_82z = { celloutsig_0_31z[10:8], celloutsig_0_64z, celloutsig_0_46z, celloutsig_0_8z } <<< { celloutsig_0_8z, celloutsig_0_31z, celloutsig_0_65z };
  assign celloutsig_1_4z = { in_data[173:169], celloutsig_1_3z, celloutsig_1_2z } <<< { in_data[149:145], celloutsig_1_2z, celloutsig_1_3z };
  assign celloutsig_0_25z = { celloutsig_0_11z[4:1], celloutsig_0_11z, celloutsig_0_21z } <<< { celloutsig_0_3z[9:2], celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_9z };
  assign celloutsig_0_30z = { in_data[37:32], celloutsig_0_6z, celloutsig_0_19z } <<< { celloutsig_0_29z[3:2], celloutsig_0_12z, celloutsig_0_12z, _02_ };
  assign celloutsig_0_32z = { celloutsig_0_29z[3], celloutsig_0_19z, celloutsig_0_19z } - celloutsig_0_31z[4:2];
  assign celloutsig_1_11z = { celloutsig_1_2z, celloutsig_1_9z, celloutsig_1_3z, celloutsig_1_2z } - { in_data[185:183], celloutsig_1_9z };
  assign celloutsig_0_21z = { _02_[3:1], celloutsig_0_11z } - { celloutsig_0_1z[6:2], celloutsig_0_14z, celloutsig_0_8z, celloutsig_0_6z };
  assign celloutsig_0_3z = { in_data[19:14], celloutsig_0_1z } - { celloutsig_0_1z[5], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_4z = ~((celloutsig_0_0z[2] & in_data[89]) | (in_data[49] & celloutsig_0_0z[5]));
  assign celloutsig_1_0z = ~((in_data[116] & in_data[135]) | (in_data[191] & in_data[177]));
  assign celloutsig_1_7z = ~((celloutsig_1_3z & celloutsig_1_4z[6]) | (celloutsig_1_1z[2] & celloutsig_1_0z));
  assign celloutsig_1_8z = ~((celloutsig_1_5z & celloutsig_1_2z) | (celloutsig_1_0z & celloutsig_1_7z));
  assign { celloutsig_1_12z[0], celloutsig_1_12z[1], celloutsig_1_12z[4:3], celloutsig_1_12z[8:5] } = ~ { celloutsig_1_8z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_3z, in_data[110:107] };
  assign { celloutsig_1_13z[3:0], celloutsig_1_13z[6], celloutsig_1_13z[8], celloutsig_1_13z[15:9], celloutsig_1_13z[7], celloutsig_1_13z[5] } = ~ { celloutsig_1_11z, celloutsig_1_8z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_0z };
  assign _01_[15] = _00_;
  assign celloutsig_1_12z[2] = celloutsig_1_12z[4];
  assign celloutsig_1_13z[4] = celloutsig_1_13z[5];
  assign { out_data[128], out_data[96], out_data[45:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_82z, celloutsig_0_83z };
endmodule
