// This program was cloned from: https://github.com/jgrip/c128-verilog
// License: Creative Commons Attribution 4.0 International

module pla_8721(
    input rom_256,
    input va14,
    input charen,
    input hiram,
    input loram,
    input ba,
    input vma5,
    input vma4,
    input ms0,
    input ms1,
    input ms2,
    input ms3,
    input z80io,
    input z80en,
    input exrom,
    input game,
    input rw,
    input aec,
    input dmaack,
    input vicfix,
    input a10,
    input a11,
    input a12,
    input a13,
    input a14,
    input a15,
    input clk,

    output sden,
    output roml,
    output romh,
    output clrbnk,
    output from,
    output rom4,
    output rom3,
    output rom2,
    output rom1,
    output iocs,
    output dir,
    output reg dwe,
    output reg casenb,
    output vic,
    output ioacc,
    output gwe,
    output colram,
    output charom);

wire p0;
wire p1;
wire p2;
wire p3;
wire p4;
wire p5;
wire p6;
wire p7;
wire p8;
wire p9;
wire p10;
wire p11;
wire p12;
wire p13;
wire p14;
wire p15;
wire p16;
wire p17;
wire p18;
wire p19;
wire p20;
wire p21;
wire p22;
wire p23;
wire p24;
wire p25;
wire p26;
wire p27;
wire p28;
wire p29;
wire p30;
wire p31;
wire p32;
wire p33;
wire p34;
wire p35;
wire p36;
wire p37;
// p38 removed
wire p39;
wire p40;
wire p41;
wire p42;
wire p43;
wire p44;
wire p45;
wire p46;
wire p47;
wire p48;
wire p49;
wire p50;
wire p51;
wire p52;
wire p53;
wire p54;
wire p55;
wire p56;
wire p57;
wire p58;
wire p59;
wire p60;
wire p61;
wire p62;
wire p63;
wire p64;
wire p65;
wire p66;
wire p67;
wire p68;
wire p69;
wire p70;
wire p71;
wire p72;
// p73 removed
wire p74;
wire p75;
wire p76;
wire p77;
wire p78;
wire p79;
wire p80;
wire p81;
wire p82;
wire p83;
wire p84;
wire p85;
wire p86;
wire p87;
wire p88;
wire p89;

wire casenb_int;
wire casenb_latch;

/* Product terms */

assign p0 = charen && hiram && ba && !ms3 && game &&  rw && aec && a12 && !a13 && a14 && a15;
assign p1 = charen && hiram &&      !ms3 && game && !rw && aec && a12 && !a13 && a14 && a15;
assign p2 = charen && loram && ba && !ms3 && game &&  rw && aec && a12 && !a13 && a14 && a15;
assign p3 = charen && loram &&      !ms3 && game && !rw && aec && a12 && !a13 && a14 && a15;

assign p4 = charen && hiram && ba && !ms3 && !exrom && !game &&  rw && aec && a12 && !a13 && a14 && a15;
assign p5 = charen && hiram &&      !ms3 && !exrom && !game && !rw && aec && a12 && !a13 && a14 && a15;
assign p6 = charen && loram && ba && !ms3 && !exrom && !game &&  rw && aec && a12 && !a13 && a14 && a15;
assign p7 = charen && loram &&      !ms3 && !exrom && !game && !rw && aec && a12 && !a13 && a14 && a15;

assign p8 = ba && !ms3 && exrom && !game &&  rw && aec && a12 && !a13 && a14 && a15;
assign p9 =      !ms3 && exrom && !game && !rw && aec && a12 && !a13 && a14 && a15;

assign p10 = ba && !ms2 && ms3 && z80en &&  rw && aec && a12 && !a13 && a14 && a15;
assign p11 =      !ms2 && ms3 && z80en && !rw && aec && a12 && !a13 && a14 && a15;

assign p12 = charen && hiram && ba && !ms3 && game &&  rw && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;
assign p13 = charen && hiram &&      !ms3 && game && !rw && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;
assign p14 = charen && loram && ba && !ms3 && game &&  rw && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;
assign p15 = charen && loram &&      !ms3 && game && !rw && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;

assign p16 = charen && hiram && ba && !ms3 && !exrom && !game &&  rw && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;
assign p17 = charen && hiram &&      !ms3 && !exrom && !game && !rw && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;
assign p18 = charen && loram && ba && !ms3 && !exrom && !game &&  rw && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;
assign p19 = charen && loram &&      !ms3 && !exrom && !game && !rw && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;

