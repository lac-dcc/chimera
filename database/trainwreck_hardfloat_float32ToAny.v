module normalize32_0(
    input [31:0] in,
    output[31:0] out,
    output[4:0] distance);

  wire[15:0] T0;
  wire[0:0] dist_4;
  wire[31:0] T1;
  wire[31:0] norm_16;
  wire[7:0] T2;
  wire[0:0] dist_3;
  wire[1:0] T3;
  wire[31:0] T4;
  wire[31:0] norm_8;
  wire[3:0] T5;
  wire[0:0] dist_2;
  wire[2:0] T6;
  wire[31:0] T7;
  wire[31:0] norm_4;
  wire[1:0] T8;
  wire[0:0] dist_1;
  wire[3:0] T9;
  wire[31:0] T10;
  wire[31:0] norm_2;
  wire[0:0] T11;
  wire[0:0] dist_0;
  wire[4:0] T12;
  wire[31:0] T13;
  wire[31:0] T14;

  assign T0 = in[5'h1f:5'h10];
  assign dist_4 = T0 == 16'h0;
  assign T1 = in << 5'h10;
  assign norm_16 = dist_4 ? T1 : in;
  assign T2 = norm_16[5'h1f:5'h18];
  assign dist_3 = T2 == 8'h0;
  assign T3 = {dist_4, dist_3};
  assign T4 = norm_16 << 4'h8;
  assign norm_8 = dist_3 ? T4 : norm_16;
  assign T5 = norm_8[5'h1f:5'h1c];
  assign dist_2 = T5 == 4'h0;
  assign T6 = {T3, dist_2};
  assign T7 = norm_8 << 3'h4;
  assign norm_4 = dist_2 ? T7 : norm_8;
  assign T8 = norm_4[5'h1f:5'h1e];
  assign dist_1 = T8 == 2'h0;
  assign T9 = {T6, dist_1};
  assign T10 = norm_4 << 2'h2;
  assign norm_2 = dist_1 ? T10 : norm_4;
  assign T11 = norm_2[5'h1f];
  assign dist_0 = T11 == 1'h0;
  assign T12 = {T9, dist_0};
  assign distance = T12;
  assign T13 = norm_2 << 1'h1;
  assign T14 = dist_0 ? T13 : norm_2;
  assign out = T14;
endmodule

module float32ToRecodedFloat32(
    input [31:0] in,
    output[32:0] out);

  wire[0:0] sign;
  wire[7:0] expIn;
  wire[0:0] isZeroExpIn;
  wire[22:0] fractIn;
  wire[0:0] isZeroFractIn;
  wire[0:0] T2;
  wire[0:0] isSubnormal;
  wire[31:0] norm_in;
  wire[4:0] distance_0;
  wire[4:0] T3;
  wire[8:0] T4;
  wire[8:0] T5;
  wire[0:0] isNormalOrSpecial;
  wire[8:0] T6;
  wire[8:0] commonExp;
  wire[0:0] isZero;
  wire[8:0] expAdjust;
  wire[8:0] T7;
  wire[8:0] adjustedCommonExp;
  wire[1:0] T8;
  wire[0:0] T9;
  wire[0:0] T10;
  wire[0:0] isNaN;
  wire[6:0] T11;
  wire[6:0] T12;
  wire[8:0] expOut;
  wire[9:0] T13;
  wire[31:0] out_1;
  wire[22:0] normalizedFract;
  wire[22:0] fractOut;
  wire[32:0] T14;

  assign sign = in[5'h1f];
  assign expIn = in[5'h1e:5'h17];
  assign isZeroExpIn = expIn == 9'h0;
  assign fractIn = in[5'h16:1'h0];
  assign isZeroFractIn = fractIn == 23'h0;
  assign T2 = ~ isZeroFractIn;
  assign isSubnormal = isZeroExpIn & T2;
  assign norm_in = {fractIn, 9'h0};
  assign T3 = ~ distance_0;
  assign T4 = {4'b1111, T3};
  assign T5 = isSubnormal ? T4 : 9'h0;
  assign isNormalOrSpecial = ~ isZeroExpIn;
  assign T6 = isNormalOrSpecial ? expIn : 9'h0;
  assign commonExp = T5 | T6;
  assign isZero = isZeroExpIn & isZeroFractIn;
  assign expAdjust = isZero ? 9'h0 : 9'b010000001;
  assign T7 = commonExp + expAdjust;
  assign adjustedCommonExp = T7 + isSubnormal;
  assign T8 = adjustedCommonExp[4'h8:3'h7];
  assign T9 = T8 == 2'b11;
  assign T10 = ~ isZeroFractIn;
  assign isNaN = T9 & T10;
  assign T11 = isNaN[3'h6:1'h0];
  assign T12 = T11 << 3'h6;
  assign expOut = adjustedCommonExp | T12;
  assign T13 = {sign, expOut};
  assign normalizedFract = out_1[5'h1e:4'h8];
  assign fractOut = isZeroExpIn ? normalizedFract : fractIn;
  assign T14 = {T13, fractOut};
  assign out = T14;
  normalize32_0 normalize32_0(
       .in( norm_in ),
       .out( out_1 ),
       .distance( distance_0 ));
endmodule

module shift_right_track_lsbs_0(
    input [64:0] in,
    output[0:0] out_lsb,
    input [0:0] in_lsb,
    output[64:0] out,
    input [0:0] do_shift);

  wire[0:0] T0;
  wire[63:0] T1;
  wire[64:0] T2;
  wire[64:0] T3;
  wire[0:0] T4;
  wire[0:0] T5;
  wire[0:0] T6;
  wire[0:0] T7;

  assign T0 = {1'h1{1'h0}};
  assign T1 = in[7'h40:1'h1];
  assign T2 = {T0, T1};
  assign T3 = do_shift ? T2 : in;
  assign out = T3;
  assign T4 = in[1'h0:1'h0];
  assign T5 = T4 != 1'h0;
  assign T6 = in_lsb || T5;
  assign T7 = do_shift ? T6 : in_lsb;
  assign out_lsb = T7;
endmodule

module shift_right_track_lsbs_1(
    input [64:0] in,
    output[0:0] out_lsb,
    input [0:0] in_lsb,
    output[64:0] out,
    input [0:0] do_shift);

  wire[1:0] T0;
  wire[62:0] T1;
  wire[64:0] T2;
  wire[64:0] T3;
  wire[1:0] T4;
  wire[0:0] T5;
  wire[0:0] T6;
  wire[0:0] T7;

  assign T0 = {2'h2{1'h0}};
  assign T1 = in[7'h40:2'h2];
  assign T2 = {T0, T1};
  assign T3 = do_shift ? T2 : in;
  assign out = T3;
  assign T4 = in[1'h1:1'h0];
  assign T5 = T4 != 2'h0;
  assign T6 = in_lsb || T5;
  assign T7 = do_shift ? T6 : in_lsb;
  assign out_lsb = T7;
endmodule

module shift_right_track_lsbs_2(
    input [64:0] in,
    output[0:0] out_lsb,
    input [0:0] in_lsb,
    output[64:0] out,
    input [0:0] do_shift);

  wire[3:0] T0;
  wire[60:0] T1;
  wire[64:0] T2;
  wire[64:0] T3;
  wire[3:0] T4;
  wire[0:0] T5;
  wire[0:0] T6;
  wire[0:0] T7;

  assign T0 = {3'h4{1'h0}};
  assign T1 = in[7'h40:3'h4];
  assign T2 = {T0, T1};
  assign T3 = do_shift ? T2 : in;
  assign out = T3;
  assign T4 = in[2'h3:1'h0];
  assign T5 = T4 != 4'h0;
  assign T6 = in_lsb || T5;
  assign T7 = do_shift ? T6 : in_lsb;
  assign out_lsb = T7;
endmodule

module shift_right_track_lsbs_3(
    input [64:0] in,
    output[0:0] out_lsb,
    input [0:0] in_lsb,
    output[64:0] out,
    input [0:0] do_shift);

  wire[7:0] T0;
  wire[56:0] T1;
  wire[64:0] T2;
  wire[64:0] T3;
  wire[7:0] T4;
  wire[0:0] T5;
  wire[0:0] T6;
  wire[0:0] T7;

  assign T0 = {4'h8{1'h0}};
  assign T1 = in[7'h40:4'h8];
  assign T2 = {T0, T1};
  assign T3 = do_shift ? T2 : in;
  assign out = T3;
  assign T4 = in[3'h7:1'h0];
  assign T5 = T4 != 8'h0;
  assign T6 = in_lsb || T5;
  assign T7 = do_shift ? T6 : in_lsb;
  assign out_lsb = T7;
