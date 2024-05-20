// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

// Verilog File 
module top (Gid0,Gid1,Gid2,Gid3,Gid4,Gid5,Gid6,Gid7,Gid8,
Gid9,Gid10,Gid11,Gid12,Gid13,Gid14,Gid15,Gid16,Gid17,Gid18,
Gid19,Gid20,Gid21,Gid22,Gid23,Gid24,Gid25,Gid26,Gid27,Gid28,
Gid29,Gid30,Gid31,Gic0,Gic1,Gic2,Gic3,Gic4,Gic5,Gic6,
Gic7,Gr,God0,God1,God2,God3,God4,God5,God6,God7,
God8,God9,God10,God11,God12,God13,God14,God15,God16,God17,
God18,God19,God20,God21,God22,God23,God24,God25,God26,God27,
God28,God29,God30,God31,keyinput0,keyinput1,keyinput2,keyinput3,keyinput4,keyinput5,
keyinput6,keyinput7,keyinput8,keyinput9,keyinput10,keyinput11,keyinput12,keyinput13,keyinput14,keyinput15,
keyinput16,keyinput17,keyinput18,keyinput19,keyinput20,keyinput21,keyinput22,keyinput23,keyinput24,keyinput25,
keyinput26);

input Gid0,Gid1,Gid2,Gid3,Gid4,Gid5,Gid6,Gid7,Gid8,
Gid9,Gid10,Gid11,Gid12,Gid13,Gid14,Gid15,Gid16,Gid17,Gid18,
Gid19,Gid20,Gid21,Gid22,Gid23,Gid24,Gid25,Gid26,Gid27,Gid28,
Gid29,Gid30,Gid31,Gic0,Gic1,Gic2,Gic3,Gic4,Gic5,Gic6,
Gic7,Gr,keyinput0,keyinput1,keyinput2,keyinput3,keyinput4,keyinput5,keyinput6,keyinput7,
keyinput8,keyinput9,keyinput10,keyinput11,keyinput12,keyinput13,keyinput14,keyinput15,keyinput16,keyinput17,
keyinput18,keyinput19,keyinput20,keyinput21,keyinput22,keyinput23,keyinput24,keyinput25,keyinput26;

output God0,God1,God2,God3,God4,God5,God6,God7,God8,
God9,God10,God11,God12,God13,God14,God15,God16,God17,God18,
God19,God20,God21,God22,God23,God24,God25,God26,God27,God28,
God29,God30,God31;

