// This program was cloned from: https://github.com/emu-russia/breaks_Layer2
// License: Creative Commons Zero v1.0 Universal

module core_6502 (  n_NMI, n_IRQ, RDY, n_RES, SO, PHI0, PHI1, PHI2, RnW, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], D[7], D[6], D[5], D[4], D[3], D[2], D[1], D[0], SYNC, D[4], D[3], D[5], D[0], D[1], D[7], D[2], D[6], n_IMPLIED, n_TWOCYCLE, n_PD[0], n_PD[1], n_PD[7], n_PD[4], n_PD[3], n_PD[2], n_PD[5], n_PD[6], PHI2, Z_IR, PHI1, PHI2, AD_AB, AD, A, nIR5, nIR6, IR5, IR6, nIR2, IR2, nIR3, IR3, nIR4, IR4, nIR7, IR7, nIR0, IR01, nIR1, nT2, nT3, nT4, nT5, nT0, nT1X, IR0, n_PRDY, d[128], d[127], d[126], d[125], d[124], d[123], d[122], d[121], d[120], d[119], d[118], d[117], d[116], d[115], d[114], d[113], d[112], d[111], d[110], d[109], d[108], d[107], d[106], d[105], d[104], d[103], d[102], d[101], d[100], d[99], d[98], d[97], d[96], d[95], d[94], d[93], d[92], d[91], d[90], d[89], d[88], d[87], d[86], d[85], d[84], d[83], d[82], d[81], d[80], d[79], d[78], d[77], d[76], d[75], d[74], d[73], d[72], d[71], d[70], d[69], d[68], d[67], d[66], d[65], d[64], d[63], d[62], d[61], d[60], d[59], d[58], d[57], d[56], d[55], d[54], d[53], d[52], d[51], d[50], d[49], d[48], d[47], d[46], d[45], d[44], d[43], d[42], d[41], d[40], d[39], d[38], d[37], d[36], d[35], d[34], d[33], d[32], d[31], d[30], d[29], d[28], d[27], d[26], d[25], d[24], d[23], d[22], d[21], d[20], d[19], d[18], d[17], d[16], d[15], d[14], d[13], d[12], d[11], d[10], d[9], d[8], d[7], d[6], d[5], d[4], d[3], d[2], d[1], d[0]);

	input wire n_NMI;
	input wire n_IRQ;
	input wire RDY;
	input wire n_RES;
	input wire SO;
	input wire PHI0;
	output wire PHI1;
	output wire PHI2;
	output wire RnW;
	output wire A[0];
	output wire A[1];
	output wire A[2];
	output wire A[3];
	output wire A[4];
	output wire A[5];
	output wire A[6];
	output wire A[7];
	output wire A[8];
	output wire A[9];
	output wire A[10];
	output wire A[11];
	output wire A[12];
	output wire A[13];
	output wire A[14];
	output wire A[15];
	inout wire D[7];
	inout wire D[6];
	inout wire D[5];
	inout wire D[4];
	inout wire D[3];
	inout wire D[2];
	inout wire D[1];
	inout wire D[0];
	output wire SYNC;
	input wire D[4];
	input wire D[3];
	input wire D[5];
	input wire D[0];
	input wire D[1];
	input wire D[7];
	input wire D[2];
	input wire D[6];
	output wire n_IMPLIED;
	output wire n_TWOCYCLE;
	output wire n_PD[0];
	output wire n_PD[1];
	output wire n_PD[7];
	output wire n_PD[4];
	output wire n_PD[3];
	output wire n_PD[2];
	output wire n_PD[5];
	output wire n_PD[6];
	input wire PHI2;
	input wire Z_IR;
	input wire PHI1;
	input wire PHI2;
	input wire AD_AB;
	input wire AD;
	output wire A;
	input wire nIR5;
	input wire nIR6;
	input wire IR5;
	input wire IR6;
	input wire nIR2;
	input wire IR2;
	input wire nIR3;
	input wire IR3;
	input wire nIR4;
	input wire IR4;
	input wire nIR7;
	input wire IR7;
	input wire nIR0;
	input wire IR01;
	input wire nIR1;
	input wire nT2;
	input wire nT3;
	input wire nT4;
	input wire nT5;
	input wire nT0;
	input wire nT1X;
	input wire IR0;
	input wire n_PRDY;
	output wire d[128];
	output wire d[127];
	output wire d[126];
	output wire d[125];
	output wire d[124];
	output wire d[123];
	output wire d[122];
	output wire d[121];
	output wire d[120];
	output wire d[119];
	output wire d[118];
	output wire d[117];
	output wire d[116];
	output wire d[115];
	output wire d[114];
	output wire d[113];
	output wire d[112];
	output wire d[111];
	output wire d[110];
	output wire d[109];
	output wire d[108];
	output wire d[107];
	output wire d[106];
	output wire d[105];
	output wire d[104];
	output wire d[103];
	output wire d[102];
	output wire d[101];
	output wire d[100];
	output wire d[99];
	output wire d[98];
	output wire d[97];
	output wire d[96];
	output wire d[95];
	output wire d[94];
	output wire d[93];
	output wire d[92];
	output wire d[91];
	output wire d[90];
	output wire d[89];
	output wire d[88];
	output wire d[87];
	output wire d[86];
	output wire d[85];
	output wire d[84];
	output wire d[83];
	output wire d[82];
	output wire d[81];
	output wire d[80];
	output wire d[79];
	output wire d[78];
	output wire d[77];
	output wire d[76];
	output wire d[75];
	output wire d[74];
	output wire d[73];
	output wire d[72];
	output wire d[71];
	output wire d[70];
	output wire d[69];
	output wire d[68];
	output wire d[67];
	output wire d[66];
	output wire d[65];
	output wire d[64];
	output wire d[63];
	output wire d[62];
	output wire d[61];
	output wire d[60];
	output wire d[59];
	output wire d[58];
	output wire d[57];
	output wire d[56];
	output wire d[55];
	output wire d[54];
	output wire d[53];
	output wire d[52];
	output wire d[51];
	output wire d[50];
	output wire d[49];
	output wire d[48];
	output wire d[47];
	output wire d[46];
	output wire d[45];
	output wire d[44];
	output wire d[43];
	output wire d[42];
	output wire d[41];
	output wire d[40];
	output wire d[39];
	output wire d[38];
	output wire d[37];
	output wire d[36];
	output wire d[35];
	output wire d[34];
	output wire d[33];
	output wire d[32];
	output wire d[31];
	output wire d[30];
	output wire d[29];
	output wire d[28];
	output wire d[27];
	output wire d[26];
	output wire d[25];
	output wire d[24];
	output wire d[23];
	output wire d[22];
	output wire d[21];
	output wire d[20];
	output wire d[19];
	output wire d[18];
	output wire d[17];
	output wire d[16];
	output wire d[15];
	output wire d[14];
	output wire d[13];
	output wire d[12];
	output wire d[11];
	output wire d[10];
	output wire d[9];
	output wire d[8];
	output wire d[7];
	output wire d[6];
	output wire d[5];
	output wire d[4];
	output wire d[3];
	output wire d[2];
	output wire d[1];
	output wire d[0];

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
	wire IR7;
	wire IR6;
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
	wire PD6;
	wire PD2;
	wire PD5;
	wire PD3;
	wire w62;
	wire w63;
	wire w64;
	wire w65;
	wire w66;
	wire w67;
	wire PD7;
	wire w69;
	wire PD0;
	wire PD4;
	wire PD1;
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

	assign w25 = D[4];
	assign w26 = D[3];
	assign w27 = D[5];
	assign w28 = D[0];
	assign w29 = D[1];
	assign w30 = D[7];
	assign w31 = D[2];
	assign w32 = D[6];
	assign n_IMPLIED = w51;
	assign n_TWOCYCLE = w52;
	assign n_PD[0] = w69;
	assign n_PD[1] = w73;
	assign n_PD[7] = w67;
	assign n_PD[4] = w66;
	assign n_PD[3] = w62;
	assign n_PD[2] = w63;
	assign n_PD[5] = w64;
	assign n_PD[6] = w65;
	assign w33 = PHI2;
	assign w42 = Z_IR;
	assign w79 = PHI1;
	assign w78 = PHI2;
	assign w80 = AD_AB;
	assign w75 = AD;
	assign A = w76;
	assign w101 = nIR5;
	assign w99 = nIR6;
	assign w100 = IR5;
	assign w98 = IR6;
	assign w97 = nIR2;
	assign w96 = IR2;
	assign w95 = nIR3;
	assign w94 = IR3;
	assign w93 = nIR4;
	assign w92 = IR4;
	assign w91 = nIR7;
	assign w90 = IR7;
	assign w89 = nIR0;
	assign w88 = IR01;
	assign w87 = nIR1;
	assign w86 = nT2;
	assign w85 = nT3;
	assign w84 = nT4;
	assign w83 = nT5;
	assign w102 = nT0;
	assign w103 = nT1X;
	assign w104 = IR0;
	assign w106 = n_PRDY;
	assign d[128] = w236;
	assign d[127] = w235;
	assign d[126] = w234;
	assign d[125] = w233;
	assign d[124] = w232;
	assign d[123] = w231;
	assign d[122] = w230;
	assign d[121] = w229;
	assign d[120] = w228;
	assign d[119] = w227;
	assign d[118] = w226;
	assign d[117] = w225;
	assign d[116] = w224;
	assign d[115] = w223;
	assign d[114] = w222;
	assign d[113] = w221;
	assign d[112] = w220;
	assign d[111] = w219;
	assign d[110] = w218;
	assign d[109] = w217;
	assign d[108] = w216;
	assign d[107] = w215;
	assign d[106] = w214;
	assign d[105] = w213;
	assign d[104] = w212;
	assign d[103] = w211;
	assign d[102] = w210;
	assign d[101] = w209;
	assign d[100] = w208;
	assign d[99] = w207;
	assign d[98] = w206;
	assign d[97] = w205;
	assign d[96] = w204;
	assign d[95] = w203;
	assign d[94] = w202;
	assign d[93] = w201;
	assign d[92] = w200;
	assign d[91] = w199;
	assign d[90] = w198;
	assign d[89] = w197;
	assign d[88] = w196;
	assign d[87] = w195;
	assign d[86] = w194;
	assign d[85] = w193;
	assign d[84] = w192;
	assign d[83] = w191;
	assign d[82] = w190;
	assign d[81] = w189;
	assign d[80] = w188;
	assign d[79] = w187;
	assign d[78] = w186;
	assign d[77] = w185;
	assign d[76] = w184;
	assign d[75] = w183;
	assign d[74] = w182;
	assign d[73] = w181;
	assign d[72] = w180;
	assign d[71] = w179;
	assign d[70] = w178;
	assign d[69] = w177;
	assign d[68] = w176;
	assign d[67] = w175;
	assign d[66] = w174;
	assign d[65] = w173;
	assign d[64] = w172;
	assign d[63] = w171;
	assign d[62] = w170;
	assign d[61] = w169;
	assign d[60] = w168;
	assign d[59] = w167;
	assign d[58] = w166;
	assign d[57] = w165;
	assign d[56] = w164;
	assign d[55] = w163;
	assign d[54] = w162;
	assign d[53] = w161;
	assign d[52] = w160;
	assign d[51] = w159;
	assign d[50] = w158;
	assign d[49] = w157;
	assign d[48] = w156;
	assign d[47] = w155;
	assign d[46] = w154;
	assign d[45] = w153;
	assign d[44] = w152;
	assign d[43] = w151;
	assign d[42] = w150;
	assign d[41] = w149;
	assign d[40] = w148;
	assign d[39] = w147;
	assign d[38] = w146;
	assign d[37] = w145;
	assign d[36] = w144;
	assign d[35] = w143;
	assign d[34] = w142;
	assign d[33] = w141;
	assign d[32] = w140;
	assign d[31] = w139;
	assign d[30] = w138;
	assign d[29] = w137;
	assign d[28] = w136;
	assign d[27] = w135;
	assign d[26] = w134;
	assign d[25] = w133;
	assign d[24] = w132;
	assign d[23] = w131;
	assign d[22] = w130;
	assign d[21] = w129;
	assign d[20] = w128;
	assign d[19] = w127;
	assign d[18] = w126;
	assign d[17] = w125;
	assign d[16] = w124;
	assign d[15] = w123;
	assign d[14] = w122;
	assign d[13] = w121;
	assign d[12] = w120;
	assign d[11] = w119;
	assign d[10] = w118;
	assign d[9] = w117;
	assign d[8] = w116;
	assign d[7] = w115;
	assign d[6] = w114;
	assign d[5] = w113;
	assign d[4] = w112;
	assign d[3] = w111;
	assign d[2] = w110;
	assign d[1] = w109;
	assign d[0] = w108;

	// Instances

	core_6502_IRQPad g1 (.n_IRQ(w20), .n_IRQP(w18), .nq(w18), .en(w17), .d(w24), .PHI1(w17), .PHI2(w23), .a0(w23), .a1(w22), .b(w19), .b(w24), .a1(w21), .a0(w23), .x(w24), .x(w19), .a(w20), .x(w21), .a(w21), .x(w22) );
	core_6502_BranchTaken g2 (.n_IR6(w1), .n_IR7(w2), .n_IR5(w6), .a(w2), .a(w1), .x(IR6), .x(IR7), .a(w15), .b(IR7), .c(IR6), .a(w16), .b(w1), .c(w2), .a(w7), .b(w8), .c(w9), .d(w10), .a(w14), .b(w1), .c(IR7), .a(w13), .b(w2), .c(IR6), .a(w6), .b(w5), .a0(w5), .a1(w6), .b(w4), .x(w7), .x(w8), .x(w9), .x(w10), .x(w5), .x(w4), .x(w3), .n_BRTAKEN(w3), .n_ZOUT(w16), .n_NOUT(w15), .n_VOUT(w14), .n_COUT(w13) );
	core_6502_not g3 (.a(w2), .x(IR7) );
	core_6502_not g4 (.a(w1), .x(IR6) );
	core_6502_nor3 g5 (.a(w16), .b(w1), .c(w2), .x(w10) );
	core_6502_nor3 g6 (.a(w15), .b(IR7), .c(IR6), .x(w9) );
	core_6502_nor3 g7 (.a(w14), .b(w1), .c(IR7), .x(w8) );
	core_6502_nor3 g8 (.a(w13), .b(w2), .c(IR6), .x(w7) );
	core_6502_nor4 g9 (.a(w7), .b(w8), .c(w9), .d(w10), .x(w5) );
	core_6502_nor g10 (.a(w6), .b(w5), .x(w4) );
	core_6502_aoi g11 (.a0(w5), .a1(w6), .b(w4), .x(w3) );
	core_6502_not g12 (.a(w20), .x(w21) );
	core_6502_dlatch g13 (.nq(w18), .en(w17), .d(w24) );
	core_6502_aoi g14 (.b(w24), .a1(w21), .a0(w23), .x(w19) );
	core_6502_aoi g15 (.a0(w23), .a1(w22), .b(w19), .x(w24) );
	core_6502_not g16 (.a(w21), .x(w22) );
	core_6502_transp g17 (.d(w25), .nq(w34) );
	core_6502_transp g18 (.d(w26), .nq(w35) );
	core_6502_transp g19 (.d(w27), .nq(w36) );
	core_6502_transp g20 (.d(w28), .nq(w37) );
	core_6502_transp g21 (.d(w29), .nq(w38) );
	core_6502_transp g22 (.d(w30), .nq(w39) );
	core_6502_transp g23 (.d(w31), .nq(w40) );
	core_6502_transp g24 (.d(w32), .nq(w41) );
	core_6502_dlatch g25 (.en(w33), .d(w41), .q(w43) );
	core_6502_dlatch g26 (.en(w33), .d(w40), .q(w44) );
	core_6502_dlatch g27 (.en(w33), .d(w39), .q(w45) );
	core_6502_dlatch g28 (.en(w33), .d(w38), .q(w46) );
	core_6502_dlatch g29 (.en(w33), .d(w37), .q(w47) );
	core_6502_dlatch g30 (.en(w33), .d(w36), .q(w48) );
	core_6502_dlatch g31 (.en(w33), .d(w35), .q(w49) );
	core_6502_dlatch g32 (.en(w33), .d(w34), .q(w50) );
	core_6502_not g33 (.a(w54), .x(w53) );
	core_6502_not g34 (.a(w57), .x(w51) );
	core_6502_nor3 g35 (.a(PD1), .b(PD7), .c(PD4), .x(w54) );
	core_6502_nor5 g36 (.a(PD0), .b(w67), .c(PD4), .d(PD3), .e(PD2), .x(w55) );
	core_6502_nor4 g37 (.a(w69), .b(PD4), .c(w62), .d(PD2), .x(w56) );
	core_6502_nor3 g38 (.c(PD2), .b(w62), .a(PD0), .x(w57) );
	core_6502_nor g39 (.a(w50), .b(w42), .x(PD4) );
	core_6502_nor g40 (.b(w42), .a(w49), .x(PD3) );
	core_6502_nor g41 (.a(w48), .b(w42), .x(PD5) );
	core_6502_nor g42 (.b(w42), .a(w47), .x(PD0) );
	core_6502_nor g43 (.a(w46), .b(w42), .x(PD1) );
	core_6502_nor g44 (.b(w42), .a(w45), .x(PD7) );
	core_6502_nor g45 (.a(w44), .b(w42), .x(PD2) );
	core_6502_nor g46 (.b(w42), .a(w43), .x(PD6) );
	core_6502_aoi211 g47 (.a0(w53), .a1(w57), .b(w55), .c(w56), .x(w52) );
	core_6502_not g48 (.a(PD0), .x(w69) );
	core_6502_not g49 (.a(PD1), .x(w73) );
	core_6502_not g50 (.a(PD7), .x(w67) );
	core_6502_not g51 (.a(PD4), .x(w66) );
	core_6502_not g52 (.a(PD3), .x(w62) );
	core_6502_not g53 (.a(PD2), .x(w63) );
	core_6502_not g54 (.a(PD5), .x(w64) );
	core_6502_not g55 (.a(PD6), .x(w65) );
	core_6502_transp g56 (.nq(w81), .d(w75) );
	core_6502_buf g57 (.a(w74), .x(w76) );
	core_6502_transp g58 (.nq(w74), .d(w82) );
	core_6502_not g59 (.a(w74), .x(w77) );
	core_6502_muxe0_comp g60 (.ck(w78), .cck(w79), .a1(w77), .a0(w81), .e0(w80), .x(w82) );
	core_6502_nor5 g61 (.e(w100), .d(w98), .c(w97), .b(w91), .a(w88), .x(w108) );
	core_6502_nor5 g62 (.e(w96), .d(w94), .c(w93), .b(w89), .a(w85), .x(w109) );
	core_6502_nor5 g63 (.e(w96), .d(w95), .c(w93), .b(w89), .a(w86), .x(w110) );
	core_6502_nor7 g64 (.g(w102), .f(w100), .e(w96), .d(w95), .c(w92), .b(w91), .a(w88), .x(w111) );
	core_6502_nor8 g65 (.h(w102), .g(w100), .f(w98), .e(w96), .d(w95), .c(w93), .b(w91), .a(w88), .x(w112) );
	core_6502_nor6 g66 (.f(w102), .e(w100), .d(w99), .c(w92), .b(w91), .a(w88), .x(w113) );
	core_6502_nor3 g67 (.c(w97), .b(w93), .a(w86), .x(w114) );
	core_6502_nor3 g68 (.c(w98), .b(w91), .a(w87), .x(w115) );
	core_6502_nor5 g69 (.e(w96), .d(w94), .c(w92), .b(w89), .a(w86), .x(w116) );
	core_6502_nor8 g70 (.h(w102), .g(w100), .f(w98), .e(w96), .d(w95), .c(w92), .b(w91), .a(w87), .x(w117) );
	core_6502_nor8 g71 (.h(w102), .g(w100), .f(w99), .e(w96), .d(w95), .c(w92), .b(w91), .a(w87), .x(w118) );
	core_6502_nor6 g72 (.f(w102), .e(w101), .d(w99), .c(w92), .b(w91), .a(w88), .x(w119) );
	core_6502_nor4 g73 (.d(w100), .c(w98), .b(w91), .a(w87), .x(w120) );
	core_6502_nor8 g74 (.h(w102), .g(w100), .f(w98), .e(w96), .d(w95), .c(w93), .b(w91), .a(w87), .x(w121) );
	core_6502_nor5 g75 (.e(w102), .d(w101), .c(w98), .b(w91), .a(w87), .x(w122) );
	core_6502_nor8 g76 (.h(w103), .g(w100), .f(w99), .e(w96), .d(w95), .c(w92), .b(w91), .a(w87), .x(w123) );
	core_6502_nor8 g77 (.h(w103), .g(w101), .f(w99), .e(w96), .d(w95), .c(w92), .b(w91), .a(w88), .x(w124) );
	core_6502_nor8 g78 (.h(w102), .g(w101), .f(w98), .e(w96), .d(w95), .c(w93), .b(w91), .a(w87), .x(w125) );
	core_6502_nor7 g79 (.g(w103), .f(w100), .e(w96), .d(w95), .c(w92), .b(w91), .a(w88), .x(w126) );
	core_6502_nor6 g80 (.f(w102), .e(w101), .d(w98), .c(w97), .b(w91), .a(w88), .x(w127) );
	core_6502_nor6 g81 (.f(w102), .e(w101), .d(w98), .c(w92), .b(w91), .a(w88), .x(w128) );
	core_6502_nor8 g82 (.h(w102), .g(w101), .f(w98), .e(w96), .d(w94), .c(w92), .b(w90), .a(w88), .x(w129) );
	core_6502_nor8 g83 (.h(w100), .g(w98), .f(w96), .e(w94), .d(w92), .c(w90), .a(w83), .b(w88), .x(w130) );
	core_6502_nor7 g84 (.g(w102), .f(w100), .e(w96), .d(w95), .c(w92), .b(w90), .a(w88), .x(w131) );
	core_6502_nor8 g85 (.h(w101), .g(w99), .f(w96), .e(w94), .d(w92), .c(w90), .b(w88), .a(w84), .x(w132) );
	core_6502_nor7 g86 (.g(w101), .f(w96), .e(w95), .d(w92), .c(w90), .a(w85), .b(w88), .x(w133) );
	core_6502_nor8 g87 (.h(w100), .g(w99), .f(w96), .e(w94), .d(w92), .c(w90), .b(w88), .a(w83), .x(w134) );
	core_6502_nor4 g88 (.d(w101), .c(w99), .b(w90), .a(w87), .x(w135) );
	core_6502_not g89 (.a(w86), .x(w136) );
	core_6502_nor5 g90 (.e(w102), .d(w100), .c(w99), .b(w90), .a(w89), .x(w137) );
	core_6502_nor6 g91 (.f(w99), .e(w97), .d(w95), .c(w92), .b(w90), .a(w88), .x(w138) );
	core_6502_nor4 g92 (.d(w97), .c(w95), .b(w92), .a(w86), .x(w139) );
	core_6502_nor5 g93 (.e(w102), .d(w100), .c(w98), .b(w90), .a(w89), .x(w140) );
	core_6502_nor g94 (.b(w94), .a(w86), .x(w141) );
	core_6502_not g95 (.a(w102), .x(w142) );
	core_6502_nor5 g96 (.e(w96), .d(w92), .c(w90), .a(w86), .b(w88), .x(w143) );
	core_6502_nor4 g97 (.d(w92), .c(w90), .a(w85), .b(w88), .x(w144) );
	core_6502_nor5 g98 (.e(w96), .d(w95), .c(w92), .b(w90), .a(w88), .x(w105) );
	core_6502_nor7 g99 (.a(w88), .b(w91), .c(w93), .d(w95), .e(w96), .f(w99), .g(w102), .x(w228) );
	core_6502_nor4 g100 (.d(w97), .c(w95), .b(w92), .a(w85), .x(w230) );
	core_6502_nor4 g101 (.a(w86), .b(w92), .c(w94), .d(w97), .x(w231) );
	core_6502_nor4 g102 (.d(w96), .c(w94), .b(w89), .a(w83), .x(w232) );
	core_6502_nor3 g103 (.a(w84), .b(w93), .c(w95), .x(w233) );
	core_6502_nor7 g104 (.g(w101), .f(w98), .e(w96), .d(w95), .c(w93), .b(w91), .a(w88), .x(w235) );
	core_6502_nor4 g105 (.b(w104), .a(w105), .c(w95), .d(w96), .x(w236) );
	core_6502_nor7 g106 (.g(w99), .f(w96), .e(w94), .d(w92), .c(w90), .a(w83), .b(w88), .x(w210) );
	core_6502_nor8 g107 (.h(w101), .g(w98), .f(w96), .e(w94), .d(w92), .c(w90), .a(w83), .b(w88), .x(w211) );
	core_6502_nor8 g108 (.h(w100), .g(w99), .f(w97), .e(w95), .d(w92), .c(w90), .b(w88), .a(w86), .x(w212) );
	core_6502_nor7 g109 (.g(w101), .f(w96), .e(w95), .d(w92), .c(w90), .a(w85), .b(w88), .x(w213) );
	core_6502_nor g110 (.b(w99), .a(w87), .x(w214) );
	core_6502_nor3 g111 (.c(w98), .b(w90), .a(w87), .x(w215) );
	core_6502_nor7 g112 (.g(w102), .f(w99), .e(w96), .d(w95), .c(w93), .b(w90), .a(w88), .x(w216) );
	core_6502_nor7 g113 (.a(w88), .b(w90), .c(w92), .d(w97), .e(w98), .f(w101), .g(w103), .x(w217) );
	core_6502_nor7 g114 (.g(w102), .f(w98), .e(w96), .d(w95), .c(w93), .b(w90), .a(w88), .x(w218) );
	core_6502_nor4 g115 (.a(w85), .b(w93), .c(w94), .d(w97), .x(w219) );
	core_6502_nor4 g116 (.d(w103), .c(w101), .b(w99), .a(w89), .x(w220) );
	core_6502_nor7 g117 (.a(w88), .b(w90), .c(w92), .d(w97), .e(w98), .f(w101), .g(w102), .x(w221) );
	core_6502_nor8 g118 (.h(w102), .g(w101), .f(w98), .e(w96), .d(w95), .c(w92), .b(w90), .a(w88), .x(w222) );
	core_6502_nor8 g119 (.a(w84), .b(w88), .c(w90), .d(w92), .e(w94), .f(w96), .g(w99), .h(w100), .x(w223) );
	core_6502_nor5 g120 (.e(w103), .d(w100), .c(w99), .b(w91), .a(w89), .x(w224) );
	core_6502_nor7 g121 (.a(w88), .b(w91), .c(w92), .d(w95), .e(w97), .f(w99), .g(w103), .x(w225) );
	core_6502_nor7 g122 (.g(w103), .f(w98), .e(w96), .d(w95), .c(w92), .b(w90), .a(w87), .x(w226) );
	core_6502_nor6 g123 (.a(w88), .b(w91), .c(w92), .d(w94), .e(w99), .f(w103), .x(w227) );
	core_6502_not g124 (.a(w98), .x(w229) );
	core_6502_nor4 g125 (.d(w96), .c(w94), .a(w86), .b(w89), .x(w190) );
	core_6502_nor3 g126 (.c(w95), .a(w107), .b(w86), .x(w191) );
	core_6502_nor5 g127 (.e(w96), .d(w95), .c(w92), .b(w90), .a(w88), .x(w107) );
	core_6502_nor7 g128 (.g(w101), .f(w99), .e(w96), .d(w94), .c(w92), .b(w90), .a(w88), .x(w192) );
	core_6502_nor7 g129 (.g(w102), .f(w100), .e(w96), .d(w94), .c(w92), .b(w90), .a(w88), .x(w195) );
	core_6502_nor7 g130 (.g(w102), .f(w99), .e(w97), .d(w95), .c(w92), .b(w90), .a(w88), .x(w196) );
	core_6502_nor5 g131 (.e(w96), .d(w94), .c(w92), .b(w89), .a(w83), .x(w197) );
	core_6502_nor3 g132 (.c(w95), .b(w85), .a(w107), .x(w198) );
	core_6502_not g133 (.a(w84), .x(w193) );
	core_6502_not g134 (.a(w85), .x(w194) );
	core_6502_nor6 g135 (.f(w102), .e(w96), .d(w94), .c(w93), .a(w106), .b(w88), .x(w181) );
	core_6502_nor8 g136 (.h(w100), .g(w99), .f(w96), .e(w95), .d(w92), .c(w90), .b(w88), .a(w86), .x(w182) );
	core_6502_nor7 g137 (.g(w102), .f(w99), .e(w96), .d(w95), .c(w92), .b(w90), .a(w87), .x(w183) );
	core_6502_nor3 g138 (.c(w99), .b(w90), .a(w87), .x(w184) );
	core_6502_nor8 g139 (.h(w100), .g(w98), .f(w96), .e(w94), .d(w92), .c(w90), .a(w86), .b(w88), .x(w185) );
	core_6502_nor8 g140 (.h(w101), .g(w98), .f(w96), .e(w94), .d(w92), .c(w90), .b(w88), .a(w85), .x(w186) );
	core_6502_nor4 g141 (.d(w100), .c(w98), .b(w91), .a(w89), .x(w187) );
	core_6502_nor5 g142 (.e(w96), .d(w94), .c(w93), .b(w88), .a(w86), .x(w188) );
	core_6502_nor3 g143 (.c(w97), .b(w94), .a(w86), .x(w189) );
	core_6502_nor7 g144 (.g(w98), .f(w96), .e(w94), .d(w92), .c(w90), .a(w84), .b(w88), .x(w145) );
	core_6502_nor8 g145 (.h(w100), .g(w99), .f(w96), .e(w94), .d(w92), .c(w90), .a(w84), .b(w88), .x(w146) );
	core_6502_nor5 g146 (.e(w96), .d(w94), .c(w92), .a(w85), .b(w89), .x(w147) );
	core_6502_nor5 g147 (.e(w96), .d(w94), .c(w93), .a(w84), .b(w89), .x(w148) );
	core_6502_nor5 g148 (.e(w96), .d(w94), .c(w93), .a(w86), .b(w89), .x(w149) );
	core_6502_nor3 g149 (.c(w95), .b(w93), .a(w85), .x(w150) );
	core_6502_nor6 g150 (.f(w101), .e(w96), .d(w95), .c(w92), .b(w90), .a(w88), .x(w151) );
	core_6502_nor4 g151 (.d(w101), .c(w99), .b(w91), .a(w87), .x(w152) );
	core_6502_nor5 g152 (.e(w96), .d(w94), .c(w92), .b(w89), .a(w84), .x(w153) );
	core_6502_nor5 g153 (.e(w96), .d(w94), .c(w93), .b(w89), .a(w85), .x(w154) );
	core_6502_nor6 g154 (.f(w99), .e(w96), .d(w94), .c(w92), .b(w90), .a(w88), .x(w155) );
	core_6502_nor8 g155 (.h(w101), .g(w98), .f(w96), .e(w94), .d(w92), .c(w90), .b(w88), .a(w86), .x(w156) );
	core_6502_nor5 g156 (.e(w102), .d(w99), .c(w92), .b(w91), .a(w88), .x(w157) );
	core_6502_nor5 g157 (.e(w102), .d(w100), .c(w99), .b(w91), .a(w89), .x(w158) );
	core_6502_nor5 g158 (.e(w102), .d(w101), .c(w99), .b(w91), .a(w89), .x(w159) );
	core_6502_nor4 g159 (.d(w102), .c(w101), .b(w99), .a(w89), .x(w160) );
	core_6502_nor4 g160 (.d(w101), .c(w98), .b(w90), .a(w87), .x(w161) );
	core_6502_nor7 g161 (.g(w99), .f(w97), .e(w95), .d(w92), .c(w90), .a(w85), .b(w88), .x(w162) );
	core_6502_nor3 g162 (.c(w98), .b(w90), .a(w87), .x(w163) );
	core_6502_nor8 g163 (.h(w101), .g(w98), .f(w96), .e(w94), .d(w92), .c(w90), .b(w88), .a(w83), .x(w164) );
	core_6502_nor5 g164 (.e(w96), .d(w92), .c(w90), .a(w86), .b(w88), .x(w165) );
	core_6502_nor8 g165 (.h(w102), .g(w100), .f(w98), .e(w96), .d(w95), .c(w93), .b(w91), .a(w88), .x(w166) );
	core_6502_nor3 g166 (.c(w103), .b(w90), .a(w89), .x(w167) );
	core_6502_nor4 g167 (.d(w103), .c(w101), .b(w99), .a(w89), .x(w168) );
	core_6502_nor5 g168 (.e(w103), .d(w96), .c(w92), .b(w90), .a(w87), .x(w169) );
	core_6502_nor8 g169 (.h(w102), .g(w100), .f(w98), .e(w96), .d(w95), .c(w92), .b(w91), .a(w87), .x(w170) );
	core_6502_nor8 g170 (.h(w102), .g(w101), .f(w99), .e(w96), .d(w95), .c(w92), .b(w90), .a(w88), .x(w171) );
	core_6502_nor5 g171 (.e(w102), .d(w101), .c(w98), .b(w91), .a(w89), .x(w172) );
	core_6502_nor g172 (.b(w102), .a(w89), .x(w173) );
	core_6502_nor8 g173 (.h(w102), .g(w101), .f(w98), .e(w96), .d(w95), .c(w92), .b(w91), .a(w88), .x(w174) );
	core_6502_nor6 g174 (.f(w102), .e(w96), .d(w95), .c(w92), .b(w90), .a(w87), .x(w175) );
	core_6502_nor8 g175 (.h(w102), .g(w101), .f(w98), .e(w96), .d(w95), .c(w92), .b(w91), .a(w87), .x(w176) );
	core_6502_nor7 g176 (.g(w102), .f(w101), .e(w98), .d(w97), .c(w92), .b(w90), .a(w88), .x(w177) );
	core_6502_nor5 g177 (.e(w102), .d(w101), .c(w98), .b(w90), .a(w89), .x(w178) );
	core_6502_nor3 g178 (.c(w95), .b(w93), .a(w84), .x(w179) );
	core_6502_nor5 g179 (.e(w96), .d(w94), .c(w93), .b(w89), .a(w83), .x(w180) );
	core_6502_nor5 g180 (.e(w96), .d(w94), .c(w93), .a(w84), .b(w89), .x(w199) );
	core_6502_nor3 g181 (.c(w95), .b(w93), .a(w85), .x(w200) );
	core_6502_nor5 g182 (.e(w96), .d(w94), .c(w93), .a(w85), .b(w88), .x(w201) );
	core_6502_nor6 g183 (.f(w100), .e(w96), .d(w94), .c(w92), .b(w90), .a(w88), .x(w202) );
	core_6502_nor7 g184 (.g(w101), .f(w98), .e(w96), .d(w94), .c(w92), .b(w90), .a(w88), .x(w203) );
	core_6502_nor6 g185 (.f(w99), .e(w97), .d(w95), .c(w92), .b(w90), .a(w88), .x(w204) );
	core_6502_nor3 g186 (.c(w100), .b(w98), .a(w91), .x(w205) );
	core_6502_nor8 g187 (.h(w100), .g(w98), .f(w96), .e(w94), .d(w92), .c(w90), .b(w88), .a(w84), .x(w206) );
	core_6502_nor8 g188 (.h(w100), .g(w98), .f(w96), .e(w95), .d(w92), .c(w90), .b(w88), .a(w86), .x(w207) );
	core_6502_nor7 g189 (.g(w100), .f(w96), .e(w95), .d(w92), .c(w90), .b(w88), .a(w86), .x(w208) );
	core_6502_nor7 g190 (.g(w99), .f(w97), .e(w95), .d(w92), .c(w90), .b(w88), .a(w84), .x(w209) );
	core_6502_not g191 (.a(w90), .x(w234) );
