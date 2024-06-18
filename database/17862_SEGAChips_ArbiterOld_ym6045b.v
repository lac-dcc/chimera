// This program was cloned from: https://github.com/emu-russia/SEGAChips
// License: Creative Commons Zero v1.0 Universal

module ym6045b (  VA9_o, VA9_d, VA9_i, VA10_o, VA10_d, VA10_i, VA11_o, VA11_d, VA11_i, VA12_o, VA12_d, VA12_i, VA13_o, VA13_d, VA13_i, VA14_o, VA14_d, VA14_i, VA15_o, VA15_d, VA15_i, VA16_o, VA16_d, VA16_i, VA17_o, VA17_d, VA17_i, VA18_o, VA18_d, VA18_i, VA19_o, VA19_d, VA19_i, VA20_o, VA20_d, VA20_i, VA21_o, VA21_d, VA21_i, VA22_o, VA22_d, VA22_i, VA23_o, VA23_d, VA23_i, FC0, FC1, VPA, VRES, HALT, VD8_o, VD8_d, VD8_i, VCLK, TIME, CAS0, DTACK_o, DTACK_d, DTACK_i, RW_o, RW_d, RW_i, LDS_o, LDS_d, LDS_i, UDS_o, UDS_d, UDS_i, AS_o, AS_d, AS_i, INTAK, VDPM, BG, BGACK_o, BGACK_d, BGACK_i, BR, SOUND, ZCLK, WRES, ZRAM, REF, M1, ZRES, ZBR, WAIT_o, WAIT_d, WAIT_i, ZBAK, ZWR_o, ZWR_d, ZWR_i, ZRD_o, ZRD_d, ZRD_i, IREQ, MREQ_o, MREQ_d, MREQ_i, NMI, ZA0_o, ZA0_d, ZA0_i, ZA7, ZA8_o, ZA8_d, ZA8_i, ZA9_o, ZA9_d, ZA9_i, ZA10_o, ZA10_d, ZA10_i, ZA11_o, ZA11_d, ZA11_i, ZA12_o, ZA12_d, ZA12_i, ZA13_o, ZA13_d, ZA13_i, ZA14_o, ZA14_d, ZA14_i, ZA15_o, ZA15_d, ZA15_i, ZD0, FDWR, FDC, ROM, ASEL, CAS2, RAS2, CE0, VTOZ, ZTOV, SRES, IO, M3, CART, VA8_o, VA8_d, VA8_i);

	output wire VA9_o;
	output wire VA9_d;
	input wire VA9_i;
	output wire VA10_o;
	output wire VA10_d;
	input wire VA10_i;
	output wire VA11_o;
	output wire VA11_d;
	input wire VA11_i;
	output wire VA12_o;
	output wire VA12_d;
	input wire VA12_i;
	output wire VA13_o;
	output wire VA13_d;
	input wire VA13_i;
	output wire VA14_o;
	output wire VA14_d;
	input wire VA14_i;
	output wire VA15_o;
	output wire VA15_d;
	input wire VA15_i;
	output wire VA16_o;
	output wire VA16_d;
	input wire VA16_i;
	output wire VA17_o;
	output wire VA17_d;
	input wire VA17_i;
	output wire VA18_o;
	output wire VA18_d;
	input wire VA18_i;
	output wire VA19_o;
	output wire VA19_d;
	input wire VA19_i;
	output wire VA20_o;
	output wire VA20_d;
	input wire VA20_i;
	output wire VA21_o;
	output wire VA21_d;
	input wire VA21_i;
	output wire VA22_o;
	output wire VA22_d;
	input wire VA22_i;
	output wire VA23_o;
	output wire VA23_d;
	input wire VA23_i;
	input wire FC0;
	input wire FC1;
	output wire VPA;
	output wire VRES;
	output wire HALT;
	output wire VD8_o;
	output wire VD8_d;
	input wire VD8_i;
	input wire VCLK;
	output wire TIME;
	input wire CAS0;
	output wire DTACK_o;
	output wire DTACK_d;
	input wire DTACK_i;
	output wire RW_o;
	output wire RW_d;
	input wire RW_i;
	output wire LDS_o;
	output wire LDS_d;
	input wire LDS_i;
	output wire UDS_o;
	output wire UDS_d;
	input wire UDS_i;
	output wire AS_o;
	output wire AS_d;
	input wire AS_i;
	output wire INTAK;
	output wire VDPM;
	input wire BG;
	output wire BGACK_o;
	output wire BGACK_d;
	input wire BGACK_i;
	output wire BR;
	output wire SOUND;
	input wire ZCLK;
	input wire WRES;
	output wire ZRAM;
	output wire REF;
	input wire M1;
	output wire ZRES;
	output wire ZBR;
	output wire WAIT_o;
	output wire WAIT_d;
	input wire WAIT_i;
	input wire ZBAK;
	output wire ZWR_o;
	output wire ZWR_d;
	input wire ZWR_i;
	output wire ZRD_o;
	output wire ZRD_d;
	input wire ZRD_i;
	input wire IREQ;
	output wire MREQ_o;
	output wire MREQ_d;
	input wire MREQ_i;
	output wire NMI;
	output wire ZA0_o;
	output wire ZA0_d;
	input wire ZA0_i;
	input wire ZA7;
	output wire ZA8_o;
	output wire ZA8_d;
	input wire ZA8_i;
	output wire ZA9_o;
	output wire ZA9_d;
	input wire ZA9_i;
	output wire ZA10_o;
	output wire ZA10_d;
	input wire ZA10_i;
	output wire ZA11_o;
	output wire ZA11_d;
	input wire ZA11_i;
	output wire ZA12_o;
	output wire ZA12_d;
	input wire ZA12_i;
	output wire ZA13_o;
	output wire ZA13_d;
	input wire ZA13_i;
	output wire ZA14_o;
	output wire ZA14_d;
	input wire ZA14_i;
	output wire ZA15_o;
	output wire ZA15_d;
	input wire ZA15_i;
	input wire ZD0;
	output wire FDWR;
	output wire FDC;
	output wire ROM;
	output wire ASEL;
	output wire CAS2;
	output wire RAS2;
	output wire CE0;
	output wire VTOZ;
	output wire ZTOV;
	input wire SRES;
	output wire IO;
	input wire M3;
	input wire CART;
	output wire VA8_o;
	output wire VA8_d;
	input wire VA8_i;

	assign VA9_o = w12;
	assign VA9_d = w221;
	assign w364 = VA9_i;
	assign VA10_o = w15;
	assign VA10_d = w221;
	assign w77 = VA10_i;
	assign VA11_o = w19;
	assign VA11_d = w221;
	assign w75 = VA11_i;
	assign VA12_o = w262;
	assign w59 = VA12_i;
	assign VA13_o = w271;
	assign VA13_d = w221;
	assign w40 = VA13_i;
	assign VA14_o = w282;
	assign VA14_d = w221;
	assign w41 = VA14_i;
	assign VA15_o = w287;
	assign VA15_d = w221;
	assign w277 = VA15_i;
	assign VA16_o = w337;
	assign VA16_d = w221;
	assign w203 = VA16_i;
	assign VA17_o = w338;
	assign VA17_d = w221;
	assign w367 = VA17_i;
	assign VA18_o = w339;
	assign VA18_d = w221;
	assign w368 = VA18_i;
	assign VA19_o = w369;
	assign VA19_d = w221;
	assign w370 = VA19_i;
	assign VA20_o = w372;
	assign VA20_d = w221;
	assign w371 = VA20_i;
	assign VA21_o = w373;
	assign VA21_d = w374;
	assign w245 = VA21_i;
	assign VA22_o = w375;
	assign VA22_d = w374;
	assign w234 = VA22_i;
	assign VA23_o = w376;
	assign VA23_d = w374;
	assign w108 = VA23_i;
	assign w305 = FC0;
	assign w304 = FC1;
	assign VPA = w302;
	assign VRES = w303;
	assign HALT = w303;
	assign VD8_o = w145;
	assign VD8_d = w174;
	assign w119 = VD8_i;
	assign w10 = VCLK;
	assign TIME = w202;
	assign w43 = CAS0;
	assign DTACK_o = w296;
	assign DTACK_d = w292;
	assign w211 = DTACK_i;
	assign RW_o = w377;
	assign RW_d = w297;
	assign w31 = RW_i;
	assign LDS_o = w134;
	assign LDS_d = w297;
	assign w298 = LDS_i;
	assign UDS_o = w133;
	assign UDS_d = w297;
	assign w139 = UDS_i;
	assign AS_o = w152;
	assign AS_d = w297;
	assign w5 = AS_i;
	assign INTAK = w293;
	assign VDPM = w291;
	assign w209 = BG;
	assign BGACK_o = w294;
	assign BGACK_d = w297;
	assign w210 = BGACK_i;
	assign BR = w295;
	assign SOUND = w110;
	assign w151 = ZCLK;
	assign w140 = WRES;
	assign ZRAM = w384;
	assign REF = w167;
	assign w385 = M1;
	assign ZRES = w169;
	assign ZBR = w171;
	assign WAIT_o = w164;
	assign WAIT_d = w178;
	assign w48 = WAIT_i;
	assign w145 = ZBAK;
	assign ZWR_o = w386;
	assign ZWR_d = w95;
	assign w377 = ZWR_i;
	assign ZRD_o = w387;
	assign ZRD_d = w95;
	assign w388 = ZRD_i;
	assign w147 = IREQ;
	assign MREQ_o = w180;
	assign MREQ_d = w95;
	assign w123 = MREQ_i;
	assign NMI = w391;
	assign ZA0_o = w389;
	assign ZA0_d = w95;
	assign w390 = ZA0_i;
	assign w379 = ZA7;
	assign ZA8_o = w2;
	assign ZA8_d = w95;
	assign w378 = ZA8_i;
	assign ZA9_o = w364;
	assign ZA9_d = w95;
	assign w73 = ZA9_i;
	assign ZA10_o = w77;
	assign ZA10_d = w95;
	assign w72 = ZA10_i;
	assign ZA11_o = w75;
	assign ZA11_d = w95;
	assign w71 = ZA11_i;
	assign ZA12_o = w59;
	assign ZA12_d = w95;
	assign w76 = ZA12_i;
	assign ZA13_o = w40;
	assign ZA13_d = w95;
	assign w90 = ZA13_i;
	assign ZA14_o = w41;
	assign ZA14_d = w95;
	assign w49 = ZA14_i;
	assign ZA15_o = w1;
	assign ZA15_d = w11;
	assign w8 = ZA15_i;
	assign w247 = ZD0;
	assign FDWR = w192;
	assign FDC = w193;
	assign ROM = w230;
	assign ASEL = w235;
	assign CAS2 = w194;
	assign RAS2 = w233;
	assign CE0 = w9;
	assign VTOZ = w11;
	assign ZTOV = w221;
	assign w229 = SRES;
	assign IO = w195;
	assign w53 = M3;
	assign w231 = CART;
	assign VA8_o = w4;
	assign VA8_d = w221;
	assign w2 = VA8_i;

