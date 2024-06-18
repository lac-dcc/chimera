// This program was cloned from: https://github.com/sylefeb/Silixel
// License: BSD 3-Clause "New" or "Revised" License

`define VGA 1
/*

Copyright 2019, (C) Sylvain Lefebvre and contributors
List contributors with: git shortlog -n -s -- <filename>

MIT license

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

(header_2_M)

*/
`define BARE 1
`define COLOR_DEPTH       6


module top(
`ifdef VGA
  // VGA
  output out_video_clock,
  output reg [`COLOR_DEPTH-1:0] out_video_r,
  output reg [`COLOR_DEPTH-1:0] out_video_g,
  output reg [`COLOR_DEPTH-1:0] out_video_b,
  output out_video_hs,
  output out_video_vs,
`endif
  // basic
  output [7:0] out_leds,
  input        clock
);

reg [2:0] ready = 3'b111;

always @(posedge clock) begin
  ready <= ready >> 1;
end

wire run_main;
assign run_main = 1'b1;

M_main __main(
  .clock(clock),
  .reset(ready[0]),
  .out_leds(out_leds),
`ifdef VGA
  .out_video_clock(out_video_clock),
  .out_video_r(out_video_r),
  .out_video_g(out_video_g),
  .out_video_b(out_video_b),
  .out_video_hs(out_video_hs),
  .out_video_vs(out_video_vs),
`endif
  .in_run(run_main)
);

endmodule


module M_vga__vga_driver (
out_vga_hs,
out_vga_vs,
out_active,
out_vblank,
out_vga_x,
out_vga_y,
reset,
out_clock,
clock
);
output  [0:0] out_vga_hs;
output  [0:0] out_vga_vs;
output  [0:0] out_active;
output  [0:0] out_vblank;
output  [9:0] out_vga_x;
output  [9:0] out_vga_y;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [9:0] _w_pix_x;
wire  [9:0] _w_pix_y;
wire  [0:0] _w_active_h;
wire  [0:0] _w_active_v;

reg  [9:0] _d_xcount = 0;
reg  [9:0] _q_xcount = 0;
reg  [9:0] _d_ycount = 0;
reg  [9:0] _q_ycount = 0;
reg  [0:0] _d_vga_hs;
reg  [0:0] _q_vga_hs;
reg  [0:0] _d_vga_vs;
reg  [0:0] _q_vga_vs;
reg  [0:0] _d_active;
reg  [0:0] _q_active;
reg  [0:0] _d_vblank;
reg  [0:0] _q_vblank;
reg  [9:0] _d_vga_x;
reg  [9:0] _q_vga_x;
reg  [9:0] _d_vga_y;
reg  [9:0] _q_vga_y;
assign out_vga_hs = _q_vga_hs;
assign out_vga_vs = _q_vga_vs;
assign out_active = _q_active;
assign out_vblank = _q_vblank;
assign out_vga_x = _q_vga_x;
assign out_vga_y = _q_vga_y;


assign _w_pix_x = (_q_xcount-160);
assign _w_pix_y = (_q_ycount-45);
assign _w_active_h = (_q_xcount>=160&&_q_xcount<800);
assign _w_active_v = (_q_ycount>=45&&_q_ycount<525);

`ifdef FORMAL
initial begin
assume(reset);
end
`endif
always @* begin
_d_xcount = _q_xcount;
_d_ycount = _q_ycount;
_d_vga_hs = _q_vga_hs;
_d_vga_vs = _q_vga_vs;
_d_active = _q_active;
_d_vblank = _q_vblank;
_d_vga_x = _q_vga_x;
_d_vga_y = _q_vga_y;
// _always_pre
_d_active = _w_active_h&&_w_active_v;
_d_vga_hs = ~((_q_xcount>=16&&_q_xcount<112));
_d_vga_vs = ~((_q_ycount>=10&&_q_ycount<12));
_d_vblank = (_q_ycount<45);
// __block_1
_d_vga_x = _w_active_h ? _w_pix_x:0;
_d_vga_y = _w_active_v ? _w_pix_y:0;
if (_q_xcount==799) begin
// __block_2
// __block_4
_d_xcount = 0;
if (_q_ycount==524) begin
// __block_5
// __block_7
_d_ycount = 0;
// __block_8
end else begin
// __block_6
// __block_9
_d_ycount = _q_ycount+1;
// __block_10
end
// __block_11
// __block_12
end else begin
// __block_3
// __block_13
_d_xcount = _q_xcount+1;
// __block_14
end
// __block_15
// __block_16
// _always_post
end

always @(posedge clock) begin
_q_xcount <= _d_xcount;
_q_ycount <= _d_ycount;
_q_vga_hs <= _d_vga_hs;
_q_vga_vs <= _d_vga_vs;
_q_active <= _d_active;
_q_vblank <= _d_vblank;
_q_vga_x <= _d_vga_x;
_q_vga_y <= _d_vga_y;
end

endmodule


// SL 2019, MIT license
module M_frame_display__display_mem_tbl(
input                  [10-1:0] in_tbl_addr,
output reg  [18-1:0] out_tbl_rdata,
input                                   clock
);
reg  [18-1:0] buffer[1024-1:0];
always @(posedge clock) begin
   out_tbl_rdata <= buffer[in_tbl_addr];
