/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  reg [10:0] celloutsig_0_35z;
  wire celloutsig_0_3z;
  wire celloutsig_0_47z;
  wire celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  reg [8:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
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
  always_latch
    if (clkin_data[32]) celloutsig_0_35z = 11'h000;
    else if (!celloutsig_1_19z) celloutsig_0_35z = { celloutsig_0_30z, celloutsig_0_12z, celloutsig_0_13z, celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_30z, celloutsig_0_30z, celloutsig_0_20z, celloutsig_0_28z, celloutsig_0_9z, celloutsig_0_24z };
  always_latch
    if (clkin_data[64]) celloutsig_1_1z = 9'h000;
    else if (!clkin_data[96]) celloutsig_1_1z = in_data[106:98];
  assign celloutsig_0_0z = ~((in_data[39] & in_data[57]) | (in_data[35] & in_data[94]));
  assign celloutsig_0_20z = ~((celloutsig_0_1z & celloutsig_0_12z) | (celloutsig_0_14z & celloutsig_0_18z));
  assign celloutsig_0_21z = ~((celloutsig_0_20z & celloutsig_0_1z) | (celloutsig_0_20z & celloutsig_0_18z));
  assign celloutsig_0_2z = ~((celloutsig_0_1z & in_data[36]) | (in_data[88] & celloutsig_0_1z));
  assign celloutsig_0_22z = ~((celloutsig_0_9z & in_data[11]) | (celloutsig_0_8z & in_data[65]));
  assign celloutsig_0_23z = ~((celloutsig_0_20z & celloutsig_0_3z) | (celloutsig_0_13z & celloutsig_0_22z));
  assign celloutsig_0_24z = ~((celloutsig_0_7z & celloutsig_0_14z) | (celloutsig_0_14z & celloutsig_0_13z));
  assign celloutsig_0_25z = ~((celloutsig_0_16z & celloutsig_0_9z) | (celloutsig_0_10z & celloutsig_0_24z));
  assign celloutsig_0_26z = ~((celloutsig_0_20z & celloutsig_0_12z) | (celloutsig_0_17z & celloutsig_0_5z));
  assign celloutsig_0_28z = ~((celloutsig_0_9z & celloutsig_0_21z) | (celloutsig_0_2z & celloutsig_0_22z));
  assign celloutsig_0_30z = ~((celloutsig_0_18z & celloutsig_0_14z) | (celloutsig_0_5z & celloutsig_0_25z));
  assign celloutsig_0_3z = ~((celloutsig_0_0z & celloutsig_0_2z) | (celloutsig_0_1z & celloutsig_0_2z));
  assign celloutsig_0_4z = ~((celloutsig_0_1z & celloutsig_0_2z) | (celloutsig_0_0z & celloutsig_0_2z));
  assign celloutsig_0_47z = ~((celloutsig_0_17z & celloutsig_0_28z) | (celloutsig_0_25z & celloutsig_0_26z));
  assign celloutsig_0_48z = ~((celloutsig_0_25z & celloutsig_0_7z) | (celloutsig_0_7z & celloutsig_0_35z[9]));
  assign celloutsig_1_0z = ~((in_data[166] & in_data[174]) | (in_data[126] & in_data[129]));
  assign celloutsig_1_2z = ~((celloutsig_1_1z[7] & in_data[127]) | (celloutsig_1_0z & celloutsig_1_0z));
  assign celloutsig_1_3z = ~((celloutsig_1_0z & celloutsig_1_0z) | (celloutsig_1_1z[4] & celloutsig_1_0z));
  assign celloutsig_0_5z = ~((in_data[34] & in_data[11]) | (celloutsig_0_2z & celloutsig_0_1z));
  assign celloutsig_1_4z = ~((celloutsig_1_1z[4] & celloutsig_1_0z) | (celloutsig_1_1z[4] & celloutsig_1_2z));
  assign celloutsig_1_5z = ~((celloutsig_1_0z & celloutsig_1_4z) | (celloutsig_1_1z[6] & in_data[103]));
  assign celloutsig_1_6z = ~((celloutsig_1_0z & celloutsig_1_5z) | (celloutsig_1_4z & celloutsig_1_0z));
  assign celloutsig_1_7z = ~((celloutsig_1_4z & celloutsig_1_3z) | (celloutsig_1_2z & celloutsig_1_0z));
  assign celloutsig_1_8z = ~((celloutsig_1_5z & celloutsig_1_4z) | (in_data[157] & in_data[186]));
  assign celloutsig_1_9z = ~((celloutsig_1_7z & celloutsig_1_2z) | (celloutsig_1_5z & celloutsig_1_2z));
  assign celloutsig_1_10z = ~((celloutsig_1_8z & celloutsig_1_6z) | (celloutsig_1_6z & celloutsig_1_1z[0]));
  assign celloutsig_1_11z = ~((celloutsig_1_3z & celloutsig_1_1z[0]) | (celloutsig_1_10z & celloutsig_1_9z));
  assign celloutsig_1_13z = ~((celloutsig_1_8z & celloutsig_1_11z) | (celloutsig_1_6z & celloutsig_1_1z[7]));
  assign celloutsig_0_6z = ~((celloutsig_0_4z & celloutsig_0_2z) | (celloutsig_0_2z & in_data[42]));
  assign celloutsig_1_14z = ~((celloutsig_1_7z & celloutsig_1_0z) | (celloutsig_1_0z & celloutsig_1_13z));
  assign celloutsig_1_18z = ~((celloutsig_1_14z & celloutsig_1_3z) | (celloutsig_1_7z & celloutsig_1_1z[7]));
  assign celloutsig_1_19z = ~((celloutsig_1_4z & celloutsig_1_4z) | (celloutsig_1_8z & celloutsig_1_4z));
  assign celloutsig_0_7z = ~((celloutsig_0_1z & in_data[19]) | (celloutsig_0_3z & celloutsig_0_0z));
  assign celloutsig_0_8z = ~((celloutsig_0_6z & celloutsig_0_7z) | (celloutsig_0_5z & celloutsig_0_7z));
  assign celloutsig_0_9z = ~((in_data[52] & celloutsig_0_8z) | (celloutsig_0_7z & celloutsig_0_3z));
  assign celloutsig_0_10z = ~((celloutsig_0_4z & celloutsig_0_0z) | (celloutsig_0_3z & celloutsig_0_7z));
  assign celloutsig_0_1z = ~((in_data[82] & in_data[7]) | (celloutsig_0_0z & celloutsig_0_0z));
  assign celloutsig_0_12z = ~((celloutsig_0_4z & celloutsig_0_0z) | (celloutsig_0_10z & celloutsig_0_7z));
  assign celloutsig_0_13z = ~((celloutsig_0_5z & celloutsig_0_8z) | (celloutsig_0_9z & celloutsig_0_1z));
  assign celloutsig_0_14z = ~((celloutsig_0_12z & celloutsig_0_1z) | (celloutsig_0_10z & celloutsig_0_6z));
  assign celloutsig_0_16z = ~((celloutsig_0_10z & celloutsig_0_1z) | (celloutsig_0_3z & celloutsig_0_6z));
  assign celloutsig_0_17z = ~((celloutsig_0_2z & celloutsig_0_6z) | (celloutsig_0_16z & celloutsig_0_9z));
  assign celloutsig_0_18z = ~((celloutsig_0_12z & celloutsig_0_1z) | (celloutsig_0_16z & celloutsig_0_14z));
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_47z, celloutsig_0_48z };
endmodule