// Wires

	wire w1;
	wire w2;
	wire w3;
	wire w4;
	wire w5;
	wire w6;
	wire w7;
	wire w8;
	wire w9;
	wire w10;
	wire w11;
	wire w12;
	wire w13;
	wire w14;
	wire w15;
	wire w16;
	wire w17;
	wire w18;
	wire w19;
	wire w20;
	wire w21;
	wire w22;
	wire w23;
	wire w24;
	wire w25;
	wire w26;
	wire w27;
	wire w28;
	wire w29;
	wire w30;
	wire w31;
	wire w32;
	wire w33;
	wire w34;
	wire w35;
	wire w36;
	wire w37;
	wire w38;
	wire w39;
	wire w40;
	wire w41;
	wire w42;
	wire w43;
	wire w44;
	wire w45;
	wire w46;
	wire w47;
	wire w48;
	wire w49;
	wire w50;
	wire w51;
	wire w52;
	wire w53;
	wire w54;
	wire w55;
	wire w56;
	wire w57;
	wire w58;
	wire w59;
	wire w60;
	wire w61;
	wire w62;
	wire w63;
	wire w64;
	wire w65;
	wire w66;
	wire w67;
	wire w68;
	wire w69;
	wire w70;
	wire w71;
	wire w72;
	wire w73;
	wire w74;
	wire w75;
	wire w76;
	wire w77;
	wire w78;
	wire w79;
	wire w80;
	wire w81;
	wire w82;
	wire w83;
	wire w84;
	wire w85;
	wire w86;
	wire w87;
	wire w88;
	wire w89;
	wire w90;
	wire w91;
	wire w92;
	wire w93;
	wire w94;
	wire w95;
	wire w96;
	wire w97;
	wire w98;
	wire w99;
	wire w100;
	wire w101;
	wire w102;
	wire w103;
	wire w104;
	wire w105;
	wire w106;
	wire w107;
	wire w108;
	wire w109;
	wire w110;
	wire w111;
	wire w112;
	wire w113;
	wire w114;
	wire w115;
	wire w116;
	wire w117;
	wire w118;
	wire w119;
	wire w120;
	wire w121;
	wire w122;
	wire w123;
	wire w124;
	wire w125;
	wire w126;
	wire w127;
	wire w128;
	wire w129;
	wire w130;
	wire w131;
	wire w132;
	wire w133;
	wire w134;
	wire w135;
	wire w136;
	wire w137;
	wire w138;
	wire w139;
	wire w140;
	wire w141;
	wire w142;
	wire w143;
	wire w144;
	wire w145;
	wire w146;
	wire w147;
	wire w148;
	wire w149;
	wire w150;
	wire w151;
	wire w152;
	wire w153;
	wire w154;
	wire w155;
	wire w156;
	wire w157;
	wire w158;
	wire w159;
	wire w160;
	wire w161;
	wire w162;
	wire w163;
	wire w164;
	wire w165;
	wire w166;
	wire w167;
	wire w168;
	wire w169;
	wire w170;
	wire w171;
	wire w172;
	wire w173;
	wire w174;
	wire w175;
	wire w176;
	wire w177;
	wire w178;
	wire w179;
	wire w180;
	wire w181;
	wire w182;
	wire w183;
	wire w184;
	wire w185;
	wire w186;
	wire w187;
	wire w188;
	wire w189;
	wire w190;
	wire w191;
	wire w192;
	wire w193;
	wire w194;
	wire w195;
	wire w196;
	wire w197;
	wire w198;
	wire w199;
	wire w200;
	wire w201;
	wire w202;
	wire w203;
	wire w204;
	wire w205;
	wire w206;
	wire w207;
	wire w208;
	wire w209;
	wire w210;
	wire w211;
	wire w212;
	wire w213;
	wire w214;
	wire w215;
	wire w216;
	wire w217;
	wire w218;
	wire w219;
	wire w220;
	wire w221;
	wire w222;
	wire w223;
	wire w224;
	wire w225;
	wire w226;
	wire w227;
	wire w228;
	wire w229;
	wire w230;
	wire w231;
	wire w232;
	wire w233;
	wire w234;
	wire w235;
	wire w236;
	wire w237;
	wire w238;
	wire w239;
	wire w240;
	wire w241;
	wire w242;
	wire w243;
	wire w244;
	wire w245;
	wire w246;
	wire w247;
	wire w248;
	wire w249;
	wire w250;
	wire w251;
	wire w252;
	wire w253;
	wire w254;
	wire w255;
	wire w256;
	wire w257;
	wire w258;
	wire w259;
	wire w260;
	wire w261;
	wire w262;
	wire w263;
	wire w264;
	wire w265;
	wire w266;
	wire w267;
	wire w268;
	wire w269;
	wire w270;
	wire w271;
	wire w272;
	wire w273;
	wire w274;
	wire w275;
	wire w276;
	wire w277;
	wire w278;
	wire w279;
	wire w280;
	wire w281;
	wire w282;
	wire w283;
	wire w284;
	wire w285;
	wire w286;
	wire w287;
	wire w288;
	wire w289;
	wire w290;
	wire w291;
	wire w292;
	wire w293;
	wire w294;
	wire w295;
	wire w296;
	wire w297;
	wire w298;
	wire w299;
	wire w300;
	wire w301;
	wire w302;
	wire w303;
	wire w304;
	wire w305;
	wire w306;
	wire w307;
	wire w308;
	wire w309;
	wire w310;
	wire w311;
	wire w312;
	wire w313;
	wire w314;
	wire w315;
	wire w316;
	wire w317;
	wire w318;
	wire w319;
	wire w320;
	wire w321;
	wire w322;
	wire w323;
	wire w324;
	wire w325;
	wire w326;
	wire w327;
	wire w328;
	wire w329;
	wire w330;
	wire w331;
	wire w332;
	wire w333;
	wire w334;
	wire w335;
	wire w336;
	wire w337;
	wire w338;
	wire w339;
	wire w340;
	wire w341;
	wire w342;
	wire w343;
	wire w344;
	wire w345;
	wire w346;
	wire w347;
	wire w348;
	wire w349;
	wire w350;
	wire w351;
	wire w352;
	wire w353;
	wire w354;
	wire w355;
	wire w356;
	wire w357;
	wire w358;
	wire w359;
	wire w360;
	wire w361;
	wire w362;
	wire w363;
	wire w364;
	wire w365;
	wire w366;
	wire w367;
	wire w368;
	wire w369;
	wire w370;
	wire w371;
	wire w372;
	wire w373;
	wire w374;
	wire w375;
	wire w376;
	wire w377;
	wire w378;
	wire w379;
	wire w380;
	wire w381;
	wire w382;
	wire w383;
	wire w384;
	wire w385;
	wire w386;
	wire w387;
	wire w388;
	wire w389;
	wire w390;
	wire w391;
	wire w392;
	wire w393;
	wire w394;

