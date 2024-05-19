// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by Tang Dynasty v5.6.59063
// Thu Oct  6 13:01:16 2022

`timescale 1ns / 1ps
module ramfifo  // ramfifo.v(14)
  (
  clk,
  di,
  re,
  rst,
  we,
  do,
  empty_flag,
  full_flag,
  rdusedw,
  wrusedw
  );

  input clk;  // ramfifo.v(24)
  input [15:0] di;  // ramfifo.v(23)
  input re;  // ramfifo.v(25)
  input rst;  // ramfifo.v(22)
  input we;  // ramfifo.v(24)
  output [15:0] do;  // ramfifo.v(27)
  output empty_flag;  // ramfifo.v(28)
  output full_flag;  // ramfifo.v(29)
  output [10:0] rdusedw;  // ramfifo.v(30)
  output [10:0] wrusedw;  // ramfifo.v(31)

  wire logic_ramfifo_syn_1;  // ramfifo.v(39)
  wire logic_ramfifo_syn_2;  // ramfifo.v(39)
  wire logic_ramfifo_syn_3;  // ramfifo.v(39)
  wire logic_ramfifo_syn_4;  // ramfifo.v(39)
  wire logic_ramfifo_syn_5;  // ramfifo.v(39)
  wire logic_ramfifo_syn_6;  // ramfifo.v(39)
  wire logic_ramfifo_syn_7;  // ramfifo.v(39)
  wire logic_ramfifo_syn_8;  // ramfifo.v(39)
  wire logic_ramfifo_syn_9;  // ramfifo.v(39)
  wire logic_ramfifo_syn_10;  // ramfifo.v(39)
  wire logic_ramfifo_syn_11;  // ramfifo.v(39)
  wire logic_ramfifo_syn_12;  // ramfifo.v(39)
  wire logic_ramfifo_syn_13;  // ramfifo.v(39)
  wire logic_ramfifo_syn_14;  // ramfifo.v(39)
  wire logic_ramfifo_syn_15;  // ramfifo.v(39)
  wire logic_ramfifo_syn_16;  // ramfifo.v(39)
  wire logic_ramfifo_syn_17;  // ramfifo.v(39)
  wire logic_ramfifo_syn_18;  // ramfifo.v(39)
  wire logic_ramfifo_syn_19;  // ramfifo.v(39)
  wire logic_ramfifo_syn_20;  // ramfifo.v(39)
  wire logic_ramfifo_syn_21;  // ramfifo.v(39)
  wire logic_ramfifo_syn_22;  // ramfifo.v(39)
  wire logic_ramfifo_syn_23;  // ramfifo.v(39)
  wire logic_ramfifo_syn_24;  // ramfifo.v(39)
  wire logic_ramfifo_syn_25;  // ramfifo.v(39)
  wire logic_ramfifo_syn_26;  // ramfifo.v(39)
  wire logic_ramfifo_syn_27;  // ramfifo.v(39)
  wire logic_ramfifo_syn_28;  // ramfifo.v(39)
  wire logic_ramfifo_syn_29;  // ramfifo.v(39)
  wire logic_ramfifo_syn_30;  // ramfifo.v(39)
  wire logic_ramfifo_syn_31;  // ramfifo.v(39)
  wire logic_ramfifo_syn_32;  // ramfifo.v(39)
  wire logic_ramfifo_syn_33;  // ramfifo.v(39)
  wire logic_ramfifo_syn_45;  // ramfifo.v(39)
  wire logic_ramfifo_syn_46;  // ramfifo.v(39)
  wire logic_ramfifo_syn_47;  // ramfifo.v(39)
  wire logic_ramfifo_syn_48;  // ramfifo.v(39)
  wire logic_ramfifo_syn_49;  // ramfifo.v(39)
  wire logic_ramfifo_syn_50;  // ramfifo.v(39)
  wire logic_ramfifo_syn_51;  // ramfifo.v(39)
  wire logic_ramfifo_syn_52;  // ramfifo.v(39)
  wire logic_ramfifo_syn_53;  // ramfifo.v(39)
  wire logic_ramfifo_syn_54;  // ramfifo.v(39)
  wire logic_ramfifo_syn_55;  // ramfifo.v(39)
  wire logic_ramfifo_syn_56;  // ramfifo.v(39)
  wire logic_ramfifo_syn_57;  // ramfifo.v(39)
  wire logic_ramfifo_syn_58;  // ramfifo.v(39)
  wire logic_ramfifo_syn_59;  // ramfifo.v(39)
  wire logic_ramfifo_syn_60;  // ramfifo.v(39)
  wire logic_ramfifo_syn_61;  // ramfifo.v(39)
  wire logic_ramfifo_syn_62;  // ramfifo.v(39)
  wire logic_ramfifo_syn_63;  // ramfifo.v(39)
  wire logic_ramfifo_syn_64;  // ramfifo.v(39)
  wire logic_ramfifo_syn_65;  // ramfifo.v(39)
  wire logic_ramfifo_syn_66;  // ramfifo.v(39)
  wire logic_ramfifo_syn_67;  // ramfifo.v(39)
  wire logic_ramfifo_syn_68;  // ramfifo.v(39)
  wire logic_ramfifo_syn_69;  // ramfifo.v(39)
  wire logic_ramfifo_syn_70;  // ramfifo.v(39)
  wire logic_ramfifo_syn_71;  // ramfifo.v(39)
  wire logic_ramfifo_syn_72;  // ramfifo.v(39)
  wire logic_ramfifo_syn_73;  // ramfifo.v(39)
  wire logic_ramfifo_syn_74;  // ramfifo.v(39)
  wire logic_ramfifo_syn_75;  // ramfifo.v(39)
  wire logic_ramfifo_syn_76;  // ramfifo.v(39)
  wire logic_ramfifo_syn_78;  // ramfifo.v(39)
  wire logic_ramfifo_syn_79;  // ramfifo.v(39)
  wire logic_ramfifo_syn_80;  // ramfifo.v(39)
  wire logic_ramfifo_syn_81;  // ramfifo.v(39)
  wire logic_ramfifo_syn_82;  // ramfifo.v(39)
  wire logic_ramfifo_syn_83;  // ramfifo.v(39)
  wire logic_ramfifo_syn_84;  // ramfifo.v(39)
  wire logic_ramfifo_syn_85;  // ramfifo.v(39)
  wire logic_ramfifo_syn_86;  // ramfifo.v(39)
  wire logic_ramfifo_syn_87;  // ramfifo.v(39)
  wire logic_ramfifo_syn_88;  // ramfifo.v(39)
  wire logic_ramfifo_syn_89;  // ramfifo.v(39)
  wire logic_ramfifo_syn_90;  // ramfifo.v(39)
  wire logic_ramfifo_syn_91;  // ramfifo.v(39)
  wire logic_ramfifo_syn_92;  // ramfifo.v(39)
  wire logic_ramfifo_syn_93;  // ramfifo.v(39)
  wire logic_ramfifo_syn_94;  // ramfifo.v(39)
  wire logic_ramfifo_syn_95;  // ramfifo.v(39)
  wire logic_ramfifo_syn_96;  // ramfifo.v(39)
  wire logic_ramfifo_syn_97;  // ramfifo.v(39)
  wire logic_ramfifo_syn_98;  // ramfifo.v(39)
  wire logic_ramfifo_syn_99;  // ramfifo.v(39)
  wire logic_ramfifo_syn_100;  // ramfifo.v(39)
  wire logic_ramfifo_syn_101;  // ramfifo.v(39)
  wire logic_ramfifo_syn_102;  // ramfifo.v(39)
  wire logic_ramfifo_syn_103;  // ramfifo.v(39)
  wire logic_ramfifo_syn_104;  // ramfifo.v(39)
  wire logic_ramfifo_syn_105;  // ramfifo.v(39)
  wire logic_ramfifo_syn_106;  // ramfifo.v(39)
  wire logic_ramfifo_syn_107;  // ramfifo.v(39)
  wire logic_ramfifo_syn_108;  // ramfifo.v(39)
  wire logic_ramfifo_syn_109;  // ramfifo.v(39)
  wire logic_ramfifo_syn_152;  // ramfifo.v(39)
  wire logic_ramfifo_syn_154;  // ramfifo.v(39)
  wire logic_ramfifo_syn_158;  // ramfifo.v(39)
  wire logic_ramfifo_syn_159;  // ramfifo.v(39)
  wire logic_ramfifo_syn_160;  // ramfifo.v(39)
  wire logic_ramfifo_syn_161;  // ramfifo.v(39)
  wire logic_ramfifo_syn_162;  // ramfifo.v(39)
  wire logic_ramfifo_syn_163;  // ramfifo.v(39)
  wire logic_ramfifo_syn_164;  // ramfifo.v(39)
  wire logic_ramfifo_syn_165;  // ramfifo.v(39)
  wire logic_ramfifo_syn_166;  // ramfifo.v(39)
  wire logic_ramfifo_syn_167;  // ramfifo.v(39)
  wire logic_ramfifo_syn_168;  // ramfifo.v(39)
  wire logic_ramfifo_syn_169;  // ramfifo.v(39)
  wire logic_ramfifo_syn_173;  // ramfifo.v(39)
  wire logic_ramfifo_syn_175;  // ramfifo.v(39)
  wire logic_ramfifo_syn_205;  // ramfifo.v(39)
  wire logic_ramfifo_syn_225;  // ramfifo.v(39)
  wire logic_ramfifo_syn_226;  // ramfifo.v(39)
  wire logic_ramfifo_syn_227;  // ramfifo.v(39)
  wire logic_ramfifo_syn_228;  // ramfifo.v(39)
  wire logic_ramfifo_syn_229;  // ramfifo.v(39)
  wire logic_ramfifo_syn_230;  // ramfifo.v(39)
  wire logic_ramfifo_syn_231;  // ramfifo.v(39)
  wire logic_ramfifo_syn_232;  // ramfifo.v(39)
  wire logic_ramfifo_syn_233;  // ramfifo.v(39)
  wire logic_ramfifo_syn_234;  // ramfifo.v(39)
  wire logic_ramfifo_syn_235;  // ramfifo.v(39)
  wire logic_ramfifo_syn_253;  // ramfifo.v(39)
  wire logic_ramfifo_syn_255;  // ramfifo.v(39)
  wire logic_ramfifo_syn_257;  // ramfifo.v(39)
  wire logic_ramfifo_syn_259;  // ramfifo.v(39)
  wire logic_ramfifo_syn_261;  // ramfifo.v(39)
  wire logic_ramfifo_syn_263;  // ramfifo.v(39)
  wire logic_ramfifo_syn_265;  // ramfifo.v(39)
  wire logic_ramfifo_syn_267;  // ramfifo.v(39)
  wire logic_ramfifo_syn_269;  // ramfifo.v(39)
  wire logic_ramfifo_syn_271;  // ramfifo.v(39)
  wire logic_ramfifo_syn_276;  // ramfifo.v(39)
  wire logic_ramfifo_syn_278;  // ramfifo.v(39)
  wire logic_ramfifo_syn_280;  // ramfifo.v(39)
  wire logic_ramfifo_syn_282;  // ramfifo.v(39)
  wire logic_ramfifo_syn_284;  // ramfifo.v(39)
  wire logic_ramfifo_syn_286;  // ramfifo.v(39)
  wire logic_ramfifo_syn_288;  // ramfifo.v(39)
  wire logic_ramfifo_syn_290;  // ramfifo.v(39)
  wire logic_ramfifo_syn_292;  // ramfifo.v(39)
  wire logic_ramfifo_syn_296;  // ramfifo.v(39)
  wire logic_ramfifo_syn_298;  // ramfifo.v(39)
  wire logic_ramfifo_syn_300;  // ramfifo.v(39)
  wire logic_ramfifo_syn_302;  // ramfifo.v(39)
  wire logic_ramfifo_syn_304;  // ramfifo.v(39)
  wire logic_ramfifo_syn_306;  // ramfifo.v(39)
  wire logic_ramfifo_syn_308;  // ramfifo.v(39)
  wire logic_ramfifo_syn_310;  // ramfifo.v(39)
  wire logic_ramfifo_syn_312;  // ramfifo.v(39)
  wire logic_ramfifo_syn_314;  // ramfifo.v(39)
  wire logic_ramfifo_syn_319;  // ramfifo.v(39)
  wire logic_ramfifo_syn_321;  // ramfifo.v(39)
  wire logic_ramfifo_syn_323;  // ramfifo.v(39)
  wire logic_ramfifo_syn_325;  // ramfifo.v(39)
  wire logic_ramfifo_syn_327;  // ramfifo.v(39)
  wire logic_ramfifo_syn_329;  // ramfifo.v(39)
  wire logic_ramfifo_syn_331;  // ramfifo.v(39)
  wire logic_ramfifo_syn_333;  // ramfifo.v(39)
  wire logic_ramfifo_syn_335;  // ramfifo.v(39)
  wire logic_ramfifo_syn_539;  // ramfifo.v(39)
  wire logic_ramfifo_syn_540;  // ramfifo.v(39)
  wire logic_ramfifo_syn_541;  // ramfifo.v(39)
  wire logic_ramfifo_syn_542;  // ramfifo.v(39)
  wire logic_ramfifo_syn_543;  // ramfifo.v(39)
  wire logic_ramfifo_syn_544;  // ramfifo.v(39)
  wire logic_ramfifo_syn_545;  // ramfifo.v(39)
  wire logic_ramfifo_syn_546;  // ramfifo.v(39)
  wire logic_ramfifo_syn_547;  // ramfifo.v(39)
  wire logic_ramfifo_syn_548;  // ramfifo.v(39)
  wire logic_ramfifo_syn_549;  // ramfifo.v(39)
  wire logic_ramfifo_syn_550;  // ramfifo.v(39)
  wire logic_ramfifo_syn_551;  // ramfifo.v(39)
  wire logic_ramfifo_syn_552;  // ramfifo.v(39)
  wire logic_ramfifo_syn_553;  // ramfifo.v(39)
  wire logic_ramfifo_syn_554;  // ramfifo.v(39)
  wire logic_ramfifo_syn_555;  // ramfifo.v(39)
  wire logic_ramfifo_syn_556;  // ramfifo.v(39)
  wire logic_ramfifo_syn_557;  // ramfifo.v(39)
  wire logic_ramfifo_syn_558;  // ramfifo.v(39)
  wire logic_ramfifo_syn_559;  // ramfifo.v(39)
  wire logic_ramfifo_syn_605;  // ramfifo.v(39)
  wire logic_ramfifo_syn_606;  // ramfifo.v(39)
  wire logic_ramfifo_syn_607;  // ramfifo.v(39)
  wire logic_ramfifo_syn_608;  // ramfifo.v(39)
  wire logic_ramfifo_syn_609;  // ramfifo.v(39)
  wire logic_ramfifo_syn_610;  // ramfifo.v(39)
  wire logic_ramfifo_syn_611;  // ramfifo.v(39)
  wire logic_ramfifo_syn_612;  // ramfifo.v(39)
  wire logic_ramfifo_syn_613;  // ramfifo.v(39)
  wire logic_ramfifo_syn_614;  // ramfifo.v(39)
  wire logic_ramfifo_syn_615;  // ramfifo.v(39)
  wire logic_ramfifo_syn_616;  // ramfifo.v(39)
  wire logic_ramfifo_syn_617;  // ramfifo.v(39)
  wire logic_ramfifo_syn_618;  // ramfifo.v(39)
  wire logic_ramfifo_syn_619;  // ramfifo.v(39)
  wire logic_ramfifo_syn_620;  // ramfifo.v(39)
  wire logic_ramfifo_syn_621;  // ramfifo.v(39)
  wire logic_ramfifo_syn_622;  // ramfifo.v(39)
  wire logic_ramfifo_syn_623;  // ramfifo.v(39)
  wire logic_ramfifo_syn_624;  // ramfifo.v(39)
  wire logic_ramfifo_syn_625;  // ramfifo.v(39)
  wire logic_ramfifo_syn_672;  // ramfifo.v(39)
  wire logic_ramfifo_syn_673;  // ramfifo.v(39)
  wire logic_ramfifo_syn_674;  // ramfifo.v(39)
  wire logic_ramfifo_syn_675;  // ramfifo.v(39)
  wire logic_ramfifo_syn_676;  // ramfifo.v(39)
  wire logic_ramfifo_syn_677;  // ramfifo.v(39)
  wire logic_ramfifo_syn_678;  // ramfifo.v(39)
  wire logic_ramfifo_syn_679;  // ramfifo.v(39)
  wire logic_ramfifo_syn_680;  // ramfifo.v(39)
  wire logic_ramfifo_syn_681;  // ramfifo.v(39)
  wire logic_ramfifo_syn_682;  // ramfifo.v(39)
  wire logic_ramfifo_syn_730;  // ramfifo.v(39)
  wire logic_ramfifo_syn_731;  // ramfifo.v(39)
  wire logic_ramfifo_syn_732;  // ramfifo.v(39)
  wire logic_ramfifo_syn_733;  // ramfifo.v(39)
  wire logic_ramfifo_syn_734;  // ramfifo.v(39)
  wire logic_ramfifo_syn_735;  // ramfifo.v(39)
  wire logic_ramfifo_syn_736;  // ramfifo.v(39)
  wire logic_ramfifo_syn_737;  // ramfifo.v(39)
  wire logic_ramfifo_syn_738;  // ramfifo.v(39)
  wire logic_ramfifo_syn_739;  // ramfifo.v(39)
  wire logic_ramfifo_syn_740;  // ramfifo.v(39)
  wire clk_syn_1;  // ramfifo.v(24)
  wire clk_syn_2;  // ramfifo.v(24)
  wire clk_syn_3;  // ramfifo.v(24)
  wire clk_syn_4;  // ramfifo.v(24)
  wire clk_syn_5;  // ramfifo.v(24)
  wire clk_syn_6;  // ramfifo.v(24)
  wire clk_syn_7;  // ramfifo.v(24)
  wire clk_syn_8;  // ramfifo.v(24)
  wire clk_syn_9;  // ramfifo.v(24)
  wire clk_syn_10;  // ramfifo.v(24)
  wire clk_syn_11;  // ramfifo.v(24)
  wire clk_syn_12;  // ramfifo.v(24)
  wire clk_syn_14;  // ramfifo.v(24)
  wire clk_syn_16;  // ramfifo.v(24)
  wire clk_syn_18;  // ramfifo.v(24)
  wire clk_syn_20;  // ramfifo.v(24)
  wire clk_syn_22;  // ramfifo.v(24)
  wire clk_syn_24;  // ramfifo.v(24)
  wire clk_syn_26;  // ramfifo.v(24)
  wire clk_syn_28;  // ramfifo.v(24)
  wire clk_syn_30;  // ramfifo.v(24)
  wire clk_syn_32;  // ramfifo.v(24)
  wire clk_syn_34;  // ramfifo.v(24)
  wire clk_syn_40;  // ramfifo.v(24)
  wire clk_syn_42;  // ramfifo.v(24)
  wire clk_syn_44;  // ramfifo.v(24)
  wire clk_syn_46;  // ramfifo.v(24)
  wire clk_syn_48;  // ramfifo.v(24)
  wire clk_syn_50;  // ramfifo.v(24)
  wire clk_syn_52;  // ramfifo.v(24)
  wire clk_syn_54;  // ramfifo.v(24)
  wire clk_syn_56;  // ramfifo.v(24)
  wire clk_syn_58;  // ramfifo.v(24)
  wire clk_syn_60;  // ramfifo.v(24)
  wire clk_syn_62;  // ramfifo.v(24)
  wire clk_syn_64;  // ramfifo.v(24)
  wire clk_syn_66;  // ramfifo.v(24)
  wire clk_syn_68;  // ramfifo.v(24)
  wire clk_syn_70;  // ramfifo.v(24)
  wire clk_syn_72;  // ramfifo.v(24)
  wire clk_syn_74;  // ramfifo.v(24)
  wire clk_syn_76;  // ramfifo.v(24)
  wire clk_syn_78;  // ramfifo.v(24)
  wire clk_syn_80;  // ramfifo.v(24)
  wire clk_syn_81;  // ramfifo.v(24)
  wire clk_syn_82;  // ramfifo.v(24)
  wire clk_syn_83;  // ramfifo.v(24)
  wire clk_syn_84;  // ramfifo.v(24)
  wire clk_syn_85;  // ramfifo.v(24)
  wire clk_syn_86;  // ramfifo.v(24)
  wire clk_syn_87;  // ramfifo.v(24)
  wire clk_syn_88;  // ramfifo.v(24)
  wire clk_syn_89;  // ramfifo.v(24)
  wire clk_syn_90;  // ramfifo.v(24)
  wire clk_syn_91;  // ramfifo.v(24)
  wire clk_syn_92;  // ramfifo.v(24)
  wire clk_syn_94;  // ramfifo.v(24)
  wire clk_syn_95;  // ramfifo.v(24)
  wire clk_syn_96;  // ramfifo.v(24)
  wire clk_syn_97;  // ramfifo.v(24)
  wire clk_syn_98;  // ramfifo.v(24)
  wire clk_syn_99;  // ramfifo.v(24)
  wire clk_syn_100;  // ramfifo.v(24)
  wire clk_syn_101;  // ramfifo.v(24)
  wire clk_syn_102;  // ramfifo.v(24)
  wire clk_syn_103;  // ramfifo.v(24)
  wire clk_syn_104;  // ramfifo.v(24)
  wire clk_syn_105;  // ramfifo.v(24)
  wire clk_syn_107;  // ramfifo.v(24)
  wire clk_syn_109;  // ramfifo.v(24)
  wire clk_syn_111;  // ramfifo.v(24)
  wire clk_syn_113;  // ramfifo.v(24)
  wire clk_syn_115;  // ramfifo.v(24)
  wire clk_syn_117;  // ramfifo.v(24)
  wire clk_syn_119;  // ramfifo.v(24)
  wire clk_syn_121;  // ramfifo.v(24)
  wire clk_syn_123;  // ramfifo.v(24)
  wire clk_syn_125;  // ramfifo.v(24)
  wire clk_syn_127;  // ramfifo.v(24)
  wire clk_syn_133;  // ramfifo.v(24)
  wire clk_syn_135;  // ramfifo.v(24)
  wire clk_syn_137;  // ramfifo.v(24)
  wire clk_syn_139;  // ramfifo.v(24)
  wire clk_syn_141;  // ramfifo.v(24)
  wire clk_syn_143;  // ramfifo.v(24)
  wire clk_syn_145;  // ramfifo.v(24)
  wire clk_syn_147;  // ramfifo.v(24)
  wire clk_syn_149;  // ramfifo.v(24)
  wire clk_syn_151;  // ramfifo.v(24)
  wire clk_syn_153;  // ramfifo.v(24)
  wire clk_syn_155;  // ramfifo.v(24)
  wire clk_syn_157;  // ramfifo.v(24)
  wire clk_syn_159;  // ramfifo.v(24)
  wire clk_syn_161;  // ramfifo.v(24)
  wire clk_syn_163;  // ramfifo.v(24)
  wire clk_syn_165;  // ramfifo.v(24)
  wire clk_syn_167;  // ramfifo.v(24)
  wire clk_syn_169;  // ramfifo.v(24)
  wire clk_syn_171;  // ramfifo.v(24)
  wire clk_syn_173;  // ramfifo.v(24)
  wire clk_syn_174;  // ramfifo.v(24)
  wire clk_syn_175;  // ramfifo.v(24)
  wire clk_syn_176;  // ramfifo.v(24)
  wire clk_syn_177;  // ramfifo.v(24)
  wire clk_syn_178;  // ramfifo.v(24)
  wire clk_syn_179;  // ramfifo.v(24)
  wire clk_syn_180;  // ramfifo.v(24)
  wire clk_syn_181;  // ramfifo.v(24)
  wire clk_syn_182;  // ramfifo.v(24)
  wire clk_syn_183;  // ramfifo.v(24)
  wire clk_syn_184;  // ramfifo.v(24)
  wire clk_syn_185;  // ramfifo.v(24)
  wire re_syn_2;  // ramfifo.v(25)
  wire we_syn_2;  // ramfifo.v(24)
  wire _al_n1_syn_4;
  wire _al_n1_syn_6;
  wire _al_n1_syn_8;
  wire _al_n1_syn_10;
  wire _al_n1_syn_12;
  wire _al_n1_syn_14;
  wire _al_n1_syn_16;
  wire _al_n1_syn_18;
  wire _al_n1_syn_20;
  wire _al_n1_syn_28;
  wire _al_n1_syn_30;
  wire _al_n1_syn_32;
  wire _al_n1_syn_34;
  wire _al_n1_syn_36;
  wire _al_n1_syn_38;
  wire _al_n1_syn_40;
  wire _al_n1_syn_42;
  wire _al_n1_syn_44;

  and _al_n1_syn_11 (_al_n1_syn_12, _al_n1_syn_10, clk_syn_26);
  and _al_n1_syn_13 (_al_n1_syn_14, _al_n1_syn_12, clk_syn_28);
  and _al_n1_syn_15 (_al_n1_syn_16, _al_n1_syn_14, clk_syn_30);
  and _al_n1_syn_17 (_al_n1_syn_18, _al_n1_syn_16, clk_syn_32);
  and _al_n1_syn_19 (_al_n1_syn_20, _al_n1_syn_18, clk_syn_34);
  and _al_n1_syn_27 (_al_n1_syn_28, clk_syn_109, clk_syn_111);
  and _al_n1_syn_29 (_al_n1_syn_30, _al_n1_syn_28, clk_syn_113);
  and _al_n1_syn_3 (_al_n1_syn_4, clk_syn_16, clk_syn_18);
  and _al_n1_syn_31 (_al_n1_syn_32, _al_n1_syn_30, clk_syn_115);
  and _al_n1_syn_33 (_al_n1_syn_34, _al_n1_syn_32, clk_syn_117);
  and _al_n1_syn_35 (_al_n1_syn_36, _al_n1_syn_34, clk_syn_119);
  and _al_n1_syn_37 (_al_n1_syn_38, _al_n1_syn_36, clk_syn_121);
  and _al_n1_syn_39 (_al_n1_syn_40, _al_n1_syn_38, clk_syn_123);
  and _al_n1_syn_41 (_al_n1_syn_42, _al_n1_syn_40, clk_syn_125);
  and _al_n1_syn_43 (_al_n1_syn_44, _al_n1_syn_42, clk_syn_127);
  and _al_n1_syn_5 (_al_n1_syn_6, _al_n1_syn_4, clk_syn_20);
  and _al_n1_syn_7 (_al_n1_syn_8, _al_n1_syn_6, clk_syn_22);
  and _al_n1_syn_9 (_al_n1_syn_10, _al_n1_syn_8, clk_syn_24);
  or clk_syn_106 (clk_syn_107, clk_syn_105, clk_syn_104);  // ramfifo.v(24)
  not clk_syn_108 (clk_syn_109, clk_syn_94);  // ramfifo.v(24)
  not clk_syn_110 (clk_syn_111, clk_syn_95);  // ramfifo.v(24)
  not clk_syn_112 (clk_syn_113, clk_syn_96);  // ramfifo.v(24)
  not clk_syn_114 (clk_syn_115, clk_syn_97);  // ramfifo.v(24)
  not clk_syn_116 (clk_syn_117, clk_syn_98);  // ramfifo.v(24)
  not clk_syn_118 (clk_syn_119, clk_syn_99);  // ramfifo.v(24)
  not clk_syn_120 (clk_syn_121, clk_syn_100);  // ramfifo.v(24)
  not clk_syn_122 (clk_syn_123, clk_syn_101);  // ramfifo.v(24)
  not clk_syn_124 (clk_syn_125, clk_syn_102);  // ramfifo.v(24)
  not clk_syn_126 (clk_syn_127, clk_syn_103);  // ramfifo.v(24)
  or clk_syn_13 (clk_syn_14, clk_syn_12, clk_syn_11);  // ramfifo.v(24)
  xor clk_syn_132 (clk_syn_133, clk_syn_95, clk_syn_94);  // ramfifo.v(24)
  and clk_syn_134 (clk_syn_135, clk_syn_95, clk_syn_109);  // ramfifo.v(24)
  xor clk_syn_136 (clk_syn_137, clk_syn_96, clk_syn_135);  // ramfifo.v(24)
  and clk_syn_138 (clk_syn_139, clk_syn_96, _al_n1_syn_28);  // ramfifo.v(24)
  xor clk_syn_140 (clk_syn_141, clk_syn_97, clk_syn_139);  // ramfifo.v(24)
  and clk_syn_142 (clk_syn_143, clk_syn_97, _al_n1_syn_30);  // ramfifo.v(24)
  xor clk_syn_144 (clk_syn_145, clk_syn_98, clk_syn_143);  // ramfifo.v(24)
  and clk_syn_146 (clk_syn_147, clk_syn_98, _al_n1_syn_32);  // ramfifo.v(24)
  xor clk_syn_148 (clk_syn_149, clk_syn_99, clk_syn_147);  // ramfifo.v(24)
  not clk_syn_15 (clk_syn_16, clk_syn_1);  // ramfifo.v(24)
  and clk_syn_150 (clk_syn_151, clk_syn_99, _al_n1_syn_34);  // ramfifo.v(24)
  xor clk_syn_152 (clk_syn_153, clk_syn_100, clk_syn_151);  // ramfifo.v(24)
  and clk_syn_154 (clk_syn_155, clk_syn_100, _al_n1_syn_36);  // ramfifo.v(24)
  xor clk_syn_156 (clk_syn_157, clk_syn_101, clk_syn_155);  // ramfifo.v(24)
  and clk_syn_158 (clk_syn_159, clk_syn_101, _al_n1_syn_38);  // ramfifo.v(24)
  xor clk_syn_160 (clk_syn_161, clk_syn_102, clk_syn_159);  // ramfifo.v(24)
  and clk_syn_162 (clk_syn_163, clk_syn_102, _al_n1_syn_40);  // ramfifo.v(24)
  xor clk_syn_164 (clk_syn_165, clk_syn_103, clk_syn_163);  // ramfifo.v(24)
  and clk_syn_166 (clk_syn_167, clk_syn_103, _al_n1_syn_42);  // ramfifo.v(24)
  xor clk_syn_168 (clk_syn_169, clk_syn_104, clk_syn_167);  // ramfifo.v(24)
  not clk_syn_17 (clk_syn_18, clk_syn_2);  // ramfifo.v(24)
  and clk_syn_170 (clk_syn_171, clk_syn_107, _al_n1_syn_44);  // ramfifo.v(24)
  xor clk_syn_172 (clk_syn_173, clk_syn_105, clk_syn_171);  // ramfifo.v(24)
  not clk_syn_19 (clk_syn_20, clk_syn_3);  // ramfifo.v(24)
  not clk_syn_21 (clk_syn_22, clk_syn_4);  // ramfifo.v(24)
  not clk_syn_23 (clk_syn_24, clk_syn_5);  // ramfifo.v(24)
  not clk_syn_25 (clk_syn_26, clk_syn_6);  // ramfifo.v(24)
  not clk_syn_27 (clk_syn_28, clk_syn_7);  // ramfifo.v(24)
  AL_DFF_X clk_syn_280 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_81),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_1));  // ramfifo.v(24)
  AL_DFF_X clk_syn_281 (
    .ar(1'b0),
    .as(rst),
    .clk(clk),
    .d(clk_syn_82),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_2));  // ramfifo.v(24)
  AL_DFF_X clk_syn_282 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_83),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_3));  // ramfifo.v(24)
  AL_DFF_X clk_syn_283 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_84),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_4));  // ramfifo.v(24)
  AL_DFF_X clk_syn_284 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_85),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_5));  // ramfifo.v(24)
  AL_DFF_X clk_syn_285 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_86),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_6));  // ramfifo.v(24)
  AL_DFF_X clk_syn_286 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_87),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_7));  // ramfifo.v(24)
  AL_DFF_X clk_syn_287 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_88),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_8));  // ramfifo.v(24)
  AL_DFF_X clk_syn_288 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_89),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_9));  // ramfifo.v(24)
  AL_DFF_X clk_syn_289 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_90),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_10));  // ramfifo.v(24)
  not clk_syn_29 (clk_syn_30, clk_syn_8);  // ramfifo.v(24)
  AL_DFF_X clk_syn_290 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_91),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_11));  // ramfifo.v(24)
  AL_DFF_X clk_syn_291 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_92),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_12));  // ramfifo.v(24)
  AL_DFF_X clk_syn_292 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_174),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_94));  // ramfifo.v(24)
  AL_DFF_X clk_syn_293 (
    .ar(1'b0),
    .as(rst),
    .clk(clk),
    .d(clk_syn_175),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_95));  // ramfifo.v(24)
  AL_DFF_X clk_syn_294 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_176),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_96));  // ramfifo.v(24)
  AL_DFF_X clk_syn_295 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_177),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_97));  // ramfifo.v(24)
  AL_DFF_X clk_syn_296 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_178),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_98));  // ramfifo.v(24)
  AL_DFF_X clk_syn_297 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_179),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_99));  // ramfifo.v(24)
  AL_DFF_X clk_syn_298 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_180),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_100));  // ramfifo.v(24)
  AL_DFF_X clk_syn_299 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_181),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_101));  // ramfifo.v(24)
  AL_DFF_X clk_syn_300 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_182),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_102));  // ramfifo.v(24)
  AL_DFF_X clk_syn_301 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_183),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_103));  // ramfifo.v(24)
  AL_DFF_X clk_syn_302 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_184),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_104));  // ramfifo.v(24)
  AL_DFF_X clk_syn_303 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_185),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_105));  // ramfifo.v(24)
  not clk_syn_31 (clk_syn_32, clk_syn_9);  // ramfifo.v(24)
  not clk_syn_33 (clk_syn_34, clk_syn_10);  // ramfifo.v(24)
  xor clk_syn_39 (clk_syn_40, clk_syn_2, clk_syn_1);  // ramfifo.v(24)
  and clk_syn_41 (clk_syn_42, clk_syn_2, clk_syn_16);  // ramfifo.v(24)
  xor clk_syn_43 (clk_syn_44, clk_syn_3, clk_syn_42);  // ramfifo.v(24)
  and clk_syn_45 (clk_syn_46, clk_syn_3, _al_n1_syn_4);  // ramfifo.v(24)
  xor clk_syn_47 (clk_syn_48, clk_syn_4, clk_syn_46);  // ramfifo.v(24)
  and clk_syn_49 (clk_syn_50, clk_syn_4, _al_n1_syn_6);  // ramfifo.v(24)
  xor clk_syn_51 (clk_syn_52, clk_syn_5, clk_syn_50);  // ramfifo.v(24)
  and clk_syn_53 (clk_syn_54, clk_syn_5, _al_n1_syn_8);  // ramfifo.v(24)
  xor clk_syn_55 (clk_syn_56, clk_syn_6, clk_syn_54);  // ramfifo.v(24)
  and clk_syn_57 (clk_syn_58, clk_syn_6, _al_n1_syn_10);  // ramfifo.v(24)
  xor clk_syn_59 (clk_syn_60, clk_syn_7, clk_syn_58);  // ramfifo.v(24)
  and clk_syn_61 (clk_syn_62, clk_syn_7, _al_n1_syn_12);  // ramfifo.v(24)
  xor clk_syn_63 (clk_syn_64, clk_syn_8, clk_syn_62);  // ramfifo.v(24)
  and clk_syn_65 (clk_syn_66, clk_syn_8, _al_n1_syn_14);  // ramfifo.v(24)
  xor clk_syn_67 (clk_syn_68, clk_syn_9, clk_syn_66);  // ramfifo.v(24)
  and clk_syn_69 (clk_syn_70, clk_syn_9, _al_n1_syn_16);  // ramfifo.v(24)
  xor clk_syn_71 (clk_syn_72, clk_syn_10, clk_syn_70);  // ramfifo.v(24)
  and clk_syn_73 (clk_syn_74, clk_syn_10, _al_n1_syn_18);  // ramfifo.v(24)
  xor clk_syn_75 (clk_syn_76, clk_syn_11, clk_syn_74);  // ramfifo.v(24)
  and clk_syn_77 (clk_syn_78, clk_syn_14, _al_n1_syn_20);  // ramfifo.v(24)
  xor clk_syn_79 (clk_syn_80, clk_syn_12, clk_syn_78);  // ramfifo.v(24)
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  not logic_ramfifo_syn_151 (logic_ramfifo_syn_152, logic_ramfifo_syn_54);  // ramfifo.v(39)
  not logic_ramfifo_syn_153 (logic_ramfifo_syn_154, logic_ramfifo_syn_55);  // ramfifo.v(39)
  not logic_ramfifo_syn_157 (logic_ramfifo_syn_158, full_flag);  // ramfifo.v(39)
  xor logic_ramfifo_syn_172 (logic_ramfifo_syn_173, logic_ramfifo_syn_33, logic_ramfifo_syn_32);  // ramfifo.v(39)
  xor logic_ramfifo_syn_174 (logic_ramfifo_syn_175, logic_ramfifo_syn_11, logic_ramfifo_syn_10);  // ramfifo.v(39)
  not logic_ramfifo_syn_204 (logic_ramfifo_syn_205, empty_flag);  // ramfifo.v(39)
  xor logic_ramfifo_syn_252 (logic_ramfifo_syn_253, logic_ramfifo_syn_55, logic_ramfifo_syn_54);  // ramfifo.v(39)
  xor logic_ramfifo_syn_254 (logic_ramfifo_syn_255, logic_ramfifo_syn_253, logic_ramfifo_syn_53);  // ramfifo.v(39)
  xor logic_ramfifo_syn_256 (logic_ramfifo_syn_257, logic_ramfifo_syn_255, logic_ramfifo_syn_52);  // ramfifo.v(39)
  xor logic_ramfifo_syn_258 (logic_ramfifo_syn_259, logic_ramfifo_syn_257, logic_ramfifo_syn_51);  // ramfifo.v(39)
  xor logic_ramfifo_syn_260 (logic_ramfifo_syn_261, logic_ramfifo_syn_259, logic_ramfifo_syn_50);  // ramfifo.v(39)
  xor logic_ramfifo_syn_262 (logic_ramfifo_syn_263, logic_ramfifo_syn_261, logic_ramfifo_syn_49);  // ramfifo.v(39)
  xor logic_ramfifo_syn_264 (logic_ramfifo_syn_265, logic_ramfifo_syn_263, logic_ramfifo_syn_48);  // ramfifo.v(39)
  xor logic_ramfifo_syn_266 (logic_ramfifo_syn_267, logic_ramfifo_syn_265, logic_ramfifo_syn_47);  // ramfifo.v(39)
  xor logic_ramfifo_syn_268 (logic_ramfifo_syn_269, logic_ramfifo_syn_267, logic_ramfifo_syn_46);  // ramfifo.v(39)
  xor logic_ramfifo_syn_270 (logic_ramfifo_syn_271, logic_ramfifo_syn_269, logic_ramfifo_syn_45);  // ramfifo.v(39)
  xor logic_ramfifo_syn_275 (logic_ramfifo_syn_276, logic_ramfifo_syn_175, logic_ramfifo_syn_9);  // ramfifo.v(39)
  xor logic_ramfifo_syn_277 (logic_ramfifo_syn_278, logic_ramfifo_syn_276, logic_ramfifo_syn_8);  // ramfifo.v(39)
  xor logic_ramfifo_syn_279 (logic_ramfifo_syn_280, logic_ramfifo_syn_278, logic_ramfifo_syn_7);  // ramfifo.v(39)
  xor logic_ramfifo_syn_281 (logic_ramfifo_syn_282, logic_ramfifo_syn_280, logic_ramfifo_syn_6);  // ramfifo.v(39)
  xor logic_ramfifo_syn_283 (logic_ramfifo_syn_284, logic_ramfifo_syn_282, logic_ramfifo_syn_5);  // ramfifo.v(39)
  xor logic_ramfifo_syn_285 (logic_ramfifo_syn_286, logic_ramfifo_syn_284, logic_ramfifo_syn_4);  // ramfifo.v(39)
  xor logic_ramfifo_syn_287 (logic_ramfifo_syn_288, logic_ramfifo_syn_286, logic_ramfifo_syn_3);  // ramfifo.v(39)
  xor logic_ramfifo_syn_289 (logic_ramfifo_syn_290, logic_ramfifo_syn_288, logic_ramfifo_syn_2);  // ramfifo.v(39)
  xor logic_ramfifo_syn_291 (logic_ramfifo_syn_292, logic_ramfifo_syn_290, logic_ramfifo_syn_1);  // ramfifo.v(39)
  xor logic_ramfifo_syn_295 (logic_ramfifo_syn_296, logic_ramfifo_syn_88, logic_ramfifo_syn_87);  // ramfifo.v(39)
  xor logic_ramfifo_syn_297 (logic_ramfifo_syn_298, logic_ramfifo_syn_296, logic_ramfifo_syn_86);  // ramfifo.v(39)
  xor logic_ramfifo_syn_299 (logic_ramfifo_syn_300, logic_ramfifo_syn_298, logic_ramfifo_syn_85);  // ramfifo.v(39)
  xor logic_ramfifo_syn_301 (logic_ramfifo_syn_302, logic_ramfifo_syn_300, logic_ramfifo_syn_84);  // ramfifo.v(39)
  xor logic_ramfifo_syn_303 (logic_ramfifo_syn_304, logic_ramfifo_syn_302, logic_ramfifo_syn_83);  // ramfifo.v(39)
  xor logic_ramfifo_syn_305 (logic_ramfifo_syn_306, logic_ramfifo_syn_304, logic_ramfifo_syn_82);  // ramfifo.v(39)
  xor logic_ramfifo_syn_307 (logic_ramfifo_syn_308, logic_ramfifo_syn_306, logic_ramfifo_syn_81);  // ramfifo.v(39)
  xor logic_ramfifo_syn_309 (logic_ramfifo_syn_310, logic_ramfifo_syn_308, logic_ramfifo_syn_80);  // ramfifo.v(39)
  xor logic_ramfifo_syn_311 (logic_ramfifo_syn_312, logic_ramfifo_syn_310, logic_ramfifo_syn_79);  // ramfifo.v(39)
  xor logic_ramfifo_syn_313 (logic_ramfifo_syn_314, logic_ramfifo_syn_312, logic_ramfifo_syn_78);  // ramfifo.v(39)
  xor logic_ramfifo_syn_318 (logic_ramfifo_syn_319, logic_ramfifo_syn_173, logic_ramfifo_syn_31);  // ramfifo.v(39)
  xor logic_ramfifo_syn_320 (logic_ramfifo_syn_321, logic_ramfifo_syn_319, logic_ramfifo_syn_30);  // ramfifo.v(39)
  xor logic_ramfifo_syn_322 (logic_ramfifo_syn_323, logic_ramfifo_syn_321, logic_ramfifo_syn_29);  // ramfifo.v(39)
  xor logic_ramfifo_syn_324 (logic_ramfifo_syn_325, logic_ramfifo_syn_323, logic_ramfifo_syn_28);  // ramfifo.v(39)
  xor logic_ramfifo_syn_326 (logic_ramfifo_syn_327, logic_ramfifo_syn_325, logic_ramfifo_syn_27);  // ramfifo.v(39)
  xor logic_ramfifo_syn_328 (logic_ramfifo_syn_329, logic_ramfifo_syn_327, logic_ramfifo_syn_26);  // ramfifo.v(39)
  xor logic_ramfifo_syn_330 (logic_ramfifo_syn_331, logic_ramfifo_syn_329, logic_ramfifo_syn_25);  // ramfifo.v(39)
  xor logic_ramfifo_syn_332 (logic_ramfifo_syn_333, logic_ramfifo_syn_331, logic_ramfifo_syn_24);  // ramfifo.v(39)
  xor logic_ramfifo_syn_334 (logic_ramfifo_syn_335, logic_ramfifo_syn_333, logic_ramfifo_syn_23);  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_364 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_159),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_1));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_365 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_160),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_2));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_366 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_161),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_3));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_367 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_162),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_4));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_368 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_163),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_5));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_369 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_164),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_6));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_370 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_165),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_7));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_371 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_166),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_8));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_372 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_167),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_9));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_373 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_168),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_10));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_374 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_169),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_11));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_375 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_1),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_12));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_376 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_2),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_13));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_377 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_3),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_14));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_378 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_4),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_15));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_379 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_5),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_16));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_380 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_6),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_17));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_381 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_7),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_18));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_382 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_8),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_19));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_383 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_9),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_20));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_384 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_10),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_21));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_385 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_11),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_22));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_389 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_225),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_23));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_390 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_226),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_24));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_391 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_227),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_25));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_392 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_228),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_26));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_393 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_229),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_27));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_394 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_230),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_28));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_395 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_231),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_29));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_396 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_232),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_30));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_397 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_233),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_31));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_398 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_234),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_32));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_399 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_235),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_33));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_411 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_23),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_45));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_412 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_24),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_46));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_413 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_25),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_47));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_414 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_26),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_48));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_415 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_27),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_49));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_416 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_28),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_50));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_417 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_29),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_51));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_418 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_30),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_52));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_419 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_31),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_53));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_420 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_32),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_54));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_421 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_33),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_55));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_422 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_271),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_56));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_423 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_269),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_57));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_424 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_267),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_58));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_425 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_265),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_59));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_426 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_263),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_60));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_427 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_261),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_61));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_428 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_259),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_62));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_429 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_257),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_63));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_430 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_255),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_64));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_431 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_253),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_65));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_432 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_55),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_66));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_433 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_292),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_67));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_434 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_290),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_68));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_435 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_288),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_69));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_436 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_286),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_70));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_437 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_284),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_71));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_438 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_282),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_72));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_439 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_280),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_73));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_440 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_278),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_74));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_441 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_276),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_75));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_442 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_175),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_76));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_444 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_12),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_78));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_445 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_13),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_79));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_446 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_14),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_80));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_447 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_15),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_81));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_448 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_16),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_82));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_449 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_17),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_83));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_450 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_18),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_84));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_451 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_19),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_85));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_452 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_20),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_86));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_453 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_21),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_87));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_454 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_22),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_88));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_455 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_314),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_89));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_456 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_312),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_90));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_457 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_310),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_91));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_458 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_308),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_92));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_459 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_306),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_93));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_460 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_304),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_94));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_461 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_302),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_95));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_462 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_300),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_96));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_463 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_298),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_97));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_464 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_296),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_98));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_465 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_88),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_99));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_466 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_335),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_100));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_467 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_333),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_101));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_468 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_331),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_102));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_469 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_329),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_103));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_470 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_327),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_104));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_471 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_325),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_105));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_472 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_323),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_106));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_473 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_321),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_107));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_474 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_319),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_108));  // ramfifo.v(39)
  AL_DFF_X logic_ramfifo_syn_475 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_173),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_109));  // ramfifo.v(39)
  // address_offset=0;data_offset=0;depth=1024;width=16;num_section=1;width_per_section=16;section_size=16;working_depth=2048;working_width=16;working_numbyte=1;mode_ecc=0;address_step=1;bytes_in_per_section=1;
  // logic_ramfifo_syn_337_1024x16
  EG_PHY_BRAM32K #(
    .CSAMUX("1"),
    .DATA_WIDTH_A("16"),
    .DATA_WIDTH_B("16"),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP16K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .SRMODE("SYNC"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    logic_ramfifo_syn_477 (
    .addra({1'b0,logic_ramfifo_syn_175,logic_ramfifo_syn_9,logic_ramfifo_syn_8,logic_ramfifo_syn_7,logic_ramfifo_syn_6,logic_ramfifo_syn_5,logic_ramfifo_syn_4,logic_ramfifo_syn_3,logic_ramfifo_syn_2,logic_ramfifo_syn_1}),
    .addrb({1'b0,logic_ramfifo_syn_173,logic_ramfifo_syn_31,logic_ramfifo_syn_30,logic_ramfifo_syn_29,logic_ramfifo_syn_28,logic_ramfifo_syn_27,logic_ramfifo_syn_26,logic_ramfifo_syn_25,logic_ramfifo_syn_24,logic_ramfifo_syn_23}),
    .bytewea(1'b0),
    .byteweb(1'b0),
    .clka(clk),
    .clkb(clk),
    .csb(re_syn_2),
    .dia(di),
    .rsta(rst),
    .rstb(rst),
    .wea(we_syn_2),
    .dob(do));  // ramfifo.v(39)
  not logic_ramfifo_syn_494 (full_flag, logic_ramfifo_syn_559);  // ramfifo.v(39)
  xor logic_ramfifo_syn_495 (logic_ramfifo_syn_539, logic_ramfifo_syn_1, logic_ramfifo_syn_45);  // ramfifo.v(39)
  xor logic_ramfifo_syn_496 (logic_ramfifo_syn_540, logic_ramfifo_syn_2, logic_ramfifo_syn_46);  // ramfifo.v(39)
  xor logic_ramfifo_syn_497 (logic_ramfifo_syn_541, logic_ramfifo_syn_3, logic_ramfifo_syn_47);  // ramfifo.v(39)
  xor logic_ramfifo_syn_498 (logic_ramfifo_syn_542, logic_ramfifo_syn_4, logic_ramfifo_syn_48);  // ramfifo.v(39)
  xor logic_ramfifo_syn_499 (logic_ramfifo_syn_543, logic_ramfifo_syn_5, logic_ramfifo_syn_49);  // ramfifo.v(39)
  xor logic_ramfifo_syn_500 (logic_ramfifo_syn_544, logic_ramfifo_syn_6, logic_ramfifo_syn_50);  // ramfifo.v(39)
  xor logic_ramfifo_syn_501 (logic_ramfifo_syn_545, logic_ramfifo_syn_7, logic_ramfifo_syn_51);  // ramfifo.v(39)
  xor logic_ramfifo_syn_502 (logic_ramfifo_syn_546, logic_ramfifo_syn_8, logic_ramfifo_syn_52);  // ramfifo.v(39)
  xor logic_ramfifo_syn_503 (logic_ramfifo_syn_547, logic_ramfifo_syn_9, logic_ramfifo_syn_53);  // ramfifo.v(39)
  xor logic_ramfifo_syn_504 (logic_ramfifo_syn_548, logic_ramfifo_syn_10, logic_ramfifo_syn_152);  // ramfifo.v(39)
  xor logic_ramfifo_syn_505 (logic_ramfifo_syn_549, logic_ramfifo_syn_11, logic_ramfifo_syn_154);  // ramfifo.v(39)
  or logic_ramfifo_syn_506 (logic_ramfifo_syn_550, logic_ramfifo_syn_539, logic_ramfifo_syn_540);  // ramfifo.v(39)
  or logic_ramfifo_syn_507 (logic_ramfifo_syn_551, logic_ramfifo_syn_542, logic_ramfifo_syn_543);  // ramfifo.v(39)
  or logic_ramfifo_syn_508 (logic_ramfifo_syn_552, logic_ramfifo_syn_541, logic_ramfifo_syn_551);  // ramfifo.v(39)
  or logic_ramfifo_syn_509 (logic_ramfifo_syn_553, logic_ramfifo_syn_550, logic_ramfifo_syn_552);  // ramfifo.v(39)
  or logic_ramfifo_syn_510 (logic_ramfifo_syn_554, logic_ramfifo_syn_545, logic_ramfifo_syn_546);  // ramfifo.v(39)
  or logic_ramfifo_syn_511 (logic_ramfifo_syn_555, logic_ramfifo_syn_544, logic_ramfifo_syn_554);  // ramfifo.v(39)
  or logic_ramfifo_syn_512 (logic_ramfifo_syn_556, logic_ramfifo_syn_548, logic_ramfifo_syn_549);  // ramfifo.v(39)
  or logic_ramfifo_syn_513 (logic_ramfifo_syn_557, logic_ramfifo_syn_547, logic_ramfifo_syn_556);  // ramfifo.v(39)
  or logic_ramfifo_syn_514 (logic_ramfifo_syn_558, logic_ramfifo_syn_555, logic_ramfifo_syn_557);  // ramfifo.v(39)
  or logic_ramfifo_syn_515 (logic_ramfifo_syn_559, logic_ramfifo_syn_553, logic_ramfifo_syn_558);  // ramfifo.v(39)
  not logic_ramfifo_syn_560 (empty_flag, logic_ramfifo_syn_625);  // ramfifo.v(39)
  xor logic_ramfifo_syn_561 (logic_ramfifo_syn_605, logic_ramfifo_syn_78, logic_ramfifo_syn_23);  // ramfifo.v(39)
  xor logic_ramfifo_syn_562 (logic_ramfifo_syn_606, logic_ramfifo_syn_79, logic_ramfifo_syn_24);  // ramfifo.v(39)
  xor logic_ramfifo_syn_563 (logic_ramfifo_syn_607, logic_ramfifo_syn_80, logic_ramfifo_syn_25);  // ramfifo.v(39)
  xor logic_ramfifo_syn_564 (logic_ramfifo_syn_608, logic_ramfifo_syn_81, logic_ramfifo_syn_26);  // ramfifo.v(39)
  xor logic_ramfifo_syn_565 (logic_ramfifo_syn_609, logic_ramfifo_syn_82, logic_ramfifo_syn_27);  // ramfifo.v(39)
  xor logic_ramfifo_syn_566 (logic_ramfifo_syn_610, logic_ramfifo_syn_83, logic_ramfifo_syn_28);  // ramfifo.v(39)
  xor logic_ramfifo_syn_567 (logic_ramfifo_syn_611, logic_ramfifo_syn_84, logic_ramfifo_syn_29);  // ramfifo.v(39)
  xor logic_ramfifo_syn_568 (logic_ramfifo_syn_612, logic_ramfifo_syn_85, logic_ramfifo_syn_30);  // ramfifo.v(39)
  xor logic_ramfifo_syn_569 (logic_ramfifo_syn_613, logic_ramfifo_syn_86, logic_ramfifo_syn_31);  // ramfifo.v(39)
  xor logic_ramfifo_syn_570 (logic_ramfifo_syn_614, logic_ramfifo_syn_87, logic_ramfifo_syn_32);  // ramfifo.v(39)
  xor logic_ramfifo_syn_571 (logic_ramfifo_syn_615, logic_ramfifo_syn_88, logic_ramfifo_syn_33);  // ramfifo.v(39)
  or logic_ramfifo_syn_572 (logic_ramfifo_syn_616, logic_ramfifo_syn_605, logic_ramfifo_syn_606);  // ramfifo.v(39)
  or logic_ramfifo_syn_573 (logic_ramfifo_syn_617, logic_ramfifo_syn_608, logic_ramfifo_syn_609);  // ramfifo.v(39)
  or logic_ramfifo_syn_574 (logic_ramfifo_syn_618, logic_ramfifo_syn_607, logic_ramfifo_syn_617);  // ramfifo.v(39)
  or logic_ramfifo_syn_575 (logic_ramfifo_syn_619, logic_ramfifo_syn_616, logic_ramfifo_syn_618);  // ramfifo.v(39)
  or logic_ramfifo_syn_576 (logic_ramfifo_syn_620, logic_ramfifo_syn_611, logic_ramfifo_syn_612);  // ramfifo.v(39)
  or logic_ramfifo_syn_577 (logic_ramfifo_syn_621, logic_ramfifo_syn_610, logic_ramfifo_syn_620);  // ramfifo.v(39)
  or logic_ramfifo_syn_578 (logic_ramfifo_syn_622, logic_ramfifo_syn_614, logic_ramfifo_syn_615);  // ramfifo.v(39)
  or logic_ramfifo_syn_579 (logic_ramfifo_syn_623, logic_ramfifo_syn_613, logic_ramfifo_syn_622);  // ramfifo.v(39)
  or logic_ramfifo_syn_580 (logic_ramfifo_syn_624, logic_ramfifo_syn_621, logic_ramfifo_syn_623);  // ramfifo.v(39)
  or logic_ramfifo_syn_581 (logic_ramfifo_syn_625, logic_ramfifo_syn_619, logic_ramfifo_syn_624);  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    logic_ramfifo_syn_626 (
    .a(1'b0),
    .o({logic_ramfifo_syn_672,open_n87}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_627 (
    .a(logic_ramfifo_syn_67),
    .b(logic_ramfifo_syn_56),
    .c(logic_ramfifo_syn_672),
    .o({logic_ramfifo_syn_673,wrusedw[0]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_628 (
    .a(logic_ramfifo_syn_68),
    .b(logic_ramfifo_syn_57),
    .c(logic_ramfifo_syn_673),
    .o({logic_ramfifo_syn_674,wrusedw[1]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_629 (
    .a(logic_ramfifo_syn_69),
    .b(logic_ramfifo_syn_58),
    .c(logic_ramfifo_syn_674),
    .o({logic_ramfifo_syn_675,wrusedw[2]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_630 (
    .a(logic_ramfifo_syn_70),
    .b(logic_ramfifo_syn_59),
    .c(logic_ramfifo_syn_675),
    .o({logic_ramfifo_syn_676,wrusedw[3]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_631 (
    .a(logic_ramfifo_syn_71),
    .b(logic_ramfifo_syn_60),
    .c(logic_ramfifo_syn_676),
    .o({logic_ramfifo_syn_677,wrusedw[4]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_632 (
    .a(logic_ramfifo_syn_72),
    .b(logic_ramfifo_syn_61),
    .c(logic_ramfifo_syn_677),
    .o({logic_ramfifo_syn_678,wrusedw[5]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_633 (
    .a(logic_ramfifo_syn_73),
    .b(logic_ramfifo_syn_62),
    .c(logic_ramfifo_syn_678),
    .o({logic_ramfifo_syn_679,wrusedw[6]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_634 (
    .a(logic_ramfifo_syn_74),
    .b(logic_ramfifo_syn_63),
    .c(logic_ramfifo_syn_679),
    .o({logic_ramfifo_syn_680,wrusedw[7]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_635 (
    .a(logic_ramfifo_syn_75),
    .b(logic_ramfifo_syn_64),
    .c(logic_ramfifo_syn_680),
    .o({logic_ramfifo_syn_681,wrusedw[8]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_636 (
    .a(logic_ramfifo_syn_76),
    .b(logic_ramfifo_syn_65),
    .c(logic_ramfifo_syn_681),
    .o({logic_ramfifo_syn_682,wrusedw[9]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_637 (
    .a(logic_ramfifo_syn_22),
    .b(logic_ramfifo_syn_66),
    .c(logic_ramfifo_syn_682),
    .o({open_n88,wrusedw[10]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    logic_ramfifo_syn_684 (
    .a(1'b0),
    .o({logic_ramfifo_syn_730,open_n91}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_685 (
    .a(logic_ramfifo_syn_89),
    .b(logic_ramfifo_syn_100),
    .c(logic_ramfifo_syn_730),
    .o({logic_ramfifo_syn_731,rdusedw[0]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_686 (
    .a(logic_ramfifo_syn_90),
    .b(logic_ramfifo_syn_101),
    .c(logic_ramfifo_syn_731),
    .o({logic_ramfifo_syn_732,rdusedw[1]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_687 (
    .a(logic_ramfifo_syn_91),
    .b(logic_ramfifo_syn_102),
    .c(logic_ramfifo_syn_732),
    .o({logic_ramfifo_syn_733,rdusedw[2]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_688 (
    .a(logic_ramfifo_syn_92),
    .b(logic_ramfifo_syn_103),
    .c(logic_ramfifo_syn_733),
    .o({logic_ramfifo_syn_734,rdusedw[3]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_689 (
    .a(logic_ramfifo_syn_93),
    .b(logic_ramfifo_syn_104),
    .c(logic_ramfifo_syn_734),
    .o({logic_ramfifo_syn_735,rdusedw[4]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_690 (
    .a(logic_ramfifo_syn_94),
    .b(logic_ramfifo_syn_105),
    .c(logic_ramfifo_syn_735),
    .o({logic_ramfifo_syn_736,rdusedw[5]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_691 (
    .a(logic_ramfifo_syn_95),
    .b(logic_ramfifo_syn_106),
    .c(logic_ramfifo_syn_736),
    .o({logic_ramfifo_syn_737,rdusedw[6]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_692 (
    .a(logic_ramfifo_syn_96),
    .b(logic_ramfifo_syn_107),
    .c(logic_ramfifo_syn_737),
    .o({logic_ramfifo_syn_738,rdusedw[7]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_693 (
    .a(logic_ramfifo_syn_97),
    .b(logic_ramfifo_syn_108),
    .c(logic_ramfifo_syn_738),
    .o({logic_ramfifo_syn_739,rdusedw[8]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_694 (
    .a(logic_ramfifo_syn_98),
    .b(logic_ramfifo_syn_109),
    .c(logic_ramfifo_syn_739),
    .o({logic_ramfifo_syn_740,rdusedw[9]}));  // ramfifo.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_695 (
    .a(logic_ramfifo_syn_99),
    .b(logic_ramfifo_syn_55),
    .c(logic_ramfifo_syn_740),
    .o({open_n92,rdusedw[10]}));  // ramfifo.v(39)
  and re_syn_1 (re_syn_2, re, logic_ramfifo_syn_205);  // ramfifo.v(25)
  AL_MUX re_syn_261 (
    .i0(clk_syn_94),
    .i1(clk_syn_109),
    .sel(re_syn_2),
    .o(clk_syn_174));  // ramfifo.v(25)
  AL_MUX re_syn_266 (
    .i0(clk_syn_95),
    .i1(clk_syn_133),
    .sel(re_syn_2),
    .o(clk_syn_175));  // ramfifo.v(25)
  AL_MUX re_syn_271 (
    .i0(clk_syn_96),
    .i1(clk_syn_137),
    .sel(re_syn_2),
    .o(clk_syn_176));  // ramfifo.v(25)
  AL_MUX re_syn_276 (
    .i0(clk_syn_97),
    .i1(clk_syn_141),
    .sel(re_syn_2),
    .o(clk_syn_177));  // ramfifo.v(25)
  AL_MUX re_syn_281 (
    .i0(clk_syn_98),
    .i1(clk_syn_145),
    .sel(re_syn_2),
    .o(clk_syn_178));  // ramfifo.v(25)
  AL_MUX re_syn_286 (
    .i0(clk_syn_99),
    .i1(clk_syn_149),
    .sel(re_syn_2),
    .o(clk_syn_179));  // ramfifo.v(25)
  AL_MUX re_syn_291 (
    .i0(clk_syn_100),
    .i1(clk_syn_153),
    .sel(re_syn_2),
    .o(clk_syn_180));  // ramfifo.v(25)
  AL_MUX re_syn_296 (
    .i0(clk_syn_101),
    .i1(clk_syn_157),
    .sel(re_syn_2),
    .o(clk_syn_181));  // ramfifo.v(25)
  AL_MUX re_syn_301 (
    .i0(clk_syn_102),
    .i1(clk_syn_161),
    .sel(re_syn_2),
    .o(clk_syn_182));  // ramfifo.v(25)
  AL_MUX re_syn_306 (
    .i0(clk_syn_103),
    .i1(clk_syn_165),
    .sel(re_syn_2),
    .o(clk_syn_183));  // ramfifo.v(25)
  AL_MUX re_syn_311 (
    .i0(clk_syn_104),
    .i1(clk_syn_169),
    .sel(re_syn_2),
    .o(clk_syn_184));  // ramfifo.v(25)
  AL_MUX re_syn_316 (
    .i0(clk_syn_105),
    .i1(clk_syn_173),
    .sel(re_syn_2),
    .o(clk_syn_185));  // ramfifo.v(25)
  AL_MUX re_syn_321 (
    .i0(logic_ramfifo_syn_23),
    .i1(clk_syn_95),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_225));  // ramfifo.v(25)
  AL_MUX re_syn_326 (
    .i0(logic_ramfifo_syn_24),
    .i1(clk_syn_96),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_226));  // ramfifo.v(25)
  AL_MUX re_syn_331 (
    .i0(logic_ramfifo_syn_25),
    .i1(clk_syn_97),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_227));  // ramfifo.v(25)
  AL_MUX re_syn_336 (
    .i0(logic_ramfifo_syn_26),
    .i1(clk_syn_98),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_228));  // ramfifo.v(25)
  AL_MUX re_syn_341 (
    .i0(logic_ramfifo_syn_27),
    .i1(clk_syn_99),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_229));  // ramfifo.v(25)
  AL_MUX re_syn_346 (
    .i0(logic_ramfifo_syn_28),
    .i1(clk_syn_100),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_230));  // ramfifo.v(25)
  AL_MUX re_syn_351 (
    .i0(logic_ramfifo_syn_29),
    .i1(clk_syn_101),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_231));  // ramfifo.v(25)
  AL_MUX re_syn_356 (
    .i0(logic_ramfifo_syn_30),
    .i1(clk_syn_102),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_232));  // ramfifo.v(25)
  AL_MUX re_syn_361 (
    .i0(logic_ramfifo_syn_31),
    .i1(clk_syn_103),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_233));  // ramfifo.v(25)
  AL_MUX re_syn_366 (
    .i0(logic_ramfifo_syn_32),
    .i1(clk_syn_104),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_234));  // ramfifo.v(25)
  AL_MUX re_syn_371 (
    .i0(logic_ramfifo_syn_33),
    .i1(clk_syn_105),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_235));  // ramfifo.v(25)
  and we_syn_1 (we_syn_2, we, logic_ramfifo_syn_158);  // ramfifo.v(24)
  AL_MUX we_syn_103 (
    .i0(logic_ramfifo_syn_4),
    .i1(clk_syn_5),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_162));  // ramfifo.v(24)
  AL_MUX we_syn_108 (
    .i0(logic_ramfifo_syn_5),
    .i1(clk_syn_6),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_163));  // ramfifo.v(24)
  AL_MUX we_syn_113 (
    .i0(logic_ramfifo_syn_6),
    .i1(clk_syn_7),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_164));  // ramfifo.v(24)
  AL_MUX we_syn_118 (
    .i0(logic_ramfifo_syn_7),
    .i1(clk_syn_8),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_165));  // ramfifo.v(24)
  AL_MUX we_syn_123 (
    .i0(logic_ramfifo_syn_8),
    .i1(clk_syn_9),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_166));  // ramfifo.v(24)
  AL_MUX we_syn_128 (
    .i0(logic_ramfifo_syn_9),
    .i1(clk_syn_10),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_167));  // ramfifo.v(24)
  AL_MUX we_syn_133 (
    .i0(logic_ramfifo_syn_10),
    .i1(clk_syn_11),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_168));  // ramfifo.v(24)
  AL_MUX we_syn_138 (
    .i0(logic_ramfifo_syn_11),
    .i1(clk_syn_12),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_169));  // ramfifo.v(24)
  AL_MUX we_syn_28 (
    .i0(clk_syn_1),
    .i1(clk_syn_16),
    .sel(we_syn_2),
    .o(clk_syn_81));  // ramfifo.v(24)
  AL_MUX we_syn_33 (
    .i0(clk_syn_2),
    .i1(clk_syn_40),
    .sel(we_syn_2),
    .o(clk_syn_82));  // ramfifo.v(24)
  AL_MUX we_syn_38 (
    .i0(clk_syn_3),
    .i1(clk_syn_44),
    .sel(we_syn_2),
    .o(clk_syn_83));  // ramfifo.v(24)
  AL_MUX we_syn_43 (
    .i0(clk_syn_4),
    .i1(clk_syn_48),
    .sel(we_syn_2),
    .o(clk_syn_84));  // ramfifo.v(24)
  AL_MUX we_syn_48 (
    .i0(clk_syn_5),
    .i1(clk_syn_52),
    .sel(we_syn_2),
    .o(clk_syn_85));  // ramfifo.v(24)
  AL_MUX we_syn_53 (
    .i0(clk_syn_6),
    .i1(clk_syn_56),
    .sel(we_syn_2),
    .o(clk_syn_86));  // ramfifo.v(24)
  AL_MUX we_syn_58 (
    .i0(clk_syn_7),
    .i1(clk_syn_60),
    .sel(we_syn_2),
    .o(clk_syn_87));  // ramfifo.v(24)
  AL_MUX we_syn_63 (
    .i0(clk_syn_8),
    .i1(clk_syn_64),
    .sel(we_syn_2),
    .o(clk_syn_88));  // ramfifo.v(24)
  AL_MUX we_syn_68 (
    .i0(clk_syn_9),
    .i1(clk_syn_68),
    .sel(we_syn_2),
    .o(clk_syn_89));  // ramfifo.v(24)
  AL_MUX we_syn_73 (
    .i0(clk_syn_10),
    .i1(clk_syn_72),
    .sel(we_syn_2),
    .o(clk_syn_90));  // ramfifo.v(24)
  AL_MUX we_syn_78 (
    .i0(clk_syn_11),
    .i1(clk_syn_76),
    .sel(we_syn_2),
    .o(clk_syn_91));  // ramfifo.v(24)
  AL_MUX we_syn_83 (
    .i0(clk_syn_12),
    .i1(clk_syn_80),
    .sel(we_syn_2),
    .o(clk_syn_92));  // ramfifo.v(24)
  AL_MUX we_syn_88 (
    .i0(logic_ramfifo_syn_1),
    .i1(clk_syn_2),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_159));  // ramfifo.v(24)
  AL_MUX we_syn_93 (
    .i0(logic_ramfifo_syn_2),
    .i1(clk_syn_3),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_160));  // ramfifo.v(24)
  AL_MUX we_syn_98 (
    .i0(logic_ramfifo_syn_3),
    .i1(clk_syn_4),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_161));  // ramfifo.v(24)

endmodule 

