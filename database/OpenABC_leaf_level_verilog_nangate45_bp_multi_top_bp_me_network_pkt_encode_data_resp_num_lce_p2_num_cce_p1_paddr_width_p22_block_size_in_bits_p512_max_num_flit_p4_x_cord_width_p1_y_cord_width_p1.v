module bp_me_network_pkt_encode_data_resp_num_lce_p2_num_cce_p1_paddr_width_p22_block_size_in_bits_p512_max_num_flit_p4_x_cord_width_p1_y_cord_width_p1
(
  payload_i,
  packet_o
);

  input [536:0] payload_i;
  output [540:0] packet_o;
  wire [540:0] packet_o;
  wire N0;
  assign packet_o[1] = 1'b0;
  assign packet_o[2] = packet_o[3];
  assign packet_o[540] = payload_i[536];
  assign packet_o[539] = payload_i[535];
  assign packet_o[538] = payload_i[534];
  assign packet_o[537] = payload_i[533];
  assign packet_o[536] = payload_i[532];
  assign packet_o[535] = payload_i[531];
  assign packet_o[534] = payload_i[530];
  assign packet_o[533] = payload_i[529];
  assign packet_o[532] = payload_i[528];
  assign packet_o[531] = payload_i[527];
  assign packet_o[530] = payload_i[526];
  assign packet_o[529] = payload_i[525];
  assign packet_o[528] = payload_i[524];
  assign packet_o[527] = payload_i[523];
  assign packet_o[526] = payload_i[522];
  assign packet_o[525] = payload_i[521];
  assign packet_o[524] = payload_i[520];
  assign packet_o[523] = payload_i[519];
  assign packet_o[522] = payload_i[518];
  assign packet_o[521] = payload_i[517];
  assign packet_o[520] = payload_i[516];
  assign packet_o[519] = payload_i[515];
  assign packet_o[518] = payload_i[514];
  assign packet_o[517] = payload_i[513];
  assign packet_o[516] = payload_i[512];
  assign packet_o[515] = payload_i[511];
  assign packet_o[514] = payload_i[510];
  assign packet_o[513] = payload_i[509];
  assign packet_o[512] = payload_i[508];
  assign packet_o[511] = payload_i[507];
  assign packet_o[510] = payload_i[506];
  assign packet_o[509] = payload_i[505];
  assign packet_o[508] = payload_i[504];
  assign packet_o[507] = payload_i[503];
  assign packet_o[506] = payload_i[502];
  assign packet_o[505] = payload_i[501];
  assign packet_o[504] = payload_i[500];
  assign packet_o[503] = payload_i[499];
  assign packet_o[502] = payload_i[498];
  assign packet_o[501] = payload_i[497];
  assign packet_o[500] = payload_i[496];
  assign packet_o[499] = payload_i[495];
  assign packet_o[498] = payload_i[494];
  assign packet_o[497] = payload_i[493];
  assign packet_o[496] = payload_i[492];
  assign packet_o[495] = payload_i[491];
  assign packet_o[494] = payload_i[490];
  assign packet_o[493] = payload_i[489];
  assign packet_o[492] = payload_i[488];
  assign packet_o[491] = payload_i[487];
  assign packet_o[490] = payload_i[486];
  assign packet_o[489] = payload_i[485];
  assign packet_o[488] = payload_i[484];
  assign packet_o[487] = payload_i[483];
  assign packet_o[486] = payload_i[482];
  assign packet_o[485] = payload_i[481];
  assign packet_o[484] = payload_i[480];
  assign packet_o[483] = payload_i[479];
  assign packet_o[482] = payload_i[478];
  assign packet_o[481] = payload_i[477];
  assign packet_o[480] = payload_i[476];
  assign packet_o[479] = payload_i[475];
  assign packet_o[478] = payload_i[474];
  assign packet_o[477] = payload_i[473];
  assign packet_o[476] = payload_i[472];
  assign packet_o[475] = payload_i[471];
  assign packet_o[474] = payload_i[470];
  assign packet_o[473] = payload_i[469];
  assign packet_o[472] = payload_i[468];
  assign packet_o[471] = payload_i[467];
  assign packet_o[470] = payload_i[466];
  assign packet_o[469] = payload_i[465];
  assign packet_o[468] = payload_i[464];
  assign packet_o[467] = payload_i[463];
  assign packet_o[466] = payload_i[462];
  assign packet_o[465] = payload_i[461];
  assign packet_o[464] = payload_i[460];
  assign packet_o[463] = payload_i[459];
  assign packet_o[462] = payload_i[458];
  assign packet_o[461] = payload_i[457];
  assign packet_o[460] = payload_i[456];
  assign packet_o[459] = payload_i[455];
  assign packet_o[458] = payload_i[454];
  assign packet_o[457] = payload_i[453];
  assign packet_o[456] = payload_i[452];
  assign packet_o[455] = payload_i[451];
  assign packet_o[454] = payload_i[450];
  assign packet_o[453] = payload_i[449];
  assign packet_o[452] = payload_i[448];
  assign packet_o[451] = payload_i[447];
  assign packet_o[450] = payload_i[446];
  assign packet_o[449] = payload_i[445];
  assign packet_o[448] = payload_i[444];
  assign packet_o[447] = payload_i[443];
  assign packet_o[446] = payload_i[442];
  assign packet_o[445] = payload_i[441];
  assign packet_o[444] = payload_i[440];
  assign packet_o[443] = payload_i[439];
  assign packet_o[442] = payload_i[438];
  assign packet_o[441] = payload_i[437];
  assign packet_o[440] = payload_i[436];
  assign packet_o[439] = payload_i[435];
  assign packet_o[438] = payload_i[434];
  assign packet_o[437] = payload_i[433];
  assign packet_o[436] = payload_i[432];
  assign packet_o[435] = payload_i[431];
  assign packet_o[434] = payload_i[430];
  assign packet_o[433] = payload_i[429];
  assign packet_o[432] = payload_i[428];
  assign packet_o[431] = payload_i[427];
  assign packet_o[430] = payload_i[426];
  assign packet_o[429] = payload_i[425];
  assign packet_o[428] = payload_i[424];
  assign packet_o[427] = payload_i[423];
  assign packet_o[426] = payload_i[422];
  assign packet_o[425] = payload_i[421];
  assign packet_o[424] = payload_i[420];
  assign packet_o[423] = payload_i[419];
  assign packet_o[422] = payload_i[418];
  assign packet_o[421] = payload_i[417];
  assign packet_o[420] = payload_i[416];
  assign packet_o[419] = payload_i[415];
  assign packet_o[418] = payload_i[414];
  assign packet_o[417] = payload_i[413];
  assign packet_o[416] = payload_i[412];
  assign packet_o[415] = payload_i[411];
  assign packet_o[414] = payload_i[410];
  assign packet_o[413] = payload_i[409];
  assign packet_o[412] = payload_i[408];
  assign packet_o[411] = payload_i[407];
  assign packet_o[410] = payload_i[406];
  assign packet_o[409] = payload_i[405];
  assign packet_o[408] = payload_i[404];
  assign packet_o[407] = payload_i[403];
  assign packet_o[406] = payload_i[402];
  assign packet_o[405] = payload_i[401];
  assign packet_o[404] = payload_i[400];
  assign packet_o[403] = payload_i[399];
  assign packet_o[402] = payload_i[398];
  assign packet_o[401] = payload_i[397];
  assign packet_o[400] = payload_i[396];
  assign packet_o[399] = payload_i[395];
  assign packet_o[398] = payload_i[394];
  assign packet_o[397] = payload_i[393];
  assign packet_o[396] = payload_i[392];
  assign packet_o[395] = payload_i[391];
  assign packet_o[394] = payload_i[390];
  assign packet_o[393] = payload_i[389];
  assign packet_o[392] = payload_i[388];
  assign packet_o[391] = payload_i[387];
  assign packet_o[390] = payload_i[386];
  assign packet_o[389] = payload_i[385];
  assign packet_o[388] = payload_i[384];
  assign packet_o[387] = payload_i[383];
  assign packet_o[386] = payload_i[382];
  assign packet_o[385] = payload_i[381];
  assign packet_o[384] = payload_i[380];
  assign packet_o[383] = payload_i[379];
  assign packet_o[382] = payload_i[378];
  assign packet_o[381] = payload_i[377];
  assign packet_o[380] = payload_i[376];
  assign packet_o[379] = payload_i[375];
  assign packet_o[378] = payload_i[374];
  assign packet_o[377] = payload_i[373];
  assign packet_o[376] = payload_i[372];
  assign packet_o[375] = payload_i[371];
  assign packet_o[374] = payload_i[370];
  assign packet_o[373] = payload_i[369];
  assign packet_o[372] = payload_i[368];
  assign packet_o[371] = payload_i[367];
  assign packet_o[370] = payload_i[366];
  assign packet_o[369] = payload_i[365];
  assign packet_o[368] = payload_i[364];
  assign packet_o[367] = payload_i[363];
  assign packet_o[366] = payload_i[362];
  assign packet_o[365] = payload_i[361];
  assign packet_o[364] = payload_i[360];
  assign packet_o[363] = payload_i[359];
  assign packet_o[362] = payload_i[358];
  assign packet_o[361] = payload_i[357];
  assign packet_o[360] = payload_i[356];
  assign packet_o[359] = payload_i[355];
  assign packet_o[358] = payload_i[354];
  assign packet_o[357] = payload_i[353];
  assign packet_o[356] = payload_i[352];
  assign packet_o[355] = payload_i[351];
  assign packet_o[354] = payload_i[350];
  assign packet_o[353] = payload_i[349];
  assign packet_o[352] = payload_i[348];
  assign packet_o[351] = payload_i[347];
  assign packet_o[350] = payload_i[346];
  assign packet_o[349] = payload_i[345];
  assign packet_o[348] = payload_i[344];
  assign packet_o[347] = payload_i[343];
  assign packet_o[346] = payload_i[342];
  assign packet_o[345] = payload_i[341];
  assign packet_o[344] = payload_i[340];
  assign packet_o[343] = payload_i[339];
  assign packet_o[342] = payload_i[338];
  assign packet_o[341] = payload_i[337];
  assign packet_o[340] = payload_i[336];
  assign packet_o[339] = payload_i[335];
  assign packet_o[338] = payload_i[334];
  assign packet_o[337] = payload_i[333];
  assign packet_o[336] = payload_i[332];
  assign packet_o[335] = payload_i[331];
  assign packet_o[334] = payload_i[330];
  assign packet_o[333] = payload_i[329];
  assign packet_o[332] = payload_i[328];
  assign packet_o[331] = payload_i[327];
  assign packet_o[330] = payload_i[326];
  assign packet_o[329] = payload_i[325];
  assign packet_o[328] = payload_i[324];
  assign packet_o[327] = payload_i[323];
  assign packet_o[326] = payload_i[322];
  assign packet_o[325] = payload_i[321];
  assign packet_o[324] = payload_i[320];
  assign packet_o[323] = payload_i[319];
  assign packet_o[322] = payload_i[318];
  assign packet_o[321] = payload_i[317];
  assign packet_o[320] = payload_i[316];
  assign packet_o[319] = payload_i[315];
  assign packet_o[318] = payload_i[314];
  assign packet_o[317] = payload_i[313];
  assign packet_o[316] = payload_i[312];
  assign packet_o[315] = payload_i[311];
  assign packet_o[314] = payload_i[310];
  assign packet_o[313] = payload_i[309];
  assign packet_o[312] = payload_i[308];
  assign packet_o[311] = payload_i[307];
  assign packet_o[310] = payload_i[306];
  assign packet_o[309] = payload_i[305];
  assign packet_o[308] = payload_i[304];
  assign packet_o[307] = payload_i[303];
  assign packet_o[306] = payload_i[302];
  assign packet_o[305] = payload_i[301];
  assign packet_o[304] = payload_i[300];
  assign packet_o[303] = payload_i[299];
  assign packet_o[302] = payload_i[298];
  assign packet_o[301] = payload_i[297];
  assign packet_o[300] = payload_i[296];
  assign packet_o[299] = payload_i[295];
  assign packet_o[298] = payload_i[294];
  assign packet_o[297] = payload_i[293];
  assign packet_o[296] = payload_i[292];
  assign packet_o[295] = payload_i[291];
  assign packet_o[294] = payload_i[290];
  assign packet_o[293] = payload_i[289];
  assign packet_o[292] = payload_i[288];
  assign packet_o[291] = payload_i[287];
  assign packet_o[290] = payload_i[286];
  assign packet_o[289] = payload_i[285];
  assign packet_o[288] = payload_i[284];
  assign packet_o[287] = payload_i[283];
  assign packet_o[286] = payload_i[282];
  assign packet_o[285] = payload_i[281];
  assign packet_o[284] = payload_i[280];
  assign packet_o[283] = payload_i[279];
  assign packet_o[282] = payload_i[278];
  assign packet_o[281] = payload_i[277];
  assign packet_o[280] = payload_i[276];
  assign packet_o[279] = payload_i[275];
  assign packet_o[278] = payload_i[274];
  assign packet_o[277] = payload_i[273];
  assign packet_o[276] = payload_i[272];
  assign packet_o[275] = payload_i[271];
  assign packet_o[274] = payload_i[270];
  assign packet_o[273] = payload_i[269];
  assign packet_o[272] = payload_i[268];
  assign packet_o[271] = payload_i[267];
  assign packet_o[270] = payload_i[266];
  assign packet_o[269] = payload_i[265];
  assign packet_o[268] = payload_i[264];
  assign packet_o[267] = payload_i[263];
  assign packet_o[266] = payload_i[262];
  assign packet_o[265] = payload_i[261];
  assign packet_o[264] = payload_i[260];
  assign packet_o[263] = payload_i[259];
  assign packet_o[262] = payload_i[258];
  assign packet_o[261] = payload_i[257];
  assign packet_o[260] = payload_i[256];
  assign packet_o[259] = payload_i[255];
  assign packet_o[258] = payload_i[254];
  assign packet_o[257] = payload_i[253];
  assign packet_o[256] = payload_i[252];
  assign packet_o[255] = payload_i[251];
  assign packet_o[254] = payload_i[250];
  assign packet_o[253] = payload_i[249];
  assign packet_o[252] = payload_i[248];
  assign packet_o[251] = payload_i[247];
  assign packet_o[250] = payload_i[246];
  assign packet_o[249] = payload_i[245];
  assign packet_o[248] = payload_i[244];
  assign packet_o[247] = payload_i[243];
  assign packet_o[246] = payload_i[242];
  assign packet_o[245] = payload_i[241];
  assign packet_o[244] = payload_i[240];
  assign packet_o[243] = payload_i[239];
  assign packet_o[242] = payload_i[238];
  assign packet_o[241] = payload_i[237];
  assign packet_o[240] = payload_i[236];
  assign packet_o[239] = payload_i[235];
  assign packet_o[238] = payload_i[234];
  assign packet_o[237] = payload_i[233];
  assign packet_o[236] = payload_i[232];
  assign packet_o[235] = payload_i[231];
  assign packet_o[234] = payload_i[230];
  assign packet_o[233] = payload_i[229];
  assign packet_o[232] = payload_i[228];
  assign packet_o[231] = payload_i[227];
  assign packet_o[230] = payload_i[226];
  assign packet_o[229] = payload_i[225];
  assign packet_o[228] = payload_i[224];
  assign packet_o[227] = payload_i[223];
  assign packet_o[226] = payload_i[222];
  assign packet_o[225] = payload_i[221];
  assign packet_o[224] = payload_i[220];
  assign packet_o[223] = payload_i[219];
  assign packet_o[222] = payload_i[218];
  assign packet_o[221] = payload_i[217];
  assign packet_o[220] = payload_i[216];
  assign packet_o[219] = payload_i[215];
  assign packet_o[218] = payload_i[214];
  assign packet_o[217] = payload_i[213];
  assign packet_o[216] = payload_i[212];
  assign packet_o[215] = payload_i[211];
  assign packet_o[214] = payload_i[210];
  assign packet_o[213] = payload_i[209];
  assign packet_o[212] = payload_i[208];
  assign packet_o[211] = payload_i[207];
  assign packet_o[210] = payload_i[206];
  assign packet_o[209] = payload_i[205];
  assign packet_o[208] = payload_i[204];
  assign packet_o[207] = payload_i[203];
  assign packet_o[206] = payload_i[202];
  assign packet_o[205] = payload_i[201];
  assign packet_o[204] = payload_i[200];
  assign packet_o[203] = payload_i[199];
  assign packet_o[202] = payload_i[198];
  assign packet_o[201] = payload_i[197];
  assign packet_o[200] = payload_i[196];
  assign packet_o[199] = payload_i[195];
  assign packet_o[198] = payload_i[194];
  assign packet_o[197] = payload_i[193];
  assign packet_o[196] = payload_i[192];
  assign packet_o[195] = payload_i[191];
  assign packet_o[194] = payload_i[190];
  assign packet_o[193] = payload_i[189];
  assign packet_o[192] = payload_i[188];
  assign packet_o[191] = payload_i[187];
  assign packet_o[190] = payload_i[186];
  assign packet_o[189] = payload_i[185];
  assign packet_o[188] = payload_i[184];
  assign packet_o[187] = payload_i[183];
  assign packet_o[186] = payload_i[182];
  assign packet_o[185] = payload_i[181];
  assign packet_o[184] = payload_i[180];
  assign packet_o[183] = payload_i[179];
  assign packet_o[182] = payload_i[178];
  assign packet_o[181] = payload_i[177];
  assign packet_o[180] = payload_i[176];
  assign packet_o[179] = payload_i[175];
  assign packet_o[178] = payload_i[174];
  assign packet_o[177] = payload_i[173];
  assign packet_o[176] = payload_i[172];
  assign packet_o[175] = payload_i[171];
  assign packet_o[174] = payload_i[170];
  assign packet_o[173] = payload_i[169];
  assign packet_o[172] = payload_i[168];
  assign packet_o[171] = payload_i[167];
  assign packet_o[170] = payload_i[166];
  assign packet_o[169] = payload_i[165];
  assign packet_o[168] = payload_i[164];
  assign packet_o[167] = payload_i[163];
  assign packet_o[166] = payload_i[162];
  assign packet_o[165] = payload_i[161];
  assign packet_o[164] = payload_i[160];
  assign packet_o[163] = payload_i[159];
  assign packet_o[162] = payload_i[158];
  assign packet_o[161] = payload_i[157];
  assign packet_o[160] = payload_i[156];
  assign packet_o[159] = payload_i[155];
  assign packet_o[158] = payload_i[154];
  assign packet_o[157] = payload_i[153];
  assign packet_o[156] = payload_i[152];
  assign packet_o[155] = payload_i[151];
  assign packet_o[154] = payload_i[150];
  assign packet_o[153] = payload_i[149];
  assign packet_o[152] = payload_i[148];
  assign packet_o[151] = payload_i[147];
  assign packet_o[150] = payload_i[146];
  assign packet_o[149] = payload_i[145];
  assign packet_o[148] = payload_i[144];
  assign packet_o[147] = payload_i[143];
  assign packet_o[146] = payload_i[142];
  assign packet_o[145] = payload_i[141];
  assign packet_o[144] = payload_i[140];
  assign packet_o[143] = payload_i[139];
  assign packet_o[142] = payload_i[138];
  assign packet_o[141] = payload_i[137];
  assign packet_o[140] = payload_i[136];
  assign packet_o[139] = payload_i[135];
  assign packet_o[138] = payload_i[134];
  assign packet_o[137] = payload_i[133];
  assign packet_o[136] = payload_i[132];
  assign packet_o[135] = payload_i[131];
  assign packet_o[134] = payload_i[130];
  assign packet_o[133] = payload_i[129];
  assign packet_o[132] = payload_i[128];
  assign packet_o[131] = payload_i[127];
  assign packet_o[130] = payload_i[126];
  assign packet_o[129] = payload_i[125];
  assign packet_o[128] = payload_i[124];
  assign packet_o[127] = payload_i[123];
  assign packet_o[126] = payload_i[122];
  assign packet_o[125] = payload_i[121];
  assign packet_o[124] = payload_i[120];
  assign packet_o[123] = payload_i[119];
  assign packet_o[122] = payload_i[118];
  assign packet_o[121] = payload_i[117];
  assign packet_o[120] = payload_i[116];
  assign packet_o[119] = payload_i[115];
  assign packet_o[118] = payload_i[114];
  assign packet_o[117] = payload_i[113];
  assign packet_o[116] = payload_i[112];
  assign packet_o[115] = payload_i[111];
  assign packet_o[114] = payload_i[110];
  assign packet_o[113] = payload_i[109];
  assign packet_o[112] = payload_i[108];
  assign packet_o[111] = payload_i[107];
  assign packet_o[110] = payload_i[106];
  assign packet_o[109] = payload_i[105];
  assign packet_o[108] = payload_i[104];
  assign packet_o[107] = payload_i[103];
  assign packet_o[106] = payload_i[102];
  assign packet_o[105] = payload_i[101];
  assign packet_o[104] = payload_i[100];
  assign packet_o[103] = payload_i[99];
  assign packet_o[102] = payload_i[98];
  assign packet_o[101] = payload_i[97];
  assign packet_o[100] = payload_i[96];
  assign packet_o[99] = payload_i[95];
  assign packet_o[98] = payload_i[94];
  assign packet_o[97] = payload_i[93];
  assign packet_o[96] = payload_i[92];
  assign packet_o[95] = payload_i[91];
  assign packet_o[94] = payload_i[90];
  assign packet_o[93] = payload_i[89];
  assign packet_o[92] = payload_i[88];
  assign packet_o[91] = payload_i[87];
  assign packet_o[90] = payload_i[86];
  assign packet_o[89] = payload_i[85];
  assign packet_o[88] = payload_i[84];
  assign packet_o[87] = payload_i[83];
  assign packet_o[86] = payload_i[82];
  assign packet_o[85] = payload_i[81];
  assign packet_o[84] = payload_i[80];
  assign packet_o[83] = payload_i[79];
  assign packet_o[82] = payload_i[78];
  assign packet_o[81] = payload_i[77];
  assign packet_o[80] = payload_i[76];
  assign packet_o[79] = payload_i[75];
  assign packet_o[78] = payload_i[74];
  assign packet_o[77] = payload_i[73];
  assign packet_o[76] = payload_i[72];
  assign packet_o[75] = payload_i[71];
  assign packet_o[74] = payload_i[70];
  assign packet_o[73] = payload_i[69];
  assign packet_o[72] = payload_i[68];
  assign packet_o[71] = payload_i[67];
  assign packet_o[70] = payload_i[66];
  assign packet_o[69] = payload_i[65];
  assign packet_o[68] = payload_i[64];
  assign packet_o[67] = payload_i[63];
  assign packet_o[66] = payload_i[62];
  assign packet_o[65] = payload_i[61];
  assign packet_o[64] = payload_i[60];
  assign packet_o[63] = payload_i[59];
  assign packet_o[62] = payload_i[58];
  assign packet_o[61] = payload_i[57];
  assign packet_o[60] = payload_i[56];
  assign packet_o[59] = payload_i[55];
  assign packet_o[58] = payload_i[54];
  assign packet_o[57] = payload_i[53];
  assign packet_o[56] = payload_i[52];
  assign packet_o[55] = payload_i[51];
  assign packet_o[54] = payload_i[50];
  assign packet_o[53] = payload_i[49];
  assign packet_o[52] = payload_i[48];
  assign packet_o[51] = payload_i[47];
  assign packet_o[50] = payload_i[46];
  assign packet_o[49] = payload_i[45];
  assign packet_o[48] = payload_i[44];
  assign packet_o[47] = payload_i[43];
  assign packet_o[46] = payload_i[42];
  assign packet_o[45] = payload_i[41];
  assign packet_o[44] = payload_i[40];
  assign packet_o[43] = payload_i[39];
  assign packet_o[42] = payload_i[38];
  assign packet_o[41] = payload_i[37];
  assign packet_o[40] = payload_i[36];
  assign packet_o[39] = payload_i[35];
  assign packet_o[38] = payload_i[34];
  assign packet_o[37] = payload_i[33];
  assign packet_o[36] = payload_i[32];
  assign packet_o[35] = payload_i[31];
  assign packet_o[34] = payload_i[30];
  assign packet_o[33] = payload_i[29];
  assign packet_o[32] = payload_i[28];
  assign packet_o[31] = payload_i[27];
  assign packet_o[30] = payload_i[26];
  assign packet_o[29] = payload_i[25];
  assign packet_o[0] = payload_i[24];
  assign packet_o[28] = payload_i[24];
  assign packet_o[27] = payload_i[23];
  assign packet_o[26] = payload_i[22];
  assign packet_o[25] = payload_i[21];
  assign packet_o[24] = payload_i[20];
  assign packet_o[23] = payload_i[19];
  assign packet_o[22] = payload_i[18];
  assign packet_o[21] = payload_i[17];
  assign packet_o[20] = payload_i[16];
  assign packet_o[19] = payload_i[15];
  assign packet_o[18] = payload_i[14];
  assign packet_o[17] = payload_i[13];
  assign packet_o[16] = payload_i[12];
  assign packet_o[15] = payload_i[11];
  assign packet_o[14] = payload_i[10];
  assign packet_o[13] = payload_i[9];
  assign packet_o[12] = payload_i[8];
  assign packet_o[11] = payload_i[7];
  assign packet_o[10] = payload_i[6];
  assign packet_o[9] = payload_i[5];
  assign packet_o[8] = payload_i[4];
  assign packet_o[7] = payload_i[3];
  assign packet_o[6] = payload_i[2];
  assign packet_o[5] = payload_i[1];
  assign packet_o[4] = payload_i[0];
  assign N0 = ~payload_i[22];
  assign packet_o[3] = N0;

endmodule