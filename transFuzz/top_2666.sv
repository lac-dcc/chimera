/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [2:0] _01_;
  reg [7:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [2:0] celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  reg [5:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [7:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire [4:0] celloutsig_0_24z;
  wire [3:0] celloutsig_0_25z;
  wire [22:0] celloutsig_0_26z;
  wire [8:0] celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [9:0] celloutsig_0_2z;
  wire [5:0] celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire [28:0] celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [2:0] celloutsig_0_35z;
  wire [27:0] celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire [3:0] celloutsig_0_42z;
  wire celloutsig_0_45z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_51z;
  wire celloutsig_0_5z;
  wire [2:0] celloutsig_0_6z;
  wire [2:0] celloutsig_0_70z;
  wire [7:0] celloutsig_0_71z;
  wire [2:0] celloutsig_0_7z;
  wire [9:0] celloutsig_0_8z;
  wire [7:0] celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [2:0] celloutsig_1_11z;
  wire [7:0] celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [6:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  reg [7:0] celloutsig_1_16z;
  wire [4:0] celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire [3:0] celloutsig_1_4z;
  wire [7:0] celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire [6:0] celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_18z = ~(celloutsig_0_11z[2] & celloutsig_0_6z[1]);
  assign celloutsig_0_31z = ~celloutsig_0_6z[0];
  assign celloutsig_1_13z = ~celloutsig_1_14z[5];
  assign celloutsig_0_40z = ~((celloutsig_0_11z[2] | celloutsig_0_5z) & celloutsig_0_33z);
  assign celloutsig_0_16z = ~((celloutsig_0_14z[1] | celloutsig_0_1z[6]) & in_data[30]);
  assign celloutsig_0_17z = ~((celloutsig_0_0z | celloutsig_0_4z) & celloutsig_0_3z[9]);
  assign celloutsig_0_19z = ~((celloutsig_0_15z | celloutsig_0_16z) & celloutsig_0_1z[0]);
  reg [2:0] _10_;
  always_ff @(negedge celloutsig_1_18z, posedge clkin_data[64])
    if (clkin_data[64]) _10_ <= 3'h0;
    else _10_ <= { celloutsig_0_5z, celloutsig_0_13z, celloutsig_0_13z };
  assign { _01_[2], _00_, _01_[0] } = _10_;
  always_ff @(negedge celloutsig_1_18z, negedge clkin_data[64])
    if (!clkin_data[64]) _02_ <= 8'h00;
    else _02_ <= { celloutsig_0_25z, celloutsig_0_20z, celloutsig_0_6z };
  assign celloutsig_0_4z = in_data[53:29] == celloutsig_0_3z[25:1];
  assign celloutsig_1_1z = { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } == in_data[100:97];
  assign celloutsig_1_8z = celloutsig_1_4z == { celloutsig_1_1z, celloutsig_1_3z };
  assign celloutsig_1_10z = { in_data[116:112], celloutsig_1_8z } == { in_data[108:107], celloutsig_1_8z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_18z = in_data[108:106] == celloutsig_1_4z[2:0];
  assign celloutsig_0_15z = { celloutsig_0_4z, celloutsig_0_2z } == { celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_13z };
  assign celloutsig_0_20z = { celloutsig_0_2z[5:4], celloutsig_0_19z, celloutsig_0_16z, celloutsig_0_11z, celloutsig_0_19z } == { celloutsig_0_3z[23:18], celloutsig_0_19z, celloutsig_0_5z };
  assign celloutsig_0_51z = celloutsig_0_32z[24:15] <= { celloutsig_0_24z[2:0], celloutsig_0_21z, celloutsig_0_45z, celloutsig_0_49z, celloutsig_0_17z, celloutsig_0_21z, celloutsig_0_40z, celloutsig_0_10z };
  assign celloutsig_1_0z = in_data[190:180] <= in_data[187:177];
  assign celloutsig_1_2z = { in_data[175:167], celloutsig_1_0z, celloutsig_1_0z } <= { in_data[133:124], celloutsig_1_0z };
  assign celloutsig_0_21z = { celloutsig_0_8z[7:4], celloutsig_0_6z, celloutsig_0_7z } <= { in_data[9:6], celloutsig_0_10z, celloutsig_0_20z, celloutsig_0_17z, celloutsig_0_11z };
  assign celloutsig_1_15z = 1'h1 && in_data[114:111];
  assign celloutsig_0_13z = { celloutsig_0_2z, celloutsig_0_4z } && { celloutsig_0_8z[4:1], celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_6z };
  assign celloutsig_0_9z = { celloutsig_0_2z[4:3], celloutsig_0_7z, celloutsig_0_7z } % { 1'h1, in_data[43:37] };
  assign celloutsig_1_11z = { celloutsig_1_10z, celloutsig_1_1z, celloutsig_1_2z } % { 1'h1, celloutsig_1_10z, celloutsig_1_8z };
  assign celloutsig_0_12z = celloutsig_0_8z[8:3] % { 1'h1, celloutsig_0_1z[5:2], celloutsig_0_5z };
  assign celloutsig_0_1z = in_data[30:23] % { 1'h1, in_data[24:21], celloutsig_0_0z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_28z = { celloutsig_0_1z[4:2], celloutsig_0_13z, celloutsig_0_24z[4], celloutsig_0_24z[4], celloutsig_0_24z[2:0] } % { 1'h1, celloutsig_0_24z[2:0], celloutsig_0_24z[4], celloutsig_0_24z[4], celloutsig_0_24z[2:1], in_data[0] };
  assign celloutsig_0_3z = ~ { in_data[76:50], celloutsig_0_0z };
  assign celloutsig_0_6z = ~ celloutsig_0_2z[7:5];
  assign celloutsig_1_3z = ~ { in_data[166], celloutsig_1_2z, celloutsig_1_1z };
  assign celloutsig_0_8z = ~ { in_data[11:8], celloutsig_0_7z, celloutsig_0_6z };
  assign celloutsig_1_12z = ~ celloutsig_1_7z;
  assign celloutsig_0_11z = ~ celloutsig_0_7z;
  assign celloutsig_1_7z = { in_data[113:112], celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_2z } | in_data[139:132];
  assign celloutsig_0_25z = celloutsig_0_9z[4:1] | celloutsig_0_9z[7:4];
  assign celloutsig_0_26z = { celloutsig_0_2z[7:1], celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_17z, celloutsig_0_4z, celloutsig_0_17z, celloutsig_0_8z, celloutsig_0_22z } | { in_data[75:54], celloutsig_0_15z };
  assign celloutsig_0_5z = celloutsig_0_4z & celloutsig_0_3z[12];
  assign celloutsig_0_22z = celloutsig_0_13z & celloutsig_0_11z[2];
  assign celloutsig_0_32z = { celloutsig_0_30z[5:3], celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_20z, celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_12z, celloutsig_0_18z } <<< { _02_[6:0], celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_17z };
  assign celloutsig_0_35z = celloutsig_0_2z[3:1] <<< celloutsig_0_3z[24:22];
  assign celloutsig_0_71z = { celloutsig_0_2z[5:0], celloutsig_0_5z, celloutsig_0_29z } <<< celloutsig_0_1z;
  assign celloutsig_1_17z = celloutsig_1_12z[7:3] <<< celloutsig_1_16z[7:3];
  assign celloutsig_0_2z = in_data[71:62] <<< { in_data[70:69], celloutsig_0_1z };
  assign celloutsig_0_42z = { celloutsig_0_12z[1:0], celloutsig_0_13z, celloutsig_0_19z } ~^ { celloutsig_0_25z[3], celloutsig_0_20z, celloutsig_0_20z, celloutsig_0_0z };
  assign celloutsig_0_7z = in_data[20:18] ~^ celloutsig_0_3z[20:18];
  assign celloutsig_0_70z = { celloutsig_0_12z[3:2], celloutsig_0_51z } ~^ celloutsig_0_26z[9:7];
  assign celloutsig_1_4z = in_data[153:150] ~^ { in_data[132:130], celloutsig_1_2z };
  assign celloutsig_0_30z = { in_data[6:2], celloutsig_0_13z } ~^ { celloutsig_0_28z[1], celloutsig_0_6z, celloutsig_0_19z, celloutsig_0_21z };
  assign celloutsig_0_0z = ~((in_data[84] & in_data[27]) | in_data[5]);
  assign celloutsig_0_49z = ~((celloutsig_0_10z & celloutsig_0_35z[0]) | celloutsig_0_26z[5]);
  always_latch
    if (clkin_data[96]) celloutsig_1_16z = 8'h00;
    else if (!clkin_data[32]) celloutsig_1_16z = { celloutsig_1_7z[5:0], celloutsig_1_1z, celloutsig_1_15z };
  always_latch
    if (clkin_data[64]) celloutsig_0_14z = 6'h00;
    else if (clkin_data[0]) celloutsig_0_14z = celloutsig_0_9z[7:2];
  assign celloutsig_0_33z = ~((celloutsig_0_20z & _02_[3]) | (celloutsig_0_19z & celloutsig_0_1z[5]));
  assign celloutsig_0_45z = ~((celloutsig_0_33z & celloutsig_0_31z) | (celloutsig_0_18z & celloutsig_0_42z[2]));
  assign celloutsig_0_10z = ~((in_data[93] & celloutsig_0_3z[11]) | (celloutsig_0_4z & celloutsig_0_6z[0]));
  assign celloutsig_0_29z = ~((_01_[2] & celloutsig_0_18z) | (celloutsig_0_21z & celloutsig_0_4z));
  assign { celloutsig_0_24z[4], celloutsig_0_24z[2:0] } = ~ { celloutsig_0_17z, celloutsig_0_7z };
  assign { celloutsig_1_14z[2], celloutsig_1_14z[5:3] } = { celloutsig_1_0z, in_data[190:188] } ~^ { celloutsig_1_2z, celloutsig_1_4z[2:1], celloutsig_1_0z };
  assign { celloutsig_1_9z[6:5], celloutsig_1_9z[0] } = { celloutsig_1_4z[1], celloutsig_1_3z[2], celloutsig_1_2z } | { celloutsig_1_7z[7:6], celloutsig_1_0z };
  assign { out_data[102:101], out_data[96], out_data[115:113], out_data[108], out_data[117], out_data[103] } = { celloutsig_1_9z[6:5], celloutsig_1_9z[0], celloutsig_1_7z[7:5], celloutsig_1_7z[0], celloutsig_1_3z[0], celloutsig_1_0z } ~^ { celloutsig_1_17z[1:0], celloutsig_1_18z, celloutsig_1_8z, celloutsig_1_9z[6:5], celloutsig_1_9z[0], celloutsig_1_14z[2], celloutsig_1_17z[2] };
  assign _01_[1] = _00_;
  assign celloutsig_0_24z[3] = celloutsig_0_24z[4];
  assign { celloutsig_1_14z[6], celloutsig_1_14z[1:0] } = { celloutsig_1_11z[0], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_9z[4:1] = 4'hf;
  assign { out_data[128], out_data[116], out_data[112:109], out_data[107:104], out_data[100:97], out_data[34:32], out_data[7:0] } = { celloutsig_1_18z, celloutsig_1_1z, celloutsig_1_7z[4:1], celloutsig_1_13z, celloutsig_1_0z, celloutsig_1_17z[4:3], celloutsig_1_10z, celloutsig_1_11z, celloutsig_0_70z, celloutsig_0_71z };
endmodule
