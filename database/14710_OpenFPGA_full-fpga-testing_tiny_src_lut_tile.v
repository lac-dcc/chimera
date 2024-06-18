// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module lut4(input clk, input reset,
    input [3:0] io_lut_in,
    output io_lut_out,
    input [15:0] io_lut_configs,
    input  io_mux_configs,
    input  io_ff_en);

  wire T0;
  wire T1;
  wire T2;
  wire[1:0] T3;
  wire lut4_o;
  wire[3:0] T4;
  reg[0:0] ff1;
  wire T5;

  assign io_lut_out = T0;
  assign T0 = T3[T1];
  assign T1 = T2;
  assign T2 = io_mux_configs;
  assign T3 = {ff1, lut4_o};
  assign lut4_o = io_lut_configs[T4];
  assign T4 = io_lut_in;
  assign T5 = 1'h1/* 1*/ ? lut4_o : ff1;

  always @(posedge clk) begin
    if(reset) begin
      ff1 <= 1'b0/* 0*/;
    end else if(io_ff_en) begin
      ff1 <= T5;
    end
  end
endmodule

module clb(input clk, input reset,
    input [15:0] io_clb_in,
    output[3:0] io_clb_out,
    input [63:0] io_lut_configs,
    input [3:0] io_mux_configs,
    input  io_ff_en);

  wire T0;
  wire[15:0] T1;
  wire[3:0] T2;
  wire T3;
  wire[15:0] T4;
  wire[3:0] T5;
  wire T6;
  wire[15:0] T7;
  wire[3:0] T8;
  wire T9;
  wire[15:0] T10;
  wire[3:0] T11;
  wire[3:0] T12;
  wire[3:0] T13;
  wire[2:0] T14;
  wire[2:0] T15;
  wire[1:0] T16;
  wire[1:0] T17;
  wire T18;
  wire T19;
  wire lut4_io_lut_out;
  wire T20;
  wire T21;
  wire lut4_1_io_lut_out;
  wire T22;
  wire T23;
  wire lut4_2_io_lut_out;
  wire T24;
  wire T25;
  wire lut4_3_io_lut_out;

  assign T0 = io_mux_configs[2'h3/* 3*/:2'h3/* 3*/];
  assign T1 = io_lut_configs[6'h3f/* 63*/:6'h30/* 48*/];
  assign T2 = io_clb_in[4'hf/* 15*/:4'hc/* 12*/];
  assign T3 = io_mux_configs[2'h2/* 2*/:2'h2/* 2*/];
  assign T4 = io_lut_configs[6'h2f/* 47*/:6'h20/* 32*/];
  assign T5 = io_clb_in[4'hb/* 11*/:4'h8/* 8*/];
  assign T6 = io_mux_configs[1'h1/* 1*/:1'h1/* 1*/];
  assign T7 = io_lut_configs[5'h1f/* 31*/:5'h10/* 16*/];
  assign T8 = io_clb_in[3'h7/* 7*/:3'h4/* 4*/];
  assign T9 = io_mux_configs[1'h0/* 0*/:1'h0/* 0*/];
  assign T10 = io_lut_configs[4'hf/* 15*/:1'h0/* 0*/];
  assign T11 = io_clb_in[2'h3/* 3*/:1'h0/* 0*/];
  assign io_clb_out = T12;
  assign T12 = T13;
  assign T13 = {T24, T14};
  assign T14 = T15;
  assign T15 = {T22, T16};
  assign T16 = T17;
  assign T17 = {T20, T18};
  assign T18 = T19;
  assign T19 = lut4_io_lut_out;
  assign T20 = T21;
  assign T21 = lut4_1_io_lut_out;
  assign T22 = T23;
  assign T23 = lut4_2_io_lut_out;
  assign T24 = T25;
  assign T25 = lut4_3_io_lut_out;
  lut4 lut4(.clk(clk), .reset(reset),
       .io_lut_in( T11 ),
       .io_lut_out( lut4_io_lut_out ),
       .io_lut_configs( T10 ),
       .io_mux_configs( T9 ),
       .io_ff_en( io_ff_en ));
  lut4 lut4_1(.clk(clk), .reset(reset),
       .io_lut_in( T8 ),
       .io_lut_out( lut4_1_io_lut_out ),
       .io_lut_configs( T7 ),
       .io_mux_configs( T6 ),
       .io_ff_en( io_ff_en ));
  lut4 lut4_2(.clk(clk), .reset(reset),
       .io_lut_in( T5 ),
       .io_lut_out( lut4_2_io_lut_out ),
       .io_lut_configs( T4 ),
       .io_mux_configs( T3 ),
       .io_ff_en( io_ff_en ));
  lut4 lut4_3(.clk(clk), .reset(reset),
       .io_lut_in( T2 ),
       .io_lut_out( lut4_3_io_lut_out ),
       .io_lut_configs( T1 ),
       .io_mux_configs( T0 ),
       .io_ff_en( io_ff_en ));
endmodule