end
initial begin
 buffer[0] = 37312;
 buffer[1] = 37312;
 buffer[2] = 16448;
 buffer[3] = 37312;
 buffer[4] = 37312;
 buffer[5] = 37312;
 buffer[6] = 16448;
 buffer[7] = 37312;
 buffer[8] = 16448;
 buffer[9] = 37312;
 buffer[10] = 37312;
 buffer[11] = 37312;
 buffer[12] = 37312;
 buffer[13] = 37312;
 buffer[14] = 37312;
 buffer[15] = 37312;
 buffer[16] = 37312;
 buffer[17] = 16448;
 buffer[18] = 37312;
 buffer[19] = 37312;
 buffer[20] = 16448;
 buffer[21] = 37312;
 buffer[22] = 37312;
 buffer[23] = 16448;
 buffer[24] = 37312;
 buffer[25] = 37312;
 buffer[26] = 16448;
 buffer[27] = 37312;
 buffer[28] = 16448;
 buffer[29] = 37312;
 buffer[30] = 37312;
 buffer[31] = 37312;
 buffer[32] = 16448;
 buffer[33] = 37312;
 buffer[34] = 78720;
 buffer[35] = 78720;
 buffer[36] = 37312;
 buffer[37] = 37312;
 buffer[38] = 186432;
 buffer[39] = 157440;
 buffer[40] = 132544;
 buffer[41] = 78720;
 buffer[42] = 186432;
 buffer[43] = 186432;
 buffer[44] = 157440;
 buffer[45] = 132544;
 buffer[46] = 186432;
 buffer[47] = 107712;
 buffer[48] = 26304;
 buffer[49] = 78720;
 buffer[50] = 186432;
 buffer[51] = 186432;
 buffer[52] = 107712;
 buffer[53] = 186432;
 buffer[54] = 186432;
 buffer[55] = 132544;
 buffer[56] = 157440;
 buffer[57] = 37312;
 buffer[58] = 37312;
 buffer[59] = 132544;
 buffer[60] = 157440;
 buffer[61] = 186432;
 buffer[62] = 186432;
 buffer[63] = 107712;
 buffer[64] = 16448;
 buffer[65] = 78720;
 buffer[66] = 157440;
 buffer[67] = 186432;
 buffer[68] = 78720;
 buffer[69] = 49728;
 buffer[70] = 157440;
 buffer[71] = 107712;
 buffer[72] = 107712;
 buffer[73] = 107712;
 buffer[74] = 78720;
 buffer[75] = 157440;
 buffer[76] = 132544;
 buffer[77] = 107712;
 buffer[78] = 78720;
 buffer[79] = 49728;
 buffer[80] = 13824;
 buffer[81] = 157440;
 buffer[82] = 107712;
 buffer[83] = 132544;
 buffer[84] = 107712;
 buffer[85] = 107712;
 buffer[86] = 132544;
 buffer[87] = 157440;
 buffer[88] = 132544;
 buffer[89] = 132544;
 buffer[90] = 37312;
 buffer[91] = 157440;
 buffer[92] = 78720;
 buffer[93] = 107712;
 buffer[94] = 49728;
 buffer[95] = 78720;
 buffer[96] = 37312;
 buffer[97] = 132544;
 buffer[98] = 186432;
 buffer[99] = 107712;
 buffer[100] = 107712;
 buffer[101] = 78720;
 buffer[102] = 49728;
 buffer[103] = 157440;
 buffer[104] = 107712;
 buffer[105] = 132544;
 buffer[106] = 132544;
 buffer[107] = 107712;
 buffer[108] = 107712;
 buffer[109] = 132544;
 buffer[110] = 78720;
 buffer[111] = 49728;
 buffer[112] = 16448;
 buffer[113] = 84352;
 buffer[114] = 157440;
 buffer[115] = 107712;
 buffer[116] = 132544;
 buffer[117] = 78720;
 buffer[118] = 78720;
 buffer[119] = 157440;
 buffer[120] = 107712;
 buffer[121] = 78720;
 buffer[122] = 107712;
 buffer[123] = 37312;
 buffer[124] = 157440;
 buffer[125] = 107712;
 buffer[126] = 78720;
 buffer[127] = 49728;
 buffer[128] = 16448;
 buffer[129] = 186432;
 buffer[130] = 132544;
 buffer[131] = 132544;
 buffer[132] = 107712;
 buffer[133] = 78720;
 buffer[134] = 49728;
 buffer[135] = 107712;
 buffer[136] = 78720;
 buffer[137] = 107712;
 buffer[138] = 78720;
 buffer[139] = 78720;
 buffer[140] = 107712;
 buffer[141] = 78720;
 buffer[142] = 49728;
 buffer[143] = 78720;
 buffer[144] = 37312;
 buffer[145] = 34624;
 buffer[146] = 78720;
 buffer[147] = 132544;
 buffer[148] = 107712;
 buffer[149] = 78720;
 buffer[150] = 107712;
 buffer[151] = 78720;
 buffer[152] = 157440;
 buffer[153] = 107712;
 buffer[154] = 78720;
 buffer[155] = 49728;
 buffer[156] = 37312;
 buffer[157] = 157440;
 buffer[158] = 107712;
 buffer[159] = 78720;
 buffer[160] = 37312;
 buffer[161] = 186432;
 buffer[162] = 132544;
 buffer[163] = 107712;
 buffer[164] = 78720;
 buffer[165] = 107712;
 buffer[166] = 78720;
 buffer[167] = 49728;
 buffer[168] = 107712;
 buffer[169] = 49728;
 buffer[170] = 107712;
 buffer[171] = 107712;
 buffer[172] = 78720;
 buffer[173] = 78720;
 buffer[174] = 78720;
 buffer[175] = 49728;
 buffer[176] = 16448;
 buffer[177] = 13824;
 buffer[178] = 37312;
 buffer[179] = 157440;
 buffer[180] = 107712;
 buffer[181] = 107712;
 buffer[182] = 78720;
 buffer[183] = 107712;
 buffer[184] = 157440;
 buffer[185] = 132544;
 buffer[186] = 107712;
 buffer[187] = 78720;
 buffer[188] = 37312;
 buffer[189] = 157440;
 buffer[190] = 78720;
 buffer[191] = 49728;
 buffer[192] = 16448;
 buffer[193] = 132544;
 buffer[194] = 107712;
 buffer[195] = 78720;
 buffer[196] = 107712;
 buffer[197] = 132544;
 buffer[198] = 107712;
 buffer[199] = 49728;
 buffer[200] = 107712;
 buffer[201] = 78720;
 buffer[202] = 78720;
 buffer[203] = 78720;
 buffer[204] = 49728;
 buffer[205] = 78720;
 buffer[206] = 78720;
 buffer[207] = 51200;
 buffer[208] = 13824;
 buffer[209] = 34624;
 buffer[210] = 26304;
 buffer[211] = 26304;
 buffer[212] = 132544;
 buffer[213] = 78720;
 buffer[214] = 107712;
 buffer[215] = 107712;
 buffer[216] = 78720;
 buffer[217] = 107712;
 buffer[218] = 78720;
 buffer[219] = 37312;
 buffer[220] = 37312;
 buffer[221] = 78720;
 buffer[222] = 49728;
 buffer[223] = 49728;
 buffer[224] = 37312;
 buffer[225] = 157440;
 buffer[226] = 78720;
 buffer[227] = 26304;
 buffer[228] = 67776;
 buffer[229] = 51200;
 buffer[230] = 67776;
 buffer[231] = 51200;
 buffer[232] = 34624;
 buffer[233] = 34624;
 buffer[234] = 78720;
 buffer[235] = 49728;
 buffer[236] = 78720;
 buffer[237] = 51200;
 buffer[238] = 51200;
 buffer[239] = 34624;
 buffer[240] = 37312;
 buffer[241] = 49728;
 buffer[242] = 49728;
 buffer[243] = 13824;
 buffer[244] = 26304;
 buffer[245] = 132544;
 buffer[246] = 157440;
 buffer[247] = 78720;
 buffer[248] = 78720;
 buffer[249] = 49728;
 buffer[250] = 37312;
 buffer[251] = 49728;
 buffer[252] = 16448;
 buffer[253] = 49728;
 buffer[254] = 78720;
 buffer[255] = 37312;
 buffer[256] = 37312;
 buffer[257] = 16448;
 buffer[258] = 16448;
 buffer[259] = 37312;
 buffer[260] = 16448;
 buffer[261] = 37312;
 buffer[262] = 37312;
 buffer[263] = 37312;
 buffer[264] = 16448;
 buffer[265] = 37312;
 buffer[266] = 13824;
 buffer[267] = 26304;
 buffer[268] = 13824;
 buffer[269] = 13824;
 buffer[270] = 16448;
 buffer[271] = 37312;
 buffer[272] = 49728;
 buffer[273] = 16448;
 buffer[274] = 37312;
 buffer[275] = 37312;
 buffer[276] = 34624;
 buffer[277] = 34624;
 buffer[278] = 16448;
 buffer[279] = 107712;
 buffer[280] = 37312;
 buffer[281] = 16448;
 buffer[282] = 37312;
 buffer[283] = 37312;
 buffer[284] = 16448;
 buffer[285] = 37312;
 buffer[286] = 37312;
 buffer[287] = 37312;
 buffer[288] = 186432;
 buffer[289] = 157440;
 buffer[290] = 107712;
 buffer[291] = 157440;
 buffer[292] = 132544;
 buffer[293] = 132544;
 buffer[294] = 157440;
 buffer[295] = 49728;
 buffer[296] = 16448;
 buffer[297] = 37312;
 buffer[298] = 26304;
 buffer[299] = 37312;
 buffer[300] = 78720;
 buffer[301] = 49728;
 buffer[302] = 78720;
 buffer[303] = 49728;
 buffer[304] = 49728;
 buffer[305] = 16448;
 buffer[306] = 49728;
 buffer[307] = 107712;
 buffer[308] = 132544;
 buffer[309] = 51200;
 buffer[310] = 49728;
 buffer[311] = 49728;
 buffer[312] = 37312;
 buffer[313] = 37312;
 buffer[314] = 132544;
 buffer[315] = 157440;
 buffer[316] = 107712;
 buffer[317] = 132544;
 buffer[318] = 107712;
 buffer[319] = 107712;
 buffer[320] = 107712;
 buffer[321] = 132544;
 buffer[322] = 107712;
 buffer[323] = 107712;
 buffer[324] = 132544;
 buffer[325] = 107712;
 buffer[326] = 107712;
 buffer[327] = 51200;
 buffer[328] = 26304;
 buffer[329] = 13824;
 buffer[330] = 26304;
 buffer[331] = 132544;
 buffer[332] = 107712;
 buffer[333] = 78720;
 buffer[334] = 107712;
 buffer[335] = 132544;
 buffer[336] = 78720;
 buffer[337] = 16448;
 buffer[338] = 132544;
 buffer[339] = 107712;
 buffer[340] = 132544;
 buffer[341] = 67776;
 buffer[342] = 107712;
 buffer[343] = 49728;
 buffer[344] = 16448;
 buffer[345] = 157440;
 buffer[346] = 107712;
 buffer[347] = 132544;
 buffer[348] = 132544;
 buffer[349] = 107712;
 buffer[350] = 132544;
 buffer[351] = 132544;
 buffer[352] = 78720;
 buffer[353] = 78720;
 buffer[354] = 132544;
 buffer[355] = 132544;
 buffer[356] = 107712;
 buffer[357] = 78720;
 buffer[358] = 107712;
 buffer[359] = 34624;
 buffer[360] = 37312;
 buffer[361] = 37312;
 buffer[362] = 107712;
 buffer[363] = 132544;
 buffer[364] = 107712;
 buffer[365] = 132544;
 buffer[366] = 78720;
 buffer[367] = 107712;
 buffer[368] = 78720;
 buffer[369] = 49728;
 buffer[370] = 132544;
 buffer[371] = 78720;
 buffer[372] = 107712;
 buffer[373] = 67776;
 buffer[374] = 78720;
 buffer[375] = 78720;
 buffer[376] = 37312;
 buffer[377] = 107712;
 buffer[378] = 132544;
 buffer[379] = 107712;
 buffer[380] = 107712;
 buffer[381] = 132544;
 buffer[382] = 107712;
 buffer[383] = 107712;
 buffer[384] = 78720;
 buffer[385] = 107712;
 buffer[386] = 132544;
 buffer[387] = 107712;
 buffer[388] = 107712;
 buffer[389] = 107712;
 buffer[390] = 34624;
 buffer[391] = 51200;
 buffer[392] = 37312;
 buffer[393] = 37312;
 buffer[394] = 157440;
 buffer[395] = 107712;
 buffer[396] = 107712;
 buffer[397] = 107712;
 buffer[398] = 78720;
 buffer[399] = 107712;
 buffer[400] = 78720;
 buffer[401] = 78720;
 buffer[402] = 49728;
 buffer[403] = 107712;
 buffer[404] = 107712;
 buffer[405] = 51200;
 buffer[406] = 107712;
 buffer[407] = 49728;
 buffer[408] = 16448;
 buffer[409] = 157440;
 buffer[410] = 107712;
 buffer[411] = 78720;
 buffer[412] = 107712;
 buffer[413] = 78720;
 buffer[414] = 107712;
 buffer[415] = 132544;
 buffer[416] = 78720;
 buffer[417] = 78720;
 buffer[418] = 107712;
 buffer[419] = 78720;
 buffer[420] = 78720;
 buffer[421] = 49728;
 buffer[422] = 51200;
 buffer[423] = 49728;
 buffer[424] = 37312;
 buffer[425] = 157440;
 buffer[426] = 107712;
 buffer[427] = 78720;
 buffer[428] = 107712;
 buffer[429] = 78720;
 buffer[430] = 107712;
 buffer[431] = 78720;
 buffer[432] = 78720;
 buffer[433] = 107712;
 buffer[434] = 107712;
 buffer[435] = 78720;
 buffer[436] = 78720;
 buffer[437] = 67776;
 buffer[438] = 51200;
 buffer[439] = 78720;
 buffer[440] = 37312;
 buffer[441] = 107712;
 buffer[442] = 78720;
 buffer[443] = 78720;
 buffer[444] = 78720;
 buffer[445] = 107712;
 buffer[446] = 107712;
 buffer[447] = 78720;
 buffer[448] = 49728;
 buffer[449] = 107712;
 buffer[450] = 107712;
 buffer[451] = 107712;
 buffer[452] = 78720;
 buffer[453] = 51200;
 buffer[454] = 49728;
 buffer[455] = 49728;
 buffer[456] = 16448;
 buffer[457] = 132544;
 buffer[458] = 107712;
 buffer[459] = 107712;
 buffer[460] = 78720;
 buffer[461] = 107712;
 buffer[462] = 78720;
 buffer[463] = 107712;
 buffer[464] = 107712;
 buffer[465] = 49728;
 buffer[466] = 78720;
 buffer[467] = 107712;
 buffer[468] = 51200;
 buffer[469] = 51200;
 buffer[470] = 34624;
 buffer[471] = 34624;
 buffer[472] = 37312;
 buffer[473] = 78720;
 buffer[474] = 107712;
 buffer[475] = 78720;
 buffer[476] = 107712;
 buffer[477] = 107712;
 buffer[478] = 78720;
 buffer[479] = 78720;
 buffer[480] = 78720;
 buffer[481] = 49728;
 buffer[482] = 78720;
 buffer[483] = 78720;
 buffer[484] = 49728;
 buffer[485] = 34624;
 buffer[486] = 78720;
 buffer[487] = 49728;
 buffer[488] = 37312;
 buffer[489] = 107712;
 buffer[490] = 78720;
 buffer[491] = 78720;
 buffer[492] = 78720;
 buffer[493] = 78720;
 buffer[494] = 49728;
 buffer[495] = 78720;
 buffer[496] = 78720;
 buffer[497] = 49728;
 buffer[498] = 78720;
 buffer[499] = 49728;
 buffer[500] = 51200;
 buffer[501] = 49728;
 buffer[502] = 78720;
 buffer[503] = 78720;
 buffer[504] = 26304;
 buffer[505] = 49728;
 buffer[506] = 78720;
 buffer[507] = 78720;
 buffer[508] = 49728;
 buffer[509] = 78720;
 buffer[510] = 78720;
 buffer[511] = 49728;
 buffer[512] = 37312;
 buffer[513] = 37312;
 buffer[514] = 37312;
 buffer[515] = 37312;
 buffer[516] = 13824;
 buffer[517] = 37312;
 buffer[518] = 16448;
 buffer[519] = 37312;
 buffer[520] = 16448;
 buffer[521] = 37312;
 buffer[522] = 37312;
 buffer[523] = 16448;
 buffer[524] = 16448;
 buffer[525] = 37312;
 buffer[526] = 16448;
 buffer[527] = 37312;
 buffer[528] = 37312;
 buffer[529] = 37312;
 buffer[530] = 16448;
 buffer[531] = 26304;
 buffer[532] = 13824;
 buffer[533] = 37312;
 buffer[534] = 37312;
 buffer[535] = 37312;
 buffer[536] = 37312;
 buffer[537] = 26304;
 buffer[538] = 16448;
 buffer[539] = 37312;
 buffer[540] = 16448;
 buffer[541] = 37312;
 buffer[542] = 37312;
 buffer[543] = 37312;
 buffer[544] = 37312;
 buffer[545] = 49728;
 buffer[546] = 84352;
 buffer[547] = 67776;
 buffer[548] = 157440;
 buffer[549] = 157440;
 buffer[550] = 107712;
 buffer[551] = 132544;
 buffer[552] = 157440;
 buffer[553] = 157440;
 buffer[554] = 132544;
 buffer[555] = 157440;
 buffer[556] = 107712;
 buffer[557] = 37312;
 buffer[558] = 37312;
 buffer[559] = 37312;
 buffer[560] = 16448;
 buffer[561] = 49728;
 buffer[562] = 84352;
 buffer[563] = 100928;
 buffer[564] = 107712;
 buffer[565] = 132544;
 buffer[566] = 132544;
 buffer[567] = 157440;
 buffer[568] = 157440;
 buffer[569] = 84352;
 buffer[570] = 107712;
 buffer[571] = 78720;
 buffer[572] = 49728;
 buffer[573] = 37312;
 buffer[574] = 107712;
 buffer[575] = 132544;
 buffer[576] = 16448;
 buffer[577] = 132544;
 buffer[578] = 100928;
 buffer[579] = 107712;
 buffer[580] = 132544;
 buffer[581] = 78720;
 buffer[582] = 107712;
 buffer[583] = 157440;
 buffer[584] = 107712;
 buffer[585] = 132544;
 buffer[586] = 107712;
 buffer[587] = 132544;
 buffer[588] = 107712;
 buffer[589] = 132544;
 buffer[590] = 37312;
 buffer[591] = 37312;
 buffer[592] = 37312;
 buffer[593] = 100928;
 buffer[594] = 132544;
 buffer[595] = 107712;
 buffer[596] = 132544;
 buffer[597] = 107712;
 buffer[598] = 157440;
 buffer[599] = 107712;
 buffer[600] = 132544;
 buffer[601] = 67776;
 buffer[602] = 132544;
 buffer[603] = 132544;
 buffer[604] = 37312;
 buffer[605] = 132544;
 buffer[606] = 78720;
 buffer[607] = 107712;
 buffer[608] = 37312;
 buffer[609] = 186432;
 buffer[610] = 67776;
 buffer[611] = 107712;
 buffer[612] = 132544;
 buffer[613] = 107712;
 buffer[614] = 78720;
 buffer[615] = 107712;
 buffer[616] = 78720;
 buffer[617] = 78720;
 buffer[618] = 132544;
 buffer[619] = 107712;
 buffer[620] = 132544;
 buffer[621] = 107712;
 buffer[622] = 78720;
 buffer[623] = 37312;
 buffer[624] = 37312;
 buffer[625] = 84352;
 buffer[626] = 107712;
 buffer[627] = 107712;
 buffer[628] = 107712;
 buffer[629] = 78720;
 buffer[630] = 132544;
 buffer[631] = 107712;
 buffer[632] = 132544;
 buffer[633] = 107712;
 buffer[634] = 51200;
 buffer[635] = 51200;
 buffer[636] = 37312;
 buffer[637] = 132544;
 buffer[638] = 107712;
 buffer[639] = 78720;
 buffer[640] = 16448;
 buffer[641] = 186432;
 buffer[642] = 78720;
 buffer[643] = 132544;
 buffer[644] = 107712;
 buffer[645] = 78720;
 buffer[646] = 132544;
 buffer[647] = 78720;
 buffer[648] = 78720;
 buffer[649] = 107712;
 buffer[650] = 107712;
 buffer[651] = 78720;
 buffer[652] = 49728;
 buffer[653] = 78720;
 buffer[654] = 78720;
 buffer[655] = 37312;
 buffer[656] = 37312;
 buffer[657] = 100928;
 buffer[658] = 132544;
 buffer[659] = 132544;
 buffer[660] = 78720;
 buffer[661] = 107712;
 buffer[662] = 107712;
 buffer[663] = 78720;
 buffer[664] = 78720;
 buffer[665] = 107712;
 buffer[666] = 78720;
 buffer[667] = 34624;
 buffer[668] = 37312;
 buffer[669] = 107712;
 buffer[670] = 78720;
 buffer[671] = 78720;
 buffer[672] = 37312;
 buffer[673] = 78720;
 buffer[674] = 132544;
 buffer[675] = 107712;
 buffer[676] = 78720;
 buffer[677] = 49728;
 buffer[678] = 78720;
 buffer[679] = 107712;
 buffer[680] = 107712;
 buffer[681] = 78720;
 buffer[682] = 78720;
 buffer[683] = 49728;
 buffer[684] = 78720;
 buffer[685] = 49728;
 buffer[686] = 49728;
 buffer[687] = 78720;
 buffer[688] = 16448;
 buffer[689] = 84352;
 buffer[690] = 107712;
 buffer[691] = 107712;
 buffer[692] = 78720;
 buffer[693] = 107712;
 buffer[694] = 78720;
 buffer[695] = 107712;
 buffer[696] = 78720;
 buffer[697] = 78720;
 buffer[698] = 37312;
 buffer[699] = 26304;
 buffer[700] = 132544;
 buffer[701] = 78720;
 buffer[702] = 49728;
 buffer[703] = 49728;
 buffer[704] = 37312;
 buffer[705] = 49728;
 buffer[706] = 132544;
 buffer[707] = 132544;
 buffer[708] = 107712;
 buffer[709] = 107712;
 buffer[710] = 78720;
 buffer[711] = 49728;
 buffer[712] = 78720;
 buffer[713] = 78720;
 buffer[714] = 37312;
 buffer[715] = 78720;
 buffer[716] = 49728;
 buffer[717] = 78720;
 buffer[718] = 78720;
 buffer[719] = 49728;
 buffer[720] = 16448;
 buffer[721] = 157440;
 buffer[722] = 67776;
 buffer[723] = 78720;
 buffer[724] = 78720;
 buffer[725] = 78720;
 buffer[726] = 78720;
 buffer[727] = 78720;
 buffer[728] = 49728;
 buffer[729] = 37312;
 buffer[730] = 132544;
 buffer[731] = 107712;
 buffer[732] = 78720;
 buffer[733] = 49728;
 buffer[734] = 78720;
 buffer[735] = 78720;
 buffer[736] = 16448;
 buffer[737] = 37312;
 buffer[738] = 49728;
 buffer[739] = 78720;
 buffer[740] = 132544;
 buffer[741] = 78720;
 buffer[742] = 107712;
 buffer[743] = 78720;
 buffer[744] = 49728;
 buffer[745] = 37312;
 buffer[746] = 16448;
 buffer[747] = 49728;
 buffer[748] = 78720;
 buffer[749] = 78720;
 buffer[750] = 49728;
 buffer[751] = 49728;
 buffer[752] = 16448;
 buffer[753] = 78720;
 buffer[754] = 51200;
 buffer[755] = 78720;
 buffer[756] = 107712;
 buffer[757] = 107712;
 buffer[758] = 49728;
 buffer[759] = 37312;
 buffer[760] = 37312;
 buffer[761] = 16448;
 buffer[762] = 107712;
 buffer[763] = 49728;
 buffer[764] = 78720;
 buffer[765] = 49728;
 buffer[766] = 49728;
 buffer[767] = 49728;
 buffer[768] = 37312;
 buffer[769] = 16448;
 buffer[770] = 16448;
 buffer[771] = 37312;
 buffer[772] = 16448;
 buffer[773] = 37312;
 buffer[774] = 16448;
 buffer[775] = 37312;
 buffer[776] = 37312;
 buffer[777] = 37312;
 buffer[778] = 16448;
 buffer[779] = 16448;
 buffer[780] = 37312;
 buffer[781] = 16448;
 buffer[782] = 37312;
 buffer[783] = 37312;
 buffer[784] = 37312;
 buffer[785] = 37312;
 buffer[786] = 13824;
 buffer[787] = 26304;
 buffer[788] = 16448;
 buffer[789] = 37312;
 buffer[790] = 16448;
 buffer[791] = 16448;
 buffer[792] = 37312;
 buffer[793] = 16448;
 buffer[794] = 16448;
 buffer[795] = 16448;
 buffer[796] = 16448;
 buffer[797] = 37312;
 buffer[798] = 37312;
 buffer[799] = 37312;
 buffer[800] = 186432;
 buffer[801] = 107712;
 buffer[802] = 16448;
 buffer[803] = 132544;
 buffer[804] = 157440;
 buffer[805] = 132544;
 buffer[806] = 157440;
 buffer[807] = 49728;
 buffer[808] = 16448;
 buffer[809] = 49728;
 buffer[810] = 107712;
 buffer[811] = 132544;
 buffer[812] = 157440;
 buffer[813] = 132544;
 buffer[814] = 16448;
 buffer[815] = 49728;
 buffer[816] = 132544;
 buffer[817] = 100928;
 buffer[818] = 100928;
 buffer[819] = 107712;
 buffer[820] = 157440;
 buffer[821] = 107712;
 buffer[822] = 49728;
 buffer[823] = 49728;
 buffer[824] = 37312;
 buffer[825] = 37312;
 buffer[826] = 37312;
 buffer[827] = 37312;
 buffer[828] = 157440;
 buffer[829] = 132544;
 buffer[830] = 107712;
 buffer[831] = 157440;
 buffer[832] = 107712;
 buffer[833] = 78720;
 buffer[834] = 16448;
 buffer[835] = 157440;
 buffer[836] = 107712;
 buffer[837] = 107712;
 buffer[838] = 107712;
 buffer[839] = 107712;
 buffer[840] = 16448;
 buffer[841] = 132544;
 buffer[842] = 132544;
 buffer[843] = 107712;
 buffer[844] = 132544;
 buffer[845] = 67776;
 buffer[846] = 67776;
 buffer[847] = 13824;
 buffer[848] = 34624;
 buffer[849] = 67776;
 buffer[850] = 78720;
 buffer[851] = 107712;
 buffer[852] = 107712;
 buffer[853] = 132544;
 buffer[854] = 107712;
 buffer[855] = 49728;
 buffer[856] = 16448;
 buffer[857] = 37312;
 buffer[858] = 37312;
 buffer[859] = 107712;
 buffer[860] = 132544;
 buffer[861] = 107712;
 buffer[862] = 132544;
 buffer[863] = 132544;
 buffer[864] = 132544;
 buffer[865] = 107712;
 buffer[866] = 16448;
 buffer[867] = 49728;
 buffer[868] = 157440;
 buffer[869] = 107712;
 buffer[870] = 78720;
 buffer[871] = 78720;
 buffer[872] = 37312;
 buffer[873] = 157440;
 buffer[874] = 132544;
 buffer[875] = 84352;
 buffer[876] = 67776;
 buffer[877] = 107712;
 buffer[878] = 132544;
 buffer[879] = 107712;
 buffer[880] = 49728;
 buffer[881] = 157440;
 buffer[882] = 78720;
 buffer[883] = 78720;
 buffer[884] = 78720;
 buffer[885] = 107712;
 buffer[886] = 78720;
 buffer[887] = 49728;
 buffer[888] = 37312;
 buffer[889] = 37312;
 buffer[890] = 107712;
 buffer[891] = 132544;
 buffer[892] = 107712;
 buffer[893] = 132544;
 buffer[894] = 107712;
 buffer[895] = 78720;
 buffer[896] = 107712;
 buffer[897] = 132544;
 buffer[898] = 49728;
 buffer[899] = 16448;
 buffer[900] = 132544;
 buffer[901] = 78720;
 buffer[902] = 49728;
 buffer[903] = 49728;
 buffer[904] = 16448;
 buffer[905] = 132544;
 buffer[906] = 107712;
 buffer[907] = 84352;
 buffer[908] = 107712;
 buffer[909] = 78720;
 buffer[910] = 107712;
 buffer[911] = 78720;
 buffer[912] = 49728;
 buffer[913] = 107712;
 buffer[914] = 78720;
 buffer[915] = 107712;
 buffer[916] = 78720;
 buffer[917] = 78720;
 buffer[918] = 78720;
 buffer[919] = 78720;
 buffer[920] = 16448;
 buffer[921] = 157440;
 buffer[922] = 132544;
 buffer[923] = 107712;
 buffer[924] = 78720;
 buffer[925] = 107712;
 buffer[926] = 78720;
 buffer[927] = 107712;
 buffer[928] = 132544;
 buffer[929] = 107712;
 buffer[930] = 78720;
 buffer[931] = 16448;
 buffer[932] = 132544;
 buffer[933] = 78720;
 buffer[934] = 49728;
 buffer[935] = 78720;
 buffer[936] = 37312;
 buffer[937] = 157440;
 buffer[938] = 107712;
 buffer[939] = 67776;
 buffer[940] = 132544;
 buffer[941] = 78720;
 buffer[942] = 78720;
 buffer[943] = 49728;
 buffer[944] = 107712;
 buffer[945] = 78720;
 buffer[946] = 107712;
 buffer[947] = 78720;
 buffer[948] = 78720;
 buffer[949] = 107712;
 buffer[950] = 49728;
 buffer[951] = 37312;
 buffer[952] = 37312;
 buffer[953] = 157440;
 buffer[954] = 78720;
 buffer[955] = 78720;
 buffer[956] = 132544;
 buffer[957] = 78720;
 buffer[958] = 107712;
 buffer[959] = 78720;
 buffer[960] = 78720;
 buffer[961] = 107712;
 buffer[962] = 49728;
 buffer[963] = 16448;
 buffer[964] = 49728;
 buffer[965] = 107712;
 buffer[966] = 78720;
 buffer[967] = 49728;
 buffer[968] = 37312;
 buffer[969] = 132544;
 buffer[970] = 107712;
 buffer[971] = 51200;
 buffer[972] = 51200;
 buffer[973] = 78720;
 buffer[974] = 78720;
 buffer[975] = 37312;
 buffer[976] = 107712;
 buffer[977] = 78720;
 buffer[978] = 78720;
 buffer[979] = 37312;
 buffer[980] = 49728;
 buffer[981] = 78720;
 buffer[982] = 37312;
 buffer[983] = 49728;
 buffer[984] = 37312;
 buffer[985] = 107712;
 buffer[986] = 78720;
 buffer[987] = 78720;
 buffer[988] = 107712;
 buffer[989] = 49728;
 buffer[990] = 78720;
 buffer[991] = 37312;
 buffer[992] = 78720;
 buffer[993] = 49728;
 buffer[994] = 49728;
 buffer[995] = 16448;
 buffer[996] = 16448;
 buffer[997] = 107712;
 buffer[998] = 49728;
 buffer[999] = 78720;
 buffer[1000] = 16448;
 buffer[1001] = 107712;
 buffer[1002] = 78720;
 buffer[1003] = 49728;
 buffer[1004] = 34624;
 buffer[1005] = 49728;
 buffer[1006] = 37312;
 buffer[1007] = 37312;
 buffer[1008] = 78720;
 buffer[1009] = 49728;
 buffer[1010] = 37312;
 buffer[1011] = 49728;
 buffer[1012] = 78720;
 buffer[1013] = 49728;
 buffer[1014] = 49728;
 buffer[1015] = 78720;
 buffer[1016] = 37312;
 buffer[1017] = 49728;
 buffer[1018] = 78720;
 buffer[1019] = 107712;
 buffer[1020] = 49728;
 buffer[1021] = 49728;
 buffer[1022] = 49728;
 buffer[1023] = 37312;
