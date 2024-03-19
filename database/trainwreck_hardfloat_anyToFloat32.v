module normalize64_0(
    input [63:0] in,
    output[63:0] out,
    output[5:0] distance);

  wire[31:0] T0;
  wire[0:0] T1;
  wire[63:0] T2;
  wire[63:0] T3;
  wire[15:0] T4;
  wire[0:0] T5;
  wire[63:0] T6;
  wire[63:0] T7;
  wire[7:0] T8;
  wire[0:0] T9;
  wire[63:0] T10;
  wire[63:0] T11;
  wire[3:0] T12;
  wire[0:0] T13;
  wire[63:0] T14;
  wire[63:0] T15;
  wire[1:0] T16;
  wire[0:0] T17;
  wire[63:0] T18;
  wire[63:0] T19;
  wire[0:0] T20;
  wire[0:0] T21;
  wire[63:0] T22;
  wire[63:0] T23;
  wire[1:0] T24;
  wire[2:0] T25;
  wire[3:0] T26;
  wire[4:0] T27;
  wire[5:0] T28;

  assign T0 = in[6'h3f:6'h20];
  assign T1 = T0 == 32'h0;
  assign T2 = in << 6'h20;
  assign T3 = T1 ? T2 : in;
  assign T4 = T3[6'h3f:6'h30];
  assign T5 = T4 == 16'h0;
  assign T6 = T3 << 5'h10;
  assign T7 = T5 ? T6 : T3;
  assign T8 = T7[6'h3f:6'h38];
  assign T9 = T8 == 8'h0;
  assign T10 = T7 << 4'h8;
  assign T11 = T9 ? T10 : T7;
  assign T12 = T11[6'h3f:6'h3c];
  assign T13 = T12 == 4'h0;
  assign T14 = T11 << 3'h4;
  assign T15 = T13 ? T14 : T11;
  assign T16 = T15[6'h3f:6'h3e];
  assign T17 = T16 == 2'h0;
  assign T18 = T15 << 2'h2;
  assign T19 = T17 ? T18 : T15;
  assign T20 = T19[6'h3f:6'h3f];
  assign T21 = T20 == 1'h0;
  assign T22 = T19 << 1'h1;
  assign T23 = T21 ? T22 : T19;
  assign out = T23;
  assign T24 = {T1, T5};
  assign T25 = {T24, T9};
  assign T26 = {T25, T13};
  assign T27 = {T26, T17};
  assign T28 = {T27, T21};
  assign distance = T28;
endmodule