module sbcb(
    input [43:0] io_ipin_in,
    input [21:0] io_ipin_config,
    input [195:0] io_chanxy_in,
    input [79:0] io_chanxy_config,
    output[10:0] io_ipin_out,
    output[19:0] io_chanxy_out);

  wire[19:0] T0;
  wire[19:0] T1;
  wire[18:0] T2;
  wire[18:0] T3;
  wire[17:0] T4;
  wire[17:0] T5;
  wire[16:0] T6;
  wire[16:0] T7;
  wire[15:0] T8;
  wire[15:0] T9;
  wire[14:0] T10;
  wire[14:0] T11;
  wire[13:0] T12;
  wire[13:0] T13;
  wire[12:0] T14;
  wire[12:0] T15;
  wire[11:0] T16;
  wire[11:0] T17;
  wire[10:0] T18;
  wire[10:0] T19;
  wire[9:0] T20;
  wire[9:0] T21;
  wire[8:0] T22;
  wire[8:0] T23;
  wire[7:0] T24;
  wire[7:0] T25;
  wire[6:0] T26;
  wire[6:0] T27;
  wire[5:0] T28;
  wire[5:0] T29;
  wire[4:0] T30;
  wire[4:0] T31;
  wire[3:0] T32;
  wire[3:0] T33;
  wire[2:0] T34;
  wire[2:0] T35;
  wire[1:0] T36;
  wire[1:0] T37;
  wire T38;
  wire T39;
  wire T40;
  wire[3:0] T41;
  wire[3:0] T42;
  wire[3:0] T43;
  wire[9:0] T44;
  wire[9:0] T45;
  wire T46;
  wire T47;
  wire T48;
  wire[3:0] T49;
  wire[3:0] T50;
  wire[3:0] T51;
  wire[9:0] T52;
  wire[9:0] T53;
  wire T54;
  wire T55;
  wire T56;
  wire[3:0] T57;
  wire[3:0] T58;
  wire[3:0] T59;
  wire[9:0] T60;
  wire[9:0] T61;
  wire T62;
  wire T63;
  wire T64;
  wire[3:0] T65;
  wire[3:0] T66;
  wire[3:0] T67;
  wire[9:0] T68;
  wire[9:0] T69;
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
  wire[9:0] T84;
  wire[9:0] T85;
  wire T86;
  wire T87;
  wire T88;
  wire[3:0] T89;
  wire[3:0] T90;
  wire[3:0] T91;
  wire[9:0] T92;
  wire[9:0] T93;
  wire T94;
  wire T95;
  wire T96;
  wire[3:0] T97;
  wire[3:0] T98;
  wire[3:0] T99;
  wire[9:0] T100;
  wire[9:0] T101;
  wire T102;
  wire T103;
  wire T104;
  wire[3:0] T105;
  wire[3:0] T106;
  wire[3:0] T107;
  wire[9:0] T108;
  wire[9:0] T109;
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
  wire[3:0] T121;
  wire[3:0] T122;
  wire[3:0] T123;
  wire[9:0] T124;
  wire[9:0] T125;
  wire T126;
  wire T127;
  wire T128;
  wire[3:0] T129;
  wire[3:0] T130;
  wire[3:0] T131;
  wire[9:0] T132;
  wire[9:0] T133;
  wire T134;
  wire T135;
  wire T136;
  wire[3:0] T137;
  wire[3:0] T138;
  wire[3:0] T139;
  wire[9:0] T140;
  wire[9:0] T141;
  wire T142;
  wire T143;
  wire T144;
  wire[3:0] T145;
  wire[3:0] T146;
  wire[3:0] T147;
  wire[9:0] T148;
  wire[9:0] T149;
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
  wire[9:0] T164;
  wire[9:0] T165;
  wire T166;
  wire T167;
  wire T168;
  wire[3:0] T169;
  wire[3:0] T170;
  wire[3:0] T171;
  wire[9:0] T172;
  wire[9:0] T173;
  wire T174;
  wire T175;
  wire T176;
  wire[3:0] T177;
  wire[3:0] T178;
  wire[3:0] T179;
  wire[9:0] T180;
  wire[9:0] T181;
  wire T182;
  wire T183;
  wire T184;
  wire[3:0] T185;
  wire[3:0] T186;
  wire[3:0] T187;
  wire[9:0] T188;
  wire[9:0] T189;
  wire T190;
  wire T191;
  wire T192;
  wire[3:0] T193;
  wire[3:0] T194;
  wire[3:0] T195;
  wire[8:0] T196;
  wire[8:0] T197;
  wire[10:0] T198;
  wire[10:0] T199;
  wire[9:0] T200;
  wire[9:0] T201;
  wire[8:0] T202;
  wire[8:0] T203;
  wire[7:0] T204;
  wire[7:0] T205;
  wire[6:0] T206;
  wire[6:0] T207;
  wire[5:0] T208;
  wire[5:0] T209;
  wire[4:0] T210;
  wire[4:0] T211;
  wire[3:0] T212;
  wire[3:0] T213;
  wire[2:0] T214;
  wire[2:0] T215;
  wire[1:0] T216;
  wire[1:0] T217;
  wire T218;
  wire T219;
  wire T220;
  wire[1:0] T221;
  wire[1:0] T222;
  wire[1:0] T223;
  wire[3:0] T224;
  wire[3:0] T225;
  wire T226;
  wire T227;
  wire T228;
  wire[1:0] T229;
  wire[1:0] T230;
  wire[1:0] T231;
  wire[3:0] T232;
  wire[3:0] T233;
  wire T234;
  wire T235;
  wire T236;
  wire[1:0] T237;
  wire[1:0] T238;
  wire[1:0] T239;
  wire[3:0] T240;
  wire[3:0] T241;
  wire T242;
  wire T243;
  wire T244;
  wire[1:0] T245;
  wire[1:0] T246;
  wire[1:0] T247;
  wire[3:0] T248;
  wire[3:0] T249;
  wire T250;
  wire T251;
  wire T252;
  wire[1:0] T253;
  wire[1:0] T254;
  wire[1:0] T255;
  wire[3:0] T256;
  wire[3:0] T257;
  wire T258;
  wire T259;
  wire T260;
  wire[1:0] T261;
  wire[1:0] T262;
  wire[1:0] T263;
  wire[3:0] T264;
  wire[3:0] T265;
  wire T266;
  wire T267;
  wire T268;
  wire[1:0] T269;
  wire[1:0] T270;
  wire[1:0] T271;
  wire[3:0] T272;
  wire[3:0] T273;
  wire T274;
  wire T275;
  wire T276;
  wire[1:0] T277;
  wire[1:0] T278;
  wire[1:0] T279;
  wire[3:0] T280;
  wire[3:0] T281;
  wire T282;
  wire T283;
  wire T284;
  wire[1:0] T285;
  wire[1:0] T286;
  wire[1:0] T287;
  wire[3:0] T288;
  wire[3:0] T289;
  wire T290;
  wire T291;
  wire T292;
  wire[1:0] T293;
  wire[1:0] T294;
  wire[1:0] T295;
  wire[3:0] T296;
  wire[3:0] T297;
  wire T298;
  wire T299;
  wire T300;
  wire[1:0] T301;
  wire[1:0] T302;
  wire[1:0] T303;
  wire[3:0] T304;
  wire[3:0] T305;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T190, T2};
  assign T2 = T3;
  assign T3 = {T182, T4};
  assign T4 = T5;
  assign T5 = {T174, T6};
  assign T6 = T7;
  assign T7 = {T166, T8};
  assign T8 = T9;
  assign T9 = {T158, T10};
  assign T10 = T11;
  assign T11 = {T150, T12};
  assign T12 = T13;
  assign T13 = {T142, T14};
  assign T14 = T15;
  assign T15 = {T134, T16};
  assign T16 = T17;
  assign T17 = {T126, T18};
  assign T18 = T19;
  assign T19 = {T118, T20};
  assign T20 = T21;
  assign T21 = {T110, T22};
  assign T22 = T23;
  assign T23 = {T102, T24};
  assign T24 = T25;
  assign T25 = {T94, T26};
  assign T26 = T27;
  assign T27 = {T86, T28};
  assign T28 = T29;
  assign T29 = {T78, T30};
  assign T30 = T31;
  assign T31 = {T70, T32};
  assign T32 = T33;
  assign T33 = {T62, T34};
  assign T34 = T35;
  assign T35 = {T54, T36};
  assign T36 = T37;
  assign T37 = {T46, T38};
  assign T38 = T39;
  assign T39 = T40;
  assign T40 = T44[T41];
  assign T41 = T42;
  assign T42 = T43;
  assign T43 = io_chanxy_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T44 = T45;
  assign T45 = io_chanxy_in[4'h9/* 9*/:1'h0/* 0*/];
  assign T46 = T47;
  assign T47 = T48;
  assign T48 = T52[T49];
  assign T49 = T50;
  assign T50 = T51;
  assign T51 = io_chanxy_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T52 = T53;
  assign T53 = io_chanxy_in[5'h13/* 19*/:4'ha/* 10*/];
  assign T54 = T55;
  assign T55 = T56;
  assign T56 = T60[T57];
  assign T57 = T58;
  assign T58 = T59;
  assign T59 = io_chanxy_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T60 = T61;
  assign T61 = io_chanxy_in[5'h1d/* 29*/:5'h14/* 20*/];
  assign T62 = T63;
  assign T63 = T64;
  assign T64 = T68[T65];
  assign T65 = T66;
  assign T66 = T67;
  assign T67 = io_chanxy_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T68 = T69;
  assign T69 = io_chanxy_in[6'h27/* 39*/:5'h1e/* 30*/];
  assign T70 = T71;
  assign T71 = T72;
  assign T72 = T76[T73];
  assign T73 = T74;
  assign T74 = T75;
  assign T75 = io_chanxy_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T76 = T77;
  assign T77 = io_chanxy_in[6'h30/* 48*/:6'h28/* 40*/];
  assign T78 = T79;
  assign T79 = T80;
  assign T80 = T84[T81];
  assign T81 = T82;
  assign T82 = T83;
  assign T83 = io_chanxy_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T84 = T85;
  assign T85 = io_chanxy_in[6'h3a/* 58*/:6'h31/* 49*/];
  assign T86 = T87;
  assign T87 = T88;
  assign T88 = T92[T89];
  assign T89 = T90;
  assign T90 = T91;
  assign T91 = io_chanxy_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T92 = T93;
  assign T93 = io_chanxy_in[7'h44/* 68*/:6'h3b/* 59*/];
  assign T94 = T95;
  assign T95 = T96;
  assign T96 = T100[T97];
  assign T97 = T98;
  assign T98 = T99;
  assign T99 = io_chanxy_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T100 = T101;
  assign T101 = io_chanxy_in[7'h4e/* 78*/:7'h45/* 69*/];
  assign T102 = T103;
  assign T103 = T104;
  assign T104 = T108[T105];
  assign T105 = T106;
  assign T106 = T107;
  assign T107 = io_chanxy_config[6'h23/* 35*/:6'h20/* 32*/];
  assign T108 = T109;
  assign T109 = io_chanxy_in[7'h58/* 88*/:7'h4f/* 79*/];
  assign T110 = T111;
  assign T111 = T112;
  assign T112 = T116[T113];
  assign T113 = T114;
  assign T114 = T115;
  assign T115 = io_chanxy_config[6'h27/* 39*/:6'h24/* 36*/];
  assign T116 = T117;
  assign T117 = io_chanxy_in[7'h61/* 97*/:7'h59/* 89*/];
  assign T118 = T119;
  assign T119 = T120;
  assign T120 = T124[T121];
  assign T121 = T122;
  assign T122 = T123;
  assign T123 = io_chanxy_config[6'h2b/* 43*/:6'h28/* 40*/];
  assign T124 = T125;
  assign T125 = io_chanxy_in[7'h6b/* 107*/:7'h62/* 98*/];
  assign T126 = T127;
  assign T127 = T128;
  assign T128 = T132[T129];
  assign T129 = T130;
  assign T130 = T131;
  assign T131 = io_chanxy_config[6'h2f/* 47*/:6'h2c/* 44*/];
  assign T132 = T133;
  assign T133 = io_chanxy_in[7'h75/* 117*/:7'h6c/* 108*/];
  assign T134 = T135;
  assign T135 = T136;
  assign T136 = T140[T137];
  assign T137 = T138;
  assign T138 = T139;
  assign T139 = io_chanxy_config[6'h33/* 51*/:6'h30/* 48*/];
  assign T140 = T141;
  assign T141 = io_chanxy_in[7'h7f/* 127*/:7'h76/* 118*/];
  assign T142 = T143;
  assign T143 = T144;
  assign T144 = T148[T145];
  assign T145 = T146;
  assign T146 = T147;
  assign T147 = io_chanxy_config[6'h37/* 55*/:6'h34/* 52*/];
  assign T148 = T149;
  assign T149 = io_chanxy_in[8'h89/* 137*/:8'h80/* 128*/];
  assign T150 = T151;
  assign T151 = T152;
  assign T152 = T156[T153];
  assign T153 = T154;
  assign T154 = T155;
  assign T155 = io_chanxy_config[6'h3b/* 59*/:6'h38/* 56*/];
  assign T156 = T157;
  assign T157 = io_chanxy_in[8'h92/* 146*/:8'h8a/* 138*/];
  assign T158 = T159;
  assign T159 = T160;
  assign T160 = T164[T161];
  assign T161 = T162;
  assign T162 = T163;
  assign T163 = io_chanxy_config[6'h3f/* 63*/:6'h3c/* 60*/];
  assign T164 = T165;
  assign T165 = io_chanxy_in[8'h9c/* 156*/:8'h93/* 147*/];
  assign T166 = T167;
  assign T167 = T168;
  assign T168 = T172[T169];
  assign T169 = T170;
  assign T170 = T171;
  assign T171 = io_chanxy_config[7'h43/* 67*/:7'h40/* 64*/];
  assign T172 = T173;
  assign T173 = io_chanxy_in[8'ha6/* 166*/:8'h9d/* 157*/];
  assign T174 = T175;
  assign T175 = T176;
  assign T176 = T180[T177];
  assign T177 = T178;
  assign T178 = T179;
  assign T179 = io_chanxy_config[7'h47/* 71*/:7'h44/* 68*/];
  assign T180 = T181;
  assign T181 = io_chanxy_in[8'hb0/* 176*/:8'ha7/* 167*/];
  assign T182 = T183;
  assign T183 = T184;
  assign T184 = T188[T185];
  assign T185 = T186;
  assign T186 = T187;
  assign T187 = io_chanxy_config[7'h4b/* 75*/:7'h48/* 72*/];
  assign T188 = T189;
  assign T189 = io_chanxy_in[8'hba/* 186*/:8'hb1/* 177*/];
  assign T190 = T191;
  assign T191 = T192;
  assign T192 = T196[T193];
  assign T193 = T194;
  assign T194 = T195;
  assign T195 = io_chanxy_config[7'h4f/* 79*/:7'h4c/* 76*/];
  assign T196 = T197;
  assign T197 = io_chanxy_in[8'hc3/* 195*/:8'hbb/* 187*/];
  assign io_ipin_out = T198;
  assign T198 = T199;
  assign T199 = {T298, T200};
  assign T200 = T201;
  assign T201 = {T290, T202};
  assign T202 = T203;
  assign T203 = {T282, T204};
  assign T204 = T205;
  assign T205 = {T274, T206};
  assign T206 = T207;
  assign T207 = {T266, T208};
  assign T208 = T209;
  assign T209 = {T258, T210};
  assign T210 = T211;
  assign T211 = {T250, T212};
  assign T212 = T213;
  assign T213 = {T242, T214};
  assign T214 = T215;
  assign T215 = {T234, T216};
  assign T216 = T217;
  assign T217 = {T226, T218};
  assign T218 = T219;
  assign T219 = T220;
  assign T220 = T224[T221];
  assign T221 = T222;
  assign T222 = T223;
  assign T223 = io_ipin_config[1'h1/* 1*/:1'h0/* 0*/];
  assign T224 = T225;
  assign T225 = io_ipin_in[2'h3/* 3*/:1'h0/* 0*/];
  assign T226 = T227;
  assign T227 = T228;
  assign T228 = T232[T229];
  assign T229 = T230;
  assign T230 = T231;
  assign T231 = io_ipin_config[2'h3/* 3*/:2'h2/* 2*/];
  assign T232 = T233;
  assign T233 = io_ipin_in[3'h7/* 7*/:3'h4/* 4*/];
  assign T234 = T235;
  assign T235 = T236;
  assign T236 = T240[T237];
  assign T237 = T238;
  assign T238 = T239;
  assign T239 = io_ipin_config[3'h5/* 5*/:3'h4/* 4*/];
  assign T240 = T241;
  assign T241 = io_ipin_in[4'hb/* 11*/:4'h8/* 8*/];
  assign T242 = T243;
  assign T243 = T244;
  assign T244 = T248[T245];
  assign T245 = T246;
  assign T246 = T247;
  assign T247 = io_ipin_config[3'h7/* 7*/:3'h6/* 6*/];
  assign T248 = T249;
  assign T249 = io_ipin_in[4'hf/* 15*/:4'hc/* 12*/];
  assign T250 = T251;
  assign T251 = T252;
  assign T252 = T256[T253];
  assign T253 = T254;
  assign T254 = T255;
  assign T255 = io_ipin_config[4'h9/* 9*/:4'h8/* 8*/];
  assign T256 = T257;
  assign T257 = io_ipin_in[5'h13/* 19*/:5'h10/* 16*/];
  assign T258 = T259;
  assign T259 = T260;
  assign T260 = T264[T261];
  assign T261 = T262;
  assign T262 = T263;
  assign T263 = io_ipin_config[4'hb/* 11*/:4'ha/* 10*/];
  assign T264 = T265;
  assign T265 = io_ipin_in[5'h17/* 23*/:5'h14/* 20*/];
  assign T266 = T267;
  assign T267 = T268;
  assign T268 = T272[T269];
  assign T269 = T270;
  assign T270 = T271;
  assign T271 = io_ipin_config[4'hd/* 13*/:4'hc/* 12*/];
  assign T272 = T273;
  assign T273 = io_ipin_in[5'h1b/* 27*/:5'h18/* 24*/];
  assign T274 = T275;
  assign T275 = T276;
  assign T276 = T280[T277];
  assign T277 = T278;
  assign T278 = T279;
  assign T279 = io_ipin_config[4'hf/* 15*/:4'he/* 14*/];
  assign T280 = T281;
  assign T281 = io_ipin_in[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T282 = T283;
  assign T283 = T284;
  assign T284 = T288[T285];
  assign T285 = T286;
  assign T286 = T287;
  assign T287 = io_ipin_config[5'h11/* 17*/:5'h10/* 16*/];
  assign T288 = T289;
  assign T289 = io_ipin_in[6'h23/* 35*/:6'h20/* 32*/];
  assign T290 = T291;
  assign T291 = T292;
  assign T292 = T296[T293];
  assign T293 = T294;
  assign T294 = T295;
  assign T295 = io_ipin_config[5'h13/* 19*/:5'h12/* 18*/];
  assign T296 = T297;
  assign T297 = io_ipin_in[6'h27/* 39*/:6'h24/* 36*/];
  assign T298 = T299;
  assign T299 = T300;
  assign T300 = T304[T301];
  assign T301 = T302;
  assign T302 = T303;
  assign T303 = io_ipin_config[5'h15/* 21*/:5'h14/* 20*/];
  assign T304 = T305;
  assign T305 = io_ipin_in[6'h2b/* 43*/:6'h28/* 40*/];
endmodule

module lut_tile(input clk, input reset,
    input  io_ff_en,
    input [31:0] io_configs_in,
    input [7:0] io_configs_en,
    input [43:0] io_ipin_in,
    input [195:0] io_chanxy_in,
    output[19:0] io_chanxy_out,
    output[3:0] io_opin_out);

  wire[79:0] T0;
  wire[255:0] this_config_io_configs_out;
  wire[21:0] T1;
  wire[63:0] T2;
  wire[14:0] T3;
  wire[10:0] this_sbcb_io_ipin_out;
  wire[3:0] this_clb_io_clb_out;
  wire[3:0] T4;
  wire[63:0] T5;
  wire[15:0] this_xbar_io_xbar_out;
  wire[19:0] this_sbcb_io_chanxy_out;

  assign T0 = this_config_io_configs_out[8'he9/* 233*/:8'h9a/* 154*/];
  assign T1 = this_config_io_configs_out[8'h99/* 153*/:8'h84/* 132*/];
  assign T2 = this_config_io_configs_out[8'h83/* 131*/:7'h44/* 68*/];
  assign T3 = {this_clb_io_clb_out, this_sbcb_io_ipin_out};
  assign T4 = this_config_io_configs_out[7'h43/* 67*/:7'h40/* 64*/];
  assign T5 = this_config_io_configs_out[6'h3f/* 63*/:1'h0/* 0*/];
  assign io_opin_out = this_clb_io_clb_out;
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  clb this_clb(.clk(clk), .reset(reset),
       .io_clb_in( this_xbar_io_xbar_out ),
       .io_clb_out( this_clb_io_clb_out ),
       .io_lut_configs( T5 ),
       .io_mux_configs( T4 ),
       .io_ff_en( io_ff_en ));
  xbar this_xbar(.clk(clk), .reset(reset),
       .io_xbar_in( T3 ),
       .io_xbar_out( this_xbar_io_xbar_out ),
       .io_mux_configs( T2 ));
    configs_latches_8 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
  sbcb this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
endmodule

// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module lut4(input clk, input reset,
    input [3:0] io_lut_in,
    output io_lut_out,
    input [15:0] io_lut_configs,
    input  io_mux_configs,
    input  io_ff_en);

  wire T0;
  wire T1;
  wire T2;
  wire[1:0] T3;
  wire lut4_o;
  wire[3:0] T4;
  reg[0:0] ff1;
  wire T5;

  assign io_lut_out = T0;
  assign T0 = T3[T1];
  assign T1 = T2;
  assign T2 = io_mux_configs;
  assign T3 = {ff1, lut4_o};
  assign lut4_o = io_lut_configs[T4];
  assign T4 = io_lut_in;
  assign T5 = 1'h1/* 1*/ ? lut4_o : ff1;

  always @(posedge clk) begin
    if(reset) begin
      ff1 <= 1'b0/* 0*/;
    end else if(io_ff_en) begin
      ff1 <= T5;
    end
  end