end

endmodule

// SL 2019, MIT license
module M_frame_display__display_mem_cosine(
input                  [8-1:0] in_cosine_addr,
output reg signed [10-1:0] out_cosine_rdata,
input                                   clock
);
reg signed [10-1:0] buffer[256-1:0];
always @(posedge clock) begin
   out_cosine_rdata <= buffer[in_cosine_addr];
end
initial begin
 buffer[0] = 511;
 buffer[1] = 510;
 buffer[2] = 510;
 buffer[3] = 509;
 buffer[4] = 508;
 buffer[5] = 507;
 buffer[6] = 505;
 buffer[7] = 503;
 buffer[8] = 501;
 buffer[9] = 498;
 buffer[10] = 495;
 buffer[11] = 492;
 buffer[12] = 488;
 buffer[13] = 485;
 buffer[14] = 480;
 buffer[15] = 476;
 buffer[16] = 471;
 buffer[17] = 466;
 buffer[18] = 461;
 buffer[19] = 456;
 buffer[20] = 450;
 buffer[21] = 444;
 buffer[22] = 437;
 buffer[23] = 431;
 buffer[24] = 424;
 buffer[25] = 417;
 buffer[26] = 409;
 buffer[27] = 402;
 buffer[28] = 394;
 buffer[29] = 386;
 buffer[30] = 377;
 buffer[31] = 369;
 buffer[32] = 360;
 buffer[33] = 351;
 buffer[34] = 341;
 buffer[35] = 332;
 buffer[36] = 322;
 buffer[37] = 312;
 buffer[38] = 302;
 buffer[39] = 292;
 buffer[40] = 282;
 buffer[41] = 271;
 buffer[42] = 260;
 buffer[43] = 250;
 buffer[44] = 238;
 buffer[45] = 227;
 buffer[46] = 216;
 buffer[47] = 204;
 buffer[48] = 193;
 buffer[49] = 181;
 buffer[50] = 169;
 buffer[51] = 157;
 buffer[52] = 145;
 buffer[53] = 133;
 buffer[54] = 121;
 buffer[55] = 109;
 buffer[56] = 96;
 buffer[57] = 84;
 buffer[58] = 72;
 buffer[59] = 59;
 buffer[60] = 47;
 buffer[61] = 34;
 buffer[62] = 22;
 buffer[63] = 9;
 buffer[64] = -4;
 buffer[65] = -16;
 buffer[66] = -29;
 buffer[67] = -41;
 buffer[68] = -54;
 buffer[69] = -66;
 buffer[70] = -79;
 buffer[71] = -91;
 buffer[72] = -104;
 buffer[73] = -116;
 buffer[74] = -128;
 buffer[75] = -140;
 buffer[76] = -152;
 buffer[77] = -164;
 buffer[78] = -176;
 buffer[79] = -188;
 buffer[80] = -200;
 buffer[81] = -211;
 buffer[82] = -223;
 buffer[83] = -234;
 buffer[84] = -245;
 buffer[85] = -256;
 buffer[86] = -267;
 buffer[87] = -277;
 buffer[88] = -288;
 buffer[89] = -298;
 buffer[90] = -308;
 buffer[91] = -318;
 buffer[92] = -328;
 buffer[93] = -338;
 buffer[94] = -347;
 buffer[95] = -356;
 buffer[96] = -365;
 buffer[97] = -374;
 buffer[98] = -382;
 buffer[99] = -391;
 buffer[100] = -399;
 buffer[101] = -406;
 buffer[102] = -414;
 buffer[103] = -421;
 buffer[104] = -428;
 buffer[105] = -435;
 buffer[106] = -441;
 buffer[107] = -448;
 buffer[108] = -454;
 buffer[109] = -459;
 buffer[110] = -465;
 buffer[111] = -470;
 buffer[112] = -475;
 buffer[113] = -479;
 buffer[114] = -483;
 buffer[115] = -487;
 buffer[116] = -491;
 buffer[117] = -494;
 buffer[118] = -498;
 buffer[119] = -500;
 buffer[120] = -503;
 buffer[121] = -505;
 buffer[122] = -507;
 buffer[123] = -508;
 buffer[124] = -510;
 buffer[125] = -511;
 buffer[126] = -511;
 buffer[127] = -511;
 buffer[128] = -511;
 buffer[129] = -511;
 buffer[130] = -511;
 buffer[131] = -510;
 buffer[132] = -508;
 buffer[133] = -507;
 buffer[134] = -505;
 buffer[135] = -503;
 buffer[136] = -500;
 buffer[137] = -498;
 buffer[138] = -494;
 buffer[139] = -491;
 buffer[140] = -487;
 buffer[141] = -483;
 buffer[142] = -479;
 buffer[143] = -475;
 buffer[144] = -470;
 buffer[145] = -465;
 buffer[146] = -459;
 buffer[147] = -454;
 buffer[148] = -448;
 buffer[149] = -441;
 buffer[150] = -435;
 buffer[151] = -428;
 buffer[152] = -421;
 buffer[153] = -414;
 buffer[154] = -406;
 buffer[155] = -399;
 buffer[156] = -391;
 buffer[157] = -382;
 buffer[158] = -374;
 buffer[159] = -365;
 buffer[160] = -356;
 buffer[161] = -347;
 buffer[162] = -338;
 buffer[163] = -328;
 buffer[164] = -318;
 buffer[165] = -308;
 buffer[166] = -298;
 buffer[167] = -288;
 buffer[168] = -277;
 buffer[169] = -267;
 buffer[170] = -256;
 buffer[171] = -245;
 buffer[172] = -234;
 buffer[173] = -223;
 buffer[174] = -211;
 buffer[175] = -200;
 buffer[176] = -188;
 buffer[177] = -176;
 buffer[178] = -164;
 buffer[179] = -152;
 buffer[180] = -140;
 buffer[181] = -128;
 buffer[182] = -116;
 buffer[183] = -104;
 buffer[184] = -91;
 buffer[185] = -79;
 buffer[186] = -66;
 buffer[187] = -54;
 buffer[188] = -41;
 buffer[189] = -29;
 buffer[190] = -16;
 buffer[191] = -4;
 buffer[192] = 9;
 buffer[193] = 22;
 buffer[194] = 34;
 buffer[195] = 47;
 buffer[196] = 59;
 buffer[197] = 72;
 buffer[198] = 84;
 buffer[199] = 96;
 buffer[200] = 109;
 buffer[201] = 121;
 buffer[202] = 133;
 buffer[203] = 145;
 buffer[204] = 157;
 buffer[205] = 169;
 buffer[206] = 181;
 buffer[207] = 193;
 buffer[208] = 204;
 buffer[209] = 216;
 buffer[210] = 227;
 buffer[211] = 238;
 buffer[212] = 250;
 buffer[213] = 260;
 buffer[214] = 271;
 buffer[215] = 282;
 buffer[216] = 292;
 buffer[217] = 302;
 buffer[218] = 312;
 buffer[219] = 322;
 buffer[220] = 332;
 buffer[221] = 341;
 buffer[222] = 351;
 buffer[223] = 360;
 buffer[224] = 369;
 buffer[225] = 377;
 buffer[226] = 386;
 buffer[227] = 394;
 buffer[228] = 402;
 buffer[229] = 409;
 buffer[230] = 417;
 buffer[231] = 424;
 buffer[232] = 431;
 buffer[233] = 437;
 buffer[234] = 444;
 buffer[235] = 450;
 buffer[236] = 456;
 buffer[237] = 461;
 buffer[238] = 466;
 buffer[239] = 471;
 buffer[240] = 476;
 buffer[241] = 480;
 buffer[242] = 485;
 buffer[243] = 488;
 buffer[244] = 492;
 buffer[245] = 495;
 buffer[246] = 498;
 buffer[247] = 501;
 buffer[248] = 503;
 buffer[249] = 505;
 buffer[250] = 507;
 buffer[251] = 508;
 buffer[252] = 509;
 buffer[253] = 510;
 buffer[254] = 510;
 buffer[255] = 511;