assign p20 = ba && !ms3 && exrom && !game &&  rw && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;
assign p21 =      !ms3 && exrom && !game && !rw && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;

assign p22 = ba && !ms2 && ms3 && z80en &&  rw && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;
assign p23 =      !ms2 && ms3 && z80en && !rw && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;

assign p24 = charen && hiram && ba && !ms3 && game &&  rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;
assign p25 = charen && hiram &&      !ms3 && game && !rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;
assign p26 = charen && loram && ba && !ms3 && game &&  rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;
assign p27 = charen && loram &&      !ms3 && game && !rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;

assign p28 = charen && hiram && ba && !ms3 && !exrom && !game &&  rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;
assign p29 = charen && hiram &&      !ms3 && !exrom && !game && !rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;
assign p30 = charen && loram && ba && !ms3 && !exrom && !game &&  rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;
assign p31 = charen && loram &&      !ms3 && !exrom && !game && !rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;

assign p32 = ba && !ms3 && exrom && !game &&  rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;
assign p33 =      !ms3 && exrom && !game && !rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;

assign p34 = ba && !ms2 && ms3 && z80en &&  rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;
assign p35 =      !ms2 && ms3 && z80en && !rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;

assign p36 = !aec;
assign p37 = !rw && aec && !a10 && a11 && a12 && !a13 && a14 && a15;

assign p39 = !charen && hiram && !ms3 &&           game && rw && aec && a12 && !a13 && a14 && a15;
assign p40 = !charen && loram && !ms3 &&           game && rw && aec && a12 && !a13 && a14 && a15;
assign p41 = !charen && hiram && !ms3 && !exrom && !game && rw && aec && a12 && !a13 && a14 && a15;

assign p42 = va14 && !vma5 && vma4 && !ms3          &&  game && !aec;
assign p43 = va14 && !vma5 && vma4 && !ms3 && !exrom && !game && !aec;

assign p44 = !ms0 && !ms1 && ms2 && ms3 && z80en && rw && aec && a12 && !a13 && a14 && a15;
assign p45 = hiram && loram && !ms3 && !exrom && rw && aec && !a13 && !a14 && a15;

assign p46 = !ms3 && exrom && !game && aec && !a13 && !a14 && a15;
assign p47 = ms0 && !ms1 && ms3 && rw && aec && !a14 && a15;
assign p48 = !ms0 && ms1 && ms3 && rw && aec && !a14 && a15;

assign p49 = hiram && !ms3 && !exrom && !game && rw && aec && a13 && !a14 && a15;
assign p50 = !ms3 && exrom && !game && aec && a13 && a14 && a15;

assign p51 = vma5 && vma4 && !ms3 && exrom && !game && !aec;
assign p52 =  ms0 && !ms1 && ms3 && rw && aec && !a12 && !a13 && a14 && a15;
assign p53 = !ms0 &&  ms1 && ms3 && rw && aec && !a12 && !a13 && a14 && a15;
assign p54 = !ms0 && !ms1 && ms3 && rw && aec && !a12 && !a13 && a14 && a15;

assign p55 = !ms0 && !ms1 && z80io && !z80en && rw && aec && !a12 && !a13 && !a14 && !a15;
assign p56 = !ms0 && !ms1 && ms3 && rw && aec && !a14 &&  a15;
assign p57 = !ms0 && !ms1 && ms3 && rw && aec &&  a14 && !a15;

assign p58 = hiram         && !ms3          &&  game && rw && aec && a13 &&  a14 && a15;
assign p59 = hiram         && !ms3 && !exrom && !game && rw && aec && a13 &&  a14 && a15;
assign p60 = hiram && loram && !ms3          &&  game && rw && aec && a13 && !a14 && a15;

assign p61 = !z80io && !z80en && aec && !a10 && !a11 && a12 && !a13 && a14 && a15;
assign p62 = !z80io && !z80en && aec               && a12 && !a13 && a14 && a15;
assign p63 = !z80io && !z80en && aec && !a10 &&  a11 && a12 && !a13 && a14 && a15;

assign p64 = !rw && aec;
assign p65 =  rw && aec;
assign p66 = !aec;

