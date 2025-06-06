/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire [3:0] _01_;
  wire celloutsig_0_0z;
  wire [15:0] celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [5:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire [5:0] celloutsig_1_0z;
  wire [5:0] celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_14z;
  wire celloutsig_1_16z;
  wire celloutsig_1_17z;
  wire celloutsig_1_18z;
  wire [8:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire [5:0] celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire [5:0] celloutsig_1_8z;
  wire [4:0] celloutsig_1_9z;
  input [31:0] clkin_data;
  wire [31:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_3z = in_data[2] ? _00_ : in_data[17];
  assign celloutsig_0_4z = _00_ ? celloutsig_0_2z[7] : in_data[13];
  assign celloutsig_1_17z = celloutsig_1_10z[3] ? celloutsig_1_10z[5] : celloutsig_1_3z;
  assign celloutsig_1_3z = !(celloutsig_1_1z ? celloutsig_1_1z : celloutsig_1_0z[5]);
  assign celloutsig_0_0z = ~(in_data[14] | in_data[13]);
  assign celloutsig_1_1z = ~(in_data[156] | celloutsig_1_0z[1]);
  assign celloutsig_1_16z = ~(celloutsig_1_14z | celloutsig_1_11z);
  assign celloutsig_1_7z = ~((in_data[138] | celloutsig_1_0z[5]) & celloutsig_1_2z);
  reg [3:0] _10_;
  always_ff @(posedge celloutsig_1_19z[0], posedge clkin_data[0])
    if (clkin_data[0]) _10_ <= 4'h0;
    else _10_ <= in_data[36:33];
  assign { _01_[3], _00_, _01_[1:0] } = _10_;
  assign celloutsig_1_4z = { celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_2z, celloutsig_1_2z } / { 1'h1, in_data[133:130], in_data[96] };
  assign celloutsig_0_6z = celloutsig_0_2z[11:6] || { celloutsig_0_5z[5:1], celloutsig_0_3z };
  assign celloutsig_1_2z = { celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_1z } || { in_data[171:169], celloutsig_1_1z, celloutsig_1_0z };
  assign celloutsig_0_5z = - { in_data[25:21], celloutsig_0_4z };
  assign celloutsig_1_0z = - in_data[135:130];
  assign celloutsig_1_8z = - { celloutsig_1_4z[4:2], celloutsig_1_6z, celloutsig_1_1z, celloutsig_1_5z };
  assign celloutsig_1_6z = ~^ { in_data[175:165], celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_5z, celloutsig_1_0z };
  assign celloutsig_1_11z = ~^ { celloutsig_1_0z[4:1], celloutsig_1_6z };
  assign celloutsig_1_14z = ~^ celloutsig_1_10z[5:1];
  assign celloutsig_1_18z = ~^ { celloutsig_1_8z[4:0], celloutsig_1_5z, celloutsig_1_9z };
  assign celloutsig_1_5z = ^ { celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_3z, celloutsig_1_3z, celloutsig_1_1z, celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_3z };
  assign celloutsig_1_9z = { celloutsig_1_0z[3:0], celloutsig_1_5z } <<< { celloutsig_1_8z[4:1], celloutsig_1_7z };
  assign celloutsig_0_2z = { in_data[47:46], celloutsig_0_0z, celloutsig_0_0z, _01_[3], _00_, _01_[1:0], _01_[3], _00_, _01_[1:0], _01_[3], _00_, _01_[1:0] } <<< { in_data[88:75], celloutsig_0_0z, celloutsig_0_0z };
  assign celloutsig_1_10z = { celloutsig_1_9z, celloutsig_1_2z } ~^ celloutsig_1_8z;
  assign celloutsig_1_19z = in_data[138:130] ~^ { celloutsig_1_10z[1], celloutsig_1_11z, celloutsig_1_17z, celloutsig_1_18z, celloutsig_1_3z, celloutsig_1_11z, celloutsig_1_16z, celloutsig_1_3z, celloutsig_1_14z };
  assign _01_[2] = _00_;
  assign { out_data[128], out_data[104:96], out_data[37:32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_5z, celloutsig_0_6z };
endmodule