end

endmodule

module M_frame_display__display (
in_pix_x,
in_pix_y,
in_pix_active,
in_pix_vblank,
out_pix_r,
out_pix_g,
out_pix_b,
out_done,
reset,
out_clock,
clock
);
input  [9:0] in_pix_x;
input  [9:0] in_pix_y;
input  [0:0] in_pix_active;
input  [0:0] in_pix_vblank;
output  [5:0] out_pix_r;
output  [5:0] out_pix_g;
output  [5:0] out_pix_b;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [17:0] _w_mem_tbl_rdata;
wire signed [9:0] _w_mem_cosine_rdata;
wire signed [19:0] _c_cornerx;
assign _c_cornerx = 320;
wire signed [19:0] _c_cornery;
assign _c_cornery = 240;
reg signed [19:0] _t_sin;
reg  [5:0] _t_pix_r;
reg  [5:0] _t_pix_g;
reg  [5:0] _t_pix_b;

reg  [7:0] _d_frame;
reg  [7:0] _q_frame;
reg  [7:0] _d_angle;
reg  [7:0] _q_angle;
reg signed [19:0] _d_u;
reg signed [19:0] _q_u;
reg signed [19:0] _d_v;
reg signed [19:0] _q_v;
reg signed [19:0] _d_cos;
reg signed [19:0] _q_cos;
reg signed [19:0] _d_corneru;
reg signed [19:0] _q_corneru;
reg signed [19:0] _d_cornerv;
reg signed [19:0] _q_cornerv;
reg signed [19:0] _d_deltau_x;
reg signed [19:0] _q_deltau_x;
reg signed [19:0] _d_deltau_y;
reg signed [19:0] _q_deltau_y;
reg signed [19:0] _d_deltav_x;
reg signed [19:0] _q_deltav_x;
reg signed [19:0] _d_deltav_y;
reg signed [19:0] _q_deltav_y;
reg  [9:0] _d_tbl_addr = 0;
reg  [9:0] _q_tbl_addr = 0;
reg  [7:0] _d_cosine_addr = 0;
reg  [7:0] _q_cosine_addr = 0;
reg  [3:0] _d_index,_q_index = 9;
reg  _autorun = 0;
assign out_pix_r = _t_pix_r;
assign out_pix_g = _t_pix_g;
assign out_pix_b = _t_pix_b;
assign out_done = (_q_index == 9) & _autorun;

