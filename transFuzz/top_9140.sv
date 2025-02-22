/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  reg [14:0] celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  reg [27:0] celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  reg [2:0] celloutsig_0_35z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  reg [2:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
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
  assign celloutsig_0_40z = celloutsig_0_33z | ~(celloutsig_0_4z);
  assign celloutsig_0_4z = celloutsig_0_3z | ~(celloutsig_0_1z);
  assign celloutsig_0_42z = celloutsig_0_7z | ~(celloutsig_0_16z);
  assign celloutsig_0_43z = celloutsig_0_17z[7] | ~(celloutsig_0_32z);
  assign celloutsig_0_49z = celloutsig_0_21z | ~(celloutsig_0_6z);
  assign celloutsig_0_50z = celloutsig_0_43z | ~(celloutsig_0_2z);
  assign celloutsig_0_5z = celloutsig_0_0z | ~(celloutsig_0_1z);
  assign celloutsig_1_1z = in_data[152] | ~(celloutsig_1_0z);
  assign celloutsig_1_2z = celloutsig_1_1z | ~(celloutsig_1_0z);
  assign celloutsig_0_6z = celloutsig_0_1z | ~(celloutsig_0_4z);
  assign celloutsig_1_8z = celloutsig_1_1z | ~(celloutsig_1_6z);
  assign celloutsig_1_9z = celloutsig_1_8z | ~(in_data[179]);
  assign celloutsig_1_10z = celloutsig_1_6z | ~(celloutsig_1_9z);
  assign celloutsig_1_11z = celloutsig_1_8z | ~(celloutsig_1_5z);
  assign celloutsig_1_13z = celloutsig_1_3z[1] | ~(celloutsig_1_1z);
  assign celloutsig_1_14z = celloutsig_1_13z | ~(celloutsig_1_12z);
  assign celloutsig_1_15z = celloutsig_1_13z | ~(celloutsig_1_11z);
  assign celloutsig_0_7z = celloutsig_0_5z | ~(celloutsig_0_1z);
  assign celloutsig_1_16z = celloutsig_1_2z | ~(celloutsig_1_9z);
  assign celloutsig_1_17z = celloutsig_1_12z | ~(celloutsig_1_10z);
  assign celloutsig_0_8z = celloutsig_0_6z | ~(celloutsig_0_6z);
  assign celloutsig_0_10z = celloutsig_0_8z | ~(celloutsig_0_1z);
  assign celloutsig_0_11z = celloutsig_0_7z | ~(celloutsig_0_3z);
  assign celloutsig_0_12z = celloutsig_0_1z | ~(celloutsig_0_1z);
  assign celloutsig_0_1z = celloutsig_0_0z | ~(celloutsig_0_0z);
  assign celloutsig_0_13z = celloutsig_0_11z | ~(celloutsig_0_8z);
  assign celloutsig_0_15z = celloutsig_0_0z | ~(in_data[58]);
  assign celloutsig_0_18z = celloutsig_0_8z | ~(celloutsig_0_16z);
  assign celloutsig_0_22z = celloutsig_0_20z | ~(celloutsig_0_0z);
  assign celloutsig_0_26z = celloutsig_0_16z | ~(celloutsig_0_11z);
  assign celloutsig_0_27z = celloutsig_0_3z | ~(celloutsig_0_2z);
  assign celloutsig_0_30z = celloutsig_0_20z | ~(celloutsig_0_21z);
  assign celloutsig_0_0z = in_data[57:52] > in_data[56:51];
  assign celloutsig_0_3z = in_data[16:9] > { in_data[51:45], celloutsig_0_0z };
  assign celloutsig_0_33z = { celloutsig_0_17z[5:1], celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_29z, celloutsig_0_25z, celloutsig_0_30z, celloutsig_0_20z, celloutsig_0_31z } > { celloutsig_0_17z[7:1], celloutsig_0_8z, celloutsig_0_30z, celloutsig_0_11z, celloutsig_0_26z, celloutsig_0_13z };
  assign celloutsig_0_38z = { celloutsig_0_17z[10:1], celloutsig_0_3z, celloutsig_0_18z, celloutsig_0_31z, celloutsig_0_30z } > { celloutsig_0_23z[23:18], celloutsig_0_33z, celloutsig_0_21z, celloutsig_0_10z, celloutsig_0_31z, celloutsig_0_14z, celloutsig_0_35z };
  assign celloutsig_0_54z = { celloutsig_0_42z, celloutsig_0_40z, celloutsig_0_38z, celloutsig_0_38z } > { celloutsig_0_50z, celloutsig_0_35z };
  assign celloutsig_0_55z = { celloutsig_0_49z, celloutsig_0_6z, celloutsig_0_32z } > { celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_54z };
  assign celloutsig_1_0z = in_data[155:144] > in_data[119:108];
  assign celloutsig_1_4z = { in_data[182:169], celloutsig_1_0z, celloutsig_1_1z } > { celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_2z };
  assign celloutsig_1_5z = in_data[157:152] > { celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_1_6z = { in_data[158], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z } > { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_5z, celloutsig_1_0z };
  assign celloutsig_1_7z = { celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_4z } > { celloutsig_1_3z[1], celloutsig_1_2z, celloutsig_1_5z };
  assign celloutsig_1_12z = { celloutsig_1_11z, celloutsig_1_3z, celloutsig_1_6z } > { celloutsig_1_11z, celloutsig_1_7z, celloutsig_1_11z, celloutsig_1_6z, celloutsig_1_9z };
  assign celloutsig_1_18z = { in_data[178:174], celloutsig_1_14z, celloutsig_1_15z, celloutsig_1_0z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_17z, celloutsig_1_15z, celloutsig_1_12z } > { celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_17z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_11z, celloutsig_1_17z, celloutsig_1_13z, celloutsig_1_16z, celloutsig_1_2z, celloutsig_1_10z };
  assign celloutsig_1_19z = { celloutsig_1_5z, celloutsig_1_7z, celloutsig_1_2z, celloutsig_1_17z, celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_18z, celloutsig_1_1z, celloutsig_1_10z } > { celloutsig_1_3z[0], celloutsig_1_2z, celloutsig_1_15z, celloutsig_1_0z, celloutsig_1_12z, celloutsig_1_11z, celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_6z };
  assign celloutsig_0_9z = { in_data[11:8], celloutsig_0_8z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_6z } > { celloutsig_0_5z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_1z };
  assign celloutsig_0_14z = { in_data[76], celloutsig_0_8z, celloutsig_0_0z, celloutsig_0_1z } > { celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_12z, celloutsig_0_10z };
  assign celloutsig_0_16z = { celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_4z } > { celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_15z, celloutsig_0_5z };
  assign celloutsig_0_19z = { celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_15z, celloutsig_0_2z } > { celloutsig_0_17z[8:7], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_5z, celloutsig_0_0z };
  assign celloutsig_0_20z = { celloutsig_0_17z[14:1], celloutsig_0_5z, celloutsig_0_16z, celloutsig_0_5z } > { celloutsig_0_17z[13:6], celloutsig_0_16z, celloutsig_0_1z, celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_19z };
  assign celloutsig_0_21z = { celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_8z } > { celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_5z };
  assign celloutsig_0_2z = in_data[74:57] > in_data[29:12];
  assign celloutsig_0_24z = { celloutsig_0_23z[27:23], celloutsig_0_20z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_22z } > { celloutsig_0_17z[10:3], celloutsig_0_19z, celloutsig_0_15z, celloutsig_0_3z, celloutsig_0_20z };
  assign celloutsig_0_25z = celloutsig_0_23z[24:8] > { celloutsig_0_23z[21:8], celloutsig_0_20z, celloutsig_0_16z, celloutsig_0_8z };
  assign celloutsig_0_28z = { celloutsig_0_21z, celloutsig_0_16z, celloutsig_0_20z } > celloutsig_0_23z[23:21];
  assign celloutsig_0_29z = { celloutsig_0_17z, celloutsig_0_7z, celloutsig_0_19z, celloutsig_0_11z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_6z, celloutsig_0_21z, celloutsig_0_19z, celloutsig_0_16z, celloutsig_0_24z, celloutsig_0_2z, celloutsig_0_20z, celloutsig_0_11z, celloutsig_0_3z, celloutsig_0_24z } > { celloutsig_0_17z[14:1], celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_28z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_7z, celloutsig_0_28z, celloutsig_0_12z, celloutsig_0_22z, celloutsig_0_10z, celloutsig_0_1z, celloutsig_0_19z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_19z, celloutsig_0_24z };
  assign celloutsig_0_31z = { celloutsig_0_9z, celloutsig_0_0z, celloutsig_0_8z, celloutsig_0_11z, celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_22z } > { celloutsig_0_6z, celloutsig_0_19z, celloutsig_0_30z, celloutsig_0_19z, celloutsig_0_27z, celloutsig_0_21z, celloutsig_0_8z };
  assign celloutsig_0_32z = in_data[85:74] > { celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_19z, celloutsig_0_7z, celloutsig_0_24z, celloutsig_0_25z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_15z };
  always_latch
    if (clkin_data[64]) celloutsig_0_35z = 3'h0;
    else if (celloutsig_1_19z) celloutsig_0_35z = { celloutsig_0_33z, celloutsig_0_9z, celloutsig_0_9z };
  always_latch
    if (clkin_data[96]) celloutsig_1_3z = 3'h0;
    else if (!clkin_data[32]) celloutsig_1_3z = { in_data[174], celloutsig_1_1z, celloutsig_1_2z };
  always_latch
    if (!clkin_data[64]) celloutsig_0_17z = 15'h0000;
    else if (!clkin_data[0]) celloutsig_0_17z = in_data[36:22];
  always_latch
    if (clkin_data[64]) celloutsig_0_23z = 28'h0000000;
    else if (clkin_data[0]) celloutsig_0_23z = { celloutsig_0_17z[9:0], celloutsig_0_20z, celloutsig_0_22z, celloutsig_0_22z, celloutsig_0_21z, celloutsig_0_14z, celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_12z, celloutsig_0_15z, celloutsig_0_16z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_18z, celloutsig_0_19z, celloutsig_0_19z, celloutsig_0_0z, celloutsig_0_14z };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_54z, celloutsig_0_55z };
endmodule