assign p67 = !ms2 && !z80en       && aec && !a10 && !a11 && a12 && !a13 && !a14 && !a15;
assign p68 = !ms2 && !z80en && !rw && aec && !a10 && !a11 && a12 && !a13 && !a14 && !a15;

assign p69 = !charen && !vma5 && vma4 && ms3 && !aec && dmaack;

assign p70 = !rom_256 && !ms0 && !ms1 && ms3 && rw && aec               && a14 && !a15;
assign p71 = !rom_256 && !ms0 && !ms1 && ms3 && rw && aec && !a12 && !a13 && a14 &&  a15;
assign p72 = !rom_256 && !ms0 && !ms1 && z80io && !z80en && rw && aec && !a12 && !a13 && !a14 && !a15;

//assign p73 = clk;
assign p74 = rw && !aec && vicfix;

assign p75 =            !ms0 && !ms1       && ms3 && rw && aec       &&  a13 && a14 && a15;
assign p76 = !rom_256 && !ms0 && !ms1       && ms3 && rw && aec       &&  a13 && a14 && a15;
assign p77 =            !ms0 &&  ms1       && ms3 && rw && aec       &&  a13 && a14 && a15;
assign p78 =            !ms0 &&  ms1 && ms2 && ms3 && rw && aec && a12 && !a13 && a14 && a15;
assign p79 =             ms0 && !ms1       && ms3 && rw && aec       &&  a13 && a14 && a15;
assign p80 =             ms0 && !ms1 && ms2 && ms3 && rw && aec && a12 && !a13 && a14 && a15;

assign p81 = !ms3 && exrom && !game && aec &&  a12        && !a14 && !a15;
assign p82 = !ms3 && exrom && !game && aec        &&  a13 && !a14;
assign p83 = !ms3 && exrom && !game && aec               &&  a14 && !a15;
assign p84 = !ms3 && exrom && !game && aec && !a12 && !a13 &&  a14 &&  a15;

assign p85 = !loram && ms3 &&  aec;
assign p86 = !hiram && ms3 && !aec;

/* outputs */

assign sden = p42 || p43 || p66 || p69;
assign roml = p45 || p46 || p47;
assign romh = p49 || p50 || p51 || p52 || p79 || p80;
assign clrbnk = p85 || p86;
assign from = p48 || p53 || p77 || p78;
assign rom4 = p54 || p55 || p75;
assign rom3 = p56 || p70;
assign rom2 = p57;
assign rom1 = p58 || p59 || p60 || p71 || p72 || p76;
assign iocs = p0 || p1 || p2 || p3 || p4 || p5 || p6 || p7 || p8 || p9 || p10 || p11 || p62;
assign dir = p12 || p14 || p16 || p18 || p20 || p22 || p24 || p26 || p28 || p30 || p32 || p34 || p39 || p40 || p41 || p44 || p65;
assign vic = p12 || p13 || p14 || p15 || p16 || p17 || p18 || p19 || p20 || p21 || p22 || p23 || p61;
assign ioacc = p0 || p1 || p2 || p3 || p4 || p5 || p6 || p7 || p8 || p9 || p10 || p11 || 
               p12 || p13 || p14 || p15 || p16 || p17 || p18 || p19 || p20 || p21 || p22 || p23 || p61 || p62;
assign gwe = p37 || p68;
assign colram = p24 || p25 || p26 || p27 || p28 || p29 || p30 || p31 || p32 || p33 || p34 || p35 || p36 || p63 || p67;
assign charom = p39 || p40 || p41 || p42 || p43 || p44 || p69;

assign casenb_latch = clk || p74;

assign casenb_int = p0 || p1 || p2 || p3 || p4 || p5 || p6 || p7 || p8 || p9
                || p10 || p11 || p12 || p13 || p14 || p15 || p16 || p17 || p18 || p19
                || p20 || p21 || p22 || p23 || p39 || p40 || p41 || p42 || p43 || p44
                || p45 || p46 || p47 || p48 || p49 || p50 || p51 || p52 || p53 || p54
                || p55 || p56 || p57 || p58 || p59 || p60 || p61 || p62 || p63 || p67
                || p69 || p70 || p71 || p72 || p75 || p76 || p77 || p78 || p79 || p80
                || p81 || p82 || p83 || p84;

/* Latched outputs */

always @ (clk or p64)
  if (clk)
    dwe <= p64;

always @ (casenb_latch or casenb_int)
  if (casenb_latch)
    casenb <= casenb_int;

endmodule