/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire [18:0] _04_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_18z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_2z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire celloutsig_0_5z;
  wire celloutsig_0_6z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_11z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_7z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [95:0] clkin_data;
  wire [95:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = !(in_data[62] ? in_data[51] : in_data[66]);
  assign celloutsig_1_7z = !(celloutsig_1_0z ? celloutsig_1_0z : celloutsig_1_0z);
  assign celloutsig_1_11z = !(celloutsig_1_8z ? celloutsig_1_7z : celloutsig_1_0z);
  assign celloutsig_0_3z = !(celloutsig_0_2z ? celloutsig_0_2z : celloutsig_0_2z);
  assign celloutsig_1_19z = !(celloutsig_1_2z ? celloutsig_1_11z : celloutsig_1_9z);
  assign celloutsig_0_5z = !(celloutsig_0_3z ? in_data[80] : _00_);
  assign celloutsig_0_7z = !(_02_ ? in_data[57] : _01_);
  assign celloutsig_0_10z = !(celloutsig_0_7z ? celloutsig_0_9z : celloutsig_0_6z);
  assign celloutsig_0_21z = !(_03_ ? celloutsig_0_20z : celloutsig_0_8z);
  assign celloutsig_1_1z = !(in_data[102] ? celloutsig_1_0z : celloutsig_1_0z);
  assign celloutsig_1_4z = !(celloutsig_1_0z ? celloutsig_1_2z : celloutsig_1_16z);
  assign celloutsig_1_5z = !(in_data[177] ? celloutsig_1_1z : in_data[110]);
  assign celloutsig_1_18z = celloutsig_1_8z ^ celloutsig_1_9z;
  assign celloutsig_0_4z = celloutsig_0_0z ^ celloutsig_0_2z;
  assign celloutsig_0_11z = celloutsig_0_3z ^ celloutsig_0_6z;
  assign celloutsig_0_13z = celloutsig_0_7z ^ celloutsig_0_0z;
  assign celloutsig_0_18z = celloutsig_0_0z ^ celloutsig_0_8z;
  assign celloutsig_1_2z = in_data[177] ^ celloutsig_1_1z;
  reg [18:0] _23_;
  always_ff @(posedge celloutsig_1_18z, posedge clkin_data[0])
    if (clkin_data[0]) _23_ <= 19'h00000;
    else _23_ <= { in_data[19:3], celloutsig_0_0z, celloutsig_0_0z };
  assign { _04_[18:17], _02_, _04_[15:13], _00_, _04_[11], _01_, _04_[9:7], _03_, _04_[5:0] } = _23_;
  assign celloutsig_0_2z = { in_data[13:4], celloutsig_0_0z } === { _02_, _04_[15:13], _00_, _04_[11], _01_, _04_[9:7], _03_ };
  assign celloutsig_1_8z = { in_data[136:130], celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_5z } === in_data[167:158];
  assign celloutsig_1_9z = { in_data[189:188], celloutsig_1_5z, celloutsig_1_4z } === in_data[168:165];
  assign celloutsig_0_8z = { in_data[81], celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_5z } === { celloutsig_0_5z, celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_7z };
  assign celloutsig_0_14z = { celloutsig_0_7z, celloutsig_0_13z, celloutsig_0_10z, celloutsig_0_10z, celloutsig_0_8z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_2z, celloutsig_0_0z, celloutsig_0_11z, celloutsig_0_10z } === { _04_[18:17], _02_, _04_[15:13], _00_, _04_[11], _01_, _04_[9:8] };
  assign celloutsig_0_20z = { celloutsig_0_11z, celloutsig_0_0z, celloutsig_0_18z, celloutsig_0_3z, celloutsig_0_11z } === { _04_[18:17], _02_, celloutsig_0_14z, celloutsig_0_14z };
  assign celloutsig_0_6z = celloutsig_0_4z & celloutsig_0_5z;
  assign celloutsig_0_9z = celloutsig_0_2z & celloutsig_0_0z;
  assign celloutsig_1_0z = in_data[107] & in_data[168];
  assign celloutsig_1_16z = celloutsig_1_1z & in_data[153];
  assign { _04_[16], _04_[12], _04_[10], _04_[6] } = { _02_, _00_, _01_, _03_ };
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_20z, celloutsig_0_21z };
endmodule
