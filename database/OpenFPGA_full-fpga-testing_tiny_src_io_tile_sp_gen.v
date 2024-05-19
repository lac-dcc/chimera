// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module io_sbcb_wc(
    input [31:0] io_ipin_in,
    input [15:0] io_ipin_config,
    input [80:0] io_chanxy_in,
    input [35:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[24:0] io_chanxy_out);

  wire[24:0] T0;
  wire[24:0] T1;
  wire[23:0] T2;
  wire[23:0] T3;
  wire[22:0] T4;
  wire[22:0] T5;
  wire[21:0] T6;
  wire[21:0] T7;
  wire[20:0] T8;
  wire[20:0] T9;
  wire[19:0] T10;
  wire[19:0] T11;
  wire[18:0] T12;
  wire[18:0] T13;
  wire[17:0] T14;
  wire[17:0] T15;
  wire[16:0] T16;
  wire[16:0] T17;
  wire[15:0] T18;
  wire[15:0] T19;
  wire[14:0] T20;
  wire[14:0] T21;
  wire[13:0] T22;
  wire[13:0] T23;
  wire[12:0] T24;
  wire[12:0] T25;
  wire[11:0] T26;
  wire[11:0] T27;
  wire[10:0] T28;
  wire[10:0] T29;
  wire[9:0] T30;
  wire[9:0] T31;
  wire[8:0] T32;
  wire[8:0] T33;
  wire[7:0] T34;
  wire[7:0] T35;
  wire[6:0] T36;
  wire[6:0] T37;
  wire[5:0] T38;
  wire[5:0] T39;
  wire[4:0] T40;
  wire[4:0] T41;
  wire[3:0] T42;
  wire[3:0] T43;
  wire[2:0] T44;
  wire[2:0] T45;
  wire[1:0] T46;
  wire[1:0] T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire[1:0] T54;
  wire[1:0] T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire[1:0] T62;
  wire[1:0] T63;
  wire T64;
  wire T65;
  wire T66;
  wire[3:0] T67;
  wire[3:0] T68;
  wire[3:0] T69;
  wire[8:0] T70;
  wire[8:0] T71;
  wire T72;
  wire T73;
  wire T74;
  wire T75;
  wire T76;
  wire T77;
  wire[1:0] T78;
  wire[1:0] T79;
  wire T80;
  wire T81;
  wire T82;
  wire T83;
  wire T84;
  wire T85;
  wire[1:0] T86;
  wire[1:0] T87;
  wire T88;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire T93;
  wire[1:0] T94;
  wire[1:0] T95;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire T100;
  wire T101;
  wire[1:0] T102;
  wire[1:0] T103;
  wire T104;
  wire T105;
  wire T106;
  wire[3:0] T107;
  wire[3:0] T108;
  wire[3:0] T109;
  wire[8:0] T110;
  wire[8:0] T111;
  wire T112;
  wire T113;
  wire T114;
  wire T115;
  wire T116;
  wire T117;
  wire[1:0] T118;
  wire[1:0] T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire T124;
  wire T125;
  wire[1:0] T126;
  wire[1:0] T127;
  wire T128;
  wire T129;
  wire T130;
  wire T131;
  wire T132;
  wire T133;
  wire[1:0] T134;
  wire[1:0] T135;
  wire T136;
  wire T137;
  wire T138;
  wire T139;
  wire T140;
  wire T141;
  wire[1:0] T142;
  wire[1:0] T143;
  wire T144;
  wire T145;
  wire T146;
  wire[3:0] T147;
  wire[3:0] T148;
  wire[3:0] T149;
  wire[8:0] T150;
  wire[8:0] T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  wire T156;
  wire T157;
  wire[1:0] T158;
  wire[1:0] T159;
  wire T160;
  wire T161;
  wire T162;
  wire T163;
  wire T164;
  wire T165;
  wire[1:0] T166;
  wire[1:0] T167;
  wire T168;
  wire T169;
  wire T170;
  wire T171;
  wire T172;
  wire T173;
  wire[1:0] T174;
  wire[1:0] T175;
  wire T176;
  wire T177;
  wire T178;
  wire T179;
  wire T180;
  wire T181;
  wire[1:0] T182;
  wire[1:0] T183;
  wire T184;
  wire T185;
  wire T186;
  wire[2:0] T187;
  wire[2:0] T188;
  wire[2:0] T189;
  wire[7:0] T190;
  wire[7:0] T191;
  wire T192;
  wire T193;
  wire T194;
  wire T195;
  wire T196;
  wire T197;
  wire[1:0] T198;
  wire[1:0] T199;
  wire T200;
  wire T201;
  wire T202;
  wire T203;
  wire T204;
  wire T205;
  wire[1:0] T206;
  wire[1:0] T207;
  wire T208;
  wire T209;
  wire T210;
  wire T211;
  wire T212;
  wire T213;
  wire[1:0] T214;
  wire[1:0] T215;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  wire T220;
  wire T221;
  wire[1:0] T222;
  wire[1:0] T223;
  wire T224;
  wire T225;
  wire T226;
  wire[2:0] T227;
  wire[2:0] T228;
  wire[2:0] T229;
  wire[7:0] T230;
  wire[7:0] T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire T236;
  wire T237;
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
  wire[3:0] T255;
  wire[3:0] T256;
  wire[3:0] T257;
  wire[1:0] T258;
  wire[3:0] T259;
  wire[3:0] T260;
  wire T261;
  wire T262;
  wire T263;
  wire[3:0] T264;
  wire[3:0] T265;
  wire[3:0] T266;
  wire[1:0] T267;
  wire[3:0] T268;
  wire[3:0] T269;
  wire T270;
  wire T271;
  wire T272;
  wire[3:0] T273;
  wire[3:0] T274;
  wire[3:0] T275;
  wire[1:0] T276;
  wire[3:0] T277;
  wire[3:0] T278;
  wire T279;
  wire T280;
  wire T281;
  wire[3:0] T282;
  wire[3:0] T283;
  wire[3:0] T284;
  wire[1:0] T285;
  wire[3:0] T286;
  wire[3:0] T287;
  wire T288;
  wire T289;
  wire T290;
  wire[3:0] T291;
  wire[3:0] T292;
  wire[3:0] T293;
  wire[1:0] T294;
  wire[3:0] T295;
  wire[3:0] T296;
  wire T297;
  wire T298;
  wire T299;
  wire[3:0] T300;
  wire[3:0] T301;
  wire[3:0] T302;
  wire[1:0] T303;
  wire[3:0] T304;
  wire[3:0] T305;
  wire T306;
  wire T307;
  wire T308;
  wire[3:0] T309;
  wire[3:0] T310;
  wire[3:0] T311;
  wire[1:0] T312;
  wire[3:0] T313;
  wire[3:0] T314;
  wire T315;
  wire T316;
  wire T317;
  wire[3:0] T318;
  wire[3:0] T319;
  wire[3:0] T320;
  wire[1:0] T321;
  wire[3:0] T322;
  wire[3:0] T323;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T235, T2};
  assign T2 = T3;
  assign T3 = {T232, T4};
  assign T4 = T5;
  assign T5 = {T224, T6};
  assign T6 = T7;
  assign T7 = {T216, T8};
  assign T8 = T9;
  assign T9 = {T208, T10};
  assign T10 = T11;
  assign T11 = {T200, T12};
  assign T12 = T13;
  assign T13 = {T192, T14};
  assign T14 = T15;
  assign T15 = {T184, T16};
  assign T16 = T17;
  assign T17 = {T176, T18};
  assign T18 = T19;
  assign T19 = {T168, T20};
  assign T20 = T21;
  assign T21 = {T160, T22};
  assign T22 = T23;
  assign T23 = {T152, T24};
  assign T24 = T25;
  assign T25 = {T144, T26};
  assign T26 = T27;
  assign T27 = {T136, T28};
  assign T28 = T29;
  assign T29 = {T128, T30};
  assign T30 = T31;
  assign T31 = {T120, T32};
  assign T32 = T33;
  assign T33 = {T112, T34};
  assign T34 = T35;
  assign T35 = {T104, T36};
  assign T36 = T37;
  assign T37 = {T96, T38};
  assign T38 = T39;
  assign T39 = {T88, T40};
  assign T40 = T41;
  assign T41 = {T80, T42};
  assign T42 = T43;
  assign T43 = {T72, T44};
  assign T44 = T45;
  assign T45 = {T64, T46};
  assign T46 = T47;
  assign T47 = {T56, T48};
  assign T48 = T49;
  assign T49 = T50;
  assign T50 = T54[T51];
  assign T51 = T52;
  assign T52 = T53;
  assign T53 = io_chanxy_config[1'h0/* 0*/:1'h0/* 0*/];
  assign T54 = T55;
  assign T55 = io_chanxy_in[1'h1/* 1*/:1'h0/* 0*/];
  assign T56 = T57;
  assign T57 = T58;
  assign T58 = T62[T59];
  assign T59 = T60;
  assign T60 = T61;
  assign T61 = io_chanxy_config[1'h1/* 1*/:1'h1/* 1*/];
  assign T62 = T63;
  assign T63 = io_chanxy_in[2'h3/* 3*/:2'h2/* 2*/];
  assign T64 = T65;
  assign T65 = T66;
  assign T66 = T70[T67];
  assign T67 = T68;
  assign T68 = T69;
  assign T69 = io_chanxy_config[3'h5/* 5*/:2'h2/* 2*/];
  assign T70 = T71;
  assign T71 = io_chanxy_in[4'hc/* 12*/:3'h4/* 4*/];
  assign T72 = T73;
  assign T73 = T74;
  assign T74 = T78[T75];
  assign T75 = T76;
  assign T76 = T77;
  assign T77 = io_chanxy_config[3'h6/* 6*/:3'h6/* 6*/];
  assign T78 = T79;
  assign T79 = io_chanxy_in[4'he/* 14*/:4'hd/* 13*/];
  assign T80 = T81;
  assign T81 = T82;
  assign T82 = T86[T83];
  assign T83 = T84;
  assign T84 = T85;
  assign T85 = io_chanxy_config[3'h7/* 7*/:3'h7/* 7*/];
  assign T86 = T87;
  assign T87 = io_chanxy_in[5'h10/* 16*/:4'hf/* 15*/];
  assign T88 = T89;
  assign T89 = T90;
  assign T90 = T94[T91];
  assign T91 = T92;
  assign T92 = T93;
  assign T93 = io_chanxy_config[4'h8/* 8*/:4'h8/* 8*/];
  assign T94 = T95;
  assign T95 = io_chanxy_in[5'h12/* 18*/:5'h11/* 17*/];
  assign T96 = T97;
  assign T97 = T98;
  assign T98 = T102[T99];
  assign T99 = T100;
  assign T100 = T101;
  assign T101 = io_chanxy_config[4'h9/* 9*/:4'h9/* 9*/];
  assign T102 = T103;
  assign T103 = io_chanxy_in[5'h14/* 20*/:5'h13/* 19*/];
  assign T104 = T105;
  assign T105 = T106;
  assign T106 = T110[T107];
  assign T107 = T108;
  assign T108 = T109;
  assign T109 = io_chanxy_config[4'hd/* 13*/:4'ha/* 10*/];
  assign T110 = T111;
  assign T111 = io_chanxy_in[5'h1d/* 29*/:5'h15/* 21*/];
  assign T112 = T113;
  assign T113 = T114;
  assign T114 = T118[T115];
  assign T115 = T116;
  assign T116 = T117;
  assign T117 = io_chanxy_config[4'he/* 14*/:4'he/* 14*/];
  assign T118 = T119;
  assign T119 = io_chanxy_in[5'h1f/* 31*/:5'h1e/* 30*/];
  assign T120 = T121;
  assign T121 = T122;
  assign T122 = T126[T123];
  assign T123 = T124;
  assign T124 = T125;
  assign T125 = io_chanxy_config[4'hf/* 15*/:4'hf/* 15*/];
  assign T126 = T127;
  assign T127 = io_chanxy_in[6'h21/* 33*/:6'h20/* 32*/];
  assign T128 = T129;
  assign T129 = T130;
  assign T130 = T134[T131];
  assign T131 = T132;
  assign T132 = T133;
  assign T133 = io_chanxy_config[5'h10/* 16*/:5'h10/* 16*/];
  assign T134 = T135;
  assign T135 = io_chanxy_in[6'h23/* 35*/:6'h22/* 34*/];
  assign T136 = T137;
  assign T137 = T138;
  assign T138 = T142[T139];
  assign T139 = T140;
  assign T140 = T141;
  assign T141 = io_chanxy_config[5'h11/* 17*/:5'h11/* 17*/];
  assign T142 = T143;
  assign T143 = io_chanxy_in[6'h25/* 37*/:6'h24/* 36*/];
  assign T144 = T145;
  assign T145 = T146;
  assign T146 = T150[T147];
  assign T147 = T148;
  assign T148 = T149;
  assign T149 = io_chanxy_config[5'h15/* 21*/:5'h12/* 18*/];
  assign T150 = T151;
  assign T151 = io_chanxy_in[6'h2e/* 46*/:6'h26/* 38*/];
  assign T152 = T153;
  assign T153 = T154;
  assign T154 = T158[T155];
  assign T155 = T156;
  assign T156 = T157;
  assign T157 = io_chanxy_config[5'h16/* 22*/:5'h16/* 22*/];
  assign T158 = T159;
  assign T159 = io_chanxy_in[6'h30/* 48*/:6'h2f/* 47*/];
  assign T160 = T161;
  assign T161 = T162;
  assign T162 = T166[T163];
  assign T163 = T164;
  assign T164 = T165;
  assign T165 = io_chanxy_config[5'h17/* 23*/:5'h17/* 23*/];
  assign T166 = T167;
  assign T167 = io_chanxy_in[6'h32/* 50*/:6'h31/* 49*/];
  assign T168 = T169;
  assign T169 = T170;
  assign T170 = T174[T171];
  assign T171 = T172;
  assign T172 = T173;
  assign T173 = io_chanxy_config[5'h18/* 24*/:5'h18/* 24*/];
  assign T174 = T175;
  assign T175 = io_chanxy_in[6'h34/* 52*/:6'h33/* 51*/];
  assign T176 = T177;
  assign T177 = T178;
  assign T178 = T182[T179];
  assign T179 = T180;
  assign T180 = T181;
  assign T181 = io_chanxy_config[5'h19/* 25*/:5'h19/* 25*/];
  assign T182 = T183;
  assign T183 = io_chanxy_in[6'h36/* 54*/:6'h35/* 53*/];
  assign T184 = T185;
  assign T185 = T186;
  assign T186 = T190[T187];
  assign T187 = T188;
  assign T188 = T189;
  assign T189 = io_chanxy_config[5'h1c/* 28*/:5'h1a/* 26*/];
  assign T190 = T191;
  assign T191 = io_chanxy_in[6'h3e/* 62*/:6'h37/* 55*/];
  assign T192 = T193;
  assign T193 = T194;
  assign T194 = T198[T195];
  assign T195 = T196;
  assign T196 = T197;
  assign T197 = io_chanxy_config[5'h1d/* 29*/:5'h1d/* 29*/];
  assign T198 = T199;
  assign T199 = io_chanxy_in[7'h40/* 64*/:6'h3f/* 63*/];
  assign T200 = T201;
  assign T201 = T202;
  assign T202 = T206[T203];
  assign T203 = T204;
  assign T204 = T205;
  assign T205 = io_chanxy_config[5'h1e/* 30*/:5'h1e/* 30*/];
  assign T206 = T207;
  assign T207 = io_chanxy_in[7'h42/* 66*/:7'h41/* 65*/];
  assign T208 = T209;
  assign T209 = T210;
  assign T210 = T214[T211];
  assign T211 = T212;
  assign T212 = T213;
  assign T213 = io_chanxy_config[5'h1f/* 31*/:5'h1f/* 31*/];
  assign T214 = T215;
  assign T215 = io_chanxy_in[7'h44/* 68*/:7'h43/* 67*/];
  assign T216 = T217;
  assign T217 = T218;
  assign T218 = T222[T219];
  assign T219 = T220;
  assign T220 = T221;
  assign T221 = io_chanxy_config[6'h20/* 32*/:6'h20/* 32*/];
  assign T222 = T223;
  assign T223 = io_chanxy_in[7'h46/* 70*/:7'h45/* 69*/];
  assign T224 = T225;
  assign T225 = T226;
  assign T226 = T230[T227];
  assign T227 = T228;
  assign T228 = T229;
  assign T229 = io_chanxy_config[6'h23/* 35*/:6'h21/* 33*/];
  assign T230 = T231;
  assign T231 = io_chanxy_in[7'h4e/* 78*/:7'h47/* 71*/];
  assign T232 = T233;
  assign T233 = T234;
  assign T234 = io_chanxy_in[7'h4f/* 79*/:7'h4f/* 79*/];
  assign T235 = T236;
  assign T236 = T237;
  assign T237 = io_chanxy_in[7'h50/* 80*/:7'h50/* 80*/];
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
  assign T257 = {2'h0/* 0*/, T258};
  assign T258 = io_ipin_config[1'h1/* 1*/:1'h0/* 0*/];
  assign T259 = T260;
  assign T260 = io_ipin_in[2'h3/* 3*/:1'h0/* 0*/];
  assign T261 = T262;
  assign T262 = T263;
  assign T263 = T268[T264];
  assign T264 = T265;
  assign T265 = T266;
  assign T266 = {2'h0/* 0*/, T267};
  assign T267 = io_ipin_config[2'h3/* 3*/:2'h2/* 2*/];
  assign T268 = T269;
  assign T269 = io_ipin_in[3'h7/* 7*/:3'h4/* 4*/];
  assign T270 = T271;
  assign T271 = T272;
  assign T272 = T277[T273];
  assign T273 = T274;
  assign T274 = T275;
  assign T275 = {2'h0/* 0*/, T276};
  assign T276 = io_ipin_config[3'h5/* 5*/:3'h4/* 4*/];
  assign T277 = T278;
  assign T278 = io_ipin_in[4'hb/* 11*/:4'h8/* 8*/];
  assign T279 = T280;
  assign T280 = T281;
  assign T281 = T286[T282];
  assign T282 = T283;
  assign T283 = T284;
  assign T284 = {2'h0/* 0*/, T285};
  assign T285 = io_ipin_config[3'h7/* 7*/:3'h6/* 6*/];
  assign T286 = T287;
  assign T287 = io_ipin_in[4'hf/* 15*/:4'hc/* 12*/];
  assign T288 = T289;
  assign T289 = T290;
  assign T290 = T295[T291];
  assign T291 = T292;
  assign T292 = T293;
  assign T293 = {2'h0/* 0*/, T294};
  assign T294 = io_ipin_config[4'h9/* 9*/:4'h8/* 8*/];
  assign T295 = T296;
  assign T296 = io_ipin_in[5'h13/* 19*/:5'h10/* 16*/];
  assign T297 = T298;
  assign T298 = T299;
  assign T299 = T304[T300];
  assign T300 = T301;
  assign T301 = T302;
  assign T302 = {2'h0/* 0*/, T303};
  assign T303 = io_ipin_config[4'hb/* 11*/:4'ha/* 10*/];
  assign T304 = T305;
  assign T305 = io_ipin_in[5'h17/* 23*/:5'h14/* 20*/];
  assign T306 = T307;
  assign T307 = T308;
  assign T308 = T313[T309];
  assign T309 = T310;
  assign T310 = T311;
  assign T311 = {2'h0/* 0*/, T312};
  assign T312 = io_ipin_config[4'hd/* 13*/:4'hc/* 12*/];
  assign T313 = T314;
  assign T314 = io_ipin_in[5'h1b/* 27*/:5'h18/* 24*/];
  assign T315 = T316;
  assign T316 = T317;
  assign T317 = T322[T318];
  assign T318 = T319;
  assign T319 = T320;
  assign T320 = {2'h0/* 0*/, T321};
  assign T321 = io_ipin_config[4'hf/* 15*/:4'he/* 14*/];
  assign T322 = T323;
  assign T323 = io_ipin_in[5'h1f/* 31*/:5'h1c/* 28*/];
endmodule


module io_tile_sp_0(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [80:0] io_chanxy_in,
    output[24:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[24:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_wc_1(
    input [31:0] io_ipin_in,
    input [15:0] io_ipin_config,
    input [85:0] io_chanxy_in,
    input [35:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[9:0] io_chanxy_out);

  wire[9:0] T0;
  wire[9:0] T1;
  wire[8:0] T2;
  wire[8:0] T3;
  wire[7:0] T4;
  wire[7:0] T5;
  wire[6:0] T6;
  wire[6:0] T7;
  wire[5:0] T8;
  wire[5:0] T9;
  wire[4:0] T10;
  wire[4:0] T11;
  wire[3:0] T12;
  wire[3:0] T13;
  wire[2:0] T14;
  wire[2:0] T15;
  wire[1:0] T16;
  wire[1:0] T17;
  wire T18;
  wire T19;
  wire T20;
  wire[3:0] T21;
  wire[3:0] T22;
  wire[3:0] T23;
  wire[8:0] T24;
  wire[8:0] T25;
  wire T26;
  wire T27;
  wire T28;
  wire[3:0] T29;
  wire[3:0] T30;
  wire[3:0] T31;
  wire[8:0] T32;
  wire[8:0] T33;
  wire T34;
  wire T35;
  wire T36;
  wire[3:0] T37;
  wire[3:0] T38;
  wire[3:0] T39;
  wire[8:0] T40;
  wire[8:0] T41;
  wire T42;
  wire T43;
  wire T44;
  wire[2:0] T45;
  wire[2:0] T46;
  wire[2:0] T47;
  wire[7:0] T48;
  wire[7:0] T49;
  wire T50;
  wire T51;
  wire T52;
  wire[2:0] T53;
  wire[2:0] T54;
  wire[2:0] T55;
  wire[7:0] T56;
  wire[7:0] T57;
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
  wire[2:0] T85;
  wire[2:0] T86;
  wire[2:0] T87;
  wire[7:0] T88;
  wire[7:0] T89;
  wire T90;
  wire T91;
  wire T92;
  wire[2:0] T93;
  wire[2:0] T94;
  wire[2:0] T95;
  wire[7:0] T96;
  wire[7:0] T97;
  wire[7:0] T98;
  wire[7:0] T99;
  wire[6:0] T100;
  wire[6:0] T101;
  wire[5:0] T102;
  wire[5:0] T103;
  wire[4:0] T104;
  wire[4:0] T105;
  wire[3:0] T106;
  wire[3:0] T107;
  wire[2:0] T108;
  wire[2:0] T109;
  wire[1:0] T110;
  wire[1:0] T111;
  wire T112;
  wire T113;
  wire T114;
  wire[3:0] T115;
  wire[3:0] T116;
  wire[3:0] T117;
  wire[1:0] T118;
  wire[3:0] T119;
  wire[3:0] T120;
  wire T121;
  wire T122;
  wire T123;
  wire[3:0] T124;
  wire[3:0] T125;
  wire[3:0] T126;
  wire[1:0] T127;
  wire[3:0] T128;
  wire[3:0] T129;
  wire T130;
  wire T131;
  wire T132;
  wire[3:0] T133;
  wire[3:0] T134;
  wire[3:0] T135;
  wire[1:0] T136;
  wire[3:0] T137;
  wire[3:0] T138;
  wire T139;
  wire T140;
  wire T141;
  wire[3:0] T142;
  wire[3:0] T143;
  wire[3:0] T144;
  wire[1:0] T145;
  wire[3:0] T146;
  wire[3:0] T147;
  wire T148;
  wire T149;
  wire T150;
  wire[3:0] T151;
  wire[3:0] T152;
  wire[3:0] T153;
  wire[1:0] T154;
  wire[3:0] T155;
  wire[3:0] T156;
  wire T157;
  wire T158;
  wire T159;
  wire[3:0] T160;
  wire[3:0] T161;
  wire[3:0] T162;
  wire[1:0] T163;
  wire[3:0] T164;
  wire[3:0] T165;
  wire T166;
  wire T167;
  wire T168;
  wire[3:0] T169;
  wire[3:0] T170;
  wire[3:0] T171;
  wire[1:0] T172;
  wire[3:0] T173;
  wire[3:0] T174;
  wire T175;
  wire T176;
  wire T177;
  wire[3:0] T178;
  wire[3:0] T179;
  wire[3:0] T180;
  wire[1:0] T181;
  wire[3:0] T182;
  wire[3:0] T183;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T90, T2};
  assign T2 = T3;
  assign T3 = {T82, T4};
  assign T4 = T5;
  assign T5 = {T74, T6};
  assign T6 = T7;
  assign T7 = {T66, T8};
  assign T8 = T9;
  assign T9 = {T58, T10};
  assign T10 = T11;
  assign T11 = {T50, T12};
  assign T12 = T13;
  assign T13 = {T42, T14};
  assign T14 = T15;
  assign T15 = {T34, T16};
  assign T16 = T17;
  assign T17 = {T26, T18};
  assign T18 = T19;
  assign T19 = T20;
  assign T20 = T24[T21];
  assign T21 = T22;
  assign T22 = T23;
  assign T23 = io_chanxy_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T24 = T25;
  assign T25 = io_chanxy_in[4'h8/* 8*/:1'h0/* 0*/];
  assign T26 = T27;
  assign T27 = T28;
  assign T28 = T32[T29];
  assign T29 = T30;
  assign T30 = T31;
  assign T31 = io_chanxy_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T32 = T33;
  assign T33 = io_chanxy_in[5'h11/* 17*/:4'h9/* 9*/];
  assign T34 = T35;
  assign T35 = T36;
  assign T36 = T40[T37];
  assign T37 = T38;
  assign T38 = T39;
  assign T39 = io_chanxy_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T40 = T41;
  assign T41 = io_chanxy_in[5'h1a/* 26*/:5'h12/* 18*/];
  assign T42 = T43;
  assign T43 = T44;
  assign T44 = T48[T45];
  assign T45 = T46;
  assign T46 = T47;
  assign T47 = io_chanxy_config[4'he/* 14*/:4'hc/* 12*/];
  assign T48 = T49;
  assign T49 = io_chanxy_in[6'h22/* 34*/:5'h1b/* 27*/];
  assign T50 = T51;
  assign T51 = T52;
  assign T52 = T56[T53];
  assign T53 = T54;
  assign T54 = T55;
  assign T55 = io_chanxy_config[5'h11/* 17*/:4'hf/* 15*/];
  assign T56 = T57;
  assign T57 = io_chanxy_in[6'h2a/* 42*/:6'h23/* 35*/];
  assign T58 = T59;
  assign T59 = T60;
  assign T60 = T64[T61];
  assign T61 = T62;
  assign T62 = T63;
  assign T63 = io_chanxy_config[5'h15/* 21*/:5'h12/* 18*/];
  assign T64 = T65;
  assign T65 = io_chanxy_in[6'h33/* 51*/:6'h2b/* 43*/];
  assign T66 = T67;
  assign T67 = T68;
  assign T68 = T72[T69];
  assign T69 = T70;
  assign T70 = T71;
  assign T71 = io_chanxy_config[5'h19/* 25*/:5'h16/* 22*/];
  assign T72 = T73;
  assign T73 = io_chanxy_in[6'h3c/* 60*/:6'h34/* 52*/];
  assign T74 = T75;
  assign T75 = T76;
  assign T76 = T80[T77];
  assign T77 = T78;
  assign T78 = T79;
  assign T79 = io_chanxy_config[5'h1d/* 29*/:5'h1a/* 26*/];
  assign T80 = T81;
  assign T81 = io_chanxy_in[7'h45/* 69*/:6'h3d/* 61*/];
  assign T82 = T83;
  assign T83 = T84;
  assign T84 = T88[T85];
  assign T85 = T86;
  assign T86 = T87;
  assign T87 = io_chanxy_config[6'h20/* 32*/:5'h1e/* 30*/];
  assign T88 = T89;
  assign T89 = io_chanxy_in[7'h4d/* 77*/:7'h46/* 70*/];
  assign T90 = T91;
  assign T91 = T92;
  assign T92 = T96[T93];
  assign T93 = T94;
  assign T94 = T95;
  assign T95 = io_chanxy_config[6'h23/* 35*/:6'h21/* 33*/];
  assign T96 = T97;
  assign T97 = io_chanxy_in[7'h55/* 85*/:7'h4e/* 78*/];
  assign io_ipin_out = T98;
  assign T98 = T99;
  assign T99 = {T175, T100};
  assign T100 = T101;
  assign T101 = {T166, T102};
  assign T102 = T103;
  assign T103 = {T157, T104};
  assign T104 = T105;
  assign T105 = {T148, T106};
  assign T106 = T107;
  assign T107 = {T139, T108};
  assign T108 = T109;
  assign T109 = {T130, T110};
  assign T110 = T111;
  assign T111 = {T121, T112};
  assign T112 = T113;
  assign T113 = T114;
  assign T114 = T119[T115];
  assign T115 = T116;
  assign T116 = T117;
  assign T117 = {2'h0/* 0*/, T118};
  assign T118 = io_ipin_config[1'h1/* 1*/:1'h0/* 0*/];
  assign T119 = T120;
  assign T120 = io_ipin_in[2'h3/* 3*/:1'h0/* 0*/];
  assign T121 = T122;
  assign T122 = T123;
  assign T123 = T128[T124];
  assign T124 = T125;
  assign T125 = T126;
  assign T126 = {2'h0/* 0*/, T127};
  assign T127 = io_ipin_config[2'h3/* 3*/:2'h2/* 2*/];
  assign T128 = T129;
  assign T129 = io_ipin_in[3'h7/* 7*/:3'h4/* 4*/];
  assign T130 = T131;
  assign T131 = T132;
  assign T132 = T137[T133];
  assign T133 = T134;
  assign T134 = T135;
  assign T135 = {2'h0/* 0*/, T136};
  assign T136 = io_ipin_config[3'h5/* 5*/:3'h4/* 4*/];
  assign T137 = T138;
  assign T138 = io_ipin_in[4'hb/* 11*/:4'h8/* 8*/];
  assign T139 = T140;
  assign T140 = T141;
  assign T141 = T146[T142];
  assign T142 = T143;
  assign T143 = T144;
  assign T144 = {2'h0/* 0*/, T145};
  assign T145 = io_ipin_config[3'h7/* 7*/:3'h6/* 6*/];
  assign T146 = T147;
  assign T147 = io_ipin_in[4'hf/* 15*/:4'hc/* 12*/];
  assign T148 = T149;
  assign T149 = T150;
  assign T150 = T155[T151];
  assign T151 = T152;
  assign T152 = T153;
  assign T153 = {2'h0/* 0*/, T154};
  assign T154 = io_ipin_config[4'h9/* 9*/:4'h8/* 8*/];
  assign T155 = T156;
  assign T156 = io_ipin_in[5'h13/* 19*/:5'h10/* 16*/];
  assign T157 = T158;
  assign T158 = T159;
  assign T159 = T164[T160];
  assign T160 = T161;
  assign T161 = T162;
  assign T162 = {2'h0/* 0*/, T163};
  assign T163 = io_ipin_config[4'hb/* 11*/:4'ha/* 10*/];
  assign T164 = T165;
  assign T165 = io_ipin_in[5'h17/* 23*/:5'h14/* 20*/];
  assign T166 = T167;
  assign T167 = T168;
  assign T168 = T173[T169];
  assign T169 = T170;
  assign T170 = T171;
  assign T171 = {2'h0/* 0*/, T172};
  assign T172 = io_ipin_config[4'hd/* 13*/:4'hc/* 12*/];
  assign T173 = T174;
  assign T174 = io_ipin_in[5'h1b/* 27*/:5'h18/* 24*/];
  assign T175 = T176;
  assign T176 = T177;
  assign T177 = T182[T178];
  assign T178 = T179;
  assign T179 = T180;
  assign T180 = {2'h0/* 0*/, T181};
  assign T181 = io_ipin_config[4'hf/* 15*/:4'he/* 14*/];
  assign T182 = T183;
  assign T183 = io_ipin_in[5'h1f/* 31*/:5'h1c/* 28*/];
endmodule

module io_tile_sp_1(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [85:0] io_chanxy_in,
    output[9:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[9:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_2(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [85:0] io_chanxy_in,
    output[9:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[9:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_3(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [85:0] io_chanxy_in,
    output[9:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[9:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_wc_2(
    input [31:0] io_ipin_in,
    input [15:0] io_ipin_config,
    input [80:0] io_chanxy_in,
    input [35:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[24:0] io_chanxy_out);

  wire[24:0] T0;
  wire[24:0] T1;
  wire[23:0] T2;
  wire[23:0] T3;
  wire[22:0] T4;
  wire[22:0] T5;
  wire[21:0] T6;
  wire[21:0] T7;
  wire[20:0] T8;
  wire[20:0] T9;
  wire[19:0] T10;
  wire[19:0] T11;
  wire[18:0] T12;
  wire[18:0] T13;
  wire[17:0] T14;
  wire[17:0] T15;
  wire[16:0] T16;
  wire[16:0] T17;
  wire[15:0] T18;
  wire[15:0] T19;
  wire[14:0] T20;
  wire[14:0] T21;
  wire[13:0] T22;
  wire[13:0] T23;
  wire[12:0] T24;
  wire[12:0] T25;
  wire[11:0] T26;
  wire[11:0] T27;
  wire[10:0] T28;
  wire[10:0] T29;
  wire[9:0] T30;
  wire[9:0] T31;
  wire[8:0] T32;
  wire[8:0] T33;
  wire[7:0] T34;
  wire[7:0] T35;
  wire[6:0] T36;
  wire[6:0] T37;
  wire[5:0] T38;
  wire[5:0] T39;
  wire[4:0] T40;
  wire[4:0] T41;
  wire[3:0] T42;
  wire[3:0] T43;
  wire[2:0] T44;
  wire[2:0] T45;
  wire[1:0] T46;
  wire[1:0] T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire[1:0] T54;
  wire[1:0] T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire[1:0] T62;
  wire[1:0] T63;
  wire T64;
  wire T65;
  wire T66;
  wire T67;
  wire T68;
  wire T69;
  wire[1:0] T70;
  wire[1:0] T71;
  wire T72;
  wire T73;
  wire T74;
  wire T75;
  wire T76;
  wire T77;
  wire[1:0] T78;
  wire[1:0] T79;
  wire T80;
  wire T81;
  wire T82;
  wire T83;
  wire T84;
  wire T85;
  wire[1:0] T86;
  wire[1:0] T87;
  wire T88;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire T93;
  wire[1:0] T94;
  wire[1:0] T95;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire T100;
  wire T101;
  wire[1:0] T102;
  wire[1:0] T103;
  wire T104;
  wire T105;
  wire T106;
  wire T107;
  wire T108;
  wire T109;
  wire[1:0] T110;
  wire[1:0] T111;
  wire T112;
  wire T113;
  wire T114;
  wire T115;
  wire T116;
  wire T117;
  wire[1:0] T118;
  wire[1:0] T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire T124;
  wire T125;
  wire T126;
  wire T127;
  wire T128;
  wire[1:0] T129;
  wire[1:0] T130;
  wire T131;
  wire T132;
  wire T133;
  wire T134;
  wire T135;
  wire T136;
  wire[1:0] T137;
  wire[1:0] T138;
  wire T139;
  wire T140;
  wire T141;
  wire T142;
  wire T143;
  wire T144;
  wire[1:0] T145;
  wire[1:0] T146;
  wire T147;
  wire T148;
  wire T149;
  wire T150;
  wire T151;
  wire T152;
  wire[1:0] T153;
  wire[1:0] T154;
  wire T155;
  wire T156;
  wire T157;
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
  wire[3:0] T193;
  wire[3:0] T194;
  wire[3:0] T195;
  wire[8:0] T196;
  wire[8:0] T197;
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
  wire[2:0] T209;
  wire[2:0] T210;
  wire[2:0] T211;
  wire[7:0] T212;
  wire[7:0] T213;
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
  wire[2:0] T225;
  wire[2:0] T226;
  wire[2:0] T227;
  wire[7:0] T228;
  wire[7:0] T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire[1:0] T236;
  wire[1:0] T237;
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
  wire[3:0] T255;
  wire[3:0] T256;
  wire[3:0] T257;
  wire[1:0] T258;
  wire[3:0] T259;
  wire[3:0] T260;
  wire T261;
  wire T262;
  wire T263;
  wire[3:0] T264;
  wire[3:0] T265;
  wire[3:0] T266;
  wire[1:0] T267;
  wire[3:0] T268;
  wire[3:0] T269;
  wire T270;
  wire T271;
  wire T272;
  wire[3:0] T273;
  wire[3:0] T274;
  wire[3:0] T275;
  wire[1:0] T276;
  wire[3:0] T277;
  wire[3:0] T278;
  wire T279;
  wire T280;
  wire T281;
  wire[3:0] T282;
  wire[3:0] T283;
  wire[3:0] T284;
  wire[1:0] T285;
  wire[3:0] T286;
  wire[3:0] T287;
  wire T288;
  wire T289;
  wire T290;
  wire[3:0] T291;
  wire[3:0] T292;
  wire[3:0] T293;
  wire[1:0] T294;
  wire[3:0] T295;
  wire[3:0] T296;
  wire T297;
  wire T298;
  wire T299;
  wire[3:0] T300;
  wire[3:0] T301;
  wire[3:0] T302;
  wire[1:0] T303;
  wire[3:0] T304;
  wire[3:0] T305;
  wire T306;
  wire T307;
  wire T308;
  wire[3:0] T309;
  wire[3:0] T310;
  wire[3:0] T311;
  wire[1:0] T312;
  wire[3:0] T313;
  wire[3:0] T314;
  wire T315;
  wire T316;
  wire T317;
  wire[3:0] T318;
  wire[3:0] T319;
  wire[3:0] T320;
  wire[1:0] T321;
  wire[3:0] T322;
  wire[3:0] T323;

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
  assign T21 = {T155, T22};
  assign T22 = T23;
  assign T23 = {T147, T24};
  assign T24 = T25;
  assign T25 = {T139, T26};
  assign T26 = T27;
  assign T27 = {T131, T28};
  assign T28 = T29;
  assign T29 = {T123, T30};
  assign T30 = T31;
  assign T31 = {T120, T32};
  assign T32 = T33;
  assign T33 = {T112, T34};
  assign T34 = T35;
  assign T35 = {T104, T36};
  assign T36 = T37;
  assign T37 = {T96, T38};
  assign T38 = T39;
  assign T39 = {T88, T40};
  assign T40 = T41;
  assign T41 = {T80, T42};
  assign T42 = T43;
  assign T43 = {T72, T44};
  assign T44 = T45;
  assign T45 = {T64, T46};
  assign T46 = T47;
  assign T47 = {T56, T48};
  assign T48 = T49;
  assign T49 = T50;
  assign T50 = T54[T51];
  assign T51 = T52;
  assign T52 = T53;
  assign T53 = io_chanxy_config[1'h0/* 0*/:1'h0/* 0*/];
  assign T54 = T55;
  assign T55 = io_chanxy_in[1'h1/* 1*/:1'h0/* 0*/];
  assign T56 = T57;
  assign T57 = T58;
  assign T58 = T62[T59];
  assign T59 = T60;
  assign T60 = T61;
  assign T61 = io_chanxy_config[1'h1/* 1*/:1'h1/* 1*/];
  assign T62 = T63;
  assign T63 = io_chanxy_in[2'h3/* 3*/:2'h2/* 2*/];
  assign T64 = T65;
  assign T65 = T66;
  assign T66 = T70[T67];
  assign T67 = T68;
  assign T68 = T69;
  assign T69 = io_chanxy_config[2'h2/* 2*/:2'h2/* 2*/];
  assign T70 = T71;
  assign T71 = io_chanxy_in[3'h5/* 5*/:3'h4/* 4*/];
  assign T72 = T73;
  assign T73 = T74;
  assign T74 = T78[T75];
  assign T75 = T76;
  assign T76 = T77;
  assign T77 = io_chanxy_config[2'h3/* 3*/:2'h3/* 3*/];
  assign T78 = T79;
  assign T79 = io_chanxy_in[3'h7/* 7*/:3'h6/* 6*/];
  assign T80 = T81;
  assign T81 = T82;
  assign T82 = T86[T83];
  assign T83 = T84;
  assign T84 = T85;
  assign T85 = io_chanxy_config[3'h4/* 4*/:3'h4/* 4*/];
  assign T86 = T87;
  assign T87 = io_chanxy_in[4'h9/* 9*/:4'h8/* 8*/];
  assign T88 = T89;
  assign T89 = T90;
  assign T90 = T94[T91];
  assign T91 = T92;
  assign T92 = T93;
  assign T93 = io_chanxy_config[3'h5/* 5*/:3'h5/* 5*/];
  assign T94 = T95;
  assign T95 = io_chanxy_in[4'hb/* 11*/:4'ha/* 10*/];
  assign T96 = T97;
  assign T97 = T98;
  assign T98 = T102[T99];
  assign T99 = T100;
  assign T100 = T101;
  assign T101 = io_chanxy_config[3'h6/* 6*/:3'h6/* 6*/];
  assign T102 = T103;
  assign T103 = io_chanxy_in[4'hd/* 13*/:4'hc/* 12*/];
  assign T104 = T105;
  assign T105 = T106;
  assign T106 = T110[T107];
  assign T107 = T108;
  assign T108 = T109;
  assign T109 = io_chanxy_config[3'h7/* 7*/:3'h7/* 7*/];
  assign T110 = T111;
  assign T111 = io_chanxy_in[4'hf/* 15*/:4'he/* 14*/];
  assign T112 = T113;
  assign T113 = T114;
  assign T114 = T118[T115];
  assign T115 = T116;
  assign T116 = T117;
  assign T117 = io_chanxy_config[4'h8/* 8*/:4'h8/* 8*/];
  assign T118 = T119;
  assign T119 = io_chanxy_in[5'h11/* 17*/:5'h10/* 16*/];
  assign T120 = T121;
  assign T121 = T122;
  assign T122 = io_chanxy_in[5'h12/* 18*/:5'h12/* 18*/];
  assign T123 = T124;
  assign T124 = T125;
  assign T125 = T129[T126];
  assign T126 = T127;
  assign T127 = T128;
  assign T128 = io_chanxy_config[4'h9/* 9*/:4'h9/* 9*/];
  assign T129 = T130;
  assign T130 = io_chanxy_in[5'h14/* 20*/:5'h13/* 19*/];
  assign T131 = T132;
  assign T132 = T133;
  assign T133 = T137[T134];
  assign T134 = T135;
  assign T135 = T136;
  assign T136 = io_chanxy_config[4'ha/* 10*/:4'ha/* 10*/];
  assign T137 = T138;
  assign T138 = io_chanxy_in[5'h16/* 22*/:5'h15/* 21*/];
  assign T139 = T140;
  assign T140 = T141;
  assign T141 = T145[T142];
  assign T142 = T143;
  assign T143 = T144;
  assign T144 = io_chanxy_config[4'hb/* 11*/:4'hb/* 11*/];
  assign T145 = T146;
  assign T146 = io_chanxy_in[5'h18/* 24*/:5'h17/* 23*/];
  assign T147 = T148;
  assign T148 = T149;
  assign T149 = T153[T150];
  assign T150 = T151;
  assign T151 = T152;
  assign T152 = io_chanxy_config[4'hc/* 12*/:4'hc/* 12*/];
  assign T153 = T154;
  assign T154 = io_chanxy_in[5'h1a/* 26*/:5'h19/* 25*/];
  assign T155 = T156;
  assign T156 = T157;
  assign T157 = io_chanxy_in[5'h1b/* 27*/:5'h1b/* 27*/];
  assign T158 = T159;
  assign T159 = T160;
  assign T160 = T164[T161];
  assign T161 = T162;
  assign T162 = T163;
  assign T163 = io_chanxy_config[5'h10/* 16*/:4'hd/* 13*/];
  assign T164 = T165;
  assign T165 = io_chanxy_in[6'h24/* 36*/:5'h1c/* 28*/];
  assign T166 = T167;
  assign T167 = T168;
  assign T168 = T172[T169];
  assign T169 = T170;
  assign T170 = T171;
  assign T171 = io_chanxy_config[5'h11/* 17*/:5'h11/* 17*/];
  assign T172 = T173;
  assign T173 = io_chanxy_in[6'h26/* 38*/:6'h25/* 37*/];
  assign T174 = T175;
  assign T175 = T176;
  assign T176 = T180[T177];
  assign T177 = T178;
  assign T178 = T179;
  assign T179 = io_chanxy_config[5'h15/* 21*/:5'h12/* 18*/];
  assign T180 = T181;
  assign T181 = io_chanxy_in[6'h2f/* 47*/:6'h27/* 39*/];
  assign T182 = T183;
  assign T183 = T184;
  assign T184 = T188[T185];
  assign T185 = T186;
  assign T186 = T187;
  assign T187 = io_chanxy_config[5'h16/* 22*/:5'h16/* 22*/];
  assign T188 = T189;
  assign T189 = io_chanxy_in[6'h31/* 49*/:6'h30/* 48*/];
  assign T190 = T191;
  assign T191 = T192;
  assign T192 = T196[T193];
  assign T193 = T194;
  assign T194 = T195;
  assign T195 = io_chanxy_config[5'h1a/* 26*/:5'h17/* 23*/];
  assign T196 = T197;
  assign T197 = io_chanxy_in[6'h3a/* 58*/:6'h32/* 50*/];
  assign T198 = T199;
  assign T199 = T200;
  assign T200 = T204[T201];
  assign T201 = T202;
  assign T202 = T203;
  assign T203 = io_chanxy_config[5'h1b/* 27*/:5'h1b/* 27*/];
  assign T204 = T205;
  assign T205 = io_chanxy_in[6'h3c/* 60*/:6'h3b/* 59*/];
  assign T206 = T207;
  assign T207 = T208;
  assign T208 = T212[T209];
  assign T209 = T210;
  assign T210 = T211;
  assign T211 = io_chanxy_config[5'h1e/* 30*/:5'h1c/* 28*/];
  assign T212 = T213;
  assign T213 = io_chanxy_in[7'h44/* 68*/:6'h3d/* 61*/];
  assign T214 = T215;
  assign T215 = T216;
  assign T216 = T220[T217];
  assign T217 = T218;
  assign T218 = T219;
  assign T219 = io_chanxy_config[5'h1f/* 31*/:5'h1f/* 31*/];
  assign T220 = T221;
  assign T221 = io_chanxy_in[7'h46/* 70*/:7'h45/* 69*/];
  assign T222 = T223;
  assign T223 = T224;
  assign T224 = T228[T225];
  assign T225 = T226;
  assign T226 = T227;
  assign T227 = io_chanxy_config[6'h22/* 34*/:6'h20/* 32*/];
  assign T228 = T229;
  assign T229 = io_chanxy_in[7'h4e/* 78*/:7'h47/* 71*/];
  assign T230 = T231;
  assign T231 = T232;
  assign T232 = T236[T233];
  assign T233 = T234;
  assign T234 = T235;
  assign T235 = io_chanxy_config[6'h23/* 35*/:6'h23/* 35*/];
  assign T236 = T237;
  assign T237 = io_chanxy_in[7'h50/* 80*/:7'h4f/* 79*/];
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
  assign T257 = {2'h0/* 0*/, T258};
  assign T258 = io_ipin_config[1'h1/* 1*/:1'h0/* 0*/];
  assign T259 = T260;
  assign T260 = io_ipin_in[2'h3/* 3*/:1'h0/* 0*/];
  assign T261 = T262;
  assign T262 = T263;
  assign T263 = T268[T264];
  assign T264 = T265;
  assign T265 = T266;
  assign T266 = {2'h0/* 0*/, T267};
  assign T267 = io_ipin_config[2'h3/* 3*/:2'h2/* 2*/];
  assign T268 = T269;
  assign T269 = io_ipin_in[3'h7/* 7*/:3'h4/* 4*/];
  assign T270 = T271;
  assign T271 = T272;
  assign T272 = T277[T273];
  assign T273 = T274;
  assign T274 = T275;
  assign T275 = {2'h0/* 0*/, T276};
  assign T276 = io_ipin_config[3'h5/* 5*/:3'h4/* 4*/];
  assign T277 = T278;
  assign T278 = io_ipin_in[4'hb/* 11*/:4'h8/* 8*/];
  assign T279 = T280;
  assign T280 = T281;
  assign T281 = T286[T282];
  assign T282 = T283;
  assign T283 = T284;
  assign T284 = {2'h0/* 0*/, T285};
  assign T285 = io_ipin_config[3'h7/* 7*/:3'h6/* 6*/];
  assign T286 = T287;
  assign T287 = io_ipin_in[4'hf/* 15*/:4'hc/* 12*/];
  assign T288 = T289;
  assign T289 = T290;
  assign T290 = T295[T291];
  assign T291 = T292;
  assign T292 = T293;
  assign T293 = {2'h0/* 0*/, T294};
  assign T294 = io_ipin_config[4'h9/* 9*/:4'h8/* 8*/];
  assign T295 = T296;
  assign T296 = io_ipin_in[5'h13/* 19*/:5'h10/* 16*/];
  assign T297 = T298;
  assign T298 = T299;
  assign T299 = T304[T300];
  assign T300 = T301;
  assign T301 = T302;
  assign T302 = {2'h0/* 0*/, T303};
  assign T303 = io_ipin_config[4'hb/* 11*/:4'ha/* 10*/];
  assign T304 = T305;
  assign T305 = io_ipin_in[5'h17/* 23*/:5'h14/* 20*/];
  assign T306 = T307;
  assign T307 = T308;
  assign T308 = T313[T309];
  assign T309 = T310;
  assign T310 = T311;
  assign T311 = {2'h0/* 0*/, T312};
  assign T312 = io_ipin_config[4'hd/* 13*/:4'hc/* 12*/];
  assign T313 = T314;
  assign T314 = io_ipin_in[5'h1b/* 27*/:5'h18/* 24*/];
  assign T315 = T316;
  assign T316 = T317;
  assign T317 = T322[T318];
  assign T318 = T319;
  assign T319 = T320;
  assign T320 = {2'h0/* 0*/, T321};
  assign T321 = io_ipin_config[4'hf/* 15*/:4'he/* 14*/];
  assign T322 = T323;
  assign T323 = io_ipin_in[5'h1f/* 31*/:5'h1c/* 28*/];
endmodule

module io_tile_sp_4(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [80:0] io_chanxy_in,
    output[24:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[24:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h5/* 5*/};
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_woc(
    input [31:0] io_ipin_in,
    input [15:0] io_ipin_config,
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
  wire[3:0] T17;
  wire[3:0] T18;
  wire[3:0] T19;
  wire[1:0] T20;
  wire[3:0] T21;
  wire[3:0] T22;
  wire T23;
  wire T24;
  wire T25;
  wire[3:0] T26;
  wire[3:0] T27;
  wire[3:0] T28;
  wire[1:0] T29;
  wire[3:0] T30;
  wire[3:0] T31;
  wire T32;
  wire T33;
  wire T34;
  wire[3:0] T35;
  wire[3:0] T36;
  wire[3:0] T37;
  wire[1:0] T38;
  wire[3:0] T39;
  wire[3:0] T40;
  wire T41;
  wire T42;
  wire T43;
  wire[3:0] T44;
  wire[3:0] T45;
  wire[3:0] T46;
  wire[1:0] T47;
  wire[3:0] T48;
  wire[3:0] T49;
  wire T50;
  wire T51;
  wire T52;
  wire[3:0] T53;
  wire[3:0] T54;
  wire[3:0] T55;
  wire[1:0] T56;
  wire[3:0] T57;
  wire[3:0] T58;
  wire T59;
  wire T60;
  wire T61;
  wire[3:0] T62;
  wire[3:0] T63;
  wire[3:0] T64;
  wire[1:0] T65;
  wire[3:0] T66;
  wire[3:0] T67;
  wire T68;
  wire T69;
  wire T70;
  wire[3:0] T71;
  wire[3:0] T72;
  wire[3:0] T73;
  wire[1:0] T74;
  wire[3:0] T75;
  wire[3:0] T76;
  wire T77;
  wire T78;
  wire T79;
  wire[3:0] T80;
  wire[3:0] T81;
  wire[3:0] T82;
  wire[1:0] T83;
  wire[3:0] T84;
  wire[3:0] T85;

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
  assign T19 = {2'h0/* 0*/, T20};
  assign T20 = io_ipin_config[1'h1/* 1*/:1'h0/* 0*/];
  assign T21 = T22;
  assign T22 = io_ipin_in[2'h3/* 3*/:1'h0/* 0*/];
  assign T23 = T24;
  assign T24 = T25;
  assign T25 = T30[T26];
  assign T26 = T27;
  assign T27 = T28;
  assign T28 = {2'h0/* 0*/, T29};
  assign T29 = io_ipin_config[2'h3/* 3*/:2'h2/* 2*/];
  assign T30 = T31;
  assign T31 = io_ipin_in[3'h7/* 7*/:3'h4/* 4*/];
  assign T32 = T33;
  assign T33 = T34;
  assign T34 = T39[T35];
  assign T35 = T36;
  assign T36 = T37;
  assign T37 = {2'h0/* 0*/, T38};
  assign T38 = io_ipin_config[3'h5/* 5*/:3'h4/* 4*/];
  assign T39 = T40;
  assign T40 = io_ipin_in[4'hb/* 11*/:4'h8/* 8*/];
  assign T41 = T42;
  assign T42 = T43;
  assign T43 = T48[T44];
  assign T44 = T45;
  assign T45 = T46;
  assign T46 = {2'h0/* 0*/, T47};
  assign T47 = io_ipin_config[3'h7/* 7*/:3'h6/* 6*/];
  assign T48 = T49;
  assign T49 = io_ipin_in[4'hf/* 15*/:4'hc/* 12*/];
  assign T50 = T51;
  assign T51 = T52;
  assign T52 = T57[T53];
  assign T53 = T54;
  assign T54 = T55;
  assign T55 = {2'h0/* 0*/, T56};
  assign T56 = io_ipin_config[4'h9/* 9*/:4'h8/* 8*/];
  assign T57 = T58;
  assign T58 = io_ipin_in[5'h13/* 19*/:5'h10/* 16*/];
  assign T59 = T60;
  assign T60 = T61;
  assign T61 = T66[T62];
  assign T62 = T63;
  assign T63 = T64;
  assign T64 = {2'h0/* 0*/, T65};
  assign T65 = io_ipin_config[4'hb/* 11*/:4'ha/* 10*/];
  assign T66 = T67;
  assign T67 = io_ipin_in[5'h17/* 23*/:5'h14/* 20*/];
  assign T68 = T69;
  assign T69 = T70;
  assign T70 = T75[T71];
  assign T71 = T72;
  assign T72 = T73;
  assign T73 = {2'h0/* 0*/, T74};
  assign T74 = io_ipin_config[4'hd/* 13*/:4'hc/* 12*/];
  assign T75 = T76;
  assign T76 = io_ipin_in[5'h1b/* 27*/:5'h18/* 24*/];
  assign T77 = T78;
  assign T78 = T79;
  assign T79 = T84[T80];
  assign T80 = T81;
  assign T81 = T82;
  assign T82 = {2'h0/* 0*/, T83};
  assign T83 = io_ipin_config[4'hf/* 15*/:4'he/* 14*/];
  assign T84 = T85;
  assign T85 = io_ipin_in[5'h1f/* 31*/:5'h1c/* 28*/];
endmodule


module io_tile_sp_5(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {7'h0/* 0*/, 1'h1/* 1*/};
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

module io_tile_sp_6(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {6'h0/* 0*/, 2'h2/* 2*/};
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

module io_tile_sp_7(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {6'h0/* 0*/, 2'h3/* 3*/};
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

module io_tile_sp_8(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h4/* 4*/};
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

module io_tile_sp_9(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h5/* 5*/};
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

module io_tile_sp_10(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [80:0] io_chanxy_in,
    output[24:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[24:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_11(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [85:0] io_chanxy_in,
    output[9:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[9:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_12(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [85:0] io_chanxy_in,
    output[9:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[9:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_13(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [85:0] io_chanxy_in,
    output[9:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[9:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_14(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [80:0] io_chanxy_in,
    output[24:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[24:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {5'h0/* 0*/, 3'h5/* 5*/};
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
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
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h6/* 6*/};
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

module io_tile_sp_16(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h6/* 6*/};
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

module io_tile_sp_17(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h6/* 6*/};
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

module io_tile_sp_18(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h6/* 6*/};
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

module io_tile_sp_19(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h6/* 6*/};
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


// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module io_sbcb_wc(
    input [31:0] io_ipin_in,
    input [15:0] io_ipin_config,
    input [80:0] io_chanxy_in,
    input [35:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[24:0] io_chanxy_out);

  wire[24:0] T0;
  wire[24:0] T1;
  wire[23:0] T2;
  wire[23:0] T3;
  wire[22:0] T4;
  wire[22:0] T5;
  wire[21:0] T6;
  wire[21:0] T7;
  wire[20:0] T8;
  wire[20:0] T9;
  wire[19:0] T10;
  wire[19:0] T11;
  wire[18:0] T12;
  wire[18:0] T13;
  wire[17:0] T14;
  wire[17:0] T15;
  wire[16:0] T16;
  wire[16:0] T17;
  wire[15:0] T18;
  wire[15:0] T19;
  wire[14:0] T20;
  wire[14:0] T21;
  wire[13:0] T22;
  wire[13:0] T23;
  wire[12:0] T24;
  wire[12:0] T25;
  wire[11:0] T26;
  wire[11:0] T27;
  wire[10:0] T28;
  wire[10:0] T29;
  wire[9:0] T30;
  wire[9:0] T31;
  wire[8:0] T32;
  wire[8:0] T33;
  wire[7:0] T34;
  wire[7:0] T35;
  wire[6:0] T36;
  wire[6:0] T37;
  wire[5:0] T38;
  wire[5:0] T39;
  wire[4:0] T40;
  wire[4:0] T41;
  wire[3:0] T42;
  wire[3:0] T43;
  wire[2:0] T44;
  wire[2:0] T45;
  wire[1:0] T46;
  wire[1:0] T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire[1:0] T54;
  wire[1:0] T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire[1:0] T62;
  wire[1:0] T63;
  wire T64;
  wire T65;
  wire T66;
  wire[3:0] T67;
  wire[3:0] T68;
  wire[3:0] T69;
  wire[8:0] T70;
  wire[8:0] T71;
  wire T72;
  wire T73;
  wire T74;
  wire T75;
  wire T76;
  wire T77;
  wire[1:0] T78;
  wire[1:0] T79;
  wire T80;
  wire T81;
  wire T82;
  wire T83;
  wire T84;
  wire T85;
  wire[1:0] T86;
  wire[1:0] T87;
  wire T88;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire T93;
  wire[1:0] T94;
  wire[1:0] T95;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire T100;
  wire T101;
  wire[1:0] T102;
  wire[1:0] T103;
  wire T104;
  wire T105;
  wire T106;
  wire[3:0] T107;
  wire[3:0] T108;
  wire[3:0] T109;
  wire[8:0] T110;
  wire[8:0] T111;
  wire T112;
  wire T113;
  wire T114;
  wire T115;
  wire T116;
  wire T117;
  wire[1:0] T118;
  wire[1:0] T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire T124;
  wire T125;
  wire[1:0] T126;
  wire[1:0] T127;
  wire T128;
  wire T129;
  wire T130;
  wire T131;
  wire T132;
  wire T133;
  wire[1:0] T134;
  wire[1:0] T135;
  wire T136;
  wire T137;
  wire T138;
  wire T139;
  wire T140;
  wire T141;
  wire[1:0] T142;
  wire[1:0] T143;
  wire T144;
  wire T145;
  wire T146;
  wire[3:0] T147;
  wire[3:0] T148;
  wire[3:0] T149;
  wire[8:0] T150;
  wire[8:0] T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  wire T156;
  wire T157;
  wire[1:0] T158;
  wire[1:0] T159;
  wire T160;
  wire T161;
  wire T162;
  wire T163;
  wire T164;
  wire T165;
  wire[1:0] T166;
  wire[1:0] T167;
  wire T168;
  wire T169;
  wire T170;
  wire T171;
  wire T172;
  wire T173;
  wire[1:0] T174;
  wire[1:0] T175;
  wire T176;
  wire T177;
  wire T178;
  wire T179;
  wire T180;
  wire T181;
  wire[1:0] T182;
  wire[1:0] T183;
  wire T184;
  wire T185;
  wire T186;
  wire[2:0] T187;
  wire[2:0] T188;
  wire[2:0] T189;
  wire[7:0] T190;
  wire[7:0] T191;
  wire T192;
  wire T193;
  wire T194;
  wire T195;
  wire T196;
  wire T197;
  wire[1:0] T198;
  wire[1:0] T199;
  wire T200;
  wire T201;
  wire T202;
  wire T203;
  wire T204;
  wire T205;
  wire[1:0] T206;
  wire[1:0] T207;
  wire T208;
  wire T209;
  wire T210;
  wire T211;
  wire T212;
  wire T213;
  wire[1:0] T214;
  wire[1:0] T215;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  wire T220;
  wire T221;
  wire[1:0] T222;
  wire[1:0] T223;
  wire T224;
  wire T225;
  wire T226;
  wire[2:0] T227;
  wire[2:0] T228;
  wire[2:0] T229;
  wire[7:0] T230;
  wire[7:0] T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire T236;
  wire T237;
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
  wire[3:0] T255;
  wire[3:0] T256;
  wire[3:0] T257;
  wire[1:0] T258;
  wire[3:0] T259;
  wire[3:0] T260;
  wire T261;
  wire T262;
  wire T263;
  wire[3:0] T264;
  wire[3:0] T265;
  wire[3:0] T266;
  wire[1:0] T267;
  wire[3:0] T268;
  wire[3:0] T269;
  wire T270;
  wire T271;
  wire T272;
  wire[3:0] T273;
  wire[3:0] T274;
  wire[3:0] T275;
  wire[1:0] T276;
  wire[3:0] T277;
  wire[3:0] T278;
  wire T279;
  wire T280;
  wire T281;
  wire[3:0] T282;
  wire[3:0] T283;
  wire[3:0] T284;
  wire[1:0] T285;
  wire[3:0] T286;
  wire[3:0] T287;
  wire T288;
  wire T289;
  wire T290;
  wire[3:0] T291;
  wire[3:0] T292;
  wire[3:0] T293;
  wire[1:0] T294;
  wire[3:0] T295;
  wire[3:0] T296;
  wire T297;
  wire T298;
  wire T299;
  wire[3:0] T300;
  wire[3:0] T301;
  wire[3:0] T302;
  wire[1:0] T303;
  wire[3:0] T304;
  wire[3:0] T305;
  wire T306;
  wire T307;
  wire T308;
  wire[3:0] T309;
  wire[3:0] T310;
  wire[3:0] T311;
  wire[1:0] T312;
  wire[3:0] T313;
  wire[3:0] T314;
  wire T315;
  wire T316;
  wire T317;
  wire[3:0] T318;
  wire[3:0] T319;
  wire[3:0] T320;
  wire[1:0] T321;
  wire[3:0] T322;
  wire[3:0] T323;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T235, T2};
  assign T2 = T3;
  assign T3 = {T232, T4};
  assign T4 = T5;
  assign T5 = {T224, T6};
  assign T6 = T7;
  assign T7 = {T216, T8};
  assign T8 = T9;
  assign T9 = {T208, T10};
  assign T10 = T11;
  assign T11 = {T200, T12};
  assign T12 = T13;
  assign T13 = {T192, T14};
  assign T14 = T15;
  assign T15 = {T184, T16};
  assign T16 = T17;
  assign T17 = {T176, T18};
  assign T18 = T19;
  assign T19 = {T168, T20};
  assign T20 = T21;
  assign T21 = {T160, T22};
  assign T22 = T23;
  assign T23 = {T152, T24};
  assign T24 = T25;
  assign T25 = {T144, T26};
  assign T26 = T27;
  assign T27 = {T136, T28};
  assign T28 = T29;
  assign T29 = {T128, T30};
  assign T30 = T31;
  assign T31 = {T120, T32};
  assign T32 = T33;
  assign T33 = {T112, T34};
  assign T34 = T35;
  assign T35 = {T104, T36};
  assign T36 = T37;
  assign T37 = {T96, T38};
  assign T38 = T39;
  assign T39 = {T88, T40};
  assign T40 = T41;
  assign T41 = {T80, T42};
  assign T42 = T43;
  assign T43 = {T72, T44};
  assign T44 = T45;
  assign T45 = {T64, T46};
  assign T46 = T47;
  assign T47 = {T56, T48};
  assign T48 = T49;
  assign T49 = T50;
  assign T50 = T54[T51];
  assign T51 = T52;
  assign T52 = T53;
  assign T53 = io_chanxy_config[1'h0/* 0*/:1'h0/* 0*/];
  assign T54 = T55;
  assign T55 = io_chanxy_in[1'h1/* 1*/:1'h0/* 0*/];
  assign T56 = T57;
  assign T57 = T58;
  assign T58 = T62[T59];
  assign T59 = T60;
  assign T60 = T61;
  assign T61 = io_chanxy_config[1'h1/* 1*/:1'h1/* 1*/];
  assign T62 = T63;
  assign T63 = io_chanxy_in[2'h3/* 3*/:2'h2/* 2*/];
  assign T64 = T65;
  assign T65 = T66;
  assign T66 = T70[T67];
  assign T67 = T68;
  assign T68 = T69;
  assign T69 = io_chanxy_config[3'h5/* 5*/:2'h2/* 2*/];
  assign T70 = T71;
  assign T71 = io_chanxy_in[4'hc/* 12*/:3'h4/* 4*/];
  assign T72 = T73;
  assign T73 = T74;
  assign T74 = T78[T75];
  assign T75 = T76;
  assign T76 = T77;
  assign T77 = io_chanxy_config[3'h6/* 6*/:3'h6/* 6*/];
  assign T78 = T79;
  assign T79 = io_chanxy_in[4'he/* 14*/:4'hd/* 13*/];
  assign T80 = T81;
  assign T81 = T82;
  assign T82 = T86[T83];
  assign T83 = T84;
  assign T84 = T85;
  assign T85 = io_chanxy_config[3'h7/* 7*/:3'h7/* 7*/];
  assign T86 = T87;
  assign T87 = io_chanxy_in[5'h10/* 16*/:4'hf/* 15*/];
  assign T88 = T89;
  assign T89 = T90;
  assign T90 = T94[T91];
  assign T91 = T92;
  assign T92 = T93;
  assign T93 = io_chanxy_config[4'h8/* 8*/:4'h8/* 8*/];
  assign T94 = T95;
  assign T95 = io_chanxy_in[5'h12/* 18*/:5'h11/* 17*/];
  assign T96 = T97;
  assign T97 = T98;
  assign T98 = T102[T99];
  assign T99 = T100;
  assign T100 = T101;
  assign T101 = io_chanxy_config[4'h9/* 9*/:4'h9/* 9*/];
  assign T102 = T103;
  assign T103 = io_chanxy_in[5'h14/* 20*/:5'h13/* 19*/];
  assign T104 = T105;
  assign T105 = T106;
  assign T106 = T110[T107];
  assign T107 = T108;
  assign T108 = T109;
  assign T109 = io_chanxy_config[4'hd/* 13*/:4'ha/* 10*/];
  assign T110 = T111;
  assign T111 = io_chanxy_in[5'h1d/* 29*/:5'h15/* 21*/];
  assign T112 = T113;
  assign T113 = T114;
  assign T114 = T118[T115];
  assign T115 = T116;
  assign T116 = T117;
  assign T117 = io_chanxy_config[4'he/* 14*/:4'he/* 14*/];
  assign T118 = T119;
  assign T119 = io_chanxy_in[5'h1f/* 31*/:5'h1e/* 30*/];
  assign T120 = T121;
  assign T121 = T122;
  assign T122 = T126[T123];
  assign T123 = T124;
  assign T124 = T125;
  assign T125 = io_chanxy_config[4'hf/* 15*/:4'hf/* 15*/];
  assign T126 = T127;
  assign T127 = io_chanxy_in[6'h21/* 33*/:6'h20/* 32*/];
  assign T128 = T129;
  assign T129 = T130;
  assign T130 = T134[T131];
  assign T131 = T132;
  assign T132 = T133;
  assign T133 = io_chanxy_config[5'h10/* 16*/:5'h10/* 16*/];
  assign T134 = T135;
  assign T135 = io_chanxy_in[6'h23/* 35*/:6'h22/* 34*/];
  assign T136 = T137;
  assign T137 = T138;
  assign T138 = T142[T139];
  assign T139 = T140;
  assign T140 = T141;
  assign T141 = io_chanxy_config[5'h11/* 17*/:5'h11/* 17*/];
  assign T142 = T143;
  assign T143 = io_chanxy_in[6'h25/* 37*/:6'h24/* 36*/];
  assign T144 = T145;
  assign T145 = T146;
  assign T146 = T150[T147];
  assign T147 = T148;
  assign T148 = T149;
  assign T149 = io_chanxy_config[5'h15/* 21*/:5'h12/* 18*/];
  assign T150 = T151;
  assign T151 = io_chanxy_in[6'h2e/* 46*/:6'h26/* 38*/];
  assign T152 = T153;
  assign T153 = T154;
  assign T154 = T158[T155];
  assign T155 = T156;
  assign T156 = T157;
  assign T157 = io_chanxy_config[5'h16/* 22*/:5'h16/* 22*/];
  assign T158 = T159;
  assign T159 = io_chanxy_in[6'h30/* 48*/:6'h2f/* 47*/];
  assign T160 = T161;
  assign T161 = T162;
  assign T162 = T166[T163];
  assign T163 = T164;
  assign T164 = T165;
  assign T165 = io_chanxy_config[5'h17/* 23*/:5'h17/* 23*/];
  assign T166 = T167;
  assign T167 = io_chanxy_in[6'h32/* 50*/:6'h31/* 49*/];
  assign T168 = T169;
  assign T169 = T170;
  assign T170 = T174[T171];
  assign T171 = T172;
  assign T172 = T173;
  assign T173 = io_chanxy_config[5'h18/* 24*/:5'h18/* 24*/];
  assign T174 = T175;
  assign T175 = io_chanxy_in[6'h34/* 52*/:6'h33/* 51*/];
  assign T176 = T177;
  assign T177 = T178;
  assign T178 = T182[T179];
  assign T179 = T180;
  assign T180 = T181;
  assign T181 = io_chanxy_config[5'h19/* 25*/:5'h19/* 25*/];
  assign T182 = T183;
  assign T183 = io_chanxy_in[6'h36/* 54*/:6'h35/* 53*/];
  assign T184 = T185;
  assign T185 = T186;
  assign T186 = T190[T187];
  assign T187 = T188;
  assign T188 = T189;
  assign T189 = io_chanxy_config[5'h1c/* 28*/:5'h1a/* 26*/];
  assign T190 = T191;
  assign T191 = io_chanxy_in[6'h3e/* 62*/:6'h37/* 55*/];
  assign T192 = T193;
  assign T193 = T194;
  assign T194 = T198[T195];
  assign T195 = T196;
  assign T196 = T197;
  assign T197 = io_chanxy_config[5'h1d/* 29*/:5'h1d/* 29*/];
  assign T198 = T199;
  assign T199 = io_chanxy_in[7'h40/* 64*/:6'h3f/* 63*/];
  assign T200 = T201;
  assign T201 = T202;
  assign T202 = T206[T203];
  assign T203 = T204;
  assign T204 = T205;
  assign T205 = io_chanxy_config[5'h1e/* 30*/:5'h1e/* 30*/];
  assign T206 = T207;
  assign T207 = io_chanxy_in[7'h42/* 66*/:7'h41/* 65*/];
  assign T208 = T209;
  assign T209 = T210;
  assign T210 = T214[T211];
  assign T211 = T212;
  assign T212 = T213;
  assign T213 = io_chanxy_config[5'h1f/* 31*/:5'h1f/* 31*/];
  assign T214 = T215;
  assign T215 = io_chanxy_in[7'h44/* 68*/:7'h43/* 67*/];
  assign T216 = T217;
  assign T217 = T218;
  assign T218 = T222[T219];
  assign T219 = T220;
  assign T220 = T221;
  assign T221 = io_chanxy_config[6'h20/* 32*/:6'h20/* 32*/];
  assign T222 = T223;
  assign T223 = io_chanxy_in[7'h46/* 70*/:7'h45/* 69*/];
  assign T224 = T225;
  assign T225 = T226;
  assign T226 = T230[T227];
  assign T227 = T228;
  assign T228 = T229;
  assign T229 = io_chanxy_config[6'h23/* 35*/:6'h21/* 33*/];
  assign T230 = T231;
  assign T231 = io_chanxy_in[7'h4e/* 78*/:7'h47/* 71*/];
  assign T232 = T233;
  assign T233 = T234;
  assign T234 = io_chanxy_in[7'h4f/* 79*/:7'h4f/* 79*/];
  assign T235 = T236;
  assign T236 = T237;
  assign T237 = io_chanxy_in[7'h50/* 80*/:7'h50/* 80*/];
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
  assign T257 = {2'h0/* 0*/, T258};
  assign T258 = io_ipin_config[1'h1/* 1*/:1'h0/* 0*/];
  assign T259 = T260;
  assign T260 = io_ipin_in[2'h3/* 3*/:1'h0/* 0*/];
  assign T261 = T262;
  assign T262 = T263;
  assign T263 = T268[T264];
  assign T264 = T265;
  assign T265 = T266;
  assign T266 = {2'h0/* 0*/, T267};
  assign T267 = io_ipin_config[2'h3/* 3*/:2'h2/* 2*/];
  assign T268 = T269;
  assign T269 = io_ipin_in[3'h7/* 7*/:3'h4/* 4*/];
  assign T270 = T271;
  assign T271 = T272;
  assign T272 = T277[T273];
  assign T273 = T274;
  assign T274 = T275;
  assign T275 = {2'h0/* 0*/, T276};
  assign T276 = io_ipin_config[3'h5/* 5*/:3'h4/* 4*/];
  assign T277 = T278;
  assign T278 = io_ipin_in[4'hb/* 11*/:4'h8/* 8*/];
  assign T279 = T280;
  assign T280 = T281;
  assign T281 = T286[T282];
  assign T282 = T283;
  assign T283 = T284;
  assign T284 = {2'h0/* 0*/, T285};
  assign T285 = io_ipin_config[3'h7/* 7*/:3'h6/* 6*/];
  assign T286 = T287;
  assign T287 = io_ipin_in[4'hf/* 15*/:4'hc/* 12*/];
  assign T288 = T289;
  assign T289 = T290;
  assign T290 = T295[T291];
  assign T291 = T292;
  assign T292 = T293;
  assign T293 = {2'h0/* 0*/, T294};
  assign T294 = io_ipin_config[4'h9/* 9*/:4'h8/* 8*/];
  assign T295 = T296;
  assign T296 = io_ipin_in[5'h13/* 19*/:5'h10/* 16*/];
  assign T297 = T298;
  assign T298 = T299;
  assign T299 = T304[T300];
  assign T300 = T301;
  assign T301 = T302;
  assign T302 = {2'h0/* 0*/, T303};
  assign T303 = io_ipin_config[4'hb/* 11*/:4'ha/* 10*/];
  assign T304 = T305;
  assign T305 = io_ipin_in[5'h17/* 23*/:5'h14/* 20*/];
  assign T306 = T307;
  assign T307 = T308;
  assign T308 = T313[T309];
  assign T309 = T310;
  assign T310 = T311;
  assign T311 = {2'h0/* 0*/, T312};
  assign T312 = io_ipin_config[4'hd/* 13*/:4'hc/* 12*/];
  assign T313 = T314;
  assign T314 = io_ipin_in[5'h1b/* 27*/:5'h18/* 24*/];
  assign T315 = T316;
  assign T316 = T317;
  assign T317 = T322[T318];
  assign T318 = T319;
  assign T319 = T320;
  assign T320 = {2'h0/* 0*/, T321};
  assign T321 = io_ipin_config[4'hf/* 15*/:4'he/* 14*/];
  assign T322 = T323;
  assign T323 = io_ipin_in[5'h1f/* 31*/:5'h1c/* 28*/];
endmodule


module io_tile_sp_0(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [80:0] io_chanxy_in,
    output[24:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[24:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_wc_1(
    input [31:0] io_ipin_in,
    input [15:0] io_ipin_config,
    input [85:0] io_chanxy_in,
    input [35:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[9:0] io_chanxy_out);

  wire[9:0] T0;
  wire[9:0] T1;
  wire[8:0] T2;
  wire[8:0] T3;
  wire[7:0] T4;
  wire[7:0] T5;
  wire[6:0] T6;
  wire[6:0] T7;
  wire[5:0] T8;
  wire[5:0] T9;
  wire[4:0] T10;
  wire[4:0] T11;
  wire[3:0] T12;
  wire[3:0] T13;
  wire[2:0] T14;
  wire[2:0] T15;
  wire[1:0] T16;
  wire[1:0] T17;
  wire T18;
  wire T19;
  wire T20;
  wire[3:0] T21;
  wire[3:0] T22;
  wire[3:0] T23;
  wire[8:0] T24;
  wire[8:0] T25;
  wire T26;
  wire T27;
  wire T28;
  wire[3:0] T29;
  wire[3:0] T30;
  wire[3:0] T31;
  wire[8:0] T32;
  wire[8:0] T33;
  wire T34;
  wire T35;
  wire T36;
  wire[3:0] T37;
  wire[3:0] T38;
  wire[3:0] T39;
  wire[8:0] T40;
  wire[8:0] T41;
  wire T42;
  wire T43;
  wire T44;
  wire[2:0] T45;
  wire[2:0] T46;
  wire[2:0] T47;
  wire[7:0] T48;
  wire[7:0] T49;
  wire T50;
  wire T51;
  wire T52;
  wire[2:0] T53;
  wire[2:0] T54;
  wire[2:0] T55;
  wire[7:0] T56;
  wire[7:0] T57;
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
  wire[2:0] T85;
  wire[2:0] T86;
  wire[2:0] T87;
  wire[7:0] T88;
  wire[7:0] T89;
  wire T90;
  wire T91;
  wire T92;
  wire[2:0] T93;
  wire[2:0] T94;
  wire[2:0] T95;
  wire[7:0] T96;
  wire[7:0] T97;
  wire[7:0] T98;
  wire[7:0] T99;
  wire[6:0] T100;
  wire[6:0] T101;
  wire[5:0] T102;
  wire[5:0] T103;
  wire[4:0] T104;
  wire[4:0] T105;
  wire[3:0] T106;
  wire[3:0] T107;
  wire[2:0] T108;
  wire[2:0] T109;
  wire[1:0] T110;
  wire[1:0] T111;
  wire T112;
  wire T113;
  wire T114;
  wire[3:0] T115;
  wire[3:0] T116;
  wire[3:0] T117;
  wire[1:0] T118;
  wire[3:0] T119;
  wire[3:0] T120;
  wire T121;
  wire T122;
  wire T123;
  wire[3:0] T124;
  wire[3:0] T125;
  wire[3:0] T126;
  wire[1:0] T127;
  wire[3:0] T128;
  wire[3:0] T129;
  wire T130;
  wire T131;
  wire T132;
  wire[3:0] T133;
  wire[3:0] T134;
  wire[3:0] T135;
  wire[1:0] T136;
  wire[3:0] T137;
  wire[3:0] T138;
  wire T139;
  wire T140;
  wire T141;
  wire[3:0] T142;
  wire[3:0] T143;
  wire[3:0] T144;
  wire[1:0] T145;
  wire[3:0] T146;
  wire[3:0] T147;
  wire T148;
  wire T149;
  wire T150;
  wire[3:0] T151;
  wire[3:0] T152;
  wire[3:0] T153;
  wire[1:0] T154;
  wire[3:0] T155;
  wire[3:0] T156;
  wire T157;
  wire T158;
  wire T159;
  wire[3:0] T160;
  wire[3:0] T161;
  wire[3:0] T162;
  wire[1:0] T163;
  wire[3:0] T164;
  wire[3:0] T165;
  wire T166;
  wire T167;
  wire T168;
  wire[3:0] T169;
  wire[3:0] T170;
  wire[3:0] T171;
  wire[1:0] T172;
  wire[3:0] T173;
  wire[3:0] T174;
  wire T175;
  wire T176;
  wire T177;
  wire[3:0] T178;
  wire[3:0] T179;
  wire[3:0] T180;
  wire[1:0] T181;
  wire[3:0] T182;
  wire[3:0] T183;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T90, T2};
  assign T2 = T3;
  assign T3 = {T82, T4};
  assign T4 = T5;
  assign T5 = {T74, T6};
  assign T6 = T7;
  assign T7 = {T66, T8};
  assign T8 = T9;
  assign T9 = {T58, T10};
  assign T10 = T11;
  assign T11 = {T50, T12};
  assign T12 = T13;
  assign T13 = {T42, T14};
  assign T14 = T15;
  assign T15 = {T34, T16};
  assign T16 = T17;
  assign T17 = {T26, T18};
  assign T18 = T19;
  assign T19 = T20;
  assign T20 = T24[T21];
  assign T21 = T22;
  assign T22 = T23;
  assign T23 = io_chanxy_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T24 = T25;
  assign T25 = io_chanxy_in[4'h8/* 8*/:1'h0/* 0*/];
  assign T26 = T27;
  assign T27 = T28;
  assign T28 = T32[T29];
  assign T29 = T30;
  assign T30 = T31;
  assign T31 = io_chanxy_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T32 = T33;
  assign T33 = io_chanxy_in[5'h11/* 17*/:4'h9/* 9*/];
  assign T34 = T35;
  assign T35 = T36;
  assign T36 = T40[T37];
  assign T37 = T38;
  assign T38 = T39;
  assign T39 = io_chanxy_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T40 = T41;
  assign T41 = io_chanxy_in[5'h1a/* 26*/:5'h12/* 18*/];
  assign T42 = T43;
  assign T43 = T44;
  assign T44 = T48[T45];
  assign T45 = T46;
  assign T46 = T47;
  assign T47 = io_chanxy_config[4'he/* 14*/:4'hc/* 12*/];
  assign T48 = T49;
  assign T49 = io_chanxy_in[6'h22/* 34*/:5'h1b/* 27*/];
  assign T50 = T51;
  assign T51 = T52;
  assign T52 = T56[T53];
  assign T53 = T54;
  assign T54 = T55;
  assign T55 = io_chanxy_config[5'h11/* 17*/:4'hf/* 15*/];
  assign T56 = T57;
  assign T57 = io_chanxy_in[6'h2a/* 42*/:6'h23/* 35*/];
  assign T58 = T59;
  assign T59 = T60;
  assign T60 = T64[T61];
  assign T61 = T62;
  assign T62 = T63;
  assign T63 = io_chanxy_config[5'h15/* 21*/:5'h12/* 18*/];
  assign T64 = T65;
  assign T65 = io_chanxy_in[6'h33/* 51*/:6'h2b/* 43*/];
  assign T66 = T67;
  assign T67 = T68;
  assign T68 = T72[T69];
  assign T69 = T70;
  assign T70 = T71;
  assign T71 = io_chanxy_config[5'h19/* 25*/:5'h16/* 22*/];
  assign T72 = T73;
  assign T73 = io_chanxy_in[6'h3c/* 60*/:6'h34/* 52*/];
  assign T74 = T75;
  assign T75 = T76;
  assign T76 = T80[T77];
  assign T77 = T78;
  assign T78 = T79;
  assign T79 = io_chanxy_config[5'h1d/* 29*/:5'h1a/* 26*/];
  assign T80 = T81;
  assign T81 = io_chanxy_in[7'h45/* 69*/:6'h3d/* 61*/];
  assign T82 = T83;
  assign T83 = T84;
  assign T84 = T88[T85];
  assign T85 = T86;
  assign T86 = T87;
  assign T87 = io_chanxy_config[6'h20/* 32*/:5'h1e/* 30*/];
  assign T88 = T89;
  assign T89 = io_chanxy_in[7'h4d/* 77*/:7'h46/* 70*/];
  assign T90 = T91;
  assign T91 = T92;
  assign T92 = T96[T93];
  assign T93 = T94;
  assign T94 = T95;
  assign T95 = io_chanxy_config[6'h23/* 35*/:6'h21/* 33*/];
  assign T96 = T97;
  assign T97 = io_chanxy_in[7'h55/* 85*/:7'h4e/* 78*/];
  assign io_ipin_out = T98;
  assign T98 = T99;
  assign T99 = {T175, T100};
  assign T100 = T101;
  assign T101 = {T166, T102};
  assign T102 = T103;
  assign T103 = {T157, T104};
  assign T104 = T105;
  assign T105 = {T148, T106};
  assign T106 = T107;
  assign T107 = {T139, T108};
  assign T108 = T109;
  assign T109 = {T130, T110};
  assign T110 = T111;
  assign T111 = {T121, T112};
  assign T112 = T113;
  assign T113 = T114;
  assign T114 = T119[T115];
  assign T115 = T116;
  assign T116 = T117;
  assign T117 = {2'h0/* 0*/, T118};
  assign T118 = io_ipin_config[1'h1/* 1*/:1'h0/* 0*/];
  assign T119 = T120;
  assign T120 = io_ipin_in[2'h3/* 3*/:1'h0/* 0*/];
  assign T121 = T122;
  assign T122 = T123;
  assign T123 = T128[T124];
  assign T124 = T125;
  assign T125 = T126;
  assign T126 = {2'h0/* 0*/, T127};
  assign T127 = io_ipin_config[2'h3/* 3*/:2'h2/* 2*/];
  assign T128 = T129;
  assign T129 = io_ipin_in[3'h7/* 7*/:3'h4/* 4*/];
  assign T130 = T131;
  assign T131 = T132;
  assign T132 = T137[T133];
  assign T133 = T134;
  assign T134 = T135;
  assign T135 = {2'h0/* 0*/, T136};
  assign T136 = io_ipin_config[3'h5/* 5*/:3'h4/* 4*/];
  assign T137 = T138;
  assign T138 = io_ipin_in[4'hb/* 11*/:4'h8/* 8*/];
  assign T139 = T140;
  assign T140 = T141;
  assign T141 = T146[T142];
  assign T142 = T143;
  assign T143 = T144;
  assign T144 = {2'h0/* 0*/, T145};
  assign T145 = io_ipin_config[3'h7/* 7*/:3'h6/* 6*/];
  assign T146 = T147;
  assign T147 = io_ipin_in[4'hf/* 15*/:4'hc/* 12*/];
  assign T148 = T149;
  assign T149 = T150;
  assign T150 = T155[T151];
  assign T151 = T152;
  assign T152 = T153;
  assign T153 = {2'h0/* 0*/, T154};
  assign T154 = io_ipin_config[4'h9/* 9*/:4'h8/* 8*/];
  assign T155 = T156;
  assign T156 = io_ipin_in[5'h13/* 19*/:5'h10/* 16*/];
  assign T157 = T158;
  assign T158 = T159;
  assign T159 = T164[T160];
  assign T160 = T161;
  assign T161 = T162;
  assign T162 = {2'h0/* 0*/, T163};
  assign T163 = io_ipin_config[4'hb/* 11*/:4'ha/* 10*/];
  assign T164 = T165;
  assign T165 = io_ipin_in[5'h17/* 23*/:5'h14/* 20*/];
  assign T166 = T167;
  assign T167 = T168;
  assign T168 = T173[T169];
  assign T169 = T170;
  assign T170 = T171;
  assign T171 = {2'h0/* 0*/, T172};
  assign T172 = io_ipin_config[4'hd/* 13*/:4'hc/* 12*/];
  assign T173 = T174;
  assign T174 = io_ipin_in[5'h1b/* 27*/:5'h18/* 24*/];
  assign T175 = T176;
  assign T176 = T177;
  assign T177 = T182[T178];
  assign T178 = T179;
  assign T179 = T180;
  assign T180 = {2'h0/* 0*/, T181};
  assign T181 = io_ipin_config[4'hf/* 15*/:4'he/* 14*/];
  assign T182 = T183;
  assign T183 = io_ipin_in[5'h1f/* 31*/:5'h1c/* 28*/];
endmodule

module io_tile_sp_1(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [85:0] io_chanxy_in,
    output[9:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[9:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_2(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [85:0] io_chanxy_in,
    output[9:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[9:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_3(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [85:0] io_chanxy_in,
    output[9:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[9:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_wc_2(
    input [31:0] io_ipin_in,
    input [15:0] io_ipin_config,
    input [80:0] io_chanxy_in,
    input [35:0] io_chanxy_config,
    output[7:0] io_ipin_out,
    output[24:0] io_chanxy_out);

  wire[24:0] T0;
  wire[24:0] T1;
  wire[23:0] T2;
  wire[23:0] T3;
  wire[22:0] T4;
  wire[22:0] T5;
  wire[21:0] T6;
  wire[21:0] T7;
  wire[20:0] T8;
  wire[20:0] T9;
  wire[19:0] T10;
  wire[19:0] T11;
  wire[18:0] T12;
  wire[18:0] T13;
  wire[17:0] T14;
  wire[17:0] T15;
  wire[16:0] T16;
  wire[16:0] T17;
  wire[15:0] T18;
  wire[15:0] T19;
  wire[14:0] T20;
  wire[14:0] T21;
  wire[13:0] T22;
  wire[13:0] T23;
  wire[12:0] T24;
  wire[12:0] T25;
  wire[11:0] T26;
  wire[11:0] T27;
  wire[10:0] T28;
  wire[10:0] T29;
  wire[9:0] T30;
  wire[9:0] T31;
  wire[8:0] T32;
  wire[8:0] T33;
  wire[7:0] T34;
  wire[7:0] T35;
  wire[6:0] T36;
  wire[6:0] T37;
  wire[5:0] T38;
  wire[5:0] T39;
  wire[4:0] T40;
  wire[4:0] T41;
  wire[3:0] T42;
  wire[3:0] T43;
  wire[2:0] T44;
  wire[2:0] T45;
  wire[1:0] T46;
  wire[1:0] T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire[1:0] T54;
  wire[1:0] T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire[1:0] T62;
  wire[1:0] T63;
  wire T64;
  wire T65;
  wire T66;
  wire T67;
  wire T68;
  wire T69;
  wire[1:0] T70;
  wire[1:0] T71;
  wire T72;
  wire T73;
  wire T74;
  wire T75;
  wire T76;
  wire T77;
  wire[1:0] T78;
  wire[1:0] T79;
  wire T80;
  wire T81;
  wire T82;
  wire T83;
  wire T84;
  wire T85;
  wire[1:0] T86;
  wire[1:0] T87;
  wire T88;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire T93;
  wire[1:0] T94;
  wire[1:0] T95;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire T100;
  wire T101;
  wire[1:0] T102;
  wire[1:0] T103;
  wire T104;
  wire T105;
  wire T106;
  wire T107;
  wire T108;
  wire T109;
  wire[1:0] T110;
  wire[1:0] T111;
  wire T112;
  wire T113;
  wire T114;
  wire T115;
  wire T116;
  wire T117;
  wire[1:0] T118;
  wire[1:0] T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire T124;
  wire T125;
  wire T126;
  wire T127;
  wire T128;
  wire[1:0] T129;
  wire[1:0] T130;
  wire T131;
  wire T132;
  wire T133;
  wire T134;
  wire T135;
  wire T136;
  wire[1:0] T137;
  wire[1:0] T138;
  wire T139;
  wire T140;
  wire T141;
  wire T142;
  wire T143;
  wire T144;
  wire[1:0] T145;
  wire[1:0] T146;
  wire T147;
  wire T148;
  wire T149;
  wire T150;
  wire T151;
  wire T152;
  wire[1:0] T153;
  wire[1:0] T154;
  wire T155;
  wire T156;
  wire T157;
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
  wire[3:0] T193;
  wire[3:0] T194;
  wire[3:0] T195;
  wire[8:0] T196;
  wire[8:0] T197;
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
  wire[2:0] T209;
  wire[2:0] T210;
  wire[2:0] T211;
  wire[7:0] T212;
  wire[7:0] T213;
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
  wire[2:0] T225;
  wire[2:0] T226;
  wire[2:0] T227;
  wire[7:0] T228;
  wire[7:0] T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire[1:0] T236;
  wire[1:0] T237;
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
  wire[3:0] T255;
  wire[3:0] T256;
  wire[3:0] T257;
  wire[1:0] T258;
  wire[3:0] T259;
  wire[3:0] T260;
  wire T261;
  wire T262;
  wire T263;
  wire[3:0] T264;
  wire[3:0] T265;
  wire[3:0] T266;
  wire[1:0] T267;
  wire[3:0] T268;
  wire[3:0] T269;
  wire T270;
  wire T271;
  wire T272;
  wire[3:0] T273;
  wire[3:0] T274;
  wire[3:0] T275;
  wire[1:0] T276;
  wire[3:0] T277;
  wire[3:0] T278;
  wire T279;
  wire T280;
  wire T281;
  wire[3:0] T282;
  wire[3:0] T283;
  wire[3:0] T284;
  wire[1:0] T285;
  wire[3:0] T286;
  wire[3:0] T287;
  wire T288;
  wire T289;
  wire T290;
  wire[3:0] T291;
  wire[3:0] T292;
  wire[3:0] T293;
  wire[1:0] T294;
  wire[3:0] T295;
  wire[3:0] T296;
  wire T297;
  wire T298;
  wire T299;
  wire[3:0] T300;
  wire[3:0] T301;
  wire[3:0] T302;
  wire[1:0] T303;
  wire[3:0] T304;
  wire[3:0] T305;
  wire T306;
  wire T307;
  wire T308;
  wire[3:0] T309;
  wire[3:0] T310;
  wire[3:0] T311;
  wire[1:0] T312;
  wire[3:0] T313;
  wire[3:0] T314;
  wire T315;
  wire T316;
  wire T317;
  wire[3:0] T318;
  wire[3:0] T319;
  wire[3:0] T320;
  wire[1:0] T321;
  wire[3:0] T322;
  wire[3:0] T323;

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
  assign T21 = {T155, T22};
  assign T22 = T23;
  assign T23 = {T147, T24};
  assign T24 = T25;
  assign T25 = {T139, T26};
  assign T26 = T27;
  assign T27 = {T131, T28};
  assign T28 = T29;
  assign T29 = {T123, T30};
  assign T30 = T31;
  assign T31 = {T120, T32};
  assign T32 = T33;
  assign T33 = {T112, T34};
  assign T34 = T35;
  assign T35 = {T104, T36};
  assign T36 = T37;
  assign T37 = {T96, T38};
  assign T38 = T39;
  assign T39 = {T88, T40};
  assign T40 = T41;
  assign T41 = {T80, T42};
  assign T42 = T43;
  assign T43 = {T72, T44};
  assign T44 = T45;
  assign T45 = {T64, T46};
  assign T46 = T47;
  assign T47 = {T56, T48};
  assign T48 = T49;
  assign T49 = T50;
  assign T50 = T54[T51];
  assign T51 = T52;
  assign T52 = T53;
  assign T53 = io_chanxy_config[1'h0/* 0*/:1'h0/* 0*/];
  assign T54 = T55;
  assign T55 = io_chanxy_in[1'h1/* 1*/:1'h0/* 0*/];
  assign T56 = T57;
  assign T57 = T58;
  assign T58 = T62[T59];
  assign T59 = T60;
  assign T60 = T61;
  assign T61 = io_chanxy_config[1'h1/* 1*/:1'h1/* 1*/];
  assign T62 = T63;
  assign T63 = io_chanxy_in[2'h3/* 3*/:2'h2/* 2*/];
  assign T64 = T65;
  assign T65 = T66;
  assign T66 = T70[T67];
  assign T67 = T68;
  assign T68 = T69;
  assign T69 = io_chanxy_config[2'h2/* 2*/:2'h2/* 2*/];
  assign T70 = T71;
  assign T71 = io_chanxy_in[3'h5/* 5*/:3'h4/* 4*/];
  assign T72 = T73;
  assign T73 = T74;
  assign T74 = T78[T75];
  assign T75 = T76;
  assign T76 = T77;
  assign T77 = io_chanxy_config[2'h3/* 3*/:2'h3/* 3*/];
  assign T78 = T79;
  assign T79 = io_chanxy_in[3'h7/* 7*/:3'h6/* 6*/];
  assign T80 = T81;
  assign T81 = T82;
  assign T82 = T86[T83];
  assign T83 = T84;
  assign T84 = T85;
  assign T85 = io_chanxy_config[3'h4/* 4*/:3'h4/* 4*/];
  assign T86 = T87;
  assign T87 = io_chanxy_in[4'h9/* 9*/:4'h8/* 8*/];
  assign T88 = T89;
  assign T89 = T90;
  assign T90 = T94[T91];
  assign T91 = T92;
  assign T92 = T93;
  assign T93 = io_chanxy_config[3'h5/* 5*/:3'h5/* 5*/];
  assign T94 = T95;
  assign T95 = io_chanxy_in[4'hb/* 11*/:4'ha/* 10*/];
  assign T96 = T97;
  assign T97 = T98;
  assign T98 = T102[T99];
  assign T99 = T100;
  assign T100 = T101;
  assign T101 = io_chanxy_config[3'h6/* 6*/:3'h6/* 6*/];
  assign T102 = T103;
  assign T103 = io_chanxy_in[4'hd/* 13*/:4'hc/* 12*/];
  assign T104 = T105;
  assign T105 = T106;
  assign T106 = T110[T107];
  assign T107 = T108;
  assign T108 = T109;
  assign T109 = io_chanxy_config[3'h7/* 7*/:3'h7/* 7*/];
  assign T110 = T111;
  assign T111 = io_chanxy_in[4'hf/* 15*/:4'he/* 14*/];
  assign T112 = T113;
  assign T113 = T114;
  assign T114 = T118[T115];
  assign T115 = T116;
  assign T116 = T117;
  assign T117 = io_chanxy_config[4'h8/* 8*/:4'h8/* 8*/];
  assign T118 = T119;
  assign T119 = io_chanxy_in[5'h11/* 17*/:5'h10/* 16*/];
  assign T120 = T121;
  assign T121 = T122;
  assign T122 = io_chanxy_in[5'h12/* 18*/:5'h12/* 18*/];
  assign T123 = T124;
  assign T124 = T125;
  assign T125 = T129[T126];
  assign T126 = T127;
  assign T127 = T128;
  assign T128 = io_chanxy_config[4'h9/* 9*/:4'h9/* 9*/];
  assign T129 = T130;
  assign T130 = io_chanxy_in[5'h14/* 20*/:5'h13/* 19*/];
  assign T131 = T132;
  assign T132 = T133;
  assign T133 = T137[T134];
  assign T134 = T135;
  assign T135 = T136;
  assign T136 = io_chanxy_config[4'ha/* 10*/:4'ha/* 10*/];
  assign T137 = T138;
  assign T138 = io_chanxy_in[5'h16/* 22*/:5'h15/* 21*/];
  assign T139 = T140;
  assign T140 = T141;
  assign T141 = T145[T142];
  assign T142 = T143;
  assign T143 = T144;
  assign T144 = io_chanxy_config[4'hb/* 11*/:4'hb/* 11*/];
  assign T145 = T146;
  assign T146 = io_chanxy_in[5'h18/* 24*/:5'h17/* 23*/];
  assign T147 = T148;
  assign T148 = T149;
  assign T149 = T153[T150];
  assign T150 = T151;
  assign T151 = T152;
  assign T152 = io_chanxy_config[4'hc/* 12*/:4'hc/* 12*/];
  assign T153 = T154;
  assign T154 = io_chanxy_in[5'h1a/* 26*/:5'h19/* 25*/];
  assign T155 = T156;
  assign T156 = T157;
  assign T157 = io_chanxy_in[5'h1b/* 27*/:5'h1b/* 27*/];
  assign T158 = T159;
  assign T159 = T160;
  assign T160 = T164[T161];
  assign T161 = T162;
  assign T162 = T163;
  assign T163 = io_chanxy_config[5'h10/* 16*/:4'hd/* 13*/];
  assign T164 = T165;
  assign T165 = io_chanxy_in[6'h24/* 36*/:5'h1c/* 28*/];
  assign T166 = T167;
  assign T167 = T168;
  assign T168 = T172[T169];
  assign T169 = T170;
  assign T170 = T171;
  assign T171 = io_chanxy_config[5'h11/* 17*/:5'h11/* 17*/];
  assign T172 = T173;
  assign T173 = io_chanxy_in[6'h26/* 38*/:6'h25/* 37*/];
  assign T174 = T175;
  assign T175 = T176;
  assign T176 = T180[T177];
  assign T177 = T178;
  assign T178 = T179;
  assign T179 = io_chanxy_config[5'h15/* 21*/:5'h12/* 18*/];
  assign T180 = T181;
  assign T181 = io_chanxy_in[6'h2f/* 47*/:6'h27/* 39*/];
  assign T182 = T183;
  assign T183 = T184;
  assign T184 = T188[T185];
  assign T185 = T186;
  assign T186 = T187;
  assign T187 = io_chanxy_config[5'h16/* 22*/:5'h16/* 22*/];
  assign T188 = T189;
  assign T189 = io_chanxy_in[6'h31/* 49*/:6'h30/* 48*/];
  assign T190 = T191;
  assign T191 = T192;
  assign T192 = T196[T193];
  assign T193 = T194;
  assign T194 = T195;
  assign T195 = io_chanxy_config[5'h1a/* 26*/:5'h17/* 23*/];
  assign T196 = T197;
  assign T197 = io_chanxy_in[6'h3a/* 58*/:6'h32/* 50*/];
  assign T198 = T199;
  assign T199 = T200;
  assign T200 = T204[T201];
  assign T201 = T202;
  assign T202 = T203;
  assign T203 = io_chanxy_config[5'h1b/* 27*/:5'h1b/* 27*/];
  assign T204 = T205;
  assign T205 = io_chanxy_in[6'h3c/* 60*/:6'h3b/* 59*/];
  assign T206 = T207;
  assign T207 = T208;
  assign T208 = T212[T209];
  assign T209 = T210;
  assign T210 = T211;
  assign T211 = io_chanxy_config[5'h1e/* 30*/:5'h1c/* 28*/];
  assign T212 = T213;
  assign T213 = io_chanxy_in[7'h44/* 68*/:6'h3d/* 61*/];
  assign T214 = T215;
  assign T215 = T216;
  assign T216 = T220[T217];
  assign T217 = T218;
  assign T218 = T219;
  assign T219 = io_chanxy_config[5'h1f/* 31*/:5'h1f/* 31*/];
  assign T220 = T221;
  assign T221 = io_chanxy_in[7'h46/* 70*/:7'h45/* 69*/];
  assign T222 = T223;
  assign T223 = T224;
  assign T224 = T228[T225];
  assign T225 = T226;
  assign T226 = T227;
  assign T227 = io_chanxy_config[6'h22/* 34*/:6'h20/* 32*/];
  assign T228 = T229;
  assign T229 = io_chanxy_in[7'h4e/* 78*/:7'h47/* 71*/];
  assign T230 = T231;
  assign T231 = T232;
  assign T232 = T236[T233];
  assign T233 = T234;
  assign T234 = T235;
  assign T235 = io_chanxy_config[6'h23/* 35*/:6'h23/* 35*/];
  assign T236 = T237;
  assign T237 = io_chanxy_in[7'h50/* 80*/:7'h4f/* 79*/];
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
  assign T257 = {2'h0/* 0*/, T258};
  assign T258 = io_ipin_config[1'h1/* 1*/:1'h0/* 0*/];
  assign T259 = T260;
  assign T260 = io_ipin_in[2'h3/* 3*/:1'h0/* 0*/];
  assign T261 = T262;
  assign T262 = T263;
  assign T263 = T268[T264];
  assign T264 = T265;
  assign T265 = T266;
  assign T266 = {2'h0/* 0*/, T267};
  assign T267 = io_ipin_config[2'h3/* 3*/:2'h2/* 2*/];
  assign T268 = T269;
  assign T269 = io_ipin_in[3'h7/* 7*/:3'h4/* 4*/];
  assign T270 = T271;
  assign T271 = T272;
  assign T272 = T277[T273];
  assign T273 = T274;
  assign T274 = T275;
  assign T275 = {2'h0/* 0*/, T276};
  assign T276 = io_ipin_config[3'h5/* 5*/:3'h4/* 4*/];
  assign T277 = T278;
  assign T278 = io_ipin_in[4'hb/* 11*/:4'h8/* 8*/];
  assign T279 = T280;
  assign T280 = T281;
  assign T281 = T286[T282];
  assign T282 = T283;
  assign T283 = T284;
  assign T284 = {2'h0/* 0*/, T285};
  assign T285 = io_ipin_config[3'h7/* 7*/:3'h6/* 6*/];
  assign T286 = T287;
  assign T287 = io_ipin_in[4'hf/* 15*/:4'hc/* 12*/];
  assign T288 = T289;
  assign T289 = T290;
  assign T290 = T295[T291];
  assign T291 = T292;
  assign T292 = T293;
  assign T293 = {2'h0/* 0*/, T294};
  assign T294 = io_ipin_config[4'h9/* 9*/:4'h8/* 8*/];
  assign T295 = T296;
  assign T296 = io_ipin_in[5'h13/* 19*/:5'h10/* 16*/];
  assign T297 = T298;
  assign T298 = T299;
  assign T299 = T304[T300];
  assign T300 = T301;
  assign T301 = T302;
  assign T302 = {2'h0/* 0*/, T303};
  assign T303 = io_ipin_config[4'hb/* 11*/:4'ha/* 10*/];
  assign T304 = T305;
  assign T305 = io_ipin_in[5'h17/* 23*/:5'h14/* 20*/];
  assign T306 = T307;
  assign T307 = T308;
  assign T308 = T313[T309];
  assign T309 = T310;
  assign T310 = T311;
  assign T311 = {2'h0/* 0*/, T312};
  assign T312 = io_ipin_config[4'hd/* 13*/:4'hc/* 12*/];
  assign T313 = T314;
  assign T314 = io_ipin_in[5'h1b/* 27*/:5'h18/* 24*/];
  assign T315 = T316;
  assign T316 = T317;
  assign T317 = T322[T318];
  assign T318 = T319;
  assign T319 = T320;
  assign T320 = {2'h0/* 0*/, T321};
  assign T321 = io_ipin_config[4'hf/* 15*/:4'he/* 14*/];
  assign T322 = T323;
  assign T323 = io_ipin_in[5'h1f/* 31*/:5'h1c/* 28*/];
endmodule

module io_tile_sp_4(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [80:0] io_chanxy_in,
    output[24:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[24:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {5'h0/* 0*/, 3'h5/* 5*/};
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_sbcb_woc(
    input [31:0] io_ipin_in,
    input [15:0] io_ipin_config,
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
  wire[3:0] T17;
  wire[3:0] T18;
  wire[3:0] T19;
  wire[1:0] T20;
  wire[3:0] T21;
  wire[3:0] T22;
  wire T23;
  wire T24;
  wire T25;
  wire[3:0] T26;
  wire[3:0] T27;
  wire[3:0] T28;
  wire[1:0] T29;
  wire[3:0] T30;
  wire[3:0] T31;
  wire T32;
  wire T33;
  wire T34;
  wire[3:0] T35;
  wire[3:0] T36;
  wire[3:0] T37;
  wire[1:0] T38;
  wire[3:0] T39;
  wire[3:0] T40;
  wire T41;
  wire T42;
  wire T43;
  wire[3:0] T44;
  wire[3:0] T45;
  wire[3:0] T46;
  wire[1:0] T47;
  wire[3:0] T48;
  wire[3:0] T49;
  wire T50;
  wire T51;
  wire T52;
  wire[3:0] T53;
  wire[3:0] T54;
  wire[3:0] T55;
  wire[1:0] T56;
  wire[3:0] T57;
  wire[3:0] T58;
  wire T59;
  wire T60;
  wire T61;
  wire[3:0] T62;
  wire[3:0] T63;
  wire[3:0] T64;
  wire[1:0] T65;
  wire[3:0] T66;
  wire[3:0] T67;
  wire T68;
  wire T69;
  wire T70;
  wire[3:0] T71;
  wire[3:0] T72;
  wire[3:0] T73;
  wire[1:0] T74;
  wire[3:0] T75;
  wire[3:0] T76;
  wire T77;
  wire T78;
  wire T79;
  wire[3:0] T80;
  wire[3:0] T81;
  wire[3:0] T82;
  wire[1:0] T83;
  wire[3:0] T84;
  wire[3:0] T85;

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
  assign T19 = {2'h0/* 0*/, T20};
  assign T20 = io_ipin_config[1'h1/* 1*/:1'h0/* 0*/];
  assign T21 = T22;
  assign T22 = io_ipin_in[2'h3/* 3*/:1'h0/* 0*/];
  assign T23 = T24;
  assign T24 = T25;
  assign T25 = T30[T26];
  assign T26 = T27;
  assign T27 = T28;
  assign T28 = {2'h0/* 0*/, T29};
  assign T29 = io_ipin_config[2'h3/* 3*/:2'h2/* 2*/];
  assign T30 = T31;
  assign T31 = io_ipin_in[3'h7/* 7*/:3'h4/* 4*/];
  assign T32 = T33;
  assign T33 = T34;
  assign T34 = T39[T35];
  assign T35 = T36;
  assign T36 = T37;
  assign T37 = {2'h0/* 0*/, T38};
  assign T38 = io_ipin_config[3'h5/* 5*/:3'h4/* 4*/];
  assign T39 = T40;
  assign T40 = io_ipin_in[4'hb/* 11*/:4'h8/* 8*/];
  assign T41 = T42;
  assign T42 = T43;
  assign T43 = T48[T44];
  assign T44 = T45;
  assign T45 = T46;
  assign T46 = {2'h0/* 0*/, T47};
  assign T47 = io_ipin_config[3'h7/* 7*/:3'h6/* 6*/];
  assign T48 = T49;
  assign T49 = io_ipin_in[4'hf/* 15*/:4'hc/* 12*/];
  assign T50 = T51;
  assign T51 = T52;
  assign T52 = T57[T53];
  assign T53 = T54;
  assign T54 = T55;
  assign T55 = {2'h0/* 0*/, T56};
  assign T56 = io_ipin_config[4'h9/* 9*/:4'h8/* 8*/];
  assign T57 = T58;
  assign T58 = io_ipin_in[5'h13/* 19*/:5'h10/* 16*/];
  assign T59 = T60;
  assign T60 = T61;
  assign T61 = T66[T62];
  assign T62 = T63;
  assign T63 = T64;
  assign T64 = {2'h0/* 0*/, T65};
  assign T65 = io_ipin_config[4'hb/* 11*/:4'ha/* 10*/];
  assign T66 = T67;
  assign T67 = io_ipin_in[5'h17/* 23*/:5'h14/* 20*/];
  assign T68 = T69;
  assign T69 = T70;
  assign T70 = T75[T71];
  assign T71 = T72;
  assign T72 = T73;
  assign T73 = {2'h0/* 0*/, T74};
  assign T74 = io_ipin_config[4'hd/* 13*/:4'hc/* 12*/];
  assign T75 = T76;
  assign T76 = io_ipin_in[5'h1b/* 27*/:5'h18/* 24*/];
  assign T77 = T78;
  assign T78 = T79;
  assign T79 = T84[T80];
  assign T80 = T81;
  assign T81 = T82;
  assign T82 = {2'h0/* 0*/, T83};
  assign T83 = io_ipin_config[4'hf/* 15*/:4'he/* 14*/];
  assign T84 = T85;
  assign T85 = io_ipin_in[5'h1f/* 31*/:5'h1c/* 28*/];
endmodule


module io_tile_sp_5(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {7'h0/* 0*/, 1'h1/* 1*/};
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

module io_tile_sp_6(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {6'h0/* 0*/, 2'h2/* 2*/};
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

module io_tile_sp_7(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {6'h0/* 0*/, 2'h3/* 3*/};
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

module io_tile_sp_8(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h4/* 4*/};
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

module io_tile_sp_9(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h5/* 5*/};
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

module io_tile_sp_10(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [80:0] io_chanxy_in,
    output[24:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[24:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_11(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [85:0] io_chanxy_in,
    output[9:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[9:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_12(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [85:0] io_chanxy_in,
    output[9:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[9:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_13(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [85:0] io_chanxy_in,
    output[9:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[9:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
endmodule

module io_tile_sp_14(input clk, input reset,
    input [31:0] io_configs_in,
    input [1:0] io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    input [80:0] io_chanxy_in,
    output[24:0] io_chanxy_out,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[35:0] T0;
  wire[63:0] this_config_io_configs_out;
  wire[15:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[24:0] this_sbcb_io_chanxy_out;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[6'h33/* 51*/:5'h10/* 16*/];
  assign T1 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T2;
  assign T2 = {7'h0/* 0*/, 1'h0/* 0*/};
  assign io_x_loc = T3;
  assign T3 = {5'h0/* 0*/, 3'h5/* 5*/};
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
    configs_latches_2 this_config(.clk(clk), .reset(reset),
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
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h6/* 6*/};
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

module io_tile_sp_16(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h6/* 6*/};
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

module io_tile_sp_17(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h6/* 6*/};
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

module io_tile_sp_18(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h6/* 6*/};
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

module io_tile_sp_19(input clk, input reset,
    input [31:0] io_configs_in,
    input  io_configs_en,
    input [7:0] io_io_input,
    output[7:0] io_io_output,
    output[7:0] io_opin_out,
    input [31:0] io_ipin_in,
    output[7:0] io_x_loc,
    output[7:0] io_y_loc);

  wire[15:0] T0;
  wire[31:0] this_config_io_configs_out;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] this_sbcb_io_ipin_out;

  assign T0 = this_config_io_configs_out[4'hf/* 15*/:1'h0/* 0*/];
  assign io_y_loc = T1;
  assign T1 = {5'h0/* 0*/, 3'h6/* 6*/};
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


