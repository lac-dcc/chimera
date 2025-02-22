/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [27:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [5:0] celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  reg [5:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [6:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  reg [17:0] celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire [15:0] celloutsig_0_24z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [10:0] celloutsig_0_27z;
  wire [2:0] celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire [5:0] celloutsig_0_34z;
  wire celloutsig_0_3z;
  wire [2:0] celloutsig_0_40z;
  wire [8:0] celloutsig_0_41z;
  wire celloutsig_0_48z;
  wire [8:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_78z;
  wire celloutsig_0_79z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire [6:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_13z;
  wire [3:0] celloutsig_1_14z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  reg [11:0] celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [7:0] celloutsig_1_8z;
  reg [6:0] celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_2z = celloutsig_1_1z ? in_data[166] : in_data[134];
  assign celloutsig_1_18z = celloutsig_1_10z[0] ? celloutsig_1_10z[2] : celloutsig_1_10z[0];
  assign celloutsig_1_4z = ~(celloutsig_1_2z & celloutsig_1_3z);
  assign celloutsig_0_3z = ~(in_data[70] | in_data[14]);
  assign celloutsig_0_48z = ~(celloutsig_0_5z | in_data[77]);
  assign celloutsig_1_11z = ~((celloutsig_1_7z | celloutsig_1_7z) & (celloutsig_1_9z[4] | in_data[125]));
  assign celloutsig_0_16z = ~((celloutsig_0_4z[3] | celloutsig_0_7z) & (celloutsig_0_14z[3] | in_data[68]));
  assign celloutsig_0_5z = celloutsig_0_3z | ~(celloutsig_0_2z[2]);
  assign celloutsig_0_79z = celloutsig_0_41z[5] | ~(celloutsig_0_27z[10]);
  assign celloutsig_0_13z = celloutsig_0_9z | ~(celloutsig_0_0z);
  assign celloutsig_0_20z = celloutsig_0_13z | ~(celloutsig_0_16z);
  assign celloutsig_0_23z = celloutsig_0_15z | ~(celloutsig_0_12z[19]);
  assign celloutsig_0_17z = celloutsig_0_12z[4] ^ celloutsig_0_7z;
  assign celloutsig_0_0z = ~(in_data[65] ^ in_data[84]);
  assign celloutsig_0_24z = { celloutsig_0_4z, celloutsig_0_18z, celloutsig_0_11z } & celloutsig_0_22z[17:2];
  assign celloutsig_0_33z = { in_data[75:68], celloutsig_0_32z, celloutsig_0_17z } >= { celloutsig_0_12z[15:7], celloutsig_0_32z };
  assign celloutsig_1_13z = celloutsig_1_5z[5:0] >= { celloutsig_1_10z[6:2], celloutsig_1_1z };
  assign celloutsig_0_6z = celloutsig_0_4z[7:1] <= celloutsig_0_1z;
  assign celloutsig_0_7z = celloutsig_0_1z[5:1] && { celloutsig_0_1z[4:1], celloutsig_0_0z };
  assign celloutsig_0_78z = { celloutsig_0_18z, celloutsig_0_48z, celloutsig_0_31z } && celloutsig_0_12z[7:0];
  assign celloutsig_0_9z = { in_data[70:54], celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_5z, celloutsig_0_7z, celloutsig_0_1z } && { in_data[54:44], celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_3z };
  assign celloutsig_1_1z = { in_data[120:118], celloutsig_1_0z } || { in_data[162:160], celloutsig_1_0z };
  assign celloutsig_0_31z = celloutsig_0_12z[21:7] || { in_data[94:87], celloutsig_0_13z, celloutsig_0_18z };
  assign celloutsig_0_8z = { in_data[37:31], celloutsig_0_3z, celloutsig_0_5z } < { celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_5z };
  assign celloutsig_1_3z = { in_data[169], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z } < { in_data[122:119], celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_1_19z = { celloutsig_1_14z[2:0], celloutsig_1_18z, celloutsig_1_2z, celloutsig_1_13z, celloutsig_1_8z, celloutsig_1_11z } < { celloutsig_1_10z[1:0], celloutsig_1_5z, celloutsig_1_1z };
  assign celloutsig_0_10z = { celloutsig_0_1z, celloutsig_0_0z } < { celloutsig_0_4z[5:2], celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_8z };
  assign celloutsig_0_15z = { celloutsig_0_12z[20:7], celloutsig_0_7z } < { celloutsig_0_12z[14:9], celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_11z, celloutsig_0_14z[5:3], celloutsig_0_14z[3], celloutsig_0_14z[1:0] };
  assign celloutsig_0_25z = celloutsig_0_16z & ~(celloutsig_0_22z[15]);
  assign celloutsig_0_32z = celloutsig_0_5z & ~(celloutsig_0_25z);
  assign celloutsig_0_2z = { in_data[61:60], celloutsig_0_0z } % { 1'h1, celloutsig_0_1z[5:4] };
  assign celloutsig_0_4z = in_data[34:26] * { in_data[33:30], celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_8z = { in_data[173:167], celloutsig_1_6z } * { celloutsig_1_4z, celloutsig_1_7z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_6z, celloutsig_1_7z };
  assign celloutsig_0_27z = { celloutsig_0_22z[16:7], celloutsig_0_17z } * { celloutsig_0_1z[3:2], celloutsig_0_6z, celloutsig_0_19z, celloutsig_0_14z[5:3], celloutsig_0_14z[3], celloutsig_0_14z[1:0], celloutsig_0_7z };
  assign celloutsig_1_7z = { celloutsig_1_5z[10:5], celloutsig_1_2z } != in_data[110:104];
  assign celloutsig_0_11z = { celloutsig_0_1z[3:1], celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_3z, celloutsig_0_7z } !== { celloutsig_0_8z, celloutsig_0_1z[6:4], celloutsig_0_1z[2:0] };
  assign celloutsig_1_0z = & in_data[129:112];
  assign celloutsig_0_26z = & { celloutsig_0_25z, celloutsig_0_20z, celloutsig_0_12z[18], celloutsig_0_5z };
  assign celloutsig_1_12z = | { celloutsig_1_8z[5:3], celloutsig_1_0z, celloutsig_1_4z };
  assign celloutsig_1_6z = ~^ { celloutsig_1_5z[5:3], celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_0_19z = ~^ { celloutsig_0_18z[5:1], celloutsig_0_1z };
  assign celloutsig_0_34z = { celloutsig_0_1z[4:0], celloutsig_0_3z } << { celloutsig_0_27z[4:3], celloutsig_0_8z, celloutsig_0_9z, celloutsig_0_13z, celloutsig_0_33z };
  assign celloutsig_0_40z = { celloutsig_0_24z[1], celloutsig_0_16z, celloutsig_0_26z } << { celloutsig_0_14z[4], celloutsig_0_23z, celloutsig_0_3z };
  assign celloutsig_1_14z = { celloutsig_1_5z[6:4], celloutsig_1_11z } << { celloutsig_1_4z, celloutsig_1_12z, celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_0_12z = { celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_9z, celloutsig_0_4z, celloutsig_0_8z, celloutsig_0_8z } << { celloutsig_0_1z[6:4], celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_10z, celloutsig_0_4z, celloutsig_0_9z };
  assign celloutsig_0_41z = { celloutsig_0_34z[5:3], celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_40z, celloutsig_0_13z } >> { celloutsig_0_12z[16:14], celloutsig_0_14z[5:3], celloutsig_0_14z[3], celloutsig_0_14z[1:0] };
  assign celloutsig_1_10z = celloutsig_1_8z[6:0] >> celloutsig_1_9z;
  assign celloutsig_0_1z = in_data[76:70] >> in_data[61:55];
  always_latch
    if (!clkin_data[64]) celloutsig_1_5z = 12'h000;
    else if (clkin_data[0]) celloutsig_1_5z = { in_data[145:138], celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_2z };
  always_latch
    if (!clkin_data[64]) celloutsig_1_9z = 7'h00;
    else if (!clkin_data[0]) celloutsig_1_9z = { celloutsig_1_5z[7:3], celloutsig_1_6z, celloutsig_1_0z };
  always_latch
    if (clkin_data[32]) celloutsig_0_18z = 6'h00;
    else if (celloutsig_1_18z) celloutsig_0_18z = { celloutsig_0_10z, celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_15z, celloutsig_0_3z, celloutsig_0_9z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_22z = 18'h00000;
    else if (!celloutsig_1_18z) celloutsig_0_22z = { celloutsig_0_12z[18:4], celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_17z };
  assign { celloutsig_0_14z[1:0], celloutsig_0_14z[5:3] } = ~ { celloutsig_0_10z, celloutsig_0_9z, celloutsig_0_2z[2:1], celloutsig_0_0z };
  assign celloutsig_0_14z[2] = celloutsig_0_14z[3];
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_78z, celloutsig_0_79z };
endmodule
