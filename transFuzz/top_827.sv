/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  reg [5:0] _00_;
  wire [15:0] celloutsig_0_0z;
  wire [14:0] celloutsig_0_2z;
  wire [2:0] celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire [6:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire [9:0] celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [5:0] celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_1z = ~(in_data[131] & celloutsig_1_0z);
  assign celloutsig_1_19z = ~(celloutsig_1_8z[5] | celloutsig_1_10z);
  assign celloutsig_0_5z = ~celloutsig_0_2z[1];
  assign celloutsig_1_6z = in_data[124] | celloutsig_1_3z[9];
  assign celloutsig_1_9z = celloutsig_1_6z | celloutsig_1_0z;
  always_ff @(negedge clkin_data[0], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _00_ <= 6'h00;
    else _00_ <= in_data[53:48];
  assign celloutsig_0_0z = in_data[53:38] & in_data[38:23];
  assign celloutsig_1_18z = { celloutsig_1_8z, celloutsig_1_1z } & celloutsig_1_3z[8:2];
  assign celloutsig_1_5z = celloutsig_1_3z && { in_data[107:100], celloutsig_1_4z, celloutsig_1_0z };
  assign celloutsig_1_7z = { in_data[159:155], celloutsig_1_1z } || { celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_4z, celloutsig_1_6z, celloutsig_1_2z, celloutsig_1_5z };
  assign celloutsig_0_2z = celloutsig_0_0z[15:1] % { 1'h1, in_data[27:14] };
  assign celloutsig_1_8z = { celloutsig_1_3z[8:5], celloutsig_1_2z, celloutsig_1_2z } % { 1'h1, in_data[107:103] };
  assign celloutsig_0_4z = _00_[5:3] * celloutsig_0_2z[6:4];
  assign celloutsig_1_10z = ~^ { in_data[117:97], celloutsig_1_9z, celloutsig_1_7z, celloutsig_1_6z, celloutsig_1_9z };
  assign celloutsig_1_3z = { in_data[160:154], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_1z } ~^ { in_data[142:134], celloutsig_1_2z };
  assign celloutsig_1_0z = ~((in_data[124] & in_data[131]) | in_data[164]);
  assign celloutsig_1_2z = ~((celloutsig_1_0z & celloutsig_1_1z) | celloutsig_1_0z);
  assign celloutsig_1_4z = ~((celloutsig_1_3z[1] & in_data[139]) | celloutsig_1_3z[5]);
  assign { out_data[134:128], out_data[96], out_data[34:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_4z, celloutsig_0_5z };
endmodule
