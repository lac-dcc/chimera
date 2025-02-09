/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [11:0] celloutsig_0_0z;
  wire [5:0] celloutsig_0_10z;
  wire [8:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire [23:0] celloutsig_0_13z;
  wire [20:0] celloutsig_0_14z;
  wire [4:0] celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire [17:0] celloutsig_0_18z;
  wire [10:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire [9:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire [4:0] celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [3:0] celloutsig_0_37z;
  wire [7:0] celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire celloutsig_0_45z;
  wire celloutsig_0_48z;
  wire [4:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire [9:0] celloutsig_0_6z;
  wire celloutsig_0_75z;
  wire [27:0] celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire [10:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [8:0] celloutsig_1_11z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [10:0] celloutsig_1_1z;
  wire [18:0] celloutsig_1_2z;
  wire celloutsig_1_5z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_45z = ~((celloutsig_0_4z[1] | celloutsig_0_0z[6]) & (celloutsig_0_37z[3] | celloutsig_0_8z));
  assign celloutsig_1_0z = ~((in_data[133] | in_data[124]) & (in_data[103] | in_data[153]));
  assign celloutsig_0_48z = celloutsig_0_18z[15] | ~(celloutsig_0_42z);
  assign celloutsig_0_17z = celloutsig_0_7z[1] | ~(celloutsig_0_13z[4]);
  assign celloutsig_0_23z = celloutsig_0_7z[7] | ~(celloutsig_0_11z[1]);
  assign celloutsig_0_1z = in_data[26] | in_data[55];
  assign celloutsig_0_21z = celloutsig_0_6z[0] | celloutsig_0_10z[1];
  assign celloutsig_0_26z = celloutsig_0_12z | in_data[80];
  assign celloutsig_1_10z = in_data[159] ^ celloutsig_1_1z[4];
  assign celloutsig_1_19z = celloutsig_1_5z ^ celloutsig_1_15z;
  assign celloutsig_0_24z = celloutsig_0_19z[2] ^ celloutsig_0_9z[8];
  assign celloutsig_0_32z = celloutsig_0_31z[0] ^ celloutsig_0_19z[9];
  assign celloutsig_0_75z = ~(celloutsig_0_9z[7] ^ out_data[32]);
  assign celloutsig_0_20z = ~(celloutsig_0_7z[22] ^ celloutsig_0_2z);
  assign celloutsig_0_7z = { celloutsig_0_3z[6:0], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_3z } + { in_data[88:74], celloutsig_0_0z, celloutsig_0_5z };
  assign celloutsig_0_9z = { celloutsig_0_0z[5:4], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_8z } + { celloutsig_0_4z[3], celloutsig_0_1z, celloutsig_0_5z, celloutsig_0_3z };
  assign celloutsig_0_13z = { celloutsig_0_7z[15:5], celloutsig_0_0z, celloutsig_0_12z } + { celloutsig_0_3z[7:3], celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_4z, celloutsig_0_12z };
  assign celloutsig_0_29z = celloutsig_0_13z[15:6] + celloutsig_0_19z[10:1];
  reg [4:0] _18_;
  always_ff @(posedge celloutsig_1_19z, negedge clkin_data[32])
    if (!clkin_data[32]) _18_ <= 5'h00;
    else _18_ <= { celloutsig_0_5z, celloutsig_0_45z, celloutsig_0_27z, celloutsig_0_5z, celloutsig_0_48z };
  assign out_data[36:32] = _18_;
  assign celloutsig_0_2z = in_data[69:45] > { in_data[40], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_27z = { celloutsig_0_7z[8:2], celloutsig_0_6z } > { celloutsig_0_14z[20:9], celloutsig_0_15z };
  assign celloutsig_1_5z = celloutsig_1_2z[10:3] || { celloutsig_1_1z[7:1], celloutsig_1_0z };
  assign celloutsig_0_8z = in_data[60:55] || celloutsig_0_3z[7:2];
  assign celloutsig_0_22z = { celloutsig_0_0z[8:5], celloutsig_0_20z } || celloutsig_0_19z[9:5];
  assign celloutsig_0_0z = in_data[18:7] * in_data[85:74];
  assign celloutsig_0_3z = in_data[27:20] * in_data[67:60];
  assign celloutsig_0_6z = { in_data[85:78], celloutsig_0_1z, celloutsig_0_1z } * { celloutsig_0_0z[2:1], celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_5z };
  assign celloutsig_1_1z = in_data[186:176] * in_data[120:110];
  assign celloutsig_1_2z = in_data[132:114] * { celloutsig_1_1z[9:3], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_0_11z = { celloutsig_0_6z[9:2], celloutsig_0_5z } * { celloutsig_0_9z[7:1], celloutsig_0_1z, celloutsig_0_5z };
  assign celloutsig_0_18z = { celloutsig_0_13z[14:3], celloutsig_0_4z, celloutsig_0_2z } * { celloutsig_0_7z[26:15], celloutsig_0_15z, celloutsig_0_1z };
  assign celloutsig_1_11z = - { celloutsig_1_1z[7:1], celloutsig_1_0z, celloutsig_1_10z };
  assign celloutsig_0_19z = - { celloutsig_0_14z[19:17], celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_17z };
  assign celloutsig_0_31z = - { celloutsig_0_10z[3], celloutsig_0_23z, celloutsig_0_26z, celloutsig_0_22z, celloutsig_0_24z };
  assign celloutsig_0_42z = celloutsig_0_29z[6:4] !== celloutsig_0_19z[5:3];
  assign celloutsig_1_15z = & celloutsig_1_11z[5:2];
  assign celloutsig_1_18z = & { celloutsig_1_11z[5:2], in_data[167:160] };
  assign celloutsig_0_12z = & in_data[74:64];
  assign celloutsig_0_5z = celloutsig_0_2z & celloutsig_0_3z[7];
  assign celloutsig_0_10z = { in_data[10:6], celloutsig_0_2z } >> { celloutsig_0_7z[10:6], celloutsig_0_5z };
  assign celloutsig_0_4z = { celloutsig_0_0z[2:0], celloutsig_0_2z, celloutsig_0_1z } >> celloutsig_0_3z[4:0];
  assign celloutsig_0_14z = { celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_9z } >>> { celloutsig_0_9z[10:1], celloutsig_0_9z };
  assign celloutsig_0_15z = { celloutsig_0_0z[7:4], celloutsig_0_8z } >>> in_data[13:9];
  assign celloutsig_0_37z = celloutsig_0_10z[5:2] - { celloutsig_0_13z[11:10], celloutsig_0_32z, celloutsig_0_21z };
  assign { out_data[128], out_data[96], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_75z };
endmodule