endmodule

module shift_right_track_lsbs_4(
    input [64:0] in,
    output[0:0] out_lsb,
    input [0:0] in_lsb,
    output[64:0] out,
    input [0:0] do_shift);

  wire[15:0] T0;
  wire[48:0] T1;
  wire[64:0] T2;
  wire[64:0] T3;
  wire[15:0] T4;
  wire[0:0] T5;
  wire[0:0] T6;
  wire[0:0] T7;

  assign T0 = {5'h10{1'h0}};
  assign T1 = in[7'h40:5'h10];
  assign T2 = {T0, T1};
  assign T3 = do_shift ? T2 : in;
  assign out = T3;
  assign T4 = in[4'hf:1'h0];
  assign T5 = T4 != 16'h0;
  assign T6 = in_lsb || T5;
  assign T7 = do_shift ? T6 : in_lsb;
  assign out_lsb = T7;
endmodule

module shift_right_track_lsbs_5(
    input [64:0] in,
    output[0:0] out_lsb,
    input [0:0] in_lsb,
    output[64:0] out,
    input [0:0] do_shift);

  wire[31:0] T0;
  wire[32:0] T1;
  wire[64:0] T2;
  wire[64:0] T3;
  wire[31:0] T4;
  wire[0:0] T5;
  wire[0:0] T6;
  wire[0:0] T7;

  assign T0 = {6'h20{1'h0}};
  assign T1 = in[7'h40:6'h20];
  assign T2 = {T0, T1};
  assign T3 = do_shift ? T2 : in;
  assign out = T3;
  assign T4 = in[5'h1f:1'h0];
  assign T5 = T4 != 32'h0;
  assign T6 = in_lsb || T5;
  assign T7 = do_shift ? T6 : in_lsb;
  assign out_lsb = T7;
