/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [3:0] celloutsig_0_0z;
  wire [3:0] celloutsig_0_10z;
  wire [7:0] celloutsig_0_11z;
  reg [2:0] celloutsig_0_12z;
  wire [4:0] celloutsig_0_13z;
  wire [2:0] celloutsig_0_14z;
  wire [11:0] celloutsig_0_15z;
  wire [3:0] celloutsig_0_16z;
  wire [2:0] celloutsig_0_17z;
  wire [16:0] celloutsig_0_18z;
  wire [2:0] celloutsig_0_19z;
  reg [16:0] celloutsig_0_1z;
  wire [6:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [30:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire [13:0] celloutsig_0_26z;
  wire [2:0] celloutsig_0_28z;
  wire [3:0] celloutsig_0_29z;
  wire [9:0] celloutsig_0_2z;
  wire [2:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [3:0] celloutsig_0_32z;
  wire [2:0] celloutsig_0_33z;
  wire celloutsig_0_34z;
  wire celloutsig_0_36z;
  wire [12:0] celloutsig_0_37z;
  wire [4:0] celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire [9:0] celloutsig_0_3z;
  wire [9:0] celloutsig_0_40z;
  wire [7:0] celloutsig_0_41z;
  wire [12:0] celloutsig_0_42z;
  wire [24:0] celloutsig_0_46z;
  wire [5:0] celloutsig_0_4z;
  wire [3:0] celloutsig_0_53z;
  wire [20:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [10:0] celloutsig_0_7z;
  wire celloutsig_0_89z;
  wire celloutsig_0_8z;
  reg [4:0] celloutsig_0_90z;
  wire celloutsig_0_91z;
  wire celloutsig_0_9z;
  wire [5:0] celloutsig_1_0z;
  wire [3:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [11:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  reg [7:0] celloutsig_1_15z;
  wire [5:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  reg [4:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  reg [8:0] celloutsig_1_3z;
  wire [2:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [33:0] celloutsig_1_6z;
  wire [23:0] celloutsig_1_7z;
  wire [2:0] celloutsig_1_9z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_31z = ! celloutsig_0_5z[19:8];
  assign celloutsig_0_34z = ! { celloutsig_0_11z[7:4], celloutsig_0_0z };
  assign celloutsig_0_89z = ! celloutsig_0_38z[2:0];
  assign celloutsig_1_2z = ! { in_data[109:102], celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z };
  assign celloutsig_1_5z = ! { celloutsig_1_3z[2:0], celloutsig_1_1z };
  assign celloutsig_0_9z = ! in_data[32:29];
  assign celloutsig_1_11z = ! { in_data[181:176], celloutsig_1_1z, celloutsig_1_4z };
  assign celloutsig_1_18z = ! celloutsig_1_13z[7:4];
  assign celloutsig_0_21z = ! { celloutsig_0_1z[5], celloutsig_0_14z };
  assign celloutsig_0_24z = ! celloutsig_0_5z[9:3];
  assign celloutsig_0_29z[0] = celloutsig_0_8z ? celloutsig_0_10z[0] : celloutsig_0_6z;
  assign celloutsig_0_33z = celloutsig_0_21z ? celloutsig_0_18z[12:10] : celloutsig_0_12z;
  assign celloutsig_0_41z = celloutsig_0_18z[13] ? { celloutsig_0_4z[3:1], celloutsig_0_12z, celloutsig_0_24z, celloutsig_0_31z } : { celloutsig_0_40z[5:2], celloutsig_0_0z };
  assign celloutsig_0_42z = celloutsig_0_16z[0] ? { celloutsig_0_37z[6:0], celloutsig_0_0z, celloutsig_0_24z, celloutsig_0_39z } : celloutsig_0_1z[16:4];
  assign celloutsig_0_5z = celloutsig_0_4z[5] ? { celloutsig_0_1z, celloutsig_0_0z } : in_data[58:38];
  assign celloutsig_1_7z = celloutsig_1_5z ? celloutsig_1_6z[24:1] : { in_data[179:160], 1'h0, celloutsig_1_4z };
  assign celloutsig_1_9z = celloutsig_1_7z[23] ? in_data[119:117] : celloutsig_1_6z[8:6];
  assign celloutsig_0_11z[7:4] = celloutsig_0_7z[5] ? celloutsig_0_5z[10:7] : celloutsig_0_2z[3:0];
  assign celloutsig_0_13z = in_data[50] ? { celloutsig_0_3z[8], celloutsig_0_0z } : celloutsig_0_5z[10:6];
  assign celloutsig_0_15z = celloutsig_0_10z[3] ? celloutsig_0_1z[15:4] : { celloutsig_0_13z[4:1], celloutsig_0_0z, 1'h0, celloutsig_0_10z[2:0] };
  assign celloutsig_0_22z = celloutsig_0_7z[6] ? { celloutsig_0_18z, celloutsig_0_2z, celloutsig_0_16z } : { celloutsig_0_20z[3:0], celloutsig_0_18z, celloutsig_0_3z };
  assign celloutsig_0_28z = celloutsig_0_1z[13] ? celloutsig_0_20z[2:0] : celloutsig_0_22z[15:13];
  assign celloutsig_0_32z = celloutsig_0_0z | { celloutsig_0_14z[1], celloutsig_0_19z };
  assign celloutsig_0_3z = { celloutsig_0_2z[8:3], celloutsig_0_0z } | { celloutsig_0_2z[8:7], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_4z = celloutsig_0_2z[6:1] | celloutsig_0_3z[6:1];
  assign celloutsig_0_53z = celloutsig_0_42z[3:0] | { celloutsig_0_17z[1], celloutsig_0_12z };
  assign celloutsig_0_7z = { in_data[32], celloutsig_0_2z } | { celloutsig_0_3z[1], celloutsig_0_2z };
  assign celloutsig_1_0z = in_data[160:155] | in_data[163:158];
  assign celloutsig_1_4z = celloutsig_1_3z[8:6] | { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_0_10z = celloutsig_0_5z[12:9] | celloutsig_0_2z[9:6];
  assign celloutsig_1_13z = { celloutsig_1_3z[6:3], celloutsig_1_1z, celloutsig_1_12z, celloutsig_1_10z, celloutsig_1_1z, celloutsig_1_2z } | { in_data[176:173], celloutsig_1_11z, celloutsig_1_9z, celloutsig_1_10z };
  assign celloutsig_0_14z = { celloutsig_0_10z[2:1], celloutsig_0_6z } | celloutsig_0_7z[5:3];
  assign celloutsig_0_16z = celloutsig_0_3z[5:2] | celloutsig_0_7z[8:5];
  assign celloutsig_0_18z = { celloutsig_0_12z[2:1], celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_9z } | { celloutsig_0_11z[6:4], celloutsig_0_0z[3:2], celloutsig_0_15z };
  assign celloutsig_0_19z = celloutsig_0_2z[7:5] | celloutsig_0_18z[6:4];
  assign celloutsig_0_20z = { celloutsig_0_5z[13:11], celloutsig_0_19z, celloutsig_0_9z } | { celloutsig_0_17z[1:0], celloutsig_0_13z };
  assign celloutsig_0_26z = { celloutsig_0_12z, celloutsig_0_7z } | { celloutsig_0_7z[10:4], celloutsig_0_20z };
  assign celloutsig_0_0z = in_data[73:70] >>> in_data[36:33];
  assign celloutsig_0_30z = celloutsig_0_26z[5:3] >>> celloutsig_0_15z[8:6];
  assign celloutsig_0_37z = { celloutsig_0_20z[6:2], celloutsig_0_10z[3:1], celloutsig_0_29z[0], celloutsig_0_0z } >>> { celloutsig_0_20z[5:1], celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_32z };
  assign celloutsig_0_38z = celloutsig_0_1z[12:8] >>> { in_data[67:64], celloutsig_0_23z };
  assign celloutsig_0_40z = { celloutsig_0_24z, celloutsig_0_6z, celloutsig_0_38z, celloutsig_0_28z } >>> { celloutsig_0_22z[20:15], celloutsig_0_34z, celloutsig_0_36z, celloutsig_0_34z, celloutsig_0_8z };
  assign celloutsig_0_46z = { celloutsig_0_42z[11:3], celloutsig_0_26z, celloutsig_0_25z, celloutsig_0_36z } >>> { celloutsig_0_37z[6], celloutsig_0_5z, celloutsig_0_17z };
  assign celloutsig_1_6z = { in_data[180:158], celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z } >>> { celloutsig_1_3z[6:4], celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_2z };
  assign celloutsig_1_10z = celloutsig_1_3z[7:4] >>> celloutsig_1_0z[3:0];
  assign celloutsig_1_16z = celloutsig_1_15z[5:0] >>> { celloutsig_1_7z[10:6], celloutsig_1_1z };
  assign celloutsig_0_17z = { celloutsig_0_3z[9:8], celloutsig_0_9z } >>> celloutsig_0_1z[7:5];
  assign celloutsig_0_2z = celloutsig_0_1z[9:0] >>> { in_data[77:76], celloutsig_0_0z, celloutsig_0_0z };
  always_latch
    if (clkin_data[64]) celloutsig_0_90z = 5'h00;
    else if (!celloutsig_1_18z) celloutsig_0_90z = { celloutsig_0_41z[3:0], celloutsig_0_89z };
  always_latch
    if (clkin_data[96]) celloutsig_1_3z = 9'h000;
    else if (clkin_data[32]) celloutsig_1_3z = { in_data[142:140], celloutsig_1_0z };
  always_latch
    if (!clkin_data[128]) celloutsig_1_15z = 8'h00;
    else if (clkin_data[32]) celloutsig_1_15z = { celloutsig_1_14z, celloutsig_1_14z, celloutsig_1_0z };
  always_latch
    if (!clkin_data[96]) celloutsig_1_19z = 5'h00;
    else if (!clkin_data[0]) celloutsig_1_19z = celloutsig_1_16z[4:0];
  always_latch
    if (clkin_data[64]) celloutsig_0_1z = 17'h00000;
    else if (celloutsig_1_18z) celloutsig_0_1z = in_data[18:2];
  always_latch
    if (!clkin_data[64]) celloutsig_0_12z = 3'h0;
    else if (celloutsig_1_18z) celloutsig_0_12z = celloutsig_0_10z[2:0];
  assign celloutsig_0_36z = ~((celloutsig_0_29z[0] & celloutsig_0_28z[2]) | (celloutsig_0_30z[1] & celloutsig_0_33z[2]));
  assign celloutsig_0_39z = ~((celloutsig_0_8z & celloutsig_0_25z) | (celloutsig_0_25z & celloutsig_0_15z[4]));
  assign celloutsig_0_6z = ~((celloutsig_0_5z[7] & in_data[91]) | (celloutsig_0_4z[4] & celloutsig_0_4z[0]));
  assign celloutsig_0_8z = ~((in_data[12] & in_data[54]) | (celloutsig_0_0z[0] & celloutsig_0_6z));
  assign celloutsig_0_91z = ~((celloutsig_0_53z[0] & celloutsig_0_46z[7]) | (celloutsig_0_4z[4] & celloutsig_0_13z[3]));
  assign celloutsig_1_1z = ~((in_data[146] & celloutsig_1_0z[2]) | (celloutsig_1_0z[2] & celloutsig_1_0z[2]));
  assign celloutsig_1_12z = ~((celloutsig_1_7z[22] & celloutsig_1_4z[0]) | (celloutsig_1_1z & in_data[146]));
  assign celloutsig_1_14z = ~((celloutsig_1_10z[3] & celloutsig_1_6z[17]) | (celloutsig_1_0z[5] & celloutsig_1_3z[8]));
  assign celloutsig_0_23z = ~((celloutsig_0_8z & celloutsig_0_9z) | (celloutsig_0_10z[0] & celloutsig_0_13z[4]));
  assign celloutsig_0_25z = ~((celloutsig_0_4z[4] & celloutsig_0_14z[1]) | (celloutsig_0_16z[2] & celloutsig_0_2z[9]));
  assign celloutsig_0_11z[3:0] = celloutsig_0_0z;
  assign celloutsig_0_29z[3:1] = celloutsig_0_10z[3:1];
  assign { out_data[128], out_data[100:96], out_data[36:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_90z, celloutsig_0_91z };
endmodule
