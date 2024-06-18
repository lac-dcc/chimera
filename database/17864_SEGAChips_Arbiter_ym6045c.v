// This program was cloned from: https://github.com/emu-russia/SEGAChips
// License: Creative Commons Zero v1.0 Universal

module ym6045c (  VA8_o, VA8_d, VA8_i, VA9_o, VA9_d, VA9_i, VA10_o, VA10_d, VA10_i, VA11_o, VA11_d, VA11_i, VA12_o, VA12_d, VA12_i, VA13_o, VA13_d, VA13_i, VA14_o, VA14_d, VA14_i, VA15_o, VA15_d, VA15_i, VA16_o, VA16_d, VA16_i, VA17_o, VA17_d, VA17_i, VA18_o, VA18_d, VA18_i, VA19_o, VA19_d, VA19_i, VA20_o, VA20_d, VA20_i, VA21_o, VA21_d, VA21_i, VA22_o, VA22_d, VA22_i, VA23_o, VA23_d, VA23_i, FC0, FC1, n_VPA, n_RESET, n_HALT, D8_o, D8_d, D8_i, VCLK, n_TIME, n_CAS0, n_DTACK_o, n_DTACK_d, n_DTACK_i, RW_i, RW_d, RW_o, n_LDS_o, n_LDS_d, n_LDS_i, n_UDS_i, n_UDS_d, n_UDS_o, n_AS_o, n_AS_d, n_AS_i, n_INTAK, n_VDPM, n_BG, n_BGACK_i, n_BGACK_d, n_BGACK_o, n_BR, i_EOE, IA14, n_NOE, EDCK, n_OE0, n_HSYNC, MCLK, TPAL, n_SOUND, ZCLK, n_WRES, n_ZRAM, n_REF, n_M1, n_ZRES, n_ZBR, n_WAIT_o, n_WAIT_d, n_WAIT_i, n_ZBAK, n_ZWR_o, n_ZWR_d, n_ZWR_i, n_ZRD_i, n_ZRD_d, n_ZRD_o, n_IREQ, n_MREQ_i, n_MREQ_d, n_MREQ_o, n_NMI, n_ZA0_i, n_ZA0_d, n_ZA0_o, ZA7, ZA8_i, ZA8_d, ZA8_o, ZA9_o, ZA9_d, ZA9_i, ZA10_i, ZA10_d, ZA10_o, ZA11_o, ZA11_d, ZA11_i, ZA12_o, ZA12_d, ZA12_i, ZA13_i, ZA13_d, ZA13_o, ZA14_o, ZA14_d, ZA14_i, ZA15_i, ZA15_d, ZA15_o, ZD0, n_FDWR, n_FDC, n_ROM, n_ASEL, n_CAS2, n_RAS2, n_CE0, n_VTOZ, n_ZTOV, n_SRES, n_IO, n_M3, n_CART, pin99, pin100);

	output wire VA8_o;
	output wire VA8_d;
	input wire VA8_i;
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
	output wire n_VPA;
	output wire n_RESET;
	output wire n_HALT;
	output wire D8_o;
	output wire D8_d;
	input wire D8_i;
	input wire VCLK;
	output wire n_TIME;
	input wire n_CAS0;
	output wire n_DTACK_o;
	output wire n_DTACK_d;
	input wire n_DTACK_i;
	input wire RW_i;
	output wire RW_d;
	output wire RW_o;
	output wire n_LDS_o;
	output wire n_LDS_d;
	input wire n_LDS_i;
	input wire n_UDS_i;
	output wire n_UDS_d;
	output wire n_UDS_o;
	output wire n_AS_o;
	output wire n_AS_d;
	input wire n_AS_i;
	output wire n_INTAK;
	output wire n_VDPM;
	input wire n_BG;
	input wire n_BGACK_i;
	output wire n_BGACK_d;
	output wire n_BGACK_o;
	output wire n_BR;
	output wire i_EOE;
	output wire IA14;
	output wire n_NOE;
	output wire EDCK;
	input wire n_OE0;
	input wire n_HSYNC;
	input wire MCLK;
	input wire TPAL;
	output wire n_SOUND;
	input wire ZCLK;
	input wire n_WRES;
	output wire n_ZRAM;
	output wire n_REF;
	input wire n_M1;
	output wire n_ZRES;
	output wire n_ZBR;
	output wire n_WAIT_o;
	output wire n_WAIT_d;
	input wire n_WAIT_i;
	input wire n_ZBAK;
	output wire n_ZWR_o;
	output wire n_ZWR_d;
	input wire n_ZWR_i;
	input wire n_ZRD_i;
	output wire n_ZRD_d;
	output wire n_ZRD_o;
	input wire n_IREQ;
	input wire n_MREQ_i;
	output wire n_MREQ_d;
	output wire n_MREQ_o;
	output wire n_NMI;
	input wire n_ZA0_i;
	output wire n_ZA0_d;
	output wire n_ZA0_o;
	input wire ZA7;
	input wire ZA8_i;
	output wire ZA8_d;
	output wire ZA8_o;
	output wire ZA9_o;
	output wire ZA9_d;
	input wire ZA9_i;
	input wire ZA10_i;
	output wire ZA10_d;
	output wire ZA10_o;
	output wire ZA11_o;
	output wire ZA11_d;
	input wire ZA11_i;
	output wire ZA12_o;
	output wire ZA12_d;
	input wire ZA12_i;
	input wire ZA13_i;
	output wire ZA13_d;
	output wire ZA13_o;
	output wire ZA14_o;
	output wire ZA14_d;
	input wire ZA14_i;
	input wire ZA15_i;
	output wire ZA15_d;
	output wire ZA15_o;
	input wire ZD0;
	output wire n_FDWR;
	output wire n_FDC;
	output wire n_ROM;
	output wire n_ASEL;
	output wire n_CAS2;
	output wire n_RAS2;
	output wire n_CE0;
	output wire n_VTOZ;
	output wire n_ZTOV;
	input wire n_SRES;
	output wire n_IO;
	input wire n_M3;
	input wire n_CART;
	output wire pin99;
	output wire pin100;

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
	wire w395;
	wire w396;
	wire w397;
	wire w398;
	wire w399;
	wire w400;
	wire w401;
	wire w402;
	wire w403;
	wire w404;
	wire w405;
	wire w406;
	wire w407;
	wire w408;
	wire w409;
	wire w410;
	wire w411;
	wire w412;
	wire w413;
	wire w414;
	wire w415;
	wire w416;
	wire w417;
	wire w418;
	wire w419;
	wire w420;
	wire w421;
	wire w422;
	wire w423;
	wire w424;
	wire w425;
	wire w426;
	wire w427;
	wire w428;
	wire w429;
	wire w430;
	wire w431;
	wire w432;
	wire w433;
	wire w434;
	wire w435;
	wire w436;
	wire w437;
	wire w438;
	wire w439;
	wire w440;
	wire w441;
	wire w442;
	wire w443;
	wire w444;
	wire w445;
	wire w446;
	wire w447;
	wire w448;
	wire w449;
	wire w450;
	wire w451;
	wire w452;
	wire w453;
	wire w454;
	wire w455;
	wire w456;
	wire w457;
	wire w458;
	wire w459;
	wire w460;
	wire w461;
	wire w462;
	wire w463;
	wire w464;
	wire w465;
	wire w466;
	wire w467;

	assign VA8_o = w451;
	assign VA8_d = w461;
	assign w92 = VA8_i;
	assign VA9_o = w452;
	assign VA9_d = w461;
	assign w51 = VA9_i;
	assign VA10_o = w453;
	assign VA10_d = w461;
	assign w62 = VA10_i;
	assign VA11_o = w450;
	assign VA11_d = w461;
	assign w61 = VA11_i;
	assign VA12_o = w454;
	assign VA12_d = w461;
	assign w299 = VA12_i;
	assign VA13_o = w455;
	assign VA13_d = w461;
	assign w314 = VA13_i;
	assign VA14_o = w456;
	assign VA14_d = w461;
	assign w110 = VA14_i;
	assign VA15_o = w457;
	assign VA15_d = w461;
	assign w365 = VA15_i;
	assign VA16_o = w465;
	assign VA16_d = w461;
	assign w113 = VA16_i;
	assign VA17_o = w354;
	assign VA17_d = w461;
	assign w370 = VA17_i;
	assign VA18_o = w458;
	assign VA18_d = w461;
	assign w372 = VA18_i;
	assign VA19_o = w459;
	assign VA19_d = w461;
	assign w371 = VA19_i;
	assign VA20_o = w467;
	assign VA20_d = w461;
	assign w381 = VA20_i;
	assign VA21_o = w397;
	assign VA21_d = w462;
	assign w23 = VA21_i;
	assign VA22_o = w396;
	assign VA22_d = w462;
	assign w294 = VA22_i;
	assign VA23_o = w460;
	assign VA23_d = w462;
	assign w66 = VA23_i;
	assign w399 = FC0;
	assign w398 = FC1;
	assign n_VPA = w400;
	assign n_RESET = w463;
	assign n_HALT = w463;
	assign D8_o = w71;
	assign D8_d = w413;
	assign w190 = D8_i;
	assign w188 = VCLK;
	assign n_TIME = w289;
	assign w291 = n_CAS0;
	assign n_DTACK_o = w162;
	assign n_DTACK_d = w161;
	assign w220 = n_DTACK_i;
	assign w56 = RW_i;
	assign RW_d = w160;
	assign RW_o = w63;
	assign n_LDS_o = w120;
	assign n_LDS_d = w464;
	assign w191 = n_LDS_i;
	assign w192 = n_UDS_i;
	assign n_UDS_d = w464;
	assign n_UDS_o = w116;
	assign n_AS_o = w122;
	assign n_AS_d = w464;
	assign w82 = n_AS_i;
	assign n_INTAK = w280;
	assign n_VDPM = w121;
	assign w126 = n_BG;
	assign w217 = n_BGACK_i;
	assign n_BGACK_d = w119;
	assign n_BGACK_o = w115;
	assign n_BR = w117;
	assign i_EOE = w151;
	assign IA14 = w153;
	assign n_NOE = w158;
	assign EDCK = w155;
	assign w112 = n_OE0;
	assign w100 = n_HSYNC;
	assign w149 = MCLK;
	assign w118 = TPAL;
	assign n_SOUND = w108;
	assign w157 = ZCLK;
	assign w67 = n_WRES;
	assign n_ZRAM = w69;
	assign n_REF = w96;
	assign w104 = n_M1;
	assign n_ZRES = w94;
	assign n_ZBR = w93;
	assign n_WAIT_o = w68;
	assign n_WAIT_d = w105;
	assign w111 = n_WAIT_i;
	assign w71 = n_ZBAK;
	assign n_ZWR_o = w75;
	assign n_ZWR_d = w70;
	assign w63 = n_ZWR_i;
	assign w102 = n_ZRD_i;
	assign n_ZRD_d = w70;
	assign n_ZRD_o = w95;
	assign w109 = n_IREQ;
	assign w125 = n_MREQ_i;
	assign n_MREQ_d = w70;
	assign n_MREQ_o = w103;
	assign n_NMI = w74;
	assign w123 = n_ZA0_i;
	assign n_ZA0_d = w70;
	assign n_ZA0_o = w73;
	assign w20 = ZA7;
	assign w27 = ZA8_i;
	assign ZA8_d = w70;
	assign ZA8_o = w92;
	assign ZA9_o = w51;
	assign ZA9_d = w70;
	assign w21 = ZA9_i;
	assign w19 = ZA10_i;
	assign ZA10_d = w70;
	assign ZA10_o = w62;
	assign ZA11_o = w61;
	assign ZA11_d = w70;
	assign w39 = ZA11_i;
	assign ZA12_o = w299;
	assign ZA12_d = w70;
	assign w40 = ZA12_i;
	assign w55 = ZA13_i;
	assign ZA13_d = w70;
	assign ZA13_o = w314;
	assign ZA14_o = w110;
	assign ZA14_d = w70;
	assign w239 = ZA14_i;
	assign w34 = ZA15_i;
	assign ZA15_d = w70;
	assign ZA15_o = w1;
	assign w245 = ZD0;
	assign n_FDWR = w50;
	assign n_FDC = w91;
	assign n_ROM = w29;
	assign n_ASEL = w2;
	assign n_CAS2 = w49;
	assign n_RAS2 = w64;
	assign n_CE0 = w22;
	assign n_VTOZ = w70;
	assign n_ZTOV = w281;
	assign w107 = n_SRES;
	assign n_IO = w106;
	assign w37 = n_M3;
	assign w300 = n_CART;
	assign pin99 = w83;
	assign pin100 = w326;

	// Instances

	ym6045c_cell_1 g1 (.i2(w140), .o3(w158) );
	ym6045c_cell_6 g2 (.o2(w148), .i3(w142), .i4(w144) );
	ym6045c_cell_5 g3 (.i1(w37), .i2(w128), .o3(w151) );
	ym6045c_cell_7 g4 (.o2(w156), .i3(w152) );
	ym6045c_cell_5 g5 (.i1(w110), .i2(w37), .o3(w153) );
	ym6045c_cell_4 g6 (.i1(w143), .i2(w150), .i3(w141), .o4(w139) );
	ym6045c_cell_16 g7 (.o2(w97), .i4(w142) );
	ym6045c_cell_14 g8 (.o2(w144), .o3(w143), .i6(w149), .i7(w114), .i13(w154), .i14(w139), .i18(1'b1) );
	ym6045c_cell_14 g9 (.o3(w150), .i6(w149), .i7(w114), .i13(1'b1), .i14(w139), .i18(w148) );
	ym6045c_cell_1 g10 (.i2(w97), .o3(w99) );
	ym6045c_cell_1 g11 (.i2(w100), .o3(w101) );
	ym6045c_cell_7 g12 (.o2(w114), .i3(w107) );
	ym6045c_cell_29 g13 (.o1(w65), .i2(w66), .i3(w23), .i4(w113), .i5(1'b1), .i6(w110), .i7(w207) );
	ym6045c_cell_7 g14 (.o2(w130), .i3(w97) );
	ym6045c_cell_30 g15 (.o2(w134), .i3(w136), .i4(w135), .i5(w129), .i6(w137) );
	ym6045c_cell_14 g16 (.o3(w136), .i6(w130), .i7(w132), .i13(1'b0), .i14(w124), .i18(w133) );
	ym6045c_cell_14 g17 (.o3(w135), .i6(w130), .i7(w132), .i13(1'b0), .i14(w124), .o15(w133), .i18(w145) );
	ym6045c_cell_14 g18 (.o3(w137), .i6(w130), .i7(w132), .i13(1'b0), .i14(w124), .o15(w145), .i18(w131) );
	ym6045c_cell_14 g19 (.o2(w142), .o3(w141), .i6(w149), .i7(w114), .i13(1'b0), .i14(w139), .i18(w144) );
	ym6045c_cell_9 g20 (.i3(w97), .i4(w134), .i7(w132), .o11(w127) );
	ym6045c_cell_31 g21 (.i2(w99), .i3(w101), .i4(1'b0), .i13(w156), .o16(w124), .o17(w154) );
	ym6045c_cell_32 g22 (.i1(w97), .o2(w155) );
	ym6045c_cell_27 g23 (.i2(1'b0) );
	ym6045c_cell_33 g24 (.i2(1'b0) );
	ym6045c_cell_6 g25 (.o2(w2), .i3(w3), .i4(w4) );
	ym6045c_cell_34 g26 (.o1(w3), .i2(w11) );
	ym6045c_cell_19 g27 (.o1(w22), .i2(w5), .i3(w14), .i4(w7), .i5(w15) );
	ym6045c_cell_10 g28 (.i2(w8), .o3(w7), .i4(w13) );
	ym6045c_cell_8 g29 (.o1(w12), .i2(w9), .i3(w13) );
	ym6045c_cell_18 g30 (.o1(w5), .i2(w12), .i3(w16), .i4(w18) );
	ym6045c_cell_1 g31 (.i2(w16), .o3(w6) );
	ym6045c_cell_3 g32 (.i2h(w6), .i2l(w9), .i3h(w23), .i3l(w18), .o4(w17) );
	ym6045c_cell_15 g33 (.o1(w64), .i2(w17), .i3(w8), .i4(w10) );
	ym6045c_cell_27 g34 (.o1(w11), .i2(w36) );
	ym6045c_cell_18 g35 (.o1(w14), .i2(w37), .i3(w34), .i4(w35) );
	ym6045c_cell_1 g36 (.i2(w27), .o3(w30) );
	ym6045c_cell_1 g37 (.i2(w19), .o3(w32) );
	ym6045c_cell_24 g38 (.i1h(w26), .i1l(w30), .i2h(w25), .i2l(w32), .i4h(1'b1), .i4l(w31), .o7(w38) );
	ym6045c_cell_1 g39 (.i2(w40), .o3(w25) );
	ym6045c_cell_1 g40 (.i2(w39), .o3(w31) );
	ym6045c_cell_24 g41 (.i1h(w27), .i1l(w19), .i2h(w21), .i2l(w39), .i4h(1'b1), .i4l(w40), .o7(w33) );
	ym6045c_cell_1 g42 (.i2(w21), .o3(w26) );
	ym6045c_cell_6 g43 (.o2(w29), .i3(w43), .i4(w248) );
	ym6045c_cell_15 g44 (.o1(w49), .i2(w54), .i3(w279), .i4(w87) );
	ym6045c_cell_21 g45 (.o1(w54), .i2(w239), .i3(w35), .i4(w60), .i5(w37) );
	ym6045c_cell_23 g46 (.o2(w50), .o5(w53), .i10(w52), .i11(w188) );
	ym6045c_cell_12 g47 (.o1(w52), .i2(w53), .i3(w91), .i4(w56) );
	ym6045c_cell_1 g48 (.i2(w34), .o3(w60) );
	ym6045c_cell_10 g49 (.i2(w59), .o3(w58), .i4(w33) );
	ym6045c_cell_6 g50 (.o2(w41), .i3(w57), .i4(w58) );
	ym6045c_cell_3 g51 (.i2h(w37), .i2l(w239), .i3h(w55), .i3l(w60), .o4(w59) );
	ym6045c_cell_21 g52 (.o1(w236), .i2(w63), .i3(w35), .i4(w59), .i5(w38) );
	ym6045c_cell_2 g53 (.o4(w57), .i9(w247), .i11(w237), .i13(w236) );
	ym6045c_cell_33 g54 (.o1(w44), .i2(w238) );
	ym6045c_cell_9 g55 (.i3(w235), .i4(w66), .i7(w234), .o13(w74) );
	ym6045c_cell_10 g56 (.i2(w56), .o3(w75), .i4(w82) );
	ym6045c_cell_6 g57 (.o2(w73), .i3(w192), .i4(w233) );
	ym6045c_cell_23 g58 (.o5(w233), .i10(w192), .i11(w193) );
	ym6045c_cell_1 g59 (.i2(w55), .o3(w76) );
	ym6045c_cell_1 g60 (.i2(w35), .o3(w78) );
	ym6045c_cell_5 g61 (.i1(w65), .i2(w244), .o3(w90) );
	ym6045c_cell_24 g62 (.i1h(w76), .i1l(w60), .i2h(w78), .i2l(w239), .i4h(1'b1), .i4l(w37), .o7(w108) );
	ym6045c_cell_3 g63 (.i2h(w78), .i2l(w37), .i3h(w72), .i3l(w60), .o4(w69) );
	ym6045c_cell_1 g64 (.i2(w239), .o3(w72) );
	ym6045c_cell_10 g65 (.i2(w71), .o3(w70), .i4(w258) );
	ym6045c_cell_2 g66 (.o2(w275), .o4(w260), .i9(w259), .i11(w67), .i13(w235) );
	ym6045c_cell_2 g67 (.o4(w264), .i9(w259), .i11(w260), .i13(w262) );
	ym6045c_cell_8 g68 (.o1(w261), .i2(w264), .i3(w275) );
	ym6045c_cell_6 g69 (.o2(w106), .i3(w175), .i4(w278) );
	ym6045c_cell_18 g70 (.o1(w267), .i2(w265), .i3(w37), .i4(w109) );
	ym6045c_cell_6 g71 (.o2(w278), .i3(w267), .i4(w266) );
	ym6045c_cell_23 g72 (.o5(w266), .i10(w267), .i11(w157) );
	ym6045c_cell_8 g73 (.o1(w269), .i2(w192), .i3(w56) );
	ym6045c_cell_1 g74 (.i2(w104), .o3(w265) );
	ym6045c_cell_23 g75 (.o2(w295), .o5(w247), .i10(w107), .i11(w188) );
	ym6045c_cell_10 g76 (.i2(w82), .o3(w95), .i4(w185) );
	ym6045c_cell_8 g77 (.o1(w183), .i2(w184), .i3(w82) );
	ym6045c_cell_2 g78 (.o2(w93), .i9(w247), .i11(w190), .i13(w186) );
	ym6045c_cell_10 g79 (.i2(w56), .o3(w186), .i4(w179) );
	ym6045c_cell_4 g80 (.i1(w187), .i2(w168), .i3(w189), .o4(w103) );
	ym6045c_cell_23 g81 (.o5(w189), .i10(w168), .i11(w188) );
	ym6045c_cell_10 g82 (.i2(w93), .o3(w170), .i4(w71) );
	ym6045c_cell_5 g83 (.i1(w94), .i2(w170), .o3(w167) );
	ym6045c_cell_35 g84 (.o1(w193), .i2(w188) );
	ym6045c_cell_8 g85 (.o1(w96), .i2(w221), .i3(w194) );
	ym6045c_cell_1 g86 (.i2(w56), .o3(w185) );
	ym6045c_cell_5 g87 (.i1(w191), .i2(w192), .o3(w168) );
	ym6045c_cell_6 g88 (.o2(w195), .i3(w172), .i4(w112) );
	ym6045c_cell_7 g89 (.o2(w223), .i3(w114) );
	ym6045c_cell_1 g90 (.i2(w107), .o3(w224) );
	ym6045c_cell_18 g91 (.o1(w226), .i2(w204), .i3(w197), .i4(w224) );
	ym6045c_cell_1 g92 (.i2(w198), .o3(w197) );
	ym6045c_cell_23 g93 (.o5(w196), .i10(w198), .i11(w188) );
	ym6045c_cell_18 g94 (.o1(w105), .i2(w159), .i3(w204), .i4(w205) );
	ym6045c_cell_10 g95 (.i2(w204), .o3(w199), .i4(w196) );
	ym6045c_cell_1 g96 (.i2(w82), .o3(w207) );
	ym6045c_cell_7 g97 (.o2(w132), .i3(w107) );
	ym6045c_cell_14 g98 (.o3(w129), .i6(w130), .i7(w132), .i13(1'b1), .i14(w124), .o15(w131), .i18(w124) );
	ym6045c_cell_1 g99 (.i2(w82), .o3(w201) );
	ym6045c_cell_21 g100 (.o1(w202), .i2(w201), .i3(w204), .i4(w200), .i5(w126) );
	ym6045c_cell_23 g101 (.o5(w211), .i10(w199), .i11(w188) );
	ym6045c_cell_10 g102 (.i2(w211), .o3(w122), .i4(w204) );
	ym6045c_cell_1 g103 (.i2(w158), .o3(w128) );
	ym6045c_cell_23 g104 (.o5(w447), .i10(w122), .i11(w188) );
	ym6045c_cell_10 g105 (.i2(w63), .o3(w212), .i4(w447) );
	ym6045c_cell_10 g106 (.i2(w122), .o3(w215), .i4(w102) );
	ym6045c_cell_6 g107 (.o2(w208), .i3(w212), .i4(w215) );
	ym6045c_cell_10 g108 (.i2(w210), .o3(w121), .i4(w190) );
	ym6045c_cell_1 g109 (.i2(w123), .o3(w209) );
	ym6045c_cell_10 g110 (.i2(w208), .o3(w116), .i4(w123) );
	ym6045c_cell_10 g111 (.i2(w208), .o3(w120), .i4(w209) );
	ym6045c_cell_7 g112 (.o2(w152), .i3(w127) );
	ym6045c_cell_23 g113 (.o5(w117), .i10(w226), .i11(w188) );
	ym6045c_cell_1 g114 (.i2(w118), .o3(w159) );
	ym6045c_cell_10 g115 (.i2(w160), .o3(w119), .i4(w159) );
	ym6045c_cell_27 g116 (.i2(1'b0) );
	ym6045c_cell_33 g117 (.i2(1'b0) );
	ym6045c_cell_22 g118 (.i1(w37), .o2(w253), .i6(w19), .i7(w39), .i8(w21), .i9(w19), .o11(w255), .o12(w254), .i13(w21), .i14(w27), .i15(w20), .i17(w27), .o19(w251) );
	ym6045c_cell_1 g119 (.i2(w45), .o3(w18) );
	ym6045c_cell_26 g120 (.i2(w300), .i4(w294), .o5(w45) );
	ym6045c_cell_1 g121 (.i2(w23), .o3(w448) );
	ym6045c_cell_18 g122 (.o1(w42), .i2(w36), .i3(w45), .i4(w448) );
	ym6045c_cell_6 g123 (.o2(w10), .i3(w42), .i4(w44) );
	ym6045c_cell_18 g124 (.o1(w43), .i2(w45), .i3(w16), .i4(w23) );
	ym6045c_cell_22 g125 (.i1(w37), .o2(w250), .i6(w239), .i7(w41), .i8(w55), .i9(w239), .o11(w249), .o12(w303), .i13(w55), .i14(w40), .i15(w39), .i17(w40), .o19(w256) );
	ym6045c_cell_1 g126 (.i2(w45), .o3(w46) );
	ym6045c_cell_18 g127 (.o1(w248), .i2(w80), .i3(w23), .i4(w45) );
	ym6045c_cell_6 g128 (.o2(w15), .i3(w47), .i4(w88) );
	ym6045c_cell_6 g129 (.o2(w87), .i3(w84), .i4(w85) );
	ym6045c_cell_10 g130 (.i2(w48), .o3(w47), .i4(w46) );
	ym6045c_cell_28 g131 (.i1(w13), .o2(w48), .i5(w36), .i6(w80) );
	ym6045c_cell_10 g132 (.i2(w44), .o3(w88), .i4(w13) );
	ym6045c_cell_10 g133 (.i2(w301), .o3(w36), .i4(w66) );
	ym6045c_cell_10 g134 (.i2(w16), .o3(w81), .i4(w302) );
	ym6045c_cell_18 g135 (.o1(w16), .i2(w66), .i3(w86), .i4(w82) );
	ym6045c_cell_1 g136 (.i2(w37), .o3(w86) );
	ym6045c_cell_8 g137 (.o1(w234), .i2(w240), .i3(w89) );
	ym6045c_cell_8 g138 (.o1(w89), .i2(w240), .i3(w259) );
	ym6045c_cell_36 g139 (.i1h(1'b0), .i1l(w61), .i2h(w90), .i2l(w62), .o3(w83), .i7h(w191), .i7l(w51), .i8h(w192), .i8l(w92) );
	ym6045c_cell_17 g140 (.i2(w247), .o3(w237), .o10(w313), .o16(w241), .o23(w310), .o29(w242), .o36(w243), .o42(w298), .o49(w297), .i56(w245), .i57(w236) );
	ym6045c_cell_10 g141 (.i2(w257), .o3(w238), .i4(w246) );
	ym6045c_cell_34 g142 (.o1(w246), .i2(w279) );
	ym6045c_cell_8 g143 (.o1(w312), .i2(w261), .i3(w311) );
	ym6045c_cell_25 g144 (.i1(w314), .o2(w263), .o3(w276), .i6(w299), .o10(w273), .o11(w277) );
	ym6045c_cell_4 g145 (.i1(w276), .i2(w315), .i3(w113), .o4(w174) );
	ym6045c_cell_3 g146 (.i2h(w273), .i2l(w315), .i3h(w270), .i3l(w113), .o4(w274) );
	ym6045c_cell_3 g147 (.i2h(w263), .i2l(w315), .i3h(w270), .i3l(w113), .o4(w180) );
	ym6045c_cell_3 g148 (.i2h(w277), .i2l(w315), .i3h(w270), .i3l(w113), .o4(w175) );
	ym6045c_cell_10 g149 (.i2(w82), .o3(w91), .i4(w274) );
	ym6045c_cell_1 g150 (.i2(w37), .o3(w272) );
	ym6045c_cell_18 g151 (.o1(w230), .i2(w35), .i3(w272), .i4(w60) );
	ym6045c_cell_25 g152 (.i1(w51), .o3(w181), .i6(w92), .o10(w271), .o11(w270) );
	ym6045c_cell_4 g153 (.i1(w232), .i2(w269), .i3(w271), .o4(w283) );
	ym6045c_cell_4 g154 (.i1(w270), .i2(w232), .i3(w269), .o4(w268) );
	ym6045c_cell_2 g155 (.o2(w13), .i9(w247), .i11(w190), .i13(w268) );
	ym6045c_cell_10 g156 (.i2(w35), .o3(w231), .i4(w58) );
	ym6045c_cell_6 g157 (.o2(w216), .i3(w231), .i4(w230) );
	ym6045c_cell_8 g158 (.o1(w177), .i2(w182), .i3(w183) );
	ym6045c_cell_1 g159 (.i2(w174), .o3(w232) );
	ym6045c_cell_4 g160 (.i1(w232), .i2(w181), .i3(w178), .o4(w179) );
	ym6045c_cell_1 g161 (.i2(w192), .o3(w178) );
	ym6045c_cell_9 g162 (.i3(w193), .i4(w177), .i7(w167), .o11(w176), .o13(w184) );
	ym6045c_cell_10 g163 (.i2(w82), .o3(w169), .i4(w258) );
	ym6045c_cell_10 g164 (.i2(w82), .o3(w290), .i4(w174) );
	ym6045c_cell_24 g165 (.i1h(w175), .i1l(w287), .i2h(w91), .i2l(w289), .i4h(w81), .i4l(w290), .o7(w165) );
	ym6045c_cell_10 g166 (.i2(w180), .o3(w289), .i4(w82) );
	ym6045c_cell_10 g167 (.i2(w171), .o3(w287), .i4(w169) );
	ym6045c_cell_5 g168 (.i1(w218), .i2(w111), .o3(w171) );
	ym6045c_cell_10 g169 (.i2(w195), .o3(w173), .i4(w288) );
	ym6045c_cell_39 g170 (.o1(w140), .i2(w293), .i3(w173), .i4(w292) );
	ym6045c_cell_21 g171 (.o1(w210), .i2(w37), .i3(w125), .i4(w190), .i5(w294) );
	ym6045c_cell_12 g172 (.o1(w221), .i2(w286), .i3(w222), .i4(w125) );
	ym6045c_cell_8 g173 (.o1(w194), .i2(w222), .i3(w285) );
	ym6045c_cell_1 g174 (.i2(w37), .o3(w222) );
	ym6045c_cell_6 g175 (.o2(w281), .i3(w37), .i4(w225) );
	ym6045c_cell_10 g176 (.i2(w224), .o3(w225), .i4(w206) );
	ym6045c_cell_18 g177 (.o1(w198), .i2(w204), .i3(w206), .i4(w224) );
	ym6045c_cell_5 g178 (.i1(w176), .i2(w82), .o3(w229) );
	ym6045c_cell_8 g179 (.o1(w205), .i2(w198), .i3(w220) );
	ym6045c_cell_23 g180 (.o5(w219), .i10(w104), .i11(w157) );
	ym6045c_cell_23 g181 (.o5(w228), .i10(w219), .i11(w157) );
	ym6045c_cell_6 g182 (.o2(w214), .i3(w198), .i4(w202) );
	ym6045c_cell_23 g183 (.o5(w206), .i10(w214), .i11(w193) );
	ym6045c_cell_23 g184 (.o2(w187), .o5(w166), .i10(w284), .i11(w193) );
	ym6045c_cell_1 g185 (.i2(w217), .o3(w200) );
	ym6045c_cell_23 g186 (.o5(w213), .i10(w216), .i11(w157) );
	ym6045c_cell_6 g187 (.o2(w204), .i3(w213), .i4(w216) );
	ym6045c_cell_7 g188 (.o2(w160), .i3(w225) );
	ym6045c_cell_6 g189 (.o2(w282), .i3(w281), .i4(w227) );
	ym6045c_cell_10 g190 (.i2(w217), .o3(w227), .i4(w282) );
	ym6045c_cell_23 g191 (.o2(w218), .i10(w164), .i11(w188) );
	ym6045c_cell_18 g192 (.o1(w164), .i2(w163), .i3(w82), .i4(w166) );
	ym6045c_cell_23 g193 (.o5(w163), .i10(w82), .i11(w188) );
	ym6045c_cell_5 g194 (.i1(w165), .i2(w280), .o3(w161) );
	ym6045c_cell_30 g195 (.o2(w339), .i3(w317), .i4(w327), .i5(w325), .i6(w329) );
	ym6045c_cell_5 g196 (.i1(w330), .i2(w331), .o3(w318) );
	ym6045c_cell_6 g197 (.o2(w319), .i3(w318), .i4(w337) );
	ym6045c_cell_9 g198 (.i3(w188), .i4(w319), .i7(w308), .o11(w330), .o13(w332) );
	ym6045c_cell_23 g199 (.o5(w334), .i10(w4), .i11(w193) );
	ym6045c_cell_23 g200 (.o2(w309), .o5(w331), .i10(w333), .i11(w193) );
	ym6045c_cell_10 g201 (.i2(w84), .o3(w333), .i4(w332) );
	ym6045c_cell_8 g202 (.o1(w9), .i2(w309), .i3(w335) );
	ym6045c_cell_10 g203 (.i2(w334), .o3(w84), .i4(w335) );
	ym6045c_cell_23 g204 (.o5(w336), .i10(w335), .i11(w188) );
	ym6045c_cell_10 g205 (.i2(w335), .o3(w4), .i4(w336) );
	ym6045c_cell_10 g206 (.i2(w330), .o3(w302), .i4(w4) );
	ym6045c_cell_10 g207 (.i2(w345), .o3(w337), .i4(w66) );
	ym6045c_cell_1 g208 (.i2(w23), .o3(w304) );
	ym6045c_cell_3 g209 (.i2h(w207), .i2l(w66), .i3h(w294), .i3l(w304), .o4(w326) );
	ym6045c_cell_2 g210 (.o4(w305), .i9(w308), .i11(w309), .i13(w193) );
	ym6045c_cell_8 g211 (.o1(w8), .i2(w305), .i3(w363) );
	ym6045c_cell_10 g212 (.i2(w361), .o3(w80), .i4(w301) );
	ym6045c_cell_18 g213 (.o1(w335), .i2(w306), .i3(w66), .i4(w362) );
	ym6045c_cell_5 g214 (.i1(w307), .i2(w85), .o3(w306) );
	ym6045c_cell_9 g215 (.i3(w193), .i4(w85), .i7(w308), .o13(w307) );
	ym6045c_cell_21 g216 (.o1(w366), .i2(w365), .i3(w110), .i4(w62), .i5(w61) );
	ym6045c_cell_9 g217 (.i3(w193), .i4(w360), .i7(w308), .o11(w363), .o13(w364) );
	ym6045c_cell_6 g218 (.o2(w85), .i3(w360), .i4(w364) );
	ym6045c_cell_6 g219 (.o2(w308), .i3(w37), .i4(w247) );
	ym6045c_cell_6 g220 (.o2(w353), .i3(w237), .i4(w58) );
	ym6045c_cell_6 g221 (.o2(w368), .i3(w58), .i4(w310) );
	ym6045c_cell_6 g222 (.o2(w355), .i3(w241), .i4(w58) );
	ym6045c_cell_6 g223 (.o2(w369), .i3(w313), .i4(w58) );
	ym6045c_cell_37 g224 (.i1(w365), .i2(w299), .i3(w314), .i4(w370), .o5(w244), .i6(w372), .i7(w371), .i8(w381), .i9(w294) );
	ym6045c_cell_21 g225 (.o1(w382), .i2(w371), .i3(w381), .i4(w370), .i5(w372) );
	ym6045c_cell_1 g226 (.i2(w58), .o3(w359) );
	ym6045c_cell_2 g227 (.o2(w311), .i9(w259), .i11(w380), .i13(w235) );
	ym6045c_cell_2 g228 (.o4(w380), .i9(w259), .i11(w259), .i13(w235) );
	ym6045c_cell_12 g229 (.o1(w315), .i2(w366), .i3(w382), .i4(w373) );
	ym6045c_cell_18 g230 (.o1(w258), .i2(w113), .i3(w373), .i4(w382) );
	ym6045c_cell_38 g231 (.o2(w235), .i10(w259), .i12(w383) );
	ym6045c_cell_7 g232 (.o2(w259), .i3(w247) );
	ym6045c_cell_1 g233 (.i2(w342), .o3(w262) );
	ym6045c_cell_6 g234 (.o2(w385), .i3(w58), .i4(w297) );
	ym6045c_cell_6 g235 (.o2(w384), .i3(w58), .i4(w298) );
	ym6045c_cell_6 g236 (.o2(w386), .i3(w58), .i4(w243) );
	ym6045c_cell_6 g237 (.o2(w388), .i3(w58), .i4(w242) );
	ym6045c_cell_7 g238 (.o2(w324), .i3(w449) );
	ym6045c_cell_8 g239 (.o1(w449), .i2(w367), .i3(w295) );
	ym6045c_cell_8 g240 (.o1(w296), .i2(w377), .i3(w367) );
	ym6045c_cell_8 g241 (.o1(w182), .i2(w295), .i3(w296) );
	ym6045c_cell_9 g242 (.i3(w349), .i4(w390), .i7(w387), .o11(w390), .o13(w257) );
	ym6045c_cell_1 g243 (.i2(w291), .o3(w349) );
	ym6045c_cell_10 g244 (.i2(w301), .o3(w279), .i4(w291) );
	ym6045c_cell_7 g245 (.o2(w395), .i3(w225) );
	ym6045c_cell_1 g246 (.i2(w442), .o3(w391) );
	ym6045c_cell_2 g247 (.o4(w392), .i9(w391), .i11(w111), .i13(w393) );
	ym6045c_cell_6 g248 (.o2(w288), .i3(w291), .i4(w394) );
	ym6045c_cell_2 g249 (.o2(w172), .o4(w441), .i9(w392), .i11(w434), .i13(w414) );
	ym6045c_cell_2 g250 (.o2(w439), .o4(w293), .i9(w223), .i11(w394), .i13(w414) );
	ym6045c_cell_39 g251 (.o1(w442), .i2(w439), .i3(w223), .i4(w394) );
	ym6045c_cell_2 g252 (.o2(w292), .o4(w434), .i9(w392), .i11(w393), .i13(w188) );
	ym6045c_cell_10 g253 (.i2(w179), .o3(w413), .i4(w185) );
	ym6045c_cell_1 g254 (.i2(w188), .o3(w414) );
	ym6045c_cell_1 g255 (.i2(w217), .o3(w393) );
	ym6045c_cell_1 g256 (.i2(w37), .o3(w407) );
	ym6045c_cell_18 g257 (.o1(w301), .i2(w409), .i3(w217), .i4(w407) );
	ym6045c_cell_1 g258 (.i2(w282), .o3(w409) );
	ym6045c_cell_1 g259 (.i2(w157), .o3(w412) );
	ym6045c_cell_23 g260 (.o2(w415), .o5(w286), .i10(w228), .i11(w412) );
	ym6045c_cell_23 g261 (.o2(w411), .i10(w410), .i11(w193) );
	ym6045c_cell_5 g262 (.i1(w229), .i2(w285), .o3(w410) );
	ym6045c_cell_4 g263 (.i1(w411), .i2(w285), .i3(w229), .o4(w284) );
	ym6045c_cell_23 g264 (.o5(w285), .i10(w229), .i11(w193) );
	ym6045c_cell_28 g265 (.i1(w37), .o2(w94), .i5(w312), .i6(w422) );
	ym6045c_cell_2 g266 (.o4(w422), .i9(w312), .i11(w190), .i13(w283) );
	ym6045c_cell_38 g267 (.o2(w420), .i10(w416), .i12(w408) );
	ym6045c_cell_38 g268 (.o2(w433), .i10(w416), .i12(w420) );
	ym6045c_cell_34 g269 (.o1(w418), .i2(w301) );
	ym6045c_cell_5 g270 (.i1(w301), .i2(w418), .o3(w419) );
	ym6045c_cell_33 g271 (.i2(1'b0) );
	ym6045c_cell_27 g272 (.i2(1'b0) );
	ym6045c_cell_6 g273 (.o2(w450), .i3(w316), .i4(w253) );
	ym6045c_cell_6 g274 (.o2(w451), .i3(w316), .i4(w251) );
	ym6045c_cell_6 g275 (.o2(w452), .i3(w316), .i4(w254) );
	ym6045c_cell_6 g276 (.o2(w453), .i3(w316), .i4(w255) );
	ym6045c_cell_14 g277 (.o3(w317), .i6(w188), .i7(1'b1), .i13(1'b0), .i14(w324), .o15(w321), .i18(w322) );
	ym6045c_cell_14 g278 (.o3(w329), .i6(w188), .i7(1'b1), .i13(1'b0), .i14(w324), .o15(w338), .i18(w321) );
	ym6045c_cell_14 g279 (.o3(w325), .i6(w188), .i7(1'b1), .i13(1'b0), .i14(w324), .o15(w328), .i18(w338) );
	ym6045c_cell_14 g280 (.o3(w327), .i6(w188), .i7(1'b1), .i13(w37), .i14(w324), .i18(w328) );
	ym6045c_cell_6 g281 (.o2(w454), .i3(w316), .i4(w256) );
	ym6045c_cell_6 g282 (.o2(w455), .i3(w316), .i4(w303) );
	ym6045c_cell_6 g283 (.o2(w456), .i3(w249), .i4(w316) );
	ym6045c_cell_6 g284 (.o2(w457), .i3(w250), .i4(w316) );
	ym6045c_cell_15 g285 (.o1(w322), .i2(w324), .i3(w344), .i4(w344) );
	ym6045c_cell_5 g286 (.i1(w343), .i2(w66), .o3(w347) );
	ym6045c_cell_6 g287 (.o2(w348), .i3(w347), .i4(w346) );
	ym6045c_cell_4 g288 (.i1(w342), .i2(w345), .i3(w344), .o4(w346) );
	ym6045c_cell_2 g289 (.o2(w345), .o4(w343), .i9(w342), .i11(w342), .i13(w341) );
	ym6045c_cell_1 g290 (.i2(w362), .o3(w341) );
	ym6045c_cell_1 g291 (.i2(w37), .o3(w340) );
	ym6045c_cell_10 g292 (.i2(w82), .o3(w362), .i4(w340) );
	ym6045c_cell_1 g293 (.i2(w359), .o3(w316) );
	ym6045c_cell_9 g294 (.i3(w188), .i4(w348), .i7(w308), .o13(w360) );
	ym6045c_cell_6 g295 (.o2(w367), .i3(w344), .i4(w339) );
	ym6045c_cell_15 g296 (.o1(w361), .i2(w66), .i3(w352), .i4(w349) );
	ym6045c_cell_9 g297 (.i3(w349), .i4(w66), .i7(w351), .o13(w352) );
	ym6045c_cell_1 g298 (.i2(w301), .o3(w351) );
	ym6045c_cell_10 g299 (.i2(w23), .o3(w350), .i4(w125) );
	ym6045c_cell_22 g300 (.i1(w37), .o2(w459), .i6(w109), .i7(w368), .i8(w125), .i9(w355), .o11(w458), .o12(w354), .i13(w369), .i14(w350), .i15(w34), .i17(w353), .o19(w465) );
	ym6045c_cell_1 g301 (.i2(w301), .o3(w357) );
	ym6045c_cell_30 g302 (.o2(w358), .i3(w343), .i4(w357), .i5(w344), .i6(w356) );
	ym6045c_cell_9 g303 (.i3(w188), .i4(w379), .i7(w247), .o11(w342), .o13(w356) );
	ym6045c_cell_12 g304 (.o1(w379), .i2(w358), .i3(w367), .i4(w377) );
	ym6045c_cell_1 g305 (.i2(w294), .o3(w466) );
	ym6045c_cell_3 g306 (.i2h(w37), .i2l(w466), .i3h(w66), .i3l(w23), .o4(w373) );
	ym6045c_cell_38 g307 (.o2(w378), .i10(w374), .i12(w375) );
	ym6045c_cell_38 g308 (.o2(w375), .i10(w374), .i12(w376) );
	ym6045c_cell_38 g309 (.o2(w376), .i10(w374), .i12(w445) );
	ym6045c_cell_8 g310 (.o1(w445), .i2(w342), .i3(w440) );
	ym6045c_cell_38 g311 (.o2(w437), .i10(w374), .i12(w378) );
	ym6045c_cell_10 g312 (.i2(w359), .o3(w389), .i4(w385) );
	ym6045c_cell_10 g313 (.i2(w384), .o3(w444), .i4(w359) );
	ym6045c_cell_22 g314 (.i1(w37), .o2(w460), .i6(1'b0), .i7(w389), .i8(1'b0), .i9(w444), .o11(w396), .o12(w397), .i13(w386), .i14(1'b0), .i15(w94), .i17(w388), .o19(w467) );
	ym6045c_cell_1 g315 (.i2(w295), .o3(w374) );
	ym6045c_cell_10 g316 (.i2(w159), .o3(w461), .i4(w281) );
	ym6045c_cell_10 g317 (.i2(w395), .o3(w462), .i4(w159) );
	ym6045c_cell_10 g318 (.i2(w415), .o3(w35), .i4(w125) );
	ym6045c_cell_8 g319 (.o1(w377), .i2(w240), .i3(w406) );
	ym6045c_cell_1 g320 (.i2(w295), .o3(w416) );
	ym6045c_cell_2 g321 (.o4(w394), .i9(w392), .i11(w441), .i13(w188) );
	ym6045c_cell_38 g322 (.o2(w383), .i10(w416), .i12(w433) );
	ym6045c_cell_6 g323 (.o2(w387), .i3(w66), .i4(w419) );
	ym6045c_cell_7 g324 (.o2(w240), .i3(w37) );
	ym6045c_cell_8 g325 (.o1(w440), .i2(w240), .i3(w436) );
	ym6045c_cell_10 g326 (.i2(w438), .o3(w401), .i4(w437) );
	ym6045c_cell_8 g327 (.o1(w438), .i2(w240), .i3(w435) );
	ym6045c_cell_1 g328 (.i2(w405), .o3(w406) );
	ym6045c_cell_1 g329 (.i2(w403), .o3(w435) );
	ym6045c_cell_1 g330 (.i2(w404), .o3(w436) );
	ym6045c_cell_25 g331 (.i1(w398), .o2(w402), .o3(w403), .i6(w399), .o10(w404), .o11(w405) );
	ym6045c_cell_5 g332 (.i1(w402), .i2(w281), .o3(w280) );
	ym6045c_cell_10 g333 (.i2(w280), .o3(w400), .i4(w82) );
	ym6045c_cell_38 g334 (.o2(w408), .i10(w416), .i12(w401) );
	ym6045c_cell_6 g335 (.o2(w463), .i3(w312), .i4(w37) );
	ym6045c_cell_6 g336 (.o2(w344), .i3(1'b1), .i4(w431) );
	ym6045c_cell_14 g337 (.o3(w425), .i6(w188), .i7(1'b1), .i13(1'b0), .i14(w324), .i18(w423) );
	ym6045c_cell_14 g338 (.o3(w428), .i6(w188), .i7(1'b1), .i13(1'b0), .i14(w324), .o15(w423), .i18(w424) );
	ym6045c_cell_30 g339 (.o2(w431), .i3(w425), .i4(w428), .i5(w430), .i6(w421) );
	ym6045c_cell_14 g340 (.o3(w430), .i6(w188), .i7(1'b1), .i13(1'b0), .i14(w324), .o15(w424), .i18(w427) );
	ym6045c_cell_14 g341 (.o3(w421), .i6(w188), .i7(1'b1), .i13(1'b0), .i14(w324), .o15(w427), .i18(w432) );
	ym6045c_cell_15 g342 (.o1(w432), .i2(w324), .i3(1'b1), .i4(1'b1) );
	ym6045c_cell_10 g343 (.i2(w159), .o3(w464), .i4(w160) );
endmodule // ym6045c

// Module Definitions [It is possible to wrap here on your primitives]

module ym6045c_cell_1 (  i2, o3);

	input wire i2;
	output wire o3;

endmodule // ym6045c_cell_1

module ym6045c_cell_6 (  o2, i3, i4);

	output wire o2;
	input wire i3;
	input wire i4;

endmodule // ym6045c_cell_6

module ym6045c_cell_5 (  i1, i2, o3);

	input wire i1;
	input wire i2;
	output wire o3;

endmodule // ym6045c_cell_5

module ym6045c_cell_7 (  o2, i3);

	output wire o2;
	input wire i3;

endmodule // ym6045c_cell_7

module ym6045c_cell_4 (  i1, i2, i3, o4);

	input wire i1;
	input wire i2;
	input wire i3;
	output wire o4;

endmodule // ym6045c_cell_4

module ym6045c_cell_16 (  o2, i4);

	output wire o2;
	input wire i4;

endmodule // ym6045c_cell_16

module ym6045c_cell_14 (  o2, o3, i6, i7, i13, i14, o15, i18);

	output wire o2;
	output wire o3;
	input wire i6;
	input wire i7;
	input wire i13;
	input wire i14;
	output wire o15;
	input wire i18;

endmodule // ym6045c_cell_14

module ym6045c_cell_29 (  o1, i2, i3, i4, i5, i6, i7);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;
	input wire i5;
	input wire i6;
	input wire i7;

endmodule // ym6045c_cell_29

module ym6045c_cell_30 (  o2, i3, i4, i5, i6);

	output wire o2;
	input wire i3;
	input wire i4;
	input wire i5;
	input wire i6;

endmodule // ym6045c_cell_30

module ym6045c_cell_9 (  i3, i4, i7, o11, o13);

	input wire i3;
	input wire i4;
	input wire i7;
	output wire o11;
	output wire o13;

endmodule // ym6045c_cell_9

module ym6045c_cell_31 (  i2, i3, i4, i13, o16, o17);

	input wire i2;
	input wire i3;
	input wire i4;
	input wire i13;
	output wire o16;
	output wire o17;

endmodule // ym6045c_cell_31

module ym6045c_cell_32 (  i1, o2);

	input wire i1;
	output wire o2;

endmodule // ym6045c_cell_32

module ym6045c_cell_27 (  o1, i2);

	output wire o1;
	input wire i2;

endmodule // ym6045c_cell_27

module ym6045c_cell_33 (  o1, i2);

	output wire o1;
	input wire i2;

endmodule // ym6045c_cell_33

module ym6045c_cell_34 (  o1, i2);

	output wire o1;
	input wire i2;

endmodule // ym6045c_cell_34

module ym6045c_cell_19 (  o1, i2, i3, i4, i5);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;
	input wire i5;

endmodule // ym6045c_cell_19

module ym6045c_cell_10 (  i2, o3, i4);

	input wire i2;
	output wire o3;
	input wire i4;

endmodule // ym6045c_cell_10

module ym6045c_cell_8 (  o1, i2, i3);

	output wire o1;
	input wire i2;
	input wire i3;

endmodule // ym6045c_cell_8

module ym6045c_cell_18 (  o1, i2, i3, i4);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;

endmodule // ym6045c_cell_18

module ym6045c_cell_3 (  i2h, i2l, i3h, i3l, o4);

	input wire i2h;
	input wire i2l;
	input wire i3h;
	input wire i3l;
	output wire o4;

endmodule // ym6045c_cell_3

module ym6045c_cell_15 (  o1, i2, i3, i4);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;

endmodule // ym6045c_cell_15

module ym6045c_cell_24 (  i1h, i1l, i2h, i2l, i4h, i4l, o7);

	input wire i1h;
	input wire i1l;
	input wire i2h;
	input wire i2l;
	input wire i4h;
	input wire i4l;
	output wire o7;

endmodule // ym6045c_cell_24

module ym6045c_cell_21 (  o1, i2, i3, i4, i5);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;
	input wire i5;

endmodule // ym6045c_cell_21

module ym6045c_cell_23 (  o2, o5, i10, i11);

	output wire o2;
	output wire o5;
	input wire i10;
	input wire i11;

endmodule // ym6045c_cell_23

module ym6045c_cell_12 (  o1, i2, i3, i4);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;

endmodule // ym6045c_cell_12

module ym6045c_cell_2 (  o2, o4, i9, i11, i13);

	output wire o2;
	output wire o4;
	input wire i9;
	input wire i11;
	input wire i13;

endmodule // ym6045c_cell_2

module ym6045c_cell_35 (  o1, i2);

	output wire o1;
	input wire i2;

endmodule // ym6045c_cell_35

module ym6045c_cell_22 (  i1, o2, i6, i7, i8, i9, o11, o12, i13, i14, i15, i17, o19);

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

endmodule // ym6045c_cell_22

module ym6045c_cell_26 (  i2, i4, o5);

	input wire i2;
	input wire i4;
	output wire o5;

endmodule // ym6045c_cell_26

module ym6045c_cell_28 (  i1, o2, i5, i6);

	input wire i1;
	output wire o2;
	input wire i5;
	input wire i6;

endmodule // ym6045c_cell_28

module ym6045c_cell_36 (  i1h, i1l, i2h, i2l, o3, i7h, i7l, i8h, i8l);

	input wire i1h;
	input wire i1l;
	input wire i2h;
	input wire i2l;
	output wire o3;
	input wire i7h;
	input wire i7l;
	input wire i8h;
	input wire i8l;

endmodule // ym6045c_cell_36

module ym6045c_cell_17 (  i2, o3, o10, o16, o23, o29, o36, o42, o49, i56, i57);

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

endmodule // ym6045c_cell_17

module ym6045c_cell_25 (  i1, o2, o3, i6, o10, o11);

	input wire i1;
	output wire o2;
	output wire o3;
	input wire i6;
	output wire o10;
	output wire o11;

endmodule // ym6045c_cell_25

module ym6045c_cell_39 (  o1, i2, i3, i4);

	output wire o1;
	input wire i2;
	input wire i3;
	input wire i4;

endmodule // ym6045c_cell_39

module ym6045c_cell_37 (  i1, i2, i3, i4, o5, i6, i7, i8, i9);

	input wire i1;
	input wire i2;
	input wire i3;
	input wire i4;
	output wire o5;
	input wire i6;
	input wire i7;
	input wire i8;
	input wire i9;

endmodule // ym6045c_cell_37

module ym6045c_cell_38 (  o1, o2, i10, i12);

	output wire o1;
	output wire o2;
	input wire i10;
	input wire i12;

endmodule // ym6045c_cell_38

