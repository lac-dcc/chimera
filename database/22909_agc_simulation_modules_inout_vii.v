// This program was cloned from: https://github.com/virtualagc/agc_simulation
// License: MIT License

`timescale 1ns/1ps
`default_nettype none

module inout_vii(SIM_RST, SIM_CLK, p4VDC, p4VSW, GND, GOJAM, T06, T08, SB0_n, SB1_n, SB2_n, SB4, F01A, F01B, FS02, F02B, FS03, F03B, FS04, F04B, FS05, FS05_n, F05A_n, F05B_n, FS06, FS07A, FS07_n, F07A, F07B_n, FS08, FS09, FS09_n, FS16, FS17, CCHG_n, RCHG_n, WCHG_n, WL01, WL02, WL03, WL04, WL05, WL06, WL07, WL08, WL09, WL10, WL11, WL12, WL13, WL14, WL16, CHAT01, CHAT02, CHAT03, CHAT04, CHAT05, CHAT06, CHAT07, CHAT08, CHAT09, CHAT10, CHAT11, CHAT12, CHAT13, CHAT14, CHBT01, CHBT02, CHBT03, CHBT04, CHBT05, CHBT06, CHBT07, CHBT08, CHBT09, CHBT10, CHBT11, CHBT12, CHBT13, CHBT14, CH1108, CH1109, CH1110, CH1111, CH1112, CH1113, CH1114, CH1116, CH1208, CH1209, CH1210, CH1211, CH1212, CH1216, CH1505, CH1601, CH1602, CH1603, CH1604, CH1605, CH1606, CH1607, CH3209, CH3210, CH3311, CH3313, CH3314, CH3316, CHOR01_n, CHOR02_n, CHOR03_n, CHOR04_n, CHOR05_n, CHOR06_n, CHOR07_n, CHOR08_n, CHOR09_n, CHOR10_n, CHOR11_n, CHOR12_n, CHOR13_n, CHOR14_n, CHOR16_n, XT0_n, XT1_n, XT3_n, XB3_n, XB4_n, XB5_n, RCHAT_n, RCHBT_n, CHWL01_n, CHWL02_n, CHWL03_n, CHWL04_n, CHWL05_n, CHWL06_n, CHWL07_n, CHWL08_n, CHWL09_n, CHWL10_n, CHWL11_n, CHWL12_n, CHWL13_n, CHWL14_n, CHWL16_n, CH01, CH02, CH03, CH04, CH05, CH06, CH07, CH08, CH09, CH10, CH11, CH12, CH13, CH14, CH16, FLASH, FLASH_n, CDUSTB_n, GTSET, GTSET_n, GTRST_n, GTONE, PIPPLS_n, CCH13, CCH14, CCH34, CCH35, RCH13_n, RCH14_n, WCH13_n, WCH14_n, WCH34_n, WCH35_n, PIPASW, PIPDAT, MON800);
    input wire SIM_RST;
    input wire SIM_CLK;
    input wire p4VDC;
    input wire p4VSW;
    input wire GND;
    output wire CCH13;
    output wire CCH14;
    output wire CCH34;
    output wire CCH35;
    input wire CCHG_n;
    output wire CDUSTB_n;
    output wire CH01;
    output wire CH02;
    output wire CH03;
    output wire CH04;
    output wire CH05;
    output wire CH06;
    output wire CH07;
    output wire CH08;
    output wire CH09;
    output wire CH10;
    output wire CH11;
    input wire CH1108;
    input wire CH1109;
    input wire CH1110;
    input wire CH1111;
    input wire CH1112;
    input wire CH1113;
    input wire CH1114;
    input wire CH1116;
    output wire CH12;
    input wire CH1208;
    input wire CH1209;
    input wire CH1210;
    input wire CH1211;
    input wire CH1212;
    input wire CH1216;
    output wire CH13;
    output wire CH14;
    input wire CH1505;
    output wire CH16;
    input wire CH1601;
    input wire CH1602;
    input wire CH1603;
    input wire CH1604;
    input wire CH1605;
    input wire CH1606;
    input wire CH1607;
    input wire CH3209;
    input wire CH3210;
    input wire CH3311;
    input wire CH3313;
    input wire CH3314;
    input wire CH3316;
    input wire CHAT01;
    input wire CHAT02;
    input wire CHAT03;
    input wire CHAT04;
    input wire CHAT05;
    input wire CHAT06;
    input wire CHAT07;
    input wire CHAT08;
    input wire CHAT09;
    input wire CHAT10;
    input wire CHAT11;
    input wire CHAT12;
    input wire CHAT13;
    input wire CHAT14;
    input wire CHBT01;
    input wire CHBT02;
    input wire CHBT03;
    input wire CHBT04;
    input wire CHBT05;
    input wire CHBT06;
    input wire CHBT07;
    input wire CHBT08;
    input wire CHBT09;
    input wire CHBT10;
    input wire CHBT11;
    input wire CHBT12;
    input wire CHBT13;
    input wire CHBT14;
    inout wire CHOR01_n; //FPGA#wand
    inout wire CHOR02_n; //FPGA#wand
    inout wire CHOR03_n; //FPGA#wand
    inout wire CHOR04_n; //FPGA#wand
    inout wire CHOR05_n; //FPGA#wand
    inout wire CHOR06_n; //FPGA#wand
    inout wire CHOR07_n; //FPGA#wand
    inout wire CHOR08_n; //FPGA#wand
    inout wire CHOR09_n; //FPGA#wand
    inout wire CHOR10_n; //FPGA#wand
    inout wire CHOR11_n; //FPGA#wand
    inout wire CHOR12_n; //FPGA#wand
    inout wire CHOR13_n; //FPGA#wand
    inout wire CHOR14_n; //FPGA#wand
    inout wire CHOR16_n; //FPGA#wand
    output wire CHWL01_n;
    output wire CHWL02_n;
    output wire CHWL03_n;
    output wire CHWL04_n;
    output wire CHWL05_n;
    output wire CHWL06_n;
    output wire CHWL07_n;
    output wire CHWL08_n;
    output wire CHWL09_n;
    output wire CHWL10_n;
    output wire CHWL11_n;
    output wire CHWL12_n;
    output wire CHWL13_n;
    output wire CHWL14_n;
    output wire CHWL16_n;
    input wire F01A;
    input wire F01B;
    input wire F02B;
    input wire F03B;
    input wire F04B;
    input wire F05A_n;
    input wire F05B_n;
    input wire F07A;
    input wire F07B_n;
    output wire FLASH;
    output wire FLASH_n;
    input wire FS02;
    input wire FS03;
    input wire FS04;
    input wire FS05;
    input wire FS05_n;
    input wire FS06;
    input wire FS07A;
    input wire FS07_n;
    input wire FS08;
    input wire FS09;
    input wire FS09_n;
    input wire FS16;
    input wire FS17;
    input wire GOJAM;
    output wire GTONE; //FPGA#wand
    output wire GTRST_n;
    output wire GTSET;
    output wire GTSET_n;
    output wire MON800; //FPGA#wand
    output wire PIPASW;
    output wire PIPDAT;
    output wire PIPPLS_n;
    output wire RCH13_n;
    output wire RCH14_n;
    output wire RCHAT_n;
    output wire RCHBT_n;
    input wire RCHG_n;
    input wire SB0_n;
    input wire SB1_n;
    input wire SB2_n;
    input wire SB4;
    input wire T06;
    input wire T08;
    output wire WCH13_n;
    output wire WCH14_n;
    output wire WCH34_n;
    output wire WCH35_n;
    input wire WCHG_n;
    input wire WL01;
    input wire WL02;
    input wire WL03;
    input wire WL04;
    input wire WL05;
    input wire WL06;
    input wire WL07;
    input wire WL08;
    input wire WL09;
    input wire WL10;
    input wire WL11;
    input wire WL12;
    input wire WL13;
    input wire WL14;
    input wire WL16;
    input wire XB3_n;
    input wire XB4_n;
    input wire XB5_n;
    input wire XT0_n;
    input wire XT1_n;
    input wire XT3_n;
    wire __A24_1__12KPPS;
    wire __A24_1__25KPPS;
    wire __A24_1__3200A;
    wire __A24_1__3200B;
    wire __A24_1__3200C;
    wire __A24_1__3200D;
    wire __A24_1__800RST;
    wire __A24_1__800SET;
    wire __A24_1__CDUCLK;
    wire __A24_1__ELSNCM;
    wire __A24_1__ELSNCN;
    wire __A24_1__F03B_n;
    wire __A24_1__F07A_n;
    wire __A24_1__LRRST;
    wire __A24_1__PIPINT;
    wire __A24_1__RRRST;
    wire __A24_2__FS06_n;
    wire __A24_2__FS08_n;
    wire net_U24003_Pad11;
    wire net_U24003_Pad9;
    wire net_U24011_Pad1;
    wire net_U24011_Pad11;
    wire net_U24011_Pad13;
    wire net_U24011_Pad3;
    wire net_U24011_Pad5;
    wire net_U24011_Pad9;
    wire net_U24015_Pad13;
    wire net_U24016_Pad6;
    wire net_U24016_Pad8;
    wire net_U24017_Pad11;
    wire net_U24017_Pad13;
    wire net_U24017_Pad5;
    wire net_U24019_Pad6;
    wire net_U24019_Pad8;
    wire net_U24020_Pad4;
    wire net_U24021_Pad11;
    wire net_U24021_Pad5;
    wire net_U24021_Pad9;
    wire net_U24023_Pad10;
    wire net_U24025_Pad10;
    wire net_U24025_Pad11;
    wire net_U24025_Pad13;
    wire net_U24025_Pad4;
    wire net_U24025_Pad8;
    wire net_U24026_Pad3;
    wire net_U24026_Pad4;
    wire net_U24026_Pad9;
    wire net_U24028_Pad12;
    wire net_U24028_Pad8;
    wire net_U24030_Pad11;
    wire net_U24030_Pad13;
    wire net_U24030_Pad5;
    wire net_U24030_Pad9;
    wire net_U24031_Pad6;
    wire net_U24031_Pad8;
    wire net_U24033_Pad3;
    wire net_U24033_Pad5;
    wire net_U24033_Pad9;
    wire net_U24036_Pad2;
    wire net_U24105_Pad2;
    wire net_U24105_Pad5;
    wire net_U24106_Pad5;
    wire net_U24107_Pad3;
    wire net_U24108_Pad10;
    wire net_U24108_Pad12;
    wire net_U24108_Pad8;

    pullup R24001(GTONE);
    U74HC04 U24001(WL01, CHWL01_n, WL02, CHWL02_n, WL03, CHWL03_n, GND, CHWL04_n, WL04, CHWL05_n, WL05, CHWL06_n, WL06, p4VSW, SIM_RST, SIM_CLK);
    U74HC04 U24002(WL07, CHWL07_n, WL08, CHWL08_n, WL09, CHWL09_n, GND, CHWL10_n, WL10, CHWL11_n, WL11, CHWL12_n, WL12, p4VSW, SIM_RST, SIM_CLK);
    U74HC04 U24003(WL13, CHWL13_n, WL14, CHWL14_n, WL16, CHWL16_n, GND, RCHAT_n, net_U24003_Pad9, RCHBT_n, net_U24003_Pad11,  ,  , p4VSW, SIM_RST, SIM_CLK);
    U74HC02 U24104(PIPASW, PIPPLS_n, SB1_n, PIPDAT, PIPPLS_n, SB2_n, GND,  ,  ,  ,  ,  ,  , p4VDC, SIM_RST, SIM_CLK);
    U74HC04 U24105(FS04, net_U24105_Pad2, F03B, __A24_1__F03B_n, net_U24105_Pad5, PIPPLS_n, GND,  ,  ,  ,  ,  ,  , p4VDC, SIM_RST, SIM_CLK);
    U74HC27 U24106(__A24_1__F03B_n, net_U24105_Pad2, FS05, SB0_n, net_U24106_Pad5, __A24_1__3200C, GND, __A24_1__3200D, net_U24106_Pad5, SB0_n, FS05_n, net_U24105_Pad5, FS05, p4VDC, SIM_RST, SIM_CLK);
    U74HC02 U24107(__A24_1__PIPINT, PIPPLS_n, net_U24107_Pad3, __A24_1__800SET, __A24_1__F07A_n, SB1_n, GND, F07B_n, SB1_n, __A24_1__800RST, F05A_n, SB0_n, __A24_1__3200A, p4VDC, SIM_RST, SIM_CLK);
    U74HC04 U24108(SB4, net_U24107_Pad3, F07A, __A24_1__F07A_n, F04B, net_U24106_Pad5, GND, net_U24108_Pad8, F02B, net_U24108_Pad10, F01B, net_U24108_Pad12, F01A, p4VDC, SIM_RST, SIM_CLK);
    U74HC02 U24109(__A24_1__3200B, F05B_n, SB0_n, __A24_1__CDUCLK, net_U24108_Pad12, SB0_n, GND, F05B_n, SB1_n, __A24_1__RRRST, F05B_n, SB1_n, __A24_1__LRRST, p4VDC, SIM_RST, SIM_CLK);
    U74HC27 U24110(FS03, net_U24108_Pad8, SB0_n, FS02, net_U24108_Pad10, __A24_1__25KPPS, GND,  ,  ,  ,  , __A24_1__12KPPS, SB0_n, p4VDC, SIM_RST, SIM_CLK);
    U74LVC07 U24011(net_U24011_Pad1, CHOR01_n, net_U24011_Pad3, CHOR02_n, net_U24011_Pad5, CHOR03_n, GND, CHOR04_n, net_U24011_Pad9, CHOR05_n, net_U24011_Pad11, CHOR06_n, net_U24011_Pad13, p4VSW, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC02 U24012(CH01, CHOR01_n, RCHG_n, CH02, CHOR02_n, RCHG_n, GND, CHOR03_n, RCHG_n, CH03, CHOR04_n, RCHG_n, CH04, p4VSW, SIM_RST, SIM_CLK);
    U74HC27 U24013(CHAT02, CHBT02, CHAT03, CHBT03, CH1603, net_U24011_Pad5, GND, net_U24011_Pad9, CHAT04, CHBT04, CH1604, net_U24011_Pad3, CH1602, p4VSW, SIM_RST, SIM_CLK);
    U74HC02 U24014(CH05, CHOR05_n, RCHG_n, CH06, CHOR06_n, RCHG_n, GND, CHOR07_n, RCHG_n, CH07, CHOR08_n, RCHG_n, CH08, p4VSW, SIM_RST, SIM_CLK);
    U74HC4002 U24015(net_U24011_Pad11, CHAT05, CHBT05, CH1605, CH1505,  , GND,  , CHAT08, CHBT08, CH1108, CH1208, net_U24015_Pad13, p4VSW, SIM_RST, SIM_CLK);
    U74HC27 U24016(CHAT06, CHBT06, CHAT07, CHBT07, CH1607, net_U24016_Pad6, GND, net_U24016_Pad8, CH1109, CH1209, CH3209, net_U24011_Pad13, CH1606, p4VSW, SIM_RST, SIM_CLK);
    U74LVC07 U24017(net_U24016_Pad6, CHOR07_n, net_U24015_Pad13, CHOR08_n, net_U24017_Pad5, CHOR09_n, GND, CHOR09_n, net_U24016_Pad8, CHOR10_n, net_U24017_Pad11, CHOR10_n, net_U24017_Pad13, p4VSW, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC02 U24018(CH09, CHOR09_n, RCHG_n, net_U24017_Pad5, CHAT09, CHBT09, GND, CHOR10_n, RCHG_n, CH10, CHAT10, CHBT10, net_U24017_Pad11, p4VSW, SIM_RST, SIM_CLK);
    U74HC27 U24019(CH1110, CH1210, CH1111, CH1211, CH3311, net_U24019_Pad6, GND, net_U24019_Pad8, CH1116, CH1216, CH3316, net_U24017_Pad13, CH3210, p4VSW, SIM_RST, SIM_CLK);
    U74HC02 U24020(CH11, CHOR11_n, RCHG_n, net_U24020_Pad4, CHAT11, CHBT11, GND, CHOR12_n, RCHG_n, CH12, CHOR13_n, RCHG_n, CH13, p4VSW, SIM_RST, SIM_CLK);
    U74LVC07 U24021(net_U24020_Pad4, CHOR11_n, net_U24019_Pad6, CHOR11_n, net_U24021_Pad5, CHOR12_n, GND, CHOR13_n, net_U24021_Pad9, CHOR14_n, net_U24021_Pad11, CHOR16_n, net_U24019_Pad8, p4VSW, SIM_RST, SIM_CLK); //FPGA#OD:2,4,6,8,10,12
    U74HC4002 U24022(net_U24021_Pad5, CHAT12, CHBT12, CH1112, CH1212,  , GND,  , CHAT13, CHBT13, CH1113, CH3313, net_U24021_Pad9, p4VSW, SIM_RST, SIM_CLK);
    U74HC02 #(1'b0, 1'b0, 1'b0, 1'b1) U24023(CH14, CHOR14_n, RCHG_n, CH16, CHOR16_n, RCHG_n, GND, T08, CDUSTB_n, net_U24023_Pad10, net_U24023_Pad10, T06, CDUSTB_n, p4VSW, SIM_RST, SIM_CLK);
    U74HC4002 U24024(net_U24021_Pad11, CHAT14, CHBT14, CH1114, CH3314,  , GND,  ,  ,  ,  ,  ,  , p4VSW, SIM_RST, SIM_CLK);
    U74HC02 U24025(FLASH, FS17, FS16, net_U24025_Pad4, FS08, FS09, GND, net_U24025_Pad8, GOJAM, net_U24025_Pad10, net_U24025_Pad11, GOJAM, net_U24025_Pad13, p4VSW, SIM_RST, SIM_CLK);
    U74HC04 U24026(FLASH, FLASH_n, net_U24026_Pad3, net_U24026_Pad4, GTSET, GTSET_n, GND, GTRST_n, net_U24026_Pad9, __A24_2__FS06_n, FS06, __A24_2__FS08_n, FS08, p4VSW, SIM_RST, SIM_CLK);
    U74HC27 U24027(FS07_n, __A24_2__FS08_n, __A24_2__FS06_n, F05B_n, net_U24026_Pad4, GTSET, GND, net_U24026_Pad9, net_U24026_Pad4, F05B_n, FS06, net_U24026_Pad3, FS09_n, p4VSW, SIM_RST, SIM_CLK);
    U74HC27 U24028(FS06, F05B_n, CCHG_n, XT1_n, XB3_n, net_U24025_Pad8, GND, net_U24028_Pad8, WCHG_n, XT1_n, XB3_n, net_U24028_Pad12, FS07A, p4VSW, SIM_RST, SIM_CLK);
    U74LVC07 U24029(net_U24028_Pad12, GTONE, net_U24025_Pad4, GTONE,  ,  , GND,  ,  ,  ,  ,  ,  , p4VSW, SIM_RST, SIM_CLK); //FPGA#OD:2,4
    U74HC04 U24030(net_U24025_Pad10, CCH13, net_U24025_Pad13, CCH14, net_U24030_Pad5, CCH34, GND, CCH35, net_U24030_Pad9, RCH13_n, net_U24030_Pad11, RCH14_n, net_U24030_Pad13, p4VSW, SIM_RST, SIM_CLK);
    U74HC27 U24031(CCHG_n, XT1_n, CCHG_n, XT3_n, XB4_n, net_U24031_Pad6, GND, net_U24031_Pad8, CCHG_n, XT3_n, XB5_n, net_U24025_Pad11, XB4_n, p4VSW, SIM_RST, SIM_CLK);
    U74HC02 U24032(net_U24030_Pad5, net_U24031_Pad6, GOJAM, net_U24030_Pad9, net_U24031_Pad8, GOJAM, GND, XT1_n, XB3_n, net_U24030_Pad11, XT1_n, XB4_n, net_U24030_Pad13, p4VSW, SIM_RST, SIM_CLK);
    U74HC04 #(1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0) U24033(net_U24028_Pad8, WCH13_n, net_U24033_Pad3, WCH14_n, net_U24033_Pad5, WCH34_n, GND, WCH35_n, net_U24033_Pad9,  ,  ,  ,  , p4VSW, SIM_RST, SIM_CLK);
    U74HC27 U24034(WCHG_n, XT1_n, WCHG_n, XT3_n, XB4_n, net_U24033_Pad5, GND, net_U24033_Pad9, WCHG_n, XT3_n, XB5_n, net_U24033_Pad3, XB4_n, p4VSW, SIM_RST, SIM_CLK);
    U74HC02 U24035(net_U24003_Pad9, XB4_n, XT0_n, net_U24003_Pad11, XT0_n, XB3_n, GND,  ,  ,  ,  ,  ,  , p4VSW, SIM_RST, SIM_CLK);
    U74HC04 U24036(FS07A, net_U24036_Pad2, net_U24036_Pad2, __A24_1__ELSNCN, net_U24036_Pad2, __A24_1__ELSNCM, GND,  ,  ,  ,  ,  ,  , p4VSW, SIM_RST, SIM_CLK);
    U74HC27 U24037(CHAT01, CHBT01,  ,  ,  ,  , GND,  ,  ,  ,  , net_U24011_Pad1, CH1601, p4VSW, SIM_RST, SIM_CLK);
    U74LVC06 U24038(FS07A, MON800,  ,  ,  ,  , GND,  ,  ,  ,  ,  ,  , p4VSW, SIM_RST, SIM_CLK); //FPGA#OD:2
endmodule