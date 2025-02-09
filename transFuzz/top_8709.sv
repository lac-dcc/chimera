/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire [9:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_14z;
  wire celloutsig_1_15z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire [19:0] celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [7:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_3z = ~((in_data[172] | celloutsig_1_0z) & in_data[129]);
  assign celloutsig_1_5z = ~((celloutsig_1_0z | celloutsig_1_0z) & celloutsig_1_1z[0]);
  assign celloutsig_1_10z = ~((celloutsig_1_7z | celloutsig_1_7z) & in_data[179]);
  assign celloutsig_1_14z = ~((celloutsig_1_1z[3] | celloutsig_1_9z) & celloutsig_1_10z);
  assign celloutsig_1_17z = in_data[112] | ~(celloutsig_1_11z);
  assign celloutsig_0_3z = celloutsig_0_2z[9] | ~(celloutsig_0_0z);
  assign celloutsig_1_9z = celloutsig_1_8z[2] | ~(celloutsig_1_1z[8]);
  assign celloutsig_1_2z = in_data[190] | celloutsig_1_1z[3];
  reg [17:0] _08_;
  always_ff @(posedge celloutsig_1_19z, posedge clkin_data[0])
    if (clkin_data[0]) _08_ <= 18'h00000;
    else _08_ <= { in_data[59:43], celloutsig_0_0z };
  assign out_data[49:32] = _08_;
  assign celloutsig_1_19z = { in_data[157:147], celloutsig_1_14z, celloutsig_1_9z, celloutsig_1_17z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_14z, celloutsig_1_16z, celloutsig_1_11z, celloutsig_1_6z, celloutsig_1_2z } <= { in_data[145:143], celloutsig_1_1z };
  assign celloutsig_1_0z = in_data[145:135] || in_data[112:102];
  assign celloutsig_1_6z = in_data[146] & ~(celloutsig_1_5z);
  assign celloutsig_0_2z = in_data[59:50] % { 1'h1, in_data[57:49] };
  assign celloutsig_1_1z = { in_data[189:171], celloutsig_1_0z } * { in_data[132:114], celloutsig_1_0z };
  assign celloutsig_1_4z = { celloutsig_1_0z, celloutsig_1_1z } != { in_data[178:161], celloutsig_1_0z, celloutsig_1_0z, celloutsig_1_2z };
  assign celloutsig_1_15z = celloutsig_1_6z & in_data[114];
  assign celloutsig_1_7z = ^ in_data[176:167];
  assign celloutsig_1_8z = celloutsig_1_1z[16:9] >> { celloutsig_1_2z, celloutsig_1_7z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_4z, celloutsig_1_5z };
  assign celloutsig_0_0z = ~((in_data[48] & in_data[8]) | (in_data[3] & in_data[32]));
  assign celloutsig_1_18z = ~((celloutsig_1_16z & celloutsig_1_3z) | (in_data[163] & celloutsig_1_15z));
  assign celloutsig_0_10z = ~((in_data[34] & celloutsig_0_3z) | (out_data[39] & in_data[14]));
  assign celloutsig_1_11z = ~((celloutsig_1_1z[17] & celloutsig_1_8z[0]) | (celloutsig_1_10z & celloutsig_1_5z));
  assign celloutsig_1_16z = ~((celloutsig_1_6z & celloutsig_1_0z) | (celloutsig_1_11z & celloutsig_1_11z));
  assign { out_data[128], out_data[96], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_10z };
endmodule