// Instances

	ym6045b_cell_23 g1 (.o5(w3), .i10(w5), .i11(w10) );
	ym6045b_cell_18 g2 (.o1(w7), .i2(w6), .i3(w5), .i4(w3) );
	ym6045b_cell_23 g3 (.o2(w13), .i10(w7), .i11(w10) );
	ym6045b_cell_6 g4 (.o2(w15), .i3(w14), .i4(w16) );
	ym6045b_cell_6 g5 (.o2(w4), .i3(w14), .i4(w17) );
	ym6045b_cell_6 g6 (.o2(w19), .i3(w14), .i4(w20) );
	ym6045b_cell_10 g7 (.i2(w21), .o3(w22), .i4(w23) );
	ym6045b_cell_21 g8 (.o1(w9), .i2(w35), .i3(w22), .i4(w36), .i5(w50) );
	ym6045b_cell_6 g9 (.o2(w36), .i3(w37), .i4(w38) );
	ym6045b_cell_10 g10 (.i2(w23), .o3(w38), .i4(w18) );
	ym6045b_cell_20 g11 (.o1(w32), .i2(w39) );
	ym6045b_cell_5 g12 (.i1(w13), .i2(w48), .o3(w47) );
	ym6045b_cell_18 g13 (.o1(w50), .i2(w53), .i3(w8), .i4(w54) );
	ym6045b_cell_21 g14 (.o1(w45), .i2(w49), .i3(w54), .i4(w53), .i5(w55) );
	ym6045b_cell_6 g15 (.o2(w12), .i3(w14), .i4(w60) );
	ym6045b_cell_6 g16 (.o2(w61), .i3(w62), .i4(w53) );
	ym6045b_cell_7 g17 (.o2(w63), .i3(w64) );
	ym6045b_cell_8 g18 (.o1(w64), .i2(w65), .i3(w66) );
	ym6045b_cell_22 g19 (.i1(w53), .o2(w20), .i6(w72), .i7(w71), .i8(w73), .i9(w72), .o11(w16), .o12(w60), .i13(w73), .i14(w378), .i15(w379), .i17(w378), .o19(w17) );
	ym6045b_cell_24 g20 (.i1h(w378), .i1l(1'b1), .i2h(w73), .i2l(w71), .i4h(w72), .i4l(w76), .o7(w78) );
	ym6045b_cell_1 g21 (.i2(w72), .o3(w380) );
	ym6045b_cell_1 g22 (.i2(w76), .o3(w79) );
	ym6045b_cell_1 g23 (.i2(w71), .o3(w381) );
	ym6045b_cell_10 g24 (.i2(w78), .o3(w86), .i4(w91) );
	ym6045b_cell_1 g25 (.i2(w73), .o3(w89) );
	ym6045b_cell_24 g26 (.i1h(w380), .i1l(w89), .i2h(w381), .i2l(w79), .i4h(w382), .i4l(1'b1), .o7(w92) );
	ym6045b_cell_1 g27 (.i2(w378), .o3(w382) );
	ym6045b_cell_5 g28 (.i1(w88), .i2(w80), .o3(w87) );
	ym6045b_cell_9 g29 (.i3(w96), .i4(w80), .i7(w61), .o13(w88) );
	ym6045b_cell_1 g30 (.i2(w90), .o3(w383) );
	ym6045b_cell_3 g31 (.i2h(w49), .i2l(w53), .i3h(w55), .i3l(w90), .o4(w91) );
	ym6045b_cell_21 g32 (.o1(w98), .i2(w377), .i3(w54), .i4(w91), .i5(w92) );
	ym6045b_cell_1 g33 (.i2(w8), .o3(w55) );
	ym6045b_cell_25 g34 (.i1(w364), .o3(w99), .i6(w2), .o10(w107), .o11(w57) );
	ym6045b_cell_1 g35 (.i2(w54), .o3(w109) );
	ym6045b_cell_1 g36 (.i2(w49), .o3(w393) );
	ym6045b_cell_3 g37 (.i2h(w55), .i2l(w53), .i3h(w393), .i3l(w109), .o4(w384) );
	ym6045b_cell_24 g38 (.i1h(w383), .i1l(w49), .i2h(1'b1), .i2l(w53), .i4h(w55), .i4l(w109), .o7(w110) );
	ym6045b_cell_1 g39 (.i2(w53), .o3(w111) );
	ym6045b_cell_18 g40 (.o1(w113), .i2(w111), .i3(w54), .i4(w55) );
	ym6045b_cell_10 g41 (.i2(w54), .o3(w114), .i4(w86) );
	ym6045b_cell_6 g42 (.o2(w115), .i3(w114), .i4(w113) );
	ym6045b_cell_4 g43 (.i1(w107), .i2(w52), .i3(w116), .o4(w117) );
	ym6045b_cell_4 g44 (.i1(w57), .i2(w52), .i3(w116), .o4(w118) );
	ym6045b_cell_2 g45 (.o2(w23), .i9(w62), .i11(w119), .i13(w118) );
	ym6045b_cell_10 g46 (.i2(w124), .o3(w54), .i4(w123) );
	ym6045b_cell_8 g47 (.o1(w125), .i2(w66), .i3(w84) );
	ym6045b_cell_8 g48 (.o1(w126), .i2(w125), .i3(w65) );
	ym6045b_cell_9 g49 (.i3(w128), .i4(w108), .i7(w130), .o13(w391) );
	ym6045b_cell_1 g50 (.i2(w390), .o3(w132) );
	ym6045b_cell_10 g51 (.i2(w390), .o3(w133), .i4(w137) );
	ym6045b_cell_10 g52 (.i2(w132), .o3(w134), .i4(w137) );
	ym6045b_cell_6 g53 (.o2(w389), .i3(w138), .i4(w139) );
	ym6045b_cell_23 g54 (.o5(w138), .i10(w139), .i11(w96) );
	ym6045b_cell_4 g55 (.i1(w52), .i2(w99), .i3(w141), .o4(w142) );
	ym6045b_cell_1 g56 (.i2(w139), .o3(w141) );
	ym6045b_cell_8 g57 (.o1(w116), .i2(w139), .i3(w31) );
	ym6045b_cell_6 g58 (.o2(w137), .i3(w148), .i4(w149) );
	ym6045b_cell_10 g59 (.i2(w377), .o3(w148), .i4(w150) );
	ym6045b_cell_10 g60 (.i2(w152), .o3(w149), .i4(w388) );
	ym6045b_cell_18 g61 (.o1(w189), .i2(w190), .i3(w53), .i4(w147) );
	ym6045b_cell_1 g62 (.i2(w385), .o3(w190) );
	ym6045b_cell_23 g63 (.o5(w191), .i10(w385), .i11(w151) );
	ym6045b_cell_23 g64 (.o5(w186), .i10(w191), .i11(w151) );
	ym6045b_cell_23 g65 (.o2(w124), .o5(w177), .i10(w186), .i11(w185) );
	ym6045b_cell_1 g66 (.i2(w151), .o3(w185) );
	ym6045b_cell_10 g67 (.i2(w5), .o3(w387), .i4(w184) );
	ym6045b_cell_1 g68 (.i2(w31), .o3(w184) );
	ym6045b_cell_10 g69 (.i2(w184), .o3(w174), .i4(w119) );
	ym6045b_cell_6 g70 (.o2(w104), .i3(w115), .i4(w179) );
	ym6045b_cell_23 g71 (.o5(w179), .i10(w115), .i11(w151) );
	ym6045b_cell_10 g72 (.i2(w31), .o3(w386), .i4(w5) );
	ym6045b_cell_12 g73 (.o1(w168), .i2(w165), .i3(w177), .i4(w123) );
	ym6045b_cell_1 g74 (.i2(w53), .o3(w165) );
	ym6045b_cell_10 g75 (.i2(w142), .o3(w176), .i4(w31) );
	ym6045b_cell_2 g76 (.o2(w171), .i9(w62), .i11(w119), .i13(w176) );
	ym6045b_cell_10 g77 (.i2(w171), .o3(w170), .i4(w145) );
	ym6045b_cell_5 g78 (.i1(w170), .i2(w169), .o3(w156) );
	ym6045b_cell_8 g79 (.o1(w167), .i2(w166), .i3(w168) );
	ym6045b_cell_8 g80 (.o1(w166), .i2(w165), .i3(w159) );
	ym6045b_cell_23 g81 (.o2(w163), .o5(w6), .i10(w162), .i11(w96) );
	ym6045b_cell_23 g82 (.o5(w159), .i10(w158), .i11(w96) );
	ym6045b_cell_4 g83 (.i1(w161), .i2(w159), .i3(w158), .o4(w162) );
	ym6045b_cell_23 g84 (.o2(w161), .i10(w160), .i11(w96) );
	ym6045b_cell_5 g85 (.i1(w158), .i2(w159), .o3(w160) );
	ym6045b_cell_5 g86 (.i1(w155), .i2(w5), .o3(w158) );
	ym6045b_cell_9 g87 (.i3(w96), .i4(w157), .i7(w156), .o11(w155), .o13(w153) );
	ym6045b_cell_8 g88 (.o1(w157), .i2(w126), .i3(w154) );
	ym6045b_cell_8 g89 (.o1(w154), .i2(w5), .i3(w153) );
	ym6045b_cell_9 g90 (.i3(w24), .i4(w25), .i7(w26), .o11(w25), .o13(w28) );
	ym6045b_cell_6 g91 (.o2(w26), .i3(w27), .i4(w108) );
	ym6045b_cell_10 g92 (.i2(w28), .o3(w29), .i4(w30) );
	ym6045b_cell_33 g93 (.o1(w18), .i2(w29) );
	ym6045b_cell_5 g94 (.i1(w39), .i2(w32), .o3(w27) );
	ym6045b_cell_23 g95 (.o2(w192), .o5(w33), .i10(w34), .i11(w10) );
	ym6045b_cell_12 g96 (.o1(w34), .i2(w33), .i3(w193), .i4(w31) );
	ym6045b_cell_20 g97 (.o1(w30), .i2(w42) );
	ym6045b_cell_1 g98 (.i2(w43), .o3(w24) );
	ym6045b_cell_10 g99 (.i2(w43), .o3(w42), .i4(w39) );
	ym6045b_cell_15 g100 (.o1(w194), .i2(w42), .i3(w44), .i4(w45) );
	ym6045b_cell_10 g101 (.i2(w5), .o3(w193), .i4(w46) );
	ym6045b_cell_10 g102 (.i2(w51), .o3(w199), .i4(w47) );
	ym6045b_cell_10 g103 (.i2(w5), .o3(w51), .i4(w200) );
	ym6045b_cell_1 g104 (.i2(w201), .o3(w52) );
	ym6045b_cell_4 g105 (.i1(w204), .i2(w56), .i3(w203), .o4(w201) );
	ym6045b_cell_3 g106 (.i2h(w58), .i2l(w204), .i3h(w57), .i3l(w203), .o4(w46) );
	ym6045b_cell_25 g107 (.i1(w40), .o2(w67), .o3(w56), .i6(w59), .o10(w58), .o11(w68) );
	ym6045b_cell_3 g108 (.i2h(w57), .i2l(w204), .i3h(w68), .i3l(w203), .o4(w196) );
	ym6045b_cell_3 g109 (.i2h(w67), .i2l(w204), .i3h(w57), .i3l(w203), .o4(w69) );
	ym6045b_cell_10 g110 (.i2(w5), .o3(w202), .i4(w69) );
	ym6045b_cell_1 g111 (.i2(w39), .o3(w70) );
	ym6045b_cell_6 g112 (.o2(w44), .i3(w206), .i4(w80) );
	ym6045b_cell_9 g113 (.i3(w10), .i4(w81), .i7(w62), .o11(w82), .o13(w83) );
	ym6045b_cell_12 g114 (.o1(w81), .i2(w66), .i3(w84), .i4(w85) );
	ym6045b_cell_30 g115 (.o2(w85), .i3(w83), .i4(w70), .i5(w207), .i6(w208) );
	ym6045b_cell_2 g116 (.o4(w93), .i9(w61), .i11(w205), .i13(w96) );
	ym6045b_cell_8 g117 (.o1(w21), .i2(w93), .i3(w94) );
	ym6045b_cell_9 g118 (.i3(w96), .i4(w97), .i7(w61), .o11(w94), .o13(w95) );
	ym6045b_cell_6 g119 (.o2(w80), .i3(w97), .i4(w95) );
	ym6045b_cell_1 g120 (.i2(w5), .o3(w100) );
	ym6045b_cell_1 g121 (.i2(w102), .o3(w103) );
	ym6045b_cell_6 g122 (.o2(w101), .i3(w102), .i4(w106) );
	ym6045b_cell_21 g123 (.o1(w106), .i2(w100), .i3(w104), .i4(w105), .i5(w209) );
	ym6045b_cell_1 g124 (.i2(w210), .o3(w105) );
	ym6045b_cell_23 g125 (.o5(w112), .i10(w102), .i11(w10) );
	ym6045b_cell_18 g126 (.o1(w213), .i2(w120), .i3(w104), .i4(w103) );
	ym6045b_cell_10 g127 (.i2(w112), .o3(w214), .i4(w104) );
	ym6045b_cell_18 g128 (.o1(w102), .i2(w104), .i3(w215), .i4(w120) );
	ym6045b_cell_23 g129 (.o5(w215), .i10(w101), .i11(w96) );
	ym6045b_cell_7 g130 (.o2(w121), .i3(w53) );
	ym6045b_cell_8 g131 (.o1(w84), .i2(w122), .i3(w121) );
	ym6045b_cell_1 g132 (.i2(w216), .o3(w122) );
	ym6045b_cell_2 g133 (.o4(w127), .i9(w217), .i11(w217), .i13(w128) );
	ym6045b_cell_2 g134 (.o2(w129), .i9(w217), .i11(w127), .i13(w128) );
	ym6045b_cell_8 g135 (.o1(w130), .i2(w131), .i3(w121) );
	ym6045b_cell_8 g136 (.o1(w131), .i2(w217), .i3(w121) );
	ym6045b_cell_2 g137 (.o4(w136), .i9(w217), .i11(w135), .i13(w219) );
	ym6045b_cell_2 g138 (.o2(w143), .o4(w135), .i9(w217), .i11(w140), .i13(w128) );
	ym6045b_cell_8 g139 (.o1(w144), .i2(w136), .i3(w143) );
	ym6045b_cell_8 g140 (.o1(w220), .i2(w144), .i3(w129) );
	ym6045b_cell_6 g141 (.o2(w66), .i3(w208), .i4(w146) );
	ym6045b_cell_10 g142 (.i2(w145), .o3(w11), .i4(w200) );
	ym6045b_cell_10 g143 (.i2(w218), .o3(w152), .i4(w104) );
	ym6045b_cell_23 g144 (.o5(w150), .i10(w152), .i11(w10) );
	ym6045b_cell_23 g145 (.o5(w188), .i10(w189), .i11(w151) );
	ym6045b_cell_6 g146 (.o2(w198), .i3(w189), .i4(w188) );
	ym6045b_cell_10 g147 (.i2(w104), .o3(w178), .i4(w187) );
	ym6045b_cell_8 g148 (.o1(w187), .i2(w102), .i3(w211) );
	ym6045b_cell_1 g149 (.i2(w53), .o3(w183) );
	ym6045b_cell_18 g150 (.o1(w39), .i2(w183), .i3(w210), .i4(w182) );
	ym6045b_cell_1 g151 (.i2(w223), .o3(w182) );
	ym6045b_cell_30 g152 (.o2(w146), .i3(w225), .i4(w181), .i5(w173), .i6(w226) );
	ym6045b_cell_14 g153 (.o3(w181), .i6(w10), .i7(1'b1), .i13(1'b0), .i14(w63), .o15(w222), .i18(w175) );
	ym6045b_cell_14 g154 (.o3(w173), .i6(w10), .i7(1'b1), .i13(1'b0), .i14(w63), .o15(w175), .i18(w228) );
	ym6045b_cell_35 g155 (.o1(w96), .i2(w10) );
	ym6045b_cell_6 g156 (.o2(w223), .i3(w221), .i4(w172) );
	ym6045b_cell_10 g157 (.i2(w223), .o3(w172), .i4(w210) );
	ym6045b_cell_6 g158 (.o2(w235), .i3(w236), .i4(w237) );
	ym6045b_cell_20 g159 (.o1(w236), .i2(w238) );
	ym6045b_cell_27 g160 (.o1(w238), .i2(w239) );
	ym6045b_cell_6 g161 (.o2(w244), .i3(w249), .i4(w18) );
	ym6045b_cell_18 g162 (.o1(w249), .i2(w239), .i3(w240), .i4(w250) );
	ym6045b_cell_1 g163 (.i2(w245), .o3(w250) );
	ym6045b_cell_10 g164 (.i2(w108), .o3(w239), .i4(w39) );
	ym6045b_cell_28 g165 (.i1(w23), .o2(w197), .i5(w239), .i6(w248) );
	ym6045b_cell_8 g166 (.o1(w255), .i2(w254), .i3(w23) );
	ym6045b_cell_18 g167 (.o1(w35), .i2(w255), .i3(w243), .i4(w256) );
	ym6045b_cell_10 g168 (.i2(w197), .o3(w37), .i4(w257) );
	ym6045b_cell_1 g169 (.i2(w240), .o3(w257) );
	ym6045b_cell_6 g170 (.o2(w195), .i3(w196), .i4(w198) );
	ym6045b_cell_10 g171 (.i2(w243), .o3(w260), .i4(w263) );
	ym6045b_cell_10 g172 (.i2(w259), .o3(w263), .i4(w237) );
	ym6045b_cell_10 g173 (.i2(w201), .o3(w264), .i4(w5) );
	ym6045b_cell_24 g174 (.i1h(w196), .i1l(w260), .i2h(w193), .i2l(w199), .i4h(w202), .i4l(w264), .o7(w261) );
	ym6045b_cell_23 g175 (.o5(w267), .i10(w266), .i11(w10) );
	ym6045b_cell_10 g176 (.i2(w266), .o3(w237), .i4(w267) );
	ym6045b_cell_6 g177 (.o2(w262), .i3(w14), .i4(w273) );
	ym6045b_cell_8 g178 (.o1(w254), .i2(w266), .i3(w205) );
	ym6045b_cell_6 g179 (.o2(w271), .i3(w14), .i4(w280) );
	ym6045b_cell_23 g180 (.o5(w279), .i10(w237), .i11(w96) );
	ym6045b_cell_10 g181 (.i2(w266), .o3(w206), .i4(w279) );
	ym6045b_cell_18 g182 (.o1(w266), .i2(w108), .i3(w87), .i4(w276) );
	ym6045b_cell_22 g183 (.i1(w53), .o2(w286), .i6(w49), .i7(w322), .i8(w90), .i9(w49), .o11(w281), .o12(w280), .i13(w90), .i14(w76), .i15(w71), .i17(w76), .o19(w273) );
	ym6045b_cell_6 g184 (.o2(w282), .i3(w281), .i4(w14) );
	ym6045b_cell_6 g185 (.o2(w287), .i3(w14), .i4(w286) );
	ym6045b_cell_5 g186 (.i1(w207), .i2(w108), .o3(w289) );
	ym6045b_cell_1 g187 (.i2(w290), .o3(w14) );
	ym6045b_cell_6 g188 (.o2(w321), .i3(w289), .i4(w288) );
	ym6045b_cell_4 g189 (.i1(w208), .i2(w82), .i3(w272), .o4(w288) );
	ym6045b_cell_9 g190 (.i3(w10), .i4(w321), .i7(w61), .o13(w97) );
	ym6045b_cell_6 g191 (.o2(w322), .i3(w86), .i4(w331) );
	ym6045b_cell_2 g192 (.o4(w331), .i9(w62), .i11(w326), .i13(w98) );
	ym6045b_cell_6 g193 (.o2(w332), .i3(w86), .i4(w323) );
	ym6045b_cell_10 g194 (.i2(w290), .o3(w333), .i4(w332) );
	ym6045b_cell_6 g195 (.o2(w334), .i3(w86), .i4(w212) );
	ym6045b_cell_1 g196 (.i2(w86), .o3(w290) );
	ym6045b_cell_10 g197 (.i2(w334), .o3(w335), .i4(w290) );
	ym6045b_cell_1 g198 (.i2(w65), .o3(w343) );
	ym6045b_cell_10 g199 (.i2(w120), .o3(w306), .i4(w215) );
	ym6045b_cell_21 g200 (.o1(w345), .i2(w119), .i3(w123), .i4(w53), .i5(w234) );
	ym6045b_cell_10 g201 (.i2(w245), .o3(w342), .i4(w123) );
	ym6045b_cell_10 g202 (.i2(w345), .o3(w291), .i4(w119) );
	ym6045b_cell_38 g203 (.o2(w347), .i10(w343), .i12(w346) );
	ym6045b_cell_7 g204 (.o2(w217), .i3(w62) );
	ym6045b_cell_38 g205 (.o2(w354), .i10(w343), .i12(w347) );
	ym6045b_cell_38 g206 (.o2(w355), .i10(w343), .i12(w352) );
	ym6045b_cell_1 g207 (.i2(w356), .o3(w219) );
	ym6045b_cell_38 g208 (.o2(w352), .i10(w343), .i12(w354) );
	ym6045b_cell_38 g209 (.o2(w128), .i10(w217), .i12(w355) );
	ym6045b_cell_8 g210 (.o1(w356), .i2(w314), .i3(w82) );
	ym6045b_cell_15 g211 (.o1(w316), .i2(w208), .i3(w208), .i4(w220) );
	ym6045b_cell_14 g212 (.o3(w359), .i6(w10), .i7(1'b1), .i13(1'b0), .i14(w63), .i18(w363) );
	ym6045b_cell_14 g213 (.o3(w361), .i6(w10), .i7(1'b1), .i13(1'b0), .i14(w63), .o15(w363), .i18(w320) );
	ym6045b_cell_14 g214 (.o3(w225), .i6(w10), .i7(1'b1), .i13(w53), .i14(w63), .i18(w222) );
	ym6045b_cell_14 g215 (.o3(w226), .i6(w10), .i7(1'b1), .i13(1'b0), .i14(w63), .o15(w228), .i18(w316) );
	ym6045b_cell_8 g216 (.o1(w314), .i2(w121), .i3(w310) );
	ym6045b_cell_26 g217 (.i2(w231), .i4(w234), .o5(w240) );
	ym6045b_cell_6 g218 (.o2(w230), .i3(w241), .i4(w242) );
	ym6045b_cell_18 g219 (.o1(w241), .i2(w240), .i3(w243), .i4(w245) );
	ym6045b_cell_18 g220 (.o1(w242), .i2(w240), .i3(w248), .i4(w245) );
	ym6045b_cell_1 g221 (.i2(w53), .o3(w246) );
	ym6045b_cell_18 g222 (.o1(w243), .i2(w246), .i3(w5), .i4(w108) );
	ym6045b_cell_15 g223 (.o1(w233), .i2(w21), .i3(w244), .i4(w232) );
	ym6045b_cell_9 g224 (.i3(w24), .i4(w108), .i7(w251), .o13(w252) );
	ym6045b_cell_15 g225 (.o1(w253), .i2(w108), .i3(w252), .i4(w24) );
	ym6045b_cell_10 g226 (.i2(w253), .o3(w248), .i4(w39) );
	ym6045b_cell_1 g227 (.i2(w39), .o3(w251) );
	ym6045b_cell_1 g228 (.i2(w243), .o3(w365) );
	ym6045b_cell_3 g229 (.i2h(w254), .i2l(w245), .i3h(w256), .i3l(w365), .o4(w232) );
	ym6045b_cell_1 g230 (.i2(w240), .o3(w256) );
	ym6045b_cell_1 g231 (.i2(w229), .o3(w120) );
	ym6045b_cell_9 g232 (.i3(w10), .i4(w265), .i7(w61), .o11(w259), .o13(w258) );
	ym6045b_cell_23 g233 (.o2(w65), .o5(w62), .i10(w229), .i11(w10) );
	ym6045b_cell_5 g234 (.i1(w259), .i2(w268), .o3(w269) );
	ym6045b_cell_6 g235 (.o2(w265), .i3(w269), .i4(w270) );
	ym6045b_cell_10 g236 (.i2(w108), .o3(w270), .i4(w272) );
	ym6045b_cell_23 g237 (.o2(w205), .o5(w268), .i10(w274), .i11(w96) );
	ym6045b_cell_10 g238 (.i2(w258), .o3(w274), .i4(w206) );
	ym6045b_cell_2 g239 (.o2(w272), .o4(w207), .i9(w82), .i11(w82), .i13(w275) );
	ym6045b_cell_1 g240 (.i2(w276), .o3(w275) );
	ym6045b_cell_21 g241 (.o1(w278), .i2(w277), .i3(w77), .i4(w41), .i5(w75) );
	ym6045b_cell_10 g242 (.i2(w5), .o3(w276), .i4(w283) );
	ym6045b_cell_1 g243 (.i2(w53), .o3(w283) );
	ym6045b_cell_12 g244 (.o1(w204), .i2(w285), .i3(w284), .i4(w278) );
	ym6045b_cell_18 g245 (.o1(w200), .i2(w203), .i3(w285), .i4(w284) );
	ym6045b_cell_1 g246 (.i2(w234), .o3(w366) );
	ym6045b_cell_3 g247 (.i2h(w53), .i2l(w108), .i3h(w245), .i3l(w366), .o4(w285) );
	ym6045b_cell_17 g248 (.i2(w62), .o3(w326), .o10(w330), .o16(w329), .o23(w328), .o29(w325), .o36(w324), .o42(w323), .o49(w212), .i56(w247), .i57(w98) );
	ym6045b_cell_6 g249 (.o2(w336), .i3(w86), .i4(w329) );
	ym6045b_cell_6 g250 (.o2(w341), .i3(w86), .i4(w324) );
	ym6045b_cell_6 g251 (.o2(w340), .i3(w86), .i4(w330) );
	ym6045b_cell_6 g252 (.o2(w327), .i3(w86), .i4(w326) );
	ym6045b_cell_22 g253 (.i1(w53), .o2(w369), .i6(w147), .i7(w344), .i8(w123), .i9(w336), .o11(w339), .o12(w338), .i13(w340), .i14(w342), .i15(w8), .i17(w327), .o19(w337) );
	ym6045b_cell_6 g254 (.o2(w344), .i3(w86), .i4(w328) );
	ym6045b_cell_6 g255 (.o2(w348), .i3(w86), .i4(w325) );
	ym6045b_cell_21 g256 (.o1(w284), .i2(w367), .i3(w368), .i4(w370), .i5(w371) );
	ym6045b_cell_23 g257 (.o5(w218), .i10(w214), .i11(w10) );
	ym6045b_cell_1 g258 (.i2(w65), .o3(w349) );
	ym6045b_cell_10 g259 (.i2(w350), .o3(w346), .i4(w351) );
	ym6045b_cell_38 g260 (.o2(w351), .i10(w349), .i12(w353) );
	ym6045b_cell_38 g261 (.o2(w353), .i10(w349), .i12(w357) );
	ym6045b_cell_8 g262 (.o1(w350), .i2(w121), .i3(w311) );
	ym6045b_cell_22 g263 (.i1(w53), .o2(w376), .i6(1'b0), .i7(w335), .i8(1'b0), .i9(w333), .o11(w375), .o12(w373), .i13(w341), .i14(1'b0), .i15(w169), .i17(w348), .o19(w372) );
	ym6045b_cell_38 g264 (.o2(w357), .i10(w349), .i12(w360) );
	ym6045b_cell_38 g265 (.o2(w360), .i10(w349), .i12(w356) );
	ym6045b_cell_30 g266 (.o2(w362), .i3(w359), .i4(w361), .i5(w317), .i6(w313) );
	ym6045b_cell_6 g267 (.o2(w208), .i3(1'b1), .i4(w362) );
	ym6045b_cell_14 g268 (.o3(w317), .i6(w10), .i7(1'b1), .i13(1'b0), .i14(w63), .o15(w320), .i18(w319) );
	ym6045b_cell_15 g269 (.o1(w318), .i2(w63), .i3(1'b1), .i4(1'b1) );
	ym6045b_cell_14 g270 (.o3(w313), .i6(w10), .i7(1'b1), .i13(1'b0), .i14(w63), .o15(w319), .i18(w318) );
	ym6045b_cell_7 g271 (.o2(w374), .i3(w306) );
	ym6045b_cell_6 g272 (.o2(w221), .i3(w53), .i4(w306) );
	ym6045b_cell_1 g273 (.i2(w308), .o3(w311) );
	ym6045b_cell_1 g274 (.i2(w309), .o3(w310) );
	ym6045b_cell_25 g275 (.i1(w304), .o2(w307), .o3(w308), .i6(w305), .o10(w309), .o11(w216) );
	ym6045b_cell_5 g276 (.i1(w307), .i2(w221), .o3(w293) );
	ym6045b_cell_7 g277 (.o2(w297), .i3(w306) );
	ym6045b_cell_23 g278 (.o5(w295), .i10(w213), .i11(w10) );
	ym6045b_cell_5 g279 (.i1(w261), .i2(w293), .o3(w292) );
	ym6045b_cell_28 g280 (.i1(w53), .o2(w169), .i5(w220), .i6(w301) );
	ym6045b_cell_2 g281 (.o4(w301), .i9(w220), .i11(w119), .i13(w117) );
	ym6045b_cell_6 g282 (.o2(w303), .i3(w53), .i4(w220) );
	ym6045b_cell_10 g283 (.i2(w5), .o3(w302), .i4(w293) );
	ym6045b_cell_4 g284 (.i1(w300), .i2(w299), .i3(w163), .o4(w180) );
	ym6045b_cell_23 g285 (.o5(w300), .i10(w299), .i11(w10) );
	ym6045b_cell_5 g286 (.i1(w298), .i2(w139), .o3(w299) );
endmodule // ym6045b

// Module Definitions [It is possible to wrap here on your primitives]

module ym6045b_cell_23 (  o2, o5, i10, i11);

	output wire o2;
	output wire o5;
	input wire i10;
	input wire i11;

endmodule // ym6045b_cell_23

module ym6045b_cell_18 (  o1, i2, i3, i4);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;

endmodule // ym6045b_cell_18

module ym6045b_cell_6 (  o2, i3, i4);

	output wire o2;
	input wire i3;
	input wire i4;

endmodule // ym6045b_cell_6

module ym6045b_cell_10 (  i2, o3, i4);

	input wire i2;
	output wire o3;
	input wire i4;

endmodule // ym6045b_cell_10

module ym6045b_cell_21 (  o1, i2, i3, i4, i5);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;
	input wire i5;

endmodule // ym6045b_cell_21

module ym6045b_cell_20 (  o1, i2);

	output wire o1;
	input wire i2;

endmodule // ym6045b_cell_20

module ym6045b_cell_5 (  i1, i2, o3);

	input wire i1;
	input wire i2;
	output wire o3;

endmodule // ym6045b_cell_5

module ym6045b_cell_7 (  o2, i3);

	output wire o2;
	input wire i3;

endmodule // ym6045b_cell_7

module ym6045b_cell_8 (  o1, i2, i3);

	output wire o1;
	input wire i2;
	input wire i3;

endmodule // ym6045b_cell_8

module ym6045b_cell_22 (  i1, o2, i6, i7, i8, i9, o11, o12, i13, i14, i15, i17, o19);

	input wire i1;
	output wire o2;
	input wire i6;
	input wire i7;
	input wire i8;
	input wire i9;
	output wire o11;
	output wire o12;
	input wire i13;
	input wire i14;
	input wire i15;
	input wire i17;
	output wire o19;

endmodule // ym6045b_cell_22

module ym6045b_cell_24 (  i1h, i1l, i2h, i2l, i4h, i4l, o7);

	input wire i1h;
	input wire i1l;
	input wire i2h;
	input wire i2l;
	input wire i4h;
	input wire i4l;
	output wire o7;

endmodule // ym6045b_cell_24

module ym6045b_cell_1 (  i2, o3);

	input wire i2;
	output wire o3;

endmodule // ym6045b_cell_1

module ym6045b_cell_9 (  i3, i4, i7, o11, o13);

	input wire i3;
	input wire i4;
	input wire i7;
	output wire o11;
	output wire o13;

endmodule // ym6045b_cell_9

module ym6045b_cell_3 (  i2h, i2l, i3h, i3l, o4);

	input wire i2h;
	input wire i2l;
	input wire i3h;
	input wire i3l;
	output wire o4;

endmodule // ym6045b_cell_3

module ym6045b_cell_25 (  i1, o2, o3, i6, o10, o11);

	input wire i1;
	output wire o2;
	output wire o3;
	input wire i6;
	output wire o10;
	output wire o11;

endmodule // ym6045b_cell_25

module ym6045b_cell_4 (  i1, i2, i3, o4);

	input wire i1;
	input wire i2;
	input wire i3;
	output wire o4;

endmodule // ym6045b_cell_4

module ym6045b_cell_2 (  o2, o4, i9, i11, i13);

	output wire o2;
	output wire o4;
	input wire i9;
	input wire i11;
	input wire i13;

endmodule // ym6045b_cell_2

module ym6045b_cell_12 (  o1, i2, i3, i4);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;

endmodule // ym6045b_cell_12

module ym6045b_cell_33 (  o1, i2);

	output wire o1;
	input wire i2;

endmodule // ym6045b_cell_33

module ym6045b_cell_15 (  o1, i2, i3, i4);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;

endmodule // ym6045b_cell_15

module ym6045b_cell_30 (  o2, i3, i4, i5, i6);

	output wire o2;
	input wire i3;
	input wire i4;
	input wire i5;
	input wire i6;

endmodule // ym6045b_cell_30

module ym6045b_cell_14 (  o2, o3, i6, i7, i13, i14, o15, i18);

	output wire o2;
	output wire o3;
	input wire i6;
	input wire i7;
	input wire i13;
	input wire i14;
	output wire o15;
	input wire i18;

endmodule // ym6045b_cell_14

module ym6045b_cell_35 (  o1, i2);

	output wire o1;
	input wire i2;

endmodule // ym6045b_cell_35

module ym6045b_cell_27 (  o1, i2);

	output wire o1;
	input wire i2;

endmodule // ym6045b_cell_27

module ym6045b_cell_28 (  i1, o2, i5, i6);

	input wire i1;
	output wire o2;
	input wire i5;
	input wire i6;

endmodule // ym6045b_cell_28

module ym6045b_cell_38 (  o1, o2, i10, i12);

	output wire o1;
	output wire o2;
	input wire i10;
	input wire i12;

endmodule // ym6045b_cell_38

module ym6045b_cell_26 (  i2, i4, o5);

	input wire i2;
	input wire i4;
	output wire o5;

endmodule // ym6045b_cell_26

module ym6045b_cell_17 (  i2, o3, o10, o16, o23, o29, o36, o42, o49, i56, i57);

	input wire i2;
	output wire o3;
	output wire o10;
	output wire o16;
	output wire o23;
	output wire o29;
	output wire o36;
	output wire o42;
	output wire o49;
	input wire i56;
	input wire i57;

endmodule // ym6045b_cell_17

