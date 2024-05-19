// This program was cloned from: https://github.com/revaldinho/cpc_ram_expansion
// License: GNU General Public License v3.0

// 
// cpc_ram1m netlist
// 
// netlister.py format
// 
// (c) Revaldinho, 2018
// 
// This code is part of the cpc_ram_expansion set of Amstrad CPC peripherals.
// https://github.com/revaldinho/cpc_ram_expansion
// 
// Copyright (C) 2018 Revaldinho
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//

module cpc_ram1m_plcc84 ();

  // wire declarations
  supply0 VSS;
  supply1 VDD;

  wire Sound;  
  wire A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0 ;
  wire D7,D6,D5,D4,D3,D2,D1,D0 ;
  wire MREQ_B;  
  wire M1_B;
  wire RFSH_B;
  wire IOREQ_B;
  wire RD_B;
  wire WR_B;
  wire HALT_B;
  wire INT_B ;
  wire NMI_B ;
  wire BUSREQ_B;  
  wire BUSACK_B;
  wire READY;
  wire BUSRESET_B;
  wire RESET_B;
  wire ROMEN_B;
  wire ROMDIS ;
  wire RAMRD_B;
  wire RAMDIS;
  wire CURSOR;
  wire LPEN;
  wire EXP_B;
  wire CLK;
  wire RAMCS0_B;
  wire RAMCS1_B;  
  wire TP0,TP1,TP2,TP3,TP4;  
  wire HIADR4,HIADR3,HIADR2,HIADR1,HIADR0;
  wire RAMOE_B;
  wire RAMWE_B;

  wire tms;
  wire tdi;
  wire tdo;
  wire tck;

  wire dip0, dip1, dip2, dip3;
  wire gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7;

  // Radial electolytic, one per board on the main 5V supply
  cap22uf         C22UF(.minus(VSS),.plus(VDD));

  // DIP8 switches for CPLD config
  DIP4        dipsw0(
                     .sw0_a(dip0), .sw0_b(VDD),
                     .sw1_a(dip1), .sw1_b(VDD),
                     .sw2_a(dip2), .sw2_b(VDD),
                     .sw3_a(dip3), .sw3_b(VDD),                     
                     );

  // High value pull down (>2K) to be overridden by pull up when switch closed
  r3k3_sil5   sil0 (
                    .common(VSS),
                    .p0(dip3),
                    .p1(dip2),
                    .p2(dip1),
                    .p3(dip0),
                    );

  idc_hdr_10w    gpio(
                      .p1(VSS),   .p2(gpio0),
                      .p3(gpio1), .p4(gpio2),
                      .p5(gpio3), .p6(gpio4),
                      .p7(gpio5), .p8(gpio6),
                      .p9(gpio7), .p10(VDD),
                      );
  
  hdr1x06        TESTPT (
                         .p1(TP0),
                         .p2(TP1),
                         .p3(TP2),
                         .p4(TP3),
                         .p5(TP4),
                         .p6(VSS)
                         );
  
  
  // Amstrad CPC Edge Connector
  //
  // V1.01 Corrected upper and lower rows
  idc_hdr_50w  CONN1 (
                      .p50(Sound),   .p49(VSS),
                      .p48(A15),     .p47(A14),
                      .p46(A13),     .p45(A12),
                      .p44(A11),     .p43(A10),
                      .p42(A9),      .p41(A8)
                      .p40(A7),      .p39(A6),
                      .p38(A5),      .p37(A4),
                      .p36(A3),      .p35(A2),
                      .p34(A1),      .p33(A0),
                      .p32(D7),      .p31(D6)
                      .p30(D5),      .p29(D4),
                      .p28(D3),      .p27(D2),
                      .p26(D1),      .p25(D0),
                      .p24(VDD),     .p23(MREQ_B),
                      .p22(M1_B),    .p21(RFSH_B),
                      .p20(IOREQ_B), .p19(RD_B),
                      .p18(WR_B),    .p17(HALT_B),
                      .p16(INT_B),   .p15(NMI_B),
                      .p14(BUSREQ_B), .p13(BUSACK_B),
                      .p12(READY),   .p11(BUSRESET_B),
                      .p10(RESET_B), .p9 (ROMEN_B),
                      .p8 (ROMDIS),  .p7 (RAMRD_B),
                      .p6 (RAMDIS),  .p5 (CURSOR),
                      .p4 (LPEN),    .p3 (EXP_B),
                      .p2 (VSS),     .p1 (CLK),
                      ) ;

  // Standard layout JTAG port for programming the CPLD
  hdr8way JTAG (
                .p1(VSS),  .p2(VSS),
                .p3(tms),  .p4(tdi),
                .p5(tdo),  .p6(tck),
                .p7(VDD),  .p8(),
                );
   // L1B CPLD in PLCC84 pin socket (can be 9572 or 95108)
  xc95108_pc84  CPLD (

                      // RHS
		      .p1(TP2),
		      .p2(TP3),
		      .p3(TP0),
		      .p4(TP1),
		      .p5(dip0),
		      .p6(dip1),
		      .p7(dip2),
		      .gnd1(VSS),
		      .gck1(CLK),
		      .gck2(dip3),
		      .p11(gpio0),

                      // TOP
		      .gck3(gpio1),
		      .p13(gpio2),
		      .p14(gpio3),
		      .p15(gpio4),
		      .gnd2(VSS),
		      .p17(gpio5),
		      .p18(gpio6),
		      .p19(gpio7),
		      .p20(HIADR4),
		      .p21(HIADR2),
		      .vccio1(VDD),
		      .p23(HIADR0),
		      .p24(HIADR3),
		      .p25(HIADR1),
		      .p26(A12),
		      .gnd3(VSS),
		      .tdi(tdi),
		      .tms(tms),
		      .tck(tck),
		      .p31(RAMWE_B),
		      .p32(A13),

                      // LHS
		      .p33(A7),
		      .p34(A8),
		      .p35(A6),
		      .p36(A9),
		      .p37(A5),
		      .vccint1(VDD),
		      .p39(A11),
		      .p40(A4),
		      .p41(A3),
		      .gnd4(VSS),
		      .p43(RAMOE_B),
		      .p44(A2),
		      .p45(A10),
		      .p46(RAMCS0_B),
		      .p47(RAMCS1_B),
		      .p48(A1),
		      .gnd5(VSS),
		      .p50(A0),
		      .p51(D7),
		      .p52(D6),
		      .p53(D5),

                      // Bottom
		      .p54(A15),
		      .p55(A15),
		      .p56(A14),
		      .p57(D4),
		      .p58(D3),
		      .tdo(tdo),
		      .gnd6(VSS),
		      .p61(D2),
		      .p62(D1),
		      .p63(D0),
		      .vccio2(VDD),
		      .p65(ROMEN_B),
		      .p66(ROMDIS),
		      .p67(RAMRD_B),
		      .p68(IOREQ_B),
		      .p69(RD_B),
		      .p70(WR_B),
		      .p71(INT_B),
		      .p72(NMI_B),
		      .vccint2(VDD),
		      .gsr(BUSRESET_B),

                      // RHS
		      .p75(BUSACK_B),
		      .gts1(BUSREQ_B),
		      .gts2(READY),
		      .vccint3(VDD),
		      .p79(RESET_B),
		      .p80(RAMDIS),
		      .p81(MREQ_B),
		      .p82(M1_B),
		      .p83(TP4),
		      .p84(RFSH_B)
                      );



  // Alliance 512K x 8 SRAM - address pins wired to suit layout
  bs62lv4006  SRAM0 (
                    .a18(HIADR4),  .vcc(VDD),
                    .a16(HIADR2),  .a15(HIADR1),
                    .a14(HIADR0),  .a17(HIADR3),
                    .a12(A12),  .web(RAMWE_B),
                    .a7(A7),  .a13(A13),
                    .a6(A6),  .a8(A8),
                    .a5(A5),  .a9(A9),
                    .a4(A4),  .a11(A11),
                    .a3(A3),  .oeb(RAMOE_B),
                    .a2(A2),  .a10(A10),
                    .a1(A1),  .csb(RAMCS0_B),
                    .a0(A0),  .d7(D7),
                    .d0(D0),  .d6(D6),
                    .d1(D1),  .d5(D5),
                    .d2(D2),  .d4(D4),
                    .vss(VSS),  .d3(D3)
                    );
  bs62lv4006  SRAM1 (
                    .a18(HIADR4),  .vcc(VDD),
                    .a16(HIADR2),  .a15(HIADR1),
                    .a14(HIADR0),  .a17(HIADR3),
                    .a12(A12),  .web(RAMWE_B),
                    .a7(A7),  .a13(A13),
                    .a6(A6),  .a8(A8),
                    .a5(A5),  .a9(A9),
                    .a4(A4),  .a11(A11),
                    .a3(A3),  .oeb(RAMOE_B),
                    .a2(A2),  .a10(A10),
                    .a1(A1),  .csb(RAMCS1_B),
                    .a0(A0),  .d7(D7),
                    .d0(D0),  .d6(D6),
                    .d1(D1),  .d5(D5),
                    .d2(D2),  .d4(D4),
                    .vss(VSS),  .d3(D3)
                    );

   // Decoupling caps for CPLD and one per SRAM
   cap100nf C100N_1 (.p0( VSS ), .p1( VDD ));
   cap100nf C100N_2 (.p0( VSS ), .p1( VDD ));
   cap100nf C100N_3 (.p0( VSS ), .p1( VDD ));
   cap100nf C100N_4 (.p0( VSS ), .p1( VDD ));
   cap100nf C100N_5 (.p0( VSS ), .p1( VDD ));    

endmodule
