/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [25:0] _01_;
  reg [8:0] _02_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
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
  wire celloutsig_0_34z;
  wire celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_37z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_47z;
  wire celloutsig_0_49z;
  wire celloutsig_0_4z;
  wire celloutsig_0_50z;
  wire celloutsig_0_51z;
  wire celloutsig_0_55z;
  wire celloutsig_0_57z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_71z;
  wire celloutsig_0_73z;
  wire celloutsig_0_74z;
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
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = celloutsig_0_2z | ~(celloutsig_0_0z);
  assign celloutsig_0_34z = celloutsig_0_32z | ~(celloutsig_0_19z);
  assign celloutsig_0_51z = _00_ | ~(celloutsig_0_8z);
  assign celloutsig_0_55z = celloutsig_0_51z | ~(celloutsig_0_11z);
  assign celloutsig_0_71z = celloutsig_0_50z | ~(celloutsig_0_8z);
  assign celloutsig_0_74z = celloutsig_0_71z | ~(celloutsig_0_47z);
  assign celloutsig_1_4z = celloutsig_1_2z | ~(celloutsig_1_2z);
  assign celloutsig_1_14z = celloutsig_1_6z | ~(celloutsig_1_7z);
  assign celloutsig_1_18z = celloutsig_1_0z | ~(celloutsig_1_8z);
  assign celloutsig_0_9z = celloutsig_0_7z | ~(celloutsig_0_0z);
  assign celloutsig_0_11z = celloutsig_0_6z | ~(in_data[79]);
  assign celloutsig_0_27z = celloutsig_0_14z | ~(celloutsig_0_26z);
  reg [25:0] _15_;
  always_ff @(posedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _15_ <= 26'h0000000;
    else _15_ <= { celloutsig_0_21z, celloutsig_0_13z, celloutsig_0_14z, celloutsig_0_28z, celloutsig_0_6z, celloutsig_0_32z, celloutsig_0_16z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_20z, celloutsig_0_30z, celloutsig_0_6z, celloutsig_0_11z, celloutsig_0_27z, celloutsig_0_7z, celloutsig_0_18z, celloutsig_0_7z, celloutsig_0_16z, celloutsig_0_10z, celloutsig_0_29z, celloutsig_0_16z, celloutsig_0_5z, celloutsig_0_18z, celloutsig_0_17z, celloutsig_0_26z, celloutsig_0_22z };
  assign { _01_[25:3], _00_, _01_[1:0] } = _15_;
  always_ff @(negedge clkin_data[32], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _02_ <= 9'h000;
    else _02_ <= { _01_[23:19], celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_32z, celloutsig_0_4z };
  assign celloutsig_0_31z = { celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_27z } && { celloutsig_0_16z, celloutsig_0_30z, celloutsig_0_25z, celloutsig_0_23z };
  assign celloutsig_0_32z = { celloutsig_0_24z, celloutsig_0_31z, celloutsig_0_16z, celloutsig_0_18z, celloutsig_0_16z } && { celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_4z, celloutsig_0_28z, celloutsig_0_3z };
  assign celloutsig_0_49z = { _01_[24:3], _00_, celloutsig_0_1z, celloutsig_0_27z, celloutsig_0_25z, celloutsig_0_23z } && { in_data[28:5], celloutsig_0_9z, celloutsig_0_21z, celloutsig_0_27z };
  assign celloutsig_0_6z = in_data[34:28] && { celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_1z };
  assign celloutsig_0_15z = { celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_5z, celloutsig_0_9z, celloutsig_0_14z } && { celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_14z, celloutsig_0_14z, celloutsig_0_2z, celloutsig_0_7z };
  assign celloutsig_0_36z = ! { celloutsig_0_30z, celloutsig_0_19z, celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_13z, celloutsig_0_0z, celloutsig_0_25z, celloutsig_0_21z, celloutsig_0_13z };
  assign celloutsig_0_38z = ! { celloutsig_0_10z, celloutsig_0_22z, celloutsig_0_34z, celloutsig_0_19z, celloutsig_0_31z, celloutsig_0_27z, celloutsig_0_32z, celloutsig_0_0z };
  assign celloutsig_0_57z = ! { _01_[10:4], celloutsig_0_22z, celloutsig_0_55z, celloutsig_0_22z, celloutsig_0_18z, celloutsig_0_9z, celloutsig_0_37z };
  assign celloutsig_1_7z = ! { celloutsig_1_2z, celloutsig_1_6z, celloutsig_1_2z };
  assign celloutsig_0_7z = ! { celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_2z };
  assign celloutsig_0_24z = ! { celloutsig_0_13z, celloutsig_0_23z, celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_0z };
  assign celloutsig_0_26z = ! { in_data[72:67], celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_2z, celloutsig_0_14z, celloutsig_0_7z, celloutsig_0_24z, celloutsig_0_4z };
  assign celloutsig_0_35z = { in_data[23:20], celloutsig_0_28z, celloutsig_0_26z } < { celloutsig_0_11z, celloutsig_0_22z, celloutsig_0_3z, celloutsig_0_0z, celloutsig_0_12z, celloutsig_0_24z };
  assign celloutsig_0_43z = { celloutsig_0_31z, celloutsig_0_36z, celloutsig_0_35z, celloutsig_0_31z, celloutsig_0_18z, celloutsig_0_25z, celloutsig_0_14z, celloutsig_0_37z, celloutsig_0_38z, celloutsig_0_31z, celloutsig_0_21z, celloutsig_0_21z, celloutsig_0_2z, celloutsig_0_0z } < { _01_[17:12], celloutsig_0_16z, celloutsig_0_15z, celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_16z, celloutsig_0_42z, celloutsig_0_9z, celloutsig_0_30z };
  assign celloutsig_1_2z = in_data[125:111] < { in_data[167:155], celloutsig_1_0z, celloutsig_1_1z };
  assign celloutsig_1_3z = { celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_1z } < in_data[191:188];
  assign celloutsig_1_5z = { in_data[145:131], celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z } < { in_data[118:104], celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_1_11z = { celloutsig_1_7z, celloutsig_1_10z, celloutsig_1_7z } < { celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_0_17z = { in_data[2:1], celloutsig_0_13z } < { celloutsig_0_13z, celloutsig_0_4z, celloutsig_0_6z };
  assign celloutsig_0_2z = in_data[44:40] < { in_data[16:14], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_0_21z = { celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_17z } < { celloutsig_0_17z, celloutsig_0_1z, celloutsig_0_18z };
  assign celloutsig_0_23z = { in_data[94:77], celloutsig_0_21z, celloutsig_0_4z, celloutsig_0_18z, celloutsig_0_15z, celloutsig_0_10z, celloutsig_0_8z } < { in_data[36:35], celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_4z, celloutsig_0_11z, celloutsig_0_20z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_0z, celloutsig_0_21z, celloutsig_0_21z, celloutsig_0_2z, celloutsig_0_22z, celloutsig_0_17z, celloutsig_0_16z, celloutsig_0_22z, celloutsig_0_12z, celloutsig_0_2z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_6z, celloutsig_0_20z };
  assign celloutsig_0_28z = { celloutsig_0_10z, celloutsig_0_11z, celloutsig_0_23z, celloutsig_0_27z, celloutsig_0_9z, celloutsig_0_26z, celloutsig_0_15z, celloutsig_0_12z, celloutsig_0_13z } < { celloutsig_0_27z, celloutsig_0_20z, celloutsig_0_0z, celloutsig_0_5z, celloutsig_0_3z, celloutsig_0_17z, celloutsig_0_0z, celloutsig_0_20z, celloutsig_0_22z };
  assign celloutsig_0_42z = celloutsig_0_12z & ~(celloutsig_0_29z);
  assign celloutsig_0_47z = celloutsig_0_9z & ~(celloutsig_0_9z);
  assign celloutsig_0_73z = _02_[2] & ~(celloutsig_0_57z);
  assign celloutsig_1_0z = in_data[138] & ~(in_data[108]);
  assign celloutsig_1_1z = celloutsig_1_0z & ~(celloutsig_1_0z);
  assign celloutsig_1_6z = celloutsig_1_2z & ~(in_data[130]);
  assign celloutsig_1_10z = celloutsig_1_5z & ~(celloutsig_1_1z);
  assign celloutsig_1_13z = celloutsig_1_1z & ~(celloutsig_1_11z);
  assign celloutsig_0_8z = celloutsig_0_7z & ~(celloutsig_0_5z);
  assign celloutsig_0_10z = celloutsig_0_1z & ~(celloutsig_0_4z);
  assign celloutsig_0_29z = celloutsig_0_15z & ~(celloutsig_0_13z);
  assign celloutsig_0_0z = in_data[62:51] !== in_data[28:17];
  assign celloutsig_0_50z = { celloutsig_0_43z, celloutsig_0_12z, celloutsig_0_26z, celloutsig_0_25z, celloutsig_0_10z, celloutsig_0_49z, celloutsig_0_3z, celloutsig_0_24z, celloutsig_0_3z, celloutsig_0_38z, celloutsig_0_22z, celloutsig_0_25z, celloutsig_0_47z, celloutsig_0_32z, celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_4z, celloutsig_0_47z, celloutsig_0_30z } !== { in_data[88:71], celloutsig_0_34z, celloutsig_0_19z };
  assign celloutsig_1_8z = in_data[165:145] !== { in_data[167:149], celloutsig_1_5z, celloutsig_1_3z };
  assign celloutsig_1_19z = { celloutsig_1_13z, celloutsig_1_13z, celloutsig_1_13z, celloutsig_1_7z, celloutsig_1_10z, celloutsig_1_10z, celloutsig_1_14z, celloutsig_1_18z, celloutsig_1_8z, celloutsig_1_2z } !== { in_data[151:149], celloutsig_1_10z, celloutsig_1_6z, celloutsig_1_8z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_4z, celloutsig_1_11z };
  assign celloutsig_0_1z = in_data[49:46] !== in_data[42:39];
  assign celloutsig_0_16z = { celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_9z, celloutsig_0_9z } !== { celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_14z, celloutsig_0_4z };
  assign celloutsig_0_37z = | { celloutsig_0_15z, celloutsig_0_30z, celloutsig_0_11z, celloutsig_0_28z };
  assign celloutsig_0_14z = | { celloutsig_0_12z, celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_11z, celloutsig_0_12z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_0z };
  assign celloutsig_0_18z = | { celloutsig_0_1z, celloutsig_0_17z, celloutsig_0_9z, celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_11z, celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_16z, celloutsig_0_3z, celloutsig_0_10z, celloutsig_0_13z, celloutsig_0_3z, celloutsig_0_15z, celloutsig_0_8z };
  assign celloutsig_0_20z = | { celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_4z };
  assign celloutsig_0_25z = | { celloutsig_0_14z, celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_14z, celloutsig_0_13z, celloutsig_0_8z, celloutsig_0_12z, celloutsig_0_21z, celloutsig_0_7z, celloutsig_0_19z, celloutsig_0_9z };
  assign celloutsig_0_4z = ~((in_data[64] & celloutsig_0_0z) | (celloutsig_0_1z & celloutsig_0_1z));
  assign celloutsig_0_5z = ~((in_data[49] & celloutsig_0_2z) | (in_data[62] & celloutsig_0_0z));
  assign celloutsig_0_12z = ~((celloutsig_0_8z & celloutsig_0_0z) | (in_data[65] & celloutsig_0_7z));
  assign celloutsig_0_13z = ~((celloutsig_0_8z & celloutsig_0_0z) | (in_data[14] & celloutsig_0_1z));
  assign celloutsig_0_19z = ~((celloutsig_0_4z & celloutsig_0_8z) | (celloutsig_0_8z & celloutsig_0_5z));
  assign celloutsig_0_22z = ~((celloutsig_0_20z & celloutsig_0_5z) | (celloutsig_0_18z & celloutsig_0_0z));
  assign celloutsig_0_30z = ~((celloutsig_0_5z & celloutsig_0_28z) | (celloutsig_0_22z & celloutsig_0_14z));
  assign _01_[2] = _00_;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_73z, celloutsig_0_74z };
endmodule