module anyToRecodedFloat32(
    output[4:0] exceptionFlags,
    input [63:0] in,
    output[32:0] out,
    input [1:0] typeOp,
    input [1:0] roundingMode);

  wire[0:0] T2;
  wire[31:0] T3;
  wire[63:0] T4;
  wire[0:0] T5;
  wire[0:0] T6;
  wire[0:0] T7;
  wire[0:0] T8;
  wire[0:0] T9;
  wire[0:0] T10;
  wire[0:0] T11;
  wire[0:0] T12;
  wire[0:0] T13;
  wire[0:0] T14;
  wire[0:0] sign;
  wire[31:0] T15;
  wire[31:0] T16;
  wire[31:0] T17;
  wire[31:0] T18;
  wire[63:0] T19;
  wire[0:0] T20;
  wire[0:0] T21;
  wire[63:0] T22;
  wire[63:0] T23;
  wire[63:0] T24;
  wire[63:0] T25;
  wire[63:0] T26;
  wire[63:0] norm_in;
  wire[63:0] out_0;
  wire[1:0] T27;
  wire[38:0] T28;
  wire[0:0] T29;
  wire[2:0] roundBits;
  wire[1:0] T30;
  wire[0:0] roundInexact;
  wire[4:0] T31;
  wire[0:0] T32;
  wire[0:0] T33;
  wire[5:0] dist_1;
  wire[0:0] T34;
  wire[0:0] T35;
  wire[5:0] T36;
  wire[8:0] T37;
  wire[23:0] T38;
  wire[24:0] T39;
  wire[0:0] T40;
  wire[1:0] T41;
  wire[0:0] T42;
  wire[1:0] T43;
  wire[0:0] T44;
  wire[0:0] roundEvenOffset;
  wire[0:0] T45;
  wire[0:0] T46;
  wire[0:0] T47;
  wire[0:0] T48;
  wire[0:0] T49;
  wire[0:0] T50;
  wire[0:0] T51;
  wire[0:0] T52;
  wire[0:0] T53;
  wire[0:0] T54;
  wire[0:0] T55;
  wire[0:0] roundOffset;
  wire[24:0] norm_round;
  wire[0:0] T56;
  wire[8:0] exponent_offset;
  wire[8:0] exponent;
  wire[9:0] T57;
  wire[22:0] T58;
  wire[32:0] T59;

  assign T2 = typeOp == 2'h0;
  assign T3 = in[5'h1f:1'h0];
  assign T4 = {32'h0, T3};
  assign T5 = typeOp == 2'h1;
  assign T6 = typeOp == 2'h0;
  assign T7 = typeOp == 2'h1;
  assign T8 = in[5'h1f];
  assign T9 = typeOp == 2'h2;
  assign T10 = typeOp == 2'h3;
  assign T11 = in[6'h3f];
  assign T12 = T10 ? T11 : 1'h0;
  assign T13 = T9 ? 1'h0 : T12;
  assign T14 = T7 ? T8 : T13;
  assign sign = T6 ? 1'h0 : T14;
  assign T15 = in[5'h1f:1'h0];
  assign T16 = - T15;
  assign T17 = in[5'h1f:1'h0];
  assign T18 = sign ? T16 : T17;
  assign T19 = {32'h0, T18};
  assign T20 = typeOp == 2'h2;
  assign T21 = typeOp == 2'h3;
  assign T22 = - in;
  assign T23 = sign ? T22 : in;
  assign T24 = T21 ? T23 : 64'h0;
  assign T25 = T20 ? in : T24;
  assign T26 = T5 ? T19 : T25;
  assign norm_in = T2 ? T4 : T26;
  assign T27 = out_0[6'h28:6'h27];
  assign T28 = out_0[6'h26:1'h0];
  assign T29 = T28 != 39'h0;
  assign roundBits = {T27, T29};
  assign T30 = roundBits[1'h1:1'h0];
  assign roundInexact = T30 != 2'h0;
  assign T31 = {4'h0, roundInexact};
  assign exceptionFlags = T31;
  assign T32 = out_0[6'h3f];
  assign T33 = T32 == 1'h0;
  assign T34 = dist_1 == 6'h3f;
  assign T35 = T33 && T34;
  assign T36 = ~ dist_1;
  assign T37 = {3'b100, T36};
  assign T38 = out_0[6'h3f:6'h28];
  assign T39 = {1'h0, T38};
  assign T40 = roundingMode == 2'h0;
  assign T41 = roundBits[1'h1:1'h0];
  assign T42 = T41 == 2'b11;
  assign T43 = roundBits[2'h2:1'h1];
  assign T44 = T43 == 2'b11;
  assign roundEvenOffset = T42 || T44;
  assign T45 = roundingMode == 2'h1;
  assign T46 = roundingMode == 2'h2;
  assign T47 = roundInexact ? 1'h1 : 1'h0;
  assign T48 = sign & T47;
  assign T49 = roundingMode == 2'h3;
  assign T50 = ~ sign;
  assign T51 = roundInexact ? 1'h1 : 1'h0;
  assign T52 = T50 & T51;
  assign T53 = T49 ? T52 : 1'h0;
  assign T54 = T46 ? T48 : T53;
  assign T55 = T45 ? 1'h0 : T54;
  assign roundOffset = T40 ? roundEvenOffset : T55;
  assign norm_round = T39 + roundOffset;
  assign T56 = norm_round[5'h18];
  assign exponent_offset = T37 + T56;
  assign exponent = T35 ? 9'h0 : exponent_offset;
  assign T57 = {sign, exponent};
  assign T58 = norm_round[5'h16:1'h0];
  assign T59 = {T57, T58};
  assign out = T59;
  normalize64_0 normalize64_0(
       .in( norm_in ),
       .out( out_0 ),
       .distance( dist_1 ));
endmodule

module recodedFloat32ToFloat32(
    input [32:0] in,
    output[31:0] out);

  wire[0:0] sign;
  wire[8:0] expIn;
  wire[1:0] T0;
  wire[0:0] T1;
  wire[6:0] T2;
  wire[0:0] exp01_isHighSubnormalIn;
  wire[0:0] T3;
  wire[0:0] T4;
  wire[1:0] T5;
  wire[0:0] T6;
  wire[0:0] isNormal;
  wire[8:0] normal_expOut;
  wire[8:0] T7;
  wire[1:0] T8;
  wire[0:0] isSpecial;
  wire[7:0] T9;
  wire[8:0] expOut;
  wire[7:0] T10;
  wire[8:0] T11;
  wire[2:0] T12;
  wire[0:0] T13;
  wire[1:0] T14;
  wire[0:0] T15;
  wire[0:0] T16;
  wire[0:0] isSubnormal;
  wire[22:0] fractIn;
  wire[23:0] T17;
  wire[4:0] T18;
  wire[4:0] denormShiftDist;
  wire[4:0] T19;
  wire[23:0] subnormal_fractOut;
  wire[23:0] T20;
  wire[0:0] T21;
  wire[0:0] isNaN;
  wire[0:0] T22;
  wire[22:0] T23;
  wire[23:0] fractOut;
  wire[22:0] T24;
  wire[31:0] T25;

  assign sign = in[6'h20];
  assign expIn = in[5'h1f:5'h17];
  assign T0 = expIn[4'h8:3'h7];
  assign T1 = T0 == 2'b01;
  assign T2 = expIn[3'h6:1'h0];
  assign exp01_isHighSubnormalIn = T2 < 7'h2;
  assign T3 = ~ exp01_isHighSubnormalIn;
  assign T4 = T1 & T3;
  assign T5 = expIn[4'h8:3'h7];
  assign T6 = T5 == 2'b10;
  assign isNormal = T4 | T6;
  assign normal_expOut = expIn - 9'b010000001;
  assign T7 = isNormal ? normal_expOut : 8'h0;
  assign T8 = expIn[4'h8:3'h7];
  assign isSpecial = T8 == 2'b11;
  assign T9 = isSpecial ? 8'b11111111 : 8'h0;
  assign expOut = T7 | T9;
  assign T10 = expOut[3'h7:1'h0];
  assign T11 = {sign, T10};
  assign T12 = expIn[4'h8:3'h6];
  assign T13 = T12 == 3'b001;
  assign T14 = expIn[4'h8:3'h7];
  assign T15 = T14 == 2'b01;
  assign T16 = T15 & exp01_isHighSubnormalIn;
  assign isSubnormal = T13 | T16;
  assign fractIn = in[5'h16:1'h0];
  assign T17 = {1'h1, fractIn};
  assign T18 = expIn[3'h4:1'h0];
  assign denormShiftDist = 5'h2 - T18;
  assign T19 = denormShiftDist[3'h4:1'h0];
  assign subnormal_fractOut = T17 >> T19;
  assign T20 = isSubnormal ? subnormal_fractOut : 23'h0;
  assign T21 = expIn[3'h6];
  assign isNaN = isSpecial & T21;
  assign T22 = isNormal | isNaN;
  assign T23 = T22 ? fractIn : 23'h0;
  assign fractOut = T20 | T23;
  assign T24 = fractOut[5'h16:1'h0];
  assign T25 = {T11, T24};
  assign out = T25;
endmodule

module anyToFloat32(
    output[4:0] exceptionFlags,
    input [63:0] in,
    output[31:0] out,
    input [1:0] typeOp,
    input [1:0] roundingMode);

  wire[4:0] exceptionFlags_0;
  wire[32:0] out_1;
  wire[31:0] out_2;

  assign exceptionFlags = exceptionFlags_0;
  assign out = out_2;
  anyToRecodedFloat32 anyToRecodedFloat32(
       .exceptionFlags( exceptionFlags_0 ),
       .in( in ),
       .out( out_1 ),
       .typeOp( typeOp ),
       .roundingMode( roundingMode ));
  recodedFloat32ToFloat32 recodedFloat32ToFloat32(
       .in( out_1 ),
       .out( out_2 ));
endmodule