endmodule

module shift_right_track_lsbs_6(
    input [64:0] in,
    output[0:0] out_lsb,
    input [0:0] in_lsb,
    output[64:0] out,
    input [0:0] do_shift);

  wire[63:0] T0;
  wire[0:0] T1;
  wire[64:0] T2;
  wire[64:0] T3;
  wire[63:0] T4;
  wire[0:0] T5;
  wire[0:0] T6;
  wire[0:0] T7;

  assign T0 = {7'h40{1'h0}};
  assign T1 = in[7'h40:7'h40];
  assign T2 = {T0, T1};
  assign T3 = do_shift ? T2 : in;
  assign out = T3;
  assign T4 = in[6'h3f:1'h0];
  assign T5 = T4 != 64'h0;
  assign T6 = in_lsb || T5;
  assign T7 = do_shift ? T6 : in_lsb;
  assign out_lsb = T7;
endmodule

module recodedFloat32ToAny(
    output[4:0] exceptionFlags,
    input [32:0] in,
    output[63:0] out,
    input [1:0] typeOp,
    input [1:0] roundingMode);

  wire[0:0] T14;
  wire[8:0] exponent;
  wire[2:0] T15;
  wire[0:0] T16;
  wire[8:0] T17;
  wire[0:0] isZeroOrOne;
  wire[0:0] isValidShift;
  wire[0:0] sign;
  wire[0:0] T18;
  wire[0:0] T19;
  wire[2:0] T20;
  wire[0:0] T21;
  wire[5:0] T22;
  wire[5:0] T23;
  wire[6:0] T24;
  wire[6:0] T25;
  wire[6:0] shift_count;
  wire[0:0] T26;
  wire[0:0] T27;
  wire[0:0] T28;
  wire[0:0] T29;
  wire[0:0] T30;
  wire[0:0] T31;
  wire[0:0] T32;
  wire[22:0] T33;
  wire[23:0] T34;
  wire[40:0] T35;
  wire[64:0] T36;
  wire[64:0] out_0;
  wire[64:0] out_1;
  wire[64:0] out_2;
  wire[64:0] out_3;
  wire[64:0] out_4;
  wire[64:0] out_5;
  wire[64:0] out_6;
  wire[65:0] absolute_int;
  wire[64:0] T37;
  wire[0:0] T38;
  wire[1:0] T39;
  wire[0:0] out_lsb_7;
  wire[0:0] out_lsb_8;
  wire[0:0] out_lsb_9;
  wire[0:0] out_lsb_10;
  wire[0:0] out_lsb_11;
  wire[0:0] out_lsb_12;
  wire[0:0] out_lsb_13;
  wire[2:0] lsbs;
  wire[1:0] T40;
  wire[0:0] T41;
  wire[1:0] T42;
  wire[0:0] T43;
  wire[0:0] T44;
  wire[0:0] T45;
  wire[0:0] T46;
  wire[1:0] T47;
  wire[0:0] roundExact;
  wire[0:0] T48;
  wire[0:0] T49;
  wire[0:0] T50;
  wire[0:0] T51;
  wire[0:0] T52;
  wire[0:0] T53;
  wire[0:0] T54;
  wire[0:0] T55;
  wire[0:0] T56;
  wire[0:0] roundOffset;
  wire[64:0] absolute_round;
  wire[63:0] T57;
  wire[0:0] T58;
  wire[0:0] T59;
  wire[0:0] T60;
  wire[0:0] T61;
  wire[63:0] T62;
  wire[63:0] T63;
  wire[63:0] T64;
  wire[63:0] maxInteger;
  wire[0:0] T65;
  wire[0:0] T66;
  wire[8:0] T67;
  wire[0:0] isTiny;
  wire[0:0] T68;
  wire[0:0] isValidUnsigned;
  wire[0:0] T69;
  wire[0:0] T70;
  wire[64:0] T71;
  wire[64:0] T72;
  wire[63:0] signed_int;
  wire[1:0] T73;
  wire[0:0] T74;
  wire[0:0] isRoundToZero;
  wire[0:0] T75;
  wire[0:0] T76;
  wire[0:0] T77;
  wire[0:0] T78;
  wire[63:0] T79;
  wire[0:0] T80;
  wire[0:0] T81;
  wire[63:0] T82;
  wire[63:0] T83;
  wire[0:0] T84;
  wire[0:0] T85;
  wire[0:0] isValidSigned;
  wire[0:0] T86;
  wire[0:0] T87;
  wire[0:0] T88;
  wire[0:0] T89;
  wire[11:0] T90;
  wire[11:0] T91;
  wire[11:0] T92;
  wire[11:0] T93;
  wire[11:0] maxExponent;
  wire[8:0] T94;
  wire[9:0] T95;
  wire[22:0] T96;
  wire[32:0] maxNegFloat;
  wire[0:0] T97;
  wire[0:0] T98;
  wire[0:0] T99;
  wire[0:0] T100;
  wire[0:0] isValidExp;
  wire[0:0] T101;
  wire[0:0] T102;
  wire[0:0] T103;
  wire[0:0] T104;
  wire[0:0] T105;
  wire[0:0] T106;
  wire[0:0] T107;
  wire[0:0] T108;
  wire[0:0] isValid;
  wire[0:0] T109;
  wire[4:0] T110;
  wire[63:0] T111;
  wire[0:0] T112;
  wire[0:0] T113;
  wire[0:0] T114;
  wire[0:0] T115;
  wire[0:0] T116;
  wire[0:0] T117;
  wire[0:0] T118;
  wire[0:0] T119;
  wire[0:0] T120;
  wire[63:0] T121;
  wire[63:0] T122;
  wire[63:0] T123;
  wire[63:0] minInteger;
  wire[63:0] T124;
  wire[63:0] T125;
  wire[63:0] T126;
  wire[63:0] T127;

  assign T14 = typeOp == 2'h0;
  assign exponent = in[5'h1f:5'h17];
  assign T15 = exponent[4'h8:3'h6];
  assign T16 = T15 == 3'b100;
  assign T17 = 9'h100 - 1'h1;
  assign isZeroOrOne = exponent == T17;
  assign isValidShift = T16 || isZeroOrOne;
  assign sign = in[6'h20];
  assign T18 = ! sign;
  assign T19 = isValidShift && T18;
  assign T20 = exponent[4'h8:3'h6];
  assign T21 = T20 == 3'b100;
  assign T22 = exponent[3'h5:1'h0];
  assign T23 = ~ T22;
  assign T24 = {1'h0, T23};
  assign T25 = isZeroOrOne ? 7'b1000000 : 7'h0;
  assign shift_count = T21 ? T24 : T25;
  assign T26 = shift_count[3'h6];
  assign T27 = shift_count[3'h5];
  assign T28 = shift_count[3'h4];
  assign T29 = shift_count[2'h3];
  assign T30 = shift_count[2'h2];
  assign T31 = shift_count[1'h1];
  assign T32 = shift_count[1'h0];
  assign T33 = in[5'h16:1'h0];
  assign T34 = {1'h1, T33};
  assign T35 = {6'h29{1'h0}};
  assign T36 = {T34, T35};
  assign absolute_int = {1'h0, out_6};
  assign T37 = absolute_int[7'h41:1'h1];
  assign T38 = roundingMode == 2'h0;
  assign T39 = absolute_int[1'h1:1'h0];
  assign lsbs = {T39, out_lsb_13};
  assign T40 = lsbs[1'h1:1'h0];
  assign T41 = T40 == 2'b11;
  assign T42 = lsbs[2'h2:1'h1];
  assign T43 = T42 == 2'b11;
  assign T44 = T41 || T43;
  assign T45 = roundingMode == 2'h1;
  assign T46 = roundingMode == 2'h2;
  assign T47 = lsbs[1'h1:1'h0];
  assign roundExact = T47 == 2'b00;
  assign T48 = ~ roundExact;
  assign T49 = sign & T48;
  assign T50 = roundingMode == 2'h3;
  assign T51 = ~ sign;
  assign T52 = ~ roundExact;
  assign T53 = T51 & T52;
  assign T54 = T50 ? T53 : 1'h0;
  assign T55 = T46 ? T49 : T54;
  assign T56 = T45 ? 1'h0 : T55;
  assign roundOffset = T38 ? T44 : T56;
  assign absolute_round = T37 + roundOffset;
  assign T57 = absolute_round[6'h3f:1'h0];
  assign T58 = typeOp == 2'h0;
  assign T59 = typeOp == 2'h1;
  assign T60 = typeOp == 2'h2;
  assign T61 = typeOp == 2'h3;
  assign T62 = T61 ? 64'h7fffffffffffffff : 64'h0;
  assign T63 = T60 ? 64'hffffffffffffffff : T62;
  assign T64 = T59 ? 64'h7fffffff : T63;
  assign maxInteger = T58 ? 64'hffffffff : T64;
  assign T65 = T57 <= maxInteger;
  assign T66 = ! sign;
  assign T67 = 9'h100 - 1'h1;
  assign isTiny = exponent < T67;
  assign T68 = T66 ? isTiny : 1'h0;
  assign isValidUnsigned = T19 ? T65 : T68;
  assign T69 = isZeroOrOne || isTiny;
  assign T70 = sign && T69;
  assign T71 = - absolute_round;
  assign T72 = sign ? T71 : absolute_round;
  assign signed_int = T72[6'h3f:1'h0];
  assign T73 = signed_int[1'h1:1'h0];
  assign T74 = T73 == 2'h0;
  assign isRoundToZero = T70 && T74;
  assign T75 = isValidUnsigned || isRoundToZero;
  assign T76 = typeOp == 2'h1;
  assign T77 = ! sign;
  assign T78 = isValidShift && T77;
  assign T79 = absolute_round[6'h3f:1'h0];
  assign T80 = T79 <= maxInteger;
  assign T81 = isValidShift && sign;
  assign T82 = absolute_round[6'h3f:1'h0];
  assign T83 = maxInteger + 1'h1;
  assign T84 = T82 <= T83;
  assign T85 = T81 ? T84 : isTiny;
  assign isValidSigned = T78 ? T80 : T85;
  assign T86 = typeOp == 2'h0;
  assign T87 = typeOp == 2'h1;
  assign T88 = typeOp == 2'h2;
  assign T89 = typeOp == 2'h3;
  assign T90 = T89 ? 12'h3f : 12'h0;
  assign T91 = T88 ? 12'h40 : T90;
  assign T92 = T87 ? 12'h1f : T91;
  assign T93 = T86 ? 12'h20 : T92;
  assign maxExponent = 9'h100 + T93;
  assign T94 = maxExponent[4'h8:1'h0];
  assign T95 = {1'h1, T94};
  assign T96 = {5'h17{1'h0}};
  assign maxNegFloat = {T95, T96};
  assign T97 = in == maxNegFloat;
  assign T98 = isValidSigned || T97;
  assign T99 = typeOp == 2'h2;
  assign T100 = ! sign;
  assign isValidExp = exponent < maxExponent;
  assign T101 = T100 && isValidExp;
  assign T102 = T101 || isRoundToZero;
  assign T103 = typeOp == 2'h3;
  assign T104 = in == maxNegFloat;
  assign T105 = isValidExp || T104;
  assign T106 = T103 ? T105 : 1'h0;
  assign T107 = T99 ? T102 : T106;
  assign T108 = T76 ? T98 : T107;
  assign isValid = T14 ? T75 : T108;
  assign T109 = ~ isValid;
  assign T110 = {T109, 4'h0};
  assign exceptionFlags = T110;
  assign T111 = {7'h40{1'h0}};
  assign T112 = ~ isValid;
  assign T113 = ~ sign;
  assign T114 = T112 && T113;
  assign T115 = ~ isValid;
  assign T116 = T115 && sign;
  assign T117 = typeOp == 2'h0;
  assign T118 = typeOp == 2'h1;
  assign T119 = typeOp == 2'h2;
  assign T120 = typeOp == 2'h3;
  assign T121 = T120 ? 64'h8000000000000000 : 64'h0;
  assign T122 = T119 ? 64'hffffffffffffffff : T121;
  assign T123 = T118 ? 64'hffffffff80000000 : T122;
  assign minInteger = T117 ? 64'hffffffff : T123;
  assign T124 = signed_int[6'h3f:1'h0];
  assign T125 = T116 ? minInteger : T124;
  assign T126 = T114 ? maxInteger : T125;
  assign T127 = isTiny ? T111 : T126;
  assign out = T127;
  shift_right_track_lsbs_0 shift_right_track_lsbs_0(
       .in( T36 ),
       .out_lsb( out_lsb_7 ),
       .in_lsb( 1'h0 ),
       .out( out_0 ),
       .do_shift( T32 ));
  shift_right_track_lsbs_1 shift_right_track_lsbs_1(
       .in( out_0 ),
       .out_lsb( out_lsb_8 ),
       .in_lsb( out_lsb_7 ),
       .out( out_1 ),
       .do_shift( T31 ));
  shift_right_track_lsbs_2 shift_right_track_lsbs_2(
       .in( out_1 ),
       .out_lsb( out_lsb_9 ),
       .in_lsb( out_lsb_8 ),
       .out( out_2 ),
       .do_shift( T30 ));
  shift_right_track_lsbs_3 shift_right_track_lsbs_3(
       .in( out_2 ),
       .out_lsb( out_lsb_10 ),
       .in_lsb( out_lsb_9 ),
       .out( out_3 ),
       .do_shift( T29 ));
  shift_right_track_lsbs_4 shift_right_track_lsbs_4(
       .in( out_3 ),
       .out_lsb( out_lsb_11 ),
       .in_lsb( out_lsb_10 ),
       .out( out_4 ),
       .do_shift( T28 ));
  shift_right_track_lsbs_5 shift_right_track_lsbs_5(
       .in( out_4 ),
       .out_lsb( out_lsb_12 ),
       .in_lsb( out_lsb_11 ),
       .out( out_5 ),
       .do_shift( T27 ));
  shift_right_track_lsbs_6 shift_right_track_lsbs_6(
       .in( out_5 ),
       .out_lsb( out_lsb_13 ),
       .in_lsb( out_lsb_12 ),
       .out( out_6 ),
       .do_shift( T26 ));
endmodule

module float32ToAny(
    output[4:0] exceptionFlags,
    input [31:0] in,
    output[63:0] out,
    input [1:0] typeOp,
    input [1:0] roundingMode);

  wire[32:0] out_0;
  wire[4:0] exceptionFlags_1;
  wire[63:0] out_2;

  assign exceptionFlags = exceptionFlags_1;
  assign out = out_2;
  float32ToRecodedFloat32 float32ToRecodedFloat32(
       .in( in ),
       .out( out_0 ));
  recodedFloat32ToAny recodedFloat32ToAny(
       .exceptionFlags( exceptionFlags_1 ),
       .in( out_0 ),
       .out( out_2 ),
       .typeOp( typeOp ),
       .roundingMode( roundingMode ));
endmodule

