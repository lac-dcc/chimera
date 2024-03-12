// Verilog netlist created by TD v2.0.490
// Fri Dec 04 13:52:41 2015

module sdram_control  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(1)
  (
  CLKIN,
  rst_n,
  test_error,
  test_io
  );

  input CLKIN;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(2)
  input rst_n;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(3)
  output test_error;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(13)
  output test_io;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(12)

  parameter mode_register = 11'b00000110111;
  parameter reg1_register = 13'b0000100101111;
  parameter reg2_register = 12'b110000110101;
  wire [1:0] SD_BA;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(38)
  wire [23:0] SD_DQ;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(43)
  wire [10:0] SD_SA;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(37)
  wire [8:0] burst_cnt;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(19)
  wire [8:0] burst_cnt1;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(20)
  wire [7:0] datacnt;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(31)
  wire [7:0] fifo_q;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(29)
  wire [2:0] n100;
  wire [20:0] n101;
  wire [1:0] n103;
  wire [1:0] n104;
  wire [2:0] n105;
  wire [8:0] n108;
  wire [8:0] n109;
  wire [1:0] n110;
  wire [2:0] n112;
  wire [7:0] n114;
  wire [12:0] n121;
  wire [20:0] n122;
  wire [1:0] n126;
  wire [20:0] n127;
  wire [2:0] n128;
  wire [1:0] n129;
  wire [7:0] n130;
  wire [8:0] n131;
  wire [2:0] n132;
  wire [20:0] n133;
  wire [1:0] n135;
  wire [1:0] n136;
  wire [8:0] n142;
  wire [12:0] n145;
  wire [20:0] n146;
  wire [8:0] n148;
  wire [1:0] n149;
  wire [2:0] n156;
  wire [7:0] n159;
  wire [7:0] n160;
  wire [8:0] n166;
  wire [1:0] n167;
  wire [2:0] n168;
  wire [7:0] n169;
  wire [20:0] n170;
  wire [2:0] n171;
  wire [20:0] n173;
  wire [1:0] n179;
  wire [2:0] n180;
  wire [20:0] n181;
  wire [20:0] n182;
  wire [2:0] n183;
  wire [20:0] n184;
  wire [1:0] n185;
  wire [7:0] n186;
  wire [8:0] n187;
  wire [8:0] n188;
  wire [1:0] n189;
  wire [7:0] n190;
  wire [1:0] n75;
  wire [2:0] n76;
  wire [20:0] n77;
  wire [1:0] n81;
  wire [20:0] n83;
  wire [1:0] n85;
  wire [20:0] n88;
  wire [2:0] n90;
  wire [1:0] n91;
  wire [2:0] n92;
  wire [1:0] n96;
  wire [2:0] n97;
  wire [20:0] n98;
  wire [20:0] n99;
  wire [20:0] rd_addr;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(22)
  wire [1:0] rd_state;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(23)
  wire [1:0] reset_step;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(18)
  wire [20:0] sd_addr;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(28)
  wire [2:0] sd_cmd;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(26)
  wire [2:0] sd_state;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(17)
  wire [23:0] u_sdram_DQOUT;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(62)
  wire [1:0] u_sdram_IBA;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(54)
  wire [10:0] u_sdram_ISA;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(53)
  wire [7:0] u_sdram_command1_command_delay;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(67)
  wire [3:0] u_sdram_command1_n36;
  wire [3:0] u_sdram_command1_n37;
  wire [3:0] u_sdram_command1_n39;
  wire [3:0] u_sdram_command1_n41;
  wire [10:0] u_sdram_command1_n46;
  wire [1:0] u_sdram_command1_n48;
  wire [1:0] u_sdram_command1_n49;
  wire [3:0] u_sdram_command1_rp_shift;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(73)
  wire [3:0] u_sdram_command1_rw_shift;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(68)
  wire [23:0] u_sdram_data_path1_DIN1;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(30)
  wire [20:0] u_sdram_saddr;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(64)
  wire [1:0] u_sdram_sc_rc;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(66)
  wire [20:0] wr_addr;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(21)
  wire [1:0] wr_state;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(24)
  wire CLKIN_pad;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(2)
  wire SD_CAS_N;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(41)
  wire SD_CLK;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(44)
  wire SD_RAS_N;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(40)
  wire SD_WE_N;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(42)
  wire _al_n0_d;
  wire _al_n0_d_al_n158;
  wire _al_n0_d_al_n160;
  wire _al_n0_en;
  wire clk_150m;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(33)
  wire n0;
  wire n1;
  wire n10;
  wire n1000;
  wire n1001;
  wire n1002;
  wire n1003;
  wire n1004;
  wire n1005;
  wire n1006;
  wire n1007;
  wire n1008;
  wire n1009;
  wire n1010;
  wire n1011;
  wire n1012;
  wire n1013;
  wire n1014;
  wire n1015;
  wire n1016;
  wire n1017;
  wire n1018;
  wire n1019;
  wire n102;
  wire n1020;
  wire n1021;
  wire n1022;
  wire n1023;
  wire n1024;
  wire n1025;
  wire n1026;
  wire n1027;
  wire n1028;
  wire n1029;
  wire n1030;
  wire n1031;
  wire n1032;
  wire n1033;
  wire n1034;
  wire n1035;
  wire n1036;
  wire n1037;
  wire n1038;
  wire n1039;
  wire n1040;
  wire n1041;
  wire n1042;
  wire n1043;
  wire n1044;
  wire n1045;
  wire n1046;
  wire n1047;
  wire n1048;
  wire n1049;
  wire n1050;
  wire n1051;
  wire n1052;
  wire n1053;
  wire n1054;
  wire n1055;
  wire n1056;
  wire n1057;
  wire n1058;
  wire n1059;
  wire n106;
  wire n1060;
  wire n1061;
  wire n1062;
  wire n1063;
  wire n1064;
  wire n1065;
  wire n1066;
  wire n1067;
  wire n1068;
  wire n1069;
  wire n107;
  wire n1070;
  wire n1071;
  wire n1072;
  wire n1073;
  wire n1074;
  wire n1075;
  wire n1076;
  wire n1078;
  wire n1079;
  wire n1080;
  wire n1081;
  wire n1082;
  wire n1083;
  wire n1084;
  wire n1085;
  wire n1086;
  wire n1087;
  wire n1088;
  wire n1089;
  wire n1090;
  wire n1091;
  wire n1092;
  wire n1093;
  wire n11;
  wire n1100;
  wire n1102;
  wire n1107;
  wire n111;
  wire n113;
  wire n115;
  wire n116;
  wire n117;
  wire n118;
  wire n119;
  wire n12;
  wire n120;
  wire n13;
  wire n134;
  wire n137;
  wire n138;
  wire n139;
  wire n14;
  wire n140;
  wire n140_neg;
  wire n141;
  wire n143;
  wire n144;
  wire n15;
  wire n152;
  wire n153;
  wire n154;
  wire n155;
  wire n157;
  wire n158;
  wire n16;
  wire n161;
  wire n162;
  wire n163;
  wire n17;
  wire n174;
  wire n175;
  wire n176;
  wire n177;
  wire n178;
  wire n18;
  wire n19;
  wire n191;
  wire n193;
  wire n194;
  wire n195;
  wire n196;
  wire n197;
  wire n198;
  wire n199;
  wire n2;
  wire n20;
  wire n200;
  wire n201;
  wire n202;
  wire n203;
  wire n204;
  wire n205;
  wire n206;
  wire n207;
  wire n208;
  wire n209;
  wire n21;
  wire n210;
  wire n211;
  wire n212;
  wire n213;
  wire n214;
  wire n215;
  wire n216;
  wire n217;
  wire n218;
  wire n219;
  wire n22;
  wire n220;
  wire n221;
  wire n222;
  wire n223;
  wire n224;
  wire n225;
  wire n226;
  wire n227;
  wire n228;
  wire n229;
  wire n23;
  wire n230;
  wire n231;
  wire n232;
  wire n233;
  wire n234;
  wire n235;
  wire n236;
  wire n237;
  wire n238;
  wire n239;
  wire n24;
  wire n240;
  wire n241;
  wire n242;
  wire n243;
  wire n244;
  wire n245;
  wire n246;
  wire n247;
  wire n248;
  wire n249;
  wire n25;
  wire n250;
  wire n251;
  wire n252;
  wire n253;
  wire n254;
  wire n255;
  wire n256;
  wire n257;
  wire n258;
  wire n259;
  wire n26;
  wire n260;
  wire n261;
  wire n262;
  wire n263;
  wire n264;
  wire n265;
  wire n266;
  wire n267;
  wire n268;
  wire n269;
  wire n27;
  wire n270;
  wire n271;
  wire n272;
  wire n273;
  wire n274;
  wire n275;
  wire n276;
  wire n277;
  wire n278;
  wire n279;
  wire n28;
  wire n280;
  wire n281;
  wire n282;
  wire n283;
  wire n284;
  wire n285;
  wire n286;
  wire n287;
  wire n288;
  wire n289;
  wire n29;
  wire n290;
  wire n291;
  wire n292;
  wire n293;
  wire n294;
  wire n295;
  wire n296;
  wire n297;
  wire n298;
  wire n299;
  wire n3;
  wire n30;
  wire n300;
  wire n301;
  wire n302;
  wire n303;
  wire n304;
  wire n305;
  wire n306;
  wire n307;
  wire n308;
  wire n309;
  wire n31;
  wire n310;
  wire n311;
  wire n312;
  wire n313;
  wire n314;
  wire n315;
  wire n316;
  wire n317;
  wire n318;
  wire n319;
  wire n32;
  wire n320;
  wire n321;
  wire n322;
  wire n323;
  wire n324;
  wire n325;
  wire n326;
  wire n327;
  wire n328;
  wire n329;
  wire n33;
  wire n330;
  wire n331;
  wire n332;
  wire n333;
  wire n334;
  wire n335;
  wire n336;
  wire n337;
  wire n338;
  wire n339;
  wire n34;
  wire n340;
  wire n341;
  wire n342;
  wire n343;
  wire n344;
  wire n345;
  wire n346;
  wire n347;
  wire n348;
  wire n349;
  wire n35;
  wire n350;
  wire n351;
  wire n352;
  wire n353;
  wire n354;
  wire n355;
  wire n356;
  wire n357;
  wire n358;
  wire n359;
  wire n36;
  wire n360;
  wire n361;
  wire n362;
  wire n363;
  wire n364;
  wire n365;
  wire n366;
  wire n367;
  wire n368;
  wire n369;
  wire n37;
  wire n370;
  wire n371;
  wire n372;
  wire n373;
  wire n374;
  wire n375;
  wire n376;
  wire n377;
  wire n378;
  wire n379;
  wire n38;
  wire n380;
  wire n381;
  wire n382;
  wire n383;
  wire n384;
  wire n385;
  wire n386;
  wire n387;
  wire n388;
  wire n389;
  wire n39;
  wire n390;
  wire n391;
  wire n392;
  wire n393;
  wire n394;
  wire n395;
  wire n396;
  wire n397;
  wire n398;
  wire n399;
  wire n4;
  wire n40;
  wire n400;
  wire n401;
  wire n402;
  wire n403;
  wire n404;
  wire n405;
  wire n406;
  wire n407;
  wire n408;
  wire n409;
  wire n41;
  wire n410;
  wire n411;
  wire n412;
  wire n413;
  wire n414;
  wire n415;
  wire n416;
  wire n417;
  wire n418;
  wire n419;
  wire n42;
  wire n420;
  wire n421;
  wire n422;
  wire n423;
  wire n424;
  wire n425;
  wire n426;
  wire n427;
  wire n428;
  wire n429;
  wire n43;
  wire n430;
  wire n431;
  wire n432;
  wire n433;
  wire n434;
  wire n435;
  wire n436;
  wire n437;
  wire n438;
  wire n439;
  wire n44;
  wire n440;
  wire n441;
  wire n442;
  wire n443;
  wire n444;
  wire n445;
  wire n446;
  wire n447;
  wire n448;
  wire n449;
  wire n45;
  wire n450;
  wire n451;
  wire n452;
  wire n453;
  wire n454;
  wire n455;
  wire n456;
  wire n457;
  wire n458;
  wire n459;
  wire n46;
  wire n460;
  wire n461;
  wire n462;
  wire n463;
  wire n464;
  wire n465;
  wire n466;
  wire n467;
  wire n468;
  wire n469;
  wire n47;
  wire n470;
  wire n471;
  wire n472;
  wire n473;
  wire n474;
  wire n475;
  wire n476;
  wire n477;
  wire n478;
  wire n479;
  wire n48;
  wire n480;
  wire n481;
  wire n482;
  wire n483;
  wire n484;
  wire n485;
  wire n486;
  wire n487;
  wire n488;
  wire n489;
  wire n49;
  wire n490;
  wire n491;
  wire n492;
  wire n493;
  wire n494;
  wire n495;
  wire n496;
  wire n497;
  wire n498;
  wire n499;
  wire n5;
  wire n50;
  wire n500;
  wire n501;
  wire n502;
  wire n503;
  wire n504;
  wire n505;
  wire n506;
  wire n507;
  wire n508;
  wire n509;
  wire n51;
  wire n510;
  wire n511;
  wire n512;
  wire n513;
  wire n514;
  wire n515;
  wire n516;
  wire n517;
  wire n518;
  wire n519;
  wire n52;
  wire n520;
  wire n521;
  wire n522;
  wire n523;
  wire n524;
  wire n525;
  wire n526;
  wire n527;
  wire n528;
  wire n529;
  wire n53;
  wire n530;
  wire n531;
  wire n532;
  wire n533;
  wire n534;
  wire n535;
  wire n536;
  wire n537;
  wire n538;
  wire n539;
  wire n54;
  wire n540;
  wire n541;
  wire n542;
  wire n543;
  wire n544;
  wire n545;
  wire n546;
  wire n547;
  wire n548;
  wire n549;
  wire n55;
  wire n550;
  wire n551;
  wire n552;
  wire n553;
  wire n554;
  wire n555;
  wire n556;
  wire n557;
  wire n558;
  wire n559;
  wire n56;
  wire n560;
  wire n561;
  wire n562;
  wire n563;
  wire n564;
  wire n565;
  wire n566;
  wire n567;
  wire n568;
  wire n569;
  wire n57;
  wire n570;
  wire n571;
  wire n572;
  wire n573;
  wire n574;
  wire n575;
  wire n576;
  wire n577;
  wire n578;
  wire n579;
  wire n58;
  wire n580;
  wire n581;
  wire n582;
  wire n583;
  wire n584;
  wire n585;
  wire n586;
  wire n587;
  wire n588;
  wire n589;
  wire n59;
  wire n590;
  wire n591;
  wire n592;
  wire n593;
  wire n594;
  wire n595;
  wire n596;
  wire n597;
  wire n598;
  wire n599;
  wire n6;
  wire n60;
  wire n600;
  wire n601;
  wire n602;
  wire n603;
  wire n604;
  wire n605;
  wire n606;
  wire n607;
  wire n608;
  wire n609;
  wire n61;
  wire n610;
  wire n611;
  wire n612;
  wire n613;
  wire n614;
  wire n615;
  wire n616;
  wire n617;
  wire n618;
  wire n619;
  wire n62;
  wire n620;
  wire n621;
  wire n622;
  wire n623;
  wire n624;
  wire n625;
  wire n626;
  wire n627;
  wire n628;
  wire n629;
  wire n63;
  wire n630;
  wire n631;
  wire n632;
  wire n633;
  wire n634;
  wire n635;
  wire n636;
  wire n637;
  wire n638;
  wire n639;
  wire n64;
  wire n640;
  wire n641;
  wire n642;
  wire n643;
  wire n644;
  wire n645;
  wire n646;
  wire n647;
  wire n648;
  wire n649;
  wire n65;
  wire n650;
  wire n651;
  wire n652;
  wire n653;
  wire n654;
  wire n655;
  wire n656;
  wire n657;
  wire n658;
  wire n659;
  wire n66;
  wire n660;
  wire n661;
  wire n662;
  wire n663;
  wire n664;
  wire n665;
  wire n666;
  wire n667;
  wire n668;
  wire n669;
  wire n67;
  wire n670;
  wire n671;
  wire n672;
  wire n673;
  wire n674;
  wire n675;
  wire n676;
  wire n677;
  wire n678;
  wire n679;
  wire n68;
  wire n680;
  wire n681;
  wire n682;
  wire n683;
  wire n684;
  wire n685;
  wire n686;
  wire n687;
  wire n688;
  wire n689;
  wire n69;
  wire n690;
  wire n691;
  wire n692;
  wire n693;
  wire n694;
  wire n695;
  wire n696;
  wire n697;
  wire n698;
  wire n699;
  wire n7;
  wire n70;
  wire n700;
  wire n701;
  wire n702;
  wire n703;
  wire n704;
  wire n705;
  wire n706;
  wire n707;
  wire n708;
  wire n709;
  wire n71;
  wire n710;
  wire n711;
  wire n712;
  wire n713;
  wire n714;
  wire n715;
  wire n716;
  wire n717;
  wire n718;
  wire n719;
  wire n72;
  wire n720;
  wire n721;
  wire n722;
  wire n723;
  wire n724;
  wire n725;
  wire n726;
  wire n727;
  wire n728;
  wire n729;
  wire n73;
  wire n730;
  wire n731;
  wire n732;
  wire n733;
  wire n734;
  wire n735;
  wire n736;
  wire n737;
  wire n738;
  wire n739;
  wire n74;
  wire n740;
  wire n741;
  wire n742;
  wire n743;
  wire n744;
  wire n745;
  wire n746;
  wire n747;
  wire n748;
  wire n749;
  wire n750;
  wire n751;
  wire n752;
  wire n753;
  wire n754;
  wire n755;
  wire n756;
  wire n757;
  wire n758;
  wire n759;
  wire n760;
  wire n761;
  wire n762;
  wire n763;
  wire n764;
  wire n765;
  wire n766;
  wire n767;
  wire n768;
  wire n769;
  wire n770;
  wire n771;
  wire n772;
  wire n773;
  wire n774;
  wire n775;
  wire n776;
  wire n777;
  wire n778;
  wire n779;
  wire n78;
  wire n780;
  wire n781;
  wire n782;
  wire n783;
  wire n784;
  wire n785;
  wire n786;
  wire n787;
  wire n788;
  wire n789;
  wire n79;
  wire n790;
  wire n791;
  wire n792;
  wire n793;
  wire n794;
  wire n795;
  wire n796;
  wire n797;
  wire n798;
  wire n799;
  wire n8;
  wire n80;
  wire n800;
  wire n801;
  wire n802;
  wire n803;
  wire n804;
  wire n805;
  wire n806;
  wire n807;
  wire n808;
  wire n809;
  wire n810;
  wire n811;
  wire n812;
  wire n813;
  wire n814;
  wire n815;
  wire n816;
  wire n817;
  wire n818;
  wire n819;
  wire n820;
  wire n821;
  wire n822;
  wire n823;
  wire n824;
  wire n825;
  wire n826;
  wire n827;
  wire n828;
  wire n829;
  wire n830;
  wire n831;
  wire n832;
  wire n833;
  wire n834;
  wire n835;
  wire n836;
  wire n837;
  wire n838;
  wire n839;
  wire n84;
  wire n840;
  wire n841;
  wire n842;
  wire n843;
  wire n844;
  wire n845;
  wire n846;
  wire n847;
  wire n848;
  wire n849;
  wire n850;
  wire n851;
  wire n852;
  wire n853;
  wire n854;
  wire n855;
  wire n856;
  wire n857;
  wire n858;
  wire n859;
  wire n860;
  wire n861;
  wire n862;
  wire n863;
  wire n864;
  wire n865;
  wire n866;
  wire n867;
  wire n868;
  wire n869;
  wire n870;
  wire n871;
  wire n872;
  wire n873;
  wire n874;
  wire n875;
  wire n876;
  wire n877;
  wire n878;
  wire n879;
  wire n880;
  wire n881;
  wire n882;
  wire n883;
  wire n884;
  wire n885;
  wire n886;
  wire n887;
  wire n888;
  wire n889;
  wire n89;
  wire n890;
  wire n891;
  wire n892;
  wire n893;
  wire n894;
  wire n895;
  wire n896;
  wire n897;
  wire n898;
  wire n899;
  wire n9;
  wire n900;
  wire n901;
  wire n902;
  wire n903;
  wire n904;
  wire n905;
  wire n906;
  wire n907;
  wire n908;
  wire n909;
  wire n910;
  wire n911;
  wire n912;
  wire n913;
  wire n914;
  wire n915;
  wire n916;
  wire n917;
  wire n918;
  wire n919;
  wire n920;
  wire n921;
  wire n922;
  wire n923;
  wire n924;
  wire n925;
  wire n926;
  wire n927;
  wire n928;
  wire n929;
  wire n930;
  wire n931;
  wire n932;
  wire n933;
  wire n934;
  wire n935;
  wire n936;
  wire n937;
  wire n938;
  wire n939;
  wire n940;
  wire n941;
  wire n942;
  wire n943;
  wire n944;
  wire n945;
  wire n946;
  wire n947;
  wire n948;
  wire n949;
  wire n950;
  wire n951;
  wire n952;
  wire n953;
  wire n954;
  wire n955;
  wire n956;
  wire n957;
  wire n958;
  wire n959;
  wire n960;
  wire n961;
  wire n962;
  wire n963;
  wire n964;
  wire n965;
  wire n966;
  wire n967;
  wire n969;
  wire n970;
  wire n971;
  wire n974;
  wire n975;
  wire n976;
  wire n977;
  wire n979;
  wire n980;
  wire n981;
  wire n982;
  wire n983;
  wire n984;
  wire n985;
  wire n986;
  wire n987;
  wire n988;
  wire n989;
  wire n990;
  wire n991;
  wire n992;
  wire n993;
  wire n994;
  wire n995;
  wire n996;
  wire n997;
  wire n998;
  wire n999;
  wire rd_state$0$_neg;
  wire rd_state$1$_neg;
  wire rst_n_pad;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(3)
  wire sd_clk_int;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(34)
  wire sd_cmd_ack;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(27)
  wire test_error_d;
  wire test_error_en;
  wire test_error_pad;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(13)
  wire u100_sel_is_3_o;
  wire u24_b2_sel_is_3_o;
  wire u24_b2_sel_is_3_o_neg;
  wire u25_b0_sel_is_7_o;
  wire u28_b0_sel_is_2_o;
  wire u43_b0_sel_is_3_o;
  wire u46_b0_sel_is_7_o;
  wire u46_b10_sel_is_7_o;
  wire u50_b0_sel_is_2_o;
  wire u52_b0_sel_is_0_o;
  wire u63_b0_sel_is_2_o;
  wire u75_sel_is_3_o;
  wire u80_b0_sel_is_6_o;
  wire u80_b10_sel_is_2_o;
  wire u82_sel_is_6_o;
  wire u83_b0_sel_is_0_o;
  wire u_sdram_ICAS_N;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(58)
  wire u_sdram_IRAS_N;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(57)
  wire u_sdram_IWE_N;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(59)
  wire u_sdram_cm_ack;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(76)
  wire u_sdram_command1_bankclose;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(78)
  wire u_sdram_command1_command_delay$0$_d;
  wire u_sdram_command1_command_delay$0$_en;
  wire u_sdram_command1_command_delay$1$_d;
  wire u_sdram_command1_command_delay$2$_d;
  wire u_sdram_command1_command_delay$3$_d;
  wire u_sdram_command1_command_delay$4$_d;
  wire u_sdram_command1_command_delay$5$_d;
  wire u_sdram_command1_command_delay$6$_d;
  wire u_sdram_command1_command_delay$7$_d;
  wire u_sdram_command1_command_done;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(66)
  wire u_sdram_command1_do_load_mode;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(65)
  wire u_sdram_command1_do_load_mode_neg;
  wire u_sdram_command1_do_precharge;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(64)
  wire u_sdram_command1_do_reada;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(61)
  wire u_sdram_command1_do_rw;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(71)
  wire u_sdram_command1_do_writea;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(62)
  wire u_sdram_command1_n0;
  wire u_sdram_command1_n10;
  wire u_sdram_command1_n11;
  wire u_sdram_command1_n12;
  wire u_sdram_command1_n13;
  wire u_sdram_command1_n14;
  wire u_sdram_command1_n15;
  wire u_sdram_command1_n16;
  wire u_sdram_command1_n17;
  wire u_sdram_command1_n19;
  wire u_sdram_command1_n2;
  wire u_sdram_command1_n20;
  wire u_sdram_command1_n21;
  wire u_sdram_command1_n25;
  wire u_sdram_command1_n26;
  wire u_sdram_command1_n28;
  wire u_sdram_command1_n29;
  wire u_sdram_command1_n3;
  wire u_sdram_command1_n32;
  wire u_sdram_command1_n33;
  wire u_sdram_command1_n33_neg;
  wire u_sdram_command1_n34;
  wire u_sdram_command1_n34_neg;
  wire u_sdram_command1_n35;
  wire u_sdram_command1_n35_neg;
  wire u_sdram_command1_n38;
  wire u_sdram_command1_n4;
  wire u_sdram_command1_n40;
  wire u_sdram_command1_n42;
  wire u_sdram_command1_n42_neg;
  wire u_sdram_command1_n43;
  wire u_sdram_command1_n44;
  wire u_sdram_command1_n47;
  wire u_sdram_command1_n47_d;
  wire u_sdram_command1_n47_en;
  wire u_sdram_command1_n50;
  wire u_sdram_command1_n51;
  wire u_sdram_command1_n51_neg;
  wire u_sdram_command1_n52;
  wire u_sdram_command1_n52_neg;
  wire u_sdram_command1_n53;
  wire u_sdram_command1_n56;
  wire u_sdram_command1_n57;
  wire u_sdram_command1_n59;
  wire u_sdram_command1_n6;
  wire u_sdram_command1_n61;
  wire u_sdram_command1_n64;
  wire u_sdram_command1_n65;
  wire u_sdram_command1_n66;
  wire u_sdram_command1_n67;
  wire u_sdram_command1_n68;
  wire u_sdram_command1_n7;
  wire u_sdram_command1_n8;
  wire u_sdram_command1_n9;
  wire u_sdram_command1_oe1;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(72)
  wire u_sdram_command1_rp_done;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(74)
  wire u_sdram_command1_rp_shift$1$_d;
  wire u_sdram_command1_rp_shift$1$_en;
  wire u_sdram_command1_rp_shift$2$_d;
  wire u_sdram_command1_rp_shift$3$_d;
  wire u_sdram_command1_rw_flag;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(70)
  wire u_sdram_command1_u47_b2_sel_is_0_o;
  wire u_sdram_command1_u47_b2_sel_is_0_o_neg;
  wire u_sdram_command1_u49_b2_sel_is_0_o;
  wire u_sdram_command1_u49_b2_sel_is_0_o_neg;
  wire u_sdram_command1_u51_b2_sel_is_1_o;
  wire u_sdram_command1_u82_sel_is_2_o;
  wire u_sdram_command1_u86_sel_is_0_o;
  wire u_sdram_command1_u91_sel_is_0_o;
  wire u_sdram_command1_u92_sel_is_2_o;
  wire u_sdram_control1_LOAD_REG1;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(49)
  wire u_sdram_control1_LOAD_REG2;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(50)
  wire u_sdram_control1_n1;
  wire u_sdram_control1_n10;
  wire u_sdram_control1_n11;
  wire u_sdram_control1_n12;
  wire u_sdram_control1_n13;
  wire u_sdram_control1_n14;
  wire u_sdram_control1_n18;
  wire u_sdram_control1_n19;
  wire u_sdram_control1_n22;
  wire u_sdram_control1_n24;
  wire u_sdram_control1_n25;
  wire u_sdram_control1_n28;
  wire u_sdram_control1_n35;
  wire u_sdram_control1_n36;
  wire u_sdram_control1_n37;
  wire u_sdram_control1_n38;
  wire u_sdram_control1_n39;
  wire u_sdram_control1_n40;
  wire u_sdram_control1_n41;
  wire u_sdram_control1_n42;
  wire u_sdram_control1_n43;
  wire u_sdram_control1_n44;
  wire u_sdram_control1_n5;
  wire u_sdram_control1_n6;
  wire u_sdram_control1_n7;
  wire u_sdram_control1_n8;
  wire u_sdram_control1_n9;
  wire u_sdram_load_mode;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(70)
  wire u_sdram_oe;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(75)
  wire u_sdram_precharge;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(74)
  wire u_sdram_reada;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(72)
  wire u_sdram_writea;  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(73)
  wire wr_state$0$_neg;
  wire wr_state$1$_neg;

  AL_LOGIC_ODDR #(
    .SRMODE("SYNC"))
    ODDR_0 (.clk(sd_clk_int),.d1(1'b0),.d2(1'b1),.rst(1'b0),.q(SD_CLK));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(79)
  AL_PHY_PAD #(
    //.LOCATION("PS37"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_A0 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_SA[0]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS36"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_A1 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_SA[1]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS38"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_A10 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_SA[10]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS35"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_A2 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_SA[2]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS34"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_A3 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_SA[3]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS17"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_A4 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_SA[4]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS16"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_A5 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_SA[5]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS15"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_A6 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_SA[6]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS14"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_A7 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_SA[7]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS13"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_A8 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_SA[8]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS12"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_A9 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_SA[9]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS39"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_BA0 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_BA[0]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS40"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_BA1 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_BA[1]),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS10"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_CASN (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_CAS_N),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS41"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_CK (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_CLK),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS50"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_DM (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(1'b0),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS1"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ0 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[0]),.rst(),.ts(u_sdram_oe),.di(SD_DQ[0]),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS2"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ1 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[1]),.rst(),.ts(u_sdram_oe),.di(SD_DQ[1]),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS44"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ10 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[10]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS45"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ11 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[11]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS46"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ12 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[12]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS47"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ13 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[13]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS48"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ14 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[14]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS49"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ15 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[15]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS25"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ16 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[16]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS24"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ17 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[17]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS23"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ18 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[18]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS22"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ19 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[19]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS3"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ2 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[10]),.rst(),.ts(u_sdram_oe),.di(SD_DQ[2]),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS21"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ20 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[20]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS20"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ21 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[21]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS19"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ22 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[22]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS18"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ23 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[23]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS4"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ3 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[11]),.rst(),.ts(u_sdram_oe),.di(SD_DQ[3]),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS5"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ4 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[12]),.rst(),.ts(u_sdram_oe),.di(SD_DQ[4]),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS6"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ5 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[13]),.rst(),.ts(u_sdram_oe),.di(SD_DQ[5]),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS7"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ6 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[14]),.rst(),.ts(u_sdram_oe),.di(SD_DQ[6]),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS8"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ7 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[15]),.rst(),.ts(u_sdram_oe),.di(SD_DQ[7]),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS42"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ8 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[0]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS43"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    S64_DQ9 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(u_sdram_DQOUT[1]),.rst(),.ts(u_sdram_oe),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS11"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_RASN (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_RAS_N),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  AL_PHY_PAD #(
    //.LOCATION("PS9"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    S64_WEN (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(SD_WE_N),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(91)
  or _al_n0_set (_al_n0_d, 1'b0, u_sdram_command1_do_writea);
  or _al_n0_set_al_u166 (_al_n0_d_al_n158, 1'b0, u_sdram_command1_n21);
  or _al_n0_set_al_u171 (_al_n0_d_al_n160, 1'b0, u_sdram_command1_n26);
  or _al_n1_set (test_error_en, 1'b1, u100_sel_is_3_o);
  or _al_n1_set_al_u158 (u_sdram_command1_command_delay$0$_en, 1'b1, u_sdram_command1_n21);
  or _al_n1_set_al_u168 (u_sdram_command1_rp_shift$1$_en, 1'b1, u_sdram_command1_n26);
  or _al_n1_set_al_u173 (u_sdram_command1_n47_en, 1'b1, u_sdram_command1_do_load_mode);
  AL_PHY_PAD #(
    //.LOCATION("P39"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u174 (.ce(),.clk(),.eninr_dyn(),.ipad(CLKIN),.ocomp(),.otrue(),.rst(),.ts(),.di(CLKIN_pad),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(2)
  AL_PHY_PAD #(
    //.LOCATION("P138"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u175 (.ce(),.clk(),.eninr_dyn(),.ipad(rst_n),.ocomp(),.otrue(),.rst(),.ts(),.di(rst_n_pad),.icomp(),.itrue(),.opad(),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(3)
  AL_PHY_PAD #(
    //.LOCATION("P137"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u176 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(test_error_pad),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(test_error),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(13)
  AL_PHY_PAD #(
    //.LOCATION("P78"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u177 (.ce(),.clk(),.eninr_dyn(),.ipad(),.ocomp(),.otrue(1'bx),.rst(),.ts(),.di(),.icomp(),.itrue(),.opad(test_io),.bpad());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(12)
  not burst_cnt$0$_inv (n1092, burst_cnt[0]);
  not burst_cnt$1$_inv (n1093, burst_cnt[1]);
  not burst_cnt$2$_inv (n1078, burst_cnt[2]);
  not burst_cnt$3$_inv (n1079, burst_cnt[3]);
  not burst_cnt$4$_inv (n1080, burst_cnt[4]);
  not burst_cnt$5$_inv (n1081, burst_cnt[5]);
  not burst_cnt$6$_inv (n1082, burst_cnt[6]);
  not burst_cnt$7$_inv (n1083, burst_cnt[7]);
  not burst_cnt1$0$_inv (n995, burst_cnt1[0]);
  not burst_cnt1$1$_inv (n996, burst_cnt1[1]);
  not burst_cnt1$2$_inv (n997, burst_cnt1[2]);
  not burst_cnt1$3$_inv (n998, burst_cnt1[3]);
  not burst_cnt1$4$_inv (n999, burst_cnt1[4]);
  not burst_cnt1$5$_inv (n1000, burst_cnt1[5]);
  not burst_cnt1$6$_inv (n1001, burst_cnt1[6]);
  not burst_cnt1$7$_inv (n1002, burst_cnt1[7]);
  not n140_inv (n140_neg, n140);
  not rd_addr$10$_inv (n1013, rd_addr[10]);
  not rd_addr$11$_inv (n1014, rd_addr[11]);
  not rd_addr$12$_inv (n1015, rd_addr[12]);
  not rd_addr$13$_inv (n1016, rd_addr[13]);
  not rd_addr$14$_inv (n1017, rd_addr[14]);
  not rd_addr$15$_inv (n1018, rd_addr[15]);
  not rd_addr$16$_inv (n1019, rd_addr[16]);
  not rd_addr$17$_inv (n1020, rd_addr[17]);
  not rd_addr$18$_inv (n1021, rd_addr[18]);
  not rd_addr$19$_inv (n1022, rd_addr[19]);
  not rd_addr$20$_inv (n1023, rd_addr[20]);
  not rd_addr$8$_inv (n1011, rd_addr[8]);
  not rd_addr$9$_inv (n1012, rd_addr[9]);
  not rd_state$0$_inv (rd_state$0$_neg, rd_state[0]);
  not rd_state$1$_inv (rd_state$1$_neg, rd_state[1]);
  not sd_cmd$0$_inv (u_sdram_control1_n37, sd_cmd[0]);
  not sd_cmd$1$_inv (u_sdram_control1_n28, sd_cmd[1]);
  not sd_cmd$2$_inv (u_sdram_control1_n41, sd_cmd[2]);
  not sd_state$0$_inv (n975, sd_state[0]);
  not sd_state$1$_inv (n969, sd_state[1]);
  reg_ar_ss_w1 test_error_reg (.clk(clk_150m),.d(test_error_d),.en(test_error_en),.reset(~rst_n_pad),.set(1'b0),.q(test_error_pad));
  or test_error_set (test_error_d, test_error_pad, u100_sel_is_3_o);
  and u10 (n119, n169[6], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1000 (n905, n98[2], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1001 (n906, n901, n902);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1002 (n907, n904, n905);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1003 (n908, n903, n907);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1004 (n181[2], n906, n908);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1005 (n910, rd_addr[1], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1006 (n911, n170[1], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1007 (n912, rd_addr[1], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1008 (n913, n98[1], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1009 (n914, n909, n910);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u100_sel_is_3 (u100_sel_is_3_o, n176, u82_sel_is_6_o);
  or u101 (n965, n177, n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1010 (n915, n912, n913);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1011 (n916, n911, n915);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1012 (n181[1], n914, n916);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1013 (n918, rd_addr[0], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1014 (n919, n170[0], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1015 (n920, rd_addr[0], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1016 (n921, n98[0], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1017 (n922, n917, n918);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1018 (n923, n920, n921);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1019 (n924, n919, n923);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1020 (n181[0], n922, n924);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1021 (n941, sd_cmd[0], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1022 (n933, sd_cmd[1], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1023 (n926, sd_cmd[2], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1024 (n927, n168[2], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1025 (n928, n132[2], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1026 (n929, n97[2], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1027 (n930, n925, n926);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1028 (n931, n928, n929);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1029 (n932, n927, n931);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  reg_ar_as_w1 u102_b0 (.clk(clk_150m),.d(n187[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u102_b1 (.clk(clk_150m),.d(n187[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u102_b2 (.clk(clk_150m),.d(n187[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u102_b3 (.clk(clk_150m),.d(n187[3]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u102_b4 (.clk(clk_150m),.d(n187[4]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u102_b5 (.clk(clk_150m),.d(n187[5]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u102_b6 (.clk(clk_150m),.d(n187[6]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u102_b7 (.clk(clk_150m),.d(n187[7]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u102_b8 (.clk(clk_150m),.d(n187[8]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  or u1030 (n180[2], n930, n932);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1031 (n934, sd_cmd[1], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1032 (n935, n168[1], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1033 (n936, n132[1], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1034 (n937, n97[1], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1035 (n938, n933, n934);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1036 (n939, n936, n937);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1037 (n940, n935, n939);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1038 (n180[1], n938, n940);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1039 (n942, sd_cmd[0], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  reg_ar_as_w1 u103_b0 (.clk(clk_150m),.d(n188[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt1[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u103_b1 (.clk(clk_150m),.d(n188[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt1[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u103_b2 (.clk(clk_150m),.d(n188[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt1[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u103_b3 (.clk(clk_150m),.d(n188[3]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt1[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u103_b4 (.clk(clk_150m),.d(n188[4]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt1[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u103_b5 (.clk(clk_150m),.d(n188[5]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt1[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u103_b6 (.clk(clk_150m),.d(n188[6]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt1[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u103_b7 (.clk(clk_150m),.d(n188[7]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt1[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u103_b8 (.clk(clk_150m),.d(n188[8]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(burst_cnt1[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  and u1040 (n943, n168[0], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1041 (n944, n132[0], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1042 (n945, n97[0], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1043 (n946, n941, n942);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1044 (n947, n944, n945);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1045 (n948, n943, n947);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1046 (n180[0], n946, n948);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1047 (n957, reset_step[0], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1048 (n950, reset_step[1], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1049 (n951, reset_step[1], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  reg_ar_as_w1 u104_b0 (.clk(clk_150m),.d(n183[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_state[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u104_b1 (.clk(clk_150m),.d(n183[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_state[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u104_b2 (.clk(clk_150m),.d(n183[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_state[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  and u1050 (n952, reset_step[1], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1051 (n953, n96[1], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1052 (n954, n949, n950);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1053 (n955, n952, n953);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1054 (n956, n951, n955);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1055 (n179[1], n954, n956);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1056 (n958, reset_step[0], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1057 (n959, reset_step[0], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1058 (n960, reset_step[0], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u1059 (n961, n96[0], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  reg_ar_as_w1 u105_b0 (.clk(clk_150m),.d(n185[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_state[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u105_b1 (.clk(clk_150m),.d(n185[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_state[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  or u1060 (n962, n957, n958);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1061 (n963, n960, n961);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1062 (n964, n959, n963);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1063 (n179[0], n962, n964);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1064 (n966, n175, n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1065 (n967, n965, n966);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  not u1066 (n178, n967);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1068 (n970, n969, sd_state[2]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(254)
  or u1069 (n971, n975, n970);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(254)
  reg_ar_as_w1 u106_b0 (.clk(clk_150m),.d(n189[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_state[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u106_b1 (.clk(clk_150m),.d(n189[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_state[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  not u1070 (n177, n971);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(254)
  or u1073 (n974, sd_state[0], n970);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(202)
  not u1074 (n176, n974);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(202)
  or u1075 (n976, sd_state[1], sd_state[2]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(160)
  or u1076 (n977, n975, n976);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(160)
  not u1077 (n175, n977);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(160)
  or u1079 (n979, sd_state[0], n976);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(114)
  reg_ar_as_w1 u107_b0 (.clk(clk_150m),.d(n184[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b1 (.clk(clk_150m),.d(n184[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b10 (.clk(clk_150m),.d(n184[10]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b11 (.clk(clk_150m),.d(n184[11]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[11]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b12 (.clk(clk_150m),.d(n184[12]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[12]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b13 (.clk(clk_150m),.d(n184[13]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[13]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b14 (.clk(clk_150m),.d(n184[14]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[14]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b15 (.clk(clk_150m),.d(n184[15]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[15]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b16 (.clk(clk_150m),.d(n184[16]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[16]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b17 (.clk(clk_150m),.d(n184[17]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[17]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b18 (.clk(clk_150m),.d(n184[18]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[18]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b19 (.clk(clk_150m),.d(n184[19]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[19]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b2 (.clk(clk_150m),.d(n184[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b20 (.clk(clk_150m),.d(n184[20]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[20]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b3 (.clk(clk_150m),.d(n184[3]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b4 (.clk(clk_150m),.d(n184[4]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b5 (.clk(clk_150m),.d(n184[5]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b6 (.clk(clk_150m),.d(n184[6]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b7 (.clk(clk_150m),.d(n184[7]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b8 (.clk(clk_150m),.d(n184[8]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u107_b9 (.clk(clk_150m),.d(n184[9]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_addr[9]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  not u1080 (n174, n979);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(114)
  xor u1081 (n981, SD_DQ[1], datacnt[1]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  xor u1082 (n982, SD_DQ[2], datacnt[2]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  xor u1083 (n983, SD_DQ[3], datacnt[3]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  xor u1084 (n984, SD_DQ[4], datacnt[4]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  xor u1085 (n985, SD_DQ[5], datacnt[5]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  xor u1086 (n986, SD_DQ[6], datacnt[6]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  xor u1087 (n987, SD_DQ[7], datacnt[7]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  or u1088 (n988, n980, n981);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  or u1089 (n989, n982, n983);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  reg_ar_as_w1 u108_b0 (.clk(clk_150m),.d(n182[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b1 (.clk(clk_150m),.d(n182[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b10 (.clk(clk_150m),.d(n182[10]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b11 (.clk(clk_150m),.d(n182[11]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[11]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b12 (.clk(clk_150m),.d(n182[12]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[12]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b13 (.clk(clk_150m),.d(n182[13]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[13]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b14 (.clk(clk_150m),.d(n182[14]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[14]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b15 (.clk(clk_150m),.d(n182[15]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[15]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b16 (.clk(clk_150m),.d(n182[16]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[16]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b17 (.clk(clk_150m),.d(n182[17]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[17]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b18 (.clk(clk_150m),.d(n182[18]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[18]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b19 (.clk(clk_150m),.d(n182[19]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[19]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b2 (.clk(clk_150m),.d(n182[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b20 (.clk(clk_150m),.d(n182[20]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[20]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b3 (.clk(clk_150m),.d(n182[3]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b4 (.clk(clk_150m),.d(n182[4]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b5 (.clk(clk_150m),.d(n182[5]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b6 (.clk(clk_150m),.d(n182[6]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b7 (.clk(clk_150m),.d(n182[7]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b8 (.clk(clk_150m),.d(n182[8]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u108_b9 (.clk(clk_150m),.d(n182[9]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(wr_addr[9]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  or u1090 (n990, n988, n989);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  or u1091 (n991, n984, n985);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  or u1092 (n992, n986, n987);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  or u1093 (n993, n991, n992);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  or u1094 (n994, n990, n993);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  reg_ar_as_w1 u109_b0 (.clk(clk_150m),.d(n181[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b1 (.clk(clk_150m),.d(n181[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b10 (.clk(clk_150m),.d(n181[10]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b11 (.clk(clk_150m),.d(n181[11]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[11]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b12 (.clk(clk_150m),.d(n181[12]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[12]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b13 (.clk(clk_150m),.d(n181[13]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[13]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b14 (.clk(clk_150m),.d(n181[14]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[14]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b15 (.clk(clk_150m),.d(n181[15]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[15]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b16 (.clk(clk_150m),.d(n181[16]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[16]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b17 (.clk(clk_150m),.d(n181[17]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[17]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b18 (.clk(clk_150m),.d(n181[18]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[18]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b19 (.clk(clk_150m),.d(n181[19]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[19]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b2 (.clk(clk_150m),.d(n181[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b20 (.clk(clk_150m),.d(n181[20]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[20]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b3 (.clk(clk_150m),.d(n181[3]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b4 (.clk(clk_150m),.d(n181[4]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b5 (.clk(clk_150m),.d(n181[5]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b6 (.clk(clk_150m),.d(n181[6]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b7 (.clk(clk_150m),.d(n181[7]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b8 (.clk(clk_150m),.d(n181[8]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u109_b9 (.clk(clk_150m),.d(n181[9]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(rd_addr[9]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  and u11 (n157, datacnt[6], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1102 (n1003, n995, n996);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(230)
  or u1103 (n1004, n997, n998);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(230)
  or u1104 (n1005, n1003, n1004);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(230)
  or u1105 (n1006, n999, n1000);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(230)
  or u1106 (n1007, n1002, burst_cnt1[8]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(230)
  or u1107 (n1008, n1001, n1007);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(230)
  or u1108 (n1009, n1006, n1008);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(230)
  or u1109 (n1010, n1005, n1009);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(230)
  reg_ar_as_w1 u110_b0 (.clk(clk_150m),.d(n186[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(fifo_q[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u110_b1 (.clk(clk_150m),.d(n186[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(fifo_q[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u110_b2 (.clk(clk_150m),.d(n186[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(fifo_q[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u110_b3 (.clk(clk_150m),.d(n186[3]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(fifo_q[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u110_b4 (.clk(clk_150m),.d(n186[4]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(fifo_q[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u110_b5 (.clk(clk_150m),.d(n186[5]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(fifo_q[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u110_b6 (.clk(clk_150m),.d(n186[6]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(fifo_q[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u110_b7 (.clk(clk_150m),.d(n186[7]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(fifo_q[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  not u1110 (n152, n1010);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(230)
  reg_ar_as_w1 u111_b0 (.clk(clk_150m),.d(n190[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(datacnt[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u111_b1 (.clk(clk_150m),.d(n190[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(datacnt[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u111_b2 (.clk(clk_150m),.d(n190[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(datacnt[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u111_b3 (.clk(clk_150m),.d(n190[3]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(datacnt[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u111_b4 (.clk(clk_150m),.d(n190[4]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(datacnt[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u111_b5 (.clk(clk_150m),.d(n190[5]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(datacnt[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u111_b6 (.clk(clk_150m),.d(n190[6]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(datacnt[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u111_b7 (.clk(clk_150m),.d(n190[7]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(datacnt[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  or u1124 (n1024, rd_addr[0], rd_addr[1]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1125 (n1025, rd_addr[3], rd_addr[4]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1126 (n1026, rd_addr[2], n1025);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1127 (n1027, n1024, n1026);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1128 (n1028, rd_addr[5], rd_addr[6]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1129 (n1029, n1011, n1012);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  binary_mux_s1_w1 u112_b0 (.i0(reset_step[0]),.i1(1'b0),.sel(sd_cmd_ack),.o(n75[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(156)
  binary_mux_s1_w1 u112_b1 (.i0(reset_step[1]),.i1(1'b1),.sel(sd_cmd_ack),.o(n75[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(156)
  binary_mux_s1_w1 u112_b2 (.i0(reset_step[0]),.i1(n85[0]),.sel(sd_cmd_ack),.o(n81[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(156)
  binary_mux_s1_w1 u112_b3 (.i0(reset_step[1]),.i1(n85[1]),.sel(sd_cmd_ack),.o(n81[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(156)
  binary_mux_s1_w1 u112_b7 (.i0(reset_step[1]),.i1(1'b0),.sel(sd_cmd_ack),.o(n91[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(156)
  or u1130 (n1030, rd_addr[7], n1029);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1131 (n1031, n1028, n1030);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1132 (n1032, n1027, n1031);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1133 (n1033, n1013, n1014);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1134 (n1034, n1016, n1017);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1135 (n1035, n1015, n1034);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1136 (n1036, n1033, n1035);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1137 (n1037, n1019, n1020);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1138 (n1038, n1018, n1037);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1139 (n1039, n1022, n1023);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  reg_ar_as_w1 u113_b0 (.clk(clk_150m),.d(n179[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(reset_step[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u113_b1 (.clk(clk_150m),.d(n179[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(reset_step[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  or u1140 (n1040, n1021, n1039);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1141 (n1041, n1038, n1040);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1142 (n1042, n1036, n1041);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  or u1143 (n1043, n1032, n1042);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  not u1144 (n143, n1043);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(222)
  reg_ar_as_w1 u114_b0 (.clk(clk_150m),.d(n180[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_cmd[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u114_b1 (.clk(clk_150m),.d(n180[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_cmd[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  reg_ar_as_w1 u114_b2 (.clk(clk_150m),.d(n180[2]),.en(1'b1),.reset(1'b0),.set(~rst_n_pad),.q(sd_cmd[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(257)
  or u1158 (n1057, wr_addr[0], wr_addr[1]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1159 (n1058, wr_addr[3], wr_addr[4]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  binary_mux_s1_w1 u115_b0 (.i0(wr_state[0]),.i1(n103[0]),.sel(sd_cmd_ack),.o(n104[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(196)
  binary_mux_s1_w1 u115_b1 (.i0(wr_state[1]),.i1(n103[1]),.sel(sd_cmd_ack),.o(n104[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(196)
  binary_mux_s1_w1 u115_b2 (.i0(wr_state[0]),.i1(1'b0),.sel(sd_cmd_ack),.o(n126[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(196)
  binary_mux_s1_w1 u115_b3 (.i0(wr_state[1]),.i1(1'b0),.sel(sd_cmd_ack),.o(n126[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(196)
  or u1160 (n1059, wr_addr[2], n1058);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1161 (n1060, n1057, n1059);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1162 (n1061, wr_addr[5], wr_addr[6]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1163 (n1062, n1044, n1045);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1164 (n1063, wr_addr[7], n1062);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1165 (n1064, n1061, n1063);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1166 (n1065, n1060, n1064);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1167 (n1066, n1046, n1047);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1168 (n1067, n1049, n1050);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1169 (n1068, n1048, n1067);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  binary_mux_s1_w1 u116_b0 (.i0(1'b0),.i1(1'b1),.sel(sd_cmd_ack),.o(n76[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(156)
  binary_mux_s1_w1 u116_b10 (.i0(1'b1),.i1(1'b0),.sel(sd_cmd_ack),.o(n92[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(156)
  or u1170 (n1069, n1066, n1068);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1171 (n1070, n1052, n1053);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1172 (n1071, n1051, n1070);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1173 (n1072, n1055, n1056);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1174 (n1073, n1054, n1072);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1175 (n1074, n1071, n1073);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1176 (n1075, n1069, n1074);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  or u1177 (n1076, n1065, n1075);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  not u1178 (n115, n1076);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(188)
  binary_mux_s1_w1 u117_b1 (.i0(sd_addr[1]),.i1(1'b1),.sel(sd_cmd_ack),.o(n77[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(144)
  binary_mux_s1_w1 u117_b10 (.i0(sd_addr[10]),.i1(1'b0),.sel(sd_cmd_ack),.o(n77[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(144)
  binary_mux_s1_w1 u117_b11 (.i0(sd_addr[11]),.i1(1'b0),.sel(sd_cmd_ack),.o(n77[11]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(144)
  binary_mux_s1_w1 u117_b22 (.i0(sd_addr[1]),.i1(1'b0),.sel(sd_cmd_ack),.o(n83[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(144)
  binary_mux_s1_w1 u117_b24 (.i0(sd_addr[3]),.i1(1'b0),.sel(sd_cmd_ack),.o(n83[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(144)
  binary_mux_s1_w1 u117_b25 (.i0(sd_addr[4]),.i1(1'b1),.sel(sd_cmd_ack),.o(n83[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(144)
  binary_mux_s1_w1 u117_b29 (.i0(sd_addr[8]),.i1(1'b0),.sel(sd_cmd_ack),.o(n83[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(144)
  binary_mux_s1_w1 u117_b31 (.i0(sd_addr[10]),.i1(1'b1),.sel(sd_cmd_ack),.o(n83[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(144)
  binary_mux_s1_w1 u117_b32 (.i0(sd_addr[11]),.i1(1'b1),.sel(sd_cmd_ack),.o(n83[11]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(144)
  binary_mux_s1_w1 u117_b45 (.i0(sd_addr[3]),.i1(1'b1),.sel(sd_cmd_ack),.o(n88[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(144)
  binary_mux_s1_w1 u117_b46 (.i0(sd_addr[4]),.i1(1'b0),.sel(sd_cmd_ack),.o(n88[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(144)
  binary_mux_s1_w1 u117_b50 (.i0(sd_addr[8]),.i1(1'b1),.sel(sd_cmd_ack),.o(n88[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(144)
  and u118 (n141, datacnt[5], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1185 (n1084, n1092, burst_cnt[1]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(181)
  or u1186 (n1085, n1078, n1079);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(181)
  or u1187 (n1086, n1084, n1085);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(181)
  or u1188 (n1087, n1080, n1081);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(181)
  or u1189 (n1088, n1083, burst_cnt[8]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(181)
  and u119 (n134, n169[5], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1190 (n1089, n1082, n1088);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(181)
  or u1191 (n1090, n1087, n1089);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(181)
  or u1192 (n1091, n1086, n1090);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(181)
  not u1193 (n111, n1091);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(181)
  or u12 (n190[7], n154, n80);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u120 (n120, datacnt[5], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u1201 (n1100, n1092, n1093);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(174)
  or u1203 (n1102, n1100, n1085);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(174)
  or u1208 (n1107, n1102, n1090);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(174)
  not u1209 (n106, n1107);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(174)
  and u121 (n116, datacnt[5], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u122 (n113, n144, n141);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u123 (n107, n120, n116);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u124 (n102, n134, n107);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u125 (n190[5], n113, n102);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u126 (n84, datacnt[4], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u127 (n78, n169[4], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u128 (n73, datacnt[4], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u129 (n71, datacnt[4], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  add_pu2_pu2_o2 u13 (.i0(reset_step),.i1(2'b01),.o(n85));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(138)
  or u130 (n26, n89, n84);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u131 (n25, n73, n71);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u132 (n24, n78, n25);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u133 (n190[4], n26, n24);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u134 (n22, datacnt[3], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u135 (n21, n169[3], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u136 (n20, datacnt[3], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u137 (n19, datacnt[3], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u138 (n18, n23, n22);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u139 (n17, n20, n19);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u14 (n80, n138, n153);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u140 (n16, n21, n17);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u141 (n190[3], n18, n16);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u142 (n14, datacnt[2], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u143 (n13, n169[2], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u144 (n12, datacnt[2], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u145 (n11, datacnt[2], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u146 (n10, n15, n14);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u147 (n9, n12, n11);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u148 (n8, n13, n9);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u149 (n190[2], n10, n8);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u15 (n153, n137, n155);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u150 (n6, datacnt[1], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u151 (n5, n169[1], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u152 (n4, datacnt[1], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u153 (n3, datacnt[1], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u154 (n2, n7, n6);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u155 (n1, n4, n3);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u156 (n0, n5, n1);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u157 (n190[1], n2, n0);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u158 (n301, datacnt[0], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u159 (n69, n169[0], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u16 (n154, n68, n139);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u160 (n70, datacnt[0], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u161 (n52, datacnt[0], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u162 (n53, n300, n301);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u163 (n54, n70, n52);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u164 (n55, n69, n54);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u165 (n190[0], n53, n55);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u166 (n64, rd_state[0], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u167 (n57, rd_state[1], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u168 (n58, n167[1], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u169 (n59, rd_state[1], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  add_pu3_pu3_o3 u17 (.i0(sd_state),.i1(3'b001),.o(n90));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(152)
  and u170 (n60, rd_state[1], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u171 (n61, n56, n57);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u172 (n62, n59, n60);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u173 (n63, n58, n62);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u174 (n189[1], n61, n63);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u175 (n65, rd_state[0], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u176 (n66, n167[0], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u177 (n67, rd_state[0], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u178 (n72, rd_state[0], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u179 (n299, n64, n65);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u18 (n155, datacnt[7], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u180 (n298, n67, n72);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u181 (n297, n66, n298);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u182 (n189[0], n299, n297);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u183 (n285, burst_cnt1[0], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u184 (n27, burst_cnt1[1], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u185 (n230, burst_cnt1[2], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u186 (n238, burst_cnt1[3], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u187 (n288, burst_cnt1[4], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u188 (n30, burst_cnt1[5], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u189 (n38, burst_cnt1[6], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u19 (n137, datacnt[7], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u190 (n46, burst_cnt1[7], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u191 (n295, burst_cnt1[8], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u192 (n294, n166[8], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u193 (n51, burst_cnt1[8], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u194 (n50, burst_cnt1[8], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u195 (n49, n296, n295);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u196 (n48, n51, n50);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u197 (n47, n294, n48);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u198 (n188[8], n49, n47);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u199 (n45, burst_cnt1[7], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u2 (n190[6], n162, n158);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u200 (n44, n166[7], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u201 (n43, burst_cnt1[7], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u202 (n42, burst_cnt1[7], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u203 (n41, n46, n45);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u204 (n40, n43, n42);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u205 (n39, n44, n40);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u206 (n188[7], n41, n39);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u207 (n37, burst_cnt1[6], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u208 (n36, n166[6], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u209 (n35, burst_cnt1[6], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u210 (n34, burst_cnt1[6], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u211 (n33, n38, n37);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u212 (n32, n35, n34);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u213 (n31, n36, n32);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u214 (n188[6], n33, n31);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u215 (n29, burst_cnt1[5], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u216 (n28, n166[5], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u217 (n293, burst_cnt1[5], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u218 (n292, burst_cnt1[5], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u219 (n291, n30, n29);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u220 (n290, n293, n292);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u221 (n289, n28, n290);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u222 (n188[5], n291, n289);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u223 (n287, burst_cnt1[4], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u224 (n286, n166[4], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u225 (n243, burst_cnt1[4], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u226 (n242, burst_cnt1[4], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u227 (n241, n288, n287);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u228 (n240, n243, n242);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u229 (n239, n286, n240);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u230 (n188[4], n241, n239);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u231 (n237, burst_cnt1[3], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u232 (n236, n166[3], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u233 (n235, burst_cnt1[3], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u234 (n234, burst_cnt1[3], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u235 (n233, n238, n237);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u236 (n232, n235, n234);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u237 (n231, n236, n232);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u238 (n188[3], n233, n231);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u239 (n229, burst_cnt1[2], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s2_w1 u23_b0 (.i0(n75[0]),.i1(n81[0]),.i2(n81[0]),.i3(n75[0]),.sel(reset_step),.o(n96[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(158)
  binary_mux_s2_w1 u23_b1 (.i0(n75[1]),.i1(n81[1]),.i2(n81[1]),.i3(n91[1]),.sel(reset_step),.o(n96[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(158)
  and u240 (n228, n166[2], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u241 (n227, burst_cnt1[2], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u242 (n226, burst_cnt1[2], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u243 (n225, n230, n229);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u244 (n224, n227, n226);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u245 (n223, n228, n224);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u246 (n188[2], n225, n223);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u247 (n197, burst_cnt1[1], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u248 (n196, n166[1], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u249 (n195, burst_cnt1[1], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s2_w1 u24_b0 (.i0(n76[0]),.i1(1'b1),.i2(n92[1]),.i3(1'b0),.sel(reset_step),.o(n97[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(158)
  binary_mux_s2_w1 u24_b1 (.i0(1'b0),.i1(n76[0]),.i2(n76[0]),.i3(n92[1]),.sel(reset_step),.o(n97[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(158)
  AL_MUX u24_b2 (.i0(1'b1),.i1(n92[1]),.sel(u24_b2_sel_is_3_o),.o(n97[2]));
  and u24_b2_sel_is_3 (u24_b2_sel_is_3_o, reset_step[0], reset_step[1]);
  not u24_b2_sel_is_3_o_inv (u24_b2_sel_is_3_o_neg, u24_b2_sel_is_3_o);
  and u250 (n220, burst_cnt1[1], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u251 (n219, n27, n197);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u252 (n222, n195, n220);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u253 (n221, n196, n222);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u254 (n188[1], n219, n221);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u255 (n284, burst_cnt1[0], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u256 (n283, n166[0], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u257 (n282, burst_cnt1[0], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u258 (n281, burst_cnt1[0], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u259 (n280, n285, n284);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  AL_MUX u25_b0 (.i0(rd_addr[0]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[0]));
  and u25_b0_sel_is_7 (u25_b0_sel_is_7_o, reset_step[0], reset_step[1], sd_cmd_ack);
  AL_MUX u25_b1 (.i0(rd_addr[1]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[1]));
  AL_MUX u25_b10 (.i0(rd_addr[10]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[10]));
  AL_MUX u25_b11 (.i0(rd_addr[11]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[11]));
  AL_MUX u25_b12 (.i0(rd_addr[12]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[12]));
  AL_MUX u25_b13 (.i0(rd_addr[13]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[13]));
  AL_MUX u25_b14 (.i0(rd_addr[14]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[14]));
  AL_MUX u25_b15 (.i0(rd_addr[15]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[15]));
  AL_MUX u25_b16 (.i0(rd_addr[16]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[16]));
  AL_MUX u25_b17 (.i0(rd_addr[17]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[17]));
  AL_MUX u25_b18 (.i0(rd_addr[18]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[18]));
  AL_MUX u25_b19 (.i0(rd_addr[19]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[19]));
  AL_MUX u25_b2 (.i0(rd_addr[2]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[2]));
  AL_MUX u25_b20 (.i0(rd_addr[20]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[20]));
  AL_MUX u25_b3 (.i0(rd_addr[3]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[3]));
  AL_MUX u25_b4 (.i0(rd_addr[4]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[4]));
  AL_MUX u25_b5 (.i0(rd_addr[5]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[5]));
  AL_MUX u25_b6 (.i0(rd_addr[6]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[6]));
  AL_MUX u25_b7 (.i0(rd_addr[7]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[7]));
  AL_MUX u25_b8 (.i0(rd_addr[8]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[8]));
  AL_MUX u25_b9 (.i0(rd_addr[9]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n98[9]));
  or u260 (n279, n282, n281);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u261 (n278, n283, n279);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u262 (n188[0], n280, n278);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u263 (n309, burst_cnt[0], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u264 (n216, burst_cnt[1], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u265 (n201, burst_cnt[2], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u266 (n209, burst_cnt[3], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u267 (n245, burst_cnt[4], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u268 (n253, burst_cnt[5], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u269 (n261, burst_cnt[6], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  AL_MUX u26_b0 (.i0(wr_addr[0]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[0]));
  AL_MUX u26_b1 (.i0(wr_addr[1]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[1]));
  AL_MUX u26_b10 (.i0(wr_addr[10]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[10]));
  AL_MUX u26_b11 (.i0(wr_addr[11]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[11]));
  AL_MUX u26_b12 (.i0(wr_addr[12]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[12]));
  AL_MUX u26_b13 (.i0(wr_addr[13]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[13]));
  AL_MUX u26_b14 (.i0(wr_addr[14]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[14]));
  AL_MUX u26_b15 (.i0(wr_addr[15]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[15]));
  AL_MUX u26_b16 (.i0(wr_addr[16]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[16]));
  AL_MUX u26_b17 (.i0(wr_addr[17]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[17]));
  AL_MUX u26_b18 (.i0(wr_addr[18]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[18]));
  AL_MUX u26_b19 (.i0(wr_addr[19]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[19]));
  AL_MUX u26_b2 (.i0(wr_addr[2]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[2]));
  AL_MUX u26_b20 (.i0(wr_addr[20]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[20]));
  AL_MUX u26_b3 (.i0(wr_addr[3]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[3]));
  AL_MUX u26_b4 (.i0(wr_addr[4]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[4]));
  AL_MUX u26_b5 (.i0(wr_addr[5]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[5]));
  AL_MUX u26_b6 (.i0(wr_addr[6]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[6]));
  AL_MUX u26_b7 (.i0(wr_addr[7]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[7]));
  AL_MUX u26_b8 (.i0(wr_addr[8]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[8]));
  AL_MUX u26_b9 (.i0(wr_addr[9]),.i1(1'b0),.sel(u25_b0_sel_is_7_o),.o(n99[9]));
  and u270 (n269, burst_cnt[7], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u271 (n276, burst_cnt[8], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u272 (n275, burst_cnt[8], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u273 (n274, n131[8], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u274 (n273, burst_cnt[8], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u275 (n272, n277, n276);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u276 (n271, n274, n273);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u277 (n270, n275, n271);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u278 (n187[8], n272, n270);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u279 (n268, burst_cnt[7], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  AL_MUX u27_b0 (.i0(sd_state[0]),.i1(n90[0]),.sel(u25_b0_sel_is_7_o),.o(n100[0]));
  AL_MUX u27_b1 (.i0(sd_state[1]),.i1(n90[1]),.sel(u25_b0_sel_is_7_o),.o(n100[1]));
  AL_MUX u27_b2 (.i0(sd_state[2]),.i1(n90[2]),.sel(u25_b0_sel_is_7_o),.o(n100[2]));
  and u280 (n267, burst_cnt[7], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u281 (n266, n131[7], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u282 (n265, burst_cnt[7], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u283 (n264, n269, n268);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u284 (n263, n266, n265);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u285 (n262, n267, n263);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u286 (n187[7], n264, n262);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u287 (n260, burst_cnt[6], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u288 (n259, burst_cnt[6], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u289 (n258, n131[6], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  AL_MUX u28_b0 (.i0(sd_addr[0]),.i1(1'b1),.sel(u28_b0_sel_is_2_o),.o(n101[0]));
  and u28_b0_sel_is_2 (u28_b0_sel_is_2_o, u24_b2_sel_is_3_o_neg, sd_cmd_ack);
  binary_mux_s2_w1 u28_b1 (.i0(n77[1]),.i1(n83[1]),.i2(n77[1]),.i3(sd_addr[1]),.sel(reset_step),.o(n101[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(158)
  binary_mux_s2_w1 u28_b10 (.i0(n77[10]),.i1(n83[10]),.i2(n77[10]),.i3(sd_addr[10]),.sel(reset_step),.o(n101[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(158)
  binary_mux_s2_w1 u28_b11 (.i0(n77[11]),.i1(n83[11]),.i2(n77[11]),.i3(sd_addr[11]),.sel(reset_step),.o(n101[11]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(158)
  AL_MUX u28_b12 (.i0(sd_addr[12]),.i1(1'b0),.sel(u28_b0_sel_is_2_o),.o(n101[12]));
  AL_MUX u28_b13 (.i0(sd_addr[13]),.i1(1'b0),.sel(u28_b0_sel_is_2_o),.o(n101[13]));
  AL_MUX u28_b14 (.i0(sd_addr[14]),.i1(1'b0),.sel(u28_b0_sel_is_2_o),.o(n101[14]));
  AL_MUX u28_b15 (.i0(sd_addr[15]),.i1(1'b0),.sel(u28_b0_sel_is_2_o),.o(n101[15]));
  AL_MUX u28_b16 (.i0(sd_addr[16]),.i1(1'b0),.sel(u28_b0_sel_is_2_o),.o(n101[16]));
  AL_MUX u28_b17 (.i0(sd_addr[17]),.i1(1'b0),.sel(u28_b0_sel_is_2_o),.o(n101[17]));
  AL_MUX u28_b18 (.i0(sd_addr[18]),.i1(1'b0),.sel(u28_b0_sel_is_2_o),.o(n101[18]));
  AL_MUX u28_b19 (.i0(sd_addr[19]),.i1(1'b0),.sel(u28_b0_sel_is_2_o),.o(n101[19]));
  AL_MUX u28_b2 (.i0(sd_addr[2]),.i1(1'b1),.sel(u28_b0_sel_is_2_o),.o(n101[2]));
  AL_MUX u28_b20 (.i0(sd_addr[20]),.i1(1'b0),.sel(u28_b0_sel_is_2_o),.o(n101[20]));
  binary_mux_s2_w1 u28_b3 (.i0(n83[3]),.i1(n83[3]),.i2(n88[3]),.i3(sd_addr[3]),.sel(reset_step),.o(n101[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(158)
  binary_mux_s2_w1 u28_b4 (.i0(n83[4]),.i1(n83[4]),.i2(n88[4]),.i3(sd_addr[4]),.sel(reset_step),.o(n101[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(158)
  AL_MUX u28_b5 (.i0(sd_addr[5]),.i1(1'b1),.sel(u28_b0_sel_is_2_o),.o(n101[5]));
  AL_MUX u28_b6 (.i0(sd_addr[6]),.i1(1'b0),.sel(u28_b0_sel_is_2_o),.o(n101[6]));
  AL_MUX u28_b7 (.i0(sd_addr[7]),.i1(1'b0),.sel(u28_b0_sel_is_2_o),.o(n101[7]));
  binary_mux_s2_w1 u28_b8 (.i0(n83[8]),.i1(n83[8]),.i2(n88[8]),.i3(sd_addr[8]),.sel(reset_step),.o(n101[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(158)
  AL_MUX u28_b9 (.i0(sd_addr[9]),.i1(1'b0),.sel(u28_b0_sel_is_2_o),.o(n101[9]));
  add_pu2_pu2_o2 u29 (.i0(wr_state),.i1(2'b01),.o(n103));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(169)
  and u290 (n257, burst_cnt[6], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u291 (n256, n261, n260);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u292 (n255, n258, n257);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u293 (n254, n259, n255);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u294 (n187[6], n256, n254);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u295 (n252, burst_cnt[5], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u296 (n251, burst_cnt[5], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u297 (n250, n131[5], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u298 (n249, burst_cnt[5], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u299 (n248, n253, n252);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u3 (n158, n119, n191);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u30 (n138, n169[7], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u300 (n247, n250, n249);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u301 (n246, n251, n247);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u302 (n187[5], n248, n246);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u303 (n244, burst_cnt[4], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u304 (n215, burst_cnt[4], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u305 (n214, n131[4], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u306 (n213, burst_cnt[4], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u307 (n212, n245, n244);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u308 (n211, n214, n213);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u309 (n210, n215, n211);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u310 (n187[4], n212, n210);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u311 (n208, burst_cnt[3], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u312 (n207, burst_cnt[3], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u313 (n206, n131[3], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u314 (n205, burst_cnt[3], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u315 (n204, n209, n208);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u316 (n203, n206, n205);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u317 (n202, n207, n203);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u318 (n187[3], n204, n202);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u319 (n200, burst_cnt[2], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s1_w1 u31_b0 (.i0(sd_cmd[0]),.i1(1'b0),.sel(sd_cmd_ack),.o(n105[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(171)
  binary_mux_s1_w1 u31_b1 (.i0(sd_cmd[1]),.i1(1'b0),.sel(sd_cmd_ack),.o(n105[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(171)
  binary_mux_s1_w1 u31_b2 (.i0(sd_cmd[2]),.i1(1'b0),.sel(sd_cmd_ack),.o(n105[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(171)
  add_pu9_pu9_o9 u32 (.i0(burst_cnt),.i1(9'b000000001),.o(n108));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(179)
  and u320 (n199, burst_cnt[2], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u321 (n198, n131[2], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u322 (n194, burst_cnt[2], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u323 (n193, n201, n200);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u324 (n218, n198, n194);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u325 (n217, n199, n218);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u326 (n187[2], n193, n217);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u327 (n302, burst_cnt[1], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u328 (n303, burst_cnt[1], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u329 (n304, n131[1], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u330 (n305, burst_cnt[1], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u331 (n306, n216, n302);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u332 (n307, n304, n305);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u333 (n308, n303, n307);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u334 (n187[1], n306, n308);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u335 (n310, burst_cnt[0], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u336 (n311, burst_cnt[0], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u337 (n312, n131[0], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u338 (n313, burst_cnt[0], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u339 (n314, n309, n310);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s1_w1 u33_b0 (.i0(n108[0]),.i1(1'b0),.sel(n106),.o(n109[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(180)
  binary_mux_s1_w1 u33_b1 (.i0(n108[1]),.i1(1'b0),.sel(n106),.o(n109[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(180)
  binary_mux_s1_w1 u33_b2 (.i0(n108[2]),.i1(1'b0),.sel(n106),.o(n109[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(180)
  binary_mux_s1_w1 u33_b3 (.i0(n108[3]),.i1(1'b0),.sel(n106),.o(n109[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(180)
  binary_mux_s1_w1 u33_b4 (.i0(n108[4]),.i1(1'b0),.sel(n106),.o(n109[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(180)
  binary_mux_s1_w1 u33_b5 (.i0(n108[5]),.i1(1'b0),.sel(n106),.o(n109[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(180)
  binary_mux_s1_w1 u33_b6 (.i0(n108[6]),.i1(1'b0),.sel(n106),.o(n109[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(180)
  binary_mux_s1_w1 u33_b7 (.i0(n108[7]),.i1(1'b0),.sel(n106),.o(n109[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(180)
  binary_mux_s1_w1 u33_b8 (.i0(n108[8]),.i1(1'b0),.sel(n106),.o(n109[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(180)
  or u340 (n315, n312, n313);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u341 (n316, n311, n315);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u342 (n187[0], n314, n316);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u343 (n373, fifo_q[0], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u344 (n365, fifo_q[1], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u345 (n357, fifo_q[2], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u346 (n349, fifo_q[3], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u347 (n341, fifo_q[4], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u348 (n333, fifo_q[5], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u349 (n325, fifo_q[6], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s1_w1 u34_b0 (.i0(wr_state[0]),.i1(1'b1),.sel(n106),.o(n110[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(180)
  binary_mux_s1_w1 u34_b1 (.i0(wr_state[1]),.i1(1'b1),.sel(n106),.o(n110[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(180)
  and u350 (n318, fifo_q[7], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u351 (n319, fifo_q[7], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u352 (n320, n130[7], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u353 (n321, fifo_q[7], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u354 (n322, n317, n318);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u355 (n323, n320, n321);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u356 (n324, n319, n323);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u357 (n186[7], n322, n324);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u358 (n326, fifo_q[6], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u359 (n327, fifo_q[6], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u360 (n328, n130[6], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u361 (n329, fifo_q[6], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u362 (n330, n325, n326);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u363 (n331, n328, n329);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u364 (n332, n327, n331);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u365 (n186[6], n330, n332);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u366 (n334, fifo_q[5], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u367 (n335, fifo_q[5], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u368 (n336, n130[5], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u369 (n337, fifo_q[5], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s1_w1 u36_b0 (.i0(sd_cmd[0]),.i1(1'b0),.sel(n111),.o(n112[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(183)
  binary_mux_s1_w1 u36_b1 (.i0(sd_cmd[1]),.i1(1'b0),.sel(n111),.o(n112[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(183)
  binary_mux_s1_w1 u36_b2 (.i0(sd_cmd[2]),.i1(1'b1),.sel(n111),.o(n112[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(183)
  add_pu8_pu8_o8 u37 (.i0(fifo_q),.i1(8'b00000001),.o(n114));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(184)
  or u370 (n338, n333, n334);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u371 (n339, n336, n337);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u372 (n340, n335, n339);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u373 (n186[5], n338, n340);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u374 (n342, fifo_q[4], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u375 (n343, fifo_q[4], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u376 (n344, n130[4], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u377 (n345, fifo_q[4], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u378 (n346, n341, n342);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u379 (n347, n344, n345);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u380 (n348, n343, n347);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u381 (n186[4], n346, n348);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u382 (n350, fifo_q[3], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u383 (n351, fifo_q[3], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u384 (n352, n130[3], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u385 (n353, fifo_q[3], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u386 (n354, n349, n350);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u387 (n355, n352, n353);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u388 (n356, n351, n355);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u389 (n186[3], n354, n356);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u39 (n89, datacnt[4], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u390 (n358, fifo_q[2], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u391 (n359, fifo_q[2], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u392 (n360, n130[2], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u393 (n361, fifo_q[2], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u394 (n362, n357, n358);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u395 (n363, n360, n361);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u396 (n364, n359, n363);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u397 (n186[2], n362, n364);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u398 (n366, fifo_q[1], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u399 (n367, fifo_q[1], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u4 (n191, n118, n117);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  add_pu13_pu13_o13 u40 (.i0(wr_addr[20:8]),.i1(13'b0000000000001),.o(n121));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(193)
  and u400 (n368, n130[1], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u401 (n369, fifo_q[1], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u402 (n370, n365, n366);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u403 (n371, n368, n369);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u404 (n372, n367, n371);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u405 (n186[1], n370, n372);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u406 (n374, fifo_q[0], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u407 (n375, fifo_q[0], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u408 (n376, n130[0], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u409 (n377, fifo_q[0], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u410 (n378, n373, n374);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u411 (n379, n376, n377);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u412 (n380, n375, n379);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u413 (n186[0], n378, n380);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u414 (n389, wr_state[0], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u415 (n382, wr_state[1], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u416 (n383, wr_state[1], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u417 (n384, n129[1], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u418 (n385, wr_state[1], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u419 (n386, n381, n382);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s1_w1 u41_b10 (.i0(n121[2]),.i1(1'b0),.sel(n115),.o(n122[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  binary_mux_s1_w1 u41_b11 (.i0(n121[3]),.i1(1'b0),.sel(n115),.o(n122[11]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  binary_mux_s1_w1 u41_b12 (.i0(n121[4]),.i1(1'b0),.sel(n115),.o(n122[12]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  binary_mux_s1_w1 u41_b13 (.i0(n121[5]),.i1(1'b0),.sel(n115),.o(n122[13]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  binary_mux_s1_w1 u41_b14 (.i0(n121[6]),.i1(1'b0),.sel(n115),.o(n122[14]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  binary_mux_s1_w1 u41_b15 (.i0(n121[7]),.i1(1'b0),.sel(n115),.o(n122[15]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  binary_mux_s1_w1 u41_b16 (.i0(n121[8]),.i1(1'b0),.sel(n115),.o(n122[16]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  binary_mux_s1_w1 u41_b17 (.i0(n121[9]),.i1(1'b0),.sel(n115),.o(n122[17]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  binary_mux_s1_w1 u41_b18 (.i0(n121[10]),.i1(1'b0),.sel(n115),.o(n122[18]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  binary_mux_s1_w1 u41_b19 (.i0(n121[11]),.i1(1'b0),.sel(n115),.o(n122[19]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  binary_mux_s1_w1 u41_b20 (.i0(n121[12]),.i1(1'b0),.sel(n115),.o(n122[20]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  binary_mux_s1_w1 u41_b8 (.i0(n121[0]),.i1(1'b0),.sel(n115),.o(n122[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  binary_mux_s1_w1 u41_b9 (.i0(n121[1]),.i1(1'b0),.sel(n115),.o(n122[9]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(194)
  or u420 (n387, n384, n385);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u421 (n388, n383, n387);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u422 (n185[1], n386, n388);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u423 (n390, wr_state[0], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u424 (n391, wr_state[0], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u425 (n392, n129[0], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u426 (n393, wr_state[0], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u427 (n394, n389, n390);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u428 (n395, n392, n393);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u429 (n396, n391, n395);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u430 (n185[0], n394, n396);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u431 (n557, sd_addr[0], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u432 (n549, sd_addr[1], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u433 (n541, sd_addr[2], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u434 (n533, sd_addr[3], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u435 (n525, sd_addr[4], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u436 (n517, sd_addr[5], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u437 (n509, sd_addr[6], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u438 (n501, sd_addr[7], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u439 (n493, sd_addr[8], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u43_b0_sel_is_3 (u43_b0_sel_is_3_o, sd_cmd_ack, n115);
  and u440 (n485, sd_addr[9], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u441 (n477, sd_addr[10], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u442 (n469, sd_addr[11], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u443 (n461, sd_addr[12], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u444 (n453, sd_addr[13], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u445 (n445, sd_addr[14], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u446 (n437, sd_addr[15], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u447 (n429, sd_addr[16], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u448 (n421, sd_addr[17], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u449 (n413, sd_addr[18], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u45 (n139, datacnt[7], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u450 (n405, sd_addr[19], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u451 (n398, sd_addr[20], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u452 (n399, n173[20], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u453 (n400, n133[20], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u454 (n401, n101[20], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u455 (n402, n397, n398);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u456 (n403, n400, n401);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u457 (n404, n399, n403);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u458 (n184[20], n402, n404);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u459 (n406, sd_addr[19], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u460 (n407, n173[19], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u461 (n408, n133[19], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u462 (n409, n101[19], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u463 (n410, n405, n406);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u464 (n411, n408, n409);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u465 (n412, n407, n411);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u466 (n184[19], n410, n412);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u467 (n414, sd_addr[18], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u468 (n415, n173[18], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u469 (n416, n133[18], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  AL_MUX u46_b0 (.i0(wr_addr[0]),.i1(1'b0),.sel(u46_b0_sel_is_7_o),.o(n127[0]));
  and u46_b0_sel_is_7 (u46_b0_sel_is_7_o, wr_state[0], wr_state[1], u43_b0_sel_is_3_o);
  AL_MUX u46_b1 (.i0(wr_addr[1]),.i1(1'b0),.sel(u46_b0_sel_is_7_o),.o(n127[1]));
  AL_MUX u46_b10 (.i0(wr_addr[10]),.i1(n122[10]),.sel(u46_b10_sel_is_7_o),.o(n127[10]));
  and u46_b10_sel_is_7 (u46_b10_sel_is_7_o, wr_state[0], wr_state[1], sd_cmd_ack);
  AL_MUX u46_b11 (.i0(wr_addr[11]),.i1(n122[11]),.sel(u46_b10_sel_is_7_o),.o(n127[11]));
  AL_MUX u46_b12 (.i0(wr_addr[12]),.i1(n122[12]),.sel(u46_b10_sel_is_7_o),.o(n127[12]));
  AL_MUX u46_b13 (.i0(wr_addr[13]),.i1(n122[13]),.sel(u46_b10_sel_is_7_o),.o(n127[13]));
  AL_MUX u46_b14 (.i0(wr_addr[14]),.i1(n122[14]),.sel(u46_b10_sel_is_7_o),.o(n127[14]));
  AL_MUX u46_b15 (.i0(wr_addr[15]),.i1(n122[15]),.sel(u46_b10_sel_is_7_o),.o(n127[15]));
  AL_MUX u46_b16 (.i0(wr_addr[16]),.i1(n122[16]),.sel(u46_b10_sel_is_7_o),.o(n127[16]));
  AL_MUX u46_b17 (.i0(wr_addr[17]),.i1(n122[17]),.sel(u46_b10_sel_is_7_o),.o(n127[17]));
  AL_MUX u46_b18 (.i0(wr_addr[18]),.i1(n122[18]),.sel(u46_b10_sel_is_7_o),.o(n127[18]));
  AL_MUX u46_b19 (.i0(wr_addr[19]),.i1(n122[19]),.sel(u46_b10_sel_is_7_o),.o(n127[19]));
  AL_MUX u46_b2 (.i0(wr_addr[2]),.i1(1'b0),.sel(u46_b0_sel_is_7_o),.o(n127[2]));
  AL_MUX u46_b20 (.i0(wr_addr[20]),.i1(n122[20]),.sel(u46_b10_sel_is_7_o),.o(n127[20]));
  AL_MUX u46_b3 (.i0(wr_addr[3]),.i1(1'b0),.sel(u46_b0_sel_is_7_o),.o(n127[3]));
  AL_MUX u46_b4 (.i0(wr_addr[4]),.i1(1'b0),.sel(u46_b0_sel_is_7_o),.o(n127[4]));
  AL_MUX u46_b5 (.i0(wr_addr[5]),.i1(1'b0),.sel(u46_b0_sel_is_7_o),.o(n127[5]));
  AL_MUX u46_b6 (.i0(wr_addr[6]),.i1(1'b0),.sel(u46_b0_sel_is_7_o),.o(n127[6]));
  AL_MUX u46_b7 (.i0(wr_addr[7]),.i1(1'b0),.sel(u46_b0_sel_is_7_o),.o(n127[7]));
  AL_MUX u46_b8 (.i0(wr_addr[8]),.i1(n122[8]),.sel(u46_b10_sel_is_7_o),.o(n127[8]));
  AL_MUX u46_b9 (.i0(wr_addr[9]),.i1(n122[9]),.sel(u46_b10_sel_is_7_o),.o(n127[9]));
  and u470 (n417, n101[18], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u471 (n418, n413, n414);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u472 (n419, n416, n417);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u473 (n420, n415, n419);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u474 (n184[18], n418, n420);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u475 (n422, sd_addr[17], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u476 (n423, n173[17], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u477 (n424, n133[17], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u478 (n425, n101[17], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u479 (n426, n421, n422);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  AL_MUX u47_b0 (.i0(sd_state[0]),.i1(n90[0]),.sel(u46_b0_sel_is_7_o),.o(n128[0]));
  AL_MUX u47_b1 (.i0(sd_state[1]),.i1(n90[1]),.sel(u46_b0_sel_is_7_o),.o(n128[1]));
  AL_MUX u47_b2 (.i0(sd_state[2]),.i1(n90[2]),.sel(u46_b0_sel_is_7_o),.o(n128[2]));
  or u480 (n427, n424, n425);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u481 (n428, n423, n427);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u482 (n184[17], n426, n428);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u483 (n430, sd_addr[16], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u484 (n431, n173[16], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u485 (n432, n133[16], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u486 (n433, n101[16], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u487 (n434, n429, n430);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u488 (n435, n432, n433);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u489 (n436, n431, n435);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s2_w1 u48_b0 (.i0(1'b1),.i1(n104[0]),.i2(n110[0]),.i3(n126[0]),.sel(wr_state),.o(n129[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  binary_mux_s2_w1 u48_b1 (.i0(1'b0),.i1(n104[1]),.i2(n110[1]),.i3(n126[1]),.sel(wr_state),.o(n129[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  or u490 (n184[16], n434, n436);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u491 (n438, sd_addr[15], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u492 (n439, n173[15], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u493 (n440, n133[15], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u494 (n441, n101[15], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u495 (n442, n437, n438);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u496 (n443, n440, n441);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u497 (n444, n439, n443);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u498 (n184[15], n442, n444);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u499 (n446, sd_addr[14], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s2_w1 u49_b0 (.i0(fifo_q[0]),.i1(fifo_q[0]),.i2(n114[0]),.i3(1'b0),.sel(wr_state),.o(n130[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  binary_mux_s2_w1 u49_b1 (.i0(fifo_q[1]),.i1(fifo_q[1]),.i2(n114[1]),.i3(1'b0),.sel(wr_state),.o(n130[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  binary_mux_s2_w1 u49_b2 (.i0(fifo_q[2]),.i1(fifo_q[2]),.i2(n114[2]),.i3(1'b0),.sel(wr_state),.o(n130[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  binary_mux_s2_w1 u49_b3 (.i0(fifo_q[3]),.i1(fifo_q[3]),.i2(n114[3]),.i3(1'b0),.sel(wr_state),.o(n130[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  binary_mux_s2_w1 u49_b4 (.i0(fifo_q[4]),.i1(fifo_q[4]),.i2(n114[4]),.i3(1'b0),.sel(wr_state),.o(n130[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  binary_mux_s2_w1 u49_b5 (.i0(fifo_q[5]),.i1(fifo_q[5]),.i2(n114[5]),.i3(1'b0),.sel(wr_state),.o(n130[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  binary_mux_s2_w1 u49_b6 (.i0(fifo_q[6]),.i1(fifo_q[6]),.i2(n114[6]),.i3(1'b0),.sel(wr_state),.o(n130[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  binary_mux_s2_w1 u49_b7 (.i0(fifo_q[7]),.i1(fifo_q[7]),.i2(n114[7]),.i3(1'b0),.sel(wr_state),.o(n130[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  not u5 (n74, rst_n_pad);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(97)
  and u500 (n447, n173[14], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u501 (n448, n133[14], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u502 (n449, n101[14], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u503 (n450, n445, n446);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u504 (n451, n448, n449);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u505 (n452, n447, n451);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u506 (n184[14], n450, n452);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u507 (n454, sd_addr[13], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u508 (n455, n173[13], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u509 (n456, n133[13], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  AL_MUX u50_b0 (.i0(burst_cnt[0]),.i1(n109[0]),.sel(u50_b0_sel_is_2_o),.o(n131[0]));
  and u50_b0_sel_is_2 (u50_b0_sel_is_2_o, wr_state$0$_neg, wr_state[1]);
  AL_MUX u50_b1 (.i0(burst_cnt[1]),.i1(n109[1]),.sel(u50_b0_sel_is_2_o),.o(n131[1]));
  AL_MUX u50_b2 (.i0(burst_cnt[2]),.i1(n109[2]),.sel(u50_b0_sel_is_2_o),.o(n131[2]));
  AL_MUX u50_b3 (.i0(burst_cnt[3]),.i1(n109[3]),.sel(u50_b0_sel_is_2_o),.o(n131[3]));
  AL_MUX u50_b4 (.i0(burst_cnt[4]),.i1(n109[4]),.sel(u50_b0_sel_is_2_o),.o(n131[4]));
  AL_MUX u50_b5 (.i0(burst_cnt[5]),.i1(n109[5]),.sel(u50_b0_sel_is_2_o),.o(n131[5]));
  AL_MUX u50_b6 (.i0(burst_cnt[6]),.i1(n109[6]),.sel(u50_b0_sel_is_2_o),.o(n131[6]));
  AL_MUX u50_b7 (.i0(burst_cnt[7]),.i1(n109[7]),.sel(u50_b0_sel_is_2_o),.o(n131[7]));
  AL_MUX u50_b8 (.i0(burst_cnt[8]),.i1(n109[8]),.sel(u50_b0_sel_is_2_o),.o(n131[8]));
  and u510 (n457, n101[13], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u511 (n458, n453, n454);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u512 (n459, n456, n457);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u513 (n460, n455, n459);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u514 (n184[13], n458, n460);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u515 (n462, sd_addr[12], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u516 (n463, n173[12], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u517 (n464, n133[12], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u518 (n465, n101[12], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u519 (n466, n461, n462);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s2_w1 u51_b0 (.i0(1'b0),.i1(n105[0]),.i2(n112[0]),.i3(sd_cmd[0]),.sel(wr_state),.o(n132[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  binary_mux_s2_w1 u51_b1 (.i0(1'b1),.i1(n105[1]),.i2(n112[1]),.i3(sd_cmd[1]),.sel(wr_state),.o(n132[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  binary_mux_s2_w1 u51_b2 (.i0(1'b0),.i1(n105[2]),.i2(n112[2]),.i3(sd_cmd[2]),.sel(wr_state),.o(n132[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(199)
  or u520 (n467, n464, n465);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u521 (n468, n463, n467);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u522 (n184[12], n466, n468);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u523 (n470, sd_addr[11], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u524 (n471, n173[11], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u525 (n472, n133[11], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u526 (n473, n101[11], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u527 (n474, n469, n470);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u528 (n475, n472, n473);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u529 (n476, n471, n475);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  AL_MUX u52_b0 (.i0(sd_addr[0]),.i1(wr_addr[0]),.sel(u52_b0_sel_is_0_o),.o(n133[0]));
  and u52_b0_sel_is_0 (u52_b0_sel_is_0_o, wr_state$0$_neg, wr_state$1$_neg);
  AL_MUX u52_b1 (.i0(sd_addr[1]),.i1(wr_addr[1]),.sel(u52_b0_sel_is_0_o),.o(n133[1]));
  AL_MUX u52_b10 (.i0(sd_addr[10]),.i1(wr_addr[10]),.sel(u52_b0_sel_is_0_o),.o(n133[10]));
  AL_MUX u52_b11 (.i0(sd_addr[11]),.i1(wr_addr[11]),.sel(u52_b0_sel_is_0_o),.o(n133[11]));
  AL_MUX u52_b12 (.i0(sd_addr[12]),.i1(wr_addr[12]),.sel(u52_b0_sel_is_0_o),.o(n133[12]));
  AL_MUX u52_b13 (.i0(sd_addr[13]),.i1(wr_addr[13]),.sel(u52_b0_sel_is_0_o),.o(n133[13]));
  AL_MUX u52_b14 (.i0(sd_addr[14]),.i1(wr_addr[14]),.sel(u52_b0_sel_is_0_o),.o(n133[14]));
  AL_MUX u52_b15 (.i0(sd_addr[15]),.i1(wr_addr[15]),.sel(u52_b0_sel_is_0_o),.o(n133[15]));
  AL_MUX u52_b16 (.i0(sd_addr[16]),.i1(wr_addr[16]),.sel(u52_b0_sel_is_0_o),.o(n133[16]));
  AL_MUX u52_b17 (.i0(sd_addr[17]),.i1(wr_addr[17]),.sel(u52_b0_sel_is_0_o),.o(n133[17]));
  AL_MUX u52_b18 (.i0(sd_addr[18]),.i1(wr_addr[18]),.sel(u52_b0_sel_is_0_o),.o(n133[18]));
  AL_MUX u52_b19 (.i0(sd_addr[19]),.i1(wr_addr[19]),.sel(u52_b0_sel_is_0_o),.o(n133[19]));
  AL_MUX u52_b2 (.i0(sd_addr[2]),.i1(wr_addr[2]),.sel(u52_b0_sel_is_0_o),.o(n133[2]));
  AL_MUX u52_b20 (.i0(sd_addr[20]),.i1(wr_addr[20]),.sel(u52_b0_sel_is_0_o),.o(n133[20]));
  AL_MUX u52_b3 (.i0(sd_addr[3]),.i1(wr_addr[3]),.sel(u52_b0_sel_is_0_o),.o(n133[3]));
  AL_MUX u52_b4 (.i0(sd_addr[4]),.i1(wr_addr[4]),.sel(u52_b0_sel_is_0_o),.o(n133[4]));
  AL_MUX u52_b5 (.i0(sd_addr[5]),.i1(wr_addr[5]),.sel(u52_b0_sel_is_0_o),.o(n133[5]));
  AL_MUX u52_b6 (.i0(sd_addr[6]),.i1(wr_addr[6]),.sel(u52_b0_sel_is_0_o),.o(n133[6]));
  AL_MUX u52_b7 (.i0(sd_addr[7]),.i1(wr_addr[7]),.sel(u52_b0_sel_is_0_o),.o(n133[7]));
  AL_MUX u52_b8 (.i0(sd_addr[8]),.i1(wr_addr[8]),.sel(u52_b0_sel_is_0_o),.o(n133[8]));
  AL_MUX u52_b9 (.i0(sd_addr[9]),.i1(wr_addr[9]),.sel(u52_b0_sel_is_0_o),.o(n133[9]));
  add_pu2_pu2_o2 u53 (.i0(rd_state),.i1(2'b01),.o(n135));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(211)
  or u530 (n184[11], n474, n476);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u531 (n478, sd_addr[10], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u532 (n479, n173[10], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u533 (n480, n133[10], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u534 (n481, n101[10], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u535 (n482, n477, n478);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u536 (n483, n480, n481);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u537 (n484, n479, n483);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u538 (n184[10], n482, n484);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u539 (n486, sd_addr[9], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u540 (n487, n173[9], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u541 (n488, n133[9], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u542 (n489, n101[9], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u543 (n490, n485, n486);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u544 (n491, n488, n489);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u545 (n492, n487, n491);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u546 (n184[9], n490, n492);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u547 (n494, sd_addr[8], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u548 (n495, n173[8], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u549 (n496, n133[8], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s1_w1 u54_b0 (.i0(rd_state[0]),.i1(n135[0]),.sel(sd_cmd_ack),.o(n136[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(213)
  binary_mux_s1_w1 u54_b1 (.i0(rd_state[1]),.i1(n135[1]),.sel(sd_cmd_ack),.o(n136[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(213)
  and u55 (n300, datacnt[0], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u550 (n497, n101[8], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u551 (n498, n493, n494);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u552 (n499, n496, n497);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u553 (n500, n495, n499);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u554 (n184[8], n498, n500);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u555 (n502, sd_addr[7], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u556 (n503, n173[7], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u557 (n504, n133[7], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u558 (n505, n101[7], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u559 (n506, n501, n502);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u56 (n144, datacnt[5], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u560 (n507, n504, n505);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u561 (n508, n503, n507);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u562 (n184[7], n506, n508);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u563 (n510, sd_addr[6], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u564 (n511, n173[6], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u565 (n512, n133[6], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u566 (n513, n101[6], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u567 (n514, n509, n510);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u568 (n515, n512, n513);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u569 (n516, n511, n515);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  add_pu9_pu9_o9 u57 (.i0(burst_cnt1),.i1(9'b000000001),.o(n142));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(217)
  or u570 (n184[6], n514, n516);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u571 (n518, sd_addr[5], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u572 (n519, n173[5], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u573 (n520, n133[5], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u574 (n521, n101[5], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u575 (n522, n517, n518);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u576 (n523, n520, n521);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u577 (n524, n519, n523);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u578 (n184[5], n522, n524);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u579 (n526, sd_addr[4], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  add_pu13_pu13_o13 u58 (.i0(rd_addr[20:8]),.i1(13'b0000000000001),.o(n145));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(227)
  and u580 (n527, n173[4], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u581 (n528, n133[4], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u582 (n529, n101[4], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u583 (n530, n525, n526);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u584 (n531, n528, n529);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u585 (n532, n527, n531);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u586 (n184[4], n530, n532);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u587 (n534, sd_addr[3], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u588 (n535, n173[3], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u589 (n536, n133[3], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u590 (n537, n101[3], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u591 (n538, n533, n534);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u592 (n539, n536, n537);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u593 (n540, n535, n539);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u594 (n184[3], n538, n540);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u595 (n542, sd_addr[2], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u596 (n543, n173[2], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u597 (n544, n133[2], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u598 (n545, n101[2], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u599 (n546, n541, n542);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s1_w1 u59_b10 (.i0(n145[2]),.i1(1'b0),.sel(n143),.o(n146[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  binary_mux_s1_w1 u59_b11 (.i0(n145[3]),.i1(1'b0),.sel(n143),.o(n146[11]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  binary_mux_s1_w1 u59_b12 (.i0(n145[4]),.i1(1'b0),.sel(n143),.o(n146[12]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  binary_mux_s1_w1 u59_b13 (.i0(n145[5]),.i1(1'b0),.sel(n143),.o(n146[13]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  binary_mux_s1_w1 u59_b14 (.i0(n145[6]),.i1(1'b0),.sel(n143),.o(n146[14]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  binary_mux_s1_w1 u59_b15 (.i0(n145[7]),.i1(1'b0),.sel(n143),.o(n146[15]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  binary_mux_s1_w1 u59_b16 (.i0(n145[8]),.i1(1'b0),.sel(n143),.o(n146[16]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  binary_mux_s1_w1 u59_b17 (.i0(n145[9]),.i1(1'b0),.sel(n143),.o(n146[17]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  binary_mux_s1_w1 u59_b18 (.i0(n145[10]),.i1(1'b0),.sel(n143),.o(n146[18]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  binary_mux_s1_w1 u59_b19 (.i0(n145[11]),.i1(1'b0),.sel(n143),.o(n146[19]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  binary_mux_s1_w1 u59_b20 (.i0(n145[12]),.i1(1'b0),.sel(n143),.o(n146[20]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  binary_mux_s1_w1 u59_b8 (.i0(n145[0]),.i1(1'b0),.sel(n143),.o(n146[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  binary_mux_s1_w1 u59_b9 (.i0(n145[1]),.i1(1'b0),.sel(n143),.o(n146[9]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(228)
  or u6 (n162, n79, n157);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u600 (n547, n544, n545);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u601 (n548, n543, n547);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u602 (n184[2], n546, n548);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u603 (n550, sd_addr[1], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u604 (n551, n173[1], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u605 (n552, n133[1], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u606 (n553, n101[1], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u607 (n554, n549, n550);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u608 (n555, n552, n553);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u609 (n556, n551, n555);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u610 (n184[1], n554, n556);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u611 (n558, sd_addr[0], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u612 (n559, n173[0], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u613 (n560, n133[0], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u614 (n561, n101[0], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u615 (n562, n557, n558);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u616 (n563, n560, n561);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u617 (n564, n559, n563);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u618 (n184[0], n562, n564);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u619 (n581, sd_state[0], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s1_w1 u61_b0 (.i0(1'b0),.i1(n142[0]),.sel(n140),.o(n148[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(229)
  binary_mux_s1_w1 u61_b1 (.i0(1'b0),.i1(n142[1]),.sel(n140),.o(n148[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(229)
  binary_mux_s1_w1 u61_b2 (.i0(1'b0),.i1(n142[2]),.sel(n140),.o(n148[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(229)
  binary_mux_s1_w1 u61_b3 (.i0(1'b0),.i1(n142[3]),.sel(n140),.o(n148[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(229)
  binary_mux_s1_w1 u61_b4 (.i0(1'b0),.i1(n142[4]),.sel(n140),.o(n148[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(229)
  binary_mux_s1_w1 u61_b5 (.i0(1'b0),.i1(n142[5]),.sel(n140),.o(n148[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(229)
  binary_mux_s1_w1 u61_b6 (.i0(1'b0),.i1(n142[6]),.sel(n140),.o(n148[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(229)
  binary_mux_s1_w1 u61_b7 (.i0(1'b0),.i1(n142[7]),.sel(n140),.o(n148[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(229)
  binary_mux_s1_w1 u61_b8 (.i0(1'b0),.i1(n142[8]),.sel(n140),.o(n148[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(229)
  and u620 (n573, sd_state[1], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u621 (n566, sd_state[2], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u622 (n567, n171[2], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u623 (n568, n128[2], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u624 (n569, n100[2], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u625 (n570, n565, n566);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u626 (n571, n568, n569);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u627 (n572, n567, n571);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u628 (n183[2], n570, n572);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u629 (n574, sd_state[1], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s1_w1 u62_b0 (.i0(1'b1),.i1(rd_state[0]),.sel(n140),.o(n149[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(229)
  binary_mux_s1_w1 u62_b1 (.i0(1'b1),.i1(rd_state[1]),.sel(n140),.o(n149[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(229)
  and u630 (n575, n171[1], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u631 (n576, n128[1], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u632 (n577, n100[1], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u633 (n578, n573, n574);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u634 (n579, n576, n577);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u635 (n580, n575, n579);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u636 (n183[1], n578, n580);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u637 (n582, sd_state[0], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u638 (n583, n171[0], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u639 (n584, n128[0], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u63_b0_sel_is_2 (u63_b0_sel_is_2_o, n140_neg, n143);
  and u640 (n585, n100[0], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u641 (n586, n581, n582);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u642 (n587, n584, n585);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u643 (n588, n583, n587);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u644 (n183[0], n586, n588);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u645 (n749, wr_addr[0], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u646 (n741, wr_addr[1], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u647 (n733, wr_addr[2], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u648 (n725, wr_addr[3], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u649 (n717, wr_addr[4], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u65 (n7, datacnt[1], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u650 (n709, wr_addr[5], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u651 (n701, wr_addr[6], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u652 (n693, wr_addr[7], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u653 (n685, wr_addr[8], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u654 (n677, wr_addr[9], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u655 (n669, wr_addr[10], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u656 (n661, wr_addr[11], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u657 (n653, wr_addr[12], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u658 (n645, wr_addr[13], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u659 (n637, wr_addr[14], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u660 (n629, wr_addr[15], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u661 (n621, wr_addr[16], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u662 (n613, wr_addr[17], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u663 (n605, wr_addr[18], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u664 (n597, wr_addr[19], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u665 (n590, wr_addr[20], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u666 (n591, wr_addr[20], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u667 (n592, n127[20], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u668 (n593, n99[20], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u669 (n594, n589, n590);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s1_w1 u66_b0 (.i0(n105[0]),.i1(1'b0),.sel(n152),.o(n156[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(235)
  binary_mux_s1_w1 u66_b1 (.i0(n105[1]),.i1(1'b0),.sel(n152),.o(n156[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(235)
  binary_mux_s1_w1 u66_b2 (.i0(n105[2]),.i1(1'b1),.sel(n152),.o(n156[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(235)
  and u67 (n23, datacnt[3], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u670 (n595, n592, n593);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u671 (n596, n591, n595);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u672 (n182[20], n594, n596);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u673 (n598, wr_addr[19], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u674 (n599, wr_addr[19], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u675 (n600, n127[19], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u676 (n601, n99[19], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u677 (n602, n597, n598);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u678 (n603, n600, n601);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u679 (n604, n599, n603);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  add_pu8_pu8_o8 u68 (.i0(datacnt),.i1(8'b00000001),.o(n159));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(237)
  or u680 (n182[19], n602, n604);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u681 (n606, wr_addr[18], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u682 (n607, wr_addr[18], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u683 (n608, n127[18], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u684 (n609, n99[18], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u685 (n610, n605, n606);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u686 (n611, n608, n609);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u687 (n612, n607, n611);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u688 (n182[18], n610, n612);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u689 (n614, wr_addr[17], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u690 (n615, wr_addr[17], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u691 (n616, n127[17], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u692 (n617, n99[17], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u693 (n618, n613, n614);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u694 (n619, n616, n617);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u695 (n620, n615, n619);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u696 (n182[17], n618, n620);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u697 (n622, wr_addr[16], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u698 (n623, wr_addr[16], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u699 (n624, n127[16], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s1_w1 u69_b0 (.i0(datacnt[0]),.i1(n159[0]),.sel(n161),.o(n160[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(238)
  binary_mux_s1_w1 u69_b1 (.i0(datacnt[1]),.i1(n159[1]),.sel(n161),.o(n160[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(238)
  binary_mux_s1_w1 u69_b2 (.i0(datacnt[2]),.i1(n159[2]),.sel(n161),.o(n160[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(238)
  binary_mux_s1_w1 u69_b3 (.i0(datacnt[3]),.i1(n159[3]),.sel(n161),.o(n160[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(238)
  binary_mux_s1_w1 u69_b4 (.i0(datacnt[4]),.i1(n159[4]),.sel(n161),.o(n160[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(238)
  binary_mux_s1_w1 u69_b5 (.i0(datacnt[5]),.i1(n159[5]),.sel(n161),.o(n160[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(238)
  binary_mux_s1_w1 u69_b6 (.i0(datacnt[6]),.i1(n159[6]),.sel(n161),.o(n160[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(238)
  binary_mux_s1_w1 u69_b7 (.i0(datacnt[7]),.i1(n159[7]),.sel(n161),.o(n160[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(238)
  and u7 (n117, datacnt[6], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  lt_u9_u9 u70 (.ci(1'b0),.i0(9'b000000100),.i1(burst_cnt1),.o(n161));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(239)
  and u700 (n625, n99[16], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u701 (n626, n621, n622);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u702 (n627, n624, n625);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u703 (n628, n623, n627);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u704 (n182[16], n626, n628);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u705 (n630, wr_addr[15], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u706 (n631, wr_addr[15], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u707 (n632, n127[15], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u708 (n633, n99[15], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u709 (n634, n629, n630);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  lt_u9_u9 u71 (.ci(1'b0),.i0(burst_cnt1),.i1(9'b100000100),.o(n140));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(239)
  or u710 (n635, n632, n633);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u711 (n636, n631, n635);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u712 (n182[15], n634, n636);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u713 (n638, wr_addr[14], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u714 (n639, wr_addr[14], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u715 (n640, n127[14], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u716 (n641, n99[14], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u717 (n642, n637, n638);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u718 (n643, n640, n641);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u719 (n644, n639, n643);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u72 (n163, n161, n140);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(239)
  or u720 (n182[14], n642, n644);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u721 (n646, wr_addr[13], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u722 (n647, wr_addr[13], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u723 (n648, n127[13], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u724 (n649, n99[13], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u725 (n650, n645, n646);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u726 (n651, n648, n649);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u727 (n652, n647, n651);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u728 (n182[13], n650, n652);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u729 (n654, wr_addr[12], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u730 (n655, wr_addr[12], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u731 (n656, n127[12], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u732 (n657, n99[12], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u733 (n658, n653, n654);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u734 (n659, n656, n657);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u735 (n660, n655, n659);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u736 (n182[12], n658, n660);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u737 (n662, wr_addr[11], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u738 (n663, wr_addr[11], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u739 (n664, n127[11], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u740 (n665, n99[11], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u741 (n666, n661, n662);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u742 (n667, n664, n665);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u743 (n668, n663, n667);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u744 (n182[11], n666, n668);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u745 (n670, wr_addr[10], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u746 (n671, wr_addr[10], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u747 (n672, n127[10], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u748 (n673, n99[10], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u749 (n674, n669, n670);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u750 (n675, n672, n673);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u751 (n676, n671, n675);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u752 (n182[10], n674, n676);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u753 (n678, wr_addr[9], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u754 (n679, wr_addr[9], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u755 (n680, n127[9], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u756 (n681, n99[9], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u757 (n682, n677, n678);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u758 (n683, n680, n681);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u759 (n684, n679, n683);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u75_sel_is_3 (u75_sel_is_3_o, n163, n994);
  or u760 (n182[9], n682, n684);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u761 (n686, wr_addr[8], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u762 (n687, wr_addr[8], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u763 (n688, n127[8], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u764 (n689, n99[8], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u765 (n690, n685, n686);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u766 (n691, n688, n689);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u767 (n692, n687, n691);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u768 (n182[8], n690, n692);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u769 (n694, wr_addr[7], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s2_w1 u76_b0 (.i0(burst_cnt1[0]),.i1(burst_cnt1[0]),.i2(n148[0]),.i3(1'b0),.sel(rd_state),.o(n166[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u76_b1 (.i0(burst_cnt1[1]),.i1(burst_cnt1[1]),.i2(n148[1]),.i3(1'b0),.sel(rd_state),.o(n166[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u76_b2 (.i0(burst_cnt1[2]),.i1(burst_cnt1[2]),.i2(n148[2]),.i3(1'b0),.sel(rd_state),.o(n166[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u76_b3 (.i0(burst_cnt1[3]),.i1(burst_cnt1[3]),.i2(n148[3]),.i3(1'b0),.sel(rd_state),.o(n166[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u76_b4 (.i0(burst_cnt1[4]),.i1(burst_cnt1[4]),.i2(n148[4]),.i3(1'b0),.sel(rd_state),.o(n166[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u76_b5 (.i0(burst_cnt1[5]),.i1(burst_cnt1[5]),.i2(n148[5]),.i3(1'b0),.sel(rd_state),.o(n166[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u76_b6 (.i0(burst_cnt1[6]),.i1(burst_cnt1[6]),.i2(n148[6]),.i3(1'b0),.sel(rd_state),.o(n166[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u76_b7 (.i0(burst_cnt1[7]),.i1(burst_cnt1[7]),.i2(n148[7]),.i3(1'b0),.sel(rd_state),.o(n166[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u76_b8 (.i0(burst_cnt1[8]),.i1(burst_cnt1[8]),.i2(n148[8]),.i3(1'b0),.sel(rd_state),.o(n166[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  and u770 (n695, wr_addr[7], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u771 (n696, n127[7], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u772 (n697, n99[7], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u773 (n698, n693, n694);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u774 (n699, n696, n697);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u775 (n700, n695, n699);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u776 (n182[7], n698, n700);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u777 (n702, wr_addr[6], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u778 (n703, wr_addr[6], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u779 (n704, n127[6], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s2_w1 u77_b0 (.i0(1'b1),.i1(n136[0]),.i2(n149[0]),.i3(1'b0),.sel(rd_state),.o(n167[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u77_b1 (.i0(1'b0),.i1(n136[1]),.i2(n149[1]),.i3(1'b0),.sel(rd_state),.o(n167[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  and u780 (n705, n99[6], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u781 (n706, n701, n702);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u782 (n707, n704, n705);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u783 (n708, n703, n707);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u784 (n182[6], n706, n708);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u785 (n710, wr_addr[5], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u786 (n711, wr_addr[5], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u787 (n712, n127[5], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u788 (n713, n99[5], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u789 (n714, n709, n710);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s2_w1 u78_b0 (.i0(1'b1),.i1(n105[0]),.i2(n156[0]),.i3(1'b0),.sel(rd_state),.o(n168[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u78_b1 (.i0(1'b0),.i1(n105[1]),.i2(n156[1]),.i3(1'b0),.sel(rd_state),.o(n168[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u78_b2 (.i0(1'b0),.i1(n105[2]),.i2(n156[2]),.i3(1'b0),.sel(rd_state),.o(n168[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  or u790 (n715, n712, n713);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u791 (n716, n711, n715);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u792 (n182[5], n714, n716);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u793 (n718, wr_addr[4], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u794 (n719, wr_addr[4], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u795 (n720, n127[4], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u796 (n721, n99[4], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u797 (n722, n717, n718);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u798 (n723, n720, n721);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u799 (n724, n719, n723);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  binary_mux_s2_w1 u79_b0 (.i0(datacnt[0]),.i1(datacnt[0]),.i2(n160[0]),.i3(1'b0),.sel(rd_state),.o(n169[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u79_b1 (.i0(datacnt[1]),.i1(datacnt[1]),.i2(n160[1]),.i3(1'b0),.sel(rd_state),.o(n169[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u79_b2 (.i0(datacnt[2]),.i1(datacnt[2]),.i2(n160[2]),.i3(1'b0),.sel(rd_state),.o(n169[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u79_b3 (.i0(datacnt[3]),.i1(datacnt[3]),.i2(n160[3]),.i3(1'b0),.sel(rd_state),.o(n169[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u79_b4 (.i0(datacnt[4]),.i1(datacnt[4]),.i2(n160[4]),.i3(1'b0),.sel(rd_state),.o(n169[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u79_b5 (.i0(datacnt[5]),.i1(datacnt[5]),.i2(n160[5]),.i3(1'b0),.sel(rd_state),.o(n169[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u79_b6 (.i0(datacnt[6]),.i1(datacnt[6]),.i2(n160[6]),.i3(1'b0),.sel(rd_state),.o(n169[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  binary_mux_s2_w1 u79_b7 (.i0(datacnt[7]),.i1(datacnt[7]),.i2(n160[7]),.i3(1'b0),.sel(rd_state),.o(n169[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(252)
  and u8 (n118, datacnt[6], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u800 (n182[4], n722, n724);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u801 (n726, wr_addr[3], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u802 (n727, wr_addr[3], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u803 (n728, n127[3], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u804 (n729, n99[3], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u805 (n730, n725, n726);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u806 (n731, n728, n729);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u807 (n732, n727, n731);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u808 (n182[3], n730, n732);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u809 (n734, wr_addr[2], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  AL_MUX u80_b0 (.i0(rd_addr[0]),.i1(1'b0),.sel(u80_b0_sel_is_6_o),.o(n170[0]));
  and u80_b0_sel_is_6 (u80_b0_sel_is_6_o, rd_state$0$_neg, rd_state[1], u63_b0_sel_is_2_o);
  AL_MUX u80_b1 (.i0(rd_addr[1]),.i1(1'b0),.sel(u80_b0_sel_is_6_o),.o(n170[1]));
  AL_MUX u80_b10 (.i0(rd_addr[10]),.i1(n146[10]),.sel(u80_b10_sel_is_2_o),.o(n170[10]));
  and u80_b10_sel_is_2 (u80_b10_sel_is_2_o, rd_state$0$_neg, rd_state[1], n140_neg);
  AL_MUX u80_b11 (.i0(rd_addr[11]),.i1(n146[11]),.sel(u80_b10_sel_is_2_o),.o(n170[11]));
  AL_MUX u80_b12 (.i0(rd_addr[12]),.i1(n146[12]),.sel(u80_b10_sel_is_2_o),.o(n170[12]));
  AL_MUX u80_b13 (.i0(rd_addr[13]),.i1(n146[13]),.sel(u80_b10_sel_is_2_o),.o(n170[13]));
  AL_MUX u80_b14 (.i0(rd_addr[14]),.i1(n146[14]),.sel(u80_b10_sel_is_2_o),.o(n170[14]));
  AL_MUX u80_b15 (.i0(rd_addr[15]),.i1(n146[15]),.sel(u80_b10_sel_is_2_o),.o(n170[15]));
  AL_MUX u80_b16 (.i0(rd_addr[16]),.i1(n146[16]),.sel(u80_b10_sel_is_2_o),.o(n170[16]));
  AL_MUX u80_b17 (.i0(rd_addr[17]),.i1(n146[17]),.sel(u80_b10_sel_is_2_o),.o(n170[17]));
  AL_MUX u80_b18 (.i0(rd_addr[18]),.i1(n146[18]),.sel(u80_b10_sel_is_2_o),.o(n170[18]));
  AL_MUX u80_b19 (.i0(rd_addr[19]),.i1(n146[19]),.sel(u80_b10_sel_is_2_o),.o(n170[19]));
  AL_MUX u80_b2 (.i0(rd_addr[2]),.i1(1'b0),.sel(u80_b0_sel_is_6_o),.o(n170[2]));
  AL_MUX u80_b20 (.i0(rd_addr[20]),.i1(n146[20]),.sel(u80_b10_sel_is_2_o),.o(n170[20]));
  AL_MUX u80_b3 (.i0(rd_addr[3]),.i1(1'b0),.sel(u80_b0_sel_is_6_o),.o(n170[3]));
  AL_MUX u80_b4 (.i0(rd_addr[4]),.i1(1'b0),.sel(u80_b0_sel_is_6_o),.o(n170[4]));
  AL_MUX u80_b5 (.i0(rd_addr[5]),.i1(1'b0),.sel(u80_b0_sel_is_6_o),.o(n170[5]));
  AL_MUX u80_b6 (.i0(rd_addr[6]),.i1(1'b0),.sel(u80_b0_sel_is_6_o),.o(n170[6]));
  AL_MUX u80_b7 (.i0(rd_addr[7]),.i1(1'b0),.sel(u80_b0_sel_is_6_o),.o(n170[7]));
  AL_MUX u80_b8 (.i0(rd_addr[8]),.i1(n146[8]),.sel(u80_b10_sel_is_2_o),.o(n170[8]));
  AL_MUX u80_b9 (.i0(rd_addr[9]),.i1(n146[9]),.sel(u80_b10_sel_is_2_o),.o(n170[9]));
  and u810 (n735, wr_addr[2], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u811 (n736, n127[2], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u812 (n737, n99[2], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u813 (n738, n733, n734);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u814 (n739, n736, n737);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u815 (n740, n735, n739);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u816 (n182[2], n738, n740);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u817 (n742, wr_addr[1], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u818 (n743, wr_addr[1], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u819 (n744, n127[1], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  AL_MUX u81_b0 (.i0(sd_state[0]),.i1(1'b1),.sel(u80_b0_sel_is_6_o),.o(n171[0]));
  AL_MUX u81_b1 (.i0(sd_state[1]),.i1(1'b0),.sel(u80_b0_sel_is_6_o),.o(n171[1]));
  AL_MUX u81_b2 (.i0(sd_state[2]),.i1(1'b0),.sel(u80_b0_sel_is_6_o),.o(n171[2]));
  and u820 (n745, n99[1], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u821 (n746, n741, n742);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u822 (n747, n744, n745);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u823 (n748, n743, n747);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u824 (n182[1], n746, n748);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u825 (n750, wr_addr[0], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u826 (n751, wr_addr[0], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u827 (n752, n127[0], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u828 (n753, n99[0], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u829 (n754, n749, n750);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u82_sel_is_6 (u82_sel_is_6_o, rd_state$0$_neg, rd_state[1], u75_sel_is_3_o);
  or u830 (n755, n752, n753);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u831 (n756, n751, n755);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u832 (n182[0], n754, n756);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u833 (n917, rd_addr[0], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u834 (n909, rd_addr[1], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u835 (n901, rd_addr[2], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u836 (n893, rd_addr[3], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u837 (n885, rd_addr[4], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u838 (n877, rd_addr[5], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u839 (n869, rd_addr[6], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  AL_MUX u83_b0 (.i0(sd_addr[0]),.i1(rd_addr[0]),.sel(u83_b0_sel_is_0_o),.o(n173[0]));
  and u83_b0_sel_is_0 (u83_b0_sel_is_0_o, rd_state$0$_neg, rd_state$1$_neg);
  AL_MUX u83_b1 (.i0(sd_addr[1]),.i1(rd_addr[1]),.sel(u83_b0_sel_is_0_o),.o(n173[1]));
  AL_MUX u83_b10 (.i0(sd_addr[10]),.i1(rd_addr[10]),.sel(u83_b0_sel_is_0_o),.o(n173[10]));
  AL_MUX u83_b11 (.i0(sd_addr[11]),.i1(rd_addr[11]),.sel(u83_b0_sel_is_0_o),.o(n173[11]));
  AL_MUX u83_b12 (.i0(sd_addr[12]),.i1(rd_addr[12]),.sel(u83_b0_sel_is_0_o),.o(n173[12]));
  AL_MUX u83_b13 (.i0(sd_addr[13]),.i1(rd_addr[13]),.sel(u83_b0_sel_is_0_o),.o(n173[13]));
  AL_MUX u83_b14 (.i0(sd_addr[14]),.i1(rd_addr[14]),.sel(u83_b0_sel_is_0_o),.o(n173[14]));
  AL_MUX u83_b15 (.i0(sd_addr[15]),.i1(rd_addr[15]),.sel(u83_b0_sel_is_0_o),.o(n173[15]));
  AL_MUX u83_b16 (.i0(sd_addr[16]),.i1(rd_addr[16]),.sel(u83_b0_sel_is_0_o),.o(n173[16]));
  AL_MUX u83_b17 (.i0(sd_addr[17]),.i1(rd_addr[17]),.sel(u83_b0_sel_is_0_o),.o(n173[17]));
  AL_MUX u83_b18 (.i0(sd_addr[18]),.i1(rd_addr[18]),.sel(u83_b0_sel_is_0_o),.o(n173[18]));
  AL_MUX u83_b19 (.i0(sd_addr[19]),.i1(rd_addr[19]),.sel(u83_b0_sel_is_0_o),.o(n173[19]));
  AL_MUX u83_b2 (.i0(sd_addr[2]),.i1(rd_addr[2]),.sel(u83_b0_sel_is_0_o),.o(n173[2]));
  AL_MUX u83_b20 (.i0(sd_addr[20]),.i1(rd_addr[20]),.sel(u83_b0_sel_is_0_o),.o(n173[20]));
  AL_MUX u83_b3 (.i0(sd_addr[3]),.i1(rd_addr[3]),.sel(u83_b0_sel_is_0_o),.o(n173[3]));
  AL_MUX u83_b4 (.i0(sd_addr[4]),.i1(rd_addr[4]),.sel(u83_b0_sel_is_0_o),.o(n173[4]));
  AL_MUX u83_b5 (.i0(sd_addr[5]),.i1(rd_addr[5]),.sel(u83_b0_sel_is_0_o),.o(n173[5]));
  AL_MUX u83_b6 (.i0(sd_addr[6]),.i1(rd_addr[6]),.sel(u83_b0_sel_is_0_o),.o(n173[6]));
  AL_MUX u83_b7 (.i0(sd_addr[7]),.i1(rd_addr[7]),.sel(u83_b0_sel_is_0_o),.o(n173[7]));
  AL_MUX u83_b8 (.i0(sd_addr[8]),.i1(rd_addr[8]),.sel(u83_b0_sel_is_0_o),.o(n173[8]));
  AL_MUX u83_b9 (.i0(sd_addr[9]),.i1(rd_addr[9]),.sel(u83_b0_sel_is_0_o),.o(n173[9]));
  xor u84 (n980, SD_DQ[0], datacnt[0]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(241)
  and u840 (n861, rd_addr[7], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u841 (n853, rd_addr[8], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u842 (n845, rd_addr[9], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u843 (n837, rd_addr[10], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u844 (n829, rd_addr[11], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u845 (n821, rd_addr[12], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u846 (n813, rd_addr[13], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u847 (n805, rd_addr[14], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u848 (n797, rd_addr[15], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u849 (n789, rd_addr[16], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u850 (n781, rd_addr[17], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u851 (n773, rd_addr[18], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u852 (n765, rd_addr[19], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u853 (n758, rd_addr[20], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u854 (n759, n170[20], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u855 (n760, rd_addr[20], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u856 (n761, n98[20], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u857 (n762, n757, n758);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u858 (n763, n760, n761);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u859 (n764, n759, n763);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u860 (n181[20], n762, n764);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u861 (n766, rd_addr[19], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u862 (n767, n170[19], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u863 (n768, rd_addr[19], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u864 (n769, n98[19], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u865 (n770, n765, n766);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u866 (n771, n768, n769);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u867 (n772, n767, n771);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u868 (n181[19], n770, n772);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u869 (n774, rd_addr[18], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u87 (n949, reset_step[1], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u870 (n775, n170[18], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u871 (n776, rd_addr[18], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u872 (n777, n98[18], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u873 (n778, n773, n774);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u874 (n779, n776, n777);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u875 (n780, n775, n779);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u876 (n181[18], n778, n780);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u877 (n782, rd_addr[17], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u878 (n783, n170[17], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u879 (n784, rd_addr[17], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u88 (n925, sd_cmd[2], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u880 (n785, n98[17], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u881 (n786, n781, n782);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u882 (n787, n784, n785);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u883 (n788, n783, n787);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u884 (n181[17], n786, n788);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u885 (n790, rd_addr[16], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u886 (n791, n170[16], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u887 (n792, rd_addr[16], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u888 (n793, n98[16], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u889 (n794, n789, n790);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u89 (n757, rd_addr[20], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u890 (n795, n792, n793);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u891 (n796, n791, n795);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u892 (n181[16], n794, n796);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u893 (n798, rd_addr[15], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u894 (n799, n170[15], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u895 (n800, rd_addr[15], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u896 (n801, n98[15], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u897 (n802, n797, n798);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u898 (n803, n800, n801);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u899 (n804, n799, n803);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u9 (n15, datacnt[2], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u90 (n589, wr_addr[20], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u900 (n181[15], n802, n804);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u901 (n806, rd_addr[14], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u902 (n807, n170[14], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u903 (n808, rd_addr[14], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u904 (n809, n98[14], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u905 (n810, n805, n806);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u906 (n811, n808, n809);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u907 (n812, n807, n811);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u908 (n181[14], n810, n812);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u909 (n814, rd_addr[13], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u91 (n565, sd_state[2], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u910 (n815, n170[13], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u911 (n816, rd_addr[13], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u912 (n817, n98[13], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u913 (n818, n813, n814);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u914 (n819, n816, n817);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u915 (n820, n815, n819);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u916 (n181[13], n818, n820);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u917 (n822, rd_addr[12], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u918 (n823, n170[12], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u919 (n824, rd_addr[12], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u92 (n397, sd_addr[20], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u920 (n825, n98[12], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u921 (n826, n821, n822);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u922 (n827, n824, n825);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u923 (n828, n823, n827);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u924 (n181[12], n826, n828);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u925 (n830, rd_addr[11], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u926 (n831, n170[11], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u927 (n832, rd_addr[11], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u928 (n833, n98[11], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u929 (n834, n829, n830);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u93 (n381, wr_state[1], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u930 (n835, n832, n833);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u931 (n836, n831, n835);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u932 (n181[11], n834, n836);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u933 (n838, rd_addr[10], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u934 (n839, n170[10], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u935 (n840, rd_addr[10], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u936 (n841, n98[10], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u937 (n842, n837, n838);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u938 (n843, n840, n841);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u939 (n844, n839, n843);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u94 (n317, fifo_q[7], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u940 (n181[10], n842, n844);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u941 (n846, rd_addr[9], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u942 (n847, n170[9], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u943 (n848, rd_addr[9], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u944 (n849, n98[9], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u945 (n850, n845, n846);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u946 (n851, n848, n849);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u947 (n852, n847, n851);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u948 (n181[9], n850, n852);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u949 (n854, rd_addr[8], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u95 (n277, burst_cnt[8], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u950 (n855, n170[8], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u951 (n856, rd_addr[8], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u952 (n857, n98[8], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u953 (n858, n853, n854);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u954 (n859, n856, n857);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u955 (n860, n855, n859);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u956 (n181[8], n858, n860);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u957 (n862, rd_addr[7], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u958 (n863, n170[7], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u959 (n864, rd_addr[7], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u96 (n296, burst_cnt1[8], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u960 (n865, n98[7], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u961 (n866, n861, n862);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u962 (n867, n864, n865);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u963 (n868, n863, n867);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u964 (n181[7], n866, n868);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u965 (n870, rd_addr[6], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u966 (n871, n170[6], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u967 (n872, rd_addr[6], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u968 (n873, n98[6], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u969 (n874, n869, n870);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u97 (n56, rd_state[1], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u970 (n875, n872, n873);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u971 (n876, n871, n875);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u972 (n181[6], n874, n876);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u973 (n878, rd_addr[5], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u974 (n879, n170[5], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u975 (n880, rd_addr[5], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u976 (n881, n98[5], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u977 (n882, n877, n878);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u978 (n883, n880, n881);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u979 (n884, n879, n883);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u98 (n68, datacnt[7], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u980 (n181[5], n882, n884);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u981 (n886, rd_addr[4], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u982 (n887, n170[4], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u983 (n888, rd_addr[4], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u984 (n889, n98[4], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u985 (n890, n885, n886);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u986 (n891, n888, n889);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u987 (n892, n887, n891);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u988 (n181[4], n890, n892);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u989 (n894, rd_addr[3], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u99 (n79, datacnt[6], n178);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u990 (n895, n170[3], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u991 (n896, rd_addr[3], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u992 (n897, n98[3], n174);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u993 (n898, n893, n894);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u994 (n899, n896, n897);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u995 (n900, n895, n899);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  or u996 (n181[3], n898, n900);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u997 (n902, rd_addr[2], n177);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u998 (n903, n170[2], n176);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  and u999 (n904, rd_addr[2], n175);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdram_control.v(256)
  reg_ar_as_w1 u_sdram_CAS_N_reg (.clk(clk_150m),.d(u_sdram_ICAS_N),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_CAS_N));
  reg_ar_as_w1 u_sdram_RAS_N_reg (.clk(clk_150m),.d(u_sdram_IRAS_N),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_RAS_N));
  reg_ar_as_w1 u_sdram_WE_N_reg (.clk(clk_150m),.d(u_sdram_IWE_N),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_WE_N));
  reg_ar_as_w1 u_sdram_command1_CAS_N_reg (.clk(clk_150m),.d(u_sdram_command1_n66),.en(1'b1),.reset(1'b0),.set(~rst_n_pad),.q(u_sdram_ICAS_N));
  reg_ar_as_w1 u_sdram_command1_CM_ACK_reg (.clk(clk_150m),.d(u_sdram_command1_n21),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_cm_ack));
  reg_ar_as_w1 u_sdram_command1_OE_reg (.clk(clk_150m),.d(u_sdram_command1_oe1),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_oe));
  reg_ar_as_w1 u_sdram_command1_RAS_N_reg (.clk(clk_150m),.d(u_sdram_command1_n65),.en(1'b1),.reset(1'b0),.set(~rst_n_pad),.q(u_sdram_IRAS_N));
  reg_ar_as_w1 u_sdram_command1_WE_N_reg (.clk(clk_150m),.d(u_sdram_command1_n67),.en(1'b1),.reset(1'b0),.set(~rst_n_pad),.q(u_sdram_IWE_N));
  reg_ar_as_w1 u_sdram_command1_bankclose_reg (.clk(clk_150m),.d(u_sdram_command1_n68),.en(~n74),.reset(1'b0),.set(1'b0),.q(u_sdram_command1_bankclose));
  or u_sdram_command1_command_delay$0$_set (u_sdram_command1_command_delay$0$_d, u_sdram_command1_command_delay[0], u_sdram_command1_n21);
  or u_sdram_command1_command_delay$1$_set (u_sdram_command1_command_delay$1$_d, u_sdram_command1_command_delay[1], u_sdram_command1_n21);
  or u_sdram_command1_command_delay$2$_set (u_sdram_command1_command_delay$2$_d, u_sdram_command1_command_delay[2], u_sdram_command1_n21);
  or u_sdram_command1_command_delay$3$_set (u_sdram_command1_command_delay$3$_d, u_sdram_command1_command_delay[3], u_sdram_command1_n21);
  or u_sdram_command1_command_delay$4$_set (u_sdram_command1_command_delay$4$_d, u_sdram_command1_command_delay[4], u_sdram_command1_n21);
  or u_sdram_command1_command_delay$5$_set (u_sdram_command1_command_delay$5$_d, u_sdram_command1_command_delay[5], u_sdram_command1_n21);
  or u_sdram_command1_command_delay$6$_set (u_sdram_command1_command_delay$6$_d, u_sdram_command1_command_delay[6], u_sdram_command1_n21);
  or u_sdram_command1_command_delay$7$_set (u_sdram_command1_command_delay$7$_d, u_sdram_command1_command_delay[7], u_sdram_command1_n21);
  reg_ar_ss_w1 u_sdram_command1_command_done_reg (.clk(clk_150m),.d(u_sdram_command1_command_delay$0$_d),.en(u_sdram_command1_command_delay$0$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_command_done));
  not u_sdram_command1_do_load_mode_inv (u_sdram_command1_do_load_mode_neg, u_sdram_command1_do_load_mode);
  reg_ar_as_w1 u_sdram_command1_do_load_mode_reg (.clk(clk_150m),.d(u_sdram_command1_n19),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_do_load_mode));
  reg_ar_as_w1 u_sdram_command1_do_precharge_reg (.clk(clk_150m),.d(u_sdram_command1_n15),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_do_precharge));
  reg_ar_as_w1 u_sdram_command1_do_reada_reg (.clk(clk_150m),.d(u_sdram_command1_n6),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_do_reada));
  reg_ar_as_w1 u_sdram_command1_do_rw_reg (.clk(clk_150m),.d(u_sdram_command1_n40),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_do_rw));
  reg_ar_as_w1 u_sdram_command1_do_writea_reg (.clk(clk_150m),.d(u_sdram_command1_n12),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_do_writea));
  or u_sdram_command1_n29_set (_al_n0_en, u_sdram_command1_n29, u_sdram_command1_do_writea);
  not u_sdram_command1_n33_inv (u_sdram_command1_n33_neg, u_sdram_command1_n33);
  not u_sdram_command1_n34_inv (u_sdram_command1_n34_neg, u_sdram_command1_n34);
  not u_sdram_command1_n35_inv (u_sdram_command1_n35_neg, u_sdram_command1_n35);
  not u_sdram_command1_n42_inv (u_sdram_command1_n42_neg, u_sdram_command1_n42);
  or u_sdram_command1_n47_set (u_sdram_command1_n47_d, u_sdram_command1_n47, u_sdram_command1_do_load_mode);
  not u_sdram_command1_n51_inv (u_sdram_command1_n51_neg, u_sdram_command1_n51);
  not u_sdram_command1_n52_inv (u_sdram_command1_n52_neg, u_sdram_command1_n52);
  reg_ar_ss_w1 u_sdram_command1_oe1_reg (.clk(clk_150m),.d(_al_n0_d),.en(_al_n0_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_oe1));
  reg_ar_as_w1 u_sdram_command1_rp_done_reg (.clk(clk_150m),.d(u_sdram_command1_n28),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_rp_done));
  or u_sdram_command1_rp_shift$1$_set (u_sdram_command1_rp_shift$1$_d, u_sdram_command1_rp_shift[1], u_sdram_command1_n26);
  or u_sdram_command1_rp_shift$2$_set (u_sdram_command1_rp_shift$2$_d, u_sdram_command1_rp_shift[2], u_sdram_command1_n26);
  or u_sdram_command1_rp_shift$3$_set (u_sdram_command1_rp_shift$3$_d, u_sdram_command1_rp_shift[3], u_sdram_command1_n26);
  reg_ar_as_w1 u_sdram_command1_rw_flag_reg (.clk(clk_150m),.d(u_sdram_command1_do_reada),.en(u_sdram_command1_n21),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_rw_flag));
  and u_sdram_command1_u10 (u_sdram_command1_n6, u_sdram_command1_n4, u_sdram_command1_n11);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(103)
  not u_sdram_command1_u11 (u_sdram_command1_n7, u_sdram_command1_command_done);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(108)
  and u_sdram_command1_u12 (u_sdram_command1_n8, u_sdram_writea, u_sdram_command1_n7);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(108)
  not u_sdram_command1_u13 (u_sdram_command1_n9, u_sdram_command1_do_writea);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(108)
  and u_sdram_command1_u14 (u_sdram_command1_n10, u_sdram_command1_n8, u_sdram_command1_n9);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(108)
  not u_sdram_command1_u15 (u_sdram_command1_n11, u_sdram_command1_rp_done);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(108)
  and u_sdram_command1_u16 (u_sdram_command1_n12, u_sdram_command1_n10, u_sdram_command1_n11);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(108)
  not u_sdram_command1_u17 (u_sdram_command1_n33, u_sdram_command1_n16);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(183)
  and u_sdram_command1_u18 (u_sdram_command1_n13, u_sdram_precharge, u_sdram_command1_n7);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(119)
  not u_sdram_command1_u19 (u_sdram_command1_n14, u_sdram_command1_do_precharge);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(119)
  and u_sdram_command1_u20 (u_sdram_command1_n15, u_sdram_command1_n13, u_sdram_command1_n14);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(119)
  or u_sdram_command1_u21 (u_sdram_command1_n16, u_sdram_command1_n20, u_sdram_sc_rc[1]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(183)
  and u_sdram_command1_u22 (u_sdram_command1_n17, u_sdram_load_mode, u_sdram_command1_n7);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(124)
  and u_sdram_command1_u24 (u_sdram_command1_n19, u_sdram_command1_n17, u_sdram_command1_do_load_mode_neg);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(124)
  not u_sdram_command1_u25 (u_sdram_command1_n34, u_sdram_command1_n44);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(185)
  or u_sdram_command1_u26 (u_sdram_command1_n44, u_sdram_sc_rc[0], u_sdram_command1_n0);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(185)
  not u_sdram_command1_u30 (u_sdram_command1_n25, u_sdram_command1_command_delay[0]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(143)
  and u_sdram_command1_u31 (u_sdram_command1_n26, u_sdram_command1_n25, u_sdram_command1_command_done);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(143)
  AL_MUX u_sdram_command1_u33 (.i0(u_sdram_command1_rp_shift[0]),.i1(1'b0),.sel(u_sdram_command1_n26),.o(u_sdram_command1_n28));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(153)
  reg_ar_ss_w1 u_sdram_command1_u34_b0 (.clk(clk_150m),.d(u_sdram_command1_command_delay$1$_d),.en(u_sdram_command1_command_delay$0$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_command_delay[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(154)
  reg_ar_ss_w1 u_sdram_command1_u34_b1 (.clk(clk_150m),.d(u_sdram_command1_command_delay$2$_d),.en(u_sdram_command1_command_delay$0$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_command_delay[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(154)
  reg_ar_ss_w1 u_sdram_command1_u34_b2 (.clk(clk_150m),.d(u_sdram_command1_command_delay$3$_d),.en(u_sdram_command1_command_delay$0$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_command_delay[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(154)
  reg_ar_ss_w1 u_sdram_command1_u34_b3 (.clk(clk_150m),.d(u_sdram_command1_command_delay$4$_d),.en(u_sdram_command1_command_delay$0$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_command_delay[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(154)
  reg_ar_ss_w1 u_sdram_command1_u34_b4 (.clk(clk_150m),.d(u_sdram_command1_command_delay$5$_d),.en(u_sdram_command1_command_delay$0$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_command_delay[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(154)
  reg_ar_ss_w1 u_sdram_command1_u34_b5 (.clk(clk_150m),.d(u_sdram_command1_command_delay$6$_d),.en(u_sdram_command1_command_delay$0$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_command_delay[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(154)
  reg_ar_ss_w1 u_sdram_command1_u34_b6 (.clk(clk_150m),.d(u_sdram_command1_command_delay$7$_d),.en(u_sdram_command1_command_delay$0$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_command_delay[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(154)
  reg_ar_ss_w1 u_sdram_command1_u34_b7 (.clk(clk_150m),.d(_al_n0_d_al_n158),.en(u_sdram_command1_command_delay$0$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_command_delay[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(154)
  reg_ar_ss_w1 u_sdram_command1_u35_b0 (.clk(clk_150m),.d(u_sdram_command1_rp_shift$1$_d),.en(u_sdram_command1_rp_shift$1$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_rp_shift[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(154)
  reg_ar_ss_w1 u_sdram_command1_u35_b1 (.clk(clk_150m),.d(u_sdram_command1_rp_shift$2$_d),.en(u_sdram_command1_rp_shift$1$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_rp_shift[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(154)
  reg_ar_ss_w1 u_sdram_command1_u35_b2 (.clk(clk_150m),.d(u_sdram_command1_rp_shift$3$_d),.en(u_sdram_command1_rp_shift$1$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_rp_shift[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(154)
  reg_ar_ss_w1 u_sdram_command1_u35_b3 (.clk(clk_150m),.d(_al_n0_d_al_n160),.en(u_sdram_command1_rp_shift$1$_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_rp_shift[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(154)
  or u_sdram_command1_u38 (u_sdram_command1_n29, u_sdram_command1_do_precharge, u_sdram_command1_do_reada);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(167)
  reg_ar_as_w1 u_sdram_command1_u41_b0 (.clk(clk_150m),.d(u_sdram_command1_n41[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_rw_shift[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(196)
  reg_ar_as_w1 u_sdram_command1_u41_b1 (.clk(clk_150m),.d(u_sdram_command1_n41[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_rw_shift[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(196)
  reg_ar_as_w1 u_sdram_command1_u41_b2 (.clk(clk_150m),.d(u_sdram_command1_n41[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_command1_rw_shift[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(196)
  or u_sdram_command1_u42 (u_sdram_command1_n32, u_sdram_command1_n20, u_sdram_command1_n0);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(187)
  not u_sdram_command1_u43 (u_sdram_command1_n35, u_sdram_command1_n32);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(187)
  binary_mux_s1_w1 u_sdram_command1_u46_b0 (.i0(u_sdram_command1_rw_shift[0]),.i1(1'b0),.sel(u_sdram_command1_n35),.o(u_sdram_command1_n36[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(188)
  binary_mux_s1_w1 u_sdram_command1_u46_b1 (.i0(u_sdram_command1_rw_shift[1]),.i1(1'b1),.sel(u_sdram_command1_n35),.o(u_sdram_command1_n36[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(188)
  binary_mux_s1_w1 u_sdram_command1_u47_b0 (.i0(u_sdram_command1_n36[0]),.i1(1'b1),.sel(u_sdram_command1_n34),.o(u_sdram_command1_n37[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(188)
  binary_mux_s1_w1 u_sdram_command1_u47_b1 (.i0(u_sdram_command1_n36[1]),.i1(1'b0),.sel(u_sdram_command1_n34),.o(u_sdram_command1_n37[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(188)
  and u_sdram_command1_u47_b2_sel_is_0 (u_sdram_command1_u47_b2_sel_is_0_o, u_sdram_command1_n34_neg, u_sdram_command1_n35_neg);
  not u_sdram_command1_u47_b2_sel_is_0_o_inv (u_sdram_command1_u47_b2_sel_is_0_o_neg, u_sdram_command1_u47_b2_sel_is_0_o);
  AL_MUX u_sdram_command1_u48 (.i0(u_sdram_command1_do_rw),.i1(1'b1),.sel(u_sdram_command1_n33),.o(u_sdram_command1_n38));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(188)
  binary_mux_s1_w1 u_sdram_command1_u49_b0 (.i0(u_sdram_command1_n37[0]),.i1(u_sdram_command1_rw_shift[0]),.sel(u_sdram_command1_n33),.o(u_sdram_command1_n39[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(188)
  binary_mux_s1_w1 u_sdram_command1_u49_b1 (.i0(u_sdram_command1_n37[1]),.i1(u_sdram_command1_rw_shift[1]),.sel(u_sdram_command1_n33),.o(u_sdram_command1_n39[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(188)
  and u_sdram_command1_u49_b2_sel_is_0 (u_sdram_command1_u49_b2_sel_is_0_o, u_sdram_command1_n33_neg, u_sdram_command1_u47_b2_sel_is_0_o_neg);
  not u_sdram_command1_u49_b2_sel_is_0_o_inv (u_sdram_command1_u49_b2_sel_is_0_o_neg, u_sdram_command1_u49_b2_sel_is_0_o);
  AL_MUX u_sdram_command1_u50 (.i0(u_sdram_command1_rw_shift[0]),.i1(u_sdram_command1_n38),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n40));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(195)
  binary_mux_s1_w1 u_sdram_command1_u51_b0 (.i0(u_sdram_command1_rw_shift[1]),.i1(u_sdram_command1_n39[0]),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n41[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(195)
  binary_mux_s1_w1 u_sdram_command1_u51_b1 (.i0(u_sdram_command1_rw_shift[2]),.i1(u_sdram_command1_n39[1]),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n41[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(195)
  AL_MUX u_sdram_command1_u51_b2 (.i0(1'b0),.i1(u_sdram_command1_rw_shift[2]),.sel(u_sdram_command1_u51_b2_sel_is_1_o),.o(u_sdram_command1_n41[2]));
  and u_sdram_command1_u51_b2_sel_is_1 (u_sdram_command1_u51_b2_sel_is_1_o, u_sdram_command1_n42, u_sdram_command1_u49_b2_sel_is_0_o_neg);
  or u_sdram_command1_u53 (u_sdram_command1_n42, u_sdram_command1_do_reada, u_sdram_command1_do_writea);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(206)
  or u_sdram_command1_u54 (u_sdram_command1_n43, u_sdram_command1_n42, u_sdram_command1_do_precharge);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(206)
  or u_sdram_command1_u55 (u_sdram_command1_n21, u_sdram_command1_n43, u_sdram_command1_do_load_mode);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(206)
  reg_ar_as_w1 u_sdram_command1_u56_b0 (.clk(clk_150m),.d(u_sdram_command1_n46[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_ISA[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  reg_ar_as_w1 u_sdram_command1_u56_b1 (.clk(clk_150m),.d(u_sdram_command1_n46[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_ISA[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  reg_ar_ss_w1 u_sdram_command1_u56_b10 (.clk(clk_150m),.d(u_sdram_command1_n47_d),.en(u_sdram_command1_n47_en),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_ISA[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  reg_ar_as_w1 u_sdram_command1_u56_b2 (.clk(clk_150m),.d(u_sdram_command1_n46[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_ISA[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  reg_ar_as_w1 u_sdram_command1_u56_b3 (.clk(clk_150m),.d(u_sdram_command1_n46[3]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_ISA[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  reg_ar_as_w1 u_sdram_command1_u56_b4 (.clk(clk_150m),.d(u_sdram_command1_n46[4]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_ISA[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  reg_ar_as_w1 u_sdram_command1_u56_b5 (.clk(clk_150m),.d(u_sdram_command1_n46[5]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_ISA[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  reg_ar_as_w1 u_sdram_command1_u56_b6 (.clk(clk_150m),.d(u_sdram_command1_n46[6]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_ISA[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  reg_ar_as_w1 u_sdram_command1_u56_b7 (.clk(clk_150m),.d(u_sdram_command1_n46[7]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_ISA[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  reg_ar_as_w1 u_sdram_command1_u56_b8 (.clk(clk_150m),.d(u_sdram_saddr[16]),.en(u_sdram_command1_n42),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_ISA[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  reg_ar_as_w1 u_sdram_command1_u56_b9 (.clk(clk_150m),.d(u_sdram_command1_n48[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_ISA[9]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  binary_mux_s1_w1 u_sdram_command1_u59_b0 (.i0(u_sdram_saddr[0]),.i1(u_sdram_saddr[8]),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n46[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(235)
  binary_mux_s1_w1 u_sdram_command1_u59_b1 (.i0(u_sdram_saddr[1]),.i1(u_sdram_saddr[9]),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n46[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(235)
  binary_mux_s1_w1 u_sdram_command1_u59_b10 (.i0(u_sdram_ISA[10]),.i1(u_sdram_saddr[18]),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n46[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(235)
  binary_mux_s1_w1 u_sdram_command1_u59_b2 (.i0(u_sdram_saddr[2]),.i1(u_sdram_saddr[10]),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n46[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(235)
  binary_mux_s1_w1 u_sdram_command1_u59_b3 (.i0(u_sdram_saddr[3]),.i1(u_sdram_saddr[11]),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n46[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(235)
  binary_mux_s1_w1 u_sdram_command1_u59_b4 (.i0(u_sdram_saddr[4]),.i1(u_sdram_saddr[12]),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n46[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(235)
  binary_mux_s1_w1 u_sdram_command1_u59_b5 (.i0(u_sdram_saddr[5]),.i1(u_sdram_saddr[13]),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n46[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(235)
  binary_mux_s1_w1 u_sdram_command1_u59_b6 (.i0(u_sdram_saddr[6]),.i1(u_sdram_saddr[14]),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n46[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(235)
  binary_mux_s1_w1 u_sdram_command1_u59_b7 (.i0(u_sdram_saddr[7]),.i1(u_sdram_saddr[15]),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n46[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(235)
  binary_mux_s1_w1 u_sdram_command1_u59_b9 (.i0(u_sdram_ISA[9]),.i1(u_sdram_saddr[17]),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n46[9]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(235)
  and u_sdram_command1_u6 (u_sdram_command1_n2, u_sdram_reada, u_sdram_command1_n7);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(103)
  AL_MUX u_sdram_command1_u60 (.i0(u_sdram_command1_n46[10]),.i1(1'b0),.sel(u_sdram_command1_bankclose),.o(u_sdram_command1_n47));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(237)
  binary_mux_s1_w1 u_sdram_command1_u64_b0 (.i0(u_sdram_saddr[19]),.i1(1'b0),.sel(u_sdram_command1_do_load_mode),.o(u_sdram_command1_n49[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(245)
  binary_mux_s1_w1 u_sdram_command1_u64_b1 (.i0(u_sdram_saddr[20]),.i1(1'b0),.sel(u_sdram_command1_do_load_mode),.o(u_sdram_command1_n49[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(245)
  or u_sdram_command1_u68 (u_sdram_command1_n50, u_sdram_command1_oe1, u_sdram_command1_rw_flag);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(247)
  and u_sdram_command1_u69 (u_sdram_command1_n51, u_sdram_command1_do_precharge, u_sdram_command1_n50);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(247)
  not u_sdram_command1_u7 (u_sdram_command1_n3, u_sdram_command1_do_reada);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(103)
  or u_sdram_command1_u72 (u_sdram_command1_n52, u_sdram_command1_do_precharge, u_sdram_command1_bankclose);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(253)
  not u_sdram_command1_u78 (u_sdram_command1_n53, u_sdram_command1_do_rw);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(283)
  and u_sdram_command1_u8 (u_sdram_command1_n4, u_sdram_command1_n2, u_sdram_command1_n3);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(103)
  AL_MUX u_sdram_command1_u81 (.i0(u_sdram_command1_n53),.i1(1'b1),.sel(u_sdram_command1_n42),.o(u_sdram_command1_n56));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(283)
  AL_MUX u_sdram_command1_u82 (.i0(1'b1),.i1(u_sdram_command1_rw_flag),.sel(u_sdram_command1_u82_sel_is_2_o),.o(u_sdram_command1_n57));
  and u_sdram_command1_u82_sel_is_2 (u_sdram_command1_u82_sel_is_2_o, u_sdram_command1_n42_neg, u_sdram_command1_do_rw);
  AL_MUX u_sdram_command1_u84 (.i0(u_sdram_command1_n56),.i1(1'b0),.sel(u_sdram_command1_do_load_mode),.o(u_sdram_command1_n59));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(283)
  AL_MUX u_sdram_command1_u86 (.i0(1'b0),.i1(u_sdram_command1_n42_neg),.sel(u_sdram_command1_u86_sel_is_0_o),.o(u_sdram_command1_n61));
  and u_sdram_command1_u86_sel_is_0 (u_sdram_command1_u86_sel_is_0_o, u_sdram_command1_n52_neg, u_sdram_command1_do_load_mode_neg);
  AL_MUX u_sdram_command1_u89 (.i0(u_sdram_command1_bankclose),.i1(1'b0),.sel(u_sdram_command1_n52),.o(u_sdram_command1_n64));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(283)
  AL_MUX u_sdram_command1_u90 (.i0(u_sdram_command1_n61),.i1(1'b1),.sel(u_sdram_command1_n51),.o(u_sdram_command1_n65));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(283)
  AL_MUX u_sdram_command1_u91 (.i0(1'b1),.i1(u_sdram_command1_n59),.sel(u_sdram_command1_u91_sel_is_0_o),.o(u_sdram_command1_n66));
  and u_sdram_command1_u91_sel_is_0 (u_sdram_command1_u91_sel_is_0_o, u_sdram_command1_n51_neg, u_sdram_command1_n52_neg);
  AL_MUX u_sdram_command1_u92 (.i0(1'b0),.i1(u_sdram_command1_n57),.sel(u_sdram_command1_u92_sel_is_2_o),.o(u_sdram_command1_n67));
  and u_sdram_command1_u92_sel_is_2 (u_sdram_command1_u92_sel_is_2_o, u_sdram_command1_n51_neg, u_sdram_command1_u86_sel_is_0_o);
  AL_MUX u_sdram_command1_u93 (.i0(u_sdram_command1_n64),.i1(1'b1),.sel(u_sdram_command1_n51),.o(u_sdram_command1_n68));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(283)
  reg_ar_as_w1 u_sdram_command1_u94_b0 (.clk(clk_150m),.d(u_sdram_command1_n49[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_IBA[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  reg_ar_as_w1 u_sdram_command1_u94_b1 (.clk(clk_150m),.d(u_sdram_command1_n49[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_IBA[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(284)
  binary_mux_s1_w1 u_sdram_command1_u96_b0 (.i0(u_sdram_command1_n46[9]),.i1(u_sdram_saddr[9]),.sel(u_sdram_command1_do_load_mode),.o(u_sdram_command1_n48[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/Command.v(241)
  reg_ar_as_w1 u_sdram_control1_CMD_ACK_int_reg (.clk(clk_150m),.d(u_sdram_control1_n44),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(sd_cmd_ack));
  reg_ar_as_w1 u_sdram_control1_LOAD_MODE_reg (.clk(clk_150m),.d(u_sdram_control1_n8),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_load_mode));
  reg_ar_as_w1 u_sdram_control1_LOAD_REG1_reg (.clk(clk_150m),.d(u_sdram_control1_n11),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_control1_LOAD_REG1));
  reg_ar_as_w1 u_sdram_control1_LOAD_REG2_reg (.clk(clk_150m),.d(u_sdram_control1_n14),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_control1_LOAD_REG2));
  reg_ar_as_w1 u_sdram_control1_PRECHARGE_reg (.clk(clk_150m),.d(u_sdram_control1_n7),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_precharge));
  reg_ar_as_w1 u_sdram_control1_READA_reg (.clk(clk_150m),.d(u_sdram_control1_n5),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_reada));
  reg_ar_as_w1 u_sdram_control1_WRITEA_reg (.clk(clk_150m),.d(u_sdram_control1_n6),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_writea));
  not u_sdram_control1_u10 (u_sdram_control1_n13, u_sdram_control1_LOAD_REG2);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(103)
  and u_sdram_control1_u11 (u_sdram_control1_n14, u_sdram_control1_n12, u_sdram_control1_n13);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(103)
  reg_ar_as_w1 u_sdram_control1_u12_b0 (.clk(clk_150m),.d(sd_addr[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b1 (.clk(clk_150m),.d(sd_addr[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b10 (.clk(clk_150m),.d(sd_addr[10]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b11 (.clk(clk_150m),.d(sd_addr[11]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[11]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b12 (.clk(clk_150m),.d(sd_addr[12]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[12]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b13 (.clk(clk_150m),.d(sd_addr[13]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[13]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b14 (.clk(clk_150m),.d(sd_addr[14]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[14]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b15 (.clk(clk_150m),.d(sd_addr[15]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[15]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b16 (.clk(clk_150m),.d(sd_addr[16]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[16]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b17 (.clk(clk_150m),.d(sd_addr[17]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[17]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b18 (.clk(clk_150m),.d(sd_addr[18]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[18]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b19 (.clk(clk_150m),.d(sd_addr[19]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[19]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b2 (.clk(clk_150m),.d(sd_addr[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b20 (.clk(clk_150m),.d(sd_addr[20]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[20]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b3 (.clk(clk_150m),.d(sd_addr[3]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b4 (.clk(clk_150m),.d(sd_addr[4]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b5 (.clk(clk_150m),.d(sd_addr[5]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b6 (.clk(clk_150m),.d(sd_addr[6]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b7 (.clk(clk_150m),.d(sd_addr[7]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b8 (.clk(clk_150m),.d(sd_addr[8]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u12_b9 (.clk(clk_150m),.d(sd_addr[9]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_saddr[9]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(107)
  reg_ar_as_w1 u_sdram_control1_u22_b0 (.clk(clk_150m),.d(u_sdram_saddr[2]),.en(u_sdram_control1_LOAD_REG1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_sc_rc[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(130)
  reg_ar_as_w1 u_sdram_control1_u22_b1 (.clk(clk_150m),.d(u_sdram_saddr[3]),.en(u_sdram_control1_LOAD_REG1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_sc_rc[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(130)
  or u_sdram_control1_u31 (u_sdram_control1_n40, u_sdram_cm_ack, u_sdram_control1_LOAD_REG1);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(142)
  or u_sdram_control1_u33 (u_sdram_control1_n42, u_sdram_control1_n40, u_sdram_control1_LOAD_REG2);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(142)
  not u_sdram_control1_u34 (u_sdram_control1_n43, sd_cmd_ack);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(142)
  and u_sdram_control1_u35 (u_sdram_control1_n44, u_sdram_control1_n42, u_sdram_control1_n43);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(142)
  or u_sdram_control1_u52 (u_sdram_control1_n39, u_sdram_control1_n28, u_sdram_control1_n41);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(103)
  or u_sdram_control1_u53 (u_sdram_control1_n38, u_sdram_control1_n37, u_sdram_control1_n39);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(103)
  not u_sdram_control1_u54 (u_sdram_control1_n12, u_sdram_control1_n38);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(103)
  or u_sdram_control1_u58 (u_sdram_control1_n1, sd_cmd[0], u_sdram_control1_n39);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(98)
  not u_sdram_control1_u59 (u_sdram_control1_n9, u_sdram_control1_n1);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(98)
  or u_sdram_control1_u61 (u_sdram_control1_n18, sd_cmd[1], u_sdram_control1_n41);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(93)
  or u_sdram_control1_u62 (u_sdram_control1_n19, u_sdram_control1_n37, u_sdram_control1_n18);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(93)
  not u_sdram_control1_u63 (u_sdram_control1_n8, u_sdram_control1_n19);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(93)
  or u_sdram_control1_u66 (u_sdram_control1_n22, sd_cmd[0], u_sdram_control1_n18);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(88)
  not u_sdram_control1_u67 (u_sdram_control1_n7, u_sdram_control1_n22);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(88)
  or u_sdram_control1_u69 (u_sdram_control1_n24, u_sdram_control1_n28, sd_cmd[2]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(82)
  or u_sdram_control1_u70 (u_sdram_control1_n25, sd_cmd[0], u_sdram_control1_n24);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(82)
  not u_sdram_control1_u71 (u_sdram_control1_n6, u_sdram_control1_n25);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(82)
  or u_sdram_control1_u72 (u_sdram_control1_n35, sd_cmd[1], sd_cmd[2]);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(77)
  or u_sdram_control1_u73 (u_sdram_control1_n36, u_sdram_control1_n37, u_sdram_control1_n35);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(77)
  not u_sdram_control1_u74 (u_sdram_control1_n5, u_sdram_control1_n36);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(77)
  not u_sdram_control1_u8 (u_sdram_control1_n10, u_sdram_control1_LOAD_REG1);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(98)
  and u_sdram_control1_u9 (u_sdram_control1_n11, u_sdram_control1_n9, u_sdram_control1_n10);  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/control_interface.v(98)
  reg_ar_as_w1 u_sdram_data_path1_u6_b0 (.clk(clk_150m),.d(u_sdram_data_path1_DIN1[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b1 (.clk(clk_150m),.d(u_sdram_data_path1_DIN1[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b10 (.clk(clk_150m),.d(u_sdram_data_path1_DIN1[10]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b11 (.clk(clk_150m),.d(u_sdram_data_path1_DIN1[11]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[11]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b12 (.clk(clk_150m),.d(u_sdram_data_path1_DIN1[12]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[12]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b13 (.clk(clk_150m),.d(u_sdram_data_path1_DIN1[13]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[13]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b14 (.clk(clk_150m),.d(u_sdram_data_path1_DIN1[14]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[14]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b15 (.clk(clk_150m),.d(u_sdram_data_path1_DIN1[15]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[15]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b16 (.clk(clk_150m),.d(u_sdram_saddr[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[16]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b17 (.clk(clk_150m),.d(u_sdram_saddr[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[17]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b18 (.clk(clk_150m),.d(u_sdram_saddr[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[18]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b19 (.clk(clk_150m),.d(u_sdram_saddr[3]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[19]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b20 (.clk(clk_150m),.d(u_sdram_saddr[4]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[20]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b21 (.clk(clk_150m),.d(u_sdram_saddr[5]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[21]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b22 (.clk(clk_150m),.d(u_sdram_saddr[6]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[22]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u6_b23 (.clk(clk_150m),.d(u_sdram_saddr[7]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_DQOUT[23]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u9_b0 (.clk(clk_150m),.d(fifo_q[0]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_data_path1_DIN1[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u9_b1 (.clk(clk_150m),.d(fifo_q[1]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_data_path1_DIN1[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u9_b10 (.clk(clk_150m),.d(fifo_q[2]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_data_path1_DIN1[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u9_b11 (.clk(clk_150m),.d(fifo_q[3]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_data_path1_DIN1[11]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u9_b12 (.clk(clk_150m),.d(fifo_q[4]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_data_path1_DIN1[12]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u9_b13 (.clk(clk_150m),.d(fifo_q[5]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_data_path1_DIN1[13]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u9_b14 (.clk(clk_150m),.d(fifo_q[6]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_data_path1_DIN1[14]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  reg_ar_as_w1 u_sdram_data_path1_u9_b15 (.clk(clk_150m),.d(fifo_q[7]),.en(1'b1),.reset(~rst_n_pad),.set(1'b0),.q(u_sdram_data_path1_DIN1[15]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_data_path.v(44)
  not u_sdram_sc_rc$0$_inv (u_sdram_command1_n20, u_sdram_sc_rc[0]);
  not u_sdram_sc_rc$1$_inv (u_sdram_command1_n0, u_sdram_sc_rc[1]);
  reg_ar_as_w1 u_sdram_u1_b0 (.clk(clk_150m),.d(u_sdram_IBA[0]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_BA[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  reg_ar_as_w1 u_sdram_u1_b1 (.clk(clk_150m),.d(u_sdram_IBA[1]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_BA[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  reg_ar_as_w1 u_sdram_u28_b0 (.clk(clk_150m),.d(u_sdram_ISA[0]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_SA[0]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  reg_ar_as_w1 u_sdram_u28_b1 (.clk(clk_150m),.d(u_sdram_ISA[1]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_SA[1]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  reg_ar_as_w1 u_sdram_u28_b10 (.clk(clk_150m),.d(u_sdram_ISA[10]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_SA[10]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  reg_ar_as_w1 u_sdram_u28_b2 (.clk(clk_150m),.d(u_sdram_ISA[2]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_SA[2]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  reg_ar_as_w1 u_sdram_u28_b3 (.clk(clk_150m),.d(u_sdram_ISA[3]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_SA[3]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  reg_ar_as_w1 u_sdram_u28_b4 (.clk(clk_150m),.d(u_sdram_ISA[4]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_SA[4]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  reg_ar_as_w1 u_sdram_u28_b5 (.clk(clk_150m),.d(u_sdram_ISA[5]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_SA[5]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  reg_ar_as_w1 u_sdram_u28_b6 (.clk(clk_150m),.d(u_sdram_ISA[6]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_SA[6]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  reg_ar_as_w1 u_sdram_u28_b7 (.clk(clk_150m),.d(u_sdram_ISA[7]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_SA[7]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  reg_ar_as_w1 u_sdram_u28_b8 (.clk(clk_150m),.d(u_sdram_ISA[8]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_SA[8]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  reg_ar_as_w1 u_sdram_u28_b9 (.clk(clk_150m),.d(u_sdram_ISA[9]),.en(1'b1),.reset(1'b0),.set(1'b0),.q(SD_SA[9]));  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/sdr_sdram.v(102)
  AL_PHY_PLL #(
    .CLKC0_CPHASE(6),
    .CLKC0_DIV(8),
    .CLKC0_ENABLE("ENABLE"),
    .CLKC0_FPHASE("0"),
    .CLKC1_CPHASE(0),
    .CLKC1_DIV(8),
    .CLKC1_ENABLE("ENABLE"),
    .CLKC1_FPHASE("0"),
    .CLKC2_CPHASE(4),
    .CLKC2_DIV(8),
    .CLKC2_ENABLE("DISABLE"),
    .CLKC2_FPHASE("0"),
    .CLKC3_CPHASE(2),
    .CLKC3_DIV(8),
    .CLKC3_ENABLE("DISABLE"),
    .CLKC3_FPHASE("0"),
    .CLKC4_CPHASE(0),
    .CLKC4_DIV(8),
    .CLKC4_ENABLE("DISABLE"),
    .CLKC4_FPHASE("0"),
    .DPHASE_SOURCE("DISABLE"),
    .FBCLK_DIV(45),
    .FEEDBK_PATH("VCO_PHASE_0"),
    .FIN("100.0000"),
    .FREQ_LOCK_ACCURACY("2"),
    .GMC_GAIN("7"),
    .GMC_TEST("14"),
    .ICP_CURRENT(14),
    .INTFB_WAKE("DISABLE"),
    .INT_FEEDBK_PATH("VCO_PHASE_0"),
    .KVCO("7"),
    .LPF_CAPACITOR("3"),
    .LPF_RESISTOR(1),
    .NORESET("DISABLE"),
    .ODIV_MUXC0("DIV"),
    .ODIV_MUXC1("DIV"),
    .ODIV_MUXC2("DIV"),
    .ODIV_MUXC3("DIV"),
    .ODIV_MUXC4("DIV"),
    .PLLC2RST_ENA("DISABLE"),
    .PLLC34RST_ENA("DISABLE"),
    .PLLMRST_ENA("DISABLE"),
    .PLLRST_ENA("ENABLE"),
    .PLL_LOCK_MODE("0"),
    .PREDIV_MUXC0("VCO"),
    .PREDIV_MUXC1("VCO"),
    .PREDIV_MUXC2("VCO"),
    .PREDIV_MUXC3("VCO"),
    .PREDIV_MUXC4("VCO"),
    .REFCLK_DIV(1),
    .REFCLK_SEL("INTERNAL"),
    .STDBY_ENABLE("ENABLE"),
    .STDBY_VCO_ENA("DISABLE"),
    .SYNC_ENABLE("ENABLE"),
    .VCO_NORESET("DISABLE"))
    u_sys_pll_pll_clk (.fbclk(),.phasestep(),.phaseupdown(),.phcntsel(),.pllreset(1'b0),.refclk(CLKIN_pad),.scanclk(),.stdby(1'b0),.clkc({open_n523,open_n524,open_n525,sd_clk_int,clk_150m}),.ext_lock(),.phasedone());  // D:/Anlogic_Com/TIO/TIO_V2/sdram_test/SDRAM_TEST/pll1.v(45)
  not wr_addr$10$_inv (n1046, wr_addr[10]);
  not wr_addr$11$_inv (n1047, wr_addr[11]);
  not wr_addr$12$_inv (n1048, wr_addr[12]);
  not wr_addr$13$_inv (n1049, wr_addr[13]);
  not wr_addr$14$_inv (n1050, wr_addr[14]);
  not wr_addr$15$_inv (n1051, wr_addr[15]);
  not wr_addr$16$_inv (n1052, wr_addr[16]);
  not wr_addr$17$_inv (n1053, wr_addr[17]);
  not wr_addr$18$_inv (n1054, wr_addr[18]);
  not wr_addr$19$_inv (n1055, wr_addr[19]);
  not wr_addr$20$_inv (n1056, wr_addr[20]);
  not wr_addr$8$_inv (n1044, wr_addr[8]);
  not wr_addr$9$_inv (n1045, wr_addr[9]);
  not wr_state$0$_inv (wr_state$0$_neg, wr_state[0]);
  not wr_state$1$_inv (wr_state$1$_neg, wr_state[1]);

endmodule 

module reg_ar_ss_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  wire enout;
  wire setout;

  AL_MUX u_en0 (.i0(q),.i1(d),.sel(en),.o(enout));
  AL_DFF u_seq0 (.clk(clk),.d(setout),.reset(reset),.set(1'b0),.q(q));
  AL_MUX u_set0 (.i0(enout),.i1(1'b1),.sel(set),.o(setout));

endmodule 

module reg_ar_as_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  wire enout;

  AL_MUX u_en0 (.i0(q),.i1(d),.sel(en),.o(enout));
  AL_DFF u_seq0 (.clk(clk),.d(enout),.reset(reset),.set(set),.q(q));

endmodule 

module binary_mux_s1_w1
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_mux_b0_0 (.i0(i0),.i1(i1),.sel(sel),.o(o));

endmodule 

module add_pu2_pu2_o2
  (
  i0,
  i1,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  output [1:0] o;

  wire net_a0;
  wire net_a1;
  wire net_b0;
  wire net_b1;
  wire net_cout0;
  wire net_cout1;
  wire net_sum0;
  wire net_sum1;

  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (.a(net_a0),.b(net_b0),.c(1'b0),.cout(net_cout0),.sum(net_sum0));
  AL_FADD comp_1 (.a(net_a1),.b(net_b1),.c(net_cout0),.cout(net_cout1),.sum(net_sum1));

endmodule 

module add_pu3_pu3_o3
  (
  i0,
  i1,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  output [2:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;

  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (.a(net_a0),.b(net_b0),.c(1'b0),.cout(net_cout0),.sum(net_sum0));
  AL_FADD comp_1 (.a(net_a1),.b(net_b1),.c(net_cout0),.cout(net_cout1),.sum(net_sum1));
  AL_FADD comp_2 (.a(net_a2),.b(net_b2),.c(net_cout1),.cout(net_cout2),.sum(net_sum2));

endmodule 

module binary_mux_s2_w1
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input i0;
  input i1;
  input i2;
  input i3;
  input [1:0] sel;
  output o;

  wire net_0_b0_0;
  wire net_1_b0_0;

  AL_MUX al_mux_b0_0 (.i0(net_0_b0_0),.i1(net_1_b0_0),.sel(sel[1]),.o(o));
  AL_MUX al_mux_b0_1 (.i0(i0),.i1(i1),.sel(sel[0]),.o(net_0_b0_0));
  AL_MUX al_mux_b0_2 (.i0(i2),.i1(i3),.sel(sel[0]),.o(net_1_b0_0));

endmodule 

module add_pu9_pu9_o9
  (
  i0,
  i1,
  o
  );

  input [8:0] i0;
  input [8:0] i1;
  output [8:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;

  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (.a(net_a0),.b(net_b0),.c(1'b0),.cout(net_cout0),.sum(net_sum0));
  AL_FADD comp_1 (.a(net_a1),.b(net_b1),.c(net_cout0),.cout(net_cout1),.sum(net_sum1));
  AL_FADD comp_2 (.a(net_a2),.b(net_b2),.c(net_cout1),.cout(net_cout2),.sum(net_sum2));
  AL_FADD comp_3 (.a(net_a3),.b(net_b3),.c(net_cout2),.cout(net_cout3),.sum(net_sum3));
  AL_FADD comp_4 (.a(net_a4),.b(net_b4),.c(net_cout3),.cout(net_cout4),.sum(net_sum4));
  AL_FADD comp_5 (.a(net_a5),.b(net_b5),.c(net_cout4),.cout(net_cout5),.sum(net_sum5));
  AL_FADD comp_6 (.a(net_a6),.b(net_b6),.c(net_cout5),.cout(net_cout6),.sum(net_sum6));
  AL_FADD comp_7 (.a(net_a7),.b(net_b7),.c(net_cout6),.cout(net_cout7),.sum(net_sum7));
  AL_FADD comp_8 (.a(net_a8),.b(net_b8),.c(net_cout7),.cout(net_cout8),.sum(net_sum8));

endmodule 

module add_pu8_pu8_o8
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output [7:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_b0;
  wire net_b1;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_cout0;
  wire net_cout1;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_sum0;
  wire net_sum1;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;

  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (.a(net_a0),.b(net_b0),.c(1'b0),.cout(net_cout0),.sum(net_sum0));
  AL_FADD comp_1 (.a(net_a1),.b(net_b1),.c(net_cout0),.cout(net_cout1),.sum(net_sum1));
  AL_FADD comp_2 (.a(net_a2),.b(net_b2),.c(net_cout1),.cout(net_cout2),.sum(net_sum2));
  AL_FADD comp_3 (.a(net_a3),.b(net_b3),.c(net_cout2),.cout(net_cout3),.sum(net_sum3));
  AL_FADD comp_4 (.a(net_a4),.b(net_b4),.c(net_cout3),.cout(net_cout4),.sum(net_sum4));
  AL_FADD comp_5 (.a(net_a5),.b(net_b5),.c(net_cout4),.cout(net_cout5),.sum(net_sum5));
  AL_FADD comp_6 (.a(net_a6),.b(net_b6),.c(net_cout5),.cout(net_cout6),.sum(net_sum6));
  AL_FADD comp_7 (.a(net_a7),.b(net_b7),.c(net_cout6),.cout(net_cout7),.sum(net_sum7));

endmodule 

module add_pu13_pu13_o13
  (
  i0,
  i1,
  o
  );

  input [12:0] i0;
  input [12:0] i1;
  output [12:0] o;

  wire net_a0;
  wire net_a1;
  wire net_a10;
  wire net_a11;
  wire net_a12;
  wire net_a2;
  wire net_a3;
  wire net_a4;
  wire net_a5;
  wire net_a6;
  wire net_a7;
  wire net_a8;
  wire net_a9;
  wire net_b0;
  wire net_b1;
  wire net_b10;
  wire net_b11;
  wire net_b12;
  wire net_b2;
  wire net_b3;
  wire net_b4;
  wire net_b5;
  wire net_b6;
  wire net_b7;
  wire net_b8;
  wire net_b9;
  wire net_cout0;
  wire net_cout1;
  wire net_cout10;
  wire net_cout11;
  wire net_cout12;
  wire net_cout2;
  wire net_cout3;
  wire net_cout4;
  wire net_cout5;
  wire net_cout6;
  wire net_cout7;
  wire net_cout8;
  wire net_cout9;
  wire net_sum0;
  wire net_sum1;
  wire net_sum10;
  wire net_sum11;
  wire net_sum12;
  wire net_sum2;
  wire net_sum3;
  wire net_sum4;
  wire net_sum5;
  wire net_sum6;
  wire net_sum7;
  wire net_sum8;
  wire net_sum9;

  assign net_a12 = i0[12];
  assign net_a11 = i0[11];
  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b12 = i1[12];
  assign net_b11 = i1[11];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[12] = net_sum12;
  assign o[11] = net_sum11;
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD comp_0 (.a(net_a0),.b(net_b0),.c(1'b0),.cout(net_cout0),.sum(net_sum0));
  AL_FADD comp_1 (.a(net_a1),.b(net_b1),.c(net_cout0),.cout(net_cout1),.sum(net_sum1));
  AL_FADD comp_10 (.a(net_a10),.b(net_b10),.c(net_cout9),.cout(net_cout10),.sum(net_sum10));
  AL_FADD comp_11 (.a(net_a11),.b(net_b11),.c(net_cout10),.cout(net_cout11),.sum(net_sum11));
  AL_FADD comp_12 (.a(net_a12),.b(net_b12),.c(net_cout11),.cout(net_cout12),.sum(net_sum12));
  AL_FADD comp_2 (.a(net_a2),.b(net_b2),.c(net_cout1),.cout(net_cout2),.sum(net_sum2));
  AL_FADD comp_3 (.a(net_a3),.b(net_b3),.c(net_cout2),.cout(net_cout3),.sum(net_sum3));
  AL_FADD comp_4 (.a(net_a4),.b(net_b4),.c(net_cout3),.cout(net_cout4),.sum(net_sum4));
  AL_FADD comp_5 (.a(net_a5),.b(net_b5),.c(net_cout4),.cout(net_cout5),.sum(net_sum5));
  AL_FADD comp_6 (.a(net_a6),.b(net_b6),.c(net_cout5),.cout(net_cout6),.sum(net_sum6));
  AL_FADD comp_7 (.a(net_a7),.b(net_b7),.c(net_cout6),.cout(net_cout7),.sum(net_sum7));
  AL_FADD comp_8 (.a(net_a8),.b(net_b8),.c(net_cout7),.cout(net_cout8),.sum(net_sum8));
  AL_FADD comp_9 (.a(net_a9),.b(net_b9),.c(net_cout8),.cout(net_cout9),.sum(net_sum9));

endmodule 

module lt_u9_u9
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [8:0] i0;
  input [8:0] i1;
  output o;

  wire a_0;
  wire a_1;
  wire a_2;
  wire a_3;
  wire a_4;
  wire a_5;
  wire a_6;
  wire a_7;
  wire a_8;
  wire b_0;
  wire b_1;
  wire b_2;
  wire b_3;
  wire b_4;
  wire b_5;
  wire b_6;
  wire b_7;
  wire b_8;
  wire diff_0;
  wire diff_1;
  wire diff_2;
  wire diff_3;
  wire diff_4;
  wire diff_5;
  wire diff_6;
  wire diff_7;
  wire diff_8;
  wire net_cin;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;
  wire o_6;
  wire o_7;
  wire o_8;

  assign net_cin = ci;
  assign a_8 = i0[8];
  assign a_7 = i0[7];
  assign a_6 = i0[6];
  assign a_5 = i0[5];
  assign a_4 = i0[4];
  assign a_3 = i0[3];
  assign a_2 = i0[2];
  assign a_1 = i0[1];
  assign a_0 = i0[0];
  assign b_8 = i1[8];
  assign b_7 = i1[7];
  assign b_6 = i1[6];
  assign b_5 = i1[5];
  assign b_4 = i1[4];
  assign b_3 = i1[3];
  assign b_2 = i1[2];
  assign b_1 = i1[1];
  assign b_0 = i1[0];
  assign o = o_8;
  AL_MUX mux_0 (.i0(net_cin),.i1(b_0),.sel(diff_0),.o(o_0));
  AL_MUX mux_1 (.i0(o_0),.i1(b_1),.sel(diff_1),.o(o_1));
  AL_MUX mux_2 (.i0(o_1),.i1(b_2),.sel(diff_2),.o(o_2));
  AL_MUX mux_3 (.i0(o_2),.i1(b_3),.sel(diff_3),.o(o_3));
  AL_MUX mux_4 (.i0(o_3),.i1(b_4),.sel(diff_4),.o(o_4));
  AL_MUX mux_5 (.i0(o_4),.i1(b_5),.sel(diff_5),.o(o_5));
  AL_MUX mux_6 (.i0(o_5),.i1(b_6),.sel(diff_6),.o(o_6));
  AL_MUX mux_7 (.i0(o_6),.i1(b_7),.sel(diff_7),.o(o_7));
  AL_MUX mux_8 (.i0(o_7),.i1(b_8),.sel(diff_8),.o(o_8));
  xor xor_0 (diff_0, a_0, b_0);
  xor xor_1 (diff_1, a_1, b_1);
  xor xor_2 (diff_2, a_2, b_2);
  xor xor_3 (diff_3, a_3, b_3);
  xor xor_4 (diff_4, a_4, b_4);
  xor xor_5 (diff_5, a_5, b_5);
  xor xor_6 (diff_6, a_6, b_6);
  xor xor_7 (diff_7, a_7, b_7);
  xor xor_8 (diff_8, a_8, b_8);

endmodule 

module AL_MUX
  (
  input i0,
  input i1,
  input sel,
  output o
  );

  wire not_sel, sel_i0, sel_i1;
  not u0 (not_sel, sel);
  and u1 (sel_i1, sel, i1);
  and u2 (sel_i0, not_sel, i0);
  or u3 (o, sel_i1, sel_i0);

endmodule

module AL_DFF
  (
  input reset,
  input set,
  input clk,
  input d,
  output reg q
  );

  parameter INI = 1'b0;

  tri0 gsrn = glbl.gsrn;

  always @(gsrn)
  begin
    if(!gsrn)
      assign q = INI;
    else
      deassign q;
  end

  always @(posedge reset or posedge set or posedge clk)
  begin
    if (reset)
      q <= 1'b0;
    else if (set)
      q <= 1'b1;
    else
      q <= d;
  end

endmodule

module AL_FADD
  (
  input a,
  input b,
  input c,
  output sum,
  output cout
  );

  wire prop;
  wire not_prop;
  wire sel_i0;
  wire sel_i1;

  xor u0 (prop, a, b);
  xor u1 (sum, prop, c);
  not u2 (not_prop, prop);
  and u3 (sel_i1, prop, c);
  and u4 (sel_i0, not_prop, a);
  or  u5 (cout, sel_i0, sel_i1);

endmodule

