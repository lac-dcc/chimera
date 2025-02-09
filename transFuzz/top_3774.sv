/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [7:0] _00_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [5:0] celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_18z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire [2:0] celloutsig_0_21z;
  wire celloutsig_0_24z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_2z;
  wire [5:0] celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire [4:0] celloutsig_1_13z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire [19:0] celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire [11:0] celloutsig_1_5z;
  wire [10:0] celloutsig_1_6z;
  wire [5:0] celloutsig_1_7z;
  wire [2:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [63:0] clkin_data;
  wire [63:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  always_ff @(negedge clkin_data[0], negedge celloutsig_1_18z)
    if (!celloutsig_1_18z) _00_ <= 8'h00;
    else _00_ <= { in_data[25:20], celloutsig_0_5z, celloutsig_0_4z };
  assign celloutsig_0_21z = { celloutsig_0_3z[1:0], celloutsig_0_14z } / { 1'h1, celloutsig_0_20z, celloutsig_0_11z };
  assign celloutsig_1_11z = { celloutsig_1_8z[1], celloutsig_1_10z, celloutsig_1_3z } >= celloutsig_1_6z[6:4];
  assign celloutsig_1_12z = { celloutsig_1_1z, celloutsig_1_9z, celloutsig_1_3z } >= { celloutsig_1_7z[5], celloutsig_1_3z, celloutsig_1_10z };
  assign celloutsig_1_14z = in_data[157:153] >= { celloutsig_1_6z[7:6], celloutsig_1_12z, celloutsig_1_10z, celloutsig_1_1z };
  assign celloutsig_1_15z = { celloutsig_1_7z[4:3], celloutsig_1_7z[3], celloutsig_1_7z[1:0], celloutsig_1_8z[2:1], celloutsig_1_8z[1], celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_4z, celloutsig_1_11z } >= { celloutsig_1_5z[11:7], celloutsig_1_8z[2:1], celloutsig_1_8z[1], celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_4z };
  assign celloutsig_1_18z = { celloutsig_1_7z[3], celloutsig_1_12z, celloutsig_1_7z[5:3], celloutsig_1_7z[3], celloutsig_1_7z[1:0], celloutsig_1_12z } >= celloutsig_1_16z[17:9];
  assign celloutsig_0_11z = { in_data[83:77], celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_8z, celloutsig_0_9z } >= { _00_[2], _00_, celloutsig_0_1z, celloutsig_0_6z };
  assign celloutsig_0_27z = { celloutsig_0_12z[1], celloutsig_0_5z, celloutsig_0_8z, celloutsig_0_1z } >= { celloutsig_0_21z, celloutsig_0_14z };
  assign celloutsig_0_0z = in_data[13] & ~(in_data[85]);
  assign celloutsig_0_4z = celloutsig_0_2z & ~(celloutsig_0_1z);
  assign celloutsig_1_9z = celloutsig_1_6z[3] & ~(in_data[161]);
  assign celloutsig_0_6z = celloutsig_0_5z & ~(celloutsig_0_2z);
  assign celloutsig_0_10z = celloutsig_0_9z & ~(celloutsig_0_3z[1]);
  assign celloutsig_0_20z = _00_[5] & ~(celloutsig_0_5z);
  assign celloutsig_0_24z = celloutsig_0_0z & ~(celloutsig_0_18z);
  assign celloutsig_1_0z = in_data[119] & ~(in_data[141]);
  assign celloutsig_1_6z = { celloutsig_1_5z[9:4], celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_1z } % { 1'h1, in_data[124:117], celloutsig_1_2z, celloutsig_1_0z };
  assign celloutsig_1_16z = { in_data[158:156], celloutsig_1_4z, celloutsig_1_0z, celloutsig_1_14z, celloutsig_1_6z, celloutsig_1_9z, celloutsig_1_11z, celloutsig_1_15z } % { 1'h1, celloutsig_1_5z[5:0], celloutsig_1_1z, celloutsig_1_8z[2:1], celloutsig_1_8z[1], celloutsig_1_11z, celloutsig_1_2z, celloutsig_1_15z, celloutsig_1_7z[5:3], celloutsig_1_7z[3], celloutsig_1_7z[1:0] };
  assign celloutsig_1_10z = { celloutsig_1_8z[1], celloutsig_1_3z, celloutsig_1_3z } !== { celloutsig_1_7z[1:0], celloutsig_1_2z };
  assign celloutsig_0_13z = { in_data[83:78], celloutsig_0_1z, celloutsig_0_6z, celloutsig_0_4z, celloutsig_0_6z, celloutsig_0_8z } !== { celloutsig_0_0z, _00_, celloutsig_0_10z, celloutsig_0_5z };
  assign celloutsig_0_14z = { in_data[71:67], celloutsig_0_13z } !== { celloutsig_0_12z[4:2], celloutsig_0_0z, celloutsig_0_13z, celloutsig_0_5z };
  assign celloutsig_1_1z = in_data[159:151] !== { in_data[110:104], celloutsig_1_0z, celloutsig_1_0z };
  assign celloutsig_1_4z = in_data[191:182] !== in_data[164:155];
  assign celloutsig_1_19z = & { celloutsig_1_13z, celloutsig_1_9z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z, in_data[155:153] };
  assign celloutsig_0_9z = & { in_data[94:81], celloutsig_0_0z };
  assign celloutsig_0_1z = & { in_data[25:23], celloutsig_0_0z };
  assign celloutsig_0_2z = & in_data[49:44];
  assign celloutsig_1_3z = & { celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_0z, in_data[155:153] };
  assign celloutsig_0_5z = celloutsig_0_2z & celloutsig_0_3z[3];
  assign celloutsig_0_8z = celloutsig_0_1z & celloutsig_0_6z;
  assign celloutsig_0_18z = celloutsig_0_2z & in_data[47];
  assign celloutsig_0_26z = celloutsig_0_24z & _00_[7];
  assign celloutsig_1_2z = celloutsig_1_0z & celloutsig_1_1z;
  assign celloutsig_1_5z = { in_data[117:108], celloutsig_1_4z, celloutsig_1_4z } << in_data[165:154];
  assign celloutsig_1_13z = celloutsig_1_6z[10:6] ~^ { celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_2z };
  assign celloutsig_0_12z = { celloutsig_0_3z[3:0], celloutsig_0_4z, celloutsig_0_9z } ~^ celloutsig_0_3z;
  assign celloutsig_0_3z = in_data[65:60] ~^ in_data[79:74];
  assign { celloutsig_1_7z[3], celloutsig_1_7z[0], celloutsig_1_7z[1], celloutsig_1_7z[4], celloutsig_1_7z[5] } = { celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z, in_data[131] } ~^ { celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_1z };
  assign { celloutsig_1_8z[1], celloutsig_1_8z[2] } = { celloutsig_1_3z, in_data[114] } ~^ { celloutsig_1_7z[3], celloutsig_1_7z[4] };
  assign celloutsig_1_7z[2] = celloutsig_1_7z[3];
  assign celloutsig_1_8z[0] = celloutsig_1_8z[1];
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_26z, celloutsig_0_27z };
endmodule
