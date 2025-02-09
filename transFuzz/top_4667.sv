/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  reg [2:0] _01_;
  reg [5:0] _02_;
  wire [6:0] _03_;
  reg [13:0] _04_;
  wire [13:0] celloutsig_0_0z;
  wire [14:0] celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire celloutsig_0_12z;
  wire celloutsig_0_13z;
  wire celloutsig_0_14z;
  wire celloutsig_0_15z;
  wire celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire [8:0] celloutsig_0_19z;
  wire celloutsig_0_1z;
  wire [12:0] celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire [38:0] celloutsig_0_23z;
  wire [3:0] celloutsig_0_24z;
  wire [5:0] celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_2z;
  wire [5:0] celloutsig_0_30z;
  wire celloutsig_0_32z;
  wire celloutsig_0_34z;
  wire celloutsig_0_3z;
  wire celloutsig_0_4z;
  wire [3:0] celloutsig_0_5z;
  wire celloutsig_0_6z;
  reg [6:0] celloutsig_0_71z;
  wire celloutsig_0_7z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [5:0] celloutsig_1_0z;
  wire [20:0] celloutsig_1_10z;
  wire celloutsig_1_15z;
  wire celloutsig_1_17z;
  wire [2:0] celloutsig_1_18z;
  wire celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_3z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire [4:0] celloutsig_1_6z;
  wire [3:0] celloutsig_1_8z;
  wire [12:0] celloutsig_1_9z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_1_2z = ~(in_data[168] | in_data[128]);
  assign celloutsig_0_8z = ~(celloutsig_0_0z[2] | celloutsig_0_1z);
  assign celloutsig_1_15z = ~(celloutsig_1_10z[13] | _00_);
  assign celloutsig_0_18z = ~(celloutsig_0_0z[1] | celloutsig_0_17z);
  always_ff @(posedge celloutsig_1_18z[0], negedge clkin_data[64])
    if (!clkin_data[64]) _02_ <= 6'h00;
    else _02_ <= { in_data[70:66], celloutsig_0_28z };
  reg [8:0] _10_;
  always_ff @(negedge celloutsig_1_18z[0], posedge clkin_data[64])
    if (clkin_data[64]) _10_ <= 9'h000;
    else _10_ <= { celloutsig_0_71z[4:0], celloutsig_0_5z };
  assign out_data[8:0] = _10_;
  reg [6:0] _11_;
  always_ff @(posedge clkin_data[128], negedge clkin_data[96])
    if (!clkin_data[96]) _11_ <= 7'h00;
    else _11_ <= in_data[167:161];
  assign { _03_[6:1], _00_ } = _11_;
  always_ff @(posedge clkin_data[160], negedge clkin_data[96])
    if (!clkin_data[96]) _04_ <= 14'h0000;
    else _04_ <= celloutsig_1_10z[16:3];
  always_ff @(posedge celloutsig_1_18z[0], posedge clkin_data[64])
    if (clkin_data[64]) _01_ <= 3'h0;
    else _01_ <= { celloutsig_0_30z[2], celloutsig_0_34z, celloutsig_0_9z };
  assign celloutsig_0_0z = in_data[43:30] & in_data[29:16];
  assign celloutsig_0_5z = in_data[24:21] & { celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_1_10z = { celloutsig_1_8z[1:0], celloutsig_1_6z, _03_[6:1], _00_, _03_[6:1], _00_ } & { celloutsig_1_0z[3:1], celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_5z, celloutsig_1_0z, celloutsig_1_1z, celloutsig_1_2z, celloutsig_1_8z, celloutsig_1_3z };
  assign celloutsig_0_27z = in_data[79:74] & { celloutsig_0_20z[7:3], celloutsig_0_18z };
  assign celloutsig_0_6z = celloutsig_0_0z[10:1] == { in_data[90:83], celloutsig_0_1z, celloutsig_0_1z };
  assign celloutsig_1_1z = in_data[189:183] == { celloutsig_1_0z[4], celloutsig_1_0z };
  assign celloutsig_1_3z = { in_data[127:125], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_2z } == in_data[169:164];
  assign celloutsig_0_11z = { celloutsig_0_1z, celloutsig_0_8z, celloutsig_0_1z } == { celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_7z };
  assign celloutsig_0_12z = { celloutsig_0_10z[14], celloutsig_0_10z[12:9], celloutsig_0_10z[9], celloutsig_0_10z[7:5] } == { celloutsig_0_10z[9], celloutsig_0_10z[7:5], celloutsig_0_10z[6], celloutsig_0_10z[3], celloutsig_0_10z[9], celloutsig_0_10z[7], celloutsig_0_10z[9] };
  assign celloutsig_0_13z = { celloutsig_0_4z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_11z } == { celloutsig_0_10z[3], celloutsig_0_10z[9], celloutsig_0_10z[7], celloutsig_0_12z };
  assign celloutsig_0_15z = { in_data[92:87], celloutsig_0_2z, celloutsig_0_12z, celloutsig_0_14z } == { in_data[79:76], celloutsig_0_5z, celloutsig_0_8z };
  assign celloutsig_0_16z = { celloutsig_0_8z, celloutsig_0_8z, celloutsig_0_8z } == { celloutsig_0_10z[9], celloutsig_0_13z, celloutsig_0_1z };
  assign celloutsig_0_17z = { in_data[36:33], celloutsig_0_14z } == { in_data[69], celloutsig_0_14z, celloutsig_0_16z, celloutsig_0_2z, celloutsig_0_9z };
  assign celloutsig_0_21z = { celloutsig_0_5z, celloutsig_0_6z, celloutsig_0_13z } == { celloutsig_0_11z, celloutsig_0_17z, celloutsig_0_13z, celloutsig_0_11z, celloutsig_0_18z, celloutsig_0_6z };
  assign celloutsig_0_2z = celloutsig_0_0z[9:7] == celloutsig_0_0z[11:9];
  assign celloutsig_0_28z = celloutsig_0_23z[32:29] == { celloutsig_0_11z, celloutsig_0_2z, celloutsig_0_1z, celloutsig_0_21z };
  assign celloutsig_0_3z = celloutsig_0_0z[13:9] == { in_data[38:35], celloutsig_0_1z };
  assign celloutsig_0_34z = { celloutsig_0_27z[1:0], celloutsig_0_32z, celloutsig_0_8z, celloutsig_0_11z } == celloutsig_0_0z[12:8];
  assign celloutsig_1_0z = - in_data[170:165];
  assign celloutsig_1_6z = - celloutsig_1_0z[5:1];
  assign celloutsig_1_8z = - { celloutsig_1_3z, celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_1_9z = - { celloutsig_1_6z[4:1], _03_[6:1], _00_, celloutsig_1_2z, celloutsig_1_4z };
  assign celloutsig_0_20z = - { celloutsig_0_15z, celloutsig_0_2z, celloutsig_0_16z, celloutsig_0_15z, celloutsig_0_17z, celloutsig_0_3z, celloutsig_0_12z, celloutsig_0_6z, celloutsig_0_16z, celloutsig_0_4z, celloutsig_0_1z, celloutsig_0_12z, celloutsig_0_4z };
  assign celloutsig_0_30z = - celloutsig_0_27z;
  assign celloutsig_1_18z = ~ { _04_[7], celloutsig_1_15z, celloutsig_1_3z };
  assign celloutsig_0_19z = ~ { celloutsig_0_8z, celloutsig_0_13z, celloutsig_0_12z, celloutsig_0_5z, celloutsig_0_17z, celloutsig_0_3z };
  assign celloutsig_0_23z = ~ { in_data[48:15], celloutsig_0_5z, celloutsig_0_12z };
  assign celloutsig_0_24z = ~ { celloutsig_0_23z[20:18], celloutsig_0_14z };
  assign celloutsig_0_4z = | { in_data[23:22], celloutsig_0_2z };
  assign celloutsig_1_4z = | { in_data[189:187], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_2z };
  assign celloutsig_0_9z = | { celloutsig_0_7z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_3z };
  assign celloutsig_0_14z = | { in_data[74:59], celloutsig_0_2z, celloutsig_0_8z, celloutsig_0_1z, celloutsig_0_3z };
  assign celloutsig_0_7z = ^ { in_data[86:67], celloutsig_0_0z, celloutsig_0_3z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_6z, celloutsig_0_3z };
  assign celloutsig_1_5z = ^ { in_data[138:108], celloutsig_1_1z, celloutsig_1_0z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_2z };
  assign celloutsig_1_17z = ^ celloutsig_1_9z;
  assign celloutsig_1_19z = ^ { celloutsig_1_15z, celloutsig_1_4z, _04_, celloutsig_1_17z, celloutsig_1_5z };
  assign celloutsig_0_1z = ^ in_data[77:54];
  assign celloutsig_0_32z = ^ { celloutsig_0_10z[12:9], celloutsig_0_10z[9], celloutsig_0_10z[7:5], celloutsig_0_10z[6], celloutsig_0_10z[3], celloutsig_0_10z[9], celloutsig_0_10z[7], celloutsig_0_3z, celloutsig_0_19z, celloutsig_0_24z, celloutsig_0_21z };
  always_latch
    if (!clkin_data[32]) celloutsig_0_71z = 7'h00;
    else if (!clkin_data[0]) celloutsig_0_71z = { _02_[4:1], _01_ };
  assign { celloutsig_0_10z[7], celloutsig_0_10z[14], celloutsig_0_10z[12:10], celloutsig_0_10z[3], celloutsig_0_10z[5], celloutsig_0_10z[9], celloutsig_0_10z[6] } = ~ { celloutsig_0_9z, celloutsig_0_5z, celloutsig_0_4z, celloutsig_0_3z, celloutsig_0_2z, celloutsig_0_1z };
  assign _03_[0] = _00_;
  assign { celloutsig_0_10z[13], celloutsig_0_10z[8], celloutsig_0_10z[4], celloutsig_0_10z[2:0] } = { celloutsig_0_10z[14], celloutsig_0_10z[9], celloutsig_0_10z[6], celloutsig_0_10z[9], celloutsig_0_10z[7], celloutsig_0_10z[9] };
  assign { out_data[130:128], out_data[96], out_data[38:32] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_71z };
endmodule
