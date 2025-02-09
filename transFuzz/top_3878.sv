/* Generated by Yosys 0.37+29 (git sha1 3c3788ee2, clang 10.0.0-4ubuntu1 -fPIC -Os) */

module top(clkin_data, in_data, out_data);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  reg [6:0] _08_;
  wire [5:0] _09_;
  wire [2:0] _10_;
  wire [7:0] _11_;
  reg [5:0] _12_;
  wire [2:0] _13_;
  wire [10:0] _14_;
  wire [3:0] _15_;
  wire [9:0] celloutsig_0_0z;
  wire celloutsig_0_10z;
  wire celloutsig_0_11z;
  wire [4:0] celloutsig_0_14z;
  wire [4:0] celloutsig_0_16z;
  wire celloutsig_0_17z;
  wire celloutsig_0_18z;
  wire celloutsig_0_19z;
  wire [42:0] celloutsig_0_1z;
  wire celloutsig_0_20z;
  wire celloutsig_0_21z;
  wire celloutsig_0_22z;
  wire celloutsig_0_26z;
  wire celloutsig_0_27z;
  wire celloutsig_0_28z;
  wire celloutsig_0_29z;
  wire celloutsig_0_2z;
  wire celloutsig_0_30z;
  wire celloutsig_0_31z;
  wire celloutsig_0_32z;
  wire [10:0] celloutsig_0_35z;
  wire celloutsig_0_36z;
  wire celloutsig_0_38z;
  wire celloutsig_0_39z;
  wire celloutsig_0_3z;
  wire celloutsig_0_40z;
  wire celloutsig_0_42z;
  wire celloutsig_0_43z;
  wire celloutsig_0_44z;
  wire celloutsig_0_4z;
  wire [7:0] celloutsig_0_53z;
  wire [2:0] celloutsig_0_55z;
  wire [18:0] celloutsig_0_56z;
  wire celloutsig_0_5z;
  wire celloutsig_0_69z;
  wire celloutsig_0_6z;
  wire celloutsig_0_71z;
  wire celloutsig_0_7z;
  wire celloutsig_0_85z;
  wire celloutsig_0_86z;
  wire [6:0] celloutsig_0_87z;
  wire celloutsig_0_8z;
  wire celloutsig_0_9z;
  wire [31:0] celloutsig_1_0z;
  wire celloutsig_1_10z;
  wire celloutsig_1_11z;
  wire celloutsig_1_12z;
  wire celloutsig_1_16z;
  wire celloutsig_1_18z;
  wire [10:0] celloutsig_1_19z;
  wire celloutsig_1_1z;
  wire celloutsig_1_2z;
  wire celloutsig_1_4z;
  wire celloutsig_1_5z;
  wire celloutsig_1_6z;
  wire celloutsig_1_7z;
  wire celloutsig_1_9z;
  input [191:0] clkin_data;
  wire [191:0] clkin_data;
  input [191:0] in_data;
  wire [191:0] in_data;
  output [191:0] out_data;
  wire [191:0] out_data;
  assign celloutsig_0_42z = ~(celloutsig_0_27z | celloutsig_0_27z);
  assign celloutsig_0_71z = ~(1'h1 | celloutsig_0_16z[1]);
  assign celloutsig_0_8z = ~(in_data[32] | celloutsig_0_7z);
  assign celloutsig_0_10z = ~(celloutsig_0_0z[0] | celloutsig_0_0z[4]);
  assign celloutsig_1_10z = ~(celloutsig_1_4z | _00_);
  assign celloutsig_1_18z = ~(celloutsig_1_9z | _01_);
  assign celloutsig_0_19z = ~(celloutsig_0_18z | celloutsig_0_4z);
  assign celloutsig_0_21z = ~(celloutsig_0_5z | _02_);
  assign celloutsig_0_27z = ~(1'h1 | celloutsig_0_9z);
  assign celloutsig_0_28z = ~(celloutsig_0_4z | _02_);
  assign celloutsig_0_29z = ~(1'h1 | celloutsig_0_7z);
  assign celloutsig_0_38z = celloutsig_0_22z | _03_;
  assign celloutsig_0_39z = celloutsig_0_11z | celloutsig_0_21z;
  assign celloutsig_0_43z = celloutsig_0_42z | _04_;
  assign celloutsig_0_5z = in_data[62] | celloutsig_0_2z;
  assign celloutsig_0_86z = celloutsig_0_43z | celloutsig_0_36z;
  assign celloutsig_1_2z = in_data[144] | celloutsig_1_0z[9];
  assign celloutsig_1_4z = celloutsig_1_0z[13] | _05_;
  assign celloutsig_1_12z = celloutsig_1_7z | celloutsig_1_5z;
  assign celloutsig_1_16z = celloutsig_1_9z | _06_;
  assign celloutsig_0_17z = _07_ | celloutsig_0_14z[2];
  assign celloutsig_0_31z = _02_ | celloutsig_0_2z;
  assign celloutsig_0_40z = ~(celloutsig_0_32z ^ celloutsig_0_26z);
  assign celloutsig_0_85z = ~(in_data[19] ^ celloutsig_0_71z);
  assign celloutsig_1_1z = ~(celloutsig_1_0z[13] ^ celloutsig_1_0z[24]);
  assign celloutsig_1_11z = ~(celloutsig_1_1z ^ celloutsig_1_5z);
  assign celloutsig_0_22z = ~(celloutsig_0_17z ^ celloutsig_0_2z);
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _08_ <= 7'h00;
    else _08_ <= { in_data[7:5], celloutsig_0_44z, celloutsig_0_30z, celloutsig_0_30z, celloutsig_0_39z };
  reg [5:0] _44_;
  always_ff @(posedge clkin_data[64], negedge clkin_data[128])
    if (!clkin_data[128]) _44_ <= 6'h00;
    else _44_ <= in_data[151:146];
  assign { _09_[5:1], _05_ } = _44_;
  reg [2:0] _45_;
  always_ff @(negedge clkin_data[64], negedge clkin_data[160])
    if (!clkin_data[160]) _45_ <= 3'h0;
    else _45_ <= { _09_[5:4], celloutsig_1_7z };
  assign { _01_, _00_, _10_[0] } = _45_;
  reg [7:0] _46_;
  always_ff @(negedge clkin_data[32], posedge clkin_data[128])
    if (clkin_data[128]) _46_ <= 8'h00;
    else _46_ <= { celloutsig_1_0z[17:11], celloutsig_1_9z };
  assign { _06_, _11_[6:0] } = _46_;
  always_ff @(negedge clkin_data[64], posedge clkin_data[128])
    if (clkin_data[128]) _12_ <= 6'h00;
    else _12_ <= { _06_, _11_[6:2] };
  reg [2:0] _48_;
  always_ff @(negedge clkin_data[0], negedge clkin_data[96])
    if (!clkin_data[96]) _48_ <= 3'h0;
    else _48_ <= { celloutsig_0_7z, celloutsig_0_6z, celloutsig_0_3z };
  assign { _02_, _13_[1:0] } = _48_;
  reg [10:0] _49_;
  always_ff @(negedge celloutsig_1_19z[0], posedge clkin_data[96])
    if (clkin_data[96]) _49_ <= 11'h000;
    else _49_ <= { celloutsig_0_1z[20:12], celloutsig_0_4z, celloutsig_0_4z };
  assign { _14_[10], _04_, _14_[8:2], _07_, _14_[0] } = _49_;
  reg [3:0] _50_;
  always_ff @(posedge clkin_data[0], posedge clkin_data[96])
    if (clkin_data[96]) _50_ <= 4'h0;
    else _50_ <= { celloutsig_0_7z, celloutsig_0_9z, celloutsig_0_7z, celloutsig_0_11z };
  assign { _15_[3], _03_, celloutsig_0_56z[13], _15_[0] } = _50_;
  assign celloutsig_0_44z = { celloutsig_0_16z[4:2], celloutsig_0_31z, celloutsig_0_20z, celloutsig_0_20z, _14_[10], _04_, _14_[8:2], _07_, _14_[0], celloutsig_0_8z, celloutsig_0_32z, celloutsig_0_40z, celloutsig_0_10z, celloutsig_0_4z } > { celloutsig_0_0z[2:1], celloutsig_0_38z, _14_[10], _04_, _14_[8:2], _07_, _14_[0], celloutsig_0_26z, celloutsig_0_18z, celloutsig_0_39z, 1'h1, celloutsig_0_5z, celloutsig_0_3z, 1'h1, celloutsig_0_38z };
  assign celloutsig_0_6z = { celloutsig_0_0z[6:5], celloutsig_0_5z, celloutsig_0_5z } > { celloutsig_0_1z[3], celloutsig_0_2z, celloutsig_0_3z, celloutsig_0_2z };
  assign celloutsig_0_20z = { in_data[81:76], celloutsig_0_7z, celloutsig_0_3z, _02_, _13_[1:0], celloutsig_0_10z } > { in_data[39:29], celloutsig_0_2z };
  assign celloutsig_0_2z = celloutsig_0_0z[6:3] > celloutsig_0_0z[8:5];
  assign celloutsig_0_3z = in_data[11:9] <= { celloutsig_0_0z[4:3], celloutsig_0_2z };
  assign celloutsig_0_36z = { celloutsig_0_14z[4:2], celloutsig_0_28z } <= { celloutsig_0_17z, celloutsig_0_20z, celloutsig_0_22z, celloutsig_0_4z };
  assign celloutsig_0_9z = { celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_2z, celloutsig_0_4z, celloutsig_0_4z, celloutsig_0_7z, celloutsig_0_3z, celloutsig_0_4z, celloutsig_0_6z } <= in_data[20:12];
  assign celloutsig_1_6z = { in_data[141:132], celloutsig_1_1z } <= { in_data[143:140], celloutsig_1_5z, _09_[5:1], _05_ };
  assign celloutsig_0_26z = { celloutsig_0_1z[39:10], 1'h1, celloutsig_0_9z, celloutsig_0_19z } <= celloutsig_0_1z[39:7];
  assign celloutsig_0_4z = ~^ celloutsig_0_1z[30:20];
  assign celloutsig_0_7z = ~^ { celloutsig_0_1z[35:30], celloutsig_0_6z, celloutsig_0_5z, celloutsig_0_5z };
  assign celloutsig_1_9z = ~^ { in_data[127:124], celloutsig_1_2z, celloutsig_1_1z, celloutsig_1_4z, celloutsig_1_7z };
  assign celloutsig_0_11z = ~^ { in_data[47:34], celloutsig_0_9z, celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_3z, celloutsig_0_9z };
  assign celloutsig_0_32z = ~^ { celloutsig_0_0z[9:1], celloutsig_0_11z, celloutsig_0_5z, celloutsig_0_27z, celloutsig_0_11z, celloutsig_0_11z };
  assign celloutsig_0_69z = ^ { celloutsig_0_56z[8], 6'h3f, celloutsig_0_53z[1:0], celloutsig_0_18z };
  assign celloutsig_1_5z = ^ { in_data[184:180], celloutsig_1_4z, celloutsig_1_2z, celloutsig_1_2z, celloutsig_1_4z, celloutsig_1_1z, celloutsig_1_2z };
  assign celloutsig_1_7z = ^ { in_data[106:104], celloutsig_1_5z };
  assign celloutsig_0_18z = ^ { _04_, _14_[8:2], _07_, celloutsig_0_6z, celloutsig_0_11z };
  assign celloutsig_0_30z = ^ { celloutsig_0_19z, _14_[10], _04_, _14_[8:2], _07_, _14_[0], celloutsig_0_2z };
  assign celloutsig_0_0z = in_data[53:44] - in_data[70:61];
  assign celloutsig_1_0z = in_data[169:138] - in_data[167:136];
  assign celloutsig_0_14z = celloutsig_0_1z[36:32] - { celloutsig_0_9z, celloutsig_0_11z, celloutsig_0_10z, celloutsig_0_7z, celloutsig_0_11z };
  assign celloutsig_0_16z = { celloutsig_0_0z[4:1], celloutsig_0_4z } - { celloutsig_0_0z[3:0], celloutsig_0_2z };
  assign celloutsig_0_35z = { celloutsig_0_17z, celloutsig_0_11z, celloutsig_0_22z, celloutsig_0_9z, celloutsig_0_19z, celloutsig_0_11z, _15_[3], _03_, celloutsig_0_56z[13], _15_[0], celloutsig_0_31z } ~^ { in_data[45:36], celloutsig_0_29z };
  assign celloutsig_0_55z = { celloutsig_0_10z, celloutsig_0_6z, celloutsig_0_39z } ~^ celloutsig_0_14z[3:1];
  assign celloutsig_0_87z = { _04_, _14_[8:4], celloutsig_0_85z } ~^ { celloutsig_0_7z, celloutsig_0_69z, celloutsig_0_86z, celloutsig_0_18z, celloutsig_0_55z };
  assign celloutsig_1_19z = { _11_[3:0], celloutsig_1_6z, celloutsig_1_7z, celloutsig_1_10z, celloutsig_1_11z, celloutsig_1_11z, celloutsig_1_12z, celloutsig_1_7z } ~^ { _12_[5:2], celloutsig_1_16z, _09_[5:1], _05_ };
  assign celloutsig_0_1z = in_data[73:31] ~^ { in_data[91:59], celloutsig_0_0z };
  assign { celloutsig_0_53z[0], celloutsig_0_53z[1] } = { celloutsig_0_2z, celloutsig_0_0z[2] } ~^ { celloutsig_0_32z, celloutsig_0_6z };
  assign { celloutsig_0_56z[15:14], celloutsig_0_56z[8:6], celloutsig_0_56z[18], celloutsig_0_56z[5], celloutsig_0_56z[17], celloutsig_0_56z[4:2], celloutsig_0_56z[9], celloutsig_0_56z[1], celloutsig_0_56z[12], celloutsig_0_56z[0], celloutsig_0_56z[10], celloutsig_0_56z[11] } = { celloutsig_0_55z[1:0], _08_[6:4], _08_[4:3], _08_[3:0], celloutsig_0_44z, celloutsig_0_43z, celloutsig_0_30z, celloutsig_0_27z, celloutsig_0_19z, celloutsig_0_6z } ~^ { _15_[3], _03_, celloutsig_0_35z[8:6], celloutsig_0_6z, celloutsig_0_35z[5], celloutsig_0_22z, celloutsig_0_35z[4:2], celloutsig_0_35z[9], celloutsig_0_35z[1], _15_[0], celloutsig_0_35z[0], celloutsig_0_35z[10], celloutsig_0_9z };
  assign _09_[0] = _05_;
  assign _10_[2:1] = { _01_, _00_ };
  assign _11_[7] = _06_;
  assign _13_[2] = _02_;
  assign { _14_[9], _14_[1] } = { _04_, _07_ };
  assign _15_[2:1] = { _03_, celloutsig_0_56z[13] };
  assign celloutsig_0_53z[7:2] = 6'h3f;
  assign celloutsig_0_56z[16] = celloutsig_0_55z[2];
  assign { out_data[128], out_data[106:96], out_data[32], out_data[6:0] } = { celloutsig_1_18z, celloutsig_1_19z, celloutsig_0_86z, celloutsig_0_87z };
endmodule
