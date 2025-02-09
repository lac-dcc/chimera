/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire [2:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [6:0] celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_24z;
  wire [5:0] celloutsig_0_25z;
  wire [5:0] celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire [3:0] celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire [18:0] celloutsig_0_31z;
  wire [14:0] celloutsig_0_33z;
  wire [3:0] celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_37z;
  wire [12:0] celloutsig_0_38z;
  wire [7:0] celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_46z;
  wire celloutsig_0_47z;
  wire [5:0] celloutsig_0_48z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire [8:0] celloutsig_0_54z;
  wire celloutsig_0_55z;
  wire [9:0] celloutsig_0_58z;
  wire [22:0] celloutsig_0_5z;
  reg [3:0] celloutsig_0_62z;
  wire celloutsig_0_65z;
  wire celloutsig_0_66z;
  wire celloutsig_0_67z;
  wire [3:0] celloutsig_0_6z;
  wire celloutsig_0_73z;
  wire celloutsig_0_78z;
  reg [15:0] celloutsig_0_7z;
  wire celloutsig_0_82z;
  wire celloutsig_0_83z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  reg [5:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire [11:0] celloutsig_1_18z;
  wire [24:0] celloutsig_1_19z;
  reg [8:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [3:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [20:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_51z = celloutsig_0_50z ? celloutsig_0_10z : celloutsig_0_43z;
  assign celloutsig_0_67z = celloutsig_0_65z ? celloutsig_0_48z[4] : celloutsig_0_5z[7];
  assign celloutsig_0_82z = celloutsig_0_73z ? celloutsig_0_17z : celloutsig_0_39z[0];
  assign celloutsig_1_2z = celloutsig_1_1z[1] ? celloutsig_1_0z[4] : celloutsig_1_0z[0];
  assign celloutsig_1_14z = celloutsig_1_13z ? celloutsig_1_1z[6] : celloutsig_1_11z;
  assign celloutsig_0_24z = celloutsig_0_16z ? celloutsig_0_23z : celloutsig_0_4z;
  assign celloutsig_0_37z = ~(celloutsig_0_21z & celloutsig_0_6z[1]);
  assign celloutsig_0_40z = ~(celloutsig_0_15z & celloutsig_0_33z[10]);
  assign celloutsig_0_47z = ~(celloutsig_0_12z & celloutsig_0_28z);
  assign celloutsig_0_73z = ~(celloutsig_0_17z & celloutsig_0_66z);
  assign celloutsig_0_8z = ~(celloutsig_0_4z & celloutsig_0_4z);
  assign celloutsig_0_12z = ~(celloutsig_0_4z & celloutsig_0_11z[2]);
  assign celloutsig_0_13z = ~(celloutsig_0_9z & celloutsig_0_5z[11]);
  assign celloutsig_0_16z = ~(celloutsig_0_4z & celloutsig_0_5z[4]);
  assign celloutsig_0_30z = ~(celloutsig_0_24z & celloutsig_0_21z);
  assign celloutsig_0_35z = celloutsig_0_23z ^ celloutsig_0_10z;
  assign celloutsig_0_42z = celloutsig_0_14z ^ celloutsig_0_11z[5];
  assign celloutsig_0_4z = celloutsig_0_0z[2] ^ celloutsig_0_3z;
  assign celloutsig_0_46z = celloutsig_0_43z ^ celloutsig_0_34z[2];
  assign celloutsig_0_50z = celloutsig_0_16z ^ celloutsig_0_46z;
  assign celloutsig_0_65z = celloutsig_0_22z ^ celloutsig_0_11z[3];
  assign celloutsig_1_3z = in_data[181] ^ celloutsig_1_1z[7];
  assign celloutsig_1_7z = celloutsig_1_6z ^ celloutsig_1_4z;
  assign celloutsig_0_14z = celloutsig_0_3z ^ celloutsig_0_5z[10];
  assign celloutsig_0_21z = celloutsig_0_8z ^ celloutsig_0_19z;
  assign celloutsig_0_3z = { in_data[57:56], celloutsig_0_1z, celloutsig_0_0z } > { in_data[65:64], celloutsig_0_2z };
  assign celloutsig_0_66z = { celloutsig_0_62z[2:1], celloutsig_0_47z, celloutsig_0_3z } > celloutsig_0_5z[4:1];
  assign celloutsig_0_78z = { celloutsig_0_33z[14:1], celloutsig_0_67z, celloutsig_0_65z } > { celloutsig_0_58z[5:3], celloutsig_0_48z, celloutsig_0_29z, celloutsig_0_35z, celloutsig_0_40z, celloutsig_0_17z, celloutsig_0_27z, celloutsig_0_9z, celloutsig_0_65z };
  assign celloutsig_0_83z = { celloutsig_0_21z, celloutsig_0_14z, celloutsig_0_73z, celloutsig_0_11z, celloutsig_0_65z, celloutsig_0_78z, celloutsig_0_12z } > { celloutsig_0_82z, celloutsig_0_51z, celloutsig_0_58z, celloutsig_0_21z };
  assign celloutsig_1_6z = { celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_4z } > { celloutsig_1_0z[2:0], celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_1_9z = celloutsig_1_1z[7:1] > { celloutsig_1_1z[7:3], celloutsig_1_3z, celloutsig_1_4z };
  assign celloutsig_1_10z = { celloutsig_1_8z[19:12], celloutsig_1_0z } > celloutsig_1_8z[19:6];
  assign celloutsig_1_11z = { celloutsig_1_5z[0], celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_9z, celloutsig_1_7z } > { celloutsig_1_1z[6:2], celloutsig_1_9z };
  assign celloutsig_1_13z = { in_data[163:150], celloutsig_1_2z, celloutsig_1_7z } > { celloutsig_1_8z[19:5], celloutsig_1_11z };
  assign celloutsig_0_10z = { celloutsig_0_5z[21:20], celloutsig_0_2z } > { in_data[5:1], celloutsig_0_9z };
  assign celloutsig_0_15z = { in_data[21:17], celloutsig_0_12z, celloutsig_0_9z, celloutsig_0_2z } > { in_data[15:14], celloutsig_0_12z, celloutsig_0_1z, celloutsig_0_11z };
  assign celloutsig_0_17z = { celloutsig_0_2z[2], celloutsig_0_2z } > { celloutsig_0_10z, celloutsig_0_16z, celloutsig_0_0z };
  assign celloutsig_0_19z = { celloutsig_0_11z[2:0], celloutsig_0_12z, celloutsig_0_16z, celloutsig_0_4z } > { celloutsig_0_7z[5:4], celloutsig_0_2z };
  assign celloutsig_0_20z = { in_data[14:13], celloutsig_0_3z, celloutsig_0_11z } > celloutsig_0_5z[15:6];
  assign celloutsig_0_28z = { celloutsig_0_0z[1], celloutsig_0_24z, celloutsig_0_20z, celloutsig_0_4z, celloutsig_0_19z } > celloutsig_0_11z[5:1];
  assign celloutsig_0_29z = in_data[88:73] > { celloutsig_0_25z, celloutsig_0_28z, celloutsig_0_21z, celloutsig_0_4z, celloutsig_0_23z, celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_15z };
  assign celloutsig_0_43z = { celloutsig_0_25z[2:0], celloutsig_0_0z, celloutsig_0_25z } && celloutsig_0_38z[11:0];
  assign celloutsig_0_55z = { celloutsig_0_26z[4:0], celloutsig_0_0z } && celloutsig_0_54z[8:1];
  assign celloutsig_0_9z = { celloutsig_0_7z[12:7], celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_6z } && celloutsig_0_5z[22:8];
  assign celloutsig_1_12z = celloutsig_1_8z[15:6] && { in_data[130:125], celloutsig_1_9z, celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_10z };
  assign celloutsig_0_27z = { celloutsig_0_26z[3:2], celloutsig_0_24z, celloutsig_0_2z } && { celloutsig_0_5z[19:15], celloutsig_0_3z, celloutsig_0_21z };
  assign celloutsig_0_38z = - { celloutsig_0_28z, celloutsig_0_13z, celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_22z, celloutsig_0_12z, celloutsig_0_19z, celloutsig_0_27z, celloutsig_0_15z, celloutsig_0_1z };
  assign celloutsig_0_48z = - { celloutsig_0_31z[9], celloutsig_0_47z, celloutsig_0_16z, celloutsig_0_12z, celloutsig_0_19z, celloutsig_0_22z };
  assign celloutsig_0_5z = - { in_data[47:26], celloutsig_0_1z };
  assign celloutsig_0_54z = - { celloutsig_0_28z, celloutsig_0_11z, celloutsig_0_1z };
  assign celloutsig_1_8z = - { in_data[137:125], celloutsig_1_6z, celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_5z, celloutsig_1_7z };
  assign celloutsig_0_25z = - { celloutsig_0_7z[10:7], celloutsig_0_16z, celloutsig_0_24z };
  assign celloutsig_1_4z = in_data[110] & celloutsig_1_1z[0];
  assign celloutsig_1_16z = celloutsig_1_13z & celloutsig_1_7z;
  assign celloutsig_0_1z = in_data[43] & celloutsig_0_0z[1];
  assign celloutsig_0_22z = celloutsig_0_17z & celloutsig_0_19z;
  assign celloutsig_0_23z = celloutsig_0_4z & celloutsig_0_0z[1];
  assign celloutsig_0_6z = { in_data[37:36], celloutsig_0_1z, celloutsig_0_3z } <<< { celloutsig_0_5z[18], celloutsig_0_0z };
  assign celloutsig_1_5z = celloutsig_1_1z[5:2] <<< { celloutsig_1_1z[2:0], celloutsig_1_3z };
  assign celloutsig_0_11z = { in_data[8:4], celloutsig_0_3z, celloutsig_0_8z } <<< { in_data[29:24], celloutsig_0_9z };
  assign celloutsig_0_31z = in_data[47:29] <<< { celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_28z, celloutsig_0_27z, celloutsig_0_8z, celloutsig_0_30z, celloutsig_0_9z, celloutsig_0_2z, celloutsig_0_25z };
  assign celloutsig_0_0z = in_data[64:62] >>> in_data[83:81];
  assign celloutsig_0_33z = { celloutsig_0_7z[15:2], celloutsig_0_20z } >>> { celloutsig_0_26z[5:2], celloutsig_0_4z, celloutsig_0_30z, celloutsig_0_20z, celloutsig_0_21z, celloutsig_0_25z, celloutsig_0_16z };
  assign celloutsig_0_34z = { celloutsig_0_5z[16:15], celloutsig_0_27z, celloutsig_0_27z } >>> celloutsig_0_6z;
  assign celloutsig_0_39z = celloutsig_0_38z[7:0] >>> { celloutsig_0_17z, celloutsig_0_11z };
  assign celloutsig_0_58z = { celloutsig_0_33z[8:1], celloutsig_0_37z, celloutsig_0_10z } >>> { celloutsig_0_55z, celloutsig_0_4z, 1'h0, celloutsig_0_42z, celloutsig_0_20z, celloutsig_0_2z, celloutsig_0_3z };
  assign celloutsig_1_18z = { in_data[127:125], celloutsig_1_6z, celloutsig_1_6z, celloutsig_1_10z, celloutsig_1_16z, celloutsig_1_13z, celloutsig_1_16z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_13z } >>> { in_data[113:103], celloutsig_1_7z };
  assign celloutsig_1_19z = { celloutsig_1_0z[3:1], celloutsig_1_2z, celloutsig_1_11z, celloutsig_1_14z, celloutsig_1_16z, celloutsig_1_0z, celloutsig_1_18z } >>> { in_data[171], celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_12z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_7z };
  assign celloutsig_0_2z = { celloutsig_0_1z, celloutsig_0_0z } >>> { celloutsig_0_0z, celloutsig_0_1z };
  assign celloutsig_0_26z = { in_data[70:67], celloutsig_0_24z, celloutsig_0_12z } >>> { celloutsig_0_11z[6:3], celloutsig_0_14z, celloutsig_0_9z };
  always_latch
    if (clkin_data[32]) celloutsig_0_62z = 4'h0;
    else if (!celloutsig_1_18z[0]) celloutsig_0_62z = celloutsig_0_58z[6:3];
  always_latch
    if (!clkin_data[32]) celloutsig_0_7z = 16'h0000;
    else if (celloutsig_1_18z[0]) celloutsig_0_7z = { in_data[40:35], celloutsig_0_6z, celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_4z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_0z = 6'h00;
    else if (!clkin_data[0]) celloutsig_1_0z = in_data[131:126];
  always_latch
    if (!clkin_data[64]) celloutsig_1_1z = 9'h000;
    else if (!clkin_data[0]) celloutsig_1_1z = { celloutsig_1_0z[2:0], celloutsig_1_0z };
  assign { out_data[139:128], out_data[120:96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_82z, celloutsig_0_83z };
endmodule
