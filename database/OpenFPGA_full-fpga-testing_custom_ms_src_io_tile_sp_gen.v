// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module io_sbcb_wc(
    input [79:0] io_ipin_in,
    input [31:0] io_ipin_config,
    input [197:0] io_chanxy_in,
    input [89:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[59:0] io_chanxy_out);

  wire[59:0] T0;
  wire[59:0] T1;
  wire[58:0] T2;
  wire[58:0] T3;
  wire[57:0] T4;
  wire[57:0] T5;
  wire[56:0] T6;
  wire[56:0] T7;
  wire[55:0] T8;
  wire[55:0] T9;
  wire[54:0] T10;
  wire[54:0] T11;
  wire[53:0] T12;
  wire[53:0] T13;
  wire[52:0] T14;
  wire[52:0] T15;
  wire[51:0] T16;
  wire[51:0] T17;
  wire[50:0] T18;
  wire[50:0] T19;
  wire[49:0] T20;
  wire[49:0] T21;
  wire[48:0] T22;
  wire[48:0] T23;
  wire[47:0] T24;
  wire[47:0] T25;
  wire[46:0] T26;
  wire[46:0] T27;
  wire[45:0] T28;
  wire[45:0] T29;
  wire[44:0] T30;
  wire[44:0] T31;
  wire[43:0] T32;
  wire[43:0] T33;
  wire[42:0] T34;
  wire[42:0] T35;
  wire[41:0] T36;
  wire[41:0] T37;
  wire[40:0] T38;
  wire[40:0] T39;
  wire[39:0] T40;
  wire[39:0] T41;
  wire[38:0] T42;
  wire[38:0] T43;
  wire[37:0] T44;
  wire[37:0] T45;
  wire[36:0] T46;
  wire[36:0] T47;
  wire[35:0] T48;
  wire[35:0] T49;
  wire[34:0] T50;
  wire[34:0] T51;
  wire[33:0] T52;
  wire[33:0] T53;
  wire[32:0] T54;
  wire[32:0] T55;
  wire[31:0] T56;
  wire[31:0] T57;
  wire[30:0] T58;
  wire[30:0] T59;
  wire[29:0] T60;
  wire[29:0] T61;
  wire[28:0] T62;
  wire[28:0] T63;
  wire[27:0] T64;
  wire[27:0] T65;
  wire[26:0] T66;
  wire[26:0] T67;
  wire[25:0] T68;
  wire[25:0] T69;
  wire[24:0] T70;
  wire[24:0] T71;
  wire[23:0] T72;
  wire[23:0] T73;
  wire[22:0] T74;
  wire[22:0] T75;
  wire[21:0] T76;
  wire[21:0] T77;
  wire[20:0] T78;
  wire[20:0] T79;
  wire[19:0] T80;
  wire[19:0] T81;
  wire[18:0] T82;
  wire[18:0] T83;
  wire[17:0] T84;
  wire[17:0] T85;
  wire[16:0] T86;
  wire[16:0] T87;
  wire[15:0] T88;
  wire[15:0] T89;
  wire[14:0] T90;
  wire[14:0] T91;
  wire[13:0] T92;
  wire[13:0] T93;
  wire[12:0] T94;
  wire[12:0] T95;
  wire[11:0] T96;
  wire[11:0] T97;
  wire[10:0] T98;
  wire[10:0] T99;
  wire[9:0] T100;
  wire[9:0] T101;
  wire[8:0] T102;
  wire[8:0] T103;
  wire[7:0] T104;
  wire[7:0] T105;
  wire[6:0] T106;
  wire[6:0] T107;
  wire[5:0] T108;
  wire[5:0] T109;
  wire[4:0] T110;
  wire[4:0] T111;
  wire[3:0] T112;
  wire[3:0] T113;
  wire[2:0] T114;
  wire[2:0] T115;
  wire[1:0] T116;
  wire[1:0] T117;
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire[1:0] T124;
  wire[1:0] T125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  wire T130;
  wire T131;
  wire[1:0] T132;
  wire[1:0] T133;
  wire T134;
  wire T135;
  wire T136;
  wire[3:0] T137;
  wire[3:0] T138;
  wire[3:0] T139;
  wire[8:0] T140;
  wire[8:0] T141;
  wire T142;
  wire T143;
  wire T144;
  wire T145;
  wire T146;
  wire T147;
  wire[1:0] T148;
  wire[1:0] T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  wire[1:0] T156;
  wire[1:0] T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire T162;
  wire T163;
  wire[1:0] T164;
  wire[1:0] T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  wire T170;
  wire T171;
  wire[1:0] T172;
  wire[1:0] T173;
  wire T174;
  wire T175;
  wire T176;
  wire[3:0] T177;
  wire[3:0] T178;
  wire[3:0] T179;
  wire[8:0] T180;
  wire[8:0] T181;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire T186;
  wire T187;
  wire[1:0] T188;
  wire[1:0] T189;
  wire T190;
  wire T191;
  wire T192;
  wire T193;
  wire T194;
  wire T195;
  wire[1:0] T196;
  wire[1:0] T197;
  wire T198;
  wire T199;
  wire T200;
  wire T201;
  wire T202;
  wire T203;
  wire[1:0] T204;
  wire[1:0] T205;
  wire T206;
  wire T207;
  wire T208;
  wire T209;
  wire T210;
  wire T211;
  wire[1:0] T212;
  wire[1:0] T213;
  wire T214;
  wire T215;
  wire T216;
  wire[3:0] T217;
  wire[3:0] T218;
  wire[3:0] T219;
  wire[8:0] T220;
  wire[8:0] T221;
  wire T222;
  wire T223;
  wire T224;
  wire T225;
  wire T226;
  wire T227;
  wire[1:0] T228;
  wire[1:0] T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire[1:0] T236;
  wire[1:0] T237;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire T242;
  wire T243;
  wire[1:0] T244;
  wire[1:0] T245;
  wire T246;
  wire T247;
  wire T248;
  wire T249;
  wire T250;
  wire T251;
  wire[1:0] T252;
  wire[1:0] T253;
  wire T254;
  wire T255;
  wire T256;
  wire[3:0] T257;
  wire[3:0] T258;
  wire[3:0] T259;
  wire[8:0] T260;
  wire[8:0] T261;
  wire T262;
  wire T263;
  wire T264;
  wire T265;
  wire T266;
  wire T267;
  wire[1:0] T268;
  wire[1:0] T269;
  wire T270;
  wire T271;
  wire T272;
  wire T273;
  wire T274;
  wire T275;
  wire[1:0] T276;
  wire[1:0] T277;
  wire T278;
  wire T279;
  wire T280;
  wire T281;
  wire T282;
  wire T283;
  wire[1:0] T284;
  wire[1:0] T285;
  wire T286;
  wire T287;
  wire T288;
  wire T289;
  wire T290;
  wire T291;
  wire[1:0] T292;
  wire[1:0] T293;
  wire T294;
  wire T295;
  wire T296;
  wire[3:0] T297;
  wire[3:0] T298;
  wire[3:0] T299;
  wire[8:0] T300;
  wire[8:0] T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire T306;
  wire T307;
  wire[1:0] T308;
  wire[1:0] T309;
  wire T310;
  wire T311;
  wire T312;
  wire T313;
  wire T314;
  wire T315;
  wire[1:0] T316;
  wire[1:0] T317;
  wire T318;
  wire T319;
  wire T320;
  wire T321;
  wire T322;
  wire T323;
  wire[1:0] T324;
  wire[1:0] T325;
  wire T326;
  wire T327;
  wire T328;
  wire T329;
  wire T330;
  wire T331;
  wire[1:0] T332;
  wire[1:0] T333;
  wire T334;
  wire T335;
  wire T336;
  wire[3:0] T337;
  wire[3:0] T338;
  wire[3:0] T339;
  wire[8:0] T340;
  wire[8:0] T341;
  wire T342;
  wire T343;
  wire T344;
  wire T345;
  wire T346;
  wire T347;
  wire[1:0] T348;
  wire[1:0] T349;
  wire T350;
  wire T351;
  wire T352;
  wire T353;
  wire T354;
  wire T355;
  wire[1:0] T356;
  wire[1:0] T357;
  wire T358;
  wire T359;
  wire T360;
  wire T361;
  wire T362;
  wire T363;
  wire[1:0] T364;
  wire[1:0] T365;
  wire T366;
  wire T367;
  wire T368;
  wire T369;
  wire T370;
  wire T371;
  wire[1:0] T372;
  wire[1:0] T373;
  wire T374;
  wire T375;
  wire T376;
  wire[3:0] T377;
  wire[3:0] T378;
  wire[3:0] T379;
  wire[8:0] T380;
  wire[8:0] T381;
  wire T382;
  wire T383;
  wire T384;
  wire T385;
  wire T386;
  wire T387;
  wire[1:0] T388;
  wire[1:0] T389;
  wire T390;
  wire T391;
  wire T392;
  wire T393;
  wire T394;
  wire T395;
  wire[1:0] T396;
  wire[1:0] T397;
  wire T398;
  wire T399;
  wire T400;
  wire T401;
  wire T402;
  wire T403;
  wire[1:0] T404;
  wire[1:0] T405;
  wire T406;
  wire T407;
  wire T408;
  wire T409;
  wire T410;
  wire T411;
  wire[1:0] T412;
  wire[1:0] T413;
  wire T414;
  wire T415;
  wire T416;
  wire[3:0] T417;
  wire[3:0] T418;
  wire[3:0] T419;
  wire[8:0] T420;
  wire[8:0] T421;
  wire T422;
  wire T423;
  wire T424;
  wire T425;
  wire T426;
  wire T427;
  wire[1:0] T428;
  wire[1:0] T429;
  wire T430;
  wire T431;
  wire T432;
  wire T433;
  wire T434;
  wire T435;
  wire[1:0] T436;
  wire[1:0] T437;
  wire T438;
  wire T439;
  wire T440;
  wire T441;
  wire T442;
  wire T443;
  wire[1:0] T444;
  wire[1:0] T445;
  wire T446;
  wire T447;
  wire T448;
  wire T449;
  wire T450;
  wire T451;
  wire[1:0] T452;
  wire[1:0] T453;
  wire T454;
  wire T455;
  wire T456;
  wire[3:0] T457;
  wire[3:0] T458;
  wire[3:0] T459;
  wire[8:0] T460;
  wire[8:0] T461;
  wire T462;
  wire T463;
  wire T464;
  wire T465;
  wire T466;
  wire T467;
  wire[1:0] T468;
  wire[1:0] T469;
  wire T470;
  wire T471;
  wire T472;
  wire T473;
  wire T474;
  wire T475;
  wire[1:0] T476;
  wire[1:0] T477;
  wire T478;
  wire T479;
  wire T480;
  wire T481;
  wire T482;
  wire T483;
  wire[1:0] T484;
  wire[1:0] T485;
  wire T486;
  wire T487;
  wire T488;
  wire T489;
  wire T490;
  wire T491;
  wire[1:0] T492;
  wire[1:0] T493;
  wire T494;
  wire T495;
  wire T496;
  wire[2:0] T497;
  wire[2:0] T498;
  wire[2:0] T499;
  wire[7:0] T500;
  wire[7:0] T501;
  wire T502;
  wire T503;
  wire T504;
  wire T505;
  wire T506;
  wire T507;
  wire[1:0] T508;
  wire[1:0] T509;
  wire T510;
  wire T511;
  wire T512;
  wire T513;
  wire T514;
  wire T515;
  wire[1:0] T516;
  wire[1:0] T517;
  wire T518;
  wire T519;
  wire T520;
  wire T521;
  wire T522;
  wire T523;
  wire[1:0] T524;
  wire[1:0] T525;
  wire T526;
  wire T527;
  wire T528;
  wire T529;
  wire T530;
  wire T531;
  wire[1:0] T532;
  wire[1:0] T533;
  wire T534;
  wire T535;
  wire T536;
  wire[2:0] T537;
  wire[2:0] T538;
  wire[2:0] T539;
  wire[7:0] T540;
  wire[7:0] T541;
  wire T542;
  wire T543;
  wire T544;
  wire T545;
  wire T546;
  wire T547;
  wire[1:0] T548;
  wire[1:0] T549;
  wire T550;
  wire T551;
  wire T552;
  wire T553;
  wire T554;
  wire T555;
  wire[1:0] T556;
  wire[1:0] T557;
  wire T558;
  wire T559;
  wire T560;
  wire T561;
  wire T562;
  wire T563;
  wire[1:0] T564;
  wire[1:0] T565;
  wire T566;
  wire T567;
  wire T568;
  wire T569;
  wire T570;
  wire T571;
  wire[2:0] T572;
  wire[2:0] T573;
  wire[2:0] T574;
  wire[7:0] T575;
  wire[7:0] T576;
  wire T577;
  wire T578;
  wire T579;
  wire T580;
  wire T581;
  wire T582;
  wire[7:0] T583;
  wire[7:0] T584;
  wire[6:0] T585;
  wire[6:0] T586;
  wire[5:0] T587;
  wire[5:0] T588;
  wire[4:0] T589;
  wire[4:0] T590;
  wire[3:0] T591;
  wire[3:0] T592;
  wire[2:0] T593;
  wire[2:0] T594;
  wire[1:0] T595;
  wire[1:0] T596;
  wire T597;
  wire T598;
  wire T599;
  wire[9:0] T600;
  wire[9:0] T601;
  wire[9:0] T602;
  wire[3:0] T603;
  wire[9:0] T604;
  wire[9:0] T605;
  wire T606;
  wire T607;
  wire T608;
  wire[9:0] T609;
  wire[9:0] T610;
  wire[9:0] T611;
  wire[3:0] T612;
  wire[9:0] T613;
  wire[9:0] T614;
  wire T615;
  wire T616;
  wire T617;
  wire[9:0] T618;
  wire[9:0] T619;
  wire[9:0] T620;
  wire[3:0] T621;
  wire[9:0] T622;
  wire[9:0] T623;
  wire T624;
  wire T625;
  wire T626;
  wire[9:0] T627;
  wire[9:0] T628;
  wire[9:0] T629;
  wire[3:0] T630;
  wire[9:0] T631;
  wire[9:0] T632;
  wire T633;
  wire T634;
  wire T635;
  wire[9:0] T636;
  wire[9:0] T637;
  wire[9:0] T638;
  wire[3:0] T639;
  wire[9:0] T640;
  wire[9:0] T641;
  wire T642;
  wire T643;
  wire T644;
  wire[9:0] T645;
  wire[9:0] T646;
  wire[9:0] T647;
  wire[3:0] T648;
  wire[9:0] T649;
  wire[9:0] T650;
  wire T651;
  wire T652;
  wire T653;
  wire[9:0] T654;
  wire[9:0] T655;
  wire[9:0] T656;
  wire[3:0] T657;
  wire[9:0] T658;
  wire[9:0] T659;
  wire T660;
  wire T661;
  wire T662;
  wire[9:0] T663;
  wire[9:0] T664;
  wire[9:0] T665;
  wire[3:0] T666;
  wire[9:0] T667;
  wire[9:0] T668;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T580, T2};
  assign T2 = T3;
  assign T3 = {T577, T4};
  assign T4 = T5;
  assign T5 = {T569, T6};
  assign T6 = T7;
  assign T7 = {T566, T8};
  assign T8 = T9;
  assign T9 = {T558, T10};
  assign T10 = T11;
  assign T11 = {T550, T12};
  assign T12 = T13;
  assign T13 = {T542, T14};
  assign T14 = T15;
  assign T15 = {T534, T16};
  assign T16 = T17;
  assign T17 = {T526, T18};
  assign T18 = T19;
  assign T19 = {T518, T20};
  assign T20 = T21;
  assign T21 = {T510, T22};
  assign T22 = T23;
  assign T23 = {T502, T24};
  assign T24 = T25;
  assign T25 = {T494, T26};
  assign T26 = T27;
  assign T27 = {T486, T28};
  assign T28 = T29;
  assign T29 = {T478, T30};
  assign T30 = T31;
  assign T31 = {T470, T32};
  assign T32 = T33;
  assign T33 = {T462, T34};
  assign T34 = T35;
  assign T35 = {T454, T36};
  assign T36 = T37;
  assign T37 = {T446, T38};
  assign T38 = T39;
  assign T39 = {T438, T40};
  assign T40 = T41;
  assign T41 = {T430, T42};
  assign T42 = T43;
  assign T43 = {T422, T44};
  assign T44 = T45;
  assign T45 = {T414, T46};
  assign T46 = T47;
  assign T47 = {T406, T48};
  assign T48 = T49;
  assign T49 = {T398, T50};
  assign T50 = T51;
  assign T51 = {T390, T52};
  assign T52 = T53;
  assign T53 = {T382, T54};
  assign T54 = T55;
  assign T55 = {T374, T56};
  assign T56 = T57;
  assign T57 = {T366, T58};
  assign T58 = T59;
  assign T59 = {T358, T60};
  assign T60 = T61;
  assign T61 = {T350, T62};
  assign T62 = T63;
  assign T63 = {T342, T64};
  assign T64 = T65;
  assign T65 = {T334, T66};
  assign T66 = T67;
  assign T67 = {T326, T68};
  assign T68 = T69;
  assign T69 = {T318, T70};
  assign T70 = T71;
  assign T71 = {T310, T72};
  assign T72 = T73;
  assign T73 = {T302, T74};
  assign T74 = T75;
  assign T75 = {T294, T76};
  assign T76 = T77;
  assign T77 = {T286, T78};
  assign T78 = T79;
  assign T79 = {T278, T80};
  assign T80 = T81;
  assign T81 = {T270, T82};
  assign T82 = T83;
  assign T83 = {T262, T84};
  assign T84 = T85;
  assign T85 = {T254, T86};
  assign T86 = T87;
  assign T87 = {T246, T88};
  assign T88 = T89;
  assign T89 = {T238, T90};
  assign T90 = T91;
  assign T91 = {T230, T92};
  assign T92 = T93;
  assign T93 = {T222, T94};
  assign T94 = T95;
  assign T95 = {T214, T96};
  assign T96 = T97;
  assign T97 = {T206, T98};
  assign T98 = T99;
  assign T99 = {T198, T100};
  assign T100 = T101;
  assign T101 = {T190, T102};
  assign T102 = T103;
  assign T103 = {T182, T104};
  assign T104 = T105;
  assign T105 = {T174, T106};
  assign T106 = T107;
  assign T107 = {T166, T108};
  assign T108 = T109;
  assign T109 = {T158, T110};
  assign T110 = T111;
  assign T111 = {T150, T112};
  assign T112 = T113;
  assign T113 = {T142, T114};
  assign T114 = T115;
  assign T115 = {T134, T116};
  assign T116 = T117;
  assign T117 = {T126, T118};
  assign T118 = T119;
  assign T119 = T120;
  assign T120 = T124[T121];
  assign T121 = T122;
  assign T122 = T123;
  assign T123 = io_chanxy_config[1'h0/* 0*/:1'h0/* 0*/];
  assign T124 = T125;
  assign T125 = io_chanxy_in[1'h1/* 1*/:1'h0/* 0*/];
  assign T126 = T127;
  assign T127 = T128;
  assign T128 = T132[T129];
  assign T129 = T130;
  assign T130 = T131;
  assign T131 = io_chanxy_config[1'h1/* 1*/:1'h1/* 1*/];
  assign T132 = T133;
  assign T133 = io_chanxy_in[2'h3/* 3*/:2'h2/* 2*/];
  assign T134 = T135;
  assign T135 = T136;
  assign T136 = T140[T137];
  assign T137 = T138;
  assign T138 = T139;
  assign T139 = io_chanxy_config[3'h5/* 5*/:2'h2/* 2*/];
  assign T140 = T141;
  assign T141 = io_chanxy_in[4'hc/* 12*/:3'h4/* 4*/];
  assign T142 = T143;
  assign T143 = T144;
  assign T144 = T148[T145];
  assign T145 = T146;
  assign T146 = T147;
  assign T147 = io_chanxy_config[3'h6/* 6*/:3'h6/* 6*/];
  assign T148 = T149;
  assign T149 = io_chanxy_in[4'he/* 14*/:4'hd/* 13*/];
  assign T150 = T151;
  assign T151 = T152;
  assign T152 = T156[T153];
  assign T153 = T154;
  assign T154 = T155;
  assign T155 = io_chanxy_config[3'h7/* 7*/:3'h7/* 7*/];
  assign T156 = T157;
  assign T157 = io_chanxy_in[5'h10/* 16*/:4'hf/* 15*/];
  assign T158 = T159;
  assign T159 = T160;
  assign T160 = T164[T161];
  assign T161 = T162;
  assign T162 = T163;
  assign T163 = io_chanxy_config[4'h8/* 8*/:4'h8/* 8*/];
  assign T164 = T165;
  assign T165 = io_chanxy_in[5'h12/* 18*/:5'h11/* 17*/];
  assign T166 = T167;
  assign T167 = T168;
  assign T168 = T172[T169];
  assign T169 = T170;
  assign T170 = T171;
  assign T171 = io_chanxy_config[4'h9/* 9*/:4'h9/* 9*/];
  assign T172 = T173;
  assign T173 = io_chanxy_in[5'h14/* 20*/:5'h13/* 19*/];
  assign T174 = T175;
  assign T175 = T176;
  assign T176 = T180[T177];
  assign T177 = T178;
  assign T178 = T179;
  assign T179 = io_chanxy_config[4'hd/* 13*/:4'ha/* 10*/];
  assign T180 = T181;
  assign T181 = io_chanxy_in[5'h1d/* 29*/:5'h15/* 21*/];
  assign T182 = T183;
  assign T183 = T184;
  assign T184 = T188[T185];
  assign T185 = T186;
  assign T186 = T187;
  assign T187 = io_chanxy_config[4'he/* 14*/:4'he/* 14*/];
  assign T188 = T189;
  assign T189 = io_chanxy_in[5'h1f/* 31*/:5'h1e/* 30*/];
  assign T190 = T191;
  assign T191 = T192;
  assign T192 = T196[T193];
  assign T193 = T194;
  assign T194 = T195;
  assign T195 = io_chanxy_config[4'hf/* 15*/:4'hf/* 15*/];
  assign T196 = T197;
  assign T197 = io_chanxy_in[6'h21/* 33*/:6'h20/* 32*/];
  assign T198 = T199;
  assign T199 = T200;
  assign T200 = T204[T201];
  assign T201 = T202;
  assign T202 = T203;
  assign T203 = io_chanxy_config[5'h10/* 16*/:5'h10/* 16*/];
  assign T204 = T205;
  assign T205 = io_chanxy_in[6'h23/* 35*/:6'h22/* 34*/];
  assign T206 = T207;
  assign T207 = T208;
  assign T208 = T212[T209];
  assign T209 = T210;
  assign T210 = T211;
  assign T211 = io_chanxy_config[5'h11/* 17*/:5'h11/* 17*/];
  assign T212 = T213;
  assign T213 = io_chanxy_in[6'h25/* 37*/:6'h24/* 36*/];
  assign T214 = T215;
  assign T215 = T216;
  assign T216 = T220[T217];
  assign T217 = T218;
  assign T218 = T219;
  assign T219 = io_chanxy_config[5'h15/* 21*/:5'h12/* 18*/];
  assign T220 = T221;
  assign T221 = io_chanxy_in[6'h2e/* 46*/:6'h26/* 38*/];
  assign T222 = T223;
  assign T223 = T224;
  assign T224 = T228[T225];
  assign T225 = T226;
  assign T226 = T227;
  assign T227 = io_chanxy_config[5'h16/* 22*/:5'h16/* 22*/];
  assign T228 = T229;
  assign T229 = io_chanxy_in[6'h30/* 48*/:6'h2f/* 47*/];
  assign T230 = T231;
  assign T231 = T232;
  assign T232 = T236[T233];
  assign T233 = T234;
  assign T234 = T235;
  assign T235 = io_chanxy_config[5'h17/* 23*/:5'h17/* 23*/];
  assign T236 = T237;
  assign T237 = io_chanxy_in[6'h32/* 50*/:6'h31/* 49*/];
  assign T238 = T239;
  assign T239 = T240;
  assign T240 = T244[T241];
  assign T241 = T242;
  assign T242 = T243;
  assign T243 = io_chanxy_config[5'h18/* 24*/:5'h18/* 24*/];
  assign T244 = T245;
  assign T245 = io_chanxy_in[6'h34/* 52*/:6'h33/* 51*/];
  assign T246 = T247;
  assign T247 = T248;
  assign T248 = T252[T249];
  assign T249 = T250;
  assign T250 = T251;
  assign T251 = io_chanxy_config[5'h19/* 25*/:5'h19/* 25*/];
  assign T252 = T253;
  assign T253 = io_chanxy_in[6'h36/* 54*/:6'h35/* 53*/];
  assign T254 = T255;
  assign T255 = T256;
  assign T256 = T260[T257];
  assign T257 = T258;
  assign T258 = T259;
  assign T259 = io_chanxy_config[5'h1d/* 29*/:5'h1a/* 26*/];
  assign T260 = T261;
  assign T261 = io_chanxy_in[6'h3f/* 63*/:6'h37/* 55*/];
  assign T262 = T263;
  assign T263 = T264;
  assign T264 = T268[T265];
  assign T265 = T266;
  assign T266 = T267;
  assign T267 = io_chanxy_config[5'h1e/* 30*/:5'h1e/* 30*/];
  assign T268 = T269;
  assign T269 = io_chanxy_in[7'h41/* 65*/:7'h40/* 64*/];
  assign T270 = T271;
  assign T271 = T272;
  assign T272 = T276[T273];
  assign T273 = T274;
  assign T274 = T275;
  assign T275 = io_chanxy_config[5'h1f/* 31*/:5'h1f/* 31*/];
  assign T276 = T277;
  assign T277 = io_chanxy_in[7'h43/* 67*/:7'h42/* 66*/];
  assign T278 = T279;
  assign T279 = T280;
  assign T280 = T284[T281];
  assign T281 = T282;
  assign T282 = T283;
  assign T283 = io_chanxy_config[6'h20/* 32*/:6'h20/* 32*/];
  assign T284 = T285;
  assign T285 = io_chanxy_in[7'h45/* 69*/:7'h44/* 68*/];
  assign T286 = T287;
  assign T287 = T288;
  assign T288 = T292[T289];
  assign T289 = T290;
  assign T290 = T291;
  assign T291 = io_chanxy_config[6'h21/* 33*/:6'h21/* 33*/];
  assign T292 = T293;
  assign T293 = io_chanxy_in[7'h47/* 71*/:7'h46/* 70*/];
  assign T294 = T295;
  assign T295 = T296;
  assign T296 = T300[T297];
  assign T297 = T298;
  assign T298 = T299;
  assign T299 = io_chanxy_config[6'h25/* 37*/:6'h22/* 34*/];
  assign T300 = T301;
  assign T301 = io_chanxy_in[7'h50/* 80*/:7'h48/* 72*/];
  assign T302 = T303;
  assign T303 = T304;
  assign T304 = T308[T305];
  assign T305 = T306;
  assign T306 = T307;
  assign T307 = io_chanxy_config[6'h26/* 38*/:6'h26/* 38*/];
  assign T308 = T309;
  assign T309 = io_chanxy_in[7'h52/* 82*/:7'h51/* 81*/];
  assign T310 = T311;
  assign T311 = T312;
  assign T312 = T316[T313];
  assign T313 = T314;
  assign T314 = T315;
  assign T315 = io_chanxy_config[6'h27/* 39*/:6'h27/* 39*/];
  assign T316 = T317;
  assign T317 = io_chanxy_in[7'h54/* 84*/:7'h53/* 83*/];
  assign T318 = T319;
  assign T319 = T320;
  assign T320 = T324[T321];
  assign T321 = T322;
  assign T322 = T323;
  assign T323 = io_chanxy_config[6'h28/* 40*/:6'h28/* 40*/];
  assign T324 = T325;
  assign T325 = io_chanxy_in[7'h56/* 86*/:7'h55/* 85*/];
  assign T326 = T327;
  assign T327 = T328;
  assign T328 = T332[T329];
  assign T329 = T330;
  assign T330 = T331;
  assign T331 = io_chanxy_config[6'h29/* 41*/:6'h29/* 41*/];
  assign T332 = T333;
  assign T333 = io_chanxy_in[7'h58/* 88*/:7'h57/* 87*/];
  assign T334 = T335;
  assign T335 = T336;
  assign T336 = T340[T337];
  assign T337 = T338;
  assign T338 = T339;
  assign T339 = io_chanxy_config[6'h2d/* 45*/:6'h2a/* 42*/];
  assign T340 = T341;
  assign T341 = io_chanxy_in[7'h61/* 97*/:7'h59/* 89*/];
  assign T342 = T343;
  assign T343 = T344;
  assign T344 = T348[T345];
  assign T345 = T346;
  assign T346 = T347;
  assign T347 = io_chanxy_config[6'h2e/* 46*/:6'h2e/* 46*/];
  assign T348 = T349;
  assign T349 = io_chanxy_in[7'h63/* 99*/:7'h62/* 98*/];
  assign T350 = T351;
  assign T351 = T352;
  assign T352 = T356[T353];
  assign T353 = T354;
  assign T354 = T355;
  assign T355 = io_chanxy_config[6'h2f/* 47*/:6'h2f/* 47*/];
  assign T356 = T357;
  assign T357 = io_chanxy_in[7'h65/* 101*/:7'h64/* 100*/];
  assign T358 = T359;
  assign T359 = T360;
  assign T360 = T364[T361];
  assign T361 = T362;
  assign T362 = T363;
  assign T363 = io_chanxy_config[6'h30/* 48*/:6'h30/* 48*/];
  assign T364 = T365;
  assign T365 = io_chanxy_in[7'h67/* 103*/:7'h66/* 102*/];
  assign T366 = T367;
  assign T367 = T368;
  assign T368 = T372[T369];
  assign T369 = T370;
  assign T370 = T371;
  assign T371 = io_chanxy_config[6'h31/* 49*/:6'h31/* 49*/];
  assign T372 = T373;
  assign T373 = io_chanxy_in[7'h69/* 105*/:7'h68/* 104*/];
  assign T374 = T375;
  assign T375 = T376;
  assign T376 = T380[T377];
  assign T377 = T378;
  assign T378 = T379;
  assign T379 = io_chanxy_config[6'h35/* 53*/:6'h32/* 50*/];
  assign T380 = T381;
  assign T381 = io_chanxy_in[7'h72/* 114*/:7'h6a/* 106*/];
  assign T382 = T383;
  assign T383 = T384;
  assign T384 = T388[T385];
  assign T385 = T386;
  assign T386 = T387;
  assign T387 = io_chanxy_config[6'h36/* 54*/:6'h36/* 54*/];
  assign T388 = T389;
  assign T389 = io_chanxy_in[7'h74/* 116*/:7'h73/* 115*/];
  assign T390 = T391;
  assign T391 = T392;
  assign T392 = T396[T393];
  assign T393 = T394;
  assign T394 = T395;
  assign T395 = io_chanxy_config[6'h37/* 55*/:6'h37/* 55*/];
  assign T396 = T397;
  assign T397 = io_chanxy_in[7'h76/* 118*/:7'h75/* 117*/];
  assign T398 = T399;
  assign T399 = T400;
  assign T400 = T404[T401];
  assign T401 = T402;
  assign T402 = T403;
  assign T403 = io_chanxy_config[6'h38/* 56*/:6'h38/* 56*/];
  assign T404 = T405;
  assign T405 = io_chanxy_in[7'h78/* 120*/:7'h77/* 119*/];
  assign T406 = T407;
  assign T407 = T408;
  assign T408 = T412[T409];
  assign T409 = T410;
  assign T410 = T411;
  assign T411 = io_chanxy_config[6'h39/* 57*/:6'h39/* 57*/];
  assign T412 = T413;
  assign T413 = io_chanxy_in[7'h7a/* 122*/:7'h79/* 121*/];
  assign T414 = T415;
  assign T415 = T416;
  assign T416 = T420[T417];
  assign T417 = T418;
  assign T418 = T419;
  assign T419 = io_chanxy_config[6'h3d/* 61*/:6'h3a/* 58*/];
  assign T420 = T421;
  assign T421 = io_chanxy_in[8'h83/* 131*/:7'h7b/* 123*/];
  assign T422 = T423;
  assign T423 = T424;
  assign T424 = T428[T425];
  assign T425 = T426;
  assign T426 = T427;
  assign T427 = io_chanxy_config[6'h3e/* 62*/:6'h3e/* 62*/];
  assign T428 = T429;
  assign T429 = io_chanxy_in[8'h85/* 133*/:8'h84/* 132*/];
  assign T430 = T431;
  assign T431 = T432;
  assign T432 = T436[T433];
  assign T433 = T434;
  assign T434 = T435;
  assign T435 = io_chanxy_config[6'h3f/* 63*/:6'h3f/* 63*/];
  assign T436 = T437;
  assign T437 = io_chanxy_in[8'h87/* 135*/:8'h86/* 134*/];
  assign T438 = T439;
  assign T439 = T440;
  assign T440 = T444[T441];
  assign T441 = T442;
  assign T442 = T443;
  assign T443 = io_chanxy_config[7'h40/* 64*/:7'h40/* 64*/];
  assign T444 = T445;
  assign T445 = io_chanxy_in[8'h89/* 137*/:8'h88/* 136*/];
  assign T446 = T447;
  assign T447 = T448;
  assign T448 = T452[T449];
  assign T449 = T450;
  assign T450 = T451;
  assign T451 = io_chanxy_config[7'h41/* 65*/:7'h41/* 65*/];
  assign T452 = T453;
  assign T453 = io_chanxy_in[8'h8b/* 139*/:8'h8a/* 138*/];
  assign T454 = T455;
  assign T455 = T456;
  assign T456 = T460[T457];
  assign T457 = T458;
  assign T458 = T459;
  assign T459 = io_chanxy_config[7'h45/* 69*/:7'h42/* 66*/];
  assign T460 = T461;
  assign T461 = io_chanxy_in[8'h94/* 148*/:8'h8c/* 140*/];
  assign T462 = T463;
  assign T463 = T464;
  assign T464 = T468[T465];
  assign T465 = T466;
  assign T466 = T467;
  assign T467 = io_chanxy_config[7'h46/* 70*/:7'h46/* 70*/];
  assign T468 = T469;
  assign T469 = io_chanxy_in[8'h96/* 150*/:8'h95/* 149*/];
  assign T470 = T471;
  assign T471 = T472;
  assign T472 = T476[T473];
  assign T473 = T474;
  assign T474 = T475;
  assign T475 = io_chanxy_config[7'h47/* 71*/:7'h47/* 71*/];
  assign T476 = T477;
  assign T477 = io_chanxy_in[8'h98/* 152*/:8'h97/* 151*/];
  assign T478 = T479;
  assign T479 = T480;
  assign T480 = T484[T481];
  assign T481 = T482;
  assign T482 = T483;
  assign T483 = io_chanxy_config[7'h48/* 72*/:7'h48/* 72*/];
  assign T484 = T485;
  assign T485 = io_chanxy_in[8'h9a/* 154*/:8'h99/* 153*/];
  assign T486 = T487;
  assign T487 = T488;
  assign T488 = T492[T489];
  assign T489 = T490;
  assign T490 = T491;
  assign T491 = io_chanxy_config[7'h49/* 73*/:7'h49/* 73*/];
  assign T492 = T493;
  assign T493 = io_chanxy_in[8'h9c/* 156*/:8'h9b/* 155*/];
  assign T494 = T495;
  assign T495 = T496;
  assign T496 = T500[T497];
  assign T497 = T498;
  assign T498 = T499;
  assign T499 = io_chanxy_config[7'h4c/* 76*/:7'h4a/* 74*/];
  assign T500 = T501;
  assign T501 = io_chanxy_in[8'ha4/* 164*/:8'h9d/* 157*/];
  assign T502 = T503;
  assign T503 = T504;
  assign T504 = T508[T505];
  assign T505 = T506;
  assign T506 = T507;
  assign T507 = io_chanxy_config[7'h4d/* 77*/:7'h4d/* 77*/];
  assign T508 = T509;
  assign T509 = io_chanxy_in[8'ha6/* 166*/:8'ha5/* 165*/];
  assign T510 = T511;
  assign T511 = T512;
  assign T512 = T516[T513];
  assign T513 = T514;
  assign T514 = T515;
  assign T515 = io_chanxy_config[7'h4e/* 78*/:7'h4e/* 78*/];
  assign T516 = T517;
  assign T517 = io_chanxy_in[8'ha8/* 168*/:8'ha7/* 167*/];
  assign T518 = T519;
  assign T519 = T520;
  assign T520 = T524[T521];
  assign T521 = T522;
  assign T522 = T523;
  assign T523 = io_chanxy_config[7'h4f/* 79*/:7'h4f/* 79*/];
  assign T524 = T525;
  assign T525 = io_chanxy_in[8'haa/* 170*/:8'ha9/* 169*/];
  assign T526 = T527;
  assign T527 = T528;
  assign T528 = T532[T529];
  assign T529 = T530;
  assign T530 = T531;
  assign T531 = io_chanxy_config[7'h50/* 80*/:7'h50/* 80*/];
  assign T532 = T533;
  assign T533 = io_chanxy_in[8'hac/* 172*/:8'hab/* 171*/];
  assign T534 = T535;
  assign T535 = T536;
  assign T536 = T540[T537];
  assign T537 = T538;
  assign T538 = T539;
  assign T539 = io_chanxy_config[7'h53/* 83*/:7'h51/* 81*/];
  assign T540 = T541;
  assign T541 = io_chanxy_in[8'hb4/* 180*/:8'had/* 173*/];
  assign T542 = T543;
  assign T543 = T544;
  assign T544 = T548[T545];
  assign T545 = T546;
  assign T546 = T547;
  assign T547 = io_chanxy_config[7'h54/* 84*/:7'h54/* 84*/];
  assign T548 = T549;
  assign T549 = io_chanxy_in[8'hb6/* 182*/:8'hb5/* 181*/];
  assign T550 = T551;
  assign T551 = T552;
  assign T552 = T556[T553];
  assign T553 = T554;
  assign T554 = T555;
  assign T555 = io_chanxy_config[7'h55/* 85*/:7'h55/* 85*/];
  assign T556 = T557;
  assign T557 = io_chanxy_in[8'hb8/* 184*/:8'hb7/* 183*/];
  assign T558 = T559;
  assign T559 = T560;
  assign T560 = T564[T561];
  assign T561 = T562;
  assign T562 = T563;
  assign T563 = io_chanxy_config[7'h56/* 86*/:7'h56/* 86*/];
  assign T564 = T565;
  assign T565 = io_chanxy_in[8'hba/* 186*/:8'hb9/* 185*/];
  assign T566 = T567;
  assign T567 = T568;
  assign T568 = io_chanxy_in[8'hbb/* 187*/:8'hbb/* 187*/];
  assign T569 = T570;
  assign T570 = T571;
  assign T571 = T575[T572];
  assign T572 = T573;
  assign T573 = T574;
  assign T574 = io_chanxy_config[7'h59/* 89*/:7'h57/* 87*/];
  assign T575 = T576;
  assign T576 = io_chanxy_in[8'hc3/* 195*/:8'hbc/* 188*/];
  assign T577 = T578;
  assign T578 = T579;
  assign T579 = io_chanxy_in[8'hc4/* 196*/:8'hc4/* 196*/];
  assign T580 = T581;
  assign T581 = T582;
  assign T582 = io_chanxy_in[8'hc5/* 197*/:8'hc5/* 197*/];
  assign io_ipin_out = T583;
  assign T583 = T584;
  assign T584 = {T660, T585};
  assign T585 = T586;
  assign T586 = {T651, T587};
  assign T587 = T588;
  assign T588 = {T642, T589};
  assign T589 = T590;
  assign T590 = {T633, T591};
  assign T591 = T592;
  assign T592 = {T624, T593};
  assign T593 = T594;
  assign T594 = {T615, T595};
  assign T595 = T596;
  assign T596 = {T606, T597};
  assign T597 = T598;
  assign T598 = T599;
  assign T599 = T604[T600];
  assign T600 = T601;
  assign T601 = T602;
  assign T602 = {6'h0/* 0*/, T603};
  assign T603 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T604 = T605;
  assign T605 = io_ipin_in[4'h9/* 9*/:1'h0/* 0*/];
  assign T606 = T607;
  assign T607 = T608;
  assign T608 = T613[T609];
  assign T609 = T610;
  assign T610 = T611;
  assign T611 = {6'h0/* 0*/, T612};
  assign T612 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T613 = T614;
  assign T614 = io_ipin_in[5'h13/* 19*/:4'ha/* 10*/];
  assign T615 = T616;
  assign T616 = T617;
  assign T617 = T622[T618];
  assign T618 = T619;
  assign T619 = T620;
  assign T620 = {6'h0/* 0*/, T621};
  assign T621 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T622 = T623;
  assign T623 = io_ipin_in[5'h1d/* 29*/:5'h14/* 20*/];
  assign T624 = T625;
  assign T625 = T626;
  assign T626 = T631[T627];
  assign T627 = T628;
  assign T628 = T629;
  assign T629 = {6'h0/* 0*/, T630};
  assign T630 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T631 = T632;
  assign T632 = io_ipin_in[6'h27/* 39*/:5'h1e/* 30*/];
  assign T633 = T634;
  assign T634 = T635;
  assign T635 = T640[T636];
  assign T636 = T637;
  assign T637 = T638;
  assign T638 = {6'h0/* 0*/, T639};
  assign T639 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T640 = T641;
  assign T641 = io_ipin_in[6'h31/* 49*/:6'h28/* 40*/];
  assign T642 = T643;
  assign T643 = T644;
  assign T644 = T649[T645];
  assign T645 = T646;
  assign T646 = T647;
  assign T647 = {6'h0/* 0*/, T648};
  assign T648 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T649 = T650;
  assign T650 = io_ipin_in[6'h3b/* 59*/:6'h32/* 50*/];
  assign T651 = T652;
  assign T652 = T653;
  assign T653 = T658[T654];
  assign T654 = T655;
  assign T655 = T656;
  assign T656 = {6'h0/* 0*/, T657};
  assign T657 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T658 = T659;
  assign T659 = io_ipin_in[7'h45/* 69*/:6'h3c/* 60*/];
  assign T660 = T661;
  assign T661 = T662;
  assign T662 = T667[T663];
  assign T663 = T664;
  assign T664 = T665;
  assign T665 = {6'h0/* 0*/, T666};
  assign T666 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T667 = T668;
  assign T668 = io_ipin_in[7'h4f/* 79*/:7'h46/* 70*/];
endmodule


module io_tile_sp_0(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [197:0] io_chanxy_in,
    output[59:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[59:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h1/* 1*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_wc_1(
    input [79:0] io_ipin_in,
    input [31:0] io_ipin_config,
    input [209:0] io_chanxy_in,
    input [89:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[23:0] io_chanxy_out);

  wire[23:0] T0;
  wire[23:0] T1;
  wire[22:0] T2;
  wire[22:0] T3;
  wire[21:0] T4;
  wire[21:0] T5;
  wire[20:0] T6;
  wire[20:0] T7;
  wire[19:0] T8;
  wire[19:0] T9;
  wire[18:0] T10;
  wire[18:0] T11;
  wire[17:0] T12;
  wire[17:0] T13;
  wire[16:0] T14;
  wire[16:0] T15;
  wire[15:0] T16;
  wire[15:0] T17;
  wire[14:0] T18;
  wire[14:0] T19;
  wire[13:0] T20;
  wire[13:0] T21;
  wire[12:0] T22;
  wire[12:0] T23;
  wire[11:0] T24;
  wire[11:0] T25;
  wire[10:0] T26;
  wire[10:0] T27;
  wire[9:0] T28;
  wire[9:0] T29;
  wire[8:0] T30;
  wire[8:0] T31;
  wire[7:0] T32;
  wire[7:0] T33;
  wire[6:0] T34;
  wire[6:0] T35;
  wire[5:0] T36;
  wire[5:0] T37;
  wire[4:0] T38;
  wire[4:0] T39;
  wire[3:0] T40;
  wire[3:0] T41;
  wire[2:0] T42;
  wire[2:0] T43;
  wire[1:0] T44;
  wire[1:0] T45;
  wire T46;
  wire T47;
  wire T48;
  wire[3:0] T49;
  wire[3:0] T50;
  wire[3:0] T51;
  wire[8:0] T52;
  wire[8:0] T53;
  wire T54;
  wire T55;
  wire T56;
  wire[3:0] T57;
  wire[3:0] T58;
  wire[3:0] T59;
  wire[8:0] T60;
  wire[8:0] T61;
  wire T62;
  wire T63;
  wire T64;
  wire[3:0] T65;
  wire[3:0] T66;
  wire[3:0] T67;
  wire[8:0] T68;
  wire[8:0] T69;
  wire T70;
  wire T71;
  wire T72;
  wire[3:0] T73;
  wire[3:0] T74;
  wire[3:0] T75;
  wire[8:0] T76;
  wire[8:0] T77;
  wire T78;
  wire T79;
  wire T80;
  wire[3:0] T81;
  wire[3:0] T82;
  wire[3:0] T83;
  wire[8:0] T84;
  wire[8:0] T85;
  wire T86;
  wire T87;
  wire T88;
  wire[3:0] T89;
  wire[3:0] T90;
  wire[3:0] T91;
  wire[8:0] T92;
  wire[8:0] T93;
  wire T94;
  wire T95;
  wire T96;
  wire[3:0] T97;
  wire[3:0] T98;
  wire[3:0] T99;
  wire[8:0] T100;
  wire[8:0] T101;
  wire T102;
  wire T103;
  wire T104;
  wire[3:0] T105;
  wire[3:0] T106;
  wire[3:0] T107;
  wire[8:0] T108;
  wire[8:0] T109;
  wire T110;
  wire T111;
  wire T112;
  wire[3:0] T113;
  wire[3:0] T114;
  wire[3:0] T115;
  wire[8:0] T116;
  wire[8:0] T117;
  wire T118;
  wire T119;
  wire T120;
  wire[2:0] T121;
  wire[2:0] T122;
  wire[2:0] T123;
  wire[7:0] T124;
  wire[7:0] T125;
  wire T126;
  wire T127;
  wire T128;
  wire[2:0] T129;
  wire[2:0] T130;
  wire[2:0] T131;
  wire[7:0] T132;
  wire[7:0] T133;
  wire T134;
  wire T135;
  wire T136;
  wire[2:0] T137;
  wire[2:0] T138;
  wire[2:0] T139;
  wire[7:0] T140;
  wire[7:0] T141;
  wire T142;
  wire T143;
  wire T144;
  wire[3:0] T145;
  wire[3:0] T146;
  wire[3:0] T147;
  wire[8:0] T148;
  wire[8:0] T149;
  wire T150;
  wire T151;
  wire T152;
  wire[3:0] T153;
  wire[3:0] T154;
  wire[3:0] T155;
  wire[8:0] T156;
  wire[8:0] T157;
  wire T158;
  wire T159;
  wire T160;
  wire[3:0] T161;
  wire[3:0] T162;
  wire[3:0] T163;
  wire[8:0] T164;
  wire[8:0] T165;
  wire T166;
  wire T167;
  wire T168;
  wire[3:0] T169;
  wire[3:0] T170;
  wire[3:0] T171;
  wire[8:0] T172;
  wire[8:0] T173;
  wire T174;
  wire T175;
  wire T176;
  wire[3:0] T177;
  wire[3:0] T178;
  wire[3:0] T179;
  wire[8:0] T180;
  wire[8:0] T181;
  wire T182;
  wire T183;
  wire T184;
  wire[3:0] T185;
  wire[3:0] T186;
  wire[3:0] T187;
  wire[8:0] T188;
  wire[8:0] T189;
  wire T190;
  wire T191;
  wire T192;
  wire[3:0] T193;
  wire[3:0] T194;
  wire[3:0] T195;
  wire[8:0] T196;
  wire[8:0] T197;
  wire T198;
  wire T199;
  wire T200;
  wire[3:0] T201;
  wire[3:0] T202;
  wire[3:0] T203;
  wire[8:0] T204;
  wire[8:0] T205;
  wire T206;
  wire T207;
  wire T208;
  wire[3:0] T209;
  wire[3:0] T210;
  wire[3:0] T211;
  wire[8:0] T212;
  wire[8:0] T213;
  wire T214;
  wire T215;
  wire T216;
  wire[2:0] T217;
  wire[2:0] T218;
  wire[2:0] T219;
  wire[7:0] T220;
  wire[7:0] T221;
  wire T222;
  wire T223;
  wire T224;
  wire[2:0] T225;
  wire[2:0] T226;
  wire[2:0] T227;
  wire[7:0] T228;
  wire[7:0] T229;
  wire T230;
  wire T231;
  wire T232;
  wire[2:0] T233;
  wire[2:0] T234;
  wire[2:0] T235;
  wire[7:0] T236;
  wire[7:0] T237;
  wire[7:0] T238;
  wire[7:0] T239;
  wire[6:0] T240;
  wire[6:0] T241;
  wire[5:0] T242;
  wire[5:0] T243;
  wire[4:0] T244;
  wire[4:0] T245;
  wire[3:0] T246;
  wire[3:0] T247;
  wire[2:0] T248;
  wire[2:0] T249;
  wire[1:0] T250;
  wire[1:0] T251;
  wire T252;
  wire T253;
  wire T254;
  wire[9:0] T255;
  wire[9:0] T256;
  wire[9:0] T257;
  wire[3:0] T258;
  wire[9:0] T259;
  wire[9:0] T260;
  wire T261;
  wire T262;
  wire T263;
  wire[9:0] T264;
  wire[9:0] T265;
  wire[9:0] T266;
  wire[3:0] T267;
  wire[9:0] T268;
  wire[9:0] T269;
  wire T270;
  wire T271;
  wire T272;
  wire[9:0] T273;
  wire[9:0] T274;
  wire[9:0] T275;
  wire[3:0] T276;
  wire[9:0] T277;
  wire[9:0] T278;
  wire T279;
  wire T280;
  wire T281;
  wire[9:0] T282;
  wire[9:0] T283;
  wire[9:0] T284;
  wire[3:0] T285;
  wire[9:0] T286;
  wire[9:0] T287;
  wire T288;
  wire T289;
  wire T290;
  wire[9:0] T291;
  wire[9:0] T292;
  wire[9:0] T293;
  wire[3:0] T294;
  wire[9:0] T295;
  wire[9:0] T296;
  wire T297;
  wire T298;
  wire T299;
  wire[9:0] T300;
  wire[9:0] T301;
  wire[9:0] T302;
  wire[3:0] T303;
  wire[9:0] T304;
  wire[9:0] T305;
  wire T306;
  wire T307;
  wire T308;
  wire[9:0] T309;
  wire[9:0] T310;
  wire[9:0] T311;
  wire[3:0] T312;
  wire[9:0] T313;
  wire[9:0] T314;
  wire T315;
  wire T316;
  wire T317;
  wire[9:0] T318;
  wire[9:0] T319;
  wire[9:0] T320;
  wire[3:0] T321;
  wire[9:0] T322;
  wire[9:0] T323;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T230, T2};
  assign T2 = T3;
  assign T3 = {T222, T4};
  assign T4 = T5;
  assign T5 = {T214, T6};
  assign T6 = T7;
  assign T7 = {T206, T8};
  assign T8 = T9;
  assign T9 = {T198, T10};
  assign T10 = T11;
  assign T11 = {T190, T12};
  assign T12 = T13;
  assign T13 = {T182, T14};
  assign T14 = T15;
  assign T15 = {T174, T16};
  assign T16 = T17;
  assign T17 = {T166, T18};
  assign T18 = T19;
  assign T19 = {T158, T20};
  assign T20 = T21;
  assign T21 = {T150, T22};
  assign T22 = T23;
  assign T23 = {T142, T24};
  assign T24 = T25;
  assign T25 = {T134, T26};
  assign T26 = T27;
  assign T27 = {T126, T28};
  assign T28 = T29;
  assign T29 = {T118, T30};
  assign T30 = T31;
  assign T31 = {T110, T32};
  assign T32 = T33;
  assign T33 = {T102, T34};
  assign T34 = T35;
  assign T35 = {T94, T36};
  assign T36 = T37;
  assign T37 = {T86, T38};
  assign T38 = T39;
  assign T39 = {T78, T40};
  assign T40 = T41;
  assign T41 = {T70, T42};
  assign T42 = T43;
  assign T43 = {T62, T44};
  assign T44 = T45;
  assign T45 = {T54, T46};
  assign T46 = T47;
  assign T47 = T48;
  assign T48 = T52[T49];
  assign T49 = T50;
  assign T50 = T51;
  assign T51 = io_chanxy_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T52 = T53;
  assign T53 = io_chanxy_in[4'h8/* 8*/:1'h0/* 0*/];
  assign T54 = T55;
  assign T55 = T56;
  assign T56 = T60[T57];
  assign T57 = T58;
  assign T58 = T59;
  assign T59 = io_chanxy_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T60 = T61;
  assign T61 = io_chanxy_in[5'h11/* 17*/:4'h9/* 9*/];
  assign T62 = T63;
  assign T63 = T64;
  assign T64 = T68[T65];
  assign T65 = T66;
  assign T66 = T67;
  assign T67 = io_chanxy_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T68 = T69;
  assign T69 = io_chanxy_in[5'h1a/* 26*/:5'h12/* 18*/];
  assign T70 = T71;
  assign T71 = T72;
  assign T72 = T76[T73];
  assign T73 = T74;
  assign T74 = T75;
  assign T75 = io_chanxy_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T76 = T77;
  assign T77 = io_chanxy_in[6'h23/* 35*/:5'h1b/* 27*/];
  assign T78 = T79;
  assign T79 = T80;
  assign T80 = T84[T81];
  assign T81 = T82;
  assign T82 = T83;
  assign T83 = io_chanxy_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T84 = T85;
  assign T85 = io_chanxy_in[6'h2c/* 44*/:6'h24/* 36*/];
  assign T86 = T87;
  assign T87 = T88;
  assign T88 = T92[T89];
  assign T89 = T90;
  assign T90 = T91;
  assign T91 = io_chanxy_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T92 = T93;
  assign T93 = io_chanxy_in[6'h35/* 53*/:6'h2d/* 45*/];
  assign T94 = T95;
  assign T95 = T96;
  assign T96 = T100[T97];
  assign T97 = T98;
  assign T98 = T99;
  assign T99 = io_chanxy_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T100 = T101;
  assign T101 = io_chanxy_in[6'h3e/* 62*/:6'h36/* 54*/];
  assign T102 = T103;
  assign T103 = T104;
  assign T104 = T108[T105];
  assign T105 = T106;
  assign T106 = T107;
  assign T107 = io_chanxy_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T108 = T109;
  assign T109 = io_chanxy_in[7'h47/* 71*/:6'h3f/* 63*/];
  assign T110 = T111;
  assign T111 = T112;
  assign T112 = T116[T113];
  assign T113 = T114;
  assign T114 = T115;
  assign T115 = io_chanxy_config[6'h23/* 35*/:6'h20/* 32*/];
  assign T116 = T117;
  assign T117 = io_chanxy_in[7'h50/* 80*/:7'h48/* 72*/];
  assign T118 = T119;
  assign T119 = T120;
  assign T120 = T124[T121];
  assign T121 = T122;
  assign T122 = T123;
  assign T123 = io_chanxy_config[6'h26/* 38*/:6'h24/* 36*/];
  assign T124 = T125;
  assign T125 = io_chanxy_in[7'h58/* 88*/:7'h51/* 81*/];
  assign T126 = T127;
  assign T127 = T128;
  assign T128 = T132[T129];
  assign T129 = T130;
  assign T130 = T131;
  assign T131 = io_chanxy_config[6'h29/* 41*/:6'h27/* 39*/];
  assign T132 = T133;
  assign T133 = io_chanxy_in[7'h60/* 96*/:7'h59/* 89*/];
  assign T134 = T135;
  assign T135 = T136;
  assign T136 = T140[T137];
  assign T137 = T138;
  assign T138 = T139;
  assign T139 = io_chanxy_config[6'h2c/* 44*/:6'h2a/* 42*/];
  assign T140 = T141;
  assign T141 = io_chanxy_in[7'h68/* 104*/:7'h61/* 97*/];
  assign T142 = T143;
  assign T143 = T144;
  assign T144 = T148[T145];
  assign T145 = T146;
  assign T146 = T147;
  assign T147 = io_chanxy_config[6'h30/* 48*/:6'h2d/* 45*/];
  assign T148 = T149;
  assign T149 = io_chanxy_in[7'h71/* 113*/:7'h69/* 105*/];
  assign T150 = T151;
  assign T151 = T152;
  assign T152 = T156[T153];
  assign T153 = T154;
  assign T154 = T155;
  assign T155 = io_chanxy_config[6'h34/* 52*/:6'h31/* 49*/];
  assign T156 = T157;
  assign T157 = io_chanxy_in[7'h7a/* 122*/:7'h72/* 114*/];
  assign T158 = T159;
  assign T159 = T160;
  assign T160 = T164[T161];
  assign T161 = T162;
  assign T162 = T163;
  assign T163 = io_chanxy_config[6'h38/* 56*/:6'h35/* 53*/];
  assign T164 = T165;
  assign T165 = io_chanxy_in[8'h83/* 131*/:7'h7b/* 123*/];
  assign T166 = T167;
  assign T167 = T168;
  assign T168 = T172[T169];
  assign T169 = T170;
  assign T170 = T171;
  assign T171 = io_chanxy_config[6'h3c/* 60*/:6'h39/* 57*/];
  assign T172 = T173;
  assign T173 = io_chanxy_in[8'h8c/* 140*/:8'h84/* 132*/];
  assign T174 = T175;
  assign T175 = T176;
  assign T176 = T180[T177];
  assign T177 = T178;
  assign T178 = T179;
  assign T179 = io_chanxy_config[7'h40/* 64*/:6'h3d/* 61*/];
  assign T180 = T181;
  assign T181 = io_chanxy_in[8'h95/* 149*/:8'h8d/* 141*/];
  assign T182 = T183;
  assign T183 = T184;
  assign T184 = T188[T185];
  assign T185 = T186;
  assign T186 = T187;
  assign T187 = io_chanxy_config[7'h44/* 68*/:7'h41/* 65*/];
  assign T188 = T189;
  assign T189 = io_chanxy_in[8'h9e/* 158*/:8'h96/* 150*/];
  assign T190 = T191;
  assign T191 = T192;
  assign T192 = T196[T193];
  assign T193 = T194;
  assign T194 = T195;
  assign T195 = io_chanxy_config[7'h48/* 72*/:7'h45/* 69*/];
  assign T196 = T197;
  assign T197 = io_chanxy_in[8'ha7/* 167*/:8'h9f/* 159*/];
  assign T198 = T199;
  assign T199 = T200;
  assign T200 = T204[T201];
  assign T201 = T202;
  assign T202 = T203;
  assign T203 = io_chanxy_config[7'h4c/* 76*/:7'h49/* 73*/];
  assign T204 = T205;
  assign T205 = io_chanxy_in[8'hb0/* 176*/:8'ha8/* 168*/];
  assign T206 = T207;
  assign T207 = T208;
  assign T208 = T212[T209];
  assign T209 = T210;
  assign T210 = T211;
  assign T211 = io_chanxy_config[7'h50/* 80*/:7'h4d/* 77*/];
  assign T212 = T213;
  assign T213 = io_chanxy_in[8'hb9/* 185*/:8'hb1/* 177*/];
  assign T214 = T215;
  assign T215 = T216;
  assign T216 = T220[T217];
  assign T217 = T218;
  assign T218 = T219;
  assign T219 = io_chanxy_config[7'h53/* 83*/:7'h51/* 81*/];
  assign T220 = T221;
  assign T221 = io_chanxy_in[8'hc1/* 193*/:8'hba/* 186*/];
  assign T222 = T223;
  assign T223 = T224;
  assign T224 = T228[T225];
  assign T225 = T226;
  assign T226 = T227;
  assign T227 = io_chanxy_config[7'h56/* 86*/:7'h54/* 84*/];
  assign T228 = T229;
  assign T229 = io_chanxy_in[8'hc9/* 201*/:8'hc2/* 194*/];
  assign T230 = T231;
  assign T231 = T232;
  assign T232 = T236[T233];
  assign T233 = T234;
  assign T234 = T235;
  assign T235 = io_chanxy_config[7'h59/* 89*/:7'h57/* 87*/];
  assign T236 = T237;
  assign T237 = io_chanxy_in[8'hd1/* 209*/:8'hca/* 202*/];
  assign io_ipin_out = T238;
  assign T238 = T239;
  assign T239 = {T315, T240};
  assign T240 = T241;
  assign T241 = {T306, T242};
  assign T242 = T243;
  assign T243 = {T297, T244};
  assign T244 = T245;
  assign T245 = {T288, T246};
  assign T246 = T247;
  assign T247 = {T279, T248};
  assign T248 = T249;
  assign T249 = {T270, T250};
  assign T250 = T251;
  assign T251 = {T261, T252};
  assign T252 = T253;
  assign T253 = T254;
  assign T254 = T259[T255];
  assign T255 = T256;
  assign T256 = T257;
  assign T257 = {6'h0/* 0*/, T258};
  assign T258 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T259 = T260;
  assign T260 = io_ipin_in[4'h9/* 9*/:1'h0/* 0*/];
  assign T261 = T262;
  assign T262 = T263;
  assign T263 = T268[T264];
  assign T264 = T265;
  assign T265 = T266;
  assign T266 = {6'h0/* 0*/, T267};
  assign T267 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T268 = T269;
  assign T269 = io_ipin_in[5'h13/* 19*/:4'ha/* 10*/];
  assign T270 = T271;
  assign T271 = T272;
  assign T272 = T277[T273];
  assign T273 = T274;
  assign T274 = T275;
  assign T275 = {6'h0/* 0*/, T276};
  assign T276 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T277 = T278;
  assign T278 = io_ipin_in[5'h1d/* 29*/:5'h14/* 20*/];
  assign T279 = T280;
  assign T280 = T281;
  assign T281 = T286[T282];
  assign T282 = T283;
  assign T283 = T284;
  assign T284 = {6'h0/* 0*/, T285};
  assign T285 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T286 = T287;
  assign T287 = io_ipin_in[6'h27/* 39*/:5'h1e/* 30*/];
  assign T288 = T289;
  assign T289 = T290;
  assign T290 = T295[T291];
  assign T291 = T292;
  assign T292 = T293;
  assign T293 = {6'h0/* 0*/, T294};
  assign T294 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T295 = T296;
  assign T296 = io_ipin_in[6'h31/* 49*/:6'h28/* 40*/];
  assign T297 = T298;
  assign T298 = T299;
  assign T299 = T304[T300];
  assign T300 = T301;
  assign T301 = T302;
  assign T302 = {6'h0/* 0*/, T303};
  assign T303 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T304 = T305;
  assign T305 = io_ipin_in[6'h3b/* 59*/:6'h32/* 50*/];
  assign T306 = T307;
  assign T307 = T308;
  assign T308 = T313[T309];
  assign T309 = T310;
  assign T310 = T311;
  assign T311 = {6'h0/* 0*/, T312};
  assign T312 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T313 = T314;
  assign T314 = io_ipin_in[7'h45/* 69*/:6'h3c/* 60*/];
  assign T315 = T316;
  assign T316 = T317;
  assign T317 = T322[T318];
  assign T318 = T319;
  assign T319 = T320;
  assign T320 = {6'h0/* 0*/, T321};
  assign T321 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T322 = T323;
  assign T323 = io_ipin_in[7'h4f/* 79*/:7'h46/* 70*/];
endmodule

module io_tile_sp_1(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {6'h0/* 0*/, 2'h2/* 2*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_2(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {6'h0/* 0*/, 2'h3/* 3*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_3(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h4/* 4*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_4(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h5/* 5*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_5(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h6/* 6*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_6(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h7/* 7*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_wc_2(
    input [79:0] io_ipin_in,
    input [31:0] io_ipin_config,
    input [197:0] io_chanxy_in,
    input [89:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[59:0] io_chanxy_out);

  wire[59:0] T0;
  wire[59:0] T1;
  wire[58:0] T2;
  wire[58:0] T3;
  wire[57:0] T4;
  wire[57:0] T5;
  wire[56:0] T6;
  wire[56:0] T7;
  wire[55:0] T8;
  wire[55:0] T9;
  wire[54:0] T10;
  wire[54:0] T11;
  wire[53:0] T12;
  wire[53:0] T13;
  wire[52:0] T14;
  wire[52:0] T15;
  wire[51:0] T16;
  wire[51:0] T17;
  wire[50:0] T18;
  wire[50:0] T19;
  wire[49:0] T20;
  wire[49:0] T21;
  wire[48:0] T22;
  wire[48:0] T23;
  wire[47:0] T24;
  wire[47:0] T25;
  wire[46:0] T26;
  wire[46:0] T27;
  wire[45:0] T28;
  wire[45:0] T29;
  wire[44:0] T30;
  wire[44:0] T31;
  wire[43:0] T32;
  wire[43:0] T33;
  wire[42:0] T34;
  wire[42:0] T35;
  wire[41:0] T36;
  wire[41:0] T37;
  wire[40:0] T38;
  wire[40:0] T39;
  wire[39:0] T40;
  wire[39:0] T41;
  wire[38:0] T42;
  wire[38:0] T43;
  wire[37:0] T44;
  wire[37:0] T45;
  wire[36:0] T46;
  wire[36:0] T47;
  wire[35:0] T48;
  wire[35:0] T49;
  wire[34:0] T50;
  wire[34:0] T51;
  wire[33:0] T52;
  wire[33:0] T53;
  wire[32:0] T54;
  wire[32:0] T55;
  wire[31:0] T56;
  wire[31:0] T57;
  wire[30:0] T58;
  wire[30:0] T59;
  wire[29:0] T60;
  wire[29:0] T61;
  wire[28:0] T62;
  wire[28:0] T63;
  wire[27:0] T64;
  wire[27:0] T65;
  wire[26:0] T66;
  wire[26:0] T67;
  wire[25:0] T68;
  wire[25:0] T69;
  wire[24:0] T70;
  wire[24:0] T71;
  wire[23:0] T72;
  wire[23:0] T73;
  wire[22:0] T74;
  wire[22:0] T75;
  wire[21:0] T76;
  wire[21:0] T77;
  wire[20:0] T78;
  wire[20:0] T79;
  wire[19:0] T80;
  wire[19:0] T81;
  wire[18:0] T82;
  wire[18:0] T83;
  wire[17:0] T84;
  wire[17:0] T85;
  wire[16:0] T86;
  wire[16:0] T87;
  wire[15:0] T88;
  wire[15:0] T89;
  wire[14:0] T90;
  wire[14:0] T91;
  wire[13:0] T92;
  wire[13:0] T93;
  wire[12:0] T94;
  wire[12:0] T95;
  wire[11:0] T96;
  wire[11:0] T97;
  wire[10:0] T98;
  wire[10:0] T99;
  wire[9:0] T100;
  wire[9:0] T101;
  wire[8:0] T102;
  wire[8:0] T103;
  wire[7:0] T104;
  wire[7:0] T105;
  wire[6:0] T106;
  wire[6:0] T107;
  wire[5:0] T108;
  wire[5:0] T109;
  wire[4:0] T110;
  wire[4:0] T111;
  wire[3:0] T112;
  wire[3:0] T113;
  wire[2:0] T114;
  wire[2:0] T115;
  wire[1:0] T116;
  wire[1:0] T117;
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire[1:0] T124;
  wire[1:0] T125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  wire T130;
  wire T131;
  wire[1:0] T132;
  wire[1:0] T133;
  wire T134;
  wire T135;
  wire T136;
  wire T137;
  wire T138;
  wire T139;
  wire[1:0] T140;
  wire[1:0] T141;
  wire T142;
  wire T143;
  wire T144;
  wire T145;
  wire T146;
  wire T147;
  wire[1:0] T148;
  wire[1:0] T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  wire[1:0] T156;
  wire[1:0] T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire T162;
  wire T163;
  wire[1:0] T164;
  wire[1:0] T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  wire T170;
  wire T171;
  wire[1:0] T172;
  wire[1:0] T173;
  wire T174;
  wire T175;
  wire T176;
  wire T177;
  wire T178;
  wire T179;
  wire[1:0] T180;
  wire[1:0] T181;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire T186;
  wire T187;
  wire[1:0] T188;
  wire[1:0] T189;
  wire T190;
  wire T191;
  wire T192;
  wire T193;
  wire T194;
  wire T195;
  wire[1:0] T196;
  wire[1:0] T197;
  wire T198;
  wire T199;
  wire T200;
  wire T201;
  wire T202;
  wire T203;
  wire[1:0] T204;
  wire[1:0] T205;
  wire T206;
  wire T207;
  wire T208;
  wire T209;
  wire T210;
  wire T211;
  wire[1:0] T212;
  wire[1:0] T213;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  wire[1:0] T220;
  wire[1:0] T221;
  wire T222;
  wire T223;
  wire T224;
  wire T225;
  wire T226;
  wire T227;
  wire[1:0] T228;
  wire[1:0] T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire[1:0] T236;
  wire[1:0] T237;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire T242;
  wire T243;
  wire[1:0] T244;
  wire[1:0] T245;
  wire T246;
  wire T247;
  wire T248;
  wire T249;
  wire T250;
  wire T251;
  wire[1:0] T252;
  wire[1:0] T253;
  wire T254;
  wire T255;
  wire T256;
  wire T257;
  wire T258;
  wire T259;
  wire[1:0] T260;
  wire[1:0] T261;
  wire T262;
  wire T263;
  wire T264;
  wire T265;
  wire T266;
  wire T267;
  wire[1:0] T268;
  wire[1:0] T269;
  wire T270;
  wire T271;
  wire T272;
  wire T273;
  wire T274;
  wire T275;
  wire[1:0] T276;
  wire[1:0] T277;
  wire T278;
  wire T279;
  wire T280;
  wire T281;
  wire T282;
  wire T283;
  wire[1:0] T284;
  wire[1:0] T285;
  wire T286;
  wire T287;
  wire T288;
  wire T289;
  wire T290;
  wire T291;
  wire[1:0] T292;
  wire[1:0] T293;
  wire T294;
  wire T295;
  wire T296;
  wire T297;
  wire T298;
  wire T299;
  wire[1:0] T300;
  wire[1:0] T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire T306;
  wire T307;
  wire T308;
  wire T309;
  wire T310;
  wire[1:0] T311;
  wire[1:0] T312;
  wire T313;
  wire T314;
  wire T315;
  wire T316;
  wire T317;
  wire T318;
  wire[1:0] T319;
  wire[1:0] T320;
  wire T321;
  wire T322;
  wire T323;
  wire T324;
  wire T325;
  wire T326;
  wire[1:0] T327;
  wire[1:0] T328;
  wire T329;
  wire T330;
  wire T331;
  wire T332;
  wire T333;
  wire T334;
  wire[1:0] T335;
  wire[1:0] T336;
  wire T337;
  wire T338;
  wire T339;
  wire T340;
  wire T341;
  wire T342;
  wire[1:0] T343;
  wire[1:0] T344;
  wire T345;
  wire T346;
  wire T347;
  wire T348;
  wire T349;
  wire T350;
  wire[1:0] T351;
  wire[1:0] T352;
  wire T353;
  wire T354;
  wire T355;
  wire T356;
  wire T357;
  wire T358;
  wire[1:0] T359;
  wire[1:0] T360;
  wire T361;
  wire T362;
  wire T363;
  wire T364;
  wire T365;
  wire T366;
  wire[1:0] T367;
  wire[1:0] T368;
  wire T369;
  wire T370;
  wire T371;
  wire T372;
  wire T373;
  wire T374;
  wire[1:0] T375;
  wire[1:0] T376;
  wire T377;
  wire T378;
  wire T379;
  wire T380;
  wire T381;
  wire T382;
  wire[1:0] T383;
  wire[1:0] T384;
  wire T385;
  wire T386;
  wire T387;
  wire T388;
  wire T389;
  wire T390;
  wire[1:0] T391;
  wire[1:0] T392;
  wire T393;
  wire T394;
  wire T395;
  wire T396;
  wire T397;
  wire T398;
  wire[3:0] T399;
  wire[3:0] T400;
  wire[3:0] T401;
  wire[8:0] T402;
  wire[8:0] T403;
  wire T404;
  wire T405;
  wire T406;
  wire T407;
  wire T408;
  wire T409;
  wire[1:0] T410;
  wire[1:0] T411;
  wire T412;
  wire T413;
  wire T414;
  wire[3:0] T415;
  wire[3:0] T416;
  wire[3:0] T417;
  wire[8:0] T418;
  wire[8:0] T419;
  wire T420;
  wire T421;
  wire T422;
  wire T423;
  wire T424;
  wire T425;
  wire[1:0] T426;
  wire[1:0] T427;
  wire T428;
  wire T429;
  wire T430;
  wire[3:0] T431;
  wire[3:0] T432;
  wire[3:0] T433;
  wire[8:0] T434;
  wire[8:0] T435;
  wire T436;
  wire T437;
  wire T438;
  wire T439;
  wire T440;
  wire T441;
  wire[1:0] T442;
  wire[1:0] T443;
  wire T444;
  wire T445;
  wire T446;
  wire[3:0] T447;
  wire[3:0] T448;
  wire[3:0] T449;
  wire[8:0] T450;
  wire[8:0] T451;
  wire T452;
  wire T453;
  wire T454;
  wire T455;
  wire T456;
  wire T457;
  wire[1:0] T458;
  wire[1:0] T459;
  wire T460;
  wire T461;
  wire T462;
  wire[3:0] T463;
  wire[3:0] T464;
  wire[3:0] T465;
  wire[8:0] T466;
  wire[8:0] T467;
  wire T468;
  wire T469;
  wire T470;
  wire T471;
  wire T472;
  wire T473;
  wire[1:0] T474;
  wire[1:0] T475;
  wire T476;
  wire T477;
  wire T478;
  wire[3:0] T479;
  wire[3:0] T480;
  wire[3:0] T481;
  wire[8:0] T482;
  wire[8:0] T483;
  wire T484;
  wire T485;
  wire T486;
  wire T487;
  wire T488;
  wire T489;
  wire[1:0] T490;
  wire[1:0] T491;
  wire T492;
  wire T493;
  wire T494;
  wire[3:0] T495;
  wire[3:0] T496;
  wire[3:0] T497;
  wire[8:0] T498;
  wire[8:0] T499;
  wire T500;
  wire T501;
  wire T502;
  wire T503;
  wire T504;
  wire T505;
  wire[1:0] T506;
  wire[1:0] T507;
  wire T508;
  wire T509;
  wire T510;
  wire[3:0] T511;
  wire[3:0] T512;
  wire[3:0] T513;
  wire[8:0] T514;
  wire[8:0] T515;
  wire T516;
  wire T517;
  wire T518;
  wire T519;
  wire T520;
  wire T521;
  wire[1:0] T522;
  wire[1:0] T523;
  wire T524;
  wire T525;
  wire T526;
  wire[3:0] T527;
  wire[3:0] T528;
  wire[3:0] T529;
  wire[8:0] T530;
  wire[8:0] T531;
  wire T532;
  wire T533;
  wire T534;
  wire T535;
  wire T536;
  wire T537;
  wire[1:0] T538;
  wire[1:0] T539;
  wire T540;
  wire T541;
  wire T542;
  wire[2:0] T543;
  wire[2:0] T544;
  wire[2:0] T545;
  wire[7:0] T546;
  wire[7:0] T547;
  wire T548;
  wire T549;
  wire T550;
  wire T551;
  wire T552;
  wire T553;
  wire[1:0] T554;
  wire[1:0] T555;
  wire T556;
  wire T557;
  wire T558;
  wire[2:0] T559;
  wire[2:0] T560;
  wire[2:0] T561;
  wire[7:0] T562;
  wire[7:0] T563;
  wire T564;
  wire T565;
  wire T566;
  wire T567;
  wire T568;
  wire T569;
  wire[1:0] T570;
  wire[1:0] T571;
  wire T572;
  wire T573;
  wire T574;
  wire[2:0] T575;
  wire[2:0] T576;
  wire[2:0] T577;
  wire[7:0] T578;
  wire[7:0] T579;
  wire T580;
  wire T581;
  wire T582;
  wire[7:0] T583;
  wire[7:0] T584;
  wire[6:0] T585;
  wire[6:0] T586;
  wire[5:0] T587;
  wire[5:0] T588;
  wire[4:0] T589;
  wire[4:0] T590;
  wire[3:0] T591;
  wire[3:0] T592;
  wire[2:0] T593;
  wire[2:0] T594;
  wire[1:0] T595;
  wire[1:0] T596;
  wire T597;
  wire T598;
  wire T599;
  wire[9:0] T600;
  wire[9:0] T601;
  wire[9:0] T602;
  wire[3:0] T603;
  wire[9:0] T604;
  wire[9:0] T605;
  wire T606;
  wire T607;
  wire T608;
  wire[9:0] T609;
  wire[9:0] T610;
  wire[9:0] T611;
  wire[3:0] T612;
  wire[9:0] T613;
  wire[9:0] T614;
  wire T615;
  wire T616;
  wire T617;
  wire[9:0] T618;
  wire[9:0] T619;
  wire[9:0] T620;
  wire[3:0] T621;
  wire[9:0] T622;
  wire[9:0] T623;
  wire T624;
  wire T625;
  wire T626;
  wire[9:0] T627;
  wire[9:0] T628;
  wire[9:0] T629;
  wire[3:0] T630;
  wire[9:0] T631;
  wire[9:0] T632;
  wire T633;
  wire T634;
  wire T635;
  wire[9:0] T636;
  wire[9:0] T637;
  wire[9:0] T638;
  wire[3:0] T639;
  wire[9:0] T640;
  wire[9:0] T641;
  wire T642;
  wire T643;
  wire T644;
  wire[9:0] T645;
  wire[9:0] T646;
  wire[9:0] T647;
  wire[3:0] T648;
  wire[9:0] T649;
  wire[9:0] T650;
  wire T651;
  wire T652;
  wire T653;
  wire[9:0] T654;
  wire[9:0] T655;
  wire[9:0] T656;
  wire[3:0] T657;
  wire[9:0] T658;
  wire[9:0] T659;
  wire T660;
  wire T661;
  wire T662;
  wire[9:0] T663;
  wire[9:0] T664;
  wire[9:0] T665;
  wire[3:0] T666;
  wire[9:0] T667;
  wire[9:0] T668;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T580, T2};
  assign T2 = T3;
  assign T3 = {T572, T4};
  assign T4 = T5;
  assign T5 = {T564, T6};
  assign T6 = T7;
  assign T7 = {T556, T8};
  assign T8 = T9;
  assign T9 = {T548, T10};
  assign T10 = T11;
  assign T11 = {T540, T12};
  assign T12 = T13;
  assign T13 = {T532, T14};
  assign T14 = T15;
  assign T15 = {T524, T16};
  assign T16 = T17;
  assign T17 = {T516, T18};
  assign T18 = T19;
  assign T19 = {T508, T20};
  assign T20 = T21;
  assign T21 = {T500, T22};
  assign T22 = T23;
  assign T23 = {T492, T24};
  assign T24 = T25;
  assign T25 = {T484, T26};
  assign T26 = T27;
  assign T27 = {T476, T28};
  assign T28 = T29;
  assign T29 = {T468, T30};
  assign T30 = T31;
  assign T31 = {T460, T32};
  assign T32 = T33;
  assign T33 = {T452, T34};
  assign T34 = T35;
  assign T35 = {T444, T36};
  assign T36 = T37;
  assign T37 = {T436, T38};
  assign T38 = T39;
  assign T39 = {T428, T40};
  assign T40 = T41;
  assign T41 = {T420, T42};
  assign T42 = T43;
  assign T43 = {T412, T44};
  assign T44 = T45;
  assign T45 = {T404, T46};
  assign T46 = T47;
  assign T47 = {T396, T48};
  assign T48 = T49;
  assign T49 = {T393, T50};
  assign T50 = T51;
  assign T51 = {T385, T52};
  assign T52 = T53;
  assign T53 = {T377, T54};
  assign T54 = T55;
  assign T55 = {T369, T56};
  assign T56 = T57;
  assign T57 = {T361, T58};
  assign T58 = T59;
  assign T59 = {T353, T60};
  assign T60 = T61;
  assign T61 = {T345, T62};
  assign T62 = T63;
  assign T63 = {T337, T64};
  assign T64 = T65;
  assign T65 = {T329, T66};
  assign T66 = T67;
  assign T67 = {T321, T68};
  assign T68 = T69;
  assign T69 = {T313, T70};
  assign T70 = T71;
  assign T71 = {T305, T72};
  assign T72 = T73;
  assign T73 = {T302, T74};
  assign T74 = T75;
  assign T75 = {T294, T76};
  assign T76 = T77;
  assign T77 = {T286, T78};
  assign T78 = T79;
  assign T79 = {T278, T80};
  assign T80 = T81;
  assign T81 = {T270, T82};
  assign T82 = T83;
  assign T83 = {T262, T84};
  assign T84 = T85;
  assign T85 = {T254, T86};
  assign T86 = T87;
  assign T87 = {T246, T88};
  assign T88 = T89;
  assign T89 = {T238, T90};
  assign T90 = T91;
  assign T91 = {T230, T92};
  assign T92 = T93;
  assign T93 = {T222, T94};
  assign T94 = T95;
  assign T95 = {T214, T96};
  assign T96 = T97;
  assign T97 = {T206, T98};
  assign T98 = T99;
  assign T99 = {T198, T100};
  assign T100 = T101;
  assign T101 = {T190, T102};
  assign T102 = T103;
  assign T103 = {T182, T104};
  assign T104 = T105;
  assign T105 = {T174, T106};
  assign T106 = T107;
  assign T107 = {T166, T108};
  assign T108 = T109;
  assign T109 = {T158, T110};
  assign T110 = T111;
  assign T111 = {T150, T112};
  assign T112 = T113;
  assign T113 = {T142, T114};
  assign T114 = T115;
  assign T115 = {T134, T116};
  assign T116 = T117;
  assign T117 = {T126, T118};
  assign T118 = T119;
  assign T119 = T120;
  assign T120 = T124[T121];
  assign T121 = T122;
  assign T122 = T123;
  assign T123 = io_chanxy_config[1'h0/* 0*/:1'h0/* 0*/];
  assign T124 = T125;
  assign T125 = io_chanxy_in[1'h1/* 1*/:1'h0/* 0*/];
  assign T126 = T127;
  assign T127 = T128;
  assign T128 = T132[T129];
  assign T129 = T130;
  assign T130 = T131;
  assign T131 = io_chanxy_config[1'h1/* 1*/:1'h1/* 1*/];
  assign T132 = T133;
  assign T133 = io_chanxy_in[2'h3/* 3*/:2'h2/* 2*/];
  assign T134 = T135;
  assign T135 = T136;
  assign T136 = T140[T137];
  assign T137 = T138;
  assign T138 = T139;
  assign T139 = io_chanxy_config[2'h2/* 2*/:2'h2/* 2*/];
  assign T140 = T141;
  assign T141 = io_chanxy_in[3'h5/* 5*/:3'h4/* 4*/];
  assign T142 = T143;
  assign T143 = T144;
  assign T144 = T148[T145];
  assign T145 = T146;
  assign T146 = T147;
  assign T147 = io_chanxy_config[2'h3/* 3*/:2'h3/* 3*/];
  assign T148 = T149;
  assign T149 = io_chanxy_in[3'h7/* 7*/:3'h6/* 6*/];
  assign T150 = T151;
  assign T151 = T152;
  assign T152 = T156[T153];
  assign T153 = T154;
  assign T154 = T155;
  assign T155 = io_chanxy_config[3'h4/* 4*/:3'h4/* 4*/];
  assign T156 = T157;
  assign T157 = io_chanxy_in[4'h9/* 9*/:4'h8/* 8*/];
  assign T158 = T159;
  assign T159 = T160;
  assign T160 = T164[T161];
  assign T161 = T162;
  assign T162 = T163;
  assign T163 = io_chanxy_config[3'h5/* 5*/:3'h5/* 5*/];
  assign T164 = T165;
  assign T165 = io_chanxy_in[4'hb/* 11*/:4'ha/* 10*/];
  assign T166 = T167;
  assign T167 = T168;
  assign T168 = T172[T169];
  assign T169 = T170;
  assign T170 = T171;
  assign T171 = io_chanxy_config[3'h6/* 6*/:3'h6/* 6*/];
  assign T172 = T173;
  assign T173 = io_chanxy_in[4'hd/* 13*/:4'hc/* 12*/];
  assign T174 = T175;
  assign T175 = T176;
  assign T176 = T180[T177];
  assign T177 = T178;
  assign T178 = T179;
  assign T179 = io_chanxy_config[3'h7/* 7*/:3'h7/* 7*/];
  assign T180 = T181;
  assign T181 = io_chanxy_in[4'hf/* 15*/:4'he/* 14*/];
  assign T182 = T183;
  assign T183 = T184;
  assign T184 = T188[T185];
  assign T185 = T186;
  assign T186 = T187;
  assign T187 = io_chanxy_config[4'h8/* 8*/:4'h8/* 8*/];
  assign T188 = T189;
  assign T189 = io_chanxy_in[5'h11/* 17*/:5'h10/* 16*/];
  assign T190 = T191;
  assign T191 = T192;
  assign T192 = T196[T193];
  assign T193 = T194;
  assign T194 = T195;
  assign T195 = io_chanxy_config[4'h9/* 9*/:4'h9/* 9*/];
  assign T196 = T197;
  assign T197 = io_chanxy_in[5'h13/* 19*/:5'h12/* 18*/];
  assign T198 = T199;
  assign T199 = T200;
  assign T200 = T204[T201];
  assign T201 = T202;
  assign T202 = T203;
  assign T203 = io_chanxy_config[4'ha/* 10*/:4'ha/* 10*/];
  assign T204 = T205;
  assign T205 = io_chanxy_in[5'h15/* 21*/:5'h14/* 20*/];
  assign T206 = T207;
  assign T207 = T208;
  assign T208 = T212[T209];
  assign T209 = T210;
  assign T210 = T211;
  assign T211 = io_chanxy_config[4'hb/* 11*/:4'hb/* 11*/];
  assign T212 = T213;
  assign T213 = io_chanxy_in[5'h17/* 23*/:5'h16/* 22*/];
  assign T214 = T215;
  assign T215 = T216;
  assign T216 = T220[T217];
  assign T217 = T218;
  assign T218 = T219;
  assign T219 = io_chanxy_config[4'hc/* 12*/:4'hc/* 12*/];
  assign T220 = T221;
  assign T221 = io_chanxy_in[5'h19/* 25*/:5'h18/* 24*/];
  assign T222 = T223;
  assign T223 = T224;
  assign T224 = T228[T225];
  assign T225 = T226;
  assign T226 = T227;
  assign T227 = io_chanxy_config[4'hd/* 13*/:4'hd/* 13*/];
  assign T228 = T229;
  assign T229 = io_chanxy_in[5'h1b/* 27*/:5'h1a/* 26*/];
  assign T230 = T231;
  assign T231 = T232;
  assign T232 = T236[T233];
  assign T233 = T234;
  assign T234 = T235;
  assign T235 = io_chanxy_config[4'he/* 14*/:4'he/* 14*/];
  assign T236 = T237;
  assign T237 = io_chanxy_in[5'h1d/* 29*/:5'h1c/* 28*/];
  assign T238 = T239;
  assign T239 = T240;
  assign T240 = T244[T241];
  assign T241 = T242;
  assign T242 = T243;
  assign T243 = io_chanxy_config[4'hf/* 15*/:4'hf/* 15*/];
  assign T244 = T245;
  assign T245 = io_chanxy_in[5'h1f/* 31*/:5'h1e/* 30*/];
  assign T246 = T247;
  assign T247 = T248;
  assign T248 = T252[T249];
  assign T249 = T250;
  assign T250 = T251;
  assign T251 = io_chanxy_config[5'h10/* 16*/:5'h10/* 16*/];
  assign T252 = T253;
  assign T253 = io_chanxy_in[6'h21/* 33*/:6'h20/* 32*/];
  assign T254 = T255;
  assign T255 = T256;
  assign T256 = T260[T257];
  assign T257 = T258;
  assign T258 = T259;
  assign T259 = io_chanxy_config[5'h11/* 17*/:5'h11/* 17*/];
  assign T260 = T261;
  assign T261 = io_chanxy_in[6'h23/* 35*/:6'h22/* 34*/];
  assign T262 = T263;
  assign T263 = T264;
  assign T264 = T268[T265];
  assign T265 = T266;
  assign T266 = T267;
  assign T267 = io_chanxy_config[5'h12/* 18*/:5'h12/* 18*/];
  assign T268 = T269;
  assign T269 = io_chanxy_in[6'h25/* 37*/:6'h24/* 36*/];
  assign T270 = T271;
  assign T271 = T272;
  assign T272 = T276[T273];
  assign T273 = T274;
  assign T274 = T275;
  assign T275 = io_chanxy_config[5'h13/* 19*/:5'h13/* 19*/];
  assign T276 = T277;
  assign T277 = io_chanxy_in[6'h27/* 39*/:6'h26/* 38*/];
  assign T278 = T279;
  assign T279 = T280;
  assign T280 = T284[T281];
  assign T281 = T282;
  assign T282 = T283;
  assign T283 = io_chanxy_config[5'h14/* 20*/:5'h14/* 20*/];
  assign T284 = T285;
  assign T285 = io_chanxy_in[6'h29/* 41*/:6'h28/* 40*/];
  assign T286 = T287;
  assign T287 = T288;
  assign T288 = T292[T289];
  assign T289 = T290;
  assign T290 = T291;
  assign T291 = io_chanxy_config[5'h15/* 21*/:5'h15/* 21*/];
  assign T292 = T293;
  assign T293 = io_chanxy_in[6'h2b/* 43*/:6'h2a/* 42*/];
  assign T294 = T295;
  assign T295 = T296;
  assign T296 = T300[T297];
  assign T297 = T298;
  assign T298 = T299;
  assign T299 = io_chanxy_config[5'h16/* 22*/:5'h16/* 22*/];
  assign T300 = T301;
  assign T301 = io_chanxy_in[6'h2d/* 45*/:6'h2c/* 44*/];
  assign T302 = T303;
  assign T303 = T304;
  assign T304 = io_chanxy_in[6'h2e/* 46*/:6'h2e/* 46*/];
  assign T305 = T306;
  assign T306 = T307;
  assign T307 = T311[T308];
  assign T308 = T309;
  assign T309 = T310;
  assign T310 = io_chanxy_config[5'h17/* 23*/:5'h17/* 23*/];
  assign T311 = T312;
  assign T312 = io_chanxy_in[6'h30/* 48*/:6'h2f/* 47*/];
  assign T313 = T314;
  assign T314 = T315;
  assign T315 = T319[T316];
  assign T316 = T317;
  assign T317 = T318;
  assign T318 = io_chanxy_config[5'h18/* 24*/:5'h18/* 24*/];
  assign T319 = T320;
  assign T320 = io_chanxy_in[6'h32/* 50*/:6'h31/* 49*/];
  assign T321 = T322;
  assign T322 = T323;
  assign T323 = T327[T324];
  assign T324 = T325;
  assign T325 = T326;
  assign T326 = io_chanxy_config[5'h19/* 25*/:5'h19/* 25*/];
  assign T327 = T328;
  assign T328 = io_chanxy_in[6'h34/* 52*/:6'h33/* 51*/];
  assign T329 = T330;
  assign T330 = T331;
  assign T331 = T335[T332];
  assign T332 = T333;
  assign T333 = T334;
  assign T334 = io_chanxy_config[5'h1a/* 26*/:5'h1a/* 26*/];
  assign T335 = T336;
  assign T336 = io_chanxy_in[6'h36/* 54*/:6'h35/* 53*/];
  assign T337 = T338;
  assign T338 = T339;
  assign T339 = T343[T340];
  assign T340 = T341;
  assign T341 = T342;
  assign T342 = io_chanxy_config[5'h1b/* 27*/:5'h1b/* 27*/];
  assign T343 = T344;
  assign T344 = io_chanxy_in[6'h38/* 56*/:6'h37/* 55*/];
  assign T345 = T346;
  assign T346 = T347;
  assign T347 = T351[T348];
  assign T348 = T349;
  assign T349 = T350;
  assign T350 = io_chanxy_config[5'h1c/* 28*/:5'h1c/* 28*/];
  assign T351 = T352;
  assign T352 = io_chanxy_in[6'h3a/* 58*/:6'h39/* 57*/];
  assign T353 = T354;
  assign T354 = T355;
  assign T355 = T359[T356];
  assign T356 = T357;
  assign T357 = T358;
  assign T358 = io_chanxy_config[5'h1d/* 29*/:5'h1d/* 29*/];
  assign T359 = T360;
  assign T360 = io_chanxy_in[6'h3c/* 60*/:6'h3b/* 59*/];
  assign T361 = T362;
  assign T362 = T363;
  assign T363 = T367[T364];
  assign T364 = T365;
  assign T365 = T366;
  assign T366 = io_chanxy_config[5'h1e/* 30*/:5'h1e/* 30*/];
  assign T367 = T368;
  assign T368 = io_chanxy_in[6'h3e/* 62*/:6'h3d/* 61*/];
  assign T369 = T370;
  assign T370 = T371;
  assign T371 = T375[T372];
  assign T372 = T373;
  assign T373 = T374;
  assign T374 = io_chanxy_config[5'h1f/* 31*/:5'h1f/* 31*/];
  assign T375 = T376;
  assign T376 = io_chanxy_in[7'h40/* 64*/:6'h3f/* 63*/];
  assign T377 = T378;
  assign T378 = T379;
  assign T379 = T383[T380];
  assign T380 = T381;
  assign T381 = T382;
  assign T382 = io_chanxy_config[6'h20/* 32*/:6'h20/* 32*/];
  assign T383 = T384;
  assign T384 = io_chanxy_in[7'h42/* 66*/:7'h41/* 65*/];
  assign T385 = T386;
  assign T386 = T387;
  assign T387 = T391[T388];
  assign T388 = T389;
  assign T389 = T390;
  assign T390 = io_chanxy_config[6'h21/* 33*/:6'h21/* 33*/];
  assign T391 = T392;
  assign T392 = io_chanxy_in[7'h44/* 68*/:7'h43/* 67*/];
  assign T393 = T394;
  assign T394 = T395;
  assign T395 = io_chanxy_in[7'h45/* 69*/:7'h45/* 69*/];
  assign T396 = T397;
  assign T397 = T398;
  assign T398 = T402[T399];
  assign T399 = T400;
  assign T400 = T401;
  assign T401 = io_chanxy_config[6'h25/* 37*/:6'h22/* 34*/];
  assign T402 = T403;
  assign T403 = io_chanxy_in[7'h4e/* 78*/:7'h46/* 70*/];
  assign T404 = T405;
  assign T405 = T406;
  assign T406 = T410[T407];
  assign T407 = T408;
  assign T408 = T409;
  assign T409 = io_chanxy_config[6'h26/* 38*/:6'h26/* 38*/];
  assign T410 = T411;
  assign T411 = io_chanxy_in[7'h50/* 80*/:7'h4f/* 79*/];
  assign T412 = T413;
  assign T413 = T414;
  assign T414 = T418[T415];
  assign T415 = T416;
  assign T416 = T417;
  assign T417 = io_chanxy_config[6'h2a/* 42*/:6'h27/* 39*/];
  assign T418 = T419;
  assign T419 = io_chanxy_in[7'h59/* 89*/:7'h51/* 81*/];
  assign T420 = T421;
  assign T421 = T422;
  assign T422 = T426[T423];
  assign T423 = T424;
  assign T424 = T425;
  assign T425 = io_chanxy_config[6'h2b/* 43*/:6'h2b/* 43*/];
  assign T426 = T427;
  assign T427 = io_chanxy_in[7'h5b/* 91*/:7'h5a/* 90*/];
  assign T428 = T429;
  assign T429 = T430;
  assign T430 = T434[T431];
  assign T431 = T432;
  assign T432 = T433;
  assign T433 = io_chanxy_config[6'h2f/* 47*/:6'h2c/* 44*/];
  assign T434 = T435;
  assign T435 = io_chanxy_in[7'h64/* 100*/:7'h5c/* 92*/];
  assign T436 = T437;
  assign T437 = T438;
  assign T438 = T442[T439];
  assign T439 = T440;
  assign T440 = T441;
  assign T441 = io_chanxy_config[6'h30/* 48*/:6'h30/* 48*/];
  assign T442 = T443;
  assign T443 = io_chanxy_in[7'h66/* 102*/:7'h65/* 101*/];
  assign T444 = T445;
  assign T445 = T446;
  assign T446 = T450[T447];
  assign T447 = T448;
  assign T448 = T449;
  assign T449 = io_chanxy_config[6'h34/* 52*/:6'h31/* 49*/];
  assign T450 = T451;
  assign T451 = io_chanxy_in[7'h6f/* 111*/:7'h67/* 103*/];
  assign T452 = T453;
  assign T453 = T454;
  assign T454 = T458[T455];
  assign T455 = T456;
  assign T456 = T457;
  assign T457 = io_chanxy_config[6'h35/* 53*/:6'h35/* 53*/];
  assign T458 = T459;
  assign T459 = io_chanxy_in[7'h71/* 113*/:7'h70/* 112*/];
  assign T460 = T461;
  assign T461 = T462;
  assign T462 = T466[T463];
  assign T463 = T464;
  assign T464 = T465;
  assign T465 = io_chanxy_config[6'h39/* 57*/:6'h36/* 54*/];
  assign T466 = T467;
  assign T467 = io_chanxy_in[7'h7a/* 122*/:7'h72/* 114*/];
  assign T468 = T469;
  assign T469 = T470;
  assign T470 = T474[T471];
  assign T471 = T472;
  assign T472 = T473;
  assign T473 = io_chanxy_config[6'h3a/* 58*/:6'h3a/* 58*/];
  assign T474 = T475;
  assign T475 = io_chanxy_in[7'h7c/* 124*/:7'h7b/* 123*/];
  assign T476 = T477;
  assign T477 = T478;
  assign T478 = T482[T479];
  assign T479 = T480;
  assign T480 = T481;
  assign T481 = io_chanxy_config[6'h3e/* 62*/:6'h3b/* 59*/];
  assign T482 = T483;
  assign T483 = io_chanxy_in[8'h85/* 133*/:7'h7d/* 125*/];
  assign T484 = T485;
  assign T485 = T486;
  assign T486 = T490[T487];
  assign T487 = T488;
  assign T488 = T489;
  assign T489 = io_chanxy_config[6'h3f/* 63*/:6'h3f/* 63*/];
  assign T490 = T491;
  assign T491 = io_chanxy_in[8'h87/* 135*/:8'h86/* 134*/];
  assign T492 = T493;
  assign T493 = T494;
  assign T494 = T498[T495];
  assign T495 = T496;
  assign T496 = T497;
  assign T497 = io_chanxy_config[7'h43/* 67*/:7'h40/* 64*/];
  assign T498 = T499;
  assign T499 = io_chanxy_in[8'h90/* 144*/:8'h88/* 136*/];
  assign T500 = T501;
  assign T501 = T502;
  assign T502 = T506[T503];
  assign T503 = T504;
  assign T504 = T505;
  assign T505 = io_chanxy_config[7'h44/* 68*/:7'h44/* 68*/];
  assign T506 = T507;
  assign T507 = io_chanxy_in[8'h92/* 146*/:8'h91/* 145*/];
  assign T508 = T509;
  assign T509 = T510;
  assign T510 = T514[T511];
  assign T511 = T512;
  assign T512 = T513;
  assign T513 = io_chanxy_config[7'h48/* 72*/:7'h45/* 69*/];
  assign T514 = T515;
  assign T515 = io_chanxy_in[8'h9b/* 155*/:8'h93/* 147*/];
  assign T516 = T517;
  assign T517 = T518;
  assign T518 = T522[T519];
  assign T519 = T520;
  assign T520 = T521;
  assign T521 = io_chanxy_config[7'h49/* 73*/:7'h49/* 73*/];
  assign T522 = T523;
  assign T523 = io_chanxy_in[8'h9d/* 157*/:8'h9c/* 156*/];
  assign T524 = T525;
  assign T525 = T526;
  assign T526 = T530[T527];
  assign T527 = T528;
  assign T528 = T529;
  assign T529 = io_chanxy_config[7'h4d/* 77*/:7'h4a/* 74*/];
  assign T530 = T531;
  assign T531 = io_chanxy_in[8'ha6/* 166*/:8'h9e/* 158*/];
  assign T532 = T533;
  assign T533 = T534;
  assign T534 = T538[T535];
  assign T535 = T536;
  assign T536 = T537;
  assign T537 = io_chanxy_config[7'h4e/* 78*/:7'h4e/* 78*/];
  assign T538 = T539;
  assign T539 = io_chanxy_in[8'ha8/* 168*/:8'ha7/* 167*/];
  assign T540 = T541;
  assign T541 = T542;
  assign T542 = T546[T543];
  assign T543 = T544;
  assign T544 = T545;
  assign T545 = io_chanxy_config[7'h51/* 81*/:7'h4f/* 79*/];
  assign T546 = T547;
  assign T547 = io_chanxy_in[8'hb0/* 176*/:8'ha9/* 169*/];
  assign T548 = T549;
  assign T549 = T550;
  assign T550 = T554[T551];
  assign T551 = T552;
  assign T552 = T553;
  assign T553 = io_chanxy_config[7'h52/* 82*/:7'h52/* 82*/];
  assign T554 = T555;
  assign T555 = io_chanxy_in[8'hb2/* 178*/:8'hb1/* 177*/];
  assign T556 = T557;
  assign T557 = T558;
  assign T558 = T562[T559];
  assign T559 = T560;
  assign T560 = T561;
  assign T561 = io_chanxy_config[7'h55/* 85*/:7'h53/* 83*/];
  assign T562 = T563;
  assign T563 = io_chanxy_in[8'hba/* 186*/:8'hb3/* 179*/];
  assign T564 = T565;
  assign T565 = T566;
  assign T566 = T570[T567];
  assign T567 = T568;
  assign T568 = T569;
  assign T569 = io_chanxy_config[7'h56/* 86*/:7'h56/* 86*/];
  assign T570 = T571;
  assign T571 = io_chanxy_in[8'hbc/* 188*/:8'hbb/* 187*/];
  assign T572 = T573;
  assign T573 = T574;
  assign T574 = T578[T575];
  assign T575 = T576;
  assign T576 = T577;
  assign T577 = io_chanxy_config[7'h59/* 89*/:7'h57/* 87*/];
  assign T578 = T579;
  assign T579 = io_chanxy_in[8'hc4/* 196*/:8'hbd/* 189*/];
  assign T580 = T581;
  assign T581 = T582;
  assign T582 = io_chanxy_in[8'hc5/* 197*/:8'hc5/* 197*/];
  assign io_ipin_out = T583;
  assign T583 = T584;
  assign T584 = {T660, T585};
  assign T585 = T586;
  assign T586 = {T651, T587};
  assign T587 = T588;
  assign T588 = {T642, T589};
  assign T589 = T590;
  assign T590 = {T633, T591};
  assign T591 = T592;
  assign T592 = {T624, T593};
  assign T593 = T594;
  assign T594 = {T615, T595};
  assign T595 = T596;
  assign T596 = {T606, T597};
  assign T597 = T598;
  assign T598 = T599;
  assign T599 = T604[T600];
  assign T600 = T601;
  assign T601 = T602;
  assign T602 = {6'h0/* 0*/, T603};
  assign T603 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T604 = T605;
  assign T605 = io_ipin_in[4'h9/* 9*/:1'h0/* 0*/];
  assign T606 = T607;
  assign T607 = T608;
  assign T608 = T613[T609];
  assign T609 = T610;
  assign T610 = T611;
  assign T611 = {6'h0/* 0*/, T612};
  assign T612 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T613 = T614;
  assign T614 = io_ipin_in[5'h13/* 19*/:4'ha/* 10*/];
  assign T615 = T616;
  assign T616 = T617;
  assign T617 = T622[T618];
  assign T618 = T619;
  assign T619 = T620;
  assign T620 = {6'h0/* 0*/, T621};
  assign T621 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T622 = T623;
  assign T623 = io_ipin_in[5'h1d/* 29*/:5'h14/* 20*/];
  assign T624 = T625;
  assign T625 = T626;
  assign T626 = T631[T627];
  assign T627 = T628;
  assign T628 = T629;
  assign T629 = {6'h0/* 0*/, T630};
  assign T630 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T631 = T632;
  assign T632 = io_ipin_in[6'h27/* 39*/:5'h1e/* 30*/];
  assign T633 = T634;
  assign T634 = T635;
  assign T635 = T640[T636];
  assign T636 = T637;
  assign T637 = T638;
  assign T638 = {6'h0/* 0*/, T639};
  assign T639 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T640 = T641;
  assign T641 = io_ipin_in[6'h31/* 49*/:6'h28/* 40*/];
  assign T642 = T643;
  assign T643 = T644;
  assign T644 = T649[T645];
  assign T645 = T646;
  assign T646 = T647;
  assign T647 = {6'h0/* 0*/, T648};
  assign T648 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T649 = T650;
  assign T650 = io_ipin_in[6'h3b/* 59*/:6'h32/* 50*/];
  assign T651 = T652;
  assign T652 = T653;
  assign T653 = T658[T654];
  assign T654 = T655;
  assign T655 = T656;
  assign T656 = {6'h0/* 0*/, T657};
  assign T657 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T658 = T659;
  assign T659 = io_ipin_in[7'h45/* 69*/:6'h3c/* 60*/];
  assign T660 = T661;
  assign T661 = T662;
  assign T662 = T667[T663];
  assign T663 = T664;
  assign T664 = T665;
  assign T665 = {6'h0/* 0*/, T666};
  assign T666 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T667 = T668;
  assign T668 = io_ipin_in[7'h4f/* 79*/:7'h46/* 70*/];
endmodule

module io_tile_sp_7(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [197:0] io_chanxy_in,
    output[59:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[59:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h8/* 8*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_2 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_woc(
    input [79:0] io_ipin_in,
    input [31:0] io_ipin_config,
    output[7:0] io_ipin_out);

  wire[7:0] T0;
  wire[7:0] T1;
  wire[6:0] T2;
  wire[6:0] T3;
  wire[5:0] T4;
  wire[5:0] T5;
  wire[4:0] T6;
  wire[4:0] T7;
  wire[3:0] T8;
  wire[3:0] T9;
  wire[2:0] T10;
  wire[2:0] T11;
  wire[1:0] T12;
  wire[1:0] T13;
  wire T14;
  wire T15;
  wire T16;
  wire[9:0] T17;
  wire[9:0] T18;
  wire[9:0] T19;
  wire[3:0] T20;
  wire[9:0] T21;
  wire[9:0] T22;
  wire T23;
  wire T24;
  wire T25;
  wire[9:0] T26;
  wire[9:0] T27;
  wire[9:0] T28;
  wire[3:0] T29;
  wire[9:0] T30;
  wire[9:0] T31;
  wire T32;
  wire T33;
  wire T34;
  wire[9:0] T35;
  wire[9:0] T36;
  wire[9:0] T37;
  wire[3:0] T38;
  wire[9:0] T39;
  wire[9:0] T40;
  wire T41;
  wire T42;
  wire T43;
  wire[9:0] T44;
  wire[9:0] T45;
  wire[9:0] T46;
  wire[3:0] T47;
  wire[9:0] T48;
  wire[9:0] T49;
  wire T50;
  wire T51;
  wire T52;
  wire[9:0] T53;
  wire[9:0] T54;
  wire[9:0] T55;
  wire[3:0] T56;
  wire[9:0] T57;
  wire[9:0] T58;
  wire T59;
  wire T60;
  wire T61;
  wire[9:0] T62;
  wire[9:0] T63;
  wire[9:0] T64;
  wire[3:0] T65;
  wire[9:0] T66;
  wire[9:0] T67;
  wire T68;
  wire T69;
  wire T70;
  wire[9:0] T71;
  wire[9:0] T72;
  wire[9:0] T73;
  wire[3:0] T74;
  wire[9:0] T75;
  wire[9:0] T76;
  wire T77;
  wire T78;
  wire T79;
  wire[9:0] T80;
  wire[9:0] T81;
  wire[9:0] T82;
  wire[3:0] T83;
  wire[9:0] T84;
  wire[9:0] T85;

  assign io_ipin_out = T0;
  assign T0 = T1;
  assign T1 = {T77, T2};
  assign T2 = T3;
  assign T3 = {T68, T4};
  assign T4 = T5;
  assign T5 = {T59, T6};
  assign T6 = T7;
  assign T7 = {T50, T8};
  assign T8 = T9;
  assign T9 = {T41, T10};
  assign T10 = T11;
  assign T11 = {T32, T12};
  assign T12 = T13;
  assign T13 = {T23, T14};
  assign T14 = T15;
  assign T15 = T16;
  assign T16 = T21[T17];
  assign T17 = T18;
  assign T18 = T19;
  assign T19 = {6'h0/* 0*/, T20};
  assign T20 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T21 = T22;
  assign T22 = io_ipin_in[4'h9/* 9*/:1'h0/* 0*/];
  assign T23 = T24;
  assign T24 = T25;
  assign T25 = T30[T26];
  assign T26 = T27;
  assign T27 = T28;
  assign T28 = {6'h0/* 0*/, T29};
  assign T29 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T30 = T31;
  assign T31 = io_ipin_in[5'h13/* 19*/:4'ha/* 10*/];
  assign T32 = T33;
  assign T33 = T34;
  assign T34 = T39[T35];
  assign T35 = T36;
  assign T36 = T37;
  assign T37 = {6'h0/* 0*/, T38};
  assign T38 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T39 = T40;
  assign T40 = io_ipin_in[5'h1d/* 29*/:5'h14/* 20*/];
  assign T41 = T42;
  assign T42 = T43;
  assign T43 = T48[T44];
  assign T44 = T45;
  assign T45 = T46;
  assign T46 = {6'h0/* 0*/, T47};
  assign T47 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T48 = T49;
  assign T49 = io_ipin_in[6'h27/* 39*/:5'h1e/* 30*/];
  assign T50 = T51;
  assign T51 = T52;
  assign T52 = T57[T53];
  assign T53 = T54;
  assign T54 = T55;
  assign T55 = {6'h0/* 0*/, T56};
  assign T56 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T57 = T58;
  assign T58 = io_ipin_in[6'h31/* 49*/:6'h28/* 40*/];
  assign T59 = T60;
  assign T60 = T61;
  assign T61 = T66[T62];
  assign T62 = T63;
  assign T63 = T64;
  assign T64 = {6'h0/* 0*/, T65};
  assign T65 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T66 = T67;
  assign T67 = io_ipin_in[6'h3b/* 59*/:6'h32/* 50*/];
  assign T68 = T69;
  assign T69 = T70;
  assign T70 = T75[T71];
  assign T71 = T72;
  assign T72 = T73;
  assign T73 = {6'h0/* 0*/, T74};
  assign T74 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T75 = T76;
  assign T76 = io_ipin_in[7'h45/* 69*/:6'h3c/* 60*/];
  assign T77 = T78;
  assign T78 = T79;
  assign T79 = T84[T80];
  assign T80 = T81;
  assign T81 = T82;
  assign T82 = {6'h0/* 0*/, T83};
  assign T83 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T84 = T85;
  assign T85 = io_ipin_in[7'h4f/* 79*/:7'h46/* 70*/];
endmodule


module io_tile_sp_8(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {7'h0/* 0*/, 1'h1/* 1*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_9(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {6'h0/* 0*/, 2'h2/* 2*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_10(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {6'h0/* 0*/, 2'h3/* 3*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_11(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h4/* 4*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_12(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h5/* 5*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_13(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h6/* 6*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_14(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h7/* 7*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_15(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h8/* 8*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_16(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [197:0] io_chanxy_in,
    output[59:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[59:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h1/* 1*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_17(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {6'h0/* 0*/, 2'h2/* 2*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_18(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {6'h0/* 0*/, 2'h3/* 3*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_19(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {5'h0/* 0*/, 3'h4/* 4*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_20(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {5'h0/* 0*/, 3'h5/* 5*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_21(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {5'h0/* 0*/, 3'h6/* 6*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_22(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {5'h0/* 0*/, 3'h7/* 7*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_23(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [197:0] io_chanxy_in,
    output[59:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[59:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {4'h0/* 0*/, 4'h8/* 8*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_2 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_24(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h1/* 1*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_25(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {6'h0/* 0*/, 2'h2/* 2*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_26(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {6'h0/* 0*/, 2'h3/* 3*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_27(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h4/* 4*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_28(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h5/* 5*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_29(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h6/* 6*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_30(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h7/* 7*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_31(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h8/* 8*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule


// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module io_sbcb_wc(
    input [79:0] io_ipin_in,
    input [31:0] io_ipin_config,
    input [197:0] io_chanxy_in,
    input [89:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[59:0] io_chanxy_out);

  wire[59:0] T0;
  wire[59:0] T1;
  wire[58:0] T2;
  wire[58:0] T3;
  wire[57:0] T4;
  wire[57:0] T5;
  wire[56:0] T6;
  wire[56:0] T7;
  wire[55:0] T8;
  wire[55:0] T9;
  wire[54:0] T10;
  wire[54:0] T11;
  wire[53:0] T12;
  wire[53:0] T13;
  wire[52:0] T14;
  wire[52:0] T15;
  wire[51:0] T16;
  wire[51:0] T17;
  wire[50:0] T18;
  wire[50:0] T19;
  wire[49:0] T20;
  wire[49:0] T21;
  wire[48:0] T22;
  wire[48:0] T23;
  wire[47:0] T24;
  wire[47:0] T25;
  wire[46:0] T26;
  wire[46:0] T27;
  wire[45:0] T28;
  wire[45:0] T29;
  wire[44:0] T30;
  wire[44:0] T31;
  wire[43:0] T32;
  wire[43:0] T33;
  wire[42:0] T34;
  wire[42:0] T35;
  wire[41:0] T36;
  wire[41:0] T37;
  wire[40:0] T38;
  wire[40:0] T39;
  wire[39:0] T40;
  wire[39:0] T41;
  wire[38:0] T42;
  wire[38:0] T43;
  wire[37:0] T44;
  wire[37:0] T45;
  wire[36:0] T46;
  wire[36:0] T47;
  wire[35:0] T48;
  wire[35:0] T49;
  wire[34:0] T50;
  wire[34:0] T51;
  wire[33:0] T52;
  wire[33:0] T53;
  wire[32:0] T54;
  wire[32:0] T55;
  wire[31:0] T56;
  wire[31:0] T57;
  wire[30:0] T58;
  wire[30:0] T59;
  wire[29:0] T60;
  wire[29:0] T61;
  wire[28:0] T62;
  wire[28:0] T63;
  wire[27:0] T64;
  wire[27:0] T65;
  wire[26:0] T66;
  wire[26:0] T67;
  wire[25:0] T68;
  wire[25:0] T69;
  wire[24:0] T70;
  wire[24:0] T71;
  wire[23:0] T72;
  wire[23:0] T73;
  wire[22:0] T74;
  wire[22:0] T75;
  wire[21:0] T76;
  wire[21:0] T77;
  wire[20:0] T78;
  wire[20:0] T79;
  wire[19:0] T80;
  wire[19:0] T81;
  wire[18:0] T82;
  wire[18:0] T83;
  wire[17:0] T84;
  wire[17:0] T85;
  wire[16:0] T86;
  wire[16:0] T87;
  wire[15:0] T88;
  wire[15:0] T89;
  wire[14:0] T90;
  wire[14:0] T91;
  wire[13:0] T92;
  wire[13:0] T93;
  wire[12:0] T94;
  wire[12:0] T95;
  wire[11:0] T96;
  wire[11:0] T97;
  wire[10:0] T98;
  wire[10:0] T99;
  wire[9:0] T100;
  wire[9:0] T101;
  wire[8:0] T102;
  wire[8:0] T103;
  wire[7:0] T104;
  wire[7:0] T105;
  wire[6:0] T106;
  wire[6:0] T107;
  wire[5:0] T108;
  wire[5:0] T109;
  wire[4:0] T110;
  wire[4:0] T111;
  wire[3:0] T112;
  wire[3:0] T113;
  wire[2:0] T114;
  wire[2:0] T115;
  wire[1:0] T116;
  wire[1:0] T117;
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire[1:0] T124;
  wire[1:0] T125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  wire T130;
  wire T131;
  wire[1:0] T132;
  wire[1:0] T133;
  wire T134;
  wire T135;
  wire T136;
  wire[3:0] T137;
  wire[3:0] T138;
  wire[3:0] T139;
  wire[8:0] T140;
  wire[8:0] T141;
  wire T142;
  wire T143;
  wire T144;
  wire T145;
  wire T146;
  wire T147;
  wire[1:0] T148;
  wire[1:0] T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  wire[1:0] T156;
  wire[1:0] T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire T162;
  wire T163;
  wire[1:0] T164;
  wire[1:0] T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  wire T170;
  wire T171;
  wire[1:0] T172;
  wire[1:0] T173;
  wire T174;
  wire T175;
  wire T176;
  wire[3:0] T177;
  wire[3:0] T178;
  wire[3:0] T179;
  wire[8:0] T180;
  wire[8:0] T181;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire T186;
  wire T187;
  wire[1:0] T188;
  wire[1:0] T189;
  wire T190;
  wire T191;
  wire T192;
  wire T193;
  wire T194;
  wire T195;
  wire[1:0] T196;
  wire[1:0] T197;
  wire T198;
  wire T199;
  wire T200;
  wire T201;
  wire T202;
  wire T203;
  wire[1:0] T204;
  wire[1:0] T205;
  wire T206;
  wire T207;
  wire T208;
  wire T209;
  wire T210;
  wire T211;
  wire[1:0] T212;
  wire[1:0] T213;
  wire T214;
  wire T215;
  wire T216;
  wire[3:0] T217;
  wire[3:0] T218;
  wire[3:0] T219;
  wire[8:0] T220;
  wire[8:0] T221;
  wire T222;
  wire T223;
  wire T224;
  wire T225;
  wire T226;
  wire T227;
  wire[1:0] T228;
  wire[1:0] T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire[1:0] T236;
  wire[1:0] T237;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire T242;
  wire T243;
  wire[1:0] T244;
  wire[1:0] T245;
  wire T246;
  wire T247;
  wire T248;
  wire T249;
  wire T250;
  wire T251;
  wire[1:0] T252;
  wire[1:0] T253;
  wire T254;
  wire T255;
  wire T256;
  wire[3:0] T257;
  wire[3:0] T258;
  wire[3:0] T259;
  wire[8:0] T260;
  wire[8:0] T261;
  wire T262;
  wire T263;
  wire T264;
  wire T265;
  wire T266;
  wire T267;
  wire[1:0] T268;
  wire[1:0] T269;
  wire T270;
  wire T271;
  wire T272;
  wire T273;
  wire T274;
  wire T275;
  wire[1:0] T276;
  wire[1:0] T277;
  wire T278;
  wire T279;
  wire T280;
  wire T281;
  wire T282;
  wire T283;
  wire[1:0] T284;
  wire[1:0] T285;
  wire T286;
  wire T287;
  wire T288;
  wire T289;
  wire T290;
  wire T291;
  wire[1:0] T292;
  wire[1:0] T293;
  wire T294;
  wire T295;
  wire T296;
  wire[3:0] T297;
  wire[3:0] T298;
  wire[3:0] T299;
  wire[8:0] T300;
  wire[8:0] T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire T306;
  wire T307;
  wire[1:0] T308;
  wire[1:0] T309;
  wire T310;
  wire T311;
  wire T312;
  wire T313;
  wire T314;
  wire T315;
  wire[1:0] T316;
  wire[1:0] T317;
  wire T318;
  wire T319;
  wire T320;
  wire T321;
  wire T322;
  wire T323;
  wire[1:0] T324;
  wire[1:0] T325;
  wire T326;
  wire T327;
  wire T328;
  wire T329;
  wire T330;
  wire T331;
  wire[1:0] T332;
  wire[1:0] T333;
  wire T334;
  wire T335;
  wire T336;
  wire[3:0] T337;
  wire[3:0] T338;
  wire[3:0] T339;
  wire[8:0] T340;
  wire[8:0] T341;
  wire T342;
  wire T343;
  wire T344;
  wire T345;
  wire T346;
  wire T347;
  wire[1:0] T348;
  wire[1:0] T349;
  wire T350;
  wire T351;
  wire T352;
  wire T353;
  wire T354;
  wire T355;
  wire[1:0] T356;
  wire[1:0] T357;
  wire T358;
  wire T359;
  wire T360;
  wire T361;
  wire T362;
  wire T363;
  wire[1:0] T364;
  wire[1:0] T365;
  wire T366;
  wire T367;
  wire T368;
  wire T369;
  wire T370;
  wire T371;
  wire[1:0] T372;
  wire[1:0] T373;
  wire T374;
  wire T375;
  wire T376;
  wire[3:0] T377;
  wire[3:0] T378;
  wire[3:0] T379;
  wire[8:0] T380;
  wire[8:0] T381;
  wire T382;
  wire T383;
  wire T384;
  wire T385;
  wire T386;
  wire T387;
  wire[1:0] T388;
  wire[1:0] T389;
  wire T390;
  wire T391;
  wire T392;
  wire T393;
  wire T394;
  wire T395;
  wire[1:0] T396;
  wire[1:0] T397;
  wire T398;
  wire T399;
  wire T400;
  wire T401;
  wire T402;
  wire T403;
  wire[1:0] T404;
  wire[1:0] T405;
  wire T406;
  wire T407;
  wire T408;
  wire T409;
  wire T410;
  wire T411;
  wire[1:0] T412;
  wire[1:0] T413;
  wire T414;
  wire T415;
  wire T416;
  wire[3:0] T417;
  wire[3:0] T418;
  wire[3:0] T419;
  wire[8:0] T420;
  wire[8:0] T421;
  wire T422;
  wire T423;
  wire T424;
  wire T425;
  wire T426;
  wire T427;
  wire[1:0] T428;
  wire[1:0] T429;
  wire T430;
  wire T431;
  wire T432;
  wire T433;
  wire T434;
  wire T435;
  wire[1:0] T436;
  wire[1:0] T437;
  wire T438;
  wire T439;
  wire T440;
  wire T441;
  wire T442;
  wire T443;
  wire[1:0] T444;
  wire[1:0] T445;
  wire T446;
  wire T447;
  wire T448;
  wire T449;
  wire T450;
  wire T451;
  wire[1:0] T452;
  wire[1:0] T453;
  wire T454;
  wire T455;
  wire T456;
  wire[3:0] T457;
  wire[3:0] T458;
  wire[3:0] T459;
  wire[8:0] T460;
  wire[8:0] T461;
  wire T462;
  wire T463;
  wire T464;
  wire T465;
  wire T466;
  wire T467;
  wire[1:0] T468;
  wire[1:0] T469;
  wire T470;
  wire T471;
  wire T472;
  wire T473;
  wire T474;
  wire T475;
  wire[1:0] T476;
  wire[1:0] T477;
  wire T478;
  wire T479;
  wire T480;
  wire T481;
  wire T482;
  wire T483;
  wire[1:0] T484;
  wire[1:0] T485;
  wire T486;
  wire T487;
  wire T488;
  wire T489;
  wire T490;
  wire T491;
  wire[1:0] T492;
  wire[1:0] T493;
  wire T494;
  wire T495;
  wire T496;
  wire[2:0] T497;
  wire[2:0] T498;
  wire[2:0] T499;
  wire[7:0] T500;
  wire[7:0] T501;
  wire T502;
  wire T503;
  wire T504;
  wire T505;
  wire T506;
  wire T507;
  wire[1:0] T508;
  wire[1:0] T509;
  wire T510;
  wire T511;
  wire T512;
  wire T513;
  wire T514;
  wire T515;
  wire[1:0] T516;
  wire[1:0] T517;
  wire T518;
  wire T519;
  wire T520;
  wire T521;
  wire T522;
  wire T523;
  wire[1:0] T524;
  wire[1:0] T525;
  wire T526;
  wire T527;
  wire T528;
  wire T529;
  wire T530;
  wire T531;
  wire[1:0] T532;
  wire[1:0] T533;
  wire T534;
  wire T535;
  wire T536;
  wire[2:0] T537;
  wire[2:0] T538;
  wire[2:0] T539;
  wire[7:0] T540;
  wire[7:0] T541;
  wire T542;
  wire T543;
  wire T544;
  wire T545;
  wire T546;
  wire T547;
  wire[1:0] T548;
  wire[1:0] T549;
  wire T550;
  wire T551;
  wire T552;
  wire T553;
  wire T554;
  wire T555;
  wire[1:0] T556;
  wire[1:0] T557;
  wire T558;
  wire T559;
  wire T560;
  wire T561;
  wire T562;
  wire T563;
  wire[1:0] T564;
  wire[1:0] T565;
  wire T566;
  wire T567;
  wire T568;
  wire T569;
  wire T570;
  wire T571;
  wire[2:0] T572;
  wire[2:0] T573;
  wire[2:0] T574;
  wire[7:0] T575;
  wire[7:0] T576;
  wire T577;
  wire T578;
  wire T579;
  wire T580;
  wire T581;
  wire T582;
  wire[7:0] T583;
  wire[7:0] T584;
  wire[6:0] T585;
  wire[6:0] T586;
  wire[5:0] T587;
  wire[5:0] T588;
  wire[4:0] T589;
  wire[4:0] T590;
  wire[3:0] T591;
  wire[3:0] T592;
  wire[2:0] T593;
  wire[2:0] T594;
  wire[1:0] T595;
  wire[1:0] T596;
  wire T597;
  wire T598;
  wire T599;
  wire[9:0] T600;
  wire[9:0] T601;
  wire[9:0] T602;
  wire[3:0] T603;
  wire[9:0] T604;
  wire[9:0] T605;
  wire T606;
  wire T607;
  wire T608;
  wire[9:0] T609;
  wire[9:0] T610;
  wire[9:0] T611;
  wire[3:0] T612;
  wire[9:0] T613;
  wire[9:0] T614;
  wire T615;
  wire T616;
  wire T617;
  wire[9:0] T618;
  wire[9:0] T619;
  wire[9:0] T620;
  wire[3:0] T621;
  wire[9:0] T622;
  wire[9:0] T623;
  wire T624;
  wire T625;
  wire T626;
  wire[9:0] T627;
  wire[9:0] T628;
  wire[9:0] T629;
  wire[3:0] T630;
  wire[9:0] T631;
  wire[9:0] T632;
  wire T633;
  wire T634;
  wire T635;
  wire[9:0] T636;
  wire[9:0] T637;
  wire[9:0] T638;
  wire[3:0] T639;
  wire[9:0] T640;
  wire[9:0] T641;
  wire T642;
  wire T643;
  wire T644;
  wire[9:0] T645;
  wire[9:0] T646;
  wire[9:0] T647;
  wire[3:0] T648;
  wire[9:0] T649;
  wire[9:0] T650;
  wire T651;
  wire T652;
  wire T653;
  wire[9:0] T654;
  wire[9:0] T655;
  wire[9:0] T656;
  wire[3:0] T657;
  wire[9:0] T658;
  wire[9:0] T659;
  wire T660;
  wire T661;
  wire T662;
  wire[9:0] T663;
  wire[9:0] T664;
  wire[9:0] T665;
  wire[3:0] T666;
  wire[9:0] T667;
  wire[9:0] T668;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T580, T2};
  assign T2 = T3;
  assign T3 = {T577, T4};
  assign T4 = T5;
  assign T5 = {T569, T6};
  assign T6 = T7;
  assign T7 = {T566, T8};
  assign T8 = T9;
  assign T9 = {T558, T10};
  assign T10 = T11;
  assign T11 = {T550, T12};
  assign T12 = T13;
  assign T13 = {T542, T14};
  assign T14 = T15;
  assign T15 = {T534, T16};
  assign T16 = T17;
  assign T17 = {T526, T18};
  assign T18 = T19;
  assign T19 = {T518, T20};
  assign T20 = T21;
  assign T21 = {T510, T22};
  assign T22 = T23;
  assign T23 = {T502, T24};
  assign T24 = T25;
  assign T25 = {T494, T26};
  assign T26 = T27;
  assign T27 = {T486, T28};
  assign T28 = T29;
  assign T29 = {T478, T30};
  assign T30 = T31;
  assign T31 = {T470, T32};
  assign T32 = T33;
  assign T33 = {T462, T34};
  assign T34 = T35;
  assign T35 = {T454, T36};
  assign T36 = T37;
  assign T37 = {T446, T38};
  assign T38 = T39;
  assign T39 = {T438, T40};
  assign T40 = T41;
  assign T41 = {T430, T42};
  assign T42 = T43;
  assign T43 = {T422, T44};
  assign T44 = T45;
  assign T45 = {T414, T46};
  assign T46 = T47;
  assign T47 = {T406, T48};
  assign T48 = T49;
  assign T49 = {T398, T50};
  assign T50 = T51;
  assign T51 = {T390, T52};
  assign T52 = T53;
  assign T53 = {T382, T54};
  assign T54 = T55;
  assign T55 = {T374, T56};
  assign T56 = T57;
  assign T57 = {T366, T58};
  assign T58 = T59;
  assign T59 = {T358, T60};
  assign T60 = T61;
  assign T61 = {T350, T62};
  assign T62 = T63;
  assign T63 = {T342, T64};
  assign T64 = T65;
  assign T65 = {T334, T66};
  assign T66 = T67;
  assign T67 = {T326, T68};
  assign T68 = T69;
  assign T69 = {T318, T70};
  assign T70 = T71;
  assign T71 = {T310, T72};
  assign T72 = T73;
  assign T73 = {T302, T74};
  assign T74 = T75;
  assign T75 = {T294, T76};
  assign T76 = T77;
  assign T77 = {T286, T78};
  assign T78 = T79;
  assign T79 = {T278, T80};
  assign T80 = T81;
  assign T81 = {T270, T82};
  assign T82 = T83;
  assign T83 = {T262, T84};
  assign T84 = T85;
  assign T85 = {T254, T86};
  assign T86 = T87;
  assign T87 = {T246, T88};
  assign T88 = T89;
  assign T89 = {T238, T90};
  assign T90 = T91;
  assign T91 = {T230, T92};
  assign T92 = T93;
  assign T93 = {T222, T94};
  assign T94 = T95;
  assign T95 = {T214, T96};
  assign T96 = T97;
  assign T97 = {T206, T98};
  assign T98 = T99;
  assign T99 = {T198, T100};
  assign T100 = T101;
  assign T101 = {T190, T102};
  assign T102 = T103;
  assign T103 = {T182, T104};
  assign T104 = T105;
  assign T105 = {T174, T106};
  assign T106 = T107;
  assign T107 = {T166, T108};
  assign T108 = T109;
  assign T109 = {T158, T110};
  assign T110 = T111;
  assign T111 = {T150, T112};
  assign T112 = T113;
  assign T113 = {T142, T114};
  assign T114 = T115;
  assign T115 = {T134, T116};
  assign T116 = T117;
  assign T117 = {T126, T118};
  assign T118 = T119;
  assign T119 = T120;
  assign T120 = T124[T121];
  assign T121 = T122;
  assign T122 = T123;
  assign T123 = io_chanxy_config[1'h0/* 0*/:1'h0/* 0*/];
  assign T124 = T125;
  assign T125 = io_chanxy_in[1'h1/* 1*/:1'h0/* 0*/];
  assign T126 = T127;
  assign T127 = T128;
  assign T128 = T132[T129];
  assign T129 = T130;
  assign T130 = T131;
  assign T131 = io_chanxy_config[1'h1/* 1*/:1'h1/* 1*/];
  assign T132 = T133;
  assign T133 = io_chanxy_in[2'h3/* 3*/:2'h2/* 2*/];
  assign T134 = T135;
  assign T135 = T136;
  assign T136 = T140[T137];
  assign T137 = T138;
  assign T138 = T139;
  assign T139 = io_chanxy_config[3'h5/* 5*/:2'h2/* 2*/];
  assign T140 = T141;
  assign T141 = io_chanxy_in[4'hc/* 12*/:3'h4/* 4*/];
  assign T142 = T143;
  assign T143 = T144;
  assign T144 = T148[T145];
  assign T145 = T146;
  assign T146 = T147;
  assign T147 = io_chanxy_config[3'h6/* 6*/:3'h6/* 6*/];
  assign T148 = T149;
  assign T149 = io_chanxy_in[4'he/* 14*/:4'hd/* 13*/];
  assign T150 = T151;
  assign T151 = T152;
  assign T152 = T156[T153];
  assign T153 = T154;
  assign T154 = T155;
  assign T155 = io_chanxy_config[3'h7/* 7*/:3'h7/* 7*/];
  assign T156 = T157;
  assign T157 = io_chanxy_in[5'h10/* 16*/:4'hf/* 15*/];
  assign T158 = T159;
  assign T159 = T160;
  assign T160 = T164[T161];
  assign T161 = T162;
  assign T162 = T163;
  assign T163 = io_chanxy_config[4'h8/* 8*/:4'h8/* 8*/];
  assign T164 = T165;
  assign T165 = io_chanxy_in[5'h12/* 18*/:5'h11/* 17*/];
  assign T166 = T167;
  assign T167 = T168;
  assign T168 = T172[T169];
  assign T169 = T170;
  assign T170 = T171;
  assign T171 = io_chanxy_config[4'h9/* 9*/:4'h9/* 9*/];
  assign T172 = T173;
  assign T173 = io_chanxy_in[5'h14/* 20*/:5'h13/* 19*/];
  assign T174 = T175;
  assign T175 = T176;
  assign T176 = T180[T177];
  assign T177 = T178;
  assign T178 = T179;
  assign T179 = io_chanxy_config[4'hd/* 13*/:4'ha/* 10*/];
  assign T180 = T181;
  assign T181 = io_chanxy_in[5'h1d/* 29*/:5'h15/* 21*/];
  assign T182 = T183;
  assign T183 = T184;
  assign T184 = T188[T185];
  assign T185 = T186;
  assign T186 = T187;
  assign T187 = io_chanxy_config[4'he/* 14*/:4'he/* 14*/];
  assign T188 = T189;
  assign T189 = io_chanxy_in[5'h1f/* 31*/:5'h1e/* 30*/];
  assign T190 = T191;
  assign T191 = T192;
  assign T192 = T196[T193];
  assign T193 = T194;
  assign T194 = T195;
  assign T195 = io_chanxy_config[4'hf/* 15*/:4'hf/* 15*/];
  assign T196 = T197;
  assign T197 = io_chanxy_in[6'h21/* 33*/:6'h20/* 32*/];
  assign T198 = T199;
  assign T199 = T200;
  assign T200 = T204[T201];
  assign T201 = T202;
  assign T202 = T203;
  assign T203 = io_chanxy_config[5'h10/* 16*/:5'h10/* 16*/];
  assign T204 = T205;
  assign T205 = io_chanxy_in[6'h23/* 35*/:6'h22/* 34*/];
  assign T206 = T207;
  assign T207 = T208;
  assign T208 = T212[T209];
  assign T209 = T210;
  assign T210 = T211;
  assign T211 = io_chanxy_config[5'h11/* 17*/:5'h11/* 17*/];
  assign T212 = T213;
  assign T213 = io_chanxy_in[6'h25/* 37*/:6'h24/* 36*/];
  assign T214 = T215;
  assign T215 = T216;
  assign T216 = T220[T217];
  assign T217 = T218;
  assign T218 = T219;
  assign T219 = io_chanxy_config[5'h15/* 21*/:5'h12/* 18*/];
  assign T220 = T221;
  assign T221 = io_chanxy_in[6'h2e/* 46*/:6'h26/* 38*/];
  assign T222 = T223;
  assign T223 = T224;
  assign T224 = T228[T225];
  assign T225 = T226;
  assign T226 = T227;
  assign T227 = io_chanxy_config[5'h16/* 22*/:5'h16/* 22*/];
  assign T228 = T229;
  assign T229 = io_chanxy_in[6'h30/* 48*/:6'h2f/* 47*/];
  assign T230 = T231;
  assign T231 = T232;
  assign T232 = T236[T233];
  assign T233 = T234;
  assign T234 = T235;
  assign T235 = io_chanxy_config[5'h17/* 23*/:5'h17/* 23*/];
  assign T236 = T237;
  assign T237 = io_chanxy_in[6'h32/* 50*/:6'h31/* 49*/];
  assign T238 = T239;
  assign T239 = T240;
  assign T240 = T244[T241];
  assign T241 = T242;
  assign T242 = T243;
  assign T243 = io_chanxy_config[5'h18/* 24*/:5'h18/* 24*/];
  assign T244 = T245;
  assign T245 = io_chanxy_in[6'h34/* 52*/:6'h33/* 51*/];
  assign T246 = T247;
  assign T247 = T248;
  assign T248 = T252[T249];
  assign T249 = T250;
  assign T250 = T251;
  assign T251 = io_chanxy_config[5'h19/* 25*/:5'h19/* 25*/];
  assign T252 = T253;
  assign T253 = io_chanxy_in[6'h36/* 54*/:6'h35/* 53*/];
  assign T254 = T255;
  assign T255 = T256;
  assign T256 = T260[T257];
  assign T257 = T258;
  assign T258 = T259;
  assign T259 = io_chanxy_config[5'h1d/* 29*/:5'h1a/* 26*/];
  assign T260 = T261;
  assign T261 = io_chanxy_in[6'h3f/* 63*/:6'h37/* 55*/];
  assign T262 = T263;
  assign T263 = T264;
  assign T264 = T268[T265];
  assign T265 = T266;
  assign T266 = T267;
  assign T267 = io_chanxy_config[5'h1e/* 30*/:5'h1e/* 30*/];
  assign T268 = T269;
  assign T269 = io_chanxy_in[7'h41/* 65*/:7'h40/* 64*/];
  assign T270 = T271;
  assign T271 = T272;
  assign T272 = T276[T273];
  assign T273 = T274;
  assign T274 = T275;
  assign T275 = io_chanxy_config[5'h1f/* 31*/:5'h1f/* 31*/];
  assign T276 = T277;
  assign T277 = io_chanxy_in[7'h43/* 67*/:7'h42/* 66*/];
  assign T278 = T279;
  assign T279 = T280;
  assign T280 = T284[T281];
  assign T281 = T282;
  assign T282 = T283;
  assign T283 = io_chanxy_config[6'h20/* 32*/:6'h20/* 32*/];
  assign T284 = T285;
  assign T285 = io_chanxy_in[7'h45/* 69*/:7'h44/* 68*/];
  assign T286 = T287;
  assign T287 = T288;
  assign T288 = T292[T289];
  assign T289 = T290;
  assign T290 = T291;
  assign T291 = io_chanxy_config[6'h21/* 33*/:6'h21/* 33*/];
  assign T292 = T293;
  assign T293 = io_chanxy_in[7'h47/* 71*/:7'h46/* 70*/];
  assign T294 = T295;
  assign T295 = T296;
  assign T296 = T300[T297];
  assign T297 = T298;
  assign T298 = T299;
  assign T299 = io_chanxy_config[6'h25/* 37*/:6'h22/* 34*/];
  assign T300 = T301;
  assign T301 = io_chanxy_in[7'h50/* 80*/:7'h48/* 72*/];
  assign T302 = T303;
  assign T303 = T304;
  assign T304 = T308[T305];
  assign T305 = T306;
  assign T306 = T307;
  assign T307 = io_chanxy_config[6'h26/* 38*/:6'h26/* 38*/];
  assign T308 = T309;
  assign T309 = io_chanxy_in[7'h52/* 82*/:7'h51/* 81*/];
  assign T310 = T311;
  assign T311 = T312;
  assign T312 = T316[T313];
  assign T313 = T314;
  assign T314 = T315;
  assign T315 = io_chanxy_config[6'h27/* 39*/:6'h27/* 39*/];
  assign T316 = T317;
  assign T317 = io_chanxy_in[7'h54/* 84*/:7'h53/* 83*/];
  assign T318 = T319;
  assign T319 = T320;
  assign T320 = T324[T321];
  assign T321 = T322;
  assign T322 = T323;
  assign T323 = io_chanxy_config[6'h28/* 40*/:6'h28/* 40*/];
  assign T324 = T325;
  assign T325 = io_chanxy_in[7'h56/* 86*/:7'h55/* 85*/];
  assign T326 = T327;
  assign T327 = T328;
  assign T328 = T332[T329];
  assign T329 = T330;
  assign T330 = T331;
  assign T331 = io_chanxy_config[6'h29/* 41*/:6'h29/* 41*/];
  assign T332 = T333;
  assign T333 = io_chanxy_in[7'h58/* 88*/:7'h57/* 87*/];
  assign T334 = T335;
  assign T335 = T336;
  assign T336 = T340[T337];
  assign T337 = T338;
  assign T338 = T339;
  assign T339 = io_chanxy_config[6'h2d/* 45*/:6'h2a/* 42*/];
  assign T340 = T341;
  assign T341 = io_chanxy_in[7'h61/* 97*/:7'h59/* 89*/];
  assign T342 = T343;
  assign T343 = T344;
  assign T344 = T348[T345];
  assign T345 = T346;
  assign T346 = T347;
  assign T347 = io_chanxy_config[6'h2e/* 46*/:6'h2e/* 46*/];
  assign T348 = T349;
  assign T349 = io_chanxy_in[7'h63/* 99*/:7'h62/* 98*/];
  assign T350 = T351;
  assign T351 = T352;
  assign T352 = T356[T353];
  assign T353 = T354;
  assign T354 = T355;
  assign T355 = io_chanxy_config[6'h2f/* 47*/:6'h2f/* 47*/];
  assign T356 = T357;
  assign T357 = io_chanxy_in[7'h65/* 101*/:7'h64/* 100*/];
  assign T358 = T359;
  assign T359 = T360;
  assign T360 = T364[T361];
  assign T361 = T362;
  assign T362 = T363;
  assign T363 = io_chanxy_config[6'h30/* 48*/:6'h30/* 48*/];
  assign T364 = T365;
  assign T365 = io_chanxy_in[7'h67/* 103*/:7'h66/* 102*/];
  assign T366 = T367;
  assign T367 = T368;
  assign T368 = T372[T369];
  assign T369 = T370;
  assign T370 = T371;
  assign T371 = io_chanxy_config[6'h31/* 49*/:6'h31/* 49*/];
  assign T372 = T373;
  assign T373 = io_chanxy_in[7'h69/* 105*/:7'h68/* 104*/];
  assign T374 = T375;
  assign T375 = T376;
  assign T376 = T380[T377];
  assign T377 = T378;
  assign T378 = T379;
  assign T379 = io_chanxy_config[6'h35/* 53*/:6'h32/* 50*/];
  assign T380 = T381;
  assign T381 = io_chanxy_in[7'h72/* 114*/:7'h6a/* 106*/];
  assign T382 = T383;
  assign T383 = T384;
  assign T384 = T388[T385];
  assign T385 = T386;
  assign T386 = T387;
  assign T387 = io_chanxy_config[6'h36/* 54*/:6'h36/* 54*/];
  assign T388 = T389;
  assign T389 = io_chanxy_in[7'h74/* 116*/:7'h73/* 115*/];
  assign T390 = T391;
  assign T391 = T392;
  assign T392 = T396[T393];
  assign T393 = T394;
  assign T394 = T395;
  assign T395 = io_chanxy_config[6'h37/* 55*/:6'h37/* 55*/];
  assign T396 = T397;
  assign T397 = io_chanxy_in[7'h76/* 118*/:7'h75/* 117*/];
  assign T398 = T399;
  assign T399 = T400;
  assign T400 = T404[T401];
  assign T401 = T402;
  assign T402 = T403;
  assign T403 = io_chanxy_config[6'h38/* 56*/:6'h38/* 56*/];
  assign T404 = T405;
  assign T405 = io_chanxy_in[7'h78/* 120*/:7'h77/* 119*/];
  assign T406 = T407;
  assign T407 = T408;
  assign T408 = T412[T409];
  assign T409 = T410;
  assign T410 = T411;
  assign T411 = io_chanxy_config[6'h39/* 57*/:6'h39/* 57*/];
  assign T412 = T413;
  assign T413 = io_chanxy_in[7'h7a/* 122*/:7'h79/* 121*/];
  assign T414 = T415;
  assign T415 = T416;
  assign T416 = T420[T417];
  assign T417 = T418;
  assign T418 = T419;
  assign T419 = io_chanxy_config[6'h3d/* 61*/:6'h3a/* 58*/];
  assign T420 = T421;
  assign T421 = io_chanxy_in[8'h83/* 131*/:7'h7b/* 123*/];
  assign T422 = T423;
  assign T423 = T424;
  assign T424 = T428[T425];
  assign T425 = T426;
  assign T426 = T427;
  assign T427 = io_chanxy_config[6'h3e/* 62*/:6'h3e/* 62*/];
  assign T428 = T429;
  assign T429 = io_chanxy_in[8'h85/* 133*/:8'h84/* 132*/];
  assign T430 = T431;
  assign T431 = T432;
  assign T432 = T436[T433];
  assign T433 = T434;
  assign T434 = T435;
  assign T435 = io_chanxy_config[6'h3f/* 63*/:6'h3f/* 63*/];
  assign T436 = T437;
  assign T437 = io_chanxy_in[8'h87/* 135*/:8'h86/* 134*/];
  assign T438 = T439;
  assign T439 = T440;
  assign T440 = T444[T441];
  assign T441 = T442;
  assign T442 = T443;
  assign T443 = io_chanxy_config[7'h40/* 64*/:7'h40/* 64*/];
  assign T444 = T445;
  assign T445 = io_chanxy_in[8'h89/* 137*/:8'h88/* 136*/];
  assign T446 = T447;
  assign T447 = T448;
  assign T448 = T452[T449];
  assign T449 = T450;
  assign T450 = T451;
  assign T451 = io_chanxy_config[7'h41/* 65*/:7'h41/* 65*/];
  assign T452 = T453;
  assign T453 = io_chanxy_in[8'h8b/* 139*/:8'h8a/* 138*/];
  assign T454 = T455;
  assign T455 = T456;
  assign T456 = T460[T457];
  assign T457 = T458;
  assign T458 = T459;
  assign T459 = io_chanxy_config[7'h45/* 69*/:7'h42/* 66*/];
  assign T460 = T461;
  assign T461 = io_chanxy_in[8'h94/* 148*/:8'h8c/* 140*/];
  assign T462 = T463;
  assign T463 = T464;
  assign T464 = T468[T465];
  assign T465 = T466;
  assign T466 = T467;
  assign T467 = io_chanxy_config[7'h46/* 70*/:7'h46/* 70*/];
  assign T468 = T469;
  assign T469 = io_chanxy_in[8'h96/* 150*/:8'h95/* 149*/];
  assign T470 = T471;
  assign T471 = T472;
  assign T472 = T476[T473];
  assign T473 = T474;
  assign T474 = T475;
  assign T475 = io_chanxy_config[7'h47/* 71*/:7'h47/* 71*/];
  assign T476 = T477;
  assign T477 = io_chanxy_in[8'h98/* 152*/:8'h97/* 151*/];
  assign T478 = T479;
  assign T479 = T480;
  assign T480 = T484[T481];
  assign T481 = T482;
  assign T482 = T483;
  assign T483 = io_chanxy_config[7'h48/* 72*/:7'h48/* 72*/];
  assign T484 = T485;
  assign T485 = io_chanxy_in[8'h9a/* 154*/:8'h99/* 153*/];
  assign T486 = T487;
  assign T487 = T488;
  assign T488 = T492[T489];
  assign T489 = T490;
  assign T490 = T491;
  assign T491 = io_chanxy_config[7'h49/* 73*/:7'h49/* 73*/];
  assign T492 = T493;
  assign T493 = io_chanxy_in[8'h9c/* 156*/:8'h9b/* 155*/];
  assign T494 = T495;
  assign T495 = T496;
  assign T496 = T500[T497];
  assign T497 = T498;
  assign T498 = T499;
  assign T499 = io_chanxy_config[7'h4c/* 76*/:7'h4a/* 74*/];
  assign T500 = T501;
  assign T501 = io_chanxy_in[8'ha4/* 164*/:8'h9d/* 157*/];
  assign T502 = T503;
  assign T503 = T504;
  assign T504 = T508[T505];
  assign T505 = T506;
  assign T506 = T507;
  assign T507 = io_chanxy_config[7'h4d/* 77*/:7'h4d/* 77*/];
  assign T508 = T509;
  assign T509 = io_chanxy_in[8'ha6/* 166*/:8'ha5/* 165*/];
  assign T510 = T511;
  assign T511 = T512;
  assign T512 = T516[T513];
  assign T513 = T514;
  assign T514 = T515;
  assign T515 = io_chanxy_config[7'h4e/* 78*/:7'h4e/* 78*/];
  assign T516 = T517;
  assign T517 = io_chanxy_in[8'ha8/* 168*/:8'ha7/* 167*/];
  assign T518 = T519;
  assign T519 = T520;
  assign T520 = T524[T521];
  assign T521 = T522;
  assign T522 = T523;
  assign T523 = io_chanxy_config[7'h4f/* 79*/:7'h4f/* 79*/];
  assign T524 = T525;
  assign T525 = io_chanxy_in[8'haa/* 170*/:8'ha9/* 169*/];
  assign T526 = T527;
  assign T527 = T528;
  assign T528 = T532[T529];
  assign T529 = T530;
  assign T530 = T531;
  assign T531 = io_chanxy_config[7'h50/* 80*/:7'h50/* 80*/];
  assign T532 = T533;
  assign T533 = io_chanxy_in[8'hac/* 172*/:8'hab/* 171*/];
  assign T534 = T535;
  assign T535 = T536;
  assign T536 = T540[T537];
  assign T537 = T538;
  assign T538 = T539;
  assign T539 = io_chanxy_config[7'h53/* 83*/:7'h51/* 81*/];
  assign T540 = T541;
  assign T541 = io_chanxy_in[8'hb4/* 180*/:8'had/* 173*/];
  assign T542 = T543;
  assign T543 = T544;
  assign T544 = T548[T545];
  assign T545 = T546;
  assign T546 = T547;
  assign T547 = io_chanxy_config[7'h54/* 84*/:7'h54/* 84*/];
  assign T548 = T549;
  assign T549 = io_chanxy_in[8'hb6/* 182*/:8'hb5/* 181*/];
  assign T550 = T551;
  assign T551 = T552;
  assign T552 = T556[T553];
  assign T553 = T554;
  assign T554 = T555;
  assign T555 = io_chanxy_config[7'h55/* 85*/:7'h55/* 85*/];
  assign T556 = T557;
  assign T557 = io_chanxy_in[8'hb8/* 184*/:8'hb7/* 183*/];
  assign T558 = T559;
  assign T559 = T560;
  assign T560 = T564[T561];
  assign T561 = T562;
  assign T562 = T563;
  assign T563 = io_chanxy_config[7'h56/* 86*/:7'h56/* 86*/];
  assign T564 = T565;
  assign T565 = io_chanxy_in[8'hba/* 186*/:8'hb9/* 185*/];
  assign T566 = T567;
  assign T567 = T568;
  assign T568 = io_chanxy_in[8'hbb/* 187*/:8'hbb/* 187*/];
  assign T569 = T570;
  assign T570 = T571;
  assign T571 = T575[T572];
  assign T572 = T573;
  assign T573 = T574;
  assign T574 = io_chanxy_config[7'h59/* 89*/:7'h57/* 87*/];
  assign T575 = T576;
  assign T576 = io_chanxy_in[8'hc3/* 195*/:8'hbc/* 188*/];
  assign T577 = T578;
  assign T578 = T579;
  assign T579 = io_chanxy_in[8'hc4/* 196*/:8'hc4/* 196*/];
  assign T580 = T581;
  assign T581 = T582;
  assign T582 = io_chanxy_in[8'hc5/* 197*/:8'hc5/* 197*/];
  assign io_ipin_out = T583;
  assign T583 = T584;
  assign T584 = {T660, T585};
  assign T585 = T586;
  assign T586 = {T651, T587};
  assign T587 = T588;
  assign T588 = {T642, T589};
  assign T589 = T590;
  assign T590 = {T633, T591};
  assign T591 = T592;
  assign T592 = {T624, T593};
  assign T593 = T594;
  assign T594 = {T615, T595};
  assign T595 = T596;
  assign T596 = {T606, T597};
  assign T597 = T598;
  assign T598 = T599;
  assign T599 = T604[T600];
  assign T600 = T601;
  assign T601 = T602;
  assign T602 = {6'h0/* 0*/, T603};
  assign T603 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T604 = T605;
  assign T605 = io_ipin_in[4'h9/* 9*/:1'h0/* 0*/];
  assign T606 = T607;
  assign T607 = T608;
  assign T608 = T613[T609];
  assign T609 = T610;
  assign T610 = T611;
  assign T611 = {6'h0/* 0*/, T612};
  assign T612 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T613 = T614;
  assign T614 = io_ipin_in[5'h13/* 19*/:4'ha/* 10*/];
  assign T615 = T616;
  assign T616 = T617;
  assign T617 = T622[T618];
  assign T618 = T619;
  assign T619 = T620;
  assign T620 = {6'h0/* 0*/, T621};
  assign T621 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T622 = T623;
  assign T623 = io_ipin_in[5'h1d/* 29*/:5'h14/* 20*/];
  assign T624 = T625;
  assign T625 = T626;
  assign T626 = T631[T627];
  assign T627 = T628;
  assign T628 = T629;
  assign T629 = {6'h0/* 0*/, T630};
  assign T630 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T631 = T632;
  assign T632 = io_ipin_in[6'h27/* 39*/:5'h1e/* 30*/];
  assign T633 = T634;
  assign T634 = T635;
  assign T635 = T640[T636];
  assign T636 = T637;
  assign T637 = T638;
  assign T638 = {6'h0/* 0*/, T639};
  assign T639 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T640 = T641;
  assign T641 = io_ipin_in[6'h31/* 49*/:6'h28/* 40*/];
  assign T642 = T643;
  assign T643 = T644;
  assign T644 = T649[T645];
  assign T645 = T646;
  assign T646 = T647;
  assign T647 = {6'h0/* 0*/, T648};
  assign T648 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T649 = T650;
  assign T650 = io_ipin_in[6'h3b/* 59*/:6'h32/* 50*/];
  assign T651 = T652;
  assign T652 = T653;
  assign T653 = T658[T654];
  assign T654 = T655;
  assign T655 = T656;
  assign T656 = {6'h0/* 0*/, T657};
  assign T657 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T658 = T659;
  assign T659 = io_ipin_in[7'h45/* 69*/:6'h3c/* 60*/];
  assign T660 = T661;
  assign T661 = T662;
  assign T662 = T667[T663];
  assign T663 = T664;
  assign T664 = T665;
  assign T665 = {6'h0/* 0*/, T666};
  assign T666 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T667 = T668;
  assign T668 = io_ipin_in[7'h4f/* 79*/:7'h46/* 70*/];
endmodule


module io_tile_sp_0(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [197:0] io_chanxy_in,
    output[59:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[59:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h1/* 1*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_wc_1(
    input [79:0] io_ipin_in,
    input [31:0] io_ipin_config,
    input [209:0] io_chanxy_in,
    input [89:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[23:0] io_chanxy_out);

  wire[23:0] T0;
  wire[23:0] T1;
  wire[22:0] T2;
  wire[22:0] T3;
  wire[21:0] T4;
  wire[21:0] T5;
  wire[20:0] T6;
  wire[20:0] T7;
  wire[19:0] T8;
  wire[19:0] T9;
  wire[18:0] T10;
  wire[18:0] T11;
  wire[17:0] T12;
  wire[17:0] T13;
  wire[16:0] T14;
  wire[16:0] T15;
  wire[15:0] T16;
  wire[15:0] T17;
  wire[14:0] T18;
  wire[14:0] T19;
  wire[13:0] T20;
  wire[13:0] T21;
  wire[12:0] T22;
  wire[12:0] T23;
  wire[11:0] T24;
  wire[11:0] T25;
  wire[10:0] T26;
  wire[10:0] T27;
  wire[9:0] T28;
  wire[9:0] T29;
  wire[8:0] T30;
  wire[8:0] T31;
  wire[7:0] T32;
  wire[7:0] T33;
  wire[6:0] T34;
  wire[6:0] T35;
  wire[5:0] T36;
  wire[5:0] T37;
  wire[4:0] T38;
  wire[4:0] T39;
  wire[3:0] T40;
  wire[3:0] T41;
  wire[2:0] T42;
  wire[2:0] T43;
  wire[1:0] T44;
  wire[1:0] T45;
  wire T46;
  wire T47;
  wire T48;
  wire[3:0] T49;
  wire[3:0] T50;
  wire[3:0] T51;
  wire[8:0] T52;
  wire[8:0] T53;
  wire T54;
  wire T55;
  wire T56;
  wire[3:0] T57;
  wire[3:0] T58;
  wire[3:0] T59;
  wire[8:0] T60;
  wire[8:0] T61;
  wire T62;
  wire T63;
  wire T64;
  wire[3:0] T65;
  wire[3:0] T66;
  wire[3:0] T67;
  wire[8:0] T68;
  wire[8:0] T69;
  wire T70;
  wire T71;
  wire T72;
  wire[3:0] T73;
  wire[3:0] T74;
  wire[3:0] T75;
  wire[8:0] T76;
  wire[8:0] T77;
  wire T78;
  wire T79;
  wire T80;
  wire[3:0] T81;
  wire[3:0] T82;
  wire[3:0] T83;
  wire[8:0] T84;
  wire[8:0] T85;
  wire T86;
  wire T87;
  wire T88;
  wire[3:0] T89;
  wire[3:0] T90;
  wire[3:0] T91;
  wire[8:0] T92;
  wire[8:0] T93;
  wire T94;
  wire T95;
  wire T96;
  wire[3:0] T97;
  wire[3:0] T98;
  wire[3:0] T99;
  wire[8:0] T100;
  wire[8:0] T101;
  wire T102;
  wire T103;
  wire T104;
  wire[3:0] T105;
  wire[3:0] T106;
  wire[3:0] T107;
  wire[8:0] T108;
  wire[8:0] T109;
  wire T110;
  wire T111;
  wire T112;
  wire[3:0] T113;
  wire[3:0] T114;
  wire[3:0] T115;
  wire[8:0] T116;
  wire[8:0] T117;
  wire T118;
  wire T119;
  wire T120;
  wire[2:0] T121;
  wire[2:0] T122;
  wire[2:0] T123;
  wire[7:0] T124;
  wire[7:0] T125;
  wire T126;
  wire T127;
  wire T128;
  wire[2:0] T129;
  wire[2:0] T130;
  wire[2:0] T131;
  wire[7:0] T132;
  wire[7:0] T133;
  wire T134;
  wire T135;
  wire T136;
  wire[2:0] T137;
  wire[2:0] T138;
  wire[2:0] T139;
  wire[7:0] T140;
  wire[7:0] T141;
  wire T142;
  wire T143;
  wire T144;
  wire[3:0] T145;
  wire[3:0] T146;
  wire[3:0] T147;
  wire[8:0] T148;
  wire[8:0] T149;
  wire T150;
  wire T151;
  wire T152;
  wire[3:0] T153;
  wire[3:0] T154;
  wire[3:0] T155;
  wire[8:0] T156;
  wire[8:0] T157;
  wire T158;
  wire T159;
  wire T160;
  wire[3:0] T161;
  wire[3:0] T162;
  wire[3:0] T163;
  wire[8:0] T164;
  wire[8:0] T165;
  wire T166;
  wire T167;
  wire T168;
  wire[3:0] T169;
  wire[3:0] T170;
  wire[3:0] T171;
  wire[8:0] T172;
  wire[8:0] T173;
  wire T174;
  wire T175;
  wire T176;
  wire[3:0] T177;
  wire[3:0] T178;
  wire[3:0] T179;
  wire[8:0] T180;
  wire[8:0] T181;
  wire T182;
  wire T183;
  wire T184;
  wire[3:0] T185;
  wire[3:0] T186;
  wire[3:0] T187;
  wire[8:0] T188;
  wire[8:0] T189;
  wire T190;
  wire T191;
  wire T192;
  wire[3:0] T193;
  wire[3:0] T194;
  wire[3:0] T195;
  wire[8:0] T196;
  wire[8:0] T197;
  wire T198;
  wire T199;
  wire T200;
  wire[3:0] T201;
  wire[3:0] T202;
  wire[3:0] T203;
  wire[8:0] T204;
  wire[8:0] T205;
  wire T206;
  wire T207;
  wire T208;
  wire[3:0] T209;
  wire[3:0] T210;
  wire[3:0] T211;
  wire[8:0] T212;
  wire[8:0] T213;
  wire T214;
  wire T215;
  wire T216;
  wire[2:0] T217;
  wire[2:0] T218;
  wire[2:0] T219;
  wire[7:0] T220;
  wire[7:0] T221;
  wire T222;
  wire T223;
  wire T224;
  wire[2:0] T225;
  wire[2:0] T226;
  wire[2:0] T227;
  wire[7:0] T228;
  wire[7:0] T229;
  wire T230;
  wire T231;
  wire T232;
  wire[2:0] T233;
  wire[2:0] T234;
  wire[2:0] T235;
  wire[7:0] T236;
  wire[7:0] T237;
  wire[7:0] T238;
  wire[7:0] T239;
  wire[6:0] T240;
  wire[6:0] T241;
  wire[5:0] T242;
  wire[5:0] T243;
  wire[4:0] T244;
  wire[4:0] T245;
  wire[3:0] T246;
  wire[3:0] T247;
  wire[2:0] T248;
  wire[2:0] T249;
  wire[1:0] T250;
  wire[1:0] T251;
  wire T252;
  wire T253;
  wire T254;
  wire[9:0] T255;
  wire[9:0] T256;
  wire[9:0] T257;
  wire[3:0] T258;
  wire[9:0] T259;
  wire[9:0] T260;
  wire T261;
  wire T262;
  wire T263;
  wire[9:0] T264;
  wire[9:0] T265;
  wire[9:0] T266;
  wire[3:0] T267;
  wire[9:0] T268;
  wire[9:0] T269;
  wire T270;
  wire T271;
  wire T272;
  wire[9:0] T273;
  wire[9:0] T274;
  wire[9:0] T275;
  wire[3:0] T276;
  wire[9:0] T277;
  wire[9:0] T278;
  wire T279;
  wire T280;
  wire T281;
  wire[9:0] T282;
  wire[9:0] T283;
  wire[9:0] T284;
  wire[3:0] T285;
  wire[9:0] T286;
  wire[9:0] T287;
  wire T288;
  wire T289;
  wire T290;
  wire[9:0] T291;
  wire[9:0] T292;
  wire[9:0] T293;
  wire[3:0] T294;
  wire[9:0] T295;
  wire[9:0] T296;
  wire T297;
  wire T298;
  wire T299;
  wire[9:0] T300;
  wire[9:0] T301;
  wire[9:0] T302;
  wire[3:0] T303;
  wire[9:0] T304;
  wire[9:0] T305;
  wire T306;
  wire T307;
  wire T308;
  wire[9:0] T309;
  wire[9:0] T310;
  wire[9:0] T311;
  wire[3:0] T312;
  wire[9:0] T313;
  wire[9:0] T314;
  wire T315;
  wire T316;
  wire T317;
  wire[9:0] T318;
  wire[9:0] T319;
  wire[9:0] T320;
  wire[3:0] T321;
  wire[9:0] T322;
  wire[9:0] T323;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T230, T2};
  assign T2 = T3;
  assign T3 = {T222, T4};
  assign T4 = T5;
  assign T5 = {T214, T6};
  assign T6 = T7;
  assign T7 = {T206, T8};
  assign T8 = T9;
  assign T9 = {T198, T10};
  assign T10 = T11;
  assign T11 = {T190, T12};
  assign T12 = T13;
  assign T13 = {T182, T14};
  assign T14 = T15;
  assign T15 = {T174, T16};
  assign T16 = T17;
  assign T17 = {T166, T18};
  assign T18 = T19;
  assign T19 = {T158, T20};
  assign T20 = T21;
  assign T21 = {T150, T22};
  assign T22 = T23;
  assign T23 = {T142, T24};
  assign T24 = T25;
  assign T25 = {T134, T26};
  assign T26 = T27;
  assign T27 = {T126, T28};
  assign T28 = T29;
  assign T29 = {T118, T30};
  assign T30 = T31;
  assign T31 = {T110, T32};
  assign T32 = T33;
  assign T33 = {T102, T34};
  assign T34 = T35;
  assign T35 = {T94, T36};
  assign T36 = T37;
  assign T37 = {T86, T38};
  assign T38 = T39;
  assign T39 = {T78, T40};
  assign T40 = T41;
  assign T41 = {T70, T42};
  assign T42 = T43;
  assign T43 = {T62, T44};
  assign T44 = T45;
  assign T45 = {T54, T46};
  assign T46 = T47;
  assign T47 = T48;
  assign T48 = T52[T49];
  assign T49 = T50;
  assign T50 = T51;
  assign T51 = io_chanxy_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T52 = T53;
  assign T53 = io_chanxy_in[4'h8/* 8*/:1'h0/* 0*/];
  assign T54 = T55;
  assign T55 = T56;
  assign T56 = T60[T57];
  assign T57 = T58;
  assign T58 = T59;
  assign T59 = io_chanxy_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T60 = T61;
  assign T61 = io_chanxy_in[5'h11/* 17*/:4'h9/* 9*/];
  assign T62 = T63;
  assign T63 = T64;
  assign T64 = T68[T65];
  assign T65 = T66;
  assign T66 = T67;
  assign T67 = io_chanxy_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T68 = T69;
  assign T69 = io_chanxy_in[5'h1a/* 26*/:5'h12/* 18*/];
  assign T70 = T71;
  assign T71 = T72;
  assign T72 = T76[T73];
  assign T73 = T74;
  assign T74 = T75;
  assign T75 = io_chanxy_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T76 = T77;
  assign T77 = io_chanxy_in[6'h23/* 35*/:5'h1b/* 27*/];
  assign T78 = T79;
  assign T79 = T80;
  assign T80 = T84[T81];
  assign T81 = T82;
  assign T82 = T83;
  assign T83 = io_chanxy_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T84 = T85;
  assign T85 = io_chanxy_in[6'h2c/* 44*/:6'h24/* 36*/];
  assign T86 = T87;
  assign T87 = T88;
  assign T88 = T92[T89];
  assign T89 = T90;
  assign T90 = T91;
  assign T91 = io_chanxy_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T92 = T93;
  assign T93 = io_chanxy_in[6'h35/* 53*/:6'h2d/* 45*/];
  assign T94 = T95;
  assign T95 = T96;
  assign T96 = T100[T97];
  assign T97 = T98;
  assign T98 = T99;
  assign T99 = io_chanxy_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T100 = T101;
  assign T101 = io_chanxy_in[6'h3e/* 62*/:6'h36/* 54*/];
  assign T102 = T103;
  assign T103 = T104;
  assign T104 = T108[T105];
  assign T105 = T106;
  assign T106 = T107;
  assign T107 = io_chanxy_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T108 = T109;
  assign T109 = io_chanxy_in[7'h47/* 71*/:6'h3f/* 63*/];
  assign T110 = T111;
  assign T111 = T112;
  assign T112 = T116[T113];
  assign T113 = T114;
  assign T114 = T115;
  assign T115 = io_chanxy_config[6'h23/* 35*/:6'h20/* 32*/];
  assign T116 = T117;
  assign T117 = io_chanxy_in[7'h50/* 80*/:7'h48/* 72*/];
  assign T118 = T119;
  assign T119 = T120;
  assign T120 = T124[T121];
  assign T121 = T122;
  assign T122 = T123;
  assign T123 = io_chanxy_config[6'h26/* 38*/:6'h24/* 36*/];
  assign T124 = T125;
  assign T125 = io_chanxy_in[7'h58/* 88*/:7'h51/* 81*/];
  assign T126 = T127;
  assign T127 = T128;
  assign T128 = T132[T129];
  assign T129 = T130;
  assign T130 = T131;
  assign T131 = io_chanxy_config[6'h29/* 41*/:6'h27/* 39*/];
  assign T132 = T133;
  assign T133 = io_chanxy_in[7'h60/* 96*/:7'h59/* 89*/];
  assign T134 = T135;
  assign T135 = T136;
  assign T136 = T140[T137];
  assign T137 = T138;
  assign T138 = T139;
  assign T139 = io_chanxy_config[6'h2c/* 44*/:6'h2a/* 42*/];
  assign T140 = T141;
  assign T141 = io_chanxy_in[7'h68/* 104*/:7'h61/* 97*/];
  assign T142 = T143;
  assign T143 = T144;
  assign T144 = T148[T145];
  assign T145 = T146;
  assign T146 = T147;
  assign T147 = io_chanxy_config[6'h30/* 48*/:6'h2d/* 45*/];
  assign T148 = T149;
  assign T149 = io_chanxy_in[7'h71/* 113*/:7'h69/* 105*/];
  assign T150 = T151;
  assign T151 = T152;
  assign T152 = T156[T153];
  assign T153 = T154;
  assign T154 = T155;
  assign T155 = io_chanxy_config[6'h34/* 52*/:6'h31/* 49*/];
  assign T156 = T157;
  assign T157 = io_chanxy_in[7'h7a/* 122*/:7'h72/* 114*/];
  assign T158 = T159;
  assign T159 = T160;
  assign T160 = T164[T161];
  assign T161 = T162;
  assign T162 = T163;
  assign T163 = io_chanxy_config[6'h38/* 56*/:6'h35/* 53*/];
  assign T164 = T165;
  assign T165 = io_chanxy_in[8'h83/* 131*/:7'h7b/* 123*/];
  assign T166 = T167;
  assign T167 = T168;
  assign T168 = T172[T169];
  assign T169 = T170;
  assign T170 = T171;
  assign T171 = io_chanxy_config[6'h3c/* 60*/:6'h39/* 57*/];
  assign T172 = T173;
  assign T173 = io_chanxy_in[8'h8c/* 140*/:8'h84/* 132*/];
  assign T174 = T175;
  assign T175 = T176;
  assign T176 = T180[T177];
  assign T177 = T178;
  assign T178 = T179;
  assign T179 = io_chanxy_config[7'h40/* 64*/:6'h3d/* 61*/];
  assign T180 = T181;
  assign T181 = io_chanxy_in[8'h95/* 149*/:8'h8d/* 141*/];
  assign T182 = T183;
  assign T183 = T184;
  assign T184 = T188[T185];
  assign T185 = T186;
  assign T186 = T187;
  assign T187 = io_chanxy_config[7'h44/* 68*/:7'h41/* 65*/];
  assign T188 = T189;
  assign T189 = io_chanxy_in[8'h9e/* 158*/:8'h96/* 150*/];
  assign T190 = T191;
  assign T191 = T192;
  assign T192 = T196[T193];
  assign T193 = T194;
  assign T194 = T195;
  assign T195 = io_chanxy_config[7'h48/* 72*/:7'h45/* 69*/];
  assign T196 = T197;
  assign T197 = io_chanxy_in[8'ha7/* 167*/:8'h9f/* 159*/];
  assign T198 = T199;
  assign T199 = T200;
  assign T200 = T204[T201];
  assign T201 = T202;
  assign T202 = T203;
  assign T203 = io_chanxy_config[7'h4c/* 76*/:7'h49/* 73*/];
  assign T204 = T205;
  assign T205 = io_chanxy_in[8'hb0/* 176*/:8'ha8/* 168*/];
  assign T206 = T207;
  assign T207 = T208;
  assign T208 = T212[T209];
  assign T209 = T210;
  assign T210 = T211;
  assign T211 = io_chanxy_config[7'h50/* 80*/:7'h4d/* 77*/];
  assign T212 = T213;
  assign T213 = io_chanxy_in[8'hb9/* 185*/:8'hb1/* 177*/];
  assign T214 = T215;
  assign T215 = T216;
  assign T216 = T220[T217];
  assign T217 = T218;
  assign T218 = T219;
  assign T219 = io_chanxy_config[7'h53/* 83*/:7'h51/* 81*/];
  assign T220 = T221;
  assign T221 = io_chanxy_in[8'hc1/* 193*/:8'hba/* 186*/];
  assign T222 = T223;
  assign T223 = T224;
  assign T224 = T228[T225];
  assign T225 = T226;
  assign T226 = T227;
  assign T227 = io_chanxy_config[7'h56/* 86*/:7'h54/* 84*/];
  assign T228 = T229;
  assign T229 = io_chanxy_in[8'hc9/* 201*/:8'hc2/* 194*/];
  assign T230 = T231;
  assign T231 = T232;
  assign T232 = T236[T233];
  assign T233 = T234;
  assign T234 = T235;
  assign T235 = io_chanxy_config[7'h59/* 89*/:7'h57/* 87*/];
  assign T236 = T237;
  assign T237 = io_chanxy_in[8'hd1/* 209*/:8'hca/* 202*/];
  assign io_ipin_out = T238;
  assign T238 = T239;
  assign T239 = {T315, T240};
  assign T240 = T241;
  assign T241 = {T306, T242};
  assign T242 = T243;
  assign T243 = {T297, T244};
  assign T244 = T245;
  assign T245 = {T288, T246};
  assign T246 = T247;
  assign T247 = {T279, T248};
  assign T248 = T249;
  assign T249 = {T270, T250};
  assign T250 = T251;
  assign T251 = {T261, T252};
  assign T252 = T253;
  assign T253 = T254;
  assign T254 = T259[T255];
  assign T255 = T256;
  assign T256 = T257;
  assign T257 = {6'h0/* 0*/, T258};
  assign T258 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T259 = T260;
  assign T260 = io_ipin_in[4'h9/* 9*/:1'h0/* 0*/];
  assign T261 = T262;
  assign T262 = T263;
  assign T263 = T268[T264];
  assign T264 = T265;
  assign T265 = T266;
  assign T266 = {6'h0/* 0*/, T267};
  assign T267 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T268 = T269;
  assign T269 = io_ipin_in[5'h13/* 19*/:4'ha/* 10*/];
  assign T270 = T271;
  assign T271 = T272;
  assign T272 = T277[T273];
  assign T273 = T274;
  assign T274 = T275;
  assign T275 = {6'h0/* 0*/, T276};
  assign T276 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T277 = T278;
  assign T278 = io_ipin_in[5'h1d/* 29*/:5'h14/* 20*/];
  assign T279 = T280;
  assign T280 = T281;
  assign T281 = T286[T282];
  assign T282 = T283;
  assign T283 = T284;
  assign T284 = {6'h0/* 0*/, T285};
  assign T285 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T286 = T287;
  assign T287 = io_ipin_in[6'h27/* 39*/:5'h1e/* 30*/];
  assign T288 = T289;
  assign T289 = T290;
  assign T290 = T295[T291];
  assign T291 = T292;
  assign T292 = T293;
  assign T293 = {6'h0/* 0*/, T294};
  assign T294 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T295 = T296;
  assign T296 = io_ipin_in[6'h31/* 49*/:6'h28/* 40*/];
  assign T297 = T298;
  assign T298 = T299;
  assign T299 = T304[T300];
  assign T300 = T301;
  assign T301 = T302;
  assign T302 = {6'h0/* 0*/, T303};
  assign T303 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T304 = T305;
  assign T305 = io_ipin_in[6'h3b/* 59*/:6'h32/* 50*/];
  assign T306 = T307;
  assign T307 = T308;
  assign T308 = T313[T309];
  assign T309 = T310;
  assign T310 = T311;
  assign T311 = {6'h0/* 0*/, T312};
  assign T312 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T313 = T314;
  assign T314 = io_ipin_in[7'h45/* 69*/:6'h3c/* 60*/];
  assign T315 = T316;
  assign T316 = T317;
  assign T317 = T322[T318];
  assign T318 = T319;
  assign T319 = T320;
  assign T320 = {6'h0/* 0*/, T321};
  assign T321 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T322 = T323;
  assign T323 = io_ipin_in[7'h4f/* 79*/:7'h46/* 70*/];
endmodule

module io_tile_sp_1(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {6'h0/* 0*/, 2'h2/* 2*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_2(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {6'h0/* 0*/, 2'h3/* 3*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_3(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h4/* 4*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_4(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h5/* 5*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_5(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h6/* 6*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_6(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h7/* 7*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_wc_2(
    input [79:0] io_ipin_in,
    input [31:0] io_ipin_config,
    input [197:0] io_chanxy_in,
    input [89:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[59:0] io_chanxy_out);

  wire[59:0] T0;
  wire[59:0] T1;
  wire[58:0] T2;
  wire[58:0] T3;
  wire[57:0] T4;
  wire[57:0] T5;
  wire[56:0] T6;
  wire[56:0] T7;
  wire[55:0] T8;
  wire[55:0] T9;
  wire[54:0] T10;
  wire[54:0] T11;
  wire[53:0] T12;
  wire[53:0] T13;
  wire[52:0] T14;
  wire[52:0] T15;
  wire[51:0] T16;
  wire[51:0] T17;
  wire[50:0] T18;
  wire[50:0] T19;
  wire[49:0] T20;
  wire[49:0] T21;
  wire[48:0] T22;
  wire[48:0] T23;
  wire[47:0] T24;
  wire[47:0] T25;
  wire[46:0] T26;
  wire[46:0] T27;
  wire[45:0] T28;
  wire[45:0] T29;
  wire[44:0] T30;
  wire[44:0] T31;
  wire[43:0] T32;
  wire[43:0] T33;
  wire[42:0] T34;
  wire[42:0] T35;
  wire[41:0] T36;
  wire[41:0] T37;
  wire[40:0] T38;
  wire[40:0] T39;
  wire[39:0] T40;
  wire[39:0] T41;
  wire[38:0] T42;
  wire[38:0] T43;
  wire[37:0] T44;
  wire[37:0] T45;
  wire[36:0] T46;
  wire[36:0] T47;
  wire[35:0] T48;
  wire[35:0] T49;
  wire[34:0] T50;
  wire[34:0] T51;
  wire[33:0] T52;
  wire[33:0] T53;
  wire[32:0] T54;
  wire[32:0] T55;
  wire[31:0] T56;
  wire[31:0] T57;
  wire[30:0] T58;
  wire[30:0] T59;
  wire[29:0] T60;
  wire[29:0] T61;
  wire[28:0] T62;
  wire[28:0] T63;
  wire[27:0] T64;
  wire[27:0] T65;
  wire[26:0] T66;
  wire[26:0] T67;
  wire[25:0] T68;
  wire[25:0] T69;
  wire[24:0] T70;
  wire[24:0] T71;
  wire[23:0] T72;
  wire[23:0] T73;
  wire[22:0] T74;
  wire[22:0] T75;
  wire[21:0] T76;
  wire[21:0] T77;
  wire[20:0] T78;
  wire[20:0] T79;
  wire[19:0] T80;
  wire[19:0] T81;
  wire[18:0] T82;
  wire[18:0] T83;
  wire[17:0] T84;
  wire[17:0] T85;
  wire[16:0] T86;
  wire[16:0] T87;
  wire[15:0] T88;
  wire[15:0] T89;
  wire[14:0] T90;
  wire[14:0] T91;
  wire[13:0] T92;
  wire[13:0] T93;
  wire[12:0] T94;
  wire[12:0] T95;
  wire[11:0] T96;
  wire[11:0] T97;
  wire[10:0] T98;
  wire[10:0] T99;
  wire[9:0] T100;
  wire[9:0] T101;
  wire[8:0] T102;
  wire[8:0] T103;
  wire[7:0] T104;
  wire[7:0] T105;
  wire[6:0] T106;
  wire[6:0] T107;
  wire[5:0] T108;
  wire[5:0] T109;
  wire[4:0] T110;
  wire[4:0] T111;
  wire[3:0] T112;
  wire[3:0] T113;
  wire[2:0] T114;
  wire[2:0] T115;
  wire[1:0] T116;
  wire[1:0] T117;
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire[1:0] T124;
  wire[1:0] T125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  wire T130;
  wire T131;
  wire[1:0] T132;
  wire[1:0] T133;
  wire T134;
  wire T135;
  wire T136;
  wire T137;
  wire T138;
  wire T139;
  wire[1:0] T140;
  wire[1:0] T141;
  wire T142;
  wire T143;
  wire T144;
  wire T145;
  wire T146;
  wire T147;
  wire[1:0] T148;
  wire[1:0] T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  wire[1:0] T156;
  wire[1:0] T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire T162;
  wire T163;
  wire[1:0] T164;
  wire[1:0] T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  wire T170;
  wire T171;
  wire[1:0] T172;
  wire[1:0] T173;
  wire T174;
  wire T175;
  wire T176;
  wire T177;
  wire T178;
  wire T179;
  wire[1:0] T180;
  wire[1:0] T181;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire T186;
  wire T187;
  wire[1:0] T188;
  wire[1:0] T189;
  wire T190;
  wire T191;
  wire T192;
  wire T193;
  wire T194;
  wire T195;
  wire[1:0] T196;
  wire[1:0] T197;
  wire T198;
  wire T199;
  wire T200;
  wire T201;
  wire T202;
  wire T203;
  wire[1:0] T204;
  wire[1:0] T205;
  wire T206;
  wire T207;
  wire T208;
  wire T209;
  wire T210;
  wire T211;
  wire[1:0] T212;
  wire[1:0] T213;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  wire[1:0] T220;
  wire[1:0] T221;
  wire T222;
  wire T223;
  wire T224;
  wire T225;
  wire T226;
  wire T227;
  wire[1:0] T228;
  wire[1:0] T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire[1:0] T236;
  wire[1:0] T237;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire T242;
  wire T243;
  wire[1:0] T244;
  wire[1:0] T245;
  wire T246;
  wire T247;
  wire T248;
  wire T249;
  wire T250;
  wire T251;
  wire[1:0] T252;
  wire[1:0] T253;
  wire T254;
  wire T255;
  wire T256;
  wire T257;
  wire T258;
  wire T259;
  wire[1:0] T260;
  wire[1:0] T261;
  wire T262;
  wire T263;
  wire T264;
  wire T265;
  wire T266;
  wire T267;
  wire[1:0] T268;
  wire[1:0] T269;
  wire T270;
  wire T271;
  wire T272;
  wire T273;
  wire T274;
  wire T275;
  wire[1:0] T276;
  wire[1:0] T277;
  wire T278;
  wire T279;
  wire T280;
  wire T281;
  wire T282;
  wire T283;
  wire[1:0] T284;
  wire[1:0] T285;
  wire T286;
  wire T287;
  wire T288;
  wire T289;
  wire T290;
  wire T291;
  wire[1:0] T292;
  wire[1:0] T293;
  wire T294;
  wire T295;
  wire T296;
  wire T297;
  wire T298;
  wire T299;
  wire[1:0] T300;
  wire[1:0] T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire T306;
  wire T307;
  wire T308;
  wire T309;
  wire T310;
  wire[1:0] T311;
  wire[1:0] T312;
  wire T313;
  wire T314;
  wire T315;
  wire T316;
  wire T317;
  wire T318;
  wire[1:0] T319;
  wire[1:0] T320;
  wire T321;
  wire T322;
  wire T323;
  wire T324;
  wire T325;
  wire T326;
  wire[1:0] T327;
  wire[1:0] T328;
  wire T329;
  wire T330;
  wire T331;
  wire T332;
  wire T333;
  wire T334;
  wire[1:0] T335;
  wire[1:0] T336;
  wire T337;
  wire T338;
  wire T339;
  wire T340;
  wire T341;
  wire T342;
  wire[1:0] T343;
  wire[1:0] T344;
  wire T345;
  wire T346;
  wire T347;
  wire T348;
  wire T349;
  wire T350;
  wire[1:0] T351;
  wire[1:0] T352;
  wire T353;
  wire T354;
  wire T355;
  wire T356;
  wire T357;
  wire T358;
  wire[1:0] T359;
  wire[1:0] T360;
  wire T361;
  wire T362;
  wire T363;
  wire T364;
  wire T365;
  wire T366;
  wire[1:0] T367;
  wire[1:0] T368;
  wire T369;
  wire T370;
  wire T371;
  wire T372;
  wire T373;
  wire T374;
  wire[1:0] T375;
  wire[1:0] T376;
  wire T377;
  wire T378;
  wire T379;
  wire T380;
  wire T381;
  wire T382;
  wire[1:0] T383;
  wire[1:0] T384;
  wire T385;
  wire T386;
  wire T387;
  wire T388;
  wire T389;
  wire T390;
  wire[1:0] T391;
  wire[1:0] T392;
  wire T393;
  wire T394;
  wire T395;
  wire T396;
  wire T397;
  wire T398;
  wire[3:0] T399;
  wire[3:0] T400;
  wire[3:0] T401;
  wire[8:0] T402;
  wire[8:0] T403;
  wire T404;
  wire T405;
  wire T406;
  wire T407;
  wire T408;
  wire T409;
  wire[1:0] T410;
  wire[1:0] T411;
  wire T412;
  wire T413;
  wire T414;
  wire[3:0] T415;
  wire[3:0] T416;
  wire[3:0] T417;
  wire[8:0] T418;
  wire[8:0] T419;
  wire T420;
  wire T421;
  wire T422;
  wire T423;
  wire T424;
  wire T425;
  wire[1:0] T426;
  wire[1:0] T427;
  wire T428;
  wire T429;
  wire T430;
  wire[3:0] T431;
  wire[3:0] T432;
  wire[3:0] T433;
  wire[8:0] T434;
  wire[8:0] T435;
  wire T436;
  wire T437;
  wire T438;
  wire T439;
  wire T440;
  wire T441;
  wire[1:0] T442;
  wire[1:0] T443;
  wire T444;
  wire T445;
  wire T446;
  wire[3:0] T447;
  wire[3:0] T448;
  wire[3:0] T449;
  wire[8:0] T450;
  wire[8:0] T451;
  wire T452;
  wire T453;
  wire T454;
  wire T455;
  wire T456;
  wire T457;
  wire[1:0] T458;
  wire[1:0] T459;
  wire T460;
  wire T461;
  wire T462;
  wire[3:0] T463;
  wire[3:0] T464;
  wire[3:0] T465;
  wire[8:0] T466;
  wire[8:0] T467;
  wire T468;
  wire T469;
  wire T470;
  wire T471;
  wire T472;
  wire T473;
  wire[1:0] T474;
  wire[1:0] T475;
  wire T476;
  wire T477;
  wire T478;
  wire[3:0] T479;
  wire[3:0] T480;
  wire[3:0] T481;
  wire[8:0] T482;
  wire[8:0] T483;
  wire T484;
  wire T485;
  wire T486;
  wire T487;
  wire T488;
  wire T489;
  wire[1:0] T490;
  wire[1:0] T491;
  wire T492;
  wire T493;
  wire T494;
  wire[3:0] T495;
  wire[3:0] T496;
  wire[3:0] T497;
  wire[8:0] T498;
  wire[8:0] T499;
  wire T500;
  wire T501;
  wire T502;
  wire T503;
  wire T504;
  wire T505;
  wire[1:0] T506;
  wire[1:0] T507;
  wire T508;
  wire T509;
  wire T510;
  wire[3:0] T511;
  wire[3:0] T512;
  wire[3:0] T513;
  wire[8:0] T514;
  wire[8:0] T515;
  wire T516;
  wire T517;
  wire T518;
  wire T519;
  wire T520;
  wire T521;
  wire[1:0] T522;
  wire[1:0] T523;
  wire T524;
  wire T525;
  wire T526;
  wire[3:0] T527;
  wire[3:0] T528;
  wire[3:0] T529;
  wire[8:0] T530;
  wire[8:0] T531;
  wire T532;
  wire T533;
  wire T534;
  wire T535;
  wire T536;
  wire T537;
  wire[1:0] T538;
  wire[1:0] T539;
  wire T540;
  wire T541;
  wire T542;
  wire[2:0] T543;
  wire[2:0] T544;
  wire[2:0] T545;
  wire[7:0] T546;
  wire[7:0] T547;
  wire T548;
  wire T549;
  wire T550;
  wire T551;
  wire T552;
  wire T553;
  wire[1:0] T554;
  wire[1:0] T555;
  wire T556;
  wire T557;
  wire T558;
  wire[2:0] T559;
  wire[2:0] T560;
  wire[2:0] T561;
  wire[7:0] T562;
  wire[7:0] T563;
  wire T564;
  wire T565;
  wire T566;
  wire T567;
  wire T568;
  wire T569;
  wire[1:0] T570;
  wire[1:0] T571;
  wire T572;
  wire T573;
  wire T574;
  wire[2:0] T575;
  wire[2:0] T576;
  wire[2:0] T577;
  wire[7:0] T578;
  wire[7:0] T579;
  wire T580;
  wire T581;
  wire T582;
  wire[7:0] T583;
  wire[7:0] T584;
  wire[6:0] T585;
  wire[6:0] T586;
  wire[5:0] T587;
  wire[5:0] T588;
  wire[4:0] T589;
  wire[4:0] T590;
  wire[3:0] T591;
  wire[3:0] T592;
  wire[2:0] T593;
  wire[2:0] T594;
  wire[1:0] T595;
  wire[1:0] T596;
  wire T597;
  wire T598;
  wire T599;
  wire[9:0] T600;
  wire[9:0] T601;
  wire[9:0] T602;
  wire[3:0] T603;
  wire[9:0] T604;
  wire[9:0] T605;
  wire T606;
  wire T607;
  wire T608;
  wire[9:0] T609;
  wire[9:0] T610;
  wire[9:0] T611;
  wire[3:0] T612;
  wire[9:0] T613;
  wire[9:0] T614;
  wire T615;
  wire T616;
  wire T617;
  wire[9:0] T618;
  wire[9:0] T619;
  wire[9:0] T620;
  wire[3:0] T621;
  wire[9:0] T622;
  wire[9:0] T623;
  wire T624;
  wire T625;
  wire T626;
  wire[9:0] T627;
  wire[9:0] T628;
  wire[9:0] T629;
  wire[3:0] T630;
  wire[9:0] T631;
  wire[9:0] T632;
  wire T633;
  wire T634;
  wire T635;
  wire[9:0] T636;
  wire[9:0] T637;
  wire[9:0] T638;
  wire[3:0] T639;
  wire[9:0] T640;
  wire[9:0] T641;
  wire T642;
  wire T643;
  wire T644;
  wire[9:0] T645;
  wire[9:0] T646;
  wire[9:0] T647;
  wire[3:0] T648;
  wire[9:0] T649;
  wire[9:0] T650;
  wire T651;
  wire T652;
  wire T653;
  wire[9:0] T654;
  wire[9:0] T655;
  wire[9:0] T656;
  wire[3:0] T657;
  wire[9:0] T658;
  wire[9:0] T659;
  wire T660;
  wire T661;
  wire T662;
  wire[9:0] T663;
  wire[9:0] T664;
  wire[9:0] T665;
  wire[3:0] T666;
  wire[9:0] T667;
  wire[9:0] T668;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T580, T2};
  assign T2 = T3;
  assign T3 = {T572, T4};
  assign T4 = T5;
  assign T5 = {T564, T6};
  assign T6 = T7;
  assign T7 = {T556, T8};
  assign T8 = T9;
  assign T9 = {T548, T10};
  assign T10 = T11;
  assign T11 = {T540, T12};
  assign T12 = T13;
  assign T13 = {T532, T14};
  assign T14 = T15;
  assign T15 = {T524, T16};
  assign T16 = T17;
  assign T17 = {T516, T18};
  assign T18 = T19;
  assign T19 = {T508, T20};
  assign T20 = T21;
  assign T21 = {T500, T22};
  assign T22 = T23;
  assign T23 = {T492, T24};
  assign T24 = T25;
  assign T25 = {T484, T26};
  assign T26 = T27;
  assign T27 = {T476, T28};
  assign T28 = T29;
  assign T29 = {T468, T30};
  assign T30 = T31;
  assign T31 = {T460, T32};
  assign T32 = T33;
  assign T33 = {T452, T34};
  assign T34 = T35;
  assign T35 = {T444, T36};
  assign T36 = T37;
  assign T37 = {T436, T38};
  assign T38 = T39;
  assign T39 = {T428, T40};
  assign T40 = T41;
  assign T41 = {T420, T42};
  assign T42 = T43;
  assign T43 = {T412, T44};
  assign T44 = T45;
  assign T45 = {T404, T46};
  assign T46 = T47;
  assign T47 = {T396, T48};
  assign T48 = T49;
  assign T49 = {T393, T50};
  assign T50 = T51;
  assign T51 = {T385, T52};
  assign T52 = T53;
  assign T53 = {T377, T54};
  assign T54 = T55;
  assign T55 = {T369, T56};
  assign T56 = T57;
  assign T57 = {T361, T58};
  assign T58 = T59;
  assign T59 = {T353, T60};
  assign T60 = T61;
  assign T61 = {T345, T62};
  assign T62 = T63;
  assign T63 = {T337, T64};
  assign T64 = T65;
  assign T65 = {T329, T66};
  assign T66 = T67;
  assign T67 = {T321, T68};
  assign T68 = T69;
  assign T69 = {T313, T70};
  assign T70 = T71;
  assign T71 = {T305, T72};
  assign T72 = T73;
  assign T73 = {T302, T74};
  assign T74 = T75;
  assign T75 = {T294, T76};
  assign T76 = T77;
  assign T77 = {T286, T78};
  assign T78 = T79;
  assign T79 = {T278, T80};
  assign T80 = T81;
  assign T81 = {T270, T82};
  assign T82 = T83;
  assign T83 = {T262, T84};
  assign T84 = T85;
  assign T85 = {T254, T86};
  assign T86 = T87;
  assign T87 = {T246, T88};
  assign T88 = T89;
  assign T89 = {T238, T90};
  assign T90 = T91;
  assign T91 = {T230, T92};
  assign T92 = T93;
  assign T93 = {T222, T94};
  assign T94 = T95;
  assign T95 = {T214, T96};
  assign T96 = T97;
  assign T97 = {T206, T98};
  assign T98 = T99;
  assign T99 = {T198, T100};
  assign T100 = T101;
  assign T101 = {T190, T102};
  assign T102 = T103;
  assign T103 = {T182, T104};
  assign T104 = T105;
  assign T105 = {T174, T106};
  assign T106 = T107;
  assign T107 = {T166, T108};
  assign T108 = T109;
  assign T109 = {T158, T110};
  assign T110 = T111;
  assign T111 = {T150, T112};
  assign T112 = T113;
  assign T113 = {T142, T114};
  assign T114 = T115;
  assign T115 = {T134, T116};
  assign T116 = T117;
  assign T117 = {T126, T118};
  assign T118 = T119;
  assign T119 = T120;
  assign T120 = T124[T121];
  assign T121 = T122;
  assign T122 = T123;
  assign T123 = io_chanxy_config[1'h0/* 0*/:1'h0/* 0*/];
  assign T124 = T125;
  assign T125 = io_chanxy_in[1'h1/* 1*/:1'h0/* 0*/];
  assign T126 = T127;
  assign T127 = T128;
  assign T128 = T132[T129];
  assign T129 = T130;
  assign T130 = T131;
  assign T131 = io_chanxy_config[1'h1/* 1*/:1'h1/* 1*/];
  assign T132 = T133;
  assign T133 = io_chanxy_in[2'h3/* 3*/:2'h2/* 2*/];
  assign T134 = T135;
  assign T135 = T136;
  assign T136 = T140[T137];
  assign T137 = T138;
  assign T138 = T139;
  assign T139 = io_chanxy_config[2'h2/* 2*/:2'h2/* 2*/];
  assign T140 = T141;
  assign T141 = io_chanxy_in[3'h5/* 5*/:3'h4/* 4*/];
  assign T142 = T143;
  assign T143 = T144;
  assign T144 = T148[T145];
  assign T145 = T146;
  assign T146 = T147;
  assign T147 = io_chanxy_config[2'h3/* 3*/:2'h3/* 3*/];
  assign T148 = T149;
  assign T149 = io_chanxy_in[3'h7/* 7*/:3'h6/* 6*/];
  assign T150 = T151;
  assign T151 = T152;
  assign T152 = T156[T153];
  assign T153 = T154;
  assign T154 = T155;
  assign T155 = io_chanxy_config[3'h4/* 4*/:3'h4/* 4*/];
  assign T156 = T157;
  assign T157 = io_chanxy_in[4'h9/* 9*/:4'h8/* 8*/];
  assign T158 = T159;
  assign T159 = T160;
  assign T160 = T164[T161];
  assign T161 = T162;
  assign T162 = T163;
  assign T163 = io_chanxy_config[3'h5/* 5*/:3'h5/* 5*/];
  assign T164 = T165;
  assign T165 = io_chanxy_in[4'hb/* 11*/:4'ha/* 10*/];
  assign T166 = T167;
  assign T167 = T168;
  assign T168 = T172[T169];
  assign T169 = T170;
  assign T170 = T171;
  assign T171 = io_chanxy_config[3'h6/* 6*/:3'h6/* 6*/];
  assign T172 = T173;
  assign T173 = io_chanxy_in[4'hd/* 13*/:4'hc/* 12*/];
  assign T174 = T175;
  assign T175 = T176;
  assign T176 = T180[T177];
  assign T177 = T178;
  assign T178 = T179;
  assign T179 = io_chanxy_config[3'h7/* 7*/:3'h7/* 7*/];
  assign T180 = T181;
  assign T181 = io_chanxy_in[4'hf/* 15*/:4'he/* 14*/];
  assign T182 = T183;
  assign T183 = T184;
  assign T184 = T188[T185];
  assign T185 = T186;
  assign T186 = T187;
  assign T187 = io_chanxy_config[4'h8/* 8*/:4'h8/* 8*/];
  assign T188 = T189;
  assign T189 = io_chanxy_in[5'h11/* 17*/:5'h10/* 16*/];
  assign T190 = T191;
  assign T191 = T192;
  assign T192 = T196[T193];
  assign T193 = T194;
  assign T194 = T195;
  assign T195 = io_chanxy_config[4'h9/* 9*/:4'h9/* 9*/];
  assign T196 = T197;
  assign T197 = io_chanxy_in[5'h13/* 19*/:5'h12/* 18*/];
  assign T198 = T199;
  assign T199 = T200;
  assign T200 = T204[T201];
  assign T201 = T202;
  assign T202 = T203;
  assign T203 = io_chanxy_config[4'ha/* 10*/:4'ha/* 10*/];
  assign T204 = T205;
  assign T205 = io_chanxy_in[5'h15/* 21*/:5'h14/* 20*/];
  assign T206 = T207;
  assign T207 = T208;
  assign T208 = T212[T209];
  assign T209 = T210;
  assign T210 = T211;
  assign T211 = io_chanxy_config[4'hb/* 11*/:4'hb/* 11*/];
  assign T212 = T213;
  assign T213 = io_chanxy_in[5'h17/* 23*/:5'h16/* 22*/];
  assign T214 = T215;
  assign T215 = T216;
  assign T216 = T220[T217];
  assign T217 = T218;
  assign T218 = T219;
  assign T219 = io_chanxy_config[4'hc/* 12*/:4'hc/* 12*/];
  assign T220 = T221;
  assign T221 = io_chanxy_in[5'h19/* 25*/:5'h18/* 24*/];
  assign T222 = T223;
  assign T223 = T224;
  assign T224 = T228[T225];
  assign T225 = T226;
  assign T226 = T227;
  assign T227 = io_chanxy_config[4'hd/* 13*/:4'hd/* 13*/];
  assign T228 = T229;
  assign T229 = io_chanxy_in[5'h1b/* 27*/:5'h1a/* 26*/];
  assign T230 = T231;
  assign T231 = T232;
  assign T232 = T236[T233];
  assign T233 = T234;
  assign T234 = T235;
  assign T235 = io_chanxy_config[4'he/* 14*/:4'he/* 14*/];
  assign T236 = T237;
  assign T237 = io_chanxy_in[5'h1d/* 29*/:5'h1c/* 28*/];
  assign T238 = T239;
  assign T239 = T240;
  assign T240 = T244[T241];
  assign T241 = T242;
  assign T242 = T243;
  assign T243 = io_chanxy_config[4'hf/* 15*/:4'hf/* 15*/];
  assign T244 = T245;
  assign T245 = io_chanxy_in[5'h1f/* 31*/:5'h1e/* 30*/];
  assign T246 = T247;
  assign T247 = T248;
  assign T248 = T252[T249];
  assign T249 = T250;
  assign T250 = T251;
  assign T251 = io_chanxy_config[5'h10/* 16*/:5'h10/* 16*/];
  assign T252 = T253;
  assign T253 = io_chanxy_in[6'h21/* 33*/:6'h20/* 32*/];
  assign T254 = T255;
  assign T255 = T256;
  assign T256 = T260[T257];
  assign T257 = T258;
  assign T258 = T259;
  assign T259 = io_chanxy_config[5'h11/* 17*/:5'h11/* 17*/];
  assign T260 = T261;
  assign T261 = io_chanxy_in[6'h23/* 35*/:6'h22/* 34*/];
  assign T262 = T263;
  assign T263 = T264;
  assign T264 = T268[T265];
  assign T265 = T266;
  assign T266 = T267;
  assign T267 = io_chanxy_config[5'h12/* 18*/:5'h12/* 18*/];
  assign T268 = T269;
  assign T269 = io_chanxy_in[6'h25/* 37*/:6'h24/* 36*/];
  assign T270 = T271;
  assign T271 = T272;
  assign T272 = T276[T273];
  assign T273 = T274;
  assign T274 = T275;
  assign T275 = io_chanxy_config[5'h13/* 19*/:5'h13/* 19*/];
  assign T276 = T277;
  assign T277 = io_chanxy_in[6'h27/* 39*/:6'h26/* 38*/];
  assign T278 = T279;
  assign T279 = T280;
  assign T280 = T284[T281];
  assign T281 = T282;
  assign T282 = T283;
  assign T283 = io_chanxy_config[5'h14/* 20*/:5'h14/* 20*/];
  assign T284 = T285;
  assign T285 = io_chanxy_in[6'h29/* 41*/:6'h28/* 40*/];
  assign T286 = T287;
  assign T287 = T288;
  assign T288 = T292[T289];
  assign T289 = T290;
  assign T290 = T291;
  assign T291 = io_chanxy_config[5'h15/* 21*/:5'h15/* 21*/];
  assign T292 = T293;
  assign T293 = io_chanxy_in[6'h2b/* 43*/:6'h2a/* 42*/];
  assign T294 = T295;
  assign T295 = T296;
  assign T296 = T300[T297];
  assign T297 = T298;
  assign T298 = T299;
  assign T299 = io_chanxy_config[5'h16/* 22*/:5'h16/* 22*/];
  assign T300 = T301;
  assign T301 = io_chanxy_in[6'h2d/* 45*/:6'h2c/* 44*/];
  assign T302 = T303;
  assign T303 = T304;
  assign T304 = io_chanxy_in[6'h2e/* 46*/:6'h2e/* 46*/];
  assign T305 = T306;
  assign T306 = T307;
  assign T307 = T311[T308];
  assign T308 = T309;
  assign T309 = T310;
  assign T310 = io_chanxy_config[5'h17/* 23*/:5'h17/* 23*/];
  assign T311 = T312;
  assign T312 = io_chanxy_in[6'h30/* 48*/:6'h2f/* 47*/];
  assign T313 = T314;
  assign T314 = T315;
  assign T315 = T319[T316];
  assign T316 = T317;
  assign T317 = T318;
  assign T318 = io_chanxy_config[5'h18/* 24*/:5'h18/* 24*/];
  assign T319 = T320;
  assign T320 = io_chanxy_in[6'h32/* 50*/:6'h31/* 49*/];
  assign T321 = T322;
  assign T322 = T323;
  assign T323 = T327[T324];
  assign T324 = T325;
  assign T325 = T326;
  assign T326 = io_chanxy_config[5'h19/* 25*/:5'h19/* 25*/];
  assign T327 = T328;
  assign T328 = io_chanxy_in[6'h34/* 52*/:6'h33/* 51*/];
  assign T329 = T330;
  assign T330 = T331;
  assign T331 = T335[T332];
  assign T332 = T333;
  assign T333 = T334;
  assign T334 = io_chanxy_config[5'h1a/* 26*/:5'h1a/* 26*/];
  assign T335 = T336;
  assign T336 = io_chanxy_in[6'h36/* 54*/:6'h35/* 53*/];
  assign T337 = T338;
  assign T338 = T339;
  assign T339 = T343[T340];
  assign T340 = T341;
  assign T341 = T342;
  assign T342 = io_chanxy_config[5'h1b/* 27*/:5'h1b/* 27*/];
  assign T343 = T344;
  assign T344 = io_chanxy_in[6'h38/* 56*/:6'h37/* 55*/];
  assign T345 = T346;
  assign T346 = T347;
  assign T347 = T351[T348];
  assign T348 = T349;
  assign T349 = T350;
  assign T350 = io_chanxy_config[5'h1c/* 28*/:5'h1c/* 28*/];
  assign T351 = T352;
  assign T352 = io_chanxy_in[6'h3a/* 58*/:6'h39/* 57*/];
  assign T353 = T354;
  assign T354 = T355;
  assign T355 = T359[T356];
  assign T356 = T357;
  assign T357 = T358;
  assign T358 = io_chanxy_config[5'h1d/* 29*/:5'h1d/* 29*/];
  assign T359 = T360;
  assign T360 = io_chanxy_in[6'h3c/* 60*/:6'h3b/* 59*/];
  assign T361 = T362;
  assign T362 = T363;
  assign T363 = T367[T364];
  assign T364 = T365;
  assign T365 = T366;
  assign T366 = io_chanxy_config[5'h1e/* 30*/:5'h1e/* 30*/];
  assign T367 = T368;
  assign T368 = io_chanxy_in[6'h3e/* 62*/:6'h3d/* 61*/];
  assign T369 = T370;
  assign T370 = T371;
  assign T371 = T375[T372];
  assign T372 = T373;
  assign T373 = T374;
  assign T374 = io_chanxy_config[5'h1f/* 31*/:5'h1f/* 31*/];
  assign T375 = T376;
  assign T376 = io_chanxy_in[7'h40/* 64*/:6'h3f/* 63*/];
  assign T377 = T378;
  assign T378 = T379;
  assign T379 = T383[T380];
  assign T380 = T381;
  assign T381 = T382;
  assign T382 = io_chanxy_config[6'h20/* 32*/:6'h20/* 32*/];
  assign T383 = T384;
  assign T384 = io_chanxy_in[7'h42/* 66*/:7'h41/* 65*/];
  assign T385 = T386;
  assign T386 = T387;
  assign T387 = T391[T388];
  assign T388 = T389;
  assign T389 = T390;
  assign T390 = io_chanxy_config[6'h21/* 33*/:6'h21/* 33*/];
  assign T391 = T392;
  assign T392 = io_chanxy_in[7'h44/* 68*/:7'h43/* 67*/];
  assign T393 = T394;
  assign T394 = T395;
  assign T395 = io_chanxy_in[7'h45/* 69*/:7'h45/* 69*/];
  assign T396 = T397;
  assign T397 = T398;
  assign T398 = T402[T399];
  assign T399 = T400;
  assign T400 = T401;
  assign T401 = io_chanxy_config[6'h25/* 37*/:6'h22/* 34*/];
  assign T402 = T403;
  assign T403 = io_chanxy_in[7'h4e/* 78*/:7'h46/* 70*/];
  assign T404 = T405;
  assign T405 = T406;
  assign T406 = T410[T407];
  assign T407 = T408;
  assign T408 = T409;
  assign T409 = io_chanxy_config[6'h26/* 38*/:6'h26/* 38*/];
  assign T410 = T411;
  assign T411 = io_chanxy_in[7'h50/* 80*/:7'h4f/* 79*/];
  assign T412 = T413;
  assign T413 = T414;
  assign T414 = T418[T415];
  assign T415 = T416;
  assign T416 = T417;
  assign T417 = io_chanxy_config[6'h2a/* 42*/:6'h27/* 39*/];
  assign T418 = T419;
  assign T419 = io_chanxy_in[7'h59/* 89*/:7'h51/* 81*/];
  assign T420 = T421;
  assign T421 = T422;
  assign T422 = T426[T423];
  assign T423 = T424;
  assign T424 = T425;
  assign T425 = io_chanxy_config[6'h2b/* 43*/:6'h2b/* 43*/];
  assign T426 = T427;
  assign T427 = io_chanxy_in[7'h5b/* 91*/:7'h5a/* 90*/];
  assign T428 = T429;
  assign T429 = T430;
  assign T430 = T434[T431];
  assign T431 = T432;
  assign T432 = T433;
  assign T433 = io_chanxy_config[6'h2f/* 47*/:6'h2c/* 44*/];
  assign T434 = T435;
  assign T435 = io_chanxy_in[7'h64/* 100*/:7'h5c/* 92*/];
  assign T436 = T437;
  assign T437 = T438;
  assign T438 = T442[T439];
  assign T439 = T440;
  assign T440 = T441;
  assign T441 = io_chanxy_config[6'h30/* 48*/:6'h30/* 48*/];
  assign T442 = T443;
  assign T443 = io_chanxy_in[7'h66/* 102*/:7'h65/* 101*/];
  assign T444 = T445;
  assign T445 = T446;
  assign T446 = T450[T447];
  assign T447 = T448;
  assign T448 = T449;
  assign T449 = io_chanxy_config[6'h34/* 52*/:6'h31/* 49*/];
  assign T450 = T451;
  assign T451 = io_chanxy_in[7'h6f/* 111*/:7'h67/* 103*/];
  assign T452 = T453;
  assign T453 = T454;
  assign T454 = T458[T455];
  assign T455 = T456;
  assign T456 = T457;
  assign T457 = io_chanxy_config[6'h35/* 53*/:6'h35/* 53*/];
  assign T458 = T459;
  assign T459 = io_chanxy_in[7'h71/* 113*/:7'h70/* 112*/];
  assign T460 = T461;
  assign T461 = T462;
  assign T462 = T466[T463];
  assign T463 = T464;
  assign T464 = T465;
  assign T465 = io_chanxy_config[6'h39/* 57*/:6'h36/* 54*/];
  assign T466 = T467;
  assign T467 = io_chanxy_in[7'h7a/* 122*/:7'h72/* 114*/];
  assign T468 = T469;
  assign T469 = T470;
  assign T470 = T474[T471];
  assign T471 = T472;
  assign T472 = T473;
  assign T473 = io_chanxy_config[6'h3a/* 58*/:6'h3a/* 58*/];
  assign T474 = T475;
  assign T475 = io_chanxy_in[7'h7c/* 124*/:7'h7b/* 123*/];
  assign T476 = T477;
  assign T477 = T478;
  assign T478 = T482[T479];
  assign T479 = T480;
  assign T480 = T481;
  assign T481 = io_chanxy_config[6'h3e/* 62*/:6'h3b/* 59*/];
  assign T482 = T483;
  assign T483 = io_chanxy_in[8'h85/* 133*/:7'h7d/* 125*/];
  assign T484 = T485;
  assign T485 = T486;
  assign T486 = T490[T487];
  assign T487 = T488;
  assign T488 = T489;
  assign T489 = io_chanxy_config[6'h3f/* 63*/:6'h3f/* 63*/];
  assign T490 = T491;
  assign T491 = io_chanxy_in[8'h87/* 135*/:8'h86/* 134*/];
  assign T492 = T493;
  assign T493 = T494;
  assign T494 = T498[T495];
  assign T495 = T496;
  assign T496 = T497;
  assign T497 = io_chanxy_config[7'h43/* 67*/:7'h40/* 64*/];
  assign T498 = T499;
  assign T499 = io_chanxy_in[8'h90/* 144*/:8'h88/* 136*/];
  assign T500 = T501;
  assign T501 = T502;
  assign T502 = T506[T503];
  assign T503 = T504;
  assign T504 = T505;
  assign T505 = io_chanxy_config[7'h44/* 68*/:7'h44/* 68*/];
  assign T506 = T507;
  assign T507 = io_chanxy_in[8'h92/* 146*/:8'h91/* 145*/];
  assign T508 = T509;
  assign T509 = T510;
  assign T510 = T514[T511];
  assign T511 = T512;
  assign T512 = T513;
  assign T513 = io_chanxy_config[7'h48/* 72*/:7'h45/* 69*/];
  assign T514 = T515;
  assign T515 = io_chanxy_in[8'h9b/* 155*/:8'h93/* 147*/];
  assign T516 = T517;
  assign T517 = T518;
  assign T518 = T522[T519];
  assign T519 = T520;
  assign T520 = T521;
  assign T521 = io_chanxy_config[7'h49/* 73*/:7'h49/* 73*/];
  assign T522 = T523;
  assign T523 = io_chanxy_in[8'h9d/* 157*/:8'h9c/* 156*/];
  assign T524 = T525;
  assign T525 = T526;
  assign T526 = T530[T527];
  assign T527 = T528;
  assign T528 = T529;
  assign T529 = io_chanxy_config[7'h4d/* 77*/:7'h4a/* 74*/];
  assign T530 = T531;
  assign T531 = io_chanxy_in[8'ha6/* 166*/:8'h9e/* 158*/];
  assign T532 = T533;
  assign T533 = T534;
  assign T534 = T538[T535];
  assign T535 = T536;
  assign T536 = T537;
  assign T537 = io_chanxy_config[7'h4e/* 78*/:7'h4e/* 78*/];
  assign T538 = T539;
  assign T539 = io_chanxy_in[8'ha8/* 168*/:8'ha7/* 167*/];
  assign T540 = T541;
  assign T541 = T542;
  assign T542 = T546[T543];
  assign T543 = T544;
  assign T544 = T545;
  assign T545 = io_chanxy_config[7'h51/* 81*/:7'h4f/* 79*/];
  assign T546 = T547;
  assign T547 = io_chanxy_in[8'hb0/* 176*/:8'ha9/* 169*/];
  assign T548 = T549;
  assign T549 = T550;
  assign T550 = T554[T551];
  assign T551 = T552;
  assign T552 = T553;
  assign T553 = io_chanxy_config[7'h52/* 82*/:7'h52/* 82*/];
  assign T554 = T555;
  assign T555 = io_chanxy_in[8'hb2/* 178*/:8'hb1/* 177*/];
  assign T556 = T557;
  assign T557 = T558;
  assign T558 = T562[T559];
  assign T559 = T560;
  assign T560 = T561;
  assign T561 = io_chanxy_config[7'h55/* 85*/:7'h53/* 83*/];
  assign T562 = T563;
  assign T563 = io_chanxy_in[8'hba/* 186*/:8'hb3/* 179*/];
  assign T564 = T565;
  assign T565 = T566;
  assign T566 = T570[T567];
  assign T567 = T568;
  assign T568 = T569;
  assign T569 = io_chanxy_config[7'h56/* 86*/:7'h56/* 86*/];
  assign T570 = T571;
  assign T571 = io_chanxy_in[8'hbc/* 188*/:8'hbb/* 187*/];
  assign T572 = T573;
  assign T573 = T574;
  assign T574 = T578[T575];
  assign T575 = T576;
  assign T576 = T577;
  assign T577 = io_chanxy_config[7'h59/* 89*/:7'h57/* 87*/];
  assign T578 = T579;
  assign T579 = io_chanxy_in[8'hc4/* 196*/:8'hbd/* 189*/];
  assign T580 = T581;
  assign T581 = T582;
  assign T582 = io_chanxy_in[8'hc5/* 197*/:8'hc5/* 197*/];
  assign io_ipin_out = T583;
  assign T583 = T584;
  assign T584 = {T660, T585};
  assign T585 = T586;
  assign T586 = {T651, T587};
  assign T587 = T588;
  assign T588 = {T642, T589};
  assign T589 = T590;
  assign T590 = {T633, T591};
  assign T591 = T592;
  assign T592 = {T624, T593};
  assign T593 = T594;
  assign T594 = {T615, T595};
  assign T595 = T596;
  assign T596 = {T606, T597};
  assign T597 = T598;
  assign T598 = T599;
  assign T599 = T604[T600];
  assign T600 = T601;
  assign T601 = T602;
  assign T602 = {6'h0/* 0*/, T603};
  assign T603 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T604 = T605;
  assign T605 = io_ipin_in[4'h9/* 9*/:1'h0/* 0*/];
  assign T606 = T607;
  assign T607 = T608;
  assign T608 = T613[T609];
  assign T609 = T610;
  assign T610 = T611;
  assign T611 = {6'h0/* 0*/, T612};
  assign T612 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T613 = T614;
  assign T614 = io_ipin_in[5'h13/* 19*/:4'ha/* 10*/];
  assign T615 = T616;
  assign T616 = T617;
  assign T617 = T622[T618];
  assign T618 = T619;
  assign T619 = T620;
  assign T620 = {6'h0/* 0*/, T621};
  assign T621 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T622 = T623;
  assign T623 = io_ipin_in[5'h1d/* 29*/:5'h14/* 20*/];
  assign T624 = T625;
  assign T625 = T626;
  assign T626 = T631[T627];
  assign T627 = T628;
  assign T628 = T629;
  assign T629 = {6'h0/* 0*/, T630};
  assign T630 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T631 = T632;
  assign T632 = io_ipin_in[6'h27/* 39*/:5'h1e/* 30*/];
  assign T633 = T634;
  assign T634 = T635;
  assign T635 = T640[T636];
  assign T636 = T637;
  assign T637 = T638;
  assign T638 = {6'h0/* 0*/, T639};
  assign T639 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T640 = T641;
  assign T641 = io_ipin_in[6'h31/* 49*/:6'h28/* 40*/];
  assign T642 = T643;
  assign T643 = T644;
  assign T644 = T649[T645];
  assign T645 = T646;
  assign T646 = T647;
  assign T647 = {6'h0/* 0*/, T648};
  assign T648 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T649 = T650;
  assign T650 = io_ipin_in[6'h3b/* 59*/:6'h32/* 50*/];
  assign T651 = T652;
  assign T652 = T653;
  assign T653 = T658[T654];
  assign T654 = T655;
  assign T655 = T656;
  assign T656 = {6'h0/* 0*/, T657};
  assign T657 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T658 = T659;
  assign T659 = io_ipin_in[7'h45/* 69*/:6'h3c/* 60*/];
  assign T660 = T661;
  assign T661 = T662;
  assign T662 = T667[T663];
  assign T663 = T664;
  assign T664 = T665;
  assign T665 = {6'h0/* 0*/, T666};
  assign T666 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T667 = T668;
  assign T668 = io_ipin_in[7'h4f/* 79*/:7'h46/* 70*/];
endmodule

module io_tile_sp_7(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [197:0] io_chanxy_in,
    output[59:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[59:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h8/* 8*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_2 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_woc(
    input [79:0] io_ipin_in,
    input [31:0] io_ipin_config,
    output[7:0] io_ipin_out);

  wire[7:0] T0;
  wire[7:0] T1;
  wire[6:0] T2;
  wire[6:0] T3;
  wire[5:0] T4;
  wire[5:0] T5;
  wire[4:0] T6;
  wire[4:0] T7;
  wire[3:0] T8;
  wire[3:0] T9;
  wire[2:0] T10;
  wire[2:0] T11;
  wire[1:0] T12;
  wire[1:0] T13;
  wire T14;
  wire T15;
  wire T16;
  wire[9:0] T17;
  wire[9:0] T18;
  wire[9:0] T19;
  wire[3:0] T20;
  wire[9:0] T21;
  wire[9:0] T22;
  wire T23;
  wire T24;
  wire T25;
  wire[9:0] T26;
  wire[9:0] T27;
  wire[9:0] T28;
  wire[3:0] T29;
  wire[9:0] T30;
  wire[9:0] T31;
  wire T32;
  wire T33;
  wire T34;
  wire[9:0] T35;
  wire[9:0] T36;
  wire[9:0] T37;
  wire[3:0] T38;
  wire[9:0] T39;
  wire[9:0] T40;
  wire T41;
  wire T42;
  wire T43;
  wire[9:0] T44;
  wire[9:0] T45;
  wire[9:0] T46;
  wire[3:0] T47;
  wire[9:0] T48;
  wire[9:0] T49;
  wire T50;
  wire T51;
  wire T52;
  wire[9:0] T53;
  wire[9:0] T54;
  wire[9:0] T55;
  wire[3:0] T56;
  wire[9:0] T57;
  wire[9:0] T58;
  wire T59;
  wire T60;
  wire T61;
  wire[9:0] T62;
  wire[9:0] T63;
  wire[9:0] T64;
  wire[3:0] T65;
  wire[9:0] T66;
  wire[9:0] T67;
  wire T68;
  wire T69;
  wire T70;
  wire[9:0] T71;
  wire[9:0] T72;
  wire[9:0] T73;
  wire[3:0] T74;
  wire[9:0] T75;
  wire[9:0] T76;
  wire T77;
  wire T78;
  wire T79;
  wire[9:0] T80;
  wire[9:0] T81;
  wire[9:0] T82;
  wire[3:0] T83;
  wire[9:0] T84;
  wire[9:0] T85;

  assign io_ipin_out = T0;
  assign T0 = T1;
  assign T1 = {T77, T2};
  assign T2 = T3;
  assign T3 = {T68, T4};
  assign T4 = T5;
  assign T5 = {T59, T6};
  assign T6 = T7;
  assign T7 = {T50, T8};
  assign T8 = T9;
  assign T9 = {T41, T10};
  assign T10 = T11;
  assign T11 = {T32, T12};
  assign T12 = T13;
  assign T13 = {T23, T14};
  assign T14 = T15;
  assign T15 = T16;
  assign T16 = T21[T17];
  assign T17 = T18;
  assign T18 = T19;
  assign T19 = {6'h0/* 0*/, T20};
  assign T20 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T21 = T22;
  assign T22 = io_ipin_in[4'h9/* 9*/:1'h0/* 0*/];
  assign T23 = T24;
  assign T24 = T25;
  assign T25 = T30[T26];
  assign T26 = T27;
  assign T27 = T28;
  assign T28 = {6'h0/* 0*/, T29};
  assign T29 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T30 = T31;
  assign T31 = io_ipin_in[5'h13/* 19*/:4'ha/* 10*/];
  assign T32 = T33;
  assign T33 = T34;
  assign T34 = T39[T35];
  assign T35 = T36;
  assign T36 = T37;
  assign T37 = {6'h0/* 0*/, T38};
  assign T38 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T39 = T40;
  assign T40 = io_ipin_in[5'h1d/* 29*/:5'h14/* 20*/];
  assign T41 = T42;
  assign T42 = T43;
  assign T43 = T48[T44];
  assign T44 = T45;
  assign T45 = T46;
  assign T46 = {6'h0/* 0*/, T47};
  assign T47 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T48 = T49;
  assign T49 = io_ipin_in[6'h27/* 39*/:5'h1e/* 30*/];
  assign T50 = T51;
  assign T51 = T52;
  assign T52 = T57[T53];
  assign T53 = T54;
  assign T54 = T55;
  assign T55 = {6'h0/* 0*/, T56};
  assign T56 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T57 = T58;
  assign T58 = io_ipin_in[6'h31/* 49*/:6'h28/* 40*/];
  assign T59 = T60;
  assign T60 = T61;
  assign T61 = T66[T62];
  assign T62 = T63;
  assign T63 = T64;
  assign T64 = {6'h0/* 0*/, T65};
  assign T65 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T66 = T67;
  assign T67 = io_ipin_in[6'h3b/* 59*/:6'h32/* 50*/];
  assign T68 = T69;
  assign T69 = T70;
  assign T70 = T75[T71];
  assign T71 = T72;
  assign T72 = T73;
  assign T73 = {6'h0/* 0*/, T74};
  assign T74 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T75 = T76;
  assign T76 = io_ipin_in[7'h45/* 69*/:6'h3c/* 60*/];
  assign T77 = T78;
  assign T78 = T79;
  assign T79 = T84[T80];
  assign T80 = T81;
  assign T81 = T82;
  assign T82 = {6'h0/* 0*/, T83};
  assign T83 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T84 = T85;
  assign T85 = io_ipin_in[7'h4f/* 79*/:7'h46/* 70*/];
endmodule


module io_tile_sp_8(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {7'h0/* 0*/, 1'h1/* 1*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_9(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {6'h0/* 0*/, 2'h2/* 2*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_10(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {6'h0/* 0*/, 2'h3/* 3*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_11(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h4/* 4*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_12(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h5/* 5*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_13(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h6/* 6*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_14(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h7/* 7*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_15(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h8/* 8*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_16(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [197:0] io_chanxy_in,
    output[59:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[59:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {7'h0/* 0*/, 1'h1/* 1*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_17(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {6'h0/* 0*/, 2'h2/* 2*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_18(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {6'h0/* 0*/, 2'h3/* 3*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_19(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {5'h0/* 0*/, 3'h4/* 4*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_20(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {5'h0/* 0*/, 3'h5/* 5*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_21(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {5'h0/* 0*/, 3'h6/* 6*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_22(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [209:0] io_chanxy_in,
    output[23:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[23:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {5'h0/* 0*/, 3'h7/* 7*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_1 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_23(input clk, input reset,
    input [31:0] io_configs_in,
    input [3:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    input [197:0] io_chanxy_in,
    output[59:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[89:0] T0;
  wire[127:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[59:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[7'h79/* 121*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {4'h0/* 0*/, 4'h8/* 8*/};
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_wc_2 this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
    configs_latches_4 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_24(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h1/* 1*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_25(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {6'h0/* 0*/, 2'h2/* 2*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_26(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {6'h0/* 0*/, 2'h3/* 3*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_27(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h4/* 4*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_28(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h5/* 5*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_29(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h6/* 6*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_30(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h7/* 7*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_31(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [79:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'h9/* 9*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h8/* 8*/};
  assign io_opin_out = io_io_input;
  assign io_io_output = this_sbcb_io_ipin_out;
  io_sbcb_woc this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ));
    configs_latches_1 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule


