/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [6:0] _01_;
  wire [2:0] _02_;
  reg [3:0] _03_;
  wire celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_27z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire celloutsig_0_33z;
  wire celloutsig_0_36z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_41z;
  wire celloutsig_0_45z;
  wire celloutsig_0_49z;
  reg [5:0] celloutsig_0_4z;
  wire celloutsig_0_53z;
  wire celloutsig_0_5z;
  wire celloutsig_0_63z;
  wire celloutsig_0_6z;
  wire celloutsig_0_72z;
  wire celloutsig_0_78z;
  wire celloutsig_0_79z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire celloutsig_1_0z;
  wire celloutsig_1_15z;
  wire celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_8z;
  wire celloutsig_1_9z;
  input [127:0] clkin_data;
  wire [127:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_0z = ~(in_data[79] | in_data[25]);
  assign celloutsig_0_33z = ~(celloutsig_0_17z | celloutsig_0_30z);
  assign celloutsig_0_49z = ~(celloutsig_0_19z | celloutsig_0_30z);
  assign celloutsig_0_5z = ~(celloutsig_0_4z[0] | celloutsig_0_4z[5]);
  assign celloutsig_0_53z = ~(in_data[11] | celloutsig_0_45z);
  assign celloutsig_0_7z = ~(celloutsig_0_0z | celloutsig_0_3z);
  assign celloutsig_0_8z = ~(celloutsig_0_7z | celloutsig_0_1z);
  assign celloutsig_0_79z = ~(celloutsig_0_4z[0] | celloutsig_0_53z);
  assign celloutsig_1_1z = ~(in_data[121] | in_data[161]);
  assign celloutsig_1_6z = ~(celloutsig_1_5z | celloutsig_1_3z);
  assign celloutsig_1_15z = ~(celloutsig_1_0z | celloutsig_1_5z);
  assign celloutsig_1_18z = ~(celloutsig_1_5z | celloutsig_1_15z);
  assign celloutsig_1_19z = ~(celloutsig_1_8z | celloutsig_1_9z);
  assign celloutsig_0_1z = ~(celloutsig_0_0z | celloutsig_0_0z);
  assign celloutsig_0_15z = ~(celloutsig_0_5z | celloutsig_0_6z);
  assign celloutsig_0_19z = ~(_00_ | celloutsig_0_11z);
  assign celloutsig_0_20z = ~(celloutsig_0_18z | celloutsig_0_4z[4]);
  assign celloutsig_0_21z = ~(celloutsig_0_7z | celloutsig_0_17z);
  always_ff @(posedge clkin_data[96], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _01_ <= 7'h00;
    else _01_ <= { celloutsig_0_4z, celloutsig_0_1z };
  reg [2:0] _23_;
  always_ff @(posedge clkin_data[96], negedge celloutsig_1_19z)
    if (!celloutsig_1_19z) _23_ <= 3'h0;
    else _23_ <= { _01_[3], celloutsig_0_5z, celloutsig_0_6z };
  assign { _02_[2:1], _00_ } = _23_;
  always_ff @(posedge clkin_data[96], posedge celloutsig_1_19z)
    if (celloutsig_1_19z) _03_ <= 4'h0;
    else _03_ <= { celloutsig_0_18z, celloutsig_0_6z, celloutsig_0_20z, celloutsig_0_21z };
  assign celloutsig_0_27z = ~((celloutsig_0_4z[5] & _00_) | celloutsig_0_11z);
  assign celloutsig_0_3z = ~((celloutsig_0_2z & celloutsig_0_2z) | celloutsig_0_2z);
  assign celloutsig_0_30z = ~((celloutsig_0_10z & celloutsig_0_27z) | _03_[1]);
  assign celloutsig_0_32z = ~((celloutsig_0_7z & celloutsig_0_18z) | celloutsig_0_21z);
  assign celloutsig_0_36z = ~((celloutsig_0_11z & _03_[0]) | celloutsig_0_21z);
  assign celloutsig_0_39z = ~((celloutsig_0_20z & celloutsig_0_30z) | celloutsig_0_15z);
  assign celloutsig_0_41z = ~((celloutsig_0_9z & celloutsig_0_33z) | celloutsig_0_7z);
  assign celloutsig_0_45z = ~((celloutsig_0_39z & celloutsig_0_41z) | celloutsig_0_30z);
  assign celloutsig_0_6z = ~((celloutsig_0_2z & celloutsig_0_4z[5]) | celloutsig_0_0z);
  assign celloutsig_0_63z = ~((celloutsig_0_22z & celloutsig_0_49z) | celloutsig_0_32z);
  assign celloutsig_0_72z = ~((celloutsig_0_36z & celloutsig_0_10z) | celloutsig_0_10z);
  assign celloutsig_0_78z = ~((celloutsig_0_36z & celloutsig_0_63z) | celloutsig_0_72z);
  assign celloutsig_1_0z = ~((in_data[159] & in_data[154]) | in_data[118]);
  assign celloutsig_1_2z = ~((celloutsig_1_1z & in_data[106]) | celloutsig_1_1z);
  assign celloutsig_1_3z = ~((celloutsig_1_2z & celloutsig_1_2z) | celloutsig_1_2z);
  assign celloutsig_1_4z = ~((celloutsig_1_2z & celloutsig_1_3z) | celloutsig_1_2z);
  assign celloutsig_1_5z = ~((celloutsig_1_1z & celloutsig_1_4z) | celloutsig_1_0z);
  assign celloutsig_0_9z = ~((celloutsig_0_0z & celloutsig_0_8z) | celloutsig_0_2z);
  assign celloutsig_1_8z = ~((celloutsig_1_6z & celloutsig_1_1z) | celloutsig_1_1z);
  assign celloutsig_1_9z = ~((celloutsig_1_8z & celloutsig_1_6z) | in_data[165]);
  assign celloutsig_0_10z = ~((celloutsig_0_2z & celloutsig_0_2z) | celloutsig_0_7z);
  assign celloutsig_0_11z = ~((celloutsig_0_3z & celloutsig_0_9z) | celloutsig_0_7z);
  assign celloutsig_0_12z = ~((celloutsig_0_1z & celloutsig_0_7z) | celloutsig_0_10z);
  assign celloutsig_0_14z = ~((celloutsig_0_5z & celloutsig_0_6z) | celloutsig_0_0z);
  assign celloutsig_0_17z = ~((in_data[19] & celloutsig_0_5z) | celloutsig_0_10z);
  assign celloutsig_0_18z = ~((celloutsig_0_15z & celloutsig_0_12z) | _01_[0]);
  assign celloutsig_0_2z = ~((in_data[59] & in_data[54]) | celloutsig_0_1z);
  assign celloutsig_0_22z = ~((celloutsig_0_2z & celloutsig_0_1z) | celloutsig_0_14z);
  always_latch
    if (celloutsig_1_19z) celloutsig_0_4z = 6'h00;
    else if (!clkin_data[0]) celloutsig_0_4z = { in_data[43], celloutsig_0_1z, celloutsig_0_0z, celloutsig_0_1z, celloutsig_0_3z, celloutsig_0_0z };
  assign _02_[0] = _00_;
  assign { out_data[128], out_data[96], out_data[32], out_data[0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_78z, celloutsig_0_79z };
endmodule