endmodule

module clb(input clk, input reset,
    input [15:0] io_clb_in,
    output[3:0] io_clb_out,
    input [63:0] io_lut_configs,
    input [3:0] io_mux_configs,
    input  io_ff_en);

  wire T0;
  wire[15:0] T1;
  wire[3:0] T2;
  wire T3;
  wire[15:0] T4;
  wire[3:0] T5;
  wire T6;
  wire[15:0] T7;
  wire[3:0] T8;
  wire T9;
  wire[15:0] T10;
  wire[3:0] T11;
  wire[3:0] T12;
  wire[3:0] T13;
  wire[2:0] T14;
  wire[2:0] T15;
  wire[1:0] T16;
  wire[1:0] T17;
  wire T18;
  wire T19;
  wire lut4_io_lut_out;
  wire T20;
  wire T21;
  wire lut4_1_io_lut_out;
  wire T22;
  wire T23;
  wire lut4_2_io_lut_out;
  wire T24;
  wire T25;
  wire lut4_3_io_lut_out;

  assign T0 = io_mux_configs[2'h3/* 3*/:2'h3/* 3*/];
  assign T1 = io_lut_configs[6'h3f/* 63*/:6'h30/* 48*/];
  assign T2 = io_clb_in[4'hf/* 15*/:4'hc/* 12*/];
  assign T3 = io_mux_configs[2'h2/* 2*/:2'h2/* 2*/];
  assign T4 = io_lut_configs[6'h2f/* 47*/:6'h20/* 32*/];
  assign T5 = io_clb_in[4'hb/* 11*/:4'h8/* 8*/];
  assign T6 = io_mux_configs[1'h1/* 1*/:1'h1/* 1*/];
  assign T7 = io_lut_configs[5'h1f/* 31*/:5'h10/* 16*/];
  assign T8 = io_clb_in[3'h7/* 7*/:3'h4/* 4*/];
  assign T9 = io_mux_configs[1'h0/* 0*/:1'h0/* 0*/];
  assign T10 = io_lut_configs[4'hf/* 15*/:1'h0/* 0*/];
  assign T11 = io_clb_in[2'h3/* 3*/:1'h0/* 0*/];
  assign io_clb_out = T12;
  assign T12 = T13;
  assign T13 = {T24, T14};
  assign T14 = T15;
  assign T15 = {T22, T16};
  assign T16 = T17;
  assign T17 = {T20, T18};
  assign T18 = T19;
  assign T19 = lut4_io_lut_out;
  assign T20 = T21;
  assign T21 = lut4_1_io_lut_out;
  assign T22 = T23;
  assign T23 = lut4_2_io_lut_out;
  assign T24 = T25;
  assign T25 = lut4_3_io_lut_out;
  lut4 lut4(.clk(clk), .reset(reset),
       .io_lut_in( T11 ),
       .io_lut_out( lut4_io_lut_out ),
       .io_lut_configs( T10 ),
       .io_mux_configs( T9 ),
       .io_ff_en( io_ff_en ));
  lut4 lut4_1(.clk(clk), .reset(reset),
       .io_lut_in( T8 ),
       .io_lut_out( lut4_1_io_lut_out ),
       .io_lut_configs( T7 ),
       .io_mux_configs( T6 ),
       .io_ff_en( io_ff_en ));
  lut4 lut4_2(.clk(clk), .reset(reset),
       .io_lut_in( T5 ),
       .io_lut_out( lut4_2_io_lut_out ),
       .io_lut_configs( T4 ),
       .io_mux_configs( T3 ),
       .io_ff_en( io_ff_en ));
  lut4 lut4_3(.clk(clk), .reset(reset),
       .io_lut_in( T2 ),
       .io_lut_out( lut4_3_io_lut_out ),
       .io_lut_configs( T1 ),
       .io_mux_configs( T0 ),
       .io_ff_en( io_ff_en ));