endmodule // core_6502

// Module Definitions [It is possible to wrap here on your primitives]

module core_6502_IRQPad (  n_IRQ, n_IRQP, nq, q, en, d, PHI1, PHI2, a0, a1, b, b, a1, a0, x, x, a, x, a, x);

	input wire n_IRQ;
	output wire n_IRQP;
	output wire nq;
	output wire q;
	input wire en;
	input wire d;
	input wire PHI1;
	input wire PHI2;
	input wire a0;
	input wire a1;
	input wire b;
	input wire b;
	input wire a1;
	input wire a0;
	output wire x;
	output wire x;
	input wire a;
	output wire x;
	input wire a;
	output wire x;

endmodule // core_6502_IRQPad

module core_6502_BranchTaken (  n_IR6, n_IR7, n_IR5, a, a, x, x, a, b, c, a, b, c, a, b, c, d, a, b, c, a, b, c, a, b, a0, a1, b, x, x, x, x, x, x, x, n_BRTAKEN, n_ZOUT, n_NOUT, n_VOUT, n_COUT);

	input wire n_IR6;
	input wire n_IR7;
	input wire n_IR5;
	input wire a;
	input wire a;
	output wire x;
	output wire x;
	input wire a;
	input wire b;
	input wire c;
	input wire a;
	input wire b;
	input wire c;
	input wire a;
	input wire b;
	input wire c;
	input wire d;
	input wire a;
	input wire b;
	input wire c;
	input wire a;
	input wire b;
	input wire c;
	input wire a;
	input wire b;
	input wire a0;
	input wire a1;
	input wire b;
	output wire x;
	output wire x;
	output wire x;
	output wire x;
	output wire x;
	output wire x;
	output wire x;
	output wire n_BRTAKEN;
	input wire n_ZOUT;
	input wire n_NOUT;
	input wire n_VOUT;
	input wire n_COUT;