wire Gxa0,Gxa1,Gxa2,Gxa3,Gxa4,Gxa5,Gxa6,Gxa7,Gxa8,
Gxa9,Gxa10,Gxa11,Gxa12,Gxa13,Gxa14,Gxa15,Gh0,Gh1,Gh2,
Gh3,Gh4,Gh5,Gh6,Gh7,Gxb0,Gxc0,Gxb1,Gxc1,Gxb2,
Gxc2,Gxb3,Gxc3,Gxb4,Gxc4,Gxb5,Gxc5,Gxb6,Gxc6,Gxb7,
Gxc7,Gf0,Gf1,Gf2,Gf3,Gf4,Gf5,Gf6,Gf7,Gxe0,
Gxe1,Gxe2,Gxe3,Gxe4,Gxe5,Gxe6,Gxe7,Gg0,Gg1,Gg2,
Gg3,Gg4,Gg5,Gg6,Gg7,Gxd0,Gxd1,Gxd2,Gxd3,Gxd4,
Gxd5,Gxd6,Gxd7,Gs0,Gs1,Gs2,Gs3,Gs4,Gs5,Gs6,
Gs7,Gy0a,Gy1a,Gy2a,Gy0b,Gy1b,Gy3b,Gy0c,Gy2c,Gy3c,
Gy1d,Gy2d,Gy3d,Gy5i,Gy7i,Gy5j,Gy6j,Gy4k,Gy7k,Gy4l,
Gy6l,Gy4a,Gy5a,Gy6a,Gy4b,Gy5b,Gy7b,Gy4c,Gy6c,Gy7c,
Gy5d,Gy6d,Gy7d,Gy1i,Gy3i,Gy1j,Gy2j,Gy0k,Gy3k,Gy0l,
Gy2l,Gt0,Gt1,Gt2,Gt3,Gt4,Gt5,Gt6,Gt7,Gu0,
Gu1,Gwa,Gwb,Gwc,Gwd,Gwe,Gwf,Gwg,Gwh,Ge0,
Ge1,Ge2,Ge3,Ge4,Ge5,Ge6,Ge7,Ge8,Ge9,Ge10,
Ge11,Ge12,Ge13,Ge14,Ge15,Ge16,Ge17,Ge18,Ge19,Ge20,
Ge21,Ge22,Ge23,Ge24,Ge25,Ge26,Ge27,Ge28,Ge29,Ge30,
Ge31,muxed0,muxed1,muxed2,muxed3,muxed4,muxed5,muxed6,muxed7,muxed8,
muxed9,muxed10,muxed11,muxed12,muxed13,muxed14,muxed15,muxed16,muxed17,muxed18,
muxed19,muxed20,muxed21,muxed22,muxed23,muxed24,muxed25,muxed26;
xor gate_0(Gxa0,Gid0,Gid1);
xor gate_1(Gxa1,Gid2,Gid3);
xor gate_2(Gxa2,Gid4,Gid5);
xor gate_3(Gxa3,Gid6,Gid7);
xor gate_4(Gxa4,Gid8,Gid9);
xor gate_5(Gxa5,Gid10,Gid11);
xor gate_6(Gxa6,Gid12,Gid13);
xor gate_7(Gxa7,Gid14,Gid15);
xor gate_8(Gxa8,Gid16,Gid17);
xor gate_9(Gxa9,Gid18,Gid19);
xor gate_10(Gxa10,Gid20,Gid21);
xor gate_11(Gxa11,Gid22,Gid23);
xor gate_12(Gxa12,Gid24,Gid25);
xor gate_13(Gxa13,Gid26,Gid27);
xor gate_14(Gxa14,Gid28,Gid29);
xor gate_15(Gxa15,Gid30,Gid31);
and gate_16(Gh0,Gic0,Gr);
and gate_17(Gh1,Gic1,Gr);
and gate_18(Gh2,Gic2,Gr);
and gate_19(Gh3,Gic3,Gr);
and gate_20(Gh4,Gic4,Gr);
and gate_21(Gh5,Gic5,Gr);
and gate_22(Gh6,Gic6,Gr);
and gate_23(Gh7,Gic7,Gr);
xor gate_24(Gxb0,Gid0,Gid4);
xor gate_25(Gxc0,Gid8,Gid12);
xor gate_26(Gxb1,Gid1,Gid5);
xor gate_27(Gxc1,Gid9,Gid13);
xor gate_28(Gxb2,Gid2,Gid6);
xor gate_29(Gxc2,Gid10,Gid14);
xor gate_30(Gxb3,Gid3,Gid7);
xor gate_31(Gxc3,Gid11,Gid15);
xor gate_32(Gxb4,Gid16,Gid20);
xor gate_33(Gxc4,Gid24,Gid28);
xor gate_34(Gxb5,Gid17,Gid21);
xor gate_35(Gxc5,Gid25,Gid29);
xor gate_36(Gxb6,Gid18,Gid22);
xor gate_37(Gxc6,Gid26,Gid30);
xor gate_38(Gxb7,Gid19,Gid23);
xor gate_39(Gxc7,Gid27,Gid31);
xor gate_40(Gf0,Gxa0,Gxa1);
xor gate_41(Gf1,Gxa2,Gxa3);
xor gate_42(Gf2,Gxa4,Gxa5);
xor gate_43(Gf3,Gxa6,Gxa7);
xor gate_44(Gf4,Gxa8,Gxa9);
xor gate_45(Gf5,Gxa10,Gxa11);
xor gate_46(Gf6,Gxa12,Gxa13);
xor gate_47(Gf7,Gxa14,Gxa15);
xor gate_48(Gxe0,Gxb0,Gxc0);
xor gate_49(Gxe1,Gxb1,Gxc1);
xor gate_50(Gxe2,Gxb2,Gxc2);
xor gate_51(Gxe3,Gxb3,Gxc3);
xor gate_52(Gxe4,Gxb4,Gxc4);
xor gate_53(Gxe5,muxed2,Gxc5);
xor gate_54(Gxe6,Gxb6,Gxc6);
xor gate_55(Gxe7,Gxb7,Gxc7);
xor gate_56(Gg0,Gf0,Gf1);
xor gate_57(Gg1,Gf2,Gf3);
xor gate_58(Gg2,Gf0,Gf2);
xor gate_59(Gg3,Gf1,Gf3);
xor gate_60(Gg4,Gf4,Gf5);
xor gate_61(Gg5,Gf6,Gf7);
xor gate_62(Gg6,Gf4,Gf6);
xor gate_63(Gg7,Gf5,Gf7);
xor gate_64(Gxd0,Gh0,Gg4);
xor gate_65(Gxd1,Gh1,Gg5);
xor gate_66(Gxd2,Gh2,Gg6);
xor gate_67(Gxd3,Gh3,muxed24);
xor gate_68(Gxd4,Gh4,Gg0);
xor gate_69(Gxd5,Gh5,Gg1);
xor gate_70(Gxd6,Gh6,Gg2);
xor gate_71(Gxd7,Gh7,Gg3);
xor gate_72(Gs0,Gxe0,Gxd0);
xor gate_73(Gs1,muxed7,Gxd1);
xor gate_74(Gs2,Gxe2,Gxd2);
xor gate_75(Gs3,muxed0,Gxd3);
xor gate_76(Gs4,Gxe4,Gxd4);
xor gate_77(Gs5,Gxe5,Gxd5);
xor gate_78(Gs6,Gxe6,Gxd6);
xor gate_79(Gs7,Gxe7,Gxd7);
not gate_80(Gy0a,Gs0);
not gate_81(Gy1a,muxed12);
not gate_82(Gy2a,Gs2);
not gate_83(Gy0b,Gs0);
not gate_84(Gy1b,muxed12);
not gate_85(Gy3b,muxed13);
not gate_86(Gy0c,Gs0);
not gate_87(Gy2c,Gs2);
not gate_88(Gy3c,muxed13);
not gate_89(Gy1d,muxed12);
not gate_90(Gy2d,Gs2);
not gate_91(Gy3d,muxed13);
not gate_92(Gy5i,Gs5);
not gate_93(Gy7i,Gs7);
not gate_94(Gy5j,Gs5);
not gate_95(Gy6j,muxed20);
not gate_96(Gy4k,Gs4);
not gate_97(Gy7k,Gs7);
not gate_98(Gy4l,Gs4);
not gate_99(Gy6l,muxed20);
not gate_100(Gy4a,Gs4);
not gate_101(Gy5a,Gs5);
not gate_102(Gy6a,muxed20);
not gate_103(Gy4b,Gs4);
not gate_104(Gy5b,Gs5);
not gate_105(Gy7b,Gs7);
not gate_106(Gy4c,Gs4);
not gate_107(Gy6c,muxed20);
not gate_108(Gy7c,Gs7);
not gate_109(Gy5d,Gs5);
not gate_110(Gy6d,muxed20);
not gate_111(Gy7d,Gs7);
not gate_112(Gy1i,muxed12);
not gate_113(Gy3i,muxed13);
not gate_114(Gy1j,muxed12);
not gate_115(Gy2j,Gs2);
not gate_116(Gy0k,Gs0);
not gate_117(Gy3k,muxed13);
not gate_118(Gy0l,Gs0);
not gate_119(Gy2l,Gs2);
and gate_120(Gt0,muxed17,Gy1a,Gy2a,muxed13);
and gate_121(Gt1,Gy0b,Gy1b,Gs2,muxed18);
and gate_122(Gt2,Gy0c,muxed12,Gy2c,Gy3c);
and gate_123(Gt3,Gs0,Gy1d,Gy2d,Gy3d);
and gate_124(Gt4,Gy4a,Gy5a,Gy6a,Gs7);
and gate_125(Gt5,Gy4b,Gy5b,muxed20,Gy7b);
and gate_126(Gt6,Gy4c,Gs5,muxed25,Gy7c);
and gate_127(Gt7,Gs4,Gy5d,Gy6d,Gy7d);
or gate_128(Gu0,muxed4,muxed16,Gt2,Gt3);
or gate_129(Gu1,Gt4,Gt5,muxed23,Gt7);
and gate_130(Gwa,Gs4,Gy5i,muxed20,muxed11,muxed15);
and gate_131(Gwb,Gs4,Gy5j,Gy6j,Gs7,muxed15);
and gate_132(Gwc,Gy4k,Gs5,muxed20,Gy7k,muxed15);
and gate_133(Gwd,Gy4l,Gs5,Gy6l,Gs7,muxed15);
and gate_134(Gwe,Gs0,Gy1i,Gs2,Gy3i,muxed22);
and gate_135(Gwf,Gs0,Gy1j,Gy2j,muxed13,muxed22);
and gate_136(Gwg,Gy0k,muxed12,Gs2,Gy3k,muxed22);
and gate_137(Gwh,Gy0l,muxed12,Gy2l,muxed13,muxed22);
and gate_138(Ge0,Gs0,Gwa);
and gate_139(Ge1,muxed12,Gwa);
and gate_140(Ge2,Gs2,Gwa);
and gate_141(Ge3,muxed13,Gwa);
and gate_142(Ge4,Gs0,Gwb);
and gate_143(Ge5,muxed12,Gwb);
and gate_144(Ge6,Gs2,Gwb);
and gate_145(Ge7,muxed13,Gwb);
and gate_146(Ge8,Gs0,Gwc);
and gate_147(Ge9,muxed12,Gwc);
and gate_148(Ge10,Gs2,Gwc);
and gate_149(Ge11,muxed13,Gwc);
and gate_150(Ge12,Gs0,muxed14);
and gate_151(Ge13,muxed12,muxed14);
and gate_152(Ge14,Gs2,muxed14);
and gate_153(Ge15,muxed13,muxed14);
and gate_154(Ge16,Gs4,Gwe);
and gate_155(Ge17,Gs5,Gwe);
and gate_156(Ge18,muxed20,Gwe);
and gate_157(Ge19,Gs7,Gwe);
and gate_158(Ge20,Gs4,Gwf);
and gate_159(Ge21,Gs5,Gwf);
and gate_160(Ge22,muxed20,Gwf);
and gate_161(Ge23,Gs7,Gwf);
and gate_162(Ge24,Gs4,Gwg);
and gate_163(Ge25,Gs5,Gwg);
and gate_164(Ge26,muxed20,Gwg);
and gate_165(Ge27,Gs7,Gwg);
and gate_166(Ge28,Gs4,muxed9);
and gate_167(Ge29,Gs5,muxed9);
and gate_168(Ge30,muxed20,muxed9);
and gate_169(Ge31,Gs7,muxed9);
xor gate_170(God0,Gid0,Ge0);
xor gate_171(God1,Gid1,Ge1);
xor gate_172(God2,Gid2,Ge2);
xor gate_173(God3,Gid3,Ge3);
xor gate_174(God4,Gid4,Ge4);
xor gate_175(God5,Gid5,Ge5);
xor gate_176(God6,Gid6,Ge6);
xor gate_177(God7,Gid7,Ge7);
xor gate_178(God8,Gid8,Ge8);
xor gate_179(God9,Gid9,Ge9);
xor gate_180(God10,Gid10,Ge10);
xor gate_181(God11,Gid11,Ge11);
xor gate_182(God12,Gid12,Ge12);
xor gate_183(God13,Gid13,Ge13);
xor gate_184(God14,Gid14,Ge14);
xor gate_185(God15,Gid15,Ge15);
xor gate_186(God16,Gid16,Ge16);
xor gate_187(God17,Gid17,Ge17);
xor gate_188(God18,Gid18,Ge18);
xor gate_189(God19,Gid19,Ge19);
xor gate_190(God20,Gid20,Ge20);
xor gate_191(God21,Gid21,Ge21);
xor gate_192(God22,Gid22,Ge22);
xor gate_193(God23,Gid23,Ge23);
xor gate_194(God24,Gid24,Ge24);
xor gate_195(God25,Gid25,Ge25);
xor gate_196(God26,Gid26,Ge26);
xor gate_197(God27,Gid27,Ge27);
xor gate_198(God28,Gid28,Ge28);
xor gate_199(God29,Gid29,Ge29);
xor gate_200(God30,Gid30,Ge30);
xor gate_201(God31,Gid31,muxed3);
assign muxed0 = keyinput0 ? Gxe3 : muxed1;
assign muxed1 = keyinput1 ? God31 : muxed24;
assign muxed2 = keyinput2 ? Gxb5 : God31;
assign muxed3 = keyinput3 ? muxed19 : Gy7k;
assign muxed4 = keyinput4 ? Gt0 : muxed19;
assign muxed5 = keyinput5 ? muxed10 : Gy3i;
assign muxed6 = keyinput6 ? Gs3 : Gxe4;
assign muxed7 = keyinput7 ? Gxe1 : muxed19;
assign muxed8 = keyinput8 ? Ge31 : Gy6j;
assign muxed9 = keyinput9 ? muxed5 : Gt3;
assign muxed10 = keyinput10 ? muxed21 : Ge21;
assign muxed11 = keyinput11 ? Gy7i : muxed21;
assign muxed12 = keyinput12 ? Gs1 : Ge2;
assign muxed13 = keyinput13 ? muxed6 : muxed14;
assign muxed14 = keyinput14 ? Gwd : Ge8;
assign muxed15 = keyinput15 ? Gu0 : Ge31;
assign muxed16 = keyinput16 ? Gt1 : Gh2;
assign muxed17 = keyinput17 ? Gy0a : Gt1;
assign muxed18 = keyinput18 ? muxed26 : Gf7;
assign muxed19 = keyinput19 ? muxed8 : muxed26;
assign muxed20 = keyinput20 ? Gs6 : muxed21;
assign muxed21 = keyinput21 ? Gwh : Gh1;
assign muxed22 = keyinput22 ? Gu1 : Gwa;
assign muxed23 = keyinput23 ? Gt6 : Gy1a;
assign muxed24 = keyinput24 ? Gg7 : Gt6;
assign muxed25 = keyinput25 ? Gy6c : Gt0;
assign muxed26 = keyinput26 ? Gy3b : Gy6c;
endmodule