endmodule



module sbcb(
    input [43:0] io_ipin_in,
    input [21:0] io_ipin_config,
    input [195:0] io_chanxy_in,
    input [79:0] io_chanxy_config,
    output[10:0] io_ipin_out,
    output[19:0] io_chanxy_out);

  wire[19:0] T0;
  wire[19:0] T1;
  wire[18:0] T2;
  wire[18:0] T3;
  wire[17:0] T4;
  wire[17:0] T5;
  wire[16:0] T6;
  wire[16:0] T7;
  wire[15:0] T8;
  wire[15:0] T9;
  wire[14:0] T10;
  wire[14:0] T11;
  wire[13:0] T12;
  wire[13:0] T13;
  wire[12:0] T14;
  wire[12:0] T15;
  wire[11:0] T16;
  wire[11:0] T17;
  wire[10:0] T18;
  wire[10:0] T19;
  wire[9:0] T20;
  wire[9:0] T21;
  wire[8:0] T22;
  wire[8:0] T23;
  wire[7:0] T24;
  wire[7:0] T25;
  wire[6:0] T26;
  wire[6:0] T27;
  wire[5:0] T28;
  wire[5:0] T29;
  wire[4:0] T30;
  wire[4:0] T31;
  wire[3:0] T32;
  wire[3:0] T33;
  wire[2:0] T34;
  wire[2:0] T35;
  wire[1:0] T36;
  wire[1:0] T37;
  wire T38;
  wire T39;
  wire T40;
  wire[3:0] T41;
  wire[3:0] T42;
  wire[3:0] T43;
  wire[9:0] T44;
  wire[9:0] T45;
  wire T46;
  wire T47;
  wire T48;
  wire[3:0] T49;
  wire[3:0] T50;
  wire[3:0] T51;
  wire[9:0] T52;
  wire[9:0] T53;
  wire T54;
  wire T55;
  wire T56;
  wire[3:0] T57;
  wire[3:0] T58;
  wire[3:0] T59;
  wire[9:0] T60;
  wire[9:0] T61;
  wire T62;
  wire T63;
  wire T64;
  wire[3:0] T65;
  wire[3:0] T66;
  wire[3:0] T67;
  wire[9:0] T68;
  wire[9:0] T69;
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
  wire[9:0] T84;
  wire[9:0] T85;
  wire T86;
  wire T87;
  wire T88;
  wire[3:0] T89;
  wire[3:0] T90;
  wire[3:0] T91;
  wire[9:0] T92;
  wire[9:0] T93;
  wire T94;
  wire T95;
  wire T96;
  wire[3:0] T97;
  wire[3:0] T98;
  wire[3:0] T99;
  wire[9:0] T100;
  wire[9:0] T101;
  wire T102;
  wire T103;
  wire T104;
  wire[3:0] T105;
  wire[3:0] T106;
  wire[3:0] T107;
  wire[9:0] T108;
  wire[9:0] T109;
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
  wire[3:0] T121;
  wire[3:0] T122;
  wire[3:0] T123;
  wire[9:0] T124;
  wire[9:0] T125;
  wire T126;
  wire T127;
  wire T128;
  wire[3:0] T129;
  wire[3:0] T130;
  wire[3:0] T131;
  wire[9:0] T132;
  wire[9:0] T133;
  wire T134;
  wire T135;
  wire T136;
  wire[3:0] T137;
  wire[3:0] T138;
  wire[3:0] T139;
  wire[9:0] T140;
  wire[9:0] T141;
  wire T142;
  wire T143;
  wire T144;
  wire[3:0] T145;
  wire[3:0] T146;
  wire[3:0] T147;
  wire[9:0] T148;
  wire[9:0] T149;
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
  wire[9:0] T164;
  wire[9:0] T165;
  wire T166;
  wire T167;
  wire T168;
  wire[3:0] T169;
  wire[3:0] T170;
  wire[3:0] T171;
  wire[9:0] T172;
  wire[9:0] T173;
  wire T174;
  wire T175;
  wire T176;
  wire[3:0] T177;
  wire[3:0] T178;
  wire[3:0] T179;
  wire[9:0] T180;
  wire[9:0] T181;
  wire T182;
  wire T183;
  wire T184;
  wire[3:0] T185;
  wire[3:0] T186;
  wire[3:0] T187;
  wire[9:0] T188;
  wire[9:0] T189;
  wire T190;
  wire T191;
  wire T192;
  wire[3:0] T193;
  wire[3:0] T194;
  wire[3:0] T195;
  wire[8:0] T196;
  wire[8:0] T197;
  wire[10:0] T198;
  wire[10:0] T199;
  wire[9:0] T200;
  wire[9:0] T201;
  wire[8:0] T202;
  wire[8:0] T203;
  wire[7:0] T204;
  wire[7:0] T205;
  wire[6:0] T206;
  wire[6:0] T207;
  wire[5:0] T208;
  wire[5:0] T209;
  wire[4:0] T210;
  wire[4:0] T211;
  wire[3:0] T212;
  wire[3:0] T213;
  wire[2:0] T214;
  wire[2:0] T215;
  wire[1:0] T216;
  wire[1:0] T217;
  wire T218;
  wire T219;
  wire T220;
  wire[1:0] T221;
  wire[1:0] T222;
  wire[1:0] T223;
  wire[3:0] T224;
  wire[3:0] T225;
  wire T226;
  wire T227;
  wire T228;
  wire[1:0] T229;
  wire[1:0] T230;
  wire[1:0] T231;
  wire[3:0] T232;
  wire[3:0] T233;
  wire T234;
  wire T235;
  wire T236;
  wire[1:0] T237;
  wire[1:0] T238;
  wire[1:0] T239;
  wire[3:0] T240;
  wire[3:0] T241;
  wire T242;
  wire T243;
  wire T244;
  wire[1:0] T245;
  wire[1:0] T246;
  wire[1:0] T247;
  wire[3:0] T248;
  wire[3:0] T249;
  wire T250;
  wire T251;
  wire T252;
  wire[1:0] T253;
  wire[1:0] T254;
  wire[1:0] T255;
  wire[3:0] T256;
  wire[3:0] T257;
  wire T258;
  wire T259;
  wire T260;
  wire[1:0] T261;
  wire[1:0] T262;
  wire[1:0] T263;
  wire[3:0] T264;
  wire[3:0] T265;
  wire T266;
  wire T267;
  wire T268;
  wire[1:0] T269;
  wire[1:0] T270;
  wire[1:0] T271;
  wire[3:0] T272;
  wire[3:0] T273;
  wire T274;
  wire T275;
  wire T276;
  wire[1:0] T277;
  wire[1:0] T278;
  wire[1:0] T279;
  wire[3:0] T280;
  wire[3:0] T281;
  wire T282;
  wire T283;
  wire T284;
  wire[1:0] T285;
  wire[1:0] T286;
  wire[1:0] T287;
  wire[3:0] T288;
  wire[3:0] T289;
  wire T290;
  wire T291;
  wire T292;
  wire[1:0] T293;
  wire[1:0] T294;
  wire[1:0] T295;
  wire[3:0] T296;
  wire[3:0] T297;
  wire T298;
  wire T299;
  wire T300;
  wire[1:0] T301;
  wire[1:0] T302;
  wire[1:0] T303;
  wire[3:0] T304;
  wire[3:0] T305;

  assign io_chanxy_out = T0;
  assign T0 = T1;
  assign T1 = {T190, T2};
  assign T2 = T3;
  assign T3 = {T182, T4};
  assign T4 = T5;
  assign T5 = {T174, T6};
  assign T6 = T7;
  assign T7 = {T166, T8};
  assign T8 = T9;
  assign T9 = {T158, T10};
  assign T10 = T11;
  assign T11 = {T150, T12};
  assign T12 = T13;
  assign T13 = {T142, T14};
  assign T14 = T15;
  assign T15 = {T134, T16};
  assign T16 = T17;
  assign T17 = {T126, T18};
  assign T18 = T19;
  assign T19 = {T118, T20};
  assign T20 = T21;
  assign T21 = {T110, T22};
  assign T22 = T23;
  assign T23 = {T102, T24};
  assign T24 = T25;
  assign T25 = {T94, T26};
  assign T26 = T27;
  assign T27 = {T86, T28};
  assign T28 = T29;
  assign T29 = {T78, T30};
  assign T30 = T31;
  assign T31 = {T70, T32};
  assign T32 = T33;
  assign T33 = {T62, T34};
  assign T34 = T35;
  assign T35 = {T54, T36};
  assign T36 = T37;
  assign T37 = {T46, T38};
  assign T38 = T39;
  assign T39 = T40;
  assign T40 = T44[T41];
  assign T41 = T42;
  assign T42 = T43;
  assign T43 = io_chanxy_config[2'h3/* 3*/:1'h0/* 0*/];
  assign T44 = T45;
  assign T45 = io_chanxy_in[4'h9/* 9*/:1'h0/* 0*/];
  assign T46 = T47;
  assign T47 = T48;
  assign T48 = T52[T49];
  assign T49 = T50;
  assign T50 = T51;
  assign T51 = io_chanxy_config[3'h7/* 7*/:3'h4/* 4*/];
  assign T52 = T53;
  assign T53 = io_chanxy_in[5'h13/* 19*/:4'ha/* 10*/];
  assign T54 = T55;
  assign T55 = T56;
  assign T56 = T60[T57];
  assign T57 = T58;
  assign T58 = T59;
  assign T59 = io_chanxy_config[4'hb/* 11*/:4'h8/* 8*/];
  assign T60 = T61;
  assign T61 = io_chanxy_in[5'h1d/* 29*/:5'h14/* 20*/];
  assign T62 = T63;
  assign T63 = T64;
  assign T64 = T68[T65];
  assign T65 = T66;
  assign T66 = T67;
  assign T67 = io_chanxy_config[4'hf/* 15*/:4'hc/* 12*/];
  assign T68 = T69;
  assign T69 = io_chanxy_in[6'h27/* 39*/:5'h1e/* 30*/];
  assign T70 = T71;
  assign T71 = T72;
  assign T72 = T76[T73];
  assign T73 = T74;
  assign T74 = T75;
  assign T75 = io_chanxy_config[5'h13/* 19*/:5'h10/* 16*/];
  assign T76 = T77;
  assign T77 = io_chanxy_in[6'h30/* 48*/:6'h28/* 40*/];
  assign T78 = T79;
  assign T79 = T80;
  assign T80 = T84[T81];
  assign T81 = T82;
  assign T82 = T83;
  assign T83 = io_chanxy_config[5'h17/* 23*/:5'h14/* 20*/];
  assign T84 = T85;
  assign T85 = io_chanxy_in[6'h3a/* 58*/:6'h31/* 49*/];
  assign T86 = T87;
  assign T87 = T88;
  assign T88 = T92[T89];
  assign T89 = T90;
  assign T90 = T91;
  assign T91 = io_chanxy_config[5'h1b/* 27*/:5'h18/* 24*/];
  assign T92 = T93;
  assign T93 = io_chanxy_in[7'h44/* 68*/:6'h3b/* 59*/];
  assign T94 = T95;
  assign T95 = T96;
  assign T96 = T100[T97];
  assign T97 = T98;
  assign T98 = T99;
  assign T99 = io_chanxy_config[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T100 = T101;
  assign T101 = io_chanxy_in[7'h4e/* 78*/:7'h45/* 69*/];
  assign T102 = T103;
  assign T103 = T104;
  assign T104 = T108[T105];
  assign T105 = T106;
  assign T106 = T107;
  assign T107 = io_chanxy_config[6'h23/* 35*/:6'h20/* 32*/];
  assign T108 = T109;
  assign T109 = io_chanxy_in[7'h58/* 88*/:7'h4f/* 79*/];
  assign T110 = T111;
  assign T111 = T112;
  assign T112 = T116[T113];
  assign T113 = T114;
  assign T114 = T115;
  assign T115 = io_chanxy_config[6'h27/* 39*/:6'h24/* 36*/];
  assign T116 = T117;
  assign T117 = io_chanxy_in[7'h61/* 97*/:7'h59/* 89*/];
  assign T118 = T119;
  assign T119 = T120;
  assign T120 = T124[T121];
  assign T121 = T122;
  assign T122 = T123;
  assign T123 = io_chanxy_config[6'h2b/* 43*/:6'h28/* 40*/];
  assign T124 = T125;
  assign T125 = io_chanxy_in[7'h6b/* 107*/:7'h62/* 98*/];
  assign T126 = T127;
  assign T127 = T128;
  assign T128 = T132[T129];
  assign T129 = T130;
  assign T130 = T131;
  assign T131 = io_chanxy_config[6'h2f/* 47*/:6'h2c/* 44*/];
  assign T132 = T133;
  assign T133 = io_chanxy_in[7'h75/* 117*/:7'h6c/* 108*/];
  assign T134 = T135;
  assign T135 = T136;
  assign T136 = T140[T137];
  assign T137 = T138;
  assign T138 = T139;
  assign T139 = io_chanxy_config[6'h33/* 51*/:6'h30/* 48*/];
  assign T140 = T141;
  assign T141 = io_chanxy_in[7'h7f/* 127*/:7'h76/* 118*/];
  assign T142 = T143;
  assign T143 = T144;
  assign T144 = T148[T145];
  assign T145 = T146;
  assign T146 = T147;
  assign T147 = io_chanxy_config[6'h37/* 55*/:6'h34/* 52*/];
  assign T148 = T149;
  assign T149 = io_chanxy_in[8'h89/* 137*/:8'h80/* 128*/];
  assign T150 = T151;
  assign T151 = T152;
  assign T152 = T156[T153];
  assign T153 = T154;
  assign T154 = T155;
  assign T155 = io_chanxy_config[6'h3b/* 59*/:6'h38/* 56*/];
  assign T156 = T157;
  assign T157 = io_chanxy_in[8'h92/* 146*/:8'h8a/* 138*/];
  assign T158 = T159;
  assign T159 = T160;
  assign T160 = T164[T161];
  assign T161 = T162;
  assign T162 = T163;
  assign T163 = io_chanxy_config[6'h3f/* 63*/:6'h3c/* 60*/];
  assign T164 = T165;
  assign T165 = io_chanxy_in[8'h9c/* 156*/:8'h93/* 147*/];
  assign T166 = T167;
  assign T167 = T168;
  assign T168 = T172[T169];
  assign T169 = T170;
  assign T170 = T171;
  assign T171 = io_chanxy_config[7'h43/* 67*/:7'h40/* 64*/];
  assign T172 = T173;
  assign T173 = io_chanxy_in[8'ha6/* 166*/:8'h9d/* 157*/];
  assign T174 = T175;
  assign T175 = T176;
  assign T176 = T180[T177];
  assign T177 = T178;
  assign T178 = T179;
  assign T179 = io_chanxy_config[7'h47/* 71*/:7'h44/* 68*/];
  assign T180 = T181;
  assign T181 = io_chanxy_in[8'hb0/* 176*/:8'ha7/* 167*/];
  assign T182 = T183;
  assign T183 = T184;
  assign T184 = T188[T185];
  assign T185 = T186;
  assign T186 = T187;
  assign T187 = io_chanxy_config[7'h4b/* 75*/:7'h48/* 72*/];
  assign T188 = T189;
  assign T189 = io_chanxy_in[8'hba/* 186*/:8'hb1/* 177*/];
  assign T190 = T191;
  assign T191 = T192;
  assign T192 = T196[T193];
  assign T193 = T194;
  assign T194 = T195;
  assign T195 = io_chanxy_config[7'h4f/* 79*/:7'h4c/* 76*/];
  assign T196 = T197;
  assign T197 = io_chanxy_in[8'hc3/* 195*/:8'hbb/* 187*/];
  assign io_ipin_out = T198;
  assign T198 = T199;
  assign T199 = {T298, T200};
  assign T200 = T201;
  assign T201 = {T290, T202};
  assign T202 = T203;
  assign T203 = {T282, T204};
  assign T204 = T205;
  assign T205 = {T274, T206};
  assign T206 = T207;
  assign T207 = {T266, T208};
  assign T208 = T209;
  assign T209 = {T258, T210};
  assign T210 = T211;
  assign T211 = {T250, T212};
  assign T212 = T213;
  assign T213 = {T242, T214};
  assign T214 = T215;
  assign T215 = {T234, T216};
  assign T216 = T217;
  assign T217 = {T226, T218};
  assign T218 = T219;
  assign T219 = T220;
  assign T220 = T224[T221];
  assign T221 = T222;
  assign T222 = T223;
  assign T223 = io_ipin_config[1'h1/* 1*/:1'h0/* 0*/];
  assign T224 = T225;
  assign T225 = io_ipin_in[2'h3/* 3*/:1'h0/* 0*/];
  assign T226 = T227;
  assign T227 = T228;
  assign T228 = T232[T229];
  assign T229 = T230;
  assign T230 = T231;
  assign T231 = io_ipin_config[2'h3/* 3*/:2'h2/* 2*/];
  assign T232 = T233;
  assign T233 = io_ipin_in[3'h7/* 7*/:3'h4/* 4*/];
  assign T234 = T235;
  assign T235 = T236;
  assign T236 = T240[T237];
  assign T237 = T238;
  assign T238 = T239;
  assign T239 = io_ipin_config[3'h5/* 5*/:3'h4/* 4*/];
  assign T240 = T241;
  assign T241 = io_ipin_in[4'hb/* 11*/:4'h8/* 8*/];
  assign T242 = T243;
  assign T243 = T244;
  assign T244 = T248[T245];
  assign T245 = T246;
  assign T246 = T247;
  assign T247 = io_ipin_config[3'h7/* 7*/:3'h6/* 6*/];
  assign T248 = T249;
  assign T249 = io_ipin_in[4'hf/* 15*/:4'hc/* 12*/];
  assign T250 = T251;
  assign T251 = T252;
  assign T252 = T256[T253];
  assign T253 = T254;
  assign T254 = T255;
  assign T255 = io_ipin_config[4'h9/* 9*/:4'h8/* 8*/];
  assign T256 = T257;
  assign T257 = io_ipin_in[5'h13/* 19*/:5'h10/* 16*/];
  assign T258 = T259;
  assign T259 = T260;
  assign T260 = T264[T261];
  assign T261 = T262;
  assign T262 = T263;
  assign T263 = io_ipin_config[4'hb/* 11*/:4'ha/* 10*/];
  assign T264 = T265;
  assign T265 = io_ipin_in[5'h17/* 23*/:5'h14/* 20*/];
  assign T266 = T267;
  assign T267 = T268;
  assign T268 = T272[T269];
  assign T269 = T270;
  assign T270 = T271;
  assign T271 = io_ipin_config[4'hd/* 13*/:4'hc/* 12*/];
  assign T272 = T273;
  assign T273 = io_ipin_in[5'h1b/* 27*/:5'h18/* 24*/];
  assign T274 = T275;
  assign T275 = T276;
  assign T276 = T280[T277];
  assign T277 = T278;
  assign T278 = T279;
  assign T279 = io_ipin_config[4'hf/* 15*/:4'he/* 14*/];
  assign T280 = T281;
  assign T281 = io_ipin_in[5'h1f/* 31*/:5'h1c/* 28*/];
  assign T282 = T283;
  assign T283 = T284;
  assign T284 = T288[T285];
  assign T285 = T286;
  assign T286 = T287;
  assign T287 = io_ipin_config[5'h11/* 17*/:5'h10/* 16*/];
  assign T288 = T289;
  assign T289 = io_ipin_in[6'h23/* 35*/:6'h20/* 32*/];
  assign T290 = T291;
  assign T291 = T292;
  assign T292 = T296[T293];
  assign T293 = T294;
  assign T294 = T295;
  assign T295 = io_ipin_config[5'h13/* 19*/:5'h12/* 18*/];
  assign T296 = T297;
  assign T297 = io_ipin_in[6'h27/* 39*/:6'h24/* 36*/];
  assign T298 = T299;
  assign T299 = T300;
  assign T300 = T304[T301];
  assign T301 = T302;
  assign T302 = T303;
  assign T303 = io_ipin_config[5'h15/* 21*/:5'h14/* 20*/];
  assign T304 = T305;
  assign T305 = io_ipin_in[6'h2b/* 43*/:6'h28/* 40*/];
endmodule

module lut_tile(input clk, input reset,
    input  io_ff_en,
    input [31:0] io_configs_in,
    input [7:0] io_configs_en,
    input [43:0] io_ipin_in,
    input [195:0] io_chanxy_in,
    output[19:0] io_chanxy_out,
    output[3:0] io_opin_out);

  wire[79:0] T0;
  wire[255:0] this_config_io_configs_out;
  wire[21:0] T1;
  wire[63:0] T2;
  wire[14:0] T3;
  wire[10:0] this_sbcb_io_ipin_out;
  wire[3:0] this_clb_io_clb_out;
  wire[3:0] T4;
  wire[63:0] T5;
  wire[15:0] this_xbar_io_xbar_out;
  wire[19:0] this_sbcb_io_chanxy_out;

  assign T0 = this_config_io_configs_out[8'he9/* 233*/:8'h9a/* 154*/];
  assign T1 = this_config_io_configs_out[8'h99/* 153*/:8'h84/* 132*/];
  assign T2 = this_config_io_configs_out[8'h83/* 131*/:7'h44/* 68*/];
  assign T3 = {this_clb_io_clb_out, this_sbcb_io_ipin_out};
  assign T4 = this_config_io_configs_out[7'h43/* 67*/:7'h40/* 64*/];
  assign T5 = this_config_io_configs_out[6'h3f/* 63*/:1'h0/* 0*/];
  assign io_opin_out = this_clb_io_clb_out;
  assign io_chanxy_out = this_sbcb_io_chanxy_out;
  clb this_clb(.clk(clk), .reset(reset),
       .io_clb_in( this_xbar_io_xbar_out ),
       .io_clb_out( this_clb_io_clb_out ),
       .io_lut_configs( T5 ),
       .io_mux_configs( T4 ),
       .io_ff_en( io_ff_en ));
  xbar this_xbar(.clk(clk), .reset(reset),
       .io_xbar_in( T3 ),
       .io_xbar_out( this_xbar_io_xbar_out ),
       .io_mux_configs( T2 ));
    configs_latches_8 this_config(.clk(clk), .reset(reset),
       .io_d_in( io_configs_in ),
       .io_configs_out( this_config_io_configs_out ),
       .io_configs_en( io_configs_en ));
  sbcb this_sbcb(
       .io_ipin_in( io_ipin_in ),
       .io_ipin_config( T1 ),
       .io_chanxy_in( io_chanxy_in ),
       .io_chanxy_config( T0 ),
       .io_ipin_out( this_sbcb_io_ipin_out ),
       .io_chanxy_out( this_sbcb_io_chanxy_out ));
endmodule

