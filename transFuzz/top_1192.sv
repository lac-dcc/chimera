/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [9:0] _01_;
  reg [6:0] _02_;
  wire [8:0] _03_;
  wire [18:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire [5:0] celloutsig_0_14z;
  wire [15:0] celloutsig_0_16z;
  wire [12:0] celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [3:0] celloutsig_0_20z;
  wire [3:0] celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_23z;
  wire celloutsig_0_25z;
  wire celloutsig_0_26z;
  wire [18:0] celloutsig_0_27z;
  wire [9:0] celloutsig_0_28z;
  wire [5:0] celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [16:0] celloutsig_0_33z;
  wire [10:0] celloutsig_0_35z;
  wire celloutsig_0_38z;
  wire celloutsig_0_3z;
  wire [9:0] celloutsig_0_40z;
  wire celloutsig_0_41z;
  wire celloutsig_0_42z;
  wire [5:0] celloutsig_0_43z;
  wire celloutsig_0_4z;
  wire celloutsig_0_52z;
  wire celloutsig_0_53z;
  wire celloutsig_0_56z;
  wire [11:0] celloutsig_0_61z;
  wire celloutsig_0_65z;
  wire [3:0] celloutsig_0_66z;
  wire [3:0] celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire [8:0] celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [13:0] celloutsig_1_12z;
  wire [10:0] celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire [8:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_2z;
  wire [2:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [8:0] celloutsig_1_5z;
  wire [2:0] celloutsig_1_6z;
  wire [4:0] celloutsig_1_7z;
  wire [11:0] celloutsig_1_8z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_9z = celloutsig_0_2z ? celloutsig_0_8z[5] : celloutsig_0_1z;
  assign celloutsig_0_25z = celloutsig_0_18z[0] ? in_data[30] : in_data[34];
  assign celloutsig_0_32z = ~(celloutsig_0_22z & celloutsig_0_1z);
  assign celloutsig_1_17z = ~(celloutsig_1_10z & celloutsig_1_14z[10]);
  assign celloutsig_0_12z = ~(celloutsig_0_0z[3] & celloutsig_0_2z);
  assign celloutsig_0_1z = ~(celloutsig_0_0z[11] & in_data[32]);
  assign celloutsig_0_19z = ~(celloutsig_0_9z & celloutsig_0_7z);
  assign celloutsig_0_53z = !(celloutsig_0_19z ? celloutsig_0_52z : celloutsig_0_8z[2]);
  assign celloutsig_0_65z = !(celloutsig_0_1z ? celloutsig_0_61z[10] : celloutsig_0_42z);
  assign celloutsig_1_10z = ~celloutsig_1_3z[2];
  assign celloutsig_0_31z = ~celloutsig_0_3z;
  assign celloutsig_0_52z = celloutsig_0_43z[5] ^ celloutsig_0_10z;
  assign celloutsig_0_11z = celloutsig_0_1z ^ celloutsig_0_6z[2];
  assign celloutsig_0_2z = celloutsig_0_0z[9] ^ celloutsig_0_1z;
  assign celloutsig_0_26z = _00_ ^ celloutsig_0_4z;
  assign celloutsig_0_0z = in_data[35:17] + in_data[81:63];
  assign celloutsig_0_6z = { celloutsig_0_1z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_2z } + { celloutsig_0_0z[13:12], celloutsig_0_4z, celloutsig_0_2z };
  assign celloutsig_1_6z = { celloutsig_1_5z[2], celloutsig_1_4z, celloutsig_1_0z } + { celloutsig_1_5z[1], celloutsig_1_4z, celloutsig_1_4z };
  assign celloutsig_1_18z = in_data[157:149] + { celloutsig_1_5z[6:0], celloutsig_1_2z, celloutsig_1_15z };
  assign celloutsig_0_20z = { in_data[43:41], celloutsig_0_19z } + celloutsig_0_6z;
  assign celloutsig_0_21z = { in_data[40:38], celloutsig_0_3z } + { celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_19z, celloutsig_0_4z };
  assign celloutsig_0_28z = { celloutsig_0_8z[7:2], _01_[3:1], celloutsig_0_22z } + { celloutsig_0_8z[5:1], celloutsig_0_1z, celloutsig_0_21z };
  always_ff @(negedge clkin_data[0], negedge clkin_data[64])
    if (!clkin_data[64]) _02_ <= 7'h00;
    else _02_ <= { in_data[189:184], celloutsig_1_0z };
  reg [8:0] _27_;
  always_ff @(posedge celloutsig_1_18z[0], posedge clkin_data[32])
    if (clkin_data[32]) _27_ <= 9'h000;
    else _27_ <= { celloutsig_0_0z[10:7], celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_3z };
  assign { _03_[8:5], _00_, _03_[3:0] } = _27_;
  reg [2:0] _28_;
  always_ff @(negedge celloutsig_1_18z[0], negedge clkin_data[32])
    if (!clkin_data[32]) _28_ <= 3'h0;
    else _28_ <= celloutsig_0_0z[10:8];
  assign _01_[3:1] = _28_;
  assign celloutsig_0_35z = { celloutsig_0_0z[5:1], celloutsig_0_20z, celloutsig_0_32z, celloutsig_0_26z } & { celloutsig_0_0z[16:12], celloutsig_0_31z, _01_[3:1], celloutsig_0_23z, celloutsig_0_12z };
  assign celloutsig_0_4z = in_data[24:22] === { celloutsig_0_0z[16:15], celloutsig_0_3z };
  assign celloutsig_1_15z = { celloutsig_1_7z[3:0], celloutsig_1_0z } === { celloutsig_1_3z[2], celloutsig_1_0z, celloutsig_1_3z[0], celloutsig_1_10z, celloutsig_1_2z };
  assign celloutsig_0_3z = in_data[62:25] >= in_data[42:5];
  assign celloutsig_1_19z = { celloutsig_1_14z[10:1], celloutsig_1_4z, celloutsig_1_17z, celloutsig_1_6z } >= { celloutsig_1_12z[12:5], _02_ };
  assign celloutsig_0_41z = { celloutsig_0_27z[18:10], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_19z } < celloutsig_0_16z[11:0];
  assign celloutsig_0_56z = celloutsig_0_6z < celloutsig_0_35z[7:4];
  assign celloutsig_1_2z = { in_data[149:144], celloutsig_1_0z } < { in_data[129:124], celloutsig_1_0z };
  assign celloutsig_0_7z = { celloutsig_0_0z[13:12], celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_1z, celloutsig_0_6z } < { in_data[68:59], celloutsig_0_2z };
  assign celloutsig_0_10z = { in_data[95:87], celloutsig_0_0z, celloutsig_0_7z } < { in_data[56:40], celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_1z, celloutsig_0_8z };
  assign celloutsig_0_13z = { celloutsig_0_0z[16], celloutsig_0_7z, celloutsig_0_2z } < celloutsig_0_0z[7:5];
  assign { celloutsig_1_3z[2], celloutsig_1_3z[0] } = celloutsig_1_2z ? { in_data[144], 1'h1 } : { in_data[168], celloutsig_1_0z };
  assign celloutsig_1_5z = celloutsig_1_0z ? { in_data[150:149], celloutsig_1_3z[2], 1'h1, celloutsig_1_3z[0], 1'h1, celloutsig_1_3z[2], 1'h1, celloutsig_1_3z[0] } : { celloutsig_1_3z[2], 2'h0, celloutsig_1_3z[2], 1'h0, celloutsig_1_3z[0], celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_0_38z = celloutsig_0_25z & celloutsig_0_4z;
  assign celloutsig_1_4z = celloutsig_1_2z & celloutsig_1_0z;
  assign celloutsig_0_42z = ~^ celloutsig_0_29z[4:0];
  assign celloutsig_1_0z = ~^ in_data[147:145];
  assign celloutsig_0_22z = ~^ { celloutsig_0_6z, celloutsig_0_2z };
  assign celloutsig_0_23z = ^ { celloutsig_0_18z[8:6], celloutsig_0_10z, celloutsig_0_11z };
  assign celloutsig_0_33z = { celloutsig_0_18z[11:1], celloutsig_0_2z, celloutsig_0_26z, _01_[3:1], celloutsig_0_11z } >> { _03_[1:0], celloutsig_0_19z, celloutsig_0_18z, celloutsig_0_11z };
  assign celloutsig_0_43z = { celloutsig_0_33z[8], celloutsig_0_38z, celloutsig_0_7z, celloutsig_0_32z, celloutsig_0_25z, celloutsig_0_1z } << { celloutsig_0_14z[5:3], _01_[3:1] };
  assign celloutsig_0_61z = { in_data[56:46], celloutsig_0_56z } << { celloutsig_0_13z, celloutsig_0_31z, celloutsig_0_28z };
  assign celloutsig_0_8z = { in_data[70:67], celloutsig_0_6z, celloutsig_0_4z } << { celloutsig_0_0z[14], celloutsig_0_7z, celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_6z };
  assign celloutsig_0_16z = { in_data[31:26], celloutsig_0_2z, _03_[8:5], _00_, _03_[3:0] } << { celloutsig_0_0z[16:10], celloutsig_0_8z };
  assign celloutsig_0_29z = { _01_[3:1], celloutsig_0_3z, celloutsig_0_19z, celloutsig_0_4z } << { celloutsig_0_26z, celloutsig_0_26z, celloutsig_0_7z, _01_[3:1] };
  assign celloutsig_0_40z = celloutsig_0_18z[10:1] - celloutsig_0_18z[12:3];
  assign celloutsig_0_66z = { celloutsig_0_53z, celloutsig_0_52z, celloutsig_0_41z, celloutsig_0_7z } - celloutsig_0_40z[5:2];
  assign celloutsig_0_18z = { celloutsig_0_16z[6:1], celloutsig_0_3z, celloutsig_0_14z } - celloutsig_0_0z[13:1];
  assign celloutsig_0_27z = { celloutsig_0_21z[3:1], celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_22z, celloutsig_0_12z, celloutsig_0_8z } - { in_data[47:46], celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_25z, celloutsig_0_23z, celloutsig_0_8z, celloutsig_0_13z };
  assign celloutsig_1_7z = { celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_2z } ~^ { celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_3z[2], celloutsig_1_0z, celloutsig_1_3z[0] };
  assign celloutsig_1_14z = { in_data[155:147], celloutsig_1_4z, celloutsig_1_4z } ^ { celloutsig_1_12z[12:4], celloutsig_1_10z, celloutsig_1_12z[2] };
  assign celloutsig_0_14z = { in_data[29:25], celloutsig_0_12z } ^ { in_data[43], celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_13z, celloutsig_0_13z, celloutsig_0_10z };
  assign { celloutsig_1_8z[5:3], celloutsig_1_8z[11:10], celloutsig_1_12z[11], celloutsig_1_8z[8:7], celloutsig_1_8z[2], celloutsig_1_8z[6], celloutsig_1_8z[0] } = { celloutsig_1_6z, celloutsig_1_5z[8:4], celloutsig_1_2z, celloutsig_1_0z, celloutsig_1_0z } ^ { celloutsig_1_7z[0], celloutsig_1_0z, celloutsig_1_0z, in_data[167:166], celloutsig_1_7z[4:2], celloutsig_1_3z[2], celloutsig_1_7z[1], celloutsig_1_3z[0] };
  assign { celloutsig_1_12z[13:12], celloutsig_1_12z[10], celloutsig_1_12z[5], celloutsig_1_12z[9], celloutsig_1_12z[2], celloutsig_1_12z[7], celloutsig_1_12z[0], celloutsig_1_12z[6], celloutsig_1_12z[4], celloutsig_1_12z[8], celloutsig_1_12z[1] } = { celloutsig_1_8z[3:2], celloutsig_1_8z[0], celloutsig_1_4z, celloutsig_1_3z[2], celloutsig_1_3z[2], celloutsig_1_3z[0], celloutsig_1_3z[0], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_0z } ^ { celloutsig_1_8z[11:10], celloutsig_1_8z[8], celloutsig_1_8z[3], celloutsig_1_8z[7], celloutsig_1_8z[0], celloutsig_1_8z[5], celloutsig_1_0z, celloutsig_1_8z[4], celloutsig_1_8z[2], celloutsig_1_8z[6], celloutsig_1_10z };
  assign { _01_[9:4], _01_[0] } = { celloutsig_0_8z[7:2], celloutsig_0_22z };
  assign _03_[4] = _00_;
  assign celloutsig_1_12z[3] = celloutsig_1_10z;
  assign celloutsig_1_3z[1] = celloutsig_1_0z;
  assign { celloutsig_1_8z[9], celloutsig_1_8z[1] } = { celloutsig_1_12z[11], 1'h0 };
  assign { out_data[136:128], out_data[96], out_data[32], out_data[3:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_65z, celloutsig_0_66z };
endmodule