M_frame_display__display_mem_tbl __mem__tbl(
.clock(clock),
.in_tbl_addr(_d_tbl_addr),
.out_tbl_rdata(_w_mem_tbl_rdata)
);
M_frame_display__display_mem_cosine __mem__cosine(
.clock(clock),
.in_cosine_addr(_d_cosine_addr),
.out_cosine_rdata(_w_mem_cosine_rdata)
);


`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (out_done));
`endif
always @* begin
_d_frame = _q_frame;
_d_angle = _q_angle;
_d_u = _q_u;
_d_v = _q_v;
_d_cos = _q_cos;
_d_corneru = _q_corneru;
_d_cornerv = _q_cornerv;
_d_deltau_x = _q_deltau_x;
_d_deltau_y = _q_deltau_y;
_d_deltav_x = _q_deltav_x;
_d_deltav_y = _q_deltav_y;
_d_tbl_addr = _q_tbl_addr;
_d_cosine_addr = _q_cosine_addr;
_d_index = _q_index;
_t_sin = 0;
// _always_pre
_t_pix_r = 0;
_t_pix_g = 0;
_t_pix_b = 0;
(* full_case *)
case (_q_index)
0: begin
// _top
_d_index = 1;
end
1: begin
// __while__block_1
if (1) begin
// __block_2
// __block_4
_d_index = 3;
end else begin
_d_index = 2;
end
end
3: begin
// __while__block_5
if (in_pix_vblank==0) begin
// __block_6
// __block_8
if (in_pix_active) begin
// __block_9
// __block_11
_t_pix_b = _w_mem_tbl_rdata[0+:6];
_t_pix_g = _w_mem_tbl_rdata[6+:6];
_t_pix_r = _w_mem_tbl_rdata[12+:6];
if (in_pix_x==0) begin
// __block_12
// __block_14
_d_u = _q_corneru;
_d_v = _q_cornerv;
// __block_15
end else begin
// __block_13
// __block_16
if (in_pix_x==639) begin
// __block_17
// __block_19
_d_corneru = _q_corneru+_q_deltau_y;
_d_cornerv = _q_cornerv+_q_deltav_y;
// __block_20
end else begin
// __block_18
// __block_21
_d_u = _q_u+_q_deltau_x;
_d_v = _q_v+_q_deltav_x;
// __block_22
end
// __block_23
// __block_24
end
// __block_25
_d_tbl_addr = ((_d_u>>11)&31)+(((_d_v>>11)&31)<<5);
// __block_26
end else begin
// __block_10
end
// __block_27
// __block_28
_d_index = 3;
end else begin
_d_index = 4;
end
end
2: begin
// __block_3
_d_index = 9;
end
4: begin
// __block_7
_d_cosine_addr = _q_frame;
_d_frame = _q_frame+1;
_d_index = 5;
end
5: begin
// __block_29
_d_angle = ((512+_w_mem_cosine_rdata)>>2);
_d_cosine_addr = _d_angle;
_d_index = 6;
end
6: begin
// __block_30
_d_cos = _w_mem_cosine_rdata;
_d_cosine_addr = _q_angle+64;
_d_index = 7;
end
7: begin
// __block_31
_t_sin = _w_mem_cosine_rdata;
_d_corneru = -((_c_cornerx*_q_cos)-(_c_cornery*_t_sin));
_d_cornerv = -((_c_cornerx*_t_sin)+(_c_cornery*_q_cos));
_d_deltau_x = _q_cos;
_d_deltau_y = -_t_sin;
_d_deltav_x = _t_sin;
_d_deltav_y = _q_cos;
_d_u = _d_corneru;
_d_v = _d_cornerv;
_d_index = 8;
end
8: begin
// __while__block_32
if (in_pix_vblank==1) begin
// __block_33
// __block_35
// __block_36
_d_index = 8;
end else begin
_d_index = 1;
end
end
9: begin // end of 
end
default: begin 
_d_index = {4{1'bx}};
`ifdef FORMAL
assume(0);
`endif
 end
endcase
// _always_post
end

always @(posedge clock) begin
_q_frame <= (reset) ? 0 : _d_frame;
_q_angle <= (reset) ? 0 : _d_angle;
_q_u <= (reset) ? 0 : _d_u;
_q_v <= (reset) ? 0 : _d_v;
_q_cos <= (reset) ? 0 : _d_cos;
_q_corneru <= (reset) ? 0 : _d_corneru;
_q_cornerv <= (reset) ? 0 : _d_cornerv;
_q_deltau_x <= (reset) ? 0 : _d_deltau_x;
_q_deltau_y <= (reset) ? 0 : _d_deltau_y;
_q_deltav_x <= (reset) ? 0 : _d_deltav_x;
_q_deltav_y <= (reset) ? 0 : _d_deltav_y;
_q_tbl_addr <= _d_tbl_addr;
_q_cosine_addr <= _d_cosine_addr;
_q_index <= reset ? 9 : ( ~_autorun ? 0 : _d_index);
_autorun <= reset ? 0 : 1;
end

endmodule

module M_main (
out_leds,
out_video_r,
out_video_g,
out_video_b,
out_video_hs,
out_video_vs,
out_video_clock,
in_run,
out_done,
reset,
out_clock,
clock
);
output  [7:0] out_leds;
output  [5:0] out_video_r;
output  [5:0] out_video_g;
output  [5:0] out_video_b;
output  [0:0] out_video_hs;
output  [0:0] out_video_vs;
output  [0:0] out_video_clock;
input in_run;
output out_done;
input reset;
output out_clock;
input clock;
assign out_clock = clock;
wire  [0:0] _w_vga_driver_vga_hs;
wire  [0:0] _w_vga_driver_vga_vs;
wire  [0:0] _w_vga_driver_active;
wire  [0:0] _w_vga_driver_vblank;
wire  [9:0] _w_vga_driver_vga_x;
wire  [9:0] _w_vga_driver_vga_y;
wire  [5:0] _w_display_pix_r;
wire  [5:0] _w_display_pix_g;
wire  [5:0] _w_display_pix_b;
wire _w_display_done;

reg  [7:0] _d_frame;
reg  [7:0] _q_frame;
reg  [7:0] _d_leds;
reg  [7:0] _q_leds;
reg  [0:0] _d_video_clock;
reg  [0:0] _q_video_clock;
reg  [2:0] _d_index,_q_index = 7;
reg  _autorun = 0;
assign out_leds = _q_leds;
assign out_video_r = _w_display_pix_r;
assign out_video_g = _w_display_pix_g;
assign out_video_b = _w_display_pix_b;
assign out_video_hs = _w_vga_driver_vga_hs;
assign out_video_vs = _w_vga_driver_vga_vs;
assign out_video_clock = _q_video_clock;
assign out_done = (_q_index == 7) & _autorun;
M_vga__vga_driver vga_driver (
.out_vga_hs(_w_vga_driver_vga_hs),
.out_vga_vs(_w_vga_driver_vga_vs),
.out_active(_w_vga_driver_active),
.out_vblank(_w_vga_driver_vblank),
.out_vga_x(_w_vga_driver_vga_x),
.out_vga_y(_w_vga_driver_vga_y),
.reset(reset),
.clock(clock));
M_frame_display__display display (
.in_pix_x(_w_vga_driver_vga_x),
.in_pix_y(_w_vga_driver_vga_y),
.in_pix_active(_w_vga_driver_active),
.in_pix_vblank(_w_vga_driver_vblank),
.out_pix_r(_w_display_pix_r),
.out_pix_g(_w_display_pix_g),
.out_pix_b(_w_display_pix_b),
.out_done(_w_display_done),
.reset(reset),
.clock(clock));



`ifdef FORMAL
initial begin
assume(reset);
end
assume property($initstate || (out_done));
`endif
always @* begin
_d_frame = _q_frame;
_d_leds = _q_leds;
_d_video_clock = _q_video_clock;
_d_index = _q_index;
// _always_pre
(* full_case *)
case (_q_index)
0: begin
// _top
_d_index = 1;
end
1: begin
// __while__block_1
if (1) begin
// __block_2
// __block_4
_d_index = 3;
end else begin
_d_index = 2;
end
end
3: begin
// __while__block_5
if (_w_vga_driver_vblank==1) begin
// __block_6
// __block_8
// __block_9
_d_index = 3;
end else begin
_d_index = 4;
end
end
2: begin
// __block_3
_d_index = 7;
end
4: begin
// __block_7
$display("vblank off");
_d_index = 5;
end
5: begin
// __while__block_10
if (_w_vga_driver_vblank==0) begin
// __block_11
// __block_13
// __block_14
_d_index = 5;
end else begin
_d_index = 6;
end
end
6: begin
// __block_12
$display("vblank on");
_d_frame = _q_frame+1;
// __block_15
_d_index = 1;
end
7: begin // end of 
end
default: begin 
_d_index = {3{1'bx}};
`ifdef FORMAL
assume(0);
`endif
 end
endcase
// _always_post
end

always @(posedge clock) begin
_q_frame <= (reset) ? 0 : _d_frame;
_q_leds <= _d_leds;
_q_video_clock <= _d_video_clock;
_q_index <= reset ? 7 : ( ~_autorun ? 0 : _d_index);
_autorun <= reset ? 0 : 1;
end

endmodule

