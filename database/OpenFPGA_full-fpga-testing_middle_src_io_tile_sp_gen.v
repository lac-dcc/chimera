// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module io_sbcb_wc(
    input [95:0] io_ipin_in,
    input [31:0] io_ipin_config,
    input [254:0] io_chanxy_in,
    input [119:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[74:0] io_chanxy_out);

  wire[74:0] T0;
  wire[74:0] T1;
  wire[73:0] T2;
  wire[73:0] T3;
  wire[72:0] T4;
  wire[72:0] T5;
  wire[71:0] T6;
  wire[71:0] T7;
  wire[70:0] T8;
  wire[70:0] T9;
  wire[69:0] T10;
  wire[69:0] T11;
  wire[68:0] T12;
  wire[68:0] T13;
  wire[67:0] T14;
  wire[67:0] T15;
  wire[66:0] T16;
  wire[66:0] T17;
  wire[65:0] T18;
  wire[65:0] T19;
  wire[64:0] T20;
  wire[64:0] T21;
  wire[63:0] T22;
  wire[63:0] T23;
  wire[62:0] T24;
  wire[62:0] T25;
  wire[61:0] T26;
  wire[61:0] T27;
  wire[60:0] T28;
  wire[60:0] T29;
  wire[59:0] T30;
  wire[59:0] T31;
  wire[58:0] T32;
  wire[58:0] T33;
  wire[57:0] T34;
  wire[57:0] T35;
  wire[56:0] T36;
  wire[56:0] T37;
  wire[55:0] T38;
  wire[55:0] T39;
  wire[54:0] T40;
  wire[54:0] T41;
  wire[53:0] T42;
  wire[53:0] T43;
  wire[52:0] T44;
  wire[52:0] T45;
  wire[51:0] T46;
  wire[51:0] T47;
  wire[50:0] T48;
  wire[50:0] T49;
  wire[49:0] T50;
  wire[49:0] T51;
  wire[48:0] T52;
  wire[48:0] T53;
  wire[47:0] T54;
  wire[47:0] T55;
  wire[46:0] T56;
  wire[46:0] T57;
  wire[45:0] T58;
  wire[45:0] T59;
  wire[44:0] T60;
  wire[44:0] T61;
  wire[43:0] T62;
  wire[43:0] T63;
  wire[42:0] T64;
  wire[42:0] T65;
  wire[41:0] T66;
  wire[41:0] T67;
  wire[40:0] T68;
  wire[40:0] T69;
  wire[39:0] T70;
  wire[39:0] T71;
  wire[38:0] T72;
  wire[38:0] T73;
  wire[37:0] T74;
  wire[37:0] T75;
  wire[36:0] T76;
  wire[36:0] T77;
  wire[35:0] T78;
  wire[35:0] T79;
  wire[34:0] T80;
  wire[34:0] T81;
  wire[33:0] T82;
  wire[33:0] T83;
  wire[32:0] T84;
  wire[32:0] T85;
  wire[31:0] T86;
  wire[31:0] T87;
  wire[30:0] T88;
  wire[30:0] T89;
  wire[29:0] T90;
  wire[29:0] T91;
  wire[28:0] T92;
  wire[28:0] T93;
  wire[27:0] T94;
  wire[27:0] T95;
  wire[26:0] T96;
  wire[26:0] T97;
  wire[25:0] T98;
  wire[25:0] T99;
  wire[24:0] T100;
  wire[24:0] T101;
  wire[23:0] T102;
  wire[23:0] T103;
  wire[22:0] T104;
  wire[22:0] T105;
  wire[21:0] T106;
  wire[21:0] T107;
  wire[20:0] T108;
  wire[20:0] T109;
  wire[19:0] T110;
  wire[19:0] T111;
  wire[18:0] T112;
  wire[18:0] T113;
  wire[17:0] T114;
  wire[17:0] T115;
  wire[16:0] T116;
  wire[16:0] T117;
  wire[15:0] T118;
  wire[15:0] T119;
  wire[14:0] T120;
  wire[14:0] T121;
  wire[13:0] T122;
  wire[13:0] T123;
  wire[12:0] T124;
  wire[12:0] T125;
  wire[11:0] T126;
  wire[11:0] T127;
  wire[10:0] T128;
  wire[10:0] T129;
  wire[9:0] T130;
  wire[9:0] T131;
  wire[8:0] T132;
  wire[8:0] T133;
  wire[7:0] T134;
  wire[7:0] T135;
  wire[6:0] T136;
  wire[6:0] T137;
  wire[5:0] T138;
  wire[5:0] T139;
  wire[4:0] T140;
  wire[4:0] T141;
  wire[3:0] T142;
  wire[3:0] T143;
  wire[2:0] T144;
  wire[2:0] T145;
  wire[1:0] T146;
  wire[1:0] T147;
  wire T148;
  wire T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire[1:0] T154;
  wire[1:0] T155;
  wire T156;
  wire T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire[1:0] T162;
  wire[1:0] T163;
  wire T164;
  wire T165;
  wire T166;
  wire[3:0] T167;
  wire[3:0] T168;
  wire[3:0] T169;
  wire[8:0] T170;
  wire[8:0] T171;
  wire T172;
  wire T173;
  wire T174;
  wire T175;
  wire T176;
  wire T177;
  wire[1:0] T178;
  wire[1:0] T179;
  wire T180;
  wire T181;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire[1:0] T186;
  wire[1:0] T187;
  wire T188;
  wire T189;
  wire T190;
  wire T191;
  wire T192;
  wire T193;
  wire[1:0] T194;
  wire[1:0] T195;
  wire T196;
  wire T197;
  wire T198;
  wire T199;
  wire T200;
  wire T201;
  wire[1:0] T202;
  wire[1:0] T203;
  wire T204;
  wire T205;
  wire T206;
  wire[3:0] T207;
  wire[3:0] T208;
  wire[3:0] T209;
  wire[8:0] T210;
  wire[8:0] T211;
  wire T212;
  wire T213;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire[1:0] T218;
  wire[1:0] T219;
  wire T220;
  wire T221;
  wire T222;
  wire T223;
  wire T224;
  wire T225;
  wire[1:0] T226;
  wire[1:0] T227;
  wire T228;
  wire T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire[1:0] T234;
  wire[1:0] T235;
  wire T236;
  wire T237;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire[1:0] T242;
  wire[1:0] T243;
  wire T244;
  wire T245;
  wire T246;
  wire[3:0] T247;
  wire[3:0] T248;
  wire[3:0] T249;
  wire[8:0] T250;
  wire[8:0] T251;
  wire T252;
  wire T253;
  wire T254;
  wire T255;
  wire T256;
  wire T257;
  wire[1:0] T258;
  wire[1:0] T259;
  wire T260;
  wire T261;
  wire T262;
  wire T263;
  wire T264;
  wire T265;
  wire[1:0] T266;
  wire[1:0] T267;
  wire T268;
  wire T269;
  wire T270;
  wire T271;
  wire T272;
  wire T273;
  wire[1:0] T274;
  wire[1:0] T275;
  wire T276;
  wire T277;
  wire T278;
  wire T279;
  wire T280;
  wire T281;
  wire[1:0] T282;
  wire[1:0] T283;
  wire T284;
  wire T285;
  wire T286;
  wire[3:0] T287;
  wire[3:0] T288;
  wire[3:0] T289;
  wire[8:0] T290;
  wire[8:0] T291;
  wire T292;
  wire T293;
  wire T294;
  wire T295;
  wire T296;
  wire T297;
  wire[1:0] T298;
  wire[1:0] T299;
  wire T300;
  wire T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire[1:0] T306;
  wire[1:0] T307;
  wire T308;
  wire T309;
  wire T310;
  wire T311;
  wire T312;
  wire T313;
  wire[1:0] T314;
  wire[1:0] T315;
  wire T316;
  wire T317;
  wire T318;
  wire T319;
  wire T320;
  wire T321;
  wire[1:0] T322;
  wire[1:0] T323;
  wire T324;
  wire T325;
  wire T326;
  wire[3:0] T327;
  wire[3:0] T328;
  wire[3:0] T329;
  wire[8:0] T330;
  wire[8:0] T331;
  wire T332;
  wire T333;
  wire T334;
  wire T335;
  wire T336;
  wire T337;
  wire[1:0] T338;
  wire[1:0] T339;
  wire T340;
  wire T341;
  wire T342;
  wire T343;
  wire T344;
  wire T345;
  wire[1:0] T346;
  wire[1:0] T347;
  wire T348;
  wire T349;
  wire T350;
  wire T351;
  wire T352;
  wire T353;
  wire[1:0] T354;
  wire[1:0] T355;
  wire T356;
  wire T357;
  wire T358;
  wire T359;
  wire T360;
  wire T361;
  wire[1:0] T362;
  wire[1:0] T363;
  wire T364;
  wire T365;
  wire T366;
  wire[3:0] T367;
  wire[3:0] T368;
  wire[3:0] T369;
  wire[8:0] T370;
  wire[8:0] T371;
  wire T372;
  wire T373;
  wire T374;
  wire T375;
  wire T376;
  wire T377;
  wire[1:0] T378;
  wire[1:0] T379;
  wire T380;
  wire T381;
  wire T382;
  wire T383;
  wire T384;
  wire T385;
  wire[1:0] T386;
  wire[1:0] T387;
  wire T388;
  wire T389;
  wire T390;
  wire T391;
  wire T392;
  wire T393;
  wire[1:0] T394;
  wire[1:0] T395;
  wire T396;
  wire T397;
  wire T398;
  wire T399;
  wire T400;
  wire T401;
  wire[1:0] T402;
  wire[1:0] T403;
  wire T404;
  wire T405;
  wire T406;
  wire[3:0] T407;
  wire[3:0] T408;
  wire[3:0] T409;
  wire[8:0] T410;
  wire[8:0] T411;
  wire T412;
  wire T413;
  wire T414;
  wire T415;
  wire T416;
  wire T417;
  wire[1:0] T418;
  wire[1:0] T419;
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
  wire T431;
  wire T432;
  wire T433;
  wire[1:0] T434;
  wire[1:0] T435;
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
  wire T463;
  wire T464;
  wire T465;
  wire[1:0] T466;
  wire[1:0] T467;
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
  wire T479;
  wire T480;
  wire T481;
  wire[1:0] T482;
  wire[1:0] T483;
  wire T484;
  wire T485;
  wire T486;
  wire[3:0] T487;
  wire[3:0] T488;
  wire[3:0] T489;
  wire[8:0] T490;
  wire[8:0] T491;
  wire T492;
  wire T493;
  wire T494;
  wire T495;
  wire T496;
  wire T497;
  wire[1:0] T498;
  wire[1:0] T499;
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
  wire T511;
  wire T512;
  wire T513;
  wire[1:0] T514;
  wire[1:0] T515;
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
  wire T543;
  wire T544;
  wire T545;
  wire[1:0] T546;
  wire[1:0] T547;
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
  wire T559;
  wire T560;
  wire T561;
  wire[1:0] T562;
  wire[1:0] T563;
  wire T564;
  wire T565;
  wire T566;
  wire[3:0] T567;
  wire[3:0] T568;
  wire[3:0] T569;
  wire[8:0] T570;
  wire[8:0] T571;
  wire T572;
  wire T573;
  wire T574;
  wire T575;
  wire T576;
  wire T577;
  wire[1:0] T578;
  wire[1:0] T579;
  wire T580;
  wire T581;
  wire T582;
  wire T583;
  wire T584;
  wire T585;
  wire[1:0] T586;
  wire[1:0] T587;
  wire T588;
  wire T589;
  wire T590;
  wire T591;
  wire T592;
  wire T593;
  wire[1:0] T594;
  wire[1:0] T595;
  wire T596;
  wire T597;
  wire T598;
  wire T599;
  wire T600;
  wire T601;
  wire[1:0] T602;
  wire[1:0] T603;
  wire T604;
  wire T605;
  wire T606;
  wire[3:0] T607;
  wire[3:0] T608;
  wire[3:0] T609;
  wire[8:0] T610;
  wire[8:0] T611;
  wire T612;
  wire T613;
  wire T614;
  wire T615;
  wire T616;
  wire T617;
  wire[1:0] T618;
  wire[1:0] T619;
  wire T620;
  wire T621;
  wire T622;
  wire T623;
  wire T624;
  wire T625;
  wire[1:0] T626;
  wire[1:0] T627;
  wire T628;
  wire T629;
  wire T630;
  wire T631;
  wire T632;
  wire T633;
  wire[1:0] T634;
  wire[1:0] T635;
  wire T636;
  wire T637;
  wire T638;
  wire T639;
  wire T640;
  wire T641;
  wire[1:0] T642;
  wire[1:0] T643;
  wire T644;
  wire T645;
  wire T646;
  wire[3:0] T647;
  wire[3:0] T648;
  wire[3:0] T649;
  wire[8:0] T650;
  wire[8:0] T651;
  wire T652;
  wire T653;
  wire T654;
  wire T655;
  wire T656;
  wire T657;
  wire[1:0] T658;
  wire[1:0] T659;
  wire T660;
  wire T661;
  wire T662;
  wire T663;
  wire T664;
  wire T665;
  wire[1:0] T666;
  wire[1:0] T667;
  wire T668;
  wire T669;
  wire T670;
  wire T671;
  wire T672;
  wire T673;
  wire[1:0] T674;
  wire[1:0] T675;
  wire T676;
  wire T677;
  wire T678;
  wire T679;
  wire T680;
  wire T681;
  wire[1:0] T682;
  wire[1:0] T683;
  wire T684;
  wire T685;
  wire T686;
  wire[3:0] T687;
  wire[3:0] T688;
  wire[3:0] T689;
  wire[8:0] T690;
  wire[8:0] T691;
  wire T692;
  wire T693;
  wire T694;
  wire T695;
  wire T696;
  wire T697;
  wire[1:0] T698;
  wire[1:0] T699;
  wire T700;
  wire T701;
  wire T702;
  wire T703;
  wire T704;
  wire T705;
  wire[1:0] T706;
  wire[1:0] T707;
  wire T708;
  wire T709;
  wire T710;
  wire T711;
  wire T712;
  wire T713;
  wire[1:0] T714;
  wire[1:0] T715;
  wire T716;
  wire T717;
  wire T718;
  wire T719;
  wire T720;
  wire T721;
  wire[1:0] T722;
  wire[1:0] T723;
  wire T724;
  wire T725;
  wire T726;
  wire[3:0] T727;
  wire[3:0] T728;
  wire[3:0] T729;
  wire[8:0] T730;
  wire[8:0] T731;
  wire T732;
  wire T733;
  wire T734;
  wire T735;
  wire T736;
  wire T737;
  wire[1:0] T738;
  wire[1:0] T739;
  wire T740;
  wire T741;
  wire T742;
  wire T743;
  wire T744;
  wire T745;
  wire[1:0] T746;
  wire[1:0] T747;
  wire[7:0] T748;
  wire[7:0] T749;
  wire[6:0] T750;
  wire[6:0] T751;
  wire[5:0] T752;
  wire[5:0] T753;
  wire[4:0] T754;
  wire[4:0] T755;
  wire[3:0] T756;
  wire[3:0] T757;
  wire[2:0] T758;
  wire[2:0] T759;
  wire[1:0] T760;
  wire[1:0] T761;
  wire T762;
  wire T763;
  wire T764;
  wire[11:0] T765;
  wire[11:0] T766;
  wire[11:0] T767;
  wire[3:0] T768;
  wire[11:0] T769;
  wire[11:0] T770;
  wire T771;
  wire T772;
  wire T773;
  wire[11:0] T774;
  wire[11:0] T775;
  wire[11:0] T776;
  wire[3:0] T777;
  wire[11:0] T778;
  wire[11:0] T779;
  wire T780;
  wire T781;
  wire T782;
  wire[11:0] T783;
  wire[11:0] T784;
  wire[11:0] T785;
  wire[3:0] T786;
  wire[11:0] T787;
  wire[11:0] T788;
  wire T789;
  wire T790;
  wire T791;
  wire[11:0] T792;
  wire[11:0] T793;
  wire[11:0] T794;
  wire[3:0] T795;
  wire[11:0] T796;
  wire[11:0] T797;
  wire T798;
  wire T799;
  wire T800;
  wire[11:0] T801;
  wire[11:0] T802;
  wire[11:0] T803;
  wire[3:0] T804;
  wire[11:0] T805;
  wire[11:0] T806;
  wire T807;
  wire T808;
  wire T809;
  wire[11:0] T810;
  wire[11:0] T811;
  wire[11:0] T812;
  wire[3:0] T813;
  wire[11:0] T814;
  wire[11:0] T815;
  wire T816;
  wire T817;
  wire T818;
  wire[11:0] T819;
  wire[11:0] T820;
  wire[11:0] T821;
  wire[3:0] T822;
  wire[11:0] T823;
  wire[11:0] T824;
  wire T825;
  wire T826;
  wire T827;
  wire[11:0] T828;
  wire[11:0] T829;
  wire[11:0] T830;
  wire[3:0] T831;
  wire[11:0] T832;
  wire[11:0] T833;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T740, T2};
  assign T2 = T3;
  assign T3 = {T732, T4};
  assign T4 = T5;
  assign T5 = {T724, T6};
  assign T6 = T7;
  assign T7 = {T716, T8};
  assign T8 = T9;
  assign T9 = {T708, T10};
  assign T10 = T11;
  assign T11 = {T700, T12};
  assign T12 = T13;
  assign T13 = {T692, T14};
  assign T14 = T15;
  assign T15 = {T684, T16};
  assign T16 = T17;
  assign T17 = {T676, T18};
  assign T18 = T19;
  assign T19 = {T668, T20};
  assign T20 = T21;
  assign T21 = {T660, T22};
  assign T22 = T23;
  assign T23 = {T652, T24};
  assign T24 = T25;
  assign T25 = {T644, T26};
  assign T26 = T27;
  assign T27 = {T636, T28};
  assign T28 = T29;
  assign T29 = {T628, T30};
  assign T30 = T31;
  assign T31 = {T620, T32};
  assign T32 = T33;
  assign T33 = {T612, T34};
  assign T34 = T35;
  assign T35 = {T604, T36};
  assign T36 = T37;
  assign T37 = {T596, T38};
  assign T38 = T39;
  assign T39 = {T588, T40};
  assign T40 = T41;
  assign T41 = {T580, T42};
  assign T42 = T43;
  assign T43 = {T572, T44};
  assign T44 = T45;
  assign T45 = {T564, T46};
  assign T46 = T47;
  assign T47 = {T556, T48};
  assign T48 = T49;
  assign T49 = {T548, T50};
  assign T50 = T51;
  assign T51 = {T540, T52};
  assign T52 = T53;
  assign T53 = {T532, T54};
  assign T54 = T55;
  assign T55 = {T524, T56};
  assign T56 = T57;
  assign T57 = {T516, T58};
  assign T58 = T59;
  assign T59 = {T508, T60};
  assign T60 = T61;
  assign T61 = {T500, T62};
  assign T62 = T63;
  assign T63 = {T492, T64};
  assign T64 = T65;
  assign T65 = {T484, T66};
  assign T66 = T67;
  assign T67 = {T476, T68};
  assign T68 = T69;
  assign T69 = {T468, T70};
  assign T70 = T71;
  assign T71 = {T460, T72};
  assign T72 = T73;
  assign T73 = {T452, T74};
  assign T74 = T75;
  assign T75 = {T444, T76};
  assign T76 = T77;
  assign T77 = {T436, T78};
  assign T78 = T79;
  assign T79 = {T428, T80};
  assign T80 = T81;
  assign T81 = {T420, T82};
  assign T82 = T83;
  assign T83 = {T412, T84};
  assign T84 = T85;
  assign T85 = {T404, T86};
  assign T86 = T87;
  assign T87 = {T396, T88};
  assign T88 = T89;
  assign T89 = {T388, T90};
  assign T90 = T91;
  assign T91 = {T380, T92};
  assign T92 = T93;
  assign T93 = {T372, T94};
  assign T94 = T95;
  assign T95 = {T364, T96};
  assign T96 = T97;
  assign T97 = {T356, T98};
  assign T98 = T99;
  assign T99 = {T348, T100};
  assign T100 = T101;
  assign T101 = {T340, T102};
  assign T102 = T103;
  assign T103 = {T332, T104};
  assign T104 = T105;
  assign T105 = {T324, T106};
  assign T106 = T107;
  assign T107 = {T316, T108};
  assign T108 = T109;
  assign T109 = {T308, T110};
  assign T110 = T111;
  assign T111 = {T300, T112};
  assign T112 = T113;
  assign T113 = {T292, T114};
  assign T114 = T115;
  assign T115 = {T284, T116};
  assign T116 = T117;
  assign T117 = {T276, T118};
  assign T118 = T119;
  assign T119 = {T268, T120};
  assign T120 = T121;
  assign T121 = {T260, T122};
  assign T122 = T123;
  assign T123 = {T252, T124};
  assign T124 = T125;
  assign T125 = {T244, T126};
  assign T126 = T127;
  assign T127 = {T236, T128};
  assign T128 = T129;
  assign T129 = {T228, T130};
  assign T130 = T131;
  assign T131 = {T220, T132};
  assign T132 = T133;
  assign T133 = {T212, T134};
  assign T134 = T135;
  assign T135 = {T204, T136};
  assign T136 = T137;
  assign T137 = {T196, T138};
  assign T138 = T139;
  assign T139 = {T188, T140};
  assign T140 = T141;
  assign T141 = {T180, T142};
  assign T142 = T143;
  assign T143 = {T172, T144};
  assign T144 = T145;
  assign T145 = {T164, T146};
  assign T146 = T147;
  assign T147 = {T156, T148};
  assign T148 = T149;
  assign T149 = T150;
  assign T150 = T154[T151];
  assign T151 = T152;
  assign T152 = T153;
  assign T153 = io_chanxy_config[1'h0/* 0*/:1'h0/* 0*/];
  assign T154 = T155;
  assign T155 = io_chanxy_in[1'h1/* 1*/:1'h0/* 0*/];
  assign T156 = T157;
  assign T157 = T158;
  assign T158 = T162[T159];
  assign T159 = T160;
  assign T160 = T161;
  assign T161 = io_chanxy_config[1'h1/* 1*/:1'h1/* 1*/];
  assign T162 = T163;
  assign T163 = io_chanxy_in[2'h3/* 3*/:2'h2/* 2*/];
  assign T164 = T165;
  assign T165 = T166;
  assign T166 = T170[T167];
  assign T167 = T168;
  assign T168 = T169;
  assign T169 = io_chanxy_config[3'h5/* 5*/:2'h2/* 2*/];
  assign T170 = T171;
  assign T171 = io_chanxy_in[4'hc/* 12*/:3'h4/* 4*/];
  assign T172 = T173;
  assign T173 = T174;
  assign T174 = T178[T175];
  assign T175 = T176;
  assign T176 = T177;
  assign T177 = io_chanxy_config[3'h6/* 6*/:3'h6/* 6*/];
  assign T178 = T179;
  assign T179 = io_chanxy_in[4'he/* 14*/:4'hd/* 13*/];
  assign T180 = T181;
  assign T181 = T182;
  assign T182 = T186[T183];
  assign T183 = T184;
  assign T184 = T185;
  assign T185 = io_chanxy_config[3'h7/* 7*/:3'h7/* 7*/];
  assign T186 = T187;
  assign T187 = io_chanxy_in[5'h10/* 16*/:4'hf/* 15*/];
  assign T188 = T189;
  assign T189 = T190;
  assign T190 = T194[T191];
  assign T191 = T192;
  assign T192 = T193;
  assign T193 = io_chanxy_config[4'h8/* 8*/:4'h8/* 8*/];
  assign T194 = T195;
  assign T195 = io_chanxy_in[5'h12/* 18*/:5'h11/* 17*/];
  assign T196 = T197;
  assign T197 = T198;
  assign T198 = T202[T199];
  assign T199 = T200;
  assign T200 = T201;
  assign T201 = io_chanxy_config[4'h9/* 9*/:4'h9/* 9*/];
  assign T202 = T203;
  assign T203 = io_chanxy_in[5'h14/* 20*/:5'h13/* 19*/];
  assign T204 = T205;
  assign T205 = T206;
  assign T206 = T210[T207];
  assign T207 = T208;
  assign T208 = T209;
  assign T209 = io_chanxy_config[4'hd/* 13*/:4'ha/* 10*/];
  assign T210 = T211;
  assign T211 = io_chanxy_in[5'h1d/* 29*/:5'h15/* 21*/];
  assign T212 = T213;
  assign T213 = T214;
  assign T214 = T218[T215];
  assign T215 = T216;
  assign T216 = T217;
  assign T217 = io_chanxy_config[4'he/* 14*/:4'he/* 14*/];
  assign T218 = T219;
  assign T219 = io_chanxy_in[5'h1f/* 31*/:5'h1e/* 30*/];
  assign T220 = T221;
  assign T221 = T222;
  assign T222 = T226[T223];
  assign T223 = T224;
  assign T224 = T225;
  assign T225 = io_chanxy_config[4'hf/* 15*/:4'hf/* 15*/];
  assign T226 = T227;
  assign T227 = io_chanxy_in[6'h21/* 33*/:6'h20/* 32*/];
  assign T228 = T229;
  assign T229 = T230;
  assign T230 = T234[T231];
  assign T231 = T232;
  assign T232 = T233;
  assign T233 = io_chanxy_config[5'h10/* 16*/:5'h10/* 16*/];
  assign T234 = T235;
  assign T235 = io_chanxy_in[6'h23/* 35*/:6'h22/* 34*/];
  assign T236 = T237;
  assign T237 = T238;
  assign T238 = T242[T239];
  assign T239 = T240;
  assign T240 = T241;
  assign T241 = io_chanxy_config[5'h11/* 17*/:5'h11/* 17*/];
  assign T242 = T243;
  assign T243 = io_chanxy_in[6'h25/* 37*/:6'h24/* 36*/];
  assign T244 = T245;
  assign T245 = T246;
  assign T246 = T250[T247];
  assign T247 = T248;
  assign T248 = T249;
  assign T249 = io_chanxy_config[5'h15/* 21*/:5'h12/* 18*/];
  assign T250 = T251;
  assign T251 = io_chanxy_in[6'h2e/* 46*/:6'h26/* 38*/];
  assign T252 = T253;
  assign T253 = T254;
  assign T254 = T258[T255];
  assign T255 = T256;
  assign T256 = T257;
  assign T257 = io_chanxy_config[5'h16/* 22*/:5'h16/* 22*/];
  assign T258 = T259;
  assign T259 = io_chanxy_in[6'h30/* 48*/:6'h2f/* 47*/];
  assign T260 = T261;
  assign T261 = T262;
  assign T262 = T266[T263];
  assign T263 = T264;
  assign T264 = T265;
  assign T265 = io_chanxy_config[5'h17/* 23*/:5'h17/* 23*/];
  assign T266 = T267;
  assign T267 = io_chanxy_in[6'h32/* 50*/:6'h31/* 49*/];
  assign T268 = T269;
  assign T269 = T270;
  assign T270 = T274[T271];
  assign T271 = T272;
  assign T272 = T273;
  assign T273 = io_chanxy_config[5'h18/* 24*/:5'h18/* 24*/];
  assign T274 = T275;
  assign T275 = io_chanxy_in[6'h34/* 52*/:6'h33/* 51*/];
  assign T276 = T277;
  assign T277 = T278;
  assign T278 = T282[T279];
  assign T279 = T280;
  assign T280 = T281;
  assign T281 = io_chanxy_config[5'h19/* 25*/:5'h19/* 25*/];
  assign T282 = T283;
  assign T283 = io_chanxy_in[6'h36/* 54*/:6'h35/* 53*/];
  assign T284 = T285;
  assign T285 = T286;
  assign T286 = T290[T287];
  assign T287 = T288;
  assign T288 = T289;
  assign T289 = io_chanxy_config[5'h1d/* 29*/:5'h1a/* 26*/];
  assign T290 = T291;
  assign T291 = io_chanxy_in[6'h3f/* 63*/:6'h37/* 55*/];
  assign T292 = T293;
  assign T293 = T294;
  assign T294 = T298[T295];
  assign T295 = T296;
  assign T296 = T297;
  assign T297 = io_chanxy_config[5'h1e/* 30*/:5'h1e/* 30*/];
  assign T298 = T299;
  assign T299 = io_chanxy_in[7'h41/* 65*/:7'h40/* 64*/];
  assign T300 = T301;
  assign T301 = T302;
  assign T302 = T306[T303];
  assign T303 = T304;
  assign T304 = T305;
  assign T305 = io_chanxy_config[5'h1f/* 31*/:5'h1f/* 31*/];
  assign T306 = T307;
  assign T307 = io_chanxy_in[7'h43/* 67*/:7'h42/* 66*/];
  assign T308 = T309;
  assign T309 = T310;
  assign T310 = T314[T311];
  assign T311 = T312;
  assign T312 = T313;
  assign T313 = io_chanxy_config[6'h20/* 32*/:6'h20/* 32*/];
  assign T314 = T315;
  assign T315 = io_chanxy_in[7'h45/* 69*/:7'h44/* 68*/];
  assign T316 = T317;
  assign T317 = T318;
  assign T318 = T322[T319];
  assign T319 = T320;
  assign T320 = T321;
  assign T321 = io_chanxy_config[6'h21/* 33*/:6'h21/* 33*/];
  assign T322 = T323;
  assign T323 = io_chanxy_in[7'h47/* 71*/:7'h46/* 70*/];
  assign T324 = T325;
  assign T325 = T326;
  assign T326 = T330[T327];
  assign T327 = T328;
  assign T328 = T329;
  assign T329 = io_chanxy_config[6'h25/* 37*/:6'h22/* 34*/];
  assign T330 = T331;
  assign T331 = io_chanxy_in[7'h50/* 80*/:7'h48/* 72*/];
  assign T332 = T333;
  assign T333 = T334;
  assign T334 = T338[T335];
  assign T335 = T336;
  assign T336 = T337;
  assign T337 = io_chanxy_config[6'h26/* 38*/:6'h26/* 38*/];
  assign T338 = T339;
  assign T339 = io_chanxy_in[7'h52/* 82*/:7'h51/* 81*/];
  assign T340 = T341;
  assign T341 = T342;
  assign T342 = T346[T343];
  assign T343 = T344;
  assign T344 = T345;
  assign T345 = io_chanxy_config[6'h27/* 39*/:6'h27/* 39*/];
  assign T346 = T347;
  assign T347 = io_chanxy_in[7'h54/* 84*/:7'h53/* 83*/];
  assign T348 = T349;
  assign T349 = T350;
  assign T350 = T354[T351];
  assign T351 = T352;
  assign T352 = T353;
  assign T353 = io_chanxy_config[6'h28/* 40*/:6'h28/* 40*/];
  assign T354 = T355;
  assign T355 = io_chanxy_in[7'h56/* 86*/:7'h55/* 85*/];
  assign T356 = T357;
  assign T357 = T358;
  assign T358 = T362[T359];
  assign T359 = T360;
  assign T360 = T361;
  assign T361 = io_chanxy_config[6'h29/* 41*/:6'h29/* 41*/];
  assign T362 = T363;
  assign T363 = io_chanxy_in[7'h58/* 88*/:7'h57/* 87*/];
  assign T364 = T365;
  assign T365 = T366;
  assign T366 = T370[T367];
  assign T367 = T368;
  assign T368 = T369;
  assign T369 = io_chanxy_config[6'h2d/* 45*/:6'h2a/* 42*/];
  assign T370 = T371;
  assign T371 = io_chanxy_in[7'h61/* 97*/:7'h59/* 89*/];
  assign T372 = T373;
  assign T373 = T374;
  assign T374 = T378[T375];
  assign T375 = T376;
  assign T376 = T377;
  assign T377 = io_chanxy_config[6'h2e/* 46*/:6'h2e/* 46*/];
  assign T378 = T379;
  assign T379 = io_chanxy_in[7'h63/* 99*/:7'h62/* 98*/];
  assign T380 = T381;
  assign T381 = T382;
  assign T382 = T386[T383];
  assign T383 = T384;
  assign T384 = T385;
  assign T385 = io_chanxy_config[6'h2f/* 47*/:6'h2f/* 47*/];
  assign T386 = T387;
  assign T387 = io_chanxy_in[7'h65/* 101*/:7'h64/* 100*/];
  assign T388 = T389;
  assign T389 = T390;
  assign T390 = T394[T391];
  assign T391 = T392;
  assign T392 = T393;
  assign T393 = io_chanxy_config[6'h30/* 48*/:6'h30/* 48*/];
  assign T394 = T395;
  assign T395 = io_chanxy_in[7'h67/* 103*/:7'h66/* 102*/];
  assign T396 = T397;
  assign T397 = T398;
  assign T398 = T402[T399];
  assign T399 = T400;
  assign T400 = T401;
  assign T401 = io_chanxy_config[6'h31/* 49*/:6'h31/* 49*/];
  assign T402 = T403;
  assign T403 = io_chanxy_in[7'h69/* 105*/:7'h68/* 104*/];
  assign T404 = T405;
  assign T405 = T406;
  assign T406 = T410[T407];
  assign T407 = T408;
  assign T408 = T409;
  assign T409 = io_chanxy_config[6'h35/* 53*/:6'h32/* 50*/];
  assign T410 = T411;
  assign T411 = io_chanxy_in[7'h72/* 114*/:7'h6a/* 106*/];
  assign T412 = T413;
  assign T413 = T414;
  assign T414 = T418[T415];
  assign T415 = T416;
  assign T416 = T417;
  assign T417 = io_chanxy_config[6'h36/* 54*/:6'h36/* 54*/];
  assign T418 = T419;
  assign T419 = io_chanxy_in[7'h74/* 116*/:7'h73/* 115*/];
  assign T420 = T421;
  assign T421 = T422;
  assign T422 = T426[T423];
  assign T423 = T424;
  assign T424 = T425;
  assign T425 = io_chanxy_config[6'h37/* 55*/:6'h37/* 55*/];
  assign T426 = T427;
  assign T427 = io_chanxy_in[7'h76/* 118*/:7'h75/* 117*/];
  assign T428 = T429;
  assign T429 = T430;
  assign T430 = T434[T431];
  assign T431 = T432;
  assign T432 = T433;
  assign T433 = io_chanxy_config[6'h38/* 56*/:6'h38/* 56*/];
  assign T434 = T435;
  assign T435 = io_chanxy_in[7'h78/* 120*/:7'h77/* 119*/];
  assign T436 = T437;
  assign T437 = T438;
  assign T438 = T442[T439];
  assign T439 = T440;
  assign T440 = T441;
  assign T441 = io_chanxy_config[6'h39/* 57*/:6'h39/* 57*/];
  assign T442 = T443;
  assign T443 = io_chanxy_in[7'h7a/* 122*/:7'h79/* 121*/];
  assign T444 = T445;
  assign T445 = T446;
  assign T446 = T450[T447];
  assign T447 = T448;
  assign T448 = T449;
  assign T449 = io_chanxy_config[6'h3d/* 61*/:6'h3a/* 58*/];
  assign T450 = T451;
  assign T451 = io_chanxy_in[8'h83/* 131*/:7'h7b/* 123*/];
  assign T452 = T453;
  assign T453 = T454;
  assign T454 = T458[T455];
  assign T455 = T456;
  assign T456 = T457;
  assign T457 = io_chanxy_config[6'h3e/* 62*/:6'h3e/* 62*/];
  assign T458 = T459;
  assign T459 = io_chanxy_in[8'h85/* 133*/:8'h84/* 132*/];
  assign T460 = T461;
  assign T461 = T462;
  assign T462 = T466[T463];
  assign T463 = T464;
  assign T464 = T465;
  assign T465 = io_chanxy_config[6'h3f/* 63*/:6'h3f/* 63*/];
  assign T466 = T467;
  assign T467 = io_chanxy_in[8'h87/* 135*/:8'h86/* 134*/];
  assign T468 = T469;
  assign T469 = T470;
  assign T470 = T474[T471];
  assign T471 = T472;
  assign T472 = T473;
  assign T473 = io_chanxy_config[7'h40/* 64*/:7'h40/* 64*/];
  assign T474 = T475;
  assign T475 = io_chanxy_in[8'h89/* 137*/:8'h88/* 136*/];
  assign T476 = T477;
  assign T477 = T478;
  assign T478 = T482[T479];
  assign T479 = T480;
  assign T480 = T481;
  assign T481 = io_chanxy_config[7'h41/* 65*/:7'h41/* 65*/];
  assign T482 = T483;
  assign T483 = io_chanxy_in[8'h8b/* 139*/:8'h8a/* 138*/];
  assign T484 = T485;
  assign T485 = T486;
  assign T486 = T490[T487];
  assign T487 = T488;
  assign T488 = T489;
  assign T489 = io_chanxy_config[7'h45/* 69*/:7'h42/* 66*/];
  assign T490 = T491;
  assign T491 = io_chanxy_in[8'h94/* 148*/:8'h8c/* 140*/];
  assign T492 = T493;
  assign T493 = T494;
  assign T494 = T498[T495];
  assign T495 = T496;
  assign T496 = T497;
  assign T497 = io_chanxy_config[7'h46/* 70*/:7'h46/* 70*/];
  assign T498 = T499;
  assign T499 = io_chanxy_in[8'h96/* 150*/:8'h95/* 149*/];
  assign T500 = T501;
  assign T501 = T502;
  assign T502 = T506[T503];
  assign T503 = T504;
  assign T504 = T505;
  assign T505 = io_chanxy_config[7'h47/* 71*/:7'h47/* 71*/];
  assign T506 = T507;
  assign T507 = io_chanxy_in[8'h98/* 152*/:8'h97/* 151*/];
  assign T508 = T509;
  assign T509 = T510;
  assign T510 = T514[T511];
  assign T511 = T512;
  assign T512 = T513;
  assign T513 = io_chanxy_config[7'h48/* 72*/:7'h48/* 72*/];
  assign T514 = T515;
  assign T515 = io_chanxy_in[8'h9a/* 154*/:8'h99/* 153*/];
  assign T516 = T517;
  assign T517 = T518;
  assign T518 = T522[T519];
  assign T519 = T520;
  assign T520 = T521;
  assign T521 = io_chanxy_config[7'h49/* 73*/:7'h49/* 73*/];
  assign T522 = T523;
  assign T523 = io_chanxy_in[8'h9c/* 156*/:8'h9b/* 155*/];
  assign T524 = T525;
  assign T525 = T526;
  assign T526 = T530[T527];
  assign T527 = T528;
  assign T528 = T529;
  assign T529 = io_chanxy_config[7'h4d/* 77*/:7'h4a/* 74*/];
  assign T530 = T531;
  assign T531 = io_chanxy_in[8'ha5/* 165*/:8'h9d/* 157*/];
  assign T532 = T533;
  assign T533 = T534;
  assign T534 = T538[T535];
  assign T535 = T536;
  assign T536 = T537;
  assign T537 = io_chanxy_config[7'h4e/* 78*/:7'h4e/* 78*/];
  assign T538 = T539;
  assign T539 = io_chanxy_in[8'ha7/* 167*/:8'ha6/* 166*/];
  assign T540 = T541;
  assign T541 = T542;
  assign T542 = T546[T543];
  assign T543 = T544;
  assign T544 = T545;
  assign T545 = io_chanxy_config[7'h4f/* 79*/:7'h4f/* 79*/];
  assign T546 = T547;
  assign T547 = io_chanxy_in[8'ha9/* 169*/:8'ha8/* 168*/];
  assign T548 = T549;
  assign T549 = T550;
  assign T550 = T554[T551];
  assign T551 = T552;
  assign T552 = T553;
  assign T553 = io_chanxy_config[7'h50/* 80*/:7'h50/* 80*/];
  assign T554 = T555;
  assign T555 = io_chanxy_in[8'hab/* 171*/:8'haa/* 170*/];
  assign T556 = T557;
  assign T557 = T558;
  assign T558 = T562[T559];
  assign T559 = T560;
  assign T560 = T561;
  assign T561 = io_chanxy_config[7'h51/* 81*/:7'h51/* 81*/];
  assign T562 = T563;
  assign T563 = io_chanxy_in[8'had/* 173*/:8'hac/* 172*/];
  assign T564 = T565;
  assign T565 = T566;
  assign T566 = T570[T567];
  assign T567 = T568;
  assign T568 = T569;
  assign T569 = io_chanxy_config[7'h55/* 85*/:7'h52/* 82*/];
  assign T570 = T571;
  assign T571 = io_chanxy_in[8'hb6/* 182*/:8'hae/* 174*/];
  assign T572 = T573;
  assign T573 = T574;
  assign T574 = T578[T575];
  assign T575 = T576;
  assign T576 = T577;
  assign T577 = io_chanxy_config[7'h56/* 86*/:7'h56/* 86*/];
  assign T578 = T579;
  assign T579 = io_chanxy_in[8'hb8/* 184*/:8'hb7/* 183*/];
  assign T580 = T581;
  assign T581 = T582;
  assign T582 = T586[T583];
  assign T583 = T584;
  assign T584 = T585;
  assign T585 = io_chanxy_config[7'h57/* 87*/:7'h57/* 87*/];
  assign T586 = T587;
  assign T587 = io_chanxy_in[8'hba/* 186*/:8'hb9/* 185*/];
  assign T588 = T589;
  assign T589 = T590;
  assign T590 = T594[T591];
  assign T591 = T592;
  assign T592 = T593;
  assign T593 = io_chanxy_config[7'h58/* 88*/:7'h58/* 88*/];
  assign T594 = T595;
  assign T595 = io_chanxy_in[8'hbc/* 188*/:8'hbb/* 187*/];
  assign T596 = T597;
  assign T597 = T598;
  assign T598 = T602[T599];
  assign T599 = T600;
  assign T600 = T601;
  assign T601 = io_chanxy_config[7'h59/* 89*/:7'h59/* 89*/];
  assign T602 = T603;
  assign T603 = io_chanxy_in[8'hbe/* 190*/:8'hbd/* 189*/];
  assign T604 = T605;
  assign T605 = T606;
  assign T606 = T610[T607];
  assign T607 = T608;
  assign T608 = T609;
  assign T609 = io_chanxy_config[7'h5d/* 93*/:7'h5a/* 90*/];
  assign T610 = T611;
  assign T611 = io_chanxy_in[8'hc7/* 199*/:8'hbf/* 191*/];
  assign T612 = T613;
  assign T613 = T614;
  assign T614 = T618[T615];
  assign T615 = T616;
  assign T616 = T617;
  assign T617 = io_chanxy_config[7'h5e/* 94*/:7'h5e/* 94*/];
  assign T618 = T619;
  assign T619 = io_chanxy_in[8'hc9/* 201*/:8'hc8/* 200*/];
  assign T620 = T621;
  assign T621 = T622;
  assign T622 = T626[T623];
  assign T623 = T624;
  assign T624 = T625;
  assign T625 = io_chanxy_config[7'h5f/* 95*/:7'h5f/* 95*/];
  assign T626 = T627;
  assign T627 = io_chanxy_in[8'hcb/* 203*/:8'hca/* 202*/];
  assign T628 = T629;
  assign T629 = T630;
  assign T630 = T634[T631];
  assign T631 = T632;
  assign T632 = T633;
  assign T633 = io_chanxy_config[7'h60/* 96*/:7'h60/* 96*/];
  assign T634 = T635;
  assign T635 = io_chanxy_in[8'hcd/* 205*/:8'hcc/* 204*/];
  assign T636 = T637;
  assign T637 = T638;
  assign T638 = T642[T639];
  assign T639 = T640;
  assign T640 = T641;
  assign T641 = io_chanxy_config[7'h61/* 97*/:7'h61/* 97*/];
  assign T642 = T643;
  assign T643 = io_chanxy_in[8'hcf/* 207*/:8'hce/* 206*/];
  assign T644 = T645;
  assign T645 = T646;
  assign T646 = T650[T647];
  assign T647 = T648;
  assign T648 = T649;
  assign T649 = io_chanxy_config[7'h65/* 101*/:7'h62/* 98*/];
  assign T650 = T651;
  assign T651 = io_chanxy_in[8'hd8/* 216*/:8'hd0/* 208*/];
  assign T652 = T653;
  assign T653 = T654;
  assign T654 = T658[T655];
  assign T655 = T656;
  assign T656 = T657;
  assign T657 = io_chanxy_config[7'h66/* 102*/:7'h66/* 102*/];
  assign T658 = T659;
  assign T659 = io_chanxy_in[8'hda/* 218*/:8'hd9/* 217*/];
  assign T660 = T661;
  assign T661 = T662;
  assign T662 = T666[T663];
  assign T663 = T664;
  assign T664 = T665;
  assign T665 = io_chanxy_config[7'h67/* 103*/:7'h67/* 103*/];
  assign T666 = T667;
  assign T667 = io_chanxy_in[8'hdc/* 220*/:8'hdb/* 219*/];
  assign T668 = T669;
  assign T669 = T670;
  assign T670 = T674[T671];
  assign T671 = T672;
  assign T672 = T673;
  assign T673 = io_chanxy_config[7'h68/* 104*/:7'h68/* 104*/];
  assign T674 = T675;
  assign T675 = io_chanxy_in[8'hde/* 222*/:8'hdd/* 221*/];
  assign T676 = T677;
  assign T677 = T678;
  assign T678 = T682[T679];
  assign T679 = T680;
  assign T680 = T681;
  assign T681 = io_chanxy_config[7'h69/* 105*/:7'h69/* 105*/];
  assign T682 = T683;
  assign T683 = io_chanxy_in[8'he0/* 224*/:8'hdf/* 223*/];
  assign T684 = T685;
  assign T685 = T686;
  assign T686 = T690[T687];
  assign T687 = T688;
  assign T688 = T689;
  assign T689 = io_chanxy_config[7'h6d/* 109*/:7'h6a/* 106*/];
  assign T690 = T691;
  assign T691 = io_chanxy_in[8'he9/* 233*/:8'he1/* 225*/];
  assign T692 = T693;
  assign T693 = T694;
  assign T694 = T698[T695];
  assign T695 = T696;
  assign T696 = T697;
  assign T697 = io_chanxy_config[7'h6e/* 110*/:7'h6e/* 110*/];
  assign T698 = T699;
  assign T699 = io_chanxy_in[8'heb/* 235*/:8'hea/* 234*/];
  assign T700 = T701;
  assign T701 = T702;
  assign T702 = T706[T703];
  assign T703 = T704;
  assign T704 = T705;
  assign T705 = io_chanxy_config[7'h6f/* 111*/:7'h6f/* 111*/];
  assign T706 = T707;
  assign T707 = io_chanxy_in[8'hed/* 237*/:8'hec/* 236*/];
  assign T708 = T709;
  assign T709 = T710;
  assign T710 = T714[T711];
  assign T711 = T712;
  assign T712 = T713;
  assign T713 = io_chanxy_config[7'h70/* 112*/:7'h70/* 112*/];
  assign T714 = T715;
  assign T715 = io_chanxy_in[8'hef/* 239*/:8'hee/* 238*/];
  assign T716 = T717;
  assign T717 = T718;
  assign T718 = T722[T719];
  assign T719 = T720;
  assign T720 = T721;
  assign T721 = io_chanxy_config[7'h71/* 113*/:7'h71/* 113*/];
  assign T722 = T723;
  assign T723 = io_chanxy_in[8'hf1/* 241*/:8'hf0/* 240*/];
  assign T724 = T725;
  assign T725 = T726;
  assign T726 = T730[T727];
  assign T727 = T728;
  assign T728 = T729;
  assign T729 = io_chanxy_config[7'h75/* 117*/:7'h72/* 114*/];
  assign T730 = T731;
  assign T731 = io_chanxy_in[8'hfa/* 250*/:8'hf2/* 242*/];
  assign T732 = T733;
  assign T733 = T734;
  assign T734 = T738[T735];
  assign T735 = T736;
  assign T736 = T737;
  assign T737 = io_chanxy_config[7'h76/* 118*/:7'h76/* 118*/];
  assign T738 = T739;
  assign T739 = io_chanxy_in[8'hfc/* 252*/:8'hfb/* 251*/];
  assign T740 = T741;
  assign T741 = T742;
  assign T742 = T746[T743];
  assign T743 = T744;
  assign T744 = T745;
  assign T745 = io_chanxy_config[7'h77/* 119*/:7'h77/* 119*/];
  assign T746 = T747;
  assign T747 = io_chanxy_in[8'hfe/* 254*/:8'hfd/* 253*/];
  assign io_ipin_out = T748;
  assign T748 = T749;
  assign T749 = {T825, T750};
  assign T750 = T751;
  assign T751 = {T816, T752};
  assign T752 = T753;
  assign T753 = {T807, T754};
  assign T754 = T755;
  assign T755 = {T798, T756};
  assign T756 = T757;
  assign T757 = {T789, T758};
  assign T758 = T759;
  assign T759 = {T780, T760};
  assign T760 = T761;
  assign T761 = {T771, T762};
  assign T762 = T763;
  assign T763 = T764;
  assign T764 = T769[T765];
  assign T765 = T766;
  assign T766 = T767;
  assign T767 = {8'h0/* 0*/, T768};
  assign T768 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T769 = T770;
  assign T770 = io_ipin_in[4'hb/* 11*/:1'h0/* 0*/];
  assign T771 = T772;
  assign T772 = T773;
  assign T773 = T778[T774];
  assign T774 = T775;
  assign T775 = T776;
  assign T776 = {8'h0/* 0*/, T777};
  assign T777 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T778 = T779;
  assign T779 = io_ipin_in[5'h17/* 23*/:4'hc/* 12*/];
  assign T780 = T781;
  assign T781 = T782;
  assign T782 = T787[T783];
  assign T783 = T784;
  assign T784 = T785;
  assign T785 = {8'h0/* 0*/, T786};
  assign T786 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T787 = T788;
  assign T788 = io_ipin_in[6'h23/* 35*/:5'h18/* 24*/];
  assign T789 = T790;
  assign T790 = T791;
  assign T791 = T796[T792];
  assign T792 = T793;
  assign T793 = T794;
  assign T794 = {8'h0/* 0*/, T795};
  assign T795 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T796 = T797;
  assign T797 = io_ipin_in[6'h2f/* 47*/:6'h24/* 36*/];
  assign T798 = T799;
  assign T799 = T800;
  assign T800 = T805[T801];
  assign T801 = T802;
  assign T802 = T803;
  assign T803 = {8'h0/* 0*/, T804};
  assign T804 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T805 = T806;
  assign T806 = io_ipin_in[6'h3b/* 59*/:6'h30/* 48*/];
  assign T807 = T808;
  assign T808 = T809;
  assign T809 = T814[T810];
  assign T810 = T811;
  assign T811 = T812;
  assign T812 = {8'h0/* 0*/, T813};
  assign T813 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T814 = T815;
  assign T815 = io_ipin_in[7'h47/* 71*/:6'h3c/* 60*/];
  assign T816 = T817;
  assign T817 = T818;
  assign T818 = T823[T819];
  assign T819 = T820;
  assign T820 = T821;
  assign T821 = {8'h0/* 0*/, T822};
  assign T822 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T823 = T824;
  assign T824 = io_ipin_in[7'h53/* 83*/:7'h48/* 72*/];
  assign T825 = T826;
  assign T826 = T827;
  assign T827 = T832[T828];
  assign T828 = T829;
  assign T829 = T830;
  assign T830 = {8'h0/* 0*/, T831};
  assign T831 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T832 = T833;
  assign T833 = io_ipin_in[7'h5f/* 95*/:7'h54/* 84*/];
endmodule


module io_tile_sp_0(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [254:0] io_chanxy_in,
    output[74:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[74:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_wc_1(
    input [95:0] io_ipin_in,
    input [31:0] io_ipin_config,
    input [269:0] io_chanxy_in,
    input [119:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[29:0] io_chanxy_out);

  wire[29:0] T0;
  wire[29:0] T1;
  wire[28:0] T2;
  wire[28:0] T3;
  wire[27:0] T4;
  wire[27:0] T5;
  wire[26:0] T6;
  wire[26:0] T7;
  wire[25:0] T8;
  wire[25:0] T9;
  wire[24:0] T10;
  wire[24:0] T11;
  wire[23:0] T12;
  wire[23:0] T13;
  wire[22:0] T14;
  wire[22:0] T15;
  wire[21:0] T16;
  wire[21:0] T17;
  wire[20:0] T18;
  wire[20:0] T19;
  wire[19:0] T20;
  wire[19:0] T21;
  wire[18:0] T22;
  wire[18:0] T23;
  wire[17:0] T24;
  wire[17:0] T25;
  wire[16:0] T26;
  wire[16:0] T27;
  wire[15:0] T28;
  wire[15:0] T29;
  wire[14:0] T30;
  wire[14:0] T31;
  wire[13:0] T32;
  wire[13:0] T33;
  wire[12:0] T34;
  wire[12:0] T35;
  wire[11:0] T36;
  wire[11:0] T37;
  wire[10:0] T38;
  wire[10:0] T39;
  wire[9:0] T40;
  wire[9:0] T41;
  wire[8:0] T42;
  wire[8:0] T43;
  wire[7:0] T44;
  wire[7:0] T45;
  wire[6:0] T46;
  wire[6:0] T47;
  wire[5:0] T48;
  wire[5:0] T49;
  wire[4:0] T50;
  wire[4:0] T51;
  wire[3:0] T52;
  wire[3:0] T53;
  wire[2:0] T54;
  wire[2:0] T55;
  wire[1:0] T56;
  wire[1:0] T57;
  wire T58;
  wire T59;
  wire T60;
  wire[3:0] T61;
  wire[3:0] T62;
  wire[3:0] T63;
  wire[8:0] T64;
  wire[8:0] T65;
  wire T66;
  wire T67;
  wire T68;
  wire[3:0] T69;
  wire[3:0] T70;
  wire[3:0] T71;
  wire[8:0] T72;
  wire[8:0] T73;
  wire T74;
  wire T75;
  wire T76;
  wire[3:0] T77;
  wire[3:0] T78;
  wire[3:0] T79;
  wire[8:0] T80;
  wire[8:0] T81;
  wire T82;
  wire T83;
  wire T84;
  wire[3:0] T85;
  wire[3:0] T86;
  wire[3:0] T87;
  wire[8:0] T88;
  wire[8:0] T89;
  wire T90;
  wire T91;
  wire T92;
  wire[3:0] T93;
  wire[3:0] T94;
  wire[3:0] T95;
  wire[8:0] T96;
  wire[8:0] T97;
  wire T98;
  wire T99;
  wire T100;
  wire[3:0] T101;
  wire[3:0] T102;
  wire[3:0] T103;
  wire[8:0] T104;
  wire[8:0] T105;
  wire T106;
  wire T107;
  wire T108;
  wire[3:0] T109;
  wire[3:0] T110;
  wire[3:0] T111;
  wire[8:0] T112;
  wire[8:0] T113;
  wire T114;
  wire T115;
  wire T116;
  wire[3:0] T117;
  wire[3:0] T118;
  wire[3:0] T119;
  wire[8:0] T120;
  wire[8:0] T121;
  wire T122;
  wire T123;
  wire T124;
  wire[3:0] T125;
  wire[3:0] T126;
  wire[3:0] T127;
  wire[8:0] T128;
  wire[8:0] T129;
  wire T130;
  wire T131;
  wire T132;
  wire[3:0] T133;
  wire[3:0] T134;
  wire[3:0] T135;
  wire[8:0] T136;
  wire[8:0] T137;
  wire T138;
  wire T139;
  wire T140;
  wire[3:0] T141;
  wire[3:0] T142;
  wire[3:0] T143;
  wire[8:0] T144;
  wire[8:0] T145;
  wire T146;
  wire T147;
  wire T148;
  wire[3:0] T149;
  wire[3:0] T150;
  wire[3:0] T151;
  wire[8:0] T152;
  wire[8:0] T153;
  wire T154;
  wire T155;
  wire T156;
  wire[3:0] T157;
  wire[3:0] T158;
  wire[3:0] T159;
  wire[8:0] T160;
  wire[8:0] T161;
  wire T162;
  wire T163;
  wire T164;
  wire[3:0] T165;
  wire[3:0] T166;
  wire[3:0] T167;
  wire[8:0] T168;
  wire[8:0] T169;
  wire T170;
  wire T171;
  wire T172;
  wire[3:0] T173;
  wire[3:0] T174;
  wire[3:0] T175;
  wire[8:0] T176;
  wire[8:0] T177;
  wire T178;
  wire T179;
  wire T180;
  wire[3:0] T181;
  wire[3:0] T182;
  wire[3:0] T183;
  wire[8:0] T184;
  wire[8:0] T185;
  wire T186;
  wire T187;
  wire T188;
  wire[3:0] T189;
  wire[3:0] T190;
  wire[3:0] T191;
  wire[8:0] T192;
  wire[8:0] T193;
  wire T194;
  wire T195;
  wire T196;
  wire[3:0] T197;
  wire[3:0] T198;
  wire[3:0] T199;
  wire[8:0] T200;
  wire[8:0] T201;
  wire T202;
  wire T203;
  wire T204;
  wire[3:0] T205;
  wire[3:0] T206;
  wire[3:0] T207;
  wire[8:0] T208;
  wire[8:0] T209;
  wire T210;
  wire T211;
  wire T212;
  wire[3:0] T213;
  wire[3:0] T214;
  wire[3:0] T215;
  wire[8:0] T216;
  wire[8:0] T217;
  wire T218;
  wire T219;
  wire T220;
  wire[3:0] T221;
  wire[3:0] T222;
  wire[3:0] T223;
  wire[8:0] T224;
  wire[8:0] T225;
  wire T226;
  wire T227;
  wire T228;
  wire[3:0] T229;
  wire[3:0] T230;
  wire[3:0] T231;
  wire[8:0] T232;
  wire[8:0] T233;
  wire T234;
  wire T235;
  wire T236;
  wire[3:0] T237;
  wire[3:0] T238;
  wire[3:0] T239;
  wire[8:0] T240;
  wire[8:0] T241;
  wire T242;
  wire T243;
  wire T244;
  wire[3:0] T245;
  wire[3:0] T246;
  wire[3:0] T247;
  wire[8:0] T248;
  wire[8:0] T249;
  wire T250;
  wire T251;
  wire T252;
  wire[3:0] T253;
  wire[3:0] T254;
  wire[3:0] T255;
  wire[8:0] T256;
  wire[8:0] T257;
  wire T258;
  wire T259;
  wire T260;
  wire[3:0] T261;
  wire[3:0] T262;
  wire[3:0] T263;
  wire[8:0] T264;
  wire[8:0] T265;
  wire T266;
  wire T267;
  wire T268;
  wire[3:0] T269;
  wire[3:0] T270;
  wire[3:0] T271;
  wire[8:0] T272;
  wire[8:0] T273;
  wire T274;
  wire T275;
  wire T276;
  wire[3:0] T277;
  wire[3:0] T278;
  wire[3:0] T279;
  wire[8:0] T280;
  wire[8:0] T281;
  wire T282;
  wire T283;
  wire T284;
  wire[3:0] T285;
  wire[3:0] T286;
  wire[3:0] T287;
  wire[8:0] T288;
  wire[8:0] T289;
  wire T290;
  wire T291;
  wire T292;
  wire[3:0] T293;
  wire[3:0] T294;
  wire[3:0] T295;
  wire[8:0] T296;
  wire[8:0] T297;
  wire[7:0] T298;
  wire[7:0] T299;
  wire[6:0] T300;
  wire[6:0] T301;
  wire[5:0] T302;
  wire[5:0] T303;
  wire[4:0] T304;
  wire[4:0] T305;
  wire[3:0] T306;
  wire[3:0] T307;
  wire[2:0] T308;
  wire[2:0] T309;
  wire[1:0] T310;
  wire[1:0] T311;
  wire T312;
  wire T313;
  wire T314;
  wire[11:0] T315;
  wire[11:0] T316;
  wire[11:0] T317;
  wire[3:0] T318;
  wire[11:0] T319;
  wire[11:0] T320;
  wire T321;
  wire T322;
  wire T323;
  wire[11:0] T324;
  wire[11:0] T325;
  wire[11:0] T326;
  wire[3:0] T327;
  wire[11:0] T328;
  wire[11:0] T329;
  wire T330;
  wire T331;
  wire T332;
  wire[11:0] T333;
  wire[11:0] T334;
  wire[11:0] T335;
  wire[3:0] T336;
  wire[11:0] T337;
  wire[11:0] T338;
  wire T339;
  wire T340;
  wire T341;
  wire[11:0] T342;
  wire[11:0] T343;
  wire[11:0] T344;
  wire[3:0] T345;
  wire[11:0] T346;
  wire[11:0] T347;
  wire T348;
  wire T349;
  wire T350;
  wire[11:0] T351;
  wire[11:0] T352;
  wire[11:0] T353;
  wire[3:0] T354;
  wire[11:0] T355;
  wire[11:0] T356;
  wire T357;
  wire T358;
  wire T359;
  wire[11:0] T360;
  wire[11:0] T361;
  wire[11:0] T362;
  wire[3:0] T363;
  wire[11:0] T364;
  wire[11:0] T365;
  wire T366;
  wire T367;
  wire T368;
  wire[11:0] T369;
  wire[11:0] T370;
  wire[11:0] T371;
  wire[3:0] T372;
  wire[11:0] T373;
  wire[11:0] T374;
  wire T375;
  wire T376;
  wire T377;
  wire[11:0] T378;
  wire[11:0] T379;
  wire[11:0] T380;
  wire[3:0] T381;
  wire[11:0] T382;
  wire[11:0] T383;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T290, T2};
  assign T2 = T3;
  assign T3 = {T282, T4};
  assign T4 = T5;
  assign T5 = {T274, T6};
  assign T6 = T7;
  assign T7 = {T266, T8};
  assign T8 = T9;
  assign T9 = {T258, T10};
  assign T10 = T11;
  assign T11 = {T250, T12};
  assign T12 = T13;
  assign T13 = {T242, T14};
  assign T14 = T15;
  assign T15 = {T234, T16};
  assign T16 = T17;
  assign T17 = {T226, T18};
  assign T18 = T19;
  assign T19 = {T218, T20};
  assign T20 = T21;
  assign T21 = {T210, T22};
  assign T22 = T23;
  assign T23 = {T202, T24};
  assign T24 = T25;
  assign T25 = {T194, T26};
  assign T26 = T27;
  assign T27 = {T186, T28};
  assign T28 = T29;
  assign T29 = {T178, T30};
  assign T30 = T31;
  assign T31 = {T170, T32};
  assign T32 = T33;
  assign T33 = {T162, T34};
  assign T34 = T35;
  assign T35 = {T154, T36};
  assign T36 = T37;
  assign T37 = {T146, T38};
  assign T38 = T39;
  assign T39 = {T138, T40};
  assign T40 = T41;
  assign T41 = {T130, T42};
  assign T42 = T43;
  assign T43 = {T122, T44};
  assign T44 = T45;
  assign T45 = {T114, T46};
  assign T46 = T47;
  assign T47 = {T106, T48};
  assign T48 = T49;
  assign T49 = {T98, T50};
  assign T50 = T51;
  assign T51 = {T90, T52};
  assign T52 = T53;
  assign T53 = {T82, T54};
  assign T54 = T55;
  assign T55 = {T74, T56};
  assign T56 = T57;
  assign T57 = {T66, T58};
  assign T58 = T59;
  assign T59 = T60;
  assign T60 = T64[T61];
  assign T61 = T62;
  assign T62 = T63;
  assign T63 = io_chanxy_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T64 = T65;
  assign T65 = io_chanxy_in[4'h8/* 8*/:1'h0/* 0*/];
  assign T66 = T67;
  assign T67 = T68;
  assign T68 = T72[T69];
  assign T69 = T70;
  assign T70 = T71;
  assign T71 = io_chanxy_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T72 = T73;
  assign T73 = io_chanxy_in[5'h11/* 17*/:4'h9/* 9*/];
  assign T74 = T75;
  assign T75 = T76;
  assign T76 = T80[T77];
  assign T77 = T78;
  assign T78 = T79;
  assign T79 = io_chanxy_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T80 = T81;
  assign T81 = io_chanxy_in[5'h1a/* 26*/:5'h12/* 18*/];
  assign T82 = T83;
  assign T83 = T84;
  assign T84 = T88[T85];
  assign T85 = T86;
  assign T86 = T87;
  assign T87 = io_chanxy_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T88 = T89;
  assign T89 = io_chanxy_in[6'h23/* 35*/:5'h1b/* 27*/];
  assign T90 = T91;
  assign T91 = T92;
  assign T92 = T96[T93];
  assign T93 = T94;
  assign T94 = T95;
  assign T95 = io_chanxy_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T96 = T97;
  assign T97 = io_chanxy_in[6'h2c/* 44*/:6'h24/* 36*/];
  assign T98 = T99;
  assign T99 = T100;
  assign T100 = T104[T101];
  assign T101 = T102;
  assign T102 = T103;
  assign T103 = io_chanxy_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T104 = T105;
  assign T105 = io_chanxy_in[6'h35/* 53*/:6'h2d/* 45*/];
  assign T106 = T107;
  assign T107 = T108;
  assign T108 = T112[T109];
  assign T109 = T110;
  assign T110 = T111;
  assign T111 = io_chanxy_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T112 = T113;
  assign T113 = io_chanxy_in[6'h3e/* 62*/:6'h36/* 54*/];
  assign T114 = T115;
  assign T115 = T116;
  assign T116 = T120[T117];
  assign T117 = T118;
  assign T118 = T119;
  assign T119 = io_chanxy_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T120 = T121;
  assign T121 = io_chanxy_in[7'h47/* 71*/:6'h3f/* 63*/];
  assign T122 = T123;
  assign T123 = T124;
  assign T124 = T128[T125];
  assign T125 = T126;
  assign T126 = T127;
  assign T127 = io_chanxy_config[6'h23/* 35*/:6'h20/* 32*/];
  assign T128 = T129;
  assign T129 = io_chanxy_in[7'h50/* 80*/:7'h48/* 72*/];
  assign T130 = T131;
  assign T131 = T132;
  assign T132 = T136[T133];
  assign T133 = T134;
  assign T134 = T135;
  assign T135 = io_chanxy_config[6'h27/* 39*/:6'h24/* 36*/];
  assign T136 = T137;
  assign T137 = io_chanxy_in[7'h59/* 89*/:7'h51/* 81*/];
  assign T138 = T139;
  assign T139 = T140;
  assign T140 = T144[T141];
  assign T141 = T142;
  assign T142 = T143;
  assign T143 = io_chanxy_config[6'h2b/* 43*/:6'h28/* 40*/];
  assign T144 = T145;
  assign T145 = io_chanxy_in[7'h62/* 98*/:7'h5a/* 90*/];
  assign T146 = T147;
  assign T147 = T148;
  assign T148 = T152[T149];
  assign T149 = T150;
  assign T150 = T151;
  assign T151 = io_chanxy_config[6'h2f/* 47*/:6'h2c/* 44*/];
  assign T152 = T153;
  assign T153 = io_chanxy_in[7'h6b/* 107*/:7'h63/* 99*/];
  assign T154 = T155;
  assign T155 = T156;
  assign T156 = T160[T157];
  assign T157 = T158;
  assign T158 = T159;
  assign T159 = io_chanxy_config[6'h33/* 51*/:6'h30/* 48*/];
  assign T160 = T161;
  assign T161 = io_chanxy_in[7'h74/* 116*/:7'h6c/* 108*/];
  assign T162 = T163;
  assign T163 = T164;
  assign T164 = T168[T165];
  assign T165 = T166;
  assign T166 = T167;
  assign T167 = io_chanxy_config[6'h37/* 55*/:6'h34/* 52*/];
  assign T168 = T169;
  assign T169 = io_chanxy_in[7'h7d/* 125*/:7'h75/* 117*/];
  assign T170 = T171;
  assign T171 = T172;
  assign T172 = T176[T173];
  assign T173 = T174;
  assign T174 = T175;
  assign T175 = io_chanxy_config[6'h3b/* 59*/:6'h38/* 56*/];
  assign T176 = T177;
  assign T177 = io_chanxy_in[8'h86/* 134*/:7'h7e/* 126*/];
  assign T178 = T179;
  assign T179 = T180;
  assign T180 = T184[T181];
  assign T181 = T182;
  assign T182 = T183;
  assign T183 = io_chanxy_config[6'h3f/* 63*/:6'h3c/* 60*/];
  assign T184 = T185;
  assign T185 = io_chanxy_in[8'h8f/* 143*/:8'h87/* 135*/];
  assign T186 = T187;
  assign T187 = T188;
  assign T188 = T192[T189];
  assign T189 = T190;
  assign T190 = T191;
  assign T191 = io_chanxy_config[7'h43/* 67*/:7'h40/* 64*/];
  assign T192 = T193;
  assign T193 = io_chanxy_in[8'h98/* 152*/:8'h90/* 144*/];
  assign T194 = T195;
  assign T195 = T196;
  assign T196 = T200[T197];
  assign T197 = T198;
  assign T198 = T199;
  assign T199 = io_chanxy_config[7'h47/* 71*/:7'h44/* 68*/];
  assign T200 = T201;
  assign T201 = io_chanxy_in[8'ha1/* 161*/:8'h99/* 153*/];
  assign T202 = T203;
  assign T203 = T204;
  assign T204 = T208[T205];
  assign T205 = T206;
  assign T206 = T207;
  assign T207 = io_chanxy_config[7'h4b/* 75*/:7'h48/* 72*/];
  assign T208 = T209;
  assign T209 = io_chanxy_in[8'haa/* 170*/:8'ha2/* 162*/];
  assign T210 = T211;
  assign T211 = T212;
  assign T212 = T216[T213];
  assign T213 = T214;
  assign T214 = T215;
  assign T215 = io_chanxy_config[7'h4f/* 79*/:7'h4c/* 76*/];
  assign T216 = T217;
  assign T217 = io_chanxy_in[8'hb3/* 179*/:8'hab/* 171*/];
  assign T218 = T219;
  assign T219 = T220;
  assign T220 = T224[T221];
  assign T221 = T222;
  assign T222 = T223;
  assign T223 = io_chanxy_config[7'h53/* 83*/:7'h50/* 80*/];
  assign T224 = T225;
  assign T225 = io_chanxy_in[8'hbc/* 188*/:8'hb4/* 180*/];
  assign T226 = T227;
  assign T227 = T228;
  assign T228 = T232[T229];
  assign T229 = T230;
  assign T230 = T231;
  assign T231 = io_chanxy_config[7'h57/* 87*/:7'h54/* 84*/];
  assign T232 = T233;
  assign T233 = io_chanxy_in[8'hc5/* 197*/:8'hbd/* 189*/];
  assign T234 = T235;
  assign T235 = T236;
  assign T236 = T240[T237];
  assign T237 = T238;
  assign T238 = T239;
  assign T239 = io_chanxy_config[7'h5b/* 91*/:7'h58/* 88*/];
  assign T240 = T241;
  assign T241 = io_chanxy_in[8'hce/* 206*/:8'hc6/* 198*/];
  assign T242 = T243;
  assign T243 = T244;
  assign T244 = T248[T245];
  assign T245 = T246;
  assign T246 = T247;
  assign T247 = io_chanxy_config[7'h5f/* 95*/:7'h5c/* 92*/];
  assign T248 = T249;
  assign T249 = io_chanxy_in[8'hd7/* 215*/:8'hcf/* 207*/];
  assign T250 = T251;
  assign T251 = T252;
  assign T252 = T256[T253];
  assign T253 = T254;
  assign T254 = T255;
  assign T255 = io_chanxy_config[7'h63/* 99*/:7'h60/* 96*/];
  assign T256 = T257;
  assign T257 = io_chanxy_in[8'he0/* 224*/:8'hd8/* 216*/];
  assign T258 = T259;
  assign T259 = T260;
  assign T260 = T264[T261];
  assign T261 = T262;
  assign T262 = T263;
  assign T263 = io_chanxy_config[7'h67/* 103*/:7'h64/* 100*/];
  assign T264 = T265;
  assign T265 = io_chanxy_in[8'he9/* 233*/:8'he1/* 225*/];
  assign T266 = T267;
  assign T267 = T268;
  assign T268 = T272[T269];
  assign T269 = T270;
  assign T270 = T271;
  assign T271 = io_chanxy_config[7'h6b/* 107*/:7'h68/* 104*/];
  assign T272 = T273;
  assign T273 = io_chanxy_in[8'hf2/* 242*/:8'hea/* 234*/];
  assign T274 = T275;
  assign T275 = T276;
  assign T276 = T280[T277];
  assign T277 = T278;
  assign T278 = T279;
  assign T279 = io_chanxy_config[7'h6f/* 111*/:7'h6c/* 108*/];
  assign T280 = T281;
  assign T281 = io_chanxy_in[8'hfb/* 251*/:8'hf3/* 243*/];
  assign T282 = T283;
  assign T283 = T284;
  assign T284 = T288[T285];
  assign T285 = T286;
  assign T286 = T287;
  assign T287 = io_chanxy_config[7'h73/* 115*/:7'h70/* 112*/];
  assign T288 = T289;
  assign T289 = io_chanxy_in[9'h104/* 260*/:8'hfc/* 252*/];
  assign T290 = T291;
  assign T291 = T292;
  assign T292 = T296[T293];
  assign T293 = T294;
  assign T294 = T295;
  assign T295 = io_chanxy_config[7'h77/* 119*/:7'h74/* 116*/];
  assign T296 = T297;
  assign T297 = io_chanxy_in[9'h10d/* 269*/:9'h105/* 261*/];
  assign io_ipin_out = T298;
  assign T298 = T299;
  assign T299 = {T375, T300};
  assign T300 = T301;
  assign T301 = {T366, T302};
  assign T302 = T303;
  assign T303 = {T357, T304};
  assign T304 = T305;
  assign T305 = {T348, T306};
  assign T306 = T307;
  assign T307 = {T339, T308};
  assign T308 = T309;
  assign T309 = {T330, T310};
  assign T310 = T311;
  assign T311 = {T321, T312};
  assign T312 = T313;
  assign T313 = T314;
  assign T314 = T319[T315];
  assign T315 = T316;
  assign T316 = T317;
  assign T317 = {8'h0/* 0*/, T318};
  assign T318 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T319 = T320;
  assign T320 = io_ipin_in[4'hb/* 11*/:1'h0/* 0*/];
  assign T321 = T322;
  assign T322 = T323;
  assign T323 = T328[T324];
  assign T324 = T325;
  assign T325 = T326;
  assign T326 = {8'h0/* 0*/, T327};
  assign T327 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T328 = T329;
  assign T329 = io_ipin_in[5'h17/* 23*/:4'hc/* 12*/];
  assign T330 = T331;
  assign T331 = T332;
  assign T332 = T337[T333];
  assign T333 = T334;
  assign T334 = T335;
  assign T335 = {8'h0/* 0*/, T336};
  assign T336 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T337 = T338;
  assign T338 = io_ipin_in[6'h23/* 35*/:5'h18/* 24*/];
  assign T339 = T340;
  assign T340 = T341;
  assign T341 = T346[T342];
  assign T342 = T343;
  assign T343 = T344;
  assign T344 = {8'h0/* 0*/, T345};
  assign T345 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T346 = T347;
  assign T347 = io_ipin_in[6'h2f/* 47*/:6'h24/* 36*/];
  assign T348 = T349;
  assign T349 = T350;
  assign T350 = T355[T351];
  assign T351 = T352;
  assign T352 = T353;
  assign T353 = {8'h0/* 0*/, T354};
  assign T354 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T355 = T356;
  assign T356 = io_ipin_in[6'h3b/* 59*/:6'h30/* 48*/];
  assign T357 = T358;
  assign T358 = T359;
  assign T359 = T364[T360];
  assign T360 = T361;
  assign T361 = T362;
  assign T362 = {8'h0/* 0*/, T363};
  assign T363 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T364 = T365;
  assign T365 = io_ipin_in[7'h47/* 71*/:6'h3c/* 60*/];
  assign T366 = T367;
  assign T367 = T368;
  assign T368 = T373[T369];
  assign T369 = T370;
  assign T370 = T371;
  assign T371 = {8'h0/* 0*/, T372};
  assign T372 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T373 = T374;
  assign T374 = io_ipin_in[7'h53/* 83*/:7'h48/* 72*/];
  assign T375 = T376;
  assign T376 = T377;
  assign T377 = T382[T378];
  assign T378 = T379;
  assign T379 = T380;
  assign T380 = {8'h0/* 0*/, T381};
  assign T381 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T382 = T383;
  assign T383 = io_ipin_in[7'h5f/* 95*/:7'h54/* 84*/];
endmodule

module io_tile_sp_1(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_2(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_3(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_4(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_5(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_6(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_7(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h8/* 8*/};
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_8(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_wc_2(
    input [95:0] io_ipin_in,
    input [31:0] io_ipin_config,
    input [254:0] io_chanxy_in,
    input [119:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[74:0] io_chanxy_out);

  wire[74:0] T0;
  wire[74:0] T1;
  wire[73:0] T2;
  wire[73:0] T3;
  wire[72:0] T4;
  wire[72:0] T5;
  wire[71:0] T6;
  wire[71:0] T7;
  wire[70:0] T8;
  wire[70:0] T9;
  wire[69:0] T10;
  wire[69:0] T11;
  wire[68:0] T12;
  wire[68:0] T13;
  wire[67:0] T14;
  wire[67:0] T15;
  wire[66:0] T16;
  wire[66:0] T17;
  wire[65:0] T18;
  wire[65:0] T19;
  wire[64:0] T20;
  wire[64:0] T21;
  wire[63:0] T22;
  wire[63:0] T23;
  wire[62:0] T24;
  wire[62:0] T25;
  wire[61:0] T26;
  wire[61:0] T27;
  wire[60:0] T28;
  wire[60:0] T29;
  wire[59:0] T30;
  wire[59:0] T31;
  wire[58:0] T32;
  wire[58:0] T33;
  wire[57:0] T34;
  wire[57:0] T35;
  wire[56:0] T36;
  wire[56:0] T37;
  wire[55:0] T38;
  wire[55:0] T39;
  wire[54:0] T40;
  wire[54:0] T41;
  wire[53:0] T42;
  wire[53:0] T43;
  wire[52:0] T44;
  wire[52:0] T45;
  wire[51:0] T46;
  wire[51:0] T47;
  wire[50:0] T48;
  wire[50:0] T49;
  wire[49:0] T50;
  wire[49:0] T51;
  wire[48:0] T52;
  wire[48:0] T53;
  wire[47:0] T54;
  wire[47:0] T55;
  wire[46:0] T56;
  wire[46:0] T57;
  wire[45:0] T58;
  wire[45:0] T59;
  wire[44:0] T60;
  wire[44:0] T61;
  wire[43:0] T62;
  wire[43:0] T63;
  wire[42:0] T64;
  wire[42:0] T65;
  wire[41:0] T66;
  wire[41:0] T67;
  wire[40:0] T68;
  wire[40:0] T69;
  wire[39:0] T70;
  wire[39:0] T71;
  wire[38:0] T72;
  wire[38:0] T73;
  wire[37:0] T74;
  wire[37:0] T75;
  wire[36:0] T76;
  wire[36:0] T77;
  wire[35:0] T78;
  wire[35:0] T79;
  wire[34:0] T80;
  wire[34:0] T81;
  wire[33:0] T82;
  wire[33:0] T83;
  wire[32:0] T84;
  wire[32:0] T85;
  wire[31:0] T86;
  wire[31:0] T87;
  wire[30:0] T88;
  wire[30:0] T89;
  wire[29:0] T90;
  wire[29:0] T91;
  wire[28:0] T92;
  wire[28:0] T93;
  wire[27:0] T94;
  wire[27:0] T95;
  wire[26:0] T96;
  wire[26:0] T97;
  wire[25:0] T98;
  wire[25:0] T99;
  wire[24:0] T100;
  wire[24:0] T101;
  wire[23:0] T102;
  wire[23:0] T103;
  wire[22:0] T104;
  wire[22:0] T105;
  wire[21:0] T106;
  wire[21:0] T107;
  wire[20:0] T108;
  wire[20:0] T109;
  wire[19:0] T110;
  wire[19:0] T111;
  wire[18:0] T112;
  wire[18:0] T113;
  wire[17:0] T114;
  wire[17:0] T115;
  wire[16:0] T116;
  wire[16:0] T117;
  wire[15:0] T118;
  wire[15:0] T119;
  wire[14:0] T120;
  wire[14:0] T121;
  wire[13:0] T122;
  wire[13:0] T123;
  wire[12:0] T124;
  wire[12:0] T125;
  wire[11:0] T126;
  wire[11:0] T127;
  wire[10:0] T128;
  wire[10:0] T129;
  wire[9:0] T130;
  wire[9:0] T131;
  wire[8:0] T132;
  wire[8:0] T133;
  wire[7:0] T134;
  wire[7:0] T135;
  wire[6:0] T136;
  wire[6:0] T137;
  wire[5:0] T138;
  wire[5:0] T139;
  wire[4:0] T140;
  wire[4:0] T141;
  wire[3:0] T142;
  wire[3:0] T143;
  wire[2:0] T144;
  wire[2:0] T145;
  wire[1:0] T146;
  wire[1:0] T147;
  wire T148;
  wire T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire[1:0] T154;
  wire[1:0] T155;
  wire T156;
  wire T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire[1:0] T162;
  wire[1:0] T163;
  wire T164;
  wire T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  wire[1:0] T170;
  wire[1:0] T171;
  wire T172;
  wire T173;
  wire T174;
  wire T175;
  wire T176;
  wire T177;
  wire[1:0] T178;
  wire[1:0] T179;
  wire T180;
  wire T181;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire[1:0] T186;
  wire[1:0] T187;
  wire T188;
  wire T189;
  wire T190;
  wire T191;
  wire T192;
  wire T193;
  wire[1:0] T194;
  wire[1:0] T195;
  wire T196;
  wire T197;
  wire T198;
  wire T199;
  wire T200;
  wire T201;
  wire[1:0] T202;
  wire[1:0] T203;
  wire T204;
  wire T205;
  wire T206;
  wire T207;
  wire T208;
  wire T209;
  wire[1:0] T210;
  wire[1:0] T211;
  wire T212;
  wire T213;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire[1:0] T218;
  wire[1:0] T219;
  wire T220;
  wire T221;
  wire T222;
  wire T223;
  wire T224;
  wire T225;
  wire[1:0] T226;
  wire[1:0] T227;
  wire T228;
  wire T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire[1:0] T234;
  wire[1:0] T235;
  wire T236;
  wire T237;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire[1:0] T242;
  wire[1:0] T243;
  wire T244;
  wire T245;
  wire T246;
  wire T247;
  wire T248;
  wire T249;
  wire[1:0] T250;
  wire[1:0] T251;
  wire T252;
  wire T253;
  wire T254;
  wire T255;
  wire T256;
  wire T257;
  wire[1:0] T258;
  wire[1:0] T259;
  wire T260;
  wire T261;
  wire T262;
  wire T263;
  wire T264;
  wire T265;
  wire[1:0] T266;
  wire[1:0] T267;
  wire T268;
  wire T269;
  wire T270;
  wire T271;
  wire T272;
  wire T273;
  wire[1:0] T274;
  wire[1:0] T275;
  wire T276;
  wire T277;
  wire T278;
  wire T279;
  wire T280;
  wire T281;
  wire[1:0] T282;
  wire[1:0] T283;
  wire T284;
  wire T285;
  wire T286;
  wire T287;
  wire T288;
  wire T289;
  wire[1:0] T290;
  wire[1:0] T291;
  wire T292;
  wire T293;
  wire T294;
  wire T295;
  wire T296;
  wire T297;
  wire[1:0] T298;
  wire[1:0] T299;
  wire T300;
  wire T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire[1:0] T306;
  wire[1:0] T307;
  wire T308;
  wire T309;
  wire T310;
  wire T311;
  wire T312;
  wire T313;
  wire[1:0] T314;
  wire[1:0] T315;
  wire T316;
  wire T317;
  wire T318;
  wire T319;
  wire T320;
  wire T321;
  wire[1:0] T322;
  wire[1:0] T323;
  wire T324;
  wire T325;
  wire T326;
  wire T327;
  wire T328;
  wire T329;
  wire[1:0] T330;
  wire[1:0] T331;
  wire T332;
  wire T333;
  wire T334;
  wire T335;
  wire T336;
  wire T337;
  wire[1:0] T338;
  wire[1:0] T339;
  wire T340;
  wire T341;
  wire T342;
  wire T343;
  wire T344;
  wire T345;
  wire[1:0] T346;
  wire[1:0] T347;
  wire T348;
  wire T349;
  wire T350;
  wire T351;
  wire T352;
  wire T353;
  wire[1:0] T354;
  wire[1:0] T355;
  wire T356;
  wire T357;
  wire T358;
  wire T359;
  wire T360;
  wire T361;
  wire[1:0] T362;
  wire[1:0] T363;
  wire T364;
  wire T365;
  wire T366;
  wire T367;
  wire T368;
  wire T369;
  wire[1:0] T370;
  wire[1:0] T371;
  wire T372;
  wire T373;
  wire T374;
  wire T375;
  wire T376;
  wire T377;
  wire[1:0] T378;
  wire[1:0] T379;
  wire T380;
  wire T381;
  wire T382;
  wire T383;
  wire T384;
  wire T385;
  wire[1:0] T386;
  wire[1:0] T387;
  wire T388;
  wire T389;
  wire T390;
  wire T391;
  wire T392;
  wire T393;
  wire[1:0] T394;
  wire[1:0] T395;
  wire T396;
  wire T397;
  wire T398;
  wire T399;
  wire T400;
  wire T401;
  wire[1:0] T402;
  wire[1:0] T403;
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
  wire T415;
  wire T416;
  wire T417;
  wire[1:0] T418;
  wire[1:0] T419;
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
  wire T431;
  wire T432;
  wire T433;
  wire[1:0] T434;
  wire[1:0] T435;
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
  wire T447;
  wire T448;
  wire T449;
  wire[1:0] T450;
  wire[1:0] T451;
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
  wire T463;
  wire T464;
  wire T465;
  wire[1:0] T466;
  wire[1:0] T467;
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
  wire T479;
  wire T480;
  wire T481;
  wire[1:0] T482;
  wire[1:0] T483;
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
  wire T495;
  wire T496;
  wire T497;
  wire[1:0] T498;
  wire[1:0] T499;
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
  wire[3:0] T543;
  wire[3:0] T544;
  wire[3:0] T545;
  wire[8:0] T546;
  wire[8:0] T547;
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
  wire[3:0] T559;
  wire[3:0] T560;
  wire[3:0] T561;
  wire[8:0] T562;
  wire[8:0] T563;
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
  wire[3:0] T575;
  wire[3:0] T576;
  wire[3:0] T577;
  wire[8:0] T578;
  wire[8:0] T579;
  wire T580;
  wire T581;
  wire T582;
  wire T583;
  wire T584;
  wire T585;
  wire[1:0] T586;
  wire[1:0] T587;
  wire T588;
  wire T589;
  wire T590;
  wire[3:0] T591;
  wire[3:0] T592;
  wire[3:0] T593;
  wire[8:0] T594;
  wire[8:0] T595;
  wire T596;
  wire T597;
  wire T598;
  wire T599;
  wire T600;
  wire T601;
  wire[1:0] T602;
  wire[1:0] T603;
  wire T604;
  wire T605;
  wire T606;
  wire[3:0] T607;
  wire[3:0] T608;
  wire[3:0] T609;
  wire[8:0] T610;
  wire[8:0] T611;
  wire T612;
  wire T613;
  wire T614;
  wire T615;
  wire T616;
  wire T617;
  wire[1:0] T618;
  wire[1:0] T619;
  wire T620;
  wire T621;
  wire T622;
  wire[3:0] T623;
  wire[3:0] T624;
  wire[3:0] T625;
  wire[8:0] T626;
  wire[8:0] T627;
  wire T628;
  wire T629;
  wire T630;
  wire T631;
  wire T632;
  wire T633;
  wire[1:0] T634;
  wire[1:0] T635;
  wire T636;
  wire T637;
  wire T638;
  wire[3:0] T639;
  wire[3:0] T640;
  wire[3:0] T641;
  wire[8:0] T642;
  wire[8:0] T643;
  wire T644;
  wire T645;
  wire T646;
  wire T647;
  wire T648;
  wire T649;
  wire[1:0] T650;
  wire[1:0] T651;
  wire T652;
  wire T653;
  wire T654;
  wire[3:0] T655;
  wire[3:0] T656;
  wire[3:0] T657;
  wire[8:0] T658;
  wire[8:0] T659;
  wire T660;
  wire T661;
  wire T662;
  wire T663;
  wire T664;
  wire T665;
  wire[1:0] T666;
  wire[1:0] T667;
  wire T668;
  wire T669;
  wire T670;
  wire[3:0] T671;
  wire[3:0] T672;
  wire[3:0] T673;
  wire[8:0] T674;
  wire[8:0] T675;
  wire T676;
  wire T677;
  wire T678;
  wire T679;
  wire T680;
  wire T681;
  wire[1:0] T682;
  wire[1:0] T683;
  wire T684;
  wire T685;
  wire T686;
  wire[3:0] T687;
  wire[3:0] T688;
  wire[3:0] T689;
  wire[8:0] T690;
  wire[8:0] T691;
  wire T692;
  wire T693;
  wire T694;
  wire T695;
  wire T696;
  wire T697;
  wire[1:0] T698;
  wire[1:0] T699;
  wire T700;
  wire T701;
  wire T702;
  wire[3:0] T703;
  wire[3:0] T704;
  wire[3:0] T705;
  wire[8:0] T706;
  wire[8:0] T707;
  wire T708;
  wire T709;
  wire T710;
  wire T711;
  wire T712;
  wire T713;
  wire[1:0] T714;
  wire[1:0] T715;
  wire T716;
  wire T717;
  wire T718;
  wire[3:0] T719;
  wire[3:0] T720;
  wire[3:0] T721;
  wire[8:0] T722;
  wire[8:0] T723;
  wire T724;
  wire T725;
  wire T726;
  wire T727;
  wire T728;
  wire T729;
  wire[1:0] T730;
  wire[1:0] T731;
  wire T732;
  wire T733;
  wire T734;
  wire[3:0] T735;
  wire[3:0] T736;
  wire[3:0] T737;
  wire[8:0] T738;
  wire[8:0] T739;
  wire T740;
  wire T741;
  wire T742;
  wire T743;
  wire T744;
  wire T745;
  wire[1:0] T746;
  wire[1:0] T747;
  wire[7:0] T748;
  wire[7:0] T749;
  wire[6:0] T750;
  wire[6:0] T751;
  wire[5:0] T752;
  wire[5:0] T753;
  wire[4:0] T754;
  wire[4:0] T755;
  wire[3:0] T756;
  wire[3:0] T757;
  wire[2:0] T758;
  wire[2:0] T759;
  wire[1:0] T760;
  wire[1:0] T761;
  wire T762;
  wire T763;
  wire T764;
  wire[11:0] T765;
  wire[11:0] T766;
  wire[11:0] T767;
  wire[3:0] T768;
  wire[11:0] T769;
  wire[11:0] T770;
  wire T771;
  wire T772;
  wire T773;
  wire[11:0] T774;
  wire[11:0] T775;
  wire[11:0] T776;
  wire[3:0] T777;
  wire[11:0] T778;
  wire[11:0] T779;
  wire T780;
  wire T781;
  wire T782;
  wire[11:0] T783;
  wire[11:0] T784;
  wire[11:0] T785;
  wire[3:0] T786;
  wire[11:0] T787;
  wire[11:0] T788;
  wire T789;
  wire T790;
  wire T791;
  wire[11:0] T792;
  wire[11:0] T793;
  wire[11:0] T794;
  wire[3:0] T795;
  wire[11:0] T796;
  wire[11:0] T797;
  wire T798;
  wire T799;
  wire T800;
  wire[11:0] T801;
  wire[11:0] T802;
  wire[11:0] T803;
  wire[3:0] T804;
  wire[11:0] T805;
  wire[11:0] T806;
  wire T807;
  wire T808;
  wire T809;
  wire[11:0] T810;
  wire[11:0] T811;
  wire[11:0] T812;
  wire[3:0] T813;
  wire[11:0] T814;
  wire[11:0] T815;
  wire T816;
  wire T817;
  wire T818;
  wire[11:0] T819;
  wire[11:0] T820;
  wire[11:0] T821;
  wire[3:0] T822;
  wire[11:0] T823;
  wire[11:0] T824;
  wire T825;
  wire T826;
  wire T827;
  wire[11:0] T828;
  wire[11:0] T829;
  wire[11:0] T830;
  wire[3:0] T831;
  wire[11:0] T832;
  wire[11:0] T833;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T740, T2};
  assign T2 = T3;
  assign T3 = {T732, T4};
  assign T4 = T5;
  assign T5 = {T724, T6};
  assign T6 = T7;
  assign T7 = {T716, T8};
  assign T8 = T9;
  assign T9 = {T708, T10};
  assign T10 = T11;
  assign T11 = {T700, T12};
  assign T12 = T13;
  assign T13 = {T692, T14};
  assign T14 = T15;
  assign T15 = {T684, T16};
  assign T16 = T17;
  assign T17 = {T676, T18};
  assign T18 = T19;
  assign T19 = {T668, T20};
  assign T20 = T21;
  assign T21 = {T660, T22};
  assign T22 = T23;
  assign T23 = {T652, T24};
  assign T24 = T25;
  assign T25 = {T644, T26};
  assign T26 = T27;
  assign T27 = {T636, T28};
  assign T28 = T29;
  assign T29 = {T628, T30};
  assign T30 = T31;
  assign T31 = {T620, T32};
  assign T32 = T33;
  assign T33 = {T612, T34};
  assign T34 = T35;
  assign T35 = {T604, T36};
  assign T36 = T37;
  assign T37 = {T596, T38};
  assign T38 = T39;
  assign T39 = {T588, T40};
  assign T40 = T41;
  assign T41 = {T580, T42};
  assign T42 = T43;
  assign T43 = {T572, T44};
  assign T44 = T45;
  assign T45 = {T564, T46};
  assign T46 = T47;
  assign T47 = {T556, T48};
  assign T48 = T49;
  assign T49 = {T548, T50};
  assign T50 = T51;
  assign T51 = {T540, T52};
  assign T52 = T53;
  assign T53 = {T532, T54};
  assign T54 = T55;
  assign T55 = {T524, T56};
  assign T56 = T57;
  assign T57 = {T516, T58};
  assign T58 = T59;
  assign T59 = {T508, T60};
  assign T60 = T61;
  assign T61 = {T500, T62};
  assign T62 = T63;
  assign T63 = {T492, T64};
  assign T64 = T65;
  assign T65 = {T484, T66};
  assign T66 = T67;
  assign T67 = {T476, T68};
  assign T68 = T69;
  assign T69 = {T468, T70};
  assign T70 = T71;
  assign T71 = {T460, T72};
  assign T72 = T73;
  assign T73 = {T452, T74};
  assign T74 = T75;
  assign T75 = {T444, T76};
  assign T76 = T77;
  assign T77 = {T436, T78};
  assign T78 = T79;
  assign T79 = {T428, T80};
  assign T80 = T81;
  assign T81 = {T420, T82};
  assign T82 = T83;
  assign T83 = {T412, T84};
  assign T84 = T85;
  assign T85 = {T404, T86};
  assign T86 = T87;
  assign T87 = {T396, T88};
  assign T88 = T89;
  assign T89 = {T388, T90};
  assign T90 = T91;
  assign T91 = {T380, T92};
  assign T92 = T93;
  assign T93 = {T372, T94};
  assign T94 = T95;
  assign T95 = {T364, T96};
  assign T96 = T97;
  assign T97 = {T356, T98};
  assign T98 = T99;
  assign T99 = {T348, T100};
  assign T100 = T101;
  assign T101 = {T340, T102};
  assign T102 = T103;
  assign T103 = {T332, T104};
  assign T104 = T105;
  assign T105 = {T324, T106};
  assign T106 = T107;
  assign T107 = {T316, T108};
  assign T108 = T109;
  assign T109 = {T308, T110};
  assign T110 = T111;
  assign T111 = {T300, T112};
  assign T112 = T113;
  assign T113 = {T292, T114};
  assign T114 = T115;
  assign T115 = {T284, T116};
  assign T116 = T117;
  assign T117 = {T276, T118};
  assign T118 = T119;
  assign T119 = {T268, T120};
  assign T120 = T121;
  assign T121 = {T260, T122};
  assign T122 = T123;
  assign T123 = {T252, T124};
  assign T124 = T125;
  assign T125 = {T244, T126};
  assign T126 = T127;
  assign T127 = {T236, T128};
  assign T128 = T129;
  assign T129 = {T228, T130};
  assign T130 = T131;
  assign T131 = {T220, T132};
  assign T132 = T133;
  assign T133 = {T212, T134};
  assign T134 = T135;
  assign T135 = {T204, T136};
  assign T136 = T137;
  assign T137 = {T196, T138};
  assign T138 = T139;
  assign T139 = {T188, T140};
  assign T140 = T141;
  assign T141 = {T180, T142};
  assign T142 = T143;
  assign T143 = {T172, T144};
  assign T144 = T145;
  assign T145 = {T164, T146};
  assign T146 = T147;
  assign T147 = {T156, T148};
  assign T148 = T149;
  assign T149 = T150;
  assign T150 = T154[T151];
  assign T151 = T152;
  assign T152 = T153;
  assign T153 = io_chanxy_config[1'h0/* 0*/:1'h0/* 0*/];
  assign T154 = T155;
  assign T155 = io_chanxy_in[1'h1/* 1*/:1'h0/* 0*/];
  assign T156 = T157;
  assign T157 = T158;
  assign T158 = T162[T159];
  assign T159 = T160;
  assign T160 = T161;
  assign T161 = io_chanxy_config[1'h1/* 1*/:1'h1/* 1*/];
  assign T162 = T163;
  assign T163 = io_chanxy_in[2'h3/* 3*/:2'h2/* 2*/];
  assign T164 = T165;
  assign T165 = T166;
  assign T166 = T170[T167];
  assign T167 = T168;
  assign T168 = T169;
  assign T169 = io_chanxy_config[2'h2/* 2*/:2'h2/* 2*/];
  assign T170 = T171;
  assign T171 = io_chanxy_in[3'h5/* 5*/:3'h4/* 4*/];
  assign T172 = T173;
  assign T173 = T174;
  assign T174 = T178[T175];
  assign T175 = T176;
  assign T176 = T177;
  assign T177 = io_chanxy_config[2'h3/* 3*/:2'h3/* 3*/];
  assign T178 = T179;
  assign T179 = io_chanxy_in[3'h7/* 7*/:3'h6/* 6*/];
  assign T180 = T181;
  assign T181 = T182;
  assign T182 = T186[T183];
  assign T183 = T184;
  assign T184 = T185;
  assign T185 = io_chanxy_config[3'h4/* 4*/:3'h4/* 4*/];
  assign T186 = T187;
  assign T187 = io_chanxy_in[4'h9/* 9*/:4'h8/* 8*/];
  assign T188 = T189;
  assign T189 = T190;
  assign T190 = T194[T191];
  assign T191 = T192;
  assign T192 = T193;
  assign T193 = io_chanxy_config[3'h5/* 5*/:3'h5/* 5*/];
  assign T194 = T195;
  assign T195 = io_chanxy_in[4'hb/* 11*/:4'ha/* 10*/];
  assign T196 = T197;
  assign T197 = T198;
  assign T198 = T202[T199];
  assign T199 = T200;
  assign T200 = T201;
  assign T201 = io_chanxy_config[3'h6/* 6*/:3'h6/* 6*/];
  assign T202 = T203;
  assign T203 = io_chanxy_in[4'hd/* 13*/:4'hc/* 12*/];
  assign T204 = T205;
  assign T205 = T206;
  assign T206 = T210[T207];
  assign T207 = T208;
  assign T208 = T209;
  assign T209 = io_chanxy_config[3'h7/* 7*/:3'h7/* 7*/];
  assign T210 = T211;
  assign T211 = io_chanxy_in[4'hf/* 15*/:4'he/* 14*/];
  assign T212 = T213;
  assign T213 = T214;
  assign T214 = T218[T215];
  assign T215 = T216;
  assign T216 = T217;
  assign T217 = io_chanxy_config[4'h8/* 8*/:4'h8/* 8*/];
  assign T218 = T219;
  assign T219 = io_chanxy_in[5'h11/* 17*/:5'h10/* 16*/];
  assign T220 = T221;
  assign T221 = T222;
  assign T222 = T226[T223];
  assign T223 = T224;
  assign T224 = T225;
  assign T225 = io_chanxy_config[4'h9/* 9*/:4'h9/* 9*/];
  assign T226 = T227;
  assign T227 = io_chanxy_in[5'h13/* 19*/:5'h12/* 18*/];
  assign T228 = T229;
  assign T229 = T230;
  assign T230 = T234[T231];
  assign T231 = T232;
  assign T232 = T233;
  assign T233 = io_chanxy_config[4'ha/* 10*/:4'ha/* 10*/];
  assign T234 = T235;
  assign T235 = io_chanxy_in[5'h15/* 21*/:5'h14/* 20*/];
  assign T236 = T237;
  assign T237 = T238;
  assign T238 = T242[T239];
  assign T239 = T240;
  assign T240 = T241;
  assign T241 = io_chanxy_config[4'hb/* 11*/:4'hb/* 11*/];
  assign T242 = T243;
  assign T243 = io_chanxy_in[5'h17/* 23*/:5'h16/* 22*/];
  assign T244 = T245;
  assign T245 = T246;
  assign T246 = T250[T247];
  assign T247 = T248;
  assign T248 = T249;
  assign T249 = io_chanxy_config[4'hc/* 12*/:4'hc/* 12*/];
  assign T250 = T251;
  assign T251 = io_chanxy_in[5'h19/* 25*/:5'h18/* 24*/];
  assign T252 = T253;
  assign T253 = T254;
  assign T254 = T258[T255];
  assign T255 = T256;
  assign T256 = T257;
  assign T257 = io_chanxy_config[4'hd/* 13*/:4'hd/* 13*/];
  assign T258 = T259;
  assign T259 = io_chanxy_in[5'h1b/* 27*/:5'h1a/* 26*/];
  assign T260 = T261;
  assign T261 = T262;
  assign T262 = T266[T263];
  assign T263 = T264;
  assign T264 = T265;
  assign T265 = io_chanxy_config[4'he/* 14*/:4'he/* 14*/];
  assign T266 = T267;
  assign T267 = io_chanxy_in[5'h1d/* 29*/:5'h1c/* 28*/];
  assign T268 = T269;
  assign T269 = T270;
  assign T270 = T274[T271];
  assign T271 = T272;
  assign T272 = T273;
  assign T273 = io_chanxy_config[4'hf/* 15*/:4'hf/* 15*/];
  assign T274 = T275;
  assign T275 = io_chanxy_in[5'h1f/* 31*/:5'h1e/* 30*/];
  assign T276 = T277;
  assign T277 = T278;
  assign T278 = T282[T279];
  assign T279 = T280;
  assign T280 = T281;
  assign T281 = io_chanxy_config[5'h10/* 16*/:5'h10/* 16*/];
  assign T282 = T283;
  assign T283 = io_chanxy_in[6'h21/* 33*/:6'h20/* 32*/];
  assign T284 = T285;
  assign T285 = T286;
  assign T286 = T290[T287];
  assign T287 = T288;
  assign T288 = T289;
  assign T289 = io_chanxy_config[5'h11/* 17*/:5'h11/* 17*/];
  assign T290 = T291;
  assign T291 = io_chanxy_in[6'h23/* 35*/:6'h22/* 34*/];
  assign T292 = T293;
  assign T293 = T294;
  assign T294 = T298[T295];
  assign T295 = T296;
  assign T296 = T297;
  assign T297 = io_chanxy_config[5'h12/* 18*/:5'h12/* 18*/];
  assign T298 = T299;
  assign T299 = io_chanxy_in[6'h25/* 37*/:6'h24/* 36*/];
  assign T300 = T301;
  assign T301 = T302;
  assign T302 = T306[T303];
  assign T303 = T304;
  assign T304 = T305;
  assign T305 = io_chanxy_config[5'h13/* 19*/:5'h13/* 19*/];
  assign T306 = T307;
  assign T307 = io_chanxy_in[6'h27/* 39*/:6'h26/* 38*/];
  assign T308 = T309;
  assign T309 = T310;
  assign T310 = T314[T311];
  assign T311 = T312;
  assign T312 = T313;
  assign T313 = io_chanxy_config[5'h14/* 20*/:5'h14/* 20*/];
  assign T314 = T315;
  assign T315 = io_chanxy_in[6'h29/* 41*/:6'h28/* 40*/];
  assign T316 = T317;
  assign T317 = T318;
  assign T318 = T322[T319];
  assign T319 = T320;
  assign T320 = T321;
  assign T321 = io_chanxy_config[5'h15/* 21*/:5'h15/* 21*/];
  assign T322 = T323;
  assign T323 = io_chanxy_in[6'h2b/* 43*/:6'h2a/* 42*/];
  assign T324 = T325;
  assign T325 = T326;
  assign T326 = T330[T327];
  assign T327 = T328;
  assign T328 = T329;
  assign T329 = io_chanxy_config[5'h16/* 22*/:5'h16/* 22*/];
  assign T330 = T331;
  assign T331 = io_chanxy_in[6'h2d/* 45*/:6'h2c/* 44*/];
  assign T332 = T333;
  assign T333 = T334;
  assign T334 = T338[T335];
  assign T335 = T336;
  assign T336 = T337;
  assign T337 = io_chanxy_config[5'h17/* 23*/:5'h17/* 23*/];
  assign T338 = T339;
  assign T339 = io_chanxy_in[6'h2f/* 47*/:6'h2e/* 46*/];
  assign T340 = T341;
  assign T341 = T342;
  assign T342 = T346[T343];
  assign T343 = T344;
  assign T344 = T345;
  assign T345 = io_chanxy_config[5'h18/* 24*/:5'h18/* 24*/];
  assign T346 = T347;
  assign T347 = io_chanxy_in[6'h31/* 49*/:6'h30/* 48*/];
  assign T348 = T349;
  assign T349 = T350;
  assign T350 = T354[T351];
  assign T351 = T352;
  assign T352 = T353;
  assign T353 = io_chanxy_config[5'h19/* 25*/:5'h19/* 25*/];
  assign T354 = T355;
  assign T355 = io_chanxy_in[6'h33/* 51*/:6'h32/* 50*/];
  assign T356 = T357;
  assign T357 = T358;
  assign T358 = T362[T359];
  assign T359 = T360;
  assign T360 = T361;
  assign T361 = io_chanxy_config[5'h1a/* 26*/:5'h1a/* 26*/];
  assign T362 = T363;
  assign T363 = io_chanxy_in[6'h35/* 53*/:6'h34/* 52*/];
  assign T364 = T365;
  assign T365 = T366;
  assign T366 = T370[T367];
  assign T367 = T368;
  assign T368 = T369;
  assign T369 = io_chanxy_config[5'h1b/* 27*/:5'h1b/* 27*/];
  assign T370 = T371;
  assign T371 = io_chanxy_in[6'h37/* 55*/:6'h36/* 54*/];
  assign T372 = T373;
  assign T373 = T374;
  assign T374 = T378[T375];
  assign T375 = T376;
  assign T376 = T377;
  assign T377 = io_chanxy_config[5'h1c/* 28*/:5'h1c/* 28*/];
  assign T378 = T379;
  assign T379 = io_chanxy_in[6'h39/* 57*/:6'h38/* 56*/];
  assign T380 = T381;
  assign T381 = T382;
  assign T382 = T386[T383];
  assign T383 = T384;
  assign T384 = T385;
  assign T385 = io_chanxy_config[5'h1d/* 29*/:5'h1d/* 29*/];
  assign T386 = T387;
  assign T387 = io_chanxy_in[6'h3b/* 59*/:6'h3a/* 58*/];
  assign T388 = T389;
  assign T389 = T390;
  assign T390 = T394[T391];
  assign T391 = T392;
  assign T392 = T393;
  assign T393 = io_chanxy_config[5'h1e/* 30*/:5'h1e/* 30*/];
  assign T394 = T395;
  assign T395 = io_chanxy_in[6'h3d/* 61*/:6'h3c/* 60*/];
  assign T396 = T397;
  assign T397 = T398;
  assign T398 = T402[T399];
  assign T399 = T400;
  assign T400 = T401;
  assign T401 = io_chanxy_config[5'h1f/* 31*/:5'h1f/* 31*/];
  assign T402 = T403;
  assign T403 = io_chanxy_in[6'h3f/* 63*/:6'h3e/* 62*/];
  assign T404 = T405;
  assign T405 = T406;
  assign T406 = T410[T407];
  assign T407 = T408;
  assign T408 = T409;
  assign T409 = io_chanxy_config[6'h20/* 32*/:6'h20/* 32*/];
  assign T410 = T411;
  assign T411 = io_chanxy_in[7'h41/* 65*/:7'h40/* 64*/];
  assign T412 = T413;
  assign T413 = T414;
  assign T414 = T418[T415];
  assign T415 = T416;
  assign T416 = T417;
  assign T417 = io_chanxy_config[6'h21/* 33*/:6'h21/* 33*/];
  assign T418 = T419;
  assign T419 = io_chanxy_in[7'h43/* 67*/:7'h42/* 66*/];
  assign T420 = T421;
  assign T421 = T422;
  assign T422 = T426[T423];
  assign T423 = T424;
  assign T424 = T425;
  assign T425 = io_chanxy_config[6'h22/* 34*/:6'h22/* 34*/];
  assign T426 = T427;
  assign T427 = io_chanxy_in[7'h45/* 69*/:7'h44/* 68*/];
  assign T428 = T429;
  assign T429 = T430;
  assign T430 = T434[T431];
  assign T431 = T432;
  assign T432 = T433;
  assign T433 = io_chanxy_config[6'h23/* 35*/:6'h23/* 35*/];
  assign T434 = T435;
  assign T435 = io_chanxy_in[7'h47/* 71*/:7'h46/* 70*/];
  assign T436 = T437;
  assign T437 = T438;
  assign T438 = T442[T439];
  assign T439 = T440;
  assign T440 = T441;
  assign T441 = io_chanxy_config[6'h24/* 36*/:6'h24/* 36*/];
  assign T442 = T443;
  assign T443 = io_chanxy_in[7'h49/* 73*/:7'h48/* 72*/];
  assign T444 = T445;
  assign T445 = T446;
  assign T446 = T450[T447];
  assign T447 = T448;
  assign T448 = T449;
  assign T449 = io_chanxy_config[6'h25/* 37*/:6'h25/* 37*/];
  assign T450 = T451;
  assign T451 = io_chanxy_in[7'h4b/* 75*/:7'h4a/* 74*/];
  assign T452 = T453;
  assign T453 = T454;
  assign T454 = T458[T455];
  assign T455 = T456;
  assign T456 = T457;
  assign T457 = io_chanxy_config[6'h26/* 38*/:6'h26/* 38*/];
  assign T458 = T459;
  assign T459 = io_chanxy_in[7'h4d/* 77*/:7'h4c/* 76*/];
  assign T460 = T461;
  assign T461 = T462;
  assign T462 = T466[T463];
  assign T463 = T464;
  assign T464 = T465;
  assign T465 = io_chanxy_config[6'h27/* 39*/:6'h27/* 39*/];
  assign T466 = T467;
  assign T467 = io_chanxy_in[7'h4f/* 79*/:7'h4e/* 78*/];
  assign T468 = T469;
  assign T469 = T470;
  assign T470 = T474[T471];
  assign T471 = T472;
  assign T472 = T473;
  assign T473 = io_chanxy_config[6'h28/* 40*/:6'h28/* 40*/];
  assign T474 = T475;
  assign T475 = io_chanxy_in[7'h51/* 81*/:7'h50/* 80*/];
  assign T476 = T477;
  assign T477 = T478;
  assign T478 = T482[T479];
  assign T479 = T480;
  assign T480 = T481;
  assign T481 = io_chanxy_config[6'h29/* 41*/:6'h29/* 41*/];
  assign T482 = T483;
  assign T483 = io_chanxy_in[7'h53/* 83*/:7'h52/* 82*/];
  assign T484 = T485;
  assign T485 = T486;
  assign T486 = T490[T487];
  assign T487 = T488;
  assign T488 = T489;
  assign T489 = io_chanxy_config[6'h2a/* 42*/:6'h2a/* 42*/];
  assign T490 = T491;
  assign T491 = io_chanxy_in[7'h55/* 85*/:7'h54/* 84*/];
  assign T492 = T493;
  assign T493 = T494;
  assign T494 = T498[T495];
  assign T495 = T496;
  assign T496 = T497;
  assign T497 = io_chanxy_config[6'h2b/* 43*/:6'h2b/* 43*/];
  assign T498 = T499;
  assign T499 = io_chanxy_in[7'h57/* 87*/:7'h56/* 86*/];
  assign T500 = T501;
  assign T501 = T502;
  assign T502 = T506[T503];
  assign T503 = T504;
  assign T504 = T505;
  assign T505 = io_chanxy_config[6'h2c/* 44*/:6'h2c/* 44*/];
  assign T506 = T507;
  assign T507 = io_chanxy_in[7'h59/* 89*/:7'h58/* 88*/];
  assign T508 = T509;
  assign T509 = T510;
  assign T510 = T514[T511];
  assign T511 = T512;
  assign T512 = T513;
  assign T513 = io_chanxy_config[6'h30/* 48*/:6'h2d/* 45*/];
  assign T514 = T515;
  assign T515 = io_chanxy_in[7'h62/* 98*/:7'h5a/* 90*/];
  assign T516 = T517;
  assign T517 = T518;
  assign T518 = T522[T519];
  assign T519 = T520;
  assign T520 = T521;
  assign T521 = io_chanxy_config[6'h31/* 49*/:6'h31/* 49*/];
  assign T522 = T523;
  assign T523 = io_chanxy_in[7'h64/* 100*/:7'h63/* 99*/];
  assign T524 = T525;
  assign T525 = T526;
  assign T526 = T530[T527];
  assign T527 = T528;
  assign T528 = T529;
  assign T529 = io_chanxy_config[6'h35/* 53*/:6'h32/* 50*/];
  assign T530 = T531;
  assign T531 = io_chanxy_in[7'h6d/* 109*/:7'h65/* 101*/];
  assign T532 = T533;
  assign T533 = T534;
  assign T534 = T538[T535];
  assign T535 = T536;
  assign T536 = T537;
  assign T537 = io_chanxy_config[6'h36/* 54*/:6'h36/* 54*/];
  assign T538 = T539;
  assign T539 = io_chanxy_in[7'h6f/* 111*/:7'h6e/* 110*/];
  assign T540 = T541;
  assign T541 = T542;
  assign T542 = T546[T543];
  assign T543 = T544;
  assign T544 = T545;
  assign T545 = io_chanxy_config[6'h3a/* 58*/:6'h37/* 55*/];
  assign T546 = T547;
  assign T547 = io_chanxy_in[7'h78/* 120*/:7'h70/* 112*/];
  assign T548 = T549;
  assign T549 = T550;
  assign T550 = T554[T551];
  assign T551 = T552;
  assign T552 = T553;
  assign T553 = io_chanxy_config[6'h3b/* 59*/:6'h3b/* 59*/];
  assign T554 = T555;
  assign T555 = io_chanxy_in[7'h7a/* 122*/:7'h79/* 121*/];
  assign T556 = T557;
  assign T557 = T558;
  assign T558 = T562[T559];
  assign T559 = T560;
  assign T560 = T561;
  assign T561 = io_chanxy_config[6'h3f/* 63*/:6'h3c/* 60*/];
  assign T562 = T563;
  assign T563 = io_chanxy_in[8'h83/* 131*/:7'h7b/* 123*/];
  assign T564 = T565;
  assign T565 = T566;
  assign T566 = T570[T567];
  assign T567 = T568;
  assign T568 = T569;
  assign T569 = io_chanxy_config[7'h40/* 64*/:7'h40/* 64*/];
  assign T570 = T571;
  assign T571 = io_chanxy_in[8'h85/* 133*/:8'h84/* 132*/];
  assign T572 = T573;
  assign T573 = T574;
  assign T574 = T578[T575];
  assign T575 = T576;
  assign T576 = T577;
  assign T577 = io_chanxy_config[7'h44/* 68*/:7'h41/* 65*/];
  assign T578 = T579;
  assign T579 = io_chanxy_in[8'h8e/* 142*/:8'h86/* 134*/];
  assign T580 = T581;
  assign T581 = T582;
  assign T582 = T586[T583];
  assign T583 = T584;
  assign T584 = T585;
  assign T585 = io_chanxy_config[7'h45/* 69*/:7'h45/* 69*/];
  assign T586 = T587;
  assign T587 = io_chanxy_in[8'h90/* 144*/:8'h8f/* 143*/];
  assign T588 = T589;
  assign T589 = T590;
  assign T590 = T594[T591];
  assign T591 = T592;
  assign T592 = T593;
  assign T593 = io_chanxy_config[7'h49/* 73*/:7'h46/* 70*/];
  assign T594 = T595;
  assign T595 = io_chanxy_in[8'h99/* 153*/:8'h91/* 145*/];
  assign T596 = T597;
  assign T597 = T598;
  assign T598 = T602[T599];
  assign T599 = T600;
  assign T600 = T601;
  assign T601 = io_chanxy_config[7'h4a/* 74*/:7'h4a/* 74*/];
  assign T602 = T603;
  assign T603 = io_chanxy_in[8'h9b/* 155*/:8'h9a/* 154*/];
  assign T604 = T605;
  assign T605 = T606;
  assign T606 = T610[T607];
  assign T607 = T608;
  assign T608 = T609;
  assign T609 = io_chanxy_config[7'h4e/* 78*/:7'h4b/* 75*/];
  assign T610 = T611;
  assign T611 = io_chanxy_in[8'ha4/* 164*/:8'h9c/* 156*/];
  assign T612 = T613;
  assign T613 = T614;
  assign T614 = T618[T615];
  assign T615 = T616;
  assign T616 = T617;
  assign T617 = io_chanxy_config[7'h4f/* 79*/:7'h4f/* 79*/];
  assign T618 = T619;
  assign T619 = io_chanxy_in[8'ha6/* 166*/:8'ha5/* 165*/];
  assign T620 = T621;
  assign T621 = T622;
  assign T622 = T626[T623];
  assign T623 = T624;
  assign T624 = T625;
  assign T625 = io_chanxy_config[7'h53/* 83*/:7'h50/* 80*/];
  assign T626 = T627;
  assign T627 = io_chanxy_in[8'haf/* 175*/:8'ha7/* 167*/];
  assign T628 = T629;
  assign T629 = T630;
  assign T630 = T634[T631];
  assign T631 = T632;
  assign T632 = T633;
  assign T633 = io_chanxy_config[7'h54/* 84*/:7'h54/* 84*/];
  assign T634 = T635;
  assign T635 = io_chanxy_in[8'hb1/* 177*/:8'hb0/* 176*/];
  assign T636 = T637;
  assign T637 = T638;
  assign T638 = T642[T639];
  assign T639 = T640;
  assign T640 = T641;
  assign T641 = io_chanxy_config[7'h58/* 88*/:7'h55/* 85*/];
  assign T642 = T643;
  assign T643 = io_chanxy_in[8'hba/* 186*/:8'hb2/* 178*/];
  assign T644 = T645;
  assign T645 = T646;
  assign T646 = T650[T647];
  assign T647 = T648;
  assign T648 = T649;
  assign T649 = io_chanxy_config[7'h59/* 89*/:7'h59/* 89*/];
  assign T650 = T651;
  assign T651 = io_chanxy_in[8'hbc/* 188*/:8'hbb/* 187*/];
  assign T652 = T653;
  assign T653 = T654;
  assign T654 = T658[T655];
  assign T655 = T656;
  assign T656 = T657;
  assign T657 = io_chanxy_config[7'h5d/* 93*/:7'h5a/* 90*/];
  assign T658 = T659;
  assign T659 = io_chanxy_in[8'hc5/* 197*/:8'hbd/* 189*/];
  assign T660 = T661;
  assign T661 = T662;
  assign T662 = T666[T663];
  assign T663 = T664;
  assign T664 = T665;
  assign T665 = io_chanxy_config[7'h5e/* 94*/:7'h5e/* 94*/];
  assign T666 = T667;
  assign T667 = io_chanxy_in[8'hc7/* 199*/:8'hc6/* 198*/];
  assign T668 = T669;
  assign T669 = T670;
  assign T670 = T674[T671];
  assign T671 = T672;
  assign T672 = T673;
  assign T673 = io_chanxy_config[7'h62/* 98*/:7'h5f/* 95*/];
  assign T674 = T675;
  assign T675 = io_chanxy_in[8'hd0/* 208*/:8'hc8/* 200*/];
  assign T676 = T677;
  assign T677 = T678;
  assign T678 = T682[T679];
  assign T679 = T680;
  assign T680 = T681;
  assign T681 = io_chanxy_config[7'h63/* 99*/:7'h63/* 99*/];
  assign T682 = T683;
  assign T683 = io_chanxy_in[8'hd2/* 210*/:8'hd1/* 209*/];
  assign T684 = T685;
  assign T685 = T686;
  assign T686 = T690[T687];
  assign T687 = T688;
  assign T688 = T689;
  assign T689 = io_chanxy_config[7'h67/* 103*/:7'h64/* 100*/];
  assign T690 = T691;
  assign T691 = io_chanxy_in[8'hdb/* 219*/:8'hd3/* 211*/];
  assign T692 = T693;
  assign T693 = T694;
  assign T694 = T698[T695];
  assign T695 = T696;
  assign T696 = T697;
  assign T697 = io_chanxy_config[7'h68/* 104*/:7'h68/* 104*/];
  assign T698 = T699;
  assign T699 = io_chanxy_in[8'hdd/* 221*/:8'hdc/* 220*/];
  assign T700 = T701;
  assign T701 = T702;
  assign T702 = T706[T703];
  assign T703 = T704;
  assign T704 = T705;
  assign T705 = io_chanxy_config[7'h6c/* 108*/:7'h69/* 105*/];
  assign T706 = T707;
  assign T707 = io_chanxy_in[8'he6/* 230*/:8'hde/* 222*/];
  assign T708 = T709;
  assign T709 = T710;
  assign T710 = T714[T711];
  assign T711 = T712;
  assign T712 = T713;
  assign T713 = io_chanxy_config[7'h6d/* 109*/:7'h6d/* 109*/];
  assign T714 = T715;
  assign T715 = io_chanxy_in[8'he8/* 232*/:8'he7/* 231*/];
  assign T716 = T717;
  assign T717 = T718;
  assign T718 = T722[T719];
  assign T719 = T720;
  assign T720 = T721;
  assign T721 = io_chanxy_config[7'h71/* 113*/:7'h6e/* 110*/];
  assign T722 = T723;
  assign T723 = io_chanxy_in[8'hf1/* 241*/:8'he9/* 233*/];
  assign T724 = T725;
  assign T725 = T726;
  assign T726 = T730[T727];
  assign T727 = T728;
  assign T728 = T729;
  assign T729 = io_chanxy_config[7'h72/* 114*/:7'h72/* 114*/];
  assign T730 = T731;
  assign T731 = io_chanxy_in[8'hf3/* 243*/:8'hf2/* 242*/];
  assign T732 = T733;
  assign T733 = T734;
  assign T734 = T738[T735];
  assign T735 = T736;
  assign T736 = T737;
  assign T737 = io_chanxy_config[7'h76/* 118*/:7'h73/* 115*/];
  assign T738 = T739;
  assign T739 = io_chanxy_in[8'hfc/* 252*/:8'hf4/* 244*/];
  assign T740 = T741;
  assign T741 = T742;
  assign T742 = T746[T743];
  assign T743 = T744;
  assign T744 = T745;
  assign T745 = io_chanxy_config[7'h77/* 119*/:7'h77/* 119*/];
  assign T746 = T747;
  assign T747 = io_chanxy_in[8'hfe/* 254*/:8'hfd/* 253*/];
  assign io_ipin_out = T748;
  assign T748 = T749;
  assign T749 = {T825, T750};
  assign T750 = T751;
  assign T751 = {T816, T752};
  assign T752 = T753;
  assign T753 = {T807, T754};
  assign T754 = T755;
  assign T755 = {T798, T756};
  assign T756 = T757;
  assign T757 = {T789, T758};
  assign T758 = T759;
  assign T759 = {T780, T760};
  assign T760 = T761;
  assign T761 = {T771, T762};
  assign T762 = T763;
  assign T763 = T764;
  assign T764 = T769[T765];
  assign T765 = T766;
  assign T766 = T767;
  assign T767 = {8'h0/* 0*/, T768};
  assign T768 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T769 = T770;
  assign T770 = io_ipin_in[4'hb/* 11*/:1'h0/* 0*/];
  assign T771 = T772;
  assign T772 = T773;
  assign T773 = T778[T774];
  assign T774 = T775;
  assign T775 = T776;
  assign T776 = {8'h0/* 0*/, T777};
  assign T777 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T778 = T779;
  assign T779 = io_ipin_in[5'h17/* 23*/:4'hc/* 12*/];
  assign T780 = T781;
  assign T781 = T782;
  assign T782 = T787[T783];
  assign T783 = T784;
  assign T784 = T785;
  assign T785 = {8'h0/* 0*/, T786};
  assign T786 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T787 = T788;
  assign T788 = io_ipin_in[6'h23/* 35*/:5'h18/* 24*/];
  assign T789 = T790;
  assign T790 = T791;
  assign T791 = T796[T792];
  assign T792 = T793;
  assign T793 = T794;
  assign T794 = {8'h0/* 0*/, T795};
  assign T795 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T796 = T797;
  assign T797 = io_ipin_in[6'h2f/* 47*/:6'h24/* 36*/];
  assign T798 = T799;
  assign T799 = T800;
  assign T800 = T805[T801];
  assign T801 = T802;
  assign T802 = T803;
  assign T803 = {8'h0/* 0*/, T804};
  assign T804 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T805 = T806;
  assign T806 = io_ipin_in[6'h3b/* 59*/:6'h30/* 48*/];
  assign T807 = T808;
  assign T808 = T809;
  assign T809 = T814[T810];
  assign T810 = T811;
  assign T811 = T812;
  assign T812 = {8'h0/* 0*/, T813};
  assign T813 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T814 = T815;
  assign T815 = io_ipin_in[7'h47/* 71*/:6'h3c/* 60*/];
  assign T816 = T817;
  assign T817 = T818;
  assign T818 = T823[T819];
  assign T819 = T820;
  assign T820 = T821;
  assign T821 = {8'h0/* 0*/, T822};
  assign T822 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T823 = T824;
  assign T824 = io_ipin_in[7'h53/* 83*/:7'h48/* 72*/];
  assign T825 = T826;
  assign T826 = T827;
  assign T827 = T832[T828];
  assign T828 = T829;
  assign T829 = T830;
  assign T830 = {8'h0/* 0*/, T831};
  assign T831 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T832 = T833;
  assign T833 = io_ipin_in[7'h5f/* 95*/:7'h54/* 84*/];
endmodule

module io_tile_sp_9(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [254:0] io_chanxy_in,
    output[74:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[74:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'ha/* 10*/};
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_woc(
    input [95:0] io_ipin_in,
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
  wire[11:0] T17;
  wire[11:0] T18;
  wire[11:0] T19;
  wire[3:0] T20;
  wire[11:0] T21;
  wire[11:0] T22;
  wire T23;
  wire T24;
  wire T25;
  wire[11:0] T26;
  wire[11:0] T27;
  wire[11:0] T28;
  wire[3:0] T29;
  wire[11:0] T30;
  wire[11:0] T31;
  wire T32;
  wire T33;
  wire T34;
  wire[11:0] T35;
  wire[11:0] T36;
  wire[11:0] T37;
  wire[3:0] T38;
  wire[11:0] T39;
  wire[11:0] T40;
  wire T41;
  wire T42;
  wire T43;
  wire[11:0] T44;
  wire[11:0] T45;
  wire[11:0] T46;
  wire[3:0] T47;
  wire[11:0] T48;
  wire[11:0] T49;
  wire T50;
  wire T51;
  wire T52;
  wire[11:0] T53;
  wire[11:0] T54;
  wire[11:0] T55;
  wire[3:0] T56;
  wire[11:0] T57;
  wire[11:0] T58;
  wire T59;
  wire T60;
  wire T61;
  wire[11:0] T62;
  wire[11:0] T63;
  wire[11:0] T64;
  wire[3:0] T65;
  wire[11:0] T66;
  wire[11:0] T67;
  wire T68;
  wire T69;
  wire T70;
  wire[11:0] T71;
  wire[11:0] T72;
  wire[11:0] T73;
  wire[3:0] T74;
  wire[11:0] T75;
  wire[11:0] T76;
  wire T77;
  wire T78;
  wire T79;
  wire[11:0] T80;
  wire[11:0] T81;
  wire[11:0] T82;
  wire[3:0] T83;
  wire[11:0] T84;
  wire[11:0] T85;

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
  assign T19 = {8'h0/* 0*/, T20};
  assign T20 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T21 = T22;
  assign T22 = io_ipin_in[4'hb/* 11*/:1'h0/* 0*/];
  assign T23 = T24;
  assign T24 = T25;
  assign T25 = T30[T26];
  assign T26 = T27;
  assign T27 = T28;
  assign T28 = {8'h0/* 0*/, T29};
  assign T29 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T30 = T31;
  assign T31 = io_ipin_in[5'h17/* 23*/:4'hc/* 12*/];
  assign T32 = T33;
  assign T33 = T34;
  assign T34 = T39[T35];
  assign T35 = T36;
  assign T36 = T37;
  assign T37 = {8'h0/* 0*/, T38};
  assign T38 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T39 = T40;
  assign T40 = io_ipin_in[6'h23/* 35*/:5'h18/* 24*/];
  assign T41 = T42;
  assign T42 = T43;
  assign T43 = T48[T44];
  assign T44 = T45;
  assign T45 = T46;
  assign T46 = {8'h0/* 0*/, T47};
  assign T47 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T48 = T49;
  assign T49 = io_ipin_in[6'h2f/* 47*/:6'h24/* 36*/];
  assign T50 = T51;
  assign T51 = T52;
  assign T52 = T57[T53];
  assign T53 = T54;
  assign T54 = T55;
  assign T55 = {8'h0/* 0*/, T56};
  assign T56 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T57 = T58;
  assign T58 = io_ipin_in[6'h3b/* 59*/:6'h30/* 48*/];
  assign T59 = T60;
  assign T60 = T61;
  assign T61 = T66[T62];
  assign T62 = T63;
  assign T63 = T64;
  assign T64 = {8'h0/* 0*/, T65};
  assign T65 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T66 = T67;
  assign T67 = io_ipin_in[7'h47/* 71*/:6'h3c/* 60*/];
  assign T68 = T69;
  assign T69 = T70;
  assign T70 = T75[T71];
  assign T71 = T72;
  assign T72 = T73;
  assign T73 = {8'h0/* 0*/, T74};
  assign T74 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T75 = T76;
  assign T76 = io_ipin_in[7'h53/* 83*/:7'h48/* 72*/];
  assign T77 = T78;
  assign T78 = T79;
  assign T79 = T84[T80];
  assign T80 = T81;
  assign T81 = T82;
  assign T82 = {8'h0/* 0*/, T83};
  assign T83 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T84 = T85;
  assign T85 = io_ipin_in[7'h5f/* 95*/:7'h54/* 84*/];
endmodule


module io_tile_sp_10(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_17(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_18(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_19(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'ha/* 10*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_20(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [254:0] io_chanxy_in,
    output[74:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[74:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_21(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_22(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_23(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_24(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_25(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_26(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_27(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {4'h0/* 0*/, 4'h8/* 8*/};
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_28(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {4'h0/* 0*/, 4'h9/* 9*/};
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_29(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [254:0] io_chanxy_in,
    output[74:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[74:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {4'h0/* 0*/, 4'ha/* 10*/};
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
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
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_31(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_32(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_33(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_34(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_35(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_36(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_37(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_38(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_39(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'ha/* 10*/};
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
    input [95:0] io_ipin_in,
    input [31:0] io_ipin_config,
    input [254:0] io_chanxy_in,
    input [119:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[74:0] io_chanxy_out);

  wire[74:0] T0;
  wire[74:0] T1;
  wire[73:0] T2;
  wire[73:0] T3;
  wire[72:0] T4;
  wire[72:0] T5;
  wire[71:0] T6;
  wire[71:0] T7;
  wire[70:0] T8;
  wire[70:0] T9;
  wire[69:0] T10;
  wire[69:0] T11;
  wire[68:0] T12;
  wire[68:0] T13;
  wire[67:0] T14;
  wire[67:0] T15;
  wire[66:0] T16;
  wire[66:0] T17;
  wire[65:0] T18;
  wire[65:0] T19;
  wire[64:0] T20;
  wire[64:0] T21;
  wire[63:0] T22;
  wire[63:0] T23;
  wire[62:0] T24;
  wire[62:0] T25;
  wire[61:0] T26;
  wire[61:0] T27;
  wire[60:0] T28;
  wire[60:0] T29;
  wire[59:0] T30;
  wire[59:0] T31;
  wire[58:0] T32;
  wire[58:0] T33;
  wire[57:0] T34;
  wire[57:0] T35;
  wire[56:0] T36;
  wire[56:0] T37;
  wire[55:0] T38;
  wire[55:0] T39;
  wire[54:0] T40;
  wire[54:0] T41;
  wire[53:0] T42;
  wire[53:0] T43;
  wire[52:0] T44;
  wire[52:0] T45;
  wire[51:0] T46;
  wire[51:0] T47;
  wire[50:0] T48;
  wire[50:0] T49;
  wire[49:0] T50;
  wire[49:0] T51;
  wire[48:0] T52;
  wire[48:0] T53;
  wire[47:0] T54;
  wire[47:0] T55;
  wire[46:0] T56;
  wire[46:0] T57;
  wire[45:0] T58;
  wire[45:0] T59;
  wire[44:0] T60;
  wire[44:0] T61;
  wire[43:0] T62;
  wire[43:0] T63;
  wire[42:0] T64;
  wire[42:0] T65;
  wire[41:0] T66;
  wire[41:0] T67;
  wire[40:0] T68;
  wire[40:0] T69;
  wire[39:0] T70;
  wire[39:0] T71;
  wire[38:0] T72;
  wire[38:0] T73;
  wire[37:0] T74;
  wire[37:0] T75;
  wire[36:0] T76;
  wire[36:0] T77;
  wire[35:0] T78;
  wire[35:0] T79;
  wire[34:0] T80;
  wire[34:0] T81;
  wire[33:0] T82;
  wire[33:0] T83;
  wire[32:0] T84;
  wire[32:0] T85;
  wire[31:0] T86;
  wire[31:0] T87;
  wire[30:0] T88;
  wire[30:0] T89;
  wire[29:0] T90;
  wire[29:0] T91;
  wire[28:0] T92;
  wire[28:0] T93;
  wire[27:0] T94;
  wire[27:0] T95;
  wire[26:0] T96;
  wire[26:0] T97;
  wire[25:0] T98;
  wire[25:0] T99;
  wire[24:0] T100;
  wire[24:0] T101;
  wire[23:0] T102;
  wire[23:0] T103;
  wire[22:0] T104;
  wire[22:0] T105;
  wire[21:0] T106;
  wire[21:0] T107;
  wire[20:0] T108;
  wire[20:0] T109;
  wire[19:0] T110;
  wire[19:0] T111;
  wire[18:0] T112;
  wire[18:0] T113;
  wire[17:0] T114;
  wire[17:0] T115;
  wire[16:0] T116;
  wire[16:0] T117;
  wire[15:0] T118;
  wire[15:0] T119;
  wire[14:0] T120;
  wire[14:0] T121;
  wire[13:0] T122;
  wire[13:0] T123;
  wire[12:0] T124;
  wire[12:0] T125;
  wire[11:0] T126;
  wire[11:0] T127;
  wire[10:0] T128;
  wire[10:0] T129;
  wire[9:0] T130;
  wire[9:0] T131;
  wire[8:0] T132;
  wire[8:0] T133;
  wire[7:0] T134;
  wire[7:0] T135;
  wire[6:0] T136;
  wire[6:0] T137;
  wire[5:0] T138;
  wire[5:0] T139;
  wire[4:0] T140;
  wire[4:0] T141;
  wire[3:0] T142;
  wire[3:0] T143;
  wire[2:0] T144;
  wire[2:0] T145;
  wire[1:0] T146;
  wire[1:0] T147;
  wire T148;
  wire T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire[1:0] T154;
  wire[1:0] T155;
  wire T156;
  wire T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire[1:0] T162;
  wire[1:0] T163;
  wire T164;
  wire T165;
  wire T166;
  wire[3:0] T167;
  wire[3:0] T168;
  wire[3:0] T169;
  wire[8:0] T170;
  wire[8:0] T171;
  wire T172;
  wire T173;
  wire T174;
  wire T175;
  wire T176;
  wire T177;
  wire[1:0] T178;
  wire[1:0] T179;
  wire T180;
  wire T181;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire[1:0] T186;
  wire[1:0] T187;
  wire T188;
  wire T189;
  wire T190;
  wire T191;
  wire T192;
  wire T193;
  wire[1:0] T194;
  wire[1:0] T195;
  wire T196;
  wire T197;
  wire T198;
  wire T199;
  wire T200;
  wire T201;
  wire[1:0] T202;
  wire[1:0] T203;
  wire T204;
  wire T205;
  wire T206;
  wire[3:0] T207;
  wire[3:0] T208;
  wire[3:0] T209;
  wire[8:0] T210;
  wire[8:0] T211;
  wire T212;
  wire T213;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire[1:0] T218;
  wire[1:0] T219;
  wire T220;
  wire T221;
  wire T222;
  wire T223;
  wire T224;
  wire T225;
  wire[1:0] T226;
  wire[1:0] T227;
  wire T228;
  wire T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire[1:0] T234;
  wire[1:0] T235;
  wire T236;
  wire T237;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire[1:0] T242;
  wire[1:0] T243;
  wire T244;
  wire T245;
  wire T246;
  wire[3:0] T247;
  wire[3:0] T248;
  wire[3:0] T249;
  wire[8:0] T250;
  wire[8:0] T251;
  wire T252;
  wire T253;
  wire T254;
  wire T255;
  wire T256;
  wire T257;
  wire[1:0] T258;
  wire[1:0] T259;
  wire T260;
  wire T261;
  wire T262;
  wire T263;
  wire T264;
  wire T265;
  wire[1:0] T266;
  wire[1:0] T267;
  wire T268;
  wire T269;
  wire T270;
  wire T271;
  wire T272;
  wire T273;
  wire[1:0] T274;
  wire[1:0] T275;
  wire T276;
  wire T277;
  wire T278;
  wire T279;
  wire T280;
  wire T281;
  wire[1:0] T282;
  wire[1:0] T283;
  wire T284;
  wire T285;
  wire T286;
  wire[3:0] T287;
  wire[3:0] T288;
  wire[3:0] T289;
  wire[8:0] T290;
  wire[8:0] T291;
  wire T292;
  wire T293;
  wire T294;
  wire T295;
  wire T296;
  wire T297;
  wire[1:0] T298;
  wire[1:0] T299;
  wire T300;
  wire T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire[1:0] T306;
  wire[1:0] T307;
  wire T308;
  wire T309;
  wire T310;
  wire T311;
  wire T312;
  wire T313;
  wire[1:0] T314;
  wire[1:0] T315;
  wire T316;
  wire T317;
  wire T318;
  wire T319;
  wire T320;
  wire T321;
  wire[1:0] T322;
  wire[1:0] T323;
  wire T324;
  wire T325;
  wire T326;
  wire[3:0] T327;
  wire[3:0] T328;
  wire[3:0] T329;
  wire[8:0] T330;
  wire[8:0] T331;
  wire T332;
  wire T333;
  wire T334;
  wire T335;
  wire T336;
  wire T337;
  wire[1:0] T338;
  wire[1:0] T339;
  wire T340;
  wire T341;
  wire T342;
  wire T343;
  wire T344;
  wire T345;
  wire[1:0] T346;
  wire[1:0] T347;
  wire T348;
  wire T349;
  wire T350;
  wire T351;
  wire T352;
  wire T353;
  wire[1:0] T354;
  wire[1:0] T355;
  wire T356;
  wire T357;
  wire T358;
  wire T359;
  wire T360;
  wire T361;
  wire[1:0] T362;
  wire[1:0] T363;
  wire T364;
  wire T365;
  wire T366;
  wire[3:0] T367;
  wire[3:0] T368;
  wire[3:0] T369;
  wire[8:0] T370;
  wire[8:0] T371;
  wire T372;
  wire T373;
  wire T374;
  wire T375;
  wire T376;
  wire T377;
  wire[1:0] T378;
  wire[1:0] T379;
  wire T380;
  wire T381;
  wire T382;
  wire T383;
  wire T384;
  wire T385;
  wire[1:0] T386;
  wire[1:0] T387;
  wire T388;
  wire T389;
  wire T390;
  wire T391;
  wire T392;
  wire T393;
  wire[1:0] T394;
  wire[1:0] T395;
  wire T396;
  wire T397;
  wire T398;
  wire T399;
  wire T400;
  wire T401;
  wire[1:0] T402;
  wire[1:0] T403;
  wire T404;
  wire T405;
  wire T406;
  wire[3:0] T407;
  wire[3:0] T408;
  wire[3:0] T409;
  wire[8:0] T410;
  wire[8:0] T411;
  wire T412;
  wire T413;
  wire T414;
  wire T415;
  wire T416;
  wire T417;
  wire[1:0] T418;
  wire[1:0] T419;
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
  wire T431;
  wire T432;
  wire T433;
  wire[1:0] T434;
  wire[1:0] T435;
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
  wire T463;
  wire T464;
  wire T465;
  wire[1:0] T466;
  wire[1:0] T467;
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
  wire T479;
  wire T480;
  wire T481;
  wire[1:0] T482;
  wire[1:0] T483;
  wire T484;
  wire T485;
  wire T486;
  wire[3:0] T487;
  wire[3:0] T488;
  wire[3:0] T489;
  wire[8:0] T490;
  wire[8:0] T491;
  wire T492;
  wire T493;
  wire T494;
  wire T495;
  wire T496;
  wire T497;
  wire[1:0] T498;
  wire[1:0] T499;
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
  wire T511;
  wire T512;
  wire T513;
  wire[1:0] T514;
  wire[1:0] T515;
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
  wire T543;
  wire T544;
  wire T545;
  wire[1:0] T546;
  wire[1:0] T547;
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
  wire T559;
  wire T560;
  wire T561;
  wire[1:0] T562;
  wire[1:0] T563;
  wire T564;
  wire T565;
  wire T566;
  wire[3:0] T567;
  wire[3:0] T568;
  wire[3:0] T569;
  wire[8:0] T570;
  wire[8:0] T571;
  wire T572;
  wire T573;
  wire T574;
  wire T575;
  wire T576;
  wire T577;
  wire[1:0] T578;
  wire[1:0] T579;
  wire T580;
  wire T581;
  wire T582;
  wire T583;
  wire T584;
  wire T585;
  wire[1:0] T586;
  wire[1:0] T587;
  wire T588;
  wire T589;
  wire T590;
  wire T591;
  wire T592;
  wire T593;
  wire[1:0] T594;
  wire[1:0] T595;
  wire T596;
  wire T597;
  wire T598;
  wire T599;
  wire T600;
  wire T601;
  wire[1:0] T602;
  wire[1:0] T603;
  wire T604;
  wire T605;
  wire T606;
  wire[3:0] T607;
  wire[3:0] T608;
  wire[3:0] T609;
  wire[8:0] T610;
  wire[8:0] T611;
  wire T612;
  wire T613;
  wire T614;
  wire T615;
  wire T616;
  wire T617;
  wire[1:0] T618;
  wire[1:0] T619;
  wire T620;
  wire T621;
  wire T622;
  wire T623;
  wire T624;
  wire T625;
  wire[1:0] T626;
  wire[1:0] T627;
  wire T628;
  wire T629;
  wire T630;
  wire T631;
  wire T632;
  wire T633;
  wire[1:0] T634;
  wire[1:0] T635;
  wire T636;
  wire T637;
  wire T638;
  wire T639;
  wire T640;
  wire T641;
  wire[1:0] T642;
  wire[1:0] T643;
  wire T644;
  wire T645;
  wire T646;
  wire[3:0] T647;
  wire[3:0] T648;
  wire[3:0] T649;
  wire[8:0] T650;
  wire[8:0] T651;
  wire T652;
  wire T653;
  wire T654;
  wire T655;
  wire T656;
  wire T657;
  wire[1:0] T658;
  wire[1:0] T659;
  wire T660;
  wire T661;
  wire T662;
  wire T663;
  wire T664;
  wire T665;
  wire[1:0] T666;
  wire[1:0] T667;
  wire T668;
  wire T669;
  wire T670;
  wire T671;
  wire T672;
  wire T673;
  wire[1:0] T674;
  wire[1:0] T675;
  wire T676;
  wire T677;
  wire T678;
  wire T679;
  wire T680;
  wire T681;
  wire[1:0] T682;
  wire[1:0] T683;
  wire T684;
  wire T685;
  wire T686;
  wire[3:0] T687;
  wire[3:0] T688;
  wire[3:0] T689;
  wire[8:0] T690;
  wire[8:0] T691;
  wire T692;
  wire T693;
  wire T694;
  wire T695;
  wire T696;
  wire T697;
  wire[1:0] T698;
  wire[1:0] T699;
  wire T700;
  wire T701;
  wire T702;
  wire T703;
  wire T704;
  wire T705;
  wire[1:0] T706;
  wire[1:0] T707;
  wire T708;
  wire T709;
  wire T710;
  wire T711;
  wire T712;
  wire T713;
  wire[1:0] T714;
  wire[1:0] T715;
  wire T716;
  wire T717;
  wire T718;
  wire T719;
  wire T720;
  wire T721;
  wire[1:0] T722;
  wire[1:0] T723;
  wire T724;
  wire T725;
  wire T726;
  wire[3:0] T727;
  wire[3:0] T728;
  wire[3:0] T729;
  wire[8:0] T730;
  wire[8:0] T731;
  wire T732;
  wire T733;
  wire T734;
  wire T735;
  wire T736;
  wire T737;
  wire[1:0] T738;
  wire[1:0] T739;
  wire T740;
  wire T741;
  wire T742;
  wire T743;
  wire T744;
  wire T745;
  wire[1:0] T746;
  wire[1:0] T747;
  wire[7:0] T748;
  wire[7:0] T749;
  wire[6:0] T750;
  wire[6:0] T751;
  wire[5:0] T752;
  wire[5:0] T753;
  wire[4:0] T754;
  wire[4:0] T755;
  wire[3:0] T756;
  wire[3:0] T757;
  wire[2:0] T758;
  wire[2:0] T759;
  wire[1:0] T760;
  wire[1:0] T761;
  wire T762;
  wire T763;
  wire T764;
  wire[11:0] T765;
  wire[11:0] T766;
  wire[11:0] T767;
  wire[3:0] T768;
  wire[11:0] T769;
  wire[11:0] T770;
  wire T771;
  wire T772;
  wire T773;
  wire[11:0] T774;
  wire[11:0] T775;
  wire[11:0] T776;
  wire[3:0] T777;
  wire[11:0] T778;
  wire[11:0] T779;
  wire T780;
  wire T781;
  wire T782;
  wire[11:0] T783;
  wire[11:0] T784;
  wire[11:0] T785;
  wire[3:0] T786;
  wire[11:0] T787;
  wire[11:0] T788;
  wire T789;
  wire T790;
  wire T791;
  wire[11:0] T792;
  wire[11:0] T793;
  wire[11:0] T794;
  wire[3:0] T795;
  wire[11:0] T796;
  wire[11:0] T797;
  wire T798;
  wire T799;
  wire T800;
  wire[11:0] T801;
  wire[11:0] T802;
  wire[11:0] T803;
  wire[3:0] T804;
  wire[11:0] T805;
  wire[11:0] T806;
  wire T807;
  wire T808;
  wire T809;
  wire[11:0] T810;
  wire[11:0] T811;
  wire[11:0] T812;
  wire[3:0] T813;
  wire[11:0] T814;
  wire[11:0] T815;
  wire T816;
  wire T817;
  wire T818;
  wire[11:0] T819;
  wire[11:0] T820;
  wire[11:0] T821;
  wire[3:0] T822;
  wire[11:0] T823;
  wire[11:0] T824;
  wire T825;
  wire T826;
  wire T827;
  wire[11:0] T828;
  wire[11:0] T829;
  wire[11:0] T830;
  wire[3:0] T831;
  wire[11:0] T832;
  wire[11:0] T833;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T740, T2};
  assign T2 = T3;
  assign T3 = {T732, T4};
  assign T4 = T5;
  assign T5 = {T724, T6};
  assign T6 = T7;
  assign T7 = {T716, T8};
  assign T8 = T9;
  assign T9 = {T708, T10};
  assign T10 = T11;
  assign T11 = {T700, T12};
  assign T12 = T13;
  assign T13 = {T692, T14};
  assign T14 = T15;
  assign T15 = {T684, T16};
  assign T16 = T17;
  assign T17 = {T676, T18};
  assign T18 = T19;
  assign T19 = {T668, T20};
  assign T20 = T21;
  assign T21 = {T660, T22};
  assign T22 = T23;
  assign T23 = {T652, T24};
  assign T24 = T25;
  assign T25 = {T644, T26};
  assign T26 = T27;
  assign T27 = {T636, T28};
  assign T28 = T29;
  assign T29 = {T628, T30};
  assign T30 = T31;
  assign T31 = {T620, T32};
  assign T32 = T33;
  assign T33 = {T612, T34};
  assign T34 = T35;
  assign T35 = {T604, T36};
  assign T36 = T37;
  assign T37 = {T596, T38};
  assign T38 = T39;
  assign T39 = {T588, T40};
  assign T40 = T41;
  assign T41 = {T580, T42};
  assign T42 = T43;
  assign T43 = {T572, T44};
  assign T44 = T45;
  assign T45 = {T564, T46};
  assign T46 = T47;
  assign T47 = {T556, T48};
  assign T48 = T49;
  assign T49 = {T548, T50};
  assign T50 = T51;
  assign T51 = {T540, T52};
  assign T52 = T53;
  assign T53 = {T532, T54};
  assign T54 = T55;
  assign T55 = {T524, T56};
  assign T56 = T57;
  assign T57 = {T516, T58};
  assign T58 = T59;
  assign T59 = {T508, T60};
  assign T60 = T61;
  assign T61 = {T500, T62};
  assign T62 = T63;
  assign T63 = {T492, T64};
  assign T64 = T65;
  assign T65 = {T484, T66};
  assign T66 = T67;
  assign T67 = {T476, T68};
  assign T68 = T69;
  assign T69 = {T468, T70};
  assign T70 = T71;
  assign T71 = {T460, T72};
  assign T72 = T73;
  assign T73 = {T452, T74};
  assign T74 = T75;
  assign T75 = {T444, T76};
  assign T76 = T77;
  assign T77 = {T436, T78};
  assign T78 = T79;
  assign T79 = {T428, T80};
  assign T80 = T81;
  assign T81 = {T420, T82};
  assign T82 = T83;
  assign T83 = {T412, T84};
  assign T84 = T85;
  assign T85 = {T404, T86};
  assign T86 = T87;
  assign T87 = {T396, T88};
  assign T88 = T89;
  assign T89 = {T388, T90};
  assign T90 = T91;
  assign T91 = {T380, T92};
  assign T92 = T93;
  assign T93 = {T372, T94};
  assign T94 = T95;
  assign T95 = {T364, T96};
  assign T96 = T97;
  assign T97 = {T356, T98};
  assign T98 = T99;
  assign T99 = {T348, T100};
  assign T100 = T101;
  assign T101 = {T340, T102};
  assign T102 = T103;
  assign T103 = {T332, T104};
  assign T104 = T105;
  assign T105 = {T324, T106};
  assign T106 = T107;
  assign T107 = {T316, T108};
  assign T108 = T109;
  assign T109 = {T308, T110};
  assign T110 = T111;
  assign T111 = {T300, T112};
  assign T112 = T113;
  assign T113 = {T292, T114};
  assign T114 = T115;
  assign T115 = {T284, T116};
  assign T116 = T117;
  assign T117 = {T276, T118};
  assign T118 = T119;
  assign T119 = {T268, T120};
  assign T120 = T121;
  assign T121 = {T260, T122};
  assign T122 = T123;
  assign T123 = {T252, T124};
  assign T124 = T125;
  assign T125 = {T244, T126};
  assign T126 = T127;
  assign T127 = {T236, T128};
  assign T128 = T129;
  assign T129 = {T228, T130};
  assign T130 = T131;
  assign T131 = {T220, T132};
  assign T132 = T133;
  assign T133 = {T212, T134};
  assign T134 = T135;
  assign T135 = {T204, T136};
  assign T136 = T137;
  assign T137 = {T196, T138};
  assign T138 = T139;
  assign T139 = {T188, T140};
  assign T140 = T141;
  assign T141 = {T180, T142};
  assign T142 = T143;
  assign T143 = {T172, T144};
  assign T144 = T145;
  assign T145 = {T164, T146};
  assign T146 = T147;
  assign T147 = {T156, T148};
  assign T148 = T149;
  assign T149 = T150;
  assign T150 = T154[T151];
  assign T151 = T152;
  assign T152 = T153;
  assign T153 = io_chanxy_config[1'h0/* 0*/:1'h0/* 0*/];
  assign T154 = T155;
  assign T155 = io_chanxy_in[1'h1/* 1*/:1'h0/* 0*/];
  assign T156 = T157;
  assign T157 = T158;
  assign T158 = T162[T159];
  assign T159 = T160;
  assign T160 = T161;
  assign T161 = io_chanxy_config[1'h1/* 1*/:1'h1/* 1*/];
  assign T162 = T163;
  assign T163 = io_chanxy_in[2'h3/* 3*/:2'h2/* 2*/];
  assign T164 = T165;
  assign T165 = T166;
  assign T166 = T170[T167];
  assign T167 = T168;
  assign T168 = T169;
  assign T169 = io_chanxy_config[3'h5/* 5*/:2'h2/* 2*/];
  assign T170 = T171;
  assign T171 = io_chanxy_in[4'hc/* 12*/:3'h4/* 4*/];
  assign T172 = T173;
  assign T173 = T174;
  assign T174 = T178[T175];
  assign T175 = T176;
  assign T176 = T177;
  assign T177 = io_chanxy_config[3'h6/* 6*/:3'h6/* 6*/];
  assign T178 = T179;
  assign T179 = io_chanxy_in[4'he/* 14*/:4'hd/* 13*/];
  assign T180 = T181;
  assign T181 = T182;
  assign T182 = T186[T183];
  assign T183 = T184;
  assign T184 = T185;
  assign T185 = io_chanxy_config[3'h7/* 7*/:3'h7/* 7*/];
  assign T186 = T187;
  assign T187 = io_chanxy_in[5'h10/* 16*/:4'hf/* 15*/];
  assign T188 = T189;
  assign T189 = T190;
  assign T190 = T194[T191];
  assign T191 = T192;
  assign T192 = T193;
  assign T193 = io_chanxy_config[4'h8/* 8*/:4'h8/* 8*/];
  assign T194 = T195;
  assign T195 = io_chanxy_in[5'h12/* 18*/:5'h11/* 17*/];
  assign T196 = T197;
  assign T197 = T198;
  assign T198 = T202[T199];
  assign T199 = T200;
  assign T200 = T201;
  assign T201 = io_chanxy_config[4'h9/* 9*/:4'h9/* 9*/];
  assign T202 = T203;
  assign T203 = io_chanxy_in[5'h14/* 20*/:5'h13/* 19*/];
  assign T204 = T205;
  assign T205 = T206;
  assign T206 = T210[T207];
  assign T207 = T208;
  assign T208 = T209;
  assign T209 = io_chanxy_config[4'hd/* 13*/:4'ha/* 10*/];
  assign T210 = T211;
  assign T211 = io_chanxy_in[5'h1d/* 29*/:5'h15/* 21*/];
  assign T212 = T213;
  assign T213 = T214;
  assign T214 = T218[T215];
  assign T215 = T216;
  assign T216 = T217;
  assign T217 = io_chanxy_config[4'he/* 14*/:4'he/* 14*/];
  assign T218 = T219;
  assign T219 = io_chanxy_in[5'h1f/* 31*/:5'h1e/* 30*/];
  assign T220 = T221;
  assign T221 = T222;
  assign T222 = T226[T223];
  assign T223 = T224;
  assign T224 = T225;
  assign T225 = io_chanxy_config[4'hf/* 15*/:4'hf/* 15*/];
  assign T226 = T227;
  assign T227 = io_chanxy_in[6'h21/* 33*/:6'h20/* 32*/];
  assign T228 = T229;
  assign T229 = T230;
  assign T230 = T234[T231];
  assign T231 = T232;
  assign T232 = T233;
  assign T233 = io_chanxy_config[5'h10/* 16*/:5'h10/* 16*/];
  assign T234 = T235;
  assign T235 = io_chanxy_in[6'h23/* 35*/:6'h22/* 34*/];
  assign T236 = T237;
  assign T237 = T238;
  assign T238 = T242[T239];
  assign T239 = T240;
  assign T240 = T241;
  assign T241 = io_chanxy_config[5'h11/* 17*/:5'h11/* 17*/];
  assign T242 = T243;
  assign T243 = io_chanxy_in[6'h25/* 37*/:6'h24/* 36*/];
  assign T244 = T245;
  assign T245 = T246;
  assign T246 = T250[T247];
  assign T247 = T248;
  assign T248 = T249;
  assign T249 = io_chanxy_config[5'h15/* 21*/:5'h12/* 18*/];
  assign T250 = T251;
  assign T251 = io_chanxy_in[6'h2e/* 46*/:6'h26/* 38*/];
  assign T252 = T253;
  assign T253 = T254;
  assign T254 = T258[T255];
  assign T255 = T256;
  assign T256 = T257;
  assign T257 = io_chanxy_config[5'h16/* 22*/:5'h16/* 22*/];
  assign T258 = T259;
  assign T259 = io_chanxy_in[6'h30/* 48*/:6'h2f/* 47*/];
  assign T260 = T261;
  assign T261 = T262;
  assign T262 = T266[T263];
  assign T263 = T264;
  assign T264 = T265;
  assign T265 = io_chanxy_config[5'h17/* 23*/:5'h17/* 23*/];
  assign T266 = T267;
  assign T267 = io_chanxy_in[6'h32/* 50*/:6'h31/* 49*/];
  assign T268 = T269;
  assign T269 = T270;
  assign T270 = T274[T271];
  assign T271 = T272;
  assign T272 = T273;
  assign T273 = io_chanxy_config[5'h18/* 24*/:5'h18/* 24*/];
  assign T274 = T275;
  assign T275 = io_chanxy_in[6'h34/* 52*/:6'h33/* 51*/];
  assign T276 = T277;
  assign T277 = T278;
  assign T278 = T282[T279];
  assign T279 = T280;
  assign T280 = T281;
  assign T281 = io_chanxy_config[5'h19/* 25*/:5'h19/* 25*/];
  assign T282 = T283;
  assign T283 = io_chanxy_in[6'h36/* 54*/:6'h35/* 53*/];
  assign T284 = T285;
  assign T285 = T286;
  assign T286 = T290[T287];
  assign T287 = T288;
  assign T288 = T289;
  assign T289 = io_chanxy_config[5'h1d/* 29*/:5'h1a/* 26*/];
  assign T290 = T291;
  assign T291 = io_chanxy_in[6'h3f/* 63*/:6'h37/* 55*/];
  assign T292 = T293;
  assign T293 = T294;
  assign T294 = T298[T295];
  assign T295 = T296;
  assign T296 = T297;
  assign T297 = io_chanxy_config[5'h1e/* 30*/:5'h1e/* 30*/];
  assign T298 = T299;
  assign T299 = io_chanxy_in[7'h41/* 65*/:7'h40/* 64*/];
  assign T300 = T301;
  assign T301 = T302;
  assign T302 = T306[T303];
  assign T303 = T304;
  assign T304 = T305;
  assign T305 = io_chanxy_config[5'h1f/* 31*/:5'h1f/* 31*/];
  assign T306 = T307;
  assign T307 = io_chanxy_in[7'h43/* 67*/:7'h42/* 66*/];
  assign T308 = T309;
  assign T309 = T310;
  assign T310 = T314[T311];
  assign T311 = T312;
  assign T312 = T313;
  assign T313 = io_chanxy_config[6'h20/* 32*/:6'h20/* 32*/];
  assign T314 = T315;
  assign T315 = io_chanxy_in[7'h45/* 69*/:7'h44/* 68*/];
  assign T316 = T317;
  assign T317 = T318;
  assign T318 = T322[T319];
  assign T319 = T320;
  assign T320 = T321;
  assign T321 = io_chanxy_config[6'h21/* 33*/:6'h21/* 33*/];
  assign T322 = T323;
  assign T323 = io_chanxy_in[7'h47/* 71*/:7'h46/* 70*/];
  assign T324 = T325;
  assign T325 = T326;
  assign T326 = T330[T327];
  assign T327 = T328;
  assign T328 = T329;
  assign T329 = io_chanxy_config[6'h25/* 37*/:6'h22/* 34*/];
  assign T330 = T331;
  assign T331 = io_chanxy_in[7'h50/* 80*/:7'h48/* 72*/];
  assign T332 = T333;
  assign T333 = T334;
  assign T334 = T338[T335];
  assign T335 = T336;
  assign T336 = T337;
  assign T337 = io_chanxy_config[6'h26/* 38*/:6'h26/* 38*/];
  assign T338 = T339;
  assign T339 = io_chanxy_in[7'h52/* 82*/:7'h51/* 81*/];
  assign T340 = T341;
  assign T341 = T342;
  assign T342 = T346[T343];
  assign T343 = T344;
  assign T344 = T345;
  assign T345 = io_chanxy_config[6'h27/* 39*/:6'h27/* 39*/];
  assign T346 = T347;
  assign T347 = io_chanxy_in[7'h54/* 84*/:7'h53/* 83*/];
  assign T348 = T349;
  assign T349 = T350;
  assign T350 = T354[T351];
  assign T351 = T352;
  assign T352 = T353;
  assign T353 = io_chanxy_config[6'h28/* 40*/:6'h28/* 40*/];
  assign T354 = T355;
  assign T355 = io_chanxy_in[7'h56/* 86*/:7'h55/* 85*/];
  assign T356 = T357;
  assign T357 = T358;
  assign T358 = T362[T359];
  assign T359 = T360;
  assign T360 = T361;
  assign T361 = io_chanxy_config[6'h29/* 41*/:6'h29/* 41*/];
  assign T362 = T363;
  assign T363 = io_chanxy_in[7'h58/* 88*/:7'h57/* 87*/];
  assign T364 = T365;
  assign T365 = T366;
  assign T366 = T370[T367];
  assign T367 = T368;
  assign T368 = T369;
  assign T369 = io_chanxy_config[6'h2d/* 45*/:6'h2a/* 42*/];
  assign T370 = T371;
  assign T371 = io_chanxy_in[7'h61/* 97*/:7'h59/* 89*/];
  assign T372 = T373;
  assign T373 = T374;
  assign T374 = T378[T375];
  assign T375 = T376;
  assign T376 = T377;
  assign T377 = io_chanxy_config[6'h2e/* 46*/:6'h2e/* 46*/];
  assign T378 = T379;
  assign T379 = io_chanxy_in[7'h63/* 99*/:7'h62/* 98*/];
  assign T380 = T381;
  assign T381 = T382;
  assign T382 = T386[T383];
  assign T383 = T384;
  assign T384 = T385;
  assign T385 = io_chanxy_config[6'h2f/* 47*/:6'h2f/* 47*/];
  assign T386 = T387;
  assign T387 = io_chanxy_in[7'h65/* 101*/:7'h64/* 100*/];
  assign T388 = T389;
  assign T389 = T390;
  assign T390 = T394[T391];
  assign T391 = T392;
  assign T392 = T393;
  assign T393 = io_chanxy_config[6'h30/* 48*/:6'h30/* 48*/];
  assign T394 = T395;
  assign T395 = io_chanxy_in[7'h67/* 103*/:7'h66/* 102*/];
  assign T396 = T397;
  assign T397 = T398;
  assign T398 = T402[T399];
  assign T399 = T400;
  assign T400 = T401;
  assign T401 = io_chanxy_config[6'h31/* 49*/:6'h31/* 49*/];
  assign T402 = T403;
  assign T403 = io_chanxy_in[7'h69/* 105*/:7'h68/* 104*/];
  assign T404 = T405;
  assign T405 = T406;
  assign T406 = T410[T407];
  assign T407 = T408;
  assign T408 = T409;
  assign T409 = io_chanxy_config[6'h35/* 53*/:6'h32/* 50*/];
  assign T410 = T411;
  assign T411 = io_chanxy_in[7'h72/* 114*/:7'h6a/* 106*/];
  assign T412 = T413;
  assign T413 = T414;
  assign T414 = T418[T415];
  assign T415 = T416;
  assign T416 = T417;
  assign T417 = io_chanxy_config[6'h36/* 54*/:6'h36/* 54*/];
  assign T418 = T419;
  assign T419 = io_chanxy_in[7'h74/* 116*/:7'h73/* 115*/];
  assign T420 = T421;
  assign T421 = T422;
  assign T422 = T426[T423];
  assign T423 = T424;
  assign T424 = T425;
  assign T425 = io_chanxy_config[6'h37/* 55*/:6'h37/* 55*/];
  assign T426 = T427;
  assign T427 = io_chanxy_in[7'h76/* 118*/:7'h75/* 117*/];
  assign T428 = T429;
  assign T429 = T430;
  assign T430 = T434[T431];
  assign T431 = T432;
  assign T432 = T433;
  assign T433 = io_chanxy_config[6'h38/* 56*/:6'h38/* 56*/];
  assign T434 = T435;
  assign T435 = io_chanxy_in[7'h78/* 120*/:7'h77/* 119*/];
  assign T436 = T437;
  assign T437 = T438;
  assign T438 = T442[T439];
  assign T439 = T440;
  assign T440 = T441;
  assign T441 = io_chanxy_config[6'h39/* 57*/:6'h39/* 57*/];
  assign T442 = T443;
  assign T443 = io_chanxy_in[7'h7a/* 122*/:7'h79/* 121*/];
  assign T444 = T445;
  assign T445 = T446;
  assign T446 = T450[T447];
  assign T447 = T448;
  assign T448 = T449;
  assign T449 = io_chanxy_config[6'h3d/* 61*/:6'h3a/* 58*/];
  assign T450 = T451;
  assign T451 = io_chanxy_in[8'h83/* 131*/:7'h7b/* 123*/];
  assign T452 = T453;
  assign T453 = T454;
  assign T454 = T458[T455];
  assign T455 = T456;
  assign T456 = T457;
  assign T457 = io_chanxy_config[6'h3e/* 62*/:6'h3e/* 62*/];
  assign T458 = T459;
  assign T459 = io_chanxy_in[8'h85/* 133*/:8'h84/* 132*/];
  assign T460 = T461;
  assign T461 = T462;
  assign T462 = T466[T463];
  assign T463 = T464;
  assign T464 = T465;
  assign T465 = io_chanxy_config[6'h3f/* 63*/:6'h3f/* 63*/];
  assign T466 = T467;
  assign T467 = io_chanxy_in[8'h87/* 135*/:8'h86/* 134*/];
  assign T468 = T469;
  assign T469 = T470;
  assign T470 = T474[T471];
  assign T471 = T472;
  assign T472 = T473;
  assign T473 = io_chanxy_config[7'h40/* 64*/:7'h40/* 64*/];
  assign T474 = T475;
  assign T475 = io_chanxy_in[8'h89/* 137*/:8'h88/* 136*/];
  assign T476 = T477;
  assign T477 = T478;
  assign T478 = T482[T479];
  assign T479 = T480;
  assign T480 = T481;
  assign T481 = io_chanxy_config[7'h41/* 65*/:7'h41/* 65*/];
  assign T482 = T483;
  assign T483 = io_chanxy_in[8'h8b/* 139*/:8'h8a/* 138*/];
  assign T484 = T485;
  assign T485 = T486;
  assign T486 = T490[T487];
  assign T487 = T488;
  assign T488 = T489;
  assign T489 = io_chanxy_config[7'h45/* 69*/:7'h42/* 66*/];
  assign T490 = T491;
  assign T491 = io_chanxy_in[8'h94/* 148*/:8'h8c/* 140*/];
  assign T492 = T493;
  assign T493 = T494;
  assign T494 = T498[T495];
  assign T495 = T496;
  assign T496 = T497;
  assign T497 = io_chanxy_config[7'h46/* 70*/:7'h46/* 70*/];
  assign T498 = T499;
  assign T499 = io_chanxy_in[8'h96/* 150*/:8'h95/* 149*/];
  assign T500 = T501;
  assign T501 = T502;
  assign T502 = T506[T503];
  assign T503 = T504;
  assign T504 = T505;
  assign T505 = io_chanxy_config[7'h47/* 71*/:7'h47/* 71*/];
  assign T506 = T507;
  assign T507 = io_chanxy_in[8'h98/* 152*/:8'h97/* 151*/];
  assign T508 = T509;
  assign T509 = T510;
  assign T510 = T514[T511];
  assign T511 = T512;
  assign T512 = T513;
  assign T513 = io_chanxy_config[7'h48/* 72*/:7'h48/* 72*/];
  assign T514 = T515;
  assign T515 = io_chanxy_in[8'h9a/* 154*/:8'h99/* 153*/];
  assign T516 = T517;
  assign T517 = T518;
  assign T518 = T522[T519];
  assign T519 = T520;
  assign T520 = T521;
  assign T521 = io_chanxy_config[7'h49/* 73*/:7'h49/* 73*/];
  assign T522 = T523;
  assign T523 = io_chanxy_in[8'h9c/* 156*/:8'h9b/* 155*/];
  assign T524 = T525;
  assign T525 = T526;
  assign T526 = T530[T527];
  assign T527 = T528;
  assign T528 = T529;
  assign T529 = io_chanxy_config[7'h4d/* 77*/:7'h4a/* 74*/];
  assign T530 = T531;
  assign T531 = io_chanxy_in[8'ha5/* 165*/:8'h9d/* 157*/];
  assign T532 = T533;
  assign T533 = T534;
  assign T534 = T538[T535];
  assign T535 = T536;
  assign T536 = T537;
  assign T537 = io_chanxy_config[7'h4e/* 78*/:7'h4e/* 78*/];
  assign T538 = T539;
  assign T539 = io_chanxy_in[8'ha7/* 167*/:8'ha6/* 166*/];
  assign T540 = T541;
  assign T541 = T542;
  assign T542 = T546[T543];
  assign T543 = T544;
  assign T544 = T545;
  assign T545 = io_chanxy_config[7'h4f/* 79*/:7'h4f/* 79*/];
  assign T546 = T547;
  assign T547 = io_chanxy_in[8'ha9/* 169*/:8'ha8/* 168*/];
  assign T548 = T549;
  assign T549 = T550;
  assign T550 = T554[T551];
  assign T551 = T552;
  assign T552 = T553;
  assign T553 = io_chanxy_config[7'h50/* 80*/:7'h50/* 80*/];
  assign T554 = T555;
  assign T555 = io_chanxy_in[8'hab/* 171*/:8'haa/* 170*/];
  assign T556 = T557;
  assign T557 = T558;
  assign T558 = T562[T559];
  assign T559 = T560;
  assign T560 = T561;
  assign T561 = io_chanxy_config[7'h51/* 81*/:7'h51/* 81*/];
  assign T562 = T563;
  assign T563 = io_chanxy_in[8'had/* 173*/:8'hac/* 172*/];
  assign T564 = T565;
  assign T565 = T566;
  assign T566 = T570[T567];
  assign T567 = T568;
  assign T568 = T569;
  assign T569 = io_chanxy_config[7'h55/* 85*/:7'h52/* 82*/];
  assign T570 = T571;
  assign T571 = io_chanxy_in[8'hb6/* 182*/:8'hae/* 174*/];
  assign T572 = T573;
  assign T573 = T574;
  assign T574 = T578[T575];
  assign T575 = T576;
  assign T576 = T577;
  assign T577 = io_chanxy_config[7'h56/* 86*/:7'h56/* 86*/];
  assign T578 = T579;
  assign T579 = io_chanxy_in[8'hb8/* 184*/:8'hb7/* 183*/];
  assign T580 = T581;
  assign T581 = T582;
  assign T582 = T586[T583];
  assign T583 = T584;
  assign T584 = T585;
  assign T585 = io_chanxy_config[7'h57/* 87*/:7'h57/* 87*/];
  assign T586 = T587;
  assign T587 = io_chanxy_in[8'hba/* 186*/:8'hb9/* 185*/];
  assign T588 = T589;
  assign T589 = T590;
  assign T590 = T594[T591];
  assign T591 = T592;
  assign T592 = T593;
  assign T593 = io_chanxy_config[7'h58/* 88*/:7'h58/* 88*/];
  assign T594 = T595;
  assign T595 = io_chanxy_in[8'hbc/* 188*/:8'hbb/* 187*/];
  assign T596 = T597;
  assign T597 = T598;
  assign T598 = T602[T599];
  assign T599 = T600;
  assign T600 = T601;
  assign T601 = io_chanxy_config[7'h59/* 89*/:7'h59/* 89*/];
  assign T602 = T603;
  assign T603 = io_chanxy_in[8'hbe/* 190*/:8'hbd/* 189*/];
  assign T604 = T605;
  assign T605 = T606;
  assign T606 = T610[T607];
  assign T607 = T608;
  assign T608 = T609;
  assign T609 = io_chanxy_config[7'h5d/* 93*/:7'h5a/* 90*/];
  assign T610 = T611;
  assign T611 = io_chanxy_in[8'hc7/* 199*/:8'hbf/* 191*/];
  assign T612 = T613;
  assign T613 = T614;
  assign T614 = T618[T615];
  assign T615 = T616;
  assign T616 = T617;
  assign T617 = io_chanxy_config[7'h5e/* 94*/:7'h5e/* 94*/];
  assign T618 = T619;
  assign T619 = io_chanxy_in[8'hc9/* 201*/:8'hc8/* 200*/];
  assign T620 = T621;
  assign T621 = T622;
  assign T622 = T626[T623];
  assign T623 = T624;
  assign T624 = T625;
  assign T625 = io_chanxy_config[7'h5f/* 95*/:7'h5f/* 95*/];
  assign T626 = T627;
  assign T627 = io_chanxy_in[8'hcb/* 203*/:8'hca/* 202*/];
  assign T628 = T629;
  assign T629 = T630;
  assign T630 = T634[T631];
  assign T631 = T632;
  assign T632 = T633;
  assign T633 = io_chanxy_config[7'h60/* 96*/:7'h60/* 96*/];
  assign T634 = T635;
  assign T635 = io_chanxy_in[8'hcd/* 205*/:8'hcc/* 204*/];
  assign T636 = T637;
  assign T637 = T638;
  assign T638 = T642[T639];
  assign T639 = T640;
  assign T640 = T641;
  assign T641 = io_chanxy_config[7'h61/* 97*/:7'h61/* 97*/];
  assign T642 = T643;
  assign T643 = io_chanxy_in[8'hcf/* 207*/:8'hce/* 206*/];
  assign T644 = T645;
  assign T645 = T646;
  assign T646 = T650[T647];
  assign T647 = T648;
  assign T648 = T649;
  assign T649 = io_chanxy_config[7'h65/* 101*/:7'h62/* 98*/];
  assign T650 = T651;
  assign T651 = io_chanxy_in[8'hd8/* 216*/:8'hd0/* 208*/];
  assign T652 = T653;
  assign T653 = T654;
  assign T654 = T658[T655];
  assign T655 = T656;
  assign T656 = T657;
  assign T657 = io_chanxy_config[7'h66/* 102*/:7'h66/* 102*/];
  assign T658 = T659;
  assign T659 = io_chanxy_in[8'hda/* 218*/:8'hd9/* 217*/];
  assign T660 = T661;
  assign T661 = T662;
  assign T662 = T666[T663];
  assign T663 = T664;
  assign T664 = T665;
  assign T665 = io_chanxy_config[7'h67/* 103*/:7'h67/* 103*/];
  assign T666 = T667;
  assign T667 = io_chanxy_in[8'hdc/* 220*/:8'hdb/* 219*/];
  assign T668 = T669;
  assign T669 = T670;
  assign T670 = T674[T671];
  assign T671 = T672;
  assign T672 = T673;
  assign T673 = io_chanxy_config[7'h68/* 104*/:7'h68/* 104*/];
  assign T674 = T675;
  assign T675 = io_chanxy_in[8'hde/* 222*/:8'hdd/* 221*/];
  assign T676 = T677;
  assign T677 = T678;
  assign T678 = T682[T679];
  assign T679 = T680;
  assign T680 = T681;
  assign T681 = io_chanxy_config[7'h69/* 105*/:7'h69/* 105*/];
  assign T682 = T683;
  assign T683 = io_chanxy_in[8'he0/* 224*/:8'hdf/* 223*/];
  assign T684 = T685;
  assign T685 = T686;
  assign T686 = T690[T687];
  assign T687 = T688;
  assign T688 = T689;
  assign T689 = io_chanxy_config[7'h6d/* 109*/:7'h6a/* 106*/];
  assign T690 = T691;
  assign T691 = io_chanxy_in[8'he9/* 233*/:8'he1/* 225*/];
  assign T692 = T693;
  assign T693 = T694;
  assign T694 = T698[T695];
  assign T695 = T696;
  assign T696 = T697;
  assign T697 = io_chanxy_config[7'h6e/* 110*/:7'h6e/* 110*/];
  assign T698 = T699;
  assign T699 = io_chanxy_in[8'heb/* 235*/:8'hea/* 234*/];
  assign T700 = T701;
  assign T701 = T702;
  assign T702 = T706[T703];
  assign T703 = T704;
  assign T704 = T705;
  assign T705 = io_chanxy_config[7'h6f/* 111*/:7'h6f/* 111*/];
  assign T706 = T707;
  assign T707 = io_chanxy_in[8'hed/* 237*/:8'hec/* 236*/];
  assign T708 = T709;
  assign T709 = T710;
  assign T710 = T714[T711];
  assign T711 = T712;
  assign T712 = T713;
  assign T713 = io_chanxy_config[7'h70/* 112*/:7'h70/* 112*/];
  assign T714 = T715;
  assign T715 = io_chanxy_in[8'hef/* 239*/:8'hee/* 238*/];
  assign T716 = T717;
  assign T717 = T718;
  assign T718 = T722[T719];
  assign T719 = T720;
  assign T720 = T721;
  assign T721 = io_chanxy_config[7'h71/* 113*/:7'h71/* 113*/];
  assign T722 = T723;
  assign T723 = io_chanxy_in[8'hf1/* 241*/:8'hf0/* 240*/];
  assign T724 = T725;
  assign T725 = T726;
  assign T726 = T730[T727];
  assign T727 = T728;
  assign T728 = T729;
  assign T729 = io_chanxy_config[7'h75/* 117*/:7'h72/* 114*/];
  assign T730 = T731;
  assign T731 = io_chanxy_in[8'hfa/* 250*/:8'hf2/* 242*/];
  assign T732 = T733;
  assign T733 = T734;
  assign T734 = T738[T735];
  assign T735 = T736;
  assign T736 = T737;
  assign T737 = io_chanxy_config[7'h76/* 118*/:7'h76/* 118*/];
  assign T738 = T739;
  assign T739 = io_chanxy_in[8'hfc/* 252*/:8'hfb/* 251*/];
  assign T740 = T741;
  assign T741 = T742;
  assign T742 = T746[T743];
  assign T743 = T744;
  assign T744 = T745;
  assign T745 = io_chanxy_config[7'h77/* 119*/:7'h77/* 119*/];
  assign T746 = T747;
  assign T747 = io_chanxy_in[8'hfe/* 254*/:8'hfd/* 253*/];
  assign io_ipin_out = T748;
  assign T748 = T749;
  assign T749 = {T825, T750};
  assign T750 = T751;
  assign T751 = {T816, T752};
  assign T752 = T753;
  assign T753 = {T807, T754};
  assign T754 = T755;
  assign T755 = {T798, T756};
  assign T756 = T757;
  assign T757 = {T789, T758};
  assign T758 = T759;
  assign T759 = {T780, T760};
  assign T760 = T761;
  assign T761 = {T771, T762};
  assign T762 = T763;
  assign T763 = T764;
  assign T764 = T769[T765];
  assign T765 = T766;
  assign T766 = T767;
  assign T767 = {8'h0/* 0*/, T768};
  assign T768 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T769 = T770;
  assign T770 = io_ipin_in[4'hb/* 11*/:1'h0/* 0*/];
  assign T771 = T772;
  assign T772 = T773;
  assign T773 = T778[T774];
  assign T774 = T775;
  assign T775 = T776;
  assign T776 = {8'h0/* 0*/, T777};
  assign T777 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T778 = T779;
  assign T779 = io_ipin_in[5'h17/* 23*/:4'hc/* 12*/];
  assign T780 = T781;
  assign T781 = T782;
  assign T782 = T787[T783];
  assign T783 = T784;
  assign T784 = T785;
  assign T785 = {8'h0/* 0*/, T786};
  assign T786 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T787 = T788;
  assign T788 = io_ipin_in[6'h23/* 35*/:5'h18/* 24*/];
  assign T789 = T790;
  assign T790 = T791;
  assign T791 = T796[T792];
  assign T792 = T793;
  assign T793 = T794;
  assign T794 = {8'h0/* 0*/, T795};
  assign T795 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T796 = T797;
  assign T797 = io_ipin_in[6'h2f/* 47*/:6'h24/* 36*/];
  assign T798 = T799;
  assign T799 = T800;
  assign T800 = T805[T801];
  assign T801 = T802;
  assign T802 = T803;
  assign T803 = {8'h0/* 0*/, T804};
  assign T804 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T805 = T806;
  assign T806 = io_ipin_in[6'h3b/* 59*/:6'h30/* 48*/];
  assign T807 = T808;
  assign T808 = T809;
  assign T809 = T814[T810];
  assign T810 = T811;
  assign T811 = T812;
  assign T812 = {8'h0/* 0*/, T813};
  assign T813 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T814 = T815;
  assign T815 = io_ipin_in[7'h47/* 71*/:6'h3c/* 60*/];
  assign T816 = T817;
  assign T817 = T818;
  assign T818 = T823[T819];
  assign T819 = T820;
  assign T820 = T821;
  assign T821 = {8'h0/* 0*/, T822};
  assign T822 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T823 = T824;
  assign T824 = io_ipin_in[7'h53/* 83*/:7'h48/* 72*/];
  assign T825 = T826;
  assign T826 = T827;
  assign T827 = T832[T828];
  assign T828 = T829;
  assign T829 = T830;
  assign T830 = {8'h0/* 0*/, T831};
  assign T831 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T832 = T833;
  assign T833 = io_ipin_in[7'h5f/* 95*/:7'h54/* 84*/];
endmodule


module io_tile_sp_0(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [254:0] io_chanxy_in,
    output[74:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[74:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_wc_1(
    input [95:0] io_ipin_in,
    input [31:0] io_ipin_config,
    input [269:0] io_chanxy_in,
    input [119:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[29:0] io_chanxy_out);

  wire[29:0] T0;
  wire[29:0] T1;
  wire[28:0] T2;
  wire[28:0] T3;
  wire[27:0] T4;
  wire[27:0] T5;
  wire[26:0] T6;
  wire[26:0] T7;
  wire[25:0] T8;
  wire[25:0] T9;
  wire[24:0] T10;
  wire[24:0] T11;
  wire[23:0] T12;
  wire[23:0] T13;
  wire[22:0] T14;
  wire[22:0] T15;
  wire[21:0] T16;
  wire[21:0] T17;
  wire[20:0] T18;
  wire[20:0] T19;
  wire[19:0] T20;
  wire[19:0] T21;
  wire[18:0] T22;
  wire[18:0] T23;
  wire[17:0] T24;
  wire[17:0] T25;
  wire[16:0] T26;
  wire[16:0] T27;
  wire[15:0] T28;
  wire[15:0] T29;
  wire[14:0] T30;
  wire[14:0] T31;
  wire[13:0] T32;
  wire[13:0] T33;
  wire[12:0] T34;
  wire[12:0] T35;
  wire[11:0] T36;
  wire[11:0] T37;
  wire[10:0] T38;
  wire[10:0] T39;
  wire[9:0] T40;
  wire[9:0] T41;
  wire[8:0] T42;
  wire[8:0] T43;
  wire[7:0] T44;
  wire[7:0] T45;
  wire[6:0] T46;
  wire[6:0] T47;
  wire[5:0] T48;
  wire[5:0] T49;
  wire[4:0] T50;
  wire[4:0] T51;
  wire[3:0] T52;
  wire[3:0] T53;
  wire[2:0] T54;
  wire[2:0] T55;
  wire[1:0] T56;
  wire[1:0] T57;
  wire T58;
  wire T59;
  wire T60;
  wire[3:0] T61;
  wire[3:0] T62;
  wire[3:0] T63;
  wire[8:0] T64;
  wire[8:0] T65;
  wire T66;
  wire T67;
  wire T68;
  wire[3:0] T69;
  wire[3:0] T70;
  wire[3:0] T71;
  wire[8:0] T72;
  wire[8:0] T73;
  wire T74;
  wire T75;
  wire T76;
  wire[3:0] T77;
  wire[3:0] T78;
  wire[3:0] T79;
  wire[8:0] T80;
  wire[8:0] T81;
  wire T82;
  wire T83;
  wire T84;
  wire[3:0] T85;
  wire[3:0] T86;
  wire[3:0] T87;
  wire[8:0] T88;
  wire[8:0] T89;
  wire T90;
  wire T91;
  wire T92;
  wire[3:0] T93;
  wire[3:0] T94;
  wire[3:0] T95;
  wire[8:0] T96;
  wire[8:0] T97;
  wire T98;
  wire T99;
  wire T100;
  wire[3:0] T101;
  wire[3:0] T102;
  wire[3:0] T103;
  wire[8:0] T104;
  wire[8:0] T105;
  wire T106;
  wire T107;
  wire T108;
  wire[3:0] T109;
  wire[3:0] T110;
  wire[3:0] T111;
  wire[8:0] T112;
  wire[8:0] T113;
  wire T114;
  wire T115;
  wire T116;
  wire[3:0] T117;
  wire[3:0] T118;
  wire[3:0] T119;
  wire[8:0] T120;
  wire[8:0] T121;
  wire T122;
  wire T123;
  wire T124;
  wire[3:0] T125;
  wire[3:0] T126;
  wire[3:0] T127;
  wire[8:0] T128;
  wire[8:0] T129;
  wire T130;
  wire T131;
  wire T132;
  wire[3:0] T133;
  wire[3:0] T134;
  wire[3:0] T135;
  wire[8:0] T136;
  wire[8:0] T137;
  wire T138;
  wire T139;
  wire T140;
  wire[3:0] T141;
  wire[3:0] T142;
  wire[3:0] T143;
  wire[8:0] T144;
  wire[8:0] T145;
  wire T146;
  wire T147;
  wire T148;
  wire[3:0] T149;
  wire[3:0] T150;
  wire[3:0] T151;
  wire[8:0] T152;
  wire[8:0] T153;
  wire T154;
  wire T155;
  wire T156;
  wire[3:0] T157;
  wire[3:0] T158;
  wire[3:0] T159;
  wire[8:0] T160;
  wire[8:0] T161;
  wire T162;
  wire T163;
  wire T164;
  wire[3:0] T165;
  wire[3:0] T166;
  wire[3:0] T167;
  wire[8:0] T168;
  wire[8:0] T169;
  wire T170;
  wire T171;
  wire T172;
  wire[3:0] T173;
  wire[3:0] T174;
  wire[3:0] T175;
  wire[8:0] T176;
  wire[8:0] T177;
  wire T178;
  wire T179;
  wire T180;
  wire[3:0] T181;
  wire[3:0] T182;
  wire[3:0] T183;
  wire[8:0] T184;
  wire[8:0] T185;
  wire T186;
  wire T187;
  wire T188;
  wire[3:0] T189;
  wire[3:0] T190;
  wire[3:0] T191;
  wire[8:0] T192;
  wire[8:0] T193;
  wire T194;
  wire T195;
  wire T196;
  wire[3:0] T197;
  wire[3:0] T198;
  wire[3:0] T199;
  wire[8:0] T200;
  wire[8:0] T201;
  wire T202;
  wire T203;
  wire T204;
  wire[3:0] T205;
  wire[3:0] T206;
  wire[3:0] T207;
  wire[8:0] T208;
  wire[8:0] T209;
  wire T210;
  wire T211;
  wire T212;
  wire[3:0] T213;
  wire[3:0] T214;
  wire[3:0] T215;
  wire[8:0] T216;
  wire[8:0] T217;
  wire T218;
  wire T219;
  wire T220;
  wire[3:0] T221;
  wire[3:0] T222;
  wire[3:0] T223;
  wire[8:0] T224;
  wire[8:0] T225;
  wire T226;
  wire T227;
  wire T228;
  wire[3:0] T229;
  wire[3:0] T230;
  wire[3:0] T231;
  wire[8:0] T232;
  wire[8:0] T233;
  wire T234;
  wire T235;
  wire T236;
  wire[3:0] T237;
  wire[3:0] T238;
  wire[3:0] T239;
  wire[8:0] T240;
  wire[8:0] T241;
  wire T242;
  wire T243;
  wire T244;
  wire[3:0] T245;
  wire[3:0] T246;
  wire[3:0] T247;
  wire[8:0] T248;
  wire[8:0] T249;
  wire T250;
  wire T251;
  wire T252;
  wire[3:0] T253;
  wire[3:0] T254;
  wire[3:0] T255;
  wire[8:0] T256;
  wire[8:0] T257;
  wire T258;
  wire T259;
  wire T260;
  wire[3:0] T261;
  wire[3:0] T262;
  wire[3:0] T263;
  wire[8:0] T264;
  wire[8:0] T265;
  wire T266;
  wire T267;
  wire T268;
  wire[3:0] T269;
  wire[3:0] T270;
  wire[3:0] T271;
  wire[8:0] T272;
  wire[8:0] T273;
  wire T274;
  wire T275;
  wire T276;
  wire[3:0] T277;
  wire[3:0] T278;
  wire[3:0] T279;
  wire[8:0] T280;
  wire[8:0] T281;
  wire T282;
  wire T283;
  wire T284;
  wire[3:0] T285;
  wire[3:0] T286;
  wire[3:0] T287;
  wire[8:0] T288;
  wire[8:0] T289;
  wire T290;
  wire T291;
  wire T292;
  wire[3:0] T293;
  wire[3:0] T294;
  wire[3:0] T295;
  wire[8:0] T296;
  wire[8:0] T297;
  wire[7:0] T298;
  wire[7:0] T299;
  wire[6:0] T300;
  wire[6:0] T301;
  wire[5:0] T302;
  wire[5:0] T303;
  wire[4:0] T304;
  wire[4:0] T305;
  wire[3:0] T306;
  wire[3:0] T307;
  wire[2:0] T308;
  wire[2:0] T309;
  wire[1:0] T310;
  wire[1:0] T311;
  wire T312;
  wire T313;
  wire T314;
  wire[11:0] T315;
  wire[11:0] T316;
  wire[11:0] T317;
  wire[3:0] T318;
  wire[11:0] T319;
  wire[11:0] T320;
  wire T321;
  wire T322;
  wire T323;
  wire[11:0] T324;
  wire[11:0] T325;
  wire[11:0] T326;
  wire[3:0] T327;
  wire[11:0] T328;
  wire[11:0] T329;
  wire T330;
  wire T331;
  wire T332;
  wire[11:0] T333;
  wire[11:0] T334;
  wire[11:0] T335;
  wire[3:0] T336;
  wire[11:0] T337;
  wire[11:0] T338;
  wire T339;
  wire T340;
  wire T341;
  wire[11:0] T342;
  wire[11:0] T343;
  wire[11:0] T344;
  wire[3:0] T345;
  wire[11:0] T346;
  wire[11:0] T347;
  wire T348;
  wire T349;
  wire T350;
  wire[11:0] T351;
  wire[11:0] T352;
  wire[11:0] T353;
  wire[3:0] T354;
  wire[11:0] T355;
  wire[11:0] T356;
  wire T357;
  wire T358;
  wire T359;
  wire[11:0] T360;
  wire[11:0] T361;
  wire[11:0] T362;
  wire[3:0] T363;
  wire[11:0] T364;
  wire[11:0] T365;
  wire T366;
  wire T367;
  wire T368;
  wire[11:0] T369;
  wire[11:0] T370;
  wire[11:0] T371;
  wire[3:0] T372;
  wire[11:0] T373;
  wire[11:0] T374;
  wire T375;
  wire T376;
  wire T377;
  wire[11:0] T378;
  wire[11:0] T379;
  wire[11:0] T380;
  wire[3:0] T381;
  wire[11:0] T382;
  wire[11:0] T383;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T290, T2};
  assign T2 = T3;
  assign T3 = {T282, T4};
  assign T4 = T5;
  assign T5 = {T274, T6};
  assign T6 = T7;
  assign T7 = {T266, T8};
  assign T8 = T9;
  assign T9 = {T258, T10};
  assign T10 = T11;
  assign T11 = {T250, T12};
  assign T12 = T13;
  assign T13 = {T242, T14};
  assign T14 = T15;
  assign T15 = {T234, T16};
  assign T16 = T17;
  assign T17 = {T226, T18};
  assign T18 = T19;
  assign T19 = {T218, T20};
  assign T20 = T21;
  assign T21 = {T210, T22};
  assign T22 = T23;
  assign T23 = {T202, T24};
  assign T24 = T25;
  assign T25 = {T194, T26};
  assign T26 = T27;
  assign T27 = {T186, T28};
  assign T28 = T29;
  assign T29 = {T178, T30};
  assign T30 = T31;
  assign T31 = {T170, T32};
  assign T32 = T33;
  assign T33 = {T162, T34};
  assign T34 = T35;
  assign T35 = {T154, T36};
  assign T36 = T37;
  assign T37 = {T146, T38};
  assign T38 = T39;
  assign T39 = {T138, T40};
  assign T40 = T41;
  assign T41 = {T130, T42};
  assign T42 = T43;
  assign T43 = {T122, T44};
  assign T44 = T45;
  assign T45 = {T114, T46};
  assign T46 = T47;
  assign T47 = {T106, T48};
  assign T48 = T49;
  assign T49 = {T98, T50};
  assign T50 = T51;
  assign T51 = {T90, T52};
  assign T52 = T53;
  assign T53 = {T82, T54};
  assign T54 = T55;
  assign T55 = {T74, T56};
  assign T56 = T57;
  assign T57 = {T66, T58};
  assign T58 = T59;
  assign T59 = T60;
  assign T60 = T64[T61];
  assign T61 = T62;
  assign T62 = T63;
  assign T63 = io_chanxy_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T64 = T65;
  assign T65 = io_chanxy_in[4'h8/* 8*/:1'h0/* 0*/];
  assign T66 = T67;
  assign T67 = T68;
  assign T68 = T72[T69];
  assign T69 = T70;
  assign T70 = T71;
  assign T71 = io_chanxy_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T72 = T73;
  assign T73 = io_chanxy_in[5'h11/* 17*/:4'h9/* 9*/];
  assign T74 = T75;
  assign T75 = T76;
  assign T76 = T80[T77];
  assign T77 = T78;
  assign T78 = T79;
  assign T79 = io_chanxy_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T80 = T81;
  assign T81 = io_chanxy_in[5'h1a/* 26*/:5'h12/* 18*/];
  assign T82 = T83;
  assign T83 = T84;
  assign T84 = T88[T85];
  assign T85 = T86;
  assign T86 = T87;
  assign T87 = io_chanxy_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T88 = T89;
  assign T89 = io_chanxy_in[6'h23/* 35*/:5'h1b/* 27*/];
  assign T90 = T91;
  assign T91 = T92;
  assign T92 = T96[T93];
  assign T93 = T94;
  assign T94 = T95;
  assign T95 = io_chanxy_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T96 = T97;
  assign T97 = io_chanxy_in[6'h2c/* 44*/:6'h24/* 36*/];
  assign T98 = T99;
  assign T99 = T100;
  assign T100 = T104[T101];
  assign T101 = T102;
  assign T102 = T103;
  assign T103 = io_chanxy_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T104 = T105;
  assign T105 = io_chanxy_in[6'h35/* 53*/:6'h2d/* 45*/];
  assign T106 = T107;
  assign T107 = T108;
  assign T108 = T112[T109];
  assign T109 = T110;
  assign T110 = T111;
  assign T111 = io_chanxy_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T112 = T113;
  assign T113 = io_chanxy_in[6'h3e/* 62*/:6'h36/* 54*/];
  assign T114 = T115;
  assign T115 = T116;
  assign T116 = T120[T117];
  assign T117 = T118;
  assign T118 = T119;
  assign T119 = io_chanxy_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T120 = T121;
  assign T121 = io_chanxy_in[7'h47/* 71*/:6'h3f/* 63*/];
  assign T122 = T123;
  assign T123 = T124;
  assign T124 = T128[T125];
  assign T125 = T126;
  assign T126 = T127;
  assign T127 = io_chanxy_config[6'h23/* 35*/:6'h20/* 32*/];
  assign T128 = T129;
  assign T129 = io_chanxy_in[7'h50/* 80*/:7'h48/* 72*/];
  assign T130 = T131;
  assign T131 = T132;
  assign T132 = T136[T133];
  assign T133 = T134;
  assign T134 = T135;
  assign T135 = io_chanxy_config[6'h27/* 39*/:6'h24/* 36*/];
  assign T136 = T137;
  assign T137 = io_chanxy_in[7'h59/* 89*/:7'h51/* 81*/];
  assign T138 = T139;
  assign T139 = T140;
  assign T140 = T144[T141];
  assign T141 = T142;
  assign T142 = T143;
  assign T143 = io_chanxy_config[6'h2b/* 43*/:6'h28/* 40*/];
  assign T144 = T145;
  assign T145 = io_chanxy_in[7'h62/* 98*/:7'h5a/* 90*/];
  assign T146 = T147;
  assign T147 = T148;
  assign T148 = T152[T149];
  assign T149 = T150;
  assign T150 = T151;
  assign T151 = io_chanxy_config[6'h2f/* 47*/:6'h2c/* 44*/];
  assign T152 = T153;
  assign T153 = io_chanxy_in[7'h6b/* 107*/:7'h63/* 99*/];
  assign T154 = T155;
  assign T155 = T156;
  assign T156 = T160[T157];
  assign T157 = T158;
  assign T158 = T159;
  assign T159 = io_chanxy_config[6'h33/* 51*/:6'h30/* 48*/];
  assign T160 = T161;
  assign T161 = io_chanxy_in[7'h74/* 116*/:7'h6c/* 108*/];
  assign T162 = T163;
  assign T163 = T164;
  assign T164 = T168[T165];
  assign T165 = T166;
  assign T166 = T167;
  assign T167 = io_chanxy_config[6'h37/* 55*/:6'h34/* 52*/];
  assign T168 = T169;
  assign T169 = io_chanxy_in[7'h7d/* 125*/:7'h75/* 117*/];
  assign T170 = T171;
  assign T171 = T172;
  assign T172 = T176[T173];
  assign T173 = T174;
  assign T174 = T175;
  assign T175 = io_chanxy_config[6'h3b/* 59*/:6'h38/* 56*/];
  assign T176 = T177;
  assign T177 = io_chanxy_in[8'h86/* 134*/:7'h7e/* 126*/];
  assign T178 = T179;
  assign T179 = T180;
  assign T180 = T184[T181];
  assign T181 = T182;
  assign T182 = T183;
  assign T183 = io_chanxy_config[6'h3f/* 63*/:6'h3c/* 60*/];
  assign T184 = T185;
  assign T185 = io_chanxy_in[8'h8f/* 143*/:8'h87/* 135*/];
  assign T186 = T187;
  assign T187 = T188;
  assign T188 = T192[T189];
  assign T189 = T190;
  assign T190 = T191;
  assign T191 = io_chanxy_config[7'h43/* 67*/:7'h40/* 64*/];
  assign T192 = T193;
  assign T193 = io_chanxy_in[8'h98/* 152*/:8'h90/* 144*/];
  assign T194 = T195;
  assign T195 = T196;
  assign T196 = T200[T197];
  assign T197 = T198;
  assign T198 = T199;
  assign T199 = io_chanxy_config[7'h47/* 71*/:7'h44/* 68*/];
  assign T200 = T201;
  assign T201 = io_chanxy_in[8'ha1/* 161*/:8'h99/* 153*/];
  assign T202 = T203;
  assign T203 = T204;
  assign T204 = T208[T205];
  assign T205 = T206;
  assign T206 = T207;
  assign T207 = io_chanxy_config[7'h4b/* 75*/:7'h48/* 72*/];
  assign T208 = T209;
  assign T209 = io_chanxy_in[8'haa/* 170*/:8'ha2/* 162*/];
  assign T210 = T211;
  assign T211 = T212;
  assign T212 = T216[T213];
  assign T213 = T214;
  assign T214 = T215;
  assign T215 = io_chanxy_config[7'h4f/* 79*/:7'h4c/* 76*/];
  assign T216 = T217;
  assign T217 = io_chanxy_in[8'hb3/* 179*/:8'hab/* 171*/];
  assign T218 = T219;
  assign T219 = T220;
  assign T220 = T224[T221];
  assign T221 = T222;
  assign T222 = T223;
  assign T223 = io_chanxy_config[7'h53/* 83*/:7'h50/* 80*/];
  assign T224 = T225;
  assign T225 = io_chanxy_in[8'hbc/* 188*/:8'hb4/* 180*/];
  assign T226 = T227;
  assign T227 = T228;
  assign T228 = T232[T229];
  assign T229 = T230;
  assign T230 = T231;
  assign T231 = io_chanxy_config[7'h57/* 87*/:7'h54/* 84*/];
  assign T232 = T233;
  assign T233 = io_chanxy_in[8'hc5/* 197*/:8'hbd/* 189*/];
  assign T234 = T235;
  assign T235 = T236;
  assign T236 = T240[T237];
  assign T237 = T238;
  assign T238 = T239;
  assign T239 = io_chanxy_config[7'h5b/* 91*/:7'h58/* 88*/];
  assign T240 = T241;
  assign T241 = io_chanxy_in[8'hce/* 206*/:8'hc6/* 198*/];
  assign T242 = T243;
  assign T243 = T244;
  assign T244 = T248[T245];
  assign T245 = T246;
  assign T246 = T247;
  assign T247 = io_chanxy_config[7'h5f/* 95*/:7'h5c/* 92*/];
  assign T248 = T249;
  assign T249 = io_chanxy_in[8'hd7/* 215*/:8'hcf/* 207*/];
  assign T250 = T251;
  assign T251 = T252;
  assign T252 = T256[T253];
  assign T253 = T254;
  assign T254 = T255;
  assign T255 = io_chanxy_config[7'h63/* 99*/:7'h60/* 96*/];
  assign T256 = T257;
  assign T257 = io_chanxy_in[8'he0/* 224*/:8'hd8/* 216*/];
  assign T258 = T259;
  assign T259 = T260;
  assign T260 = T264[T261];
  assign T261 = T262;
  assign T262 = T263;
  assign T263 = io_chanxy_config[7'h67/* 103*/:7'h64/* 100*/];
  assign T264 = T265;
  assign T265 = io_chanxy_in[8'he9/* 233*/:8'he1/* 225*/];
  assign T266 = T267;
  assign T267 = T268;
  assign T268 = T272[T269];
  assign T269 = T270;
  assign T270 = T271;
  assign T271 = io_chanxy_config[7'h6b/* 107*/:7'h68/* 104*/];
  assign T272 = T273;
  assign T273 = io_chanxy_in[8'hf2/* 242*/:8'hea/* 234*/];
  assign T274 = T275;
  assign T275 = T276;
  assign T276 = T280[T277];
  assign T277 = T278;
  assign T278 = T279;
  assign T279 = io_chanxy_config[7'h6f/* 111*/:7'h6c/* 108*/];
  assign T280 = T281;
  assign T281 = io_chanxy_in[8'hfb/* 251*/:8'hf3/* 243*/];
  assign T282 = T283;
  assign T283 = T284;
  assign T284 = T288[T285];
  assign T285 = T286;
  assign T286 = T287;
  assign T287 = io_chanxy_config[7'h73/* 115*/:7'h70/* 112*/];
  assign T288 = T289;
  assign T289 = io_chanxy_in[9'h104/* 260*/:8'hfc/* 252*/];
  assign T290 = T291;
  assign T291 = T292;
  assign T292 = T296[T293];
  assign T293 = T294;
  assign T294 = T295;
  assign T295 = io_chanxy_config[7'h77/* 119*/:7'h74/* 116*/];
  assign T296 = T297;
  assign T297 = io_chanxy_in[9'h10d/* 269*/:9'h105/* 261*/];
  assign io_ipin_out = T298;
  assign T298 = T299;
  assign T299 = {T375, T300};
  assign T300 = T301;
  assign T301 = {T366, T302};
  assign T302 = T303;
  assign T303 = {T357, T304};
  assign T304 = T305;
  assign T305 = {T348, T306};
  assign T306 = T307;
  assign T307 = {T339, T308};
  assign T308 = T309;
  assign T309 = {T330, T310};
  assign T310 = T311;
  assign T311 = {T321, T312};
  assign T312 = T313;
  assign T313 = T314;
  assign T314 = T319[T315];
  assign T315 = T316;
  assign T316 = T317;
  assign T317 = {8'h0/* 0*/, T318};
  assign T318 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T319 = T320;
  assign T320 = io_ipin_in[4'hb/* 11*/:1'h0/* 0*/];
  assign T321 = T322;
  assign T322 = T323;
  assign T323 = T328[T324];
  assign T324 = T325;
  assign T325 = T326;
  assign T326 = {8'h0/* 0*/, T327};
  assign T327 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T328 = T329;
  assign T329 = io_ipin_in[5'h17/* 23*/:4'hc/* 12*/];
  assign T330 = T331;
  assign T331 = T332;
  assign T332 = T337[T333];
  assign T333 = T334;
  assign T334 = T335;
  assign T335 = {8'h0/* 0*/, T336};
  assign T336 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T337 = T338;
  assign T338 = io_ipin_in[6'h23/* 35*/:5'h18/* 24*/];
  assign T339 = T340;
  assign T340 = T341;
  assign T341 = T346[T342];
  assign T342 = T343;
  assign T343 = T344;
  assign T344 = {8'h0/* 0*/, T345};
  assign T345 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T346 = T347;
  assign T347 = io_ipin_in[6'h2f/* 47*/:6'h24/* 36*/];
  assign T348 = T349;
  assign T349 = T350;
  assign T350 = T355[T351];
  assign T351 = T352;
  assign T352 = T353;
  assign T353 = {8'h0/* 0*/, T354};
  assign T354 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T355 = T356;
  assign T356 = io_ipin_in[6'h3b/* 59*/:6'h30/* 48*/];
  assign T357 = T358;
  assign T358 = T359;
  assign T359 = T364[T360];
  assign T360 = T361;
  assign T361 = T362;
  assign T362 = {8'h0/* 0*/, T363};
  assign T363 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T364 = T365;
  assign T365 = io_ipin_in[7'h47/* 71*/:6'h3c/* 60*/];
  assign T366 = T367;
  assign T367 = T368;
  assign T368 = T373[T369];
  assign T369 = T370;
  assign T370 = T371;
  assign T371 = {8'h0/* 0*/, T372};
  assign T372 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T373 = T374;
  assign T374 = io_ipin_in[7'h53/* 83*/:7'h48/* 72*/];
  assign T375 = T376;
  assign T376 = T377;
  assign T377 = T382[T378];
  assign T378 = T379;
  assign T379 = T380;
  assign T380 = {8'h0/* 0*/, T381};
  assign T381 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T382 = T383;
  assign T383 = io_ipin_in[7'h5f/* 95*/:7'h54/* 84*/];
endmodule

module io_tile_sp_1(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_2(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_3(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_4(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_5(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_6(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_7(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h8/* 8*/};
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_8(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'h9/* 9*/};
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_wc_2(
    input [95:0] io_ipin_in,
    input [31:0] io_ipin_config,
    input [254:0] io_chanxy_in,
    input [119:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[74:0] io_chanxy_out);

  wire[74:0] T0;
  wire[74:0] T1;
  wire[73:0] T2;
  wire[73:0] T3;
  wire[72:0] T4;
  wire[72:0] T5;
  wire[71:0] T6;
  wire[71:0] T7;
  wire[70:0] T8;
  wire[70:0] T9;
  wire[69:0] T10;
  wire[69:0] T11;
  wire[68:0] T12;
  wire[68:0] T13;
  wire[67:0] T14;
  wire[67:0] T15;
  wire[66:0] T16;
  wire[66:0] T17;
  wire[65:0] T18;
  wire[65:0] T19;
  wire[64:0] T20;
  wire[64:0] T21;
  wire[63:0] T22;
  wire[63:0] T23;
  wire[62:0] T24;
  wire[62:0] T25;
  wire[61:0] T26;
  wire[61:0] T27;
  wire[60:0] T28;
  wire[60:0] T29;
  wire[59:0] T30;
  wire[59:0] T31;
  wire[58:0] T32;
  wire[58:0] T33;
  wire[57:0] T34;
  wire[57:0] T35;
  wire[56:0] T36;
  wire[56:0] T37;
  wire[55:0] T38;
  wire[55:0] T39;
  wire[54:0] T40;
  wire[54:0] T41;
  wire[53:0] T42;
  wire[53:0] T43;
  wire[52:0] T44;
  wire[52:0] T45;
  wire[51:0] T46;
  wire[51:0] T47;
  wire[50:0] T48;
  wire[50:0] T49;
  wire[49:0] T50;
  wire[49:0] T51;
  wire[48:0] T52;
  wire[48:0] T53;
  wire[47:0] T54;
  wire[47:0] T55;
  wire[46:0] T56;
  wire[46:0] T57;
  wire[45:0] T58;
  wire[45:0] T59;
  wire[44:0] T60;
  wire[44:0] T61;
  wire[43:0] T62;
  wire[43:0] T63;
  wire[42:0] T64;
  wire[42:0] T65;
  wire[41:0] T66;
  wire[41:0] T67;
  wire[40:0] T68;
  wire[40:0] T69;
  wire[39:0] T70;
  wire[39:0] T71;
  wire[38:0] T72;
  wire[38:0] T73;
  wire[37:0] T74;
  wire[37:0] T75;
  wire[36:0] T76;
  wire[36:0] T77;
  wire[35:0] T78;
  wire[35:0] T79;
  wire[34:0] T80;
  wire[34:0] T81;
  wire[33:0] T82;
  wire[33:0] T83;
  wire[32:0] T84;
  wire[32:0] T85;
  wire[31:0] T86;
  wire[31:0] T87;
  wire[30:0] T88;
  wire[30:0] T89;
  wire[29:0] T90;
  wire[29:0] T91;
  wire[28:0] T92;
  wire[28:0] T93;
  wire[27:0] T94;
  wire[27:0] T95;
  wire[26:0] T96;
  wire[26:0] T97;
  wire[25:0] T98;
  wire[25:0] T99;
  wire[24:0] T100;
  wire[24:0] T101;
  wire[23:0] T102;
  wire[23:0] T103;
  wire[22:0] T104;
  wire[22:0] T105;
  wire[21:0] T106;
  wire[21:0] T107;
  wire[20:0] T108;
  wire[20:0] T109;
  wire[19:0] T110;
  wire[19:0] T111;
  wire[18:0] T112;
  wire[18:0] T113;
  wire[17:0] T114;
  wire[17:0] T115;
  wire[16:0] T116;
  wire[16:0] T117;
  wire[15:0] T118;
  wire[15:0] T119;
  wire[14:0] T120;
  wire[14:0] T121;
  wire[13:0] T122;
  wire[13:0] T123;
  wire[12:0] T124;
  wire[12:0] T125;
  wire[11:0] T126;
  wire[11:0] T127;
  wire[10:0] T128;
  wire[10:0] T129;
  wire[9:0] T130;
  wire[9:0] T131;
  wire[8:0] T132;
  wire[8:0] T133;
  wire[7:0] T134;
  wire[7:0] T135;
  wire[6:0] T136;
  wire[6:0] T137;
  wire[5:0] T138;
  wire[5:0] T139;
  wire[4:0] T140;
  wire[4:0] T141;
  wire[3:0] T142;
  wire[3:0] T143;
  wire[2:0] T144;
  wire[2:0] T145;
  wire[1:0] T146;
  wire[1:0] T147;
  wire T148;
  wire T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire[1:0] T154;
  wire[1:0] T155;
  wire T156;
  wire T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire[1:0] T162;
  wire[1:0] T163;
  wire T164;
  wire T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  wire[1:0] T170;
  wire[1:0] T171;
  wire T172;
  wire T173;
  wire T174;
  wire T175;
  wire T176;
  wire T177;
  wire[1:0] T178;
  wire[1:0] T179;
  wire T180;
  wire T181;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire[1:0] T186;
  wire[1:0] T187;
  wire T188;
  wire T189;
  wire T190;
  wire T191;
  wire T192;
  wire T193;
  wire[1:0] T194;
  wire[1:0] T195;
  wire T196;
  wire T197;
  wire T198;
  wire T199;
  wire T200;
  wire T201;
  wire[1:0] T202;
  wire[1:0] T203;
  wire T204;
  wire T205;
  wire T206;
  wire T207;
  wire T208;
  wire T209;
  wire[1:0] T210;
  wire[1:0] T211;
  wire T212;
  wire T213;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire[1:0] T218;
  wire[1:0] T219;
  wire T220;
  wire T221;
  wire T222;
  wire T223;
  wire T224;
  wire T225;
  wire[1:0] T226;
  wire[1:0] T227;
  wire T228;
  wire T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire[1:0] T234;
  wire[1:0] T235;
  wire T236;
  wire T237;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire[1:0] T242;
  wire[1:0] T243;
  wire T244;
  wire T245;
  wire T246;
  wire T247;
  wire T248;
  wire T249;
  wire[1:0] T250;
  wire[1:0] T251;
  wire T252;
  wire T253;
  wire T254;
  wire T255;
  wire T256;
  wire T257;
  wire[1:0] T258;
  wire[1:0] T259;
  wire T260;
  wire T261;
  wire T262;
  wire T263;
  wire T264;
  wire T265;
  wire[1:0] T266;
  wire[1:0] T267;
  wire T268;
  wire T269;
  wire T270;
  wire T271;
  wire T272;
  wire T273;
  wire[1:0] T274;
  wire[1:0] T275;
  wire T276;
  wire T277;
  wire T278;
  wire T279;
  wire T280;
  wire T281;
  wire[1:0] T282;
  wire[1:0] T283;
  wire T284;
  wire T285;
  wire T286;
  wire T287;
  wire T288;
  wire T289;
  wire[1:0] T290;
  wire[1:0] T291;
  wire T292;
  wire T293;
  wire T294;
  wire T295;
  wire T296;
  wire T297;
  wire[1:0] T298;
  wire[1:0] T299;
  wire T300;
  wire T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire[1:0] T306;
  wire[1:0] T307;
  wire T308;
  wire T309;
  wire T310;
  wire T311;
  wire T312;
  wire T313;
  wire[1:0] T314;
  wire[1:0] T315;
  wire T316;
  wire T317;
  wire T318;
  wire T319;
  wire T320;
  wire T321;
  wire[1:0] T322;
  wire[1:0] T323;
  wire T324;
  wire T325;
  wire T326;
  wire T327;
  wire T328;
  wire T329;
  wire[1:0] T330;
  wire[1:0] T331;
  wire T332;
  wire T333;
  wire T334;
  wire T335;
  wire T336;
  wire T337;
  wire[1:0] T338;
  wire[1:0] T339;
  wire T340;
  wire T341;
  wire T342;
  wire T343;
  wire T344;
  wire T345;
  wire[1:0] T346;
  wire[1:0] T347;
  wire T348;
  wire T349;
  wire T350;
  wire T351;
  wire T352;
  wire T353;
  wire[1:0] T354;
  wire[1:0] T355;
  wire T356;
  wire T357;
  wire T358;
  wire T359;
  wire T360;
  wire T361;
  wire[1:0] T362;
  wire[1:0] T363;
  wire T364;
  wire T365;
  wire T366;
  wire T367;
  wire T368;
  wire T369;
  wire[1:0] T370;
  wire[1:0] T371;
  wire T372;
  wire T373;
  wire T374;
  wire T375;
  wire T376;
  wire T377;
  wire[1:0] T378;
  wire[1:0] T379;
  wire T380;
  wire T381;
  wire T382;
  wire T383;
  wire T384;
  wire T385;
  wire[1:0] T386;
  wire[1:0] T387;
  wire T388;
  wire T389;
  wire T390;
  wire T391;
  wire T392;
  wire T393;
  wire[1:0] T394;
  wire[1:0] T395;
  wire T396;
  wire T397;
  wire T398;
  wire T399;
  wire T400;
  wire T401;
  wire[1:0] T402;
  wire[1:0] T403;
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
  wire T415;
  wire T416;
  wire T417;
  wire[1:0] T418;
  wire[1:0] T419;
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
  wire T431;
  wire T432;
  wire T433;
  wire[1:0] T434;
  wire[1:0] T435;
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
  wire T447;
  wire T448;
  wire T449;
  wire[1:0] T450;
  wire[1:0] T451;
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
  wire T463;
  wire T464;
  wire T465;
  wire[1:0] T466;
  wire[1:0] T467;
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
  wire T479;
  wire T480;
  wire T481;
  wire[1:0] T482;
  wire[1:0] T483;
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
  wire T495;
  wire T496;
  wire T497;
  wire[1:0] T498;
  wire[1:0] T499;
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
  wire[3:0] T543;
  wire[3:0] T544;
  wire[3:0] T545;
  wire[8:0] T546;
  wire[8:0] T547;
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
  wire[3:0] T559;
  wire[3:0] T560;
  wire[3:0] T561;
  wire[8:0] T562;
  wire[8:0] T563;
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
  wire[3:0] T575;
  wire[3:0] T576;
  wire[3:0] T577;
  wire[8:0] T578;
  wire[8:0] T579;
  wire T580;
  wire T581;
  wire T582;
  wire T583;
  wire T584;
  wire T585;
  wire[1:0] T586;
  wire[1:0] T587;
  wire T588;
  wire T589;
  wire T590;
  wire[3:0] T591;
  wire[3:0] T592;
  wire[3:0] T593;
  wire[8:0] T594;
  wire[8:0] T595;
  wire T596;
  wire T597;
  wire T598;
  wire T599;
  wire T600;
  wire T601;
  wire[1:0] T602;
  wire[1:0] T603;
  wire T604;
  wire T605;
  wire T606;
  wire[3:0] T607;
  wire[3:0] T608;
  wire[3:0] T609;
  wire[8:0] T610;
  wire[8:0] T611;
  wire T612;
  wire T613;
  wire T614;
  wire T615;
  wire T616;
  wire T617;
  wire[1:0] T618;
  wire[1:0] T619;
  wire T620;
  wire T621;
  wire T622;
  wire[3:0] T623;
  wire[3:0] T624;
  wire[3:0] T625;
  wire[8:0] T626;
  wire[8:0] T627;
  wire T628;
  wire T629;
  wire T630;
  wire T631;
  wire T632;
  wire T633;
  wire[1:0] T634;
  wire[1:0] T635;
  wire T636;
  wire T637;
  wire T638;
  wire[3:0] T639;
  wire[3:0] T640;
  wire[3:0] T641;
  wire[8:0] T642;
  wire[8:0] T643;
  wire T644;
  wire T645;
  wire T646;
  wire T647;
  wire T648;
  wire T649;
  wire[1:0] T650;
  wire[1:0] T651;
  wire T652;
  wire T653;
  wire T654;
  wire[3:0] T655;
  wire[3:0] T656;
  wire[3:0] T657;
  wire[8:0] T658;
  wire[8:0] T659;
  wire T660;
  wire T661;
  wire T662;
  wire T663;
  wire T664;
  wire T665;
  wire[1:0] T666;
  wire[1:0] T667;
  wire T668;
  wire T669;
  wire T670;
  wire[3:0] T671;
  wire[3:0] T672;
  wire[3:0] T673;
  wire[8:0] T674;
  wire[8:0] T675;
  wire T676;
  wire T677;
  wire T678;
  wire T679;
  wire T680;
  wire T681;
  wire[1:0] T682;
  wire[1:0] T683;
  wire T684;
  wire T685;
  wire T686;
  wire[3:0] T687;
  wire[3:0] T688;
  wire[3:0] T689;
  wire[8:0] T690;
  wire[8:0] T691;
  wire T692;
  wire T693;
  wire T694;
  wire T695;
  wire T696;
  wire T697;
  wire[1:0] T698;
  wire[1:0] T699;
  wire T700;
  wire T701;
  wire T702;
  wire[3:0] T703;
  wire[3:0] T704;
  wire[3:0] T705;
  wire[8:0] T706;
  wire[8:0] T707;
  wire T708;
  wire T709;
  wire T710;
  wire T711;
  wire T712;
  wire T713;
  wire[1:0] T714;
  wire[1:0] T715;
  wire T716;
  wire T717;
  wire T718;
  wire[3:0] T719;
  wire[3:0] T720;
  wire[3:0] T721;
  wire[8:0] T722;
  wire[8:0] T723;
  wire T724;
  wire T725;
  wire T726;
  wire T727;
  wire T728;
  wire T729;
  wire[1:0] T730;
  wire[1:0] T731;
  wire T732;
  wire T733;
  wire T734;
  wire[3:0] T735;
  wire[3:0] T736;
  wire[3:0] T737;
  wire[8:0] T738;
  wire[8:0] T739;
  wire T740;
  wire T741;
  wire T742;
  wire T743;
  wire T744;
  wire T745;
  wire[1:0] T746;
  wire[1:0] T747;
  wire[7:0] T748;
  wire[7:0] T749;
  wire[6:0] T750;
  wire[6:0] T751;
  wire[5:0] T752;
  wire[5:0] T753;
  wire[4:0] T754;
  wire[4:0] T755;
  wire[3:0] T756;
  wire[3:0] T757;
  wire[2:0] T758;
  wire[2:0] T759;
  wire[1:0] T760;
  wire[1:0] T761;
  wire T762;
  wire T763;
  wire T764;
  wire[11:0] T765;
  wire[11:0] T766;
  wire[11:0] T767;
  wire[3:0] T768;
  wire[11:0] T769;
  wire[11:0] T770;
  wire T771;
  wire T772;
  wire T773;
  wire[11:0] T774;
  wire[11:0] T775;
  wire[11:0] T776;
  wire[3:0] T777;
  wire[11:0] T778;
  wire[11:0] T779;
  wire T780;
  wire T781;
  wire T782;
  wire[11:0] T783;
  wire[11:0] T784;
  wire[11:0] T785;
  wire[3:0] T786;
  wire[11:0] T787;
  wire[11:0] T788;
  wire T789;
  wire T790;
  wire T791;
  wire[11:0] T792;
  wire[11:0] T793;
  wire[11:0] T794;
  wire[3:0] T795;
  wire[11:0] T796;
  wire[11:0] T797;
  wire T798;
  wire T799;
  wire T800;
  wire[11:0] T801;
  wire[11:0] T802;
  wire[11:0] T803;
  wire[3:0] T804;
  wire[11:0] T805;
  wire[11:0] T806;
  wire T807;
  wire T808;
  wire T809;
  wire[11:0] T810;
  wire[11:0] T811;
  wire[11:0] T812;
  wire[3:0] T813;
  wire[11:0] T814;
  wire[11:0] T815;
  wire T816;
  wire T817;
  wire T818;
  wire[11:0] T819;
  wire[11:0] T820;
  wire[11:0] T821;
  wire[3:0] T822;
  wire[11:0] T823;
  wire[11:0] T824;
  wire T825;
  wire T826;
  wire T827;
  wire[11:0] T828;
  wire[11:0] T829;
  wire[11:0] T830;
  wire[3:0] T831;
  wire[11:0] T832;
  wire[11:0] T833;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T740, T2};
  assign T2 = T3;
  assign T3 = {T732, T4};
  assign T4 = T5;
  assign T5 = {T724, T6};
  assign T6 = T7;
  assign T7 = {T716, T8};
  assign T8 = T9;
  assign T9 = {T708, T10};
  assign T10 = T11;
  assign T11 = {T700, T12};
  assign T12 = T13;
  assign T13 = {T692, T14};
  assign T14 = T15;
  assign T15 = {T684, T16};
  assign T16 = T17;
  assign T17 = {T676, T18};
  assign T18 = T19;
  assign T19 = {T668, T20};
  assign T20 = T21;
  assign T21 = {T660, T22};
  assign T22 = T23;
  assign T23 = {T652, T24};
  assign T24 = T25;
  assign T25 = {T644, T26};
  assign T26 = T27;
  assign T27 = {T636, T28};
  assign T28 = T29;
  assign T29 = {T628, T30};
  assign T30 = T31;
  assign T31 = {T620, T32};
  assign T32 = T33;
  assign T33 = {T612, T34};
  assign T34 = T35;
  assign T35 = {T604, T36};
  assign T36 = T37;
  assign T37 = {T596, T38};
  assign T38 = T39;
  assign T39 = {T588, T40};
  assign T40 = T41;
  assign T41 = {T580, T42};
  assign T42 = T43;
  assign T43 = {T572, T44};
  assign T44 = T45;
  assign T45 = {T564, T46};
  assign T46 = T47;
  assign T47 = {T556, T48};
  assign T48 = T49;
  assign T49 = {T548, T50};
  assign T50 = T51;
  assign T51 = {T540, T52};
  assign T52 = T53;
  assign T53 = {T532, T54};
  assign T54 = T55;
  assign T55 = {T524, T56};
  assign T56 = T57;
  assign T57 = {T516, T58};
  assign T58 = T59;
  assign T59 = {T508, T60};
  assign T60 = T61;
  assign T61 = {T500, T62};
  assign T62 = T63;
  assign T63 = {T492, T64};
  assign T64 = T65;
  assign T65 = {T484, T66};
  assign T66 = T67;
  assign T67 = {T476, T68};
  assign T68 = T69;
  assign T69 = {T468, T70};
  assign T70 = T71;
  assign T71 = {T460, T72};
  assign T72 = T73;
  assign T73 = {T452, T74};
  assign T74 = T75;
  assign T75 = {T444, T76};
  assign T76 = T77;
  assign T77 = {T436, T78};
  assign T78 = T79;
  assign T79 = {T428, T80};
  assign T80 = T81;
  assign T81 = {T420, T82};
  assign T82 = T83;
  assign T83 = {T412, T84};
  assign T84 = T85;
  assign T85 = {T404, T86};
  assign T86 = T87;
  assign T87 = {T396, T88};
  assign T88 = T89;
  assign T89 = {T388, T90};
  assign T90 = T91;
  assign T91 = {T380, T92};
  assign T92 = T93;
  assign T93 = {T372, T94};
  assign T94 = T95;
  assign T95 = {T364, T96};
  assign T96 = T97;
  assign T97 = {T356, T98};
  assign T98 = T99;
  assign T99 = {T348, T100};
  assign T100 = T101;
  assign T101 = {T340, T102};
  assign T102 = T103;
  assign T103 = {T332, T104};
  assign T104 = T105;
  assign T105 = {T324, T106};
  assign T106 = T107;
  assign T107 = {T316, T108};
  assign T108 = T109;
  assign T109 = {T308, T110};
  assign T110 = T111;
  assign T111 = {T300, T112};
  assign T112 = T113;
  assign T113 = {T292, T114};
  assign T114 = T115;
  assign T115 = {T284, T116};
  assign T116 = T117;
  assign T117 = {T276, T118};
  assign T118 = T119;
  assign T119 = {T268, T120};
  assign T120 = T121;
  assign T121 = {T260, T122};
  assign T122 = T123;
  assign T123 = {T252, T124};
  assign T124 = T125;
  assign T125 = {T244, T126};
  assign T126 = T127;
  assign T127 = {T236, T128};
  assign T128 = T129;
  assign T129 = {T228, T130};
  assign T130 = T131;
  assign T131 = {T220, T132};
  assign T132 = T133;
  assign T133 = {T212, T134};
  assign T134 = T135;
  assign T135 = {T204, T136};
  assign T136 = T137;
  assign T137 = {T196, T138};
  assign T138 = T139;
  assign T139 = {T188, T140};
  assign T140 = T141;
  assign T141 = {T180, T142};
  assign T142 = T143;
  assign T143 = {T172, T144};
  assign T144 = T145;
  assign T145 = {T164, T146};
  assign T146 = T147;
  assign T147 = {T156, T148};
  assign T148 = T149;
  assign T149 = T150;
  assign T150 = T154[T151];
  assign T151 = T152;
  assign T152 = T153;
  assign T153 = io_chanxy_config[1'h0/* 0*/:1'h0/* 0*/];
  assign T154 = T155;
  assign T155 = io_chanxy_in[1'h1/* 1*/:1'h0/* 0*/];
  assign T156 = T157;
  assign T157 = T158;
  assign T158 = T162[T159];
  assign T159 = T160;
  assign T160 = T161;
  assign T161 = io_chanxy_config[1'h1/* 1*/:1'h1/* 1*/];
  assign T162 = T163;
  assign T163 = io_chanxy_in[2'h3/* 3*/:2'h2/* 2*/];
  assign T164 = T165;
  assign T165 = T166;
  assign T166 = T170[T167];
  assign T167 = T168;
  assign T168 = T169;
  assign T169 = io_chanxy_config[2'h2/* 2*/:2'h2/* 2*/];
  assign T170 = T171;
  assign T171 = io_chanxy_in[3'h5/* 5*/:3'h4/* 4*/];
  assign T172 = T173;
  assign T173 = T174;
  assign T174 = T178[T175];
  assign T175 = T176;
  assign T176 = T177;
  assign T177 = io_chanxy_config[2'h3/* 3*/:2'h3/* 3*/];
  assign T178 = T179;
  assign T179 = io_chanxy_in[3'h7/* 7*/:3'h6/* 6*/];
  assign T180 = T181;
  assign T181 = T182;
  assign T182 = T186[T183];
  assign T183 = T184;
  assign T184 = T185;
  assign T185 = io_chanxy_config[3'h4/* 4*/:3'h4/* 4*/];
  assign T186 = T187;
  assign T187 = io_chanxy_in[4'h9/* 9*/:4'h8/* 8*/];
  assign T188 = T189;
  assign T189 = T190;
  assign T190 = T194[T191];
  assign T191 = T192;
  assign T192 = T193;
  assign T193 = io_chanxy_config[3'h5/* 5*/:3'h5/* 5*/];
  assign T194 = T195;
  assign T195 = io_chanxy_in[4'hb/* 11*/:4'ha/* 10*/];
  assign T196 = T197;
  assign T197 = T198;
  assign T198 = T202[T199];
  assign T199 = T200;
  assign T200 = T201;
  assign T201 = io_chanxy_config[3'h6/* 6*/:3'h6/* 6*/];
  assign T202 = T203;
  assign T203 = io_chanxy_in[4'hd/* 13*/:4'hc/* 12*/];
  assign T204 = T205;
  assign T205 = T206;
  assign T206 = T210[T207];
  assign T207 = T208;
  assign T208 = T209;
  assign T209 = io_chanxy_config[3'h7/* 7*/:3'h7/* 7*/];
  assign T210 = T211;
  assign T211 = io_chanxy_in[4'hf/* 15*/:4'he/* 14*/];
  assign T212 = T213;
  assign T213 = T214;
  assign T214 = T218[T215];
  assign T215 = T216;
  assign T216 = T217;
  assign T217 = io_chanxy_config[4'h8/* 8*/:4'h8/* 8*/];
  assign T218 = T219;
  assign T219 = io_chanxy_in[5'h11/* 17*/:5'h10/* 16*/];
  assign T220 = T221;
  assign T221 = T222;
  assign T222 = T226[T223];
  assign T223 = T224;
  assign T224 = T225;
  assign T225 = io_chanxy_config[4'h9/* 9*/:4'h9/* 9*/];
  assign T226 = T227;
  assign T227 = io_chanxy_in[5'h13/* 19*/:5'h12/* 18*/];
  assign T228 = T229;
  assign T229 = T230;
  assign T230 = T234[T231];
  assign T231 = T232;
  assign T232 = T233;
  assign T233 = io_chanxy_config[4'ha/* 10*/:4'ha/* 10*/];
  assign T234 = T235;
  assign T235 = io_chanxy_in[5'h15/* 21*/:5'h14/* 20*/];
  assign T236 = T237;
  assign T237 = T238;
  assign T238 = T242[T239];
  assign T239 = T240;
  assign T240 = T241;
  assign T241 = io_chanxy_config[4'hb/* 11*/:4'hb/* 11*/];
  assign T242 = T243;
  assign T243 = io_chanxy_in[5'h17/* 23*/:5'h16/* 22*/];
  assign T244 = T245;
  assign T245 = T246;
  assign T246 = T250[T247];
  assign T247 = T248;
  assign T248 = T249;
  assign T249 = io_chanxy_config[4'hc/* 12*/:4'hc/* 12*/];
  assign T250 = T251;
  assign T251 = io_chanxy_in[5'h19/* 25*/:5'h18/* 24*/];
  assign T252 = T253;
  assign T253 = T254;
  assign T254 = T258[T255];
  assign T255 = T256;
  assign T256 = T257;
  assign T257 = io_chanxy_config[4'hd/* 13*/:4'hd/* 13*/];
  assign T258 = T259;
  assign T259 = io_chanxy_in[5'h1b/* 27*/:5'h1a/* 26*/];
  assign T260 = T261;
  assign T261 = T262;
  assign T262 = T266[T263];
  assign T263 = T264;
  assign T264 = T265;
  assign T265 = io_chanxy_config[4'he/* 14*/:4'he/* 14*/];
  assign T266 = T267;
  assign T267 = io_chanxy_in[5'h1d/* 29*/:5'h1c/* 28*/];
  assign T268 = T269;
  assign T269 = T270;
  assign T270 = T274[T271];
  assign T271 = T272;
  assign T272 = T273;
  assign T273 = io_chanxy_config[4'hf/* 15*/:4'hf/* 15*/];
  assign T274 = T275;
  assign T275 = io_chanxy_in[5'h1f/* 31*/:5'h1e/* 30*/];
  assign T276 = T277;
  assign T277 = T278;
  assign T278 = T282[T279];
  assign T279 = T280;
  assign T280 = T281;
  assign T281 = io_chanxy_config[5'h10/* 16*/:5'h10/* 16*/];
  assign T282 = T283;
  assign T283 = io_chanxy_in[6'h21/* 33*/:6'h20/* 32*/];
  assign T284 = T285;
  assign T285 = T286;
  assign T286 = T290[T287];
  assign T287 = T288;
  assign T288 = T289;
  assign T289 = io_chanxy_config[5'h11/* 17*/:5'h11/* 17*/];
  assign T290 = T291;
  assign T291 = io_chanxy_in[6'h23/* 35*/:6'h22/* 34*/];
  assign T292 = T293;
  assign T293 = T294;
  assign T294 = T298[T295];
  assign T295 = T296;
  assign T296 = T297;
  assign T297 = io_chanxy_config[5'h12/* 18*/:5'h12/* 18*/];
  assign T298 = T299;
  assign T299 = io_chanxy_in[6'h25/* 37*/:6'h24/* 36*/];
  assign T300 = T301;
  assign T301 = T302;
  assign T302 = T306[T303];
  assign T303 = T304;
  assign T304 = T305;
  assign T305 = io_chanxy_config[5'h13/* 19*/:5'h13/* 19*/];
  assign T306 = T307;
  assign T307 = io_chanxy_in[6'h27/* 39*/:6'h26/* 38*/];
  assign T308 = T309;
  assign T309 = T310;
  assign T310 = T314[T311];
  assign T311 = T312;
  assign T312 = T313;
  assign T313 = io_chanxy_config[5'h14/* 20*/:5'h14/* 20*/];
  assign T314 = T315;
  assign T315 = io_chanxy_in[6'h29/* 41*/:6'h28/* 40*/];
  assign T316 = T317;
  assign T317 = T318;
  assign T318 = T322[T319];
  assign T319 = T320;
  assign T320 = T321;
  assign T321 = io_chanxy_config[5'h15/* 21*/:5'h15/* 21*/];
  assign T322 = T323;
  assign T323 = io_chanxy_in[6'h2b/* 43*/:6'h2a/* 42*/];
  assign T324 = T325;
  assign T325 = T326;
  assign T326 = T330[T327];
  assign T327 = T328;
  assign T328 = T329;
  assign T329 = io_chanxy_config[5'h16/* 22*/:5'h16/* 22*/];
  assign T330 = T331;
  assign T331 = io_chanxy_in[6'h2d/* 45*/:6'h2c/* 44*/];
  assign T332 = T333;
  assign T333 = T334;
  assign T334 = T338[T335];
  assign T335 = T336;
  assign T336 = T337;
  assign T337 = io_chanxy_config[5'h17/* 23*/:5'h17/* 23*/];
  assign T338 = T339;
  assign T339 = io_chanxy_in[6'h2f/* 47*/:6'h2e/* 46*/];
  assign T340 = T341;
  assign T341 = T342;
  assign T342 = T346[T343];
  assign T343 = T344;
  assign T344 = T345;
  assign T345 = io_chanxy_config[5'h18/* 24*/:5'h18/* 24*/];
  assign T346 = T347;
  assign T347 = io_chanxy_in[6'h31/* 49*/:6'h30/* 48*/];
  assign T348 = T349;
  assign T349 = T350;
  assign T350 = T354[T351];
  assign T351 = T352;
  assign T352 = T353;
  assign T353 = io_chanxy_config[5'h19/* 25*/:5'h19/* 25*/];
  assign T354 = T355;
  assign T355 = io_chanxy_in[6'h33/* 51*/:6'h32/* 50*/];
  assign T356 = T357;
  assign T357 = T358;
  assign T358 = T362[T359];
  assign T359 = T360;
  assign T360 = T361;
  assign T361 = io_chanxy_config[5'h1a/* 26*/:5'h1a/* 26*/];
  assign T362 = T363;
  assign T363 = io_chanxy_in[6'h35/* 53*/:6'h34/* 52*/];
  assign T364 = T365;
  assign T365 = T366;
  assign T366 = T370[T367];
  assign T367 = T368;
  assign T368 = T369;
  assign T369 = io_chanxy_config[5'h1b/* 27*/:5'h1b/* 27*/];
  assign T370 = T371;
  assign T371 = io_chanxy_in[6'h37/* 55*/:6'h36/* 54*/];
  assign T372 = T373;
  assign T373 = T374;
  assign T374 = T378[T375];
  assign T375 = T376;
  assign T376 = T377;
  assign T377 = io_chanxy_config[5'h1c/* 28*/:5'h1c/* 28*/];
  assign T378 = T379;
  assign T379 = io_chanxy_in[6'h39/* 57*/:6'h38/* 56*/];
  assign T380 = T381;
  assign T381 = T382;
  assign T382 = T386[T383];
  assign T383 = T384;
  assign T384 = T385;
  assign T385 = io_chanxy_config[5'h1d/* 29*/:5'h1d/* 29*/];
  assign T386 = T387;
  assign T387 = io_chanxy_in[6'h3b/* 59*/:6'h3a/* 58*/];
  assign T388 = T389;
  assign T389 = T390;
  assign T390 = T394[T391];
  assign T391 = T392;
  assign T392 = T393;
  assign T393 = io_chanxy_config[5'h1e/* 30*/:5'h1e/* 30*/];
  assign T394 = T395;
  assign T395 = io_chanxy_in[6'h3d/* 61*/:6'h3c/* 60*/];
  assign T396 = T397;
  assign T397 = T398;
  assign T398 = T402[T399];
  assign T399 = T400;
  assign T400 = T401;
  assign T401 = io_chanxy_config[5'h1f/* 31*/:5'h1f/* 31*/];
  assign T402 = T403;
  assign T403 = io_chanxy_in[6'h3f/* 63*/:6'h3e/* 62*/];
  assign T404 = T405;
  assign T405 = T406;
  assign T406 = T410[T407];
  assign T407 = T408;
  assign T408 = T409;
  assign T409 = io_chanxy_config[6'h20/* 32*/:6'h20/* 32*/];
  assign T410 = T411;
  assign T411 = io_chanxy_in[7'h41/* 65*/:7'h40/* 64*/];
  assign T412 = T413;
  assign T413 = T414;
  assign T414 = T418[T415];
  assign T415 = T416;
  assign T416 = T417;
  assign T417 = io_chanxy_config[6'h21/* 33*/:6'h21/* 33*/];
  assign T418 = T419;
  assign T419 = io_chanxy_in[7'h43/* 67*/:7'h42/* 66*/];
  assign T420 = T421;
  assign T421 = T422;
  assign T422 = T426[T423];
  assign T423 = T424;
  assign T424 = T425;
  assign T425 = io_chanxy_config[6'h22/* 34*/:6'h22/* 34*/];
  assign T426 = T427;
  assign T427 = io_chanxy_in[7'h45/* 69*/:7'h44/* 68*/];
  assign T428 = T429;
  assign T429 = T430;
  assign T430 = T434[T431];
  assign T431 = T432;
  assign T432 = T433;
  assign T433 = io_chanxy_config[6'h23/* 35*/:6'h23/* 35*/];
  assign T434 = T435;
  assign T435 = io_chanxy_in[7'h47/* 71*/:7'h46/* 70*/];
  assign T436 = T437;
  assign T437 = T438;
  assign T438 = T442[T439];
  assign T439 = T440;
  assign T440 = T441;
  assign T441 = io_chanxy_config[6'h24/* 36*/:6'h24/* 36*/];
  assign T442 = T443;
  assign T443 = io_chanxy_in[7'h49/* 73*/:7'h48/* 72*/];
  assign T444 = T445;
  assign T445 = T446;
  assign T446 = T450[T447];
  assign T447 = T448;
  assign T448 = T449;
  assign T449 = io_chanxy_config[6'h25/* 37*/:6'h25/* 37*/];
  assign T450 = T451;
  assign T451 = io_chanxy_in[7'h4b/* 75*/:7'h4a/* 74*/];
  assign T452 = T453;
  assign T453 = T454;
  assign T454 = T458[T455];
  assign T455 = T456;
  assign T456 = T457;
  assign T457 = io_chanxy_config[6'h26/* 38*/:6'h26/* 38*/];
  assign T458 = T459;
  assign T459 = io_chanxy_in[7'h4d/* 77*/:7'h4c/* 76*/];
  assign T460 = T461;
  assign T461 = T462;
  assign T462 = T466[T463];
  assign T463 = T464;
  assign T464 = T465;
  assign T465 = io_chanxy_config[6'h27/* 39*/:6'h27/* 39*/];
  assign T466 = T467;
  assign T467 = io_chanxy_in[7'h4f/* 79*/:7'h4e/* 78*/];
  assign T468 = T469;
  assign T469 = T470;
  assign T470 = T474[T471];
  assign T471 = T472;
  assign T472 = T473;
  assign T473 = io_chanxy_config[6'h28/* 40*/:6'h28/* 40*/];
  assign T474 = T475;
  assign T475 = io_chanxy_in[7'h51/* 81*/:7'h50/* 80*/];
  assign T476 = T477;
  assign T477 = T478;
  assign T478 = T482[T479];
  assign T479 = T480;
  assign T480 = T481;
  assign T481 = io_chanxy_config[6'h29/* 41*/:6'h29/* 41*/];
  assign T482 = T483;
  assign T483 = io_chanxy_in[7'h53/* 83*/:7'h52/* 82*/];
  assign T484 = T485;
  assign T485 = T486;
  assign T486 = T490[T487];
  assign T487 = T488;
  assign T488 = T489;
  assign T489 = io_chanxy_config[6'h2a/* 42*/:6'h2a/* 42*/];
  assign T490 = T491;
  assign T491 = io_chanxy_in[7'h55/* 85*/:7'h54/* 84*/];
  assign T492 = T493;
  assign T493 = T494;
  assign T494 = T498[T495];
  assign T495 = T496;
  assign T496 = T497;
  assign T497 = io_chanxy_config[6'h2b/* 43*/:6'h2b/* 43*/];
  assign T498 = T499;
  assign T499 = io_chanxy_in[7'h57/* 87*/:7'h56/* 86*/];
  assign T500 = T501;
  assign T501 = T502;
  assign T502 = T506[T503];
  assign T503 = T504;
  assign T504 = T505;
  assign T505 = io_chanxy_config[6'h2c/* 44*/:6'h2c/* 44*/];
  assign T506 = T507;
  assign T507 = io_chanxy_in[7'h59/* 89*/:7'h58/* 88*/];
  assign T508 = T509;
  assign T509 = T510;
  assign T510 = T514[T511];
  assign T511 = T512;
  assign T512 = T513;
  assign T513 = io_chanxy_config[6'h30/* 48*/:6'h2d/* 45*/];
  assign T514 = T515;
  assign T515 = io_chanxy_in[7'h62/* 98*/:7'h5a/* 90*/];
  assign T516 = T517;
  assign T517 = T518;
  assign T518 = T522[T519];
  assign T519 = T520;
  assign T520 = T521;
  assign T521 = io_chanxy_config[6'h31/* 49*/:6'h31/* 49*/];
  assign T522 = T523;
  assign T523 = io_chanxy_in[7'h64/* 100*/:7'h63/* 99*/];
  assign T524 = T525;
  assign T525 = T526;
  assign T526 = T530[T527];
  assign T527 = T528;
  assign T528 = T529;
  assign T529 = io_chanxy_config[6'h35/* 53*/:6'h32/* 50*/];
  assign T530 = T531;
  assign T531 = io_chanxy_in[7'h6d/* 109*/:7'h65/* 101*/];
  assign T532 = T533;
  assign T533 = T534;
  assign T534 = T538[T535];
  assign T535 = T536;
  assign T536 = T537;
  assign T537 = io_chanxy_config[6'h36/* 54*/:6'h36/* 54*/];
  assign T538 = T539;
  assign T539 = io_chanxy_in[7'h6f/* 111*/:7'h6e/* 110*/];
  assign T540 = T541;
  assign T541 = T542;
  assign T542 = T546[T543];
  assign T543 = T544;
  assign T544 = T545;
  assign T545 = io_chanxy_config[6'h3a/* 58*/:6'h37/* 55*/];
  assign T546 = T547;
  assign T547 = io_chanxy_in[7'h78/* 120*/:7'h70/* 112*/];
  assign T548 = T549;
  assign T549 = T550;
  assign T550 = T554[T551];
  assign T551 = T552;
  assign T552 = T553;
  assign T553 = io_chanxy_config[6'h3b/* 59*/:6'h3b/* 59*/];
  assign T554 = T555;
  assign T555 = io_chanxy_in[7'h7a/* 122*/:7'h79/* 121*/];
  assign T556 = T557;
  assign T557 = T558;
  assign T558 = T562[T559];
  assign T559 = T560;
  assign T560 = T561;
  assign T561 = io_chanxy_config[6'h3f/* 63*/:6'h3c/* 60*/];
  assign T562 = T563;
  assign T563 = io_chanxy_in[8'h83/* 131*/:7'h7b/* 123*/];
  assign T564 = T565;
  assign T565 = T566;
  assign T566 = T570[T567];
  assign T567 = T568;
  assign T568 = T569;
  assign T569 = io_chanxy_config[7'h40/* 64*/:7'h40/* 64*/];
  assign T570 = T571;
  assign T571 = io_chanxy_in[8'h85/* 133*/:8'h84/* 132*/];
  assign T572 = T573;
  assign T573 = T574;
  assign T574 = T578[T575];
  assign T575 = T576;
  assign T576 = T577;
  assign T577 = io_chanxy_config[7'h44/* 68*/:7'h41/* 65*/];
  assign T578 = T579;
  assign T579 = io_chanxy_in[8'h8e/* 142*/:8'h86/* 134*/];
  assign T580 = T581;
  assign T581 = T582;
  assign T582 = T586[T583];
  assign T583 = T584;
  assign T584 = T585;
  assign T585 = io_chanxy_config[7'h45/* 69*/:7'h45/* 69*/];
  assign T586 = T587;
  assign T587 = io_chanxy_in[8'h90/* 144*/:8'h8f/* 143*/];
  assign T588 = T589;
  assign T589 = T590;
  assign T590 = T594[T591];
  assign T591 = T592;
  assign T592 = T593;
  assign T593 = io_chanxy_config[7'h49/* 73*/:7'h46/* 70*/];
  assign T594 = T595;
  assign T595 = io_chanxy_in[8'h99/* 153*/:8'h91/* 145*/];
  assign T596 = T597;
  assign T597 = T598;
  assign T598 = T602[T599];
  assign T599 = T600;
  assign T600 = T601;
  assign T601 = io_chanxy_config[7'h4a/* 74*/:7'h4a/* 74*/];
  assign T602 = T603;
  assign T603 = io_chanxy_in[8'h9b/* 155*/:8'h9a/* 154*/];
  assign T604 = T605;
  assign T605 = T606;
  assign T606 = T610[T607];
  assign T607 = T608;
  assign T608 = T609;
  assign T609 = io_chanxy_config[7'h4e/* 78*/:7'h4b/* 75*/];
  assign T610 = T611;
  assign T611 = io_chanxy_in[8'ha4/* 164*/:8'h9c/* 156*/];
  assign T612 = T613;
  assign T613 = T614;
  assign T614 = T618[T615];
  assign T615 = T616;
  assign T616 = T617;
  assign T617 = io_chanxy_config[7'h4f/* 79*/:7'h4f/* 79*/];
  assign T618 = T619;
  assign T619 = io_chanxy_in[8'ha6/* 166*/:8'ha5/* 165*/];
  assign T620 = T621;
  assign T621 = T622;
  assign T622 = T626[T623];
  assign T623 = T624;
  assign T624 = T625;
  assign T625 = io_chanxy_config[7'h53/* 83*/:7'h50/* 80*/];
  assign T626 = T627;
  assign T627 = io_chanxy_in[8'haf/* 175*/:8'ha7/* 167*/];
  assign T628 = T629;
  assign T629 = T630;
  assign T630 = T634[T631];
  assign T631 = T632;
  assign T632 = T633;
  assign T633 = io_chanxy_config[7'h54/* 84*/:7'h54/* 84*/];
  assign T634 = T635;
  assign T635 = io_chanxy_in[8'hb1/* 177*/:8'hb0/* 176*/];
  assign T636 = T637;
  assign T637 = T638;
  assign T638 = T642[T639];
  assign T639 = T640;
  assign T640 = T641;
  assign T641 = io_chanxy_config[7'h58/* 88*/:7'h55/* 85*/];
  assign T642 = T643;
  assign T643 = io_chanxy_in[8'hba/* 186*/:8'hb2/* 178*/];
  assign T644 = T645;
  assign T645 = T646;
  assign T646 = T650[T647];
  assign T647 = T648;
  assign T648 = T649;
  assign T649 = io_chanxy_config[7'h59/* 89*/:7'h59/* 89*/];
  assign T650 = T651;
  assign T651 = io_chanxy_in[8'hbc/* 188*/:8'hbb/* 187*/];
  assign T652 = T653;
  assign T653 = T654;
  assign T654 = T658[T655];
  assign T655 = T656;
  assign T656 = T657;
  assign T657 = io_chanxy_config[7'h5d/* 93*/:7'h5a/* 90*/];
  assign T658 = T659;
  assign T659 = io_chanxy_in[8'hc5/* 197*/:8'hbd/* 189*/];
  assign T660 = T661;
  assign T661 = T662;
  assign T662 = T666[T663];
  assign T663 = T664;
  assign T664 = T665;
  assign T665 = io_chanxy_config[7'h5e/* 94*/:7'h5e/* 94*/];
  assign T666 = T667;
  assign T667 = io_chanxy_in[8'hc7/* 199*/:8'hc6/* 198*/];
  assign T668 = T669;
  assign T669 = T670;
  assign T670 = T674[T671];
  assign T671 = T672;
  assign T672 = T673;
  assign T673 = io_chanxy_config[7'h62/* 98*/:7'h5f/* 95*/];
  assign T674 = T675;
  assign T675 = io_chanxy_in[8'hd0/* 208*/:8'hc8/* 200*/];
  assign T676 = T677;
  assign T677 = T678;
  assign T678 = T682[T679];
  assign T679 = T680;
  assign T680 = T681;
  assign T681 = io_chanxy_config[7'h63/* 99*/:7'h63/* 99*/];
  assign T682 = T683;
  assign T683 = io_chanxy_in[8'hd2/* 210*/:8'hd1/* 209*/];
  assign T684 = T685;
  assign T685 = T686;
  assign T686 = T690[T687];
  assign T687 = T688;
  assign T688 = T689;
  assign T689 = io_chanxy_config[7'h67/* 103*/:7'h64/* 100*/];
  assign T690 = T691;
  assign T691 = io_chanxy_in[8'hdb/* 219*/:8'hd3/* 211*/];
  assign T692 = T693;
  assign T693 = T694;
  assign T694 = T698[T695];
  assign T695 = T696;
  assign T696 = T697;
  assign T697 = io_chanxy_config[7'h68/* 104*/:7'h68/* 104*/];
  assign T698 = T699;
  assign T699 = io_chanxy_in[8'hdd/* 221*/:8'hdc/* 220*/];
  assign T700 = T701;
  assign T701 = T702;
  assign T702 = T706[T703];
  assign T703 = T704;
  assign T704 = T705;
  assign T705 = io_chanxy_config[7'h6c/* 108*/:7'h69/* 105*/];
  assign T706 = T707;
  assign T707 = io_chanxy_in[8'he6/* 230*/:8'hde/* 222*/];
  assign T708 = T709;
  assign T709 = T710;
  assign T710 = T714[T711];
  assign T711 = T712;
  assign T712 = T713;
  assign T713 = io_chanxy_config[7'h6d/* 109*/:7'h6d/* 109*/];
  assign T714 = T715;
  assign T715 = io_chanxy_in[8'he8/* 232*/:8'he7/* 231*/];
  assign T716 = T717;
  assign T717 = T718;
  assign T718 = T722[T719];
  assign T719 = T720;
  assign T720 = T721;
  assign T721 = io_chanxy_config[7'h71/* 113*/:7'h6e/* 110*/];
  assign T722 = T723;
  assign T723 = io_chanxy_in[8'hf1/* 241*/:8'he9/* 233*/];
  assign T724 = T725;
  assign T725 = T726;
  assign T726 = T730[T727];
  assign T727 = T728;
  assign T728 = T729;
  assign T729 = io_chanxy_config[7'h72/* 114*/:7'h72/* 114*/];
  assign T730 = T731;
  assign T731 = io_chanxy_in[8'hf3/* 243*/:8'hf2/* 242*/];
  assign T732 = T733;
  assign T733 = T734;
  assign T734 = T738[T735];
  assign T735 = T736;
  assign T736 = T737;
  assign T737 = io_chanxy_config[7'h76/* 118*/:7'h73/* 115*/];
  assign T738 = T739;
  assign T739 = io_chanxy_in[8'hfc/* 252*/:8'hf4/* 244*/];
  assign T740 = T741;
  assign T741 = T742;
  assign T742 = T746[T743];
  assign T743 = T744;
  assign T744 = T745;
  assign T745 = io_chanxy_config[7'h77/* 119*/:7'h77/* 119*/];
  assign T746 = T747;
  assign T747 = io_chanxy_in[8'hfe/* 254*/:8'hfd/* 253*/];
  assign io_ipin_out = T748;
  assign T748 = T749;
  assign T749 = {T825, T750};
  assign T750 = T751;
  assign T751 = {T816, T752};
  assign T752 = T753;
  assign T753 = {T807, T754};
  assign T754 = T755;
  assign T755 = {T798, T756};
  assign T756 = T757;
  assign T757 = {T789, T758};
  assign T758 = T759;
  assign T759 = {T780, T760};
  assign T760 = T761;
  assign T761 = {T771, T762};
  assign T762 = T763;
  assign T763 = T764;
  assign T764 = T769[T765];
  assign T765 = T766;
  assign T766 = T767;
  assign T767 = {8'h0/* 0*/, T768};
  assign T768 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T769 = T770;
  assign T770 = io_ipin_in[4'hb/* 11*/:1'h0/* 0*/];
  assign T771 = T772;
  assign T772 = T773;
  assign T773 = T778[T774];
  assign T774 = T775;
  assign T775 = T776;
  assign T776 = {8'h0/* 0*/, T777};
  assign T777 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T778 = T779;
  assign T779 = io_ipin_in[5'h17/* 23*/:4'hc/* 12*/];
  assign T780 = T781;
  assign T781 = T782;
  assign T782 = T787[T783];
  assign T783 = T784;
  assign T784 = T785;
  assign T785 = {8'h0/* 0*/, T786};
  assign T786 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T787 = T788;
  assign T788 = io_ipin_in[6'h23/* 35*/:5'h18/* 24*/];
  assign T789 = T790;
  assign T790 = T791;
  assign T791 = T796[T792];
  assign T792 = T793;
  assign T793 = T794;
  assign T794 = {8'h0/* 0*/, T795};
  assign T795 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T796 = T797;
  assign T797 = io_ipin_in[6'h2f/* 47*/:6'h24/* 36*/];
  assign T798 = T799;
  assign T799 = T800;
  assign T800 = T805[T801];
  assign T801 = T802;
  assign T802 = T803;
  assign T803 = {8'h0/* 0*/, T804};
  assign T804 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T805 = T806;
  assign T806 = io_ipin_in[6'h3b/* 59*/:6'h30/* 48*/];
  assign T807 = T808;
  assign T808 = T809;
  assign T809 = T814[T810];
  assign T810 = T811;
  assign T811 = T812;
  assign T812 = {8'h0/* 0*/, T813};
  assign T813 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T814 = T815;
  assign T815 = io_ipin_in[7'h47/* 71*/:6'h3c/* 60*/];
  assign T816 = T817;
  assign T817 = T818;
  assign T818 = T823[T819];
  assign T819 = T820;
  assign T820 = T821;
  assign T821 = {8'h0/* 0*/, T822};
  assign T822 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T823 = T824;
  assign T824 = io_ipin_in[7'h53/* 83*/:7'h48/* 72*/];
  assign T825 = T826;
  assign T826 = T827;
  assign T827 = T832[T828];
  assign T828 = T829;
  assign T829 = T830;
  assign T830 = {8'h0/* 0*/, T831};
  assign T831 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T832 = T833;
  assign T833 = io_ipin_in[7'h5f/* 95*/:7'h54/* 84*/];
endmodule

module io_tile_sp_9(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [254:0] io_chanxy_in,
    output[74:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[74:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'ha/* 10*/};
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_woc(
    input [95:0] io_ipin_in,
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
  wire[11:0] T17;
  wire[11:0] T18;
  wire[11:0] T19;
  wire[3:0] T20;
  wire[11:0] T21;
  wire[11:0] T22;
  wire T23;
  wire T24;
  wire T25;
  wire[11:0] T26;
  wire[11:0] T27;
  wire[11:0] T28;
  wire[3:0] T29;
  wire[11:0] T30;
  wire[11:0] T31;
  wire T32;
  wire T33;
  wire T34;
  wire[11:0] T35;
  wire[11:0] T36;
  wire[11:0] T37;
  wire[3:0] T38;
  wire[11:0] T39;
  wire[11:0] T40;
  wire T41;
  wire T42;
  wire T43;
  wire[11:0] T44;
  wire[11:0] T45;
  wire[11:0] T46;
  wire[3:0] T47;
  wire[11:0] T48;
  wire[11:0] T49;
  wire T50;
  wire T51;
  wire T52;
  wire[11:0] T53;
  wire[11:0] T54;
  wire[11:0] T55;
  wire[3:0] T56;
  wire[11:0] T57;
  wire[11:0] T58;
  wire T59;
  wire T60;
  wire T61;
  wire[11:0] T62;
  wire[11:0] T63;
  wire[11:0] T64;
  wire[3:0] T65;
  wire[11:0] T66;
  wire[11:0] T67;
  wire T68;
  wire T69;
  wire T70;
  wire[11:0] T71;
  wire[11:0] T72;
  wire[11:0] T73;
  wire[3:0] T74;
  wire[11:0] T75;
  wire[11:0] T76;
  wire T77;
  wire T78;
  wire T79;
  wire[11:0] T80;
  wire[11:0] T81;
  wire[11:0] T82;
  wire[3:0] T83;
  wire[11:0] T84;
  wire[11:0] T85;

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
  assign T19 = {8'h0/* 0*/, T20};
  assign T20 = io_ipin_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T21 = T22;
  assign T22 = io_ipin_in[4'hb/* 11*/:1'h0/* 0*/];
  assign T23 = T24;
  assign T24 = T25;
  assign T25 = T30[T26];
  assign T26 = T27;
  assign T27 = T28;
  assign T28 = {8'h0/* 0*/, T29};
  assign T29 = io_ipin_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T30 = T31;
  assign T31 = io_ipin_in[5'h17/* 23*/:4'hc/* 12*/];
  assign T32 = T33;
  assign T33 = T34;
  assign T34 = T39[T35];
  assign T35 = T36;
  assign T36 = T37;
  assign T37 = {8'h0/* 0*/, T38};
  assign T38 = io_ipin_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T39 = T40;
  assign T40 = io_ipin_in[6'h23/* 35*/:5'h18/* 24*/];
  assign T41 = T42;
  assign T42 = T43;
  assign T43 = T48[T44];
  assign T44 = T45;
  assign T45 = T46;
  assign T46 = {8'h0/* 0*/, T47};
  assign T47 = io_ipin_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T48 = T49;
  assign T49 = io_ipin_in[6'h2f/* 47*/:6'h24/* 36*/];
  assign T50 = T51;
  assign T51 = T52;
  assign T52 = T57[T53];
  assign T53 = T54;
  assign T54 = T55;
  assign T55 = {8'h0/* 0*/, T56};
  assign T56 = io_ipin_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T57 = T58;
  assign T58 = io_ipin_in[6'h3b/* 59*/:6'h30/* 48*/];
  assign T59 = T60;
  assign T60 = T61;
  assign T61 = T66[T62];
  assign T62 = T63;
  assign T63 = T64;
  assign T64 = {8'h0/* 0*/, T65};
  assign T65 = io_ipin_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T66 = T67;
  assign T67 = io_ipin_in[7'h47/* 71*/:6'h3c/* 60*/];
  assign T68 = T69;
  assign T69 = T70;
  assign T70 = T75[T71];
  assign T71 = T72;
  assign T72 = T73;
  assign T73 = {8'h0/* 0*/, T74};
  assign T74 = io_ipin_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T75 = T76;
  assign T76 = io_ipin_in[7'h53/* 83*/:7'h48/* 72*/];
  assign T77 = T78;
  assign T78 = T79;
  assign T79 = T84[T80];
  assign T80 = T81;
  assign T81 = T82;
  assign T82 = {8'h0/* 0*/, T83};
  assign T83 = io_ipin_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T84 = T85;
  assign T85 = io_ipin_in[7'h5f/* 95*/:7'h54/* 84*/];
endmodule


module io_tile_sp_10(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_17(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_18(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
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
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_19(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'ha/* 10*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_20(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [254:0] io_chanxy_in,
    output[74:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[74:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_21(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_22(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_23(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_24(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_25(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_26(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_27(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {4'h0/* 0*/, 4'h8/* 8*/};
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_28(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [269:0] io_chanxy_in,
    output[29:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[29:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {4'h0/* 0*/, 4'h9/* 9*/};
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_29(input clk, input reset,
    input [31:0] io_configs_in,
    input [4:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    input [254:0] io_chanxy_in,
    output[74:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[119:0] T0;
  wire[159:0] this_config_io_configs_out;
  wire[31:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[74:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[8'h97/* 151*/:6'h20/* 32*/];
  assign T1 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {4'h0/* 0*/, 4'ha/* 10*/};
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
    configs_latches_5 this_config(.clk(clk), .reset(reset),
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
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_31(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_32(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_33(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_34(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_35(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_36(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_37(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_38(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
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

module io_tile_sp_39(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [95:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[31:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[5'h1f/* 31*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {4'h0/* 0*/, 4'hb/* 11*/};
  assign io_x_loc = T2;
  assign T2 = {4'h0/* 0*/, 4'ha/* 10*/};
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