endmodule // core_6502_BranchTaken

module core_6502_not (  a, x);

	input wire a;
	output wire x;

endmodule // core_6502_not

module core_6502_nor3 (  a, b, c, x);

	input wire a;
	input wire b;
	input wire c;
	output wire x;

endmodule // core_6502_nor3

module core_6502_nor4 (  a, b, c, d, x);

	input wire a;
	input wire b;
	input wire c;
	input wire d;
	output wire x;

endmodule // core_6502_nor4

module core_6502_nor (  a, b, x);

	input wire a;
	input wire b;
	output wire x;

endmodule // core_6502_nor

module core_6502_aoi (  a0, a1, b, x);

	input wire a0;
	input wire a1;
	input wire b;
	output wire x;

endmodule // core_6502_aoi

module core_6502_dlatch (  nq, q, en, d);

	output wire nq;
	output wire q;
	input wire en;
	input wire d;

endmodule // core_6502_dlatch

module core_6502_transp (  d, nq, q);

	input wire d;
	output wire nq;
	output wire q;

endmodule // core_6502_transp

module core_6502_nor5 (  a, b, c, d, e, x);

	input wire a;
	input wire b;
	input wire c;
	input wire d;
	input wire e;
	output wire x;

endmodule // core_6502_nor5

module core_6502_aoi211 (  a0, a1, b, c, x);

	input wire a0;
	input wire a1;
	input wire b;
	input wire c;
	output wire x;

endmodule // core_6502_aoi211

module core_6502_buf (  a, x);

	input wire a;
	output wire x;

endmodule // core_6502_buf

module core_6502_muxe0_comp (  ck, cck, a1, a0, e0, x);

	input wire ck;
	input wire cck;
	input wire a1;
	input wire a0;
	input wire e0;
	output wire x;

endmodule // core_6502_muxe0_comp

module core_6502_nor7 (  g, f, e, d, c, b, a, x);

	input wire g;
	input wire f;
	input wire e;
	input wire d;
	input wire c;
	input wire b;
	input wire a;
	output wire x;

endmodule // core_6502_nor7

module core_6502_nor8 (  h, g, f, e, d, c, b, a, x);

	input wire h;
	input wire g;
	input wire f;
	input wire e;
	input wire d;
	input wire c;
	input wire b;
	input wire a;
	output wire x;

endmodule // core_6502_nor8

module core_6502_nor6 (  f, e, d, c, b, a, x);

	input wire f;
	input wire e;
	input wire d;
	input wire c;
	input wire b;
	input wire a;
	output wire x;

endmodule // core_6502_nor6



// ERROR: floating wire w1
// ERROR: floating wire w2
// ERROR: conflicting wire w3
// ERROR: floating wire w6
// ERROR: floating wire w13
// ERROR: floating wire w14
// ERROR: floating wire w15
// ERROR: floating wire w16
// ERROR: floating wire w17
// ERROR: conflicting wire w18
// ERROR: floating wire w20
// ERROR: floating wire w23
// WARNING: Cell core_6502_IRQPad:g1 port q not connected.
// WARNING: Cell core_6502_dlatch:g13 port q not connected.
// WARNING: Cell core_6502_transp:g17 port q not connected.
// WARNING: Cell core_6502_transp:g18 port q not connected.
// WARNING: Cell core_6502_transp:g19 port q not connected.
// WARNING: Cell core_6502_transp:g20 port q not connected.
// WARNING: Cell core_6502_transp:g21 port q not connected.
// WARNING: Cell core_6502_transp:g22 port q not connected.
// WARNING: Cell core_6502_transp:g23 port q not connected.
// WARNING: Cell core_6502_transp:g24 port q not connected.
// WARNING: Cell core_6502_dlatch:g25 port nq not connected.
// WARNING: Cell core_6502_dlatch:g26 port nq not connected.
// WARNING: Cell core_6502_dlatch:g27 port nq not connected.
// WARNING: Cell core_6502_dlatch:g28 port nq not connected.
// WARNING: Cell core_6502_dlatch:g29 port nq not connected.
// WARNING: Cell core_6502_dlatch:g30 port nq not connected.
// WARNING: Cell core_6502_dlatch:g31 port nq not connected.
// WARNING: Cell core_6502_dlatch:g32 port nq not connected.
// WARNING: Cell core_6502_transp:g56 port q not connected.
// WARNING: Cell core_6502_transp:g58 port q not connected.
